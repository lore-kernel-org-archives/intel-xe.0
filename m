Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8ABFC0219C
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 18:31:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE9F10EBA5;
	Fri,  7 Feb 2025 18:31:38 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0EE210EB9C;
 Fri,  7 Feb 2025 18:28:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Carve_out_wopcm?=
 =?utf-8?q?_portion_from_the_stolen_memory?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Feb 2025 18:28:25 -0000
Message-ID: <173895290584.2775021.18030588774794065197@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250207164334.1393054-1-nirmoy.das@intel.com>
In-Reply-To: <20250207164334.1393054-1-nirmoy.das@intel.com>
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

Series: drm/xe: Carve out wopcm portion from the stolen memory
URL   : https://patchwork.freedesktop.org/series/144520/
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
commit 997ddb9ef122ea12e59f8c3008e9826eba552f9d
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Fri Feb 7 17:43:34 2025 +0100

    drm/xe: Carve out wopcm portion from the stolen memory
    
    Top of stolen memory is wopcm which shouldn't be accessed so remove
    that portion of memory from the stolen memory.
    
    Fixes: d8b52a02cb40 ("drm/xe: Implement stolen memory.")
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: <stable@vger.kernel.org> # v6.8+
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch 4f934139887fd60bd4ac9027b7eec3e86ade8085 drm-intel
997ddb9ef122 drm/xe: Carve out wopcm portion from the stolen memory


