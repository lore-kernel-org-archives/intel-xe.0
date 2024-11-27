Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BBBD6ACF7
	for <intel-xe@archiver.kernel.org>; Wed, 27 Nov 2024 17:12:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8935810E301;
	Wed, 27 Nov 2024 17:12:53 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 451DF10E301;
 Wed, 27 Nov 2024 17:12:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_power?=
 =?utf-8?q?_conversion_to_struct_intel=5Fdisplay?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 27 Nov 2024 17:12:52 -0000
Message-ID: <173272757227.3802312.6113732122548440700@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1732727056.git.jani.nikula@intel.com>
In-Reply-To: <cover.1732727056.git.jani.nikula@intel.com>
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

Series: drm/i915/display: power conversion to struct intel_display
URL   : https://patchwork.freedesktop.org/series/141847/
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
commit e1b497f0bfc000420b222b97491a0cdd20f3009d
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Nov 27 19:06:08 2024 +0200

    drm/i915/display: convert power map to struct intel_display
    
    Going forward, struct intel_display is the main device data structure
    for display. Convert the power map code to it.
    
    Cc: Imre Deak <imre.deak@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 24e36a5200d65a337d37827d4abcae11c9693f6f drm-intel
014824837167 drm/i915/display: simplify conditional compilation on runtime PM debug
b9394fb80f53 drm/i915/display: convert for_each_power_well() to struct intel_display
-:118: CHECK:MACRO_ARG_REUSE: Macro argument reuse '___display' - possible side-effects?
#118: FILE: drivers/gpu/drm/i915/display/intel_display_power_well.h:18:
+#define for_each_power_well(___display, __power_well)			\
+	for ((__power_well) = (___display)->power.domains.power_wells;	\
+	     (__power_well) - (___display)->power.domains.power_wells <	\
+		     (___display)->power.domains.power_well_count;	\
 	     (__power_well)++)

-:118: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__power_well' - possible side-effects?
#118: FILE: drivers/gpu/drm/i915/display/intel_display_power_well.h:18:
+#define for_each_power_well(___display, __power_well)			\
+	for ((__power_well) = (___display)->power.domains.power_wells;	\
+	     (__power_well) - (___display)->power.domains.power_wells <	\
+		     (___display)->power.domains.power_well_count;	\
 	     (__power_well)++)

-:128: CHECK:MACRO_ARG_REUSE: Macro argument reuse '___display' - possible side-effects?
#128: FILE: drivers/gpu/drm/i915/display/intel_display_power_well.h:24:
+#define for_each_power_well_reverse(___display, __power_well)		\
+	for ((__power_well) = (___display)->power.domains.power_wells +	\
+		     (___display)->power.domains.power_well_count - 1;	\
+	     (__power_well) - (___display)->power.domains.power_wells >= 0; \
 	     (__power_well)--)

-:128: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__power_well' - possible side-effects?
#128: FILE: drivers/gpu/drm/i915/display/intel_display_power_well.h:24:
+#define for_each_power_well_reverse(___display, __power_well)		\
+	for ((__power_well) = (___display)->power.domains.power_wells +	\
+		     (___display)->power.domains.power_well_count - 1;	\
+	     (__power_well) - (___display)->power.domains.power_wells >= 0; \
 	     (__power_well)--)

total: 0 errors, 0 warnings, 4 checks, 102 lines checked
d14a99c9511c drm/i915/display: convert for_each_power_domain_well() to struct intel_display
-:24: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#24: FILE: drivers/gpu/drm/i915/display/intel_display_power.c:31:
+#define for_each_power_domain_well(__display, __power_well, __domain)	\
+	for_each_power_well((__display), __power_well)			\
 		for_each_if(test_bit((__domain), (__power_well)->domains.bits))

-:24: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__power_well' - possible side-effects?
#24: FILE: drivers/gpu/drm/i915/display/intel_display_power.c:31:
+#define for_each_power_domain_well(__display, __power_well, __domain)	\
+	for_each_power_well((__display), __power_well)			\
 		for_each_if(test_bit((__domain), (__power_well)->domains.bits))

-:30: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#30: FILE: drivers/gpu/drm/i915/display/intel_display_power.c:35:
+#define for_each_power_domain_well_reverse(__display, __power_well, __domain) \
+	for_each_power_well_reverse((__display), __power_well) \
 		for_each_if(test_bit((__domain), (__power_well)->domains.bits))

-:30: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__power_well' - possible side-effects?
#30: FILE: drivers/gpu/drm/i915/display/intel_display_power.c:35:
+#define for_each_power_domain_well_reverse(__display, __power_well, __domain) \
+	for_each_power_well_reverse((__display), __power_well) \
 		for_each_if(test_bit((__domain), (__power_well)->domains.bits))

total: 2 errors, 0 warnings, 2 checks, 61 lines checked
0cdb07947b8b drm/i915/display: convert power wells to struct intel_display
-:1092: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1092: FILE: drivers/gpu/drm/i915/display/intel_display_power_well.c:1059:
+static bool i9xx_always_on_power_well_enabled(struct intel_display *display,
 					     struct i915_power_well *power_well)

total: 0 errors, 0 warnings, 1 checks, 1730 lines checked
ac179702b4c9 drm/i915/display: convert power domain code internally to struct intel_display
-:41: WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#41: FILE: drivers/gpu/drm/i915/display/intel_display_power.c:246:
+	struct i915_power_domains *power_domains = &display->power.domains;;

-:139: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#139: FILE: drivers/gpu/drm/i915/display/intel_display_power.c:382:
+	drm_dbg_kms(display->drm, "%s (%d):\n", prefix, bitmap_weight(mask->bits, POWER_DOMAIN_NUM));

-:143: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#143: FILE: drivers/gpu/drm/i915/display/intel_display_power.c:385:
+		drm_dbg_kms(display->drm, "%s use_count %d\n",
 			intel_display_power_domain_str(domain),

-:159: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#159: FILE: drivers/gpu/drm/i915/display/intel_display_power.c:397:
+	drm_dbg_kms(display->drm, "async_put_wakeref: %s\n",
 		str_yes_no(power_domains->async_put_wakeref));

-:289: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#289: FILE: drivers/gpu/drm/i915/display/intel_display_power.c:617:
+	drm_WARN_ON(display->drm, !queue_delayed_work(system_unbound_wq,
 						    &power_domains->async_put_work,

-:962: WARNING:LINE_SPACING: Missing a blank line after declarations
#962: FILE: drivers/gpu/drm/i915/display/intel_display_power.c:1406:
+	struct drm_i915_private *dev_priv = to_i915(display->drm);
+	drm_dbg_kms(display->drm, "Enabling package C8+\n");

-:979: WARNING:LINE_SPACING: Missing a blank line after declarations
#979: FILE: drivers/gpu/drm/i915/display/intel_display_power.c:1419:
+	struct drm_i915_private *dev_priv = to_i915(display->drm);
+	drm_dbg_kms(display->drm, "Disabling package C8+\n");

-:1151: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1151: FILE: drivers/gpu/drm/i915/display/intel_display_power.c:1641:
+		drm_dbg_kms(display->drm,
 			"Unknown memory configuration; disabling address buddy logic.\n");

-:1692: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1692: FILE: drivers/gpu/drm/i915/display/intel_display_power.c:2193:
+		drm_dbg_kms(display->drm, "%-25s %d\n",
 			intel_power_well_name(power_well), intel_power_well_refcount(power_well));

-:1697: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1697: FILE: drivers/gpu/drm/i915/display/intel_display_power.c:2197:
+			drm_dbg_kms(display->drm, "  %-23s %d\n",
 				intel_display_power_domain_str(domain),

-:1935: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#1935: FILE: drivers/gpu/drm/i915/display/intel_display_power.c:2574:
+	const struct intel_ddi_port_domains *domains = intel_port_domains_for_aux_ch(display, aux_ch);

-:1948: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#1948: FILE: drivers/gpu/drm/i915/display/intel_display_power.c:2586:
+	const struct intel_ddi_port_domains *domains = intel_port_domains_for_aux_ch(display, aux_ch);

-:1961: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#1961: FILE: drivers/gpu/drm/i915/display/intel_display_power.c:2598:
+	const struct intel_ddi_port_domains *domains = intel_port_domains_for_aux_ch(display, aux_ch);

total: 0 errors, 7 warnings, 6 checks, 1856 lines checked
a5dfba1b6557 drm/i915/display: convert high level power interfaces to struct intel_display
e1b497f0bfc0 drm/i915/display: convert power map to struct intel_display


