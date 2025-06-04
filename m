Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67047C5B543
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 15:13:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF2410E727;
	Wed,  4 Jun 2025 15:13:45 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C60CC10E727;
 Wed,  4 Jun 2025 15:13:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/bmg=3A_Update_PCI_?=
 =?utf-8?q?Id=27s_and_Workarounds_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 04 Jun 2025 15:13:43 -0000
Message-ID: <174905002380.48761.8451650214000646835@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250604145236.1143122-1-dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20250604145236.1143122-1-dnyaneshwar.bhadane@intel.com>
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

Series: drm/xe/bmg: Update PCI Id's and Workarounds (rev3)
URL   : https://patchwork.freedesktop.org/series/149641/
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
commit 217811ef3e6fda081df237af7d84c062d0cb4703
Author: Shekhar Chauhan <shekhar.chauhan@intel.com>
Date:   Wed Jun 4 20:22:36 2025 +0530

    drm/xe/xe2_hpg: Define additional Xe2_HPG GMD_ID
    
    Add another GMD_ID for Xe2_HPG
    
    Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
    Signed-off-by: James Ausmus <james.ausmus@intel.com>
    Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
    Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch deedd678deec7e741e6571ecf3c4369f8645f4bc drm-intel
e015a66f5ebf drm/xe/xe2_hpg: Add PCI IDs for xe2_hpg
0b9d886af897 drm/xe/xe2_hpg: Add set of workarounds
217811ef3e6f drm/xe/xe2_hpg: Define additional Xe2_HPG GMD_ID


