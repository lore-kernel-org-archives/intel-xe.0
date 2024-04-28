Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD1CEC4345F
	for <intel-xe@archiver.kernel.org>; Sun, 28 Apr 2024 21:48:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D76510E373;
	Sun, 28 Apr 2024 21:48:19 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B92AE10E370;
 Sun, 28 Apr 2024 21:48:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm=3A_print_top_commit_sha_after_loading_the_driver?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Farah Kassabri" <fkassabri@habana.ai>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 28 Apr 2024 21:48:18 -0000
Message-ID: <171434089875.1737410.7738835189114462739@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240424100706.269523-1-fkassabri@habana.ai>
In-Reply-To: <20240424100706.269523-1-fkassabri@habana.ai>
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

Series: series starting with [1/2] drm: print top commit sha after loading the driver
URL   : https://patchwork.freedesktop.org/series/133000/
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
commit 80aaad3d857c19dbd4e8481a504b23dc861fbe7e
Author: Farah Kassabri <fkassabri@habana.ai>
Date:   Wed Apr 24 13:07:06 2024 +0300

    drm/xe: set last driver commit sha
    
    This patch will set the last driver commit sha into the drm driver
    info data structure, which will be used in the log message which
    prints the device info at the end of the driver initialization.
    
    Signed-off-by: Farah Kassabri <fkassabri@habana.ai>
+ /mt/dim checkpatch 94a0eea182f0a8b1ff4cd6269bcb0d26bb4994f2 drm-intel
cb374b72f57d drm: print top commit sha after loading the driver
80aaad3d857c drm/xe: set last driver commit sha


