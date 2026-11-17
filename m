Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B820606A323
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 12:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kSwoUP1U;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=cBD1nbWT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E93B10E5C4;
	Tue, 17 Nov 2026 12:49:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8326B10F6CB
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Nov 2026 12:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794919762; x=1826455762;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=EVZn91Wvit1Q7A/xNne6ts1sAp7mhDrlq17Rw1EHW6o=;
 b=kSwoUP1UlpzTvM3vDpfX3HthNRLLqCaPfL2OadgzuH6Tj8AVnlZ2Fui3
 G/D8Cep4nbU/j2VUiotokM4GCfcm1FfZtXyUlQ+cH9wL8HyHfpDp75koQ
 7xhM/dXI91ndl0PuPsILt+11DZyJXslJZh7Atod2j90kWr0b5n96ZWHXt
 r+fDFCv+GwEadOjpRYDax4qBMaY49bFtyR08vGPlIRpe/T2s7FFX8r6qD
 sTtkzyphh2OSfF84SWfZjjG7IigUlXDxL2O7qJ/9mGBoNaAASP8kl7bVa
 6bv2On81CKGj+rffSYj9ybFCiVZIpZIfT3PN153rxDNrCDdG/IlovYq3M Q==;
X-CSE-ConnectionGUID: E+tv+rAKTtCX1ubtyMw0sg==
X-CSE-MsgGUID: LDjnyCbQTTmaav0ldWhZTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3602033"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3602033"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 04:49:21 -0800
X-CSE-ConnectionGUID: ze2tEBLgQFOZklPDdHWyAA==
X-CSE-MsgGUID: e1ONIxVoRGSx3BdddivVcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; d="scan'208";a="10229388"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 04:49:21 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 04:49:20 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 17 Nov 2026 04:49:20 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.59) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 04:49:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VOTe3ZG6z9UukoH9H+IaQ6TkJXYTDQCsAE/dUFKIU/XHv34KV1H4XQwu8yciybSkHqPYHX0oRsU7ZnHVUkmtL+TLXhvu5+nBCG4iXu85cm6pl/O3wUkpYDw8cxGYz9eNvTg9822Vc+IleAwEdj9czpMkrQ8p+ALv3TspukJGlvTlgbHD2A2KG2VItgTU8h0iRvIB9hJNLhqFEXpfkwelrZ0s2ESCVuXIG6Vv9LQyx78uRwnPZz6fn+tMZGW+3BiYT1UrpKRuP87FGEmIzgii1M3h7iKDr2BatWEqG79eoFNyQTVEt4kh+AV03cRIOgZ3cRPyXkJVnKv8XVIBDo435Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/Lw/iHgXW2ng57DYj8fSYA7BqJJTO/ldH7NOUKmHHw=;
 b=L8UHVZcJxIeDvq+Oo49txMog4wD+2eS7gqjuI9wcENUZBVru22ytzS8PLbmb8sAlYVp9H6S371KfUniE3c2xdCkiEDVWdGVo+v5kSkOTx1G/Sjq4eWFNIbHBXqD7tAppBJIjqZhku4BoBDXuzwhhcWVXivrHAdcx3RVdjn6+I5GhWVcOZTc9RfIq/06/mgBgBrK+5iDBCwvFqdhMZw5WhahBOOcKGh/caMst9DdoZGLIkdtO5MgmqqyzfTrjHJhVnnukMqvDTh/CwpjKmZwRCvzgQZfCktVKmRYiyeEFBMLs3VoB/szJvTBnCNsZcBvjLVW6fWguRLysR+Ok52ye9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/Lw/iHgXW2ng57DYj8fSYA7BqJJTO/ldH7NOUKmHHw=;
 b=cBD1nbWTIpMRkK3fC8ls+tB+1ct2D+wbn1lLo6SgleeigbDi5mW8UNs7iPJDjH6N60+53lW/VCAkdm2lZ3Yq8odSyDTR5pN89JvMBrNn4GPliCbkrlictFQqtMhhV9j+4wZupnoG4d3t0ewCGNxZ7zg9XbeA2s5fAuRfiqAJJMI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by DS0PPF4C13E72FE.namprd11.prod.outlook.com (2603:10b6:f:fc02::507)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 17 Nov
 2026 12:49:18 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded%3]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 12:49:18 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe/lrc: Fix math in LRC offset comments
In-Reply-To: <20261116225052.1167601-2-matthew.d.roper@intel.com>
References: <20261116225052.1167601-2-matthew.d.roper@intel.com>
Date: Tue, 17 Nov 2026 09:49:13 -0300
Message-ID: <87v75v7hdi.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0211.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::6) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|DS0PPF4C13E72FE:EE_
X-MS-Office365-Filtering-Correlation-Id: bf87c444-f080-495e-7bf1-08df44a9319c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|261022105027099003|11063799006|261021123027099003|56012099006|261026121527099003|261102123227099003|261022075727099003|261009223027099003|261021121427099003|261026140227099003|261028144727099003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: i0cynrPHRHCby2WyDFM4Yo60kcuGqDgj0jzoUbCHWJs2Nky1jbbrD3ExjPoSVBFOnCRSlVup0BICRbh+aJrk8DVmwRkz/Vi/isbfyUVrOHiiCB+/ZGOeqllAT/dn6GmeVjVQuXEDEeszObS7ZW3fniBJdPTwrSKx5C2TEoD2bHGjtPL48vKxTlaYneLg5p3bHE7bEa6ZFoSh3Hdqhsf4DzKBe461WatrIqnOfbXSsHjKFrFEErBZfZThpCpdSjKWpHBTnSFYYwV55bB2H1wTJ1w5fBSp2G1IiaYrZQLOzbn4I7AEaMvX2fJT4hwmHBNU+D3FiY46kLaoqZN8YmDX39mzaUD8vcFV3JVo0yQuP30ForaSQRtbf6CmhjvNfyfNrcnjejg/1na6FW3HaRjUBO8JulSUAW6y17c74yEUvcqvaSDPQhx/Yiqn48fjj1ertXJIFLz0RwEnRFzS30pFGt9Cb6dJ+SZ+hT8igD2fUov+onN+EoJnooJp33zzEnfN3wkghlRxj4SfaXABSqiZJ3IIufaeC6Nnrnyn5Gsy3JDRDD6lKRkBndAhftVWq3R32UAgHrlh15KbjHLNZll3UDjjiqH2Eh626WtuOe+3tDkapx7g5DG5LWIgk0oLphmxue0o90kaW9nrUIwPpw2TraqkZWD+VUhWgY6BcPbhu/I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5095.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(261022105027099003)(11063799006)(261021123027099003)(56012099006)(261026121527099003)(261102123227099003)(261022075727099003)(261009223027099003)(261021121427099003)(261026140227099003)(261028144727099003)(22082099003)(18002099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ERMs33YeWqONojMJIF6i6iaP3UXrLjG/HpruU8Lp2hnmtXUkjLljzn/Clmya?=
 =?us-ascii?Q?puVzTGjRHstgnIiwcfkToQPheid1Qz1cD2zlWsBFIowfviZXQuZbRYY21jy8?=
 =?us-ascii?Q?hyvBNwDhuTUzPWGuOHBc1Vm9cix5XwEDSiqWBaeq6ixMna/b1M5+LhRX7YXv?=
 =?us-ascii?Q?MIHvsEQcmGvellFFQr2To+YMyB1hFH4SOzx2Ess0ZX7Lr2FubH6VkQeSL0HE?=
 =?us-ascii?Q?XzZsaz2nbWul8rxEctOdeUNsWZsystT3QmqzQsjkEguHr/6HSZsbNJ3eoA18?=
 =?us-ascii?Q?klYdoMnDX73rju/3ZUvNKAOYWpAPD3ZkIGQ+LlnDEq5PAF/8ByCqeb5Ppk0D?=
 =?us-ascii?Q?o+/sfzYAMAEUGI+40Zcg47VNabguHrAB+Sc4QuqqSuFKipyGmGXv/Lfubo2d?=
 =?us-ascii?Q?dPLIIBUqLkuR+xc9wExYEe4U3jUXG5hbCc5TWWY54vYVRV9C+b0zmejBMuu4?=
 =?us-ascii?Q?T8KQQVZNzii0VC9LSiqjutB7QHmPvDPCcybypeO7YYbixhFaNSwiq6AwtTbh?=
 =?us-ascii?Q?70ThuvAeY90glRLeUgOYKTiRWsqZGr7p6yfhHezpJ7JPKRuRHbLGiwprl0BE?=
 =?us-ascii?Q?WaftvvSiLtHdbo3s7hul0P/No3+MDj3bU5ncapG8uZgi2iLLWbsUd+2JtOn+?=
 =?us-ascii?Q?w4RD/BpZQmfudPB9Iwt7zIJU8CNQ+Okr/R33v1G5NC/HhkUELyi3poF/F+KW?=
 =?us-ascii?Q?zT8v6A4oTnP+Uc8ZDVuiWXaYAvFVOuMViF2ZzBR17dhvm1f/KPIys3hB8VTf?=
 =?us-ascii?Q?uJKVPByitsMIypbC3qkGdVrQ7GsC9JGA99a91MHDNo9kRHd+lLtEo+cc2/ZE?=
 =?us-ascii?Q?orX5Qf4luDNExF/12CkkMegML+W5kF71ZR1fKb1pKp3Ib9GwnMPag0qdA23Y?=
 =?us-ascii?Q?j5GGtmUHILbmw7XpjfwuFZMa5TwHicrmPhW5WZTSzkP/1GpN28ZcfGzzNkom?=
 =?us-ascii?Q?Ayq/XuEM393s4ZF6BMXSxJXGBOdiewFvOo3bZhNBgpbCZyjwmxllZh+enQPi?=
 =?us-ascii?Q?q9v4+aqg5zq8lXAdbU1O6jlED9yOxyLuKdzmbs6EMQBELeFWAS/33Fh3/rJu?=
 =?us-ascii?Q?Q/2TBWZJxkMcIYaFtUbuE4j3GkhvFtNnQtSZc52I1HkRYV7Mkd4VOaJWDPBA?=
 =?us-ascii?Q?TMkg2UdCB09TKz48bS6is4Xs180O8/FzoWMwKJJ77ihETyb/0okqDH4emFAL?=
 =?us-ascii?Q?9KjEq0atV7ccuX3Yvjzl20lkL05OYEE3O4tsRj5/w8upaPaCq4SHYcYAVVHL?=
 =?us-ascii?Q?r+ih3runYKS6n9vLL5Jq8bslk2nNdMv7s1AD0EBvXuHdJT75yMUHfVBwrz1r?=
 =?us-ascii?Q?zoo4kW9q+FasWaBhhUFiN5pZ0KkzXQZFYACCdMK4cXHohJRC9HhTZroCCrOh?=
 =?us-ascii?Q?VTGva2r3WeJNIb3a0Es58OTCl5t5vL3k6IMGtc+eDZkclDpcxe93EHEf0FBK?=
 =?us-ascii?Q?lqcMIGMpTQDO1etelLbi8FkJ5uGr7RCW+O7hbpu7rOqRNS0TuyeEJK+htczR?=
 =?us-ascii?Q?aDykg8+gw+YypiLOwEXxl1kMaKDTkHVQzxbPbvTex/OFCUOg8zqX4SfzGCvE?=
 =?us-ascii?Q?aWRxzEck2AECaQ00u/zxLxndpu61GnrfDUdJVRx/8h+HpGLo+yiXgZ7GC25I?=
 =?us-ascii?Q?ON3hbPou+aciNhBum1v80Tm1Ic9P9kqrzF0tf3secJI2Va8H5LbvEoUorB3G?=
 =?us-ascii?Q?zeQUzyLA37C1VG6LGu6eQQ5gQmpEJkWFKLumwLzfky8hlwpJaGJ8D1wOsasP?=
 =?us-ascii?Q?uy2+PhmFYA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 2JPvu4JpaBxjhQ0e+E7z/YFBPGUWCbIlQ1mNNly0MPCJ7+eCscKDiVqkBNgZFa/t57KaPewr9z5weOniZeBWRwl4Uj2uGJU0a8uxUuV3lrUkdjzbYNrQevG+OOiYmnrXksX0Qw8UNrM8cdNdjhppuLNXukzyxfFwP6yvONituLpCHbgEGGkSOAPK1aJ2452jMa2FLXVLwVasf9LK9Xmox7mMzxcRR0zzV3e6ZI/zpMHwU5aR2f7S+41YV7bbKSOhlOruMfANAVg9bIWVnJGasRdFQBQ03MAY0enLDoLUy32rd5rXxSByNeVulO1OxWLdyZtVFSbrE9IUBWFcLNk1TA==
X-MS-Exchange-CrossTenant-Network-Message-Id: bf87c444-f080-495e-7bf1-08df44a9319c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 12:49:18.4581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5/F6FpraSRHrsRKIdTqe0T6SFNyxgK5Rr4s7TTbaIrVo6IW06ja/IBpZB+LmIsiBHv5+gUadB2dM+RmKzrJfdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PPF4C13E72FE
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Matt Roper <matthew.d.roper@intel.com> writes:

> PREEMPTION_STATUS in the Xe2 RCS LRC starts at offset 0x39 and requires
> two dwords of space (offset + value), so the next item in the LRC starts
> at 0x3b, not 0x41 (it appears the number was treated as decimal rather
> than hex when the comment was first written).  Adjust the remaining
> offset comments to show the proper values.
>
> No functional impact; these comments are just for convenience and don't
> relate to any in-driver logic.
>
> Bspec: 65182
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 8e4f767d7f59..54d50b1b28eb 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -563,9 +563,9 @@ static const u8 xe2_rcs_offsets[] = {
>  	REG16(0x5a8),           /* [0x37] CONTEXT_SCHEDULING_ATTRIBUTES */
>  	REG16(0x5ac),           /* [0x39] PREEMPTION_STATUS */
>  
> -	NOP(6),                 /* [0x41] */
> -	LRI(1, 0),              /* [0x47] */
> -	REG(0x0c8),             /* [0x48] R_PWR_CLK_STATE */
> +	NOP(6),                 /* [0x3b] */
> +	LRI(1, 0),              /* [0x41] */
> +	REG(0x0c8),             /* [0x42] R_PWR_CLK_STATE */
>  
>  	0
>  };
> -- 
> 2.43.0
