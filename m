Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD2CCDD1D2
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 20:26:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1DD10ED15;
	Fri, 27 Sep 2024 20:26:47 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123E610ED15;
 Fri, 27 Sep 2024 20:26:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=3A_In_guc=5Fct?=
 =?utf-8?q?=5Fsend=5Frecv_flush_g2h_worker_if_g2h_resp_times_out?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Sep 2024 20:26:46 -0000
Message-ID: <172746880606.1113006.16792377247280042204@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240927192428.1160211-1-badal.nilawar@intel.com>
In-Reply-To: <20240927192428.1160211-1-badal.nilawar@intel.com>
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

Series: drm/xe/guc: In guc_ct_send_recv flush g2h worker if g2h resp times out
URL   : https://patchwork.freedesktop.org/series/139234/
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
commit 3ee6ebb5873e1d3fbd9de1a435c1dcb073b05734
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Sat Sep 28 00:54:28 2024 +0530

    drm/xe/guc: In guc_ct_send_recv flush g2h worker if g2h resp times out
    
    It is observed that for GuC CT request G2H IRQ triggered and g2h_worker
    queued, but it didn't get opportunity to execute and timeout occurred.
    To address this the g2h_worker is being flushed.
    
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch 1522f131505272ed86f58e937f2481e4e3e144c1 drm-intel
3ee6ebb5873e drm/xe/guc: In guc_ct_send_recv flush g2h worker if g2h resp times out


