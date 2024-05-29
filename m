Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D49C25B7E
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 22:38:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF2F10E24D;
	Wed, 29 May 2024 22:38:19 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE27E10E24D;
 Wed, 29 May 2024 22:38:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Decouple_xe=5Fe?=
 =?utf-8?q?xec=5Fqueue_and_xe=5Flrc_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 May 2024 22:38:17 -0000
Message-ID: <171702229790.2236029.9110589303514630099@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240529214902.22486-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20240529214902.22486-1-niranjana.vishwanathapura@intel.com>
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

Series: drm/xe: Decouple xe_exec_queue and xe_lrc (rev2)
URL   : https://patchwork.freedesktop.org/series/134202/
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
commit 2eaa45e3ab7d2c536fd08b75dcf9264feb82dcfd
Author: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date:   Wed May 29 14:49:02 2024 -0700

    drm/xe: Decouple xe_exec_queue and xe_lrc
    
    Decouple xe_lrc from xe_exec_queue and reference count xe_lrc.
    Removing hard coupling between xe_exec_queue and xe_lrc allows
    flexible design where the user interface xe_exec_queue can be
    destroyed independent of the hardware/firmware interface xe_lrc.
    
    Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 55d6179b96e0390025f2ba101c03b94b50cab7a1 drm-intel
2eaa45e3ab7d drm/xe: Decouple xe_exec_queue and xe_lrc


