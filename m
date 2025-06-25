Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421C4C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 23:53:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B48C10E24A;
	Wed, 25 Jun 2025 23:53:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V8mTGO4K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B26FA10E24A
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 23:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750895603; x=1782431603;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=U3nxQTxzjAJ3EP9JsbisDZqzky9SFxDh6VvqbdmfS0w=;
 b=V8mTGO4Kr0abo/oeTnhQ1jRGLsoC8h7ovCn2SoyN2VL5IzZpbH821g0c
 FgTJC/eoep16v+D4nmTjfrAycZ75UoG0hXkVJYUeG1/EE5pe1ibqbtKVv
 /DFO84J0aySUuW9spp58xB43hh0K9oVrHMlFYpCZ2hhILPfcLjQJuGFn9
 oCXTTl/a/1TOfVkNejjzqC7uVZwWLiyFmprnjQQ2l5yTDSMF1tlcBAidH
 XDP285saq9Jo+jNWzklyvmk4wOTZvw0tRjjO5b0QZaDO/umqUUGRy1vOY
 DwnDBABr+Kdgz8ChUmjFq5X56fUgpOHF7KUCHjLaleQwSfUj6vzERFMo0 Q==;
X-CSE-ConnectionGUID: WGs1z6eqRx+hKzzQAYJRxQ==
X-CSE-MsgGUID: b0YMrq26RX+DxmwM9Ze/fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="78615478"
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; d="scan'208";a="78615478"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 16:53:21 -0700
X-CSE-ConnectionGUID: 7U2O4gZ0SZqPl3+XXm4hYA==
X-CSE-MsgGUID: FqBXs8+pQYOAOJ/WlUkH9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; d="scan'208";a="152482347"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 16:53:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 16:53:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 16:53:19 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 16:53:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hLti7m44KNVIDiaWrrOaVZoJR4tImcsTt6Dxqiv8Ep2PA1zcwt+I58J5XNwhG2+fb+OQAlcHVvx3b+gi0NF39iheDZpk6XZLmaiPDTqWuv//+uwd2/43eg2LOcL0gQ09y4U0smgUj/1h16pkcZLzAE+d59PW7KvQWhAVYQYqkzxtJDfYSwpROkQPnhgfAQz9vPTLcuZkHyr4FbiI1EeR7d9lCTeb/qV2fHwBZe/IpzY+tOqqgiEF3nCMUkXeeKRiOqpgrpC6rNegxt9yotsx5S2Jlk41pFWcVu9yY5WjS2XRD18v5xWaW3vQpc7iZZGwCncsYTYRxITW1CZ4poOynQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zdTNptyRlasMpBn7dHVTGV3WWjNCPJ1uRdTQmhPA85E=;
 b=ZvQgnMWjjSFJmVOI9zOsvjT+waW3RnysQacfIMCVpZNKebQMTGYCDDxXifaSkRiM/v8nC1VYu74UwAgZlsBmMt0najNnR6teSAcndLAhsYtDKGzaN37LX94ko5mxoKMHmtc9/b0WEN3+HlyFIOdHEl6zPzLuBj1UTpRbwJyrgtWhGcaGzVi51GCH8In0pMd/RquMfcFUnwbjQFhCUqSSBJH639iJYG/41kEogC+bQTY/ykPC32Y28+OpOwgaAqUZBQx5USIGBbwXeGRCD/icfbHKV9wknObH7rcLX5zIndB6mrtNivTiUVudJWy9U6Mc1ShOxSf2woEmaRXATremKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4613.namprd11.prod.outlook.com (2603:10b6:208:26d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Wed, 25 Jun
 2025 23:53:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 23:53:11 +0000
Date: Wed, 25 Jun 2025 16:54:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [CI 1/2] drm/xe/guc: Enable extended CAT error reporting
Message-ID: <aFyMS/7ZBu+Gafm9@lstrano-desk.jf.intel.com>
References: <20250625205405.1653212-3-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250625205405.1653212-3-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR03CA0117.namprd03.prod.outlook.com
 (2603:10b6:a03:333::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4613:EE_
X-MS-Office365-Filtering-Correlation-Id: 073c7f54-ed7b-4b94-6f4d-08ddb443714e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8W+xg0Q8GnI6PpmBU4aGccj++D1B20gWd2KR0RNdxyPchWgSqU6fLqo7e9Qi?=
 =?us-ascii?Q?ngQQtcXPST0E470ewQncIuebgRw1+21TSBLZ3QOlIENkD0l7oOJx34/Yq1pS?=
 =?us-ascii?Q?/EIcFtVLYQHbsU3aZE6/QWDpc2Q7w3/xKh708ZBZ4pSld4T20q9P+6gRR7oZ?=
 =?us-ascii?Q?d6G1a4PlLCEigz3LilV+GszGdv/4BW1Hn4lj9yNOlOsUfWY8pWzMOWgBgO40?=
 =?us-ascii?Q?spB+9AC4nk9wZ0RwLAEJIUkaO0b810WV/W/Ye3AOH4BTBGj/SDQHCcDXdzQS?=
 =?us-ascii?Q?CYtOASft6GR+se+D8/P/AM4U17I6foQIHT39EEWhnxfJuzv+vOMVys7KGG1W?=
 =?us-ascii?Q?9Uozla1VVnu/8AklH2AeDqSkax6o3RElgx+fIX/NrME72W6WIgS/2vhegGQ0?=
 =?us-ascii?Q?tLFs+BO8RLD1idKXNKELvuwv1Fi8SrRapr0ykdtPcNy7o9FFyy/01cAcMa6i?=
 =?us-ascii?Q?nZUJA/MbyZo1mE+t5fpySBDkQB3KfiyT1qa+y3Fvu2crmJ52ehJB//ewBL/u?=
 =?us-ascii?Q?mkRAgJDDnrsG4XkVxScaJnKIYo3BfZ6WUahZsQudU5YtpEQO3BuitbloPN4A?=
 =?us-ascii?Q?t0TyV1iGJkwdOW6I3xRRfDmODvb2C9b7FrjhbIikmSNB+mlr0Kp4kg/BC4iJ?=
 =?us-ascii?Q?WuWO0agqhkBH36q33rH7OIGXqXQE/PPHMkDUnmc5Fc9t+szvS1thFqaCZYzM?=
 =?us-ascii?Q?WO9/FXszlMe9udmQKGoN4qD2tTD898Un/uKvQMEoDzAyvisF2vZhpbPHp3lC?=
 =?us-ascii?Q?hACB6WJxknXyyVsrtfxilkxW2Y4vskvP4jHTyyEZFnbhMGUwQRjtB3qba5NI?=
 =?us-ascii?Q?jdUquti1m2p/WTq4zxctePioAWcl0M2p8USSJo8YKb6IKzyJXyqARoarhWW4?=
 =?us-ascii?Q?5h8v3mJadvWMMUz+n6/sW3OXfT91WQ9qBCR6L0PDP2/ul4NuFlal3QuL/cXJ?=
 =?us-ascii?Q?21Np/Hvl4tczfXMGqDGE9ISf+9xIPpRz3MZ97hZy9d0yU6//lm+Y+JR36E2O?=
 =?us-ascii?Q?dEFh8V2werBELFD1E4o4Eiv/CqSmYmRkkmPUz+PIS61TndXXmVmMHH2UWNJW?=
 =?us-ascii?Q?WbIaPLzNeNNzQtHkLzzn3jDurOgruPHv+P10j9ajsUtTtTBiIPI4r/UpOxWI?=
 =?us-ascii?Q?MuaA7n1HDKAqa/nN2Bu6+lmnc6FaXtQQda6VLVti1mUC05pINQBRJE9KD9Z4?=
 =?us-ascii?Q?0pxTCHzKiw3OIX69RNbTbqjWe2OYuLjjkHDMc9vhQi/2cLzjvrRRoIxqvPP1?=
 =?us-ascii?Q?SnXwxeICK55eVjhy61xwJnbt/lAa5ZDZ62G8io37dQuJ93+7ipOYpGSYn9NM?=
 =?us-ascii?Q?JEmDqH5OznogjPZPNhVrZ4fjq0ukIUI8xziPDbDLpf/LpTf2Tsab8qbGtCcI?=
 =?us-ascii?Q?J8XFFKNy16n4bowf7Pq6QXVq6YdJHLKzg8XzkfN/eoyRACGq9Ouf47dflmQH?=
 =?us-ascii?Q?DUKh9JRJOYg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VxJtARZWvRNUTYaiIo3Q0a5BWskFMS8Qe+v9BLZ74g1uM3KW5hl4baFsD3AU?=
 =?us-ascii?Q?ruoP39kUvy5s79ofk7VxdBHN2mlvaXO4gPFgfhISxihabv6Iu4fEyPRyoBnG?=
 =?us-ascii?Q?gwd4DNIA04yyw0aHa8lnczGQvSJ6qOkGyQUDv1gWWvB8KzBPdK0LrFrjS559?=
 =?us-ascii?Q?llELLRQpjr2ozbrcFs0vbcqdNHYDS9jNofdm43wADHqz4IV064at9aC08jvN?=
 =?us-ascii?Q?/PWoDShN36vBv13bz3jwjnUpUHe1wBu85jbkZ/yXBTanZf8X4mJIp+v/4tlu?=
 =?us-ascii?Q?W9znnwXjFxSCcYObw+99s2qlM6e8waCVp/joT9qxKoS/hPr4ZcD3znwxdR5i?=
 =?us-ascii?Q?7pjkiAOHWWwtt6NYTgRzzqFc8cBZ0t5wR+temlBOR+L5cyX4q1ixzNYYVPWp?=
 =?us-ascii?Q?I4MciW9kz/JHK6Z050iUGFJuaRMkDheHFRDpJUC8UlYQAlbqi1DfP8BD0wPP?=
 =?us-ascii?Q?YWnbL52Uq3RTm1l1S+TAGa6+e5tAxAuXVwZPZlfSg6dfUT5OXuFBY3vQJRzC?=
 =?us-ascii?Q?sL6kftvqMO3NdTgeHd8tZHBCtJQB5oTHIbdqJS8OasHeUVpuNE1cS1B0mbWP?=
 =?us-ascii?Q?CqX4HlZnRs86HeyND5CM7LdgSe13SDIRNZLfnPIOADh4uKMwd8P9l/zIvwR+?=
 =?us-ascii?Q?JVcYYJQ+HkQSC4L1cmzikY99n6FmhUK5K3TU7oCptw7qVup/WWhmRJyWe94w?=
 =?us-ascii?Q?23JJdKBSROyPapYFMQvv8XIoLZNpEITlSJT23v/7Fk/4VVw8Ko3c5YPeAIAJ?=
 =?us-ascii?Q?8/vdB2qOO7FZwXyRxK77iWcVDaLbeFDYygfOdOiq3/UK0vveFcBTsfpHYNMg?=
 =?us-ascii?Q?fP7sQhk7DhChVehDJlZiOJU8i54Myu9xpZEXBcxEwBDNgzZidiUturzJdV0G?=
 =?us-ascii?Q?bWjZa+M8MKwdjhzayUpYBZcC8nifWS3K7oTJWTFwJUd7LitjF91Xsl5VmeUp?=
 =?us-ascii?Q?98Lptxf+w68TyUO1MpmIApRbsZPlrKrQXHRPS/rCF0082BFEwDW2PI8RQl40?=
 =?us-ascii?Q?DK1LXX/M+84JphEkrBmmtKbtUTKLLqzhNBN7BeIMW0uUELG4fjBkbTua7Dhn?=
 =?us-ascii?Q?xD8OSLLaCF+c+3GFpQvyDB9ICn6LIVA5phEkt4L5Gc5G++MkuFjMP9McHv/O?=
 =?us-ascii?Q?TVL9hJbfqQ4h1k8IGRJKJYYuLDm32CKJoW4j/MM/ZumGX54t97Z+jkvYc/k4?=
 =?us-ascii?Q?mWdp/FIZN6tksEIwdr59DvrkykLWMXSmdClLH6I93QyUoaXiMTw6jOlsB+sw?=
 =?us-ascii?Q?psOnTPvu+l3AWyX8hJEbKBmT+4CDgOJJq6ulVC8nfpuCOsx+bRcl53JYcXS5?=
 =?us-ascii?Q?P5p74GiAnYogGIsaD1W0SG3LjEbDKEwVNTNNrFfpE7HcoxemroFih/oL30kY?=
 =?us-ascii?Q?iu9L8VNYoFQ15e805fs/il8o4ZNFG4LNVtLABei1FGQ1d7uKaxYqCr2/hXc5?=
 =?us-ascii?Q?AZvv7h9FPE6voKa2oyRJqJcUYO8MzueARTCeKUDfrasxqG7epN3KM2izdGms?=
 =?us-ascii?Q?1FnLTT7zS87EvmeqCOAL9bnxpXlqVKK38W2qo/w8D1GbaItiM0c2AvHr7cDk?=
 =?us-ascii?Q?1m/o/ngXA2w6lvhFP7djcomldBfls75OaZ3gFXebKNLt9a3lBFtIUQ9k+Aty?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 073c7f54-ed7b-4b94-6f4d-08ddb443714e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 23:53:11.5496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KE7fpEKJk+L5lv2IfzihkFk8D0nD1Rg+IMLPKIKDG7sANJm/Wvnw1NH5jBlhsGr+F8Qt6lswUBir6ERBwb1Ayw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4613
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

On Wed, Jun 25, 2025 at 01:54:06PM -0700, Daniele Ceraolo Spurio wrote:
> On newer HW (Xe2 onwards + PVC) it is possible to get extra information
> when a CAT error occurs, specifically a dword reporting the error type.
> To enable this extra reporting, we need to opt-in with the GuC, which is
> done via a specific per-VF feature opt-in H2G.
> 
> On platforms where the HW does not support the extra reporting, the GuC
> will set the type to 0xdeadbeef, so we can keep the code simple and
> opt-in to the feature on every platform and then just discard the data
> if it is invalid.
> 
> Note that on native/PF we're guaranteed that the opt in is available
> because we don't support any GuC old enough to not have it, but if we're
> a VF we might be running on a non-XE PF with an older GuC, so we need to
> handle that case. We can re-use the invalid type above to handle this
> scenario the same way as if the feature was not supported in HW.
> 
> Given that this patch is the first user of the guc_buf_cache on native
> and VF, it also extends that feature to non-PF use-cases.
> 
> v2: simpler print for the error type (John), rebase
> v3: use guc_buf_cache instead of new alloc, simpler doc (Michal)
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com> #v1
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_actions_abi.h |  4 ++
>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h    | 15 +++++++
>  drivers/gpu/drm/xe/xe_guc.c              | 56 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc.h              |  1 +
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 16 +++++--
>  drivers/gpu/drm/xe/xe_uc.c               |  4 ++
>  6 files changed, 93 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> index ff4f412c28d8..81eb046aeebf 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> @@ -142,6 +142,7 @@ enum xe_guc_action {
>  	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>  	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
>  	XE_GUC_ACTION_SET_FUNCTION_ENGINE_ACTIVITY_BUFFER = 0x550D,
> +	XE_GUC_ACTION_OPT_IN_FEATURE_KLV = 0x550E,
>  	XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,
>  	XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
>  	XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
> @@ -271,4 +272,7 @@ enum xe_guc_g2g_type {
>  #define XE_G2G_DEREGISTER_TILE	REG_GENMASK(15, 12)
>  #define XE_G2G_DEREGISTER_TYPE	REG_GENMASK(11, 8)
>  
> +/* invalid type for XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR */
> +#define XE_GUC_CAT_ERR_TYPE_INVALID 0xdeadbeef
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 7de8f827281f..5b2502bec2dc 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -16,6 +16,7 @@
>   *  +===+=======+==============================================================+
>   *  | 0 | 31:16 | **KEY** - KLV key identifier                                 |
>   *  |   |       |   - `GuC Self Config KLVs`_                                  |
> + *  |   |       |   - `GuC Opt In Feature KLVs`_                               |
>   *  |   |       |   - `GuC VGT Policy KLVs`_                                   |
>   *  |   |       |   - `GuC VF Configuration KLVs`_                             |
>   *  |   |       |                                                              |
> @@ -124,6 +125,20 @@ enum  {
>  	GUC_CONTEXT_POLICIES_KLV_NUM_IDS = 5,
>  };
>  
> +/**
> + * DOC: GuC Opt In Feature KLVs
> + *
> + * `GuC KLV`_ keys available for use with OPT_IN_FEATURE_KLV
> + *
> + *  _`GUC_KLV_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE` : 0x4001
> + *      Adds an extra dword to the XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR G2H
> + *      containing the type of the CAT error. On HW that does not support
> + *      reporting the CAT error type, the extra dword is set to 0xdeadbeef.
> + */
> +
> +#define GUC_KLV_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE_KEY 0x4001
> +#define GUC_KLV_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE_LEN 0u
> +
>  /**
>   * DOC: GuC VGT Policy KLVs
>   *
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 209e5d53c290..4a7c467ad669 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -29,6 +29,7 @@
>  #include "xe_guc_db_mgr.h"
>  #include "xe_guc_engine_activity.h"
>  #include "xe_guc_hwconfig.h"
> +#include "xe_guc_klv_helpers.h"
>  #include "xe_guc_log.h"
>  #include "xe_guc_pc.h"
>  #include "xe_guc_relay.h"
> @@ -570,6 +571,57 @@ static int guc_g2g_start(struct xe_guc *guc)
>  	return err;
>  }
>  
> +static int __guc_opt_in_features_enable(struct xe_guc *guc, u64 addr, u32 num_dwords)
> +{
> +	u32 action[] = {
> +		XE_GUC_ACTION_OPT_IN_FEATURE_KLV,
> +		lower_32_bits(addr),
> +		upper_32_bits(addr),
> +		num_dwords
> +	};
> +
> +	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
> +}
> +
> +#define OPT_IN_MAX_DWORDS 16
> +int xe_guc_opt_in_features_enable(struct xe_guc *guc)
> +{
> +	struct xe_device *xe = guc_to_xe(guc);
> +	CLASS(xe_guc_buf, buf)(&guc->buf, OPT_IN_MAX_DWORDS);
> +	u32 count = 0;
> +	u32 *klvs;
> +	int ret;
> +
> +	if (!xe_guc_buf_is_valid(buf))
> +		return -ENOBUFS;
> +
> +	klvs = xe_guc_buf_cpu_ptr(buf);
> +
> +	/*
> +	 * The extra CAT error type opt-in was added in GuC v70.17.0, which maps
> +	 * to compatibility version v1.7.0.
> +	 * Note that the GuC allows enabling this KLV even on platforms that do
> +	 * not support the extra type; in such case the returned type variable
> +	 * will be set to a known invalid value which we can check against.
> +	 */
> +	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 7, 0))
> +		klvs[count++] = PREP_GUC_KLV_TAG(OPT_IN_FEATURE_EXT_CAT_ERR_TYPE);
> +
> +	if (count) {
> +		xe_assert(xe, count <= OPT_IN_MAX_DWORDS);
> +
> +		ret = __guc_opt_in_features_enable(guc, xe_guc_buf_flush(buf), count);
> +		if (ret < 0) {
> +			xe_gt_err(guc_to_gt(guc),
> +				  "failed to enable GuC opt-in features: %pe\n",
> +				  ERR_PTR(ret));
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static void guc_fini_hw(void *arg)
>  {
>  	struct xe_guc *guc = arg;
> @@ -767,6 +819,10 @@ int xe_guc_post_load_init(struct xe_guc *guc)
>  
>  	xe_guc_ads_populate_post_load(&guc->ads);
>  
> +	ret = xe_guc_opt_in_features_enable(guc);
> +	if (ret)
> +		return ret;
> +
>  	if (xe_guc_g2g_wanted(guc_to_xe(guc))) {
>  		ret = guc_g2g_start(guc);
>  		if (ret)
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index 58338be44558..4a66575f017d 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -33,6 +33,7 @@ int xe_guc_reset(struct xe_guc *guc);
>  int xe_guc_upload(struct xe_guc *guc);
>  int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
>  int xe_guc_enable_communication(struct xe_guc *guc);
> +int xe_guc_opt_in_features_enable(struct xe_guc *guc);
>  int xe_guc_suspend(struct xe_guc *guc);
>  void xe_guc_notify(struct xe_guc *guc);
>  int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 26c6c71dc91a..32548c931615 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2103,12 +2103,16 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>  	struct xe_gt *gt = guc_to_gt(guc);
>  	struct xe_exec_queue *q;
>  	u32 guc_id;
> +	u32 type = XE_GUC_CAT_ERR_TYPE_INVALID;
>  
> -	if (unlikely(len < 1))
> +	if (unlikely(!len || len > 2))
>  		return -EPROTO;
>  
>  	guc_id = msg[0];
>  
> +	if (len == 2)
> +		type = msg[1];
> +
>  	if (guc_id == GUC_ID_UNKNOWN) {
>  		/*
>  		 * GuC uses GUC_ID_UNKNOWN if it can not map the CAT fault to any PF/VF
> @@ -2122,8 +2126,14 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>  	if (unlikely(!q))
>  		return -EPROTO;
>  
> -	xe_gt_dbg(gt, "Engine memory cat error: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
> -		  xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
> +	if (type != XE_GUC_CAT_ERR_TYPE_INVALID)
> +		xe_gt_dbg(gt,
> +			  "Engine memory CAT error [%u]: class=%s, logical_mask: 0x%x, guc_id=%d",
> +			  type, xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);

Do we define the type anywhere - I only see XE_GUC_CAT_ERR_TYPE_INVALID.

It would be useful if we had this defined somewhere in KMD headers or
even more useful if type was accompanied by a string description.

Matt
 
> +	else
> +		xe_gt_dbg(gt,
> +			  "Engine memory CAT error: class=%s, logical_mask: 0x%x, guc_id=%d",
> +			  xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
>  
>  	trace_xe_exec_queue_memory_cat_error(q);
>  
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 3a8751a8b92d..5c45b0f072a4 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -165,6 +165,10 @@ static int vf_uc_init_hw(struct xe_uc *uc)
>  
>  	uc->guc.submission_state.enabled = true;
>  
> +	err = xe_guc_opt_in_features_enable(&uc->guc);
> +	if (err)
> +		return err;
> +
>  	err = xe_gt_record_default_lrcs(uc_to_gt(uc));
>  	if (err)
>  		return err;
> -- 
> 2.43.0
> 
