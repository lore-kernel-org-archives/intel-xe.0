Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFD8C47077
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 18:34:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C94F410E95F;
	Thu, 11 Jan 2024 18:34:01 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9679D10E95F;
 Thu, 11 Jan 2024 18:34:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Allow_to_exclud?=
 =?utf-8?q?e_part_of_GGTT_from_allocations?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Thu, 11 Jan 2024 18:34:00 -0000
Message-ID: <170499804061.290001.5270969587344377729@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240111182559.629-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240111182559.629-1-michal.wajdeczko@intel.com>
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

Series: drm/xe: Allow to exclude part of GGTT from allocations
URL   : https://patchwork.freedesktop.org/series/128686/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
faa12d3432d7ef7793d934cd9338c555e95a5aad
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 454f3aeb36b630b5f8cf05d931e517623930dff8
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Thu Jan 11 19:25:59 2024 +0100

    drm/xe: Allow to exclude part of GGTT from allocations
    
    Soon we will be required to exclude some of the GGTT addresses
    from the allocations, since on some platforms running the SR-IOV VF
    mode, we will be able to use only selected range of the GGTT space.
    
    Add helper functions to manage such GGTT range exclusions, and
    follow the naming from the similar concept used by GVT-g.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 79184e72263e91528195db01783148435c7e4fad drm-intel
454f3aeb3 drm/xe: Allow to exclude part of GGTT from allocations


