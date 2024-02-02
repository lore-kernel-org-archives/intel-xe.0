Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0359C4828E
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 19:05:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB6C10EF43;
	Fri,  2 Feb 2024 19:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QYr+BF8n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB7F910EF43
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Feb 2024 19:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706900733; x=1738436733;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=34EACTdKLv78oSXBwhqmBKUCwKQjjEEg0F9wYfl9k+s=;
 b=QYr+BF8nAO9XMt603y0lOF0ivnbexXwU1U0w83VT+JOANXE33e4CcgN8
 2+bIpuscECf/Jzi4ackRc9c6EbLfl0QkSOIOUVAmNwb3aRySUZpTtfpA4
 zqctLMIXqd6Uf+gWxfjzE0aZewwXJmmq5CIkRG6NLnUGx9LEvvozTnzO+
 YRq5SeKMf0ZJ+/6koDanQR5rAE1DnzA6NUPxAP61j7fcbU1LzFiNvt3RW
 0kj4xD3hd38JM8glvy262lGxNB9678h41+yFwbGS6Tz8X1h+62+svmQf5
 v0h7oxpGf1gUfmrO60FuyaT8xECMnIlKPNFm88/OVPe/fsimQnC7SM8sj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="435360686"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="435360686"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 11:05:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="448302"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2024 11:05:32 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 11:05:31 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 2 Feb 2024 11:05:31 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 2 Feb 2024 11:05:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g2HNeaInpgRo10SXFoCpDwaiv3/aTrqSdwdkXyuCiy2sXFMk4T7oiBkv8xOcPpmbJFYEOVJK3pK2MMHUH11Aa4acI/wtPH/XkCLoKO/lLoJbwT/YeVp6HQcNeoWU8FJrbSD61UbYqeBVNx8fighPbc0Iy6NwCOgnyHda/c//qfct/dsJjOA2dvqFXvw95euJT854TkR9r1ZdisUXs4ArVcuKAg3LWgG4ph5EX7Yk5xo8k92/vwAazNiC93TkFR+abf1n5DJLfoqSA32JTNlwOIAJpLom0qPvckjXa2Z7oWXAc+bVQY5pEMqJuGWj0Iq6pkp0ZNrVONB4GgAWJxi8Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHbCn6zqT2HHEBuMiWaxhHC37CazkzbOZ43nOUBcKug=;
 b=aaIUvZq9A/XQMY2VQX+V1TB18uibMpSy93fvwQPDe/cipFN/yIMzszWibkbFtun7Y4ORMXASOEhkggpUwFw+bmjjHbzY/uhyCwvBNbPRXpKvi8lXBzdCwb7A3k3+GrDPLjB3fIoPGlq11c/CZL6G4tgVy/2Yk95JL9RR7YjhVSCgcCBZovJZuinGX1XIqX1nViHaXmCEfuKY+Q1JGh+UtO4tQoiGRvemdLATNiAs3upMIiFkBstjTWJWTYnt681zaKKkXoMCA+tE9gLa9LdNdV/uMCOF2j2EnXx7dZ4NeO1eU3QOHp4889BBbKJdNf1pJ75rqBH0DTo3+3qiL4DQSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by BN9PR11MB5529.namprd11.prod.outlook.com (2603:10b6:408:102::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.30; Fri, 2 Feb
 2024 19:05:29 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::83d:7cbc:ec45:cb9d]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::83d:7cbc:ec45:cb9d%7]) with mapi id 15.20.7249.024; Fri, 2 Feb 2024
 19:05:29 +0000
Message-ID: <5dc4d6f1-de79-4cb4-8821-9a292d73a2b6@intel.com>
Date: Fri, 2 Feb 2024 11:05:27 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Map both mem.kernel_bb_pool and usm.bb_pool
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240202033440.2351862-1-matthew.brost@intel.com>
Content-Language: en-US
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20240202033440.2351862-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0086.namprd03.prod.outlook.com
 (2603:10b6:a03:331::31) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|BN9PR11MB5529:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e4a6490-a03e-4e2b-a81a-08dc2421ec0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d+uLbMdGBcIHO+S0hfbGOnOTuqFUCtF344/5NzfvoZeRDsrVKMXFZwt+ovghsY+CaFFy/7wXO20OIT31cxo/ob+VY28kpwzkHQgKeOqyN8UCsUehaM5Fddx1t9hryYKgwOn8XboXlLduuwvYdxRQI0yQGkrcLmYTMqomGHz7XVdbkcAB7SdYhU1A8L3nnICzw7fbcsqHH2OleNjgJsFkEeukL1UTqsJXX/ckYG5wP0kvf4WAnlraAI/1REQXG1fVO1RqjhY8kz294QaVG84vCb78HcoeVyetLB8UyIMKqkZoXRl2F8GY5uV0Jq7YtmNRQ76tYDzEOcmfRlgrPeQn1b+yDFOvVltS9JnG/JLzdZ5bY3vi8srR9wKTGQ8jrP+ARlQEo3bpaJICMKloyZxhDwkKRcw+E36A4KVTgbmFsyHaSUCl5guIgFs5u7yrqIIA/Td1kGjaErqV/yNpR1/rxFSQiKVbA4T7PFJs2ADqiCDBvU0JtIPIsne8tBFu2zCqpvUEs92qR7QGrhVBNDI1dyLE20mowfu9SuoubKWNaispd5ft1ACuSh/vu9u/AEVa3GpZumq4VP/4zU+pL8KM+3uqhLsZwZWLRdwN5WkBZ9r7doLVOlWBMaEpx2y3XeqeJBPc/M3MtU+YD+qfm7ZvGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(136003)(39860400002)(346002)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(26005)(2616005)(31686004)(41300700001)(66476007)(316002)(36756003)(6486002)(478600001)(83380400001)(53546011)(6506007)(6512007)(66556008)(38100700002)(66946007)(82960400001)(31696002)(86362001)(2906002)(8936002)(5660300002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bENkdTZGV3ZPQlQwaFQwZDVWREFOOWhXNjFJa0RLcDNsWFBNd25WMTZmUXNR?=
 =?utf-8?B?T01Db1o2VzRtbEJSdGQraVBuci92cWE3OUVZMStyYkRkZGdpc0V3ek9QcUtG?=
 =?utf-8?B?U3MzYUw2dnljZjFGc1UybFlvV1pXSkRaYnJKSG5jUnkyYTJsdHludGhiTEZi?=
 =?utf-8?B?aC9mZGxIMTkraCttdUlMV3NiREdiakR0MkpCMkRueU50Q1ozZ0hzblB0SVp5?=
 =?utf-8?B?RE1vZkt1dWtGdC9HSnhNQVR3T0loaXVlZXVnUGxaQTBoZDdCREtvdGl6VjQr?=
 =?utf-8?B?bVJSeElYVzhGTG11bXgwbU83TkJGTHhFZlRmVWVkVlR1OFFsY2RNVjhqR2li?=
 =?utf-8?B?NmhEaE1rOUxQUVF1MzdlTGFOSWlkS1lmQWg4UmJxdk9SYmhLcGdCN1hYd0lq?=
 =?utf-8?B?Q3QwOVU4ckkyLzRxWWFwYkFyY3Uvc0dVYzZCdlFGL2RYL3owTkFrcVlzYzY3?=
 =?utf-8?B?WmJzMHkzLzBRcmRNSmgvYW1qODVQWmE5Y2J2N1JwK0pWTjVqYW9QRTBmYnp1?=
 =?utf-8?B?R3QybHN3V2dFWGtYTzdTM0E2QzlPRlBldnUzWEtlSVBXR21CRzd1M0hBSEU0?=
 =?utf-8?B?b0phSlh3cnRvQjgyRk5DK1VONXpBdkYvTEx5TTFxUEwzUXh3WGRtZ21OY0wz?=
 =?utf-8?B?R3VqYW8reUx3MFZ6KzljWTJtTnlLbW83N1l2ZEQ2OUtHZlkzM1NhVktCWmx3?=
 =?utf-8?B?VEJuR3Rsc2dyUm1XNHNLRmVPSnkrYnFnYnFuQjNiNCt3enVqVmdDUEg1NWNa?=
 =?utf-8?B?aERsd1RBQk85WHhUaWZuWkFDaW1OMERvTjVUeUgxU2p1WjlQbnM3S1g0bGJW?=
 =?utf-8?B?Y2oyNXprdk1WSVRYUGNNYzFLcjY0YW1BRGVzWSs3UGtpWkorMnBpeDJzeFFv?=
 =?utf-8?B?bGkvTWQrYWlubVEwRXlaZk9tNHZsUGUxV1JmUVlUODlyUmlyTEFCcW9FL3Rp?=
 =?utf-8?B?RW42ejBKTGd4NWwvQVNPRkk5OStaZnZ3Qms1czBzL2hSTlprUTlxb0R1V1hp?=
 =?utf-8?B?cWg1RXo2d0F0VE9LQjlqVGRWOHNzMmNnclJoNkEvM0hZU3lKbUpyNmxNQzdJ?=
 =?utf-8?B?aVBxbWZSSTQ2dW96ZFhWUFRVNFhac3ZaMW40WUtFaUdVcldvdElrNTU0VFE4?=
 =?utf-8?B?RUpJTm5uK00xNFUwRThtNnVtdTFRZ1BNdE51aU8yWktSWE1MQ3hjdVk5NEZY?=
 =?utf-8?B?bnE0NnlGKzR1YVpmUSt5aENtSDBBbC9PRVZqMkl1UVA4Uy9lUVpLYmdDbDRJ?=
 =?utf-8?B?RXU5blMwUDdBZHJvYUg5eitkZE1iUVNUdUhhTFo5ekVMQk9ib0c5TlV6MjJx?=
 =?utf-8?B?M3FjcXdWaVcxdTI3ZVpqU09HeXVKOUs0cnFCVUdwbndhd2tYdno5dG8rdTk3?=
 =?utf-8?B?bGxPVU5qejRYcFlheGRmS2hIWWpRaG1RTEtJRzNjTnJSM0d3bnN3aWJ6SW1F?=
 =?utf-8?B?YmFYSGlMN0ZwR1VxaFkrSUg1ZkJ0NDV6QmhNeGNkcUFZVlBnWU9Kb2NFL29z?=
 =?utf-8?B?L3FiaVlCU1BxT2E2M0ZMbjZibDVnNUh5eVRVaitJdU1FWFl2ZHlNU2VtM2c1?=
 =?utf-8?B?S2xuOEpqcmk5Qjh4R1NTQkhNQ2FsWjl2M3R6QVJxVlNHbGRXdnFXUWtEMkdj?=
 =?utf-8?B?YzhyQ2dmdUpYZmNLdk5tM3VkWTVibzRpaTh3WnR1am5nNHp2WmRpL0p2Q2Z2?=
 =?utf-8?B?Ym9kWHNZSnhDZjJlQXZ2VHRNSzQ5QUpoN0xMVThFb01jYkZaN3N4cWZaejlr?=
 =?utf-8?B?ZzIxN0VJdk5panRiOWhnUnEwWGY1Z08zdVo1c09CVFZ6ZG1EcFZ2UDZ5MURP?=
 =?utf-8?B?ZHREeFBrb1VKMzBiQ0RqelVneTNmNHZxNnZiejFqVWpEZ1BzcHpieWdydzVt?=
 =?utf-8?B?eE9XVDFJMkhRZUhRdi80ajg3YitTaE45NGNxaHpFcFlJWUJ1bDZNcWQ2YjlQ?=
 =?utf-8?B?QkN2Y0RSZXU1S2gyNWNqaE10M2Q4RGtDY0R4SWRKdkszMDNJbjRLZjcwLy9k?=
 =?utf-8?B?N1RSRHo5TnFDdE55TWZsbmVTeEppOGVKNFpyYkFXVTI1MnhodExaSGV5dDdl?=
 =?utf-8?B?NmZMWDJoU2RQK0dKVm5OQk9kWWMvNUd6bzdmQmt0bGlIMkFmVUM2cWE2ZWdx?=
 =?utf-8?Q?MNJMS2+gLJoSLtgIwdx92D+xC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e4a6490-a03e-4e2b-a81a-08dc2421ec0b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 19:05:29.3546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CZqCUNugrR7JH0Bfxs40ap0i+iwPRpTW12Wu96gR/YvbgxxYtXNjAABlg5SwV7wk04PxhmFIeqwmc/XSftWgqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5529
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


On 2/1/2024 7:34 PM, Matthew Brost wrote:
> For integrated devices we need to map both mem.kernel_bb_pool and
> usm.bb_pool to be able to run batches from both pools.
> 
> Fixes: a682b6a42d4d ("drm/xe: Support device page faults on integrated platforms")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Thanks Matt.
I applied the fix Stuart pointed out and verified this resolves issue on 
LNL with xe_exec_threads.

Reviewed-and-tested-by: Brian Welty <brian.welty@intel.com>


> ---
>   drivers/gpu/drm/xe/xe_gt.c      |  5 ++++-
>   drivers/gpu/drm/xe/xe_migrate.c | 23 ++++++++++++++++++-----
>   2 files changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 675a2927a19e..295cba1c688f 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -456,7 +456,10 @@ static int all_fw_domain_init(struct xe_gt *gt)
>   		 * USM has its only SA pool to non-block behind user operations
>   		 */
>   		if (gt_to_xe(gt)->info.has_usm) {
> -			gt->usm.bb_pool = xe_sa_bo_manager_init(gt_to_tile(gt), SZ_1M, 16);
> +			struct xe_device *xe = gt_to_xe(gt);
> +
> +			gt->usm.bb_pool = xe_sa_bo_manager_init(gt_to_tile(gt),
> +								IS_DGFX(xe) ? SZ_1M : SZ_512, 16);
>   			if (IS_ERR(gt->usm.bb_pool)) {
>   				err = PTR_ERR(gt->usm.bb_pool);
>   				goto err_force_wake;
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 9ab004871f9a..7465f8d14028 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -180,11 +180,6 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>   	if (!IS_DGFX(xe)) {
>   		/* Write out batch too */
>   		m->batch_base_ofs = NUM_PT_SLOTS * XE_PAGE_SIZE;
> -		if (xe->info.has_usm) {
> -			batch = tile->primary_gt->usm.bb_pool->bo;
> -			m->usm_batch_base_ofs = m->batch_base_ofs;
> -		}
> -
>   		for (i = 0; i < batch->size;
>   		     i += vm->flags & XE_VM_FLAG_64K ? XE_64K_PAGE_SIZE :
>   		     XE_PAGE_SIZE) {
> @@ -195,6 +190,24 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>   				  entry);
>   			level++;
>   		}
> +		if (xe->info.has_usm) {
> +			xe_tile_assert(tile, batch->size == SZ_1M);
> +
> +			batch = tile->primary_gt->usm.bb_pool->bo;
> +			m->usm_batch_base_ofs = m->batch_base_ofs + SZ_1M;
> +			xe_tile_assert(tile, batch->size == SZ_512);
> +
> +			for (i = 0; i < batch->size;
> +			     i += vm->flags & XE_VM_FLAG_64K ? XE_64K_PAGE_SIZE :
> +			     XE_PAGE_SIZE) {
> +				entry = vm->pt_ops->pte_encode_bo(batch, i,
> +								  pat_index, 0);
> +
> +				xe_map_wr(xe, &bo->vmap, map_ofs + level * 8, u64,
> +					  entry);
> +				level++;
> +			}
> +		}
>   	} else {
>   		u64 batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
>   
