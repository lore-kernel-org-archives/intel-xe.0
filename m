Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2D8CD6E49
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 18:30:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 146111123B4;
	Fri, 29 May 2026 18:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YTIYSjah";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 312931123B4
 for <intel-xe@lists.freedesktop.org>; Fri, 29 May 2026 18:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780079452; x=1811615452;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YNPc6KBKIWxT3LplHyY+0QhJimlcK4f4l7o6BMm114o=;
 b=YTIYSjahc8Km8Ij54DMeui43KF952FNHnsQ75QY+K0/mEUh5On0ZClUK
 4f0+cgZoS3xRtRAYhCYvhtX28z/cFeZ1x3Wjf1Cis1KBgYnPkGbKeLzF7
 HM9Q8Dpq1wP0KWIdtMpo703jK7OTsLSLes59mlYbhyrWWLbRKjar2eBMp
 rz3difZbtVIiuqv3aLDSQy3yQCHl3CD/EEAqtI8rx/uhpfwQCpkw+yax5
 dkHeVCvrLD4VXoKmxUGvZEkb4rTPFVO2uJ1Pjep9aAZ/DTUdpMBtUJah6
 XrPK4V/l7+r931W5jkHaoERKoPZ/178iop08aJNZst93tbfZ6LLJewcps A==;
X-CSE-ConnectionGUID: cD+KO3iqRyCbNkRU7/2hWg==
X-CSE-MsgGUID: 08Rmjs/PSXSqxNNnbsnu2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="81123240"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="81123240"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 11:30:52 -0700
X-CSE-ConnectionGUID: /e3yqKx6T+KmeyH/g6E5GA==
X-CSE-MsgGUID: s4I7L99WQP6rnPCkA54Ybw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="238539514"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 11:30:50 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 11:30:50 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 29 May 2026 11:30:50 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.63) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 11:30:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f9lpqcxjA+FFOJE6WeSrNXok8IwCYqNZp1E7RxwnfhV3PU8OJDGLqy22Zqjla1KwLVX+W6Y2chKZARS8w6I0hyavetZbOXriyDmpuW7wqq2vVPQ9/yPnGpTpefWRzHRMjsjRUFGlgkUfP0zNwgAJHya4QfldlDb8X0x9axFC4JE0tdhFOucTL3O5QPI6k5D5i8KlAVApRgI+8zag42REmsphkLyySSysO53LyJSPs6hjicgWcysFz47cI5nrSV6+IDMHOtOQIf8gp2SeLkjDPUkIMsoMMIWyBUmzv6Gv7QgrzYzbKlLo7XcygLbYXFmrH/8XpYTUi+EFPX7zjeGgMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+dy4rZjns0nA0EUjxSGoi/oBV6a3n7HjPQRIZCzvTaE=;
 b=qnKky8Dq2n57aApLAhrDdyNBtrxe/ylksFImX2Tcxge4xLI6zgYgjOoXo+DOcvRL0rSsHZT+L2fH0RD2NwDFJXtThFBWStICO8G6L39S3CEz460ib+P0T4F2ZOZYdLt4Pt/Zqm61DN7M7M2ByRIBne8G+BVAZ4Dq96hodF98X/6S25VmMmKfhnZCmGud8FArQ7v3AdhZp8sZmwgULeGwKAtMA2nL0BZ7QLjyWbzzCUJYapnFsBlB3nq+Ne0K87dXB8ECBQ+V9k+WWT7iEyc+PLLdMwUE4NSOeVmEemmhkLmchTsuyRsnG3HOB2qhz/uGD+Cc25IMv6nOIFkpqANMvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB7452.namprd11.prod.outlook.com (2603:10b6:510:27d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Fri, 29 May
 2026 18:30:42 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 18:30:42 +0000
Date: Fri, 29 May 2026 11:30:34 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/9] drm/xe/rtp: Keep track of non-OA nonpriv slots
Message-ID: <ahnbSrt2ee6b/m4z@soc-5CG1426VCC.clients.intel.com>
References: <20260518234716.1540123-1-ashutosh.dixit@intel.com>
 <20260518234716.1540123-4-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260518234716.1540123-4-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0355.namprd03.prod.outlook.com
 (2603:10b6:303:dc::30) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB7452:EE_
X-MS-Office365-Filtering-Correlation-Id: 39150285-7b99-4a0d-2584-08debdb063da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|11063799006|4143699003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: aDMi+1q/uGHHRDol8ddlrma0F86Y1L6rWE2JllRVRYFf0WdWOVF+SseLKtjbNjJn3AFvOKiaqvhyv0/OF+OTkil1G24hiysDj0C0nrO78qzAqhyhzgrht1tIxC3PZH++LHYeh3Wp+7ZR93F6YIkjHEgEJaVgSnbM8pp8oGKj5lqOxpgJH/CrSD5xSmfzOUBiGcs8CifcprgZZol8RJuuqJKB9KRGYOwpuIj/7WDayJ5W3IRjXvvr4JvGF0xylTa0SMThvf7mTqcpUShEQmyNqoYtGkDY04sjs+7NiNr6cIRHlplQn97a5eCmkZSiSPCXZf3GX1cDVA2EDzxsIRCXDuKyJ10ow/5t/jJrY8Q3zN8bpxCiv6kXwPQoxlFpzoz/z6ROaqzKGmusCJvG8bdh6fwD6dO/ppEuBokt8LOY8eW49AW+bO5ZKgSOnQVbB6DZKhVXoBvCh1XpCn+dMhe6c3gEI0bzDelurLLOetKdU2zT0n643wCVGUxvgo5oxMS+eb2nVZbVUTgvhY0V/KwewQTSZ3Wpsz/G14vUZfzJTl+JToaNGnXL0OPiZHsfI5rkQuTbovH2KSD01Ojb5vFlOfZfUjNcvHR85crx1A1jrn4rWAW2XRZop6GiXe/8UU/oEd/ojlkYDpFDVkpZsm7eWpG36oMT59Prk2dsa2JE+OzFYskLKJ1J+0Jfwpp2CBSkLqZQTbqMTzV80wnZxK7Dvw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(11063799006)(4143699003)(18002099003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3RyVGhteW1lUlE4OEFHMDdIMVFFLzBYQVhGZU0vZVo1MkN2UEp0SjNyVWpm?=
 =?utf-8?B?SWg5Y3NaVW5WZE8xMktEYzlUUTZhYjF4d09LK09kYWZGTnJUMmVod2srdGNF?=
 =?utf-8?B?RFpFR3d0emsrcWhJRC84Q0tUM2d0SHpwTlVCVjRjc1JsSGtIVjNMZkxjZmVj?=
 =?utf-8?B?N1ZNN094Nm9wY1FEYVhUNE5ZUG1wcVVuZ3VsUzZpaEhQQkdodGVSOFp3dTla?=
 =?utf-8?B?VUR0ZjR1WjJJcTJXY250NFkzTTFESndacys2OTNuaHNXdFA2bmJKamtEek1E?=
 =?utf-8?B?VC94UTd0TTJuNzNiUTJYSEdxWG1nN21rNVB5Zzd0TythNjhCNXltUHVvV1dK?=
 =?utf-8?B?d1hycXQxUlZLK0YvZTM3Um5ZVzB0L1R3S1VyekptWWNPZ29MRkswNGtuenBa?=
 =?utf-8?B?NHdlMHRLeVdoSFUwOU9FRHlVOHovRkFSbVJnN1FjTTJZcEdkODlFZWNiYndy?=
 =?utf-8?B?WUVhWE9ZRlhLWmxEN0d5SWE0bm83SW9tNlVITkEyUHlSQStMNFVRaUtmZjcx?=
 =?utf-8?B?eG14Z3J6UXp5QlBzaHdIbjIwLytZVDBqMk1rcWtBVjE4RCtqcyt0Q0hEVm9W?=
 =?utf-8?B?aU40aENqV2hOVjE5KzBpMGViRDVIWHlTMndhZmR2bUJXZTZsWUJnMFRZRmhN?=
 =?utf-8?B?SStWNTBLamhsWEYydFJHOGJPdHppU2tYS3padDV6d1pEVG5uRHcveUF1c0Jn?=
 =?utf-8?B?NXFnc0JHMjI1Z0hvNWpNWDJzd29hNjJ6VTRFTFZWLzNxb2d0OU1MOE9VUmtx?=
 =?utf-8?B?ZkpKVmk0OVJMODlZbXY0SHh6VDc5UWdzNmVvN0VKRVZWbURySC9rR0ZGc1Ar?=
 =?utf-8?B?UXpNTkFkWmdXZ0Mza00wNFhGTy9QbTJTeTI0Y09XdXk2cWtFcnVFaCtKdmhp?=
 =?utf-8?B?cmNHbitEYWhmS0drTTBsQzg2QVBRZ0xRK1hZcCtzQzRLdmxlTEFjbGt0SEtM?=
 =?utf-8?B?WE1LMVVzcVR0eUo4Q1FCREowUTlrRitRd1BnU0dHV092ZkF6UVJNNzNKQ3kr?=
 =?utf-8?B?UlZzejNsaC8rTjcxZEMyZ2xOZng5ZjNNSTdBZWpXU0JTYlZoV0dBSFo2U1VU?=
 =?utf-8?B?K3dvaWhEYkpLY1dzbzFhdHRzSE1mUW1YYWhqNXVEMmIxZmFpcjA0V3lYdmxK?=
 =?utf-8?B?T0loQ29Fbm1ZaVk5TmNaTno3Qy94VnBES0ZCK2Z0dXVOTEd6M2ZuZUc2TGtj?=
 =?utf-8?B?SDNGdGd0ckpXZDVNSUVialRHdm5OazdLeXVtRStSbzBJYktyNWlLdVhkbnpi?=
 =?utf-8?B?SGI0akJONVYrQmdDZmtYU2ZoemVhU2FKRjdLMzZ1WlhHZ2dFMUpjMjNJNU9U?=
 =?utf-8?B?ZXpkT3g0QU1iNzRoUm0wNC9RQjNJem42bXY4RTY3SGNiQ0hkTjh6aHhJYTNw?=
 =?utf-8?B?WVNzM1RhWWJ5RHRCTHllL2lRY2ZTa2VlbkF0VzFkbjhhRDA4L2RSVWZDVTRo?=
 =?utf-8?B?aFk2K2l6WE5QSXNrM3NpcGVBNTZ5VWUwbTE4YnFpeDdwSUVvNkd1SXRtY2ZL?=
 =?utf-8?B?NGtKby9oSzVOZ09lM29pYi80c21zWGh5b2dBQldxQ0ZkR3VvYjlCTTBJbllq?=
 =?utf-8?B?NStjMHdVNmEwUDdxMUlNd0tHUmpZR09rRlpQaUU1ODNxbUNOd0JOWENVZFZt?=
 =?utf-8?B?dng4eVRVWDBMdVRkTXpKcHlZSFRHdmJwbDNGUFZvYk5xYWQ1VnNIN3hpTHNY?=
 =?utf-8?B?QjZPR0RHWkpydnV4bnlhSkkzYllaU243MnRPUmNzQzdPWklKb3hIbVZHaXpo?=
 =?utf-8?B?UkRuYU9rQ2lQMm12VDJVbWp0ek43RmJrQ0RPYjRlQ0duUUR3L0dyemhrdVRP?=
 =?utf-8?B?Z0paS21iMXBybDVYNnlJNzZ4bElsYmFnc3RRMjBZQmprYy85aWJKd2R2ZlR6?=
 =?utf-8?B?QTlKOXBwYVpVd3RIemYyd0RqbTdiVnQwL2ZhbldBd0RRYURDc2Npb1VrV2xF?=
 =?utf-8?B?aDdwTWNNWnlFYlNLTjd5bm85d0xweURQNTdWNlRVdVFTOFFqK2d2eG02cktx?=
 =?utf-8?B?bzFqcWY1eE5xUGYxakEzUVBBVnNtaVBIdE92NEt2czVwck9YSlFSc2dzZ1U0?=
 =?utf-8?B?aEhnblRpSHBDVWl1a1diSlB0d3B0cnZzZ09WQWNERGkwSlAyak9IZVhMZ2No?=
 =?utf-8?B?enJZcnU3bFNNZW95WlBIRDRPQ1dOT1oyZE0vMHRCbWE4UVRrdFBHRUw3cnpn?=
 =?utf-8?B?SmNUZVZ1Mm5YQUZGWWh2N3R1akt1NThQMWNPVnZCRjVTcmw3NG9lUk0vMGJw?=
 =?utf-8?B?cUpONVBDYXh4TlBvaDRGSHljTE9ScEF0dzY5OWdoUkd2NVl0QVRveGJKVG9T?=
 =?utf-8?B?TXNsL0hxRzBRT3JNcktMK3BwY2piWDJNTFRkcG16NDE2bnNUd1FZNW9ZOHB0?=
 =?utf-8?Q?n/mzdS/RbQlf4zkE=3D?=
X-Exchange-RoutingPolicyChecked: gdeLptZpMfup3VGw4qLcWu2pB7H1Pj/lV73xW0iPFmLYnRtUk1XSXgXd0+b0gI2bapE5I7uF0vO3HnjPDO5nucLVpBEU72jNcw+zk/ygWEDFgwuBb+IGpEbH6YbXSVj7sN8vuskaSKUEfHGl//xSwI/WdpxhoXjE7Qj6DMA9PwfGfXZvRIsik6LcCJv/OSRpd12OmhZ5tX1JMexAXNm3brpcIlfbDOpMfB+Iv744w2OPYmKWEbRmwRFygdbDaWqcGIMFSlsNR76lIYXNM9cC3YmN3nfKf2cbQ/StxioEMOtMEuQLy5F2HahntA5akilOGCm/bWyI0pJ4vH3fXjifEw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 39150285-7b99-4a0d-2584-08debdb063da
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 18:30:42.4156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LLctp0P/Vwh82KaIKqV6Meo8aaEzJk6XxuLMmAaYga6szAnimYCmY9psQJmiHGs3cEdywVdJRxjBRZkXQE5kePxR5/8lXi2K9eayZjeg994=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7452
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

On Mon, May 18, 2026 at 04:47:10PM -0700, Ashutosh Dixit wrote:
>In order to dynamically whitelist/dewhitelist OA registers on OA stream
>open/close, we need to keep track of nonpriv slots occupied by non-OA
>register whitelists.

Can we maintain the slot index within hwe, so that the caller does not 
need to keep track of it? I am assuming this will only be used in the 
probe path. For all other paths the *_sr registers are used directly 
which already have the registre<->slot association stored within them.

i.e.

hwe->slot;

Regards,
Umesh
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_reg_whitelist.c | 8 ++++++--
> 1 file changed, 6 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>index 6cc81f53fc601..1e788e2ee4014 100644
>--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>@@ -159,7 +159,7 @@ static const struct xe_rtp_entry_sr oa_whitelist[] = {
> 	},
> };
>
>-static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
>+static int whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
> {
> 	struct xe_reg_sr *sr = &hwe->reg_whitelist;
> 	struct xe_reg_sr_entry *entry;
>@@ -191,6 +191,8 @@ static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
>
> 		slot++;
> 	}
>+
>+	return slot;
> }
>
> /**
>@@ -203,11 +205,13 @@ static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
>  */
> void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe)
> {
>+	int nonpriv_slots;
>+
> 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
>
> 	xe_rtp_process_to_sr(&ctx, register_whitelist, ARRAY_SIZE(register_whitelist),
> 			     &hwe->reg_whitelist, false);
>-	whitelist_apply_to_hwe(hwe);
>+	nonpriv_slots = whitelist_apply_to_hwe(hwe);
>
> 	xe_rtp_process_to_sr(&ctx, oa_whitelist, ARRAY_SIZE(oa_whitelist),
> 			     &hwe->oa_whitelist, false);
>-- 
>2.54.0
>
