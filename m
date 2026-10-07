Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDAEDCA5FFC
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 18:28:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B78410E2FE;
	Wed,  7 Oct 2026 18:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L/BZNi6w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6705B10E2FE
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Oct 2026 18:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791397699; x=1822933699;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cR8+NIfzqUSjw8DOzMyX8lhXxPz6Y5kRWvZARHjhOe4=;
 b=L/BZNi6wPK5/dCvyM4OU2AMuOz6925YclG4W6+Ch3DTXJtbCSpfPxg3T
 N3mEe8NFXHhCWsKFv0LjXx2MOJaz8psu9ztzhGd8yuqUuBPGkRbcAPDQM
 yEXYf6LLZmC+5212CQDp46tAgcfDWPlHTaJOMkbBIUKzr0SkdWNwRobhu
 OKuPdLPpOADPsTqK4zMsyEyoW5sWk2V/d/5MNv+C7qRwPnJng4brduoNH
 C0uyg8O2h308sK4rZLmCHt2CXm7slIyxFrzBF5A/gfIFnq9nRF33F+O4b
 PZsQ0m6gSt0PfTYlZptuWljv4G/6SYNijVTIg78NFcGUA5/7p3jtQBhin w==;
X-CSE-ConnectionGUID: Yz9EXGwFQwqkpjo7O82KUw==
X-CSE-MsgGUID: RP3LMX7lTXioVJ9ybvnLxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="68803"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="68803"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 11:28:18 -0700
X-CSE-ConnectionGUID: wLWAoBLWSWm6w5Loq3ywRg==
X-CSE-MsgGUID: TMxNj3OeRxWOCCYM5nQezQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; d="scan'208";a="315550288"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 11:28:18 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 11:28:17 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 7 Oct 2026 11:28:17 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.67) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 11:28:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jjJNsSpL3wydaIzEtn6aLEHkot8+QKLMPYMNT61qo/YiEfqt6L19a2rOn1XlENOhBxSigarazDtUz55fBkc0OyLCsfMkXESCkbqsq490RQPipzuAbYmWdCwApos/KAVKT0diez74+17hSxuKcjXmQTndsqpUITzIQYPTQicO8SMEIiJZh4YpK2gMMDqMmmOkr5G6Ix8c5ZeicPzOIBTc0FYMTPjjlD7WICd5WirnOQ4MZ8AUYQbGY9FrOmcU41+dRqD/lPx9hAI7KnFE1STcBJybV/+5b6+NlcWTAKOIKFZC27AQNnJhGPeG1tR7ljeFOtkULKzps9niMypTiAViHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WiGljTzdSB0288D0bdz1xIuyG1QXHK6goiGpoUPLUZE=;
 b=du69BKLPNE8T8XbbociXy9eUMk8JgJN86PKxyRslzJco8AQjcq1z8EPZT9yOCSZVycIYm9yU1GNYC1PIrhwT3fRlgmSzm4eEYW7jCbUXzzWLpTLyqZ+It4eNbIOw8z/4RH2rHimKS4IvJOYAXnxjUtuN0H0/vyY/gNppL9i+AT69/2lpIb8BV+/bpzQskFgCYj4nPQuIarcuJ4QKd3NYncxr6HAbtT0yuJa30nqwcgDQDn07ZifzszoJqfJkn+Dcp6oGZsDfLeiwJHj7GzKXGs3bIoGh44WdnRuPwyqpm02HxkIQdYosgkFUD3Toarw0ZaMetC2GGcpiha9giiP93g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by DS6PR11MB425752.namprd11.prod.outlook.com (2603:10b6:8:528::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 18:28:09 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0451.026; Wed, 7 Oct 2026
 18:28:09 +0000
Date: Wed, 7 Oct 2026 14:27:55 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v8 15/15] drm/xe/hwmon: Simplify temperature channels
 config
Message-ID: <asaPKz9hnrW6My6w@intel.com>
References: <20261006033534.3583967-1-karthik.poosa@intel.com>
 <20261006033534.3583967-16-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261006033534.3583967-16-karthik.poosa@intel.com>
X-ClientProxiedBy: SI1PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::18) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|DS6PR11MB425752:EE_
X-MS-Office365-Filtering-Correlation-Id: e6b1f82d-b7f7-4eb7-49d1-08df24a0bc80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|22082099003|18002099003|4143699003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: ebapCYsH/2bztLucMfr10K+PCxnTwP8KlMrFaz3g+HfdzoYmzeME3ZtyY/UBGbuQ0r6w/k2n4m3ZWvfWPmH8yw6kKV+n+FEBzmikyKo6QwgwyVcZ/aZ3IMRbx/tD8yLnE4ugEHvF2jOHl3r5GzZuwvNHxFgn0AL4EmWeQ+L2Z2LaHqCj/CL47WGqIQmBDFSfM5A37YKZyDlEdnjyn9+Nx0X64KjttOw1L/U/Lw+zn3IqyRT5pSwhFl7ZlhDgEPnXzWC6GCektYkys+unO3noC8aZsYI2R2eJ84qTeVarjWCXPNplzzEk3dZlu7PLurK1guYVwawngYdtFz/hzSqmYOvliaV6cfF6CXD/PJerptsNOBgAn8N/rCYxEWFdy8UITWYXu3mvQjpvGC7MKIpC6RdacoMDH3eQJwT2WSSOponFvBNXYZWZk+KPA4cJjEMWBQ98+RD+UbqiP7qIHg3LaBIZh35cXkJ+X4v+SoVXkagUE6Cvoyhs2w7kg84Rz394qTin28oPAPe5D1Dwf7Y8zjPo2PcHNnZ10igs8Cnx4dvd1dw5q3LLSbPQCiBHhbttCzRMqzXKvZEu5Ay9L4uR/4X2mviGdam0iKvh5hGrORMrYUBwqyLnQOkewgVInVTtqnINlmupEwnC6jUk1fTkcXLKHpwVSU5I1eVtx+DkPlQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(22082099003)(18002099003)(4143699003)(10067099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4n8/fnn6vmmKwb+wA+4JeKdNnoeaLN5W05OAAMjRVw1C70Dqktys5n8l1IW+?=
 =?us-ascii?Q?bPd4kTlyRzhxke+n1P5SgcS84Ex9GeAahvy+YhxA7UyoGKemhHw8Xc6a9XTN?=
 =?us-ascii?Q?WP2o2vKPkn7rJkrCoWa32YTSY6Qj7IvhJ46lfhgGh72XPF23M+joOmQXE1JX?=
 =?us-ascii?Q?PwriR45fIjJAnlf+TthqMLPKdhKLPHHLv843NmYnDXOqwVzJXoyN3Q9UKWmv?=
 =?us-ascii?Q?FVpyXDWiDj7NYbI2T9hVqgMLwE9A9uLOKATdsRcm2tq/1r5AEArbFOdkEDN7?=
 =?us-ascii?Q?vO9lJphBQKCVihHloz03qtijdTFmJdepauaHTYeJ8/PxqW+eM8OYXX/KGJ6c?=
 =?us-ascii?Q?99tHNSv3RmulLqTCOPiNLX9myWTjWbuT8kwmrkdR2NoXqtWTGAT66a6R+msE?=
 =?us-ascii?Q?yB7WqZB4nBDP2+V3G5iaeSBTpwH2fYDc7aGI614BDqu0wzqdjASgynhwUyRp?=
 =?us-ascii?Q?4YhICFc/cxnaeH7NK4gZlCCtQmh06gCPFKTEINFB+sEpcWPBwJEF0h7bretA?=
 =?us-ascii?Q?HlgraK+9fN3ruErMdXjWzQGhP+nEywW7vRkmpYF1zBLYdgB+L4dSCx1qSLvk?=
 =?us-ascii?Q?OSqX4YMKA7fSQh8WMkJo14G401SQu5z6J/Dj24fucIQV+HDF2pheCNkZSrB7?=
 =?us-ascii?Q?Wf3dVwSKh2gAwWliLpseBbMo4cc9cCRn5gvb1dCgwgF1kMYj/TRz7J3Wcj3G?=
 =?us-ascii?Q?IHmMSyds9AJph6+ABHD7GiPKqbsv+lyBoOKm7kg1DbLZE0c6fhaU7W7qFYO/?=
 =?us-ascii?Q?L5se/8hxi5eFX6bj4zJnlJY6gqu8LYh5hZZKvEQVVzKHo9Imr5p0qNQQdIPx?=
 =?us-ascii?Q?tm6RY+FbuJLRtjsPLcl2/Ubf3Di77Zw1dEZzwuKWHZR3pxx0laIss9eYr8CB?=
 =?us-ascii?Q?KeoeFY5UCgrpbrw9R5BvU9Ifn370KWJvTd7uxQGLXDfDexvMDP+NMNoI4C6Y?=
 =?us-ascii?Q?BRhT//bat8CaXK7JcU3dOV01Bx8jq9Ss1L+2bmry1dXHF82YnRlyWNUhHqZB?=
 =?us-ascii?Q?LWMibEfoMZnzNgus3+385sFpgD6206QVhBaoRtoaZoLtf76GcXam4xulYmW+?=
 =?us-ascii?Q?k+L5O9wOIazSBqIOzKfeu09WoUNWsfEdpiTtlhCrAomvyH1/ShBVv3C2BnB0?=
 =?us-ascii?Q?QFAegNN0iBDMxXzTcRBQ9mx7pO2/clymCiHtFFtddWrvKA6+QjruIFzR11x4?=
 =?us-ascii?Q?BKWj4LOHsksHf4E+d6+z4Zvlmwe3AmQF+nb8kdewtBRL+UlvUlnp8jvBKpgz?=
 =?us-ascii?Q?sonwco/o7OFTdr9pRz/DIEUOCEPXZcgYyzJZzXVX3RgydU/6kHcWP4V2+mDD?=
 =?us-ascii?Q?jNwzhBYCx8YYYUgYCXR20WQP4CGxFmMaSrbg3Bg4YMv2muW4UdECQ3/vZei8?=
 =?us-ascii?Q?LttqcE4ipsVwJ25ZmQyecZMJf2mCbKzsKFNJS2as3EvXvMy0x3+W375oveWb?=
 =?us-ascii?Q?0Mg3HqBt9XNRhe1IYej+3PedmQqthT1CpuZ0jSbEAXFj5moD/wxPEGY9dzWF?=
 =?us-ascii?Q?P+0UQCrh3Pyojb2INQelVIglW5Igi4X0Fs8VwVYXfUo7Nk5tqxOGxMcVSNAh?=
 =?us-ascii?Q?DW3ONgDjmQdA7ZUqdIFvWRCB7NNhhTrQW4eWv/kl2a0frXLDX+BwG6K16vuj?=
 =?us-ascii?Q?N2bCbUTc3/SvHC08vwPiCyDYa77dFqPQ55roC5cvVRLHQmyR+hvpwHuI7fb6?=
 =?us-ascii?Q?mKZxwAhqBUbRcU1CmVdncoMxQxlCmeLYCk9ayAfwIrJO0eIevMvxkjKqv8tL?=
 =?us-ascii?Q?JgaNay1nflMJFq3DQUh5tTlhHfgCEBs=3D?=
X-Exchange-RoutingPolicyChecked: J+Q/2SFBYTP0Xspo6syKzUovs5rR7J1A5rug/3a7Wv9c19Kb2hbn7hnpKOzmYrWDSyJYKlGIHeGZs3UnXuUjKSXmnF5SjdYDm6Ciqk6i8o4Ct8aoeP7ZV9iCZH/lxRxXeja32G4eL4Ce/nmLfQK9gLgnHK9fejzVbrQZ1H+y/z6sUvtK0IyLE5aQ7fzXWVURRfOmFnJ8sjbE6dz9YSOvGh4UOQ9AF8X35dVyXc4sgzrgUjlTimFz2tcHUlMZHoEqL/8ELYLlPa4qA6JK8HG69vEWsYUeu/AC9SCjnkfLVsxnEtSctYMByokoCpRx/M/b9g4Px/WWP/2eDKzP05sZqQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e6b1f82d-b7f7-4eb7-49d1-08df24a0bc80
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 18:28:09.0462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ewemlJJJuIozVEcwrwTjwGJ7hQpJCBZRfljxWzWKypOWGFuzrEac9yhwIPQV1jK7MLrX9Prla40/4VlDpLXc4g==
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

On Tue, Oct 06, 2026 at 09:05:34AM +0530, Karthik Poosa wrote:
> Replace the repeated temperature channels list with an indexed config
> array. Use range designators for channels sharing the same attributes.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Assisted-by: LLM

Thank you!

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hwmon.c | 104 ++++++----------------------------
>  1 file changed, 17 insertions(+), 87 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 54b2fd29ccbe..589d2d1cdb4e 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -800,94 +800,24 @@ static const struct attribute_group *hwmon_groups[] = {
>  	NULL
>  };
>  
> +static const u32 hwmon_temp_config[CHANNEL_MAX + 1] = {
> +	[CHANNEL_CARD] = HWMON_T_LABEL,
> +	[CHANNEL_PKG] = HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT |
> +			 HWMON_T_LABEL | HWMON_T_MAX,
> +	[CHANNEL_VRAM ... CHANNEL_PCIE] = HWMON_T_CRIT | HWMON_T_EMERGENCY |
> +					 HWMON_T_INPUT | HWMON_T_LABEL,
> +	[CHANNEL_VRAM_N ... CHANNEL_VRAM_N_MAX] = HWMON_T_CRIT | HWMON_T_EMERGENCY |
> +							 HWMON_T_INPUT | HWMON_T_LABEL,
> +	[CHANNEL_MAX] = 0, /* hwmon config terminator */
> +};
> +
> +static const struct hwmon_channel_info hwmon_temp_info = {
> +	.type = hwmon_temp,
> +	.config = hwmon_temp_config,
> +};
> +
>  static const struct hwmon_channel_info * const hwmon_info[] = {
> -	HWMON_CHANNEL_INFO(temp,
> -			   HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL |
> -			   HWMON_T_MAX,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL),
> +	&hwmon_temp_info,
>  	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
>  			   HWMON_P_CAP,
>  			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CAP),
> -- 
> 2.25.1
> 
