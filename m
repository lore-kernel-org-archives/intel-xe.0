Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3E1606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 15:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B2OHiGKN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3656010E34E;
	Tue, 27 Oct 2026 15:57:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C25110E34E
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 15:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793116668; x=1824652668;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ASAcpbBQnri+/4P0bzK/5B2np3Isyn41zRF0gp/D74A=;
 b=B2OHiGKNsmfe8sX9+pc8WqdDWvib41Gq9XgMUu5576iX5qlKNPYwXVSp
 fmR6STsI9SW8DhCwd3bpRIeAXX0lxUQ5mybPRgoEDjVRfH+GuNrrJmVSR
 Ln/nsNmbhNLncFhtoOvFRkyhHz7fsYCyZuY0SI2w5HOOxli1ll4o+i40p
 9YKEv8GKMIWbNOZMW2Ym83qTYN8+JuSOFMN4G4M/ckNB2A+8vzczcSeEy
 MzOwBBLd1K0gVfsrddE5MPIHEf2hDZ0B4TJVM3OstpZEPYjgevlkfU3oi
 R88TFZlm7hgsSArr0Gz3XI9QCQ8fSLJRBt7aH05JG8nOAUNeHRlqYXVe0 w==;
X-CSE-ConnectionGUID: IPNDA+lZQN66nf7fdINSIw==
X-CSE-MsgGUID: wwq7GlSYRrO/BWtxTvb7BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1835375"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1835375"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 08:57:47 -0700
X-CSE-ConnectionGUID: KwI3CvgvTj+Fa2WNHa1iog==
X-CSE-MsgGUID: LahVapE+RNubuRB5qaBulw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4917891"
Received: from abityuts-desk1.ger.corp.intel.com (HELO [10.245.244.18])
 ([10.245.244.18])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 08:57:46 -0700
Message-ID: <a8126cc8-b608-4bf9-9102-fe1e9ae58703@intel.com>
Date: Tue, 27 Oct 2026 15:57:44 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/tests: Cover a large write to an unaligned bo
 offset
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20261027145237.1862132-1-mika.kuoppala@linux.intel.com>
 <20261027145237.1862132-2-mika.kuoppala@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20261027145237.1862132-2-mika.kuoppala@linux.intel.com>
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
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27/10/2026 14:52, Mika Kuoppala wrote:
> Write a contiguous 16M bo from offset 4 with xe_migrate_access_memory()
> and read it back. Aligning the vram side leaves buf mid page, so the
> following full chunk has to stay within MAX_PREEMPTDISABLE_TRANSFER.
> 
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

Do we know how long this test now takes? It is pulled into BAT I think.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/tests/xe_migrate.c | 50 +++++++++++++++++++++++++++
>   1 file changed, 50 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index a9ef8f2dcebb..715de366d33c 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -1041,6 +1041,53 @@ static void access_memory_test_run_tile(struct xe_device *xe,
>   	kvfree(buf);
>   }
>   
> +static void access_memory_test_unaligned_large_write(struct kunit *test,
> +						     struct xe_tile *tile)
> +{
> +	const u32 size = SZ_16M, offset = 4;
> +	struct xe_bo *bo;
> +	u32 j;
> +	u8 *buf;
> +	int ret;
> +
> +	buf = kvmalloc(size, GFP_KERNEL);
> +	if (!buf) {
> +		KUNIT_FAIL(test, "Failed to allocate buffer\n");
> +		return;
> +	}
> +
> +	bo = xe_bo_create_pin_map_novm(tile_to_xe(tile), tile, size,
> +				       ttm_bo_type_kernel,
> +				       XE_BO_FLAG_VRAM_IF_DGFX(tile), false);
> +	if (IS_ERR(bo)) {
> +		KUNIT_FAIL(test, "Failed to create bo: %pe\n", bo);
> +		goto free_buf;
> +	}
> +
> +	for (j = 0; j < size / sizeof(u32); j++)
> +		((u32 *)buf)[j] = j;
> +
> +	xe_bo_lock(bo, false);
> +	ret = xe_migrate_access_memory(tile->migrate, bo, offset, buf,
> +				       size - offset, true);
> +	if (!ret) {
> +		memset(buf, 0, size);
> +		ret = xe_migrate_access_memory(tile->migrate, bo, offset, buf,
> +					       size - offset, false);
> +	}
> +	xe_bo_unlock(bo);
> +
> +	if (ret)
> +		KUNIT_FAIL(test, "Unaligned large write failed: %d\n", ret);
> +	else
> +		verify_access_memory_read(test, buf, 0, 0, size - offset,
> +					  "Unaligned large write");
> +
> +	xe_bo_unpin_map_no_vm(bo);
> +free_buf:
> +	kvfree(buf);
> +}
> +
>   static int access_memory_test_run_device(struct xe_device *xe)
>   {
>   	struct kunit *test = kunit_get_current_test();
> @@ -1059,6 +1106,9 @@ static int access_memory_test_run_device(struct xe_device *xe)
>   
>   		kunit_info(test, "Testing tile id %d (random offset)\n", id);
>   		access_memory_test_run_tile(xe, tile, test, true);
> +
> +		kunit_info(test, "Testing tile id %d (unaligned large write)\n", id);
> +		access_memory_test_unaligned_large_write(test, tile);
>   	}
>   
>   	return 0;

