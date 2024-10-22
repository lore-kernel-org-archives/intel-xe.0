Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A4CD1713D
	for <intel-xe@archiver.kernel.org>; Tue, 22 Oct 2024 11:39:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B88E10E66E;
	Tue, 22 Oct 2024 11:39:16 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9923F10E670;
 Tue, 22 Oct 2024 11:39:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Don=27t_restart?=
 =?utf-8?q?_parallel_queues_multiple_times_on_GT_reset_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 22 Oct 2024 11:39:14 -0000
Message-ID: <172959715462.1309763.3444687891370300995@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241022103555.731557-1-nirmoy.das@intel.com>
In-Reply-To: <20241022103555.731557-1-nirmoy.das@intel.com>
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

Series: drm/xe: Don't restart parallel queues multiple times on GT reset (rev2)
URL   : https://patchwork.freedesktop.org/series/140280/
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
commit 156543628618bd657df849e399515d3390b25e69
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Tue Oct 22 12:35:55 2024 +0200

    drm/xe: Don't restart parallel queues multiple times on GT reset
    
    In case of parallel submissions multiple GuC id will point to the
    same exec queue and on GT reset such exec queues will get restarted
    multiple times which is not desirable.
    
    v2: don't use exec_queue_enabled() which could race,
        do the same for xe_guc_submit_stop (Matt B)
    
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2295
    Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch d5bac12430b0d4a980c0498b3c946772950e70ee drm-intel
156543628618 drm/xe: Don't restart parallel queues multiple times on GT reset


