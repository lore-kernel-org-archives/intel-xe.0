Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C236FC83F12
	for <intel-xe@archiver.kernel.org>; Mon, 28 Aug 2023 16:30:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA7E10E02E;
	Mon, 28 Aug 2023 16:30:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D7D10E02E
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Aug 2023 16:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693240247; x=1724776247;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4Myq6Uzon9IfarUDowPhZHyg5KOzUrkSOiENNQt6umc=;
 b=XWwgQu/XpgXm7Qw1FwPVIYIDt0k2iklgPdQpZM72ETcfQn33tg6/XwpN
 JYVwR3+C9nb4+YIbc9rGXZ3FGNRt0GEKE8HEHveA1UA/Wt0spow/wTRk9
 a2BfSmvi2VUt2DUXqoc25AYtnPTQcOgRoQKUIekB3Xkt4GcIvtdDAoerU
 mfjkNEs5ySn2n/AAkxz/FV9ZYWh4d9j9eVMGZzUFBgzx+ng8YGy4sMu3c
 0IlREwjasEUVkV64o9FqzxQajoKRiwlktX4cP1BetMinkWTjgQxSTRtb9
 Geu+i+YNDN9emZJag+4A7cT4Bc6Jp/qEuJFqlF7yA5Q+90DA/DJ04b9CN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="375112661"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; d="scan'208";a="375112661"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2023 09:30:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="688156168"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; d="scan'208";a="688156168"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 28 Aug 2023 09:30:44 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 28 Aug 2023 09:30:44 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 28 Aug 2023 09:30:44 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 28 Aug 2023 09:30:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V3erQOHa+88rnXYnpHimvQ+orGCu1QZslnTNCi7L1PB0jk7Uk87xhBh9wN3dYLu+anF8yIZ4HqC+bGWd5ulzl2jjFrcDjj/2B+g7L6G04fCenm4wI/yPAqzdy7vlyAc9t+rHoPXMpHhSYubsduimHgJDDnWvkHpSSndRS92M2wYyZZsm2bFWyJNMuMUXMZZbXM5aESvmvXCWtrkCYjMpCgaYzUxlFdvlN5faB4DR214Zo2/OQoDCqaerSM7au27QKrt7/idYRwo+Dms/0BLI56WgliHhY6yxEILNJG4p6h+C6eArq2gscZGcs9DJKqbVZDYg3l7r9Ibueey2a+uoZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LgM7uM7GrUrdeEfN1v2HK5GyaKO27weQ8q8Upfed9k8=;
 b=Thhzk2GhntfUPCbOlKWS66dR+mIxRDqV3hbV69suc7ugMVf9UYfAKRPsj5C7AX7zOseUuiRhSHu2nfSxKdllsQ36PZpLJzRqCZDrA7X/mZA75Tbmq1R6s6ZY+bPCNZCZzR4ChXjSO9GVezABEcOw95n2BPxHQgbsqm77D/GJZ03KxWKpzTCAjxsfjF74g8vaGRiZ+82gb1lOALPy7FrRc9JXiBCbxg6jV/0e2EpbpAzNeK+uarvS/zBMfbRflMOh2zwx7x3sfymgxfRPKihuZF3oGX29f85wPfIGzwbhu6dGuzYQHdrkPaTS8G86Lae+eWLVrwYBRLD1gBQEOheGgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH0PR11MB4821.namprd11.prod.outlook.com (2603:10b6:510:34::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 16:30:41 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8f69:4054:118d:a19b]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8f69:4054:118d:a19b%4]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 16:30:41 +0000
Message-ID: <f7e1d567-a7ce-fe10-87d9-3b5c3b104bf6@intel.com>
Date: Mon, 28 Aug 2023 22:00:31 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230824174618.1560317-1-badal.nilawar@intel.com>
 <CY5PR11MB621124B2BA3F61F7DF797A0C95E0A@CY5PR11MB6211.namprd11.prod.outlook.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <CY5PR11MB621124B2BA3F61F7DF797A0C95E0A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0229.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::11) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH0PR11MB4821:EE_
X-MS-Office365-Filtering-Correlation-Id: b0814eb4-e319-4d42-dace-08dba7e41ebe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dY6kfuGNeXOthT3W9YI0Hay5LRoRREFp4oK8ReasWCa0MVi28AsiFlCM/Gj7+rCi/fMGhpv60ROrfBJSP/eKXPSg2lpSvD/25BbninIjZTzh7SvqfBCVvpwoxMLbGF6itOMCCg0c7VNnayeUpoaTsRk304u8FHUNi4ARuZCVxxT9YcZBkDKfoUZgrx+W+ZUhcMwcbZE7zKSRTABhnaQuGytZX2HRKDtJVIUyd6ihDMCUwNUA57Nru0epbF9ExFmJYNqGIPrtMNSez15xmFkDA7Hi/UgmrGvu9rYsq3M0ee/Zhrjl6h53VL9cgs+cWGzchWk3c6BOVDUhCyB5jTSRiPBwJ1aSp+POaP+Qj75uBd3snXb5p5AnbjjA7ctgpwXF6RJqp3yMG3ZmB4v6MTHpMp9XGuF5QFV0BRdfMvJ662fdjUavldofAy4Kpg+QRYzOCOmXLmaHOWh7MbiZhvRAAsnfNC+Dhzi8pgkdIMy4queITzn8/WrD9RvmQaWTSzuQX92D6owXKnJxhBj5L1uFlUle0cg1cB4H+orWJGYtlECiJ536S5S5zzdIpHCcP9Q+GLBB2vuUmnN4wKC6EwbyzdTNiImPlAN4+CN9YAkIkYgucyd+LIBDN44CNS+fpzUAa36kAXlQKAJMK76/EmJLgw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(346002)(39860400002)(396003)(451199024)(1800799009)(186009)(31686004)(6506007)(6666004)(6486002)(6512007)(36756003)(86362001)(31696002)(82960400001)(38100700002)(2616005)(107886003)(478600001)(2906002)(26005)(83380400001)(53546011)(110136005)(66556008)(66476007)(66946007)(41300700001)(4326008)(8676002)(8936002)(5660300002)(15650500001)(54906003)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REMyaUh4NFRZNDRsd2o3QUpQK3R0R1h3Z01meVdPZXVkSmNBQVhDQW5Ma1pD?=
 =?utf-8?B?QXZzZkFNMDlKZThneTJkMEkyQTJFOXA3THF0L3dVNzRWMnFHK1NoK01aN29n?=
 =?utf-8?B?MzZrTm42anhaVjVYMXhrQllIa0t6cVB0T0h5UnZIWXUrejZ6R1lPRWJMMUVG?=
 =?utf-8?B?ZDM5dWZFdnpMV0VuU3dCell2ZjBjNExNK2VuaDdFZUk5azI2b3E5bG1TNm1D?=
 =?utf-8?B?cWk1bjRvQlgvTzJDaFg2SndCVEdUZ1N3UXBhaEUwYXd4dC81SU9qUDRQOERF?=
 =?utf-8?B?MUgwTGRRRk5VWC9WcU0weGp6VGdxRXdWYWQ5TVhhOTdPMG5yYi9BZGNNcG9l?=
 =?utf-8?B?MGdsVHYrVWl4NjhuSWR3WitjaG1oeXR5a3F4RUk2cm5kenAxMmRPTkxxUm1F?=
 =?utf-8?B?b3RvOE94REpyWDZvQlhrdktrQkZtSUFOZlBBcGZmQ3ArbytsblVscmhXS1ZT?=
 =?utf-8?B?Q3pHWGtkeEVjVnZYaVdGZlhCL2JQR2pheFpDT01DSUFyNldDQVlDMlVHVzFL?=
 =?utf-8?B?VUwzbnRvQjRUT3NVZlpudFViV3YvRkdHNzQwZXlkVzlvbGtmK0pLRGk4Ykgz?=
 =?utf-8?B?czQwUVI1LzczQ3ZRVmkxam9jcW44Mi8zMGl0dHJFNFIrdnZOSzcydjl4aVRp?=
 =?utf-8?B?UzlGcGcwNmIvdm5CTURVTWlIVjhnNWFGenlmQWYyeGVKVGpkbGNJdlMzak4w?=
 =?utf-8?B?SU42QldZZENGNEMwU0d3eXBhdFRTZHlLNU9tS3c4TmdTVVRGUWRLb2l6LzB2?=
 =?utf-8?B?VUJLcDR2Z044Wm5YZTVTTHNNMkFnVXkrZ3ZqblphcWJqZ2Jja0xqVWV0TFJQ?=
 =?utf-8?B?NWlISE41T1I0dEMrRmY0Z0NqaVVzU0syZjRQNmJXMUE1Q3FHUnExcTZOb3Aw?=
 =?utf-8?B?SXY2djlxUXBrOVpMb08yOWlGN0Nncnc5K2FTMXd1SHlMSVE1QUFJRWNCRnUr?=
 =?utf-8?B?ZEp6YUVsZURYaFJ2MUhncUVERnRKNlExczFpYTBtaktSSTlXMnEzSzlxNmtO?=
 =?utf-8?B?dHlDSkppVndRb2JYRmUzWUtOelFWUzVSc1VabGcza0FhTHVEQWcrM3liM1Zt?=
 =?utf-8?B?RlhrQUhyM1VMdm1qZFdWcFV0VzhWY2VQVU95YzdJeklvVm1QdE1Yazc5RzNK?=
 =?utf-8?B?Tlk1NkpzVkNuWTZpU3VGK3k2R0ExRGFTRmpNdDFoeHJhbW9vZkZObS9YaVRJ?=
 =?utf-8?B?RVErZ3hTc2p5ZzAwYW1aR2lDRnhQTEo4bkNiUENoVGRSd0FuM25ZdGIwUnpL?=
 =?utf-8?B?bDdpRVA4ZVkvVXpPNVVLVDIxT0Rhbkc0U0dkWk9PN3V6aWRFUGx5b2FQOU9u?=
 =?utf-8?B?RnFNMmkxdnlWQ1ZDV09oTlZVdGtnM2Z4RkFPT3dHRjlsM0U0cnBZWDdTL0U5?=
 =?utf-8?B?RW1QU0tyWVAvTHVHV2pYRGhOMVhTNVJTV2xkSmV1aG5JYmRtc3lSVEVucExR?=
 =?utf-8?B?TkhDOGhuSHlnYW5NZ2RZcFUwL0VCZFB5Tko1cEVUeUY2a05jd2MreURtNUtP?=
 =?utf-8?B?NkNRNFFmUGdwWkpsYlNRVEVWMVIxaEllYisyNWlaSDF2QjZ0Q2RCUFVObjJY?=
 =?utf-8?B?aTNQem05VEJsSEpQS3hhTzFsMDVGZXV6L3JRMXRtK09YbUVWcERHbjJMUzFW?=
 =?utf-8?B?dGtqcTlMMno0QkJaTEY0eXJoZVJOT3lxSmREdDVyK2NKZjFUUlNNYVF3bkJ6?=
 =?utf-8?B?OUUyNW9VMUhyOEpCdzVvY0tuOXVuRzE4emJSRFBGMTAxY0VtVUZabVVkUEh2?=
 =?utf-8?B?ZXRoU3RHUXVMVzc2Y2V5Wm1WcG5VaW8xS3liT0NWU0tUSXVldXpvOHBVUlZE?=
 =?utf-8?B?VTZDSTRaZTJMOGhJVkZyeXcxYUdQN08xRXQ1SDRXQmpXZHphaHE0QUZOdGpK?=
 =?utf-8?B?K1FvNXcwNWlDQjB6K2Y4Mi9BWitYSlVwNnVYanBkcFpHV0pIY0VIdnNyZ3Ru?=
 =?utf-8?B?aVg3djMzcG1yTXF2a2htSmw0TitUaXJWVFV2NjUwQ1NRa0ZYMVVhZ1hBN01W?=
 =?utf-8?B?MnZ5V3RLeFFIWUJqRGtwN2FPWm1tRFlPMEJZZm53VGlOelRjWWpqYjJwNTQz?=
 =?utf-8?B?c3cyc3YyVTZCL2NiTkI3ZisvM045UHBQRUlGc0RiOWw3eXRFb1pGdVZqUmNo?=
 =?utf-8?B?KzYxcVJ1TVFSbk5wV251OEs4Y0NxZjN1aHRJTVQrRnNWbjFLa0gzWi9YOEFW?=
 =?utf-8?B?ZkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0814eb4-e319-4d42-dace-08dba7e41ebe
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 16:30:41.4751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qH6XQf8J4TkDiZVI03ICeMFXP5fhXgIuuoNasQL9CGIJ9l+azaCWAOhW7u/Rx3A6sEu7cA8pnH5oJo4IKRddhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4821
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH] drm/xe/dgfx: Release mmap mappings on
 rpm suspend
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
Cc: "Auld, Matthew" <matthew.auld@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 28-08-2023 17:46, Gupta, Anshuman wrote:
> 
> 
>> -----Original Message-----
>> From: Nilawar, Badal <badal.nilawar@intel.com>
>> Sent: Thursday, August 24, 2023 11:16 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Auld, Matthew
>> <matthew.auld@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
>> Subject: [RFC PATCH] drm/xe/dgfx: Release mmap mappings on rpm
>> suspend
>>
>> Release all mmap mappings for all vram objects which are associated with
>> userfault such that, while pcie function in D3hot, any access to memory
>> mappings will raise a userfault.
>>
>> Upon userfault, in order to access memory mappings, if graphics function is in
>> D3 then runtime resume of dgpu will be triggered to transition to D0.
> IMO we need a configurable threshold to control the behavior of mmap mappings
> Invalidation, if vram usages is crosses to certain threshold, disable the runtime PM for
> entire life time of mapping.
Agreed. Other option could be disable rpm on server descrete graphics 
for entire life time of mapping. But mainitaning threshold is more 
promising and gives control to user.

Regards,
Badal
> Thanks,
> Anshuman Gupta
>>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c           | 53 ++++++++++++++++++++++++++--
>>   drivers/gpu/drm/xe/xe_bo.h           |  2 ++
>>   drivers/gpu/drm/xe/xe_bo_types.h     |  6 ++++
>>   drivers/gpu/drm/xe/xe_device_types.h | 20 +++++++++++
>>   drivers/gpu/drm/xe/xe_pm.c           |  7 ++++
>>   5 files changed, 85 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 1ab682d61e3c..4192bfcd8013 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -776,6 +776,18 @@ static int xe_bo_move(struct ttm_buffer_object
>> *ttm_bo, bool evict,
>>   		dma_fence_put(fence);
>>   	}
>>
>> +	/*
>> +	* TTM has already nuked the mmap for us (see
>> ttm_bo_unmap_virtual),
>> +	* so if we moved from VRAM make sure to unlink this from the
>> userfault
>> +	* tracking.
>> +	*/
>> +	if (mem_type_is_vram(old_mem_type)) {
>> +		spin_lock(&xe->mem_access.vram_userfault_lock);
>> +		if (!list_empty(&bo->vram_userfault_link))
>> +			list_del_init(&bo->vram_userfault_link);
>> +		spin_unlock(&xe->mem_access.vram_userfault_lock);
>> +	}
>> +
>>   	xe_device_mem_access_put(xe);
>>   	trace_printk("new_mem->mem_type=%d\n", new_mem-
>>> mem_type);
>>
>> @@ -1100,6 +1112,8 @@ static vm_fault_t xe_gem_fault(struct vm_fault
>> *vmf)  {
>>   	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
>>   	struct drm_device *ddev = tbo->base.dev;
>> +	struct xe_bo *bo = ttm_to_xe_bo(tbo);
>> +	struct xe_device *xe = to_xe_device(ddev);
>>   	vm_fault_t ret;
>>   	int idx, r = 0;
>>
>> @@ -1107,9 +1121,10 @@ static vm_fault_t xe_gem_fault(struct vm_fault
>> *vmf)
>>   	if (ret)
>>   		return ret;
>>
>> -	if (drm_dev_enter(ddev, &idx)) {
>> -		struct xe_bo *bo = ttm_to_xe_bo(tbo);
>> +	if (tbo->resource->bus.is_iomem)
>> +		xe_device_mem_access_get(xe);
>>
>> +	if (drm_dev_enter(ddev, &idx)) {
>>   		trace_xe_bo_cpu_fault(bo);
>>
>>   		if (should_migrate_to_system(bo)) {
>> @@ -1127,10 +1142,25 @@ static vm_fault_t xe_gem_fault(struct vm_fault
>> *vmf)
>>   	} else {
>>   		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma-
>>> vm_page_prot);
>>   	}
>> +
>>   	if (ret == VM_FAULT_RETRY && !(vmf->flags &
>> FAULT_FLAG_RETRY_NOWAIT))
>> -		return ret;
>> +		goto out_rpm;
>> +	/*
>> +	 * ttm_bo_vm_reserve() already has dma_resv_lock.
>> +	 * vram_userfault_count is protected by dma_resv lock and rpm
>> wakeref.
>> +	 */
>> +	if (ret == VM_FAULT_NOPAGE &&
>> xe_device_mem_access_ongoing(xe) && !bo->vram_userfault_count) {
>> +		bo->vram_userfault_count = 1;
>> +		spin_lock(&xe->mem_access.vram_userfault_lock);
>> +		list_add(&bo->vram_userfault_link, &xe-
>>> mem_access.vram_userfault_list);
>> +		spin_unlock(&xe->mem_access.vram_userfault_lock);
>>
>> +		XE_WARN_ON(!tbo->resource->bus.is_iomem);
>> +	}
>>   	dma_resv_unlock(tbo->base.resv);
>> +out_rpm:
>> +	if(tbo->resource->bus.is_iomem &&
>> xe_device_mem_access_ongoing(xe))
>> +		xe_device_mem_access_put(xe);
>>   	return ret;
>>   }
>>
>> @@ -2108,6 +2138,23 @@ int xe_bo_dumb_create(struct drm_file
>> *file_priv,
>>   	return err;
>>   }
>>
>> +void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo) {
>> +	struct ttm_buffer_object *tbo = &bo->ttm;
>> +	struct ttm_device *bdev = tbo->bdev;
>> +
>> +	drm_vma_node_unmap(&tbo->base.vma_node, bdev-
>>> dev_mapping);
>> +
>> +	/*
>> +	 * We have exclusive access here via runtime suspend. All other
>> callers
>> +	 * must first grab the rpm wakeref.
>> +	 */
>> +	XE_WARN_ON(!bo->vram_userfault_count);
>> +	list_del(&bo->vram_userfault_link);
>> +	bo->vram_userfault_count = 0;
>> +}
>> +
>> +
>>   #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>>   #include "tests/xe_bo.c"
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>> index 0823dda0f31b..6b86f326c700 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.h
>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>> @@ -247,6 +247,8 @@ int xe_gem_create_ioctl(struct drm_device *dev,
>> void *data,
>>   			struct drm_file *file);
>>   int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>>   			     struct drm_file *file);
>> +void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo);
>> +
>>   int xe_bo_dumb_create(struct drm_file *file_priv,
>>   		      struct drm_device *dev,
>>   		      struct drm_mode_create_dumb *args); diff --git
>> a/drivers/gpu/drm/xe/xe_bo_types.h
>> b/drivers/gpu/drm/xe/xe_bo_types.h
>> index f6ee920303af..cdca91a378c4 100644
>> --- a/drivers/gpu/drm/xe/xe_bo_types.h
>> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
>> @@ -68,6 +68,12 @@ struct xe_bo {
>>   	struct llist_node freed;
>>   	/** @created: Whether the bo has passed initial creation */
>>   	bool created;
>> +	/**
>> +	 * Whether the object is currently in fake offset mmap backed by
>> vram.
>> +	 */
>> +	unsigned int vram_userfault_count;
>> +	struct list_head vram_userfault_link;
>> +
>>   };
>>
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
>> b/drivers/gpu/drm/xe/xe_device_types.h
>> index 750e1f0d3339..c345fb483af1 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -328,6 +328,26 @@ struct xe_device {
>>   	struct {
>>   		/** @ref: ref count of memory accesses */
>>   		atomic_t ref;
>> +		/*
>> +		 *  Protects access to vram usefault list.
>> +		 *  It is required, if we are outside of the runtime suspend
>> path,
>> +		 *  access to @vram_userfault_list requires always first
>> grabbing the
>> +		 *  runtime pm, to ensure we can't race against runtime
>> suspend.
>> +		 *  Once we have that we also need to grab
>> @vram_userfault_lock,
>> +		 *  at which point we have exclusive access.
>> +		 *  The runtime suspend path is special since it doesn't really
>> hold any locks,
>> +		 *  but instead has exclusive access by virtue of all other
>> accesses requiring
>> +		 *  holding the runtime pm wakeref.
>> +		 */
>> +		spinlock_t vram_userfault_lock;
>> +
>> +		/*
>> +		 *  Keep list of userfaulted gem obj, which require to release
>> their
>> +		 *  mmap mappings at runtime suspend path.
>> +		 */
>> +		struct list_head vram_userfault_list;
>> +
>> +		bool vram_userfault_ongoing;
>>   	} mem_access;
>>
>>   	/** @d3cold: Encapsulate d3cold related stuff */ diff --git
>> a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c index
>> 0f06d8304e17..51cde1db930e 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -172,6 +172,8 @@ void xe_pm_init(struct xe_device *xe)
>>   	}
>>
>>   	xe_pm_runtime_init(xe);
>> +	INIT_LIST_HEAD(&xe->mem_access.vram_userfault_list);
>> +	spin_lock_init(&xe->mem_access.vram_userfault_lock);
>>   }
>>
>>   void xe_pm_runtime_fini(struct xe_device *xe) @@ -205,6 +207,7 @@
>> struct task_struct *xe_pm_read_callback_task(struct xe_device *xe)
>>
>>   int xe_pm_runtime_suspend(struct xe_device *xe)  {
>> +	struct xe_bo *bo, *on;
>>   	struct xe_gt *gt;
>>   	u8 id;
>>   	int err = 0;
>> @@ -238,6 +241,10 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>>   	 */
>>   	lock_map_acquire(&xe_device_mem_access_lockdep_map);
>>
>> +	list_for_each_entry_safe(bo, on,
>> +				 &xe->mem_access.vram_userfault_list,
>> vram_userfault_link)
>> +		xe_bo_runtime_pm_release_mmap_offset(bo);
>> +
>>   	if (xe->d3cold.allowed) {
>>   		err = xe_bo_evict_all(xe);
>>   		if (err)
>> --
>> 2.25.1
> 
