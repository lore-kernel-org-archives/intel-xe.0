Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8900ECAC59A
	for <intel-xe@archiver.kernel.org>; Fri, 19 Sep 2025 19:36:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45CBD10EA8F;
	Fri, 19 Sep 2025 19:36:50 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BF7010EA8F;
 Fri, 19 Sep 2025 19:36:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/1915=3A_skl+_watermar?=
 =?utf-8?q?k/latency_stuff_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 19 Sep 2025 19:36:48 -0000
Message-ID: <175831060863.350138.3016243327622062792@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250919193000.17665-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250919193000.17665-1-ville.syrjala@linux.intel.com>
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

Series: drm/1915: skl+ watermark/latency stuff (rev4)
URL   : https://patchwork.freedesktop.org/series/154099/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d0c4d22c42368ce54a0334887a00a1cf8d3b7e42
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Fri Sep 19 22:30:00 2025 +0300

    drm/i915: Make sure wm block/lines are non-decreasing
    
    The watermark algorithm sometimes produces results where higher
    watermark levels have smaller blocks/lines watermarks than the lower
    levels. That doesn't really make sense as the corresponding latencies
    are supposed to be non-decreasing. It's unclear how the hardware
    responds to such watermark values, so it seems better to avoid that
    case and just make sure the values are always non-decreasing.
    
    Here's an example how things change for such a case on a GLK NUC:
     [PLANE:70:cursor A]   level  wm0, wm1, wm2, wm3, wm4, wm5, wm6, wm7, twm, swm, stwm -> *wm0,*wm1,*wm2,*wm3,*wm4,*wm5,*wm6,*wm7,*twm, swm, stwm
     [PLANE:70:cursor A]   lines    0,   0,   0,   0,   0,   0,   0,   0,   0,   0,    0 ->    4,   4,   4,   2,   2,   2,   2,   2,   0,   0,    0
     [PLANE:70:cursor A]  blocks    0,   0,   0,   0,   0,   0,   0,   0,   0,   0,    0 ->   11,  11,  12,   7,   7,   7,   7,   7,  25,   0,    0
     [PLANE:70:cursor A] min_ddb    0,   0,   0,   0,   0,   0,   0,   0,   0,   0,    0 ->   12,  12,  13,   8,   8,   8,   8,   8,  26,   0,    0
    ->
     [PLANE:70:cursor A]   level  wm0, wm1, wm2, wm3, wm4, wm5, wm6, wm7, twm, swm, stwm -> *wm0,*wm1,*wm2,*wm3,*wm4,*wm5,*wm6,*wm7,*twm, swm, stwm
     [PLANE:70:cursor A]   lines    0,   0,   0,   0,   0,   0,   0,   0,   0,   0,    0 ->    4,   4,   4,   4,   4,   4,   4,   4,   0,   0,    0
     [PLANE:70:cursor A]  blocks    0,   0,   0,   0,   0,   0,   0,   0,   0,   0,    0 ->   11,  11,  12,  12,  12,  12,  12,  12,  25,   0,    0
     [PLANE:70:cursor A] min_ddb    0,   0,   0,   0,   0,   0,   0,   0,   0,   0,    0 ->   12,  12,  13,  13,  13,  13,  13,  13,  26,   0,    0
    
    Whether this actually helps on any display blinking issues is unclear.
    
    Reviewed-by: Luca Coelho <luciano.coelho@intel.com>
    References: https://gitlab.freedesktop.org/drm/intel/-/issues/8683
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 6279a928fb7ed7a69e44171637abf2bf50668a9c drm-intel
3f3040461411 drm/i915/dram: Also apply the 16Gb DIMM w/a for larger DRAM chips
e5aa80446e85 drm/i915: Apply the 16Gb DIMM w/a only for the platforms that need it
93a536f63d7d drm/i915: Tweak the read latency fixup code
8220a4f00240 drm/i915: Don't pass the latency array to {skl, mtl}_read_wm_latency()
595e3a9a08fd drm/i915: Move adjust_wm_latency() out from {mtl, skl}_read_wm_latency()
00d555f56f0c drm/i915: Extract multiply_wm_latency() from skl_read_wm_latency()
a0c54ad0b72b drm/i915: Extract increase_wm_latency()
cb1e46c195a3 drm/i915: Use increase_wm_latency() for the 16Gb DIMM w/a
0ceaa806b380 drm/i915: Extract sanitize_wm_latency()
44dcddd9656f drm/i915: Flatten sanitize_wm_latency() a bit
fda64a7b8d25 drm/i915: Make wm latencies monotonic
-:42: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#42: FILE: drivers/gpu/drm/i915/display/skl_watermark.c:3248:
+		wm[level] = max(wm[level], wm[level-1]);
 		                                   ^

total: 0 errors, 0 warnings, 1 checks, 27 lines checked
375fd490a8a5 drm/i915: Print both the original and adjusted wm latencies
d0c4d22c4236 drm/i915: Make sure wm block/lines are non-decreasing
-:17: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#17: 
 [PLANE:70:cursor A]   level  wm0, wm1, wm2, wm3, wm4, wm5, wm6, wm7, twm, swm, stwm -> *wm0,*wm1,*wm2,*wm3,*wm4,*wm5,*wm6,*wm7,*twm, swm, stwm

-:30: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#30: 
References: https://gitlab.freedesktop.org/drm/intel/-/issues/8683

total: 0 errors, 2 warnings, 0 checks, 30 lines checked


