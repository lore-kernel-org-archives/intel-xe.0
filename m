Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C50C41513
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 07:17:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 901C110E49A;
	Tue, 16 Jul 2024 07:17:10 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D317710E49A;
 Tue, 16 Jul 2024 07:17:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Wedge_the_entir?=
 =?utf-8?q?e_device_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Jul 2024 07:17:09 -0000
Message-ID: <172111422986.233766.17961937219155471243@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240716060343.1310088-1-matthew.brost@intel.com>
In-Reply-To: <20240716060343.1310088-1-matthew.brost@intel.com>
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

Series: drm/xe: Wedge the entire device (rev2)
URL   : https://patchwork.freedesktop.org/series/136123/
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
commit 0eba67042855f4433cf10cec5a2aa1080e249f17
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon Jul 15 23:03:43 2024 -0700

    drm/xe: Wedge the entire device
    
    Wedge the entire device, not just GT which may have triggered the wedge.
    To implement this, cleanup the layering so xe_device_declare_wedged()
    calls into the lower layers (GT) to ensure entire device is wedged.
    
    While we are here, also signal any pending GT TLB invalidations upon
    wedging device.
    
    Lastly, short circuit reset wait if device is wedged.
    
    v2:
     - Short circuit reset wait if device is wedged (Local testing)
    
    Fixes: 8ed9aaae39f3 ("drm/xe: Force wedged state and block GT reset upon any GPU hang")
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch b6af83ceb593bc4e0d79acda73684462b13a15b9 drm-intel
0eba67042855 drm/xe: Wedge the entire device


