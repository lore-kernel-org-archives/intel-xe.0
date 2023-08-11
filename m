Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBAAC001B0
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 22:14:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC6210E123;
	Fri, 11 Aug 2023 22:14:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABEC910E123
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 22:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691792087; x=1723328087;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=57YM2QHUeNNDThvfUiJ5n1B9FTgUbXz515OiXHsIiXg=;
 b=jte0cLtTpGcRA6i0Z4nSE/QewTgj2plbwRkeDb2rCBd//skhOT4qPsfT
 LctLDsO96omUJBAvybi8HscZQGKD6wm/VkSCE+txPuK+LTINBHOVEbORX
 EtqIePq8+6iWsG40a4JHam73vY+4IiDqAO0/S3id1wPU941WKaLUtNdjR
 Mz1ES6NOJjaY4SQqgzYnNhbkGNlFjhkb40heXJkrY1bmdvSlKOooCOCPR
 kQ/ihAc5F0A443RItK1fx9MqKKapCQs2N+EiqC3vIA6sWJjEYq1SPNsjf
 zwT2iHVIJrW6/pgmbtnLsjzWymLHKOhI/jj6+BVIuRDCWB8m5L3kZAxn+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="374541965"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="374541965"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 15:14:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="732810590"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="732810590"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 11 Aug 2023 15:14:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 11 Aug 2023 15:14:46 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 11 Aug 2023 15:14:46 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 11 Aug 2023 15:14:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lbMvmDzQxUL1dDEypHHvJ3Esbemy4uJDf6kmfWwlz+n+Ju+eQKh9kTwiY+3GkgPSg+A4HeDLdBrNiZcy0Wqrt1o7XRt1+MWMKNYulZ7HtvJ7oPiPzo0vLphu6oGRazDU3YJTF3GSNhfLv+xjnmi5Qc2edjgXyewLom22SQIOD730qIcu2hVkTWGZ3cpOolZWft8gWItH20cyt018n4wW/zuw2m/ZftH2scKUxe03FUn8mNg62BCFAPQbpS17nNWFXhvuYHx2bP5RSeKPereITuM67ob7HrNoJM9LA0JHh48ox2DFBeoy16bkDln2rVch8qGoqT1az+YzE+P1CN0DqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Jv9jCC24k5JMKY59s6GgMORDYHX6uGKICfRcIa2kUo=;
 b=hWxCuHRik7AyHKhjiIwAo2QFjcSSlMZWyCKHWVm1NYYD8wpydxfQdZPtEV8cBNX9neECfgJusRZFtGex4vl0s8NUwv1EI2S3zCB1VhJ7WfgYtKy4qyIMQe0QCVCtqqKcs88vWEzRw86lWnanZ8+wSI+Aj5eUds4Vjf5KD1Jroo+krWD9mGWNlxeLI8UuPRBY1NnIec0FbeuW4PrUofFXKYd88/98gVxjcrIGgJPe2fskED2bUZJJXO482TvWdJBZDjm5UD/tFhMtK6bPVY4B0YgXDpsSAw+D5o626+Yet+MTMiHHuDzTl1fBOJ8psVadC0uJwXzRAgOHsrcZrm7ueg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB8763.namprd11.prod.outlook.com (2603:10b6:8:1bb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Fri, 11 Aug
 2023 22:14:44 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6678.019; Fri, 11 Aug 2023
 22:14:44 +0000
Date: Fri, 11 Aug 2023 15:14:40 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <vuy5qckkumd6cze4mbo2f5r52tg62hhgu7fuy76mya6gqaf2yj@n5c7n4qvo5d7>
References: <20230811202852.962-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230811202852.962-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR04CA0216.namprd04.prod.outlook.com
 (2603:10b6:303:87::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB8763:EE_
X-MS-Office365-Filtering-Correlation-Id: 13062b7e-9200-40d7-d87c-08db9ab85dcb
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SwBU9TixRlQms1bYESfxxlPTeMSv5l2d/yCL92YJT4aKg48hDx4SKgwTFIQ37Uck0POabawOS+STPgG+h8i255vk1aeCOxsFj+oI4C7qv87qwmQx75WO7cdanmFk5jTbw7Ya9whpQwMVrB1u2D4FUf6Th74r4kEFCd3aYRX0Tt29p0D8HCiJTu3q0dMWYsvf7IwN8H4ftdBlzGQTvfYzbjGTCS5QQ4vX+eRuaHq7aLzyL/DcK38oidiaOpjRI9UyvprTHL7JzsQraP6+ca136ry8a7Extq5svO9YTxu7zts8cWdqbZ/sPHe2UtyV2pfz5huAdN71LNewm/9EYAiG9yfqvVWR/RtzgToMZH3X62RQEVD7qNJiWP69LozYeEtJfbl4DbdrQnr3P4frY8j0thdnSZFICIHUM/bZSipUD6xG/pbBPHtQk6Pza7s4sjbqkA8pNjVzSkmPVvZTntIDUQqzRK0G3V4eYIgA13uZxJ+JtakcseKzPGIkhTLQwciTAfFwC99Nxads4OxN7/VcEKZ2UUyID/waMfFMovRLYSJ6KaLRMq1EBub82Jzgtd8p
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(346002)(39860400002)(376002)(396003)(366004)(451199021)(1800799006)(186006)(86362001)(107886003)(6506007)(2906002)(26005)(8936002)(6862004)(8676002)(316002)(83380400001)(478600001)(6486002)(41300700001)(5660300002)(54906003)(9686003)(33716001)(6512007)(6666004)(66556008)(4326008)(66946007)(66476007)(6636002)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k133AcHvSQ4TLqkWqbIwtGTKfq0RzVZ7bDYbpAH9r5Fks2mmbIIvkgArBgH5?=
 =?us-ascii?Q?WqAEZGddOs9ZED437OKhyYZjJr5LVynsyEmFKzi2Tp5I2lqJpJyQJWxwoAjw?=
 =?us-ascii?Q?oKpWUVtrvvOSpX2nLrpr8I1EEHG/efcAik3T56FISb3Qr7fkggmDqdFLp4mL?=
 =?us-ascii?Q?EMHxoI6R45msb6eX8JuQ23ToU7YFsC0RBfkFaI9RB7Va8kzXhaeQztzpRyBJ?=
 =?us-ascii?Q?jgzE5HA/lQ4uE0a4qFU0O9Z8SwvZjEaPPTLtXGWEOXj+T9xnRYXgIE707fcM?=
 =?us-ascii?Q?mzL6UyCKevi4x5iUlaXAKIXS1vS/ZwlZ+B1itZ0hxwLGRH7moIW9CgbCa2EC?=
 =?us-ascii?Q?rwzme30mCUcbPVwroHkRE0NgNsjwq61uk1x/h6O4dJWnN5D7yMQwBvknu9uL?=
 =?us-ascii?Q?+4aPw+3Ty/y0kvWQmPPJ3N4lMvPrbdkOpi1lXMEqitX1fy2wtwTFTeC+/dSq?=
 =?us-ascii?Q?+N6bnZXH9/DWP6hE2ix5eFmAwpBf0sBBDbWgzB3Mz2Lx44qP3bXEW/dIvv4l?=
 =?us-ascii?Q?aYzfo0OOPlde/YjqSSh/vBsYOeMiFT3SaAq3RKXwcXa+f85k4XHLsQZvvY+k?=
 =?us-ascii?Q?1oQJ+PyMKmEbl6fw58+Wx/jQW2j7ZEwIF4B/Ys9lis/BXcrk0sUtwTbSS+Wv?=
 =?us-ascii?Q?uRpl9cG5V7K7f4lAkIKaOirjujqToPprEQYgdAWt/1HjroKoENiSTZTq/YMG?=
 =?us-ascii?Q?roG+jqZsp3wKAiKbSjQCg3PSYQkM4JsWw5OAGbenUea2sr4IdHKG2u26016x?=
 =?us-ascii?Q?EpLMX+vuGH1gm1bbjWH55SgRvmsBGMUtdnlS+KSnz5KXppKi6tKZn6YgWC+v?=
 =?us-ascii?Q?quIwwQpvYrt0nam3CX9KL/sHs6qoB3OLcoO5TDPuLZaPgTwcTWwZaxy6kSjO?=
 =?us-ascii?Q?YSYpgsBI2g5JkbggifW03vBIgIpiHwWlB1zIwUoAkH5zWU4XaElx8LXENcgM?=
 =?us-ascii?Q?bXuGyxZUu2FDLGgj+xWrlPkjWKeUiTviakJ7fqhzW+AaIiib455rmxsfhiLt?=
 =?us-ascii?Q?nH6wu3jkv2yfnRB73gov2X47W/nt+lojHSFUGzxTJLOq7R1Jr04jeNoAIqzd?=
 =?us-ascii?Q?kf+0nosDH0es+t2sYBVIr6re7SDHVVN4LHyb5o90BQKrg25uwoA2oFbhH0lw?=
 =?us-ascii?Q?W0LVCaSagk0vyxn17d7Dnpom9po+Xqqh6IhGqvDXCAz0mMDkXvh6WMvm1gN3?=
 =?us-ascii?Q?TrswcS5p6BBaYD3KOW5CfjefYNE0i0TLabzg07J72NtAxDr8nCGHgrlBLm9U?=
 =?us-ascii?Q?5jCyoaH5m/D1paJAOtCyh2g6jvDtx2pDh7ShXsZXxQ8jbhWXZaByGVLyUYS6?=
 =?us-ascii?Q?hLhwEderKPo8Bvs9jEnwNSUeu/PlgiYPHVa98ONiE0+gOH/hA2mRAoUaCowq?=
 =?us-ascii?Q?Rz5mriQBtRe/MJSyr0fKGtACApvf+xiMJzcS2qU0KYDRPI59lQ0pPHZjFo2j?=
 =?us-ascii?Q?WnMgGROGnzfAd5S30F/qSPi/p053VKdCL+X0R4pwNqIlKAUun+52rIUNRGgd?=
 =?us-ascii?Q?/sTr2lVxQiAeMCTLm0zVJZXBSRv6DpS52lOx/FvJzJc935EabS9yufZ/r3lu?=
 =?us-ascii?Q?sxEz9orZjLzOS1gIVQ8Tv1UyFoUy8Mt3I1rV+muNuapOLj9peov/KgtXc1/G?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13062b7e-9200-40d7-d87c-08db9ab85dcb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2023 22:14:44.2880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IDoFj5jMv9TeiXouFWKFQLGlilFnqcvT8YbGzYpSB8DRZERGPn3thclFu63fOZZvojREiMsA7Cr56fiTebittSq+wrUY/RgBaJZwHM9GAqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8763
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3] drm/xe: Introduce Xe assert macros
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
Cc: Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Aug 11, 2023 at 10:28:52PM +0200, Michal Wajdeczko wrote:
>As we are moving away from the controversial XE_BUG_ON macro,
>relying just on WARN_ON or drm_err does not cover the cases
>where we want to annotate functions with additional detailed
>debug checks to assert that all prerequisites are satisfied,
>without paying footprint or performance penalty on non-debug
>builds, where all misuses introduced during code integration
>were already fixed.
>
>Introduce family of Xe assert macros that try to follow classic
>assert() utility and can be compiled out on non-debug builds.
>
>Macros are based on drm_WARN, but unlikely to origin, disallow
>use in expressions since we will compile that code out.
>
>As we are operating on the xe pointers, we can print additional
>information about the device, like tile or GT identifier, that
>is not available from generic WARN report:
>
>[ ] xe 0000:00:02.0: [drm] Assertion `true == false` failed!
>    platform: 1 subplatform: 1
>    graphics: Xe_LP 12.00 step B0
>    media: Xe_M 12.00 step B0
>    display: enabled step D0
>    tile: 0 VRAM 0 B
>    GT: 0 type 1
>
>[ ] xe 0000:b3:00.0: [drm] Assertion `true == false` failed!
>    platform: 7 subplatform: 3
>    graphics: Xe_HPG 12.55 step A1
>    media: Xe_HPM 12.55 step A1
>    display: disabled step **
>    tile: 0 VRAM 14.0 GiB
>    GT: 0 type 1
>
>[ ] WARNING: CPU: 0 PID: 2687 at drivers/gpu/drm/xe/xe_device.c:281 xe_device_probe+0x374/0x520 [xe]
>[ ] RIP: 0010:xe_device_probe+0x374/0x520 [xe]
>[ ] Call Trace:
>[ ]  ? __warn+0x7b/0x160
>[ ]  ? xe_device_probe+0x374/0x520 [xe]
>[ ]  ? report_bug+0x1c3/0x1d0
>[ ]  ? handle_bug+0x42/0x70
>[ ]  ? exc_invalid_op+0x14/0x70
>[ ]  ? asm_exc_invalid_op+0x16/0x20
>[ ]  ? xe_device_probe+0x374/0x520 [xe]
>[ ]  ? xe_device_probe+0x374/0x520 [xe]
>[ ]  xe_pci_probe+0x6e3/0x950 [xe]
>[ ]  ? lockdep_hardirqs_on+0xc7/0x140
>[ ]  pci_device_probe+0x9e/0x160
>[ ]  really_probe+0x19d/0x400
>
>v2: use lowercase names
>v3: apply xe coding style
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
