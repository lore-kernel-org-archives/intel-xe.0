Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B1E4D3940D
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 10:22:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B94110F1E6;
	Thu,  2 Apr 2026 10:22:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IzTzRQTh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E47F10F1E6
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 10:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775125369; x=1806661369;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/+F7+xz6MtF4pZTqR9SxUm7vqor1el79LsrE66brG5c=;
 b=IzTzRQTh8ANSTNRDQzuPCajccgvvTiE37cGET+ePrfRN8r7AnwzEb1CL
 duJT40BuqLUJWTCbCDXqKh1BE+ErRJ6TNzHpAHN74D7YQWTimjUcHjqyW
 Z0pB1WP4XvYyk/D4QRkC6xTVc05WUILMdYQCgcZ1vkPwGrUN/GnTEMyWj
 axrVcn64kvEm+Z4123recCm1Gog3kstO75Agj+67NXocoTV0EvdE7l+59
 MzR0OGS2vlG5fEzpz9go2vCGb0GiMwWb7ICYrmOkL1UywQf2C+9BvjHiB
 hcxE3afKmhTtmv7vOOVTiOAdBSI/KkpYxl8FpLL3E+9PFIZQ3F5hYln5B A==;
X-CSE-ConnectionGUID: 5Pq6jybSQ+ylOWQ+JPhykQ==
X-CSE-MsgGUID: IFERBGaTShKMReCGkRmJFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="79787514"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="79787514"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 03:22:49 -0700
X-CSE-ConnectionGUID: mn6xH9OxROC8DR5en8AWTQ==
X-CSE-MsgGUID: fHHm2dDSQMejJyJDr1CEuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="228556774"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 03:22:48 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 03:22:48 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 03:22:48 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.3) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 03:22:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PfS8H2ObNyQynsf6RHc6k7g3/PtDK6H3Nz568RXfl+A442LMOtQfaVHSsn6ilHe45DxEthWBJ7bNZTLIM7LgAldnXLwtAZ1+4Ywd/z1lSlTNzS/syXXPxbUfdHcdfW2VGY5z9saE1xsEp4oaBbar89tFAAobKzkWzGqNRyiuDf5+LpxS9qp72pxW/jiRhgkyaaJlCBnJMRnY63Ryu4SKXvlijaEuuC6FHwjEF0TMinbvKp3lDgY9haWcaLRwN0um02jIdaTLgjZw+cFj111Xk+6tX1jLXqOQ6kBFhPQ4y2QGZlH/vzLeyH6k9r9dtsOFmL2qQJ5M52fxtvxptXq26g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQFGheaUSC3gXS8XdXE21xGbCcGCJWyzxJRWeqYi8Hc=;
 b=dW2OasUB/QAthvrIhM6xiE7k0tYrjBxw/y2e/5h/XXB+6s0+Wx13wOKByHvteL+EpOElOEg9QfmVcZaL4QeGVEmxsoxZUS9HSWfqHtXlgz+HGrdWa04V6LG62iAenYDWEPvjbU6bWZ7ZFS7+ZuFbgSDkHbnbTehkv4P1DnSQzBPdTh1y6C63rK3l0/smAy5g+RITK8Mhz7Lx431pbBstoQNc4OE7SnFop680/Zmr/z5mlKkr47WOcPyEMhp7DzELf0lobUDIeQ0YPCYAzvBozELL8d32zt1A+5SoeEDRZD9mqUuKzYRYu2HYOuLEjBcbM2z7gbWK32zy8GOx4Qy3Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DS4PPF7CCC4B437.namprd11.prod.outlook.com (2603:10b6:f:fc02::34)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 2 Apr
 2026 10:22:44 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%5]) with mapi id 15.20.9769.017; Thu, 2 Apr 2026
 10:22:44 +0000
Date: Thu, 2 Apr 2026 12:22:40 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 03/13] drm/xe/pf: Force new VFs prorities only once
Message-ID: <20260402102240.7h7elsv254d3ey42@intel.com>
References: <20260330204046.567-1-michal.wajdeczko@intel.com>
 <20260330204046.567-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260330204046.567-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1PR02CA0068.eurprd02.prod.outlook.com
 (2603:10a6:802:14::39) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DS4PPF7CCC4B437:EE_
X-MS-Office365-Filtering-Correlation-Id: d16bf767-bb3a-431b-30e3-08de90a1c72c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: tjoLmkE0czDpLbCW1rkVFVNEqAToPXtqA2TaYkYcPnCFRvVGRVsmT+rUhXn2OfbGpUDzdv5w7Y69MRFIIB4YvzDHkeSFYfnq1mYSSYJXJViA/iGBSRghDvw+aO1AERRBT3quYeMoDSyR3fxHDnExz7SKvjRyIerGFZ7kpOG2MbHEwEB+CWJmsOk6kl1zRQebqlAB4ZWGbwAEfVLoorfHtw9YEygXyYkGS8m6lOpGsSW94ClL2qjOqzbalvpwz+xBnMfRk6XKvAqN3z2vwaLAHibSRSNovBjJ6/K4FiRwtbV80zApmldGJX1MBPFxINQFhLLUs85xLru1/k6R6B+CtTubTCAbxLi4UYijxTasweIai5XG0RIR09ioi0k8Kf4IrjSAwsj49zUe51ZLI+8afU4h9QnAJIlNU/rPCo6Z/jobCTF4GZSrnjTtliPePsrBECbLlZIb7fBWZC8KTtzNLc+LkivtCyIQWg7aw24rCuVsr18jYMTXVBCNXhfAR+vpilDGAicTJ5SsUA22kAfB2zG0Q9lVhZ5pOmO2ngKxyMKU4v0amnl4wxwh1bkRDQzELBWCWUy9O1OydBkEKXW3GDDXjKmaWcoU2YpsU0CWcUMUK47x0x6wlWZodwl3Kq9zzmC3zDdHrGAqGCy6fiAz7UZSFZjUGlOA5UapTz+bUDButhaV9yczb7jRA020iInBtwRI3MLUy8EOqmmT1mJZJVxsAB5A+4hgyPAg4Iy3mFY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3lUaHNSNkZUQklOc1FrVFJSZjEyOGswT0ROK1VoMmNnZmdZRlkvVDk2M212?=
 =?utf-8?B?Si9ZV3NwSHZoYXkrcEJUdjJPdzE0Y1lIS0Z6eVBTMmgwWkhWbGlSZ0JlR2JS?=
 =?utf-8?B?TXhDbHF4Zlp3M3I0WDFrVDhJaEprUHBIUy8xd1VBeEZhVW5uNE8xVzRGWGdm?=
 =?utf-8?B?QUl4Y2JsL0s0N05TZGlPN3QzRHd2aCs0N25zSU1Ga01jSVBWNFp0RVNRSHRO?=
 =?utf-8?B?c3ZvZHBDeTkyWFNTNmVCV1VqRWdyK0tOV2UzUEdPVjE1c29ISEhzS2RjTEMx?=
 =?utf-8?B?WHlXcnFvZTZyQjhiRDJwVkI5SUYvbnFGeFh2Zm0zcDQ4ZjlrT3JWMVIyZmZs?=
 =?utf-8?B?NTVXdmpER1M0MVBQOW9NcnJ5Rkp4dXBFUFczZjRMYUNOdHBYZERHSWtBNFlh?=
 =?utf-8?B?ZFZpREV1MXdTdlZWdSs5Z0lLbDlNT1cvbHRYL3RqWUw3TUx4dkxFTE40U3J0?=
 =?utf-8?B?ZWI4V2dmbjJyYlZSbkVLTlFoYTIzTDJ2bXFNcG1MRHo2Q2xPN1J2c083RU1U?=
 =?utf-8?B?VG4rbWdhQzNLY3FudGJ2cCtPbE42aUNSVm5MeUpRb2ZkaG9DeGRPVVk1ajZ2?=
 =?utf-8?B?NVpWc2dkRlEya1p2WWEvYmZIdEwxU3hKa08wSml4bWtXbk55Vit3YTRkN3FB?=
 =?utf-8?B?VEtCRVRhOVZBMlRiTGtOL296VDZHMTNmSXc3UVFjME4xeFF5eFFMeWw1WWQr?=
 =?utf-8?B?MEJvUHl3cExhRit2RjNsaXZkdCtHUElXVUJYMGtLTDIzd1dTbmRnOG1aT3dm?=
 =?utf-8?B?WVBaSEJFQWE0RS9lV1N5bHZYYlpVdzlGczBBbXY0U2VYQXA2SkpIZWxsQ2I5?=
 =?utf-8?B?S0V6L05zQm5JK2xvUjNleDNwaHZxMzhFRmFpdFJzVVhrV1Q4K2pCOTJYdUhF?=
 =?utf-8?B?RXhCUzhWbHQ3UEZBYnUzejExbGNQRCtRc1ZSbmZUZC8vUXN6cThPNHdzUnA0?=
 =?utf-8?B?YTRGRWp6RVRUTTNrcHYrU0F2d3FtVHFiQmJoeDhGMFVlNzdsREsxZkVEQ1A4?=
 =?utf-8?B?N0NKWGR1cjArUmJObGNLbnRnZEkyaFNibGVhUzYxN2ZPdFg3aU1rdVh4c2cv?=
 =?utf-8?B?czNxY0RCTFc1aGlHOUdwMys2MzZzeEtrV0VIWWtMVXpEYS9RTWlQT0QzL21q?=
 =?utf-8?B?MzBtZXFJWTlKRE1XeTlvcU96OUkxSW5mTnEzR0dVQzV1My9rN3p6V3IwVFBa?=
 =?utf-8?B?V3oyNStPS3dCRUtyUnorOFVLYUw3cVJPZFFHR1JqZEJheWZvWHNXaXhnUHA3?=
 =?utf-8?B?dk9uRTRONSswVGh1SFFxNGYzNTZoc1RsZG11UmplVFpBRGVmTnEyaVo2Y0Rh?=
 =?utf-8?B?Q1RXcjloZG41ZFZZcjlzRUcySkhKcTlUUjBXS1pSQkNrUUNlNng0bDlxc0pR?=
 =?utf-8?B?N0tJeEtITUFTckJ2NlRON1hOeWZqS0hxMlBpY0JCT0hDZjM1NkNhODJwditz?=
 =?utf-8?B?SGRabnJidlFXaHlVclA3ZEdIdENsNm5oRTBiS0ljSnhubXBpWCtYeU5UUjFB?=
 =?utf-8?B?bEMzamhJUVZYM05CRDZxTzdIZTVQa3dnNUpkZ3AweVpxc0d0ajBFS2ptTk9T?=
 =?utf-8?B?U25uWFFsOHR1ZE9VaVlVMDh5RzJuYjZBWnhLVHgvM3k0MjBoVGJyMlR6RWJp?=
 =?utf-8?B?c0dtMTVVM3BwektZYXg5K3k2aGNtTVBjU1hpRnZiN2dIOFl5OUZVK25pcVNq?=
 =?utf-8?B?Z3M5TTlxd1BJVkVVdUlZUUxvaVhwVlo5Z2poV3NGMWVUOEZ3Z29rVXAwRk40?=
 =?utf-8?B?a0svcW50SDA2d3EzYTJuelNEVC93dWFNd05kTG9ma0xUellKZFYvdlJEOGov?=
 =?utf-8?B?VVdEaSszMk90Q2lzOFVCZmJiOVB3MW1uTGRPamtuM24rempPeDV6a1NteHJI?=
 =?utf-8?B?NTJaTkc5OEJDMGI2OFZTRkpzSWF1YVVaTGhHaVhDbU9QSXlXYWRoVk8ram10?=
 =?utf-8?B?Yml6QTRKMzU4Z3BQM01sVGgvdjRVS2tBR2loRjVwSVlnbllKeHZIT2czbTZL?=
 =?utf-8?B?b1ZwRFZHNkFhRFFEQ05RdkZtMVltR0ZiOXBqa1EwSFRTR3RPMzYxN0xFMmVG?=
 =?utf-8?B?eTVQN3NUY3hzcXlNTVh1QUFFczl4cG1kWWxIbGcvTFRsaFlvZXFtMGVteW9i?=
 =?utf-8?B?dDd0b2FWWjdaZldFUTA2YnRtT29mZGFpODFxQWNwTzFUNUlkVk9aT0dSR3dH?=
 =?utf-8?B?OGRzSGlGbW1VTUJhOFpMbkY4WWhHajE0Q05iTXBBTDZoYUZrM3ZXOUwzLy9J?=
 =?utf-8?B?NkZBT1NVMGQ0Ylg2MFgyaHJZZ3VpMzArS0ppTXR2V1FWMm04NkJIL1YvcWc5?=
 =?utf-8?B?VUxFZjBOQk9mbVhCWWJBR3VsNURuWVA3ckk5TWFuZFBMOE80R0l5OUN0d2k5?=
 =?utf-8?Q?MHIe1+fpro6VV5cI=3D?=
X-Exchange-RoutingPolicyChecked: YvplXz2ENU9T8zikW8wGRFQ/wUePC/f1tLtPegaZdrC24B3lnwQyyDxlEUO8N0q5HsOEwqedgzkdp9b7Awb9iG14JCHtiZUiDhWM8mXBs7WTLEyb+yffAExHGEqVMUL4pZV8T7ePTvRIx+/gfqPXGbbsWsYSSCtIPLhPe77/QFGewXaVDCLOIjLB7h+jzrq+/y9Ihn9NeaO028vqAnoFbpnl/k7Rnu/HyZ9BNTFa+o5jB1foZQ56pPWtl3jbsmUZMiwdo6GSw46g5VD0urbFtSZk6z6qPvkGC2KD0CxZGEbixA3RwDZyun1FqXFPXdqWcNjS3oD9JASEIqEa364IqA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d16bf767-bb3a-431b-30e3-08de90a1c72c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 10:22:44.1553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NE3Q54B7Omw5lU3wWzomGN7hAUBDB1S7rvdxjejcEA58a6KheSWfVF4dnfastm1BrpHgswkAAQxPasWbWm8v8TE4qJU4Ejiu+4+nkQMq1dI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF7CCC4B437
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2026-mar-30 22:40:34 +0200]:
> We should force change of VFs scheduling priorities only after
> initial change of the SCHED_IF_IDLE policy. Doing that also during
> any later policy reprovisioning will overwrite changes done on the
> individual per-VF scheduling priorities (currently only for PF).
> 
> While around also move priority change code to the _config component
> to maintain a proper isolation. Also document our expectation about
> the GuC version where the new meaning of the policy KLV is present.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 28 ++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c | 44 ++++++++++------------
>  3 files changed, 48 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 658e9b048751..e1c028176eb8 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -2550,6 +2550,34 @@ u32 xe_gt_sriov_pf_config_get_sched_priority(struct xe_gt *gt, unsigned int vfid
>  	return priority;
>  }
>  
> +/**
> + * xe_gt_sriov_pf_config_force_sched_priority_locked() - Force update scheduling priority.
> + * @gt: the &xe_gt
> + * @priority: new scheduling priority to set
> + *
> + * This function allows to update cached values of the scheduling priorities of all
> + * VFs (and PF) as result of applying the `GUC_KLV_VGT_POLICY_SCHED_IF_IDLE`_ policy.
> + *
> + * This function can only be called on PF.
> + */
> +void xe_gt_sriov_pf_config_force_sched_priority_locked(struct xe_gt *gt, u32 priority)
> +{
> +	unsigned int total_vfs = 1 + xe_gt_sriov_pf_get_totalvfs(gt);
> +	struct xe_gt_sriov_config *config;
> +	unsigned int n;
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
I will add:
lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));

> +
> +	for (n = 0; n < total_vfs; n++) {
> +		config = pf_pick_vf_config(gt, VFID(n));
> +		config->sched_priority = priority;
> +	}
> +
> +	pf_config_bulk_set_u32_done(gt, PFID, 1 + total_vfs, priority,
> +				    pf_get_sched_priority, "scheduling priority",
> +				    sched_priority_unit, n, 0);
> +}
> +
>  static void pf_reset_config_sched(struct xe_gt *gt, struct xe_gt_sriov_config *config)
>  {
>  	int i;
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> index 4a004ecd6140..e9314f0a9b4e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> @@ -71,6 +71,7 @@ int xe_gt_sriov_pf_config_set_groups_preempt_timeouts(struct xe_gt *gt, unsigned
>  
>  u32 xe_gt_sriov_pf_config_get_sched_priority(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_config_set_sched_priority(struct xe_gt *gt, unsigned int vfid, u32 priority);
> +void xe_gt_sriov_pf_config_force_sched_priority_locked(struct xe_gt *gt, u32 priority);
>  
>  u32 xe_gt_sriov_pf_config_get_threshold(struct xe_gt *gt, unsigned int vfid,
>  					enum xe_guc_klv_threshold_index index);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> index 848e24926ecd..6ab02e96e46c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> @@ -8,6 +8,7 @@
>  #include "abi/guc_actions_sriov_abi.h"
>  
>  #include "xe_gt.h"
> +#include "xe_gt_sriov_pf_config.h"
>  #include "xe_gt_sriov_pf_helpers.h"
>  #include "xe_gt_sriov_pf_policy.h"
>  #include "xe_gt_sriov_printk.h"
> @@ -153,33 +154,14 @@ static int pf_update_policy_u32(struct xe_gt *gt, u16 key, u32 *policy, u32 valu
>  	return 0;
>  }
>  
> -static void pf_bulk_reset_sched_priority(struct xe_gt *gt, u32 priority)
> -{
> -	unsigned int total_vfs = 1 + xe_gt_sriov_pf_get_totalvfs(gt);
> -	unsigned int n;
> -
> -	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> -	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> -
> -	for (n = 0; n < total_vfs; n++)
> -		gt->sriov.pf.vfs[n].config.sched_priority = priority;
> -}
> -
>  static int pf_provision_sched_if_idle(struct xe_gt *gt, bool enable)
>  {
> -	int err;
> -
>  	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>  	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>  
> -	err = pf_update_policy_bool(gt, GUC_KLV_VGT_POLICY_SCHED_IF_IDLE_KEY,
> -				    &gt->sriov.pf.policy.guc.sched_if_idle,
> -				    enable);
> -
> -	if (!err)
> -		pf_bulk_reset_sched_priority(gt, enable ? GUC_SCHED_PRIORITY_NORMAL :
> -					     GUC_SCHED_PRIORITY_LOW);
> -	return err;
> +	return pf_update_policy_bool(gt, GUC_KLV_VGT_POLICY_SCHED_IF_IDLE_KEY,
> +				     &gt->sriov.pf.policy.guc.sched_if_idle,
> +				     enable);
>  }
>  
>  static int pf_reprovision_sched_if_idle(struct xe_gt *gt)
> @@ -209,13 +191,25 @@ static void pf_sanitize_sched_if_idle(struct xe_gt *gt)
>   */
>  int xe_gt_sriov_pf_policy_set_sched_if_idle(struct xe_gt *gt, bool enable)
>  {
> +	u32 priority;
>  	int err;
>  
> -	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> +
>  	err = pf_provision_sched_if_idle(gt, enable);
> -	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +	if (err)
> +		return err;
>  
> -	return err;
> +	/*
> +	 * As of GuC 70.12 a change of this policy impacts individual configs
> +	 * of all VFs. See `GUC_KLV_VGT_POLICY_SCHED_IF_IDLE`_ for details.
> +	 */
> +	xe_gt_assert(gt, GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 12));
> +
> +	priority = enable ? GUC_SCHED_PRIORITY_NORMAL : GUC_SCHED_PRIORITY_LOW;
> +	xe_gt_sriov_pf_config_force_sched_priority_locked(gt, priority);
> +
> +	return 0;
>  }
>  

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>


>  /**
> -- 
> 2.47.1
> 

-- 
