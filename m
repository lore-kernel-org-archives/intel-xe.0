Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3CED0D7A7
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 14:45:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC1610EAFB;
	Fri, 11 Oct 2024 14:45:39 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C14E10EB00;
 Fri, 11 Oct 2024 14:45:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe=5Fsync=3A_initi?=
 =?utf-8?q?alise_ufence=2Esignalled?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 11 Oct 2024 14:45:38 -0000
Message-ID: <172865793863.1240872.7618269795487302945@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241011133633.388008-2-matthew.auld@intel.com>
In-Reply-To: <20241011133633.388008-2-matthew.auld@intel.com>
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

Series: drm/xe/xe_sync: initialise ufence.signalled
URL   : https://patchwork.freedesktop.org/series/139888/
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
commit 63a8d9220102041e1ef99bcb4897ae4ddcff881f
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Fri Oct 11 14:36:34 2024 +0100

    drm/xe/xe_sync: initialise ufence.signalled
    
    We can incorrectly think that the fence has signalled, if we get a
    non-zero value here from the kmalloc, which is quite plausible. Just use
    kzalloc to prevent stuff like this.
    
    Fixes: 977e5b82e090 ("drm/xe: Expose user fence from xe_sync_entry")
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Nirmoy Das <nirmoy.das@intel.com>
    Cc: <stable@vger.kernel.org> # v6.10+
    Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch d2577be8b969257afb5f76964afc16ae4f6f7c07 drm-intel
63a8d9220102 drm/xe/xe_sync: initialise ufence.signalled


