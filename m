Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1552C3600C
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 01:16:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82AC110E627;
	Wed, 26 Mar 2025 01:16:06 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70BEA10E627;
 Wed, 26 Mar 2025 01:16:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/bmg=3A_Add_one_add?=
 =?utf-8?q?itional_PCI_ID?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Mar 2025 01:16:05 -0000
Message-ID: <174295176546.3302.7960501396352976870@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250325224709.4073080-2-matthew.d.roper@intel.com>
In-Reply-To: <20250325224709.4073080-2-matthew.d.roper@intel.com>
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

Series: drm/xe/bmg: Add one additional PCI ID
URL   : https://patchwork.freedesktop.org/series/146769/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 669df5f04de7003cb7a3535290ee39947dc30d2e
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Tue Mar 25 15:47:10 2025 -0700

    drm/xe/bmg: Add one additional PCI ID
    
    One additional BMG PCI ID has been added to the spec; make sure our
    driver recognizes devices with this ID properly.
    
    Bspec: 68090
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: Clint Taylor <Clinton.A.Taylor@intel.com>
+ /mt/dim checkpatch afc2e1fea0a406eedbaf632e96cdb6832a45ebb7 drm-intel
669df5f04de7 drm/xe/bmg: Add one additional PCI ID


