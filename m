Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EFBFF886F
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 05:48:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A316F10E03B;
	Thu, 30 Apr 2026 05:48:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CtE+YS7b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9ADA10E03B
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 05:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777528116; x=1809064116;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=zzUkKwvZZazCuX9aX3AwRb+Hh7o6Lyk2ZvPs9tEFcN8=;
 b=CtE+YS7baIikQ+E28wmAhT/XFMLJ6UI1UZfKr/QhhaFs2PeYeC1W+Grs
 uR6XAdc7jnjA8c8C3LMTkCIWtBmfksKTz/U7ozCPAWMf2q2l7OeZE7nEm
 4v5GL+JNOU0yfDRiMTb0kRX/knptFlm8UTzNtcAXVVpgJgYXhNrhsbqT5
 OiT89WHILbjT8GHyaYiW32Kki3Hnm4D864OYzJFhOIQect8Z0qZeHH1TF
 xrWRZy1wx4wIz+T374XP1uTC11nOC8d2VkbG3bah+FTH8G2boHujXsKMU
 lHidES/Gc3jZdaYfE+/Cpna4XnZfL5D2iDg6TSau9dcbTWQzMI2HMW/Uk A==;
X-CSE-ConnectionGUID: Ijwsxg87TYOgivZc82MNWQ==
X-CSE-MsgGUID: 6/uhF2dbS1OW1ridW1UAdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="77633066"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208,217";a="77633066"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 22:48:35 -0700
X-CSE-ConnectionGUID: deeNVV7WTjC2YpG6aDb9eg==
X-CSE-MsgGUID: F3rZoBwKTxaJVJyNe2JA8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
 d="scan'208,217";a="272598092"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 22:48:35 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 22:48:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 22:48:34 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 22:48:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=elCCpiIrZppEkS2Ws245den7Eaf+6fVZCWvFVgrh0u4WkMfsMMKa+123R01r5lWz6kkPRsFQfTw+LBWSsDV5bG0B+aClARK8BjXicA14jqZMYrZtgvkYqNa/Ikmh4mUX46sHs58qletcy3vhRl+I99DIsJhDvLpgTk1+gS4T12lI0o0AOYYX89qySDKWA8a7Ybet216OHQ6IuxLu6hTulAJ+b2KVhCCBkYz3a9xeAhM8bryl9YK9r/pm4ZXMLFxCR5EsYJB7jpk21ObGxmuyYNUoidOczqAqZnpPeb1nYo8OIaPR2lZn0+V5xC5Q98LjU4X9I2OcvZ2NMgBXB+thQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cEcDseDB21nU0G2pzpEV68a51CmN2KNTY4KUsETur1E=;
 b=DtaFjEg6DC83OwyuLGevihXXT951LuH1Hl8oUOj+geBorkzV9P5xCQrd3G3vJdKDC0m8p26jcRZZbCadhBb05Ug1/uZqYY0Gnh9fRy1Pu9Hy17MuHLTas1MuIVS2ppWPExFvI2XEUSmgXd27kXnaGkngY3mo7s17yvmcvETUVnBaxU9VOtTT131CbC59W/sQvNdWs9aQe8hQhIbbJ6gUZNRpaq6XV6s6LXkJ/2ezJLw90CVyN0btCickgmzJOWZjKaiaU8RnQI9h82qSJeltRosB90SiH0F1+s+jiD2E9zKM22E0TI99bNJX6dnYeTvlTb/IuMZNRX0BnsBBqzbgDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by SJ5PPF33E90C8BE.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::81f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 05:48:32 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::ccc3:3fd6:58f5:927]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::ccc3:3fd6:58f5:927%3]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 05:48:32 +0000
Content-Type: multipart/alternative;
 boundary="------------xUSWxpE8AlSQx3rQdH3Lcuc1"
Message-ID: <22593632-a8b2-46ba-8c17-9f87fbb470ac@intel.com>
Date: Thu, 30 Apr 2026 11:18:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] drm/xe/mmio: Allow to replace
 xe_mmio_read32|write32() with stub
To: <intel-xe@lists.freedesktop.org>
References: <20260428142722.582-1-michal.wajdeczko@intel.com>
 <20260428142722.582-5-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20260428142722.582-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MA5PR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::7) To DS0PR11MB8686.namprd11.prod.outlook.com
 (2603:10b6:8:1a9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|SJ5PPF33E90C8BE:EE_
X-MS-Office365-Filtering-Correlation-Id: 56cd4aef-7dda-4536-ec38-08dea67c1c99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003|8096899003;
X-Microsoft-Antispam-Message-Info: 9smuH3LDP1XH0OY9l+gxiHvgN0ROVtXfYGDa6/VJXe+yZns/A8khhcrMWf5GSuPg9RxUCIuf6M91h/prppFiSqiGSiZiA+v4GG4QRzhbp53as1oWCTXPdo/dKj+rsV8HRerSb6Yq121U9Pws0EBFnrQI3YbcCGVhRPkCt32RnCBjzZFTiL8OXHLgjXTjAPuFjfTYXoMf02XCaOkD6C197Nm7Ked4B555RfFh5NDIM0BB4DCs6tYKfx5IItPI4lM58ZHAYOIm9dIJJv2lAVY8gAPTBp+hgzsfymI9Q179Ny5/qTZB8Ph6htgYN2DcwGTF5FyKW9mc1hHr6v67ppJwyTEQ1VEIB6GqZpHjMYU1bZ6yPPVKst1ITnL6VmF90rKIleh9MLMZEqqwm87TeybXQCWZwBDh6nnus687f/RlB/YRP/u4ufuPPvIx/mLl8Ch9TL+nsOutcfyLNN5k9gp2otCJEi4fw8KK0pidVELN2hLw4yMVGswGbDc0WX0Eh5LEsTGZythFGBckt217IZsaMZoNm0803ag9bj8M/euFEE/60X1YH5XTfP80sdnnaKM2ORZNJs2jVTNh4UZBdin9EdL83fRIxdbHOf9KvbqKZtE3cB848Oba3EvoliIlce6gWvH3swp1rak00pQPoIbtiqlLGN/IzDqgRpy4iIWnErRYjPbSeac+q6BKdEcrDwabRoOMbQXzG75+VxIUmjHyDGfTMhK3gt/N/bLDTe7iS5s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDh6WGlxMGp6OVNNbUFoVEQ1Tjd0MlBkOFZVOVhXcUhKbWpTckI2dUFWTjZy?=
 =?utf-8?B?Q1BDWFRCSDk3QXZxYktkRmxSM2V2UUJ3bFVlYW8wRkpmeFoyWHpZT0h0UDNn?=
 =?utf-8?B?UXpvWEVRdU43OGd1RHNQZHp2d0N3aFNvbnQyc0N3UkwzUU5oT2RHbkdQRGJv?=
 =?utf-8?B?RmxBK3lyVXZ4UThhVGswVnNsMytVODJkdVlqNUd4SkFRQU1BWUNrbXlXTTha?=
 =?utf-8?B?NUU0dXRhcm11RGdVZi8reDZ4WmZONTFCUm9DZm9tVGY5ZkRCL000bldXbXZ5?=
 =?utf-8?B?ekxPOGIrZGNBTHZUL05CV1dBcndBYjU3ZTU4VTZ1b3hMYnl5aThQZFlIcWFi?=
 =?utf-8?B?TmtTTXBaT052a0lXT0xBSldFT01SZUZZM0ozWkk5dG00MWVEU0tXUzByQlU1?=
 =?utf-8?B?NGJpMXhQUmNna3NYbGZmc0VVak1UWE1PZjZCYmZOQ0h1a1NOZlBVYTVmRW1I?=
 =?utf-8?B?ZzkyUXI2cXZ0TXFWTmZsRG9GK0E0UUlXWnk3ZnZReEZEelcrTERtOWd4ZU9S?=
 =?utf-8?B?Z25nUFB5WGFiNlhwVkRYL3RkTEJhZThaQy83NlZ1UWdGTHdueGdnUFdRL1o2?=
 =?utf-8?B?Rlp0K2xtczVyR2FTQmUzN0RsdklzdCtDZUs3SVFmMWlmZWpIUFc0ZmJDVFo4?=
 =?utf-8?B?NUo0S0NaY2V2MmZVcDduU3V0VWtIN2VRQmlVODB4ZFJDTmRMekNsdjRmZkZX?=
 =?utf-8?B?dFZGd1d2UlB0cmsrUjhUTStWRlRuK2xvT1Y3elBYaFp0cG16S3A1MmNvUGhW?=
 =?utf-8?B?TFdNclg1R1VRcU0xMEdmMnBrWSs4MUhuWkZ5Z3Jab2ZaUGhUNFNLYmxZWmty?=
 =?utf-8?B?REF1cW82b0w3Ykk5dTFnS2g0SG9pdzZUb2ZJK0ZheVQxRjlxWDYzQU9ncGN2?=
 =?utf-8?B?UjQzclY5RkI4eDV3bjZzYlNSS0VTNUtZVkpaYU5IRkdsT1pWZ3R4VGhZbllK?=
 =?utf-8?B?ekc0dXpwN1RXUXhEMlJhTHc0dEVjTDBXYlpyTFBLUXFvSk5yQ2daWmdwdGUv?=
 =?utf-8?B?b3RKd3Bob3NyQTY4bFhUUldYbVZoTWowYzQrYVhVdUlxc1NacTVSK2pFMmhh?=
 =?utf-8?B?Q21uM2hWQzFML0hzMm5xRWxKZHNZS3lKTGE0UjgyQ2djNXArK2xTUmtwbUh3?=
 =?utf-8?B?LzFiNWJ6QlJKWVJHYy9jTWFRekZPOEtkbU50bWtidzJZTGNRVERId2xaN2Zo?=
 =?utf-8?B?aGtVeUFDeENiQkR5N3BLZGkvV0Q4MnZFdHJXSWF4ZzFiSStpbGNIM0pTV3h6?=
 =?utf-8?B?RDczcitCNGpvakFiZXpBVVl0OW80eCtLK2thWFdFSTJZd3NpemxUSXBCdXQ0?=
 =?utf-8?B?VS9oeTZsMk45cFhKVnUvUUUyUEQ5Q2l3WncvTjVjWnFxUnlSZi9lWS9oYWFF?=
 =?utf-8?B?aVZPaUttbzR2Tm5FWFN0cE04NmFnb0ZBdGIzcTkvTWltQ09EQ1dCOVd1QThm?=
 =?utf-8?B?dWJJN0RZbk4zRisxdEtpVlc5QnFicktrY1JFVThCTnJIS1JaQ3FjQ3VjVk5s?=
 =?utf-8?B?d2lHL2s3V09WN3lxNUtPbGRTNXRaeXo3YWRyV2JxTWk0T0NFa0k2VVlpcmpV?=
 =?utf-8?B?R29zdTdYQlJSbGZ4Tk1uUWFCM21LYkFZdlBoWjVxRnJUaTdRamllUjMrMVdi?=
 =?utf-8?B?M0xqU3pnZXc1N0k0SUlLNDl6NDljOEI4MjVaUiswNVB0SU5lYmNHUmxmTmxm?=
 =?utf-8?B?NVM4TDBHcTNFQUhwUmxYS0F0K2NrZlBEd1pPdFZwRllvK0tTb3ZHaWh3dyti?=
 =?utf-8?B?ZXhNQk9OZ3dYRnpOSE9DVlBMVFVUVmZQTHZyd2NSNE85NXA4VVY5MVhubTFF?=
 =?utf-8?B?ZDN6OXpUTlgzcm9zSmVnWHZ5bzREcmFtTjgrb2QyNXVJRXdzRDRMeDl6MXBw?=
 =?utf-8?B?S2l3aHdwTDNvRHRVUGU3SVU2c0VzSVRtaitaaEJPWFZUaHRHMFh6TkZHSWt3?=
 =?utf-8?B?ekYvbmJ4WTJpZnFXU3BzT3ZucXZPTEd2RHRMS2t2R2FjOCt6bDA3WHhzVUlO?=
 =?utf-8?B?dTBsUERYcC9QU3JxY21MN0pFZUtVY2g4RnBvalpYTmNTQjF3UHpsSUU3NGQz?=
 =?utf-8?B?Y0cwQTZaM2I1TVlzS3Y3bVcyQWJwYXhHVWdJcjYvcHZoYk1CZmJMM1VkczJ1?=
 =?utf-8?B?TW41Ti9HUlVJVTZyL05qbFI2RnhnRVd0dVFMV2ZlZFRVZHYvTWQ0WFRaNTMw?=
 =?utf-8?B?c1NaT3R5N05jWEptZUNsQndLbzlsL0JaVFRJOFJiZVdxbnpOcENFQ0FUNkRa?=
 =?utf-8?B?THNBNHllSUhBeGprT0tIUlZUNXVERkxvMGd1aHNkUDVzOXAxQzJROUJ5OCsz?=
 =?utf-8?B?SXV3ajdzUklVaTltd3hCUjBVdzZ1NWpvNEpJenF5aEpXcHdEOFV0SCtYR21L?=
 =?utf-8?Q?pc+TnnKZls92nuyI=3D?=
X-Exchange-RoutingPolicyChecked: hELhDXXhedrnorukLVfBmYPILUVvkt2NThKWkfTS1lPttucRhgjuTUq5M3mn3Y49RLsOWx/1udevmpD96tM9eVEH9PrIGeLlkugcSRCyQ7SLEXqTDqNkwfhG2l4dt7J4ERlMZ9hBNH20w8qzuBRXduMdH4yhkEbl3kFAUQ4a5PDMLr280oeiV0Zh/okyGXt0iPs6FnKlqlLsGCm6e+TUeJKQA4Qch/VJ8gJEY/EN+edCXWESE026f6EBB69M8x5Az9pC4pqPUWYIztlo+YrFmLe3w7MYE5MifDaD8nHvtlybDplo0+mI8fxqG46s976d/I1MLHxG0xjgW3erNOBlUA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 56cd4aef-7dda-4536-ec38-08dea67c1c99
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8686.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 05:48:32.6269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NrwNoMDLwgV7TdRUtpvrJ34JSXQDiH72bDtMJeaS8t3Ob2vWlXbQFH7Tt1p9QE8mAeWS9ip0MoZ3QUMtrvIgvGDwMsPc12F8ptW1auApIWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF33E90C8BE
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

--------------xUSWxpE8AlSQx3rQdH3Lcuc1
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 28-Apr-26 7:57 PM, Michal Wajdeczko wrote:
> We want to use replacement functions in upcoming kunit tests.
>
> Signed-off-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_mmio.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 78adb303b663..83cd1157cf61 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -10,6 +10,8 @@
>   #include <linux/minmax.h>
>   #include <linux/pci.h>
>   
> +#include <kunit/static_stub.h>
> +
>   #include <drm/drm_managed.h>
>   #include <drm/drm_print.h>
>   
> @@ -180,6 +182,8 @@ void xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val)
>   {
>   	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>   
> +	KUNIT_STATIC_STUB_REDIRECT(xe_mmio_write32, mmio, reg, val);
> +
>   	trace_xe_reg_rw(mmio, true, addr, val, sizeof(val));
>   
>   	if (!reg.vf && IS_SRIOV_VF(mmio->tile->xe))
> @@ -194,6 +198,8 @@ u32 xe_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg)
>   	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>   	u32 val;
>   
> +	KUNIT_STATIC_STUB_REDIRECT(xe_mmio_read32, mmio, reg);
> +
>   	mmio_flush_pending_writes(mmio);
>   
>   	if (!reg.vf && IS_SRIOV_VF(mmio->tile->xe))

LGTM.

Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

--------------xUSWxpE8AlSQx3rQdH3Lcuc1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 28-Apr-26 7:57 PM, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260428142722.582-5-michal.wajdeczko@intel.com">
      <pre wrap="" class="moz-quote-pre">We want to use replacement functions in upcoming kunit tests.

Signed-off-by: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_mmio.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 78adb303b663..83cd1157cf61 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -10,6 +10,8 @@
 #include &lt;linux/minmax.h&gt;
 #include &lt;linux/pci.h&gt;
 
+#include &lt;kunit/static_stub.h&gt;
+
 #include &lt;drm/drm_managed.h&gt;
 #include &lt;drm/drm_print.h&gt;
 
@@ -180,6 +182,8 @@ void xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val)
 {
 	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 
+	KUNIT_STATIC_STUB_REDIRECT(xe_mmio_write32, mmio, reg, val);
+
 	trace_xe_reg_rw(mmio, true, addr, val, sizeof(val));
 
 	if (!reg.vf &amp;&amp; IS_SRIOV_VF(mmio-&gt;tile-&gt;xe))
@@ -194,6 +198,8 @@ u32 xe_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg)
 	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 	u32 val;
 
+	KUNIT_STATIC_STUB_REDIRECT(xe_mmio_read32, mmio, reg);
+
 	mmio_flush_pending_writes(mmio);
 
 	if (!reg.vf &amp;&amp; IS_SRIOV_VF(mmio-&gt;tile-&gt;xe))</pre>
    </blockquote>
    <p><span style="font-family:Menlo">LGTM.</span></p>
    <p><span style="font-family:Menlo">Reviewed-by: </span><span style="font-family:Aptos">Satyanarayana
        K V P <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a></span></p>
    <blockquote type="cite" cite="mid:20260428142722.582-5-michal.wajdeczko@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------xUSWxpE8AlSQx3rQdH3Lcuc1--
