Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15466D3C93E
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 05:52:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC21610E0A1;
	Mon, 21 Oct 2024 05:52:09 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C443E10E0A1;
 Mon, 21 Oct 2024 05:52:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe/sriov=3A_Don?=
 =?utf-8?q?=27t_migrate_dmabuf_BO_to_System_RAM_while_running_in_VM_=28rev2?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vivek Kasireddy" <vivek.kasireddy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 21 Oct 2024 05:52:08 -0000
Message-ID: <172948992879.1303073.10668465466168836060@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241021052236.1820329-1-vivek.kasireddy@intel.com>
In-Reply-To: <20241021052236.1820329-1-vivek.kasireddy@intel.com>
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

Series: drm/xe/sriov: Don't migrate dmabuf BO to System RAM while running in VM (rev2)
URL   : https://patchwork.freedesktop.org/series/139920/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: f6a9ad8c8480 drm-tip: 2024y-10m-21d-01h-17m-57s UTC integration manifest
=== git am output follows ===
Applying: PCI/P2PDMA: Don't enforce ACS check for functions of same device
Applying: drm/xe/dmabuf: Don't migrate BO to System RAM while running in VF mode
Applying: drm/xe/pf: Add a helper function to get a VF's backing object in LMEM
Applying: drm/xe/bo: Create new dma_addr array for dmabuf BOs associated with VFs
Applying: drm/xe/pt: Add an additional check for dmabuf BOs while updating PTEs


