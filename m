Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57FDC021BB
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 17:26:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7295210E050;
	Mon, 24 Feb 2025 17:26:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MeU6hhlP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA7B910E050
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 17:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740417991; x=1771953991;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=a9xACOjtG/uUVei0gpVXEzMSQ9Z7sGhJSCK9slqwCYM=;
 b=MeU6hhlPkQI078hN2B8xcSKZpwrNPQtRbNGk3mMNN8f2XXtsv2Q+I6e0
 je0OvYTtUd+DFEP2TYAEGnRamar0y6xRVpT1FydbBhXIWTYid8F+lwh+X
 ia+nY1b0k6yGl4vsen4MvS1nF2Ruwgmo6p7HP40kX84DhfMyzXSLO9VFZ
 grXTvvZWKegS9ienT+lkSMzNNf9eXAO6IzOybouEybjwhXjtIJey3+ZOZ
 ywJyBIRvhW0FBqPC1IxFwgAA0fx3tHE0PZI5V6HhQauQsdNjAPLa7fq2O
 6A5sTPOWdVsuGsSE6DZabDd+ECMj/b55zKxDa61Wq8+QvGVqa3e3VHnKQ A==;
X-CSE-ConnectionGUID: vxz9s/R2Rjma7/HIzT2bmA==
X-CSE-MsgGUID: 464EevBIQdG8hcOS0EuI5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="58601669"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="58601669"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 09:26:31 -0800
X-CSE-ConnectionGUID: DbYKc31GREKrc2TQsM/W+w==
X-CSE-MsgGUID: PQdJq3BlTGWP3154CNfqAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121374054"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 09:26:31 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 24 Feb 2025 09:26:29 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Feb 2025 09:26:29 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 09:26:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rE9YGMxNQszAZYdBvdJBtGpn4kP6fYullZB4kmkHI8EgQ1JzlbYKz4G8iy+Q5epPCpA+5uhykB9vJpljJfktPIWEARAw6UCbatSjmefV9g2NxDPUMYYxdPsjBm9Q2HQLj59oBl/RWi2IV0o8DKLpCbO33wwp6LLICKivqtic5/eruxTcj9iDRdjTMviL1KW/N8HP7q5hD1ZxBDBOkRms9Vi/bCuiqMhew6Gts3TsGRf5bx1O26QwjuIPw32/u4zLUQvpKtr1KfPp08AW9R2TAWgzE1Ck6vtHVD9EHAsSfqfxANDJuJ8inhavVDi82bAwrqOZqlVeBlA0wi/z7daRag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cydJmKA95BvucsnCw24FK0DJoChtCEArDsfSnpU2h2Q=;
 b=Wu8trYcW6c3I6jZFP2tZWIYJ0ZoxcRQaNZzumanV6nogzBnoIvClVwEaRNRGZro7PScCG2wwYd202NXEQ02J5QhcNkL0YsYE7+dx3gOTW/R7Kq/dPhHHhmJkQrYL5rlBal5LelRJZ7Q/DiUbpVh+ETjZGXDvJV31J5qbsMyfi/VeOwKU97rWIwBeMGe9MNTy9lWWtMInMjHXJXgnlqLQ1upcfMGU/qBkzNxhs0xUwPcpaLRyzv6gc48zOSY+z+C4gq1AGI9XUVf5E1AsWZYsr6kgS9dazoJ3S1K1b9dXazS8GLa0AGJg+njPvud9+Rrsf1WWdeWGa3u3DY2XYcesnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB8066.namprd11.prod.outlook.com (2603:10b6:806:2df::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 17:26:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 17:26:10 +0000
Date: Mon, 24 Feb 2025 09:27:14 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 1/3] drm/xe: Introduced needs_scratch bit in device
 descriptor
Message-ID: <Z7yr8kyDzHrHCozW@lstrano-desk.jf.intel.com>
References: <20250213022331.265424-1-oak.zeng@intel.com>
 <MN2PR11MB4728E30D83FCD668D015423A92C02@MN2PR11MB4728.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MN2PR11MB4728E30D83FCD668D015423A92C02@MN2PR11MB4728.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0123.namprd04.prod.outlook.com
 (2603:10b6:303:84::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB8066:EE_
X-MS-Office365-Filtering-Correlation-Id: ded5d8c7-6bbf-4f64-2aa1-08dd54f85496
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?hmoUm9CdyY7BpkjMpdGFg3xuYLHedw8Rrp2qzbWelpcYHpCN89Z7ppERwT?=
 =?iso-8859-1?Q?nww0Mqjc1u3slw0BhkW2l4H5qdYAVHYCQnzW43KpnLsy7o4O358FLGBXNu?=
 =?iso-8859-1?Q?PFr/S5ApsWdzv+EddzvklwKi/EzPLTjnGa0Z8fU/TxRG5nG0ft1imqyPQ8?=
 =?iso-8859-1?Q?3LlOMpzzljW9tx1jxwybEi5Cu+aYOCxuCMjmu65Gak8Ecdyxkspwjmsc6m?=
 =?iso-8859-1?Q?XVg4ZVxL5GimlwPVRXEuDOfJBaAR7t/Wz+gmFZZYHx9Dxffd5b2yz/qbhU?=
 =?iso-8859-1?Q?TGR4UwdI9GGEy6clmfTf9UwA6sGnQ74dixnHaKuevO3bHVhn7PR8vxibWn?=
 =?iso-8859-1?Q?CL1SbyO7ZADORFLKptcD5Xx0WwHlHGdYaT+Aphayd/KpipaUiD7EO5xVjl?=
 =?iso-8859-1?Q?daKMGQ5cfoaHKcFNPdlixeanGn3pX9RJgHETq0oCKoDqxVRKaFEjJSbkhT?=
 =?iso-8859-1?Q?0ZbXnrwjZGAkdEJLvGxoprWwMrWobaNjs/uEQmke0E69QZvi4IGSLCDRZL?=
 =?iso-8859-1?Q?Sk8Pq35eqMvkEDdKrL+rtKPw4bRL7S3vS6kkdD3fHimQ5+0Uexxyy27dZ6?=
 =?iso-8859-1?Q?mm3vmp9YzthMxMXRLzR63hhiCpjxAHfcLVU/BC9VsmpCKQkHFYWTG4+gr/?=
 =?iso-8859-1?Q?TzaDZSVqxg+T7aLBPUYjlCGunPbPjfn+FPgx4dZNnM/m0gsPhY9SZxViHU?=
 =?iso-8859-1?Q?vuwO+UpfzxGyIry3mfs8eMPHqv9Dbgrjf3znfJpxaWak6vKNdV3ZGfkOSb?=
 =?iso-8859-1?Q?y86p8hnTm6klkUbCSn1tRKupaMUt1o5fGdAhl0vJqS+gJHYiCBpebLQGpw?=
 =?iso-8859-1?Q?f8qvI3ep+7MOR1fsuZGBVY8cw+PJU8zBLJPh8Gmb3FuGwmB2JY+VqKP7p1?=
 =?iso-8859-1?Q?1CfoRNUGDeqpesHR9Idk52Lo4ZuuGTKXYxmRUV1UZ4IvvwkbguDR4sZuui?=
 =?iso-8859-1?Q?DwFS3DHdXocdLcK5LG55AwEMOj/iYagzY9fMr5oJAHrZ0MnGfNgQQI+q/x?=
 =?iso-8859-1?Q?FfBnxZOkXQXeBGitd79eSQJB+GicLogBhF7jB8GDuMW2ExmPnd9LWKteUX?=
 =?iso-8859-1?Q?C2QCGy1Mx4ykWz5Om0XvQEr3J5+Ln9QkuKpd0F5N/2JTS0Oe8aZ/fys61Q?=
 =?iso-8859-1?Q?VLcztK2L5K5mlp9FBitu0XYq75LBQdvrDpx8ubFbQCxK87C16vsyHXryNA?=
 =?iso-8859-1?Q?gLNxg8FyPISYq9BBSQqWl7vQIIV9EDh4+6sxYdM9PeRF4QU2svuaSaAZx3?=
 =?iso-8859-1?Q?Ij53LQhT+EFThkVJzu9r0m1W0DtZVRGLEv7d2i/z/oPf0duT9NafpsCrxF?=
 =?iso-8859-1?Q?aJnmotBpDRXnEcFgbDUPYRaSmXfLouybx9Olyvx3fmtAZk+JxwzRVRKmFP?=
 =?iso-8859-1?Q?OodxLpAm11KlA7Hq+n4sABjSewaiiPRk/jMdp7uutgz5vht8oUXqNUx3Yd?=
 =?iso-8859-1?Q?zgq2hdrTlW4bFVwA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?w7oUlNm2MaEcIYB9PmcpbxxfWV+1KhRRvOzcZa48u51bYGKqF3Lyw/RrYN?=
 =?iso-8859-1?Q?/JvkZDC41PWuaJdOiRex3DrxlTy3i74aCQks5msZNK83QyIWS03AgzRB67?=
 =?iso-8859-1?Q?oUrlfcVV9uP1LNpvA/0F2TGdrsUJsSic7Q+rLccJC3RyeORehd/UYyef8x?=
 =?iso-8859-1?Q?Gr/HA/u93zCzFVFHDmvV4vndua6YfPn/G/xwvEyg7E4awfmoocrEzMhy62?=
 =?iso-8859-1?Q?L33EP8JAf9UOTU8TBbixSOpzk2LEFP3NBB/YakB8GB9XvFyG0QRHLlzwVw?=
 =?iso-8859-1?Q?5NzWypFngxInoo+a0xl7p9sCFuEskaTJtVaQ4t9llYWlrlWNZSBY8YecVf?=
 =?iso-8859-1?Q?WsiQ3DZMqOj/3Gt0JAfOj9oE69dFzmZUiUUv3qRSt1WZQktMkr5RiF9wXr?=
 =?iso-8859-1?Q?NeuTmDeUDCtPK0k0TtXp8dXqWJcY70peWHs6bCxJWJ7hsLuDRQINRIcDLP?=
 =?iso-8859-1?Q?ixQAV9JUnzufTv4b2Avvil4eizoG65w3zolQ7Lssk3IyQnrnE5e4rpIYq4?=
 =?iso-8859-1?Q?tU534eJFTxMLUodDBz99Hm2/oQTC61Pvg9cW2y+gcj/x9f1gSpO0BLen43?=
 =?iso-8859-1?Q?odWkKSAokY40jlwZ+ZYzYS07ZA679LxOr4rOACnt8XVq63Hi8V1iA7+uF0?=
 =?iso-8859-1?Q?9u9oO9yf8Gs7xlDuHUs5/QozNNYCmamTm2g5oN4ZOujm1RY+Og3IRYWW8a?=
 =?iso-8859-1?Q?KSqABTq4aL1UcaVJMUi9lPP8U1xjJJYuEc3CmDGhdgKLliUA9waENkmzsJ?=
 =?iso-8859-1?Q?9xz2/hj06ihFW7TNDzCvjDu2KabPPeCIYXAvWqxDTyf3NrJoPjdfEC69xi?=
 =?iso-8859-1?Q?CK4sUqEPEDuyUaCchE7EDewjHSYIdPKH3GWOKjZIgwfuvJCiCR7eMVcgFf?=
 =?iso-8859-1?Q?sVnU6F4UfIy/Ch+2jyx5+ItscR8ywVc7a8C4YhAmVX5JGoUYV2yTX2PFri?=
 =?iso-8859-1?Q?RTy+o1uE5DazPvTE1VUZ5x0yhxwGjpzumXeegZvXKzVqPBdfv19qoCXdry?=
 =?iso-8859-1?Q?lemkK6QggxNz7201pa7ljB9axLj+w8iCQqT+vPTEfIudBvWkinCgX4deac?=
 =?iso-8859-1?Q?DzilDW5+rEsT9nqWb8rh/w2Jps32bE48swQPJ4w5eWj3HXC/iJjiOMA192?=
 =?iso-8859-1?Q?NIQXouq71bAi8H9c6bRQR8yfKRCw4hv6OCjrsCHJeZVDPejoSy9h0MYkgL?=
 =?iso-8859-1?Q?ymx3w2AdXxNcEHk6G5jq8Jn4f9HAvAsszvEEfzKWaLlQsUdo2LB6jqaHYG?=
 =?iso-8859-1?Q?vB4ZQCIia8zjUOCyWbRpXeeaqJXWTOcReSa+dOjQKg3NtMx9c+RVpJ9HTO?=
 =?iso-8859-1?Q?+rRIg5V0nCRqC1ZtezPB8r1m1bVHIP+674xqg3vjX6hGaKK+53TXjh8fKh?=
 =?iso-8859-1?Q?VKTaqDLTBD6xCXyy6eQfjPYg8OPKrGlEP4AIxQflgF8ua3G+xpOhv7X4Di?=
 =?iso-8859-1?Q?YFK70YDwKvdLkSZbsGEXu0xeRL+hn30SEwWWiKB4vKfkZtumh+PZK0DR5k?=
 =?iso-8859-1?Q?1XYsNZB4cC36zjbleuITXZJbfVwy0fkteQ3StG/lh5t6a2Ux22AA6wjmUH?=
 =?iso-8859-1?Q?vxdF0wODrXii8vFAvdhfS1eayn10duO1KSmic8aELX8TXGhMbsSOmEWFjw?=
 =?iso-8859-1?Q?rWrjoBwMxam5fxPs2XWbuPbztOlJfMec3J7wJSBzgjrvwGyOjHIZxF7A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ded5d8c7-6bbf-4f64-2aa1-08dd54f85496
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 17:26:10.5748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1LhwLsTbZPGAeuhE4sESv7IOp/hB6A6WUeE/fEYtpNl0g4Wz8lalSq4a7VWXThJShcLZVEw4gtmdKYtya06Bsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8066
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

On Mon, Feb 24, 2025 at 08:40:06AM -0700, Zeng, Oak wrote:
> Ping
> 
> Thomas, Matt, do you have further comments on this series?
> 

Will do a full review a bit later today.

Matt

> Oak
> 
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf
> > Of Oak Zeng
> > Sent: February 12, 2025 9:23 PM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Thomas.Hellstrom@linux.intel.com; Brost, Matthew
> > <matthew.brost@intel.com>; Cavitt, Jonathan
> > <jonathan.cavitt@intel.com>
> > Subject: [PATCH 1/3] drm/xe: Introduced needs_scratch bit in device
> > descriptor
> > 
> > On some platform, scratch page is needed for out of bound prefetch
> > to work. Introduce a bit in device descriptor to specify whether
> > this device needs scratch page to work.
> > 
> > v2: introduce a needs_scratch bit in device info (Thomas, Jonathan)
> > 
> > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device_types.h | 3 +++
> >  drivers/gpu/drm/xe/xe_pci.c          | 5 +++++
> >  2 files changed, 8 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > b/drivers/gpu/drm/xe/xe_device_types.h
> > index 833c29fed3a3..a5ba9e4e470f 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -46,6 +46,7 @@ struct xe_pxp;
> >  #define GRAPHICS_VERx100(xe) ((xe)->info.graphics_verx100)
> >  #define MEDIA_VERx100(xe) ((xe)->info.media_verx100)
> >  #define IS_DGFX(xe) ((xe)->info.is_dgfx)
> > +#define NEEDS_SCRATCH(xe) ((xe)->info.needs_scratch)
> > 
> >  #define XE_VRAM_FLAGS_NEED64K		BIT(0)
> > 
> > @@ -318,6 +319,8 @@ struct xe_device {
> >  		u8 has_usm:1;
> >  		/** @info.is_dgfx: is discrete device */
> >  		u8 is_dgfx:1;
> > +		/** @info.needs_scratch: needs scratch page for oob
> > prefetch to work */
> > +		u8 needs_scratch:1;
> >  		/**
> >  		 * @info.probe_display: Probe display hardware.  If
> > set to
> >  		 * false, the driver will behave as if there is no display
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c
> > b/drivers/gpu/drm/xe/xe_pci.c
> > index 6a8e82aff385..c614f673efa5 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -67,6 +67,7 @@ struct xe_device_desc {
> >  	u8 has_llc:1;
> >  	u8 has_pxp:1;
> >  	u8 has_sriov:1;
> > +	u8 needs_scratch:1;
> >  	u8 skip_guc_pc:1;
> >  	u8 skip_mtcfg:1;
> >  	u8 skip_pcode:1;
> > @@ -353,6 +354,7 @@ static const struct xe_device_desc lnl_desc = {
> >  	.dma_mask_size = 46,
> >  	.has_display = true,
> >  	.has_pxp = true,
> > +	.needs_scratch = true,
> >  };
> > 
> >  static const struct xe_device_desc bmg_desc = {
> > @@ -361,6 +363,7 @@ static const struct xe_device_desc bmg_desc =
> > {
> >  	.dma_mask_size = 46,
> >  	.has_display = true,
> >  	.has_heci_cscfi = 1,
> > +	.needs_scratch = true,
> >  };
> > 
> >  static const struct xe_device_desc ptl_desc = {
> > @@ -369,6 +372,7 @@ static const struct xe_device_desc ptl_desc = {
> >  	.has_display = true,
> >  	.has_sriov = true,
> >  	.require_force_probe = true,
> > +	.needs_scratch = true,
> >  };
> > 
> >  #undef PLATFORM
> > @@ -644,6 +648,7 @@ static int xe_info_init_early(struct xe_device
> > *xe,
> >  	xe->info.skip_guc_pc = desc->skip_guc_pc;
> >  	xe->info.skip_mtcfg = desc->skip_mtcfg;
> >  	xe->info.skip_pcode = desc->skip_pcode;
> > +	xe->info.needs_scratch = desc->needs_scratch;
> > 
> >  	xe->info.probe_display =
> > IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
> >  				 xe_modparam.probe_display &&
> > --
> > 2.26.3
> 
