Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D09A606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 18:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nT9+YgNr
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80E910E440;
	Tue, 27 Oct 2026 18:04:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94EE610E440
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 18:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793124247; x=1824660247;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=Bd2OgGhkA9QNDZFgKdGBqibrZdgWgk9X7/lrCVYBI8s=;
 b=nT9+YgNrPCTm01MmNdjlAn8pLsqmAvu3Xyqq2RbHx3OzAdtTUQVmhwSy
 kUr/kAQRdqw7TJ6m2SJqsT/RoSTlpJLkcUQegswKg3+cIPrEBej9l4oBT
 +IQHYPlM7eDdvPruf64CsdMZ97Yi3Eb++2u011JdYTX6ClrIlZ/ooBBJG
 nt5Utf0kewOod0PORBggFLex/mHKKxeCRHv9++9BhZL4pQ4FadNqPmkeh
 0ZKcAwl0hTP6aSCjh3BCh/3B5sUvEnllGyltCzcmkaMFkn9xceSd/rxFf
 iyN8g59ILW/dEPAegbniamFXprOAyMg/Njzlzuuf4kWx7kCyutKoVYj/M w==;
X-CSE-ConnectionGUID: uRAm/rR1Q5SeECrLZYFK7A==
X-CSE-MsgGUID: HWQfyI5ZQaKFrVMc7DPEyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1819773"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1819773"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 11:04:06 -0700
X-CSE-ConnectionGUID: npKPPVVaTuacIjXlnz2liw==
X-CSE-MsgGUID: 14H0aD16ScCcrQTz82g6nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="6448799"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.125])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 11:04:05 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/xe/tests: Cover a large write to an unaligned
 bo offset
In-Reply-To: <a8126cc8-b608-4bf9-9102-fe1e9ae58703@intel.com>
References: <20261027145237.1862132-1-mika.kuoppala@linux.intel.com>
 <20261027145237.1862132-2-mika.kuoppala@linux.intel.com>
 <a8126cc8-b608-4bf9-9102-fe1e9ae58703@intel.com>
Date: Tue, 27 Oct 2026 20:04:02 +0200
Message-ID: <87wlr3rpf1.fsf@mkuoppal-desk>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Matthew Auld <matthew.auld@intel.com> writes:

> On 27/10/2026 14:52, Mika Kuoppala wrote:
>> Write a contiguous 16M bo from offset 4 with xe_migrate_access_memory()
>> and read it back. Aligning the vram side leaves buf mid page, so the
>> following full chunk has to stay within MAX_PREEMPTDISABLE_TRANSFER.
>> 
>> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>
> Do we know how long this test now takes? It is pulled into BAT I think.
>

With BMG:

IGT-Version: 2.6-gfd2038445a (x86_64) (Linux: 7.3.0+ x86_64)
  Using IGT_SRANDOM=1793110920 for randomisation
  Starting subtest: xe_migrate
  Starting dynamic subtest: xe_migrate_access_memory_kunit
  Dynamic subtest xe_migrate_access_memory_kunit: SUCCESS (0.320s)
  Subtest xe_migrate: SUCCESS (0.338s)
  
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Thanks,
-Mika

>> ---
>>   drivers/gpu/drm/xe/tests/xe_migrate.c | 50 +++++++++++++++++++++++++++
>>   1 file changed, 50 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
>> index a9ef8f2dcebb..715de366d33c 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
>> @@ -1041,6 +1041,53 @@ static void access_memory_test_run_tile(struct xe_device *xe,
>>   	kvfree(buf);
>>   }
>>   
>> +static void access_memory_test_unaligned_large_write(struct kunit *test,
>> +						     struct xe_tile *tile)
>> +{
>> +	const u32 size = SZ_16M, offset = 4;
>> +	struct xe_bo *bo;
>> +	u32 j;
>> +	u8 *buf;
>> +	int ret;
>> +
>> +	buf = kvmalloc(size, GFP_KERNEL);
>> +	if (!buf) {
>> +		KUNIT_FAIL(test, "Failed to allocate buffer\n");
>> +		return;
>> +	}
>> +
>> +	bo = xe_bo_create_pin_map_novm(tile_to_xe(tile), tile, size,
>> +				       ttm_bo_type_kernel,
>> +				       XE_BO_FLAG_VRAM_IF_DGFX(tile), false);
>> +	if (IS_ERR(bo)) {
>> +		KUNIT_FAIL(test, "Failed to create bo: %pe\n", bo);
>> +		goto free_buf;
>> +	}
>> +
>> +	for (j = 0; j < size / sizeof(u32); j++)
>> +		((u32 *)buf)[j] = j;
>> +
>> +	xe_bo_lock(bo, false);
>> +	ret = xe_migrate_access_memory(tile->migrate, bo, offset, buf,
>> +				       size - offset, true);
>> +	if (!ret) {
>> +		memset(buf, 0, size);
>> +		ret = xe_migrate_access_memory(tile->migrate, bo, offset, buf,
>> +					       size - offset, false);
>> +	}
>> +	xe_bo_unlock(bo);
>> +
>> +	if (ret)
>> +		KUNIT_FAIL(test, "Unaligned large write failed: %d\n", ret);
>> +	else
>> +		verify_access_memory_read(test, buf, 0, 0, size - offset,
>> +					  "Unaligned large write");
>> +
>> +	xe_bo_unpin_map_no_vm(bo);
>> +free_buf:
>> +	kvfree(buf);
>> +}
>> +
>>   static int access_memory_test_run_device(struct xe_device *xe)
>>   {
>>   	struct kunit *test = kunit_get_current_test();
>> @@ -1059,6 +1106,9 @@ static int access_memory_test_run_device(struct xe_device *xe)
>>   
>>   		kunit_info(test, "Testing tile id %d (random offset)\n", id);
>>   		access_memory_test_run_tile(xe, tile, test, true);
>> +
>> +		kunit_info(test, "Testing tile id %d (unaligned large write)\n", id);
>> +		access_memory_test_unaligned_large_write(test, tile);
>>   	}
>>   
>>   	return 0;
