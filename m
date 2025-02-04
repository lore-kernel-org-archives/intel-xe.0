Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655DBC02193
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 21:05:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FEB710E03B;
	Tue,  4 Feb 2025 21:05:29 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B91D010E098;
 Tue,  4 Feb 2025 21:05:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/dp=3A_Fix_potent?=
 =?utf-8?q?ial_infinite_loop_in_128b/132b_SST?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Feb 2025 21:05:27 -0000
Message-ID: <173870312775.1063955.16180228304208965599@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250204154925.3001781-1-jani.nikula@intel.com>
In-Reply-To: <20250204154925.3001781-1-jani.nikula@intel.com>
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

Series: drm/i915/dp: Fix potential infinite loop in 128b/132b SST
URL   : https://patchwork.freedesktop.org/series/144327/
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
commit 70b8f597eb9d9392bf558d3452b1f6d8eb12e274
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Feb 4 17:49:25 2025 +0200

    drm/i915/dp: Fix potential infinite loop in 128b/132b SST
    
    Passing 0 as the step only works when there are other reasons to break
    out of the BPP loop in intel_dp_mtp_tu_compute_config(). Otherwise, an
    infinite loop might occur. Fix it by explicitly checking for 0 step.
    
    Fixes: ef0a0757bbea ("drm/i915/dp: compute config for 128b/132b SST w/o DSC")
    Reported-by: Imre Deak <imre.deak@intel.com>
    Closes: https://lore.kernel.org/r/Z6I0knh2Kt5T0JrT@ideak-desk.fi.intel.com
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
    Reviewed-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch ac87843456aa558a665df43aa62c03eaf7701bcb drm-intel
70b8f597eb9d drm/i915/dp: Fix potential infinite loop in 128b/132b SST


