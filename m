Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA760C3DA6E
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 07:02:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD90610E0D2;
	Wed, 10 Jan 2024 07:02:35 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE3210E0D2;
 Wed, 10 Jan 2024 07:02:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5Bv?=
 =?utf-8?q?2=2C1/2=5D_drm/xe/xe2=5Flpg=3A_Introduce_performance_guide_change?=
 =?utf-8?q?s?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shekhar Chauhan" <shekhar.chauhan@intel.com>
Date: Wed, 10 Jan 2024 07:02:34 -0000
Message-ID: <170487015483.240792.17619589959662311792@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240110061531.780038-1-shekhar.chauhan@intel.com>
In-Reply-To: <20240110061531.780038-1-shekhar.chauhan@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [v2,1/2] drm/xe/xe2_lpg: Introduce performance guide changes
URL   : https://patchwork.freedesktop.org/series/128412/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
414601bf14e77eeb048ecf6d1c25190801399524
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 595072c87b6111cf0b0a3f38b92f64ef55eafc9e
Author: Shekhar Chauhan <shekhar.chauhan@intel.com>
Date:   Wed Jan 10 11:45:31 2024 +0530

    drm/xe/xe2_lpm: Introduce performance guide changes
    
    Add performance guide changes to Xe2_LPM
    
    BSpec: 72161
    Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
+ /mt/dim checkpatch d6ef9c52d8d2ae4c85bc598b74a259db081fff26 drm-intel
294c16b97 drm/xe/xe2_lpg: Introduce performance guide changes
595072c87 drm/xe/xe2_lpm: Introduce performance guide changes


