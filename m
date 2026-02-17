Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 328EFE9A03B
	for <intel-xe@archiver.kernel.org>; Tue, 17 Feb 2026 21:48:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E02C810E276;
	Tue, 17 Feb 2026 21:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R/b+YRBv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C657410E276
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Feb 2026 21:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771364921; x=1802900921;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6zGcpN3G8u3T93/B1N4SPtlBu/S1NHQQnbVBbAYjCEg=;
 b=R/b+YRBvS3Ss5CiORFPD2pdGLJb3utLTY8QlIccB4Dn67VdoJSFLU0MR
 AS6h8N1I5A6QSLGo7h9P5MtAr5x0Cfk8Da/brAiur+edh7D1Pu976/QUz
 KB1Nh3yGJF+TzXSEoBuprLWrTx1uMOoe3I0NSYNCTw6Xu3bCR5p0Vb8a6
 UjH5LnsNNcf50hYNndFv7EBWAWCa1gpuxtbH9TUWErpaC5RjXvq/1vjS0
 MAo5I56LkKFNGZL1vTEiUPbAiL88uKiov/QrrSEfih+pGiqW1EkWT0ezw
 RspqxGF9OaMHX+12DIWp+1Fcnw3uP8ykuiPDLVIj1TondDgRabFO1dRqR A==;
X-CSE-ConnectionGUID: pcV+/jtcTPm5yspU8+fH3Q==
X-CSE-MsgGUID: WrWC2k+HS4e50oAtjjRnFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="83546734"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="83546734"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 13:47:59 -0800
X-CSE-ConnectionGUID: JO1A1TvfRIGB1X21/Qqpow==
X-CSE-MsgGUID: WONzLKW3RZGZDT0rvNko4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="219000774"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 13:47:57 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 13:47:56 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 17 Feb 2026 13:47:56 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.29) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 13:47:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LqSMh72z+qlT+OY4drXcQZ7DPyT7xi1D2TULZQpMWhjWyNIn3oU4lEnFGpnMA0hb2BbXxHzL6GzEHB+3j5xbfEphvbZ5w7bpF/iOwnPSEgJ0KWNzRDttWWroz7ZGJovB6gxbyeNoX3qq3VsgIIm5UwNiQIzO+CkYZFIX0kDQ7J6VBr+yHSLoWjnUxMoVMqK1kb+Dp88M15NI7in07NRGW3hNC67dN5QAC9uDYCCMXs+kpiY3dORa7pR0PNAgX3eZpUkOAkhyCbJtrstqkFaMQq++EsrC+9M1R087DElPow+8eteV198Aq6dxmOFfn5BnO+8qBWP6HjJ92KsSdxL1Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VPluQRKxLn9oMANhTbValwtGf1S4mfaTuZjmzplC6fw=;
 b=Q3JtZugrD06VCTgY7ODxjm1UzbP3H6tHZZXQRkTe6hVDCOXM1pZIiBYQD6sUD6a+01bRTRHtifIhhX///EuryfC0QfEhaFThAwVl+FOzWNxjHAHf9sSHOmUYpTMZg1fuaXioT1us6NVHSOkiEZP6rRcJD5YfDV+lTdnQf9VUAjl8qljFKm0jrx6kEgaesXZRP9ZzySwGeWKx7UTempNIyqEGgLhzzMzH4jYahozTPT8MZv9mpAmi8B8nhqTrpgcVHnf7kPcrZD0KFQUeMotWNL092nJZc4XJL3yp7jFktfcaiKPFk3hdjrSLPFI1ZN9ChpwCTesYnQCJoYOfgQ9i6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB8788.namprd11.prod.outlook.com (2603:10b6:208:597::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 21:47:54 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 21:47:53 +0000
Date: Tue, 17 Feb 2026 13:47:51 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <rodrigo.vivi@intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH v1 1/3] drm/xe/cri: Setup hardware error routing
Message-ID: <20260217214751.GE52346@mdroper-desk1.amr.corp.intel.com>
References: <20260217114656.2546878-1-raag.jadav@intel.com>
 <20260217114656.2546878-2-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260217114656.2546878-2-raag.jadav@intel.com>
X-ClientProxiedBy: BY3PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:a03:254::18) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB8788:EE_
X-MS-Office365-Filtering-Correlation-Id: 6680e394-c3b2-4192-272d-08de6e6e344f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iMEeVjk5xi9PNBxGmfAHLTwxiylBDlySBrUUzogQHz6+nDOThXNh/wnSl08y?=
 =?us-ascii?Q?ALqZQRIt3DBuOdk3RulkjJD3k43KgrCJM2R2RnfqYaxdJEaP95a5/1iXP7GH?=
 =?us-ascii?Q?BnRT/AjvEOXYA3gYumBpQAZsiPuGBcD9RJYPz9Ud7k51MdXjVpYWTls1HjzG?=
 =?us-ascii?Q?pkpGytwR26kLpKepMpF36ty9hERB1l7KZPflXEO6J2xSw+gIc+e/KQF2Wnhw?=
 =?us-ascii?Q?gg4THyagEsggczAWAcDS444BPzkafBagz3hSj08fKCl63VDSMTDRaRIWVJ9b?=
 =?us-ascii?Q?all0bQGeafWn+5vqIsDEgHlf7410kKunD1oDv15LygPFpy0T+Zd8YjzxM3A5?=
 =?us-ascii?Q?/II5LI+xYmOQJGhltZ3j7BzpIyndtMhD2HYJFI2x1OR7XYTMcusjpBYL53YR?=
 =?us-ascii?Q?gZV067RSdODkf36Dd3xeiWA0eilSlHvpgJrlLOqtmU+h6dWYDCAHbRqxymRJ?=
 =?us-ascii?Q?vCXi3563suA/mXZSKrydcHknnpITfcdxG2WRPzyLiQ3bsEQh8H47bpyB+YmF?=
 =?us-ascii?Q?7uZ0LFoQZxyTwVYZ0fmkaWyOkTYvHjVhNHGPXdA5NvFOAulZqEnDTVNJ0HC0?=
 =?us-ascii?Q?nxlG3tReuDH3e7aBtm/CVx9ADJ0JG4Zyy6sWy+1T3HCqO23UQU7YpNFXqvRD?=
 =?us-ascii?Q?7F8oVwsNrPvslCwawqn+bo7viAV4O9sOdZ8+rOOJB/hE7XB9/IxPUlGLkmAQ?=
 =?us-ascii?Q?SmLzxm7tuyo796MZEod1tGNPeHydnn1tz8u3EpA5LpwvIKFl6CnzzSPCZUTW?=
 =?us-ascii?Q?Y44bSOY9HwPW2CqVuqCXyL1uZ7lkHg27L/1MYjPj/mDqB3WtANtWn8JGeDbG?=
 =?us-ascii?Q?1OP741Y0Pm5gbbQwJLDDgrs51YGbeWJY0P721YU6c7DAEdjd778u2f969Pvn?=
 =?us-ascii?Q?LEbogiXMqU39uEdSpGmn8vU+F+G9MlJco+Gc/ibbrPYBD5Dm/LGV+0fGeNk1?=
 =?us-ascii?Q?Ugi9GxbsAMspErEd6zuT3nwADDI4QocilYlgBVTk32F4u1RTEUE2NfwlJ0P2?=
 =?us-ascii?Q?ymVCSUgLdCPBqyI3bpRZHiAewTS4zbA22lzvWRiaKyXwNKDtqSgGflkB98dv?=
 =?us-ascii?Q?l4fC5uFcLUIcgs8DNlZ5AN+LuqpRp/vUj+2zDiLb0MsPJL+Gn9w3FLopRBgL?=
 =?us-ascii?Q?/GViqSl9g0SIkIr/XEEz9awhig/RiCgdgZM+ZRuuJy+YLdqViTPaaLiJZWp8?=
 =?us-ascii?Q?OTz8Km1f7oIr+6OBqVxMh7hKx2mjMEe9d76aOgp9H3hVrEpLjTFuIAsKTRWc?=
 =?us-ascii?Q?1YeGgSBEgMU0BkQ/+2pO1XadX6b2bCxrzV4f09SMEIbFXISbwAKq7AMPYugs?=
 =?us-ascii?Q?23fHOTeuZfUcCaWvJg00JBr/vUnbCJn1EG1+iU2mzbgWKAagcVK/ggM7k4w0?=
 =?us-ascii?Q?a4UDJVu7cBkVlopbhfcE7w434HoH8IJrqnqLP3FHyV/I3TXNjs0WWSWvQ8b2?=
 =?us-ascii?Q?4OT9rtU1fHyJSvnLBVMm9rNwJuHDxwNi1lDVutFRnJitL+mRBlfdZI/OQvZC?=
 =?us-ascii?Q?nx0UZ3S5CwEw8Zbhn0lO0ekBaJ1dgQ9ZZpj6yBZcoyIpt/hqZ6naJudeU3LB?=
 =?us-ascii?Q?0+eDw9sTvhnE8IkTFNI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hK0Us7TD+VyT3ZSLCMpQO40ZlpTP5GwWrPv8o7CbMHLWSd2wpJvlU/Ec0w5i?=
 =?us-ascii?Q?I/WbwhQ5yQUkaiDQz9vWXTa+ddKCuaxXf174APQvXkcp2irU8pLbUb1XzKJt?=
 =?us-ascii?Q?o64aozOqwd7giwUWd/p0iZrut2ICoZ7k7cWGVTriwsMF+jvCWp8AtnTbGPEV?=
 =?us-ascii?Q?beylCe3f8UUR0wJE6/kut/3Dgc1hJFp6cZoUca8Q1WAQEfcukh1gYvW+iTt6?=
 =?us-ascii?Q?4faqrN2NEpXwoKU0nP0bRsCtbCzpuJsvvIvmPHibr8O+feqTXh/f58olN3gC?=
 =?us-ascii?Q?2neGqNMITecF9nrz6nO/Qub/LyPaEXAumH0/Ky5QT2/gUWqnh8q7WhhJLpH9?=
 =?us-ascii?Q?OdAtTkuaHfEvk7pY8IBqLcL6f3DElil9SVNWdNupu2iNlrdQim4WwgVjadw6?=
 =?us-ascii?Q?LkXs7RLyB1iig76Vz4CAEhcCuwaUkqYseYjV3teZ/HhX6SbPXZKhmevN/CTk?=
 =?us-ascii?Q?6RLrbjQdYlrk6JVm/UuE25K/1TM750tadB6rga/e3AdiZVpFywWj01GDwODt?=
 =?us-ascii?Q?O17ZtQObilKFyL1zfno0qfitDWlWphKUAKTabjr7WmPDFGulnxcmAssn+pG1?=
 =?us-ascii?Q?Br3Z/iMGACF/yiMsEivV/bQqlgC+3XYx5k9FXCYDy+jYVj5PLBPSqmqzAtMT?=
 =?us-ascii?Q?/WrCiJeaGzI3RdMoxotGzauB3AYeRs9mSSX3eWkibeavtJ8SCUp3UnHCKZhl?=
 =?us-ascii?Q?WsZb03ftdwzhq+ucQRRIv8+oFusQVHAPWmRDpeQsNgrVL6mUb7kjAtHVDCVe?=
 =?us-ascii?Q?axQ5pE7TsaDVzVzvgPryvOoj48h3wdMSFMaMmukCvPVJHUd009bE4MMSkqJM?=
 =?us-ascii?Q?Gvo0KNKv25YKNP279WogwuuwHfPT6SK0hfIKRx9sYBGUqZ6M7GJqVvyfCAZp?=
 =?us-ascii?Q?qDHBFELnfLmQ5Dge+UHPZJ7iLbEN2CDnE/d6LaOOooCcwzOtxDTzP13AJyiy?=
 =?us-ascii?Q?3ZJlwlb9iQ9b9srtpRYLK1RDNZShGPE6xK85b4Gvx0XkvHYo1kOXwTOET/3b?=
 =?us-ascii?Q?dW3MDGc2SvIOUPbXLbEtD739lpPPTGRUrSw5/ysi7tFMPkb8yt0PDeKYwpqJ?=
 =?us-ascii?Q?qxMZ3owhaUoT/VJukSdaphMRCTJXP8bkpCDiL1tyzrVD+dh9Fm4P85SpGUe/?=
 =?us-ascii?Q?PChLIWUyiAs7R6uqyKnVllRxE/je2TlEKsltHT++slHcR7LCwHEqISKcQkQy?=
 =?us-ascii?Q?lDXnyIHZLBp+GWOYiBWo7EVNPQPo10XG35+uJxYGnGG3gWPl6s9v+BBwWR5p?=
 =?us-ascii?Q?OxVdrvWtUplR08X0VNY/1/r/UDzIfqLbvKEgXbn4IUMYHMaP/ro0E/KSzOR4?=
 =?us-ascii?Q?pd+x4cZcjouwF4XzIMH+Fqa3QDk1ltgYVgFMrPvuaujekppj9UUKW7+JVO4W?=
 =?us-ascii?Q?NRcS/UlFUOPOLMcu6xlXhkEm1ht+ncPeaKsSiZ1rQ4UaOucdIuKvH1zPBv4I?=
 =?us-ascii?Q?cIwzz31XmOPAHVs1cXiHMaWMog0VYTXad3RRLM6Yqw+EvHGQb84aVQZPtBAe?=
 =?us-ascii?Q?Mxs2PywbvM4t+VwFng1BGKHnHw5Im6kOnJj8accndPbkrJWIIAyllPgkTmxt?=
 =?us-ascii?Q?03Au0hZ9lrx0saSkD6CWQ3r3J9yKzqhfUd2XUsMuywACPMr9QTHz462IDOWy?=
 =?us-ascii?Q?Nln2x14xtsBkQmZXXqpCqnSC7rx02G2bWgXUOooUjUw7gOiV4ouPy8aJNqSY?=
 =?us-ascii?Q?3r4BPuexyvzGwGLqHDeBdMMWBkpLMbWG+UaBxDlO2m2Y30ppHqgXVCrhGroZ?=
 =?us-ascii?Q?dOlfDMRXg3F3DActfvzj4snibYyNLAg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6680e394-c3b2-4192-272d-08de6e6e344f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 21:47:53.8395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MqXg8TbZdYRsPLdBDLllrqnrA4d+skKIwQfIaVCS8g8WV+IQ7yUJfWLfX8obAOqDMiZzDbmJdHrXEj5pthiJ7qi/74Nuq/rbLgcsC71GNvA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8788
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

On Tue, Feb 17, 2026 at 05:16:31PM +0530, Raag Jadav wrote:
> Setup hardware error routing based on XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET

You may want to explain what that routing is.  If I understand
correctly, it looks like the change we're making is:

                 current   new with NO_RESET   new w/o NO_RESET
                 -------   -----------------   ----------------
        fatal      AER           IRQ                AER
    non-fatal      IRQ           IRQ                AER
  correctable      IRQ           IRQ                AER

Is that correct?

It would also be good to give more explanation of why these are the
settings we want based on the wedge mode.

> which will be used for debug cases on Crescent Island.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  5 +++++
>  drivers/gpu/drm/xe/xe_hw_error.c           | 22 +++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_hw_error.h           |  1 +
>  3 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
> index c146b9ef44eb..88593f0a48fd 100644
> --- a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
> @@ -11,6 +11,11 @@
>  
>  #define HEC_UNCORR_FW_ERR_DW0(base)                    XE_REG((base) + 0x124)
>  
> +#define DEV_ERR_ROUTING_CTRL			XE_REG(0x100170)
> +#define   FATAL_ERR_ROUTING			BIT(2)
> +#define   NONFATAL_ERR_ROUTING			BIT(1)
> +#define   CORR_ERR_ROUTING			BIT(0)
> +
>  #define DEV_ERR_STAT_NONFATAL			0x100178
>  #define DEV_ERR_STAT_CORRECTABLE		0x10017c
>  #define DEV_ERR_STAT_REG(x)			XE_REG(_PICK_EVEN((x), \
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index 8c65291f36fc..eb557266d083 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -146,6 +146,23 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
>  			hw_error_source_handler(tile, hw_err);
>  }
>  
> +/**
> + * xe_hw_error_irq_route - irq routing of hw errors
> + * @xe: xe device instance
> + *
> + * Set irq routing of hw errors.
> + */
> +void xe_hw_error_irq_route(struct xe_device *xe)
> +{
> +	u32 mask = CORR_ERR_ROUTING | NONFATAL_ERR_ROUTING | FATAL_ERR_ROUTING;
> +	bool irq = xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET;
> +	struct xe_tile *tile;
> +	u8 id;
> +
> +	for_each_tile(tile, xe, id)
> +		xe_mmio_rmw32(&tile->mmio, DEV_ERR_ROUTING_CTRL, mask, irq ? mask : 0);
> +}
> +
>  /*
>   * Process hardware errors during boot
>   */
> @@ -178,5 +195,8 @@ void xe_hw_error_init(struct xe_device *xe)
>  
>  	INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
>  
> -	process_hw_errors(xe);
> +	if (xe->info.platform == XE_CRESCENTISLAND)
> +		xe_hw_error_irq_route(xe);

What makes this CRI-only?  The DEV_ERR_ROUTING_CTRL register exists on
every platform supported by the Xe driver so there doesn't appear to be
any specific hardware dependency here.

Even if there was a hardware dependency, we generally don't want to tie
behavior to platforms; better to set a feature flag in the device
descriptor that indicates which platforms can/can't support it.


> +	else
> +		process_hw_errors(xe);

Even if future errors are going to be reported via PCI AER instead of
IRQ, don't we still need to go process any errors that were already
reported via IRQ before the driver loaded (i.e., at least go clear their
interrupt bits)?


Matt

>  }
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
> index d86e28c5180c..8f155b66b5f1 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.h
> +++ b/drivers/gpu/drm/xe/xe_hw_error.h
> @@ -11,5 +11,6 @@ struct xe_tile;
>  struct xe_device;
>  
>  void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
> +void xe_hw_error_irq_route(struct xe_device *xe);
>  void xe_hw_error_init(struct xe_device *xe);
>  #endif
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
