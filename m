Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325DAD41D52
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 05:03:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C0D10E233;
	Tue, 12 Nov 2024 05:03:28 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1CBD10E233;
 Tue, 12 Nov 2024 05:03:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/5=5D_drm/i915/watermark=3A_Initialize_latency_variable_to_approp?=
 =?utf-8?q?riate_value?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 12 Nov 2024 05:03:26 -0000
Message-ID: <173138780698.2906230.12951301325067293941@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241112045435.1189586-1-suraj.kandpal@intel.com>
In-Reply-To: <20241112045435.1189586-1-suraj.kandpal@intel.com>
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

Series: series starting with [1/5] drm/i915/watermark: Initialize latency variable to appropriate value
URL   : https://patchwork.freedesktop.org/series/141192/
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
commit 8b8420db364dd5d5fa52a3dd58b856ce8c35553a
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Tue Nov 12 10:24:35 2024 +0530

    drm/i915/watermark: Use intel_display for dpkgc code
    
    Use intel_display for DPKGC code wherever we can. While we are
    at it also use intel_de_rmw instead of intel_uncore_rmw as we
    really don't need the internal uncore_rmw_function.
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch c8443e3741e360704258967feb87d253d8f0864a drm-intel
32a1ed3bd725 drm/i915/watermark: Initialize latency variable to appropriate value
1aff162131c4 drm/i915/watermark: Rename enable_dpkgc variable
9308b8f6d2a5 drm/i915/watermark: Refactor dpkgc value prepration
ee948254f597 drm/i915/watermark: Modify latency programmed into PKG_C_LATENCY
8b8420db364d drm/i915/watermark: Use intel_display for dpkgc code


