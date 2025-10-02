Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00EFCCAC5B8
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 14:40:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF61110E1BB;
	Thu,  2 Oct 2025 14:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SCscSreA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A465810E1BB
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 14:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759416027; x=1790952027;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xyjmgvI36YYMtr+kShYlLiu2vQJPDfewofzE/hofbCI=;
 b=SCscSreANOp06ioPwNwQyEjCIgyTTOIo6GahGwIp0YlUIvDIcf6x6op6
 fwV6+sYsNMtWLXc1gbxas8siMNPpUYjSrp5T5G6Knp4KIVJisBhzRFpdh
 SHu7CcR01ndHCTF1JLa/Ni7PKSn8U+Ypeo2XBcjlsd+e4bvNck8aRZoUY
 nZQopTKKw7UwQS+gGnb9w9Ug6DE564wBcr5nzGEHDa4lR4fzaw0FMYaTY
 XNCuSGLSAzJCbTOn0Hty2ZmAaNE9s1vBaWjhcxIKQEvj9FkqxKy6K0x0+
 Uh/vEmcGvOjCe17fkhmCke2Sa2REsDJKiupuA3SdMdX277YYDY3bq6Pc4 w==;
X-CSE-ConnectionGUID: oQ1gqNFwQoyZVxJ0pyV9FA==
X-CSE-MsgGUID: I37ARLpAQmqr4mRRNGBzcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="65338551"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="65338551"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 07:40:27 -0700
X-CSE-ConnectionGUID: U2O+RDTzS5e4tV1XiNhMnA==
X-CSE-MsgGUID: JKLSu7pQTPi6skSXkhR5vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="178666125"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 07:40:26 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 07:40:25 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 07:40:25 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.51) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 07:40:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dt2Sl0GqYjzqHUVDfhC4nTMhpJ7x+GAWKjFXU0o3E1BB1EdfyQe/sTWs9gH1X4x+DktsTrAfI27QE2vVSB2Fggdo/OeX9dhSemsA7Pl3ff6m4zljlzbALBux9l+lWhwodtp8DEmISDY0Qr93uEqFVfksemiSbRhkcS0sMGnnQcpEjdMAb3kyDfamugS/kffo0aigDqWzik0jkZE4xrP7HQ3zC7kdmxuDBglkzXLZudqMVHDlzp2MCUT/Kzjaw6neJX1k24eR91covIi4wSqHF42DfE2XpvtX6QQl4Phlv3SPnWNez0WSBCHdyY0oXOA6llAeR06DILvxFkG9hTGThA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cff0O6fW9ybdXlSsduT79BvOUIj1Wfku1/yY9ZugVnU=;
 b=J0stT5uzrtOuauoZM7V3Lxtzp9YtY6FXzunJQQEeiuzoO8pEx4uUPPbGSeRvKFY6cNmv8sWuEWJbdgloG/Q9WQ5voRiMdXPYpAcdG26MaoqNleJr+XLnjzFHzYt80j0qXr8ax8GUa979hpr/ngY0jkvdC9hHDuM6IxFjxMc6OT5OrFlunQCOhZ2lbbeJX7FLted4v+OJS9COyBDikF1GSz2eozxHWWu4nmaiqhG1IPMOJaBW3nGoEE1QtFv8K2pf9ByEVe1BEjwaP5ZojzvSA9i6vIxEhzwpqG+W1LBRDlv3lG7p9NwqFpRqsuTBfIlJgL7IxspZz5FRp7URT1oMBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by LV3PR11MB8529.namprd11.prod.outlook.com (2603:10b6:408:1b3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 14:40:21 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9160.018; Thu, 2 Oct 2025
 14:40:21 +0000
Date: Thu, 2 Oct 2025 10:40:18 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jeevaka.badrappan@intel.com>,
 <matthew.brost@intel.com>, <carlos.santa@intel.com>, <matthew.auld@intel.com>
Subject: Re: [PATCH v4 1/9] drm/xe: Add a new xe_user structure
Message-ID: <aN6O0jf83Z4b-vYE@intel.com>
References: <20250926104521.1815428-1-aakash.deep.sarkar@intel.com>
 <20250926104521.1815428-2-aakash.deep.sarkar@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250926104521.1815428-2-aakash.deep.sarkar@intel.com>
X-ClientProxiedBy: SJ0PR05CA0069.namprd05.prod.outlook.com
 (2603:10b6:a03:332::14) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|LV3PR11MB8529:EE_
X-MS-Office365-Filtering-Correlation-Id: e2f633fc-c8bb-4447-b12f-08de01c19d5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?wEczxt5twpFk40mtFV23PA6y0fR4cPZN7ycnUhXAT4ecqNTzoPhXQb919m?=
 =?iso-8859-1?Q?ogKfibNKKW60gjOWm5TolqYlowmVDgo/IKCYCOfa/JNHR5cbQP8StLRwOF?=
 =?iso-8859-1?Q?FSNONZ/0e2ExPEheyW/5RzZqAHMKPwS9JX4DGuiHyFtltlrAf+xt9uZNac?=
 =?iso-8859-1?Q?BqCvojHIpREsP0gmcBrM6CpG5LaWND+8DuY1/far35qdWAr+QBtBMI59EW?=
 =?iso-8859-1?Q?E/6NrGj6gA7N2k08zgWbNqhTDgAZL2RRSWQSresG64OSyJz3tj8t/uRkL8?=
 =?iso-8859-1?Q?27odhLa5bcYYRfe3fITnK/Nabl2IaHnI5oUKReoyQU8IptOO64ygLIm8NU?=
 =?iso-8859-1?Q?fILjwYYUNPQkuorQn5Sj9YmUuX56UiEJDhDj41CsgBsvyfLNN6dEwPBAAW?=
 =?iso-8859-1?Q?5DG+ff/4rdbgOKL2mNmMgouxyKKfR7X3NeBuSMxkI5z/fWl5zWZwGaVgUa?=
 =?iso-8859-1?Q?77FjRQcQX3/lAv4gNSQvT9PVnPHcgMdE8l3ltvuh7D1wmQHEmLOva7Sqr/?=
 =?iso-8859-1?Q?xIHylbeBfBHixA7SM4XC2c3RRZ4GbtIJa7wsCZtOOuZ8iuGBQPMX+qKKWa?=
 =?iso-8859-1?Q?WGg+LLRSM5O9SQE73o8SR2eip8v9nB+26F7dSmnnOejmU99l2xdAiX4OMu?=
 =?iso-8859-1?Q?0DOyFzhf7WDcR3XaErai63pE/XAHcmAu3nPsarqCCm2LiASbLDbvbCLn2x?=
 =?iso-8859-1?Q?kQ+TKCkoE88Sj6ukZUXa07OGHiC3R5EyunLwDqmuvBBfhVqnqYnLOWL9EI?=
 =?iso-8859-1?Q?A2IABn7clfALF81wNvP4CylJCrTx38DbH+4hscMe4QJfbfZxwWXkSPErtt?=
 =?iso-8859-1?Q?84Fg+v8dXWXCyhQJ05dMw1P96FevuqR3q3Ry3aUKrPegG6SL9hRTLA2emg?=
 =?iso-8859-1?Q?S257Dfz7CeSvHep2zDh2GJmAzZdp0VneIaQr3C5geoO82cyD8xJmpdnOVP?=
 =?iso-8859-1?Q?lqX+hf9QxRM8K1E9rN5UftH0K2QxEIIWRp2PJzZR8o/RF9sONgv7XKxqT4?=
 =?iso-8859-1?Q?yctxxM90KgJucuXaUe7s4g25zTHw4snzzMmrGdnQLzdM8E7Ltp3DI9QPeU?=
 =?iso-8859-1?Q?kxDlfGEOnaRw/jdtmQeJccN0YFPPSeS5P0GQItbyzCGgZhCj4ZiLPHADkQ?=
 =?iso-8859-1?Q?lgjadVII8DHJoTTQsWmILLh/y5HkqAVcXg4OFw8uEgRhSx9lmZzEoPkgFm?=
 =?iso-8859-1?Q?T8r4q621oxp3z8o45SOpJsD5Ij3g6J7bjH4qj6A3D3YoJtLaQWqQLUJDAH?=
 =?iso-8859-1?Q?6hyG4x6p+Rp1bMGLgfXsv8zJNpaIY4W+VblqLDecdDpmg3S0vTWnOavDEs?=
 =?iso-8859-1?Q?DKX/aMLLtA/rNuIpIE799nwEzuke8jSsokpQ7sVRE9flkDOZxSlzhqkY6J?=
 =?iso-8859-1?Q?DahHdACRHoErDjw5Fd760sC7/BFHFVmwigkqZbBqbFmEC5z3tdRySFYIT8?=
 =?iso-8859-1?Q?P9/mRPQcJEfULaCz++rMOONnxKcYojqW5wdurxEQGu5nGVyjvZbs5595Ih?=
 =?iso-8859-1?Q?cZi69CXwLgLTBY9l750fTJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?K79xffOhUUHXtx2NYPZ6l986oKrzSXyvhi3uu4JHgYujBubWoA4jIi4Qz1?=
 =?iso-8859-1?Q?jsB7ZeBYbB/fwzoHpu0GRfs8fsdQL9RxHg80I2Kf8dT5eS2Du1FUG0scyH?=
 =?iso-8859-1?Q?u61/uXquO7Uv5vx6zLnV8fsxTTxQcB35N0MUl2okQ0l8Vi7doaacIw0Jmf?=
 =?iso-8859-1?Q?ZHtSIyLh0jEo9aJAqQRymCNPNSEBty7xBFYu6pddk8HFZ37hg2ihXM+xvD?=
 =?iso-8859-1?Q?B+ytcgfOjfDKI958zeIsjjs4PD3FfUuKvRQEYkz4+jaMb8qjIe89LA24ZG?=
 =?iso-8859-1?Q?rHszlZ1rAQZC8/xrrgNbpuHzfnXm0qld0z20heH0ZkWKWwOHWBZT9zXhfW?=
 =?iso-8859-1?Q?L94WRJrf1ColpTShvZ80bR0wJ7qXX2gaauOM1UfZT/QDnRMYtvUc96ylje?=
 =?iso-8859-1?Q?oX8ZWUvueAbyOuIWbEja2PQsmzaLt5oA55RyvnQdq3tA7YtRLS+VZiRvgL?=
 =?iso-8859-1?Q?5Qaz4J/6gaS3EnWMZcV9my1bxdYbbHTjkMYdawzhnjaSf1xhJ8yS3wflxl?=
 =?iso-8859-1?Q?20znbskrU5FxSPA+GtQCNp3JQ9NEg04+M43snEuKnkfwIBwOfmvlGQR3Vl?=
 =?iso-8859-1?Q?3DuPeMA69jJPPWdtul/yY3azDmZArchgnd+PNtQ5Q8ENCs+wf6/qflJzUK?=
 =?iso-8859-1?Q?KCnlrHDMuncIrEGqYdXeL8TCf0EhdTw2rVBT/ej20jEgmpAtsfs+xMgMSn?=
 =?iso-8859-1?Q?BaNzo3nMawE7EQhgrVhYQkLXIwNxOZi8wdNxY/+AByKxk1Uv/tug5T8kvu?=
 =?iso-8859-1?Q?E/C4damrlnub7f8Jjp5/ztQI72vgz+IoJEWjyZJCC1FMHngeX5asnclzoW?=
 =?iso-8859-1?Q?3KLvwcNbKYTcEZqzhpp7QcJKQJt92KsfFUSNNuybm9yxhKxYJ+ZTuO22yu?=
 =?iso-8859-1?Q?FeKH+eyXM7i9LOTDj0YQHilwe9P0+DYPL21rlLhEvAmFkkB1M/ELKSVs68?=
 =?iso-8859-1?Q?ANON6wWVpFpLT3HOh70tvntkDGI7a6+eb5LIwHszFx3Kdi8iKmtUV7JH6P?=
 =?iso-8859-1?Q?bMXrddRmPCxjEC3o9XcIdW6eoUSRCxxOSOnKYNQl/fPHHVdGbAgHbxzYIK?=
 =?iso-8859-1?Q?E4C8qKThLRA85soSlhh4pRKuLkaSmo+439gwfaBPJ+sfw/GczrE0rt17Zq?=
 =?iso-8859-1?Q?uPhDdim3p/TjQRLlxqhqraRq+aIiOb/2ek+NT7OSNkM9scnk5LDiKP0Kmk?=
 =?iso-8859-1?Q?hddEO5i7Eg4fm7llrPtI1Cf3vXOF15O6C6F6u6nT2YWl2cKBRtk6OUZk6C?=
 =?iso-8859-1?Q?bUh+NCQZCl4YIopxAWpRdQ1Rg0eTI3hpYfA+XJ6RlAqO/BK0LAbFSuhIyJ?=
 =?iso-8859-1?Q?qH9R6Hsc4sEeXIOe0t0hl2qb6zFefF3P0lkjiLSWlEaBCQPKo3EBXG0Ujj?=
 =?iso-8859-1?Q?se4PgJnYBBfr0QjYHh6KyItNNCJFyCWMlUGeRm71RVVjJVVKdnMk+BqEMh?=
 =?iso-8859-1?Q?V/OA8GY5xK90y00m84yY9sQk1OuIvfQZ0CS4coorhimh3MCb3J7nMZMxNr?=
 =?iso-8859-1?Q?6t9ETOIz6vk7D69CMBaESCzsRBllglbRQRSHJOLNl2/0Is8WSzlV2i3PWt?=
 =?iso-8859-1?Q?7IcuHd451x4gcJOO31L2DwYRMX87ogYU+qn7rzMtG3PEg42ZHTkiTMzVsb?=
 =?iso-8859-1?Q?geO5jIHDxjjXMyf6B+MeznTWmSDpmItzB2eSn2dp8NlOCoZ8tMu+vynQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2f633fc-c8bb-4447-b12f-08de01c19d5b
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 14:40:21.6095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IBlRm2aOxpJMeYzSmsmHEqbLZAkXFQEXNfrKYrF4NjGktqvchwAkbkDaQDwy7+Aud2tWUu/sAQIx7ALFizPZiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8529
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Sep 26, 2025 at 10:45:12AM +0000, Aakash Deep Sarkar wrote:
> For Android GPU work period event we need to track the runtime
> on the GPU for each user id. This means we can have multiple
> xe files opened by different processes/threads belonging to
> the same user id. All these xe files need to be grouped together
> so that one can easily identify these while calculating the
> run time for the given user id.
> 
> Currently, the xe driver doesn't record the user id of the
> calling process. Also, all the xe files created using open
> call are clubbed together inside the xe device structure
> with no way to distinguish between them based on the user id
> of the calling process.
> 
> To remedy these limitations we are adding another layer of
> indirection between xe device and xe file. xe device will
> now have a list of xe users each with a given user id; and each
> xe user will have a list of xe files each of which is created
> by a process that is associated with this user id.
> 
> The lifetime of the xe user structure should be between when
> a process with a new user id has opened the xe device; and when
> the last xe file belonging to this user id is closed.
> 
> Signed-off-by: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile  |  2 +
>  drivers/gpu/drm/xe/xe_user.c | 59 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_user.h | 81 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 142 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_user.c
>  create mode 100644 drivers/gpu/drm/xe/xe_user.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index d9c6cf0f189e..ff6b584f3293 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -333,6 +333,8 @@ ifeq ($(CONFIG_DEBUG_FS),y)
>  
>  	xe-$(CONFIG_PCI_IOV) += xe_gt_sriov_pf_debugfs.o
>  
> +	xe-y += xe_user.o
> +
>  	xe-$(CONFIG_DRM_XE_DISPLAY) += \
>  		i915-display/intel_display_debugfs.o \
>  		i915-display/intel_display_debugfs_params.o \
> diff --git a/drivers/gpu/drm/xe/xe_user.c b/drivers/gpu/drm/xe/xe_user.c
> new file mode 100644
> index 000000000000..8c285a68115a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_user.c
> @@ -0,0 +1,59 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation

2025

> + */
> +
> +#include <linux/slab.h>
> +
> +#include "xe_user.h"
> +

Please add a /** DOC: 
section in here explaining the xe_user. Mostly adapted from the commit
message above, but no need to mention Android. Just mention that this
is aimed to track different users, like the message explains

> +/**
> + * worker thread to emit gpu work period event for this xe user
> + * @work: work instance for this xe user
> + *
> + * Return: void
> + */

no kernel doc in static functions


> +static inline void work_period_worker(struct work_struct *work)
> +{
> +	//TODO: Implement this worker

Perhaps you should not add this stub here and wait to add in
the next patches along with the implementation.

> +}
> +
> +/**
> + * xe_user_alloc() - Allocate xe user
> + * @void: No arg
> + *
> + * Allocate xe user struct to track activity on the gpu
> + * by the application. Call this API whenever a new app
> + * has opened xe device.
> + *
> + * Return: pointer to user struct or NULL if can't allocate
> + */
> +struct xe_user *xe_user_alloc(void)
> +{
> +	struct xe_user *user;
> +
> +	user = kzalloc(sizeof(*user), GFP_KERNEL);
> +	if (!user)
> +		return NULL;
> +
> +	kref_init(&user->refcount);
> +	mutex_init(&user->filelist_lock);
> +	INIT_LIST_HEAD(&user->filelist);
> +	//TODO: Add a hook into xe device

probably better to not add the TODO things at all, specially
if you are adding this in this series.

> +	INIT_WORK(&user->work, work_period_worker);
> +	return user;
> +}
> +
> +/**
> + * __xe_user_free() - Free user struct
> + * @kref: The reference
> + *
> + * Return: void
> + */
> +void __xe_user_free(struct kref *kref)
> +{
> +	struct xe_user *user =
> +		container_of(kref, struct xe_user, refcount);
> +
> +	kfree(user);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_user.h b/drivers/gpu/drm/xe/xe_user.h
> new file mode 100644
> index 000000000000..e52f66d3f3b0
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_user.h
> @@ -0,0 +1,81 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation

2025

> + */
> +
> +#ifndef _XE_USER_H_
> +#define _XE_USER_H_
> +
> +#include <linux/kref.h>
> +#include <linux/list.h>
> +#include <linux/workqueue.h>
> +
> +/**
> + * This is a per process/user id structure for a xe device

probably not following the doc standards here...

> + * client. It is allocated when a new process/app opens the
> + * xe device and destroyed when the last xe file belonging
> + * to this user id is destroyed.
> + */
> +struct xe_user {
> +	/**
> +	 * @refcount: reference count
> +	 */
> +	struct kref refcount;
> +
> +	/**
> +	 * @xe: pointer to the xe_device
> +	 */
> +	struct xe_device *xe;
> +
> +	/**
> +	 * @filelist_lock: lock protecting the filelist
> +	 */
> +	struct mutex filelist_lock;
> +
> +	/**
> +	 * @filelist: list of xe files belonging to this xe user
> +	 */
> +	struct list_head filelist;
> +
> +	/**
> +	 * @work: work to emit the gpu work period event for this
> +	 * xe user
> +	 */
> +	struct work_struct work;
> +
> +	/**
> +	 * @uid: user id for this xe_user
> +	 */
> +	u32 uid;
> +
> +	/**
> +	 * @active_duration_ns: sum total of xe_file.active_duration_ns
> +	 * for all xe files belonging to this xe user
> +	 */
> +	u64 active_duration_ns;
> +
> +	/**
> +	 * @last_timestamp_ns: timestamp in ns when we last emitted event
> +	 * for this xe user
> +	 */
> +	u64 last_timestamp_ns;
> +};
> +
> +struct xe_user *xe_user_alloc(void);
> +
> +static inline struct xe_user *
> +xe_user_get(struct xe_user *user)
> +{
> +	kref_get(&user->refcount);
> +	return user;
> +}
> +
> +void __xe_user_free(struct kref *kref);
> +
> +static inline void xe_user_put(struct xe_user *user)
> +{
> +	kref_put(&user->refcount, __xe_user_free);
> +}
> +
> +#endif // _XE_USER_H_
> +
> -- 
> 2.49.0
> 
