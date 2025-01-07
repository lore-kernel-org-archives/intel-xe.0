Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06574E77197
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jan 2025 17:48:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D7810EB40;
	Tue,  7 Jan 2025 17:48:06 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE4D10E267;
 Tue,  7 Jan 2025 17:48:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=3A_Adding_stee?=
 =?utf-8?q?ring_info_support_for_GuC_register_lists_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jesus Narvaez" <jesus.narvaez@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 07 Jan 2025 17:48:05 -0000
Message-ID: <173627208538.976881.850937900150559225@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241212190100.3768068-1-jesus.narvaez@intel.com>
In-Reply-To: <20241212190100.3768068-1-jesus.narvaez@intel.com>
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

Series: drm/xe/guc: Adding steering info support for GuC register lists (rev2)
URL   : https://patchwork.freedesktop.org/series/142503/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit bf86c4de70dec76d2df6496ee9a4a14eef929521
Author: Jesus Narvaez <jesus.narvaez@intel.com>
Date:   Thu Dec 12 11:01:00 2024 -0800

    drm/xe/guc: Adding steering info support for GuC register lists
    
    The guc_mmio_reg interface supports steering, but it is currently not
    implemented. This will allow the GuC to control steering of MMIO
    registers after save-restore and avoid reading from fused off MCR
    register instances.
    
    Fixes: 9c57bc08652a ("drm/xe/lnl: Drop force_probe requirement")
    Signed-off-by: Jesus Narvaez <jesus.narvaez@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch dfcd517d1169ab05be63134ba5cbc7bfaf030eb1 drm-intel
bf86c4de70de drm/xe/guc: Adding steering info support for GuC register lists


