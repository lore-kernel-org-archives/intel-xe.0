Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C914C6FD1F
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 18:45:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A5110FEDE;
	Wed, 20 Mar 2024 18:45:48 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B69C810FEDE;
 Wed, 20 Mar 2024 18:45:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_series_starting_with?=
 =?utf-8?q?_=5BCI=2C1/8=5D_drm/xe/svm=3A_Remap_and_provide_memmap_backing_fo?=
 =?utf-8?q?r_GPU_vram?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 20 Mar 2024 18:45:46 -0000
Message-ID: <171096034674.921315.10927073895091313370@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240320184542.2239076-1-oak.zeng@intel.com>
In-Reply-To: <20240320184542.2239076-1-oak.zeng@intel.com>
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

Series: series starting with [CI,1/8] drm/xe/svm: Remap and provide memmap backing for GPU vram
URL   : https://patchwork.freedesktop.org/series/131381/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: f4d4df0d10d2 drm-tip: 2024y-03m-20d-18h-14m-19s UTC integration manifest
=== git am output follows ===
.git/rebase-apply/patch:182: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
.git/rebase-apply/patch:251: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: drm/xe/svm: Remap and provide memmap backing for GPU vram
Applying: drm/xe/svm: Introduce DRM_XE_SVM kernel config
Applying: drm/xe: Introduce helper to get tile from memory region
Applying: drm/xe: Introduce a helper to get dpa from pfn
Applying: drm/xe/svm: Get xe memory region from page
Applying: drm/xe: Introduce helper to populate userptr
Applying: drm/xe: Introduce a helper to free sg table
Applying: drm/xe: Use hmm_range_fault to populate user pages


