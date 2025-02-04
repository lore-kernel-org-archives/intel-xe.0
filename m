Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE5AC02193
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 16:59:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9641310E037;
	Tue,  4 Feb 2025 16:59:14 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E84210E037;
 Tue,  4 Feb 2025 16:59:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/3=5D_drm/i915/display=3A_convert_intel=5Fddi=5Fbuf=5Ftrans=2Ec_t?=
 =?utf-8?q?o_struct_intel=5Fdisplay?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Feb 2025 16:59:13 -0000
Message-ID: <173868835357.971550.252039346692123083@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250204134228.2934744-1-jani.nikula@intel.com>
In-Reply-To: <20250204134228.2934744-1-jani.nikula@intel.com>
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

Series: series starting with [1/3] drm/i915/display: convert intel_ddi_buf_trans.c to struct intel_display
URL   : https://patchwork.freedesktop.org/series/144314/
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
commit c53bf89fe1d7b448add5a3e25a8dc55003a4e596
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Feb 4 15:42:28 2025 +0200

    drm/i915/cx0: convert to struct intel_display based platform checks
    
    Switch the IS_<PLATFORM>() checks to display->platform.<platform>, and
    drop a number of struct drm_i915_private pointers in the process.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 34f113e9fef546134e402e7657fc47e92fba59dc drm-intel
39594441dbc8 drm/i915/display: convert intel_ddi_buf_trans.c to struct intel_display
e38d311be941 drm/i915/cdclk: switch to new platform checks
c53bf89fe1d7 drm/i915/cx0: convert to struct intel_display based platform checks


