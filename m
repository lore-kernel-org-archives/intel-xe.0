Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D4FC25B76
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 03:28:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A1610E445;
	Wed,  5 Jun 2024 03:28:02 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78F110E687;
 Wed,  5 Jun 2024 03:28:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Xe_+_TTM_bo_shrinker?=
 =?utf-8?q?_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Hellstrom" <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Jun 2024 03:28:00 -0000
Message-ID: <171755808063.2266944.17954045195978101042@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240604144658.69890-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240604144658.69890-1-thomas.hellstrom@linux.intel.com>
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

Series: Xe + TTM bo shrinker (rev2)
URL   : https://patchwork.freedesktop.org/series/134426/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 596cf447db94 drm-tip: 2024y-06m-04d-20h-11m-26s UTC integration manifest
=== git am output follows ===
Applying: drm/ttm: Allow TTM LRU list nodes of different types
Applying: drm/ttm: Slightly clean up LRU list iteration
Applying: drm/ttm: Use LRU hitches
Applying: drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within bulk sublist moves
Applying: drm/ttm: Provide a generic LRU walker helper
Applying: drm/ttm: Use the LRU walker helper for swapping
Applying: drm/ttm: Use the LRU walker for eviction
Applying: drm/ttm: Add a virtual base class for graphics memory backup
Applying: drm/ttm/pool: Provide a helper to shrink pages
Applying: drm/ttm: Use fault-injection to test error paths
Applying: drm/ttm, drm/xe: Add a shrinker for xe bos


