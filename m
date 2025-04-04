Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF35C36010
	for <intel-xe@archiver.kernel.org>; Fri,  4 Apr 2025 07:11:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C591910E309;
	Fri,  4 Apr 2025 07:11:28 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266C410E309;
 Fri,  4 Apr 2025 07:11:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Remove_support_for_UHBR13?=
 =?utf-8?q?=2E5?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 04 Apr 2025 07:11:27 -0000
Message-ID: <174375068715.37726.14276443398332166983@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250404-dprates-v5-0-c93f561a095e@intel.com>
In-Reply-To: <20250404-dprates-v5-0-c93f561a095e@intel.com>
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

Series: Remove support for UHBR13.5
URL   : https://patchwork.freedesktop.org/series/147250/
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
commit 27f8354fc0da73ba512f6eba40d78180c94a79e6
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Fri Apr 4 10:25:09 2025 +0530

    drm/i915/display/dp: Remove the uhbr13.5 pll state values
    
    Remove the pll state table for UHBR13.5 on synps and c20 PHY as UHBR13.5
    is removed in previous patch.
    
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
+ /mt/dim checkpatch bc18da45d48d337b92a7ff9546ba61da32b3b586 drm-intel
b2c8bdb3efea drm/i915/display/dp: Remove support for UHBR13.5
27f8354fc0da drm/i915/display/dp: Remove the uhbr13.5 pll state values


