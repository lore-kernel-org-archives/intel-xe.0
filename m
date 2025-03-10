Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60661C282DE
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 22:57:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DDE610E4E3;
	Mon, 10 Mar 2025 22:57:03 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8FCB10E43B;
 Mon, 10 Mar 2025 22:57:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe=3A_GT_initial?=
 =?utf-8?q?ization_rework=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Mar 2025 22:57:02 -0000
Message-ID: <174164742268.16215.12904863076772538044@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250310200653.89731-1-dev@lankhorst.se>
In-Reply-To: <20250310200653.89731-1-dev@lankhorst.se>
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

Series: drm/xe: GT initialization rework.
URL   : https://patchwork.freedesktop.org/series/146106/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 9afa34d65af6 drm-tip: 2025y-03m-10d-21h-48m-41s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Defer memirq init until needed
Applying: drm/xe/sriov: Move VF bootstrap and query_config to vf_guc_init
Applying: drm/xe: Simplify GuC early initialization
Applying: drm/xe: Make it possible to read instance0 MCR registers after xe_gt_mcr_init_early
Applying: drm/xe: Only dump PAT when xe_hw_engines_init_early fails
Applying: drm/xe/gt: Inline gt_fw_domain_init
Applying: drm/xe/gt: Inline all_fw_domain_init
Applying: drm/xe: Split init of xe_gt_init_hwconfig to xe_gt_init and *_early


