Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86606C3ABBC
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 06:55:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5105310E2CD;
	Mon, 12 May 2025 06:55:55 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F2A10E2CD;
 Mon, 12 May 2025 06:55:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe2hpg=3A_Add_Wa?=
 =?utf-8?q?=5F22021007897_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aradhya Bhatia" <aradhya.bhatia@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 May 2025 06:55:54 -0000
Message-ID: <174703295486.67652.16238558605491008787@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250512065004.2576-1-aradhya.bhatia@intel.com>
In-Reply-To: <20250512065004.2576-1-aradhya.bhatia@intel.com>
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

Series: drm/xe/xe2hpg: Add Wa_22021007897 (rev3)
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
commit b1657543c2bcf3b154af777bc4e441b169049133
Author: Aradhya Bhatia <aradhya.bhatia@intel.com>
Date:   Mon May 12 06:50:04 2025 +0000

    drm/xe/xe2hpg: Add Wa_22021007897
    
    Add Wa_22021007897 for the Xe2_HPG (graphics version: 20.01) IP. It is
    a permanent workaround, and applicable on all the steppings.
    
    Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
    Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
+ /mt/dim checkpatch e05492e926ff62470c03598c0ac0d7c3f353b8cf drm-intel
b1657543c2bc drm/xe/xe2hpg: Add Wa_22021007897


