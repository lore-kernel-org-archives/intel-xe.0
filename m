Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935E2C02192
	for <intel-xe@archiver.kernel.org>; Mon,  3 Feb 2025 21:46:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560A310E584;
	Mon,  3 Feb 2025 21:46:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RNouMEEa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F053910E581
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Feb 2025 21:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738619172; x=1770155172;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LNRdE6GCzkL+Gnp0pYpZZiBm1zitt959n6mJRHEdxHI=;
 b=RNouMEEaVj25fMr9VL/KfzaAfFZY7jLOjty3TxrmjMjFuB1xtnwKqxKc
 sv/yJNO/Smv1jIS5AeVkPY4DfcDOkNkBcyEhopZ8fQhljGZAUKFMdWWGV
 SxzYSoozNWKtMp558Ziaevhug/9cWble2MP9n7+ZXhM+/clPjDk0GKaS/
 2DuL4rrc8P2fyrMa8NqnxcN68hMNQEdoUPpTSSsNuGsChW8Nk+twpU49F
 cqsuj6ppIseso9sQxNnpTFEAk4ebgC3n98O/Hdo+7iFAl8TbM5Px3/zjC
 6ci95Cjus8wxx6Cv1BLCP7kn7NZa9PDtuFRFe1+o94ixKesBJyxyfSLrg A==;
X-CSE-ConnectionGUID: VtjuFREgT/qVj4iMac8w0w==
X-CSE-MsgGUID: 2MCIggfiSXi9tnyc+ASRXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39033736"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; d="scan'208";a="39033736"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 13:46:11 -0800
X-CSE-ConnectionGUID: idknJDorQIO1zo8ZhF4C8Q==
X-CSE-MsgGUID: dey7Hs3mT1CoobbQ/HaR6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; d="scan'208";a="110356130"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Feb 2025 13:46:11 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Feb 2025 13:46:10 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 3 Feb 2025 13:46:10 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Feb 2025 13:46:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A/WmclMeWi8JsOqsQvsO6dobez0XpKVqnyW3Ua7UmE0VP7S3drXnvgfZyfPyftoQKmVxiaeBgUa8sHZbGH8+t18nSNX5PAxszCYcbGBkcsCUF7tWy/+ROtgEsrOb0f+k7FDuQFZVcjzt8u4alf7esW7Jqt2gkt+kG2jzTDiQ4KiebsLTCjGtnjV1kAoutzNR/Oq8bGsokgODejf6KJl7qa34rzHMf7k1DWTd88k4XNHGa+oum8oVwFcdxyfNlG48/K+pmIJmKt2P8I5WkiWqwlA0IHGc4fKPiadaE6sBVSP3nuJElM9ZqWz8D/7XozQ1nJQ+O9zDOtL/N1PfPmpuzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TPBqeYU5RC5DLmEtOt7f2/JRIMStr/J0b0bNOJ6egI0=;
 b=RJw1lMHvwGxjm25H634sJY6I4Xb4LZvy5tLPjuRJE5PvhYczVpuJ2FtM7sEaRtMnl6k48f2UvZQiSxjEsTD/AHEGmF8fRVsbx5Mz6AcRpy0xJGM7n0Pa1NDNbV6t2IsoPE9joCh1aWWpxkO6wav/nZTmkJzt3GG1eRkOSUeWEvdxeo2WayKw2W7lWoaGsOhmbFgcPsnC1VeET/KkqqfsKh/4XIIzIFxtmBezxfGcij7QPKGTauHfM9RxpOHDPG6uIuJmXZJlzzPG3j7PU/n8qypaVgfIHNjEESLg1czenZVNV5uUukN1UyjN9LqLIZdZTugeIlLnoxAzQxZvWtx1Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by DS0PR11MB7736.namprd11.prod.outlook.com (2603:10b6:8:f1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 21:46:07 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 21:46:07 +0000
Date: Mon, 3 Feb 2025 16:46:03 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>, Maarten Lankhorst
 <dev@lankhorst.se>
Subject: Re: [PATCH 6/7] drm/xe: Cleanup extra calls to
 xe_hw_fence_irq_finish()
Message-ID: <Z6E5G38KtXc7UJTC@intel.com>
References: <20250131223140.4144292-1-lucas.demarchi@intel.com>
 <20250131223140.4144292-7-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250131223140.4144292-7-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4P222CA0020.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::25) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|DS0PR11MB7736:EE_
X-MS-Office365-Filtering-Correlation-Id: 13cf2e4d-67a4-4712-80c9-08dd449c2a16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1B20RFk1PxdBoex2gWbVju0TGT/D+P4pXDuPrTUR0huD16q2LTxApUzjw5Cw?=
 =?us-ascii?Q?c+z/RnK1cwxMBnKyDn35CtKa07ChO2tjqGArLDjI2C+lK0/ciy3e2Qj3HhtW?=
 =?us-ascii?Q?thfRXnFD5ZixTTD+ybo5W2avstvbh/VbfR9QsZVLHyTZGBFPlQgOWJFpsakH?=
 =?us-ascii?Q?t16vK7BMdyN9Fob3EjjAbLwSjxWvyN1hfbB+lba+2cB2St34eJDft1BZn8e1?=
 =?us-ascii?Q?stSFR67C8kAHCCd2wfA5iRuEByhakXJOKtQpOPdqS60TNPx96cbQT445/waV?=
 =?us-ascii?Q?WIvyteLr6AaI66PvHPU65w4BlWWunrj9omRnvacVf1fZ+8ZI/sj+TTtWsMSg?=
 =?us-ascii?Q?ZqorbhjJtFuHrpYJQm4TaVKVi390CrJ7afew8ULQ3ec8DX859eJ9yU8mjDEn?=
 =?us-ascii?Q?QLE0bpt6wY8h0OfjEFhgO9I3mtkpL1ZHy7G4r0vpqX4HDJVXbmiW8ABMGm1x?=
 =?us-ascii?Q?caLvhumODpGVQFETSWHNmlaQU1wtFzznag0iGtcoLspyy8PqyHbb/9bQnBbo?=
 =?us-ascii?Q?DxzPjqd1VfWq0lNg6njpo4LFxl8AYIv2bGQ8W/o8Y9wMtdpnjhIQBYaGPTWx?=
 =?us-ascii?Q?26nQr6APSNbogy1WVFRyEtSs2h5QeRH6ZmrJfPJhxiwKTXgxyMi/1jrwjQ66?=
 =?us-ascii?Q?ZtRURcKfTBdiifK2u6JlIxhOT01oS7rwLyaCkMbMH1DglCJO35rVjatIrq8l?=
 =?us-ascii?Q?2WAEeEa2wf08fLZf3b35J8eIxiH4Y44XAQT53IPW7Q9s5haw2DWq2YS/kOWs?=
 =?us-ascii?Q?aoVKlS/9v7CwPP9uvoUWtcbgbdyHpaQYFMg7g9LyIH2FJveM9hpxjDJ2ICK3?=
 =?us-ascii?Q?mmotfm3U/ZBy4oH07CYJLn1J3nBegtu9F0N7OAj08jLnxijwD4nN+ZPfedAP?=
 =?us-ascii?Q?6alxGsXRYMFPanyWAUcWfCRgVJG2TlB2PV6Jqb/U6wN4hoSJeRIiWq3N8+Tl?=
 =?us-ascii?Q?QgX0ATkYYQQHdZo/7oY32AyOAzP1Zot7U+qJd84+6PCj8RdyY9eHMq7WkIYt?=
 =?us-ascii?Q?xGyRc8rcJOigQ20R9tKc3jHiDaKssuBHkA2oIznoA/xLQrWcYbUQali9plM6?=
 =?us-ascii?Q?f0fWuPkd4usSAVgib7Q28NjWCOR/Ee/gE7fhTIlsQpykUZWf4WG69j7ZM5Xk?=
 =?us-ascii?Q?cc/b6S/ZrWaS2rLYCgIA7xnkVxyCucXOPfGkia182aaPbrB623MDB44XBvyU?=
 =?us-ascii?Q?BhsGu3xFJQNel8bFwD730ZaDRmT3xxSCEUcj9G7jBXMGtEg8/VDQSh5oX7Ql?=
 =?us-ascii?Q?2TzpKMQx5wIjmmYLio8/AQRqk+cVnFMHOfdDWVn1nYkeR3WOFlt1kc47iGvm?=
 =?us-ascii?Q?Ko6DH1V0DiVJOQnLTYXN9XzVwCezdRRQN5GbXcOygw1wq17PobnEAvr0joPc?=
 =?us-ascii?Q?92cMdZd6fz78xwRec5wp7krhBhru?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kQ7r9ao5qtylvAC2aoMff91qVxxzlwzOM53wPhvleJtH60XgfR1MA88KEmrw?=
 =?us-ascii?Q?M7mvUIy5ZfF3w8wkXqvk/2HzMROKeP/cFI+nILcnSZfrbuOwKqaN36CaQxG0?=
 =?us-ascii?Q?aUpZMJnnMDMG5cLoW/t2LmxDbQ+NK2RqpfZEAaxNaa45rVQek22ejhaHIEcA?=
 =?us-ascii?Q?ZTPhEpYV8pzmay0zyTxNNHP/L6Oe3oO4GbfO4jwfFJjQpDwDkrbTR2H5plLL?=
 =?us-ascii?Q?bCYh6hToPl6P3mpCnvDSsZWEj4ZmywznaPC89yVyW08UdeAma/nzeIyGF2iq?=
 =?us-ascii?Q?j0P/XVsKs4fp3zPcWG7Cc4T+YFVzsc5ThrGaBdB2XqG2+tLg2i502m5RYImh?=
 =?us-ascii?Q?zexkil12fUgfFLWJZCgAeo0bkMb6F9RZhwJDXlbeDOxOV3u34qaOWmF6yZiy?=
 =?us-ascii?Q?EhFrLZWp48Y8g+KJPvQJj3rZAd9kO8/J2kzocdgCwB/+W6yAFlh6ONXCozg1?=
 =?us-ascii?Q?lPPRR7ZA6CYpzOE0cI5PA7dNI5xfyZ6oCTXU+MQZ1d5CtYQpUl3hGAIBiYMh?=
 =?us-ascii?Q?gNI512J4IB27iQ82S1ueWlO8pHbs2AEpB4RogWeOzpY55NqXgaLNP28UoqBc?=
 =?us-ascii?Q?yNWrRhJU71wh9cUxtj62rF6FNEtabhVX4bxSl9XFtWAuvPKc3/kFOOxWzgkF?=
 =?us-ascii?Q?fV86wXfHfo4xDxDLAyLLBDR1AwPuc4d+Z1yRj3AyJmDjMETHuP8oyqFm3n9o?=
 =?us-ascii?Q?7FP81HH/A8aWxTdYOildVZaURWRUjgQiREeyP5E8mpyLZFQpn9ucm3sbm1B0?=
 =?us-ascii?Q?vkJqwMxVqR0ceq3vFeYgNoofjNGXoJvD7ZSpLdMEMU9B3hSTwY3H8A+alWSu?=
 =?us-ascii?Q?rMVZRzKA7GuoMjIeABmsw0dmXyzxOgwcMRt3EMD07gJMZLh+kdMNNXS6qUjB?=
 =?us-ascii?Q?odMKpM3Wu28ZAVaBp2G1aJWEuwZcsPWhicvA1g2sv91zy2iq1JXhlHPN5QXX?=
 =?us-ascii?Q?2YMzbHpmPvAZBowGVZslgM0oSThBV9h1LBI7vKGvmwLamxSFg6Q8lf0fuICr?=
 =?us-ascii?Q?6g+myfp3fNzgb5YzgOHaYr3kX22F9AIo0H3YfjI3sGiC5oWaAwEU3UL4SN8x?=
 =?us-ascii?Q?6bx/nEgF4+xNefNGfkWmIWGX20c9OIAM5MFoWLU7MOWtlkU75vFfuD1umI4g?=
 =?us-ascii?Q?50366Nprik5gy+0W7VHEgalc++SuRpoE+Wa2paBgqaw1uhl/RtNISqye4YBp?=
 =?us-ascii?Q?mkqWUpTNKGKhBIPBPxUPsNMNl/u3zw0z6JcFTGtpZwIC8hPPJ6gTNwRPn6Mn?=
 =?us-ascii?Q?sw26FunsJJpDztvEH7QvLba/lsApsaWUoWmIXunFygaW3JKj+KPI2BVT0u4r?=
 =?us-ascii?Q?4jizAXOCGTUd06L4jTEvGjTKGXdGc7qc19izNU1GeURwp6KggvB7XhvKp+HL?=
 =?us-ascii?Q?vfPEy1ZC9OvKWtclrhyJEoXXj8tCwZoBtVdb/m7TJPa95P5C7lbc4zgl2gh7?=
 =?us-ascii?Q?dPBJUYJnvsNiJREGXUj2/pcvC2VEVzlYrhn4+HuDlit7TpWNvcmmrSNIf0nc?=
 =?us-ascii?Q?wImBo3HM6/IbF6UMhbmIIjPgFNCnrEsqInseCkP+AxHoHoLvQB3djj1bQ11E?=
 =?us-ascii?Q?4hjSmOHd0M9n545YkIcvKu48gi5OC2o+Loz6X29gW9KlsAfShL5vQSB42ggq?=
 =?us-ascii?Q?Mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13cf2e4d-67a4-4712-80c9-08dd449c2a16
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 21:46:07.0263 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QvTR201HUdl4pTv/oT4G5e3mPV8hF0ZItJVg0LiwWORJ5LhET7Nmska918FwpH84fyhadhcajIFQym+xDS+Kow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7736
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

On Fri, Jan 31, 2025 at 02:31:39PM -0800, Lucas De Marchi wrote:
> Now that xe_gt_remove is handled entirely by xe_gt, it's clear there are
> some extra calls to xe_hw_fence_irq_finish() that aren't necessary.
> Neither all_fw_domain_init() or gt_fw_domain_init() need to do that
> since it's handled by the caller on any error.

I remember having bumped into this code a while ago and having
the feeling it was duplicated...  but at least it all makes sense now...


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 48f6fd8c14b65..b05a0f27cc88c 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -388,13 +388,11 @@ static void dump_pat_on_error(struct xe_gt *gt)
>  static int gt_fw_domain_init(struct xe_gt *gt)
>  {
>  	unsigned int fw_ref;
> -	int err, i;
> +	int err;
>  
>  	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (!fw_ref) {
> -		err = -ETIMEDOUT;
> -		goto err_hw_fence_irq;
> -	}
> +	if (!fw_ref)
> +		return -ETIMEDOUT;
>  
>  	if (!xe_gt_is_media_type(gt)) {
>  		err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
> @@ -435,9 +433,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>  err_force_wake:
>  	dump_pat_on_error(gt);
>  	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -err_hw_fence_irq:
> -	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
> -		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
>  
>  	return err;
>  }
> @@ -445,7 +440,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>  static int all_fw_domain_init(struct xe_gt *gt)
>  {
>  	unsigned int fw_ref;
> -	int err, i;
> +	int err;
>  
>  	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
> @@ -523,8 +518,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
>  
>  err_force_wake:
>  	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
> -		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
>  
>  	return err;
>  }
> -- 
> 2.48.0
> 
