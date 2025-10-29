Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0455CCF9EB
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 19:48:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EAEF10E82C;
	Wed, 29 Oct 2025 19:48:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nJ5Z+0PB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E8110E82C
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 19:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761767311; x=1793303311;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zTbhHMsg4wOzAwhziakZVfofDgNL/axQOGq/jD5rZo4=;
 b=nJ5Z+0PBqLpsqoyG5yB565ry26RF63YKM58mczChEEJmM/jrCL1W9Smc
 uex2m8my6jEAB0o/IqLzfkds+g2UL0KpD1gkkBjS6/+i2InLzud8p1vBM
 Z1K+bAvk78SRsB8I27uhxIJewWfvHeWI2VmGSKhzuR8YQTZke/qesJ5Lz
 wW9nu2m74yd7KusPHIq+W/NzZtQ/5+qriT6OR6TqYEhKy80DnwyLv5JtS
 TOUlRbJlyYhkAzq5/SftCyGhNf9sIMs6kV4mosXx29H9oJzeWWbCiq7df
 ag2BayQGTK2kB9yMnQlu2RfPYGQPzUlU2iLoWH5mbhWOMi1ZJWtDz3ryg A==;
X-CSE-ConnectionGUID: U0YmK8zqSzGZ3X4m4pifJA==
X-CSE-MsgGUID: VqiB4Zg/TXWMfbic5oQ1lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63831612"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63831612"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 12:48:31 -0700
X-CSE-ConnectionGUID: Bjs37jMKRF2c+1AygOWukA==
X-CSE-MsgGUID: tfbvNEpsQMSrN1xTjIrZGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="190889369"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 12:48:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 12:48:30 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 12:48:30 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.15) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 12:48:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZlPBli1JtkdZYRTx1+fmH8GTFcKv1C0HIVjLzNiAra/oQWMoc9F7poEaXjcjPiSRFJoArdDZ+bhJDXXafKbTs6cKYe4LzRlnRjO3p+0jGWPbgpqacANn8+cYELIFWQOeueEeuZW/mEV7VEi5r+CnT2GpmI83rjG3f4vXqojx+tz5ScEEYaEqHZwVHz8yqfUySvvfDsge0hycRtDdVnvjCw5eUO8AK2+otRC5SZFUq3LXFIsMbveQIC1fCot9TQxDb6uX/S+VpWgCWfpcQz/mbN7Vw6b2KHMtm6Nlj89aRVgVpVmcpWBO4xyGheT7wH9vnhJdLcn/Xk3mHQSN9Qk5og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39346Fvcp7x6X9kf/WLmJWGD0tQGPxsdv0BbjL6CAsM=;
 b=Ygjvtco8YnDtI8/3lYSp2x5Gd7CcLyHoNqF7m4SOGIVVodAZl4O53ZF1/Muodj6FysRo4P4/+NkCb5fUrJtco4jfKbjq4lkWaBTrP/eUpMaUw9ZUjEsVcE9QIPGth+gtI/nIN5haSdSC9EBzw+Dsdg0TDknxKU8qsaufh9dpKjI9JekQwlS3RaOB463jOKgHUDuuzbbbMZykSuDUWUVxwa69ZLDz6TYtqJLeE66G9nOyDruVAwAQI9x1xeSlDcoa/hgN3QCnGr8ETP/mDX5SsASXFqkpRh1c1APKYV41KeW91Jn0oIlgILNncL5obDpB6K5xu6jgwCXqJH4th7y4QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB5087.namprd11.prod.outlook.com (2603:10b6:a03:2ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Wed, 29 Oct
 2025 19:48:27 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 19:48:27 +0000
Date: Wed, 29 Oct 2025 12:48:25 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Wang, X" <x.wang@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>
Subject: Re: [PATCH] drm/xe: Dump PAT entries with reserved mark
Message-ID: <20251029194825.GF5409@mdroper-desk1.amr.corp.intel.com>
References: <20251022215504.5559-1-x.wang@intel.com>
 <SA3PR11MB804663C2A664A60E8713D7AC86F3A@SA3PR11MB8046.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA3PR11MB804663C2A664A60E8713D7AC86F3A@SA3PR11MB8046.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:a03:74::30) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB5087:EE_
X-MS-Office365-Filtering-Correlation-Id: ffceacf6-e7c0-427b-de49-08de17242133
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AGHBANT/a3Mh1LKPIZ5KBOf3iXAxCJF/8VOnVBXm2ME6quw7KM9obMe3SEqZ?=
 =?us-ascii?Q?NoZO7Cew77nCQf2iSv0TRApBEtzd4VUV9V+xXXoFPmMoLaZDOpnI/5BElbyl?=
 =?us-ascii?Q?mQ7QxUvUJtTsKZUTaZdRUbmq88bqKssitzz17ZwexnQX97SlQDFqeAlnusCX?=
 =?us-ascii?Q?Yu4L1rup2J9xQF1cIkBUJRH2r5Y8EipNpWonIFDqRBtHksl5U25q9YcaR7lw?=
 =?us-ascii?Q?bqpdDKUBYAjSLw/PfHtsfdjOShoY46mM8w5WL62DAHUIdhgnxz2VpX0J9cob?=
 =?us-ascii?Q?NJUbpB+D1LwYdJ5hXfjmEV0xzbaT03WjQjQabEwVP04auHynFAeP1Dx//LCU?=
 =?us-ascii?Q?vUG/6vJrHFNCLfj4gt9rYuOyh9MLCnv0ovEcXMKCJd2jtykTR/IUAQuLf3+i?=
 =?us-ascii?Q?gmv16CNxJRAKb/GUAVQzr8pOZuPVBudEFtuk/eRFMHYUELgwfoJVdafobMie?=
 =?us-ascii?Q?tQrAYg8U7wVjV+y+1FroZuMv9Dn4SxoKDgz/bwOIF0gLAMWfG81cgGb/WjD7?=
 =?us-ascii?Q?MwQk4SvVDnfFtzsXbKKJx9gP7iED37h85KTux8hZqwaWYvjQq7ae5Z6iPB5n?=
 =?us-ascii?Q?7w34qds1i54gxdjbqpVbdw0rsLS7FkDHTX4TS3etKanKpJp2IKve8qhzxFpu?=
 =?us-ascii?Q?FysX9s/c+z8lQo2ulbm49x5dH3I5pxMR7kF/lY/pWP9SZG6n3CNwrNvrGxFq?=
 =?us-ascii?Q?w6TVcrVI3Jsi2WVM9Zvp/Uos2Z7Rrb2Cl7yMVasFtOojO200O6UIXKYyjbe6?=
 =?us-ascii?Q?a6MpuaOsjsX7GmzKgMOUKNXEEUt25tR5yS8S2HujqWZsh98xA6bDhbFcExlT?=
 =?us-ascii?Q?zx0KRz/1mcOesFTGD2mLW2av6GuDYp52dkGLHJq18KWQeTndtUjLxgfMsCce?=
 =?us-ascii?Q?Vz7XZl2kE5H1KmqgF+0sp1O4jw+ecwegaxrobf4XwsrclHDVx1oeqmC+jZue?=
 =?us-ascii?Q?nf/iIF2hmMrwQUDuTmHdO54hFWcf3ahvQi/cV5l0i0NZEHvQbb8WV5indl/w?=
 =?us-ascii?Q?mPYjIla5TkFH+OR/KXEfiXgmRakbmj0vIz3ZZ1LXwC0NYW/jSsMB4KvGI/xE?=
 =?us-ascii?Q?r0OiBBzUIrki5v1mSYi2cRQ4WoXEwHx5O+DfLVXVuck4H/Ieju21h0TmDgwc?=
 =?us-ascii?Q?L6uFH2XbM1e7BaN81J+fsoNgWXf+K12JhH0WgBgNUvjJjBBX9mKj532SToyM?=
 =?us-ascii?Q?UCdh4Pjcg4Frwv5D0v8VNU6Ky4GAXl0D7qi8gEtjNSc/fTkfbqFlXTrVBrbs?=
 =?us-ascii?Q?XSdzHBw+sVCtqtAwW/2tdTMJbPiQBjJ38AVeRag2Y+QecFxsgg9wNTtBp9oG?=
 =?us-ascii?Q?PlO9Y+t1waSi2hUWiuvIEiWvR8xTqic91Yn9Gqz7ZJcvOoEW+EucAfn52v/2?=
 =?us-ascii?Q?JHukIBP1JKjaLHhEcVZduVM4j0qG1q+GgmKMB2oocxc96pIT2/u/EgRim8Cl?=
 =?us-ascii?Q?VPkorZ3zrcgIjP7ibA/LI9ejajZfcmW2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k5K1GgkjpqTTO4oRKapsHUSChcBzH8g5NESKc6W5pHUoxYnDsznA+YSTuCjt?=
 =?us-ascii?Q?ZV1eU0kzJll5XNw1ZVfMrV00hyYcPMEzmgOt0ZDpVgPwvPGXrBywLA8HNJJU?=
 =?us-ascii?Q?es9cqA6pXY8rZkfHsHsvcXI2zrZntREwRJ2AIhDH5Xik3FCJpu7C6C+0dQ2q?=
 =?us-ascii?Q?ox0s4lGt2p2ziMf5NmnZ3/BIQjOSzf6yI1hYCmGuXZrcmKJD7L9IdDlcSYis?=
 =?us-ascii?Q?Qr0wE5+QgYseOL7eGre36ndDDDJlC33BxIjhcHLMXTfv73DzSLvPqRsdFGvb?=
 =?us-ascii?Q?WG4yhoQpylP8flyr4SJX2KGXsNEdCj5uFTgEyeAGADsSRGQ+hj0d84tfY+zs?=
 =?us-ascii?Q?CBapbVq2kvQLtbyjBIxxBYMlRxUNgT+IuxrW+roF9+rhq9E4Us4kT2yZRRD2?=
 =?us-ascii?Q?JAM/yB3vEBcl1qPCmYvgCzH9OFUJoOdAdda62jyNMWmahItNGWpVdem35eYj?=
 =?us-ascii?Q?jXG9//QK98Gv1HLTNs4rFX8+oweOd3XnnSuR/fcaBY/ubKaxiDE2IHfpQbe4?=
 =?us-ascii?Q?GuE4fpPTRwL1ijecHx28efWUPRCHrTYEl/7CYyytzYLB5sKFgfGPwVm+eOjO?=
 =?us-ascii?Q?vtGDMbibuIebsbvW6qk+/0XochCn+e/btoUOwmvd16yb/fFC/NXxaQRajo9Y?=
 =?us-ascii?Q?qrELU5d0QP5IhgoV002K/LA4YcACyy1AY1tViiP+rBOEzqF3if7rPti7wvjM?=
 =?us-ascii?Q?gOs0L7V+e7kXxXnwoeU/DbnRb9n4YEzz7KtR+Hvrk1dV8hF9nF55aK0zF5y6?=
 =?us-ascii?Q?/yyGBhxnr8HsMIJFoHS5UMf1GRPn+jFmsLoGRelvKelEj6VRGhyBGwdhw2bG?=
 =?us-ascii?Q?0DY9lKz+t9zr12WavvvsWar94wHPAd1Yat3PEqyhntaQhiv0GL8rvK07zfQC?=
 =?us-ascii?Q?iXKEPmz1GO4ZVhl0dDZwf5wQtsU5sExnZdtojsfEOaI1A9Q93snMfobNKt52?=
 =?us-ascii?Q?DOl/9BCD/epI+Ouy9pqFMiLgAGrm/6aDW64VWKd92312raQTmW1VUCsqfzb5?=
 =?us-ascii?Q?6b9FpMusF81OZCO/YevbV5MvXmKdJIooY5+dM2SAg3+gmYWEqa3We42/Vvgk?=
 =?us-ascii?Q?Ms2ajaFUiyrNoZ3n1tjzj9NC+FXQZMi0j5z5I/SdVzwhfemS75vh62d0rMQT?=
 =?us-ascii?Q?yJiSO8euSDvJiYjBU0wVtQJib/mzllQuM8mJLij5wXqmC4b72d8ORbg1O4+j?=
 =?us-ascii?Q?ZEbKc11+CDh0GTpSm8kB5fUdSsRMH6izUhxBo350GHunRbUBLCoF/ltcm/Wv?=
 =?us-ascii?Q?YeOLfilIzV5iaVnQXdGxv2NeQ3Ca9rMJcjXD/SweczkNCgmHBzkNBlNW68MA?=
 =?us-ascii?Q?8TdUInermBTZcQPohdv+cyVDej9wKlzuUfHK1P234306PfakbVsGEmfsEEtB?=
 =?us-ascii?Q?aMudungbtoezzDhmiA1oMe8HvuqBkdMmMdKQzWcW01H+rHiE7zP4Wrh9bgvR?=
 =?us-ascii?Q?w6KoRGZL1y9vnTvdQRJXy2iUlhKoFUMiqqI1XLOG3STi9+LvULR1VhfVZF4u?=
 =?us-ascii?Q?zA9mMRjIicgIhwL5X5T2AHjStJ51cruAEkUOZN0VDmnuSaJCnrCj4mBzS992?=
 =?us-ascii?Q?i57RpKbGFsFr6f9plCju7Shq86CVZptR0Hj3CsU5zCXjSjKhfHd30sdyN6nf?=
 =?us-ascii?Q?0Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ffceacf6-e7c0-427b-de49-08de17242133
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 19:48:27.7871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rxob4HvcNq49oGw+cBzU+Qie8Af7Fwmh5VFi+kIb4euZGwv6TDep5LklOqi3hWRSI0fDbXy92M+2at3ngq9zzA5F4AFEvdHXUbFHTVZBPVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5087
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

On Wed, Oct 22, 2025 at 10:09:01PM +0000, Wang, X wrote:
> From the gt0/pat file on BMG platform, we can easily find the pat[13]
> is a valid entry and PAT[16 - 19] are reserved entries.
> 
> /sys/kernel/debug/dri/0/gt0# cat pat 
> PAT table:
> PAT[ 0] = [ 0, 0, 0, 0, 3, 0 ]  (     0xc)
> PAT[ 1] = [ 0, 0, 0, 0, 3, 2 ]  (     0xe)
> PAT[ 2] = [ 0, 0, 0, 0, 3, 3 ]  (     0xf)
> PAT[ 3] = [ 0, 0, 0, 3, 3, 0 ]  (    0x3c)
> PAT[ 4] = [ 0, 0, 0, 3, 0, 2 ]  (    0x32)
> PAT[ 5] = [ 0, 0, 0, 3, 3, 2 ]  (    0x3e)
> PAT[ 6] = [ 1, 0, 0, 1, 3, 0 ]  (   0x41c)
> PAT[ 7] = [ 0, 0, 0, 3, 0, 3 ]  (    0x33)
> PAT[ 8] = [ 0, 0, 0, 3, 0, 0 ]  (    0x30)
> PAT[ 9] = [ 0, 1, 0, 0, 3, 0 ]  (   0x20c)
> PAT[10] = [ 0, 1, 0, 3, 0, 0 ]  (   0x230)
> PAT[11] = [ 1, 1, 0, 1, 3, 0 ]  (   0x61c)
> PAT[12] = [ 0, 1, 0, 3, 3, 0 ]  (   0x23c)
> PAT[13] = [ 0, 0, 0, 0, 0, 0 ]  (     0x0)
> PAT[14] = [ 0, 1, 0, 0, 0, 0 ]  (   0x200)
> PAT[15] = [ 1, 1, 0, 1, 1, 0 ]  (   0x614)
> PAT[16] = [ 0, 0, 0, 0, 0, 0 ]  (     0x0) *
> PAT[17] = [ 0, 0, 0, 0, 0, 0 ]  (     0x0) *
> PAT[18] = [ 0, 0, 0, 0, 0, 0 ]  (     0x0) *
> PAT[19] = [ 0, 0, 0, 0, 0, 0 ]  (     0x0) *

The general idea here looks good to me, but my only worry is that down
the road people who weren't involved in this discussion will wonder what
the "*" means if they don't dig through the code.  Maybe printing
something like "[rsvd]" instead of "*" would make it more obvious what
it means to a human viewer, without negatively impacting the automated
use you have planned for IGT testing? 


Matt

> PAT[20] = [ 0, 0, 1, 0, 3, 0 ]  (    0x4c)
> PAT[21] = [ 0, 1, 1, 0, 3, 0 ]  (   0x24c)
> PAT[22] = [ 0, 0, 1, 0, 3, 2 ]  (    0x4e)
> PAT[23] = [ 0, 0, 1, 0, 3, 3 ]  (    0x4f)
> PAT[24] = [ 0, 0, 2, 0, 3, 0 ]  (    0x8c)
> PAT[25] = [ 0, 1, 2, 0, 3, 0 ]  (   0x28c)
> PAT[26] = [ 0, 0, 2, 0, 3, 2 ]  (    0x8e)
> PAT[27] = [ 0, 0, 2, 0, 3, 3 ]  (    0x8f)
> PAT[28] = [ 0, 0, 3, 0, 3, 0 ]  (    0xcc)
> PAT[29] = [ 0, 1, 3, 0, 3, 0 ]  (   0x2cc)
> PAT[30] = [ 0, 0, 3, 0, 3, 2 ]  (    0xce)
> PAT[31] = [ 0, 0, 3, 0, 3, 3 ]  (    0xcf)
> Page Table Access:
> PTA_MODE= [ 0, 0, 0, 0, 3, 0 ]  (     0xc)
> 
> 
> > -----Original Message-----
> > From: Wang, X <x.wang@intel.com>
> > Sent: Wednesday, October 22, 2025 14:55
> > To: intel-xe@lists.freedesktop.org
> > Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Lin, Shuicheng
> > <shuicheng.lin@intel.com>; Wang, X <x.wang@intel.com>
> > Subject: [PATCH] drm/xe: Dump PAT entries with reserved mark
> > 
> > Add a marker * in the PAT dump output to indicate reserved entries more
> > clearly. This improves debugging and makes register inspection easier to
> > understand.
> > 
> > Signed-off-by: Xin Wang <x.wang@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pat.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c index
> > 7649b554942a..82c221aacebf 100644
> > --- a/drivers/gpu/drm/xe/xe_pat.c
> > +++ b/drivers/gpu/drm/xe/xe_pat.c
> > @@ -376,14 +376,14 @@ static int xe2_dump(struct xe_gt *gt, struct
> > drm_printer *p)
> >  		else
> >  			pat = xe_gt_mcr_unicast_read_any(gt,
> > XE_REG_MCR(_PAT_INDEX(i)));
> > 
> > -		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u, %u ]
> > (%#8x)\n", i,
> > +		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u, %u ]
> > (%#8x)%s\n", i,
> >  			   !!(pat & XE2_NO_PROMOTE),
> >  			   !!(pat & XE2_COMP_EN),
> >  			   REG_FIELD_GET(XE2_L3_CLOS, pat),
> >  			   REG_FIELD_GET(XE2_L3_POLICY, pat),
> >  			   REG_FIELD_GET(XE2_L4_POLICY, pat),
> >  			   REG_FIELD_GET(XE2_COH_MODE, pat),
> > -			   pat);
> > +			   pat, xe->pat.table[i].coh_mode ? "" : " *");
> >  	}
> > 
> >  	/*
> > @@ -431,13 +431,13 @@ static int xe3p_xpc_dump(struct xe_gt *gt, struct
> > drm_printer *p)
> >  	for (i = 0; i < xe->pat.n_entries; i++) {
> >  		pat = xe_gt_mcr_unicast_read_any(gt,
> > XE_REG_MCR(_PAT_INDEX(i)));
> > 
> > -		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u ]  (%#8x)\n",
> > i,
> > +		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u ]
> > (%#8x)%s\n", i,
> >  			   !!(pat & XE2_NO_PROMOTE),
> >  			   REG_FIELD_GET(XE2_L3_CLOS, pat),
> >  			   REG_FIELD_GET(XE2_L3_POLICY, pat),
> >  			   REG_FIELD_GET(XE2_L4_POLICY, pat),
> >  			   REG_FIELD_GET(XE2_COH_MODE, pat),
> > -			   pat);
> > +			   pat, xe->pat.table[i].coh_mode ? "" : " *");
> >  	}
> > 
> >  	/*
> > --
> > 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
