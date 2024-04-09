Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BB5CD1284
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 07:45:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90DE810F11B;
	Tue,  9 Apr 2024 07:45:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HuXDramr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE30010F195
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 07:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712648708; x=1744184708;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=beR3hSydSwNsZVYV99zPCbL2u1/LSEbGkb1WanbjGdw=;
 b=HuXDramrkuKpDOhN4yQnc9ucysOlX2yzM4s8ZYTq1WuP2pW1xKLJ210a
 Ox5aOqUukuswM9176BlRpSAUdTiIzYUBYXzQNRM7NuUNCqK3RJOnQhF5n
 t7iaf4sLqHqgeM9iVYD4COLMf/ZvpKXM5ubJXfwDQVTcFk8Gz+zfdFRw1
 EFLFmZk0G5oPfwPcuZbEWSmGq3aopnhK/EaMBqeDnnpeKVTr0dDZYanSW
 /+bna355OxxTRRq6lEg3ejnHiuoagL9WJGSHNHcBHqMYNrp28kpTLeZt6
 G1arJ/hof4q8eAtWVQcB2jdwiVyzX5wUKEaAdWiSOswk5/eW7KF6udhpW A==;
X-CSE-ConnectionGUID: criU+0DHQNy2QlaX3FJFnQ==
X-CSE-MsgGUID: UeGrUE9/QXuH9YQvc4iocQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="8130055"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="8130055"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 00:45:08 -0700
X-CSE-ConnectionGUID: QTQflr5YSb6HrJ48Ihto1w==
X-CSE-MsgGUID: BJp66lf+QH2RBNerlRkw8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="20589138"
Received: from unknown (HELO [10.245.245.238]) ([10.245.245.238])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 00:45:06 -0700
Message-ID: <af9a972d-5ccf-4bf2-b01a-7c4b58c1f4e7@intel.com>
Date: Tue, 9 Apr 2024 08:45:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Capture GuC CT snapshot when stopped
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240405211632.223568-1-matthew.brost@intel.com>
 <20240405211632.223568-3-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240405211632.223568-3-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 05/04/2024 22:16, Matthew Brost wrote:
> It is useful capture the GuC CT snapshot if the GuC CT has been
> forcefully put into the stopped state. Enable snapshot capture when in
> this state.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 6c37f4f9bddd..0aa3abaca66d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1403,7 +1403,7 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
>   		return NULL;
>   	}
>   
> -	if (xe_guc_ct_enabled(ct)) {
> +	if (xe_guc_ct_enabled(ct) || ct->state == XE_GUC_CT_STATE_STOPPED) {
>   		snapshot->ct_enabled = true;

Since CT might not be enabled but stopped, does it make sense to do 
s/ct_enabled/ct_state/ here also? And then also print the state value 
somewhere?

>   		snapshot->g2h_outstanding = READ_ONCE(ct->g2h_outstanding);
>   		guc_ctb_snapshot_capture(xe, &ct->ctbs.h2g,
