Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A09C48BC3
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 10:40:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59CF610E569;
	Wed, 21 Feb 2024 10:40:43 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F76E10E569;
 Wed, 21 Feb 2024 10:40:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe=5Ftrace=3A_Add_?=
 =?utf-8?q?move=5Flacks=5Fsource_detail_to_xe=5Fbo=5Fmove_trace?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: priyanka.dandamudi@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Feb 2024 10:40:42 -0000
Message-ID: <170851204219.179839.322195357157504314@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240221101950.1019312-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20240221101950.1019312-1-priyanka.dandamudi@intel.com>
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

Series: drm/xe/xe_trace: Add move_lacks_source detail to xe_bo_move trace
URL   : https://patchwork.freedesktop.org/series/130192/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9a229717f7e0353d140eeec808a42a7342f2a679
Author: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Date:   Wed Feb 21 15:49:50 2024 +0530

    drm/xe/xe_trace: Add move_lacks_source detail to xe_bo_move trace
    
    Add move_lacks_source detail to xe_bo_move trace to make it readable
    that is to check if it is migrate clear or migrate copy.
    
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
+ /mt/dim checkpatch b429bc6c8b05fe2346f4e6c3bd7b1ff4063c476f drm-intel
9a229717f7e0 drm/xe/xe_trace: Add move_lacks_source detail to xe_bo_move trace


