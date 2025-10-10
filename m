Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DDB0CCD185
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 20:06:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 155A210E188;
	Fri, 10 Oct 2025 20:06:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XPQ3brV2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02B710E188
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Oct 2025 20:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760126800; x=1791662800;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3oEgnLVfDLjjRAbg5E6reMUgrkPG7lcel3iswnJtHXE=;
 b=XPQ3brV2qqHKLezvK6Ap/A5EpI4bJJmi5iXc/qa+yENfSdzCeTilVgP/
 f0Cz0Z98yDjk63p0edpW69sDis/yxjXOUDhnzbXHpIGO7FR4OyVZVQClQ
 fIKcKhoAN522HAHEjeUQr2W4riA9BH0ovay4C3H2utXMOIXXmATdxSe15
 7tGLY/mHnqwVq8APIQrWM3gady+LzjbS14zlS5Exs3mTQblHFomPKdSkl
 BrAOlpo4X2K2ZdsGHoLiB3rlZA7wFUwGNVzv6M9xzTFzEHOubmXTPq7Ye
 C3p24sI2jI0HyxPYQEvUPaiC3Wp4bw08g/ATMgq3TDrm8s5vDDKhRGVXB Q==;
X-CSE-ConnectionGUID: sxfYrUBxRGaMr8OinPpJ8g==
X-CSE-MsgGUID: uaj0Y35oRTy9G55l6VWuiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="73693972"
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; d="scan'208";a="73693972"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 13:06:39 -0700
X-CSE-ConnectionGUID: RFMELOttQoWAltO/Iq0D8Q==
X-CSE-MsgGUID: uBQDZlmWQlyHQFLivS3O/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; d="scan'208";a="181482125"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 13:06:39 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 13:06:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 10 Oct 2025 13:06:38 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.26) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 13:06:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QwcaCxbGlfrKKdfUTCCqCx0UK3I8Eq0jRiSCA98DwuiH01SDH4MwJa3nR6AyDb04JeK4WbleGI3R81OA6LbEC+pppBxtGKtx2EmRIexF0Bv9XD14MpOZIN/XO2SXiYh5dEj29s+jcqcAObb97IIJo3i1Y+kE6EqXCOanqQok2XYeFwsVrkUah6Tst6ZuN3WI97VDGvKVjYPXQmPVlvfWyAyAhbjNDwz1s02lJvPMl4z40p6hhRP2CxYUg/xBVgl0FzGHz97RRf+Cs/FiNvARL2r5a6wc/lqYRds8+QMLyY7p2v62v0zKu6wQexGdHgQV7ZS6OMkHorJ7EU1/kCc/PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sftelFUw9Me53BHgftnnuS8AYvUeSTnXzA0BVn8+7qY=;
 b=oKL4z7HXTHCZGuo5QwA79NAk5U/uA8ThPtw0FUlc4rViG18ApfpG7cXA0u/aQfW63yKPVRrNYkOzQt0yEReRNgf4mrC8Xxsf05xXzinOJjezRwmjB8uOu5ss/7UBrDf0tiVCZEzFqDdQjjH9jtabbK7BmUMsBaAQE2T6k/eE6C35IDqJktM7p7qxM6qUDr49AaOTA29hdrZaMLnNxTn2IJgf6xNnjQZv8JotIQn1mn0uo40dpe88bdmoDWfSNKzgqagzhiaUHLOilx6sSviSk4sHNVQ8pqDRR6mzWeUe/3e+LC+mCeV+eA+2tmsUr1hAXYjKhq1siwb7bZ/fr83EeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA3PR11MB7610.namprd11.prod.outlook.com (2603:10b6:806:31d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Fri, 10 Oct
 2025 20:06:35 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 20:06:35 +0000
Date: Fri, 10 Oct 2025 16:06:30 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
CC: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>, Sk Anirban
 <sk.anirban@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Refresh RPe frequency while setting min
 frequency
Message-ID: <aOlnRjVqIxCOV3oM@intel.com>
References: <20251009180853.578184-2-sk.anirban@intel.com>
 <aOgTgFc_-FgrV9wJ@intel.com>
 <694610a1-6735-4875-978f-c626e9300050@intel.com>
 <94d97911-037c-4d9a-a3e4-9b631b30b9b8@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <94d97911-037c-4d9a-a3e4-9b631b30b9b8@intel.com>
X-ClientProxiedBy: BY5PR17CA0021.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::34) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA3PR11MB7610:EE_
X-MS-Office365-Filtering-Correlation-Id: 51b81df6-db95-4d4c-4812-08de08388343
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?BwJV7U4xidmNZ2P2N3Lcvqd4ASmuFi8m+RixD4T0DjQ2P89FGP0GRuq7xa?=
 =?iso-8859-1?Q?k713qONSQmgosVRurtCp/cdU1fr0qPA9/3lvLTcfdZhdmCGIrj/Pqzt+zB?=
 =?iso-8859-1?Q?5b6E9GcysdhJbksX4BI8qBj/QAeAZiQqz6XZ7b5l7mxiEZUl6u0De2uqtb?=
 =?iso-8859-1?Q?mI5UGKqnZwks2Q+VsnbrHt8jX3qhI46hoOv/6qWuY/ErogX1TFav0us6LJ?=
 =?iso-8859-1?Q?B1trcTaGIqMxBKNUPXwhxPVI8sEJ5G1ksCt5NpLACyeaAtHHLNPX+S6sZ3?=
 =?iso-8859-1?Q?xeUK0DBE4Sooeo/UXnMADIMTricfmL34Gv8cQt9d6UTHbblEZsPDvm8mAU?=
 =?iso-8859-1?Q?eI35wQz899Ds+t510rmmCIiKMlJs90uq8pvfmuwLpSMlEs9beXTemntW0w?=
 =?iso-8859-1?Q?UCoSKQELQNZWs5GBjFCP/mEaDjFts2G5gSPjprWOnhZJQXl62OQfWJjmzW?=
 =?iso-8859-1?Q?/KO0Z/DAlo8cAH0eKcjlT5jFt3rKmx8sP9TZLUjMWYXyuM0FtnzkX+DMaZ?=
 =?iso-8859-1?Q?V9PAVZ8Ci3DDMNDpj5eG1eFsniGyNfzJPE6VWBS4OuJOosyzVIKwMh/yRb?=
 =?iso-8859-1?Q?GoIlf846+sLtwzNc6rXvD+i81LZOSDlM3qlIcYMHIT3qYIYhe6UI1dCVgY?=
 =?iso-8859-1?Q?q00AuJuqwoco7L5YHIFvgKeQ4ZVOsnl/f6TCZhsK4Z3ixEkIAWIDBg3bx+?=
 =?iso-8859-1?Q?da2JVKxXz4XtyPXv1WmeA3FUrFVILZifBFcO77Qakbo7/YRNHAlmZygNgT?=
 =?iso-8859-1?Q?WzSSBQzAyPZJ4CtdqJek6FfRkGKgg3ZUI0zjgKix5Nwdf291SvERMK2ebr?=
 =?iso-8859-1?Q?IFb9XyYAnOMCAGRtcAdjaeLreO7FWG3dVphSxf5TS4YAKM81AAutZQKfhv?=
 =?iso-8859-1?Q?4vAe727ai89kIblIJDmfXKIiKOxFCIpAenMOswhIw1Tk5ClGwxkeU8Unsm?=
 =?iso-8859-1?Q?RwQ1JidgAMWsOVo0mvIUiztPlFuNixVRu6f342o0GA1HCGem6ew6mpDUlr?=
 =?iso-8859-1?Q?9EwewOEZRkVKn6S9h4h3wv1onCtYpm5KQK0AsuGx0SbEh+Ab33IR3RRvyU?=
 =?iso-8859-1?Q?jDC/N2od1hGFTWlYEduEbE5MjCNTZwk++esHULYgCSo1rFPgGhq4wJUIus?=
 =?iso-8859-1?Q?twETn2NJ2z3K3sBEUZNeicJgeQUz9jNdS0u75LMTC43q5NGxNUqqDnhPGD?=
 =?iso-8859-1?Q?tfk/Dt6RkrKBVEbBuIpubQaG/HiyM05mmt4BZ37pyxdZXoKPIVnfN71tbi?=
 =?iso-8859-1?Q?kFeeAv3jR52KQzOWQErjCDvU874rqwaxVSKtQwiPNezR7VuUkKyIe+9Al5?=
 =?iso-8859-1?Q?7TmI0jX0fo9+YXb/DuBsZ8PciuK0vRYvyskaYwWPMKW04UIeN2t4giv10L?=
 =?iso-8859-1?Q?L//oBbC9ar8cDdeX9qcWaYvIPO+KrAOQZmN9GtBZYBgve9Irk3N+rDoCKC?=
 =?iso-8859-1?Q?VnrOVS6JA01FYbyWqQJiqSzMpxFvedMqYgsKDA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?lhmWXhvpLdiiJ8i61A/OB+iCQ9lN+mIRLh80XpWpbNbXVns0Rt0fG3vCPr?=
 =?iso-8859-1?Q?CbaXIhfdOmOLhUNoa+xf1v1RH0NGTAYpYlufCYIBrecF1kofsO/5YqePfF?=
 =?iso-8859-1?Q?QbyO4/vQPg6WiwmSvEYrQSTtvkf311CBTYa89lrs07SoaBLWulV6xEDyq3?=
 =?iso-8859-1?Q?LcSfhJiWfKuUx29fiLW7aK4nggiQ+DV5mYzq3x9KePovNnWLZ9mu9qih0M?=
 =?iso-8859-1?Q?fTRh2zP5DFyDyyHi/4rdzgRgAbKLkbO5+5Pyz4UPeEznyGk9p+9CHQSJLS?=
 =?iso-8859-1?Q?nwHgZ3+OdwWe+j7Gf0aqKfhuhyyfCsnRyd/aBT3Ge5XVuzP6N3gKTPnYLN?=
 =?iso-8859-1?Q?5FElB6PI3S5qnHMUyJcLyFZuWfnOMJHxJ6Z1wuW7EFui4iFTaLwZj8fddl?=
 =?iso-8859-1?Q?7YcKsQ1NqDILQtuvxcxP5hzyNK4evVYtF1Q7JdQQEQppsd7MWM2CyYa663?=
 =?iso-8859-1?Q?67KPVJWQiUCXOhjECqHgAPn3J7EpL0QD3NADAF0AhgpXRPZj9NuqL67CEq?=
 =?iso-8859-1?Q?W5bq0yVAptZTqJJC04kq1/mbu2n4ySBRwDTYoiP5o+pyIUVPZUcyh1IJS6?=
 =?iso-8859-1?Q?dJdXlyV34KR8BUFCzSU5L526J3JnQEOsIcJTlnX7lZtUnKyrKIyV4K2czg?=
 =?iso-8859-1?Q?Hahp2EM7jpH9e5kLjCs8Ge5b4D956UDbI+zklGegI1/wAQpPtVU48Ox5OL?=
 =?iso-8859-1?Q?mW93ny7VwEbgmWIVTdCGSKjyj89TIJKXZVhlV4x+9weGvXCXxc98pojNAU?=
 =?iso-8859-1?Q?G/iSmM9y/EAEeuCg8NXUqiKkAgdEgaTfCo5im4yFFJGdJrR1cNL79pY1X6?=
 =?iso-8859-1?Q?3ztKLnNXpdj3Iv2fJq1RXlvZ1lpHgCbm+O3cxSgGQYfAt+r7vXjlKRoitd?=
 =?iso-8859-1?Q?4jUuhHNkxiEhD544neyl8Ads5L5FSOCW+ykM6BEfcZ67SNaxTpHF7Ya0MI?=
 =?iso-8859-1?Q?bRV42jGjDt8ybj9CpdAN5BhHGsy/Rug6I6apMNtZCtcXu4JM4m0cG+gswN?=
 =?iso-8859-1?Q?SA4iV46D2Az/eJMXEttjusxM4LI8xsPyNPMlzdZKXTRqm4CV6sd3kCY1qb?=
 =?iso-8859-1?Q?qQmmu6/etTJImV2Pfbo+w9bkbINFWswtMJ1y6nBMSsVFYFt0qczB8Okdvh?=
 =?iso-8859-1?Q?mkuG8OWNaATDG5S8hLL2QcORy43dr/E+uSmo0UB7A/ogD8lsM4f7z06BvQ?=
 =?iso-8859-1?Q?ZScNP/2+erkBTi4X9Z6e7lZrgu7iV590kkI62sbBYyCnrqVSp+V0FrMOIL?=
 =?iso-8859-1?Q?K1gm8FS2Q/Xa/KUygNt345pNU6Sm2wcw3zOMcUnAzjp1z5FR8rsdo7f60l?=
 =?iso-8859-1?Q?r7iFCxn/Xfyrc9lA52FL0qvxaKVOIMy1Ut5FQl2gWpQuvbonTTlyfF4ZZc?=
 =?iso-8859-1?Q?NniCbcMkI7MxAFi0Op0KkuRoExeTsXn6+3xw6Xubt2p+W16iSFTP6iBRmT?=
 =?iso-8859-1?Q?EJHLEw2pQ3FFVoKqvb/tXBKSov2vWTNryECa367Zdpedo4TidKB0j/IPGS?=
 =?iso-8859-1?Q?oh7if/cMOZkGfpUQns0yP2DL0C8XatkOYeVhQnUWIgcg+SUkHOOcSovPDN?=
 =?iso-8859-1?Q?NKBgGqOgeD5w8riGoG9IxPA5obkvR3x53UYTeCuAMhcQ5qEIimltuzdJF3?=
 =?iso-8859-1?Q?vCTm+En79FmLS8+/SXeqmYl7NZCZ++G8Wk2Mba2Eg28evrMhZrNBNmGQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51b81df6-db95-4d4c-4812-08de08388343
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 20:06:35.0525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TS9dl2zA7y9sAb48qInReu34n6YXUXuOKJ1ODmh+sv1/d/UzjEIqp8P1QHm3wKwg+xrC55zlzNWFZXSZILdRrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7610
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

On Fri, Oct 10, 2025 at 10:29:10AM +0530, Nilawar, Badal wrote:
> 
> On 10-10-2025 02:17, Belgaumkar, Vinay wrote:
> > 
> > On 10/9/2025 12:56 PM, Rodrigo Vivi wrote:
> > > On Thu, Oct 09, 2025 at 11:38:54PM +0530, Sk Anirban wrote:
> > > > Replace cached pc->rpe_freq with xe_guc_pc_get_rpe_freq() call
> > > > to ensure
> > > > current RPe values are used when setting
> > > > SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY.
> > > > 
> > > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5166
> > > > Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> > > Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > > 
> > > > ---
> > > >   drivers/gpu/drm/xe/xe_guc_pc.c | 2 +-
> > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
> > > > b/drivers/gpu/drm/xe/xe_guc_pc.c
> > > > index 3c0feb50a1e2..ea1ff96bec32 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> > > > @@ -330,7 +330,7 @@ static int pc_set_min_freq(struct xe_guc_pc
> > > > *pc, u32 freq)
> > > >        * Our goal is to have the admin choices respected.
> > > >        */
> > > >       pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
> > > > -                freq < pc->rpe_freq);
> > > > +                freq < xe_guc_pc_get_rpe_freq(pc));
> > > I believe this is correct... But wondering if we should entirely
> > > kill the
> > > pc->rpe_freq ?!
> > > 
> > > Vinay, thoughts?
> > 
> > Makes sense. No point caching something that can change based on thermal
> > conditions.
> 
> Vinay,
> 
> Consider a scenario where the user increases the minimum frequency,
> prompting RPE to adjust accordingly. If the user later lowers the minimum
> frequency which will be below the RPE value, it will result in
> IGNORE_EFFICIENT_FREQUENCY being set permanently until the minimum frequency
> is raised again above RPE. Is it valid behavior or am I missing something?

This is the expected behavior and the reason for the flag.
Unless I'm misunderstanding your case here.

The thing is that if we don't set this flag, GuC will always oscilate
between the RPe and Max... If user is manually request a min that
is lower then RPe, then it wants the range min-max, not rpe-max.

What I cannot remember by heart is why we cannot just set that as a policy.
Perhaps it is because if we do set that, we lose power savings.

Also I can't remember why we don't set when user select a min > rpe.
Perhaps we do that to have a way to unset this without having to
introduce a separate file?!

But what I can remember is that this patch here needs to pass the
igt/tests/xe_gt_freq cleanly. That is our API contract for the
freq management.

I hope this is the case and that it was checked.

Thanks,
Rodrigo.

> 
> e.g.
> 
>    min  =  100  ign_rpe = OFF
>    min  =  200, rpe adjusted to 200+-y%, ign_rpe=OFF
>    min  = 100  which is < rpe , ign_rpe = ON
> 
> Thanks,
> Badal
> 
> > 
> > Thanks,
> > 
> > Vinay.
> > 
> > > 
> > > >         return pc_action_set_param(pc,
> > > > SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
> > > > -- 
> > > > 2.43.0
> > > > 
