Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33F0C25B79
	for <intel-xe@archiver.kernel.org>; Mon, 20 May 2024 15:51:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A9510E46F;
	Mon, 20 May 2024 15:51:36 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D32F010E46F;
 Mon, 20 May 2024 15:51:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_series_starting_with?=
 =?utf-8?q?_=5BCI=2Cv2=2C01/18=5D_drm/xe/pci=3A_remove_broken_driver=5Frelea?=
 =?utf-8?q?se?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 20 May 2024 15:51:34 -0000
Message-ID: <171622029486.2160454.7751178825089035153@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240520154249.52888-19-matthew.auld@intel.com>
In-Reply-To: <20240520154249.52888-19-matthew.auld@intel.com>
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

Series: series starting with [CI,v2,01/18] drm/xe/pci: remove broken driver_release
URL   : https://patchwork.freedesktop.org/series/133819/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 1ba62f8cea9c drm-tip: 2024y-05m-20d-04h-37m-14s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/pci: remove broken driver_release
Applying: drm/xe: covert sysfs over to devm
Applying: drm/xe/ggtt: use drm_dev_enter to mark device section
Applying: drm/xe/guc: move guc_fini over to devm
Applying: drm/xe/guc: s/guc_fini/guc_fini_hw/
Applying: drm/xe/guc_pc: move pc_fini to devm
Applying: drm/xe/guc_pc: s/pc_fini/pc_fini_hw/
Applying: drm/xe/irq: move irq_uninstall over to devm
Applying: drm/xe/device: move flr to devm
Applying: drm/xe/device: move xe_device_sanitize over to devm
Applying: drm/xe/coredump: move over to devm
Applying: drm/xe/gt: break out gt_fini into sw vs hw state
Applying: drm/xe: make gt_remove use devm
Applying: drm/xe/mmio: move mmio_fini over to devm
Applying: drm/xe: reset mmio mappings with devm
Applying: drm/xe/display: move display fini stuff to devm
Applying: drm/xe/display: stop calling domains_driver_remove twice
Applying: drm/xe/display: move device_remove over to drmm


