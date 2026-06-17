Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932BDCD98F0
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 19:32:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49FDC10F0EF;
	Wed, 17 Jun 2026 19:32:12 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C09910F0EF;
 Wed, 17 Jun 2026 19:32:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Move_RTP_tables_for_engin?=
 =?utf-8?q?e_init_off_the_stack_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Jun 2026 19:32:10 -0000
Message-ID: <178172473030.91245.9655515369338774469@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260617-rtp_with_dynamic_vals-v2-0-3f4cb34c2ea1@intel.com>
In-Reply-To: <20260617-rtp_with_dynamic_vals-v2-0-3f4cb34c2ea1@intel.com>
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

Series: Move RTP tables for engine init off the stack (rev2)
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
commit ad0e71f48a593d8cd4aba83de8ff499b881cae3f
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Wed Jun 17 12:24:49 2026 -0700

    drm/xe/rtp: Add kunit tests to exercise FIELD_SET_FUNC action
    
    Add a couple additional tests to the RTP kunit suite that ensure
    FIELD_SET_FUNC() actions are evaluated properly and the values properly
    consolidate/conflict with values coming from other literal SET/FIELD_SET
    rules.
    
    Suggested-by: Gustavo Sousa <gustavo.sousa@intel.com>
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 18816557ad112c94f3bf5ee625cd862d8d3f41af drm-intel
f930e9c55f37 drm/xe: Reformat xe_rtp_types.h
4efb5f0f48b1 drm/xe/rtp: Add FIELD_SET_FUNC RTP action
-:80: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'mask_bits_' - possible side-effects?
#80: FILE: drivers/gpu/drm/xe/xe_rtp.h:339:
+#define XE_RTP_ACTION_FIELD_SET_FUNC(reg_, mask_bits_, func_, ...)		\
+	{ .reg = XE_RTP_DROP_CAST(reg_),					\
+	  .clr_bits = mask_bits_, .set_func = func_, .use_func = 1,		\
+	  .read_mask = mask_bits_, ##__VA_ARGS__ }

total: 0 errors, 0 warnings, 1 checks, 86 lines checked
a478fae17a45 drm/xe: Move engines' LRC programming RTP table off the stack
-:33: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#33: FILE: drivers/gpu/drm/xe/xe_hw_engine.c:346:
+static const struct xe_rtp_table_sr lrc_setup = XE_RTP_TABLE_SR(

total: 0 errors, 0 warnings, 1 checks, 70 lines checked
d678f9e92cfe drm/xe: Move engines' non-LRC programming RTP table off the stack
-:54: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#54: FILE: drivers/gpu/drm/xe/xe_hw_engine.c:413:
+static const struct xe_rtp_table_sr engine_sr = XE_RTP_TABLE_SR(

total: 0 errors, 0 warnings, 1 checks, 167 lines checked
ad0e71f48a59 drm/xe/rtp: Add kunit tests to exercise FIELD_SET_FUNC action
-:42: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#42: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:316:
+		.table = XE_RTP_TABLE_SR(

-:72: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#72: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:456:
+		.table = XE_RTP_TABLE_SR(

total: 0 errors, 0 warnings, 2 checks, 70 lines checked


