Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41554ECE582
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 17:03:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D14610E895;
	Tue, 10 Sep 2024 17:03:07 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B8310E895;
 Tue, 10 Sep 2024 17:03:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/display=3A_Worka?=
 =?utf-8?q?round_for_odd_panning_for_planar_yuv_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Sep 2024 17:03:05 -0000
Message-ID: <172598778515.981347.14392073758559294884@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240910143757.143614-1-nemesa.garg@intel.com>
In-Reply-To: <20240910143757.143614-1-nemesa.garg@intel.com>
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

Series: drm/i915/display: Workaround for odd panning for planar yuv (rev3)
URL   : https://patchwork.freedesktop.org/series/136422/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1a3fb028c552d8118de93a5ad04bef8e151ea209
Author: Nemesa Garg <nemesa.garg@intel.com>
Date:   Tue Sep 10 20:07:57 2024 +0530

    drm/i915/display: Workaround for odd panning for planar yuv
    
    Disable the support for odd x pan for NV12 format as underrun
    issue is seen.
    
    WA: 16024459452
    
    v2: Replace HSD with WA in commit message [Suraj]
        Modified the condition for handling odd panning
    
    v3: Simplified the condition for checking hsub
        Using older framework for wa as rev1[Jani]
    
    Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
+ /mt/dim checkpatch f25ffe1514b26574258bb767f5c6f53facdfaaca drm-intel
1a3fb028c552 drm/i915/display: Workaround for odd panning for planar yuv


