Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0995EC52D6F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 19:53:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD5DA10E5B1;
	Wed,  7 Aug 2024 19:53:45 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43FA810E5AF;
 Wed,  7 Aug 2024 19:53:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915=3A_Fix_NULL?=
 =?utf-8?q?_ptr_deref_in_intel=5Fasync=5Fflip=5Fcheck=5Fuapi=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ma Ke" <make24@iscas.ac.cn>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 07 Aug 2024 19:53:44 -0000
Message-ID: <172306042427.547558.3957972294749893964@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240806092249.2407555-1-make24@iscas.ac.cn>
In-Reply-To: <20240806092249.2407555-1-make24@iscas.ac.cn>
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

Series: drm/i915: Fix NULL ptr deref in intel_async_flip_check_uapi()
URL   : https://patchwork.freedesktop.org/series/137006/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 4f5d551409fb drm-tip: 2024y-08m-07d-12h-38m-22s UTC integration manifest
=== git am output follows ===
Applying: drm/i915: Fix NULL ptr deref in intel_async_flip_check_uapi()


