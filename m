Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA39C76195
	for <intel-xe@archiver.kernel.org>; Mon, 27 Mar 2023 04:40:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1638F10E02A;
	Mon, 27 Mar 2023 04:40:12 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1096E10E02A
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Mar 2023 04:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679892010; x=1711428010;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JFlu+8R5i5k61hebIL59XPClSIJr4zpbhlSZSXujGiA=;
 b=XvVEU07gJqKNyarSphsbQAxITPCsC/0q1tu00dSo8FgceNtIdYrw5lo6
 IkH0UotiMJF9m1w6hiK6LzZ2uIPNNwwxqOl4ozLjUkH992zKYmud5XvfU
 IE8VaHY/yEIcgkGzKQ9PomQOWISwjQOyM/7QLkVf7e33FjS6dSmeoHdeH
 p9B4CwLhocXuGdW9BFjMojrAx8MGuNprpIS4vM8a00c2D9WW/R0Dg00Xi
 qsXr1N5lh/FzlkxzoYFP0MoI4omJJLZrHilAwfp33yvyenMXqTe9Z4nSJ
 hSCp7hYYBvYVHB7ZG+DIONk0+1BahwFhxzJiDJhBr0nZfEpCNA3EPchAS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="328615724"
X-IronPort-AV: E=Sophos;i="5.98,293,1673942400"; d="scan'208";a="328615724"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2023 21:40:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="685844052"
X-IronPort-AV: E=Sophos;i="5.98,293,1673942400"; d="scan'208";a="685844052"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP; 26 Mar 2023 21:40:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sun, 26 Mar 2023 21:40:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sun, 26 Mar 2023 21:40:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Sun, 26 Mar 2023 21:40:07 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Sun, 26 Mar 2023 21:40:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HgMbrDqgwOXq98ppVKi+6I5yWUFBpcmgTfKUkP/hiHbF/vAlzSr9rPjFYPlT0dz000DeS7toora+IStFJBeoD2upzjkQQojp2f/QpkJkZSMYrTfURilXVCGIa6i3iyvx3g3JrYhr4xq4U8V5P14useySq7u47F9JZAixyMmKW7SSDvh8JczhbuJRRHVRhrwuop5r2z8UKlDJVCrOsGmabhXpZ1NgfJLiB4jKuG3CVUx/Ir8PKLPRWN5HAvuVTjJXJZ8m+8fsseuj8oHQcRns1+YqIaKxGo0+zIyPM9UtcbbtcRw5lC/f+k3kKCDbIswKMObjGWMIiYB7OhdVSsgSNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q0nufC681P1HMDv2lbjetBSimd+tZr5n+E8k0Hs3X10=;
 b=CMTSEoKD/A4ZQp5jHZWs5eadmfDwQkna77KLzs/JftyL9O/gsuIY5g8j6GtLy2aREWBs7U++yQgOwvycX8VoAXtMmWfDkEmQk6Lt2Urpc3A8m5J9vBN3VfqA2tgZbEu1Gr6GjGkzVdrfPaxVGhqpnYkeOT8gmh1mJ4jrRi8Vhj1sM2PeWhcaBsSmGPgfVmyowd1YGi0NJrYBfG0xa/NrCVmn3620b9FP8194Q6VwWuAmwovWWWgrfGZMenyYE2e3zQGbNUJeDEh4fFlxD4cey24Z+hjrug7agMy449x5lY/y7+6cXN5z/G3MPF+bSUqIfhg3TZYNXr8AuyBVH2b7rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7539.namprd11.prod.outlook.com (2603:10b6:806:343::6)
 by MN6PR11MB8104.namprd11.prod.outlook.com (2603:10b6:208:46c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 27 Mar
 2023 04:40:05 +0000
Received: from SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::d94d:4bb6:a568:a2bc]) by SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::d94d:4bb6:a568:a2bc%3]) with mapi id 15.20.6178.041; Mon, 27 Mar 2023
 04:40:04 +0000
Message-ID: <e3055d28-6330-9dec-3a78-474c41c16705@intel.com>
Date: Mon, 27 Mar 2023 07:37:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230323115926.391900-1-matthew.auld@intel.com>
 <20230323115926.391900-6-matthew.auld@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20230323115926.391900-6-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0413.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::17) To SN7PR11MB7539.namprd11.prod.outlook.com
 (2603:10b6:806:343::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7539:EE_|MN6PR11MB8104:EE_
X-MS-Office365-Filtering-Correlation-Id: bdf7df70-5bd6-4f19-dd07-08db2e7d5568
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pp6ZfU6Y6gvbrLZy9Da7ADAhanwfWzCJTfTV7kTl5dSayFdUpcvjhTM5MNMBJfmwLTcIg3/ddh7EfOmLa8c5nG9UdSIm03S/YWNPJr2Qol6AeQGvIcp8wnhlWW035c1seahw1aIUaoQQokOwai9uoRfltiQmo8SlFfWKH9iXCWADUnIhDdx+ro5j6lETZdT/CYBgsGWcyqVo3lp+WlwfbWzpwoY5B7DtbkSb/XwwBhQNao9mCIfb4qkwveH0FPLpf3wD08Vz2LRG/2IcpstI60aCIKwlpcDhX0o87Ni41QlvOur5Gi+ReVgpZ2dZOTmPIypeRl4Bf5/TAFt+4CI0b0DlvgiaIW7Ni55tfsdUIG1zwtAp+cUumNHUyru44b1e+ljSS3ljQbm8iwzxRI28q9By/uBmvVeDA6ijP+c4qNaHnmJlfoRFi5rEbQwiHaTTqPJd88QdqC9MT9V2ZbHrp2AskPeWF55IMlO2WUcRHHFzozjEvhTCeRlvSdkvv8XyvY0vPEs7aAf/C0sSZ7Kz3fGMFfBcB6R7EFWypRP2ZYPDXCtQbWfGGhvM3wSqLghAh0jUKY2oecYyaCQ8hwun87vqWRCUGRevb5RYu3ODDscMv3WYLHB2W+qlEUW23+GhhniP1oghccPNQLMo2jKZsQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7539.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(346002)(136003)(39860400002)(366004)(451199021)(8936002)(2616005)(31686004)(38100700002)(82960400001)(36756003)(6486002)(31696002)(86362001)(66476007)(66556008)(8676002)(41300700001)(83380400001)(2906002)(66946007)(26005)(4326008)(66574015)(6506007)(53546011)(316002)(5660300002)(186003)(6512007)(6666004)(478600001)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0dTR2JkZ2xnM3Zka3hoUDE4VGpHMUVNVXJKRUdVZGVkYTViL3llMXB3cmRW?=
 =?utf-8?B?OEZvclYvMk9ubHZFb1JBOE5kc1ZGRGJjblJsMWlITVo4Mko1emVlQjRnUUps?=
 =?utf-8?B?NlRqcDY2MXdxdWtIdWlpRFh3cTdpL3RjbXBYNXB2U0dqSFF3eEZJTVQ4bjlV?=
 =?utf-8?B?MzEvdXZUQmt1NGhIaU1rZGZPZHNBZ3lyQkNpU2xEMDR5dEt6ZlM3c3hKbUFI?=
 =?utf-8?B?dlE2OVBXWXoyWmIveisyRzdTU0IvNWJ3UjFJMVV4MkdLNnRTa0hydmlxRDlI?=
 =?utf-8?B?ZGM2ZUY2d2l5ZGs4QkNVNnMxYnRaV1FRWk9hdzh4bVRrWGdJWklXMXJvc3V0?=
 =?utf-8?B?M3NFbTNFOUkvZjYvQ2dIRWczMXR5Z2JLVms2V2IyMmV4TktRZ3lRdEh3eWZh?=
 =?utf-8?B?NHVEc3YzT3JLR083Y0hzYkh2MDg3QmVYWk9IbzFsMkx5STFBU0pqVnF4M3dU?=
 =?utf-8?B?Z2VrMkFCUE9URWY4TnR0bkVteCs1bXJqcEE2Zm1pem90dmNWY1I4Rm56S3RO?=
 =?utf-8?B?cHh3QS9iSWhBeEk5ZHBJd0plVUxRUnU5SktIN0RmL0h4QyswRW5US3haRTQ2?=
 =?utf-8?B?RkxTc05Ydk9TK1h2QUdHNUNnRWdsa3VaUzVJRmRjYndPT1o1WHU4K0F1STlp?=
 =?utf-8?B?ZVozRDQ0dUt3SHExOEludWNPUlFBaVljOFpNeDNuV2J6TUtyVmozNkNUbEJS?=
 =?utf-8?B?aDdEdC8rYnN3VVJsendjcWtFWXpGOUM1MUZodTg4cHV5Y1hMQWcxdzR3cGpI?=
 =?utf-8?B?Tm0xMmNBT1lNQmdwSHdVVTVWOFMxdjlmQjFzS3pBeWhRdnpiQnAvVDY3ZGcx?=
 =?utf-8?B?cnVBZDJFL0Y5cUFSbjJSQi85V2xUVnExRTBubCs2TFRnUmtkVk01bi9YZUlQ?=
 =?utf-8?B?K3hxNVFCM2N5UXdpbEcvc0xhWGthWU1YWWN3VWM1TXcvYkpOaSt0UFlRNFJp?=
 =?utf-8?B?RVNsNmNnUEJ5S2xQcDRMU0tjTDZ3SWs3QmJaR3lSUWlOTVRZWEpXeUFJRVpN?=
 =?utf-8?B?bG5KTjdvd2ZRZEI0bnQ0Qjl3N200RlY3cERCMnNjanZlelZ5Q0dBS2Z3ODM3?=
 =?utf-8?B?ZXhMSUNKWHhsRW42dUs5d3ZEM25CanB0enIwWGZ6VEd2bEhzVkRsWElIYkNx?=
 =?utf-8?B?bzVzWFlGbXc1VXBleTUrQlpkWEpVQWpiRHUxRkQ5dGNhM2NGYklpYnJlaHZU?=
 =?utf-8?B?UHJjVXBwQWlXeFFZdFFETnNBUFNuL0hQTi94aEtHK2JGYmlXRXdGUlZSb1ND?=
 =?utf-8?B?dUhhanhBUWRKMU0zMFNTM05MYkNTdkp1T1lRYWVQbWVTZ2dJbUZrUDFwcGt4?=
 =?utf-8?B?RHpYYUNXOGkva0JVaWw3RlpiUVVqNldFbHpqSmxPVG94dWpSOUdUNExKeGVL?=
 =?utf-8?B?SGRnQjNYZkdWL29zNVRQN0twUVJUZ1hRMzIweEF1emxrUkxvbDVRZjJDYVhm?=
 =?utf-8?B?Q29wSnNQSktoUytiUjFGMkQxSWZoWUhYcDIySjVZQTFYTmxMRUhuYXc3ejlC?=
 =?utf-8?B?OWV3OFQxQmJRbFhqOGhmemtjN0hnNm1ITlpJdjNaQjNrNG5WaUVORW9sa0hu?=
 =?utf-8?B?WURGYVdBL1JCRjVhRDRGc2tjeElvOCtzR2kyQVVhbEI1a3gyaUxtbHB4T2VW?=
 =?utf-8?B?UE11VUhQSXN2SnhWUGVlcWtUL01tT1VLYjRuVzBaaDBCWWMyNXpUQlhTZDJO?=
 =?utf-8?B?UStZS1dCRGwvNE05TXJyVU4vbDAyUGY1bnRTSEE5bEp1UHN4VnlIZWpNVGZK?=
 =?utf-8?B?NzNCczJJRWtZdFNMZ1NRQkx5cHo4dDFoVjZvS2tZWGF6QXRmTnNKUzd3V2tq?=
 =?utf-8?B?MUdQb05lR21aSHVmYkJSWGFnSjJnckpVSTNsTTVlZEgvcDZ6dWFhdGVGTlBv?=
 =?utf-8?B?cGJtNlpuT08wZitFTTJZQnZhYzNORlFIUExVcjU5K2dOTm9QeXhHaGxFOFVY?=
 =?utf-8?B?L1JXcVBYTTNjUzBVYmhpRnduTWs3SUE4L2VzTldzaE9ZQzdZT0d0dFhtNlFp?=
 =?utf-8?B?aFlyRFZyOXgrMXJOR3hmaHVQc1Y2b0ROYXhtbzNROXlMb01PU0VIZWRYT2lJ?=
 =?utf-8?B?YnpIekltU3ZmUllqL0Z0Q0FZYkc5RWlySHhFWkpqd0NsNFNYcWxUbkd6T2Q5?=
 =?utf-8?B?S0plN1NXWkhoMzd2SkswK2NyVzZ1c04rV2V1ajVLMEZxY1ZVR0x6YVNoVm0r?=
 =?utf-8?B?ZGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf7df70-5bd6-4f19-dd07-08db2e7d5568
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7539.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 04:40:04.5699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yyv7PNNQwgr906inJvDMLmDdr5apLHcOIXh6LfdNRW2VAo4zTtCGTchbIJf+peYzPiFmePKQ5m8dg2UL80F4abHmxGEyWGHXoZbwgIGe79M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8104
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 5/6] drm/xe/uapi: add the userspace bits
 for small-bar
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
Cc: Filip Hazubski <filip.hazubski@intel.com>, Lucas
 De Marchi <lucas.demarchi@intel.com>, Carl Zhang <carl.zhang@intel.com>,
 Effie Yu <effie.yu@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 3/23/23 1:59 PM, Matthew Auld wrote:
> Mostly the same as i915. We add a new hint for userspace to force an
> object into the mappable part of vram.
> 
> We also need to tell userspace how large the mappable part is. In Vulkan
> for example, there will be two vram heaps for small-bar systems. And
> here the size of each heap needs to be known. Likewise the used/avail
> tracking needs to account for the mappable part.
> 
> We also limit the available tracking going forward, such that we limit
> to privileged users only, since these values are system wide and are
> technically considered an info leak.
> 
> v2 (Maarten):
>    - s/NEEDS_CPU_ACCESS/NEEDS_VISIBLE_VRAM/ in the uapi. We also no
>      longer require smem as an extra placement. This is more flexible,
>      and lets us use this for clear-color surfaces, since we need CPU access
>      there but we don't want to attach smem, since that effectively disables
>      CCS from kernel pov.
>    - Reject clear-color CCS buffers where NEEDS_VISIBLE_VRAM is not set,
>      instead of migrating it behind the scenes.
> v3 (José)
>    - Split the changes that limit the accounting for perfmon_capable()
>      into a separate patch.
>    - Use XE_BO_CREATE_VRAM_MASK.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Cc: Filip Hazubski <filip.hazubski@intel.com>
> Cc: Carl Zhang <carl.zhang@intel.com>
> Cc: Effie Yu <effie.yu@intel.com>
> Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>   drivers/gpu/drm/xe/display/xe_fb_pin.c | 13 +++++++++++++
>   drivers/gpu/drm/xe/xe_bo.c             | 13 +++++++++++--
>   drivers/gpu/drm/xe/xe_query.c          | 13 +++++++++----
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c   | 18 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.h   |  4 ++++
>   include/uapi/drm/xe_drm.h              | 20 +++++++++++++++++++-
>   6 files changed, 74 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 65c0bc28a3d1..2a0edf9401da 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -195,6 +195,19 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
>   		goto err;
>   	}
>   
> +	/*
> +	 * If we need to able to access the clear-color value stored in the
> +	 * buffer, then we require that such buffers are also CPU accessible.
> +	 * This is important on small-bar systems where only some subset of VRAM
> +	 * is CPU accessible.
> +	 */
> +	if (IS_DGFX(to_xe_device(bo->ttm.base.dev)) &&
> +	    intel_fb_rc_ccs_cc_plane(&fb->base) >= 0 &&
> +	    !(bo->flags & XE_BO_NEEDS_CPU_ACCESS)) {
> +		ret = -EINVAL;
> +		goto err;
> +	}
> +
>   	/*
>   	 * Pin the framebuffer, we can't use xe_bo_(un)pin functions as the
>   	 * assumptions are incorrect for framebuffers
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index de57ccc5b57c..25b1a56c2afa 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -893,7 +893,6 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>   			ret = ttm_bo_vm_fault_reserved(vmf,
>   						       vmf->vma->vm_page_prot,
>   						       TTM_BO_VM_NUM_PREFAULT);
> -
>   		drm_dev_exit(idx);
>   	} else {
>   		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
> @@ -1518,6 +1517,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>   	if (XE_IOCTL_ERR(xe, args->flags &
>   			 ~(XE_GEM_CREATE_FLAG_DEFER_BACKING |
>   			   XE_GEM_CREATE_FLAG_SCANOUT |
> +			   XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM |
>   			   xe->info.mem_region_mask)))
>   		return -EINVAL;
>   
> @@ -1555,6 +1555,14 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>   		bo_flags |= XE_BO_SCANOUT_BIT;
>   
>   	bo_flags |= args->flags << (ffs(XE_BO_CREATE_SYSTEM_BIT) - 1);
> +
> +	if (args->flags & XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM) {
> +		if (XE_IOCTL_ERR(xe, !(bo_flags & XE_BO_CREATE_VRAM_MASK)))
Hi Matt,

if (XE_IOCTL_ERR(xe, args->flags &
		 ~(XE_GEM_CREATE_FLAG_DEFER_BACKING |
		   XE_GEM_CREATE_FLAG_SCANOUT |
		   xe->info.mem_region_mask)))

by the above check, compares args->flags and xe->info.mem_region_mask to 
see if the XE_BO_CREATE_VRAM_MASK bit is on in args->flags,

But why is it checking bo_flags and XE_BO_CREATE_VRAM_MASK here, which 
stored bit-shifted values of args->flags and not original args->flags?

It looks good to me, except for the part I asked about.

Br,
G.G.
> +			return -EINVAL;
> +
> +		bo_flags |= XE_BO_NEEDS_CPU_ACCESS;
> +	}
> +
>   	bo = xe_bo_create(xe, NULL, vm, args->size, ttm_bo_type_device,
>   			  bo_flags);
>   	if (vm) {
> @@ -1818,7 +1826,8 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
>   
>   	bo = xe_bo_create(xe, NULL, NULL, args->size, ttm_bo_type_device,
>   			  XE_BO_CREATE_VRAM_IF_DGFX(to_gt(xe)) |
> -			  XE_BO_CREATE_USER_BIT | XE_BO_SCANOUT_BIT);
> +			  XE_BO_CREATE_USER_BIT | XE_BO_SCANOUT_BIT |
> +			  XE_BO_NEEDS_CPU_ACCESS);
>   	if (IS_ERR(bo))
>   		return PTR_ERR(bo);
>   
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 9ff806cafcdd..e94cad946507 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -16,6 +16,7 @@
>   #include "xe_gt.h"
>   #include "xe_guc_hwconfig.h"
>   #include "xe_macros.h"
> +#include "xe_ttm_vram_mgr.h"
>   
>   static const enum xe_engine_class xe_to_user_engine_class[] = {
>   	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
> @@ -149,13 +150,17 @@ static int query_memory_usage(struct xe_device *xe,
>   				man->size;
>   
>   			if (perfmon_capable()) {
> -				usage->regions[usage->num_regions].used =
> -					ttm_resource_manager_usage(man);
> +				xe_ttm_vram_get_used(man,
> +						     &usage->regions[usage->num_regions].used,
> +						     &usage->regions[usage->num_regions].cpu_visible_used);
>   			} else {
> -				usage->regions[usage->num_regions].used =
> -					man->size;
> +				usage->regions[usage->num_regions].used = man->size;
> +				usage->regions[usage->num_regions].cpu_visible_used =
> +					xe_ttm_vram_get_cpu_visible_size(man);
>   			}
>   
> +			usage->regions[usage->num_regions].cpu_visible_size =
> +				xe_ttm_vram_get_cpu_visible_size(man);
>   			usage->num_regions++;
>   		}
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index cf081e4aedf6..654c5ae6516b 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -458,3 +458,21 @@ void xe_ttm_vram_mgr_free_sgt(struct device *dev, enum dma_data_direction dir,
>   	sg_free_table(sgt);
>   	kfree(sgt);
>   }
> +
> +u64 xe_ttm_vram_get_cpu_visible_size(struct ttm_resource_manager *man)
> +{
> +	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
> +
> +	return mgr->visible_size;
> +}
> +
> +void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
> +			  u64 *used, u64 *used_visible)
> +{
> +	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
> +
> +	mutex_lock(&mgr->lock);
> +	*used = mgr->mm.size - mgr->mm.avail;
> +	*used_visible = mgr->visible_size - mgr->visible_avail;
> +	mutex_unlock(&mgr->lock);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> index 35e5367a79fb..27f43490fa11 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> @@ -25,6 +25,10 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
>   void xe_ttm_vram_mgr_free_sgt(struct device *dev, enum dma_data_direction dir,
>   			      struct sg_table *sgt);
>   
> +u64 xe_ttm_vram_get_cpu_visible_size(struct ttm_resource_manager *man);
> +void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
> +			  u64 *used, u64 *used_visible);
> +
>   static inline struct xe_ttm_vram_mgr_resource *
>   to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)
>   {
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 661d7929210c..5a9807d96761 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -169,7 +169,9 @@ struct drm_xe_query_mem_usage {
>   		__u32 max_page_size;
>   		__u64 total_size;
>   		__u64 used;
> -		__u64 reserved[8];
> +		__u64 cpu_visible_size;
> +		__u64 cpu_visible_used;
> +		__u64 reserved[6];
>   	} regions[];
>   };
>   
> @@ -270,6 +272,22 @@ struct drm_xe_gem_create {
>   	 */
>   #define XE_GEM_CREATE_FLAG_DEFER_BACKING	(0x1 << 24)
>   #define XE_GEM_CREATE_FLAG_SCANOUT		(0x1 << 25)
> +/*
> + * When using VRAM as a possible placement, ensure that the corresponding VRAM
> + * allocation will always use the CPU accessible part of VRAM. This is important
> + * for small-bar systems (on full-bar systems this gets turned into a noop).
> + *
> + * Note: System memory can be used as an extra placement if the kernel should
> + * spill the allocation to system memory, if space can't be made available in
> + * the CPU accessible part of VRAM (giving the same behaviour as the i915
> + * interface, see I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS).
> + *
> + * Note: For clear-color CCS surfaces the kernel needs to read the clear-color
> + * value stored in the buffer, and on discrete platforms we need to use VRAM for
> + * display surfaces, therefore the kernel requires setting this flag for such
> + * objects, otherwise an error is thrown.
> + */
> +#define XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(0x1 << 26)
>   	__u32 flags;
>   
>   	/**
