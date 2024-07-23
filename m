Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5895FC3DA63
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 23:28:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E7410E177;
	Tue, 23 Jul 2024 23:28:06 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C8710E177;
 Tue, 23 Jul 2024 23:28:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe2=3A_Enable_Prio?=
 =?utf-8?q?rity_Mem_Read_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pallavi Mishra" <pallavi.mishra@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Jul 2024 23:28:01 -0000
Message-ID: <172177728155.360839.11360656340314002553@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240723233131.1122655-1-pallavi.mishra@intel.com>
In-Reply-To: <20240723233131.1122655-1-pallavi.mishra@intel.com>
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

Series: drm/xe/xe2: Enable Priority Mem Read (rev6)
URL   : https://patchwork.freedesktop.org/series/134038/
State : success

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
commit b7944a6e06a87173bd60d016b337ad41c6ad6ddb
Author: Pallavi Mishra <pallavi.mishra@intel.com>
Date:   Wed Jul 24 05:01:31 2024 +0530

    drm/xe/xe2: Enable Priority Mem Read
    
    Enable feature to allow memory reads to take a priority memory path.
    This will reduce latency on the read path, but may introduce read after
    write (RAW) hazards as read and writes will no longer be ordered.
    
    To avoid RAW hazards, SW can use the MI_MEM_FENCE command or any other
    MI command that generates non posted memory writes.  This will ensure
    data is coherent in memory prior to execution of commands which read
    data from memory.
    
    No pattern identified in KMD that could lead to a hazard.
    
    v2: Modify commit message, enable priority mem read feature for media,
    modify version range, modify bspec detail (Matt Roper)
    
    v3: Rebase, fix cramped line-wrapping (jcavitt)
    
    v4: Rebase
    
    Bspec: 60298, 60237, 60187, 60188
    
    Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
    Acked-by: José Roberto de Souza <jose.souza@intel.com>
    Acked-by: Carl Zhang <carl.zhang@intel.com>
+ /mt/dim checkpatch b4f66aefb5cd89dc39e187d6c622f1493630eb08 drm-intel
b7944a6e06a8 drm/xe/xe2: Enable Priority Mem Read


