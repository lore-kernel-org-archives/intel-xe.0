Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2389DD1A42C
	for <intel-xe@archiver.kernel.org>; Sat, 12 Oct 2024 03:16:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E727B10E03B;
	Sat, 12 Oct 2024 03:16:01 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC9C10E03B;
 Sat, 12 Oct 2024 03:16:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe/sriov=3A_Don?=
 =?utf-8?q?=27t_migrate_dmabuf_BO_to_System_RAM_while_running_in_VM?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vivek Kasireddy" <vivek.kasireddy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 12 Oct 2024 03:16:00 -0000
Message-ID: <172870296018.1243042.10998330254950520152@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241012024524.1377836-1-vivek.kasireddy@intel.com>
In-Reply-To: <20241012024524.1377836-1-vivek.kasireddy@intel.com>
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

Series: drm/xe/sriov: Don't migrate dmabuf BO to System RAM while running in VM
URL   : https://patchwork.freedesktop.org/series/139920/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 8dcf653f89ac drm-tip: 2024y-10m-12d-02h-54m-18s UTC integration manifest
=== git am output follows ===
Applying: PCI/P2PDMA: Don't enforce ACS check for functions of same device
Applying: drm/xe/dmabuf: Don't migrate BO to System RAM while running in VF mode
Applying: drm/xe/pf: Add a helper function to get a VF's starting address in LMEM
Applying: drm/xe/bo: Create a new sg for dmabuf BOs that are associated with a VF
Applying: drm/xe/pt: Add an additional check for dmabuf BOs while updating PTEs


