Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336F9D70DF2
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 20:40:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B8010EB4F;
	Thu, 18 Dec 2025 20:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YNt2CV3/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D800D10EB4F
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 20:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766090458; x=1797626458;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5/zhBDgrNI4gudDS7D8ACla9RND2z7+1NntlTlo0z6s=;
 b=YNt2CV3/cS8QgbaUTF2nDV0cOnt+b2Bic9XzGZTsRw5kZhoY1+AzJvGn
 yLmm19ZOiQaBWgQ0C2q2E6quLeAdoSl+JDIE+kW80zHxMVOTfcV0QDgzW
 hta90qrjrFCvo4yVLk9QdVncPgTUJT8ask7RztOGOjZ+imo5UHLEK/TFF
 1od2vcQ/9ur+58C9n8D85KzW9JSmd0FNtMRCy82X7GOEUn7LG5dYA0/Hr
 qdUOQt7T/zva+StijdvKr4ExProSfYyfDbyswiPlZ1fphvAwFJfjbAewS
 q76v106zzOBCkxZ62O7o0ub0VPBofUALRhAtqWKk2BFFIPZnWa+LYdGol Q==;
X-CSE-ConnectionGUID: GkhUIli/Qr+qHiFTJMyuAQ==
X-CSE-MsgGUID: VevW3uoJRLmIwFj/FAW57g==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68129264"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="68129264"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 12:40:57 -0800
X-CSE-ConnectionGUID: wCwrU8jCRquhCNIhLn0iew==
X-CSE-MsgGUID: A8Ma0o7eR2axj515hO3hyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="198944882"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 12:40:57 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 12:40:56 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 12:40:56 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.30) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 12:40:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q91h0O+KR2dXauB+95www90c3UMLIENeAfhJGDRrCalWbN0OXqDmQ6OuzrLILq+VahW8caxhy8uOQT5T7dPJa0RuIaGW+tCTjDlXMCWrQMTjcOUdJhj//8EZB6ThYpmsOSyXUOMGxAAlFKh5iO54DtmBDHfuq1RkT5uCr6tWm3u98QLh1ma6jhReUU9FST68TEqrWkTVTlg4WsbhLwCceBfLXLoau3IdOn+s7cJPET/wUdmIrHFd+iIQLHOoVh2F1Uz9o8ah3jZeHJemjZYIQbqPZ2kvO6MNTNr5EDFJWHenH4W05YIpqp8o3ELyBL7rtSWJkaUdcUAH7ilcBVYSSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g5aq7W7OrnWyVW1shMi2KjwYDRBcRCbDB0u/HuP6n2I=;
 b=hMz8sSoYBJRT6KOo2NenNLtoIpqFPOWFOp/rocc/lZp+E1xCCjaj0lHQ1wFKuq1a1iB5BqczN2nLaiYK2bvXnp8AzA8O9YXVfOZx9zOpWTjg/BppykV0TN14L57ZGWVMXKnDkAgm8b+aJM+S3bATdqcgotXMO119DHQAW92X7kNiQFwjdTvce4S/Rjn2NiPLjnTIfLpe3pB0MCAtHGIM8sSjEiKbDMmcqbXA/VBNmO7BfLXCCAR+GP3uRLGdog0p5TazPyN+qJWD7cF8+B0dnXCl9K6sQM/D6oqWNleEgvEB0sx9cyXcXkR0ovtVWfchlh+qVCf0NKQfS9xtuTUGow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB5911.namprd11.prod.outlook.com (2603:10b6:303:16b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Thu, 18 Dec
 2025 20:40:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 20:40:54 +0000
Date: Thu, 18 Dec 2025 12:40:52 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, =?iso-8859-1?Q?Jos=E9?= Roberto de Souza
 <jose.souza@intel.com>, Michal Mrozek <michal.mrozek@intel.com>, Carl Zhang
 <carl.zhang@intel.com>, <stable@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] drm/xe/uapi: disallow bind queue sharing
Message-ID: <aURm1LgtNPYNxRCP@lstrano-desk.jf.intel.com>
References: <20251120132727.575986-4-matthew.auld@intel.com>
 <20251120132727.575986-5-matthew.auld@intel.com>
 <fh6dgogrt3ibrod7qkguejy4bj3cmvlbnxksmedhvfx3ejglk2@nu3h6doh7sdx>
 <cc27ae58-b579-4332-9653-c62b38f32add@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cc27ae58-b579-4332-9653-c62b38f32add@intel.com>
X-ClientProxiedBy: BY5PR17CA0013.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB5911:EE_
X-MS-Office365-Filtering-Correlation-Id: ffde711c-37eb-41ac-7445-08de3e75bda3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?EMJFP3MHVsQYWRzNS7xvKJuUj9aCyTStS98d1cpRaRWhy2Gz3NNceHLz4M?=
 =?iso-8859-1?Q?zDq1Gy0Ot/nxkLCAr0eAP9vZdarLelSQHMoEtucU+8mKF30DRSQln4Gitq?=
 =?iso-8859-1?Q?iZvg3x88LDd1RaJoZ3MQwWM7jIwN6Ka+lMaN0B6oYolBEvaP3XlN3Xr/tA?=
 =?iso-8859-1?Q?luCpITRtWzsG1AcXTRNaJu2dl9ZYTGWI22mfEr4q8CgBkx78fSBaxnVmqT?=
 =?iso-8859-1?Q?tk+1ZNAX+Z62QGsNlt4N6vgcH0OlEk8mLYxr9tXM9kdMnfWWvvqe2W+Yaa?=
 =?iso-8859-1?Q?ZFRL9zS3sDL3lVQYpZwAtLE3CoP8JdMhpesXNuHK9HhoLCaCcefG3cT7Qx?=
 =?iso-8859-1?Q?rDHsEQP97R+3GJ/qqiQibnJfnfmLNiRJWkuuE6KB4GW9Ba878r3SQmIghn?=
 =?iso-8859-1?Q?5V+7895bI1PV4qEdKQKLZfJL/VT4hFqubNxuwm4XBbEglnHmqtHI+e6jT7?=
 =?iso-8859-1?Q?R38NDxDGJF2TVGc4wejJEUoPBUWOqYu0FrJZDbSwwI1a95enJKC9VUYddi?=
 =?iso-8859-1?Q?OQaeUdsXoHItq+kvvqvPD9eadFUa/fFkdzqRfj1HS+Mb1zN3L0EdMoFHKX?=
 =?iso-8859-1?Q?HRVIqrGDBZnM+iiELFrWt63PZ3aHx80mndyy3L/39qEwM+qHeUbPHoy9Tx?=
 =?iso-8859-1?Q?ur/1i8jOAozxhDoIGQ8F/o8nCDikgSAhpfKoL+0ZyyvFOZAahvfeWfMLvA?=
 =?iso-8859-1?Q?959SaXkhBNZQIJPkAdUNAuN0/DD6Oy+85rDV2lLvwJgitL9l9V9AW/15MJ?=
 =?iso-8859-1?Q?ZsmqPIqXSEPOHJNwJ4dVo7eKZHFSLzSH0hymIdhJ3SXDRoxgXUEayRHBNM?=
 =?iso-8859-1?Q?A9RHK/cWRI7hdY+OjgaVO2tdJJhb/0Tn4J+/tBCmBg81uUuNQTdc4HbUzD?=
 =?iso-8859-1?Q?AsWmhLU7gtQBkBSF2VUpVlM6+tuZHrmv7ryHLYTlDNQOash7PMpBns7rnv?=
 =?iso-8859-1?Q?zrNaPbikzIYPgP2T5C/XIGZKJ+zAficdH9/cd6ZKYj9FmccraKZFT31GZV?=
 =?iso-8859-1?Q?x8UXCcRXjswqHFB7I/psblYu4npEjIv9GY5omg2mT+I2NBuaV//siErqiC?=
 =?iso-8859-1?Q?FuEPv3Rf9AXMHcVHjXcNaraYbLJ3x6eMh2Nbd/6by41WH6EvYkMMnlBehD?=
 =?iso-8859-1?Q?6mtbMWFBKmcwdojqx3bJbCY3ZtHP+VqKHzToCbGWqav8stazGoIkXEHLxv?=
 =?iso-8859-1?Q?+5sIsX2mbQgWWgkmhiVTWC0jNTXUvY47MwrUF2pC4zWo09oejSnSEmSjR5?=
 =?iso-8859-1?Q?m1K5R4bYVFxlWa58arM6F7U0NYGjt3V1aJKrSlwDJZbWbOur2Um2WIC1V0?=
 =?iso-8859-1?Q?5Fu4eqJErIeSzd1zfc1+Zl4NiFb5+yYJj3EwTITuqCEFWBIF1LHP+9Rozs?=
 =?iso-8859-1?Q?bE9HIwKQK7LawIbpuNn0yK0LjlwbwH/5BTrjKoSI75LP3XxRone19Q6irm?=
 =?iso-8859-1?Q?8az1OvDcINEszLrqH+6a4vUTyVC98/t19Haose54m9yJyJ1lgReXVzTifV?=
 =?iso-8859-1?Q?2+UDQgrth4bR2qe1BcUPw/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Fs8gjpQW4mgU3JBtEbcsc1vt8wepflgeTXC2wiiNb+nEw6GE7rZMYfr2Cd?=
 =?iso-8859-1?Q?foM5BQwKlNfZqpr/E7yxFyma+0M8xtSctNabnCdjAnfNydxBDqMidV3gse?=
 =?iso-8859-1?Q?m0CUXLzfYtR1BJL0P2a0t913p6Od+Eg7GSYN/SwRYBZ6lBfZmauG9nuzrL?=
 =?iso-8859-1?Q?uv0OYGQ6qFxNqkV2rT2iGYDKG2gzvjRj2Q5V3oH9Bqsm9W3/fiuHxdYUAo?=
 =?iso-8859-1?Q?P/OzbpdZv3+hTuoT1soZt06HbnRQK986KB1Hj7Vmypqo2NM8fW+MFboIZR?=
 =?iso-8859-1?Q?4tGMcJtCm86wxKeh6bHerEx+Vy+s3UQxvKqvXlJJ5l2MFw+niH19LocGrO?=
 =?iso-8859-1?Q?kIe5Jw1cV02H6sF3BNPWtCcbAGlWbrvVw4yawYbi37Kj0pLGKUtcoZUfC2?=
 =?iso-8859-1?Q?F038C28ngrBgmHnLVmXczpQbJQhWXGGRaNv5qwHaP3AG4S5gw3wiR+eCji?=
 =?iso-8859-1?Q?2bYekbmEPoy0Q19OsVgCOuaTzkw32hnmivnOpkncGu4ZNyUQ1G1g/8BcYD?=
 =?iso-8859-1?Q?BNqCzwBczg25g+Q/6jkxVjUUQXqju42+HTaqmBI7CGRDSo8ldJAEqQ02/J?=
 =?iso-8859-1?Q?Cz+O5sX6yiW31ExdkOKVflPrb1l/DWA2iyh5VcDU6M11sJvfLzOEgkUEcf?=
 =?iso-8859-1?Q?xNg46FAt3vHpcaAtJOyzo1iLyid85b6l6mHPH3Q3Nx7fhxpAL1Blhe4Od/?=
 =?iso-8859-1?Q?kAHemsGxLJnxxaPDbnXdCLWp39fcxxPDtngkij/3vZ9dlfS4uWUJr1c9CR?=
 =?iso-8859-1?Q?1fi3XNELz7pkMmQVRaFFh641CPm7Mn5z2OIZoCjSIH07ZFhOGexroEJmon?=
 =?iso-8859-1?Q?qrWhWfnfvqXprfD7IhmOnENYSKKmudGGmtDnDArbM5anxiMbtn9bhYazoH?=
 =?iso-8859-1?Q?9if5SgxgtbTAcIng1CN5lkTq34vIFxeGiZucy+0nniy4NrEhdVbWumeSzC?=
 =?iso-8859-1?Q?b7wDuINBc86Ew9uY/wvCRweZ3xCj47hN++3hBIdisoLfSiSCBco7lFYb4w?=
 =?iso-8859-1?Q?ufTEgEnZ6mIUc1p9uxG14453peg1I+nsT9l/8WVaQoodPGjSwx3uV2vUWW?=
 =?iso-8859-1?Q?8rV3Q/Rq/Y9B/wwdKsiyRoDvRicmx0UW+ANV7z186zixx2DRwndFP7jS+8?=
 =?iso-8859-1?Q?SiAEDihzoNjiYHb21GwGeethvdBGR0DwmxRF32Idh9FZhPqndoCb+UXioK?=
 =?iso-8859-1?Q?S4KAaFuftWyNNQQeAPwAuVK3uoWRzZwzzLwIx6odMKbRpuQShd11z4l6b9?=
 =?iso-8859-1?Q?D+USV8SC7kV79uBQoUCZyMOk32tAc516XNoJPP3CRsMb40eIJinZbL+g0Z?=
 =?iso-8859-1?Q?q5xiwDcbbaM4fJ8T9ObVWbjJsSzsSKNUDjwDmsns/Kg1di49nlnN2wKcoH?=
 =?iso-8859-1?Q?DOgboMi7qC0StLSdvHwDwe/ya+lPAPggHzpGLcN1MzBdOSy4hCOc1zN6m+?=
 =?iso-8859-1?Q?nKax58Wj4koyEdB4c50L9afLzx6zyQLvsM5aMPyMzGMnhbTPkgtvClq06N?=
 =?iso-8859-1?Q?JbI2/G4ejD15onhySvy7pnWaHALgD8jRadRXCAdioaOvNaK1rAgmJ/f696?=
 =?iso-8859-1?Q?prgLYUCKnEAeypFsM8SVj1Ta6Khw5STjZAnOdW82cFekSbC2PU/2UbX3lD?=
 =?iso-8859-1?Q?xzo0aBBr5+tzKquoHHhWZ+yD0moaMLb3auWjEbMfvajz1DSp2HZGkJFw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ffde711c-37eb-41ac-7445-08de3e75bda3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 20:40:54.9126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DgG/su+twZZWBFYrcNL4FaOCIWRHwIYCpE3wHLO0MWZtNucpJXJA9B5ST5nA88bTCdIgI+zNIvUvzbTLxcRzSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5911
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

On Mon, Nov 24, 2025 at 01:41:55PM +0000, Matthew Auld wrote:
> On 20/11/2025 15:34, Lucas De Marchi wrote:
> > On Thu, Nov 20, 2025 at 01:27:29PM +0000, Matthew Auld wrote:
> > > Currently this is very broken if someone attempts to create a bind
> > > queue and share it across multiple VMs. For example currently we assume
> > > it is safe to acquire the user VM lock to protect some of the bind queue
> > > state, but if allow sharing the bind queue with multiple VMs then this
> > > quickly breaks down.
> > > 
> > > To fix this reject using a bind queue with any VM that is not the same
> > > VM that was originally passed when creating the bind queue. This a uAPI
> > > change, however this was more of an oversight on kernel side that we
> > > didn't reject this, and expectation is that userspace shouldn't be using
> > > bind queues in this way, so in theory this change should go unnoticed.
> > > 
> > > Based on a patch from Matt Brost.
> > > 
> > > v2 (Matt B):
> > >  - Hold the vm lock over queue create, to ensure it can't be closed as
> > >    we attach the user_vm to the queue.
> > >  - Make sure we actually check for NULL user_vm in destruction path.
> > > v3:
> > >  - Fix error path handling.
> > > 
> > > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > > Reported-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: José Roberto de Souza <jose.souza@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Michal Mrozek <michal.mrozek@intel.com>
> > > Cc: Carl Zhang <carl.zhang@intel.com>
> > > Cc: <stable@vger.kernel.org> # v6.8+
> > 
> > we never had any platform officially supported back in 6.8. Let's make
> > it 6.12 to avoid useless backporting work.
> > 
> > > Acked-by: José Roberto de Souza <jose.souza@intel.com>
> > 
> > Michal / Carl, can you also ack compute/media are ok with this change?
> 
> Ping on this? I did a cursory grep for DRM_XE_ENGINE_CLASS_VM_BIND and found
> no users in compute-runtime or media-driver in upstream. This change should
> only be noticeable if you directly use DRM_XE_ENGINE_CLASS_VM_BIND to create
> a dedicated bind queue, which you then pass into vm_bind.
> 

Yes, ping? It would be good to get this series in.

Matt

> > 
> > Lucas De Marchi
> 
