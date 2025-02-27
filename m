Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA482C197BF
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 18:38:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4897910EB57;
	Thu, 27 Feb 2025 18:38:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mst+qHcw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC48E10EB57
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Feb 2025 18:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740681506; x=1772217506;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PAS9qDFVDK8X46/c6UoOkNmXxUjDm8Dt85ab0uuGz7w=;
 b=Mst+qHcw2FqSItjpS8N+zRG/Zkhxt54SYquSjI1XO2GlZN83h6ju0goD
 rSJmZ136Ts7REyo5GfhwCmQpQOMIu8klDSGIclHuxtFBgqIKX5vsiXEFr
 8V2GJvGw/4xxVzLdCWY9tH8qxoRtHkV+MI0mK0BoEurKqBY5nlqJvtQnm
 l33F+lZPnvg9WXXZ4BMA3d4EGFtnQM2lgc63vbyYpUimP8aEzaQGCM7zz
 RD0LV5/kydKKS+vxrZosQoiY3GMPxhbL694AZO40NmBbmwDQ7DHqK4LAF
 TTYTqK3NHpW0Xd4f4qSLCp3/8NOBXf8ilBn4Kj3G9u1tdVRSXy8gpajrX A==;
X-CSE-ConnectionGUID: Wcjv0SX9QaCry7XgjaX65w==
X-CSE-MsgGUID: hUuRRe7vRo+ZEd7uG3fUew==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="40832741"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="40832741"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 10:38:25 -0800
X-CSE-ConnectionGUID: Jb1b/YkVQRCI3r2F8Yh3hA==
X-CSE-MsgGUID: Z6ltllFuTO2n1dfVP02xVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="117126779"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 10:38:25 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Feb 2025 10:38:24 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Feb 2025 10:38:24 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Feb 2025 10:38:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gzxy2jghUl9Pue2nh7Tr8v0K96XjHhsQnHeKejuG4DaMd7QqVFghyshK3MDX5zVSTPOSW8ruBw/QaEOSs+r/pSBekq/eNmq4dmAqIlGDfx70qWCdZfhvAOfwkE0D3yweWldJ4UBh3mKQrVyy8NkFdycWt20/MCucK5KkaBux81aGStwX0f2yaOtY/ThvrzMmU28TtsDUxkza1iK9xaTdC5i9e9Y1MUCovcHnWTuU3F8lxfpjBK3F2snOWIoabSYOUBWda5Xs49QhkOrXcPT3qlf4DL8a9z9ZWSi0Txk49VAvCB64+/PhLkhioQVo9e/oxB7qr/i2RBp0XB4QMu5GjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4CEAsQJmXVdJMX1cLsg5gTQ1uWy5KleRGwZ1jK9Kqk=;
 b=FqevJQ1vJ8WsUkczMAAXhIWT3cm/BeInNjGY0AjXRX23Fa0py+wfvjkGT+GIJ3ZAt/+qO0hShNNd3u7ho4sHEDI6c90o/vOv2VMW2DxyDIZ5RJtjm/liO2cloRoKu2bKqo5y0vbudzBa3y/VglKJRMmmEMQxgAYo4EJeokZ8XM98O5BoeXCPMW6yEjGCjQHYdJYcDBQ9ogro7066+HN9dBHlMkPoOA4pP9im1rY25rOp+New/kpR23BS1rbCfku/Nv6FbYH3OHGQQGmJYerx+rRnt4eoN6A1zIJz4lsDMIKHOuHam9cUw8Ofww0aEuPyBbvr0+VyEkf+1hAxNhijUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CYYPR11MB8360.namprd11.prod.outlook.com (2603:10b6:930:c3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Thu, 27 Feb
 2025 18:38:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8489.018; Thu, 27 Feb 2025
 18:38:21 +0000
Date: Thu, 27 Feb 2025 12:38:18 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH 1/4] drm/xe: Fix GT "for each engine" workarounds
Message-ID: <6lbuqhssdm6y3vptiwoyhxapzs6oek2nueph6nuqtr5mpqglmk@6pb6cgmjfkmc>
References: <20250226112106.28173-1-tvrtko.ursulin@igalia.com>
 <20250226112106.28173-2-tvrtko.ursulin@igalia.com>
 <sok4xz6pvdkm2ru63xy2lqv2vj2ogcemvpaygqz364nqqlxxgw@6gqxlzjilaij>
 <20250226215944.GF5109@mdroper-desk1.amr.corp.intel.com>
 <j2cqfbthxacfqelnons5m7ltaaqkdqdrzkbuhvx6wpdexpvpt6@hmlr7ey7otv6>
 <20250227173501.GP4460@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250227173501.GP4460@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR03CA0174.namprd03.prod.outlook.com
 (2603:10b6:303:8d::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CYYPR11MB8360:EE_
X-MS-Office365-Filtering-Correlation-Id: 54158ee9-df5d-4e06-16fc-08dd575de924
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ttukTRx/Puh2+F5XqoIvOzID4p6/MJ+4Z/vOSsJHoMtALca/c5+PNPgI152G?=
 =?us-ascii?Q?4rIZuqVkZGcWqP9dIbIkaSMRHn3nGS9Pm26Qvm57WrzLWuSdSxa875BKWowh?=
 =?us-ascii?Q?NAR2baJlaM3HI/6bWwor8FRL/11y6++BJ2/Qyd0MwQ/CDTUbnpd8wmWyAJQQ?=
 =?us-ascii?Q?pQYt/l1QZvqH05ZQtRBGTgd4LutiENPfcSCLQKIFZlrvWDTkXvRb0AqxTtBl?=
 =?us-ascii?Q?AoTvm3hX/ebqph35XeOsdp7F6RAHWr7k+2QRESR+DPT4VMNdedGs+VWGTW0q?=
 =?us-ascii?Q?Tq0eY01otWdIhbHTAr02cpgbIUxrMxluvLc8QqfF75LZj0sRrvgSDiqJemn6?=
 =?us-ascii?Q?zDtvonySErYB7hS5PVMcm5EvrdEM4iFWmPkiF2V4PpJ9myUnFTY3w0vMJrLx?=
 =?us-ascii?Q?pDsSqcmOIoPP6Puochb008ReNzU1B9e9F2+FmHGO+CEjT02Tk4IVeN0+u8CA?=
 =?us-ascii?Q?kunY0TWB7t2QVog2GqR3dWL6Dbi/Q5XnaB6yCTdjcDZgVuphB0QCsV7sM4eb?=
 =?us-ascii?Q?xw04JNvm3ZmFMbd3nwPU6pVV8ZZcyrrdJPrZeRrNpn6w6usUdqGbKmsLbh/R?=
 =?us-ascii?Q?G/6NiYGI39rGJW3o0jDFaiUaqCKDhJr/+7l2WMK4OqEFEkJ5WBp25J8DiZyb?=
 =?us-ascii?Q?OoDUNIAZ8uti5yn/ThBX22jjAxnO2kR2ChFxI3I7im673I/j7xJD7JdC5VGW?=
 =?us-ascii?Q?Re2c5mcxPrbTk76fbpyvh08sYCtiH4I4kmR4kXzf7V133yFaHrSd+EB8eGQm?=
 =?us-ascii?Q?GObi12eJt5z3VJkVOq1nUcmcLhcxiwpuViBpQI8Rohde/y2240pTV8y/1CLu?=
 =?us-ascii?Q?aXOWuWB3UhhxL+Ks6XUFKXU1osbpE7gbm2ck7CX/v3keKoEKyo7n2p+QjL3/?=
 =?us-ascii?Q?PGicxCqYYweQSHPiJSKVBPNox6i5ngtvFrJoyGYW4lbpe1s6z9nj+cvY0GDx?=
 =?us-ascii?Q?uwJfkyOKkAK1E+PZ87tmyN2f2m7gYY1ny7s6htxvfvci9WnhoWroTxW2Y8vX?=
 =?us-ascii?Q?MHbRtyANoO54HDlte6LqZ8M2yEpqTTTXcl6abVSfTnjR+M5wvFap8YoqcTg8?=
 =?us-ascii?Q?Ro+g/LlUGrrrvVIGHR0++6EmdoBn7Vqh2DWBvVjF6lwYOLtSGVn3RacmXyXs?=
 =?us-ascii?Q?PDZOUkCcuL0NK0S+0q2X4KJ8ViBbScGuz7Odl6G7pAxqtTRS6ExJ10FsVubO?=
 =?us-ascii?Q?HCzdpmP9hTDTaxuKRihaZ8gKnMnfI2FqZO92h1VTBSZ/vkuS96GMzsVDBxya?=
 =?us-ascii?Q?VzD7ZkNOjD1VUbyAJsZFEXEfFM6CwZdwhEO0lCvJUyFW90PcC3PilhioW/bo?=
 =?us-ascii?Q?J8xT08SdUmaThg7yzUcbgEOKecidqSPkolcmJxWg5iKB7yDAxlJTXWm5dRxj?=
 =?us-ascii?Q?/qUVc4iqdpiw9Bgy//PVB593VyHw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IjgtLFMo4ugvL8PveuidBxcn9Rw0M2HKwUASe8EDaoMgQiYa7xOioqZqCghc?=
 =?us-ascii?Q?llteIaxZ7kqHgMj2rc54fpLbVvrX3/5f9JkLDtMyy7rC3bEc/j06kvwatzsk?=
 =?us-ascii?Q?XKgqDyT7CeJ4vUqn8HZu/KR7RH6VEXqkrNd4uOi1Ir6eZMZrr3oMn8IcyTRB?=
 =?us-ascii?Q?l/6/nz8GXOnQw8oLkUPjjw+ayfEiyEVPJj6iJrPACFtOawznfjcrhFCY8AXu?=
 =?us-ascii?Q?fxxC5N/nNTE7DSg9SG7QOSvkOxW9pFSKoSoJiVxTVNJbDmQVV730u3shdRTs?=
 =?us-ascii?Q?ZQecKbyA2mdN3bCWPtFAyNZ9BiLdkut8QLkosYkd0KGNh2zNS93MpYWlMZiq?=
 =?us-ascii?Q?k561F+O+pnmJg8ayp8T2/UUyGdlZOCwRuFSYKMz4m5oJ46eJsYpYSlSRVAdY?=
 =?us-ascii?Q?jLb39pI5HSCjJZFpRfA23+tkPhV6gKIUs2dSrvxICpOvgEJt6kkCQd3u02oq?=
 =?us-ascii?Q?ZCGbG309LRm1514nGdIiuSJVof2JEC0CoZWibUxl/Qu32g9wJFcb/1psDpLN?=
 =?us-ascii?Q?AV4Q2ExLQvHEnExwffh/mnxIiKehs9IrbKL9N92Kt+0KzQboaS3UzK2ntP5q?=
 =?us-ascii?Q?1ttUkMb3wzLpzCgLupJPwQExfCgMNoWpj4Olq2R2NAfWPfz0qVoPv/3rn8Cc?=
 =?us-ascii?Q?Z6x+eF3wWDOEjgSmJJLZGlNI4+DwCYRIhhPvxLgobRIpLpVVo2btqlHd2XLq?=
 =?us-ascii?Q?fwTQtFgabG1Y8+R3qRpJQv67Q3pyRj5yTbqeD5bfBqyImhZGVEFsyMwYpQwa?=
 =?us-ascii?Q?o3zPJ3SHMyGXyGSAC9H5ZBXGc8SK7Ai2FHFEBLMFISexWgSeBeZkgXTPe20a?=
 =?us-ascii?Q?fqOwJ4NmlO65oN0K9fjmiSdiSFfpEBqPi1OnnY3zgiQFWoDgTdlaCnCC/GZP?=
 =?us-ascii?Q?uTiEOjcDyKvbBd8jbQCu2GiTblrH6aACyxZXOgxNv8djL5k6udEfYDATNp/w?=
 =?us-ascii?Q?n5UOvCd3B3uKGdl0+QBklYED4c+D6qMm6Sx8kXt913p3SoikpnbwJLFID7oh?=
 =?us-ascii?Q?t/AHRxqc/pWIajZdAmEPsguhK+TyBZ+ZH7f3wivINDUZuQQ3/EjrqLflEOnO?=
 =?us-ascii?Q?XEcTaTNApaKHv/bcEbGwQ/e8kvImG13w6mFcr0YtI+pJtd6IYSAOI35M1Irt?=
 =?us-ascii?Q?jN3W9iJrcwwE2+7hpMPIY62GQBRaeotpRXCQQlemQ02EASUMe3FoKaARvmM4?=
 =?us-ascii?Q?3vaNxTGwMJqGK6WVkCwVZQ0fRD2H3P89/aQb9RZy4l0ma9zEahSeBU520w8j?=
 =?us-ascii?Q?orNBOsvKYS5dSOG3+wrw/t46Hv40WcA7tcvDiatQ7gliSAszKwKdrW+c3KDc?=
 =?us-ascii?Q?d9oMqF7ALkyx9SPhIKHZ3KXs5jE45E45xKbyK9fqPhfoT1Eahsj22Rw+nFx2?=
 =?us-ascii?Q?nHueBB0kmZ1/GLKa71SleuXeQ825t2GW5BlyvkIYmYFIwiTSSq9Nu1l1NP7A?=
 =?us-ascii?Q?+7aW7iTI0Ti2hgMYs7K0F+lJiJfB9Nzkls6ZcX96mhqTNUejmBWQYhEczvL0?=
 =?us-ascii?Q?q5qWmq1ViTvk2NURulbClQ+Z51T+QRha3o3MWqxhHoNCnKn2omS1sJf0kYcb?=
 =?us-ascii?Q?CKaXi7PwRP6etRQ+6i52SGKBMl9zCXQi+PouIzSi7dgePtqGf5k3l7rSV3Gr?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54158ee9-df5d-4e06-16fc-08dd575de924
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 18:38:21.3940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mqgtvo9EQ6DZ2tgrZkhsHBuC3ssYGo3a3YoXDWdoofz55BBcFucyzzbnFBwk3rdJ2AgTCxqMiS/Oixq+83cKKXeVoeTnAZg7Fnmq7sB5KHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8360
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

On Thu, Feb 27, 2025 at 09:35:01AM -0800, Matt Roper wrote:
>On Wed, Feb 26, 2025 at 10:47:52PM -0600, Lucas De Marchi wrote:
>> On Wed, Feb 26, 2025 at 01:59:44PM -0800, Matt Roper wrote:
>> > On Wed, Feb 26, 2025 at 11:20:16AM -0600, Lucas De Marchi wrote:
>> > > On Wed, Feb 26, 2025 at 11:21:03AM +0000, Tvrtko Ursulin wrote:
>> > > > Any rules using engine matching are currently broken due RTP processing
>> > > > happening too in early init, before the list of hardware engines has been
>> > > > initialised.
>> > > >
>> > > > Fix this by moving workaround processing to later in the driver probe
>> > > > sequence, to just before the processed list is used for the first time.
>> > > >
>> > > > Looking at the debugfs gt0/workarounds on ADL-P we notice 14011060649
>> > > > should be present while we see, before:
>> > > >
>> > > > GT Workarounds
>> > > >     14011059788
>> > > >     14015795083
>> > > >
>> > > > And with the patch:
>> > > >
>> > > > GT Workarounds
>> > > >     14011060649
>> > > >     14011059788
>> > > >     14015795083
>> > > >
>> > > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> > > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> > > > Cc: Matt Roper <matthew.d.roper@intel.com>
>> > >
>> > > Cc: <stable@vger.kernel.org> # v6.11+
>> > > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > >
>> > > The version in Cc stable is because it's what matters for officially
>> > > supported HW by xe.
>> > >
>> > > We've been using the reset domain to decide if a WA is an engine vs gt
>> > > workaround. Although I'm thinking if it wouldn't be better to simply
>> > > drop the FOREACH_ENGINE processing and move those workarounds to be
>> > > engine workarounds. Matt, any thoughts?
>> >
>> > That's a common mistake we've made in the past --- it doesn't work.  If
>> > you try to put a bunch of these registers onto the GuC's save/restore
>> > list as happens with engine workarounds, the GuC will throw an assertion
>> > and fail to load because it considers them to be outside the very narrow
>> > set of register ranges it's allowed to work with.
>>
>> but that's a GuC issue that we would try to fix? at least for new
>> platforms. if the register is in the mmio space for
>> that engine, why would GuC do that?
>
>No, that's intentional behavior.  Just because something is inside a
>register's MMIO space doesn't mean the GuC should be re-programming it
>on resets.  The proper behavior for re-applying workarounds really comes
>down to the register's reset behavior (whether it's wiped by resets or
>not) and that's based on the sub-unit of hardware it lives inside, not
>where it falls in the MMIO space.  If the KMD asks the GuC to reprogram
>something that it shouldn't be, that's considered a KMD bug and the
>GuC's assertion is there to catch that.  It's a safety net to make sure
>the GuC isn't accidentally touching parts of hardware it has no need to.
>I might be misremembering, but I seem to recall that there may even be
>some hardware enforcement to prevent the GuC microcontroller from
>touching such register ranges on certain platforms.

I have to disagree here. It's absolutely necessary that it be *at least*
at the reset domain level. You can't add something to be programmed on
gt reset if the register is reset together with the engine. However the
opposite is not true. For me it make makes total sense to add some
registers there even if the current hardware happens to preserve them
across engine resets.

Lucas De Marchi

>
>
>Matt
>
>>
>> Lucas De Marchi
>>
>> >
>> > So no, unfortunately these do need to remain "GT" workarounds, even
>> > though they need to be applied to registers that have per-engine
>> > instances.  :-(
>> >
>> >
>> > Matt
>> >
>> > >
>> > > thanks
>> > > Lucas De Marchi
>> > >
>> > > > ---
>> > > > drivers/gpu/drm/xe/xe_gt.c | 4 ++--
>> > > > 1 file changed, 2 insertions(+), 2 deletions(-)
>> > > >
>> > > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> > > > index 650a0ee56e97..d59c03bc05b7 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_gt.c
>> > > > +++ b/drivers/gpu/drm/xe/xe_gt.c
>> > > > @@ -361,9 +361,7 @@ int xe_gt_init_early(struct xe_gt *gt)
>> > > > 	if (err)
>> > > > 		return err;
>> > > >
>> > > > -	xe_wa_process_gt(gt);
>> > > > 	xe_wa_process_oob(gt);
>> > > > -	xe_tuning_process_gt(gt);
>> > > >
>> > > > 	xe_force_wake_init_gt(gt, gt_to_fw(gt));
>> > > > 	spin_lock_init(&gt->global_invl_lock);
>> > > > @@ -450,6 +448,8 @@ static int all_fw_domain_init(struct xe_gt *gt)
>> > > > 	}
>> > > >
>> > > > 	xe_gt_mcr_set_implicit_defaults(gt);
>> > > > +	xe_wa_process_gt(gt);
>> > > > +	xe_tuning_process_gt(gt);
>> > > > 	xe_reg_sr_apply_mmio(&gt->reg_sr, gt);
>> > > >
>> > > > 	err = xe_gt_clock_init(gt);
>> > > > --
>> > > > 2.48.0
>> > > >
>> >
>> > --
>> > Matt Roper
>> > Graphics Software Engineer
>> > Linux GPU Platform Enablement
>> > Intel Corporation
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
