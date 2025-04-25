Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B5BC369D1
	for <intel-xe@archiver.kernel.org>; Fri, 25 Apr 2025 13:25:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C718F10E0EC;
	Fri, 25 Apr 2025 13:25:45 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAAE410E0EC;
 Fri, 25 Apr 2025 13:25:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915=3A_refactor?=
 =?utf-8?q?_VLV_IOSF_SB_for_display_usage?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Apr 2025 13:25:44 -0000
Message-ID: <174558754496.11342.3831209661835469917@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <cover.1745587049.git.jani.nikula@intel.com>
In-Reply-To: <cover.1745587049.git.jani.nikula@intel.com>
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

Series: drm/i915: refactor VLV IOSF SB for display usage
URL   : https://patchwork.freedesktop.org/series/148265/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 5c29806460a1 drm-tip: 2025y-04m-25d-08h-49m-24s UTC integration manifest
=== git am output follows ===
Applying: drm/i915: rename vlv_sideband*.[ch] to vlv_iosf_sb*.[ch]
Applying: drm/i915: add generic read/write functions for VLV IOSF SB
Applying: drm/i915: rewrite VLV IOSF SB unit specific read/write functions
Applying: drm/i915: switch i915 core to generic VLV IOSF SB functions
Applying: drm/i915: move VLV IOSF SB unit specific helpers under display
Applying: drm/i915: convert VLV IOSF SB interface to struct drm_device


