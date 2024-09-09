Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF2FECE57A
	for <intel-xe@archiver.kernel.org>; Mon,  9 Sep 2024 13:28:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 573BF10E571;
	Mon,  9 Sep 2024 13:28:49 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE5A10E56E;
 Mon,  9 Sep 2024 13:28:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Use_ERR=5FCAST_?=
 =?utf-8?q?to_return_an_error-valued_pointer?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Yu Jiaoliang" <yujiaoliang@vivo.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 09 Sep 2024 13:28:47 -0000
Message-ID: <172588852756.976495.15749348557175641565@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240906070109.1852860-1-yujiaoliang@vivo.com>
In-Reply-To: <20240906070109.1852860-1-yujiaoliang@vivo.com>
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

Series: drm/xe: Use ERR_CAST to return an error-valued pointer
URL   : https://patchwork.freedesktop.org/series/138410/
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
commit 0ce297cfe1aa8355fd12a4b3623303fcdb082b27
Author: Yu Jiaoliang <yujiaoliang@vivo.com>
Date:   Fri Sep 6 15:01:09 2024 +0800

    drm/xe: Use ERR_CAST to return an error-valued pointer
    
    Instead of directly casting and returning an error-valued pointer,
    use ERR_CAST to make the error handling more explicit and improve
    code clarity.
    
    Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
+ /mt/dim checkpatch 36d222030253864ce07e73f27f631db5112d32c6 drm-intel
0ce297cfe1aa drm/xe: Use ERR_CAST to return an error-valued pointer


