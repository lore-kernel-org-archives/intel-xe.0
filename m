Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B72C67861
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 16:10:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B4F4113C7C;
	Fri,  5 Apr 2024 16:10:21 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C767C113C7E;
 Fri,  5 Apr 2024 16:10:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_More_VF_tweaks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 05 Apr 2024 16:10:06 -0000
Message-ID: <171233340681.1239329.15190813737890992904@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240405133936.891-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240405133936.891-1-michal.wajdeczko@intel.com>
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

Series: More VF tweaks
URL   : https://patchwork.freedesktop.org/series/132080/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9be2179e4dd329bfcdce6078c5b34be83bf899ef
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Fri Apr 5 15:39:36 2024 +0200

    drm/xe/vf: Don't try to read legacy GuC MMIO notification if VF
    
    Legacy SOFT_SCRATCH registers are not accessible from the VF. Any
    G2H notification posted there will be handled by the PF driver.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 6cdd3c6cb168eb0c12808db45124f036eca2e9a5 drm-intel
a8faa562cc28 drm/xe/vf: Don't emit access to Global HWSP if VF
75d812fa0cf4 drm/xe/vf: Don't try to program MOCS if VF
9be2179e4dd3 drm/xe/vf: Don't try to read legacy GuC MMIO notification if VF


