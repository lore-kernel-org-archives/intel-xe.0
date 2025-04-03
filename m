Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58460C3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 06:20:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C15010E1AE;
	Thu,  3 Apr 2025 06:20:33 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39B910E1AE;
 Thu,  3 Apr 2025 06:20:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Fix_xe=5Fpt=5Fs?=
 =?utf-8?q?tage=5Fbind=5Fwalk_kerneldoc?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Apr 2025 06:20:31 -0000
Message-ID: <174366123186.31032.15669830817943608579@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250402122924.25526-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250402122924.25526-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Fix xe_pt_stage_bind_walk kerneldoc
URL   : https://patchwork.freedesktop.org/series/147131/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d666befaf360594c809204c899f9bfd4d0d71b77
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Apr 2 14:29:24 2025 +0200

    drm/xe: Fix xe_pt_stage_bind_walk kerneldoc
    
    The structure was missing a proper kerneldoc header and once
    that was added a number of typos and errors became obvious.
    Fix those.
    
    Reported-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Closes: https://lore.kernel.org/intel-xe/x53tcs5bjldw6lcorjemuheklxcmepdvr2u7lvt3hpqrzqoc4h@nsu6hs25taqj/
    Fixes: b2d4b03b03a7 ("drm/xe: Make the PT code handle placement per PTE rather than per vma / range")
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 135e2838ed7d44d880e7e19971b1234e6ae04ded drm-intel
d666befaf360 drm/xe: Fix xe_pt_stage_bind_walk kerneldoc


