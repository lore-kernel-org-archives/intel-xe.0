Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069F8C71157
	for <intel-xe@archiver.kernel.org>; Wed, 18 Jun 2025 22:46:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD7D10E969;
	Wed, 18 Jun 2025 22:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gatzXMIZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2938610E969
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Jun 2025 22:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750286802; x=1781822802;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nPqfdQWl2FQ7gNuuW+BXRjnltJmxJ6mfWXI3ngT2b4c=;
 b=gatzXMIZTlerEc+d/ViIw/ysfcPGKQOudG1Udid7h8kcB2jpYx4ZgFDt
 B7vyesBThGt4x26bx8s6OFx7hVEX/xCcCh+PQsFL+s+joBr9kQXA5kksD
 CjMVB/HyMh4fmGcHMhNdH2fE0uVrEeZuShO9BjP3qBX6TfaOaIaeQqZCN
 3rYdTYt1M55/JA0UP7fblBqlmjRUTkieVP59iFJxmB5A1atpLJJMWovLL
 5eerSLkkZiGHjoXoTib6JyFXlRUc2sWZsdfVCZA+ID+bGu4qC78F/UeUf
 HbQD8gVX3BTJg8EaXiu3IRtOIbUwdLSftFK6PCHNk7GLszrFD/blEghWo A==;
X-CSE-ConnectionGUID: jGTS1GbuS7WsUbpw4djQMw==
X-CSE-MsgGUID: ReBsyjF0Rb2Mm6+ixWbBoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52448998"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="52448998"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 15:46:41 -0700
X-CSE-ConnectionGUID: l35cgc5qTaOKSsrzwwROjQ==
X-CSE-MsgGUID: 8c9x37J9QPuld52cgS+l9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="181249075"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 15:46:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 15:46:41 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 18 Jun 2025 15:46:41 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.47)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 15:46:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=plry5e09yKwY6cmYe96RHdKaqB4PmkrWvG6nA8FBOpXbjxsLpYwkzxm/vcQV1w1DwRT/dVOVT4jwG7urWH/P/S6cK9w/TCIEuSc4QcKE2TrCps4SOEqx6oI74MRa0j97EFsSzGU6pg1hG0UDEvp/8cHkQ4mhB6B4pKH23To/BS5EE3WCXBoNw06CMLAyEEHxw2Eb34J36rPZarWHqAm6eOnehYQbxxRFrUKOm3tGCwhx0nUf48U7lc0jnmqlMtEwf/0qWV4BA9aO3nM1TNYeTdAYhXVF1NmWN9DAQ7VhWAZGWnYX+sLDF5H4vFUbtDxCU7vU5hBX92JVVvUM0d+M3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Smnws1eldUwR0vjwKalE2KlkC4v+wBNlBgHdkwpZUz4=;
 b=CHiM2avzRFWTZ5rn9OPeOSOtDatVJHMeuUjz8cWElJP+fA/OLhP1uLsoR8SrkiCiLePA5t9cUox8sVsvB4Ja5D9gTmJscsW6cGPoEvKSnh4J/NY+yTGStU5/k3D8l0Ug9R07Po0NAqCMH+dvpR5wW5JD+i274fO1ZUYxHf+6trQIXHi1QY9rbwxFEosXkiTId3Wa7uotGXUt1+9d62eE/L1MUhzJcxE4tJG0otj7M80fdzlJSU2XVh4kOtFR2ynUO63Hns9tpHJr7UgVa8JOnfAWiyhiGIyiXR9dc7EE260Q5RKorqosNPDSGfevF+eDaVjLomCrMUpns+fPybMCFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM3PPFD2F4A0090.namprd11.prod.outlook.com (2603:10b6:f:fc00::f50) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 18 Jun
 2025 22:46:37 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8857.016; Wed, 18 Jun 2025
 22:46:37 +0000
Date: Wed, 18 Jun 2025 15:46:34 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for Add
 WildCat Lake support
Message-ID: <20250618224634.GC4755@mdroper-desk1.amr.corp.intel.com>
References: <20250613193146.3549862-1-dnyaneshwar.bhadane@intel.com>
 <175001798264.80433.15695367238368136170@1538d3639d33>
 <90bc1e1c-e38d-4336-ac71-e99749cbeb0a@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <90bc1e1c-e38d-4336-ac71-e99749cbeb0a@intel.com>
X-ClientProxiedBy: BY5PR20CA0032.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::45) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM3PPFD2F4A0090:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e364937-6402-463a-9653-08ddaeb9fb92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UG/PoXXLdkeGtNgotaYbOqK2siGHTYIjZqjsbBGIYrKsN3nbDMFvo9X033Ex?=
 =?us-ascii?Q?bW2tDUTUnoDMfpRAoi6bil9XFMQIN0dS9i3cLnTqgjMRofiSSzPpLksHFZwg?=
 =?us-ascii?Q?clcNHrrc/lTqbDhX6jAzmJhZyXXBclUbzrje0ATNrbUfHEhomSivRCBqiI/C?=
 =?us-ascii?Q?AcfUNCodB8EXLtI6gerMQ4l8dgTm3oDeQjDcPGe3gsPOYgbucI7tnMdfiLJr?=
 =?us-ascii?Q?oD+Q/S04GZPbEhwTVwsWsrj7nuyUrAm5moTeYxOxUZyy/Y9upvcZ68lM9T7A?=
 =?us-ascii?Q?e4BXsvgyKdg099jarxt1/NkxANN06g9oJyVFJPj4MA1QqlAhrs4netERzKqQ?=
 =?us-ascii?Q?8irnP3b843cPtpsi2FLlpSQnxwlCIfdy9uHKcqj67UFP8XeSJFguuQqHx0zb?=
 =?us-ascii?Q?85NJi+/bopgBTEP+gJm2yhbfZPW1A9xEnhvB9CM/cNtpg+l0jc1xD7E09Qpq?=
 =?us-ascii?Q?3Ipf5U9YIxVNJ12UgIP178XySPcRL8kNQXKB88yYpAoipbpazq9V1lH0az5W?=
 =?us-ascii?Q?Crw9WTRxt7WIA3O8VVIdFKU4eiccjAIEKY8RHuq+t5KaGSZSoEtaeL+DRPOu?=
 =?us-ascii?Q?CU5vN5UVC3ubskbvk9kwFFglsQaYIRTcYF2aAB6IgdU8YZW804pqKDetIg+c?=
 =?us-ascii?Q?AHr4I/fCNtYVX0OP0stsEkoE6HlR9K1Z3sa8l7IsFSJzLfUjX6u9Zzjix3Rs?=
 =?us-ascii?Q?6vZWSfmca/Uh1TJ45RJKDDmYY3JKdixSr6nltBvSLlbMH/L9r6CEmUPZDUa+?=
 =?us-ascii?Q?s+rNJFR3dG5bkATOni7VI3UBjKCe5pDdfCn1w/8M7DoFnpvsiON/09zeLoXe?=
 =?us-ascii?Q?vRa0ckBtlOVjrxjO7aIPg2dSoHKEPv0sJV5LwWztw6/Mtl0xSJoraVoYK0mp?=
 =?us-ascii?Q?E6Rhh3U9JgYIFYOk7vwN4UH3b23YG22VRdV+as5Hc8l8oVHTDaR5xd+Z/Mts?=
 =?us-ascii?Q?f0Ccv1mnaeGqpDBsEfQI3vF6rK3sarj0b/jmgc81vNFT3x3YnmfDRLydht3J?=
 =?us-ascii?Q?NEJymsJInCSwjiNcjKwNOUv1nDSdRTJCrGXORKdE8+BFR3oosyXKzh0p8Cis?=
 =?us-ascii?Q?YbzegU/R/6EOEhDBd2Im+nY6jLQ81R4TcqLPw7PhHgAV1JXy/EJv2B8K5TkN?=
 =?us-ascii?Q?aBn5S9RntKp302RC9S6eTQmxAPMSSvAoRwvvDuXKro8X+Pk1f6Agw9CGq9eR?=
 =?us-ascii?Q?aQeJrezZDAdyufihZ+qcuXKqeDR5oQ7/MPx/vQVYF1fj8oKjSQ0UYRCR5K5N?=
 =?us-ascii?Q?rLnfzLHDoTsdKJrbQuTyQBjI6SUIWt0y/lLRbk5ssenveXuWddxDkyHgP1B3?=
 =?us-ascii?Q?quCcBlv7H4GCusRG83H8hhd/hZgQ32lhh4a/z3Swb39eSt8xe9jxd4qND7do?=
 =?us-ascii?Q?OfKCWiY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?91kds8AtPhpWG1ZZqZNndwZa2xSlJf93K/wlyi2fCH09U4taXeKhInEzgBFA?=
 =?us-ascii?Q?CqG82bdeKRld3FwaRELB8JikgR63wN0lOillt0CmQyMeX/JEUyJbkfbOZN6x?=
 =?us-ascii?Q?nIdGbtMJMisrHKjJJO9HX8CnL3K9S1ZB0r5XrhJRtIICBVViOhIqDeAJg9Uv?=
 =?us-ascii?Q?215l5NF5yTyVz7fp9ryBMYj7w4wFv/LbKJrdKpquGxUi2QDM1SVaTJ/JSU1R?=
 =?us-ascii?Q?sH6++wdeoUDBKsoNcH4+4e+f7kvoT4RAEYIFilJn7u9X4lI1eIVw//qL35Ba?=
 =?us-ascii?Q?Q7jg2VqYAUjbfN+5hUf5TrAJb35u+KERCHfYW3QFQu/9CECLK3ZVUuh4AmlU?=
 =?us-ascii?Q?/woUwqMB22WduumHSgoTVEkNn2HM6rVsAKDGb53F7Pz46z50qRJtIcHvzVtm?=
 =?us-ascii?Q?eWx9NxJV/OVpRyyY5r6COQ53lz0iKYjTdL1AcudaUtcqLrPx6WgKeAhK+Wa4?=
 =?us-ascii?Q?8mgdw8k9925ZAt87fHXJqJ1ykXn6W+4x1l3j40doHsQeQUebXZL8aYyho0j+?=
 =?us-ascii?Q?0qnxEfh9/16qsvpVAYAiAkJcBynjLPY2Znx6eS2LCi3ckWav295+6KyRkIca?=
 =?us-ascii?Q?AneNRx1L7ehwyynjjc2OJ+33Q8tO1VBOkx+ITDTRgjbNA10BliQ+zwwYdZ4e?=
 =?us-ascii?Q?vwxxG0p5FWDPxJXXp6ZR4WDUxpiUL3hhcN4OO3KJfuUHkLJPg8CRcUeu6SaI?=
 =?us-ascii?Q?zHyadjYrSn2AkT3bMpnNMn3727OrkX+UPLVeNVb9GEl044am+0Ihuq2a7GGf?=
 =?us-ascii?Q?uhmQReVGBcPSTwnnZiphzzNk9xJSSlmGzeXMh49RA4a3IvnJTQmNR7yBILsF?=
 =?us-ascii?Q?Cp5zIEPpENo5VCVGumCiR2SsoiJS2n8fQXx4D9P5AIQwlVNjxf3NLLxN5hHg?=
 =?us-ascii?Q?4Su6zXbhOBcYMkS8qFKTdlL+TUFz95mamVA9ZeojGPvXa0FFtSp7fhmZrYTC?=
 =?us-ascii?Q?+1s0QMkmHGzpAHDxlfTmyGx88NC5xD2je9blC2MrPGdkiEz7L7Vu2xOzCDQK?=
 =?us-ascii?Q?1WHRYlwUJdoiw00WE6griDNPXk9oEIac2AHeChfObElztfhZwkMLxJXz0KwK?=
 =?us-ascii?Q?VWBfRReSzqWztNk8Mur/Pt5LHF613fmeLQ0YMqUWK2LbheTAuqdezMmyfHzB?=
 =?us-ascii?Q?OJMw1fIHKZNyujndeXuhEnCYV36BEdWaokJMxZSJ4Plm6ny8aiCzuryRc5RA?=
 =?us-ascii?Q?LJs8Usu9umcvSUJ1pKh4O6ltDgH05APl9G3vTw4VhC5Xxqa51zNoDhoHM6u3?=
 =?us-ascii?Q?FC5Kdcnl3EXnHB2nRjcX6SmoYa6aaQJuZFBr1xAHRCO6SMPJGBgJVzpnQJZw?=
 =?us-ascii?Q?lMnkJZEZJYYxko45uZuBmT8/0kl+k53AyMfmmXfAH5wzORrW60wn6w3Ql48X?=
 =?us-ascii?Q?MMYhiE/v6m/w6WNdmm9hoLO3ZpMkMF1XzOT4eX5Bx3c4gehbYLiA+QRoAzPH?=
 =?us-ascii?Q?S72d6JGYu9EAuJgJc5cnKxoRcTULgOhNwRVIJzlqwKbK4IrhOF9r9qGYVPmK?=
 =?us-ascii?Q?taSdCe/slLdvBSef54iaPRl+xEuQapid2xdYcebVkx+ubIy43PMlbuR9TXEQ?=
 =?us-ascii?Q?0R9myxybfOsuzMyu4fs8MHom6RTMS8XK7t9AkuX5tfl9pZP0nATZ+Jox3nR0?=
 =?us-ascii?Q?JQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e364937-6402-463a-9653-08ddaeb9fb92
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 22:46:37.3577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pL3V6Z1KPcburvuw4ZWCW53wX5ku0hxcwZiUtwIbIgZQ+5VVSipbgTosglfNfkZdyGbY2L4eb20l9T2WHxd1dEqwC3/tlhyF3FMFMhEDwMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFD2F4A0090
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

On Wed, Jun 18, 2025 at 12:17:41PM +0530, Bhadane, Dnyaneshwar wrote:
> 
> 
> On 16-Jun-25 1:36 AM, Patchwork wrote:
> > *Patch Details*
> > *Series:*	Add WildCat Lake support
> > *URL:*	https://patchwork.freedesktop.org/series/150255/ <https://
> > patchwork.freedesktop.org/series/150255/>
> > *State:*	failure
> > *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/
> > index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/
> > index.html>
> > 
> > 
> >   CI Bug Log - changes from
> >   xe-3252-4d016d6e602638e0ebc3895331224e057508c07a_FULL -> xe-
> >   pw-150255v1_FULL
> > 
> > 
> >     Summary
> > 
> > *FAILURE*
> > 
> > Serious unknown changes coming with xe-pw-150255v1_FULL absolutely need
> > to be
> > verified manually.
> > 
> > If you think the reported changes have nothing to do with the changes
> > introduced in xe-pw-150255v1_FULL, please notify your bug team (I915-ci-
> > infra@lists.freedesktop.org) to allow them
> > to document this new failure mode, which will reduce false positives in CI.
> > 
> > 
> >     Participating hosts (4 -> 4)
> > 
> > No changes in participating hosts
> > 
> > 
> >     Possible new issues
> > 
> > Here are the unknown changes that may have been introduced in xe-
> > pw-150255v1_FULL:
> > 
> > 
> >       IGT changes
> > 
> > 
> >         Possible regressions
> > 
> >   * igt@kms_flip@flip-vs-absolute-wf_vblank@d-hdmi-a1:
> >       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-3/
> >         igt@kms_flip@flip-vs-absolute-wf_vblank@d-hdmi-a1.html> -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
> >         adlp-9/igt@kms_flip@flip-vs-absolute-wf_vblank@d-hdmi-a1.html>
> > 
> > 
> >         Warnings
> > 
> >   * igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random:
> >       o shard-adlp: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-9/
> >         igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-
> >         random.html> (Intel XE#5214 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/5214>) -> DMESG-FAIL <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-1/
> >         igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-
> >         random.html> +1 other test dmesg-fail
> > 
> > 
> These issue are not affected by thie above series, We can ignore it.
> Dnyaneshwar,

Xe patches (#2, 3, and 6) applied to drm-xe-next.  Thanks for the
patches and reviews.


Matt

> >     Known issues
> > 
> > Here are the changes found in xe-pw-150255v1_FULL that come from known
> > issues:
> > 
> > 
> >       IGT changes
> > 
> > 
> >         Issues hit
> > 
> >   *
> > 
> >     igt@kms_big_fb@linear-32bpp-rotate-270:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_big_fb@linear-32bpp-
> >         rotate-270.html> (Intel XE#2327 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/2327>) +1 other test skip
> >   *
> > 
> >     igt@kms_big_fb@x-tiled-32bpp-rotate-270:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@kms_big_fb@x-
> >         tiled-32bpp-rotate-270.html> (Intel XE#316 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
> >   *
> > 
> >     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> > 
> >       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
> >         igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-
> >         flip.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-pw-150255v1/shard-dg2-436/igt@kms_big_fb@x-tiled-max-hw-
> >         stride-64bpp-rotate-180-async-flip.html> (Intel XE#2351
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
> >         Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/4208>)
> >   *
> > 
> >     igt@kms_big_fb@y-tiled-addfb-size-overflow:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_big_fb@y-tiled-
> >         addfb-size-overflow.html> (Intel XE#610 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/610>)
> >   *
> > 
> >     igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@kms_big_fb@yf-
> >         tiled-8bpp-rotate-270.html> (Intel XE#1124 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +1 other test
> >         skip
> >   *
> > 
> >     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-
> >         hw-stride-64bpp-rotate-180-hflip.html> (Intel XE#1124 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
> >   *
> > 
> >     igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
> > 
> >       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-5/
> >         igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html> -
> >          > SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
> >         pw-150255v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-
> >         displays-3840x2160p.html> (Intel XE#2314 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2314> / Intel
> >         XE#2894 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>)
> >   *
> > 
> >     igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_bw@connected-linear-
> >         tiling-3-displays-1920x1080p.html> (Intel XE#2314 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2314> / Intel
> >         XE#2894 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>)
> >   *
> > 
> >     igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@kms_bw@connected-
> >         linear-tiling-4-displays-3840x2160p.html> (Intel XE#2191
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
> >   *
> > 
> >     igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_ccs@bad-aux-
> >         stride-4-tiled-mtl-rc-ccs-cc.html> (Intel XE#2887 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +3 other
> >         tests skip
> >   *
> > 
> >     igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1:
> > 
> >       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_ccs@bad-pixel-
> >         format-y-tiled-ccs@pipe-d-hdmi-a-1.html> (Intel XE#455 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +1
> >         other test skip
> >   *
> > 
> >     igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs@pipe-c-dp-4:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@kms_ccs@bad-
> >         pixel-format-y-tiled-gen12-rc-ccs@pipe-c-dp-4.html> (Intel
> >         XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/787>) +13 other tests skip
> >   *
> > 
> >     igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@kms_ccs@bad-
> >         pixel-format-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html> (Intel
> >         XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/787>) +3 other tests skip
> >   *
> > 
> >     igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_ccs@bad-
> >         rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html> (Intel XE#2652
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652> /
> >         Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/787>) +7 other tests skip
> >   *
> > 
> >     igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:
> > 
> >       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_ccs@bad-
> >         rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html> (Intel
> >         XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/787>) +5 other tests skip
> >   *
> > 
> >     igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_ccs@crc-primary-
> >         suspend-y-tiled-gen12-rc-ccs-cc.html> (Intel XE#3432 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/3432>)
> >   *
> > 
> >     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
> > 
> >       o shard-dg2-set2: NOTRUN -> INCOMPLETE <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/
> >         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html>
> >         (Intel XE#3124 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/3124>)
> >   *
> > 
> >     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
> > 
> >       o shard-dg2-set2: NOTRUN -> DMESG-WARN <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/
> >         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-
> >         a-6.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/
> >         kernel/issues/1727> / Intel XE#3113 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/3113>)
> >   *
> > 
> >     igt@kms_cdclk@mode-transition:
> > 
> >       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
> >         igt@kms_cdclk@mode-transition.html> -> SKIP <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/
> >         igt@kms_cdclk@mode-transition.html> (Intel XE#4208 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +8 other
> >         tests skip
> >   *
> > 
> >     igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:
> > 
> >       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_cdclk@mode-
> >         transition@pipe-a-hdmi-a-1.html> (Intel XE#4417 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/4417>) +2 other
> >         tests skip
> >   *
> > 
> >     igt@kms_chamelium_color@ctm-blue-to-red:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_chamelium_color@ctm-
> >         blue-to-red.html> (Intel XE#2325 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2325>)
> >   *
> > 
> >     igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-
> >         hpd-after-suspend.html> (Intel XE#2252 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +2 other
> >         tests skip
> >   *
> > 
> >     igt@kms_content_protection@srm@pipe-a-dp-2:
> > 
> >       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-bmg-2/
> >         igt@kms_content_protection@srm@pipe-a-dp-2.html> (Intel XE#1178
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
> >   *
> > 
> >     igt@kms_content_protection@uevent:
> > 
> >       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-150255v1/shard-dg2-436/
> >         igt@kms_content_protection@uevent.html> (Intel XE#1188 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1188>) +1 other test
> >         fail
> >   *
> > 
> >     igt@kms_cursor_crc@cursor-onscreen-32x32:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_cursor_crc@cursor-
> >         onscreen-32x32.html> (Intel XE#2320 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) +1 other test
> >         skip
> >   *
> > 
> >     igt@kms_cursor_crc@cursor-sliding-512x170:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_cursor_crc@cursor-
> >         sliding-512x170.html> (Intel XE#2321 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2321>)
> >   *
> > 
> >     igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
> > 
> >       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-5/
> >         igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html> -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
> >         bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html>
> >         (Intel XE#2291 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/2291>) +4 other tests skip
> >   *
> > 
> >     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-
> >     transitions-varying-size:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_cursor_legacy@short-
> >         busy-flip-before-cursor-atomic-transitions-varying-size.html>
> >         (Intel XE#2286 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/2286>)
> >   *
> > 
> >     igt@kms_fbcon_fbt@fbc-suspend:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_fbcon_fbt@fbc-
> >         suspend.html> (Intel XE#4156 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/4156>)
> >   *
> > 
> >     igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3:
> > 
> >       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-3/
> >         igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html> -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
> >         bmg-4/igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html>
> >         (Intel XE#2882 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/2882>)
> >   *
> > 
> >     igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-hdmi-a6-dp4:
> > 
> >       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
> >         igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-hdmi-a6-dp4.html>
> >         -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
> >         pw-150255v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-blocking-wf-
> >         vblank@ab-hdmi-a6-dp4.html> (Intel XE#886 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +1 other test fail
> >   *
> > 
> >     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
> > 
> >       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/
> >         igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-
> >         dp4.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
> >         pw-150255v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-
> >         vblank-interruptible@bd-hdmi-a6-dp4.html> (Intel XE#301
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301> /
> >         Intel XE#3321 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/3321>)
> >   *
> > 
> >     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
> > 
> >       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/
> >         igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-
> >         dp4.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
> >         pw-150255v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-
> >         vblank-interruptible@cd-hdmi-a6-dp4.html> (Intel XE#301
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +5
> >         other tests fail
> >   *
> > 
> >     igt@kms_flip@2x-plain-flip:
> > 
> >       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-5/
> >         igt@kms_flip@2x-plain-flip.html> -> SKIP <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-6/
> >         igt@kms_flip@2x-plain-flip.html> (Intel XE#2316 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) +4 other
> >         tests skip
> >   *
> > 
> >     igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1:
> > 
> >       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-3/
> >         igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1.html> -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
> >         adlp-9/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1.html>
> >         (Intel XE#2882 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/2882>) +2 other tests fail
> >   *
> > 
> >     igt@kms_flip@flip-vs-suspend-interruptible:
> > 
> >       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-2/
> >         igt@kms_flip@flip-vs-suspend-interruptible.html> -> INCOMPLETE
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
> >         bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html> (Intel
> >         XE#2049 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/2049> / Intel XE#2597 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/2597>) +1 other test incomplete
> >   *
> > 
> >     igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:
> > 
> >       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/
> >         igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html> ->
> >         INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
> >         pw-150255v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend-
> >         interruptible@c-dp4.html> (Intel XE#2049 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2049> / Intel
> >         XE#2597 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597>)
> >   *
> > 
> >     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-
> >     upscaling@pipe-a-valid-mode:
> > 
> >       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-adlp-6/
> >         igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-
> >         upscaling@pipe-a-valid-mode.html> (Intel XE#455 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +3 other tests
> >         skip
> >   *
> > 
> >     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-bmg-5/
> >         igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-
> >         upscaling.html> (Intel XE#2293 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/2293> / Intel XE#2380 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2380>) +1 other test
> >         skip
> >   *
> > 
> >     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-
> >     upscaling@pipe-a-valid-mode:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-bmg-5/
> >         igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-
> >         upscaling@pipe-a-valid-mode.html> (Intel XE#2293 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2293>) +1 other test
> >         skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-150255v1/shard-dg2-433/
> >         igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-
> >         mmap-wc.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/651>) +5 other tests skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-bmg-5/
> >         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-
> >         render.html> (Intel XE#4141 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/4141>) +5 other tests skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-bmg-2/
> >         igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-
> >         render.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/2311>) +6 other tests skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-150255v1/shard-dg2-433/
> >         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-
> >         blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/
> >         kernel/issues/653>) +4 other tests skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-150255v1/shard-dg2-436/
> >         igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-
> >         blt.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/
> >         kernel/issues/2351> / Intel XE#4208 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +3 other
> >         tests skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-bmg-5/
> >         igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html>
> >         (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/2313>) +8 other tests skip
> >   *
> > 
> >     igt@kms_hdr@brightness-with-hdr:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-150255v1/shard-dg2-433/
> >         igt@kms_hdr@brightness-with-hdr.html> (Intel XE#455 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
> >   *
> > 
> >     igt@kms_hdr@static-swap:
> > 
> >       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-5/
> >         igt@kms_hdr@static-swap.html> -> SKIP <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-6/
> >         igt@kms_hdr@static-swap.html> (Intel XE#1503 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1503>) +1 other test
> >         skip
> >   *
> > 
> >     igt@kms_joiner@basic-force-ultra-joiner:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@kms_joiner@basic-
> >         force-ultra-joiner.html> (Intel XE#2925 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2925>)
> >   *
> > 
> >     igt@kms_joiner@invalid-modeset-ultra-joiner:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_joiner@invalid-
> >         modeset-ultra-joiner.html> (Intel XE#2927 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2927>)
> >   *
> > 
> >     igt@kms_lease@lease-get:
> > 
> >       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
> >         igt@kms_lease@lease-get.html> -> SKIP <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/
> >         igt@kms_lease@lease-get.html> (Intel XE#4208 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
> >         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
> >         +4 other tests skip
> >   *
> > 
> >     igt@kms_plane_multiple@2x-tiling-y:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_plane_multiple@2x-
> >         tiling-y.html> (Intel XE#5021 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/5021>)
> >   *
> > 
> >     igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-150255v1/shard-dg2-436/
> >         igt@kms_plane_scaling@plane-upscale-factor-0-25-with-
> >         modifiers.html> (Intel XE#4208 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/4208> / i915#2575 <https://
> >         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) +19 other
> >         tests skip
> >   *
> > 
> >     igt@kms_pm_dc@dc5-retention-flops:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_pm_dc@dc5-retention-
> >         flops.html> (Intel XE#3309 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/3309>)
> >   *
> > 
> >     igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_psr2_sf@pr-overlay-
> >         plane-move-continuous-sf.html> (Intel XE#1489 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
> >   *
> > 
> >     igt@kms_psr2_su@page_flip-xrgb8888:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-150255v1/shard-dg2-433/
> >         igt@kms_psr2_su@page_flip-xrgb8888.html> (Intel XE#1122
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>)
> >   *
> > 
> >     igt@kms_psr@fbc-psr2-primary-blt:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_psr@fbc-psr2-
> >         primary-blt.html> (Intel XE#2234 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2234> / Intel
> >         XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/2850>) +2 other tests skip
> >   *
> > 
> >     igt@kms_psr@pr-sprite-plane-onoff:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@kms_psr@pr-
> >         sprite-plane-onoff.html> (Intel XE#2850 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +1
> >         other test skip
> >   *
> > 
> >     igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-150255v1/shard-dg2-433/
> >         igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html> (Intel
> >         XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
> >   *
> > 
> >     igt@kms_setmode@basic-clone-single-crtc:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_setmode@basic-clone-
> >         single-crtc.html> (Intel XE#1435 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1435>)
> >   *
> > 
> >     igt@xe_compute_preempt@compute-preempt:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-150255v1/shard-dg2-433/
> >         igt@xe_compute_preempt@compute-preempt.html> (Intel XE#1280
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280> /
> >         Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/455>) +1 other test skip
> >   *
> > 
> >     igt@xe_eudebug@basic-vm-bind:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-bmg-5/igt@xe_eudebug@basic-vm-
> >         bind.html> (Intel XE#4837 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/4837>) +1 other test skip
> >   *
> > 
> >     igt@xe_eudebug@basic-vm-bind-extended-discovery:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@xe_eudebug@basic-
> >         vm-bind-extended-discovery.html> (Intel XE#4837 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +2 other
> >         tests skip
> >   *
> > 
> >     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-bmg-5/igt@xe_exec_basic@multigpu-
> >         many-execqueues-many-vm-null-defer-mmap.html> (Intel XE#2322
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>) +3
> >         other tests skip
> >   *
> > 
> >     igt@xe_exec_basic@no-exec-bindexecqueue-rebind:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@xe_exec_basic@no-
> >         exec-bindexecqueue-rebind.html> (Intel XE#4208 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +104 other
> >         tests skip
> >   *
> > 
> >     igt@xe_exec_fault_mode@twice-invalid-fault:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-150255v1/shard-dg2-436/
> >         igt@xe_exec_fault_mode@twice-invalid-fault.html> (Intel XE#288
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +2
> >         other tests skip
> >   *
> > 
> >     igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-
> >     new-huge-nomemset:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-bmg-2/
> >         igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-
> >         mmap-new-huge-nomemset.html> (Intel XE#4943 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/4943>) +5 other
> >         tests skip
> >   *
> > 
> >     igt@xe_exec_system_allocator@threads-shared-vm-many-large-
> >     execqueues-new-bo-map-nomemset:
> > 
> >       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-lnl-6/
> >         igt@xe_exec_system_allocator@threads-shared-vm-many-large-
> >         execqueues-new-bo-map-nomemset.html> -> FAIL <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-lnl-2/
> >         igt@xe_exec_system_allocator@threads-shared-vm-many-large-
> >         execqueues-new-bo-map-nomemset.html> (Intel XE#5018 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/5018>) +1 other test
> >         fail
> >   *
> > 
> >     igt@xe_exec_system_allocator@twice-mmap-remap-dontunmap:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-150255v1/shard-dg2-433/
> >         igt@xe_exec_system_allocator@twice-mmap-remap-dontunmap.html>
> >         (Intel XE#4915 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/4915>) +37 other tests skip
> >   *
> > 
> >     igt@xe_module_load@load:
> > 
> >       o shard-dg2-set2: (PASS <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-
> >         dg2-464/igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-464/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-464/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-435/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-435/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-435/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-464/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-464/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-464/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-435/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-435/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-435/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
> >         igt@xe_module_load@load.html>) -> (PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-435/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-435/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-435/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-464/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-464/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-435/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-464/
> >         igt@xe_module_load@load.html>, SKIP <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-464/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-435/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-464/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-435/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/
> >         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/
> >         igt@xe_module_load@load.html>) (Intel XE#378 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/378>)
> >   *
> > 
> >     igt@xe_oa@create-destroy-userspace-config:
> > 
> >       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-lnl-4/
> >         igt@xe_oa@create-destroy-userspace-config.html> -> INCOMPLETE
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
> >         lnl-3/igt@xe_oa@create-destroy-userspace-config.html> (Intel
> >         XE#2594 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594>)
> >   *
> > 
> >     igt@xe_oa@polling-small-buf:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@xe_oa@polling-
> >         small-buf.html> (Intel XE#2541 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/2541> / Intel XE#3573 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/3573>) +1 other test
> >         skip
> >   *
> > 
> >     igt@xe_pm@s2idle-d3cold-basic-exec:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@xe_pm@s2idle-
> >         d3cold-basic-exec.html> (Intel XE#2284 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Intel XE#366
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
> >   *
> > 
> >     igt@xe_pm@s3-basic:
> > 
> >       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/
> >         igt@xe_pm@s3-basic.html> -> INCOMPLETE <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-6/igt@xe_pm@s3-
> >         basic.html> (Intel XE#569 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/569>) +1 other test incomplete
> >   *
> > 
> >     igt@xe_pm@s4-vm-bind-userptr:
> > 
> >       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-3/
> >         igt@xe_pm@s4-vm-bind-userptr.html> -> ABORT <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-9/
> >         igt@xe_pm@s4-vm-bind-userptr.html> (Intel XE#1794 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
> >   *
> > 
> >     igt@xe_pmu@gt-frequency:
> > 
> >       o shard-adlp: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-adlp-6/igt@xe_pmu@gt-
> >         frequency.html> (Intel XE#5214 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/5214>) +1 other test abort
> >   *
> > 
> >     igt@xe_pxp@pxp-termination-key-update-post-suspend:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-bmg-5/igt@xe_pxp@pxp-termination-
> >         key-update-post-suspend.html> (Intel XE#4733 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/4733>) +1 other test
> >         skip
> >   *
> > 
> >     igt@xe_sriov_flr@flr-each-isolation:
> > 
> >       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-bmg-2/igt@xe_sriov_flr@flr-each-
> >         isolation.html> (Intel XE#3342 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/3342>)
> > 
> > 
> >         Possible fixes
> > 
> >   *
> > 
> >     igt@kms_addfb_basic@bad-pitch-63:
> > 
> >       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
> >         igt@kms_addfb_basic@bad-pitch-63.html> (Intel XE#4950 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/4950>) -> PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
> >         adlp-6/igt@kms_addfb_basic@bad-pitch-63.html> +18 other tests pass
> >   *
> > 
> >     igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1:
> > 
> >       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-
> >         adlp-4/igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-
> >         hdmi-a-1.html> (Intel XE#4543 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/4543>) -> PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/
> >         igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-
> >         a-1.html> +1 other test pass
> >   *
> > 
> >     igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/
> >         igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html>
> >         (Intel XE#2314 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/2314> / Intel XE#2894 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/2894>) -> PASS <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/
> >         igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html>
> >   *
> > 
> >     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> > 
> >       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-
> >         dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
> >         (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/1727> / Intel XE#3113 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/3113> / Intel XE#3124 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/3124>) -> PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
> >         dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
> >         +1 other test pass
> >   *
> > 
> >     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
> > 
> >       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-
> >         dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-
> >         hdmi-a-6.html> (Intel XE#1727 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/1727> / Intel XE#2705 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2705> / Intel
> >         XE#3113 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/3113> / Intel XE#4212 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/4212> / Intel XE#4345 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/4345> / Intel
> >         XE#4522 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/4522>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-pw-150255v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-
> >         tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html>
> >   *
> > 
> >     igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/
> >         igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-
> >         varying-size.html> (Intel XE#2291 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) -> PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
> >         bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-
> >         varying-size.html> +2 other tests pass
> >   *
> > 
> >     igt@kms_flip@2x-flip-vs-dpms-on-nop:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/
> >         igt@kms_flip@2x-flip-vs-dpms-on-nop.html> (Intel XE#2316
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) ->
> >         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/
> >         shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-on-nop.html> +5 other
> >         tests pass
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbc-1p-rte:
> > 
> >       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
> >         igt@kms_frontbuffer_tracking@fbc-1p-rte.html> (Intel XE#4947
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) ->
> >         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/
> >         shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-rte.html> +2
> >         other tests pass
> >   *
> > 
> >     igt@kms_hdr@static-toggle:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/
> >         igt@kms_hdr@static-toggle.html> (Intel XE#1503 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1503>) -> PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
> >         bmg-2/igt@kms_hdr@static-toggle.html> +1 other test pass
> >   *
> > 
> >     igt@kms_setmode@invalid-clone-single-crtc-stealing:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/
> >         igt@kms_setmode@invalid-clone-single-crtc-stealing.html> (Intel
> >         XE#1435 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/1435>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-pw-150255v1/shard-bmg-2/igt@kms_setmode@invalid-clone-
> >         single-crtc-stealing.html>
> >   *
> > 
> >     igt@kms_vrr@negative-basic:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/
> >         igt@kms_vrr@negative-basic.html> (Intel XE#1499 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1499>) -> PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
> >         bmg-4/igt@kms_vrr@negative-basic.html>
> >   *
> > 
> >     {igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-
> >     drm_xe_engine_class_compute}:
> > 
> >       o shard-bmg: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/
> >         igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-
> >         drm_xe_engine_class_compute.html> (Intel XE#3970 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/3970>) -> PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
> >         bmg-5/igt@xe_compute_preempt@compute-preempt-many-vram-
> >         evict@engine-drm_xe_engine_class_compute.html> +1 other test pass
> >   *
> > 
> >     igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap-
> >     nomemset:
> > 
> >       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-7/
> >         igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-
> >         unmap-nomemset.html> -> PASS <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-bmg-4/
> >         igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-
> >         unmap-nomemset.html>
> >   *
> > 
> >     igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate:
> > 
> >       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-
> >         dg2-435/igt@xe_exec_threads@threads-mixed-fd-userptr-
> >         invalidate.html> -> PASS <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-dg2-435/
> >         igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate.html>
> >   *
> > 
> >     igt@xe_pm@s2idle-basic:
> > 
> >       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-
> >         adlp-3/igt@xe_pm@s2idle-basic.html> (Intel XE#2953 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2953> / Intel
> >         XE#4173 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/4173>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-pw-150255v1/shard-adlp-9/igt@xe_pm@s2idle-basic.html>
> >   *
> > 
> >     igt@xe_pm@s3-vm-bind-userptr:
> > 
> >       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/
> >         igt@xe_pm@s3-vm-bind-userptr.html> (Intel XE#569 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/569>) -> PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
> >         bmg-2/igt@xe_pm@s3-vm-bind-userptr.html>
> >   *
> > 
> >     igt@xe_vm@large-misaligned-binds-2147483648:
> > 
> >       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
> >         igt@xe_vm@large-misaligned-binds-2147483648.html> (Intel XE#4945
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945>) ->
> >         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/
> >         shard-adlp-6/igt@xe_vm@large-misaligned-binds-2147483648.html>
> >         +29 other tests pass
> > 
> > 
> >         Warnings
> > 
> >   *
> > 
> >     igt@core_hotunplug@hotrebind-lateclose:
> > 
> >       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
> >         igt@core_hotunplug@hotrebind-lateclose.html> (Intel XE#4963
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963>) ->
> >         DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
> >         pw-150255v1/shard-adlp-6/igt@core_hotunplug@hotrebind-
> >         lateclose.html> (Intel XE#2953 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/2953> / Intel XE#4173 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/4173>)
> >   *
> > 
> >     igt@kms_big_fb@4-tiled-32bpp-rotate-180:
> > 
> >       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
> >         igt@kms_big_fb@4-tiled-32bpp-rotate-180.html> (Intel XE#4947
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) ->
> >         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/
> >         shard-adlp-6/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html>
> >         (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/1124>)
> >   *
> > 
> >     igt@kms_big_fb@linear-32bpp-rotate-90:
> > 
> >       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
> >         igt@kms_big_fb@linear-32bpp-rotate-90.html> (Intel XE#4947
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) ->
> >         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/
> >         shard-adlp-6/igt@kms_big_fb@linear-32bpp-rotate-90.html> (Intel
> >         XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/316>) +1 other test skip
> >   *
> > 
> >     igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> > 
> >       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
> >         igt@kms_big_fb@yf-tiled-addfb-size-overflow.html> (Intel XE#4947
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) ->
> >         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/
> >         shard-adlp-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html>
> >         (Intel XE#610 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/610>)
> >   *
> > 
> >     igt@kms_bw@linear-tiling-4-displays-1920x1080p:
> > 
> >       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
> >         igt@kms_bw@linear-tiling-4-displays-1920x1080p.html> (Intel
> >         XE#4950 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/4950>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-pw-150255v1/shard-adlp-6/igt@kms_bw@linear-tiling-4-
> >         displays-1920x1080p.html> (Intel XE#367 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
> >   *
> > 
> >     igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
> > 
> >       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
> >         igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html> (Intel
> >         XE#4947 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/4947>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-pw-150255v1/shard-adlp-6/igt@kms_ccs@bad-rotation-90-y-
> >         tiled-gen12-rc-ccs-cc.html> (Intel XE#455 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +1
> >         other test skip
> >   *
> > 
> >     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
> > 
> >       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
> >         igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html> (Intel
> >         XE#4947 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/4947>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-pw-150255v1/shard-adlp-6/igt@kms_ccs@crc-sprite-planes-
> >         basic-4-tiled-bmg-ccs.html> (Intel XE#2907 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2907>) +1 other test
> >         skip
> >   *
> > 
> >     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> > 
> >       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-
> >         dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html>
> >         (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/1727> / Intel XE#2705 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/2705> / Intel XE#3113 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/3113> / Intel
> >         XE#4212 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/4212> / Intel XE#4345 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/4345> / Intel XE#4522 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/4522>) -> INCOMPLETE
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
> >         dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html>
> >         (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/1727> / Intel XE#3113 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/3113> / Intel XE#3124 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/3124> / Intel
> >         XE#4345 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345>)
> >   *
> > 
> >     igt@kms_cdclk@mode-transition:
> > 
> >       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
> >         igt@kms_cdclk@mode-transition.html> (Intel XE#4947 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
> >         adlp-6/igt@kms_cdclk@mode-transition.html> (Intel XE#4417
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417> /
> >         Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/455>)
> >   *
> > 
> >     igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
> > 
> >       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
> >         igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html> (Intel XE#4950
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950>) ->
> >         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/
> >         shard-adlp-6/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html>
> >         (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/373>)
> >       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
> >         igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html> (Intel XE#373
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) ->
> >         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/
> >         shard-dg2-436/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html>
> >         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/4208> / i915#2575 <https://gitlab.freedesktop.org/drm/
> >         i915/kernel/-/issues/2575>)
> >   *
> > 
> >     igt@kms_content_protection@atomic-dpms:
> > 
> >       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-7/
> >         igt@kms_content_protection@atomic-dpms.html> (Intel XE#1178
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) ->
> >         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/
> >         shard-bmg-6/igt@kms_content_protection@atomic-dpms.html> (Intel
> >         XE#2341 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>)
> >   *
> > 
> >     igt@kms_content_protection@srm:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/
> >         igt@kms_content_protection@srm.html> (Intel XE#2341 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2341>) -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
> >         bmg-2/igt@kms_content_protection@srm.html> (Intel XE#1178
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
> >   *
> > 
> >     igt@kms_fbcon_fbt@psr:
> > 
> >       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
> >         igt@kms_fbcon_fbt@psr.html> (Intel XE#4947 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
> >         adlp-6/igt@kms_fbcon_fbt@psr.html> (Intel XE#776 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/776>)
> >   *
> > 
> >     igt@kms_flip@2x-plain-flip-interruptible:
> > 
> >       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
> >         igt@kms_flip@2x-plain-flip-interruptible.html> (Intel XE#4950
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950>) ->
> >         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/
> >         shard-adlp-6/igt@kms_flip@2x-plain-flip-interruptible.html>
> >         (Intel XE#310 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/310>) +1 other test skip
> >   *
> > 
> >     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-
> >     upscaling:
> > 
> >       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
> >         igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-
> >         ytilegen12rcccs-upscaling.html> (Intel XE#2351 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel
> >         XE#4947 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/4947>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-pw-150255v1/shard-adlp-6/
> >         igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-
> >         ytilegen12rcccs-upscaling.html> (Intel XE#455 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
> >       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
> >         igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-
> >         ytilegen12rcccs-upscaling.html> (Intel XE#455 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
> >         dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-
> >         ytilegen12rcccs-upscaling.html> (Intel XE#2351 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel
> >         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
> >   *
> > 
> >     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
> > 
> >       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
> >         igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-
> >         downscaling.html> (Intel XE#4947 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
> >         adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-
> >         yftile-downscaling.html> (Intel XE#455 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +2 other tests
> >         skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:
> > 
> >       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
> >         igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-
> >         mmap-wc.html> (Intel XE#4947 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/4947>) -> SKIP <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/
> >         igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-
> >         mmap-wc.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/651>) +1 other test skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-5/
> >         igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html>
> >         (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/2311>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-pw-150255v1/shard-bmg-6/
> >         igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html>
> >         (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/2312>) +9 other tests skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/
> >         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-
> >         render.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-150255v1/shard-bmg-2/
> >         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-
> >         render.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/2311>) +11 other tests skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
> > 
> >       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
> >         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-
> >         render.html> (Intel XE#4947 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/4947>) -> SKIP <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-150255v1/shard-adlp-6/
> >         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-
> >         render.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/656>) +6 other tests skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
> > 
> >       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-
> >         dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-
> >         pgflip-blt.html> (Intel XE#4842 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/4842>) -> SKIP <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/
> >         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-
> >         blt.html> (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/
> >         kernel/issues/4208>)
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-5/
> >         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-
> >         mmap-wc.html> (Intel XE#4141 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/4141>) -> SKIP <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-6/
> >         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-
> >         mmap-wc.html> (Intel XE#2312 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/2312>) +3 other tests skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/
> >         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-
> >         mmap-wc.html> (Intel XE#2312 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/
> >         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-
> >         mmap-wc.html> (Intel XE#4141 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/4141>) +7 other tests skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:
> > 
> >       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
> >         igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-
> >         blt.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/
> >         kernel/issues/2351> / Intel XE#4947 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
> >         adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-
> >         shrfb-draw-blt.html> (Intel XE#651 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
> >       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
> >         igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-
> >         blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/
> >         kernel/issues/651>) -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-dg2-436/
> >         igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-
> >         blt.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/
> >         kernel/issues/2351> / Intel XE#4208 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:
> > 
> >       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
> >         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-
> >         onoff.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/2351> / Intel XE#4947 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
> >         adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-
> >         indfb-onoff.html> (Intel XE#656 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/656>) +1 other test skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:
> > 
> >       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
> >         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-
> >         mmap-wc.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/653>) -> SKIP <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-150255v1/shard-dg2-436/
> >         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-
> >         mmap-wc.html> (Intel XE#2351 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/2351> / Intel XE#4208 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
> > 
> >       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
> >         igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-
> >         blt.html> (Intel XE#4947 <https://gitlab.freedesktop.org/drm/xe/
> >         kernel/issues/4947>) -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-adlp-6/
> >         igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-
> >         blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/
> >         kernel/issues/653>) +2 other tests skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/
> >         igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-
> >         render.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-150255v1/shard-bmg-4/
> >         igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-
> >         render.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/2313>) +8 other tests skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
> > 
> >       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-5/
> >         igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-
> >         blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/
> >         kernel/issues/2313>) -> SKIP <https://intel-gfx-ci.01.org/tree/
> >         intel-xe/xe-pw-150255v1/shard-bmg-6/
> >         igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-
> >         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
> >         kernel/issues/2312>) +9 other tests skip
> >   *
> > 
> >     igt@kms_plane_scaling@intel-max-src-size:
> > 
> >       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
> >         igt@kms_plane_scaling@intel-max-src-size.html> (Intel XE#4950
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950>) ->
> >         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/
> >         shard-adlp-6/igt@kms_plane_scaling@intel-max-src-size.html>
> >         (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/455>) +1 other test skip
> >   *
> > 
> >     igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
> > 
> >       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
> >         igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html>
> >         (Intel XE#4947 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/4947>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-pw-150255v1/shard-adlp-6/igt@kms_psr2_sf@fbc-psr2-primary-
> >         plane-update-sf-dmg-area.html> (Intel XE#1489 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
> >   *
> > 
> >     igt@kms_psr@fbc-pr-primary-page-flip:
> > 
> >       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
> >         igt@kms_psr@fbc-pr-primary-page-flip.html> (Intel XE#4947
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) ->
> >         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/
> >         shard-adlp-6/igt@kms_psr@fbc-pr-primary-page-flip.html> (Intel
> >         XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/
> >         xe/kernel/issues/929>) +3 other tests skip
> >   *
> > 
> >     igt@kms_psr@psr-sprite-render:
> > 
> >       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
> >         igt@kms_psr@psr-sprite-render.html> (Intel XE#2850 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
> >         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/
> >         shard-dg2-436/igt@kms_psr@psr-sprite-render.html> (Intel XE#4208
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
> >   *
> > 
> >     igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
> > 
> >       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
> >         igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html> (Intel
> >         XE#4950 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/4950>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-pw-150255v1/shard-adlp-6/igt@kms_rotation_crc@primary-4-
> >         tiled-reflect-x-180.html> (Intel XE#1127 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
> >   *
> > 
> >     igt@xe_ccs@suspend-resume:
> > 
> >       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
> >         igt@xe_ccs@suspend-resume.html> (Intel XE#4945 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/4945>) -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
> >         adlp-6/igt@xe_ccs@suspend-resume.html> (Intel XE#455 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#488
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/488>)
> >   *
> > 
> >     igt@xe_eudebug@read-metadata:
> > 
> >       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
> >         igt@xe_eudebug@read-metadata.html> (Intel XE#4945 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/4945>) -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
> >         adlp-6/igt@xe_eudebug@read-metadata.html> (Intel XE#4837
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +1
> >         other test skip
> >   *
> > 
> >     igt@xe_evict@evict-large-cm:
> > 
> >       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
> >         igt@xe_evict@evict-large-cm.html> (Intel XE#4945 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/4945>) -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
> >         adlp-6/igt@xe_evict@evict-large-cm.html> (Intel XE#261 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/261> / Intel XE#688
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>)
> >   *
> > 
> >     igt@xe_exec_fault_mode@many-bindexecqueue-rebind:
> > 
> >       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
> >         igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html> (Intel
> >         XE#4945 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/4945>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-pw-150255v1/shard-adlp-6/igt@xe_exec_fault_mode@many-
> >         bindexecqueue-rebind.html> (Intel XE#288 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +3 other tests
> >         skip
> >       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
> >         igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html> (Intel
> >         XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/288>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-pw-150255v1/shard-dg2-436/igt@xe_exec_fault_mode@many-
> >         bindexecqueue-rebind.html> (Intel XE#4208 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
> >   *
> > 
> >     igt@xe_exec_system_allocator@processes-evict-malloc:
> > 
> >       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
> >         igt@xe_exec_system_allocator@processes-evict-malloc.html> (Intel
> >         XE#4945 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/4945>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-pw-150255v1/shard-adlp-6/
> >         igt@xe_exec_system_allocator@processes-evict-malloc.html> (Intel
> >         XE#4915 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/4915>) +60 other tests skip
> >   *
> > 
> >     igt@xe_exec_system_allocator@threads-many-large-mmap-mlock:
> > 
> >       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
> >         igt@xe_exec_system_allocator@threads-many-large-mmap-mlock.html>
> >         (Intel XE#4915 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/4915>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-pw-150255v1/shard-dg2-436/
> >         igt@xe_exec_system_allocator@threads-many-large-mmap-mlock.html>
> >         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/4208>) +14 other tests skip
> >   *
> > 
> >     igt@xe_oa@non-privileged-map-oa-buffer:
> > 
> >       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
> >         igt@xe_oa@non-privileged-map-oa-buffer.html> (Intel XE#4945
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945>) ->
> >         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/
> >         shard-adlp-6/igt@xe_oa@non-privileged-map-oa-buffer.html> (Intel
> >         XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/2541> / Intel XE#3573 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/3573>)
> >   *
> > 
> >     igt@xe_oa@syncs-ufence-wait-cfg:
> > 
> >       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
> >         igt@xe_oa@syncs-ufence-wait-cfg.html> (Intel XE#2541 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2541> / Intel
> >         XE#3573 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/3573> / Intel XE#4501 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/4501>) -> SKIP <https://intel-gfx-
> >         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/
> >         igt@xe_oa@syncs-ufence-wait-cfg.html> (Intel XE#4208 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
> >       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
> >         igt@xe_oa@syncs-ufence-wait-cfg.html> (Intel XE#4945 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/4945>) -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
> >         adlp-6/igt@xe_oa@syncs-ufence-wait-cfg.html> (Intel XE#2541
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541> /
> >         Intel XE#3573 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/3573> / Intel XE#4501 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/4501>)
> >   *
> > 
> >     igt@xe_pm@d3cold-mmap-vram:
> > 
> >       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
> >         igt@xe_pm@d3cold-mmap-vram.html> (Intel XE#2284 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Intel XE#366
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) ->
> >         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/
> >         shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html> (Intel XE#4208
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
> >       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
> >         igt@xe_pm@d3cold-mmap-vram.html> (Intel XE#4945 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/4945>) -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
> >         adlp-6/igt@xe_pm@d3cold-mmap-vram.html> (Intel XE#2284 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Intel XE#366
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
> >   *
> > 
> >     igt@xe_pmu@engine-activity-all-load-idle:
> > 
> >       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-
> >         adlp-9/igt@xe_pmu@engine-activity-all-load-idle.html> (Intel
> >         XE#5214 <https://gitlab.freedesktop.org/drm/xe/kernel/
> >         issues/5214>) -> ABORT <https://intel-gfx-ci.01.org/tree/intel-
> >         xe/xe-pw-150255v1/shard-adlp-4/igt@xe_pmu@engine-activity-all-
> >         load-idle.html> (Intel XE#5214 <https://gitlab.freedesktop.org/
> >         drm/xe/kernel/issues/5214>) +4 other tests abort
> >   *
> > 
> >     igt@xe_pmu@engine-activity-load:
> > 
> >       o shard-adlp: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
> >         igt@xe_pmu@engine-activity-load.html> (Intel XE#5214 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/5214>) -> DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
> >         adlp-2/igt@xe_pmu@engine-activity-load.html> (Intel XE#5214
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5214>) +1
> >         other test dmesg-warn
> >   *
> > 
> >     igt@xe_pmu@gt-frequency:
> > 
> >       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-435/
> >         igt@xe_pmu@gt-frequency.html> (Intel XE#4835 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/4835>) -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
> >         dg2-435/igt@xe_pmu@gt-frequency.html> (Intel XE#4819 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/4819>) +1 other test
> >         fail
> >   *
> > 
> >     igt@xe_pxp@display-pxp-fb:
> > 
> >       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
> >         igt@xe_pxp@display-pxp-fb.html> (Intel XE#4945 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/4945>) -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
> >         adlp-6/igt@xe_pxp@display-pxp-fb.html> (Intel XE#4733 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/4733>)
> >   *
> > 
> >     igt@xe_query@multigpu-query-gt-list:
> > 
> >       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
> >         igt@xe_query@multigpu-query-gt-list.html> (Intel XE#4945
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945>) ->
> >         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/
> >         shard-adlp-6/igt@xe_query@multigpu-query-gt-list.html> (Intel
> >         XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
> >       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
> >         igt@xe_query@multigpu-query-gt-list.html> (Intel XE#944
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) ->
> >         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/
> >         shard-dg2-436/igt@xe_query@multigpu-query-gt-list.html> (Intel
> >         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
> >   *
> > 
> >     igt@xe_spin_batch@spin-mem-copy:
> > 
> >       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
> >         igt@xe_spin_batch@spin-mem-copy.html> (Intel XE#4945 <https://
> >         gitlab.freedesktop.org/drm/xe/kernel/issues/4945>) -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
> >         adlp-6/igt@xe_spin_batch@spin-mem-copy.html> (Intel XE#4821
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821>)
> > 
> > {name}: This element is suppressed. This means it is ignored when computing
> > the status of the difference (SUCCESS, WARNING, or FAILURE).
> > 
> > 
> >     Build changes
> > 
> >   * Linux: xe-3252-4d016d6e602638e0ebc3895331224e057508c07a -> xe-
> >     pw-150255v1
> > 
> > IGT_8411: d5b5d2bb4f8795a98ea58376a128b74f654b7ec1 @ https://
> > gitlab.freedesktop.org/drm/igt-gpu-tools.git
> > xe-3252-4d016d6e602638e0ebc3895331224e057508c07a:
> > 4d016d6e602638e0ebc3895331224e057508c07a
> > xe-pw-150255v1: 150255v1
> > 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
