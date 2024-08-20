Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4697AC5320E
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 09:38:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1296710E633;
	Tue, 20 Aug 2024 09:38:39 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1163010E630;
 Tue, 20 Aug 2024 09:38:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Add_NULL_check_?=
 =?utf-8?q?before_deferencing_pointer_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: apoorva.singh@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 Aug 2024 09:38:38 -0000
Message-ID: <172414671806.698595.951407353511922028@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240820085454.976636-1-apoorva.singh@intel.com>
In-Reply-To: <20240820085454.976636-1-apoorva.singh@intel.com>
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

Series: drm/xe: Add NULL check before deferencing pointer (rev3)
URL   : https://patchwork.freedesktop.org/series/137289/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 49149f0620c8945cfec0115753acc9064830aea8
Author: Apoorva Singh <apoorva.singh@intel.com>
Date:   Tue Aug 20 14:24:54 2024 +0530

    drm/xe: Add NULL check before dereferencing pointer lrc->bo in xe_lrc_snapshot_capture()
    
    Add NULL check before deferencing of lrc->bo in
    xe_lrc_snapshot_capture().
    
    Free the dynamically allocated memory for snapshot
    to avoid memory leak.
    
    Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
+ /mt/dim checkpatch 5287d615dcd1e37c2f818ad0a5f2cfc3e25710a5 drm-intel
49149f0620c8 drm/xe: Add NULL check before dereferencing pointer lrc->bo in xe_lrc_snapshot_capture()


