Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E03CD4F21
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 21:28:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3CF510F086;
	Wed, 13 May 2026 21:28:04 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5ED10E09B;
 Wed, 13 May 2026 21:28:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/rtp=3A_WA_table_co?=
 =?utf-8?q?ntext_testing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Violet Monti" <violet.monti@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 May 2026 21:28:03 -0000
Message-ID: <177870768381.69473.13413522077393827053@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260513212129.691628-6-violet.monti@intel.com>
In-Reply-To: <20260513212129.691628-6-violet.monti@intel.com>
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
commit b71066a2036f142d874bb90cf35a6befb429b129
Author: Violet Monti <violet.monti@intel.com>
Date:   Wed May 13 14:21:28 2026 -0700

    drm/xe/rtp: Add Device OOB WA checks
    
    This commit builds on the implementation of the GT WA testing, increasing
    the scope of testing to include the device OOB workaround list. The added
    test checks for workarounds with an engine_class rule, and raises an
    expectation failure if any are found. Unlike the GT workarounds, there are
    no flags within this workaround list, so all engine_class rules will fail.
    The device OOB is also more strict, and requires IP rules to be
    invalidated as well (MEDIA_* and GRAPHICS_* rules).
    
    This test prevents future implementation of rules that would go against
    known contexts for the workarounds implementations.
    
    Signed-off-by: Violet Monti <violet.monti@intel.com>
+ /mt/dim checkpatch e54a14bbf920aa5eefc70aba9927482ebe630f8b drm-intel
cb1de8c6512a drm/xe/rtp: Add struct types for RTP tables
-:62: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#62: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:72:
+		.table = XE_RTP_TABLE_SR(

-:81: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#81: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:91:
+		.table = XE_RTP_TABLE_SR(

-:100: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#100: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:109:
+		.table = XE_RTP_TABLE_SR(

-:117: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#117: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:134:
+		.table = XE_RTP_TABLE_SR(

-:136: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#136: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:162:
+		.table = XE_RTP_TABLE_SR(

-:155: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#155: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:181:
+		.table = XE_RTP_TABLE_SR(

-:174: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#174: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:200:
+		.table = XE_RTP_TABLE_SR(

-:193: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#193: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:221:
+		.table = XE_RTP_TABLE_SR(

-:210: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#210: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:239:
+		.table = XE_RTP_TABLE_SR(

-:229: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#229: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:259:
+		.table = XE_RTP_TABLE_SR(

-:248: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#248: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:279:
+		.table = XE_RTP_TABLE_SR(

-:287: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#287: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:344:
+		.table = XE_RTP_TABLE(

-:299: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#299: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:353:
+		.table = XE_RTP_TABLE(

-:314: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#314: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:365:
+		.table = XE_RTP_TABLE(

-:329: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#329: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:377:
+		.table = XE_RTP_TABLE(

-:344: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#344: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:389:
+		.table = XE_RTP_TABLE(

-:360: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#360: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:405:
+		.table = XE_RTP_TABLE(

-:376: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#376: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:421:
+		.table = XE_RTP_TABLE(

-:392: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#392: FILE: drivers/gpu/drm/xe/tests/xe_rtp_test.c:437:
+		.table = XE_RTP_TABLE(

-:432: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#432: FILE: drivers/gpu/drm/xe/xe_hw_engine.c:349:
+	const struct xe_rtp_table_sr lrc_setup = XE_RTP_TABLE_SR(

-:454: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#454: FILE: drivers/gpu/drm/xe/xe_hw_engine.c:399:
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

total: 0 errors, 1 warnings, 28 checks, 844 lines checked
8b777509aaab drm/xe/rtp: Add GT WAs rule checking
-:35: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#35: 
new file mode 100644

-:130: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'array' - possible side-effects?
#130: FILE: drivers/gpu/drm/xe/tests/xe_rtp_tables_test.h:9:
+#define RTP_KUNIT_ARRAY_PARAM(name, array, get_desc)						\
+	static const void *name##_gen_params(struct kunit *test,				\
+					     const void *prev, char *desc)			\
+	{											\
+		typeof((array.entries)[0]) *__next = prev ?					\
+			((typeof(__next))prev) + 1 : (array.entries);				\
+		if (!prev)									\
+			kunit_register_params_array(test, array.entries, array.n_entries, NULL);\
+		if (__next - array.entries < array.n_entries) {					\
+			void (*__get_desc)(typeof(__next), char *) = get_desc;			\
+			if (__get_desc)								\
+				__get_desc(__next, desc);					\
+			return __next;								\
+		}										\
+		return NULL;									\
+	}

-:134: CHECK:SPACING: spaces preferred around that '*' (ctx:WxV)
#134: FILE: drivers/gpu/drm/xe/tests/xe_rtp_tables_test.h:13:
+		typeof((array.entries)[0]) *__next = prev ?					\
 		                           ^

-:155: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#155: FILE: drivers/gpu/drm/xe/xe_wa.c:133:
+VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_was = XE_RTP_TABLE_SR(

total: 0 errors, 1 warnings, 3 checks, 131 lines checked
4d5f0225e78a drm/xe/rtp: Add OOB WAs rule checking
b71066a2036f drm/xe/rtp: Add Device OOB WA checks


