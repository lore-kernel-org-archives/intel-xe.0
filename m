Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E69C25B77
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 16:27:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A0C610E2CD;
	Wed, 15 May 2024 16:27:45 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D0E10E2CD;
 Wed, 15 May 2024 16:27:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Update_on_habanalabs=2C_X?=
 =?utf-8?q?e_maintainer_status?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oded Gabbay" <ogabbay@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 May 2024 16:27:43 -0000
Message-ID: <171579046373.2118792.4794274989375870289@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240515162222.12958-1-ogabbay@kernel.org>
In-Reply-To: <20240515162222.12958-1-ogabbay@kernel.org>
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

Series: Update on habanalabs, Xe maintainer status
URL   : https://patchwork.freedesktop.org/series/133661/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
57b97a66dd129aea93991dc66cd10477f7a05cf8
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fcf844de342ad9a6a76379b55979ed9632cd859d
Author: Oded Gabbay <ogabbay@kernel.org>
Date:   Wed May 15 19:22:22 2024 +0300

    MAINTAINERS: update Xe driver maintainers
    
    Because I left Intel, I'm removing myself from the list
    of Xe driver maintainers.
    
    Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
+ /mt/dim checkpatch d98c9eae84056cb2d86293c145234017681f09f4 drm-intel
bb15967acdf1 MAINTAINERS: Change habanalabs maintainer and git repo path
fcf844de342a MAINTAINERS: update Xe driver maintainers


