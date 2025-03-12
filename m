Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1A3C28B28
	for <intel-xe@archiver.kernel.org>; Wed, 12 Mar 2025 17:41:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E17010E079;
	Wed, 12 Mar 2025 17:41:00 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F3710E079;
 Wed, 12 Mar 2025 17:40:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/1=5D_drm/xe/eustall=3A_Fix_a_possible_pointer_dereference_after_?=
 =?utf-8?q?free?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harish Chegondi" <harish.chegondi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 12 Mar 2025 17:40:59 -0000
Message-ID: <174180125991.26121.1625900704963664460@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <eae49a414a7314921108e0388810aaee6261ad92.1741800396.git.harish.chegondi@intel.com>
In-Reply-To: <eae49a414a7314921108e0388810aaee6261ad92.1741800396.git.harish.chegondi@intel.com>
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

Series: series starting with [1/1] drm/xe/eustall: Fix a possible pointer dereference after free
URL   : https://patchwork.freedesktop.org/series/146223/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a01f2d1941b59a05e072c4dad37f42e947234481
Author: Harish Chegondi <harish.chegondi@intel.com>
Date:   Wed Mar 12 10:31:20 2025 -0700

    drm/xe/eustall: Fix a possible pointer dereference after free
    
    If devm_add_action_or_reset() isn't successful, xe_eu_stall_fini()
    is invoked. So, unsuccessful return from devm_add_action_or_reset()
    shouldn't dereference gt->eu_stall as xe_eu_stall_fini() already
    frees it. Fix this issue.
    
    Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
+ /mt/dim checkpatch e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e drm-intel
a01f2d1941b5 drm/xe/eustall: Fix a possible pointer dereference after free


