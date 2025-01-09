Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B50E77197
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jan 2025 18:09:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F15C10E387;
	Thu,  9 Jan 2025 18:09:36 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3573910E387;
 Thu,  9 Jan 2025 18:09:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/ptl=3A_Apply_Wa=5F?=
 =?utf-8?q?14023061436_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 Jan 2025 18:09:35 -0000
Message-ID: <173644617521.1695038.1222209650228454632@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250108141323.311601-1-nirmoy.das@intel.com>
In-Reply-To: <20250108141323.311601-1-nirmoy.das@intel.com>
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

Series: drm/xe/ptl: Apply Wa_14023061436 (rev3)
URL   : https://patchwork.freedesktop.org/series/142359/
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
commit c6f14f07e3c2cb683b40de036bd5000520e83d90
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Wed Jan 8 15:13:23 2025 +0100

    drm/xe/ptl: Apply Wa_14023061436
    
    Enable WMTP for the BTD kernel to address Wa14023061436 by setting the
    proper TDL Chicken Bit.
    
    v2: Apply it on engine_was[] as this register is not part of LRC(Matt)
        Apply it for first_render_or_compute in case this gets extended to
        compute only platforms(Matt).
    
    Cc: Gustavo Sousa <gustavo.sousa@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch e9fabefcb38e3d79cdb3e51e771b6a83f7fa25c2 drm-intel
c6f14f07e3c2 drm/xe/ptl: Apply Wa_14023061436


