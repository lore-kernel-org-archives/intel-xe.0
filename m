Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0122AC3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 19:59:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9576A10EAE6;
	Thu, 18 Jul 2024 19:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nTRa3kRd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B34310EAE6
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 19:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721332790; x=1752868790;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2JZ9VG19avPSBBBTDzXLbUwIcxoR6IeCowymuRebpU0=;
 b=nTRa3kRd3cRz3RRGHg+b9h5eRtsquyS/BRiNBsYrCEd8yJ6Fnr1pufDy
 PCJJXatqEODnA0Pqj5XlTQScLamarr/PovfKzR59durRikrqhfHdD58/1
 N+pn5Ea0LPFwDBwbzYT7APaE9aoxj/R7RxlQ51AgPcGRdpUUNiicUhRuF
 wmtnYUPyMKTuHYx9botAo1Uxk3Z4evd8eSyMyVHxyIMrcAz0EOwoGijzL
 pLtrNQ8A7L0YjLFLiGT0EZI35GOGrXgHRT07Y3aTbp9nJCriAfIsmjhsk
 DUkti/X/3LQuC4S5yvrZBh5wn4BYZMP5P/Ldfj+68TQmYfA5XWSkHPLJK A==;
X-CSE-ConnectionGUID: yqLPrYM9S+yJGb9xrY995w==
X-CSE-MsgGUID: AM+n2h0DTGOsVOUN8aFbbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="18880954"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="18880954"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 12:59:49 -0700
X-CSE-ConnectionGUID: HqFa8afvT7iHDpxmGGZqYQ==
X-CSE-MsgGUID: KSoMaCgMTQKIWCMWsnT01g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="50638529"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jul 2024 12:59:49 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 12:59:48 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 12:59:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 18 Jul 2024 12:59:47 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 18 Jul 2024 12:59:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H3RN2jZs5yzehXesIM8tzyPwuAVJ64GR4cFdlPAArHXmOpeq3d6zQbUTbbXLVXcTq6TWNuaEXF6DYdvUr2sShmssCu2xweVskjK1jpsVwGoOmlG+lkQ0BoaY6OHF66dsTbiFZYuT9xX0tb9ucyZrggpAaYYdijx8VmECBPWvKcHCrHK5uodFjqEN0G75hXlEjrPFwvlY/QJz+fRCwnRzwxEOEYFAb7vmeKUs3eK3WqKyFPBWihauZS48gQrLrX6LwH+k6sFjl/BNx8M8TMaikDSnsdQblj7fz8wDbhWbYU4gmoanzWkO3NGIjObPREeJNnstgm6t4tWXCyG9XCB6+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q5qPE2++ju46ZlJ5V7LH+m6MKZ/ieg+8Zz9f9CT3zJo=;
 b=deHB5XKPaNuqZxz67xNdG9ULi9M4zlDFJ8jLd0PHP+Wq75znFr9djE58Upxdh7b7avgUseZY3GQ9A5m3tkv8j8PjzrSuUiD5EZYt2VB/Lp4+CzkYyfz6emNNGm2ZQV2hFu/fzsYb7+prFEbnY7rY3m8E7Fuym8qFuSQDQhZUoIxwYJnTDPOOjlGg/1qS+8h4syewc1ar8SohPOzot5ubckdK1D5nqn9b+imwGle4wNkG04pxYRIMWFIbJ4gGondyh4ZvhyyKtAVr3HWQoic7MonnESjo7BcNf0bhrNmrCS1WPOfPFMva0PFW7KFxJtSF0s9quCBcoaS+UtvPO1Fufw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB7155.namprd11.prod.outlook.com (2603:10b6:a03:48d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Thu, 18 Jul
 2024 19:59:44 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Thu, 18 Jul 2024
 19:59:43 +0000
Date: Thu, 18 Jul 2024 14:59:39 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: =?utf-8?B?4pyTIENJLkJBVDogc3VjY2Vz?= =?utf-8?Q?s?= for Reapply
 "drm/xe/gsc: define GSC FW for LNL" (rev4)
Message-ID: <tgvrlya53pkoz7rwwe5j423mjgzyjez4wz5ue3wlwa2ridlrdh@f4vfxp5u2rp7>
References: <20240702001155.2163743-1-daniele.ceraolospurio@intel.com>
 <172132323141.287207.15398799487859281192@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <172132323141.287207.15398799487859281192@2413ebb6fbb6>
X-ClientProxiedBy: MW4PR03CA0156.namprd03.prod.outlook.com
 (2603:10b6:303:8d::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB7155:EE_
X-MS-Office365-Filtering-Correlation-Id: 6180619e-4879-408f-bdea-08dca7642ab3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EBO4s0ZutMddrJOklNDWIcFCuYWD6v4QPGZHYuEQAqwWOvVWJLgf4Ve58Cp9?=
 =?us-ascii?Q?TdtHDFUWft1XhsWtKhdqdyz8wRkZmwRL4SO9Q/65jL02zSoIKrn0suLI76zv?=
 =?us-ascii?Q?FA78umGjXjCJAM1qgtMlKT1qsgjgDdHfFsOnqPkG5GKP1RmxOmEOfSuP9XKf?=
 =?us-ascii?Q?zB2S99kp2D8zH5hOxa9k2SgIUk7a/WDpCbxrXoxwZ6uLfK4+qSrOFAeYyoBq?=
 =?us-ascii?Q?j/ig+S1Zaa3FgyBozZw7NfUmS6eZ6qV/oeNIo8KsBZkUQX40OcP4WEE93BMy?=
 =?us-ascii?Q?VsffkNJLaojQ4bxE/cvKOIWpqCDRLjXbuaUON49taDSKs6sQuj9RbenYZcy5?=
 =?us-ascii?Q?B6B29BkA4zbAr5wxgjFRkVutZhNF5iSbhFAEhgvllny4FqnM4fSZZzNl6Fqe?=
 =?us-ascii?Q?dTKNqL+LOo3HM4ILM+d1sgfS6G8q87u1C4w7zXs6BXSyy2jn+e0x0ZspaxNo?=
 =?us-ascii?Q?K9nHbAmYn1owF3qEF0G3Zx/ukd070eKByJPuK7lZtAhqSiNIUJZjcw4OT5Zm?=
 =?us-ascii?Q?/FmGe34s2ffY1busmIHwA6QVf7t1NY0+yUpG7waBC/zKj3MzDJ7TyxQDbwQS?=
 =?us-ascii?Q?nIshvhvNOj/EvWzji/ptE48AuiveakCK/tUsMd3zbq7zbprwKWEDGlSiwiLv?=
 =?us-ascii?Q?TxMx4L4v77DtOvllkg/n64khwmlwrnWPVww9CBrBUY9/K+b8OVH+XjPo5LAr?=
 =?us-ascii?Q?nunxojUDc4a1UDHQ1gkJ+Ag5Xi6XciwW1ucH+hT2grJuzWleUKU/Tn5/E1S2?=
 =?us-ascii?Q?XhfScPETWc2SzjETWz3FZ1w/l7FFsAYp64QTOQ9n73WjCJrwZ0snmeieHi9u?=
 =?us-ascii?Q?D7JCmrr5tEaQ7UoZ85GFryekkaNHqItiBWYKA3xd7+BbGh4RPqmL0nkq1WWz?=
 =?us-ascii?Q?RG+v688LCPS8+qEzLgNoiHk0e2+KDJST7hMJz/FuyLRNrqhw5Rj5I65XiUS6?=
 =?us-ascii?Q?QRzn6dw8ohg95+y3zYNQmj/MHwMPGbIGsU+Ek0AI5OJP0yRw+6HOgOUWJmhN?=
 =?us-ascii?Q?eem4m8aXmaeeDHV596CROxwUTiobUnVfBQolWtH+qAPzoT9N4zN4vIBwdt6Z?=
 =?us-ascii?Q?gaBpphLJxrUz+wtOIS7+5j5Aeyiah7Gf1PsYWi275EWCkpmS7P+TIllW1zHh?=
 =?us-ascii?Q?E5pGoXcdG1wltAw6HDKOfMgJoLFQWA+Sw4urotMHbvHmwvRSIp9HFsAxM8Yh?=
 =?us-ascii?Q?Goy9oRXoJYXsT985imdvOcFcPNUqwqSdk6b/9mU9xHSxH0Hsi6XcsRUcwLtF?=
 =?us-ascii?Q?49W4EOGd1mlPE417Qt9+O9+cDJCWBwzmHR2Xw7bt1yKYaWpf0ukkF5/uBfF7?=
 =?us-ascii?Q?br4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6sVC1xc3QliMWkjJKvpG+eOW+7COMvM5phqZGUPe8GZgyEP2wXwa57FK8YQy?=
 =?us-ascii?Q?nzxW6MkbGVkd1mPH3LuE50eBb4wTe36D5kMwbPBFkkGCe8//KhvIeiDi8DgB?=
 =?us-ascii?Q?WRTsajsUdkQkZ4QpCI6YilqZCquhKxtal+SNXnezfX/kX2CAa0j6+Neq7f6a?=
 =?us-ascii?Q?kBqZdp72BPM5o5Mb+zsV/WVcLWwAAojXwWcxNHBrHrS8Y7DNO4aPuYHqJ9xy?=
 =?us-ascii?Q?28xgEZj4pFzwKLEPdz+dVV2yewUhcL8UHHKtroYXWk5OJ3Ve+6Yd1P2nDFSh?=
 =?us-ascii?Q?uxXniiz4MOlYOk7PnbYrT1sWb0gdLXvz4OBONFOQ3k1oIBx6c9kQfM9AUie4?=
 =?us-ascii?Q?/JRy16eWooa+jHkYGry0Pri9Yt3AdM/CKUNYbEGXVLVGkI9N7+4BWjAxXX/j?=
 =?us-ascii?Q?4Yvwl/DZoeeqHDSaQ16jyKZ5weZ50eibJlG6VxZLX3bWWu8ogvNhIrHl5rMZ?=
 =?us-ascii?Q?8e2qC0QwwVbC5D9mrznFGWlNAcrZR1keS4jwMhQgxihjkRax9+5Jm7WB3nkf?=
 =?us-ascii?Q?2GhQh3/GBnYs5zvfHeTXJ63Q63FYnOkVSA7WBQclSj4Q4481DcwQZ6MyDOK8?=
 =?us-ascii?Q?Zy+qF+wPf6Ry3POqGYm6CNCfZuotkp7AdGP6GTIjQ8Lh8AzRWVGwiFB1R9SB?=
 =?us-ascii?Q?8lF+drobFqc1+JX3cUEI0qvJ/JBYVp3igUFnm+w3gBOGaYWx9vdpL91k3UXA?=
 =?us-ascii?Q?unlrXuw4IEDnNWsD1OFvjgcizmMJPlRncLmBGrCv8ZkrmN5veFzwMr6mwD6e?=
 =?us-ascii?Q?etg8U4DXyFygcKduui7TSCHPIo7ZE48bos3fey0jX1435PBZ2F62elY/2fr7?=
 =?us-ascii?Q?d4vKMqr26ts7WQL/K58Kxah0TKiW1r2gTBLH0ViFzwly7RW/NfArcxxG1hFp?=
 =?us-ascii?Q?4u96wwjf6DUpQjZTJdFT68Imau0hMYnVOaSXvImEUjGsBA4nheET+3Fti8u/?=
 =?us-ascii?Q?1R1BvT0Qpu+Jf+5UNQ70iLicXheNIafYJERM40Yk0cqfxR2rLG5CoRrI2cGJ?=
 =?us-ascii?Q?deTkY92VJXSsgJQZOtwNyvSDHn2p7gthGjF5IRzpD+mtp73zeL544q6LMMFl?=
 =?us-ascii?Q?CKnRMOO1AW3BEcahobNG0y+e0txk2O5ew4R4/nFy0lAM5zL6WHCuQ1OZu9DN?=
 =?us-ascii?Q?rOI5tccDiPKdWVInkhD/GEOF+nJxtmmi3lJWNMWI74PvfrPOwwSKftStp5L9?=
 =?us-ascii?Q?mDer6AT5vGIlrz5f1+kFQY/sJDh3/z/R/MnCYKuq+QrtLF2uwL0O3XoNlg73?=
 =?us-ascii?Q?aL6Gp84G767AQ6afY1WDPCyY+S6LJI+gmqdZGwIHLrZXTeadJgJ3B9Zmm6+V?=
 =?us-ascii?Q?JInrqcGmTihJ3/ERCx8lBm/72QSqhy2kp5oCuu8tF46jRieTRuhmYd6XOYE/?=
 =?us-ascii?Q?a67O8y8zlFVv6azcHSfjMHM6MoeIeqSZbXr1OWL+qta4qevAhGMALZkoL9Tv?=
 =?us-ascii?Q?oQiYEFCsSsjKmYUUoRu0PZCYCXvkgjU3p/8zjCeCmKk/tO0ek4xWw4cT2vM6?=
 =?us-ascii?Q?Mmi0YvxKUJboCOKm2fI8nSKpexz3xLIoeopLTNoiWLT3iXI7PkVzC84UR2y6?=
 =?us-ascii?Q?HL66nCLOMzoZKaTh0RY9SemQYfC+G5QprmWT7E/+6EHfgcYdmB3idv6pgRDF?=
 =?us-ascii?Q?KA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6180619e-4879-408f-bdea-08dca7642ab3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 19:59:43.5675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RrNlFrgQD1HCcngthvsNwfxPBgc07/8jR+XUbSYdgJtv0x4iVRkpXQy3XctFpYyFj2GRVSRTc82fTVSBzjbvax27XfuqrSGOfWp0KoL/4qc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7155
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

On Thu, Jul 18, 2024 at 05:20:31PM GMT, Patchwork wrote:
>== Series Details ==
>
>Series: Reapply "drm/xe/gsc: define GSC FW for LNL" (rev4)
>URL   : https://patchwork.freedesktop.org/series/135623/
>State : success
>
>== Summary ==
>
>CI Bug Log - changes from xe-1626-943ad04000a54cc7fdb5347606d0ce6a93ea286d_BAT -> xe-pw-135623v4_BAT
>====================================================
>
>Summary
>-------
>
>  **SUCCESS**


yay!

Now it passes (also checked the BAT results to make sure).

I will remove the revert from the topic branch.

thanks
Lucas De Marchi
