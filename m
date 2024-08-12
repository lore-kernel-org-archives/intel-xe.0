Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5018C52D7C
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 08:34:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A0C10E088;
	Mon, 12 Aug 2024 08:34:48 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3ACE10E088;
 Mon, 12 Aug 2024 08:34:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915=3A_Preserve_valu?=
 =?utf-8?q?e_of_fec=5Fenable_calculated_before_DSC_compute_config?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 Aug 2024 08:34:46 -0000
Message-ID: <172345168686.594024.16632858729837055712@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240812082446.3459081-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20240812082446.3459081-1-chaitanya.kumar.borah@intel.com>
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

Series: drm/i915: Preserve value of fec_enable calculated before DSC compute config
URL   : https://patchwork.freedesktop.org/series/137152/
State : success

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
commit 58ee393001b69c552c867750a320c5f19dd817d5
Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Date:   Mon Aug 12 13:54:46 2024 +0530

    drm/i915: Preserve value of fec_enable calculated before DSC compute config
    
    Before DSC compute config, fec_enable value is set in other functions
    (e.g. intel_dp_mst_find_vcpi_slots_for_bpp). We are ignoring the value by
    OR'ing its value in DSC compute config. One unintended effect of this is
    setting fec_enable in UHBR use-cases which is not needed for Intel
    hardware. Therefore, change operator to AND.
    
    While at it, add a comment explaining why we don't enable FEC in eDP v1.5.
    
    Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
+ /mt/dim checkpatch e2742fa214d806ebd04fc067da4235d82d269033 drm-intel
58ee393001b6 drm/i915: Preserve value of fec_enable calculated before DSC compute config


