Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBFAE77170
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 21:00:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C28510E5CA;
	Thu,  5 Dec 2024 21:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="je/Y504S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE2D10E5CA
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Dec 2024 21:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733432430; x=1764968430;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=G5Ggoxe3N9gmXRU/wHtMUVwvJElQuWiYvXJWKu7lkgg=;
 b=je/Y504Si5X+H+3nZE1rkriLuXVjcJ+RxhP/lVzisYj7fLYkrRCPDqi2
 gzrEILc0IF1jhLh2YrJ/HKSg11/VeRI7zNPYEQC+rjdLf7CleG1/tVmUH
 pZM1IDdwQWHcoRgfduQhECadNR/N0M2RrI+ZgU+LfdglSCRtJkX41yIkN
 Q5L33PpQCSyC20zgENZZQ2J0/avdHOnsSt9MtpRpNc6k2S7X440XjUX2U
 tMBDpK8kAa7DdAcf9v2qleKGpbncXNQtpu8G56PemU6c2F4nHekQ/toxC
 PnqrGPv0k3dNLBmJO7cDqc2AS6+Fa7yUHDrrdWCpkAMszml6GcIGwzIv+ w==;
X-CSE-ConnectionGUID: +EZ+IEPDTCKRnKEf5/aoEg==
X-CSE-MsgGUID: UNi7a6u7TFaS6PNQaoaPKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="37442858"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="37442858"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 13:00:29 -0800
X-CSE-ConnectionGUID: bqlQsKziRlymOqYhpa3AVQ==
X-CSE-MsgGUID: Ospar6HgRN6AnmQkhl/bZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="94413467"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2024 13:00:29 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Dec 2024 13:00:28 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Dec 2024 13:00:28 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Dec 2024 13:00:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rtj7q6iXyupG4s4/NV5vSQm6kwtrxYUxHJ0ABBXuPKtoe6jXS9vXYSnkCyxFH+QrjLBwQ+1XaC+LKrETFRqJdVTNomihst9wQNIHJ3vrqIWkPo6jK3bGKN6clWfWGieTh4MDizBSukNwHYHu29pvEiSNZACCyqcS269buDPRbliw1+fos6peuksiuFuokMWMM3gYsr/YvFs4Q0mVeR0RtfPp9DZFmSSFYPE6E0NYape13v7ZdEFIgtucYzsH3hOyVFiew2sYPjXJjkU6J4bwfzzEOAQIuhNzrcfgkLL0yTQ9p6fOkvH9Z2lP3rXvqmc8ZeqPf2/uh3Ws46xy5pJLMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IqmfVL5mSCHwWAD78tGtUvGKScrJYAmin/dB4CAu7Mc=;
 b=iuqCRoSNkb01QeB5oPmpYhZe5XpS37kSe2ZV/63cdJajCMNynBMpOry82Qqr1LH3DGgBIabjOXAK6JUAAvAOmMJomtecJfOd5fDCZBUf60Gs90vCANYYeWfowMm4l+aDeBGhvXHF2uIuXChxtBQ3r+keOXIvmvh9q4/CA6R0F6eGr+eKiAdAZKsLclgvO38FAdtGR+fhxSOCBC4Jl1Z5WHZd9IAR0WLdaxEsSCfuyVzQBceTGDvbbI+omvCET1kqgIyicxIkIgG2UZ+rZlVEdECYBH+5zcDhTIp0K8iY2OUtizI8jpKHoqc5toEvGSzWZNDgDsbZqVccHva3h+wKTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB7869.namprd11.prod.outlook.com (2603:10b6:208:3f6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Thu, 5 Dec
 2024 21:00:23 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 21:00:22 +0000
Date: Thu, 5 Dec 2024 13:00:20 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>, Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Michal Winiarski <michal.winiarski@intel.com>,
 Narasimha C V <narasimha.c.v@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/vf: Don't check has flat ccs in bios on VF
Message-ID: <20241205210020.GG3224633@mdroper-desk1.amr.corp.intel.com>
References: <20241205181814.1484975-1-jakub1.kolakowski@intel.com>
 <20241205181814.1484975-2-jakub1.kolakowski@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241205181814.1484975-2-jakub1.kolakowski@intel.com>
X-ClientProxiedBy: BYAPR01CA0036.prod.exchangelabs.com (2603:10b6:a02:80::49)
 To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB7869:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dc4f939-07e2-45e3-fe5c-08dd156fd5a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?8wjJvTqGZ1yceuQvxzHwRRYVE7il0/txOTiA0qR3MeIRym5y/ZX5dvYihz?=
 =?iso-8859-1?Q?aw5BB5rpb5ZIDfLZ5h+priILFvWaUiWVmBgX8s3ZbdM5yFVxAGiV5zu52A?=
 =?iso-8859-1?Q?ftaVcHO07CeQTsSU0+HNbBO5Xbv9NmWcAzx2uAcEzlDe0i6nPf8SGr9Bzt?=
 =?iso-8859-1?Q?EKLk4VaTf0Osrfk1wl+/w9rgEE+UcOmNaYtfTcHy8m5WljyG9C8x1oeDSU?=
 =?iso-8859-1?Q?sBEC6NHc+Qz9eLh2lrmNRCzXl5pYVbkEKUeeFHkhCFjPXh2+m4j0bkfJal?=
 =?iso-8859-1?Q?xUjHH2z38zPuXp4Odhmq11WSSf/AwCp9lz3kQNQgDuFPd1CoiO0n7ajIS0?=
 =?iso-8859-1?Q?H7WRbT/rLhInROyv0iBGuuQE/x5fYvBCLO9fewAT0sO12yyy56+uZh7foz?=
 =?iso-8859-1?Q?pFIWun6vgn7etz+5Uy2FsNZUdtTw5JtH2XUyHTm7obkJC55FNl7qGLyBaS?=
 =?iso-8859-1?Q?NvBk2AeoAC3Hq6qMf7uz8gsYrU1CYQZ4+mjow3lrQRVDym/dbvhbkDSmFO?=
 =?iso-8859-1?Q?wwYMCNMAvmF2OvBZgvpPjjK5Lewuv3+4IQhSN9ddKDd2Q2TXr2xR8eP0HA?=
 =?iso-8859-1?Q?Jx84b0BHXHz97hIThj6BVxwsOWm5GnxVk0Rd/LuOwFrW855mFr9CGmasyU?=
 =?iso-8859-1?Q?vhtpWjdHUMC2XJGb5VCrw/pzdKumqux6fTEtEtJf8/re9NufC71AVz2N2k?=
 =?iso-8859-1?Q?Ntom6Cfwwwp7dkKDc8MAEunvSwhvHr5HWCb6thT7JofdXRnBaecNNL2GeJ?=
 =?iso-8859-1?Q?xCOPR+XI9byhN8++HeqblEWNmHQt5YGcOwcQFqJnSF8Nq1ml6u3GSbUIuJ?=
 =?iso-8859-1?Q?MgvtKs74nPKxiKL5kXS8R1X8ehpig/DE8ThCdHn+vHNVYZDOVj8KHQvDBj?=
 =?iso-8859-1?Q?aTPywuSU/lfL3J44tFK9etDUFrWgkfQ5LGfPysYzNVf+Pzazy5trZGMiWV?=
 =?iso-8859-1?Q?Vp6FnnUD5ZEl6Uy2+d1eYosqwWHpWzSn1nIuJzCVZOOL75xy08A/PU6eoE?=
 =?iso-8859-1?Q?lxQPjOrKMBU+4yfivtg6542Nmfy8mOckOopKJLuv+ygSGKHeGpnWkG/lbU?=
 =?iso-8859-1?Q?rltLfcLSthQNVl+TyusPWH3bsx+gBLUlwIr4YD3FP03mTKmg5g41LWY+Ic?=
 =?iso-8859-1?Q?sBM8hLGM5sdldcPrAPfZUdKmFiDnlNHb7m5k7PO73pTZMMXYfhymcawm6T?=
 =?iso-8859-1?Q?Dwm81QgPAUkCgP4+cfocXBVfu/OMDrBDOX0pVnv9OVThNDsTEtau2xv66A?=
 =?iso-8859-1?Q?7FdHwTyVgXxxX80tFrbnh5pz0qfRECtJTP7DfQaW6egAPulbJEfqSOXvDx?=
 =?iso-8859-1?Q?pwKZiMX8eV7o0IpBd1RkjL0UR+sbn2/qbQFjknNEo/q3Mr5ziwrbcOp+dt?=
 =?iso-8859-1?Q?fPsk194POcXTPGN0sqVoTnKwcV7MpXEQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+gFVWWtxc7w5hZio2nbcPluj/5K6jW3g+ZPOrzN0pohGk8GEj5qiyo0YE4?=
 =?iso-8859-1?Q?67mN6ME/h6yipFStLW5lH9qhfOXVxak0qOC1TovWPViO8XUVUnuB0ioQQT?=
 =?iso-8859-1?Q?RepYQ56dEwbhvqEqhLyEfFqAUqvkSCgxbKhNWn35s0oX30IkHcmJTFD/v5?=
 =?iso-8859-1?Q?rryWjIFnbRjHPHwkR9c6OIeAUXSccegmQsGvGA4RDgMP0FezD6cHMscX4m?=
 =?iso-8859-1?Q?Ic4So6sDrddzKzYd1bG+om7qgZkhXETBVcr4mPc5osTTAf7ah5UXpIhA2e?=
 =?iso-8859-1?Q?2Y8O0KeYuGmaL7xol3qH0WSkyGEq7x7vom7j+labsyYng7uMVGR/u4b2pX?=
 =?iso-8859-1?Q?TtjTzj1GREuxfob5OGxMhBfdD2zvHUseq++pUMrB7AbtPS4hgM+jQxABnT?=
 =?iso-8859-1?Q?ZG6VuadUMomS5LFoX+bEpg9EHwTWRlPFiSOOXsxbRsyWC5zegSawbGVfky?=
 =?iso-8859-1?Q?aogUObJJCaIGSyQ4qaLIp3ragmz0dbNvq9ZVwg7vZCOSGRJHz4b1nwEn85?=
 =?iso-8859-1?Q?aQKeUnojT+tHx/kO01s+hxTpQ0SoKmjayej4bKEvh0I5HAc+GaHGTXyOMP?=
 =?iso-8859-1?Q?7gEx/Cx8xPsoudqJ8gJXcw1BAJRl+TiHVPbR6dCBDq7GMYlwFlDvuK0xxi?=
 =?iso-8859-1?Q?9qZms3cfSTP1onKFuIOp7nCs5TxqQjkiyLwYmtSruyfqlZlgvcJ0cawCWC?=
 =?iso-8859-1?Q?DHn4VrEFOmBpBFxdUk/Tay5Eu66GOGZN9DJtHpPpksAo7tAfB6wtHUvoAA?=
 =?iso-8859-1?Q?/Hx7HT8SEHE992oKVzWYiuTNFdUfubDyVx2uZ45+zsWL8JI82oylD638e+?=
 =?iso-8859-1?Q?7qNo7teiOt7QCxSTvCE7x6oOuD73IvvNeucUkPUEK8JnIMvqnmUQd8rFa1?=
 =?iso-8859-1?Q?YwhZoI01/K7+qMLXWrirpo+GLjcwXxpMaE/WPfs+QDJA49HpAFXVqN6ka/?=
 =?iso-8859-1?Q?N2zZ2NDAbOl/zlR5aHo0MRI9cjT4Yl6pTBaIy9pIH5tN9M6cLn5XLWh0+d?=
 =?iso-8859-1?Q?bDuSOGm9lrWScVRk9ZuKNVQIlIMoy59URpSNR0c5O0+VzrMhHwQLksK9m6?=
 =?iso-8859-1?Q?6Rqgo5sZJOjhbqIfpAdJqyhnF/O+LhlzTlyodpxJGGtHVzYQYMrKgR8tCz?=
 =?iso-8859-1?Q?ieEKfQrZ7r9GHguRwk4gKX4UeybAYVfiv94IM+UHnJ17vcUHwen5vrbrej?=
 =?iso-8859-1?Q?q9Dsd9EEBtcUZuHETec6O78ZHZ8FLB4iJtlGdBhvaXP6d2XHnPmPLtLcRw?=
 =?iso-8859-1?Q?XFtymoQsUaIllw9Siqealfpr07sFUxfl+VqSR2pMKe2ABYEnYSD4R3Buq/?=
 =?iso-8859-1?Q?T+ngw2Ldt0BfXkE413FGTTG92quoxtTxujLy+Mayuuk6G3QGBtbqfyT3Y6?=
 =?iso-8859-1?Q?RcQ9wzyjfnEqoLGPdinYsyvM7uJliUyxWQOw8dX2x5KgaEQliE9/NmzL6t?=
 =?iso-8859-1?Q?aO8l8otN6MpbYaRrsQdZy7g3zlEqM+/neBEBVjqh0m3ruIkiL+AfqppIAF?=
 =?iso-8859-1?Q?mB70WzmWurqm3nOaEXwuXMOzxMndd5IfqIUVwxkfw7uiLveUJ2t1v4lloe?=
 =?iso-8859-1?Q?uFRwsA64Mm1kqH4DowVczZRELl7zeCxOZo7QPruC/zWSzPCaFtJO6zBcFD?=
 =?iso-8859-1?Q?vb/hxogJKpeK6b+qlmZ5nBYa8x/F93vXZNAqgme/29Q4wmVBCfrYvnpQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dc4f939-07e2-45e3-fe5c-08dd156fd5a6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 21:00:22.8229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P9cmIIaz9OcHRk3u5Jvx4jnOECPvGv9ifFjk4Kvb6lLh5UQ7V2Dp6uHKgEGJlrWT/zGHm/QLfqKCvl/1JGYzsMFZku9K4kLJ+jUJ7C/gcFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7869
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

On Thu, Dec 05, 2024 at 06:18:13PM +0000, Jakub Kolakowski wrote:
> Don't check for flat ccs from VF-level as VF does not have direct
> access to the register.

Can you elaborate on what the implications of not reading this register
are?  If we have a platform that has FlatCCS in general (e.g., BMG) but
the support has been turned off in the BIOS, what happens?
xe->info.has_flat_ccs will remain set in that case (where it wouldn't
have been in a native environment) and that will change the behavior of
various parts of the migration code.  Is it still safe if the migration
code tries to copy CCS data when FlatCCS is disabled?  If it is safe,
then why do we bother reading this register in native settings?


Matt

> 
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Suggested-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michal Winiarski <michal.winiarski@intel.com>
> Cc: Narasimha C V <narasimha.c.v@intel.com>
> Cc: Piotr Piorkowski <piotr.piorkowski@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 930bb2750e2e..5d827b07cf02 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -600,7 +600,7 @@ static int probe_has_flat_ccs(struct xe_device *xe)
>  	u32 reg;
>  
>  	/* Always enabled/disabled, no runtime check to do */
> -	if (GRAPHICS_VER(xe) < 20 || !xe->info.has_flat_ccs)
> +	if (GRAPHICS_VER(xe) < 20 || !xe->info.has_flat_ccs || IS_SRIOV_VF(xe))
>  		return 0;
>  
>  	gt = xe_root_mmio_gt(xe);
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
