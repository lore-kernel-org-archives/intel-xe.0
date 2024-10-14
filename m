Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8384ACFC527
	for <intel-xe@archiver.kernel.org>; Mon, 14 Oct 2024 09:18:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F2A10E3FF;
	Mon, 14 Oct 2024 09:18:48 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6009810E3F9;
 Mon, 14 Oct 2024 09:18:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm=3A_Introduce_DRM?=
 =?utf-8?q?_client_library_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 14 Oct 2024 09:18:47 -0000
Message-ID: <172889752738.1247602.3296503428222647796@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241014085740.582287-1-tzimmermann@suse.de>
In-Reply-To: <20241014085740.582287-1-tzimmermann@suse.de>
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

Series: drm: Introduce DRM client library (rev4)
URL   : https://patchwork.freedesktop.org/series/139220/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 55d09c71b082 drm-tip: 2024y-10m-14d-09h-06m-35s UTC integration manifest
=== git am output follows ===
Applying: drm/i915: Select DRM_CLIENT_SELECTION
Applying: drm/xe: Select DRM_CLIENT_SELECTION
Applying: drm/fbdev-dma: Select FB_DEFERRED_IO
Applying: drm/fbdev: Select fbdev I/O helpers from modules that require them
Applying: drm/fbdev: Store fbdev module parameters in separate file
Applying: drm/client: Move client event handlers to drm_client_event.c
Applying: drm/client: Move suspend/resume into DRM client callbacks
Applying: drm/amdgpu: Suspend and resume internal clients with client helpers
Applying: drm/nouveau: Suspend and resume clients with client helpers
Applying: drm/radeon: Suspend and resume clients with client helpers
Applying: drm/client: Make client support optional
Applying: drm/client: Add client-lib module


