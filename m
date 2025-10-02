Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6B7CAC5B8
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 14:29:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF00710E7EF;
	Thu,  2 Oct 2025 14:29:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dHlvXgG0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C149A10E37A
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 14:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759415377; x=1790951377;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tQDRCs4qQjxuwZVHNdczOyYmdgmQZEFYuiS5d/272Y8=;
 b=dHlvXgG04NNl1np7s2RTzCiFObmn5ejMc71/qu021sEn76FzPn23d4ta
 SW1EsNec2QZEOU7jtmX5YbyxQ1TRfA3TiJNyvUJGxvL8xhKs9w1ZJcvHQ
 pFYJL5cywdS3dvoGu9rqK6htzKn3StBN2uNMFdrGpjcazNdZsYK1k0MOC
 iLWWb+c7t6cFXOEw5ne8h6hQaeVF1nV9+SFBvVR3NN+HO1SmZcqDvM7RR
 KwQUHo2rvwah1E//imDAxYZLFfpyiDl9f8bI2iiYAuoTcTSPF5ISkxWGl
 btcxjWHlscrc+DE0Vc0PJuqN5MbMfcslTAjhzql/a3No7BEEjgm5o8i1q g==;
X-CSE-ConnectionGUID: 2/BX1OFESMGy+JEmrUXYtQ==
X-CSE-MsgGUID: 5NmP1uCiSfOb9X+0WTtX5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="61744245"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="61744245"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 07:29:36 -0700
X-CSE-ConnectionGUID: FlI0NNE1SE+bDr4Uc2l+cg==
X-CSE-MsgGUID: wV8/d02/QJK7uHe1XDp4HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="183462055"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 07:29:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 07:29:35 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 07:29:35 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.67) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 07:29:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pzdY4Nege/KNPHkP8v01TBur3k5gkFiZqkJ9X6q7hVA/2IJg/lP4w1ueWKXX1AFnVA15OgwJSTRmja9/4JwtLX/q/ycFS9+ZSTfOLgXpHXc7VXbJ+sx8YEt19bFPquQRTSypuQiktEOcGmOQIt8iqr/BZ3qS296hFNqIRBcdZEzpXeq4Xv4q/6dCGjAI2zQYx7ELCye708/WtjiW8I2R8mj2rB/qNH1FweMPXLjFE4tHTfqV3J8Db4vDRdnZSPaxdZDJa4hgf3B0dXScemMQLC1XYKVAoYkrNU/ieGq587hlETQ0Yq0wMGvGIiVpNxcSrMgFIoDj3eqIpy0nkPNK+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ZoTKGyixwW+l9jWeHofdictY96xm9IYx3DYWmIbNSM=;
 b=J0LyWX6EC0Mv32VcibxDkuxGXoUOJH7Bb1IRUa/kIqMFVcrzSAuuKusHDW9RNPE7j7RYtfgBFdG8+PdkwbBXkXvLWaDydhcdXTuVu8IDxe9I/01WUB5tES/9mrdBNVoRm452Vqvc7c4R6wyOS/UQPnsmgta8IkSqhCBEYy2MC3gK0Tukgrh4Q+K0Vs+dAaKk3rY+Pszx7A4kqE9Pu5Ef4ampEQUyddn1tbjGp6Q6y8931+OnbC3fVctjQOnMErUmjX4Uf4dAWmJPoMTZxPsmykJLeYNmEMc7D6WjCyUTAvOHdvGGFYgnfDSSFH2tczjjr6pkQt/u5pefYUpgCMmHPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MW3PR11MB4666.namprd11.prod.outlook.com (2603:10b6:303:56::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Thu, 2 Oct
 2025 14:29:29 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9160.018; Thu, 2 Oct 2025
 14:29:29 +0000
Date: Thu, 2 Oct 2025 10:29:26 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <riana.tauro@intel.com>, <badal.nilawar@intel.com>
Subject: Re: [PATCH v2] drm/xe/i2c: Don't rely on d3cold.allowed flag in
 system PM path
Message-ID: <aN6MRnl7ZdRJCx1x@intel.com>
References: <20250918103200.2952576-1-raag.jadav@intel.com>
 <aNul5umIUh3tf49g@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aNul5umIUh3tf49g@black.igk.intel.com>
X-ClientProxiedBy: SJ0PR03CA0240.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::35) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MW3PR11MB4666:EE_
X-MS-Office365-Filtering-Correlation-Id: a06a6197-4522-4f00-e185-08de01c018a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vflM5zk5MWw34P7JIjns0/+Q+NI0xz/vJel3oSi0hPQKKLtOkIBM30Al2zZe?=
 =?us-ascii?Q?mmrLr91CHkicg8WDwfN4vchQE4wJx4KI5hFLQdJKkVXycHsO22vMEnehMyi4?=
 =?us-ascii?Q?JpibekiQZ/MPpJrFP2YrFmM8ejBjHg1wot7JkwXjF6FDr8M4s5bPE1Kk3o3P?=
 =?us-ascii?Q?9u28HWIAHEEC5ivEseMe0XEb3Yl6BGFp3kdckcGWqgTuBpnhzkewywMFuCqX?=
 =?us-ascii?Q?ofBCplVyVoTsxOd3Sj9usQgIwIjWeFg1F37B+0Bq4/356ZC+IoVcpveXptwv?=
 =?us-ascii?Q?oHr4FDxdeCoC+pXfD+N5FG/Oy1+sJV89DOycv0LTMBvNUYE//unVRG6Rh1DU?=
 =?us-ascii?Q?wdYoj6nJxquMl8e0MpnnGy/hp6kXbmGLrESZEKmjVOA6xhbav/ChYmAoFdfO?=
 =?us-ascii?Q?uZRALrRrsF4GOq21qdUWbQ6xYYH7q6HG2d25S0Iko8CjBV0hiRzUeyGeS2Rz?=
 =?us-ascii?Q?wt//YlJ0N2jPu/NGT4rJsIroeeTnE8vejWaB18fmozOkewdLyilxCRaRzprv?=
 =?us-ascii?Q?wG6gh7SJmTzELDHsXiBub/e4CVNmz2w8E92qEQx7+t17ccURLf6gxOD0dkKY?=
 =?us-ascii?Q?FANYm/T827nDBtgubFpE8iIqmidCU2ZTAwcNLsmvqX9WExZZKzv0OAPAXNYQ?=
 =?us-ascii?Q?xGEMNJUdgtuCPaCupiWMm/Q3+6xbfRgDdiDfhx4KV8HjvAuem7d6a7xPHFgl?=
 =?us-ascii?Q?ueR96qazscRnEunVwrx3yH716phXOBZYUyyonuUQN3Dkh9Hs0dW5mbhrTxoe?=
 =?us-ascii?Q?UYrdojGM4vGa+eJdJCNDh+Ggih0QR/XMXLZhYAv+PxBBUsNeAxpGztBFpHBc?=
 =?us-ascii?Q?o2kE8CdL4ZFgw/0f2hIIDPx6AedZu+zq+33ZCAEMJIC+OpTrviEqQGuP7OYx?=
 =?us-ascii?Q?98q29ZB3hyNm5W317xh0IhdgFVpRQ1SXe/e4QLr5suOYAC9JmG8eHjCFXFm1?=
 =?us-ascii?Q?wP8ZvCG58r6KVfn2dcA0aV/d1QLfMptmStsU69Q9CRgowlYj2pojzWZiCCQO?=
 =?us-ascii?Q?51TboYQcpvLWhiiXr4OLgEZcgd6lsYK1CUY+/xUYFVIQ1JDeCubSyYtjFea2?=
 =?us-ascii?Q?pFHmRTaGZ2VRpHlV7KYsFv4Y41u+StFzM+u+QvUECkfmudc0EsEH2pvtRmee?=
 =?us-ascii?Q?fcVIMqCe6tLZydM4soHTbvfcIURRASE3OsFbZM6laFK53bhq61eXegIsqoc8?=
 =?us-ascii?Q?FcGSp+PTwLJs1QMi1zJ1t44bwO9l1JjE5u3IZXjpV9yDVrAG/OY1Zs8XVYVt?=
 =?us-ascii?Q?GwB0Urne/TXGPsZS+gp98qX3mwRnG3vZ2fxOMsPxc8KSaWeJ5EAj6q+ZT6j3?=
 =?us-ascii?Q?A00JWKAt95m7a0hGEkOXvURgwyEjpZoW5OLhc19LTuzcyl31Z0M0QHSBhqCt?=
 =?us-ascii?Q?Tv14uppQBOHoaXvk4UHVE5r0dud04VCOQIt4GzKRim9GjQoZH+bP9j8+9LdS?=
 =?us-ascii?Q?iYt8oKSu+Qq3925BoX8bbFtCz3HdMP3+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XaCtb4f1L9Houh+wjp6WBC2ej//rhrueTMnB5CK5v3MuMySdPYZJ5w5/oI6/?=
 =?us-ascii?Q?BQLb4WNcajRhdkswpdU715i7Wyc+NmOzizsMGwEoP2rW4YTJ4TycMzIk8esm?=
 =?us-ascii?Q?3CMil4TPaDGUE1QaDvsSsM+f2hkRtGrYEW0tk5F+Eju04RK90bkG/Nr6h76J?=
 =?us-ascii?Q?AtdP6nU/YyiD5YPP64InL1UbmXEclD/91f2MoHp8GsbS/4k3fSZ0QlANgN1C?=
 =?us-ascii?Q?wgOQap/1QS34wb+aL7bM7p21wJz6NB6oKio+V5DY6sMruY1R04Hvry9P8S/P?=
 =?us-ascii?Q?LIxIEt2qu9WFeF+A12BtZrnQ/iVCo+JlPW7aOXR+YnZJC+vofis6pJhgQHbo?=
 =?us-ascii?Q?9XlaAx/icRCMYPl1MSY2GmW+ivb1uQ4NBdXTprQ2ivFuoTinKhL3nvrhSP+l?=
 =?us-ascii?Q?jiV++FoQ4jibTXjimerR3lO6YaCFgQD32x3GZuCB0NQF5cHys2z19YSVXtFU?=
 =?us-ascii?Q?Ruz8+g1bYQldwAcdd71ZxAJFxxYLw/Zs+GK9S6PhpmgUqsCgZzJDtT1VpL8m?=
 =?us-ascii?Q?DjphC+8XRc9m7OnhTlrCa6pvktE/4CosSByMCmxlBbSN0fSHdrcbebdpWUhk?=
 =?us-ascii?Q?lC3oYVLLsB5RVPzgJCqmlE55SQNT63ooF8r14h8bFh+S4glvvPT7ISTvdFhj?=
 =?us-ascii?Q?DLQ09bY8IrTsm/5zskW37u4wM67DFgcGwKKTH9MUfI2jOytwgPv/0/A1dAhB?=
 =?us-ascii?Q?8/UBeDOSlSELp14tP2JFDuNcYdWa3Oh8FGh7Gb7hqogkNcs4umPMbVnyTJma?=
 =?us-ascii?Q?gCNZGz+ztBJN4KUZ5mZcVQNE0ojZ1TH8ZDsf6aFf5rrw+iyB3YsXNJW5DAuw?=
 =?us-ascii?Q?uyO55E/6B91HPv3yD9KY84Rsz/fUOxAeFr1ZTpIoiLcYNTzVMmAEK/Mw/rui?=
 =?us-ascii?Q?tQbevwVqXORT1Z49pGkmtraa23T0w24vZ8189y9vVoo5leqrpSh1dsP0NHBL?=
 =?us-ascii?Q?iQU9avQrz5hrq6BFZK0YFA05utLvSyB4JTlt8RRhN7/qxlLLkENFXvmFEeXQ?=
 =?us-ascii?Q?vgHNzaqRdaNcKc9vFexZFtJveiqPj1nESri+1OliZsAGqeHRImo3+4v8wAwI?=
 =?us-ascii?Q?2TwdhIElEWeuIoNMeQv2QDW5rPmkxYEyk/XzllVZfCBdMjLDsmLhpzz+8HJN?=
 =?us-ascii?Q?/RzJgwT7fcaMD+xV7cOyj0tbQsdrz6sXUsb/e+zxoCKs73eYRMC0uu+O5u1L?=
 =?us-ascii?Q?nLvbBH2WEgSX/PvYrf2O5CbyQ+bJ+GFcfopCt2G3An1/XF85tLcKWam3qAjn?=
 =?us-ascii?Q?X6fY+o0zR8J5D2jVmxXsVvSf8Dp4XmaA5nmtN4Eqf/iLGHN1VpWjUZV6ycdJ?=
 =?us-ascii?Q?QpHDZmgazSjVYpXUujMvG4VTVeniykb/yLYs3jSQUZjPCLV/JMqU4n+e8pIJ?=
 =?us-ascii?Q?3SjI3IuXYP1B4ACzGoWFvIdsysbm8qLy3QHUw4x6/riGbDIbh9UNZNI9jnx2?=
 =?us-ascii?Q?/PqM/yIGDr6UGgzKmGjztBZ4v4/cROTG3KFP7D9O4WZS56k6zOke5/g1wb6s?=
 =?us-ascii?Q?Pun4zSD59wRWm1N0OkrxxKIebFVB2Yt7zHibWWllN60SazPxxvPpzxirO3Wi?=
 =?us-ascii?Q?PGp7+ixIj2CR7R5gcg8QY/kKnH/6Zmpo85jkm3mn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a06a6197-4522-4f00-e185-08de01c018a2
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 14:29:29.5299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q8xBT+hQcVjFAjdx96ApLG8osRh92Y3dIwgOpP4cNwyZcPaIvMp2LNUSvwpes6+yEhfHeJ4RweqAo/rzWVQLmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4666
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

On Tue, Sep 30, 2025 at 11:41:58AM +0200, Raag Jadav wrote:
> On Thu, Sep 18, 2025 at 04:02:00PM +0530, Raag Jadav wrote:
> > In S3 and above sleep states, the device can loose power regardless of
> > d3cold.allowed flag. Bring up I2C controller explicitly in system PM
> > path to ensure its normal operation after loosing power.
> > 
> > v2: Cover S3 and above states (Rodrigo)
> > 
> > Fixes: 0ea07b69517a ("drm/xe/pm: Wire up suspend/resume for I2C controller")
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> 
> Anything else I can do here?

Sorry for the delay here... I'm not sure anymore if I was waiting for CI
to return or to check for the checkpatch error later (although I should
had checked before giving the rv-b)

I fixed the typo (loosing) in the commit message while pushing it.

pushed now, thank you!

> 
> Raag
