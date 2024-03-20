Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C2BC54E58
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 12:49:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BEDB10E17D;
	Wed, 20 Mar 2024 12:49:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cuJiFC5Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A079D10E17D
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 12:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710938968; x=1742474968;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=hCNGLGhbmeMh/KgqjKH5Pre6vOTvzPnCPLQkIGajrR8=;
 b=cuJiFC5Zagfz/C1Xof0GtoBzq3NfMT+1IgKORiuPyfhzNZ+RYHCZyrgl
 8BW9d/btjmuaIi+xchpmscql8wZXmUB8WBqMA7yUH677lhSdAp5EEz6xQ
 z+i1oWY6LdEXZuwKDTy5OfvAEe86xORoHdEktyluXsB9C5b8Vs2dY3H2x
 Ch29K1LpXUbhyJzK6GNmrzL4geYZmIoKFPfWoPt2yceia3C7QttCtvUru
 AiU8bWXUMlSFUxmxJrB5KcsXmX+PW3iZZkfl6mVpKSZybyyle4WU1TeBz
 /GBdynfadHklcv4Jml1kvYBewL3oJh3i2+B6qQjLVpB+XEU1q162KFhqh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5732044"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208,217";a="5732044"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 05:49:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208,217";a="18793277"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2024 05:49:27 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 05:49:27 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 05:49:26 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Mar 2024 05:49:26 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Mar 2024 05:49:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NJHmaJcQmyYxagWLjrDdJ3+rfkEP9hgviK0iETw+RnmEf1XEIuvI07yW78jYd6oh4mEH8aDGYxOYUUYJ9xo5yIYGuiWrix3iS4liArP6oY5uvmcYdj8qplQm7x3/AsZftov8lfMmSPi6CEM+VGWPMEjis30ys+Jj+T6Xq1WXIHsWU+pKnlWjUP687oq1JR04PaBwlqJFyQNAPS6+ijR9BLcdfdYfTT4MxBD7+D93su7wHDJngGe5jsJG30ALyYmURkrfmhTYJAruoLfjgYQtuof49w9bh+0X2bMsDukG++71mRMK4w+ur6r6QXhwbQPshXtLkKPY+4TpB4MbSj2vvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7pzfBZ+mFqF24bU/F3sKWI9+aOYGtkooEX5bxOf+jc=;
 b=MfDblnKryZWPuS6FxDwSuBXAgPMLxcMUJLW8OOUpGb6IPrDiX1Lqe/+uwNwp3x+EoHJ0ihZoCjuoqLZDF+ge/9pfjiSYLwfDy++Nyz9WSrkImas4czC7MAilr4f2MXMUMP610vpteRi2Nh7Z1FKRlX+xH4n7PJB4hKlhGNcDId2XbQojCi6ezX/v2FDPBdzMYstIGMwY9jRR2sJJLaPBh9e6Uenn57X9pH/FwMu2zkWBJufLq6kDsY9KWtOKiTA0CPlsz2h/zWLfPFBVGnfY+T4Zs7quWSiGv0OFoL3i3gBy0rZYAbg9Dw5kCvEC50SstUPAU5YJ6YkyQ26jDED8HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 DM4PR11MB8132.namprd11.prod.outlook.com (2603:10b6:8:17e::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.11; Wed, 20 Mar 2024 12:49:11 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e%7]) with mapi id 15.20.7409.010; Wed, 20 Mar 2024
 12:49:11 +0000
Content-Type: multipart/alternative;
 boundary="------------5QWXhxg4k9G3CoQofGBGN6Md"
Message-ID: <55814104-0849-4a64-875a-dac33d0ac9d1@intel.com>
Date: Wed, 20 Mar 2024 13:49:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/bb: assert width in xe_bb_create_job()
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240320112730.219854-3-matthew.auld@intel.com>
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20240320112730.219854-3-matthew.auld@intel.com>
X-ClientProxiedBy: PA7P264CA0392.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:399::8) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|DM4PR11MB8132:EE_
X-MS-Office365-Filtering-Correlation-Id: 945f75ac-e497-47c7-c57d-08dc48dc23ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TpDg68S17xky5w7JkTvrDrRGGqbWL+mKGxk56i9YoK677Kuw9GWrzu22lOFydDcGg3UYvFZKkOkGL0DS7PC7sN1gAuSJuklyPBiau8M6ovT2e7KJ7uuVzIa59SESkmeKSaSUTI07bBB8BD4H2ZAzdTg0Xn8D7KIR7oQmXSJgWwU0e8ot4XTiHftFgvh51nFRG1cI64hdsiSTxydB0Wbl8thdmwp5A7GfXgoT1oNS5djRmaEtVw2VmUMa2Bmf7n2ki2t+JExcj+FznCmdnp8E4ISPFTQXp9ECFHKLIZoZwRArmOwJFg1+MQJz3sLNqOOAY7eYuwQDOTsa8twTrxTQOgWbuJJWlIKA3yV+AfogRnsAO1fZQ//yrmmlw4zV/b7+Yg89NLY/HFq/SmTaa5dCo+RtFOMlf42DcSawj3SGJ1EVlHQfHfI6ANa9RNQvqwqaQJjx5BZQZ41TSSIgTfrEYcYEasBNC8LMoChlTX8TUSsEiLUjgqToKIp/FttiOIy4Vg4fVo/M83PEid2+BJhdoqWY77nwq8HdaDnTdtWpRg/7/qz4+D3fMxfbQ3XXvlFItqNLZTnL9frgHGJpncNoS5ptdb4NI14w9Qw6/FF3kW3/eoF2SnxKwL52Kg8bdc7YvNxTD18V6q6h5e+Lq9paD62W0bioFQ5Jro1QmpUHKlM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rk13WFRpdXozcXcxYkFCSFl2Q1BRSkhpaUZVQTV4ZldrWUJwVEJvOHZhY0ZO?=
 =?utf-8?B?WWM3QWMrQ2lmVDkvMWYzSW1mclVOc0pNWkgzZVFuNVNmNkduYVhmMVV1WjNS?=
 =?utf-8?B?ZDFkb2Jjd3NFOGdmTFZsTWtoSmYvUEJQdlY5ekhXOWlaMkgwRVhJNXA4WDQ5?=
 =?utf-8?B?dUZRY2ZFcUpKSG82emFwaDk5SS9Yd09CcVRsbzdWUW9YTmM5bGNRYzNVTEtj?=
 =?utf-8?B?SHo1RnZ6bkhZUXVyRHM2Mld2SXAwUExKZHQxM2NoOGpkM0EwMG9Nd21KL0hi?=
 =?utf-8?B?TVYwZFlUWEV1bDBLZDU2dUxTSkdXcUwrbnpNemY0a1c3MUtuRDVRTm1Kb08v?=
 =?utf-8?B?N093NURSZFgySUJ4dTZEK2luSjJxdkUyaVd2MHdwdmpCTjhHV2xLQTJFbkFL?=
 =?utf-8?B?OUlBRjhDblFFbjF2YWNWU0QyeTMvQW8vWTB2cHM0Q3V2aHlkcHNUZFl2bTNr?=
 =?utf-8?B?anZaK01QNVVjU0NLM0IzYXhETUxMWVdDSlptVWMwWVBTbE9ab0grY3ZBTzNV?=
 =?utf-8?B?cDlNeHAwcFpjZWJRazZlRDlsbEtFa2JvUjBac3huNS9BK3o0N092SGN6TnRK?=
 =?utf-8?B?U2w0VUtaVFZKTGZMdjdveHNWdWtzT1JQZHpIclBoblF1bGtHY1FNbU5uNzJI?=
 =?utf-8?B?ZGxwd1FXa2VLMGZyVFR1YVNuVS9GNG82c0lweTFkZUN4NVFraW5lV0NIZk84?=
 =?utf-8?B?cHQrMkVVOVNGeS9PaDdtL1BoMkM0d2pYc0UrNmN0UHplZ1pKMVdKRHJZVlJY?=
 =?utf-8?B?VE9PSXR6TlVZd241UWREdVJxcWp6bC9JdnQ1YWp3SVVmUktySm81cksvMmxx?=
 =?utf-8?B?K0QwVUNDODJJWDRjY0FmYXBFWnBwMkZDWHZsMHVjc1g5TDZnN0IyK1gwZEdC?=
 =?utf-8?B?MkdvUW0vbUtjeTllKzJwQy9sMFhsRnF4NStpZXdMU1c0TkMyQ0Z0Qk9CeUJR?=
 =?utf-8?B?RnloUEJqTkhSbS9adVp0YnV0UGN0bWhsZ0lMbkpEVEVxSllqV2ZlWE04OVJw?=
 =?utf-8?B?K1Bsallmdkg4ejNEZnloN3c4TEZCaHB3MEdPdDdtV0g1aHB3MXNyMzBWb2tL?=
 =?utf-8?B?aE04OENlNnRkeTB6di9QWituMkYvTzJSN1I1ck5PVWxhM3hMdlZuaS9pSDVU?=
 =?utf-8?B?c3UxUFMxaTk0b0lhQUZKMnB3UUJrNHZncnFXd0dRMWp5c0lYOVhWNENtMGRq?=
 =?utf-8?B?ZWpRT3Q0ZEROdEkwYVdNbFptazlTNzMwaHlmbnE2WWxjMlR5aXRzZlZ0L0xW?=
 =?utf-8?B?SzFsVVhRc1pFM1hPaXFncHZ6Tno1MEkyYWRJeU16VURYNWREaVNjZWEyazBP?=
 =?utf-8?B?MWhXemw4ZXpFenRvZjJ5dFdvVjU0NWw3NHl1WU1DbG1nK0NmakVVY3RWMFNw?=
 =?utf-8?B?Ylh5RTdRbE1TVVhsRmM1cDl4cGV3VmQxN2wwbVhMVFlaMXJJQ3JQL0pudUNC?=
 =?utf-8?B?TWFCaExWaFEzcHlFeFV2MTJtQXdoQlRIdlJoTC9hZGdEZkRXYVlNRzMwckFW?=
 =?utf-8?B?Vmx2MG5EYVBFVlhHZ0Nnb2VOd0J5Mm0zSTRYS1hUcktsZEVoV0ZERkNrNDM2?=
 =?utf-8?B?WWVSNlNyaWh3ZzlwRVM2YmROb1RCSUt3V1pteTV2MWV0ZitaQ1hUdldxOUhi?=
 =?utf-8?B?VitkaE9pL3dHdHArNXJlQ1Z4Z2pqOTFrZDFzQVBiNjVoQ0lvV0VNWjNJZHZy?=
 =?utf-8?B?cDRqU1U1a3hSUVRxMFY4RGVyNTY0STlQZVpDNlZ1dVlaMnJsbUxNWHFPWDdL?=
 =?utf-8?B?L1NFWGxRcDR2RjF6aE1EMDRtZGZ6Mm0rTjMwclA1bStWejVwZS9zK0JVd3ZT?=
 =?utf-8?B?MVFPRnZScjA2cHd1RG00cTI1d1FSbTROSDZIVUg4VGhrbjNJWTd0Ynp0U0tH?=
 =?utf-8?B?Z1N2UWwvVzhmc3FuQW95Zk5palJzUmsyT3MrUDA3NFhnM2JYQmdaRThubitt?=
 =?utf-8?B?ZkdkTGdQLy92WkJOeGUyNWFjKzdPaytYeGVwVmJGZTNxQmNQMVhQLzR0WUVV?=
 =?utf-8?B?a2UvbXhGM0pJbW15dTBINENOUVkxUE9FN2JJS3oxZFoxMTBMR0JOZWczR2la?=
 =?utf-8?B?TlVjMDhrOCtRL0xxRDMwdXQ4TnpWbFIxT21ReEpiUGo0Q2d4WDVOMFZmWmRW?=
 =?utf-8?Q?urqyhr2zHzMx9hazPFtlT87Ui?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 945f75ac-e497-47c7-c57d-08dc48dc23ed
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 12:49:11.5166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lUsbBqSJ8eXqaZar5r5LvsbEehGY8SYcDVqueVmfcne7Uj4NoL6tHat5BwCDa+LtMWfKTmRAxafWPV/3Xhi9Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8132
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

--------------5QWXhxg4k9G3CoQofGBGN6Md
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 3/20/2024 12:27 PM, Matthew Auld wrote:
> The queue width will determine the number of batch buffer emitted into
> the ring. In the case of xe_bb_create_job() we pass exactly one batch
> address, therefore add an assert for the width to make sure we don't go
> out of bounds. While here also convert to the helper to determine if the
> queue is migration based.
>
> Signed-off-by: Matthew Auld<matthew.auld@intel.com>
> Cc: Nirmoy Das<nirmoy.das@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bb.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> index 7c124475c428..a35e0781b7b9 100644
> --- a/drivers/gpu/drm/xe/xe_bb.c
> +++ b/drivers/gpu/drm/xe/xe_bb.c
> @@ -96,7 +96,8 @@ struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
>   {
>   	u64 addr = xe_sa_bo_gpu_addr(bb->bo);
>   
> -	xe_gt_assert(q->gt, !(q->vm && q->vm->flags & XE_VM_FLAG_MIGRATION));
> +	xe_gt_assert(q->gt, !xe_sched_job_is_migration(q));
> +	xe_gt_assert(q->gt, q->width == 1);
>   	return __xe_bb_create_job(q, bb, &addr);
>   }
>   
--------------5QWXhxg4k9G3CoQofGBGN6Md
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/20/2024 12:27 PM, Matthew Auld
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240320112730.219854-3-matthew.auld@intel.com">
      <pre class="moz-quote-pre" wrap="">The queue width will determine the number of batch buffer emitted into
the ring. In the case of xe_bb_create_job() we pass exactly one batch
address, therefore add an assert for the width to make sure we don't go
out of bounds. While here also convert to the helper to determine if the
queue is migration based.

Signed-off-by: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Cc: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a></pre>
    </blockquote>
    Reviewed-by: <span style="white-space: pre-wrap"> Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a></span>
    <blockquote type="cite" cite="mid:20240320112730.219854-3-matthew.auld@intel.com">
      <pre class="moz-quote-pre" wrap="">
---
 drivers/gpu/drm/xe/xe_bb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index 7c124475c428..a35e0781b7b9 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -96,7 +96,8 @@ struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
 {
 	u64 addr = xe_sa_bo_gpu_addr(bb-&gt;bo);
 
-	xe_gt_assert(q-&gt;gt, !(q-&gt;vm &amp;&amp; q-&gt;vm-&gt;flags &amp; XE_VM_FLAG_MIGRATION));
+	xe_gt_assert(q-&gt;gt, !xe_sched_job_is_migration(q));
+	xe_gt_assert(q-&gt;gt, q-&gt;width == 1);
 	return __xe_bb_create_job(q, bb, &amp;addr);
 }
 
</pre>
    </blockquote>
  </body>
</html>

--------------5QWXhxg4k9G3CoQofGBGN6Md--
