Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F18C5DF7D
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 17:03:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CBA10E081;
	Tue, 18 Aug 2026 17:03:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LoKB1Okg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F19410E081
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 17:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787072591; x=1818608591;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ISN/dtprNm7JaSLmM7TlRLQYcmfSxiiKCv/CdUWnv8k=;
 b=LoKB1OkghgwKgd6oq6UduJ6rHZNyP+0PutQAsFGyP/m1PgArKXzj8xPe
 hk5D/u6EfKBXs039HiY+QQlUd5SWdbvv7CgHEc9cxhE+TGk/LUJN9x+/p
 mIXAlRX6EPq37UgLStVFWBhWkVMacdf2bbulY3UM3EGatxp25+RxI+djx
 yo7z0/PNLUJjhN7RmmRknvR4q3A88Kf1/QMm8RTYpGMOrsMENR7ecC2BP
 ucCdaB6lcP0RmS6aWRYR2BEcr+JZ1VAp4P2TXbs9xwQ5JA3gjZaUT88TZ
 3FxZ1mCnVnD/dhvwoZL92DEYa0OGSfSLuOU48E3vo274zAgJZT4zS1mRd g==;
X-CSE-ConnectionGUID: lxDd+ohwTJO32jG3r8/ykA==
X-CSE-MsgGUID: 6MJDrDlFQFmNT7UKV4JiZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87589792"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="87589792"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 10:03:08 -0700
X-CSE-ConnectionGUID: RDJZcVI7Ql2/GrVb/b75hg==
X-CSE-MsgGUID: dz59lRvFR56Vb2tGoHIcEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="264841435"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 10:03:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 10:03:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 10:03:07 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.33) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 10:03:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g5hfeeMw9FGDMXSQbfAKNK1KBJv3eveMZPyfzNtBC7CSGdm2tJNPSMx1ZwSg5lIyhacUCfUi453FF9JE8v8IyMBgpfoN+ZNyaQMKoM2a77TsaxvnYIUdWAfm2qSADXXGDwLl5fCTm4GlCCNCW52nKzSACebRsBZkqShLE3zMyuT5cmaLIdsHKIRNkQxFCRkTk7do2CiXyrDJ5dDt7RjQ7V1djeTLq/AgF2JGsxsGf8XSVqVfoqx/M9LUofPThyxi5dDZ2f+14gUsFy/2d3w4bzy0KQNADbmxhydoytndMPP2mRipxf2teVDQ1h0jd9jqMDzkeNyc5CN2hUENPJ33dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h7sqQYKlWHn6TvomRAVasrmcygH4jr6X2bgwnqU09sI=;
 b=a9UHPxSGrpmRbJ6lPrKUM1bwUsUhijMXnP7pcLq0Ga5eXZHPjKOABN9wR3NqvxZYNYesnL60T3jOv9lLxK8FWkYQ5oB7qqaNH2I1InZFCX0EjuzM94QEIZbMqzT2M7Uwe28le36oPaC0RfvKEPfmZVC9kHY+huZJUvvXuM5OTis5fHw3zwxmtjZNDvNpPalgmtlDTE74HRfbLTb7EE8efX6f4EtniainZ459Uu4ecE9lFzXj3lAkwwzKnlLpEXSDGGg43px9rdoutH54pAURoyY0sBP83wOSO3oRSMzhn2i/j4dSZfOcrILea5hSp17AjSAOSMcbl1t80LVZ3CzPkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB6725.namprd11.prod.outlook.com (2603:10b6:806:267::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 18 Aug
 2026 17:03:01 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 17:03:01 +0000
Date: Tue, 18 Aug 2026 10:02:58 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <sk.anirban@intel.com>
Subject: Re: [PATCH] drm/xe/xe3p_hpm: Remove WA 14025883347
Message-ID: <20260818170258.GK8279@mdroper-desk1.amr.corp.intel.com>
References: <20260818095748.1512800-2-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260818095748.1512800-2-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: SJ0PR05CA0125.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::10) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB6725:EE_
X-MS-Office365-Filtering-Correlation-Id: 40a980b3-e655-42f5-5756-08defd4a8f63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ezVCDqelXZEIsQMYdDnp1SjDP2uF8CA98PB1LJhlrysg0t8mmKp/CDEL5FYvJgi+rgpRbsCClwVksphkmmBrgP3JLhdS9huNwVOXkX9YdZ2e+OJBKIPV6yYffSI7F9TJxN1NXqlf8ZX6WDSaJdKQ/+tt1hTmCtZEre98L9CwiZnpEWplT5TRf8MhtyxgmtFGMD/SGMBrxJSQoES/uABCEf+Hcg4FkyReLSi0TQxKbxAdeKOXz/VS6GhYVYoXzahKkQVIQlbelUkBT1QnLzHhy1YQSb247EgH4XJpzv1h3Km7WNLuD+Zt8LL87Ve7bIZ++zZh161jLCfP5yGOAwJK93I2ECN5cyPmtkPMHn/U6Qxrmi9PCAwzp70n1m+nekPDO0vnT3xljmLJHVZuu8ZVfxmGUNVNzTUmgooCrQrraUdzw0n5CeG6jzy7NZwXkJOdlgYCwG3ZYcvOYABWDaZ/TAssVituOMaNdxC09yxyl+2VQUuolWQIc2UhrmigTckWqYB/Tkdak42yo+EQaB63Q7lpQPxIaYabs24ZsQIwMXQ45WDv7Set3iwNm1axfhuDt6104PO0ppqXDcjf3JBfUgcx4ZKvhppkPkEiD+exvy0SAOPA0UeLhKrxnaFw4M3OqKnaCojCl4CW9PPvYXWbF+lCWCW9PrH5V+qMB3HWkMI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6Ba+uXq7u8Zxz4Kmr9Yg0IGoYilnuzy1PsH/ElQs9jVs3hPawV8ELIlmnDzW?=
 =?us-ascii?Q?297kNHDUcNvB+IKKFk6WyOrUU16gtQ92HddynUg24OAnHNL3z3WxV67pOYG/?=
 =?us-ascii?Q?Q7OVfBZQ066QauKBiQojFvadoFcsGrrsRZrOWQ7a1ZpSxkb1G2thcchg0ttO?=
 =?us-ascii?Q?GTAo5xl9iOXeM6EjxNx8MPVPw61ZFj7YKIHyZ/zB2/mjiDDYWz6UYHP4rWLa?=
 =?us-ascii?Q?BTY/TOpEqNw5u3rWeeLNah4KO1eXeRynCyxXFeso0HwtHqBsSRSMmcEMpRwE?=
 =?us-ascii?Q?p24n07QSoKbbh/paV6pR1bZPx9vc8Jy5X1bVo6eTUBpLeMKDJ0CX+CYJxmov?=
 =?us-ascii?Q?AnnNYGhOUADCaxj81oIDWh4Z8j7Rzb3p9JIVUvKotJw2fMR7VR6wWZEBPNFx?=
 =?us-ascii?Q?55FGIZ7y1XaRgcW8XaY+agtWe01bncJgVsZ9Abw02Xkm0AgXb0bjGatPPeBi?=
 =?us-ascii?Q?kUcxjL/HALPr7VMjjGYSy7K1V8kin2YTV6K9gfHa0/XKOWTArr2WaVwy4rVp?=
 =?us-ascii?Q?JrxU88FFJ5sGn0vMbMKZY7IR+hhjN5Jv5cuoOp1nG6BKJim4r4sxmWOa18x8?=
 =?us-ascii?Q?wlF0gwuFutshLngJ+JKTn7Ners1k8EQQn7gQVZ/IE5JY7VfGdodXHdcCIXVX?=
 =?us-ascii?Q?GxLipCDBMLR6v39sY7PlMbzoMOh54U/FYiDjMIYWlhjePfLnT4Kk5RFBs4ZR?=
 =?us-ascii?Q?gxnX3yFTFHALpl71xPySqXBwJ33thUMnQ439kxBf1ULHlkrEvS24EzNf4gtt?=
 =?us-ascii?Q?aXoMlwvgq19GVMYXCRLKsFk9GPUK63XS/aXPIVS77t3jHZ+sb8MAeAZZbAWy?=
 =?us-ascii?Q?iN65cod3lq1pYbUjLpx3XeSsZXF0LqFy+fk5mkhrXwzmyEGbizcyUkmYsERJ?=
 =?us-ascii?Q?uk2ncJ8KNLsO8/Fl9RGglcY6lMBP94UDvvMF01osKzSgXYfn4yqJw60RNbsE?=
 =?us-ascii?Q?1UCzxhr2kc3gKV11gKEp56v+gE5vEA1q3nCjqneubY52FfCrten5j78jNM1b?=
 =?us-ascii?Q?au7p8A62WQJarCMIvemVZPMNgBbc22F8BzZjq8dlnGVLeIFD0bIcBhiSH0n6?=
 =?us-ascii?Q?NkmAwe43lXYyZ+B5QS2EaYh2qmRTQPaWmSQJplb3ZqGFQ3KdXt7tTFTCUg2z?=
 =?us-ascii?Q?lPl5c80BTpDyqhQZ35DBfdg0m9bvu6PhXle2+TvbSAwMqLeR7Nd6v2G6rTeF?=
 =?us-ascii?Q?Wuw22+V7Kq1zZrd+GHJNLzBDTDT+qN81vz+IOLuwChd+gdZJZvCmkGxaJK5m?=
 =?us-ascii?Q?MzrggkyIFOjQUTs5s0eJE6965PSI0CjRvIcSTYXBz/2oQBl6L1XF54njYqaH?=
 =?us-ascii?Q?snF83yoVMZLw06xl6vY3Pqe4KahZ1e+euR0XJLL1yhLRR+QZ3SeWTMN0dtQ6?=
 =?us-ascii?Q?nZTkVQe1ShtwtwqNC6RtO/q2T6b2JEsvllE2T7iyAPP048OLj3d5U6mnZB0a?=
 =?us-ascii?Q?kIv19hOp09mUr6TnWH1X2760va0Kqkz+BlFqReK6N34mnJ5crP619jElavaX?=
 =?us-ascii?Q?9vVpoRX+WwHOMU9+WjIcvuWn+jP/qqKVbJKgNY0lTbch9ts02+9KRLNJIKqV?=
 =?us-ascii?Q?4KpqssgC89EsiJrui/o+bVfHxvm6KXHGAiXplQoFawJGBilGsa4orUPqZwI7?=
 =?us-ascii?Q?mcuHL09accNas2isQLTxlE/BOAf2XTvWmBWEnwydPCv+/wth/4FnSe0w+4Up?=
 =?us-ascii?Q?g0CPTgbGfwysMbfO4iTWX3yA2mA5IKphfkCz8LH4chqyYKOv3QFleUz2Tem5?=
 =?us-ascii?Q?Q67VTvfWe5LAoHIVpHh+omkL/CETpvQ=3D?=
X-Exchange-RoutingPolicyChecked: pXBfE8cUKc05pjBIzQzg7CG4k6LjT7488wHsaswiAS4A3w993yTEVhvnSfc+nwfSKaQ1X6XTjJH078YyOuJmUym4GPexo1oMjv6q3oOA5wuSTJXEZXwzZzuThwFoep9AeqY0DRujaaMAQ2+B0jpy1+jxF28JGQHiz3FEF2OV8Oe6fJJPCGVOdqEl5950g1beOXmoeVWXt9CXQYNBr2a9ajRUW93g9EmIQQG1qfKQujJl4+JAZyu9FCXZmLCpRwMPUzzqOhtfPj+D4ZXs6RHl/f/E2lTqjrVIpnXccc/Mr1WHXe5jxKvp/bSTQCwltDygLtuzoCdUovsci7rZ2eHX+w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 40a980b3-e655-42f5-5756-08defd4a8f63
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 17:03:01.0428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OSjBrxED794Pk6a2pExhTenFvwIJOvWffP13HlEZ6ArQXOREuwYJC1oHBZJktfQW5MRcqxHZ4NAQwdCc1/b8Cn4x2qAQlTNdwbV96bzaui4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6725
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

On Tue, Aug 18, 2026 at 03:27:49PM +0530, Balasubramani Vivekanandan wrote:
> WA 14025883347 is not applicable for xe3p_hpm. It was added by mistake.

Daniele already submitted this at

https://lore.kernel.org/all/20260812223915.273611-1-daniele.ceraolospurio@intel.com/

Note that media versions 35.01 and 35.02 don't exist [yet?] so Daniele's
version that changes the upper bound to 3500 is slightly better.


Matt

> 
> Fixes: c57db41b8d2cd ("drm/xe/guc: Add Wa_14025883347 for GuC DMA failure on reset")
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa_oob.rules | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index f02ac9bf74243..a2d093ee6505a 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -63,7 +63,7 @@
>  16026007364    MEDIA_VERSION(3000)
>  14020316580    MEDIA_VERSION(1301)
>  
> -14025883347	MEDIA_VERSION_RANGE(1301, 3503)
> +14025883347	MEDIA_VERSION_RANGE(1301, 3502)
>  		GRAPHICS_VERSION_RANGE(2004, 3005)
>  16029380221	MEDIA_VERSION(3500)
>  22022079272	MEDIA_VERSION(3503)
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
