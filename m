Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D260AD149F7
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 23:16:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A18D210E076;
	Fri, 25 Oct 2024 23:16:30 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06AB010E076;
 Fri, 25 Oct 2024 23:16:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_PCI=3A_VF_resizable_?=
 =?utf-8?q?BAR_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Oct 2024 23:16:30 -0000
Message-ID: <172989819002.1334319.9192319253260053300@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241025215038.3125626-1-michal.winiarski@intel.com>
In-Reply-To: <20241025215038.3125626-1-michal.winiarski@intel.com>
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

Series: PCI: VF resizable BAR (rev3)
URL   : https://patchwork.freedesktop.org/series/138887/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 3ec61d11c742 drm-tip: 2024y-10m-25d-20h-06m-01s UTC integration manifest
=== git am output follows ===
Applying: PCI/IOV: Restore VF resizable BAR state after reset
Applying: PCI: Add a helper to identify IOV resources
Applying: PCI: Add a helper to convert between standard and IOV resources
Applying: PCI: Allow IOV resources to be resized in pci_resize_resource()
Applying: PCI/IOV: Check that VF BAR fits within the reservation
Applying: PCI: Allow drivers to control VF BAR size
Applying: drm/xe/pf: Set VF LMEM BAR size


