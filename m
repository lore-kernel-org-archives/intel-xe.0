Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E9DC021A0
	for <intel-xe@archiver.kernel.org>; Mon, 17 Feb 2025 06:48:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23AD310E142;
	Mon, 17 Feb 2025 06:48:05 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A5410E142;
 Mon, 17 Feb 2025 06:48:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/xe2hpd=3A_Identi?=
 =?utf-8?q?fy_the_memory_type_for_SKUs_with_GDDR_+_ECC_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vivek Kasireddy" <vivek.kasireddy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 17 Feb 2025 06:48:04 -0000
Message-ID: <173977488458.3181710.2667299250190190854@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250214215944.187407-1-vivek.kasireddy@intel.com>
In-Reply-To: <20250214215944.187407-1-vivek.kasireddy@intel.com>
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

Series: drm/i915/xe2hpd: Identify the memory type for SKUs with GDDR + ECC (rev2)
URL   : https://patchwork.freedesktop.org/series/144908/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1eae5669a71587123dd3e43c1459d3fe4318eed8
Author: Vivek Kasireddy <vivek.kasireddy@intel.com>
Date:   Fri Feb 14 13:59:44 2025 -0800

    drm/i915/xe2hpd: Identify the memory type for SKUs with GDDR + ECC
    
    Some SKUs of Xe2_HPD platforms (such as BMG) have GDDR memory type
    with ECC enabled. We need to identify this scenario and add a new
    case in xelpdp_get_dram_info() to handle it. In addition, the
    derating value needs to be adjusted accordingly to compensate for
    the limited bandwidth.
    
    Bspec: 64602
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
+ /mt/dim checkpatch 6a9d2dbb5b88b9e6bf74aa2934f5280ca4a6f934 drm-intel
1eae5669a715 drm/i915/xe2hpd: Identify the memory type for SKUs with GDDR + ECC


