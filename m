Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AAB8C27C52
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 04:16:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F8110E4E1;
	Wed,  5 Jun 2024 04:16:38 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764C410E686;
 Wed,  5 Jun 2024 04:16:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Drop_EXEC=5FQUE?=
 =?utf-8?q?UE=5FFLAG=5FBANNED?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Jun 2024 04:16:33 -0000
Message-ID: <171756099348.2266944.12318902909566584588@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240604184700.1946918-1-matthew.brost@intel.com>
In-Reply-To: <20240604184700.1946918-1-matthew.brost@intel.com>
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

Series: drm/xe: Drop EXEC_QUEUE_FLAG_BANNED
URL   : https://patchwork.freedesktop.org/series/134466/
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
commit 24d74a7bb94923ec1344d0fbf717edfbc8a6d4aa
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Jun 4 11:47:00 2024 -0700

    drm/xe: Drop EXEC_QUEUE_FLAG_BANNED
    
    Clean up laying violation of setting q->flags EXEC_QUEUE_FLAG_BANNED bit
    in GuC backend. Move banned to GuC owned bit and report banned status to
    upper layers via reset_status vfunc. This is a slight change in behavior
    as reset_status returns true if wedged or killed bits set too, but in
    all of these cases submission to queue is no longer allowed.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 596cf447db94909c4788fd612876520531e439b0 drm-intel
24d74a7bb949 drm/xe: Drop EXEC_QUEUE_FLAG_BANNED


