Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD68C0219C
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 14:06:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799E110EB14;
	Fri,  7 Feb 2025 14:06:13 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11B110EB09;
 Fri,  7 Feb 2025 14:05:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/sched=3A_Use_struct_f?=
 =?utf-8?q?or_drm=5Fsched=5Finit=28=29_params_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Philipp Stanner" <phasta@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Feb 2025 14:05:54 -0000
Message-ID: <173893715498.2663815.18184644292756179474@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250207110248.19435-2-phasta@kernel.org>
In-Reply-To: <20250207110248.19435-2-phasta@kernel.org>
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

Series: drm/sched: Use struct for drm_sched_init() params (rev3)
URL   : https://patchwork.freedesktop.org/series/143883/
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
commit 3cd49c7d7c0943633394c1646a8c5183bb881881
Author: Philipp Stanner <phasta@kernel.org>
Date:   Fri Feb 7 12:02:48 2025 +0100

    drm/sched: Use struct for drm_sched_init() params
    
    drm_sched_init() has a great many parameters and upcoming new
    functionality for the scheduler might add even more. Generally, the
    great number of parameters reduces readability and has already caused
    one missnaming in:
    
    commit 6f1cacf4eba7 ("drm/nouveau: Improve variable name in
    nouveau_sched_init()").
    
    Introduce a new struct for the scheduler init parameters and port all
    users.
    
    Signed-off-by: Philipp Stanner <phasta@kernel.org>
    Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
    Acked-by: Matthew Brost <matthew.brost@intel.com> # for Xe
    Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com> # for Panfrost and Panthor
    Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com> # for Etnaviv
    Reviewed-by: Frank Binns <frank.binns@imgtec.com> # for Imagination
    Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
+ /mt/dim checkpatch f8ea772f4fb5a761d1dc321aad5749633d0801eb drm-intel
3cd49c7d7c09 drm/sched: Use struct for drm_sched_init() params


