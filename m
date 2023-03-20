Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17382C7618A
	for <intel-xe@archiver.kernel.org>; Mon, 20 Mar 2023 15:16:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E36BF10E59A;
	Mon, 20 Mar 2023 15:16:38 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1E31310E59A;
 Mon, 20 Mar 2023 15:16:38 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 161D4A66C9;
 Mon, 20 Mar 2023 15:16:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Mon, 20 Mar 2023 15:16:38 -0000
Message-ID: <167932539806.26306.9226992979116714868@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230320151334.60302-1-matthew.auld@intel.com>
In-Reply-To: <20230320151334.60302-1-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Some_small-bar_prep_patches_=28rev5=29?=
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

Series: Some small-bar prep patches (rev5)
URL   : https://patchwork.freedesktop.org/series/114521/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit a421aa4e2c63292e582cdb2c86539200c3074f0e
Author:     Matthew Auld <matthew.auld@intel.com>
AuthorDate: Tue Mar 14 08:58:40 2023 +0000
Commit:     Matthew Auld <matthew.auld@intel.com>
CommitDate: Mon Mar 20 09:09:35 2023 +0000

    drm/xe/buddy: remove the virtualized start
    
    Hopefully not needed anymore. We can add a .compatible() hook once we
    need to differentiate between mappable and non-mappable vram. If the
    allocation is not contiguous then the start value is kind of
    meaningless, so rather just mark as invalid.
    
    In upstream, TTM wants to eventually remove the ttm_resource.start
    usage.
    
    References: 544432703b2f ("drm/ttm: Add new callbacks to ttm res mgr")
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
=== git am output follows ===
Applying: drm/xe/buddy: add visible tracking
Applying: drm/xe/buddy: add compatible and intersects hooks


