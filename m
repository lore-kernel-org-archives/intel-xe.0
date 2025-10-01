Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0D9CAC5B8
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 00:59:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA03F10E044;
	Wed,  1 Oct 2025 00:59:15 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637F710E044;
 Wed,  1 Oct 2025 00:59:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_More_PF_improvements?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 01 Oct 2025 00:59:15 -0000
Message-ID: <175928035540.381168.12007495132210599179@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250930233525.201263-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250930233525.201263-1-michal.wajdeczko@intel.com>
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

Series: More PF improvements
URL   : https://patchwork.freedesktop.org/series/155265/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 76ada15dc94a7ba3d320c53c15dd593c62ba21bb
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Wed Oct 1 01:35:24 2025 +0200

    drm/xe/pf: Synchronize VF FLR between all GTs
    
    The PF part of the VF FLR processing shall be done after all GuCs
    confirm that they finished their part VF FLR processing, otherwise
    PF may start clearing VF's GGTT that other GuC may still accessing.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 23f8be57505c80e5b57dec249df8a3cc053eb947 drm-intel
fefecfc0cb58 drm/xe/pf: Add top level functions to control VFs
-:57: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#57: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 149 lines checked
d3cbe6cb1bc5 drm/xe/pf: Log only top level VF state changes
7f953fbe1753 drm/xe/pf: Expose VF control operations over debugfs
382bf04a2e97 drm/xe/pf: Unify VF state tracking log
5d37582f2e39 drm/xe/pf: Split VF FLR processing function
76ada15dc94a drm/xe/pf: Synchronize VF FLR between all GTs


