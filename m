Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88AB3C61CE7
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 16:08:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B82E10EAEC;
	Fri,  6 Jun 2025 16:08:46 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A0510EAF1;
 Fri,  6 Jun 2025 16:08:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Enable_media_OA?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Jun 2025 16:08:45 -0000
Message-ID: <174922612545.56731.15023534379451868249@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250606160253.4054668-1-ashutosh.dixit@intel.com>
In-Reply-To: <20250606160253.4054668-1-ashutosh.dixit@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/149948/
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
commit ae23648ddc817dc5ec1608e5cd459e2df8c8d5f2
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Fri Jun 6 09:02:53 2025 -0700

    drm/xe/oa: Enable OAM latency measurement
    
    Enable OAM latency measurement for Xe3+ platforms.
    
    Bspec: 58840
    
    v2: Introduce DRM_XE_OA_UNIT_TYPE_OAM_SAG
    
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
    Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
+ /mt/dim checkpatch ac3f699ce8cdc62253c9cfb8d914a7d346634c93 drm-intel
1bb42ae1e32e drm/xe/oa/uapi: Expose media OA units
38af1014ecde drm/xe/oa: Print hwe to OA unit mapping
6492e847da85 drm/xe/oa: Introduce stream->oa_unit
fb0a77577f41 drm/xe/oa: Assign hwe for OAM_SAG
ae23648ddc81 drm/xe/oa: Enable OAM latency measurement


