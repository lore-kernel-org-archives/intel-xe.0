Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DEA8C636D4
	for <intel-xe@archiver.kernel.org>; Tue, 31 Jan 2023 19:21:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 568B010E389;
	Tue, 31 Jan 2023 19:21:07 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8816110E389
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Jan 2023 19:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675192865; x=1706728865;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5dV85NWvOWqzE5q2bsCjOCq/pmIMxKUYGKv00izwfW8=;
 b=BaoH+1yuueBwA+8ciIkC+GdV5eNqemImH3i9UF0BcEBxQ2pUAT7SEI9I
 /A3YOfviffWrRiimHi/taphD3wPPrpq+xU7ju9uO8FGkPaoyJmXUweoRZ
 KyzuLLPFJI0S4tLkIcW4yjGJw1Iw72JSDiJlUzi8uSrGKbe5MNaZxVjES
 i3Eno2j+CjOquG7e0+IxpSA2OP4EBCURi2L7gL2L77l4hzgA4ypUIji41
 v3cP8yoRfVoeeR9OV10OB3N5zMtuEgtbAYSQolYH/y4J4wwRCjFJT4NAS
 znNLb6qe52SjRYgXPTI7UrVCb8AK7KLUdr+PugyZBCXxPuiqW75/SXdy9 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="308276667"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="308276667"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 11:21:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="658011577"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="658011577"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 31 Jan 2023 11:21:04 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 31 Jan 2023 11:21:04 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 31 Jan 2023 11:21:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 31 Jan 2023 11:21:03 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 31 Jan 2023 11:21:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RaYj6LfY87AWVJzrGEtnfuurWgbCLq0dMAKmgFscRjxeva/WJx4Bb4wn/oSY0tLA9CDeGi9Y67QmjGXOdcbb5PBrMp9noPI7U59kDw1NwET3ZApDfmivuyT7gqISLYNjihCO1DPBoFoeKsoGZrzbj+04DgylKCBv5c0Lnz3j/ihH53ZRZHmOvxNVTbW/C8qqcr+zt60U+8iHthk4DCnewkVcVr269qlr6ASWSGH6TTXVqrQrsKsFVLmxByY5Q/gzdGnH30vKuQ+ABP7+q5hLDYLUFKBdL5JLAoRcLwsGIWVxc4e9yoIn6qX9ORd554oP5CqBBvZWs49noxJO4L9Llw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OjvDQImH/2YGw1s2Q9BQSNVDsaO9MLh/BZvo3Um/dMo=;
 b=EQKza8jxXpc6xpsMAYUn+rqHwWyMqjwgQx5xLVwgFytMeSHmj2BuiXM4qvqrCIctfGCJm/BcwonsN8s45yFftZMdOqhq27nuMyYww+RKetRy38Wpn7WrCei4ZKEnYEQl49zk6Kh2PU9laid3edNckKd0DlUSgHRy8tlcRo8mkKZtTytHVeqxKhVbj1axljpGH+DpVpWF07eRidxi851KZnmBXhuROqfaoxLNrKFiUQrSBUfHlweuzhTz63TfgvucBCxYLPW815sJI6yNXzrcvcIllGnGCw+xw4qrIXHJFmDOB08AvARYwzIjveHtAYEndX61zqtU8eeyRpyjpjGvVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by PH7PR11MB7429.namprd11.prod.outlook.com (2603:10b6:510:270::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 19:20:56 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::d12:2d58:992c:aa50]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::d12:2d58:992c:aa50%4]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 19:20:56 +0000
Date: Tue, 31 Jan 2023 14:20:53 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <maarten.lankhorst@linux.intel.com>,
 <philippe.lecluse@intel.com>, <mchehab@kernel.org>
Message-ID: <Y9lqFaUiYPnNWFFH@intel.com>
References: <20230120204426.68104-1-rodrigo.vivi@intel.com>
 <20230120204426.68104-3-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230120204426.68104-3-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BYAPR11CA0043.namprd11.prod.outlook.com
 (2603:10b6:a03:80::20) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|PH7PR11MB7429:EE_
X-MS-Office365-Filtering-Correlation-Id: 35d80985-3c09-4e5e-3f24-08db03c046fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PwE0btekKEh2DE06GG1n2+6xFfeGFep4nedKhTQcZhTZuXZubby2n7MbYXQM8CKS0OJqpxOda4JCol2/gFZqehm0Hh3H/HkMpfCGTeh3Y7t5OQDBvDX255sijO6wqUUQzpBXmypykha5Kq6ICDTFh/VknYShQWkijPzMozyLV+8g9QfnUiQd5TpdCvTGJxWh/C5b6CCwEjFE39RT1dg+gvkCvTmqT27rImppOsF+H2dD4EYPCipN4elW4jv/Y74D8VGiTcb0QfM1tPNrSpmKFJd9koIqU79v2LcEUNOy3L6oqBjJAibkBC7Hlr6yKCz52aaEe1UnfbNx55YVQYnZQ5XmMhSLugAPleXkfG6aFGy7AAHtnBIuq4l2IxP4vamTbX72fWRBiC0zS59QncVRjHuikTAOWunYqZcmV46vyvHKXNF+ffKxP82zrVmYWz9kBekTdonP3E3dT/nyrt6+spDl1TnaJBcBiTDJrY+lKy18xiE85PbW/ar7n7c+aatHY0zPq2Tn7dvgxEKm0QcCpU+FLHqKc9ptMpLyeyfkYoNcfrQssvXPAVEhIfh94xPdDC/m/H0k5rdfcoL6uLH23fvAWOuZLgS1PPoIZDYyPvrjAi0ZM863B0eEpjAPuntWbJaOfCqdb391a2s9auEEsw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(366004)(396003)(39860400002)(136003)(346002)(451199018)(6506007)(5660300002)(316002)(82960400001)(6486002)(38100700002)(6512007)(41300700001)(2616005)(186003)(26005)(6666004)(36756003)(83380400001)(66946007)(8936002)(478600001)(8676002)(86362001)(66556008)(66476007)(4326008)(2906002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jCjHH0ovVH7rRdUvdr/kIHNyj+nUXrziDJaRODIrSNglltH6kITyZ+Fw3YgG?=
 =?us-ascii?Q?jeQFIiXERCmeE3Sk57k+XzPB5kbwyXRfm3Nn/bK6Xl9H/0hnB4MtlaaMUg24?=
 =?us-ascii?Q?ovU+TmyoVp+fJBmk7gNNx+wgX/GqoU4yVCoa6b/dNGcHTVGM40EKWgYMa3G0?=
 =?us-ascii?Q?YSJqjXUUqLWjnDTyierzSW0g7U28QBWr05XB/GVZGFpvAI+RIND8SgqLfn4V?=
 =?us-ascii?Q?kvSX/E03vENSvkWo93LZ5xfeeDGwfIGmbU26D1m/lHt1RCKc1ib5HW3AkUpB?=
 =?us-ascii?Q?VPV9FL0x5v2l1fMR0VV1adrMWxs2eoiYH6h3DB/R7V6NzsHGcc+JiD6NhQE8?=
 =?us-ascii?Q?M7IVF/jdLMx+WYpaC0o7Hxat+ig5jp74c9ltYTfHVM3RzzYrVtQO5L+uHqVl?=
 =?us-ascii?Q?BXUL2VMvnAmVLCK0Pqh7jM3HpISd3z4ItJzDY7b/h6q8xKnHAoFE7/GXIv2R?=
 =?us-ascii?Q?fyt+DDbf7dwJJpdkY6XAJRuuaNLq6ou1XiVOGoDa/UxhEEQe1jnmxTaRQAyn?=
 =?us-ascii?Q?b22hzJGi0wPKJdUbHPfq1vYeMQxxBY6v6xKuWYv0TPnKXX5nUAHraK9XEdSI?=
 =?us-ascii?Q?cOPQ4YfxChRAtgNovRuiSyeMlpe6R8MTfQV0FSGSP8BvXidjaKqNE+EQlSWB?=
 =?us-ascii?Q?npZTWzL3t6VfvTq+KgMdGYeTd6Krn3HdKgScEPaqtebhDbAQVOQX/OrMWhQw?=
 =?us-ascii?Q?uBnlhXg1rm52APq64Tniu2OMHEf6Q50TgTpnQerQG1ikyxiBSegAn2N+9Pua?=
 =?us-ascii?Q?e2Z1xX44RU9CvDwGlMIUoE0UgyIPjcgNF0omnNfby947D6NxeUcYe6pwtcK1?=
 =?us-ascii?Q?LSjZpb0Zejkx0FDXVE2Bc1tgv7kpAymrVjNXj1M6BFrQrdD6MIXNj1wuZSfu?=
 =?us-ascii?Q?dBd2XrkxERxKatbFsACXXZ6GCN9wwVpQhv6MH8sevGIFU7LlxcfOW3u2LFfZ?=
 =?us-ascii?Q?vE/MLA4CNAMdVw7VgaKk2tFPeWMnn+Gd5OMCeYjXvK77Zc2eI/38IG7WMyPW?=
 =?us-ascii?Q?b9pE3jXSI+ckZhW17+b59yt1ETjcs0pUJRHGZ+vSNleMnLxXcsk0Ll3wm+x3?=
 =?us-ascii?Q?8ZGXF8dx8PQXHTFsyLULe4uO6KKNjQar4Swb9skTYodCUAUKKgHb05YRMQIW?=
 =?us-ascii?Q?ATovYnlzeBvcfDTfHnuR/7DQN5MSiXWyzCn2c6CI5pYIKnhy2sT6GZQkSVZR?=
 =?us-ascii?Q?bNUFsYLpuHZfY+pvvjkw9N9fND8nosA6l6xamq8Qp1A+wX4oIiejYH41ZuBC?=
 =?us-ascii?Q?jO7Mfd1cNMD9kFeCT5DYaCG1b/QeJYvNwv/PAOwPiW8Nj+p2sMIj+AglIVK6?=
 =?us-ascii?Q?g3c6Cw+zmVAUGgR4NKyc/lFygI1UPhd9FCWX5tzWPaY1RMB/TKx92uaLLya/?=
 =?us-ascii?Q?jng3xINQWl9Mk/jNE6vdy7Sjd8uiZcNzrIsraePND29R5xh/FQOqJP1XWpOQ?=
 =?us-ascii?Q?lGgiGhAq8b9uU2fPYo9VwZvXbS756cfzEHQXqQ/MdBvCxDW/UqpaHiKeWIjP?=
 =?us-ascii?Q?rr9j39ybdYFG9TFM3PK5sRiVaJI/GZlNfAUUB3pfQAkYBo/T8+DRTJiBq8o7?=
 =?us-ascii?Q?7AgjoWXU8f1wdbjG7++XX9qWo++uJQkd85elYmePEGPPW5Tux7KAYQjkKH2m?=
 =?us-ascii?Q?bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35d80985-3c09-4e5e-3f24-08db03c046fb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 19:20:56.5669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lN+ZwDvVN1ciYoEH9+Pmthp+CYqQ65EPpy5kZQS0d49IZtGeKwmQ8AePgqrJhrdAl1Q3U+mnkaJ3FQ0B4lVlvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7429
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 02/20] drm/xe/fbc: set compressed_fb to NULL
 on error
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
Cc: Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jan 20, 2023 at 03:44:08PM -0500, Rodrigo Vivi wrote:
> From: Matthew Auld <matthew.auld@intel.com>
>
> On DG2 we get a massive flood of the following:
>
> [ 1068.790446] xe 0000:03:00.0: drm_WARN_ON((!!(fbc->compressed_fb)))
> [ 1068.790465] WARNING: CPU: 9 PID: 637 at drivers/gpu/drm/xe/display/intel_fbc.c:843 intel_fbc_update+0x605/0x670 [xe]
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Maarten Lankhort <maarten.lankhorst@linux.intel.com>

Maarten, may I convert your gitlab approvals per reviewed-bys here?
or do you intend to go patch by patch here in the mailing list?

> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_fbc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
> index 82bc21b09332..13f03c6ea818 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbc.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbc.c
> @@ -75,7 +75,7 @@ static int i915_gem_stolen_insert_node_in_range(struct xe_device *xe, struct xe_
>  					ttm_bo_type_kernel, flags);
>  	if (IS_ERR(*bo)) {
>  		err = PTR_ERR(*bo);
> -		bo = NULL;
> +		*bo = NULL;
>  		return err;
>  	}
>  	err = xe_bo_pin(*bo);
> --
> 2.39.0
>
