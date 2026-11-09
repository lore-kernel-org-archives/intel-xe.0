Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AD3606A31C
	for <intel-xe@archiver.kernel.org>; Mon,  9 Nov 2026 22:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B/xXXMvq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9B710E2AA;
	Mon,  9 Nov 2026 22:37:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 081D010E2AA
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Nov 2026 22:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794263817; x=1825799817;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=S8B18L1Fq+6i2WQ+Uz+mMcBrYHMA63ZDXPRVMZ+I5aM=;
 b=B/xXXMvqru12WVGpESG72DRAH+g7UwQITIgY7jryTZQnxbh1GE8uaJnU
 QBMNQFA/YL37jMLJs8DR1J1VaQeMdoS2cApF9cgbgY9LO8mzCQtVDYB0N
 QLahGyWY+3c+dmZHC9yGAPG+D3VgISidJp4dkGk4S04s4YYz9E/0Lb6Fv
 rBfRL1Ei0DlrfHQpDjr+CiV16h4V5KiJwKbi430tgqfqFa/f9oBYEHRkG
 qloC6B3TEXD3JfNTTvsJwZaTU9gf+MwHWkEqjnykvhWnt1FBGTmsBQWBf
 IsHFY7ov6alZ7bSRKJYrqQhWXrD1GDQckwBVIMsNtLzrL7EcG/MWa39rk g==;
X-CSE-ConnectionGUID: 7D1RyEbKR2a3Y1Xhl/820w==
X-CSE-MsgGUID: dN+LspMTTJuy6q9MFnAXXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3035300"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="3035300"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 14:36:56 -0800
X-CSE-ConnectionGUID: IaSIZTvCStyFIRwwCdwTrw==
X-CSE-MsgGUID: 7aLZCUw+SLeM/+pPP4n65w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8315226"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 14:36:56 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 14:36:55 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 9 Nov 2026 14:36:55 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.70) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 14:36:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KsN+b+zD6A62QuS+FF1iG0wNacsKdzNavxCj/gLJk1ywHKD8jY3vf6X0B7ucGTlxiyQapx96hDvn/fAV0gIL605BZOQbHaPd9QHR0Qrw/UeVQWLlsEqjcHEKPYitfw9gSiOKNHSjEbQoOm6Jsj6RF0VpPto6h/LpZ5qIU8fitUcLBtVrxXPmpveyYrrv5ovpS37u4JDmL4z01Ei+tFe06UPYXrGUAX1XnxBv/poQ7VM7PDR0id0r9KVu4/m7N1+7lLCtvJKqMFBFZ5Ws6g0MzhN7wHSPqXlJSAIvm9cmwdIxXwUQTHtlqRpPm8sO79H8MuGQeeppzfBocgrmaP2a3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wV0EMUixSvrzMt8w56MEQuDnkoJqYu6RJp/VzjiRTFg=;
 b=UlTby8mRiNp1+tV14y1nzPAvP8iiGTD4yxgpPjAH3YvmBa2jYCyMtT1vTdYyiBKM/EN29yryshay8ipEhLFB3y0vPcQZxXeLxmzNOmq+n7QAqruSoTljaMkGkwLjU2wA+vzJTQHTOniL+2wZlIJuYMsRkeLDN5/hX+yQI6Tpp4DSWTm0577eennjOtAw7WukCJa9bL1ucybCk6VJ2sgGDNif3IVIWIqsQiE2Z+CYoKJXHVizfViUxRHovNim46Dhzb24BHXJJdJKMRS9ealEL5A4clU/jlrq9UEJfOSEPBzCzX/ZUMgXGGsAUdNcvp7WfDafuTWXdDIZgBEOAU2ytQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LY0PR11MB036337.namprd11.prod.outlook.com (2603:10b6:404:22e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 22:36:53 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%6]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 22:36:53 +0000
Date: Mon, 9 Nov 2026 14:36:51 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe3p: Interpret resource copy fuse as mask of
 sub-copies
Message-ID: <20261109223651.GC6134@mdroper-desk1>
References: <20261109-xe3p-res-copy-fuse-subcopy-v1-1-b00100deb1ff@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261109-xe3p-res-copy-fuse-subcopy-v1-1-b00100deb1ff@intel.com>
X-ClientProxiedBy: SJ0PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::13) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LY0PR11MB036337:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ab2dcab-c5fc-487c-cecf-08df3eb1f425
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|11063799006|56012099006|261021123027099003|261021121427099003|261022113327099003|261009223027099003|261102123227099003|261026121527099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 0Bl8588TGX5Tk0HcGgaAdogmVSN1YEOJUqzwatcjpKsLc+gFL0c8QAIP7yRH6PQWiYorkVqH/53Lz5ciykDAnuN3ojE4HK/vula6/KlBFNt8pgBpqaZZkhl3LnRbBm248n6JXnAK0MWm0Rk7gPbGPGnP36dxAV6Kct/K8cFx8tx+uyG6ASnx53X7NZaaGJgK7RO0tWAVfzZcMclO9IFZpGTFY7+MzaXiIz5m70e7KFJioHulHRTawDoarvmqay3e1lparwzxGyTOk8k4hp+6q1usKHVyR+5Pchy8RHcXhaUP2HAFDD7fnPAwNMI+/SkHF3NVmAFAjVgEKC0YCdxeLu/r3WBTC+mbpxXGyIP2QeBd38NIC8heNnjSo8608WHkOib19+qgAb1UirjSLpVqPS8eD6JccetxZV8m0RIqQo43owIuJvLkcdzpoEH7VBKnIc6yOhsKzPmsz53vnrjLwMWOxJLxDx/qbN/1TC8rLgDT55ORdsfouUOuGzrkoblcI5j1z/sfUeGrokHPtX5Tfs2Vlw3oPpNNtyyJXde0iIfTVT7g8XrQZ2WbO9aSas2gmef/IUo8i3z0qtZhhx4pg9H5FG8Az/AwyeG+b2N06GKNNF5riLGVIHy/qElXBgSFNL8nE3lpSsC3CYkP4J+1MAbMAfOaDhUwyhT6pG72YLE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022113327099003)(261009223027099003)(261102123227099003)(261026121527099003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CdUSDsI6GidPRyz303dOMjihjRIMsu4K6gqpny8LpH6r7WYwJSjCHJeDxtrE?=
 =?us-ascii?Q?fRux084yaNLooarI60veqt/TJm8CqWx+7rKW0SEkKgvYqfkuvPG6bcWlxlHa?=
 =?us-ascii?Q?R9VBB3PTHLGvor+K68SQMCAiLbGu1ENvgivL/IouY68XGRvCp9Qm3v00tYa6?=
 =?us-ascii?Q?tfex4DLsuwzyRsWe4BnYvqH4ZVo1Spdjm0w12XW8TsUKm+fM2DpiYNXMFSgh?=
 =?us-ascii?Q?IJ2pLvUwxvmpSHefIU4/izgKJ+N1S/Iu6skGSEfH0/7If+S6uOG8nKNBWwlu?=
 =?us-ascii?Q?+P4nthT/JpMLvV0jW72JlUnrFm58zil8+6YAcuPaCuafKKIU6yY44TqYEbl2?=
 =?us-ascii?Q?O2REt207W9AOz1RMXIUgbT9u9HWv2vCBvTZa+nENtCk0tl/r654lcyiRgULR?=
 =?us-ascii?Q?neAQ2tyIDv379urkQ9ltqrq7RZOlNvcHc9X34I7boHpd1VeskdP7NaRqzfiZ?=
 =?us-ascii?Q?FYlM+X/vUJkzOnhudP7fc+sy+A0Br4ZT2v6jCvDzSCsFyolXXeRiFl2mY1c+?=
 =?us-ascii?Q?LNdWRlWRYEcZSOC2bHom5EAp3nsMP14Z5dGG39Q/IOqa9tz176oxRVOaMYq1?=
 =?us-ascii?Q?y5JtYCQtRbUpvhjYGS8oplNboPDaaIJsUkiwIIPhj87LZy0WhA4bxZb69hpC?=
 =?us-ascii?Q?fVIcRcUr+Dz29gI7JOD/7Xe7moxGWLoHWeKyi/YkB4F/so1TNHIjWZqBcvJ0?=
 =?us-ascii?Q?CwFHi0+9MftctF052IQSNuJGiAlcJ07Q244/xQkT3VKkG2bbAgLjyYn7gzGI?=
 =?us-ascii?Q?9xBrWGb4HCTE88OTW8oI/QYahipfpdzhWP4SWwqLa4PthnjLFxalliETEm+E?=
 =?us-ascii?Q?U7rOH0O+lDoUrhBozOhGyjWOsiIBw1LTgX1fNPHLTV8loxJYuO4EEfkxtt5e?=
 =?us-ascii?Q?320HJFMKwmpcwmJWRpVv4yXCm34JgdQAr6cRAW3TQuboRuoSU4JR0XtFFQXp?=
 =?us-ascii?Q?KER3HQKbbhAzAhw52AIVQRnoa6ObaKobV2Ds5kFVtobyMN9ezddUNRa6U4iQ?=
 =?us-ascii?Q?HaaMp2EKFIQ7dlm9Q39KBX2E4uyahQGvKwHfrj8FxvJSLN3KOPB0IwUGjK7m?=
 =?us-ascii?Q?fimXOtumayW804giiB7gfHamDk2UB3Ht1SojDk92r3KvjNpP8wX0b1LTzBTt?=
 =?us-ascii?Q?yPRqR7enCzwZSdsZQWIo0tU010mumu+0MuFK38ZDHsaU7yoYS2R058JfE1wv?=
 =?us-ascii?Q?N+pmnJxeuoL7pWF+TgIF0/S/STzmhM5mRYt8i4K+p/4X2wSe/bWtL3leG7aV?=
 =?us-ascii?Q?cN2PvgsXwwBwMfTjI6qrdCB13pzP7LOsVXKxuF5niWMl0d0Y1kCNUbDjpnb0?=
 =?us-ascii?Q?1WrkNjqhUWNbHogKBqHG3e4LvyKNT9+1+mXFgM3+lpiFT1cqbayhK2Xz9G0A?=
 =?us-ascii?Q?G5LM/hb+ouKvoKdZW8cARJLrr+V9yZBXKDNUBJXnJ9MYqyqGoE/nyghBk1Q6?=
 =?us-ascii?Q?uiuhIdjSIWfwA5JNmWrg9WSQICiP6GNOuIDhxi1uajl4U4I/0bGeG9IvCKOk?=
 =?us-ascii?Q?93hoFBfi1wOj7x5B2Dx1Ra54ZdgO/yisG2GFY2iZP3SDfZr+NsWnwPq8OYPF?=
 =?us-ascii?Q?tleNkE7avDdcRJTYVs7UBHO6M80YzQb2zd69rWD1oQvy6EEw7HUfY1Rit6Nl?=
 =?us-ascii?Q?cX7Rl6Ye8Cj0Eycu9S1qiCIO1YrivkNsUVydMlrpFhCzA65faClNqya4uTUO?=
 =?us-ascii?Q?Ek7Qx21wDohIUaK46A9ML62B9jNto0ydVEeVbXUPbaG2xyP5Wmm3JzPNmFjD?=
 =?us-ascii?Q?53Esj2+oZ5cLbroLUm+FVniZWlodm1Q=3D?=
X-Exchange-RoutingPolicyChecked: zDaNt0QkH8b+osPY/dw/TtYSZXaCoUz23F1+U8R1pFhOem46mK0A/8VIfEfH3EDvX/R4DUW+7pQ7v4mqOa1RjXdXD1Bs/6xJEX8i5PqUG5x5GfnE4QIgmQ9RbhpzhnOPgaehrxfu/HnhJ8ltPfE+NH2asS10U7PcdEzlrCF818NjdCi0Wgo7E9erqbahkvEDOkFbmPuh8Yt9SEfkqLhxPvXnrCpIecm5MR+UtXiI1dEDLOateh0nAyiI5KROJ6mV1VYmzp5VKsWg4s5oGlL8GcfDUrUuDjiYoA9E+UlskA32r6VcvxwcWPB6IFjEiz7aEF9M0r084tMfCfkc0fLcCw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab2dcab-c5fc-487c-cecf-08df3eb1f425
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 22:36:53.7657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +/iBzzoYgkr3NoEshNOLlFyVE3sR1RWE9iyTfLWk+/tssvvVCZu9uZk/42dZOpAZfv/OSbNPcqOJG9+hQ3Rdc5cC9/5nSYmTyOSsa2at9qY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR11MB036337
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 09, 2026 at 06:44:04PM -0300, Gustavo Sousa wrote:
> There was a Bspec update to the RESOURCE_COPY_ENABLE register noting
> that the fuse value is a bitmask of sub-copies.  Reflect that update
> in our driver by updating read_rescopy_fuses() treat any non-zero
> value as an indication that the resource copy is present.
> 
> Bspec: 74623
> Fixes: dd7707871f1e ("drm/xe/xe3p: Read resource copy presence from fuse register")
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 55ee0c892c1e..e2caa7d88eb4 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -892,12 +892,12 @@ static u32 read_rescopy_fuses(struct xe_gt *gt)
>  				 xe_mmio_read32(&gt->mmio, RESOURCE_COPY_ENABLE));
>  
>  	/*
> -	 * Although the register field is 16-bits wide, we don't expect to ever
> -	 * see more than one resource copy engine (BCS0 in bit 0) enabled.
> +	 * There is only one resource copy and each bit in the mask
> +	 * represents a sub-copy.  We detect the presence of the
> +	 * resource copy engine by checking that at least one sub-copy
> +	 * is present.
>  	 */
> -	xe_gt_WARN(gt, fuse & GENMASK(15, 1), "Unexpected resource copy fuse (%#x)\n", fuse);
> -
> -	return fuse & BIT(0);
> +	return fuse ? 0x1 : 0x0;
>  }
>  
>  static void read_copy_fuses(struct xe_gt *gt)
> 
> ---
> base-commit: d72707a042b6aff601449a9cf87e5fe55decbc5c
> change-id: 20261109-xe3p-res-copy-fuse-subcopy-89e6351e3a3a
> 
> Best regards,
> --  
> Gustavo Sousa <gustavo.sousa@intel.com>
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
