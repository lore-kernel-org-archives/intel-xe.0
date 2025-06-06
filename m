Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22FF1C5AD49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 19:31:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA0E10E01F;
	Fri,  6 Jun 2025 19:31:53 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E026510E01F;
 Fri,  6 Jun 2025 19:31:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Enable_media_OA?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Jun 2025 19:31:52 -0000
Message-ID: <174923831291.56994.13966772105974488919@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250606192618.4133817-1-ashutosh.dixit@intel.com>
In-Reply-To: <20250606192618.4133817-1-ashutosh.dixit@intel.com>
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

Series: Enable media OA
URL   : https://patchwork.freedesktop.org/series/149953/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 41e1be693c1bcb954d20bb4efd2113944d0a7382
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Fri Jun 6 12:26:17 2025 -0700

    drm/xe/oa: Enable OAM latency measurement
    
    Enable OAM latency measurement for Xe3+ platforms.
    
    Bspec: 58840
    
    v2: Introduce DRM_XE_OA_UNIT_TYPE_OAM_SAG
    
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
    Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
+ /mt/dim checkpatch b8f759deb9abbafcb01468baecf33aee93ace35f drm-intel
ab3e5ab09c56 drm/xe/oa/uapi: Expose media OA units
92134077a3bd drm/xe/oa: Print hwe to OA unit mapping
a917abe512fc drm/xe/oa: Introduce stream->oa_unit
f04079816803 drm/xe/oa: Assign hwe for OAM_SAG
41e1be693c1b drm/xe/oa: Enable OAM latency measurement


