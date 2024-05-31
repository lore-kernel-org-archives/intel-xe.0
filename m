Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A77C25B7E
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 17:08:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D2D610E16D;
	Fri, 31 May 2024 17:08:45 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA6F10E3BC;
 Fri, 31 May 2024 17:08:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Add_kernel-doc_?=
 =?utf-8?q?to_some_xe=5Flrc_interfaces_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 31 May 2024 17:08:42 -0000
Message-ID: <171717532269.2241151.5673048569779598223@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240531161230.32317-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20240531161230.32317-1-niranjana.vishwanathapura@intel.com>
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

Series: drm/xe: Add kernel-doc to some xe_lrc interfaces (rev2)
URL   : https://patchwork.freedesktop.org/series/134262/
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
commit 13b4a668d7381423bec4035c6aa7650c8437bd7a
Author: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date:   Fri May 31 09:12:30 2024 -0700

    drm/xe: Add kernel-doc to some xe_lrc interfaces
    
    Add kernel-doc to xe_lrc_create/destroy and xe_lrc_get/put
    interfaces.
    
    v2: Fix kernel-doc for xe_lrc_create(), drop Fixes tag.
        (Matt Brost, Michal Wajdeczko)
    
    Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 71fb583af6dea41793b38d947a991f06156f7f11 drm-intel
13b4a668d738 drm/xe: Add kernel-doc to some xe_lrc interfaces


