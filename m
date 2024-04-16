Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B4CC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 14:59:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E05EA10EDF4;
	Tue, 16 Apr 2024 14:59:58 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6442610EDF4;
 Tue, 16 Apr 2024 14:59:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_L3_bank_mask_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Apr 2024 14:59:58 -0000
Message-ID: <171327959841.1444339.10892869708378211396@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240416145037.7-1-francois.dugast@intel.com>
In-Reply-To: <20240416145037.7-1-francois.dugast@intel.com>
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

Series: L3 bank mask (rev3)
URL   : https://patchwork.freedesktop.org/series/132075/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fae1e565f2e5fbb878df0dbfb24f3f7fc481a38f
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 048c3825db7c3a6de6695f8aabcf044a8ad077ad
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Tue Apr 16 14:50:37 2024 +0000

    drm/xe/uapi: Expose the L3 bank mask
    
    The L3 bank mask is already generated and stored internally with
    the rest of the GT topology. In user space, the compute runtime
    now needs this information to be added to the device properties
    therefore the topology mask query is extended to provide a new
    mask which represents the L3 banks enabled on the GT.
    
    The changes in the compute runtime are ready and approved, see
    link below.
    
    v2: Rewrite commit message and add a link to the compute
        runtime PR (Francois Dugast)
    
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Robert Krzemien <robert.krzemien@intel.com>
    Cc: Mateusz Jablonski <mateusz.jablonski@intel.com>
    Link: https://github.com/intel/compute-runtime/pull/722
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch a761439bd7de146bbb362b8c614a2863bf6d8d76 drm-intel
048c3825db7c drm/xe/uapi: Expose the L3 bank mask


