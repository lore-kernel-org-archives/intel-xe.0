Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE850C7115D
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 04:16:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9366F10E0AE;
	Mon, 23 Jun 2025 04:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bT1cREq+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCCEE10E0AE
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 04:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750652217; x=1782188217;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Tu3HfC9gn5YRAZjDSuyWuqUIoR7vrfmhqOq50OvRNSM=;
 b=bT1cREq+nC2ZFR9/hY5OP+teVFcmMHmrfAN8vtaaqpRhjyziXw98nKtO
 MoNyzAXwfKJDnaEbJQC9JbEPM1g2Xik4eZXGbvD7KcFjoSHhD+5LtFoPq
 092CsuUL/OfUupcr1bzMQdaHyy6W2Pp6Mwr8TcqjPUEod2jLLB7mJjvDi
 RUPWAg6U5C6BdOhJGfkIciXHFpvm6aCAY02m8LLFom8EC81yBt9lRok6M
 U+ZdSb/GI6CpPp2an361oMAfYyo+cVPz8HcnKvH4YXM1lD1N1LreRb4mx
 CdSgzxgXKoIj0uYq4wsVfY/cszmTtLzxNViVgImBoArrLiZgAJCnCinwe A==;
X-CSE-ConnectionGUID: D4sARGYgR7+maFrUf213Ag==
X-CSE-MsgGUID: mlKHGXRpSAmm2PiNzNodNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="75378176"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="75378176"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2025 21:16:56 -0700
X-CSE-ConnectionGUID: Mq4PCAYpTXeiPHEieCvXUg==
X-CSE-MsgGUID: iepvonG8S2WAzUe2fmMUHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="151259462"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2025 21:16:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 22 Jun 2025 21:16:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 22 Jun 2025 21:16:55 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.76)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 22 Jun 2025 21:16:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A/B5q1T10qgG/V5d8BrA1KqDj5fnREeW2W7LP1yUzN3W8trsRczuPDop8PXJjeInvLj1p83t4A2N0WGeaIX3Td7OlPTpRc5r4q15vAMFmwxNRI0CyIxmIZOKvm568nCBnat65/9W5OXl7K8HBkvWdsAnX/dQfDbhjA31yvDbzZo5fQop5p78X7bbI9SGDYEZVXT8AZvKxLwfSXwaTokN3OJDdd/1CqZW5/8GoxS+gwHQLplOj+CSfU9ToLRmAylSkQGeokGZA0AUg7y3FmoHyThwOS4+RILqPlAfPMXy18d+Qqjf7NHELN23tMFgEldiODbF+xTG6TGj6rcm1NQGrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c5g5KeSGjyUOBoHfMcO45d+XFmbTc6D8EPiOBn6EgWA=;
 b=pFqF6Hkn9FtjESw49tMj+jij5/uuSs+lkELX2qnCjUXCGJtIP8pGtnT88WYcHwLVK5Q/z2TzMEdvBJyB856ePw8iXrNFc3Mu3sRIGiJzNVGL50JzSm4D0DKNa/sQbE390oyGxnno1kgdCMxqVwxfoqN0Aqie1Xd3A9F1m73GbHFv913ueGHrWrH0bF+/GCeqzjyQqA7Z++5004sVy4x9FtVOM8/6sGwnlUDHCj3/1GFE2LXwFIlaP9GbpDZ/GirmYXTozRnQ446nCP66WQsxAjDtwpwxqegyXa49XCjmG0hzwzyXdXCZHxetRKCy7qeqKyoGekPgbe5KSO35n8q2hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8442.namprd11.prod.outlook.com (2603:10b6:610:1ae::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Mon, 23 Jun
 2025 04:16:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.016; Mon, 23 Jun 2025
 04:16:39 +0000
Date: Sun, 22 Jun 2025 21:18:18 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 03/20] drm/xe/vm: Add attributes struct as member of vma
Message-ID: <aFjVisKVDa1g5THP@lstrano-desk.jf.intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
 <20250613125558.2607665-4-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250613125558.2607665-4-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0149.namprd04.prod.outlook.com
 (2603:10b6:303:84::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8442:EE_
X-MS-Office365-Filtering-Correlation-Id: 792eff73-2a36-4200-3d6a-08ddb20cc066
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?S9sTWBlOFjc7s8fi9iKTbRyP5BNwAv3HvNX3e7NQS3Zpj7cPfmUU8GCVCTBW?=
 =?us-ascii?Q?tNhkcCu77e8Vjrh8Ol+qGVp/90b0TnR3Ur4TZA6BPjILXlZc5rVWMLv+ZKzV?=
 =?us-ascii?Q?VBN7m6dv20AOeNl9hr/rL2EOzomWA3i86ysjH2BC761KJofT8h4RPGripipJ?=
 =?us-ascii?Q?RRs0ArfiogXNELsf4E5r4oBS+C5A9SG3PPZ++Sxn67Kx01UB9xqYIDMHjY+C?=
 =?us-ascii?Q?reRjatlUip0wNd868/whjpEP+c//iOB5HUzFeo4Yvs0wp2P0bSWdBykmrprq?=
 =?us-ascii?Q?nBomyAU4t2tgTwJwIa9HQ0yT1tLRB4JkFvCVZ2EZ5Ot/3wIjVicMM3CtjZWO?=
 =?us-ascii?Q?2R5disN38nJIYu4X8oOgz5b3cA6l/AhjBbGiGOcngZ3h3muKCjPpIzREIa7v?=
 =?us-ascii?Q?tuIdBgm7OG0/wft9D0xH0B9zw9NeKtOfz3vvR8/NZgqgE9NXQaQCeaz5GMTF?=
 =?us-ascii?Q?zbz03vV80RiNGYdSRfYHNTmSgD7mi7Q1Srh27KuayaOaZJlsr1pS1ZLcsWha?=
 =?us-ascii?Q?A+f5bBWYGrh2mToFOFpzmwsIYlWoozD7PM8ZdkxV3km1pO6jEvNrUGWzpXI6?=
 =?us-ascii?Q?iYQJnzFtYzhMpnNevtWb7GTyxW7V0pJsC8mdzEYbUJc1ITeB8YHEIB2JEs20?=
 =?us-ascii?Q?OiGhtNE08wSZJbsh11lqLqM97c44IM9o+2W56mqfMAvxfuThlwnRIelswVD+?=
 =?us-ascii?Q?TrLQjSeEsVAtLY1k1RdhCXOHhqt0OvokfjCxSKbrPAmkrx1rTZHFs5SCZKkM?=
 =?us-ascii?Q?CPiRxzTEq55eU/deEecLBt0x06z4QNYekNbU24UrbeX1rU3N8te3twmbSCHn?=
 =?us-ascii?Q?CNONSM6/VyfRJfp9dpzg1pltB9hRtC56U29VoUEpAFJGrehEKkPK3mfqrptW?=
 =?us-ascii?Q?zpokAbqNSvUYH6DSBFG98GQ9OyWO8Tyw4tEJ7B/Ebp4h3dOFph2jLQ7/qdjR?=
 =?us-ascii?Q?LAj+23xL65XDUV3X9esMSLBLGXVZTbS45gLZSoEzdmHWwNFT7s/YNt2NNwC9?=
 =?us-ascii?Q?o2Sw79XPecH6oLWjGS7GQPT6p2vKJyJo+lZT+VIRtXp6o3MuC5UmBkaVHQ1l?=
 =?us-ascii?Q?AGscT0xFagPyTFO2T7GbGs3Udsen0H8yHtan+gpTPVItRc/XdI/GLNxexkVB?=
 =?us-ascii?Q?TVpHFVqCt2HsFp7OU9/NAnQZWZq+9Fj5JdwvxvXcvRmBcHoT6qQ2DVDUYnhL?=
 =?us-ascii?Q?1YArm4pugJxnt68bru3wlxtBBXOsvXKIyUl3ejO6uV+kV/OARyufjSd6ijXA?=
 =?us-ascii?Q?1yxPnlo1Fctj9YyJk3S/TmoJjn2Sy22fT2c8pwR0qdpSmb27NytvEX7ipu9o?=
 =?us-ascii?Q?fYebhZ54ENBKvRx6eLl9yzbqJF5HpUzdq73Kr+eOfq0Egm999I8BQyvEngRH?=
 =?us-ascii?Q?UZNk8zh5AFUt7K7FWWvU7+6g3PKsMtcc0uxFe3ux9bbquh5IOxM5H2buDKQu?=
 =?us-ascii?Q?ri2PtSApQDs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lJKwtLXr7zbCeV0THECQJYccV6KeUO0PtPDbxlzT3YJUHJMo0yvxQvWhC+zU?=
 =?us-ascii?Q?GEh3ASxGHxUvpmf97CJ7RcfGwF3THkMcsAC5zz8ai19MLfVYDjPTvFA9ta2I?=
 =?us-ascii?Q?OswclbiXVg652WYMb28GDZPhjJiiVPOGg3EUs747U0L3OINH8IBKNcFGslJx?=
 =?us-ascii?Q?pEgijk//VXK5j0sqqnoUuKMhrdynVxAvW29EYhzZI5Gsh9SCb2sDxsCyrb0M?=
 =?us-ascii?Q?aHJz6VI5fhQZTkWgweCoMEv5gpIhboix8pPIcdjn9JXldvU8Yj4VCZGt2sqc?=
 =?us-ascii?Q?XY7r1yXkHJBZhEcZhj3Z2WSzwQwxVZK96RX1nXBynnOyFSO4CSMzJm/WoPv5?=
 =?us-ascii?Q?AyrocYTlJ6QC28gJrNdh01clb3zqcLNtOHBFGQ8nGeoz91io+FYTF/fc6NfO?=
 =?us-ascii?Q?7nkkapB09YNWPEGTTxS24jkGdMCS3+cRdXJYjVUBMLrJfR4Wy7Nir7+kJ5wp?=
 =?us-ascii?Q?mWQYMIhVAePv+aR1JNd3/dzmj/OoqWqK6K/ZABrqRk3mDpOjGRqwEAyCVVRU?=
 =?us-ascii?Q?w57a2NI5eC3T4jYVI38lGbHi19nPdq+gfBTqwaWN9nFsPhkZltXH/oUDyhSp?=
 =?us-ascii?Q?XjGKmpcla2fYzjocnx9SXyA4NmuYo9VgopleaVemKdK4VUe87it4qa3tPf0E?=
 =?us-ascii?Q?VuJkpRT2A04Llaf8N9EVh6/dhlLkd2xmK4wTDdZjSMEyPu8TWEJgio2qg/q4?=
 =?us-ascii?Q?6c3PyP/1gCHukYEY7nAok8bu9QJyhuvxiUTnoKdaDbWz7Vnu6kd9cyFm9xTc?=
 =?us-ascii?Q?ZgCGpPA0QVLZBfoYJ9cfi2Gxy99lKr1NP0BVBRzIkM5WuOACU2/WUTeUkXRH?=
 =?us-ascii?Q?H9Xko6LGuXhjPed2LmW/kiiRn7UNtoxr3yVCGZnAuMtBMfEuolL64K6FTLKE?=
 =?us-ascii?Q?pW6o27KBm/1A5eSngtXI5CvuLHn5hFxPkb+0t+gT20DRWMD21Y9xj1WT4MVb?=
 =?us-ascii?Q?lqByJry60fi9R1r67SgX5qKZDERoVw05hnvrJF2trGYBFRrWQJLMmZG4vDRb?=
 =?us-ascii?Q?WAmegBM9EhTNaa2AdMYYkgUTxTtmthTzS8RS0/mUYR2WTSzwVZn7OaSWy8U9?=
 =?us-ascii?Q?1mZ1lABjTf1lFVygzsCWbXlcDv4ZDMtEhXCSD3BsjKmyLhU7lJUSEMfk/pAO?=
 =?us-ascii?Q?xf8im6atiTjGgSoUOoWQk5Ur1hUtuGH8zqqCFUi26vZaJcoVcR5nkdkaBvzc?=
 =?us-ascii?Q?P9EqRxxDriix7ixgq2XvanEjsnMdahCvFW9ULHY5Eg9p6wRy8g9quSgu3unr?=
 =?us-ascii?Q?J423TT0xYagziGZmaDw/Cv6f1lVNTAMHFPto7ZveB7yXu5a78gxAUbMmM0yp?=
 =?us-ascii?Q?kviKzk5F6AZ7pM+Ct98PAKGH1wJeKpBZX7LVRdUs1Y5BCIN1GPG0+ClpAS+8?=
 =?us-ascii?Q?D5GAJd8eazh8HKt0Ax0tXulYHygo1MXE2Nsk1Tez70MYgeXfNlKjbvaG5fAw?=
 =?us-ascii?Q?WdcUo2WezuRLvuUT7i8mtuwrepDgFIEI83Yap6oZpEETpmkMTFv9wgi5BM+9?=
 =?us-ascii?Q?T7gqJR1Z6piWFrMhLObvRioO7a+sh72iniYqhih2DnTWVIBrfJp1CwXq84Qw?=
 =?us-ascii?Q?eORHpSaEkJSrTE8ZjadOTMrPPEcC5ZztQFQdJYRotB0hneTGtM8jN7TYtwZX?=
 =?us-ascii?Q?oQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 792eff73-2a36-4200-3d6a-08ddb20cc066
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 04:16:39.5999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8z+Wvc+7CXiVSizP79UyXMdKMZU1S0T9Pe89J0OwjGPXx8ry6SPdhJc3gJHITvp2/bNnpoTMfjyRAiN/lwU19A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8442
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

On Fri, Jun 13, 2025 at 06:25:41PM +0530, Himal Prasad Ghimiray wrote:
> The attribute of xe_vma will determine the migration policy and the
> encoding of the page table entries (PTEs) for that vma.
> This attribute helps manage how memory pages are moved and how their
> addresses are translated. It will be used by madvise to set the
> behavior of the vma.
> 
> v2 (Matthew Brost)
> - Add docs
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm_types.h | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index bed6088e1bb3..c7663058a7e3 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -77,6 +77,27 @@ struct xe_userptr {
>  #endif
>  };
>  
> +/**
> + * struct xe_vma_mem_attr - memory attributes associated with vma
> + */
> +struct xe_vma_mem_attr {
> +	/** @preferred_loc: perferred memory_location*/
> +	struct {
> +		/** @preferred_loc.migration_policy: Policy for migration of pages */
> +		u32 migration_policy;
> +
> +		/**
> +		 * @preferred_loc.devmem_fd: used for determining pagemap_fd requested by user
> +		 * DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM and DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE mean
> +		 * system memory or closest device memory respectively.

Nit, I generally prefer 80 character line wraps. I know checkpatch
allows 100 but in general I think Xe generally wraps at 80 unless it is
an odd case with nested code and an 80 character wrap makes the code
unreadable.

80 generally allows 2 windows split vertically in vi on a typical laptop
which makes navigating the code a bit easier.

> +		 */
> +		u32 devmem_fd;
> +	} preferred_loc;
> +
> +	/** @atomic_access: The atomic access type for the vma */

I'd reference the uAPI here. e.g., DRM_XE_VMA_ATOMIC_*

With the minor nits fixed:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Matt

> +	u32 atomic_access;
> +};
> +
>  struct xe_vma {
>  	/** @gpuva: Base GPUVA object */
>  	struct drm_gpuva gpuva;
> @@ -135,6 +156,13 @@ struct xe_vma {
>  	 * Needs to be signalled before UNMAP can be processed.
>  	 */
>  	struct xe_user_fence *ufence;
> +
> +	/**
> +	 * @attr: The attributes of vma which determines the migration policy
> +	 * and encoding of the PTEs for this vma.
> +	 */
> +	struct xe_vma_mem_attr attr;
> +
>  };
>  
>  /**
> -- 
> 2.34.1
> 
