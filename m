Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC8EC54798
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 06:40:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B374B10E5A6;
	Tue, 27 Feb 2024 06:40:52 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D9210E5A6;
 Tue, 27 Feb 2024 06:40:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_XE_HDCP_Enablement_=28rev?=
 =?utf-8?q?7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 Feb 2024 06:40:51 -0000
Message-ID: <170901605103.336701.13880538292197344915@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240227053204.1748920-1-suraj.kandpal@intel.com>
In-Reply-To: <20240227053204.1748920-1-suraj.kandpal@intel.com>
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

Series: XE HDCP Enablement (rev7)
URL   : https://patchwork.freedesktop.org/series/129457/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0c154c094f54266ae5de84733202d44dc09fb988
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 74ca09f187af5b0fb5f1911ac736386431adff08
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Tue Feb 27 11:02:04 2024 +0530

    drm/xe/hdcp: Enable HDCP for XE
    
    Enable HDCP for Xe by defining functions which take care of
    interaction of HDCP as a client with the GSC CS interface.
    Add intel_hdcp_gsc_message to Makefile and add corresponding
    changes to xe_hdcp_gsc.c to make it build.
    
    --v2
    -add kfree at appropriate place [Daniele]
    -remove useless define [Daniele]
    -move host session logic to xe_gsc_submit.c [Daniele]
    -call xe_gsc_check_and_update_pending directly in an if condition
    [Daniele]
    -use xe_device instead of drm_i915_private [Daniele]
    
    --v3
    -use xe prefix for newly exposed function [Daniele]
    -remove client specific defines from intel_gsc_mtl_header [Daniele]
    -add missing kfree() [Daniele]
    -have NULL check for hdcp_message in finish function [Daniele]
    -dont have too many variable declarations in the same line [Daniele]
    
    --v4
    -don't point the hdcp_message structure in xe_device to anything
    until it properly gets initialized [Daniele]
    
    --v5
    -Squash commits for buildability
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
    Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
+ /mt/dim checkpatch b3552bf1e79de200a6ca49c518ead46a1256618c drm-intel
4e8b267bae00 drm/i915/hdcp: Move intel_hdcp_gsc_message def away from header file
3236e112ba84 drm/xe/hdcp: Use xe_device struct
571779caafbb drm/xe: Use gsc_proxy_init_done to check proxy status
74ca09f187af drm/xe/hdcp: Enable HDCP for XE


