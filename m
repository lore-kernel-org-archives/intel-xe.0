Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D47CDD1AA
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 19:39:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A5010ECFC;
	Fri, 27 Sep 2024 19:39:20 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44DE610ECFC;
 Fri, 27 Sep 2024 19:39:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Ultrajoiner_basic_functio?=
 =?utf-8?q?nality_series_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Sep 2024 19:39:20 -0000
Message-ID: <172746596027.1112836.2174369932986699319@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240927152241.4014909-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20240927152241.4014909-1-ankit.k.nautiyal@intel.com>
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

Series: Ultrajoiner basic functionality series (rev7)
URL   : https://patchwork.freedesktop.org/series/138827/
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
commit e1f901b4733b651641f2db5cd88be4c57fdfbb58
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Fri Sep 27 20:52:41 2024 +0530

    drm/i915/intel_dp: Add support for forcing ultrajoiner
    
    Allow forcing ultrajoiner through debugfs.
    
    v2: Minor refactoring of switch case logic. (Ville)
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
    Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 1522f131505272ed86f58e937f2481e4e3e144c1 drm-intel
995c0cb1c253 drm/i915/display_device: Add Check HAS_DSC for bigjoiner
-:27: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i915' - possible side-effects?
#27: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:121:
+#define HAS_BIGJOINER(i915)		(DISPLAY_VER(i915) >= 11 && HAS_DSC(i915))

total: 0 errors, 0 warnings, 1 checks, 8 lines checked
554f3b274d82 drm/i915/display_debugfs: Allow force joiner only if supported
41186531df6c drm/i915/display: Modify debugfs for joiner to force n pipes
85ecf53d39cf drm/i915/dp: Add helper to compute num pipes required
9b0b629a726c drm/i915: Split current joiner hw state readout
be8867a61166 drm/i915: Add bigjoiner and uncompressed joiner hw readout sanity checks
691036bb6640 drm/i915/display: Add macro HAS_ULTRAJOINER()
-:26: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i915' - possible side-effects?
#26: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:157:
+#define HAS_ULTRAJOINER(i915)		((DISPLAY_VER(i915) >= 20 || \
+					  (IS_DGFX(i915) && DISPLAY_VER(i915) == 14)) && \
+					 HAS_DSC(i915))

total: 0 errors, 0 warnings, 1 checks, 9 lines checked
76e09986804e drm/i915/display: Refactor enable_joiner_pipes
d72ca85e74f9 drm/i915: Implement hw state readout and checks for ultrajoiner
cd1e5fafc395 drm/i915/display/vdsc: Add ultrajoiner support with DSC
f421f5806fff drm/i915/dp: Refactor joiner max_bpp calculations into separate functions
ffc87026cef9 drm/i915/dp: Use num_joined_pipes in bigjoiner_bw_max_bpp
1e374ec4620f drm/i915/dp: Modify compressed bpp limitations for ultrajoiner
e542a5453de1 drm/i915/dp: Simplify helper to get slice count with joiner
cd6f7804820e drm/i915: Compute config and mode valid changes for ultrajoiner
f38e3aaf2b09 drm/i915/display: Consider ultrajoiner for computing maxdotclock
e1f901b4733b drm/i915/intel_dp: Add support for forcing ultrajoiner


