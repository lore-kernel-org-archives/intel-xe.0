Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB246C79F99
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 04:51:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7171510E9AF;
	Tue,  8 Sep 2026 04:51:06 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6728810E990;
 Tue,  8 Sep 2026 04:51:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_support_for_a_DRM_bac?=
 =?utf-8?q?klight_capability_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mario Limonciello" <mario.limonciello@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Sep 2026 04:51:05 -0000
Message-ID: <178884306541.132776.7919890242735958485@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260908044035.62093-1-mario.limonciello@amd.com>
In-Reply-To: <20260908044035.62093-1-mario.limonciello@amd.com>
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

Series: Add support for a DRM backlight capability (rev3)
URL   : https://patchwork.freedesktop.org/series/169110/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d875049d2b299159a272bd5151994970cdcd1e31
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0258b40a4f315479e296cd324ca3688a9a71fb09
Author: Mario Limonciello <mario.limonciello@amd.com>
Date:   Mon Sep 7 23:40:35 2026 -0500

    drm/i915/display: use drm backlight
    
    Convert the Intel display drivers (i915 and xe) to the DRM backlight
    infrastructure so brightness can be controlled through the connector
    LUMINANCE property. Link the backlight device to the eDP connector on
    registration and unlink it on unregistration; the DRM core owns the
    embedded backlight state and its property.
    
    Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
+ /mt/dim checkpatch 8968c3fbc95e850342a9316f74df831afc2376b7 drm-intel
a9865c6c3397 Revert "backlight: Remove notifier"
-:139: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Mario Limonciello <mario.limonciello@amd.com>' != 'Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>'

total: 0 errors, 1 warnings, 0 checks, 112 lines checked
97babfee0078 backlight: add kernel-internal backlight API
-:97: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#97: FILE: drivers/video/backlight/backlight.c:548:
+int backlight_set_brightness(struct backlight_device *bd, unsigned int value,
+			      enum backlight_update_reason reason)

-:211: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#211: FILE: include/linux/backlight.h:465:
+int backlight_set_brightness(struct backlight_device *bd, unsigned int value,
+			      enum backlight_update_reason reason);

-:227: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Mario Limonciello <mario.limonciello@amd.com>' != 'Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>'

total: 0 errors, 1 warnings, 2 checks, 173 lines checked
7ff0b9fa3d1f drm/property: add a per-connector luminance flag
-:55: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Mario Limonciello <mario.limonciello@amd.com>' != 'Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>'

total: 0 errors, 1 warnings, 0 checks, 28 lines checked
54515a22ea5e drm: add connector backlight (LUMINANCE) infrastructure
-:253: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#253: 
new file mode 100644

-:338: WARNING:STATIC_CONST_CHAR_ARRAY: char * array declaration might be better as static const
#338: FILE: drivers/gpu/drm/drm_backlight.c:81:
+	static char *ep[] = { "BACKLIGHT=1", NULL };

-:851: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#851: FILE: drivers/gpu/drm/drm_connector.c:1542:
+ * ^IAtomic, per-connector range property for controlling the backlight$

-:852: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#852: FILE: drivers/gpu/drm/drm_connector.c:1543:
+ * ^Ibrightness level of the connector's display. It provides unified access$

-:853: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#853: FILE: drivers/gpu/drm/drm_connector.c:1544:
+ * ^Ito the display backlight through the atomic modeset path, replacing the$

-:854: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#854: FILE: drivers/gpu/drm/drm_connector.c:1545:
+ * ^Ilegacy sysfs interface for brightness control.$

-:856: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#856: FILE: drivers/gpu/drm/drm_connector.c:1547:
+ * ^IThe property value is an unsigned integer. Its valid range is baked in$

-:857: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#857: FILE: drivers/gpu/drm/drm_connector.c:1548:
+ * ^Iwhen a backlight backend is linked to the connector and reflects the$

-:858: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#858: FILE: drivers/gpu/drm/drm_connector.c:1549:
+ * ^Ibackend's capabilities:$

-:860: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#860: FILE: drivers/gpu/drm/drm_connector.c:1551:
+ * ^I- Range 1-N: Normal operation for a backend that cannot guarantee a full$

-:861: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#861: FILE: drivers/gpu/drm/drm_connector.c:1552:
+ * ^I  off state. 1 is the minimum *visible* brightness and N is the backend$

-:862: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#862: FILE: drivers/gpu/drm/drm_connector.c:1553:
+ * ^I  maximum. Drivers are expected never to program a duty cycle of 0 for a$

-:863: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#863: FILE: drivers/gpu/drm/drm_connector.c:1554:
+ * ^I  value of 1.$

-:864: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#864: FILE: drivers/gpu/drm/drm_connector.c:1555:
+ * ^I- Range 0-N: Used when the backend can also fully turn the panel off, so$

-:865: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#865: FILE: drivers/gpu/drm/drm_connector.c:1556:
+ * ^I  0 is a normal in-range value.$

-:867: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#867: FILE: drivers/gpu/drm/drm_connector.c:1558:
+ * ^IValue 0 is always accepted, even when the advertised range starts at 1:$

-:868: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#868: FILE: drivers/gpu/drm/drm_connector.c:1559:
+ * ^Iit is the sentinel used to turn the backlight off when the connector is$

-:869: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#869: FILE: drivers/gpu/drm/drm_connector.c:1560:
+ * ^Ipowered down (DPMS off). Turning the backlight off this way may power the$

-:870: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#870: FILE: drivers/gpu/drm/drm_connector.c:1561:
+ * ^Ipanel down entirely; unlike programming a legacy sysfs duty cycle of 0,$

-:871: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#871: FILE: drivers/gpu/drm/drm_connector.c:1562:
+ * ^Ithis can stop vblank/pageflip events until the connector is enabled$

-:872: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#872: FILE: drivers/gpu/drm/drm_connector.c:1563:
+ * ^Iagain, so luminance-aware clients must not rely on such events while the$

-:873: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#873: FILE: drivers/gpu/drm/drm_connector.c:1564:
+ * ^Iconnector is off.$

-:875: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#875: FILE: drivers/gpu/drm/drm_connector.c:1566:
+ * ^IConnectors without a linked backend do not expose this property at all.$

-:877: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#877: FILE: drivers/gpu/drm/drm_connector.c:1568:
+ * ^IFor atomic drivers the value is stored in &drm_connector_state.luminance$

-:878: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#878: FILE: drivers/gpu/drm/drm_connector.c:1569:
+ * ^Iand applied to the hardware from the atomic commit path once the$

-:879: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#879: FILE: drivers/gpu/drm/drm_connector.c:1570:
+ * ^Iconnector is enabled. When DPMS transitions to OFF the backlight is set$

-:880: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#880: FILE: drivers/gpu/drm/drm_connector.c:1571:
+ * ^Ito 0; when it transitions back to ON the committed luminance is restored.$

-:881: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#881: FILE: drivers/gpu/drm/drm_connector.c:1572:
+ * ^IReading the property returns the last committed value (or the hardware's$

-:882: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#882: FILE: drivers/gpu/drm/drm_connector.c:1573:
+ * ^Icurrent state for backends that support reading brightness back).$

-:884: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#884: FILE: drivers/gpu/drm/drm_connector.c:1575:
+ * ^IThe property is created by the DRM core when a driver links a backlight$

-:885: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#885: FILE: drivers/gpu/drm/drm_connector.c:1576:
+ * ^Ibackend with drm_backlight_link(); drivers do not create it directly.$

-:887: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#887: FILE: drivers/gpu/drm/drm_connector.c:1578:
+ * ^IClient Capability:$

-:888: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#888: FILE: drivers/gpu/drm/drm_connector.c:1579:
+ * ^I^IUser-space must set the DRM_CLIENT_CAP_LUMINANCE client capability$

-:889: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#889: FILE: drivers/gpu/drm/drm_connector.c:1580:
+ * ^I^Ito 1 before using this property. When this capability is enabled,$

-:890: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#890: FILE: drivers/gpu/drm/drm_connector.c:1581:
+ * ^I^Ithe legacy sysfs backlight interface is inhibited to prevent$

-:891: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#891: FILE: drivers/gpu/drm/drm_connector.c:1582:
+ * ^I^Iconflicts between multiple clients trying to control the same$

-:892: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#892: FILE: drivers/gpu/drm/drm_connector.c:1583:
+ * ^I^Ibacklight. This ensures that only luminance-aware clients control$

-:893: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#893: FILE: drivers/gpu/drm/drm_connector.c:1584:
+ * ^I^Ithe backlight through the DRM atomic interface.$

-:895: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#895: FILE: drivers/gpu/drm/drm_connector.c:1586:
+ * ^I^ILegacy clients that do not set this capability should continue$

-:896: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#896: FILE: drivers/gpu/drm/drm_connector.c:1587:
+ * ^I^Iusing the sysfs interface (if available).$

-:898: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#898: FILE: drivers/gpu/drm/drm_connector.c:1589:
+ * ^INote: This property can be set through the MODE_ATOMIC ioctl as part of$

-:899: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#899: FILE: drivers/gpu/drm/drm_connector.c:1590:
+ * ^Ithe atomic state.$

-:1261: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Mario Limonciello <mario.limonciello@amd.com>' != 'Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>'

total: 0 errors, 43 warnings, 0 checks, 1142 lines checked
4ae6f308429f drm: add DRM_CLIENT_CAP_LUMINANCE
-:161: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Mario Limonciello <mario.limonciello@amd.com>' != 'Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>'

total: 0 errors, 1 warnings, 0 checks, 114 lines checked
e2fad4cd6e96 drm/amd/display: Pass up errors reading actual brightness
-:95: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Mario Limonciello <mario.limonciello@amd.com>' != 'Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>'

total: 0 errors, 1 warnings, 0 checks, 62 lines checked
3e7d8c41c677 drm/amd: Indicate driver supports luminance
-:22: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Mario Limonciello <mario.limonciello@amd.com>' != 'Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>'

total: 0 errors, 1 warnings, 0 checks, 7 lines checked
43297394c42b drm/amd/display: use drm backlight
-:143: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Mario Limonciello <mario.limonciello@amd.com>' != 'Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>'

total: 0 errors, 1 warnings, 0 checks, 108 lines checked
9c74d5245f26 drm/amdgpu: Check bios_scratch_reg_offset in backlight level helper
de5b9cd884e3 drm/amd/display: Update KUnit backlight tests for luminance property and fixtures
-:55: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#55: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c:1919:
+	KUNIT_EXPECT_EQ(test, aconnector->base.base.properties->values[old_count + 1],
 			 (uint64_t)ABM_SYSFS_CONTROL);

total: 0 errors, 0 warnings, 1 checks, 64 lines checked
3b0b378824a5 drm/bridge: auto-link panel backlight in bridge connector
-:80: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Mario Limonciello <mario.limonciello@amd.com>' != 'Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>'

total: 0 errors, 1 warnings, 0 checks, 54 lines checked
f48a5027b741 drm/xe: Indicate support for luminance on the connector
9d2ce173cc75 drm/i915: Indicate support for luminance on the connector
0258b40a4f31 drm/i915/display: use drm backlight


