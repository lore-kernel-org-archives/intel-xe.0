Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5651CC07545
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 12:50:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A06310E036;
	Wed, 25 Oct 2023 12:50:51 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2BEEA10E65D;
 Wed, 25 Oct 2023 12:50:49 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 2A8A2A0169;
 Wed, 25 Oct 2023 12:50:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Date: Wed, 25 Oct 2023 12:50:49 -0000
Message-ID: <169823824917.20487.13713187270204512511@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231025104306.667700-1-jani.nikula@intel.com>
In-Reply-To: <20231025104306.667700-1-jani.nikula@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_se?=
 =?utf-8?q?ries_starting_with_=5B1/2=5D_Revert_=22FIXME=3A_drm/i915=3A_xe_?=
 =?utf-8?b?ZG9lc24ndCBoYXZlIElTX0dGWF9HVF9JUF9TVEVQKCki?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [1/2] Revert "FIXME: drm/i915: xe doesn't have IS_GFX_GT_IP_STEP()"
URL   : https://patchwork.freedesktop.org/series/125564/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 56f1cae18f7105729f1a773b53a75bc03f5d12c3
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Oct 25 13:43:06 2023 +0300

    drm/i915: drop gt/intel_gt.h include from skl_universal_plane.c
    
    No longer needed after commit 94bcf876cb6a ("drm/i915/mtl: Drop
    Wa_14017240301").
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
    Link: https://patchwork.freedesktop.org/patch/msgid/20231011142704.985867-1-jani.nikula@intel.com
    (cherry picked from commit f17c08a6046f0c9383a61d7009216b0ad3369db4)
+ /mt/dim checkpatch aaae03b88d6e20f22fbc93cc898d776863c85589 drm-intel
bc78ebe2b Revert "FIXME: drm/i915: xe doesn't have IS_GFX_GT_IP_STEP()"
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'a2d686847fe5aa64932b0b1a25a889f6e96c8d03', maybe rebased or not pulled?
#6: 
This reverts commit a2d686847fe5aa64932b0b1a25a889f6e96c8d03.

total: 0 errors, 1 warnings, 0 checks, 9 lines checked
56f1cae18 drm/i915: drop gt/intel_gt.h include from skl_universal_plane.c
-:7: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '94bcf876cb6a', maybe rebased or not pulled?
#7: 
No longer needed after commit 94bcf876cb6a ("drm/i915/mtl: Drop

total: 0 errors, 1 warnings, 0 checks, 7 lines checked


