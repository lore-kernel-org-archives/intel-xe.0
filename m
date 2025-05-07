Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA0FC3ABC0
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 10:16:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1148A10E786;
	Wed,  7 May 2025 10:16:53 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227A210E786;
 Wed,  7 May 2025 10:16:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe2hpg=3A_Add_Wa?=
 =?utf-8?q?=5F22021007897_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aradhya Bhatia" <aradhya.bhatia@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 07 May 2025 10:16:52 -0000
Message-ID: <174661301214.54633.15534488000297524589@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250507101112.4678-1-aradhya.bhatia@intel.com>
In-Reply-To: <20250507101112.4678-1-aradhya.bhatia@intel.com>
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

Series: drm/xe/xe2hpg: Add Wa_22021007897 (rev2)
URL   : https://patchwork.freedesktop.org/series/148672/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7c72d9796fde8b0e89e902089c61a0ebb733724a
Author: Aradhya Bhatia <aradhya.bhatia@intel.com>
Date:   Wed May 7 10:11:12 2025 +0000

    drm/xe/xe2hpg: Add Wa_22021007897
    
    Add Wa_22021007897 for the Xe2_HPG (graphics version: 20.01) platform.
    It is a permanent workaround, and applicable on all the steppings.
    
    Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
+ /mt/dim checkpatch b5600d5671f0e468c0c73bc7a1de942097ddaab4 drm-intel
7c72d9796fde drm/xe/xe2hpg: Add Wa_22021007897


