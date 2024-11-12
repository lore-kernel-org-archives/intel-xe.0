Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB22D32D92
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 11:22:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B23910E5D3;
	Tue, 12 Nov 2024 11:22:18 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1185B10E5D3;
 Tue, 12 Nov 2024 11:22:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/mst=3A_clea?=
 =?utf-8?q?nups=2C_renames=2C_clarifications_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 12 Nov 2024 11:22:17 -0000
Message-ID: <173141053706.2956527.17541519012630557764@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1731409802.git.jani.nikula@intel.com>
In-Reply-To: <cover.1731409802.git.jani.nikula@intel.com>
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

Series: drm/i915/mst: cleanups, renames, clarifications (rev3)
URL   : https://patchwork.freedesktop.org/series/141067/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 2039b778888d drm-tip: 2024y-11m-12d-11h-19m-42s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/mst: pass primary encoder to primary encoder hooks
Applying: drm/i915/mst: rename intel_encoder to encoder
Applying: drm/i915/mst: introduce to_primary_encoder() and to_primary_dp()
Applying: drm/i915/mst: use primary_encoder in fake mst encoder creation
Applying: drm/i915/display: make CHICKEN_TRANS() display version aware
Applying: drm/i915/mst: convert to struct intel_display
Applying: drm/i915/mst: change naming from fake encoders to MST stream encoders
Applying: drm/i915/dp: add comments about hooks called from MST stream encoders


