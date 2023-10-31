Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B466C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 31 Oct 2023 14:10:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5548910E4EC;
	Tue, 31 Oct 2023 14:10:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA88610E4EC
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Oct 2023 14:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698761401; x=1730297401;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=JmjZT8AgylvfK39+Ag3VaRD+HdkZ+UJR//brbgYvYUg=;
 b=WHvQMAfYPg0roImYQMd//tfxuawYr++Akzz3QWLXtV4AkJvvXzGjydH4
 o5i53e2RqMTSeovwP4Qjue9bBEOs0pT09JMPKbFu+6fb/Vwb/bJwllpsR
 nLbpuYhuSKJAEb4rEF7gZati/v9/I7yU9VPEqvlURtMkfR75QuuzxbXMY
 JN6FectCQuENr79TNPZ2PTtXY0ASSHNiE2jZy7kf+oNzHHhuseblQF7fC
 lnQ0e3Ld1LeNgktceCJQ+EWF7hQc9je1NDdXLap06z8JKcr2eXOmpgrOe
 rVm7PZooB/ZpUqMxRdlLgKyoyk/4SHTh6tw9zQDPz/+jkYwlAc+eHhDfO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="9824553"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="9824553"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 07:09:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="764249108"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="764249108"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.4.135])
 ([10.213.4.135])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 07:09:34 -0700
Message-ID: <d76ff5ae-9501-4e42-9d7f-8e57129c1b97@intel.com>
Date: Tue, 31 Oct 2023 15:09:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
 <20231027222928.1981633-3-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20231027222928.1981633-3-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 02/12] fixup! drm/xe/guc: Report submission
 version of GuC firmware
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

On 28.10.2023 00:29, Daniele Ceraolo Spurio wrote:
> Major GuC versions greater than 70 will have the submission version in
> the herader irrespective of their minor version number.

header I guess.

> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 3032c4f148d4..91d4a2272ee7 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -278,7 +278,7 @@ static void guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
>   	xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC);
>   	xe_gt_assert(gt, uc_fw->major_ver_found >= 70);
>   
> -	if (uc_fw->minor_ver_found >= 6) {
> +	if (uc_fw->major_ver_found > 70 || uc_fw->minor_ver_found >= 6) {

Shouldn't be major > 70 || (major == 70 && minor >=6) ?
Anyway working with such representation of version looks quite painful :)

Regards
Andrzej


>   		/* v70.6.0 adds CSS header support */
>   		guc->submission_state.version.major =
>   			FIELD_GET(CSS_SW_VERSION_UC_MAJOR,

