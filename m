Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 550F4C83F26
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 19:59:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C1410E02C;
	Wed, 30 Jul 2025 19:59:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H2W5fYQK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18FD10E02C
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 19:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753905559; x=1785441559;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Aea8sHfeUnd1R3LTFYs3LA7QaEodmWU3udG6Efa+xEA=;
 b=H2W5fYQK9Q8Jwdjua+OrBZFsEldo7Np/JYjRFhbRfnYvC6M1pUMRcpmy
 M0BAXDJQGNTfjftiKOMY4o5iiX4z70baFoKf5av9xut6j8Edqkdz6abrM
 WeBgS24Gw+FfBsRLq+TBXb5vxvX4tOtGDDZoUPmflzVxvfi+T7u21W4PA
 yfQgCM0JQG8KHKwI0oSY28B1lFyaxmOptoryNbwOm3qemss7MZ5rJpAjx
 gedAS0hV+0KC3NOaYHrc2Vp0pqPH2sB3Jk/VvRGEuImQoNx0YBVxCOUd5
 AP5YfAWfKSQ6yEjV4YHkhdJcX/G82I0TuIK2EAzQ+xboqWsiOSACtsYtP A==;
X-CSE-ConnectionGUID: wAQ3RCu8Ty2CrAR0hhb8QA==
X-CSE-MsgGUID: 6S9zxvRiQPWeOZJXZqmHdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="67662314"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="67662314"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 12:59:19 -0700
X-CSE-ConnectionGUID: 5V1PsRmFQhKW7UERT+GWRQ==
X-CSE-MsgGUID: lJTMxK9YQxWlWORq1rd19w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="167256852"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 12:59:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 12:59:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 12:59:17 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.41)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 30 Jul 2025 12:59:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XaN+DJGeiDBtm3QU5Sn5/Y54HKRtuWY4ALmHK1MmfFSzs4wuCAEcTS16pf1bQXiEOKsAV72O23CEJtmhf28JtQevkFXf6wuVKN8GNjhSD6ZtX1SIGAR7KysLIkgtC8pgKYELtwaFWTSx4mIRm62tQerS2xwggeGzG1hdXotDbBeriCaEGmBGFSTTzYDHm2ZRhtcn3DKnTZ4znuOqvSfrUL/b/ojecB1JeMYQwMXXT075EFMI5SVo8qZ5azWMbNYTgEkH/LsKAFmQzyIDvOSRIQue7OiyInh5k8y7O8m/tkdCWgbT/kIgmKlHOj8gKygwG1XWPq2KIcHRbyL4iXFBSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mr7n6gUZewa+aBA+COWdMJb64Ut2W6pbIX4lxZ1dWug=;
 b=yTs6LkKoOb+0bOcHa8vYEs0XLifgHJAbOrB3feHvzxc9pFk5n02dBuP1jkbhzhvh1GKzsWIy16XyalUa6Wnc/DKSiqeikDm1MlZfhSHVPeG/hzk/jGPCTzYjrhyZkw0QY9HJYrX9oCJLDWfERv9HEMu1vBIlReoPTrdJJM64hn9HX+OODYKxseWwt526pSeuhxRBthA/z4EmL8p26e1HkLUBFl6bia+svI+tLtow14LWFBkkAPtxPuMnHEPKQtv0uh2d/SWc4+iY8J6j0O4uwTqOZz1OCpOQFVL1N4GxlH/yP3wv7kTR6740KA9LhhbHzs214BsGlQDkVhiGOcGG4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY8PR11MB7267.namprd11.prod.outlook.com (2603:10b6:930:9a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Wed, 30 Jul
 2025 19:59:10 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8989.011; Wed, 30 Jul 2025
 19:59:10 +0000
Date: Wed, 30 Jul 2025 15:59:06 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <anshuman.gupta@intel.com>
Subject: Re: [PATCH 01/10] drm/xe: Handle errors from various components.
Message-ID: <aIp5ihPnVQ2P2Bew@intel.com>
References: <20250730054814.1376770-1-aravind.iddamsetty@linux.intel.com>
 <20250730054814.1376770-2-aravind.iddamsetty@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250730054814.1376770-2-aravind.iddamsetty@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0220.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::15) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY8PR11MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dae0c4e-0b80-4e2a-5e96-08ddcfa38c9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?qwMX2VpPyPDka37RPauaYncGTbhA+VCBTDUhuu4Dwr2oUNUPQC/TeM6M+H?=
 =?iso-8859-1?Q?W3R0Djc+ThiIYTWEqcHUv6qznVw+CrYzIg7gIM2IX+OybT04buEnUhkXK0?=
 =?iso-8859-1?Q?YvIQwD9UfFtY/q+ZnWa057eiLdJhKR9xYn2LPAYBKae5CP1wwqEJgdrye9?=
 =?iso-8859-1?Q?KzQw82U0QZkOvPLf712MPQjEunNc7vaWs3R4qANDxBlxNZUYUl4AO3fJeG?=
 =?iso-8859-1?Q?4mEAn+9eUeJsNE0FQd5h/qnPQTD4HBPFc+KOKSOIZjtA85o6u1cSCewWIg?=
 =?iso-8859-1?Q?Ty6cZLPcRQ2Y/rp8qWJj+5UlGu6u5+FQ50GO9wr1FhNp2ne1NWzeZ3cz5Q?=
 =?iso-8859-1?Q?9/90EafYSbtC01fF+8d4vZE3pNlZfeNmpqHCitruFwJbZxUrvd6tqru4/a?=
 =?iso-8859-1?Q?elrI41BpV88qIgxKAQoplLDWopoYndXISXiYOc/pPVO5oC9g6hk5ts5BWS?=
 =?iso-8859-1?Q?KYHlExECjm+0yZVVrJ/ICZ66WXlouqACTT3RayMLAnc74x3jCRECp6dIgX?=
 =?iso-8859-1?Q?kHpM61pQAbFswihBa8eJw5oFbe7DhN6mCqk/EZrDK7ozOz+kb1NxUojYUf?=
 =?iso-8859-1?Q?JLPAET6zs0wHPFFeMYutzkIkXFG/PWo39PfeF7P4Qj6yHAvUH8QiSpYMuo?=
 =?iso-8859-1?Q?xM0+fK5ZWo69LrgHATByQ6v6A89l/thZiuITKsgu+udMR6G3xkFOE2ccwf?=
 =?iso-8859-1?Q?IZ4e8UIrE75nbe4FBoX9Y+mbsiaLPGB+dYRuq4Dhast8OsTI+zK3xOhq+5?=
 =?iso-8859-1?Q?q+sMapX+VfSU3NcwN1h7m29TF8mr/2dQuNix5LpqIgWb31YLvTTaFxU1ph?=
 =?iso-8859-1?Q?2m2NKNBZhr7YMD2FBgRvGeF3w/vMSMDr3c9uFkoenKEZ+ALolpCDmEMOxE?=
 =?iso-8859-1?Q?1fgIAf46G9ytwKRS1he6Ckwau/ls6oel3UyeZwDbq+SgvHclEkv4gYSoL+?=
 =?iso-8859-1?Q?jg2tz9nuSaIj6ZRJ6ymXx/dGqc23+jDzrt7M05n/4F9bCSkNBWaLpCYHGf?=
 =?iso-8859-1?Q?K7K6XobZa5X996iInvOXqPKkA3UE5nO3/bsotB3u0dQoHCBNgpwZ0D+ZSE?=
 =?iso-8859-1?Q?sRVGnh63JQWXjPPpzys3KE2YJhK49wgA7pYMuidClM+2wzNLLM4Hrxo5rT?=
 =?iso-8859-1?Q?iKyYrawUy520FfGg0dC7pWOTYVT+MQII3fPNWDKU+2d0DgTvobd0xgbn0D?=
 =?iso-8859-1?Q?RCO3jTtKcoOVgTMRwHTybNcngpomCV35cFGAT0LMwY5f1BJV193W6gW40M?=
 =?iso-8859-1?Q?rXg5OyEkq9CAgLbAfqtiv255UV0bZdb/oEy0we+4o8Eqjvk/2OAPHVttyG?=
 =?iso-8859-1?Q?7a+U9PQ6kpoz9oPKMGWG5LlKc61Jmgzl+n1ZltLoa+EJagv4FtkH870drh?=
 =?iso-8859-1?Q?9McSZjj/5qisTy4R5B6gK6Chi2A8gLYVNkTDIaNoD93LK2blUUSlzuTJho?=
 =?iso-8859-1?Q?dJa9zayTesoCrh5HjA98rgz1i1wDnLuus6uBQWsyQcNb1UJb0tC6pXohlX?=
 =?iso-8859-1?Q?g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?cgj+0ckguoXYUoI7M+81C8u3o2Fj4XEqNy65FvJWV116lBBm6OvwF49LFU?=
 =?iso-8859-1?Q?n1n0h4TNlnMqAZuVMw+XKlTl9PNX00LbpVBiJQu2n2C5xFelg72Ct66sGA?=
 =?iso-8859-1?Q?N92W4cPtrSanPz8UnMdpJO//bXkYT/NYHvLkCZaBubSUFSxbqI6/aoZSUS?=
 =?iso-8859-1?Q?+azml6LO+KjcGrBLgZBoAgtEqApBXNMrp1ivCxnA1CZ46j6qUhKwRCeYrv?=
 =?iso-8859-1?Q?A1PkVdzh6FJUdQngDU/qvqKy45+5AkIWXqaagaRg1K12kNeYSj3Xq3IoUG?=
 =?iso-8859-1?Q?UkR3v6faAVKssVmaDBmr7zV93eemxV1MDQZxvax6+cN8X/aWFMDLzZQ5jT?=
 =?iso-8859-1?Q?2G3jS3XsxSz2+5D9wzssb3cDODh5siWINaRBCt14VBz/Fo940OUbKC6hOd?=
 =?iso-8859-1?Q?ioTr8WdRu9aciiWoSRt4BIyd5l9sbkA3gZDD4eg4qTU50zb56VDfUMCHGW?=
 =?iso-8859-1?Q?1OMCxal3PDB9+B47Zj+IFwxrizPUbULNwvHLO+n0H6+I4M1S5mwm9JFeZD?=
 =?iso-8859-1?Q?+w9h/hRk7PAhtWnuYhbwGOpx2DTVK+TWwXba8Nawt/4VYIanYuuTUBT+fC?=
 =?iso-8859-1?Q?TZfcg4vU5vSjp3n2MZgScKywNYMjz5kGMAszIOxgSPUHqg+2/CWkM0HyPB?=
 =?iso-8859-1?Q?VWp4VbSm7mBOv467+3vK9a/TxN9d49NCaB4WUr+b0keFvvI05v3dy8yzYc?=
 =?iso-8859-1?Q?DDBdNygOtoFRGNC5+vTuosOPkP36mmE9UmRLUjFE99uYfj+e9jGQI4sXXE?=
 =?iso-8859-1?Q?YX12fOLmxL11xEErdrAMN+6eFhgj0i/oAKW/ZgYde8rG/O0QzfZN8sRE+0?=
 =?iso-8859-1?Q?FGyrAuR+og098k5vwm91Kh3VGwkYGd9HtNJUZjKUhfwbSj4Z1Kcs5Chq00?=
 =?iso-8859-1?Q?eF0A5Z60tTTv5RKFogOm1orH9SIXgAsLZVd4BBkhAkQVUxeLmzOhWWR5B/?=
 =?iso-8859-1?Q?KE+LfTJ/NxNAh7DrJV0Qk5ePz1ICpj+zUOtZd+psJd/3HlGadm17erluFU?=
 =?iso-8859-1?Q?LJC8AUEg7juB0wQupdiZPPRR4PPjKaY3lPDw7zZ8esP6rkSlrzmyA+MggZ?=
 =?iso-8859-1?Q?OLgVWkc3tzZIrxS+crAgFTnba6mmh6iTR5DHpjlyqSRcSDcAkYj7U4rrUq?=
 =?iso-8859-1?Q?B/LdJdqGW6kaI7BbN1IJ0alt9yzIb/uDI0TX1nIqEHyXAMd5Qij4YdYQVF?=
 =?iso-8859-1?Q?zGvn+GrWiOI64/MfYnRKJffz4JtvY+RN2zjppGGNDcPxzDC53XxRFGaBWF?=
 =?iso-8859-1?Q?/RJlgEIUe+Ub5IWwgdHi5yIx/BbKSqHMJAKsDiVrRYcmnvHXw3s+UlddUk?=
 =?iso-8859-1?Q?ejibx5Fj4JWgDNAoHAV4BNJO3thjUAtz3jREDHm5bbVffq11rePXcddbKs?=
 =?iso-8859-1?Q?c58GlYTH5UpK4rCUu/v7hS8VR9EZHjRKNNAvTQIoxdW0pr/N98QCTZ02FG?=
 =?iso-8859-1?Q?WRDTLDh/VKfim2iPxZZ7+ETJQuBTDRuYsn4kXkOg3rnuxoED6XhusAnC2L?=
 =?iso-8859-1?Q?WSzy+d60x7jNKTsIo4yieJpZ9a0lmlA/cgS2jr6aVYZjqRPs6NnrQ1Whif?=
 =?iso-8859-1?Q?KJ1ZdFoKmi6nNzVi8GPIvnjBajiABH4wjUFgnFz0PX0vqN5hrmUjMuSl7y?=
 =?iso-8859-1?Q?0rmBjq/GsFXlMQ3y8WzYgmFLjRzSSeV6H81XR66g4tURzRYqlEWamWFA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dae0c4e-0b80-4e2a-5e96-08ddcfa38c9b
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 19:59:10.4642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rb+ttoyc97zbh8aShc0GHoI30NljF4OQVirQkiB17ZA3EpfRGW+aaC6uZUeWtcH3rhfvJO4WmmU2BhEoGud0+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7267
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

On Wed, Jul 30, 2025 at 11:18:05AM +0530, Aravind Iddamsetty wrote:
> From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> 
> The GFX device reports two classes of errors: uncorrectable and
> correctable. Depending on the severity uncorrectable errors are
> further classified as non fatal and fatal. Driver will only handle
> logging of errors and updating counters from various components within
> the graphics device. Anything more will be handled at system level.
> 
> Correctable and NonFatal errors are reported as interrupts, bits in
> the Master Interrupt Register will be used to convey the class of error.
> Determine source of error (IP block) by reading the Device Error Source
> Register (RW1C) that corresponds to the class of error being serviced
> 
> Fatal errors are reported as PCIe errors. When a PCIe error is asserted,
> the OS will perform a device warm reset which causes the driver to
> reload. The error registers are sticky and the values are maintained
> through a warm reset. We read these registers during the boot flow of the
> driver and increment the respective error counters.
> 
> Bspec: 50875, 53073, 53074, 53075, 53076
> 
> v6
> - Limit the implementation to DG2 and PVC.
> - Limit the tile level logging to only PVC.
> - Use xarray instead of array for error counters.
> - Squash the fatal error reporting patch with this patch.
> - use drm_dbg instead of drm_info to dump register values.
> - use XE_HW_ERR_UNSPEC for error which are reported by leaf registers.
> - use source_typeoferror_errorname convention for enum and error loging.
> - Clean unused enums and there are no display supported ras error,
> categorize them as unknown.
> - Dont make xe_assign_hw_err_regs static.
> - Use err_name_index_pair instead of err_msg_cntr_pair.(Aravind)
> 
> v7
> - Ci fix
> 
> v8
> - Avoid unnecessary write if reg is empty incase of DG2.
> 
> v9
> - For reg being blank print error for DG2 too.
> - Maintain order of headers.
> - Make XE_HW_ERR_UNSPEC 0. (Aravind)
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

please remember to sign-off every patch from others that you are handling

> ---
>  drivers/gpu/drm/xe/Makefile                  |   1 +
>  drivers/gpu/drm/xe/regs/xe_irq_regs.h        |   1 +
>  drivers/gpu/drm/xe/regs/xe_regs.h            |   3 +
>  drivers/gpu/drm/xe/regs/xe_tile_error_regs.h |  13 +
>  drivers/gpu/drm/xe/xe_device.c               |  13 +
>  drivers/gpu/drm/xe/xe_device_types.h         |  10 +
>  drivers/gpu/drm/xe/xe_hw_error.c             | 258 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_error.h             |  50 ++++
>  drivers/gpu/drm/xe/xe_irq.c                  |   1 +
>  drivers/gpu/drm/xe/xe_tile.c                 |   2 +
>  10 files changed, 352 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_hw_error.c
>  create mode 100644 drivers/gpu/drm/xe/xe_hw_error.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 42c6ca5b3f76..80eecd35e807 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -82,6 +82,7 @@ xe-y += xe_bb.o \
>  	xe_hw_engine.o \
>  	xe_hw_engine_class_sysfs.o \
>  	xe_hw_engine_group.o \
> +	xe_hw_error.o \
>  	xe_hw_fence.o \
>  	xe_irq.o \
>  	xe_lrc.o \
> diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> index 13635e4331d4..086ec7584b1a 100644
> --- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> @@ -18,6 +18,7 @@
>  #define GFX_MSTR_IRQ				XE_REG(0x190010, XE_REG_OPTION_VF)
>  #define   MASTER_IRQ				REG_BIT(31)
>  #define   GU_MISC_IRQ				REG_BIT(29)
> +#define   XE_ERROR_IRQ(x)			REG_BIT(26 + (x))
>  #define   DISPLAY_IRQ				REG_BIT(16)
>  #define   I2C_IRQ				REG_BIT(12)
>  #define   GT_DW_IRQ(x)				REG_BIT(x)
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index 1926b4044314..00900d3821f7 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -9,6 +9,9 @@
>  
>  #define SOC_BASE				0x280000
>  
> +#define DEV_PCIEERR_STATUS			XE_REG(0x100180)
> +#define   DEV_PCIEERR_IS_FATAL(x)		REG_BIT(x * 4 + 2)
> +
>  #define GU_CNTL_PROTECTED			XE_REG(0x10100C)
>  #define   DRIVERINT_FLR_DIS			REG_BIT(31)
>  
> diff --git a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
> new file mode 100644
> index 000000000000..ba5480fb2789
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +#ifndef XE_TILE_ERROR_REGS_H_
> +#define XE_TILE_ERROR_REGS_H_
> +
> +#define _DEV_ERR_STAT_NONFATAL                         0x100178
> +#define _DEV_ERR_STAT_CORRECTABLE                      0x10017c
> +#define DEV_ERR_STAT_REG(x)                            XE_REG(_PICK_EVEN((x), \
> +								_DEV_ERR_STAT_CORRECTABLE, \
> +								_DEV_ERR_STAT_NONFATAL))
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index d04a0ae018e6..e0625fa5b1ca 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -875,6 +875,8 @@ int xe_device_probe(struct xe_device *xe)
>  			return err;
>  	}
>  
> +	xe_init_hw_errors(xe);
> +
>  	err = xe_irq_install(xe);
>  	if (err)
>  		return err;
> @@ -952,6 +954,15 @@ int xe_device_probe(struct xe_device *xe)
>  	return err;
>  }
>  
> +static void xe_hw_error_fini(struct xe_device *xe)
> +{
> +	struct xe_tile *tile;
> +	int i;
> +
> +	for_each_tile(tile, xe, i)
> +		xa_destroy(&tile->errors.hw_error);
> +}
> +
>  void xe_device_remove(struct xe_device *xe)
>  {
>  	xe_display_unregister(xe);
> @@ -961,6 +972,8 @@ void xe_device_remove(struct xe_device *xe)
>  	drm_dev_unplug(&xe->drm);
>  
>  	xe_bo_pci_dev_remove_all(xe);
> +
> +	xe_hw_error_fini(xe);
>  }
>  
>  void xe_device_shutdown(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 38c8329b4d2c..233c2751d09f 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -14,6 +14,7 @@
>  
>  #include "xe_devcoredump_types.h"
>  #include "xe_heci_gsc.h"
> +#include "xe_hw_error.h"
>  #include "xe_lmtt_types.h"
>  #include "xe_memirq_types.h"
>  #include "xe_oa_types.h"
> @@ -206,6 +207,11 @@ struct xe_tile {
>  
>  	/** @debugfs: debugfs directory associated with this tile */
>  	struct dentry *debugfs;
> +
> +	/** @errors: count of hardware errors reported for the tile */
> +	struct tile_hw_errors {
> +		struct xarray hw_error;
> +	} errors;
>  };
>  
>  /**
> @@ -575,6 +581,10 @@ struct xe_device {
>  	 */
>  	atomic64_t global_total_pages;
>  #endif
> +	/** @hw_err_regs: list of hw error regs*/
> +	struct hardware_errors_regs {
> +		const struct err_name_index_pair *dev_err_stat[HARDWARE_ERROR_MAX];
> +	} hw_err_regs;
>  
>  	/* private: */
>  
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> new file mode 100644
> index 000000000000..84830ad81813
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -0,0 +1,258 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include "xe_hw_error.h"
> +
> +#include "regs/xe_regs.h"
> +#include "regs/xe_irq_regs.h"
> +#include "regs/xe_tile_error_regs.h"
> +#include "xe_device.h"
> +#include "xe_mmio.h"
> +
> +static const char *
> +hardware_error_type_to_str(const enum hardware_error hw_err)
> +{
> +	switch (hw_err) {
> +	case HARDWARE_ERROR_CORRECTABLE:
> +		return "CORRECTABLE";
> +	case HARDWARE_ERROR_NONFATAL:
> +		return "NONFATAL";
> +	case HARDWARE_ERROR_FATAL:
> +		return "FATAL";
> +	default:
> +		return "UNKNOWN";
> +	}
> +}
> +
> +static const struct err_name_index_pair dg2_err_stat_fatal_reg[] = {
> +	[0]         = {"GT",			XE_HW_ERR_TILE_UNSPEC},
> +	[1 ... 3]   = {"Undefined",		XE_HW_ERR_TILE_FATAL_UNKNOWN},
> +	[4 ... 7]   = {"Undefined",		XE_HW_ERR_TILE_FATAL_UNKNOWN},
> +	[8]         = {"GSC",			XE_HW_ERR_TILE_UNSPEC},
> +	[9 ... 11]  = {"Undefined",		XE_HW_ERR_TILE_FATAL_UNKNOWN},
> +	[12]        = {"SGUNIT",		XE_HW_ERR_TILE_FATAL_SGUNIT},
> +	[13 ... 15] = {"Undefined",             XE_HW_ERR_TILE_FATAL_UNKNOWN},
> +	[16]        = {"SOC",			XE_HW_ERR_TILE_UNSPEC},
> +	[17 ... 31] = {"Undefined",             XE_HW_ERR_TILE_FATAL_UNKNOWN},
> +};
> +
> +static const struct err_name_index_pair dg2_err_stat_nonfatal_reg[] = {
> +	[0]         = {"GT",			XE_HW_ERR_TILE_UNSPEC},
> +	[1 ... 3]   = {"Undefined",		XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
> +	[4 ... 7]   = {"Undefined",		XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
> +	[8]         = {"GSC",			XE_HW_ERR_TILE_UNSPEC},
> +	[9 ... 11]  = {"Undefined",		XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
> +	[12]        = {"SGUNIT",		XE_HW_ERR_TILE_NONFATAL_SGUNIT},
> +	[13 ... 15] = {"Undefined",             XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
> +	[16]        = {"SOC",			XE_HW_ERR_TILE_UNSPEC},
> +	[17 ... 19] = {"Undefined",             XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
> +	[20]        = {"MERT",			XE_HW_ERR_TILE_NONFATAL_MERT},
> +	[21 ... 31] = {"Undefined",             XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
> +};
> +
> +static const struct err_name_index_pair dg2_err_stat_correctable_reg[] = {
> +	[0]         = {"GT",			XE_HW_ERR_TILE_UNSPEC},
> +	[1 ... 3]   = {"Undefined",		XE_HW_ERR_TILE_CORR_UNKNOWN},
> +	[4 ... 7]   = {"Undefined",		XE_HW_ERR_TILE_CORR_UNKNOWN},
> +	[8]         = {"GSC",			XE_HW_ERR_TILE_UNSPEC},
> +	[9 ... 11]  = {"Undefined",		XE_HW_ERR_TILE_CORR_UNKNOWN},
> +	[12]        = {"SGUNIT",		XE_HW_ERR_TILE_CORR_SGUNIT},
> +	[13 ... 15] = {"Undefined",             XE_HW_ERR_TILE_CORR_UNKNOWN},
> +	[16]        = {"SOC",			XE_HW_ERR_TILE_UNSPEC},
> +	[17 ... 31] = {"Undefined",             XE_HW_ERR_TILE_CORR_UNKNOWN},
> +};
> +
> +static const struct err_name_index_pair pvc_err_stat_fatal_reg[] = {
> +	[0]         =  {"GT",			XE_HW_ERR_TILE_UNSPEC},
> +	[1]         =  {"SGGI Cmd Parity",	XE_HW_ERR_TILE_FATAL_SGGI},
> +	[2 ... 7]   =  {"Undefined",		XE_HW_ERR_TILE_FATAL_UNKNOWN},
> +	[8]         =  {"GSC",			XE_HW_ERR_TILE_UNSPEC},
> +	[9]         =  {"SGLI Cmd Parity",	XE_HW_ERR_TILE_FATAL_SGLI},
> +	[10 ... 12] =  {"Undefined",		XE_HW_ERR_TILE_FATAL_UNKNOWN},
> +	[13]        =  {"SGCI Cmd Parity",	XE_HW_ERR_TILE_FATAL_SGCI},
> +	[14 ... 15] =  {"Undefined",		XE_HW_ERR_TILE_FATAL_UNKNOWN},
> +	[16]        =  {"SOC ERROR",		XE_HW_ERR_TILE_UNSPEC},
> +	[17 ... 19] =  {"Undefined",		XE_HW_ERR_TILE_FATAL_UNKNOWN},
> +	[20]        =  {"MERT Cmd Parity",	XE_HW_ERR_TILE_FATAL_MERT},
> +	[21 ... 31] =  {"Undefined",		XE_HW_ERR_TILE_FATAL_UNKNOWN},
> +};
> +
> +static const struct err_name_index_pair pvc_err_stat_nonfatal_reg[] = {
> +	[0]         =  {"GT",			XE_HW_ERR_TILE_UNSPEC},
> +	[1]         =  {"SGGI Data Parity",	XE_HW_ERR_TILE_NONFATAL_SGGI},
> +	[2 ... 7]   =  {"Undefined",		XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
> +	[8]         =  {"GSC",			XE_HW_ERR_TILE_UNSPEC},
> +	[9]         =  {"SGLI Data Parity",	XE_HW_ERR_TILE_NONFATAL_SGLI},
> +	[10 ... 12] =  {"Undefined",		XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
> +	[13]        =  {"SGCI Data Parity",	XE_HW_ERR_TILE_NONFATAL_SGCI},
> +	[14 ... 15] =  {"Undefined",		XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
> +	[16]        =  {"SOC",			XE_HW_ERR_TILE_UNSPEC},
> +	[17 ... 19] =  {"Undefined",		XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
> +	[20]        =  {"MERT Data Parity",	XE_HW_ERR_TILE_NONFATAL_MERT},
> +	[21 ... 31] =  {"Undefined",            XE_HW_ERR_TILE_NONFATAL_UNKNOWN},
> +};
> +
> +static const struct err_name_index_pair pvc_err_stat_correctable_reg[] = {
> +	[0]         =  {"GT",			XE_HW_ERR_TILE_UNSPEC},
> +	[1 ... 7]   =  {"Undefined",		XE_HW_ERR_TILE_CORR_UNKNOWN},
> +	[8]         =  {"GSC",			XE_HW_ERR_TILE_UNSPEC},
> +	[9 ... 31]  =  {"Undefined",		XE_HW_ERR_TILE_CORR_UNKNOWN},
> +};
> +
> +static void xe_assign_hw_err_regs(struct xe_device *xe)
> +{
> +	const struct err_name_index_pair **dev_err_stat = xe->hw_err_regs.dev_err_stat;
> +
> +	/* Error reporting is supported only for DG2 and PVC currently. */

what about BMG? It is strange that DG2 has it but BMG hasn't...

> +	if (xe->info.platform == XE_DG2) {
> +		dev_err_stat[HARDWARE_ERROR_CORRECTABLE] = dg2_err_stat_correctable_reg;
> +		dev_err_stat[HARDWARE_ERROR_NONFATAL] = dg2_err_stat_nonfatal_reg;
> +		dev_err_stat[HARDWARE_ERROR_FATAL] = dg2_err_stat_fatal_reg;
> +	}
> +
> +	if (xe->info.platform == XE_PVC) {
> +		dev_err_stat[HARDWARE_ERROR_CORRECTABLE] = pvc_err_stat_correctable_reg;
> +		dev_err_stat[HARDWARE_ERROR_NONFATAL] = pvc_err_stat_nonfatal_reg;
> +		dev_err_stat[HARDWARE_ERROR_FATAL] = pvc_err_stat_fatal_reg;
> +	}
> +}
> +
> +static bool xe_platform_has_ras(struct xe_device *xe)
> +{
> +	if (xe->info.platform == XE_PVC || xe->info.platform == XE_DG2)
> +		return true;
> +
> +	return false;
> +}
> +
> +static void
> +xe_update_hw_error_cnt(struct drm_device *drm, struct xarray *hw_error, unsigned long index)
> +{
> +	unsigned long flags;
> +	void *entry;
> +
> +	entry = xa_load(hw_error, index);
> +	entry = xa_mk_value(xa_to_value(entry) + 1);
> +
> +	xa_lock_irqsave(hw_error, flags);
> +	if (xa_is_err(__xa_store(hw_error, index, entry, GFP_ATOMIC)))
> +		drm_err_ratelimited(drm,
> +				    HW_ERR "Error reported by index %ld is lost\n", index);
> +	xa_unlock_irqrestore(hw_error, flags);
> +}
> +
> +static void
> +xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
> +{
> +	const char *hw_err_str = hardware_error_type_to_str(hw_err);
> +	const struct hardware_errors_regs *err_regs;
> +	const struct err_name_index_pair *errstat;
> +	unsigned long errsrc;
> +	unsigned long flags;
> +	const char *name;
> +	u32 indx;
> +	u32 errbit;
> +
> +	if (!xe_platform_has_ras(tile_to_xe(tile)))
> +		return;
> +
> +	spin_lock_irqsave(&tile_to_xe(tile)->irq.lock, flags);
> +	err_regs = &tile_to_xe(tile)->hw_err_regs;
> +	errstat = err_regs->dev_err_stat[hw_err];
> +	errsrc = xe_mmio_read32(&tile->mmio, DEV_ERR_STAT_REG(hw_err));
> +	if (!errsrc) {
> +		drm_err_ratelimited(&tile_to_xe(tile)->drm, HW_ERR
> +				    "TILE%d reported DEV_ERR_STAT_REG_%s blank!\n",
> +				    tile->id, hw_err_str);
> +		goto unlock;
> +	}
> +
> +	if (tile_to_xe(tile)->info.platform != XE_DG2)
> +		drm_dbg(&tile_to_xe(tile)->drm, HW_ERR
> +			"TILE%d reported DEV_ERR_STAT_REG_%s=0x%08lx\n",
> +			tile->id, hw_err_str, errsrc);
> +
> +	for_each_set_bit(errbit, &errsrc, XE_RAS_REG_SIZE) {
> +		name = errstat[errbit].name;
> +		indx = errstat[errbit].index;
> +
> +		if (hw_err == HARDWARE_ERROR_CORRECTABLE &&
> +		    tile_to_xe(tile)->info.platform != XE_DG2)
> +			drm_warn(&tile_to_xe(tile)->drm,
> +				 HW_ERR "TILE%d reported %s %s error, bit[%d] is set\n",
> +				 tile->id, name, hw_err_str, errbit);
> +
> +		else if (tile_to_xe(tile)->info.platform != XE_DG2)
> +			drm_err_ratelimited(&tile_to_xe(tile)->drm,
> +					    HW_ERR "TILE%d reported %s %s error, bit[%d] is set\n",
> +					    tile->id, name, hw_err_str, errbit);
> +
> +		if (indx != XE_HW_ERR_TILE_UNSPEC)
> +			xe_update_hw_error_cnt(&tile_to_xe(tile)->drm,
> +					       &tile->errors.hw_error, indx);
> +	}
> +
> +	xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err), errsrc);
> +unlock:
> +	spin_unlock_irqrestore(&tile_to_xe(tile)->irq.lock, flags);
> +}
> +
> +/*
> + * XE Platforms adds three Error bits to the Master Interrupt
> + * Register to support error handling. These three bits are
> + * used to convey the class of error:
> + * FATAL, NONFATAL, or CORRECTABLE.
> + *
> + * To process an interrupt:
> + *       Determine source of error (IP block) by reading
> + *	 the Device Error Source Register (RW1C) that
> + *	 corresponds to the class of error being serviced
> + *	 and log the error.
> + */
> +void
> +xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
> +{
> +	enum hardware_error hw_err;
> +
> +	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
> +		if (master_ctl & XE_ERROR_IRQ(hw_err))
> +			xe_hw_error_source_handler(tile, hw_err);
> +	}
> +}
> +
> +/*
> + * xe_process_hw_errors - checks for the occurrence of HW errors
> + *
> + * Fatal will result in a card warm reset and driver will be reloaded.
> + * This checks for the HW Errors that might have occurred in the
> + * previous boot of the driver.
> + */
> +static void xe_process_hw_errors(struct xe_device *xe)
> +{
> +	struct xe_mmio *root_mmio = xe_root_tile_mmio(xe);
> +
> +	u32 dev_pcieerr_status, master_ctl;
> +	struct xe_tile *tile;
> +	int i;
> +
> +	dev_pcieerr_status = xe_mmio_read32(root_mmio, DEV_PCIEERR_STATUS);
> +
> +	for_each_tile(tile, xe, i) {
> +		if (dev_pcieerr_status & DEV_PCIEERR_IS_FATAL(i))
> +			xe_hw_error_source_handler(tile, HARDWARE_ERROR_FATAL);
> +
> +		master_ctl = xe_mmio_read32(&tile->mmio, GFX_MSTR_IRQ);
> +		xe_hw_error_irq_handler(tile, master_ctl);
> +		xe_mmio_write32(&tile->mmio, GFX_MSTR_IRQ, master_ctl);
> +	}
> +	if (dev_pcieerr_status)
> +		xe_mmio_write32(root_mmio, DEV_PCIEERR_STATUS, dev_pcieerr_status);
> +}
> +
> +void xe_init_hw_errors(struct xe_device *xe)
> +{
> +	xe_assign_hw_err_regs(xe);
> +	xe_process_hw_errors(xe);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
> new file mode 100644
> index 000000000000..398e2a7f2ac6
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_hw_error.h
> @@ -0,0 +1,50 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +#ifndef XE_HW_ERRORS_H_
> +#define XE_HW_ERRORS_H_
> +
> +#include <linux/stddef.h>
> +#include <linux/types.h>
> +
> +#define XE_RAS_REG_SIZE 32
> +
> +/* Error categories reported by hardware */
> +enum hardware_error {
> +	HARDWARE_ERROR_CORRECTABLE = 0,
> +	HARDWARE_ERROR_NONFATAL = 1,
> +	HARDWARE_ERROR_FATAL = 2,
> +	HARDWARE_ERROR_MAX,
> +};
> +
> +/* Count of Correctable and Uncorrectable errors reported on tile */
> +enum xe_tile_hw_errors {
> +	XE_HW_ERR_TILE_UNSPEC = 0,
> +	XE_HW_ERR_TILE_FATAL_SGGI,
> +	XE_HW_ERR_TILE_FATAL_SGLI,
> +	XE_HW_ERR_TILE_FATAL_SGUNIT,
> +	XE_HW_ERR_TILE_FATAL_SGCI,
> +	XE_HW_ERR_TILE_FATAL_MERT,
> +	XE_HW_ERR_TILE_FATAL_UNKNOWN,
> +	XE_HW_ERR_TILE_NONFATAL_SGGI,
> +	XE_HW_ERR_TILE_NONFATAL_SGLI,
> +	XE_HW_ERR_TILE_NONFATAL_SGUNIT,
> +	XE_HW_ERR_TILE_NONFATAL_SGCI,
> +	XE_HW_ERR_TILE_NONFATAL_MERT,
> +	XE_HW_ERR_TILE_NONFATAL_UNKNOWN,
> +	XE_HW_ERR_TILE_CORR_SGUNIT,
> +	XE_HW_ERR_TILE_CORR_UNKNOWN,
> +};
> +
> +struct err_name_index_pair {
> +	const char *name;
> +	const u32 index;
> +};
> +
> +struct xe_device;
> +struct xe_tile;
> +
> +void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
> +void xe_init_hw_errors(struct xe_device *xe);
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 5df5b8c2a3e4..1e9cfb8bb85d 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -468,6 +468,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>  		xe_mmio_write32(mmio, GFX_MSTR_IRQ, master_ctl);
>  
>  		gt_irq_handler(tile, master_ctl, intr_dw, identity);
> +		xe_hw_error_irq_handler(tile, master_ctl);
>  
>  		/*
>  		 * Display interrupts (including display backlight operations
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index d49ba3401963..b00c517e5559 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -91,6 +91,8 @@
>   */
>  static int xe_tile_alloc(struct xe_tile *tile)
>  {
> +	xa_init(&tile->errors.hw_error);
> +
>  	tile->mem.ggtt = xe_ggtt_alloc(tile);
>  	if (!tile->mem.ggtt)
>  		return -ENOMEM;
> -- 
> 2.25.1
> 
