Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F8FC2BD09
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 14:35:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C82F10E099;
	Tue,  9 Jul 2024 14:35:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C+1p78uj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818F510E099
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 14:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720535727; x=1752071727;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=255owZ/dpKQVyEnGiv2/ixNY/p6AaZeuvsWAAezWKFE=;
 b=C+1p78ujAZMv1RSi20FwZPBJrtUkf049W6kIGJ0CYKeIOZmY9/NSKtTx
 EtybcKFh3OKZbBZWhP5VJhoPfpwiN8oY65pF/VGlfsRlQuU5gAEo4QS+U
 mRgBe3Pkd1e4M7xImGvL1viRpfqW1FZ51gAwvI5o3/y/gV+Z6bzAUdLqV
 dx7KRium+n2+cm19vzqeftPW5FZ3eiHRXwmJKvFFrcIBod5EaxIyuQbJG
 1KnAc2wsEgZL1WMG0Pdhl2J4a4RN9yZwD1Cp9D8KWQy+KIywchxjWobls
 s5av3MVePWchfrjT5ksVmebE1HwDNyGpaCJ3QpnE736wW6oBrBKGR17zT g==;
X-CSE-ConnectionGUID: Omy0sysRQ+C9q7zaM9nqog==
X-CSE-MsgGUID: dRqi3fSRQH+AaMUL+8JM6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="12453888"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="12453888"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 07:35:27 -0700
X-CSE-ConnectionGUID: EAKMxDi3SkakIrEMIZPrcQ==
X-CSE-MsgGUID: A3V3/UQEQ/Kv2b4DGQ67uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="48320101"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 07:35:27 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 07:35:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 07:35:26 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 07:35:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EiKI5XmTLAM/Ch7xLg7DY2n6Tqz+KoKaowMtJUIF7K2vWNLVVeNNhXz0FUWYnxv5X/eJqXjPdFGPcKMqWBTBqNbX1FCg8uypjxchTVGilQ6d63dZev7eyZYZh+YHSUqeqzBNSoPUdkU8607N8haC1KRtjIknD0TDNEdassgBk88S1iH3aO42e/obvLKdUUgEjHcdvXQ8ddbXTotOcBI6TqAl9YGLqCuritHxKkujyc6w9XRpOsYcDOkhn5zVw2pd4oDf4EyCsgisj/5FBJ/08V7dsbZRRzGju7FW4PGUpFPl5ZL3ktDGwNvadY+E2kw+yPdd5yo0YvykDo8Nmwt2rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=255owZ/dpKQVyEnGiv2/ixNY/p6AaZeuvsWAAezWKFE=;
 b=mO5H3ftqBf7dqQ/baK8TwJD5sD63mykT/dt/CERCqPu0ESGTa+cW0UVx7+jZI+BEVvpAxO75q1IY/6NLKmMldEY7gv5q6S8u0t6OK72RArb4g5plJOfv+yWuLF2JyXhlym5mLXFky0dF6fwYFZW62vhPeQLhJarDrp/mjPEd85hJMCazd1xFbbp0JN5TWWDP796h9KjaKZYUtlW5KJVOacIVXMeBIhLuKr+IwMc7Izu5ulE411iOyazor88Tf42wJ3y1yAJgmoOMlko/N7NNRCTqKEjQKqMaOnXfHdy21e+cnjuewaush95IWGPsYh8tXzvusSKTkkZOsZzrEdqJKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB6544.namprd11.prod.outlook.com (2603:10b6:8:d0::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.35; Tue, 9 Jul 2024 14:35:23 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 14:35:23 +0000
Date: Tue, 9 Jul 2024 09:35:22 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/kunit: Kill xe_cur_kunit()
Message-ID: <w3y5d3y63mi6weg72s7kc4vcwrnyuiay6stcyjw34j7z65epwy@ynsmna3xcrxh>
References: <20240705191057.1110-1-michal.wajdeczko@intel.com>
 <20240705191057.1110-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240705191057.1110-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR03CA0125.namprd03.prod.outlook.com
 (2603:10b6:303:8c::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB6544:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f4d9f31-a39c-4375-29d4-08dca0245db5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UjfzHKu235Yp/spfFKPVd8rjyldYKy3b1nhxLRdpUSlrJuR52tjTHm+YYo1C?=
 =?us-ascii?Q?Y5C/B/VnXoWIwatbAXiz1tlFMNBw5Tmju2BX01QqLqgEnHIhRXYK9okMJvjg?=
 =?us-ascii?Q?YcXKW3DwypGatiucCG/HEOqU8VM1nAfTtZUrf7Z+S3R2DpIMmO1YyyCJUSRI?=
 =?us-ascii?Q?+pmp8Yd+VSaRsoJD4iVclrUVYV/lLIjf8JstZY0rmFitl9hAr/slPHGbnpst?=
 =?us-ascii?Q?LDuL9iuT2weHCrSpNg1MU+rr/GuCg8SZwUl43Bl2Lms1p/JQI5YdBXP0r6VT?=
 =?us-ascii?Q?H6RqdkTlEm14NU1rpLwLVfpO+xPAOzGgY7UG7xlNdIGr4eOs4NBiJ3enUhuS?=
 =?us-ascii?Q?r4NIbCl/nk77W5g/mWUdXsggGhKzhJbecEbNVgBScvkY9h+hOvxJeMyYFkbG?=
 =?us-ascii?Q?aR8942Bbc//rgRd4syDRHVt2WqvGFFezqRItOa7K1Wb8rak6tRjPH1zY9Q4/?=
 =?us-ascii?Q?4GGJSxjgzo9su3IyRWfPG0UHU5fCFJjIB1q3DuTVivP/fEUsSSlIc8pTKR9m?=
 =?us-ascii?Q?UQ6Y6oZOdD6/Uf1Lk9Gx3jOqte+mOAPcsedChV5GgNjCaTaAZDQWebULru7y?=
 =?us-ascii?Q?kvLko7EHBp+B2mFv1uyKY4HDQ5RWD2CH5Lmw7P75Pp2Rgbc64cJPUiu+25Q5?=
 =?us-ascii?Q?u47nxAcLkqA+ZdlNOPkEMLNunusDzkw3sJALCKrBYxWNchj0QgsuPSwWuKJS?=
 =?us-ascii?Q?6i682VCe0t7QrtdnoRgSKYAqPMNFW7ZXU2S8aD+XyoZXeoxX6p710/5sGTcM?=
 =?us-ascii?Q?7BR6hfHCTo3PZsmF/Ae2R12//5apYGKRhXq44HgQeNaJZ5Mv28qk+SibOGvc?=
 =?us-ascii?Q?2jAK+/4N76qwALPOTRopAc6M0tFQt9d4eYlJbjebqPMNo1xW5GlfLJVNstUM?=
 =?us-ascii?Q?PfZynwmwh4B2azqHS7m43iQrwADw3j2nc1cdMGCMlw97aBVRZgOHBX3cNhSg?=
 =?us-ascii?Q?Zi80onCCZdcelWkiZ8ky0FhY1/K+jxbHkbj/cTmguqVCXx1kZwVncL9oOA3T?=
 =?us-ascii?Q?tspiTF2uvszrfpPkp6tNpFqc2KWt0KV4S5sT5By7g0EtIVAMDwTz6PW4SPOl?=
 =?us-ascii?Q?Yt1FnbZ0+z1ArlJBdcwH7rmf8ldwfRiUqp/1sWLxJ3g0XwlLuX284JSsD4cG?=
 =?us-ascii?Q?uM0wZsuXZ+meZ9ynSNsNvZvOfE/077dXXO07Ds8nxx6pK5IhySMKtWxVyglX?=
 =?us-ascii?Q?XIhUp/w4wKCQweQMCBqIjU+8wFGGsplq3ka6YhvyesNgdeeFkFmU21EIk8mn?=
 =?us-ascii?Q?1GWvtGMrnq+MCdg0HJl22zrgFZQ3fTVRpMnLgUGfIp/j/alqGry4PG9HYStO?=
 =?us-ascii?Q?XXCWevlvGFLIeCa6PDrl0eu7eRvTKHuR/LqReXtrh1ylIw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4OMYszj8ffJ63rD0LTdlOvaOIS005ZVhQPuppXM1lWCWQd4bfB8fXZpGGT2U?=
 =?us-ascii?Q?XQlRBPs2/vDCi7fa+RPUPIbzVJk1Vz1rcpauGv4W/Zn7NZHv91tdbnJMhp2e?=
 =?us-ascii?Q?fFVXOSVAoPXUKYMjCe4zrRhr2fWgqraj8OPooV4ju+vC1k9E2wtPV09M3nDV?=
 =?us-ascii?Q?cJSJEQ+1zOPa9sPPRuJDi3F3vozgPtcpIkNd/Xn3T6nNbGZE5oo8oJMUmQ5u?=
 =?us-ascii?Q?VaCcIis8YMMCL7SxZ4wqaCSyjirvGsBNvpPctGfimtM/DkZ7E3SeDWV4fiHK?=
 =?us-ascii?Q?IB7zdaK75JiUyORGePKEZg1dJEJYtlQEGa2OFBOCMbrQuW1XSvTGOEnov9qw?=
 =?us-ascii?Q?mKqu52yv1NgGMIlVNT59zUAE8YnxopjpDIPFy2hRrTmzan3/jk3rlzMzubAT?=
 =?us-ascii?Q?48YEj5MkTJ0+F5+Z1rSR8DENrimg+PLKzn61UM+58a+JlvLaHK4kDcDo+h3h?=
 =?us-ascii?Q?xg9ac0pZ8llXkv61jI1vKkW2mRVT4IDYm3+y2lACWuMVhDbuHaFR04R2kKpe?=
 =?us-ascii?Q?ijzkCiWT4SkjBGNcM8xFCF9fPMtEcZLh5X6Y8rBuPEodd7HwD0SMOBT4sur7?=
 =?us-ascii?Q?4b8cZ7LXTAruKuPTVMUr1CVbGfGb+nbTeeS4GmgXwvqCBlNUq7FO+A00wH2q?=
 =?us-ascii?Q?v6U/GrGD7SSC+nbNhEgZn/FXDkb0Apy5ilZpvgB+5vpAjn2mg7a1OqdO8zCT?=
 =?us-ascii?Q?7JkQUWD4kYBCM660SUhhSEDDrmRhPbnOJDWu/7yBbBidJqmnbtkcC2GZupmR?=
 =?us-ascii?Q?bwyMAzeC4YURRj2NGvyI6qzvcZ05Xplumx+almJRqxRXfxCAbMmrIzhCzEGo?=
 =?us-ascii?Q?Njynhn0Au/xQQtXolVSTZDS45ioOqqBDSuc5hMyKLlK3+vE5S95LBMHBqvXa?=
 =?us-ascii?Q?1dpLw+YPQW+yu6TeGk+99uf0aSkkTo1DHLmigfrPYxTfZDZqB+TnItp584py?=
 =?us-ascii?Q?8EytgVbHSonih6W4cpVrwDH51mTjWeikGyfF55MFr8/xNaObpNBszT3ykfyK?=
 =?us-ascii?Q?SNYusbKEhRy9RBSGrRMDRTy3ObuhGcvKe71Zd4/4Qyf5poSz6FiYFfdtd3Yy?=
 =?us-ascii?Q?jHuqqkIcaXhkyCCTVKjcShq6odVPs2jwQyJ60ajWy3otpQCS+zGTyy02VnoB?=
 =?us-ascii?Q?86EIHJ6DocdlHuO2DNoIAmr59yop4FnJJVoI+6GamDi62dzFtPiLP0Uddj3E?=
 =?us-ascii?Q?un942B4TLX+iAEjo77lqdCBvit81QfakQJkdiQPCQli36cYh1LCqRUQzIwFB?=
 =?us-ascii?Q?xJqlH7QsC4g8E0M+qG6mO2T1o7BmdR2EL2sSfUIMkNMimI89+9tglv4eTneY?=
 =?us-ascii?Q?xXidezYoyVqGDvepepRGIGdvypkMIWBWVbOnQrfULeAFRPF2DwbSLRy4jc/f?=
 =?us-ascii?Q?gpePwLvvUF0nF1B03wRIjzIvy9fvXTmpP6Y8+9VkwkJ6a9IXx9Ve8wUY/Q0I?=
 =?us-ascii?Q?M7OKnRVBg/RbhbbsNPINUVKI0k2n3vaBGE4iyJYZB4+nCxbZeec3W0b8X03t?=
 =?us-ascii?Q?vHgr0OZ2kp/dDpi03pHgi1UtQN6xHEpRe09pZQFJEZ1UjcUhCOKqkNAa5jRa?=
 =?us-ascii?Q?9YiBok3dfJtYTbiN3/9nHLfNT5gzMCHUJUUA16IbdSPIVFSWA0G0gzxO9zC7?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f4d9f31-a39c-4375-29d4-08dca0245db5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 14:35:23.3153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zfCezJFIHCSc8HM5B6Ejplr3GyrTmG1hvIVpG9lOjsu+1FjftcZJkmuEVQfURMACKZ7hLBunk6RlSPXw0c0DU8GG7dY3fX8UkDcL0+1SHYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6544
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

On Fri, Jul 05, 2024 at 09:10:56PM GMT, Michal Wajdeczko wrote:
>We shouldn't use custom helper if there is a official one.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
