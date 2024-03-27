Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2967C47DD9
	for <intel-xe@archiver.kernel.org>; Wed, 27 Mar 2024 19:25:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE7710F2E3;
	Wed, 27 Mar 2024 19:25:24 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 029F310F2E3;
 Wed, 27 Mar 2024 19:25:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_series_starting_with?=
 =?utf-8?q?_=5BCI-test=2C1/8=5D_drm=3A_Add_drm=5Fvblank=5Fwork=5Fflush=5Fall?=
 =?utf-8?q?=28=29=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 27 Mar 2024 19:25:24 -0000
Message-ID: <171156752401.1060333.7816216045221495205@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240327190710.2359-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240327190710.2359-1-maarten.lankhorst@linux.intel.com>
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

Series: series starting with [CI-test,1/8] drm: Add drm_vblank_work_flush_all().
URL   : https://patchwork.freedesktop.org/series/131706/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 5e11d8eaccbd drm-tip: 2024y-03m-27d-18h-33m-19s UTC integration manifest
=== git am output follows ===
Applying: drm: Add drm_vblank_work_flush_all().
Applying: drm/i915: Use vblank worker to unpin old legacy cursor fb safely
Applying: drm/i915: Use the same vblank worker for atomic unpin
Applying: drm/xe: Fix bo leak in intel_fb_bo_framebuffer_init
Applying: drm/xe/display: Preparations for preallocating dpt bo
Applying: drm/xe: Use simple xchg to cache DPT
Applying: drm/xe/display: Prevent overwriting original GGTT when taking over initial FB.
Applying: drm/xe/display: Re-use display vmas when possible


