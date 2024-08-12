Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB11AC3DA7F
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 20:17:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2E310E2AE;
	Mon, 12 Aug 2024 20:17:51 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4EB10E2AE;
 Mon, 12 Aug 2024 20:17:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introducing_Xe2_ccs_modif?=
 =?utf-8?q?iers_for_integrated_and_discrete_graphics?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 Aug 2024 20:17:50 -0000
Message-ID: <172349387036.596184.3026821637708816151@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240812201549.2014168-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20240812201549.2014168-1-juhapekka.heikkila@gmail.com>
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

Series: Introducing Xe2 ccs modifiers for integrated and discrete graphics
URL   : https://patchwork.freedesktop.org/series/137207/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 36a68f3e4adc7307c88e43f4d05a92c16c2e513b
Author: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date:   Mon Aug 12 23:14:37 2024 +0300

    drm/i915/display: allow creation of Xe2 ccs framebuffers
    
    Add I915_FORMAT_MOD_4_TILED_BMG_CCS and I915_FORMAT_MOD_4_TILED_LNL_CCS to possible
    created modifier for new framebuffer on Xe driver.
    
    Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
+ /mt/dim checkpatch 4f95bd933f4dacd22752bf8d6e548e8cc445d093 drm-intel
1e32f15126bb drm/i915/display: Don't enable decompression on Xe2 with Tile4
5bf2a1a4e8d6 drm/fourcc: define Intel Xe2 related tile4 ccs modifiers
36a68f3e4adc drm/i915/display: allow creation of Xe2 ccs framebuffers
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
Add I915_FORMAT_MOD_4_TILED_BMG_CCS and I915_FORMAT_MOD_4_TILED_LNL_CCS to possible

total: 0 errors, 1 warnings, 0 checks, 61 lines checked


