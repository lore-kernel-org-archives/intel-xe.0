Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F41ABC3ABC0
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 15:54:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015F310E1F8;
	Thu,  8 May 2025 15:54:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G8T5arcp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF82B10E1F8
 for <intel-xe@lists.freedesktop.org>; Thu,  8 May 2025 15:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746719691; x=1778255691;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JzeaGiI5gFmiAoQIzD/eXX1dn16lu5R66IeJ8YKvDnU=;
 b=G8T5arcpoZtC5LE0elBK+fTCCQWiB7DtT3H1ig5iyTJhl/s3fflJrPHF
 oIF7V1gCk0RBZWbCnWK9kKo4M4zQQoJjSnj2rgQ6pQNTegFYkDia3tcq1
 sqFU+8lkfXitAnvRuS6zy4Ogl38Ghb1H2nvmfa6HRS0zokhdA2p5XDTdi
 4koZDwmKbtavAJAVpR3rsjnZAkXFPx0h+Lb1qKVK/BMTGI5fy5pZymgkp
 HMz2UyD924D7ScdgnDSOz3Z85ieANG6Dc1JKPCPGZdb57vPwAfCC97pZM
 EXBunuVxTQW2N/hBu7pALSVNQB3VQMZl+jGzahGAJTJU7KBS+DXVYP1Kx A==;
X-CSE-ConnectionGUID: x+CAf3HmRx6ZmWYJRglrNw==
X-CSE-MsgGUID: l/7NSQKUQgmPWA+9MZl1FQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48423252"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="48423252"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 08:54:51 -0700
X-CSE-ConnectionGUID: EuBXMfsfQRK0/E4Y9HjW/A==
X-CSE-MsgGUID: ddpX/4pWRGymleAbogq5kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="137269461"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 08:54:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 08:54:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 08:54:50 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 08:54:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=co8/J5jE05UStYgqNaqy3KB8vs4kWIfAFG7QiFwNgCNbv5oTdJdNc9wd3qTUyexhb335bhk3msL56le4wlhBKAT/+7MQ5Ke+yuAOMHDQJu7DaBN8YWT0m2pVxnHk99p9td4SNnYiCKiDHWvAW3Z6emEIxa4QqR3nm6fdyS6OU8D6ab942UQGlXhxDMBFOTaOqOpOZZ6GLW365m4lQM7f2Xqzag2qN3xGNvhMfjFqpLuiHqmVjHF2QsACmBzAdPfCI85+NxvHym49vW4OVpmR6XS9LTrdX7EDMNjJLVEU1YgS1Qq36NMrK+3V4K9Q6hXoXzgfeKalAoFLyBRnhX1gJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOmiCGOOYAuNVPou7t0nnFbMiFa0eJa7yGLHko2VfOA=;
 b=IQXOmhgHeeCS2vWVKAh4x1L75uPghuBo2RRBdABHLh19uWw9yPOUswOIIRCuOD8RpY8AEFseIFXJTGlj3oPCtyiOuoL9ANdkHKgE1Y8+xuhaRq1IeN3HaqpapWoskKkBcbB/fdj+FyDPXEjKfUUqlHOk26a541kCIB4DaR96DC/vejBMBDHXg9735Z4Z7lnpIBW5W6gJ0/IUaTrHP4pDvHPlKv5SJKPX+L6YnF1tdgdmpkVyOWUei41Jly0A24RW688C7Zcwsb8d1NT1jdTwzDwR+O3R3gvL77vqZRKz/7qC+gIcGykIqR+YMIO5CC/ehmAUSkK2nSL885+q7EZ5MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB6679.namprd11.prod.outlook.com (2603:10b6:806:269::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Thu, 8 May
 2025 15:54:29 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8699.022; Thu, 8 May 2025
 15:54:29 +0000
Date: Thu, 8 May 2025 08:54:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "Bhatia, Aradhya" <aradhya.bhatia@intel.com>, Intel XE List
 <intel-xe@lists.freedesktop.org>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v2] drm/xe/xe2hpg: Add Wa_22021007897
Message-ID: <20250508155426.GN6239@mdroper-desk1.amr.corp.intel.com>
References: <20250507101112.4678-1-aradhya.bhatia@intel.com>
 <SJ1PR11MB62047A2D7451CFFF32ECCE66818BA@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB62047A2D7451CFFF32ECCE66818BA@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0146.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::31) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB6679:EE_
X-MS-Office365-Filtering-Correlation-Id: aea4f1d4-affa-4d41-ca5b-08dd8e489ddb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MDrljYqXoiN55dbozgCGSwkWkMVNzBO2swIRafR9UZWNTIzmae47M50feuHk?=
 =?us-ascii?Q?OrsYz78zzZChGOOCMim5dTBxUN2/Hn0s1MqsfSxfCiOtjD2F3462PE1O1us7?=
 =?us-ascii?Q?RFUzXMtpPNWxs9Qo38Ae2gRtfAoaDDNtsON5yWd+HrEyP/kEZJyQmMUA6ezK?=
 =?us-ascii?Q?Fjf3Py0ukd38u0Qq0z1ntiaYLLMFgFAm0A6HETX/i+KwIJgoTbS0IwEkCU36?=
 =?us-ascii?Q?0AccHKa3/BhTJIzPh6xX7FVK8UZxwtyz9aPaFc0twLZO0klmfKWEGb4i2FL0?=
 =?us-ascii?Q?yNmXhhTCsgf7bDPHlF/dthYxVC0UNIjnpjNMTr0bTXwZzA3hn8EKZQWP5gUt?=
 =?us-ascii?Q?rzCCEzchUhV8eh4PQXaPxCvMButcYyx1lalFSAVEcsYGZc9esRm4mMkPcA6H?=
 =?us-ascii?Q?NSUZPukKIBdmSZaBD1dEa89iq8WLN8NMXILdwnwRUu3j0PyKgE4IFfNASmQX?=
 =?us-ascii?Q?fYIqgJQ3b5GeXOkOCDEvdqP4cP+fSssd7yQZuun9Bo1jq3caqd/q1HKv43k1?=
 =?us-ascii?Q?OAZX8vupEh9nzhvGzy5HnoSz2cXo2Nzae8I/1ZWfVEYIKLOccH/SePyzBrtZ?=
 =?us-ascii?Q?cFksuERDQ3Jxh+js6P/o4yEA/4pqMapUtgIi7wITU2/7JcUAlJCqTqJ3kr+Y?=
 =?us-ascii?Q?OTNJ31idVuYlBvGZyusbB1C/4lzD+eYRwmAQmL9a4W8lzcabsW9so+y1BDdQ?=
 =?us-ascii?Q?U0osEpGqMv2xHhlGLTwGvpPHt0VV9HnRPrLFPSmPH8H2170LCIP1+9M0Qo1w?=
 =?us-ascii?Q?hy1BQi+VMVtzhF/m6TLPOrzJIXhZ0UifEEj9UqbSMVJQrhRpmmOkKv7pDkPg?=
 =?us-ascii?Q?c/M0WgAF+VvAkI72amQ4x+Dl/VRZGBn+MIh6lXU0nzDtajBa83c/mwS69r75?=
 =?us-ascii?Q?HKGzWnEWWnc1ahCkcPnPCHEKBBZNuwtolPzTt31pSDNwQHkEW+2rAqq5FXHL?=
 =?us-ascii?Q?8bgyaejgKPfx43FTyoWnh53779+hvXNdWEV3kkbPEPtwTDxdFBoGqtTVx28W?=
 =?us-ascii?Q?twrebAwRoujrAA/nwnrfLhHgGiT8GWnLxIoXXxssXu7Hz0F+rMX4HKw4SO+J?=
 =?us-ascii?Q?EUYAIcV5qkWcSwRm2c8g1MdDF7+a/RALUpCUmGpNaBsi2tEukIVYdTj8KWDc?=
 =?us-ascii?Q?pa/04chV+eh2zyL+MoCxpJTLkJ5MwlbyIe6kySqinjX1sWY7mCOUPuI0zbCS?=
 =?us-ascii?Q?MAQ2rYbJF7wOHRorHm/R4JhtFvF7wJRpUr30JsdWrRs/5yyWyKno/tKWL8G5?=
 =?us-ascii?Q?39PIGcvbf6QsMad5HQ6PSHrwZ+hdoRpoYdoPYjbWjH/q58fynVdLPle9maJE?=
 =?us-ascii?Q?FapWmWMSglUeEbqOolDlVRiD1ZMwC1rIHfKPMH9EtMkGEwgoW/iZ1RieGiPS?=
 =?us-ascii?Q?Dj5oFzPoubNyTvx+lopMzj/4m4U4ABqS9mFUQsSt3QBkuvtduQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EzfAJ/o4auzdt/LAcn6a2IGnrVvlGF6HhETnSZ6C3LTogLUAMUhSp3wK/fY+?=
 =?us-ascii?Q?wnf0+bgNH6PQeOPFxPr9kqSNmVugQnnCx/f47drMz8ST1QnKN2nasjUFl9fw?=
 =?us-ascii?Q?uXVcullGyODeNeirvOKtWEZ9YtZg8f7oWQJTe/so35qsST1j/eeHK7t7TW7W?=
 =?us-ascii?Q?tqpRdW5DSlKunaimNh5iMkrdk3r2ykooBcjUO4jQ5oz+cWp958fAg58Wb3VT?=
 =?us-ascii?Q?X0rtRtNvKhE4MRBZtFLnldTU5zzaKTxSvMZASKRUEIe4sdmlES6lJDF3OrZ6?=
 =?us-ascii?Q?xy3yOKfpMP/qi5mujQlf1TSaB2cl0dfb6cyhxHN9A64VCHR9Xt+5Lz8JXucR?=
 =?us-ascii?Q?0XT2ZG11CGOssddtXSaIWqYnL8usJsXnupUWV/poHJ9ULrWVKDu2a+X85wYV?=
 =?us-ascii?Q?0ZtYl7WRX2Cn50ZD6sMUmHSi4GUMZtzF+XjsDdL8szn/lUUw24mMmOThV3/E?=
 =?us-ascii?Q?wUeG8/dLzd+rAS3EcrtVGBXn/ioPSy4tATDHQRprT2Is+mMsm/71KjENH4LI?=
 =?us-ascii?Q?SteYTT+ZUP4QfbA8MhdKfdR1q4af3akTz1B8jlQJW0xwJl1ReVg42vBDU2Xr?=
 =?us-ascii?Q?zjjJlElon2OrQUQ8cREwkRgCWE3Y7EuRCn30maXGukPujos+eu8UQINwkGC4?=
 =?us-ascii?Q?vfOpAumiqwYaXlfIldC4F4R4Z0TeSWCPzK0v9oRLsaKUBXLBVrGA/M8eRKPc?=
 =?us-ascii?Q?/Dux0WRfQgk/UNTxUMCkr0JoW3nV38u1zCkuZ/W3TQG9Mba42fBSD9phacuY?=
 =?us-ascii?Q?NTaaw+IeDIKtv9jVtZu/vbXUO+wKdxlxuP8JklNHohKrnokPpGQSd055tSEX?=
 =?us-ascii?Q?hc+N+G9pgZ+9zKGYAPa3SqMWEQLdrYWGe0DJ6CxxTQSO30CaZidJ2HhpggWp?=
 =?us-ascii?Q?9G0f3GsMWwNnQP4Z/aKZBqCDrsd1ChfTpvDIHxdBVLUfdQrwoXmpBlD67cRY?=
 =?us-ascii?Q?6LY8cQAm9a5VjABToPxhFQyfLPBUx7D2qlGVPq418gETcWsQJLxH1/4V2XZu?=
 =?us-ascii?Q?Da8+KHr4cChKih5aXmj/kuyDiRRdDJaWfe8kCsXzGnzj1nw6uGH4VCDizZ5g?=
 =?us-ascii?Q?vpHzqiJmuRptJgoZ/LkWvS2hFdA2YmhcijmCoTVEEHKpWvUo1oRzVv+d/WLI?=
 =?us-ascii?Q?pEqRQ88WCL8SRpaOGJGDSMuXzdLf3eccFLneSTe2MNjZgSN3DJauwNDtRWCQ?=
 =?us-ascii?Q?pCnYOjWtQApMH5q3LiePukJOqubeAO70CP2i3b9M/Yn84Q5jFWgpZF1edZ4M?=
 =?us-ascii?Q?InIYrT7VSoQC5b2/SzbCGGikj2ZJwWkx//P0FSiTvPUOY4KkRCVtzp9T/cVS?=
 =?us-ascii?Q?H0nCJ7zm0crrd59vn9PZJhogKu4zJofUYLZIK3cg5T3+h/LVuLIsZu45fgON?=
 =?us-ascii?Q?Asum0+M1CfR1SN5+jr9w9PyQJoQDd0GYDMWBb5meE1g0qPON23MvW2jrE4xt?=
 =?us-ascii?Q?sqo9blkyrNrOFWwv+yCYqs5oUNhTSEdgu3VlgJeBtr7l02PzojKXFE5pykYp?=
 =?us-ascii?Q?zU9Rk5Rtbp+rrli13dsZ2h4U5t9XztNO1+EG8Zx3Po2g3QW9xV11NrZxNmfg?=
 =?us-ascii?Q?V8a/y51TywMp7NTI6QeQ3H3dObtO/CHwpgP46rt9wwRv7IuuL4S073la/rnf?=
 =?us-ascii?Q?cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aea4f1d4-affa-4d41-ca5b-08dd8e489ddb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 15:54:29.6030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1b5akXrdSz5bSJHHwgRjXiKuFyetCD+BOxtA1RhITff7JBckqibeAKGZ8IxEXiyAxrQYDFu0DnIdU5DkgPo/o4DEaN2YSfTXL/Rgvzb6Vfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6679
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

On Thu, May 08, 2025 at 06:55:52AM -0700, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: Bhatia, Aradhya <aradhya.bhatia@intel.com>
> > Sent: 07 May 2025 15:41
> > To: Roper, Matthew D <matthew.d.roper@intel.com>
> > Cc: Intel XE List <intel-xe@lists.freedesktop.org>; Upadhyay, Tejas
> > <tejas.upadhyay@intel.com>; Ghimiray, Himal Prasad
> > <himal.prasad.ghimiray@intel.com>; Bhatia, Aradhya
> > <aradhya.bhatia@intel.com>
> > Subject: [PATCH v2] drm/xe/xe2hpg: Add Wa_22021007897
> > 
> > Add Wa_22021007897 for the Xe2_HPG (graphics version: 20.01) platform.
> > It is a permanent workaround, and applicable on all the steppings.
> > 
> > Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
> > ---
> > Changes in v2:
> >   - Fix typo in the SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE macro.
> > 
> >  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
> >  drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
> >  2 files changed, 5 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index cbb9f7cbcfc0..5cd5ab8529c5 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -156,6 +156,7 @@
> >  #define XEHPG_SC_INSTDONE_EXTRA2
> > 	XE_REG_MCR(0x7108)
> > 
> >  #define COMMON_SLICE_CHICKEN4			XE_REG(0x7300,
> > XE_REG_OPTION_MASKED)
> > +#define   SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE	REG_BIT(12)
> >  #define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
> > 
> >  #define COMMON_SLICE_CHICKEN3
> > 	XE_REG(0x7304, XE_REG_OPTION_MASKED)
> > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c index
> > 6f6563cc7430..67196baa4249 100644
> > --- a/drivers/gpu/drm/xe/xe_wa.c
> > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > @@ -827,6 +827,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
> >  	  XE_RTP_RULES(GRAPHICS_VERSION(2001),
> > ENGINE_CLASS(RENDER)),
> >  	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1,
> > DIS_CLIP_NEGATIVE_BOUNDING_BOX))
> >  	},
> > +	{ XE_RTP_NAME("22021007897"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION(2001),
> > ENGINE_CLASS(RENDER)),
> > +	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4,
> > SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))
> > +	},
> 
> Changes are ok, but why its LRC WA?

According to bspec 65182, this register (0x7300) is part of the RCS LRC,
so this looks correct.  Note that you need to search for the offset
rather than the name when looking at that page since for some reason
they wrote out the name of this register in long form as "Chicken bit
for Common Slice Register4" rather than using a symbolic name like most
of the other registers.


Matt

> 
> Tejas
> > 
> >  	/* Xe3_LPG */
> >  	{ XE_RTP_NAME("14021490052"),
> > 
> > base-commit: a127cd437da1f18b6ecc9e03226d8e2b2aa79dab
> > --
> > 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
