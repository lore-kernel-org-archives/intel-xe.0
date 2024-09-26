Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694FECDE032
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 19:13:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360A010E089;
	Thu, 26 Sep 2024 19:13:44 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8ED210E089;
 Thu, 26 Sep 2024 19:13:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enhance_debugfs_for_forci?=
 =?utf-8?q?ng_joiner?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Sep 2024 19:13:43 -0000
Message-ID: <172737802381.1107989.15328224338744486165@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240926134322.3728021-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20240926134322.3728021-1-ankit.k.nautiyal@intel.com>
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

Series: Enhance debugfs for forcing joiner
URL   : https://patchwork.freedesktop.org/series/139161/
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
commit c14d82d232e37ceaff6d7060117e42d568b18ae0
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Thu Sep 26 19:13:22 2024 +0530

    drm/i915/dp: Add helper to compute num pipes required
    
    Add a helper to compute the number of pipes required.
    This will depend on whether the joiner is required or is forced through
    the debugfs. If no joiner is required the helper returns 1.
    
    v2:
    -Return 1 if no joiner is required. (Ville)
    -Change the suffix from joined_pipes to num_pipes. (Ville)
    -Use number of pipes while calculating joined_pipe masks and
    max_dotclk. (Ville)
    v3: Simplify and rename the helper to intel_dp_num_joined_pipes(). Ville
    v4: Remove redundant 'fallthrough' statement. (Ville)
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch f82c02cc01798312082cc41feaa473538e517c7b drm-intel
6d690af7fec2 drm/i915/display_device: Add Check HAS_DSC for bigjoiner
-:27: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i915' - possible side-effects?
#27: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:121:
+#define HAS_BIGJOINER(i915)		(DISPLAY_VER(i915) >= 11 && HAS_DSC(i915))

total: 0 errors, 0 warnings, 1 checks, 8 lines checked
7a12b2f07193 drm/i915/display_debugfs: Allow force joiner only if supported
bfe09d2e41bf drm/i915/display: Modify debugfs for joiner to force n pipes
c14d82d232e3 drm/i915/dp: Add helper to compute num pipes required


