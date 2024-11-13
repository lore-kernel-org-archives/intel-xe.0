Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D25ED41C3F
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 12:53:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEFC610E6E8;
	Wed, 13 Nov 2024 12:53:12 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C48110E6E8;
 Wed, 13 Nov 2024 12:53:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/oa=3A_Increase_def?=
 =?utf-8?q?ault_OA_buffer_size_to_128_M_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 Nov 2024 12:53:12 -0000
Message-ID: <173150239211.3583531.13517810973203936217@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241112214255.3580459-1-ashutosh.dixit@intel.com>
In-Reply-To: <20241112214255.3580459-1-ashutosh.dixit@intel.com>
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

Series: drm/xe/oa: Increase default OA buffer size to 128 M (rev3)
URL   : https://patchwork.freedesktop.org/series/140390/
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
commit 3c8341523bebbf8e55b358ad9f87ef962d1b13e8
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Tue Nov 12 13:42:55 2024 -0800

    drm/xe/oa: Increase default OA buffer size to 128 M
    
    Increase default OA buffer size to 128 MB from the current 16 MB. A larger
    OA buffer allows more flexibility to userland to read data before overrun's
    occur.
    
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 169c7cd31a373ed31054abb423981856eb5fb119 drm-intel
3c8341523beb drm/xe/oa: Increase default OA buffer size to 128 M


