Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B578CA0ED3
	for <intel-xe@archiver.kernel.org>; Mon,  2 Sep 2024 18:05:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050BB10E397;
	Mon,  2 Sep 2024 18:05:52 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 249D010E396;
 Mon,  2 Sep 2024 18:05:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915_=26_drm/xe?=
 =?utf-8?q?=3A_shared_PCI_ID_macros?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Sep 2024 18:05:51 -0000
Message-ID: <172530035114.908003.8915041739566113100@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1725297097.git.jani.nikula@intel.com>
In-Reply-To: <cover.1725297097.git.jani.nikula@intel.com>
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

Series: drm/i915 & drm/xe: shared PCI ID macros
URL   : https://patchwork.freedesktop.org/series/138109/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: f68a30b6b56c drm-tip: 2024y-09m-02d-14h-33m-20s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/pciids: use designated initializers in INTEL_VGA_DEVICE()
Applying: drm/i915/pciids: separate ARL and MTL PCI IDs
Applying: drm/xe/pciids: add some missing ADL-N PCI IDs
Applying: drm/xe/pciids: separate RPL-U and RPL-P PCI IDs
Applying: drm/xe/pciids: separate ARL and MTL PCI IDs
Applying: drm/i915/pciids: add PVC PCI ID macros
Applying: drm/intel/pciids: rename i915_pciids.h to just pciids.h
Applying: drm/xe: switch to common PCI ID macros


