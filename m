Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B87CE7AA5
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 01:55:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DA710E8A4;
	Fri,  6 Sep 2024 01:55:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JGwHGS7j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE3610E8A4
 for <Intel-Xe@lists.freedesktop.org>; Fri,  6 Sep 2024 01:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725587703; x=1757123703;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8on8L05hOZFPqfvn+Cuhs/diMPgLB1t2TQD1EhYEGts=;
 b=JGwHGS7jJw73tag7AjLWjis2HWdBy4iAIFw/LZnpDjGZbt3ngz8HEbya
 NpZQuzeAANs2gCQv/9/xNY0vn4Xko6oFuSyk9SPYjt2maKdk3w8zgRcES
 L0F1t6KuN5jefB9EwdtLxaGl8k0H6bPzQ7hvVfKh99cqGy+mVCPAV1sTy
 kt0z7CB3oKR1yaF/DDrdnJ6VtEoAKHbhU5x0/8NwgL8nxxxiLvRZlrABd
 Yie1yxTnu8MVLua41Rybnz8DMdk6L04Dr27D/XlIzzSyWnJhs8dVciohF
 FIl8FKAee9FE1GNDTMVF8dGa5eK0Ahi5Y/Ptqq9IxwH67Q9hpivKh+RQK w==;
X-CSE-ConnectionGUID: PFfbIYjaRXS3BWR0oYprRA==
X-CSE-MsgGUID: 2j6cIofFSfeeYLocbc0UYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24492687"
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; d="scan'208";a="24492687"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 18:55:02 -0700
X-CSE-ConnectionGUID: UvR9dvVjT9+YyaBFLkyrJA==
X-CSE-MsgGUID: 6TluWDNLSBCGhxFnd2lClw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; d="scan'208";a="69965687"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2024 18:55:02 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 18:55:01 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 18:55:01 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 18:55:01 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 18:55:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VLIc/4DdPdFxywe6TKlIXUWfHpUY/C7TTwyQJJgziGYIrM2h3J/PE1qN8zxapMah9uzrhqgThWLJV+25ZuhJtIeZIFm8mCptsUfm/HjPb+Il1Lx2xQtm5PzIps7FCCyCkvu0NIpOFtSLLlJCD6pbm2AzTbrK5a9GMgLRcmj389m8xE5BotYoDwshkheS7MymXkIcWe83s0MvaEe00Mhi5eXx9yDk+bmXjmg527pKZyFrwdTaP7qbBMwmveR8HpNcMaxkNTJo1xb9dvv3SsLUqw6hStv/n0vztAnld4OMF1d/F46EEU5DZeEuejV8cy+F5h5M4D3nTv4HvBQRqDhaVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8on8L05hOZFPqfvn+Cuhs/diMPgLB1t2TQD1EhYEGts=;
 b=wSjcCgc37d5G5/wceoZzzne8sZlXhKWvzeeIFZ6Hs+e1+UaM9i7/mwnjEGjFALpEDJrhOgpW4M3t1JNFyBCneOKvpvOwdcW7c3UnRC1oV6+vVN+dzD2lwJxMbWPVgOAWa6ZrO14XfsJ2z9zbCtYGGlRrzHI45ScSoMm2E9fMIzWQWM3SuTo9WmVXSBqZ/15YCvd530vOqEyVtLU+PKZHdZtL8dF8SfwZK5rtAumG1J5bdrpu8xrjT2hLs9fq7SNgfsfVkVQUtzKCIqqMhPPxaLNrB5lHT+/HMKVJoZujLqrUCUspWJesMNSaPnexP/ruDZpHKt/Jul97OpSv9YHepA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB8280.namprd11.prod.outlook.com (2603:10b6:806:25d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Fri, 6 Sep
 2024 01:54:53 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 01:54:53 +0000
Date: Thu, 5 Sep 2024 20:54:50 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 03/10] drm/xe/devcoredump: Add ASCII85 dump helper
 function
Message-ID: <sm6iyfzcaq6vbgytgueqqbjjzjniarulya6xzsuo7gyollceyj@iovrnktwvloq>
References: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
 <20240905205106.1063091-4-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240905205106.1063091-4-John.C.Harrison@Intel.com>
X-ClientProxiedBy: MW4P222CA0024.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB8280:EE_
X-MS-Office365-Filtering-Correlation-Id: 56c782d6-90f5-43ca-764e-08dcce16e6a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3FKXW08igZzkos2RtiT4jkoZnIfKcgNyK6HKa0LgsqDx5aJzzvJmPU3TYsz2?=
 =?us-ascii?Q?hAYm78ZFZNZnahtVs8OQE/AtMOqAXvnhwUgS5u6VRBof7q8gJi9NBNkiASez?=
 =?us-ascii?Q?q5gGkWP4AhBz+YIoWOeQnpaZT19Eq+p1JjtXhCt6BBGiDKWolCLr+/9dHJ5b?=
 =?us-ascii?Q?3ocnl44CS/rR92de9ypnL8vYEhP22Odp/kNOjDTbuSxkR8mCbrIgtstCkpJP?=
 =?us-ascii?Q?4kYI7YRWWjbrHcyfh3xNHGhUSVHytw405SR+QDo10rccjMBwuFGagNbGraAD?=
 =?us-ascii?Q?X3MMYv/UYTYFYkBHe9F03CyASYHa7GU+rsjXIqRi73p7/S7t0EFyIGmMN6lx?=
 =?us-ascii?Q?vPG5L8w2LdhugkncqkJ60e3hobWluooRxkzJ8ivdcBGo3+Rf51hj4x/UIR/W?=
 =?us-ascii?Q?8X828yMfAg826vqTFbRZ8JPkedPSvBKhO4c+cYyxIiBy8Ivz4ZZMqxoefxA0?=
 =?us-ascii?Q?XB9e9u0DRa3ifrpdEBKS/4g8tSpQ7JQtyLKxvElb0Q0r3+XHApFYfmqstWlJ?=
 =?us-ascii?Q?agWppjrcgHsqGERM1dpATK7yF6TXpSe1aH/PkA4Ujj26kkk7avOTnMyM3g+Y?=
 =?us-ascii?Q?ISNXe0Bau3ujN550JjeFG38WxCw2wUXKAIi4VNhbUm/VrcAe4GoP9SWvIAXE?=
 =?us-ascii?Q?zUhFe88d35IoNm+Yo5AKxM4ZFkTUg1BqNTfT28RKAqj/X8T6KRioP0vXLwWT?=
 =?us-ascii?Q?xkUIwJq4jadi3rkijSSAWxP/TJcFDD3Pikp+y2I5aZ7WP2XKRWAy8WTbRqEO?=
 =?us-ascii?Q?SJNCRcvE0o3W6cAwhGJ9fk8WJAmatR18Q5X+b7Qj/6khgmMF9d4SgbBokgiA?=
 =?us-ascii?Q?L335mlsgXk+ShIvt0DVRqBQdMJJREh8eMclNPnehh6i6YueP9MDEzd7M0lJn?=
 =?us-ascii?Q?Dx+uOuZC+PLyRWUj1p3NHfisycUDxeXwSuE1fmeL7ulhp0mYPLM02QYs0CZi?=
 =?us-ascii?Q?XWImOuKdWTaGer373d0/ps2iGQNU39USxIkXDByLgbUqx525lULCNaShHNVn?=
 =?us-ascii?Q?RwQ3B1XF8IJXDXcLdBMPD0gqN7gQ6nNXmWAM9256TH3tQ+IcgH0paXxLatpW?=
 =?us-ascii?Q?J/Cc9o0PMs2F/hEZsqN5XUmSwblxkoIelPaVTlv87sI9VtJ/q8bTf/c+7rtZ?=
 =?us-ascii?Q?k1QYmQ+KQ+myvhSunthc6vWOVJXZsKcs6KF56WtmsHWC2KUsKdpO5xxWdGc2?=
 =?us-ascii?Q?2dAAU2cTyhS8DYuCWSLQxzlrLoTJLStfsx8QK6WXr8HosFvYHV19SS1wMW+M?=
 =?us-ascii?Q?HG55DRl0h9SXHe52XISz01P9tQsYhE7w2D/kMNLKAJYFN4h5fOwX11lQ7Ilj?=
 =?us-ascii?Q?zz+vXEUUD4jur0tEr2hIpPiO/VZhcwP0u3ngIgbWAkt/8bLQkU3v+YwIlIID?=
 =?us-ascii?Q?G1E09JrYEAgEK+kMjG2VdBEjv+HA4ui1ULOaPR2qJCMnjSWadQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JbDi/j6QeV2F5jPf58hkuJJxZ0hUBZ324t5VcrgMys6osjdaztmFq5Eygj/4?=
 =?us-ascii?Q?1pzVyceLPVEoNJAFAYLSZVNu3o2hBNzNikqBcWH62QVDsdxhJGzazvkVTfl9?=
 =?us-ascii?Q?HmCA7oPWC3/s7/VhmFDWWQE1OQXgR6+tNVadieE9OLSaiUnX0el3F/xnnveT?=
 =?us-ascii?Q?Cm5isHD5mLnjergC/w1h+GrOFbaSHnBpn8MJw8w3tBj1SDV8ebdSPNsFFeNn?=
 =?us-ascii?Q?3foM7aWq8MXGmKMOI38QOD2iNhVcc6Fsdj/EcqaBQrxbJvVS5NHXtCW/c3Va?=
 =?us-ascii?Q?FdTwRDSU+wLN2zrW6fZr2/lCZVKBHGP7TC2t7oEr0ZPsKPJ0qnJS4QJhCTov?=
 =?us-ascii?Q?W05eSy3Bwg2v4wI8WQQXN9tyQ9OrBdbUKDRVsJhVXJvyLKzhFJfjjTrmzRHA?=
 =?us-ascii?Q?I3B/DJgHjNx2fft2UyLW9iuKj9b/V3k8/M3ZD1mWqrPJCESVbEcx4gNbNOWt?=
 =?us-ascii?Q?995ZufRz26oKCqohBBKPOv6X50SZCASdpCQW4JbpdKUf24aw7ZTgVsqCdoSq?=
 =?us-ascii?Q?Y1xkRl4RjIYBgtwY04wPV5c8q+TICK/T96tkPWFdAifveBu6IgcqyI5HCrUW?=
 =?us-ascii?Q?b059slMRabkTA07QNQMSINDn49rK7udjiRpiNy8Ptw7Bv3mPI/wuvQjVPkwj?=
 =?us-ascii?Q?9zKqwtI+44I/aWtgvw/DewYCzZmYtQd2V48fAvPXWe2KxuI0VRqWKFVGuXP+?=
 =?us-ascii?Q?FXUu2Mw6Hq9Q7kZ+Ff2uIDS2MkhKrpYu2ffVb+f5tumCAL4RU1DVBWGQNBSu?=
 =?us-ascii?Q?p0zhks00Hvm91UtmeqkaScf1zBuL2t0Rwje57DiDHoSITVso0rnR3Ck2NMYA?=
 =?us-ascii?Q?yJmSpbLIGi3s2FoBjSFXwsYpjbBJs7AYDqfSga5Pi6ig0LPW63PLRna/sffz?=
 =?us-ascii?Q?RmRXPu+fvVI9AvgD/8KHhM+o0kI8wR47s/9fvmADMtEuxo+CZweBU/CZwQr4?=
 =?us-ascii?Q?CozaiImZeKGqk5Wy40jocM6mUSecAmA2vF06mL7xHy8aOcZaOb0usUMmBEdl?=
 =?us-ascii?Q?IyMyEyPJ11SBrvVQUW9JoCflf8pZQV/rZyOMPAj5E0gsfRdQFLbItmzUeTny?=
 =?us-ascii?Q?8PHEUYw6+nxbHs18PqW4pTbhWBHBzLnhiVVbm1u/+otqzTfJlVxL1ghL1Gfc?=
 =?us-ascii?Q?VrUlBrW0TdEeeOBi0Hjz7XzcCBBTvlijKYWc4E1oSE/Yv8zBjmdaP+uwFWSl?=
 =?us-ascii?Q?sDIOoO7LmNMrxBdNcbMiWuGNMqS9lr6GNKSjzj0oGKAxdgz0fy1/At4Np81U?=
 =?us-ascii?Q?d1ktV6hqT8xvO2eb+HYyDi4CtS374SjTOq9TssOCjLyA5AyN64npWmVACioU?=
 =?us-ascii?Q?yDTJRJraWWYUrA1mkxFmT8icHUm22mIYAalQ/qPSMO6M33lsa/gFECeIHEeY?=
 =?us-ascii?Q?gZ8OTnhV7htsZi02UMHcuBwlpREVoHqramQBYHe3Ef1qdtH0PLc2uI+AcGyj?=
 =?us-ascii?Q?CNolDYViWkVb12eYLIF/tQs6AuvO9SPZ8aRA8G7KYzEM68rcUyiYcPpO+tRD?=
 =?us-ascii?Q?4nbYSQ61m9UDdcylYi3S8FzG7y5XkJbF87vvg9LRX+sWtjfM/zzwUUZaco82?=
 =?us-ascii?Q?HMSJH8GznFH6XNzJyFFhcIxkGTWZmNjMFAPPzj49HrCp94mVcLSMS7/DwVfp?=
 =?us-ascii?Q?WQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c782d6-90f5-43ca-764e-08dcce16e6a5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 01:54:53.4938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yjFrlo+DwhBj78RoyG4WxeCAufvQhp7Q3bLYHo6tR8MlX7CBw2ROjp60nGGAun8rqQTab4OnCFM7P8H79GPcuzwDJqOBJc2TN9avs6W3OuA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8280
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

On Thu, Sep 05, 2024 at 01:50:58PM GMT, John.C.Harrison@Intel.com wrote:
>From: John Harrison <John.C.Harrison@Intel.com>
>
>There is a need to include the GuC log and other large binary objects
>in core dumps and via dmesg. So add a helper for dumping to a printer
>function via conversion to ASCII85 encoding.

why are we not dumping the binary data directly to devcoredump?

Lucas De Marchi
