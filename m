Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8AF0C00A8F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Oct 2023 13:07:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7627110E3B6;
	Tue, 24 Oct 2023 13:07:53 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2D88F10E3B1;
 Tue, 24 Oct 2023 13:07:52 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 2B3F1AADED;
 Tue, 24 Oct 2023 13:07:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: maarten@mblankhorst.nl, "lankhorst <maarten.lankhorst"@linux.intel.com
Date: Tue, 24 Oct 2023 13:07:52 -0000
Message-ID: <169815287217.18360.12331002782774082964@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231024122256.19512-1-dev@lankhorst.se>
In-Reply-To: <20231024122256.19512-1-dev@lankhorst.se>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Implement_snapshot_support=2E?=
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

Series: drm/xe: Implement snapshot support.
URL   : https://patchwork.freedesktop.org/series/125506/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 82ea2ccae574db0f9aa1d5c56ed71535918328f0
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Tue Oct 24 14:22:56 2023 +0200

    drm/xe: Implement VM snapshot support
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 4354e27efb78582ee567ba6264c79d0872a3a4e7 drm-intel
f53a8b500 drm/xe: Add uapi for dumpable bos
-:65: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Maarten Lankhorst <dev@lankhorst.se>' != 'Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>'

total: 0 errors, 1 warnings, 0 checks, 38 lines checked
30f2231d5 drm/xe: Annotate each dumpable vma as such
7cc731109 drm/xe: Add vm snapshot mutex for easily taking a vm snapshot during devcoredump
82ea2ccae drm/xe: Implement VM snapshot support
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:78: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u64' over 'uint64_t'
#78: FILE: drivers/gpu/drm/xe/xe_vm.c:3336:
+		uint64_t ofs, bo_ofs;

-:157: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#157: FILE: drivers/gpu/drm/xe/xe_vm.c:3415:
+			uint32_t *x = snap->snap[i].data + j;

-:160: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#160: FILE: drivers/gpu/drm/xe/xe_vm.c:3418:
+				   snap->snap[i].ofs + j, x[0], x[1], x[2], x[3], x[4], x[5], x[6], x[7],

total: 0 errors, 2 warnings, 2 checks, 165 lines checked


