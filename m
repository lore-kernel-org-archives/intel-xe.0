Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A99C3DA64
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 23:26:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C7510E142;
	Thu,  1 Aug 2024 23:26:25 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4300810E0FC;
 Thu,  1 Aug 2024 23:26:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Release_GuC_v70=2E29?=
 =?utf-8?q?=2E2_as_minimum_for_Xe_=28support_LNL=2C_BMG=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 01 Aug 2024 23:26:24 -0000
Message-ID: <172255478426.489711.12756296803836458333@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240801224241.3050352-1-julia.filipchuk@intel.com>
In-Reply-To: <20240801224241.3050352-1-julia.filipchuk@intel.com>
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

Series: Release GuC v70.29.2 as minimum for Xe (support LNL, BMG)
URL   : https://patchwork.freedesktop.org/series/136818/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: d1ec20e149fc drm-tip: 2024y-08m-01d-18h-00m-40s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/guc: Drop use of pre-release GuC definitions for LNL and BMG
Applying: drm/xe/guc: Release GuC v70.29.2 for Xe as minimum required version
Applying: drm/xe/guc: Release GuC v70.29.2 for BMG
Applying: drm/xe/guc: Pick for-ci GuC v70.29.2 for PVC


