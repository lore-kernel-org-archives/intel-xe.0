Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAEE8C47DB3
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 18:21:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F873112A8D;
	Mon, 29 Jan 2024 18:21:27 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0383F112A8D;
 Mon, 29 Jan 2024 18:21:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_series_starting_with?=
 =?utf-8?q?_=5Bv3=2C1/6=5D_drm/xe=3A_Add_functions_to_convert_regular_addres?=
 =?utf-8?q?s_to_canonical_address_and_back?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Mon, 29 Jan 2024 18:21:26 -0000
Message-ID: <170655248601.806672.3915602376147432005@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240129181742.183694-1-jose.souza@intel.com>
In-Reply-To: <20240129181742.183694-1-jose.souza@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [v3,1/6] drm/xe: Add functions to convert regular address to canonical address and back
URL   : https://patchwork.freedesktop.org/series/129278/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: f4c0dac89 drm-tip: 2024y-01m-29d-16h-56m-05s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Add functions to convert regular address to canonical address and back
Applying: drm/xe: Add batch buffer addresses to devcoredump
Applying: drm/xe: Store xe_he_engine in xe_hw_engine_snapshot
Applying: drm/xe: Add misc functions to support read of specific DSS registers
Applying: drm/xe: Move XE_MAX_EU_FUSE_BITS to xe_gt_types.h
Applying: drm/xe: Add INSTDONE registers to devcoredump


