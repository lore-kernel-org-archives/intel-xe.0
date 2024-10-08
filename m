Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77593CED278
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 14:57:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456E810E570;
	Tue,  8 Oct 2024 14:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LBwt7vER";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C9A10E570
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 14:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728399423; x=1759935423;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TQHQLWa1FMTvvn8kxTcxRNAHddtiStGRrv1nRbeweak=;
 b=LBwt7vERD4fT9D1ZRb6x4lb2akElwQOdcQa1yqYOqPI79WUkcTw00K8t
 Ds6fiLTK6dyjFzewTW2RyTIJiOaBfRseaCCu5Nm9yJ2scaC7bMVuW961N
 KO+qT5HwDcX/UF8mhO+c0oNmFjEr4kauHj1O3pUDqpYV51xpjksxq/9E/
 OYkle0Zl1uj9XhZkEdK7bxD5OQGIIPxP8nUxneg2zGn/+CShzqh/imqJ2
 UnJxY18g/bHdA/C52RcsLgHAkHwXMXKsFqpX+R+8UJ+vq5vDBBamBFSKm
 gvrOcxixkSidY5vz3ZvXiYkeyJ0J5iiaasy/eldrCtofKWaaUluCLtJ3S Q==;
X-CSE-ConnectionGUID: fYOj2SB1RQe5RnDsXq/cHw==
X-CSE-MsgGUID: I+FKfXvZRW6iin5O9toJgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27722455"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="27722455"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 07:57:03 -0700
X-CSE-ConnectionGUID: W2BirV2+SAu/Zn5u5gurBg==
X-CSE-MsgGUID: htCrai0WQiaFjHV4N+59KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="75732468"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 07:57:02 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 07:57:01 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 07:57:01 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 07:57:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wN5xtYzIVU3zo39MqTKYbe9oRre/Ec6b2X4c7NDwlqv4VEbFsNWn6wkafIKeO3C3UC+iBBsptja9SIijnTx8I10zrJFg+z2pajzaVcyi8QRiTrts1xd5MYWRkykglgAVKnUI/iUxwJDZZ23KsEKSJCU32xyYjVYP73OoDnAur2VXueA27nc7QwKFDMnf0koViJL9QIp778dgJAxeVvEHG/teQ56vwLAsc4mJhzJUgwqcShiT3CY8yQ/u+Z2hnhDe29Rf38lQPDDS5jQ6zYYNxINQDozPBUjT8nNS4BGcoqEJsIVNQ5mzEetQBa1wxKchS8HtU4CYWRBQmDv/5lfn8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ag891LSyadonINmGBVotXbyB3L2MzvH2VZISL+aERM=;
 b=lN9TTx+7HAzrRvZjBHqdxZETTXeRWn0+u6alK6SFlJEOfNrRrHrqW/1BDTp5oh2tRHbWqPZh/MxPjJ6nUFo/sCW13Yok5udT4qXTTpBIBpXNWBjjqDp3sCPqIe/EK6pTcYROuo/QJuqcHVAP8E15zlgvaBVHCv9+JLDE1UnH9LpYfmKxVkztK4X1/v/jW9897yltRV1Ekgz5ryWmhjyeMO6yR4kF1zQqx0/enQuiEkiTLO4GxenXKB1AyNSrmHwgxsFCWAFvdRQtZG+22MU6mk5T5N6ccvOVk1cYArFKn40B3QBi0PVzze63Xb5KfvZl6mrfTl8t3MEBOePquCZYDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7804.namprd11.prod.outlook.com (2603:10b6:8:f3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Tue, 8 Oct
 2024 14:56:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8005.024; Tue, 8 Oct 2024
 14:56:59 +0000
Date: Tue, 8 Oct 2024 14:56:49 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe: Set mask bits for CCS_MODE register
Message-ID: <ZwVIMaD31AGX6UxU@DUT025-TGLU.fm.intel.com>
References: <20241008073628.377433-1-balasubramani.vivekanandan@intel.com>
 <20241008073628.377433-2-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241008073628.377433-2-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: SJ0PR13CA0055.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7804:EE_
X-MS-Office365-Filtering-Correlation-Id: afbd46f7-4092-44b9-f15b-08dce7a975a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vHsJpre3xPd1vToUFiZRFm5W0MA+3zgEQK892Otj3wSBYb6vUDV6LefsQZyz?=
 =?us-ascii?Q?yMQreH6H8CRomTbLvRf4+EDeM4f+l00w2pCrjVLrnva1T4KXua3K6p8lJibN?=
 =?us-ascii?Q?fUWlvrT8gQkuytDKBsmToVaCKJqh3BQ10Wj7UINSNbrmWLwVdEAZbbATfFEH?=
 =?us-ascii?Q?SinorMjgdpZ0yIOCS45z3jvqBSZkfHSi71tyEVtu42rob0zFigHq8e/kJEPM?=
 =?us-ascii?Q?elVDPtQT3syl5YFMtnCtY4aedY56IehmkGLR1v5PJ7iFDzCoVKCRrN7DsRLY?=
 =?us-ascii?Q?If4MOl52y7dO5JZxLoU7B4jckofz9zejYzEu4o6rSDbh4zWaYaX/PXuGQ4CE?=
 =?us-ascii?Q?htr2kj1zE/tgLj0mn6FFGPm76sd7VPFZbte445P32LdNUWy88KC6tlzwy2ER?=
 =?us-ascii?Q?9mFyLu+kvyX9+RVrHa9JQq2EzV3hhm4rBiafk1Hdu8y5XiK6jChU0/DDkXsS?=
 =?us-ascii?Q?dBU3F+/Mamm5H+xowvAbDi5re8QmzhfT66vecBlcU1iuaZkMBefkUG72lnaL?=
 =?us-ascii?Q?pWZyUqw2kvkxAv44j+TM+XhCdz25Skwb97Jj8aO6UWkezew3edUbYguuFLjo?=
 =?us-ascii?Q?uHNYReymd91p8LCYD/2k0E2Bun0Wmdag9V1vqiRoUXF4WV6l1ct6s9ilwm6j?=
 =?us-ascii?Q?3sXFs1NBD/tDaIwvYeWpBInxQNVf706ueelwLvws8maryXKw4jQHPW3b54bR?=
 =?us-ascii?Q?b7R621KuZQ0xNY6ti/AzqI2o5GTEbI8Od0PK4exMIbykHJB+BXKDepHC8ZkJ?=
 =?us-ascii?Q?/Nxit34eJ72B0+BQW8+de+VZvW5VWdyYSxNsYyX+JX4f+stJLRyegDh+5JZF?=
 =?us-ascii?Q?ZzvLw3TUPh584OIcGPcEqQiCDorDOTwbCZSROqMHs30vUowfa69wnR2bPiH9?=
 =?us-ascii?Q?Rn2oxq2XRxN2GRXeRo0bOM8lm/lEqw/sxObr4v1NiAzFLvaFO6fw6rVOgZtf?=
 =?us-ascii?Q?eJ1l0S5SK5zEyh62gTiUxJMz9tZNXx3nOrnr/0+W+/icTUO4PDHfioVTchhd?=
 =?us-ascii?Q?Rnc+dD98SZfaFeIx5eJAg1BNNLKGMg4E3+s8dMFHqjL2P9pxhwIDKDtyqFq0?=
 =?us-ascii?Q?yhOXg2tT8ZtS9nvsNht4d6uX1BRb1XdLgfPC1EdsL38wmjZ5noRaOku6Txoi?=
 =?us-ascii?Q?0YOFlAuQcBpEae0n2Rs/bBSWsYgHz8NScFFF5h9njZFsDjn6IFBbU/lrYCw1?=
 =?us-ascii?Q?avtv7kxhhvch6Kn4lIKPDfgBjo9Fwt4yfrvbsJ6OMzRxkHWVEcXTSdHucQpl?=
 =?us-ascii?Q?sKtcOSWqk1RpPPjTRWa+sra/Hbgu7L5DbaBbPjiNhg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vGLXiOZQN408+M3IpXwpZssas+k+PaAXMTmh2YVlFeAjjjj+h9jj8TNbaD2f?=
 =?us-ascii?Q?C+laeSRXYwQ25tXgANA7r3yZQBLJUwBoU3YxEEyQYtCtnV0yHe9ZZJukpGNJ?=
 =?us-ascii?Q?Ki4B3c8nayd+oasFNvYthslBV/Xf4hxd0eUM5Ek8l/hPO2be9KYcFoMByg8F?=
 =?us-ascii?Q?ukL4wfyDeoSNg9gvXo6EKsBVWSymYuYeTfjHHZQWEetIjL63ymIkLLn3NcWP?=
 =?us-ascii?Q?LzWMOq6Uitg+aXg2+fLCkQ6VH6RytAkxKBEm/478nLFT22ClAj59bneiV8jh?=
 =?us-ascii?Q?jZCK3UtqEKtJxsiO+Ld98GsxmX9JzdT3ecao6FGBkSKZRdW2s5Sz/bqPFyby?=
 =?us-ascii?Q?oun6ckT/xb/yqYvd/2aKyb45SkdM+7dA3O2wjBLBRM6cjI0NRTfEY+g9gcF+?=
 =?us-ascii?Q?WikrFqn5jpU3hkF4/xVcKRFtJZJf1gl/8PExsmtsq/rYUeiIwbH/LLtQceKk?=
 =?us-ascii?Q?irtAbD1RiKeGSnV4Q5iZbdxJMGhGy7MXNLhrtwiLmI9zdk5VHoDGC2OLRuqz?=
 =?us-ascii?Q?28LLbrg1EHNyhD2JhaK2lZxcEgic3zYc74SR4wqJNjThuKHsJci1Q83OnuR1?=
 =?us-ascii?Q?Ts2HMLpdoVIJgCL/vbcBKJmgFpZJwmaazIFmubYSaZxGNPqn807RencndNDh?=
 =?us-ascii?Q?2vgkdiEhjd49euzE81EyG15RX6/ftMg/12oE8bfdB3cNkKXyogk+5yJk6CHa?=
 =?us-ascii?Q?pFzL2VbJieu2cbZyWbTi1rrTTOGz15hyc5Ey/2ZBtyXq8kZIGoshZ/5xQw+2?=
 =?us-ascii?Q?szr8Sp9qSWUICMxXEAuQmP5TPwZQ71AJT8i1of+p6l99xKs2fB/qHn7eYdXi?=
 =?us-ascii?Q?biDKAuXO6QWnpvbH4eXikivPKwS+lD1kqc6LtDoELXTAvW/6AvuoyyPn7L+t?=
 =?us-ascii?Q?aVTbKxd28VqBcIPp9H0e3Fs1uHqxCcBXUUZXjx8023sF/a8jijfwIl7aDCdv?=
 =?us-ascii?Q?AKmPNrBfdZb5quVphOfk2VMSdhH7T/NTzyWhoNIDtl0IniQKbFA0zEj5WkOl?=
 =?us-ascii?Q?C8rSrHEmntOBk0dLJqL9TOSmMq1MZ1Norn/80bEGa/c4yPgZValy/TJUAvMb?=
 =?us-ascii?Q?dhA6YBkzWEjLpckQfylMNeSTu2mmsoHPtuXNC31iztz8Tt90VJF3EhudAiiY?=
 =?us-ascii?Q?Zh/1tB3duHNEoG8t2EDRmmxuYbit7NfmhIj1E4TemA816PxKltj6yALJlttb?=
 =?us-ascii?Q?U/lcX3bzy88dZWI3sDvaRIEc0zCGm4X639OsksC5gFtxUOeYAw9o2zpek+HL?=
 =?us-ascii?Q?ldJGF9Vm+DgVXAB0W/i9PFrM5GBVd4qKtFV0TD8yceK5Qxe5QZjCOdBRY22Q?=
 =?us-ascii?Q?ORczzw3pTcGGidlfi4vHMDZWLRSult2a5n0ydkof0KSpeK/vlrEwYMDT62Kg?=
 =?us-ascii?Q?v+3i7hjhoXPrQnLUMvk/Qf15jAO6fuJDFwTKlmHTPB/cFX/5STNFPw/MwI7q?=
 =?us-ascii?Q?9CnWVorN0NSyQgeJ4RhK9ypto9FIHZq5Bk/bwJsmXMiq3jpPjBctbnPzJpTs?=
 =?us-ascii?Q?x0EEuJ7iuMEeY6WseIl8EfHfeWDduOtSMraZQoRkx1EVIQX7RZOLUeWycPYe?=
 =?us-ascii?Q?5xXPNYfXx8yGo3e7PHYiI49SCEytSQwpcAuz92jHVjKgi8qKFLx8BOKn8zzI?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: afbd46f7-4092-44b9-f15b-08dce7a975a2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 14:56:58.9783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CbTsKIC8f2pwZAQGF+HB8j2jjhha9vePgOiYC/Ie04wooTq6MlA3ylzOQtM8DHo93dkOmv0nBpiA9GVgBOaKrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7804
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

On Tue, Oct 08, 2024 at 01:06:27PM +0530, Balasubramani Vivekanandan wrote:
> CCS_MODE register requires setting mask bits from Xe2+ platforms. Set
> the mask bits unconditionally, as those bits are unused for older
> platforms.
> 
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

I think you need a fixes tag here. I haven't looked at the bspec to
determine if this change is correct though.

Matt

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 +-
>  drivers/gpu/drm/xe/xe_gt_ccs_mode.c  | 6 ++++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 9dd70934ca15..e136b663af98 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -562,7 +562,7 @@
>   *   [4-6]     RSVD
>   *   [7]       Disabled
>   */
> -#define CCS_MODE				XE_REG(0x14804)
> +#define CCS_MODE				XE_REG(0x14804, XE_REG_OPTION_MASKED)
>  #define   CCS_MODE_CSLICE_0_3_MASK		REG_GENMASK(11, 0) /* 3 bits per cslice */
>  #define   CCS_MODE_CSLICE_MASK			0x7 /* CCS0-3 + rsvd */
>  #define   CCS_MODE_CSLICE_WIDTH			ilog2(CCS_MODE_CSLICE_MASK + 1)
> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> index 9360ac4de489..246190b3e2bb 100644
> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> @@ -68,6 +68,12 @@ static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
>  		}
>  	}
>  
> +	/*
> +	 * Mask bits need to be set for the register. Though only Xe2+
> +	 * platforms require setting of mask bits, it won't harm for older
> +	 * platforms as these bits are unused there.
> +	 */
> +	mode |= CCS_MODE_CSLICE_0_3_MASK << 16;
>  	xe_mmio_write32(&gt->mmio, CCS_MODE, mode);
>  
>  	xe_gt_dbg(gt, "CCS_MODE=%x config:%08x, num_engines:%d, num_slices:%d\n",
> -- 
> 2.34.1
> 
