Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F82D32D78
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 09:31:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B2B10E31F;
	Tue, 12 Nov 2024 09:31:34 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E5B10E59D;
 Tue, 12 Nov 2024 09:31:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Update_VRR_guardband_for_?=
 =?utf-8?q?HRR_panel?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 12 Nov 2024 09:31:33 -0000
Message-ID: <173140389393.2956527.17015692900097475286@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241112085039.1258860-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20241112085039.1258860-1-mitulkumar.ajitkumar.golani@intel.com>
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

Series: Update VRR guardband for HRR panel
URL   : https://patchwork.freedesktop.org/series/141202/
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
commit 5176c4967eef5a9308e1d0da0a3607e79bbc305b
Author: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Date:   Tue Nov 12 14:20:39 2024 +0530

    display/vrr: Update guardband based on enabled latency
    
    Instead of computing guardband to max vblank, account for
    the differenct feature latency.
    
    Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
+ /mt/dim checkpatch bb3e6edc085808aa7d7ea238c6bff1130e893224 drm-intel
7866b2a098b2 drm/i915/scaler: Calculate scaler prefill latency
f1d81ff44e71 drm/i915/watermark: Add WM0 prefill latency
3d195c639cbd drm/i915/psr: Add latency for PSR
5176c4967eef display/vrr: Update guardband based on enabled latency


