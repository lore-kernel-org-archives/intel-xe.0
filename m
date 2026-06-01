Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACDECD5BD1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 21:14:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FDEB10E9B0;
	Mon,  1 Jun 2026 21:14:00 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C92A510E9B0;
 Mon,  1 Jun 2026 21:13:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/rtp=3A_WA_table_co?=
 =?utf-8?q?ntext_testing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Violet Monti" <violet.monti@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 01 Jun 2026 21:13:59 -0000
Message-ID: <178034843981.32261.12331267856514219429@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260601200947.2032784-6-violet.monti@intel.com>
In-Reply-To: <20260601200947.2032784-6-violet.monti@intel.com>
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

Series: drm/xe/rtp: WA table context testing
URL   : https://patchwork.freedesktop.org/series/167692/
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
commit d53165acd971f8acaa517449231bcb38651c9467
Author: Violet Monti <violet.monti@intel.com>
Date:   Mon Jun 1 13:09:50 2026 -0700

    drm/xe/rtp: Ensure device_oob_was only evaluates correct rules
    
    This commit builds on the implementation of the GT WA testing, increasing
    the scope of testing to include the device OOB workaround list. As well
    as checking for XE_RTP_ENGINE_CLASS(), this test also checks for rules
    involving XE_RTP_GRAPHICS() and XE_RTP_MEDIA(), as well as their
    derivatives.
    
    This test will raise expectation fails for any workarounds in the
    device_oob_was list that has an invalid rule type, preventing evaluation
    or inclusion of rules that could be applied in the wrong context.
    
    v6:
        - No change
    
    v5:
        - No change
    
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
+ /mt/dim checkpatch 4b57b105843615beabfbc703c5b38445edac8a1a drm-intel
da36a300f807 drm/xe/rtp: Add struct types for RTP tables
-:80: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#80: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:292:
+		.table = XE_RTP_TABLE_SR(

-:99: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#99: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:311:
+		.table = XE_RTP_TABLE_SR(

-:118: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#118: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:330:
+		.table = XE_RTP_TABLE_SR(

-:137: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#137: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:349:
+		.table = XE_RTP_TABLE_SR(

-:156: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#156: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:370:
+		.table = XE_RTP_TABLE_SR(

-:173: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#173: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:388:
+		.table = XE_RTP_TABLE_SR(

-:192: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#192: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:408:
+		.table = XE_RTP_TABLE_SR(

-:211: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#211: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:428:
+		.table = XE_RTP_TABLE_SR(

-:230: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#230: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:453:
+		.table = XE_RTP_TABLE_SR(

-:246: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#246: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:468:
+		.table = XE_RTP_TABLE_SR(

-:282: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#282: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:523:
+		.table = XE_RTP_TABLE(

-:294: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#294: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:532:
+		.table = XE_RTP_TABLE(

-:309: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#309: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:544:
+		.table = XE_RTP_TABLE(

-:324: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#324: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:556:
+		.table = XE_RTP_TABLE(

-:339: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#339: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:568:
+		.table = XE_RTP_TABLE(

-:355: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#355: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:583:
+		.table = XE_RTP_TABLE(

-:395: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#395: FILE: drivers/gpu/drm/xe/xe_hw_engine.c:349:
+	const struct xe_rtp_table_sr lrc_setup = XE_RTP_TABLE_SR(

-:417: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#417: FILE: drivers/gpu/drm/xe/xe_hw_engine.c:410:
+	const struct xe_rtp_table_sr engine_sr = XE_RTP_TABLE_SR(

-:443: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#443: FILE: drivers/gpu/drm/xe/xe_reg_whitelist.c:44:
+static const struct xe_rtp_table_sr register_whitelist = XE_RTP_TABLE_SR(

-:623: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#623: FILE: drivers/gpu/drm/xe/xe_tuning.c:23:
+static const struct xe_rtp_table_sr gt_tunings = XE_RTP_TABLE_SR(

-:635: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#635: FILE: drivers/gpu/drm/xe/xe_tuning.c:105:
+static const struct xe_rtp_table_sr engine_tunings = XE_RTP_TABLE_SR(

-:647: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#647: FILE: drivers/gpu/drm/xe/xe_tuning.c:134:
+static const struct xe_rtp_table_sr lrc_tunings = XE_RTP_TABLE_SR(

-:743: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#743: FILE: drivers/gpu/drm/xe/xe_wa.c:133:
+static const struct xe_rtp_table_sr gt_was = XE_RTP_TABLE_SR(

-:755: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#755: FILE: drivers/gpu/drm/xe/xe_wa.c:311:
+static const struct xe_rtp_table_sr engine_was = XE_RTP_TABLE_SR(

-:767: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#767: FILE: drivers/gpu/drm/xe/xe_wa.c:619:
+static const struct xe_rtp_table_sr lrc_was = XE_RTP_TABLE_SR(

-:813: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#813: FILE: drivers/gpu/drm/xe/xe_wa.c:835:
+	xe_rtp_process_ctx_enable_active_tracking(&ctx, xe->wa_active.oob, device_oob_was.n_entries);

total: 0 errors, 1 warnings, 25 checks, 794 lines checked
9568d8a548f9 drm/xe/rtp: Ensure gt_was doesn't evaluate rules with engine types
-:65: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#65: 
new file mode 100644

-:81: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'table' - possible side-effects?
#81: FILE: drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c:12:
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

-:85: CHECK:SPACING: spaces preferred around that '*' (ctx:WxV)
#85: FILE: drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c:16:
+		typeof((table.entries)[0]) *__next = prev ?					\
 		                           ^

-:132: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#132: FILE: drivers/gpu/drm/xe/xe_tuning.c:23:
+VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_tunings = XE_RTP_TABLE_SR(

-:175: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#175: FILE: drivers/gpu/drm/xe/xe_wa.c:133:
+VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_was = XE_RTP_TABLE_SR(

total: 0 errors, 1 warnings, 4 checks, 122 lines checked
85e3c2af729f drm/xe/rtp: Ensure oob_was does not evaluate engine type rules
d53165acd971 drm/xe/rtp: Ensure device_oob_was only evaluates correct rules


