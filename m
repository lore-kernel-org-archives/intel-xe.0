Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB56109C038
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 07:41:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E78E10E26B;
	Thu, 26 Mar 2026 07:41:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JUH1tMiI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE9810E26B
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 07:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774510881; x=1806046881;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TTC1Aq3nvqtX3E1m4IeI3E3aUFA3os0ECqr2BRZ7N5o=;
 b=JUH1tMiI/ozcxh0/4TTj8VfwbEQyjfoYpu/btOLAUl4uBhOoLjUzI6BF
 jMsKEfOmiju3lpo8CDJYrzsF05xQ6lgNsRfbPHvJtUNNTKDlKyyTfOZvQ
 eC04i2JN6rLXxhW1sCVDMNF6flLefKQPqZzC5Acqn5kZMpD21Dlza6juT
 apTzeO8IqOhiezWpIquzDZu5582IqvHOsfMcPwVvykEgKuyT5+BByrgUv
 OWHXFIQos/FZyd/GxvGFy83YV+V6Qbrg/FangUhrIgp/8mIw3w14mo6zp
 P5aRgnP2VUpcQoMxrf81QNnozwaAQMMyeyajDGEUZSXuZlXZCVuhi010j w==;
X-CSE-ConnectionGUID: ZdF+HF0WRCapSsvRPwP/nw==
X-CSE-MsgGUID: UzCEbnWUQiSgSxVNKgEfLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75582006"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="75582006"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 00:41:20 -0700
X-CSE-ConnectionGUID: nzD81Dz2RrqJWjdzGqMEXw==
X-CSE-MsgGUID: Pcld90UzSx+HkuZpIhi1+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="224859417"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 00:41:20 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 00:41:19 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Mar 2026 00:41:19 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.62)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 00:41:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d9YPaX+18pIwCP9xf7YKTpraebyoOsQ9iCKUDUpcHSGhEE6U9L0aZzlcpm2+ce2GPOnEzN3cLjoaQJpcROJINdRjIvAjJTb46m/FFPCn9DZt9tr+T+NLIDJgQwlmwk0Z/OZGpn/eHiTNCehwA1kDBnDreuNzFXl95803OcXxopCK/0eMuJKhylCWTsLG9MzxL6XPclYbeZhtuMpsPntidgVtYgidGpbjwoZCSPBRicrJpv4miVLPFb9/7xr6R54CwS19WiHZxNct9AKfi/CJ9Z5tGCp1kKYcYJstDKHaAYoe4FiFx37sHfw+tCDErZlUi+7tPu1XWoKkLDSsECCYuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CKKUjCMi31qpsTGhmcojVYwoqV1d24Np9Octy0hhVM4=;
 b=YpUXdT+xh6+hIMLLjGcrnw8doqP0e+/bwoXYOaiGj3/PP5RhXzzWHtclpiCZ+UP8vAcgoFRK/dejP6z5WG0npK5qDGA+JaJQXNsb3XW8vWpXcLOoWTJWWItZy3LhA2z4OYE5zE97XO3DajA6xku6TW9HHghjoNDdUFtF/fUeNwR6k5Pm6G80qMoQJDdtAgCyW65X1kmh01fJI63cOU1NWIv0sSbeH1iBEiYKLmCtY9qB7v8hsB9r4HpWJrz81AfwNj61cfpEYedjluMc4ncqix2vk7iTbB2lE0xBYJ7lgbXEk1HkfYj0D4XJhWToEDDkAz59BZe+8A7ve4p6iF4n+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6519.namprd11.prod.outlook.com (2603:10b6:8:d1::5) by
 DM3PR11MB8683.namprd11.prod.outlook.com (2603:10b6:8:1ac::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.7; Thu, 26 Mar 2026 07:41:18 +0000
Received: from DS0PR11MB6519.namprd11.prod.outlook.com
 ([fe80::c336:8ed1:4b09:4414]) by DS0PR11MB6519.namprd11.prod.outlook.com
 ([fe80::c336:8ed1:4b09:4414%3]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 07:41:17 +0000
Date: Thu, 26 Mar 2026 00:41:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v8 08/12] drm/xe/bo: Block mmap of DONTNEED/purged BOs
Message-ID: <acTjGypY6etUed2B@gsse-cloud1.jf.intel.com>
References: <20260326055115.3422240-1-arvind.yadav@intel.com>
 <20260326055115.3422240-9-arvind.yadav@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260326055115.3422240-9-arvind.yadav@intel.com>
X-ClientProxiedBy: MW4P222CA0024.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::29) To DS0PR11MB6519.namprd11.prod.outlook.com
 (2603:10b6:8:d1::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6519:EE_|DM3PR11MB8683:EE_
X-MS-Office365-Filtering-Correlation-Id: 23efc17d-62f8-4136-8436-08de8b0b10c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: QDxjMpv1j+7gekLAAXKoLJGJ+RjECa1bkNuxH4BRdXfkbIANfb+modIBSURB8ADjAgBGu1NVQv2tRc/xcusLM9NGGN4Je0u/FqGQfho9IWukGtFVrFq5hCdG3628yaB4yC/rElf9rPWLLxpJDfkhXinRnUibrtLw877/TfrNIMGakm8Y2KGHzBmAMWDctmWo+GZQ3JzY1n0r8KnrltoAmwDvAXXGyuFdcs8J7lMj+M9Xg709UeePKpaLCD1saWfORHlgZ7P8BF92ViRq2oseRjci78E+IwZNUL2+Us2RkdIs1BLBc+icmQ5L6Xgp3ud86EltroYZJLNQ3dnWA7hBwNUUgE41QdQCX4KPkDF8Bc/FtIqm31oHSYaHxxJ4MpoWfXqltE0OQ7mhxzn3KiTej7YVUsN03Mtx8HTbLek+dKqnEJK0Aier2n0FM6F/zOfRGXpDF2HacgnXvaxkwnl/ZoH4OmF7/Ezip9FOBjDc8DEessOHGpgUj+1dVNbm1ChCLL47Z9R19QLmW/f4ukRNgz8MDKovrQSy4Eh/ohvybNExCNi7eYHnaSy0s/RsKrHPODvjmpaTi8B/g28zfhqtgTgoskAJxkklV/OAt7xlyVf4S54JgRO2FP+MrtLSSJ+Wcx4Q/btvQ+aJYT02Yxi+GsYPazYbKeRk5IOO48aHF/UBQRaiohdCXf2+0MJybS+NMUEIAlyFI0iUECkHQM6KV5MLOR/3YL+qvuS7/kYARW4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6519.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dE81VlBybm5xYXhWM2NkSlo5cnkzdlhqVUtyVUt2Tm5mZVRpNGNBTHdnajZH?=
 =?utf-8?B?WlJXZ1FhcHNuem9WVUkvV2pQdFYvYTgzM3ltdEFsQ1JXM2NwZ1V6emlzWUZX?=
 =?utf-8?B?cVY5U3BlQkhLSy9IOGtoYW04MnZjeGhJRXZ6aXI5M2t4Z3RLbU1GdzRJMHA0?=
 =?utf-8?B?b3ZPWUR4dWNoek5qU2l3N1FKUTl4Q3RtUktGbG5EK0p6UXV0NmhYZmM1MktM?=
 =?utf-8?B?YUplempQWTJjMGtYKzZzajdSVkptenlDbkcvMUFwMFR4Rzh5V2xiWlovOU9r?=
 =?utf-8?B?RHIwY2Q2NzVPRk94RlhROFNDT09FRFQwZzZmNWdUdmJNKzEySGZ5Y2ZsVUJw?=
 =?utf-8?B?UTN3YlFURzFNL1ZESXpZR2dzUDZiTzg4REJENitDMFptS29hd2VvWGJYMFdE?=
 =?utf-8?B?RFo3VU5rZGIzU3pKZ3pUR2JVaEIzWGkvWUJIYnFab0tLS21KaEV2QzRLc1hQ?=
 =?utf-8?B?TG5YdE1MQk0wNnpiODFHd0N3NXRWdHh1dzdwWXBHalBqOWx5cUVnc1BzR0Va?=
 =?utf-8?B?TTBoblhVNTB1Rm51d3ppUnBYQnFHYkFtUzNxSURLUDhUSWh1c2xIRWgraVdh?=
 =?utf-8?B?UmZFbWxtYU1rNEFXOHFHQVcrQUdEZ3RSWkV6TmNPUW5KTC9Ba0tPOXdleXBP?=
 =?utf-8?B?Yy9MMGJCSmdFNTgySE5Sa2FBMUc3MDlRSE1INHh4aVRaMmVMKy9ieDVMYVlS?=
 =?utf-8?B?MGg2dFhOcjZyOWF3TmJWaHB0VGN4NEsxTHFrSGc3RXZGU0p0Qmp2RzZIcTlh?=
 =?utf-8?B?UCt5MkJ0SWhZclEveEladWFxQUZYY2VXTGxrOThhKzRZNW93Y1Iyd3NkdXA1?=
 =?utf-8?B?MkpnbWoyZ3lhdVNzRVAwNGgzOFF3VnlPTm1pVGtQM29qSlRQclpsUzVtNU1I?=
 =?utf-8?B?elNPVHlmVkppS29yTE9JM2JabjVxSU5iWGNnVXN1WXIyNXZQRkRYV0I3Y1M3?=
 =?utf-8?B?cU5JN3czU1IyTkpCaEtBSlRpRXpoL0YvRmMrdTVBbElTWjRyeDVPamVuUVNh?=
 =?utf-8?B?aFFvVE1XbkdhMXBEYXp4SXNGM3pTcVpSQjAwYVNCV050ZW9sd3lVdkh5YURB?=
 =?utf-8?B?WnZjVHV5Nlptc2VlL0NCenNyNWt1NGxhd3NOMHhjWVVvYVVBTzFnaEJ4TENa?=
 =?utf-8?B?dEs5MkwrWVo0RGNuMW8xeEpNKzMxN2VEK1R6ZjRZRHl0R1haNTBPYTZENVBy?=
 =?utf-8?B?UEJuWUZVbUx6SUlvRG1TdGN6OUJHQ2Z2MFdUUVFJbGx5TUFCODcxOU9Xem5o?=
 =?utf-8?B?QXFUWUVId0JITy9GNTJEMzNJVVkxNlI1NVhsMlBidDQ3WjRKSG5GbXhyblBO?=
 =?utf-8?B?ZnRjTkFraXA4R21MblNPUmY2eGZIOS9wVkxVcStIRTh2cUhJZEFQL3VZMnFy?=
 =?utf-8?B?cytTc1dodklJaU14OVZiaVRmbXdDKzRvYlZhNU9hc21SL21hejJpUllwaXBJ?=
 =?utf-8?B?ZDIrMUd4S202UWNzSGtXMTdDZFU4akhQV3VqbE1LbmRHaTlRZXkrNXA4NmU2?=
 =?utf-8?B?WmFuUjRuVmU5UHhwOE5SVjhsWW9OaEY4ejJtUTdOOGZDOUJ3aGU1UGFEaEh6?=
 =?utf-8?B?MmVuUXdmbVNjNHFXUDNORWgzMFNrbTN1Z1FkVVRhUXpZbmxuZjJwRmRIUzJQ?=
 =?utf-8?B?NG9sdTR6cGxTT29sMmRNYzF2TlB1bHMyT0EzT05zTkNnVzM3SU1TYWsvOFBF?=
 =?utf-8?B?ZS9XcjhtV0dmQnN2cnIwcFNBb2Y0U1ZQM3JvaGRxZFo2aW0xMkdISzJnRDRT?=
 =?utf-8?B?SUJZSjlKeHRlaXdTZ0dQMW0vYWpmSFNXWGhXM1JvT3AxVit0ZkY5K0FrU1dy?=
 =?utf-8?B?c2tPQ2dVT0lmcUdiVngwTnFTVk56ZnJPRm9OK1JFQ0YzdnByeHFnS05XSzN6?=
 =?utf-8?B?amt0U1JpTjlvcGJ6bWt2ZFdWUDBzdytOK1ROc0IrZnB2b3BDMkRZczl1bFNr?=
 =?utf-8?B?RW04ZHJRUXNpdmRtR3dFMmdobHFJK3RjTm5Od0Z1Rms2U3E4eW1SOTRaSnVE?=
 =?utf-8?B?cUtXb2JKOWlVeUQ1clIzU2QyQ3ExeHpMM21adVgvdXV0VndYUzZQSDhMb0ZK?=
 =?utf-8?B?cldOTzAyaThPU2t5c3ZQa29WNFBnOEtmcTRjVnBLaVQvL0s1dWVFQ09CbDZ3?=
 =?utf-8?B?cjdJanpBWEZUYWJtUWtVR3g4UFd6RVN0bTJRR2Y5ZlkvN1oyYk1EWVpXZ3kr?=
 =?utf-8?B?d0pvMjBrYXp2U2ozOTRjTXRaN1IyVWxOOTA0Rm4vd2hFeUJlTzAvVGtrTi9J?=
 =?utf-8?B?VXJlRHV1TzU1dWRjdjhKZVBmb205V2xLNkZpLzhuQ3lTdjVmZTdDTWtXd2VQ?=
 =?utf-8?B?VzhkekFSMDlhRE96QWdkK0VFbXY2UDlIdGRBdWNnVUhPMjFqdE1OQ1BYM0pR?=
 =?utf-8?Q?Wd8DpdQun8pf+zLY=3D?=
X-Exchange-RoutingPolicyChecked: gIfJPgYj4iSZjY/bKyrRLw5cwogG1u5A2HHOf+n11D2nHA6tUvIt7NhqJ3dbBILcDR6iQIpXIi4Iyf88u8RKQxiX5hqdqgYb8CLOtof5zhP0skEN39zZ7Y87w56dyiUw54fcNaJG4JEU/w/kF8M9L6PtNPFNZxOWm+QnLnekAmIQ4zswXMiD/D/zdSQonFIXU4T34tCpPv8V2Y/9GdXkEnIQ19kbGxNZlLrbFYInhwFILDTfeUGUSQBqq1qYqXs8qmzjjSwofBK9mq2xXid0Is7r8HHPvayBe0AvSp2MHk3HnAi4S1YG4bjKkWRdGscsXhTMsaY17nktSMD4Y8zrOg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 23efc17d-62f8-4136-8436-08de8b0b10c7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6519.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 07:41:17.7398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tFa1tl/WnnmyWPKGHTecv4aUHU+aRCpyG5m696iXKwCaI+uFbofyqybeDbVXkCjeZm6auNny77k94uRCQZfwyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8683
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

On Thu, Mar 26, 2026 at 11:21:07AM +0530, Arvind Yadav wrote:
> Don't allow new CPU mmaps to BOs marked DONTNEED or PURGED.
> DONTNEED BOs can have their contents discarded at any time, making
> CPU access undefined behavior. PURGED BOs have no backing store and
> are permanently invalid.
> 
> Return -EBUSY for DONTNEED BOs (temporary purgeable state) and
> -EINVAL for purged BOs (permanent, no backing store).
> 
> The mmap offset ioctl now checks the BO's purgeable state before
> allowing userspace to establish a new CPU mapping. This prevents
> the race where userspace gets a valid offset but the BO is purged
> before actual faulting begins.
> 
> Existing mmaps (established before DONTNEED) may still work until
> pages are purged, at which point CPU faults fail with SIGBUS.
> 
> v6:
> - Split DONTNEED → -EBUSY and PURGED → -EINVAL for consistency
>   with the rest of the series (Thomas, Matt)
> 
> v7:
>   - Move purgeable check from xe_gem_mmap_offset_ioctl() into a new
>     xe_gem_object_mmap() callback that wraps drm_gem_ttm_mmap(). (Thomas)
>   - Use an interruptible lock. (Thomas)
> 
> v8:
>   - Check xe_bo_lock() return value and propagate error. (Thomas and
>     Matt)
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index da18b43650e3..c8e3a3fd4880 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2165,10 +2165,35 @@ static const struct vm_operations_struct xe_gem_vm_ops = {
>  	.access = xe_bo_vm_access,
>  };
>  
> +static int xe_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
> +{
> +	struct xe_bo *bo = gem_to_xe_bo(obj);
> +	int err = 0;
> +
> +	/*
> +	 * Reject mmap of purgeable BOs. DONTNEED BOs can be purged
> +	 * at any time, making CPU access undefined behavior. Purged BOs have
> +	 * no backing store and are permanently invalid.
> +	 */
> +	err = xe_bo_lock(bo, true);
> +	if (err)
> +		return err;
> +
> +	if (xe_bo_madv_is_dontneed(bo))
> +		err = -EBUSY;
> +	else if (xe_bo_is_purged(bo))
> +		err = -EINVAL;
> +	xe_bo_unlock(bo);
> +	if (err)
> +		return err;
> +
> +	return drm_gem_ttm_mmap(obj, vma);
> +}
> +
>  static const struct drm_gem_object_funcs xe_gem_object_funcs = {
>  	.free = xe_gem_object_free,
>  	.close = xe_gem_object_close,
> -	.mmap = drm_gem_ttm_mmap,
> +	.mmap = xe_gem_object_mmap,
>  	.export = xe_gem_prime_export,
>  	.vm_ops = &xe_gem_vm_ops,
>  };
> -- 
> 2.43.0
> 
