Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B959DD1267F
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 22:21:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C66D10E701;
	Tue,  2 Dec 2025 22:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ldxTvNLR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E4410E6F9
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 22:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764714114; x=1796250114;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yNggKpQSmN49hrHLkOBmmGLtQCn7S1OYQJMJryEMo6o=;
 b=ldxTvNLRMKH0xXtF6EZXL17jkNTPgTk3uAQYPWjv7lAzjbinl4pdDJHA
 JUhQgmq5chiXG3HEJGdGW4kycwKbcqhHcfxewjccZ/H5EStB4s48mx4EE
 H/uHZ8uzvxlxr8t8I3Ar014Z0uquxIU/z5eK2CytnMih9RIZe3tt9G6p6
 sKnIF7iBBEe2RlN5zQmhckd5LFEy26uIi6OL77/x0CPoEPCyNLPofalmx
 6IrlQNN35n6RMjs2Y7NghvfakPDZ1Q5tcLUyXwMUKBBB9pPjYcB4fcujv
 RN8liPRGN0zvI0iEd64Tm7C9q3rjjwQMDdY3nh0TnO/BlCQ44r9t9La+0 w==;
X-CSE-ConnectionGUID: ek9GbHBpSD+Vo2lUwUZcmQ==
X-CSE-MsgGUID: tlfqmeBLT8aaNaJl+eBdKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="84097518"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="84097518"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 14:21:53 -0800
X-CSE-ConnectionGUID: 7jySwBXLQNauZAvi/V/vBA==
X-CSE-MsgGUID: ASfnC+P5Rgi/FT3jtXowKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="231836644"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 14:21:53 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 14:21:53 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 14:21:53 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.0) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 14:21:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wqs+4hukyMgy5YUllm4lR2yD7+3Bk+Yxho+D7s1AWotb3eynYrsAHblIQITMvq0jtNp4yuxLSBBHd9UjDMlf8G563CJS383hmStSsGzzpgNfxxE8CVKsbIuMc0Apq4YSf2G4wh3MN3x6czh0remrV8sgCFiVV2XP/1yn0ZWFFEQfAH+Qr9zwgnFVDWVg1tdLVzi71K0GbnY7YloOLu2G7EcyOq2lcdGyNeC4dOTe/93eMokAWb9WtAsDbKkh4UhpGR57nT6YFuKidMUsiyESEJ/Nuq1Jh2TK41F8tiijT0achN+m3+bT/wSa/58ydFwHNdyemsEJtLN/DEsIyBK5lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TBbGUpk1pXs+CSdDookRLrmAp7BWFdvPZNgecNR6EgI=;
 b=hj/95blN3hgRQkGLrtQbCbVS86+Mep+Gef00hazNbuq63/QthvBl2/j54txVrQ7ZKkd7+Xs2CatyC9l2+WS5H2dUVs54ssNwwvC910oKBi8MbXe1vdDBY/dn/CUT2IvPAseutPDx+DFdJoCB/AaMrFfwrsXDn24z4tWv/qgSfvUkkBj/NwusyywJPE2ZN9z6vcW3MXtbIVdFVzXd+wl+dC40HZgi5ahbRZEp+K17TNL1VTovye9Q+4N7/4Bwm4gD05sfqwpO0So7g3Dva3DaPkq151yaiHrplUjx1hm5K9ScdmV+pf7Sn2qJUE1B3gK8De6xI36MFZXsMOBVdeDNCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ1PR11MB6153.namprd11.prod.outlook.com (2603:10b6:a03:488::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 22:21:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 22:21:50 +0000
Date: Tue, 2 Dec 2025 14:21:47 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Nguyen <brian3.nguyen@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <tejas.upadhyay@intel.com>,
 <shuicheng.lin@intel.com>, <stuart.summers@intel.com>
Subject: Re: [PATCH v2 05/11] drm/xe/guc: Add page reclamation interface to GuC
Message-ID: <aS9meyANoPkhw1Ix@lstrano-desk.jf.intel.com>
References: <20251126230201.3782788-13-brian3.nguyen@intel.com>
 <20251126230201.3782788-18-brian3.nguyen@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251126230201.3782788-18-brian3.nguyen@intel.com>
X-ClientProxiedBy: MW4PR04CA0260.namprd04.prod.outlook.com
 (2603:10b6:303:88::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ1PR11MB6153:EE_
X-MS-Office365-Filtering-Correlation-Id: 41b3946f-7ff8-4ff1-1344-08de31f13049
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1V7iHg6/ViEH0Zn2tl0Mn3o7UtHR6OY+ioEZqbZhXxMiPpxbRiBJir/twuG6?=
 =?us-ascii?Q?0iCi0eqwAJ+1AwJSk46e03gAO+Nlb7Jf1o0LWNRLnhlSSK7TebJ0d8wfS8cn?=
 =?us-ascii?Q?ES+pQi2VPJEeKYbYVbnOUwEd22vv1HMttM7lnzR4rsBIAeqtdzy7MxODXlFb?=
 =?us-ascii?Q?jKwQMypFH20NGUc1lFU0A0MA33tPG1PVbMwm8kQDvc26eMHYNMS3eoTXMMzv?=
 =?us-ascii?Q?RVbaMXkuGTbYVP0wYYrG8ycvYi9qjn14YX6E6hlS3pPOp72ljEABBfkq/rlK?=
 =?us-ascii?Q?OtGA/EFcTVNYW+JL8WCyKi8UNCoSkagzZToh1OdbAdfi/x7mk54+uEP8aexB?=
 =?us-ascii?Q?gpQr6uueaWEd5OHQ6zlFW8icALab0Elc3S2P+EL29Ftx+bNqNn/eRHLGcfPe?=
 =?us-ascii?Q?KgE4a3g5rQfLs4aTuny4x3QfZO2cynXQ8vOZReoyq9DnG8ffNcHyamITNsnI?=
 =?us-ascii?Q?UdM29oQQ4o5ImDoO+IiudkNfY/3kGyOsR3Q9eYM/vGITuf1oqeyAUoyxoyPD?=
 =?us-ascii?Q?0f4ngifocy5Apm/4htS7yfMk+6AOOlcjrkZ52FjZxkoxg1dKOxg7y+5Z1RLU?=
 =?us-ascii?Q?tXmGM8Q3Z7AU8fv3N+MUT0TVppgbmjgNELeWjqCRzpyLe6AKiwaqCnVOvRKf?=
 =?us-ascii?Q?Cyt1D6RgWZE0MjfPk4HrKBGJVjRs+wg2cDq5+zKh9R8mzM1NX0cVD89fX9Fh?=
 =?us-ascii?Q?Vch7F7o7F9eIq5gWTdaTSocAZOV1VxRdiiHRrLwisWaRKE3BbI6R1wF6H4A7?=
 =?us-ascii?Q?WtkJfNT6sSOaVkMaI+MXWBz2XJpy2SfCLQAhxbp2bjTocWUEVXVoxlME2ETL?=
 =?us-ascii?Q?Dn5eGCXo3x9e6geE8btnbqBAkzpw+EXF3pAaO4kHuZHYkR3e1/vDYF3sOMJ5?=
 =?us-ascii?Q?hfg9jEhA7MG4NbWvwYiWQDp7pZSss44G5PuD+7I4xKlaCubNmFC7iaPTVAep?=
 =?us-ascii?Q?ypMFYwcOCANglf5YY7aSKVxFI3kLHAEcJtNiYVy3dyAY9ozKVNfyzOjWIXrl?=
 =?us-ascii?Q?nl73URrhLrqISMKSOhu3uQBtlq3XlblCeRm2aINqW1k0ttriL8OQ7bTv7W42?=
 =?us-ascii?Q?1E/WNAVJ/+D6BE2Qt16drdRPyQqdAqeAIRvdBsAuwHvRHcDVbHjRwPW7yPYD?=
 =?us-ascii?Q?UzIByu4aSSHRp+R93fFv5vApw0N6CT8Ec+bLHF+x5CytolL1MWTLB013czO+?=
 =?us-ascii?Q?d7yxNvcvANWz7C7AZ9WO6jTZuxsMBk7MGXFpkOA07WjmqcDld8MlqC46XfRB?=
 =?us-ascii?Q?zaX2Qcf6R9lCmtWnXP1Lg4ktNuglddNFozViWyT4i3TUFuETw2tR0kqW4+/7?=
 =?us-ascii?Q?jz0OQw2qSkpgZwXLp1KIfQux7kkScvS771AWD1u19jJU2L75ENql1/K+4kKd?=
 =?us-ascii?Q?md5vhgyeHwQx+/psapa74Rxqf4rPmoe/k9zBPfDvd4gK0inscjRgSh9ne1lC?=
 =?us-ascii?Q?OIw88/7yjn1FC8fQKMaoEyNRlQLrtzcc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oDKJlQG7ep9DXLmbDi5vUhz3E3BSFE8FCwUKlPw084SpHpGdLie9VmgF9x2i?=
 =?us-ascii?Q?vf+ELjrYzHmz7I6mX3Clx65g/bSLfxJhUfImK4/kfmaTwgCRp8mW2VJec4pl?=
 =?us-ascii?Q?XAE8Z8RFAyd3JuBKS3UZQitni2O9ZKMdcmv6XDQsK7rE5/EpuyjSwhoXzlAs?=
 =?us-ascii?Q?/uRttGeJB/gzEr8BbGtuv+KBwbX+hRq9VUjKjoexzAt0LAlz2wu/Tu1Yr9x9?=
 =?us-ascii?Q?nA5Wm0WIcs1CT3yuQEzamEvQUY4Kxd3h0XA7VKs2Eqnlc/H61y0ZgvyZ/a8k?=
 =?us-ascii?Q?JCq9AABrQsZ3NcBUsQDV3HNFAlJWpv2ghL7mKkxAKdo+0Jxdo1SvvBmOvkxk?=
 =?us-ascii?Q?r86BcbgMSzLNvGT+oiKaNuckTYHhb1aMbAA99c+CfkBB3aLrpiNoRsNg6Ma7?=
 =?us-ascii?Q?kGOr6GgiDg75KHgXVh9Mk+MZ2iI4T9yT0V+jRFg17qWhNj1VJdMVrbPXl8qz?=
 =?us-ascii?Q?K52ftFkI8CzMN2kZi+InngISmE+PYtltXA79DuPkX+NjiEzTMhx8xl1BVMnC?=
 =?us-ascii?Q?0yV6iUATjDozC04K9HgZ8MPt/byo6vWxl7UMWyeKFLAlcHQRbqFSCf8TiuzP?=
 =?us-ascii?Q?mAzulPNGFzN92eeVO9LevjrYuH5SnwSp6zQF5F5/2aj/8FYnbMH8EjKa+Tqx?=
 =?us-ascii?Q?KMt3NQo6aYfMDRGtFUtIyIr1zdL4M1dn7TgVQ8XgiFIq66pvZz1VIfP4d29X?=
 =?us-ascii?Q?N55mxlWng5FwxAy2dHezqxDI0IcjrPBoDU+f4bSZpaGcZnnwPq4EaP9qv5LV?=
 =?us-ascii?Q?QwugARvO9t77pAX20QIwpZKhkdX5/c+pbjcK4hYEInkCuYuFXTkQcwdWAHJd?=
 =?us-ascii?Q?iKy7RDRzjVtZN9u23z4vRTxJ9OexwKqNf5cce2AI8/hDWkkHsIiHHsmJsMzY?=
 =?us-ascii?Q?FUKImZL4IOT0lRzQ3AD6eG0ivR1AelW+n89zaBCGhc6DEURTzJATRYndiiGb?=
 =?us-ascii?Q?lArtrDRIDg1FkyuCY0zWvyRUPxvdu8BvrM/ji7CPnMBjk5RaqMjfOMug07Xv?=
 =?us-ascii?Q?LMLwdd43Sr/Vp0pfSomc5rypIrDsoC1QPfBafOyyE67f83uUm6WzFjkgC7lE?=
 =?us-ascii?Q?YR4H9IqHHyv/Ecg+QMSeCqOLks49+Rng64br2etJGeLWYckI2aO47jI0aLdr?=
 =?us-ascii?Q?Mj4hQX5P4xtAr3OkPByvEq5yvl39Lm1QCWEswYeqR14E614FBF32pYnB63S/?=
 =?us-ascii?Q?la/e8RlWZLqxiX4QP4i84mwpZoQ9jOnVudd40b20u+CxdJls8VWiDQyuhxFj?=
 =?us-ascii?Q?EeAkT4+s+AzVp9Smsj3dXyKuXHyvIYO0y9KdB3eF7aRk4KOvNjErvaVcAHug?=
 =?us-ascii?Q?aQStL2UGZQEmxy0C7x9ae4AIGzgWIemgdOm5MYuYf3kBKLVwOUvnNQL/HMpk?=
 =?us-ascii?Q?Dm30ale97TSmWsAoTY4bCO3pf7d/djmL68ZjgIHJfM89HGQiqXLfloD6kYwT?=
 =?us-ascii?Q?zGgSdeB8zgzC6jpMG3XgC9gJEmdJCpKA+9djPkg0dr2KPYVF7uuoDE58WJD3?=
 =?us-ascii?Q?AqZPIh+9sJC9PnvE9rgDE+BgyYcBCGfkKfjgq9bcL6UJGTI6F4ufkIoQ/aX3?=
 =?us-ascii?Q?pIUjLnZ0VEwPpWLWIar6ryxnPkIA1+M34Y39wX39RwJmlYG/po2XLFUVTCDS?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41b3946f-7ff8-4ff1-1344-08de31f13049
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 22:21:50.1000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UwVpDyuZF7thut/CNUoBbpeTtywnedv356ypmj92Nq7WIi6cdJi6cwjPdY9yhcjvm/xSIyByImuvzV6o40o95A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6153
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

On Thu, Nov 27, 2025 at 07:02:06AM +0800, Brian Nguyen wrote:
> Add page reclamation related changes to GuC interface, handlers, and
> senders to support page reclamation.
> 
> Currently TLB invalidations will perform an entire PPC flush in order to
> prevent stale memory access for noncoherent system memory. Page
> reclamation is an extension of the typical TLB invalidation
> workflow, allowing disabling of full PPC flush and enable selective PPC
> flushing. Selective flushing will be decided by a list of pages whom's
> address is passed to GuC at time of action.
> 
> Page reclamation interfaces require at least GuC FW ver 70.31.0.
> 
> v2:
>  - Moved send_page_reclaim to first patch usage.
>  - Add comments explaining shared done handler. (Matthew B)
>  - Add FW version fallback to disable page reclaim
>    on older versions. (Matthew B, Shuicheng)
> 
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_actions_abi.h |  2 ++
>  drivers/gpu/drm/xe/xe_guc.c              |  4 ++++
>  drivers/gpu/drm/xe/xe_guc_ct.c           | 17 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_fwif.h         |  1 +
>  4 files changed, 24 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> index 47756e4674a1..11de3bdf69b5 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> @@ -151,6 +151,8 @@ enum xe_guc_action {
>  	XE_GUC_ACTION_TLB_INVALIDATION = 0x7000,
>  	XE_GUC_ACTION_TLB_INVALIDATION_DONE = 0x7001,
>  	XE_GUC_ACTION_TLB_INVALIDATION_ALL = 0x7002,
> +	XE_GUC_ACTION_PAGE_RECLAMATION = 0x7003,
> +	XE_GUC_ACTION_PAGE_RECLAMATION_DONE = 0x7004,
>  	XE_GUC_ACTION_STATE_CAPTURE_NOTIFICATION = 0x8002,
>  	XE_GUC_ACTION_NOTIFY_FLUSH_LOG_BUFFER_TO_FILE = 0x8003,
>  	XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED = 0x8004,
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index d6672cf30d3e..89b206c1eb86 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -767,6 +767,10 @@ int xe_guc_init(struct xe_guc *guc)
>  	if (!xe_uc_fw_is_enabled(&guc->fw))
>  		return 0;
>  
> +	/* Disable page reclaim if GuC FW does not support */
> +	if (GUC_FIRMWARE_VER(guc) < MAKE_GUC_VER(70, 31, 0))
> +		xe->info.has_page_reclaim_hw_assist = false;
> +
>  	if (IS_SRIOV_VF(xe)) {
>  		ret = xe_guc_ct_init(&guc->ct);
>  		if (ret)
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 02b4588fece0..b9e406d69414 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1369,6 +1369,7 @@ static int parse_g2h_event(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  	case XE_GUC_ACTION_DEREGISTER_CONTEXT_DONE:
>  	case XE_GUC_ACTION_SCHED_ENGINE_MODE_DONE:
>  	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
> +	case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
>  		g2h_release_space(ct, len);
>  	}
>  
> @@ -1555,6 +1556,15 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  		ret = xe_guc_pagefault_handler(guc, payload, adj_len);
>  		break;
>  	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
> +	case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
> +		/*
> +		 * Page reclamation is an extension of TLB invalidation. Both
> +		 * operations share the same seqno and fence. When either
> +		 * action completes, we need to signal the corresponding
> +		 * fence. Since the handling logic (lookup fence by seqno,
> +		 * fence signalling) is identical, we use the same handler
> +		 * for both G2H events.
> +		 */
>  		ret = xe_guc_tlb_inval_done_handler(guc, payload, adj_len);
>  		break;
>  	case XE_GUC_ACTION_GUC2PF_RELAY_FROM_VF:
> @@ -1720,6 +1730,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  		switch (action) {
>  		case XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC:
>  		case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
> +		case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
>  			break;	/* Process these in fast-path */
>  		default:
>  			return 0;
> @@ -1756,6 +1767,12 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  		ret = xe_guc_pagefault_handler(guc, payload, adj_len);
>  		break;
>  	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
> +	case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
> +		/*
> +		 * Seqno and fence handling of page reclamation and TLB
> +		 * invalidation is identical, so we can use the same handler
> +		 * for both actions.
> +		 */
>  		__g2h_release_space(ct, len);
>  		ret = xe_guc_tlb_inval_done_handler(guc, payload, adj_len);
>  		break;
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index 7d93c2749485..5aa6fb249be9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -16,6 +16,7 @@
>  #define G2H_LEN_DW_DEREGISTER_CONTEXT		3
>  #define G2H_LEN_DW_TLB_INVALIDATE		3
>  #define G2H_LEN_DW_G2G_NOTIFY_MIN		3
> +#define G2H_LEN_DW_PAGE_RECLAMATION		3
>  
>  #define GUC_ID_MAX			65535
>  #define GUC_ID_UNKNOWN			0xffffffff
> -- 
> 2.52.0
> 
