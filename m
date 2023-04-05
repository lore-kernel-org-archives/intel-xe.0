Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F51EC7619A
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 22:10:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BBB710E5C4;
	Wed,  5 Apr 2023 22:10:53 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5510110E5C4
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 22:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680732650; x=1712268650;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+GTelZl5nBV7CobTmVmROjvdMSbe7LqyFuaNvUCVfIQ=;
 b=mlu7YeS7AiDjGpFQAkMdPM0kNGrel/xVNjbBF8TEkQUhETrXgoXAFMSw
 5PvSXYYcgPrl68cKqTc9QbcYBoXoY1/zGnb0juOpjNymPvtOTBYt8hMS6
 U8u/3m31zAjRsaxPVMtkzQLymoEIz2WIziaOUs3SrEceucCd/d9gBF+xK
 PpN86njYT5302bskiU4+zfIJOIRuxoTqJlwyBaIsAK/io27dQh3yTrfb0
 hEpQdcHnl6/CLNaecpovOBXcVs+UNlc78DaJCNpJgyR2rebDse3axzSXr
 GUhPLcDwcPbcW2gKbQOQL5MKS3d2Hu01Ywbs6DOtv4yt04Db2e7Wer3gN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="405364955"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="405364955"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 15:10:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="751412217"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="751412217"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 05 Apr 2023 15:10:49 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 15:10:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 15:10:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 15:10:48 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 15:10:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iePzJikEw9Kp5dGuCXPAE+SwdWiP6ZwdokWE+2p2wWlgkuz139zWNykALotSo5EJF7x1Dv/+eD7sYqmh93fvzuWVDP8Cht3QdD2BqAwPoi2wFk1/VdiIegsxTMIrGedYrX4US4JBH/CWoE1JkHnjx7Z0DFrlVJ1FbXG3pkB+ktAX+r8JK/Ab/DCs3VkbKo5wpLB1Obtklfg7uD+2o3UhNXz3DteAf5/2DOuPxX/J66Oq9pZuEKXlbNQK01Qo1ZjICafTfMjZJijYyVJPIDBfQAxB1x/PItecweEf4Qfu3wvs4+IerGQd5cpKMPn6rl7K6CqXM31SbWsbGFdBcPvcaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0LDdOPMsb7iy6R57eiVlSTcEGYxV/NnwJvZh+Z3w8I=;
 b=nxvBYbF4Ye/NnmwG+Ho08+40odStBdEx9gCmVdMXT6YICWzGGgCHmBIuggJXElNnKLRedbe61Ur6UmmjrJO195C0j9zHNvNxquLF6hB98P4iAt/36XauVR1ltPpbMAbqY+jL36bj9ST3i6cNXW/Tgo+E7xjNlOUr4plhz4CP4J6iMvsmTLxEVpoBnPvJR30ruJWAFSk58I0QO3WG/hB9DFi5/Bfvwjr9M7cSGQWRQl6TKpuL+cN54lbELBnOFsqauVaPlEy2lS6bUbaQj/V4pdxhA20O8hQqM/mkth1UpHosSAPSDUjO2u7QP69VVXK0twWR3QMkLDCmbkq4X6kfng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB5992.namprd11.prod.outlook.com (2603:10b6:8:73::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 22:10:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%6]) with mapi id 15.20.6277.030; Wed, 5 Apr 2023
 22:10:41 +0000
Date: Wed, 5 Apr 2023 15:10:39 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230405221039.pvkolcrknfvhot5h@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230403201702.996400-1-matthew.d.roper@intel.com>
 <20230403201702.996400-3-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230403201702.996400-3-matthew.d.roper@intel.com>
X-ClientProxiedBy: BY3PR10CA0010.namprd10.prod.outlook.com
 (2603:10b6:a03:255::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB5992:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e2fe95b-3fc9-49d8-bec0-08db3622984c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ioGRNzFRtMM14qa7PIHTQJhcc0P9aOeRiQNxGaMqdiEQSf1/OfysYLbxkP3m1ktc0EecHV1NWZZtpAy1Tn7SwHCVqd7hv86Dafox7M4YeYPkNHOG00RLK7qNwNK9AdjierVugdDDjpicVCgxeLwmPG52/T8w1aX8T6H1UKZauXggU27LP6UjgNt5hz0/+6wXWJ+3bos/DrphursGWW9jv7xDaYd32cLTdvWx79l4IgZKGy7w/q0h0dtInjariAo+NoWGFjJGW6Fqwk/GN+F2BYBRAzIupssxPHxQMh4/Ul5ezQcjcMVbIEqDTQG/V576v4HuXwY9pURXk3nRW4Z+YIfV5z/CHrncnU3inBEIYvv+tX/bRy3sm4h7x95xdol1FD2epJsfGrC12mHslecw9QAiYMyA6blW6i1KsTy0U6pRi8j0Vn0m8R1NCS5JIhsASkKf6QIA3dVulUFYcX6kW4x8C/xxThM/EkUmctGmTwbNgfx2kyK1sQcQc0o430fcU0ispsNQVDiq/vcsTsMtNnNy/5Tr9K+oKUn90Qx1KSYamRAQl30nqYdABrDm2Z36
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(376002)(136003)(346002)(366004)(451199021)(1076003)(6512007)(26005)(2906002)(9686003)(6506007)(4744005)(186003)(83380400001)(82960400001)(6486002)(5660300002)(6862004)(8936002)(6636002)(38100700002)(36756003)(478600001)(316002)(41300700001)(66946007)(4326008)(86362001)(66556008)(8676002)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RN5yv5OuF0EeS+fwLoJQlZFiMcLLRzU6m7L2SAzE1RKlCXS1TQbYcBUW8aw8?=
 =?us-ascii?Q?GVowgR+nTbUyAl2iQpp9UqtaKlRRp9441GCM3q91YoQ7BQou66LQb7fLp9Pd?=
 =?us-ascii?Q?OxvmFD5+ImK0ICQ3tyVXTrXO7jDVkwO0TsbhDcfYp4REslNZQ5pEJHVujE4k?=
 =?us-ascii?Q?S7cak+RRi5y/80TyQoZcodePEgEbQR5FI8UARWNI4PrS23Hln/JNFL3XzhPb?=
 =?us-ascii?Q?/p8AUvwrOan8o4wB5J9zvIJUU3e20H7rDS7jxBhpA0SioaYLvDcXmn6zSbij?=
 =?us-ascii?Q?h5YWBLMMQhQZFlDIIUdyFgfVP+OXg9zP1ODVqCZVPXQ5VlirT2B8wo6stp9+?=
 =?us-ascii?Q?P1vGs9rSm2sd4ImYCBOeh36lb4jS0JbmUVydPAKGfWFOfRY6Txl4cpAvxwa3?=
 =?us-ascii?Q?vGIOzCb6AKq3m4hdFjKeaCzqP/p/sf8aaoZJFBw7K+LikVffd/r8st0cLMT4?=
 =?us-ascii?Q?5ML7Nksb1yIR0O99rxw/O5+SdgJOk5hRUteho6l5zHvBwZult84KmCSIWs+m?=
 =?us-ascii?Q?8t7KFksxbau0E5sqQudQuGcB84FkBq5ZzJT6KiDMvRmonUW0cRU4mWwqeh7l?=
 =?us-ascii?Q?i1ySIyqK36zjl7lzs8GP4co+50IyUW+ajwkSAMAElvUW5E8hEfdiPCdoYG5n?=
 =?us-ascii?Q?V/e+DKwizdwMamZ7h8ZVEUOqSXFxF5TKxg9E4KXOXBzo/85ecFj5RbZcC6RJ?=
 =?us-ascii?Q?dVSwPVxnTRloM4Ps7XLUk1mfyXa3XzNjJhoIaXP5UqqQwBbTU2FFXxjlzzLb?=
 =?us-ascii?Q?vnxbQftJdm378tuSF2A0hL0ZxyAC7qviEywPJy0jgVhV9EyfbLyz+GXhh9zK?=
 =?us-ascii?Q?kscBzi21eI//qlD3V/0uJeb6D1kgRLd2DdQFz0WlYJHNXO9Z5OiEXtS1XwQm?=
 =?us-ascii?Q?NdGAo7U7LLdtsC/EQ+PuP6dj5hog9nN2cWU2+YnH1l+oM8udTx2u3H4xF5Wd?=
 =?us-ascii?Q?dgMUi7KUMwSdUj3fnhRkKhB8TUOjOsP3wg9ac0/B+IKgeRpX1HbeXIH5SzwJ?=
 =?us-ascii?Q?ekoqiYDCWI8j8U0OyGtuuhveKRkqu4vRXx8pH55D28kuMhp4W/GYRVnJRqgB?=
 =?us-ascii?Q?frzHoTg1MF5wAqGtNqsnrClHDU7Z4l9i2DIkOw1vTR/ZrC+PpDFWIZV1MiTW?=
 =?us-ascii?Q?L/musMbsa4cUtDDaNZkcxqrzXJIElBRtWRxDDXpbz0YJ8EUJovOwWiezyhn1?=
 =?us-ascii?Q?Yu5Ns6aF2DBEbCDVRK1GNqQiDzDYRtGNyf2h1GAhZUzh6mMyV64GfrH/35f1?=
 =?us-ascii?Q?hLlKZSPq0IcvFK0UVeRDkrMd49Lrth6k3IZNsJJmCMxl2TfuGXJSyliw27kO?=
 =?us-ascii?Q?4un5eY+afx3w+p/Fo7weWLD5tQegql7lgJ2r8xABHBp730VrmA39UTLRcYTL?=
 =?us-ascii?Q?74jHt/ttdlO0eCOrcolfKTguakR6nr1lVA2AcvnTPy/cMs+HN1UWacEmjk8q?=
 =?us-ascii?Q?Iz0GvHadjkczIX+bT/HrzragzptEz8LHxqAHClSQNn9QNGS55AIw3YTnoJ6o?=
 =?us-ascii?Q?mC6InZtYjwuD1aXCH19HP0XL1paUnmkQGm9XfSCy5e+d5mxkD0z7wLf9egkJ?=
 =?us-ascii?Q?ZDLjmFk/Q4vgSNspTtFNgeWbrqUzRY3IYjAbd27QbrgF8OrhHkbK4Dvg9tX3?=
 =?us-ascii?Q?Ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e2fe95b-3fc9-49d8-bec0-08db3622984c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 22:10:41.6549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OsqHGPVsGgypjnKWl8igeYxbfu2gjI/xQqmGzcWVTZzOMeB+wZvD0AkQxnjGa9rIJgP1xFzuskuKrNQlekpVcDxU2ofCJHDEdJgMUj2OS/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5992
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/6] drm/xe: Set require_force_probe in each
 platform's description
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

On Mon, Apr 03, 2023 at 01:16:58PM -0700, Matt Roper wrote:
>Set require_force_probe explicitly in each platform's description
>structure rather than embedding it within the FOO_FEATURES macros.  Even
>though we expect all platforms currently supported by the Xe driver to
>be under force_probe protection, this will help prepare for some other
>upcoming restructuring.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

while you are touching this...

#define DEV_INFO_FOR_EACH_FLAG(func) \
         func(require_force_probe); \
         func(is_dgfx); \
         /* Keep has_* in alphabetical order */ \

maybe in another patch just go ahead and remove the macro that is
pratically not used?

Lucas De Marchi
