Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D52C4829A
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 05:29:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A8610E7FD;
	Tue, 13 Feb 2024 05:29:12 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0299310E288;
 Tue, 13 Feb 2024 05:29:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_fdinfo_shared_stats_?=
 =?utf-8?q?=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alex Deucher" <alexander.deucher@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 Feb 2024 05:29:10 -0000
Message-ID: <170780215099.1183349.17621012248944698173@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240212210428.851952-1-alexander.deucher@amd.com>
In-Reply-To: <20240212210428.851952-1-alexander.deucher@amd.com>
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

Series: fdinfo shared stats (rev3)
URL   : https://patchwork.freedesktop.org/series/129322/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: e370df7a4 drm-tip: 2024y-02m-13d-04h-59m-00s UTC integration manifest
=== git am output follows ===
Applying: Documentation/gpu: Update documentation on drm-shared-*
Applying: drm: add drm_gem_object_is_shared_for_memory_stats() helper
Applying: drm: update drm_show_memory_stats() for dma-bufs
Applying: drm/amdgpu: add shared fdinfo stats
Applying: drm/i915: Update shared stats to use the new gem helper
Applying: drm/xe: Update shared stats to use the new gem helper


