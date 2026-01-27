Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA92D2FEE0
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 20:33:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D49D10E13A;
	Tue, 27 Jan 2026 20:33:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KeiOcfQx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 206D510E13A
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 20:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769545985; x=1801081985;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=etO9oH8aN3wYijQO9PZ471RTLoFMXwTtngApLqkERco=;
 b=KeiOcfQxYxHXtGtHiuVFBYULCK9waM7bfOYqrSOS5mDsfqF1CFjtwC2S
 /j0tWiTdfzcI5fgxXybjJ136jEQlp32sPNNrLpGxNeRlQlLtEHFvYV9xB
 NUR3o6sLOeAZkOL0hUHUOKLS9d4dYOYmmTctKWc8q0UcdfZX60oRFK2Bb
 jUM7sSc/ttbdxz+UCuDU3SfiqJJD5IV4bNZHl/tcbBoPK9jqH8eKxtgYc
 LzCiIDYiRlosowZDdMrQn91A11b8L79cyY3YyGDTLkzCrt7Lh7Snvsy4X
 Yen/d8P7eBDgwf/av9poNvgVccTVk/AaFfi6moWkpZU3iqUaispn2uJDj A==;
X-CSE-ConnectionGUID: ISHpb2QOSu6w39stS7/BlA==
X-CSE-MsgGUID: 4qc+r35xQK2HXA4opxodbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70808963"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="70808963"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 12:33:05 -0800
X-CSE-ConnectionGUID: yNWi/4PlThOOUdDaIc6TPw==
X-CSE-MsgGUID: Lna6MoIJR+SFRug1LOkGfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="212180546"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 12:33:03 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 12:33:02 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 12:33:02 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.10) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 12:33:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jxLGSBu3/Wrst3um2TLGlFWFJv/AXZ0u6vZ1ewfwLfoY2QzL9pYfg1sKYJ0WkUjQR/wJGfwtc1R/MBLZov3yHldO7178fOfR0+n0X8JXK6VzrGxkiXvY96Si73+McGaBubzWrhV3KMGRkRmpMU9p/A1bbi2ZC7lbRHglfw7idjZcG4LFfVispEByPcZBcDFkXXUhqi5JhUa23iUbYLvr2VRZ3RwIhwd6WZv1OyiGZvBlfh+8x+jPCaAKAVzHFdNk2wCiOHMXDbt0TD7rJK5FRPVEcbspiqBf9DhHlCvu9tzJRHqNgc/sTos40MW9EfjK6FD9HyvQAkb+qbf/mNl2Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1kOtxO0ZMX6a9Ba27uHx6Xgb0GYZMwdqEtmRpqt6gaw=;
 b=GBHzB6dMXb9ieTnyB+hnfUpQCRHrSnWbSEwh1Qt66V2iQ4oXEybFUumhk69ACFhZQv9UL5G8Wpt478pDr8cW+GVlhxqemNuztLK8H7N3sLDtbx3YV+O0Ht3pn8pXXXshDkBvJrReQi0tdc1i7/Bj8VL06CZWA+4+23D0z0OHFqL7CT9AMaXDi6Q/zIDGwGKCUnL6K7Rq/5nzA6dq46x+lqaAVo/5pR3WH43NVuRqmz8LOKaQS2m45hfRHckkEUNd/0QNAdjF4RXrER1+ALIyG+QrKDwBmKdn4GPpHklDRckioAAE/5y/DmCxgtOyK+6sBB9ntJQDXuu5yeiSk3bTMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4875.namprd11.prod.outlook.com (2603:10b6:806:11a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Tue, 27 Jan
 2026 20:33:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 20:33:00 +0000
Date: Tue, 27 Jan 2026 12:32:57 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Varun Gupta <varun.gupta@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.d.roper@intel.com>,
 <priyanka.dandamudi@intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe: Rename xe_pagefault_print to
 xe_pagefault_error_account
Message-ID: <aXkg+bEgSJxGURQX@lstrano-desk.jf.intel.com>
References: <20260127115713.869000-1-varun.gupta@intel.com>
 <20260127115713.869000-2-varun.gupta@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260127115713.869000-2-varun.gupta@intel.com>
X-ClientProxiedBy: MW3PR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:303:2b::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4875:EE_
X-MS-Office365-Filtering-Correlation-Id: 20a1ec87-e210-47fb-f148-08de5de34372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ky29ar4u8OBBWauMnztUZ5na4aNyZCRlsHSebTmhdeSzXlOW33TOQxyTP/pq?=
 =?us-ascii?Q?8/Q/zE+TYZ/H7QRYrhv6MLjkHLH2MMJ4J07gbExFlK/7HxPXBybCR9VNnrsk?=
 =?us-ascii?Q?PLxWlRQT24bCBmMrL1ArsuzDjyNOMn7S124mzq29bnFhYqii8yO9jvL776KV?=
 =?us-ascii?Q?sTuL/+ygi1kqkFvBPSt4pyPHiJNlPcgmNARanx0jH9UKl5g9Fe8VRFf488/y?=
 =?us-ascii?Q?wPHRW70oVfuxAoOSt1jQCMP3y2QsbskJ0MBwVasLUQS02kHPvTgMsES7TuPk?=
 =?us-ascii?Q?atbdlGina3EIv3Ncmvp+EGwCdX8lLocfactvh1trIMsq/iohcLbHyYGpwK22?=
 =?us-ascii?Q?+9m1/sI3a51iDSCZTvAwv1cw0Y4EXVvLd9L9+wEOd/QPnprTXRVBBUPHix1q?=
 =?us-ascii?Q?AA/ieUw/esXIOarvScNmDARXNyBD5HMfP52gZzR+CClv6eltkEHy6q6whKiS?=
 =?us-ascii?Q?bLI4H78/yDlfL5sgeQRLZ8msD+wzjVT+020Mgd4DsBRdOL2PeV1wrjSdtXmY?=
 =?us-ascii?Q?nz8Snkb1O+R/h0JCXLbfO69YK6gb0KMfoWGo6tVsFn6hlKmUZ2KIrHNXQzcY?=
 =?us-ascii?Q?VqwgdAO2tvsdXTm78IMeeoMJNENp0zpx9sqsww6OJtwckcvbdtwnrYhYtn7L?=
 =?us-ascii?Q?O5et+5G35loLdDqf+FWY1PLIVfnnXVn33Er6JqaNi5zUUfvoWvGzndy1rTtF?=
 =?us-ascii?Q?qrOH0rYw3CZVOizSjWqkyJEah57kMtHSZtJfs6ouH4TGVD/MhZPZ9+MKWSgD?=
 =?us-ascii?Q?y9ajEoqIiTeYx1CmoOtiu6PeYqzDCmc1bcSH8huSpCKRUrlgUT2hqiixwiB+?=
 =?us-ascii?Q?o0fRkvzBizoUjaOTRwgjHbk8zECn+xbr0os+yRdCt8/oLJWrtJlCjkC0zVmc?=
 =?us-ascii?Q?7bbZGadR5MK2tw+ANQMzrIreoPKEEwpOjfHVEQfFEJwDyrXg+oKyhOdmGUQv?=
 =?us-ascii?Q?JV4WWBTEWlZLWckfQ0qMxB1JkUhgDBpGgQk1d9o9uBTItlQHBE03dJZaytGW?=
 =?us-ascii?Q?uCmW9Cm3zDOIwqKDpmWqqkoheAyAuQZxcpDwsjiWoC9TFXTE4j94fVIaPzuV?=
 =?us-ascii?Q?pas2euvbGfYt5PPjZ+T66q78OrV32dApx9nRQBXlHTSDIQ9rSZGwogfo7H64?=
 =?us-ascii?Q?4KM0zBrp8OW/QgBorViWVwLQEICFRFIP+GdbmclJmjFaswuRfz51VbKrgUZn?=
 =?us-ascii?Q?6dLsxMQpHeKAu2FgTr6klDhHwymZbgF2pK1eM7OGeTcmMdjE7vWVexjo1Dh9?=
 =?us-ascii?Q?WLZzikYCFfAoQKkEMPKt+PUQHHYf25TAT6IkeFds0iBdcGjF+1mex3k3wFY7?=
 =?us-ascii?Q?7dnC4T9N+pMjhucNwsqi10lZbiDIV+J2Ugg5LV6jf5QzQ8I+UVIfP8Ot6sg/?=
 =?us-ascii?Q?/EJiL8hKAxvMf8AgWVX1mJpg7vpV5DXwAVAvs8DX8ODY/GT4WUMaKZmG+9QF?=
 =?us-ascii?Q?wibzU23klTKGygwwxcNX9+4+gOp0Dxiwraa3X3T/BMvQHjMIKSbAiyU6UTzq?=
 =?us-ascii?Q?220/TJPERZw3cPaZqOsq4bOYxSy5mcQRFc5FS9R+nPa3fBBdefNq+01tS4Pk?=
 =?us-ascii?Q?xNaE2Z98GmDeek+Epr4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9rqmt5fHEzAocJ6h1vCfaX8dpa3ksyrAAw8WTnwVcX4BGh/7ACjgQ1VS/SW8?=
 =?us-ascii?Q?A8eyvvNwwa/8TVWYi2Q7A7MP+LY1DRxqxN4FuTdQHW+BOXgXN3KP4AZs28kt?=
 =?us-ascii?Q?Pt1V2tv84xMa/2jRxCRe0CsPQn3wsYCMiTOE3K9QQbabChnxXUmIZaTvFVbo?=
 =?us-ascii?Q?d79/+JYF/1VKUXunVU8m+tOelUXhl4udxa57g17xJxV/O9j4wEbf/2YuAQmb?=
 =?us-ascii?Q?G//q7a7l9tetbNqx5RQyoPVTi6rukzDD6CcvIjdRcSWDEAC3ou7jMrt+K8eK?=
 =?us-ascii?Q?32dF93HFLFWbsYLHo2p0TsGzVfTq1ss1XhJrCna7KbKxx9MxSVCaUeafiNGC?=
 =?us-ascii?Q?82GA7JcwMZHp7bJiN8Bz35ONKzk7uP0WPXez16sTNeb4gF8ddpH+SeZ++3Wt?=
 =?us-ascii?Q?m6FVAcTYBaryYJvzw0iI3QZhD/7bmGvpts+YSaOX+YlEVmdQwnZuCdqFjApo?=
 =?us-ascii?Q?+e0G4P+hrpMgBTeoj6CKIMBsbVRWq/dsh4zkTWahPwYdtooGb4Xsb48Zklxi?=
 =?us-ascii?Q?8zCMo3q3HYGp4g3/RJ4n+urMqQTOIBWpwyxg3gKxQER4XqAFYOhrLcItkfOs?=
 =?us-ascii?Q?FiXNS4wAp0tByOpdfxhrgEFnNyZ4eBiNhkOp0Lw52j2/GC7SthBtzC0XmQIT?=
 =?us-ascii?Q?GiROEJHBi+MSYQ16UlAQWqChu06t7CFA5RauUmTXAvfFI12rEezMS5AsfZtt?=
 =?us-ascii?Q?oQ0pgC4zRtm6TpzVWP5iz5p+0WswxefJsynoqq6a6PC+PHKuqEx9PbfWLgNV?=
 =?us-ascii?Q?UNoLqCTmWs5v/JPwzKuHxYzKLrnAuujtXgGJyDRCQfi1pqQ0hq1lpzxuyYJ8?=
 =?us-ascii?Q?nO8nTeugWXAXvmd2MVGGAtOM5J0YZVUoqeXV/wWy8aT8gRcomr7lOGMLlj94?=
 =?us-ascii?Q?raHNUrM11nBcTKzMVkADg9OvmqfU4r/G4/xexS9Bvnxw4/PD6lncwFpREdxr?=
 =?us-ascii?Q?3q4flQBpjrSReCM1VFBgK3EdvYiJ6thmn4/45zVUgLZDe/BUlF845dFutwBq?=
 =?us-ascii?Q?h0w7bJ1JmauVaTdfiWQ/S2y9hf5/KjSRHbLfYCJvq59QDGw7VgqPkLhR/3SG?=
 =?us-ascii?Q?CuG1pF3uB12XXHbygGcvOFCGi0Qf8mG8KFXNxmFA1Pj/EyAiahfKjAMRa02o?=
 =?us-ascii?Q?Uhh+bqUgH99fneVz8+HQwC4D711TfZU6nqznGIfBuZKJgng2ofRJqvWeXsQq?=
 =?us-ascii?Q?XIhUxLZssW+ca/xd/3p6tOCr5KyRfKde6Q+680FnLlRGhd5iPwYzrD5dNcTr?=
 =?us-ascii?Q?jQNMfI5l+N8SAeobheYbVcxI3ETbx8YDSGZjyQb+MWhfaazILeTFlNEtu3Si?=
 =?us-ascii?Q?J61MTW3t6lr3dANFFsG1QwYnDRrjxaUDKS8MN0w8N7cwqAy3A43uRows3AKV?=
 =?us-ascii?Q?qgaQqfwXbChea3JawaJ+xTl+B0AilE6FU/EctZH/LL3RYtrnBaYKWVLJ9B5D?=
 =?us-ascii?Q?IlsaTel7oZgwQXiIGPuiJytNsqxifvTQUae5PO8nVA5MMbcyV8U61ikLtXdf?=
 =?us-ascii?Q?aYjlXz1WwNQB2d0UvOQ7QV5ThD1OCJCFrKkAlsHv2u0GBZPXJYSafFkc0Kuz?=
 =?us-ascii?Q?TisXBPw5ZLat5MHcsoTcodOiLqH3dPn+dh+qjwU0qywZXhUgNNJ+x2oeGUQK?=
 =?us-ascii?Q?vil18i1IvnROdLfZa3ddTDlOFoGZG7a8pLpzBlnVs1KXKhRS7i6MPwAHjA0o?=
 =?us-ascii?Q?veEaw0sTC4MNQVpdfD1pm1qTm5tTD9KFzOqvM75//nyuSOmCQyIRPhMJIPNn?=
 =?us-ascii?Q?fYn8T8mlrqxmhukY9SRSGFNLsWB7gBw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20a1ec87-e210-47fb-f148-08de5de34372
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 20:33:00.5253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5y6LPoJDsJwBOgZmUZQGFg8z+4G6CLUYGPZeRPR9xqhMfss6LWUSuZPXW2Sx4ZDsPYHv/RNAxPH4f1aybWx0yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4875
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

On Tue, Jan 27, 2026 at 05:27:12PM +0530, Varun Gupta wrote:
> Rename the function to better reflect its purpose of error handling.
> Add an err parameter to the function signature.
> 
> v2: Clarified commit message to describe only the changes made in this
>     commit (Matt Roper)
> 

I'd drop this patch and check the prefetch bit at the caller.

> Originally-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pagefault.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index 6bee53d6ffc3..34dac4280b9d 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -221,7 +221,7 @@ static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
>  	return found_fault;
>  }
>  
> -static void xe_pagefault_print(struct xe_pagefault *pf)
> +static void xe_pagefault_error_account(struct xe_pagefault *pf, int err)
>  {
>  	xe_gt_info(pf->gt, "\n\tASID: %d\n"
>  		   "\tFaulted Address: 0x%08x%08x\n"
> @@ -259,7 +259,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>  
>  		err = xe_pagefault_service(&pf);
>  		if (err) {
> -			xe_pagefault_print(&pf);
> +			xe_pagefault_error_account(&pf, err);

e.g.

if (err) {
	if (!pf.consumer.prefetch) {
		xe_pagefault_print(&pf);
		xe_pagefault_error_account(&pf, err);
	} else {
		incr_prefetch_invalid_counter();
	}
}

Matt

>  			xe_gt_info(pf.gt, "Fault response: Unsuccessful %pe\n",
>  				   ERR_PTR(err));
>  		}
> -- 
> 2.43.0
> 
