<div class="stepContainer">

<?php if (isset($this->documents)): ?>
<div id="uploadQueue" style="background-color: #f0f0f0; color: #800000; border: 1px solid #800000; text-align: center; font-size: 14px; padding: 10px; margin: 0 0 15px 0; font-weight: bold;">
<?php echo __('You have %s document%s in your upload queue.', array(number_format(count($this->documents), 0), (count($this->documents) != 1 ? __('xxx') : ''))) ?>
<br /><br />
<input type="button" value="Delete File<?php echo count($this->documents) != 1 ? 's' : ''; ?>" onclick="deleteUploadFiles();" class="button" />
<input type="button" class="button" value="<?php _e('Import Filex') ?>" onclick="document.location.href='<?php echo osatutil::getIndexName(); ?>?m=import&a=massImport&step=2';" />
</div>
<?php endif; ?>

<?php if ($this->isDemo): ?>
    <img src="modules/asp/website/images/demoImport.jpg" border="0" />
<?php elseif ($this->flashUploaderEnabled): ?>
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
        <tr>
            <td align="left" valign="top" width="50%">
                <img src="images/massImport.jpg" border="0" />

                <p />
                <b><?php _e('Supported File Types') ?></b>:
                <table cellpadding="2" cellspacing="0" border="0" style="padding-left: 80px;">
                    <tr><td><img src="images/fileTypeDoc.jpg" border="0" /> Microsoft Word <?php _e('Documents') ?> (.doc)</td></tr>
                    <tr><td><img src="images/fileTypePdf.jpg" border="0" /> Adobe Portable Document Format (.pdf)</td></tr>
                    <tr><td><img src="images/fileTypeRtf.jpg" border="0" /> Rich Text Format (.rtf)</td></tr>
                    <tr><td><img src="images/fileTypeHtml.jpg" border="0" /> HTML <?php _e('Web Pages') ?> (.html)</td></tr>
                    <tr><td><img src="images/fileTypeTxt.jpg" border="0" /> Plain Text <?php _e('Files') ?> (.txt)</td></tr>
                </table>
                <br />
                <b>Supported File Archives</b>:
                <table cellpadding="2" cellspacing="0" border="0" style="padding-left: 80px; padding-top: 10px;">
                    <tr><td><img src="images/fileTypeZip.jpg" border="0" /> Zip <?php _e('Archives') ?> (.zip)</td></tr>
                    <tr><td><img src="images/fileTypeGz.jpg" border="0" /> GNU Zip <?php _e('Archives') ?> (.gz)</td></tr>
                </table>
            </td>

            <td align="left valign="top" width="50%">
                <object id="FlashFilesUpload" codeBase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0"
            		width="450" height="350" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" VIEWASTEXT>
            		<!-- Replace symbols " with the &quot; at all parameters values and
            		symbols "&" with the "%26" at URL values or &amp; at other values!
            		The same parameters values should be set for EMBED object below. -->
               	    <param name="FlashVars" VALUE="uploadUrl=<?php echo(osatutil::getNonSSLDirectoryURL()); ?>modules/asp/lib/MultiPowUpload/upload.php?session_id=<?php echo(session_id()); ?>&amp;showLink=false&amp;labelUploadText=%20&amp;backgroundColor=#FFFFFF">
                   	<param name="BGColor" VALUE="#FFFFFF">
                   	<param name="Movie" VALUE="<?php echo(osatutil::getNonSSLDirectoryURL()); ?>modules/asp/lib/MultiPowUpload/ElementITMultiPowUpload1.7.swf">
                   	<param name="Src" VALUE="<?php echo(osatutil::getNonSSLDirectoryURL()); ?>modules/asp/lib/MultiPowUpload/ElementITMultiPowUpload1.7.swf">
                   	<param name="WMode" VALUE="Window">
                   	<param name="Play" VALUE="-1">
                   	<param name="Loop" VALUE="-1">
                   	<param name="Quality" VALUE="High">
                   	<param name="SAlign" VALUE="">
                   	<param name="Menu" VALUE="-1">
                   	<param name="Base" VALUE="">
                   	<param name="AllowScriptAccess" VALUE="always">
                   	<param name="Scale" VALUE="ShowAll">
                   	<param name="DeviceFont" VALUE="0">
                   	<param name="EmbedMovie" VALUE="0">
                   	<param name="SWRemote" VALUE="">
                   	<param name="MovieData" VALUE="">
                   	<param name="SeamlessTabbing" VALUE="1">
                   	<param name="Profile" VALUE="0">
                   	<param name="ProfileAddress" VALUE="">
                   	<param name="ProfilePort" VALUE="0">
                	<!-- Embed for Netscape,Mozilla/FireFox browsers support. Flashvars parameters are the same.-->
                    <!-- Replace symbols " with the &quot; at all parameters values and
                    symbols "&" with the "%26" at URL values or &amp; at other values! -->
                	<embed bgcolor="#FFFFFF" id="EmbedFlashFilesUpload" src="<?php echo(osatutil::getNonSSLDirectoryURL()); ?>modules/asp/lib/MultiPowUpload/ElementITMultiPowUpload1.7.swf" quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="450" height="350"
                    flashvars="uploadUrl=<?php echo(osatutil::getNonSSLDirectoryURL()); ?>modules/asp/lib/MultiPowUpload/upload.php?session_id=<?php echo(session_id()); ?>&amp;showLink=false&amp;labelUploadText=%20&amp;backgroundColor=#FFFFFF">
                	</embed>
                </object>
            </td>
        </tr>
    </table>

    <div style="text-align: right;">
    <input type="button" class="button" value="<?php _e('Continue') ?> ->" onclick="document.location.href='<?php echo osatutil::getIndexName(); ?>?m=import&a=massImport&step=2';" />
    </div>


<?php elseif ($this->multipleFilesEnabled): ?>
    <span style="font-size: 16px;">
    <?php if ($this->uploadPath !== false): ?>
        <?php _e('To import multiple files, move or copy your resume documents to the following directory on the computer that hosts OSATS') ?>:
        <br /><br />

        <b><?php echo $this->uploadPath; ?></b>

        <br /><br />
        <?php echo __('Once you have resumes in this folder, %s%s%sreload%s this page to start the import process.', array('<a href="', osatutil::getIndexName(), '?m=import&a=importSelectType&typeOfImport=resume">', '</a>')) ?>

        <br /><br />

        
        <?php _e('If you need assistance in uploading files to your web server, contact your system administrator.') ?><br />
        
    <?php else: ?>
        In order to import resume documents into OSATS, you need to create a directory named "<b>upload</b>" on the computer
        that hosts cats. This directory needs to have its permissions set to allow files to be created by your
        web server.
        <br /><br />
        <b>Linux Instructions:</b>
        <br />
        <blockquote>
        <span style="color: #c0c0c0;">&gt;</span> mkdir /PATH/TO/OSATS/upload<br />
        <span style="color: #c0c0c0;">&gt;</span> chmod -R 777 /PATH/TO/OSAT/upload
        </blockquote>
        <br />
        <b>Windows Instructions:</b>
        <blockquote>
        <span style="color: #c0c0c0;">&gt;</span> Create a folder named <b>upload</b> in the directory you installed CATS.<br />
        <span style="color: #c0c0c0;">&gt;</span> Set the appropriate permissions by right clicking the file and selecting <b>Properties</b>, then <b>Security</b>.<br />
        <span style="color: #c0c0c0;">&gt;</span> Make sure all users have access to read, write and delete files and directories.
        </blockquote>
    <?php endif; ?>
    </span>
<?php endif; ?>

<div style="padding: 10px; margin-top: 15px; text-align: left;">
    <table cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td align="left" valign="top">

                <p />
                
                    <span style="font-size: 14px; color: #333333;">
                    Your resume documents will be imported as searchable documents but <b>not</b> as candidates unless you manually complete the required fields for each document (first and last names).
                    <br /><br />
                    DEVELOPOER NOTE!!!!!   WE NEED TO FIND A RESUME PARSER ASIDE FROM RESFLY (its owned by catsone)
                
                    </span>
                
            </td>
        </tr>
    </table>
</div>

</div>