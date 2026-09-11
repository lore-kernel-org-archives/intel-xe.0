Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8D2C88E50
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 21:58:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB9F10E1F8;
	Fri, 11 Sep 2026 21:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X2NIEPz8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410D310E1F8
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 21:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789163937; x=1820699937;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ukoxLWhRcoNSVCgz4MJEChtPbK8OAHKKU4pob8u2QLQ=;
 b=X2NIEPz8mRpy5bGnh/YidbS4FOz9AiYOF2kvWdrg+A7L4Q6Vn9HyK11n
 QhwsWp69s6vZKT2QcaKVe24zSkUh5WMLIbF5p2xRM0q+0/0VTWU7Sus2q
 1MsMZEAd+S5oNenydYqWrOz21h6tKkIbdx5scLQVPn9ojZzKIZ/okWUBe
 aMmES41LLLwLLI138IIz2+qEb6XgC5GqHesV5qytBbDCyIuLCz4XA2WEC
 /MXtWkn7uTU9eFjudxgVxck/LErS7lChLvploCdKPWjGJKMfWKXFWGZqs
 5zhu5zxSI9tEV6PwqzWCM3CvALjvrnFqZPLlrmVSHONiwDTgmlrXtUbbo g==;
X-CSE-ConnectionGUID: Tnnm+T7cQs6CyFO18YgsLQ==
X-CSE-MsgGUID: vmf6xn4SQlSc20INqpMrWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="107140472"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; d="scan'208";a="107140472"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 14:58:57 -0700
X-CSE-ConnectionGUID: W2gqiwKvTbmKOE1zNYH6PQ==
X-CSE-MsgGUID: 1DRhpMs7QkqmSbjUOIH+HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; d="scan'208";a="276188951"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 14:58:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 14:58:55 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 11 Sep 2026 14:58:55 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.51) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 14:58:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uejDG3n282+99ugNmh3e6vMuzA2Umw7iL/BpsFvVC7KUyM8+680zR6YGJwpvMjCbVbVkz1B56YInWQ4rdfCsZNtfmBtos87+Mq3Eh9nD+ksupVJGAcS7uP7iXG07ZfZg/1xEByNXqhoTTi9B45vaIb968z9AXsiPNOw9OzrI0JblH06i9yFfPIOO0zAZ+bghO3RkhozltfpWV0XPjZj9DomRiXf64JM7KsezElo24/i0bgvcAaqslD/HsVlugMdPtjLAMhPUF/p6x/ajKj+239pSttSd23XvMYcsc5N2u8M+wRuXsnUmyG5Jo8ZCyi5wjUHHr2ju/qP5TM26x/sPEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7slkzn/1PfnynlHEqz4fLcZj3TIEQgqFinYJqx+qKk=;
 b=HMJMxmTm8fa8HmpUVeFQD3Xo53Y5dW5ygu6IU3namP46SCBECzou4tRuAlxS5uV4jd7As7Yze3Iu8FK3ml3fguV2A5Yf1GVSbnhT7zCRHBmpzfjz6TQPRVF1uFCQ0g0Iq8Qs8y5nZQ7/Ndu7xz9jFwjU19bQWMHN42H5gQwCb8aYKe0LQ0prZaK/4ixWzTiyaywiIyxNC/hstrCgNzMIynWDt84r071s498Xr8ZaufeCymK5qcNg3iAKfQ3BhMlZo1D920lYhVLQPiIxYh22zkVpHl2yHXj5WCuINY8Q9/ZRNbeDlstmQwUCP9wlRHkIOfYzzy+ngRxuJFbMb4GKKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by IA3PR11MB9064.namprd11.prod.outlook.com (2603:10b6:208:57f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 21:58:53 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 21:58:52 +0000
Date: Fri, 11 Sep 2026 17:58:48 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe: Inspect all forcewake bits for runtime
 idleness
Message-ID: <aqR5mNSXKbICZKKU@intel.com>
References: <20260910212823.2358362-1-vinay.belgaumkar@intel.com>
 <aqMsfvRS1Ge7Ke7u@intel.com>
 <8a6a5fe1-4965-478e-ab80-71a4c353ed21@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8a6a5fe1-4965-478e-ab80-71a4c353ed21@intel.com>
X-ClientProxiedBy: BY3PR04CA0001.namprd04.prod.outlook.com
 (2603:10b6:a03:217::6) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|IA3PR11MB9064:EE_
X-MS-Office365-Filtering-Correlation-Id: 79837236-9760-48e1-851a-08df104fdd9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|6133799003|4143699003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: iRmFVHwHEh1KQ3rozXHACA2CESg5U6rAtPsGekjoAV6CXe7PODhgp65yj5BUFuI9CqqLIGtAMC/UiHzv/E5ui2NErDEY5h4UWV0e+MHsJ2uzjsPWrrhJCKMuN7dAeIX2DD8NQ45LZmaq074bfAEo+JJipC4TnBI4RBgU02swgLww4aBTuJ41YVOETetkXhJtGOmQz2RTXh5d5SPIr/g1wwTesva/ZWlndl6/jxg3+CqTWS4D5GlMyk00TZXEE3XGQbNQ25JXyrguuJOp0ifXdZZj0g3BWqemMKeW65YCKqi6fXYVQ+ZLpw9Cf6+/bIsA+JXrRp/eBCtcm9QYJ7/12GjwqTI+Tt3O5Xkn+Hxo5+bu+SAFj9fXxUpE3pBxQcGcGzKCnN8PC8vWYPXGMO3Oab26+wqLhc96iDbuwlOy69Dj+KEfHy+x2OiD2Y4rzQotAxa+Up8iFOXBtzuS3lQ7W8jZHdYwYCXRJ0VSExdt3Lc4jOzKIhRwY+2nMUxGUkPUYjJj4Fy7tmXTvr/hAZ1TflWfA2Jci/DJBt4JUFN/ofZFikl8FakPmi0zaDckAvz/TO5Iuj9R2h4u2ypIOgOeOEDCPSSrdncyGUwOlnQc6wJWyeVZ3dOUtFvK32SWCYKtfPKazUrEn7op0y1jUk7l4WidbWfYX0VUq+dDBYzx5+o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(4143699003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8W7fU4UuO1/BA0SCok4XfAs5fMn/zHJVndQm0CTMX49p3DokEIAW4fzDFe0S?=
 =?us-ascii?Q?6lKwBqEmfZo+vZ87n0YGSRfK1+0uOJ3xMgMkuS+uHSM9XUAjN3bqQsGh8DmY?=
 =?us-ascii?Q?LA9/H70StPHuWNqluQ6z9EiA+0AvYV/KWIQ8MvZVaJTFQ5lR+MtiQa+w1tLg?=
 =?us-ascii?Q?otgjsEeKl8qqpup+Br/lPtZA8c6f49duWLDmlo29xxsIj+0rirw8JftwUZn0?=
 =?us-ascii?Q?nfpw+6C+mEJg2PhbDMzOST80aJnM2JLE6XdaroUdD7W9+Dj+WASmxN4tT5Mi?=
 =?us-ascii?Q?ShldM9PUFCG4IkmK6CR+rqHPZHSUmrdLmnRUQu1xP/FXgHkDMR/dkFBAY1oy?=
 =?us-ascii?Q?J176Tk3mL9JJHfUFSVU8p1ADp2lX29y14qsZ5Qnf9OSHqP/qwuzxKy9ZvZ3H?=
 =?us-ascii?Q?xU73ur6S4wr/9Wm3M8k93LWBqrV8z7xA1yQCE5AS88BAv8hikjfkRVRo8i5O?=
 =?us-ascii?Q?u7UNiyy3ZhtEyVPxJ98uO1wo+au+QK/D+qVsGrbasl1Ln2k7kc78ZKuWoU8l?=
 =?us-ascii?Q?3CAU/olLpWfPYHr1DHJbfr9QV3EeGplkS3/E64+mKedRq2ogfthtgsAO7ZKL?=
 =?us-ascii?Q?RaRXiilzbVsOan5ubDOWkQLh22y19POLiSLUjJBwWHGVa6jZ1qUC5KrzWQyO?=
 =?us-ascii?Q?y1Syy7YFVZqZdinDrpaqoNXAOkDa50fdyDk3XLSbaaN8tL3W2WThNy1wnqoM?=
 =?us-ascii?Q?xaPi9fd2QPlq2NZwFP5vNhlq7rVsWpf2vkKndPeTYS4jE2A9kn3r2Rwg1fKc?=
 =?us-ascii?Q?+hJN4kPOtwK4fhEVBaDhp7h58gUVMe2LwDt95jPT7rubx56B0NyIAxEMJeTK?=
 =?us-ascii?Q?4zwhnRJIn8oT9sU7uiCpzRgmOBs0vFyw4ip959X6GVRWYpotqGxiAy3k9/yZ?=
 =?us-ascii?Q?ROw7eBHBlfwwYvXm9WLxL++yadg7mZcOUa8lgzm4KmHd60OSjyaVU7Jmcut8?=
 =?us-ascii?Q?ypQgu5KE2V2Lilwhx8Qu1bJrUj9ehf9NMCxF0mprIWgaR7Qa3hMl5cdSjzGU?=
 =?us-ascii?Q?zGyEWFRH2LPuqbO6LCCFUbrXzs1Lco3p1zsz97wAf68i4JMdaAnTsrxUWs3U?=
 =?us-ascii?Q?VOcWkNh8VtRaSE4snbHCt2riUMVa6eoujGXtwCSkgQdNJbbipI60FeZwQRpM?=
 =?us-ascii?Q?atB1wNLHNuSOmkDGA8ebvPI+amGey4qKuP/uw2I/578P1r5IJ7T8pblrjouJ?=
 =?us-ascii?Q?N/ldPauXkw7AETjOikiNfIglLCPmSF/3YGnL9TCpOgjixayhyGMz8ndMkdBQ?=
 =?us-ascii?Q?ALCZ2+f66akuD8pVFM8rlVsKQYjvBCcIRabDT3XNdN/szQ50WZGTtALNeuVh?=
 =?us-ascii?Q?A3BwJqYS3oDM3HdZCDJn7vQiPrlvSx7j2fhtacrhJSRroe20ato3bVwfBHp9?=
 =?us-ascii?Q?GpuJxqE46Fy9LT//OAWduhafyXxlbsF/mtWWWrku1uzSqm7EgrJR5xs5aBrM?=
 =?us-ascii?Q?JFu77eFLxRsLedBRO3levGjrLt8G95Mjm0p1OvjM1r5/ITrwZACxxITYl6cj?=
 =?us-ascii?Q?U7JK8PqF7MoT1TCX3lEVbiNF6i6+rBwOqnnOiqeIpvVBMG1m+PkZqaSxLRbV?=
 =?us-ascii?Q?G0Ql6zh5/sQn0teIdrgeKy09DORIf3Y83h63Pu9bM7sXnOxwJODNh8TxMqK7?=
 =?us-ascii?Q?Iag8y3SOaqCQNCTYeSINUYoxo1o03Q2/vXZqRigEAaGsQUri8Da9PyKzdMvW?=
 =?us-ascii?Q?6TTT4DHHizfIcVeCaRVgbYXJ7N+J+aLiTMaEiDD1MP7Ap42pz5gCcUD7FRHH?=
 =?us-ascii?Q?i1Nhr3PcdQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: RpekfKHxnVe2Kx/dTZKGYw4rNeCtcKCKm1KwGw1r79pu2TriAxigOt/NwxvyIOtUji988xxQfIi+fq9EHW3PjzAk4Pd9xVzNzTJ0qtN678GvlGvsvZjDvMzFyeK8cWpOJfMA1VeDrnH1CzcO9DMbVBpQZTLSzLhHhOm8BlLjd4UVrGqb2X2cTKfcRIn0SM87oYucT/gbannOQ6n7DyigGd+ARVayOYUAirJyIfXKM+InIvTl4Q2TJAx5JoJ1e6rTDEeMbYfBkKAFRnaghSaAaJbY6NBRwmWk2mPihzGIHoAK7iNRvNxEUTdNcRHuI7mKX4Q331ov330xz727yqN3xw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 79837236-9760-48e1-851a-08df104fdd9e
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 21:58:52.0115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H3m1XoFmYQ70da2masAdmB8bShk4RKjcU3HdvGEKP4A2IWXFlODjbsLpcOBC+iyr9l16Qq32Q2twASZqhUPNxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9064
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

On Thu, Sep 10, 2026 at 04:00:40PM -0700, Belgaumkar, Vinay wrote:
> 
> On 9/10/2026 3:17 PM, Rodrigo Vivi wrote:
> > On Thu, Sep 10, 2026 at 02:28:22PM -0700, Vinay Belgaumkar wrote:
> > > Inspect all GT force wake bits in the idle check for runtime suspend.
> > > This includes the ones not typically used by Xe KMD as well. Skip suspend
> > > when any of these bits are set, since it could mean someone is trying to
> > > keep the GT awake.
> > > 
> > > Also add a call to pm_runtime_autosuspend() inside the idle check. This
> > > ensures a PM subsystem retry at a later time.
> > > 
> > > v2: Only check the GT domain FW register. Other domains require a GT force
> > > wake applied before we can read their registers. Retry if idleness check
> > > fails (Sashiko)
> > > 
> > > Cc: Badal Nilawar <badal.nilawar@intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Assisted-by: Claude:Claude-Sonnet-5
> > > Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_force_wake.c | 25 +++++++++++++++++++++++++
> > >   drivers/gpu/drm/xe/xe_force_wake.h |  1 +
> > >   drivers/gpu/drm/xe/xe_pci.c        |  6 +++++-
> > >   drivers/gpu/drm/xe/xe_pm.c         | 19 +++++++++++++++++++
> > >   drivers/gpu/drm/xe/xe_pm.h         |  1 +
> > >   5 files changed, 51 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> > > index 197e2197bd0a..0acb796c756c 100644
> > > --- a/drivers/gpu/drm/xe/xe_force_wake.c
> > > +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> > > @@ -148,6 +148,31 @@ static int domain_sleep_wait(struct xe_gt *gt,
> > >   	return __domain_wait(gt, domain, false);
> > >   }
> > > +/**
> > > + * xe_force_wake_any_bit_set - Return true if any force wake bit is set
> > > + * @fw: struct xe_force_wake
> > > + * @id: Force wake domain id
> > > + *
> > > + * Check if any multithread force wake bit is set for a given domain ID.
> > > + *
> > > + * Return: true if any bit in the force wake reg is set
> > > + */
> > > +bool xe_force_wake_any_bit_set(struct xe_force_wake *fw, enum xe_force_wake_domain_id id)
> > > +{
> > > +	struct xe_gt *gt = fw->gt;
> > > +	struct xe_force_wake_domain *domain = &fw->domains[id];
> > > +	u32 val;
> > > +
> > > +	val = xe_mmio_read32(&gt->mmio, domain->reg_ctl);
> > > +	if (val & 0xFFFF) {
> > > +		xe_gt_dbg(gt, "FW bit set in domain: %d, reg: 0x%x, val: 0x%x",
> > > +			  domain->id, domain->reg_ctl.addr, val);
> > > +		return true;
> > > +	}
> > > +
> > > +	return false;
> > > +}
> > > +
> > >   /**
> > >    * xe_force_wake_get() : Increase the domain refcount
> > >    * @fw: struct xe_force_wake
> > > diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> > > index e2721f205d6c..53941e5a0fbe 100644
> > > --- a/drivers/gpu/drm/xe/xe_force_wake.h
> > > +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> > > @@ -18,6 +18,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
> > >   unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
> > >   					    enum xe_force_wake_domains domains);
> > >   void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref);
> > > +bool xe_force_wake_any_bit_set(struct xe_force_wake *fw, enum xe_force_wake_domain_id id);
> > >   const char *xe_force_wake_domain_to_str(enum xe_force_wake_domain_id id);
> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > index ab4da1d9a9f1..a79d928ad75a 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > @@ -1438,10 +1438,14 @@ static int xe_pci_runtime_idle(struct device *dev)
> > >   {
> > >   	struct pci_dev *pdev = to_pci_dev(dev);
> > >   	struct xe_device *xe = pdev_to_xe_device(pdev);
> > > +	int ret;
> > >   	xe_pm_d3cold_allowed_toggle(xe);
> > > -	return 0;
> > > +	ret = xe_pm_check_runtime_idle(xe);
> > > +	pm_runtime_autosuspend(dev);
> > do we really need this autosuspend here?
> > I believe this is what may have confused Sashiko.
> > And if needed it probably worth a separate patch with explanation.
> 
> It was Sashiko's suggestion :). If we fail runtime_idle check due to someone
> holding a forcewake, there is no mechanism to re-trigger the autosuspend
> when they release the forcewake. I believe it is only retriggered on a
> pm_ref put(). So, system will be stuck in D0 state even after the forcewake
> has been released (until some execution happens and a pm_ref count goes to
> zero again). We only need the autosuspend when the check fails, so should be
> part of the same patch? I added it to both paths since it is a noop in the
> case where we succeed in the idle check (as it returns 0 to the PM
> subsystem).

Well, Sashiko is right about something that I had never realized,
runtime_suspend failure does schedule itself, the idle indeed doesn't.
That's awkward in the rpm infra, but not a driver job to do this call.

Also, I don't believe it is forever anyway. In the next put/get pair
it will be rearmed.

So, we can either accept this delayed rearm, we can move this check
to inside runtime_suspend and avoid the _idle or we can try to work
with linux core kernel to ensure _idle is rearmed.

But this call itself needs to be removed from here.

Thanks,
Rodrigo.

> 
> Thanks,
> 
> Vinay.
> 
> > 
> > > +
> > > +	return ret;
> > >   }
> > >   static const struct dev_pm_ops xe_pm_ops = {
> > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > index f517bf453b54..e8d4cdbaef88 100644
> > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > @@ -17,6 +17,8 @@
> > >   #include "xe_bo.h"
> > >   #include "xe_bo_evict.h"
> > >   #include "xe_device.h"
> > > +#include "xe_force_wake.h"
> > > +#include "xe_force_wake_types.h"
> > >   #include "xe_ggtt.h"
> > >   #include "xe_gt.h"
> > >   #include "xe_gt_idle.h"
> > > @@ -1030,6 +1032,23 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
> > >   	mutex_unlock(&xe->d3cold.lock);
> > >   }
> > > +/**
> > > + * xe_pm_check_runtime_idle() - Perform checks before signaling runtime idle.
> > > + *
> > > + * Return: 0 on success, non-zero on finding device not idle
> > > + */
> > > +int xe_pm_check_runtime_idle(struct xe_device *xe)
> > > +{
> > > +	struct xe_gt *gt;
> > > +	u8 id;
> > > +
> > > +	for_each_gt(gt, xe, id)
> > > +		if (xe_force_wake_any_bit_set(gt_to_fw(gt), XE_FW_DOMAIN_ID_GT))
> > > +			return -EBUSY;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >   /**
> > >    * xe_pm_module_init() - Perform xe_pm specific module initialization.
> > >    *
> > > diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> > > index 6d5ab09cb769..d1f6a694b7c4 100644
> > > --- a/drivers/gpu/drm/xe/xe_pm.h
> > > +++ b/drivers/gpu/drm/xe/xe_pm.h
> > > @@ -38,6 +38,7 @@ struct task_struct *xe_pm_read_callback_task(struct xe_device *xe);
> > >   int xe_pm_block_on_suspend(struct xe_device *xe);
> > >   void xe_pm_might_block_on_suspend(void);
> > >   int xe_pm_module_init(void);
> > > +int xe_pm_check_runtime_idle(struct xe_device *xe);
> > >   static inline void __xe_pm_runtime_noop(struct xe_device *xe) {}
> > > -- 
> > > 2.38.1
> > > 
