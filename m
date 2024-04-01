Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FD4CD1292
	for <intel-xe@archiver.kernel.org>; Mon,  1 Apr 2024 12:55:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55ACA10F142;
	Mon,  1 Apr 2024 12:55:12 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1178910F142;
 Mon,  1 Apr 2024 12:55:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Make_I2C_terminology_more?=
 =?utf-8?q?_inclusive_for_I2C_Algobit_and_consumers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Easwar Hariharan" <eahariha@linux.microsoft.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 01 Apr 2024 12:55:11 -0000
Message-ID: <171197611106.1117021.4343416773619784220@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
In-Reply-To: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Make I2C terminology more inclusive for I2C Algobit and consumers
URL   : https://patchwork.freedesktop.org/series/131888/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit eef0e032f04d302f95c3a70943a3c0ab20f5a0b3
Author: Easwar Hariharan <eahariha@linux.microsoft.com>
Date:   Fri Mar 29 17:00:38 2024 +0000

    i2c and treewide: Make I2C terminology more inclusive
    
    I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"
    with more appropriate terms. Inspired by and following on to Wolfram's
    series to fix drivers/i2c[1], fix the terminology for users of
    I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
    in the specification.
    
    Compile tested, no functionality changes intended
    
    [1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/
    
    Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
+ /mt/dim checkpatch a585b19932157f2c96293bf00288968ada86d435 drm-intel
9e4bf55513a4 IB/hfi1, IB/qib: Make I2C terminology more inclusive
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
with more appropriate terms. Inspired by and following on to Wolfram's series

total: 0 errors, 1 warnings, 0 checks, 261 lines checked
6d6982169cfc drm/amdgpu, drm/radeon: Make I2C terminology more inclusive
-:14: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
[1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/

-:111: CHECK:CAMELCASE: Avoid CamelCase: <ucClientAddr>
#111: FILE: drivers/gpu/drm/amd/amdgpu/atombios_i2c.c:86:
+	args.ucClientAddr = client_addr << 1;

-:120: WARNING:LONG_LINE: line length of 118 exceeds 100 columns
#120: FILE: drivers/gpu/drm/amd/amdgpu/atombios_i2c.c:162:
+void amdgpu_atombios_i2c_channel_trans(struct amdgpu_device *adev, u8 client_addr, u8 line_number, u8 offset, u8 data)

-:208: CHECK:CAMELCASE: Avoid CamelCase: <ucI2CAddr>
#208: FILE: drivers/gpu/drm/amd/display/dc/bios/bios_parser.c:1874:
+	info->i2c_client_address = record->ucI2CAddr;

-:289: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#289: FILE: drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h:95:
+	uint32_t i2c_client_address;

-:302: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#302: FILE: drivers/gpu/drm/amd/include/atombios.h:8506:
+  UCHAR   ucClientAddr;$

-:315: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#315: FILE: drivers/gpu/drm/amd/include/atomfirmware.h:537:
+  uint8_t  board_i2c_feature_client_addr;$

-:315: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#315: FILE: drivers/gpu/drm/amd/include/atomfirmware.h:537:
+  uint8_t  board_i2c_feature_client_addr;

-:324: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#324: FILE: drivers/gpu/drm/amd/include/atomfirmware.h:565:
+  uint8_t  board_i2c_feature_client_addr;$

-:324: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#324: FILE: drivers/gpu/drm/amd/include/atomfirmware.h:565:
+  uint8_t  board_i2c_feature_client_addr;

-:334: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#334: FILE: drivers/gpu/drm/amd/include/atomfirmware.h:593:
+	uint8_t  board_i2c_feature_client_addr;

-:335: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#335: FILE: drivers/gpu/drm/amd/include/atomfirmware.h:594:
+	uint8_t  ras_rom_i2c_client_addr;

-:345: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#345: FILE: drivers/gpu/drm/amd/include/atomfirmware.h:629:
+  uint8_t  board_i2c_feature_client_addr;$

-:345: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#345: FILE: drivers/gpu/drm/amd/include/atomfirmware.h:629:
+  uint8_t  board_i2c_feature_client_addr;

-:346: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#346: FILE: drivers/gpu/drm/amd/include/atomfirmware.h:630:
+  uint8_t  ras_rom_i2c_client_addr;$

-:346: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#346: FILE: drivers/gpu/drm/amd/include/atomfirmware.h:630:
+  uint8_t  ras_rom_i2c_client_addr;

-:355: WARNING:LONG_LINE_COMMENT: line length of 122 exceeds 100 columns
#355: FILE: drivers/gpu/drm/amd/include/atomfirmware.h:833:
+  uint8_t i2c_client_addr;                   //The client address, it's 0 when the record is attached to connector for DDC

-:355: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#355: FILE: drivers/gpu/drm/amd/include/atomfirmware.h:833:
+  uint8_t i2c_client_addr;                   //The client address, it's 0 when the record is attached to connector for DDC$

-:355: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#355: FILE: drivers/gpu/drm/amd/include/atomfirmware.h:833:
+  uint8_t i2c_client_addr;                   //The client address, it's 0 when the record is attached to connector for DDC

-:364: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#364: FILE: drivers/gpu/drm/amd/include/atomfirmware.h:2029:
+  uint32_t smb_client_address;$

-:364: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#364: FILE: drivers/gpu/drm/amd/include/atomfirmware.h:2029:
+  uint32_t smb_client_address;

-:373: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#373: FILE: drivers/gpu/drm/amd/include/atomfirmware.h:2086:
+	uint32_t smb_client_address;

-:382: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#382: FILE: drivers/gpu/drm/amd/include/atomfirmware.h:2141:
+	uint32_t smb_client_address;

-:391: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#391: FILE: drivers/gpu/drm/amd/include/atomfirmware.h:2352:
+  uint32_t  clientaddress;$

-:391: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#391: FILE: drivers/gpu/drm/amd/include/atomfirmware.h:2352:
+  uint32_t  clientaddress;

-:400: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#400: FILE: drivers/gpu/drm/amd/include/atomfirmware.h:3513:
+   uint8_t  i2c_client_addr;$

-:400: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#400: FILE: drivers/gpu/drm/amd/include/atomfirmware.h:3513:
+   uint8_t  i2c_client_addr;

-:409: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#409: FILE: drivers/gpu/drm/amd/include/atomfirmware.h:4155:
+  uint8_t   client_addr;$

-:409: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#409: FILE: drivers/gpu/drm/amd/include/atomfirmware.h:4155:
+  uint8_t   client_addr;

-:423: CHECK:CAMELCASE: Avoid CamelCase: <I2cControllers>
#423: FILE: drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_processpptables.c:787:
+		ppsmc_pptable->I2cControllers[i].ClientAddress =

-:423: CHECK:CAMELCASE: Avoid CamelCase: <ClientAddress>
#423: FILE: drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_processpptables.c:787:
+		ppsmc_pptable->I2cControllers[i].ClientAddress =

-:437: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#437: FILE: drivers/gpu/drm/amd/pm/powerplay/inc/smu11_driver_if.h:290:
+  uint32_t ClientAddress;$

-:437: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#437: FILE: drivers/gpu/drm/amd/pm/powerplay/inc/smu11_driver_if.h:290:
+  uint32_t ClientAddress;

-:450: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#450: FILE: drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_arcturus.h:266:
+  uint32_t  ClientAddress;$

-:450: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#450: FILE: drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_arcturus.h:266:
+  uint32_t  ClientAddress;

-:463: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#463: FILE: drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_navi10.h:270:
+  uint32_t  ClientAddress;$

-:463: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#463: FILE: drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_navi10.h:270:
+  uint32_t  ClientAddress;

-:476: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#476: FILE: drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_sienna_cichlid.h:345:
+  uint8_t   ClientAddress;$

-:476: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#476: FILE: drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_sienna_cichlid.h:345:
+  uint8_t   ClientAddress;

-:489: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#489: FILE: drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_aldebaran.h:170:
+  uint8_t   ClientAddress;$

-:489: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#489: FILE: drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_aldebaran.h:170:
+  uint8_t   ClientAddress;

-:502: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#502: FILE: drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h:322:
+  uint8_t   ClientAddress;$

-:502: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#502: FILE: drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h:322:
+  uint8_t   ClientAddress;

-:515: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#515: FILE: drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h:323:
+  uint8_t   ClientAddress;$

-:515: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#515: FILE: drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h:323:
+  uint8_t   ClientAddress;

-:530: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#530: FILE: drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c:1913:
+		dev_info(smu->adev->dev, "                   .ClientAddress = 0x%x\n",
+				pptable->I2cControllers[i].ClientAddress);

-:545: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#545: FILE: drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c:2992:
+		dev_info(smu->adev->dev, "                   .ClientAddress = 0x%x\n",
+				pptable->I2cControllers[i].ClientAddress);

-:556: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#556: FILE: drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c:3631:
+		dev_info(smu->adev->dev, "                   .ClientAddress = 0x%x\n",
+				pptable->I2cControllers[i].ClientAddress);

-:569: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#569: FILE: drivers/gpu/drm/radeon/atombios.h:7232:
+  UCHAR   ucClientAddr;$

-:656: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#656: FILE: drivers/gpu/drm/radeon/radeon_combios.c:2890:
+	uint8_t blocks, client_addr, rev;

-:742: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#742: FILE: drivers/gpu/drm/radeon/radeon_mode.h:412:
+	uint8_t client_addr;

total: 0 errors, 21 warnings, 30 checks, 575 lines checked
dbe76cbd85f8 drm/gma500, drm/i915: Make I2C terminology more inclusive
-:15: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#15: 
https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/

-:54: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#54: FILE: drivers/gpu/drm/gma500/intel_bios.c:361:
+		if (p_child->client_addr != CLIENT_ADDR1 &&
+			p_child->client_addr != CLIENT_ADDR2) {

-:233: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#233: FILE: drivers/gpu/drm/gma500/psb_intel_sdvo.c:482:
+	msgs[i+1].addr = psb_intel_sdvo->client_addr;
 	      ^

-:239: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#239: FILE: drivers/gpu/drm/gma500/psb_intel_sdvo.c:487:
+	msgs[i+2].addr = psb_intel_sdvo->client_addr;
 	      ^

-:596: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#596: FILE: drivers/gpu/drm/i915/display/dvo_sil164.c:157:
+		DRM_DEBUG_KMS("sil164 not detected got %d: from %s Client %d.\n",
+			  ch, adapter->name, dvo->client_addr);

-:607: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#607: FILE: drivers/gpu/drm/i915/display/dvo_sil164.c:166:
+		DRM_DEBUG_KMS("sil164 not detected got %d: from %s Client %d.\n",
+			  ch, adapter->name, dvo->client_addr);

-:1011: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#1011: FILE: drivers/gpu/drm/i915/display/intel_sdvo.c:502:
+	msgs[i+1].addr = intel_sdvo->client_addr;
 	      ^

-:1017: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#1017: FILE: drivers/gpu/drm/i915/display/intel_sdvo.c:507:
+	msgs[i+2].addr = intel_sdvo->client_addr;
 	      ^

total: 0 errors, 1 warnings, 7 checks, 1001 lines checked
7afbcf21b7be media: au0828: Make I2C terminology more inclusive
-:14: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
[1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/

total: 0 errors, 1 warnings, 0 checks, 24 lines checked
536da0a35902 media: cobalt: Make I2C terminology more inclusive
-:14: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
[1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/

total: 0 errors, 1 warnings, 0 checks, 20 lines checked
b7fdb80c34f6 media: cx18: Make I2C terminology more inclusive
-:18: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#18: 
[1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/

total: 0 errors, 1 warnings, 0 checks, 85 lines checked
324364792089 media: cx25821: Make I2C terminology more inclusive
-:14: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
[1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/

total: 0 errors, 1 warnings, 0 checks, 24 lines checked
4d5858a32c7a media: ivtv: Make I2C terminology more inclusive
-:14: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
[1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/

-:27: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#27: FILE: drivers/media/pci/ivtv/ivtv-i2c.c:36:
+    lines.  To communicate on the bus (as a host, we don't act as a client),$

-:27: WARNING:SPACING: space prohibited between function name and open parenthesis '('
#27: FILE: drivers/media/pci/ivtv/ivtv-i2c.c:36:
+    lines.  To communicate on the bus (as a host, we don't act as a client),

-:27: CHECK:CAMELCASE: Avoid CamelCase: <To>
#27: FILE: drivers/media/pci/ivtv/ivtv-i2c.c:36:
+    lines.  To communicate on the bus (as a host, we don't act as a client),

-:31: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#31: FILE: drivers/media/pci/ivtv/ivtv-i2c.c:39:
+    that indicates whether this is a read or a write.  The client then issues$

-:36: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#36: FILE: drivers/media/pci/ivtv/ivtv-i2c.c:43:
+    to other hosts.$

total: 0 errors, 5 warnings, 1 checks, 57 lines checked
a2efeaf9c909 media: cx23885: Make I2C terminology more inclusive
-:14: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
[1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/

-:37: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#37: FILE: drivers/media/pci/cx23885/cx23885-f300.c:116:
+		pr_err("%s: timeout, the client no response\n",
 								__func__);

total: 0 errors, 1 warnings, 1 checks, 45 lines checked
3fce06d83845 sfc: falcon: Make I2C terminology more inclusive
-:14: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
[1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
5d5521a4e534 fbdev/smscufx: Make I2C terminology more inclusive
-:14: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
[1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/

total: 0 errors, 1 warnings, 0 checks, 16 lines checked
ecc7d4a6526b fbdev/viafb: Make I2C terminology more inclusive
-:14: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
[1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/

-:91: CHECK:SPACING: No space is necessary after a cast
#91: FILE: drivers/video/fbdev/via/dvi.c:147:
+			   (u8) viaparinfo->chip_info->tmds_chip_info.tmds_chip_client_addr,

-:100: CHECK:SPACING: No space is necessary after a cast
#100: FILE: drivers/video/fbdev/via/dvi.c:155:
+			    (u8) viaparinfo->chip_info->tmds_chip_info.tmds_chip_client_addr,

-:178: CHECK:SPACING: No space is necessary after a cast
#178: FILE: drivers/video/fbdev/via/lcd.c:330:
+			(u8) viaparinfo->chip_info->lvds_chip_info.lvds_chip_client_addr,

-:213: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#213: FILE: drivers/video/fbdev/via/via_i2c.c:118:
+	msgs[0].addr = msgs[1].addr = client_addr / 2;

-:249: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#249: FILE: drivers/video/fbdev/via/via_i2c.c:162:
+	msgs[0].addr = msgs[1].addr = client_addr / 2;

total: 0 errors, 1 warnings, 5 checks, 219 lines checked
7e687ddd7fdd drm/nouveau: Make I2C terminology more inclusive
-:14: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
[1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/

-:63: ERROR:CODE_INDENT: code indent should use tabs where possible
#63: FILE: drivers/gpu/drm/nouveau/dispnv04/dfp.c:635:
+^I^I        .addr = (dcb->tmdsconf.client_addr == 0x7 ? 0x3a : 0x38),$

total: 1 errors, 1 warnings, 0 checks, 75 lines checked
eef0e032f04d i2c and treewide: Make I2C terminology more inclusive
-:14: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
[1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/

-:203: WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#203: FILE: drivers/i2c/algos/i2c-algo-bit.c:146:
+   check ackn. from client */

total: 0 errors, 2 warnings, 0 checks, 232 lines checked


