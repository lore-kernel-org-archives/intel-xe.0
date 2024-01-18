Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D9AC4725D
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jan 2024 02:45:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298F310E10F;
	Thu, 18 Jan 2024 02:45:50 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1AE410E10F;
 Thu, 18 Jan 2024 02:45:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_XeKmd_basic_SVM_supp?=
 =?utf-8?q?ort?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Date: Thu, 18 Jan 2024 02:45:48 -0000
Message-ID: <170554594866.537692.9439975804954869234@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240117221223.18540-1-oak.zeng@intel.com>
In-Reply-To: <20240117221223.18540-1-oak.zeng@intel.com>
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

Series: XeKmd basic SVM support
URL   : https://patchwork.freedesktop.org/series/128910/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 2d422dec5 drm-tip: 2024y-01m-17d-23h-44m-17s UTC integration manifest
=== git am output follows ===
.git/rebase-apply/patch:167: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: drm/xe/svm: Add SVM document
Applying: drm/xe/svm: Add svm key data structures
Applying: drm/xe/svm: create xe svm during vm creation
Applying: drm/xe/svm: Trace svm creation
Applying: drm/xe/svm: add helper to retrieve svm range from address
Applying: drm/xe/svm: Introduce a helper to build sg table from hmm range
Applying: drm/xe/svm: Add helper for binding hmm range to gpu
Applying: drm/xe/svm: Add helper to invalidate svm range from GPU
Applying: drm/xe/svm: Remap and provide memmap backing for GPU vram
Applying: drm/xe/svm: Introduce svm migration function
Applying: drm/xe/svm: implement functions to allocate and free device memory
Applying: drm/xe/svm: Trace buddy block allocation and free
Applying: drm/xe/svm: Handle CPU page fault
Applying: drm/xe/svm: trace svm range migration
Applying: drm/xe/svm: Implement functions to register and unregister mmu notifier
Applying: drm/xe/svm: Implement the mmu notifier range invalidate callback
Applying: drm/xe/svm: clean up svm range during process exit
Applying: drm/xe/svm: Move a few structures to xe_gt.h
Applying: drm/xe/svm: migrate svm range to vram
Applying: drm/xe/svm: Populate svm range
Applying: drm/xe/svm: GPU page fault support
Applying: drm/xe/svm: Add DRM_XE_SVM kernel config entry
Applying: drm/xe/svm: Add svm memory hints interface


