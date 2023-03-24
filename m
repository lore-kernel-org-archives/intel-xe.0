Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48B1C6FD1C
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 21:34:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891BB10E1A3;
	Fri, 24 Mar 2023 21:34:53 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93AC010E1A3
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 21:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679693692; x=1711229692;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=20u3nxYWu8OsIeqcvfEoxN/gGe13OzVUiFQIhpNQA1I=;
 b=JII6wqy4Sfadytt2bfuQfXWnRzsjEXQuRNxHUKXt/WzHLmbT9Q6RY+9Z
 V7IFju9R2ZWlpP8OlpOOw0MVTwXXSFxtKeuSWFPD6dNjXpW1pSCKUUJKS
 QzScGu+7dkJp/5ZlI4KQyPeNW/qLlSaqLub+JE2a84duCLjlRzZS22wCd
 sc88sawEWVpZWY2wfeuYj7HV9SUWPnbgwWhvoyeYGMHbhmCds9J4wtAgd
 vlSAYvsv02FkQ2EFTf4X6vHxlShLdcaqdFqGgFGESbXbbOJ8IMe+W1TFv
 EFnCVvK8HrZCHAJHmiKxqv0Kv7Dqg1mygxegyY9H07FvhLnRp/FcK8KVD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="319543222"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="319543222"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 14:34:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="928802559"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="928802559"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.38.175])
 ([10.252.38.175])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 14:34:51 -0700
Message-ID: <95ab2997-7d22-1280-1037-1f6ac93949df@linux.intel.com>
Date: Fri, 24 Mar 2023 22:34:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
References: <20230324210415.2434992-1-matthew.d.roper@intel.com>
 <20230324210415.2434992-6-matthew.d.roper@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20230324210415.2434992-6-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 5/6] drm/xe/mtl: Fix PAT table coherency
 settings
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


On 3/24/2023 10:04 PM, Matt Roper wrote:
> Re-sync our MTL PAT table with the bspec.  1-way coherency should only
> be set on table entry 3.  We do not want an incorrect setting here to
> accidentally paper over other bugs elsewhere in the driver.
>
> Bspec: 45101
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Nirmoy Das<nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pat.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 142cf11b5914..645eb20aea8e 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -52,8 +52,8 @@ const u32 pvc_pat_table[] = {
>   
>   const u32 mtl_pat_table[] = {
>   	[0] = MTL_PAT_0_WB,
> -	[1] = MTL_PAT_1_WT | MTL_2_COH_1W,
> -	[2] = MTL_PAT_3_UC | MTL_2_COH_1W,
> +	[1] = MTL_PAT_1_WT,
> +	[2] = MTL_PAT_3_UC,
>   	[3] = MTL_PAT_0_WB | MTL_2_COH_1W,
>   	[4] = MTL_PAT_0_WB | MTL_3_COH_2W,
>   };
