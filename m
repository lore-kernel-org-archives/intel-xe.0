Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2ED9C3DA66
	for <intel-xe@archiver.kernel.org>; Wed, 23 Aug 2023 19:58:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9984F10E0DF;
	Wed, 23 Aug 2023 19:58:41 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 277A110E0E9;
 Wed, 23 Aug 2023 19:58:40 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 236ACAADDD;
 Wed, 23 Aug 2023 19:58:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Date: Wed, 23 Aug 2023 19:58:40 -0000
Message-ID: <169282072014.16629.17014244990075770906@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230823195533.125633-1-matthew.s.atwood@intel.com>
In-Reply-To: <20230823195533.125633-1-matthew.s.atwood@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_se?=
 =?utf-8?q?ries_starting_with_=5B1/2=2Cv3=5D_drm/xe=3A_Add_infrastructure_?=
 =?utf-8?q?for_per_engine_tuning?=
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

Series: series starting with [1/2,v3] drm/xe: Add infrastructure for per engine tuning
URL   : https://patchwork.freedesktop.org/series/122806/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e700ea2f248a75138759bcb443affeef4a2d1991
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a06fd0777555084f39c03068ce0943ff8c087931
Author: Matt Atwood <matthew.s.atwood@intel.com>
Date:   Wed Aug 23 12:55:33 2023 -0700

    drm/xe: add gt tuning for indirect state
    
    Force indirect state sampler data to only be in the dynamic state pool,
    which is more convienent for the UMD. Behavior change mirrors similar
    change for i915 in commit 16fc9c08f0ec ("drm/i915: disable sampler
    indirect state in bindless heap")
    
    v2: split out per engine tuning into separate patch, commit message
    (Lucas)
    v3: rebase
    
    Bspec: 46052
    
    Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
+ /mt/dim checkpatch 24894376b6f6c1cf08ed5a7eb2760a9b0b43c3ef drm-intel
/mt/dim: line 50: /root/.dimrc: No such file or directory


