Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9FCCE8E69
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 11:52:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B5610E116;
	Thu, 24 Oct 2024 11:52:30 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AEC010E116;
 Thu, 24 Oct 2024 11:52:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe=5Fguc=5Fads=3A_?=
 =?utf-8?q?save/restore_OA_registers_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Oct 2024 11:52:29 -0000
Message-ID: <172977074904.1327227.14580440208017922955@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241023200716.82624-1-jonathan.cavitt@intel.com>
In-Reply-To: <20241023200716.82624-1-jonathan.cavitt@intel.com>
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

Series: drm/xe/xe_guc_ads: save/restore OA registers (rev3)
URL   : https://patchwork.freedesktop.org/series/140281/
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
commit dba1d07994d6f33a319f1cf3afecab04a96a40b2
Author: Jonathan Cavitt <jonathan.cavitt@intel.com>
Date:   Wed Oct 23 20:07:15 2024 +0000

    drm/xe/xe_guc_ads: save/restore OA registers
    
    Several OA registers and allowlist registers were missing from the
    save/restore list for GuC and could be lost during an engine reset.  Add
    them to the list.
    
    v2:
    - Fix commit message (Umesh)
    - Add missing closes (Ashutosh)
    
    v3:
    - Add missing fixes (Ashutosh)
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2249
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
    Suggested-by: John Harrison <john.c.harrison@intel.com>
    Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    CC: stable@vger.kernel.org # v6.11+
    Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
    Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
+ /mt/dim checkpatch 121cd95da591284c97d6f9ac1c58c7a79d27b201 drm-intel
dba1d07994d6 drm/xe/xe_guc_ads: save/restore OA registers


