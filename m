Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814EFC5CFDB
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 11:41:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD5510F2E5;
	Thu, 13 Aug 2026 11:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L/xWXIJ0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9B410E4C3
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 11:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786621258; x=1818157258;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=DuYd3UZxLx8+hHmxr+SENMvbYwyNd7d3RgJ0EXtNfzw=;
 b=L/xWXIJ0RZevC9Za3YedjhuycZkVrZsBb+Si6nzlGTCEa4E0t6FKvHwW
 hGhfK3+lcoAXGG30NtlhamAonztZQ/AMvej0OFyYmysKlZXGmQIEhcvlZ
 R55iVWvNqSNzoqrQ0SpH9aSVGBmo4Vi2ha7czujysrYxI6MTJn8tRrn0P
 zL9XZ0zOgTsWgru6HzoeL724GiPJFgbMLhg00Q4fotwSNpduT0XafKgwz
 7m6el/OkjRScfVEmunfPAuw+RPrh8f5D7Lj/UiBTzSoMAPBh+a7l3WBKE
 VEoW85FZY4vLAwtUDFOfIyifrjA4n/zWb1kZ3L/ui0xAnm0DY+KKQM63a g==;
X-CSE-ConnectionGUID: Slc3aElOSfi87DQlCxBLfA==
X-CSE-MsgGUID: xinSbzTUQUGLoM5fFA7agg==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="104726870"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
 d="scan'208,217";a="104726870"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 04:40:58 -0700
X-CSE-ConnectionGUID: krn1uxlYSnOFz59/t7vLZg==
X-CSE-MsgGUID: TtbXcLf7RFmSY8I5e3uSUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
 d="scan'208,217";a="263456395"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 04:40:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 04:40:57 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 04:40:57 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.65) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 04:40:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gGRYC5SRgy1+FCKkcpHz9GpplIEkDmnWO6dfKx732pI7q3Yc0ql5W6xKgpoBiW4uBvX2xLTWZCF0uTEBzUcKPHaYqsetPqerJRKPwpa4Jsh+uYJKPCoWzCGivf01pEcbJ+5qPIPUfqi3U+Pbj8ZF2fmHzklIGyfG9P0iApoXGTq3enAbC4TiLmM1y/xjuaL1IDyz9DgPfRSpXeAhblTMhQ3Q12wB4RXty4IcjPdy3R2tiAAjXJdDSfZNswGK+ru67mTggFUAlqmOSkPOMb23SDH9c7dOMWZxeMJCJSbz9ELokMFWhxqCgvR0Dy5zPkY9Bkt6i/oEvnl4Yln/xt5cnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vhfp/uo0WzdyVu7KSdphvNhRBAGm/bINyASADKZWV5o=;
 b=uwFa9yBbTEtwt5PBNhovrteZ7acEbmAndV+JQ8PGZ6N7hhCoc4YPgitJcRyj8S3j+NBlr8WB+cTUtx69JmDeHDauHNiojW3228hvProplqiZuWa3h10GS6ye61I7rCBq8oGZzm0GUvkUIte1VhT+J2aeLNgjOD5VdvX+/F7XsCZj44Rrc9ZSiUPr9NXUo5bRmEa2Nk4Znu1nThZ0GoVlot6MnWt1EoIhO/tOOHH89luSvDoXUYtK1rXWm2sW5uX2OFzhkCvHUFCMkOZdSqLJHp+1ZoQ+nwlMkVS0Q/JFbMq+O8WpmTc2ydVz2B7PwsQyXc5Nk6lc6IlviRql0t+4Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by PH7PR11MB5982.namprd11.prod.outlook.com (2603:10b6:510:1e1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Thu, 13 Aug
 2026 11:40:49 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0292.024; Thu, 13 Aug 2026
 11:40:49 +0000
Content-Type: multipart/alternative;
 boundary="------------WTTFYcN7CWTEs5opoX0aIzAF"
Message-ID: <f203ca92-c042-46e1-be7d-773f63d9bb5f@intel.com>
Date: Thu, 13 Aug 2026 17:10:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 23/32] drm/xe/survivability: Report 'Runtime Mode
 enabled' status using SIGID
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro
 <riana.tauro@intel.com>, Aravind Iddamsetty <aravind.iddamsetty@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-24-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260812191450.11690-24-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MA5PR01CA0094.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::17) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|PH7PR11MB5982:EE_
X-MS-Office365-Filtering-Correlation-Id: 836da960-0b97-4204-6857-08def92fb868
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|13003099007|56012099006|10067099003|11063799006|4143699003|8096899003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: J4eFKfwObi16ldLWmu/iqLljXmJwf0cGuhagj1DNkEBeDAzMOHNL3m0S/is3vc48ZtuX79gub8aM9Z80VXPgkZ/JR5IMYnz/lA18gzIP3Nropl+qFass6VcznYdf4147NrderRLCy9qBAFCYnWbAo1lTtzsjEU4OhyEOCwDl7KD6EmaGMCN3HTqRkr15qKTS+u/N+4JeMMBlcBsFywUu+1aDmVZsCAllaEl5Zm4s4TTrOGiinRomoh3T16bBXfGoanhfv0YuwfWb+emwB0xPCSvy1HjCF779sv3vlgqDojy6Rcm5fP1I0/6A9KME35WR5Ju8D2af01ZN75Ds+TR2oxGf6IZqTI0q8gPb2L2lho+11EX4hUrWS+oG/qfZc22q7kHmBr2GrNqvi9QY67b2DOQCgpTMW84x41tm/BMkRZyQdHl8DZbyiWclO8HR9WxGA0R4nP+uEKtAPvWa6f4mS6rgvhSc9giNmr/ZeoybMPRrLz1CFGjnatQAj2xC/Wj3+legSm62sYueN7r+ET2RMvLJwkYL6lOCqJdbKCGx2lKgcuzj5yEk4mEzk6CL+Tt8Lks8fJuPkX6D4BtV2b7tIZ1tsZIXAistzXyvF3e82wI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(13003099007)(56012099006)(10067099003)(11063799006)(4143699003)(8096899003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVFwWW85cmpnRnc5WTUwU0Mvc0NhRmptM0ZYVEkzODhESXhrbjBmWjZkU3ZH?=
 =?utf-8?B?d3dyN3BhZWRpc20wanNuNk80bE9icnNOWk13RlhnQjJ2K2pSZGVHa2swMGNI?=
 =?utf-8?B?K3BJYUFHVjhYYU05MDhjcGFrT3ZyWXZrTlBZaW1xLzdvS0RoWHlPRHJIQzNL?=
 =?utf-8?B?TlRSdFBhdGpTRXlEU2kxSTAzK0lCdmpNSnY4QklobHZvVDEzTHhtYnJmRHRi?=
 =?utf-8?B?emliNm85TVdPUHZEczVlcUxVYWQySDFIZVMwWUQ0NmlibXBjY0R5dlB5aWNR?=
 =?utf-8?B?M3FnNzEyN2owWVpuYW8xTFdoM2w1RFg5d3crOC9TQ3BuMWVFc2VYNXBveXRU?=
 =?utf-8?B?NXVScUtXUTVjakY3S1cyQ09mWkI2YjF1cnN1Wkw1QURpRGpvb1ZocjJqZ3lK?=
 =?utf-8?B?R1RvK2NmS2FrMmsvM0FKdHVlNnVHb1pOS0RiTXFUeUZIcGhoVEIzZlpRSnVB?=
 =?utf-8?B?TVBidm1iY3g4SmxvMVA3NndFb001ZmFXNDg3dkNVd2xXU1ZvbnEremNrcUM2?=
 =?utf-8?B?Rnc2Z2cvQmpvWmxXRGhyRjk1RnlEaEJVcXVHVXBJTUNKRGdaYkVLUU9WdGRi?=
 =?utf-8?B?ekJkUFc5czczUVhXSG5yQmdtSWlLZDF1QmtVQjhrTVpKY3hnbHMxb3c5YVAx?=
 =?utf-8?B?Um9KQkRvTEgra0FGOSsvc2xXL0hWOTVQeDVINm5MQkdxRGdTdjBVclBydEFz?=
 =?utf-8?B?RkNLTnJ5amhaSmZ4ZFpKNkVLVGJCM3lMZFBUQi9CYTJNcTFVZEtsb25RUkh1?=
 =?utf-8?B?TFZyZWFVU3h2M0tVdm93Q0xEemhuUWtpaHNQRjdrbjM3dmJkSVBpUzJtc0Y2?=
 =?utf-8?B?YXVxT09XbEpGYlZOVWRTQUpkZHE1S2UvNlVCUlRDbmlyL2hXcWx3T1BZRFRh?=
 =?utf-8?B?dkQxSi9xeStMTExQdmpFS0d2dGVBOTBvak5aTDJLYnljdHBzSW80MXllbFZu?=
 =?utf-8?B?RGVSMFFPdjFHaERWVW0yWGdOaVpBVUgzUGRlTTFDcEZkVmpjeU5ERGNEbllx?=
 =?utf-8?B?RHBwaG5JeDFEMVViWGpaRURtMnpDR1FlZDRGWTBjQmVnVUtPbHNkWXZxbUE4?=
 =?utf-8?B?WVdnUnpvdGF4QkZlZnZJVGc2b3FLTGsvSXRpTkhCRTBHcmNpa0w5bVJpdm9L?=
 =?utf-8?B?UUVvUlNERzB4YVRrcVBINjFsSEtYUzlnUVp5bWlMczNiWnRiWE5WMWp4alJF?=
 =?utf-8?B?OUhxbWtIUVRNaEgrN2VJRUZRT1Y1cCtlbmY2YkdhYy9LRU42TDkweDVBbkNX?=
 =?utf-8?B?VUF0QWl5NGl6aVlMMFhvdFBIekdGVWxNd2RSekwxVWwvcDdOQmttcDk1eldS?=
 =?utf-8?B?dDd6b1Y4R0NjNzFwU2E1UTI5dDZyT3FRVkJKMkFKRUpUTnV4RmRjZDRWR2hW?=
 =?utf-8?B?WmtjVm1Dd3poTUcvRUNwOE5PKytBRnhJdUdXcisxZFl1SlcrMWZ6L0ZBVzRV?=
 =?utf-8?B?dU15dEs4c1dKYThPakh6bVpHWFdENmt4dGhORHhOZVMvMnEyN2pCRWx1WGQ2?=
 =?utf-8?B?SHlZeGlHdjNmTWZjMUNmaXFlV2pUWC9PeXdNc2p1NU5lTXROeXZMMFNPZHhG?=
 =?utf-8?B?SGVCZjI0elZkMm5OYWZhR0ZRWURBTVNNdisxUkRnN0MxK3hrVVdVMkV0V0Vn?=
 =?utf-8?B?TWNMbVpodmlvdWd4aW5FaWxseUZkdnNKNktQaXRJVHkvNFJYSHU2emN6T0JY?=
 =?utf-8?B?WnFBMlRpYVdmS2h2T0JNSTdLcDd3Kzl3RFg1UmoxL3JUb2JON3VCU1AzVmZy?=
 =?utf-8?B?RnFBM3EwTnQ2TFd3OVBsemYxZWZyWnhwVEdNSC9PYUlHblJjbmRNWlpick1G?=
 =?utf-8?B?RlRjNGxPQ3kvUCtORlNZaisrdHdjdGptbWN5eTRpS2owMkx2UjhEUnJybHg4?=
 =?utf-8?B?aXVoR1MvSkM4QW9TZEpjUmc4QWtFYXdpK2JpQUptSjhVZGRMVjBrQllIWVhw?=
 =?utf-8?B?S3ZRbjQ1TUlYSUJ1dHYwVklMYWEzRXYwWFRpNTU0d3EzMWlBWVJ2b3VJNUtk?=
 =?utf-8?B?ZmNtbWVYeURqMWpZNDE2WTdTZXJTRnp1Z3dnMC8wZGFSVGxrYytpSHExazQx?=
 =?utf-8?B?SEZyNzlKSy83V0JKQ0RTTHhjbXFrMCtwc0VxTVVGQlA4bjl3cXFlOWU1b2Fq?=
 =?utf-8?B?ekZHSjYwQXZuZDNLNVcvb3NtZFpPRzExUysvbHV6elJ6Sk9LZWhxTkFlakJQ?=
 =?utf-8?B?dSs3WnI1cFlqUnhVK29ZL1hmV043UG15RTVOQ3k1ejlLY1RPODM0MStTSkwz?=
 =?utf-8?B?RHMzUjZ2clNmOVUzUkVUWVR1R091Vkk5KytYVmd3QTEydTlDY2ROaDhEUk5n?=
 =?utf-8?B?WUJGajlIZitTMUhKZVhLdllaYlhkbFR2aUNNcmJiLy9QZWFhd1FJTWtBYnFw?=
 =?utf-8?Q?dnjLJCLEv/r1lHyw=3D?=
X-Exchange-RoutingPolicyChecked: j7m+DhlqE42E17p3JPw1SEuJ/PQ8/pgTvoKB5wL8HbmF624Z0HNZwVZ358voVj+rvZ5hSUTcCS3QVupnjcXsNidD8SdTR20rmJrKTfHGG4kkB4PeLjZeRrccW6ZAacQteKzolg6nwAUhvH1eKju/o4NZBOr+yukShtptI9JD3UZW4UW8tKnhd7vLYdIVt3wuwn/TP1nQj0U6seCWMUzceAo+7DLIQfWCrKzhPknHw18qnwDOfHv/luaUlRI58ZH+lRt+Ps4QCR1kBeY58PSXCUwRoX6dJNPSqZHd5LNMCCGv4y5/A6giDMhawpOukstyDCJhI3CfVMAtXJy5vM3CRw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 836da960-0b97-4204-6857-08def92fb868
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 11:40:49.1364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0vZhVo6w+085LiW2od/rM1c9Rk+L+pnDKfSee8bJAFceMYjReCdErTn13RJDdilTbxoNCCury5tPV3eB9yZYhHBgCTe01PhpPy/B+tY+fgY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5982
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

--------------WTTFYcN7CWTEs5opoX0aIzAF
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 13-08-2026 12:44 am, Michal Wajdeczko wrote:
> Report 'Runtime Mode' status using various xe_log() helpers.
>
> Signed-off-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi<rodrigo.vivi@intel.com>
> Cc: Riana Tauro<riana.tauro@intel.com>
> Cc: Aravind Iddamsetty<aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi<mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_survivability_mode.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index ebd288986c11..5d3315ac735c 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -18,6 +18,7 @@
>   #include "xe_mmio.h"
>   #include "xe_nvm.h"
>   #include "xe_pcode_api.h"
> +#include "xe_printk.h"
>   #include "xe_vsec.h"
>   
>   /**
> @@ -405,7 +406,7 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>   
>   	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe->info.platform < XE_BATTLEMAGE) {
> -		dev_err(&pdev->dev, "Runtime Survivability Mode not supported\n");
> +		xe_log_err(xe, SURVIVABILITY, -EOPNOTSUPP, "Runtime Mode not supported!\n");
>   		return;
>   	}
>   
> @@ -413,11 +414,14 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>   	create_survivability_sysfs(pdev);
>   
>   	survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
> -	dev_err(&pdev->dev, "Runtime Survivability mode enabled\n");
> +	xe_log_info(xe, SURVIVABILITY, "Runtime Mode enabled!\n");
>   
>   	xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
>   	xe_device_declare_wedged(xe);
> -	dev_err(&pdev->dev, "Firmware flash required, Please refer to the userspace documentation for more details!\n");
> +
> +	xe_log_info(xe, SURVIVABILITY, "Firmware flash required!\n");

IMO, we need to use xe_log_err (recoverable) here instead of xe_log_info.

Already mentioned in original changes [1], runtime firmware errors cause 
device unstable:

[1] 
https://gitlab.freedesktop.org/drm/tip/-/commit/a2ca0633a0fef925a0d8125d8f3e4495a5ecb310


As I know xe_survivability_mode_runtime_enable function need to carry 
errno as parameter to pass into xe_log_err,

however we need to create separate refactor patch for that in future.


With above changes:

Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

> +	xe_info(xe, "Please refer to the userspace documentation for more details how to flash the firmware on %s!\n",
> +		xe->info.platform_name);
>   }
>   
>   static void log_survivability_info(struct xe_device *xe)
--------------WTTFYcN7CWTEs5opoX0aIzAF
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 13-08-2026 12:44 am, Michal
      Wajdeczko wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260812191450.11690-24-michal.wajdeczko@intel.com">
      <pre wrap="" class="moz-quote-pre">Report 'Runtime Mode' status using various xe_log() helpers.

Signed-off-by: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Cc: Rodrigo Vivi <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
Cc: Riana Tauro <a class="moz-txt-link-rfc2396E" href="mailto:riana.tauro@intel.com">&lt;riana.tauro@intel.com&gt;</a>
Cc: Aravind Iddamsetty <a class="moz-txt-link-rfc2396E" href="mailto:aravind.iddamsetty@intel.com">&lt;aravind.iddamsetty@intel.com&gt;</a>
Cc: Mallesh Koujalagi <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com">&lt;mallesh.koujalagi@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index ebd288986c11..5d3315ac735c 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -18,6 +18,7 @@
 #include &quot;xe_mmio.h&quot;
 #include &quot;xe_nvm.h&quot;
 #include &quot;xe_pcode_api.h&quot;
+#include &quot;xe_printk.h&quot;
 #include &quot;xe_vsec.h&quot;
 
 /**
@@ -405,7 +406,7 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
 	struct pci_dev *pdev = to_pci_dev(xe-&gt;drm.dev);
 
 	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe-&gt;info.platform &lt; XE_BATTLEMAGE) {
-		dev_err(&amp;pdev-&gt;dev, &quot;Runtime Survivability Mode not supported\n&quot;);
+		xe_log_err(xe, SURVIVABILITY, -EOPNOTSUPP, &quot;Runtime Mode not supported!\n&quot;);
 		return;
 	}
 
@@ -413,11 +414,14 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
 	create_survivability_sysfs(pdev);
 
 	survivability-&gt;type = XE_SURVIVABILITY_TYPE_RUNTIME;
-	dev_err(&amp;pdev-&gt;dev, &quot;Runtime Survivability mode enabled\n&quot;);
+	xe_log_info(xe, SURVIVABILITY, &quot;Runtime Mode enabled!\n&quot;);
 
 	xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
 	xe_device_declare_wedged(xe);
-	dev_err(&amp;pdev-&gt;dev, &quot;Firmware flash required, Please refer to the userspace documentation for more details!\n&quot;);
+
+	xe_log_info(xe, SURVIVABILITY, &quot;Firmware flash required!\n&quot;);</pre>
    </blockquote>
    <p>IMO, we need to use xe_log_err (recoverable) here instead of
      xe_log_info.</p>
    <p>Already mentioned in original changes [1], runtime firmware
      errors cause device unstable:</p>
    <p>[1]
<a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/tip/-/commit/a2ca0633a0fef925a0d8125d8f3e4495a5ecb310">https://gitlab.freedesktop.org/drm/tip/-/commit/a2ca0633a0fef925a0d8125d8f3e4495a5ecb310</a></p>
    <p><br>
    </p>
    <p>As I know&nbsp;<span style="white-space: pre-wrap">xe_survivability_mode_runtime_enable </span>function
      need to carry errno as parameter to pass into xe_log_err,&nbsp;</p>
    <p>however we need to create separate refactor patch for that in
      future.</p>
    <p><br>
    </p>
    <p>With above changes:</p>
    <p>Reviewed-by: Mallesh Koujalagi
      <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com">&lt;mallesh.koujalagi@intel.com&gt;</a></p>
    <blockquote type="cite" cite="mid:20260812191450.11690-24-michal.wajdeczko@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	xe_info(xe, &quot;Please refer to the userspace documentation for more details how to flash the firmware on %s!\n&quot;,
+		xe-&gt;info.platform_name);
 }
 
 static void log_survivability_info(struct xe_device *xe)
</pre>
    </blockquote>
  </body>
</html>

--------------WTTFYcN7CWTEs5opoX0aIzAF--
