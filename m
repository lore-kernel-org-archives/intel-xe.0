Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E52BC28B30
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 11:15:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E7810E5EE;
	Thu, 20 Mar 2025 11:15:05 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF1310E5EE;
 Thu, 20 Mar 2025 11:15:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_PCI=3A_VF_resizable_?=
 =?utf-8?q?BAR_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Mar 2025 11:15:03 -0000
Message-ID: <174246930319.57426.1692600033953333585@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250320110854.3866284-1-michal.winiarski@intel.com>
In-Reply-To: <20250320110854.3866284-1-michal.winiarski@intel.com>
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

Series: PCI: VF resizable BAR (rev5)
URL   : https://patchwork.freedesktop.org/series/138887/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: a958e31a81b3 drm-tip: 2025y-03m-15d-18h-50m-02s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/pci/iov.c:979
error: drivers/pci/iov.c: patch does not apply
error: patch failed: drivers/pci/pci.h:693
error: drivers/pci/pci.h: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: PCI/IOV: Restore VF resizable BAR state after reset
Applying: PCI: Add a helper to convert between VF BAR number and IOV resource
Patch failed at 0002 PCI: Add a helper to convert between VF BAR number and IOV resource
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


