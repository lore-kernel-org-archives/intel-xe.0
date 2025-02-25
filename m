Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C63C021BB
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 12:20:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2FDD10E665;
	Tue, 25 Feb 2025 12:20:01 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66D4410E665;
 Tue, 25 Feb 2025 12:20:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/dp=3A_Fix_link_t?=
 =?utf-8?q?raining_interrupted_by_HPD_pulse_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Feb 2025 12:20:00 -0000
Message-ID: <174048600041.1957558.18403435007445507978@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250224193115.2058512-1-imre.deak@intel.com>
In-Reply-To: <20250224193115.2058512-1-imre.deak@intel.com>
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

Series: drm/dp: Fix link training interrupted by HPD pulse (rev3)
URL   : https://patchwork.freedesktop.org/series/145353/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: d5debc4841e6 drm-tip: 2025y-02m-25d-10h-43m-41s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/hpd: Let an HPD pin be in the disabled state when handling missed IRQs
Applying: drm/i915/hpd: Add support for suspending the IRQ handling on an HPD pin
Applying: drm/i915/dp: Fix link training interrupted by a short HPD pulse
Applying: drm/i915/dp: Queue a link check after link training is complete
Applying: drm/i915/crt: Use intel_hpd_suspend/resume() instead of intel_hpd_disable/enable()


