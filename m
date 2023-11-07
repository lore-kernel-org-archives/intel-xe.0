Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CE1C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 13:19:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D32F510E595;
	Tue,  7 Nov 2023 13:19:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4141310E5F5
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 13:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699363193; x=1730899193;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=9kE5Z9kqbJZb7YZiFqla1We41C2pnVZJG/MxYyQPCXo=;
 b=UVwDuKUFMo8ONS1hhTrZGL9uBtHwaRwfsg7kdv7q1VVcii8co9MiWpo7
 EwSye/JqydaXZubS2RbEQvt5f/PDaaEMH5XPqF7WQYsMBzQvxyvwhkXFR
 fZqbd+v+gNKTCXUK7Rkrp7IjBvYiqsIv8QU/E30zg9kjmdb7/lgpSAOv3
 dUCOiEynEcA47AfX2Jmo3JgUQGIjZ6ju98XoSykeu5+u9Ptmzx1F3p29y
 Zj8UQNUARQvIElxwlE3UlxBvoBMphJipPGpNFtcCeh9IQNV5jnhmomHDO
 cAztC5sphuSijoD1fGf7xpF9VewIsNI+gOIhat1Z395S55v3rpaEYrlux Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="2437927"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="2437927"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 05:19:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="791812071"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; d="scan'208";a="791812071"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 05:19:52 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 05:19:51 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 05:19:51 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 05:19:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=efeqGzMuAvx1d9d1RriffqPH4EU4MoK3YlqV/CF++GV0UJIUWCJ/EyR2voBCe8A7aloyumhqbOv0fVFCYZrDI706kwKtsw/jTYaiMdeAOhkG9NFB2HFiyURqGP60EYSTtbtv+tUpoTl4eHJjgvoHdZ1FoaDwxt43H+B/cZmUvrAXyLkTl7kItgWyc8y+3dSM0xsfC+KOCIYcNkCosUXmPA4tkOV5dPkLYbvgg2RxmoYZ9+7LbCIzYo2OVrt5h+fTF6MRI2uusW4OEXt0ath5lxyljyPIhcawsAvMWGxqr5x3z9igAzkVpljDxXg29RsrSPAO+EOZE9Wz4a63OIdDcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=37TJz5IxTQulvfN65y3and0cibJWaJIplegY84aoLtk=;
 b=PBryaw1k5jgxFK+YM5IUQTBvmoNY6KiIZgUa/0jYzCP/sFA+0yNlNEOgTlGSy8NV8yKP+tRiW4itviTGSDWuqbBxiWmSoi1iA58BCywYNvI5/kXjDbA6RgSwXLE4dR8nTs/t+wZHXZnb8FXRlKvHhlp2X2jq1O8dYAE02JYj3VnEM8nZYeCYXg3T2DNPx2UmATDsf3krOiK/d1xdqjdL7PGVwiP9eT6LVgB7Dj8Vyd8b92rwJ6blTpF3O3wk1QqaDIahCoF/4F77Lx8A/lsgh0iWOTjAnoEcBaaqKz+lLcah4K5Uuw/PkgHHYqW8b5hI/WwJX2p7xp54C6JTvKMqRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by IA1PR11MB7271.namprd11.prod.outlook.com (2603:10b6:208:429::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.30; Tue, 7 Nov
 2023 13:19:48 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::2c36:38a9:79f6:914a]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::2c36:38a9:79f6:914a%5]) with mapi id 15.20.6954.028; Tue, 7 Nov 2023
 13:19:48 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231106214140.GW1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231106210655.175109-3-gustavo.sousa@intel.com>
 <20231106214140.GW1327160@mdroper-desk1.amr.corp.intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Date: Tue, 7 Nov 2023 10:19:43 -0300
Message-ID: <169936318360.3064.18112131790060517075@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW3PR06CA0001.namprd06.prod.outlook.com
 (2603:10b6:303:2a::6) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|IA1PR11MB7271:EE_
X-MS-Office365-Filtering-Correlation-Id: b4f5ef9b-845d-4799-1e03-08dbdf94374b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KLA8BWBIDYxFHo2xRxt33BOP8QtWkVXP+En1zsQLBGEwSfDdxg0vDK0KevET5PJ1AP8eNmIwEKT5ezG1mpyzLGF59LQ/9v5VSoC+dz4yNTKHKRzvOMArLUJG51JdCO0ZU+38EiCm9JOicz/o35EIY4EdWPkVHLCGukQgKqacMIpWQGwuGaCCB4EaOTD00d5q3zJ6NhG1de/xblC7a3Ec0V7eq2yw1OtZVn8zjyoxB0XFvFwQvPXVMLDRjdPF3gvycBhA2RS34iFw68JVeT12PKGqQbtbk1g+DeBZCOxE58cpiWjwNI4NFNcHsJHpivfZ6IdnBQomNGJKxYxM91iaIGZ46DQ3H6kIgDZtfL2W3WcwbMGgzCazQW9AJGRhIgR9w4urGfiaLUFDs6CiL4pHKHcxVSMOd+k9QL44Z9FyAbBxPDrjGF6/0TF7te2R+uUZzBnQ1/V1GkU/kpbCpn54SM033V5LqJlVjp1QgGtcHzkduwzgbr6Q8MzG5nN2huI6UbwpQg1n2M9po1pFy1XPQ1s8aL9ANAhUx/DN8PWLlL6j2qif0KaUIe0+++UbB6mA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(346002)(136003)(376002)(39860400002)(366004)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6512007)(9686003)(6506007)(6486002)(6666004)(478600001)(26005)(41300700001)(2906002)(5660300002)(33716001)(44832011)(66476007)(66946007)(66556008)(6862004)(4326008)(6636002)(8936002)(8676002)(316002)(38100700002)(82960400001)(86362001)(66899024);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djZJRFJIVUwybnMzaWtCdnpOQjN6dXpXUmlXMGJnOEY0SWxERld5OGMzYnEw?=
 =?utf-8?B?R1QwMDd0a2EzbEdzNy9Za1B2VHk5TGtpREk5cUJ5UmpzUjA1K3ZOVytaL3lq?=
 =?utf-8?B?R2J0dU1rbWhTM3NvZmFuUW13V3JzK2tzUy9yVFB1MGFITnV5ZHNYRUpoc2ov?=
 =?utf-8?B?UEdwNGMzd1ZoeFY5Q0ZhcFgvaCs5eFRFQkJwd3ZMQUQyeHEzOUcxOFR1N0pr?=
 =?utf-8?B?YTkwQkNFSEo4aitvbDJKQXYxR0trbHQwaGtjLzVqSisyWkkrRFRla0pUVGt1?=
 =?utf-8?B?aXFJUHRZM3BSUDRZTUloTUVpcHRaTDNoek9RSDI3LzVmK1lFT3pQU2swOWpT?=
 =?utf-8?B?cUlVM0l1MjZOaHZnQlNkUWw5OHl1a1B2UHJYWWZQVEFmYTVOOWpYTHh2aWRY?=
 =?utf-8?B?VFZ1QnVwVm9ram1GM0RXVjVkcjF5VVpjWVhQRkU1ajVydno3Z1FVV25nUWs2?=
 =?utf-8?B?YmNTOHl1UzQ1VlRERWd6M0U1UlpEMDRXdWNsWDcyeTZtUXFwaFU4Y2FkZXBQ?=
 =?utf-8?B?MGxUZjFLV0lPN1oxU1V1aHd4NERCR0M0VnNMWks3ZzBlQnVyM3N2dlA3YlF3?=
 =?utf-8?B?eGs1dXhiWUMwTGYzYmVEc0FYUS90bkdWZEpYZUl5YTZJWHJWUkpueTBwbTNS?=
 =?utf-8?B?OXF3TFpPa1pjOW5mNVFvZWRVTm8vU1ZrMURjT25SY1M2dDlYSVpDMy9EWXVX?=
 =?utf-8?B?N3M3d3NaWWdrNDRhdjBmRExkeXMyRmVISFlPeU9STDNFdmcremFaVDRUQjI5?=
 =?utf-8?B?SlQrTjBHWjdQb1V4SWp5Tk9jY1JUam1pWWlBbWl5aHJZZUtuaHZPeTJnNENL?=
 =?utf-8?B?Ry9sem9yZmQvb2JTNTFjdysvcHBXaDEwamJTSjlLQXRGMmlKNTllRHhRNS9H?=
 =?utf-8?B?UGdheG5MZ1dIQytUbXhWSm5IYnB1aDBramY5Snc2eU81V1g3T0hmb1Q3ODRk?=
 =?utf-8?B?Mjd3T3BqS0U5eUFqWHRUQ2k0Ui9TTWVZMFJBMWdqR3g4ZGtONEJzVTM3ejRB?=
 =?utf-8?B?b0UwVkRzaXNFODhjUmllM3pKTmtjT1BJUVZMZjhEKzZQcFMrYzZOSzV1S1gx?=
 =?utf-8?B?Sk0xaHJ1aENnNTVURDBGck10eEhwSi9vTThwcjAyZnFTMjdobTJrd1Rldk9Z?=
 =?utf-8?B?c3lBcjZicWgvMWwxUkxzNXFNUkg4M2JoWjZBVEk2Y3RCTStBVUZIVnJkTy9m?=
 =?utf-8?B?MGxlVEgrUDhSZjZvN3JRb2xaYWd3ajk0OS9zS0JWay9oMXdIU0k5SHZBL3E4?=
 =?utf-8?B?VjNKWGRtZWtUMzM2WWpXbVRSSEdUdlIyUlA1MjY3UXpjSyt4Yzh0QUVmTTZF?=
 =?utf-8?B?Z0RidnhQby9seDVNSXRTOFBMdnJkNjZSem9WWnNFT29nZ2pwNEhvTFBwQUtU?=
 =?utf-8?B?ZTRIakl5NGRKbmg3UDE3OHVmYkNBWXJZRDhQT1d1bkE3YWhNV0lzZWg1aVI1?=
 =?utf-8?B?YjlCY2hYM2tTNE1HaEdnZy9Ec0RKTjZuY2hjQ2w2SEhlZmFyRjNBTVBYWXRE?=
 =?utf-8?B?NG1XT0JGaUtDZ0lKZS9QWWplZmtYbkd3eWxpcjdCam40aHZKb2IzQXR0dmRU?=
 =?utf-8?B?alhGdjhVZTFkRE05cWVyelpjR2RhSnVSQncweXVpa2ltNVppWFJRU2FmY3F1?=
 =?utf-8?B?UzdMc0xMdzUxaHFQZVV1bW55YjJsbGxJU1lPcEM3MmVLTnRabUhJR1N5eVc5?=
 =?utf-8?B?MHJxVWo4WThMYUVkUDRYU0YxRHRYR0RoaUFobTZLOU12TE1TeWxwWGxtTzI3?=
 =?utf-8?B?ell6SG8vZXpMLzFFWlM5MGVrOXJRTnM3cDJQNFBuZHprNDJPYzliRm5tNjFQ?=
 =?utf-8?B?cDg2N2xHMXlsaGxacWRIOGVUSDN0aURneEo3cGluTlFqZ0tJUTFmbkpvTXhi?=
 =?utf-8?B?NHVHeGgxRkU2RlpRMWZSazBvN2phUUdrNnNDUGZydEJJVFUvZjJIZnZWT08v?=
 =?utf-8?B?eEpMSnpFcVQ3YVQ5OUFOY0Y1Zm1EMTR4TFcxd0xNcEMvcFJFZzMzSWV4Wjd0?=
 =?utf-8?B?VTk0ZmdLWjc2dTY2UnNXN1hBTUlhL0tlcURjYVkyWkpzWkptZ3RGM3dmSldK?=
 =?utf-8?B?RTNQQmliY0V5MXl3dDNWS2g5YXZJUkg2ZjVuYzdoSzRseFAzYVdIYzZkMENn?=
 =?utf-8?B?emNiZmF1cXMrcnpldjNIUlFZUVRTRFhKSWxJdHA0ZUNKd01ubzVGUjZicHhj?=
 =?utf-8?B?MlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4f5ef9b-845d-4799-1e03-08dbdf94374b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 13:19:48.8017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3rL5EWFtHGXf+iAW3Ebl/gM/V8IwCX5CgWggUQ5KmVWRIrqpXgBWmdSF2uiRGOqxyG+MqxXUI5fhghTR1qb82g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7271
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/xelpmp: Add Wa_16021867713
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

Quoting Matt Roper (2023-11-06 18:41:40-03:00)
>On Mon, Nov 06, 2023 at 06:06:57PM -0300, Gustavo Sousa wrote:
>> This workaround applies to all steppings of Xe_LPM+. Implement the KMD
>> part.
>>=20
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>
>Looks like this is trending to also be needed on LNL's Xe2_LPM as well,
>although that isn't quite finalized yet.  We can come back and deal with
>that if/when it becomes final.
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Pushed to drm-xe-next. Thanks for the review!

--
Gustavo Sousa

>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 3 +++
>>  drivers/gpu/drm/xe/xe_wa.c               | 6 ++++++
>>  2 files changed, 9 insertions(+)
>>=20
>> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/=
xe/regs/xe_engine_regs.h
>> index 35dd4837dd75..b57dec17eb2d 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> @@ -118,4 +118,7 @@
>>  #define VDBOX_CGCTL3F18(base)                        XE_REG((base) + 0x=
3f18)
>>  #define   ALNUNIT_CLKGATE_DIS                        REG_BIT(13)
>> =20
>> +#define VDBOX_CGCTL3F1C(base)                        XE_REG((base) + 0x=
3f1c)
>> +#define   MFXPIPE_CLKGATE_DIS                        REG_BIT(3)
>> +
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> index 2f1782db267b..614e114a5342 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.c
>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>> @@ -248,6 +248,12 @@ static const struct xe_rtp_entry_sr gt_was[] =3D {
>> =20
>>          /* Xe_LPM+ */
>> =20
>> +        { XE_RTP_NAME("16021867713"),
>> +          XE_RTP_RULES(MEDIA_VERSION(1300),
>> +                       ENGINE_CLASS(VIDEO_DECODE)),
>> +          XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
>> +          XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
>> +        },
>>          { XE_RTP_NAME("22016670082"),
>>            XE_RTP_RULES(MEDIA_VERSION(1300)),
>>            XE_RTP_ACTIONS(SET(XELPMP_SQCNT1, ENFORCE_RAR))
>> --=20
>> 2.42.0
>>=20
>
>--=20
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
