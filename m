Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF81D1CA3F
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 07:31:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA6A910E28F;
	Tue,  5 Nov 2024 07:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YbnRe2l6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26BB410E28F
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 07:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730791868; x=1762327868;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Uhcsa61+Qj+3gcEzsbnvGsyn68rP1yZDqOOxQapP12o=;
 b=YbnRe2l6iq/R5ZbEIlTSfW/kVzvxN1Ww3IYTp6JD+blRBIvBwdEwtP2S
 JonlQr4PbstkXmY0g4LVjK9AL6sX/vs5axOPjKs0ZElCum/nElm2/FN/K
 Asu4m6QJU8OT3JyMWIZimI8JQMnJ0cnOoZnGQfhJD/pOErDTZvPWJviZ9
 hH1SDZqVPuftluufCOTARCj0ArGP+780opzPUZCcWP0RAB0acgHvlNYfX
 zPS6A9d/XrenfYeESYW8hs67Dbv8C/F8SldjnM8HItegUW6PsIaLn2hWK
 u+R/T6bdpXNyw9Q418jI8Mqr4M2N7wTGz0NIPFFIdq4EYd73zMEJibhDM g==;
X-CSE-ConnectionGUID: c0S7v+fPTti154ED2yYR4A==
X-CSE-MsgGUID: C741wzJjQz6L8VaQq2hsog==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="34450743"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="34450743"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 23:31:07 -0800
X-CSE-ConnectionGUID: IXXSLz+kQGWI87pPnIwEQQ==
X-CSE-MsgGUID: fin1QouHRpOt9UbR02xxkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="87841082"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 23:31:07 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 23:31:07 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 23:31:07 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 23:31:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xhynh24ZqqLlxgsqjLocdl5F7Zcdo2c9mKsLb3M1gGxHvtW3PdWgnMcR3l69AYjzHEGDWz+TLyxhcgZAAsh5ZdoWBjutzM1biFl/tZKzK2vX3lEVtB5SrtXclICHLsxXVOWwtWQ3MsIsTxa7OltU3xBSjnY3nsNhjongQEaAgvaRds81egTEOT29crtlv6bul6xYjWB4Qan96uAa6HbSK9aoAiK3CR3wVncOr53T1I4KblQozNkV4F7fNM2fEcPV8ehY0S8UNND37sGhbLauh2N2HBszb37fFRiyjIK4D6PoWe1rvgxcoA2ohxR0a8vAe7hKdQ2Y+CfMK3twgPNErw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+deMZYwgZLNTIBf7f2avwak9Sa9nnKCeeVfzDjSy3U=;
 b=pPLmXnfUNfnuQpMWiPrygi5PuKY/DVSfkP9Haat6/cLVfm04ax4h1ayO9SK7XUBjreADVPJ85mp2Im3e3kIGhOb8anP+OY7MQ3+1m90n6533YWIPd6nlccECv4gmnmuW3zpJWWK3T5snfQnKz28UbMwqIthnpRsxy42Vk1yyKlYndhZKimB85fSoUn6Nnr2y+GXDqZ3uV+xgu57xoxwpm1nPyQkBnE5WPWduDTZnIwJMOPDcz8bVfNHDC/KqrCAsfTx2pVXE35JqmrfppO5Db1AWH/Qz1CUDGmXUsUcuJKVCmfYDsji35Opp6TJO2kY8ew9Vd6glbZiWYSUpCiXv/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7923.namprd11.prod.outlook.com (2603:10b6:930:7e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 07:31:04 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 07:31:04 +0000
Date: Tue, 5 Nov 2024 01:31:01 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: John Harrison <John.C.Harrison@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, =?utf-8?B?Sm9zw6k=?= Roberto de Souza
 <jose.souza@intel.com>, Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH v2 0/2] drm/xe: devcoredump documentation
Message-ID: <g73tes5l3b67bqkxjiluycw5ztm6kcilqmgy6y3dhiwq6kh3vp@fqp6cinb2wpc>
References: <20241102161254.1818604-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241102161254.1818604-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR03CA0248.namprd03.prod.outlook.com
 (2603:10b6:303:b4::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7923:EE_
X-MS-Office365-Filtering-Correlation-Id: 07ebdf20-73c9-4e1b-4f9d-08dcfd6bce00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZHIYulBO4p0Vu898ITrRd5LBY3SZEo0LI6n488Y0YwAKUhX29I1/v+yt0CSY?=
 =?us-ascii?Q?PF9zfWtpBLAFyuix4vaQZS3pWJpJan8VOGiKhPuBTEEQKTd8YPQZ8Yj37c+1?=
 =?us-ascii?Q?9moOp3inq21FlAmjMJmN9HcXCrdC212wQZdwHi//KyufJaN4dVYbFcPXzXPp?=
 =?us-ascii?Q?xHSXnmfv/Pt1aR8N9Bv5Pm/H9kG86YK5lNoq9wdkeJanSWaMyUNbQBp5xYAr?=
 =?us-ascii?Q?qSY4R1AUn5eozHmbTGHA4eCUwfURSG2Z7IniHv8G4NSzq4erPMYW0ZhjLT3u?=
 =?us-ascii?Q?2+l3u5oynToKtl2IgtTxRd33rwGSPhGG+A0K68feZtLre6JbKvkdn0/JoP3w?=
 =?us-ascii?Q?PyTERYu9WYqLmok20mU54QqoC42R/PkcX7c3YrIPF+r6jGriWbNwbVqiv8F0?=
 =?us-ascii?Q?ohuqF+cwNqs4+DEjDH7bWI2iiA3Ci/OuPF2leEyRgej6yFjGgIHD6djN2tUz?=
 =?us-ascii?Q?nGb7MH7NvCgn62Sr2QA3pfAS2dZI4URXnP9EvYrlHDK0rG+9QbUi/NdWGj50?=
 =?us-ascii?Q?W/2Q6uOR8IzY6+VM66sCw/WM2VJbsodnHWaijGn2DUu1ZGHPl6S+bKkLKhgQ?=
 =?us-ascii?Q?DA9Ty3DiPvW1Jy6QVGMCLIRJUYDEtedDxAVICnB6uPFbxfxJrOwFtcD/d4z2?=
 =?us-ascii?Q?v77in6QIiOu3e+coBP0hEtzVyeOrljVZJQrMDzhR4k8hUHykQ7LpC1JbO3Vn?=
 =?us-ascii?Q?Bi+ZuZnJcRl2JtGwY4fpE4EUzr7STeKcH5JwAb0PYGFocPnkzewhmv88G1d5?=
 =?us-ascii?Q?Zk1CnxRoDHDCML1eX3HuQzeCf7y/2AOiKabkmoSHTTcLlY2kvkwXhhO/UL4G?=
 =?us-ascii?Q?CCo1zJSAzE9xa8LKrRknQ5exUT5ohwWauhx6Mpu21vX3tAuxxq/hVdL3wlTn?=
 =?us-ascii?Q?452pJOlb5rm+c1Fy7kiRoIIa5vXUmmwZ3zxfySSNGyxIMhdoJXa8HdAZlmDC?=
 =?us-ascii?Q?gK3fs7ybubteXAShzWldEkoh2CRUoiLHrcAqAOk4jhhga9R/RZfTj4C3OVLq?=
 =?us-ascii?Q?cyHp/RB40ns5hhkfLs5o3xj/eroIDSSpJ6ZFqkuS/dZEXE0y6HFK86VEQpmU?=
 =?us-ascii?Q?ThUG+/l+wlgQKTmPBWmByNWVZVSzz1Ufs0yufFUIMC476bR4If1E8oBqjCh+?=
 =?us-ascii?Q?X+7oRho83gRewQXcCk4Ct/WL0TXlhRBsz+dcNYwOiFWRT2mJHLrMaWNWzVMf?=
 =?us-ascii?Q?++VdLUaxqYu8SHEnCzXQfytOaFT8JDBUvXG/GaX+epi6R3gPNNQqDZNpZg3A?=
 =?us-ascii?Q?9eDlMVLyI/kVTd4YHjDojNV0/+dEvIy79rRw9aS9CB69+lnKheVHl7tB33qf?=
 =?us-ascii?Q?/NuGjZdD7f9del0ijqMrCfIo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ycKrzvIpLl6dFrt6BVmi3WcESlJiHc5vQIOQkkPhH67bEzuE/3AJHSjWJsPj?=
 =?us-ascii?Q?uXuGjloBvYCNC5e8YpbyRtmD3vRh2mH8gqBGCRqPfwEIPvuiU9/cYjsiF+Br?=
 =?us-ascii?Q?hf65W3m9AkuynMfUE5fjsy+8t91PO2e4RuQXpkmpAh0+CskGwhGAYuup/Smz?=
 =?us-ascii?Q?nJ6EO69x5ktt4VIoRFWnWVosOUlq96Y5Oy1soyUMfyoKWodRFrZBtYRO3mIk?=
 =?us-ascii?Q?C0DqCBW2GOWiaeppfxZe+3E7L6YXOsG8zdXjk1hjMFVe8bq7TlWB1OIWnvO+?=
 =?us-ascii?Q?0m0GL5HjdVR/VktjRzOGD2tk2NTYnUvp/5K7PR9dHkECYHWo8xyvuCgNkb71?=
 =?us-ascii?Q?qEjRoSp10Upui2ideG7aHMKomtAbgDViWdLZOQUff4YRTF4uLrTKtGo0BRtA?=
 =?us-ascii?Q?CopJpkrB/Lkf+7H40SP3ukfQx7LtmpR/fqZjJjyoYMbc6MOcze3mOqoB6K1h?=
 =?us-ascii?Q?QeCM/dFvADLG4K4YdMqMDfjtXTx/TOv93eszHAioGQkbZUgniO2xLXqd1vBP?=
 =?us-ascii?Q?MlPnL6TgYLSwpjC+1icVtJe9jhQYxEnEOvyhrLk+mRzKytlq+DHS85aUdfhF?=
 =?us-ascii?Q?OM6GlSKDOunH2uNOy9/2D9qjjgLXPlSOIc4KCnhMhUPOggpnPJS8E6ourAe/?=
 =?us-ascii?Q?e3Mo/U359dC/gstdrNgWcslEbBycKzkY/7ajN3TTBRhaOw6ukAhrvK40JhJ5?=
 =?us-ascii?Q?/uQY7VzQBkWZNfjfNP44D93vEmsDPTqMhfy84qY1gSiFSB38iYXICR5TqBzd?=
 =?us-ascii?Q?IImXMNGtG6xooDWqBlLQEUpFTF/yd/2nocZrIUtjkbb14VH3yf/gADLHiTxn?=
 =?us-ascii?Q?M5w4abSMq9FBIoG52syiBWE9KccDKRLzo2mD30oh1nh8OpgpOEDbMdQc+70e?=
 =?us-ascii?Q?AfaD84wTm8+pqqHmPQlhyG6PzFVYcwvgV1hLfZZlyRtj5VaPJhMjxGC2H0t4?=
 =?us-ascii?Q?V9qUg/xA7rVKNQyACAtQCYnYpXjWS2pcFPo/8CQ51iGCTOY5lYMf5zn3yQbw?=
 =?us-ascii?Q?Trve/qQsOqp277p/Fz2xynlpi/+xfR+zhclg1LIjMznOwB05SUBQZxH+HwWP?=
 =?us-ascii?Q?uv10Jh+LqBQNVwQtGdUOXG7n9gLyrf60CDtB++yeMJDpy/xSGsh8NwWKwbH4?=
 =?us-ascii?Q?sHQJAemoqnedyIj+GqSWiw5afWTyjv5wH8JHjEFo+ZJEg8AaiUXGfSe9yrPJ?=
 =?us-ascii?Q?dAo8aFIHLqNLnS+MEpDGK0TPUQ5wMHYmQWj5t+xINQl3KLz6aH3GqDLZHF8v?=
 =?us-ascii?Q?rD7KFToR54Ut4RTDf52e3WD2jDHK5lL2lLpwydclFBxwVZN5mNm2l3451BCw?=
 =?us-ascii?Q?9lsL8TGx+r4S4wefHTTq+dftOgClxwVRsy210XgufPwRmRs8MY79fecmowe7?=
 =?us-ascii?Q?pbYg3/aQlsiSQYtY17ETj8D36X4tn1MLGD2ItM1Ips/D3bxGmmDjHuSGitZG?=
 =?us-ascii?Q?hAx2trIbPNOQ7i6REzYFWusjDRb9wsH9dqifpo97h25uWrqJf7aL2QUfEh+c?=
 =?us-ascii?Q?eqntY261ubX2jd0yq+UgE2O35Iq3VAmY+nhPsi4XetcKlNzkW6n4NLS9LoZN?=
 =?us-ascii?Q?Dde+cm3fV6TRZWWkmkS8kqCekL72OsKjrNmad9u6N4QcOdqWREYP6eEMPk7+?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07ebdf20-73c9-4e1b-4f9d-08dcfd6bce00
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 07:31:04.0414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ko6qguiffjQk/YdUKONRXGRSib4jiZ6ebGZrFzwFi0mOghoaPdJ3tS0ynBWz0kP2t0Kgpyb5vKFPk/Ag9cNDDxH+cUzhJnJCHp44rMvD5YI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7923
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

On Sat, Nov 02, 2024 at 09:12:52AM -0700, Lucas De Marchi wrote:
>Improve our kernel-doc and wire it up to the documentation.
>
>v2: Add new paragraph about coredump release and reword some phrases
>
>Lucas De Marchi (2):
>  drm/xe: Improve devcoredump documentation
>  drm/xe: Wire up devcoredump in documentation

Patches applied, thanks.

Lucas De Marchi

>
> Documentation/gpu/xe/index.rst          |  1 +
> Documentation/gpu/xe/xe_devcoredump.rst | 14 +++++++
> drivers/gpu/drm/xe/xe_devcoredump.c     | 51 +++++++++++++++----------
> 3 files changed, 45 insertions(+), 21 deletions(-)
> create mode 100644 Documentation/gpu/xe/xe_devcoredump.rst
>
>-- 
>2.47.0
>
