Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16667D116F1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 17:41:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB1310E437;
	Mon,  1 Dec 2025 17:41:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XJoiatWT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE91510E437
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 17:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764610905; x=1796146905;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EdZ4yajUdYBeShG4+H5fR3P9Omn4K30R/7yoJe9HBgk=;
 b=XJoiatWTCg/GwSkoDnOA1L2iaLymKtzux3FD9eqfjh6qDoVKmVTqFJJ9
 +ApDPAGkXRImvjlRWGXkTvU0nVoMFlcg0XyVjF3vI1HYRP1uVfINe97hZ
 ZN3ie1e0rY2tXhOLPO2jSqYd9fpFSQwLAMH4g55nX++3zoebbwgvk5T6I
 QYWcEStL1ve+56YiOv0KlvjZ12LmtqzkPTsfDVXUACh/sjwGZMCqbqVFP
 Zo/fxgmcg4YJYU3y1vCVDIM+EavSMbaB93bE5I8ze8q6QdIJc/X2mqNZb
 hVhOeHcV4kJKkWfHWlg1voi1jwtnnW4kN9nPwe99LUB52dZQfmwOmq1Zf Q==;
X-CSE-ConnectionGUID: V1mphlUDQxCcXEdx2F9Xcw==
X-CSE-MsgGUID: Se55xyUdR4Kfbl5ZQDOOtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66592090"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="66592090"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 09:41:44 -0800
X-CSE-ConnectionGUID: HL6AC2b3TQ2ThIQ9iVnzMg==
X-CSE-MsgGUID: 1tY4KmnbQFKCaS3mvrJWbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="194563849"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 09:41:42 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 09:41:42 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 09:41:42 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.60) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 09:41:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=amsMBP7cUoG3gmPrn542phLHQ8ZXCYyhEURgRw03U0w58/6y/kb9828BTTLnOaLNFiwiWv8vXKM18jZ9myVVJTo3JtqOP5yM+8ds337vfFnTy7in6cRD71jD52AAVusyKnLLLPmjBfhfz3xvwsBcvdBaeUzdojKyL6gtUWGsUD/8jh4Uq+uJh+K0XIY0MVkL6718ojx7Tmk0NBBCNoohUz6eLFyKJGTYIDuy3j7LYaix5rKxK7fdo1ZPgPlEe5DpVGhsd0cryDwszcIp0QGd9oqUicB8bIFsVuEBzVMTUh2C6H7B4uL1A6ItEHRP3HSV16zbaQPd+7Y+1CG59i88EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQkd+27NhbXMSzBJKLthDojUwmiYeGLKmQmsO76wKmc=;
 b=OO7SiQBgmFnKYv7WmEhB4DmU04H/SmSFcNnv9GOEAuN37pl4VbrSJqD57604X5MPndY1702VeNR9f6/gbIZGiRhRaLDBeAzad0YlchR31hlIqcAj+F5Pz9+i9nrr9MBWFLL2PM6HTIXBFNgDOr7FzdwVV+rxOba5zWgm3y4kGDw3uVdMbNY6RD0OuQsps0cXSC311B2XsfJ2cAlF6CP7ucTmKalbW1o3Pp0IpaX2mstIgN7b1Bf/M817p8362EjTcOMZZWh4sQOYs3lYjX6acMphDUxnOn5lGYwC/Q1iZHMchJIddS8/He42oUSi27xOtM+FOczkPzqDGQVdm5K5nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6772.namprd11.prod.outlook.com (2603:10b6:510:1b6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 17:41:37 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 17:41:36 +0000
Date: Mon, 1 Dec 2025 09:41:34 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1?= =?utf-8?Q?re?= for
 drm/xe: Apply Wa_14020316580 in xe_gt_idle_enable_pg()
Message-ID: <20251201174134.GG4065316@mdroper-desk1.amr.corp.intel.com>
References: <20251129052548.70766-1-vinay.belgaumkar@intel.com>
 <176440114913.40073.3955546697053069568@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <176440114913.40073.3955546697053069568@a3b018990fe9>
X-ClientProxiedBy: SJ0PR05CA0180.namprd05.prod.outlook.com
 (2603:10b6:a03:339::35) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6772:EE_
X-MS-Office365-Filtering-Correlation-Id: c3b223c9-d3e3-40e7-e3a1-08de3100e030
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kGtydZXzoM79aGi0O9ce0fY9ny9wGkrDu/edZ5nYgVzb8kkclvZUINlr1Ynb?=
 =?us-ascii?Q?3nJNIIo/CYDSdaVThp1UYfzZbds3YqV8RV/F4vbImiXyJllhzfrUzDRLgWhQ?=
 =?us-ascii?Q?vsuV7DEPBdBOo5fHIxnCmFU9n6pGvxpjJeogL/XhQk50lPvjyP5iuItm72ZF?=
 =?us-ascii?Q?ALC2Y1CDTRmnOl6JpNgJdG574SXdXep5bOYOMcHTECnYvl8hb9RD2EVDD//f?=
 =?us-ascii?Q?QGtz8y50cLY5tkqS+Yw7jJAHFSZyem3eijt1c8AoJiQtlDhPidqI2LTUu5eh?=
 =?us-ascii?Q?etyQVSxzmt+0/i0nm72azB1JZNbkdysYdNSbZ63qd/hXpllOLhoYm2pBL0Br?=
 =?us-ascii?Q?vWqgd5U64/rcrXz5y78NYb1cP4Y01iHKe6L5JltLMQSCpgSLhMJuAOEv9K3R?=
 =?us-ascii?Q?r5FdlajqOmEcIEzH3bVa/pzjaTDvovRA+E2zfnBnKqYJE16Xksc643BLQf3s?=
 =?us-ascii?Q?v2zZfdaIU/xRYCUzJC9L+ndFQ8O4BWTOsLiWSyBIOwfPovv6Q0sogKb/o8A2?=
 =?us-ascii?Q?SiAyM+Lja/UG7ANc3ehW5AyBjNeBDT3sPmhONvTiFwseg0NEWYy1sBc2ejDA?=
 =?us-ascii?Q?wn/q9yUScSaKWC7hLHqaF7D9otWUmtIlFaDKnNIC7AskTiHdpnLCut3LMDRu?=
 =?us-ascii?Q?zNr9HKpbY61hhZSNpxhnHbZbdzNOp6fkFZFTr+4eCtmnw/Lfj7VzhszpKWWL?=
 =?us-ascii?Q?UztP9hyxBZF9qClDFYiiqklmDDJVpe4rTj3J8cQydQkwAZeIknJqKBo2jqvF?=
 =?us-ascii?Q?q5X+XMk6f9ZHU2Vszx4CUN2Ks7iA+J4P7SJ3B0mMpNHJqkRMpvQX3IsQ/jzm?=
 =?us-ascii?Q?dDDZ0PYWKbie5FIuk+fYivsuZApX0yvFB5UV9TFWyuBO/kgx6keNjtXgpbcr?=
 =?us-ascii?Q?71OtYZ8LeftQC2OzkCTcX0MInmFAWvNoASLFxRgVAicgvTIJgRIUcIjzWMGj?=
 =?us-ascii?Q?jU3K5JO61CzCeAfGiYuNC8IIBm9q2k1cGOOHYXibAUEOvn3dBkDlTFr2dck/?=
 =?us-ascii?Q?rVQb/dwiuz8StuwvPdThpzX8v8iZTirLSA+CHXPA9vDlmIIn43v5blE7FW9r?=
 =?us-ascii?Q?2yesWh7HvgFCh1+ZtUcuEJXJxjrKYWtgdg8CY2vgd9anPQwNYEdKVWoX5+dQ?=
 =?us-ascii?Q?5QIrm8ct9ZZZidjARwpOOTkjtVG2V/mAKtB5FSPagRdvlaJ7JsTMF61bao32?=
 =?us-ascii?Q?l42SEHF8aTCSFlzNAlsrK+kwqvOvqFMuVWKMOJQze91pqiHKCRwAjZSkH0Ye?=
 =?us-ascii?Q?74MLxDSm/INt5mVhzksoLnQykzWxlgH+Is+AMy7l7nHNNtvolJA3rtaPQXwP?=
 =?us-ascii?Q?r8dXpIJ0MT8CBhzG2ppDK2Sexi9gZej8au5pvXyC6v8RxD5jY1hOsNBuE0Y9?=
 =?us-ascii?Q?VtiQ+UnI6Ih8Y/mf5wZPWZBTc5RriXBsiLPGwI23IqGHIhAUrg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KraraEp7T3DYuaa4gLL/LTXGjOCNnQrjZHFApVpTf1YsEINVfmguBkFzg43R?=
 =?us-ascii?Q?feFp2goGvn8k7ns38z//uLIJTForC5XH/H1nwweeK2yFbUM0l3XAXX2mutBb?=
 =?us-ascii?Q?IJlYbQPxZ/KwKKwOP/F6wtU9KhhjP8/ZXoBYanVdkHPVv2uS5KyBMNo+YvOj?=
 =?us-ascii?Q?T/cewIGtIx7D8yXaytXnOZN9YqOC/kVoqkyZHFZ6LxNkMLQlHb+XN5ZKtSMS?=
 =?us-ascii?Q?bId7xSv07GIjeFDT+wxLPnON0g/sdmrF8y0upgyqd842yKkiIG5m+8oYu6Iw?=
 =?us-ascii?Q?+C0G22p7jX2tIgGBHsNCagoP2K4FAs5HvIUteHh79wBCDFXiiDxrXhSQ9i3m?=
 =?us-ascii?Q?8QUObM87otndPS+kLFDHvxv/cKwojh2LcKj6ndPY/uPtiYrumxmLBtJldvP8?=
 =?us-ascii?Q?dlqPvDIe20ZsCZdcruWa9S3eSoXriTZnfBOCNA1fV24pbaDAwf2j9yF6YdOR?=
 =?us-ascii?Q?bwfSdawr1bnC08/VKT2j5PYUbCe9ioc1hzx3q2xB6J7f+qDMX0afKlD+Uk6t?=
 =?us-ascii?Q?1eGYcFsZLrXsEHUC2QHC8dEBEZhGEE+tWSz7XGuyjjbIll1HbF/SBQk6qcFr?=
 =?us-ascii?Q?Y7bxLYHdKl1srNnZ7+UY51zanjfRVt4j/qwLB38Xj4lxBar4thiH+40PXnmU?=
 =?us-ascii?Q?HFtwVZ8MR6K9W2C3xXryovIc39PNkidu0o6HHR30OnKW/NFkIbXvrahDT6RD?=
 =?us-ascii?Q?U/bPyZ8ejXPKPx8LdVBHNVxk5K4KA3CwkewL3K6aBRrAqqL4Llei7XC2YfJn?=
 =?us-ascii?Q?r0dLx+Y/HNas2Jkn6/Yp/rYouachqiFXdJCVfSlzmlkjRAkLNkQc+fH6ymOO?=
 =?us-ascii?Q?Oamrb3U/Ieqj/513nJNLes5Ee3ZxSwmnDOicxYrOtLuIRZ3hVNQ0wJfm8rg3?=
 =?us-ascii?Q?GrWOIVwVp947Hegkr1mSrIQVUNC/YN15agi6p9a0mU7/wm5FAI6DFUujN4xh?=
 =?us-ascii?Q?DfbXsgMgNB88O+GCqM7+L/H7iQZVvD9hR/TWtTDU1GhK+IecdcyrEKbmjVPh?=
 =?us-ascii?Q?H4Uzskwqgs0TdjIzojisf1hBa3GFPsJwHL32Fg2BS2/iEkhi53idDr8t4ygF?=
 =?us-ascii?Q?lETP/+Rrf9KI3TiE2iIjy9tzNKyUvTrlVa3Z64NQvJyBIhSN+dVe81W+4VR1?=
 =?us-ascii?Q?gnVXNXibWuYDg2xcXXc0lz7sLEjuIf35Ai9WrjFg4RsLURTYOFwypt3v1MXb?=
 =?us-ascii?Q?620r/4LSD7E+AIpM4Gg17mqxaeGWpc81PXGWhVdrMcUI2HDK5E/rq/iK1vd5?=
 =?us-ascii?Q?pLDgWa5yAu41KUX5W7pEfD5KhhE2+9W1SxDkEMzwljHOL4/v7WNUAwCLmQnS?=
 =?us-ascii?Q?81lC3hYKsh/Bkn2Lbg6AZ+xKJbTeq2LAxo7qAPMzOuI8U3WGwjxRnR9Ugomp?=
 =?us-ascii?Q?Qn8FW78mGoHxTUD1mgCXyaPE8aNDIQ3PXQiFK7vEuGy5QC2qRBFIEfLT8JCz?=
 =?us-ascii?Q?pgyKpqNP7DtJC2SvRo98PzukvlA1thWtBwqqc/tq9mJ8MMo7E1+05EYojqkp?=
 =?us-ascii?Q?Au1KwCVh/zkdutTpZvkD5gBdU+GYMUrW30NiyONv18LCYweq0vEToSSOtV+Y?=
 =?us-ascii?Q?JoQyYb7lbfKef6xvFRhZBCYrgzPsLQYVRXc0LdXVAb+iX2EQii6hnTSAifYW?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3b223c9-d3e3-40e7-e3a1-08de3100e030
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 17:41:36.6203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h1jWl3Ri8lf3+FrpiIBxONFA3ONuSFCDjz+Zc/Z2gRR4rFT62vXHjTYN73IY1oPgx0wmRAUSmrC/fbsHAz1YNoiwlHNR2s1e8dRjZ4zeBI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6772
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

On Sat, Nov 29, 2025 at 07:25:49AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Apply Wa_14020316580 in xe_gt_idle_enable_pg()
> URL   : https://patchwork.freedesktop.org/series/158230/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc_FULL -> xe-pw-158230v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-158230v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-158230v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-158230v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_colorop@plane-xr24-xr24-3dlut_17_12_rgb:
>     - shard-lnl:          NOTRUN -> [SKIP][1] +1 other test skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-5/igt@kms_colorop@plane-xr24-xr24-3dlut_17_12_rgb.html
> 
>   * igt@kms_colorop@plane-xr24-xr24-bt2020_inv_oetf-bt2020_oetf:
>     - shard-bmg:          NOTRUN -> [SKIP][2] +1 other test skip
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-2/igt@kms_colorop@plane-xr24-xr24-bt2020_inv_oetf-bt2020_oetf.html
> 
>   * igt@kms_colorop@plane-xr24-xr24-pq_125_eotf-pq_125_inv_eotf-pq_125_eotf:
>     - shard-adlp:         NOTRUN -> [SKIP][3] +1 other test skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-adlp-4/igt@kms_colorop@plane-xr24-xr24-pq_125_eotf-pq_125_inv_eotf-pq_125_eotf.html

None of these display skips are related to the GT power workaround here.

> 
>   * igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [FAIL][4] +1 other test fail
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-hdmi-a-3.html

Display CRC mismatch.  Not related to the GT power gating.

> 
>   * igt@xe_exec_balancer@many-cm-virtual-basic:
>     - shard-dg2-set2:     [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc/shard-dg2-466/igt@xe_exec_balancer@many-cm-virtual-basic.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-dg2-432/igt@xe_exec_balancer@many-cm-virtual-basic.html

CAT error (i.e., access to illegal memory address).  GT powergating
wouldn't have any impact on this.


Applied to drm-xe-next.  Thanks for the patch and review.


Matt

> 
>   
> #### Warnings ####
> 
>   * igt@kms_content_protection@dp-mst-suspend-resume:
>     - shard-bmg:          [SKIP][7] ([Intel XE#6692]) -> [SKIP][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc/shard-bmg-1/igt@kms_content_protection@dp-mst-suspend-resume.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-4/igt@kms_content_protection@dp-mst-suspend-resume.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@kms_colorop@plane-xr30-xr30-gamma_2_2_inv_oetf}:
>     - shard-adlp:         NOTRUN -> [SKIP][9]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-adlp-9/igt@kms_colorop@plane-xr30-xr30-gamma_2_2_inv_oetf.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-158230v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-edp-1-linear-rgb565:
>     - shard-lnl:          NOTRUN -> [FAIL][10] ([Intel XE#6676]) +36 other tests fail
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-1/igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-edp-1-linear-rgb565.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#455]) +2 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1124]) +6 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#3658])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-270:
>     - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1407])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-3/igt@kms_big_fb@linear-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#607])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#1124]) +2 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [PASS][17] -> [FAIL][18] ([Intel XE#1231]) +1 other test fail
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1477])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1124]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>     - shard-bmg:          [PASS][21] -> [SKIP][22] ([Intel XE#2314] / [Intel XE#2894])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
>     - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#2191])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-adlp-6/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#367])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#787]) +6 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-adlp-9/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2887]) +7 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-1/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#787]) +11 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
>     - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#3432]) +1 other test skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#2907])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-adlp-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#2887]) +5 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-1/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-max:
>     - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#306]) +1 other test skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-3/igt@kms_chamelium_color@ctm-max.html
> 
>   * igt@kms_chamelium_color@ctm-red-to-blue:
>     - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2325])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-1/igt@kms_chamelium_color@ctm-red-to-blue.html
> 
>   * igt@kms_chamelium_frames@dp-crc-multiple:
>     - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#373]) +3 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-adlp-9/igt@kms_chamelium_frames@dp-crc-multiple.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-single:
>     - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#373]) +3 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-5/igt@kms_chamelium_frames@hdmi-crc-single.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#373])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-fast:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2252]) +3 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-6/igt@kms_chamelium_hpd@vga-hpd-fast.html
> 
>   * igt@kms_colorop@plane-xr24-xr24-srgb_inv_eotf_lut:
>     - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#6704])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-adlp-6/igt@kms_colorop@plane-xr24-xr24-srgb_inv_eotf_lut.html
> 
>   * igt@kms_colorop@plane-xr30-xr30-bt2020_oetf:
>     - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#6704]) +1 other test skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-5/igt@kms_colorop@plane-xr30-xr30-bt2020_oetf.html
> 
>   * igt@kms_colorop@plane-xr30-xr30-srgb_inv_eotf_lut:
>     - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#6704]) +1 other test skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-2/igt@kms_colorop@plane-xr30-xr30-srgb_inv_eotf_lut.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#3278])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-5/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2390])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-1/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2341])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-2/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2321]) +1 other test skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>     - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#2321])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
>     - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1424]) +2 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>     - shard-bmg:          [PASS][48] -> [SKIP][49] ([Intel XE#2291]) +1 other test skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc/shard-bmg-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>     - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#309]) +2 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-adlp-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
>     - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#309])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>     - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2291])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
> 
>   * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
>     - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#4422])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-adlp:         NOTRUN -> [ABORT][54] ([Intel XE#6675]) +5 other tests abort
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-adlp-6/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-on-nop:
>     - shard-bmg:          [PASS][55] -> [SKIP][56] ([Intel XE#2316]) +2 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
> 
>   * igt@kms_flip@2x-flip-vs-rmfb:
>     - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2316]) +1 other test skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-rmfb.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>     - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#310]) +6 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-adlp-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> 
>   * igt@kms_flip@2x-plain-flip-interruptible:
>     - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#1421]) +1 other test skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-5/igt@kms_flip@2x-plain-flip-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend@a-dp2:
>     - shard-bmg:          NOTRUN -> [ABORT][60] ([Intel XE#6675]) +4 other tests abort
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-7/igt@kms_flip@flip-vs-suspend@a-dp2.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#1401]) +1 other test skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#1397] / [Intel XE#1745])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#1397])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2293]) +2 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#6312])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#651]) +4 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2311]) +7 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#4141]) +2 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
>     - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2312]) +9 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#656]) +10 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#656]) +7 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#651]) +4 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#6312])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
>     - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2313]) +11 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
>     - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#653])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#1503])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-3/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
>     - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#4329])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
>     - shard-adlp:         [PASS][80] -> [ABORT][81] ([Intel XE#6675]) +1 other test abort
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
> 
>   * igt@kms_pm_backlight@brightness-with-dpms:
>     - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2938])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-2/igt@kms_pm_backlight@brightness-with-dpms.html
> 
>   * igt@kms_pm_rpm@system-suspend-idle:
>     - shard-dg2-set2:     NOTRUN -> [ABORT][83] ([Intel XE#6675])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-dg2-432/igt@kms_pm_rpm@system-suspend-idle.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#1406] / [Intel XE#1489]) +3 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#1406] / [Intel XE#1489])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-dg2-432/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
>     - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1406] / [Intel XE#1489]) +5 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-adlp-6/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
>     - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1406] / [Intel XE#2893]) +4 other tests skip
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-5/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr@fbc-psr2-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-1/igt@kms_psr@fbc-psr2-suspend.html
> 
>   * igt@kms_psr@pr-primary-page-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#1406]) +1 other test skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-1/igt@kms_psr@pr-primary-page-flip.html
> 
>   * igt@kms_psr@psr2-sprite-render:
>     - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +4 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-adlp-4/igt@kms_psr@psr2-sprite-render.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#1406] / [Intel XE#2414])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#3414] / [Intel XE#3904])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-2/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2330])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#1435])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-2/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@kms_setmode@invalid-clone-exclusive-crtc:
>     - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#1435])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-2/igt@kms_setmode@invalid-clone-exclusive-crtc.html
> 
>   * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#6503])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-1/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html
> 
>   * igt@xe_ccs@large-ctrl-surf-copy:
>     - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#3576] / [Intel XE#5610])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-adlp-6/igt@xe_ccs@large-ctrl-surf-copy.html
> 
>   * igt@xe_create@create-big-vram:
>     - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#1062])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-2/igt@xe_create@create-big-vram.html
> 
>   * igt@xe_eu_stall@unprivileged-access:
>     - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#5626])
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-adlp-6/igt@xe_eu_stall@unprivileged-access.html
> 
>   * igt@xe_eudebug@basic-vm-access-parameters-userptr-faultable:
>     - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#4837] / [Intel XE#5565]) +2 other tests skip
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-adlp-6/igt@xe_eudebug@basic-vm-access-parameters-userptr-faultable.html
> 
>   * igt@xe_eudebug@basic-vm-bind-discovery:
>     - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#4837]) +5 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-discovery.html
> 
>   * igt@xe_eudebug@vm-bind-clear-faultable:
>     - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#4837]) +5 other tests skip
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-5/igt@xe_eudebug@vm-bind-clear-faultable.html
> 
>   * igt@xe_eudebug_online@pagefault-write-stress:
>     - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#6665])
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-5/igt@xe_eudebug_online@pagefault-write-stress.html
> 
>   * igt@xe_evict@evict-cm-threads-small-multi-vm:
>     - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#688]) +4 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-5/igt@xe_evict@evict-cm-threads-small-multi-vm.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#261])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-adlp-6/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_evict@evict-small-external:
>     - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-adlp-4/igt@xe_evict@evict-small-external.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
>     - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#1392] / [Intel XE#5575]) +2 other tests skip
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-adlp-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#1392]) +4 other tests skip
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-basic.html
> 
>   * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
>     - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2322]) +4 other tests skip
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-2/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-rebind-prefetch:
>     - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#288] / [Intel XE#5561]) +5 other tests skip
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-rebind-prefetch.html
> 
>   * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
>     - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#2360])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-adlp-6/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
> 
>   * igt@xe_exec_system_allocator@fault-threads-same-page-benchmark:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#4915]) +8 other tests skip
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-dg2-432/igt@xe_exec_system_allocator@fault-threads-same-page-benchmark.html
> 
>   * igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset:
>     - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#5007])
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-5/igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset.html
> 
>   * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
>     - shard-lnl:          [PASS][115] -> [FAIL][116] ([Intel XE#5625])
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
> 
>   * igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge:
>     - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#4943]) +9 other tests skip
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-1/igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge.html
> 
>   * igt@xe_exec_system_allocator@threads-many-large-new-race:
>     - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#4915]) +93 other tests skip
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-adlp-9/igt@xe_exec_system_allocator@threads-many-large-new-race.html
> 
>   * igt@xe_exec_system_allocator@twice-mmap-new-huge:
>     - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#4943]) +10 other tests skip
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-1/igt@xe_exec_system_allocator@twice-mmap-new-huge.html
> 
>   * igt@xe_gt_freq@freq_suspend:
>     - shard-bmg:          [PASS][120] -> [ABORT][121] ([Intel XE#6675]) +1 other test abort
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc/shard-bmg-2/igt@xe_gt_freq@freq_suspend.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-3/igt@xe_gt_freq@freq_suspend.html
> 
>   * igt@xe_mmap@pci-membarrier:
>     - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#5100])
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-5/igt@xe_mmap@pci-membarrier.html
> 
>   * igt@xe_mmap@vram:
>     - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#1008] / [Intel XE#5591])
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-adlp-6/igt@xe_mmap@vram.html
> 
>   * igt@xe_module_load@force-load:
>     - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#378] / [Intel XE#5612])
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-adlp-9/igt@xe_module_load@force-load.html
> 
>   * igt@xe_oa@create-destroy-userspace-config:
>     - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#3573]) +3 other tests skip
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-adlp-6/igt@xe_oa@create-destroy-userspace-config.html
> 
>   * igt@xe_oa@tail-address-wrap:
>     - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#6032])
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-adlp-6/igt@xe_oa@tail-address-wrap.html
> 
>   * igt@xe_pat@pat-index-xe2:
>     - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#977])
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-adlp-4/igt@xe_pat@pat-index-xe2.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#2236])
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-1/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_pm@d3cold-multiple-execs:
>     - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#2284] / [Intel XE#366])
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-1/igt@xe_pm@d3cold-multiple-execs.html
> 
>   * igt@xe_pm@s3-vm-bind-unbind-all:
>     - shard-dg2-set2:     [PASS][130] -> [ABORT][131] ([Intel XE#6675])
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc/shard-dg2-435/igt@xe_pm@s3-vm-bind-unbind-all.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-dg2-463/igt@xe_pm@s3-vm-bind-unbind-all.html
> 
>   * igt@xe_pm@s4-vm-bind-prefetch:
>     - shard-lnl:          [PASS][132] -> [ABORT][133] ([Intel XE#6675])
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc/shard-lnl-4/igt@xe_pm@s4-vm-bind-prefetch.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-1/igt@xe_pm@s4-vm-bind-prefetch.html
> 
>   * igt@xe_pxp@display-black-pxp-fb:
>     - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#4733])
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-6/igt@xe_pxp@display-black-pxp-fb.html
> 
>   * igt@xe_query@multigpu-query-invalid-extension:
>     - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#944]) +2 other tests skip
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-2/igt@xe_query@multigpu-query-invalid-extension.html
> 
>   * igt@xe_query@multigpu-query-mem-usage:
>     - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#944])
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-adlp-6/igt@xe_query@multigpu-query-mem-usage.html
> 
>   * igt@xe_sriov_flr@flr-vf1-clear:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#3342])
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-dg2-432/igt@xe_sriov_flr@flr-vf1-clear.html
> 
>   * igt@xe_vm@out-of-memory:
>     - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#5745])
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-1/igt@xe_vm@out-of-memory.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
>     - shard-bmg:          [SKIP][139] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][140]
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
> 
>   * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
>     - shard-bmg:          [SKIP][141] ([Intel XE#2291]) -> [PASS][142] +1 other test pass
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc/shard-bmg-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
>     - shard-bmg:          [SKIP][143] ([Intel XE#2316]) -> [PASS][144] +1 other test pass
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-5/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
>     - shard-bmg:          [ABORT][145] ([Intel XE#6675]) -> [PASS][146]
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc/shard-bmg-8/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
> 
>   * igt@kms_setmode@basic@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][147] ([Intel XE#6361]) -> [PASS][148] +1 other test pass
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc/shard-dg2-435/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-dg2-436/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html
> 
>   * {igt@kms_sharpness_filter@filter-suspend@pipe-c-edp-1-suspend}:
>     - shard-lnl:          [INCOMPLETE][149] -> [PASS][150]
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc/shard-lnl-1/igt@kms_sharpness_filter@filter-suspend@pipe-c-edp-1-suspend.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-2/igt@kms_sharpness_filter@filter-suspend@pipe-c-edp-1-suspend.html
> 
>   * igt@kms_vrr@negative-basic:
>     - shard-bmg:          [SKIP][151] ([Intel XE#1499]) -> [PASS][152]
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc/shard-bmg-2/igt@kms_vrr@negative-basic.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-5/igt@kms_vrr@negative-basic.html
> 
>   * igt@xe_exec_reset@cm-gt-reset:
>     - shard-bmg:          [ABORT][153] ([Intel XE#6515]) -> [PASS][154]
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc/shard-bmg-7/igt@xe_exec_reset@cm-gt-reset.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-1/igt@xe_exec_reset@cm-gt-reset.html
> 
>   * igt@xe_pm@s2idle-basic-exec:
>     - shard-adlp:         [ABORT][155] ([Intel XE#6675]) -> [PASS][156] +7 other tests pass
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc/shard-adlp-3/igt@xe_pm@s2idle-basic-exec.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-adlp-9/igt@xe_pm@s2idle-basic-exec.html
>     - shard-dg2-set2:     [ABORT][157] ([Intel XE#6675]) -> [PASS][158]
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc/shard-dg2-466/igt@xe_pm@s2idle-basic-exec.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-dg2-432/igt@xe_pm@s2idle-basic-exec.html
> 
>   * igt@xe_pm@s2idle-exec-after:
>     - shard-lnl:          [ABORT][159] ([Intel XE#6675]) -> [PASS][160] +3 other tests pass
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc/shard-lnl-5/igt@xe_pm@s2idle-exec-after.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-3/igt@xe_pm@s2idle-exec-after.html
> 
>   * igt@xe_pmu@engine-activity-accuracy-90:
>     - shard-lnl:          [FAIL][161] ([Intel XE#6251]) -> [PASS][162] +3 other tests pass
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-90.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
>     - shard-bmg:          [SKIP][163] ([Intel XE#2311]) -> [SKIP][164] ([Intel XE#2312]) +4 other tests skip
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move:
>     - shard-bmg:          [SKIP][165] ([Intel XE#2312]) -> [SKIP][166] ([Intel XE#2311]) +3 other tests skip
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][167] ([Intel XE#4141]) -> [SKIP][168] ([Intel XE#2312]) +3 other tests skip
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-bmg:          [SKIP][169] ([Intel XE#2312]) -> [SKIP][170] ([Intel XE#4141]) +2 other tests skip
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][171] ([Intel XE#2312]) -> [SKIP][172] ([Intel XE#2313]) +3 other tests skip
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][173] ([Intel XE#2313]) -> [SKIP][174] ([Intel XE#2312]) +5 other tests skip
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][175] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][176] ([Intel XE#3544])
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
>   [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
>   [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>   [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
>   [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#3576]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3576
>   [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
>   [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
>   [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
>   [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
>   [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
>   [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
>   [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
>   [Intel XE#5591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5591
>   [Intel XE#5610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5610
>   [Intel XE#5612]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5612
>   [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
>   [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
>   [Intel XE#5745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745
>   [Intel XE#6032]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6032
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#6515]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6515
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
>   [Intel XE#6675]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675
>   [Intel XE#6676]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6676
>   [Intel XE#6692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6692
>   [Intel XE#6704]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6704
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc -> xe-pw-158230v1
> 
>   IGT_8645: 8645
>   xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc: 157d0854a24fa73f7516908563d3ee9eacc679fc
>   xe-pw-158230v1: 158230v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158230v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
