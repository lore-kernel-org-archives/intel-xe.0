Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7AD7C04FFE
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 20:13:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94CE910ED23;
	Wed,  8 May 2024 20:13:49 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A073B10ED23;
 Wed,  8 May 2024 20:13:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_series_starting_with?=
 =?utf-8?q?_=5B1/7=5D_drm/xe=3A_Fix_xe=5Fpm=5Fruntime=5Fget=5Fif=5Factive_re?=
 =?utf-8?q?turn?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 May 2024 20:13:48 -0000
Message-ID: <171519922865.2023341.9625396667416774090@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240508200707.375414-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240508200707.375414-1-rodrigo.vivi@intel.com>
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

Series: series starting with [1/7] drm/xe: Fix xe_pm_runtime_get_if_active return
URL   : https://patchwork.freedesktop.org/series/133344/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 8476ff943d5b drm-tip: 2024y-05m-08d-19h-36m-54s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Fix xe_pm_runtime_get_if_active return
Applying: drm/xe: Fix xe_pm_runtime_get_if_in_use documentation
Applying: drm/xe: Relax runtime pm protection during execution
Applying: drm/xe: Relax runtime pm protection around VM
Applying: drm/xe: Prepare display for D3Cold
Applying: drm/xe: Stop checking for power_lost on D3Cold
Applying: drm/xe: Enable D3Cold on 'low' VRAM utilization


