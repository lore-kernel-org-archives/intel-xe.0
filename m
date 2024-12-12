Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D312E77180
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 02:20:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129F110E7F3;
	Thu, 12 Dec 2024 02:20:18 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C5710E2E4;
 Thu, 12 Dec 2024 02:20:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_The_xe=5Fsa=5Fmanage?=
 =?utf-8?q?r_based_GuC_Buffer_Cache?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Dec 2024 02:20:16 -0000
Message-ID: <173397001692.1420692.6585124293489780130@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241212010141.389-1-michal.wajdeczko@intel.com>
In-Reply-To: <20241212010141.389-1-michal.wajdeczko@intel.com>
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

Series: The xe_sa_manager based GuC Buffer Cache
URL   : https://patchwork.freedesktop.org/series/142458/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: e70dbc9b6fd6 drm-tip: 2024y-12m-12d-00h-50m-19s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/sa: Always call drm_suballoc_manager_fini()
Applying: drm/xe/sa: Drop redundant NULL assignments
Applying: drm/xe/sa: Cleanup internal BO data at device removal
Applying: drm/xe/sa: Drop useless is_iomem member
Applying: drm/xe/sa: Improve error message on init failure
Applying: drm/xe/sa: Tidy up coding style in init()
Applying: drm/xe/sa: Allow making suballocations using custom gfp flags
Applying: drm/xe/sa: Allow creating suballocator with custom guard size
Applying: drm/xe/sa: Minor header cleanups
Applying: drm/xe/guc: Introduce the GuC Buffer Cache
Applying: drm/xe/pf: Use GuC Buffer Cache during VFs provisioning
Applying: drm/xe/kunit: Allow to replace xe_managed_bo_create_pin_map()
Applying: drm/xe/kunit: Add KUnit tests for GuC Buffer Cache


