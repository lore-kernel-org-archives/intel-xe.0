Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679ADC4345F
	for <intel-xe@archiver.kernel.org>; Sat,  4 May 2024 00:17:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358F510F209;
	Sat,  4 May 2024 00:17:17 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2CCE10F209;
 Sat,  4 May 2024 00:17:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/mocs=3A_Add_debugf?=
 =?utf-8?q?s_node_to_dump_mocs_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 04 May 2024 00:17:15 -0000
Message-ID: <171478183573.1888398.2277332051186111550@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240503193902.2056202-1-janga.rahul.kumar@intel.com>
In-Reply-To: <20240503193902.2056202-1-janga.rahul.kumar@intel.com>
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

Series: drm/xe/mocs: Add debugfs node to dump mocs (rev5)
URL   : https://patchwork.freedesktop.org/series/131425/
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
commit 510ad05d0d80188147cff0018e26735785b832e6
Author: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Date:   Sat May 4 01:09:02 2024 +0530

    drm/xe/mocs: Add debugfs node to dump mocs
    
    This is useful to check mocs configuration. Tests/Tools can use
    this debugfs entry to get mocs info.
    
    v2: Address review comments. Change debugfs output style similar
    to pat debugfs. (Lucas De Marchi)
    
    v3: rebase.
    
    v4: Address review comments. Use function pointer inside ops
    struct. Update Test-with links. Remove usage of flags wherever
    not required. (Lucas De Marchi)
    
    v5: Address review comments. Move register defines. Modify mocs
    info struct to avoid holes. (Luca De Marchi)
    
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
+ /mt/dim checkpatch ca96a1c62451ea534391d1eafe3a0b5691658c02 drm-intel
d3a6bad0c8df drm/xe: Relocate regs_are_mcr function
510ad05d0d80 drm/xe/mocs: Add debugfs node to dump mocs


