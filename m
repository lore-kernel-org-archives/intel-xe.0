Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB57C54E41
	for <intel-xe@archiver.kernel.org>; Wed, 28 Feb 2024 09:25:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EAE810E9A5;
	Wed, 28 Feb 2024 09:25:55 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8506110E9A5;
 Wed, 28 Feb 2024 09:25:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/dp=3A_Fix_spelli?=
 =?utf-8?q?ng_mistake_=22redect=22_-=3E_=22reject=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Colin Ian King" <colin.i.king@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 Feb 2024 09:25:53 -0000
Message-ID: <170911235355.356522.384335936708345712@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240228092042.4125617-1-colin.i.king@gmail.com>
In-Reply-To: <20240228092042.4125617-1-colin.i.king@gmail.com>
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

Series: drm/i915/dp: Fix spelling mistake "redect" -> "reject"
URL   : https://patchwork.freedesktop.org/series/130487/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9ab59fc4b7cb7663906ac4471a262434aef57f03
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 51f005f9140f37611af58775d988e16d5359bd36
Author: Colin Ian King <colin.i.king@gmail.com>
Date:   Wed Feb 28 09:20:42 2024 +0000

    drm/i915/dp: Fix spelling mistake "redect" -> "reject"
    
    There is a spelling mistake in a drm_dbg_kms message. Fix it.
    
    Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
+ /mt/dim checkpatch 0fbbc7c5d35d6bef7e7849f4e627658c41671188 drm-intel
51f005f9140f drm/i915/dp: Fix spelling mistake "redect" -> "reject"


