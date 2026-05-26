Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CAACD5BC8
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 19:33:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6087210E6F9;
	Tue, 26 May 2026 19:33:47 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 538C510E6EE;
 Tue, 26 May 2026 19:33:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/rtp=3A_WA_table_co?=
 =?utf-8?q?ntext_testing_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Violet Monti" <violet.monti@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 26 May 2026 19:33:45 -0000
Message-ID: <177982402533.11680.4231438866893234961@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260526173056.967215-6-violet.monti@intel.com>
In-Reply-To: <20260526173056.967215-6-violet.monti@intel.com>
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

Series: drm/xe/rtp: WA table context testing (rev4)
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
commit 5a55ce1f5b76a43d7ecc004e1f4ba4af188aa45c
Author: Violet Monti <violet.monti@intel.com>
Date:   Tue May 26 10:31:00 2026 -0700

    drm/xe/rtp: Ensure device_oob_was only evaluates correct rules
    
    This commit builds on the implementation of the GT WA testing, increasing
    the scope of testing to include the device OOB workaround list. As well
    as checking for XE_RTP_ENGINE_CLASS(), this test also checks for rules
    involving XE_RTP_GRAPHICS() and XE_RTP_MEDIA(), as well as their
    derivatives.
    
    This test will raise expectation fails for any workarounds in the
    device_oob_was list that has an invalid rule type, preventing evaluation
    or inclusion of rules that could be applied in the wrong context.
    
    v4:
        - No change
    
    v3:
        - Removed "VISIBLE_IF_KUNIT" keyword from xe_wa.h
        - Heavily reworked rule checking within _dev_oob_test() function for
          easier understanding and interpreting of errors
    
    v2:
        - Changed xe_rtp_table_dev_oob_test() to follow format of
          xe_rtp_table_gt_test
        - Changed device_oob_was generated params to follow format of
          gt_was
    
    Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
    Signed-off-by: Violet Monti <violet.monti@intel.com>
+ /mt/dim checkpatch 1e5fbf0d628cd02dced6cfb1ebe39717f121fb4c drm-intel
6498822b0d10 drm/xe/rtp: Add struct types for RTP tables
-:73: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#73: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:292:
+		.table = XE_RTP_TABLE_SR(

-:92: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#92: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:311:
+		.table = XE_RTP_TABLE_SR(

-:111: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#111: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:330:
+		.table = XE_RTP_TABLE_SR(

-:130: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#130: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:349:
+		.table = XE_RTP_TABLE_SR(

-:149: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#149: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:370:
+		.table = XE_RTP_TABLE_SR(

-:166: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#166: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:388:
+		.table = XE_RTP_TABLE_SR(

-:185: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#185: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:408:
+		.table = XE_RTP_TABLE_SR(

-:204: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#204: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:428:
+		.table = XE_RTP_TABLE_SR(

-:223: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#223: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:453:
+		.table = XE_RTP_TABLE_SR(

-:239: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#239: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:469:
+		.table = XE_RTP_TABLE_SR(

-:275: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#275: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:525:
+		.table = XE_RTP_TABLE(

-:287: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#287: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:534:
+		.table = XE_RTP_TABLE(

-:302: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#302: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:546:
+		.table = XE_RTP_TABLE(

-:317: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#317: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:558:
+		.table = XE_RTP_TABLE(

-:333: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#333: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:570:
+		.table = XE_RTP_TABLE(

-:351: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#351: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:586:
+		.table = XE_RTP_TABLE(

-:372: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#372: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:602:
+		.table = XE_RTP_TABLE(

-:389: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#389: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:618:
+		.table = XE_RTP_TABLE(

-:432: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#432: FILE: drivers/gpu/drm/xe/xe_hw_engine.c:349:
+	const struct xe_rtp_table_sr lrc_setup = XE_RTP_TABLE_SR(

-:454: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#454: FILE: drivers/gpu/drm/xe/xe_hw_engine.c:410:
+	const struct xe_rtp_table_sr engine_sr = XE_RTP_TABLE_SR(

-:480: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#480: FILE: drivers/gpu/drm/xe/xe_reg_whitelist.c:44:
+static const struct xe_rtp_table_sr register_whitelist = XE_RTP_TABLE_SR(

-:660: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#660: FILE: drivers/gpu/drm/xe/xe_tuning.c:23:
+static const struct xe_rtp_table_sr gt_tunings = XE_RTP_TABLE_SR(

-:672: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#672: FILE: drivers/gpu/drm/xe/xe_tuning.c:105:
+static const struct xe_rtp_table_sr engine_tunings = XE_RTP_TABLE_SR(

-:684: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#684: FILE: drivers/gpu/drm/xe/xe_tuning.c:134:
+static const struct xe_rtp_table_sr lrc_tunings = XE_RTP_TABLE_SR(

-:780: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#780: FILE: drivers/gpu/drm/xe/xe_wa.c:133:
+static const struct xe_rtp_table_sr gt_was = XE_RTP_TABLE_SR(

-:792: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#792: FILE: drivers/gpu/drm/xe/xe_wa.c:311:
+static const struct xe_rtp_table_sr engine_was = XE_RTP_TABLE_SR(

-:804: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#804: FILE: drivers/gpu/drm/xe/xe_wa.c:619:
+static const struct xe_rtp_table_sr lrc_was = XE_RTP_TABLE_SR(

-:850: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#850: FILE: drivers/gpu/drm/xe/xe_wa.c:835:
+	xe_rtp_process_ctx_enable_active_tracking(&ctx, xe->wa_active.oob, device_oob_was.n_entries);

total: 0 errors, 1 warnings, 27 checks, 840 lines checked
515a011a35a4 drm/xe/rtp: Ensure gt_was doesn't evaluate rules with engine types
-:58: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#58: 
new file mode 100644

-:76: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'table' - possible side-effects?
#76: FILE: drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c:14:
+#define RTP_TABLE_PARAM(table)									\
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

-:80: CHECK:SPACING: spaces preferred around that '*' (ctx:WxV)
#80: FILE: drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c:18:
+		typeof((table.entries)[0]) *__next = prev ?					\
 		                           ^

-:127: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#127: FILE: drivers/gpu/drm/xe/xe_tuning.c:23:
+VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_tunings = XE_RTP_TABLE_SR(

-:170: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#170: FILE: drivers/gpu/drm/xe/xe_wa.c:133:
+VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_was = XE_RTP_TABLE_SR(

total: 0 errors, 1 warnings, 4 checks, 124 lines checked
9fe0c9e2b8e6 drm/xe/rtp: Ensure oob_was does not evaluate engine type rules
5a55ce1f5b76 drm/xe/rtp: Ensure device_oob_was only evaluates correct rules


