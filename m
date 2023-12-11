Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0C2C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 05:15:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C0B010E244;
	Mon, 11 Dec 2023 05:15:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A83810E07A
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 05:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702271734; x=1733807734;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=QEhzM0SEr++2tP4J7tDqaUNKc4G5Q9ueDidj1vGkyi0=;
 b=OGXbVsfsC0ieXrsXpa7jFs/LIoYba+JIqt6H7DUWgijaKcvFQ2nc7fC9
 24XDYnrrZ/i/UIquK4t5uVjcYTKFTWzAHiqaLPLlGFcL+KU+94bKf3MvU
 Xw1n56VO353ItG7GIMpkJUOjelen5UzOIDK3sXA8IPDCl+BAJ9E2EHlay
 QwM1ZnTAZ1gIxFdHFWghuK7V1xa6O3iLkmdLigfefgaDvEhxKuGsTDpTX
 aUq6IzayJarxoFnB+k3siynINgkPXWLVqqdbCz1LjJgcy9PVV28JIWJva
 pVtVQpM0DOlC1TzoyU1Q2G/4i88NMzjF1Mo9qxLrIeShl7+GUSHX0JSwj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="1668363"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="1668363"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2023 21:15:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="946164903"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="946164903"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Dec 2023 21:15:32 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 10 Dec 2023 21:15:31 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 10 Dec 2023 21:15:31 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 10 Dec 2023 21:15:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z9IZxcEHz4NzFepA12vYN9JlGkvXklC0UH/rXlxq9x4j9ovinWQqDqaPn2sVoG9URXkpAkw43sELG6iHsFbHW8SLFkDqKvbqOpjktZiD+VXBhSaAWhx/K1+2EOqjg7Hs4Ex1V71kpkT7ESKDRQOdeQsWD3aeGNva4o0hMZHnl+AE6q2dSsP3amzBmEObZLmxEBuUefRINIeEdv6jCO6cra0xWDASNzPQB575kbM8GxH4AUqyfBRhGLV/BX0kC8tavoXbk0M3ksOoIda34wJAbKY5QGq3efBpSs1YODlxzDeI47uu9apwe16cHRydPPL0L2NuzjoBnhUXNmQGUXEigw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WgeHyowLRaE8fa0RnibUwHBX6qQqNj1hnjO1XXk5luc=;
 b=SKPHdMuoyFEahB3z3+zy/m+sEYdU1d8i+V05J4p4bWWACoJSGVGm8JuWuTgwhJmXNpUomOTE7/GrKtTGE5kVE2qSi918E7rt/nr76whCh0+m12ugIGPCuMosN8Uvw5bbbwKAAmYAYJB1KO+Mi7hX9D2Vtkci5I/yantcF3bzG1liPX3N2i6yVwfSAqpVvTYSwIZ/QncUGZfDvzCczXDkil1OSxJR5SOTjIa/a/wzamD2DK2nvWTVV3srtcZ0fvm6YiulC6YZBV9OcWTlG6V59OyDXQm/WcP5i5bonCV6Vg/2xne/HSIfItWRSo8OUp9ymzpgYhDeaX8rkGW37jY1yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ0PR11MB6694.namprd11.prod.outlook.com (2603:10b6:a03:44d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 05:15:25 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c%4]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 05:15:25 +0000
Message-ID: <ab970d5e-3d50-4eb8-837b-d964cd51fe54@intel.com>
Date: Mon, 11 Dec 2023 10:45:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/9] drm/xe/xe2: Handle flat ccs move for igfx.
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231207091922.1224800-1-himal.prasad.ghimiray@intel.com>
 <20231207091922.1224800-8-himal.prasad.ghimiray@intel.com>
 <a7f27eef-fd26-6e19-8930-cdc24619fc51@linux.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <a7f27eef-fd26-6e19-8930-cdc24619fc51@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0166.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::21) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SJ0PR11MB6694:EE_
X-MS-Office365-Filtering-Correlation-Id: 59b65bdf-189b-4233-f0c0-08dbfa082ead
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p3k5AYTyzCKt5PxWjL665VWbTzj/2wB88IV6FXkWOjy+chcVl/0qpQ8u+5uu7CcANCnfsCJS2SaMj2/bg8qsRXp2vZvmWPoWPdWnNnbbD4JokERlT+Isyp+YZdJA5MEA+aL1Mw9crAMDBU+vf+UhvU5KPTmfVEmGkapVvSwKz4ub9WnbZBQsNO8d6HielqILlyJ4/4ANJ5fcSkhvOU8YH+j7mVazONcfm63vuw6qw2XDpplnUGVqDBWHRTMbRBDuYAxx0xDLy9llmrHTul6A9J8vwFt/1KRdGis1O+dZqKtC70dUpCuXPaGr2P7FuP65IO/DxcXbI1YS3+/aTljlQhjDl17QasEfanDLC7H0cQ/z2vDw3oVCC9HEUnDcM7lX15CUDB7Vs/KX/j02h0vE8v1cdrXJRhGQ6he5xyEsNvEzlNlTCkViEbry2YyQy+PBYNV5Lt/wPcM+wCRpr30aVdS3BSuNgt2ZhMLYVGNiXXH+wJz5t9sOA7nXvKeAYvhkrQ2bZAGTDWBnhe4PMIrqHkkJvV5LiIT2AV/KeqmlyS6AKCkQu1f+Bhhv2xDp4ofU1PGJzlKDye+0NUSvxqLDz8aOYaLFrmFFvYZKwfevPE0QojWpJCaA4Pw/YfyHV3U6cQCoXvrDDKEcV47eLi7Qtg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(366004)(39860400002)(346002)(376002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(31686004)(53546011)(6486002)(26005)(2616005)(6666004)(478600001)(6506007)(6512007)(82960400001)(38100700002)(31696002)(86362001)(36756003)(41300700001)(5660300002)(66946007)(66556008)(66476007)(2906002)(66574015)(30864003)(83380400001)(8936002)(8676002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUsrQzh6YkhEZzRtRSt1YllGZWRBaURpNGViU3l5SW9leUZCWVJCQmRvUEpO?=
 =?utf-8?B?MllkU1BDS2kvQ1gyZ2dZK3RmTXZrRjh1NlNKNU9wY1hDNzkyd3E1TENJZ3pL?=
 =?utf-8?B?TnVRMVh6NEpZdFd2NGtuaTUveWJIb0Eya1hWeW5QclcyVU1WWmlnMGVIam9s?=
 =?utf-8?B?dWtxZTZHbU5sNTlSd1liV1RrQUtyQStMMUM5R0tRS1EzMStUVVhxd1N2c05h?=
 =?utf-8?B?TWNjUkZjYnhMZkxPM2luR2ZDcWFtY3k3VWpzUEZ2a1R0QkFNWGFMVm83Q01q?=
 =?utf-8?B?TW1MMzk4aE9mSmRoUWpxUzU0R0grTXFpMTQvcTZEcTNKcVZBTWRSaWVibkp3?=
 =?utf-8?B?UlgrVWh2cWorbG9wOWxGMFNwVldVWWpwWHNtR0RtZHUybGhxOE5sbmJ6YTNI?=
 =?utf-8?B?alBJQmhZZXFFR2xIVFlkV3dzMFdkQnJFeEMxbG9hU1kvR3JkaEJLR2h6SEVz?=
 =?utf-8?B?OHIyVE4zVjRTUm9XZlc0OUlBQjdId2x3ZEc5S25tVThoUjl6T3FISnJCMFpU?=
 =?utf-8?B?VlV1bTBhZHc4eGxRYkxqbTh6dVFXWDZnUnJNTnZ4Y1dMZk9raG5jYjJsaVdD?=
 =?utf-8?B?VFNjUkxXb1JTaUwzLzQwVTAzTEQzQ2VXMnYrR0VEa0ZBMk01d2pqdmxUU2x6?=
 =?utf-8?B?Titob2V1cnFrZU5OY0RsbDBnZzBrR0VRNmpHUFVaZmJrQ3hwRU45NUc4TGJl?=
 =?utf-8?B?Rlo1cVdqM1Zrb3A4QWUzM3pzY1FXcXJONWtLZDFSTmFBNytXYmt3SnRUMEx1?=
 =?utf-8?B?bzd3UjlrQTRIZTlGSUdXYU9nWkhpUTh3ZVZGdnkyQ2VoMG8yd2dWY3QvcUZQ?=
 =?utf-8?B?RXB4Ymlzcmc2dzVQbWtjMUVtVm1SdVBSS0JDOUFEdk1qTVc5ZmZJeU9yOUE4?=
 =?utf-8?B?Skp4OHA1dFI0VVE5QWxOcG8zY3JrMk9tbHRPcHVocUFzcHk2ckpyVnFjbnhC?=
 =?utf-8?B?SUY2OU9YWlBIWEp4ekk5T2FFeFBLdkNyZk9zTnc0VFRJa0cvNVdaajk4Smd6?=
 =?utf-8?B?bHRuUTNHK244ZWxzQ1YvUUtJMXJxODFMdzZrRnVVSUx5aXFzMzRJbHhUY2Qx?=
 =?utf-8?B?TERaTml5WGdjR3p5bk44RGxPTHMxR3cvOWJMQ1Mvelp0K2d5cjQxVGtqNFB5?=
 =?utf-8?B?RWkzcjNpK2dVNXNocU1zYmJzelZqdkpiOWo2b2Zyc0NnMkVBQlNrQldTVjU5?=
 =?utf-8?B?Vm00L1FVWGlGZHZyTHNxK09vWVY4bi85bjZjQ1E4ZUgwdllITllmM3RMRVRp?=
 =?utf-8?B?TzNHQkVLbDRvb002T3A3T2lHeXFHVC9HdDVqVmlFWDBieGVDRXlXZXUxVWk1?=
 =?utf-8?B?UmNvcXV2Ukx3UHNrWVpFbzhaTU1saThSeDVHYld2Wm9IbVNlcW50S1pvQ1Q4?=
 =?utf-8?B?emN1RU5zUVZ4VDd6VTUyVFluY0F1VlBwQVV1UDV1VUtnYzFuMkJ0TkFRV0pz?=
 =?utf-8?B?elhSVCsrM2Z5OEFkWCs3Z0N1S01RNjZjZ0w3ZGFnb3VubzFEL1RDNnJWSTZU?=
 =?utf-8?B?bktKU0o0ZXYzdnNqTXBXWHlzVHU5cGY2cytZdGpLVndSUFRNN3BZM2REKzFV?=
 =?utf-8?B?dndtblhoblNtRHp2QmZLeCtTb2lGeHBoOWgrR2hxNmlZV1A1WlRYZERUY1M5?=
 =?utf-8?B?YlhzL3AwMU54WEVPa3ZiK3pQb3NxZXhod05vQXlzbGYwWTR4YVFGaW53eGsx?=
 =?utf-8?B?UlBqN0RwcmNsS29zRVBWYzFZS1ZhcTBrNk9Fbmp0NXNuaUN5aXVkamtVQ2ZF?=
 =?utf-8?B?SzBGVS8ycDRGRklnNm1rREc0cUJ2THJEdEt0YU9oU3ljc2tEaCtNYTV4R21L?=
 =?utf-8?B?OS8yaDZFNUI3Si9SZlpab3kyaUNiSGgrZDY3RnlYN3AvTzd1T1FlMnhQUHVP?=
 =?utf-8?B?UVZ6YU8yZXJMWTViQVpyMklwMDBoamoyK3QvZHMwUDlkUUptZlhKcUlWVGFk?=
 =?utf-8?B?Z2VBSnNMb05DLytVRTFTNS9kWW01Vit0eFQ3dFJZMk9qNE1aRWlmdjljZlBC?=
 =?utf-8?B?KzRBZzBhR0toTVFRNnlrUWl1Wm5VMktHb1JsUzk5Yzk0UElCaXRLSE1KQjMz?=
 =?utf-8?B?RXl1eFUwS01Hd2NHUzhEbVZGV3FwK2tEdG9YbWJQalcxdjJtams2c1I2cjZm?=
 =?utf-8?B?ZmJkYnFCZTBNVzY4ZFlWNS9uT01pN3I3bGVEOXc3Q0l4VFN3L2hOTWZiQ2Zi?=
 =?utf-8?B?VEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59b65bdf-189b-4233-f0c0-08dbfa082ead
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 05:15:25.6045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: noZM/IwTBW2zKPcApB0A9cUkueWvxOS0m82zolI7TeeqedMmLSMFoV8KgSydtm5vuXn/r+YaDYiOm4ONrwnGxwFHslufn2fWrCkf74bLJpM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6694
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


On 07-12-2023 18:28, Thomas Hellström wrote:
>
> On 12/7/23 10:19, Himal Prasad Ghimiray wrote:
>> - Clear flat ccs during user bo creation.
>> - copy ccs meta data between flat ccs and bo during eviction and
>> restore.
>> - Add a bool field ccs_cleared in bo, true means ccs region of bo is
>> already cleared.
>>
>> v2:
>>   - Rebase.
>>
>> v3:
>>   - Maintain order of xe_bo_move_notify for ttm_bo_type_sg.
>>
>> v4:
>>   - xe_migrate_copy can be used to copy src to dst bo on igfx too.
>> Add a bool which handles only ccs metadata copy.
>>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/tests/xe_migrate.c |  4 +-
>>   drivers/gpu/drm/xe/xe_bo.c            | 33 +++++++++-----
>>   drivers/gpu/drm/xe/xe_bo_types.h      |  4 ++
>>   drivers/gpu/drm/xe/xe_migrate.c       | 64 +++++++++++++++------------
>>   drivers/gpu/drm/xe/xe_migrate.h       |  3 +-
>>   5 files changed, 66 insertions(+), 42 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c 
>> b/drivers/gpu/drm/xe/tests/xe_migrate.c
>> index f77477f7e9fa..6edd6f795f7e 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
>> @@ -152,7 +152,7 @@ static void test_copy(struct xe_migrate *m, 
>> struct xe_bo *bo,
>>         expected = 0xc0c0c0c0c0c0c0c0;
>>       fence = xe_migrate_copy(m, remote, bo, remote->ttm.resource,
>> -                bo->ttm.resource);
>> +                bo->ttm.resource, false);
>>       if (!sanity_fence_failed(xe, fence, big ? "Copying big bo 
>> remote -> vram" :
>>                    "Copying small bo remote -> vram", test)) {
>>           retval = xe_map_rd(xe, &bo->vmap, 0, u64);
>> @@ -169,7 +169,7 @@ static void test_copy(struct xe_migrate *m, 
>> struct xe_bo *bo,
>>       xe_map_memset(xe, &bo->vmap, 0, 0xc0, bo->size);
>>         fence = xe_migrate_copy(m, bo, remote, bo->ttm.resource,
>> -                remote->ttm.resource);
>> +                remote->ttm.resource, false);
>>       if (!sanity_fence_failed(xe, fence, big ? "Copying big bo vram 
>> -> remote" :
>>                    "Copying small bo vram -> remote", test)) {
>>           retval = xe_map_rd(xe, &remote->vmap, 0, u64);
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 81630838d769..5734c23be7d7 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -647,10 +647,11 @@ static int xe_bo_move(struct ttm_buffer_object 
>> *ttm_bo, bool evict,
>>       bool move_lacks_source;
>>       bool tt_has_data;
>>       bool needs_clear;
>> +    bool handle_system_ccs = (!IS_DGFX(xe) && 
>> xe_bo_needs_ccs_pages(bo) &&
>> +                  ttm && ttm_tt_is_populated(ttm)) ? true : false;
>>       int ret = 0;
>> -
>> -    /* Bo creation path, moving to system or TT. No clearing 
>> required. */
>> -    if (!old_mem && ttm) {
>> +    /* Bo creation path, moving to system or TT. */
>> +    if ((!old_mem && ttm) && !handle_system_ccs) {
>>           ttm_bo_move_null(ttm_bo, new_mem);
>>           return 0;
>>       }
>> @@ -665,14 +666,18 @@ static int xe_bo_move(struct ttm_buffer_object 
>> *ttm_bo, bool evict,
>>       tt_has_data = ttm && (ttm_tt_is_populated(ttm) ||
>>                     (ttm->page_flags & TTM_TT_FLAG_SWAPPED));
>>   -    move_lacks_source = !mem_type_is_vram(old_mem_type) && 
>> !tt_has_data;
>> +    move_lacks_source = handle_system_ccs ? (!bo->ccs_cleared)  :
>> +                        (!mem_type_is_vram(old_mem_type) && 
>> !tt_has_data);
>>         needs_clear = (ttm && ttm->page_flags & 
>> TTM_TT_FLAG_ZERO_ALLOC) ||
>>           (!ttm && ttm_bo->type == ttm_bo_type_device);
>>   -    if ((move_lacks_source && !needs_clear) ||
>> -        (old_mem_type == XE_PL_SYSTEM &&
>> -         new_mem->mem_type == XE_PL_TT)) {
>> +    if ((move_lacks_source && !needs_clear)) {
>> +        ttm_bo_move_null(ttm_bo, new_mem);
>> +        goto out;
>> +    }
>> +
>> +    if (old_mem_type == XE_PL_SYSTEM && new_mem->mem_type == 
>> XE_PL_TT && !handle_system_ccs) {
>>           ttm_bo_move_null(ttm_bo, new_mem);
>>           goto out;
>>       }
>> @@ -703,8 +708,11 @@ static int xe_bo_move(struct ttm_buffer_object 
>> *ttm_bo, bool evict,
>>               ret = timeout;
>>               goto out;
>>           }
>> -        ttm_bo_move_null(ttm_bo, new_mem);
>> -        goto out;
>> +
>> +        if (!handle_system_ccs) {
>> +            ttm_bo_move_null(ttm_bo, new_mem);
>> +            goto out;
>> +        }
>>       }
>>         if (!move_lacks_source &&
>> @@ -725,6 +733,8 @@ static int xe_bo_move(struct ttm_buffer_object 
>> *ttm_bo, bool evict,
>>           migrate = mem_type_to_migrate(xe, new_mem->mem_type);
>>       else if (mem_type_is_vram(old_mem_type))
>>           migrate = mem_type_to_migrate(xe, old_mem_type);
>> +    else
>> +        migrate = xe->tiles[0].migrate;
>>         xe_assert(xe, migrate);
>>   @@ -767,8 +777,8 @@ static int xe_bo_move(struct ttm_buffer_object 
>> *ttm_bo, bool evict,
>>           if (move_lacks_source)
>>               fence = xe_migrate_clear(migrate, bo, new_mem);
>>           else
>> -            fence = xe_migrate_copy(migrate,
>> -                        bo, bo, old_mem, new_mem);
>> +            fence = xe_migrate_copy(migrate, bo, bo, old_mem,
>> +                        new_mem, handle_system_ccs);
>>           if (IS_ERR(fence)) {
>>               ret = PTR_ERR(fence);
>>               xe_device_mem_access_put(xe);
>> @@ -1254,6 +1264,7 @@ struct xe_bo *___xe_bo_create_locked(struct 
>> xe_device *xe, struct xe_bo *bo,
>>               return bo;
>>       }
>>   +    bo->ccs_cleared = false;
>>       bo->tile = tile;
>>       bo->size = size;
>>       bo->flags = flags;
>> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h 
>> b/drivers/gpu/drm/xe/xe_bo_types.h
>> index f71dbc518958..64c2249a4e40 100644
>> --- a/drivers/gpu/drm/xe/xe_bo_types.h
>> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
>> @@ -79,6 +79,10 @@ struct xe_bo {
>>       struct llist_node freed;
>>       /** @created: Whether the bo has passed initial creation */
>>       bool created;
>> +
>> +    /** @ccs_cleared */
>> +    bool ccs_cleared;
>> +
>>       /**
>>        * @cpu_caching: CPU caching mode. Currently only used for 
>> userspace
>>        * objects.
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c 
>> b/drivers/gpu/drm/xe/xe_migrate.c
>> index 1bfb249680f4..4c652f3f33b4 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -567,14 +567,14 @@ static u64 xe_migrate_batch_base(struct 
>> xe_migrate *m, bool usm)
>>     static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
>>                      struct xe_bb *bb,
>> -                   u64 src_ofs, bool src_is_vram,
>> -                   u64 dst_ofs, bool dst_is_vram, u32 dst_size,
>> +                   u64 src_ofs, bool src_is_indirect,
>> +                   u64 dst_ofs, bool dst_is_indirect, u32 dst_size,
>>                      u64 ccs_ofs, bool copy_ccs)
>>   {
>>       struct xe_gt *gt = m->tile->primary_gt;
>>       u32 flush_flags = 0;
>>   -    if (xe_device_has_flat_ccs(gt_to_xe(gt)) && !copy_ccs && 
>> dst_is_vram) {
>> +    if (xe_device_has_flat_ccs(gt_to_xe(gt)) && !copy_ccs && 
>> dst_is_indirect) {
>>           /*
>>            * If the src is already in vram, then it should already
>>            * have been cleared by us, or has been populated by the
>> @@ -583,28 +583,24 @@ static u32 xe_migrate_ccs_copy(struct 
>> xe_migrate *m,
>>            * Otherwise if the bo doesn't have any CCS metadata attached,
>>            * we still need to clear it for security reasons.
>>            */
>> -        u64 ccs_src_ofs =  src_is_vram ? src_ofs : m->cleared_mem_ofs;
>> +        u64 ccs_src_ofs =  src_is_indirect ? src_ofs : 
>> m->cleared_mem_ofs;
>>             emit_copy_ccs(gt, bb,
>>                     dst_ofs, true,
>> -                  ccs_src_ofs, src_is_vram, dst_size);
>> +                  ccs_src_ofs, src_is_indirect, dst_size);
>>             flush_flags = MI_FLUSH_DW_CCS;
>>       } else if (copy_ccs) {
>> -        if (!src_is_vram)
>> +        if (!src_is_indirect)
>>               src_ofs = ccs_ofs;
>> -        else if (!dst_is_vram)
>> +        else if (!dst_is_indirect)
>>               dst_ofs = ccs_ofs;
>>   -        /*
>> -         * At the moment, we don't support copying CCS metadata from
>> -         * system to system.
>> -         */
>> -        xe_gt_assert(gt, src_is_vram || dst_is_vram);
>> +        xe_gt_assert(gt, src_is_indirect || dst_is_indirect);
>>   -        emit_copy_ccs(gt, bb, dst_ofs, dst_is_vram, src_ofs,
>> -                  src_is_vram, dst_size);
>> -        if (dst_is_vram)
>> +        emit_copy_ccs(gt, bb, dst_ofs, dst_is_indirect, src_ofs,
>> +                  src_is_indirect, dst_size);
>> +        if (dst_is_indirect)
>>               flush_flags = MI_FLUSH_DW_CCS;
>>       }
>>   @@ -620,6 +616,7 @@ static u32 xe_migrate_ccs_copy(struct 
>> xe_migrate *m,
>>    * the buffer object @dst is currently bound to.
>>    * @src: The source TTM resource.
>>    * @dst: The dst TTM resource.
>> + * @copy_only_ccs: If true copy only CCS metadata
>>    *
>>    * Copies the contents of @src to @dst: On flat CCS devices,
>>    * the CCS metadata is copied as well if needed, or if not present,
>> @@ -633,7 +630,8 @@ struct dma_fence *xe_migrate_copy(struct 
>> xe_migrate *m,
>>                     struct xe_bo *src_bo,
>>                     struct xe_bo *dst_bo,
>>                     struct ttm_resource *src,
>> -                  struct ttm_resource *dst)
>> +                  struct ttm_resource *dst,
>> +                  bool copy_only_ccs)
>>   {
>>       struct xe_gt *gt = m->tile->primary_gt;
>>       struct xe_device *xe = gt_to_xe(gt);
>> @@ -645,6 +643,8 @@ struct dma_fence *xe_migrate_copy(struct 
>> xe_migrate *m,
>>       u64 src_L0, dst_L0;
>>       int pass = 0;
>>       int err;
>> +    bool src_is_pltt = src->mem_type == XE_PL_TT;
>> +    bool dst_is_pltt = dst->mem_type == XE_PL_TT;
>>       bool src_is_vram = mem_type_is_vram(src->mem_type);
>>       bool dst_is_vram = mem_type_is_vram(dst->mem_type);
>>       bool copy_ccs = xe_device_has_flat_ccs(xe) &&
>> @@ -720,8 +720,8 @@ struct dma_fence *xe_migrate_copy(struct 
>> xe_migrate *m,
>>           }
>>             /* Add copy commands size here */
>> -        batch_size += EMIT_COPY_DW +
>> -            (xe_device_has_flat_ccs(xe) ? EMIT_COPY_CCS_DW : 0);
>> +        batch_size += ((copy_only_ccs) ? 0 : EMIT_COPY_DW) +
>> +            ((xe_device_has_flat_ccs(xe) ? EMIT_COPY_CCS_DW : 0));
>>             bb = xe_bb_new(gt, batch_size, usm);
>>           if (IS_ERR(bb)) {
>> @@ -747,10 +747,13 @@ struct dma_fence *xe_migrate_copy(struct 
>> xe_migrate *m,
>>           bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>>           update_idx = bb->len;
>>   -        emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, src_L0,
>> -              XE_PAGE_SIZE);
>> -        flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, 
>> src_is_vram,
>> -                          dst_L0_ofs, dst_is_vram,
>> +        if (!copy_only_ccs)
>> +            emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, src_L0, 
>> XE_PAGE_SIZE);
>> +
>> +        flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs,
>> +                          IS_DGFX(xe) ? src_is_vram : src_is_pltt,
>> +                          dst_L0_ofs,
>> +                          IS_DGFX(xe) ? dst_is_vram : dst_is_pltt,
>>                             src_L0, ccs_ofs, copy_ccs);
>>             mutex_lock(&m->job_mutex);
>> @@ -923,6 +926,7 @@ struct dma_fence *xe_migrate_clear(struct 
>> xe_migrate *m,
>>       bool clear_vram = mem_type_is_vram(dst->mem_type);
>>       struct xe_gt *gt = m->tile->primary_gt;
>>       struct xe_device *xe = gt_to_xe(gt);
>> +    bool clear_system_ccs = (xe_bo_needs_ccs_pages(bo) && 
>> !IS_DGFX(xe)) ? true : false;
>>       struct dma_fence *fence = NULL;
>>       u64 size = bo->size;
>>       struct xe_res_cursor src_it;
>> @@ -963,9 +967,10 @@ struct dma_fence *xe_migrate_clear(struct 
>> xe_migrate *m,
>>           batch_size = 2 +
>>               pte_update_size(m, clear_vram, src, &src_it,
>>                       &clear_L0, &clear_L0_ofs, &clear_L0_pt,
>> -                    emit_clear_cmd_len(gt), 0,
>> +                    clear_system_ccs ? 0 : emit_clear_cmd_len(gt), 0,
>>                       avail_pts);
>> -        if (xe_device_has_flat_ccs(xe) && clear_vram)
>> +
>> +        if (xe_bo_needs_ccs_pages(bo))
>>               batch_size += EMIT_COPY_CCS_DW;
>
> I think this is incorrect. On DGFX, we need to clear CCS for security 
> reasons even if the bo is not compression enabled.

Thanks for pointing this out. I had missed this part for dgfx. Will 
address it in next patch.

>
>>             /* Clear commands */
>> @@ -980,7 +985,6 @@ struct dma_fence *xe_migrate_clear(struct 
>> xe_migrate *m,
>>           }
>>             size -= clear_L0;
>> -
>>           /* Preemption is enabled again by the ring ops. */
>>           if (!clear_vram) {
>>               emit_pte(m, bb, clear_L0_pt, clear_vram, true, &src_it, 
>> clear_L0,
>> @@ -991,9 +995,10 @@ struct dma_fence *xe_migrate_clear(struct 
>> xe_migrate *m,
>>           bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>>           update_idx = bb->len;
>>   -        emit_clear(gt, bb, clear_L0_ofs, clear_L0, XE_PAGE_SIZE,
>> -               clear_vram);
>> -        if (xe_device_has_flat_ccs(xe) && clear_vram) {
>> +        if (!clear_system_ccs)
>> +            emit_clear(gt, bb, clear_L0_ofs, clear_L0, XE_PAGE_SIZE, 
>> clear_vram);
>> +
>> +        if (xe_bo_needs_ccs_pages(bo)) {
>
> Same here.

Will address in next patch.

BR

Himal

>
>>               emit_copy_ccs(gt, bb, clear_L0_ofs, true,
>>                         m->cleared_mem_ofs, false, clear_L0);
>>               flush_flags = MI_FLUSH_DW_CCS;
>> @@ -1050,6 +1055,9 @@ struct dma_fence *xe_migrate_clear(struct 
>> xe_migrate *m,
>>           return ERR_PTR(err);
>>       }
>>   +    if (clear_system_ccs)
>> +        bo->ccs_cleared = true;
>> +
>>       return fence;
>>   }
>>   diff --git a/drivers/gpu/drm/xe/xe_migrate.h 
>> b/drivers/gpu/drm/xe/xe_migrate.h
>> index c729241776ad..951f19318ea4 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.h
>> +++ b/drivers/gpu/drm/xe/xe_migrate.h
>> @@ -85,7 +85,8 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate 
>> *m,
>>                     struct xe_bo *src_bo,
>>                     struct xe_bo *dst_bo,
>>                     struct ttm_resource *src,
>> -                  struct ttm_resource *dst);
>> +                  struct ttm_resource *dst,
>> +                  bool copy_only_ccs);
>>     struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>>                      struct xe_bo *bo,
