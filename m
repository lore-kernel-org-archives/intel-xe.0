Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF0EC35FFA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Mar 2025 16:34:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E5A210E553;
	Wed, 19 Mar 2025 16:34:17 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B270F10E553;
 Wed, 19 Mar 2025 16:34:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Apply_Wa=5F1602?=
 =?utf-8?q?3105232_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 19 Mar 2025 16:34:16 -0000
Message-ID: <174240205673.54819.1488654419437276732@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250317184203.2213175-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20250317184203.2213175-1-vinay.belgaumkar@intel.com>
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

Series: drm/xe: Apply Wa_16023105232 (rev8)
URL   : https://patchwork.freedesktop.org/series/145449/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://github.com/intel-lgci-fdo-gitlab-mirror/drm.maintainer-tools mt
Cloning into 'mt'...
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0b960168551b40cdb93930bdaedf616420ca748d
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Mon Mar 17 11:42:03 2025 -0700

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
    
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
+ /mt/dim checkpatch a958e31a81b3267201c85b6f171419586afa792c drm-intel
0b960168551b drm/xe: Apply Wa_16023105232


