Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93ABCC55165
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 23:40:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D15C10F0EE;
	Thu, 30 Jul 2026 23:40:58 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A0810F0EE;
 Thu, 30 Jul 2026 23:40:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Modify_the_SW_tail_logic_?=
 =?utf-8?q?in_OA?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 Jul 2026 23:40:57 -0000
Message-ID: <178545485732.7120.681739571553227459@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260730233539.3140839-5-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20260730233539.3140839-5-umesh.nerlige.ramappa@intel.com>
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

Series: Modify the SW tail logic in OA
URL   : https://patchwork.freedesktop.org/series/171393/
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
commit b5fb8627c25d6efb30a2f55a1c0322dbb687e0e6
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date:   Thu Jul 30 16:35:43 2026 -0700

    drm/xe/xe_oa: Add a lag to the reports that is exported to user
    
    When running heavy workloads, reading the OA reports too soon does not
    guarantee that the report has landed in memory. To make sure correct
    reports are copied to user buffer, only return reports that lag the
    current HW_TAIL register by 32 reports. This is an empirical number
    based on a heavy render workload and several test iterations.
    
    Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
+ /mt/dim checkpatch 374d957e1908042c257b8c239974317bb93b83dc drm-intel
97dc81da4dec drm/xe/xe_oa: Clear status only if relevant bits are set
87e4114a7f45 drm/xe/xe_oa: Avoid checking and setting fields in the OA report
b5fb8627c25d drm/xe/xe_oa: Add a lag to the reports that is exported to user
-:48: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#48: FILE: drivers/gpu/drm/xe/xe_oa.c:250:
+		stream->oa_buffer.tail = xe_oa_circ_diff(stream, hw_tail, LAG_REPORTS * report_size);

total: 0 errors, 1 warnings, 0 checks, 31 lines checked


