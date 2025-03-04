Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C01C021B8
	for <intel-xe@archiver.kernel.org>; Tue,  4 Mar 2025 16:22:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1153410E635;
	Tue,  4 Mar 2025 16:22:49 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF67210E635;
 Tue,  4 Mar 2025 16:22:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/dp=3A_Fix_l?=
 =?utf-8?q?ink_training_interrupted_by_HPD_pulse?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Mar 2025 16:22:46 -0000
Message-ID: <174110536697.670150.10383867252821825775@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250304152917.3407080-1-imre.deak@intel.com>
In-Reply-To: <20250304152917.3407080-1-imre.deak@intel.com>
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

Series: drm/i915/dp: Fix link training interrupted by HPD pulse
URL   : https://patchwork.freedesktop.org/series/145781/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 695fb2079be5 drm-tip: 2025y-03m-04d-15h-54m-18s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/hpd: Track HPD pins instead of ports for HPD pulse events
Applying: drm/i915/hpd: Let an HPD pin be in the disabled state when handling missed IRQs
Applying: drm/i915/hpd: Add support for blocking the IRQ handling on an HPD pin
Applying: drm/i915/dp: Fix link training interrupted by a short HPD pulse
Applying: drm/i915/dp: Queue a link check after link training is complete
Applying: drm/i915/crt: Use intel_hpd_block/unblock() instead of intel_hpd_disable/enable()


