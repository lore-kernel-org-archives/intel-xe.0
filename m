Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D71DCCF9E3
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 21:21:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA0110EA3D;
	Thu, 30 Oct 2025 21:21:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hWohQ6dl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D048C10EA3D
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 21:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761859283; x=1793395283;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xJ7qECkkUCb79KhR/VEhSdLSmX30Vga67GKDLRSvPIg=;
 b=hWohQ6dlViAjcpoctQKB15Na6/uNvUPEG5CP93IdCrJ2ISBocP3ZnNLw
 C2GzkaM9EYKpur/SpeorqkqN1WzDQE45jq8sHkUhuVm6Yu28aSUFk09A7
 KrJpPAnunl0Be/eSi4pb86HekR3D8YadN511SfYvfDpmefraEHlVL534+
 jQxOEsbz3h/HhpBwVuEilwrc4v+wx2DTjHTwxpL8wOJL9p4q+Xk5YeFER
 /j31nxPC05vfsnue1EovS0GFL29qXYxlNwythItCNjrbXQs/mPH5qWcDz
 PSHArf0+3oPoRw0WgZX82nOwwaH9B3FpBp3brVPypS1OTvsZX9ZixgHc7 g==;
X-CSE-ConnectionGUID: FudqUYVDQtOoEA3p/G1ioA==
X-CSE-MsgGUID: 6Tszc4qDQmyrOA+8lJhKTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="86640856"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="86640856"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 14:21:23 -0700
X-CSE-ConnectionGUID: 23tLt1V7TeWCW3sdahJovA==
X-CSE-MsgGUID: YHu6NuQJQmy4zdBZXqGeFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="186163084"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 14:21:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 14:21:22 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 14:21:22 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.18) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 14:21:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C9u9TiJjjdt7Ob4hRAMvQJeOUBrtgfbWJO8g/tELdiOcCbS9jKINibp75J8VSIvCRH35LWSlxQisY+GblUdK1JDaYWk4ZYBrX/cVpqRwbktd9GDCBFvhyROBlTnVm4PeePnyxXVHRbWhWJlLZMr6b/SV4d5hQdZ4yBHrN2vxTLomJO9mw2NslIp8zgEdPyS15cx6JiaswYx5bDY7AY+O4KACLqIfeWJo2j7lBvJXmWMAi5otp2n9EP/zUt1QJ5nk209TtR9tIgAnuhKbmt2W26NvDZsZIbQTtDw/KcZi6KiZ0RLUsOHmL89WaW4VnlMpmvUlrttNsw4Hr0pWRX4WJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uWw2DnsJFA1wWSsL6V82fIcG06urx+td4cCuLfa4Eig=;
 b=ZJrL8prVbkuVwA/++DOXTHjUdfs91xnz+kZBak/7+GzCizriuCYOeHbF633GzQp95pTXlEdqkF3pi/eeoOn5ahK1pSHD4l+mZbrm59ZaVCiUrhqVT30R+fm7qcFeOvFz1svaSIi2yvSi1jB8uSbu0WI9K95gZQcp3vgzyy76TI/0sL/vfjWG1bUqdUzBwXuYPfWyTyDRw2HjlyJ9xbpiUfbUa7M7iB6KofIZ9bZdELO6zAObiFUa9e2Le4MEwv0mhjui60h+gaDKUooR1R+rCgl2SxlHa6LQDUn212jHw1VowQ8ufKj3c888lWEaimU8beJKRpr2a73QMnqoH9vfyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 21:21:20 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 21:21:20 +0000
Date: Thu, 30 Oct 2025 16:21:17 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe/gt: Synchronize GT reset with device unbind
Message-ID: <faewe43nslu62dt5donrrddkbzspnwicrsrm3llwp4xg4tdq7l@zxc7u6vd5ceh>
References: <20251030082638.3019345-4-balasubramani.vivekanandan@intel.com>
 <20251030082638.3019345-5-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251030082638.3019345-5-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: SJ0PR05CA0111.namprd05.prod.outlook.com
 (2603:10b6:a03:334::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8706:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cdd99a7-408f-492d-0794-08de17fa44dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IzyDDKZLsyCofU5vAQbXo+ac9zL1dwyOolsX2AuZB1G2V2R4GE9YIyWSG0Rj?=
 =?us-ascii?Q?mY3HoBONABmvrz8BbRorYfGkCUx6k5pv4N8siBv8NW5q+t5I7a7IxDSxXR/B?=
 =?us-ascii?Q?7vLFc55uTC9ln74hM1hIHw3csr7TVC19/qeIxL/tCAo/p9iChpTPr6DtRRca?=
 =?us-ascii?Q?aujcO9fP7lPMcYABnWp1FLScEHolOBNQDnWP9vcdvS8OGLFLRvKb89n/1mRL?=
 =?us-ascii?Q?i2KRGFyoU1XoKYaseP52P70z1jsw03c5+neoJ8x+KjXqhngPl4p8dBx1/8bk?=
 =?us-ascii?Q?i2nnE0xhLpLJsS3IVC6QKM1gjMGFts3DzPch5tTpd8dsZvrL+CdhKajw7tTK?=
 =?us-ascii?Q?HO9uGe2tEKNu7523U6tjEdGrwgYINsmpPaeNSz53aHoiIuPejzP0P869CHKN?=
 =?us-ascii?Q?FVIHRiEHGzmRmViuDSz/Km66xpEFbUwHxIoHNMjW0Zegk5PMeUM+cPf7LTIa?=
 =?us-ascii?Q?dbBEb+V6jI6KQWTl5KqLJTm14LA7pmD4Xbejo9VCdO3EW3Qr1yEzay5KniVz?=
 =?us-ascii?Q?v92AfsR94pVCteVt8ASrWVZCmc/SSJRhuo+0QQUxj5ePBeIIBTMuznliFzfC?=
 =?us-ascii?Q?RZrE9M3/JG/RzeaIpSqqOwoVTlyueqXiBsS+Hk1xLbT0IBJwCla8AiOD3Mcy?=
 =?us-ascii?Q?S4qFzJX7/DElLWn0oLk1fWmj7gC/R5h8J9ugb0Ilx2RcueUBLX14riNZLEqx?=
 =?us-ascii?Q?qbUoVNx6+rSZ2liRp2QHZCl08dlmGqOb3PtQOf6JEvDfDQhHpxSDyWHwR+Gq?=
 =?us-ascii?Q?VUA0oD82pSzXJVhsNNgj1lj5bzkee8YJGzP/L84koL1eRfcOAsfhGiQxo627?=
 =?us-ascii?Q?h/+cCbGgsjHROAnEF1dYT09cm4ogCvmlqZBO8zcc2EV/J4G79omf1T/LDjj0?=
 =?us-ascii?Q?Bu+iT+y2T3X98OoKLiZ30sn+mUkBOhQT0LmbWtpGkoeFeEsmzeMrYyFQIlsU?=
 =?us-ascii?Q?PVhN5e4K3iIkZ6SLQ/8DVgFj5AXL9btMvX6w99Zgb30LESP05xxOTe/9jh7R?=
 =?us-ascii?Q?5U/D7X7u64SFz0q42GTERBgK0WXJZFtROFh49d64T+r8HUwIiQ8ZgKMNPFmk?=
 =?us-ascii?Q?uBr1K8WLHAn0MJn6rj+BxJh+P93lhGKwBTygZ+9EqOD3sKGlVA7IK+AOc9pw?=
 =?us-ascii?Q?mX5I8NLiQ505xDv0p3LEW1Zc+yswZ2Iu4Tv8zv8vXLR9A5M5ZTPIx1Z+wrCt?=
 =?us-ascii?Q?V9ICTIozl4P+Hugpq/4IU2aSMz4GU33MmLBJYzqcvIG9FQpBCr8UODqrotr9?=
 =?us-ascii?Q?WC6mJtZoAkdLxEB1jF3fhkYZlJ4rO7yQ2pScbtNaflAZs+5LXrltS/1H8Rh0?=
 =?us-ascii?Q?ekmbwoNZDgalngQz9RD0ZqnAqTvU5UaPuvDVVY6OVMQkxQwnY5M9VYy9WTey?=
 =?us-ascii?Q?H0N8wG7X11VOG7i6CzM1Ygb1v0P2SJfAt7VmFvF1L/fvnns+MsCciV9plp5E?=
 =?us-ascii?Q?ygvm1iIlIoLEw81L6nREsOOwY2rPI3B9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H5AHK7vLK2Yw1ua8SCq0T/IWWIZ1mnvSawsdV5Bz1ouD3aVK4vhmamhFUr3l?=
 =?us-ascii?Q?KrvZhzsLIQg7S7L5edc0oTDHePetOhiw+PJi+vBpuP4CuQteD+MYnP0uuj0V?=
 =?us-ascii?Q?kgw8CqywZd1rjODGHzminG+b4H/+NffVq+IzetjRCHsheWz49VN+j7OtVoTW?=
 =?us-ascii?Q?/l/d6/tnyzPqHIXsW+eyYqdk5eStEMhbHqLPSo5GOQpdjWxxMtssQRoBkFu1?=
 =?us-ascii?Q?nHLkv8K2zcfO/NLIxCIum6S96z1DS99rFmXWXqedPRYzSvUK9cTb6YGCW8ns?=
 =?us-ascii?Q?zgRaztNlt4TGuX+vaQp5ZcJ8vOUg2eFEA2jWyT4ql3T0UTvYXht+LvC+wYHN?=
 =?us-ascii?Q?AiHz+cMjCTmoj4cXBEcpah6goMEIQI+lhNYn38QGnMmZOMTATSkoFORyqLo0?=
 =?us-ascii?Q?BIQfKxLMdYF3VKA18ccWpxT8Wi+4log4puK6BGedMqxoAH78zQ6i6bkqG/4B?=
 =?us-ascii?Q?ZVIgWFtv4qc4aXGSjCXK8FQ1r9ni6QkV8unx3JB00k+3oB0RNDpt4oPABQqn?=
 =?us-ascii?Q?sQf3+5kqMSx8y7GJTPJhvp+4jHG/Z/228UpHwWPzUZM85fpf7Gg8Y6SilzRs?=
 =?us-ascii?Q?061Y8tYszClBKbXZq9Tel9QLDHkYh4PjsizNJqpDttIZGrpM2ppr1IYxtUVY?=
 =?us-ascii?Q?i9CWFYWNN7rkFQZwcVvJ+/1jjsc4mUSdhYh4gxcGz++v0kzpp8hxltolhr/x?=
 =?us-ascii?Q?xvClLLXYyEvMK0qw/duVWAZza68IgOS1wgaQTmVSh9z19tWIGqj98BoFCgwl?=
 =?us-ascii?Q?d+4dLkmbuq8bjbskf0/6xAcHOOqcwkG9H5dD2tOBcyJ1OfsixGfBPh3KF6AO?=
 =?us-ascii?Q?vuXmlurNu3L6vp/9RMkS0hapGsZWowJbA6xI5swmxTpM9ggSWun2noSrmolh?=
 =?us-ascii?Q?pBHnq7ngDn0QxyULSuXCIp1JiPaohA2LfVe3KbKiRj2P4oWOXfatjL/bw+C1?=
 =?us-ascii?Q?YbSEhSdqiggJO0eh3gXhIcQjF/NBoSI1YcOv8uKroOuT5mTux1W7Tib/sMB0?=
 =?us-ascii?Q?tbVXaODU2PUmW1TtNZ/XmxkodRedl3vGX2KlKYhM4MzS0psQapPlGwtDUgW6?=
 =?us-ascii?Q?rhY/2PLHZgPNLZJfpp/9VfTAM3Qy4EZd/QzS4U7vMlULTuCJ+S74Z1gwkiBj?=
 =?us-ascii?Q?/zm6+sNIixgvClU//IBkZdOzgmbs9Q+gBSCW0XE7Ub+0/d6sJGEmQ/qGy5zD?=
 =?us-ascii?Q?Q5iQycAldLwMji131irECD4/uc1LDZUkpapdBiEHt9qZhjKQBG4craj9HSn9?=
 =?us-ascii?Q?RGf9p1ZpU1diXpM+pWdRMs6/C15Fi39MCJFEpNXbGY28kAP0SU6S3kFEcrJJ?=
 =?us-ascii?Q?sLD2IKD3U3XiDOlsfdgF6jUBniCrMkFLVa4/M6c81Jx2Je/DXL4CZSDtXcbc?=
 =?us-ascii?Q?+6uD6aFLNwanoEm5ELpFH1bR2A3VtpYU9AmTRIGIrcgP9F3ZWiakkccnEfTT?=
 =?us-ascii?Q?4lI/NAq9Jbqj4wL09V/LsdJORrYQsoZxt2zAcyr1ATGba++2J3PMglEeBDyf?=
 =?us-ascii?Q?DNAyVsk6bVC5UNIPlZIaQqfB56BNQT76bS2akJ2Y1BPrXrbEqmNIEj/Uhs8P?=
 =?us-ascii?Q?Hc85HJhTuit+7v/7hiSLvbI05Un1dKZDcHVldLkPxTZbLbbWgkbYZW4nrX2T?=
 =?us-ascii?Q?Eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cdd99a7-408f-492d-0794-08de17fa44dc
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 21:21:19.9937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sATlYXAGmLh+OMLIt/eNxoANoTyAVN1+KUMUeYHHxz9aKAz5AP2m9WSs2ErtbAPXleQcJwpoCx+er2hPMJjEPwubOJMz0+kmLMk7+N6WH7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8706
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

On Thu, Oct 30, 2025 at 01:56:40PM +0530, Balasubramani Vivekanandan wrote:
>When unbinding wait for any GT reset in progress to complete. Unbinding
>will release the mmio mapping but mmio operations are performed during
>GT reset causing Kernel panic.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>---
>v2:
> - Use the managed resource release function to wait for GT reset during
>   unbind (Lucas)
>---
> drivers/gpu/drm/xe/xe_gt.c | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 89808b33d0a8..d0f8c40bc51e 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -607,6 +607,8 @@ static void xe_gt_fini(void *arg)
> 	struct xe_gt *gt = arg;
> 	int i;
>
>+	disable_work_sync(&gt->reset.worker);

since commit 480b358e7d8e ("drm/xe: Do not wake device during a GT reset")
we now get a pm ref while enqueueing work. If here we disable it, we
could leak a ref. You can use something like this:

	if (disable_work_sync(&gt->reset.worker))
		/* Put the rpm taken while enqueueing the work in xe_gt_reset_async() */
		xe_pm_runtime_put(gt);

+Matt Brost if he has any other comment.


thanks
Lucas De Marchi
