Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA06C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  1 Nov 2023 15:59:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8110310E737;
	Wed,  1 Nov 2023 15:59:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 127DB10E737
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Nov 2023 15:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698854365; x=1730390365;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/Uk8ZlqXlI/4IRXo+YWlo97Cx2gKYK9qkSxLB0ZDNoo=;
 b=DMN5PY5jLrmoJEDOiEm1QdfIbW8paNJcPPgIkBmkG7ytD3rM/UPnkYoW
 uemSVMIKVRRdBfDVsrk7zFWzFK8sIUxDT70isgblgfl7OMva0v2yYixyj
 5hvq2eh5EcQMdu+3cyNiCbP/WOH4XpAIJd5RE54HtmV7xNvWDnsaBvmFf
 MXjyj+l/C0xIhohP/9LfJvrdeKpoPO/v6G+ZQzJxI/ddg732gec4+ym4O
 sKaeI4kuisL+1KzNE0zCFe18XNXU2CppWUidpVa+sGVovkDBot6qZ2jJP
 mIY26vEVcS3uiht9F8DvcWJp6Ly06keOCBMXoR91sRATX18/5qm1SqkyE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="1416817"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; 
   d="scan'208";a="1416817"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 08:59:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="877899264"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; d="scan'208";a="877899264"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Nov 2023 08:59:14 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 1 Nov 2023 08:59:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 1 Nov 2023 08:59:13 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 1 Nov 2023 08:59:13 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 1 Nov 2023 08:59:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LiCmd03hoO3Z/iXCfMWVW9X/WNBSrrNnhO4kThCe1UByjowr654w3mSxjPqExc8kpcRZJebzO4+sBMLocqtLAhySHkbDquUD2MDQGQol/BtumJ47VcyQHUNZzka4/hMU+LrRyaspUZu4u3x5HkA5aTaopVs3WaVhgH9RPIUETnuux3PXFiDLle9Q2t9tbzHbXnvHW4hjfK+/hFBOIEk/0S3ii/QjK/98yYIBbXnDfkrVSTuefGQ4IGZyHdvNmitkgxHRCjJXcZP4vvAtcD6nJKuJCjgIl+vaZRSYmi5hWnVkbayJX3+p3R4wozFTT26edIFYrewywmhK++P7qrN4Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WhyspyRjnxbAYzS9/8MVFqJt0NgQ97CE5wYJAdK0HY8=;
 b=lldE2ToL/h+yG26QwYxETw2dSqCdVbGwkQgW+A3QZFJ31PQYqRq+EyvZg1YOLNKZYe+e4u5rQ9lJfJvr9RHk++uybIqQnBAsm+tRpc+SxHr9hxpJS7Ljm0yaMfjjHLRxOunveqyVovZ0O5PISy3O+BgZNrz3dtWiI6II2r/gJ/guZWtoui685bFyPGbRzWMwKUGV5HlnWRFg+/rQHoG0xhVMaXQWjXxl6EgO8NADAQ79rhTgafAoya6SMAefzNJhjUhBbvc9FuomdeDSm2oOXr88eLBBe77KFpIUJ5l0myDVtUnCpTozmrBQPhqLfeHrGyo2khGa/PHz6+Ivx0GwrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by LV3PR11MB8676.namprd11.prod.outlook.com (2603:10b6:408:20f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Wed, 1 Nov
 2023 15:58:58 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::51c3:59ea:6d4:8bc0]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::51c3:59ea:6d4:8bc0%4]) with mapi id 15.20.6933.029; Wed, 1 Nov 2023
 15:58:58 +0000
Message-ID: <227e7d71-e8cc-46ae-929b-e4ab55f076a9@intel.com>
Date: Wed, 1 Nov 2023 21:28:52 +0530
User-Agent: Mozilla Thunderbird
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20231101151756.1617408-1-badal.nilawar@intel.com>
 <87il6la464.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <87il6la464.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::14) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|LV3PR11MB8676:EE_
X-MS-Office365-Filtering-Correlation-Id: 4635812b-ccec-45a3-df30-08dbdaf37519
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GXTpbWS7hdSAsQo+rZ+o42mr5+hks4LNk80m5qCu6n9AS9BnTz7x05vqwVooUCcT6MDbcUIkp6GzQp7//yRvEQ0V0SCTUwXHtIM3c0Ao66Pa6vf/yCScvi29VRBX5Ry0z51nYtUBRxg0qTwhP3MK/iJIlwwzPvpKfvmg1CzHR1D3R3UkkUY4DfumH7l1zhHWx9SuzyNYyYEDBzoqceJ1KjM5A4DrC2TifPoUKJe5STYE2buJweGlKBQAIBGyLb/0Uq/tWRogGB70IeLkY2GMJKXVsbYtGNIZ7ffkctagSPF40jA8ztbsYSDbLh42IkF1AIq/Nf3xiua9qv/c17iZkKMIPJqlpMExOfbwvS/0ihigCqQJ+mUYQSOIaKF+eU8RGEBU2olXgk1rJrJNz1mwLlbPR5S4Hb4wZPtR9IjlcwRKPY7UmUEfwtDeKKRO4MGXKfCHvJ/T0l1I9yIWFROTO5OB+8E163SLy8mWjNRsof/1PN1LX1mkMgwbD9nWrmNxXQ/E7I03OQJyIXJVPiaKYr+wzvhu6AHZn1m3Jkl711iwzvYDTrsu3uEADhoxnwunZPWN9cLFb3x9Sx0JXnP5WJPlEEJ7/ogmB7WX+zRhZHtXE2n8kos05P1BWnKNNKzOjJGKqjOWDCv9i8ZUrtNZSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(396003)(39860400002)(346002)(376002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(41300700001)(2906002)(4326008)(316002)(6486002)(8676002)(6862004)(478600001)(5660300002)(8936002)(37006003)(6636002)(66476007)(66556008)(66946007)(83380400001)(36756003)(31696002)(31686004)(86362001)(38100700002)(6512007)(107886003)(6666004)(6506007)(82960400001)(26005)(2616005)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RS9pV0hUbk9yM1VrZmZQL2hQUGZRb3RHSFJzdCsra0VZVEt3N3M3RFduNXdS?=
 =?utf-8?B?ekJkenBHUk5iS3dKVE82ZXFJRmNvWTBQdndqYUZueEVVN2hGd2h0Rm5UYXJu?=
 =?utf-8?B?eGFQWGF0WW92OFpjOC9mbXVoQnJWbTBQRTlkTmIrTXdQUXNPTXFVNyttb3hF?=
 =?utf-8?B?Vk52Tzd4R1E1WHhaSmRNWDdmL0M2b2E4Z3Q5R2xxckxXTWZnWU9MOHZDL2tq?=
 =?utf-8?B?VU1Od3pSaWtkejdIdDRrQlN2L2puMmZJS3p2K05KSnRIOVhudDdRTDZoYU5s?=
 =?utf-8?B?RnpsNzR2MVIvcXVEbnowaG13T3RqTEMxeEpkK0xQSi9kTFcyZkxCVFNEam10?=
 =?utf-8?B?bFdTV04ya0JreDduNXNuZjVJZkg1WFBGcWlBRnU0RmVIdkN1RzRCM3lNN1Rq?=
 =?utf-8?B?cTZxRVgzaXYrWWtoMlRLWEJscFRPSnVUMEphVlRTT0xrNkpkc1ZKWk8ybVl0?=
 =?utf-8?B?WHB6NFFCbFlqQUdlMmlSTVk4YndhYld4dlZWVzFqZFlXMnhvdjFLMXZJeFAr?=
 =?utf-8?B?U2R3ZHAxU3NQbXY5UTBNY05FTnAvVjNaMklMSUJxdTZuV0tUdUw5aWVXVmwr?=
 =?utf-8?B?c0RFY0N3NXdWMkhYUTBlMmx4S0w5UzBKTW8rRU5TdFhDRFNNZ3JYY05HMFVr?=
 =?utf-8?B?L2lxZVh6MW45bGxablRlM3ZERjhnWG9yZ1dsdTZ2S1FVaS80KzUrb0ZHN2Nl?=
 =?utf-8?B?VWFQVUZnR01SU3lURWovNHEwTDFnTG5uZndtNlp1bSthSUk1aTBsanFmb2Iy?=
 =?utf-8?B?YS96UWxRRTdKeG81VFN0OWduNXJFVjRRY3Z3cmkwRk4yclpUYXREUXk3dUNB?=
 =?utf-8?B?T0EwY3QxaVZ1R0ZDd2NGUUtGQjFXSVB3d1kyWjNhcFpHN0oxSVM4bFBBeDFY?=
 =?utf-8?B?aHY1Q3RiM0NpcERxTmM5dHcwM2pyeWRLbnY2ODNadUZQdkh0MDdoUVRQbk5m?=
 =?utf-8?B?T3pWNXVjYjVQYyt5T0plNkhBWUQ2WFVZVFM3S2hLV25YeGVSaGpuZ0ZZRVE2?=
 =?utf-8?B?ZXpTYWhVYkdVUGdHL2NYR1ZsTng2aCswN3VxVG1weXRyeXFRNlRvUEdCZ3Zr?=
 =?utf-8?B?VWUyTC9xWExqMUtYOVp2SzVIL2xGY2xvSnZrT2NHemdjK2xDL3E3SHo1SWtG?=
 =?utf-8?B?RGVPZlBCdWRrYVJKWnBQdUJVL1ZuRjFmNThhS3c0VWtiOTlYc0sxbjRORlJJ?=
 =?utf-8?B?L3ljSUpVM1AwZTZZdUtoQzJFVXduaVk2UGcyQlNoamM1azBpMGt1YWpKNzNq?=
 =?utf-8?B?TlRvVU9laTBDUkpkcGJOZjVCSHkwU1JITjc2dmZGRzlpWkw1bU45SCt5Vm42?=
 =?utf-8?B?U3dYSWRmUW1waXhvYndIS0NNV0pxMDdnZnA2MDVGcjllKzNlZnVvUDhsdVI4?=
 =?utf-8?B?aFpkTkIwL09qSzhzUlR3RkRuT1JqZ1h5OVR6VHgyb1Y3N1Z3WlZISThROWlL?=
 =?utf-8?B?SzN6cGxYVUJLRVlnYUYvTXQ3R3VTRU5oNVpiekY0Y01rdlVtaFlhZzZkRTZH?=
 =?utf-8?B?S2pHR1JCS2NYL1QxZ1pURnNuanBudDJid1RwTnhCM0tNYThKMlBoVnV1Zk5p?=
 =?utf-8?B?MTVMMG1nZzEyL3VSUlljYlZOZGlqU2JyV1lHQ2FMZEN3V3VRTmpsVkY5bkQv?=
 =?utf-8?B?b1JHYXVGcmRXM2c4SjJiY1JsMmVzWGFNeDVIVEFqci9ZWFhUN21JTys4Z1Nj?=
 =?utf-8?B?QWpQRlk0ZWRSWjdQV3JMY09oNFVxcVFSZlVMVllPSzJmUFVaZ1RsdXhjblp5?=
 =?utf-8?B?WjBBOVBQTWhRcFVZaVNCVTlZbHNxTm9RalIzOTNDSHdJWnJEYzNTUmdCVEtP?=
 =?utf-8?B?Q2JLK1ZZUEJFOTRLamhiejRNNnppbm5TcVhZakMwaTlDeGtYaHRLMG9JV1NZ?=
 =?utf-8?B?MFJicFRiUTZBUXdwOURVeFZtVnVjdGwwV1dBdjAwcGdQMVo5TTIyYVZTMjlr?=
 =?utf-8?B?aHd4ZWtTdVlaeUtJVXhHZzlnTGRvMXVwanY2OGp5RzRZZk5ZeUlHTWMrdUx6?=
 =?utf-8?B?ZFViRUZ6ZnNRWWtXcUlJMFozTmhEK3JZcFNyWXJUWnlWSjJqOW9VYTVUSGRm?=
 =?utf-8?B?RmR6UnIrYWpPRitsRUdrOEJ5djdRckY4dHNMc0tlaGJXM0tDL29xYXFzZlBX?=
 =?utf-8?B?Uys2Szg0WkUzTUNiZmN2dnVwVEFXanUyN0NUbUNIdUZJQm8yUCtYVk5QbXZa?=
 =?utf-8?B?TVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4635812b-ccec-45a3-df30-08dbdaf37519
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 15:58:58.2824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H9e1S+IGRoIc52yjDGP4qOwXlx493zpSkWGTSzHoYQZYTDY/RgPJl59bUD1T/0VOYpHicKG7pkr6vmmTw4SSpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8676
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/mtl: Use 16.67 Mhz freq scale factor
 to get rpX
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


Hi Ashutosh,

On 01-11-2023 20:53, Dixit, Ashutosh wrote:
> On Wed, 01 Nov 2023 08:17:56 -0700, Badal Nilawar wrote:
>>
> 
> Hi Badal,
> 
>> For mtl and above 16.67 Mhz is the scale factor to calculate
>> rpX frequencies.
>>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_pc.c | 25 ++++++++++++++-----------
>>   1 file changed, 14 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index 74247e0d3674..90e3e1b56c27 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -306,14 +306,15 @@ static int pc_set_max_freq(struct xe_guc_pc *pc, u32 freq)
>>   static void mtl_update_rpe_value(struct xe_guc_pc *pc)
>>   {
>> 	struct xe_gt *gt = pc_to_gt(pc);
>> -	u32 reg;
>> +	u32 freq;
>>
>> 	if (xe_gt_is_media_type(gt))
>> -		reg = xe_mmio_read32(gt, MTL_MPE_FREQUENCY);
>> +		freq = xe_mmio_read32(gt, MTL_MPE_FREQUENCY);
>> 	else
>> -		reg = xe_mmio_read32(gt, MTL_GT_RPE_FREQUENCY);
>> +		freq = xe_mmio_read32(gt, MTL_GT_RPE_FREQUENCY);
> 
> Generally I think we should avoid making these kind of variable name
> changes, if only to keep the patch small and reduce the review
> effort.
> 
> In this case, isn't 'reg' more appropriate anyway? If we retained reg this
> would be a single line change in this function.
Sure I will retain 'reg' and make the change this way

pc->rpe_freq = decode_freq(REG_FIELD_GET(MTL_RPE_MASK, freq));

for here and other two places.

Regards,
Badal
> 
>>
>> -	pc->rpe_freq = REG_FIELD_GET(MTL_RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>> +	freq = REG_FIELD_GET(MTL_RPE_MASK, freq);
>> +	pc->rpe_freq = decode_freq(freq);
>>   }
>>
>>   static void tgl_update_rpe_value(struct xe_guc_pc *pc)
>> @@ -645,18 +646,20 @@ static const struct attribute *pc_attrs[] = {
>>   static void mtl_init_fused_rp_values(struct xe_guc_pc *pc)
>>   {
>> 	struct xe_gt *gt = pc_to_gt(pc);
>> -	u32 reg;
>> +	u32 freq;
>>
>> 	xe_device_assert_mem_access(pc_to_xe(pc));
>>
>> 	if (xe_gt_is_media_type(gt))
>> -		reg = xe_mmio_read32(gt, MTL_MEDIAP_STATE_CAP);
>> +		freq = xe_mmio_read32(gt, MTL_MEDIAP_STATE_CAP);
>> 	else
>> -		reg = xe_mmio_read32(gt, MTL_RP_STATE_CAP);
>> -	pc->rp0_freq = REG_FIELD_GET(MTL_RP0_CAP_MASK, reg) *
>> -		GT_FREQUENCY_MULTIPLIER;
>> -	pc->rpn_freq = REG_FIELD_GET(MTL_RPN_CAP_MASK, reg) *
>> -		GT_FREQUENCY_MULTIPLIER;
>> +		freq = xe_mmio_read32(gt, MTL_RP_STATE_CAP);
>> +
>> +	freq = REG_FIELD_GET(MTL_RP0_CAP_MASK, freq);
>> +	pc->rp0_freq = decode_freq(freq);
>> +
>> +	freq = REG_FIELD_GET(MTL_RPN_CAP_MASK, freq);
>> +	pc->rpn_freq = decode_freq(freq);
> 
> Similar comments here too.
> 
>>   }
>>
>>   static void tgl_init_fused_rp_values(struct xe_guc_pc *pc)
>> --
>> 2.25.1
>>
> 
> Thanks.
> --
> Ashutosh
