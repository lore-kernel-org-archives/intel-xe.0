Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F87C19F32
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 14:42:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2EBA10E163;
	Fri,  7 Mar 2025 14:42:10 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDB410E169;
 Fri,  7 Mar 2025 14:42:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/display=3A_dp=3A?=
 =?utf-8?q?_add_new_DPCD_access_functions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dmitry Baryshkov" <lumag@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Mar 2025 14:42:09 -0000
Message-ID: <174135852957.2586.11830685768589001223@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250307-drm-rework-dpcd-access-v3-0-9044a3a868ee@linaro.org>
In-Reply-To: <20250307-drm-rework-dpcd-access-v3-0-9044a3a868ee@linaro.org>
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

Series: drm/display: dp: add new DPCD access functions
URL   : https://patchwork.freedesktop.org/series/146000/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 066c46f28642 drm-tip: 2025y-03m-07d-12h-35m-40s UTC integration manifest
=== git am output follows ===
Applying: drm/display: dp: implement new access helpers
Applying: drm/display: dp: change drm_dp_dpcd_read_link_status() return value
Applying: drm/display: dp: use new DCPD access helpers
Applying: drm/display: dp-aux-dev: use new DCPD access helpers
Applying: drm/display: dp-cec: use new DCPD access helpers
Applying: drm/display: dp-mst-topology: use new DCPD access helpers
Applying: drm/display: dp-tunnel: use new DCPD access helpers


