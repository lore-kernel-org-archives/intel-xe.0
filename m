Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F028AC61CE7
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 20:28:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F4A10E363;
	Fri,  6 Jun 2025 20:28:12 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C3D810E36D;
 Fri,  6 Jun 2025 20:28:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Add_WildCat_Lake_support_?=
 =?utf-8?q?=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Jun 2025 20:28:11 -0000
Message-ID: <174924169111.57344.10479619208947935865@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250606195104.1771715-1-dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20250606195104.1771715-1-dnyaneshwar.bhadane@intel.com>
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

Series: Add WildCat Lake support (rev3)
URL   : https://patchwork.freedesktop.org/series/149794/
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
commit b4ed09390600755abbc1f33b666ca98b7cc9fc0a
Author: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Date:   Sat Jun 7 01:21:04 2025 +0530

    drm/i915/xe3lpd: Extend WA 16023981245 for display 30.02
    
    wa_16023981245 need to be exteded for display version 30.02
    
    Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
+ /mt/dim checkpatch b8f759deb9abbafcb01468baecf33aee93ace35f drm-intel
6605df2672cb drm/i915/xe3lpd: Add support for display version 30.02
9e2c469092c7 drm/xe/xe3: Add support for graphics IP version 30.03
ad6b57d7f0dc drm/xe/xe3: Add support for media IP version 30.02
fde6b3d21a27 drm/i915/xe3lpd: Update bandwidth parameters for display version 30.02
d3f98c003bfc drm/i915: Set max cdclk for display 30.02
b69055f45462 drm/xe: Add Wildcat Lake device IDs to PTL list
3f7a406fb9aa drm/i915/xe3lpd: Extend DMC path for display version 30.02
c5391c314249 drm/i915/wcl: C10 phy connected to port A and B
b4ed09390600 drm/i915/xe3lpd: Extend WA 16023981245 for display 30.02


