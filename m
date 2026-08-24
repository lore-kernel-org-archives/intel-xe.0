Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DA1C5DF9C
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 13:03:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7206410E7CE;
	Mon, 24 Aug 2026 13:03:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mJ3knmkL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D60610E7DA;
 Mon, 24 Aug 2026 13:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787576593; x=1819112593;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LQ2omUQb1GVrAtFmiESa2li6y2fOXCZ/Bzi7aTn4r4Y=;
 b=mJ3knmkLgJWn0YXA7THIHJTtxZuina/oLbDOpXAczxhHAgOD8xAZesuZ
 wIXEMFfiW4AQHIzJsnepTComxiiujCwZhA1MYQvJsz/GU1P+Ku1AF/3Fq
 TN0JH5FeDg8MM/ikOiYRB29pS5uAPP/6RAwZLgWwxXiV+0fG2hg/PEEVf
 RQAy47O93EzhQx2Hh9EyFGen0aZHWw8aysjGt7KxCLK70rm0AtO4smkUu
 iVy60OTkunczVn4AQMkgyXoS/9UXnoPSYka5sknQoQnuUY6QRO8k786OW
 jCjxWG2RU072vH3mfffm4Yr3sFzaRQYaSdoip1xxAqD3qjAyKVQTgJWQD g==;
X-CSE-ConnectionGUID: sDUMcmxDTQmFqMGWjZ2/2A==
X-CSE-MsgGUID: uKkYb+WYQW61TdkalLvK7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="99550746"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; d="scan'208";a="99550746"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 06:02:59 -0700
X-CSE-ConnectionGUID: jsObSXpXSoqVIH2/bIJybw==
X-CSE-MsgGUID: dpxsnyxMRSeJ31ykHeEDDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; d="scan'208";a="291841044"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 06:02:58 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 06:02:57 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 06:02:57 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.35) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 06:02:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AfUQkEbHS1K7cUoGgJA3oh+x/GX/cZCPkdX3kqaAtt0DkrA2LITv6n5bifhB99qO2iBPR5fT/RtonHwohRRSoGzIB2a9ZT99hSY369fEjUrzAJX2kQqwJ3WmyMfpEqivQFAylQpfzPdcpzRsQANGhpKfelHG21fN9EBv8rgtr9IrnwxRtiYq6oMqLWr2Pg/B5bW+v+ptiFiTgy2i47ziog1rvLe9sj67suqZbasudLltuQNJPZGMjTql+HYFAC0ajCu8qo5Oz/Q+v2FrXz2vOqXwBvTsy3bLn72m+cQUFMY0i9AKIC17dLf6fTYksjuj2dWQQ8rMbKSV9MOs4Zbf7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SlUVc5jAKpfv9NrL7G9WekqpSKnRy1ovePs1TjBL9vQ=;
 b=HELfGMGexgkQp5nx3aeHm4SNeLLJe8sL+xGODYxbySmmu9K3bhMzHAf7ocoQDpAKlhG8Mte/nsz9+luFpAY0x+YKn2ra3UViwKx1Idn0uciplP705mr+Z607JQ1XmNJanwjsCP8POMJpc+RueiSRdMrLGwaNH95PXxNT1ambWANgf+pcRd8THCuggT/dPTLvMfjGtdENgVFW75OEab5w1Q9KD6P8gfn36GdYdcSp8irWJKW4SnKuLOPIDzpknFN+upZTlvLQbyWtq/ahTKrQ618TBR9SRGcCMV9gH20WBYRduhGW1jtpcN3+H0pUEQK6JY3MLKRHBni9353ACsRjlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB7554.namprd11.prod.outlook.com (2603:10b6:806:315::9)
 by DS0PR11MB7530.namprd11.prod.outlook.com (2603:10b6:8:146::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 13:02:54 +0000
Received: from SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b]) by SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b%5]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 13:02:54 +0000
Message-ID: <b0182f9d-6419-4c50-9e62-059c1410d5e2@intel.com>
Date: Mon, 24 Aug 2026 18:32:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] DP-HDMI PCON DSC fixes
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 Alexander Kaplan <alexander.kaplan@sms-medipool.de>
CC: <suraj.kandpal@intel.com>
References: <20260811044234.593986-1-ankit.k.nautiyal@intel.com>
 <24f46bcc-5c4e-4a4b-9f91-895adb2ee1e5@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <24f46bcc-5c4e-4a4b-9f91-895adb2ee1e5@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0297.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::12) To SA3PR11MB7554.namprd11.prod.outlook.com
 (2603:10b6:806:315::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7554:EE_|DS0PR11MB7530:EE_
X-MS-Office365-Filtering-Correlation-Id: 53ebc769-46c4-411a-0238-08df01e002de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|6133799003|3023799007|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 7Oh5xN9mN7IsNe9xO5LClhOxAHuVI1Zu11HIF3awVkhM0T0P7OD692Tl3eAAn6dMZis0q/pVtX1jKZmoQendUFwsgxV777jC8fCsSmKnnY1cPTqvbvjxN4kJA2F4VB54ZgxhepaZnHXxHO2Mcsk8kufvhiZgKsOtqQqnrZwJvC+BtTlX3GLWaWvWLosp0zoz+JdzvlOkRm1beMAkC7KWgcHXw4x4XWePfDcSOMgrcRSumhqIVZkcXlal/iBxWsCZ1bUtFGE2DkFNQhTnrDsm2ya1VtERzPR1u4I0yXi1zbW3Mxngvv0SrIpJHqSMzzoWnz1/zypLdRp7J6depvowRGQYvF6g3jUspO0sdfqeMPXe3Vnp1kexFL1d/Cs38TPHJ/gLiLpCt9JQIUmYOYLulc3GJCPpVmFAIY5Kn9FbC6omaiXaTTI7+dazZ0AOmzLsr36q/WSiEr2/1qng9BG1nGRB3sCeAfjtSxN9DYUI5Me5UoghmG+jcq5Y1Gsal/JdrO5sChcbMoAmjH8rcY4o2jpiBvtYXUNztKie3Abj5Zt8YAjMgarlzzzXAmZXxgqnTzcIUpyWxE6eaOV/BOLyLbzyok9TGSkdD7ivjePsqmSUkMZSj0M5vhJIRZNtIbe26Hza98VSbT8Fu5xfmqLPWGaw6c+qbr9sTlIE5sxPHZM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7554.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjJnNkRkWWcvKzR4Vm5NOGdPT0RudVB3dWlVRkZGcDJianFROUhsK1NsdW9N?=
 =?utf-8?B?cEMvVk51U2JiRGJvaU1TOUdUOUxxdU5ncC9pZXdTS0I2a2QrNENXd0FGbHdB?=
 =?utf-8?B?SE0xNm1yM0tyN0pRZlgvS0pVZERpSDZSZFVvT2NmLzVJN3JqbXMwZnpWQk1Z?=
 =?utf-8?B?TmpaU0lnZnpKTVF4ZXJteE1EeUNOWXdyb21KRnhRUGl6NWErNVFCMnpxVnBB?=
 =?utf-8?B?NXd5cFpLYUpHajh4TFFiNUV3TEN4WUZqWXZTZ1dCSkZYTGYyQ2hJbWxvek1M?=
 =?utf-8?B?bXZpUFN2TVo5REFXeEdHQmp2TDZYZnB2a0N3M3VGVGRzQXBicnB6WEhaK1FY?=
 =?utf-8?B?d0Zma0Z2TFhCYy9DTFcyVjhWNTlwWGJvMitHT3l5THBDaTI0UXBVaDZ3U2ps?=
 =?utf-8?B?UFIrQ3dhRld4YmxSV0VpOCtSZE5JWUJlQ1VVMHk5KzBPZDRRNSt5VUZmUUFr?=
 =?utf-8?B?K1ZwYmkvY25rR1dNZFk5SUtlYlFEaTZTN3VReG00M1lXbXJib3hTOTFpZmlv?=
 =?utf-8?B?NDZIU2VpeUFvNm45NDRRZzd4REV1aklHNWpudEYxUEo2ekwyOFBHT3ZpWHV0?=
 =?utf-8?B?VDIxR0hyS0YwdDRxTXhTaXhCL2g3cEJXOWFFQm0yK29TQzhOVlRMZHl2TzA0?=
 =?utf-8?B?VTFkdXZuVWduaE5Yc3RoZ0ZOQmNDVzhiRW9tS2NFSDM2SG1CS2UrZW9yaTF5?=
 =?utf-8?B?T05xNmJQb21nelk2d25xUWY3ZS94dGoxN3k3WkNMMjYyNkVmWEZwUFFaRGcw?=
 =?utf-8?B?Nkk2L0g1YXY4YnAxa01GdVlRcTZQOHJJclRjOFhUblk0blN4QmJiZndicksv?=
 =?utf-8?B?VytTK1lPK2RMUGJwbm92YXU0OGRKMXFUSjhidDlxOTJwbnVLOVR5eVcvOU16?=
 =?utf-8?B?L2QwcUNXVC9odmROSDljU2xGOEV5dmdBajgxVWhFRUNJckNZTjU3cFhMdU9j?=
 =?utf-8?B?OEkvRmlCcitISFAxL0hQTFFLN0ZXWUVwLzFUTGdkMFRWeHdodDFuZW5OSHNN?=
 =?utf-8?B?NFdYY1VhallVdUcwOHZzMVY1amJjQ3g3OVdNeXg3dW1KU0Q1S01UMTF4UnZa?=
 =?utf-8?B?ckQ5MFVWOHlaZTJIYnp2d21HS0dsM094bHdxZFZicGxkdmxPbU93cFRuc2tx?=
 =?utf-8?B?S2tpaUpoT3hpbWVJUzcvS1RmanlNN0pIR1J3MDdmRDVXcG5qL3JXRmFIUGZU?=
 =?utf-8?B?a000Qnl4L0ZFc0NIRzJYQXdPNmc3Y2JVTWN6a0lUQVVhNnVEc2ltUHJkMXpR?=
 =?utf-8?B?Yng3QmRpWkRiUVMyU0xCUWYxazNqOTRlaWZHUVFQMTZ3b21aU3JpTUM2aDli?=
 =?utf-8?B?YVZhNyt0VjlPOW5oTFNzMmxnbk84VmNCSjRIVDdJSGVVdkF6dStNS1RlVjhY?=
 =?utf-8?B?MlFCQUZwVVpvcERoWlN1SUluRGQwMVR2dTRJVEVQckhkRUJ3TXgrMUFQclpv?=
 =?utf-8?B?dy9zaXdSRGo4MGZINy9tZlRBOHBoNXdHMmgyajVSUHVVRjRFR0lVTG90bmI2?=
 =?utf-8?B?d1JzTVpzVXc1MUVwR0dSbi9lUWlVVXd1MlZMSzhjenZ1NWUweWx4WjZsOGpO?=
 =?utf-8?B?cUt0N2tSZmFWaDlnZC83RnRBdDZUNHhOT3I4ZUNDNE5kcFZoN0FHWkJ2SUNx?=
 =?utf-8?B?b0RwVkExeGJnOVN2TEdlSW85bTFZVlBtd2RJRUNKWCtUUjJqV0UxNzRyNHRt?=
 =?utf-8?B?QnVYZUpFaTFkT1RXWWhNNyt5ZUlnditMeXRPQityRHdyUVk2cnB1aDIva0Uz?=
 =?utf-8?B?L2twbE45aVhabi9CYnVZOGpjemNOdCtrYkhwcGR3eVdzWittc09QR1U2TEp4?=
 =?utf-8?B?dDZEa2VKcGtuMHJnaDh6b0ZSYlFaenBGSlM2UmVqTEpFK1ExU1dsK1dTRTJV?=
 =?utf-8?B?eEhGbXl4bGRUSlZJT3ZNYWMrRVUwM0UycXYvdFhaWmdTMSsyVG0veVhvRU94?=
 =?utf-8?B?SkFhaVYvVFFtWEc5dUEzbVFpaEVkUE9HZGtFdGdMZUhNaHo4WHdmaWozTzEx?=
 =?utf-8?B?RnVFQXZkQmp0aVQ1UWhreDNFNWNvUDlJSDJpZkJoaVRLMWk5ajN6YVlOMFM0?=
 =?utf-8?B?VmRQSmxwVVhMOTNqN2oxSm1SK25NQkVkTUc0UkVJYVpUNU81VmsyVzVOU0la?=
 =?utf-8?B?VmR5dmo3MGx1U1A4N1JlVmROMWJDR25rOC9WVE56OG8rbDlRM1F4UmxFSGI2?=
 =?utf-8?B?UUQ1VnVycVhpK3RaRDhQViszbFVpY0Yzb3FZVnM3MGhjVDBCTFBOY2NIMWdz?=
 =?utf-8?B?VW9HSitWVThiOUFiZmp4VWlvS01NaSt5dVRoVG9XS1FKbWtvL3JyMGt6ZTdC?=
 =?utf-8?B?akVzejZaZVJZS09FKzhCU0JaMkRQOFMxRk1SZktmbGpiQ0RjWHRiNm1rcnhh?=
 =?utf-8?Q?nRsL4RRWX7unpEkc=3D?=
X-Exchange-RoutingPolicyChecked: CxLUUbAb3uJIwXRHY6L6yG3+kH67SWw0GbK6l5F24YRH2zG1gweSFvzdxtZDyYEPf/1PZysYV01xCSnlrg07rNZLo+WwCjtWFVI0NuXktr0kaOkB+TvUzrEjh1wY0dSHT1OO3N0Ay/BZfadmxWjkVW3ANTSICePA284L9JesH19acBbBCKxKJJWbCwAc38q1L2AlD+wo7mMBBAznLDWFHnLF+/Odymv1aQV6+L97/X3T5nJuGmVlK10qYl3HMUC1bHQ5qYbgzC7U/c4TIdxYnhNceRzcw2LERzClangcPbxWCqriDWHcgbaCUllSemxdvyZqEDVCBfXucBNFhczXXw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 53ebc769-46c4-411a-0238-08df01e002de
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7554.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 13:02:54.5724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K2Hg4CD4rPsOayWNBkXWCbMNS6jn7jhsYHRxO1KSzI/0Aw1eHcM/f0KEMYytBfLFU/p+4aIpdY+T54EIrFz84W8VB7F5xg2jfNZ7kIy6zT0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7530
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


On 8/21/2026 5:08 PM, Sharma, Swati2 wrote:
>
> Hi Ankit,
>
> Tested on the NVL platform using the AORUS FO32U2P panel and a BizLink 
> (DP to HDMI2.1) dongle.
> With your patches, I am now able to achieve 3840x2160 @ 240Hz, which 
> was previously being
> rejected with a CLOCK_HIGH error without the patches.
>
> Tested-by: Swati Sharma <swati2.sharma@intel.com>
>
Thanks Swati for testing the series and providing your tested-by!


Alex,

Since we discussed converging our work on these paths a while back [1],

I wanted to check if you've had a chance to test this series on your 
Panther Lake / VMM7100 setup, or if you still intend to do so?

Your validation/coverage on the PCON DSC and FRL paths would be great to 
have before we merge.

Thanks,

Ankit


[1] 
https://lore.kernel.org/intel-gfx/20260703232737.4433-1-alexander.kaplan@sms-medipool.de/


> On 11-08-2026 10:12 am, Ankit Nautiyal wrote:
>> The PCON mode_valid path currently does not fully account for the bandwidth
>> limitations of the PCON <-> HDMI link. The DSC capability between the
>> PCON and the HDMI sink also needs to be taken into account, which currently
>> isn't. Furthermore, the compressed bpp chosen needs to fit the
>> FRL configuration, which is also missing.
>>
>> This series:
>>   - reworks the HDMI DSC helpers so they can be reused across the
>>     mode_valid, compute_config and FRL bandwidth check paths
>>   - fixes the FRL/TMDS downstream bandwidth checks, and allows
>>     PCON DSC modes through the FRL check
>>   - Clamps the programmed DSC bpp to the FRL link bandwidth.
>>
>> Rev2:
>>   - Rebase and address comments from Suraj.
>>   - Drop drm/i915/dp: Use FRL pair check for the DFP dotclock limit as no
>>     longer required.
>>
>> Ankit Nautiyal (8):
>>    drm/i915/hdmi: Split the intel_hdmi_dsc_get_bpp()
>>    drm/i915/dp: Fix FRL BW check for HDMI2.1 DFP
>>    drm/i915/dp: Add a wrapper to check frl/tmds downstream constraints
>>    drm/i915/dp: Use the common downstream bw check in compute_bpc
>>    drm/i915/hdmi: Expose DSC min/max bpp helpers
>>    drm/i915/hdmi: Add helper to check if DSC chunksize fits the sink
>>      limits
>>    drm/i915/dp: Allow PCON DSC modes through FRL bw check
>>    drm/i915/dp: Clamp PCON DSC bpp to the FRL link bandwidth
>>
>>   drivers/gpu/drm/i915/display/intel_dp.c   | 144 ++++++++++++++++++----
>>   drivers/gpu/drm/i915/display/intel_hdmi.c | 124 ++++++++++++++-----
>>   drivers/gpu/drm/i915/display/intel_hdmi.h |   7 +-
>>   3 files changed, 218 insertions(+), 57 deletions(-)
>>
