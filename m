Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C29BD41C27
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 10:17:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D0910E6C8;
	Wed, 13 Nov 2024 10:17:46 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59EF710E6D1;
 Wed, 13 Nov 2024 10:17:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Add_iomem_helpers_for_use?=
 =?utf-8?q?_from_debugfs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 Nov 2024 10:17:45 -0000
Message-ID: <173149306536.3431792.15283780802870186715@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241112200454.2211-1-michal.wajdeczko@intel.com>
In-Reply-To: <20241112200454.2211-1-michal.wajdeczko@intel.com>
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

Series: Add iomem helpers for use from debugfs (rev2)
URL   : https://patchwork.freedesktop.org/series/141060/
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
commit dedf3224ae6fc08a77cd8b0aa60dc417b5fbd1d0
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue Nov 12 21:04:54 2024 +0100

    drm/xe/pf: Expose access to the VF GGTT PTEs over debugfs
    
    For feature enabling and testing purposes, allow to capture and
    replace VF's GGTT PTEs data using debugfs blob file.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
+ /mt/dim checkpatch cf3872e462498611b17e5f80f0b1d0900580da20 drm-intel
563465e3b70e iov_iter: Provide copy_iomem_to|from_iter()
f5bafe4fb3d5 libfs: Provide simple_read_from|write_to_iomem()
e288238a9860 drm/xe: Add read/write debugfs helpers for GGTT node
dedf3224ae6f drm/xe/pf: Expose access to the VF GGTT PTEs over debugfs


