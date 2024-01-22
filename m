Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6311CC47DD3
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 05:52:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C3410E518;
	Mon, 22 Jan 2024 05:52:10 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A21310E518;
 Mon, 22 Jan 2024 05:52:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe2=5Flpg=3A_Intro?=
 =?utf-8?q?duce_performance_guide_changes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shekhar Chauhan" <shekhar.chauhan@intel.com>
Date: Mon, 22 Jan 2024 05:52:08 -0000
Message-ID: <170590272823.645876.4418444942078211627@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240122054904.2111721-1-shekhar.chauhan@intel.com>
In-Reply-To: <20240122054904.2111721-1-shekhar.chauhan@intel.com>
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

Series: drm/xe/xe2_lpg: Introduce performance guide changes
URL   : https://patchwork.freedesktop.org/series/129010/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e7f730565356938dd6c63cd498218fdc5d6a22b0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e13473c0f42b7e7abeb415c0c2e1ff91e3975360
Author: Shekhar Chauhan <shekhar.chauhan@intel.com>
Date:   Mon Jan 22 11:19:04 2024 +0530

    drm/xe/xe2_lpg: Introduce performance guide changes
    
    Add performance guide changes to Xe2_LPG.
    
    BSpec: 72161
    Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
+ /mt/dim checkpatch b239ffd479309ebbf0bd530ef632c8ef3ee78d7a drm-intel
e13473c0f drm/xe/xe2_lpg: Introduce performance guide changes


