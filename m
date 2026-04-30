Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A7FFF8875
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 05:08:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB9F310E423;
	Thu, 30 Apr 2026 05:08:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mbnukCsb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D27A10E423
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 05:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777525737; x=1809061737;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=uZ/g2XI1U1qXZKX271WVAQ0CsjZpa4F/vXfbHTJ8Snw=;
 b=mbnukCsbAxfRZX2ZSToOfnoi7UhXhPasuo9hvNrwnKXguShWhM0A20Wo
 PLearE70lCfSlLIpvb2XVSv68SXtdUBE2WtbV/LXgrp8YYshGM/ixF9cc
 iKKJlur4RPeQo403365p7D7cqsJGcsrXDdYmOULXRX+m4Yr0qFnJeBXY2
 5kgS1qNEjPZfDtwXik3WfmErrgP3GHvAzTtP9x6laCSgk77fqWoNsUul4
 p8C02UC6r1gFNXsn8a+U0xw/ajLLVyhaByWGW4/gXfUzOF4PIpFiFB0hK
 Ok9OL/jcQRDOpDDqoSXT2aXQNZ/thl8viUcuQTIxmUSGhFDRhuM3Mn7DM w==;
X-CSE-ConnectionGUID: lPwirtRMTSG13z77xZzMjQ==
X-CSE-MsgGUID: /W6f25xGRnOG0yR6Mv0/nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="82330785"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="82330785"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 22:08:57 -0700
X-CSE-ConnectionGUID: 64bdz+ZkQjCzARy8RQK6cw==
X-CSE-MsgGUID: gP3M+L0VQwikBlpncapxAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="234502628"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 22:08:57 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 22:08:56 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 22:08:56 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.50) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 22:08:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kqL3tNarC2+FdXkV5VHPWDL3cW5gMd3HhHhKIgC0WCJq0nWaXodwN7LljjvsnReaBsL6owpw10sW3tbE8vE2kVa+ixD/EUY6YxvtobZx6eOwyp0IoiAzYnyfvFyNTRhXcIWz/kvdZQ0T/fpJcUwDHkpzo/VIgLPO9o1e2Vfa4eD+BMVxT1YGP5tTxjbQsgIOrEu+p8LIYH9eJ1EZh8grNvqW7eEqB3CPYIyuN9etu2jEaANyrDXsxjyTbqs71GRaZ0BANQi2/8G62+RLUpsXeK3CLpuvsjTzAhsp3d+Ybt66fsHpT49+Ihh0isSGUYBF5jvyEJphyyRLlQdus6ficQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/V0v/9PfmvXQV1PhFBh121V17ON5lQS4BxwwQ0kg/4=;
 b=H+WFiRaO9/xylXnlRszLhgqY/z78WAvDIr14RmcUB9GR6gdsRLgCyxKVgZIsxpHd9ClOWZkTN0LK4Xg/8Gnrv/wEmSZQqJUjh/1uKcICGsg8V0puvou8RrNtjd3lZGf5oOFZW8Y/RUAGELR/pOXAXagK6OfXTK5IeljbT1BrFbJ/1Rt0k+z9lzyKgW30S32huozpTTWc3ngUkLbDD9LSVWo3xBvMEIe03r6advGfFBNuKp5aPR50SEdsHyY2GVkztEadF5eAj3ASJVoZ0DjTKjTmUyLRH3sfw8d/7dzYSvT6ZLVy8WWPZWUCYBW9XPcZMh2f41MDaqfGiPr6kqCuyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by MW4PR11MB8267.namprd11.prod.outlook.com (2603:10b6:303:1e2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Thu, 30 Apr
 2026 05:08:54 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 05:08:54 +0000
Date: Wed, 29 Apr 2026 22:08:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC v2 7/7] drm/xe/svm: Correct memory attribute reset for
 partial unmap
Message-ID: <afLj4npzwjA+NRrH@gsse-cloud1.jf.intel.com>
References: <20260406085830.1118431-1-arvind.yadav@intel.com>
 <20260406085830.1118431-8-arvind.yadav@intel.com>
 <afLieKDV/IA5Ftku@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afLieKDV/IA5Ftku@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: SJ2PR07CA0008.namprd07.prod.outlook.com
 (2603:10b6:a03:505::8) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|MW4PR11MB8267:EE_
X-MS-Office365-Filtering-Correlation-Id: 79d71415-7d14-48a8-6ab5-08dea676931a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: xSLHe661sYS0tEzzzjn0hhHXUKYoLVzK5QGv+h7N4lyV5x8MyTqXj6rbe1M8TG87PRkvFwY1gZTzCx3aG4b7oCgxwuSfDxT3UMj6WI90tWpfNdMWMeIovPJzHtyLbvyyVfVBzrwewYRCx61erSLjLMcopxEIc9Pwq4mxq2DEulPipEIuXLw6RzYoXD6DlqhsTJUejNb3Y2avPBd1a4gO4yQWJ3fuGh7uBkoNwvaHTqgGUIuhhpYj/K5VkmhZkc19c0hUGdD/zQ5w9IWEstB2aDYBsxVbwRHDynQXDkE7wFG4a9i33YwrtCVSb7413elJoD79OmdVEnzyJnTQEY1kJU+0IoGYJF8rgIr9YYBzRlHWvsBCMaUgiUIH2jNWJ3FBhAtyEFXAj8yR9BYKAdudQnslH1xbirr/e/lx4nZOAFDEXlQZcpOmOC/MqCXAjqvbKztRA48uwBavf2SzW9nLWHIQA6JxxlH5cJRnNGN87Oq2EY+HcbtaGRSmi48dlroXjnZ4Y+SbNsLRoSZ7tiTkJ9nDqm5LWE1Ya2He6zPcPTJmTTizLPA6ghFEbLMN1zM1g6gD8sYW+K/UaizpGAZMhQvBOSdLcHgRnAMsAmevDeyIKEQ8q2+uluRkOZb2mJXtjMwTQdHVOnKR8MSyRGhbhYlV/Ub+8lWXEko6gvTB+5ofWH9S8MUUTQaPJwTLceUFIuLZCQP35wxMbNx5FcYIitANOw6nyeiaMJhTc8pj4kk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?gt1svR1pSmwrB1SL8NNPpIo/Bgmdt05iepYjAe53vK+NLQau5bwv8EGjAH?=
 =?iso-8859-1?Q?ndEe6DQ3U7Rn8RjYd0Ybxdl7X6zCZlaieRj0iJBjO/gcKp77gVjKwjk2GE?=
 =?iso-8859-1?Q?KzISkySPcYmPB8/tZpEin93ugDBIwdSn6TSDtUOKqdgJ2UBY9zaR1Ip+6I?=
 =?iso-8859-1?Q?+O6joiUHftSmO5VI9rZNVdqYtyUusHjdkLPIxPeGoLPYIHAfw6TYDIxZnK?=
 =?iso-8859-1?Q?5nHl9EKVzSjflZ28q+dU9u8/JowDYp3nNz7q4qnV/7y8bvUEnYAxsLupM2?=
 =?iso-8859-1?Q?nmARHEotgyfI1GLdL71XLY1PIN+uZgYb0scBwSYJ0JTAZHyrljFSJ6E2N9?=
 =?iso-8859-1?Q?h2DQX7u1a3gj3WGm/X6+6Tpd5uUnfoltL8BVBBPv7A+z0vMELTFRPESRr4?=
 =?iso-8859-1?Q?xxP4dOdIQltCEBOq9//60s9etMgLaUaSOmEcytuJ9nycxXM52maLL7NcTl?=
 =?iso-8859-1?Q?w/fbITU+iW4xLg25CBXfvFh6qNj4p9ytOBYPcImGGTfG0oi+OpdK1C7Iop?=
 =?iso-8859-1?Q?VQwdloWC0Jav24E4KSU6JauPkViUfEGAywDH/+/F9QftueZTeldi88Ea/W?=
 =?iso-8859-1?Q?wjvmEs2aXFCqMVMcLGEBBacTNz63nfMrveq4p7h6Sc4BrRPQy+iN1MCXqa?=
 =?iso-8859-1?Q?IYDnQuoULEp6/i23cnnDgdoeXFVH7JzeCyiJC1LilUsP6DilxhzEz88N31?=
 =?iso-8859-1?Q?l+vq2tbZY9Cm8U8Y1fKHV/UZEEp7pG8bTUVrRU35keCbpPw2KiJh81JUoY?=
 =?iso-8859-1?Q?Mh63zKdziSmzBc9+VYe+DWaKq+8LpNSYI1v5F4NgTSMCWQTNm5Kub6V3c0?=
 =?iso-8859-1?Q?+TSzHihMGS2f2uwXYht5ajrfDAnHsKGXzlNW91mSR9KivlwXZdHhOInIj0?=
 =?iso-8859-1?Q?588c6vBwJdryHEtOLv7W3QoB2vY4XnDFfcSiE50Dc4XOJNToZ8Zzq6D8ly?=
 =?iso-8859-1?Q?xYAUz4BEautxtXCjKjYMRuxSBcdyRnQEp6HzFJsh+lU7464lEO3usxMjcW?=
 =?iso-8859-1?Q?rhRjXyuaJxC0ZxKVsh+lnmkEiGG4CkmFEhBlleoEt8eCUpJ+nbf9a4HiTZ?=
 =?iso-8859-1?Q?Vqc0laDyPWLBwO6yZcVYnFD3JDv+dq1SVLYgUjAMz4eU6nUzjnjwFCFKzN?=
 =?iso-8859-1?Q?hakjmCxJohDXeZuh6zOxpJoWMiKhzYBWfsv3DYjM0Hd6AmXhD8uqwuxyD/?=
 =?iso-8859-1?Q?ekEvBOUJp+xONwKGKk0CCriVOoxP6Z0J0WzqPNmtovEBR+l4K/7YFD6/gf?=
 =?iso-8859-1?Q?A9VWUfY4aSXdjxOPhj9+eMrYglq+bf23IG5o74ZxmYef97mpvKLVhzxX3z?=
 =?iso-8859-1?Q?A1p5jai2OHnB3PTpeLokQ5/pZKpfCIoi9Eh+Gl0gSfbm3cx+uOm5MW6Lwc?=
 =?iso-8859-1?Q?ENdcSyANxOboHzHuMA5+JZcgQueyn0VKv96gKZDjrci2XMHmVEps85YeyS?=
 =?iso-8859-1?Q?SvNEot//C98pIre7AV5v1xjsBvDSOfkKiqCaAojVfYdXPe1425oq7BeCkP?=
 =?iso-8859-1?Q?RCyDSiyRG7bTwWxwzMLNRCdsxmZtM1MTnBfWOutWdUZvQ0T2ygzNJIu3TV?=
 =?iso-8859-1?Q?+OCoenVytsn7xsk1awmj4wxbxnw7p9NroBSTbjDZhrGBrDvBumNeexUjpd?=
 =?iso-8859-1?Q?3ZkOjtxyOk26AADh31Ni6hKala9reIpkPlov9388VESg0MEcoRrU82i5dU?=
 =?iso-8859-1?Q?LjBW1Sfa1VfOVSKOCNl9b0bGu7UP05jwFE1i84f0RwUe7qg01TP2xIsaOA?=
 =?iso-8859-1?Q?00acIVljLNj4TLpGWaAwVMDPA84ilaO28exBde2lHVuIi//dmw74kZBWfL?=
 =?iso-8859-1?Q?5RSLDjMhb2Bq8QNJScojeo9kAlZiWPc=3D?=
X-Exchange-RoutingPolicyChecked: BoDwczkJx/zX4VBDmrl1AM79KYxf1oUFc/UaTyBcQoEufQ4Cdc+SbNkXCjBG04k9EnQU0x3Lh7bRIeNsJGVkDZFuqlBnVQBTohUqdjVenXV62R4cZF5oBiifSmuKykv51SgtX7J2DLYmkBQGOLvAafWlfuO6ybnH65Mxq6aLWIR74nKE1O4kJvpJxJiLD2gPOg2CpmVlIR4zo2Auh3O0uQV2cK8S+Tklf5wPfnuT9DIq5T57FipNoer/1fTYt9w1NzA0QruHWVrmqvOIClBOWr4OjNUOzJlp7Hfh786KRhg6Zb85CdyRKQXSXqZm7Jfu835jdiegSVqwrsAh0rQfdA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d71415-7d14-48a8-6ab5-08dea676931a
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 05:08:53.9740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S8Xm9QdpXRCjJ1lfWfvcU+XzzlmnA1vy5otg1mLRXoZScw0bN3WBgJZimdHl1zpeNCpQcComTBvcE2LKiG7cCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8267
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

On Wed, Apr 29, 2026 at 10:02:48PM -0700, Matthew Brost wrote:

Sorry double reply...

> On Mon, Apr 06, 2026 at 02:28:30PM +0530, Arvind Yadav wrote:
> > From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > 
> > When performing a partial unmap of an SVM range, the memory attributes
> > were being reset for the entire range instead of just the portion
> > being unmapped. This could lead to unintended side effects and behaviour.
> > 
> > Fix this by restricting the attribute reset to only the affected subrange
> > that is being unmapped.
> > 
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_svm.c | 56 +++++++++++++++++++++++++++----------
> >  drivers/gpu/drm/xe/xe_svm.h | 10 +++++++
> >  2 files changed, 52 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > index 89668ada38ca..f533cddf4d2b 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -58,6 +58,8 @@ void *xe_svm_private_page_owner(struct xe_vm *vm, bool force_smem)
> >  	return force_smem ? NULL : vm->svm.peer.owner;
> >  }
> >  
> > +#define XE_SVM_ATTR_RETRY_MAX 3
> > +
> >  static bool xe_svm_range_in_vram(struct xe_svm_range *range)
> >  {
> >  	/*
> > @@ -127,15 +129,23 @@ static void xe_svm_range_free(struct drm_gpusvm_range *range)
> >  	kfree(range);
> >  }
> >  
> > +static void xe_svm_range_set_unmapped(struct xe_svm_range *range,
> > +				      const struct mmu_notifier_range *mmu_range)
> > +{
> > +	drm_gpusvm_range_set_unmapped(&range->base, mmu_range);
> > +	if (range->base.pages.flags.partial_unmap) {
> > +		range->partial_unmap.start = max(xe_svm_range_start(range), mmu_range->start);
> > +		range->partial_unmap.end = min(xe_svm_range_end(range), mmu_range->end);
> > +	}
> 
> Can you blindly set range->partial_unmap.start/end here? More below?
> 
> > +}
> > +
> >  static void
> >  xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct xe_svm_range *range,
> >  				   const struct mmu_notifier_range *mmu_range)
> >  {
> >  	struct xe_device *xe = vm->xe;
> >  
> > -	range_debug(range, "GARBAGE COLLECTOR ADD");
> 
> I don't think you should delete the above debug statement.
> 
> > -
> > -	drm_gpusvm_range_set_unmapped(&range->base, mmu_range);
> > +	xe_svm_range_set_unmapped(range, mmu_range);
> >  
> >  	spin_lock(&vm->svm.garbage_collector.lock);
> >  	if (list_empty(&range->garbage_collector_link))
> > @@ -380,9 +390,10 @@ static int xe_svm_range_set_default_attr(struct xe_vm *vm, u64 start, u64 end)
> >  static int xe_svm_garbage_collector(struct xe_vm *vm)
> >  {
> >  	struct xe_svm_range *range;
> > -	u64 range_start;
> > -	u64 range_end;
> > +	u64 unmap_start;
> > +	u64 unmap_end;
> >  	int err, ret = 0;
> > +	int retry_count;
> >  
> >  	lockdep_assert_held_write(&vm->lock);
> >  
> > @@ -397,8 +408,13 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
> >  		if (!range)
> >  			break;
> >  
> > -		range_start = xe_svm_range_start(range);
> > -		range_end = xe_svm_range_end(range);
> > +		if (range->base.pages.flags.partial_unmap) {
> > +			unmap_start = range->partial_unmap.start;
> > +			unmap_end = range->partial_unmap.end;
> 
> Then here blindly use range->partial_unmap.start/end?
> 
> Matt
> 
> > +		} else {
> > +			unmap_start = xe_svm_range_start(range);
> > +			unmap_end = xe_svm_range_end(range);
> > +		}
> >  
> >  		list_del(&range->garbage_collector_link);
> >  		spin_unlock(&vm->svm.garbage_collector.lock);
> > @@ -412,13 +428,25 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
> >  			return err;
> >  		}
> >  
> > -		err = xe_svm_range_set_default_attr(vm, range_start, range_end);
> > -		if (err) {
> > -			if (err == -EAGAIN)
> > -				ret = -EAGAIN;
> > -			else
> > -				return err;
> > -		}
> > +		/*
> > +		 * Retry set_default_attr on -EAGAIN (VMA was recreated).
> > +		 * Limit retries to prevent infinite loop.
> > +		 */
> > +		retry_count = 0;
> > +
> > +		do {
> > +			err = xe_svm_range_set_default_attr(vm, unmap_start, unmap_end);
> > +			if (err == -EAGAIN && ++retry_count > XE_SVM_ATTR_RETRY_MAX) {
> > +				drm_err(&vm->xe->drm,
> > +					"SET_ATTR retry limit exceeded for [0x%llx-0x%llx]\n",
> > +					unmap_start, unmap_end);
> > +				xe_vm_kill(vm, true);
> > +				return -EIO;
> > +			}
> > +		} while (err == -EAGAIN);
> > +
> > +		if (err)
> > +			return err;
> >  	}
> >  	spin_unlock(&vm->svm.garbage_collector.lock);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> > index b7b8eeacf196..4651e044cf53 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.h
> > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > @@ -46,6 +46,16 @@ struct xe_svm_range {
> >  	 * range. Protected by GPU SVM notifier lock.
> >  	 */
> >  	u8 tile_invalidated;
> > +	/**
> > +	 * @partial_unmap: Structure to hold partial unmap range info.
> > +	 * Valid only if partial unmap is in effect.
> > +	 */
> > +	struct {
> > +		/** @start: Start address of the partial unmap range */
> > +		u64 start;
> > +		/** @end: End address of the partial unmap range */
> > +		u64 end;
> > +	} partial_unmap;

Also it is a bit of shame to add 2 extra QWs in storage here...

We likely can find some bits in drm_gpusvm_pages, drm_gpusvm_range which
are no longer relavent after unmap to create a union with start / end.

Below are two candiates which I believe after
'drm_gpusvm_range_set_unmapped' would be unused.

147 struct drm_gpusvm_pages {
148         struct drm_pagemap_addr *dma_addr;
149         struct drm_pagemap *dpagemap;

This is micro-optimization thing so could be deferred but also perhaps
makes sense to normalize partial unmaps now at gpusvm level.

Matt

> >  };
> >  
> >  /**
> > -- 
> > 2.43.0
> > 
