Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75576CD3427
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 19:28:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D4F10E82C;
	Mon,  4 May 2026 19:28:56 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6680B10E82C;
 Mon,  4 May 2026 19:28:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Proposal_for_in-band_firm?=
 =?utf-8?q?ware_update_over_PLDM-MCTP?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 04 May 2026 19:28:54 -0000
Message-ID: <177792293441.36052.4331454348488299118@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260504193420.1232842-3-badal.nilawar@intel.com>
In-Reply-To: <20260504193420.1232842-3-badal.nilawar@intel.com>
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

Series: Proposal for in-band firmware update over PLDM-MCTP
URL   : https://patchwork.freedesktop.org/series/165927/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c8c12e558adaef7a4d125d83b6e1f8824bc13b82
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f2b3d771bffd77de9e704c97a97c54e3948b6227
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Tue May 5 01:04:22 2026 +0530

    xe/xe_mctp_mailbox: Add support for MCTP transport over mailbox
    
    Add support for MCTP transport over the Intel vendor-specific mailbox
    protocol to enable in-band firmware updates for GPU/AMC via PLDM
    
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch 9160312bed536c4b78ad3736fc1aaf25ed78bccd drm-intel
f2b3d771bffd xe/xe_mctp_mailbox: Add support for MCTP transport over mailbox
-:68: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#68: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 238 lines checked


