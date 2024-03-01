Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4C1C5478C
	for <intel-xe@archiver.kernel.org>; Fri,  1 Mar 2024 13:49:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE8410EE85;
	Fri,  1 Mar 2024 13:49:54 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CF2A10EE52;
 Fri,  1 Mar 2024 13:49:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915=3A_Convert_?=
 =?utf-8?q?fbdev_to_DRM_client?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 01 Mar 2024 13:49:53 -0000
Message-ID: <170930099305.435211.6787010870811739724@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240301134448.31289-1-tzimmermann@suse.de>
In-Reply-To: <20240301134448.31289-1-tzimmermann@suse.de>
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

Series: drm/i915: Convert fbdev to DRM client
URL   : https://patchwork.freedesktop.org/series/130615/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 320f2374b2d5 drm-tip: 2024y-03m-01d-09h-38m-26s UTC integration manifest
=== git am output follows ===
Applying: drm/client: Export drm_client_dev_unregister()
Applying: drm/i915: Unregister in-kernel clients
Applying: drm/i915: Move fbdev functions
Applying: drm/i915: Initialize fbdev DRM client with callback functions
Applying: drm/i915: Implement fbdev client callbacks
Applying: drm/i915: Implement fbdev emulation as in-kernel client


