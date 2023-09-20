Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B4EC04FFA
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 20:07:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B982710E07B;
	Wed, 20 Sep 2023 20:07:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE9A889BE
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 20:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695240443; x=1726776443;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HJ3lCqOkNfCGCulnJtyE+HkjUGhpva+i2sRX0q5E25U=;
 b=PeB9rYG4el2KFOFl7rVIw1RdRLdUL6A+ekW9TPO7Izsj+01VXS8ud093
 qKRTGohidg5RGwza7wCk9JhMGM+xodEqOyDYTDsozCk8bj2AtLNCY+D3J
 FKcJy9qIdk+Ka48VTdh34VATvPC3C9LijazRlgx2+xXPrUIuxluyuyWzv
 iJyHZiCYGEPX6hxCUDY017n/5RQp8dlJdqNuKdLhMovJNh9fzbRCVdlpN
 S3pnCuJguoZSH6xbuRJ2xfteHswPEw43i7iDb4qY6ctLGpLAwORS9RPxz
 VakxSbLqVt9fYuKpt5xy/diPGsExSPik6iIRNNqoLJoOAzox4iOYhRTas w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="359711100"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="359711100"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 13:07:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="746783251"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="746783251"
Received: from prabaaax-mobl.gar.corp.intel.com (HELO [10.249.254.77])
 ([10.249.254.77])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 13:07:21 -0700
Message-ID: <b954e58e-88ae-fba4-74cb-6f5c5919a4ca@linux.intel.com>
Date: Wed, 20 Sep 2023 22:07:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20230920082217.2093-1-thomas.hellstrom@linux.intel.com>
 <ZQtLTgnMqyKNSb5j@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <ZQtLTgnMqyKNSb5j@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe/bo: Evict VRAM to TT rather
 than to system
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 9/20/23 21:43, Rodrigo Vivi wrote:
> On Wed, Sep 20, 2023 at 10:22:17AM +0200, Thomas Hellström wrote:
>> The dma-buf kunit test and to some extent the dma-buf code assumed
>> that all bos were evicted to system. Fix this by having the dma-buf
>> code not assume anything about eviction placement and the test
>> code assume that VRAM bos are evicted to TT.
> I believe that we should minimize the fixup patches now and use that
> only for the display ones that still need a lot of work.
>
> This could be a simple Fixes: case. And even the commit message is
> very good for a standalone patch.

Thanks for reviewing, Rodrigo.

So are we done rebasing, so that the commit hashes are stable? Like

Fixes: <stable commit hash>

/Thomas

> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
>> The patch applies using automerge conflict resolution.
>>
>> This fixes the following errors:
>>
>> [  102.102086]     KTAP version 1
>> [  102.102102]     # Subtest: xe_dma_buf
>> [  102.102113]     1..1
>> [  102.102377]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
>> [  102.106167]     # xe_dma_buf_kunit: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_dma_buf.c:76
>>                 Importer wasn't properly evicted.
>> [  102.106327]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
>> [  102.107136]     # xe_dma_buf_kunit: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_dma_buf.c:98
>>                     Expected xe_bo_is_mem_type(exported, mem_type) to be true, but is false
>> [  102.107691]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
>> [  102.108099]     # xe_dma_buf_kunit: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_dma_buf.c:76
>>                 Importer wasn't properly evicted.
>> [  102.108158]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
>> [  102.108294]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
>> [  102.108742]     # xe_dma_buf_kunit: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_dma_buf.c:76
>>                 Importer wasn't properly evicted.
>> [  102.108800]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
>> [  102.108908]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
>> [  102.109080]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
>> [  102.109842]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
>> [  102.109941]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
>> [  102.110131]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
>> [  102.110236]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
>> [  102.110402]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
>> [  102.110731]     # xe_dma_buf_kunit: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_dma_buf.c:76
>>                 Importer wasn't properly evicted.
>> [  102.110790]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
>> [  102.111498]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
>> [  102.111793]     # xe_dma_buf_kunit: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_dma_buf.c:76
>>                 Importer wasn't properly evicted.
>> [  102.111851]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
>> [  102.112302]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
>> [  102.112580]     # xe_dma_buf_kunit: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_dma_buf.c:76
>>                 Importer wasn't properly evicted.
>> [  102.112638]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
>> [  102.113292]     not ok 1 xe_dma_buf_kunit
>> [  102.113296] not ok 1 xe_dma_buf
>>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/xe/tests/xe_dma_buf.c |  5 ++---
>>   drivers/gpu/drm/xe/xe_dma_buf.c       | 11 ++++-------
>>   2 files changed, 6 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
>> index 1c3f4bc72b99..1c4d8751be69 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
>> @@ -72,7 +72,7 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
>>   	}
>>   
>>   	/* Verify that also importer has been evicted to SYSTEM */
>> -	if (!xe_bo_is_mem_type(imported, XE_PL_SYSTEM)) {
>> +	if (exported != imported && !xe_bo_is_mem_type(imported, XE_PL_SYSTEM)) {
>>   		KUNIT_FAIL(test, "Importer wasn't properly evicted.\n");
>>   		return;
>>   	}
>> @@ -91,8 +91,7 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
>>   	 * possible, saving a migration step as the transfer is just
>>   	 * likely as fast from system memory.
>>   	 */
>> -	if (params->force_different_devices &&
>> -	    params->mem_mask & XE_BO_CREATE_SYSTEM_BIT)
>> +	if (params->mem_mask & XE_BO_CREATE_SYSTEM_BIT)
>>   		KUNIT_EXPECT_TRUE(test, xe_bo_is_mem_type(exported, XE_PL_TT));
>>   	else
>>   		KUNIT_EXPECT_TRUE(test, xe_bo_is_mem_type(exported, mem_type));
>> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
>> index bd8d51e7f93f..cfde3be3b0dc 100644
>> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
>> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
>> @@ -98,13 +98,10 @@ static struct sg_table *xe_dma_buf_map(struct dma_buf_attachment *attach,
>>   		return ERR_PTR(-EOPNOTSUPP);
>>   
>>   	if (!xe_bo_is_pinned(bo)) {
>> -		if (!attach->peer2peer ||
>> -		    bo->ttm.resource->mem_type == XE_PL_SYSTEM) {
>> -			if (xe_bo_can_migrate(bo, XE_PL_TT))
>> -				r = xe_bo_migrate(bo, XE_PL_TT);
>> -			else
>> -				r = xe_bo_validate(bo, NULL, false);
>> -		}
>> +		if (!attach->peer2peer)
>> +			r = xe_bo_migrate(bo, XE_PL_TT);
>> +		else
>> +			r = xe_bo_validate(bo, NULL, false);
>>   		if (r)
>>   			return ERR_PTR(r);
>>   	}
>> -- 
>> 2.41.0
>>
