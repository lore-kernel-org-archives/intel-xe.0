Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27142C25B7C
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 17:41:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D05B710F19C;
	Thu, 23 May 2024 17:41:52 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A83810F19A;
 Thu, 23 May 2024 17:41:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/hwmon=3A_Remove_xe?=
 =?utf-8?q?=5Fhwmon=5Fprocess=5Freg?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 May 2024 17:41:50 -0000
Message-ID: <171648611023.2170280.5151786095155230832@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240523174720.2759358-1-karthik.poosa@intel.com>
In-Reply-To: <20240523174720.2759358-1-karthik.poosa@intel.com>
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

Series: drm/xe/hwmon: Remove xe_hwmon_process_reg
URL   : https://patchwork.freedesktop.org/series/133980/
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
commit 0472b8b0b2c591ee0f8c4e16b0ec3709de639eeb
Author: Karthik Poosa <karthik.poosa@intel.com>
Date:   Thu May 23 23:17:20 2024 +0530

    drm/xe/hwmon: Remove xe_hwmon_process_reg
    
    Remove xe_hwmon_process_reg as it is an unnecessary umbrella
    function (Lucas).
    
    Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
    Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch 8a665c9301080b611c4e64478ab6804714a7cddf drm-intel
0472b8b0b2c5 drm/xe/hwmon: Remove xe_hwmon_process_reg


