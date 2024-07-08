Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A7DC3DA42
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 14:41:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8044310E360;
	Mon,  8 Jul 2024 14:41:39 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF1C10E360;
 Mon,  8 Jul 2024 14:41:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/display/xe=5Fhdcp?=
 =?utf-8?q?=5Fgsc=3A_Free_arbiter_on_driver_removal_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 08 Jul 2024 14:41:39 -0000
Message-ID: <172044969910.67326.9988398668710136744@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240708125918.23573-1-nirmoy.das@intel.com>
In-Reply-To: <20240708125918.23573-1-nirmoy.das@intel.com>
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

Series: drm/xe/display/xe_hdcp_gsc: Free arbiter on driver removal (rev2)
URL   : https://patchwork.freedesktop.org/series/135844/
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
commit 1a7f960aa6f2379383589151eb3f70dd4227b3ce
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Mon Jul 8 14:59:18 2024 +0200

    drm/xe/display/xe_hdcp_gsc: Free arbiter on driver removal
    
    Free arbiter allocated in intel_hdcp_gsc_init().
    
    Fixes: 152f2df954d8 ("drm/xe/hdcp: Enable HDCP for XE")
    Cc: Suraj Kandpal <suraj.kandpal@intel.com>
    Cc: Arun R Murthy <arun.r.murthy@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch 70c7644809e01dca50e01f1fdff53d8b827d0384 drm-intel
1a7f960aa6f2 drm/xe/display/xe_hdcp_gsc: Free arbiter on driver removal


