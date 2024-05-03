Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B6CC4345F
	for <intel-xe@archiver.kernel.org>; Fri,  3 May 2024 20:34:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8024711299B;
	Fri,  3 May 2024 20:34:28 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C419711299B;
 Fri,  3 May 2024 20:34:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Unlock_deeper_packag?=
 =?utf-8?q?e-C_states_=28PC-10=29_and_D3Cold?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 03 May 2024 20:34:27 -0000
Message-ID: <171476846779.1887279.17521617659931868050@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240503191309.7022-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240503191309.7022-1-rodrigo.vivi@intel.com>
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

Series: Unlock deeper package-C states (PC-10) and D3Cold
URL   : https://patchwork.freedesktop.org/series/133186/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: e9ea5061461b drm-tip: 2024y-05m-03d-17h-58m-38s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Fix xe_pm_runtime_get_if_active return
Applying: drm/xe: Fix xe_pm_runtime_get_if_in_use documentation
Applying: drm/xe: Relax runtime pm protection during execution
Applying: drm/xe: Relax runtime pm protection around VM
Applying: drm/xe: Prepare display for D3Cold
Applying: drm/xe: Stop checking for power_lost on D3Cold
Applying: drm/xe: Enable D3Cold on 'low' VRAM utilization


