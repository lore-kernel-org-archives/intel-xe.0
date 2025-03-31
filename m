Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56EAAC36011
	for <intel-xe@archiver.kernel.org>; Mon, 31 Mar 2025 18:55:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 171C910E162;
	Mon, 31 Mar 2025 18:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SAnJzEgu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A093E10E162
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Mar 2025 18:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743447305; x=1774983305;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kKS1OBR8hKoIBvFE9gKkzEv088dxS+8sX+i+KBsjgbg=;
 b=SAnJzEgudaeOHbWgRWClt+8gznf+0P4DZDUeHcyl4RjVMncqDUk/rIkp
 J9ySF33uJJWR6iE4/R9jSRKuvtsGBtz0paABTJLfeYyPz3RIuIG788bbJ
 Kwjgp/LJRyH/McYugn7uGdh+CLKlaFHGf8IPjolG3us0pfY43/GKW4yTM
 +qBnaFMePakK9q2NkbRuVSFp7SObx5LDH0k05RfsS1dipDIMXifjMBNkk
 Ki9uMIIpcgLOevGaMRxRvWQCt56WY1Vt6Z1Qe2G24050Dwkx6tmXAQ5PO
 nNiiM/f8GWbPhs3I4DXhKOT4zMuxJPst4EZxAwhppNPKaIcL7zAkl3mPm g==;
X-CSE-ConnectionGUID: DtJZF+gxTkWpQGEuzbKQOA==
X-CSE-MsgGUID: i8oA6IqpQre5BVVdsa5qcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44920927"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; d="scan'208";a="44920927"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 11:55:04 -0700
X-CSE-ConnectionGUID: uILpApuKQb+NpdZZ4Bf71A==
X-CSE-MsgGUID: 8N4/Xr95QWqmvzugM5TnYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; d="scan'208";a="126139379"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 11:55:04 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 31 Mar 2025 11:55:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 11:55:03 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 11:55:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MAlb/QRM9giIJSieVfsIr8px3BYYPN9BAMacPdBe6Swxt8Ery4r51MRPhNLpvumaagbmPW/nHexSt3kbfVB41rHJqeeqUxMVrBY/z6ln+ceZFxaUBVu5n9ZFSIRLWBRAS0XThYkUXyNJ9zf2Puuu1Q4hE+w2EXdf3Ev8hekwLBBuxNyZjFHGSJ2RtDnR8FY3TQoGkGIfIwPPhM9MkUzqt7VM6hXoF6FTzPdwNj3KkBCklyp1Wx1hIrVOlms/zp6ncIC+DVq8BBPEETNCi9m1dvRna9TBvNNbsImXmERRuHoyfBoOm7p24Qr9fbxHCCTRfxCNUShOeazXWG+aPfw58g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+A8e6d3RlUosE8eqMjgHMKc09+mg6mg942hcKWdBcK0=;
 b=E5Df7zhEkyLhg+1V/Coz/uYiSLb1Pm40ZHxuk/AjPPzN7Ega5BqlJdq84IEufGxBUH9cQ5tYFovDsZmN/RnqOvp7ceBdEj8elG/e+XxdYUTnLZ0mO7/XQ/yd3z6oS8/DAFu37UdCmIUufBgg58EzsCU6PO9EO9IA3Xb0hzmc6Oqc8veaA3V2rL9bqxt/sQ8XjuQNlP+sBNFYjPD+tYfF2t+iKKcTOsvRZtvuwmeSl7pc2aHRNG9crxVlQVQWg0cjYJYAPAkE/phBgGvHSJuEVxy6G1iA6Re/AKn63OiR77wfP4hFmCQX+NL/iXcNEONWenJxCMbtglYk+p8o9jF72w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY8PR11MB7686.namprd11.prod.outlook.com (2603:10b6:930:70::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Mon, 31 Mar
 2025 18:54:47 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 18:54:47 +0000
Date: Mon, 31 Mar 2025 14:54:43 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Aradhya Bhatia <aradhya.bhatia@intel.com>,
 "Matt Roper" <matthew.d.roper@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v4 1/9] drm/xe/xelpg: Move Wa_14016712196 to the
 invalidate path
Message-ID: <Z-rk8xcPursz8lUu@intel.com>
References: <20250328163537.58942-1-tvrtko.ursulin@igalia.com>
 <20250328163537.58942-2-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250328163537.58942-2-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: MW2PR16CA0023.namprd16.prod.outlook.com (2603:10b6:907::36)
 To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY8PR11MB7686:EE_
X-MS-Office365-Filtering-Correlation-Id: 97dab2ab-27d0-48ff-7ce4-08dd7085820d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H5IeWOdtruY6jIQPx7WaiuQ1cwf9QzxOYZ6bZB3qj5h4STr6AqK6pap1Kusd?=
 =?us-ascii?Q?P0W1ZHAgQHI/JZeNhxUUMaT2fH5JrME+I8fGJOUKqPQcd2jJPA1VP34uDJyF?=
 =?us-ascii?Q?ZKzWsDo2W29VNBreXxbPk8kqSDBq0jEFlD+n7NiN910h16N6dAcR8Vayd6eS?=
 =?us-ascii?Q?qzABc1vJQpNt1u20WP5g+hiBe4aAGyubwTOfBwoU4zzITgJGAXTSJqqxhhD5?=
 =?us-ascii?Q?xBQMg3M5FJXVYRD0T+ZPVWbO2dEIWlY3pnpo+C8Ckw3k/ejScevTCdfF8IR1?=
 =?us-ascii?Q?Opm3Jz3bHWrcT6vHOkPATat5XVZIp7mpc7Rhw2NrJtp+hvapAReHWQL5V/Fm?=
 =?us-ascii?Q?HbzfnFuuoBVaU9DoRD56CCrAhaIZzCmnsWXCwC9sXf1VCswPj4xl0+sHJxvj?=
 =?us-ascii?Q?GXr+k01aGA/FUwWiDCA5QrTakdpkiq5azPL187GBNOjeZvaSxusl7BPVsbhC?=
 =?us-ascii?Q?YuwUNDOGUXXM89dc2D83sZ1E9ZE+7EbMwouxJW1D+h88aqyfIRLG+AB9eFho?=
 =?us-ascii?Q?nlIHWBJ7VBPOEWQYZmVAVi44ir10hvtRYr9VjphK28/X5juqIG6TGnZaEyZF?=
 =?us-ascii?Q?17nuPmJC0f8X7v9WndquQsA14ANSviJTkmREzpV65r9qh1GSZN9VSJS02G+b?=
 =?us-ascii?Q?JYY/KHgUU07v4LsrUsQP3mzgZjp1ryCgR9x9MMhs9Y4kxrpWQ/2Na6WYpeHR?=
 =?us-ascii?Q?DGHe1jHGgyx1FXG3o34xJeiVAYXreCIDbj23dr88f7i46B5ip9H9RDUvteTU?=
 =?us-ascii?Q?ltrVcLc1Q8MXvSddDzNAkUSb1cvlMLwLODMPm2fk05HLmSVj80s6P0HMkzQh?=
 =?us-ascii?Q?FumlPK4uyjw2LNOX9koMmsI0wMOaNQg1WVhcF8JKCAKGYZnwNPgHrH1vr+Cg?=
 =?us-ascii?Q?TxsaYm8Ui2rDWQOFoesPITGOcrWDIinKCGCRRc8ERqj/aWAcWYP13KNdDYZd?=
 =?us-ascii?Q?nPwG2/QE+sKUy3jmu38DjwnXfBwWyyAqz3CM27hpYGjza/NuKyNweAYCb3vq?=
 =?us-ascii?Q?zx8QlqFKBRZ2J19RqOdSH1XWPQ9Vsci5GhtIH1Z+xlmKfKOE4otGKlxnkNT+?=
 =?us-ascii?Q?TRYVONKZhMSp1FQBbaCHaxdYJolWQIVJRFwxU2mTROj3kH0NsLPpujYVgRJC?=
 =?us-ascii?Q?iK5dQctlruUFpz6Zlrf95yzKuivjkzFHm+hvnI2n8YLMV6jBXv84EamC1OnE?=
 =?us-ascii?Q?h//l53AO/tzi/FKaYJDsloc58eKsGF+K5wDCunCz9m6RehmlstrytMImHm6/?=
 =?us-ascii?Q?QXJNzF9V9xk3tRX3trr1TVHNb9OhV9cyLEnYMTXbtUpkhXWh9CPod+ONY+Ch?=
 =?us-ascii?Q?KztELt/L7AC5YvVKn6XjEUoDzmwh8Xe6RHxtQtXETZI3+pT9BPQR80RxkCzG?=
 =?us-ascii?Q?8FVXm9/dYO+TWWhv4Vzh0GCBlU0F?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4kwk1bxHpUqdarHNlyJfjvE5HMzPzkfyGgqAJAlkkP2gZGYB0xVRA8BWhgGi?=
 =?us-ascii?Q?lyoQGPPC6IN/WK6LerdtH/UZz71tQm/JkI23DoV9+R8xtp8FnqFWdfGavsp0?=
 =?us-ascii?Q?pH5XT4+kAyuz+qsxV/H1DJy/poY/RJ+gk44EoDVmdPYERANqhDTOM65aMRTC?=
 =?us-ascii?Q?d48SFyFxdgTgcQ2eGD7KdcqJgQGs59NTgYPY1ugwd2+O3jFRkLaPVB81YANu?=
 =?us-ascii?Q?x2+2fbJM8v1QO9XTfFL6hYwP3EjMfXsyy1OaHOynCg04OMp4x+c7YOsUPP+3?=
 =?us-ascii?Q?PMw9VmTdNx/J+6f+yKMiwzLpplKPBy6NiaoS8Emrke824NBhBLq2NffT0maY?=
 =?us-ascii?Q?5xmnpd+humUdJHOW0iWbU17PkOi1E6z7FdBZvYuUzZAlqvEwOSzq7pH42u00?=
 =?us-ascii?Q?/x8d0HVWbaiSDQNfC4LA3u6CkVwIqnSd3pUGEJV0TiyCzclGbbHkTTzccMyc?=
 =?us-ascii?Q?pntou27HOorjkVoau7akmleF53XG3NN/MEfuWqF61yHTYzzhTzp8NummlZ+7?=
 =?us-ascii?Q?bcBBuvE1AdHRDGoaoo2G3YH9QmJL9SAuzpPislqoffiozebOI0nh4qyol7YS?=
 =?us-ascii?Q?wAVLeZHtqwL+i+H9/4PiNNAkhx7Pv1HqDwbCmMQh49fPjhsi0KyNDMSRswU4?=
 =?us-ascii?Q?dtXyx65UjCBUbvvSHKMKU/Qz68co7yM+h2A8nalafhMYRlU+VTNKSE0ldC/k?=
 =?us-ascii?Q?bzf00WkfPaizvbCZGXVFS8FlGQJ6DZ3Kst82fu3MZ86fkO+BFWr3U84D6PMI?=
 =?us-ascii?Q?cw64RB7lsWWIq2dqA1v1OE1SW6KObsNwgSmfiqrjp4kCytT/M7GOEajbHSp2?=
 =?us-ascii?Q?1q18KRZI1qZBpTRmBhG3VVSVtzi3StaU3Mls99XMU384/RZwNvW7/3aGBFFD?=
 =?us-ascii?Q?lkDhVFuhRHJ+pE3m9R39eKiuNtYkRqGqOQcT18Erx5vYqJJeHp/aK9yg/L+Y?=
 =?us-ascii?Q?5bc7zkD5gOrQZRnLoswKM/w1fP12tjol4tlmMuuWXm/3QOensXReJahRuN1K?=
 =?us-ascii?Q?U4wrNphRU7nKnr8PQdPR/2oZOqTXLV2UR0z2lG0WxlzmRJyB7K6IEf3ZJKci?=
 =?us-ascii?Q?GhP2BMUGjNxY+gr0YBae6d580N8cy1xb9m4RIb9aIrB4uBajvLyt+ysvULRD?=
 =?us-ascii?Q?KE+4uf0eaTaPNxQcmOhdyyg9rsC6nFfhr3AMbL8ge8vCy0QzQYem0Q5a+7bT?=
 =?us-ascii?Q?HnSMeW6vLOc/8su33JetYtrFyceWbWOHhm8retKPypM+w/4rVWqm9V+12qer?=
 =?us-ascii?Q?0pHJ0G6lC7IyN9/oMasyqr1vus3Q03MOBVp3/MxDMNsm8Mu5shCFyzyjrvsF?=
 =?us-ascii?Q?ijXwnvJ67sBNo6hrG7rTbZ9XyQEcsyZQCJnWio0DbNMpahG9i0j8pGBI+cX5?=
 =?us-ascii?Q?YKB16mi4zymUAk4FARO6fqiUsL1wWSPVig89SlzLKf2H7LdIdfgtXr5uMaDu?=
 =?us-ascii?Q?TaEwC/bJ0dliyBM/ktOeeOXjHpdqbE8BDTZ/u57Z58qnRvA7w5rEFYnF6RU9?=
 =?us-ascii?Q?zuhAUR7SFBTpi7Bo8A6ERvOOogGkLMXvEPAR8mTCIkwW+JeVpzm4OXf71YfT?=
 =?us-ascii?Q?A3SaPZK2Xrq9XBAmKb50Pa7TQOV6Hl4ACh32aKLcsxzV59UFNhfF7Xv972YM?=
 =?us-ascii?Q?9A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97dab2ab-27d0-48ff-7ce4-08dd7085820d
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 18:54:47.4590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4eV6wxiz9UYFE3l7yqPxAOcUeLAoR1qqjGCAB5O6Lt39TkEr9i/M3gaUR+EBc6eFW3dHwb5RbXZ5xBGXNP6A1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7686
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

On Fri, Mar 28, 2025 at 04:35:28PM +0000, Tvrtko Ursulin wrote:
> According to i915 Wa_14016712196 needs to be emmited before a
> pipe control which contains a post sync operation.
> 
> Therefore move it from flush (no post sync) to invalidate (post sync).
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Fixes: 8c5fe7d88bc1 ("drm/xe: Add Wa_16021333562 and Wa_14016712196")
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Aradhya Bhatia <aradhya.bhatia@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> Please double check.

It looks like both options are possible.

We either insert a PIPE_CONTROL with "**Depth Flush** " post any state that
   will send an implicit depth flush and prior to any PIPE_CONTROL. This
   PIPE_CONTROL is not required if 3DPRIMITIVE, 3DMESH or PIPE_CONTROL that
   doesn't require end of the pipe drain is programmed prior to a PIPE_CONTROL
   that requires end of the pipe drain and hits this issue.

or

We insert a this pipe_control prior to PIPE_CONTROL which will hit the issue.  For
   timestamp, this could be a replicated pipe_control as it will write the
   correct value the 2nd time.  For post sync with write immediate, SW would have
   to allocate a dummy address.

So, is changing the order really helping your case or needed for your case?


> ---
>  drivers/gpu/drm/xe/xe_ring_ops.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 917fc16de866..88591b7a7715 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -134,8 +134,9 @@ emit_pipe_control(u32 *dw, int i, u32 bit_group_0, u32 bit_group_1, u32 offset,
>  	return i;
>  }
>  
> -static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, u32 *dw,
> -				int i)
> +static int
> +emit_pipe_invalidate(struct xe_gt *gt, u32 mask_flags, bool invalidate_tlb,
> +		     u32 *dw, int i)
>  {
>  	u32 flags = PIPE_CONTROL_CS_STALL |
>  		PIPE_CONTROL_COMMAND_CACHE_INVALIDATE |
> @@ -152,6 +153,10 @@ static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, u32 *dw,
>  
>  	flags &= ~mask_flags;
>  
> +	if (XE_WA(gt, 14016712196))
> +		i = emit_pipe_control(dw, i, 0, PIPE_CONTROL_DEPTH_CACHE_FLUSH,
> +				      LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR, 0);
> +
>  	return emit_pipe_control(dw, i, 0, flags, LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR, 0);
>  }
>  
> @@ -173,10 +178,6 @@ static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
>  	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
>  	u32 flags;
>  
> -	if (XE_WA(gt, 14016712196))
> -		i = emit_pipe_control(dw, i, 0, PIPE_CONTROL_DEPTH_CACHE_FLUSH,
> -				      LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR, 0);
> -
>  	flags = (PIPE_CONTROL_CS_STALL |
>  		 PIPE_CONTROL_TILE_CACHE_FLUSH |
>  		 PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
> @@ -361,7 +362,8 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>  		mask_flags = PIPE_CONTROL_3D_ENGINE_FLAGS;
>  
>  	/* See __xe_pt_bind_vma() for a discussion on TLB invalidations. */
> -	i = emit_pipe_invalidate(mask_flags, job->ring_ops_flush_tlb, dw, i);
> +	i = emit_pipe_invalidate(gt, mask_flags, job->ring_ops_flush_tlb, dw,
> +				 i);
>  
>  	/* hsdes: 1809175790 */
>  	if (has_aux_ccs(xe))
> -- 
> 2.48.0
> 
