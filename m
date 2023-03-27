Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBE3C77B6D
	for <intel-xe@archiver.kernel.org>; Mon, 27 Mar 2023 18:48:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA02B10E0E1;
	Mon, 27 Mar 2023 18:48:33 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1AC10E131
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Mar 2023 18:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679942911; x=1711478911;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=2Th6FvNsaTIDCvPMwPK7brlbPj9tH2OrbP4AFKLBMTo=;
 b=gsDAkCdBv4+izvhf0dq+9Z4fnIkYPvf0HpmnUrd07s3nnQEUqG7hxWqi
 7/RgKyIijQR5JeGAQZOeETSzjB8xy1kdNNj3fupwMrap8bp9KFx3X6K8Z
 pOkvy6/OVBNu9RzKWOcg2kfwvJl8iCo9TkKtoq6HHJIja+qNszL3nDe5U
 gZjFBqNmkA3qh6VaXTdCZVK+cP5j5z7V7fSTerCL4fMM7n3dQi/mDx8wx
 Omyg36xNCP/cPEwpEsMUzTsQuWpxVpWWbG/U0bg8L/7dVzhFH8vxNKQTX
 RBNcVMPzknHde4xrV+8zgTV8/PMtCry4yABPdFnVd+p3miOKW9FZTdWj1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="320013447"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; d="scan'208";a="320013447"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 11:48:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="683576269"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; d="scan'208";a="683576269"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.48.146])
 ([10.252.48.146])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 11:48:30 -0700
Message-ID: <92817df9-7cc9-158b-7833-82fd17977e16@linux.intel.com>
Date: Mon, 27 Mar 2023 20:48:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
References: <20230327173433.2957645-1-matthew.d.roper@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20230327173433.2957645-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe/pat: Handle unicast vs MCR PAT
 registers
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


On 3/27/2023 7:34 PM, Matt Roper wrote:
> Somehow I dropped the error message when sending this; add it back.
>
> To be squashed next time the Xe driver is rebased.
>
> Fixes: 11946af00717 ("drm/xe/pat: Handle unicast vs MCR PAT registers")
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_pat.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index a713afdd0510..c860b2122301 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -94,5 +94,7 @@ void xe_pat_init(struct xe_gt *gt)
>   		 * raise an error rather than trying to silently inherit the
>   		 * most recent platform's behavior.
>   		 */
> +		drm_err(&xe->drm, "Missing PAT table for platform with graphics version %d.%2d!\n",
> +			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
>   	}
>   }
