Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5A8C27C43
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 21:45:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2280310FB01;
	Wed, 29 May 2024 21:45:26 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C47B10FA3F;
 Wed, 29 May 2024 21:45:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Remove_unwanted?=
 =?utf-8?q?_mutex_locking_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 May 2024 21:45:24 -0000
Message-ID: <171701912417.2235474.9351689422734601389@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240529213925.22239-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20240529213925.22239-1-niranjana.vishwanathapura@intel.com>
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

Series: drm/xe: Remove unwanted mutex locking (rev3)
URL   : https://patchwork.freedesktop.org/series/134199/
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
commit cb07d35c8536fd1c7f1f354c31d06946df7c4298
Author: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date:   Wed May 29 14:39:25 2024 -0700

    drm/xe: Remove unwanted mutex locking
    
    Do not hold xef->exec_queue.lock mutex while parsing the xarray
    xef->exec_queue.xa in xe_file_close() as it is not needed and
    will cause an unwanted dependency between this lock and the vm->lock.
    
    This lock protects the exec queue lookup and reference taking which
    doesn't apply to this code path. When FD is closing, IOCTLs presumably
    can't be modifying the xarray.
    
    v2: Update commit text (Matt Brost)
    v3: Add more code comment (Rodrigo Vivi)
    
    Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
+ /mt/dim checkpatch 55d6179b96e0390025f2ba101c03b94b50cab7a1 drm-intel
cb07d35c8536 drm/xe: Remove unwanted mutex locking


