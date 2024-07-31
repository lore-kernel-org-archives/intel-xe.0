Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B275C3DA7F
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 12:29:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D024010E601;
	Wed, 31 Jul 2024 12:29:04 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A7FD10E60F;
 Wed, 31 Jul 2024 12:29:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm=3A_Use_backlight?=
 =?utf-8?q?_power_constants?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 31 Jul 2024 12:29:03 -0000
Message-ID: <172242894349.467369.3659812155401313193@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240731122311.1143153-1-tzimmermann@suse.de>
In-Reply-To: <20240731122311.1143153-1-tzimmermann@suse.de>
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

Series: drm: Use backlight power constants
URL   : https://patchwork.freedesktop.org/series/136738/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 2a74e6714291 drm-tip: 2024y-07m-31d-11h-13m-40s UTC integration manifest
=== git am output follows ===
Applying: drm/amdgpu: Use backlight power constants
Applying: drm/i915: Use backlight power constants
Applying: drm/panel: panel-novatak-nt35510: Use backlight power constants
Applying: drm/panel: panel-orisetech-otm8009a: Use backlight power constants
Applying: drm/panel: panel-samsung-s6e63j0x03: Use backlight power constants
Applying: drm/panel: panel-samsung-s6e3ha2: Use backlight power constants
Applying: drm/panel: panel-sony-acx565akm: Use backlight power constants
Applying: drm/radeon: Use backlight power constants
Applying: drm/tilcdc: Use backlight power constants


