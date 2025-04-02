Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE39FC28B20
	for <intel-xe@archiver.kernel.org>; Wed,  2 Apr 2025 09:52:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62B810E6F0;
	Wed,  2 Apr 2025 09:52:40 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB20410E6F0;
 Wed,  2 Apr 2025 09:52:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Remove_UHBR13=2E5_for_ICL?=
 =?utf-8?q?=2C_DG2?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Apr 2025 09:52:39 -0000
Message-ID: <174358755982.26330.17460044894047917353@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250402-dprates-v3-0-9e5d8ca989dd@intel.com>
In-Reply-To: <20250402-dprates-v3-0-9e5d8ca989dd@intel.com>
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

Series: Remove UHBR13.5 for ICL, DG2
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
commit 5dd6980bda9e06f2a9b634e433ba61f865a4c8b0
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Wed Apr 2 14:26:28 2025 +0530

    drm/i915/display/dp: Remove the uhbr13.5 pll state values
    
    uhbr13.5 is not supported on dg2/mtl. This patch removes the pll state
    table for synps and c20 PHY.
    
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
+ /mt/dim checkpatch f0fd77956987f035c79d08c812343a27a655a57b drm-intel
75e0c5ff1bc0 drm/i915/display/dp: Remove UHBR13.5 for icl
5dd6980bda9e drm/i915/display/dp: Remove the uhbr13.5 pll state values


