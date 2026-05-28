Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A60CD4F54
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 16:44:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE42210F48B;
	Thu, 28 May 2026 16:44:06 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0555410F48A;
 Thu, 28 May 2026 16:44:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/rtp=3A_WA_table_co?=
 =?utf-8?q?ntext_testing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Violet Monti" <violet.monti@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 28 May 2026 16:44:05 -0000
Message-ID: <177998664501.21109.7747791445654515823@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260528163531.834721-6-violet.monti@intel.com>
In-Reply-To: <20260528163531.834721-6-violet.monti@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/167474/
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
commit bf58016cc091d76f5b22fb99c38bf539501b5a32
Author: Violet Monti <violet.monti@intel.com>
Date:   Thu May 28 09:35:35 2026 -0700

    drm/xe/rtp: Ensure device_oob_was only evaluates correct rules
    
    This commit builds on the implementation of the GT WA testing, increasing
    the scope of testing to include the device OOB workaround list. As well
    as checking for XE_RTP_ENGINE_CLASS(), this test also checks for rules
    involving XE_RTP_GRAPHICS() and XE_RTP_MEDIA(), as well as their
    derivatives.
    
    This test will raise expectation fails for any workarounds in the
    device_oob_was list that has an invalid rule type, preventing evaluation
    or inclusion of rules that could be applied in the wrong context.
    
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
+ /mt/dim checkpatch e19995339d7cc4965c37a6cf9f4c64793147b6f8 drm-intel
a0a614d40bce drm/xe/rtp: Add struct types for RTP tables
-:76: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#76: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:292:
+		.table = XE_RTP_TABLE_SR(

-:95: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#95: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:311:
+		.table = XE_RTP_TABLE_SR(

-:114: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#114: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:330:
+		.table = XE_RTP_TABLE_SR(

-:133: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#133: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:349:
+		.table = XE_RTP_TABLE_SR(

-:152: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#152: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:370:
+		.table = XE_RTP_TABLE_SR(

-:169: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#169: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:388:
+		.table = XE_RTP_TABLE_SR(

-:188: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#188: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:408:
+		.table = XE_RTP_TABLE_SR(

-:207: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#207: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:428:
+		.table = XE_RTP_TABLE_SR(

-:226: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#226: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:453:
+		.table = XE_RTP_TABLE_SR(

-:242: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#242: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:469:
+		.table = XE_RTP_TABLE_SR(

-:278: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#278: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:525:
+		.table = XE_RTP_TABLE(

-:290: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#290: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:534:
+		.table = XE_RTP_TABLE(

-:305: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#305: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:546:
+		.table = XE_RTP_TABLE(

-:320: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#320: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:558:
+		.table = XE_RTP_TABLE(

-:335: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#335: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:570:
+		.table = XE_RTP_TABLE(

-:351: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#351: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:585:
+		.table = XE_RTP_TABLE(

-:391: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#391: FILE: drivers/gpu/drm/xe/xe_hw_engine.c:349:
+	const struct xe_rtp_table_sr lrc_setup = XE_RTP_TABLE_SR(

-:413: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#413: FILE: drivers/gpu/drm/xe/xe_hw_engine.c:410:
+	const struct xe_rtp_table_sr engine_sr = XE_RTP_TABLE_SR(

-:439: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#439: FILE: drivers/gpu/drm/xe/xe_reg_whitelist.c:44:
+static const struct xe_rtp_table_sr register_whitelist = XE_RTP_TABLE_SR(

-:619: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#619: FILE: drivers/gpu/drm/xe/xe_tuning.c:23:
+static const struct xe_rtp_table_sr gt_tunings = XE_RTP_TABLE_SR(

-:631: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#631: FILE: drivers/gpu/drm/xe/xe_tuning.c:105:
+static const struct xe_rtp_table_sr engine_tunings = XE_RTP_TABLE_SR(

-:643: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#643: FILE: drivers/gpu/drm/xe/xe_tuning.c:134:
+static const struct xe_rtp_table_sr lrc_tunings = XE_RTP_TABLE_SR(

-:739: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#739: FILE: drivers/gpu/drm/xe/xe_wa.c:133:
+static const struct xe_rtp_table_sr gt_was = XE_RTP_TABLE_SR(

-:751: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#751: FILE: drivers/gpu/drm/xe/xe_wa.c:311:
+static const struct xe_rtp_table_sr engine_was = XE_RTP_TABLE_SR(

-:763: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#763: FILE: drivers/gpu/drm/xe/xe_wa.c:619:
+static const struct xe_rtp_table_sr lrc_was = XE_RTP_TABLE_SR(

-:809: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#809: FILE: drivers/gpu/drm/xe/xe_wa.c:835:
+	xe_rtp_process_ctx_enable_active_tracking(&ctx, xe->wa_active.oob, device_oob_was.n_entries);

total: 0 errors, 1 warnings, 25 checks, 794 lines checked
e48f3af92b91 drm/xe/rtp: Ensure gt_was doesn't evaluate rules with engine types
-:61: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#61: 
new file mode 100644

-:77: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'table' - possible side-effects?
#77: FILE: drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c:12:
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

-:81: CHECK:SPACING: spaces preferred around that '*' (ctx:WxV)
#81: FILE: drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c:16:
+		typeof((table.entries)[0]) *__next = prev ?					\
 		                           ^

-:128: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#128: FILE: drivers/gpu/drm/xe/xe_tuning.c:23:
+VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_tunings = XE_RTP_TABLE_SR(

-:171: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#171: FILE: drivers/gpu/drm/xe/xe_wa.c:133:
+VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_was = XE_RTP_TABLE_SR(

total: 0 errors, 1 warnings, 4 checks, 122 lines checked
b04bbe6df927 drm/xe/rtp: Ensure oob_was does not evaluate engine type rules
bf58016cc091 drm/xe/rtp: Ensure device_oob_was only evaluates correct rules


