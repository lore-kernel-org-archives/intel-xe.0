Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E41E82CDE
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 21:18:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3289610E0C5;
	Wed, 27 Sep 2023 21:18:56 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0761310E0C5;
 Wed, 27 Sep 2023 21:18:53 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 02DAFAADD1;
 Wed, 27 Sep 2023 21:18:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Wed, 27 Sep 2023 21:18:53 -0000
Message-ID: <169584953300.20758.7503865943854962121@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230927205143.2695089-2-matthew.d.roper@intel.com>
In-Reply-To: <20230927205143.2695089-2-matthew.d.roper@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_Infer_service_copy_functionality_from_engine_list_=28re?=
 =?utf-8?b?djMp?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: Infer service copy functionality from engine list (rev3)
URL   : https://patchwork.freedesktop.org/series/124143/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 364dd1a1ed31a8e631d41cc9d084e4f69a49c882
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Wed Sep 27 13:51:44 2023 -0700

    drm/xe: Infer service copy functionality from engine list
    
    On platforms with multiple BCS engines (i.e., PVC and Xe2), not all BCS
    engines are created equal.  The BCS0 engine is what the specs refer to
    as a "resource copy engine," which supports the platform's full set of
    copy/fill instructions.  In contast, the non-BCS0 engines are more
    streamlined and only support a subset of the GPU instructions supported
    by the resource copy engine.  Platforms with both types of copy engines
    always support the MEM_COPY and MEM_SET instructions which can be used
    for simple copy and fill operations on either type of BCS engine.  Since
    the simple MEM_SET instruction meets the needs of Xe's migrate code (and
    since the more elaborate XY_FAST_COLOR_BLT instruction isn't available
    to use on service copy engines), we always prefer to use MEM_SET for
    clearing buffers on our newer platforms.
    
    We've been using a 'has_link_copy_engine' feature flag to keep track of
    which platforms should use MEM_SET for fills.  However a feature flag
    like this is unnecessary since we can already derive the presence of
    service copy engines (and in turn the MEM_SET instruction) just by
    looking at the platform's pre-fusing engine list.  Utilizing the engine
    list for this also avoids mistakes like we've made on Xe2 where we
    forget to set the feature flag in the IP definition.
    
    For clarity, "service copy" is a general term that covers any blitter
    engines that support a limited subset of the overall blitter instruction
    set (in practice this is any non-BCS0 blitter engine).  The "link copy
    engines" introduced on PVC and the "paging copy engine" present in Xe2
    are both instances of service copy engines.
    
    v2:
     - Rewrite / expand the commit message.  (Bala)
     - Fix checkpatch whitespace error.
    
    Bspec: 65019
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
+ /mt/dim checkpatch bce60b0ff2937cb2ea51841a479bc1a2da65052b drm-intel
364dd1a1e drm/xe: Infer service copy functionality from engine list


