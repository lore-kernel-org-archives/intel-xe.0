Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD017C7EE2A
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 19:39:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E8CE10E121;
	Wed, 25 Jun 2025 19:39:02 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D6510E121;
 Wed, 25 Jun 2025 19:39:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Create_and_use_?=
 =?utf-8?q?XE=5FDEVICE=5FWA_infrastructure_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Jun 2025 19:39:01 -0000
Message-ID: <175088034134.110430.10026397982976974606@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250625193340.38971-1-matthew.s.atwood@intel.com>
In-Reply-To: <20250625193340.38971-1-matthew.s.atwood@intel.com>
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

Series: drm/xe: Create and use XE_DEVICE_WA infrastructure (rev2)
URL   : https://patchwork.freedesktop.org/series/150777/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8745f5a69fcda58c554f9f0e5e5bdc29cc3cb12a
Author: Matt Atwood <matthew.s.atwood@intel.com>
Date:   Wed Jun 25 12:33:40 2025 -0700

    drm/xe: disable wa_15015404425 for PTL B0
    
    This workaround only applies to PTL Compute Die A0. The reality of
    modern platforms is we're Multi Chip Packages with logic spread across
    multiple dies. Because this information is not available during PCI
    probe it becomes a bit more complicated.
    
    This workaround needs to be applied on PTL until we prove that we are
    not Compute Die A0 stepping without reading any MMIOs. So use the new
    XE_DEVICE_WA infrastructure to apply early, until we can determine our
    stepping.
    
    There are at least two ways to determine Compute Die stepping. This
    patch uses the Media GT stepping to map to Compute Die stepping, in this
    case Compute and Media dies step synchronously.
    
    Since we're using the Media GT information to determine Compute Die
    stepping, use the XE_WA and the oob infrastructure to come back and
    toggle the workaround off when we know its safe, and after GT init.
    
    v2: rename SoC to device, avoid null pointer dereference, update commit
    message.
    v3: rebase
    
    Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
+ /mt/dim checkpatch 74f3ed8bab4e5ef51f1c266e8c7ffd1f2a052a73 drm-intel
22a4dc42eab7 drm/xe: add xe_device_wa infrastructure
-:42: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#42: 
new file mode 100644

-:73: CHECK:BOOL_COMPARISON: Using comparison to false is error prone
#73: FILE: drivers/gpu/drm/xe/xe_gen_wa_oob.c:99:
+			if (device == false)

-:86: CHECK:BOOL_COMPARISON: Using comparison to false is error prone
#86: FILE: drivers/gpu/drm/xe/xe_gen_wa_oob.c:123:
+	if (device == false)

-:99: WARNING:LINE_SPACING: Missing a blank line after declarations
#99: FILE: drivers/gpu/drm/xe/xe_gen_wa_oob.c:166:
+	char *device = strstr(args[ARGS_CHEADER].fn, "device_");
+	if (device == NULL)

-:99: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!device"
#99: FILE: drivers/gpu/drm/xe/xe_gen_wa_oob.c:166:
+	if (device == NULL)

-:104: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "device"
#104: FILE: drivers/gpu/drm/xe/xe_gen_wa_oob.c:171:
+	bool prefix = device != NULL ? true : false;

total: 0 errors, 2 warnings, 4 checks, 78 lines checked
347eaf10ed50 drm/xe: Add infrastructure for Device OOB workarounds
-:83: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#83: FILE: drivers/gpu/drm/xe/xe_rtp.h:425:
+	struct xe_gt * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_GT },	\

-:84: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#84: FILE: drivers/gpu/drm/xe/xe_rtp.h:426:
+	struct xe_device * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_DEVICE })

-:222: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'xe__' - possible side-effects?
#222: FILE: drivers/gpu/drm/xe/xe_wa.h:43:
+#define XE_DEVICE_WA(xe__, id__) ({					\
+	xe_assert(xe__, (xe__)->oob_initialized);			\
+	test_bit(XE_DEVICE_WA_OOB_ ## id__, (xe__)->oob);			\
+})

total: 0 errors, 2 warnings, 1 checks, 171 lines checked
4fba0ac8b6b7 drm/xe: Move Wa_15015404425 to use the new EX_DEVICE_WA macro
88f6fc810099 drm/xe: extend Wa_15015404425 to apply to PTL
8745f5a69fcd drm/xe: disable wa_15015404425 for PTL B0
-:48: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "xe->tiles->media_gt"
#48: FILE: drivers/gpu/drm/xe/xe_pci.c:902:
+	if (xe->tiles->media_gt != NULL &&

total: 0 errors, 0 warnings, 1 checks, 24 lines checked


