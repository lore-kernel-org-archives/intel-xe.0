Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71654C021A4
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 23:13:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F55210E16F;
	Thu, 13 Feb 2025 23:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lwQIt7SO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E3710E16F
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Feb 2025 23:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739488399; x=1771024399;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Be+6hHf0xbgKUyM1V2YTD7fL3vp7N/18u3mjaOeQM8o=;
 b=lwQIt7SOMV6FAvPrlliIHdyRW9yRg9eUyMGkyCrmDyu3Bo6bmZlKINWd
 uwSj19QxGIrkBey1kJsBLDXDBpOl5INDtTB+ueg3Q3yXZxFbL/6TYXgrP
 asMoxIu6/ayetb6PiBO6eDR4QzxVlROfXExlziHn01dQad6C0orLgJF06
 ME/v5z8MIXgjdPMbrWX2Q1NbkLbHTYgSXQMleRzSCWgPXK0CFjSd3pXsF
 X0j1noqZ/Q+R+U6ZhVnh/T2s/iCEfBLc8yewsIi+a2kNTrMXUNPQs1rag
 +lx4r0NXU+pBZRwc3c+JkCVc9r+oDxvga0O1ONShPsdzi65W9z2uLHik4 w==;
X-CSE-ConnectionGUID: wz1Y8XNSTxazKhVuBF5qMA==
X-CSE-MsgGUID: OFvDInikQ2S3O9ubf4fAhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="57622543"
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; d="scan'208";a="57622543"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 15:13:19 -0800
X-CSE-ConnectionGUID: 1TTuB2fjQS+eI/ExmaqYiA==
X-CSE-MsgGUID: 6OSZlNWpTBy+9jFA7+otLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; d="scan'208";a="113169574"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2025 15:13:18 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Feb 2025 15:13:17 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Feb 2025 15:13:17 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 15:13:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nT3rVlFYZCMNd2lj8MaF+knTc3HjB3P+DEUOy+k8KVKMdhDRoLMM+/doNpYJS3GLdk+JyMoCVF24x8bVRbljGgvzb0BMtKqk0aEQZreHe+NePlcwul5WeX5fniaE9Nx7TMsMYt3SvFSVNGkimnMI3j5Qt5f99nJZzYF4WjU9XFeK2SfGDuBB0TjlgP4cisdfvHUsjfbFEyMUWfZoZ8vIpg/+whNuzFlV+4eqo0NeeXvDD+b33wPROY3nZSG9T/r1t90WH2x6VY7qnaMb1Wk7FYAmhDcT8GlphnFHMKkJIUvkCPFxiekjTAxyV09gNM2j8/3Lk/jymfC/S7UuWkC/IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2NkhXW4SkZE4hf+BpZa1p0sAPLh5KRsUetqg3LsPT3M=;
 b=DpnF4xQKGLVI3xeqj8eXuMUP3/up7bmj1pcFQi8kuCBKfPOR9OiLTms6ovwcF7FcbarhG5y5k4j7WJfNKDKDETA+k0lNs9JGuc2dxk2r2EqKKe+zeHjzZN7+Y98qA70FQInx12UNI4zwrjWcW0WNf5UTLcNQEJo7NosANV9VbltIetsgpI1ppXOS/4/oBw4ISYuEcsHAh6QRN/2njnZJk3ObjsiwWgtp+VOlVFisxCKP0nCwfiCK9WrAj/dNS9xTxEN5eS28/hX7rTtkNDPIft1KCC/dG7HmutHaJJG5DNybr3wsYxmqWXUmEB7qvrpNf8SIgb1tulhHOm1Z/tAfKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by SA1PR11MB7061.namprd11.prod.outlook.com (2603:10b6:806:2ba::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Thu, 13 Feb
 2025 23:13:16 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8422.015; Thu, 13 Feb 2025
 23:13:15 +0000
Date: Thu, 13 Feb 2025 18:13:12 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Fei Yang <fei.yang@intel.com>,
 "Shuicheng Lin" <shuicheng.lin@intel.com>
Subject: Re: [PATCH] drm/xe/debugfs: fixed the return value of wedged_mode_set
Message-ID: <Z658iN54wTvgbaa1@intel.com>
References: <20250213223615.2327367-1-x.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250213223615.2327367-1-x.wang@intel.com>
X-ClientProxiedBy: MW4PR03CA0245.namprd03.prod.outlook.com
 (2603:10b6:303:b4::10) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|SA1PR11MB7061:EE_
X-MS-Office365-Filtering-Correlation-Id: 242f0551-aa36-4c7e-346d-08dd4c83fed1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YJ8qBrASPl1AAtxDY5v5Lo4HhwtB2gzHq5608klI6kc5N10AWSdiSXA7THHA?=
 =?us-ascii?Q?oHmnckmxGZ6gQZyPzQZqQIEHDKit2kznqLxCoWAhTHALEUGnyEnfI3Svciuq?=
 =?us-ascii?Q?H0JU+dLbxY0uiaTktdzlMvJaKv0M1LmG/W8YjJ6z3/Sr1BY7XX8EcJSrmfex?=
 =?us-ascii?Q?2s/YTa3KTHpjd33CPJ6sI674qzgsGP1POu59IYmbPcgpZdxTOv2oOpEqCjt9?=
 =?us-ascii?Q?nI+eBMVGrqUIW2iAeJ2mMQ11WnONa4b8RuDliq2Z/6Kn8buAV7mHQG0JgdWe?=
 =?us-ascii?Q?kTQuwMdqQKpsC/mPyL+Chm2lyZixs9zNeARxdFheOrtfp31j5DZLOrogHHbI?=
 =?us-ascii?Q?e9uG0uE1jE5h50ZdQG5VpkpdXDM0rWgwPIPlyxHPEMnGXA4DFa/WEeUvudWH?=
 =?us-ascii?Q?1OXQgWd4KQ91BZOiJEJNkY58kVI2wo16lK+xe+RP/8pttnkQ2tfaLR8BBqsD?=
 =?us-ascii?Q?2ryk8UWkAU6EIGKz/oYOP0tcfxb6ywjTrkNfRx6OiXVQma2xeB+lfZ5fAurH?=
 =?us-ascii?Q?hqV6DtkOXooNuQ6UA7trTxWBC0cDxbw6HunWM1YHBxxESRgfl97cB1nSIRZl?=
 =?us-ascii?Q?7mq9QN37cBLttvPjIM9oHHw668Sdw7vvsHO8++xIHl0HF7l7X4dIVV2rWn31?=
 =?us-ascii?Q?nTdyLI1g53mKDCsT8ku03uvf6oZ4avxpFwFl4XBnRbKyrYwSJGXIVzEvDDtV?=
 =?us-ascii?Q?VD8LQVWojBlH2vng4FYI3adxRu3xBzd6bq62qzgveB5jyX4K+rSwfhPgwuzP?=
 =?us-ascii?Q?bHmY92suPUUpmBVguijLobDyDEe5vsZAvNkpGwhBfDbaOuPjuvH0SWQSkg0S?=
 =?us-ascii?Q?R7vNwY1XEpVfR5fW0eXTGlYPy3VGkKAIPjgmPxrGZBfJNOt96rollRTdRCHC?=
 =?us-ascii?Q?hpPn81LMEjQ6ZxKJPjDzcqKEoL0DZxplRmgsqlmGMN/1eOMXt9Ci0AXis/x7?=
 =?us-ascii?Q?x747Tpt29Gg8laxKdZ3kdLg/kBk7DDdtWBC7i9jWQla/PH4Jfc3gxgxJhmbq?=
 =?us-ascii?Q?vHgBdSOsffuXao7CuQxXOCz5fdhey2iQiHFiRSNbWU75dxkQsMobU3FXOaga?=
 =?us-ascii?Q?gsFDDSJItHG5tKeFccDQ5zHL7tLN210tgkTzRHs5T3zVT8BkheCSeFKPrsto?=
 =?us-ascii?Q?gIB4Vkg2cK0y8ZxlWPFkSlHZ4+gSDqWZrVOfIqj6lxluPF/9h3TEKSls8c2P?=
 =?us-ascii?Q?VT5rl8L8rwNPynYuFNed+inUaOgkbyn9G9tpIv+xNDp4iwEKzWJMcUMQrPPb?=
 =?us-ascii?Q?VA/s+P7miHLDDsV7/zZKk+mL0WbhpxXNdaSqMluuI1HpC6ELwUOeLybKe6Lr?=
 =?us-ascii?Q?X+wP/rkyaX4QPLMgrvnIfCW+pPvGhyTa8j/JgR39JvJzG4JMLVQ+DWuBUxhR?=
 =?us-ascii?Q?eLkCOXdoWIwllGxLjx49uhIH6DGN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RPaQX40SAXhg1tHPDaFFboTz7a9GRaAOKsqgEklhjOP6M9XcoBgaN9kcT0WA?=
 =?us-ascii?Q?QSJo/gk5CKA0SZHOAVeWOekGg7D+3UUWRjNGfjPBHQC8AN3KrZRfPK0mQ3LG?=
 =?us-ascii?Q?vTG2QqaVZBAAFLe/LyFwOw4fqvYFCRO3+FlrELD4bQO2oOrozGX4sX7ZBE0J?=
 =?us-ascii?Q?AJ+f500YRCRkQ2YOufhZegD0/lYzcOOgu2QyTb4pVhMyjhLL3BaqNbZUlpzd?=
 =?us-ascii?Q?F05GlZGHUjKHAzk1z91Qi900Cdt9VPEigCn9DgTGr2NeQ86zlTIhG6aUtX6j?=
 =?us-ascii?Q?QVlfM24qF9NvgPAYYVmZqWEF+gUo8wNrMYniiH/P/x5q529YjUjJGVB1Ywmu?=
 =?us-ascii?Q?RdBF6bNwTlzKqmbJnGopPnf2HUugHisZMUs+XOMIklWy6ejFq/R2oXLvToz2?=
 =?us-ascii?Q?BYxkB5hLxE9bkA2aQvgHzhH5A8kNUpjSkhIisvhujC7ANl/zm/tMTMHPIfU9?=
 =?us-ascii?Q?bl5pI9XjQIxbPiERgT1C4m/9ccOtO3ijRb3VwdVOijY8kbVRkpCpGJzUhFXZ?=
 =?us-ascii?Q?uF7cu9ZxOxOw+EUVU5VMqVDgIVYOQCnJDEZr4u5GrU3SGpGeeCwjeOLkFg4w?=
 =?us-ascii?Q?hsnf9h+RFVuOnxvfog8CNJDF16RBBkZs6HKQuDWDiXmZSHfsoN3K13ybYIwZ?=
 =?us-ascii?Q?SuX14v4lAv2N6iZ6Oh7JjUkxjOoMasaXS9PlAP5qWclDDhqxsatGG1PcZUWt?=
 =?us-ascii?Q?z7IO6GbFk9z828M+FWaW7m80DVjKb4h0VGuaQDtODSmdS23O0eDGQ3A+SkmL?=
 =?us-ascii?Q?mYtKANTrisV3IH/9ielA4snEzlG9TBgKE1aZ8WIsC+c2tBarBCAeIZfYVzpA?=
 =?us-ascii?Q?sij5CWft56EqaOp2nG+rE7ooFERzi5N5M9kIONLwQQwyF1p6oKHHLgR+1zNW?=
 =?us-ascii?Q?M05HVNg11tSJ8BdV6gESEMOtQ9fHsPcyQtZT9kIav8Jv6k0LJrPJr9YJCrwE?=
 =?us-ascii?Q?9QH36g0ahV7Lo+1qxSx0a54stZWZIRINlR8NWCs59RLiwT65fHV+5M4HBK6M?=
 =?us-ascii?Q?PDj9nOFs2FwdDcwgyOlUsY/Az3a+flp0ptCUiFxWd2UWIdKKczqujYAhYi7P?=
 =?us-ascii?Q?Jsmgq2BNiH1v/SRmr7CqQq+CPBUwlyrlEWzZ2vnTkS+TyrRJISZfdFke2Vwh?=
 =?us-ascii?Q?5k63HI4hngvVbu/C72nglHs3MeAhaROG+C5JGyB73Ql2OIG1tb6J7fHyQI//?=
 =?us-ascii?Q?d9INZoNDc44tY3YWLW48W0b4v1xgexeQF1TasxqwDBIApUqTzD0IYKamnJkC?=
 =?us-ascii?Q?4TNqx0KhgdPo6vQbNY/KjpY4PMYPImMYCI1u9BcgELZ2CK3JMYrnr9BcZ7TC?=
 =?us-ascii?Q?DHTkmMcz1lMJso9EIurrKDtDubu4/MNz9r4XSUAdQh60JqFKZANugx+JKwuk?=
 =?us-ascii?Q?mEAwBGlxA3PnM51DSGovctIuJgPKyKyIx+UvoG2/EjyIlayhPjroVMcAGmY1?=
 =?us-ascii?Q?Y6HrKqFrtYJ4gmKkf2zhhsAqlCiaP/ZvnapPiCWFFo+livS8cIQL0Pi0sJ2s?=
 =?us-ascii?Q?4X5ZjeRoofDRIGPfuG/aF5r//MAwO8Z7mE2ZOdoUjrFTQQI5xWaLOD7LDQ7v?=
 =?us-ascii?Q?HblPCagiCOi+b1qzf26CXwslVth+fWvxDvKN6y38UamZWInxCLsYmfX62GaE?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 242f0551-aa36-4c7e-346d-08dd4c83fed1
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 23:13:15.8592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CxLGCD55HHULMih3TqVbpJzBGy5C30g1LX4Vk+vpgnSTs4reEXghWgYEJFPWYzqn38h1hexi3wnmBSg5sBWccA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7061
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

On Fri, Feb 14, 2025 at 06:36:15AM +0800, Xin Wang wrote:
> It is generally expected that the write() function should return a
> positive value indicating the number of bytes written or a negative
> error code if an error occurs. Returning 0 is unusual and can lead
> to unexpected behavior.
> 
> When the user program writes the same value to wedged_mode twice in
> a row, a lockup will occur, because the value expected to be
> returned by the write() function inside the program should be equal
> to the actual written value instead of 0.
> 
> To reproduce the issue:
> echo 1 > /sys/kernel/debug/dri/0/wedged_mode
> echo 1 > /sys/kernel/debug/dri/0/wedged_mode   <- lockup here
> 
> Signed-off-by: Xin Wang <x.wang@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Fei Yang <fei.yang@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 56cb3788e752..b46075edf60a 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -167,7 +167,7 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>  		return -EINVAL;
>  
>  	if (xe->wedged.mode == wedged_mode)
> -		return 0;
> +		return size;

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  
>  	xe->wedged.mode = wedged_mode;
>  
> -- 
> 2.43.0
> 
