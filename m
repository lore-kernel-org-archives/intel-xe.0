Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32792C6FD1D
	for <intel-xe@archiver.kernel.org>; Thu, 23 Mar 2023 12:02:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E761B10EA78;
	Thu, 23 Mar 2023 12:02:38 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 54F1310EA78;
 Thu, 23 Mar 2023 12:02:37 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 4A727AADD6;
 Thu, 23 Mar 2023 12:02:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Thu, 23 Mar 2023 12:02:37 -0000
Message-ID: <167957295730.6627.18384040263837190121@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230323115926.391900-1-matthew.auld@intel.com>
In-Reply-To: <20230323115926.391900-1-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_uAPI_bits_for_small-bar_=28rev2=29?=
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

Series: uAPI bits for small-bar (rev2)
URL   : https://patchwork.freedesktop.org/series/115515/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit 1ef8e1917e1c949d6f69589e07c12122ed665c7d
Author:     Matthew Auld <matthew.auld@intel.com>
AuthorDate: Wed Mar 22 10:35:45 2023 +0000
Commit:     Matthew Auld <matthew.auld@intel.com>
CommitDate: Thu Mar 23 09:45:39 2023 +0000

    drm/xe/gt: some error handling fixes
    
    Make sure we pass along the correct errors.
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
=== git am output follows ===
Applying: drm/xe: add XE_BO_CREATE_VRAM_MASK
Applying: drm/xe/bo: refactor try_add_vram
Applying: drm/xe/query: restrict system wide accounting
Applying: drm/xe/bo: support tiered vram allocation for small-bar
Applying: drm/xe/uapi: add the userspace bits for small-bar
Applying: drm/xe: fully turn on small-bar support


