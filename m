Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A93CA6002
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 18:27:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DAE010E2FE;
	Wed,  7 Oct 2026 18:27:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iYz3vKny";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 414B710E2FE
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Oct 2026 18:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791397656; x=1822933656;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YBLAwEq5Et5f0njbie1TOPSIFzFgBpaGS+x8Qw7zwxk=;
 b=iYz3vKnyFxeW44I0ZFphGsej4OXdxx6n6NHtsiO1mjFV2Ep38oqKuyjs
 zIdJM9Gcgb+KYffa7NdtAT/h7b0Ke5tUjVeCbUpCar3kHWYK9AzPFbi5g
 0+P2cgBFKFFhvYVSkQ2MXowP/5z/V1XIs5mjaxj8qsFIlejgV4K6EofxY
 54IY82vxIkzSdy6byXYpfmlGVdqnso9dt6s3nNpqZhP5+SY/XWbMcDwKT
 f7NZUHQvNy/9Oo5yGFUu523fvE4QEqUCOja+rXxnJKTO6Tll0oZ0lETM+
 EbqT5DSd8ECfcfuTRz0L+rzXGktpfLPJdLafWzyDLZ+r7JBMip0FdVyfJ A==;
X-CSE-ConnectionGUID: oej3+0O1QJ6PBn4f9VhNmA==
X-CSE-MsgGUID: FxxMbD5KTVSuEL39Trcuww==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="175411"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="175411"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 11:27:19 -0700
X-CSE-ConnectionGUID: ZseXQSVYTYij8yWNVmCOYw==
X-CSE-MsgGUID: 7qljSRx6QUWJvpttZ/Bp4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="238345"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 11:27:18 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 11:27:17 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 7 Oct 2026 11:27:17 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.15) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 11:27:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UIZLUl5x0xjaccWtXqbZzD7hpgPPbf9ONLRoFvNCrmArCmi2jw0UsHB4eXoP0pmj4xH3a9fZU0vyUmvfe+NIpTrt+X0ORC5cb45SOrGMgWr7WoLJElVjvrZpLR77QN8IHRvP7stelQD/UrXG5+2IRLMUMz5q4vZ6h/y7bDrCywoe0lQhECJWKGKigYYAddOKJZQbNFfAIsTqgPr14lofnFKfX5cwYPRG2+6j9qUF3zAUsZd/65uk+ArvwJjnvCJrhcPRq5qxlOlfif4V3U3RN/TF4/9ITmKGrJ5k7gQhqBZ12klF6w89YskURMIf/fqvFKVe6H2DOd8Vom/699G12Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1GwvrzWDbmEI68JGdLCVb9YqfCNASt3pVleTHdUTubQ=;
 b=V8ZellKP2ek/V9dJP37/EIPyC7WZJoyYMjWRHKbWAUTW6+ogiwFCrRz/0WzJM2wfqlZjYp1qfwsB1Oufi61RKT1kxKPIEKvfxXC23AwRwsOxt51Uha98FoA6bqSwHWYO9Sm94v4gIW7UxpQAJxydyj7Eyrk4qfTaEzZIKceaE6360qikW5kqPMD/CRPDeV0xGGrA/FAqrWK6JJJsFOgUdMqg0SK7snXB8jWnKJznvuQr/OT1RAr5OBx/NaObr/PJFtPwatcJo7Ac/zUR6Vc391gGJzYIRjQt+SRpNpRYrq8y/evddfO8K0W1hkGh2L1gcx0yxhcmxV/nKttdEYENWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by DS6PR11MB425752.namprd11.prod.outlook.com (2603:10b6:8:528::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 18:27:15 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0451.026; Wed, 7 Oct 2026
 18:27:15 +0000
Date: Wed, 7 Oct 2026 14:27:00 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v8 14/15] drm/xe/hwmon: Add CRI PCIe temperature sensor
 offset
Message-ID: <asaO9L1vpnNXmAIV@intel.com>
References: <20261006033534.3583967-1-karthik.poosa@intel.com>
 <20261006033534.3583967-15-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261006033534.3583967-15-karthik.poosa@intel.com>
X-ClientProxiedBy: SI2P153CA0033.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::21) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|DS6PR11MB425752:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b0554bf-c794-44c3-0299-08df24a09c46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|22082099003|18002099003|4143699003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: e3FooniqozVuRVZGTCroQefN55V5nZu9o2N6hNhLngWf5mIFvLhWYQYJvtkgbrAdovsGEeyXrZwl5Z6b8bb2S/HveZz5AU+lxrknWSUjMnKMJusGr1RDSnma1EmeX/OVie0zEYZXdgPjcGgPkSnNdYf20VsEKYg6J43ylp7lll0Ln4STcdD+vyBZcVmu/Ox6bvJ9C0XQpxMATlssVVVrxYIR8kiw1jCIbhLst9PfC+cOLt9Tm+3MDaeaPP8gz50bZQbL2vcKvsG/UWKpQ7uOF1wjXWmY/tsnubeiUdn/g0XwWPvvh3bg1rCL0pyayIy2fZXZjUExt25Q73NsFOQEPOAP07Mv0Dttz3gTUIA7mdGACq8ELfLGQ2ixUdb0Fsf94Yp0e9L5OHLAkT4jqDSjSb5m9bDRp/QMVJA4ftPKHA4br1xKb20lmkjFldIHfKW2QXWH1sPAIIYyHtA68xr/tYaDtVrA/vwN4lR/AL1/cVWO+/Lc/8MdB/W9XFbNpwGsW1sSFgScCwb91HSo0ikkFX2evPU/SRiAG6TTbsKE3jSiCMUB8FxSNBtU3aQ4YdydbKII5absfBauKqnI/wb2SV/xUOmq08VkLwQvBJh3SKu3vdfFev6155U39/OXJFJlLspVnBS8DnP/Hji2EZ/qGp/NZu0iLnVY3NNHzBl69DM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(22082099003)(18002099003)(4143699003)(10067099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z7llbZ4+/42sROSjUBrTxKxtdRyhYUOn8mNlYgsUsyVMy60J7XZ9guufRGuD?=
 =?us-ascii?Q?J01G5KIM7ItWeG1vdOkkWbtD2AMLB1q57T/Dvft2KN5beY6CUfP3bk2MU6ko?=
 =?us-ascii?Q?Lp3+KXtAHm59/9hWkW1xkGpSJ0hQIMiJm77IejUTaA3MN6jwRcSsrNTD1eMp?=
 =?us-ascii?Q?XJaQwAmbYhsXsIG4sL1H9gnCWfH/2MwtoSOZV3BoTWNn2/gO7cOR19i8hiD/?=
 =?us-ascii?Q?cZ1sxBmZSHdZWSu/wec5YIx3j/KpBBumLEjQMGrZHJfejS6FuBUgXD6G0Phe?=
 =?us-ascii?Q?OsaLtAZj7rWiw00O09TtbcfjKaxWvfgkYvMeb9ni9fjOhF2swE7jM9ANFWAX?=
 =?us-ascii?Q?CpLqkYLViZId4PcaesuOnyOr+PmQ/NlcnRbT1dw7i8kFjp27Yc32AlM984jO?=
 =?us-ascii?Q?9js9zRrenX3RKx1QB0ugNtg2EgEefSYMU7R04D2R9j6+7d5QRGk3lQqpvqXS?=
 =?us-ascii?Q?ugQV6eZ7R6jaVdxYuOvxIJfjzrOXXaITOKP62TMCgihu4wPOnUVDRrEpZkYr?=
 =?us-ascii?Q?ZY44TdOUcBsIdyCNq/pAaeO1Sd4ffAsCG2BujkBF8FLpAe7YNfCYLNLY9OUk?=
 =?us-ascii?Q?n+qZQBALTwusSaP+Zc01G8jMRKAqCRQIWcUlUdNw7qYETT5K/3XHqnp/f7vc?=
 =?us-ascii?Q?XCk6/Z93GN+0pZUbxCEsKl0ZVrXPY1xEfHZ9+1cHDFiojPUBefuhpzBSeKAi?=
 =?us-ascii?Q?VVcxeus2y7xBdwxMas+wQPcq45DfBHXrXWLgYiqmv8SvSHksZE7szMrA/KHx?=
 =?us-ascii?Q?+8Hb6pdLQ9DPdWbLi0Jxoj3ksOq25G/EiSeyktCF0dwfGJ/eAICW5JqyioiX?=
 =?us-ascii?Q?/xU+XetnOQjkSlSqC9X9Li10g/Mn5/EVlSGY5TYax83CsYCxHGopnu1KE6OG?=
 =?us-ascii?Q?FDSoPyKmjk/v6zi3oxwHt8Q0r5UdbQNFt38/WgBTtPVyFP44Mg4iwkVEeInh?=
 =?us-ascii?Q?TAibC7gvqSKUbAfTHqlAOZ5vZo95fYaOh+0bJLLbB3ThvZYnXrYi1DqsHDUP?=
 =?us-ascii?Q?dbrVeqrkl2MXfWUZbUIIz08sSCwIiLj4HJ0FV3ljo3cxxqDWKe5rqTGhk6cC?=
 =?us-ascii?Q?3K4RSzQSPKluxfKNmmOa0fhsMffRJhfosASdatjbpAdfjtQfVGJiUK9TOAam?=
 =?us-ascii?Q?t6iMSvbybvhYwOa7ATi4Xg2wBWxsD49PHzKG259JboYw9DPnqDWvIBK4V37d?=
 =?us-ascii?Q?Y23GOriHT++Xcbs80cJvEqYqWtK3thlvwe8GQH4f2Gvfmq3vvHk0bB2Uoc7L?=
 =?us-ascii?Q?QfRy3tVsrXwhmlssvAZRwj0OdH1smcmvwhQSjD2+T2lGF4AfjDbZLfcEq0rF?=
 =?us-ascii?Q?ToNM/MHwz8bjmSge5byKd9MKKIZSM1TjUd/Y9cA7+xPwIQQ2ggjJKGwc6uwx?=
 =?us-ascii?Q?dKcQZVhpcOTWDzOC4EEOghXhm1hCorAj7NOgqV4VyItNgAjCbsfgb9oUyeoC?=
 =?us-ascii?Q?N+kl7W38Aq0iTw4oEX+kci+ZDdnQQsWxWsKqh5shG4ekCG2ipdkro2v/YVtd?=
 =?us-ascii?Q?nmWG1WwHloVWuLAJqCugPW0EqEN9CxYhF7MVzGHAPXQdTBApYcxIQ//Ndg+3?=
 =?us-ascii?Q?37TMMkvWQU+xvET2pPOXal413yQumPJ22imS5YFseiamwP+/Eel9MmoYqInV?=
 =?us-ascii?Q?HlLQA9XhWnoXbEXtDAfyEEapKFfwPpAQd5y8RaCyolZgh8NqUceRgvXrvqUL?=
 =?us-ascii?Q?uZP8/VE+7G+PqoZ5Ksl+4Trg9GLI1uix1qMiV3JVqcmQ/YnMjg39F22KI/b1?=
 =?us-ascii?Q?MpYZyA17pBVVq3qi28qVEjRbjfMvk2Q=3D?=
X-Exchange-RoutingPolicyChecked: B8QaBfzNAnvgefw4WAaAJ2Q63hWmhEimUT41mzAlx1MG9grLCBUfezkQ/qiYYyHmT0QPDDENi3/oBQB6gop8nzXnUGYhm9OoOcuF644eBfeMpMzLNgc9L7Hv8EA9hDkOv9yrWLI6vaRWtDYjJ6pVVYSWmpJikpr0GQGJ+MQLwtY/sV8OTPtMEw9PgHsr07Hyk/Pgd09kln4Lxv3+nyLn9nFI0FAhpgwT59Z/LzCHsR8l8frqx3M2bZUZY6CU0YVUfQKJ5Gdz54nbcYivIG8abHUO8rzqmOpK+srjB2oZdQseUY6iHVFforbdSZnM6fCih0fkGVITusPBKb5KgH4lbA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b0554bf-c794-44c3-0299-08df24a09c46
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 18:27:14.9540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qj8VIemgryod2Hu6QuW+R7qnKR2ULD/nBTtggm0Nbk5JTsxTvI9y52BW3frluPxKFwM5SbZgx1MHlV89tBui3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB425752
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

On Tue, Oct 06, 2026 at 09:05:33AM +0530, Karthik Poosa wrote:
> Describe the Crescent Island PCIe temperature sensor at byte offset 20 in
> READ_THERMAL_DATA.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 1cbd49933b2c..c7ab7b1abd25 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -482,6 +482,7 @@ static const struct xe_device_desc cri_desc = {
>  	.has_i2c = true,
>  	.has_mbx_power_limits = true,
>  	.has_mbx_thermal_info = true,
> +	.pcie_temp_sensor_offset = 20,

wrong place and bad name and it should be squashed to the previous patch.

But also, please disregard the rv-b that I gave there... seeing this again
this is a bad naming... I'm also bad with naming, but pcie_ as a prefix
seems something related to the pci spec itself, what is not the case,
so we need something different....

>  	.has_mert = true,
>  	.has_pre_prod_wa = 1,
>  	.has_soc_remapper_sysctrl = true,
> -- 
> 2.25.1
> 
