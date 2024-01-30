Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC361C47DA9
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 00:56:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12AD112C31;
	Tue, 30 Jan 2024 00:20:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62F4A112C31
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jan 2024 00:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706574040; x=1738110040;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Myb1lQbxLGF8t1/Hn/IT0Zs7zdAP8fLz4xmo95sI9oM=;
 b=M7Gm3vV1Lk4eNTMdl9lAXF0VlQrIggt9va7xyVguWivRNcrW05jUGADD
 HGB2+ROJT8BD4dgBSq7OZtZktnc9VsX+vFs1qSUREXlkXt+T6qG7ouW+S
 9nkAh5xIrw3NprlzwLKQRLDUzf5Q9bwmSQlu37mPaJgXG1TbIiF52zWyK
 Xw+SG2iTTSHm+UcE5nkJ+qtyIKmHzKG/s4N/1vpe7L1CGu9PaTKTRKqz5
 FMRpvrLkhJWOyEVTjIqKseIIowKkM+jyG4dttdGyJrJreqJsT3bk5mh+N
 aOwDZtbM0XhRQnu/Y82jODUvR/d6YNQI+k0sK318jikAjGpV5MQ9Allzb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="9863065"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="9863065"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 16:20:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="3630432"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2024 16:20:37 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 16:20:36 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 16:20:36 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jan 2024 16:20:36 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Jan 2024 16:20:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YbQeeZRYOh8nB06g3TEKfuEjkq5FB9qepVaMYQ5/ttU89nzH1CH8nUU4wTtv8HgvLCO1j805FxUqtlec9nlhxVawbDJdZ14hTph+neoanD2uZIP6tJMZ2z6SJB3TfrSo0CreY9/ZCsDhmawWNnci3FY+WPT/M1SuTrB5vGjuyQXv/QLMbHTstrlPCIOdPBwUTd3DRaDqtpuRGiOutIgYFFj3KpMk3fLYKMyP7monvIir+1+PWSIq1tq8jpyyZcvU3uL/OCvC/tmJLhKm90z8Hx3c8q6n/laRS4eBuAGDPq548wul//NGxFdBpXNwWlcK9D+mQCGWUlIQ6hy8IN/KRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1X63EcYIaf4WeeAiRGmkHIAD1WtX65L9cEOnwb48DAk=;
 b=R+ejEaVPwymwn5f6HSiC7MchvcM4WpO6JtyULmoUlSWgJy6S9dveJQbrbQvfuFzf6xOTCFwLHpdan7Zujq5ExF+Dfc3UeHTJNh4BGfifXZZHBP2b1W9HWobowvZGaD+bYn/rGvTCjkxmSBR+aiomEsFeJ3QL1xT1djO7bXiPm0LbuBMyc47+qAXnJpPmmObbSBPVnIcTY1KvX7T8nQerq4M8ZbwuHQQNJDzM69Z5OYeC4r/Ho4rRB4YzGCp+UXtbncjm5nDLFRxy1eatIYhwOSI/qpBGRaKnn3+LfjvcuFDQkwctMfn/zVlcmlPro50anB5HA286Rx3+aI8+bLyHBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB7316.namprd11.prod.outlook.com (2603:10b6:930:9f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Tue, 30 Jan
 2024 00:20:34 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 00:20:34 +0000
Date: Mon, 29 Jan 2024 16:20:32 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe/xe2: Enable has_usm
Message-ID: <20240130002032.GB1201779@mdroper-desk1.amr.corp.intel.com>
References: <20240129214510.123829-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240129214510.123829-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY5PR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::28) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB7316:EE_
X-MS-Office365-Filtering-Correlation-Id: 417e6dab-f060-4635-a1c3-08dc212946cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oa3JfPQ6FcSc3NSppfCsVlMSMALrZSUhSFPX7ZrQHKGgdzVDkWOHUwVU5+7zXZPA9T3tcuopzXF8Lc58EnuKgjXLYqFf0VNWb5e1zpd+tMC+CjD/VHOG9e9qYsBmI3de+b4bVfXw55flHcc0+UH+5BE+1h75aO0rTBRZ9KELYKnEpEDiMty5/O10wVWkEq/CB7J9iZOLmKtwKWPGZSYr1PuK/gnIZicbM0J9AT8JkFn9fSE3V7k/wazVFD7YVbSY6wYJPx1J+tqhKxw35oPg0u4D/NdIXF5/YeDgAX1nhJ+EcH9YMemHiuBPvzxj80Buxu/1TZMJnmIc6Rkpa+uN+LGORs65RjXm50XrBJhF7iRM29YRu2uQYxfPxPqseOnjM4gzf7jKA0fLXyRG8i/qdj0YnVKDeKQxAVzArs5gziaDOr/ww/a5b8MB+Wal0VFzKGflfNPMKlMk7QWOSZ0zKv2YMY2XW2gBoyx7zDsxg5wW8MQBUJQeivYOtAavz4sAMU9qoR5+RM/KY1ouuGwTrUlISwc93PaCAlaM3M+sBAVmKQbCn81IUCqEO0oh67ee
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(136003)(39860400002)(346002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(316002)(83380400001)(66556008)(66476007)(6636002)(66946007)(86362001)(6486002)(478600001)(38100700002)(1076003)(26005)(8676002)(82960400001)(8936002)(6512007)(6506007)(4326008)(6862004)(5660300002)(33656002)(2906002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?reNWp9/S+4K3rc6J+GzgNOip2kUUqCC5kc8nFviik9iy1E40Ut3gULZC8nuH?=
 =?us-ascii?Q?k5NO4izakTFlVO3f7i2Q01LeW2il7TGP9jxIS7DLm7XYhLLEOkJkXiC49hQI?=
 =?us-ascii?Q?vYhAAjqdrxXpbW1uceFfsJosxjRD8rRvYBTN7QpRL99a38WzhKWVxXwTQ+Ri?=
 =?us-ascii?Q?AM9dsrA5pQG0bt+ZlY/PLwvcYafhGX8AqvHG86SAWvjINBPxTbUtTwJTuN22?=
 =?us-ascii?Q?/upDjTchAcStPPy+0dtstuf3bjGn37f//pnDtRdDFgLN5aeCLRd9DMHVKFTv?=
 =?us-ascii?Q?6P9gD3kDJDxd/kWPTAgDS5AwofYon+XxCrRIcO7RZQoU4hVHJYU+RONo1HyI?=
 =?us-ascii?Q?nhvBIbs9nZVfTkyM1JHqz4KqVqLs4ECzHqDD9PMQhjLm0NDh1dpVlBmXAFAO?=
 =?us-ascii?Q?OnIncRCAnRT6hiL5q+vYzUDOhZELF6t/wIhTVlmjxsmjUAnEfTQxbDiwl8lX?=
 =?us-ascii?Q?91xZyylAFYhDEcAorejXyDkbOBpbFKO9RS1VU/CJ6d2QrcQ2L9vMgTYjHZJ4?=
 =?us-ascii?Q?vxKtW4I1dSUrpR6BcG96DKjb1WD6gOY9V5GAFvYpCmXFvHp3ikyy8k1Txo/e?=
 =?us-ascii?Q?m6pEdZlQQiEKaYBe38QjVldEHG8+UWHfEJSO6PPBHX+IqRdtjxQHH9Vhxj/k?=
 =?us-ascii?Q?BVIb2fuFtfsKT0NgGdr7E7E/ZA5xeNP1DcCxT3nCrFbqy4zEr5CMQvi1WXzb?=
 =?us-ascii?Q?XLMZbyzCYISkzOG5AdIOgkrXBg8EizV9TB9GmQ4vXc9KtA+JfxDpEj8kzi0Q?=
 =?us-ascii?Q?p8QVA7k1N6RK1aROuOJamcV8MLJ/UEK5QLLWh+/ZqdqBBKVPST5JXVK4wbIc?=
 =?us-ascii?Q?lVPwEkMEskoVRVbX2wMPJdA7TQzglfPgRs7UPeFS63Im5VkhHSEKHwP7ycyJ?=
 =?us-ascii?Q?vx0pyT5xtQSWuB849wWRQS5Ek6KixFs/rsSPxJNC9cZQSmRwkxt2v1gpy1LS?=
 =?us-ascii?Q?l1/uVuzsp7U1be8lxMX6SQrCynrdSCGaRERgiQLqEQvSeZOz3oKfOPt7HJ6C?=
 =?us-ascii?Q?GpzbcRaeNDebaoqaJ0WgWiXinkYCwcibvMXENIZhcirAXcReacTJlHpgc12e?=
 =?us-ascii?Q?7jAdOfueAAWvpmYBaeoFlTqv1hUTvFLJ0j3OKB1fDDzZxxRcTo7ZwcuVu/rk?=
 =?us-ascii?Q?/mvF7FQLYULPTe1dR31/0qurjkhTRT2KZTJxbIf8d3RZmpFg2F1esmBtqh9J?=
 =?us-ascii?Q?8D6TKVasIQ4OA9J6Ms48RUeVcE25dFB4UPr1kh+NrG28D+T/8CUIdfS8jnrS?=
 =?us-ascii?Q?X4qYEG1oT/ncB+VdhNjf8jE8ZgE6sG4tvxmyvCLF8LXnWgQWZ5P+3lnBX7Vj?=
 =?us-ascii?Q?nymLL7EiVGUo6S3SZVE2Iymj0x5iIrbiqD0bzEiwYBI9YDBiShGQfXrKgIDY?=
 =?us-ascii?Q?OGqze0rgWsvwFsGl6t80QDTzkRnoYp+QJTHU+63jIV+19uGWvyMOZQiazN5W?=
 =?us-ascii?Q?s5bG9UPsjkK5Yqh3DSXUyE787TURX9UWjHxd1OTZ7Q7BTmUV4+A8ISsdKwGt?=
 =?us-ascii?Q?v3P1XzwbHEyg0wFqYPdN3TZYcEsedevwzpwOlYdjYVKllAIlvdzwB98t9by2?=
 =?us-ascii?Q?f+3kepUkZAsfncb0sluqLsD7Oej81ah2eXX1svHPD3/kQ3oAhrwI6B/PAUTD?=
 =?us-ascii?Q?/A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 417e6dab-f060-4635-a1c3-08dc212946cb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 00:20:34.5982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yi7+FcXsPrZ3CLbOYRygwDnWg9birYJtehL7qLvbpERAJni0JcthL+B9F1OVjgRWdAkfxLUaU1jCmBsAcq6JG1LVgkZ0ENSfOGLxjaQrT6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7316
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

On Mon, Jan 29, 2024 at 01:45:10PM -0800, Lucas De Marchi wrote:
> When xe2 support started to be added, USM was still not functional. This
> has changed, and now USM can be enabled for xe2. Remove FIXME leftover
> to allow VM to be created with DRM_XE_VM_CREATE_FLAG_FAULT_MODE.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 62b5e5d0fb62..cde3a63bdc7f 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -165,7 +165,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
>  	.has_asid = 1, \
>  	.has_flat_ccs = 1, \
>  	.has_range_tlb_invalidation = 1, \
> -	.has_usm = 0 /* FIXME: implementation missing */, \
> +	.has_usm = 1, \
>  	.va_bits = 48, \
>  	.vm_max_level = 4, \
>  	.hw_engine_mask = \
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
