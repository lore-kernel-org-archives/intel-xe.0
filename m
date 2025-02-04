Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CDA9C02193
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 20:17:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B412D10E075;
	Tue,  4 Feb 2025 20:17:12 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1F510E077;
 Tue,  4 Feb 2025 20:17:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/mst=3A_fix_INT?=
 =?utf-8?q?=5FMAX_to_=2E4_fixed_point_conversion_mistake?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Feb 2025 20:17:12 -0000
Message-ID: <173870023225.1061317.12604247969757685838@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250204153717.2996923-1-jani.nikula@intel.com>
In-Reply-To: <20250204153717.2996923-1-jani.nikula@intel.com>
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

Series: drm/i915/mst: fix INT_MAX to .4 fixed point conversion mistake
URL   : https://patchwork.freedesktop.org/series/144325/
State : warning

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
commit b780a35d785767228c5b017e13bcf6bc2c0f696a
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Feb 4 17:37:17 2025 +0200

    drm/i915/mst: fix INT_MAX to .4 fixed point conversion mistake
    
    intel_dp_mtp_tu_compute_config() conversion to use .4 fixed point didn't
    take into account that intel_dp_mst_max_dpt_bpp() may return INT_MAX
    when the transport limitation is not relevant. Converting INT_MAX to .4
    fixed point results in -1.0, which then gets used as if it were a real
    max BPP value:
    
    i915 0000:00:02.0: [drm:intel_dp_mtp_tu_compute_config [i915]] Limiting bpp to max DPT bpp (24.0000 -> -1.0000)
    i915 0000:00:02.0: [drm:intel_dp_mtp_tu_compute_config [i915]] Looking for slots in range min bpp 18.0000 max bpp -1.0000
    
    Just return 0 for "no max DPT BPP", and handle it explicitly.
    
    Fixes: 67782bf6e8a6 ("drm/i915/mst: Convert intel_dp_mtp_tu_compute_config() to .4 format")
    Cc: Imre Deak <imre.deak@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
    Reviewed-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch ac87843456aa558a665df43aa62c03eaf7701bcb drm-intel
b780a35d7857 drm/i915/mst: fix INT_MAX to .4 fixed point conversion mistake
-:13: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#13: 
i915 0000:00:02.0: [drm:intel_dp_mtp_tu_compute_config [i915]] Limiting bpp to max DPT bpp (24.0000 -> -1.0000)

total: 0 errors, 1 warnings, 0 checks, 16 lines checked


