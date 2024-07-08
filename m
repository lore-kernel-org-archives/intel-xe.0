Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3FAC3DA41
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 21:22:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C9610E02F;
	Mon,  8 Jul 2024 21:22:29 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BBA610E02F;
 Mon,  8 Jul 2024 21:22:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Drop_trace=5Fxe?=
 =?utf-8?q?=5Fhw=5Ffence=5Ffree?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 08 Jul 2024 21:22:27 -0000
Message-ID: <172047374763.67898.15714404029545416542@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240708211008.956384-1-matthew.brost@intel.com>
In-Reply-To: <20240708211008.956384-1-matthew.brost@intel.com>
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

Series: drm/xe: Drop trace_xe_hw_fence_free
URL   : https://patchwork.freedesktop.org/series/135869/
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
commit 076c3dd342d43a45db2f74d8c7072c2004f362c1
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon Jul 8 14:10:08 2024 -0700

    drm/xe: Drop trace_xe_hw_fence_free
    
    fence->ctx may be stale memory when trace_xe_hw_fence_free is called
    resuling UAF bug when deriving the device name. This tracepoint is not
    all that useful, so just drop it.
    
    Fixes: 501c4255c409 ("drm/xe/trace: Print device_id in xe_trace events")
    Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Gustavo Sousa <gustavo.sousa@intel.com>
    Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 46846337d6d2d8a759af3559141909e92e174add drm-intel
076c3dd342d4 drm/xe: Drop trace_xe_hw_fence_free


