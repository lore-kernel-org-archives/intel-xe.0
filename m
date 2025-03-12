Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2C5C28B28
	for <intel-xe@archiver.kernel.org>; Wed, 12 Mar 2025 22:12:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 940E910E308;
	Wed, 12 Mar 2025 22:12:23 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA0610E308;
 Wed, 12 Mar 2025 22:12:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Fix_survivabili?=
 =?utf-8?q?ty_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 12 Mar 2025 22:12:22 -0000
Message-ID: <174181754236.26945.17672677213723311628@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250312-fix-survivability-v3-0-54620dbcbbd7@intel.com>
In-Reply-To: <20250312-fix-survivability-v3-0-54620dbcbbd7@intel.com>
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

Series: drm/xe: Fix survivability (rev3)
URL   : https://patchwork.freedesktop.org/series/146116/
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
commit 377da7f25c19f36fd057d49239c2ced623cf019b
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Wed Mar 12 14:11:51 2025 -0700

    drm/xe: Allow to inject error in early probe
    
    Allow to test if driver behaves correctly when xe_pcode_probe_early()
    fails. Note that this is not sufficient for testing survivability mode
    as it's still required to read the hw to check for errors, which doesn't
    happen on an injected failure.
    
    To complete the early probe coverage, allow injection in the other
    functions as well: xe_mmio_probe_early() and xe_device_probe_early().
    
    Reviewed-by: Francois Dugast <francois.dugast@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e drm-intel
0fedb55d2e9c drm/xe: Move survivability back to xe
ad95fc6f9a0d drm/xe: Set survivability mode before heci init
377da7f25c19 drm/xe: Allow to inject error in early probe


