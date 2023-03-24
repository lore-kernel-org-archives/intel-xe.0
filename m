Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CCBBC6FD1C
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 15:42:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BEA010E511;
	Fri, 24 Mar 2023 15:42:44 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6097210E511
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 15:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679672563; x=1711208563;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=jN1ZJxIJ16ueWmQeuwR12LiQ3CbNEJdax6WNIWMWa4Y=;
 b=n+xkxeltaGuJIxc5FRpJIndr7VdytFVjItDtMjD0kwZWngA6XdBtusyL
 t79GIw/ICveaKdpZB0T5MNdokv4iahs9G/3WCWwbXAfVPjjnLTAtuEZjd
 cqAI9y9Mcp3jWKa/EgPrbRUWiFDoAVjvRV7HhZHDAch8X1xiXsLnsj21Q
 p5IPpbM5NWX1ZOcOyDHKrMqdY/NEcVfS+auiLHYQ5OfDsAmedak8PTxW7
 stFiE7y+Gci0v5n8L9WR05oehynLPFDxzce7juIjY5dJBVYHPblghpdNo
 q2+2z2lFpwfmPzn88MHCcmpcIl/yaoRQAFvai01L6r0aEyHySegkwcPnD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="342195981"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="342195981"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 08:42:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="685220648"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="685220648"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 24 Mar 2023 08:42:42 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 08:42:41 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 08:42:41 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 24 Mar 2023 08:42:41 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 24 Mar 2023 08:42:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z5NPBca1I63Nq56riU1FV3f+IlGEfleBECGuS/3ILpNAd8nGaupbdh88CUyrcDYgszCS+bB0U2Bab8Cngayp1UFhg9vOUaTCe0Fis40xqWX0GixwPUgWIIwkQzmPgUTpw0Tii5zAgTyc6VtaWgyiqRuYq4adZoAW08lXBTqSo1vTkZJZUcK6KaOV+cn+tjFLspSfZGuEhczaPyKNBVdj08MZZsGrvocka05S+v6W81jN+Sp5qoRyNLOr6aduvf1F+79AmK3xwZE8mVTWWrbJfz3ysSf+2mNLGq55ZBMqRF5t+KA3efA3aW8ZuqwF4560sH1QqPSprRoozvcYifeldQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gla/LqOkSo2cXTr+t2OaBkwv9lD1HOKN87cPotIrads=;
 b=Gw2ri8HQQJuBFoHP+58ksdwb1fa3qMAJtdEAmJhvQydvVvpq6+jtDlBtwmrOucChAZurz4vtnLipHOF8x9x/hRB6kP/Cp7+w6JPcwBmUfhSo5r66bQwZQY5LbT9Gzdy54G9cnJf9VHP9H3bT26xXfpwnVdFvirjrAx1cbKDBfPsOXD1KdqclfO1TgtALF7CD6Z0ZvqjO07X8YFp4qluyKzq+Mx0PmsHd3fxnnXnYEP5BdCVYfWnmSru6XfxiboyyCOIOL5wFp0hMPrq9fS6InudQNp57R69QFKcceX1KPXnBNr5ltBhoefUi2rffWaBF78qfdARgU6VY223yNvpBcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7539.namprd11.prod.outlook.com (2603:10b6:806:343::6)
 by DM4PR11MB5374.namprd11.prod.outlook.com (2603:10b6:5:395::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.39; Fri, 24 Mar
 2023 15:42:39 +0000
Received: from SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::d94d:4bb6:a568:a2bc]) by SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::d94d:4bb6:a568:a2bc%4]) with mapi id 15.20.6178.037; Fri, 24 Mar 2023
 15:42:39 +0000
Message-ID: <3139b620-90da-b86c-021f-b63378296e1a@intel.com>
Date: Fri, 24 Mar 2023 17:40:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230323115926.391900-1-matthew.auld@intel.com>
 <20230323115926.391900-2-matthew.auld@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20230323115926.391900-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0024.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::11) To SN7PR11MB7539.namprd11.prod.outlook.com
 (2603:10b6:806:343::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7539:EE_|DM4PR11MB5374:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ef3cf17-d3b1-471d-b80d-08db2c7e6583
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: arFdWLw9XMIbR9/VgzQ3f3QF1GULXPOaErLegK60QSNn+DGFY1cfRjVU79vRStDVQXxKcFDz1g8vezQWw3AyBUftD82zzI41+vylXkhdoxUB1s3Wcd/hHxQiJNdJrO5dLrnnUa8mI0sD2GEI80O8ynngd5RPdY8vkq5axXuVndj9J7Psn7DLyvtOIUyE0MB02N1oGe1l8PkQiNnsw52OnTwCC46UKRYinUQ1XFqqkmsqT4IQpKIHM4lvUZSH3OcnEYlaxaejDsA99QKdWk6naGFf72mYV7XgKjfROAQAUWtkYRL0P9oR/CtiUVEWTiW9P8C1UcajRyvMTJS5HdPEraJVT4sQwWVmlpbtzeNRLxEK3H6l0Hl5XzgKlBrSdAMMN8yrEkZb96U5FE6TDZww5mFpYAKrU/1qBngozaOrBvj3P9Bg+9k7vo8B6UB/pjw3ntxewRWL8Jzr5NB2Vfif6fRot1FGYz5gofSz8y8x9Iw4Gh4+VYU/4MpywzBQyS/+hZxg5j9yWDs2+lT5Y+TCZBsqhHU31OzuN19rid38o188YW25XXbnhwnq1h8POpZ5A76XZZqUKlu8ddGh84Jyg3pPrnom9C8qRRFCRhFmdvCBXiWUdxxDrZjtUekPn3db1/2VIZaEb3+uB1K1swYdow==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7539.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(39860400002)(136003)(376002)(346002)(366004)(451199018)(31686004)(38100700002)(66946007)(41300700001)(8676002)(66556008)(8936002)(66476007)(36756003)(6512007)(6506007)(53546011)(86362001)(31696002)(83380400001)(2616005)(186003)(26005)(6666004)(82960400001)(478600001)(6486002)(316002)(2906002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGV6ODhiZDhoYjF0VGlqbzlxcm1ydkhGYkFaUzNFamdsdGsyN0d4c0RQdzEx?=
 =?utf-8?B?MG9pcFB3WmNVb1ExVWpiZHZvUzRDemFRZ3ZrZ2FYeDJtY016NWdNanFrRXcr?=
 =?utf-8?B?NGVvcnhvWVFRYWNUcHd6bjNyOHZSK3BFSjZhbXh3TE9iWWd1VUdrTE1iZVFa?=
 =?utf-8?B?dU9Ha1VUa3FFNkRPNmlHZm5nMVUzMERiQStXNkNPbU1aYW1oODlTN1dRSDVG?=
 =?utf-8?B?SDNVTUx4bThjYzE5VVh5K3VKbFE3cWZYNk5FdFQ5RnJnT3A2bHlwYy9FdVlr?=
 =?utf-8?B?K2o0Yk13QkhEREpqSlQrU1dPOUdHdmptdS9jcEpLK1JUeWF3bkVxY2VnTVBY?=
 =?utf-8?B?eDh2VjA4QTNMTm9oSVBWNzV1SkVrNmlVczNZVi9QRDhqbHVoc2gzRC90L2ZW?=
 =?utf-8?B?cXByemxWVUhhZ0NtU3VLbzI5OHJpQ1pYeDkyYzNMQ2JPTzZ4Yk9IL0FYQ2lP?=
 =?utf-8?B?Y1Qxb21RRlptcU9RWTl2QkJ5d1phNzJLN3ZOdUZrbWxBMFlwVlRaVjhQQ0dT?=
 =?utf-8?B?SlpHd01acjF0WEVaWEFqK2I3Y3lsZGpMUEU3TnNNMlRUQXBrTTJuUkZJVlVx?=
 =?utf-8?B?UEd3ZU1kYm4yWHludVp1TW41ZjBpVmFmSmVBdDFsaFhSVElReUJhWDJiTm14?=
 =?utf-8?B?R3B3ajFkUkRhQUtCb3kwV2IxUE53SEhqd0h3YmdXK3dRSzZmN0FuVy8raW9K?=
 =?utf-8?B?eC9sRG5kOVNIU3poSU1MUXE3Ylk1dlVMZjdvSlBKRytLVkdwblZHeDhLZGl6?=
 =?utf-8?B?UlBQS1ptWVprelJsWUhuNDFMVWJTVDFxbjIzS0ZlM0tiR2hIVUdrQjB2TVl5?=
 =?utf-8?B?dUpqOFJrQ2FRaEhEb1lucFc0U3BxS0s2dzAva0ZGSGFrNktpMVlTT2xzb1ZQ?=
 =?utf-8?B?VXhROGZlRVMrbWJ6cFFzcnNEdi92bytWMnZlTkFlSnl1czdKWURUQWEyd3dj?=
 =?utf-8?B?THVLUTNBNDRqb1VmYXh1SG04Zy8zMjc3SC94R1hQcEtOdXFyUU54YTdNWmRt?=
 =?utf-8?B?NnpqbzhHYUFRRjJCWFp6QTdHdmlZRVZEM0FCaUFHZkNBZTNSdTAxNGV4WG9m?=
 =?utf-8?B?cXgwTTJaQzRJQ2VvbFpKdi91dnZKdVBsNDNSRHZqTk5DbXMwTE1RanlCWVl1?=
 =?utf-8?B?ZE5JTXBpdDRySGx5cGJRb1FXTXFydUU2UEQ3RWRGVGU4ZUVxUEszWFlGWWY3?=
 =?utf-8?B?bnNFbUpKYVFERkYyMEs0Qm5ETENqVWRHeWVobU9wbFMrOHlDaGoxVjRIOFZr?=
 =?utf-8?B?SmJNOXhSNnhTNmtRMllPakNzbmN4bjlHZmV5MkhXVVhtS0tMVFdlaGVjUDQx?=
 =?utf-8?B?VGNjRy9vTHVmdFpYOXc2RTZVV2dRY2hlMSt3VDlLdzBHMnFZdUh2bXl0aUl6?=
 =?utf-8?B?TFc0eEpIdDhwSnR1dzVaNUNleG1xUlBrMjFRT0Ezbkt1cGhERzRqSHNkeFQw?=
 =?utf-8?B?bDdaY0J0SGlaSjl1bXc3L0xFdEFXangyay9mNDRPZ2xYeThDSGhYMzJmOVM4?=
 =?utf-8?B?cHo0aTl3RVF0aFNXdGNPUW1DVmc2SWJ5bEd4cDJwZjV6TmtidVVTTnNPOUFi?=
 =?utf-8?B?VDFUWmNaRkpUM1MrNUQyT0daeUlxTUlGUkVvK3pLekhYbWw3QWZXNmNDRGdo?=
 =?utf-8?B?M0p0R21BYmd4R0NWb0p6cS85VWxieC9zMkdnclZxZkpGeU5QT203VHBiWS8z?=
 =?utf-8?B?bjFieC9lN1BaYmhnUTMyWHdVa2ovajh1dTNHM0FRVjc3M2NHUFNVSTJYMzRt?=
 =?utf-8?B?djl5QWsySFdaRVJnYlJYN3B1MTk5UmVmNFdhenY1N3luV1VGZGFYUENaZ09D?=
 =?utf-8?B?VTB5MWdTOHJzVlN3RUI1bDdYK3MwQlBOaXY2cGVJc1VMSEZaUmNGOUlnRERt?=
 =?utf-8?B?Z0hWZlYyenhNVVNIUkR5cXNOZ1kxNHlDTHV5dW9mSy9ZRFRqRE9PN0ZPQUp6?=
 =?utf-8?B?WVY0R2ZuNndkNUZaQkNwVFZLV1lDenNiWmRSRmkyZVFKTFVxNUhVQ01zU1Er?=
 =?utf-8?B?T043Z1NSTVlHUmF5NnZuYjZDeUxKRDF0Z2Ird2xlU094NGcyV3htS3ptTTcx?=
 =?utf-8?B?UzgreUVxTUE2UFVSdmpzdy9YZkRXL1hvbzRGeU92NDhXazRXRkJiTURvazZt?=
 =?utf-8?B?NjNMeUViUG1XM1hzS1JMNVV5amxTb25xN1BSTTdWOGVzUldXeWwwSTdvY0pj?=
 =?utf-8?B?YkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ef3cf17-d3b1-471d-b80d-08db2c7e6583
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7539.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 15:42:38.8063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JSNQDsol3ZYZpdhyItUtnBPMz6adh0EqcdnQifFsZIUIvZE/9hVZ6FLzPQKurgvg7YMCZkK42piwG8qZGgtUV9GLDPjDXE5XiN6ljHHdbpU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5374
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/6] drm/xe: add XE_BO_CREATE_VRAM_MASK
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

Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

On 3/23/23 1:59 PM, Matthew Auld wrote:
> So we don't have to keep repeating VRAM0 | VRAM1. Also if there are ever
> more instances, then we have less places to update.
> 
> Suggested-by: José Roberto de Souza <jose.souza@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c | 8 +++-----
>   drivers/gpu/drm/xe/xe_bo.h | 2 ++
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index ab9cd9286f77..af4200aa949f 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -987,8 +987,7 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>   	}
>   
>   	bo->requested_size = size;
> -	if (flags & (XE_BO_CREATE_VRAM0_BIT | XE_BO_CREATE_VRAM1_BIT |
> -		     XE_BO_CREATE_STOLEN_BIT) &&
> +	if (flags & (XE_BO_CREATE_VRAM_MASK | XE_BO_CREATE_STOLEN_BIT) &&
>   	    !(flags & XE_BO_CREATE_IGNORE_MIN_PAGE_SIZE_BIT) &&
>   	    xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) {
>   		size = ALIGN(size, SZ_64K);
> @@ -1052,8 +1051,7 @@ static int __xe_bo_fixed_placement(struct xe_device *xe,
>   	place->fpfn = start >> PAGE_SHIFT;
>   	place->lpfn = end >> PAGE_SHIFT;
>   
> -	switch (flags & (XE_BO_CREATE_STOLEN_BIT |
> -		XE_BO_CREATE_VRAM0_BIT |XE_BO_CREATE_VRAM1_BIT)) {
> +	switch (flags & (XE_BO_CREATE_STOLEN_BIT | XE_BO_CREATE_VRAM_MASK)) {
>   	case XE_BO_CREATE_VRAM0_BIT:
>   		place->mem_type = XE_PL_VRAM0;
>   		break;
> @@ -1759,7 +1757,7 @@ bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
>   {
>   	return bo->ttm.type == ttm_bo_type_device &&
>   		!(bo->flags & XE_BO_CREATE_SYSTEM_BIT) &&
> -		(bo->flags & (XE_BO_CREATE_VRAM0_BIT | XE_BO_CREATE_VRAM1_BIT));
> +		(bo->flags & XE_BO_CREATE_VRAM_MASK);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index f841e74cd417..3c3a09f47fb4 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -17,6 +17,8 @@
>   #define XE_BO_CREATE_SYSTEM_BIT		BIT(1)
>   #define XE_BO_CREATE_VRAM0_BIT		BIT(2)
>   #define XE_BO_CREATE_VRAM1_BIT		BIT(3)
> +#define XE_BO_CREATE_VRAM_MASK		(XE_BO_CREATE_VRAM0_BIT | \
> +					 XE_BO_CREATE_VRAM1_BIT)
>   /* -- */
>   #define XE_BO_CREATE_STOLEN_BIT		BIT(4)
>   #define XE_BO_CREATE_VRAM_IF_DGFX(gt) \
