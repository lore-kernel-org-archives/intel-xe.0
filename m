Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4E9CEFD1D
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jan 2026 23:09:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE5AF10E0AA;
	Tue,  6 Jan 2026 23:09:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="McMVzIqj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A9810E0AA
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jan 2026 23:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767740952; x=1799276952;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XpATk0iu6S3ldfQKOZRbff9MqbB4Q51CVNdt8A/nDCw=;
 b=McMVzIqjjCYJsxIrXFlLl12WtHcWeVWpR/xCQD0LquEyNp9y/Z/CUZPH
 CHAx2v+Lu7S97y15OufwYs9gEJkesAPjsGlnhgvROMtWBBEZPzh1Q00bj
 FWvU1WqOGDNqsr1tthC4sEbNh6AsOvNULdTEHdamhd5u3u+cFPelrbbg+
 T56zwJ9IQGwq126Uo1O6YpPbcCRnANcyjJix6RW5pHtRlNntemYjCwEwR
 xV1wB0YqA5C/00+cJFEaEVhPQkh/7cxxA4OMX9FFa6W32bZWG8PEk+dUq
 1gY0X7+8vevkGlxShiqHW9Ud+lX6E6dDNu9cM/G0xerokSgWAMQJagRLq Q==;
X-CSE-ConnectionGUID: nKV/K5peTlyJ/S6ntVeyTw==
X-CSE-MsgGUID: 95CwYEGJTVqE1RxYPqWOsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69272523"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="69272523"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 15:09:11 -0800
X-CSE-ConnectionGUID: qoNA0VDKTuWgTn7NHPXZ7w==
X-CSE-MsgGUID: W1MfCbLqTUy1QMT6JWuCeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="201903936"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 15:09:11 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 15:09:11 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 15:09:11 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.27) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 15:09:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=alSNGhBzmAxsATrNwPy3UEr4rREmI2Rg1tqcK109MDKNwViieyhHfIgYY6EG7xystX1aWwBTTkvnsR3xmlagTyLFCdUHSmSiRUZkHdpyrEasCn0i0947Cb6y2TheXTwz+3R75wdnA/Aj4IkaxqxnllUnksnfbXKfWVWjSQzgK/pWTpPbuAOiSeCVJqjG9FUCG1zolqA1XVCmXSZ2K+du9GNHsyVgSlfxKAvMxYoMpu9oS0V3PfmDvHbuOHRxyEKTCgLJasrv4rJjGrAtrTETcDZWxCoq0dFq4yEb1mjsiwi7v0FDwcFZkS2Sy6ERAGOuk3P6gGrbH6/TniZbD+2mvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N1eCF5hC6d6QW9W15cJzrVVaI3w7JoiVuxP0Y+y2oVo=;
 b=bPo0TFvS7wcfs4nAlTWNVvaqO+3hyShNwynKkLjfSLHWJ7EFB49qunILLM/UI9dJJ1qZuagHTL+rUuZRZ8oFaGlbWxgBw7kGFpGuIb2oXErs5YnmQPfr9q2CBHR8vkigdE5qRg2L74tJTwazxSu9hJ6Lp0PlMEWSYFOKw2tBcOng/WsoztyUOZEIvXJ59JWwDe0qZQBkROvl55AEQYuCyRmFw188180bAc+5ArKfF9+owDvUqNV1X/Q3yWKWp3APTUJ2XswNJf3rphBg3FUVNW4Rgw46uGZbLscQKGVclAVTqlmFVPojUF06eESg5HKqYB2t10bXngpfTeyocqtl+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6651.namprd11.prod.outlook.com (2603:10b6:510:1a9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 23:09:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 6 Jan 2026
 23:09:04 +0000
Date: Tue, 6 Jan 2026 15:09:01 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <stuart.summers@intel.com>
Subject: Re: [PATCH v3] drm/xe/xe_guc_ct: Exit CT submission fence wait on GT
 reset
Message-ID: <aV2WDZ0uaMW6TYmE@lstrano-desk.jf.intel.com>
References: <20260106205533.60180-2-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260106205533.60180-2-jonathan.cavitt@intel.com>
X-ClientProxiedBy: BYAPR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:a03:40::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6651:EE_
X-MS-Office365-Filtering-Correlation-Id: defe25bf-dea4-4042-ab18-08de4d7895e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jC03ag12IJodzIZdCNRq8R3sRwY6XHQIWty305Z80aBA30x4FpWWtJKS2nec?=
 =?us-ascii?Q?NuNm+CREJNfhfc7DnJ6EmHd87oUo5RAuGsyUhvQ80yCGnfpnT1prL6w+5n/b?=
 =?us-ascii?Q?nbuVj+XfHHPq6vZApt8uC6rpxTRInO05xKmJ6nmD9yk5tein7UBKUiGiIWuR?=
 =?us-ascii?Q?qwzdFUMUJR+9oeiNywzE80amxwU/RvluTLywoXgFE3wrJAHaBes6jo9u7lp+?=
 =?us-ascii?Q?dtX9mf0u4M8otWlbvnATWHut1MupO9EggD6W6FnLSsSAeFTl8xi99Hzvy+m8?=
 =?us-ascii?Q?Km2kN90AHiOARqIcB7JGMHOPxl4plP24EkfI93GgJ/obWxOmuf85Z2469GLA?=
 =?us-ascii?Q?0Rx6dP65qqHH5aQjeQogU/YTC+H0daJzidnxkGBvBZKEtYruPSmqpJVNkP2f?=
 =?us-ascii?Q?jrZp/0RxXrgJpiMk/DaolqyX+MsVrP/0Hegw/GNIzzrrhZKUrroaLemEjfwH?=
 =?us-ascii?Q?cC42fHcnZoqFmxmzYiF9Om7RIwPZ5DZlGGzMiBB8fLkRaGUOrrp3wWW/h95W?=
 =?us-ascii?Q?mAPhy0dtZGHAFg8i5F8JJ0m3yJeFyb26hmk54RpYlBiAcc7KrcdXzbPY0T1M?=
 =?us-ascii?Q?X4XSYz9e8LXUEgY/lQv3PXfSC/p3Lob1ADKzJeYnM257GTKqyIyW89RnUNxE?=
 =?us-ascii?Q?lnTkQMEC+wKJN2c81L6P40ee4ETgIFuONOasIk6iTO3kzMyjKCKa0obfCan9?=
 =?us-ascii?Q?xIP6vUIC6JjFJTMzgTFGqme+vQmRH9MMC45pTNWEP95mlyNHF71f+AO0Nyz8?=
 =?us-ascii?Q?ZltXemmZnBHKPJnGUbh3FPVGfvFW2vgxf0dxg3zcQ5LHu/dp33LhP3IuxsjJ?=
 =?us-ascii?Q?E9XGpsSDcVOTQfQYaSJBjP33K9uQgvrjtpcwhCNX5X0XTpsmZU0R6Igw0DhD?=
 =?us-ascii?Q?/j5cMXqDl1FTLX0YAZFWbTOKrP3ZFh8QZGwGDLc9LUjGI177rkj82dQHVmON?=
 =?us-ascii?Q?ewMG6DlnwzIW/C6ZaNYfhMZYI4oY8KkY5VaJvG6d+V98rnuGBkVMb6nXm6yb?=
 =?us-ascii?Q?l6kpszW5rnLeUfputetUzJbY4FS+3QcoFpPYeCpiBe/2JN9/YsIejemgJ+Rf?=
 =?us-ascii?Q?xzN6iN2lI1fTGyo7cPBxgEMsnC7/tsr5VhfZAxIRaqvnLEw2pkDDUZVrX0wJ?=
 =?us-ascii?Q?XvKD1+R+eylBtkENMbieBb9sNzlSNk60a9T8wBDK4JPPL/jDiA0bxslrrtU+?=
 =?us-ascii?Q?rTTb+mtinq//YKw9lAXIxz9ZbCt5nAB2jHj2WdJ4m1gPUCGYAP5fzeoINlw9?=
 =?us-ascii?Q?T7Oy46USglAhKI1x6xt3KIXjFMrdwbW+KsHv/4GDajxx+z1ROTvRC6SnprJW?=
 =?us-ascii?Q?lHnf2KDzW8acJFScHjrGyyMlQNzqN8VepAcKBkyjQ00bR807iifkVn2Erbek?=
 =?us-ascii?Q?LQ2ZruvINA4LwO1eyq71TLIcqTFndqwZ4JT8pl4mkN8sdPpozg3XMFRsPL/8?=
 =?us-ascii?Q?u2kuhVSZ2QtXLKpNRKoCERnT1BBxqLMe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ntoD+1HcmDhKwUV/5oILjoxILaeEDvpiiKzeKaggTd1NY+xYGqfqO3R2eOQz?=
 =?us-ascii?Q?A1x8FxAEWEOOPWeUr6HFQeIKZvbEf+I4+EQESUegiQorw++J+cE9Nowu14OR?=
 =?us-ascii?Q?ZJgWM0Iqd39gwND9jpjgyAw/jFH36kv/W7rexm6oTLoo1QXt10vMpXOVsgsM?=
 =?us-ascii?Q?xt/F3xSDnu/dZn9xmU9rUVc804vbYnFPsdymOx2piJpvMrrGcZn4HObmyuhg?=
 =?us-ascii?Q?jxyC84/3O6yZTCcU96n2pLcmnyFAwGn3CV3wzAhazz0x2D4HeGZdWhOG+TDS?=
 =?us-ascii?Q?d/R9asrSLk0m3q/MlP+9eje9f8m4DP5ExpCF343Ibrz9zd0KUUnHBdSDZ9kM?=
 =?us-ascii?Q?6iKWxx5BiPG4MOg0AuhN0a+bKm5OjTZBfebxv8lYbOX6JHFcpgInhPxS/98B?=
 =?us-ascii?Q?xcOPDwfEyIXUwNNSnU0kEKb+8PT5wIDTKk6od6WClcBhqfPziIeeGneGkAJJ?=
 =?us-ascii?Q?Zi2EQ3I4VrHwxC5TIkfADunA7He8OEW/7zkyfNlXVgrYCQMhKJkzplS3fcKs?=
 =?us-ascii?Q?5rrD56LSsV2PW9/lPv+0XDQ8lCbGXc633WwkTjbWp+uOYPwBmzdD04pYlnkT?=
 =?us-ascii?Q?3COCvVCoKsKJfRawAPE0hY2QwE6YVAWDQZFvny7VbITWzdfraZpiRfgbsaXQ?=
 =?us-ascii?Q?f7JwqOpXMX+6AnO7u0pMg9tdvcM/E3HKqxWK4C20353W4xby1+hMpcKy0w8w?=
 =?us-ascii?Q?u0sEpOx8xy0KYqRlp26mR8G9H5z2ETX+7pi8iz/b+NnClLM0DCh5aCFqc7o4?=
 =?us-ascii?Q?6hErApZjEWie44JgIHFF/GnF+XZL1BTi8sx3Z6PeHGW/rGff1J5hIFS5HP8U?=
 =?us-ascii?Q?EFXqGxjHWpV83TKGS4+QqkdH6JIG4s/+rKnOaeDeqrDCbc/YlSuI+V0u+H29?=
 =?us-ascii?Q?PdCgfVerm2n/NRkAmTYlJxHTW9NpmOT5wrCy8jbTdB5DmTjwnOuPbnhiyfqi?=
 =?us-ascii?Q?G5JDIEDuK/rLjXz7oQI7ck0A//70hrQ6rFZfteDwhk4A/URSThQim13k2MDt?=
 =?us-ascii?Q?jAi9KjlUb89Pq9Dqw0s/U5U8QEDbjWAGkW70L6BKDXSq1dSxwVxvIkW36KHX?=
 =?us-ascii?Q?Q5Z+lB2Vl+CV+1OSj0rxA0RmMbl5CeTvbhr4qV7l8aCuJ0swhGSnE1vxlT1F?=
 =?us-ascii?Q?3F4qTSepTAGvUO1Hvhcre74WqSeGs1JGLsZyIuXR9QssWKBbZGN71AQn8Adq?=
 =?us-ascii?Q?Cr3YPCiF6aBCBCHkBPNeNsQCRNBBym8FpGnRZtz3AlWyTJAf3rxC8eI7yCeg?=
 =?us-ascii?Q?gQayYovdC27ywJNH2VPZQOIkUXPPoTHuPITiRBC9EjKps/0P/2C1XwK9sj7d?=
 =?us-ascii?Q?5bDZPMPrLY4KU69tFgJvzq1BvQm5bOSbV/1hnpG6IdNZgPQW5MMI3GillDm4?=
 =?us-ascii?Q?XPIFSJVVEBNTjjheUrpD4iry0ZwQn5WefgB+RmDYPcaMHvOkwZqmDuaN6TVy?=
 =?us-ascii?Q?8uLK5pCD595k5LJwieuDk3GM92W2tgpe/dMjibhKLyfTng2bnKBCgStdW8be?=
 =?us-ascii?Q?xO2I7Cj94pBGAfo/+zJPC21TBv87HINb13w0O+qxsH8s5Z6CKmx81Byz6EgP?=
 =?us-ascii?Q?Py7kFfFmxZfJFvcBUy+ahNj442uNHgr4ZwcVf1Zm4yWANNI7o3PLHKBM8AMq?=
 =?us-ascii?Q?otA/AaXlh3yl3dEnySVBosdDqjRqMlVQnx3Fuy0PTlg0/3E5AVxFb4keFDXx?=
 =?us-ascii?Q?JV0PYHu4NujTfrjGIlM3jn9Zob6c3yroDHJJhbQmTFp9BhDURsdsMbv80k3E?=
 =?us-ascii?Q?D9aLXMM/AcTrdr1atOkzR0Q1IL5vMuU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: defe25bf-dea4-4042-ab18-08de4d7895e3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 23:09:04.1083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6QuC1rvpm2HFEdCoeRxMWfpM3Lod7FuFjMUo3GkNISseuS8suau8mSOwfKP6tcjfxcLeMzxbx0klCrRkU+CJVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6651
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

On Tue, Jan 06, 2026 at 08:55:34PM +0000, Jonathan Cavitt wrote:
> It's possible if unlikely that the GuC could be reset in the time
> between performing a guc_ct_send and the G2H fence completing in
> guc_ct_send_recv.  Exit early if this is occurs.
> 
> v2: Rebase
> 
> v3: goto retry_same_fence if ct is not alive (Stuart)
> 
> Suggested-by: Stuart Summers <stuart.summers@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index dfbf76037b04..0bdcbe6503a7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1238,6 +1238,10 @@ int xe_guc_ct_send_g2h_handler(struct xe_guc_ct *ct, const u32 *action, u32 len)
>  	return ret;
>  }
>  
> +#define ct_alive(ct)    \
> +	(xe_guc_ct_enabled(ct) && !ct->ctbs.h2g.info.broken && \
> +	 !ct->ctbs.g2h.info.broken)
> +
>  /*
>   * Check if a GT reset is in progress or will occur and if GT reset brought the
>   * CT back up. Randomly picking 5 seconds for an upper limit to do a GT a reset.
> @@ -1247,12 +1251,8 @@ static bool retry_failure(struct xe_guc_ct *ct, int ret)
>  	if (!(ret == -EDEADLK || ret == -EPIPE || ret == -ENODEV))
>  		return false;
>  
> -#define ct_alive(ct)	\
> -	(xe_guc_ct_enabled(ct) && !ct->ctbs.h2g.info.broken && \
> -	 !ct->ctbs.g2h.info.broken)
>  	if (!wait_event_interruptible_timeout(ct->wq, ct_alive(ct), HZ * 5))
>  		return false;
> -#undef ct_alive
>  
>  	return true;
>  }
> @@ -1304,7 +1304,11 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	/* READ_ONCEs pairs with WRITE_ONCEs in parse_g2h_response
>  	 * and g2h_fence_cancel.
>  	 */
> -	ret = wait_event_timeout(ct->g2h_fence_wq, READ_ONCE(g2h_fence.done), HZ);
> +	ret = wait_event_timeout(ct->g2h_fence_wq, !ct_alive(ct) ||
> +				 READ_ONCE(g2h_fence.done), HZ);
> +	if (!ct_alive(ct))

I think you only want to do this if no_fail is set, but again that is
dead code and likely doesn't even work as is. I don't handle the device
wedging nor does this patch, so either case could live lock.

Matt

> +		goto retry_same_fence;
> +
>  	if (!ret) {
>  		LNL_FLUSH_WORK(&ct->g2h_worker);
>  		if (READ_ONCE(g2h_fence.done)) {
> -- 
> 2.43.0
> 
