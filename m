Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4323C3ABD8
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 13:19:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2DB710EABA;
	Fri, 16 May 2025 13:19:08 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2710D10EAB7;
 Fri, 16 May 2025 13:19:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915_=26_drm/xe?=
 =?utf-8?q?=3A_prep_work_towards_opaque_struct_intel=5Fdisplay?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 May 2025 13:19:07 -0000
Message-ID: <174740154715.88034.1644660628018889720@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <cover.1747397638.git.jani.nikula@intel.com>
In-Reply-To: <cover.1747397638.git.jani.nikula@intel.com>
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

Series: drm/i915 & drm/xe: prep work towards opaque struct intel_display
URL   : https://patchwork.freedesktop.org/series/149113/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 6d2dd85ba4eb drm-tip: 2025y-05m-16d-11h-14m-14s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/display: Add check for alloc_ordered_workqueue() and alloc_workqueue()
Applying: drm/xe/display: Add check for alloc_ordered_workqueue()
Applying: drm/xe/display: drop duplicate display->fb_tracking.lock init
Applying: drm/i915/display: move hotplug.dp_wq init from xe and i915 to display
Applying: drm/xe/display: move xe->display initialization to xe_display_probe()
Applying: drm/xe/display: add notes about how early a few functions can be called
Applying: drm/xe/display: use xe->display to decide whether to do anything


