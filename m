Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893ABECE57A
	for <intel-xe@archiver.kernel.org>; Mon,  9 Sep 2024 12:22:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5527F10E50B;
	Mon,  9 Sep 2024 12:22:07 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354A510E50B;
 Mon,  9 Sep 2024 12:22:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/pps=3A_hide?=
 =?utf-8?q?_VLV/CHV_PPS_pipe_stuff_inside_intel=5Fpps=2Ec?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 09 Sep 2024 12:22:06 -0000
Message-ID: <172588452621.975780.37408190235696261@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1725883885.git.jani.nikula@intel.com>
In-Reply-To: <cover.1725883885.git.jani.nikula@intel.com>
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

Series: drm/i915/pps: hide VLV/CHV PPS pipe stuff inside intel_pps.c
URL   : https://patchwork.freedesktop.org/series/138403/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 36d222030253 drm-tip: 2024y-09m-09d-10h-39m-21s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/pps: add vlv_ prefix to pps_pipe and active_pipe members
Applying: drm/i915/pps: only touch the vlv_ members on VLV/CHV
Applying: drm/i915/pps: add vlv_pps_pipe_init()
Applying: drm/i915/pps: add vlv_pps_pipe_reset()
Applying: drm/i915/pps: add vlv_pps_port_disable()
Applying: drm/i915/pps: rename vlv_pps_init() to vlv_pps_port_enable()
Applying: drm/i915/pps: add vlv_pps_backlight_initial_pipe()
Applying: drm/i915/pps: move vlv_active_pipe() to intel_pps.c


