Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BF0C77B7C
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 19:45:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C6A10E796;
	Wed,  2 Jul 2025 19:45:08 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE9010E77F;
 Wed,  2 Jul 2025 19:45:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Create_and_use_XE=5FDEVIC?=
 =?utf-8?q?E=5FWA_infrastructure?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Jul 2025 19:45:07 -0000
Message-ID: <175148550738.129325.300168631827152373@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250702193036.1417416-1-matthew.s.atwood@intel.com>
In-Reply-To: <20250702193036.1417416-1-matthew.s.atwood@intel.com>
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

Series: Create and use XE_DEVICE_WA infrastructure
URL   : https://patchwork.freedesktop.org/series/151087/
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
commit f09e1793bb36553bf17d08206fc1fc8b41dd2d05
Author: Matt Atwood <matthew.s.atwood@intel.com>
Date:   Wed Jul 2 12:30:36 2025 -0700

    drm/xe: disable wa_15015404425 for PTL B0
    
    Wa_15015404425 only needs to be applied on PTL platforms with an A step
    compute die. There is no way to map PCI revid to the compute die
    stepping. The easiest way to figure out compute die stepping our end is
    to map the media IP's stepping to the compute die. For PTL, compute die
    has an A stepping if and only if the media IP's stepping is also A-step
    (This relationship is determined on a per platform basis and just
    happens to be this way on PTL).
    
    In addition this workaround is a chicken-and-egg problem. Wa_15015404425
    requires that all register reads be preceded by four dummy MMIO writes
    (including during early driver  init and even pre-OS firmware). The
    driver needs to perform some MMIO reads during init which include the
    GMD_ID register that contains the Media IPs stepping. To handle this in
    the safest manner assume the workaround applies to all of PTL during
    driver probe and deactivate the workaround after.
    
    The overall solution becomes a set of two workarounds:
    
    * 15015404425 - a Device OOB workaround that's always active for PTL
    * 15015404425_disable - a GT OOB workaround that applies to PTL
      platfroms with a B0 or later stepping
    
    The first of these workarounds issues dummy MMIO writes we do when
    reading registers. The second guards logic that disables the first once
    we have the necessary information later in the probe process.
    
    v2: rename SoC to device, avoid null pointer dereference, update commit
    message.
    v3: rebase
    v5: move disable check into xe_device_probe to avoid linking in xe_wa
    into xe_pci, reword commit message
    
    Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
+ /mt/dim checkpatch 94631e6b7f655b1922e3227970cd6180200694af drm-intel
d95a896ea644 drm/xe: add xe_device_wa infrastructure
-:43: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#43: 
new file mode 100644

-:90: WARNING:STRNCPY: Prefer strscpy, strscpy_pad, or __nonstring over strncpy - see: https://github.com/KSPP/linux/issues/90
#90: FILE: drivers/gpu/drm/xe/xe_gen_wa_oob.c:128:
+	if (!strncpy(prefix, fn, size - 1))

total: 0 errors, 2 warnings, 0 checks, 101 lines checked
581744fccdcf drm/xe: add new type to RTP context
-:98: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#98: FILE: drivers/gpu/drm/xe/xe_rtp.h:425:
+	struct xe_gt * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_GT },	\

-:99: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#99: FILE: drivers/gpu/drm/xe/xe_rtp.h:426:
+	struct xe_device * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_DEVICE })

total: 0 errors, 2 warnings, 0 checks, 91 lines checked
90ae50cf3180 drm/xe: Add infrastructure for Device OOB workarounds
-:133: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#133: FILE: drivers/gpu/drm/xe/xe_wa.c:900:
+	xe_rtp_process_ctx_enable_active_tracking(&ctx, xe->wa_active.oob, ARRAY_SIZE(device_oob_was));

-:224: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'xe__' - possible side-effects?
#224: FILE: drivers/gpu/drm/xe/xe_wa.h:43:
+#define XE_DEVICE_WA(xe__, id__) ({					\
+	xe_assert(xe__, (xe__)->wa_active.oob_initialized);			\
+	test_bit(XE_DEVICE_WA_OOB_ ## id__, (xe__)->wa_active.oob);		\
+})

total: 0 errors, 1 warnings, 1 checks, 181 lines checked
13f61557eea9 drm/xe: Move Wa_15015404425 to use the new XE_DEVICE_WA macro
b1c4255c2e2e drm/xe: extend Wa_15015404425 to apply to PTL
f09e1793bb36 drm/xe: disable wa_15015404425 for PTL B0
-:71: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'xe__' - possible side-effects?
#71: FILE: drivers/gpu/drm/xe/xe_wa.h:48:
+#define XE_DEVICE_WA_DISABLE(xe__, id__) ({				\
+	xe_assert(xe__, (xe__)->wa_active.oob_initialized);			\
+	clear_bit(XE_DEVICE_WA_OOB_ ## id__, (xe__)->wa_active.oob);		\
+})

total: 0 errors, 0 warnings, 1 checks, 31 lines checked


