Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C24CDE024
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 17:04:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0AC610EBBC;
	Thu, 26 Sep 2024 17:04:06 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C6410EBBC;
 Thu, 26 Sep 2024 17:04:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/oa=3A_Don=27t_rese?=
 =?utf-8?q?t_OAC=5FCONTEXT=5FENABLE_on_OA_stream_close_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Sep 2024 17:04:05 -0000
Message-ID: <172737024546.1108182.208285831653409095@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240924213713.3497992-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240924213713.3497992-1-ashutosh.dixit@intel.com>
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

Series: drm/xe/oa: Don't reset OAC_CONTEXT_ENABLE on OA stream close (rev3)
URL   : https://patchwork.freedesktop.org/series/139063/
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
commit ca27db965022238532a71d60df6bac566568332a
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Tue Sep 24 14:37:13 2024 -0700

    drm/xe/oa: Don't reset OAC_CONTEXT_ENABLE on OA stream close
    
    Mesa testing on Xe2+ revealed that when OA metrics are collected for an
    exec_queue, after the OA stream is closed, future batch buffers submitted
    on that exec_queue do not complete. Not resetting OAC_CONTEXT_ENABLE on OA
    stream close resolves these hangs and should not have any adverse effects.
    
    v2: Make the change that we don't reset the bit clearer (Ashutosh)
        Also make the same fix for OAC as OAR (Ashutosh)
    
    Bspec: 60314
    Fixes: 2f4a730fcd2d ("drm/xe/oa: Add OAR support")
    Fixes: 14e077f8006d ("drm/xe/oa: Add OAC support")
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2821
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
    Cc: stable@vger.kernel.org
    Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch ec87b409d3a9358c9a079186d528fad3f7d64334 drm-intel
ca27db965022 drm/xe/oa: Don't reset OAC_CONTEXT_ENABLE on OA stream close


