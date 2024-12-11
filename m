Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A75E77182
	for <intel-xe@archiver.kernel.org>; Wed, 11 Dec 2024 15:01:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E8410E1C8;
	Wed, 11 Dec 2024 15:01:43 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F7410E1C8;
 Wed, 11 Dec 2024 15:01:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/mst=3A_use_intel?=
 =?utf-8?q?=5Fdp=5Fcompute=5Fconfig=5Flimits=28=29_for_DP_MST?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Dec 2024 15:01:41 -0000
Message-ID: <173392930194.1237565.16903030283515102339@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241211144310.701895-1-jani.nikula@intel.com>
In-Reply-To: <20241211144310.701895-1-jani.nikula@intel.com>
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

Series: drm/i915/mst: use intel_dp_compute_config_limits() for DP MST
URL   : https://patchwork.freedesktop.org/series/142421/
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
commit 411f14b3190b1fda4ce5c0f18a76078221f9100c
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Dec 11 16:43:10 2024 +0200

    drm/i915/mst: use intel_dp_compute_config_limits() for DP MST
    
    There's a lot of duplication between mst_stream_compute_config_limits()
    and intel_dp_compute_config_limits(). Adjust the latter to suit the
    needs of the former, and use the same function for both. This reduces
    duplication and highlights the differences for SST and MST and UHBR.
    
    Remove the kernel-doc for intel_dp_compute_config_link_bpp_limits()
    which now becomes static.
    
    Cc: Imre Deak <imre.deak@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 64679a558442b0191dff88abe841d13ee7e0b229 drm-intel
411f14b3190b drm/i915/mst: use intel_dp_compute_config_limits() for DP MST


