Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D519CFB440
	for <intel-xe@archiver.kernel.org>; Mon,  7 Oct 2024 11:40:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC1AB10E332;
	Mon,  7 Oct 2024 11:40:58 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E17210E332;
 Mon,  7 Oct 2024 11:40:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/tests=3A_include_l?=
 =?utf-8?q?inux/prandom=2Eh_as_well_as_linux/random=2Eh?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 07 Oct 2024 11:40:58 -0000
Message-ID: <172830125811.1197975.7567038716977715497@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241004132037.57528-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20241004132037.57528-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe/tests: include linux/prandom.h as well as linux/random.h
URL   : https://patchwork.freedesktop.org/series/139561/
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
commit e5d6e5fc0cb17fdfcc018217faabc30dbb3ea752
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Fri Oct 4 15:20:37 2024 +0200

    drm/xe/tests: include linux/prandom.h as well as linux/random.h
    
    The linux/prandom.h file was previously included from linux/random.h
    but starting with commit
    
    38d1a9d296c8 ("random: Do not include <linux/prandom.h> in <linux/random.h>")
    
    That's no longer the case. Since we also use functions from
    <linux/random.h>, include both.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 9d79cb6da4e37d5ed37db2917b0b69c3f58cf845 drm-intel
e5d6e5fc0cb1 drm/xe/tests: include linux/prandom.h as well as linux/random.h
-:13: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#13: 
38d1a9d296c8 ("random: Do not include <linux/prandom.h> in <linux/random.h>")

total: 0 errors, 1 warnings, 0 checks, 7 lines checked


