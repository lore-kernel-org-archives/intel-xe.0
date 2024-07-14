Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5338C3DA42
	for <intel-xe@archiver.kernel.org>; Sun, 14 Jul 2024 20:54:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8544510E18A;
	Sun, 14 Jul 2024 20:54:19 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A828310E1C9;
 Sun, 14 Jul 2024 20:54:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/fbdev=3A_Limit_the?=
 =?utf-8?q?_usage_of_stolen_for_LNL+_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Uma Shankar" <uma.shankar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 14 Jul 2024 20:54:18 -0000
Message-ID: <172099045868.216037.3987554716670657374@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240714205659.3672665-1-uma.shankar@intel.com>
In-Reply-To: <20240714205659.3672665-1-uma.shankar@intel.com>
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

Series: drm/xe/fbdev: Limit the usage of stolen for LNL+ (rev2)
URL   : https://patchwork.freedesktop.org/series/135970/
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
commit e347c39b1851c056faac186bff486632e4dd32f5
Author: Uma Shankar <uma.shankar@intel.com>
Date:   Mon Jul 15 02:26:59 2024 +0530

    drm/xe/fbdev: Limit the usage of stolen for LNL+
    
    As per recommendation in the workarounds:
    WA_22019338487
    
    There is an issue with accessing Stolen memory pages due a
    hardware limitation. Limit the usage of stolen memory for
    fbdev for LNL+. Don't use BIOS FB from stolen on LNL+ and
    assign the same from system memory.
    
    v2: Corrected the WA Number, limited WA to LNL and
        Adopted XE_WA framework as suggested by Lucas and Matt.
    
    Signed-off-by: Uma Shankar <uma.shankar@intel.com>
+ /mt/dim checkpatch fc14b61b7bb24e2f2f5e42fd1c4aae66aaba669a drm-intel
e347c39b1851 drm/xe/fbdev: Limit the usage of stolen for LNL+


