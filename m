Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330A7E77180
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 00:44:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E2E10EC94;
	Thu, 12 Dec 2024 00:44:45 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB09610EC94;
 Thu, 12 Dec 2024 00:44:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Remove_a_redund?=
 =?utf-8?q?ant_argument_check?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gwan-gyeong Mun" <gwan-gyeong.mun@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Dec 2024 00:44:44 -0000
Message-ID: <173396428469.1391498.5724711063434756283@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241211235036.348143-1-gwan-gyeong.mun@intel.com>
In-Reply-To: <20241211235036.348143-1-gwan-gyeong.mun@intel.com>
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

Series: drm/xe: Remove a redundant argument check
URL   : https://patchwork.freedesktop.org/series/142449/
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
commit 5796dc509233cf6e564bca8bc6fcb7ae236aac17
Author: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Date:   Thu Dec 12 01:50:36 2024 +0200

    drm/xe: Remove a redundant argument check
    
    Remove a redundant check for the extensions member variable of the
    drm_xe_vm_create structure from the xe_vm_create_ioctl function.
    
    Fixes: f3e9b1f43458 ("drm/xe: Remove async worker and rework sync binds")
    Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
+ /mt/dim checkpatch 9b5dff950301bf05d2e76745cacb457a0a82b50f drm-intel
5796dc509233 drm/xe: Remove a redundant argument check


