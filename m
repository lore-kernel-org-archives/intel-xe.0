Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E05C1C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 01:01:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 843C210E04E;
	Wed, 25 Jun 2025 01:01:22 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0042C10E04E;
 Wed, 25 Jun 2025 01:01:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5BC?=
 =?utf-8?q?I=2C1/2=5D_Revert_=22drm/xe/ptl=3A_Apply_Wa=5F16026007364=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Jun 2025 01:01:21 -0000
Message-ID: <175081328199.106654.5459588567196875954@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250625001538.1617675-3-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250625001538.1617675-3-daniele.ceraolospurio@intel.com>
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

Series: series starting with [CI,1/2] Revert "drm/xe/ptl: Apply Wa_16026007364"
URL   : https://patchwork.freedesktop.org/series/150721/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2120c75ee1713f61c7f34023e197b3aa301c51fe
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Tue Jun 24 17:15:40 2025 -0700

    drm/xe/guc: test PTL GuC 70.47.0
    
    This is the first official GuC relase for PTL.
    This patch is for testing only. If the testing is successfull, we will
    drop the definition from topic/xe-for-ci and add a clean patch to
    drm-xe-next.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
+ /mt/dim checkpatch bd57aee20daefb7b0dfe9017663668c92115ff19 drm-intel
1a42f42ecb4f Revert "drm/xe/ptl: Apply Wa_16026007364"
2120c75ee171 drm/xe/guc: test PTL GuC 70.47.0
-:7: WARNING:TYPO_SPELLING: 'successfull' may be misspelled - perhaps 'successful'?
#7: 
This patch is for testing only. If the testing is successfull, we will
                                                  ^^^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


