Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94356C0032E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 12:50:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F0B10E655;
	Wed, 25 Oct 2023 12:50:40 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id B59C210E65D;
 Wed, 25 Oct 2023 12:50:37 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B0F12A0169;
 Wed, 25 Oct 2023 12:50:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Date: Wed, 25 Oct 2023 12:50:37 -0000
Message-ID: <169823823772.20490.17272863480093380129@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231025104306.667700-1-jani.nikula@intel.com>
In-Reply-To: <20231025104306.667700-1-jani.nikula@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_series_starting_with_=5B1/2=5D_Revert_=22FIXME=3A_drm/i915?=
 =?utf-8?b?OiB4ZSBkb2Vzbid0IGhhdmUgSVNfR0ZYX0dUX0lQX1NURVAoKSI=?=
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

Series: series starting with [1/2] Revert "FIXME: drm/i915: xe doesn't have IS_GFX_GT_IP_STEP()"
URL   : https://patchwork.freedesktop.org/series/125564/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: aaae03b88 drm/i915/display: Use intel_bo_to_drm_bo instead of obj->base
=== git am output follows ===
Applying: Revert "FIXME: drm/i915: xe doesn't have IS_GFX_GT_IP_STEP()"
Applying: drm/i915: drop gt/intel_gt.h include from skl_universal_plane.c


