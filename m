Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9C5CEE330
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 17:14:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B974F10E793;
	Wed,  9 Oct 2024 17:14:58 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB27910E792;
 Wed,  9 Oct 2024 17:14:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=3A_Fix_inverte?=
 =?utf-8?q?d_logic_on_snapshot-=3Ecopy_check?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Colin Ian King" <colin.i.king@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Oct 2024 17:14:57 -0000
Message-ID: <172849409789.1211188.13992932683819767583@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241009160510.372195-1-colin.i.king@gmail.com>
In-Reply-To: <20241009160510.372195-1-colin.i.king@gmail.com>
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

Series: drm/xe/guc: Fix inverted logic on snapshot->copy check
URL   : https://patchwork.freedesktop.org/series/139799/
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
commit 265ed5794e0961e53a906a1f16137a64244425c8
Author: Colin Ian King <colin.i.king@gmail.com>
Date:   Wed Oct 9 17:05:10 2024 +0100

    drm/xe/guc: Fix inverted logic on snapshot->copy check
    
    Currently the check to see if snapshot->copy has been allocated is
    inverted and ends up dereferencing snapshot->copy when free'ing
    objects in the array when it is null or not free'ing the objects
    when snapshot->copy is allocated. Fix this by using the correct
    non-null pointer check logic.
    
    Fixes: d8ce1a977226 ("drm/xe/guc: Use a two stage dump for GuC logs and add more info")
    Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
    Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch 5ac8672cc80fd6228fbdcee22771f9f86b811eef drm-intel
265ed5794e09 drm/xe/guc: Fix inverted logic on snapshot->copy check


