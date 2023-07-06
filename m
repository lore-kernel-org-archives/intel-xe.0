Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9553DEB64D9
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 17:51:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1CD10E047;
	Thu,  6 Jul 2023 17:51:39 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7384710E047
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 17:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688665897; x=1720201897;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=3acb0zppZrX70cBRFKnjBBtK+Qx6WTq6epx11rFmHXI=;
 b=DJPU6LJnyYTuf9XasiSrlPMbcVLcAx0sObnAkSWyLHm0vaaIKuHw3cWT
 OTK8+Cumd04kyTlrp8y0jxVvqlsUwAbQWobcCcqsOk7SDm9OL4oGSFlcr
 xvlPpXfmvaJ6LwpqacxsaPKidpUVlkLFkOyESdoMY2uml9NTu2aBt4rZq
 2B+mOzbsiSbfHJcznvLW6GdWqbXrorfF3cNBYL/tbPTWQDvz6JpsJWio6
 NeUtSsHj2mVs1HzGqDiJ8Z7kA1P7DbWYJawNKCB2es9vYel/41j+F0ZXk
 d3NxhKSk2zBKp5INpbKoLDjPEJKnZIjcWBYL2XJlGrJqSc9SQIBo5yjGN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="361151510"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="361151510"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 10:51:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="669827170"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="669827170"
Received: from lapeders-mobl1.ger.corp.intel.com (HELO [10.249.254.232])
 ([10.249.254.232])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 10:51:28 -0700
Message-ID: <de460f03-453f-28bf-69d2-af9c143216b2@linux.intel.com>
Date: Thu, 6 Jul 2023 19:51:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20230630175804.1096370-1-matthew.brost@intel.com>
 <20230630175804.1096370-4-matthew.brost@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230630175804.1096370-4-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v4 3/9] maple_tree: Export mas_preallocate
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


On 6/30/23 19:57, Matthew Brost wrote:
> The DRM GPUVA implementation needs this function.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

It looks like DRM GPUVA has moved to the interval tree, so this is no 
longer needed?

/Thomas


> ---
>   lib/maple_tree.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/lib/maple_tree.c b/lib/maple_tree.c
> index 1281a40d5735..4a6ecdb12a92 100644
> --- a/lib/maple_tree.c
> +++ b/lib/maple_tree.c
> @@ -5815,6 +5815,7 @@ int mas_preallocate(struct ma_state *mas, gfp_t gfp)
>   	mas_reset(mas);
>   	return ret;
>   }
> +EXPORT_SYMBOL_GPL(mas_preallocate);
>   
>   /*
>    * mas_destroy() - destroy a maple state.
