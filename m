Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A2AD6ACC3
	for <intel-xe@archiver.kernel.org>; Wed, 27 Nov 2024 12:20:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D9510E279;
	Wed, 27 Nov 2024 12:20:57 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B62A10E279;
 Wed, 27 Nov 2024 12:20:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_prunue_audio_frequencies_?=
 =?utf-8?q?based_on_bw_limits_for_DP2?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 27 Nov 2024 12:20:56 -0000
Message-ID: <173271005636.3703865.15432995325786608639@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241127120715.185348-1-vinod.govindapillai@intel.com>
In-Reply-To: <20241127120715.185348-1-vinod.govindapillai@intel.com>
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

Series: prunue audio frequencies based on bw limits for DP2
URL   : https://patchwork.freedesktop.org/series/141839/
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
commit df656b252ff68a68d4f6c249430ca5899c9db6fe
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>
Date:   Wed Nov 27 14:07:15 2024 +0200

    drm/i915/display: update audio bw calculations for MTL
    
    Update the reference overhead values for audio bw calculations
    for MTL onwards
    
    v2: fix the patch description (Kai)
    
    Bspec: 67768
    Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
    Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
+ /mt/dim checkpatch 4e5e3c93cf642f47374ed6e003f0a55b8af0f25b drm-intel
d172ad4a07ae drm/i915/display: create a common function to check validity of ELD
fb46f90d5a33 drm/i915/display: update call to intel_dp_audio_compute_config
edf73e8deb5e drm/i915/display: check and prune audio frequencies based on bw limits in DP2.0
-:48: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#48: FILE: drivers/gpu/drm/i915/display/intel_audio.c:727:
+			(DIV_ROUND_UP(DIV_ROUND_UP(aud_samples_per_line, 2) * 5 + 2, 4) + 2) * 16 + req_overhead;

total: 0 errors, 1 warnings, 0 checks, 210 lines checked
f3bcadaace45 drm/i915/display: iterate through channels if no feasible frequencies
7f36be1baaf7 drm/i915/display: update audio support based on the available frequencies
df656b252ff6 drm/i915/display: update audio bw calculations for MTL


