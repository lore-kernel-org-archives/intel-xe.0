Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADA0CDD553
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 20:03:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AAF410E1B5;
	Wed, 18 Sep 2024 20:03:06 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF95110E1B5;
 Wed, 18 Sep 2024 20:03:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/gpuvm=3A_merge_adjace?=
 =?utf-8?q?nt_gpuva_range_during_a_map_operation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Sep 2024 20:03:04 -0000
Message-ID: <172668978490.1027297.8306779554887832700@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240918164740.3955915-1-oak.zeng@intel.com>
In-Reply-To: <20240918164740.3955915-1-oak.zeng@intel.com>
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

Series: drm/gpuvm: merge adjacent gpuva range during a map operation
URL   : https://patchwork.freedesktop.org/series/138835/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e16e525dc01d223c682126d84e9cac4daaca27c9
Author: Oak Zeng <oak.zeng@intel.com>
Date:   Wed Sep 18 12:47:40 2024 -0400

    drm/gpuvm: merge adjacent gpuva range during a map operation
    
    Considder this example. Before a map operation, the gpuva ranges
    in a vm looks like below:
    
     VAs | start              | range              | end                | object             | object offset
    -------------------------------------------------------------------------------------------------------------
         | 0x0000000000000000 | 0x00007ffff5cd0000 | 0x00007ffff5cd0000 | 0x0000000000000000 | 0x0000000000000000
         | 0x00007ffff5cf0000 | 0x00000000000c7000 | 0x00007ffff5db7000 | 0x0000000000000000 | 0x0000000000000000
    
    Now user want to map range [0x00007ffff5cd0000 - 0x00007ffff5cf0000).
    With existing codes, the range walking in __drm_gpuvm_sm_map won't
    find any range, so we end up a single map operation for range
    [0x00007ffff5cd0000 - 0x00007ffff5cf0000). This result in:
    
     VAs | start              | range              | end                | object             | object offset
    -------------------------------------------------------------------------------------------------------------
         | 0x0000000000000000 | 0x00007ffff5cd0000 | 0x00007ffff5cd0000 | 0x0000000000000000 | 0x0000000000000000
         | 0x00007ffff5cd0000 | 0x0000000000020000 | 0x00007ffff5cf0000 | 0x0000000000000000 | 0x0000000000000000
         | 0x00007ffff5cf0000 | 0x00000000000c7000 | 0x00007ffff5db7000 | 0x0000000000000000 | 0x0000000000000000
    
    The correct behavior is to merge those 3 ranges. So __drm_gpuvm_sm_map
    is slightly modified to handle this corner case. The walker is changed
    to find the range just before or after the mapping request, and merge
    adjacent ranges using unmap and map operations. with this change, the
    end result of above example is as below:
    
     VAs | start              | range              | end                | object             | object offset
    -------------------------------------------------------------------------------------------------------------
         | 0x0000000000000000 | 0x00007ffff5db7000 | 0x00007ffff5db7000 | 0x0000000000000000 | 0x0000000000000000
    
    Even though this fixes a real problem, the codes looks a little ugly.
    So I welcome any better fix or suggestion.
    
    Signed-off-by: Oak Zeng <oak.zeng@intel.com>
+ /mt/dim checkpatch 15aeb2cced25e1bfa15f1aa538247d79cf8b0a05 drm-intel
e16e525dc01d drm/gpuvm: merge adjacent gpuva range during a map operation
-:9: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
 VAs | start              | range              | end                | object             | object offset

-:106: WARNING:DEEP_INDENTATION: Too many leading tabs - consider code refactoring
#106: FILE: drivers/gpu/drm/drm_gpuvm.c:2185:
+						if (ret)

-:151: WARNING:DEEP_INDENTATION: Too many leading tabs - consider code refactoring
#151: FILE: drivers/gpu/drm/drm_gpuvm.c:2247:
+						if (ret)

total: 0 errors, 3 warnings, 0 checks, 124 lines checked


