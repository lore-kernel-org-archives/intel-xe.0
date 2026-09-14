Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD6AC88E70
	for <intel-xe@archiver.kernel.org>; Mon, 14 Sep 2026 13:03:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE78C10E4EA;
	Mon, 14 Sep 2026 13:03:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TuMy+q+j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 457F110E4EA
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Sep 2026 13:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789391005; x=1820927005;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fFY5K4PJxQzFjFhRgmV/VGT3nipf7MieVaPXrrENGC0=;
 b=TuMy+q+jAOHhbUtypUFhrWC1ojQKZZcuGELmWyx8KNoDa+Wy/xlwmKd2
 yqHHUX173PwFKCQ/safkHheQTX7lg4XOStJLvtXp+zZCMLmGdv6LocoSM
 SY/T14sCUPUaovbRmd6i4/FHR6qpcDW1m7YkhhSzjZq+lJ1NHc7xyA4Oo
 eri87cstOscafr4kUnN4dAAK3NKZCAGFfTpWFyoHuZUJz5fQv9zBX2Cog
 RE+JbCVV0lJg5krhwIv5VCPDmPr4/MUDa6b7BZNVQAH9QcwSKwPm0Yotm
 6N81OzkzRZQvh/acMqAjjk95EFLSvjVCDPwMNVvvzh7y5Fx7T5dk3ciG7 g==;
X-CSE-ConnectionGUID: AKMNxXiAT2edy7zyXqOoJg==
X-CSE-MsgGUID: uhGYMJTCTZ26q0u9pRv1Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="92251213"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; d="scan'208";a="92251213"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 06:03:24 -0700
X-CSE-ConnectionGUID: j23rITrDSxeejeS2OFj3BQ==
X-CSE-MsgGUID: v8IQO7YxT5u9FmN4MpF2UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="868378"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 06:03:25 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 06:03:24 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 06:03:24 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.71) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 06:03:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NganqVqNFwiDkJqXiWIgO8hSTdidPS3tHLg3jWSmuFRMPwpiWzT+jqUZabTJUQIG2hHpv0YM6oEMtv+dqbDJnDyIw1ZtQNolukvzmR0Ne0dXnwHF4FkMsH/mPTgVYmX9YgPFz1pGENL47oMQhY/9O29wsE+G5NuKMXxFked5FZTM43x4W+Ofn7l9+gclICGcpluPazhyJy57Gdqf4RRhTAsn6pK2TOQCn4sSszLtQZp5K5RTm97foAphvP5wcqUlSmfWVmMMLElikm7illnv3/OyWMsr+Ti4JRemBEcDtx/Fw/mSSHKGn3AToudFDTUmceeBfigq+Z0gt7q1/xYWkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JsIRhMjBheZwIffBvRGEumNGB3XGqBCFQON/Ch69hGg=;
 b=VjUixVy5Hf0FSGZH5MuI4qSB8Kzs2XUBLOTeu3D/UxmorjhhflnjagN0coDlVKD1m98lrvU5HHT2xsdmc0k8pSIGYJs70LAJJcVyOoLqI253SViHE+VYakPybzjVk0Omtf3M/8SG8jZ6YHvNivSB+IQCwfRoLqMptiKF+OyJylWnb9WCXt0AYZmQqNO+1ebG0ir+PPMcdcAnjfxOXBHTG8i20WpinooKhGLScB8d4phPNCLqkENbADGTVRbENcgxXb9wiGIl+PI+zvjP/Af7PubPqgw5nq8xiOrDjGB3Kz7AnvBgH14b7IsCIs1fyz7RTTSWAl8RarAHYzsr4xIdKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by CH3PR11MB8705.namprd11.prod.outlook.com (2603:10b6:610:1cc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 13:03:19 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 13:03:19 +0000
Date: Mon, 14 Sep 2026 09:03:14 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe: Inspect all forcewake bits for runtime
 idleness
Message-ID: <aqfwkr1CAtcy0f6s@intel.com>
References: <20260910212823.2358362-1-vinay.belgaumkar@intel.com>
 <aqMsfvRS1Ge7Ke7u@intel.com>
 <8a6a5fe1-4965-478e-ab80-71a4c353ed21@intel.com>
 <aqR5mNSXKbICZKKU@intel.com>
 <7d358648-54c1-4fb7-a3b9-d5a31cb7c263@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7d358648-54c1-4fb7-a3b9-d5a31cb7c263@intel.com>
X-ClientProxiedBy: SJ0PR13CA0117.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::32) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|CH3PR11MB8705:EE_
X-MS-Office365-Filtering-Correlation-Id: fd58a03c-2010-4993-b036-08df12608c2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|56012099006|6133799003|11063799006|4143699003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: tj3+9IAv3nxrzBAueOWJdA6Zavovtn/Wcfvel+b99HOVp4xK1m6n0nPh3c4yIy1VYMvSs6qziBOqQdITv9EmEh2ZPZnjNUDnnhIYH/cOt6luf+M3i1xoKd4VZH1Xkd/JiFvBymiOdt5X5nbkeCF2/EyWK24V0sHQNXjphX1A3VWawZyYUugmaSfBMTMmSkTF1gpIG44v6vP1v/Mc4O8bT/GbK+pj40X6Lkc5r1ERMcI++UI2a3D+VVqO6v5KkGcUXIk3ut0e6FM0mIozPoTtPbQmw2obnOdDVzf+Ku74JPYhhXvfRxD6OO5V1l1SmnKeXa+FmSjDZVhsO6pw18aqqCT6SZR/Kd1hByO+GMhrUiGZA32cEUrzVoul7GooDwXjvez7teGiHeU6ebDvYzuHbxmEmkXW31evLCdliYlqk8FneMqDDO850iyVU/qIFsg5q9LIbeer7dix8o/kG8g+Qj1TM/11uE/ewIpx33rBKPN31ntk8QrG6kVJc5xYIXodYppS1Lgu1cdME4Z/ZIjEiwfVrhyx1QUuxEi0afW9JBGwIts0cfqZv+DdSGUaTNPT2kkRYpvYoJyVQMDpHAGLR669+nXpZaEvhNgXr0yilpKFDK9pOfUVjhJsZjBBW4r5UcoGFGYd7hFyRvWGbQeccnaCO8bzSmGVVKOB9lmFW1o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(6133799003)(11063799006)(4143699003)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UM62IjY7tI19kJR45IIszzlsj4Ma6A9LgRM2DKgAiXv4JhIwQndI3TKcYSee?=
 =?us-ascii?Q?npqBLk9Xw/JbTGn8D8e1xWsEUqBK9/hhDUghnmLdwe45JRYIQ6yvzigM8o+Q?=
 =?us-ascii?Q?P36mwfS2cFZNm+oJASg6zLrQY3HCx7RySReUpRFwCuM4Ak1SMxP0QM1ykLIc?=
 =?us-ascii?Q?u20uLKDFfmAqc96cOTAHN65QhfGoQ60j7jQ9dloFT0nD84/LNAM9evN6PGZY?=
 =?us-ascii?Q?g8PIxYYQXluRBuV+WXMmRx4y6pHwWS1XE3qlABwz32s4/csZgWTPhkwGRFyo?=
 =?us-ascii?Q?HCQv/Ssqqtke9QnGMA8XKZjB/zRidFqRpJzx3EMy3rTOjnoLFQ2/9+6saDZ4?=
 =?us-ascii?Q?/vIhWxmHohJ6DyPNNGheT9/rRjJuwCtHHtCDCF9UEzCs7/ECDzzn5d97H82r?=
 =?us-ascii?Q?v1pTNZA75Yxd/eC4xrczN1HfJk3jvbX1R3xCYU2fDbKkiuc+ptPrGfLBQKev?=
 =?us-ascii?Q?grHFpJQ2L6NeFgZLEPubuZO+tf/4WI9eSplUAHRtNlGITqwjfYkP1eDIKzCE?=
 =?us-ascii?Q?mxuymQQRJC+7a8bW+z7//hPjSqDjUkxU1e2aAl8A+Mu9oHHJ67DVlwN59ODI?=
 =?us-ascii?Q?NwnTNIgjYluatGnWOEjo6sFzmmSyP9GfqgKu+nGF3tcoMC/KXqClux2fNErh?=
 =?us-ascii?Q?IjAnaJqefIqQvKx2URbjkoyFzEyvxcarKua15wzdEJOVCk8J2MjHqddzvlOW?=
 =?us-ascii?Q?c68+RZKsl0D9k8vupPFb3RlAp6PrLcXr2K3lSldwgEbxGjChUGScmor+QLPF?=
 =?us-ascii?Q?mD8b3tXhSNprA2EXDk5fzwEnCtv7xGRr/rYnEBqi5IyOFLM0mJI8rCdxgl3k?=
 =?us-ascii?Q?ud9lgcCxcBGZAejd3I33YSwcP/9/fO+dUqUUVUOJeyBYyD7tZn3IFpOsrZOf?=
 =?us-ascii?Q?KYAl799hVkQbUHO/g7axX6VOhVlIjhFaQwRE2o2hBo+xJPDkqJb+F7FUEFDv?=
 =?us-ascii?Q?e0886x6B9w5Ig/Tepn2l0mq3CNRfSDIs/w2d/3NxhQkxfMVQIvKggsI8Bc61?=
 =?us-ascii?Q?6cg7chGd5sr1e8G8FHt9q57st5wpBeD9Idqg92Lx6t0vFVhoBStdNPCkYUlf?=
 =?us-ascii?Q?nH4N5TXnZz/Ua4fAsDlYq5dR4VsC9DWPQ6DBrb7bsqh6B8YaKzAK2E93JPEw?=
 =?us-ascii?Q?XSo6Vn8HFkKUzL05WD+HASOWlJyYsd334ScazTSaq7M008jvFE2siuZBb+Bt?=
 =?us-ascii?Q?Xu1eJhKT4O795A8TV/jeTvi4fKx8O2SmQQjyvwYi5cwpErmSiwxhE15P/kP4?=
 =?us-ascii?Q?Man0KmYCq9pj0iE0Cqs/nisjqkNzwRuhjUlI9OmIUXCHHRixDTb4/SiVjGWw?=
 =?us-ascii?Q?inlrxZnNQHiyl34LEKR3BsxlAhDxd9IamH86scBtjZEVmxMSDfn17mdrUSnC?=
 =?us-ascii?Q?xMuTu7eYodo52wPGVzhdXckLXhlOVBZKfg5gKUug+yxmmkpsF9o86e7rhiHX?=
 =?us-ascii?Q?qy8pWUwFwr/DBIqT+uxFBcEG6NqbTVaH0dTE40v0dLV+hQWXuftsyHEbHYwE?=
 =?us-ascii?Q?Zrl3vz1Bn8bPuVb60DMnQTL2O4iUYL0oLI0+oCkIwHcsfvHROnGTrfWt/98n?=
 =?us-ascii?Q?Arna/4HfhDmZYp9VHPIUJt+1bZ1zgrBTETcLS7o3EEMJYl6Fe9XrJ3xQDbX0?=
 =?us-ascii?Q?3JQA7rlxx/i3mIDaDVU4s7wIQ/70P8Iozht+8UDACSr5tyLhzearoBMdIqHz?=
 =?us-ascii?Q?JBjSGipgibblp4+Rug4w6aQgb2aEDibWd1nWtHS0PSJTvfzKVCS54w+E+I3g?=
 =?us-ascii?Q?Wnn4VvjCAw=3D=3D?=
X-Exchange-RoutingPolicyChecked: 07rDflO6aS4PRj1eqejNo/r9dB19sjQZ1T3z+B4b/aPQRXsESO1uUdvEReN8Z/82co3YPc9kyhdI/0FXw2mgoIZUzThpVQYIaU6VyJx8CuZ0b1X4vi+7j3YJHqoYPEXkMcyCzBNfrYBEsvQ3yCpJC65aGLdB2y/cf/+m1YQao/UmumpbABir52IdBsv4gJTvBnXr/lE9/a1x+YdDNMtCRKSYDeX/m4zXzma/JccWhHg+t5mE7qs3+i65UnMuKdP5k42x7p6SecwTeuLfCuM3VJkAPM/880DbGNJmf4Tezs3Z2Ftdrzra5Ytn+D0WUWuVR84DcmReD67o3FjJFtBsZQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: fd58a03c-2010-4993-b036-08df12608c2a
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 13:03:19.0079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rLScbwOqy1y7OI9dt46TUYND6UHrhkP9XXozTxz9efqVkNEHeqZt8v8JPCB+KkEe0JYdP4b5ZLnECpgYlMPSrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8705
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

On Fri, Sep 11, 2026 at 04:02:39PM -0700, Belgaumkar, Vinay wrote:
> 
> On 9/11/2026 2:58 PM, Rodrigo Vivi wrote:
> > On Thu, Sep 10, 2026 at 04:00:40PM -0700, Belgaumkar, Vinay wrote:
> > > On 9/10/2026 3:17 PM, Rodrigo Vivi wrote:
> > > > On Thu, Sep 10, 2026 at 02:28:22PM -0700, Vinay Belgaumkar wrote:
> > > > > Inspect all GT force wake bits in the idle check for runtime suspend.
> > > > > This includes the ones not typically used by Xe KMD as well. Skip suspend
> > > > > when any of these bits are set, since it could mean someone is trying to
> > > > > keep the GT awake.
> > > > > 
> > > > > Also add a call to pm_runtime_autosuspend() inside the idle check. This
> > > > > ensures a PM subsystem retry at a later time.
> > > > > 
> > > > > v2: Only check the GT domain FW register. Other domains require a GT force
> > > > > wake applied before we can read their registers. Retry if idleness check
> > > > > fails (Sashiko)
> > > > > 
> > > > > Cc: Badal Nilawar <badal.nilawar@intel.com>
> > > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > Assisted-by: Claude:Claude-Sonnet-5
> > > > > Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > > > > ---
> > > > >    drivers/gpu/drm/xe/xe_force_wake.c | 25 +++++++++++++++++++++++++
> > > > >    drivers/gpu/drm/xe/xe_force_wake.h |  1 +
> > > > >    drivers/gpu/drm/xe/xe_pci.c        |  6 +++++-
> > > > >    drivers/gpu/drm/xe/xe_pm.c         | 19 +++++++++++++++++++
> > > > >    drivers/gpu/drm/xe/xe_pm.h         |  1 +
> > > > >    5 files changed, 51 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> > > > > index 197e2197bd0a..0acb796c756c 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_force_wake.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> > > > > @@ -148,6 +148,31 @@ static int domain_sleep_wait(struct xe_gt *gt,
> > > > >    	return __domain_wait(gt, domain, false);
> > > > >    }
> > > > > +/**
> > > > > + * xe_force_wake_any_bit_set - Return true if any force wake bit is set
> > > > > + * @fw: struct xe_force_wake
> > > > > + * @id: Force wake domain id
> > > > > + *
> > > > > + * Check if any multithread force wake bit is set for a given domain ID.
> > > > > + *
> > > > > + * Return: true if any bit in the force wake reg is set
> > > > > + */
> > > > > +bool xe_force_wake_any_bit_set(struct xe_force_wake *fw, enum xe_force_wake_domain_id id)
> > > > > +{
> > > > > +	struct xe_gt *gt = fw->gt;
> > > > > +	struct xe_force_wake_domain *domain = &fw->domains[id];
> > > > > +	u32 val;
> > > > > +
> > > > > +	val = xe_mmio_read32(&gt->mmio, domain->reg_ctl);
> > > > > +	if (val & 0xFFFF) {
> > > > > +		xe_gt_dbg(gt, "FW bit set in domain: %d, reg: 0x%x, val: 0x%x",
> > > > > +			  domain->id, domain->reg_ctl.addr, val);
> > > > > +		return true;
> > > > > +	}
> > > > > +
> > > > > +	return false;
> > > > > +}
> > > > > +
> > > > >    /**
> > > > >     * xe_force_wake_get() : Increase the domain refcount
> > > > >     * @fw: struct xe_force_wake
> > > > > diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> > > > > index e2721f205d6c..53941e5a0fbe 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_force_wake.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> > > > > @@ -18,6 +18,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
> > > > >    unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
> > > > >    					    enum xe_force_wake_domains domains);
> > > > >    void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref);
> > > > > +bool xe_force_wake_any_bit_set(struct xe_force_wake *fw, enum xe_force_wake_domain_id id);
> > > > >    const char *xe_force_wake_domain_to_str(enum xe_force_wake_domain_id id);
> > > > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > > > index ab4da1d9a9f1..a79d928ad75a 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > > > @@ -1438,10 +1438,14 @@ static int xe_pci_runtime_idle(struct device *dev)
> > > > >    {
> > > > >    	struct pci_dev *pdev = to_pci_dev(dev);
> > > > >    	struct xe_device *xe = pdev_to_xe_device(pdev);
> > > > > +	int ret;
> > > > >    	xe_pm_d3cold_allowed_toggle(xe);
> > > > > -	return 0;
> > > > > +	ret = xe_pm_check_runtime_idle(xe);
> > > > > +	pm_runtime_autosuspend(dev);
> > > > do we really need this autosuspend here?
> > > > I believe this is what may have confused Sashiko.
> > > > And if needed it probably worth a separate patch with explanation.
> > > It was Sashiko's suggestion :). If we fail runtime_idle check due to someone
> > > holding a forcewake, there is no mechanism to re-trigger the autosuspend
> > > when they release the forcewake. I believe it is only retriggered on a
> > > pm_ref put(). So, system will be stuck in D0 state even after the forcewake
> > > has been released (until some execution happens and a pm_ref count goes to
> > > zero again). We only need the autosuspend when the check fails, so should be
> > > part of the same patch? I added it to both paths since it is a noop in the
> > > case where we succeed in the idle check (as it returns 0 to the PM
> > > subsystem).
> > Well, Sashiko is right about something that I had never realized,
> > runtime_suspend failure does schedule itself, the idle indeed doesn't.
> > That's awkward in the rpm infra, but not a driver job to do this call.
> > 
> > Also, I don't believe it is forever anyway. In the next put/get pair
> > it will be rearmed.
> > 
> > So, we can either accept this delayed rearm, we can move this check
> > to inside runtime_suspend and avoid the _idle or we can try to work
> > with linux core kernel to ensure _idle is rearmed.
> > 
> > But this call itself needs to be removed from here.
> 
> Sure, we can only check inside _suspend call to simplify. In that case,
> there is no need to check for forcewake bits, right? Checking for C6 is
> sufficient since it cannot happen without the other.

ack

> 
> Thanks,
> 
> Vinay.
> 
> > 
> > Thanks,
> > Rodrigo.
> > 
> > > Thanks,
> > > 
> > > Vinay.
> > > 
> > > > > +
> > > > > +	return ret;
> > > > >    }
> > > > >    static const struct dev_pm_ops xe_pm_ops = {
> > > > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > > > index f517bf453b54..e8d4cdbaef88 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > > > @@ -17,6 +17,8 @@
> > > > >    #include "xe_bo.h"
> > > > >    #include "xe_bo_evict.h"
> > > > >    #include "xe_device.h"
> > > > > +#include "xe_force_wake.h"
> > > > > +#include "xe_force_wake_types.h"
> > > > >    #include "xe_ggtt.h"
> > > > >    #include "xe_gt.h"
> > > > >    #include "xe_gt_idle.h"
> > > > > @@ -1030,6 +1032,23 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
> > > > >    	mutex_unlock(&xe->d3cold.lock);
> > > > >    }
> > > > > +/**
> > > > > + * xe_pm_check_runtime_idle() - Perform checks before signaling runtime idle.
> > > > > + *
> > > > > + * Return: 0 on success, non-zero on finding device not idle
> > > > > + */
> > > > > +int xe_pm_check_runtime_idle(struct xe_device *xe)
> > > > > +{
> > > > > +	struct xe_gt *gt;
> > > > > +	u8 id;
> > > > > +
> > > > > +	for_each_gt(gt, xe, id)
> > > > > +		if (xe_force_wake_any_bit_set(gt_to_fw(gt), XE_FW_DOMAIN_ID_GT))
> > > > > +			return -EBUSY;
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > >    /**
> > > > >     * xe_pm_module_init() - Perform xe_pm specific module initialization.
> > > > >     *
> > > > > diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> > > > > index 6d5ab09cb769..d1f6a694b7c4 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_pm.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_pm.h
> > > > > @@ -38,6 +38,7 @@ struct task_struct *xe_pm_read_callback_task(struct xe_device *xe);
> > > > >    int xe_pm_block_on_suspend(struct xe_device *xe);
> > > > >    void xe_pm_might_block_on_suspend(void);
> > > > >    int xe_pm_module_init(void);
> > > > > +int xe_pm_check_runtime_idle(struct xe_device *xe);
> > > > >    static inline void __xe_pm_runtime_noop(struct xe_device *xe) {}
> > > > > -- 
> > > > > 2.38.1
> > > > > 
