Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8FBC001B0
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 19:15:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B01F10E775;
	Thu, 13 Jul 2023 19:15:40 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 432F310E775
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 19:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689275739; x=1720811739;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hy9BavQxW6GkivGODvYc+AucLVXvRZVj+7Ia5/Ksnic=;
 b=NgCluhZneXDzHu0aOL3wAz9Janyy/U9XeAzSzpT73W96QGQYmnpsEiGI
 e9BVZ0qQhn6lyIQVppmIHpEh56+Ruoj5d8UKMKSqRLHdd3Rw20+Axe2Oz
 Eu7O+bskrXSVDRasKYxu/jsbJHjO5ocVrgIsmjSRYjHyThMmeposDzX+F
 EARGXtiONF8wxXoEdJBpzh7wq5hMWTguaNNNcqeJzfgH7ALPPiMpzyeik
 izEldrBxoNOAviiCSuilGpxOMJVDA26E4G2KnghP465KxPJVALsi49Lah
 mQ96V04ErZ/VUSbLiD1pRiUiJl555mAL3feQF/me6YpDv481C82ePG9tl g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="431461779"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="431461779"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 12:15:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="725415035"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="725415035"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 13 Jul 2023 12:15:38 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 12:15:37 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 12:15:36 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 13 Jul 2023 12:15:36 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 13 Jul 2023 12:15:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kmz3L9n+K3VHMdeL91umX+/GKTIauWimrP44+IUm5qpRt5vdTL5lWo2UB1W8njtg6gximdhQN5iwqV1XCDWiAaTNuaukfGiGikqKCUNRj3DquxpDDGQ1cIyUmgsGvkxDAex98OZKV6zZgr7myKWOJ/2OhHG0lZ1+hNHHVEwBILv89v7WL9kYB/pOetI6OC6AaNEdjlqTf4tHTJrJJJmIFuJQiGRQ+2a3w1mskcH7EKFCKi2WuRaSieK8FKqi9gqRxdVZWApYQ4BiMLXuGGaMtYrbzO8NWP1LVR1T1UPXdoDkFZMnxS3yej+tSC2d5P+77bTrarjhE/5rM1y/ckJCcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HW1BbS/pZRIBo5PBiyJjQp3W+CMJtL8pkdP1qfp3VJQ=;
 b=A2yh8wWUEkgTvuIfpDROx645pdODKmrD9c9G1+N7MBuQJVkYfOY1TqJHeySwCpM2k9nDBCDJBntRi4O+lk0b5gCb5bEojOwZ4xHDvu7IGxeLeLtB1TQ5LTEHPT+N3skbfAhv/lX1KlefGXL7DylmIvL04AbZLz3HnMye+lMMHxm4QPPjZuVVk55sdutSps7X6Y4WSfuBSYiV5Etw1bTMo0VK49pGmBtywQ4cqzvzU8+F+vdA6dA12BK8eMpe4nnOyo59XPWCn34RoUrLt+UUrw4Z23zrmna4dMG63mNDONxecnWLcRr+e9Keo7WRv3XgfZ+cTea66ljdlN24qzMC+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.22; Thu, 13 Jul
 2023 19:15:34 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::5169:f988:afaa:39e5]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::5169:f988:afaa:39e5%5]) with mapi id 15.20.6565.028; Thu, 13 Jul 2023
 19:15:34 +0000
Message-ID: <4622a662-cc99-8949-ad6d-2bee1b847138@intel.com>
Date: Thu, 13 Jul 2023 12:15:32 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Matthew Brost <matthew.brost@intel.com>
References: <20230713020144.21594-1-brian.welty@intel.com>
 <ZK+GxkrPbKgOGTnp@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <ZK+GxkrPbKgOGTnp@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0023.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::36) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|CH3PR11MB7180:EE_
X-MS-Office365-Filtering-Correlation-Id: e1f9c477-668f-4d9a-c870-08db83d5888d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5eppdagA8X9YlckFwJCeFPp6gzUHnNcRKEAAXYwLFHGhFyux2Um28PTcsBS5g4nKyUrvAlFETc3frlxbQmWkWec7t/Tk0v3IFtuCGi5ChyjUi7J411EMvdiN6iu0qVYEVax0LK/P4IbNaHUz+Dc5TC197fglIJWQ22zud1S5hMkmist3TaubJNqIQ6ZP+R3WhlGatSDA7iUuSzk0KRv9IW25//LaKs1lA/OLXhR+KLUmeGB1VT3fsWcRAL0+XsqRjJ+Nk6D9YgXD4UxX9zj2cYAfg0U0XDQQGEw0+bfFAP4O5MJTsrS+Wybv0bEtrKL2hxOeW3P9HPmRZdXP5+11y5J1xbBA/fKeYWSp/Nq8wPLXxu2dQ/flkPTs+Z0+T2qkrTQamLTcLdmMexVRJScMoYrGy+CzaFjRgqDzG3rIZBAPdBm2vNS5kHF9X4e7DU53267YNKdCIP/2MU6Th5GNyjLCmrR26M1rs7UxqW85jBlvv6s6OON99o2dYj1lJ/VpVMgYCJYlasf02q9C152rk/blN2ynjXrZhYygzqqTJTTD5rW+AguXNL7n3yVLQfDcSOI/tN1iuK2e7PvJ3Og2tWL/b3DxgAukxxyUUknRkARQXcqiDjyxleR/rFLMCb4q6QbppM/AsT8PXAPAJjiHlQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(396003)(366004)(39860400002)(136003)(451199021)(66556008)(66476007)(66946007)(37006003)(478600001)(82960400001)(8676002)(8936002)(6862004)(2906002)(36756003)(38100700002)(86362001)(31696002)(316002)(4326008)(41300700001)(6636002)(5660300002)(2616005)(31686004)(53546011)(6506007)(26005)(186003)(6512007)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlZkVnZSMXhYTjRjRUpmYWJEYnE2bWxoTllwaElDZHluOGxCL2RjcHBGSy9t?=
 =?utf-8?B?bExIU2c3dGRuTnV0TlFzOVNyNWF3aENUQTlvanJSbmZ3aHNxSnlLR2kvN0x6?=
 =?utf-8?B?c3RIMkdWN2dsSE4wb2dxVUd6QVoxRExXUnJEV1dnTndSRmxXbnAycXFuYVMy?=
 =?utf-8?B?QW1EeUgvRUpBSDJOUzl0ZjRNVGV3RCtyQmRJdzNpSFQ5bUt2dE41SjFXV2lL?=
 =?utf-8?B?YzFCVy82ZDdka1FXZSs0SFQ4cGRTaXFWOEpIQ0Y2Q2lOSzB3TnlIZXJKTWZE?=
 =?utf-8?B?Nmp6N0M3K2tPK3QrUWF3d011eVJ3aWgwNm5rUDV1UExZbmNnNmd2SW1ZVXFz?=
 =?utf-8?B?OU80Tjc5R0NLd0ZYQWlZQmxOcm1QSHBCb0FaTGtsWjNKbk1mSXZ1NmpQOE1w?=
 =?utf-8?B?NXYzbHhscGJOS2pTZTBwR1krMnZmdXJNUzMybGNiamJyTjdFUlArdFYvMzR4?=
 =?utf-8?B?MWlhQWpJYnBoUnRuQ1BoRHo3cnlVZkgvRjdVRElrRW5sblZiRkpWRUpDYWc3?=
 =?utf-8?B?Z0xKWFZVVmFHYnZ5UnhtYjVURk5tOGZWRmNjRXJVVEtWQW1UUmZESkY5WGxL?=
 =?utf-8?B?Q1ZqUEZGbUppN09JK0JzS1lYVGxmWHRseGlLeEpnU1VrVkEySjE2U0hnbDEx?=
 =?utf-8?B?RU9ETFlTd0FNQTM3c1FyR0plSkdHdGhZdHN0Q1gvWFVCd1ZkWFg5WTkwTll4?=
 =?utf-8?B?ZDd6M0l3RTBsbHd3ci9HNFJqM1VycElJbEx5WGlCc0xCb0FPQVVTd3JTS3Qv?=
 =?utf-8?B?bVBXUFNyMmp0ZVJzM2hGcUVrVWpGeGZRakZMZ0RYd1JrbnVSYmFBa0owOFJx?=
 =?utf-8?B?RWhDU3Q0U0FqQjQxaWllMFdvSmVxVm9zQXQ5TkpTMDFoS2NXRUEzNFhCQnZR?=
 =?utf-8?B?QVp2LzdNS0Y1UUQrNndNSHI3NlcxQ0R0a01ucis4OHcrbzRlU2YxUFhucStv?=
 =?utf-8?B?eG9Xb1JhYWJQMWN3V0tWQ3NkQWgrak9zRVRyZGVMRmw0VWlYcFE0V1dadGRl?=
 =?utf-8?B?bkRRYmRHZGxVTWFWT3FTR0phT2poMGxXbyt6VUN2cVJlbkwrTlR0QTVVU1JH?=
 =?utf-8?B?ay9IeU9JdnFyYmVZMGxkakVZdGVUQWg3c2g4TWNybExwd3Z6b2dEbXJKV1ZD?=
 =?utf-8?B?VzZMS1h4ZEpRd0pQeWlaVkNBSHF3THh3aUVBL2ZPekZUTUsvT1ova0hEVHNF?=
 =?utf-8?B?Zm5iS0hJZzR1L0pUM0NsUGs2ZGx1amhWMWR2Y1o4SlBvZEZlOGJHVzhwZDN3?=
 =?utf-8?B?YmhKOWw0KzJob3BCcDVVMUlvWTVkMFBKcldESVZiTVYvTVpyTUdWTm1nTUhW?=
 =?utf-8?B?L2tGajd3S21rK283N0FNcjlCVllhNDFrSktvNnE5NGI1MWErbWRwN3ZpT21V?=
 =?utf-8?B?Z01RSGY5NjFaQUNGb3hndjVuZFNsWitaMnNhYmFSTFU5YXo0SThJRG5qTktx?=
 =?utf-8?B?bTcreFNINFNQT1ZoZmZZUGdpM0p0UUhkQUdESnJ1Q3ptdDM0NnZEb2M5ajFP?=
 =?utf-8?B?NmdraFVvL2lLTEFxQ2pJR2JOODNiS09aQUxTaFI3SzdtWExoM3ZrTmxybkJo?=
 =?utf-8?B?Uk8rMENsT2JDNE5qd0J5OU9QdGhVNW1HUExMeWpvbXhwN1BRSllNMkVTSlY0?=
 =?utf-8?B?YktYdGYzK2pycXE2dlhZU1VmQ3hHZ3U2dDhOMU44VkZ4emxRdlVWZDJlbFox?=
 =?utf-8?B?N0tySTNhMkwxbnNwU2QyL05vVmk1SjQ0ZjROdjlUc1o5d2Y1WjJwTGt4bjhQ?=
 =?utf-8?B?MHQvK253SGNFMmM1aFdvT2wvaHhlb2xObGF5MzQ5aUlZTkc1ZXZQdUdWMUU2?=
 =?utf-8?B?NWl4blR4Q29LTThyTVRUNDgrUHlEbXRvL0I4bjFtY0ZrZ1h5T00vZ3E2Yk1h?=
 =?utf-8?B?Zm9uTHY1eUxSSXdnMXlOL0JmQk15WVZrMUNTMFZ0dHJJL0lXeXVHbDhLVi9N?=
 =?utf-8?B?ZFN5K0VXNHUrYnYrbFphOUFRcUQyVkplTER0RTV6RkpBNU1FY1luMHlFY2w4?=
 =?utf-8?B?TDFodmJWQkVPaFdZR0F2eEtXdTdSOGFQUVF2UWlpYlBDa3R1UGtDNzc3VXFs?=
 =?utf-8?B?L1lVa3ZtOTNVZnpjL25wUElPbHREcTdjd3NpNXNoTUg3UEdNVHl6YkZjSTk3?=
 =?utf-8?Q?CbUUFCAMkTfYIP0AMCJQMJOIm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1f9c477-668f-4d9a-c870-08db83d5888d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 19:15:34.7793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ed3cMhdzh+K4zfMF7+SHMInla//Jh0/AiMddCiMtwmnGkbdXjvgK1LFNwDVcFyWjHRZRGVpjCYixSFVNAESs+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7180
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix BUG_ON during bind with prefetch
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



On 7/12/2023 10:08 PM, Matthew Brost wrote:
> On Wed, Jul 12, 2023 at 07:01:44PM -0700, Brian Welty wrote:
>> It was missed that print_ops needs to include DRM_GPUVA_OP_PREFETCH.
>>
>> Else we hit the impossible BUG_ON:
>> [  886.371040] ------------[ cut here ]------------
>> [  886.371047] kernel BUG at drivers/gpu/drm/xe/xe_vm.c:2234!
>> [  886.371216] invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
>> [  886.371229] CPU: 1 PID: 3132 Comm: xe_exec_fault_m Tainted: G        W          6.4.0-xe+ #16
>> [  886.371257] RIP: 0010:vm_bind_ioctl_ops_create+0x45f/0x470 [xe]
>> ...
>> [  886.371517] Call Trace:
>> [  886.371525]  <TASK>
>> [  886.371531]  ? __die_body+0x1a/0x60
>> [  886.371546]  ? die+0x38/0x60
>> [  886.371557]  ? do_trap+0x10a/0x120
>> [  886.371568]  ? vm_bind_ioctl_ops_create+0x45f/0x470 [xe]
>>
>> Fixes: d39e49e2ad38 ("drm/xe: Port Xe to GPUVA")
>> Signed-off-by: Brian Welty <brian.welty@intel.com>
> 
> Thanks for the fix, clearly an error but way not print the op?

Yes, just I don't know the bind logic well enough to code it.....
Thanks for providing below!...  I will test that out and respin.

> 
>> ---
>>   drivers/gpu/drm/xe/xe_vm.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 6c216350084b..f96690e868aa 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -2230,6 +2230,8 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
>>   		       (ULL)xe_vma_start(vma), (ULL)xe_vma_size(vma),
>>   		       op->unmap.keep ? 1 : 0);
>>   		break;
>> +	case DRM_GPUVA_OP_PREFETCH:
> 
> e.g.
>                  vma = gpuva_to_vma(op->prefetch.va);
>                  vm_dbg(&xe->drm, "PREFETCH: addr=0x%016llx, range=0x%016llx",
>                         xe_vma_start(vma), xe_vma_size(vma));
> 
> Matt
> 
>> +		break;
>>   	default:
>>   		XE_BUG_ON("NOT POSSIBLE");
>>   	}
>> -- 
>> 2.38.0
>>
