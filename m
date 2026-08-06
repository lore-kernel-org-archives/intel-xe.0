Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD33C56208
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 15:29:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B7E10F222;
	Thu,  6 Aug 2026 15:29:08 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D8710F222;
 Thu,  6 Aug 2026 15:29:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Separate_GGTT_pools_for_s?=
 =?utf-8?q?ubmissions_and_VFs_provisioning?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Aug 2026 15:29:08 -0000
Message-ID: <178603014840.25984.10422577433766799781@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260806141640.186830-1-piotr.piorkowski@intel.com>
In-Reply-To: <20260806141640.186830-1-piotr.piorkowski@intel.com>
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

Series: Separate GGTT pools for submissions and VFs provisioning
URL   : https://patchwork.freedesktop.org/series/171735/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 12293a5d8be54467851d953ed268b17b74cbb983
Author: Piotr Piórkowski <piotr.piorkowski@intel.com>
Date:   Thu Aug 6 16:16:40 2026 +0200

    drm/xe/ggtt: Add KUnit tests for usable and shareable pools
    
    Add GGTT KUnit tests focused on the newly introduced usable and
    shareable pools.
    
    Cover range initialization for native and PF modes, including partially
    overlapping pools. Exercise allocation direction and conflicts between
    the pools, as well as the unavailable shareable pool and requests
    exceeding pool capacity.
    
    Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 66c6b22c4f075c8c0e0d5f0fce4e198201f9c448 drm-intel
1ac47392e31f drm/xe/ggtt: Split GGTT into usable and shareable pools
f37fa0d997a2 drm/xe/ggtt: Initialize GGTT pools by SR-IOV mode
12293a5d8be5 drm/xe/ggtt: Add KUnit tests for usable and shareable pools
-:21: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#21: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 322 lines checked


