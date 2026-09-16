Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF45C88E77
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 13:23:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62FE410E0FA;
	Wed, 16 Sep 2026 13:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dP5PYfaM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBD610E0FA;
 Wed, 16 Sep 2026 13:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789564989; x=1821100989;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3emol9ePIZdz4zBLgnEHWi4pwLHrLWx626bCtIlki0c=;
 b=dP5PYfaM79OIFiH3E7NKTd0R7aF7Cd/PmuWqCpifSFXika2aQIP0m4Yc
 PWldqM8+4v/lfQ34GaBLdO6ye70sVIKQUGI2lbOSVeOl39tEFPdRR3LG/
 6AWcTIBebcybMY8DdyhdOvaviZNQGnbg7L3yF+gaYvA0SYeJKboIyYz2H
 qNcVVTspFoDJZYCEUyvrpWyc1CIHgGGhvqT1sVCo8cysHgC1ppowpwQAF
 pZy9DiVyHS8JY6bq00caOdCSNMOIZ2R9Nn9H4Lj5uli7V4rcuvcrFsQRA
 7kirzXZc6w3yA1YcQDdH6uzDWHwS9NkL9GZaeLHIA2EBv2vUSGW/ecXMi Q==;
X-CSE-ConnectionGUID: ThrLoG6xRMS2lJTRlfR2jw==
X-CSE-MsgGUID: 0Y/U2p0OT16DdLYm1bygDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="88877440"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="88877440"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 06:23:08 -0700
X-CSE-ConnectionGUID: j78DqRlnT62vwXTjP9P6YA==
X-CSE-MsgGUID: F1OUsTVvT6Wy2k9JRiodIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270059787"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 06:23:08 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 06:23:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 06:23:07 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.50) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 06:23:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FGoPngUSeTOwLOyUaHZnwOThuckhljhPamEi7zf+XBQz+6JGmCNM92fz+qVLR7MdUj8599SLPSNELRAR0Dyuxl/ozPPIqwSNC84gS2b+tyHIWalxRqWoxOIoy+uGzF6stVZZQxk/EKlJmoZU4u+9fqz2PhoOoJcZSkB4grTV30eXkxwALUWZ6HcWBKnnnD3k1eIm5woYW2ZeENc1hGzFBtkVpO7f7mDee+xEl1iHhHLGuW4VQ9pA4gWUADLb+pOcA5qJdUKcf5m4Qca/s4Zcktqyi/TFCWVestmZIk1bnJ5QpflW4PaQErHMEQk6LfUj7s4pR3hzwVVz9IiK2TMsHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYk/AngVYdI4YYRkvqbuNAYXeMEVMAVeDEpE1uOLbGY=;
 b=F3xP47/w2S7qA4JNYBm2EbDaB84+xX6bzwXsQS1oRe9Ex9keLDxwqhAxOA1oVI+sPCCF/n1cpTi4iwOsqkidwH+M2uetvkgUIi/CNEf0JqVnfkIL2UZC/wHPPhHZ8FDH0UWFlvgHR5SGQnFaV5//VjCadRFLIIH6lqkCLxgd1ngarn6ifzg++5P6Ae5rNMzHpOvpZu26la3QuMYuFCge/yarYfzMXtffhocWmndPhQbfl9C7r0EwxC6rwjTEbeHX0QjOknXorf3O4o9CUw++Tqz31jVvGCWeatlGDPcyUYNHxi8Vw82C92YL5AinBFboTFxXiHTf9tnSjwYCJS5ftA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by SA3PR11MB7534.namprd11.prod.outlook.com (2603:10b6:806:305::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 13:23:05 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 13:23:05 +0000
Message-ID: <bdb22656-1ecd-4ca3-baec-efa3454f00c3@intel.com>
Date: Wed, 16 Sep 2026 18:52:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/13] drm/i915: Make intel_crtc_needs_vblank_work()
 easier on the eye
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
References: <20260909161730.12969-1-ville.syrjala@linux.intel.com>
 <20260909161730.12969-7-ville.syrjala@linux.intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260909161730.12969-7-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::9) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|SA3PR11MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b9a6261-c7b8-4feb-c0c4-08df13f5a425
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|4143699003|56012099006|11063799006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: BklWJ78pnuUiwGNxyWKovAb0cRv51Y4o7xKPA6lXQALkffA6zB3W9FCuK+k+zCDzmKiSdnhmitooK6yF18JKRxvFts0g5+nKsogNE6yIaZIvoVVPMztI56ysGJXEP8QN5gHpGhA64VFzQT3jx64EcOVPmx3R36L0v5PTYx9Zyiuh9M6CClHNLb8Ff+WGtojLjxX6NIIueSiphpZLA2MF/EECtbkKf6tG55n+0ZzHywX8kIpjMRuuAUXAtDI7RnqPAH9FLt9grirRAkWXzsiN9h3CYS/t33eEByNdd+dUVcvp4QdD0VbVEbi667tcEYFi2RDH2ua9N36QUnPYCLooCpiML+BS2NsC+gh41fHms5plPOY5leoihLiU0HCLXxJt+Cs3Rmg2+xl4FT6soD2k13YKChEfN4dMj1VBFsJaZTNsyU/5Ic1yeoJl4YwC0uim+5fdFRo+igxfOLvErm0N2B4ag46wg6r+Vy6gSU6KyFlfBEPXkBUxOiwGkBph92JyxeX55xtjRP9ZuKE+twqnLU6058zBfD5TFroIftu2H/CdaU98e1Fb28rbEs7V9NjOpJz7cc/F8sOO4HijLYrsXdIorhjGZ3m5yznHSXzf2f4F2B+q+QlxCH2Ka4ZPbzRuiCIIMKAbwzq42RDdOiEyuqZhP81OKq++wiM+foRpP6c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTBlNnhLTEZqTW1WamJQNnBnaGJ3d3k0Q2Mxb1NrUk9pVWlZSGhBQ2RjQ01K?=
 =?utf-8?B?TjQxcVc1RllUbUlkTDlEZ0ZjUU5jeTRKWi91c2lQYVIzQWZLVDZCOXlsWFdw?=
 =?utf-8?B?UXh4N3BzRThOemJIdkJKaDNoYlNOeFJNZ05pZldnZlBoNWpKWjRXaW9zc3I4?=
 =?utf-8?B?cS95VVJXUkRhOWppWGNLSE0wRkU5bFR0YldzRkFDSHZ6ZDMyK0hGTm5NTEpP?=
 =?utf-8?B?ajhaU3pWbkhBZDlQaGJEZE1qVGVmWERXYXVnaTB3ZzZlUExiMkJLVWQxYlYv?=
 =?utf-8?B?b2ZQZ1M2alFWZ2N2cWM0cDF1OG5uaG5Fa2djRDZmcmhXTjlqMWRHd0ZOZytE?=
 =?utf-8?B?TElzclp1WkJVVDl6aU5XYndvZHNzUytnYlJjdkkzSThiWTdtTU5XbDdHb1hG?=
 =?utf-8?B?WExZRThrQ0NFRUUrRTJQNVNvNmc0VHpHUEZpekFvRHJsdFlaSFplUjI5Vmxn?=
 =?utf-8?B?N1pkeWM5Y3Z3bVhCZk41MmRBb1hUVDVJb2NnZCsyR24xWmdxTWc4SFhVOVpm?=
 =?utf-8?B?MkQ2U0tyMWlIY09RQjQ5Q0hjN3lpdHQ0dWlDR2FXdWpqMGQ2NWpOQ2wrbExl?=
 =?utf-8?B?b1U1Qk10OVlPRDV4T1BuaWRwSjVLeVBiTEtUaGdKZ0FTNFIzcWx2Z0ZzWXBP?=
 =?utf-8?B?QjB3OGxyWVA3QXZIQWx1RkRETktiZ1FhdnIyeUxPbElUNmdmVVhnVzhuWHl3?=
 =?utf-8?B?cXBhVWs5RGJHNjAvOUxSRDZORExkaEMwUEEwVk9FTEhNQnlCckZlMlpVMmpJ?=
 =?utf-8?B?SDBRYUZvVU5HK2o4aGhHdDh2dkZYOExJWmNrN040VTdmSkZYNEFsU29qMXMx?=
 =?utf-8?B?b1JTWGlCN284bm1IVnpoT2RiQi85OE5meEE1b2c2UUdLWFo2TlBPQnBWUE9v?=
 =?utf-8?B?Zm1HUUF4TzJaWUVvUnN0YXBtWnJ4ZWduZXFmSStmRjZaOUx2d0tkSC9uK3cy?=
 =?utf-8?B?NHhRV1E2NVBxam5KamtMTmFETnNuLzFiT2srR2RCbzlBWUsySWZhMi95MHdV?=
 =?utf-8?B?Ky9kZXdQbjJOdnFEVHNoYUFJeVlYbE01NEZOcjFzdFVMTUZXbnAwQU5zOVpa?=
 =?utf-8?B?Q2NVSUl5eEM0bWVPSzBKYk1oOG9JMktLVjRuWTkvd2FKcnlvOTRHQkJ3S1pZ?=
 =?utf-8?B?T1BPV0tSMFBmalRiTEhLQUFmbzdUd3lsSlBYSjVOWlpGaklub3ZpWWhkaTFi?=
 =?utf-8?B?NEo0NWlMUjM0M3RYWGZKK3FrVnVYZmNSR2ZxZysrRWsvWHk3dHdOU1VDd25Q?=
 =?utf-8?B?WVhZWGdscGlSN2hDQ1NRRFBDSGxaaXpaWUs5bVRrZGxCblE4bmhRTUNwZXNw?=
 =?utf-8?B?ckdiZEJmT2EwODdQTVVBL05ZY1JRazBNSmNOajZickRlclg1aFZtNkNHSld1?=
 =?utf-8?B?UFo2Nm9tNFBhZkRaSkRVN0hWYjNiWXhUUUlTcjJFbEU2by9UekRxN2F5a2NK?=
 =?utf-8?B?aHBzMTAwVkZzQjdzRy9nUElubVkzQUREU010bzlWaWNYUHN4YktrbG5NNzFJ?=
 =?utf-8?B?Skwxck1YMVFDNmJCMTE4c2ZIRHkxZC9yYTVnMnB2RFF0bnZwdUxuODJ0STV3?=
 =?utf-8?B?NkpYNGhlbEd6UUJjeWRhbXhtbVNWUk5pZ1FDUkNqRUpKSlVQOGRGaTY5RXhJ?=
 =?utf-8?B?K0VaOXZnOFowbFBKQTUzT2NwNWduTThOTGVDS2JoNGhXOWxVMzBoQUd0VHcr?=
 =?utf-8?B?ay9kZjBzc3d1ZmIrcXFrYzYvMTVUcE9tdWlCVE1xdjgyakx3MFFjWGdiakFj?=
 =?utf-8?B?NlB5YmdWL3lleEc4KzdtUk1lTEI4dE5DcVFvaU5KZisweS82SEFNQWhlWDJu?=
 =?utf-8?B?UTlCdk05MFFnK2s3azlSb05MeGkyMzFZK2tHTUdiWFBpS2tJSmVLc1VyZDFv?=
 =?utf-8?B?RXU3OE5ycWVrdWRYN0tJbnUzL2F6VlRBMDZkWnJ4WU1CU21ZUm1iUFJXSVlU?=
 =?utf-8?B?K1dCYjcwNi96Vm04TS80RmR0UG9rVk5rOHRCdE4zUWNPZUtuejRNZ2dPaVRN?=
 =?utf-8?B?enBPMjRUVm4yZlIrdm4vdkQ3NDNFTTEzeC9NYUtWclpLRXZRbEs2bmVoWU1F?=
 =?utf-8?B?UjF4cjNxMTA0SExCSVBGaHduazREa3VBcEVHOGFzVFZSWXEzRldNaTJPRzRh?=
 =?utf-8?B?K3ZneXl2S05xdG9haGcwWW53Z1ArVmRlR2ptQTZuRUpoOTQxTi9LZ29QMXln?=
 =?utf-8?B?bUNsR0pOdG1takwxbUU1OXlpMEN6ZUpBYXdOUGlHUWdFNGVFenZmZ0xxWmg0?=
 =?utf-8?B?cW04NHFHdEc0Z2lSRnNXZnBFOWtEN3FDdVdhZ0U3TUNXd1ZzRENtbTZNRzY4?=
 =?utf-8?B?ZHp3RHV5UVZ0Z29zMVhpV29tN1d1MVhvQmx1UFRZSHQxK0JEa0xQckt4aUpu?=
 =?utf-8?Q?P2JusHMJETZ6KqoE=3D?=
X-Exchange-RoutingPolicyChecked: mRZaRv5uQPqRrqEy8wF8FJdzKj/nFmrY9kx1TzJkkaPB6FtErK7t0IhQvnO3OjrZTHKWQEGVAKYp3sCMUY9VXl7sXPdWuUnPSunN3Y/394KBhReVDlTQdjSYTZG1fWT5Ki1vSYIlN8NMHVvt4bMV6VJAsfRxI09Wg5R3ROAlg/Y7dZ2Dq03KlYatbuj33QLiHFPgCKX+tzv7E8ytYRFWCYhzVIMvjkCVQE+WD6vb8ZQ3+5Tc1zVYFJzsGr/xaBcUByXBP9PPfn+fIgWV4qY3rgHFJ365yUo26zM2x6YAh1EpK9GRWKQ6OeyfKnXlGTpG+ERzcR6o+jw05l7AcsFOWA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b9a6261-c7b8-4feb-c0c4-08df13f5a425
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 13:23:05.4551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pdZWbIw8L50CQNkyZ03hJwx+joO1hF1LRQXaB9UqdNu3GebGu2xcRsQpX5TH+H9uDHoxUY1THRJVEoYnTM5C70eRzlrAbY0+sEz7FI6x8yI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7534
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



On 9/9/2026 9:47 PM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> We will never use the vblank worker based LUT update path on
> hardware with double buffered LUTs. Split that check out from
> the semi-illegble mess in intel_crtc_needs_vblank_work()
> so that it's clear what's happening.
> 
> The rest of the checks in that mess are more about dynamic
> runtime state, so keeping those together makes some sense.
> 

LGTM.

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_crtc.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
> index 58a99c265598..0de24d221e48 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc.c
> @@ -491,11 +491,13 @@ static bool intel_crtc_needs_vblank_work(const struct intel_crtc_state *crtc_sta
>   {
>   	struct intel_display *display = to_intel_display(crtc_state);
>   
> +	if (HAS_DOUBLE_BUFFERED_LUT(display))
> +		return false;
> +
>   	return crtc_state->hw.active &&
> +		intel_crtc_needs_color_update(crtc_state) &&
>   		!crtc_state->preload_luts &&
>   		!intel_crtc_needs_modeset(crtc_state) &&
> -		(intel_crtc_needs_color_update(crtc_state) &&
> -		 !HAS_DOUBLE_BUFFERED_LUT(display)) &&
>   		!intel_color_uses_dsb(crtc_state) &&
>   		!crtc_state->use_flipq &&
>   		!crtc_state->use_dsb;

