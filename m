Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA4AC3065C
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jul 2024 07:09:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15E0E10E9D3;
	Thu,  4 Jul 2024 07:09:09 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E3610E9D3;
 Thu,  4 Jul 2024 07:09:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_remove_GuC_relo?=
 =?utf-8?q?ad_in_D3Hot_path_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 04 Jul 2024 07:09:08 -0000
Message-ID: <172007694822.28047.3807135575338001400@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240704061203.3464835-1-riana.tauro@intel.com>
In-Reply-To: <20240704061203.3464835-1-riana.tauro@intel.com>
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

Series: drm/xe: remove GuC reload in D3Hot path (rev3)
URL   : https://patchwork.freedesktop.org/series/135265/
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
commit 746003982c9ff4447d9c7a294feada0a31ccbf96
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Thu Jul 4 11:42:03 2024 +0530

    drm/xe: remove GuC reload in D3Hot path
    
    Currently GuC is reloaded for both runtime suspend and system suspend.
    For D3hot <-> D0 transitions no power is lost on suspend and GuC reload
    is not necessary.
    
    Remove GuC reload from D3Hot path and only enable/disable CTB
    communication.
    
    v2: rebase
    
    v3: fix commit message
        add kernel-doc for gt suspend and resume methods
        fix comment
        do not split register and enable calls of CT (Michal)
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch 73af7ac6d6ae23cd3f24b60e6ebaa3a81b2b1d5b drm-intel
4b3983ffefbf drm/xe: move GuC CT set state function to header
746003982c9f drm/xe: remove GuC reload in D3Hot path


