Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A9DC61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 21:12:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F407F10E10E;
	Mon, 31 Aug 2026 21:12:51 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C8C10E012;
 Mon, 31 Aug 2026 21:12:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_support_for_a_DRM_bac?=
 =?utf-8?q?klight_capability_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mario Limonciello" <mario.limonciello@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 31 Aug 2026 21:12:50 -0000
Message-ID: <178821077042.104493.15301443830159531748@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260831210531.2334221-1-mario.limonciello@amd.com>
In-Reply-To: <20260831210531.2334221-1-mario.limonciello@amd.com>
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

Series: Add support for a DRM backlight capability (rev2)
URL   : https://patchwork.freedesktop.org/series/169110/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 923911512ff402ea3f172dfb0232dc826e69d945
Author: Mario Limonciello <mario.limonciello@amd.com>
Date:   Mon Aug 31 16:05:31 2026 -0500

    drm/i915/display: use drm backlight
    
    Convert the Intel display drivers (i915 and xe) to the DRM backlight
    infrastructure so brightness can be controlled through the connector
    LUMINANCE property. Link the backlight device to the eDP connector on
    registration and unlink it on unregistration; the DRM core owns the
    embedded backlight state and its property.
    
    Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
+ /mt/dim checkpatch d60d982526a80c1e429e0ad7f5d92ec90af0cba6 drm-intel
8fff61f0fb60 Revert "backlight: Remove notifier"
-:139: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Mario Limonciello <mario.limonciello@amd.com>' != 'Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>'

total: 0 errors, 1 warnings, 0 checks, 112 lines checked
f13e9683eb7f backlight: add kernel-internal backlight API
-:82: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#82: FILE: drivers/video/backlight/backlight.c:540:
+int backlight_set_brightness(struct backlight_device *bd, unsigned int value,
+			      enum backlight_update_reason reason)

-:191: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#191: FILE: include/linux/backlight.h:461:
+int backlight_set_brightness(struct backlight_device *bd, unsigned int value,
+			      enum backlight_update_reason reason);

-:207: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Mario Limonciello <mario.limonciello@amd.com>' != 'Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>'

total: 0 errors, 1 warnings, 2 checks, 154 lines checked
45c637be86c1 drm/property: add a per-connector luminance flag
-:55: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Mario Limonciello <mario.limonciello@amd.com>' != 'Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>'

total: 0 errors, 1 warnings, 0 checks, 28 lines checked
5cc256aafa95 drm: add connector backlight (LUMINANCE) infrastructure
-:264: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#264: 
new file mode 100644

-:349: WARNING:STATIC_CONST_CHAR_ARRAY: char * array declaration might be better as static const
#349: FILE: drivers/gpu/drm/drm_backlight.c:81:
+	static char *ep[] = { "BACKLIGHT=1", NULL };

-:827: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#827: FILE: drivers/gpu/drm/drm_connector.c:1542:
+ * ^IAtomic, per-connector range property for controlling the backlight$

-:828: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#828: FILE: drivers/gpu/drm/drm_connector.c:1543:
+ * ^Ibrightness level of the connector's display. It provides unified access$

-:829: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#829: FILE: drivers/gpu/drm/drm_connector.c:1544:
+ * ^Ito the display backlight through the atomic modeset path, replacing the$

-:830: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#830: FILE: drivers/gpu/drm/drm_connector.c:1545:
+ * ^Ilegacy sysfs interface for brightness control.$

-:832: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#832: FILE: drivers/gpu/drm/drm_connector.c:1547:
+ * ^IThe property value is an unsigned integer. Its valid range is baked in$

-:833: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#833: FILE: drivers/gpu/drm/drm_connector.c:1548:
+ * ^Iwhen a backlight backend is linked to the connector and reflects the$

-:834: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#834: FILE: drivers/gpu/drm/drm_connector.c:1549:
+ * ^Ibackend's capabilities:$

-:836: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#836: FILE: drivers/gpu/drm/drm_connector.c:1551:
+ * ^I- Range 1-N: Normal operation for a backend that cannot guarantee a full$

-:837: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#837: FILE: drivers/gpu/drm/drm_connector.c:1552:
+ * ^I  off state. 1 is the minimum *visible* brightness and N is the backend$

-:838: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#838: FILE: drivers/gpu/drm/drm_connector.c:1553:
+ * ^I  maximum. Drivers are expected never to program a duty cycle of 0 for a$

-:839: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#839: FILE: drivers/gpu/drm/drm_connector.c:1554:
+ * ^I  value of 1.$

-:840: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#840: FILE: drivers/gpu/drm/drm_connector.c:1555:
+ * ^I- Range 0-N: Used when the backend can also fully turn the panel off, so$

-:841: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#841: FILE: drivers/gpu/drm/drm_connector.c:1556:
+ * ^I  0 is a normal in-range value.$

-:843: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#843: FILE: drivers/gpu/drm/drm_connector.c:1558:
+ * ^IValue 0 is always accepted, even when the advertised range starts at 1:$

-:844: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#844: FILE: drivers/gpu/drm/drm_connector.c:1559:
+ * ^Iit is the sentinel used to turn the backlight off when the connector is$

-:845: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#845: FILE: drivers/gpu/drm/drm_connector.c:1560:
+ * ^Ipowered down (DPMS off). Turning the backlight off this way may power the$

-:846: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#846: FILE: drivers/gpu/drm/drm_connector.c:1561:
+ * ^Ipanel down entirely; unlike programming a legacy sysfs duty cycle of 0,$

-:847: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#847: FILE: drivers/gpu/drm/drm_connector.c:1562:
+ * ^Ithis can stop vblank/pageflip events until the connector is enabled$

-:848: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#848: FILE: drivers/gpu/drm/drm_connector.c:1563:
+ * ^Iagain, so luminance-aware clients must not rely on such events while the$

-:849: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#849: FILE: drivers/gpu/drm/drm_connector.c:1564:
+ * ^Iconnector is off.$

-:851: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#851: FILE: drivers/gpu/drm/drm_connector.c:1566:
+ * ^IConnectors without a linked backend do not expose this property at all.$

-:853: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#853: FILE: drivers/gpu/drm/drm_connector.c:1568:
+ * ^IFor atomic drivers the value is stored in &drm_connector_state.luminance$

-:854: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#854: FILE: drivers/gpu/drm/drm_connector.c:1569:
+ * ^Iand applied to the hardware from the atomic commit path once the$

-:855: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#855: FILE: drivers/gpu/drm/drm_connector.c:1570:
+ * ^Iconnector is enabled. When DPMS transitions to OFF the backlight is set$

-:856: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#856: FILE: drivers/gpu/drm/drm_connector.c:1571:
+ * ^Ito 0; when it transitions back to ON the committed luminance is restored.$

-:857: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#857: FILE: drivers/gpu/drm/drm_connector.c:1572:
+ * ^IReading the property returns the last committed value (or the hardware's$

-:858: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#858: FILE: drivers/gpu/drm/drm_connector.c:1573:
+ * ^Icurrent state for backends that support reading brightness back).$

-:860: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#860: FILE: drivers/gpu/drm/drm_connector.c:1575:
+ * ^IThe property is created by the DRM core when a driver links a backlight$

-:861: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#861: FILE: drivers/gpu/drm/drm_connector.c:1576:
+ * ^Ibackend with drm_backlight_link(); drivers do not create it directly.$

-:863: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#863: FILE: drivers/gpu/drm/drm_connector.c:1578:
+ * ^IClient Capability:$

-:864: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#864: FILE: drivers/gpu/drm/drm_connector.c:1579:
+ * ^I^IUser-space must set the DRM_CLIENT_CAP_LUMINANCE client capability$

-:865: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#865: FILE: drivers/gpu/drm/drm_connector.c:1580:
+ * ^I^Ito 1 before using this property. When this capability is enabled,$

-:866: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#866: FILE: drivers/gpu/drm/drm_connector.c:1581:
+ * ^I^Ithe legacy sysfs backlight interface is inhibited to prevent$

-:867: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#867: FILE: drivers/gpu/drm/drm_connector.c:1582:
+ * ^I^Iconflicts between multiple clients trying to control the same$

-:868: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#868: FILE: drivers/gpu/drm/drm_connector.c:1583:
+ * ^I^Ibacklight. This ensures that only luminance-aware clients control$

-:869: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#869: FILE: drivers/gpu/drm/drm_connector.c:1584:
+ * ^I^Ithe backlight through the DRM atomic interface.$

-:871: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#871: FILE: drivers/gpu/drm/drm_connector.c:1586:
+ * ^I^ILegacy clients that do not set this capability should continue$

-:872: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#872: FILE: drivers/gpu/drm/drm_connector.c:1587:
+ * ^I^Iusing the sysfs interface (if available).$

-:874: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#874: FILE: drivers/gpu/drm/drm_connector.c:1589:
+ * ^INote: This property can be set through the MODE_ATOMIC ioctl as part of$

-:875: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#875: FILE: drivers/gpu/drm/drm_connector.c:1590:
+ * ^Ithe atomic state.$

-:1202: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Mario Limonciello <mario.limonciello@amd.com>' != 'Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>'

total: 0 errors, 43 warnings, 0 checks, 1087 lines checked
0cb12e3b58ce drm: add DRM_CLIENT_CAP_LUMINANCE
-:154: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Mario Limonciello <mario.limonciello@amd.com>' != 'Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>'

total: 0 errors, 1 warnings, 0 checks, 107 lines checked
37c26bb3599b drm/amd/display: Pass up errors reading actual brightness
-:87: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Mario Limonciello <mario.limonciello@amd.com>' != 'Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>'

total: 0 errors, 1 warnings, 0 checks, 54 lines checked
950d814f9e08 drm/amd: Indicate driver supports luminance
-:22: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Mario Limonciello <mario.limonciello@amd.com>' != 'Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>'

total: 0 errors, 1 warnings, 0 checks, 7 lines checked
b9b6d8cc9c34 drm/amd/display: use drm backlight
-:78: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Mario Limonciello <mario.limonciello@amd.com>' != 'Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>'

total: 0 errors, 1 warnings, 0 checks, 47 lines checked
44a378b68c4b drm/bridge: auto-link panel backlight in bridge connector
-:80: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Mario Limonciello <mario.limonciello@amd.com>' != 'Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>'

total: 0 errors, 1 warnings, 0 checks, 54 lines checked
39b8a3ee1414 drm/xe: Indicate support for luminance on the connector
f7e2def333b7 drm/i915: Indicate support for luminance on the connector
923911512ff4 drm/i915/display: use drm backlight


