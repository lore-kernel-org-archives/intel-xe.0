Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7456FC54E58
	for <intel-xe@archiver.kernel.org>; Mon, 11 Mar 2024 15:22:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DE09112B12;
	Mon, 11 Mar 2024 15:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dJueZNOT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0919D10EBC7
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Mar 2024 15:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710170558; x=1741706558;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3zi8+F9nTE7wjspF45J28x0Z7nOyNb7+X6IunViOWAE=;
 b=dJueZNOTdV5ODqKrVEt/PIgQo8pxwbuYywXWmXDEqnAmVCMhYiylS6/7
 iDczm3D8uhCaFLoHkW2Qte77ZyDT8s2hKjpEN2jEEd8xbj4J85moRL+TI
 uO84SN+GZDxhgBDT5Q1pGYfiDNATwJ2bEJWLHuilb+vetsLrSgcnk3ihS
 mthSqQ4YuapLzr9445cJPt3OipvQC/oxrlUw3wnWDk0RevHYnd61tt99N
 sIOFYWBDCh4s8WD/BjCDlftHnOWMGyC5URPS88Pxca5OjNDNVqHpAvbXN
 q7xjnL4SSdAwet9ldHAYCw+pQP4sw4jIrU/wYocecq93CzJH3bh1kwq46 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="16278071"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="16278071"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 08:22:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="11083063"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2024 08:22:22 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 08:22:21 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 08:22:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Mar 2024 08:22:21 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Mar 2024 08:22:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KCaFhYp29B2ptJ+7JCYT7PX7dD3EyiWdAEgm+zrNey6J0Rz43GZRmjcQ3T/T7YzOyvIbPtYx8fqb/at5oOzNHHVKBN5089nW1u6B2/1I7JgUigK3ZmgKkMGHgAUh7hl6dUi+RUcpUaOncnl/L3AuRNloHqLY1r75Lx0YGphIPyhAwnVEQ3ewu263JC+sZgcyk6dPrZUbr2Nyohtv+z/gXN5db9CBHrah0cHX5/TthB7iKxs5WXSt5lSjMG5Fay94nEQaKmy49u7sKi7MKkUzjvwSYoaOmuUtNpvL7NwTYzVcSszK96ME0AUZ8nu+THwF0MweM86omUTRd0eZX0XE3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pbUc06ye6MC2laxLmIeUHyu6DxUqOFIGqGM7rKGq9tU=;
 b=TV0VG9GCYKsft7QxRSkxsnqIZ6V66H2A584MiqCN8BGZs70L8e1qPTYOPldV5glYKRX2hQYXvUOca9ZiVafWqy9HwQAyiemxWemCeJNPD/HqeN9oP3oQn69U9nkU8mocaUlg1cE2hU3UyFvyCYEgMUvbjPKStjWGD+BMH/MF9VHo7mrEDK21bNgQQFRsjXARJedZAsCJqFMi/sXhgWCBaLBwUxavG5BuqkC5JHcCgMt0QfUPXDLnn7KkHzC1uIFZCYfeba3wOzi+u65yeDJru/SmT/Z9QvsStRB2iAfEa+utilFWs4DezSxVXT1HtAHtJV35E7gsJUE18G93oJSSog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 PH0PR11MB5952.namprd11.prod.outlook.com (2603:10b6:510:147::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.16; Mon, 11 Mar 2024 15:22:17 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e%7]) with mapi id 15.20.7386.016; Mon, 11 Mar 2024
 15:22:17 +0000
Message-ID: <515970f8-36f6-45d7-8a95-2d40e66347d4@intel.com>
Date: Mon, 11 Mar 2024 16:22:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Remove unused cpu_atomic bo flag
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20240311143415.6509-1-nirmoy.das@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20240311143415.6509-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::16) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|PH0PR11MB5952:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ae0bdca-8477-474d-2a62-08dc41df094d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rQXDng/2mpIFy9nHzplX0wNc9qqFgNoTMMlvRoUw6wlkR2I8l5fOD5FHwx3tyXTgcGQgQtEUsCFRUGh+oCkGMzwWKaNxq4mIZSAQOklI2/H2H4ykOKvgAXMlNGhamhYfyUL4CFxvAJYM0zRHHDF/LdDac88gE8pCZ8UtXGEpejKYEeaLYfIz9AjgEKAsTWk+mGFyHGEVbkO86e8U3OkwOllC6w0xrKY6xJi06lg5rMh/K4S8tVUjc2EKzPnX72sf1E2mq9AJ1e9qtvNeBLKwNBbTTybOkL2tkvlv8jyJHCOwTIQSAVyULm+s4HFsxnLVjZbqjcqQDaZ3C1iO1ajhbDiTWGqurYDRBI3bvVwwgjfexMBgrnZk0lbR/l17dVqmjANGFGjAOftyO7hncGAhxh0QsDP5ZDT4h8s+EVZZrY3t0SB47+44smehZUyd7sN1co+ThUEuBec94pFpyjEdKjpDsbcAwVKHULdJPJ2V58Z2aLPayRXGzXq7iqQ37nc+BvFhLjg7DLTc84f6wbjWUmp5Qm/M1mkonxiYcPiYP2RyH3PWiGLHHk5nW7QRkSD/Sli0YpV5GjdYbSq0ORx9onehj6AdXd94+M6B4aYkKj1/CZawsCYEVEf3koG/2EJvuYcxVp4B9652Q8s9OQDvMN3d8N9971LAih3/RNL7ayc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDFrWCtmelF5VldnY0laUWlPTXN3aDErd0lmTnBuV0tadWlRZGh4cDlySlpK?=
 =?utf-8?B?dlZFYmtBNDdoRmZNbHRsaElkVlBHZnhUSFEzN1FqUytuTkVJZWFTcVJOeVk1?=
 =?utf-8?B?QmNmRE9uZmIvQTFUVDFUTlI3YWZjQzk2Q1kyS01EOGplejVJMnJZWkxFMUt3?=
 =?utf-8?B?OGwvalJVcDB6WmhacFpkMmFpLzEvVlRlMlFoQVdnc2FvR05OaW5QWitKRVZZ?=
 =?utf-8?B?RlFqQ0xmOGZyZ3F1Z01LUVZPTEFFeGVCU0RuYUxnclBPM2VZS2d1cWw2K1dm?=
 =?utf-8?B?Z1UyNUIrMUYwdzBjMzlCY0N0MGVpNUNyUTlSRjNyNDlPbmJHankrMkx0KzFS?=
 =?utf-8?B?blMyRG1TS2s2aXVFdGxwdC9GVzR6SDVENG9XTWF5bW1nSjgvd2JEZXkraFpU?=
 =?utf-8?B?dTVzZGs0cWp3WlRMb2IzdThyTDBUYmRPckFzdDBSamM4QUdoVkNHNDVyM3JZ?=
 =?utf-8?B?ZFhBQ1A5QzlXSTBIZ1BGUEhGUTA5dFJGZjVxUkVkQ0hjTVBFZy9zZnRVY1lj?=
 =?utf-8?B?VDA0bmVHeENoUzNLcWsxZWd2MWI1U2JqLzMvYnduVkFqT2lBYmdranpJNjlv?=
 =?utf-8?B?VjVaZldjUFppSlZtbll0QXE4NWtWOG9UUHhUV0VEZDFLTTFCWGF1SitPZjZB?=
 =?utf-8?B?b09UM25yYjNSWEdrQzJSK1NIL2dVWkhkMkV1dHF5cTJ6cy9xK29ISXMyU205?=
 =?utf-8?B?WGNZSWlnTkZySk96eVlKRG4zdytqUllDV29icUkwYU5PUnFnY20ySVdaSnBF?=
 =?utf-8?B?Y25vZlk2dmdDL05zUVBxbGZtaDh1OWdQK21VZTdXQTY3QTZML3JiRE9PNkpw?=
 =?utf-8?B?ZjFmZ0RyMW1mRXdlU2tKR2pUdmlZT1ZCMUlwMnYvemtRYkVGSmd1WTRSNy9a?=
 =?utf-8?B?V2ZXNnB2VjdEWkIwNG45cnp0NnRKTXZQTkJVVVdFUUhQd3ZKa0R6SDRiRzdv?=
 =?utf-8?B?U1V3L2Nic1NSZ0JtY042a2pDM1FTQmluV2Y3eU1ZeEx0dXpUVG9GRUpVZzNr?=
 =?utf-8?B?bkxhdlRZN0ZHdEFBaWYxMDN0blY3MXpaY2t3SitNejlkOTdDRHZ6OUJkamlZ?=
 =?utf-8?B?TlNXVkQ1ZmZJR0NleDNjbndodDBJNVlVejBjQzJRV3JPbnlNSGlmVG9FR29F?=
 =?utf-8?B?d1BqZEJsUUwrZytnNlNjd1dMeVdoaVpjdDZVZGIraEJ0d1B3ZE9qUWZzWE1l?=
 =?utf-8?B?bnZkQjJBY1owVit0K2JQSzZMVk5QSjlyOTFyR3pqU2w2OEp3dGVxV2NxcDFQ?=
 =?utf-8?B?K0VVVEdYU3MyOUJMaWcxRHBGZlpLbkdpMnFTKzk4L2VCa0Z3UWxVSUtkcURS?=
 =?utf-8?B?VGdmU1AvbDdtRUMvbFA5S0Q3bnZXY2x0allRb0xQUUY4dHZoTGQ5TjRXbGdO?=
 =?utf-8?B?T3JRUWg5WlhVejZDR1ZxMWZCZWxCM2pHVWIvQkg1STg5SnhadnRPb3FxMnRO?=
 =?utf-8?B?cVZoL2I2WnIxdjVRRkV4RDNENllHQ3JyeTVscXB0Mk9zUXNkUjgvYVliQ3FD?=
 =?utf-8?B?QmpGZGg4dnArTjAvdXRhZWErY0lQbGloL1NQVGo3TGVkNXVsVzJzeVN4cVl1?=
 =?utf-8?B?UUN5NmJ0S1VJd0hZd0NiQlA4R2w0UnJUT1lPNkVnWlJnUTV0SFU2MElnNFdp?=
 =?utf-8?B?Z0F6Tkhja1lLWDd5R3RnbXNwTkl6VnRMTTM5Vy92RDdKdElMRlFZcnQ3S0pm?=
 =?utf-8?B?ZjVxOTJuMkNDRnA4YlZJNlM3aitOL2M3R3YzVko4eWZsS3pTRHVPczBnYzZk?=
 =?utf-8?B?N3lGa1dxOFAwMkd4QzR0OTE3dDVxU1BLbUNJZnN2bU9ucStJbEhWY3g3SHBY?=
 =?utf-8?B?SmNLNnNmK2Y2RFpBcmRsOXNVeElvU2JVVTB6ellpV3g5UGVBY2dSMU03am1D?=
 =?utf-8?B?WUdSckk3VDVFN1E1b292NGNGNHRxcytJenVRS04zVkRhY2lNSU5aSE0vbkdp?=
 =?utf-8?B?R2dhcndBZ3JnTUlxTU1oYlJCdWt6cDlONU1QVkRBSVdjQnZTMXhxZHREMll6?=
 =?utf-8?B?dEwySi9VTGNUR0JVN1l2NGdHTGZFSUpWY1QrcnppZDI4MVd3U2hjMy9RS3hG?=
 =?utf-8?B?U21uL1ZiTXVvd2huRTc2WElvM3ZnNEhCTDN4MFVTVE1aRlpSSlp6ekVvQ2w4?=
 =?utf-8?Q?UaKaRKlcuTkcNU/GTlK/BEZsH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae0bdca-8477-474d-2a62-08dc41df094d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 15:22:17.1792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zup9BYT6OcwawteeKu7Y32kLXuYHIJz558wzcQiEaFtdPA/KXCMW073VTtYl8VE1mvbAKQgoONbuRHvmg2pPtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5952
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

Actually the whole property struct is not being used. I will resend this 
with other unused members.

On 3/11/2024 3:34 PM, Nirmoy Das wrote:
> cpu_atomic is not set so remove it and also related dead
> code.
>
> Fixes: ddfa2d6a846a ("drm/xe/uapi: Kill VM_MADVISE IOCTL")
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c       | 22 +++-------------------
>   drivers/gpu/drm/xe/xe_bo_types.h |  5 -----
>   2 files changed, 3 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index b89ac6db68a1..edf78505091e 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1118,13 +1118,6 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
>   	}
>   }
>   
> -static bool should_migrate_to_system(struct xe_bo *bo)
> -{
> -	struct xe_device *xe = xe_bo_device(bo);
> -
> -	return xe_device_in_fault_mode(xe) && bo->props.cpu_atomic;
> -}
> -
>   static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>   {
>   	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
> @@ -1133,7 +1126,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>   	struct xe_bo *bo = ttm_to_xe_bo(tbo);
>   	bool needs_rpm = bo->flags & XE_BO_CREATE_VRAM_MASK;
>   	vm_fault_t ret;
> -	int idx, r = 0;
> +	int idx;
>   
>   	if (needs_rpm)
>   		xe_device_mem_access_get(xe);
> @@ -1145,17 +1138,8 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>   	if (drm_dev_enter(ddev, &idx)) {
>   		trace_xe_bo_cpu_fault(bo);
>   
> -		if (should_migrate_to_system(bo)) {
> -			r = xe_bo_migrate(bo, XE_PL_TT);
> -			if (r == -EBUSY || r == -ERESTARTSYS || r == -EINTR)
> -				ret = VM_FAULT_NOPAGE;
> -			else if (r)
> -				ret = VM_FAULT_SIGBUS;
> -		}
> -		if (!ret)
> -			ret = ttm_bo_vm_fault_reserved(vmf,
> -						       vmf->vma->vm_page_prot,
> -						       TTM_BO_VM_NUM_PREFAULT);
> +		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
> +					       TTM_BO_VM_NUM_PREFAULT);
>   		drm_dev_exit(idx);
>   	} else {
>   		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index 14ef13b7b421..f62a130fc948 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -64,11 +64,6 @@ struct xe_bo {
>   		s16 preferred_gt;
>   		/** @preferred_mem_type: preferred memory type */
>   		s32 preferred_mem_type;
> -		/**
> -		 * @cpu_atomic: the CPU expects to do atomics operations to
> -		 * this BO
> -		 */
> -		bool cpu_atomic;
>   		/**
>   		 * @device_atomic: the device expects to do atomics operations
>   		 * to this BO
