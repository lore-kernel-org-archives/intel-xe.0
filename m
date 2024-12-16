Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C2FE7717F
	for <intel-xe@archiver.kernel.org>; Mon, 16 Dec 2024 16:38:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C92778926F;
	Mon, 16 Dec 2024 16:38:57 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BDB38926F;
 Mon, 16 Dec 2024 16:38:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_series_starting_with?=
 =?utf-8?q?_=5B1/7=5D_drm/xe=3A_use_backup_object_for_pinned_save/restore?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Dec 2024 16:38:57 -0000
Message-ID: <173436713743.3349364.145900536637902667@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241216162941.86070-8-matthew.auld@intel.com>
In-Reply-To: <20241216162941.86070-8-matthew.auld@intel.com>
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

Series: series starting with [1/7] drm/xe: use backup object for pinned save/restore
URL   : https://patchwork.freedesktop.org/series/142664/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 49cc582754c2 drm-tip: 2024y-12m-16d-16h-18m-45s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: use backup object for pinned save/restore
Applying: drm/xe: split pinned save/restore into phases
Applying: drm/xe: Add XE_BO_FLAG_PINNED_NORESTORE
Applying: drm/xe: add XE_BO_FLAG_PINNED_EARLY_RESTORE
Applying: drm/xe: unconditionally apply PINNED for pin_map()
Applying: drm/xe: allow non-contig VRAM kernel BO
Applying: drm/xe/sriov: support non-contig VRAM provisioning


