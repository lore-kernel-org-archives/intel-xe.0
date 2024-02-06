Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796A7C48297
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 13:07:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF95112BB3;
	Tue,  6 Feb 2024 13:07:30 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE23112BB6;
 Tue,  6 Feb 2024 13:07:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/ttm=3A_improve_idle/b?=
 =?utf-8?q?usy_handling_v4?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 Feb 2024 13:07:29 -0000
Message-ID: <170722484938.1055288.6051096398752973470@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240206130353.13610-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240206130353.13610-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/ttm: improve idle/busy handling v4
URL   : https://patchwork.freedesktop.org/series/129579/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 65cd86d6f8db6d946629cfd6249e58f9e6b5605e
Author: Christian König <ckoenig.leichtzumerken@gmail.com>
Date:   Tue Feb 6 14:03:53 2024 +0100

    drm/ttm: improve idle/busy handling v4
    
    Previously we would never try to move a BO into the preferred placements
    when it ever landed in a busy placement since those were considered
    compatible.
    
    Rework the whole handling and finally unify the idle and busy handling.
    ttm_bo_validate() is now responsible to try idle placement first and then
    use the busy placement if that didn't worked.
    
    Drawback is that we now always try the idle placement first for each
    validation which might cause some additional CPU overhead on overcommit.
    
    v2: fix kerneldoc warning and coding style
    v3: take care of XE as well
    v4: keep the ttm_bo_mem_space functionality as it is for now, only add
        new handling for ttm_bo_validate as suggested by Thomas
    
    Signed-off-by: Christian König <christian.koenig@amd.com>
    Reviewed-by: Zack Rusin <zack.rusin@broadcom.com> v3
+ /mt/dim checkpatch 0e38a251464c5d2f528d78102e2cb3dfac61ed0e drm-intel
65cd86d6f drm/ttm: improve idle/busy handling v4
-:26: WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Zack Rusin <zack.rusin@broadcom.com> v3', should be: 'Zack Rusin <zack.rusin@broadcom.com> (v3)'
#26: 
Reviewed-by: Zack Rusin <zack.rusin@broadcom.com> v3

-:387: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: "Christian König" <ckoenig.leichtzumerken@gmail.com>' != 'Signed-off-by: Christian König <christian.koenig@amd.com>'

total: 0 errors, 2 warnings, 0 checks, 341 lines checked


