Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB39606BAC0
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 15:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lejrhWal
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5253C10F67D;
	Tue, 27 Oct 2026 15:38:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D891910F67C
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 15:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793115475; x=1824651475;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7PIRegN4bDSb8/woN1S8jKwoEgYX38rb3WVRkIZhIc4=;
 b=lejrhWalaM5mv0FwEeUTpqPnw7IOD1r7VTwCh5h36MBUUTvoWUUl8RXw
 YCqQpwU8h/SkIIMweYCVtcDIOoRNFMsatkCS85U7L7GjdbrXhQE83TjrZ
 lJdZ6l9kT1eTA2pu4Aa1LgW/wbMTM0Hb6wx25WosX/6w6pPxK6gbcv1rr
 ublKYKNE7ge95PHB3K1v/UpVQpVlonKIaYDq5zQIePWPeKeAFVLvertfZ
 bY2M8p4wH8fZ7DJn3YVeB48i0MlEA/cFbFG7w0dpX1hrlWAPiZDMKBPgR
 k5X2745y0BiYbc98CFJCaE+J/cvH5k9RVQtFkOhFWADD9NcX+qC7wZi0D Q==;
X-CSE-ConnectionGUID: 7Eo8KI4NS8S10jwMILzNeA==
X-CSE-MsgGUID: uWlXEtTqS1C8EE+ZitytJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1725808"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1725808"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 08:37:51 -0700
X-CSE-ConnectionGUID: N3BO2juXQX6jmmBZFfg4tA==
X-CSE-MsgGUID: eZDay226SteF0xombd4SEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4529737"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 08:37:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 08:37:49 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 08:37:49 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.65) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 08:37:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d65r5ogqaSuuS00PBfr+KZ1lk39jfTUMy8tsZ1FqcMLf0VXpVJ6U0yKqMzGBvIXH8dDbGr3md4mQ23AK31QuicaaHblftlEJwM3bKS5sA5kCNmAgg6tYGZZcIW4K5yTZ30bSx/hRM3JdnZbG9at3qxslY0hd2mq86Wg3ulMR5Cxm6/AN2b5rVNZHNErJErqHryq2EFVE0vRh/7WMJxbcNqUgvUJ4sORkNhvCmQzk8mUUG6RbdDj+YRfUNdbNaEzXLzpJ3m63xnq6fKVnETaNO32vaFci8CzuCkSAlNpBWYYwv956u8CfdesbJJ1jU/JzRDMTJdUI4mvslmUse2nzfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QX6hWtaBTiIlQXAsFryd7oCbXlykEUQnhKQWfHFyHqY=;
 b=ZmTkrrbR2iKVBd83t6MJPXgmQYOoqfxNYZ9ZiIwq0SXDd2Wxs3v/8zTBojm//1U5o1U9O1bh/stNdby0Mp4ppyJvz49Bjdbky5c3y5+NTPgp2zEiuXNEgskmiCNlE8O/yfXgRRadpJHr6wDQaffu1qmaj6d3sBUSEb2to4OL/VRONO3VNTJ9B6NCQURuVsfOouNcfZ4qquV2oFWRKxlC4l9y0FEY+I/LGBj+Trkb5aDgFGqHdvYmpltLX02bJrFjbyQLiFjV+i93EaNBCeULspgNYvbIK2hyM8LYMpb4/YckdpObm+3/Q25g1qDe8J6yyaihelGAUQ9DX5JryR4ldA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7207.namprd11.prod.outlook.com (2603:10b6:8:111::18)
 by CY2PR11MB590615.namprd11.prod.outlook.com (2603:10b6:930:111::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 15:37:47 +0000
Received: from DM4PR11MB7207.namprd11.prod.outlook.com
 ([fe80::7806:5aac:a263:2653]) by DM4PR11MB7207.namprd11.prod.outlook.com
 ([fe80::7806:5aac:a263:2653%3]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 15:37:47 +0000
Date: Tue, 27 Oct 2026 16:37:40 +0100
From: Jan Maslak <jan.maslak@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/migrate: Keep access_memory chunks within the
 transfer limit
Message-ID: <auDFRMlLvCAPx9BT@ART-DEV-395>
References: <20261027145237.1862132-1-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261027145237.1862132-1-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: VI1PR10CA0086.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::15) To DM4PR11MB7207.namprd11.prod.outlook.com
 (2603:10b6:8:111::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7207:EE_|CY2PR11MB590615:EE_
X-MS-Office365-Filtering-Correlation-Id: aa7ec8f1-06d3-4dce-0dc9-08df34404011
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|261009223027099003|261022105027099003|261021121427099003|10067099003|56012099006|261026121527099003|22082099003|18002099003|11063799006|261026140227099003;
X-Microsoft-Antispam-Message-Info: zVbyMMNYOAcWD9Twv1FxS/QIDz8V8HUAlppJir0EUJwUnS2B9ONM26wlZ2VM9vGvad4uAqK29Ne4nvbNway//iODW4HOgmjFcGSEzu1xo1sDzyLcAsA6qj/pyNEfUyGanPb00uuQLGMG8KXU9pK3NNo3XFrhdsZX/NzzZyv/CbtVdkmGKNgHGVvttHWP7kfYU0XLjskva8lT5qIrPIW/IFUmM7AARcPIA1z/IydZ4Jbd2dTYXGeG2tZ/q9+5C36DbDnN+O9AZkc5ssEDBZwf+nud6+RPzLH1gEcZ49M27qL3r7+MPPnvfPw4Fs00laSk5ekJtMS6ooCzgkzDg069QDXePEo2L0qwnwN4Q0SDVgrBEpt6jJNPYko/7VpjjegdND1MFNtKtvQllS4P9oZxnXhdV40jl1/ejYpi5aXw+nkImIIg504dhlW6+UK8O9Ph3Iu16djCaORWjCb+3OgAnuQUms39TQ2H5RsArc7Ki3ujzHQdGlHtYNwe1xkD8TP35vG6SWIgJ50cNs1y/ablk6iaqkVayaVvqoeyA0QgsWbwpTvqCHRNoNKhzkLXodkmOBBBwv7so7ywzU9g3HT/iH9N5a5HFHDUR7qakgq+9Mxo7CBcSHWvOsyOCv/ITIWn/NUG/mTf3Axru3SvNbf9+TmR3V0F6bV528mB+4XSADU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(261009223027099003)(261022105027099003)(261021121427099003)(10067099003)(56012099006)(261026121527099003)(22082099003)(18002099003)(11063799006)(261026140227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?bvMUJLWHKdUhsxtaGkVdJOEkiW896a7skxDmtG0fh6IWj4Z+C5mMRXSZ4e?=
 =?iso-8859-1?Q?lBRULdFdsgYNde7z9HdOdGSfNZgD7cpVaX50XaLk9SWTCa4U/XYJs56g3k?=
 =?iso-8859-1?Q?Jz+JCtFz9UtWVdaWSp73FE5FMkDZGlIOxZSiKVzmgg2WiY88A8OqkUaHt+?=
 =?iso-8859-1?Q?6P3GQDd5oVHaAUAWBhirvAU1ZT4ieVNgMpsKTjc53TYXd4NpN29bKiNZ9g?=
 =?iso-8859-1?Q?6+lCGlrr8VqU4aqtzqCYctSHe3+jfSVgq2Ve+eJQFgH66bpwOw+o5fWjqd?=
 =?iso-8859-1?Q?DQAZ8cnLnbmebdgRIfPDyzGk2ONcAneyiXCihCnSOPtmof1M3QfJIU12F9?=
 =?iso-8859-1?Q?LF53DS5HttVcqtKycgIec9Mz6sTShcv3XTnj5stgnGKcTWsJuqnEx6OFjZ?=
 =?iso-8859-1?Q?nENcL0txST7HQSevihs+9jjM4qnu69A8IrMtEvk4ZxCBiW1/gC/UdEYNIZ?=
 =?iso-8859-1?Q?Fsnn4LvvgSUBHpNcGVMTvBKJW3vtKPmdV4l9k9rOFPX14BhI4chY1jZHe9?=
 =?iso-8859-1?Q?tVoMZPj88+xihSUsdJ6F9dD0LgcyPabdMIuU6ThUEtMb2hVWDhJvIdogFT?=
 =?iso-8859-1?Q?tLEcdToLK7M8JOlBv7f5cebTlwmW3kb/nu4JA0VqhWrXXKdg4xQSHbJaMF?=
 =?iso-8859-1?Q?q95N0wcFj+JrPmGCkBZAWB3L35bSZTZYBBcCiRQ1OZfkkwKSBGBdhNDB68?=
 =?iso-8859-1?Q?PXFKbzVwC+FTGF8imldcCuXxbvfsukCj3EY8TGNiI06SsJ/SLUEVww/bVW?=
 =?iso-8859-1?Q?RFcykMT4GRCAetGaCiwExQoonFvR7IWJbWN+jvap8AKRkS0thEDP2rW0i0?=
 =?iso-8859-1?Q?Or7JHuwr1rxkFt3HCHdD2QdMp0w3VbMHWTkvH0QepqKZz4Z7nomRicnONl?=
 =?iso-8859-1?Q?XNAPpIZtAzFd3AyPb6t4H3GNRP/LNf2z5M5Rfk+AI9z7PQw4hhrnQ1q1gr?=
 =?iso-8859-1?Q?rIobZNpkHv3dj0EYaUn9Fz16HRqP5DOPNp22lmtbTKiqfJGkbGKmadQ8TG?=
 =?iso-8859-1?Q?RNOTx9o9ORup0EwkyH2vGYIpWdB2ipeji8TPAa9GID+rNdnuAZ1yZkP5Hm?=
 =?iso-8859-1?Q?ElO5ZzIZuFF5Zhsk7Ou13P3HIG2OD/S53dpc3pajuXfADv3I78DHJeFKTT?=
 =?iso-8859-1?Q?ErmxY2CyBjU6kOvPLE1iVVEoBsI7vdW3qV53wDt/d7CQWZYtZMovIl7yUb?=
 =?iso-8859-1?Q?nkPYRo1Cnh1NEd8SzleGFlT40Yeojpjqjc2SDqwtbMk6IJPH6F9sD3YS2Q?=
 =?iso-8859-1?Q?A6DIIzZ+pJKB78ixYkFn3VeIGJm43LPg36cmyTjZgOiktoy+XfEHOemg0z?=
 =?iso-8859-1?Q?/cSR47yhCAYKf4fxLM9qqAqSCQJqtjFTmqlszTKkVp1/6L9bOreQpI/wtL?=
 =?iso-8859-1?Q?lhjhAGbVNXa7Bd0ATjH/gS3XjD3IDlZxOH6uQOGax7G46U/EhvuCOt3PoV?=
 =?iso-8859-1?Q?C55Tn4btqyURVsJMwATF+QoZwGD2G2ecyLZswkQAyEil4XmXG/0EA2p4k4?=
 =?iso-8859-1?Q?JuMhZvfcBy07aHrlwhQ2b1GqoBEgkCXXgdJp1goJo/5a+pRxDxr1o6AK2u?=
 =?iso-8859-1?Q?1KTcgfvUlsu+aVh+TvjsXhUatp26ZJpZG7S2R+9cFtN1klk+zRU25a4Ll+?=
 =?iso-8859-1?Q?TzAXm2lzS+HR47Hi6F356Ek1AhQXXgKPWkixoJoHYCduAXgX+4pobG//2L?=
 =?iso-8859-1?Q?UfcXdKQHUF9TJyMpH9YeMLGEaNvyy+mMcTfnxRmnbc1QGqBsNt7Zp9CkWP?=
 =?iso-8859-1?Q?yIyP/shhTvYE6qdGe0pzEFaDeG/wdaqzNYUOBXh0yUnJlXrXQjZ2qw0Jlt?=
 =?iso-8859-1?Q?TqiFm0OolA=3D=3D?=
X-Exchange-RoutingPolicyChecked: yRIkywMz0jS1R7fLa9CVU09iWIUiirOWKj9lHXGPXUQaF3QfvEaS+maCTWho0V5iL9q0cV5fi/YxCtXlIeNcjqNKugG3OkCkTcJV5iKBKysKgynt9waH+ePO6E1EPzrCOQgh9ceCW2b2sHXqaD3Qkp/2UTNjGAeML+C1P1XX2bbTNe1r4/ljl9IA+jG5ImaUT6RejJ0H5BfxFbqZbo6LWVLXE70dGgOlVKVLCXndOhZuG66D+eqiA2YxY5vLjMcZeWsZUQMuirHpLujAXrNzutFuNWWNx1nQk2uxZ2T6ZTNCDENeuc35umMJhgorKFK/fvXugQNm8GWppogSVnA0DA==
X-MS-Exchange-CrossTenant-Network-Message-Id: aa7ec8f1-06d3-4dce-0dc9-08df34404011
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 15:37:47.0037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JbDJiVKxIFzlxR+qkf+8/d6+GZVKDYg1qNrCrT84+lutt+emJzp+DdYJdLuk+vED4lhk+S8N1yjcjRUHS5oezg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY2PR11MB590615
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 04:52:36PM +0200, Mika Kuoppala wrote:
> xe_migrate_access_memory() caps each chunk at MAX_PREEMPTDISABLE_TRANSFER,
> but xe_migrate_vram() maps the system memory side from the start of the
> page the chunk begins in, DIV_ROUND_UP(len + sram_offset, PAGE_SIZE)
> pages.
> 
> So when buf is mid page, the 'wasted' space at the start of the first
> page needs to be taken into account when considering the amount that
> can be copied. Otherwise a full chunk needs one page more than the limit
> allows, which trips the warning in pte_update_cmd_size() and, on debug
> builds, the assert in xe_migrate_vram().
> 
> window:  |slot 0|slot 1| ...  |slot 2047|
>          0                              8M
> data:      [=================================]   starts at sram_offset
>            ^ sram_offset                ^ must end here or earlier
> 
> This happens for example when the access starts at an unaligned vram
> offset.
> 
> Fix this by capping the chunk at the limit minus sram_offset.
> 
> Seen on BMG with igt@xe_eudebug@vm-access-alignment, which rewrites 24M
> and 48M objects from offset 4 through eudebug vm access:
> 
>   xe 0000:03:00.0: [drm] Assertion `npages * ((1UL) << 12) <= 0x00800000` failed!
>   WARNING: drivers/gpu/drm/xe/xe_migrate.c:2255 at xe_migrate_vram+0xf40/0x15e0 [xe]
>   Call Trace:
>   xe_migrate_access_memory
>   xe_ttm_access_memory
>   ttm_bo_access
> 
>   WARNING: drivers/gpu/drm/xe/xe_migrate.c:2118 at xe_migrate_vram+0xbb7/0x15e0 [xe]
>   Call Trace:
>   xe_migrate_access_memory
>   xe_ttm_access_memory
>   ttm_bo_access
> 
> Fixes: 270172f64b11 ("drm/xe: Update xe_ttm_access_memory to use GPU for non-visible access")
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Jan Maslak <jan.maslak@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

Reviewed-by: Jan Maslak <jan.maslak@intel.com>
