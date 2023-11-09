Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FFCC4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 23:03:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406D810E055;
	Thu,  9 Nov 2023 23:03:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5948F10E055
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 23:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699570994; x=1731106994;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=erhhSDYvFCsdIddNOCY9AjV2ZlnDLiT4y0P1M1FLcjU=;
 b=iDopw7lsCl350a2Gw6uqpVnkXIVNGVSOxKCU79e5gInbGKVRVb0U0S4N
 tRQgVKr6FmPE27OO5JPCB8K+e376xi2YA5/xCrZ6MM8egkesxlatEZv5m
 O3NhpWZrZWegtFOFySZ4lcARfeSULGvvBpVDo/w2K81IvFti0slVzipW6
 FWw+OFMZ3pLyUWAubSYA2LQDa46bModZ7n8B9SzjuePCx2JHU5OQYO/Vg
 5OHNoATB7e/y9ud7vx8it46dS+G48NWhkkQrkKXMqCCQffYBKvqHVKRJq
 dxF4AJQ6W4JxHDlOTpsFYMEDEROKZdJbw12umGZQ2+vnCKXUzxHk+SFty A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="380483680"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="380483680"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 15:03:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="907285084"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="907285084"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 15:03:13 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 15:03:12 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 15:03:12 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 15:03:12 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 15:03:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eb+Q4Bgb+U2kFGCHG2SRV4ulZxdjo7y6Nm225ed+hGYFvD3y7BDmNDTeAYEHmjDpvoNg6qHVo5CbQCFK5KA09TXke3Q8xa5h8QtMh3jAYh0DmQyKHx6/yNZh6YeAyutvKNlNXsGy7pUYlSuON7dTnyfEsYytojNjU04aSSC/pNCf51nVge3vPNmXjjDedVG26kGFj4Z+r6pYbm430zYMZPPSUKacsc1jOzvQrOxp0ZAgYi4yeb7lKXhVIZSEwq66ZCfnwASkPqoWpP27/tShG6cyODVc2E93azrJRCz1Ih9ZMJ/cYjnk2I26qsMQFgtRynhJbCyIbEA1dA5IUb62kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7m1uU9i/p6Ol7xS5CkAa/bmF92iQeaVjtJFfwoQxgi4=;
 b=XfsfbXlre7JDNya79BwVprR15/vhXhKMI13VfNWKPO7wMnt8eFVWuThitAhA4B787Bq0uJ8AXcKeGzKlTVEmYpFoWJQ8Up5GwG8cVzrnEaALR8cGCLZw4o1o3iy3nPrHo6oQFpOtWhPwi6ANYhL6g69yG4mK49izNwq/NjE0K3vady/5j+3z/whhScTbKZ5FByteqGR7wRtsHuQoSRbhJYQscSGdIS20SPiYSHDJgkU3GU1clD/Ok/GaJqNuiv+4hClEJPzK4KXhg5nHYyJwJY+Ij5PRTMxdB/T5X4r8lKywSYPnwJwGkn/gjALWncNpXATho0wY6n8/3fbGa/D1Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM4PR11MB5391.namprd11.prod.outlook.com (2603:10b6:5:396::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.29; Thu, 9 Nov 2023 23:03:09 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::a247:c62c:764f:85a9]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::a247:c62c:764f:85a9%5]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 23:03:09 +0000
Date: Thu, 9 Nov 2023 15:03:07 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <20231109230307.GB1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231109194606.1835284-2-matthew.d.roper@intel.com>
 <169956831224.26590.15932197680796645307@emeril.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <169956831224.26590.15932197680796645307@emeril.freedesktop.org>
X-ClientProxiedBy: SJ0PR03CA0231.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::26) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM4PR11MB5391:EE_
X-MS-Office365-Filtering-Correlation-Id: f40575a2-7798-4102-b815-08dbe1780a87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x+lW2xRvMglQYoUBeb09NB1uBcw4hhIebZg9sh5mgmOPqdmvooHs1AC+VJohTTfNqZ5uQnaKjScK8ajdYn18Epqca2cLYmdSFKKDnvEoHEuiVGLh7mkeu76IaxPJoCuweILoOdPU36ydQQJ3eA7nomCmmYaD+Z7FLs/iwDS7YN2ezgv+nk6eWEuJa+KoJaoelyYDGnibi2Cg9wHirOYk8A5lAur2pev8eETBuYK/ez24cCsJIyF0AwjjhZ8/4ai2YGjvp679qEQrDfQgi0LukUEnrd1AWzYMcyHLxL2pM9S6vaGJggTTdPAjb7qkyJfAY+gue9SWRdH//bnRKOSqY9ar/nHnZGM1drfNLIk5GD2xcM1HTJnTzD71drwmLAIa351YmDhkUozOMaE7ymSQUANc2Uv+TJi+MKbLAQ797Vlgzqy5P7JXHG5/+LCvr4ROhnEKjlHHM4CtXMfyNPI4RrrRZcrbRGkxiKLFZteQFpvZsZd+E28EmMj9pkBbZrEd7grg2RILbjYh8gptdkZD/0bAhN7S3MkZ4Ik7v/Hu0SCT0bnBU16s/iu/TVxPcbg46rnvoYW1Z7Eui66e8XbGQJYUfi+M2II20wn9vx0y3VDK6kqZdtoJTGO+WPgmwZ/hBg9EJ51+CjsCkoqQFoXtNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(366004)(346002)(39860400002)(230922051799003)(230273577357003)(230173577357003)(64100799003)(451199024)(186009)(1800799009)(41300700001)(8936002)(2906002)(38100700002)(5660300002)(966005)(66556008)(66476007)(6512007)(33656002)(6916009)(316002)(86362001)(6486002)(66946007)(83380400001)(82960400001)(26005)(1076003)(6506007)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aZTdblsw++aHA4JI76ZQp5xqWqyfFLiDjAF592JOBeCgHIqdRIF8MmTHoYAR?=
 =?us-ascii?Q?x00XiiyS1QjXBiKXyPVzRnAn9YbiW7oUXP4xgJCvo65470lvOaSdMVGrUvUj?=
 =?us-ascii?Q?jmMy6HOqzwZ58/a8oAscqWJyGRyt4kTkRbCD1IA3LDfDHxd2Vt3Dvwi49DXw?=
 =?us-ascii?Q?9aTflgGVcBhiRtYP+2IYlrtfLWkI8NGU0G/Pz+FxFrd4+GotIvf9encZG5TT?=
 =?us-ascii?Q?nh99RgX1ljI29cxlBD7BXcwgrn7tdmYK0adiNTQU6Yo/4ZI9J7fbgg0AoPme?=
 =?us-ascii?Q?TVsvW+Sp+pJwtahR16sYrFRjmh3GG+t3qha/czAw9m16UgPUuSEedXeFzVmg?=
 =?us-ascii?Q?AS66tD4/6yLxHnkBpmMpXPIgbnMVwZ3XGDkGRj7E1P17GBlEEP/GqwEXu2Jg?=
 =?us-ascii?Q?y0WAxDC+d8KUy1XNsjiUWcrIIgAIgq9N2pYPXddfJUjnGPwZtz+MOgu44gQM?=
 =?us-ascii?Q?Uy7cl2m0w/35j3Y2Gf9Vc1IpuCztrxtDy5zxsml/CPaWOsjOSR8xdem9FQas?=
 =?us-ascii?Q?mh7P2Za1tV8rdEqllMMxpzvv6IxAiLMobSszthXn3p4Bk6Nl78kr7wwLYY72?=
 =?us-ascii?Q?nbJzduD5NR+QNY3LNKvHPpAOnG1saHiF9hh0slCBShyWzZaugSSt1BRaRO4+?=
 =?us-ascii?Q?9vHlWR/pqLLbefrwaNmhUiorHf5mX/UHaoRhs83p242KFr6wx1rRZYaNOv/U?=
 =?us-ascii?Q?Q+xXjObDzk9REsv8EMCCv6x71Osjwmx1jjKCjnCy5UvycJgoFYNDrJuxeM87?=
 =?us-ascii?Q?CtPWg247/7y3su0Oda6nLd606qra4P4hSGCkOOQe4msB/jaqT72fFGuWyZ1D?=
 =?us-ascii?Q?8I2zrbr8bO53vxbb5DDJ/mBIV95c6VHhA0ciKjJVHX2RdLzV24Y1Vu31d/QO?=
 =?us-ascii?Q?ZzUU6PV8qWeyIlHeGF+nrWXX2zqYrxih+FZNhHS7NyX3GFsLNpKxxA8QLd35?=
 =?us-ascii?Q?PZN1Rw/+LjW98Ezwd3dmMLXTjzUf2zJ1nLGFT5kOOkL2jGFKS9MbMKSjqzIL?=
 =?us-ascii?Q?HPS9INWXEeBEGpnLm2yUETiOc9lVefx6WBTOp0SmS55kIeSonrbl7yLdYnbL?=
 =?us-ascii?Q?eMO9RSh1k0x0bILlg/JQ3XXTRNIDtUuNrp7KOe4Y8lcXAvX4Y59HCjFwwvBf?=
 =?us-ascii?Q?o+d+pijH5/Byce5iF/sGmefcrayQQLVxBU/kQgy7gUCW38DpnJv6+nfa8mEG?=
 =?us-ascii?Q?Uq14n8jpDIbuEP51EEc7MI0USNutHS0UtD7hNjEaZW9pS38NNAY+/+sadVwr?=
 =?us-ascii?Q?2hpBPhDyqgyt/dl9X+kg1+KHiE4pX/XtLZI2ObS6W/c+LbQXHUXO5zQfhUyX?=
 =?us-ascii?Q?V47hMoaeFuQ88/LaOOMC1pLYEukTRguztHgbpXt1LhoBun6XA6rG3z4PQocP?=
 =?us-ascii?Q?gCpkv/wCpRru5EH2Y4q4V9XZx7phPAsXOCD+Fhd55kwG2GZXTC2gBfKVM5/7?=
 =?us-ascii?Q?f6VdMrAjvfoGSP0wexxUx2Ne1L/0ThcPdBkCKNVt2xM/3d365+f6drU7BKVD?=
 =?us-ascii?Q?8kMCxY6zBLYWY0OnLZF7/4nDw/PWOijZuKN1mlLc6/NvxY+oSumNcGHTYret?=
 =?us-ascii?Q?Dnlz2O5BorU3nVIH/u0eLHkkUNKL6Mwj4+0XnP4zK2hZWwLy6EUACTf9QCVP?=
 =?us-ascii?Q?og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f40575a2-7798-4102-b815-08dbe1780a87
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 23:03:09.3191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AYs8pHa1I5PWyyZnI6PS0PfIPPccSQWGetLsolxMpiN/b33isbA24nvmgWiRsZ859UbqIu6mfqzDL6ofU365GKPjBbUY9bYZ6enUu41eQGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5391
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A?=
 =?utf-8?q?_Drop_EXECLIST=5FCONTROL_from_error_state_dump?=
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

On Thu, Nov 09, 2023 at 10:18:32PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Drop EXECLIST_CONTROL from error state dump
> URL   : https://patchwork.freedesktop.org/series/126219/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-484-b11007e91f8785a96903d9d3c3d1efbe7e969eaf_BAT -> xe-pw-126219v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks Rodrigo for the review.


Matt

> 
>   
> 
> Participating hosts (0 -> 1)
> ------------------------------
> 
>   Additional (1): bat-atsm-2 
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-126219v1_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@invalid-set-prop-any:
>     - bat-atsm-2:         NOTRUN -> [SKIP][1] ([i915#6077]) +33 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126219v1/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html
> 
>   * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
>     - bat-atsm-2:         NOTRUN -> [SKIP][2] ([Intel XE#782]) +5 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126219v1/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - bat-atsm-2:         NOTRUN -> [SKIP][3] ([Intel XE#784])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126219v1/bat-atsm-2/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_flip@basic-flip-vs-dpms:
>     - bat-atsm-2:         NOTRUN -> [SKIP][4] ([Intel XE#541]) +3 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126219v1/bat-atsm-2/igt@kms_flip@basic-flip-vs-dpms.html
> 
>   * igt@kms_force_connector_basic@force-edid:
>     - bat-atsm-2:         NOTRUN -> [SKIP][5] ([Intel XE#540]) +3 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126219v1/bat-atsm-2/igt@kms_force_connector_basic@force-edid.html
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - bat-atsm-2:         NOTRUN -> [SKIP][6] ([Intel XE#783])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126219v1/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html
> 
>   * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
>     - bat-atsm-2:         NOTRUN -> [SKIP][7] ([i915#1836]) +6 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126219v1/bat-atsm-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
> 
>   * igt@kms_prop_blob@basic:
>     - bat-atsm-2:         NOTRUN -> [SKIP][8] ([Intel XE#780])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126219v1/bat-atsm-2/igt@kms_prop_blob@basic.html
> 
>   * igt@kms_psr@primary_page_flip:
>     - bat-atsm-2:         NOTRUN -> [SKIP][9] ([Intel XE#535]) +2 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126219v1/bat-atsm-2/igt@kms_psr@primary_page_flip.html
> 
>   * igt@xe_compute@compute-square:
>     - bat-atsm-2:         NOTRUN -> [SKIP][10] ([Intel XE#672])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126219v1/bat-atsm-2/igt@xe_compute@compute-square.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
>     - bat-atsm-2:         NOTRUN -> [SKIP][11] ([Intel XE#288]) +17 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126219v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html
> 
>   * igt@xe_huc_copy@huc_copy:
>     - bat-atsm-2:         NOTRUN -> [SKIP][12] ([Intel XE#255])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126219v1/bat-atsm-2/igt@xe_huc_copy@huc_copy.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#535]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/535
>   [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
>   [Intel XE#541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/541
>   [Intel XE#672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/672
>   [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
>   [Intel XE#782]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/782
>   [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
>   [Intel XE#784]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/784
>   [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
>   [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-484-b11007e91f8785a96903d9d3c3d1efbe7e969eaf -> xe-pw-126219v1
> 
>   IGT_7581: 7581
>   xe-484-b11007e91f8785a96903d9d3c3d1efbe7e969eaf: b11007e91f8785a96903d9d3c3d1efbe7e969eaf
>   xe-pw-126219v1: 126219v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126219v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
