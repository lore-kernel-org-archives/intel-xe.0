Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF03AC197A0
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 15:01:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE4610E033;
	Mon, 20 Nov 2023 15:01:24 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id E7C0010E033;
 Mon, 20 Nov 2023 15:01:22 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E5BE6AA915;
 Mon, 20 Nov 2023 15:01:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Mon, 20 Nov 2023 15:01:22 -0000
Message-ID: <170049248293.29477.8516210693223385956@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231117174049.527192-1-lucas.demarchi@intel.com>
In-Reply-To: <20231117174049.527192-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_se?=
 =?utf-8?q?ries_starting_with_=5B1/3=5D_drm/xe=3A_Fold_GEN11=5FMOCS=5FENTR?=
 =?utf-8?q?IES_into_gen12=5Fmocs=5Fdesc?=
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

Series: series starting with [1/3] drm/xe: Fold GEN11_MOCS_ENTRIES into gen12_mocs_desc
URL   : https://patchwork.freedesktop.org/series/126596/
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
commit 27b76d1434fb22f0fa5265ad71fd73689a0591b5
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Fri Nov 17 09:40:49 2023 -0800

    drm/xe: Remove GEN[0-9]*_ prefixes
    
    After noticing in logs there were still mentions to GEN6 registers, it
    was clear commit 860bc3f9b76d ("drm/xe: Drop gen afixes from registers")
    didn't take care of all the afixes. Some were added later, but there are
    also constants and strings still using that.  Continue the cleanup
    removing the remaining ones.
    
    To keep it consistent with code nearby, a few other changes are made:
    
            - Remove prefix in INTEL_LEGACY_64B_CONTEXT
            - Remove GEN8_CTX_L3LLC_COHERENT since it's unused
            - Rename GEN9_FREQ_SCALER to GT_FREQUENCY_SCALER
    
    v2: Use XELP_ as prefix for NUM_MOCS_ENTRIES and remove changes to
        MOCS_ENTRIES as this is now done as part of a previous commit
        (Matt Roper)
    
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch c2785fa716b862203a640564a849377d4d8470f5 drm-intel
661f2c4c6 drm/xe: Fold GEN11_MOCS_ENTRIES into gen12_mocs_desc
f6e1c274e drm/xe/mocs: Bring comment about mocs back to reality
27b76d143 drm/xe: Remove GEN[0-9]*_ prefixes
-:7: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '860bc3f9b76d', maybe rebased or not pulled?
#7: 
was clear commit 860bc3f9b76d ("drm/xe: Drop gen afixes from registers")

total: 0 errors, 1 warnings, 0 checks, 306 lines checked


