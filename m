Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB9FC02198
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 21:51:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44ABF10E37B;
	Fri, 14 Feb 2025 21:51:36 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0576110E37B;
 Fri, 14 Feb 2025 21:51:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Cleanup_error_handli?=
 =?utf-8?q?ng_on_probe=2C_batch_2?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Feb 2025 21:51:35 -0000
Message-ID: <173956989501.2175198.8951513422609838143@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250214212313.1767562-1-lucas.demarchi@intel.com>
In-Reply-To: <20250214212313.1767562-1-lucas.demarchi@intel.com>
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

Series: Cleanup error handling on probe, batch 2
URL   : https://patchwork.freedesktop.org/series/144906/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: cbd747025a1e drm-tip: 2025y-02m-14d-20h-41m-39s UTC integration manifest
=== git am output follows ===
Applying: FOR-CI-ONLY: devres
Applying: drm/xe: Stop setting drvdata to NULL
Applying: drm/xe: Switch from xe to devm actions
Applying: drm/xe: Drop remove callback support
Applying: drm/xe/display: Drop xe_display_driver_remove()
Applying: drm/xe: Move survivability entirely to xe_pci
Applying: drm/xe: Stop ignoring errors from xe_heci_gsc_init()
Applying: drm/xe: Rename update_device_info() after sriov
Applying: drm/xe: Stop ignoring errors from xe_ttm_sys_mgr_init()


