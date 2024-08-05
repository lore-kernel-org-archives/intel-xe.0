Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6409C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon,  5 Aug 2024 06:26:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92DB810E126;
	Mon,  5 Aug 2024 06:26:44 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB27910E128;
 Mon,  5 Aug 2024 06:26:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/observation=3A_Dro?=
 =?utf-8?q?p_empty_sysctl_table_entry?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 05 Aug 2024 06:26:42 -0000
Message-ID: <172283920282.539576.1613143768322043681@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240805062057.3547560-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240805062057.3547560-1-ashutosh.dixit@intel.com>
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

Series: drm/xe/observation: Drop empty sysctl table entry
URL   : https://patchwork.freedesktop.org/series/136874/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9e645341d3008ce246879af606f45d0e5d21d698
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit aacd83886284c4b77361de4c3ae06d95a5a93fca
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Sun Aug 4 23:20:57 2024 -0700

    drm/xe/observation: Drop empty sysctl table entry
    
    An empty sysctl table entry was inadvertently left behind for observation
    sysctl. The breaks on 6.11 with the following errors:
    
    [  219.654850] sysctl table check failed: dev/xe/(null) procname is null
    [  219.654862] sysctl table check failed: dev/xe/(null) No proc_handler
    
    Drop the empty entry.
    
    Fixes: 8169b2097d88 ("drm/xe/uapi: Rename xe perf layer as xe observation layer")
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2419
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 0b8d955bfdcf0864a764a125ab13bc0fd81f3b71 drm-intel
aacd83886284 drm/xe/observation: Drop empty sysctl table entry


