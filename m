Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9306C27C4F
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jun 2024 19:58:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C54610E223;
	Fri, 21 Jun 2024 19:58:32 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A81A10E1A7;
 Fri, 21 Jun 2024 19:58:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Get_XE=5FFORCEW?=
 =?utf-8?q?AKE=5FALL_to_read_RING=5FTIMESTAMP?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Jun 2024 19:58:31 -0000
Message-ID: <171899991164.132113.12825734339499798701@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240621192325.227230-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20240621192325.227230-1-umesh.nerlige.ramappa@intel.com>
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

Series: drm/xe: Get XE_FORCEWAKE_ALL to read RING_TIMESTAMP
URL   : https://patchwork.freedesktop.org/series/135196/
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
commit be220bc6a2b9bfd02cce9ca37b8a1bcdf443842c
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date:   Sat Jun 22 03:23:25 2024 +0800

    drm/xe: Get XE_FORCEWAKE_ALL to read RING_TIMESTAMP
    
    Per client engine utilization uses RING_TIMESTAMP to return
    drm-total-cycles to the user. We read only the rcs RING_TIMESTAMP in
    platforms that have render. While this works for rcs and
    ccs, it is observed that this value is 0 when running work on bcs, vcs
    and vecs. Ideally we should read the engine specific RING_TIMESTAMP, but
    to keep the logic simple, just get XE_FORCEWAKE_ALL instead of XE_GT_FW.
    
    This should work fine on multi-gt platforms as well since the
    gt_timestamp is in sync on all GTs.
    
    Fixes: 188ced1e0ff8 ("drm/xe/client: Print runtime to fdinfo")
    Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
+ /mt/dim checkpatch 383dc44a79848f13f2430c9ed811b5c9b22b882a drm-intel
be220bc6a2b9 drm/xe: Get XE_FORCEWAKE_ALL to read RING_TIMESTAMP


