Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFFEC54791
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 20:01:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A75210F87F;
	Wed, 13 Mar 2024 20:01:06 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A43610F553;
 Wed, 13 Mar 2024 20:01:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/3=5D_drm/xe=3A_Introduce_a_simple_wedged_state?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 Mar 2024 20:01:05 -0000
Message-ID: <171036006510.732671.27228695655808180@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240313195459.141463-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240313195459.141463-1-rodrigo.vivi@intel.com>
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

Series: series starting with [1/3] drm/xe: Introduce a simple wedged state
URL   : https://patchwork.freedesktop.org/series/131097/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6c105fa6848bdb98740475d07f3aea22ed6ba887
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Wed Mar 13 15:54:59 2024 -0400

    drm/xe: Force wedged state and block GT reset upon any GPU hang
    
    In many validation situations when debugging GPU Hangs,
    it is useful to preserve the GT situation from the moment
    that the timeout occurred.
    
    This patch introduces a module parameter that could be used
    on situations like this.
    
    If xe.wedged module parameter is set to 2, Xe will be declared
    wedged on every single execution timeout (a.k.a. GPU hang) right
    after devcoredump snapshot capture and without attempting any
    kind of GT reset and blocking entirely any kind of execution.
    
    Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
    Cc: Himanshu Somaiya <himanshu.somaiya@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch a636de6272a7883e73563d5049a48df02e67bf70 drm-intel
7e945b6b3924 drm/xe: Introduce a simple wedged state
-:91: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 12)
#91: FILE: drivers/gpu/drm/xe/xe_gt.c:636:
+	if (xe_device_wedged(gt_to_xe(gt)))
+	    return -ECANCELED;

-:92: WARNING:TABSTOP: Statements should start on a tabstop
#92: FILE: drivers/gpu/drm/xe/xe_gt.c:637:
+	    return -ECANCELED;

-:113: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 12)
#113: FILE: drivers/gpu/drm/xe/xe_migrate.c:716:
+	if (xe_device_wedged(xe))
+	    return ERR_PTR(-ECANCELED);

-:114: WARNING:TABSTOP: Statements should start on a tabstop
#114: FILE: drivers/gpu/drm/xe/xe_migrate.c:717:
+	    return ERR_PTR(-ECANCELED);

-:123: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 12)
#123: FILE: drivers/gpu/drm/xe/xe_migrate.c:992:
+	if (xe_device_wedged(xe))
+	    return ERR_PTR(-ECANCELED);

-:124: WARNING:TABSTOP: Statements should start on a tabstop
#124: FILE: drivers/gpu/drm/xe/xe_migrate.c:993:
+	    return ERR_PTR(-ECANCELED);

total: 0 errors, 6 warnings, 0 checks, 79 lines checked
514052b68dc5 drm/xe: declare wedged and abort probe upon GuC load failure
6c105fa6848b drm/xe: Force wedged state and block GT reset upon any GPU hang


