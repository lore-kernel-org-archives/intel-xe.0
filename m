Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F3CC5AD49
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 12:53:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B982910E1FB;
	Thu, 29 May 2025 12:53:47 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B8C10E1FB;
 Thu, 29 May 2025 12:53:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/bmg=3A_Update_PCI_?=
 =?utf-8?q?Id=27s_and_Workarounds?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 May 2025 12:53:47 -0000
Message-ID: <174852322726.31242.2059519116098476597@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250529120534.531237-1-dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20250529120534.531237-1-dnyaneshwar.bhadane@intel.com>
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

Series: drm/xe/bmg: Update PCI Id's and Workarounds
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
commit 29baf5330b0dcd101a150786d56e0643254349ab
Author: Shekhar Chauhan <shekhar.chauhan@intel.com>
Date:   Thu May 29 17:35:34 2025 +0530

    drm/xe/xe2_hpg: Define additional Xe2_HPG GMD_ID
    
    Add another GMD_ID for Xe2_HPG
    
    Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
    Signed-off-by: James Ausmus <james.ausmus@intel.com>
    Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
+ /mt/dim checkpatch bf0749a9930efe943554c3f73454d03c43779d15 drm-intel
e8f277b5a1f8 drm/xe/xe2_hpg: Add set of workarounds
2fa61cd44ad9 drm/xe/xe2_hpg: Add PCI IDs for xe2_hpg
29baf5330b0d drm/xe/xe2_hpg: Define additional Xe2_HPG GMD_ID


