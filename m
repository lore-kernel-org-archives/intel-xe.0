Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1D3C3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 20:16:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7676E10E627;
	Tue, 23 Jul 2024 20:16:14 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D33410E627;
 Tue, 23 Jul 2024 20:16:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_possible_UA?=
 =?utf-8?q?F_in_guc=5Fexec=5Fqueue=5Fprocess=5Fmsg_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Jul 2024 20:16:12 -0000
Message-ID: <172176577250.360643.5312279020014628703@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240723191903.1753729-1-matthew.brost@intel.com>
In-Reply-To: <20240723191903.1753729-1-matthew.brost@intel.com>
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

Series: drm/xe: Fix possible UAF in guc_exec_queue_process_msg (rev2)
URL   : https://patchwork.freedesktop.org/series/136397/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5ce3e132caaa5b45e5e50201b574a097d130967c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a3c7bb198ddd661a528e739b6416610ad982edc8
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Jul 23 12:19:03 2024 -0700

    drm/xe: Fix possible UAF in guc_exec_queue_process_msg
    
    Store xe_device ahead of processing message as message can be free'd in
    some cases.
    
    v2:
     - Including missing local changes
    
    Reported-by: kernel test robot <lkp@intel.com>
    Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
    Closes: https://lore.kernel.org/r/202407231445.rpisd1vA-lkp@intel.com/
    Fixes: d930c19fdff3 ("drm/xe: Build PM into GuC CT layer")
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 8a52c2cc81b4c9cfee85520ec8a9f29cfc319e7e drm-intel
a3c7bb198ddd drm/xe: Fix possible UAF in guc_exec_queue_process_msg
-:12: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#12: 
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>

total: 0 errors, 1 warnings, 0 checks, 16 lines checked


