Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0079C25B78
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 18:06:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9621D10F031;
	Tue, 21 May 2024 18:06:00 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F17E110F049;
 Tue, 21 May 2024 18:05:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_flush_gtt_befor?=
 =?utf-8?q?e_signalling_user_fence_on_media_engines?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 May 2024 18:05:58 -0000
Message-ID: <171631475898.2165162.11615149998284801441@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240521-xu_flush_vcs_before_ufence-v1-1-ded38b56c8c9@intel.com>
In-Reply-To: <20240521-xu_flush_vcs_before_ufence-v1-1-ded38b56c8c9@intel.com>
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

Series: drm/xe: flush gtt before signalling user fence on media engines
URL   : https://patchwork.freedesktop.org/series/133884/
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
commit b0dda01d264611746eb7b45b01f4eb5c0ca52d46
Author: Andrzej Hajda <andrzej.hajda@intel.com>
Date:   Tue May 21 17:23:46 2024 +0200

    drm/xe: flush gtt before signalling user fence on media engines
    
    Tests show that user fence signalling requires kind of write barrier,
    otherwise not all writes performed by the workload will be available
    to userspace.
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1488
    Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6 drm-intel
b0dda01d2646 drm/xe: flush gtt before signalling user fence on media engines


