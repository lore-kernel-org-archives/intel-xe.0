Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E668C282CD
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 12:39:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4800510EC86;
	Fri, 28 Feb 2025 12:39:36 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C9B210EC86;
 Fri, 28 Feb 2025 12:39:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/pxp_=26_drm/xe/p?=
 =?utf-8?q?xp=3A_Figure_out_pxp_instance_from_the_gem_object_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 28 Feb 2025 12:39:35 -0000
Message-ID: <174074637530.3226008.17872239279572381233@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250228114527.3091620-1-jani.nikula@intel.com>
In-Reply-To: <20250228114527.3091620-1-jani.nikula@intel.com>
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

Series: drm/i915/pxp & drm/xe/pxp: Figure out pxp instance from the gem object (rev2)
URL   : https://patchwork.freedesktop.org/series/144321/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b9ce491f03e1faca9afef4211bc9b627817112b0
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Feb 28 13:45:27 2025 +0200

    drm/i915/pxp & drm/xe/pxp: Figure out pxp instance from the gem object
    
    It's undesirable to have to figure out the pxp pointer in display
    code. For one thing, its type is different for i915 and xe.
    
    Since we can figure the pxp pointer out in the pxp code from the gem
    object, offload it there.
    
    v2: Rebase
    
    Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
    Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 4e4a83bc30b77bb710641f0b43e6098bd04c5044 drm-intel
b9ce491f03e1 drm/i915/pxp & drm/xe/pxp: Figure out pxp instance from the gem object


