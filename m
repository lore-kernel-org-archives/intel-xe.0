Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CADD68BEF
	for <intel-xe@archiver.kernel.org>; Sat, 16 Nov 2024 11:26:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB71F10E165;
	Sat, 16 Nov 2024 11:26:35 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E437410E165;
 Sat, 16 Nov 2024 11:26:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_TTM_shrinker_helpers?=
 =?utf-8?q?_and_xe_buffer_object_shrinker_=28rev14=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 16 Nov 2024 11:26:34 -0000
Message-ID: <173175639492.436711.7705489172793565064@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241115150120.3280-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20241115150120.3280-1-thomas.hellstrom@linux.intel.com>
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

Series: TTM shrinker helpers and xe buffer object shrinker (rev14)
URL   : https://patchwork.freedesktop.org/series/131815/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 9a7388467f79 drm-tip: 2024y-11m-16d-00h-00m-45s UTC integration manifest
=== git am output follows ===
Applying: drm/ttm: Balance ttm_resource_cursor_init() and ttm_resource_cursor_fini()
Applying: drm/ttm: Provide a shmem backup implementation
Applying: drm/ttm/pool: Provide a helper to shrink pages
Applying: drm/ttm: Use fault-injection to test error paths
Applying: drm/ttm: Add a macro to perform LRU iteration
Applying: drm/ttm: Add helpers for shrinking
Applying: drm/xe: Add a shrinker for xe bos
Applying: drm/xe: Increase the XE_PL_TT watermark


