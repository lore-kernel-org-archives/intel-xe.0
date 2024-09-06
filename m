Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38FAE6FE49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 22:39:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F81A10EB1C;
	Fri,  6 Sep 2024 22:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jEG6liu2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59B410EB1C
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 22:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725662386; x=1757198386;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9SuMk3g+MXOcbAmQq9TjmTju+J9ym+wGKcXkkijv8s4=;
 b=jEG6liu2+q5SdgZ/CNSkH3WKMJfDqYfMKllJ4mceSXYETBRiZu/uksnw
 +UffMtwfW+oOXYt4sIFKqpPKlMDwnXz6wlIcpxofR4QpLyxesZ6a/4w55
 MAzUtNxR2QbqWZcw+5gTSA3te0bnog5L1142pg30KhvX6yktHT3yI0m1o
 S7pqYkZ3P8ZaNAUR4tfqEBlYtvXkU1pg9cb0oJN0a0a+ILMLSC6EX2aBV
 2GzJbU2JA35++C1WriJvdNO/OEOXbohcYLf/DfiEm8FyMX+89H1UMYqW/
 zYwws4u3ynVI6/CWFuC4aI2TQoTU93eAvlDWvpABFYs9QXMow0W2uFTtD Q==;
X-CSE-ConnectionGUID: vbTBKjS5QL28Vyr+u/G3ZA==
X-CSE-MsgGUID: f8WGtl4FTvCSjuvTR5GJLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="13416094"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="13416094"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 15:39:45 -0700
X-CSE-ConnectionGUID: neaDePl2QyGYRS1TBwtVAQ==
X-CSE-MsgGUID: oYanSdiQQ/ijxW/OyGj6Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="96796082"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 15:39:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 15:39:44 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 15:39:44 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 15:39:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SvzbauJlJRwcHS0CW2qRDZFKj5C+OFb7PjjbgYnlPe9D9Y5YMmbJyg9rf17TeZuUn9zpRhD8qCs3bINOiw69iHi947wC+iBC7G5SLbpRJusUA5bLK/y6dcKClKTSE3Jyhaw5+n8bhLsLYzx6px8lUcC7mvBUwc1qqB1I2NA2QhdfbBy2N80U/H5dpCtk22HA1j5R97XoKzIcR1DGelfK4CPEqTjeTiqjF/+0k7ue4LJhw4wGMIN+hETteHJ+fJtpR1ySWGVdgGzAnkRujQws5lWNQeH3GKl5VCVTZbLRVi6Kd+qrW+ODV9hezgdR9gfSHUELjHR89LNxMWqhylkHbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V5/GODdy/do7DG5VvxLnizIoojMHU0o/6sked3cj/9w=;
 b=kkZc7ObOEWnYQmeXCSq7MkkWJEMi4MERL0JVGDajCYA9x1Ay+bj8xO9hJChUonupNC9i+D0/VKx7dxJL1WL9aZzu7oMzhRWQp7teePf6NRO27XwxRGeUbz4IP56JAQ5eHqAIJsH8J5dQohewlpGwSI9CcJTm4b7dgSyev0zf57R0upv70T70imOz/HxjdKg75ld/gIdJp2VS60gnzrFuGMkcFGQtAPDjrxhdmhTcUBvnsz2sZC3vd8BWQ1Y83L7zQ4uXe05EozuGhRGM5Y321Exe/d1aLXs6xSuuWtvW4zzRtv2kJV7uRDcDMQimS2+bMFJqLV3gbiSy/+0S1C0/cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DM3PR11MB8672.namprd11.prod.outlook.com (2603:10b6:0:44::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Fri, 6 Sep
 2024 22:39:41 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 22:39:41 +0000
Date: Fri, 6 Sep 2024 18:39:38 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/9] drm/xe/xe3: Xe3 uses the same PAT settings as Xe2
Message-ID: <ZtuEqnijkOrN-gkN@intel.com>
References: <20240906215153.31210-1-matthew.s.atwood@intel.com>
 <20240906215153.31210-2-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240906215153.31210-2-matthew.s.atwood@intel.com>
X-ClientProxiedBy: MW2PR16CA0034.namprd16.prod.outlook.com (2603:10b6:907::47)
 To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DM3PR11MB8672:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c3e87c7-6bf0-4592-bbb0-08dccec4cc29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4BBmKzv7kzq+BtF088xLjfezKqNIm0X2o2oAMygbKKjf9A9lxqnEjexEpgEP?=
 =?us-ascii?Q?lswHH6xF9pLYRLMtBrjmCbob8u0u0orrGqvw/HvtmjV6oSCJxJheXx+gaO8h?=
 =?us-ascii?Q?ZLMXIo7WUfBFIggOSSDVJJ1GwlRy3mDEQ3AMUxWi00rtg0AhzcvvHuTKV6PK?=
 =?us-ascii?Q?w5Th+ge8LTA/AGDHajZsR2C+yQhuDDUmFE1fSPR6d/4Tu2FtXsw1vc3YJqa1?=
 =?us-ascii?Q?kHp6AdXKey0I4iqMoP3hV7TJaJM26mQI8d65EbRO/prqTGES1iXCRRbvMJld?=
 =?us-ascii?Q?6IiODk7djYoVQwNJDS1MdCrUjVzf63WL6QjRABp6IwpYsvvRBh5UcaSPIQVZ?=
 =?us-ascii?Q?OSgq1k6k2m/DSRobHlf40USSK260Fa/dqWxsKpkLCOyQ/iS9TH/nsjmD+V/T?=
 =?us-ascii?Q?WYMX6DBCo4J6gdOR9JlRgHWhmOrQ/EhYAmUWMOSLdlTCdoWUk1iHl0yoU9YU?=
 =?us-ascii?Q?tL0hzK7kTiAej16GJcM1Xu3hmfIQAfSbRIsIQVDHri+qBKTs+IsU9y5VlOjI?=
 =?us-ascii?Q?BkZsj5U27YQOMFwIdvk1Pv/bau2s2VDDyv/lwvAo4bTvVvdDgZOQHj1PuTYT?=
 =?us-ascii?Q?BYYN81JiLOMwWBzhixVpE86WmTqkpckgqB6LIwPhbenwlqUAwvdQsCumL9Jq?=
 =?us-ascii?Q?eLLRXloDafZbQO2clXNu1D4qNaRantspmwMig2G38xjjgRHDXN3Ili36tKU1?=
 =?us-ascii?Q?b3B8OLOLQiLN17tqClFY2WDr9wtJAI32jHe6Dn/s/4ewidjk1nXrs1HjzVwf?=
 =?us-ascii?Q?iNNdZNlihoQmNlHnw+9+d5hxRw/4ouBP6WPN5z/nFdkEA7ASrxZnirTRurdG?=
 =?us-ascii?Q?zsBlIzO0PvD6Z8NisGQjuosu0D4yc34INRU3WWog3HTSR3lauqlcJn/YEha9?=
 =?us-ascii?Q?f/3mx1k7SKcFCerWLwvXVj5OlJ5ipCoJzCT5/anlf67QdURUP6zqRV6NbyBS?=
 =?us-ascii?Q?LsADfgNB35TChvlQB109HT9ygpoTdZeowyx9zxo1lzZ6tqt+gwGQOtaEsXx6?=
 =?us-ascii?Q?10vayt9Hfwqt4I7Id+WABff/HCpM2Pz282amSrzRxhYeTDO4TMja2tXWGmMB?=
 =?us-ascii?Q?3k7IBhYMuPHwaZsJFlaz2XLp2F+B9XbSzppNkhmPJZkrB4goCQ4WY1N0RWC8?=
 =?us-ascii?Q?3dA/1Mb3KWSAmi6yZUC+KaqiuVIxTtzvT9c6Nm7Yfgwl4vXb3f6rn6O95h3C?=
 =?us-ascii?Q?h3rpubF7HgkxPb2/oVE4TQqRx1RCO/KCiqRo1cyuPuRc5tXjVpEohj7z7bZ2?=
 =?us-ascii?Q?5W1cNhkLV+Ko8BF1scXDP+WgDEMju2WcOASXYbuHypsNxuoOOCbepnP++TZs?=
 =?us-ascii?Q?EjAiGBSnuNH1jiInQi4ggm6WjL/Aav69MPoznbvFjS3kug=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z1Hiy6EDfc8Q6vhl36TZV5qEOYwPWK1IJZU8hzXq+x5hCbBSlO8nSS1LTu3U?=
 =?us-ascii?Q?TZLxScIJNr/d8f9mKftwy7v3s67gLP2Aggv7zuloaPDJUiHMjv6AJRmbgp0c?=
 =?us-ascii?Q?imUQfv9Tg6HxXqgSn9SiJea3GIFEy8yu/GOiBG5tUKwWQtXd6v/1I2qcDLnP?=
 =?us-ascii?Q?lDIQ0e+3Xal9s/yxvvKh6Xnj3KqQVya/9cbrpFhrXqLHU02j8+U46pkb5gAv?=
 =?us-ascii?Q?gFXtcD7gSUW2FfALU6IivI1zjvOXniCCaD1G6XWCIkaspf+B1C8crNL0KWBW?=
 =?us-ascii?Q?KmzZ6jwEluX7RAXK7rRehaEQpfFUJJQKfpoy/Zai8MfP8aqR9LOJuHixx3ay?=
 =?us-ascii?Q?vPyf5bCaCUKRN5JbOp/KPy1wcWT2oke90hc1snKjdyXc+wmFtQa5che46yJL?=
 =?us-ascii?Q?O63VTTVasX0UvTuTZOplI3Nhp1dlhLr88A5lXzu2BoCfgC/BfsRj+eD/WKsg?=
 =?us-ascii?Q?QoRe0n3YrrrfBcCWMa0UMZIOHNoDDou4Z9qPaHs+okw9RQSPPTPHVRAmegB7?=
 =?us-ascii?Q?IDnNbRMTlrtEwofBwXYLF+IgNKAjc6RnxsKR/U55Ux8CHhl/1JluUPyITMrA?=
 =?us-ascii?Q?vjT3FUkX3ZmotluTu8u3NvXAPMhH9zZ8y8rv8++Yxc2xrB4h5db5Tp3nzw+B?=
 =?us-ascii?Q?gE4OWCW7VqYKXfBrla3gECzpArtPoQPbKSXPC+xYO8LN2mz3rLGgK7GnTUmr?=
 =?us-ascii?Q?J2jLBh5kyP7iF/dxraNESD7QaEHGogjkbzDXKxOH9wElZCCTwoA3zSvgXLHB?=
 =?us-ascii?Q?Tdwzk5bd4vjpLVr88y/OFHIcq3HquKtShAguuPB1/Xx6IbPHU89zKPGn1UDR?=
 =?us-ascii?Q?+mBhgiFRYMCGFTB8GbcvuPtxRqOkzqpen1yaVhy+UWQWvzyUVqg5Edd33+tH?=
 =?us-ascii?Q?5ROkB8FAadD/u/j6/L9zT4ux2ftP3eljcvsB+IP10O3vBw103RqJVxqlgEgn?=
 =?us-ascii?Q?jlmIBf2oiDXR+2IY14nRGe/5fWy8orQVlIdTCaMGuS4fYg6VqjFgceCUeNXH?=
 =?us-ascii?Q?+a7Y98rk4XGfvFKr283+Y7aqbexSV+1+pCI0y6Fs0yaZJcxQm4EOXUNG7t4X?=
 =?us-ascii?Q?1wFtnzGbuytlB44N8L11S84CtGS9YEw6tdDPTgonOnRGxGQ3T06EMzMJ0wVk?=
 =?us-ascii?Q?zyKI2aIdNaQElfHsMpv+6H/K5qwcR38hV51KqbUXJVtzoM4INOiUNKdCd+Fn?=
 =?us-ascii?Q?tl0z4h3aGb0As5mDjx2MBoyNzopricz7atlkPwk3ctcbkSboEDEnaC1m10ct?=
 =?us-ascii?Q?ilH234Wu+kK7r/ggN1PQHNkrYQvEsFVQSFZalUKGw8/GMM33SBumTAWhwuyB?=
 =?us-ascii?Q?e3DT/bjylfbDo8MYkwGVCStUI7uL1l0A9TaQWh3zyNSchjVrD28T5+qGv9MP?=
 =?us-ascii?Q?iJtWz5w0n1ljhJ1Do7ajWNmyp5eziw3Mvh0Yv1SlVyB8ZlIBkd3RBOYemhan?=
 =?us-ascii?Q?bgnzBUfSInZrAKblfVimkjFpswTOQEZQYsOh3ikRbSa04DGJIKrTvO2bu0Jy?=
 =?us-ascii?Q?S8L0q5RMLXmm6hDDmrmA/BINtN1p4PaTCYx9QIXRaWTUtE0PfDtcn0CW9ij/?=
 =?us-ascii?Q?Nr1c4STSJLw3sfFeOcpCtZoceBQ1IAAG6bZp2dnLzeH37qNRHpJnR00GlZ5F?=
 =?us-ascii?Q?ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c3e87c7-6bf0-4592-bbb0-08dccec4cc29
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 22:39:41.7256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v9cp4drK13wSndUtlDeLy0CJh1rEQhTUUC6hmGQa341vRPJMZYHSf9wS+ODNooXuaVJXyKhnV+xrXaRuE0iTsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8672
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

On Fri, Sep 06, 2024 at 02:51:45PM -0700, Matt Atwood wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> Xe3 platforms use the same PAT tables as Xe2.
> 
> Bspec: 71582
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pat.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index f291a1730024..aad9345180e8 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -382,7 +382,7 @@ static const struct xe_pat_ops xe2_pat_ops = {
>  
>  void xe_pat_init_early(struct xe_device *xe)
>  {
> -	if (GRAPHICS_VER(xe) == 20) {
> +	if (GRAPHICS_VER(xe) == 30 || GRAPHICS_VER(xe) == 20) {

In the past we would just start with ' >=' assuming the next platform
is the same and handle differently only if needed. But I guess that on
the other side we would take a while to find out the wrong assumptions,
right?

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  		xe->pat.ops = &xe2_pat_ops;
>  		xe->pat.table = xe2_pat_table;
>  
> -- 
> 2.44.0
> 
