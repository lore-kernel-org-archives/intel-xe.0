Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1965BC7115C
	for <intel-xe@archiver.kernel.org>; Fri, 20 Jun 2025 21:55:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E8210E241;
	Fri, 20 Jun 2025 21:55:53 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C5210E23F;
 Fri, 20 Jun 2025 21:55:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Create_and_use_?=
 =?utf-8?q?SoC_WA_infrastructure?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Jun 2025 21:55:53 -0000
Message-ID: <175045655339.98943.4418732260505554846@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250620214920.718179-1-matthew.s.atwood@intel.com>
In-Reply-To: <20250620214920.718179-1-matthew.s.atwood@intel.com>
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

Series: drm/xe: Create and use SoC WA infrastructure
URL   : https://patchwork.freedesktop.org/series/150584/
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
commit 8d4ecef8b0011b22fa89bd7c2265bdca5c9a4899
Author: Matt Atwood <matthew.s.atwood@intel.com>
Date:   Fri Jun 20 14:49:20 2025 -0700

    drm/xe: disable wa_15015404425 for PTL B0
    
    This workaround only applies to PTL Compute Die A0. However, this
    information cannot be determined until after the GT is brought up. This
    means that we will assume that it is required for the initial bring up of
    the gt. After GT init, the oob workarounds are enabled for the GT. Use
    this flag to then manually set the bit in the soc oob bit field to 0
    which will help performance after device bring up.
    
    Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
+ /mt/dim checkpatch 3dde2e2646b2619f765de9c226bfe0dda7bf1f17 drm-intel
76d7be70ef65 drm/xe: add xe_soc_wa infrastructure
-:68: CHECK:BOOL_COMPARISON: Using comparison to false is error prone
#68: FILE: drivers/gpu/drm/xe/xe_gen_wa_oob.c:99:
+			if (soc == false)

-:81: CHECK:BOOL_COMPARISON: Using comparison to false is error prone
#81: FILE: drivers/gpu/drm/xe/xe_gen_wa_oob.c:123:
+	if (soc == false)

-:94: WARNING:LINE_SPACING: Missing a blank line after declarations
#94: FILE: drivers/gpu/drm/xe/xe_gen_wa_oob.c:166:
+	char *soc = strstr(args[ARGS_CHEADER].fn, "soc_");
+	if (soc == NULL)

-:94: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!soc"
#94: FILE: drivers/gpu/drm/xe/xe_gen_wa_oob.c:166:
+	if (soc == NULL)

-:99: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "soc"
#99: FILE: drivers/gpu/drm/xe/xe_gen_wa_oob.c:171:
+	bool prefix = soc != NULL ? true : false;

-:107: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#107: 
new file mode 100644

total: 0 errors, 2 warnings, 4 checks, 78 lines checked
1db4d1988d2c drm/xe: Add infrastructure for SoC OOB workarounds
-:8: WARNING:TYPO_SPELLING: 'simlar' may be misspelled - perhaps 'similar'?
#8: 
mechanism simlar to the GT related OOB workarounds where we can more
          ^^^^^^

-:28: WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#28: FILE: drivers/gpu/drm/xe/xe_device_types.h:365:
+	 *  initialization after SOC OOB WAs have been processed */

-:81: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#81: FILE: drivers/gpu/drm/xe/xe_rtp.h:425:
+	struct xe_gt * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_GT },	\

-:82: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#82: FILE: drivers/gpu/drm/xe/xe_rtp.h:426:
+	struct xe_device * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_SOC })

-:126: CHECK:SPACING: spaces preferred around that '-' (ctx:WxV)
#126: FILE: drivers/gpu/drm/xe/xe_wa.c:885:
+static_assert(ARRAY_SIZE(soc_oob_was) -1 == _XE_SOC_WA_OOB_COUNT);
                                       ^

-:140: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#140: FILE: drivers/gpu/drm/xe/xe_wa.c:911:
+	p = drmm_kzalloc(&xe->drm,
+			sizeof(xe->oob) * BITS_TO_LONGS(ARRAY_SIZE(soc_oob_was)),

-:220: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'xe__' - possible side-effects?
#220: FILE: drivers/gpu/drm/xe/xe_wa.h:43:
+#define XE_SOC_WA(xe__, id__) ({					\
+	xe_assert(xe__, (xe__)->oob_initialized);			\
+	test_bit(XE_SOC_WA_OOB_ ## id__, (xe__)->oob);			\
+})

total: 0 errors, 4 warnings, 3 checks, 170 lines checked
ee9ca050d3de drm/xe: Move Wa_15015404425 to use the new EX_SOC_WA macro
9cc636479d1f drm/xe: extend Wa_15015404425 to apply to PTL
8d4ecef8b001 drm/xe: disable wa_15015404425 for PTL B0


