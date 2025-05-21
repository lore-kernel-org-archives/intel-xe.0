Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA73C54E65
	for <intel-xe@archiver.kernel.org>; Wed, 21 May 2025 21:39:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D59CA10E089;
	Wed, 21 May 2025 21:39:56 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF0010E089;
 Wed, 21 May 2025 21:39:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/gsc=3A_Switch_SW_p?=
 =?utf-8?q?roxy_allocation_to_uncached?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 May 2025 21:39:55 -0000
Message-ID: <174786359518.11643.10839589781304579480@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250521213448.3829840-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250521213448.3829840-1-daniele.ceraolospurio@intel.com>
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

Series: drm/xe/gsc: Switch SW proxy allocation to uncached
URL   : https://patchwork.freedesktop.org/series/149355/
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
commit 3db7c8b865c7c3946f00cbede98985b09315f174
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Wed May 21 14:34:48 2025 -0700

    drm/xe/gsc: Switch SW proxy allocation to uncached
    
    We're recently started to see a number of issues that seem to be caused
    by memory coherency between the driver and the GSC FW when processing SW
    proxy (xe#5002, xe#5047, xe#5071). These are sporadic and seem to only
    happen on one particular CI machine, so I wan't able to repro locally
    and fully root-cause the problem.
    Given the memory coherency suspicion, as a first attempt to fix the
    issue switch the allocation of the SW proxy object to uncached and
    see if it is enough. Note that there is no performance concern in not
    having this cached as the proxy flow is not heavily used outside of
    driver init.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch 1cdbbaf657b0574686c1c15035b370d3fcad7fca drm-intel
3db7c8b865c7 drm/xe/gsc: Switch SW proxy allocation to uncached


