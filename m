Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB38EC3064D
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 15:03:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B99610E901;
	Wed, 26 Jun 2024 15:03:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KUcxAHnr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711E010E901
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 15:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719414193; x=1750950193;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MDuCP+WIxWWFa4IKSYeDqbv9mj5hMURrw9p+nlsObhA=;
 b=KUcxAHnrbdFSshsAts6WxKM9YtfQr8R55kw+VqneNYppdRw8Q/TJrp+h
 lGI0AU0qISAsAsVbBNF18RAACGJgIZmu+vdmJNrJAZCt6KE9BQC/HZ6Hj
 tQRgRT5NbNOFwJFCbpwkujVVo+UsXVYi/Qs3aQbj85qw10iSJAnOcma+e
 uAa9mIrgMrZ67VG2IBuxF+8P+Tt4MxuHbu7zWVePG0pjqZKRjUzR0CMd8
 aNGB0grCzcuHTydZFjJnJqa0+AbgcHYWzV4Zs0YD3eUGWkECl7oZ+3LzO
 /1jyH6ltmNXeNfoUdt9Nw+Hnlt7jOzmIwkwbACbXw4Pn6/NaZLPHjNKJV w==;
X-CSE-ConnectionGUID: D5ILu07HR56Le1Gz0xEc8w==
X-CSE-MsgGUID: NGev2jz0QoyjNsf3qFJsow==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="27891972"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="27891972"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 08:03:13 -0700
X-CSE-ConnectionGUID: XdOp4dzNT0mZpXktP1ET7g==
X-CSE-MsgGUID: DAuvxd+xSJSAbFjoh36vdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="74800124"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jun 2024 08:03:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 08:03:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 26 Jun 2024 08:03:12 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Jun 2024 08:03:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZNIWMxck4SohJgV+SO/ONrPG5935qA9a1PzrkhyhWhHcSruAWpfo+aDYuT0oRmpzsz6KsH3cbScz7upQuFfjsJm9R3uKzxQRcs5mvCLA3sjJNW+brIF38QVYyq1SYeFcYX/W+B5bpnzXm2J3++R5ds0Dlyd4+gHurk5pxkRFYyC6P180LSkEaO/RgzDo9R6y679edGTlEhiypf7IqN3FCRwRWuFi9xmz1VOedEjqoeDKQgY3JBo1s1tnOZQhnSlmvGu4DXok5x6J2SGQn8kzAynOB2Kf2aMnCe60zWn8SKoZvX2PyJEJ9wKHMYVHR7GWeU2s72lrx1kQ6L/nsQKTXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T71DpiTccXamOcxNZv59+aA4WzyQKcoC/r3q+kFr6eA=;
 b=H9nrhcvUYeUnhV7HfOHExoUfPPrCy7/mLWbsvd9SFKJewzvtpIi/IsC5n/BjuHDoeOoUdOr4IOz4yFPrdIfisxgQrYrcufbtGbBxiUk8TGQ9DIq7PurpJkI578i4PO8gj21CAjolXwPuS0i8wJEyeyqM/GIuQrosKZ4j4oGZclpm1waS2J5Zix7cwz2yZDACiCjNt2R4oApTt3GR4m6DDY3enmIU/HpBKrwISYG9q2lF2rTarEv6yD2h65nbSAIUNAeD21ZTaGddDWXluygMgVbMKJXiLZ3GdoDNOsJQ8qhrkJP5l9nMwzmLrC8esdBM+HHINlvfT6L7QXDM/xEScQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB7681.namprd11.prod.outlook.com (2603:10b6:8:f0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.34; Wed, 26 Jun
 2024 15:03:09 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 15:03:08 +0000
Date: Wed, 26 Jun 2024 11:03:05 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dani Liberman <dliberman@habana.ai>
CC: <intel-xe@lists.freedesktop.org>, <illevi@habana.ai>
Subject: Re: [PATCH 1/8] drm/xe/irq: refactor irq flows to support also msix
Message-ID: <ZnwtqcykLb1E0wq3@intel.com>
References: <20240626103345.2801735-1-dliberman@habana.ai>
 <20240626103345.2801735-2-dliberman@habana.ai>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240626103345.2801735-2-dliberman@habana.ai>
X-ClientProxiedBy: SJ0PR05CA0189.namprd05.prod.outlook.com
 (2603:10b6:a03:330::14) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB7681:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fcd540f-726c-439e-dc40-08dc95f1168c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|376012|1800799022|366014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W+kwpMgcbGWFYquaXUmtljZREca2WVH8mvv9SHVvOAX9MGEuoyfXPQ1o0dhj?=
 =?us-ascii?Q?ttB1Lc61kkuDV1m7DGAA1iw8hCA2DHk/671vG7GaBYxTPQ0nRVyh2VFnm46N?=
 =?us-ascii?Q?isPhl4hxlrU6CeJJUh6Du3fDfpBzHKD/l9PIAiSeTJlCRBKdipKf1bOHVxt7?=
 =?us-ascii?Q?mPY149WBranatWJzlJSf+eswf6ccc4Y2Mk+eWeRevNGThHMc2WNN8/GyzbDw?=
 =?us-ascii?Q?RsZ9KTo8HbmBw9G6ijRN1cOuUD/MzgJkDkLGB5R8U9pnH6fc8JS/xf+4mTN4?=
 =?us-ascii?Q?pAmJnW1kqH/5ZNOcM3byA68YWAD09MTqbSplkHmLY27QT9STKaQW6GPTKtzZ?=
 =?us-ascii?Q?/cKTFZXxGI7aZrfmgp1JgcAUoqyg1o9tYUnXxoQ3B+b80PRJp6P++DlrOGc8?=
 =?us-ascii?Q?bX06O1UBNZTIRANlugZKvcqMHQmLWHRrwbdCOZG6FWDhos2wwboAURq/gGg4?=
 =?us-ascii?Q?9qw3CheYn6UeTsfoCCelRnI0NZZPFcfhlaNpcry1BEbinX0MLuayJOIc4Wn8?=
 =?us-ascii?Q?sRo6EPlkrX5D3trDYP7Cy9pV9/8w/FyA2qRSrlKgIew2vce1eNGmaWIWW4kw?=
 =?us-ascii?Q?UpVsdK0/07sdtFZ54Ico9HIBXo4V4ABdVw2hk3ee3xYtb4DPU3qWrehvsXLu?=
 =?us-ascii?Q?o1Ek6IDqbO0ihojg1zjxIqdDOvapPSVHVDaTcLm9fdYo0bPWSOrpwoR+5ccb?=
 =?us-ascii?Q?2XZq9bypvCmibnrCS846fedWzBxqKh7H22A0lyxZCECsekWxneDDVYPwuPH3?=
 =?us-ascii?Q?aVm+WBJZXwa4lNqYvDmn+5rUXVTw68828IXCE7dxfmGGWNMRiHql+NRislCe?=
 =?us-ascii?Q?4S1UntKgVO64akC5JuQgPCjE6Q/4feAjPADb3+q/PD+Kr+13xYtuMAqsgdaU?=
 =?us-ascii?Q?rmzUnCmMPysqSIw1iLRLDOaeqrQ4LoWIk8ZSJkydViqZcj8Nabnu3l5KEJRH?=
 =?us-ascii?Q?/rzvJHakxcEq6reuxbcaPdV6K8waNT5xdjCxUukmcmljSfnyVlBnZKK/FrB/?=
 =?us-ascii?Q?0x/MRDKBirn+mGidJmZZpJctXLg0DDlFIxSVrcFlzS40GcIF3XrIpzST6PUz?=
 =?us-ascii?Q?AdnJIZU/XcDjDYlRlXpL0m9yuOFFR3GVjj40Qa33nMw5naKGq8ZSObEGzaw/?=
 =?us-ascii?Q?dZoiKer1IGpi9CsZiow2QHULRjyK3/i+uFgk34kjvWbpDQvzHfArpRMNJcQi?=
 =?us-ascii?Q?yaVHToMLTegojuy4o1b0fWJF3ocfFNNO93yBPolkTJTmvdKRe1kW3Xe4KKY0?=
 =?us-ascii?Q?GRJVSvHBnUmcuRUJvYDDLpVZwbJb5Upg5qlgymPx0qTIi/ptE/Tr76JrJ1Cg?=
 =?us-ascii?Q?/L0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(376012)(1800799022)(366014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zrTLZ82529PVwTPR4f+RXVeqf5MDlnP5oUdGhtOtWF8Sxe4lkNdJIk2DtzS9?=
 =?us-ascii?Q?jeLhIpEV2/lORu8nO/8ScdFl+jDF6gGexuI7qO12Mm+5icWZ2wdz81wY+YJH?=
 =?us-ascii?Q?Z3xnf2gPJ5/f8dJjqDn96OIZOVU2JL0GckgMwgixwK2A6svUl/Q5goN+nqbq?=
 =?us-ascii?Q?czy3K3AEfNjj7yD6v1nRIJcESt6rXg/rc0vq8h7tTpppe7sxet1SbFFrFIdA?=
 =?us-ascii?Q?NJ51BdWFBZcetNrA4jvpl0CAM6N6ifcZ4pLhZyKhKF5CVxbfgDgSb83c+pff?=
 =?us-ascii?Q?rQ13xwhkt8wV1HK6KLQRD4s1NUxBEsTtr14WEZ9cDG2o84rYvxyrAOa6v7SZ?=
 =?us-ascii?Q?oTMb+Fj3yYvIIao67TLMosz5wLqslDs6RJBo/xC3E6ltncRwwRhv5AT2N9MC?=
 =?us-ascii?Q?0Ex30lJoxAdG7FRh6qXSxsL7KcvmAO3iAj9nU3rv34NNFsS6YoKF41WO5CIZ?=
 =?us-ascii?Q?+fJqVVbWlGr5NNi/ADwWsGBntYPyahNxURwX3AdAeS1MFN5rpNW7WdeRaf/e?=
 =?us-ascii?Q?cye959hq6us+1AcIbK8ciWOkAs0KR1wLzmwAibC4aPApnEE3kzZ5YM5ihGeg?=
 =?us-ascii?Q?voPROXsIhlVMZ3IxwjInIBpVJnbQutSGJtfUsd+oAhNQ92fv/jiYQdgXn8jQ?=
 =?us-ascii?Q?sXjXPFGFjQK+H/SxvKDw1l+g1n0LKQ6kD4vkL4uEGWjF/EiPCVRrdp0PA/dw?=
 =?us-ascii?Q?KrO6T6aFUEVnlyqRJhQxmTFRYktuaccUrCLpAWA1j+Tkps0H1f/pK+FrjLWk?=
 =?us-ascii?Q?OJemOiw8KKuHk8HRMMmd5RTa/v1VDg8RQ7MO2V0sayrysZHgkZiRBXCOtTPB?=
 =?us-ascii?Q?b7Ud95JRHJQBnZo7MZ9NFkLeN18d6QviTTb/htABJYZvC8gxgRB/G1g0EraL?=
 =?us-ascii?Q?ampQ3I0RFTd5+Pcoza3/uiMv4FOuSyalU4nM6vUH59dja5ZQhkL3qC0/w3LO?=
 =?us-ascii?Q?jC9D695KtmQ81lK37ZsEHQAiFsYC/cLsnRaFx/IzHpLg7HJ0h/Fa0BjpBdzl?=
 =?us-ascii?Q?ZGrxAJ4mNGn1vSyidsI21mtEzGWOu4jIQ6Olk+r9tz6dDWLfJEHEFCNqduHK?=
 =?us-ascii?Q?SdIRciHgFPi9JXrIvXYWNBxzpyrVDyQmnA4UeY8/eKvdaOg7uJishjedlFZD?=
 =?us-ascii?Q?YyhKF+z/OE190xm1mC4hr+B6Fl8J+5pdTTlaMXF6iufSGAuKFupgcKlE4yGH?=
 =?us-ascii?Q?JtHKyvMKkX6ctXInZ0ibx0UGoShQc4z64IxIeH10c8dpe9KpST3fuOsb9OIl?=
 =?us-ascii?Q?mXo37wMY0lk0yfDTaB6BVLexvzjRjzOjLrlMgrarTOqrvqhM8nZHc4h1dODg?=
 =?us-ascii?Q?NA2mdQAOK60qgpjX7DQWpXLicwdRxKk9IkdMfP95hxW+qrANv6xw1rQxl3uR?=
 =?us-ascii?Q?HFeUNe/e1eBUPICFZkDXBb+d9znKpXRkhsBYXvPuOz0vO499gzRhIcx3Iyjm?=
 =?us-ascii?Q?WH2GEVBfG00/RFekCajlLhlQSzfLEGfX1EbeVCtMcHDrmq/59OLQks1VWb/Y?=
 =?us-ascii?Q?Y6+EuYzSZV7YENCK+YIv2rO2A7RgGgVYfg8g+6JLnUPIfKRTaZnz0g86FTID?=
 =?us-ascii?Q?T418JITilEQosFoKl4WW2gnXGXi659x0qaZC5RRn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fcd540f-726c-439e-dc40-08dc95f1168c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 15:03:08.8369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sj0IhRHfd70ZbPCbQYOUzAk1OYZOKJfIa3ZmA3dESRbor921Gx/2UlEAYSnPDodVx0G/32DB+wEnoXLb8aKy8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7681
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

On Wed, Jun 26, 2024 at 01:33:38PM +0300, Dani Liberman wrote:
> When enabling MSIX, there is no need for HW to aggregate interrupts.
> Added a separate MSIX flow that skips unnecessary code in irq init,
> reset, and fini.
> 
> Signed-off-by: Dani Liberman <dliberman@habana.ai>

just a heads up that I just pushed this patch:
https://patchwork.freedesktop.org/patch/597392/

so I believe you might need to rebase.

Cc: Ilia Levi <illevi@habana.ai>

> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  2 +
>  drivers/gpu/drm/xe/xe_irq.c          | 99 +++++++++++++++++++++-------
>  2 files changed, 77 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index c37be471d11c..09ce7ba1b4ed 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -306,6 +306,8 @@ struct xe_device {
>  
>  		/** @irq.enabled: interrupts enabled on this device */
>  		bool enabled;
> +		/** @irq.msix_enabled: msix interrupts enabled on this device */
> +		bool msix_enabled;
>  	} irq;
>  
>  	/** @ttm: ttm device */
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index ab3d5b7a1e8c..663a86edecc0 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -666,28 +666,46 @@ static irq_handler_t xe_irq_handler(struct xe_device *xe)
>  		return xelp_irq_handler;
>  }
>  
> -static void irq_uninstall(void *arg)
> +static void xe_irq_msi_free(struct xe_device *xe)
>  {
> -	struct xe_device *xe = arg;
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	int irq;
>  
> +	irq = pci_irq_vector(pdev, 0);
> +	free_irq(irq, xe);
> +}
> +
> +static void xe_irq_msix_free(struct xe_device *xe)
> +{
> +
> +}
> +
> +static void xe_irq_free(struct xe_device *xe)
> +{
> +	if (xe->irq.msix_enabled)
> +		xe_irq_msix_free(xe);
> +	else
> +		xe_irq_msi_free(xe);
> +}
> +
> +static void irq_uninstall(void *arg)
> +{
> +	struct xe_device *xe = arg;
> +
>  	if (!xe->irq.enabled)
>  		return;
>  
>  	xe->irq.enabled = false;
>  	xe_irq_reset(xe);
>  
> -	irq = pci_irq_vector(pdev, 0);
> -	free_irq(irq, xe);
> +	xe_irq_free(xe);
>  }
>  
> -int xe_irq_install(struct xe_device *xe)
> +static int xe_irq_msi_request(struct xe_device *xe)
>  {
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> -	unsigned int irq_flags = PCI_IRQ_MSIX;
>  	irq_handler_t irq_handler;
> -	int err, irq, nvec;
> +	int irq, err;
>  
>  	irq_handler = xe_irq_handler(xe);
>  	if (!irq_handler) {
> @@ -695,32 +713,55 @@ int xe_irq_install(struct xe_device *xe)
>  		return -EINVAL;
>  	}
>  
> -	xe_irq_reset(xe);
> +	irq = pci_irq_vector(pdev, 0);
> +	err = request_irq(irq, irq_handler, IRQF_SHARED, DRIVER_NAME, xe);
> +	if (err < 0) {
> +		drm_err(&xe->drm, "Failed to request MSI IRQ %d\n", err);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static int xe_irq_msix_request(struct xe_device *xe)
> +{
> +	return 0;
> +}
> +
> +int xe_irq_install(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	unsigned int irq_flags = PCI_IRQ_MSIX;
> +
> +	int err, nvec;
>  
>  	nvec = pci_msix_vec_count(pdev);
> -	if (nvec <= 0) {
> -		if (nvec == -EINVAL) {
> -			/* MSIX capability is not supported in the device, using MSI */
> -			irq_flags = PCI_IRQ_MSI;
> -			nvec = 1;
> -		} else {
> -			drm_err(&xe->drm, "MSIX: Failed getting count\n");
> -			return nvec;
> -		}
> +	if (nvec > 0) {
> +		xe->irq.msix_enabled = true;
> +	} else if (nvec == -EINVAL) {
> +		/* MSIX capability is not supported in the device, using MSI */
> +		irq_flags = PCI_IRQ_MSI;
> +		nvec = 1;
> +	} else {
> +		drm_err(&xe->drm, "MSIX: Failed getting count\n");
> +		return nvec;
>  	}
>  
> +	xe_irq_reset(xe);
> +
>  	err = pci_alloc_irq_vectors(pdev, nvec, nvec, irq_flags);
>  	if (err < 0) {
>  		drm_err(&xe->drm, "MSI/MSIX: Failed to enable support %d\n", err);
>  		return err;
>  	}
>  
> -	irq = pci_irq_vector(pdev, 0);
> -	err = request_irq(irq, irq_handler, IRQF_SHARED, DRIVER_NAME, xe);
> -	if (err < 0) {
> -		drm_err(&xe->drm, "Failed to request MSI/MSIX IRQ %d\n", err);
> +	if (xe->irq.msix_enabled)
> +		err = xe_irq_msix_request(xe);
> +	else
> +		err = xe_irq_msi_request(xe);
> +
> +	if (err)
>  		return err;
> -	}
>  
>  	xe->irq.enabled = true;
>  
> @@ -733,7 +774,7 @@ int xe_irq_install(struct xe_device *xe)
>  	return 0;
>  
>  free_irq_handler:
> -	free_irq(irq, xe);
> +	xe_irq_free(xe);
>  
>  	return err;
>  }
> @@ -743,6 +784,11 @@ void xe_irq_shutdown(struct xe_device *xe)
>  	irq_uninstall(xe);
>  }
>  
> +static void xe_irq_msix_synchronize_irq(struct xe_device *xe)
> +{
> +
> +}
> +
>  void xe_irq_suspend(struct xe_device *xe)
>  {
>  	int irq = to_pci_dev(xe->drm.dev)->irq;
> @@ -751,7 +797,12 @@ void xe_irq_suspend(struct xe_device *xe)
>  	xe->irq.enabled = false; /* no new irqs */
>  	spin_unlock_irq(&xe->irq.lock);
>  
> -	synchronize_irq(irq); /* flush irqs */
> +	/* flush irqs */
> +	if (xe->irq.msix_enabled)
> +		xe_irq_msix_synchronize_irq(xe);
> +	else
> +		synchronize_irq(irq);
> +
>  	xe_irq_reset(xe); /* turn irqs off */
>  }
>  
> -- 
> 2.34.1
> 
