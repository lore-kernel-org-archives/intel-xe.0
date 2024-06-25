Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0BEC2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 05:22:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF02F10E1C8;
	Tue, 25 Jun 2024 05:22:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NihVnK+U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B163510E1C8
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 05:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719292933; x=1750828933;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pTQvoLbQhaEBUQc9IhdsMrsybnihs5xctNSvuVi3Fzg=;
 b=NihVnK+UQzuAJc/G0B3NLd1OAP2PfPJ6hzVVUhT3JCKvgniLHl8psdp4
 wZWk+d830YZJxtIlBBC8oxSr9ZNFeNwnzA2TtMnDmNj8+nPmXVIlM6cy6
 rZcs2UPT9YiNBNh3w/zlS1szx0UiNaZVem//697qUT5Yt6iCnCshaupni
 iDfA5zergsh9tn02rgKBwKD5JC7WLjR6OoKCUe8T8SwKUjCNEqcCTi9sP
 yygbzbB3LibDxK20RlQq4lYAg2anf2foZY3ql8LGMbB2gBeETsGAKdTMs
 dy/jMdQ5hBh3QJ+2Fg0faUZCiTrsGE8Uu4Q8E4WqbWw71xEKCgV8xW8ZN g==;
X-CSE-ConnectionGUID: XuvWos7NQUq0Jg6yKIDgiQ==
X-CSE-MsgGUID: NEvchAEfSLeA3G1xNX0Ipw==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16416373"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="16416373"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 22:22:12 -0700
X-CSE-ConnectionGUID: 5WPew+CCQ0+YJj6jDEe7Zw==
X-CSE-MsgGUID: /BOE8Ls4RTy+l+jvyv1Heg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="43393423"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jun 2024 22:22:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 22:22:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 24 Jun 2024 22:22:11 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 24 Jun 2024 22:22:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M3BFs7ra9LI7fHMpGl336dqts8f3breMoiEhYXlyzJqA3rLoEFKMWtLqb4HK23lHga2T8KUh1g7I8KpfUST80A257AP1/lh4a0+7u4yXdpz+/YN4CtHkDY4si72tnnff1cmt9UkdBWOodAoo19wcyhOPMwi9mAld2g3ncqXStl3MB3rJMyPcN+A9n2dt3ZidrXuxxT28ThdZpa/5C6ldsqZFwK9koVYa4ou/sVEJVijHEHeNA9RvHtmT+LcwRbSGSCzBjJIUuMlwISNh//knXOXFYbwhSWdS7O54Nf+HxeLV0qTEOzm/g50FhlGdqLf2HrWt89wv8VIVDQnIJEyb4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hYa5abYEXNMkYGP69ofZciGJ1KkUiPlduTAwPhneEdo=;
 b=mOapASGzOtf94vXAxHDMjr5ZF9A5gCjNwI56X09j3bELkzO8abnMkebVa5qobQuo7PBNkp0EhWKv2CJfPmhe7L4xhyxKkp/HyDqMrDIraZf5d3dQDpeQpJuKW89zdVZXj1DuVPvu6ax1aBWq3zVv7mgyzJoe/V/o+g1IefRYRXe+hiioHkomtOTkJIEh+GGojASFEG/vY13UaSnOe29mFzKkf4hT9isvZzzA865VndOBTbg71AR+BscPtBzOH0yF0rgRuHOUSg/HSMYdiXjDA2J0rv5pIKQa7yQUncWk28/eyqKSafpSMtwM2OQRIeucQ4EPfd3EeaTZEvRpIHiFDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4611.namprd11.prod.outlook.com (2603:10b6:5:2a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Tue, 25 Jun
 2024 05:22:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 05:22:04 +0000
Date: Tue, 25 Jun 2024 05:21:28 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Add timeout to preempt fences
Message-ID: <ZnpT2M4SH5TWzqTS@DUT025-TGLU.fm.intel.com>
References: <20240624224844.3950026-1-matthew.brost@intel.com>
 <ZnpSpcRuM0dUgu3S@nvishwa1-DESK>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZnpSpcRuM0dUgu3S@nvishwa1-DESK>
X-ClientProxiedBy: SJ0PR03CA0086.namprd03.prod.outlook.com
 (2603:10b6:a03:331::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4611:EE_
X-MS-Office365-Filtering-Correlation-Id: 3498f675-6bf8-438e-33c1-08dc94d6bfd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6idqC7er40DJ40dRV/Oml6Y/oU3MpLNcDZIWSz2wlJG/3WxCTg82N2Q85zcH?=
 =?us-ascii?Q?9bg8SQrrqYCNbgnrU6U3fTECyE5iOL2USp0KGJFZZsX592wA3PEQgu5FpC4u?=
 =?us-ascii?Q?QxHPGrOPhqtJE7Y1rclpmiszfkNh/s/FIm8giKvA5sLjy5yzj7Lv5Ap6J5mb?=
 =?us-ascii?Q?J/jYrBle9s5U34nNiyqy5RGGfR84bx6UDMMvC87NJ0YZ9QKCJEFIFxnn0LlM?=
 =?us-ascii?Q?t6fNNxxQP7vt25H1eYS7YMKXw8qDPuKP23NwZBYdCiBjBgy/98VOa1jJJufb?=
 =?us-ascii?Q?Enu1mXm0msLWh6aeczJcQ7AzVUyhUO7Lg4+CNRocuUTHFWVZOfeP/htUeZAJ?=
 =?us-ascii?Q?tCcfdqEVf58B1+xNQLtTikJ/nYb4EG/euDWZJzMMnk2IWlTi2MUDM3LM6aYN?=
 =?us-ascii?Q?SVOhZtn2ZHgn2Ije1BAS+mMCkaP6Vz7GlyOu1ZN+BOUcSokI9OtcwJzlOd+T?=
 =?us-ascii?Q?alh4OsNSew3Q1azwtBW5gQwesTnVbLEuFlGVtFvOYkvLHxcRk8KUpQQNRFxb?=
 =?us-ascii?Q?FzyO8afO4EtKC5muPpmxLx+YClFKwb/I4+YXBe63iJ32pvjrKmawIGAgylJ9?=
 =?us-ascii?Q?Jqv/d1NLEdDkbaeLnZ8mdS6IGakcgBL7To1jJibcxwCfk7+z6wCPu3leqVNN?=
 =?us-ascii?Q?4rJcc4EFHdhgLXKTOEQE769ccXFDVOf355GZqEojqnwMrzCRjWXVCJtwDCvy?=
 =?us-ascii?Q?SliSWmnMbU2Rd0mSH31NYS/0nEShe376t72u3axMUMmA1CUfiax4ooqOpjFc?=
 =?us-ascii?Q?DismCrhsaDfE35ol6WomhZy4oKn4Q6rBo6AUi2fczZJyxOW4+U4OsuuPPxzq?=
 =?us-ascii?Q?puaY/TiKArujnKNzgq2+/hGOxm5U9kf+H2FZkKshwrucLT9/9QH+Rtn7+Cxg?=
 =?us-ascii?Q?89cpCG42lzp8Y5m0kJxK9Zp5oQrbzZNdPMxAHPX0XhBSBfR8dTs3tnLrtZOs?=
 =?us-ascii?Q?ek4FuPt4Myy/SjW/gLAqj4DBL0IRoSz4WjMgnibMa5RoBRQY841Qbww9T33O?=
 =?us-ascii?Q?zH70Sx9f7mV955MJJ44us0eOA0+yLx/3aLdMzF/LHx0inxCOiWwwC72Upj12?=
 =?us-ascii?Q?3fBXtJZflsxJAhNraOvymnwwtd7rzxNTitlhHoy44SYa/jL3Ycm3dRuCHNaf?=
 =?us-ascii?Q?P4m77aj62UkrRyLu+1GPaMIgv9CgsubQvSxyOj857DjSMsP4HkyFQrf1NHVt?=
 =?us-ascii?Q?i7jnmFkKowdT+3dGEiRp7hUF13Lds2swADL0FU8YYx4Zs9tsjKT6apmSqLi8?=
 =?us-ascii?Q?DNKL+Xqc7TS8nqfnBOIkK6XMdF+RzGvw6IgiIBZvsNeBBKp2pljguCIyZtSe?=
 =?us-ascii?Q?IbOFV2Rfba9BfqdO7t38SNdQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GlaSkfIcMj4xsSvTfLEfMWWWpp7cEMt5DCiBKCAuzly4sK0vV+PtM+uJk9wo?=
 =?us-ascii?Q?UaogVmBIoLBE1T70nqteA+nEo9eBi800Wwq9dXgYr6qFEbP1sGF39cUqqwuW?=
 =?us-ascii?Q?4z197EtjoJx/S5FBbebgXBKsGYd4rUnUTOV4ZBp/7MhpfpHhcDs/2zco3pZ1?=
 =?us-ascii?Q?us/pOiXeBD8MOrrOJ3DkFZc22onO6fWK/H1DL4N3+ykj+3ufD/vimWe6oL1/?=
 =?us-ascii?Q?7pgylrphbKUj2lAwvk9+jspqMGp+Ul7t4JsYppdpySoi32ynOfflpJaME82D?=
 =?us-ascii?Q?54soG6NuDeXyvzwJUJNTQUXxriCMJv9RGoW/1gFfRxMgiQmAG8O6OTW2jjhr?=
 =?us-ascii?Q?m4SQ9bCRKGr1eQLJHgq39crGVs9jJtF+pYYQxusWRwMe16r3nuTgRzLyqQPX?=
 =?us-ascii?Q?jBMCnPItSud2JARStUZ4+X5jHUjVNMg+++uovzR43eC4KS8AGXa3CIqfrspU?=
 =?us-ascii?Q?tRMMTj1pEk/jOuYjt1LNWXoE+ZV6ebEVN+0FpiI+vuosyKYwnaXDCwxiW9Ra?=
 =?us-ascii?Q?X8HL8x46k6W0d5OJPBNp8mtaqmLvrjD81oay0kcTru0VIXzH7bvbsBdefudc?=
 =?us-ascii?Q?BENig5hVt1wopDu8WzGQkrEDeH4z9n/YtFId+TTc4qWv/mTIM845Wy70CIr1?=
 =?us-ascii?Q?DsIfBfDPtQWIPf1GV9cxm454g+b3ayTANAbFaqLcRIb/LV0OdQukUwOmYRVM?=
 =?us-ascii?Q?GkU8HqGcd28AoQYnhY2SCg/TpWAhYi5LScGylefWOdPS8WjZGXd5EiERoIzP?=
 =?us-ascii?Q?NGjy1zd9DcL9jo22PRxJCG4NerEa7nZ1mPXXTgKuCbscp7EowVYuX1AMYHrj?=
 =?us-ascii?Q?Au9dS8oJZtNJ8/Aiqef920si8ZoJfzueeNb7P03vsHymobSgf00BowwunbLP?=
 =?us-ascii?Q?pqWrzB3cCCqO1gK7QZRD8wTz8t3q+DohRzwIZtPp9iBIP/UgRwjhumNglrS5?=
 =?us-ascii?Q?d7w2PLbxmIb+K7dxtWJGqHFtPf5BNNSuGW25eUsAvAgHQdBYwaYVHBovtM6n?=
 =?us-ascii?Q?fDKQ3jdgcrnlG7qySahlUVI6p3K8P2m8FTzmkKARWKquq56aV/PSQLpZDfv1?=
 =?us-ascii?Q?gwmLRd3Y30SOv62++BmvjirGxcP2A4et9+RIy1xIXSdaKDyBFOUeltayJaUe?=
 =?us-ascii?Q?LmkHIDB9ANFb1t4uyI56pAsp9wLpzyIz/dLB6efCubk7ghxIlEKwL4PYmIfg?=
 =?us-ascii?Q?EEySvtfUsj0PcIMj5r8dIMy6/IFP7KaYECUWG/rdYLLgkqdOjXQrupTojeMd?=
 =?us-ascii?Q?+75h0Fcz/uraQS+O0i5YeVSpbMYU6ItD8Ajw6rYKRENRdMRNnIODf7Y6TAUw?=
 =?us-ascii?Q?92u8YEauks1Bp/hLzSdU/NiC1zF8mXuv3uq9DJK940eWkZm2D1ils781BVSN?=
 =?us-ascii?Q?BMwBSiyjzMkJPA47PqYKyUXwOHaFNKBcq202bGPQgrvPzoJv6fS1AIHnQmY6?=
 =?us-ascii?Q?F4fJl7h1dQQNdb1lJrB29Q0x3l8yckGwM8fWc1aF7v7UqGAYubY99AhVNsjc?=
 =?us-ascii?Q?nVmP0+q7FUQPZTSXiZw2VWQgEDCoekFw1f4QCvopmxWmN0AORP9/cwUSJOYA?=
 =?us-ascii?Q?e4/g/OwOAbZVmMTQgs32r8eJE/BUdJS569byQydEKJ7aDbz42p3xzFVBFZlt?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3498f675-6bf8-438e-33c1-08dc94d6bfd1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 05:22:04.2843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AkeKrQHd9mwJ/EXZ7Z3i2TwCSceTM7/Y/wx4mJA1DdFsQ33qntNDEaQggikiwXTVjXwa49WSEKEDrT3EExKpsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4611
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

On Mon, Jun 24, 2024 at 10:16:21PM -0700, Niranjana Vishwanathapura wrote:
> On Mon, Jun 24, 2024 at 03:48:44PM -0700, Matthew Brost wrote:
> > To adhere to dma fencing rules that fences must signal within a
> > reasonable amount of time, add a 5 second timeout to preempt fences. If
> > this timeout occurs, kill the associated VM as this fatal to the VM.
> > 
> > Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_exec_queue_types.h |  6 ++--
> > drivers/gpu/drm/xe/xe_execlist.c         |  3 +-
> > drivers/gpu/drm/xe/xe_guc_submit.c       | 35 ++++++++++++++++++++----
> > drivers/gpu/drm/xe/xe_preempt_fence.c    | 14 +++++++++-
> > drivers/gpu/drm/xe/xe_vm.c               | 10 ++++++-
> > drivers/gpu/drm/xe/xe_vm.h               |  2 ++
> > 6 files changed, 59 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > index 201588ec33c3..1e51c978db7a 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > @@ -172,9 +172,11 @@ struct xe_exec_queue_ops {
> > 	int (*suspend)(struct xe_exec_queue *q);
> > 	/**
> > 	 * @suspend_wait: Wait for an exec queue to suspend executing, should be
> > -	 * call after suspend.
> > +	 * call after suspend. In dma-fencing path thus must return within a
> > +	 * reasonable amount of time. A non-zero return shall indicate an error
> > +	 * waiting for suspend.
> > 	 */
> > -	void (*suspend_wait)(struct xe_exec_queue *q);
> > +	int (*suspend_wait)(struct xe_exec_queue *q);
> > 	/**
> > 	 * @resume: Resume exec queue execution, exec queue must be in a suspended
> > 	 * state and dma fence returned from most recent suspend call must be
> > diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> > index db906117db6d..7502e3486eaf 100644
> > --- a/drivers/gpu/drm/xe/xe_execlist.c
> > +++ b/drivers/gpu/drm/xe/xe_execlist.c
> > @@ -422,10 +422,11 @@ static int execlist_exec_queue_suspend(struct xe_exec_queue *q)
> > 	return 0;
> > }
> > 
> > -static void execlist_exec_queue_suspend_wait(struct xe_exec_queue *q)
> > +static int execlist_exec_queue_suspend_wait(struct xe_exec_queue *q)
> > 
> > {
> > 	/* NIY */
> > +	return 0;
> > }
> > 
> > static void execlist_exec_queue_resume(struct xe_exec_queue *q)
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 373447758a60..56e7a340696e 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1301,6 +1301,16 @@ static void __guc_exec_queue_process_msg_set_sched_props(struct xe_sched_msg *ms
> > 	kfree(msg);
> > }
> > 
> > +static void __suspend_fence_signal(struct xe_exec_queue *q)
> > +{
> > +	if (!q->guc->suspend_pending)
> > +		return;
> > +
> > +	q->guc->suspend_pending = false;
> > +	smp_wmb();
> > +	wake_up(&q->guc->suspend_wait);
> > +}
> > +
> > static void suspend_fence_signal(struct xe_exec_queue *q)
> > {
> > 	struct xe_guc *guc = exec_queue_to_guc(q);
> > @@ -1310,9 +1320,7 @@ static void suspend_fence_signal(struct xe_exec_queue *q)
> > 		  guc_read_stopped(guc));
> > 	xe_assert(xe, q->guc->suspend_pending);
> > 
> > -	q->guc->suspend_pending = false;
> > -	smp_wmb();
> > -	wake_up(&q->guc->suspend_wait);
> > +	__suspend_fence_signal(q);
> > }
> > 
> > static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
> > @@ -1465,6 +1473,7 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
> > {
> > 	trace_xe_exec_queue_kill(q);
> > 	set_exec_queue_killed(q);
> > +	__suspend_fence_signal(q);
> > 	xe_guc_exec_queue_trigger_cleanup(q);
> > }
> > 
> > @@ -1561,12 +1570,26 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
> > 	return 0;
> > }
> > 
> > -static void guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
> > +static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
> > {
> > 	struct xe_guc *guc = exec_queue_to_guc(q);
> > +	int ret;
> > +
> > +	ret = wait_event_timeout(q->guc->suspend_wait,
> > +				 !q->guc->suspend_pending ||
> > +				 exec_queue_killed(q) ||
> > +				 guc_read_stopped(guc),
> > +				 HZ * 5);
> 
> Do we need exec_queue_killed(q) here as we are anyway checking
> for '!q->guc->suspend_pending'?
> 

Probably not? There might be a goofy race where suspend_pending is set
after exec queue is killed though, I'd have to really think about this.
For safety I'd rather keep it as is.

Matt

> Other than that, the change looks fine to me.
> 
> Niranjana
> 
> > 
> > -	wait_event(q->guc->suspend_wait, !q->guc->suspend_pending ||
> > -		   guc_read_stopped(guc));
> > +	if (!ret) {
> > +		xe_gt_warn(guc_to_gt(guc),
> > +			   "Suspend fence, guc_id=%d, failed to respond",
> > +			   q->guc->id);
> > +		/* XXX: Trigger GT reset? */
> > +		return -ETIME;
> > +	}
> > +
> > +	return 0;
> > }
> > 
> > static void guc_exec_queue_resume(struct xe_exec_queue *q)
> > diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
> > index e8b8ae5c6485..8356d9798206 100644
> > --- a/drivers/gpu/drm/xe/xe_preempt_fence.c
> > +++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
> > @@ -16,11 +16,23 @@ static void preempt_fence_work_func(struct work_struct *w)
> > 	struct xe_preempt_fence *pfence =
> > 		container_of(w, typeof(*pfence), preempt_work);
> > 	struct xe_exec_queue *q = pfence->q;
> > +	int err = 0;
> > 
> > 	if (pfence->error)
> > 		dma_fence_set_error(&pfence->base, pfence->error);
> > +	else if (!q->ops->reset_status(q))
> > +		err = q->ops->suspend_wait(q);
> > 	else
> > -		q->ops->suspend_wait(q);
> > +		dma_fence_set_error(&pfence->base, -ENOENT);
> > +
> > +	if (err) {
> > +		dma_fence_set_error(&pfence->base, err);
> > +
> > +		down_write(&q->vm->lock);
> > +		xe_vm_kill(q->vm, false);
> > +		up_write(&q->vm->lock);
> > +	}
> > +
> > 
> > 	dma_fence_signal(&pfence->base);
> > 	/*
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 5b166fa03684..6b8ff13f0aff 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -311,7 +311,15 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
> > 
> > #define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
> > 
> > -static void xe_vm_kill(struct xe_vm *vm, bool unlocked)
> > +/**
> > + * xe_vm_kill() - VM Kill
> > + * @vm: The VM.
> > + * @unlocked: Flag indicates the VM's dma-resv is not held
> > + *
> > + * Kill the VM by setting banned flag indicated VM is no longer available for
> > + * use. If in preempt fence mode, also kill all exec queue unlocked with the VM.
> > + */
> > +void xe_vm_kill(struct xe_vm *vm, bool unlocked)
> > {
> > 	struct xe_exec_queue *q;
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > index b481608b12f1..c864dba35e1d 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -259,6 +259,8 @@ static inline struct dma_resv *xe_vm_resv(struct xe_vm *vm)
> > 	return drm_gpuvm_resv(&vm->gpuvm);
> > }
> > 
> > +void xe_vm_kill(struct xe_vm *vm, bool unlocked);
> > +
> > /**
> >  * xe_vm_assert_held(vm) - Assert that the vm's reservation object is held.
> >  * @vm: The vm
> > -- 
> > 2.34.1
> > 
