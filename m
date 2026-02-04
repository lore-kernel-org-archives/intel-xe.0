Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E4BEA7940
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 18:56:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B051C10E37A;
	Wed,  4 Feb 2026 18:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VLXLLEW7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1CD10E37A
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Feb 2026 18:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770231392; x=1801767392;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=iJ02cuFaL0g4Fv7zsF3DpiN96YZZunB4PNi/wYNIzdc=;
 b=VLXLLEW7pa0HWRG26B/sUx+dNv7jsVbix1EAtZ5kBkt6n2lY8zX4Bp4w
 InJlf3K+D+/WKY1YW/TF4hCHBkb0cUmbs3iTTPFVJBLCLcLLeEFShLSCd
 OmVbFGhafX8JFtfwWVqoG0o1p2cwHOmZAva2o+CCsxbMBVW/ZA15Xzyc3
 ohjGjRe3SQ3RdeVzFnaEo6iuAB0h/YKkvn2yhqe48FvWbvRejjt9Y7kFd
 KY3n1nEuvwKhZa/gWle43VugsGRpN7dIiK3N7nchxiNqQNYT4JF8Pyflp
 isrukHL/1dZU0dzMTTi+gUdSTXUaxicOgMMdOKRqRRwO+iqp1r51Bl6Y1 g==;
X-CSE-ConnectionGUID: RIBSOiZLQwOjXkZFTe/Ytg==
X-CSE-MsgGUID: Puvp6kvCRpOGA5cI+7Q7bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71483084"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="71483084"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 10:56:31 -0800
X-CSE-ConnectionGUID: kbZxb35VQqm58QffvWMG0Q==
X-CSE-MsgGUID: 5J9lCh5TT3yM2xgtEQElHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="209538581"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 10:56:31 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 10:56:30 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 10:56:30 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.13) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 10:56:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CpC6L11DcLw/U4D7NV6w+Z5AQK1xgzz+xMw50pr0BH4yfUnrsPFOEb0sHZQwPBBm2vHnIuKZtCHJfbjm2YuiOD4j6Db9WbZRPtdHtAGxosiKh+hR80cPq/Pg4SmQCqVOiOklRChJRkOB3duBg3gQBjtrqwTRtStjzCEuMyySiEYXUsuRv9aPUMagtsbcks8MA1iK85o8BRL6WweM4QXdZhdm0QUUdb/I433qvflQZT2T3WrITW26xsmQ3eaQ9/x2MoYoCI+GjEbeTwrTFeeGenrzQXwSUzd+VzGN9+qiOn2s/ka0pgTd8XindC7xjFPaZXkqoAS51RLN/KoGVjzUAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KT4JpXF4Jf98L1WsaTcXzaAqmBC/UzdodzUb3TsBGTk=;
 b=sGddyBZjoo6eRLLf6SFO+QRVJEdCX2AONhqcul8p7Sk/YadhTkQl2QYGnyFulbfwsA3QO3lBEk0QYcsoo8olb+p5yaXhGZoXqS2LO5K+QRI57ctog1VfRvTgjRmhqIX9RjLl9GWi3OuaUp1+Qmc62Ad7oo+pw2GOAunBbBAR0C3cZfRF1AEpsnFi1gJYMaP6zmpnV3bQbrsd+aPdS5YeMDr0rcoAcvXVL5GtzYXayqxfkX9sklgWu0JCYPtPuRF4PyEB+WPxGh2ryu3RXfknheWthYzv+8RCywm6bdN+lQOyTsrn9FePem+PmDSQZm5kMlLkuUlD8tZOhJKIsLtIeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH3PPFF8C186950.namprd11.prod.outlook.com (2603:10b6:518:1::d62)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.15; Wed, 4 Feb
 2026 18:56:28 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%3]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 18:56:27 +0000
Date: Wed, 4 Feb 2026 10:56:24 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Falkowski
 <john.falkowski@intel.com>, Michal Mrozek <michal.mrozek@intel.com>
Subject: Re: [PATCH] drm/xe/uapi: Introduce a flag to disallow vm overcommit
 in fault mode
Message-ID: <aYOWWAg9O1KUhnpO@lstrano-desk.jf.intel.com>
References: <20260204153320.17989-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260204153320.17989-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::15) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH3PPFF8C186950:EE_
X-MS-Office365-Filtering-Correlation-Id: 25d021ff-3f28-41f1-c8e9-08de641f19f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?hnhz+0LhMoL2avmISEksV+52aTUs/Pz+9qZIkYcfZVjoPCNgm0xGb/fbdl?=
 =?iso-8859-1?Q?2zttkmkdlh1D1TLCXKAYvKDoPzSEfV0yxYZfO67JewJSKaE+W6fmQIcS2F?=
 =?iso-8859-1?Q?94qRJbaEunm0ubjXx1WprHCQ8knF0Jdo1gfVuuGKEQVL6aRMmhYNGYSDAI?=
 =?iso-8859-1?Q?Bme0e/bJT+zHssEGjUJLFsdMCPT5Qodwlzzv37ROtPs9I/arL+3uxhMJCg?=
 =?iso-8859-1?Q?NpbkmreKUl30UlZpxvOaYbH9hNXYun+mA3oiNoLip6+yyH4Eas4ebXHxHW?=
 =?iso-8859-1?Q?yr2BEBkWQ/LyJUys485EYcBxuFuoQ0Oz3QjI0/cjtJq8pu9VLZVm/oyH1J?=
 =?iso-8859-1?Q?pc5lrScwU4ZeTQEN9xInXWJd4eKCxY5cd5HfSspOurKpc6Im5LUUyGnGyp?=
 =?iso-8859-1?Q?VhpW1HKDmDH5anFqQ5YNtI2UkMKy050GpRIjfwZCe960R8p455n0rKh1q4?=
 =?iso-8859-1?Q?/UhrNB7fPy5iJAcYAjLZfzh0VH8fMrArtgoGaV+yy3H7NUnjY5AXZyU/Ql?=
 =?iso-8859-1?Q?hDquFmwMBHzaFDWZBxdxHmD0dFYxUK4OwUvMWPHr9itAL8gpMuMykGrylV?=
 =?iso-8859-1?Q?pizJmMhGBtbZ1qUDeBjFyKbqiy5dx+amGJNJB36/fqTS4pR2xKcensDO6c?=
 =?iso-8859-1?Q?DML9h5kTu451Xl9VT29/42OGHfF5IIWegqBIZfvnEop6Q70v2AIBhoOCPo?=
 =?iso-8859-1?Q?SiAkJfQdZD9ttZDSgn61n5kGoq6nkJiwCkNWE4QITM5iS5rLUzmFut/EBr?=
 =?iso-8859-1?Q?engEk5diOPBXbOh2AgQZHz4CQp6uceDwC7wjzplafc1MgdPefjs5vRbuj/?=
 =?iso-8859-1?Q?Qm10hvhp4cIE/NzfInGoR2pj1JwFSOrQXMR68JX12BrbVnvi4sj4tWsJCR?=
 =?iso-8859-1?Q?SK4uC6OsBamHKtmMQah+ocHaezCBanUdBKhe4tI8BZbhqrP5uE8IYBXLlu?=
 =?iso-8859-1?Q?xmSOdgewgPbnxOO4dcWIatQnVroMLbVNnRhp80+OjzUQJKSXI4t2bQBSDT?=
 =?iso-8859-1?Q?ecKD91F9D8odjkIhxxchzkUoeGpjySqPA13ZEG9ttVEhfctAaEJZspoT5f?=
 =?iso-8859-1?Q?Em2xu6lSgTMple17xU+74EPHFvh+JSJosCR/YENaVW/vYGNPdLHPYS+CJ3?=
 =?iso-8859-1?Q?s9xbVv4/2FQQocK09Yz4WzLyvAXyiGWAVcEHItR7q1kaYvsVyJafApqEzo?=
 =?iso-8859-1?Q?gtqTD+GpBGeaK2BwnZn56r0gES8TOvPNAEZOuMJ49sDiQe/WTynDI7hFHS?=
 =?iso-8859-1?Q?h+6E0zMq7ktQJqe+uCHVotMFlHWSe/XvONvy80RodPuQ9GiGdso00XgNLV?=
 =?iso-8859-1?Q?AhTTbQyBZdhTDT77jOgPJ7RG2qbK4YAGfxBquiBK4vCi6Asys9ymRMBMbZ?=
 =?iso-8859-1?Q?J0QlFd3YY4OaylqtnDcFKY2xxzuRcte4f+UQD5sJERBcFBLy3M8GeHaHMR?=
 =?iso-8859-1?Q?35mOwa0LwWa/YmopxWiAf8PoEkZaRyEEiio1z/tst9LomiMDFonX/ldq/j?=
 =?iso-8859-1?Q?BavTfSaijCZYLdgU3Hv1qOzyeqF2K719MaGFcoI0yNsBXRhB2/jP0l2B+r?=
 =?iso-8859-1?Q?naUp3JU8oWzQtEaNs8iw5f0WFfoSmfrm+zD+P+12TE4If4wDNmYmw8yb6i?=
 =?iso-8859-1?Q?T/QwB0v2TH/I8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?M/PntLkqAUnmjYUP5G8lZSGx6ZEUgU8Oixzffcp7UqUsT2mKrkhfxkPXjP?=
 =?iso-8859-1?Q?h7Vz373loE10MlXhO8PGW8lyCe2+Ad7OfA1FUEAGKtY0N57bm6hPwfgNSm?=
 =?iso-8859-1?Q?u7BrrUKH+1mO832wpEpIbhEPMelzd+qwOBMVDioBKLNjqm+2csbgScRSrq?=
 =?iso-8859-1?Q?SiNW/aIv1k08lIVPni6940cjRHSBIibo45g6RGqj89df9VTM86r9MQRHDt?=
 =?iso-8859-1?Q?Xx/SQNevzJ6PWuFbvhsYRYX6C55F+ERunIkDrkQlqXfsCtTDPbmnJ5mGqP?=
 =?iso-8859-1?Q?7vTPp2/d26ZzpylGt0yFVEPYtk0UHzfZ2zsH6YmxMHYGkZ8SB83y5ZNenA?=
 =?iso-8859-1?Q?x8IsVhb5qsAWjINocTpXDTwGDXHaJUjRL+9ZleQhUwRCYjbOSNNu0Ll/J8?=
 =?iso-8859-1?Q?CSVe0khUmQijTn0XmLshP6gNk7HUqyDxJzRuSY41VyD5VnmA6BHARaXT9C?=
 =?iso-8859-1?Q?3R2qmCRSYrGD40ItwlYItgenrDNJmK0Yr8MSdlYgklKhkS8SkycE91GKVJ?=
 =?iso-8859-1?Q?5IqAYklLcwS88eqO2wAu3T96fN8iNs+g13um6tTeqiYTLlCe3E4mQ4yW6i?=
 =?iso-8859-1?Q?TVEareLuZkLU7UvIZW9AIcsYA/pHKYZ6VTIlApDg+9Nzs4VHSE4CY11zUj?=
 =?iso-8859-1?Q?VNZv1a60GQdbsY9iwRIGPLSPZmjb7lGIcPyvt5z3WAFU1ha/DPq2WTgZgF?=
 =?iso-8859-1?Q?yxeSnSLCPHapB/zka8x6T46LXpWfGAIBUZmTFJARKBIp7XIS6LlSuTXJBX?=
 =?iso-8859-1?Q?Mb/PPGoIeQNm0k1HTpLeYtvRcd3xwFtF1mPTCQyrb2IbIO+JtP1lWj4X+e?=
 =?iso-8859-1?Q?a1Ob4jlL72IQfmhor4Y4v8B3jt+fdpAyO1clSdbJsWz5stvFgpbWfq9wJ/?=
 =?iso-8859-1?Q?/FJ2FZZekPQNmhWLg7QBQW+4jNbBuspEMwIl7im6zyK8NDfBifoqZrojs2?=
 =?iso-8859-1?Q?5FJrWWa15iUU1N26R0TGGnxx4GX8irx3IcQk4Zlx3bSQv/Yjd3b63g1Yug?=
 =?iso-8859-1?Q?Bo66hZuB6gPQ4qK5IMs4JrXCpu5r2z+DX/lRlnFfPqLJdH8YodIynyhBGu?=
 =?iso-8859-1?Q?HW8Zm3x9JLIejStbkn7iITlxaW3zt05YXqL4LGzz93VQsvoXV+0hTCmmED?=
 =?iso-8859-1?Q?XdPWd85PeD9hBxJBlT3rNHuqLsmZpaFomIBGaVCI+J1cH+yZAdOG8dEa+Z?=
 =?iso-8859-1?Q?tGTB4/n+T9eiuVtQEC8CNvCp8GqK7iifyv+eSagVNXY3Ms2anAs6zJ1OIH?=
 =?iso-8859-1?Q?O7CMTGP0/BH1Q2fi5enNndn/3KbQkFcgTnCjac0+rY0sepvqho/chKdESC?=
 =?iso-8859-1?Q?ZX5h5nlgP9Q8aVPsZBiMbHg41k7hqBPQ8E/Ko+nBYX4qthAdrL76F9x9ma?=
 =?iso-8859-1?Q?HlARN/HUKj+R/raS9Hm+WWqQ1UwOL5oUz21i9p9GeKwDwLytzAeRKoDRt/?=
 =?iso-8859-1?Q?OTHCgg1WL4wxo8DYvido4Fts3GdlbTOc5V//HT+yXR8ua0QyxiSgvYIufZ?=
 =?iso-8859-1?Q?BknxFbE9UuQnqAbrItLzFfAZXTKsy4np6YKPMbHCqYJ7Q9wEtM1CYU7Q53?=
 =?iso-8859-1?Q?G4YEqU2y7iELD1Ip2PcSoy1tjo0flAwXobJb4LT4k5uhDHzi5BEqhdpqr7?=
 =?iso-8859-1?Q?P7YcfL25DaTOiwZFfB+bMJU7r0g/OkuGSJge4cnwvn+MOuczYKFpXUsZPj?=
 =?iso-8859-1?Q?dkfmrLJtjF+MEv5wqN7z0AHyYC9C9ZI7utLHMYtnTCnbNl8LJoUUUiQ7v7?=
 =?iso-8859-1?Q?x238c5xNcBotlZMDNbFSGLeAMoA3iMqCkwqXgUXiy1XLHUpyBCiEuQh4W/?=
 =?iso-8859-1?Q?Jc93ZFAj2w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25d021ff-3f28-41f1-c8e9-08de641f19f5
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 18:56:27.8056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7VjR0Nzr5KcLZTRFYhKNHHTBwgIJZnRu/ltpEWCXkOdSg1e3Rupu/WxBs/G1q+7r6cnD+74+KqONlRl5PI78HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFF8C186950
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

On Wed, Feb 04, 2026 at 04:33:20PM +0100, Thomas Hellström wrote:
> Some compute applications may try to allocate device memory to probe
> how much device memory is actually available, assuming that the
> application will be the only one running on the particular GPU.
> 
> That strategy fails in fault mode since it allows VM overcommit.
> 
> While this could be resolved in user-space it's further complicated
> by cgroups potentially restricting the amount of memory available
> to the application.
> 
> Introduce a vm create flag, DRM_XE_VM_CREATE_NO_VM_OVERCOMMIT, that
> allows fault mode to mimic the behaviour of !fault mode WRT this. It
> blocks evicting same vm bos during VM_BIND processing. However,
> it does *not* block evicting same-vm bos during pagefault
> processing, preferring eviction rather than VM banning in
> OOM situations.
> 
> Cc: John Falkowski <john.falkowski@intel.com>
> Cc: Michal Mrozek <michal.mrozek@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c       | 11 +++++++++--
>  drivers/gpu/drm/xe/xe_vm.h       |  7 +++++++
>  drivers/gpu/drm/xe/xe_vm_types.h |  1 +
>  include/uapi/drm/xe_drm.h        |  6 ++++++
>  4 files changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 8fe54a998385..cf92b6e13a16 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1938,7 +1938,8 @@ find_ufence_get(struct xe_sync_entry *syncs, u32 num_syncs)
>  
>  #define ALL_DRM_XE_VM_CREATE_FLAGS (DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE | \
>  				    DRM_XE_VM_CREATE_FLAG_LR_MODE | \
> -				    DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
> +				    DRM_XE_VM_CREATE_FLAG_FAULT_MODE | \
> +				    DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT)
>  
>  int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>  		       struct drm_file *file)
> @@ -1977,12 +1978,18 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>  			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
>  		return -EINVAL;
>  
> +	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE) &&
> +			 args->flags & DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT))
> +		return -EINVAL;
> +
>  	if (args->flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE)
>  		flags |= XE_VM_FLAG_SCRATCH_PAGE;
>  	if (args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE)
>  		flags |= XE_VM_FLAG_LR_MODE;
>  	if (args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
>  		flags |= XE_VM_FLAG_FAULT_MODE;
> +	if (args->flags & DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT)
> +		flags |= XE_VM_FLAG_NO_VM_OVERCOMMIT;
>  
>  	vm = xe_vm_create(xe, flags, xef);
>  	if (IS_ERR(vm))
> @@ -2903,7 +2910,7 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
>  			err = drm_exec_lock_obj(exec, &bo->ttm.base);
>  		if (!err && validate)
>  			err = xe_bo_validate(bo, vm,
> -					     !xe_vm_in_preempt_fence_mode(vm) &&
> +					     xe_vm_allow_vm_eviction(vm) &&

One question. This is existing code but can you refresh my memory why we
allow overcommit on dma-fencing VMs? Wouldn't the next exec IOCTL
immediately fail?

Matt

>  					     res_evict, exec);
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 288115c7844a..f849e369432b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -220,6 +220,13 @@ static inline bool xe_vm_in_preempt_fence_mode(struct xe_vm *vm)
>  	return xe_vm_in_lr_mode(vm) && !xe_vm_in_fault_mode(vm);
>  }
>  
> +static inline bool xe_vm_allow_vm_eviction(struct xe_vm *vm)
> +{
> +	return !xe_vm_in_lr_mode(vm) ||
> +		(xe_vm_in_fault_mode(vm) &&
> +		 !(vm->flags & XE_VM_FLAG_NO_VM_OVERCOMMIT));
> +}
> +
>  int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q);
>  void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q);
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 43203e90ee3e..1f6f7e30e751 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -232,6 +232,7 @@ struct xe_vm {
>  #define XE_VM_FLAG_TILE_ID(flags)	FIELD_GET(GENMASK(7, 6), flags)
>  #define XE_VM_FLAG_SET_TILE_ID(tile)	FIELD_PREP(GENMASK(7, 6), (tile)->id)
>  #define XE_VM_FLAG_GSC			BIT(8)
> +#define XE_VM_FLAG_NO_VM_OVERCOMMIT     BIT(9)
>  	unsigned long flags;
>  
>  	/**
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 077e66a682e2..e54f8e12acd9 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -975,6 +975,11 @@ struct drm_xe_gem_mmap_offset {
>   *    demand when accessed, and also allows per-VM overcommit of memory.
>   *    The xe driver internally uses recoverable pagefaults to implement
>   *    this.
> + *  - %DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT - Requires also
> + *    DRM_XE_VM_CREATE_FLAG_FAULT_MODE. This disallows per-VM overcommit
> + *    but only during a &DRM_IOCTL_XE_VM_BIND operation with the
> + *    %DRM_XE_VM_BIND_FLAG_IMMEDIATE flag set. This may be useful for
> + *    user-space naively probing the amount of available memory.
>   */
>  struct drm_xe_vm_create {
>  	/** @extensions: Pointer to the first extension struct, if any */
> @@ -983,6 +988,7 @@ struct drm_xe_vm_create {
>  #define DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE	(1 << 0)
>  #define DRM_XE_VM_CREATE_FLAG_LR_MODE	        (1 << 1)
>  #define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 2)
> +#define DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT  (1 << 3)
>  	/** @flags: Flags */
>  	__u32 flags;
>  
> -- 
> 2.52.0
> 
