Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB5DC5B543
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 13:07:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E7E10E812;
	Thu,  5 Jun 2025 13:07:44 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40C7810E812;
 Thu,  5 Jun 2025 13:07:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe3=3A_Disable_nul?=
 =?utf-8?q?l_query_for_anyhit_shader_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nitin Gote" <nitin.r.gote@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Jun 2025 13:07:43 -0000
Message-ID: <174912886326.51836.13402083190152688625@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250605100812.2547808-1-nitin.r.gote@intel.com>
In-Reply-To: <20250605100812.2547808-1-nitin.r.gote@intel.com>
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

Series: drm/xe/xe3: Disable null query for anyhit shader (rev2)
URL   : https://patchwork.freedesktop.org/series/148878/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 709dbfa35db7525e6968104fcf378f69bddbe8b7
Author: Nitin Gote <nitin.r.gote@intel.com>
Date:   Thu Jun 5 15:38:12 2025 +0530

    drm/xe/xe3: Disable null query for anyhit shader
    
    Set DIS_NULL_QUERY bit of RT_CTRL register to disable
    null query for anyhit shader for Xe3 IP.
    
    Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
    Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
+ /mt/dim checkpatch cbceb1c61ee3a50472a3155eb8166b36929541d8 drm-intel
709dbfa35db7 drm/xe/xe3: Disable null query for anyhit shader


