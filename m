Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9FDC3ABD8
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 21:50:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE3510E047;
	Wed, 14 May 2025 21:50:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ONbCxgFx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED4610E745
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 21:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747259459; x=1778795459;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NURWl38mJr8CLm7oSL1mzJeyLkkZKzgMOjdZEhKRDGc=;
 b=ONbCxgFxY41jUkYkUKk5BjyYujx4HhQshd4jYkPMNTCRFCs9NQU44jB+
 xJFZiHzpGRii8icJOCQ6p1r4mE6ZRHJKwp0gesv9Im0dNqRcnEiSXbIa4
 z5o/LcIJMEkFVAUce0WKjdlxwHpyMhBYAhTSYSpVscE2a4dIfXm6QoUI1
 tmCNepyl3VqPq5YgFYq/YIFy4SwuMk/AqaPgWk+m8SgpEFhEn7RNQ84Va
 b7GuWoS1BoytLJj/3Mr9cfCSi0s/zEKD8907at1Ul3/YFQNs3aolrJILo
 ZhBdPkJbXyzOMJHouc3OWyeMKRE0frPe7usiGEiUOHksUTngnS99mwYz2 w==;
X-CSE-ConnectionGUID: ZcVAGjp9ScmGdwV50QKbdA==
X-CSE-MsgGUID: 9v3+UmsQTditJ+igQdZ3rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="71686828"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="71686828"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 14:50:58 -0700
X-CSE-ConnectionGUID: 1xkf5RBGTjGrJ7gjMLHrqQ==
X-CSE-MsgGUID: eetx3E08QxaSCr89BRwjLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="138694639"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 14:50:58 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 14:50:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 14:50:57 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 14:50:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lkRiiJCjawMngA8OiQXWNx8OlDxX/4siZXHF6IbPKaVeh3l7MMS5WGmoOHVnlo1ixj74kq8CBaZD+VdvlmRu4xw3XZKh68CaEu4navkxHOxyKhN8r1HqTo1BAwh8+4Ta1RT4PjheMPpxhU27PloKrhuSFY9ZdG96dFtDn5XDk7TLj4ns2fpHf7VDry/y3JWamaIORo9wcPsqLTRq+MASI5HveiGYcQtcWLOltexrZ1jM0DOl/iWXUOUrvuKhx9eEVPobb/nt47+kQph1fOJSyWYP8mnyTM2vhAfJByyn1H3Id9dP/Xoj09EOTTZZx6qB5o8KoZPWDd/qi5Vc2urYbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRT8lSSDf2hBul0HhOZVJyHEajIKwgXaL9E0wToijSI=;
 b=TrRv0mfFw8YSWmazaKB4nASyK+2qDyiCNJbg0wUOAbc3mgGPcddPA7jGJusVeGtiH1Mkto5a0Xk+5ViJqnB5VjCN9bX7uuDFzmbp4B8d6rUXkffUm3V+O72b0H1lPYTraVnutB0AAT1DMxZhXhGy0/KM0Up9YfwkzrELJiyhVDMArC/vgmnasacygCAXQIanxERv+0hUga1Q6mux92Rp+QxUYFZYpO+plfOkARn4r+S820ACbldToBexhfMIpDV2w9+9c3d5dTLjUt/jUu/+IefLj5hPORjWoM143zvHwQBgNsulanwznddE/bZ+5iAl6sHaXzOeKl03HlidSRgDCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB6374.namprd11.prod.outlook.com (2603:10b6:8:ca::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.29; Wed, 14 May 2025 21:50:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Wed, 14 May 2025
 21:50:48 +0000
Date: Wed, 14 May 2025 14:52:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 27/32] drm/xe/svm: Support DRM_XE_SVM_ATTR_PAT memory
 attribute
Message-ID: <aCUQj8ns+BteyAaF@lstrano-desk.jf.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-28-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250407101719.3350996-28-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0068.namprd03.prod.outlook.com
 (2603:10b6:303:b6::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB6374:EE_
X-MS-Office365-Filtering-Correlation-Id: 908568a7-b21a-4e6f-2998-08dd93316305
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Koypt8tAZyS5n4+cLv2Xkg5xEebEmmwghM0SwOohRfiXjvb6MBgmd6S3Hazk?=
 =?us-ascii?Q?L8ZcWEZ5PPyYOBJdLFoJ7V/MCaQtwd/kmzTl+MVTafeuD5gBK0we7kPQlHxK?=
 =?us-ascii?Q?IBxu6JHuitVDSlYzgN/JCvb4Cvea34aDVS4SRjzaoZlnoHetUPvUF1hzQeKP?=
 =?us-ascii?Q?AJzwurZAvQprs3Fs65rykweBBfPgNRcWuwinS+2FZ+rNh2DKsavfvImkuGiI?=
 =?us-ascii?Q?qL6P+JJ7pkDmF6BFTwZhZRCZoEBtq7eWTFRvbDhBWpPsjdM168Uki2kd37qj?=
 =?us-ascii?Q?R6lItfVfU+VzJHgd8DmNLmghULMe/FPLQEewyslX0lWca8kVOXuqACbiMYFq?=
 =?us-ascii?Q?4BUeED1bcJSpRJzkh+8Th+veyxOH7XpsgRiKoIHNFpiX6ROnjt9i1O3gTCWi?=
 =?us-ascii?Q?YKcV6Vv4O2SqJsAfM02gfZcRPNKcQxMTpHKJ5DK1WkB/puoNKvLv6h6145Ng?=
 =?us-ascii?Q?0RWvw1SoRNZV7Kta7OZtubsyXEewizFV2UqVdzhNPvfzyuswNDw8KzBssvIj?=
 =?us-ascii?Q?vAjXZNLWyRXyPDL9N2s/stJo4uq9rtrFt3iiSQZZrhLr5bpuD6ow0jZm38mG?=
 =?us-ascii?Q?FrzvH44iXCDP8Mr4lNrxncuvhxJ2Ct3TCCgHj3n6FkNcEIU3fiVG9hxNgrzq?=
 =?us-ascii?Q?COQaI8/6s1YRZS83UyjYUu8s4VhEn5XdYcx163gH3eap60oHo4ahg2Dhntjy?=
 =?us-ascii?Q?FUqqphH9L4LHjpxKULLwcP8Ac4rnLGdMooP8ggaBFfOqx78yQQreuOIayDUD?=
 =?us-ascii?Q?JkbmEiSB7jcOE2RNstPoyRIFZN7S0uUbD/t6lt/VxK3U3v0QxjD53LwZryhG?=
 =?us-ascii?Q?qtaFblxR8eohhUbrpnGgwjlgzIsa4zGouVTxSaHsLbJbhIdIxo8bBxAlhw4A?=
 =?us-ascii?Q?xg1oiujylagzIVLuuZHW+DilppGdF5SMMIRE6fcZfd3vd7YpPYbQ01dBtLyO?=
 =?us-ascii?Q?XAS+zcFN6NfIpRq+lA2e5A9wntv6+ECNk9skrHqMGu4vR4QLZxZotHRyC7Rz?=
 =?us-ascii?Q?xZ2j6r2FqyxE8TRYznbRYpc9dYyz3SOhtMlV2X9QM8/WzSmMzZL8P6ckedu6?=
 =?us-ascii?Q?NezqSzg3vLj8VZuQ0sTIZtAHx1LX55OjdhsQkSpXkN5zSF0I94aTl113Hk9B?=
 =?us-ascii?Q?c/tU6YAlZk0QhzSxaTgPn4bcXhb97cU4fev0GNZncYTP1ULtxEpmuhH2luoE?=
 =?us-ascii?Q?i5+bA9LIF5LdWJuY0ipbHeb3YKzGAgDLtSZuBuyHFTp27gZtILCMHM8lBftR?=
 =?us-ascii?Q?evYloXuGXxgkbcBogadlU8hW/3jcAAQncrwa3Jy3qWRPUmr0ydZ6U8ycK/ic?=
 =?us-ascii?Q?Axj/r3XZ3PQrBEDmtf80ctYJ2sVWkySHTfXYtf6KFSWjMvc4Fm6Pem+MML5O?=
 =?us-ascii?Q?rOf0AG/zbXq41vL4osVsSHxgUB0sBel8GcowOuTMJujEPyQMEG86tbURYIXj?=
 =?us-ascii?Q?AfwZhoG0v7E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bVGPSLiLdcIV0SdfkVryYdWMgcVmYYxiX2/tbvkxzKX0SdymxIe+sYCENAF6?=
 =?us-ascii?Q?VSsn6nIDkTzIioBOLc1WLmfk8h32flx9NMd1XfZaM/5WHF38bSjIVFXRMXTG?=
 =?us-ascii?Q?/nbKyItAMdSJ/lr+TW1ev0XhsjY8JYbPc9Ekg36tvxwRs7zrV0G2t/b3dnB+?=
 =?us-ascii?Q?zRcySRnM6Tsd1OFA/gV4d0OZ5JZzznqfBYrwdvpSMijsi3MaCkUWe28WCoyr?=
 =?us-ascii?Q?L/CEJRvyx/5azIiYajXDmowp0urZcT/b0xilA/Ca58B4jUvKePdnhf6Q2FIM?=
 =?us-ascii?Q?kM0wLEjT4j2I5pXiNFIp0nqEHWwP0fVD380aiu6oiLMmqs4zL+rY8cClHcEE?=
 =?us-ascii?Q?3PH/mHYLI3oZ0mty8m8glYUFTe3S1x3OR5UqtxIn1+4ZwYdNPykM8L35tiYH?=
 =?us-ascii?Q?b2gwARqozcB9twiBBaBovCLC2J95qAa/SDWv2Lqkuo25GSgwVffQSta64qoZ?=
 =?us-ascii?Q?7Cv3z8CSmgK6HEkEDMptm2BjYsrq6pnB2dm2XJ8Ub+sOfZkj0hQJmi8jOX3a?=
 =?us-ascii?Q?9Fn6Um34qI+WXJvxbfpfvZDnmA6jNzqeO3QX8v3mN3h4MO2XtN8QGiF0NqUK?=
 =?us-ascii?Q?lF+cdifgnMQHBi4o5zkIuxS5o9vVKWkPmqEueFLnLH9Vac+fxFOPdV+LLp1E?=
 =?us-ascii?Q?mtlA5FSjeJJfVnfcy9hxxsvx36m5ZRXL8Y/Ybi8i3DOKQ2milu9feY4Xl1hJ?=
 =?us-ascii?Q?1W6JtHLWWWSIzmzbGzw5uAAbTNe6KgJzIJuge/JcAWdgkqofndVBsce/za/4?=
 =?us-ascii?Q?IJZ9c4r7c9QuzL0nuAMm36m1ouOs9VX/F2xO7a1+kyktCfyXQQyJUDZZkjCW?=
 =?us-ascii?Q?GRNDZUjcMNdAfq4iVcFxWbUAOTDQyQyfkGcHr6OG+mycJLEYIwcLiETT4CdJ?=
 =?us-ascii?Q?hW3kX866zbUhvyCqnGra9hc+5Dw9J79Z6DpbCLGz+ARajK+8bOJX388zrS1H?=
 =?us-ascii?Q?fk2GHkniuSp30ZBavfBPVBRfd6HKWZ00wCMkpdsa/gTe+6FiQE3sGKea0urF?=
 =?us-ascii?Q?D35fwa0ts0jX47u3Xo9QW9OQlE5ifW/vUIJaP4RVb1RfJF4GOFarMss+aupi?=
 =?us-ascii?Q?itgsQIWXdaja/0vtekOEnFui8HKdnZi2kZOa+ut5qLqNLR2re1Hm3E2pgy84?=
 =?us-ascii?Q?QXk3FBkYLE6zeFegW3pjrtS0YEgwHVV3RIEUDR80l6jD8ZUsguFJ/BhCuyhC?=
 =?us-ascii?Q?VkdrNetXAq0+7SlMnpjYZZmna23taGqk/RjuNxXKlGRab3TTL4bbcvIvgGUu?=
 =?us-ascii?Q?UII3nrsqNYfw4w0wPVB8IVPiIAw4X/us5Gtvb6SFI5xUe1Jpu56l+7QIqfjd?=
 =?us-ascii?Q?IgTRM2GrlY/+Co7Gest9tQAqeaF0FpVPeUyiuCTVVuUXNAGUO5Xkyb4ubBsY?=
 =?us-ascii?Q?IMfg3bLOUsCJW3lZS0aXUkaaaLngBUZOTmwvoAobCs1G3aX6bfPG65hmTIkr?=
 =?us-ascii?Q?jqkk0ECS+HWYkl5UpEAJbiHVi2qYjHAg4LdktYT2AN9uSnQhnZniFBsq36F6?=
 =?us-ascii?Q?BaA82bBCP5j3y8+XPDF6THvwwx4c+l6ZuknhaUdyZ7XXEnZgopiiyLNWWegx?=
 =?us-ascii?Q?tG0mfgjv8cjO/Vv4LPpc6BbBaQJa9DQafgTTvUp7y1L1aleewqASqfCr6dYn?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 908568a7-b21a-4e6f-2998-08dd93316305
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 21:50:48.2043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WkS3iVRu0CjPLwxXYiyDm2QKjC1oCvGeUjuoE15bcJGTi/H17puw216Y4aHlSRHVE+L7usIER8Lk55eJ6jeaLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6374
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

On Mon, Apr 07, 2025 at 03:47:14PM +0530, Himal Prasad Ghimiray wrote:
> This attributes sets the pat_index for the svm used vma range, which is
> utilized to ascertain the coherence.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index f870e8642190..f4e0545937b0 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -104,7 +104,14 @@ static int madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
>  			     struct xe_vma **vmas, int num_vmas,
>  			     struct drm_xe_madvise_ops ops)
>  {
> -	/* Implementation pending */
> +	int i;
> +
> +	xe_assert(vm->xe, ops.type == DRM_XE_VMA_ATTR_PAT);
> +	vm_dbg(&xe->drm, "attr_value = %d", ops.pat_index.val);

I don't think the above vm_dbg is all that helpful. If it was per VMA, I
could that being a bit more helpful.

Otherwise LGTM.

Matt

> +
> +	for (i = 0; i < num_vmas; i++)
> +		vmas[i]->attr.pat_index = ops.pat_index.val;
> +
>  	return 0;
>  }
>  
> -- 
> 2.34.1
> 
