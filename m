Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B906BC07D5A
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 20:26:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5710310E137;
	Mon, 27 Nov 2023 20:26:27 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id C82C210E12F;
 Mon, 27 Nov 2023 20:26:24 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C0872A0003;
 Mon, 27 Nov 2023 20:26:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Date: Mon, 27 Nov 2023 20:26:24 -0000
Message-ID: <170111678476.3004.12095131131893150351@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231127190935.3150610-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20231127190935.3150610-1-juhapekka.heikkila@gmail.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_revert_local_patches_and_cherrypick_same_patches_from_drm-ti?=
 =?utf-8?q?p?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: revert local patches and cherrypick same patches from drm-tip
URL   : https://patchwork.freedesktop.org/series/126944/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 7cd1cacf1 drm/xe: Sync MTL PCI IDs with i915
=== git am output follows ===
Applying: Revert "drm/i915/display: In intel_framebuffer_init switch to use intel_bo_to_drm_bo"
Applying: Revert "drm/i915/display: in skl_surf_address check for dpt-vma"
Applying: Revert "drm/i915/display: Separate xe and i915 common dpt code into own file"
Applying: drm/i915/display: In intel_framebuffer_init switch to use intel_bo_to_drm_bo
Applying: drm/i915/display: in skl_surf_address check for dpt-vma
Applying: drm/i915/display: Separate xe and i915 common dpt code into own file


