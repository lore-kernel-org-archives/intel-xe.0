Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05659C55822
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 14:00:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB9F310E166;
	Tue,  4 Aug 2026 14:00:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WSEmFZG3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59CEE10EA72
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Aug 2026 14:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785852045; x=1817388045;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CguUyPsm50sBAo8l52BFRpxGUcchj/IJmchE03p0EuM=;
 b=WSEmFZG3//1f2hviTWadx1xt6YdYEXOtgd8uZwpC1VdSB9eLtSV9Hxsk
 7NTlXlcZlaUz0JDMdR9SBsoFLKejpl4oBlG2YIToae+e8hvWMVvzWx6nm
 7TmZnv33GZIOOmGYORi0kLBST3hsEwjlm6TCCA5plj6AWPk2M07OqcIZ4
 5mH9ST8ByvFBhVMCkI9w/W9E5KJX1+/Wmlfp5JLTCUHzizbHT/bzbRHut
 SpJ//BhOfCdQth1yYlzeIQmJ9t90x0Pa9pS/UrbHB8GZIU8xp3NbOjG2Y
 EMz/AijWCe9/BQmZCzIa1W+QKBPRwMSc9dwV+OrFTpq3BYExOkeEH3F/a w==;
X-CSE-ConnectionGUID: FmuSmb9YSamFC6+P6P9WNw==
X-CSE-MsgGUID: 9YNar6AxQD6GmWAL9k4x7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86172285"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="86172285"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 07:00:45 -0700
X-CSE-ConnectionGUID: QB6xwWIDSH6Ikf6eEDwIHA==
X-CSE-MsgGUID: gqYeZPs2Q8yES5CrjqAaNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="262122953"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 07:00:45 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 07:00:44 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 07:00:44 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.39) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 07:00:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQyiyGVSyRDC1Wb0DcdM3yJTuet1e80ydAhnQXrgL4OqMsFEyLXmHweM6EQNzWDv+VZOJ7cefS/2+Q1DB/04w/OHtXxwvKrxs5lyfu6sZ5/yaDqdwe87YfBOsGyCXp1U5DBLOBNt+8btojrQQo2JpOugEx8M1565BWorPFmktOEDDLsS9irGmHMpjQq0J3T62Ch+rHdko9YvN2rAB3/QP7Zkv66XGoOJjJhDrnSRYdb7ADGbEHlB3shse3lwibP3RYEl8oqcafGFp8KS5qoUSH+S8JjyUBUrH/HjGRDrr1Gx1F7IMH0+m2bvP6KeAc/6162PyQgJqyCLdEr5p+nVMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LiDx0kZhtRpDKZwo4Bj+ac56YyLBeOHNKG6S4wVyiLs=;
 b=lMo6EdMTlT4dT9v4FHUQVcmLztrgzQmt3rRBWk3XucU+DyaL4BvnV8Uc13KJ5ncvfO3uC2h0YkDG4ACmRQ1bWuyaAVj9LENjjeL0gWwwAHi5U4psO7fMQ7BiR9pyEOTI5nKf2ZDsehnP5z1Dw+1qJO0xnZ0ZQ2rAAf9WO3/PYAIJRU0oA5hL3cffB8G2IUId0bx7VwhY86Uu3EnpakQ+RBSKSwJ1PdICwMt57nLPEUp377DfLsV2dK+hESSaZmD7enqIjHN8cATQ4Jq454CEEkt6IblZPiAna8YevyWYclrufXdnRZWrUSmMKDULb96HAsT/pUCE4MLIo1FYaOXXtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8575.namprd11.prod.outlook.com (2603:10b6:806:3a9::5)
 by IA1PR11MB7944.namprd11.prod.outlook.com (2603:10b6:208:3d8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Tue, 4 Aug
 2026 14:00:37 +0000
Received: from SA1PR11MB8575.namprd11.prod.outlook.com
 ([fe80::4d5f:58ec:402e:9e57]) by SA1PR11MB8575.namprd11.prod.outlook.com
 ([fe80::4d5f:58ec:402e:9e57%6]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 14:00:37 +0000
Message-ID: <a09c6d8f-f649-4874-a188-a35a0cae2760@intel.com>
Date: Tue, 4 Aug 2026 17:00:31 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] drm/xe: convert PCI barrier mmap to use xe_mmio_gem
To: <intel-xe@lists.freedesktop.org>
CC: <koby.elbaz@intel.com>, <meny.yossefi@intel.com>,
 <shuicheng.lin@intel.com>, <thomas.hellstrom@intel.com>,
 <matthew.auld@intel.com>, <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20260723161832.137153-1-ilia.levi@intel.com>
 <20260723161832.137153-8-ilia.levi@intel.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <20260723161832.137153-8-ilia.levi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0028.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::10) To SA1PR11MB8575.namprd11.prod.outlook.com
 (2603:10b6:806:3a9::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8575:EE_|IA1PR11MB7944:EE_
X-MS-Office365-Filtering-Correlation-Id: 8af78aca-4a0d-4cf8-9c0d-08def230c25a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|11063799006|4143699003|56012099006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ujLbUK461jP7IMJx8vY4KYCdDhMVJVWcBzBhP7mD7ELPhfKtq/xBItFdcSjC/Z9h1FDgZ5Du5MaG+ZId/elaxsoj5yrbvbZdX5H/sHYN2Se6DI3jOFyFEpRTsfAbuk/qenYHBmEuiAzfyIV5I+yS4u5zlB+8NqsYnrjEm32gednrkbdQNp9ozrkc7eqEDPo8W7DwyLuOY/nWj6oyVpKZvAUZT04e1ipgk/XWpoH/meiTPjpwX0JYAx/U9zIhBmkK1PsGVghQ4T7Qa3eGJMrUcL7VwtnGF7Xwi9NansX6NdM7frD9j86qCPwG3WvykUKAJHALy2B6fTTSI8BxoxPydPMABUM3oSJG2NAPnS3+15Jsv3aj2NnlpgjTPh2n7LR9dsX6n9CT3TQb8ol/Mx9iSeoVkNcDzq0ceBb81Y0w/eG+ov1Am8PdUKn3TOfC1P7V6zwB0JZaL4xy/0jIyMuYkvHkjYxw14GjRiqBJYd8KP03o3q0DRvtcQ9LRBabjs2YJzBlwPZ/rCwOOQaxwd1hndzcaPgPuTn2LERiqYbMcVuUE5FpxQ+mN4PcUx57JGvQNQ6xaWcQHOevYzAvjErYfA4AwqpWqfMoS0reiruUU7JV8oizGt56ahyrkiTErzvTuDUD3sYrvF+HtUE2DMtTHtn4PkiVvmHA8eCXEaq+50E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8575.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(11063799006)(4143699003)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eW1sTFZqUGNWd0xkVmNPMGJ5dHljTjVOb1JMYkFRd3J3K200M2VBMVRnQXFl?=
 =?utf-8?B?RC91VkNZb0FZSHozZ3ZsMDVzK3ZOYkN5a0ZUaHRlbE5UMEJHTlVnS3hwUXZV?=
 =?utf-8?B?dHliQWEvZ3BlNXlKV3BMMnlGVGN1VWxxeEU3YUZPbnNuSW9XeWF6alhvNmtT?=
 =?utf-8?B?UVJoL2oyblkrZzFFTHQxVUI3YkVzUWE5Y3dtM0UxenVDdGRsL2MxQjVTTGRU?=
 =?utf-8?B?NHJNNzR3Sm9OL204MFZOblBsbGd0czl1SG9wRzQ2eS81RXBBQUMxS1l5WExK?=
 =?utf-8?B?REhTYXYxYXYyc1NXNGFXTU10eVBFc3FIaFNnTWJJNThxR2JJZHRuTmtFYXMw?=
 =?utf-8?B?emlFblZKaldmZysva2FhSFFzOW5NODRrUVZOQWZmNUYycWNZWDI1aUtWZU4z?=
 =?utf-8?B?cTNHUitRcXBWVGd1NUZTMVNCd3FUMDRvd3RpWVlpRVdMbVUvZ0h2dW1VbU9Z?=
 =?utf-8?B?amhrSzJpMXQ1aG9ScnNpenNhN1ovOXNmSlpvN0d4Vjd1YVI3RWJsNEp2VXZG?=
 =?utf-8?B?SnAxQkoraGFQalpOZUZnYi9hT01DdmpOcWZXS3d0cHVsVjdEZjlWdmQvdHRt?=
 =?utf-8?B?MXQ4WG53OHFmM3dyQWdSTEtoNmJGeGNlTEFDczBNSThmdEQ5UW1YS1pYV1l0?=
 =?utf-8?B?ckFWZHhQNGEraWd3azVqZmE4dGRzdGd4ZFZQdzdzQ1haT0dVVFVBY3B2Rmg0?=
 =?utf-8?B?T2FLSUtQaU5yVjRlMURNTjI4YkQ2Uk1JeE5SQUV2L0I1TWFMQzFKWXdKSkR6?=
 =?utf-8?B?cjJWZlZYL3RBSkRRb3Y5YzJoUjVBaWJIdjBpWW1CVWFjRUlHREUxckxkVkFV?=
 =?utf-8?B?a2tlK2VXSGlxZW92YjhaT2xGWklQZjRUWExzR1N3N3lWa000dmtwaExFUkhU?=
 =?utf-8?B?d2cra0sxM25qOXlwcDgxNGpDV0tNN1JoQVBYbzJ1KzJjRGg4bGhhZG1JQzZT?=
 =?utf-8?B?ZnJDcnhRRmpqbXJJOVRuVkNSZjhqd3NKYmVTdG5va1l0bHFDcS91Q01CNmhN?=
 =?utf-8?B?QTBxT0UzYjk2M2V2cUdLYmdReGUwZUFuZUtlZGtDRzBSOXl1V0JWdTk2K201?=
 =?utf-8?B?K0N4YWJZRTZlUVYySjdFbDN2TTdqUVVpTktwaXZNVk5zUGk2Z3FOYnQ1ZUdO?=
 =?utf-8?B?MzlWMnBXdzhXV3dmVVU5dnhTRE9wWC9ualNaOUFqV0ZnNDdoeEwzYmZsM3h2?=
 =?utf-8?B?M0NTSWI5aG1MWGRnUlZHMy9RVVlaR2tYSjNWZlk2K1VQS2J5c1NDNys3Yys3?=
 =?utf-8?B?WStzc2RHZW1FUGFWTUxKcUsxWk81MDRzMUpvT0FxUUcyM0lxTlBrUlVxTmZ1?=
 =?utf-8?B?S0p0cmhJaTU5SHAwVExJN3pJYlRIaDB2NjVkN0VubldXWW1NVW1OTENkMkRJ?=
 =?utf-8?B?NlVURFdWQ2JnY3lTeEpXZnhpUlEvdnZPamtTK2M3OHRSSzBPbk5TaTc4WkE2?=
 =?utf-8?B?M0gybzJ6R0NLK1gvTXBmN2didWFLbzRZRkh5a3JlS2pDYkgwNW9FVjV0Tk1i?=
 =?utf-8?B?OXE3dE5uOW1VVTU2MXI3NmlQa1lQcHpWdThHWWl0RVZVSStJcXRsaVRiZnRi?=
 =?utf-8?B?M1ptM1ZPV3FtOE1LbGtyMnVpT1QvL0RpR1BYOWZyMTVQczBNVUFrN2lJbm1j?=
 =?utf-8?B?QTRDMk5DSjM1SGhmSWJTVFlDcnBMOWZGdWhzN3J1R01pVEhzemEvVDBJUnRB?=
 =?utf-8?B?TExtMTlBamFWazJKdEVFQ0dTOWxQYUEzZUVJZU1aakJuUDE5TTNuak4yakRy?=
 =?utf-8?B?dGdRdEoyKzBNVkM3OVQxU291K1ZqZk1aMUwweVpKdTgvdXN2VHgzaDZhK1V1?=
 =?utf-8?B?NllMWVJOYWpDSmlZemxEMlhtQWh0ZjdaUzBPTXBNY1V0YVBZbFdqek5UM3pz?=
 =?utf-8?B?amJMV3V2bThZM2IzSDVFaTVDZmI2TUZjWktrcngxZlJvcmFTVEZHQ09XbnVB?=
 =?utf-8?B?dElsdVN4NHpzNmhRQ3Jld3lRYklxNVdpMHp5dnBuaHAvYXRROW9mTk9sU3Aw?=
 =?utf-8?B?UUNiT1pkRUFweStLdDlIelRVaHUrVlBnWVJGTjFhemxkWUxkNjJQOTJWRm40?=
 =?utf-8?B?MkVVbzhvNFZWMEhVbEZPWVpIZkYyQitCcWhDUVVlUXlsbHEySG9IUHhkcm9W?=
 =?utf-8?B?TzVIL1VqMjRtamtDWkE3aktMN1l1S0pqWXVsdExUMjNPbzJ6d3ROTzM5azZO?=
 =?utf-8?B?RXFRNGNMejJUaTFzNTZPejA3TE14WHNubVhCajI3KzlQNHEwa0FseThOenVB?=
 =?utf-8?B?YnhMZmQzWFIrc293QzVGWVhMK3VrL2Z2dDVkYkQreGxPMVhyRVVlMEN4TndW?=
 =?utf-8?B?d2pma0NJUmdwWER6VGZpMmd3RW5wZEdYQ29WdmNkY094VHFWVVdvdz09?=
X-Exchange-RoutingPolicyChecked: QR+YWuJB1nT4qfc+ANdU+77Cz4Xhbrqh7C2thaJujV9qf5w5qTIw5b/70La2dlyBG5WpPKLnSF6JS9MPe1X5IYVtN3Y8LWJ30ixj6jqPns202EMu2gsWBYal1F7OYggukJ37KMZl3/rF2TCUDUGGQo9bmwCWbRJquXmy5hkxgHl+Pr6PhGL30EKgem5KjKuIkpPron2LUkwcRCDZy2N2ySor1jUifS1yXJQuXE+rvasixvVQ1tpgUOX6cRcFKlCLUCRAH0egAGd+vyuoP6niXGWAJ79I4XWJFWeyr2bYV3qINtM/5ql4vf12ZFOZT0y1CU+rjl19MjC5if2DOpGf3A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8af78aca-4a0d-4cf8-9c0d-08def230c25a
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8575.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 14:00:36.8645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aePo4KSNrAIdRcIwNn6iluRpoZOdt2cLfMjbv9KEktmb17TBPXbEDTC9ZM4TNLRjYhIwgupxXct8fA9dM3j5zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7944
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


On 23-Jul-26 19:18, Ilia Levi wrote:
> From: Matthew Auld <matthew.auld@intel.com>
>
> Convert the PCI barrier mmap over to use xe_mmio_gem, which is a good
> match for this functionality. This has the following advantages:
>
>  1) Removes a bunch of code.
>  2) Replaces the fragile hard coded fake offset design.
>  3) Adds the first user for xe_mmio_gem, which is preferred over nuking
>     it.
>
> There shouldn't be any big functional change here. From userspace pov,
> they still query the fake offset like before, just that now it is no
> longer hard coded in the KMD.

Looks good!
Reviewed-by: Ilia Levi <ilia.levi@intel.com>


> Assisted-by: Gemini:gemini-3.1-pro-preview
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Ilia Levi <ilia.levi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c           |  24 +++++--
>  drivers/gpu/drm/xe/xe_bo.h           |   1 -
>  drivers/gpu/drm/xe/xe_device.c       | 102 +++------------------------
>  drivers/gpu/drm/xe/xe_device_types.h |  12 ++++
>  4 files changed, 39 insertions(+), 100 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index c266fa6bade1..16ddbdf7628f 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -28,6 +28,7 @@
>  #include "xe_ggtt.h"
>  #include "xe_map.h"
>  #include "xe_migrate.h"
> +#include "xe_mmio_gem.h"
>  #include "xe_pat.h"
>  #include "xe_pm.h"
>  #include "xe_preempt_fence.h"
> @@ -3503,18 +3504,31 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>  		return -EINVAL;
>  
>  	if (args->flags & DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER) {
> +		struct xe_file *xef = file->driver_priv;
> +
>  		if (XE_IOCTL_DBG(xe, !IS_DGFX(xe)))
>  			return -EINVAL;
>  
>  		if (XE_IOCTL_DBG(xe, args->handle))
>  			return -EINVAL;
>  
> -		if (XE_IOCTL_DBG(xe, PAGE_SIZE > SZ_4K))
> -			return -EINVAL;
> +		guard(mutex)(&xef->mmio_gem.lock);
> +		if (!xef->mmio_gem.pci_barrier) {
> +			phys_addr_t phys_addr;
> +			int err;
> +
> +#define LAST_DB_PAGE_OFFSET 0x7ff000
> +			phys_addr = pci_resource_start(to_pci_dev(dev->dev), 0) +
> +				LAST_DB_PAGE_OFFSET;
> +			xef->mmio_gem.pci_barrier = xe_mmio_gem_create(xe, file, phys_addr, SZ_4K);
> +			if (IS_ERR(xef->mmio_gem.pci_barrier)) {
> +				err = PTR_ERR(xef->mmio_gem.pci_barrier);
> +				xef->mmio_gem.pci_barrier = NULL;
> +				return err;
> +			}
> +		}
>  
> -		BUILD_BUG_ON(((XE_PCI_BARRIER_MMAP_OFFSET >> XE_PTE_SHIFT) +
> -			      SZ_4K) >= DRM_FILE_PAGE_OFFSET_START);
> -		args->offset = XE_PCI_BARRIER_MMAP_OFFSET;
> +		args->offset = xe_mmio_gem_mmap_offset(xef->mmio_gem.pci_barrier);
>  		return 0;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 7ae1d9ac0574..82a4666ca51e 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -85,7 +85,6 @@
>  
>  #define XE_BO_PROPS_INVALID	(-1)
>  
> -#define XE_PCI_BARRIER_MMAP_OFFSET	(0x50 << XE_PTE_SHIFT)
>  
>  /**
>   * enum xe_madv_purgeable_state - Buffer object purgeable state enumeration
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 4eed9a251e65..3c59fe347858 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -49,6 +49,7 @@
>  #include "xe_irq.h"
>  #include "xe_late_bind_fw.h"
>  #include "xe_mmio.h"
> +#include "xe_mmio_gem.h"
>  #include "xe_module.h"
>  #include "xe_nvm.h"
>  #include "xe_oa.h"
> @@ -110,6 +111,8 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>  	mutex_init(&xef->exec_queue.lock);
>  	xa_init_flags(&xef->exec_queue.xa, XA_FLAGS_ALLOC1);
>  
> +	mutex_init(&xef->mmio_gem.lock);
> +
>  	file->driver_priv = xef;
>  	kref_init(&xef->refcount);
>  
> @@ -132,6 +135,8 @@ static void xe_file_destroy(struct kref *ref)
>  	xa_destroy(&xef->vm.xa);
>  	mutex_destroy(&xef->vm.lock);
>  
> +	mutex_destroy(&xef->mmio_gem.lock);
> +
>  	xe_drm_client_put(xef->client);
>  	kfree(xef->process_name);
>  	kfree(xef);
> @@ -188,6 +193,9 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>  	xa_for_each(&xef->vm.xa, idx, vm)
>  		xe_vm_close_and_put(vm);
>  
> +	if (xef->mmio_gem.pci_barrier)
> +		xe_mmio_gem_destroy(xef->mmio_gem.pci_barrier, file);
> +
>  	xe_file_put(xef);
>  }
>  
> @@ -257,95 +265,6 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
>  #define xe_drm_compat_ioctl NULL
>  #endif
>  
> -static void barrier_open(struct vm_area_struct *vma)
> -{
> -	drm_dev_get(vma->vm_private_data);
> -}
> -
> -static void barrier_close(struct vm_area_struct *vma)
> -{
> -	drm_dev_put(vma->vm_private_data);
> -}
> -
> -static void barrier_release_dummy_page(struct drm_device *dev, void *res)
> -{
> -	struct page *dummy_page = (struct page *)res;
> -
> -	__free_page(dummy_page);
> -}
> -
> -static vm_fault_t barrier_fault(struct vm_fault *vmf)
> -{
> -	struct drm_device *dev = vmf->vma->vm_private_data;
> -	struct vm_area_struct *vma = vmf->vma;
> -	vm_fault_t ret = VM_FAULT_NOPAGE;
> -	pgprot_t prot;
> -	int idx;
> -
> -	prot = vm_get_page_prot(vma->vm_flags);
> -
> -	if (drm_dev_enter(dev, &idx)) {
> -		unsigned long pfn;
> -
> -#define LAST_DB_PAGE_OFFSET 0x7ff001
> -		pfn = PHYS_PFN(pci_resource_start(to_pci_dev(dev->dev), 0) +
> -				LAST_DB_PAGE_OFFSET);
> -		ret = vmf_insert_pfn_prot(vma, vma->vm_start, pfn,
> -					  pgprot_noncached(prot));
> -		drm_dev_exit(idx);
> -	} else {
> -		struct page *page;
> -
> -		/* Allocate new dummy page to map all the VA range in this VMA to it*/
> -		page = alloc_page(GFP_KERNEL | __GFP_ZERO);
> -		if (!page)
> -			return VM_FAULT_OOM;
> -
> -		/* Set the page to be freed using drmm release action */
> -		if (drmm_add_action_or_reset(dev, barrier_release_dummy_page, page))
> -			return VM_FAULT_OOM;
> -
> -		ret = vmf_insert_pfn_prot(vma, vma->vm_start, page_to_pfn(page),
> -					  prot);
> -	}
> -
> -	return ret;
> -}
> -
> -static const struct vm_operations_struct vm_ops_barrier = {
> -	.open = barrier_open,
> -	.close = barrier_close,
> -	.fault = barrier_fault,
> -};
> -
> -static int xe_pci_barrier_mmap(struct file *filp,
> -			       struct vm_area_struct *vma)
> -{
> -	struct drm_file *priv = filp->private_data;
> -	struct drm_device *dev = priv->minor->dev;
> -	struct xe_device *xe = to_xe_device(dev);
> -
> -	if (!IS_DGFX(xe))
> -		return -EINVAL;
> -
> -	if (vma->vm_end - vma->vm_start > SZ_4K)
> -		return -EINVAL;
> -
> -	if (is_cow_mapping(vma->vm_flags))
> -		return -EINVAL;
> -
> -	if (vma->vm_flags & (VM_READ | VM_EXEC))
> -		return -EINVAL;
> -
> -	vm_flags_clear(vma, VM_MAYREAD | VM_MAYEXEC);
> -	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_IO);
> -	vma->vm_ops = &vm_ops_barrier;
> -	vma->vm_private_data = dev;
> -	drm_dev_get(vma->vm_private_data);
> -
> -	return 0;
> -}
> -
>  static int xe_mmap(struct file *filp, struct vm_area_struct *vma)
>  {
>  	struct drm_file *priv = filp->private_data;
> @@ -354,11 +273,6 @@ static int xe_mmap(struct file *filp, struct vm_area_struct *vma)
>  	if (drm_dev_is_unplugged(dev))
>  		return -ENODEV;
>  
> -	switch (vma->vm_pgoff) {
> -	case XE_PCI_BARRIER_MMAP_OFFSET >> XE_PTE_SHIFT:
> -		return xe_pci_barrier_mmap(filp, vma);
> -	}
> -
>  	return drm_gem_mmap(filp, vma);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 860ad322237f..8da3ff47be83 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -38,6 +38,7 @@
>  struct drm_pagemap_shrinker;
>  struct intel_display;
>  struct intel_dg_nvm_dev;
> +struct xe_mmio_gem;
>  struct xe_ggtt;
>  struct xe_i2c;
>  struct xe_pat_ops;
> @@ -642,6 +643,17 @@ struct xe_file {
>  
>  	/** @refcount: ref count of this xe file */
>  	struct kref refcount;
> +
> +	/** @mmio_gem: MMIO GEM objects for this xe file */
> +	struct {
> +		/**
> +		 * @mmio_gem.lock: Protects allocation and attach of MMIO GEM
> +		 * objects (singleton).
> +		 */
> +		struct mutex lock;
> +		/** @mmio_gem.pci_barrier: MMIO GEM object for PCI barrier mmap. */
> +		struct xe_mmio_gem *pci_barrier;
> +	} mmio_gem;
>  };
>  
>  #endif
