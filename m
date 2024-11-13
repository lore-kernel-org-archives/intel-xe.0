Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646B6D462DA
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 16:44:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B1010E6DD;
	Wed, 13 Nov 2024 16:44:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fnuo2XEE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4853510E248
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Nov 2024 16:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731516257; x=1763052257;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DlHvHFC1lu/EjUBmBk+pszNBjRjsEd2bMD8p7L7jpNM=;
 b=fnuo2XEEN9d+0gOfHKQxnFKe8LjmDBb+6oiaAlISdxoEO1Opvv3Axz7O
 tuHjJzVUCUVf3Zguj1nG3UFQwcbsyzhN7UnjKEoASnNf0QDI/zxjq0fbY
 QT1ab8B6n4MCewhP5CY/nl7c2JiFvAB+ufxnxnvTpSMr4pKZ3dI3UQ70J
 v6bUHdHqD/R8gvBTpsoiOTscPnpu2VzYKoIVV66MOxDGRZEA6mo7aqY84
 J4fAV5/r1JKZuBrJdtJOHDYsXdfEGhiBzGXaqyaTZjY+6E6VZc6G26evV
 +xn+ioqcJUtSrz7sCNYIbKFyuHOcxASaaYA1a4k9YQpqOMkvNUtqtXK7y Q==;
X-CSE-ConnectionGUID: NVh+HjXPReCQOGuL4Kdy4A==
X-CSE-MsgGUID: q3+xaUglQtir7SALJAoSWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="42833359"
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="42833359"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 08:44:17 -0800
X-CSE-ConnectionGUID: S8UDQII6TSKoxLbzNsXlRQ==
X-CSE-MsgGUID: ey1OdbHmS0SYr41frfnsJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="88314750"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.245.133])
 ([10.245.245.133])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 08:44:15 -0800
Message-ID: <b71ecd74-653d-475d-944a-2ad3e1ef78c9@intel.com>
Date: Wed, 13 Nov 2024 16:44:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe: Clear GGTT in xe_bo_restore_kernel
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, lucas.demarchi@intel.com
References: <20241106183514.4174086-1-matthew.brost@intel.com>
 <20241106183514.4174086-2-matthew.brost@intel.com>
 <3c2203a0-2731-4f5b-bf58-ecec21662002@intel.com>
 <ZzS7AJd24jmRq+sB@lstrano-desk.jf.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZzS7AJd24jmRq+sB@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 13/11/2024 14:43, Matthew Brost wrote:
> On Wed, Nov 13, 2024 at 12:55:35PM +0000, Matthew Auld wrote:
>> On 06/11/2024 18:35, Matthew Brost wrote:
>>> Part of what xe_bo_restore_kernel does, is restore BO's GGTT mappings
>>> which may have been lost during a power state change. Missing is
>>> restoring the GGTT entries without BO mappings to a known state (e.g.,
>>> scratch pages). Update xe_bo_restore_kernel to clear the entire GGTT
>>> before restoring BO's GGTT mappings.
>>>
>>> v2:
>>>    - Include missing local change of tile and id variable (CI)
>>> v3:
>>>    - Fixed kernel doc (CI)
>>>
>>> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> Cc: <stable@vger.kernel.org> # v6.8+
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>
> 
> Thanks for the review but I'm pretty sure this is breaking display... See
> our CI runs, hard to exactly tell because of the instability there. I'm
> thinking only the parts GGTT without nodes need to be cleared, i.e., do
> what xe_ggtt_initial_clear does.

Yeah, could try xe_ggtt_initial_clear() instead.

> 
> I am a little unsure how the display code restores it GGTT mappings
> though as it appears that code bypasses BOs? Do you have any idea?

AFAICT the fb should be unpinned before suspend, that way the evict_all 
will see it and evict to system memory for the dgpu case where VRAM must 
be used. I think xe_display_pm_resume() will then validate and re-pin it 
(eventually __xe_pin_fb_vma), which should in theory re-program the 
GGTT, and that should be after we drop the GGTT nuke here.

There are so many layers but I see:

  __xe_display_pm_resume()
    intel_display_driver_resume()
     __intel_display_driver_resume()
       drm_atomic_helper_commit_duplicated_state()
         drm_atomic_commit()

Which eventually gets to intel_prepare_plane_fb()/intel_plane_pin_fb() 
and then finally __xe_pin_fb_vma().

Maybe something else? In GGTT init we only seem to setup a subset of the 
total GGTT size with some of it being reserved for other stuff it seems. 
So even xe_ggtt_initial_clear() doesn't seem to nuke everything. Not 
sure why that would matter though.

> 
> Matt

