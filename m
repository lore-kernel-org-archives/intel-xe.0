Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3ED4C83F27
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 21:12:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A7010E68D;
	Tue, 15 Jul 2025 21:12:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BSYX9vS7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D71510E68D
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 21:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752613964; x=1784149964;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gcqXMRqna+MEL47SENsHSIQClB6bqPisbTb3DUOutSI=;
 b=BSYX9vS73T7Jwk2BFd7CVs7hJ7MWFo6Ta55s0JX60MwG1gqVv8T/j/oz
 51/refmtPhqHhU9BoCs5nKNBsgaDxtLKAN2GdpbgpMe3u8YfyGaaJmqnR
 UaHrovXDUNNGQv0nbpJ/IqLGRmDz0jBCyYalqhPM6oN0YALrye0hQHOvd
 SABNcCKLcNCg93WE/P0S33HGP3hc+/zCF+BWnDtCxd2+Gkpx9rvAv0dHF
 CcEza4PbNjmMomyYErIe9oplZ5L9wylrPKalgDf0/Vrij+C5JSoFKX3kj
 N0eHmfIsHpVuAkIBK0dLvQk3A8xJtZDPxKHj7pZGZJHQ1iXRRsS1kvY09 A==;
X-CSE-ConnectionGUID: 1QBHuuNMRBmkanJXgRbnxg==
X-CSE-MsgGUID: Ok7zwJLdSe+nzKyav4FUQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="53960872"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="53960872"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 14:12:44 -0700
X-CSE-ConnectionGUID: +Cmnd0gETUqz+pTkmo3q0g==
X-CSE-MsgGUID: avuh75A8Rcqt5WzU8kmFZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="194459612"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 14:12:44 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 14:12:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 14:12:43 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.44) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 14:12:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h2oaAgf12vBAnio9zjOjJFYp0jbfhQ8jrTsIytZ7lyhoa+qQIEM+UD8OZtXTW0yLOkGWAa68NGFCLka3NNA6YrHNHgSwoWU2/ecKiJJxrVDpC/CdQE7tIazAqkNdmIG6ypYr6x4r79ehK3OLCPd2E/tFkyHNiCoI16DUWIzTkE9QBCThafL4+wFJtUe/UJWUvAk4ZGWtKlfnF1ZfuwqFT30N90AM6CxAGeNeq3zLxsz8BrcceGQjlDfX4GvzIssZ7QZzMAv1ARBPsQl9To20u4dftXQ/87tKYApwbgyqduTK38pOg9LK4OVpiVAXdosl2yLVvBGvG9Jl9FMkMtom3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VsliKE2VuQATN+PHFa6CaIOl8DbMOkxzDshP9Tq0w1s=;
 b=AIoNnRW6HwI9LY36hTMkFdUAe5s1FIHvxMTik765zIo6kTcKhr+6itZVMrHTMIrahZu6hdYq0J/1drtpOCOf0Yzil4EAys1sPPWY0fnLsoISADNhLKiVwAWCTyjp3Gp7gespBdttr4YPAv7ytVH5D6821ugg2YWUqqs8dsrrY8MUVQ32AOhiptmmCK9hRrIwh/+yykkowCE/8gtDzxn1rLlnhojMtny+97UsA0aVpSuy3bCGRgtGh6JgE2ZjRMFbyFt0Q7C1pcXzbQdiRWtJSzLVe8J3IOMPln5HJu19xhbyqNExq6YDalU/2/37CBP1IWz8UQW1RT3QZZ3VV3BnSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH0PR11MB5080.namprd11.prod.outlook.com (2603:10b6:510:3f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 21:12:40 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8880.021; Tue, 15 Jul 2025
 21:12:39 +0000
Date: Tue, 15 Jul 2025 14:14:24 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH v2 2/9] drm/xe: Add generic dependecy jobs / scheduler
Message-ID: <aHbEsL4K5usU+Xy/@lstrano-desk.jf.intel.com>
References: <20250702234222.3278264-1-matthew.brost@intel.com>
 <20250702234222.3278264-3-matthew.brost@intel.com>
 <82e3ac7e3adb20156a3fc48568da2d49f0d9cbbe.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <82e3ac7e3adb20156a3fc48568da2d49f0d9cbbe.camel@intel.com>
X-ClientProxiedBy: SJ2PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:a03:505::9) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH0PR11MB5080:EE_
X-MS-Office365-Filtering-Correlation-Id: d79f31f4-3b00-4a45-463d-08ddc3e45487
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?fQ+QtBOs6TdrkboPbR4gCamD70ftPr5p8Q+4olkj4lzEQqaRoqaWW4ahQt?=
 =?iso-8859-1?Q?AlWgMMohlBXKNKLSxNdMoZvxDGGbuok9Gsv0G2rgiAZupvWHNyAIZ+u7Qa?=
 =?iso-8859-1?Q?GwkEfi5kQQLGT4pXU2xJvJSsTZseQ8vzzEO9qNcKbJBQWJNPAoL/PEJY9A?=
 =?iso-8859-1?Q?Gr2gt9fNtz1TrAKS1n96UjCpzbD6wlmkefowl56Bkf1/3BGmVDhENL1+E8?=
 =?iso-8859-1?Q?s3CLkVaLWE2K1qzj5ozXpWI7NipCKrqCof7W52f5afwGgAUCE2oktH1TMz?=
 =?iso-8859-1?Q?A3+3s9qnf1A3f/oCdXVtp1DR9oq+nTrtipwdGzQIbRcd3xX89EiqBBzvQm?=
 =?iso-8859-1?Q?w17zz1gje9QwoyRRtFw/cANZx3ndwy4Erivb8oL2cL8D/oX4JeSNlUPrYk?=
 =?iso-8859-1?Q?jWn8zaObTv/dWNcZ9kIouba/x1XMwanm9aBDzP1KNhWg+yYJgyeGNlhr6i?=
 =?iso-8859-1?Q?FDpPJItPROhMCnxZMaOWkroA8ta8+e7LKZ23HG+/YDsryR/rn/T5oB3PH4?=
 =?iso-8859-1?Q?AdFJRJQldHIGlC/MSCHKzkgLs0xuyVoDlz3CTVI6AUt5NkHzM6qpgSMccF?=
 =?iso-8859-1?Q?FoHWuK9Oklbc5qr8UI0DyEZeHa+jFRRNTGN1RAD9CQew6/QQNTpR9IBn53?=
 =?iso-8859-1?Q?7bQyeqAGbSHU/ZFWt8VAp8GUnWwdkHmXNzFGOb0zi3GEAhZ7eNvJUvkwkx?=
 =?iso-8859-1?Q?jVbc6FNH68tTiHGDH5rqd537QefQ8ENGIseRs4IfwKYVVqK/wHx7JmvnEA?=
 =?iso-8859-1?Q?3Xh07sJ1m7uY7/7ZjFsB9wdQqZivyj0WK1glqMqsIRlU4vJ4e78UJhsOF7?=
 =?iso-8859-1?Q?xPlGrfIb95qJ/+NiTnd50+dT86xh21W8aBxIgKErWIcGBJyFqvxqO5rgro?=
 =?iso-8859-1?Q?CYdfath67LZfQv1wCXnApRhNVJmzTJL67WQELA0LmpSgwhVySti0T1TnVp?=
 =?iso-8859-1?Q?Yn0bGGVzYRcvE1G78AQP40Cq4rjf3L9Ot1poT1bxShZvigBnu1/PsiTo4W?=
 =?iso-8859-1?Q?PHFgDCvTbLxCc1LBL/1q6ir16w1LJsIzFlNsBYsAPAU73UhTpaCzKFACTj?=
 =?iso-8859-1?Q?9dwhTUE7j0IAZjWtJFqwHsrsMml0YYmKXhU4WUSohGjp7dXJ1b2E9h+p2t?=
 =?iso-8859-1?Q?Ox4m9sKcKaIj39Oq/8UYpK53+RZ9HMz+/KwvxRRLznLYXxdihls8lYfKYF?=
 =?iso-8859-1?Q?oPRo7Tb/g7UxfL9wrs1u9bAM9yJLSajZXY3OoQ8wXmyaVuQnSgdYr9f84+?=
 =?iso-8859-1?Q?pc3PG/DzDVX8pyI7LCENHYl6xlpUQ5+tp5FVPZTvZewLlTVZHRrEB5+vUl?=
 =?iso-8859-1?Q?hppOUe0gZdFQF2xm+6iX81k6mgw1Ndaka+9MvHoyuQjppSqMMfiSma7Pn4?=
 =?iso-8859-1?Q?vaUc2D8nCByez338DpREpFiaZhIBoDW3tGdwnqKNpY3/Di+tpuwGt81Mka?=
 =?iso-8859-1?Q?qgMRXGdDPVatQRWSuCr45cO3NhBBY1c7aByAqpdQIMLQo1R7yyKhvgO/Gl?=
 =?iso-8859-1?Q?I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?55CQDWkpi4YmPWKEW3tezcdMbxRCMhpr/Ogx8OFoDdSLIW8v24hWzsgfp4?=
 =?iso-8859-1?Q?99DdQPHaWaZh1k+MYEUtS99LQFqBV3MeCJBtZH6UrwvxvQARpnQjqriMmW?=
 =?iso-8859-1?Q?Lcy6s80OaCuT/0MV00HAn2bjPnPGWrLKBuqiVMx/gB1YtYV1dvqzRg7M7h?=
 =?iso-8859-1?Q?9uik3d9/ZBYknHnC/Azh75Q6TA6UDdhFjX/CIO+ZCO+QduXIkoDZxFiSyZ?=
 =?iso-8859-1?Q?tk4Im0riNJYaznO7yRVyGuLEalsYu+eTycdS6vugdqmJw1/W8nkTsakRjf?=
 =?iso-8859-1?Q?EPGGo1dFWMleV1190cv5iDvjg+p0PVBIzzMMQ0kBWvfel+qtGULa/ou+XL?=
 =?iso-8859-1?Q?Ixyk24lXX9q6Imzz2oN3DHLJWh4gbfRaLZEIM7hqyk3Kj/Z4Bcxr6lqG/H?=
 =?iso-8859-1?Q?26tlDmrbK635fIz+0+YofN/P7UbsxNUUplV9z2AtkBPtrcVzd0iaM8xNnI?=
 =?iso-8859-1?Q?xzpTAFQuF52nGWkM2+zoW06gYC4XlFl8XNDwC9qbiZhp0IFMpaMpuJR85q?=
 =?iso-8859-1?Q?IZ1RJ/Saqj0LEpyvf80Xhz2lRn/lg2U9nB7BVEYCNagiIBVic/IUydp8zX?=
 =?iso-8859-1?Q?2RIny8BTezydW92ebA5lFwpclAG59oBDrmZEwwRr0OgT9Ns/Rp59adgJAI?=
 =?iso-8859-1?Q?pf55HufqFd3KKMZHCASstiSMUCiHeSiRv6WDmJdKaNY2K/v9jX8lDM6w6E?=
 =?iso-8859-1?Q?/m36odjODRukjbwI93nDq8CFimm4SM7tbu3bJ0T4YAHP2nKscie0EVEsuq?=
 =?iso-8859-1?Q?8Foh2FM0XE5N/MCuHHk9SkUGmeOFgtApRA6i2d7abg8XkQ8mK0DAW+RO/l?=
 =?iso-8859-1?Q?RBu5PcK2VYjl+KJcAg5PDjEpL7zx0IzsfST1Kv1+mD3s/FpOAyFu7zGmEO?=
 =?iso-8859-1?Q?Q+4VsgmkwXL6drEF9qoYQydu9gANgPYyHI+IvmknPS2dyT2WAMOpKgU3e6?=
 =?iso-8859-1?Q?e7EV2057BiRH2IBQtKvTTl91yycRPCIo/HZ+2TQVp/Ki+2KNURHBhhYiuB?=
 =?iso-8859-1?Q?ztd+Y4EHkudv8AbQw2/pYtAT2tgP4HewxIQIZ8UcsSudOoveXLybxbVukm?=
 =?iso-8859-1?Q?TGzLiixtDSILwIVXW5O6XyLozEPOk5G/xsp5w+q4qopqgJ3eEyg514Znfl?=
 =?iso-8859-1?Q?x/MfIJVrrzpQm/yXV09i87FLWgocrdkkBUk3bSY/vzwWtLMJhN4JTZi50p?=
 =?iso-8859-1?Q?u85zo7GWWyYjcfyUnl/RhLmjR60D+FfCcOIKS2qzyK26mUn+3pPfYAz0RV?=
 =?iso-8859-1?Q?JcMB3EWoSNlpSrblHCDQ3EsJZK+N0hBoIV3nA7YUDeFyMauEqQ06wln+bp?=
 =?iso-8859-1?Q?y/mk3mFEMomgqqcRwq4nFpJFuapea4CHdS9jHSZSG8ZV+HbD2L56951HDf?=
 =?iso-8859-1?Q?uUnZA9R4k4YKIUXzBvOaf626L/YwU+GORsHooUBY2spiSeYhrCNVcGSOhi?=
 =?iso-8859-1?Q?7kodamS/P9dB1lhRIKm1UyaTekIkoLF0vo6X5I2KPM4p6kXRRkx6C3ED98?=
 =?iso-8859-1?Q?bDqpxFkC4JFK1V67yEINNKfxRLd0x5kc6odLBA65h9X7ESwAxEUNp8Kx84?=
 =?iso-8859-1?Q?KifwMLElYi56/LlQRbSN8++mbdkzHeV+A3eH8mM6V59VIMdpryly84r+C5?=
 =?iso-8859-1?Q?mVqP4B2tflg6n48Lo+xQZbrdvbs7NeQ/4hOOATSKec9zdMv25pn+A5ng?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d79f31f4-3b00-4a45-463d-08ddc3e45487
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 21:12:39.8194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9XBEJ0jLgDCS3BGCEYgv0xokILMhH1Y6e+6RVxS3gkacjbba41BgbMa+4Ieoknq4c+ctj0ZWxsAyyeyWoFRqYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5080
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

On Tue, Jul 15, 2025 at 03:04:07PM -0600, Summers, Stuart wrote:
> On Wed, 2025-07-02 at 16:42 -0700, Matthew Brost wrote:
> > Add generic dependecy jobs / scheduler which serves as wrapper for
> > DRM
> > scheduler. Useful when we want delay a generic operation until a
> > dma-fence signals.
> > 
> > Existing use cases could be destroying of resources based fences /
> > dma-resv, the preempt rebind worker, and pipelined GT TLB
> > invalidations.
> > 
> > Written in such a way it could be moved to DRM subsystem if needed.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile           |   1 +
> >  drivers/gpu/drm/xe/xe_dep_job_types.h |  29 ++++++
> >  drivers/gpu/drm/xe/xe_dep_scheduler.c | 145
> > ++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_dep_scheduler.h |  21 ++++
> >  4 files changed, 196 insertions(+)
> >  create mode 100644 drivers/gpu/drm/xe/xe_dep_job_types.h
> >  create mode 100644 drivers/gpu/drm/xe/xe_dep_scheduler.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_dep_scheduler.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile
> > b/drivers/gpu/drm/xe/Makefile
> > index 1d97e5b63f4e..0edcfc770c0d 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -28,6 +28,7 @@ $(obj)/generated/%_wa_oob.c
> > $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
> >  xe-y += xe_bb.o \
> >         xe_bo.o \
> >         xe_bo_evict.o \
> > +       xe_dep_scheduler.o \
> >         xe_devcoredump.o \
> >         xe_device.o \
> >         xe_device_sysfs.o \
> > diff --git a/drivers/gpu/drm/xe/xe_dep_job_types.h
> > b/drivers/gpu/drm/xe/xe_dep_job_types.h
> > new file mode 100644
> > index 000000000000..c6a484f24c8c
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_dep_job_types.h
> > @@ -0,0 +1,29 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_DEP_JOB_TYPES_H_
> > +#define _XE_DEP_JOB_TYPES_H_
> > +
> > +#include <drm/gpu_scheduler.h>
> > +
> > +struct xe_dep_job;
> > +
> > +/** struct xe_dep_job_ops - Generic Xe dependency job operations */
> > +struct xe_dep_job_ops {
> > +       /** @run_job: Run generic Xe dependency job */
> > +       struct dma_fence *(*run_job)(struct xe_dep_job *job);
> > +       /** @free_job: Free generic Xe dependency job */
> > +       void (*free_job)(struct xe_dep_job *job);
> > +};
> > +
> > +/** struct xe_dep_job - Generic dependency Xe job */
> > +struct xe_dep_job {
> > +       /** @drm: base DRM scheduler job */
> > +       struct drm_sched_job drm;
> > +       /** @ops: dependency job operations */
> > +       const struct xe_dep_job_ops *ops;
> > +};
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_dep_scheduler.c
> > b/drivers/gpu/drm/xe/xe_dep_scheduler.c
> > new file mode 100644
> > index 000000000000..fbd55577d787
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_dep_scheduler.c
> > @@ -0,0 +1,145 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#include <linux/slab.h>
> > +
> > +#include <drm/gpu_scheduler.h>
> > +
> > +#include "xe_dep_job_types.h"
> > +#include "xe_dep_scheduler.h"
> > +#include "xe_device_types.h"
> > +
> > +/**
> > + * DOC: Xe Dependency Scheduler
> > + *
> > + * The Xe dependency scheduler is a simple wrapper built around the
> > DRM
> > + * scheduler to execute jobs once their dependencies are resolved
> > (i.e., all
> > + * input fences specified as dependencies are signaled). The jobs
> > that are
> > + * executed contain virtual functions to run (execute) and free the
> > job,
> > + * allowing a single dependency scheduler to handle jobs performing
> > different
> > + * operations.
> > + *
> > + * Example use cases include deferred resource freeing, TLB
> > invalidations after
> > + * bind jobs, etc.
> > + */
> > +
> > +/** struct xe_dep_scheduler - Generic Xe dependency scheduler */
> > +struct xe_dep_scheduler {
> > +       /** @sched: DRM GPU scheduler */
> > +       struct drm_gpu_scheduler sched;
> > +       /** @entity: DRM scheduler entity  */
> > +       struct drm_sched_entity entity;
> > +       /** @rcu: For safe freeing of exported dma fences */
> > +       struct rcu_head rcu;
> > +};
> > +
> > +static struct dma_fence *xe_dep_scheduler_run_job(struct
> > drm_sched_job *drm_job)
> > +{
> > +       struct xe_dep_job *dep_job =
> > +               container_of(drm_job, typeof(*dep_job), drm);
> > +
> > +       return dep_job->ops->run_job(dep_job);
> > +}
> > +
> > +static void xe_dep_scheduler_free_job(struct drm_sched_job *drm_job)
> > +{
> > +       struct xe_dep_job *dep_job =
> > +               container_of(drm_job, typeof(*dep_job), drm);
> > +
> > +       dep_job->ops->free_job(dep_job);
> > +}
> > +
> > +static const struct drm_sched_backend_ops sched_ops = {
> > +       .run_job = xe_dep_scheduler_run_job,
> > +       .free_job = xe_dep_scheduler_free_job,
> > +};
> > +
> > +/**
> > + * xe_dep_scheduler_create() - Generic Xe dependency scheduler
> > create
> > + * @xe: Xe device
> > + * @submit_wq: Submit workqueue struct (can be NULL)
> > + * @name: Name of dependency scheduler
> > + * @job_limit: Max dependency jobs that can be scheduled
> > + *
> > + * Create a generic Xe dependency scheduler and initialize internal
> > DRM
> > + * scheduler objects.
> > + *
> > + * Return: Generic Xe dependency scheduler object or ERR_PTR
> > + */
> > +struct xe_dep_scheduler *
> > +xe_dep_scheduler_create(struct xe_device *xe,
> > +                       struct workqueue_struct *submit_wq,
> > +                       const char *name, u32 job_limit)
> > +{
> > +       struct xe_dep_scheduler *dep_scheduler;
> > +       struct drm_gpu_scheduler *sched;
> > +       const struct drm_sched_init_args args = {
> > +               .ops = &sched_ops,
> > +               .submit_wq = submit_wq,
> > +               .num_rqs = 1,
> > +               .credit_limit = job_limit,
> > +               .timeout = MAX_SCHEDULE_TIMEOUT,
> > +               .name = name,
> > +               .dev = xe->drm.dev,
> > +       };
> > +       int err;
> > +
> > +       dep_scheduler = kzalloc(sizeof(*dep_scheduler), GFP_KERNEL);
> > +       if (!dep_scheduler)
> > +               return ERR_PTR(-ENOMEM);
> > +
> > +       err = drm_sched_init(&dep_scheduler->sched, &args);
> > +       if (err)
> > +               goto err_free;
> > +
> > +       sched = &dep_scheduler->sched;
> > +       err = drm_sched_entity_init(&dep_scheduler->entity, 0,
> > +                                   (struct drm_gpu_scheduler
> > **)&sched, 1,
> 
> Why the cast here?
> 

Copied from some existing code that had a cast, not needed it either
case. Will remove.

Matt

> Otherwise this patch lgtm.
> 
> Thanks,
> Stuart
> 
> > +                                   NULL);
> > +       if (err)
> > +               goto err_sched;
> > +
> > +       init_rcu_head(&dep_scheduler->rcu);
> > +
> > +       return dep_scheduler;
> > +
> > +err_sched:
> > +       drm_sched_fini(&dep_scheduler->sched);
> > +err_free:
> > +       kfree(dep_scheduler);
> > +
> > +       return ERR_PTR(err);
> > +}
> > +
> > +/**
> > + * xe_dep_scheduler_fini() - Generic Xe dependency scheduler
> > finalize
> > + * @dep_scheduler: Generic Xe dependency scheduler object
> > + *
> > + * Finalize internal DRM scheduler objects and free generic Xe
> > dependency
> > + * scheduler object
> > + */
> > +void xe_dep_scheduler_fini(struct xe_dep_scheduler *dep_scheduler)
> > +{
> > +       drm_sched_entity_fini(&dep_scheduler->entity);
> > +       drm_sched_fini(&dep_scheduler->sched);
> > +       /*
> > +        * RCU free due sched being exported via DRM scheduler fences
> > +        * (timeline name).
> > +        */
> > +       kfree_rcu(dep_scheduler, rcu);
> > +}
> > +
> > +/**
> > + * xe_dep_scheduler_entity() - Retrieve a generic Xe dependency
> > scheduler
> > + *                             DRM scheduler entity
> > + * @dep_scheduler: Generic Xe dependency scheduler object
> > + *
> > + * Return: The generic Xe dependency scheduler's DRM scheduler
> > entity
> > + */
> > +struct drm_sched_entity *
> > +xe_dep_scheduler_entity(struct xe_dep_scheduler *dep_scheduler)
> > +{
> > +       return &dep_scheduler->entity;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_dep_scheduler.h
> > b/drivers/gpu/drm/xe/xe_dep_scheduler.h
> > new file mode 100644
> > index 000000000000..853961eec64b
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_dep_scheduler.h
> > @@ -0,0 +1,21 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#include <linux/types.h>
> > +
> > +struct drm_sched_entity;
> > +struct workqueue_struct;
> > +struct xe_dep_scheduler;
> > +struct xe_device;
> > +
> > +struct xe_dep_scheduler *
> > +xe_dep_scheduler_create(struct xe_device *xe,
> > +                       struct workqueue_struct *submit_wq,
> > +                       const char *name, u32 job_limit);
> > +
> > +void xe_dep_scheduler_fini(struct xe_dep_scheduler *dep_scheduler);
> > +
> > +struct drm_sched_entity *
> > +xe_dep_scheduler_entity(struct xe_dep_scheduler *dep_scheduler);
> 
