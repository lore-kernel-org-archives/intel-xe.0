Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D62FC3ABC3
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 12:12:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E7CE10E1A4;
	Tue, 13 May 2025 12:12:15 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A07AD10E1A4;
 Tue, 13 May 2025 12:12:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Improve_wedged_?=
 =?utf-8?q?mode_handling_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lukasz Laguna" <lukasz.laguna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 May 2025 12:12:14 -0000
Message-ID: <174713833465.75032.2880504505666358804@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250512163432.22678-1-lukasz.laguna@intel.com>
In-Reply-To: <20250512163432.22678-1-lukasz.laguna@intel.com>
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

Series: drm/xe: Improve wedged mode handling (rev2)
URL   : https://patchwork.freedesktop.org/series/148214/
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
commit ed1a02b9ca30851d7e78caaf455bb9d01a4e1f22
Author: Lukasz Laguna <lukasz.laguna@intel.com>
Date:   Mon May 12 18:34:32 2025 +0200

    drm/xe/pf: Allow wedged_mode=2 only in debug config
    
    The GuC reset policy is global, so changing it on PF can impact running
    VFs. To avoid unintended side effects, setting wedged_mode=2 on the PF
    is restricted to debug builds only.
    
    Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
+ /mt/dim checkpatch c9de1544553b1d6112ccc32977b6d56881cedcea drm-intel
6f5934993c6c drm/xe: Validate wedged_mode parameter and define enum for modes
f0ccd65ff4fd drm/xe: Don't update wedged mode in case of an error
4a320a67aed6 drm/xe/vf: Disallow setting wedged_mode=2
ed1a02b9ca30 drm/xe/pf: Allow wedged_mode=2 only in debug config


