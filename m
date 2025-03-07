Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 705DEC19F32
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 20:51:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118AE10EA6F;
	Fri,  7 Mar 2025 20:51:27 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCAFA10E192;
 Fri,  7 Mar 2025 20:51:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Improve_SRIOV_VRAM_p?=
 =?utf-8?q?rovisioning_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Mar 2025 20:51:25 -0000
Message-ID: <174138068575.3691.6107006108470580147@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250307182856.304850-10-matthew.auld@intel.com>
In-Reply-To: <20250307182856.304850-10-matthew.auld@intel.com>
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

Series: Improve SRIOV VRAM provisioning (rev2)
URL   : https://patchwork.freedesktop.org/series/142782/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: f811577f4244 drm-tip: 2025y-03m-07d-17h-25m-46s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: use backup object for pinned save/restore
Applying: drm/xe: split pinned save/restore into phases
Applying: drm/xe: Add XE_BO_FLAG_PINNED_NORESTORE
Applying: drm/xe/migrate: ignore CCS for kernel objects
Applying: drm/xe: add XE_BO_FLAG_PINNED_LATE_RESTORE
Applying: drm/xe: unconditionally apply PINNED for pin_map()
Applying: drm/xe: allow non-contig VRAM kernel BO
Applying: drm/xe/sriov: support non-contig VRAM provisioning


