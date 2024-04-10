Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556C6CD128A
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 11:14:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C225F1132C5;
	Wed, 10 Apr 2024 11:14:18 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8577A1132E9;
 Wed, 10 Apr 2024 11:14:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm=3A_move_Intel_dr?=
 =?utf-8?q?m_headers_to_a_subdirectory_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 10 Apr 2024 11:14:16 -0000
Message-ID: <171274765654.1319548.17265648731531168163@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1712743191.git.jani.nikula@intel.com>
In-Reply-To: <cover.1712743191.git.jani.nikula@intel.com>
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

Series: drm: move Intel drm headers to a subdirectory (rev2)
URL   : https://patchwork.freedesktop.org/series/132263/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: c111f7a5945a drm-tip: 2024y-04m-10d-09h-28m-42s UTC integration manifest
=== git am output follows ===
Applying: drm/i915: use system include for drm headers
Applying: drm: move intel-gtt.h under include/drm/intel
Applying: drm: move i915_gsc_proxy_mei_interface.h under include/drm/intel
Applying: drm: move i915_component.h under include/drm/intel
Applying: drm: move intel_lpe_audio.h under include/drm/intel
Applying: drm: move i915_drm.h under include/drm/intel
Applying: drm: move i915_pxp_tee_interface.h under include/drm/intel
Applying: drm: move i915_pciids.h under include/drm/intel
Applying: drm: move xe_pciids.h under include/drm/intel
Applying: drm: move i915_hdcp_interface.h under include/drm/intel


