Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D945FC6172
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 21:47:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5923910EDBD;
	Fri, 13 Sep 2024 21:47:40 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B459D10EDBA;
 Fri, 13 Sep 2024 21:47:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/display=3A_fix_t?=
 =?utf-8?q?ypo_in_the_comment?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Yan Zhen" <yanzhen@vivo.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Sep 2024 21:47:39 -0000
Message-ID: <172626405973.998525.8169026418532320256@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240913061727.170198-1-yanzhen@vivo.com>
In-Reply-To: <20240913061727.170198-1-yanzhen@vivo.com>
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

Series: drm/i915/display: fix typo in the comment
URL   : https://patchwork.freedesktop.org/series/138673/
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
commit 4ab67deed8c75d532dc7adfef6a01fa8bb405342
Author: Yan Zhen <yanzhen@vivo.com>
Date:   Fri Sep 13 14:17:27 2024 +0800

    drm/i915/display: fix typo in the comment
    
    Correctly spelled comments make it easier for the reader to understand
    the code.
    
    Replace 'platformas' with 'platforms' in the comment &
    replace 'prefere' with 'prefer' in the comment &
    replace 'corresponsding' with 'corresponding' in the comment &
    replace 'harizontal' with 'horizontal' in the comment.
    
    Signed-off-by: Yan Zhen <yanzhen@vivo.com>
+ /mt/dim checkpatch 2530827ab017894f2339dd308356366d6e87a72d drm-intel
4ab67deed8c7 drm/i915/display: fix typo in the comment


