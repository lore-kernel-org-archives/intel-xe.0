Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74170C4167D
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 19:58:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2498A10E091;
	Mon,  6 Nov 2023 19:58:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CB610E091
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 19:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699300705; x=1730836705;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=aqZ/OEOkTob2IxSfoQBDB1/Q2PbMdcs4d5XuytqCyfc=;
 b=DAHlYo0yVxX4VhcVAg6coI6dJJywvCiOkjLY8o5uPHE1Kor2+CbZS479
 lhIt1m4CLLydi/onRnAdvUp8KH90YqfTZizJx1W8hpt/vIQlDcGA0ay7U
 77sjokjuPexWuL8Q3JrPIZWj8t9BKY/b8FhApuouOFKw/gXlbcOdjuX4P
 OBBJugHIZmBA1uoevqNVYTrARqjSTNMMAAvkoARJhdzQVjenoURmBzn4h
 b7tAsm2mOt6kjHc6qTbn/AEpDNCfZWSjGCxJq/OBSYbEblbTpFHPun/Pj
 lZy/FQ2F7N6wnJWOkPZkwDZaAvEFAc0QEkQDjf2uhKfff/sD1Hzy+J72X Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="475597241"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="475597241"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 11:58:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="712312042"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="712312042"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Nov 2023 11:58:25 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 6 Nov 2023 11:58:25 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 6 Nov 2023 11:58:25 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 6 Nov 2023 11:58:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mE4LeS4tJnkRJgxTS/ah6gzOwcRQL6u2DFMa5Pz23B56n/sdIEL5JQuEnu2DPO8o5K4zk58XaB6ZCGjd4K1Ui1DNUKG8GgMpE/viXHVmOpmUH+jwtlJEt3jsectU5hxKGn1WjpFvAKtixEjwGFv7WI/6zOvwcaMqGV75SqOZL/9aETnz37hCJa9fVZfs5L2iK4VyJNQIoOERiiS1bPvBGC65Lml3vcgMJvCyrLy7HHWqmByPiqBRJ0IkY6TOAW1b9GkC7S75fC77HMq4+a7ySZbCl2avW2f5pij5LtO5dMF89Oa3gjft9pICKG4LPRynnhI7PvlUiPv6DrYE15ygjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l0GrooJ4MfY6Lu/bpMyyY1DmTlVd/1AvAu/KTaB9hnE=;
 b=H0jdj4gfSGH5BEnsTaoXGyiVvm/7mjSs4YWSXVywi39z4dvviUmlxZuHelkz/eap9tCldg4haV/8gR8VyQSW7VOuJGOPrdsxE0iexnHSEZlwTfmGpuEutjBjZVVVOM1+dTsEbbME2qmm45jII7Jj8Ky+prza6rM3cdqRAeoqscwYZrsXLzxY2XkgrpeYp/40tWZtChj5Qdmfa1se3PBMFtCAFdatvGBPBLgRJDDZlMq1HahDQoxwuO2hKIVcjSvXGKslOpNsCuMkZU30q6KsFFMXdMoV6/LqYPndlcy8fGgIWp9EGhrlwL786it+8/GR9SLOiInlCRAqoe9T4kYDYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Mon, 6 Nov
 2023 19:58:23 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::7c9d:a4c7:4e1e:aebc]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::7c9d:a4c7:4e1e:aebc%4]) with mapi id 15.20.6954.027; Mon, 6 Nov 2023
 19:58:23 +0000
Message-ID: <921e39ea-5e8c-4787-9077-a16666af24ed@intel.com>
Date: Mon, 6 Nov 2023 11:58:20 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Pallavi Mishra <pallavi.mishra@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231103211924.426715-1-pallavi.mishra@intel.com>
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20231103211924.426715-1-pallavi.mishra@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR04CA0030.namprd04.prod.outlook.com
 (2603:10b6:a03:217::35) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|CO1PR11MB4787:EE_
X-MS-Office365-Filtering-Correlation-Id: d82bbd45-08ce-45e8-162b-08dbdf02bb3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wlQXvyqpend+CIYJf2FPn412DdBBwj1G84Xf7pGJMu5YE0KpjlgFj9Fwi67iCDE5vHOwnHm6g3PlKqu7NPlgdrmMatTsb2LmO2H8mx3XM0MyOCYhJ8lkg9giXXxzFUtdMLFhcK6NvCUqTQufyCBtfbcViVSgNXQaTox5hTtZnuXtCVi8xUFXMU/Nst/G1SfKTLQgnJr6W/KNMAg2IzJnJ80/QG94SEi8IL0K9+u8DhWEk5bphERf17uWLxuNu0F4AHtYNGR1EA3sLX8ECAWjwGjb4VCQFuvERno9L81Ka8jFD+WcfKheQC1XCKC89DYD9m8sdYc8qUT9fBoVUZEHD0xMZIPMFX+/qlFLO7f8MyfhuMlgt+9oAdINwqOujLuEz2tOifgwCok9T1vtYjZjTV1q8xyaKCkFsBraYNxJPCh400hiBo+1KHBfi3AxD/YVfJSXjYcGzTnpvy9IXeLO3SQdqBkt5tsJBe8Fl0N3h0TFAJLtekA2ivFChXWjDDLsS7r+q8PgxuQHA76laHVSL6czlTs7dB1/ouoy0TE+j1+UsVV6GFxGs5EbxyRFbGhWIUDALLMqRfx6x99KnPqPu60X0HdfDe0Hmo7a6w6Agz5xq1Vkx1ApKH+ukkszGDohE5EId37RL0cRUyHuKWqeNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(396003)(366004)(136003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(83380400001)(38100700002)(53546011)(82960400001)(6486002)(478600001)(6506007)(26005)(66556008)(66476007)(6512007)(66946007)(2616005)(5660300002)(2906002)(8676002)(31696002)(36756003)(86362001)(41300700001)(8936002)(316002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SU8vcGRudTBHazFwSi9GMWpRd29TeU82TngrdnVTbmNRS3kyaXhTQnhoVVpl?=
 =?utf-8?B?cU9IbUFZN2dXWURjZzJCYlc4YUpQRDhPZDBpZnhOQlp2Wi9wOUNobjBYbGVk?=
 =?utf-8?B?U3pmZGpycXYyVnl0VjZCSHVPdjVyTzIyci9uelU2aCtZTHZNdjJwb2tFbWJn?=
 =?utf-8?B?aHdiMHFVWjhjdFlYTWR5bm55ZytEYkhDQjY5b09FT3ZRUHliN1RCdzZVMmhM?=
 =?utf-8?B?bFA5NlcvQXFIbisvcXhtMjhCUmI2RldsTVF5cGtOMUZxM1RaYXdqMkVia1FZ?=
 =?utf-8?B?bGpWS1kvK29NcHhFNmxHTUh0blVxT0FSdEllMlRWbWlrVFNXQzZIVGNhWXRQ?=
 =?utf-8?B?NE1RY1dzSTc1ajlVaU1rMkJWQVJtNG1ZYnQ5ZFpDUjczSHhPRFo0OTlJYnR0?=
 =?utf-8?B?R0hubVZwcUtNYzZDd2NRelQ3NE1QRnpucFdvOTVlaXc0QXJ5OXNSYjJlSnBK?=
 =?utf-8?B?Zi9DNmZYZ3dCb1AxSTBPZ3JneEVNOWw3a1E5Zm5Jb2FGTHNWY0drWnhSSFBK?=
 =?utf-8?B?MGx2SWZzWHFjWStVVzdKTkdmcDJHNlNqaXFrZElka1RBNHNZQzFGZDlWMDV4?=
 =?utf-8?B?R1lmVDc1Z2I5bm9paTZEUzlPSmg3Ui9zeWpjbm5VUERzVVVLQlBweENCajkx?=
 =?utf-8?B?akFCKzlsSkhWeWNhSk4wSzlKcERDMjN6ZFlaT21zbXY4R2I5ajdWbUZFRFFx?=
 =?utf-8?B?SEpudUFMaGZLRE9BK1UyUmtMVUJ5RkRqRU1FZVdFOTdRN2YyUDR6b3FnUmVF?=
 =?utf-8?B?ZnR4NjVaLzNlQmw5US9KU0gxR1BCRlRya1Q3OVBYNllndWZKZTZ1aGNkQ2hE?=
 =?utf-8?B?amIvZVpZM0VRYWs5UHpBeXdwNFo2WVlrSC82N0lmQm9jVW5kMzBtWDEydzVj?=
 =?utf-8?B?MGkzeFdoUXlvS1pzdWc1ZU9RaFZtZEdtNExYelV2SGN6TkxJcXAwUU5UUUtP?=
 =?utf-8?B?eUZRM1d3cGl4YnhDWklHYUhRazArNlJhSmFveHVrc3FrQ2UrRHFaaHdLNUNj?=
 =?utf-8?B?UnJTM2xGMlU5WTJCU0pacHB6dkFOOGM2TmF5Z2RuNUZMaVZWbWVMZzExZnpD?=
 =?utf-8?B?TlZWS0lPME9YajBQcXhBWWRaNFF0TzNyMGlySy9QSzlqYkJDczQySlcvWERj?=
 =?utf-8?B?d1dvUW9sdkpicnF2Wk9qemd3cTJjV3AreGNxLzYxNGtIL0FhSnFZZnA3cmtM?=
 =?utf-8?B?bHRCeHJ4ekZxWDc0d3JjdXVQTFQ0NW5qUmtUcUk3bG1yTmNJUURXRm5EbTdX?=
 =?utf-8?B?aXYvdlJXYXpzV1M4UlBISllacThxUGpTem5Ic0pxUHNPakZNeWtpcHFkTUwx?=
 =?utf-8?B?MlM2VVlBVGVZY2dGY0Z1MGExZ1pEMzBEOTh2eERtNGppTTJxczVydXYyemw2?=
 =?utf-8?B?a1hsNk10VnoycDJFWEhwWnN5NDIzMHE0SjltNWRkQjRkNDB2dENzMHZUZ2lV?=
 =?utf-8?B?bEdKQVgrWHp6S2RPTHpodzN4dk1KbGN1aFJWdndFS0x0V2VDT01qK2x6MkVa?=
 =?utf-8?B?QU8zQXByMmlNOU9OSFJ3NjFTdEpUS21iZzVOK2IxU2FrS0t0bDFGK21laWZD?=
 =?utf-8?B?dHRFNnJlMUFxYUFQTUVqV00wc1R3N3RhWjdzWTIyWnpGdW8xbGZockhjM3NB?=
 =?utf-8?B?YXpzZVVweTdEMEIvMWRvUEVzbzdLbXZScWhRV1Y3d0duT2kvbFVNRmJ1blpZ?=
 =?utf-8?B?NkpZNXRHZGxWaGtnVTRtRVp0Szgya2U5ZEViaXRKQUpUWTZWNmJxdUF0bStq?=
 =?utf-8?B?SGVnakk3eVROWWI4NGFBU1BlK1kvUTRCNE1FdmI4Z3hCNGxEd1BJVjMyK3U4?=
 =?utf-8?B?Uld1Q056TEszcFQwUEZaZUVIbFplM2piV1Q5VVdxMXUzM3FPQUIrNm43bUtG?=
 =?utf-8?B?bHhJSHZ0NzhhTTlXN0dEUW8wWTNhaUREWXoxaGxCK0xtWUxTaE0xcndGUFZm?=
 =?utf-8?B?cTFXMXhNSDJwQVN4Kzl5UVdRck5Yc3haOU9XbnlPc3RvSUQvdVFQclllZUJL?=
 =?utf-8?B?Q0I0TTZlUkYycW1rcWVaTUxYTFZldzFJSXh5dFFuSkZiYkgxU3F3ZFFLRi9x?=
 =?utf-8?B?aWFINysxUE4ydEt3YmlZVHE0RkVOSHpiZkpDUlBsVWJBVGF4bzQ5VFdmeVFG?=
 =?utf-8?Q?y/K8AMB4pMv8x4/9SSqHmL0DQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d82bbd45-08ce-45e8-162b-08dbdf02bb3d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 19:58:22.8885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Jzvy2heSnYjK0sG9eHxlVh7ZH99x/t3X25mU597BVczg/7eF4pQuEUHC0CdcW/6HucpHGMlrC8lJb9hYHlvtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4787
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Prevent null ptr dereference
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



On 11/3/2023 2:19 PM, Pallavi Mishra wrote:
> In scenarios where vm is not initialized, use xe_migrate
> to get the address.

Can you describe this scenario?
Is it legal to call xe_migrate_update_pgtables without a vm?
What code path does that?

Just trying to understand if shouldn't be instead returning an error if 
vm is NULL. Or that isn't some other driver bug.

-Brian


> 
> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_migrate.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index e6a31f90ebdb..f79ec8e4ae4e 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1296,7 +1296,10 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>   
>   			xe_tile_assert(tile, pt_bo->size == SZ_4K);
>   
> -			addr = vm->pt_ops->pte_encode_bo(pt_bo, 0, pat_index, 0);
> +			if (vm)
> +				addr = vm->pt_ops->pte_encode_bo(pt_bo, 0, pat_index, 0);
> +			else
> +				addr = m->q->vm->pt_ops->pte_encode_bo(pt_bo, 0, pat_index, 0);
>   			bb->cs[bb->len++] = lower_32_bits(addr);
>   			bb->cs[bb->len++] = upper_32_bits(addr);
>   		}
