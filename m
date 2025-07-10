Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495D3C83F1B
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 17:37:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A67210E232;
	Thu, 10 Jul 2025 17:37:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YNcd6NMl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED74310E232
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 17:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752169041; x=1783705041;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=RLDhWQH1PWG8nEj2q19elgIy96dd7rgMLW4dBr8nshc=;
 b=YNcd6NMlDVF4glzc5FwWAj1gyQuAG2VX/CS5YxnnW0wcK94eUHFAVwss
 9t4u81BLG2pV2At5Bfwv9IjHZ9Jy/VHXSqGKCT/ZFBLwbiO3vUc/+5gH1
 ONlL2eiqm7QFlkou24cdrRZw3BrTdBY1eEQDEZOV/JvsE48+YN/EivRRd
 +sADk6KcT/Q8bRNaXWVW0p1HxVh9J+BhT7+opAY9LxQqECcJVv+E6Nje/
 j6zbP9SbPbcxudCw6HC8B9A9MGlDvWgSeEC6ov+7mKaaRcUKJTb0Zr/i8
 bI3N6Lmv7ep/eEo9jzia4BCP7UjB0ex/RkENP6XSCtQ9Pg+tJTnsKGZzJ w==;
X-CSE-ConnectionGUID: wbQnQGo4SIyCGINhzxeZ0w==
X-CSE-MsgGUID: KpZDNE6mQMuVNBa7Y44aFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54552741"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="54552741"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 10:37:20 -0700
X-CSE-ConnectionGUID: dNstQe0UQ7uPVnQCeu7L9Q==
X-CSE-MsgGUID: q0h9RJ0AQ7uDfEzgH8CojA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="156252536"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 10:37:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 10:37:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 10:37:19 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.88)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 10:37:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M8/jbT2KEYrQauy7Ja8NvppH5tPoLR430SU5zYXqOa/2A1SgoXvOQ8RQSbxVDfwHDtcIC3OfOud+V9MgdnepsSqwfCAlm6pF/kzYNOnyH8+o4YOhA4gCIAYpLPplSIeb2/zIcgm/bf9uifpZZaKb+150PgjyA9zZamrqIw91i6dD1emt/imG3I9d8ZXlcGf+AwQBprM0wIMkWLTqSqLNvImpeZ9Li8my4mTT8n4oSVbFO3Q5iAaAkh/Wct2bXYKmkqtm8jmKjZi3u3RHNPagECW0V8hRdPMcell+bJxMXGTPKsY8DgKWSqYBD4lmzv6kSXPWExBe5jR3E+q6foXtEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFOOlGu6A3HXNiTxSOVYmIky6cJS5r11sQ3ZStEXWgE=;
 b=urNA9+ExsVna/wspNRoqz/+mHCj/zijgZSJHIo/YlL9RvL0n1ptKmHpVfF1jfobZHA7WiZLi3x6j3Ddal7P4+4CloIuv5lJ+XcgjZSMO0o1cIGMp+rgqA261ZRhCAyQE7kTI5KNuUQft6vK5ryGdSf4yFKn6HYysmcfEYIeKJijKtwWDKInyZSbQwgmsMEBSWVYAiul1cvcf7VmlqwhAFc2qWBfh7wbDkX6xtwmOTkkmg0KaUxzv2UkWB8hBKdSBBm8ACN/dNrpaT+g243AT1oGZFED11lkWTrHgk3ETzMXZDKzAs7tVoQ9Sv1HF0nDclzOxhjEbC3Uf5S2Q+vrq+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Thu, 10 Jul
 2025 17:37:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 17:37:14 +0000
Date: Thu, 10 Jul 2025 10:38:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>,
 <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2 2/9] drm/xe: Add generic dependecy jobs / scheduler
Message-ID: <aG/6siVz+KYKgUfk@lstrano-desk.jf.intel.com>
References: <20250702234222.3278264-1-matthew.brost@intel.com>
 <20250702234222.3278264-3-matthew.brost@intel.com>
 <aG-pM2fCmMmRIYsh@fdugast-desk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aG-pM2fCmMmRIYsh@fdugast-desk>
X-ClientProxiedBy: MW4PR03CA0296.namprd03.prod.outlook.com
 (2603:10b6:303:b5::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7484:EE_
X-MS-Office365-Filtering-Correlation-Id: 126358cc-7c90-4f15-4019-08ddbfd86858
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?NJXMtyWxHA2oD3SnCJa5AaY7qlZUkiSxiiwPk85WnR29Sgc1dA6aI3jJyr?=
 =?iso-8859-1?Q?kRVFjLmetvs4vk98taWpwYVqyLyLMgR7RZ523kHgnnAAiN6APbSx0w1Vtr?=
 =?iso-8859-1?Q?A5k6ovuenugSNsgptpdteeV+q13PF4GMGn3Szqh2q5WkyoBY6IYi7PShKB?=
 =?iso-8859-1?Q?eCPYX2b6kttIMhnEf2B5AYjD5uKOFLfAG+scUDtfILUHGLc1yf9/2ZMZiP?=
 =?iso-8859-1?Q?NqfPkfG5+HGR2tTShgqD82JOYBCS3e2v5OH1K8SBTb+pjIFE32nRHb0aqj?=
 =?iso-8859-1?Q?e5QSbOKgKrlUv60MPpkN4WROqyNQtGiuMB+VHKF4UhDjDjKWl7BpzyIkdB?=
 =?iso-8859-1?Q?pjRrfJinePaHHirIEyAreewd9PgGobVOSp+E+nldGx8F34pDWmDgMMTpLO?=
 =?iso-8859-1?Q?ayIBBBchERUDTZ7wdWfxclJE4H306OrX8zfpQE8MaOlHTChmM54SsShqsI?=
 =?iso-8859-1?Q?4RxTZhE0Adjgejzj/WQGIV7mIyIirkbwFYrSR8b0TIqVpzy1PUK/tWaUgP?=
 =?iso-8859-1?Q?upmE6q6Im9CsrefR4HW8NQj2udHP2a0BM5wjf4H/OQoQ5BeQXTgUNmloBw?=
 =?iso-8859-1?Q?1BsWYGp1WW3bomJM2Jb240fwsmczpq4Utfgy2HOTIDoqUGVogPtqVfUo8f?=
 =?iso-8859-1?Q?0OGsZwayYQw8DDQWg5/93lYmQoPBAivF66tbUDDOxaIqmcjIxdxPi0fbdy?=
 =?iso-8859-1?Q?b3jazUtJXX9khE/9ODWv66/e2xz7FKX5/BAFLDm9vVucWXDKlaFep5ncgW?=
 =?iso-8859-1?Q?WG1pg7fjG3UrO96Kcz1tLQNDq7t5OsB/Ve4QFlM6jNj6TWPRV2oomu1YuJ?=
 =?iso-8859-1?Q?VMGaOabaSR+e1QUfXHSGcY3xqdh8ppVCEi5o3119BxUNs/1KjZMmWfqNYl?=
 =?iso-8859-1?Q?LOimRaoPMd6sLTalKFC3CT259U/05Dq0pYPxGHcr7e6Gd2g3WhzcIiGMML?=
 =?iso-8859-1?Q?CqNhVnB2uXYElo97RWGGV6jPJ7Lxs7qUsOBz1nhgnA3M1YNKUPH8Vc13f/?=
 =?iso-8859-1?Q?+/VqCzfY9lF6soUiVd60nl0XaFXekgTY1FDRHwK2RNWXz5HnLdywib6wJs?=
 =?iso-8859-1?Q?KiAA4jbQS4vRfynYp3nVybCHCdLRtebXUQNk3UAjPAyr212XEE8vE6MGPt?=
 =?iso-8859-1?Q?v8z784SxBy11SvN8+d1olv6h8OFt8wNuQLxw1N4lPq39ERRkj5PA+AsAV6?=
 =?iso-8859-1?Q?KScw7rh2FIraffnWLDiDsh5yXrz7xc99v3PsWsDEC6+IqAZ4oP7n89KjWA?=
 =?iso-8859-1?Q?Qbf3AtQWi2HXl04O49BccVIxvsGieZzmxw+8+cgsLq6GxfywqHGXT/53JY?=
 =?iso-8859-1?Q?COExSG9vK+cwY/gIXoLfZY2a/tztRNczu/gYh0ais9g90tDqw4yAJhqZXA?=
 =?iso-8859-1?Q?SQIvWtnK7h6QRSZJoFHrwjd+j5OVM5DUhhIpwlLxyngpirOi/OzJuRnhZD?=
 =?iso-8859-1?Q?TnxenYCjRpyg2LgfeCz+SMAluRYsgIn1oazDmJ+cQm0cO0xKU6T9I00kFZ?=
 =?iso-8859-1?Q?8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?rTU4Y/Sb+fxgMQjkwp9DaNFtE/VBsQbRi2ob9qIF6Ab6VBKHgPW3/sL7UX?=
 =?iso-8859-1?Q?nkorO/AIJBgIy/wwBmFA9m/qZX+nfpIZ6yYaJRbHYleHWtbxejhk1++Dt/?=
 =?iso-8859-1?Q?GzVO1j1XMiKWyMuun2OCPEvZ5ogGXkJJ+EdVqUjpDuURpqENaWAnS7sQ0s?=
 =?iso-8859-1?Q?oqtgwYOgCnDnQl/fUZ3OYvNfEAdJpY5yTjYObbFfaQ/t/upC0LUlcyyq0m?=
 =?iso-8859-1?Q?GYUtHup25zIyOEEknQ1QUEjK8lZ2a08T2xL4/nt9JEdlgoWyw8f2vUYuCo?=
 =?iso-8859-1?Q?Rc0WCSNF5FuA2VVPJBI8vZJwcrBow6mvEWgjKgt0bT7sTBsmYeGe3liFXk?=
 =?iso-8859-1?Q?HbYBk8QL48GuL604Okio2KQNzJasOvJ7kQaKkzlZaYGi0WusT+7zPpeMmS?=
 =?iso-8859-1?Q?pE0E1iUa1VBewUFZcASvkRfJQujnUtWFjpx1ujeAD9e+EKUwYh1srhiyOz?=
 =?iso-8859-1?Q?1uSzae7us0k3Na397U+kAfRPH9r6iVlJs2+lyy1q3W+jMrsBS/gUw1ZRsS?=
 =?iso-8859-1?Q?XO6BU41aF/BnSf9DvxSLYVSZermscnrkcroS4BOcnw4EAOVP6h0eaurAke?=
 =?iso-8859-1?Q?88e6UA2KJPeN4N+ETpazI8B+ef6AKoBVLTglrrWWm60GJX4V5xImJ2E52z?=
 =?iso-8859-1?Q?Dv34jHjPwru7Zaf40mL9xR942Mm6BPFo8OWlTHHkly0KtxbvQi1SZYnnpJ?=
 =?iso-8859-1?Q?NoBNJsOKNrlrv4FcEYw+1Uw0KxphylqBQDzgcorN/doUg1y+BFuNAfASKS?=
 =?iso-8859-1?Q?yaSfwZYRc9QMxPdTGqZ6JGz9gyrSxw5jsZ2o5/qYwUysaoduBXnRgzlWtg?=
 =?iso-8859-1?Q?4m7CWRoJdYLfVEvXT/MVDu1cuNwoy8zTOrhsWr5Su+Qj1k0Ieo1Fj8D+Fp?=
 =?iso-8859-1?Q?YRkDwL/OgGoK/31nUcA5LddB69E7bDkxctaYPebdgc6yRUOpA6/KbFvNDk?=
 =?iso-8859-1?Q?cbI6eeiY2aZbK+VU+wAHQjLD1ea+uJ84jqhDg6X0b6uUpDXora7QO2jrzi?=
 =?iso-8859-1?Q?RGqt6A5d4eVdU7rhbCntT3QJWXomCezC2L2Y7LT/WuWPHf8RReR6XtUlLP?=
 =?iso-8859-1?Q?ex544a528JdjbGyZ953g3MjWM/xH1leEPVG98Y7kMRa/feODyIOyppiZuN?=
 =?iso-8859-1?Q?8zggB8PtZbesdy7hFzDHduBzGyB8kSNItl3Auf/LR5Pq9joeAyqihuIheu?=
 =?iso-8859-1?Q?T8Dl5b6P4QnIwe3CPSvxFOe2GbgcSXOlCFsBMBGSC8z5LkGmgej99S+vMO?=
 =?iso-8859-1?Q?kbAq/1AtdPYpl/nTRmoxs3Y2hbs9wqbV3VLTXTN2MJZVhDj0SOjsvz9QtE?=
 =?iso-8859-1?Q?R6WVC8HICWUEq2hLtvd2eUKxn3MhKnQKBoAbFB5lQxUKZN04MUorMIHkep?=
 =?iso-8859-1?Q?Ps7XR4CrzGmBVmKsGOnRu4l3Wvtl9Wf688qCm70P7fZHM9B5c6+r43evAr?=
 =?iso-8859-1?Q?p0m97BWEwOhgQeQbSwpmhj1pegpMl6Hq8cXIyCE6iRHaFqu2wigf1i/EY4?=
 =?iso-8859-1?Q?4hHMC2/0Zqx3kDShqM1NuYPdD92g9HnSvhSOeTdyLznqSabQbK9yEXDony?=
 =?iso-8859-1?Q?16+ObSZia8b3vu6Zu7gm2ySnHk6P6dCVNS8fWqWSLCskJnDsVfVH/C9Vfy?=
 =?iso-8859-1?Q?IYiO0gMtet24e9dAMls0gzFV5dpoIV+8ZH+SlKiXDv+ZMPnwCNHUchiQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 126358cc-7c90-4f15-4019-08ddbfd86858
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 17:37:14.3050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UpvQ8DZcVREE4G5Y67fRU0l9Tbu5Bd4fjD/215eHjrVZNLquKOSeQlTqpzeWOaZOEqP9FSBJWg5NVJPzj6/zbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7484
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

On Thu, Jul 10, 2025 at 01:51:15PM +0200, Francois Dugast wrote:
> On Wed, Jul 02, 2025 at 04:42:15PM -0700, Matthew Brost wrote:
> > Add generic dependecy jobs / scheduler which serves as wrapper for DRM
> > scheduler. Useful when we want delay a generic operation until a
> > dma-fence signals.
> > 
> > Existing use cases could be destroying of resources based fences /
> > dma-resv, the preempt rebind worker, and pipelined GT TLB invalidations.
> > 
> > Written in such a way it could be moved to DRM subsystem if needed.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile           |   1 +
> >  drivers/gpu/drm/xe/xe_dep_job_types.h |  29 ++++++
> >  drivers/gpu/drm/xe/xe_dep_scheduler.c | 145 ++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_dep_scheduler.h |  21 ++++
> >  4 files changed, 196 insertions(+)
> >  create mode 100644 drivers/gpu/drm/xe/xe_dep_job_types.h
> >  create mode 100644 drivers/gpu/drm/xe/xe_dep_scheduler.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_dep_scheduler.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 1d97e5b63f4e..0edcfc770c0d 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -28,6 +28,7 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
> >  xe-y += xe_bb.o \
> >  	xe_bo.o \
> >  	xe_bo_evict.o \
> > +	xe_dep_scheduler.o \
> >  	xe_devcoredump.o \
> >  	xe_device.o \
> >  	xe_device_sysfs.o \
> > diff --git a/drivers/gpu/drm/xe/xe_dep_job_types.h b/drivers/gpu/drm/xe/xe_dep_job_types.h
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
> > +	/** @run_job: Run generic Xe dependency job */
> > +	struct dma_fence *(*run_job)(struct xe_dep_job *job);
> > +	/** @free_job: Free generic Xe dependency job */
> > +	void (*free_job)(struct xe_dep_job *job);
> > +};
> > +
> > +/** struct xe_dep_job - Generic dependency Xe job */
> > +struct xe_dep_job {
> > +	/** @drm: base DRM scheduler job */
> > +	struct drm_sched_job drm;
> > +	/** @ops: dependency job operations */
> > +	const struct xe_dep_job_ops *ops;
> > +};
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_dep_scheduler.c b/drivers/gpu/drm/xe/xe_dep_scheduler.c
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
> > + * The Xe dependency scheduler is a simple wrapper built around the DRM
> > + * scheduler to execute jobs once their dependencies are resolved (i.e., all
> > + * input fences specified as dependencies are signaled). The jobs that are
> > + * executed contain virtual functions to run (execute) and free the job,
> > + * allowing a single dependency scheduler to handle jobs performing different
> > + * operations.
> > + *
> > + * Example use cases include deferred resource freeing, TLB invalidations after
> > + * bind jobs, etc.
> > + */
> 
> This is already well documentated but as this code might eventually get
> promoted to DRM, maybe we could add generic pseudo-code showing how it is
> intended to be used, for example:
> 

This seems a little verbose and typically only use detailed code-block
example like this in uAPI. xe_gt_tlb_inval_job.c (patch 7) should show
how use properly use this too.

If / when this promoted to DRM, then perhaps some code examples would be
needed.

>  * .. code-block:: c
>  *
>  *      struct my_job {
>  *        struct xe_dep_job dep;
>  *        struct dma_fence *fence;
>  *        ...
>  *      }
>  *      
>  *      
>  *      static struct dma_fence *my_job_run(struct xe_dep_job *dep_job)
>  *      {
>  *        struct my_job *job = container_of(dep_job, typeof(*job), dep);
>  *        
>  *        // start the job and get a fence
>  *        ...
>  *        
>  *        return job->fence;
>  *      }
>  *      
>  *      static void my_job_free(struct xe_dep_job *dep_job)
>  *      {
>  *        ...
>  *      }
>  *      
>  *      static const struct xe_dep_job_ops my_job_ops = {
>  *      	.run_job = my_job_run,
>  *      	.free_job = my_job_free,
>  *      };
>  *      
>  *      void init()
>  *      {
>  *        struct xe_dep_scheduler *dep_scheduler = xe_dep_scheduler_create(xe, wq, name, 16);
>  *        ...
>  *      }
>  *      
>  *      struct my_job *create()
>  *      {
>  *        struct drm_sched_entity *entity = xe_dep_scheduler_entity(dep_scheduler);
>  *        struct my_job *job;
>  *        ...
>  *      
>  *        job->dep.ops = &dep_job_ops;
>  *        drm_sched_job_init(&job->dep.drm, entity, ...);
>  *        
>  *        return job;
>  *      }
>  *      
>  *      void cleanup()
>  *      {
>  *        xe_dep_scheduler_fini(dep_scheduler);
>  *        ...
>  *      }
> 
> > +
> > +/** struct xe_dep_scheduler - Generic Xe dependency scheduler */
> > +struct xe_dep_scheduler {
> > +	/** @sched: DRM GPU scheduler */
> > +	struct drm_gpu_scheduler sched;
> > +	/** @entity: DRM scheduler entity  */
> > +	struct drm_sched_entity entity;
> > +	/** @rcu: For safe freeing of exported dma fences */
> > +	struct rcu_head rcu;
> 
> Is it used in the series?
> 

Yes. xe_dep_scheduler_fini calls kfree_rcu which is required to avoid a
UAF in fences hanging around that were generated from this DRM
scheduler.

Matt

> Francois
> 
> > +};
> > +
> > +static struct dma_fence *xe_dep_scheduler_run_job(struct drm_sched_job *drm_job)
> > +{
> > +	struct xe_dep_job *dep_job =
> > +		container_of(drm_job, typeof(*dep_job), drm);
> > +
> > +	return dep_job->ops->run_job(dep_job);
> > +}
> > +
> > +static void xe_dep_scheduler_free_job(struct drm_sched_job *drm_job)
> > +{
> > +	struct xe_dep_job *dep_job =
> > +		container_of(drm_job, typeof(*dep_job), drm);
> > +
> > +	dep_job->ops->free_job(dep_job);
> > +}
> > +
> > +static const struct drm_sched_backend_ops sched_ops = {
> > +	.run_job = xe_dep_scheduler_run_job,
> > +	.free_job = xe_dep_scheduler_free_job,
> > +};
> > +
> > +/**
> > + * xe_dep_scheduler_create() - Generic Xe dependency scheduler create
> > + * @xe: Xe device
> > + * @submit_wq: Submit workqueue struct (can be NULL)
> > + * @name: Name of dependency scheduler
> > + * @job_limit: Max dependency jobs that can be scheduled
> > + *
> > + * Create a generic Xe dependency scheduler and initialize internal DRM
> > + * scheduler objects.
> > + *
> > + * Return: Generic Xe dependency scheduler object or ERR_PTR
> > + */
> > +struct xe_dep_scheduler *
> > +xe_dep_scheduler_create(struct xe_device *xe,
> > +			struct workqueue_struct *submit_wq,
> > +			const char *name, u32 job_limit)
> > +{
> > +	struct xe_dep_scheduler *dep_scheduler;
> > +	struct drm_gpu_scheduler *sched;
> > +	const struct drm_sched_init_args args = {
> > +		.ops = &sched_ops,
> > +		.submit_wq = submit_wq,
> > +		.num_rqs = 1,
> > +		.credit_limit = job_limit,
> > +		.timeout = MAX_SCHEDULE_TIMEOUT,
> > +		.name = name,
> > +		.dev = xe->drm.dev,
> > +	};
> > +	int err;
> > +
> > +	dep_scheduler = kzalloc(sizeof(*dep_scheduler), GFP_KERNEL);
> > +	if (!dep_scheduler)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	err = drm_sched_init(&dep_scheduler->sched, &args);
> > +	if (err)
> > +		goto err_free;
> > +
> > +	sched = &dep_scheduler->sched;
> > +	err = drm_sched_entity_init(&dep_scheduler->entity, 0,
> > +				    (struct drm_gpu_scheduler **)&sched, 1,
> > +				    NULL);
> > +	if (err)
> > +		goto err_sched;
> > +
> > +	init_rcu_head(&dep_scheduler->rcu);
> > +
> > +	return dep_scheduler;
> > +
> > +err_sched:
> > +	drm_sched_fini(&dep_scheduler->sched);
> > +err_free:
> > +	kfree(dep_scheduler);
> > +
> > +	return ERR_PTR(err);
> > +}
> > +
> > +/**
> > + * xe_dep_scheduler_fini() - Generic Xe dependency scheduler finalize
> > + * @dep_scheduler: Generic Xe dependency scheduler object
> > + *
> > + * Finalize internal DRM scheduler objects and free generic Xe dependency
> > + * scheduler object
> > + */
> > +void xe_dep_scheduler_fini(struct xe_dep_scheduler *dep_scheduler)
> > +{
> > +	drm_sched_entity_fini(&dep_scheduler->entity);
> > +	drm_sched_fini(&dep_scheduler->sched);
> > +	/*
> > +	 * RCU free due sched being exported via DRM scheduler fences
> > +	 * (timeline name).
> > +	 */
> > +	kfree_rcu(dep_scheduler, rcu);
> > +}
> > +
> > +/**
> > + * xe_dep_scheduler_entity() - Retrieve a generic Xe dependency scheduler
> > + *                             DRM scheduler entity
> > + * @dep_scheduler: Generic Xe dependency scheduler object
> > + *
> > + * Return: The generic Xe dependency scheduler's DRM scheduler entity
> > + */
> > +struct drm_sched_entity *
> > +xe_dep_scheduler_entity(struct xe_dep_scheduler *dep_scheduler)
> > +{
> > +	return &dep_scheduler->entity;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_dep_scheduler.h b/drivers/gpu/drm/xe/xe_dep_scheduler.h
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
> > +			struct workqueue_struct *submit_wq,
> > +			const char *name, u32 job_limit);
> > +
> > +void xe_dep_scheduler_fini(struct xe_dep_scheduler *dep_scheduler);
> > +
> > +struct drm_sched_entity *
> > +xe_dep_scheduler_entity(struct xe_dep_scheduler *dep_scheduler);
> > -- 
> > 2.34.1
> > 
