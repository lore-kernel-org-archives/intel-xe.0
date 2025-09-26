Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E296CAC5AE
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 16:36:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE44C10EAA5;
	Fri, 26 Sep 2025 16:36:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cSo8eo9B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76FB10EAA5
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 16:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758904611; x=1790440611;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KVNw1Ef8uLdVBQ8ftWIhxvxh0Zfi2ETrqBuJyAf2lgU=;
 b=cSo8eo9BU4IpqattQoZeGArTh8OHuA/DIPYhu9sZQ20re4m99hLgLC/v
 3DoDQd+2Jm66d24B4ZM3OS0MNlXP/8yakre5H7MYte4sUl/QFYyG8jYQw
 kMygeRFNKd3zcyFBYvDaKKgZzzzCdcdULonvyJ1fDx2Vtr+vRviHYOi4T
 cpvPSrR45t4KnMPCt+rtoFKdiEHuxHVJC4ASuM+RoUYNSoiLgkeVjj8G/
 4oS9PyMKEmMpcSLQz7QJI0jazVvjNT3FyHoHwklaghKgNJzmAmga+ioBv
 m2qZW8V8q3ZbX1t3BuQjargZh+mv3vcJr++sA3L8t1YJoHqbfub23GKAp g==;
X-CSE-ConnectionGUID: c4X8MiQlSnaq3V9SN7dBdA==
X-CSE-MsgGUID: qMAeRmi0T1KSYbUykBZRaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="78883344"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="78883344"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 09:36:50 -0700
X-CSE-ConnectionGUID: 2j0ogwjmTbq2g34GBPasBg==
X-CSE-MsgGUID: ZKka6s9QQ5CX/5mqlu0eqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="181651140"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 09:36:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 09:36:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 09:36:48 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.24) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 09:36:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vqJWBdSaHee88v701uCjLaqss9CF97rR98o6Mr6pJzBB94NEGH/f4PNZBqqpr3/kdcIK3A+2qeYpxWnSPnjsgbeZ7eLIOxqdIk301QHUkqJROUTNSA6Z1hmRu0dhoM++T1ZSPufY0vZ4NSHHJ87x26IXBeoD+je+gGyl7HvkkBPP0XzBcb8sR0UQGYK8eM5W1BJVfPWrlZiJf39i6KwPbeY2B1SnpVt0q1RxOZunGuuoLHepPyeaGxFwMsZ5SymnDWBwMw4Iyf23ssAHnPGtW5487Wc090WuwsepHNrbA0e/CM92vU6gic1TeOUyVWQ7d9+TMi+iMSqOSYMQAxjCfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=52pFIWBaLTdafh+Jd9hjPgE1VOEfkYHe4axKswORUyI=;
 b=fB0YlADHxkUmaMbvxv8U/JFbhipaXh3RELzqyiD3F724HtftXIqY1EG8BUXP4P24VenDh2rrOE5rAI0GSJFIvVevCJl8ACMkTlOnUSaaR1/Tlqv+4vU+L1XDsf1EKzBW58ym/lgkVek6xSv8nBynyxyuWNnkvHL8BPKT6IpcwiIXwyFF4BaePblrVb8bLzFodT3/MxZ543MndSiTavVsk7YSQ0j6eH8pAaL80KdBP986acwomExclLupDTl07caqUiHptpBxFM8gWocqPZLdOoU9/Kf3iEWsdx8V9AGbeRcxI2Tkexa2eFZZY9g+mdyeuyGzViaeDj7tRU133penZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB7127.namprd11.prod.outlook.com (2603:10b6:303:221::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 16:36:44 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 16:36:44 +0000
Date: Fri, 26 Sep 2025 11:36:41 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 03/22] drm/xe: Move 'va_bits' flag back to platform
 descriptor
Message-ID: <yaxfo5nzxuvonooipsmiwxlpdfash7niynoqaugv7amun5ioda@f7tg76dwmu2i>
References: <20250925234628.2112163-24-matthew.d.roper@intel.com>
 <20250925234628.2112163-27-matthew.d.roper@intel.com>
 <d55e24cd-9565-4e9a-94e2-1c144ccaecd5@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <d55e24cd-9565-4e9a-94e2-1c144ccaecd5@intel.com>
X-ClientProxiedBy: BYAPR21CA0030.namprd21.prod.outlook.com
 (2603:10b6:a03:114::40) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB7127:EE_
X-MS-Office365-Filtering-Correlation-Id: f6090c35-1e6d-4828-9e96-08ddfd1ae0e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?glClIuE2y5wBns3zExjoqqyDkYNJDJd4zhjH646N2+9gLCc+uVP+R1KHY8Fr?=
 =?us-ascii?Q?NDC4QmKKKbc824wceVqkznGbXHU+ybvhxeObu56VL3UPqxlKmi+otgO0ceMd?=
 =?us-ascii?Q?V3X82PDgpY8SIhQYuX9kWkW1a3dNgVanZtkeAikGck8XIrjoqoHNl7I42Pwq?=
 =?us-ascii?Q?d9AYfD79Tp0rKZP6E1cNXvQe8bYTycUon1zIWTONOUYUGmOk+/G/aAbk1bVw?=
 =?us-ascii?Q?eGXWGZCmrB3CaKDnPAHaZiQ0jNJ6S6jIV7Z7G8braY1rVGne/tNT99ELnX4f?=
 =?us-ascii?Q?7rsF/6QGyIuJC+SzaMTDUJhim38NTmQvlFNu+YvbCVlePS/SQjFe2FDEEHoU?=
 =?us-ascii?Q?+VDi8hBeWlYtBmsZtbq2vXXCSYy6+L3NC0VWLgTFFO6ByjrzBET100X+s0M1?=
 =?us-ascii?Q?8NdORdNTITNlUs9w5AR+hvWl6sT6N08e2jKzXohfVXjaKu6KqwhWKmMv2c8b?=
 =?us-ascii?Q?RYQZ7lpWrhomU9HQV+MLPdNd6ptyg/XHXWh7a3J2alRlVIstSFkl/Uy4SJVt?=
 =?us-ascii?Q?b3Ua9qzr7M2wOrfEKYn3ZGLoBECiq2U/RWGURVhOIP9TVeXdtMHs31XCXgh9?=
 =?us-ascii?Q?GzJnBboceBCOVs101NxjIEhiQ+DgqRCJZ6OoEn2zN9TwNGnZA4Ubj+G4+H+O?=
 =?us-ascii?Q?FCBfFesK+RlQKfK463IF1rWjkF6cxE0BMzj3dzkwcEIHs+Cj3WRgI50Np3Ta?=
 =?us-ascii?Q?i5Tvgbr8NjXP0mJaV6/CUJqjEpX1l8xnVmZbaNKxcSbyFIDuUz7XYoW4GPew?=
 =?us-ascii?Q?yRNJbAnxqTE4CTo2r6naCBVsDaY4qP8aHTLxzexla94J70+DYk2u6etOWHmC?=
 =?us-ascii?Q?RabyJyC7jnVJxJFRFuHZVBGm5QqmJaZIkZz7BnOJcHzIqCEPPYUvflkD4jkH?=
 =?us-ascii?Q?vwCupgmtdg6dqyG2inau//q9VSXHlOYeOo7qsmwaj4iHbnYLqb0IGq7iQi4M?=
 =?us-ascii?Q?lxk6ITDk/4BLMN4fYjvzsv+U2NDJLeS/7zFPyxk1NizmdLbHqCsfgCTnS132?=
 =?us-ascii?Q?n9h/PL1g/ZN4g9jRtlPNN2lMnwec41T5KHILIgiBz1hDz5saOdBbXpP87oTH?=
 =?us-ascii?Q?+E+OOqVnXBL7sdttVH1MmoVm4Dzj0THwitmbNcSn+VAnZSm1q94kS+3JHlm2?=
 =?us-ascii?Q?t95auHk0D0KI/84jx/Ve28nlUcnOINiHKb6IRGD9Y5ETmcdVvlVyEjHea1EE?=
 =?us-ascii?Q?NVSYYYsNMV2nimZKHjzUrVlkcXGsGBSFC7tAbzm9D8IpxTgk3aRNxgkipIyC?=
 =?us-ascii?Q?a3xLlle34RfIWdJVkxy2HNdDKaTQlWmbClBsVrqkPDWaGtR6OJ4Oddqz00OK?=
 =?us-ascii?Q?yn6WE6OxoXbDy8FkZod1hYI3+NA+pOxUsT5oE2Z+sPQLMwcD8569WvfbmyKv?=
 =?us-ascii?Q?+xgZxbpM2sLfH7RdqXxMDo5ldqgQgi2Xv5sZPD2KoOat+wC9hkPzWAnO7L5a?=
 =?us-ascii?Q?zj5QeqQRByJiFDp4WkjxnPZKqqn97MY7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wQ5Z4HShfnGABaOpA8/ufyY8IJxgvKg6JRjAQvmI43/FYdNZzMivBeVRL27z?=
 =?us-ascii?Q?+LVR77bRZD93P/GGmfQYHy/sdWML0JRZFyvTcdHgHHjfR7+kfomf4tyCvOhJ?=
 =?us-ascii?Q?/NmMo1JVW0NrQ4w0ktoMPCF0IDNBUX+c4ayJOwJsVvsfbd/FSN5Eu1azDMoB?=
 =?us-ascii?Q?g725UdwuzsRF9+aLO+P8YjUccHKU+gvXPYoIwTApuc2EkPsqx+kuE3etEoXL?=
 =?us-ascii?Q?67/OU9xv6t1o2lbzHr6yZm1up/88rUy6D/zzZMuapc0anmQRlPjuPhZtEzst?=
 =?us-ascii?Q?MiYJLuiZFo9pCDwIbNS9d1NpM0ilvZLgCnzNpPM2foiRulWefVC7w7zy1hIA?=
 =?us-ascii?Q?CUfxz7Azgk8ynos6Xz6VgsK9E97CsRKmvdiUvClpSMZvxmw9G/BGMXFP1cXG?=
 =?us-ascii?Q?7kAcsyAr1RpBm6Wm4d2Lb6y7OWsAATQZtPb7VKE+9PiDlbGjJnKrHuUQR0mO?=
 =?us-ascii?Q?IUNY6skV97OmbuOlFYFZKZisRGlke8B4AbIUf8PS53G+5ZdxlqfXN7Xv6H79?=
 =?us-ascii?Q?tBQdyImCePFnLlI+UazST48TXrud2e7HRC4ey6w3+wNAhsr0IK9jrV9HJHKL?=
 =?us-ascii?Q?u4k8zQbSViqtdNxk1+LT2tgz8Mu5w/dUZqL6nxn3lB/PyWWa7bpInkvru3V3?=
 =?us-ascii?Q?InJu5j6Px9HbKGinbws+C6M+W8A0PS9EMpp6lAV2jvxZ/rzrjIYmO86UuR84?=
 =?us-ascii?Q?uYqU14WyXhsYQtFytcEfHh1eZ4GrMXZT4KUrS92U4pLAJlWcfXk9p/jzW61Q?=
 =?us-ascii?Q?quQ3iSj2AUiBaXhXrKuWhmB+3gqml39lOU20iNfdiVVaoMq+pf98pzAT32DY?=
 =?us-ascii?Q?t7AJtvRr6+Ih1lrqDWHbQMDl7DkDF4RA931UMZ+PRR5trgykpiyJ6kJOQm9b?=
 =?us-ascii?Q?dl07Z7zb54lOJywMitM+4hN266WN2xz/gyRstaLhx179SmLVelLJIwM08/Oq?=
 =?us-ascii?Q?TSLJJMe8nfRxp7hb3ETR6MPv5z5Redt3K79Zk9VjYflDQazljAAgE94xwVVC?=
 =?us-ascii?Q?n79WwW4jKiRed1UT0qE9tdysRk6xrhJmH05hNeT/FwLgq93kKuKsQ8AcPr+V?=
 =?us-ascii?Q?npVYMlQ5AVsla30F5/au6Fw1egIoRjtiuoSCAGA8iZk9VTEAuYoCsbJguFtF?=
 =?us-ascii?Q?rxmwSLdUqVznbQHwng8PM5rfFoTmux/VyZIfhAWBmG+PVgwR+aSp4xymMgaO?=
 =?us-ascii?Q?jjxXUCQ4YIlfp+nKBAxYSowsg7hXt28ESsyndQGpbtzZimlF/zjsiFaRj56S?=
 =?us-ascii?Q?/rhbAzbxEdh5UTNtYsrxDeGOoA4D6yPlZpOVkkGd1GsRD4apYg/Qei9LoRnC?=
 =?us-ascii?Q?juF2kXfAfTL9mlk1GLgdXxMT9xWALynXcUu9OgRhRhwaNIIx50cl2uAvWKnj?=
 =?us-ascii?Q?/sr4i+/deIPNsSTWglnzgr4MctIju370V3rbLjf2PZOwMpuPfRBeJjTYe3mq?=
 =?us-ascii?Q?mexmbouwmDfmEUR26C4388OdKT7Utr2xo3O6EXRW+DWo4cgXWm8s/HRr2VOg?=
 =?us-ascii?Q?RW2DLgxXFuF5Yb4wRJ6r4Xe7EuxwlAbjixEnc+8aqy/fZB87kP85Fp5B+kGD?=
 =?us-ascii?Q?vNIlt1TFXHk9KuFrPAnbVxUPaY5p2yX/moN7nXXXWhLm1ewYHVz6nNOACsnd?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6090c35-1e6d-4828-9e96-08ddfd1ae0e1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 16:36:44.2583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ssWUijy5qAYWSI9l0+x1CBlt0827WcgNwVYiE9SYGy3VETxO52EjFgBI2Vr8D+SOsqBR/xJHsB9xeN0ebRY7hiXNMZ0mLHXkI5zfxFDeIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7127
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

On Fri, Sep 26, 2025 at 12:29:48PM +0200, Michal Wajdeczko wrote:
>
>
>On 9/26/2025 1:46 AM, Matt Roper wrote:
>> The number of virtual address bits is something that should be tracked
>> at the platform level rather than the IP level.  Even when mixing and
>> matching various graphics, media, and display IP blocks, the platform as
>> a whole has to have consistent page table handling.  This is also a
>> trait that should be tied to the platform even if the graphics IP itself
>> is not present (e.g., if we disable the primary GT via configfs).
>>
>> Since all platforms except PVC use the same value (48 bits), let's make
>> this the default if a platform descriptor doesn't specify the value.  If
>> more platforms show up in the future with virtual addresses of 57-bits
>> (or other sizes), we can go back to requiring this to be explicitly
>> specified for every platform at that time.
>
>but does it make sense to introduce exception in device_desc by relying
>that some unset values will have extra runtime code that sets defaults?
>
>all device_desc'riptors are static const so there should be no extra cost
>(beyond LOC) to store there 48 instead of 0

agreed... only downside I can see is having to be explicit, which we
already are for e.g. dma_mask_size. So, just adding it next to
dma_mask_size would also help translating the spec to the device
descriptor as they are closely located

The move from graphics_desc to device_desk makes sense though.

Lucas De Marchi

>
>>
>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_pci.c       | 8 +++-----
>>  drivers/gpu/drm/xe/xe_pci_types.h | 2 +-
>>  2 files changed, 4 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 3f42b91efa28..90dae6fa7fc8 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -52,13 +52,11 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
>>  static const struct xe_graphics_desc graphics_xelp = {
>>  	.hw_engine_mask = BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0),
>>
>> -	.va_bits = 48,
>>  	.vm_max_level = 3,
>>  };
>>
>>  #define XE_HP_FEATURES \
>>  	.has_range_tlb_inval = true, \
>> -	.va_bits = 48, \
>>  	.vm_max_level = 3
>>
>>  static const struct xe_graphics_desc graphics_xehpg = {
>> @@ -84,7 +82,6 @@ static const struct xe_graphics_desc graphics_xehpc = {
>>  		BIT(XE_HW_ENGINE_CCS2) | BIT(XE_HW_ENGINE_CCS3),
>>
>>  	XE_HP_FEATURES,
>> -	.va_bits = 57,
>>  	.vm_max_level = 4,
>>  	.vram_flags = XE_VRAM_FLAGS_NEED64K,
>>
>> @@ -108,7 +105,6 @@ static const struct xe_graphics_desc graphics_xelpg = {
>>  	.has_range_tlb_inval = 1, \
>>  	.has_usm = 1, \
>>  	.has_64bit_timestamp = 1, \
>> -	.va_bits = 48, \
>>  	.vm_max_level = 4, \
>>  	.hw_engine_mask = \
>>  		BIT(XE_HW_ENGINE_RCS0) | \
>> @@ -303,6 +299,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
>>  	.max_gt_per_tile = 1,
>>  	.max_remote_tiles = 1,
>>  	.require_force_probe = true,
>> +	.va_bits = 57,
>>  	.has_mbx_power_limits = false,
>>  };
>>
>> @@ -584,6 +581,8 @@ static int xe_info_init_early(struct xe_device *xe,
>>  		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
>>
>>  	xe->info.dma_mask_size = desc->dma_mask_size;
>> +	xe->info.va_bits = desc->va_bits ?: 48;
>
>all other fields are just simple copy
>this one requires (hard to spot) logic
>
>> +
>>  	xe->info.is_dgfx = desc->is_dgfx;
>>  	xe->info.has_fan_control = desc->has_fan_control;
>>  	xe->info.has_mbx_power_limits = desc->has_mbx_power_limits;
>> @@ -713,7 +712,6 @@ static int xe_info_init(struct xe_device *xe,
>>  	}
>>
>>  	xe->info.vram_flags = graphics_desc->vram_flags;
>> -	xe->info.va_bits = graphics_desc->va_bits;
>>  	xe->info.vm_max_level = graphics_desc->vm_max_level;
>>  	xe->info.has_asid = graphics_desc->has_asid;
>>  	xe->info.has_atomic_enable_pte_bit = graphics_desc->has_atomic_enable_pte_bit;
>> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
>> index 9b9766a3baa3..095133a1aa44 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
>> @@ -30,6 +30,7 @@ struct xe_device_desc {
>>  	u8 dma_mask_size;
>>  	u8 max_remote_tiles:2;
>>  	u8 max_gt_per_tile:2;
>> +	u8 va_bits;		/* default is 48 bits if not specified */
>>
>>  	u8 require_force_probe:1;
>>  	u8 is_dgfx:1;
>> @@ -51,7 +52,6 @@ struct xe_device_desc {
>>  };
>>
>>  struct xe_graphics_desc {
>> -	u8 va_bits;
>>  	u8 vm_max_level;
>>  	u8 vram_flags;
>>
>
