Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B978C3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 05:01:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0905A10E1F6;
	Thu,  3 Apr 2025 05:01:25 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB0B110E1F6;
 Thu,  3 Apr 2025 05:01:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Remove_UHBR13=2E5_for_ICL?=
 =?utf-8?q?=2C_DG2_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Apr 2025 05:01:23 -0000
Message-ID: <174365648395.30889.2792455978019396970@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250402-dprates-v4-0-752535b2068a@intel.com>
In-Reply-To: <20250402-dprates-v4-0-752535b2068a@intel.com>
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

Series: Remove UHBR13.5 for ICL, DG2 (rev2)
URL   : https://patchwork.freedesktop.org/series/147114/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0d44457e4f1b15191e8ea2aae9f5181f24be4dc7
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Wed Apr 2 16:16:39 2025 +0530

    drm/i915/display/dp: Remove the uhbr13.5 pll state values
    
    uhbr13.5 is not supported on dg2/mtl. This patch removes the pll state
    table for synps and c20 PHY.
    
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
+ /mt/dim checkpatch 8f917568adaeea8b649e337e7d0e03bd03332253 drm-intel
33d0e55efa23 drm/i915/display/dp: Remove support for UHBR13.5 on display14
0d44457e4f1b drm/i915/display/dp: Remove the uhbr13.5 pll state values


