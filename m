Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D2FC28B2F
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 19:28:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86DF710E0B5;
	Tue, 11 Mar 2025 19:28:49 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB31410E0B5;
 Tue, 11 Mar 2025 19:28:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915=3A_make_i91?=
 =?utf-8?q?5-=3Edisplay_opaque_pointer?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Mar 2025 19:28:47 -0000
Message-ID: <174172132782.21530.12459883653225290592@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <cover.1741712601.git.jani.nikula@intel.com>
In-Reply-To: <cover.1741712601.git.jani.nikula@intel.com>
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

Series: drm/i915: make i915->display opaque pointer
URL   : https://patchwork.freedesktop.org/series/146156/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 25eafce2a8ad drm-tip: 2025y-03m-11d-18h-52m-13s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/hdmi: remove inline to_i915()
Applying: drm/i915/hotplug: use container_of() to get struct intel_display
Applying: drm/i915: convert i915 and xe display members into pointers
Applying: drm/i915: scripted conversion to i915->display pointer
Applying: drm/i915: allocate struct intel_display dynamically
Applying: drm/i915: stop including display/intel_display_core.h from i915_drv.h
Applying: drm/xe: drop intel_display_core/device.h include from xe_device_types.h


