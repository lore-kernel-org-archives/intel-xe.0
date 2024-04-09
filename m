Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DFFCD1297
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 16:55:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A27BA112E26;
	Tue,  9 Apr 2024 16:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mEGxgUpN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C42112E2B
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 16:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712681751; x=1744217751;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ld9Kv8Di7+Q8JLyVM23w4P9wUYBHfyYh0ihy5CStrPc=;
 b=mEGxgUpNedpGXtPc+PnOpbtEWyCO1M4hH/4wM/nEiu0aHzwgq7SjMq11
 +fzE/qWaoMohcpTae7+tpRrn+uPUcW4w7WpGAa6XQSurPJ5RBwSeLoJk3
 k64VezW1a7pfejJKArd3ZLBmiO385ZD1M8DHaF9piHJBPlu48VZAInOoh
 GAHre4fAUAOJ8Bpm+ne1PUc14fXS8ZwLRClPYtBkjgIJdpqKX8jQDHd6P
 DlU9F+wiTh5n83dftBy4qTfdKYXYzsmwdgfCqudp37vI7YE5GkNKHW5pl
 nq+ByE6CRTBgSYcu54hMO7837PFOFYQ55gX0wrarxQp8u/8ZqEn8cLS5b w==;
X-CSE-ConnectionGUID: 0GohJKTfQ3ef3f/Mggt9CQ==
X-CSE-MsgGUID: rwwcuG+QSsC0lCIyN5TV2A==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="25449792"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25449792"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 09:55:50 -0700
X-CSE-ConnectionGUID: LL1XoAZjTS+EyzVoJi4moA==
X-CSE-MsgGUID: dq1D21W1T76bnv56igN4OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20361020"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 09:55:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 09:55:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 09:55:49 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 09:55:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TBeMZLlB/VJBf/3/pOm1Zzx3h25XchV5TD/KuGxBc2mnrFIQNFbNnjGGrdGrUU67oYCFb2ndK1NB1bIU6A3T2OiI9ie8MwJ4EWXCHaAKepQqPdBAtOKmchryOmia5mZY7vYIdbCOKyQNHUV6xtjNRkIzbaH86lzxDOlq7DvEpfnpKSuUS1y2RprcGP08yEQgLPCn4iYMlwwdKkuJZP3VuHHCwK14OjOM/YbCr9JCUgLXqvHjw8EjCCfUp1YuxsKLNjDY5bSodqBMej65yID4WQ/0yKq9+1g73nDlmfCbwrEU3UCpdOl2W1ICTluS4K3pO4IgKfcdn/cjBvRiWuoKig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gujLvxJvdkQaODuxFaoSPNWGuuAERsdkzEwpf3eYQco=;
 b=gO/PP5moFvdm4Fxv9ta6NAasbFoXv7k2FIjA2Lxfc666P/enIyVp1Kup5G8YgyiHeNZkEvnHxtpt1OKtOYaAQGsg1K9FlotuhxVePBqTe622ChLOty6liP/LIRjGV4Xu3q6dFm8MpDd8PDDYKvW5ed6iODUKr/ZWVmmdMx8MAHULCImjU1kTuJW2EgiwmVFn/pIW/SHX1WJCXAJUOzkTUvk57LP8O+NUpHLoy27TZ7nhSzFoEx9n5b7xdS+SL2+4U2T4lUhG7aRKw743lEhorQGyGOrClj9XRAh6S7XRxnPbdL16hKNJnObiwLg5jvLgsekRMSoG7seO1FfWh6dtIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7996.namprd11.prod.outlook.com (2603:10b6:806:2e3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Tue, 9 Apr
 2024 16:55:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Tue, 9 Apr 2024
 16:55:47 +0000
Date: Tue, 9 Apr 2024 11:55:44 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v7 2/4] drm/xe/hwmon: Update xe_hwmon_get_reg to return
 struct xe_reg
Message-ID: <a5qkgbovtf43ihqc4smdqwyzxwlxeit4yjtuxzqthwerer7oii@evdcv5qahcjv>
References: <20240405130127.1392426-1-karthik.poosa@intel.com>
 <20240405130127.1392426-3-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240405130127.1392426-3-karthik.poosa@intel.com>
X-ClientProxiedBy: SJ0PR13CA0044.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7996:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JsTHkuMLF21p15GEs2xO6bzwmPImfuVCGdxW3wxP6+QNJQkb4CVKnjE8jcwMyqvgfEbWayRo/VV/h7F0fv5uKaro8BCUKwHcHRpFEtV7i25dQB3tvO8hkK0fznIF9DnTPKOCpEINhAEEkiTnEO/44c2Q6vaNtq81LkZHyoKPhNmy+5orcGUtuZqmvP7OCOriFTNQrQKOZJi+Ecj1BYeQiTLFCcflEYufO7+QwkAAJkApWBFMPN/bNqNZfRLC5LY/tt4tM4ooA3gyneUc9hlRn28WNOHKxz+uHPlUb7mP2hVvboX3zgt/hYJT+mgjl3RiI8hiEjxnoQXpECBHs75HkWErYNc5XUnZcEcdfroegm/iUA/S9yGwlcdnwWumx/sTwOung1L44EwwxFw6K557sBrAgdZlFLgAUs9uVTG2yQ4l1RnFxK32uLxms0di4s2EiRwn6EP4Blz6TFkw/cwVAXXGiPpYnNxQ58UaQuT7Kc6FFUsJHAons/InTfjTD6DmMaH9TfBEO/d2WIQ/1MuupnfBtICtaD0sE6Z939wdtmMuMFoioW1HkX/0pFyqDMj+sUdunK/42cWB/m/gYMlZa/nCWPYGWtP7IURmIe9k8q+12giLYh2u09Q6VYga6z4IhpARbHJ5qC6nMqjBCBaYkPTe+HS4FMp2IRDrp3DXw88=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZvRIL/hKPAOfblWVH98ftbPnf5EjNPwOJtncK3mimpRQvxcz1UV3kR3ErsP1?=
 =?us-ascii?Q?y2/nFCKyfp9l47wx8n+2n8Q4TTf2wy53CbN7I5DjlLH4+HSMBMY24uTQbNnr?=
 =?us-ascii?Q?IdwQ3MsOemBNxmsJFuFzE5RHOqcBKGjWUGn1eqWKanmQETte9LcGxT/sEaZx?=
 =?us-ascii?Q?+YGyppqMG6pQL6A39L8NK6hSW1QgbDwTwwkE40fafBT+dn6BI9yOBSGTo+lr?=
 =?us-ascii?Q?Cg1cGJH4bUxvjBhRAnDnzsztuWzYx1DXGdturF+EAfFsruC+MNY2+D8Nphhc?=
 =?us-ascii?Q?M9Ahe1biStRjrLadrHJkYipwF3OJ6fxPxzhiPZA6HM9+OmvZVMbORTtKSbov?=
 =?us-ascii?Q?tCwUhzJSXtBA+IokVj5sibn7IjHxNQJ+TyCEzjC5h5Mgby4r3LGJBpMcQ4QH?=
 =?us-ascii?Q?GO2gzSSHKy0iNHmOL2RsV+8dGQ/NmR0VPXR0cYjp2/wmMLkPfsTNb5sKCTqQ?=
 =?us-ascii?Q?PLpjT+qfpOETpNpAqeiIM70qMNExQTmWNvEh/xhhGu5qsVg64pPJiYetqgGk?=
 =?us-ascii?Q?qyHQz9hp/jX8rf/E0LXsE436hlt+LOjCAxQge0pWT09K4BWms7OCpYfhXJuy?=
 =?us-ascii?Q?eb5hW/dDLQrjNBBeNLnl+9EflZIPYeIGTU4wN+APedPAwU8V0SVCPwOr+Iz9?=
 =?us-ascii?Q?vWRsgYv3sxwLCWmTNGoC+ccMUTgIvaXHYolV8Mvq6Vjvi9P/3IRTJGCA0vey?=
 =?us-ascii?Q?3Ns5oVc8IGzM/PGs+TVmZxHnPrmp6Kxdi0DQX0tOLRyYok70wNQRJlGW6sWR?=
 =?us-ascii?Q?ejlW8dRyyPVetFjZmXGMmd/I6astvfEe4dr/9R7pGCaJC7n9B6hAn1DAhDCJ?=
 =?us-ascii?Q?xAVtyJTCAvalzMQ+OKXo+EelU4ZZ5+LElxPKl4IyeoT4TJdDujcrIESDd55e?=
 =?us-ascii?Q?TKzS7XtkyjQwP88seNrsa7tJf21gTEu1HM7wAqr8D6G2Cir4w4FFasOatf8G?=
 =?us-ascii?Q?22Rk/qj+CtyWhn72o+RPO5WzA9h1tNNJgoRFYTvideBxu3MTa5Ec8hMDb8IE?=
 =?us-ascii?Q?EYlSlHv3dQWlYtfO9/M1m7iLFj2xSSIabKCiHoBY3OZ9mCLCfAhDHTZzSaNw?=
 =?us-ascii?Q?iZKPZL8CyBJDxuV4NRvJcR+AwCnjpLHaKsJFxdJ/JAzhUX3mihrTwbXKs4d1?=
 =?us-ascii?Q?IL0hdGtFZeOZPe+v9StnWvRSwBEMHQVu7SBV3CiRwjOCX7QVoEv7fC7zFDfF?=
 =?us-ascii?Q?wwI1nCLtwbSCo01pYwDibmFHmBUyhaYv9ypDe1V4ONaJfDLLfIAyg4+xwJxd?=
 =?us-ascii?Q?jCkJ/zvGN1g/PJmMdqUdgiaHeR5P7QgrYdpt775KIYSqdrmjbbOCLG/CY0lI?=
 =?us-ascii?Q?ZFHUf4qrEPJ6zntz/sI6rX+ktjkVTkEnuFQrV/rUKvzJijh1o8uk3iK/fBKB?=
 =?us-ascii?Q?g6Ua7P3ZTcAWJvoBosvEwbcYPiF7rByqiDh2E2nIY7tPx+/he2GCCb7vAilx?=
 =?us-ascii?Q?F89WA762yw6Qh0mRQpI2YSOTS0MjIRs3w8NZUmd76+G79CpblEqmmHvVl+UI?=
 =?us-ascii?Q?5rtqjj0knmRtjTz1/9yNamIDCfQxGMLH6SPZEQqnrCWWy878UrfTMv2k8NZl?=
 =?us-ascii?Q?k5MdYEICAooPdjTyg1mVupGSRJUB41sAYHbKSbcaBVkJ7RfMGps9ufpNUOLm?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c7fc36a-4256-4408-4804-08dc58b5e721
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 16:55:47.2566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S7tCzWTGDxP3Pp750VmwtYghOWXxZ2yHpbKPoRP6s+rMMCr22295i0ykjHnlVDVIWvdPYJh+h8lGe48wyiOtImAnCRm/2cykJI+BVG9IuBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7996
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

On Fri, Apr 05, 2024 at 06:31:25PM +0530, Karthik Poosa wrote:
>Return struct xe_reg instead of reg.raw from xe_hwmon_get_reg
>to have abstracted usage of struct xe_reg.
>
>v2:
> - Use xe_reg_is_valid function instead of XE_REG_IS_VALID macro
>   as it is removed.
>
>Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Badal Nilawar <badal.nilawar@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
