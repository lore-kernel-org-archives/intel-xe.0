Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806D6C83F2E
	for <intel-xe@archiver.kernel.org>; Thu, 29 Aug 2024 14:54:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 512D510E6F4;
	Thu, 29 Aug 2024 14:54:55 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F1910E6F3;
 Thu, 29 Aug 2024 14:54:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe_=26_drm/i915?=
 =?utf-8?q?=3A_drvdata_usage_changes_follow-up?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 Aug 2024 14:54:54 -0000
Message-ID: <172494329473.832174.14356256626546217350@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1724942754.git.jani.nikula@intel.com>
In-Reply-To: <cover.1724942754.git.jani.nikula@intel.com>
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

Series: drm/xe & drm/i915: drvdata usage changes follow-up
URL   : https://patchwork.freedesktop.org/series/137966/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 7ae5f4b6787d drm-tip: 2024y-08m-29d-13h-51m-30s UTC integration manifest
=== git am output follows ===
Applying: drm/i915 & drm/xe: save struct drm_device to drvdata
Applying: drm/i915: support struct device and pci_dev in to_intel_display()
Applying: drm/i915/audio: migrate away from kdev_to_i915()
Applying: drm/i915/hdcp: migrate away from kdev_to_i915() in bind/unbind
Applying: drm/i915/hdcp: migrate away from kdev_to_i915() in GSC messaging
Applying: drm/xe/display: remove unused compat kdev_to_i915() and pdev_to_i915()


