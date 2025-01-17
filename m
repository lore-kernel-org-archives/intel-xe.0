Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF98C02183
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 04:09:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D3A10EA3C;
	Fri, 17 Jan 2025 04:09:09 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6A810EA3C;
 Fri, 17 Jan 2025 04:09:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/oa=3A_Preserve_oa?=
 =?utf-8?q?=5Fctrl_unused_bits?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 17 Jan 2025 04:09:08 -0000
Message-ID: <173708694851.567510.1265793165902994835@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250117032155.3048063-1-ashutosh.dixit@intel.com>
In-Reply-To: <20250117032155.3048063-1-ashutosh.dixit@intel.com>
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

Series: drm/xe/oa: Preserve oa_ctrl unused bits
URL   : https://patchwork.freedesktop.org/series/143643/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4ebe44b82bc14a6e8085911aca181ec2eb6ac4cb
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Thu Jan 16 19:21:55 2025 -0800

    drm/xe/oa: Preserve oa_ctrl unused bits
    
    UMD's have interest in setting unused bits of the oa_ctrl register "out of
    band" for certain experiments. To facilitate this, don't clobber previous
    oa_ctrl unused bits, i.e. rmw the values rather than simply write them.
    
    Fixes: e936f885f1e9 ("drm/xe/oa/uapi: Expose OA stream fd")
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 58078c97cb752a5ea9ae2f2e3ab898945153d39e drm-intel
4ebe44b82bc1 drm/xe/oa: Preserve oa_ctrl unused bits


