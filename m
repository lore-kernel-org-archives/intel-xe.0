Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3C4C54798
	for <intel-xe@archiver.kernel.org>; Thu, 29 Feb 2024 20:43:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0559310E604;
	Thu, 29 Feb 2024 20:43:57 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7405210E604;
 Thu, 29 Feb 2024 20:43:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Do_not_grab_for?=
 =?utf-8?q?cewakes_when_issuing_GGTT_TLB_invalidation_via_GuC?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 Feb 2024 20:43:55 -0000
Message-ID: <170923943547.398068.10197921427767585428@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240229194520.200642-1-matthew.brost@intel.com>
In-Reply-To: <20240229194520.200642-1-matthew.brost@intel.com>
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

Series: drm/xe: Do not grab forcewakes when issuing GGTT TLB invalidation via GuC
URL   : https://patchwork.freedesktop.org/series/130578/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9ab59fc4b7cb7663906ac4471a262434aef57f03
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 42375308f98aee9bd449d9c29f5cbd4b4869fb11
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Feb 29 11:45:20 2024 -0800

    drm/xe: Do not grab forcewakes when issuing GGTT TLB invalidation via GuC
    
    Forcewakes are not required for communication with the GuC via CTB
    as it is a memory based interfaced. Acquring forcewakes takes
    considerable time. With that, do not grab a forcewake when issuing a
    GGTT TLB invalidation via the GuC.
    
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch c1a0f6caf0ffa81e77e74e04d937605a2e293774 drm-intel
42375308f98a drm/xe: Do not grab forcewakes when issuing GGTT TLB invalidation via GuC


