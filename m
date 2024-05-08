Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C62C04FFE
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 22:55:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B8710E8B7;
	Wed,  8 May 2024 22:55:09 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BAB110E8B7;
 Wed,  8 May 2024 22:55:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Imrpove_GuC_debug_log/sta?=
 =?utf-8?q?tus_output?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 May 2024 22:55:08 -0000
Message-ID: <171520890856.2023278.315443691219244337@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240508224927.11341-1-John.C.Harrison@Intel.com>
In-Reply-To: <20240508224927.11341-1-John.C.Harrison@Intel.com>
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

Series: Imrpove GuC debug log/status output
URL   : https://patchwork.freedesktop.org/series/133349/
State : success

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
commit c9dd29709e0ab71ed27362e085d2d7509ec93c6f
Author: John Harrison <John.C.Harrison@Intel.com>
Date:   Wed May 8 15:49:27 2024 -0700

    drm/xe/guc: Improve robustness of GuC log dumping to dmesg
    
    There is a debug mechanism for dumping the GuC log as an ASCII hex
    stream via dmesg. This is extremely useful for situations where it is
    not possibe to query the log from debugfs (self tests, bugs that cause
    the driver to fail to load, system hangs, etc.). However, dumping via
    dmesg is not the most reliable. The dmesg buffer is limited in size,
    can be rate limited and a simple hex stream is hard to parse by tools.
    
    So add extra information to the dump to make it more robust and
    parsable. This includes adding start and end tags to delimit the dump,
    using longer lines to reduce the per line overhead, adding a rolling
    count to check for missing lines and interleaved concurrent dumps and
    adding other important information such as the GuC version number and
    timestamp offset.
    
    v2: Remove pm get/put as unnecessary (review feedback from Matthew B).
    v3: Add firmware filename and 'wanted' version number.
    
    Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch c6956ea8134e150cf2f92585fb9e617182fac82b drm-intel
8b052696eaae drm/xe/guc: Remove spurious line feed in debug print
c9dd29709e0a drm/xe/guc: Improve robustness of GuC log dumping to dmesg


