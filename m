Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14457C25B7F
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 20:47:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C3D10E3BD;
	Wed, 16 Aug 2023 20:47:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53CD110E3BC
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Aug 2023 20:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692218838; x=1723754838;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ckGJoRK2CBWx8Gssis+5YxODODnn3p8pXhL9T4mFkfk=;
 b=e2z4pQM79g+HJ7qYP22dFflNXM9crnVXBTp+JeYMzJv7k932q+TbuhJF
 FnPRG6NLgHE6IKBP31u3VrUnK1wUlpPJI4fAnZjrhqWNC2VqVcNr2M0hN
 9yLuB9PUfhqvNc3b5z2mxG8WrHOwRDTnl16GhdwzDm9LXDPdPHb1FcJdk
 ygK7yjfi7MKbqubX8rS51Fe9uko0gaN0GKztgXBYVqpcQnCHWlJvP2zyS
 cI6WvXJ6cAbVbfKsO/9/VWhQOAcqiAr1XCU16QFY/ln6PvhELzDgA0Ry7
 KbpuIPXufiho++tqb8Z54Y8QiCHCAQGXJ7vxNRFP8/FWngHWOTuFLTufk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="371536353"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="371536353"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 13:47:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="908136475"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="908136475"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 16 Aug 2023 13:47:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 13:47:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 13:47:15 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 16 Aug 2023 13:47:15 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 16 Aug 2023 13:47:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QDZ3tkFAna6REjetRW1TxJiMEh42rEIChn7BZItjJY+aBQvKA0T1HIa+82qmxMWGLMtgSbXtBTAOszaL1DgSQrXU4mwXnnfnbR7wlYnCIc9ESXs4RcIoMHgsj/TaY77KuMA5BsO0X2Jw5dV814iC2juMcN13hbJ71PjdE29jQ07KmttIsYHyz+6KhSFCPvbFUbBCnN6S7FhwfB3UP25Si0LTDOE8CvF4IrL5YyJlRrALl/Jnlx1ov4RH8MRZg3wdayZNyBmNIAFKGCpil69zYd+G2lDDdRlitr7vAwzU+g/e+DU36L4RLdDQH6SLVg/vDbARbdnBm8JXLtK4l/oIGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qo7wDEfsW8ajxob1015ZPSfAVvJm4tiNsEhL3SGptvI=;
 b=bJEyxP14ZwpzlrVQbcWjpGSgGuoxGRoZQNRQl4C/0DoEcKBFEHc8Z6grIPmfIWmNExFgC55vEPdVKG+TuVaXrddU2d1UmPGU9jUa6U34fzhjHuwIXHNU+4awA7sz4OOsWSv928s5N79XdNPZi8FyIxWKnpNUcRjfvQorqZ6XzsHBtY6abwgg1WAjgNk/AofxWiTs/SGXgSzMGfuWvyh9tceb5j094Go6mIWKhEC437kVfjj48IuO43kIyhvWqrZTfb+5FRq5Y2Vc0caaHe7hAMHoFnv5GrkU5poHx0tIXxMmzgit/7rZCaCFpA4lv2Im0w+XhJ1rJKG+5ewQ2GSZhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB4239.namprd11.prod.outlook.com (2603:10b6:208:192::20)
 by BN9PR11MB5465.namprd11.prod.outlook.com (2603:10b6:408:11e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 20:47:13 +0000
Received: from MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::18a6:cbff:9bcd:4acc]) by MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::18a6:cbff:9bcd:4acc%4]) with mapi id 15.20.6678.025; Wed, 16 Aug 2023
 20:47:13 +0000
Date: Wed, 16 Aug 2023 13:47:02 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <matthew.d.roper@intel.com>,
 <intel-xe@lists.freedesktop.org>
Message-ID: <ZN01xp+GaqaWNLhz@msatwood-mobl>
References: <20230811160618.477297-1-lucas.demarchi@intel.com>
 <20230811160618.477297-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230811160618.477297-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR03CA0173.namprd03.prod.outlook.com
 (2603:10b6:303:8d::28) To MN2PR11MB4239.namprd11.prod.outlook.com
 (2603:10b6:208:192::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4239:EE_|BN9PR11MB5465:EE_
X-MS-Office365-Filtering-Correlation-Id: 53bb011f-c294-47f0-aca1-08db9e99f7f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w/3J+mXUPCu9NJ9aXkn2H6xYK3QyyuzPCNSV/cAc1hHYOsLXldBhdLGbylVdSpiYoze+SVoCAvZ34P3+ekxrAiSwz5QcwA4MjujjmmI/VyNQriAL1mA7jLJWA5bxh7vIBZVEH/oyqx0c+u9LM2A8RMfsZEaRVLuBqZFMgNenQYQNCNEbcpkDLnLjlR/Wex+/Qu3JeOGJ5K/Xm4llkG48NdUyTVBGfqtMvmpKPBFTBfk78vdApUzOAr+ns2P7LTK+TnyrV7DY5t3jqpkdVlgslXMraKqlTmNE9NbD1xPb9zw0OT1+V5gvDKFY4cQ2R780n+QBbKgPV4l/hzHRc4R8wYL1rBPtR2kjoZfo5Vy4wLuLaHlHUGnGMsIlORnirDmpIW1wV5BabfoC1s3vbCixefFjA4vS8oO6zcQWblgB8xzDZu3jKf5n2JK/0OCjqG57H3iCqUcu3ACZRsvmkTPCUePHYKyS3/vTDsoD+ZPQi6w+S0OiHtNWzASkHRINth61zXB5e9xQj2A6gJGQU4ONYpkyZpG/DmT5GqGh0xlrwAUUEYXiIzytgSOh6y7mrOnj37qkZfvOosN0L+PVQRJSsme5+FNvg+RlB8GGFoqvhjs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4239.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(376002)(366004)(396003)(136003)(346002)(451199024)(1800799009)(186009)(316002)(66946007)(66556008)(66476007)(5660300002)(41300700001)(38100700002)(8676002)(4326008)(8936002)(33716001)(82960400001)(2906002)(83380400001)(26005)(478600001)(86362001)(9686003)(6512007)(107886003)(6506007)(6666004)(6486002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rktqd0FoV0NrdVB5QVBKVTREU3pEUFhDR0IzZW4wRjRTYW5qd01KMmtvUHJI?=
 =?utf-8?B?d3RFNzNIQm9nc3BqbElOK21tT0FZTUlucmhjSW52ZDJoSzk4VHg3YkF2bHhn?=
 =?utf-8?B?alYwZ0dMK0tWUjkvSmtibGM1YTlGSE8zVW1Cd1NQd25tT0pDK1Q0ZVV3VS9o?=
 =?utf-8?B?ZEl6ZWFkZU9MMmtRc3p2enpBTzJCS1d3enpuaTRReFh5Y1NJS3l1dFlhR2o5?=
 =?utf-8?B?SnlWQnpmbi9uWlppZ0hIL3Vpdld1TDRhYzczLzlCM2tDOCtYdTU1WkpSUTlD?=
 =?utf-8?B?RmpHcU1MRFFzOVlIaUJwRTd6ajZLbjBxY3lHbXNvYU9KTktUbSs4TGV6dGxH?=
 =?utf-8?B?R0VnY0F0a1RYR2ovQk9kQUd5Mit1YjkyTnZZWnlCQUhXTlhwZksyVXRZbjc3?=
 =?utf-8?B?UEtUMDhQSUFwNGszNWJjbmRQVSt4dElVejNZUE5TREJrZDNienhwZjZnWDBl?=
 =?utf-8?B?QW80eFJyY09zV3B5SnVHRWpoVURsSU8vMjFRd3VjZlBFdVdhNm5rR2IyVmhC?=
 =?utf-8?B?amw1NnEwWWxaWlprMEdEVUgwandnVFdSRjFla2dPYnNHb0NoTThnbDdyVDdJ?=
 =?utf-8?B?VVdCUVZzWDhCOWFHc0tJdlRlcTBjM3g3YXRqeGliKzg0S3I3N3BsRDhJNExs?=
 =?utf-8?B?MDNaNWlHWkh1YnNTU2hQcldDVEYrTEgrVFhYbzdqbkNFR3h6akcyNkthVGow?=
 =?utf-8?B?VFh3WnVuZ0hOMXJWa1lodjE1MnNJWmNLeFZxTituSytrZzZPZ0pPc1JObDRU?=
 =?utf-8?B?ODVkdEo5RXQvTDdJZ2JPM2JpOU1Ka29rMmZnUDUrMWhKQlFveDZNRnozQ0p4?=
 =?utf-8?B?OWRoblVkbnlJZEd5YzMwQStRNzZFQlM3cDFFbktLNnFscFFjRWpYM1Z4TGow?=
 =?utf-8?B?QjF5ZnA5NXVObGEzZmtrTm53bWlRall3RXl6ZUtpa1V6bVNhZjFBMEhWNlJv?=
 =?utf-8?B?VHpMRUhQMlg5VVhzaHBQOEZGQllaendUT2VSeWthZFNHalBLaUNmVlpNVVNR?=
 =?utf-8?B?b3dRb2hnRVpZSEJrc3NaQURLNTIzdmVxVXVWK1ZLV250djJ0NndoWEtPVWhI?=
 =?utf-8?B?NkRQSDU0dDlDY044bW5DVlpabmtNa2swT0ltN1AySGtMaGxZV1BDSU00MVZX?=
 =?utf-8?B?Mm5NSHFSeFlHaERFZXJxNVBia0dZWk5DTFVpNGJ6NnNjZVVuTmNCbkNhRXFG?=
 =?utf-8?B?YnRQYi9CZ1drQ1dpakFJMnZOU3d4VUdwUnowL3JsQzVwU3NleS9XTkl0WU9r?=
 =?utf-8?B?TTFpMzlSeXBISjVUQ1lJdHg1QnlyOUtFeHpKMjVQb2R6aVhBMWpTZTRCbTJj?=
 =?utf-8?B?OE1RZUVnOVcwL0ZLcFh4dlYxc2c0Q2k5a2lvRzVpNlhCamZHd1dHcTNGSEFp?=
 =?utf-8?B?ZmdLNUxXb0JEdlJXZDQ4QzRKNWR6QTcvVVZmdFpEbVlyL1hBeUxKeEVwbHZN?=
 =?utf-8?B?dGtIS1FHVENzbVRiaWxuT2YwYVpibjNWdFRteG9sbmhiNmY4MXJjVmovSmRq?=
 =?utf-8?B?eDREZTJpdUxNUzZ3K042QzVRYVpTRjVPQnh6UmxJcjh5OFFDWm5Da3daTGxm?=
 =?utf-8?B?eUZVUTRtY3NPeis3RStKTjdoN2k5c3QvV054Nk8wbU5QeXF1am5tU1doQk9s?=
 =?utf-8?B?aEt0VzRqVWZndGFZM1pGSTBNNjVqK2l6bk9GTDMrZFNhYmFqWG1zWEpheERU?=
 =?utf-8?B?ak1FejBUdlFFMTAvRVVmSVM0eWVDNzZDckswU1EyVGp1RWJpb3JRRk8zcS9o?=
 =?utf-8?B?MHhnZXRaeEVLdlh6dWcyMXpuMnl2K2J6R1MwTk1EVHVtc01LUVNQc2pBRVNy?=
 =?utf-8?B?TG0vUVRQVGZ4aUFBMG1SdVRxOEZ2UlZKM3NrcEgxUThLbHZrdEd0R3N5bFFB?=
 =?utf-8?B?a0crTE92SFBIWDlEV1JiZWxESktpYk83amhMU1BpSE5XQklFVkpGM3ZFbTFz?=
 =?utf-8?B?MXlGcS9ROUI0dEdaMXlWTmJKcU9sTjBOaWtpMHNQa0xDUXVEU01qajBHc2VF?=
 =?utf-8?B?N3ppakY5aWVha0U4K0pMUUxJaldWbHhSaGg0TC9GelFMelh5QkdyRlRGdmF1?=
 =?utf-8?B?S2RXN1ZYZS8wMHNoc3lWd3k3bklUS2loQ3dLQWdLVFQ5QUd1NEYxWWRTK0lL?=
 =?utf-8?B?dEJWekt5WjFhTjREVUUzZDNRWkR2M1VMZ3RRSHhsdHFPY2JDRS9SYlg3UXNr?=
 =?utf-8?B?L1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53bb011f-c294-47f0-aca1-08db9e99f7f9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4239.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 20:47:13.3241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f1Q5rl5KIzZUx51xnxwi1yhk02SHsX/8u4G/4oT1l/IdacCkjniRuLoNF+5zH4lNtWKwU0/u8d9VHZ50kBAMfxsrsNyqUgHbhjq1qlTP9Bw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5465
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 01/15] drm/xe/xe2: Update render/compute
 context image sizes
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Aug 11, 2023 at 09:06:04AM -0700, Lucas De Marchi wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> The render and compute context are significantly smaller on Xe2 than on
> previous platforms.
> 
> Registers:
>  - Render:  3008 dwords -> 12032 bytes -> round to 3 pages
>  - Compute: 1424 dwords ->  5696 bytes -> round to 2 pages
> 
> We also allocate one additional page for the HWSP, so the total
> allocation sizes for render and compute are 4 and 3 pages respectively.
> 
Bspec: 65182, 56578, 55793
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 09db8da261a39..a6479deb62376 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -37,9 +37,16 @@ size_t xe_lrc_size(struct xe_device *xe, enum xe_engine_class class)
>  {
>  	switch (class) {
>  	case XE_ENGINE_CLASS_RENDER:
> +		if (GRAPHICS_VER(xe) >= 20)
> +			return 4 * SZ_4K;
> +		else
> +			return 14 * SZ_4K;
>  	case XE_ENGINE_CLASS_COMPUTE:
>  		/* 14 pages since graphics_ver == 11 */
> -		return 14 * SZ_4K;
> +		if (GRAPHICS_VER(xe) >= 20)
> +			return 3 * SZ_4K;
> +		else
> +			return 14 * SZ_4K;
>  	default:
>  		WARN(1, "Unknown engine class: %d", class);
>  		fallthrough;
> -- 
> 2.40.1
> 
