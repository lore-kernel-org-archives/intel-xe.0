Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E54C531F8
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 16:42:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C63CA10F179;
	Thu, 23 Jul 2026 16:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FH+fe9xZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9091A10F179
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 16:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784824941; x=1816360941;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gEkMbhLmgYh2vw/DQCqs334OwrxaBUC+IwsOKUt/4lE=;
 b=FH+fe9xZMUutU/CH+T/ea+COXVBPTMbdpEw/Nt3WEjMChTUIQLZqjMy6
 ag68KyB9qRN1bD22Geb+amW8omFjBkBdVGhrDyqFnzXvm5I4/2jlazkCY
 UAD+Io7w43x/S5ijBNmStkoZTrR91MVeXZbwws64RbTqr5euSktq9rl25
 kgFLZ3GaJ7/NSbtq14XHlQkR140aNT27F7R8YraYNHhm/6VPZ+SZeWFLP
 8kZLRqndm+ba6CAqPaqW1MVSYGi4LZS3aRzuXOEgIljXaXQpXNXy2I7na
 aPK14cTFr++fRhk+mqrsPxsiy9J+4JdUHaQK4SvpPlHceyZne8P67/2RQ A==;
X-CSE-ConnectionGUID: 3Y4U+jqOTyuMzHY57uMaUQ==
X-CSE-MsgGUID: oSz7d8S8Q6CW7SRx1G7ORQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85680584"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="85680584"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:42:21 -0700
X-CSE-ConnectionGUID: pHA92nPiT/S4dwC+AYHVKg==
X-CSE-MsgGUID: 2ISunSJ/QeGUBKhMNGktbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="255092091"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:42:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 09:42:20 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 23 Jul 2026 09:42:20 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.11)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 09:42:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RPOmtxLF2k80uI0ZhFU8a3yDDIew3xdEUDQlpt7w3nhu53+SwwXZnqzz23OLcXb9TWvWPdjhYfh5Txhxgkzqrc64OG99ymfpRf5OdHfWt3/HN7n5kHvV96/l7bXIDPjtBWmIy1/d9dNi20kGD9wXsftg/C6sA1qzR6OcqbvGmp2445+XkFlubGzTQH5DmVHC3qtwytwylvBOr9lXNk+bdsuMfK180AOeSypFeCIaEewXtq9gepyClVPzQXlz28W9k1vxs3y7dw21WdRrwroSGjaRHoWCtceRux/rrUeQH5fhvYjHwIpXEt7xA0Lnm7DybOX5URjSjz9fQWcjV9MgWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ysxcVyhHLSuM3DJnQfzBrds6jW9V3DamxVDvTHySTDE=;
 b=PlZLQ2652EcI95esgKF54JC6S5Lb8esFsl+vY6AZqUqNhkJS66a35LqCG0bCzmA1sLdbVL8Uspe6ooY6q1TqDw4zD/AQyyoCUoYXAM/OWNRsh+VyPwqpkUpEarbO+HFAL4wLD5T0qtLCX4DzMjyFAqaK5xPm5RtwJskRQ6dyZvVrueRTlSFJFGNjHWXsRW9NRzJiJfwPd2/eknt0v4uNW+qhzMA3ka8SjVwEQmCdEbdIUn1beYHVLjxr5UhgFdQzaC/BulBAhcVSmcj1pMbN0mA802KYvUNVZX0DVCUqK3buEXDdYtmDTrDZlCwav1tTjYtxI38LHz/9BhAeAj3HOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by PH0PR11MB4775.namprd11.prod.outlook.com (2603:10b6:510:34::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 16:42:17 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 16:42:17 +0000
Date: Thu, 23 Jul 2026 12:42:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
CC: <umesh.nerlige.ramappa@intel.com>, <matthew.brost@intel.com>,
 <kamil.konieczny@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 3/3] drm/xe/lrc: Fix ABA race on engine migration in
 context timestamp read
Message-ID: <amJEZXEYtG2gVVS2@intel.com>
References: <20260723092751.250613-5-gajendra.uttamchand@intel.com>
 <20260723092751.250613-8-gajendra.uttamchand@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260723092751.250613-8-gajendra.uttamchand@intel.com>
X-ClientProxiedBy: PH7P221CA0058.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::28) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|PH0PR11MB4775:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b756f55-08bd-4358-6a9d-08dee8d95b69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|11063799006|5023799004|4143699003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: LVwfwteia2mv09yqNgxVsz9gcWgyVMyuJxhVm5a485hQ4WwE/bPsDgQWKtE3kTlLUQH3DuuEKflKf/CxiAyfut07JVk0HrC/W+reO6BQdyF9LLGnOpaVr496/uDCIz7z5+Nf96+R4qblisG3Zb11ZYxtJvwNuFAHw2ctmP4PEqxcLFyYt/OE1XsIqJ5STa+nY8yeYygnlnzJI/QmDwwhMg0l1vhsOWKjka/40adDUdlGx3kS3WsUEm+Q1kPw/HkEERc8OPkuOTm0SNPdTPogsPq/qGLOSvN84FBAgKd2WOQYv6momXk6ljbyDiuaN+zoU/j65carr0jIvM9yMXnWucvOhy9N3s+2CZKQTfY3NSRjYLyBtnUh3/2JWeilJ4ZE5DrYCZk5+hDN8SZENRvHUFRW/FnCkIWpr94MvyxZk/e07qgImZ55UBV7MzKxjMZDCLfCP4PbMDVYJKGCvYVAy6IxK5b1Y2BTclUn5SeoutVGJu89dDlSjgPpAnWBEZ1vF+rlyTG6fydcYP0iEjBu7qJKRpt0ESv+s3YyrFeNuAAUKUlz3BL+ME/mRZEB4/HdnHWDcVmoNv58og0zyyGC63SO2F5TYD8pqGPR55wRvICLfsYtfZem4OMJeYoc7FsDNEdUr+tHExILVyi45L0yeUYhz9j95B7+02CQg/kTQTQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(11063799006)(5023799004)(4143699003)(18002099003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m7vJr0KE4kTQFaIRpBHpFaUCvOx+hdQUNTgtyRmeR0euq8wb5/Gua8ObGjSq?=
 =?us-ascii?Q?4uEgl4LNAt18I5vHsj8zqmyzzxkx3ISR4d9dYp4Gofw/74wGX8sP8tEdr1sc?=
 =?us-ascii?Q?guID083dnC7B+PTdhSsaQqEyzjoJMjG6sVqO+0lFWY5k4rQP0ZpYRBv4uCV1?=
 =?us-ascii?Q?JDq4fJvveugLE+6vdiu//mhd22LSIF1HFvLcOakZ0jWHkloTjJ4PJSYvommr?=
 =?us-ascii?Q?PR5fiSh24F2og3gy9zOiJrxvWG8oThWiYeTSL19zvTO0Q3f6lrhf89VAI8A+?=
 =?us-ascii?Q?2vzl1XduRCjPaVMX8pSEP4GAAKVdIkIIqYLxAor9BtRxg0UMwTgmgCfWWNyZ?=
 =?us-ascii?Q?dhhqVCmCKp6kd4hRBPbiKZ/7sIvKCm2zkOboUajdmZKxxPJDqQOOSnDMTQi8?=
 =?us-ascii?Q?dbYj+e1VOBnOCswyC7iDA0fv3pN4bKn/vgkkfduPDy/uUeIRigoQMWd63kYE?=
 =?us-ascii?Q?vToH1PZtDADj8b2a6V32d/A4HnFuZx1WxtGTMxuZWhWL8dTQx6QKqCRagolP?=
 =?us-ascii?Q?n6OBsX+8xis1q3pfmYaZ3C05NBt9j7yGqBQpF1lfA9TgzFohHwCtCOd21FC8?=
 =?us-ascii?Q?y1j8FFg8f41sFlChVmX6GA8tFqpubt8dimjkPexFgJSlkZiJzVvQwLDwBO7z?=
 =?us-ascii?Q?FzCk/K02QoLXLIshyr7iWBePWeZVbfSX8scjb2BrenypdJdR13oyPcXZ0dGi?=
 =?us-ascii?Q?I1SCS6xh95fgV1JyMuEBKVK6B6xczO0DawMHym7eMHXdT7iTpGtDT5zZfRS0?=
 =?us-ascii?Q?+gsEjtYRGEldtged7VHzn4PjJIt8W8p4O/V7asi7rrjn9p1Y1hDVkLC1P4Uw?=
 =?us-ascii?Q?cHD0KnfbnLwIXIE4XDiocIuIl+zzXre+VbjED5s2oGveYXyCyD/YOVkiWe59?=
 =?us-ascii?Q?fRDIkcnAHoCT2uemdv/09EhUmlCXt04VzBllzkptEB4TAWiaAeovmzl+xkUs?=
 =?us-ascii?Q?NN8ui4utW+85+J9B6z0YrRUzxD4SxPrdnzKXIAdlxuzV3yQISOc0rntKMgTu?=
 =?us-ascii?Q?5ATcYBUriuyvH8poaxaGrw7NZ9AvCtLslHbcVxIIUrDeQG+SsAVb78m02d0w?=
 =?us-ascii?Q?dN5qSTNz3immxRmq3UFYJgDtrB4+xPcOWTZFTg0hAJPWYfV0QbHVYm3+qCIS?=
 =?us-ascii?Q?H6EqtZnWcHRVDgaJtHzVjB8Sj449B/HWOcJhaSh6rywGJaMUVs1pNNc4mKld?=
 =?us-ascii?Q?QpAkpIq8amgKNL3/Sv5yVoLmnrUR0BfLDlEkBdmdL0THwaymx7k1Q1oGedR/?=
 =?us-ascii?Q?9Ohny37R5CtjeaZZxEqG8boO6/53v63K9ZbtgD132EyXSp3WMmxOpdPJRUhr?=
 =?us-ascii?Q?wQRG082Y48/UhVtbCE/BEUfFHeMr/LmQd7mHfT1NyQHNCTOj6wg50NkU7Gb/?=
 =?us-ascii?Q?+gOswwraPb44mk9dsHEFNYVITVkknjFJK9a2QDQ8sUg0iFooN/zjbpXlxiz6?=
 =?us-ascii?Q?3S0pnKhYthNrSevuqeGYbmyyNctkTF+2EAOoDtmlF5jfeOkSoIyQc9przpp/?=
 =?us-ascii?Q?QB3V7XaqULqjSoHnLvbO/8PmBtWI+RaDPKZCqI5kw+tY/J0pENd2UW3+P1t2?=
 =?us-ascii?Q?IE/x2hBGmRKT89M4rpL+nnN1ELnvIxHzM9AlSKEN4O5raYctnWtl835ft5dm?=
 =?us-ascii?Q?YGM+3Ur8rJhTckKSsh99bh86mTbHxR9MftwR+KdFtsd55S6jOUuoMhelWG45?=
 =?us-ascii?Q?zASc2QYorRD4TSiH4S/L+ZCszCeKja+FXuRnkFWyShBHG90UAgckafeykR9f?=
 =?us-ascii?Q?+e4AHiAKeQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: OgatzQVcWXMQkZldVf9pEoMjYB9qdPJ5UEs+EEIRAW2rW2LsQnpsvLjDfnu2BPZoJ7lU/hJFfmOM1U+4oA5uh6438bT14FyPu90FQNpax4GUpLAoe8Rm8c6yEuLKtppgu3cCk8dnrI8IHEz9/xkTODr23lAff5EATUTx296NdcUrSS7UYqupLRsKMe1q7Q4y310K+PbOBPzrYwUSeSWyGPH1hCQ0ET9BEgQ1x0mOrE8HatbS1fbobyUhwJgqyYRucz5s4CFDHZjlp013QoDC1lytCDkrYvqPtog3TCoizk1/31RkeFqCcoVFhSDL5Vo6qbmQE6uMgnmBu1DeTtLPlw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b756f55-08bd-4358-6a9d-08dee8d95b69
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 16:42:17.4340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wAnmNWICPOs1aD+XOlsTaVa18gyxgE86e5FL9YjeaZUDgTPzaXn1Mv9BqdlZ60tJoMQeBw98OKeywtdhk1W3rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4775
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

On Thu, Jul 23, 2026 at 09:27:55AM +0000, Gajendra Uttamchand wrote:
> xe_lrc_context_timestamp() reads the engine id once via
> xe_lrc_engine_id(lrc) and uses it to fetch the live CTX_TIMESTAMP MMIO
> register, then re-checks the LRC-stored value to detect whether the
> context switched out while the MMIO read was in flight. That check
> only confirms the context is (still/again) active - it does not
> confirm it is active on the *same* engine the MMIO read targeted.
> 
> If the context is saved and restored onto a different engine between
> the initial engine id read and the final activity check, the
> CONTEXT_ACTIVE sentinel will be observed again (now for the new
> engine), and the stale MMIO value read from the old, now-unrelated
> engine is returned as if it were valid.
> 
> Pin the engine id used for the MMIO read and re-validate it against
> the current engine id after the final activity check. If the engine
> changed, retry the whole read (bounded by a small retry count) instead
> of trusting a timestamp sampled from an unrelated context, falling
> back to the last cached value if the context keeps migrating.
> 
> Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>

The excess of comments in your patches is a good indication that you
were helped by AI. There is nothing wrong with that. Just be sure
to respect the rules and be transparent on its usage:

Documentation/process/coding-assistants.rst

And please, remove the excess of the comments as well. The code should
be obvious and self explained.

> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 66 ++++++++++++++++++++++++++-----------
>  1 file changed, 46 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 1e910669e8d1..314de730ace6 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -2736,39 +2736,65 @@ static u64 xe_lrc_update_multi_queue_timestamp(struct xe_lrc *lrc, u64 *old_ts)
>  	return lrc->queue_timestamp;
>  }
> 
> +/*
> + * Between reading the engine id and re-checking that the context is
> + * still active below, the context may have been saved and restored
> + * onto a *different* engine, in which case the MMIO read in between
> + * targeted an unrelated context on the old engine.
> + * Bound the number of times we retry the full read sequence when a
> + * context migration between engines is detected. A small bound (3)
> + * prevents long loops; if we exhaust retries we fall back to the
> + * last cached `lrc->ctx_timestamp`.
> + */
> +#define CTX_TIMESTAMP_MAX_RETRIES 3
> +
>  static u64 xe_lrc_context_timestamp(struct xe_lrc *lrc)
>  {
>  	u64 reg_ts, new_ts = lrc->ctx_timestamp;
>  	u64 stored;
> +	u32 engine_id;
> +	int retries = CTX_TIMESTAMP_MAX_RETRIES;
> 
>  	/* CTX_TIMESTAMP mmio read is invalid on VF, so return the LRC value */
>  	if (IS_SRIOV_VF(lrc_to_xe(lrc)))
>  		return xe_lrc_ctx_timestamp(lrc);
> 
> -	/*
> -	 * Safely read CTX_TIMESTAMP: check the LRC-stored value before and
> -	 * after the MMIO read to avoid a TOCTOU where a context switch makes the
> -	 * MMIO value stale. If the LRC value is not `CONTEXT_ACTIVE` return it;
> -	 * otherwise accept the MMIO value only if the context remained active.
> -	 */
> +	do {
> +		/*
> +		 * Safely read CTX_TIMESTAMP: check the LRC-stored value before and
> +		 * after the MMIO read to avoid a TOCTOU where a context switch makes the
> +		 * MMIO value stale. If the LRC value is not `CONTEXT_ACTIVE` return it;
> +		 * otherwise accept the MMIO value only if the context remained active.
> +		 */
> 
> -	stored = xe_lrc_ctx_timestamp(lrc);
> -	if (stored != CONTEXT_ACTIVE)
> -		return stored;
> +		stored = xe_lrc_ctx_timestamp(lrc);
> +		if (stored != CONTEXT_ACTIVE)
> +			return stored;
> 
> -	/* Context is active: read the live timestamp from the engine's MMIO register. */
> -	if (!get_ctx_timestamp(lrc, xe_lrc_engine_id(lrc), &reg_ts))
> -		new_ts = reg_ts;
> +		/* Context is active: read the live timestamp from the engine's MMIO register. */
> +		engine_id = xe_lrc_engine_id(lrc);
> +		if (!get_ctx_timestamp(lrc, engine_id, &reg_ts))
> +			new_ts = reg_ts;
> 
> -	/* Re-check the LRC-stored timestamp: if the context switched out while
> -	 * reading MMIO the hardware saved the canonical timestamp into the LRC
> -	 * during context-save, so return that value instead of the MMIO read.
> -	 */
> -	stored = xe_lrc_ctx_timestamp(lrc);
> -	if (stored != CONTEXT_ACTIVE)
> -		return stored;
> +		/* Re-check the LRC-stored timestamp: if the context switched out while
> +		 * reading MMIO the hardware saved the canonical timestamp into the LRC
> +		 * during context-save, so return that value instead of the MMIO read.
> +		 */
> +		stored = xe_lrc_ctx_timestamp(lrc);
> +		if (stored != CONTEXT_ACTIVE)
> +			return stored;
> +
> +		/*
> +		 * Still active, but possibly on a different engine than the one
> +		 * we just read MMIO from (context switched out and back in
> +		 * elsewhere). Only trust new_ts if the engine id hasn't changed;
> +		 * otherwise retry the whole sequence against the current engine.
> +		 */
> +		if (xe_lrc_engine_id(lrc) == engine_id)
> +			return new_ts;
> +	} while (--retries);
> 
> -	return new_ts;
> +	return lrc->ctx_timestamp;
>  }
> 
>  static u64 xe_lrc_update_context_timestamp(struct xe_lrc *lrc, u64 *old_ts)
> --
> 2.43.0
> 
