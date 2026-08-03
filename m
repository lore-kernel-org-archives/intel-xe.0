Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16CB3C55184
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 09:53:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B82BF10E02B;
	Mon,  3 Aug 2026 09:53:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PM/0aBN2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E824310E02B
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Aug 2026 09:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785750817; x=1817286817;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=VyLc5Vml51nsS1azAE6cYGH8OfciTFGP0rM4HqLCNGo=;
 b=PM/0aBN2mPSRD+QLFToS5hOFL7tuKAYEbwFUIEdCffVtBmxgQOF8H218
 khbZNEsO54xhORSwQEbcystPbG/oUxwkVznGG7D7zRSqwP1rBYdw9klMy
 +OQNq9UVOniUgsKGT1BipZ12svOVwG9Cp+mj/ILrAlMTYSlh/vPO5LJ2v
 pH9DgPgVIgHMclK4Wj96qf+SvBxOCe24I94nEG8svjfeW+BM8OZJc5H6L
 9GTuWJPiiS4MdCkluP9y/6qLl/8dKS5zjWmRUVnW+IY2jaOuhKHd6mDmg
 OkDEg1HrERq1Eubd52IrBhYEhm37LkfSitdTeEyN25J8tiAd5bP7Xw+k0 A==;
X-CSE-ConnectionGUID: nHiE5yAxQDGwsQn0tIUIfg==
X-CSE-MsgGUID: KBA15WVhS0e2owh1aNsFKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="73819827"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="73819827"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 02:53:37 -0700
X-CSE-ConnectionGUID: OOX546mtT/qTfuGlJZqGQg==
X-CSE-MsgGUID: uLkPEoqRSQ2Ck5IAuDE2ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="263164116"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 02:51:45 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 02:51:44 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 3 Aug 2026 02:51:44 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.45) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 02:51:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ay2kTSBSkL689xkiKPFioz1uYpsjI6dxRShIzBvDeR1bV7aOuDuMLPPhZFvNLUM7McjzAELY1oNWL2a3SbYtCw294L72hRzO7HmC+CHuuoXI+niYC6S4XPnR2b4pck1TOunLAlu2QiUd3sSs7jNB1EiVCqHSYjsQ1tOFUzLqgGSABhnExthAlXArRuYoTMxDi6d+yZ3rl6XBWP/KNDFkAzbk4mC7LmXDKZeOHdCJyOjLxLlsZCB5As10M0PLxhuhgNB+kafZzXKlwXl3q3kFXNWueitGMd06il7P7Ec2XeKWY9W1qcU/jpPRAbC+53oTfNWEnwIgj8vWXoyHByFcoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqIU4fS48EUOedufgQcPljyqKKvLlJilUTM8J8WJFTg=;
 b=RtPbGPsOKfUXJNTNx4D/FqIctVuiZcd5sVvjF3D7pFP2YEpOCMerIR4Qbr/dwHWTCAQxm9DCKM4lHcP1+g4O9nHU+5+BO8lf8fRciQqvc//Q/V5cKhT7PqUhclwWHRRXW+xymXBVIcwhVP2xYlwZdPGdAWZQob2WjncnB+FCrDcF2QW3AzBalCYj2fZ2SAhE2HeSIsxV++0pc9CVhDoGc4oYwsXUmZr88poJUgM9Ybqf5Hp2u/ffPWnppMCbmFG7igUFV5pO1olaQaZCAOqz+dwdt2znZQPVRB1lBrsPKgdSU7E30vXc+bzDJv0ZIHIjTHVCWFYe53E7nvrTAPNAeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 by DS7PR11MB7857.namprd11.prod.outlook.com (2603:10b6:8:da::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 09:51:37 +0000
Received: from IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::6021:79ca:45d2:ae46]) by IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::6021:79ca:45d2:ae46%6]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 09:51:36 +0000
Message-ID: <d037bb05-ae22-4e4a-b130-da4418d8de48@intel.com>
Date: Mon, 3 Aug 2026 15:21:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/ras: Validate sysctrl response
From: "Tauro, Riana" <riana.tauro@intel.com>
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260722143142.675658-1-raag.jadav@intel.com>
 <23532ff4-498b-4d43-ae79-a1c4326491c5@intel.com>
Content-Language: en-US
In-Reply-To: <23532ff4-498b-4d43-ae79-a1c4326491c5@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0040.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::13) To IA0PR11MB7955.namprd11.prod.outlook.com
 (2603:10b6:208:3dd::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7955:EE_|DS7PR11MB7857:EE_
X-MS-Office365-Filtering-Correlation-Id: 4917d559-cd67-479c-754d-08def144ced6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|10067099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 56AG0g06cODrXr8JhgK6MKedxSeyqqWMwjKEXpuYgdODQcDFyByv1m0bLa2UBmQaqIQFCORCy0b9S5eS7BBnIV5VpVozq42cxM4OJig70gUal4wiIuAY9nPUwqdN6TddYDapbaBnCqvx8/XXuguXO8lLMIxpRwtsW46t28KgJuB7Wfoy82RyIHPFdDQ5YGN/u5ukCBGUIUpwT8VLsy4RjqKhzLnenNaDSXDoZ0tiUIkklSaxltMbMS9PU/82Lu4SmkUvL/GG6c4hqxA/sacb3Q8VNRVnZ2vZMrmI+9pZ8V1vnHbAbvf/I6RUB6AL8chOUPxHmEmo9B3i4hvUBJoemgbCMkkFzivr8SC3D43c2QubHRd12tdmloHc8+GkhV2ap/68acVVHk6trYyyWfq8lspHTwtbTiACYokzpLfLLb3XF8ZiL2YKOJhLL8Imh3sKa+2QzcIU83VXBiofa++rOViH513y5dXwmObINrF2ern08cRlmzvkHbCsg3wLLua/rJjEuFD1598y/FxVXK0Yacqux9aGOpUb6lLhT1Vzj1EsKC0Gi3XBbQrN1LBFf1Bvz+GS1D/vN+pZd72BshIarcTRUpK9Wv15L+RhR6WAHWF5ACA3dXwBhr+moUKriEcLHKdROLpf1QiGB+jvuTDOqwy2UyU/tgDbTYSg9CmkDu4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7955.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2JjRDU4MFYwbnpMWFhaWDhxazdSazJZU1BJdGtrektQMnoya3J2NG8vRGRN?=
 =?utf-8?B?MkExWjZzWDhNZEFxV3hSWHBPZFpCNGFva2hqYU90bjVaSUhodGwremZub0h3?=
 =?utf-8?B?bEtBT0hsL3FTbTFGZ09QMFF0dG42Wk1xWitDNUxRaVMwODJ5a253R3A4S3VV?=
 =?utf-8?B?OGZaZVFjL3dOK3VuOUhNdFBPUytwUDlxMzUrK1VVN3NwZk1COGVYdGxkNk5F?=
 =?utf-8?B?TmljUUREeFBIRllaKzdPS1lnZXJxSWdVYVRIU2x0WjBablFxbWxjeFdNS1Vh?=
 =?utf-8?B?M28rTEpnVWhQbkxvYlF0OVZlQldoMGpkbDFCdUFqZ1F5a25jd2hhbE14ZjQ3?=
 =?utf-8?B?SGc2Mm9WNE9ocW9wNWsycm9wZURJNnJ1cWxrZjBSYW0wN2pQa2lhbEpwbndU?=
 =?utf-8?B?OE9vRlM3VjgvdTBabzcycCtwNEkrSm1OOVUyMWVscmQ0L2srMCtObm9kYjBH?=
 =?utf-8?B?SGNad05yWUtRL29yamlnMnZrVE1TTUo2SWdJeitWS1ZOdUFqZy8yV0FNT0ta?=
 =?utf-8?B?WjVSSFVPa1p6NlJ4V3N0WkJWc3h4K3VybUxsSHRDd3dXclNoT2dQVEJTSTdU?=
 =?utf-8?B?WjVhcFVUUi8wUDdnaWlKL1F0bVNEZ0hVcWZUQjBIMWtFTUpVeUk0ZExiL245?=
 =?utf-8?B?N1RXVGFkenQwb3I5R1c3MXVMc2tDUzEvZ09ROGF2VFp2bGU0R3ZIajR5cGts?=
 =?utf-8?B?cmZVcnB3em04bVpQUXA3bWJTMjlHMFI2L1NzYXpOY0FUK3Bnd3hETjBrUk9F?=
 =?utf-8?B?SWJ3L3M1OHFJNVE3bDM0a2pnNzlOUUs1UWVUZWdtVFJpcHNRUmxVUEVDSDdN?=
 =?utf-8?B?QjdTN0pKUDBCNkhpNzJVOW9vNS8zVUVnVHpsT244TTZBcm1ZQ3UrTG02Tm5W?=
 =?utf-8?B?bzdibVV1UnZKOFBaVStWOWR6VjVSb2xLdzlPbkdNZFJXRDVBVzduRmFHV0Rk?=
 =?utf-8?B?R0lWaDFSa3RPWUNyL3IxT2VJbEwwWGZDRm81S0xUN3IvUE9Xd3NlT0VCWWVN?=
 =?utf-8?B?RkEwOG9Ldy9OYk1wdjNtZDNkQzJ3bVZYREQ3ekxxbUY4b28xZ3RRZko4d0kr?=
 =?utf-8?B?cXh3QTBMWjIrQlB1bTR4YkRnNEY3aUJRb2FNelVpUzBrWjVJREdDZlhqRUo0?=
 =?utf-8?B?MSt3aUJEYlBZU2Z4RDVhcVlTR0F6MCtxaS9RYThDWGc0eWh1dDBXUGh2eUNp?=
 =?utf-8?B?YWZESlpIcVdWYnV2dmhrVENwY2xBejZaUjUxQjVEMk9tUFJNUld6d0xraWFv?=
 =?utf-8?B?azczTzB5Y05GVDFVcFdMaW4zWFU2dlFNUEhXZTR3ckJsa1VDN0tGKzlDYndp?=
 =?utf-8?B?UVp1anA0RG43NTFsNEdtdVVjem9yZVBPK3BpU1Zyb3IzTDBzbUVLMUc0bkpN?=
 =?utf-8?B?UWpyOUR0aHRkclFlZ20vYkh3U3lqM2dhWTV3b0NrbnJFZGNDK2Q3ZFdyL3Zh?=
 =?utf-8?B?UFNCU1AzUy9SZERMajdjb25zYXUzUy9KZW4zNC9oT0xVVUEyZWFlSDMwMkRq?=
 =?utf-8?B?T1VNK0o2S2pDaFhrVlZHSnNDMVZUYjc4YUlyeHdXUGJVUENtSUNXVisxdWZt?=
 =?utf-8?B?d3FqejQ5c1VWQWluT2YvVkQxem96UkVXUm9USWxRc3JZYWVxbCtnREVLcnAy?=
 =?utf-8?B?b2ZLVUZGa1pvdW50S2N0SGVCQW9EbjFkayt2Vlo1bWxKNkUwaDZDWVprbmRm?=
 =?utf-8?B?cTF2TGMxVHVYYU1XdW1LbTBkKzB1SU9iTW80aG01OFQ2QUw3cFd1QkFhMmlN?=
 =?utf-8?B?TldKWW9ZcEdRY3ZWbW5FNERXZjV1QTFJb2FoRG51UHczRlU0OUZmYTlZbCtz?=
 =?utf-8?B?NlhFUGJ0Z0VWeDZ4ZEYwc0dnMEhHUXdOelFLYkJCMW90c1Q0MXNVbk5sek5M?=
 =?utf-8?B?OE04RW5IN3pYc1V0NzVKZ1M4YWNkV2lDUHM2MUcvU2wyNmUrcExtelZYMlYx?=
 =?utf-8?B?YmxEZ1l2ekd6TE1IakxLVDd5N2VZajdCMjdhci9vS3F6RzJOcVBlT1hLb2RH?=
 =?utf-8?B?Y0VRT3ptaTdxa092RjRVWGVoak1hbjdmVzY1Qnh4MW5kSkdnanpxdGw4c1lp?=
 =?utf-8?B?N3FCR3ArQ1hiWGg1NkxoVUsrOE5JRUNUK3Z1UUNaRThUVVcxS1NPTEQyKzNu?=
 =?utf-8?B?QmYyL3BVeFlhUXFocnZORXVhUlBNRkJMbitiV1piZ2pPS29yMUg3STBsMlpz?=
 =?utf-8?B?MlBvVTlSdHVtdm1DQ0x5aFJjQ3NQaWxRdnNoTGZLL2dmZWQxdjd3MktMSTBz?=
 =?utf-8?B?WDB0WWVuLzlKMjdLNU5nb1hsRWUzL2pxMUNmTWJHYWw3Nlp1TDI3eWZxdjdj?=
 =?utf-8?B?empYaW0wSnJuNEt1akZzemd6bTNpamdFMkJnU0wyS1YvYUxSbDB5Zz09?=
X-Exchange-RoutingPolicyChecked: tL8lLDmfxKS0YnIvGp4EDTua5GRS8435YjMGqsRWwD2HeYvILnatUlv0nw8Nm2W4OxqUDsCgsVtgW2rvPIIobOYarRhEF7qHHfYVq7Ua05HHleLkJNuMToZfzeVtNLG3xJzpgBEKzQgKE3ijxrB4Au1tJwHypMddE59fJfjdcxZTXwttFpnF4ldeFIT6xjMxgdkHY6w3GCu8HAzgZvOqgFTFjRTeifg6dhodZDa7L0/6orB91NV7VPPVM9SYwvTfgJTv6dRl+XM4l06+PJFOvJ0S+PCHz8dIu1Y0CrDo2v5ePPNw1oAg6Lh+6GnuaakqvLJLPeUcNezmCYqqRVANTw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4917d559-cd67-479c-754d-08def144ced6
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7955.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 09:51:36.5761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I/QLTxxid/tLtsFWTLNm23pTRV6d7iRRMSTOJgRf0tejQ44KBZWgTvw+er7qClsVUwN0qn8okS4Pw9ThDRa4jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7857
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


On 23-07-2026 19:59, Tauro, Riana wrote:
>
> On 22-07-2026 20:01, Raag Jadav wrote:
>> Validate errors raised by sysctrl firmware instead of blindly trusting
>> them.
>>
>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>
>
> Looks good to me
>
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>

Thank you for the patch.

Pushed to drm-xe-next.

>
>
>> ---
>> v2: Continue invalid uncorrectable error case (Riana)
>>      s/error/counter (Riana)
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c | 30 ++++++++++++++++++++++++++++++
>>   1 file changed, 30 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index 5e294e9f8f99..28123f08e513 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -156,6 +156,24 @@ static inline const char *comp_to_str(u8 component)
>>       return xe_ras_components[component];
>>   }
>>   +static bool ras_counter_is_valid(struct xe_device *xe, struct 
>> xe_ras_error_class *counter)
>> +{
>> +    u8 severity = counter->common.severity;
>> +    u8 component = counter->common.component;
>> +
>> +    if (!in_range(severity, XE_RAS_SEV_NOT_SUPPORTED + 1, 
>> XE_RAS_SEV_MAX - 1)) {
>> +        xe_err(xe, "sysctrl: unexpected severity %u\n", severity);
>> +        return false;
>> +    }
>> +
>> +    if (!in_range(component, XE_RAS_COMP_NOT_SUPPORTED + 1, 
>> XE_RAS_COMP_MAX - 1)) {
>> +        xe_err(xe, "sysctrl: unexpected component %u\n", component);
>> +        return false;
>> +    }
>> +
>> +    return true;
>> +}
>> +
>>   static struct pci_dev *find_usp_dev(struct pci_dev *pdev)
>>   {
>>       struct pci_dev *vsp;
>> @@ -327,6 +345,9 @@ void xe_ras_counter_threshold_crossed(struct 
>> xe_device *xe,
>>           severity = errors[id].common.severity;
>>           component = errors[id].common.component;
>>   +        if (!ras_counter_is_valid(xe, &errors[id]))
>> +            continue;
>> +
>>           xe_warn(xe, "[RAS]: %s %s detected\n",
>>               comp_to_str(component), sev_to_str(severity));
>>       }
>> @@ -358,6 +379,9 @@ static int get_counter(struct xe_device *xe, 
>> struct xe_ras_error_class *counter,
>>           return -EIO;
>>       }
>>   +    if (!ras_counter_is_valid(xe, &response.counter))
>> +        return -EBADMSG;
>> +
>>       common = &response.counter.common;
>>       *value = response.value;
>>   @@ -422,6 +446,9 @@ enum xe_ras_recovery_action 
>> xe_ras_process_errors(struct xe_device *xe)
>>               component = arr->counter.common.component;
>>               severity = arr->counter.common.severity;
>>   +            if (!ras_counter_is_valid(xe, &arr->counter))
>> +                continue;
>> +
>>               xe_info(xe, "[RAS]: %s %s detected\n", 
>> comp_to_str(component),
>>                   sev_to_str(severity));
>>   @@ -532,6 +559,9 @@ int xe_ras_clear_counter(struct xe_device *xe, 
>> u8 severity, u8 component)
>>         counter = &response.counter;
>>   +    if (!ras_counter_is_valid(xe, counter))
>> +        return -EBADMSG;
>> +
>>       xe_dbg(xe, "[RAS]: clear counter for %s %s\n", 
>> comp_to_str(counter->common.component),
>>              sev_to_str(counter->common.severity));
