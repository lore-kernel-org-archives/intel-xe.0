Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62017CE79AD
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 09:52:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7CE10E16E;
	Wed, 20 Sep 2023 09:52:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F9310E16E
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 09:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695203524; x=1726739524;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VXgtCaLGF770+feRHKWuEV4kx6g8/E4wGAIkUvNx26Y=;
 b=PZlQ4Qxp66lfm8ob/QqhHMm3mIw4FZijcxYlXGgatDM6FPdbZCGK5kHO
 bVrZeZaa8/vkhKHkZnUsERSbJPH6bIW3KpLDmguLYMgeuDmH0034j4E6v
 bGPJiNKz/JDi3fX7ugim8L27vYEQXfglg30vO5uvXRhSjU4xtQ16NIqkN
 Q6HmwoKrSuZJTU46A+4s/f94/wt3zogRS8sNBZnGbQSsnaf1qjvX5ahxf
 fBCt/bXlUizWvjyUj7gZZ19gFKF53GVn318CA8MLIzYaz3PErQk1Wnq5/
 Y4Stjt7zC9JxapPQ7pxVE6zuhaXPqGhbvHTCxi34sDRcvKWmc8xZVPRAg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="411121403"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="411121403"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 02:52:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="746580536"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="746580536"
Received: from noors55x-mobl1.gar.corp.intel.com (HELO [10.249.254.146])
 ([10.249.254.146])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 02:52:00 -0700
Message-ID: <64012c3f-036d-f95d-c177-875fc1b1a0e8@linux.intel.com>
Date: Wed, 20 Sep 2023 11:51:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Oded Gabbay <ogabbay@kernel.org>
References: <20230919084609.15768-1-thomas.hellstrom@linux.intel.com>
 <CAFCwf13CzJCvO6GbyJnqak7rLJS-Eps8DU-uBgs9P_3T2Bn-xw@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <CAFCwf13CzJCvO6GbyJnqak7rLJS-Eps8DU-uBgs9P_3T2Bn-xw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: Disallow pinning dma-bufs in VRAM
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


On 9/20/23 11:35, Oded Gabbay wrote:
> On Tue, Sep 19, 2023 at 11:46 AM Thomas Hellström
> <thomas.hellstrom@linux.intel.com> wrote:
>> For now only support pinning in TT memory, for two reasons:
>> 1) Avoid pinning in a placement not accessible to some importers.
>> 2) Pinning in VRAM requires PIN accounting which is a to-do.
>>
>> Suggested-by: Oded Gabbay <ogabbay@kernel.org>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_dma_buf.c | 25 +++++++++++++++++++++----
>>   1 file changed, 21 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
>> index 09343b8b3e96..bd8d51e7f93f 100644
>> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
>> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
>> @@ -49,13 +49,30 @@ static int xe_dma_buf_pin(struct dma_buf_attachment *attach)
>>   {
>>          struct drm_gem_object *obj = attach->dmabuf->priv;
>>          struct xe_bo *bo = gem_to_xe_bo(obj);
>> +       struct xe_device *xe = xe_bo_device(bo);
>> +       int ret;
>>
>>          /*
>> -        * Migrate to TT first to increase the chance of non-p2p clients
>> -        * can attach.
>> +        * For now only support pinning in TT memory, for two reasons:
>> +        * 1) Avoid pinning in a placement not accessible to some importers.
>> +        * 2) Pinning in VRAM requires PIN accounting which is a to-do.
>>           */
>> -       (void)xe_bo_migrate(bo, XE_PL_TT);
>> -       xe_bo_pin_external(bo);
>> +       if (xe_bo_is_pinned(bo) && bo->ttm.resource->placement != XE_PL_TT) {
>> +               drm_dbg(&xe->drm, "Can't migrate pinned bo for dma-buf pin.\n");
>> +               return -EINVAL;
>> +       }
>> +
>> +       ret = xe_bo_migrate(bo, XE_PL_TT);
>> +       if (ret) {
>> +               if (ret != -EINTR && ret != -ERESTARTSYS)
>> +                       drm_dbg(&xe->drm,
>> +                               "Failed migrating dma-buf to TT memory: %pe\n",
>> +                               ERR_PTR(ret));
>> +               return ret;
>> +       }
>> +
>> +       ret = xe_bo_pin_external(bo);
>> +       xe_assert(xe, !ret);
>>
>>          return 0;
>>   }
>> --
>> 2.41.0
>>
> Reviewed-by: Oded Gabbay <ogabbay@kernel.org>

Thanks for revieiwing, Oded. Just sent a v2 with a kunit test update to 
reflect the changes. Please let me know if there are any issues with that.

/Thomas

> Thanks,
> Oded
