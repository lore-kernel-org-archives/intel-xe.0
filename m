Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8AC606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 15:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ox7Hq0MS;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=lP2TyonH
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056231124F8;
	Thu, 26 Nov 2026 15:58:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC341124F8
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 15:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795708728; x=1827244728;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ZBsGyiRZw8HIlUvBodh8QXyCwpWi34IArvsWSLPkX/M=;
 b=Ox7Hq0MShat1MSGCJXdtJtcPxYsKIf/0nPIiG3FJvl157hPoVieipwB6
 S+jkfbTWXU4NCDYocjJCNlp6lMwe4bDZMJJc9Eiceku8heF/HC+VYZte2
 rG7gBGOPTApdoVgh/dJGnzKCkPGdA+thGY672SCG/o7WDJdDJTH2VQMMa
 D3PaQ1ICvvQxoTCDiBOLPQ9b+INHSqCGAEYabti0IMNMCMnLsjSDxkClY
 vQ8tbq7E4iqRgETsa8elaBoTdTAWdmp9Xmk9y3oMHmYrYL7UnRTMCLiWz
 R9a5VuxPGHcT75FaMAryw7rrOC+fYG0rl5lG7WXgRAVLD2ALpFBgC1mr/ A==;
X-CSE-ConnectionGUID: HDJBUfVCQxq68AErfuOkog==
X-CSE-MsgGUID: q0IFrZZtTj+w0uP1LNRQdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4512703"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4512703"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 07:58:48 -0800
X-CSE-ConnectionGUID: GtPF+2X9SvOruH6sTZr/cw==
X-CSE-MsgGUID: 6dSPDIzrSuyXJv+vW/gXjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12526676"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 07:58:47 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 07:58:47 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 07:58:47 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.26) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 07:58:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oD8NY5Ttu1AqE52wM6uV5iCeZ0AJMlmfzsvvRKun/Kp7AqitKQX40RAbf1aBMRVNa9RFKY5BA59e8VgSEpsBS/8lofCKBVvav7aksQ1QD1NEeuj6uEy3saIbLQ2y9JRhuBNWP0Lkastr+4lRxO+T2grMavA8wfWJ3zafP2auMgVgyDwoDGd6AXQ4svLzv6qW8mA7DZHZrz9XDBPKVor9iprdgieFyPLTpeFvRaEUqhOM1Y68FS4pYP6gH2hxg7BKO6g8HkQTSXPllkaTWA0COiC+/XRteSjqOzPOn8KiCjrlCam4bi9ssrzyQh3o4imaVtzDVMJtgyjEqXNcERg4aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VM5/RaMWFu6AlVHalBHcZX1CInmybpTK7x5lz1C+lNg=;
 b=stdHW9uzqoANzCTbh8gY55RwxDmWA7+5T2SXus5EaabNWVL/M2f+olTrxmOIusjQE2CzkTTOMMkFmnuXN+gljwOHbamiE96765IefhVRG/RGgZzUsApJX4oaagb1NjOI3A0rWymINfC4VYZ+GJylOFomH2TJ+Y/02tRLbEFwrOaczFtROWhASTaj8B+3QKPyo1zV8JDSAZMkwetzFNEK+TgriQJNWmwU7AX4UXsK2CVhX5wD8pbogSZ3l6ktrkcrsqgPdwTUDlarJ9m06fKSUIUzrDutB0Z5Pts8osekpO/dDC6z0boScV1f78r5b+efJgfeapRXZJOB2TJfUwNR1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VM5/RaMWFu6AlVHalBHcZX1CInmybpTK7x5lz1C+lNg=;
 b=lP2TyonH5fUIbsUrMRYpmluyjY+7rO32n7mWgybFdC+aDovDcZ84+W7odj52/bEFYw6L5avxbMz5hISO75OrlbiPOZNsi2D+bDi0+s8bVMypzgMPOF0RsHQxyn3h5tHnWUPXDHdJXc0Rl/3e497caIzBWzHA57khO/p09Yjvb28=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by SA3PR11MB801804.namprd11.prod.outlook.com (2603:10b6:806:530::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Thu, 26 Nov
 2026 15:58:45 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 15:58:44 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Harish Chegondi <harish.chegondi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <balasubramani.vivekanandan@intel.com>, Harish Chegondi
 <harish.chegondi@intel.com>
Subject: Re: [PATCH 1/1] drm/xe/eu_stall: Disable TDL clk gating during EU
 stall sampling
In-Reply-To: <b7f4a7dcfca32729740cc2485201abef639b5572.1795683151.git.harish.chegondi@intel.com>
References: <b7f4a7dcfca32729740cc2485201abef639b5572.1795683151.git.harish.chegondi@intel.com>
Date: Thu, 26 Nov 2026 12:58:40 -0300
Message-ID: <8733sna8jz.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0354.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::29) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|SA3PR11MB801804:EE_
X-MS-Office365-Filtering-Correlation-Id: c0d72661-9b3c-4665-22d3-08df4bd6263a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|261009223027099003|261026121527099003|261102123227099003|11063799006|261021121427099003|56012099006|261022075727099003|261021135927099003|261021123027099003|10067099003|261009223327099003|18002099003|22082099003|261009221727099003|261009221227099003|261009220027099003;
X-Microsoft-Antispam-Message-Info: px5+HwGSufL21jU6p24IZ5Kg49dLaVd60WQpv9GTy1rQOggCVax53wresAPFafrgpibfkJ5idSDN2ZpNC+MAnwsXxPH5i7glk8cwC+lCBI8rMqaPc2WwV5vEKCziMA3o0qoMHbeOHigGmJ9GGpZaJxwfuhNqHPikbznMl3nSGemnkZQ7s/Gr1rBOgnNpSf8DEoaM8Z8nsYJNHQpualKQNm7f2ttntVaBm/gGxsIyAGit/QeowbHRxj7SoJbQKdPNaa8+8miRXJ07QRN2v6zEyqYByL/6TLRgGdQpQ9K4yYKK8OHf7Y5LPh3uSTmPlLrDG69ntmf9GwnzZXCznIkBr8N5eU0ailhrg5kNOe3fQthXi2XzbH+gnrJXh+Wp975KVUKPQQG2jjufyxYKL4RA5mbMEiR+o9XpML7LrAzs1j1o4xOopoXLQn9msRDWmfP8heDE2haemqLLy7gq8iKC48Ar49EXG1tFvY+uyVhGIdUeXmeP0fHcksn8AdPSkDt7F8ZbjMNde7rmMHapn5+csy3lGJePMe8LuZyLpZaSfQ32cX7Tua4QQIqX4Glj81ojIL2JVqNJCkCdQsmlzI/hs7CkICvdRAY3uTknrYL8rJu5gd4DBkcENyFUEEnGx2jQyHLDeaSGHkrBoMlxgDmYqtNui9Bhc4XIIV/z0aE8K+o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5095.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(261009223027099003)(261026121527099003)(261102123227099003)(11063799006)(261021121427099003)(56012099006)(261022075727099003)(261021135927099003)(261021123027099003)(10067099003)(261009223327099003)(18002099003)(22082099003)(261009221727099003)(261009221227099003)(261009220027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TkNN1tg20ipxlyO5MH6hfh5/2qfoITFEDaOH+SAThc6XLH4DWWX39pqy1RJ8?=
 =?us-ascii?Q?VjbEgce2+rq78E47yTnuT42QwZ1gzzo0Nx53MJg8BqWk9p3FcVGQuWmOV+Zk?=
 =?us-ascii?Q?RwO96rvdGN69xAkOQdXd3xocprrfxmec5W4WsaoGflqxHZmzNagHx+Rsbg6I?=
 =?us-ascii?Q?7Yj3llPfDQ+KjgjrJW3EIaKxPusz/FpAQBnH7C87szn2c1HhWAND6MoyGyfQ?=
 =?us-ascii?Q?wyzJTyZPVgBRBwmraZBdzWFYg6kXDBxBJfvQ5eDa7e7tWGBucSP9N70jwmph?=
 =?us-ascii?Q?sy5QLc04MZF0aoaioruRWt+QXcZzo2bE8tzF26R8ryvta5CYvAm1Vwi7G2Wl?=
 =?us-ascii?Q?OVf4QyBUqjzii+y6sibFO76+dfQdnC1kA25rlt+4/MacAp0BiX39cSYDbgZ7?=
 =?us-ascii?Q?AbCde0A0H8FuQXfC4xA1Abb/Z6wzqkHM3fHAEHAVYL+dpqNQngtiwIzuMYOV?=
 =?us-ascii?Q?N63JX3B3znlKaHas+deD1s3xft1VRFoIuseZy6jmz3kZILs1CGYkfJBfpul6?=
 =?us-ascii?Q?RAaVUyayUDQeAZy6iCPK4utE1wbzx0/zEzwH0uWmX4Smakx3dg0QiPPogNYH?=
 =?us-ascii?Q?TZyWK4o0UYJOGsKeiARIp0kogmEJh5SBucGRU/c2KV1S9mmr5O4iQ7RfFnwJ?=
 =?us-ascii?Q?w4UqsU3qVPgDga3RiOispe41FgrVKgCOE8rmWZrLR3+ck+YeWiWq27MFEVd0?=
 =?us-ascii?Q?Q1yHN83kCE2dNFfWKLweXqq3gW/6MLx1yQDwUQ3LbfX+JbNSmuXqBP4CAS0I?=
 =?us-ascii?Q?id5xCwTI/r3rFD81nXIVn073aYpYt+Jha+54dl+M+/wmDYedvO06gWUWaOUn?=
 =?us-ascii?Q?BvH0JcyoH65lj8jcB8JCN94EtSuV8csTPf6vTXrIKPakrhUTgeNlQUjzfxBP?=
 =?us-ascii?Q?xAu7nc5pS93TUa7PxbNZk+FtgzYHW+YJpT7/cSiywaYNmLNjlYIsfTZK/6QW?=
 =?us-ascii?Q?EtJFOU1RvLDEp8N2AM8SQBRD/p19AFr7WeIg5dGrOBqbVNTPVV8THtDmNn2x?=
 =?us-ascii?Q?Ki2qs6p6m6/7Syt+8DKCdsvSjfkXbfTAcjTJUXEr26U/jw5Si0IdxGZq9DFa?=
 =?us-ascii?Q?tp5T14p6KVDfr7m194+gz1qbIQugKGvPIjfk7GEvfEUfLbYtElkug7+WIceb?=
 =?us-ascii?Q?mGCjBUo9xs6qrR3zwzGe59sdGYHei5DOxI6/4lOVYJbxtkwC9Q3sEmvaF/8S?=
 =?us-ascii?Q?yxf8EW5FGSLA3KHFLhuKLTR7xSCtHMJg5QXUHMPR4ib/2LrV0uSJ5fASoURk?=
 =?us-ascii?Q?+yJb0KlU17SSZXi2c0VL0PHck5uHRDzWwdIhHiRhJigH0O6ITTZmvFWXZPU1?=
 =?us-ascii?Q?xb8e2ZYNLrqmxiqxkoKyHLqAQcIBMlw6/atx8BNGpc1MPB7PfHCosV051EWU?=
 =?us-ascii?Q?lj7pM38e/fKRNNMYCXO52TUxjifQVdML/BC9EEuwyj4O2UdZR6/NMfauHlre?=
 =?us-ascii?Q?WNmFsP+suTF2Qmgr3aQAC+NuaXNeUheNfwZJapvzhM9CkORu1kLLUWCrFtEW?=
 =?us-ascii?Q?BBbYIQKxFMEhavkQzaQ0EukDdG6OoSizEFw9SQc2GmwTfTJq/k6lAhlc+7/K?=
 =?us-ascii?Q?P8i5BOD3r5fmZBh1B1oUwZvogYPMQL1dZt58X/f1jL3pfDw4OkHcRP1O6kkQ?=
 =?us-ascii?Q?evWqBva+axPqPIwNPt/5LhrBttPylAN7tlfhWH70YVHR4BuBs4fP84A+vUFz?=
 =?us-ascii?Q?UhgTOINUIu7qy6MDojkwiZSrZ002txVj656Fhw64JkMgKAHpOKnnk3xFEoC5?=
 =?us-ascii?Q?gTk3Xfjp+A=3D=3D?=
X-Exchange-RoutingPolicyChecked: T22jemPTyFbo106uDWkJlwSIj+nBTJ6aY15RiG4UD7oWrdup4FOxZPqOaxlKZuYe/Jz0aLPgE4egeMh+V0MvXFI2yQ3KbZMEKGAgFfini0H1wdgj6drlDEpub6RYBVDEMqU0mb0VjFR1oMJcWwNelBBkXpCOoCbMLeUEnob6egZ8wgm9x6Zc9xTncSQLrYVGtZHhXZuCJ5MVeXawQ41meJnd84XVglCcVXnclPogz7S2T0wG07IB5w9q6BV8PozKFM0/T2KHc2njTFUQTySS850bNzvEEin1hHClx/RC455BrHQz8x20I1wsiBdetGsXxY55ZPfgloh0I8nKBus/TA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d72661-9b3c-4665-22d3-08df4bd6263a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 15:58:44.8741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tegs5J/VCz4iGGpNW8vcDDIWv4kS4rcMH5LWHUvNYRbs3MTh0sGQOOCohiUsBtzKp78BUKemJGYWEw+mi+DPKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB801804
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

Harish Chegondi <harish.chegondi@intel.com> writes:

> As per the recent BSpec update, disable TDL clock gating during
> EU stall sampling on CRI.
>
> The patch is still under testing.
>
> Bspec: 60997
> Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
>  drivers/gpu/drm/xe/xe_eu_stall.c     | 13 +++++++++++++
>  2 files changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 06d45b1f2218..973901feb09c 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -378,6 +378,7 @@
>  
>  #define SUBSLICE_UNIT_LEVEL_CLKGATE2		XE_REG_MCR(0x9528)
>  #define   CPSSUNIT_CLKGATE_DIS			REG_BIT(9)
> +#define   TDLUNIT_CLKGATE_DIS			REG_BIT(0)
>  
>  #define SSMCGCTL9530				XE_REG_MCR(0x9530)
>  #define   RTFUNIT_CLKGATE_DIS			REG_BIT(18)
> diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> index c918fe3851c4..3ad450d8c6c3 100644
> --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> @@ -719,6 +719,12 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
>  		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
>  					  REG_MASKED_FIELD_ENABLE(DISABLE_DOP_GATING));
>  
> +	if (gt_to_xe(gt)->info.platform == XE_CRESCENTISLAND) {

The programming note in the Bspec update doesn't seem to restrict the
recommendation to CRI.  We probably need clarification to confirm that
the is really needed only for CRI.

Furthermore, in case the recomendation really doesn't apply broadly, is
checking for CRI the right thing here? Or should we actually be checking
the graphics version?

I would assume the latter.

--
Gustavo Sousa

> +		reg_value = xe_gt_mcr_unicast_read_any(gt, SUBSLICE_UNIT_LEVEL_CLKGATE2);
> +		reg_value |= TDLUNIT_CLKGATE_DIS;
> +		xe_gt_mcr_multicast_write(gt, SUBSLICE_UNIT_LEVEL_CLKGATE2, reg_value);
> +	}
> +
>  	for_each_dss_steering(xecore, gt, group, instance) {
>  		write_ptr_reg = xe_gt_mcr_unicast_read(gt, XEHPC_EUSTALL_REPORT, group, instance);
>  		/* Clear any drop bits set and not cleared in the previous session. */
> @@ -864,6 +870,7 @@ static int xe_eu_stall_enable_locked(struct xe_eu_stall_data_stream *stream)
>  static int xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
>  {
>  	struct xe_gt *gt = stream->gt;
> +	u32 reg_value;
>  	int ret = 0;
>  
>  	if (!stream->enabled)
> @@ -875,6 +882,12 @@ static int xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
>  
>  	cancel_delayed_work_sync(&stream->buf_poll_work);
>  
> +	if (gt_to_xe(gt)->info.platform == XE_CRESCENTISLAND) {
> +		reg_value = xe_gt_mcr_unicast_read_any(gt, SUBSLICE_UNIT_LEVEL_CLKGATE2);
> +		reg_value &= ~TDLUNIT_CLKGATE_DIS;
> +		xe_gt_mcr_multicast_write(gt, SUBSLICE_UNIT_LEVEL_CLKGATE2, reg_value);
> +	}
> +
>  	if (XE_GT_WA(gt, 22016596838))
>  		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
>  					  REG_MASKED_FIELD_DISABLE(DISABLE_DOP_GATING));
> -- 
> 2.43.0
