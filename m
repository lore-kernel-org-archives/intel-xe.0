Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C28C46CD4
	for <intel-xe@archiver.kernel.org>; Tue, 19 Dec 2023 17:48:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D2610E1C0;
	Tue, 19 Dec 2023 17:48:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A124B10E1AA
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Dec 2023 17:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703008090; x=1734544090;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KsNAcyDSibWFa2U8UYlklE5b7ig4HlALkrT1RLc5+RE=;
 b=kNl8o1vywSaY7LZsvG6WHyZQHWWzOVJdieq6GtRandg2Hu9PKnEyzWEs
 gn6EZHMP/c7UUMgHP+9GQ5Y6s7U85N370h61oyTCcZC7021qYJQoqHoCe
 4hW/QZmrZosKe2h5y43On7JjPoh3dAmjt79j0rqspGOBMotFJ9MBXfGON
 nHbX5TkkvwLjk1XQm0jtAjMrlR6g1sCfsmEijtKEfcNyNrf/qsc45zNVn
 q9s5snaBSW1tGDXHypErMniHH0taTQA8PslV8D5VWfrAZFL+yvvfQoJc3
 JQAX1qS5OItXrACBANBurBtebLM+6OZ5QxleTjncstDXp58ozX9zno+qG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="9069117"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; 
   d="scan'208";a="9069117"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 09:48:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="919689732"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; d="scan'208";a="919689732"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2023 09:48:08 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Dec 2023 09:48:07 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Dec 2023 09:48:06 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Dec 2023 09:48:06 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Dec 2023 09:48:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BMyKDZ1e7qqfSnpChICPltnWxzFMsPxmAQrVdMTfBRf9XA9rJ4KBwuvO4o8nEYblWujW9+xg4R/ob7PWp5svncz6I9j0lGltkWx/MHgdIAOnpHyIWlI3Ub0PHsWBdx62rmgtbYq8jDEcnHZB3AYZaiGG11wCh7X/PHHBd/z7ZRIj6lgN2zriqxwCItEepnPLxx0s/XJPyci/1ifCjL6Ohp8J2SX6UB6vm6B+u5ExRofj8XzwpUkrjgiIZ2X2M2i9vCVwMnhpL5MO7khWFf6l9AMEMDocyV54Byvp8m90O9tm2RDxLp19KBFI9GWEUa0PDhG2bOJ/FUN2VltCAz1Bgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5xnMzpPc1D4GohIyVJLJurgtmdDrKUom1JmPX2EcDLI=;
 b=WZctl39JAYeWCBRS2VcoLDaGEReE4P2HwDc/JLIhi0TJkc1jCwpN9yxQM5lke8P2u1PV+l7evxk/7Ks9bx4Bl1gi7dvqHK5Ui5BoBw64R/mxviQOmZJGOwfJa4YbCuOok4Ev+mnp5t3JaZ7DKmNrtnusqDUh1KmNv35UZDdSz0iHKAm/emCRnCs+FJj3Wmeb7Z33gsSUoDuF3XEOSwJPcFMDLf6F9k8w1nvoBE5S3sVNfYedd+nFgW3Wu1VcnkIi9ZnwVCIgTej4amAPfdLvkqR9+QxBQlOU7beS2i/rGrLgCRcm1KFifC9hC9OQbCWvdkdwcjoiHdLamKW2Kk0lNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by LV3PR11MB8483.namprd11.prod.outlook.com (2603:10b6:408:1b0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Tue, 19 Dec
 2023 17:48:01 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::d6ae:df23:ffab:5dc9]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::d6ae:df23:ffab:5dc9%7]) with mapi id 15.20.7091.034; Tue, 19 Dec 2023
 17:48:01 +0000
Message-ID: <8d6d2d9f-1e13-44a9-94a4-c23a95f0c17e@intel.com>
Date: Tue, 19 Dec 2023 19:48:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/17] drm/xe/oa/uapi: Define and parse OA stream
 properties
Content-Language: en-US
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
 <20231208064329.2387604-8-ashutosh.dixit@intel.com>
 <875y0uvqvm.wl-ashutosh.dixit@intel.com> <ZYHEHDMRyNW9et5o@unerlige-ril>
 <5b03cfb7-42c6-488a-8923-5a0b039e2049@intel.com>
 <ZYHHjCKrUzdmpPMT@unerlige-ril>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <ZYHHjCKrUzdmpPMT@unerlige-ril>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::15) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|LV3PR11MB8483:EE_
X-MS-Office365-Filtering-Correlation-Id: 20cc38d9-9205-489c-79ee-08dc00baa545
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yIxOcWLtTsU4A09PLcA7gxOztOXQuTM2UI850w+QRQUEwekyIGbYmk0QIm4d/47qW7JDl41EBQkivM1bQN94TJPQk6HX+tXUKQxvwZntD1pCb5Y4TtiLITaGlyCQ4esykQIQNPqG/0J7k26u5RKvczKC0vpWQtpRnpRT4Qbp/mLtYrdl1CEitJKkuTRliygRpEhHWe24G93juXNFjgc8lbIPIl09f1YMse5LpqQmGuYybauziPon2/1Pd8QWgsRxGz4h05krlAVfY0ouFACKtCAu58f/GkaidDv2ADZ2/MhIq+OY87e/pMZIgl/1Ch0I3lwpaQDfr6Y933gPR+9a8r9yiakcNOcn9gr9lDkzqIvXG3xreX/T1Oo0p++xcVbhPsnxovwJZ2LpsR5uNNYbsovW1/B1RzPN/t0aSns1MVRov/UiALPnZeZCejkISoWlVqBIG0TZjeRajDMBIYLt0ljDUSRbbv+9+fLa06w1tywRpWzOVBJ/64yGuVYO+dwSxNuVELVKpi3RM7HqqcndPl2yCwoOXUy4+7U4hO1SyDvjogfcMqhCZXebu2wPUlk7IP4pYPG4SjM6euFlT9VzkW/tq08aZGn9eI0R++WFfgZGeuifvYsLkUhPPzrapNtl2g+bMohQRiuTmYEUNT1NTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39860400002)(396003)(366004)(136003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(8676002)(5660300002)(8936002)(4326008)(6666004)(6862004)(6512007)(53546011)(6636002)(66556008)(83380400001)(6506007)(316002)(66946007)(38100700002)(54906003)(66476007)(2906002)(6486002)(37006003)(41300700001)(82960400001)(478600001)(2616005)(31686004)(26005)(86362001)(31696002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUt6RkVPTDBYaUsvNnJ2aStHTU1xQkJ4YTEvNXVKZktBejl3ajRPNlVmZUgv?=
 =?utf-8?B?YVc0NjJENXRxOTlGNE04bTYya29QcWJxeVFDZTZhSHZGaEN4Z1NrT0RKYm9Y?=
 =?utf-8?B?c0ZtY2I3aGwyUFNSb0RoOVFYY2g3RWdVcGFoLzF2SFdlUjFMbE1rZnZSenRY?=
 =?utf-8?B?aXQ5MW5FazFoQUd6cVhvNWZrZUhPOEl1TnZDQnZDQmd0aTB3UVBOeVdCbjcz?=
 =?utf-8?B?YXZlVk5iQzlocEtKT3F6VE1pM2hORE1rbUNTTVhNZ1hrUW90RFpXQTM1cGQw?=
 =?utf-8?B?aWRnMXhEZDM4YXdUN3RXTTNQVDI3QlZITzhPa20wSE1LUzlaNUdUZDEzK1pj?=
 =?utf-8?B?Yng1Qjk2RnFvQnNiRVBzR3VSOTF6cmZRbnhoWU1RTmlSR2pGY0hjMG9Fdjcw?=
 =?utf-8?B?UG5seVY2cmJHL2VHZHZMMXQycHE0NFZLRnR4dVozL2ZxSDB5T0VGY1h3WFpv?=
 =?utf-8?B?VGo0V1pxNzdRZWJ0dXRsSWFqcDN1UmkrUFBydnFlNWVMZjhiNktPaTA4VzF2?=
 =?utf-8?B?Mi95UldXNXFlMjYrYVVyNlVxaWthLzlzeTMzQVZnZnVyeFJ1OWxndFRobzJ2?=
 =?utf-8?B?WmZ4RUsvdzlnZzFsT2wzc09NUUV5eWhOK0oxVzA5OWI4M3BtcmtvSkRYdjRK?=
 =?utf-8?B?ck15ZXRTNitqOEd4MXh4Mm40THNvSGdYZXYvV1JFMFk4YVZPUlJhWGZqR2Rq?=
 =?utf-8?B?RDl1MmI2ekQyQlFXbjV3clZ6RlM0NENWb2pXckd1azZXTkpzM3R2ckpkSk9Z?=
 =?utf-8?B?U3pCajJIVkxDOFZTTGJOVVFnZUE1VzE4OVdYS1lhWEE4QkFrMlBuWVRBM2VT?=
 =?utf-8?B?NlB6R0RoeG91RFNsMyswMTRPVnZReEpWVG4zRXZ3bXo2RzZqRk8vT1ZHZ1N1?=
 =?utf-8?B?d0prdTdaRFMvNUU0VGs3aGpaK1ltZW1EL3FuZ2d1Y3hhQWdwRkZ4OWd3ODB4?=
 =?utf-8?B?ZWtNNVk5UUkrSzFzZVJhazBvVWJmcjVhVzBCL3RFR21zZ0o5WGI5TzJCY0V0?=
 =?utf-8?B?SzZ0NEMrZmNHYmpESERVekx4ODdIVzZCNGFKelgvUS92Y0lLc0VLUGNVQ3hI?=
 =?utf-8?B?RHFGT3phZElqQ3hFaHI0bDM1dzdvRll0MTkvMUVrcFU0eGFoeHJkeDBsNVV4?=
 =?utf-8?B?dXV0WFN3em5lUmY0bDJNbHdNMWdiZWNmU3gvRWg0M01jU0drREh4bHpBRTBK?=
 =?utf-8?B?VHkrelFsNWFrNk5YN1V1V0xXaHRVVmQ4MmJGY1lOYjlKSEM3VXExeFNMRkky?=
 =?utf-8?B?Q1VBNGsvMjhvSlladVV4SzRnVzJjLzFiZkEwR2x4dHZTcm96S1B2cmowZVh1?=
 =?utf-8?B?ZU5CU0dNQnQxRVBZSmIzblQyWktvV0lxSHEwYWFwNzduQXpKaUNRSDNxcEY3?=
 =?utf-8?B?QmdFdDhaOURDY3A5WVhORkVDM1VsRzBGUTJKV2dvMElMcEdZaHRzaHpDZks2?=
 =?utf-8?B?TGN2Q2JHYm4rNXBqN2tFN2pXYy9mTWsvRGlUaGZ4SG1PeFFIUHhGcHFXbmlC?=
 =?utf-8?B?ZlpJbG9vTjlpSDRxd1AxOHc5RHJvcWkxMHVCeGQ0RVJ6ZlhGZ2RzU3BGdnFR?=
 =?utf-8?B?MjZPcExyejEyOVMyMmhYZVhIb3cvb1VUaWo0MTM1L0xFajltVHUzcG9tTURh?=
 =?utf-8?B?RGlKcmZBZEY0V3Q2d2J3L2lvREZtQ2xSN204elZCMnpRaHl5azJJZjlrcjYr?=
 =?utf-8?B?Y3dqdHd5RlV4dXBFT3AremJQR09NdUlOdFBQYnhsYWJUK3BhekFPMDlCd0Rz?=
 =?utf-8?B?OW1yZ3RJckplWkZWODUxdndoYUlna1RPNDNqSXBBYjZGWlFLVlBCM2x5QXJw?=
 =?utf-8?B?ME9zNGZpUFhxS1Z6TUQwUHpPUS8vbUZJeWVFNkNzMnpxREw2ZjFtVHRHZ1F1?=
 =?utf-8?B?SEtjNjg0M3VqMFNHUnE3TnBuNXVhakRib3dLZXFMcDJjbUZiV3oxRitzSGVB?=
 =?utf-8?B?ejdxTjhwUUowSldPd0NiaDhnNUg2eFJSN0F1OE5IR0w4KzRSWGV2cXQwSHVz?=
 =?utf-8?B?U3R3Uml6eEM0MVd2ZGhCUitzbFlLYmMxb0J2MWZjb3E2NEhxZ29sSGFtTFBW?=
 =?utf-8?B?Y1lrVGY0bGNnc0RGTW5YVi8zMDNlaEVxQUdta0dRb2xxK2o5S051MllVVXZG?=
 =?utf-8?B?OENsLzk2UTYxU1BFVWFGMUI3QWNWY2xHUU5RVzJPRVlabXpEcy9mS21pNXN2?=
 =?utf-8?B?M1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20cc38d9-9205-489c-79ee-08dc00baa545
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 17:48:01.8331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4f8LiYWYFaQ5/b5sqtPghhlreZcghMtJLSyo6tcyTUIyvspV/qdA6uqBPA3LSEnAfrg27GbNtIhmMzZEIAngrXpZLLnzvIVvDDs3OHoTcxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8483
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
Cc: Harish Chegondi <harish.chegondi@intel.com>, intel-xe@lists.freedesktop.org,
 gzadicario@habana.ai, Robert Krzemien <robert.krzemien@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 19/12/2023 18:40, Umesh Nerlige Ramappa wrote:
> On Tue, Dec 19, 2023 at 06:29:56PM +0200, Lionel Landwerlin wrote:
>> On 19/12/2023 18:26, Umesh Nerlige Ramappa wrote:
>>> On Mon, Dec 18, 2023 at 06:59:57PM -0800, Dixit, Ashutosh wrote:
>>>> On Thu, 07 Dec 2023 22:43:19 -0800, Ashutosh Dixit wrote:
>>>>>
>>>>> +    /**
>>>>> +     * @DRM_XE_OA_PROPERTY_OPEN_FLAGS: CLOEXEC and NONBLOCK flags 
>>>>> are
>>>>> +     * directly applied to returned OA fd. DISABLED opens the OA 
>>>>> stream in a
>>>>> +     * DISABLED state (see @DRM_XE_PERF_IOCTL_ENABLE).
>>>>> +     */
>>>>> +    DRM_XE_OA_PROPERTY_OPEN_FLAGS,
>>>>> +#define DRM_XE_OA_FLAG_FD_CLOEXEC    (1 << 0)
>>>>> +#define DRM_XE_OA_FLAG_FD_NONBLOCK    (1 << 1)
>>>>> +#define DRM_XE_OA_FLAG_DISABLED        (1 << 2)
>>>>
>>>> I am wondering why these flags should be part of this uapi:
>>>>
>>>> * O_CLOEXEC and O_NONBLOCK can be set on the returned stream fd 
>>>> using fcntl
>>>>  (see man 2 fcntl)
>>>
>>> I think the O_CLOEXEC was used so that a fork doesn't carry over the 
>>> fd to the child. For the OA use case, we want to prevent that.  
>>> However, these flags don't really need to be passed separately. They 
>>> can be flags in the stream open property.
>>>
>>> Umesh
>>>
>>
>> You know that the application can set those flags by using the 
>> fcntl() syscall?
>>
>> It doesn't look like it's a useful feature to add in the driver.
>>
>
> Right. It does look like it's not needed in the driver.
>
> I just don't know if there was a reason to include it in the same call 
> as stream open ioctl. My guess is that we didn't want them to be 
> separate calls due the nature of OA use case - privileged and single 
> user. The application could just open a stream fd and fork a bunch of 
> threads and all threads would have access to the stream fd (even if 
> they drop root?).
> Or I might be overthinking this. Maybe it's just there in the driver 
> because fcntl mentions some races that may/may not apply to our use 
> case. In practice, the application will likely call the fcntl right 
> away and since OA does not support multiple users, the above concerns 
> are not relevant, so fine to do it in fcntl.


Yeah I think it's likely userspace driver code that will call fcntl 
right after OA open. So it doesn't look like the KMD needs to also 
handle that with additional flags.


-Lionel


>
> Thanks,
> Umesh
>>
>> -Lionel
>>
>>
>>>> * DRM_XE_OA_FLAG_DISABLED can just be a stream open property, 
>>>> doesn't need
>>>>  to be a fd flag.
>>>>
>>>> Comments?
>>>
>>>
>>>>
>>>> Thanks.
>>>> -- 
>>>> Ashutosh
>>
>>

