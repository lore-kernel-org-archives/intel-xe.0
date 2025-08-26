Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76999CA0EFA
	for <intel-xe@archiver.kernel.org>; Tue, 26 Aug 2025 12:24:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3929B10E636;
	Tue, 26 Aug 2025 12:24:57 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32DEA10E636;
 Tue, 26 Aug 2025 12:24:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?2=2C1/3=5D_iopoll=3A_Generalize_read=5Fpoll=5Ftimeout=28=29_into_?=
 =?utf-8?q?poll=5Ftimeout=5Fus=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 26 Aug 2025 12:24:56 -0000
Message-ID: <175621109620.269761.12171072808266646081@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250826121859.15497-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250826121859.15497-1-ville.syrjala@linux.intel.com>
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

Series: series starting with [v2,1/3] iopoll: Generalize read_poll_timeout() into poll_timeout_us()
URL   : https://patchwork.freedesktop.org/series/153514/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
553439844b6500767ce8aef522cfe9fbb7ece541
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 83b40a59499ac9cf96b3bdd533f12422da7b772b
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Tue Aug 26 15:18:59 2025 +0300

    iopoll: Reorder the timeout handling in poll_timeout_us()
    
    Currently poll_timeout_us() evaluates 'op' and 'cond' twice
    within the loop, once at the start, and a second time after
    the timeout check. While it's probably not a big deal to do
    it twice almost back to back, it does make the macro a bit messy.
    
    Simplify the implementation to evaluate the timeout at the
    very start, then follow up with 'op'/'cond', and finally
    check if the timeout did in fact happen or not.
    
    For good measure throw in a compiler barrier between the timeout
    and 'op'/'cond' evaluations to make sure the compiler can't reoder
    the operations (which could cause false positive timeouts).
    The similar i915 __wait_for() macro already has the barrier, though
    there it is between the 'op' and 'cond' evaluations, which seems
    like it could still allow 'op' and the timeout evaluations to get
    reordered incorrectly. I suppose the ktime_get() might itself act
    as a sufficient barrier here, but better safe than sorry I guess.
    
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
    Reviewed-by: Jani Nikula <jani.nikula@intel.com>
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 9a7b262940bab808a7f3470846922306f686bd84 drm-intel
2a838bb4396f iopoll: Generalize read_poll_timeout() into poll_timeout_us()
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
9e27bec1d2f0 iopoll: Avoid evaluating 'cond' twice in poll_timeout_us()
83b40a59499a iopoll: Reorder the timeout handling in poll_timeout_us()


