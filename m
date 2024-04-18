Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCD3C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 23:44:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C422510F4AC;
	Thu, 18 Apr 2024 23:44:54 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A50A310F4F3;
 Thu, 18 Apr 2024 23:44:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_reg_read/wr?=
 =?utf-8?q?ite_trace?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Radhakrishna Sripada" <radhakrishna.sripada@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Apr 2024 23:44:53 -0000
Message-ID: <171348389367.1501116.2927532656038531812@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240418222243.3285041-1-radhakrishna.sripada@intel.com>
In-Reply-To: <20240418222243.3285041-1-radhakrishna.sripada@intel.com>
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

Series: drm/xe: Add reg read/write trace
URL   : https://patchwork.freedesktop.org/series/132626/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9858e33a836f10c429b48c683275ac187251a748
Author: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Date:   Thu Apr 18 15:22:43 2024 -0700

    drm/xe: Add reg read/write trace
    
    This will help debug register read/writes and provides
    a way to trace all the mmio transactions.
    
    Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
+ /mt/dim checkpatch cabe88f47c1f688f4493de88acc532bf584efe3c drm-intel
9858e33a836f drm/xe: Add reg read/write trace
-:88: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#88: FILE: drivers/gpu/drm/xe/xe_trace.h:625:
+TRACE_EVENT_CONDITION(xe_reg_rw,
+	TP_PROTO(bool write, u32 reg, u64 val, int len, bool trace),

-:94: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#94: FILE: drivers/gpu/drm/xe/xe_trace.h:631:
+	TP_STRUCT__entry(

-:101: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#101: FILE: drivers/gpu/drm/xe/xe_trace.h:638:
+	TP_fast_assign(

-:109: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#109: FILE: drivers/gpu/drm/xe/xe_trace.h:646:
+	TP_printk("%s reg=0x%x, len=%d, val=(0x%x, 0x%x)",
+		__entry->write ? "write" : "read",

total: 0 errors, 0 warnings, 4 checks, 95 lines checked


