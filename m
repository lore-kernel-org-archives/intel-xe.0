Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F43C021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 20:58:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A13610E063;
	Mon, 24 Feb 2025 20:58:32 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9990B10E038;
 Mon, 24 Feb 2025 20:58:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_*Prepare_RTP_to_defi?=
 =?utf-8?q?ne_SR-IOV_specific_rules?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Feb 2025 20:58:31 -0000
Message-ID: <174043071162.1725152.9070367548185412610@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250224150700.1778-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250224150700.1778-1-michal.wajdeczko@intel.com>
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

Series: *Prepare RTP to define SR-IOV specific rules
URL   : https://patchwork.freedesktop.org/series/145337/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 9c30a334a462 drm-tip: 2025y-02m-24d-19h-12m-49s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/rtp: Prepare RTP to define SR-IOV specific rules
Applying: drm/xe/sriov: Prepare IS_SRIOV_PF to accept const pointer
Applying: drm/xe/kunit: Export xe_step_name for KUNIT
Applying: drm/xe/kunit: Update RTP tests with SR-IOV rules
Applying: drm/xe/rtp: Remove redundant rule to omit VF


