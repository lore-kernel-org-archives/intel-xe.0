Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4748CD0C5FB
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 10:30:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C6210EA75;
	Fri, 25 Oct 2024 10:30:31 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CAC210EA75;
 Fri, 25 Oct 2024 10:30:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Rework_throttle?=
 =?utf-8?q?_ABI?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Oct 2024 10:30:31 -0000
Message-ID: <172985223117.1331322.6783170893693910074@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241025092238.167042-1-raag.jadav@intel.com>
In-Reply-To: <20241025092238.167042-1-raag.jadav@intel.com>
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

Series: drm/xe: Rework throttle ABI
URL   : https://patchwork.freedesktop.org/series/140481/
State : warning

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
commit 766fcc145d25e9224f80e1dc57d206f438735414
Author: Raag Jadav <raag.jadav@intel.com>
Date:   Fri Oct 25 14:52:38 2024 +0530

    drm/xe: Rework throttle ABI
    
    Current implementation adds multiple sysfs entries for getting GT
    throttle status and its reasons, which forces the user to read multiple
    entries for evaluating the result. Since output of each entry is based
    on the same underlying hardware register and considering the access type
    of this register is RO/v, the value of this register can change at any
    given point, even between subsequent sysfs reads. This makes current
    implementation fundamentally flawed which can produce inconsistent results.
    
    Rework throttle ABI and introduce throttle_status attribute which will
    provide throttle status through a oneshot register read, making it
    relatively less error prone. The new ABI will provide throttle reasons
    in a string based list based on the respective bits which are set in the
    hardware. Empty output means no bits are set and hence no throttling.
    
    $ cat /sys/devices/.../tile0/gt0/freq0/throttle_status
    prochot
    thermal
    ratl
    thermalert
    tdc
    pl4
    pl1
    pl2
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2810
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
+ /mt/dim checkpatch 7cadd167321b3267a9803aba88f115fc9809d4ea drm-intel
766fcc145d25 drm/xe: Rework throttle ABI
-:72: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#72: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:35:
+};
+static_assert(ARRAY_SIZE(throttle_reasons) == ffs(POWER_LIMIT_2_MASK));

total: 0 errors, 0 warnings, 1 checks, 253 lines checked


