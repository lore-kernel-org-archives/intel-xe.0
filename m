Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A013CE732D0
	for <intel-xe@archiver.kernel.org>; Thu, 28 Sep 2023 13:22:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F1610E652;
	Thu, 28 Sep 2023 13:22:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 843EF10E652
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Sep 2023 13:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695907356; x=1727443356;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=63xwX3fjKP/vVe1cIwdjOwZNpcYNxgD6DzG2m+ogtjU=;
 b=Hez7obr5TCQfgvl/VrT0JsVlwqCZlRfC1yPGg1sOvSnKeKHvflwCqbtk
 VayLbMzP9bBLbc1OTUoGeAlj5BztbVFSxSYCWLvvSIR4J2qsDvAkIbILS
 NfwKn/rzgK7HWVG7n+itQIjhEmot4ED0njPGxChX8XivhTWHhudXj2+Du
 g8vF6ocxwEqnwXDnQEdZ8aAjZkV7EkU58Kh72oSPNzpn8Nt7vofTHG1HO
 W20uqOinbYG/3ZBKqa1w0Rp/f0KpEE7DYw5up8ybeE1fPdcYidnge6w6X
 rBwFuOB0liY9RLcaNDoCdcZg+TJrgGFao5fc7nwLsTtAD48iLLp5bKL53 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="448542941"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; d="scan'208";a="448542941"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 06:16:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="726232108"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; d="scan'208";a="726232108"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Sep 2023 06:16:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 06:16:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 28 Sep 2023 06:16:10 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 28 Sep 2023 06:16:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dXHSPZcf/Krr7EN3Ob3HaxIDIEgpJA0RyoquXHhjc9Mg4J2lEZkwDAl1hE1VXPb/EZClSbyWamH1k1wPpagtd+5W7PCoMFxBYVbiS5AyFs/gaanI3LHIMJojFBbTEUIVIZCBGfkt00SXdS5eTKGEx3CQ4aakB10V0KjN2G4K7RRcTKR9F7ajuMI1kiKd/Z2kc0jc1h7plH7YWLmZFhR0Rwu8+6lxNX+KfFWkh+Y6wQIBdJOIs4UvqVF4jJ7yynIBzKtJ30AlZ2E8/iAi9y4zKot5Id6PxdVynSj7FvUZQ7bVWGUZwCAn6QFeM0VrO7+xp4CbW7i7+1qpuFzGkgp/PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wl7BMEGTdwkvpbzEV7g6SRa83vpY53yjp2F5TiPDtVg=;
 b=ByjFSJed4Ce9tMjufiMU3mRvrSyotrqIjLV9IEcC1HfAdmmSBle5hFV8budYp814Yt+JaWu96vaWp9GJS2mF6APA0fGi6PwvOU8zdRZB5zKMUG+4r2yvBL/oK9YI/LOicZ/9vVqNg+tEsMqc0gPKlMBccI4jb0EShcJEEYn297TPLqudLaQFnFJUVXaz5r15UBwsRa/z9jNYaPwxHWMJhTpovutVyRSDlfcEj/fcTL69IamZsIVONw7tG3o4rtOW7Sk8/t+NGhCS+rjPPVXDwQndZ1RpaO2FlXn6MjtcAA5K83sEohPulyS+ISuxu7xm3LCrmFwweHdc0KOcQ9HyMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB7153.namprd11.prod.outlook.com (2603:10b6:a03:48d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 13:16:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%6]) with mapi id 15.20.6838.016; Thu, 28 Sep 2023
 13:16:01 +0000
Date: Thu, 28 Sep 2023 08:15:56 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <hjcuf5dcdqcmm6xwce45xdf6gwxubu4qd3rguplulmrd2mkokk@qe3z2vzivnb6>
References: <20230928100537.392675-7-matthew.auld@intel.com>
 <20230928100537.392675-9-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230928100537.392675-9-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR05CA0179.namprd05.prod.outlook.com
 (2603:10b6:a03:339::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB7153:EE_
X-MS-Office365-Filtering-Correlation-Id: 50744b8d-6bf7-4051-4a8d-08dbc0250f7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nylCi6hdbOjtbeVJrgIPIIe30b8Pv2tqhuSnwGJ/yaX5bdml5ncxspK+oeTw6H7u0xKoI8Q1CfoTaLxMLHlHeNJFxyfmgFMNYhoUquiOHxCQlOwFT/24qEU8bO09+xJFFxkeZvme0NwDMYSbmu3WEtloEvD1Oa0NE9DzywrsiZ6zy4wK1/DC/ncNqUPmFOQvFLj3RQa3iuT2Sm+JaPiiAWOjqhZkc5DYh5vmvwuh1J08BEUvL+lKwR0Q+iuZ/SsLxfM6HrCXNpcN66mBZAJ9tMQrX0zMv0Zb7myW2mGKBGiLKQzqfVDoyf4umY2bct94Q3B8yBQm+MgCnP0hDhb/nmQ5Wah/rDcP/5zxTaUZAi6wVRC0fOFZcE6ngGuaFdT/kD3SjXy120DKPYJDh1a1fQBX371QNTc5rs/lZLtHWWDT9oirM+/uPF17G23Oyr0Ev6fTiFBvyHnuyqFJ2cA5FI36L7apXesE12KilWH1HbXBOePLn62wl0auQ8o50NIe6f9kdtpdN2l54f8OQUtB74yo6G4S0qJMujEkdw6U0AVvxjqI+BDZd6ShwovLTxtg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(346002)(39860400002)(396003)(376002)(366004)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(6636002)(6486002)(2906002)(41300700001)(6862004)(66556008)(8676002)(8936002)(66946007)(5660300002)(33716001)(66476007)(4326008)(478600001)(6666004)(6512007)(9686003)(6506007)(107886003)(26005)(316002)(38100700002)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AJDlaaZ95IZLg3mkj5sIl5mixwU1YY4VIesGR/3XlRl0yFwosovdEubYswMI?=
 =?us-ascii?Q?L5Kk1t5dpAqBNqWLDxCjUM9YZT5+LdOX+JXWODKcQmLnbCsO7g7ptG3qJGM4?=
 =?us-ascii?Q?KQkUDKr0q9i/qYwGB3mP0gunY0QAKMgsB6ZedwbQDKdAyGyPkmVzf8CEYvLe?=
 =?us-ascii?Q?PcqX42NYc6iS/MSA9YfHuTl0wDGrd63vqOo4BwBk2zv22Tke+nuH+6MeRVv8?=
 =?us-ascii?Q?facMVg9Djlz/nro9g1YW8Pm9CAWvAvJtUeHxdj3vLxQB/BkfikxxKpE5MBIE?=
 =?us-ascii?Q?9RjFagXgseZgu1J1KFyP8ZcDDHjmSBq45yiELFCSpx6BiUPs/snLRzSTfHyd?=
 =?us-ascii?Q?pmxAnDcWIrSt1esWFH+a3g5LNbO/V9n3qmU2Y1kSG/d8Qcyaic//ncJX4BrS?=
 =?us-ascii?Q?BnBJ+igd/+BKhsi1nKeRbvP9w2VlSGBTsI6VX4KY4K4cyBC8e+0BgAbryTdO?=
 =?us-ascii?Q?pb5A1ind5XlsvuSKaTeKV6PKSl3rZmgso3fjOT4QoDRMrDohBkRHo5V/pDlB?=
 =?us-ascii?Q?DLxQ2GLns5zxGHDhgI0o94xypF1yRDhkxmSimZHz8b5H7wLst9PB5xbPgkun?=
 =?us-ascii?Q?rhquStsBnqRcXE1V7D0XJqTpWuNE0KpIY0Y3XJSaEQGcIl9JMQFP5B/BNe89?=
 =?us-ascii?Q?9jl47LzHW620/GilKikTK5Cmum0CmcyVArcMMAbuWh4bZ9oEd0N6dSkkEg/F?=
 =?us-ascii?Q?BeOu2RMU6nIyNwv64TVgEclcmE5HQ+L/xtLMDVjYSETVJPYIOW1a/jBDlEM/?=
 =?us-ascii?Q?HDJ6PtEoOim0Sh6Bt9hftgtkPOArjxOyj6txG5yUHbgkNEj8wuCa/kSZB517?=
 =?us-ascii?Q?R0YBu1WcjzhvGYzkxzcotpm9gSDwCRYeQsTGdMjbLTrcYXO6Fp/oad9o1/24?=
 =?us-ascii?Q?ZO/XKP2ougW3vk1E6OIkDM7wQkkUUgN9b7nd8KU8onKcivus3NBosqmFIonK?=
 =?us-ascii?Q?W0NYh82Vs4Qyc3vLph1VULNiRe1v9E1Gph81ZQfdUltUZNW2tLz5wPLrS6Ma?=
 =?us-ascii?Q?R90Q3pNhEtCngVcTljRSk3awh387i8S58aEPJr7+h8A06wjKHZOjup33Ymbh?=
 =?us-ascii?Q?p3t6cr4CJ74vJpPOayHmgZCGG84/n5JryLXuSx3SCKzYmzoc0CfUY8GSblji?=
 =?us-ascii?Q?zGF6/rQDcmIDAomyE8BzUs37DyC8IXizKjwEx00c83QngqmMeyGM67UCdPTC?=
 =?us-ascii?Q?fPDLR0OQHjhmqe3cNYMI87WIZvqmAgORHueq+TuCkqLEQ/0BtuUTk68ghTGo?=
 =?us-ascii?Q?U/8LOgC81SgtLDyOvJgd24+TOLiyVavi+ssO7x+v1EehMOfpZEdGenFK6Lu7?=
 =?us-ascii?Q?lTS9LWs3ylOfjsE2/ubE8tyA37nfNDQBRJ3ZXtdrqriJgXpjuly6o4zQauR8?=
 =?us-ascii?Q?aUW9KbghN4CwsNWsmyryY88l54wPSCRHgqP1sY2o+4juvgSsmCgMtnHZxuP7?=
 =?us-ascii?Q?6QdJ7sCXDQcSCXPaKK4lT2tHsiCkGBv8sBrM0H24FMhqFoPC8Us34X10gQsZ?=
 =?us-ascii?Q?CO3ZLcd4p1bw82KrsBmUQ6o1jDnTd5v5XVuDqatlFzfgRiqwigi9GpeFSI85?=
 =?us-ascii?Q?+ofe6wgxHDtat6WnWq1Ea6b2/g8PLmU9/2Fi1ooSBWTUSjes8XGP6Wg/MVFG?=
 =?us-ascii?Q?gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50744b8d-6bf7-4051-4a8d-08dbc0250f7f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 13:16:01.1612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SQKPlDme4VyWP9IdptG28gW3g7R1GNKpyDiOnI3z5aLcqe85RIWBbGwoEiPsW1ITZwxVWdkrgpk97X0aGSw4Kdh3Mx6VgAMdF/JUu2/8IRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7153
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v6 2/5] drm/xe: directly use pat_index for
 pte_encode
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

On Thu, Sep 28, 2023 at 11:05:40AM +0100, Matthew Auld wrote:
>diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
>index bd6645295fe6..355fa8f014e9 100644
>--- a/drivers/gpu/drm/xe/xe_pt_types.h
>+++ b/drivers/gpu/drm/xe/xe_pt_types.h
>@@ -38,14 +38,14 @@ struct xe_pt {
>
> struct xe_pt_ops {
> 	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset,
>-			     enum xe_cache_level cache, u32 pt_level);
>+			     u16 pat_index, u32 pt_level);
> 	u64 (*pte_encode_vma)(u64 pte, struct xe_vma *vma,
>-			      enum xe_cache_level cache, u32 pt_level);
>+			      u16 pat_index, u32 pt_level);
> 	u64 (*pte_encode_addr)(struct xe_device *xe, u64 addr,
>-			       enum xe_cache_level cache,
>+			       u16 pat_index,
> 			       u32 pt_level, bool devmem, u64 flags);
> 	u64 (*pde_encode_bo)(struct xe_bo *bo, u64 bo_offset,
>-			     const enum xe_cache_level cache);
>+			     const u16 pat_index);

I think the const enum was a copy-past mistake on my side. Might as well
just remove it here?

Other question is: why is pat_index a u16 instead of u8? I don't think
we have any plans to support more than 256, do we?

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
