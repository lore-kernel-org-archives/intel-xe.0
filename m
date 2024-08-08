Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43822C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 19:04:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3C310E7E8;
	Thu,  8 Aug 2024 19:04:24 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C6E10E7E8;
 Thu,  8 Aug 2024 19:04:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe/oa=3A_xe=5Fsy?=
 =?utf-8?q?ncs_for_OA?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 08 Aug 2024 19:04:23 -0000
Message-ID: <172314386361.550585.17400324141381957689@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240808174139.4027534-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240808174139.4027534-1-ashutosh.dixit@intel.com>
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

Series: drm/xe/oa: xe_syncs for OA
URL   : https://patchwork.freedesktop.org/series/137058/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 63a79da951e8 drm-tip: 2024y-08m-08d-18h-52m-35s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/oa: Separate batch submission from waiting for completion
Applying: drm/xe/oa: Introduce 'struct xe_oa_fence'
Applying: drm/xe/oa/uapi: Define and parse OA sync properties
Applying: drm/xe/oa: Add input fence dependencies
Applying: drm/xe/oa: Signal output fences
Applying: drm/xe/oa: Move functions up so they can be reused for config ioctl
Applying: drm/xe/oa: Add syncs support to OA config ioctl
Applying: drm/xe/oa: Allow only certain property changes from config ioctl


