Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46998D30019
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 16:17:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E21B010E1E6;
	Fri, 18 Oct 2024 16:17:01 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 528A810E1E6;
 Fri, 18 Oct 2024 16:17:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/ufence=3A_Signal_u?=
 =?utf-8?q?fence_faster_when_possible?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 18 Oct 2024 16:17:00 -0000
Message-ID: <172926822033.1282733.8027562649182109624@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241018152958.1975994-1-nirmoy.das@intel.com>
In-Reply-To: <20241018152958.1975994-1-nirmoy.das@intel.com>
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

Series: drm/xe/ufence: Signal ufence faster when possible
URL   : https://patchwork.freedesktop.org/series/140181/
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
commit 9bf93db5ab2a9518e88f2bbeddb6689141f59062
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Fri Oct 18 17:29:58 2024 +0200

    drm/xe/ufence: Signal ufence faster when possible
    
    When the backing fence is already signaled, the ufence can be
    immediately signaled without queuing in the ordered work queue.
    This should also reduce load from the xe ordered_wq and won't
    block signaling a ufence which doesn't require any serialization.
    
    v2: fix system_wq typo
    v3: signal immediately instead of queuing in system_wq (Matt B)
    v4: revert back to v2 of using workqueue because of locking issue
        and remote viewing a different mm struct.
        Use Xe's unordered_wq which should be less congested than global
        one.
    
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch cebb76fe419dd92609fb86e59c9671387c5325a3 drm-intel
9bf93db5ab2a drm/xe/ufence: Signal ufence faster when possible


