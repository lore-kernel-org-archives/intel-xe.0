Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E5DC83F1D
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 16:08:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03DFC10E91D;
	Thu, 10 Jul 2025 16:08:21 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 917B810E91D;
 Thu, 10 Jul 2025 16:08:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_SR-IOV_support_for_BM?=
 =?utf-8?q?G_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Jul 2025 16:08:19 -0000
Message-ID: <175216369959.151519.18251091957628776917@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250710103040.375610-1-jakub1.kolakowski@intel.com>
In-Reply-To: <20250710103040.375610-1-jakub1.kolakowski@intel.com>
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

Series: Add SR-IOV support for BMG (rev4)
URL   : https://patchwork.freedesktop.org/series/151433/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
43254c2aa575037fc031c7ac21b0d031c700b2bf
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 94ce8eb40c5f30c6ff7b202ea1b2f13ca02d5944
Author: Kolakowski, Jakub1 <jakub1.kolakowski@intel.com>
Date:   Thu Jul 10 15:52:31 2025 +0000

    drm/xe/sriov: Mark BMG as SR-IOV capable
    
    Adding my 'signed off by' tag and additional two lines to commit message
    
    -----Original Message-----
    From: Kolakowski, Jakub1 <jakub1.kolakowski@intel.com>
    Sent: Thursday, July 10, 2025 12:31 PM
    To: intel-xe@lists.freedesktop.org
    Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Kolakowski, Jakub1 <jakub1.kolakowski@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>; K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>
    Subject: [PATCH v2 2/2] drm/xe/sriov: Mark BMG as SR-IOV capable
    
    From: Michal Wajdeczko <michal.wajdeczko@intel.com>
    
    Enable SRIOV support for BMG platforms.
    For SRIOV to work on BMG also correct, SRIOV-enabled IFWI must be
    flashed on the BMG card.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
    Tested-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
+ /mt/dim checkpatch c3149ff574d39beea7cf8fcf973bee943a7f4db9 drm-intel
1829e1a79529 drm/xe/bmg: Don't use WA 16023588340 and 22019338487 on VF
-:13: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#13: 
Subject: [PATCH v2 1/2] drm/xe/bmg: Don't use WA 16023588340 and 22019338487 on VF

total: 0 errors, 1 warnings, 0 checks, 12 lines checked
94ce8eb40c5f drm/xe/sriov: Mark BMG as SR-IOV capable


