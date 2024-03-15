Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF43C54E58
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 06:01:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BA3310F81B;
	Fri, 15 Mar 2024 06:01:12 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D4410F86C;
 Fri, 15 Mar 2024 06:01:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/display=3A_mark_dp?=
 =?utf-8?q?t_as_uncached_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 15 Mar 2024 06:01:10 -0000
Message-ID: <171048247086.795078.8538499146075390446@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240314162054.75751-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20240314162054.75751-1-juhapekka.heikkila@gmail.com>
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

Series: drm/xe/display: mark dpt as uncached (rev2)
URL   : https://patchwork.freedesktop.org/series/131146/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e080d0e7447646d3d0c0b2b654570f4cd217a3c5
Author: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date:   Thu Mar 14 18:20:54 2024 +0200

    drm/xe/display: mark dpt as uncached
    
    make dpt as uncached to avoid pipe faults on some devices
    
    Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch b7ead5c90db25002638773b1a9289220e6a36b4d drm-intel
e080d0e74476 drm/xe/display: mark dpt as uncached


