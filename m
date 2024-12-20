Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA298E77184
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 00:01:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B70D10E362;
	Fri, 20 Dec 2024 00:01:04 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05DC10E362;
 Fri, 20 Dec 2024 00:01:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/dmc=5Fwl=3A?=
 =?utf-8?q?_Support_extra_values_for_dmc=5Fwl=5Fenable_for_debugging?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Dec 2024 00:01:02 -0000
Message-ID: <173465286298.586099.15078549786563529543@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241219221429.109668-1-gustavo.sousa@intel.com>
In-Reply-To: <20241219221429.109668-1-gustavo.sousa@intel.com>
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

Series: drm/i915/dmc_wl: Support extra values for dmc_wl_enable for debugging
URL   : https://patchwork.freedesktop.org/series/142854/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 764b5dbd7c26 drm-tip: 2024y-12m-19d-23h-12m-37s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/dmc_wl: Use enum values for enable_dmc_wl
Applying: drm/i915/dmc_wl: Show description string for enable_dmc_wl
Applying: drm/i915/dmc_wl: Allow enable_dmc_wl=2 to mean "match any register"
Applying: drm/i915/dmc_wl: Allow enable_dmc_wl=3 to mean "always locked"


