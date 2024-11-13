Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC61D637A6
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 18:27:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6532C10E264;
	Wed, 13 Nov 2024 18:27:56 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D567F10E25E;
 Wed, 13 Nov 2024 18:27:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Allow_fault_inj?=
 =?utf-8?q?ection_in_vm_create_and_vm_bind_IOCTLs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 Nov 2024 18:27:55 -0000
Message-ID: <173152247587.3708786.5456213048353982793@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241113162212.2154103-1-francois.dugast@intel.com>
In-Reply-To: <20241113162212.2154103-1-francois.dugast@intel.com>
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

Series: drm/xe: Allow fault injection in vm create and vm bind IOCTLs
URL   : https://patchwork.freedesktop.org/series/141307/
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
commit bedb5ca90477b3d88987ca259cc4674844f4fd19
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Wed Nov 13 17:22:12 2024 +0100

    drm/xe: Allow fault injection in vm create and vm bind IOCTLs
    
    Use fault injection infrastructure to allow specific functions to
    be configured over debugfs for failing during the execution of
    xe_vm_create_ioctl() and xe_vm_bind_ioctl(). This allows more
    thorough testing from user space by going through code paths for
    error handling and unwinding which cannot be reached by simply
    injecting errors in IOCTL arguments. This can help increase code
    robustness.
    
    v2: Add xe_pt_update_ops_{prepare,run} (Matthew Brost)
    
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 169c7cd31a373ed31054abb423981856eb5fb119 drm-intel
bedb5ca90477 drm/xe: Allow fault injection in vm create and vm bind IOCTLs


