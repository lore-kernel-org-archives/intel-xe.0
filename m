Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B87C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 11:30:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF6EC10E722;
	Wed,  8 Nov 2023 11:30:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6EC10E722
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 11:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699443041; x=1730979041;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=wfgIQqnAVFkVGmzi7JmeueRlZsopxOoGalEYytbJzA8=;
 b=OoLzZfBGjel553k/+PnYz2c89xCgPQfzgM/pdQvPTA1aA+X37Nv8LPHq
 2pK1xRkTv3uhsVStAtN8fpG/ncXONqSpXQY8mEqBo/PA+6YsChDC704AH
 BZGFz8PinN2paqBRII5CIAKwY8DuK356w/RtYI8MPp5lTMR3/innC254R
 VVbjDRXTpkCvX5WatVtcq5Yv+NAmc4fXcYH6756qEZI53gmSl/gvjUbls
 75gOfDY7I+JL1JXklo69N/z9rooA6eYwUd37HEiRxwe8F3vunbCtewwMA
 G27vtNms0Ov23iJh3AKoUTPLnEUrYHhiQbnnQgGeRma6ci6qHJ74ki1la Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="389551920"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="389551920"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 03:30:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="1094468754"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="1094468754"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2023 03:30:41 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 03:30:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 8 Nov 2023 03:30:40 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 8 Nov 2023 03:30:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I6BeLU8luAGGXHfqlQqAdsdkoYRP6V8NyqEVrC/cg08hjlYMrQr0P9tk3BR+hK/wcBapArFpNWBbsPQPslnpaZGQqmHY8bgH3PxIoSJviF8SOKBF/NvWhRWX0vnx3hREmiG3odaJMLpI23R7pvEDUCyh9HjivJ4VJKfh/2IC0H7IYCZrDB57I4aGJGPGXI7r7ETFDAnRFi6AmlCXbIzjSk0ffBOmxxRNiasJDOr/iQ/QxEIJjdv9nsle8im6kHujhPIuRXcVltHojg7iHgqeJP90ezgrt1pOe8qjWvqam7JbknbTMO3ox/tBsUK0yfo4wdkDn1iooBA+2T5G4GxXKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OuRZs1NnQfEOLWW1VttPJgTg+7KoaqGo7ngotXkKNaU=;
 b=AvCdYYvUDuMgeqdLSAIHFt4thT6wJe6rvU/G0cD1DBua0aQS9vGFN/lQxRs3w+oqFNnLunlulLIcQcMqzN9ydjvFDBt1w5oWS4oGYXLcM2EzGmdw57R7lq/baNkuUBXcVFAaCtNALyMoNV1TmGiV7SpU4/QIVB5+HTtP7mOIy/on4G0Mux9qTTv+ZMTSLmFOKFJ0KQWhuqP7B7VP6fXoiFq7Lv1OaiS8I01H7UBHRUNyTirF83zr2W9a04vz4Uo4bf/uvDo4xSfEYHz6AGY/BfyQ4hvgjIx5WDxtPfSFSx+I9fjrdokppCfcGaNYgplOo5mkkTX4O5LBoRcD1Bz5lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by DM4PR11MB5517.namprd11.prod.outlook.com (2603:10b6:5:388::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 11:30:39 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::f434:719d:7588:f7d4]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::f434:719d:7588:f7d4%4]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 11:30:39 +0000
Message-ID: <d8763447-3045-4c2c-8666-ba2853f8c34a@intel.com>
Date: Wed, 8 Nov 2023 13:30:56 +0200
User-Agent: Mozilla Thunderbird
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231107052603.124361-1-matthew.brost@intel.com>
 <20231107052603.124361-2-matthew.brost@intel.com>
Content-Language: en-US
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20231107052603.124361-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::11) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|DM4PR11MB5517:EE_
X-MS-Office365-Filtering-Correlation-Id: e7e7f8b0-2e7d-412d-9652-08dbe04e223a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kTpHIhRPUpJgKV8n4yoIAT0k8KCxqOD9F0oY5E39oIYoiqWoB3V7a4fi8rV2p21uE5okYCaDQ6ybrCGigC05udiqvBRJkr/UtszqCro2Pjn7Tuxc1eaRf6yuXZHwlgb6lS9aHnlg5VT4XiwLKJNxiZAR7klCAWQPF+et4lpSVq6y2kFSrkMqToPHf3L/WLtoGEYQAYutFKkLOLTEQXXCU8qH6xCzNyBuvDm+qDiaNStpUMdufIHvl0yJaKXdBmhCSIMUg5NPzqTxQ3RoGJIgjK3jgiCrNON+C8i2o9graR7rbGtpV2lhMVuT7S7kTZ+2K9TnlM35cxWoO2KZquleFHyZwTAHd1ByOMyrinH8O6pCYNKjc87SYQHctkXOlvw+gyx+s1gbk8gqT43RbXmnxqe3Keyv6MCviwCzT66Elz5qgQXBmTQAPAPYA4r01aD9ACt4pB1409iwhf7kcmOwLUNUZZ/f4uPT8doYLWhcjSRlNj6geFPWwOvmrZg87VP00kvDGJz9qTfGlbboibCMrZ8EbZy3aHveOurG8lnB0cjQibkE0nz1VZ2Ann9/jCNqJmdEFagwy3MJ08pCllJxrqUpI73VoYM2NZfwCoKvkQWsJuGH4HKiFIzG8K/XpSVFw0PG2FsIJems7xS6Rt79gw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(366004)(396003)(376002)(346002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(38100700002)(6506007)(53546011)(83380400001)(31686004)(6666004)(6512007)(41300700001)(82960400001)(2616005)(86362001)(2906002)(5660300002)(36756003)(8936002)(31696002)(8676002)(66946007)(66476007)(66556008)(316002)(478600001)(6486002)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1RTcDRORGM1bGowMWw0elMyMHVEZDVrMHhjSHpjcGVlbmF0aVFHZklsV3By?=
 =?utf-8?B?ME5yUm1haXdaQytjK2RORC9UWXdFTmdTV2pCLzVtT2crTms5aGhmb1JBZitx?=
 =?utf-8?B?NWR5Vnpab2V3M1ZDWkY1SVY4U2hvYTdhRmZGKzFXRUo1aDRtbExoNFc2SnJL?=
 =?utf-8?B?L3Rlbmp3Sk9mTmNMc0duWDdhYXBYODBLOXdoWm9ETEhIZU9jN1JUV0E4bnQz?=
 =?utf-8?B?V3U1Z3BvVXlKRWdCRFJrQ1AyTmRmbElNSVNhQTRmNUY1N3p3VTFPT0pjOU9j?=
 =?utf-8?B?d3k1SFoyOHV2Q2c3aUtKM0VRSE9KdDhvVkR0U2FPTkhDVzg0a2tXRmJidDJP?=
 =?utf-8?B?ODVZRzBuamt0V0s3VHJWVm5uU0o5MURQd3YzakN4YUk3NjNyK0hZVG5QdFh6?=
 =?utf-8?B?MGRWT1hwNmZFbmtCQVZrVDJIdDRLZUxzc29DYVlNYkwyS3lBc2Y4K0IxMVZE?=
 =?utf-8?B?OFJoT01zWE5jdHduajYzdnJzVWlIbUJJNE5McitjRXI5YWV3L3VOSTk0Q0hl?=
 =?utf-8?B?bVVPZnlsUXIydW5Mc3NDQ0RvNVNwbnJlclA5bXhzVWFHeCttaUI1N3pwOUhq?=
 =?utf-8?B?M21iY2dwQUtlQUFxMFFTYkRHT21UcGN3cHY0Rk44ZmJWM2hwdUtKaTY5Vldz?=
 =?utf-8?B?clAwNEJqQzVVRmR0Mjh1cXpZaWxJc2k4TUVVMDZ1bmpkUFc2WDUvU3JiQ1B6?=
 =?utf-8?B?YlVrNXNnMUJIZForSEVRNDlXSi9uMERTVC9JK3JqRXlFS3ZlNGF0M1k4a1JK?=
 =?utf-8?B?RUF1ZTRKWGVQcTVsci9NbDduWGhadU1IR1JDQkU1M0g5OXJDNWlhRi9PZFlz?=
 =?utf-8?B?REVPYWhTOE1KS0RDUE0yZFd2M0JUYVRURjRaY1JVUllXdDNBV282UmFCejQw?=
 =?utf-8?B?ZW5KbGVId1ZkL2NxZ1p3Z0dQTlBvOFEzcWJ2QmFJczhnd3AxVHR6VjdpMUhZ?=
 =?utf-8?B?QjVvcktvckxBdW1xVW1QdnROMTRkU2FFU1N1SkFKczliaWNaSWV6WS8zYVds?=
 =?utf-8?B?cTlJby84VnE5S29xSHhhR0JKSU1iTE4rc0JIUm9za2FZREJoSHluZ3FOYkxQ?=
 =?utf-8?B?RlZUN2tEbFF2RWtaT3lway8vdzhxNzU1eUNydWNFTWtsVDArbi92cjNLbHFJ?=
 =?utf-8?B?Nm1jaU5qNTlacW90bjc2am1zb0ZrT2FVKzcxVlh0QjBlS2xrS0RidHYrdU5W?=
 =?utf-8?B?OEd1TjZxa1FKOUJjY3BPUDVRUGNrMEJrOEsyWVEzSmJzMElGajliTitlaXRP?=
 =?utf-8?B?aUkzTEZqek02eWJwRzlWVjM2U1RVajFtRnY3a0xsaGxaL1lieWtZSDhkOUVY?=
 =?utf-8?B?eWFET0pic2NtNFRXNXlxd2tJenZBVTdodnZjMEtFdlI5a08xK2JkZnlRZjFi?=
 =?utf-8?B?TGZ2SVNaUEF0aVJnbExQYmhKdVlCZi9VNGlKRld0ZUhwdE10c043MWZDQkND?=
 =?utf-8?B?MitVRzVFQnh1d1hqUU5yTnA5eC9yZFAxdHc3aVpZUHBZWEpYSlBnMkJjNzAw?=
 =?utf-8?B?eVBtZWg3UUk3MjNPaklCV0w2UmNCa3Z1dnowKytpL2xpOWQzTUZ3c1BNUkpC?=
 =?utf-8?B?T0ExcG9NUnJLVHdkM2Z2Z2NJMW5TakxYOVI5UnZ0TkZTM3Y4eHhTZFdEbDJz?=
 =?utf-8?B?dEN1MHhESVNQWjU5R3cxRWRTNnVaRlVmdFFNUVVmZFZ0T3ZyUjBQS3NCS09B?=
 =?utf-8?B?ZVpTd05yR2JJUnM1U3o3VU1LOVdlMnlvMEoyMFNSUGZVNlBDSmZmbGZPbmg5?=
 =?utf-8?B?MXJ0TGpEK0RaZnB3ZTM1c0NPZlluaDJraVZ1bTM1VDNnVVRiWEZBeEQrNWxF?=
 =?utf-8?B?ZEIwVWxyaENTTGpmY2xETE1hd3ZqWkxKQ2lWeFFBTjRNTHpBcXA2UHhqVUFJ?=
 =?utf-8?B?My9SRkhpVldyTXBHSDdLVFNUYXJSZDJ4SFhJdXNiUXg3SWJSMlpQMDYzbkhw?=
 =?utf-8?B?Q0xQMnlwRm9VVitoME9WUVBMZEZvSFpnSDEzdGhmcE9LU1dxWmowaXdScTJa?=
 =?utf-8?B?dGpMTjkraGZGdkJFQnBscEhqemZJc21Td1ZZc00zU2YrU0NQUWJVK2xyZWNy?=
 =?utf-8?B?UDFlU3dCd3FnckE0bHBvWGpqYklpRlJURm1uQVpWbW1yTlUyNmFIQ25Nbkhz?=
 =?utf-8?B?SFlUamYyYVVVWG8xNkN4ZGpwYWFrTEJXeFExaTBSandTbnlPdXdFcGtydWx3?=
 =?utf-8?B?QVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7e7f8b0-2e7d-412d-9652-08dbe04e223a
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 11:30:39.1486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zc/sWH3UC6TUWnBuWF+DPkWaxBjDxM/elAsXYa3I0YR8CPToQiFFb3I1AF536p/SPvzqfOFt8Oi1XUPynA5qZPAvOkUUmymhNXrMj13eDzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5517
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 01/27] drm/xe: Allow num_binds == 0 in VM
 bind IOCTL
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

On 07/11/2023 07:25, Matthew Brost wrote:
> The idea being out-syncs can signal indicating all previous operations
> on the bind queue are complete. An example use case of this would be
> support for implementing vkQueueWaitForIdle easily.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vm.c | 30 ++++++++++++++++++------------
>   1 file changed, 18 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d26c90f0d702..403444ff3856 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2850,7 +2850,6 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
>   	int i;
>   
>   	if (XE_IOCTL_DBG(xe, args->extensions) ||
> -	    XE_IOCTL_DBG(xe, !args->num_binds) ||
>   	    XE_IOCTL_DBG(xe, args->num_binds > MAX_BINDS))


Just randomly noticed this, but is there a uAPI for the MAX_BINDS?

Or do we need to hardcode that in the UMD and hope it never changes?


-Lionel


>   		return -EINVAL;
>   
> @@ -2977,7 +2976,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   			goto put_exec_queue;
>   		}
>   
> -		if (XE_IOCTL_DBG(xe, async !=
> +		if (XE_IOCTL_DBG(xe, args->num_binds && async !=
>   				 !!(q->flags & EXEC_QUEUE_FLAG_VM_ASYNC))) {
>   			err = -EINVAL;
>   			goto put_exec_queue;
> @@ -2991,7 +2990,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	}
>   
>   	if (!args->exec_queue_id) {
> -		if (XE_IOCTL_DBG(xe, async !=
> +		if (XE_IOCTL_DBG(xe, args->num_binds && async !=
>   				 !!(vm->flags & XE_VM_FLAG_ASYNC_DEFAULT))) {
>   			err = -EINVAL;
>   			goto put_vm;
> @@ -3028,16 +3027,18 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   		}
>   	}
>   
> -	bos = kzalloc(sizeof(*bos) * args->num_binds, GFP_KERNEL);
> -	if (!bos) {
> -		err = -ENOMEM;
> -		goto release_vm_lock;
> -	}
> +	if (args->num_binds) {
> +		bos = kzalloc(sizeof(*bos) * args->num_binds, GFP_KERNEL);
> +		if (!bos) {
> +			err = -ENOMEM;
> +			goto release_vm_lock;
> +		}
>   
> -	ops = kzalloc(sizeof(*ops) * args->num_binds, GFP_KERNEL);
> -	if (!ops) {
> -		err = -ENOMEM;
> -		goto release_vm_lock;
> +		ops = kzalloc(sizeof(*ops) * args->num_binds, GFP_KERNEL);
> +		if (!ops) {
> +			err = -ENOMEM;
> +			goto release_vm_lock;
> +		}
>   	}
>   
>   	for (i = 0; i < args->num_binds; ++i) {
> @@ -3092,6 +3093,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   			goto free_syncs;
>   	}
>   
> +	if (!args->num_binds) {
> +		err = -ENODATA;
> +		goto free_syncs;
> +	}
> +
>   	for (i = 0; i < args->num_binds; ++i) {
>   		u64 range = bind_ops[i].range;
>   		u64 addr = bind_ops[i].addr;


