Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0793C606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 13:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fwsn0wh4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD6010E582;
	Thu, 29 Oct 2026 13:12:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C2B10E582
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 13:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793279572; x=1824815572;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=IQIXa386nj15Q1yYZZQDuEjMdQvxIixBH8v/KGAd120=;
 b=Fwsn0wh4QRqoJtpdxvXGUH+pIpVSzt5dXwNYl6VpeqvPbQe0ay5LNFJ6
 4USD4E563Mtib//c+C3TQewjAWQbmO49+uFMkn44oZksbkM31f7noQfWj
 ljt2Ha07oPKWecDeX+6600XP1uIG94hZoiAA6xyiOIE89ukXZQAVCu3b7
 d/anuBh6YnkqR8DuvpqWJCFFgyu+PUOem4QVcAHTwabtr9m2YcAF6oKHL
 dQtlgCA2ljFvmZAdH/XwTzbeeqxiCdTPUBBXjoG2fzmSi/HQP7i011xK8
 aLUchm0+tEcxiJZlsFnjipHmm6tRPq1Gwn/GPFy1wvPw+12B1qmLSMwTv A==;
X-CSE-ConnectionGUID: LAEQRE7dSs+woSfJCXYwYg==
X-CSE-MsgGUID: x4cr0wmSSYq6TpdtCh3e5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2037989"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2037989"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 06:12:51 -0700
X-CSE-ConnectionGUID: xS8S+qvUQqeRd8vqP/A+lQ==
X-CSE-MsgGUID: MI9z5OxYQU2T0DM7kZld4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="6906319"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO [10.245.245.121])
 ([10.245.245.121])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 06:12:50 -0700
Message-ID: <6dd5fc09-dd64-4615-be7e-25ce42dc3466@intel.com>
Date: Thu, 29 Oct 2026 13:12:48 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/tests: Keep bounce buffered accesses short in
 access_memory test
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20261029122130.2795549-1-mika.kuoppala@linux.intel.com>
 <20261029122130.2795549-3-mika.kuoppala@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20261029122130.2795549-3-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 29/10/2026 12:21, Mika Kuoppala wrote:
> Without MEM_COPY, the unaligned accesses go through a cacheline sized
> bounce buffer, one job per 64 bytes. On ATS-M each of the unaligned
> reads over the 512K bo takes 10-15s and the case 75s, tripping the hung
> task detector.
> 
> The bounce loop only differs in its first and last iteration, so cap
> those accesses to 16K on platforms without MEM_COPY. Platforms with
> MEM_COPY keep the full length.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9663
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/tests/xe_migrate.c | 19 ++++++++++++++++---
>   1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index 57c5de5032d2..56c49d8507d7 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -776,6 +776,7 @@ static void xe_validate_ccs_kunit(struct kunit *test)
>   #define ACCESS_MEM_BO_SIZE		SZ_512K
>   #define ACCESS_MEM_NUM_CELLS		(ACCESS_MEM_BO_SIZE / sizeof(u32))
>   #define ACCESS_MEM_UNALIGNED_OFFSET	0x215ee
> +#define ACCESS_MEM_BOUNCE_LEN		SZ_16K
>   
>   /*
>    * Verify byte-by-byte that data read from the BO matches expected cell pattern.
> @@ -848,12 +849,22 @@ static bool verify_access_memory_read(struct kunit *test, u8 *buf,
>   	return true;
>   }
>   
> +/* Bounce buffering without MEM_COPY is slow, keep those accesses short */
> +static u32 access_memory_test_len(struct xe_migrate *m, u32 len)
> +{
> +	if (!tile_to_xe(m->tile)->info.has_mem_copy_instr)
> +		return min(len, ACCESS_MEM_BOUNCE_LEN);
> +
> +	return len;
> +}
> +
>   static void access_memory_test_unaligned_bo_offset(struct kunit *test,
>   						   struct xe_migrate *m,
>   						   struct xe_bo *bo, u8 *buf,
>   						   u32 unaligned_offset)
>   {
> -	u32 partial_size = ACCESS_MEM_BO_SIZE - unaligned_offset;
> +	u32 partial_size = access_memory_test_len(m, ACCESS_MEM_BO_SIZE -
> +						     unaligned_offset);
>   	int ret;
>   
>   	memset(buf, 0, ACCESS_MEM_BO_SIZE);
> @@ -880,7 +891,8 @@ static void access_memory_test_unaligned_dst(struct kunit *test,
>   					     struct xe_bo *bo, u8 *buf,
>   					     u32 unaligned_offset)
>   {
> -	u32 partial_size = ACCESS_MEM_BO_SIZE - unaligned_offset;
> +	u32 partial_size = access_memory_test_len(m, ACCESS_MEM_BO_SIZE -
> +						     unaligned_offset);
>   	int ret;
>   
>   	memset(buf, 0, ACCESS_MEM_BO_SIZE);
> @@ -908,7 +920,8 @@ static void access_memory_test_unaligned_dst_aligned_size(struct kunit *test,
>   							  u8 *buf,
>   							  u32 unaligned_offset)
>   {
> -	u32 partial_size = round_down(ACCESS_MEM_BO_SIZE - unaligned_offset, 4);
> +	u32 partial_size = round_down(access_memory_test_len(m, ACCESS_MEM_BO_SIZE -
> +								unaligned_offset), 4);
>   	int ret;
>   
>   	memset(buf, 0, ACCESS_MEM_BO_SIZE);

