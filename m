Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2576DC25B10
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 18:17:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C2210E34F;
	Fri, 10 May 2024 18:17:40 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0026C10E34F;
 Fri, 10 May 2024 18:17:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_core=5Fhotunplug_imp?=
 =?utf-8?q?rovements?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 10 May 2024 18:17:40 -0000
Message-ID: <171536506000.2056703.5442057585590767779@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240510181212.264622-22-matthew.auld@intel.com>
In-Reply-To: <20240510181212.264622-22-matthew.auld@intel.com>
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

Series: core_hotunplug improvements
URL   : https://patchwork.freedesktop.org/series/133462/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: afd593c3e9f9 drm-tip: 2024y-05m-10d-17h-57m-52s UTC integration manifest
=== git am output follows ===
Applying: drm/drm_managed: try to improve the drmm DOC
Applying: drm/amdgpu: don't trample pdev drvdata
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


