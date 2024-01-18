Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0D7C4707B
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jan 2024 14:43:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB94C10E81C;
	Thu, 18 Jan 2024 14:43:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8023310E82C
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jan 2024 14:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705588987; x=1737124987;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+iwQEgvieVLXM9KbDptgspTB3HcmR0OdbheglYEJ4Ww=;
 b=VTEFCxDp6oIR8wtAeFZcSu92wYI6/0gakRZYwxZwAG9YgvL9pciWXw3G
 6jQO0nckQjmPBxd/hymR4VeX+mBXL476KkMaQhbM9m66bKyeC8Je4kDPT
 0rdne/lgVaZ7qAuCKTDXp6+ex63XWSE4a6FiZjM1RKG9Zr7w3K/PEwxAt
 QIhwW11RbP4wZQmc9cSuPtuP0YWEvpbGs117tok0X7vs98nuHMQucMrNr
 POitQGvdO8AZedsImJAUjjdzxNg5R8ct0HhbtqCxv9ukuNf2SOwFfknLJ
 bdij1e0ruAOvNsYFdGA7Ph9rVdBARjgtVHUoCX3TzmGWx3NXswwYD8v8X Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7559131"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="7559131"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 06:43:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="374344"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jan 2024 06:43:07 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 06:43:06 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 06:43:06 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Jan 2024 06:43:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VkF/3/yLGbmL9zY1kja1/ZPrtk9g9EAlfujBTxEUaIhGpL1+NkKB0bYwHCBzqvmaItRYsde0LuyLl+Dh2V/r40ePXu/eaiLnf/JPHbVjWHjpXA5oGZ4ARRPGgACe1fryTmaKVHUzPzFMghbVvRdtzLyuq8788/Madv5xNkU3vtCdYO7l7xyuDCzWFvfNSOlst6yn2VQBiYxJBD4/9BoaUmfZHuaN6tFC/YFL0RF5b6PlzPw3PNCHUhEEiNRAAdPcB5hF27rx+pxEBZMg14qW9P6fGsQi/fZlIfEUVILamyiJ+hdQWFdTaoZtaeJGxANHEc92rfq/aERwiKEi3gbkcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45V9c3J6wkGHjmErGiuC3bw1TuD+2uDEy1MqHudVbHk=;
 b=JMWPwFWwNT2nROUsxIsjY6rDFZmLJLXKtnmshBLkomE9FL1YBc0UaKDWGyUDgc0R7VfctIg5qpmzkFTRyBmMKuP8TnS26UmFPtsb55nJjH58ILseZSVDgGGZF5jKEFAkj7wBqjpGlisYB71t499DuXlyys97idVW9Up8igmrPE+FAHuaSv6gh+vWJ0zqY4CHoGj+zOf0YrUhtPcq2N+1/Om2JBtkEzrmKvLvfWdF1V627G6QE+o3ymMC6AJO/2KCdRHn56oGwjBwxkvHI7Ptr/MJ4gFLPa4i/Uhm+ff7Cm4JxsQwmGjA9YJ9u+W8YqaC3hCmtjptX48iw72suUYHRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 PH7PR11MB7718.namprd11.prod.outlook.com (2603:10b6:510:2b6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Thu, 18 Jan
 2024 14:43:00 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::b651:485:1973:7554]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::b651:485:1973:7554%3]) with mapi id 15.20.7202.024; Thu, 18 Jan 2024
 14:43:00 +0000
Message-ID: <7cad1473-e49d-44a0-a5e6-bb5b06f6d293@intel.com>
Date: Thu, 18 Jan 2024 15:42:56 +0100
User-Agent: Mozilla Thunderbird
From: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH] drm/xe: Set PTE_AE for xe2 dgfx platforms
To: Matt Roper <matthew.d.roper@intel.com>
References: <20240117144851.22952-1-nirmoy.das@intel.com>
 <20240118004924.GD5549@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
In-Reply-To: <20240118004924.GD5549@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0090.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::8) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|PH7PR11MB7718:EE_
X-MS-Office365-Filtering-Correlation-Id: 44bb51c0-56ef-4efc-4c56-08dc1833c4b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MzHk1/sZAPbyUAbfuNYiQbet9b5gRnNrUj3S/P2gt/gedgTHII9WYSCmCblLBe/AjdamPcGgTcOwNcXCSWY1N/P2+n2bm4y2/RsHyg0htdTPx3PhpmuxJTyY0SX+y7SaIvTHnTuSZRJwDW8X+U52pg3ogFVjsdf5LpTu9jAE4um4Tji3B67ikP7gJLton5H1X8Lwf3j9lnhe8Y5wMMm9RRXVSGjJShrCnFbohsYpA+XzIcjv5s7MQToYs4JywseN3L/qa44UjzG7qnknY9y6vy9J3DdAkw8kWogEgA3rlYsbPEFdkVWXIxYL6qavH5oduktyjrq/nebKnZb5eEr5mZ95ULPgK0Iqlmekb+8XMwNvemg8A3UjG8SWNKt9vxVAn7G9Z7XnfArtul6geetKrH91DrAiJNKzzpF/6LxKE/IXEBCAXqMw6qaeeJKsbJKGYNLgjSkv4Phh3UxGlTGDoG9+KN/gozynwwYqikuYO8RYnQ72Rwtxjpo1KrLVvZp0Ik20CEMyqex7Cq9aEss1Y5vCyM7d4IPFfKVLYNWKQjss6txPoLRRXSAtvABNj3WD9US0ZPd+G4umzmdskLDmJnkVHSeg41pUCWxCSZ5aJRcadMqiBUO+an59qN3+YdiM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(396003)(366004)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(66556008)(966005)(6486002)(66946007)(478600001)(6512007)(44832011)(66476007)(37006003)(6636002)(54906003)(316002)(31686004)(8936002)(53546011)(6506007)(8676002)(6666004)(31696002)(2906002)(83380400001)(38100700002)(86362001)(82960400001)(41300700001)(26005)(6862004)(4326008)(2616005)(36756003)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVRKQktjbUg3WWZRWXFOTURNUE0wT0tZRW9yT2s4eTlMMDl1Z3R6Y0VLbnlZ?=
 =?utf-8?B?ZUJESTIzdkdDbk0xZnN6TWJ5WGhwNDFnbk52WVRQQW0rc2NkV0FxTUlDUEtY?=
 =?utf-8?B?SWR4MmF6MGEvTVY0dEhMSm95a2hESlRvQktkYXpOZ0t1Q3FFUTVrL2l3UmNY?=
 =?utf-8?B?RUFVR01QYkVGTFZuNitBdmRQOE1zcmZPZXRWY2tsL2pnQVJPNUE1S0tuTFlU?=
 =?utf-8?B?N3lVM1pucjlWVW9OWDl2MUlmL2hqYTAwTFYrcU1QbVA4bGRkc0Qwc3VGcDdL?=
 =?utf-8?B?bUpPZmxIUDBhSWIvVjdvVFZlUXE1RzlIVUt4MVR1Zm1oTU8wUGdiazI3dGpK?=
 =?utf-8?B?UE5KNTdZSEpZZE83WEVyL2hoSzFPTERmcFZtb3B1QVUxcFZkS21XcGp5U25X?=
 =?utf-8?B?aTRRaDNFOSs5eGRJSm9MMUFzbEhTekhiN0xYeHlETzJ1UGMvbGFiVUVTaDZn?=
 =?utf-8?B?SVZkWUtUaDZBUzdPRFlTRUZHdkc4Q1I0bW9HVjlPQ0tUdjZ0dEYyVjMzMWFU?=
 =?utf-8?B?aWc2c284NjA5bVlFemw2MXNnR2c0QUoyMENjS2I4WEN2eTN2bTM1bUkrUFdL?=
 =?utf-8?B?U2oyUzRBcjI4VkdJeHpDMUdqdDE2Y0luWG5Oc29zQTEyZlpNLzFnNTQyWXB1?=
 =?utf-8?B?YjhDcFdSY2VPRzh0cXhaUHUxT3RMS2dCa0lwQ0VDNXBGaVpLT0E0RDhGWHB1?=
 =?utf-8?B?WlhGWGROM1JicFp6dmZTS2luK1ZNbW8vbHNFN1dTakRMdWdIeVBXZDJ2amJx?=
 =?utf-8?B?dzBKckJna0k3MVk3WFFXdUx0Q1AxMlR3RFk1NjYwTVFyNEoxemRBWUFoMDZ3?=
 =?utf-8?B?a1gzNTdrcW9GOWdRNWF1Q2o2UStHZ1pxbGs5YzJUS0hUQjRqQUNMdlZ1YVR3?=
 =?utf-8?B?UjFNdWFKTk1iYnFDWmVtaEpGcDAwZ0tyaFBPWkM5Q01IUStoT3podnJJM05q?=
 =?utf-8?B?TU1DSWxUS3k5cmN1UTlrTjVBVndjNW00TWlvZ2xkVmNYV0RZNjNqbCtTa0tv?=
 =?utf-8?B?WmJISmpJTmpzaHdXbnZ5QWVEZ1RXZVppTktBTjN6Q29HOWhNRWFMYTczSHhB?=
 =?utf-8?B?UmdoWXdjT1lZVlNFUXp6R0wrcEQ5Q254MTZodkUxdFJSZmIrSlFCWmE4UEp0?=
 =?utf-8?B?enRhSXpZcUxWWFFGMHBjWDhYV2lNbWR2dHhKeURXYlVIb0Njd2ZLaTVoU2ZH?=
 =?utf-8?B?dkN0dVdpbXRadzZTZ0VaZ0drREdCNFJQM0hzdWNQNG9BcERzZUl3amEybUpw?=
 =?utf-8?B?ME0wUXE1SFh3S3A2eW5vWjZGelBkbmtzaVhMSFJZYkdQMDFFQmRwN3ZUN0lI?=
 =?utf-8?B?b29JQnppdlZtMnhsV0llWVIrWDhpSGtzSkdXRkUzckNTdUZyMHltTnNGYTN0?=
 =?utf-8?B?R3VsUVVvRnRSUGxVYkRaNGUvcjJhTjNLeDBwOHAyc3N1OWVNeFhSMWdRWnZl?=
 =?utf-8?B?NCtwZ1dSK3ZxVkVQRlZ1T1VCNVRwTmZ2eHBENjMzVFlYSFl1ODVhaU9IZG15?=
 =?utf-8?B?QUphUnE0RWg5SDhHNjdoNHdSejRCRnhwTjc0WUxpRUUzNkJVR3FlZXF6bFgz?=
 =?utf-8?B?dzI1ZUltWHU3N0FrcmxDekpkZk5mSFpDalJEZWRaMWEwcEhZdlU0TU9uWEVB?=
 =?utf-8?B?SWFOMXVEVmZERzNNV0liZ2NuLzl6eW1qZ1NJNHRnSEJ5T2U0Mk1meTMyWWFw?=
 =?utf-8?B?Q2dGVlQzbUlLTTVtT2lpTjE4RlArdHpxM2pZb21SaHhTZWF5a3V1bXB0eEtW?=
 =?utf-8?B?dUdTRkRMMVEwZ3NBVnY2WTZrRytnY3NaK20xVFJVYnVkM1FHcmY3NU9SaWFL?=
 =?utf-8?B?c3RNbE1lY0pPZnZRdStuT0NvWWNtTzY5SXJ5TC8zZ2laZEFsYldBQmNFUVJt?=
 =?utf-8?B?bXo0aDRHUyt3bFlWY3lNQ2NHQzhhY0JyM280TjNKb2pBcWtEVmtxbzRUSGJF?=
 =?utf-8?B?aWU0SFpiL3VoWGJnUFRUZDlDVms3Rmp5MVlCRU9KUzVOMlZXNlhjM3c1U2ts?=
 =?utf-8?B?Q21WTHFIamkxaVlkTGFhaTFhK1kxZmliZVdHZStxditmUTdudi83Vy9wV3lE?=
 =?utf-8?B?ek5xakRMVTU4Tk91cEFtTWZuMUpCL2NCOXpXZUYzRElLV2RyZGtITWJzSS8x?=
 =?utf-8?Q?cMn48vSCA9Lr2uFrdWIQC7EhG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44bb51c0-56ef-4efc-4c56-08dc1833c4b5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 14:43:00.5393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kk/mA0XpAJ2R/299aMFwVlt1arwNWd8j+P6fgc/LDXUPsr0reZrEZc8/Ehf3aY0JLQeoWLU37j3GS3sc6YoXfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7718
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


Hi Matt,

On 1/18/2024 1:49 AM, Matt Roper wrote:
> On Wed, Jan 17, 2024 at 03:48:51PM +0100, Nirmoy Das wrote:
>> Atomics on XE2 works for both type of memory so
>> extend setting PTE_AE for dgfx platforms as well.
> There are no Xe2 dgfx platforms yet, so it's kind of hard to review this
> fully,
I should've have sent it internally.
>   but my understanding from bspec 71539 is that in theory a dGPU
> atomic operation against system memory would probably only be atomic in
> device scope, not global scope.  I.e., it's atomic with other GPU
> operations,
This is my understand as well.
>   assuming the CPU isn't also accessing the buffer.  But if
> the buffer is shared between the CPU and GPU, then you'd want to set
> AE=0 to ensure that we get a page fault and can migrate the object into
> lmem first.

I think on system memory, AE=1 should be the default and opt-out by UMD 
with a uAPI. Basic operations like

MI_ATOMIC will fail otherwise which if understand correctly MI_ATOMIC 
should work on system memory except

on PVC because of a know bug. I added a small test to check MI_ATOMIC 
which works on dg2 system memory

https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10547/bat-dg2-oem2/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-system-memory.html

and also on discrete xe2 but requires this patch.



Regards,

Nirmoy

> Matt
>
>> Cc: Fei Yang<fei.yang@intel.com>
>> Cc: Jose Souza<jose.souza@intel.com>
>> Cc: Matt Roper<matthew.d.roper@intel.com>
>> Cc: Brian Welty<brian.welty@intel.com>
>> Signed-off-by: Nirmoy Das<nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pt.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index de1030a47588..3ace4b401369 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -602,8 +602,12 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>>   	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
>>   	int ret;
>>   
>> +	/**
>> +	 * XE_USM_PPGTT_PTE_AE is available for igfx and dgfx from xe2 onwards
>> +	 * and also for PVC but atomics only works for PVC on device memory.
>> +	 */
>>   	if (vma && (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) &&
>> -	    (is_devmem || !IS_DGFX(xe)))
>> +	    (is_devmem || GRAPHICS_VER(xe) >= 20))
>>   		xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
>>   
>>   	if (is_devmem) {
>> -- 
>> 2.42.0
>>
