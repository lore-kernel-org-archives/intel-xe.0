Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA2CD767F6
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 18:15:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37EF110E03D;
	Thu, 31 Oct 2024 18:15:38 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF2010E03D;
 Thu, 31 Oct 2024 18:15:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Fix_non-contiguous_V?=
 =?utf-8?q?RAM_BO_access_in_Xe_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 31 Oct 2024 18:15:37 -0000
Message-ID: <173039853704.1385523.3368003349161397150@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241031181048.2948948-1-matthew.brost@intel.com>
In-Reply-To: <20241031181048.2948948-1-matthew.brost@intel.com>
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

Series: Fix non-contiguous VRAM BO access in Xe (rev6)
URL   : https://patchwork.freedesktop.org/series/140200/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: b8c3c871a2df drm-tip: 2024y-10m-31d-16h-11m-56s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Add xe_bo_vm_access
Applying: drm/ttm: Add ttm_bo_access
Applying: drm/xe: Add xe_ttm_access_memory
Applying: drm/xe: Take PM ref in delayed snapshot capture worker
Applying: drm/xe/display: Update intel_bo_read_from_page to use ttm_bo_access
Applying: drm/xe: Use ttm_bo_access in xe_vm_snapshot_capture_delayed
Applying: drm/xe: Set XE_BO_FLAG_PINNED in migrate selftest BOs
Applying: drm/xe: Only allow contiguous BOs to use xe_bo_vmap


