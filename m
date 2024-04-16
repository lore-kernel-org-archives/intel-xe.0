Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49705C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 05:26:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B8EE112A3F;
	Tue, 16 Apr 2024 05:26:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T25YFI85";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B59112A3F
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 05:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713245214; x=1744781214;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YKQliKafbslt8BIzrAjN2voZOFwQSTRbkSgmayylm5Y=;
 b=T25YFI85by8kGRCtEdYI9Ft0iQVE59DDg7jB9V2ZSdtV6gxpsPTsAgYz
 HOoPL6ynEuNVpkIw/EKeL9DqfNMSjUYDwL1CNEpksRd138TJli/DveJqj
 TClqGWfwLGuOnnm0QlO9sRped5/3S82gH9DXROXe2A137ANAd3boH+OZS
 Mc+8ZxYlAz7Hy44kpHL0hc5nAY2MhH4H9UH9R3+UKazXfbTAo8kmOvYSV
 i5O0eqT5YTgBtvxrjpVX6MSFcFOEdnxBV5gWg2UMNiK0iKFw6bAXa9+K5
 GdDQ+ZVb3TvLGaX3ub5rgMcteLN4BrQ5z/BA7iT9jHZJXEOTIvwJ42waF A==;
X-CSE-ConnectionGUID: ZH+Fzcd2TVanlp5eTBaF4g==
X-CSE-MsgGUID: tQ/gM0MZSji8cAmsyF1WxQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="19224852"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; d="scan'208";a="19224852"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 22:26:54 -0700
X-CSE-ConnectionGUID: U3hWckQrTHqyHQypAvWUTw==
X-CSE-MsgGUID: Gc9KCBh8QcCMgKtAzIeejA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; d="scan'208";a="22723999"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Apr 2024 22:26:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 22:26:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Apr 2024 22:26:52 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Apr 2024 22:26:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P3h6Ac2YjVwjEioqvx3kMN7gnwUUrrzgduC/rHKLiYam7ehjZxhlt+PSF1jk8LrdkQ3mnLijR0Unj9itc1NpFrEmRNzmKhyNMgorlaqX1EoAo8h3krMrUVnHZjTDqdEyeOkuI6h/SjdFrQ1QKUqGxstnRHSU/IS9rtuWYkCuoRejyJdjDEygXljHmGbHuTtwpb2XuEej+x0z+7Jq6p26zfZ/mkzjoev78Vrbbl33GAsEfnvHSJEoK2Qf5UpjlkyjkKrvG/NczweDQ1DMZiLFdp/j11iAJGG9YPbjGy/m94hN/EfbxHo36kZ7Uvz9w4EwbmecdirO6Mf5fjoKPEy9OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Wmzu9jhqZJNZODr6rJYtqqzDYTKEYRAwUPGLi8+rMA=;
 b=j+qu4uS7H1TjdR2FmMooPd20rFGsTddjyOajwFvf5n/W4kkTggkNZJvi4UkXePyV8rWxml0OXciKJNvyiKhvz8ZhuQkSNp+HPekwU2K4/SWAsIrTUTef8HbqGhqTZp5RIp6onvWQGorABnB5zszU/pRwdQUMqnjhk9Kd7MYXzCfRlI3zkgAxLsP5sb2CRplGyEb2MGP1SKtWlrjI5Bkuf0cBeHSKU0aEIumkT6Za8m/o9Nj337udXpWYY/E2MYsoAxVij+JBGCAM1DIb/x7M/pmT7X/8RJuIMrpTj1XmSJEPr4sl9AC8ENnyptx67YqSmztED1vSrTmCKWhfhGMUzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by CO1PR11MB5105.namprd11.prod.outlook.com (2603:10b6:303:9f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Tue, 16 Apr
 2024 05:26:51 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::24aa:9b79:84d9:c426]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::24aa:9b79:84d9:c426%5]) with mapi id 15.20.7430.045; Tue, 16 Apr 2024
 05:26:50 +0000
Date: Tue, 16 Apr 2024 10:56:13 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>
Subject: Re: [PATCH 2/7] drm/xe: Add helper to capture context runtime
Message-ID: <Zh4L9YhWnN5_CEKP@bvivekan-mobl2>
References: <20240416030454.3739862-1-lucas.demarchi@intel.com>
 <20240416030454.3739862-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20240416030454.3739862-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR03CA0076.namprd03.prod.outlook.com
 (2603:10b6:303:b6::21) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|CO1PR11MB5105:EE_
X-MS-Office365-Filtering-Correlation-Id: 52d63850-7032-4346-7ad5-08dc5dd5d15f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mntEhtSOoy5LQ7aaufbyFlDZxsGKk4BdAXlzVJuVtPBDxOQ3ete5EK5jPJ0wTFFzgu4LCdgZBGXGgWcMK2eEuuwoRL4Mq8gdXbZrmBwwqGjSlgdffo+izGoE/xUZ9/J00NRxgRn9/ioNsXQXcjxVZi3LNLFnCebOP3evK9IaOEWbSOPKWzfulY5VVL9tcbSbv9jC4wCrZ0a0cxIf6o7tVzHAr3pflAhttlIE2P1jGq9iY9LVU7gsJFO0sgRl3T9l2LMWfFpIpQwNfIG/UDI4ewSwxtE+jn+eGspjwav4V24YknvlKULwHj+8IFwLh32NP4qShy6ZDcR5SpgJ2F61zMODjWXS7AIjYzj9Gs8GQUj+G0KCUhOrRJcahpBMcQZdKssK3fR6gBS5rCYLc3ZoeGjKnshFmWfF09TC8uMPYHMsr6YmN/7ua9wwQ44AGt0O0bvQUIXNZExmlck4BFpRAamF/pYRcHz4LOFIVPJ0F+cagtWx8VDgGwMbCKuBsWfogm+Ty/I84l5AnIi/7ahis2j/599EwA0QKxboByqgfCNPJ+XrOBaRpIIyL3aVFFTne/p0QYwAWvg7r7t4Jkt4XSAqS276Guv08mWe+Ipaodv7lGTnQiXzDRIKMEX3r16iWKJeRNKOx8EE3jIU0sS7e9Z6oBq7K8S7Alvv0lXIPE4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTVvUERKbG8yQ2x0ekg0M0poQ0cxQUJTNW10akNCY21yVXNIVUhnNktGK2F0?=
 =?utf-8?B?NnRGaDNyQVNmM0xyMml5ZnVSYUY5dzlHUDNrL25EcDNRMVRYVVNkOTIwa0ZL?=
 =?utf-8?B?dGJIYW1rN3FJMmkvOEEwUzNwbjJaYTZCbTVjTE15dUQwZDBHcXV4Nk9FMGZS?=
 =?utf-8?B?OWpUVkVtcHJGb0I3Q1hrbHdKa0sveURoTGNkMFZEMmpsTUZSdVE3cU91WG8y?=
 =?utf-8?B?TEMvWGlaREFNaGFxbUlzbnRoV3RCK3BISGVPNkFGQUxNK1NLVE05c1FGSEli?=
 =?utf-8?B?UGIzajRMenQwMUJRVy9mSk42U1dvSld4ODFiUWhBUGsyVXp2MW0xeTVMcjVw?=
 =?utf-8?B?VHpYVHYwZmtDZmNoRXR0dG95enlCeVRHci8raE5GaUM0ZHR0c2IxNnY1TWxI?=
 =?utf-8?B?cUdwWmtlM1hLSGRNcGZZa1FQWE5TMzFOWEtvc1pTUGFwZzNUVFY2c0xydWxC?=
 =?utf-8?B?RFZFdHJHT2NUY0F0QmRnd0tKNjRCY2c0S1hPOXJpOTA3eHUxTm5jWS8rN0pR?=
 =?utf-8?B?Ky9Jc3ZtdzB6T3RBSnhPaWNBMzZWZThBU1RTN1c0bGwyWHU4M2F3aG9lTXQ2?=
 =?utf-8?B?Ymc1clFqbS80OGxHM1dBY2E4V1RMNWhZdWN1dDJMYXdRWjRra251U3N1L2sy?=
 =?utf-8?B?MGlRWURpYVd1YTI2ckRmNGZaTXkyK1FmTitCV2plQXpNM1puR3RTSnA4UW9v?=
 =?utf-8?B?ZjkwTmhnaTZzekh4ODNZRUEwTXBtQURVVVBZT0orSGpYV0JtSGtJY3E0OGZh?=
 =?utf-8?B?bW5QZ25zR3ErOUNKOUV4enRiSFZEVlcxQVE4VFVNcVpGeTFLNWx5TmdtRHdR?=
 =?utf-8?B?eEF6bTVRSUhXTDFSNTVtbVZpbEp6THhNajRJU1VWRzBPNU5sR0ZVU0tad0Nu?=
 =?utf-8?B?OEoxZ3VBNDdIenhyOFJ2RWhRRWhSSnpzTExiK01uMTlSVDZDWHYwM0xKMEFn?=
 =?utf-8?B?V3doM0d3T09pdURsRHQvWjAvRUNmb0Ria2lHWFczOXFwOVdlaXVqcWVEZ01r?=
 =?utf-8?B?bytRblZ4WUd5RG9tVUF0RndKUUhnUkVremw1dTRnY2pYMm96UUI2cXlWM1dZ?=
 =?utf-8?B?NjE4dHpNZC9GNWRnWDRDa1psemJWcTBPVnArd2toU1RpbEIyaEpZeHRIWHVG?=
 =?utf-8?B?MG1zTVBvZ2FFYTQwZVRaQjBYdDFuVnkzeXVEeVZCZ1FGRWp2VnpIWWJVSzZX?=
 =?utf-8?B?WktjbDUzcUsxdGlyS0JqeDU1bzJvUzFRTUJUK2x1dnZpS0NUR3V4V2IzTm9l?=
 =?utf-8?B?QWk1VmdpSXh5SW50TlJrU2w3S2dRbm82dEZ6KzFJajljR3FuVWx0L0g2TFVl?=
 =?utf-8?B?Sk5rdXY3dXc2bmNnakxjRm5Tdk44QWVuVFFwUFhBTmhta1FnOEYxcFAyTkVQ?=
 =?utf-8?B?YldwbDFUUWZRSWFtN1FOMHZZaTg5RzU1ZGhYVURDNzhNeGNRaFRWUGIwZFVv?=
 =?utf-8?B?Z1JZQjlzb1FiV2h5aEJRVUlOTENPMDJvbXdhblBITWoxWk81MUQ5ZS9rb3Jt?=
 =?utf-8?B?RzJ3eEw1RXdMTlZ4eXpNc3owTkloMUEyWGZ4WHlEL0FkbUZKa2x4ZU1nc2V6?=
 =?utf-8?B?Z0htRG9ZY3hNS3hna1p5VUUyeWFROXUvTVRobndjYVZseHFmcThiMncwQ0RR?=
 =?utf-8?B?emFuVC85UnN1YnVyWEJORkpDRVI3U2doYzhtOUZ6bE9vZm1ERDRZNDVFVUtz?=
 =?utf-8?B?N1U4KzViWWhad1ByaWh2OVphRmRmMTZsZ1I3MTZ5TVJqRW14OWx3WUx0MHJm?=
 =?utf-8?B?amE5ZEdRY21HUE1SVGU2VUpQZjlmZWFUYndGR0JuekQ1NTR3MmlNSFBiaEZa?=
 =?utf-8?B?Y05DN0E0S2g0bzU5UnA0NmJKcUFVcW1CbUcrbWRzaUYrcVdOSTNoUkJKUnhW?=
 =?utf-8?B?Q2lzZDMyU1k1bWJyT2hXMVB0TkNEdDEwcUJBZHVDcjFyT0NpOWRFbU92Mmt6?=
 =?utf-8?B?V2l0bkRJMm4xckt3azJyWlYyTVRBVCt3OFRZWDM1ZXo4azdZVUd1NlFFbWFp?=
 =?utf-8?B?V0xLNXBoU2xHU0kvdnRJT2d4UlFEazlqZ1EreENObGpjUFNmcm12RmkvSEFr?=
 =?utf-8?B?UUlLUGJKR3lZVzl4eThyMEhSVnIxdjBxSnhWbTBCRWI1MFV3Nm0xbmRTeEp2?=
 =?utf-8?B?bWhMazJ5QXljSkt1MktsRzF0a3k5ZmV5aXJIQkM4cmlLS0t2aE9LL3NTWW1N?=
 =?utf-8?Q?VJ0IXAnxepcXerNQyLQpETg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52d63850-7032-4346-7ad5-08dc5dd5d15f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 05:26:50.4512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vv7KUHvyvTPdseQNIZu+wSq4T1MBFIU6NoWkYqMu8oNhSB5+ZU1qhwJIh8Tzhd14+5WWDo2eAk9NCvuZnXxhbTu/rjajSfQA/OZ6o4F3gE23ZoRHUlrQ9KCBWhazbHhz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5105
X-OriginatorOrg: intel.com
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

On 15.04.2024 20:04, Lucas De Marchi wrote:
> From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> 
> Add a helper to update the runtime of an exec_queue accumulate it at 2
> places:
> 
> 1. when the exec_queue is destroyed
> 2. when the sched job is completed
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  9 +++++++
>  drivers/gpu/drm/xe/xe_exec_queue.c   | 37 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_exec_queue.h   |  1 +
>  drivers/gpu/drm/xe/xe_sched_job.c    |  2 ++
>  4 files changed, 49 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 60ced5f90c2b..f6632b4d8399 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -553,6 +553,15 @@ struct xe_file {
>  		struct mutex lock;
>  	} exec_queue;
>  
> +	/**
> +	 * @runtime: hw engine class runtime in ticks for this drm client
> +	 *
> +	 * Only stats from xe_exec_queue->lrc[0] are accumulated. For multi-lrc
> +	 * case, since all jobs run in parallel on the engines, only the stats
> +	 * from lrc[0] are sufficient.
> +	 */
> +	u64 runtime[XE_ENGINE_CLASS_MAX];
> +
>  	/** @client: drm client */
>  	struct xe_drm_client *client;
>  };
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 71bd52dfebcf..c752d292fd33 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -214,6 +214,8 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
>  {
>  	int i;
>  
> +	xe_exec_queue_update_runtime(q);
> +
>  	for (i = 0; i < q->width; ++i)
>  		xe_lrc_finish(q->lrc + i);
>  	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
> @@ -769,6 +771,41 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
>  		q->lrc[0].fence_ctx.next_seqno - 1;
>  }
>  
> +/**
> + * xe_exec_queue_update_runtime() - Update runtime for this exec queue from hw
> + * @q: The exec queue
> + *
> + * Update the timestamp saved by HW for this exec queue and save runtime
> + * calculated by using the delta from last update. On multi-lrc case, only the
> + * first is considered.
> + */
> +void xe_exec_queue_update_runtime(struct xe_exec_queue *q)
> +{
> +	struct xe_file *xef;
> +	struct xe_lrc *lrc;
> +	u32 old_ts, new_ts;
> +
> +	/*
> +	 * Jobs that are run during driver load may use an exec_queue, but are
> +	 * not associated with a user xe file, so avoid accumulating busyness
> +	 * for kernel specific work.
> +	 */
> +	if (!q->vm || !q->vm->xef)
> +		return;
> +
> +	xef = q->vm->xef;
> +	lrc = &q->lrc[0];
> +
> +	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
> +
> +	/*
> +	 * Special case the very first timestamp: we don't want the
> +	 * initial delta to be a huge value
> +	 */
> +	if (old_ts)
> +		xef->runtime[q->class] += new_ts - old_ts;
What is the need for accumulating the delta instead of using the
absolute timestamp read from CTX_TIMESTAMP?
This would break if xe_lrc_update_timestamp() is called from some
additional places in future. The delta would be incorrect.

Regards,
Bala
    
> +}
> +
>  void xe_exec_queue_kill(struct xe_exec_queue *q)
>  {
>  	struct xe_exec_queue *eq = q, *next;
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index 02ce8d204622..45b72daa2db3 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -66,5 +66,6 @@ struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *e,
>  					       struct xe_vm *vm);
>  void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
>  				  struct dma_fence *fence);
> +void xe_exec_queue_update_runtime(struct xe_exec_queue *q);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index 80daee910ae9..48bcede63d35 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -241,6 +241,8 @@ bool xe_sched_job_completed(struct xe_sched_job *job)
>  {
>  	struct xe_lrc *lrc = job->q->lrc;
>  
> +	xe_exec_queue_update_runtime(job->q);
> +
>  	/*
>  	 * Can safely check just LRC[0] seqno as that is last seqno written when
>  	 * parallel handshake is done.
> -- 
> 2.43.0
> 
