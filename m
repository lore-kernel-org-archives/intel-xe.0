Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E1ECCD1A0
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 11:54:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50AAE10E251;
	Wed, 18 Sep 2024 11:54:45 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0E7010E251;
 Wed, 18 Sep 2024 11:54:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Decrement_clien?=
 =?utf-8?q?t_count_immediately_on_file_close?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Sep 2024 11:54:44 -0000
Message-ID: <172666048485.1025760.12502915903066482807@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240918081150.280055-1-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20240918081150.280055-1-balasubramani.vivekanandan@intel.com>
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

Series: drm/xe: Decrement client count immediately on file close
URL   : https://patchwork.freedesktop.org/series/138801/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 35033f2cbe38a24a19547f55a205d97f82c6ca77
Author: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Date:   Wed Sep 18 13:41:50 2024 +0530

    drm/xe: Decrement client count immediately on file close
    
    Decrement the client count immediately on file close. It is not required
    to be deferred to the resource cleanup function. Otherwise there will be
    a small time window, where there will be a non-zero client count even
    after closing all open file handles.
    This affects ccs_mode(xe_compute) igt tests as these tests try to change
    the ccs_mode immediately after closing all file handles, but the driver
    rejects the ccs_mode change request as it sees a non-zero client count.
    
    Fixes: ce8c161cbad4 ("drm/xe: Add ref counting for xe_file")
    Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
+ /mt/dim checkpatch a7c4f56f92ff668c90423c9601e213f1944ff09a drm-intel
35033f2cbe38 drm/xe: Decrement client count immediately on file close


