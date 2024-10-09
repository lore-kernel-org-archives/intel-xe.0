Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4C4CEE354
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 21:47:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D7B10E81A;
	Wed,  9 Oct 2024 21:47:14 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2443C10E81A;
 Wed,  9 Oct 2024 21:47:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe=3A_Fix_HPD_in?=
 =?utf-8?q?terrupt_enabling_during_runtime_resume?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Oct 2024 21:47:13 -0000
Message-ID: <172851043314.1212463.13353335071986155654@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241009194358.1321200-1-imre.deak@intel.com>
In-Reply-To: <20241009194358.1321200-1-imre.deak@intel.com>
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

Series: drm/xe: Fix HPD interrupt enabling during runtime resume
URL   : https://patchwork.freedesktop.org/series/139812/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: e1aba2bf4f79 drm-tip: 2024y-10m-09d-20h-21m-55s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/dp: Assume panel power is off if runtime suspended
Applying: drm/i915/dp: Disable unnecessary HPD polling for eDP
Applying: drm/xe/display: Separate the d3cold and non-d3cold runtime PM handling
Applying: drm/xe/display: Add missing HPD interrupt enabling during non-d3cold RPM resume


