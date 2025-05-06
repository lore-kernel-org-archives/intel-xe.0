Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA1DC3ABBC
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 21:48:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F28910E356;
	Tue,  6 May 2025 21:48:15 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5529E10E119;
 Tue,  6 May 2025 21:48:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe/ggtt=3A_Stop_?=
 =?utf-8?q?relying_on_GGTT_internals=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 May 2025 21:48:14 -0000
Message-ID: <174656809433.52693.3426475261064353112@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250505121924.921544-1-dev@lankhorst.se>
In-Reply-To: <20250505121924.921544-1-dev@lankhorst.se>
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

Series: drm/xe/ggtt: Stop relying on GGTT internals. (rev2)
URL   : https://patchwork.freedesktop.org/series/148602/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 842c3c276c10 drm-tip: 2025y-05m-06d-15h-34m-18s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Use xe_ggtt_map_bo_unlocked for resume
Applying: drm/xe: Add xe_ggtt_might_lock
Applying: drm/xe: Add xe_ggtt_alloc
Applying: drm/xe/display: Remove dereferences of ggtt for tile id
Applying: drm/xe/ggtt: Seperate flags and address in PTE encoding
Applying: drm/xe/display: Dont poke into GGTT internals to fill a DPT
Applying: drm/xe/display: Convert GGTT mapping to use pte_encode_flags
Applying: drm/xe: Remove pte_encode_bo callback
Applying: drm/xe: Implement a helper for reading out a GGTT PTE at a specified offset
Applying: drm/xe: Do not rely on GGTT internals in xe_guc_buf kunit tests


