Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C367C3DA41
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 11:17:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC13B10E1C9;
	Tue,  9 Jul 2024 11:17:56 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 726B410E1C9;
 Tue,  9 Jul 2024 11:17:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Restrict_Xe2_to_use_64K_p?=
 =?utf-8?q?ages_for_scanout_buffers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 09 Jul 2024 11:17:54 -0000
Message-ID: <172052387446.86056.5349418800155189091@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240709111231.490440-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20240709111231.490440-1-zbigniew.kempczynski@intel.com>
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

Series: Restrict Xe2 to use 64K pages for scanout buffers
URL   : https://patchwork.freedesktop.org/series/135894/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit cf0a106bd2d316ed7ca78bf1d7f7a39dec55df9d
Author: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Date:   Tue Jul 9 13:12:31 2024 +0200

    drm/xe: Use 64K pages for scanout buffers for Xe2
    
    Set Xe2 platforms to use 64K pages for display.
    
    Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch b517815c3f82589b802e2dccb11c8585fda13979 drm-intel
33157d8ca0a0 drm/xe: Separate 64K physical allocation for display
cf0a106bd2d3 drm/xe: Use 64K pages for scanout buffers for Xe2


