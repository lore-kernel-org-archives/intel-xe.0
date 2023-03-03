Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8BBC678D4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Mar 2023 12:59:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F9110E045;
	Fri,  3 Mar 2023 12:59:50 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E3310E5F5
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Mar 2023 12:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677848388; x=1709384388;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=waF2tAiIu0vd7VHkfdgyKCMteDrAGSeSxMfnEnq1Qxw=;
 b=bmPpybVBqaaZxtkcD++tNc/c4ki+dpgTTBOEDIrUOQhBIhpfb10BGhil
 t1mV20nP8kSJpjOOsnzo+wOb5mVS52UG0H4Vjr0BD8MaQ2+NrcdOsG7Ud
 ESGN8oV4bpdCOBnNdba29HS0K5moX+y1kDhidwUpUP/Nvzw3vrHL4unci
 lFR9yfDksiQ8gc+D+G31kWidLT6VuHkZHY8AYp5Zs0SvKCXaeLw7OcTFR
 zXVmBhopj8lWw24XrD6rF1HYtfOl0k5JpLDE9EEYpE0V9hiG+UaSYMIaZ
 oLqgJYmsf2JIUuXoxu7jo3+zNB52tptv2IwWRPGlGYkYZ5mrfn5SdGdNC g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="336554118"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="336554118"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 04:59:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="764408251"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="764408251"
Received: from ehenriet-mobl.ger.corp.intel.com (HELO [10.249.42.106])
 ([10.249.42.106])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 04:59:39 -0800
Message-ID: <704f02ae-037d-bd33-d0b1-c2c5847249ad@linux.intel.com>
Date: Fri, 3 Mar 2023 13:59:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Content-Language: en-US
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230303101610.21520-1-niranjana.vishwanathapura@intel.com>
 <20230303101610.21520-5-niranjana.vishwanathapura@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20230303101610.21520-5-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v3 4/4] drm/xe/migrate: Fix chunk size
 calculation
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
Cc: thomas.hellstrom@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

For whole series:

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

On 2023-03-03 11:16, Niranjana Vishwanathapura wrote:
> In write_pgtable(), use correct size.
>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Suggested-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_migrate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index a922f90f0627..2943f46cb6da 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -940,7 +940,7 @@ static void write_pgtable(struct xe_gt *gt, struct xe_bb *bb, u64 ppgtt_ofs,
>   
>   	do {
>   		u64 addr = ppgtt_ofs + ofs * 8;
> -		chunk = min(update->qwords, 0x1ffU);
> +		chunk = min(size, 0x1ffU);
>   
>   		/* Ensure populatefn can do memset64 by aligning bb->cs */
>   		if (!(bb->len & 1))
