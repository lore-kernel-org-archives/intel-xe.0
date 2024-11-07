Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A39DD5AE49
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 02:46:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A0310E064;
	Thu,  7 Nov 2024 02:46:15 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2100910E064;
 Thu,  7 Nov 2024 02:46:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=3A_Remove_dupl?=
 =?utf-8?q?icate_source_field?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 07 Nov 2024 02:46:13 -0000
Message-ID: <173094757313.1419905.4128583354370472490@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241106232752.374240-1-zhanjun.dong@intel.com>
In-Reply-To: <20241106232752.374240-1-zhanjun.dong@intel.com>
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

Series: drm/xe/guc: Remove duplicate source field
URL   : https://patchwork.freedesktop.org/series/141033/
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
commit 10b847b6f29a3f08226b153f606f4c8f6baf1dd2
Author: Zhanjun Dong <zhanjun.dong@intel.com>
Date:   Wed Nov 6 15:27:52 2024 -0800

    drm/xe/guc: Remove duplicate source field
    
    xe_hw_engine_snapshot.source save the information of where data copied
    from. Because it should always equal to the source of the matched node,
    this field is duplicate data, therefor could be optimized out.
    
    Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
    Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
    Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
+ /mt/dim checkpatch 5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3 drm-intel
10b847b6f29a drm/xe/guc: Remove duplicate source field


