Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C91CD4F54
	for <intel-xe@archiver.kernel.org>; Tue, 19 May 2026 19:40:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2CF710E0B6;
	Tue, 19 May 2026 19:40:01 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C96510E0B6;
 Tue, 19 May 2026 19:40:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/rtp=3A_WA_table_co?=
 =?utf-8?q?ntext_testing_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Violet Monti" <violet.monti@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 19 May 2026 19:40:00 -0000
Message-ID: <177921960024.88514.2372211737272619998@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260519193216.546048-6-violet.monti@intel.com>
In-Reply-To: <20260519193216.546048-6-violet.monti@intel.com>
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

Series: drm/xe/rtp: WA table context testing (rev2)
URL   : https://patchwork.freedesktop.org/series/166549/
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
commit eb477b3f3d3fbd99ba884d82b73a439787528565
Author: Violet Monti <violet.monti@intel.com>
Date:   Tue May 19 12:32:16 2026 -0700

    drm/xe/rtp: Ensure device_oob_was only evaluates correct rules
    
    This commit builds on the implementation of the GT WA testing, increasing
    the scope of testing to include the device OOB workaround list. As well
    as checking for XE_RTP_ENGINE_CLASS(), this test also checks for rules
    involving XE_RTP_GRAPHICS() and XE_RTP_MEDIA(), as well as their
    derivatives.
    
    This test will raise expectation fails for any workarounds in the
    device_oob_was list that has an invalid rule type, preventing evaluation
    or inclusion of rules that could be applied in the wrong context.
    
    v2:
        - Changed xe_rtp_table_dev_oob_test() to follow format of
          xe_rtp_table_gt_test
        - Changed device_oob_was generated params to follow format of
          gt_was
    
    Signed-off-by: Violet Monti <violet.monti@intel.com>
+ /mt/dim checkpatch 81e61a51364beae8f6e63a2d89c776a6b4b323fe drm-intel
77f5ffbb8246 drm/xe/rtp: Add struct types for RTP tables
-:67: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#67: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:95:
+		.table = XE_RTP_TABLE_SR(

-:86: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#86: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:114:
+		.table = XE_RTP_TABLE_SR(

-:105: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#105: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:132:
+		.table = XE_RTP_TABLE_SR(

-:122: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#122: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:157:
+		.table = XE_RTP_TABLE_SR(

-:141: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#141: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:185:
+		.table = XE_RTP_TABLE_SR(

-:160: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#160: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:204:
+		.table = XE_RTP_TABLE_SR(

-:179: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#179: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:223:
+		.table = XE_RTP_TABLE_SR(

-:198: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#198: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:244:
+		.table = XE_RTP_TABLE_SR(

-:215: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#215: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:262:
+		.table = XE_RTP_TABLE_SR(

-:234: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#234: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:282:
+		.table = XE_RTP_TABLE_SR(

-:253: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#253: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:302:
+		.table = XE_RTP_TABLE_SR(

-:272: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#272: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:327:
+		.table = XE_RTP_TABLE_SR(

-:288: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#288: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:343:
+		.table = XE_RTP_TABLE_SR(

-:324: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#324: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:399:
+		.table = XE_RTP_TABLE(

-:336: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#336: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:408:
+		.table = XE_RTP_TABLE(

-:351: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#351: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:420:
+		.table = XE_RTP_TABLE(

-:366: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#366: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:432:
+		.table = XE_RTP_TABLE(

-:381: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#381: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:444:
+		.table = XE_RTP_TABLE(

-:397: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#397: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:460:
+		.table = XE_RTP_TABLE(

-:413: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#413: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:476:
+		.table = XE_RTP_TABLE(

-:429: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#429: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:492:
+		.table = XE_RTP_TABLE(

-:469: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#469: FILE: drivers/gpu/drm/xe/xe_hw_engine.c:349:
+	const struct xe_rtp_table_sr lrc_setup = XE_RTP_TABLE_SR(

-:491: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#491: FILE: drivers/gpu/drm/xe/xe_hw_engine.c:410:
+	const struct xe_rtp_table_sr engine_sr = XE_RTP_TABLE_SR(

-:517: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#517: FILE: drivers/gpu/drm/xe/xe_reg_whitelist.c:44:
+static const struct xe_rtp_table_sr register_whitelist = XE_RTP_TABLE_SR(

-:697: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#697: FILE: drivers/gpu/drm/xe/xe_tuning.c:23:
+static const struct xe_rtp_table_sr gt_tunings = XE_RTP_TABLE_SR(

-:709: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#709: FILE: drivers/gpu/drm/xe/xe_tuning.c:105:
+static const struct xe_rtp_table_sr engine_tunings = XE_RTP_TABLE_SR(

-:721: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#721: FILE: drivers/gpu/drm/xe/xe_tuning.c:134:
+static const struct xe_rtp_table_sr lrc_tunings = XE_RTP_TABLE_SR(

-:817: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#817: FILE: drivers/gpu/drm/xe/xe_wa.c:133:
+static const struct xe_rtp_table_sr gt_was = XE_RTP_TABLE_SR(

-:829: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#829: FILE: drivers/gpu/drm/xe/xe_wa.c:311:
+static const struct xe_rtp_table_sr engine_was = XE_RTP_TABLE_SR(

-:841: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#841: FILE: drivers/gpu/drm/xe/xe_wa.c:619:
+static const struct xe_rtp_table_sr lrc_was = XE_RTP_TABLE_SR(

-:887: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#887: FILE: drivers/gpu/drm/xe/xe_wa.c:835:
+	xe_rtp_process_ctx_enable_active_tracking(&ctx, xe->wa_active.oob, device_oob_was.n_entries);

total: 0 errors, 1 warnings, 30 checks, 874 lines checked
28b7ab0b8d14 drm/xe/rtp: Ensure gt_was doesn't evaluate rules with engine types
-:46: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#46: 
new file mode 100644

-:69: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'table' - possible side-effects?
#69: FILE: drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c:19:
+#define RTP_TABLE_PARAM(table)						\
+	static const void *table##_gen_params(struct kunit *test,				\
+					     const void *prev, char *desc)			\
+	{											\
+		typeof((table.entries)[0]) *__next = prev ?					\
+			((typeof(__next))prev) + 1 : (table.entries);				\
+		if (__next - table.entries < table.n_entries) {					\
+			scnprintf(desc, KUNIT_PARAM_DESC_SIZE, #table "/%s", __next->name);	\
+			return __next;								\
+		}										\
+		return NULL;									\
+	}

-:73: CHECK:SPACING: spaces preferred around that '*' (ctx:WxV)
#73: FILE: drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c:23:
+		typeof((table.entries)[0]) *__next = prev ?					\
 		                           ^

-:115: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#115: FILE: drivers/gpu/drm/xe/xe_wa.c:133:
+VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_was = XE_RTP_TABLE_SR(

total: 0 errors, 1 warnings, 3 checks, 93 lines checked
9656308489e0 drm/xe/rtp: Ensure oob_was does not evaluate engine type rules
-:9: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
checks for workarounds with XE_RTP_ENGINE_CLASS() rules and raises an expectation

total: 0 errors, 1 warnings, 0 checks, 40 lines checked
eb477b3f3d3f drm/xe/rtp: Ensure device_oob_was only evaluates correct rules
-:42: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#42: FILE: drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c:66:
+				  entry->rules[i].match_type != XE_RTP_MATCH_GRAPHICS_VERSION_RANGE &&

-:43: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#43: FILE: drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c:67:
+				  entry->rules[i].match_type != XE_RTP_MATCH_GRAPHICS_VERSION_ANY_GT &&

total: 0 errors, 2 warnings, 0 checks, 49 lines checked


