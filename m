Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFA9C282D1
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 01:49:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D88BD10E088;
	Fri,  7 Mar 2025 01:49:11 +0000 (UTC)
Received: from 64e06c682a23 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F5510E088;
 Fri,  7 Mar 2025 01:49:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Apply_Wa=5F1602?=
 =?utf-8?q?3105232_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Mar 2025 01:49:10 -0000
Message-ID: <174131215086.70663.553602851629215905@64e06c682a23>
X-Patchwork-Hint: ignore
References: <20250306231122.3897413-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20250306231122.3897413-1-vinay.belgaumkar@intel.com>
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

Series: drm/xe: Apply Wa_16023105232 (rev2)
URL   : https://patchwork.freedesktop.org/series/145449/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fe3b5648a79e5f983f7ea4205876d557e9560afb
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Thu Mar 6 15:11:22 2025 -0800

    drm/xe: Apply Wa_16023105232
    
    The WA requires KMD to disable DOP clock gating during a semaphore
    wait and also ensure that idle delay for every CS is lower than the
    idle wait time in the PWRCTX_MAXCNT register. Default values for these
    registers already comply with this restriction.
    
    v2: Store timestamp_base in gt info and other comments (Daniele)
    
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
+ /mt/dim checkpatch 9796125d0726448924abdb8c73077c7486e3dd3d drm-intel
fe3b5648a79e drm/xe: Apply Wa_16023105232


