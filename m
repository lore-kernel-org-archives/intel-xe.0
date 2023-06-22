Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FEEEB64DA
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jun 2023 16:29:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D87210E5A5;
	Thu, 22 Jun 2023 16:29:51 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5432310E58B;
 Thu, 22 Jun 2023 16:29:49 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 50D31A7DFF;
 Thu, 22 Jun 2023 16:29:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alan Previn" <alan.previn.teres.alexis@intel.com>
Date: Thu, 22 Jun 2023 16:29:49 -0000
Message-ID: <168745138932.4869.14482857357284380230@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230622162714.396367-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20230622162714.396367-1-alan.previn.teres.alexis@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe/guc=3A_Fix_h2g=5Fwrite_usage_of_GUC=5FCTB=5FMSG=5FMAX=5FLE?=
 =?utf-8?q?N_=28rev2=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe/guc: Fix h2g_write usage of GUC_CTB_MSG_MAX_LEN (rev2)
URL   : https://patchwork.freedesktop.org/series/118799/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0d2d9fd98c73437f6b517aee28cc0d020c18c2fb
Author: Alan Previn <alan.previn.teres.alexis@intel.com>
Date:   Thu Jun 22 09:27:14 2023 -0700

    drm/xe/guc: Fix h2g_write usage of GUC_CTB_MSG_MAX_LEN
    
    In the ABI header, GUC_CTB_MSG_MIN_LEN is '1' because
    GUC_CTB_HDR_LEN is 1. This aligns with H2G/G2H CTB specification
    where all command formats are defined in units of dwords so that '1'
    is a dword. Accordingly, GUC_CTB_MSG_MAX_LEN is 256-1 (i.e. 255
    dwords). However, h2g_write was incorrectly assuming that
    GUC_CTB_MSG_MAX_LEN was in bytes. Fix this.
    
    v2: By correctly treating GUC_CTB_MSG_MAX_LEN as dwords, it causes
        a local array to consume 4x the stack size. Rework the function
        to avoid consuming stack even if the action size is large.
    
    Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
+ /mt/dim checkpatch 4287d7a61a8f6b40e4f99055870b1239d8439050 drm-intel
0d2d9fd98 drm/xe/guc: Fix h2g_write usage of GUC_CTB_MSG_MAX_LEN
-:42: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#42: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:415:
+	XE_BUG_ON(len > (GUC_CTB_MSG_MAX_LEN - H2G_CT_HEADERS));

total: 0 errors, 1 warnings, 0 checks, 65 lines checked


