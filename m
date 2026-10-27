Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85B1606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 15:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ICyNABrB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 700CD10E107;
	Tue, 27 Oct 2026 15:27:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B716410E107
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 15:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793114819; x=1824650819;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ctuSUm8jfFPempltOqrNzhqu1aRpRTA8CGENpT35nq4=;
 b=ICyNABrBZMy9nJlNpYr/gHA1XIBrhDXbMwQVzDFDJxSnBokyOJ4IOsUs
 CX7xIxfrQbfZa55eOxwxfhNuedYHlwBDC9++dWueFvyMv3HnKaSYYhoA8
 TAyzbj2jKeESX+g0PSyh9iJtgizQHM6T35vorewekyD30ngsrr/LDQB/v
 psAKBCbhSqH9T5xWoukfNgf1G4Yi+aZUuXLsOkGdOn87Fwt7mTArm2Wws
 t5URlFJXqL/XK0XzsaQVNRotv41uMpiUyAop5wb0LGryE+NWOaOyGrpLf
 Oj/C9LKt93qdDrXwSW1906dQiH3bnvlrqbGVtJYpSGcCrSlXi5dgjoLur g==;
X-CSE-ConnectionGUID: pn8XAemYRcuIFKmty9Un0Q==
X-CSE-MsgGUID: v7W/GyQfR06gzNc+MfAD4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1841456"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1841456"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 08:26:58 -0700
X-CSE-ConnectionGUID: N+6v1YXeRWilYMcOUteaow==
X-CSE-MsgGUID: 3/Q1T/L1SWOO2C9eXNxqVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="6412357"
Received: from abityuts-desk1.ger.corp.intel.com (HELO [10.245.244.18])
 ([10.245.244.18])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 08:26:56 -0700
Message-ID: <40c731ca-867f-41e2-9e9e-ed8bcd624b9f@intel.com>
Date: Tue, 27 Oct 2026 15:26:54 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/migrate: Keep access_memory chunks within the
 transfer limit
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Jan Maslak <jan.maslak@intel.com>
References: <20261027145237.1862132-1-mika.kuoppala@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20261027145237.1862132-1-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27/10/2026 14:52, Mika Kuoppala wrote:
> xe_migrate_access_memory() caps each chunk at MAX_PREEMPTDISABLE_TRANSFER,
> but xe_migrate_vram() maps the system memory side from the start of the
> page the chunk begins in, DIV_ROUND_UP(len + sram_offset, PAGE_SIZE)
> pages.
> 
> So when buf is mid page, the 'wasted' space at the start of the first
> page needs to be taken into account when considering the amount that
> can be copied. Otherwise a full chunk needs one page more than the limit
> allows, which trips the warning in pte_update_cmd_size() and, on debug
> builds, the assert in xe_migrate_vram().
> 
> window:  |slot 0|slot 1| ...  |slot 2047|
>           0                              8M
> data:      [=================================]   starts at sram_offset
>             ^ sram_offset                ^ must end here or earlier
> 
> This happens for example when the access starts at an unaligned vram
> offset.
> 
> Fix this by capping the chunk at the limit minus sram_offset.
> 
> Seen on BMG with igt@xe_eudebug@vm-access-alignment, which rewrites 24M
> and 48M objects from offset 4 through eudebug vm access:
> 
>    xe 0000:03:00.0: [drm] Assertion `npages * ((1UL) << 12) <= 0x00800000` failed!
>    WARNING: drivers/gpu/drm/xe/xe_migrate.c:2255 at xe_migrate_vram+0xf40/0x15e0 [xe]
>    Call Trace:
>    xe_migrate_access_memory
>    xe_ttm_access_memory
>    ttm_bo_access
> 
>    WARNING: drivers/gpu/drm/xe/xe_migrate.c:2118 at xe_migrate_vram+0xbb7/0x15e0 [xe]
>    Call Trace:
>    xe_migrate_access_memory
>    xe_ttm_access_memory
>    ttm_bo_access
> 
> Fixes: 270172f64b11 ("drm/xe: Update xe_ttm_access_memory to use GPU for non-visible access")
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Jan Maslak <jan.maslak@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
