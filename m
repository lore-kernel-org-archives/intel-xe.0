Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76977C0218D
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 10:59:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A6610E1C7;
	Fri, 31 Jan 2025 10:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PYnDx9gM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED01510E1C7
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jan 2025 10:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738321151; x=1769857151;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=RUYYtSKJh8m2tI2O2lryEsrCkwNWrHZioh9Ly3hPuKM=;
 b=PYnDx9gMrkfBtejt7ehpcsLX1SdACaaliDnomOFVfMyjmif/phK5XLqh
 soxATcrf/fRxwjxJVqdGJ8+dZOou9andoTA50ap2SxWfHIxwfnltLinkE
 Ib/txL7Gr5HXUEmWSIFHvDoPFhME+Xs+mWDFm/O4nOOfownGmyyOavk5Z
 kHf1fmYHSZY8zhvNqlryAw8X7/rMb3+DwQ5uP6ZF2ZKskhzCGwsIBUA7P
 2NjS+HaZNi6+0VHD445Oc5ncroOKmjvQCxeUQ/l4PwUd/OOJh5zi2EHgn
 ip5cQQufVVQUzts4UYqQj7xFEUlOUe2yhJpOUFuT7ixQZs76wLBc365Sh A==;
X-CSE-ConnectionGUID: 3pkFKzgpRW6P136ys6j1tw==
X-CSE-MsgGUID: xjJ/YhjhSueDFpVkv7mhjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="64250578"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; d="scan'208";a="64250578"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 02:59:10 -0800
X-CSE-ConnectionGUID: fPS7+vWuTaqAxH3mVAN7Uw==
X-CSE-MsgGUID: KyFgO9A1QnC17/sZUBWCNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="140482801"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2025 02:59:10 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 31 Jan 2025 02:59:10 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 31 Jan 2025 02:59:10 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 31 Jan 2025 02:59:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qnVkFykacsiLo/3dRF6UTRKRV29kZpua8m9hiGST9ufjLl9NPZiBB1B4tRxehAV5FRhZPtdPclXN/5LUPis0vjFwDNWeNUzeqgC9ZBkvKQY1CMblcUBK7Mh2JxRkjuHWuJSdUQydQRTKDMpPaLDt2ellO/3IZCrsvHdBss5OuL6c8A9vY2hShxOCErDVtQxopH6ib5iE7ZJQc6XgQHiUxdekZhhxiBoFDl6IzBterd6fdLvqg7+OsXn6HZDcNUys1rV1HBWWhjA+FIpY0xKKOm+7Lusnx4wLaHiEskmdhXfQ498MJEWRl5vwsh3lLUnkcf0TRCtXXnkNCUP3tvCnYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ag6VYx2B7rFcokfdFiHkpobgksipjf/gfie0idSF+fQ=;
 b=GzqoHXDws6trb3WUPDoX8DN4sXEfX3DZ4VNiNt+MGqcBo20aSQUlAX8t1Kb2SxLIJTHM0UeEamq2JtgA+WIWwXxgGAV/sB/ShuvmGXrbATmUa+2+JDiE0zChaYIMpQfJ9sfet2KO4uTcvpKDOYMUebzstUK+34w8i3Du2yFj3DEDNBF1jfm4mHcQJFf/5oVmIdfriMidiBjOcKIQd5cC6zntmpI/S+ml63RohiZJw3ixq2qoR/V4HEYvH679B1ONtWuHX46cOgVjxVGfajEvWbpWO+Hb1IM8JcoZTrX3Sh70bW98kSB7vbNTLtueriFHiZH4Ul8/YCfk9ZvlTTnjyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CY5PR11MB6282.namprd11.prod.outlook.com (2603:10b6:930:22::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 10:59:07 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 10:59:07 +0000
Date: Fri, 31 Jan 2025 11:59:04 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v1 2/2] drm/xe: Move VRAM manager to struct xe_vram_region
Message-ID: <20250131105904.iv57qluurqenwqr3@intel.com>
References: <20250131100913.659082-1-piotr.piorkowski@intel.com>
 <20250131100913.659082-3-piotr.piorkowski@intel.com>
 <Z5yn9oxNNd0jeD1j@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5yn9oxNNd0jeD1j@intel.com>
X-ClientProxiedBy: DB9PR02CA0013.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::18) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CY5PR11MB6282:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f3cbddc-ec91-420d-4932-08dd41e648b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TzlEZU1KaFlUUXBTWTBFYm5JVnFxTlZJRDNLUk8xaGZ6RVJWS0V2Q0VlRFZD?=
 =?utf-8?B?a2IxaWFtNmgyZjdIeDJSc3JOVDdIdWJHNC91V3ZKb2dvTkJiOUFLS1prQmRO?=
 =?utf-8?B?SFM3dFdTbGdRVVA4T2hMNFNleGR2REFkY1lxMnBHa09FdWFGemdKODNTSWh2?=
 =?utf-8?B?MGkyM2dHTEdiYTU1NkRjd0FGekZmem9ZcGZDMGNqUnRuR3dNeDFSTFNwREty?=
 =?utf-8?B?QXd1S0sxenVySmRuWlFrYVBQM09Ic0Fhdy9MckZyQmdEWTdXV21ndlFnaEk5?=
 =?utf-8?B?QUZhRElUR0JvdWxEQ2h3QzFMMno2WEJoTnRkV1JxVXJMOXdFNXdabnQwdmpO?=
 =?utf-8?B?cmhrVlBFenJuVm5wOFUyZXpBbmw0UEtjbnYzbTJhYVA4Q09VZkNMZ3p1MTZM?=
 =?utf-8?B?Y1ZhaFk0clpFOStNQmFrUzVUS0g4WldKM3RQaFdleHRsbEREbE15aFBzL1Ns?=
 =?utf-8?B?M2F4aG9ocFBUZFVaQ0k5czErYUhxakU3eitFazB0V2VqWnhqTEdlaDZWRUN6?=
 =?utf-8?B?OU1nb3N4THljWFU4TDdsUEVzU2FJSVB6YXI2OU1iREc2SlVESlIxQzVtZlNo?=
 =?utf-8?B?bE1zUHFIeGpKVEhFallSS1JuUzBFY2RaVGlqMjIzeUJnQ2Z3SkFCZUYvdU05?=
 =?utf-8?B?bDI2N1M4RWx4WFh6YmM3SkVUS0xVZi93OVo4ZXU2aHhSS1VESlNFZk1sS3lk?=
 =?utf-8?B?d2Y0N3JSSUlydzNJejdyelpVUXlzcEIwN2xYWVVSaTQxQks4ZXZsZmtaSzZ4?=
 =?utf-8?B?cFIybVJRNHdCVUkwaDhqU1BpOWliblB1T2hZaXFoM1Zic2lHQlNWNTRyT2tp?=
 =?utf-8?B?MjNwNnF2WVFtbndKUjcxUE1vTzFMUjNlbzBPaDhBRzRCMW4yUmxMcHpoQWhl?=
 =?utf-8?B?RWI3YkdVZGJPUnRkdDg4bXRudTJMMEl0QUZEczlXN0NWMXJvQktBUlFrTEJo?=
 =?utf-8?B?eXhMWisxUHd1RmN3OVpyUUZNbldnREs2TDI3TEJXUlV1bkZPd0owVjlSRFpM?=
 =?utf-8?B?bHlZSTEzNU4yQmpNVmQrUFpkYUQzazNMSy9QMHZ5OVdTSGpoMEhWcGEwcDdy?=
 =?utf-8?B?N2RoY1dFZE9EbHhCclZERzlYdmp2NkhqN0J4WC93VWt1MytBTHhXVVRTV2ND?=
 =?utf-8?B?WEk2NDBGejBSemh4Zjh2TXBRZW14bWxmSUVsdGN0MmVlK055U0JmNXN6eFJt?=
 =?utf-8?B?MnhUVE9vUmY4UXRLcTJxV3V3clJGTU9kZGJqcGhYaCthNkFxTnh6c3pXVy9L?=
 =?utf-8?B?UzhXeVJCNnBwMk5iYzlEcXB0cGdLazhVWmNUaHFnVWtORDFjWWxJWEwyVmht?=
 =?utf-8?B?Vmpwc0xRemVTOENPTTBzWUNFSWFSU3c2Z1JweGpZZVBVY2h5Y0Jjdm1GT3F6?=
 =?utf-8?B?V3NSNk1iOHd3TjJKUS9lbVNtZzFycDZCQnpVbWt1NWsrZlJRQlI2MnkwT0Zt?=
 =?utf-8?B?ZzVwbVF2TW0wOEdCWWxZMVZ1czUxQXFlalNzWDJjc0dFM2NXd1NuUm16ekQ5?=
 =?utf-8?B?K25aWVBkelVOOGJqNGxFRGtLMzZSd2ovbUVDYjRHeGQybWxiL3F2a0pFU09S?=
 =?utf-8?B?clFzUDkzdURoZ0RhWFgvYjNmRmtxSXRPNSs5ckJNanFYdXM2MUQ5QklxVi9j?=
 =?utf-8?B?RU4xL2g0eVl2bTRUbDRPSkRaMmtLZDhnN2FaTUQrWDNvd243NGUrQ1dZeEhL?=
 =?utf-8?B?WU1PUGNHRU5HVzVDUE9pYms5VXhqSExUWCs3ZnBkNlk0QXN3d0diM2RudGpn?=
 =?utf-8?B?c2pUeG54MzFvNjdBTW1idVIyZ0VmZTZ1cWJmUG05SVZGSEtGWE15RDdCTXlu?=
 =?utf-8?B?Q1ZUQ2VHaVhGMCt2Uy85Qy9mZUlsN3ZDdXNQdlByU2NicVNSNHVjZ2h5K0dp?=
 =?utf-8?Q?NKvWO0eTD+tRN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clBsbmZQRjRlUERXeWxSTTJCdTVPV3ZkWTM2VjdFUUN4c0JuWnJjZWtXK29z?=
 =?utf-8?B?aEE0TEw3RmxHUUY5OHNOaGdmZ0s4NDdZS0MzYVVPOXVDWlR4VXhUUis2NE5K?=
 =?utf-8?B?enh0clZZcnFFVkQ0SHYzZ1RsZ3NRMGpaNEwxVjY3SGUyUUFpRk9OZ3pKdTFS?=
 =?utf-8?B?bTdsZVlXbG9tZkhXY3JIRXVXOW1QRzZsUXY1c3YwRFZaU2t1Z1Q1cmRFNUhm?=
 =?utf-8?B?MHVtYjFIdFd6TVFtY3BEZUYyU3ltVU10QVRuVXZCdFVvMEIySnR0aDhEYThH?=
 =?utf-8?B?MVdEUkJ4V3pMVWY2RXJSLzR5amoxdHdBbUZjOUZNS1d0QmlvWmNmbnB2LzQ4?=
 =?utf-8?B?UlpNMXNEcnI2bkpSWkthVmhIUmdJRWJUd3MvbUZEM1BmWnFaMjlqbFBzbFJM?=
 =?utf-8?B?a1NWNnFjcGdhQ2NDRzJxK0FSRnpBMlZrdnZpSkpOV0JzbXpCM2xvcDd2Z2No?=
 =?utf-8?B?dkxvbUhqT3NTYU9Udkw0bVVEajJJSTByZG1wdjM4VUc4dk9OcFpib1hFcW5R?=
 =?utf-8?B?YzN6czJsWWp5SzVoYW9pa3AwQWFIdWM1YUZhdHJ5ZGpGSHZKODhRbC9tRUYx?=
 =?utf-8?B?ZVh4c3JCaExyNlhvWWFCMitISUlKWGwvVGt1OEhrcjAxdzJpMi9pdDVsT2d3?=
 =?utf-8?B?WUxHeEVhcWI0dndUSUpXdVpXb1ZzRFExaDNrN2hmMjZMZlNWMi9nRkpNWVVy?=
 =?utf-8?B?eWROSXltem5sYWhYcWRTSjY5RVhVa0pSZU5hbjF6eVpVaVBxN01UQm9YZ3M0?=
 =?utf-8?B?UCtNdDdGamZkQm9ZVnN6T21HQUJmQ2RIMzUzYWpYRE1Nc0tWeFNEdVZjM2hZ?=
 =?utf-8?B?bnBsSnZzcXpDZTJnMkt5bHYzSGtyQ1lUQTAxYUE5S1dLYjZhTlNpdUhYcUt6?=
 =?utf-8?B?dnNuM3VOb1JZZzJjbDJHeDJVeVB2c1d4ZmVXSkdKSjVUNnJPNDBRdE55TitQ?=
 =?utf-8?B?a3ZnZjZXcC9hUkhZUjdNc09jSlZYdzM0cXRUQVRTMzRCalJtc05PNVhxY2xn?=
 =?utf-8?B?TTZ4V3kvanlneGpYZzFvM0J6Z1JYMFZQTWN0a1Z1MHlJYVVYSG16NjRLaGRx?=
 =?utf-8?B?WnJrZmwwSWhmVXRqYVZUYjlUOWVKS3ZIckNVSjFwcjlXcU4vdndHQ1FOc0FC?=
 =?utf-8?B?ZUtza3Q0d0ZFbGVORUQvdFhtVjd1elk4dVpZV1lXRjFoY1NEVW02ZFdwSkky?=
 =?utf-8?B?R1BIc1p3Vmw0clBZWFdva1FnMGhwLzFoRHp0Tlp5RDdjZmNQQkFRWm1QdktI?=
 =?utf-8?B?TkZaL2lBem9QREhrMEZqN3l2Vk9reE9ZN2xWNXZaM2pSUTRTeE1nZGg1NmRt?=
 =?utf-8?B?blA4NER5S1JaZFlaMmFjSmVtLzFxVzE2RldlM2NxTlZ1enFSRVh3UFFNRy8y?=
 =?utf-8?B?ekNMUnBoZ2UzWmNvZlUzc1h0RFdDNXRkN0VDaDNYek4vd0FhbUFhb3FqYUgr?=
 =?utf-8?B?UVczbWJmMEZ5Tkx6bHVhRDZCWTd3ZlR4eWlmR2ZHRytlMnluRmFSbzJjVGw1?=
 =?utf-8?B?UzZqQ1RyWS9xSnkyQkpWZ1F3YUF2SU0zUFFXclgxZnpQRUQ2VU00bmdjUEN1?=
 =?utf-8?B?MFd0NTcyTEVKdEtaSUMwaU43TC9EeisxUVpwQ2w0dGJxcTR4ejErTU1sbEtK?=
 =?utf-8?B?WkE4cjJkVDRhakVXZVJoeVJ6Si9MUThJd3ZiVXN5Szc0M0tISGNKV2o2UTJE?=
 =?utf-8?B?QTZHa3dja0laeFI2NnA0ZlIyR0YzZ1VlWTEzcktKNWdpYTdIOHpudVUvTEdN?=
 =?utf-8?B?V3MvNWZ2ckpJbjlSeEZqeDNvQncrSHFMUDZiSXJSWnBoQzR5S0FjUExXVHZ5?=
 =?utf-8?B?MDVDVTZhL3JGNWh6T3Z3YlovZUYrdWpaQjdGR3dJaXlrdmlkZVB3aEJiVkw5?=
 =?utf-8?B?b1JEZmpKRnF1NDJ5QlJ1UVgvd1Y4UWR3VEVSUGdvYVVYMExEcEJ4NVNaNU82?=
 =?utf-8?B?Qk9PVGh1TGltTjNZUEUrVG1TSHM4dnd3YWdRdDNSTFBuSW9IQ1JyNTZJQU9u?=
 =?utf-8?B?UWdCNXNmdHFmN3ozV2Q2L3BabDdsS0RUYXQrRnEwSDFISEQvekc3a1pqUVhi?=
 =?utf-8?B?TDlLMzNxM3laTXpEd1N4ZHludFBMcDVObmxoMzlqWWxNWkwwdnhNME5Wd29p?=
 =?utf-8?B?eDhDL2tRWVNJT2x2VjNtOE55TlFwUXB6ZTVFS3dkaUpUK1ZOdldOcWtZQnRW?=
 =?utf-8?B?ZHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f3cbddc-ec91-420d-4932-08dd41e648b6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 10:59:07.5979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4b/lx4LWsn2D+hgMIhc8Dwfw2vdLKN8YDFMVH4o8wHmm8aEAJKA10m96gZUALk6dm9EVC11URVWd3U45l9hhreZDe6OkrQAjCpt2lLDiItY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6282
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

Rodrigo Vivi <rodrigo.vivi@intel.com> wrote on pią [2025-sty-31 05:37:42 -0500]:
> On Fri, Jan 31, 2025 at 11:09:13AM +0100, Piórkowski, Piotr wrote:
> > From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > 
> > VRAM manager is related directly to struct xe_vram_region so it
> > should be inside this structure.
> > Let's move the VRAM to struct xe_vram_region.
> > 
> > Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device_types.h       | 5 ++---
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 2 +-
> >  drivers/gpu/drm/xe/xe_tile.c               | 6 +++---
> >  3 files changed, 6 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index c7c285c6a6c9..a4d998add4c3 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -104,6 +104,8 @@ struct xe_vram_region {
> >  	resource_size_t actual_physical_size;
> >  	/** @mapping: pointer to VRAM mappable space */
> >  	void __iomem *mapping;
> > +	/** @vram_mgr: VRAM TTM manager */
> > +	struct xe_ttm_vram_mgr *vram_mgr;
> >  };
> >  
> >  /**
> > @@ -198,9 +200,6 @@ struct xe_tile {
> >  		 */
> >  		struct xe_vram_region vram;
> >  
> > -		/** @mem.vram_mgr: VRAM TTM manager */
> > -		struct xe_ttm_vram_mgr *vram_mgr;
> > -
> >  		/** @mem.ggtt: Global graphics translation table */
> >  		struct xe_ggtt *ggtt;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > index b1d994d65589..98e443faabdc 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > @@ -1560,7 +1560,7 @@ static u64 pf_query_free_lmem(struct xe_gt *gt)
> >  {
> >  	struct xe_tile *tile = gt->tile;
> >  
> > -	return xe_ttm_vram_get_avail(&tile->mem.vram_mgr->manager);
> > +	return xe_ttm_vram_get_avail(&tile->mem.vram.vram_mgr->manager);
> 
> I like your series, but I didn't like how this ended here
> vram vram
> manager manager
> 
> Then I went to see if there was something we could do about the
> xe_ttm_vram_mgr itself, but then I noticed it has pointer to
> xe_vram_region inside it and I disliked this double pointer now.
> 
> So, if we really want to take this path we probably need a bigger
> refactor, or this can bring more confusion then help.

I know what you mean - it irritated me too...
For now, I suggested this solution, because it solved my other problems...
But I agree that it looks bad, and I will try maybe to do something about it.

Thanks!
> 
> >  }
> >  
> >  static u64 pf_query_max_lmem(struct xe_gt *gt)
> > diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> > index 2825553b568f..b13a0ec7c296 100644
> > --- a/drivers/gpu/drm/xe/xe_tile.c
> > +++ b/drivers/gpu/drm/xe/xe_tile.c
> > @@ -94,8 +94,8 @@ static int xe_tile_alloc(struct xe_tile *tile)
> >  		return -ENOMEM;
> >  	tile->mem.ggtt->tile = tile;
> >  
> > -	tile->mem.vram_mgr = drmm_kzalloc(drm, sizeof(*tile->mem.vram_mgr), GFP_KERNEL);
> > -	if (!tile->mem.vram_mgr)
> > +	tile->mem.vram.vram_mgr = drmm_kzalloc(drm, sizeof(*tile->mem.vram.vram_mgr), GFP_KERNEL);
> > +	if (!tile->mem.vram.vram_mgr)
> >  		return -ENOMEM;
> >  
> >  	return 0;
> > @@ -139,7 +139,7 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
> >  	int err;
> >  
> >  	if (tile->mem.vram.usable_size) {
> > -		err = xe_ttm_vram_mgr_init(tile, tile->mem.vram_mgr);
> > +		err = xe_ttm_vram_mgr_init(tile, tile->mem.vram.vram_mgr);
> >  		if (err)
> >  			return err;
> >  		xe->info.mem_region_mask |= BIT(tile->id) << 1;
> > -- 
> > 2.34.1
> > 

-- 
