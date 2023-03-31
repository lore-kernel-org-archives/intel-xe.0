Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399B2C761A6
	for <intel-xe@archiver.kernel.org>; Fri, 31 Mar 2023 15:14:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E60A610F2A1;
	Fri, 31 Mar 2023 15:14:48 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B05B210F29C
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Mar 2023 15:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680275687; x=1711811687;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VwKoLiMFiZeXF4wQDgDpwV9l6ITulByoj/82rzXb3HA=;
 b=gDhtWjDzJ8kpq7HaOpUiFtRAVTgSvq1S9j2iF414y23GLWGlAPBf71iW
 8TSXL9SXJfioLItqPreXgrsDAFxK+gv53+QRaJuOJQFrujo7FRy/6g/bP
 i2ewrk/7wvhDcPFnGMWk1cUR34h8ByGPPvPvfVmYJztlqrt1b6+GogcJA
 JyicmjBHeKFa4aJgzf/FCwhiIiPbpkG4vjB+jRA7H3WnBSEgYC/nZkpPU
 OkGdYO43jWb4W9idXD+ykYl2GaBQ7mPEkfaWUHeg2Zj/lAqYASqa47iOv
 F+krLqbPQVWFn5GR77hN81GRpNirQPKtf3AztZYzOChSxtH4iEBUyK41v Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="338972859"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="338972859"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 08:14:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="809079460"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="809079460"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 31 Mar 2023 08:14:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 08:14:45 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 31 Mar 2023 08:14:45 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 31 Mar 2023 08:14:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ldj2DQS4QC2wKOHyfUNCfVTlwxxkr846lozfD3HXfkQSqCzbs9uXu2s3URPXuaCen8suTwaAXz3OKesE0hRs5IPzPrAC9Y6AFy29MVjfrDv0vNGhMYDmyPfivQnU/90bapTxupjtfd40ZMZyITpA1AAA2ensu5n8h1cZMZRjhz2itYtc0cygmNKXp1fERxn3Jd8VnTUtl6hS4i0EIoKaryvn4iIhGqJ7jQhk56p9Kxq3xz2bD6XeGfk4nTeXk0vfUy4SmWj1oTTfsSP3K8Cj0QEmxf8N6TOG4J5jPsX9K8vM03oq3jFA+DFfSkEFlS+kG51b62A1xVbqT+rpmpBCvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HlNtbFnXG3XZQyPbm2eICqDthUOR15LC1nVBC0T0wQo=;
 b=HnsD8I/P9zLVW7AEW8JnGF/9Yw9PbY294hKjU29UHHSD/OttvHgBJjHed0qnPFRbb+3wmS1nUT8GS1TVvuosx2JaB6vMT/R5KRGKsDBUA1KXqjJZwh4NqVXzJPXvhDMahwLmhNdmXUKoMqLy9AkBs6nIa1YB7RtckwskkIwV/dJo2nFxjrO2eqokdlovnLqovftPiKScSmQSiHZDtgD5rH2j5MdMOYxATQMw+r8pX2PyEWZ81hShVBXw8RgIZUk64EleiARbhfjs0Quz0u1+qk2nd1e/9KgzPy6S3b1ZzLpUewt+b60255uuqeZDXq1nFaEFps5E1KucCVoB1TI5DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5119.namprd11.prod.outlook.com (2603:10b6:a03:2d6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.24; Fri, 31 Mar
 2023 15:14:43 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6254.022; Fri, 31 Mar 2023
 15:14:43 +0000
Date: Fri, 31 Mar 2023 09:14:15 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <20230331151415.khx4flgdsxeldz4d@ldmartin-desk2>
References: <20230321220527.595462-1-lucas.demarchi@intel.com>
 <167943651434.18679.13280164790202879090@emeril.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <167943651434.18679.13280164790202879090@emeril.freedesktop.org>
X-ClientProxiedBy: BY3PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:a03:254::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5119:EE_
X-MS-Office365-Filtering-Correlation-Id: 4572d818-d2f7-44d6-d90e-08db31faa751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xmSjQ/P4nn5w4rUVL0hlaDliYntyPn1lev3FymdBMMEN/V6nGY/yIuXH9SZiCtqGZvGIfB+FJuhRBlE4iQGHbPbbzeoTmBIqFWJZZ4E7rmZEwIZxy2T70K6lOS+Ag74BmI7zrtUPRm1AHvVIe3sFsMy11TFvRMfR2IXeJpmA8Bz7gm+TSDAbdftQpQTvrsBmFsjoYJvLg+9Tw0eAx38i5UQiydyOOGYo5MlAHsbI91NardRTMvlgSzvlOP59iGW6VwqQCF/4YTX2rGHxapwCJAqRSKJAE/MLK65YJIYvIQkgFmv9ANhCARquviK5hzu1gFWVTIHlnjxY8TpPXjy2enEWARNzzXj35scX3JHDTEJjgv2yjMZb7aE9oQKeB0vdEKPhM4wnJLqO/KP/c039KAKwz5SYuWAw04shvKKG5Dt7etppOjCfVDSsbwr5+OhqXx+2ZTGf/SceZiJe//fTOuGm5cmTIzcLMC99/Yq8MPpLMFsgnKmcTJ/PH0aCTyUQRXDJtD3vxNPZPpnnTKjItA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(346002)(376002)(366004)(136003)(396003)(451199021)(4326008)(6916009)(316002)(6486002)(966005)(66946007)(66556008)(66476007)(9686003)(6512007)(6506007)(26005)(1076003)(107886003)(6666004)(38100700002)(186003)(5660300002)(41300700001)(33716001)(8936002)(478600001)(86362001)(2906002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iPD8SxpUrQz+/L13z2lVka6UaOe0Fub8YPxsIOuOWrMU/pryeTHLUw5hs8J9?=
 =?us-ascii?Q?h7QVEe/74CV/ZVEYdpmPt/ZFYefRSgIIO8SweypKo8vLwyo5mhhrzCZMbIs0?=
 =?us-ascii?Q?0rT8FK1HwZZ39GB1zPJWskTztkFR2ccJSPLZexNGH6VwvHELf2OMs2Ja2oWL?=
 =?us-ascii?Q?IGhLc2enkS6easScwryUfDqGz2TodtbP8x1i+56d018y2/+Goo5+DhZuaRsI?=
 =?us-ascii?Q?U7wVRuvx6d5TmvpCYPTzCmP9erprLsXL5POs1Rw2vfv/0A9Kv7UbabKF8HKv?=
 =?us-ascii?Q?yA4Al6mDQ3lMnTZVzIshd/mATCk6jHReopHOu8/gpWj4ECR8xLi9wgnBh3Vg?=
 =?us-ascii?Q?zSMbDEwt/X5oM6zS/AV+kVUSSkyRauzLlPAX/ADlTR9b4EnOEkyWwn0E7YdL?=
 =?us-ascii?Q?eWpEz8Wm5CBGFnFAfcGm2waQ1T67xnVL7oMb2cGFO2h3mpl/IwEu8G4nUw8J?=
 =?us-ascii?Q?e4E9lLFiwr3esz5/GV5FEUMz9mxns22wRqRipui7qZV2AkpUB7WR8/vzmUYA?=
 =?us-ascii?Q?+9I/RWgOLEqDiHffz3TIomIh3Mo0ljVAacIOubPeAptcBoUwR2Dkl8Py2UgI?=
 =?us-ascii?Q?AdN6Jg+ITLWG02HXTyCyIFlOEW3XSYbRqE5y/cJZ+WSmPPZPj/Br1wo6C07O?=
 =?us-ascii?Q?EBfIRG8VScErINyLBIiQl+SAd4M89hdsM6mMUZloxwnYosY61p4BWyuEFEXN?=
 =?us-ascii?Q?8fvIkWRm+aNzDirSd9rzMrkgiHniLtT1cOjFIcr8VtYPny5DBubH8vXUAan2?=
 =?us-ascii?Q?v6MGA/4Rd3zqXO+b9jJlM0j+hoExgnTpJqNLg6jVNDv/3iIQpwjsUVsSyArw?=
 =?us-ascii?Q?tk99IC+9qeeZ+6+LCBTKfrBPc8fpZCY7B1IMwfMiCLEst15JGkLF9PkAgBLM?=
 =?us-ascii?Q?3+VyQSxKA9mcs5otFZFEPBcOhGbflCgSdwNv+fAj06DdmVeljghgrr+vaXHP?=
 =?us-ascii?Q?lkA/5Itoj3vlmuxMFHbVbODIq8DUkdCuuKqdebueG5iKwqxZn47IJ5FnAvxm?=
 =?us-ascii?Q?dFbCeT5zQkvpyJCNoXRAS++bWGI8QRj4cg0bQGAYPsb3xTLF0rQ9CjAU6tDy?=
 =?us-ascii?Q?6TJ9/6AZ0bZL9IY3q0cTiFvvKLT6b6IgovafrXk/a+NxtLssjdcZAvBlkrv5?=
 =?us-ascii?Q?IgxlAPiVFb5su0Mg4zfgWUMhOew9Od3g4iyNsRhPFeN/+NTk3lfu2zgE1Die?=
 =?us-ascii?Q?tTglitgAGZtgwcK3WOZaai3FvLewVNVSyR/YDzIIGVoWZ72M6IbJ8P9l7YyV?=
 =?us-ascii?Q?IiLZXJfTBMCCwNBEvQUWE23lTnLzAhSkrNFa6qm8nesnlvxBi7tZp8lRtbjS?=
 =?us-ascii?Q?H+mLX6fKn6m2qFTXQGpZLkQfbix/xT0MDa9fDd4mKpMx4HN/G78id8g3i+N4?=
 =?us-ascii?Q?siA7TtuMQ9VbP4Lw3xJt9RQx4thEa+deUe783cZmOTz/5gWslXLcS+l91xt/?=
 =?us-ascii?Q?L3Sv1i6e764Qs4wkTb4ebqSa6ko75dJa6/SVtxflF6o0XMh90vWd3PXe3a/Q?=
 =?us-ascii?Q?yKh1g2bGgQNhmNHhHUuhEoCwpuOaPPeTWNSl+xNwGQfQhCbMQ4Tzs0jss31A?=
 =?us-ascii?Q?/FgJ6342C4m5+ce6a6XcDk7703drMOwfiHe8vjMYBKFyzEv4vj2CU2iP3MTF?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4572d818-d2f7-44d6-d90e-08db31faa751
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 15:14:43.2858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2mCuEQIn5mmDlAMGwEmfhali9HTGWGSnSd+/6HwJDXtYbwbEycyXaDUoxdiyGusE76ad8UTUq8N3vVoRIs7pUtnNuYwsFmzvUJky2tdz0t0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5119
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Unit_tests_for_rtp_and_GT_wa/tuning?=
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
Cc: maciej.ramotowski@intel.com, michal.czaplinski@intel.com,
 ryszard.knop@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Mar 21, 2023 at 10:08:34PM -0000, Patchwork wrote:
>== Series Details ==
>
>Series: Unit tests for rtp and GT wa/tuning
>URL   : https://patchwork.freedesktop.org/series/115463/
>State : success
>
>== Summary ==
>
>=== Applying kernel patches on branch 'drm-xe-next' with base: ===
>commit 1ae4dd9e82429e075aa7121404b06ce170da5848
>Author:     Matthew Auld <matthew.auld@intel.com>
>AuthorDate: Tue Mar 21 11:44:07 2023 +0000
>Commit:     Matthew Auld <matthew.auld@intel.com>
>CommitDate: Tue Mar 21 14:03:29 2023 +0000
>
>    drm/xe/buddy: add compatible and intersects hooks
>
>    Copy this from i915. We need .compatible for vram -> vram transfers, so
>    they don't just get nooped by ttm, if need to move something from
>    mappable to non-mappble or vice versa. The .intersects is needed for
>    eviction, to determine if a victim resource is worth eviction. e.g if we
>    need mappable space there is no point in evicting a resource that has
>    zero mappable pages.
>
>    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>    Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>    Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

we will probably need to change this format a little bit. Now `b4 am` is
complaining:

     ! Trailer: Commit: Matthew Auld <matthew.auld@intel.com>
      Msg From: Patchwork <patchwork@emeril.freedesktop.org>
     ! Trailer: Signed-off-by: Matthew Auld <matthew.auld@intel.com>
      Msg From: Patchwork <patchwork@emeril.freedesktop.org>
     ! Trailer: Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
      Msg From: Patchwork <patchwork@emeril.freedesktop.org>
     ! Trailer: Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
      Msg From: Patchwork <patchwork@emeril.freedesktop.org>

( it would have been worse if it would add the r-b/a-b )

I think just adding a \t on every line should be sufficient, but this
also seems unnecessarily verbose.  Can we rather add here the output of
the command below?

	git log --oneline --abbrev-commit --no-decorate -1 HEAD

thanks
Lucas De Marchi
