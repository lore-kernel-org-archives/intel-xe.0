Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99177C76195
	for <intel-xe@archiver.kernel.org>; Mon, 27 Mar 2023 12:51:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7399510E5A0;
	Mon, 27 Mar 2023 12:51:34 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id ED72410E5A0;
 Mon, 27 Mar 2023 12:51:31 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E53FEAADD7;
 Mon, 27 Mar 2023 12:51:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Mon, 27 Mar 2023 12:51:31 -0000
Message-ID: <167992149191.32630.10996317998172869836@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230327124807.54459-1-matthew.auld@intel.com>
In-Reply-To: <20230327124807.54459-1-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_uAPI_bits_for_small-bar_=28rev3=29?=
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

Series: uAPI bits for small-bar (rev3)
URL   : https://patchwork.freedesktop.org/series/115515/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit fdb2bd142dd74a0f04b000399f5bce18e9a551e7
Author:     Matthew Auld <matthew.auld@intel.com>
AuthorDate: Thu Mar 23 11:59:22 2023 +0000
Commit:     Matthew Auld <matthew.auld@intel.com>
CommitDate: Mon Mar 27 09:54:18 2023 +0100

    drm/xe/bo: refactor try_add_vram
    
    Get rid of some of the duplication here. In a future patch we need to
    also consider [fpfn, lpfn], so better adjust in only one place.
    
    Suggested-by: José Roberto de Souza <jose.souza@intel.com>
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
    Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
=== git am output follows ===
Applying: drm/xe/uapi: restrict system wide accounting
Applying: drm/xe/uapi: add some kernel-doc for region query
Applying: drm/xe/bo: support tiered vram allocation for small-bar
Applying: drm/xe/uapi: add the userspace bits for small-bar
Applying: drm/xe: fully turn on small-bar support


