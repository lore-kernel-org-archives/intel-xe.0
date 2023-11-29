Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B658C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 04:54:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 624AE10E05D;
	Wed, 29 Nov 2023 04:54:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A823410E05D
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 04:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701233654; x=1732769654;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=Sp3GA4goxQEoskaycwF/hfXhjT0VoUP7m1xVEH9UGtU=;
 b=Mm0iVjmGBjjhCzaCqXop4NMDENXKyjBa+NJsjoK1Oir0bLcQRsnrkPw2
 04QsWDWLHnG1garN4mYH2XBryWm4nOIICSwbm3e6dLEjakR6rUAgFwPI1
 c4cTiEAgTg3hh0/nN5UJvbJLY6o9cZRl5gjYlvVomX31mu1HMVaFjmxuB
 H7GgIry0L6Y+zim3T+QCd4cAIYc3lntl2O7/SLejRvVbKHoszH8fqepPM
 iBgqItncgfj8X2r5Ugr8u13EXvDHXucNzkgQ/w962WQYxQqo8HeAOX2b5
 ha+OqV9JdCTQvqXI/Qa0ybj7bYI86fbJLBgehObItM+Gc/iVhm1rF+A3C w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="11797773"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208,217";a="11797773"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 20:54:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="834879235"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
 d="scan'208,217";a="834879235"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 20:54:03 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 20:54:03 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 20:54:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 20:54:02 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 20:54:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ICeZxQJuQusQgV9TQ6lo9Uyufk647kvfSRfx7xs1DoSixPh1EeCJeijZZzSetG09CLKMDElpq2DvB5Wn4yYjCRZsAHGqT1sSoFD/iiIECKUG95VEuZf1TaALT/+w4jt1q9GUF9aQtY16jbPBS+jL9dcUAcLMhh23s1fEl0kAaUmKYdz5PZOjh8KnkJGwL4x3R1r6TT4aekA6l8+YqSotjEwyE/MdHJ9uG1gp656nvWD4+hr5jbMLtTulYBNxxTHrgnXRgzngoqlWOkaIMjz1qI8awM2L18BdgnWiGknaGfGgqttPCksBgtyTUM2SHRcZzFd4WjllwPIBMXB9wnpDjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZvXHmSGdOnOvuYttf5C2xU4MEP5HIA9iRAJ+T3JSSfQ=;
 b=Tyseu3QGTN5DTmhLW7cbkETkPcHDDD6EyN7iB/eXk7vptsXa5zsq9xTkGuCcax+RxgF/dsKDtOwcoeGUgJ03bzGXSyJ6nMD2PXCW8cWipb+MBUY7531+KHGWkfzNJPCJ58TMf6QyBIXU8hJ15SxhNQhhiB6eKWnFSFuJRFQ3Rn4hu+3DAuZW9T1oVGStWnGPAbXOKroeI2Tg3MenWpFe7ZHBYLkpEhnsXAhGXa4/VYfzNLCuTKu3X5ZMi/J/kiXbZMHhu5cL8FL9/vVEGtpZlGxzRGj+nJRleIQlyX9xd/W4tdaeuiF+Nm3RU9BiyphFXgdu83wz779JQwtAE0gSUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ2PR11MB7504.namprd11.prod.outlook.com (2603:10b6:a03:4c5::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 04:53:59 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c%4]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 04:53:59 +0000
Content-Type: multipart/alternative;
 boundary="------------GavU7JiWkFU0W9s2M7jaCUbF"
Message-ID: <f53f5d64-13c4-4e69-af73-b1110c8fc841@intel.com>
Date: Wed, 29 Nov 2023 10:23:53 +0530
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231121100906.3587649-1-himal.prasad.ghimiray@intel.com>
 <20231121100906.3587649-4-himal.prasad.ghimiray@intel.com>
 <797b983ed6313c2866c8b02aa73a5cab1fc4d4a3.camel@linux.intel.com>
 <64d14c6f-ceef-4193-9a35-bfd1f6e7c9da@intel.com>
 <076f7618-4bf3-1b5c-cd47-b1f9bd835020@linux.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <076f7618-4bf3-1b5c-cd47-b1f9bd835020@linux.intel.com>
X-ClientProxiedBy: BM1P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::35) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SJ2PR11MB7504:EE_
X-MS-Office365-Filtering-Correlation-Id: 56b2ada6-05ea-450c-efc4-08dbf0973341
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ChNyox7xdJ+VObKZYNhxpUjLZkpZN3G5/dQtVtMz2ytrs2FIHZ7VDBoIDyhXL52CeYD3i9pSKdYa5RH6kW390tOqBBVH6kYuDDyTqZ1mPXRCjRyWwbHWVcQ+obj9eFgqZkq38Ec7TB7xFlICj0XwVso+kcRaSw4QBR2Imc18iqBRi2D3TXmvfvc5ag9WAqNIPl0NId+E4llFcM30Pmw3NpEGX2B3xr0ndPf+0ThVrw1odx7LzCe+bPT2TAzRCIJuOENb5T1WyWT1PE+OZ2f6057NRUCaFLopnVIaCWY3EhwfJB/Q88g9l9KtRBYDYUzQBYuQpfh4ztU4tQMVj4e2zqedBB7DkrbYESIVgVIepvs6lBaQ84QpfvWrjWg+8+ma0Cp9kr/BBhct2xdjV27KlPMYSGSl0WlqrhXFYi8fIQ/j70nDQ5CugOexZzQQN5MXOdPqB207kuxTZ9spFmGWyo5P2SuNc+2rEf573fDUmGy6VC/ezgyhq0NRmIXSVi5xdU7TnsSwNQkvHLH2RnTrtGi19G31fs+HSHmLtfCRgUI9qWAWXB4c8iCYm+SI+sxBoAj2xuiDm3IyUt8Xo4dsLe8orfhhqbHcRj4QOeWUzf41vSaJSt79OYBQFlqCIN45+sAAIWTbCYUuqr7IJSJx2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(39860400002)(376002)(396003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(4001150100001)(31686004)(5660300002)(2906002)(6512007)(6666004)(53546011)(41300700001)(36756003)(8936002)(82960400001)(478600001)(6486002)(66574015)(38100700002)(6506007)(2616005)(8676002)(33964004)(83380400001)(316002)(31696002)(66946007)(66476007)(86362001)(66556008)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXdWa3pUOHdYNmd0RnNVQitKVHhTQ3lHcU9iczhvbzlHa0xGV2sxMGVValJI?=
 =?utf-8?B?cEFaNDdpM1dYejVob1lOUjBvSENPOEZXMGY4UmtkOHdhRU1pU0RGc0tSeWdS?=
 =?utf-8?B?R3NRRk15dGRsblhzNUF3M3hhenJvMENqTHBlaWx2cjVmeXpRVXNBeEo5bkZS?=
 =?utf-8?B?bTJ3L3REZVRsVXlCZmcwVmlrVWRsVm1UdGh3OWQxZlZYYUlobTJhaGVRTG1i?=
 =?utf-8?B?aEZhczdjSVdGbThmZ3FPcGJTYlVWOFNKUm9pd1ZhNTJRZGttOHp6QVM4S2pT?=
 =?utf-8?B?T3dUL3hLUCtGV1Z5eDZoWk85Sk92R0JyRVVmVStYa1RsYmhCOFlNTThzZWNl?=
 =?utf-8?B?bkJrdmpnZEtVTnJYb1FDa0NtaUNKcHRucHFoMjhsQS9lWmxoeHhDRFJGd2lp?=
 =?utf-8?B?V0ViOUJyN3RxdXUyMHdSZFhSRkc2OU5vS1Q1ajgrMm1ScVl2SE9vYVk1S2VK?=
 =?utf-8?B?WXJEd2preVdUc3hVY3VpNFZQRmFyZTVjbU93cUtBRW83aUdTMmg2Sm1ucC85?=
 =?utf-8?B?TVM5QmFBV3g4eWtNNU55V3I5V24rYWNzWTBST2RQQWJ5NHNNQ1JWTFVMek9o?=
 =?utf-8?B?b1ZGNG04NU5xV1J6SmNBeWFLTEMybEhUK2FVekNiNlVaVzJRWitIYUgyUmtH?=
 =?utf-8?B?ekUzdmgwNFo2TDRmajlFcU1IZnoxeWNKRmY5UUVIYXNPbVQ3NXlxS2dMVVRS?=
 =?utf-8?B?akpGSUhlQUFFTzg1Y3kyWDdtcnlLQ2pEK1N4eTFOeWxXYzBnQWp6MEdEVkdh?=
 =?utf-8?B?ODM3NU9MM2k0UTVXUlplcnpzdjR3U0w5WDg0Zk5jcDhlWDZ1Ylg4SCtpVVF1?=
 =?utf-8?B?d0liM1dVQkhpVmZCUmo2R04xSndvQ0s4UlBYdXhhdFRaaGlGR2xRbE8rN2Zh?=
 =?utf-8?B?ZlgzOWtUa3VWM1Y1SGpCLzA5d2wxTUpIMHhzNVAvSUR1RWxabEFHbk5obWN6?=
 =?utf-8?B?TkljVENDeUl1NTdOOStZWlRnR0tXeCt6TFF6VlJWMnprRmloY3l4aEpnRXZn?=
 =?utf-8?B?R2x0K3kwUzNZdEo3Q0VlUFZ3c2dKNUtSWjU0WDdDOVRtOTdIWGhiVXJFMjFu?=
 =?utf-8?B?Q1pFMU8yWkdzKzFoMlN6OEl3Z2IzREFLaXE1UmhMVk5wUU5jNzVLSmNUaEJG?=
 =?utf-8?B?WDg1Q2tnT09NVlgwaWM1STQ3UGRPODJvS1NHMjl5Rk9ZT0piVjl3MjJMdGxK?=
 =?utf-8?B?Umh6MmZDbVpPRS9nSTVBMUpLNkhDRUJwWUYyeHBsMFBCTE90ejZDeDR3YlBk?=
 =?utf-8?B?SUhrTmI2OFFoQW9EcEdGWXgwb29yeDVtcTFCcUVYWm0xM0wvVVJDMW0vQ0c4?=
 =?utf-8?B?eTc4MEQ0N0JKTFpvNWVGaUxacTVIK1BjNk12NmtPcjFmT1FJdHc3VkJWN2lW?=
 =?utf-8?B?ZWx6d1g0QzZCaUJPdEtBT2R2ZDZNMjlrRWtSbEFkVlZObEhiNjRyN2tOV1hx?=
 =?utf-8?B?VXRWT3M0aWtoVk5GOHBwRHpjcFJXSnpFTkJGQmFGdG5RQ0I2K1h1R2lVVVNw?=
 =?utf-8?B?a0x4ZjdRQ1lkU1ZPMithdWJsTVREdVZxM3Jrbmkrd1ZYRFNIM3R0dCt1amdI?=
 =?utf-8?B?ZnhBTDlOMG1pMENYNmpXbHYzSGNsWEUxUFdkR3Npbk1WYmFGSm9GS3Q3ZHM3?=
 =?utf-8?B?WTkwTmdKUHc1clVSYWlTVC8wY21xT0FjRjlMQVZHYkdDOWEvWnZpc2hkQW5w?=
 =?utf-8?B?K0lLMTB0elRUKzVPVVBSODNjdGdCc0tSVlNaOHptT3N2eGpYUTVrZFFhMmVQ?=
 =?utf-8?B?U1Y5ODJoTExZdnhkSng1M0VsMFlOZW9mZ2crcXJGZk8ySGZYQ1BWVzZrd3lB?=
 =?utf-8?B?ZHJma0x0WmJucGowQUtFNnllcEtobDZWNEszQWdGVnZFdDNIV3Q0SGZEcGFr?=
 =?utf-8?B?am5FWHZtc2pEV1hieEhSazNnQmhEblVBODdyU2RBRUFjcmt3cllZb3RmNUtG?=
 =?utf-8?B?clhkdGxIVldxN2YxTm54bCtFK1VpUXNiVXFwUFRWYWhPQTM4ZUJBTmV2dTVX?=
 =?utf-8?B?OUZQeGtWTWZncUM5ZzZzVTMxbHg5Y3VrSkUvWUR6Q0w1MVhxTFJBTVJRcDdZ?=
 =?utf-8?B?OHBURDk2bVpLd1lDZWxnZk9PWDQxdXh1N2Jwc3ZWaXE1SVBxWEZxazRKNWtJ?=
 =?utf-8?B?ZUI3VkZzczV0RnBUMG9nVlVLSmoxR3NlWjM2ckFzZHN1YUlOSnZNNkNzcFhW?=
 =?utf-8?Q?0PYAqKU8TZ51+LKKGdAjfXA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56b2ada6-05ea-450c-efc4-08dbf0973341
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 04:53:59.6625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2a7zQ0gdTuzA5DPFTNYeDkNwL3UN/NqfuVOM0RgFSCD8f8VOzJqJqZFEw21mUOoZ5v/2Xo7WnmA8jLbI8G47XczqThCayBwbcT7mE8uK5u0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7504
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC v2 3/6] drm/xe/xe2: Allocate extra pages for
 ccs during bo create.
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

--------------GavU7JiWkFU0W9s2M7jaCUbF
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 27-11-2023 15:11, Thomas Hellström wrote:
>
>
> On 11/27/23 04:19, Ghimiray, Himal Prasad wrote:
>>
>>
>> On 24-11-2023 16:39, Thomas Hellström wrote:
>>> On Tue, 2023-11-21 at 15:39 +0530, Himal Prasad Ghimiray wrote:
>>>> Each byte of CCS data now represents 512 bytes of main memory data.
>>>> Allocate extra pages to handle ccs region for igfx too.
>>>>
>>>> Bspec:58796
>>>>
>>>> Cc: Thomas Hellström<thomas.hellstrom@linux.intel.com>
>>>> Signed-off-by: Himal Prasad Ghimiray
>>>> <himal.prasad.ghimiray@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  2 +-
>>>>   drivers/gpu/drm/xe/xe_bo.c                | 15 ++++++---------
>>>>   drivers/gpu/drm/xe/xe_device.c            |  2 +-
>>>>   3 files changed, 8 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>>>> b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>>>> index 4402f72481dc..7f74592f99ce 100644
>>>> --- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>>>> +++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>>>> @@ -16,7 +16,7 @@
>>>>   #define   XY_CTRL_SURF_MOCS_MASK       GENMASK(31, 26)
>>>>   #define   XE2_XY_CTRL_SURF_MOCS_INDEX_MASK     GENMASK(31, 28)
>>>>   #define   NUM_CCS_BYTES_PER_BLOCK      256
>>>> -#define   NUM_BYTES_PER_CCS_BYTE       256
>>>> +#define   NUM_BYTES_PER_CCS_BYTE(_xe)  (GRAPHICS_VER(_xe) >= 20 ?
>>>> 512 : 256)
>>>>   #define   NUM_CCS_BLKS_PER_XFER                1024
>>>>   
>>>>   #define XY_FAST_COLOR_BLT_CMD          (2 << 29 | 0x44 << 22)
>>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>>> index 4305f5cbc2ab..4730ee3c1012 100644
>>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>>> @@ -2074,19 +2074,16 @@ int xe_bo_evict(struct xe_bo *bo, bool
>>>> force_alloc)
>>>>    * placed in system memory.
>>>>    * @bo: The xe_bo
>>>>    *
>>>> - * If a bo has an allowable placement in XE_PL_TT memory, it can't
>>>> use
>>>> - * flat CCS compression, because the GPU then has no way to access
>>>> the
>>>> - * CCS metadata using relevant commands. For the opposite case, we
>>>> need to
>>>> - * allocate storage for the CCS metadata when the BO is not resident
>>>> in
>>>> - * VRAM memory.
>>> Please extend modify this comment rather than deleting it
>> Sure. Will address in next patch.
>>>> - *
>>>>    * Return: true if extra pages need to be allocated, false
>>>> otherwise.
>>>>    */
>>>>   bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
>>>>   {
>>>> -       return bo->ttm.type == ttm_bo_type_device &&
>>>> -               !(bo->flags & XE_BO_CREATE_SYSTEM_BIT) &&
>>>> -               (bo->flags & XE_BO_CREATE_VRAM_MASK);
>>>> +       struct xe_device *xe = xe_bo_device(bo);
>>>> +
>>>> +       return (xe_device_has_flat_ccs(xe) &&
>>>> +               bo->ttm.type == ttm_bo_type_device &&
>>>> +               ((IS_DGFX(xe) && (bo->flags &
>>>> XE_BO_CREATE_VRAM_MASK)) ||
>>> It looks like you have removed a restriction for DGFX here: If the BO
>>> has SYSTEM set, then ccs pages are not needed.
>>
>> Is ((IS_DGFX(xe) && (bo->flags & XE_BO_CREATE_VRAM_MASK)) not suffice 
>> to ensure
>>
>> that for DGFX BO is only in VRAM region ?
>>
> No. It can also has the the CREATE_SYSTEM_BIT set, and then the 
> content can't be compressed.
>
> /Thomas
>
Thanks for the clarification. Will address this is next version.

BR

Himal

>
>
>>>> +               (!IS_DGFX(xe) && (bo->flags &
>>>> XE_BO_CREATE_SYSTEM_BIT))));
>>>>   }
>>>>   
>>>>   /**
>>>> diff --git a/drivers/gpu/drm/xe/xe_device.c
>>>> b/drivers/gpu/drm/xe/xe_device.c
>>>> index 07a3e4cf48d1..265f9ffc5323 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>>> @@ -551,7 +551,7 @@ void xe_device_wmb(struct xe_device *xe)
>>>>   u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
>>>>   {
>>>>          return xe_device_has_flat_ccs(xe) ?
>>>> -               DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE) : 0;
>>>> +               DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE(xe)) : 0;
>>>>   }
>>>>   
>>>>   bool xe_device_mem_access_ongoing(struct xe_device *xe)
--------------GavU7JiWkFU0W9s2M7jaCUbF
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 27-11-2023 15:11, Thomas Hellström
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:076f7618-4bf3-1b5c-cd47-b1f9bd835020@linux.intel.com">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 11/27/23 04:19, Ghimiray, Himal
        Prasad wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:64d14c6f-ceef-4193-9a35-bfd1f6e7c9da@intel.com">
        <p><br>
        </p>
        <div class="moz-cite-prefix">On 24-11-2023 16:39, Thomas
          Hellström wrote:<br>
        </div>
        <blockquote type="cite" cite="mid:797b983ed6313c2866c8b02aa73a5cab1fc4d4a3.camel@linux.intel.com">
          <pre class="moz-quote-pre" wrap="">On Tue, 2023-11-21 at 15:39 +0530, Himal Prasad Ghimiray wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Each byte of CCS data now represents 512 bytes of main memory data.
Allocate extra pages to handle ccs region for igfx too.

Bspec:58796

Cc: Thomas Hellström <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com" moz-do-not-send="true">&lt;thomas.hellstrom@linux.intel.com&gt;</a>
Signed-off-by: Himal Prasad Ghimiray
<a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com" moz-do-not-send="true">&lt;himal.prasad.ghimiray@intel.com&gt;</a>
---
&nbsp;drivers/gpu/drm/xe/regs/xe_gpu_commands.h |&nbsp; 2 +-
&nbsp;drivers/gpu/drm/xe/xe_bo.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 15 ++++++---------
&nbsp;drivers/gpu/drm/xe/xe_device.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +-
&nbsp;3 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
index 4402f72481dc..7f74592f99ce 100644
--- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
@@ -16,7 +16,7 @@
&nbsp;#define&nbsp;&nbsp; XY_CTRL_SURF_MOCS_MASK&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;GENMASK(31, 26)
&nbsp;#define&nbsp;&nbsp; XE2_XY_CTRL_SURF_MOCS_INDEX_MASK&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;GENMASK(31, 28)
&nbsp;#define&nbsp;&nbsp; NUM_CCS_BYTES_PER_BLOCK&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;256
-#define&nbsp;&nbsp; NUM_BYTES_PER_CCS_BYTE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;256
+#define&nbsp;&nbsp; NUM_BYTES_PER_CCS_BYTE(_xe)&nbsp;&nbsp;(GRAPHICS_VER(_xe) &gt;= 20 ?
512 : 256)
&nbsp;#define&nbsp;&nbsp; NUM_CCS_BLKS_PER_XFER&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1024
&nbsp;
&nbsp;#define XY_FAST_COLOR_BLT_CMD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(2 &lt;&lt; 29 | 0x44 &lt;&lt; 22)
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4305f5cbc2ab..4730ee3c1012 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2074,19 +2074,16 @@ int xe_bo_evict(struct xe_bo *bo, bool
force_alloc)
&nbsp; * placed in system memory.
&nbsp; * @bo: The xe_bo
&nbsp; *
- * If a bo has an allowable placement in XE_PL_TT memory, it can't
use
- * flat CCS compression, because the GPU then has no way to access
the
- * CCS metadata using relevant commands. For the opposite case, we
need to
- * allocate storage for the CCS metadata when the BO is not resident
in
- * VRAM memory.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Please extend modify this comment rather than deleting it</pre>
        </blockquote>
        Sure. Will address in next patch.<br>
        <blockquote type="cite" cite="mid:797b983ed6313c2866c8b02aa73a5cab1fc4d4a3.camel@linux.intel.com">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">- *
&nbsp; * Return: true if extra pages need to be allocated, false
otherwise.
&nbsp; */
&nbsp;bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
&nbsp;{
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return bo-&gt;ttm.type == ttm_bo_type_device &amp;&amp;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;!(bo-&gt;flags &amp; XE_BO_CREATE_SYSTEM_BIT) &amp;&amp;
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(bo-&gt;flags &amp; XE_BO_CREATE_VRAM_MASK);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;struct xe_device *xe = xe_bo_device(bo);
+
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return (xe_device_has_flat_ccs(xe) &amp;&amp;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bo-&gt;ttm.type == ttm_bo_type_device &amp;&amp;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;((IS_DGFX(xe) &amp;&amp; (bo-&gt;flags &amp;
XE_BO_CREATE_VRAM_MASK)) ||
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">It looks like you have removed a restriction for DGFX here: If the BO
has SYSTEM set, then ccs pages are not needed.</pre>
        </blockquote>
        <p>Is <span style="white-space: pre-wrap">((IS_DGFX(xe) &amp;&amp; (bo-&gt;flags &amp; </span><span style="white-space: pre-wrap">XE_BO_CREATE_VRAM_MASK)) not suffice to ensure </span></p>
        <p><span style="white-space: pre-wrap">that for DGFX BO is only in VRAM region ? </span></p>
      </blockquote>
      <p>No. It can also has the the CREATE_SYSTEM_BIT set, and then the
        content can't be compressed.</p>
      <p>/Thomas</p>
    </blockquote>
    <p>Thanks for the clarification. Will address this is next version.</p>
    <p>BR</p>
    <p>Himal<br>
    </p>
    <blockquote type="cite" cite="mid:076f7618-4bf3-1b5c-cd47-b1f9bd835020@linux.intel.com">
      <p><br>
      </p>
      <p><br>
      </p>
      <blockquote type="cite" cite="mid:64d14c6f-ceef-4193-9a35-bfd1f6e7c9da@intel.com">
        <p><span style="white-space: pre-wrap"></span></p>
        <blockquote type="cite" cite="mid:797b983ed6313c2866c8b02aa73a5cab1fc4d4a3.camel@linux.intel.com">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(!IS_DGFX(xe) &amp;&amp; (bo-&gt;flags &amp;
XE_BO_CREATE_SYSTEM_BIT))));
&nbsp;}
&nbsp;
&nbsp;/**
diff --git a/drivers/gpu/drm/xe/xe_device.c
b/drivers/gpu/drm/xe/xe_device.c
index 07a3e4cf48d1..265f9ffc5323 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -551,7 +551,7 @@ void xe_device_wmb(struct xe_device *xe)
&nbsp;u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return xe_device_has_flat_ccs(xe) ?
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE) : 0;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE(xe)) : 0;
&nbsp;}
&nbsp;
&nbsp;bool xe_device_mem_access_ongoing(struct xe_device *xe)
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------GavU7JiWkFU0W9s2M7jaCUbF--
