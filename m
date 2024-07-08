Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F576C3DA41
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 20:27:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E33BD10E3FC;
	Mon,  8 Jul 2024 20:27:08 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E5910E3FC;
 Mon,  8 Jul 2024 20:27:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Have_xe=5Fvm_and_xe=5Fexe?=
 =?utf-8?q?c=5Fqueue_take_references_to_xef?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 08 Jul 2024 20:27:07 -0000
Message-ID: <172047042775.67898.11842324988411991905@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240708202103.3347869-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20240708202103.3347869-1-umesh.nerlige.ramappa@intel.com>
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

Series: Have xe_vm and xe_exec_queue take references to xef
URL   : https://patchwork.freedesktop.org/series/135865/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0759541395d9bcadd236c02d65d65ee619485d06
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date:   Mon Jul 8 13:21:03 2024 -0700

    Revert "drm/xe: Do not access xe file when updating exec queue run_ticks"
    
    This reverts commit ce62827bc294ba5f8b3909bfa5d7dbf9de8aab6b.
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908
    Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
+ /mt/dim checkpatch 1b010bec39a554cbbd0b51cbf49142e2f218013d drm-intel
e65a80bb254e drm/xe: Move part of xe_file cleanup to a helper
52c5a754507b drm/xe: Add ref counting for xe_file
beb839cbb513 drm/xe: Take a reference to xe file when user creates exec_queue
0b8a38dea17c drm/xe: Take a ref to xe file when user creates a VM
0759541395d9 Revert "drm/xe: Do not access xe file when updating exec queue run_ticks"


