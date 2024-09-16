Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14E7C3ABB2
	for <intel-xe@archiver.kernel.org>; Mon, 16 Sep 2024 13:57:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A40010E385;
	Mon, 16 Sep 2024 13:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SUGnmg4A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE9710E37C
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Sep 2024 13:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726495071; x=1758031071;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lEHdKDqqv1RUR07uAc7qPSgp0ah6GR7OWHUAW2fjEgo=;
 b=SUGnmg4Au/gvxrefQFdaQjCOPM9ZDcF0XlHhIvx1P33i7gr4e5O5WF3A
 OwZSGviXUu12VS0mPv/Fx/NOh57nZrFv1wE/dOqx4MTu6x7lk6tLOYjx3
 8IP/Mm8tqIxg6zpJBdfd9rIETHf7SMNws1sDFWJS/kT0F3Erk6IzTjksq
 xm90OVWG2Nv9PHAx5sju9it2/E1T9O6VHMnV+SEmiel01TLBWAe/u3BBI
 NZL6bEnIycy+aaQJSDoO+PPundiYkc6ByHOvrYVF+ZOH/GpC6FPuFRvoR
 XPZGBzZnjPMBvmuzucYz9x/1GV02anFh8gx/k30FQHAkqJVkPcP0263qc g==;
X-CSE-ConnectionGUID: AyZtO7CnQ5avHJqfOo0p3A==
X-CSE-MsgGUID: Fslid7HbT9Kbao1fVRCJog==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="36454771"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="36454771"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 06:57:51 -0700
X-CSE-ConnectionGUID: 9axVs3E9S52EzPw4Q3BPxw==
X-CSE-MsgGUID: eOU72Cf8Q3Cm3+g5Fciq6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="69358134"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Sep 2024 06:57:51 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 06:57:50 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 06:57:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 16 Sep 2024 06:57:49 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 16 Sep 2024 06:57:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LbQsNTFR8LEhy9aNwVG/O3yUXFczQcS0TJiOCqN5K4TwF53SWVkkfNcgELRPOVaY9rBc80oa2fMni6aYDH2MNPLnn+eCuXHq3ac7RKh/pGVHdkRNAmVp2hiwAjY0WUcbn5zJOFlZpeKAj8S7iOEHaj33iklYjpOMjhTY7sgHmYiDaEZcjyetYJvSL4SAOUVWM5ENNjBLs+HU0BZiqU6bNXwcMTFs/fzIArAE0w4E0mfytGoK6UFdb76sbVBsk1w6DAZn0YB6E6yUNuOjxoF4pDCK/VO3LbMmyl2K6OcCrZDlFsr+DhSi4LhGXvuQjBnTxGLcf+Np3qO/1e2RLBLoww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/m2JY4M/mV9/pMtr5hDWd/C940+fJG1eKuxqOGUKa/k=;
 b=MLeD5NwZFpmJNcPU1R3M7cWz8/XPSTTFstE7KhV/I8zf/Hgt0K/BpdnEQzapDzhFo7mABo0320Oz+mSjNL2ekjwy/68K8V04nqFluuNrj96YOe6hTaFBg43B1ZCdL4x6JgHOcuJN+BcITwQNmEZ7gi2VgNpSQ+Ll/0ihpixeWj6fi2ejkCscqRI3evZNuPx+dKafWlkU7GC2hA9V/Q6oEbXjrYNKZJjE77D/g8FrkKQKLqxRjYpZoeVKR0QmeWblpdmDJoeVxlpBCU+K9jTcx+4+v4vFnwSs9iS4N5gPCzFBsOUqbxDqAZObRpCSfJGyqt8USuQK0MKUj6g5nZF6MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6233.namprd11.prod.outlook.com (2603:10b6:930:26::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Mon, 16 Sep
 2024 13:56:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7962.022; Mon, 16 Sep 2024
 13:56:57 +0000
Date: Mon, 16 Sep 2024 13:55:29 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC PATCH 0/8] ULLS for kernel submission of migration jobs
Message-ID: <Zug40aMNkJ9ZibYC@DUT025-TGLU.fm.intel.com>
References: <20240812024717.3584636-1-matthew.brost@intel.com>
 <6f07724535d0860e696d25ff6c8132170c6d53ba.camel@linux.intel.com>
 <ZrpFwv+GlJzqzibT@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZrpFwv+GlJzqzibT@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SA1P222CA0023.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6233:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ea50aa3-f67f-44b9-33e6-08dcd6576e1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?1KUDfUgLNGBj1EUDm9bs2sp63xhS+uZTJLour5dbw4gHKmEShWnWcteVUi?=
 =?iso-8859-1?Q?WyY9bV18frrLkPhHoPZAJ00Hf5qRnjduUQLz4ILMNpQOD6VXg9kETZDgb/?=
 =?iso-8859-1?Q?/M+lf3K36VX++DoMNCOPYtXVDxDkCYtMWgZOj4IAVxAccUMJ5To3UMKG33?=
 =?iso-8859-1?Q?GDh+YRXON1vF7vC+5+Fj+Vgc4ISXGRwk8EN8Sh1hVH7pnqozaiu+0hCYbp?=
 =?iso-8859-1?Q?wt30sPF/6oVEPUhFQjZuP6RtlpWD8YH+SIMHbY29tSz5wd41U4KN0OH4yG?=
 =?iso-8859-1?Q?2UeUPi8RcpyS+jglXW9Qlc/Mt7k6ZVeWjaElQTob4qjThTrX4PDVMURD6T?=
 =?iso-8859-1?Q?3o2A9Tj2GuA5A6lpwZS6ECaHX50Xx1KkdIQC8R5A8vnDL4rg+TlL+cR54X?=
 =?iso-8859-1?Q?nxGixEMxJvErbvOhsuF0BxLZhZFuH3pCFgzF7DpE63pSICVWuJTVK7BdoR?=
 =?iso-8859-1?Q?GYumA1+7RrlX1IheQRTdnqE3O2a37u69Ch209hNwAEJiWkrD8TKmFvr9DW?=
 =?iso-8859-1?Q?4XLgzua79WGOnD1wtTgLZw4ZjWL9LiH/3TEuD1hrzpkr8PQc2lqwswO3Lq?=
 =?iso-8859-1?Q?uBBDr0qsviNBOF9lxaPjGdeE/Zdkdyj9uVJ/j3FNKgfpN2K6YcdoLWd2kg?=
 =?iso-8859-1?Q?b9DuSNaCaRNB7rVXR9YunzeFr5s/CdOStqmWV2tMWKVQEaqS0Q2ktodCSO?=
 =?iso-8859-1?Q?fR1hIvyiriuNHsICR16RliPM/SjCjV7xQ+4ubgtjeoo+8QZm9fdbB+v4CT?=
 =?iso-8859-1?Q?zMJKVaqMHTqOwqyB7+jvg+PyLJ7P+RtdFSRlXJfYOfmIivjndZzU7dRj1h?=
 =?iso-8859-1?Q?zllECYKYggJOzZHnWANHAuO+9nDaKstiiBIT2n9LaqRj51avZsZwM6luv6?=
 =?iso-8859-1?Q?Iz0wiii8FfEhp5lN1cyFENLJUu5LvjXywoJKXDC9Vcf71o1M5brbICvT1/?=
 =?iso-8859-1?Q?/+1L6E+uiTIzX7gx2UCLtxI7u2KEHGoebkOXmhXlcpm52dhnsfL009pNE1?=
 =?iso-8859-1?Q?x4R7Tcotq7k/2UFXEi+OlfDTys4ZGvdNqVMwhJmhPG0lpJbhmpWNyWwVvg?=
 =?iso-8859-1?Q?Hm8oNl5rYFb4uWDmqKV5g7Xo1pT24oJrGno0taJBojtxcgPjREzBFtOGon?=
 =?iso-8859-1?Q?DKasPAp57m6+8sVWjyAfACbDXl49MOXEhZqG+lN4UWtZ+KGmRj3RbrVEUd?=
 =?iso-8859-1?Q?VXf6J0/QVwHA9TAfshLYx3zFrWIsswwMLWRhs8SeSTDew90MNdMauOY9nU?=
 =?iso-8859-1?Q?fCq+AqWvh3ZLGRhwot1vXSKvrD4uRdw9cktD5zROqCvvFlslr3vj4Ry897?=
 =?iso-8859-1?Q?ibfCWrDZKhff01Qkb/1+6IDC10d/WJHJoFlNdz8ZBsvPsqU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?gMT/nZKSUUkqfmWAoI77m87U5Qfm5pNDU9W8QF3DPLzTljaoS1xiV9rXL2?=
 =?iso-8859-1?Q?hWzvRVzm9hxEKVbt+JVe8b6njeOdp8aq2fb9fRd6zABshRfXb70e5jlN7c?=
 =?iso-8859-1?Q?qdMZmwL42dIOQmp6vluKR/5Dvl7O5u38uPnbBa5/xdRfjiOMvHxbZh+7Kq?=
 =?iso-8859-1?Q?FuT1VvozsrhoPb+xZvKkdWhLpkyh7hKN54hTbogl1/HkUhstqzG+tg4GEc?=
 =?iso-8859-1?Q?6rec6r9p+CKJcrHMB4TKWd14yKeVTjothO/Ryx5GAFSUwxCXJEuMUjDWzf?=
 =?iso-8859-1?Q?GZutagVa4qMQOdF/kKxGwxMpkWpRczImRTajd5ycCCf1o582JSWvzDUPou?=
 =?iso-8859-1?Q?oWeVW89QOQdINIHNvMj1X7dY2LG7b+Mu9gsjjLuSQDBIaRohi2RG6mqF5D?=
 =?iso-8859-1?Q?S6xgxs/AT0tvZWpG0FrijDDcUyIsWEdXnhhUz3WptBdg79mV2Ja7Hku/1c?=
 =?iso-8859-1?Q?h9bbpZW99WrwjXyeW7tTIaVLjF/196Vvk6P1R9VmRIQfDeR5o+f5/Yx03e?=
 =?iso-8859-1?Q?7p2+LgoN996t5LuGzOTTXw88g5xWpXpMIlI7Yun5TVNQ11hj5PeX8Gp0w9?=
 =?iso-8859-1?Q?PdQ0MPQRZPBFIXse+CGocjIfmeVJN05vVy40IQuhvOZBU41+FUGESvslQ1?=
 =?iso-8859-1?Q?0K1BhyoEX7+I/ldImzAxdGapzZbl9LDt8WBJTeTH5LezRLEvEI2ml0mEp9?=
 =?iso-8859-1?Q?rQNVC6tfdqzv6DCDOaEHvyHWCx9WGtnlmPwRjIqw0HK/NM7ZMYl9BstPjE?=
 =?iso-8859-1?Q?lvr2OLinavQWi6d6B/pFXTWCZdZNXfbql3EquNN1J+6OkbN8fmF+suri94?=
 =?iso-8859-1?Q?C1Xz0AYeApxpAdsZ2pivgoX72gEWVHxU86/W1UTa7vhTAyunO6t2gyLNk+?=
 =?iso-8859-1?Q?4B3XUSsASj/pKzqrXsrxxWSRhk3qIKGcqx44dHx7IVrgT928odzIpA0uMX?=
 =?iso-8859-1?Q?G01ICdmtvszVwIbB4xT3RWWyxnOngw7Y9hSChunrbnkx1gdtlT/uH/x4wr?=
 =?iso-8859-1?Q?P4nOe6fXN3Dxeq/KAk4i1S+fkGuis2M9AYJExMLsnkqfxmIJs3E35NZCxh?=
 =?iso-8859-1?Q?xVtFp/iQSQUPH3l/v07DS3a9PlJFgRJEtiE/29YYfZPjd299bhMWkBG0+q?=
 =?iso-8859-1?Q?nX/C4cpdAfpMmFdqTquPrvENXrevbETsCUEcZCSZEz/tmxJEDkizIMRLTa?=
 =?iso-8859-1?Q?tuDMkWXcKoApLien/UPm55Sl6KAkjKXjg7mx/L7TdUbMQUWMliYZQUIR3o?=
 =?iso-8859-1?Q?ccME/TK/3ngFc1ND0mDCFv0G0zcnyyxkEEW4brpIDGroatePwNBOqJ6wqT?=
 =?iso-8859-1?Q?F5nDsI4pDHoGXq2Au7WeHBSwqwVIauqckbfMGkKNILOGnwmQwiCwjWMVFH?=
 =?iso-8859-1?Q?mr886T90WEJ6QoEI2sQw912llQiu0w0mTZEn75XUVNQcQNReKZNELk+oS+?=
 =?iso-8859-1?Q?E29Geeabf9CsNEsctQfNlq9fG4a6AsgpV3H6fMm+c82h7FK0PpGjo+h0EE?=
 =?iso-8859-1?Q?ZSmYgTN57l8vpgGhZ++rSTPahosC84a/Wndld9iAsO0WJxQPWcdTIW1bqw?=
 =?iso-8859-1?Q?fyyaNKXm+UN/8gzC+dAOt5JFMoe8mR0+qzZiHyj1efUdxpSADPadCAvXlx?=
 =?iso-8859-1?Q?Ouk9fD9ZHb5mVMSNYpT8gjzXmUjX5G0MrdskNYtcSMxdKVwcOFPKNAsA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea50aa3-f67f-44b9-33e6-08dcd6576e1b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 13:56:57.9159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZDRcENPrNlYTABMIQE2eiFWV20Wl8Apubod+z10uuha2TsPydNumHEeBuhrl5cDAX0b3aGHrxCTOMoycnQYquQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6233
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

On Mon, Aug 12, 2024 at 05:26:26PM +0000, Matthew Brost wrote:
> On Mon, Aug 12, 2024 at 10:53:01AM +0200, Thomas Hellström wrote:
> > Hi, Matt,
> > 
> > On Sun, 2024-08-11 at 19:47 -0700, Matthew Brost wrote:
> > > Ultra low latency for kernel submission of migration jobs.
> > > 
> > > The basic idea is that faults (CPU or GPU) typically depend on
> > > migration
> > > jobs. Faults should be addressed as quickly as possible, but context
> > > switches via GuC on hardware are slow. To avoid context switches,
> > > perform ULLS in the kernel for migration jobs on discrete faulting
> > > devices with an LR VM open.
> > > 
> > > This is implemented by switching the migration layer to ULLS mode
> > > upon
> > > opening an LR VM. In ULLS mode, migration jobs have a preamble and
> > > postamble: the preamble clears the current semaphore value, and the
> > > postamble waits for the next semaphore value. Each job submission
> > > sets
> > > the current semaphore in memory, bypassing the GuC. The net effect is
> > > that the migration execution queue never gets switched off the
> > > hardware
> > > while an LR VM is open.
> > > 
> > > There may be concerns regarding power management, as the ring program
> > > continuously runs on a copy engine, and a force wake reference to a
> > > copy
> > > engine is held with an LR VM open.
> > > 
> > > The implementation has been lightly tested but seems to be working.
> > > 
> > > This approach will likely be put on hold until SVM is operational
> > > with
> > > benchmarks, but it is being posted early for feedback and as a public
> > > checkpoint.
> > > 
> > > Matt
> > 
> > The main concern I have with this is that, at least according to
> > upstream discussions, pagefaults are so slow anyway, a performant stack
> > needs to try extremely hard to avoid them using manual prefaults, and
> > if we hit a gpu pagefault, we've lost anyway and any migration latency
> > optimization won't matter much.
> > 
> 
> I agree that if pagefaults are getting hit all the time we are in
> trouble wrt to performance but that doesn't mean when they do occur we
> shouldn't try to make servicing them as fast as possible.
> 

Okay, there is definitely something to this. I have an SVM test that
serially bounces (i.e., each bounce results in a GuC context switch) a
2M allocation via fault about 1,000 times between the CPU and GPU. I
applied this series and added a modparam to enable/disable ULLS to the
tip of my latest working branch [3].

Without ULLS enabled, the test on average took about 3 seconds on BMG.
With ULLS enabled, the test on average took 2 seconds. I was expecting a
small gain, but this is significant. Other similar sections I have seen
a speed nearing twice as fast. It seems to indicate that this series is
definitely worth pursuing.

Also note that any operation using the migrate engine will see gains
(e.g., clearing BOs, prefetches, eviction) in terms of latency.

Matt

> > Also, for power management, LR VM open is a very simple strategy, which
> > is good, but shouldn't it be possible to hook that up to LR job
> > running, similar to vm->preempt.rebind_deactivated?
> >
> 
> That seems possible. Then in is scenario we'd hook the
> xe_migrate_lr_vm_get / put calls [1] [2] and runtime PM calls into the
> LR VM activate / deactivate calls rather LR VM open / close calls.
> 
> Matt
> 
> [1] https://patchwork.freedesktop.org/patch/607842/?series=137128&rev=1
> [2] https://patchwork.freedesktop.org/patch/607841/?series=137128&rev=1
> 
> > /Thomas
> > 
> > 
> > > 
> > > Matthew Brost (8):
> > >   drm/xe: Add xe_hw_engine_write_ring_tail
> > >   drm/xe: Add ULLS support to LRC
> > >   drm/xe: Add ULLS flags for jobs
> > >   drm/xe: Add ULLS migration job support to migration layer
> > >   drm/xe: Add MI_SEMAPHORE_WAIT instruction defs
> > >   drm/xe: Add ULLS migration job support to ring ops
> > >   drm/xe: Add ULLS migration job support to GuC submission
> > >   drm/xe: Enable ULLS migration jobs when opening LR VM
> > > 
> > >  .../gpu/drm/xe/instructions/xe_mi_commands.h  |   6 +
> > >  drivers/gpu/drm/xe/xe_guc_submit.c            |  26 +++-
> > >  drivers/gpu/drm/xe/xe_hw_engine.c             |  10 ++
> > >  drivers/gpu/drm/xe/xe_hw_engine.h             |   1 +
> > >  drivers/gpu/drm/xe/xe_lrc.c                   |  49 +++++++
> > >  drivers/gpu/drm/xe/xe_lrc.h                   |   3 +
> > >  drivers/gpu/drm/xe/xe_lrc_types.h             |   2 +
> > >  drivers/gpu/drm/xe/xe_migrate.c               | 130
> > > +++++++++++++++++-
> > >  drivers/gpu/drm/xe/xe_migrate.h               |   4 +
> > >  drivers/gpu/drm/xe/xe_ring_ops.c              |  32 +++++
> > >  drivers/gpu/drm/xe/xe_sched_job_types.h       |   3 +
> > >  drivers/gpu/drm/xe/xe_vm.c                    |  10 ++
> > >  12 files changed, 268 insertions(+), 8 deletions(-)
> > > 
> > 
