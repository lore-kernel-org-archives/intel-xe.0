Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBD6D70DE3
	for <intel-xe@archiver.kernel.org>; Thu, 28 Nov 2024 16:39:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C07D10ED0D;
	Thu, 28 Nov 2024 16:39:25 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DEDD10ED0D;
 Thu, 28 Nov 2024 16:39:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_power?=
 =?utf-8?q?_conversion_to_struct_intel=5Fdisplay_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 28 Nov 2024 16:39:23 -0000
Message-ID: <173281196325.4167413.13946878377883469729@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1732808222.git.jani.nikula@intel.com>
In-Reply-To: <cover.1732808222.git.jani.nikula@intel.com>
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

Series: drm/i915/display: power conversion to struct intel_display (rev2)
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
commit b1cf9d7e57ada330700edabd24be5a508d87a4db
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Nov 28 17:38:24 2024 +0200

    drm/i915/display: convert power map to struct intel_display
    
    Going forward, struct intel_display is the main device data structure
    for display. Convert the power map code to it.
    
    Cc: Imre Deak <imre.deak@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 5379d0a88558b73308ad82f163e80b863626e90b drm-intel
f680298b2709 drm/i915/display: convert for_each_power_well() to struct intel_display
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
b83606c5ca65 drm/i915/display: convert for_each_power_domain_well() to struct intel_display
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
053a4250d770 drm/i915/display: convert power wells to struct intel_display
439de3e0deac drm/i915/display: convert power domain code internally to struct intel_display
-:141: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#141: FILE: drivers/gpu/drm/i915/display/intel_display_power.c:382:
+	drm_dbg_kms(display->drm, "%s (%d):\n", prefix, bitmap_weight(mask->bits, POWER_DOMAIN_NUM));

-:1662: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#1662: FILE: drivers/gpu/drm/i915/display/intel_display_power.c:2182:
+			    intel_power_well_name(power_well), intel_power_well_refcount(power_well));

-:1907: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#1907: FILE: drivers/gpu/drm/i915/display/intel_display_power.c:2563:
+	const struct intel_ddi_port_domains *domains = intel_port_domains_for_aux_ch(display, aux_ch);

-:1920: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#1920: FILE: drivers/gpu/drm/i915/display/intel_display_power.c:2575:
+	const struct intel_ddi_port_domains *domains = intel_port_domains_for_aux_ch(display, aux_ch);

-:1933: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#1933: FILE: drivers/gpu/drm/i915/display/intel_display_power.c:2587:
+	const struct intel_ddi_port_domains *domains = intel_port_domains_for_aux_ch(display, aux_ch);

total: 0 errors, 5 warnings, 0 checks, 1832 lines checked
8c4d9ee2b65e drm/i915/display: convert high level power interfaces to struct intel_display
b1cf9d7e57ad drm/i915/display: convert power map to struct intel_display


