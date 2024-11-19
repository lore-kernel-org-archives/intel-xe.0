Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA94CD44167
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 15:37:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDAB510E33D;
	Tue, 19 Nov 2024 15:37:45 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C3B410E33D;
 Tue, 19 Nov 2024 15:37:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915=3A_MST_and_?=
 =?utf-8?q?DDI_cleanups_and_refactoring_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 19 Nov 2024 15:37:45 -0000
Message-ID: <173203066539.361645.7537804236184009410@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1731941270.git.jani.nikula@intel.com>
In-Reply-To: <cover.1731941270.git.jani.nikula@intel.com>
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

Series: drm/i915: MST and DDI cleanups and refactoring (rev2)
URL   : https://patchwork.freedesktop.org/series/141501/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: f8f85a38f6c7 drm-tip: 2024y-11m-19d-13h-12m-07s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/mst: pass intel_dp around in mst stream helpers
Applying: drm/i915/mst: unify MST connector function naming to mst_connector_*
Applying: drm/i915/mst: simplify mst_connector_get_hw_state()
Applying: drm/i915/mst: unify MST topology callback naming to mst_topology_*
Applying: drm/i915/ddi: use intel_ddi_* naming convention for encoder enable/disable
Applying: drm/i915/reg: convert DP_TP_CTL/DP_TP_STATUS to REG_BIT() and friends
Applying: drm/i915/dp: refactor clear/wait for act sent
Applying: drm/i915/ddi: rename temp to ddi_func_ctl in intel_ddi_read_func_ctl()
Applying: drm/i915/ddi: split up intel_ddi_read_func_ctl() by output type
Applying: drm/i915/ddi: refactor intel_ddi_connector_get_hw_state()
Applying: drm/i915/ddi: simplify intel_ddi_get_encoder_pipes() slightly


