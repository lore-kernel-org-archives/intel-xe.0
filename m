Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B50AFC83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 20:05:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E4510E056;
	Thu, 10 Jul 2025 20:05:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="in34O3kN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6446A10E056
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 20:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752177919; x=1783713919;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QAyn6a8Q7yky2gqL6KqQZIA0Qrw4e8NJIS5Qw5tvtV0=;
 b=in34O3kNdvo8aXudPJpdZWvrWJ5c4C7Qh/Ce4WGiU1XYxIdIsnhlEb34
 KMwoBi+3hgI5hXWu7axGS9B2YmeYPGIq6yrq08WdF8hXIHNeNoGdrjmXF
 KyD0PHbtHVE7yqFxKAOBJyMAXCbNr8rctrs8kozsFzsQeLmpKY2W/hjcF
 I/yJDV+5yxCdHlyaZJx7d1Wr6XWRNXYq2B1T5X+tX5ZfTqm7BkSGSFMLH
 q8s8Qy0a4/sWjehRnFMf2yrfX+GxZasxiAqE+Jc8gkcwPEfo0vNRaJieu
 3zo1qcVPF9Yea1cKOCyQGFDRNq9DCu6lW3UuF14F+BeWO21HOF0Nbhsas Q==;
X-CSE-ConnectionGUID: B97qnbANRfifAylXN1nj4g==
X-CSE-MsgGUID: jtLYPmtrRgu6aqs/OlBOng==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54322498"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="54322498"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 13:05:16 -0700
X-CSE-ConnectionGUID: O3z4SClNTLS/6bEo7CxbdA==
X-CSE-MsgGUID: ZgOJMReRRgOz5XdOdItQ1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="161747553"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 13:05:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 13:05:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 13:05:12 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.44) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 13:05:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CWURF3JPbwJKWbFlyMixJAySBIl2bUppNqDhsivSupWpkjUGwTh3ZctW5iJ+BvBqwtQvevDmaiebBB2oMcwJzB1yI/bBvzbPNI8Hi8F9+Z/qLRBxb3ythKsowSVuL+gQbhCPAvGvtQ1EqdzhCNOlW8GSnd0gJGWrPckjezIteUVDmwvBPPyFTEOBPHhDp5D/fxHo7cKBgXhSyFnI/jKMA6+BaXqdcXoU1nM+rpLi/+Z2i2VrkAQjrQq9QLFbIwanGqsq8F6NQgORGzKqh06j7toQGC+Ih/owoBlEoc7l8VtuUVz4vinFoCYRzCRDEwGwJ1uiOrtmmziieDFg5WgPNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GS6PvmqYMiemslCqCEKXK2BBPPWk3Ey+nZNMGxg98MQ=;
 b=FqZhzewyB8UW7naXTgN675IMhlltzHkApjcaLz5sEjdUqOrJGaPe9yms+7Sy4m0sh6vM+alW15cOKUx+oKq59ffKklW0KiF4NgytLhIp8H2IzWY/mvgUiINVM2eCDes6GuTmB+OiyiP7qSwjcnqzAOCIi5yUbb6a28RZ28ZrYmot1REPjYJo0Ri38gP1tU7xESW9KbE809dLptBIbWOZ9Y2vo7G8ECehlV/d0hZhpumPVXZjDxtVB7ahWta4JXo/2qdxuVZbGgPucSNzwYKkljlYfZZDtRF43btXwd/v6I4kGlkukhkyCh8ZyB4hInUoq4xCAbdI5/HYH3W2pMDEoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH0PR11MB5268.namprd11.prod.outlook.com (2603:10b6:610:e3::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Thu, 10 Jul
 2025 20:04:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Thu, 10 Jul 2025
 20:04:41 +0000
Date: Thu, 10 Jul 2025 15:04:39 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/migrate: fix copy direction in access_memory
Message-ID: <tajuqsix4mnzoqx5ctzy574oupgmbifudsw7hhi7cx2mbru57b@ejsukafklbw3>
References: <20250710134128.800756-2-matthew.auld@intel.com>
 <aG/25+aNyGqoCPXn@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aG/25+aNyGqoCPXn@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0P220CA0027.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH0PR11MB5268:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c8718de-c004-4e79-26ac-08ddbfed01c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IAbgzzMYe1RDG1kKFUWNegqM3Ar1+CnUO3BnvsURsQ9TJ8an6zRUUdqOR5Ke?=
 =?us-ascii?Q?MMhDm/uQ74QStNe1VQyueWQnLSvRXw+3rKTzVUx5VvojFbGlacAmXxHpPIQx?=
 =?us-ascii?Q?atl1OGn4hu2v4d5C0zqgEUjG/Wl5Tx4Z0vIpMNueNZa2hp58YiR5lInOCuo0?=
 =?us-ascii?Q?gVALz60MzZjJVW06544pPknzHv+v5Mexws39qh+ffQrLGu+32+4Dpdryh82z?=
 =?us-ascii?Q?N3eNr4vvP6htay4pts2vYkzp+kuWe1QGg+u/jTbVi23GF2nWjP0n6OUyF191?=
 =?us-ascii?Q?Duvrm/Tpmmy/OWe8MKwvZ9QTPFgvP9Nk3gkCV0gpVX3Ifl3c9vfIX3RoG2EZ?=
 =?us-ascii?Q?m80nPmA7hJo9VSlmRbmyoG2lRFmc9paWnoCydVer2FuPfGMj4syNrETIxK8O?=
 =?us-ascii?Q?7gLW3H7ibN+TjdTwWgUyVLtVfuz5a0jNTqheM9W4oPEyAABiUEbm+38Nqf6C?=
 =?us-ascii?Q?wo999LZSvkJVBjWZRN8zfGrqnFTUuKtzcloECK6LMkvaLj8oFv+pdb3o+MG1?=
 =?us-ascii?Q?E2gYb0EcWtTwtngRxfzS9Ezl5iFZfa7p1Dh6a1GIz9MLf9CAA8HB90zZxewI?=
 =?us-ascii?Q?bHMH671E36P9IsYok/jY7oJVlWdOwtLyYPgb+LtH94I5aCIUdru8HbAama+3?=
 =?us-ascii?Q?Mq9LGGKamwVGJaWLSCj3sOBR6U1ArjO/GmWNfa4kmCL8yt+d2FIL2iCXKA5U?=
 =?us-ascii?Q?yaQ0V0woDU3dtVtDmCsmA3omuU7k8TAok4fu1IZA9mwncy2YYIE6jgiKDOnq?=
 =?us-ascii?Q?HF7MPf24TvdVqZ4bIDCe8OjXZotxwDJwnxsU6y1FjCABwvMpYRWkNW9UaGis?=
 =?us-ascii?Q?Mgreivfbc5UoMFCUGhk2lfK4mb81OoCj8YlFo31PeUnPZ/sU1ee/wYTY2VnM?=
 =?us-ascii?Q?9HlJhlHItm06nxZq3cEG9tUo9bw3zuC+tz0Y/j1jZqNv3txcK88Mp/fcMN4p?=
 =?us-ascii?Q?YMsipnp1NO43BSI7DOfm8ExWM8KnzIwHmNYPFdZL/QK2lThY4tOr5l4nkRqL?=
 =?us-ascii?Q?UvgWjRnxCVtBmVUZTAOMhxJ7ST5stDJMZiC5sZbiS1suCzKSwqvV4JKxFqkh?=
 =?us-ascii?Q?elc4U4qKGrZswX2kiVGogvFi5y+bpGW4EDKEdnAAiisrh0ltEWFU8XX3J3dT?=
 =?us-ascii?Q?o7I+bd+wWgHtM44o/scHWRmErQf2PxOKCcHSyoycNiD9fhOoBm72DtoJK6oW?=
 =?us-ascii?Q?GtY1IPUhxkXDjWh9JFX/zWgu64n+mfKD9aMWbbe+IbO6/+fVPOb9NkngAwKu?=
 =?us-ascii?Q?daA8OZOuNxon9uelBV321Gk0+Zb0Z7PTiE/O9AxhEtiERVhfsov17w0mxqEt?=
 =?us-ascii?Q?lqS43YcRUme1N7JAXIwyXI/fR9auSL8SFVRGaqvEtBQhVKlQR01dNoo1gzqq?=
 =?us-ascii?Q?sv2oU7PYpf41vwqN3ze6QWVppXVcaN0FBo0oTBJK77tbwUemxhpKZwt7fIf5?=
 =?us-ascii?Q?tVdWK9A94I8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7nRvQgXIV4z/GC5az/MyGXlibahoKgfVcODBsENFewn2oZG9+3F/br+rw1dI?=
 =?us-ascii?Q?aZS/MGO3eoVQJDY4CBM6FFTfyf7OBjWy/tmIYCNtFnwMcgeV1qCfDtcFKi/f?=
 =?us-ascii?Q?yofvp7RKit05/UZ/7frsSlHHKSpvQVCp9nEGafCcmgK3MPYzoEtt3jsiSSvf?=
 =?us-ascii?Q?cDGBXD6caGhBuCl1OmmRZstJfTCPtNf5rfN5GkRFfxsATRgrfvpYOeb/MIwb?=
 =?us-ascii?Q?Zn7nqoB/uf3wlth287pWuxDwnW99fWsMAIUvbwJsCwT6xotNNodJFFJGcGs9?=
 =?us-ascii?Q?1BFP9FvWBcPcyca2jF3vJLUmRbhlCeFaOMnNTrH80+qP3j0lYFeKYAaPg1Sw?=
 =?us-ascii?Q?+9IrIoQ9oMvjr1DAhiv0KiGA9QyEBb+1/shDtGou81ZuEBS110bkb6CfGItC?=
 =?us-ascii?Q?khxZpSeYW8wyXtxjmvnmHweBZv8LcDr/knDC8hb9nbu/B3t8o2V6FO24C9yy?=
 =?us-ascii?Q?95Ro/2MmLKj9GegwMYbAMM5DLXxEqnBBe5jWSp0cpsn8CJe8EOa+WnKjLeyx?=
 =?us-ascii?Q?fDcQePE16hhOZdjxOEuo45LtbFQpBexJIE9EnMU3kOUygme22MOvqif4LUhd?=
 =?us-ascii?Q?ADvNlOeCqVou1TA8hOGgKb8dFdhDuu9aj3hKJJ1LlW2LPAYI43in96MPEfWw?=
 =?us-ascii?Q?/flYHKEDq9miQ7fL3hApZ8MoRGYPJKSDX1xh3NMgJ44dV+QOeXZUibB0KCP9?=
 =?us-ascii?Q?0afGXJyHVHSu44PNWnnpMqzcYsDyrduGuGKKoJaPH3PjgIEti87dNss5UbF+?=
 =?us-ascii?Q?IvnQiLdyPC8avb9d4feZBwMh1DXWeTIghS57SDF6TWvrxNoDJSepQxAUtzw9?=
 =?us-ascii?Q?oHhC8SLvof2xinEcMjTj8aokKKFcpVM6A6QdPXx4Je7giAnYqFWSkHMiOr53?=
 =?us-ascii?Q?ACacYFISVCJYArnX1enX0TbjOrpkpXpMMuckGKHcjm3Avzo7j+i/2xx8mRMl?=
 =?us-ascii?Q?mBJz7VlvPXzlqSodq2md0YBLOLWg7JkildvbkdvuR6AuZOor/741Bgv7nw9B?=
 =?us-ascii?Q?AjNDjyiuRxMPlhEksdWAFbVA+S6qm9OVQhRAtJLkHyJg5uQZkKIjUNntRYvN?=
 =?us-ascii?Q?KFLM4hslNHCEOW32TswIFR2hM/03v4+ORfavbaT4p9Idq1rq+V8fgd+eTeH5?=
 =?us-ascii?Q?wqX1AnJ2W/c1GYEnSt6XEBUcLKLUILt9DGOcRmxjmqFBc3YeEWtz8Hl8WjI4?=
 =?us-ascii?Q?TntMQAKQ0AYzOw1aqYr/KVGsZDHS0mhSBmE+7N4fV+MA5gzSSkiPBCfTXDxb?=
 =?us-ascii?Q?ENcSj5BnXM4LxdQWQMU4Q+VEjPADCi3a8IzYdfKyk/joJdZS8bOAtLeVOH44?=
 =?us-ascii?Q?D5iw8F8jsaqMeI5Jwi/Nu2qi2z3lbGXfb4v+otJ677IV1/P/4prUiVCMBMfJ?=
 =?us-ascii?Q?dTxKk7GhC9NvGuAXiF5QI7pvr296JwSJYGk1uWhbu9Vhm85uOKWDR27XHBE5?=
 =?us-ascii?Q?ySHPa5lD2Lu4J503FcgTxFnxZQfe/m6SMWkplkYb/Mp5Kw7COP5z7tguoPrU?=
 =?us-ascii?Q?/BPuiyROdv1+pbCKvc+xp8Xb9sT0bJYufrF8PFvuL/QqTm5WEtIbeay1iALt?=
 =?us-ascii?Q?VJfxSxBaa166hKkHG+2Hv/hehTul8gFHegZBfXeNL+9ZlpHEylW3kW6aO+M6?=
 =?us-ascii?Q?CA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c8718de-c004-4e79-26ac-08ddbfed01c5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 20:04:41.6278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QbQ+w4h6t6JzHGBYN1y2n6yrh4dXCoxWQPiAyG6bc7rgMjpbqp8IkQLn2hsbSkH5D/tp3sHBFTFMazzODrR0lcyxjWPVqN2S674L4V7jqPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5268
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

On Thu, Jul 10, 2025 at 10:22:47AM -0700, Matthew Brost wrote:
>On Thu, Jul 10, 2025 at 02:41:29PM +0100, Matthew Auld wrote:
>> After we do the modification on the host side, ensure we write the
>> result back to VRAM and not the other way around, otherwise the
>> modification will be lost if treated like a read.
>>
>> Fixes: 270172f64b11 ("drm/xe: Update xe_ttm_access_memory to use GPU for non-visible access")
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>
>> ---
>>  drivers/gpu/drm/xe/xe_migrate.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>> index 4e2bdf70eb70..2adf95d35c31 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -1848,7 +1848,7 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>>  				err = xe_migrate_access_memory(m, bo,
>>  							       offset & ~XE_CACHELINE_MASK,
>>  							       (void *)ptr,
>> -							       sizeof(bounce), 0);
>> +							       sizeof(bounce), write);

pass by comment... isn't the check for alignment above this snippet also
wrong? This one:

	/* Use bounce buffer for small access and unaligned access */
	if (len & XE_CACHELINE_MASK ||
	    ((uintptr_t)buf | offset) & XE_CACHELINE_MASK) {

We have:

	XE_CACHELINE_MASK == 0x3f

and supposing:

	buf == 0xffffffff1234563f
	offset == 1
	len == XE_CACHELINE_BYTES

this would go through the small/unaligned access, but it's actually
aligned: we are copying XE_CACHELINE_BYTES from 0xffffffff12345640.

I guess we wanted this instead?

	if (len & XE_CACHELINE_MASK ||
	    ((unsigned long)buf + offset) & XE_CACHELINE_MASK)

or even:

	if (!IS_ALIGNED(len, XE_CACHELINE_BYTES) ||
	    !IS_ALIGNED((unsigned long)buf + offset, XE_CACHELINE_BYTES))

Lucas De Marchi

>>  				if (err)
>>  					return err;
>>  			} else {
>> --
>> 2.50.0
>>
