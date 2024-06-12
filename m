Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DF3C27C78
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 02:11:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB4E010E1DA;
	Wed, 12 Jun 2024 02:11:14 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7DAE10E1DA;
 Wed, 12 Jun 2024 02:11:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Add_OA_functionality?=
 =?utf-8?q?_to_Xe_=28rev17=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 12 Jun 2024 02:11:11 -0000
Message-ID: <171815827193.67160.15359729829610753182@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240612020531.2680081-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240612020531.2680081-1-ashutosh.dixit@intel.com>
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

Series: Add OA functionality to Xe (rev17)
URL   : https://patchwork.freedesktop.org/series/121084/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 1340288da1f2 drm-tip: 2024y-06m-11d-21h-24m-08s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/perf/uapi: "Perf" layer to support multiple perf counter stream types
Applying: drm/xe/perf/uapi: Add perf_stream_paranoid sysctl
Applying: drm/xe/oa/uapi: Add OA data formats
Applying: drm/xe/oa/uapi: Initialize OA units
Applying: drm/xe/oa/uapi: Add/remove OA config perf ops
Applying: drm/xe/oa/uapi: Define and parse OA stream properties
Applying: drm/xe/oa: OA stream initialization (OAG)
Applying: drm/xe/oa/uapi: Expose OA stream fd
Applying: drm/xe/oa/uapi: Read file_operation
Applying: drm/xe/oa: Add OAR support
Applying: drm/xe/oa: Add OAC support
Applying: drm/xe/oa/uapi: Query OA unit properties
Applying: drm/xe/oa/uapi: OA buffer mmap
Applying: drm/xe/oa: Add MMIO trigger support
Applying: drm/xe/oa: Override GuC RC with OA on PVC
Applying: drm/xe/oa: Changes to OA_TAKEN
Applying: drm/xe/oa: Enable Xe2+ overrun mode


