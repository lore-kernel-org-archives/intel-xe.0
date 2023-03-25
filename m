Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDFFC6FD1C
	for <intel-xe@archiver.kernel.org>; Sat, 25 Mar 2023 23:32:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A01910E0B6;
	Sat, 25 Mar 2023 23:32:54 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18CB110E0B6
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Mar 2023 23:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679787172; x=1711323172;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UsPCDE1STBwVRpRq4RLF2n8HwKRvzIg5ZJdBLTa/sfQ=;
 b=JeD5oFVeD4+XCE6s/sfyhNFxyDaG9aKGt1tT/B5ow47jWqwiPLaGgsUH
 y+vKDuKhpnBjq2l21dcIT+ycwNn4wJ4n8qY1Gw4gzMBbfId6Mr/LeY9C7
 oHvfuHWTi1glpM4hveOUVvl/1lLCKB/nhEjm+wm9U5jHuEuZlpXARbzdb
 5LennZdHBeLZtEf68PEYseqtBOO3o2DkjsRW0W1BSkhH/blSocfbrhF1j
 X97lxhs0Gkaua10d/iIAHWOS+flmOkdguOd2znFXqxmKXDsIFeulu/WfH
 BAf4WwpJPtAIf3u5S9lGfwhABI7iIzWgZAETzihHBO+iBzp9wA8RIojhV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="337528816"
X-IronPort-AV: E=Sophos;i="5.98,291,1673942400"; d="scan'208";a="337528816"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2023 16:32:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="1012663814"
X-IronPort-AV: E=Sophos;i="5.98,291,1673942400"; d="scan'208";a="1012663814"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 25 Mar 2023 16:32:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sat, 25 Mar 2023 16:32:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Sat, 25 Mar 2023 16:32:50 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Sat, 25 Mar 2023 16:32:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HfQKiWMBSLi2yoRp54AJzeRCA5jl3QZoXpoSWqFK6vGq864uFpN4CwlIj0nUEaDxqgfU4PYQFQzoJrLFb/VgMRKWriAdFkPalR5/m2cL8ssaQON6yKsojehrPAfvKQpEMSwwNOG3uSbgklqRRfEC056gv+XUA4NFsLtS2qNCq//iOdbWTKMI/XOWcgei8IZ3tBIYbeGQl5u05bmB+q9hvVTkiCfqi5JdXWSjLB97JZaAE1Ok8NhJye1DP9HI6Xc6HgnpoDS2iZ59JutLmVY6FXqOv1y7vspB8e7jCwggmvDEnQWEkgQJB0vh+ZTCT+bQznbyTU0JmxsDrZLW2o3HDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QOvCM96RemD5fJ44V0If4tQXosiExQ41VubOR8yGIwE=;
 b=PBijEPvRDNXY/lYmkcDjasQJvW2NPnDOdFQPZZfJPWxzYdTz84eJ7Vhjkaxm6xDJV9eLRybNIqmim+flV73KorRZH4dKBKComTJF+aYZwt/9Bg5KKZqVQNptWbBLiW+qNSZP+Tftk5KAMSZf5qKjG1lVGzrPI0n099OPDbRCmn2b0VBmj6eOpDHmHxT2BGzOWeWYyLzw27Z+ll0L/Dng4bX8ShzXy3WtxXhuTS59j0mtu5tR7JVUTr5Ap5bkP1uhpkLppaRSeB1u8ezDFp0DKgG+QEkhvZV3+o0D3QuBmXhhOOI5bLWrGjFyyOnRGxj4qqHBdajamxl6s/34PiuUuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7539.namprd11.prod.outlook.com (2603:10b6:806:343::6)
 by DM4PR11MB6018.namprd11.prod.outlook.com (2603:10b6:8:5e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Sat, 25 Mar
 2023 23:32:49 +0000
Received: from SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::d94d:4bb6:a568:a2bc]) by SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::d94d:4bb6:a568:a2bc%3]) with mapi id 15.20.6178.041; Sat, 25 Mar 2023
 23:32:48 +0000
Message-ID: <89f30c14-460f-c079-cecf-624e422b6475@intel.com>
Date: Sun, 26 Mar 2023 01:30:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230323115926.391900-1-matthew.auld@intel.com>
 <20230323115926.391900-5-matthew.auld@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20230323115926.391900-5-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0017.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::7) To SN7PR11MB7539.namprd11.prod.outlook.com
 (2603:10b6:806:343::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7539:EE_|DM4PR11MB6018:EE_
X-MS-Office365-Filtering-Correlation-Id: 945a8ca7-2a5d-47ce-efd4-08db2d893dda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VS19eGv/X62m6a6uJTQ/VBysZ4nkduCBY++80grBh9Uijw4mC7mQpaMHbbGWH171428RssZOShRw6NLeHt8TNuedcfZeE+gvkitaluXRP8flJ4A5zZ0yLJ0oUMHSgf4PVPPZPvELNbkOPW1rqPHfCMD79p8wR+cN+qeX5OYhze5JiFizHlJQB/iG8LqD/036Nh8GQYgO2c6cJ1lyzts9zksigH2rFUk1AlzXI9gTD8WSUkJsmKRmLQkgIjEloRMggSVMTqMYb6+aqCp/XpVgho8r/o5bpp5miaQQqfbdFzBbAhbtIESnOKK4KpQaAQVcOazeTUYNg6evn6YF6rERlbLTEfRoj2Hg5olYlRTUQ4hA4wgAhdCwmo9SsajHkV5gT92blZ7UrAFbXORfwWX4i7V0pC4KHd2izONfCBE6+F1K8NyNYWCOHhAVYf2w4QoiJqnzQTLe4k/CaISKesyfIGX+xy9Ti7y9XNx9oHmx3cYmrDJHViNBktRYFCte3rww2IFi6Nbi1F624IL36AlCbSrP2/xiZDnPSOw9QXratKaKgFwW8cmTAS7eTMoPj4ZKPz8kQq8qFXjCDgLhGHNNGVz3YHnajtk1XGr+PJYtAQF0MJxssw4GxlsBNdBSkdd3GHK0WuD1uxnAD4R0YJ3OyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7539.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199021)(5660300002)(36756003)(6512007)(6506007)(8936002)(2616005)(478600001)(54906003)(316002)(31696002)(38100700002)(26005)(6666004)(86362001)(53546011)(186003)(82960400001)(66946007)(8676002)(66556008)(66574015)(4326008)(66476007)(41300700001)(83380400001)(2906002)(66899021)(31686004)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGdaZCtXdWo5b3ovN29OZzgyclBZYTZyWDE1VUtYTFE1TWtxMVFCcTJmRTFM?=
 =?utf-8?B?VU43YU5zVFg1VlRLTzJ2VllIcXM5UFVwNmIxcDNmU1RHL2JReW80aitOT3ho?=
 =?utf-8?B?b0t1N3JOdWFUL1AxOW93dWV3VElmZC9pd2c5MjFHWmpidDNNbGh2SDBzRDc0?=
 =?utf-8?B?VUJ4R29malZ5aWJBUkdNWk1oKzlxazI2RlUyVHVMVG1qREJidVlDS21SQ1ZM?=
 =?utf-8?B?SUl4YkgwWDREZ0FTRHNpTlMxZ09DZ3JWNlNzV2ROS1dXUE8xTE5vbCtKcEpV?=
 =?utf-8?B?ZEZydFM1bDRaZFc1eU1Wc3BNSWM3S3JNbmdHWUgxdEVYYTh3M3FHZVJDaVFN?=
 =?utf-8?B?N3U2NTBNSnhMMmhPakx1NWlYNHBWZG1TalZTS2Q5RnhTNEFFcXcwRVh6d0Ri?=
 =?utf-8?B?UFhES1NYcUZPUC9pbTJoVVJpV3FzZzh1c3ZscmM3end5aERFc1pYZmFvcmFH?=
 =?utf-8?B?Ni9hSlpqRHdHRWRQZ2lyZ3d1WUxZc3hrdG5NUXhJVXpsUCtLaFhQK2h5RURl?=
 =?utf-8?B?NWc5djJhUUxHQ2wvcjVINkdSUFFHL1V6c21haWNEUDJsQVRVWGF3aEFFUE56?=
 =?utf-8?B?TmZtYU9SSGlyd2JQWHhERHJTRHNON2RZZ3l1R09UNTVnd3NEZlN2SnM5aUlR?=
 =?utf-8?B?WFd5KzdZVGJ0alpZYUl4enJNNmdRZjYrUEJRMzUrWEh1dGVBVFlXNXIyVFhH?=
 =?utf-8?B?b3RpeGxRcVI0a0liejdMWWtocVhJYVBSWSsrNHJ1ZjFsUVdjcFpzd21KdUhM?=
 =?utf-8?B?bm1Ucm1PcENnckQvMlVZYnF0UUhXcFBoSyswcXdVVkt6ci9wTDdKTW5DVTl5?=
 =?utf-8?B?M1pNVTB4QWlMUjMrOUFFaG9CUEM5RHVXVEtoaTVyQS95NzJqaUpvNHFRamRw?=
 =?utf-8?B?b0V3T3ZPMFVDMUVZTEkvU2cxOWF3emk0a0xUSUhyM0x0QzRFTi9MR0hjUzJS?=
 =?utf-8?B?RDJEd1VJa0toMDlWMmpXUjZTTkgwR2txNmJkSng0VUtvRG9BWFZNdFZ5bGVo?=
 =?utf-8?B?c3hwRDU0RHh2cUt2L0l6VWZGbnkzOXVyZzcyTlVwRzhTcHo5QnlndGx5TitX?=
 =?utf-8?B?T09RMXMvZG5sb2Vib2ZxUmtPbUtkS3lyNWVvV0tBaE1oOUM0UWREVEFFOW0z?=
 =?utf-8?B?cjhranVFb3lLaE9QREtwa1lOM092dEtuMDdsd3g2YlVBYi9vdE4rYTd1ekNh?=
 =?utf-8?B?SkhidUlhaXpBWlB6YktGTkdlOCtiaDR1NXh0VjR5SThKTXArUEJBMyt0aWtL?=
 =?utf-8?B?TllXY3NuU1NnMFh1RC94R1kyZG9JbjNVWlZYZWhYMnZ5Y2NwSXhRRklibHNh?=
 =?utf-8?B?Wnl1UkUzQmt0MU95OHdLUzhRYXZaMEhoYjEvWGJLLzhXQUxqdWxkQ2o1Z0g2?=
 =?utf-8?B?N2dNQm1LeGd5b1lGTmZyZzhaejdHRVVMQWxteFZoSHhsRnlsYjZVMUp0WWdO?=
 =?utf-8?B?M3JZcU5YUWlKeU5KQW1YazdJYVVSWGphcXdtUTE2cGJSQTJxa3k5RVlLR05D?=
 =?utf-8?B?c2s0ZnhTamhqdkJWb2ZJTFpPcVZWTzRqMWtBaTVkOUVQbnFyTFpNOWtDNE14?=
 =?utf-8?B?ZU40RHovUnUxbms3WTVPMndHNU5oUXBSbjY1UXkramhINnJmRnJxQWlMQUU3?=
 =?utf-8?B?aFVURE1lUVJmUXpITzBJZFBPQ1ZpN0p0bzY1cExna2lQdUVFZnpNajRGUnB0?=
 =?utf-8?B?Zm40c2FyZG5WOHkrcytwWGgvNXh5bllHaVRSdzdubXNwUThkajQwbWUvNU4v?=
 =?utf-8?B?QUxtL3ZwS3JjYzhrTW8waUxzVDYrK2diaTZtWG41NFpFQXJVclBxQUxjaE9w?=
 =?utf-8?B?Ty81MDBJTzdpaFhJVHlXN3lhS1FQRGZPSFVOQmJyKzlYRlErY1poTjlRdWVP?=
 =?utf-8?B?d2dldVluRktaUWFaUzFCNUZzYnl2SWhSWDRoY1JINS9hQllxZHRnU3ozVW9K?=
 =?utf-8?B?bWVHdnVRS0EwOEQ1VmdEWFc3NWRLTytHNFdZc2l2ZlZZUFhzbkIvRjUzazFm?=
 =?utf-8?B?WElabXVHNHpCZmxPUDYxQlZWVzBaN0MraWQzQXdLd0dOQjJxY014c2dYdUZX?=
 =?utf-8?B?R0JmeDZPQVNsRjhKV1pNQXM0ZzcwSFFxUC9UQlliOUVYNC90NzN0VzlKR2c3?=
 =?utf-8?B?ZGg4QmhRVkx1c05nendFSWV1MEJ3QjFtQVpJVGhRNnQramlDVUlTc3U2cG10?=
 =?utf-8?B?R1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 945a8ca7-2a5d-47ce-efd4-08db2d893dda
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7539.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2023 23:32:47.9584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OhSjhE/QzLHE4j0oaCA/XgE2F9Jc6GsjJK7LlHRylE21BgRQQMELgtraR/25OCL47CSAccSEyj+vq7m6l1Mh533ODINBUSjqnzBz8tMKdTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6018
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 4/6] drm/xe/bo: support tiered vram
 allocation for small-bar
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

looks good to me.

Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

On 3/23/23 1:59 PM, Matthew Auld wrote:
> Add the new flag XE_BO_NEEDS_CPU_ACCESS, to force allocating in the
> mappable part of vram. If no flag is specified we do a topdown
> allocation, to limit the chances of stealing the precious mappable part,
> if we don't need it. If this is a full-bar system, then this all gets
> nooped.
> 
> For kernel users, it looks like xe_bo_create_pin_map() is the central
> place which users should call if they want CPU access to the object, so
> add the flag there.
> 
> We still need to plumb this through for userspace allocations. Also it
> looks like page-tables are using pin_map(), which is less than ideal. If
> we can already use the GPU to do page-table management, then maybe we
> should just force that for small-bar.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_migrate.c |  3 +-
>   drivers/gpu/drm/xe/xe_bo.c            | 48 +++++++++++++++++++--------
>   drivers/gpu/drm/xe/xe_bo.h            |  1 +
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c  |  4 +++
>   4 files changed, 41 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index 17829f878757..de101c3a6406 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -108,7 +108,8 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
>   	struct xe_bo *sysmem = xe_bo_create_locked(xe, m->gt, NULL,
>   						   bo->size,
>   						   ttm_bo_type_kernel,
> -						   XE_BO_CREATE_SYSTEM_BIT);
> +						   XE_BO_CREATE_SYSTEM_BIT |
> +						   XE_BO_NEEDS_CPU_ACCESS);
>   	if (IS_ERR(sysmem)) {
>   		KUNIT_FAIL(test, "Failed to allocate sysmem bo for %s: %li\n",
>   			   str, PTR_ERR(sysmem));
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 1c8e0fbaf1df..de57ccc5b57c 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -96,20 +96,29 @@ static void try_add_system(struct xe_bo *bo, struct ttm_place *places,
>   static void add_vram(struct xe_device *xe, struct xe_bo *bo,
>   		     struct ttm_place *places, u32 bo_flags, u32 mem_type, u32 *c)
>   {
> +	struct ttm_place place = { .mem_type = mem_type };
>   	struct xe_gt *gt = mem_type_to_gt(xe, mem_type);
> +	u64 io_size = gt->mem.vram.io_size;
>   
>   	XE_BUG_ON(!gt->mem.vram.size);
>   
> -	places[*c] = (struct ttm_place) {
> -		.mem_type = mem_type,
> -		/*
> -		 * For eviction / restore on suspend / resume objects
> -		 * pinned in VRAM must be contiguous
> -		 */
> -		.flags = bo_flags & (XE_BO_CREATE_PINNED_BIT |
> -				     XE_BO_CREATE_GGTT_BIT) ?
> -			TTM_PL_FLAG_CONTIGUOUS : 0,
> -	};
> +	/*
> +	 * For eviction / restore on suspend / resume objects
> +	 * pinned in VRAM must be contiguous
> +	 */
> +	if (bo_flags & (XE_BO_CREATE_PINNED_BIT |
> +			XE_BO_CREATE_GGTT_BIT))
> +		place.flags |= TTM_PL_FLAG_CONTIGUOUS;
> +
> +	if (io_size < gt->mem.vram.size) {
> +		if (bo_flags & XE_BO_NEEDS_CPU_ACCESS) {
> +			place.fpfn = 0;
> +			place.lpfn = io_size >> PAGE_SHIFT;
> +		} else {
> +			place.flags |= TTM_PL_FLAG_TOPDOWN;
> +		}
> +	}
> +	places[*c] = place;
>   	*c += 1;
>   
>   	if (bo->props.preferred_mem_type == XE_BO_PROPS_INVALID)
> @@ -343,15 +352,22 @@ static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
>   				 struct ttm_resource *mem)
>   {
>   	struct xe_device *xe = ttm_to_xe_device(bdev);
> -	struct xe_gt *gt;
>   
>   	switch (mem->mem_type) {
>   	case XE_PL_SYSTEM:
>   	case XE_PL_TT:
>   		return 0;
>   	case XE_PL_VRAM0:
> -	case XE_PL_VRAM1:
> +	case XE_PL_VRAM1: {
> +		struct xe_ttm_vram_mgr_resource *vres =
> +			to_xe_ttm_vram_mgr_resource(mem);
> +		struct xe_gt *gt;
> +
> +		if (vres->used_visible_size < mem->size)
> +			return -EINVAL;
> +
>   		gt = mem_type_to_gt(xe, mem->mem_type);
> +
>   		mem->bus.offset = mem->start << PAGE_SHIFT;
>   
>   		if (gt->mem.vram.mapping &&
> @@ -366,7 +382,7 @@ static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
>   		mem->bus.caching = ttm_write_combined;
>   #endif
>   		return 0;
> -	case XE_PL_STOLEN:
> +	} case XE_PL_STOLEN:
>   		return xe_ttm_stolen_io_mem_reserve(xe, mem);
>   	default:
>   		return -EINVAL;
> @@ -1144,7 +1160,8 @@ struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_gt *gt,
>   	    xe_ttm_stolen_cpu_access_needs_ggtt(xe))
>   		flags |= XE_BO_CREATE_GGTT_BIT;
>   
> -	bo = xe_bo_create_locked_range(xe, gt, vm, size, start, end, type, flags);
> +	bo = xe_bo_create_locked_range(xe, gt, vm, size, start, end, type,
> +				       flags | XE_BO_NEEDS_CPU_ACCESS);
>   	if (IS_ERR(bo))
>   		return bo;
>   
> @@ -1442,6 +1459,9 @@ int xe_bo_vmap(struct xe_bo *bo)
>   
>   	xe_bo_assert_held(bo);
>   
> +	if (!(bo->flags & XE_BO_NEEDS_CPU_ACCESS))
> +		return -EINVAL;
> +
>   	if (!iosys_map_is_null(&bo->vmap))
>   		return 0;
>   
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 3c3a09f47fb4..24c45bfa998f 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -30,6 +30,7 @@
>   #define XE_BO_DEFER_BACKING		BIT(8)
>   #define XE_BO_SCANOUT_BIT		BIT(9)
>   #define XE_BO_FIXED_PLACEMENT_BIT	BIT(10)
> +#define XE_BO_NEEDS_CPU_ACCESS		BIT(11)
>   /* this one is trigger internally only */
>   #define XE_BO_INTERNAL_TEST		BIT(30)
>   #define XE_BO_INTERNAL_64K		BIT(31)
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 73836b9b7fed..cf081e4aedf6 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -373,12 +373,16 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
>   			      enum dma_data_direction dir,
>   			      struct sg_table **sgt)
>   {
> +	struct xe_ttm_vram_mgr_resource *vres = to_xe_ttm_vram_mgr_resource(res);
>   	struct xe_gt *gt = xe_device_get_gt(xe, res->mem_type - XE_PL_VRAM0);
>   	struct xe_res_cursor cursor;
>   	struct scatterlist *sg;
>   	int num_entries = 0;
>   	int i, r;
>   
> +	if (vres->used_visible_size < res->size)
> +		return -EOPNOTSUPP;
> +
>   	*sgt = kmalloc(sizeof(**sgt), GFP_KERNEL);
>   	if (!*sgt)
>   		return -ENOMEM;
