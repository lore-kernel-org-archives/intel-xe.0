Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 600C3C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 26 Apr 2024 11:49:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B3241122E4;
	Fri, 26 Apr 2024 11:49:48 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5751122E6;
 Fri, 26 Apr 2024 11:49:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Fix_spelling_mi?=
 =?utf-8?q?stake_=22forcebly=22_-=3E_=22forcibly=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Colin Ian King" <colin.i.king@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 26 Apr 2024 11:49:47 -0000
Message-ID: <171413218724.1685485.3491227502412964690@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240426094904.816033-1-colin.i.king@gmail.com>
In-Reply-To: <20240426094904.816033-1-colin.i.king@gmail.com>
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

Series: drm/xe: Fix spelling mistake "forcebly" -> "forcibly"
URL   : https://patchwork.freedesktop.org/series/132952/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6ed6cbdf345ee627ff4c9740f1d1ec3b66f0545d
Author: Colin Ian King <colin.i.king@gmail.com>
Date:   Fri Apr 26 10:49:04 2024 +0100

    drm/xe: Fix spelling mistake "forcebly" -> "forcibly"
    
    There is a spelling mistake in a drm_dbg message. Fix it.
    
    Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
+ /mt/dim checkpatch 47c509a8d4944e6276f7b956061c2020323f0a90 drm-intel
6ed6cbdf345e drm/xe: Fix spelling mistake "forcebly" -> "forcibly"


