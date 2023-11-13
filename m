Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107FDC4332F
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 15:11:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D143710E380;
	Mon, 13 Nov 2023 15:11:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83AD410E380
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 15:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699888292; x=1731424292;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xhM3f/51i+fdrIKbg3GIw3WVhKJCl5kaS8hVAMxZkWI=;
 b=W2yYOsNvOHLFZrHX1Y6wNYAm+pV9R2RA2MpgQa8geF0+q8Ih93QbVH99
 LA6YHaBG0q8PD3VDkiM5pryEmkNfdwFC92qS+PCJEfe9OQcZUF+bdC4Ts
 efVEDEUmZjrLYvwB0Sg5wjrzuOxj/94DcJxM9nzxBQteU6yq15IpM6XdV
 LcLK1qkIbmGXqotKfWoFOF/WdA9nzxj3hLajUFdQiFQdTJx1Kxfk4B0aH
 3tYGMMdZJu/zA+ExahndCtzzEPOLB3CVhspX/QQvsf9DXawJjawS8BHZl
 rUx2SLDuD54x6jQOBPna1PxQ2f8dva7HdHQZXx8szPqlLHW5k7ivoQkyM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="369787085"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="369787085"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 07:11:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="764355954"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="764355954"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2023 07:11:24 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 07:11:24 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 07:11:23 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 07:11:23 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 07:11:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WUmUk85kAfSAMeVMDLKvFYxe+Rr3PjYtNwLTYYh/dI0SJItZuOlMef59wS6Ex9S+sIOd/hQq+l6Olra8yfzKavJUnj+Te9xGaNAWw5M4Whf3BHeuC27LwQe5c/7YzOBkKTyq9MINDPplrSBV31AolXxFwbDGTU80efVp0SoHOyHanyMwt69+zp9FHsLkxYKiAMNFSTztKSfzb/jJm6854THlPEdcGceyV/6vSz5YFIlmEt9VBteJT3e/HNGCyazQQ1/32Qe4tLB9e3HV3OVCdeWoEzqZAvMGgWlmft20fSAHxfB1viZ4t9u7TwZFexRbEyEiVQV1q44FAGgAPy0fkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9iFyIdmsD2a9OH6du8yYNkD/glRYISo25H883LNNDNY=;
 b=RoAXZqXPReIBZgWqVTSlzGv03+elXN3QE3aA+nBWX+Spatk4rQkHh7/FJbUrZhd5I9PLFwKE81qLw0RumkXaQQ+unOFsg3yv/N7pCQntzy1brUXGAsc3cUenw47KdMmZS0Up6x4efHpnx+8U6rOxpoCfZa2i/NsWZmXZp+WKmGnuQTxswc5cc5KolmK+retRBS8lk9DKCXY0ljU58UpwNmY9ALO0hZByGSPqeVdpmb87NnBu5x5e+D+CY6XB4NwgvH8/981TRylMU3oFgjJLXXY79B5fTxVBtBw7alpD9dpk+bjSlgBW2XfvkiUS2k+UAjMaiCbz6RCUzmgM+NJr0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6473.namprd11.prod.outlook.com (2603:10b6:510:1f3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 15:11:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c%4]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 15:11:20 +0000
Date: Mon, 13 Nov 2023 09:11:18 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <ok4vdcfjzkc4p6u7tl7udsgcthjekmmgslksgusfnctkbf6ony@ymq7ernydwx6>
References: <20231108003344.1169016-1-michal.winiarski@intel.com>
 <20231108003344.1169016-12-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231108003344.1169016-12-michal.winiarski@intel.com>
X-ClientProxiedBy: BYAPR21CA0006.namprd21.prod.outlook.com
 (2603:10b6:a03:114::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6473:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f6b644b-e824-4c10-947b-08dbe45acac3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r1IX8SbA2b9FYwNIwRk5nsCOg1f7bPNrEbZZHJRN6tpFnr+5DxO26U1I9Ojfq7e7WiVU7mZCRgE4/dYsbxqXM37k1LIu4SA2Z0WnFYw1FJcXhFMCtXeZgueHbbH9Q7YqB8ulDIjj1g4FzyA2IUQeCuygj/gP9UGyCd67LPkdj/fK5/bJNnGtQbtw+DiDJ8pDbtFTkjBqBpNax+OzgnwZ+odCIwwMhmp/hQSMOLsHdmT/3mPNfbYqE4egshwn8aDPcrA3EWdUfeuDfc37Ix9Lijh0fAVwTSaItZjVsMov7I7c8QcTjuBlsMWuPq6gst58LDxdaccRk6Mm91yf6iNUs0oV2/aaNObJHVT5K8TYIK7uultMpkrL1LrvYoJvSAL1I2pcNSuFUz3uBrWup0zbBsJPVaZ+Qo5oA9FqoNR0lAFxHGvhMbgue1n5JHNJkZSxPdUQgG5ZOrlWgMVNaawebNezb5XKrtQIxbj8OCkpfTl4JEpXKrNURZeH+z1SoAcg93rw0F3t/2XXwaZLfBxGWNw3vlkkR+Js4jIVjQaQAj2IrinkadYHSSNmofwq0Eal
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(376002)(366004)(396003)(39850400004)(346002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(26005)(6506007)(33716001)(6512007)(9686003)(83380400001)(4326008)(5660300002)(8936002)(8676002)(6862004)(2906002)(41300700001)(6486002)(478600001)(6636002)(316002)(66946007)(66476007)(66556008)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWNZcFUyNVB2MnVCb2ltN2YvTWdlQ29oeGFweVBlQ1RGTmp3M1FVd2dRTEhO?=
 =?utf-8?B?cGNQYkc4TUxKNzJYa1BUSXFOeFFRMVowdGdBSTU5Y2JKdCs1L3BvWU54YnVE?=
 =?utf-8?B?MXVwMCthcUZXcDhuS2wzVTNWNjBNMy9YcXNIMjFUazc5TE9iRTRLeWhaeFVo?=
 =?utf-8?B?cENWTFJZdjhyMFkrNzA1UFl1bWxrOW5oeUlwK2FPRVZ1TWpEdlUzZG1JMWZH?=
 =?utf-8?B?WitpOXFJMXhlSENJM0RhdDFDZndGSnhlL2lCYjFWaGtIYUV1aitCRm1IMHRX?=
 =?utf-8?B?M0hhNmNrVkdDOFhtdDk0TzRuRXdoTGhwOTZsR2VXa2VUY3RUUjVFOUFGL0JY?=
 =?utf-8?B?YzdQelI4L3dZZVNhd3ZRb2w2YUFSdFJXajlFMXZQaVZOQ1FLZTZYZXBUSHh6?=
 =?utf-8?B?aEZlUWJWNTIvMWszTkxUcmZIR2VEOGxaN052SndyMjJhREg5WHVleFFlSlda?=
 =?utf-8?B?K3plRnFBNnV3Y1Z6TkNtZ2lydkZyY0dDQmRCNUNBM3NsUmJhTzJZaXplUVY4?=
 =?utf-8?B?dG0wSUljdEl4cEVCSjJvYlc0eERLWWpFUUJhd0grdEplN3pZS1RuMzc4NUx4?=
 =?utf-8?B?VjNLMm9wcngwVDM3Nk9ZUkM5UTBxajhDVXNjaGpxSndRK1lMRjV1N2xHb1cz?=
 =?utf-8?B?UU8zUnVydUpiMmt1V0RYTjdCKzlLdjFQYzI3a0JtUjEvNFRXSnVuWXpNV2xQ?=
 =?utf-8?B?YkpyTzdVL3R2WDhJOThKNG1xYzRtczY3MkRERE5TWmlRL2Y1VjNmL1lkSm51?=
 =?utf-8?B?aFhvTUdZNW5JRnlZNHZidFdRZDdoRXh5NndTWFVmUDlpdjZjTGVKdVVGQlp2?=
 =?utf-8?B?OUpxbDNzN2VURFlUWW4wcEQ4bmFGZGxQOU04WXlSV3pteHprTTh3RlVDaHNV?=
 =?utf-8?B?VXJYTjk3Y3ZFcFZYeExsMmZqZGtvUkVsWEZCbnlSUEV4UnNyT0loRS91Qzll?=
 =?utf-8?B?WFFNTk9zNXBIZG1yR0JETGF6bmIzRHFjN0tiV3Z0WDJzdEdKOXpqL0FocGVW?=
 =?utf-8?B?dGFIQ2xYamxiemdpS01SenZoYnpkLzNzeTk3ZGZKQ3pSeTBsOGdGMmJIVTZR?=
 =?utf-8?B?RGEvcHdMV3k3Um02d0dVMS81a1dCRWo3Tkd4dGlIY0JiWmhISDA4ZHIzbXEz?=
 =?utf-8?B?K3RqSitRcG9VOEJidmFSSC9RemNWWGo3QU1TWnBxVmRKamM2c3dSWnZhcU9o?=
 =?utf-8?B?ZEppazdzK21DT0x6UjJXcGQwWUU3Q3BKd01QbThJc0pDVGhyczZnbEZZZGtN?=
 =?utf-8?B?QU40NXd0WkVrN1hJejVFY3hqWkhSYmZWZFpOc0JvdWlacmhaTkQ3WHJiaGhR?=
 =?utf-8?B?SUsrNVA4NS9tenMxYno2bHJYZ0VDcHJSTlIyWk5kelJOTXZrY0JHU2tvZ0JV?=
 =?utf-8?B?TkpDSURrcno1TW9pZHdqcWxLazVFWnQ4MUl2dytDb0NSVEgrbUZzbnhpYTBt?=
 =?utf-8?B?dGd1aFJ2S0MyRDAxRXJzekR3cVhzaXFoblNTRXhCakpqazJzRmhVVEw0K09W?=
 =?utf-8?B?bFFRR1BlWmJPbGNNdkpJZk94SmZraDAvOHJYMXhPMStTcVk3OXBLYTFOZ3Jq?=
 =?utf-8?B?bmF4UU5PQlpPbjUwUUJwZ3JkUmErdFpTM0QyYVJQeWVoNWd3ZnNLWE44ejNl?=
 =?utf-8?B?ZkxEYlpacjVxVVQ0U045UEc2RFdtVk9OOURJSlREcFJvbzIyL2hsQ0VNMXVq?=
 =?utf-8?B?ekZtRFJWeDdpWmQxdkdOanhWaE9Ka2duWnlyanMyK21zcCtkQ1dkUk5qVEpa?=
 =?utf-8?B?Qml3NExFc0xjTys0Q1dBdW50QzFnR0dwNVdJOU41Vzg2NFpRdGo4K2o5dmI2?=
 =?utf-8?B?MXhYMUtzb2RlYU9OTTJqSjhvZkh5clBkNEFMSkNBTFlLTWs0R1BjdTh2ZWxE?=
 =?utf-8?B?ZkNYSkpjNlZrbmxtMnY4VjVkVUoyTkQ5VkRGWExwZldBNXZwWU05aHgxSEVS?=
 =?utf-8?B?UnZ0d1BIU3JuOFZQdW1SRXlSRnRsL3dxcFNObDJtbTg4VjNoNTZXQTI5OEtP?=
 =?utf-8?B?YUNheXpuL0NVLzFKaHpES2JPUzJqenpQaFM4ZWZqeFk1cldvUU52djFoazl5?=
 =?utf-8?B?eTQ1b0dNVUlXSGpydk45SW5CQXExcUR6TUtQYlk1Mkdjdk45Q2F2Wk9TNWZs?=
 =?utf-8?B?bTZhYkhKNEZhRjRxcnE4WE5qVDNieEJjaFlYRlo5KzFhQXI3TlRJa1lBdk40?=
 =?utf-8?B?ZEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f6b644b-e824-4c10-947b-08dbe45acac3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 15:11:20.5682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dp8YiBU/xXDJ7EDWAcucIbaiP8OPqOGGfIbibX5Dq20rZD5FYo+8n715ybiRnjF0Qinw4l/6fmJY7jq++sunyXMyuCzd5B4leyYBkXbTeMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6473
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 11/12] drm/xe/device: Introduce
 xe_device_probe_early
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

On Wed, Nov 08, 2023 at 01:33:43AM +0100, Michał Winiarski wrote:
>SR-IOV VF doesn't have access to MMIO registers used to determine
>graphics/media ID. It can however communicate with GuC.
>Introduce xe_device_probe_early, which will eventually initialize enough
>hardware to allow the driver to communicate with GuC early during probe.
>This will allow both VF and PF/native driver to have unified probe
>ordering.
>Initialize root tile MMIO and TTM sys mgr early, as both are needed to
>communicate with GuC firmware earlier during probe.
>
>Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
>---
> drivers/gpu/drm/xe/tests/xe_pci.c |  1 +
> drivers/gpu/drm/xe/xe_device.c    | 21 +++++++++++++++------
> drivers/gpu/drm/xe/xe_device.h    |  5 +++++
> drivers/gpu/drm/xe/xe_mmio.c      | 17 +++++++++--------
> drivers/gpu/drm/xe/xe_mmio.h      |  1 +
> drivers/gpu/drm/xe/xe_pci.c       | 26 +++++++++++++++++++++-----
> 6 files changed, 52 insertions(+), 19 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
>index a40879da2fbe1..733df9a270db2 100644
>--- a/drivers/gpu/drm/xe/tests/xe_pci.c
>+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>@@ -143,6 +143,7 @@ int xe_pci_fake_device_init(struct xe_device *xe, enum xe_platform platform,
> 		return -ENODEV;
>
> done:
>+	xe_info_init_early(xe, desc, subplatform_desc);
> 	xe_info_init(xe, desc, subplatform_desc);
>
> 	return 0;
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 696f997bd2c93..19faddb779808 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -364,6 +364,21 @@ static int xe_set_dma_info(struct xe_device *xe)
> 	return err;
> }
>

The _early variants have different meaning all throughout this patch
series.  Keep that consistent in future will be challenge if we don't
document what the split is between the _early (which used to be sw-only
part) and the normal init/probe.

Please add a comment on top of each _early() variant you add with the
split of what should be there and what should rather be in the "normal"
init.

Lucas De Marchi

>+int xe_device_probe_early(struct xe_device *xe)
>+{
>+	int err;
>+
>+	err = xe_mmio_init(xe);
>+	if (err)
>+		return err;
>+
>+	xe_mmio_root_tile_init(xe);
>+
>+	xe_ttm_sys_mgr_init(xe);
>+
>+	return 0;
>+}
>+
> int xe_device_probe(struct xe_device *xe)
> {
> 	struct xe_tile *tile;
>@@ -382,10 +397,6 @@ int xe_device_probe(struct xe_device *xe)
> 	if (err)
> 		return err;
>
>-	err = xe_mmio_init(xe);
>-	if (err)
>-		return err;
>-
> 	xe_mmio_probe_tiles(xe);
>
> 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
>@@ -418,8 +429,6 @@ int xe_device_probe(struct xe_device *xe)
> 	if (err)
> 		goto err_irq_shutdown;
>
>-	xe_ttm_sys_mgr_init(xe);
>-
> 	for_each_tile(tile, xe, id) {
> 		err = xe_tile_init_noalloc(tile);
> 		if (err)
>diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>index ee89af6b1ea9c..5d7fd16f545c6 100644
>--- a/drivers/gpu/drm/xe/xe_device.h
>+++ b/drivers/gpu/drm/xe/xe_device.h
>@@ -37,6 +37,7 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
>
> struct xe_device *xe_device_create(struct pci_dev *pdev,
> 				   const struct pci_device_id *ent);
>+int xe_device_probe_early(struct xe_device *xe);
> int xe_device_probe(struct xe_device *xe);
> void xe_device_remove(struct xe_device *xe);
>
>@@ -122,6 +123,10 @@ static inline bool xe_device_uc_enabled(struct xe_device *xe)
> 	for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__)++) \
> 		for_each_if((tile__) = &(xe__)->tiles[(id__)])
>
>+#define for_each_remote_tile(tile__, xe__, id__) \
>+	for ((id__) = 1; (id__) < (xe__)->info.tile_count; (id__)++) \
>+		for_each_if((tile__) = &(xe__)->tiles[(id__)])
>+
> /*
>  * FIXME: This only works for now since multi-tile and standalone media
>  * happen to be mutually exclusive.  Future platforms may change this...
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index 8945c601e1c54..526a6ac6be56a 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -15,10 +15,12 @@
> #include "regs/xe_regs.h"
> #include "xe_bo.h"
> #include "xe_device.h"
>+#include "xe_ggtt.h"
> #include "xe_gt.h"
> #include "xe_gt_mcr.h"
> #include "xe_macros.h"
> #include "xe_module.h"
>+#include "xe_tile.h"
>
> #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
> #define TILE_COUNT		REG_GENMASK(15, 8)
>@@ -369,10 +371,8 @@ static void mmio_fini(struct drm_device *drm, void *arg)
>
> int xe_mmio_init(struct xe_device *xe)
> {
>-	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> 	const int mmio_bar = 0;
>-	int err;
>
> 	/*
> 	 * Map the entire BAR.
>@@ -386,15 +386,16 @@ int xe_mmio_init(struct xe_device *xe)
> 		return -EIO;
> 	}
>
>-	err = drmm_add_action_or_reset(&xe->drm, mmio_fini, xe);
>-	if (err)
>-		return err;
>+	return drmm_add_action_or_reset(&xe->drm, mmio_fini, xe);
>+}
>+
>+void xe_mmio_root_tile_init(struct xe_device *xe)
>+{
>+	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>
> 	/* Setup first tile; other tiles (if present) will be setup later. */
>-	root_tile->mmio.size = xe->mmio.size;
>+	root_tile->mmio.size = SZ_16M;
> 	root_tile->mmio.regs = xe->mmio.regs;
>-
>-	return 0;
> }
>
> /**
>diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>index 9f1a25cfd2cf0..894a792ac8abe 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.h
>+++ b/drivers/gpu/drm/xe/xe_mmio.h
>@@ -21,6 +21,7 @@ struct xe_device;
> #define GEN12_LMEM_BAR		2
>
> int xe_mmio_init(struct xe_device *xe);
>+void xe_mmio_root_tile_init(struct xe_device *xe);
> void xe_mmio_probe_tiles(struct xe_device *xe);
>
> static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 87c45c6e08aec..2f04f07dc17a4 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -532,10 +532,12 @@ static void handle_gmdid(struct xe_device *xe,
> 	}
> }
>
>-static void xe_info_init_early(struct xe_device *xe,
>-			       const struct xe_device_desc *desc,
>-			       const struct xe_subplatform_desc *subplatform_desc)
>+static int xe_info_init_early(struct xe_device *xe,
>+			      const struct xe_device_desc *desc,
>+			      const struct xe_subplatform_desc *subplatform_desc)
> {
>+	int err;
>+
> 	xe->info.platform = desc->platform;
> 	xe->info.subplatform = subplatform_desc ?
> 		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
>@@ -549,6 +551,12 @@ static void xe_info_init_early(struct xe_device *xe,
> 	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
> 				  enable_display &&
> 				  desc->has_display;
>+
>+	err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
>+	if (err)
>+		return err;
>+
>+	return 0;
> }
>
> static int xe_info_init(struct xe_device *xe,
>@@ -611,13 +619,15 @@ static int xe_info_init(struct xe_device *xe,
> 	 */
> 	xe->info.tile_count = 1 + graphics_desc->max_remote_tiles;
>
>-	for_each_tile(tile, xe, id) {
>+	for_each_remote_tile(tile, xe, id) {
> 		int err;
>
> 		err = xe_tile_init_early(tile, xe, id);
> 		if (err)
> 			return err;
>+	}
>
>+	for_each_tile(tile, xe, id) {
> 		gt = tile->primary_gt;
> 		gt->info.id = xe->info.gt_count++;
> 		gt->info.type = XE_GT_TYPE_MAIN;
>@@ -717,7 +727,13 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> 	pci_set_master(pdev);
> 	devm_add_action(&pdev->dev, xe_pci_clear_master, pdev);
>
>-	xe_info_init_early(xe, desc, subplatform_desc);
>+	err = xe_info_init_early(xe, desc, subplatform_desc);
>+	if (err)
>+		return err;
>+
>+	err = xe_device_probe_early(xe);
>+	if (err)
>+		return err;
>
> 	err = xe_info_init(xe, desc, subplatform_desc);
> 	if (err)
>-- 
>2.42.0
>
