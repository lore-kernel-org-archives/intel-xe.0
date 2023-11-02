Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C1CC4332F
	for <intel-xe@archiver.kernel.org>; Thu,  2 Nov 2023 04:27:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB0510E7F9;
	Thu,  2 Nov 2023 04:27:25 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1492E88BE3;
 Thu,  2 Nov 2023 04:27:24 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 0BA29AADF0;
 Thu,  2 Nov 2023 04:27:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Date: Thu, 02 Nov 2023 04:27:24 -0000
Message-ID: <169889924401.28160.8158803642218827776@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231102043306.2931989-1-oak.zeng@intel.com>
In-Reply-To: <20231102043306.2931989-1-oak.zeng@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_Introduce_drm_evictable_lru?=
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

Series: Introduce drm evictable lru
URL   : https://patchwork.freedesktop.org/series/125879/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: ff616f1d0 drm/xe/xe2: Program correct MOCS registers
=== git am output follows ===
error: patch failed: drivers/gpu/drm/xe/xe_bo.c:946
error: drivers/gpu/drm/xe/xe_bo.c: patch does not apply
error: patch failed: include/drm/drm_device.h:326
error: include/drm/drm_device.h: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch
Applying: drm/ttm: re-parameter ttm_device_init
Applying: drm: move lru_lock from ttm_device to drm_device
Patch failed at 0002 drm: move lru_lock from ttm_device to drm_device
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


