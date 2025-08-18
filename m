Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2B4CA0EE4
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 17:54:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0870310E02A;
	Mon, 18 Aug 2025 17:54:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KE6IBlXC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AF7D10E02A
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 17:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755539675; x=1787075675;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=g0CDTbjLWOXNS+r5deQpNS59i2mm+sswSEFd2jC5Yss=;
 b=KE6IBlXCw0lqzEZqDHjLNuog7uX0t4LDWPOSyLXRrEDJjc0Le4DMF+6k
 xlaZtFigUWsKm/EgTnoeaJqdCQSY8UdEnq0gvor6NObA6Ev5V+tEDMwEq
 QTu2DMsfRd/SrEn3X051V9rFafnMKmbcKaknnaKc9EuO9HKJBuNMNvwqV
 ojetBHGj5Yi0t24Iyb7lwnmZc+WBzMr+5hc6JldweUy99EaLzBxP3oM+8
 zeQx/ggseqd1OPzGyN3hHjanT1HfvP8VK/9kTuuP83CDzP3N0+dQjtqmg
 sTZCwJXjFt06zBlMG1pQ3ijssxakBzUvO5lb33hEoMo1u6BG+xID1Lm35 w==;
X-CSE-ConnectionGUID: rnm80MRQTQedPg6r1ZE3cw==
X-CSE-MsgGUID: kDCKIU4kR9y0PTM/YMt8LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="61607670"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="61607670"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 10:54:35 -0700
X-CSE-ConnectionGUID: OVWSjaHTSSyIGptX4Q57Zw==
X-CSE-MsgGUID: TvnGoNFaTomTXWl2ktcA3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="166873521"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 10:54:35 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 10:54:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 18 Aug 2025 10:54:34 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.78)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 10:54:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J1AN5TkRft02gZiRkhasnBC0cIpIEyTZOChR9bu19mObsdPfsTPQRBgeoaRDIGiv7TmGyL8X9McIRSvSnv3WJf19tWDFD0l5mIvB3WWp0B/nYvQ/UzVj778LUawDNnjXodt7Ru3rJwmgaY+YxaMJd0r0te4oDt2tco3L+ZfurzcW4w5odAnHOjpfflaV9UuFPJrxhOtINh1XYiJEFtOiJlgsF4QLoio99mGAOXSymRt+X574T2zvAaCkE5e2Qom7m1barbCBiJ2LGxJjz2xCJoEqXBH/vDJNsVElKEIPjMjiXmDAzrwoJX75zDTA9R0c+zMSj5gYfavvVZL5cvp7ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+8W+kh4/xSp1u3RAtjGAMjtJpKLdUVmsezilvceo+8=;
 b=Kpm0rNInF+zllU265fhjvho6+NdIstfjsLCH7GVqzf9pzH5pYDk1yn/BJI9liHhVG3zU6ZNEY6ihZVDxQfDrXuiNiHCQBmVMf2JEeZ16QrBU8nS/nkD0seWQr/18wiDvoLVyHUZjOL6jIhr0P2O2izSjNzIQ49e79J83Coxw8ZKPRfVuvz3PY//SjEcpf3wYzztihcdIFpcB0w6HyBtXXZQnvGDD4pAL+Lv1CyLRrjYwYYM8arFum5IVwMksOO+wQ/DnXf5JT8dLr0Y7o/aJJquhG2otO9g5ymmWc5RUgdf38SUAQBixm4sUt9EouVSO90qqiSbtl3KwsYrwXDFZhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6552.namprd11.prod.outlook.com (2603:10b6:8:8f::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.24; Mon, 18 Aug 2025 17:54:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 17:54:32 +0000
Date: Mon, 18 Aug 2025 10:54:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Simon Richter <Simon.Richter@hogyros.de>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Make page size consistent in loop
Message-ID: <aKNo1Wmpv8qphBOu@lstrano-desk.jf.intel.com>
References: <aKKYLMmuX8eSmRQU@lstrano-desk.jf.intel.com>
 <20250818064806.2835-1-Simon.Richter@hogyros.de>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250818064806.2835-1-Simon.Richter@hogyros.de>
X-ClientProxiedBy: MW3PR06CA0016.namprd06.prod.outlook.com
 (2603:10b6:303:2a::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6552:EE_
X-MS-Office365-Filtering-Correlation-Id: 34aafe4f-ab08-4432-d033-08ddde804936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?D/VKdkOmx/+xnp/njXFA+rRKPyvYXOvDq/DzUHR/LHsSA8IgF/dpxNVnSkj4?=
 =?us-ascii?Q?kOWj5HgNH8YXv3Wzyi9Q5rQfafFGmTgUvQXS3EklncN253mscjnXvttL8INe?=
 =?us-ascii?Q?9k5oLfsYw/dVsSitNo5SJFJYY2DjyyWa8Z6KbWIuuqniH6KIVEr04j3DxaMd?=
 =?us-ascii?Q?p3rJwiDKOmfa+tKgdfYcCpge7dQHT5am+5xWt185DNmWlKv34RspdcPHYzQz?=
 =?us-ascii?Q?jH72qx4f5CTSmgG+q+kOFfkYVjl5tfRah8Icii+PR9wPB1VfEl8TqSN2ek1B?=
 =?us-ascii?Q?6dTra9zp47fKKjq4nX+CW9b5CJNbflFWyRppek45H86H3/4ypcHy/q96sIsL?=
 =?us-ascii?Q?X11QkJcg8z+IuBLO2wpVuC1uS3aich3qsnJCBuLEelZ5KFWP3ZBKB4aAIo/s?=
 =?us-ascii?Q?Zoyp7Pb+L6AY4B03LZALmEXyafG1H+9tVkNGRLQa4JWiiqgQyPOeIumRkSrq?=
 =?us-ascii?Q?j8quh6hk9iLRYIktajKuZzn/GMzb5k8T7dPQBWIKqg4dxIKkwUYZNZ5ucfzx?=
 =?us-ascii?Q?tEpTeDo4ZFolafg12xzTNBQZcW2hzhmm7lkYPX3wnunjEoICpRkCZ4nUOiwH?=
 =?us-ascii?Q?HDpyymbbN4UY16zLnX2HSiXv07EFrBDBCOHwAjTCdrW0otsn03qdO87/8QUk?=
 =?us-ascii?Q?7HpSzV4qMBgbhKujdqPgr4tneTcZIbDifzBQ0qiRNfP8RNzKoGemfGgBzjww?=
 =?us-ascii?Q?JldTO9OKNjdWFqUjX8M9tsSdFX6ZctIo0NSHu8dlqI4VHg86fLsR2zLo15gJ?=
 =?us-ascii?Q?sshrfplKqw5v98n5/G4dWSVzbrHSp/EGgn6lCsAs0vJcKl49oIyYBiFstImQ?=
 =?us-ascii?Q?3kM5WlRRR64F8NqLT52HUYzY8Gm6nEsgs6ZUJssr1M+EGuFxlQQH7sukpihv?=
 =?us-ascii?Q?NaIF6Dek5eQvSj2V/qYuQFplqNPPfEmHccqY9/BSsS9IHZBZujAUpSVsQGot?=
 =?us-ascii?Q?wpZ/elpUBkYdPZQqfyuBp7ygzwe30qW46efrZnS7LAhfzGuLUPo4IBwMI6lt?=
 =?us-ascii?Q?tGVSN3fZYH4Ravv18Wyff62lEZBtkJGU2Q/AtQXRxGAhLlv3ZSireQNZePXs?=
 =?us-ascii?Q?f/FBI7pvZz4Ae1Ry8/zAkB9IhTl+guyD3CQTQgTMWU3/CiFSvcckIWLm7pJ5?=
 =?us-ascii?Q?1WJsuEq4cjDDEucpnKn7AyiJWU6i8kL+T5IHMpEP6k0ttnGsIAtR9M5LqYCf?=
 =?us-ascii?Q?A00oj8f3N6NDyy3SMGds3A/gj9Ny8YDIq0XRERB+NTfRUNx4VoHF015qHYjW?=
 =?us-ascii?Q?nzg/Ut6TK/8wJKv/dSWIrS3HHSQ16H7go9qiPC/4NESHCm8X/e9qb4mF+7La?=
 =?us-ascii?Q?nGdVnGPOa5PS0lvfiaFISlaJyORLKwEFTammJExaHrCZds4otdLz+L2F80+U?=
 =?us-ascii?Q?CqZgIoxfrmGRvVyK1DyTkvOZq8mRA0guV7s8SXckYftVTwi7V1zlNgWzfA6H?=
 =?us-ascii?Q?qFXKbCtrAxI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QI/xLqLabg86glbik1H6rKOT/TqxttmRNHmoHEBVN0a0KHcRU6LiOFHXnMek?=
 =?us-ascii?Q?+SxkvcP8CB358oSnLMpoC4ChxpSguuBLeqZJVHAWnGH52KS/+uxn8t/5/Hbu?=
 =?us-ascii?Q?6IU7Yt/AO2tQ5LVws7uoR9P2oMNJ04LdneV4FOMQxCpSJXh39k7u9sNyzSJf?=
 =?us-ascii?Q?MC+ZaX+VRF9MOBYWiygUuXGFOmsYT5zdU6p4xu86Zay9vV4NSMZFNs3jgxG6?=
 =?us-ascii?Q?IlBXM+A7zK39VtaNFiwVqxPQqWkoQ8ro5rEDXw6Mc06Z1CRbWs9trIyxfsKj?=
 =?us-ascii?Q?H7udfz5eB/XfwHu79Xv2lzemgrJItusI5V3YoiqPZ97g9/nHi5muqqqAWAYb?=
 =?us-ascii?Q?G3NhZbuNbN5xMXBhk51fovWM1XrAvO9FQTC9f7wW6/s/B1lgvxkhfHWsIQIj?=
 =?us-ascii?Q?BxBqureImTTn6AfHy8vcQuQSPU+Ijx35y3BNBlusFa+jcG5V2ZxFYIfy7PZ6?=
 =?us-ascii?Q?jESN7wkTGYqJcl26LhS4hEwkfKGZMczWLZRoQ6sElyT3rwltVj0tDenjoYv+?=
 =?us-ascii?Q?kCZc5Pv8QRUG/2OlfKCWdtsvazfO5fxxWRIQz7agWg40yPXN89PvzkH4qn5A?=
 =?us-ascii?Q?j8MT+f7ruUsLx4RJnRAMgEi3WIVZ7CG0auOO4Dz4YTAJ+LFdGMCUZX15ScrV?=
 =?us-ascii?Q?UIhRhlqSUN2ZkCOXHLAX+lMD03I6tl9dFNpEdQidsasSzWxTz2Muk+uX/xgw?=
 =?us-ascii?Q?eBMqOd9/bEuMqIWVhbhVJZTSC8DkBCVMO1IgNKNDYGhHPnnoEeArb+bEIAGJ?=
 =?us-ascii?Q?HJxHsxz9Xsb+n3ecCSrjU9sdTCsTnqZdVo+9RzlD8llrJHPg95EJGEXlkDxv?=
 =?us-ascii?Q?2YpOUH75/LucbQGTm0J+3pgCvX2u0ja0uTKeSGUUAB/sovMlM2WrxQWbKSek?=
 =?us-ascii?Q?2hNnQjIcj+hcUHQNfmNk8FLYhOVtd4wtdRiesw6pIJXS7KXzA/gB+U+ovQuL?=
 =?us-ascii?Q?wYS0xmbEYtKu6jnwE0UrzPZYYjEpqv8JBVfJROLWwwtRDUqO5oJRbpfHCiGR?=
 =?us-ascii?Q?OZMR2zObeKCnUU2IMlUbMlSm9RQgpO3V7tVtze36W1kkP1sSump8nmADKAJY?=
 =?us-ascii?Q?T/AAP4GuaNkfWkon8h2KietOZ3tBiEsN8i8aQto0X/SgdOX+k3+skA8gvrrW?=
 =?us-ascii?Q?teI6qw4H25UleBqw5+qVa0oP1u/IOVn4hfAqcNXBOE27jDpM+yDQ9dQYEueN?=
 =?us-ascii?Q?VneaOUc5qcNVt5N8PelBrobVtmmTsywmy91o/16jrNgeLjKfFNQhwBBezmqi?=
 =?us-ascii?Q?N3CEa0PBdamQD4p6esj3RZqA1GNf1cxysJcH99H/dOnPURiwAj4bn1YY7M2a?=
 =?us-ascii?Q?fDpUBVVYn9FYlpQCzElLCQAXvQocGkpKro2iLct6AaS66mCfDm630w6ww161?=
 =?us-ascii?Q?gLJADgtbmmCLGZfKXgJ1mlXVbstWQKIeqfiRZ7HYPPJy4phzaiq7S42q9+cA?=
 =?us-ascii?Q?1sP5n5UfpinKBEIcQGgABZrqp42XRH10cVsA78v9jHhG4Dp5sP6kOfSuwlfZ?=
 =?us-ascii?Q?clpU4oJZCxecgwZpoT9Fe2JPJcqIMjBNRk6FmcUMNbVsaybfK+c9mxdYabg2?=
 =?us-ascii?Q?yAn4sadJmdYKs1Lkc1w7Ag35/dSlKTte1EOfGNYK0QOmEQcmQu7JoNPcmp9m?=
 =?us-ascii?Q?Yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34aafe4f-ab08-4432-d033-08ddde804936
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 17:54:32.3238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NQC9gn6Cswn15tY/lwPMPW4OpIK9XdksldhqymcKbj0v7ml7W5P/sn45TtVOb7PvFleIVzrHVuZJ5htg1bAagw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6552
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

On Mon, Aug 18, 2025 at 03:47:35PM +0900, Simon Richter wrote:
> If PAGE_SIZE != XE_PAGE_SIZE (which is currently locked behind
> CONFIG_BROKEN), this would generate the wrong number of PDEs.
> 
> Since these PDEs are consumed by the GPU, the GPU page size needs to be
> used.
> 
> Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

I've merge this one for you. Thanks for the patch.

Matt

> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index ddfad7506a82..57e6d5a8ac39 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -280,7 +280,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  	}
>  
>  	/* Write PDE's that point to our BO. */
> -	for (i = 0; i < map_ofs / PAGE_SIZE; i++) {
> +	for (i = 0; i < map_ofs / XE_PAGE_SIZE; i++) {
>  		entry = vm->pt_ops->pde_encode_bo(bo, (u64)i * XE_PAGE_SIZE);
>  
>  		xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE +
> -- 
> 2.47.2
> 
