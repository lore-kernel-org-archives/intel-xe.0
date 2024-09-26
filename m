Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E326CCCFA17
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 05:31:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A832210E124;
	Thu, 26 Sep 2024 05:31:28 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542F810E124;
 Thu, 26 Sep 2024 05:30:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Reconcile_i915=27s_and_xe?=
 =?utf-8?q?=27s_display_power_mgt_sequences?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Sep 2024 05:30:40 -0000
Message-ID: <172732864033.1104419.14168677159716015169@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240924204222.246862-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240924204222.246862-1-rodrigo.vivi@intel.com>
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

Series: Reconcile i915's and xe's display power mgt sequences
URL   : https://patchwork.freedesktop.org/series/139061/
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
commit ba6e2d9dfcbe47c2f91034f4ccc815b96c6b4970
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Tue Sep 24 16:35:52 2024 -0400

    drm/{i915, xe}/display: Consolidade entire runtime pm sequence
    
    No functional change.
    
    Consolidate the entire runtime pm sequences under
    intel_display_driver.
    
    Simplifications and optimizations around the D3cold sequences are
    likely still possible. But before that can be done, consolidate
    everything at the intel_display_driver side.
    
    Xe display power management functions are now only a wrapper
    checking for xe's display probe parameter.
    
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 88d592f72f7bc508d6a027b1f96aa2e53f803e1b drm-intel
6dcf9b7988ea drm/i915: Remove vga and gmbus seq out of i915_restore_display
dcc98b447c20 drm/i915/display: Convert i915_suspend into i9xx_display_sr
-:44: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#44: 
new file mode 100644

-:68: CHECK:CAMELCASE: Avoid CamelCase: <saveSWF0>
#68: FILE: drivers/gpu/drm/i915/display/i9xx_display_sr.c:20:
+			i915->regfile.saveSWF0[i] = intel_de_read(i915, SWF0(i915, i));

-:69: CHECK:CAMELCASE: Avoid CamelCase: <saveSWF1>
#69: FILE: drivers/gpu/drm/i915/display/i9xx_display_sr.c:21:
+			i915->regfile.saveSWF1[i] = intel_de_read(i915, SWF1(i915, i));

-:72: CHECK:CAMELCASE: Avoid CamelCase: <saveSWF3>
#72: FILE: drivers/gpu/drm/i915/display/i9xx_display_sr.c:24:
+			i915->regfile.saveSWF3[i] = intel_de_read(i915, SWF3(i915, i));

-:120: CHECK:CAMELCASE: Avoid CamelCase: <saveDSPARB>
#120: FILE: drivers/gpu/drm/i915/display/i9xx_display_sr.c:72:
+		i915->regfile.saveDSPARB = intel_de_read(i915, DSPARB(i915));

-:123: CHECK:CAMELCASE: Avoid CamelCase: <saveGCDGMBUS>
#123: FILE: drivers/gpu/drm/i915/display/i9xx_display_sr.c:75:
+		pci_read_config_word(pdev, GCDGMBUS, &i915->regfile.saveGCDGMBUS);

total: 0 errors, 1 warnings, 5 checks, 153 lines checked
6fdf46fe51a6 drm/i915/display: Move regfile registers intel_display.restore
-:29: CHECK:CAMELCASE: Avoid CamelCase: <saveSWF0>
#29: FILE: drivers/gpu/drm/i915/display/i9xx_display_sr.c:21:
+			display->restore.saveSWF0[i] = intel_de_read(display, SWF0(i915, i));

-:30: CHECK:CAMELCASE: Avoid CamelCase: <saveSWF1>
#30: FILE: drivers/gpu/drm/i915/display/i9xx_display_sr.c:22:
+			display->restore.saveSWF1[i] = intel_de_read(display, SWF1(i915, i));

-:34: CHECK:CAMELCASE: Avoid CamelCase: <saveSWF3>
#34: FILE: drivers/gpu/drm/i915/display/i9xx_display_sr.c:25:
+			display->restore.saveSWF3[i] = intel_de_read(display, SWF3(i915, i));

-:96: CHECK:CAMELCASE: Avoid CamelCase: <saveDSPARB>
#96: FILE: drivers/gpu/drm/i915/display/i9xx_display_sr.c:75:
+		display->restore.saveDSPARB = intel_de_read(display, DSPARB(i915));

-:100: CHECK:CAMELCASE: Avoid CamelCase: <saveGCDGMBUS>
#100: FILE: drivers/gpu/drm/i915/display/i9xx_display_sr.c:78:
+		pci_read_config_word(pdev, GCDGMBUS, &display->restore.saveGCDGMBUS);

total: 0 errors, 0 warnings, 5 checks, 135 lines checked
2a136013211e drm/i915/display: Move shutdown sequences under display driver
240890c8a435 drm/xe: At shutdown disable commit helpers instead of flushing
71322c0c3501 drm/xe: Use i915-display shutdown sequence directly
ee2b47c496f3 drm/{i915, xe}/display: Move DP MST calls to display_driver
3ce1d09fbde3 drm/i915/display: Move suspend sequences to intel_display_driver
dd88fa6b51ff drm/xe/display: Delay hpd_init resume
e969e13b4fdf drm/xe/display: Spin-off xe_display runtime/d3cold sequences
305610315138 drm/{i915,xe}: Consolidate display resume functions
5034a35b96c1 drm/i915: Remove lingering pci_save_state
0e6d56d634c9 drm/{i915,xe}: Consolidate display suspend functions
7418edb973ed drm/i915/display: Move resume sequences to intel_display_driver
ac794c821e70 drm/xe/display: Delay dsm handler registration
01363e40e255 drm/{i915, xe}: Move power_domains suspend/resume to display_power
94dabebc8248 drm/{i915, xe}: Move remaining intel_power_domains to intel_display
7b73d94e8368 drm/i915/display: Split resume_noirq calls for now
5df8f96ab07a drm/xe/display: Align display resume sequence with i915
02b9f0b4f20b drm/xe/display: Align suspend sequence with i915
bdac41edb475 drm/{i915, xe}/display: Move dsm registration under intel_driver
827cf45e38a3 drm/i915/display: Move runtime pm related calls under intel_display_driver
e4645abdcafb drm/xe/display: Prepare runtime pm functions
2ebc7a206bea drm/xe/display: Call intel_hpd_init on every runtime resume
e75e8206db81 drm/xe/display: Move hpd_poll calls to later runtime stages
1425ba996ce8 drm/xe/display: Add missing watermark ipc update at runtime resume
86d89c891685 drm/xe/display: Notify opregion upon runtime suspend/resume non-d3cold
085f96294b20 drm/xe/display: Move display runtime suspend to a later point
728a3f15330f drm/xe/display: Kill crtc commit flush
07f8dd0683a5 drm/xe/display: Add missing power display handling on non-d3cold rpm
ba6e2d9dfcbe drm/{i915, xe}/display: Consolidade entire runtime pm sequence


