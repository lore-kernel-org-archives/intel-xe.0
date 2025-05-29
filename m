Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D5BC54FB3
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 20:30:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E765910E247;
	Thu, 29 May 2025 20:30:54 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01E8F10E11A;
 Thu, 29 May 2025 20:30:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Add_debugfs_node_to_?=
 =?utf-8?q?expose_pcie_link_state_residency?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Soham Purkait" <soham.purkait@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 May 2025 20:30:54 -0000
Message-ID: <174855065400.33093.7444728784198035935@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250529192620.1227468-1-soham.purkait@intel.com>
In-Reply-To: <20250529192620.1227468-1-soham.purkait@intel.com>
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

Series: Add debugfs node to expose pcie link state residency
URL   : https://patchwork.freedesktop.org/series/149660/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 901190a06230 drm-tip: 2025y-05m-29d-16h-22m-38s UTC integration manifest
=== git am output follows ===
.git/rebase-apply/patch:15: trailing whitespace.
{	
.git/rebase-apply/patch:36: trailing whitespace.
	mmio = xe_root_tile_mmio(xe);	
warning: 2 lines add whitespace errors.
Applying: Utility function and macro for telemetry reading
Applying: drm/xe/regs/xe_pmt: Macros for pcie link state residency offset
Applying: drm/xe/xe_debugfs: Exposure of pcie link state residency counters through debugfs


