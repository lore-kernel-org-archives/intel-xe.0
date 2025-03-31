Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61314C3600B
	for <intel-xe@archiver.kernel.org>; Mon, 31 Mar 2025 16:16:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C59F10E013;
	Mon, 31 Mar 2025 16:16:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nwmQUZWl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4DB510E013
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Mar 2025 16:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743437811; x=1774973811;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KC+vWIiKyc1lcF5CFa5ZqAAtyN/bzQUhzs0OaPNqLeE=;
 b=nwmQUZWl9HEZB49cUevDT2hdeelH829cmnONpITODr93NiO96sBYY3z2
 pAhvPU/Lehpbfw8L/p5a9fr3hrspH2u0j8QBeW9HWb3nLFMOOkMyZtjr5
 BpAd6pfFj2AkQdBhmfSkPdjOgFzLEc0oPJtdU6CTyUhi0qJnNSR1ue9Ri
 pWP+9gaqM6dob9dwriYcqVDgbPrinCvRfduomKFpoSInSRf6Ls9Qs9LEk
 6qPZiCZ2ImbDfWmNrs1+e9Q18T2nwxRA05/dBHJ8etO+55pFevxmg6Kub
 KIHMlhEv6DDA5I06/30Oe4VNuf6z3A5BFu4gswBoSZAVivX9i3VGPa8T4 Q==;
X-CSE-ConnectionGUID: w0kHV/uLRmC3KZG9AEYDiA==
X-CSE-MsgGUID: WZFdTBjOSIWSy6+KZhrQbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44742152"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; d="scan'208";a="44742152"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 09:15:34 -0700
X-CSE-ConnectionGUID: 1DOZOlBmRie1mnVk965T5g==
X-CSE-MsgGUID: yyuHwKyeTu6Xdc+ZtJoL4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; d="scan'208";a="131133995"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Mar 2025 09:15:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 31 Mar 2025 09:15:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 09:15:33 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 09:15:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VJhEWBEogW+HdiM3OddcQM2iXgzqkpy9HiT2o+XcGf/P9CXmH0Dwr/SKF7zCCutGc0rlVAXnEUCZK8F5G08AuKpb5zO1z9gu39qc9hE2JmhEmSgfdfc6Vrv6nrCB6M3l/KBiFwQGBrN05gE6nUiimpXdFv+paA9N6Flw7A2YuKRcG+hZjVy/mBOaVb1KDxdMOfAq4S6QCHnSNirtiCs+A1ZmyNJW22lIiW7hL+JFY2YXuQC19YCywZrMlzIJONFLakOU0IiDbAC4NKs8I0qiI2TamNN6LFE8c2ASpA0C+hrMobPOUYLNLY7p+Fq1HBAJMIcpOA135MC0I4jSV5LD5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tN2LC9IrZI35d/8o+wkk6IlXomy2iXPTPMilyrfAkBQ=;
 b=aquZZS+vhSfMijndhvnlfcA8lMoUx/RVxJ2n9dcwggDMedaOWb5pFodt+ctKEghKs0e6D6LCj5mo0OlhnzRko+w1c/pzlZbj7F2aix4WDXmdSHlaEWkRUpONuqQ7nIqIZEjj2Nkt/KXueY254j2kk9sqThEJ/WUVYPGgb8yMEppB8Xh9RNAUvR3Llso/okgNBFkDDP4KsswpsutBPpXHUaEZm0DD0xERsAdYAp8Fn5F+8ozp/auJWTqqU3kgYpkpzk3V4YlWhQyDKqDJp2fDB2q3p3y+d8v/tSyW3lNTRYhp6g7IVruwCHklQNhzIIHq47ZHflp2GZAh92G8Eg68dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MN6PR11MB8244.namprd11.prod.outlook.com (2603:10b6:208:470::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 16:15:30 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 16:15:30 +0000
Date: Mon, 31 Mar 2025 12:15:27 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH] drm/xe/d3cold: Set power state to D3Cold during s2idle/s3
Message-ID: <Z-q_n1g9wIEZc-dm@intel.com>
References: <20250327161914.432552-1-badal.nilawar@intel.com>
 <8a514fa3-af9a-4b92-a6d3-3c6764b20a5e@intel.com>
 <Z-WHYbhu1QdjUFPR@intel.com> <Z-bICZUBN_Fk0_mM@intel.com>
 <Z-eDJUtxjzIjGlJT@black.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z-eDJUtxjzIjGlJT@black.fi.intel.com>
X-ClientProxiedBy: MW4PR04CA0238.namprd04.prod.outlook.com
 (2603:10b6:303:87::33) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MN6PR11MB8244:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b7148b5-613b-4da9-488d-08dd706f41e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cvCyQZCTKzxkcXAl7AXiIPwIptBXvCVuEbumQVJwqyhn2vIP9eADJ3y5Be/h?=
 =?us-ascii?Q?VGSLW4/O8SFbDgAMIvhuVtXVwELlgrEVDFlGiNyoj4ICE3/h5kRsWnLQIP6D?=
 =?us-ascii?Q?Q/FCQZxu/yi91l4X2Y/MZrorZHronWg7Evt5xl9I/I+qVOfMIKskFGVG774O?=
 =?us-ascii?Q?b2FdgwZs1lBxywhPC/xjU4IT6tvFjeLvoOIxqFWu9jplbG/CUBhvkx5NoHw/?=
 =?us-ascii?Q?/oiFTjTbbg0glKrIFRiEzum0bicCG60qMpQahkPADwYViLvcqnU/A5GepSPi?=
 =?us-ascii?Q?jojG0c9S2mNlZAA//VNVYSsqxUlIKSeP0GWGfr/RGOO+lvyGWEJmfua8VlII?=
 =?us-ascii?Q?lM/sI9LP3Kd4yzDZ9pdvfv3NDKSr2Z0RDuOJMxx7P1dbmZvKjy88kIkDOByz?=
 =?us-ascii?Q?+d+1g+rPBYkEme+HpBeiKLgo6QTCHsc458ZMmiezSKWi+mxGm9h8xBNSOzq1?=
 =?us-ascii?Q?Zjg3/twEncWP72aKiLV1CYlWHZdEdMF1trYQiysxjVY7nhOBdP15MnwEZ6I2?=
 =?us-ascii?Q?lYgKcp4LvFuHo5gc74t4n26i/gO5+ieTCGyM+KVy133DCC9jfDZ817H/uY1c?=
 =?us-ascii?Q?7BowtqQDegpaCCK48NMb7duAsqsRh0XE5RPpcZeFl6A9LvCc87gsbTnRWpx/?=
 =?us-ascii?Q?+IuKjyL3ldL7E8ZRzYTawB4Pr+Akgtq1CWI5ZJxp1H2+KUWu6uY1PT6prnip?=
 =?us-ascii?Q?HX9qg+yz2QDeDbCm+nAGkiHeAShp6U1CAs0/eBN6n1ytlW/bcA8hZ2biXHwC?=
 =?us-ascii?Q?Deou/jtg57E0TH+LeF5K9Zpgvj+uRbe8skvNIZI/Qd/PeO26Iy+CoNwNOjHj?=
 =?us-ascii?Q?PZZ275mjjo5CUVjMLYme71j+iRvARv6d7CJU6/XguzmKV26xOEu5v5efgoWU?=
 =?us-ascii?Q?j8idFp+F0+RjlJ1yOPY1J7XMOokSi/AKT9ETdrgwgIQUfzp1ZObpw/heJixI?=
 =?us-ascii?Q?AJamGg6IRT8FF2MAE5zxctYvisR+QaMJcLH3eJn9jSPBCrlL0xa5WwNNPkyi?=
 =?us-ascii?Q?EoYJJZqoAXtSKqiFGZj0NgKF7vOzmNLjMNdHin7d1ORk+0YEj9pAuBwPtTyO?=
 =?us-ascii?Q?BmbqCobm03/8NX4zvGd8JFRQ//fn/1MdUR01kml+Cd59m3dtVc9aFArGh3g6?=
 =?us-ascii?Q?FPIWl5Q5PtyVregqG98QOH4Gkx9jW1rV0xTAN+jPf/cVa71EijvHq0doNNaA?=
 =?us-ascii?Q?kuykRXAVBVINgEYmJhl4wAgAisVDMLTtHF6VG+dpiIH9/W9xThIlT8PvTccP?=
 =?us-ascii?Q?wWYf2VL6fs/rtlvHBETJVOO6Yndja+Jp+gL+5LCgxWU5q2Qufqlg5Ht1nuih?=
 =?us-ascii?Q?wj8a88vj2+B/Q8U39WBI8HN4lPRohtAps2MaLnszv8jsIrWLeN2ftSLICyBy?=
 =?us-ascii?Q?fMG9QhYRRxzNkeEdFMm+iRoB7PkpVh59Q5nt3bnxAzyQNGaLWdvQGT41Q3wF?=
 =?us-ascii?Q?RO2Nn3sayL8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nytAP8NZasXH4Lf5mB+BEXJCEwb78Ip5mJ8kC3JVLz8BAkwiruOOp3gJ4jVC?=
 =?us-ascii?Q?kKqoTvWm4vDNepr3VJhQJENR4rLUliss+QhVDyfhhephAlfK8qk4InPlWOKK?=
 =?us-ascii?Q?984KZPxaxwoN43Hge5rc5KBgSwLmtINIRxCO/4jU/o/5xNqItpkAnCdai60A?=
 =?us-ascii?Q?as3wNACEPOVJ+KJuyoS1fFXirnV5EXoJuRTrM4dZ5Hy5M4ZKZvlsQb5yx9P/?=
 =?us-ascii?Q?V+Ytxkq9Wy2KxsdF6rbgMOFtxKCmAejwDer8pkjBcrsla9UiyjbRTIav3Zye?=
 =?us-ascii?Q?v9owkY96D8W3tc3Raa3ztyqMsHDPbh7ohld7G2c7xLu8KzHLx+ogkUTvk/0w?=
 =?us-ascii?Q?oQFxCIrv/mTPgX66eHcKjVzhTRSRWB4dvSxZVZW7TfECZSHQmYBy1+BY63eu?=
 =?us-ascii?Q?uJBQGiiP8dVWbwEyq8bfNUGvx1uodjRaYjxF0TQySfp+88wPVMB/vyR+cFZq?=
 =?us-ascii?Q?93JZkpYTzNJNeBsUcyXrYvIOX9/r36hRSVZNS46qNUxfgb0gxGE1wpbQV2Wf?=
 =?us-ascii?Q?Snh17WnZlCd4kUs2JqXuXucoqzdp1CdzlVhKo/fLUex4ljRwZGyqmbni1KOE?=
 =?us-ascii?Q?0mo7Y0evE2O3PlPG5JiNTQYSJX6tCz/CllC0oUnFu/wnUUaHE6b1HPj2CxCv?=
 =?us-ascii?Q?vrGOKJk6atNawnHvdY25cP07Nn5Zb4tnhdQb5/sBgdPFc3alqvdd26wrkiYj?=
 =?us-ascii?Q?qx43++k7a4/Q8W5wM3UEAiB/EHRM/60cvHCsZ7+Bnh1uBEIONkhIJJC8d/fS?=
 =?us-ascii?Q?D9aiH4t+E5NVAF3U63HIH/aM96Nq0fQsMSMGivcMtlrM4tOHjg6kKTHiRG55?=
 =?us-ascii?Q?Fua7udqMrDdixn/DBV+8Wu6wK4wfPPvkZa2AZn97qPdl+1+svN24pGtMkY4h?=
 =?us-ascii?Q?F5DkXb5dQitRx5GPq3tAKNzkO4AGQ1M/QkB7rB1Jt//1Mi/dn+8Yt0GecqE9?=
 =?us-ascii?Q?/EVfSl9Pz/P1HvYjTsjC+7BbGEGc7GyCv4jizq35cv8eG74wMLq+hP+SuIe8?=
 =?us-ascii?Q?sWDfrr3cC1E0HKLGP+mA3oLm3V8MXe8C6vdPg1iw6FOEjzZRacAkZcnVeFkW?=
 =?us-ascii?Q?jc2hgKM1b79w8tDSkhTFaJYNepa0UA7ZZ/MZtUwZyor3Xx+naSkQJCprtDpe?=
 =?us-ascii?Q?nLQVe53ep1FibfcGWarQKA5aAiAbTlpJNkT5LrQh6APMoJLCh1gMExJxLMsJ?=
 =?us-ascii?Q?HN4EltAIKY1wLy3aP0wn2JCnrJLvfOo+Myh6XqbaTXayWJikUaWXpBdr+uBl?=
 =?us-ascii?Q?SlFc7ywtB2kO/W6wLhwT36chmW9Edd8caX+fF3hCuK6abXIDXmO+ZuGbA3dE?=
 =?us-ascii?Q?dQaSf8H87IP6jLMWKaJvB+LE2Xco5hLlVJ6sOgxU6N7E+/7jwHs1WRkamGkt?=
 =?us-ascii?Q?o7m5XUI665GLr75sZxV6Cro1izFJwxEhrp9aoBWe2n7iRAV76Lj1CQW/RVCu?=
 =?us-ascii?Q?Qy5LoOyV/JWWd+1WYrCX7o5f/S8sDgWzrER93185k2Zy+WltOtwx2Of4bvS7?=
 =?us-ascii?Q?JUopy8H0KZ7Wyla1WkKn7JlpPg3Xru9Ag6LIoe2qv0vOTx3/EAbOGWr/yccn?=
 =?us-ascii?Q?f0Unnnqlon9hqF2K7xjFbJtbCiU2KRObEz/BndAtxLuMftKZFHLYxJcs9kZS?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b7148b5-613b-4da9-488d-08dd706f41e8
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 16:15:30.8360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uu18pqfjTGbHEnHFiC3NLF7F+VjXpExfOuxQDtxCjm46AU/PYN+M4x924MqLVZyoKQgwoSKy9DNvakEK6t2OZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8244
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

On Sat, Mar 29, 2025 at 07:20:37AM +0200, Raag Jadav wrote:
> On Fri, Mar 28, 2025 at 12:02:17PM -0400, Rodrigo Vivi wrote:
> > On Thu, Mar 27, 2025 at 01:14:09PM -0400, Rodrigo Vivi wrote:
> > > On Thu, Mar 27, 2025 at 10:02:29PM +0530, Nilawar, Badal wrote:
> > > > 
> > > > On 27-03-2025 21:49, Badal Nilawar wrote:
> > > > Hi Rodrigo,
> > > > 
> > > > > According to pci core guidelines, pci_save_config is recommended when the
> > > > > driver explicitly needs to set the pci power state. As of now xe kmd is
> > > > > only doing pci_save_config while entering to s2idle/s3 state, which makes
> > > > > pci core think that device driver has already applied required pci power
> > > > > state. This leads to GPU remain in D0 state. To fix the issue setting
> > > > > the pci power state to D3Cold.
> > > > > 
> > > > > Fixes:dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > > > > Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > > > > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > > > > ---
> > > > >   drivers/gpu/drm/xe/xe_pci.c | 1 +
> > > > >   1 file changed, 1 insertion(+)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > > > index 7046e7e9a6c7..3317d475be79 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > > > @@ -932,6 +932,7 @@ static int xe_pci_suspend(struct device *dev)
> > > > >   	pci_save_state(pdev);
> > > > >   	pci_disable_device(pdev);
> > > > > +	pci_set_power_state(pdev, PCI_D3cold);
> > > > 
> > > > Another approach to avoid calling pci_save_state and pci_set_power_state,
> > > > allowing the PCI core to manage this.
> > > > Currently, the above change aligns with the Xe RPM suspend flow.
> > > 
> > > Either way is fine it seems. Or we don't save the state and let pci subsystem
> > > handle that for us or we save and set explicitly. So, let's move quickly
> > > with this option here that is already fixing our current issue.
> 
> On our way to become another i915 now, are we?

could you please expand on this?

A simple git grep on pci_set_power_state and on pci_save_state
return many more entries than i915.

what am I missing?

> 
> While this might be a good enough band-aid, we should probably explore
> how DPM_FLAG_SMART_* work and stop mixing/matching approaches to hide
> issues.

perhaps this indeed...
perhaps the ones doing power state themselves are the ones declaring 'smart'?

Well, on a dumb script here it looks we have over 110 drivers using pci_save_state
and only 6 of those using DPM_FLAG_SMART_*

So, I agree that it might be a good idea to explore things here and find the
optimal settings.

> 
> Raag
