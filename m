Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B617E65D03
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 23:20:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC1F10E421;
	Thu, 21 Nov 2024 23:20:48 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75FC910E419;
 Thu, 21 Nov 2024 23:20:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/ptl=3A_Update_PTL_?=
 =?utf-8?q?GuC_revision_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 Nov 2024 23:20:48 -0000
Message-ID: <173223124850.1305579.8356330784661584639@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241121225518.10986-1-matthew.s.atwood@intel.com>
In-Reply-To: <20241121225518.10986-1-matthew.s.atwood@intel.com>
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

Series: drm/xe/ptl: Update PTL GuC revision (rev3)
URL   : https://patchwork.freedesktop.org/series/141519/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a142c21947cf47ff58789b4d84f0dcf0b7a82fba
Author: Matt Atwood <matthew.s.atwood@intel.com>
Date:   Thu Nov 21 14:55:18 2024 -0800

    drm/xe/ptl: Update PTL GuC revision
    
    Update PTL guc version to 70.36.0.
    
    v2: Fix typo in commit message
    
    Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
+ /mt/dim checkpatch bb17c42521f57b592e9ad49daca1f9f9045d3199 drm-intel
a142c21947cf drm/xe/ptl: Update PTL GuC revision


