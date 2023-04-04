Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA91C6FD1D
	for <intel-xe@archiver.kernel.org>; Tue,  4 Apr 2023 13:20:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47CF410E079;
	Tue,  4 Apr 2023 13:20:54 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B803210E079
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Apr 2023 13:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680614451; x=1712150451;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=9PmiL2X48VB07RXC4sT/n4KXIlr+CMiOFYeCg1sbgJY=;
 b=fYJouG5B2XH1zdbv5TCvsqBY+fKkvnu6X5VN8M3sk6zpN5vJZ/sIrnD6
 kGpDWxtybCCqFwxeGB91Wrk5LNiTldda4tLiQoV3G9W3BUH+dVa57w0ZB
 1I9cz8oiwkM5gY7G9H4i7GPgQb1bUwiaw4Tep+lfFEUwKOqvr37o0LWAS
 OiJtIuTzmQy1ufM/I0d12jY2/wDXE6oMnbj5fBbK1wDnowVIIeqA1WckB
 nSIjFLslXYfKD8JMfxL5XDmRzdeRjEuordBWdrKQDXtmZRHvK7rcypHah
 6mY5U3mG1PwPSj6taV6gVgms+MYV+h4NHctuCrXog1jxNQj1dL5bXxzz/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="404939889"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; d="scan'208";a="404939889"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 06:20:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="932461926"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; d="scan'208";a="932461926"
Received: from thellstr-mobl.ger.corp.intel.com (HELO [192.168.50.128])
 ([10.249.32.178])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 06:20:49 -0700
Message-ID: <fc2de32e-9774-e5b0-3b43-e0e3eab74241@linux.intel.com>
Date: Tue, 4 Apr 2023 15:20:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20230404014228.3738347-1-matthew.brost@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230404014228.3738347-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v5 0/8] Port Xe to use GPUVA and implement
 NULL VM binds
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi, Matthew,


On 4/4/23 03:42, Matthew Brost wrote:
> GPUVA is common code written primarily by Danilo with the idea being a
> common place to track GPUVAs (VMAs in Xe) within an address space (VMs
> in Xe), track all the GPUVAs attached to GEMs, and a common way
> implement VM binds / unbinds with MMAP / MUNMAP semantics via creating
> operation lists. All of this adds up to a common way to implement VK
> sparse bindings.
>
> This series pulls in the GPUVA code written by Danilo plus some small
> fixes by myself into 1 large patch. Once the GPUVA makes it upstream, we
> can rebase and drop this patch. I believe what lands upstream should be
> nearly identical to this patch at least from an API perspective.
>
> The last three patches port Xe to GPUVA and add support for NULL VM binds
> (writes dropped, read zero, VK sparse support). An example of the
> semantics of this is below.

Going through thew new code in xe_vm.c I'm still concerned about our 
error handling. In the cases we attempt to handle, for example an 
-ENOMEM, the sync ioctl appears to be doing a fragile unwind whereas the 
async worker puts the VM in an error state that can only be exited by a 
RESTART ioctl (pls correct me if I'm wrong here). We could of course do 
the same for sync ioctls, but I'm still wondering what happens if, for 
example a MAP operation on a dual-gt VM fails after binding on the first gt?

I think we need to clearly define the desired behaviour in the uAPI and 
then make sure we do the necessary changes with that in mind, and Even 
if I prefer the !async_worker solution this can be don orthogonally to 
that discussion. Ideally I'd see we find a way to *not* put the VM  in 
an error state like this, and I figure there are various ways to aid in 
this, for example keeping a progress cookie in the user-space data or 
deferring any failed bind operations to the next rebind worker or exec, 
but in the end I think this boils down to allocating all needed 
resources up-front for operations or groups of operations that are not 
allowed to fail once we start to modify the page-tables.

Thoughts?

/Thomas




>
> MAP 0x0000-0x8000 to NULL 	- 0x0000-0x8000 writes dropped + read zero
> MAP 0x4000-0x5000 to a GEM 	- 0x0000-0x4000, 0x5000-0x8000 writes dropped + read zero; 0x4000-0x5000 mapped to a GEM
> UNMAP 0x3000-0x6000		- 0x0000-0x3000, 0x6000-0x8000 writes dropped + read zero
> UNMAP 0x0000-0x8000		- Nothing mapped
>
> No changins to existing behavior, rather just new functionality./
>
> v2: Fix CI build failure
> v3: Export mas_preallocate, add patch to avoid rebinds
> v5: Bug fixes, rebase, xe_vma size optimizations
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>
> Danilo Krummrich (2):
>    maple_tree: split up MA_STATE() macro
>    drm: manager to keep track of GPUs VA mappings
>
> Matthew Brost (6):
>    maple_tree: Export mas_preallocate
>    drm/xe: Port Xe to GPUVA
>    drm/xe: NULL binding implementation
>    drm/xe: Avoid doing rebinds
>    drm/xe: Reduce the number list links in xe_vma
>    drm/xe: Optimize size of xe_vma allocation
>
>   Documentation/gpu/drm-mm.rst                |   31 +
>   drivers/gpu/drm/Makefile                    |    1 +
>   drivers/gpu/drm/drm_debugfs.c               |   56 +
>   drivers/gpu/drm/drm_gem.c                   |    3 +
>   drivers/gpu/drm/drm_gpuva_mgr.c             | 1890 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_bo.c                  |   10 +-
>   drivers/gpu/drm/xe/xe_bo.h                  |    1 +
>   drivers/gpu/drm/xe/xe_device.c              |    2 +-
>   drivers/gpu/drm/xe/xe_exec.c                |    4 +-
>   drivers/gpu/drm/xe/xe_gt_pagefault.c        |   29 +-
>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   14 +-
>   drivers/gpu/drm/xe/xe_guc_ct.c              |    6 +-
>   drivers/gpu/drm/xe/xe_migrate.c             |    8 +-
>   drivers/gpu/drm/xe/xe_pt.c                  |  176 +-
>   drivers/gpu/drm/xe/xe_trace.h               |   10 +-
>   drivers/gpu/drm/xe/xe_vm.c                  | 1947 +++++++++----------
>   drivers/gpu/drm/xe/xe_vm.h                  |   76 +-
>   drivers/gpu/drm/xe/xe_vm_madvise.c          |   87 +-
>   drivers/gpu/drm/xe/xe_vm_types.h            |  276 ++-
>   include/drm/drm_debugfs.h                   |   24 +
>   include/drm/drm_drv.h                       |    7 +
>   include/drm/drm_gem.h                       |   75 +
>   include/drm/drm_gpuva_mgr.h                 |  734 +++++++
>   include/linux/maple_tree.h                  |    7 +-
>   include/uapi/drm/xe_drm.h                   |    8 +
>   lib/maple_tree.c                            |    1 +
>   26 files changed, 4203 insertions(+), 1280 deletions(-)
>   create mode 100644 drivers/gpu/drm/drm_gpuva_mgr.c
>   create mode 100644 include/drm/drm_gpuva_mgr.h
>
