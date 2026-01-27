Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDFC5D2FEDF
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 20:31:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89DA910E13A;
	Tue, 27 Jan 2026 20:31:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KfUV+bx9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3488810E13A
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 20:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769545868; x=1801081868;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XuZit5gEVZOpiTSju0roGN63G5HzeF8Y/yKDT/ROqbg=;
 b=KfUV+bx9GroSYht1qK9ydAM06FbddtupChTtYR2B1R3mPAtGHHeZIKKy
 xiR4ltywOuqGIhRTgioZYdEYoS9K4+wBFbeQ64p3RkdxYJ6Pb6nkKzx92
 fHyB7qGqI3jI/WjyieXCDlOo0Yb0Gz0KvaQGBjQqubamtvZzZA3a/t74r
 UYfayGEiTAEorkXbqjHjGDKxNziC6fXSQySjUlDdDbOzWyRFDHZLY6Mgo
 khDBWGQDOLLFL+iBooTyDCXTvFirIZhB3FHSbe6jPZYcINHf6PgC1MlPB
 81vBsPF07WQvD/fRhfQepMow+SaIULwj++WWgDVOjrpWc4emAHaKsu4S1 A==;
X-CSE-ConnectionGUID: QFC1qrqGRnu79ImX1ezxkg==
X-CSE-MsgGUID: IwFtiPDHQDqmxwj2dGicRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="74598797"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="74598797"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 12:31:07 -0800
X-CSE-ConnectionGUID: 2XLJjj+rSOuU3flb+T4V0w==
X-CSE-MsgGUID: tOYUFOyrSym8tCvQKvhy2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="231030227"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 12:31:06 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 12:31:06 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 12:31:06 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.32) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 12:31:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JvmbE3tCwBzEj8QTIE5UwPYitm+qWEAAPXQjPvOuwZ4DPUxqQqJ/ubvQPpBEXdjYBlsGHCtp8bl2vB7NCJ8tgpdS0pVwvfEyG5sdv8GW8N2RLJJwCQC8YVykg6sUkqxwKSq5+UIlCwUnKBqXd5U4rJOU6ZdnGj3pUnaheAgia6C01KwGu+vSnn/MUKwabWki4fbelEKlIy9MBkhxJOEo+7qanJqheGXr49t/Q2Br/IrXnsIdfV3kN9yhTw8OaojMmLctA57PnqH+qe//ikaauJdLF1pcLxfivoJ9XztbxGZG3EG2bLbGbP+TzYhHigZ/ESUk248ZHCnBoQLM1oGOGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Me2xWe2pxNf75/RKhpD5ycZjUycPQya1wec4+t2oqS0=;
 b=rPSURJX3/fq16wQEq/nPKbD05tu/c+kuHwBHHbbMte5g8kxIt9j2JIS71yhJi2Z2Hw3uHDm4UuNMJ0SqJnxmq1jeLKWRFAAZQH7jgXCGih4lLRtYZCqRSLh8YWFdNB7agaZUORtI+3BVC3ZBpmgTi5DTXMkwdWknZAq4lZGsheQF5uosB8o62bd+wTxKBi550URBtJa5xp0lAYO4vgM/LHOjXa/4rrfkR3p3ER68+9H0E22qMe/w5vKc7df4doH0uxwQDCJF0HO8fPrI5NqwHQ6oZXxN4iFlnDXb1mVia8n0d0n5HlrKHkG4YWbbFNXFYftZrS7S5VgaqNU5NNgeFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6605.namprd11.prod.outlook.com (2603:10b6:510:1b0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 20:31:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 20:31:02 +0000
Date: Tue, 27 Jan 2026 12:31:00 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Varun Gupta <varun.gupta@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.d.roper@intel.com>,
 <priyanka.dandamudi@intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: Add prefetch fault support for Xe3p
Message-ID: <aXkghJIl8V/3lh/d@lstrano-desk.jf.intel.com>
References: <20260127115713.869000-1-varun.gupta@intel.com>
 <20260127115713.869000-3-varun.gupta@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260127115713.869000-3-varun.gupta@intel.com>
X-ClientProxiedBy: MW4PR03CA0311.namprd03.prod.outlook.com
 (2603:10b6:303:dd::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6605:EE_
X-MS-Office365-Filtering-Correlation-Id: f4841544-235e-440d-5450-08de5de2fd35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MtrLEewwEcRrPUxIzmbwUG9yvT02gC7THHjdKSYuQbTCP/mbd4U/9MYyGIiY?=
 =?us-ascii?Q?IOpHAaVS6/mACc/iPKyeKSRl6ryb6p9/ENflhB7AkfQhbW/7ZWprYXyoFjiz?=
 =?us-ascii?Q?LBG2sjHB6Izy7rh5foVNdr5pBmmsH5P18G0eihDrQ4cWq4Kg0Y8fpcUEdY5N?=
 =?us-ascii?Q?oW4TJNHwvadww6vZX09Yz3IqM//tkc6dbMxqUFig8fYGHLsmEGBCyCDIvmrW?=
 =?us-ascii?Q?uX+jdgyRQkb2OXOvzrMwEEbgU5Rblg1pLgHbOCvICgy0ZKIwodeSwrt8/M67?=
 =?us-ascii?Q?1Y0Kj6U3Oa3jGWQAHWN/b+fLkWk1Y3pETKf9yKgNn3k2p/iSPZSgAymbf2o2?=
 =?us-ascii?Q?Ig3gSqU9LtaYv8IdaN7D+acfUABALUztBjeskYUoJIZbFj2TeSYQJVy7fNKb?=
 =?us-ascii?Q?IBFfnal1eKcq8J/6Lj+yqD9Jeb5eL2RxCifPK3NADoOhpRyw1L0JIRHSUnGg?=
 =?us-ascii?Q?nvnhIMnH/DlcNhb5DfSsUL///WPTR6sCXUoyOhODtbb6hrJljMIDaiiIdns2?=
 =?us-ascii?Q?tceqmk3NIqqI1LsT93L0bJ3Zr35YgP2jAgjH/EuDrG3THtsuYPAogRG5LF7r?=
 =?us-ascii?Q?SDtOqHqneIyzEPH8OOP8w9LK1hZO1vAOpv9wiftmPHfN5rD21zB4RN5EcXss?=
 =?us-ascii?Q?r/cgrnr8Q8aA9vshY+kcQ1LCb2pAC/LskJ60sWcyRUKojRyysaSLvghdS3fV?=
 =?us-ascii?Q?FC0oiiOsNDhi1l9vysiqrCKzPVq2WSmtpAV9gTDDIo6Z8mHNjkGVU2JNZMZ2?=
 =?us-ascii?Q?OZxw0NBjDhZ6DH+yQhOCDL+2iEEjqAIViv8lPYQ+eLijPYYypZQvgL+FVzCg?=
 =?us-ascii?Q?pftHO1QOIdG5ypIgFLPBikxOXRqUPy8KwbtVYvp0G1jmBBXs/ywUvEgyfsNd?=
 =?us-ascii?Q?zvVX+9hzsgbAnosA3nqZh2VQ6/yPqiv1vNozgFx+avL4G1y2hm8yRONqj4YJ?=
 =?us-ascii?Q?XvlVzHMi7BzHpAtRFeIHyZgWj4Xr8jtddPY0p6uv4SyQqJ7igJnRUIjEg0U6?=
 =?us-ascii?Q?xysZm5ulJvDdkDYFoisbj/lJXGynoi08DWQ//4ZvLOGvt0VwiRFHGVN+rvVg?=
 =?us-ascii?Q?z045rhMDJTgI0JzNUGGohRvaBYTUirk0xqphfaRHzC3MpOZrMkQrrpWa5taP?=
 =?us-ascii?Q?eigyZtxGRWkYIOJ+bO3QieRKTWs4EHvUNkPb7SmsZz+xUlRwDNxJPIG5sjWf?=
 =?us-ascii?Q?WOvUtNx2uU9l7Al/O3AEJwDRPMkQFgIflMWZy9JWauHjg8oGiABLPEr/qy43?=
 =?us-ascii?Q?oPlTXfApUl2KEyj47nMhfBRmW/7CLkyDdgSeISZoLRzvNIKyNFxvJhrdd6m6?=
 =?us-ascii?Q?8CKwo8wIYNAA/V9Dyspw+2qL3t+ktK1jFPJwVj7paQlyhrzVmZHusIVKPT8i?=
 =?us-ascii?Q?bsh+GYq6g8KJFgg6emB+qdY/W4O0QiZgivcilP8zrxcfb/2CzD2NTJAg/TzI?=
 =?us-ascii?Q?6yAheupX66IXCSu5GQk1wHRXnKXzkjT/pHJQPXsvIfQsgeYC4jizR6BIGm7w?=
 =?us-ascii?Q?CaGw4GqGxv5JXOGm+XEsgZMfCaNEPimNubLXeoVQVl2m8eFst6uehic3ZYn2?=
 =?us-ascii?Q?XrxqAVP/G2jW9XLE8X4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cIiHp2exDiqWScD10tRCZQ0KyxW/PX8YqTcftis7SExk1qcJUqbhS6I+6ZaU?=
 =?us-ascii?Q?ydjhaV5IvOvOQHhCovg11p01wtiOThbKZKjIkocXmhzNZxjqw6imvAZ3EOpx?=
 =?us-ascii?Q?0RYdYO0I69Mw+IBLOZ9yy1/TtMjEBS8Pr9DNeljEciqVjPpn5CUXZCXUyhAi?=
 =?us-ascii?Q?sjtHA/jijJuJwLFib4gVAnvDZO8xnUUki7vuTwGdTmeTbQU714Q2X5J/LeWU?=
 =?us-ascii?Q?5DPw9CYGWrmsoLCCRDUl+wTwoh5YZYOl71KP2lFmUnjp3ke5qcshIe6vaX7K?=
 =?us-ascii?Q?C5zEwSV3C1ZALFgCPqbWh2Sl8vKN/HwLn0mrsqeMTro1VIA2pIXUVSdiVz9T?=
 =?us-ascii?Q?AZBiheYxVB/msazSNv+OVe6iqOUblc+iHJcI9bCIBXEVCfCOZxZre5IPOrit?=
 =?us-ascii?Q?KbyhuaM4u8bfmgIg7TAcSVjkAVzdQKRVwTXwMdVweXbnHgumLSAlUD2EKM2B?=
 =?us-ascii?Q?qG3tQbhQjK4b/7Uj84x6U0j74Gs+rXMUELuUdpv0zhXw35QbC3p+fe0dtuh3?=
 =?us-ascii?Q?qtx+OmO2m2jLFWhJGe5fBMrx5kNfjO4edL9UhtUXxSra2nTkx3IwAE0vCh7b?=
 =?us-ascii?Q?3FnEC8HqLe/D3n1sEoZCCn2A3dykupm/s70PSpNF2zs8HPQ3JRd5KsTTcvbe?=
 =?us-ascii?Q?/aDHWJgv4IeqDYMy5QNnf1idc2uLKsxdfrVMKivS3uHM/hPV5wVYwyN54HEQ?=
 =?us-ascii?Q?4RshiLm+E59RzOozzRZYeGwJ1lWH7dIU/oAr1xmaD9ZHlYAvZQj/+Gltoy+X?=
 =?us-ascii?Q?ffA5eXavYJEQefSFZC2c7KgtkBhflJNm4ZGrU1z2X2ZAvDZkPlCk7ky0+Ova?=
 =?us-ascii?Q?GrR+s0rAL5yrdntHNLCxeQXongD5mnyYKCbpyqPw2SZ6ezSSkQ6UljAbETT9?=
 =?us-ascii?Q?SgwZcake51463o2Ggyl+kQ0OtlrZpl+y9SxpG6w0+mmwnRs6F2By07mySilq?=
 =?us-ascii?Q?ZJKtGsOHdEyPah/ODRhuhncX9U5ynC3PJWSmhWyxz5iRy5BpFw+L9Z5+Yxk9?=
 =?us-ascii?Q?BT/l1ztBs0fI0IOhyBMnSL4VillRZkIESaryw+6GCqT9PczcVusrBkhvlNyR?=
 =?us-ascii?Q?LJvf9EWGn7zIzWezmN3cwr2YJLNmB5PoxbaCxlaEMv1qLby0CwIPT9QwyB4/?=
 =?us-ascii?Q?noHaJo7yOWhsKCCyQgJfij/FWE8HoZ1Eg+G5EEQDcLDYm20r3VHUjH3xErO0?=
 =?us-ascii?Q?vpijdt0u0/bIUnE3tyIhl5VP8/6q4wA0PLRCUpcUTuQ21+A0bupfLDoHg96H?=
 =?us-ascii?Q?ldd+qGN3olgPEVZtZxsxv4gsWvPbzP601CS8Jyp4IDpGRafv3WKDuOOEJkdD?=
 =?us-ascii?Q?wDy5z02bfZBFtPYKfogh1T/wqH9nFgRP8SOtK8JkpiPEzLTSeGQ4x1dGUmwg?=
 =?us-ascii?Q?K9XQ6suvP8vdX6CSfVe/pdmRZAFXQCvtGCmYlEHOZcAPMb+0BIlnsc3VjwH7?=
 =?us-ascii?Q?s0aktdAnAVO984vb+HppXrtzOkHnJJaQQfxymxEDlJGsVGfKL8fHdt0YLY8L?=
 =?us-ascii?Q?aIBctWWzAQyins55YGYGn9uZo/PCt301IF6hB08m0PuG5akbtX4uuFS/nQH6?=
 =?us-ascii?Q?bhbwa5cg1V40wOZFc9RHUSNWEdXjEGq/urrxfqd6oMLbJ/Vvx6xUmHRuq5Ro?=
 =?us-ascii?Q?6tvL87UfShFqlGeNb2u6Z5MxLDOUQ1RxzITlvB/K2Vr45Ju34z3SKU0ePZGF?=
 =?us-ascii?Q?cMIcgEoJ21I+1r6qVKGYCRayD+tUkRZVKGnZds0KFr8fzbyxH88t94UI/HCE?=
 =?us-ascii?Q?ybv9XIDYSP4qYsP+xT7y6PY6Jslb8zk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4841544-235e-440d-5450-08de5de2fd35
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 20:31:02.7022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bIbYZ+MG5lm5zzXd15uNE5mOjPrguNtleQS4yX1E696ZbsOhLAehHEX7dFce6ojk6cWzXrJofw0pnRv1moheoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6605
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

On Tue, Jan 27, 2026 at 05:27:13PM +0530, Varun Gupta wrote:
> Xe3p prefetches memory ranges and it notifies software via an additional
> bit in the page fault descriptor that the fault was caused by prefetch.
> The prefetch bit should only be in the reply if the page fault handling
> was not successful, which allows the HW to avoid generating a CAT error
> for prefetch faults.
> 
> Based on original patches by Brian Welty <brian.welty@intel.com> and
> Priyanka Dandamudi <priyanka.dandamudi@intel.com>.
> 
> v2: Changed comment wording from "repairs" to "handling" for clarity
>     (Matt Roper)
> 
> Bspec: 59311
> Originally-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_stats.c        |  1 +
>  drivers/gpu/drm/xe/xe_gt_stats_types.h  |  1 +
>  drivers/gpu/drm/xe/xe_guc_fwif.h        |  5 +++--
>  drivers/gpu/drm/xe/xe_guc_pagefault.c   |  2 ++
>  drivers/gpu/drm/xe/xe_pagefault.c       | 12 ++++++++++++
>  drivers/gpu/drm/xe/xe_pagefault_types.h |  8 +++++++-
>  6 files changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> index fb2904bd0abd..340d0831b752 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> @@ -35,6 +35,7 @@ static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
>  	DEF_STAT_STR(SVM_TLB_INVAL_US, "svm_tlb_inval_us"),
>  	DEF_STAT_STR(VMA_PAGEFAULT_COUNT, "vma_pagefault_count"),
>  	DEF_STAT_STR(VMA_PAGEFAULT_KB, "vma_pagefault_kb"),
> +	DEF_STAT_STR(PREFETCH_PAGEFAULT_COUNT, "prefetch_pagefault_count"),

I'd break the stats change into a different patch.

>  	DEF_STAT_STR(SVM_4K_PAGEFAULT_COUNT, "svm_4K_pagefault_count"),
>  	DEF_STAT_STR(SVM_64K_PAGEFAULT_COUNT, "svm_64K_pagefault_count"),
>  	DEF_STAT_STR(SVM_2M_PAGEFAULT_COUNT, "svm_2M_pagefault_count"),
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> index b92d013091d5..82e578726088 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> @@ -13,6 +13,7 @@ enum xe_gt_stats_id {
>  	XE_GT_STATS_ID_SVM_TLB_INVAL_US,
>  	XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT,
>  	XE_GT_STATS_ID_VMA_PAGEFAULT_KB,
> +	XE_GT_STATS_ID_PREFETCH_PAGEFAULT_COUNT,
>  	XE_GT_STATS_ID_SVM_4K_PAGEFAULT_COUNT,
>  	XE_GT_STATS_ID_SVM_64K_PAGEFAULT_COUNT,
>  	XE_GT_STATS_ID_SVM_2M_PAGEFAULT_COUNT,
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index a33ea288b907..b1b7cea26212 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -261,7 +261,8 @@ struct xe_guc_pagefault_desc {
>  #define PFD_ACCESS_TYPE		GENMASK(1, 0)
>  #define PFD_FAULT_TYPE		GENMASK(3, 2)
>  #define PFD_VFID		GENMASK(9, 4)
> -#define PFD_RSVD_1		GENMASK(11, 10)
> +#define PFD_RSVD_1		BIT(10)
> +#define XE3P_PFD_PREFETCH	BIT(11)

s/XE3P_PFD_PREFETCH/PFD_PREFETCH

Then...

#define PFD_PREFETCH	BIT(11)	/* Only valid on XE3P+, reserved on prior platforms */

>  #define PFD_VIRTUAL_ADDR_LO	GENMASK(31, 12)
>  #define PFD_VIRTUAL_ADDR_LO_SHIFT 12
>  
> @@ -281,7 +282,7 @@ struct xe_guc_pagefault_reply {
>  
>  	u32 dw1;
>  #define PFR_VFID		GENMASK(5, 0)
> -#define PFR_RSVD_1		BIT(6)
> +#define XE3P_PFR_PREFETCH	BIT(6)

s/XE3P_PFR_PREFETCH/PFR_PREFETCH

>  #define PFR_ENG_INSTANCE	GENMASK(12, 7)
>  #define PFR_ENG_CLASS		GENMASK(15, 13)
>  #define PFR_PDATA		GENMASK(31, 16)
> diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> index 719a18187a31..b6c12e563067 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> @@ -27,6 +27,7 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
>  		FIELD_PREP(PFR_ASID, pf->consumer.asid),
>  
>  		FIELD_PREP(PFR_VFID, vfid) |
> +		FIELD_PREP(XE3P_PFR_PREFETCH, pf->consumer.prefetch) |
>  		FIELD_PREP(PFR_ENG_INSTANCE, engine_instance) |
>  		FIELD_PREP(PFR_ENG_CLASS, engine_class) |
>  		FIELD_PREP(PFR_PDATA, pdata),
> @@ -77,6 +78,7 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	pf.consumer.asid = FIELD_GET(PFD_ASID, msg[1]);
>  	pf.consumer.access_type = FIELD_GET(PFD_ACCESS_TYPE, msg[2]);
>  	pf.consumer.fault_type = FIELD_GET(PFD_FAULT_TYPE, msg[2]);
> +	pf.consumer.prefetch = FIELD_GET(XE3P_PFD_PREFETCH, msg[2]);
>  	if (FIELD_GET(XE2_PFD_TRVA_FAULT, msg[0]))
>  		pf.consumer.fault_level = XE_PAGEFAULT_LEVEL_NACK;
>  	else
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index 34dac4280b9d..97d93ed616f9 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -223,6 +223,12 @@ static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
>  
>  static void xe_pagefault_error_account(struct xe_pagefault *pf, int err)
>  {
> +	/* Don't spam log for prefetch accesses, just add to stats */
> +	if (pf->consumer.prefetch) {
> +		xe_gt_stats_incr(pf->gt, XE_GT_STATS_ID_PREFETCH_PAGEFAULT_COUNT, 1);
> +		return;
> +	}

I don't get why this counter is in this increment here.

I do get why this function aborts though - no need print a fault which
was triggered by a prefetch. So I'd move this to the call site (e.g.,
supress error messages there) plus I'd rename PREFETCH_PAGEFAULT_COUNT
to something more meaningful - maybe INVALID_PREFETCH_PAGEFAULT_COUNT?

Matt

> +
>  	xe_gt_info(pf->gt, "\n\tASID: %d\n"
>  		   "\tFaulted Address: 0x%08x%08x\n"
>  		   "\tFaultType: %d\n"
> @@ -262,6 +268,12 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>  			xe_pagefault_error_account(&pf, err);
>  			xe_gt_info(pf.gt, "Fault response: Unsuccessful %pe\n",
>  				   ERR_PTR(err));
> +		} else {
> +			/*
> +			 * Clear prefetch bit - only needed to suppress CAT errors
> +			 * on unsuccessful handling.
> +			 */
> +			pf.consumer.prefetch = 0;
>  		}
>  
>  		pf.producer.ops->ack_fault(&pf, err);
> diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
> index d3b516407d60..4837f2b40079 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
> +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> @@ -84,8 +84,14 @@ struct xe_pagefault {
>  		u8 engine_class;
>  		/** @consumer.engine_instance: engine instance */
>  		u8 engine_instance;
> +		/**
> +		 * @consumer.prefetch: fault is caused by HW prefetch.
> +		 * Echo in response to suppress CAT errors on 
> +		 * unsuccessful handling.
> +		 */
> +		u8 prefetch;
>  		/** consumer.reserved: reserved bits for future expansion */
> -		u8 reserved[7];
> +		u8 reserved[6];
>  	} consumer;
>  	/**
>  	 * @producer: State for the producer (i.e., HW/FW interface). Populated
> -- 
> 2.43.0
> 
