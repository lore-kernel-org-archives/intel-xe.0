Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BF7D6EC05
	for <intel-xe@archiver.kernel.org>; Fri, 29 Nov 2024 12:16:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36C8710E4BD;
	Fri, 29 Nov 2024 12:16:14 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 187D210E4BD;
 Fri, 29 Nov 2024 12:16:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/cx0=3A_split_out?=
 =?utf-8?q?_mtl=5Fget=5Fcx0=5Fbuf=5Ftrans=28=29_to_c10_and_c20_variants?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 29 Nov 2024 12:16:13 -0000
Message-ID: <173288257309.269820.5773368441921782778@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241129114158.486418-1-jani.nikula@intel.com>
In-Reply-To: <20241129114158.486418-1-jani.nikula@intel.com>
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

Series: drm/i915/cx0: split out mtl_get_cx0_buf_trans() to c10 and c20 variants
URL   : https://patchwork.freedesktop.org/series/141924/
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
commit 497d8e9ac7e63e2b6c2685c90a2b3b4487ca98ea
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Nov 29 13:41:58 2024 +0200

    drm/i915/cx0: split out mtl_get_cx0_buf_trans() to c10 and c20 variants
    
    The PHY is either c10 or c20, there's no need to check at runtime and
    complicate the conditions in mtl_get_cx0_buf_trans().
    
    While at it, replace the direct port clock check with
    intel_dp_is_uhbr().
    
    Cc: Mika Kahola <mika.kahola@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 4f5b3a832a6480c82639b5500d731d7222b7eee7 drm-intel
497d8e9ac7e6 drm/i915/cx0: split out mtl_get_cx0_buf_trans() to c10 and c20 variants


