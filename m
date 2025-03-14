Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47CC5C282EC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 16:47:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B7E10EA0E;
	Fri, 14 Mar 2025 16:47:08 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31ED10E1C6;
 Fri, 14 Mar 2025 16:47:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Flush_delayed_f?=
 =?utf-8?q?rees_and_retry_on_user_object_allocation_failure?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Mar 2025 16:47:06 -0000
Message-ID: <174197082679.35871.3417018926942836655@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250314145750.34362-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250314145750.34362-1-tvrtko.ursulin@igalia.com>
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

Series: drm/xe: Flush delayed frees and retry on user object allocation failure
URL   : https://patchwork.freedesktop.org/series/146323/
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
commit cc58df3adae35d1d9b8ac8dd5112ba17e370c08e
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Fri Mar 14 14:57:50 2025 +0000

    drm/xe: Flush delayed frees and retry on user object allocation failure
    
    If userspace workload is operating near the limit of available memory and
    it moves from one large working set to another, in other words free some
    large buffers and immediately allocate some new ones, the TTM eviction
    attempt during new resource allocation may not be effective due the
    combination of relying on trylock and the fact released buffer might have
    ended on the delayed release path.
    
    From userspace point of view this reflects as sporadic
    VK_ERROR_OUT_OF_DEVICE_MEMORY ie. sometimes the application will work,
    sometimes will fail, even if it does exactly the same thing on an
    otherwise idle system.
    
    Good examples are two tests from the VK CTS suite:
    
     - dEQP-VK.pipeline.monolithic.render_to_image.core.*
     - dEQP-VK.memory.allocation.random*
    
    To improve this we can flush the TTM delayed object free workqueue and
    retry when encountering ENOMEM, which so far looks like a significant
    improvement in mean-time-to-failure.
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 333f31505dac3dd808b66cbde3c51f8f05c99430 drm-intel
cc58df3adae3 drm/xe: Flush delayed frees and retry on user object allocation failure


