Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A85C4345F
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 03:52:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5686E10F10F;
	Mon,  6 May 2024 03:52:41 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C5010EBEE;
 Mon,  6 May 2024 03:52:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Use_ordered_WQ_?=
 =?utf-8?q?for_G2H_handler?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 May 2024 03:52:39 -0000
Message-ID: <171496755940.1939177.1607803179692420537@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240506034758.3697397-1-matthew.brost@intel.com>
In-Reply-To: <20240506034758.3697397-1-matthew.brost@intel.com>
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

Series: drm/xe: Use ordered WQ for G2H handler
URL   : https://patchwork.freedesktop.org/series/133210/
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
commit 281c3f3270b5f5590a5e07f3dd684c39e7231312
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Sun May 5 20:47:58 2024 -0700

    drm/xe: Use ordered WQ for G2H handler
    
    System work queues are shared, use a dedicated work queue for G2H
    processing to avoid G2H processing getting block behind system tasks.
    
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Cc: <stable@vger.kernel.org>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch ca96a1c62451ea534391d1eafe3a0b5691658c02 drm-intel
281c3f3270b5 drm/xe: Use ordered WQ for G2H handler
-:30: ERROR:SPACING: space required before the open parenthesis '('
#30: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:151:
+	if(!ct->g2h_wq)

total: 1 errors, 0 warnings, 0 checks, 33 lines checked


