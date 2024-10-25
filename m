Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D313D149C3
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 16:22:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B18610EB1C;
	Fri, 25 Oct 2024 16:22:47 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A27D10EB1C;
 Fri, 25 Oct 2024 16:22:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/hdcp=3A_Add_check_?=
 =?utf-8?q?to_remove_hdcp2_compatibilty_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Oct 2024 16:22:45 -0000
Message-ID: <172987336503.1333383.17855383262676775715@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241022055655.1902-1-suraj.kandpal@intel.com>
In-Reply-To: <20241022055655.1902-1-suraj.kandpal@intel.com>
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

Series: drm/xe/hdcp: Add check to remove hdcp2 compatibilty (rev4)
URL   : https://patchwork.freedesktop.org/series/140292/
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
commit f0167973e6a6c5f4c836ad24e04ccea9f65a239a
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Fri Oct 25 21:38:35 2024 +0530

    drm/xe/hdcp: Fix gsc structure check in fw check status
    
    Fix the condition for gsc structure validity in
    gsc_cs_status_check(). It needs to be an OR and not an AND
    condition
    
    Fixes: b4224f6bae38 ("drm/xe/hdcp: Check GSC structure validity")
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 3eaccdb6aa7537e7a60f1420ae757823cb37ece5 drm-intel
f0167973e6a6 drm/xe/hdcp: Fix gsc structure check in fw check status


