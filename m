Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B4BC36008
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 08:12:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F367E10E558;
	Wed, 26 Mar 2025 08:12:36 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F62610E558;
 Wed, 26 Mar 2025 08:12:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe=3A_xe-only_pa?=
 =?utf-8?q?tches_from_the_multi-device_GPUSVM_series_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Mar 2025 08:12:35 -0000
Message-ID: <174297675564.4398.13627327968676048540@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250326080551.40201-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250326080551.40201-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: xe-only patches from the multi-device GPUSVM series (rev6)
URL   : https://patchwork.freedesktop.org/series/146383/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 14c330bc015d drm-tip: 2025y-03m-26d-04h-35m-02s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Introduce CONFIG_DRM_XE_GPUSVM
Applying: drm/xe/svm: Fix a potential bo UAF
Applying: drm/xe/bo: Add a bo remove callback
Applying: drm/xe/migrate: Allow xe_migrate_vram() also on non-pagefault capable devices
Applying: drm/xe: Make the PT code handle placement per PTE rather than per vma / range


