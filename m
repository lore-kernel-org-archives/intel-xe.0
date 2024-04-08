Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F043C67861
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 18:33:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17CA110F813;
	Mon,  8 Apr 2024 18:33:27 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B5310F813;
 Mon,  8 Apr 2024 18:33:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Add_Battlemage_suppo?=
 =?utf-8?q?rt_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 08 Apr 2024 18:33:25 -0000
Message-ID: <171260120508.1286971.4836569597109386882@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240408170545.3769566-1-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20240408170545.3769566-1-balasubramani.vivekanandan@intel.com>
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

Series: Add Battlemage support (rev3)
URL   : https://patchwork.freedesktop.org/series/131939/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: a533b51ca017 drm-tip: 2024y-04m-08d-15h-36m-13s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/xe2: Recognize Xe2_HPG IP
Applying: drm/xe/xe2: Recognize Xe2_HPM IP
Applying: drm/xe/bmg: Add BMG platform definition
Applying: drm/xe/bmg: Add BMG mocs table
Applying: drm/xe/bmg: Program an additional discrete-specific PAT setting
Applying: drm/xe/xe2hpg: Determine flat ccs offset for vram
Applying: drm/xe/xe2hpg: Remove extra allocation of CCS pages for dgfx
Applying: drm/xe/xe2: Add workaround 18034896535
Applying: drm/xe/xe2hpg: Add initial GT workarounds
Applying: drm/xe/xe2hpg: Introduce performance tuning changes for Xe2_HPG.
Applying: drm/xe/xe2hpm: Add initial set of workarounds


