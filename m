Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06317CD4F25
	for <intel-xe@archiver.kernel.org>; Sun, 17 May 2026 09:13:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B204E10E17F;
	Sun, 17 May 2026 09:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZCMfW5uz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E6D510E17F
 for <intel-xe@lists.freedesktop.org>; Sun, 17 May 2026 09:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779009220; x=1810545220;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=urxgcgo1FECiNFSgTHQniP2nPSzEUGoeYnFBJDd+gqE=;
 b=ZCMfW5uz1sp1Y8+tvy+6w137TCwUiPOh3W5Px5DexROBTJAZcanmIyu1
 TNLQDjphEkSMlFHG+SIONdDyfhUMLpgnux2piAyZEjW12WOyzZ7fMOX7B
 qEeoCcUurAmnEFzwkSe0wOT9e0Pp+EnMmWhfJMgmFY+XMfqs4t4jl1dco
 ssLiWq/5fNbe7HwU8qWnyUHLNtF4LqG8cwWJhDsu4vX9XhYsidhdL6ydB
 wFxOaIEsSA1e/Mp/lekFeOn8AETmWCMmvIuRTkJXuI7jnBnWa0amIsPB6
 kevMw3zGHU2h80Spe5AENtiE98at5ZSqLfDnAA5vWDIuDDk6Rgjq3Ks66 A==;
X-CSE-ConnectionGUID: Tp+UvuGTRqeTFJXuhvRfCQ==
X-CSE-MsgGUID: 0hHlWefcTtCcCZfAqDMSVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="90591133"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; d="scan'208";a="90591133"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 02:13:40 -0700
X-CSE-ConnectionGUID: FNdmYdewRYu0mhUFEpHLyw==
X-CSE-MsgGUID: 7bKINlL6RQWKsoqT84JN/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; d="scan'208";a="234681213"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 02:13:39 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 17 May 2026 02:13:39 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 17 May 2026 02:13:39 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.49) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 17 May 2026 02:13:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IDxQ/yXU2eToR4QuKYhg6segtcf09A7/xHC1GzuU4T9tUd1I9DogT0TkX5aGRmR4/3ty3pAgRVxmeKyXUFKMX3rMWrX66lw+9d6jKodPOnOTCTH8hg4K3i5siBOOxB9USFiC20IPp5ZOPtmHhdpmux9uILB6sVw/8fc03U2E4E2AwMZ5RsGH4utH7vijPMSdSjtMbqAHPVa9yCx6z7CrgrmuwK1X0gaFboTSljVfD7SVihSXQsJlGPK/YtsoZommp74HW45GDXvD9J4S1m55zwHtaHK26n0Ac7uyLpWT1eHtlRmufuqtEkZrRsEPsYGQssgFgzyt3jKcb/u83uKpKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dtiVtKfKqeC0qF86C/bLI2F5Kuuh03hsVYeuyAWpDZQ=;
 b=hvS/eipEtoat42dftv6pFrTvtUhwNBSVfDVs9U3IG+MB3GlWW/TNk9oiy271DOPerdkQVdvNoAjj4BudnD/oZqQFfDuiXA9G0tI5cUUmRr76D6RHaZiz78NL3F/330SgTKgyU1mrxzN2wPeDuYdKle0udE3szEeVZmxFD8r2cZU/9p+8ZDRP6LTy23j5BhTzv+k6GyZTbROc/+t5JLOUnf6aaOBrZAWz3LNb6P6f68sVZ4XeTkjvvOgaKbGowCeKVtIZerZPRSWQl4Xz7RpoRDnWVPU080YEsua8yI0kWxGmkb8/PqDdQvvQZlz9FbPWUEFwfiTKEHbsXSUKIolRCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by CYYPR11MB8429.namprd11.prod.outlook.com (2603:10b6:930:c2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Sun, 17 May
 2026 09:13:36 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563%3]) with mapi id 15.21.0025.020; Sun, 17 May 2026
 09:13:36 +0000
Message-ID: <076ebb81-e1ac-432c-9dda-a4251ebae917@intel.com>
Date: Sun, 17 May 2026 12:13:32 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] drm/xe/memirq: Update GuC initialization and IRQ
 handler
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260514150010.7123-1-michal.wajdeczko@intel.com>
 <20260514150010.7123-4-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <20260514150010.7123-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TLZP290CA0004.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::15) To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|CYYPR11MB8429:EE_
X-MS-Office365-Filtering-Correlation-Id: cc374275-d5d2-4ca4-8cbb-08deb3f4939a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003|4143699003|11063799003;
X-Microsoft-Antispam-Message-Info: 0PZ8optrEXYaQyiwQQfQ4rQBQiBm13VHncSgnpuftBbPrJxI1PJ7emk3fk3Xlpeki4ftfvtivCut8c8C+DZYFIg8vWEG3PsJ7GLdDvFZfdiTK+FuUm+Io65AqwqrLIAHo70/7o7teHwR3MxfHkArEucL9gxDw0LpZ1mWdvBiL0cPVLgOvs0+Q/87l79No7OGvAhu9T/YzPakYQy/G2eOC63TyxibUje24fo5rTL9uoQeEsTYGZmgZmlIFk79P9HR0o+qObYTKaztHt2NyTo33tb3WUKYDClejrr4Jy4o01HtsJ4oevwMK5V2AJ3L2+AOUebvmaL/qbxy1NrO5+Y4ImJQmWNvkIcTCxn5omAzJlRbJW5Elu6gXcZh8vbKJu24gk5pdbVXBb5w5vU1R8MXy6tZx0pGlj4u6uc2k2UpN3bc6MchDRZaNiSoywuJVOL+dL5lt/YEHvXVlAGQL0LOc3EXrik5kF4F/KP7iXFpszDku31tx6SPAhrwiDFOnsfsj4c7L10FQhtn1CCHxkJz+Zuzd4uFWiw2jRU2Tg1kKSvddDUnxd7b3jmp3DI8ZAam7mn8Dhms7Md1se+VIXFrx3H4OOwcll3kZj7vt2U4ogKnOmkPIss729HQOTVReS1d91E8FwxjaA9zi8slqx9JKnkPLrjMw8buCVV/9v6CmsENQiLIEe2rkL0VNPdBjgav
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003)(4143699003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1h0bk9iUXlYa012YWpHWm9qNktnd0prRkNOUnR1bXBtc0QzVFlqT1JTVldG?=
 =?utf-8?B?SkxoMWtLRmFlYnoyem9yVTNLbUsvdUFDS2haUlRFU1ZOM3RlcnZqVzUvbnFp?=
 =?utf-8?B?ZEVNYWd6UFNtWVArdmdxUlhQMzArZFEzK2pJc2h3Sm5QRXVIdGR5TVViMzU4?=
 =?utf-8?B?MnVBTWdKNFVxVEZnMEh3UjlJVkxVZWJDS2hNckt5c1NXZmd6UUJXaWczNXhS?=
 =?utf-8?B?NXhVeUlTNXVIeU4xOTZJNzdEMVUzVkw1bXhWdEh0UTNWR1h6RDZZSDBXbUln?=
 =?utf-8?B?ZTJ2YTBSeUhWYTZVWXNvaDNGeXR2aWJEZ2JZaDlEdWtjUEpSYWpYMzlwVmpT?=
 =?utf-8?B?Ym1FWXdOdk1tTm1mZkxWaUdmWERXbDhoNVF0cWdxcG01eERrTklqNkRBbjZ2?=
 =?utf-8?B?dVoreDR2YkVXRmtQZ01ENi9MUVRrdUt3TzJKSWI5T0JoV05MbVVSMGxydEpt?=
 =?utf-8?B?YzZrWmx3Wktvb0EzcUk2Vk0yMUsxYVhlT05oZXpvZ0dEeTRiVFRVcFV5Q3JY?=
 =?utf-8?B?bUlLUzcyS05uS0x1M1BoTXVudjBRdEVTemJ3ODdUeXlIa1NzMklEOUIyOWJR?=
 =?utf-8?B?Y2JCNDNRYnM0RlQxOXQ0cTJiVm0wSUZ2RjlUNFcxSXpPcTVGT3Y0cVRhcGRQ?=
 =?utf-8?B?b1lEbW4rUEVEeUptM1pHTDZhZkdFK3B5cnlDK1NqNjdHNFdiM0gyUkxuN25H?=
 =?utf-8?B?VHlmUUhFTW9VbEpNOFVzYTdKR0orZnFaOFdRYW9DbWZqZUVJam1ib0hFeWtr?=
 =?utf-8?B?anIrWXphUWhOalR3OEJVRVFZMzVYUE9xTEN2bnZ6d3dxMFp5bGYvRDBTaXkw?=
 =?utf-8?B?WXlKK2JNbzBRRFFEYUJycFhZUlNibEgweVl3YmtHSnhyNXY5Q3dEV1FRbHA4?=
 =?utf-8?B?RW5NaFdaSWxzNjlQL0llOFZWYWRRb0tsOE5zVXUrRUtjU09abzg5cDFheHVT?=
 =?utf-8?B?eVo0bkpiY255eVFsL0xJYy9KUUQrZmJyZGhzam5XQ0RnWnpOL2RaNHA2YklZ?=
 =?utf-8?B?aFU5VFIwTTdxMUNXanNuTGlkMGFLZGw3Y3F3VjV1Y0lIQmV6UXNUV3dHdldE?=
 =?utf-8?B?bXU1UExsWkpCMVBnaWhzNi9IQ1IwTi9KQjNoOUFjek9jWEpEM3hGWHUxSlZF?=
 =?utf-8?B?TDNPbDFlSFNGNjBSOWRCTDhYcTlaVllCVFowS250dU5LSnE3eWVZOWpvNjhF?=
 =?utf-8?B?cHIrUmZLWVd5U1NrWUdNajRzL2ZmSGJxQy9WYm9NM1RMODVMN29lYllUNEF1?=
 =?utf-8?B?bHhTQUVZUTBKdkdVbEV4U2VBSEtab3FQM3FqdUxqVld5TjNiekdBMEV2SnR1?=
 =?utf-8?B?ZXJzWlN4LzVmaWpoWG5GTUl2Q1RJbEhmK0VpQTJvaEUyeHoyMzFYVmlnL0VX?=
 =?utf-8?B?dndnbUttUCtCcXZEdEd6Y0d6eDNUdW5tcEdpMld6ajhiNEdnU2d1ZXA2Vkkv?=
 =?utf-8?B?dkQ5ZWp0dlJiK2xtdzFWK2UvekdBN3J4ZndySXV0OE9Fanc1dWt4Nnp6Qyto?=
 =?utf-8?B?T0dBVWc3aHh6d2xOK0dBUUd2Ulg4Q0ZXTUxlWTFTa0dRa3ZyMU15TFkyMWpm?=
 =?utf-8?B?OE81Y3FsMVZsUnNNT29mbDE3Qm94RnRaelMyYWpUb3JzaVpBNEFWMU1mMDhP?=
 =?utf-8?B?N1hkY2pQTWIzbHp5dE1ha1FTSFZHa0RZeDhFMGRzZlYzYmN4K1lyV2lhWnpy?=
 =?utf-8?B?b2REbnpMMisyWElnbzU4K2pGSXhNMTJKVjhZTUVDNlgxSjRyb0RpemUxejFZ?=
 =?utf-8?B?cm4xOUw4R2k1TlRBUVBXOHV0dFNmanNZYXFrL3M1VjQ3S2NhQ1lEUG8yeUp6?=
 =?utf-8?B?UHRFSkwzbmxiUmx6dUFJQVRJZlZQQjNRMTRTS0FLVnJZYjFORHE5RzNvZnhw?=
 =?utf-8?B?OERvRFF3SmVjd01MaHZLM0VhL2luT0JGeWlGeDdkc0pTRnpSUWZuUXF6alEy?=
 =?utf-8?B?VVVWVkMwaGYxQlVJOFc0WVNQc2NydnBQdWZIQThUOW5ZUmM0ZnNUV3BOOXJn?=
 =?utf-8?B?VE9LSERJN0dsM1dNdHdRell3ZDM4WEhWMVdnMFgyQmQwMU5saE96cHFpbW1I?=
 =?utf-8?B?TW5uMkZJdlBFV0FiajAyb1l3cXI5enVQQStDdHZKVjc0VThVQXpPRjlMNGx0?=
 =?utf-8?B?RnNQK1l5ejVGd1RlVDFkY0ZvYkVUOC85STBTTy8rTmVjMkEwN2dZdTJVUDBO?=
 =?utf-8?B?aDliRGdaLzJJUExQSVBMNE5yRk1JNy9BdlBaemhndGZKNHVSeVNHVVhRTlhZ?=
 =?utf-8?B?RWpKVjdJSU9PZFNOTHk0NjNvT3hHcUhjQ2E0Z3RFd3pWM0YvTUxxVXduc05z?=
 =?utf-8?B?VnhtUHJzbjhORmVORkVqSzEwU0lzTUhlMVJid3h3MFU4MHFkUTdOQT09?=
X-Exchange-RoutingPolicyChecked: LQY+/ZkpIiyjt7Vv/onpxHNTflMMMh9QvbrMiKCwnJ4CPhCTQzDu92jRpLLOcvX5zF6x/9jtRHRSUdX25/6GyLSADS/vGauanUnrTxjbm0X+bqUPWj+i1gNyL4uUyYqLNDm0P5LmxWd6V4d/lQ91DZd4reTFXnS142W6nARsg5ByUQnuk6FVGa1kBv93gHju+pmSnAt/DwGXTrrHPBDZoHgeYdWz+lzKE76kYFwQaddWMZ6CDHlX0nKANQCTepxur71l2LmOwd/j3suh1v1vidxNpO+w5TlC0UT7JZc/wHxEFtAkPndBZhGjGmVJRu07o60Sv6X7oqcBdCU4YwIrkg==
X-MS-Exchange-CrossTenant-Network-Message-Id: cc374275-d5d2-4ca4-8cbb-08deb3f4939a
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2026 09:13:36.4435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: doTNpXEbA6jRWXqP02rSFdRGILMZazVViatyuXlbBBJMGzqGiHvl1AN2MNnyj6cdnnFEegmH0EWXOJFlL+uRDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8429
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

On 5/14/2026 6:00 PM, Michal Wajdeczko wrote:
> Introduce and use simple macro to calculate exact location of the
> status vector to avoid inline calculation. Fix type for the GuC
> source and status MEMIRQ addresses.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


Reviewed-by: Ilia Levi <ilia.levi@intel.com>


> ---
>  drivers/gpu/drm/xe/xe_memirq.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> index 118c2285e893..6d27102b8011 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -159,6 +159,9 @@ static const char *guc_name(struct xe_guc *guc)
>  /* IMR */
>  #define XE_MEMIRQ_ENABLE_OFFSET		0x440
>  
> +/* engine ISR vector offset */
> +#define XE_MEMIRQ_VECTOR_OFFSET(page, source)	(XE_MEMIRQ_STATUS_OFFSET(page) + (source) * SZ_16)
> +
>  static inline bool hw_reports_to_instance_zero(struct xe_memirq *memirq)
>  {
>  	/*
> @@ -346,13 +349,14 @@ int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc)
>  {
>  	bool is_media = xe_gt_is_media_type(guc_to_gt(guc));
>  	u32 offset = is_media ? ilog2(INTR_MGUC) : ilog2(INTR_GUC);
> -	u32 source, status;
> +	u64 source, status;
>  	int err;
>  
>  	memirq_assert(memirq, xe_device_uses_memirq(memirq_to_xe(memirq)));
>  
> -	source = __memirq_source_page(memirq, 0) + offset;
> -	status = __memirq_status_page(memirq, 0) + offset * SZ_16;
> +	/* GuC expects exact locations, it doesn't add anything on its own */
> +	source = xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_SOURCE_OFFSET(0) + offset;
> +	status = xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_VECTOR_OFFSET(0, offset);
>  
>  	err = xe_guc_self_cfg64(guc, GUC_KLV_SELF_CFG_MEMIRQ_SOURCE_ADDR_KEY,
>  				source);
> @@ -520,7 +524,8 @@ bool xe_memirq_guc_sw_int_0_irq_pending(struct xe_memirq *memirq, struct xe_guc
>  {
>  	struct xe_gt *gt = guc_to_gt(guc);
>  	u32 offset = xe_gt_is_media_type(gt) ? ilog2(INTR_MGUC) : ilog2(INTR_GUC);
> -	struct iosys_map map = IOSYS_MAP_INIT_OFFSET(&memirq->status, offset * SZ_16);
> +	struct iosys_map map = IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
> +						     XE_MEMIRQ_VECTOR_OFFSET(0, offset));
>  
>  	return memirq_received_noclear(memirq, &map, ilog2(GUC_INTR_SW_INT_0),
>  				       guc_name(guc));
> @@ -560,7 +565,8 @@ void xe_memirq_handler(struct xe_memirq *memirq)
>  	/* GuC and media GuC (if present) must be checked separately */
>  
>  	if (memirq_received(memirq, &memirq->source, ilog2(INTR_GUC), "SRC")) {
> -		map = IOSYS_MAP_INIT_OFFSET(&memirq->status, ilog2(INTR_GUC) * SZ_16);
> +		map = IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
> +					    XE_MEMIRQ_VECTOR_OFFSET(0, ilog2(INTR_GUC)));
>  		memirq_dispatch_guc(memirq, &map, &tile->primary_gt->uc.guc);
>  	}
>  
> @@ -568,7 +574,8 @@ void xe_memirq_handler(struct xe_memirq *memirq)
>  		return;
>  
>  	if (memirq_received(memirq, &memirq->source, ilog2(INTR_MGUC), "SRC")) {
> -		map = IOSYS_MAP_INIT_OFFSET(&memirq->status, ilog2(INTR_MGUC) * SZ_16);
> +		map = IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
> +					    XE_MEMIRQ_VECTOR_OFFSET(0, ilog2(INTR_MGUC)));
>  		memirq_dispatch_guc(memirq, &map, &tile->media_gt->uc.guc);
>  	}
>  }


