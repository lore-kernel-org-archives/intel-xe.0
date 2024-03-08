Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 968F6C54E58
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 16:52:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A6E113221;
	Fri,  8 Mar 2024 16:52:31 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B48C7113915;
 Fri,  8 Mar 2024 16:52:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/hdcp=3A_Fix_condit?=
 =?utf-8?q?ion_for_hdcp_gsc_cs_requirement_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 Mar 2024 16:52:30 -0000
Message-ID: <170991675073.629227.14249646059887112735@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240308134817.1940638-2-suraj.kandpal@intel.com>
In-Reply-To: <20240308134817.1940638-2-suraj.kandpal@intel.com>
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

Series: drm/xe/hdcp: Fix condition for hdcp gsc cs requirement (rev2)
URL   : https://patchwork.freedesktop.org/series/130920/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9bb2a8a17457065eb398a81e8fd9aec2b519fd6
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 47147deea0e335a58a62c49cfeca0d6276728407
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Fri Mar 8 21:19:40 2024 +0530

    drm/xe/hdcp: Fix condition for hdcp gsc cs requirement
    
    Add condition for check of hdcp gsc cs requirement rather than
    assuming gsc cs to always be required when xe is loaded. It is not
    required for display version < 14
    
    --v2
    -Use display version in commit message [Lucas]
    
    Fixes: 152f2df954d8 ("drm/xe/hdcp: Enable HDCP for XE")
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
    Acked-by: Jani Nikula <jani.nikula@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 61f0226a654e5b63234b2293d0fd50e428568823 drm-intel
47147deea0e3 drm/xe/hdcp: Fix condition for hdcp gsc cs requirement


