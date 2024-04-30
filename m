Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E87B4C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 23:40:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5664112F86;
	Tue, 30 Apr 2024 23:40:07 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B54D112F87;
 Tue, 30 Apr 2024 23:40:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=3A_Improve_rob?=
 =?utf-8?q?ustness_of_GuC_log_dumping_to_dmesg?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 30 Apr 2024 23:40:06 -0000
Message-ID: <171452040650.1793171.10729421098811118650@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240430233436.2838165-1-John.C.Harrison@Intel.com>
In-Reply-To: <20240430233436.2838165-1-John.C.Harrison@Intel.com>
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

Series: drm/xe/guc: Improve robustness of GuC log dumping to dmesg
URL   : https://patchwork.freedesktop.org/series/133109/
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
commit aa70a894480df92a8a5c815ea790eeef2647e552
Author: John Harrison <John.C.Harrison@Intel.com>
Date:   Tue Apr 30 16:34:36 2024 -0700

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
    
    Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch 3ac3efef3a1fc9d494b0a63c78bd0039a0b3d009 drm-intel
aa70a894480d drm/xe/guc: Improve robustness of GuC log dumping to dmesg


