Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2031EC77B7F
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 09:35:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA3EE10E218;
	Thu, 11 May 2023 09:35:47 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C37B310E218
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 09:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683797746; x=1715333746;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=92YPb09Rue4tfvIY3hLh+n2spuHaP/tZ2xmrs05uzAw=;
 b=E9VR/m+JenOYk4lvdtt9ew7hapwoSpKA2/r+em3N8RLaXI6HbhxDxGNy
 ThYKJVH0PfeASXzBlNfSkMgegwat0WnMkN5vpZVlDN//kdp/vnUsv/ZOE
 78Cv7eRQJfbHEfZvsffqMIQugo9n317wCyjuNp8pA/O9h9wKksGn/7P8W
 Rqo+ds5yNfJ4gHFm9x8nuiXE+Hch010Bkp93h0/z1g/z8uQ+1V9eYoBLn
 ma2I5YBIEmKXNQmrFMNoYdgEEzKB6q+Y/fUJoQQUrJziaTUZ6wQv2Iw8o
 dMb/Vmk4VSPGYpQUXFh19EZbEPo+DKC3+NUVHEg7msbAWbjbNeeN0CIbP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="416044641"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="416044641"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 02:35:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="789321040"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="789321040"
Received: from cuphoff-mobl.ger.corp.intel.com (HELO [10.249.254.120])
 ([10.249.254.120])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 02:35:45 -0700
Message-ID: <674bdf1f-2d32-bf84-e5e7-5e12854cfa61@linux.intel.com>
Date: Thu, 11 May 2023 11:35:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-24-matthew.brost@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230502001727.3211096-24-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v2 23/31] drm/gpuva: Add support for extobj
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


On 5/2/23 02:17, Matthew Brost wrote:
> Manager maintains lists of GPUVA with extobjs.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/drm_gpuva_mgr.c  | 45 +++++++++++++--
>   drivers/gpu/drm/xe/xe_exec.c     | 24 ++++----
>   drivers/gpu/drm/xe/xe_vm.c       | 99 +++++---------------------------
>   drivers/gpu/drm/xe/xe_vm.h       |  3 -
>   drivers/gpu/drm/xe/xe_vm_types.h | 16 ------
>   include/drm/drm_gpuva_mgr.h      | 39 ++++++++++++-
>   6 files changed, 105 insertions(+), 121 deletions(-)

Please make a separate series with elaborate commit message and if 
possible, split the drm and xe parts.

Also it seems the handling of multiple vmas in a single vm pointing to 
the same extobj.

There is a bug in xe that I introduced that also forgets about that, but 
IIRC only on vma removal.

/Thomas


