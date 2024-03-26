Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DD0CD11DF
	for <intel-xe@archiver.kernel.org>; Tue, 26 Mar 2024 10:40:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C72010E605;
	Tue, 26 Mar 2024 10:40:31 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 814D110E605;
 Tue, 26 Mar 2024 10:40:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Add_new_PCI_IDs?=
 =?utf-8?q?_to_DG2_platform?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ravi Kumar Vodapalli" <ravi.kumar.vodapalli@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 26 Mar 2024 10:40:29 -0000
Message-ID: <171144962953.1039951.4653659229917762146@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240326103825.3832879-1-ravi.kumar.vodapalli@intel.com>
In-Reply-To: <20240326103825.3832879-1-ravi.kumar.vodapalli@intel.com>
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

Series: drm/xe: Add new PCI IDs to DG2 platform
URL   : https://patchwork.freedesktop.org/series/131627/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c1340578216db67c1b002693f4d4b13648d0af53
Author: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
Date:   Tue Mar 26 16:08:25 2024 +0530

    drm/xe: Add new PCI IDs to DG2 platform
    
    New PCI IDs are added in Bspec for DG2 platform, add them in driver
    
    Bspec: 44477
    Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
+ /mt/dim checkpatch d652ec2b081fc8e252cc86ee84f72a3b78ee9732 drm-intel
c1340578216d drm/xe: Add new PCI IDs to DG2 platform


