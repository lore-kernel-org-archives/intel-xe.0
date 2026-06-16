Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03BABCD98E1
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 19:28:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEE5010E665;
	Tue, 16 Jun 2026 19:28:01 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5329310E665;
 Tue, 16 Jun 2026 19:28:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Move_RTP_tables_for_engin?=
 =?utf-8?q?e_init_off_the_stack?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Jun 2026 19:28:00 -0000
Message-ID: <178163808033.86296.16236782007945294386@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260616-rtp_with_dynamic_vals-v1-0-f2b47bea9dd3@intel.com>
In-Reply-To: <20260616-rtp_with_dynamic_vals-v1-0-f2b47bea9dd3@intel.com>
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

Series: Move RTP tables for engine init off the stack
URL   : https://patchwork.freedesktop.org/series/168630/
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
commit 18d1c9c0683f6d5df4a3ee17cbf77b324fcc993d
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Tue Jun 16 12:21:54 2026 -0700

    drm/xe: Move engines' non-LRC programming RTP table off the stack
    
    The 'engine_sr' RTP table was allocated on the stack because it wasn't
    truly constant and needed to calculate the proper value for
    RING_CMD_CCTL at runtime based on other stack variables.  Using the
    FIELD_SET_FUNC action allows us to make the table itself truly constant
    and move it off the stack; the RING_CMD_CCTL value is now calculated
    during RTP table processing.
    
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 5447491819dcc3d10fd362c7bfbf877d343f6526 drm-intel
8a66b5239ac3 drm/xe: Reformat xe_rtp_types.h
048a8175cff2 drm/xe/rtp: Add FIELD_SET_FUNC RTP action
-:77: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'mask_bits_' - possible side-effects?
#77: FILE: drivers/gpu/drm/xe/xe_rtp.h:341:
+#define XE_RTP_ACTION_FIELD_SET_FUNC(reg_, mask_bits_, func_, ...)		\
+	{ .reg = XE_RTP_DROP_CAST(reg_),					\
+	  .clr_bits = mask_bits_, .set_func = func_, .use_func = 1,		\
+	  .read_mask = mask_bits_, ##__VA_ARGS__ }

total: 0 errors, 0 warnings, 1 checks, 88 lines checked
0935091f0103 drm/xe: Move engines' LRC programming RTP table off the stack
-:29: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#29: FILE: drivers/gpu/drm/xe/xe_hw_engine.c:346:
+const struct xe_rtp_table_sr lrc_setup = XE_RTP_TABLE_SR(

total: 0 errors, 0 warnings, 1 checks, 70 lines checked
18d1c9c0683f drm/xe: Move engines' non-LRC programming RTP table off the stack
-:50: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#50: FILE: drivers/gpu/drm/xe/xe_hw_engine.c:413:
+const struct xe_rtp_table_sr engine_sr = XE_RTP_TABLE_SR(

total: 0 errors, 0 warnings, 1 checks, 167 lines checked


