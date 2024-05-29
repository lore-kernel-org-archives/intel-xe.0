Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D8EC27C43
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 01:14:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D0B10E4AC;
	Wed, 29 May 2024 01:14:46 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 281E710E4AC;
 Wed, 29 May 2024 01:14:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_series_starting_with?=
 =?utf-8?q?_=5BCI=2Cv3=2C01/26=5D_mm/hmm=3A_let_users_to_tag_specific_PFNs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 May 2024 01:14:45 -0000
Message-ID: <171694528516.2229880.14914195190886859167@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240529011924.4125173-1-oak.zeng@intel.com>
In-Reply-To: <20240529011924.4125173-1-oak.zeng@intel.com>
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

Series: series starting with [CI,v3,01/26] mm/hmm: let users to tag specific PFNs
URL   : https://patchwork.freedesktop.org/series/134167/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: c148f6df1b62 drm-tip: 2024y-05m-28d-22h-13m-38s UTC integration manifest
=== git am output follows ===
error: patch failed: include/linux/dma-map-ops.h:428
error: include/linux/dma-map-ops.h: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: mm/hmm: let users to tag specific PFNs
Applying: dma-mapping: provide an interface to allocate IOVA
Applying: dma-mapping: provide callbacks to link/unlink pages to specific IOVA
Patch failed at 0003 dma-mapping: provide callbacks to link/unlink pages to specific IOVA
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


