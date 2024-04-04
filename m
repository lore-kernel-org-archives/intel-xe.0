Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87864CD1292
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 15:30:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7AA112FC6;
	Thu,  4 Apr 2024 15:30:47 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDDBF112FC6;
 Thu,  4 Apr 2024 15:30:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_fix_multicast_s?=
 =?utf-8?q?upport_for_ADL-P_platforms?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 04 Apr 2024 15:30:45 -0000
Message-ID: <171224464584.1209579.15080617671042144260@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240404-mcr_adlp-v1-1-d13aa64245d7@intel.com>
In-Reply-To: <20240404-mcr_adlp-v1-1-d13aa64245d7@intel.com>
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

Series: drm/xe: fix multicast support for ADL-P platforms
URL   : https://patchwork.freedesktop.org/series/132037/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8d88b6d2811b775c6a141ed6366a35534fa33336
Author: Andrzej Hajda <andrzej.hajda@intel.com>
Date:   Thu Apr 4 16:18:29 2024 +0200

    drm/xe: fix multicast support for ADL-P platforms
    
    ADL-P has six sublices per slice.
    
    Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
    Fixes: bde5d76785bc ("drm/xe: Add helper macro to loop each DSS")
+ /mt/dim checkpatch 0900f84da0bdd3ac493ff919e70222475698c84d drm-intel
8d88b6d2811b drm/xe: fix multicast support for ADL-P platforms


