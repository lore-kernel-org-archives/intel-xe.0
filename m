Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83EA4C6FD1D
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 22:35:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EDB510E8C9;
	Tue, 14 Mar 2023 22:35:28 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 011F410E8C2;
 Tue, 14 Mar 2023 22:35:27 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E5A51A47DF;
 Tue, 14 Mar 2023 22:35:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Tue, 14 Mar 2023 22:35:26 -0000
Message-ID: <167883332690.26415.2563783745138906780@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230312155953.1566-1-michal.wajdeczko@intel.com>
In-Reply-To: <20230312155953.1566-1-michal.wajdeczko@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_drm/xe=3A_Promote_guc=5Fto=5Fgt/xe_helpers_to_=2Eh_=28rev2?=
 =?utf-8?q?=29?=
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

Series: drm/xe: Promote guc_to_gt/xe helpers to .h (rev2)
URL   : https://patchwork.freedesktop.org/series/115038/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit 8e9f9b64b5fbdfa0aa3630e5f11a683e40e51105
Author:     Matthew Auld <matthew.auld@intel.com>
AuthorDate: Tue Mar 14 08:58:38 2023 +0000
Commit:     Matthew Auld <matthew.auld@intel.com>
CommitDate: Tue Mar 14 10:31:41 2023 +0000

    drm/xe: add xe_ttm_stolen_cpu_access_needs_ggtt()
    
    xe_ttm_stolen_cpu_inaccessible() was originally meant to just cover the
    case where stolen is not directly CPU accessible on some older
    integrated platforms, and as such a GGTT mapping was also required for
    CPU access (as per the check in xe_bo_create_pin_map_at()).
    
    However with small-bar systems on dgfx we have one more case where
    stolen is also inaccessible, however here we don't have any fallback
    GGTT mode for CPU access. Fix the check in xe_bo_create_pin_map_at() to
    make this distinction clear. In such a case the later vmap() will fail
    anyway.
    
    v2: fix kernel-doc warning
    v3: Simplify further and remove cpu_inaccessible()
    
    Suggested-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
    Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
=== git am output follows ===
Applying: drm/xe: Promote guc_to_gt/xe helpers to .h


