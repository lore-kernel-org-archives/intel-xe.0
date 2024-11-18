Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF9DD4921C
	for <intel-xe@archiver.kernel.org>; Mon, 18 Nov 2024 13:22:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE8210E4D7;
	Mon, 18 Nov 2024 13:22:33 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA74A10E338;
 Mon, 18 Nov 2024 13:22:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Add_support_for_EU_s?=
 =?utf-8?q?tall_sampling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harish Chegondi" <harish.chegondi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 18 Nov 2024 13:22:31 -0000
Message-ID: <173193615185.1214718.4289992573396142682@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1731919693.git.harish.chegondi@intel.com>
In-Reply-To: <cover.1731919693.git.harish.chegondi@intel.com>
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

Series: Add support for EU stall sampling
URL   : https://patchwork.freedesktop.org/series/141483/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 90014f8026e3 drm-tip: 2024y-11m-18d-09h-06m-48s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/topology: Add a function to find the index of the last enabled DSS in a mask
Applying: drm/xe/eustall: Introduce API for EU stall sampling
Applying: drm/xe/eustall: Implement EU stall sampling APIs for Xe_HPC
Applying: drm/xe/eustall: Return -EIO error from read() if HW drops data
Applying: drm/xe/eustall: Add EU stall sampling support for Xe2
Applying: drm/xe/query: Add a device query to get EU stall data information
Applying: drm/xe/eustall: Add workaround 22016596838 which applies to PVC.


