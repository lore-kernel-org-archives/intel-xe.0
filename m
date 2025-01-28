Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7118C0218A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 19:32:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A18FA10E6F4;
	Tue, 28 Jan 2025 19:32:35 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F5610E6F4;
 Tue, 28 Jan 2025 19:32:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/bmg=3A_Add_new_PCI?=
 =?utf-8?q?_IDs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shekhar Chauhan" <shekhar.chauhan@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 Jan 2025 19:32:34 -0000
Message-ID: <173809275435.2064922.10843566435845819516@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250128162015.3288675-1-shekhar.chauhan@intel.com>
In-Reply-To: <20250128162015.3288675-1-shekhar.chauhan@intel.com>
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

Series: drm/xe/bmg: Add new PCI IDs (rev2)
URL   : https://patchwork.freedesktop.org/series/144045/
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
commit 64b05df24c6261a17bb694b7a048cc3d01353a74
Author: Shekhar Chauhan <shekhar.chauhan@intel.com>
Date:   Tue Jan 28 21:50:15 2025 +0530

    drm/xe/bmg: Add new PCI IDs
    
    Add 3 new PCI IDs for BMG.
    
    v2: Fix typo -> Replace '.' with ','
    
    Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
    Reviewed-by: Clint Taylor <Clinton.A.Taylor@intel.com>
+ /mt/dim checkpatch 20759526c04a7f776f477bee66300dae33b51872 drm-intel
64b05df24c62 drm/xe/bmg: Add new PCI IDs


