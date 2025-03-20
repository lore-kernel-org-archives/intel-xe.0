Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68E7C35FFF
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 18:00:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B14B10E672;
	Thu, 20 Mar 2025 18:00:40 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5132D10E675;
 Thu, 20 Mar 2025 18:00:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Apply_Wa=5F1602?=
 =?utf-8?q?3105232_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Mar 2025 18:00:39 -0000
Message-ID: <174249363933.59450.12913161821903231612@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250320175123.3026754-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20250320175123.3026754-1-vinay.belgaumkar@intel.com>
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

Series: drm/xe: Apply Wa_16023105232 (rev9)
URL   : https://patchwork.freedesktop.org/series/145449/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 03500ab8b8a7121631f477d444ca69b7d47ffd5a
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Thu Mar 20 10:51:23 2025 -0700

    drm/xe: Apply Wa_16023105232
    
    The WA requires KMD to disable DOP clock gating during a semaphore
    wait and also ensure that idle delay for every CS is lower than the
    idle wait time in the PWRCTX_MAXCNT register. Default values for these
    registers already comply with this restriction.
    
    v2: Store timestamp_base in gt info and other comments (Daniele)
    v3: Skip WA check for VF
    v4: Review comments (Matt Roper)
    v5: Cleanup the clock functions and use reg_field_get (Matt Roper)
    v6: Fix checkpatch issue
    v7: Fix CI issue
    
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
+ /mt/dim checkpatch 205f05bbe4ba98c3312b0734b076fabc0a91a43e drm-intel
03500ab8b8a7 drm/xe: Apply Wa_16023105232


