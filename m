Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE7CC4345F
	for <intel-xe@archiver.kernel.org>; Sun, 28 Apr 2024 21:38:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6812011238C;
	Sun, 28 Apr 2024 21:38:24 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A361121C0;
 Sun, 28 Apr 2024 21:38:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_add_wopcm_regio?=
 =?utf-8?q?n_size_to_the_device_info?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Farah Kassabri" <fkassabri@habana.ai>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 28 Apr 2024 21:38:23 -0000
Message-ID: <171434030395.1737410.5767120354828794522@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240424104802.311322-1-fkassabri@habana.ai>
In-Reply-To: <20240424104802.311322-1-fkassabri@habana.ai>
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

Series: drm/xe: add wopcm region size to the device info
URL   : https://patchwork.freedesktop.org/series/133002/
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
commit 869f584a985ddc7495c2853801de4baa28872498
Author: Farah Kassabri <fkassabri@habana.ai>
Date:   Wed Apr 24 13:48:02 2024 +0300

    drm/xe: add wopcm region size to the device info
    
    As each product may have different wopcm region size,
    it's better to have this information as part of the device
    descriptor, that way we won't need to keep adding more
    else cases to the function which retrieve that size for
    future products.
    
    Signed-off-by: Farah Kassabri <fkassabri@habana.ai>
+ /mt/dim checkpatch 94a0eea182f0a8b1ff4cd6269bcb0d26bb4994f2 drm-intel
869f584a985d drm/xe: add wopcm region size to the device info


