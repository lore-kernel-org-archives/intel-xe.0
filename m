Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F17D637D0
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 22:57:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2570110E29B;
	Wed, 13 Nov 2024 22:57:29 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88CF010E763;
 Wed, 13 Nov 2024 22:57:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5BC?=
 =?utf-8?q?I=2C1/7=5D_drm/i915=3A_Remove_vga_and_gmbus_seq_out_of_i915=5Fres?=
 =?utf-8?q?tore=5Fdisplay?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 Nov 2024 22:57:27 -0000
Message-ID: <173153864755.3666420.2719974123580699656@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241113225016.208673-1-rodrigo.vivi@intel.com>
In-Reply-To: <20241113225016.208673-1-rodrigo.vivi@intel.com>
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

Series: series starting with [CI,1/7] drm/i915: Remove vga and gmbus seq out of i915_restore_display
URL   : https://patchwork.freedesktop.org/series/141323/
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
commit 8dd730553d56e76bcb2f72dc6c873b264ed6b041
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Wed Nov 13 17:50:16 2024 -0500

    drm/{i915, xe}: Move power_domains suspend/resume to display_power
    
    Move intel_power_domains_{suspend,resume} to inside
    intel_display_power_{suspend_late, resume_early}.
    
    With this also change the VLV suspend failure to call
    the intel_display_power_resume_early. In the end, the only
    function executed there for VLV is the intel_power_domains_resume.
    Besides make the code more consistency give the call that was
    immediately before: intel_display_power_suspend_late.
    
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch d8d960b20b0dc59b06c24fc210387b9c158edf70 drm-intel
a33fb553953c drm/i915: Remove vga and gmbus seq out of i915_restore_display
0f23f23c0e81 drm/i915/display: Convert i915_suspend into i9xx_display_sr
-:46: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#46: 
new file mode 100644

-:70: CHECK:CAMELCASE: Avoid CamelCase: <saveSWF0>
#70: FILE: drivers/gpu/drm/i915/display/i9xx_display_sr.c:20:
+			i915->regfile.saveSWF0[i] = intel_de_read(i915, SWF0(i915, i));

-:71: CHECK:CAMELCASE: Avoid CamelCase: <saveSWF1>
#71: FILE: drivers/gpu/drm/i915/display/i9xx_display_sr.c:21:
+			i915->regfile.saveSWF1[i] = intel_de_read(i915, SWF1(i915, i));

-:74: CHECK:CAMELCASE: Avoid CamelCase: <saveSWF3>
#74: FILE: drivers/gpu/drm/i915/display/i9xx_display_sr.c:24:
+			i915->regfile.saveSWF3[i] = intel_de_read(i915, SWF3(i915, i));

-:122: CHECK:CAMELCASE: Avoid CamelCase: <saveDSPARB>
#122: FILE: drivers/gpu/drm/i915/display/i9xx_display_sr.c:72:
+		i915->regfile.saveDSPARB = intel_de_read(i915, DSPARB(i915));

-:125: CHECK:CAMELCASE: Avoid CamelCase: <saveGCDGMBUS>
#125: FILE: drivers/gpu/drm/i915/display/i9xx_display_sr.c:75:
+		pci_read_config_word(pdev, GCDGMBUS, &i915->regfile.saveGCDGMBUS);

total: 0 errors, 1 warnings, 5 checks, 153 lines checked
b42e2a2f13bd drm/i915/display: Move regfile registers intel_display.restore
-:30: CHECK:CAMELCASE: Avoid CamelCase: <saveSWF0>
#30: FILE: drivers/gpu/drm/i915/display/i9xx_display_sr.c:21:
+			display->restore.saveSWF0[i] = intel_de_read(display, SWF0(i915, i));

-:31: CHECK:CAMELCASE: Avoid CamelCase: <saveSWF1>
#31: FILE: drivers/gpu/drm/i915/display/i9xx_display_sr.c:22:
+			display->restore.saveSWF1[i] = intel_de_read(display, SWF1(i915, i));

-:35: CHECK:CAMELCASE: Avoid CamelCase: <saveSWF3>
#35: FILE: drivers/gpu/drm/i915/display/i9xx_display_sr.c:25:
+			display->restore.saveSWF3[i] = intel_de_read(display, SWF3(i915, i));

-:97: CHECK:CAMELCASE: Avoid CamelCase: <saveDSPARB>
#97: FILE: drivers/gpu/drm/i915/display/i9xx_display_sr.c:75:
+		display->restore.saveDSPARB = intel_de_read(display, DSPARB(i915));

-:101: CHECK:CAMELCASE: Avoid CamelCase: <saveGCDGMBUS>
#101: FILE: drivers/gpu/drm/i915/display/i9xx_display_sr.c:78:
+		pci_read_config_word(pdev, GCDGMBUS, &display->restore.saveGCDGMBUS);

total: 0 errors, 0 warnings, 5 checks, 135 lines checked
00792a4c5969 drm/{i915, xe}/display: Move DP MST calls to display_driver
52837e34dbf8 drm/xe/display: Delay hpd_init resume
546d634603c9 drm/xe/display: Delay dsm handler registration
8dd730553d56 drm/{i915, xe}: Move power_domains suspend/resume to display_power


