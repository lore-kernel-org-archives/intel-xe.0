Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC40EC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 21:19:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 739F910E9CC;
	Mon, 15 Apr 2024 21:19:11 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 395E110E9C1;
 Mon, 15 Apr 2024 21:19:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Enable_device_atomic?=
 =?utf-8?q?s_with_a_VM_bind_flag_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Apr 2024 21:19:10 -0000
Message-ID: <171321595023.1424088.2792934000125736054@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240415145214.25641-1-nirmoy.das@intel.com>
In-Reply-To: <20240415145214.25641-1-nirmoy.das@intel.com>
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

Series: Enable device atomics with a VM bind flag (rev3)
URL   : https://patchwork.freedesktop.org/series/132290/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 7bc330055f5c drm-tip: 2024y-04m-15d-20h-48m-49s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Introduce has_atomic_enable_pte_bit device info
Applying: drm/xe: Consolidate setting PTE_AE into one place
Applying: drm/xe: Add function to check if BO has single placement
Applying: drm/xe: Move vm bind bo validation to a helper function
Applying: drm/xe: Introduce has_device_atomics_on_smem device info
Applying: drm/xe/uapi: Introduce VMA bind flag for device atomics
Applying: drm/xe/uapi: Add a query flag for has_device_atomics_on_smem


