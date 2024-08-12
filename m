Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6013AC52D7C
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 17:27:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D24510E182;
	Mon, 12 Aug 2024 17:27:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="huZLIiwk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D0810E182
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 17:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723483649; x=1755019649;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5NbKgUpi33T2hJ52P34irClhnHBpBDdO+wEgt2X09ks=;
 b=huZLIiwkltbAy5VH8mYCKCAMkL5b2Z4dJ/k9ymOnsVR0mYEQX6ptOjAW
 2MeGZhEgHn6+4xodZg2Lkl5ckedN+yhOuHdB75B+RIdx9aiNZi3H32EmN
 ahR7gC+LZravTgxqBGX8/2MPabsUA9AeoHJeXPI9DOfFp3WwCIyapWB53
 K0p40RIYh/RWkESzUeujJtwmcL+6qv4kTC4weLWLAiSqIgm9s1G22I9mR
 TPpkHO/DPIWPIGuKf2sn6FZKmEk259Kf4zXTrdgqgDkRwLgwiiLqtARI6
 EHNkpG1h2qhS5nEjpLvmWDZExHsKf70Gcl8Ewtu2ycWMmxEDXavkQ8llP A==;
X-CSE-ConnectionGUID: q2YyLrNTSf6F8+FlDZoUsw==
X-CSE-MsgGUID: 8R2sl0nQTpq+XjeXXHyS3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21741607"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="21741607"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 10:27:29 -0700
X-CSE-ConnectionGUID: F4lS4SudR5W9frFRvWi3BQ==
X-CSE-MsgGUID: w3qMbs0mRcKJsYFqUxV6hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="63192621"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Aug 2024 10:27:29 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 10:27:28 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 10:27:28 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 12 Aug 2024 10:27:28 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 12 Aug 2024 10:27:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GiFIA6h9mtWMvNhhvzc9yflZZpVwrKyB40c2TgmGUo1oiNH0cHVF26D1C1WhyaCHPovxbxngfM1pNp/tenOmRN+VPebo5qW8+2aZHXLF3es1BonHy9GgeotVHD4zrtG6asPK60yLHXIEl+xsATDHB4izuzLtyYkQarPx84dFjUL3AsVYOHroKCHsizoIprldggUmZL2F98V7mkm+6MzZEt8b7AntkdK/mRmc/II2QyxsttUVzB+tCN+u4fvvH+mAzi9c6EnLRYQsEGZCwnmihk6i8oxm3jHDuYumYfB6kwOl9OURM4UCNRjv4pnA7DD+2pOpsafDH5rLmdB1YXY2NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DmVWqfftJC2PRXBU9M/87zYofCZoi1CHIHihe0Twfps=;
 b=bFnVqNtBVo0eB8/TQQAJQvxfhSovDVspQKb6SMPtqR6GCsOJPMrCIGCN+QClC5DdnBwg5Zr/yXf3uH1IaCNNRVZj//7OO22mGIpFcXvcGRmJl1YwLeWKsiki4cZ+MgdpZbkwxCQS66ArnH/zY8JyV0l8GjiqG74yJfokYYaS66Q1huQP8vRSB1U6AUwTI6QYaGvx9pZ+zQKhIQHpIg/spl/oghuy/Jh7pGbzhjL8R4dlt1+UU9AAwhqdcz2wa6ryWT6W8TWJ/v6SDc0SEUOda9fV4SOPOhokYXPJ5TzhsMyuWksOxwAZQvnx+y8ZZyWOhKFU+ICvs447FUPTYqK7tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8140.namprd11.prod.outlook.com (2603:10b6:610:15b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.29; Mon, 12 Aug
 2024 17:27:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.031; Mon, 12 Aug 2024
 17:27:25 +0000
Date: Mon, 12 Aug 2024 17:26:26 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC PATCH 0/8] ULLS for kernel submission of migration jobs
Message-ID: <ZrpFwv+GlJzqzibT@DUT025-TGLU.fm.intel.com>
References: <20240812024717.3584636-1-matthew.brost@intel.com>
 <6f07724535d0860e696d25ff6c8132170c6d53ba.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6f07724535d0860e696d25ff6c8132170c6d53ba.camel@linux.intel.com>
X-ClientProxiedBy: BYAPR08CA0025.namprd08.prod.outlook.com
 (2603:10b6:a03:100::38) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: 48900e91-66e0-4c3d-aba6-08dcbaf40868
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?tBhSfum9ujOAsFgGsaw3sTSpOaSg998h78d0SObs4zNnx/vnPe312pHPe2?=
 =?iso-8859-1?Q?LnZWV0SmZhyhdY9Lydc29WF42LP6Jy/EqLbNAsWOsAUZjTKc5R/D9V1270?=
 =?iso-8859-1?Q?P482GkpWMkYextCTeF8xkS01T2xlsKmDh0UYwzTr3HH0xKi+XX4oK36Jve?=
 =?iso-8859-1?Q?8hj8H1L6N5ReEPqkTIhP4zCyQVdiyY4TXgsucNiK6v1hb1Zp7xTX52XbbG?=
 =?iso-8859-1?Q?E6dtm5c8Duov+uZyGuJUsm+y8E2clWwaT3saVtdShn24ZAxqBN1k43rwqW?=
 =?iso-8859-1?Q?KtqxLBcub0YhGZbvtN/bSX7L0OA0efJBltmMlaTSY63kW+JIHHOUlWdm5a?=
 =?iso-8859-1?Q?l3EU76YXmkvEp1+W2ssyiCz+hFnE23xxrRlrA4+2+qRhTa2PUppSWr/7C0?=
 =?iso-8859-1?Q?tV1k4hw6oxXFMtc7BouCcDzGiyjbmpokS5/wgG0kBpzC7454n5Eu6mwbH4?=
 =?iso-8859-1?Q?vJCyYXvLxMSGe3f8cJ2mKTYTt8XUp355lYmgFr1ZE2u7wqLNroaCLVv6Zb?=
 =?iso-8859-1?Q?H84UCjcJUoofWxhyC5kpBlRwC41ANOwhqk7aoIWZ/fgbFWoB7zbsDf0h3Z?=
 =?iso-8859-1?Q?jY8sS3DPTh9myMo4JVjI8/3GyekEM1xM6nOR8AgPkrF4vy8BgFcOzwGes3?=
 =?iso-8859-1?Q?HCUJ18EZC8BXTswHip53Ztf+ydFyLgZGNGIattyXBkrm0micI/jDtBMWkX?=
 =?iso-8859-1?Q?1taD3j1zvaetoCCpOU8thSNyamKmAT6h4bWtnFwDfTGRtnek36oLYff1iV?=
 =?iso-8859-1?Q?jJF9eSMjpFNv43EucsuVjMekg2zYZa82nXZTZJ/Twpq1bGw4shA1zlDhlR?=
 =?iso-8859-1?Q?DJKDvT1vkfw+VLppKkmyu+X7QLTxMECEICpgRVFhrObg6u0VuUMrOCxSAF?=
 =?iso-8859-1?Q?HPO4OnpGfy8v05DHPIlGBfNGiqxgjrv7ITkoJ57u0HqWwciS59tncIvWMg?=
 =?iso-8859-1?Q?oJNsiilrW7J5mgnIZcXhQHaVDGw6/8RfBc2qm1Sy2lNHRguYoJloXzw4ju?=
 =?iso-8859-1?Q?UQMDzK66l8HIoJ+bGeUV1k5H33wOjYimLD+FyuH9/d/VT1RmkUJV/4Y5TL?=
 =?iso-8859-1?Q?2VaTd45CS2bWCOFyEG55IsoW5ljkFRQcEGxr2AAx5Gw9ruEUxtJZ6dMmcJ?=
 =?iso-8859-1?Q?Q3e3qOGBrK1M4XfLaL/pAaRh3afLW10EIFFmMUlkVzfen3UXhZwAOGCXz4?=
 =?iso-8859-1?Q?YwPX6DZoh7mLuzZm7otClMA9YmDLDzl5aygV1MvrgT3ve1aLjQm/q5iZVl?=
 =?iso-8859-1?Q?5ywJrR12rURINL8oPeE7GWhGRSHSr8bPnE9IOpSzEhF96ZeXGerCLcyF+q?=
 =?iso-8859-1?Q?fSg/t2uJAUN0Q+enHZzNjGobhexs8IL2edFpRXp+m8yjbew=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?GMQ8mNS0+WcpJ3cClsbP5iilQ5ZGbqlmnh8aLg/uJhJvYZFRNx0n9stbu0?=
 =?iso-8859-1?Q?dDsoosp7ZtZubiqv5VLu/Q/nkjobExDLAsaZNQHwAcCClnqN/gw6UkEo1V?=
 =?iso-8859-1?Q?fLzj7C+QUC9HnNqiLOxHcN7ymcaQzs8NG9jZ6nMSZ1Qbeu0Aa+ZS95eoVu?=
 =?iso-8859-1?Q?NEUVf4nxilg3QArpqmBYULWU/B34MT2ioeAoat+UrMfHlm8lT8xmXdwhTN?=
 =?iso-8859-1?Q?okdzjCjOuvNp46NYpm8TmD9+i6FYZmYw6BAcHFry9Iu/gJCg1NRh1Zj0of?=
 =?iso-8859-1?Q?aUBey2dNhaoD/XhOErOXWGyM1DCR7ZM+9yO/AUQzRH7A05TWyDBXV7Gg/p?=
 =?iso-8859-1?Q?73dlyTK6M3gcI+VIx8N4XMUtBwVaY6KYAx7hT5NJ+rPztTLdge4g91/U84?=
 =?iso-8859-1?Q?SXUNWQvJjvx6EISu/Mdf8jQRl4Kr4faTtKjtaxzPB4B+GiGiGabc8gWQLm?=
 =?iso-8859-1?Q?k7NkwHTkMk4vPb+9Xv3colntnhqWuu0TN8xpwtL1E9WUgmixhdj2c3wYze?=
 =?iso-8859-1?Q?YdPsFN4N5Yq4A6bDZeNIkmmdD1CuBNf/YdifX68prbeEiOPJR0XpCT6xNt?=
 =?iso-8859-1?Q?2oF2YQe4ZNi+uTtXAlaiAejAQSPL3UI10j/wBognch2dQTN414lZILrTZT?=
 =?iso-8859-1?Q?dh9LETh/4DU7dqa3JB5OTeHP7pPIHF6ZR2NyTJksGaSeElWmbdtnUnNLQN?=
 =?iso-8859-1?Q?ELkVGvLLE2X4ViacQ55gi17Eyht2OkZ+71BBE1vJo1vczZdz+fFlHxPp6G?=
 =?iso-8859-1?Q?lHed1ba+s3ln3kHhhlYJNdpLEA/Hez+Os29unnAqAjRBwe/bkNGWARmDPU?=
 =?iso-8859-1?Q?BLCp8Q1N7AvUrZi/rgFiU8V1Fu0K6xsn1i3f1LcoS/Kl/a2UGDwNtpuztG?=
 =?iso-8859-1?Q?FDGL1udVPaKmtq2+3K6fVVYaQjT+r5pjk2voTsKj9HsglHs0rR7lBnab3d?=
 =?iso-8859-1?Q?29dmumkildDSXDU6Esh19V75d3jeN6cBG3GmSCt1s18b1E60vvlYB8ijit?=
 =?iso-8859-1?Q?51XdGEfrrV+hNu1LnOqgeQQIiaZldAyJNHrmUoUu0hEGDPGn7tEVL/kBmL?=
 =?iso-8859-1?Q?tg5F/jPF4bb6YYEV4dlF4IGGl7gXdU68xoqt1DO0xVFmMUqJtFplnQWnM3?=
 =?iso-8859-1?Q?CADApEoWrQEGbvtc72sgsIlNgmdXQWL/wtDyWxJxoc3uMqTtuUHZ0KI8nZ?=
 =?iso-8859-1?Q?CKTJKbxRPPZDRQJKP8p7AVY0u/xo6g5hOAGi+yGcmkwI5cLQgfQQt5M+oI?=
 =?iso-8859-1?Q?4+LkIw081yf+5CpxXkpCneyh2nDHLfZ5lP2VPVlL/vgx74zValu7iWx4nw?=
 =?iso-8859-1?Q?btVRgIS9Kl69Qj4VKcT7SeLxOh/+CcC7AljP03p3gHFKslkHzg3f8VuC+e?=
 =?iso-8859-1?Q?Cn1ul1bI+MnjsMH9CU8hugQJLYYd7n4Z1o9mgdFPptsrmI3Ef8hpXe9guz?=
 =?iso-8859-1?Q?kAuQ/J/4RnNNJrkLfyrFIsFCYFfCG2/ptgZukPrzBGsMQDUPFvct0cMzFs?=
 =?iso-8859-1?Q?kBQPdjI4x6EcmcxYamIrdODEU4kUWY3wlE5qPNcik0ob2PoFHf5I+vhcxh?=
 =?iso-8859-1?Q?2SojbGy5H1384UdEjY7r9Tx4YPFx4c+EF5aJvthWTkPyGXCn5HGqSZPbHI?=
 =?iso-8859-1?Q?yrEUW5T5AC7U1mHYY8xWqoST7V4J68bq1oTEd8f1e+jB7FG2bfEOeFrw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48900e91-66e0-4c3d-aba6-08dcbaf40868
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 17:27:25.6919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tb6lrez0HxIqgKDKv4mP1Sl9GAe38674ZtOm6QXqokTBE9YKhrmyAYdPPGSx1AerJiIQCmzN/c98XtEmfmnkzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8140
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

On Mon, Aug 12, 2024 at 10:53:01AM +0200, Thomas Hellström wrote:
> Hi, Matt,
> 
> On Sun, 2024-08-11 at 19:47 -0700, Matthew Brost wrote:
> > Ultra low latency for kernel submission of migration jobs.
> > 
> > The basic idea is that faults (CPU or GPU) typically depend on
> > migration
> > jobs. Faults should be addressed as quickly as possible, but context
> > switches via GuC on hardware are slow. To avoid context switches,
> > perform ULLS in the kernel for migration jobs on discrete faulting
> > devices with an LR VM open.
> > 
> > This is implemented by switching the migration layer to ULLS mode
> > upon
> > opening an LR VM. In ULLS mode, migration jobs have a preamble and
> > postamble: the preamble clears the current semaphore value, and the
> > postamble waits for the next semaphore value. Each job submission
> > sets
> > the current semaphore in memory, bypassing the GuC. The net effect is
> > that the migration execution queue never gets switched off the
> > hardware
> > while an LR VM is open.
> > 
> > There may be concerns regarding power management, as the ring program
> > continuously runs on a copy engine, and a force wake reference to a
> > copy
> > engine is held with an LR VM open.
> > 
> > The implementation has been lightly tested but seems to be working.
> > 
> > This approach will likely be put on hold until SVM is operational
> > with
> > benchmarks, but it is being posted early for feedback and as a public
> > checkpoint.
> > 
> > Matt
> 
> The main concern I have with this is that, at least according to
> upstream discussions, pagefaults are so slow anyway, a performant stack
> needs to try extremely hard to avoid them using manual prefaults, and
> if we hit a gpu pagefault, we've lost anyway and any migration latency
> optimization won't matter much.
> 

I agree that if pagefaults are getting hit all the time we are in
trouble wrt to performance but that doesn't mean when they do occur we
shouldn't try to make servicing them as fast as possible.

> Also, for power management, LR VM open is a very simple strategy, which
> is good, but shouldn't it be possible to hook that up to LR job
> running, similar to vm->preempt.rebind_deactivated?
>

That seems possible. Then in is scenario we'd hook the
xe_migrate_lr_vm_get / put calls [1] [2] and runtime PM calls into the
LR VM activate / deactivate calls rather LR VM open / close calls.

Matt

[1] https://patchwork.freedesktop.org/patch/607842/?series=137128&rev=1
[2] https://patchwork.freedesktop.org/patch/607841/?series=137128&rev=1

> /Thomas
> 
> 
> > 
> > Matthew Brost (8):
> >   drm/xe: Add xe_hw_engine_write_ring_tail
> >   drm/xe: Add ULLS support to LRC
> >   drm/xe: Add ULLS flags for jobs
> >   drm/xe: Add ULLS migration job support to migration layer
> >   drm/xe: Add MI_SEMAPHORE_WAIT instruction defs
> >   drm/xe: Add ULLS migration job support to ring ops
> >   drm/xe: Add ULLS migration job support to GuC submission
> >   drm/xe: Enable ULLS migration jobs when opening LR VM
> > 
> >  .../gpu/drm/xe/instructions/xe_mi_commands.h  |   6 +
> >  drivers/gpu/drm/xe/xe_guc_submit.c            |  26 +++-
> >  drivers/gpu/drm/xe/xe_hw_engine.c             |  10 ++
> >  drivers/gpu/drm/xe/xe_hw_engine.h             |   1 +
> >  drivers/gpu/drm/xe/xe_lrc.c                   |  49 +++++++
> >  drivers/gpu/drm/xe/xe_lrc.h                   |   3 +
> >  drivers/gpu/drm/xe/xe_lrc_types.h             |   2 +
> >  drivers/gpu/drm/xe/xe_migrate.c               | 130
> > +++++++++++++++++-
> >  drivers/gpu/drm/xe/xe_migrate.h               |   4 +
> >  drivers/gpu/drm/xe/xe_ring_ops.c              |  32 +++++
> >  drivers/gpu/drm/xe/xe_sched_job_types.h       |   3 +
> >  drivers/gpu/drm/xe/xe_vm.c                    |  10 ++
> >  12 files changed, 268 insertions(+), 8 deletions(-)
> > 
> 
