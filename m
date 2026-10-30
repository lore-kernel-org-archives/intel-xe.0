Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0649D606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 22:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NZCTU3RE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C12E910E1B0;
	Fri, 30 Oct 2026 22:44:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC5110E1B0
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 22:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793400266; x=1824936266;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aCoWLNztJDwl/zRSw+kZrxE/iCUV15aUVS0ZVisgMv0=;
 b=NZCTU3RE5gzzTfnNZK8SxXLywi528gbAfSrcr+zoB83Rsx4WdWy/jpGJ
 Wth7WO5ScB0UCk2zLKesSDwpxU1JDmZMArNVQsfJClPphWljYEglzhiBP
 XwglAjB3iXZ2rdaPNeC9CIsm9Hd9SHmMZfHd0Z9NL82aAvupLafm7pmYp
 hmwyOWwJ9OxZLuRzYzPdtG9CQQ1CMuodrbg/YFRXdo+lXFz2u2dFFkMci
 9yGfqdQNQCiYfa5OGylDtdsFR8JTAIfuXJCGZkLTFBl+2D7GC9vrqp4FP
 /TLctjRpH+48l0NIvSYvv7AfNxT0t/cwNIpIYovIg6NxZO2oBfMMaD0Vq g==;
X-CSE-ConnectionGUID: LemZAZmtTFeiKcV5wnWX7w==
X-CSE-MsgGUID: XKyLYZO2S4C+Vvn20PmYdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2200136"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2200136"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 15:44:25 -0700
X-CSE-ConnectionGUID: sidjpLFITJaPgTxWS769FA==
X-CSE-MsgGUID: mhYV3rW6S+WVZKTjsg/lsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5523712"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 15:44:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 15:44:25 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 30 Oct 2026 15:44:25 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.6) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 15:44:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lfjnGdMp9kkcg8T/DnpmXld82a2Dwiy/R2i+6BcGGOk3N9Xdshi4Z18hL+2wC6sCmO03q+gG3ovfoWaqsbFp86nkN4U51hBo3nOmkNLUbCDhTaOPeUdwfZy4QpneI3cmHKD3ZjkUGhmMTiWEeLjdYSyBb9K9tjsDyr5CqYB+XIcxIGPtiLDG7krFvvObxKvWFjkNz8DIX3nCplbzJvjmBUCspWqLZO1eLQ1awRg+OXa2CTKp43OIxO5gFq2mFKSbpNAEZcP0mntvZegHht7nmq+b1QGVFJMYBA5HMJw415XYQMpkCLfh7aKM5xduCVDI4WK8xA3vWP2lgE5oybPI3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/aK55dmShsLeLcxouBCLoBvFXGpfoaeyv/ZYpdweQdA=;
 b=FYqq8Z9/JuEjq2kJbO8rn67zZ73pDLmZdsT/nND5XYXqdEKFOI2LAE218Zrh5nNNGSK3DIBD98V4IypUgZWa0xQ+M2+56jO91s9w0DUrZUOOQNnTiK15GRrQHQdxWk63rr2rfiIwzFTW2udhNTbo0dn1MtjyMyFqMFnEOFQw8JLg2iVcE1YbWIEBcneH9qVtTvJ1F3O1I3fHMArzTLadG41AltBLiTRjZVFRYNKtFLwzqgJEoicTfYzp9oABDHyvkcVgak2PZ2LAXJ1N8AZv+5CN8jqJuP/d6zPlxBy7CYsoyZQ6qd1zu2u6wFmc1n4li4Bf2eUslxD0DW5Q0oBCeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by BL3PR11MB6363.namprd11.prod.outlook.com (2603:10b6:208:3b6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 22:44:22 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%7]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 22:44:21 +0000
Message-ID: <92cbe214-7e51-4fe6-97de-b863431e776f@intel.com>
Date: Fri, 30 Oct 2026 15:44:17 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/6] drm/xe/xe_late_bind_fw: Add string mappings of
 status codes
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <michael.j.ruhl@intel.com>, <alexander.usyskin@intel.com>,
 <anoop.c.vijay@intel.com>, <shamim.begum@intel.com>,
 <kelvin.gardiner@intel.com>
References: <20261030144547.2532309-8-badal.nilawar@intel.com>
 <20261030144547.2532309-10-badal.nilawar@intel.com>
Content-Language: en-US
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20261030144547.2532309-10-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7P221CA0042.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::10) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|BL3PR11MB6363:EE_
X-MS-Office365-Filtering-Correlation-Id: fc3239a2-7875-4a16-e9f4-08df36d75699
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|56012099006|261028144727099003|11063799006|4143699003|261009223027099003|261026140227099003|261022105027099003|261021121427099003|261022075727099003|261022113327099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: gBp6zrUc/CKOjBTXarmGsVCPQuXMbnfZOrZ6CHOtHO6+pauaXrkcGz9UyVEEHYmvDJDbrnze33QnjXYY/CgtqZQbbLECGvch5MGyi3V8nEezju9KOoBhVhkDQan4st2PUhnDhBfIKNsvmbTnmvHFgZutZ45w+lDJNo+xgWAduDNAhVUeC5J/OKt6Uxm2K8krmwthwTGighTJlJc33sys7xZyJeXpbUXHw8fbf/LJR4QeSppz4dH0ffdpeyW19TFjsf3n0s9C02ppVZhUK001kBgn7a+HChRnSbnH+BCUiFCOQzMoU4kSVz2a+u4JW/Zu7y/cywN41Mcnn1kPyh10/sIjNYfWUotYfTb26kUhCEIjBVjiO/O92O5+r/+KEJOaxXqBWRhR7/oCHTgdwaCPn1qqRUIxsoOP2wvaW5CtxJ+jXYJpa6nNafvDdakYojZzRM7TfvCVroIR/seQxcSCHHa8Js/4jF3PB+sMykns66dSkFeRaP+5JPF+m8AzLBOwyaFnmt5dMNUpqixE1G2DWqTbK3LajgGikXhny08zpMX2vefW3fY3mZ/gX8Y5Zd+1p7C7WKGLyHnbMSvL4cKgtJCwjUS5xwxN/mNpdv33bGzXWa4nEEAscEVLHIHhBKtH5ymUdupctMIYvxGO380uehiupxQEd8MjoXHQtXPX05A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(261028144727099003)(11063799006)(4143699003)(261009223027099003)(261026140227099003)(261022105027099003)(261021121427099003)(261022075727099003)(261022113327099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NG0yUmhTYmVLTFM0L0g0OUlDZHRxWUR4YkE5R05wcVJJTFQwRkdDdUVRVXY2?=
 =?utf-8?B?cWUzZTVKWWhGRWxZMEhQaHVrUG9UWWxYN3hEQmFIelhiM1VRVFBOT2NNaysw?=
 =?utf-8?B?QkV4OHYwemlKQzgyUTBjQTB2Ujg5R3RvUk5jMHZJU2R2Z25GM3JoRFhXeHk0?=
 =?utf-8?B?eno4L2F2TGU1MmppMk9KOE9lQUpUNFhocXVhZGpSa0NRaXZ4ZjhGR0pvU3Bv?=
 =?utf-8?B?b0RMenp3YXBpbitNRTE3RkwxUitwU2tEMC9tdmcyS2dQU05QeHFVNExFc21K?=
 =?utf-8?B?dUVXczJVQlBpcmxYajJvMXNTZ1gwRXBFNngwNmx4aWdId3VDTzd0Q2J5Z3U5?=
 =?utf-8?B?L3h3VnFHZzRvZFZiMkN4aXFMZ3BTTmtDRFU3SGx6Q2FiNlJhMkcrekJLU0dt?=
 =?utf-8?B?UDBlSDI5cy8vZ25GaTdkUFd1QmRZY0RtMFpOdkJqL2JIRStVRHlpSEF3N1J6?=
 =?utf-8?B?Y2ZaaDlWK2pxcS9aTzFUYmhlOWt2eThsSXIrWjdndDFmQUVCVzhmZ09uSm9n?=
 =?utf-8?B?TzI5eVZyZGdKTHdWS05JSkFkVTZLNWJ5c2NkaXkrQVJKd2x1T045akpVdEJj?=
 =?utf-8?B?bVAxNlpUcEJWRW5pbUNWMVRxQU9SUGZHSE41UlgxSFI4UUlTRUhCUkZDdE9Z?=
 =?utf-8?B?Q0YzNjFBQWpQMlduNUpheGRsZ1dtclU3enRYUWtXaU5FZDVSOU12K3l6WEI5?=
 =?utf-8?B?L0daN1RFdmFxSlA2OW5xaE1uZ0lCNjlMcXZJaXU2RXRoTU5oMTZYOUJXWUh1?=
 =?utf-8?B?Nm1RVVZyeEUvTnJKbDNaRkV1M3o2eGZpNTVmbGlOTjMzaDFld3NnR1Q4S3FD?=
 =?utf-8?B?ek92bmxjS1dFQjVQY3dxZVlHWlRZWEtsa2tnSTVwRVB1TXJGVUkyODNIRy9X?=
 =?utf-8?B?VUphK3RnekF0QUcyU3A2UDdWMUZMcE1MYjJ0RlhucXZjcitXb2RPaVhYWWpR?=
 =?utf-8?B?LzhzQktpRGw3d25QeWl2NTVydnhnVGl5YjlKaURBeUpxNXU4dFFHQXltS3Bj?=
 =?utf-8?B?bHBUQndWeFcxenZMaFI0QnJJa0RJM1kwaXZvOGNJVVFiTmtFYVVoTGRPUlp6?=
 =?utf-8?B?Q3R1VWFRWC8razNOcEdRN1E0RTBWeXNnc0p6RnZtMkM2Ky9KbTUyV2J4OE83?=
 =?utf-8?B?bzlUaFhUUzFLc0c2RUtyODVRN0lteThiNGcxY0RkMjh5RG5ybkxBbEU1SGFD?=
 =?utf-8?B?eWdmd05mVUZ0TDlrVTB5enA0OWJLRFE1elFJRENVYmFBUnZuUVJWR1Y3OTNl?=
 =?utf-8?B?aXpRM3h6VlBEeURtVlhTNDY3MjJrVklzTTlnZGFJZzdFRkVCQUYrc0dnWUVF?=
 =?utf-8?B?Q1ZjL1JvUmFoNEhYeFhlc05FZWJGYUxzYm52RW02ZGErV0NaR0Z1QytGcnpN?=
 =?utf-8?B?MjB4TWl1Skp4YVliamZaaEdVRjJRSFFEUmpzM3ZRY0tuWVRDL0NNb0xaL2FX?=
 =?utf-8?B?UWVtUWM3YmZUd2N0TWowejZNa0s0K1BRcGxtVkhzelBNMjdnWW93RlBZNjBC?=
 =?utf-8?B?N2t4WmgzZEgzSHB0VlRDSjE1eGp6QUdXQ2s4L1k5OVN1YVZJWjcySWp3UWY0?=
 =?utf-8?B?MWRVTU1aUXZPY2lDRDFiTzFhU2dya01leXFVYnNtbFJOYWIwZVZBSWZvb0pK?=
 =?utf-8?B?VERHTjYzbVVDcWxtMjV0N2V1QWNZcjFjNHJBeXF4S0VqRzFEYnJ4cFJBeGly?=
 =?utf-8?B?cnpHZTZ6UEJEQzMvMXpyYWJKcTRIQmpRcVhHYlNVZGNKQnhKa0NicWQxaFU2?=
 =?utf-8?B?Mm1zbUtranhha2YzV2hkZG5JTkI4bWNyNFlxVThhSDN1UG8yMUpMbWdKb0FC?=
 =?utf-8?B?aWIzSUk3UlU3RTU1a3crdG1JOEE4eGlack1WTjlQU1A3R2RveHNXaUMwVUt0?=
 =?utf-8?B?eDZRdjhITTNIN1cvWG5qSjd4MjRKbE5zYVY2OE9VZG9zODJjLzlsNmJoSERi?=
 =?utf-8?B?Mm1UTm1pR042RkxDakFUSVV5VmJneWU2Qnk5SlFDNWw3NTlMelMveVQ3NFhx?=
 =?utf-8?B?ZWVBV1RxV2tLaEVuNm15OEp6ZEFtNDNWYlVnWGQwbW1vR29KZlJrWXpkMEVr?=
 =?utf-8?B?WGZrY251VWk4VmxlMXlaM0VYOVF0OFpmYWhrczYwbEN6Vk4yZ1EySzcrREpo?=
 =?utf-8?B?RW13RG42eVpSYkx2V0V3Z3ZsODVKMTR4cFVBTVB2QXhoMzVtK002VmkxbWFU?=
 =?utf-8?B?aDUwTXFZc0ErVVAxN25nS0VyNzF3bHhuNS9UN0dseStWUDFKT3VHZVFaQVYy?=
 =?utf-8?B?enNFWTAvUHUzLzlkRjlEbFFyUnpRT0dIRm00L1hEWjVCTEtMd3J6c3puVDdF?=
 =?utf-8?B?ZjhhMUtoZFRZUVBsbHZOUmJaT2UyNldZSlhNSGJhZktPYXpiYkdlYXdpaG51?=
 =?utf-8?Q?vqqY3FjjdQGPlVxo=3D?=
X-Exchange-RoutingPolicyChecked: gsSCKCP51QokpnMlQpEhpyYafoGAxrTdYpGLCgj24UmW6bBOzc+qYx3nXBv3jkxmfax/eaUjKyT06295oqQX//y/RPThaRpaf4eiHpC4Fe4fhBPx+Hwmf4xwHDKpb3LPp83w0xSV4sIt8ND4Bp1EVYY4eHx7sl/vsF6d157NEgRl5qV/HAdHk6OPYBOGvsocW4leCyAd1sZIEqBsmr+ELbKhCkdRxjxx64zkIYWfL4TiRyI/b3/4cwLHmTU5k4rqyd1e78oFBNAXIY7Li45gDCwjxoOL13STako1LJqRbKxWSa4VEZ8yr9rdMhY5DHVumQdLv+YW6rPulNdlc6wSrA==
X-MS-Exchange-CrossTenant-Network-Message-Id: fc3239a2-7875-4a16-e9f4-08df36d75699
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 22:44:21.0504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cKidU6BLE5SKbBMg/fW29hTt8aV7K/lfzoz4X6zovFlX6TzONlcE26YrhEcFYdGP6iXIJt8qY27Kv+bhGxQUaJ3tugxtmNeyIeV5knSPeWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6363
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/30/2026 7:45 AM, Badal Nilawar wrote:
> The mei_lb driver introduced additional late binding status codes.
> Add the corresponding string mappings in Xe for reporting these
> statuses.
>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/xe/xe_late_bind_fw.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index 1bddfaf0fb9f..b7957e255ccd 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -179,6 +179,32 @@ static const char *xe_late_bind_parse_status(uint32_t status)
>   		return "Invalid Payload";
>   	case INTEL_LB_STATUS_TIMEOUT:
>   		return "Timeout";
> +	case INTEL_LB_STATUS_INTERNAL_ERROR:
> +		return "Internal Error";
> +	case INTEL_LB_STATUS_INVALID_FPT_TABLE:
> +		return "Invalid FPT Table";
> +	case INTEL_LB_STATUS_SIGNED_PAYLOAD_VERIFICATION_ERROR:
> +		return "Signed Payload Verification Error";
> +	case INTEL_LB_STATUS_SIGNED_PAYLOAD_INVALID_CPD:
> +		return "Signed Payload Invalid CPD";
> +	case INTEL_LB_STATUS_SIGNED_PAYLOAD_FW_VERSION_MISMATCH:
> +		return "Signed Payload FW Version Mismatch";
> +	case INTEL_LB_STATUS_SIGNED_PAYLOAD_INVALID_MANIFEST:
> +		return "Signed Payload Invalid Manifest";
> +	case INTEL_LB_STATUS_SIGNED_PAYLOAD_INVALID_HASH:
> +		return "Signed Payload Invalid Hash";
> +	case INTEL_LB_STATUS_SIGNED_PAYLOAD_BINDING_TYPE_MISMATCH:
> +		return "Signed Payload Binding type Mismatch";
> +	case INTEL_LB_STATUS_SIGNED_PAYLOAD_HANDLE_SVN_FAILED:
> +		return "Signed Payload Handle SVN Failed";
> +	case INTEL_LB_STATUS_DESTINATION_MBOX_FAILURE:
> +		return "Destination MBOX Failure";
> +	case INTEL_LB_STATUS_MISSING_LOADING_PATCH:
> +		return "Missing Loading Patch";
> +	case INTEL_LB_STATUS_INVALID_COMMAND:
> +		return "Invalid Command";
> +	case INTEL_LB_STATUS_INVALID_HECI_HEADER:
> +		return "Invalid HECI Header";
>   	default:
>   		return "Unknown error";
>   	}

