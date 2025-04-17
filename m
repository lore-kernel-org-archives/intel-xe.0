Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0954DC369B2
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 06:33:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCDDB10EA09;
	Thu, 17 Apr 2025 06:33:14 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97DF10EA09;
 Thu, 17 Apr 2025 06:33:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Remove_support_for_UHBR13?=
 =?utf-8?q?=2E5_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 17 Apr 2025 06:33:13 -0000
Message-ID: <174487159368.12579.6411938794720319481@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250417-dprates-v6-0-e917782873ab@intel.com>
In-Reply-To: <20250417-dprates-v6-0-e917782873ab@intel.com>
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

Series: Remove support for UHBR13.5 (rev2)
URL   : https://patchwork.freedesktop.org/series/147250/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 43bcfd06a558acf7addbe2e9605626f6cc29347d
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Thu Apr 17 11:42:47 2025 +0530

    drm/i915/display/dp: Remove the uhbr13.5 pll state values
    
    Remove the pll state table for UHBR13.5 on synopsys and c20 PHY
    as UHBR13.5 will not be supported on DG2 and MTL.
    
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
+ /mt/dim checkpatch 1afb38d5acb616dc76381ec0d80b081106146bbd drm-intel
fc58239081aa drm/i915/display/dp: DG2 does not support UHBR 13.5
43bcfd06a558 drm/i915/display/dp: Remove the uhbr13.5 pll state values


