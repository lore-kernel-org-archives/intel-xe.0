Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41761C7EE21
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 12:04:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0265710E296;
	Thu,  4 May 2023 12:04:02 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEAAB10E386
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 12:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683201840; x=1714737840;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Nrz44fcLgvne5OGV5nv9/kZkezOlMEkAW//3DJtZtpo=;
 b=b91lNnKJw9rki+NK/RFnmHeFQjpk7JHGS5fSR6gZ5SP6DiHrlYnx7lrD
 3Njyff79AqkBNeanEhOfejb9OCLGh2nRzhPEd1XmoAFCIQyuxQDwQ9MAz
 5c6YNIhyoSVYmEoQYZ0cU5aX2XzxrlYP/0GRHu2XxsofKSWPZbl7fD+hY
 1egzWftKL5WL/Sgx90Bj+fH342eoN0ZC/5Nnz8gN6uovZ9zR+sSWhpDyr
 J19/cCzt1AC20MWFKYYHhRiXR8E+uJaMod7rNHz3R+xL6tlkO7lvMVN+X
 mFSRMbTULCIFIs7olVH/NRbc/pRwsGT1VyxusTBZpKVvqa9qAiy1pkMeS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="351908037"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="351908037"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 05:03:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="691099912"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="691099912"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 04 May 2023 05:03:58 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 05:03:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 05:03:57 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 4 May 2023 05:03:57 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 4 May 2023 05:03:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQxm4WUq+pARDw0GICpZahISp5zqENukq4AYTs2vUoT9KCl9hR6GH6e3KROMi/wuEmimCpGDmg6I64xbgGobJIRQbiOJSlKUn1OzvneP68gDWPVj5V0fyJj6uHExqeudhtA46AFyGJZUMNrGds8kauEn5DS/4L9l8lKvIOWGG065fxNZUdV9kZnoo2LHZrKt8ndrYKScbqikWBBN6pmb2Alk3uMnQK7hq8wFfRGRMVTejjGQOPOxm0i8I6iBcfuILbR/KTXEq/N3pEQLFdB0J869i19zPGx0SztJHEDKkz/YR97GOzyJIFSTXo1iG/7w+AmwbTFM8oHOBrCwZaK0bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nuNwASdOOt2EdcCfm2TiTOpukGSM3Lew0qb94dY+ECo=;
 b=lVghgtL71ejjdBSYqbxnXzBxbkt2loDtsCDl5jjbnA+X/AOyMCLHC4nAFR2/W/ZrayzsNhnVaDE0LOumsPpAsUtC80qAW941EppMmRXyQ4PVxtkfpYbK/DF85VzrF6lK491H19lkws+8k5C35AU1CECwg8KA+acLvUTFXPWvNy3tmg200kRn890UkFlaHPdzUAqsL3VN++QDiuLdQv59K/h3rNl1L3Q04cTvK6oKomFnasEqj2UhgPJjrSgZb1HRkL2B7Nn7TGKVyvy1nMaEnVyr26UMkCLW+jrhmMZdWhU0obquhiPCaEoKAjfW9Sbedk0No95UZWz2Ig39LAoQkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by PH0PR11MB7469.namprd11.prod.outlook.com (2603:10b6:510:286::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 12:03:53 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::9c58:34e2:84e5:751b]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::9c58:34e2:84e5:751b%4]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 12:03:53 +0000
Message-ID: <c523cab4-bb09-89b2-0020-1eae9912b768@intel.com>
Date: Thu, 4 May 2023 17:33:44 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Content-Language: en-US
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230504112020.300498-1-tejas.upadhyay@intel.com>
 <20230504112020.300498-3-tejas.upadhyay@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20230504112020.300498-3-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0234.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::6) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|PH0PR11MB7469:EE_
X-MS-Office365-Filtering-Correlation-Id: d4e9b2e4-65e4-47a6-97fa-08db4c97a146
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YHrqHIq4BZIWvEl8yrUkGfAqB58PU+mj7CWgvy21KtbEomuSmg0GJgvpSD3uVGZ8ksIStzyFe13d7WnZLNzdSI4yVM/2oodzBQuecCDvEsencHuO1DC0SeIrqbdlJK2IcPcOfsrObnSduLrdc2kKXrhI290NxtJUv9Y26WnS82308VqNw1IKxdsynAk4K2s7HPQxJhj/xJJpSzu7ca+XNSplV4nwEgqGFIXYP+H5z1IWBI6rTtTNk1jjcAhyNudIdVZ6V73Wr/IT0YBg3Huy0yXGf8z3KoXexHXf3lI6bM6LBTXHS/Clv94OFD5d3kK/cVJJp4bFmkB3p3KXlDzHOPB3YXVCh0izHK01MyubJJWCzJiY/ja49vuwMFzEkgZkWtZjoEQyStw4/oWAv6wBWhPfctXP4e2xJx3iKzyXIfdFnKJyTqIiDnCiA/EssDBa8yGNJXb46p1JbIp6sDvIQhvWkUWUMKyYcGMkJMW+dz3YBrWOdnxALbSiSaKaKExeM3+X8Tr77ZYWZbRPQ5fGV0X+JM5rWchIHtmOhWGsbiEaTJgAGvbFKbwf4l723ZjEOYB5XjAmHZcWpJ0NzWKuiHPetE//UD1yuA5IvU125pEhPmdpDUjqpHrkUSaXXNhoIrAEmyFw4uZLwjv+aNHelg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(376002)(396003)(39860400002)(366004)(451199021)(83380400001)(6486002)(478600001)(2616005)(6666004)(6512007)(6506007)(26005)(186003)(53546011)(2906002)(36756003)(5660300002)(38100700002)(66476007)(66946007)(82960400001)(66556008)(41300700001)(8936002)(31696002)(316002)(86362001)(8676002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2c3Q2xLcjIyZ2dIUEMrOHZaeUVpZldYcGFJUWF6YmxDV2s4VGZlaWZqUmQ5?=
 =?utf-8?B?UVZINEhNalAxcnNLUWo2NWt6bGpVdCsxTkpWZTB5SUE4am1BYjE4MWxNYzdv?=
 =?utf-8?B?cnUxQ3BVSU5sOVIyUVNOdzNvZE82TXBjcDZYMElnamkvcFZJSFpwUnNxSUdy?=
 =?utf-8?B?ZlhjMXRHdlo2clNwTE9IWmZHSVh3NjNCWmYwQ1NiWFJwZmpUMkxHSER4Z3cz?=
 =?utf-8?B?YldLZmhFdjA4RnR4NU8waUZEcVZJUXI0MThkMjl0TEpPc0tmK2tiNjlveW85?=
 =?utf-8?B?a1lQSUt2YkswU2t2N2FGL3RKR2lPR0g3QjFnVnFpczF4eGE4SUhHamZML00z?=
 =?utf-8?B?ZFhoWThvYk5kT3Y1d1h6dVNFRDd5d2pXSFZXSHhxbVJYcnFJNzUrZkRPcWtk?=
 =?utf-8?B?d21MZjVJYlRmZUpCNVhUQ3BTaWk4VWpvY0dxem5CYlFYOFU0RXg2cVNiTTEz?=
 =?utf-8?B?Ty9JNi9mZ3pLUExnZWc3aWxucUkyUVJQdXlCMGRGN0J0MTBsZ2E5QXU5Qkhs?=
 =?utf-8?B?OG93L1BnL1p6a0ZzREtORTB6cjZFVzRsa3RjUk5WdXgzWmRvb2doaEtTR3pv?=
 =?utf-8?B?YlpudnFrTTdVS1laQWxYNW56R2orWS90bE8vV05pRGxJbEQrL1RzS0puMlRn?=
 =?utf-8?B?Qm11UXBjM3gxNUp4ZUM5UElZNS9FV1hOaTRWVmRqMHBjaHVQcDFYZHZVM3I4?=
 =?utf-8?B?U0tMRVNIcnhCNVk4L3p3OHF6azlFREtEdmd2eDJ1MVg3Q2JFY2dnZGsxeEUr?=
 =?utf-8?B?dHpWdFBaYndiQ3EvYzZUMUh6MkY1bjl2M0ovaWxvVWVRQnB6VFBZd0hDdEtm?=
 =?utf-8?B?UjdpcFBtTDdReFFFSHJnK3Y3cEQ2TXovdTVRMjlocjF1MGJ3dGFtTWErdkxW?=
 =?utf-8?B?eUtaMTd0eG5GMk5OWlArbGRWUVBLRXVpakF2VFhvOE5SVVNKbnpQODRYcHpT?=
 =?utf-8?B?L1V5Z3YrRjEyMVRFTzRWSFRpa3NPZEtCMFBzNWM0MGtDTDNoZHRrMzExTjNa?=
 =?utf-8?B?dlB2OXYwSzZWZ2RhTXNaU0xLcU5MdHZ1SktyUmxoVitRQkNJNnoyR2Y1Mlds?=
 =?utf-8?B?UVljbzd3Y1ZjbHNHM3ZsK2pHMnkydnBuYmRUS3VIN3FTZ2ZNRUlaYXR5M2tD?=
 =?utf-8?B?aEpPZXpodHBhVUxmajZGZC80ZVZuOGdMQWorMUlWd2RlaHNMZTB5U2tRdEZO?=
 =?utf-8?B?UURKZ1ZoNVRRNmFqazFwMEVqbzBURHRqbkN6QTFxTFJISm9tZVgrVDhxV3Ny?=
 =?utf-8?B?Q0JZR0FldFpQODJhc1hNRXNwcmNpcTlXSEtwaWlHUWxMeXJMek1EYVR1blk3?=
 =?utf-8?B?SnJkU3MzdkF4SmlpQk5nTS9nSFdLRHVOSDk5cWlSdEJZRVFMQUxzR3NCV096?=
 =?utf-8?B?OHJYUWQ3RUdTVi8yL2NZbERpMzVEa0k2Zlpzem42dVZ4ZllkaVBVTk9xMmFh?=
 =?utf-8?B?QkpPdXgvMlNCMUhkYXBmUSswU2V6L05WcURMc1g5bVNNdVRlQ2swU1hGdlIr?=
 =?utf-8?B?cGtkY3ZLM1o1ZTJ1Sm5mNTBYalNrQjdHTkFsc0hyWWNlV1pxRlQwZlVNOTcv?=
 =?utf-8?B?MmlPRUZKc3IzejBpTVdNdVhiS05ybjhrME5VQ00zdVQ5OTk1dXFUamszWWt4?=
 =?utf-8?B?dWpYQ25CS05RODFWcGxkUkViV05HUDhwQjY1c1JCbkxScVpsZFFlaVFZYmxB?=
 =?utf-8?B?RmFycmZJOWxOblV0YXlQazh2MmMzZ21IbS9JN3FRNkRlZWhxNE1FdDV4Z21Y?=
 =?utf-8?B?cFUzUkVNY29Vb1AxTTNldHJXVmwwZ3I2RGN4MHFmNHNuUndMYTFvOFpPY1NG?=
 =?utf-8?B?bFo0TndYRHJiNDdRRTFOdXhXTTQvNStLTVk1eDBnaU9rUzdWaHUvdngvSzZN?=
 =?utf-8?B?dGVneW1penZCeDNhSkxsTENCTVJVN0wwd1duT0dxTGtzUjZ2VFAzbHJveUdM?=
 =?utf-8?B?MnE2Vlp4TlRESktaSi9jWVV2UlJaOEpNemw3YUVRM1hoS3ZUckw1ZnV3dGw2?=
 =?utf-8?B?Z0pIdlZPWHNHdlBEL3VvSzFYMWhjOW1VcUh1RUtiLzlFcWd1SW5Ya09KZlNk?=
 =?utf-8?B?bEFlL1A3NVA5SmpJeUYwNkF6dy90UVBPVmF2dnBoWjUwbkhETXVTdDI3Qzdy?=
 =?utf-8?B?R29YVTBtbVdFUXl5VWJEZGhtc2ZtM25WcUNGcUpkaXBBaGh1MDVVZmRJOEFH?=
 =?utf-8?B?L0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e9b2e4-65e4-47a6-97fa-08db4c97a146
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 12:03:53.6546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CygCEu/zk3m1K0oBtSe5cQdvYbcT4oAxKVF902KuWpb/WXiy2UIMVRVTERMqsZLx2/12SF5ieAiOPWN80+2YQgzDbHGIWI68qPr8WBzkHLc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7469
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Register drm device prior to gt
 init
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



On 04-05-2023 16:50, Tejas Upadhyay wrote:
> GT init creates few sysfs entries under /sys/class/drm
> and makes use of drm_class device thus it needs drm
> device to be registered prior to gt init.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 45d6e5ff47fd..c5380914da18 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -301,6 +301,10 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		goto err_irq_shutdown;
>  
> +	err = drm_dev_register(&xe->drm, 0);
I do not think it is necessary as we are not creating the file node
under /sys/class/drm but rather under /sys/bus/pci/devices/B:D:F/

Thanks,
Aravind.
> +	if (err)
> +		goto err_irq_shutdown;
> +
>  	for_each_gt(gt, xe, id) {
>  		err = xe_gt_init(gt);
>  		if (err)
> @@ -311,10 +315,6 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		goto err_fini_display;
>  
> -	err = drm_dev_register(&xe->drm, 0);
> -	if (err)
> -		goto err_irq_shutdown;
> -
>  	xe_display_register(xe);
>  
>  	xe_debugfs_register(xe);
