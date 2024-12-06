Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B33EE77173
	for <intel-xe@archiver.kernel.org>; Fri,  6 Dec 2024 18:46:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64CC610F155;
	Fri,  6 Dec 2024 18:46:20 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A098910F155;
 Fri,  6 Dec 2024 18:46:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe=5Fsync=3A_Add_d?=
 =?utf-8?q?ebug_printing_to_check=5Fufence_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Dec 2024 18:46:19 -0000
Message-ID: <173351077965.3434802.14494595741109540367@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241206181155.87070-1-jonathan.cavitt@intel.com>
In-Reply-To: <20241206181155.87070-1-jonathan.cavitt@intel.com>
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

Series: drm/xe/xe_sync: Add debug printing to check_ufence (rev2)
URL   : https://patchwork.freedesktop.org/series/142002/
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
commit cdedbe4adca784db48f5da8597725b94b3e8308b
Author: Jonathan Cavitt <jonathan.cavitt@intel.com>
Date:   Fri Dec 6 18:11:55 2024 +0000

    drm/xe/xe_sync: Add debug printing to check_ufence
    
    The xe_sync helper function check_ufence can occasionally report EBUSY
    if the ufence has not been signalled yet.  EBUSY is a non-fatal error
    value for the function, so it is not desireable to warn in cases where
    EBUSY is reported because it is up to the user to decide if EBUSY is a
    fatal error in their use cases.  However, we can and should report EBUSY
    to the debug logs for diagnostic purposes.
    
    v2: Use vm_dbg instead of XE_IOCTL_DBG (Rodrigo)
    
    Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 261a0301bda5af29477bd710465a8886e8609a4d drm-intel
cdedbe4adca7 drm/xe/xe_sync: Add debug printing to check_ufence


