Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D8AC5CFCF
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 12:46:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292438994A;
	Thu, 13 Aug 2026 12:46:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kxh3BZW8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75EF68910E
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 12:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786625210; x=1818161210;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=kd8l2Y3nNFktsi7P8qDra/wWH14LfuE+cutgsXAaMyU=;
 b=Kxh3BZW8zS0qpbY8bMn11GoZu6nsjGfiW2W0wsHbzH8XcUlVHzWOpf0J
 /OVJIoQgeDL5yRJGjyZ4qqwBENGkFTWvLmgVZqCZhojD+wH48pdqXouQu
 8hGZNdi+CCbIe1RcwwxeUd06PA8x4fssb6V8tQ0/ypSUccNYoxPqKEn4Q
 IoN8WjxPDJYNDPT141/FlVowc7AX1o/fNPgSXP60As5H7n8yFsv1TEAC1
 v3Fk2MM4majOQjK2xeXTro3uEsfBXoZoEkbrUBo3vc4huoB/2wzwJDmUb
 VOyKIajpfDnoOKgsvxt1oflxFqchoKa2WuzJ1er+AMzd2/k/lTAMjOWb7 A==;
X-CSE-ConnectionGUID: d7RB79nNTSaRMA+6jaFBtQ==
X-CSE-MsgGUID: LOsWZlQNRuOrd/g/wXR9Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="112740461"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="112740461"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 05:46:49 -0700
X-CSE-ConnectionGUID: NaUdTeenSDqrEmShpuRAvQ==
X-CSE-MsgGUID: kssPXJFlSfypDscFRKmJ+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="262618203"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 05:46:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 05:46:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 05:46:48 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.35) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 05:46:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sVgxLhvUkPJVycF6azUSCwTUI7NpZocjwXa5yOjvrBFU47jOIacA1vzJociF8un9KQu2oDuI1em74sSDhDKV7PCNdAYZl5WBD9GVmA8jaOvKyK9CXMOBUc7Osu7tXz0yw+iPV1iGGuZPTY0/nfsIvBVUmw+P+aSlgtTZmEIl5o+XHEWkRnsPEF1X8sevoNX0eiljEGglUKmq3vJU/M8+McCY0Tgp+A+Px4L/3VEifOenFVwRcdDd8BptGEjz06GysUdHxcKnTKykBYuCjwi0isWMXWABzg7GdxAQQw769gpSp8MWdYmQ8XdyH44rwsKhh1u0+qmgOP+GrqtfLoxl+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uaNd2VhvxzoXH5eJTM9ocmheHDs71bO8ElcXREqOVZQ=;
 b=Olbfp2NZfUeDHJfprN4x3LfvdP7XK08Zv1DuOhwWIRDvnyhZefypz2hFm31I7BjAnq+nNXjtVuXr1DSauXnbf0p3F3to3vq2z/jYpUOUdV1m9NS5Y9WW/ipotv8cgBwPl6R015g0cHnd/MiMsLxI8kz07f86yhyV8+I2dTint9HC4VWHuF43PbiK9/VIR9A/Junp/cff9ZR1UgjhsA8D4728toyQm2gjKKhLrs3U4rV9jVpUXGiYV0rlVXE2fp0+nSsdrmPfR52UI1B0JKulX18NqfAYWYPT1ozwbXusLU/h4Hx6/zipMiXK1Nd4NVXA5GVuBXzUqqO4ggNRCCFcaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CH0PR11MB8165.namprd11.prod.outlook.com (2603:10b6:610:18e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 12:46:44 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0315.011; Thu, 13 Aug 2026
 12:46:44 +0000
Message-ID: <d2bd1735-94bc-44cb-8fd2-dbde99db4ec9@intel.com>
Date: Thu, 13 Aug 2026 14:46:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 23/32] drm/xe/survivability: Report 'Runtime Mode
 enabled' status using SIGID
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-24-michal.wajdeczko@intel.com>
 <f203ca92-c042-46e1-be7d-773f63d9bb5f@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <f203ca92-c042-46e1-be7d-773f63d9bb5f@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0108.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::37) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CH0PR11MB8165:EE_
X-MS-Office365-Filtering-Correlation-Id: b4640c10-5c61-409d-44eb-08def938ee2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: 0kNZVWRZmyEllLMypgV45j5diqNZAq8ysGjO+v7M6ZR/l63Ac3TP6gbi9C2mnAealmvUid4gg8wrMDoSKuKiwtfzmLcto2+e2g9zUyh1qgzGeDJBFi08I6pAfA4ruabJLhmaUWVR1eFcRtYDMJTtOS4tddGt+RcmecqXx4bgyzR0nyrVtI2e5tu2zFuqafj8GjpaVJG0RhG3Ph31nYuVATwH9KQxgwNbW/as+0pl/2JRweWPcoooMwx9dxbxX0QuEa+7M+H6l+GqAnwg2gBacivsOHBJkif29sMT4C0ZIFlCusGr7I8C36D8dJ37pdRq3yAB1qkPnVVnLwngTegoT+PENDwEvuOvdZEL8nGo4DNL07yJWNzYzb19FvxKV3z0q7YXb81VZznhcuYSJlnMBi67BiohsrfCtSQWRXnaui3DIKDAK9XqdVs0IQ1GvewmRgn/eXMytCs6ro8I10ReHQvSk41fwq4lu9HSqzIF40T4WaZpFtRqN6qoPsrPltzBlBUepkfT/gMxR9wEScZKrKDSdgEJWpnUkWNSnw7Sx5iD/SVJkBDxL/l3o+F+IvrqK8ZcT48+Yn6ALZ9xmyLCE66PtnaX1QOpGxkOdUoXA4g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEJYTmdYT1NLNmR3blV3MFZESSszbVpGaEM3bnI4MTBHQ3RJNU5pOHE3bGNs?=
 =?utf-8?B?dFB0ZCtIYU9vSGdsaWM2MDRpenFwOGRuTjdCMVNLSm1vTk1mZnZOa01kRWhW?=
 =?utf-8?B?eEZRVU1RQzVNcG50YUN2MUppYWh0SWNhZmo4ZG1GYWFTS0V3TEFTRVUrZ3hI?=
 =?utf-8?B?WURQUUJXajcyRjZmN2JnUjVBbG44aVl6TUhQNUdLeFJGVHlHc3hGazR3NTRH?=
 =?utf-8?B?Y0dtNTNmRUlhODVQMklWaWtqcWZVVHNHVDBXdkRSYkNqOXNzM2JhSTVaYUNX?=
 =?utf-8?B?b01mbnJBYUVNOGV6Slh4RWVzM2tpejVVZnVleWEvdDk1UEpOcjBoeGZMWm5s?=
 =?utf-8?B?OGJUZDBlRDRxTjR6bXRXZ2NFNmV4QmNvQmlZRlplandweXF4UHdkeEFtcmV4?=
 =?utf-8?B?QnpGY2RGTGZQRysyN2hBNDRhZm04N2Jtd1IzdVZha3c2MnhyaG5Ra2pNZjBM?=
 =?utf-8?B?a1pDbW4wMHpiRFFsRUNLbnRGeGtTQjVoMDZicGYvMXhDL2VEb1ZWbWxmTDFj?=
 =?utf-8?B?ZDBzcEI2MjREM1hsMjBEYlhKa0x3cS9qL2hXV0dlenFZTEExMncvTmp0RGw5?=
 =?utf-8?B?UG9LbEZERk5ZTTZ3R29renlHVWJObmJQMUdtdEpkSUNwREdYeGRRdnJwcEZw?=
 =?utf-8?B?RmlOZWtHTThMUnpvRXdQVUlaS09va3ZMRENCejBOOVQ2Zm02Z1V6SVJ5TGhI?=
 =?utf-8?B?aHp4bXo4TFFqNVZta1MzTVlUSW9tY2cyTFpHajUrSzB4WVFQcDZ2QmZGbUN6?=
 =?utf-8?B?TjA1MDEwd3AwMUFMUDVOS3lyRElnNGpHUmZ6SE56STdrU2FtdG1lVGFSUDhX?=
 =?utf-8?B?NU5wQ2dGNTl5a3pDSnJNWkwrRkN1UVVqb2RTY0ljcDZqUFlzTk8xTm54RUhY?=
 =?utf-8?B?OHdrRkNUNmZ2T0MvdDV6a3NzVnRQMGMwZ3pYYzhqN1hnR25kZ2g5YnFiU0xo?=
 =?utf-8?B?TlN5Q0QwQnczL2dhYm5YaStPU0dhYnBLM2x1VUlwSE0xUnFkeWlrRy82cHph?=
 =?utf-8?B?UWlyNU9rZUNvT2cxQVFGUGplZHNsL0Z6bzVzOXJGNGJQK3hBVUdmQlQ4dkM1?=
 =?utf-8?B?V20vN0swb1FaamZQbU1paStFb0d3UTRtZVZURHIvYWVQVGJJUUVmTTdNN3hV?=
 =?utf-8?B?UGVza2pUd2lTcE9qcXdKZGZmbE5ucXIxQVl1d2ZibzRSdWV6Wm83M280SUo1?=
 =?utf-8?B?QlBXZUxIZk4weDRUOXhOMmZEd25DU1JoeDk3enFXdHJtVWF2SnQ1Vnl2L2Rt?=
 =?utf-8?B?aGdObzlHRGFKZzRsZEIrRjZGc3ZPT2JPeEtHY3ZJcW9FYmdwdG5OWVIxWVpl?=
 =?utf-8?B?d3ltMlhBQnVkZ2YwQ2d0WlpiVTRLL1k2MTZtNnJsVzVCWkNtc25iMHYwM1lZ?=
 =?utf-8?B?bjd1dHA5OTEyUU03Z3psaGpUWWxyMnpOUyt1WmFPSVVWc3pLN25XWWtOeTJ2?=
 =?utf-8?B?NTFJa29ZckZkRlFkeEx0Y1JUeUU4TG5YUFpyYytqSlRZazh1b1NtRm95U2pm?=
 =?utf-8?B?SnA2RmRoRW5oWU8vOFN6alhkdjZONWZ1NStha3ptWlNjYVdVaFZMNk9nb0tq?=
 =?utf-8?B?US9WaHY4T2tDWVBuNXlJZFp5QUNQbEM1NUYrRkNaVWpoeGlUNGx3am4wZTVB?=
 =?utf-8?B?cTZrOWV3NTI4NmVRd2hQeXZMaVd5Yk1YeDZyTk5FeXhLeTBCM0Rjczg2WXdK?=
 =?utf-8?B?VWw2a1FXYWZBMDcwL2J4QS83dGZqTUFqMDFLWjh3MDlpYlB1ZWVhaUp6U2Fa?=
 =?utf-8?B?Zko5NFVvbG5MK21JK2ZKbGJDOFp0RnRvVUJZeGpQZktFd1JkRmJRUTNaQUNN?=
 =?utf-8?B?aVNuRmZLRjBhYmhJa2p4em9LTTB0K3ZSSDAyM1FjZjk2dk5VZkFYY3A4Q2tW?=
 =?utf-8?B?dG1nRUxXVEUvb2NXVjZHdThndHdjemloV25UOTNSV1hVNTNQdDBjU29xVFNr?=
 =?utf-8?B?U3JLWFlaSlRkNktTZ2p6Zit4ZFNEUUc2VGdIR0JOM2VZK2lDY01WWGYzVmM4?=
 =?utf-8?B?eUpadUc0YjlNWXdwVXQ0emlubVNZVXVOMENFU084eUY3U3VLdEtuMG5zdHZq?=
 =?utf-8?B?SnFVeFprV0hRaGp5cVNBRkVhdkJjZy9IQTlVcHF1c09XMllkQndGSVhnUFBC?=
 =?utf-8?B?aEdnWkRnNFAvOVN2TEpwemI4cm5sV2IzTVgybFBkK284UDJhTjNCVkNiYTQx?=
 =?utf-8?B?NHBEQjdOalV5bUdmd1lKSzRsRXUzNmlqT0U3UkFPbk5sTWViVVJWZElBcmdV?=
 =?utf-8?B?RnpENjlWcEcyYkY4V1dtZ1RJc1NnN21JZW82bHF0U0NoS3FwRWduOHJMVGxs?=
 =?utf-8?B?eWQ0Y1ZmZFFGa0N5SmcrWnZBMFd6VDNPcWthQ2ltYTVGNzF2WDBBM0FwSzNI?=
 =?utf-8?Q?o2w83gZSkgwhHlyk=3D?=
X-Exchange-RoutingPolicyChecked: E7p05wxbVpNgxDpajPoTRNFSAfpq+5IrUh04IXIcaA2nGtSiA3JpUA1gbD6UNg3DIgc2o8Qq2qtdSFACv9CjIgOdN9mRASyhogtLOpNjQE+Va73BFLvc2NawqySXrXEw+rNssESg81WHVXU6wG3mnPn88YPoZ9XiW/GpK0FmEaJseiDXBLNqsRywb+ntVp1MmsQWTR5uQMnwnDi1MeAQbO9E9iO2O4eUerjaJlDwk9LekWJS5/nVBK55ocdVXQ6fBsb54p2zeNQLk90z+4QgQ+yKZlHZI0RrtUkjkfuB2k+s+qkfqjLkP+duS8+hm0TrJ0NYHJTOMsEhHoX1LOHmnw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b4640c10-5c61-409d-44eb-08def938ee2b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 12:46:44.4035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XcECuHRu7eQsNr8TPTRA7czyuTlBwiZpX5q/dwoxtJPGjPSb5dUVAgSCkWrCNQcn/5L+76tIARD3LrCFL2Ae8s2Ic5IVGmDJP/RObQO4MAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8165
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



On 8/13/2026 1:40 PM, Mallesh, Koujalagi wrote:
> 
> On 13-08-2026 12:44 am, Michal Wajdeczko wrote:
>> Report 'Runtime Mode' status using various xe_log() helpers.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_survivability_mode.c | 10 +++++++---
>>  1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> index ebd288986c11..5d3315ac735c 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> @@ -18,6 +18,7 @@
>>  #include "xe_mmio.h"
>>  #include "xe_nvm.h"
>>  #include "xe_pcode_api.h"
>> +#include "xe_printk.h"
>>  #include "xe_vsec.h"
>>  
>>  /**
>> @@ -405,7 +406,7 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>  
>>  	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe->info.platform < XE_BATTLEMAGE) {
>> -		dev_err(&pdev->dev, "Runtime Survivability Mode not supported\n");
>> +		xe_log_err(xe, SURVIVABILITY, -EOPNOTSUPP, "Runtime Mode not supported!\n");
>>  		return;
>>  	}
>>  
>> @@ -413,11 +414,14 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>>  	create_survivability_sysfs(pdev);
>>  
>>  	survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
>> -	dev_err(&pdev->dev, "Runtime Survivability mode enabled\n");
>> +	xe_log_info(xe, SURVIVABILITY, "Runtime Mode enabled!\n");
>>  
>>  	xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
>>  	xe_device_declare_wedged(xe);
>> -	dev_err(&pdev->dev, "Firmware flash required, Please refer to the userspace documentation for more details!\n");
>> +
>> +	xe_log_info(xe, SURVIVABILITY, "Firmware flash required!\n");
> 
> IMO, we need to use xe_log_err (recoverable) here instead of xe_log_info.
> 
> Already mentioned in original changes [1], runtime firmware errors cause device unstable:
> 
> [1] https://gitlab.freedesktop.org/drm/tip/-/commit/a2ca0633a0fef925a0d8125d8f3e4495a5ecb310

but in recent comment [2] you said that Arch team wanted that to be logged as info rather than fatal

[2] https://patchwork.freedesktop.org/patch/743324/?series=171022&rev=3#comment_1373731

@Riana, @Rodrigo, @Aravind ?

I need a decider here

> 
> 
> As I know xe_survivability_mode_runtime_enable function need to carry errno as parameter to pass into xe_log_err, 
> 
> however we need to create separate refactor patch for that in future.
> 
> 
> With above changes:
> 
> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> 
>> +	xe_info(xe, "Please refer to the userspace documentation for more details how to flash the firmware on %s!\n",
>> +		xe->info.platform_name);
>>  }
>>  
>>  static void log_survivability_info(struct xe_device *xe)

