Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75460C36002
	for <intel-xe@archiver.kernel.org>; Mon, 24 Mar 2025 17:47:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F07110E17F;
	Mon, 24 Mar 2025 17:47:01 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B4E10E17F;
 Mon, 24 Mar 2025 17:47:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/xe2hpd=3A_Identi?=
 =?utf-8?q?fy_the_memory_type_for_SKUs_with_GDDR_+_ECC_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vivek Kasireddy" <vivek.kasireddy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Mar 2025 17:47:00 -0000
Message-ID: <174283842015.74578.8113452138774086707@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250324-tip-v2-1-38397de319f8@intel.com>
In-Reply-To: <20250324-tip-v2-1-38397de319f8@intel.com>
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

Series: drm/i915/xe2hpd: Identify the memory type for SKUs with GDDR + ECC (rev3)
URL   : https://patchwork.freedesktop.org/series/144908/
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
commit d533b32245e6ce11d014c37fe290459b123c2124
Author: Vivek Kasireddy <vivek.kasireddy@intel.com>
Date:   Mon Mar 24 10:22:33 2025 -0700

    drm/i915/xe2hpd: Identify the memory type for SKUs with GDDR + ECC
    
    Some SKUs of Xe2_HPD platforms (such as BMG) have GDDR memory type
    with ECC enabled. We need to identify this scenario and add a new
    case in xelpdp_get_dram_info() to handle it. In addition, the
    derating value needs to be adjusted accordingly to compensate for
    the limited bandwidth.
    
    Bspec: 64602
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Fixes: 3adcf970dc7e ("drm/xe/bmg: Drop force_probe requirement")
    Cc: stable@vger.kernel.org
    Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 9be2a7099019ef52d17cbc2b3e6ba15cd638ec2c drm-intel
d533b32245e6 drm/i915/xe2hpd: Identify the memory type for SKUs with GDDR + ECC


