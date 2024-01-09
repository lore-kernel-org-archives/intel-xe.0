Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C285C46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 05:11:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B08210E01F;
	Tue,  9 Jan 2024 05:11:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1253710E01F
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 05:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704777102; x=1736313102;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bKM2DF84lsuICdHgWp6yLEVBmUsWUOUPyeqMlg7g4Rk=;
 b=IDtmq/gPe0wfJkbKaDRy6mD87zjAAzNEftXXrzykEjCNHemuL2RjYGSe
 8DelKy9ZBVy/8IxJcyl9xpMiLQIAzFAiqKhtxj7EgoZx91tBr5jK3JF+k
 j0yo6Z9mN8gciCbuvrsWUsbGqauvCaplM8z6B7TJmPfNptQs0qbXjsKNo
 p2ihGTZqKeHAyJ2SSPouqefM005G0aahgBfWDsDVfWl5wp5Iu6BZRSELB
 ql2fxVdMDhHO7sZSKVYzGcMcN9pgPbP2NNssPPHozwTxXZaLL0Obq0bhw
 7SNByTDMj9UhifjDjEZvv9W5wWI3iu87SZhq05qjN5d9vQYrDmBTLL35F w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="4863386"
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; 
   d="scan'208";a="4863386"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2024 21:11:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; d="scan'208";a="23432014"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jan 2024 21:11:41 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Jan 2024 21:11:40 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Jan 2024 21:11:39 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Jan 2024 21:11:39 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Jan 2024 21:11:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FduM6txnp++aczhvPZ7fwZu2MDCuJ4IbY6kazzLKGMTXuY2p4bJSRxT4X7IyjTzz+wxzY2PgEL1Z8ORbWhq6xgHP/xPGXFuyLh/gx8IRpSU4+CImm4ggf52k0Qi9vsuZRRRlEq8xLAYu24xxpMutDIjZiUv39FlHvwZvocb9eHhdcEAiYPlu5kZXcJyozRprFjU+b4jlWMehh4+IT/Q3yXFl95YaoP28q2tY4QVZsSGZPK+u5loAqv/4VhkAhjPnBvotSwkiMBqqqGaDD/M0yNZYrIs/Wyroe0SMiDvf0a7G0ogqKSZkCRLcUoYQDG3A2gcyi5GOp5iDsbnIUSWy8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8nT3kFhAlnVWkt8cH6IAEXtp/3KEZoOTEORtMVDx6r0=;
 b=i1QrvdU/eOdmxt9SOu2O4AvTVN+/8a/WptOuLVsaL7l3lPOxFhxDyG3J6pKTv4PF0ZUapGxelza3VR+7J2EFTj4E5q/RN5uLX029AiiIvFiumJiYWcxuGu/EH3EN/WZShMLhc97ztZCVI9GGCt1It2aGADzhs+Juju5Z+dbPosnAnovrrwpj/jSK6mMU8fP1GrIafnzLuiGEVR3OxEWtGnQpH90J1NfzRN5oUxNJ6nWvBB/IxziNFlSqf157NYWQA3rwVVqVk5FZMJ13XgPd5U5D3rREDxe8wtVANjwxRkqZE2sNyjHpb2jh3+xE9/xdDUejInLH1My1cwy1puo5mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by MW5PR11MB5905.namprd11.prod.outlook.com (2603:10b6:303:19f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 05:11:27 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::7c9d:1857:d17d:53da]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::7c9d:1857:d17d:53da%3]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 05:11:26 +0000
Message-ID: <df4585fc-ccac-40b3-888a-814ed52cae43@intel.com>
Date: Tue, 9 Jan 2024 10:41:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] drm/xe/dgfx: Release mmap mappings on rpm suspend
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240104130702.950078-1-badal.nilawar@intel.com>
 <ZZxvpcBLQbwkneD0@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <ZZxvpcBLQbwkneD0@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::13) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|MW5PR11MB5905:EE_
X-MS-Office365-Filtering-Correlation-Id: b8d2d162-bfc9-4891-d9bf-08dc10d16dea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kqWUwl0flRKUS+FN1tCnAQS60ftCZQxMpAZOfsG4TLhC5QcJsEuO1fFflE5lfJITboP0QCMYLeudaUW50s8i2Jm3sYpBGHSguNrZztv6YzGMVxDpr30Kbn/6mLnee7v3rW4oKDntyATCyNB2JkMxX0xNY6lJ1YNDAkEJLzBjasIcjhtDHHwNGSeT57BSx6PBF3Vky06Rm0bPTYT8ElwYhBiYFr+A3kbEC0k7bLo45jJNrRN2Xbp4n2nK8sS3jAJXyO7TkrJzWbf5QyrYPjQAFdGBEXiZKT6nvpT37PlvI2QjILT/B9SgSt5+zh3WDViw0PrBWGw6fPbKJLqzbTLbQ676GCW1Bu7W9eBktYxSBauIsY2qGshy9YkDcppKK+DvSafnrcZArRHj/V8geWT8ZpU1STig2Knv1pPua65ijWyGFUrca9l2uRq1HjQ/dmByPom8wjcuPJIjI91CtKSxhK6vR9GRqyypnG07kg7lpio9p6ZJIE/I59E4nu2ur2FSVvY0IXDNSXMft+FPnD14vuB+BTo2WfwCKl4aTdBKyrYLUDgZCG4QQAVUl9e41uzeiOGhCTp2O8YeXj3jm0lZ2o48KwIIPLF4VFeocGaqn+tS4sVgfF/izywl7oEoUSA5zb8073v9CZgdZsObdqDpxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(39860400002)(136003)(346002)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(6506007)(2616005)(6486002)(53546011)(26005)(478600001)(6666004)(6512007)(38100700002)(83380400001)(66574015)(30864003)(2906002)(15650500001)(107886003)(41300700001)(66556008)(66476007)(8676002)(316002)(66946007)(4326008)(6636002)(37006003)(8936002)(6862004)(5660300002)(36756003)(82960400001)(86362001)(31696002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qno1c3JxYkI3RXpENVo0RTZNWUN0T290YTRUQkVwQ3lpR25OWXpGUjEvWGJw?=
 =?utf-8?B?K0Q4SUFHcEorM1VDQlhlbE9xbUhnY21BdEJwV25saFE4amVndHJBekpITjhB?=
 =?utf-8?B?UXpJLzFJY2hIc0ZvaHM3d2lEUTNadGI4ZkJpUFRacEQ5dmNuaGx5ZitTaHNy?=
 =?utf-8?B?UEx1QlVRVlM5WisrNmpOR3A1WkdER2xCNkhQQWwwS3M3S0ZMM0dlcVVSRU5B?=
 =?utf-8?B?eDE4L3Q3VUFVc2E0cmhqNTB6VFNDTjlKVlpJTVRnZEVBbWg4SHYyZ0V2YjZi?=
 =?utf-8?B?SmVGNEtLZTZFN2ZaWEdWN0RjOWxONUdKVzFWbS8yUE04aHNDeHN0MUY0KzJU?=
 =?utf-8?B?NGRBZjJTRGNNekVqSEFXVVU3SmxHVFhwa1Z4aFB2K0ZObTNiSERaTkdrNGY4?=
 =?utf-8?B?MEFVN0xySkk5M3dIdkpwNWNnZW4ydThVVXRjdDE2RW52NDNTa1M4MEUyekRq?=
 =?utf-8?B?cXpoUEFQa1lXaVIwNFJGOFNsMXNlWE5sN1h2UDJaTzIyMFQyMXFRNmNLNFE3?=
 =?utf-8?B?Y1Z1aUlwTjF4Yy84a2s3TmZaQVpLemlNdXRVeHV1dGZqRnk1ZXZJNEsrV1BS?=
 =?utf-8?B?aE5Oa3FPN1l0MWR1RXUzdzlRdzJzNXJ2M0JrZlJuL0pnTytYN0VnSVVUeHU0?=
 =?utf-8?B?VloxUnQ4ZlpjMG1zTjFNSFhhWWlIdkZCU0hJU2NPeHdZZlRrakowSUJtRm5N?=
 =?utf-8?B?eTRRWk1lOTlsZ24ybmRHOTBBdktFWW0wMzRCTFQ1ak11UW4wQ1Zmeit5MnYw?=
 =?utf-8?B?ZDIxN1lXYzR5L24yTm9IRkZGSTVSL252YWRNSXlQSXNXdkxXNEtYRHpNdEFi?=
 =?utf-8?B?am8yaVNnZjNDYWVLeWRqWGZsU0IzNFU3b1kzamRVVWltVTAyRjlHSmxQUTVR?=
 =?utf-8?B?SlhBc2xwUWhoRGp3STFKbjg5bmFsUkxDcU91UGN4MDZlYWs0Um5mbzNIUUZQ?=
 =?utf-8?B?K25LSHVBS1huWU1DNkhoMVNUdUhrMDcyMTJtbzFWVVdZQUxIWW1QMmxwUkI1?=
 =?utf-8?B?YVUzRHRHVVlkMkZHSGFtQkcxRU1XeU5ZN2dXbThzM0tEMUVoQlNzQmtPazVX?=
 =?utf-8?B?aEdvQy9ycDhDaVlWZVozZkpSbWVqQi9ieFB3dXVHQVRpNGNaQXVhOHNFN2Z1?=
 =?utf-8?B?R2JJMDArZi9qZUozckVOZ2tCRGFQRnl5SVFKUmhEUHh0MWYxWXczMUVFdU1Y?=
 =?utf-8?B?VXRtdm9MRmovbnAzczhQQnhmdTQ0T2U1Vmp2bnZZZ2syYm9STEFncDJ6VDdz?=
 =?utf-8?B?SFQyRkZ1NEpURTZGNXZMNTYvUW45NEFDQVA3aEU2aDhoYXBRVHZkTHdHb0Z3?=
 =?utf-8?B?azlhUFpXUmF1RHg0NE9GY3l1UHREY3ZwL0hiR05vMG9GejA5NDhzR2paOGpG?=
 =?utf-8?B?WlBwUDdabjFpc2RUclNGOGZYV0NTQTllN2NWWGlrbkY2UHpxdXZhYk5MS04v?=
 =?utf-8?B?N0hPMEJHV2N2ckg2eTU5VkJHRG8xOHd1Q0FNcUc1ckh5OWFxUHRleDZDZkdp?=
 =?utf-8?B?dW5HYjhLUjI5Nld1bmFpZ3hNeG9HYUliekE1c0pwNURFQUFTUTIrUlBkdWhV?=
 =?utf-8?B?c1A5Z3h5WWZtSndJdDBtNTE0TlVRS0x2OVRIWEJTUUIvY1B6NGprT1RmV29a?=
 =?utf-8?B?RjJYOFd0OVNXUU1McytsRCtQak9Nc3hQUE0rTUZtSUpYYmdMR3ZBT3QzSkh5?=
 =?utf-8?B?b2k0VForZzBkOVMzdE5LeVBhRnhwRWxhMU1YMUd3MWZmMzlxYU5RR0dTcDBz?=
 =?utf-8?B?NGhidThGUXdlN1FvdW50cDUrcmxHRVVCcHpRczBSanlNRjFrU3Fzakx0d3pC?=
 =?utf-8?B?dEQ1L2MwMFR5bFRCYkw2ZWthV3Fwb0d0VHNnQzRjVTdBRkkzVHFzTjRjbkF4?=
 =?utf-8?B?TTM5VjdXaDVqSXd4MEZOT3AyN1ZlWlB0V3lad0NnWDhOZVN1OURubXVxaGVD?=
 =?utf-8?B?b1BmMzFIOFRqZk5yMjFPbkVVaDM1UjhDZjM4RW1iMmdMQjJ3VlRVZno3Qy9T?=
 =?utf-8?B?RGVuTUh1Uzl2c0hENGZJSE4zNG1LbHI0NVErcXp0RFpRWVBhYm5XcGwxb0wv?=
 =?utf-8?B?aG9EWTdFREMvSTFXYy9RUzh4SjJTeFBtYnFqNlNQSmI1ckc4QStPQzNmd1Rk?=
 =?utf-8?B?R1pUeTJXSWtiQTVTYWJ5Q21ZNCtOYjRrNU9MUlNKSlAwTkJjTm1MRXJpT2Y5?=
 =?utf-8?B?Mmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b8d2d162-bfc9-4891-d9bf-08dc10d16dea
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 05:11:26.1465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JbpgEmJAhFoN+2eBF72sWgOEfNI6jZgEDng10OCdwJ2fxEJCVCKiWzz4BWEZQJwjBbsVirQeaOFwz37OEHqt0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5905
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
Cc: thomas.hellstrom@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 09-01-2024 03:26, Rodrigo Vivi wrote:
> On Thu, Jan 04, 2024 at 06:37:02PM +0530, Badal Nilawar wrote:
>> Release all mmap mappings for all vram objects which are associated
>> with userfault such that, while pcie function in D3hot, any access
>> to memory mappings will raise a userfault.
>>
>> Upon userfault, in order to access memory mappings, if graphics
>> function is in D3 then runtime resume of dgpu will be triggered to
>> transition to D0.
>>
>> v2:
>>    - Avoid iomem check before bo migration check as bo can migrate
>>      to system memory (Matthew Auld)
>> v3:
>>    - Delete bo userfault link during bo destroy
>>    - Upon bo move (vram-smem), do bo userfault link deletion in
>>      xe_bo_move_notify instead of xe_bo_move (Thomas Hellström)
>>    - Grab lock in rpm hook while deleting bo userfault link (Matthew Auld)
>> v4:
>>    - Add kernel doc and wrap vram_userfault related
>>      stuff in the structure (Matthew Auld)
>>    - Get rpm wakeref before taking dma reserve lock (Matthew Auld)
>>    - In suspend path apply lock for entire list op
>>      including list iteration (Matthew Auld)
>> v5:
>>    - Use mutex lock instead of spin lock
>> v6:
>>    - Fix review comments (Matthew Auld)
>>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com> #For the xe_bo_move_notify() changes
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> 
> pushed do drm-xe-next. Thanks for the patch.
Thanks Rodrigo.

Regards,
Badal
> 
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c           | 56 ++++++++++++++++++++++++++--
>>   drivers/gpu/drm/xe/xe_bo.h           |  2 +
>>   drivers/gpu/drm/xe/xe_bo_types.h     |  3 ++
>>   drivers/gpu/drm/xe/xe_device_types.h | 16 ++++++++
>>   drivers/gpu/drm/xe/xe_pci.c          |  2 +
>>   drivers/gpu/drm/xe/xe_pm.c           | 17 +++++++++
>>   drivers/gpu/drm/xe/xe_pm.h           |  1 +
>>   7 files changed, 93 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 8e4a3b1f6b93..2e4d2157179c 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -586,6 +586,8 @@ static int xe_bo_move_notify(struct xe_bo *bo,
>>   {
>>   	struct ttm_buffer_object *ttm_bo = &bo->ttm;
>>   	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
>> +	struct ttm_resource *old_mem = ttm_bo->resource;
>> +	u32 old_mem_type = old_mem ? old_mem->mem_type : XE_PL_SYSTEM;
>>   	int ret;
>>   
>>   	/*
>> @@ -605,6 +607,18 @@ static int xe_bo_move_notify(struct xe_bo *bo,
>>   	if (ttm_bo->base.dma_buf && !ttm_bo->base.import_attach)
>>   		dma_buf_move_notify(ttm_bo->base.dma_buf);
>>   
>> +	/*
>> +	 * TTM has already nuked the mmap for us (see ttm_bo_unmap_virtual),
>> +	 * so if we moved from VRAM make sure to unlink this from the userfault
>> +	 * tracking.
>> +	 */
>> +	if (mem_type_is_vram(old_mem_type)) {
>> +		mutex_lock(&xe->mem_access.vram_userfault.lock);
>> +		if (!list_empty(&bo->vram_userfault_link))
>> +			list_del_init(&bo->vram_userfault_link);
>> +		mutex_unlock(&xe->mem_access.vram_userfault.lock);
>> +	}
>> +
>>   	return 0;
>>   }
>>   
>> @@ -1063,6 +1077,11 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
>>   	if (bo->vm && xe_bo_is_user(bo))
>>   		xe_vm_put(bo->vm);
>>   
>> +	mutex_lock(&xe->mem_access.vram_userfault.lock);
>> +	if (!list_empty(&bo->vram_userfault_link))
>> +		list_del(&bo->vram_userfault_link);
>> +	mutex_unlock(&xe->mem_access.vram_userfault.lock);
>> +
>>   	kfree(bo);
>>   }
>>   
>> @@ -1110,16 +1129,20 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>>   {
>>   	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
>>   	struct drm_device *ddev = tbo->base.dev;
>> +	struct xe_device *xe = to_xe_device(ddev);
>> +	struct xe_bo *bo = ttm_to_xe_bo(tbo);
>> +	bool needs_rpm = bo->flags & XE_BO_CREATE_VRAM_MASK;
>>   	vm_fault_t ret;
>>   	int idx, r = 0;
>>   
>> +	if (needs_rpm)
>> +		xe_device_mem_access_get(xe);
>> +
>>   	ret = ttm_bo_vm_reserve(tbo, vmf);
>>   	if (ret)
>> -		return ret;
>> +		goto out;
>>   
>>   	if (drm_dev_enter(ddev, &idx)) {
>> -		struct xe_bo *bo = ttm_to_xe_bo(tbo);
>> -
>>   		trace_xe_bo_cpu_fault(bo);
>>   
>>   		if (should_migrate_to_system(bo)) {
>> @@ -1137,10 +1160,24 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>>   	} else {
>>   		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
>>   	}
>> +
>>   	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
>> -		return ret;
>> +		goto out;
>> +	/*
>> +	 * ttm_bo_vm_reserve() already has dma_resv_lock.
>> +	 */
>> +	if (ret == VM_FAULT_NOPAGE && mem_type_is_vram(tbo->resource->mem_type)) {
>> +		mutex_lock(&xe->mem_access.vram_userfault.lock);
>> +		if (list_empty(&bo->vram_userfault_link))
>> +			list_add(&bo->vram_userfault_link, &xe->mem_access.vram_userfault.list);
>> +		mutex_unlock(&xe->mem_access.vram_userfault.lock);
>> +	}
>>   
>>   	dma_resv_unlock(tbo->base.resv);
>> +out:
>> +	if (needs_rpm)
>> +		xe_device_mem_access_put(xe);
>> +
>>   	return ret;
>>   }
>>   
>> @@ -1254,6 +1291,7 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>>   #ifdef CONFIG_PROC_FS
>>   	INIT_LIST_HEAD(&bo->client_link);
>>   #endif
>> +	INIT_LIST_HEAD(&bo->vram_userfault_link);
>>   
>>   	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
>>   
>> @@ -2264,6 +2302,16 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
>>   	return err;
>>   }
>>   
>> +void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo)
>> +{
>> +	struct ttm_buffer_object *tbo = &bo->ttm;
>> +	struct ttm_device *bdev = tbo->bdev;
>> +
>> +	drm_vma_node_unmap(&tbo->base.vma_node, bdev->dev_mapping);
>> +
>> +	list_del_init(&bo->vram_userfault_link);
>> +}
>> +
>>   #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>>   #include "tests/xe_bo.c"
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>> index 97b32528c600..350cc73cadf8 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.h
>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>> @@ -249,6 +249,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>>   			struct drm_file *file);
>>   int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>>   			     struct drm_file *file);
>> +void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo);
>> +
>>   int xe_bo_dumb_create(struct drm_file *file_priv,
>>   		      struct drm_device *dev,
>>   		      struct drm_mode_create_dumb *args);
>> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
>> index 64c2249a4e40..14ef13b7b421 100644
>> --- a/drivers/gpu/drm/xe/xe_bo_types.h
>> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
>> @@ -88,6 +88,9 @@ struct xe_bo {
>>   	 * objects.
>>   	 */
>>   	u16 cpu_caching;
>> +
>> +	/** @vram_userfault_link: Link into @mem_access.vram_userfault.list */
>> +		struct list_head vram_userfault_link;
>>   };
>>   
>>   #define intel_bo_to_drm_bo(bo) (&(bo)->ttm.base)
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 71f23ac365e6..dd0f4fb57683 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -385,6 +385,22 @@ struct xe_device {
>>   	struct {
>>   		/** @ref: ref count of memory accesses */
>>   		atomic_t ref;
>> +
>> +		/** @vram_userfault: Encapsulate vram_userfault related stuff */
>> +		struct {
>> +			/**
>> +			 * @lock: Protects access to @vram_usefault.list
>> +			 * Using mutex instead of spinlock as lock is applied to entire
>> +			 * list operation which may sleep
>> +			 */
>> +			struct mutex lock;
>> +
>> +			/**
>> +			 * @list: Keep list of userfaulted vram bo, which require to release their
>> +			 * mmap mappings at runtime suspend path
>> +			 */
>> +			struct list_head list;
>> +		} vram_userfault;
>>   	} mem_access;
>>   
>>   	/**
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 1f997353a78f..4de79a7c5dc2 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -775,6 +775,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>   		str_yes_no(xe_device_has_sriov(xe)),
>>   		xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
>>   
>> +	xe_pm_init_early(xe);
>> +
>>   	err = xe_device_probe(xe);
>>   	if (err)
>>   		return err;
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index b429c2876a76..d5f219796d7e 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -163,6 +163,12 @@ static void xe_pm_runtime_init(struct xe_device *xe)
>>   	pm_runtime_put(dev);
>>   }
>>   
>> +void xe_pm_init_early(struct xe_device *xe)
>> +{
>> +	INIT_LIST_HEAD(&xe->mem_access.vram_userfault.list);
>> +	drmm_mutex_init(&xe->drm, &xe->mem_access.vram_userfault.lock);
>> +}
>> +
>>   void xe_pm_init(struct xe_device *xe)
>>   {
>>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> @@ -214,6 +220,7 @@ struct task_struct *xe_pm_read_callback_task(struct xe_device *xe)
>>   
>>   int xe_pm_runtime_suspend(struct xe_device *xe)
>>   {
>> +	struct xe_bo *bo, *on;
>>   	struct xe_gt *gt;
>>   	u8 id;
>>   	int err = 0;
>> @@ -247,6 +254,16 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>>   	 */
>>   	lock_map_acquire(&xe_device_mem_access_lockdep_map);
>>   
>> +	/*
>> +	 * Applying lock for entire list op as xe_ttm_bo_destroy and xe_bo_move_notify
>> +	 * also checks and delets bo entry from user fault list.
>> +	 */
>> +	mutex_lock(&xe->mem_access.vram_userfault.lock);
>> +	list_for_each_entry_safe(bo, on,
>> +				 &xe->mem_access.vram_userfault.list, vram_userfault_link)
>> +		xe_bo_runtime_pm_release_mmap_offset(bo);
>> +	mutex_unlock(&xe->mem_access.vram_userfault.lock);
>> +
>>   	if (xe->d3cold.allowed) {
>>   		err = xe_bo_evict_all(xe);
>>   		if (err)
>> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
>> index 6b9031f7af24..64a97c6726a7 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.h
>> +++ b/drivers/gpu/drm/xe/xe_pm.h
>> @@ -20,6 +20,7 @@ struct xe_device;
>>   int xe_pm_suspend(struct xe_device *xe);
>>   int xe_pm_resume(struct xe_device *xe);
>>   
>> +void xe_pm_init_early(struct xe_device *xe);
>>   void xe_pm_init(struct xe_device *xe);
>>   void xe_pm_runtime_fini(struct xe_device *xe);
>>   int xe_pm_runtime_suspend(struct xe_device *xe);
>> -- 
>> 2.25.1
>>
