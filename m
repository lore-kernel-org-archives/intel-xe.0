Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B78C8303C
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 14:46:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A5F10E665;
	Tue,  8 Jul 2025 14:46:07 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F2210E665;
 Tue,  8 Jul 2025 14:46:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?2=2C1/4=5D_iopoll=3A_Generalize_read=5Fpoll=5Ftimeout=28=29_into_?=
 =?utf-8?q?poll=5Ftimeout=5Fus=28=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Jul 2025 14:46:06 -0000
Message-ID: <175198596655.144352.16040411385258799949@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250702223439.19752-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250702223439.19752-1-ville.syrjala@linux.intel.com>
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

Series: series starting with [v2,1/4] iopoll: Generalize read_poll_timeout() into poll_timeout_us() (rev2)
URL   : https://patchwork.freedesktop.org/series/151093/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
43254c2aa575037fc031c7ac21b0d031c700b2bf
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 95986909150858997f74d7f0919360708bae8cf1
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Thu Jul 3 01:34:39 2025 +0300

    DO-NOT-MERGE: drm/i915: Use poll_timeout_us()
    
    Make sure poll_timeout_us() works by using it in i915
    instead of the custom __wait_for().
    
    Remaining difference between two:
                   | poll_timeout_us() | __wait_for()
    ---------------------------------------------------
    backoff        | fixed interval    | exponential
    usleep_range() | N/4+1 to N        | N to N*2
    clock          | MONOTONIC         | MONOTONIC_RAW
    
    Just a test hack for now, proper conversion probably
    needs actual thought.
    
    Cc: Jani Nikula <jani.nikula@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
    Cc: Imre Deak <imre.deak@intel.com>
    Cc: David Laight <david.laight.linux@gmail.com>
    Cc: Geert Uytterhoeven <geert+renesas@glider.be>
    Cc: Matt Wagantall <mattw@codeaurora.org>
    Cc: Dejin Zheng <zhengdejin5@gmail.com>
    Cc: intel-gfx@lists.freedesktop.org
    Cc: intel-xe@lists.freedesktop.org
    Cc: linux-kernel@vger.kernel.org
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 56ce5c21690fd8995ee447f790a15485cb49b996 drm-intel
bdb9d3fe673e iopoll: Generalize read_poll_timeout() into poll_timeout_us()
-:26: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#26: 
	ret = poll_timeout_us(err = drm_dp_dpcd_read_byte(aux, DP_FEC_STATUS, &status),

-:95: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'op' - possible side-effects?
#95: FILE: include/linux/iopoll.h:34:
+#define poll_timeout_us(op, cond, sleep_us, timeout_us, sleep_before_op) \
 ({ \
 	u64 __timeout_us = (timeout_us); \
 	unsigned long __sleep_us = (sleep_us); \
 	ktime_t __timeout = ktime_add_us(ktime_get(), __timeout_us); \
 	might_sleep_if((__sleep_us) != 0); \
+	if ((sleep_before_op) && __sleep_us) \
 		usleep_range((__sleep_us >> 2) + 1, __sleep_us); \
 	for (;;) { \
+		op; \
 		if (cond) \
 			break; \
 		if (__timeout_us && \
 		    ktime_compare(ktime_get(), __timeout) > 0) { \
+			op; \
 			break; \
 		} \
 		if (__sleep_us) \

-:152: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'op' - possible side-effects?
#152: FILE: include/linux/iopoll.h:79:
+#define poll_timeout_us_atomic(op, cond, delay_us, timeout_us, \
+			       delay_before_op) \
 ({ \
 	u64 __timeout_us = (timeout_us); \
 	s64 __left_ns = __timeout_us * NSEC_PER_USEC; \
 	unsigned long __delay_us = (delay_us); \
 	u64 __delay_ns = __delay_us * NSEC_PER_USEC; \
+	if ((delay_before_op) && __delay_us) { \
 		udelay(__delay_us); \
 		if (__timeout_us) \
 			__left_ns -= __delay_ns; \
 	} \
 	for (;;) { \
+		op; \
 		if (cond) \
 			break; \
 		if (__timeout_us && __left_ns < 0) { \
+			op; \
 			break; \
 		} \
 		if (__delay_us) { \

total: 0 errors, 1 warnings, 2 checks, 169 lines checked
51c3fadabdef iopoll: Avoid evaluating 'cond' twice in poll_timeout_us()
caef1ee3ae50 iopoll: Reorder the timeout handling in poll_timeout_us()
959869091508 DO-NOT-MERGE: drm/i915: Use poll_timeout_us()
-:52: CHECK:CAMELCASE: Avoid CamelCase: <Wmin>
#52: FILE: drivers/gpu/drm/i915/i915_utils.h:242:
+#define __wait_for_old(OP, COND, US, Wmin, Wmax) ({ \

-:52: CHECK:CAMELCASE: Avoid CamelCase: <Wmax>
#52: FILE: drivers/gpu/drm/i915/i915_utils.h:242:
+#define __wait_for_old(OP, COND, US, Wmin, Wmax) ({ \

-:52: WARNING:MACRO_ARG_UNUSED: Argument 'OP' is not used in function-like macro
#52: FILE: drivers/gpu/drm/i915/i915_utils.h:242:
+#define __wait_for_old(OP, COND, US, Wmin, Wmax) ({ \
 	const ktime_t end__ = ktime_add_ns(ktime_get_raw(), 1000ll * (US)); \
 	long wait__ = (Wmin); /* recommended min for usleep is 10 us */	\
 	int ret__;							\

-:52: WARNING:MACRO_ARG_UNUSED: Argument 'COND' is not used in function-like macro
#52: FILE: drivers/gpu/drm/i915/i915_utils.h:242:
+#define __wait_for_old(OP, COND, US, Wmin, Wmax) ({ \
 	const ktime_t end__ = ktime_add_ns(ktime_get_raw(), 1000ll * (US)); \
 	long wait__ = (Wmin); /* recommended min for usleep is 10 us */	\
 	int ret__;							\

-:52: WARNING:MACRO_ARG_UNUSED: Argument 'Wmax' is not used in function-like macro
#52: FILE: drivers/gpu/drm/i915/i915_utils.h:242:
+#define __wait_for_old(OP, COND, US, Wmin, Wmax) ({ \
 	const ktime_t end__ = ktime_add_ns(ktime_get_raw(), 1000ll * (US)); \
 	long wait__ = (Wmin); /* recommended min for usleep is 10 us */	\
 	int ret__;							\

-:60: WARNING:MACRO_ARG_UNUSED: Argument 'Wmax' is not used in function-like macro
#60: FILE: drivers/gpu/drm/i915/i915_utils.h:267:
+#define __wait_for(OP, COND, US, Wmin, Wmax)				\
+	poll_timeout_us(OP, COND, (Wmin), (US), false)

total: 0 errors, 4 warnings, 2 checks, 23 lines checked


