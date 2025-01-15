Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 994E8C02183
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 20:46:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 619A810E7DE;
	Wed, 15 Jan 2025 20:46:32 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E5210E7DE;
 Wed, 15 Jan 2025 20:46:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Add_support_for_EU_s?=
 =?utf-8?q?tall_sampling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harish Chegondi" <harish.chegondi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Jan 2025 20:46:31 -0000
Message-ID: <173697399101.4085111.12870408044892135851@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1736970203.git.harish.chegondi@intel.com>
In-Reply-To: <cover.1736970203.git.harish.chegondi@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/143572/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 83dd30e2ec24 drm-tip: 2025y-01m-15d-20h-39m-52s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/topology: Add a function to find the index of the last enabled DSS in a mask
Applying: drm/xe/uapi: Introduce API for EU stall sampling
Applying: drm/xe/eustall: Implement EU stall sampling APIs for Xe_HPC
Applying: drm/xe/eustall: Return -EIO error from read() if HW drops data
Applying: drm/xe/eustall: Add EU stall sampling support for Xe2
Applying: drm/xe/uapi: Add a device query to get EU stall sampling information
Applying: drm/xe/eustall: Add workaround 22016596838 which applies to PVC.


