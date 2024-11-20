Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D6ED6E2B9
	for <intel-xe@archiver.kernel.org>; Wed, 20 Nov 2024 05:50:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6115C10E390;
	Wed, 20 Nov 2024 05:50:00 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE72610E135;
 Wed, 20 Nov 2024 05:49:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Consider_joiner_calculati?=
 =?utf-8?q?on_for_panel_fitting?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 20 Nov 2024 05:49:58 -0000
Message-ID: <173208179886.603935.17098517733363285766@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241120053838.3794419-1-nemesa.garg@intel.com>
In-Reply-To: <20241120053838.3794419-1-nemesa.garg@intel.com>
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

Series: Consider joiner calculation for panel fitting
URL   : https://patchwork.freedesktop.org/series/141583/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f2697f95ab32a6cbb14860c8f86892bb1caee27e
Author: Nemesa Garg <nemesa.garg@intel.com>
Date:   Wed Nov 20 11:08:38 2024 +0530

    drm/i915/display: Initialize pipe_src in compute stage
    
    Add early pipe src initialization for gmch and later
    initialize the pipe src during compute_pipe_src.
    
    Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
+ /mt/dim checkpatch ccf64319402f90f68549e2047a7f985a46436e41 drm-intel
e10b43a47ac8 drm/i915/display: Disable joiner and pfit
1c613af1f649 drm/i915/display: Add gmch_panel_fitting in all encoders
2720d2690e7e drm/i915/display: Replace adjusted mode with pipe mode
3c650177ba07 drm/i915/display: Call panel_fitting from pipe_config
953123374250 drm/i915/dispaly: Allow joiner and pfit
f2697f95ab32 drm/i915/display: Initialize pipe_src in compute stage


