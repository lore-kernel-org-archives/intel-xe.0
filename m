Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E17C30653
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jul 2024 06:25:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2049010E84C;
	Thu,  4 Jul 2024 06:25:30 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD2710E32A;
 Thu,  4 Jul 2024 06:25:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe2lpg=3A_Extend_w?=
 =?utf-8?q?orkaround_14021402888_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bommu Krishnaiah" <krishnaiah.bommu@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 04 Jul 2024 06:25:28 -0000
Message-ID: <172007432810.28047.8932555895469756365@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240703090754.1323647-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20240703090754.1323647-1-krishnaiah.bommu@intel.com>
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

Series: drm/xe/xe2lpg: Extend workaround 14021402888 (rev2)
URL   : https://patchwork.freedesktop.org/series/135688/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 504c63739377d44618d4f29c95a4c84a4b9ff06c
Author: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Date:   Wed Jul 3 14:37:54 2024 +0530

    drm/xe/xe2lpg: Extend workaround 14021402888
    
    workaround 14021402888 also applies to Xe2_LPG.
    Replicate the existing entry to one specific for Xe2_LPG.
    
    Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
    Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 73af7ac6d6ae23cd3f24b60e6ebaa3a81b2b1d5b drm-intel
504c63739377 drm/xe/xe2lpg: Extend workaround 14021402888


