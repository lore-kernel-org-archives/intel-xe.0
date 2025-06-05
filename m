Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE340C5AE59
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 14:51:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF31410E08D;
	Thu,  5 Jun 2025 14:51:18 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA1110E08D;
 Thu,  5 Jun 2025 14:51:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915=2C_drm/xe?=
 =?utf-8?q?=3A_add_drm_device_based_pcode_interface_for_display?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Jun 2025 14:51:17 -0000
Message-ID: <174913507737.51837.9986197892448074382@1538d3639d33>
X-Patchwork-Hint: ignore
References: <cover.1749119274.git.jani.nikula@intel.com>
In-Reply-To: <cover.1749119274.git.jani.nikula@intel.com>
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

Series: drm/i915, drm/xe: add drm device based pcode interface for display
URL   : https://patchwork.freedesktop.org/series/149877/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: d5a5fd842902 drm-tip: 2025y-06m-05d-13h-00m-59s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/pcode: drop fast wait from snb_pcode_write_timeout()
Applying: drm/i915/pcode: add struct drm_device based interface
Applying: drm/xe/pcode: add struct drm_device based interface
Applying: drm/i915/display: switch to struct drm_device based pcode interface
Applying: drm/i915/dram: switch to struct drm_device based pcode interface
Applying: drm/xe/compat: remove old pcode compat interface


