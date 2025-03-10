Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72773C282DE
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 20:03:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A89110E4D7;
	Mon, 10 Mar 2025 20:03:35 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A46810E4D7;
 Mon, 10 Mar 2025 20:03:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/xe3lpd=3A_Update?=
 =?utf-8?q?_bandwidth_parameters_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Mar 2025 20:03:34 -0000
Message-ID: <174163701462.15831.4896334850736211448@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250310-xe3lpd-bandwidth-update-v4-0-4191964b034d@intel.com>
In-Reply-To: <20250310-xe3lpd-bandwidth-update-v4-0-4191964b034d@intel.com>
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

Series: drm/i915/xe3lpd: Update bandwidth parameters (rev4)
URL   : https://patchwork.freedesktop.org/series/144440/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e38d20f1fea0d1f0d84370c98ecaca8039eef77b
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Mon Mar 10 15:58:00 2025 -0300

    drm/i915/xe3lpd: Update bandwidth parameters
    
    Bandwidth parameters for Xe3_LPD have been updated with respect to
    previous display releases. Encode them into xe3lpd_sa_info and use that
    new struct.
    
    Bspec: 68859
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch fd356d116b876e8778d2a52820c832f95dcdd3d5 drm-intel
5ddc1feaac1b drm/i915/display: Convert intel_bw.c internally to intel_display
77e5a8fd79ab drm/i915/display: Convert intel_bw.c externally to intel_display
e38d20f1fea0 drm/i915/xe3lpd: Update bandwidth parameters


