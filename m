Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF1BC54750
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 08:42:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BAB510E370;
	Wed, 28 Aug 2024 08:42:08 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED51910E370;
 Wed, 28 Aug 2024 08:42:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/1=5D_drm/xe=3A_Fix_NPD_in_ggtt=5Fnode=5Fremove=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 Aug 2024 08:42:06 -0000
Message-ID: <172483452696.809585.7031904654584190408@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240828085436.3604257-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240828085436.3604257-1-himal.prasad.ghimiray@intel.com>
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

Series: series starting with [1/1] drm/xe: Fix NPD in ggtt_node_remove()
URL   : https://patchwork.freedesktop.org/series/137888/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9b9cbb74e333d76eb0e7050d9e1e775f6212df05
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Wed Aug 28 14:24:36 2024 +0530

    drm/xe: Fix NPD in ggtt_node_remove()
    
    Make sure that ggtt_node_remove() is invoked only if both node and ggtt
    are not null. Move the null checks to the caller function
    xe_ggtt_node_remove().
    
    Fixes: 919bb54e989c ("drm/xe: Fix missing runtime outer protection for ggtt_remove_node")
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch 2940d1fa7abe0d2a9acc95fd1c704a8d8cbc68f4 drm-intel
9b9cbb74e333 drm/xe: Fix NPD in ggtt_node_remove()


