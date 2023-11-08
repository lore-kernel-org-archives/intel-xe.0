Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E3B0C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 07:24:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3057610E0B7;
	Wed,  8 Nov 2023 07:24:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0836610E0B7
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 07:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699428274; x=1730964274;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Q5jEKRcN7+0T7CxRdVLQOBmM0KGaJIjyNNPhWVAePCw=;
 b=L15Ou/AFkH+atKbzliKBB6elfXo6wzeJuuhNSe4Q5rm2HJSbjmQvsrJS
 RBTcc1xyIbCUIG6ahk7Dts98VUUdGmDjlifNLaPEMhegjgDDSlYiH9ecm
 Y1OEunguuJdFdNphdlkmzkpX6UXrNhHDJBouO4w9UN4CwA4RK6KkFp5oU
 LCvxXjFxsyVK7yvj1I1ZJGmy1kFDcY5GyvL/dAW09c0bBlnxOulEhG+Tz
 adVh38JnknnIpSIf+6CHhkd4k6kRegcgvh1LXG2TsJmJPFNLP3ZZ9sycC
 UvZuiTXJs214dIRqFNeaNPzUH5ijIpzZkrh7A8NWKWeI74Qfrjzaw5Ckm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="454010593"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="454010593"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 23:24:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="1010177856"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="1010177856"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 23:24:33 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 23:24:33 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 23:24:33 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 23:24:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lC4LLWYLsjiA6Nc1xqW5mPRmzbYbj895NaLprjH7VDL1t2Yo5gWN2JBe+fSVAKOeeWca+j0PkCvRHmx3KZsmR/ryaGK2CbXXw471ddk/pHPUuY097zHWV7rUU/M/NFcqAFtJMMw6cqkqoKmEADSsIE6AgHRoOGmkKwrDwlwRGKp7yylgYOgVx9t5/XvpJMCwWe+Tg/ZyWNnNQqsidQzpijkbPpNpOgVszFfuE58CDFcM6i7USiEesEVoV9UpkQVerUOWJ/KIMf00qgq8MXxwZ4lK2UMbmyAZh2Ij9K0zM0iTW5+p6WKF66t5NuNc0xU7qwpU5pU1P28WPsNNxvCWnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QN8ywGzrCkqDzH9GWpsbzoSukIhXb/ZkVNLlMVVh1fc=;
 b=mcovnfCiwcPm/tSKA7ZLLdYRKoQMRh3vmywhClCESDfXRwG4nCWNHY2iYiLHcIOYux+c4vj1Ui6WoGn5GZ9yzuIa25kFLim6CcoFX/7c40CJU8vt9Ar1cDk65VohGdXBBBQI4y1pCyxAXiVGkM8g5OXfUsd2IMhjvSQGhY+KaRnojr2Bb810WR4OLg3Ltl+n3HoCgZoDK1cDy71kB1swvRJATZt9D1R3KB0X+WIxkw8dE99u9bjIvf9QnUOlbh5YTrCxCKrjIbpk+GAzZTwJusmQtq3lEBBU4Xq0Bt8qg47apZ57b+VmkoqDk9ziPhNdkkNrRuXcpXdYPC/6s4nxzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8597.namprd11.prod.outlook.com (2603:10b6:510:304::22)
 by LV8PR11MB8606.namprd11.prod.outlook.com (2603:10b6:408:1f7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Wed, 8 Nov
 2023 07:24:29 +0000
Received: from PH7PR11MB8597.namprd11.prod.outlook.com
 ([fe80::4005:2e09:e456:6f4f]) by PH7PR11MB8597.namprd11.prod.outlook.com
 ([fe80::4005:2e09:e456:6f4f%5]) with mapi id 15.20.6954.029; Wed, 8 Nov 2023
 07:24:28 +0000
Message-ID: <09a91fb6-89cf-488b-ab79-aacb94b6ba4b@intel.com>
Date: Wed, 8 Nov 2023 12:54:22 +0530
User-Agent: Mozilla Thunderbird
To: Matt Roper <matthew.d.roper@intel.com>
References: <20231103054641.3311585-1-haridhar.kalvala@intel.com>
 <20231103161451.GI5757@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: "Kalvala, Haridhar" <haridhar.kalvala@intel.com>
In-Reply-To: <20231103161451.GI5757@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0070.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::15) To PH7PR11MB8597.namprd11.prod.outlook.com
 (2603:10b6:510:304::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8597:EE_|LV8PR11MB8606:EE_
X-MS-Office365-Filtering-Correlation-Id: b257ec96-c2ed-4137-2487-08dbe02bbe3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5C7wmwdG2yoBh38KTTIh1UxU+TPHM4t6Orq6SNMIPsT3FlrXV8RO0j5HmnPe0i53S2WQmPnEPb+qjyrsSlHhJo5LD5HMvHEV1fVMWjQHlLDMN9uMc2hdjYOzQWPdUy8vt1zmMMn1Lbf6zD3hx5puLPZT7PfophmxPytQbYBlnH/UMuqGjqEKDB9cyu1tRVgG49pjw0eNe97FTK9gvIjN6IGKuZvzrPLbHsXyL7MzuZLcD8Hn31eiqawv0N9BfcUuP8vrV3s/kmKu/StqCIcsZhMGgLc3qwbuEm3G5MLZ7bi+PNgfLDKSkMTiTZ3rSSSCMfhDCOOfFmZZGHC93KGcdX/m81nwMqxLTzwSQyOHfGNsgLfqa1D+71UBWIo2l2Zfrx6cGe4LGovlYAcXdfbB48fRgyZ0J55ERUTYlyLyM7WV8UiAS9yHr6lnt0R/xkEs8py4KXyQ9OWCbAfDRIhO3r5s3KYSRSXJg2OCs0W0ydW6OgzI+UnPVCFYSKA1etjC9E01kZPlUyYeYoI8hBMr+VYIqNE9c3PhArdqZW6Va20y9srlKQAYSUcjpol7pqiBCfvS2bIZSSjO6wvN+BNDc5GyGC3g2RWNr1nPvthCqXL+5nwMyjGv0Q/vcG3L7Upb/XrVa4EDaRahkujID8syVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8597.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(376002)(396003)(39860400002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(2616005)(2906002)(31686004)(6512007)(41300700001)(6486002)(5660300002)(6862004)(4326008)(8936002)(8676002)(86362001)(38100700002)(82960400001)(31696002)(26005)(66556008)(66946007)(6636002)(316002)(37006003)(66476007)(478600001)(36756003)(6506007)(53546011)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWR6NGJCWnVIS3EyeFdFazhDNGR6bzdnSWQxTjF4WXNVcjJwenNyb0Z2TVU5?=
 =?utf-8?B?VnBCRVVRM2J2eUFGNlNJakFNZlNjUUxXT09lbTY3VlVhTXo0NDVGdFFJNS85?=
 =?utf-8?B?QlZZdkkxdWx3cktsOGZRSDdrM1diT09yM0I0SGZPVWNCVXVzWDBiV1FmYmZx?=
 =?utf-8?B?amNxTGsxTFNWbU44RXBpL3FiQ2U1T0FPSTQ3Y3dvWlBJQUhJVHBKbCtXMDZQ?=
 =?utf-8?B?RElhekxUK1lMMUQvc1VPWXA2WDBTZWlmLzBnM0dJQnBvcjZCL0NOU1ZMcDFw?=
 =?utf-8?B?QmJWUEI1b01rekIrdGJjbTUxL3luWXdHMVQ3QXVmTWJqVjdRN0lUN1dtdk1P?=
 =?utf-8?B?aHNPcm4zSkNibU9KaWxPeVFRdXJxOUJJQ1dtMHhxbUp6SGNrT3VrdjU0b3hi?=
 =?utf-8?B?dWtoOHY1dVJvb2lPNFBhcmVidWV4dXZNbFVsQ1EwRTBxMVI1RTM2TytTTWZz?=
 =?utf-8?B?ZW1OekJYVFpLd0p4aUwxQk43cFFaRFVFMUloUWoyZXlCY1JtOW8yM1JzTnV5?=
 =?utf-8?B?bXJZcWx0L1ZLRW9qZGVpNFdUUUIzYTB6bGdaOEwxNDQva29vUkJOc2ZidVhS?=
 =?utf-8?B?YXM1Qmp4Y0VkTmgvMDRLUHdwM2pnS0NhYzdJV2dsRDVVTTNlMzIva2tBLzdw?=
 =?utf-8?B?NUV1dURMdjBWNjBvVlB3QkJpVjcvdHJMNk5MbXlBRExVY0FhMVVBYzlZUzBr?=
 =?utf-8?B?NmVWZ09iTTVvRldTWkd0b2RWMXQwcFZ2SWg2ZTBLaUFoWUM2YmltYm5iMVVj?=
 =?utf-8?B?cFdIWGRRdXcwUTJnbkREaHpSVWdUekQrNEU5UHZDS29XSnlBbXFMWFFVcWJP?=
 =?utf-8?B?VEE0NHp3Wi9zUVd6QnBuaDBHbHpNcGFxNnp6aUExTTFENWNnZjBpNks3QTRj?=
 =?utf-8?B?R3ExWU5IUkNBV0pQVVBROWdNWFVaMG02a3JBL1F5N2FNVTBzbXRiMTNsRkxL?=
 =?utf-8?B?MWxLNXhzSDlsSURNTytIUFhwRWg5Ny85cVFaTWZYOWlJZ1pCSnN0V3E5cDNz?=
 =?utf-8?B?SVhZUXl5L3EzRkNUS0lnTnhiUlN6Z3BlOGw4Y3VRQTk2R21nOW0xVlppdEt4?=
 =?utf-8?B?MnovN1luYXdiSEZEN2t5UWhCVUhReE1UcUlBSnMwZlpvR001NTdMc3pZTkQv?=
 =?utf-8?B?R1ZUL3FOb0wxeDFicEc2emQ5ZS95SEo5c0xRRXRzVVlWc3lvczd6NkpUUGxF?=
 =?utf-8?B?NmJ6T0g1elRIOGhKVjRiK01qUTViSUNabGFxVUdzNTdTWjdoUys4OW4xU1Jx?=
 =?utf-8?B?UXJ3dFkyRUVMMWFSNEJOeWU1dURwSUt1VGEyZ0Y2cVFvWkV3RUdIOTQ4cXVM?=
 =?utf-8?B?c0JHR1FxRlJoZytFV01BS2pxaWZsWit2M0x3bzBLR1NjRWdwS2Zmend6Mzd6?=
 =?utf-8?B?cGx6THpkMTI5THFZalg4cXd1cHFWUU1WOHZUYzNOUWZsSlNHblRhcGFiSlJh?=
 =?utf-8?B?Rm5jakMrTUFGbStpbGxWUURjVlFOWCtoRzcvSUNlZE9PYWNQVUxkbzBITUJz?=
 =?utf-8?B?S040UkpmVDhHazlCTnh4ZTJMTTJzWHNhSWx3bnZEYno2WUYrZzBPK2xVa1Zw?=
 =?utf-8?B?bTdvRmdTWUVQUTZ5Z3NVY1JjQldJd1BiQ1N4SldIYU12eTliemhrVXFkWFZi?=
 =?utf-8?B?ZFNONzlBLzcxS1dKYzVPejBCcmd1cDNHS2h2Q0xtZENWVndldlI5a0xEMGJh?=
 =?utf-8?B?V3VMYytvS0RpdE9nN0IyTjVUUE5RWTlrV0lRMmRTVDRNZGczeitLeUVpOTVt?=
 =?utf-8?B?R3VYT1g2OU1peE5VZjY5ejdkSGlaSmpIamRDWVhRVmR2T01hcTV6M3h4Q0Vx?=
 =?utf-8?B?MUV4cXRweVVZaXlGUHhHRzcxNElYbXFhRmxUUjNDV2p5SVNRS051MTlVZXpm?=
 =?utf-8?B?ZlN5NUVwNkRiRFlFTlJadDR1NW1zZW1kRWFySWw0QWhxdUlqZDJHTitrekFK?=
 =?utf-8?B?VzhUNWNNOE13MmFBakRaRk1KMzk2Qkk4eUNldkUyN1Y4aEphQUhzanJyd01O?=
 =?utf-8?B?d3p0M3BmUlRTR1JYYTNBNHJ6QmxPakxjMzRiZFVkaWovQ01sc1BiOVhQazIz?=
 =?utf-8?B?dlJZamxZRmNNTDJTSk80bEpJazU1blZxTDBXQ2Y5UWlvdzVJK2pVakpTaTl5?=
 =?utf-8?B?eFRhWUd2SnZRRnZCdTdQMzUyTzRRNDdPZk45T3IvRjNEREx3YlIxYVdNVElv?=
 =?utf-8?B?VXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b257ec96-c2ed-4137-2487-08dbe02bbe3f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8597.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 07:24:28.6748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cTRAZfeGhgMeMB7BaFL2ulKpXjWccTjO253TVgMaNkDOBCId87jxSsZkpUMN4oS1EwJ5/aQnMaweEhqPkW0c5Lw/l/6B56QQ5zxbBiIzYUU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8606
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Add Wa_14019877138
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 11/3/2023 9:44 PM, Matt Roper wrote:
> On Fri, Nov 03, 2023 at 11:16:41AM +0530, Haridhar Kalvala wrote:
>> Enable Force Dispatch Ends Collection for DG2.
>>
>> BSpec: 46001
>>
>> Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_wa.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> index 2f1782db267b..6b6dea233d80 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.c
>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>> @@ -671,6 +671,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>>   	  XE_RTP_RULES(PLATFORM(DG2)),
>>   	  XE_RTP_ACTIONS(SET(CACHE_MODE_1, MSAA_OPTIMIZATION_REDUC_DISABLE))
>>   	},
>> +	{ XE_RTP_NAME("14019877138"),
>> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G12)),
> Why just DG2-G12?  According to the workaround database, this applies to
> all variants of DG2 and all versions of Xe_LPG as well.

Hi Matt,

I will apply to all variants in new patch version. Thank you.

>
> Matt
>
>> +	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
>> +	},
>>   
>>   	/* PVC */
>>   
>> -- 
>> 2.25.1
>>
-- 
Regards,
Haridhar Kalvala

