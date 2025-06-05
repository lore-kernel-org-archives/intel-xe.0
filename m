Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74B4C5AE59
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 09:08:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C94310E85F;
	Thu,  5 Jun 2025 09:08:57 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B865F10E85F;
 Thu,  5 Jun 2025 09:08:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_don=27t_store_t?=
 =?utf-8?q?he_xe_device_pointer_inside_xe=5Fttm=5Ftt_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dave Airlie" <airlied@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Jun 2025 09:08:55 -0000
Message-ID: <174911453575.51389.5270010155361313895@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250605062103.1234620-1-airlied@gmail.com>
In-Reply-To: <20250605062103.1234620-1-airlied@gmail.com>
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

Series: drm/xe: don't store the xe device pointer inside xe_ttm_tt (rev2)
URL   : https://patchwork.freedesktop.org/series/149347/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b77e3b5ed150a03e2bd803136d0c278d00f0ce1c
Author: Dave Airlie <airlied@redhat.com>
Date:   Thu Jun 5 16:21:02 2025 +1000

    drm/xe: don't store the xe device pointer inside xe_ttm_tt
    
    This device pointer is nearly always available without storing
    an extra copy for each tt in the system.
    
    Just noticed this while reading over the xe shrinker code.
    
    Signed-off-by: Dave Airlie <airlied@redhat.com>
+ /mt/dim checkpatch 8a08b8454eecd8f3abaf032d8fb0906b56fa7c6a drm-intel
b77e3b5ed150 drm/xe: don't store the xe device pointer inside xe_ttm_tt


