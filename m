Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5695CC25B5C
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 18:08:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113BA10E8F5;
	Mon,  6 May 2024 18:08:28 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F15710E6BA;
 Mon,  6 May 2024 18:08:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/ads=3A_Use_flexibl?=
 =?utf-8?q?e-array?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 May 2024 18:08:26 -0000
Message-ID: <171501890665.1941770.12815227184809593910@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240506141917.205714-1-lucas.demarchi@intel.com>
In-Reply-To: <20240506141917.205714-1-lucas.demarchi@intel.com>
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

Series: drm/xe/ads: Use flexible-array
URL   : https://patchwork.freedesktop.org/series/133240/
State : warning

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
commit ce4d7629d790e9740010d032277433fec1671b1a
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Mon May 6 07:19:17 2024 -0700

    drm/xe/ads: Use flexible-array
    
    Zero-length arrays are deprecated and flexible arrays should be used
    instead: https://www.kernel.org/doc/html/v6.9-rc7/process/deprecated.html#zero-length-and-one-element-arrays
    
    Reported-by: kernel test robot <lkp@intel.com>
    Reported-by: Julia Lawall <julia.lawall@inria.fr>
    Closes: https://lore.kernel.org/r/202405051824.AmjAI5Pg-lkp@intel.com/
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 47082f3bfe201756960b6ac0e0af31495d9a53f5 drm-intel
ce4d7629d790 drm/xe/ads: Use flexible-array
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
instead: https://www.kernel.org/doc/html/v6.9-rc7/process/deprecated.html#zero-length-and-one-element-arrays

-:7: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'instead:', use 'Link:' or 'Closes:' instead
#7: 
instead: https://www.kernel.org/doc/html/v6.9-rc7/process/deprecated.html#zero-length-and-one-element-arrays

-:9: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#9: 
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@inria.fr>

total: 0 errors, 3 warnings, 0 checks, 8 lines checked


