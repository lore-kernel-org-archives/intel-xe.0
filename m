Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C348EEC2AB
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 22:59:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE99310E324;
	Mon, 23 Feb 2026 22:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HHxgfXv0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FCA810E324
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 22:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771887595; x=1803423595;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6goUjNwOjkieKxRlIko4DHCvjmQ+cJTLfk/L6qQ27MU=;
 b=HHxgfXv099iH42dXmv9hpqZZ8Scgf3jwsFXsPzHgteGFWceAWOfe7kNI
 O+eZPJuictIOTV/uvdEh9cpOKUWVFEyqw3jl4r8lGgduqBlHIetGxJyMU
 fNK+X/XNwwXsXZDhGMYS/wQ3kWHt2uphJwxsxMg1uUBzb0yNS91C6WbE4
 oEm8aLAQ8obpJL/kSdcoq6GqdGYyugR8YV2fofkkDWOQ35UewBZjPwCT5
 7qHq8IYkfuDoryEtqzBdKJlay8mvq/IVus+k9qMrDeA3NF8CwufzMxcWs
 BH12VeusiL73SzRNGEt6VWiD3lVfcvvKkqrAFC6j+hUBfBytMJPMH5LMF g==;
X-CSE-ConnectionGUID: ttwkXgvIS96TrBmK3dLLxw==
X-CSE-MsgGUID: hdAw/s+TQ0uPHWeJp437aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72870195"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72870195"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 14:59:55 -0800
X-CSE-ConnectionGUID: TTNr/lwWSZebPhVAKrdW0A==
X-CSE-MsgGUID: KbQCxklSSAaZoRXvz+NmwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="214088444"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 14:59:55 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 14:59:54 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 14:59:54 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.4) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 14:59:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fy3gzFcHMov09DhbDGYh99ZARmJ2KihkVbrwt33wYJYu0fu3VZypCwKGkJSvLU97lWU6Lwg6tDgDzfBZU9/JF3sQW0atny4BTDzN/l0iPm7wECHt23En9t4kakYYW9kCdKYxy48NE/BayxsIfpGIDDP6uu77fkYg23+lw79uiJ3OXHHgpgMm9jJ/UM8sVA5EcIpZj13SU7lTyT+8Y3Obm4g0yO38mmOcXMA99KOFmS5RQ9c5kn+GMXl7zN1ANoGTCIsEA2ympsTAEH5ZSIJoSSxCrHEroxM8f+oh0VUXUj/n2oiUVItktTpfFOSIArIn/xfRzqRrL4tK9aZTIChe7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xG4RWQacH3WiVU7PUkgscGbVAFW1HAVrLRKBD2yRT9E=;
 b=bedmT0sEf3s59soP4ofE3XqHvcdYx/OFdpfPEONBY8/lpgEh0EgPcH2WKLkkpDPvp14Cdxaa7lgVIHuFfU7tnUzGu335tNeLRdle+FCfRjYZQLH4DhWwZo9sL0uzOAJ+Pw0lAZdCzeXTEJ4ktxpVtFMsV4zbYaqeBcwUHz66mumAuAdOpShWtU5VMz0zYEYX16XPjDgr1rOpGqJxUwPTwoxR67NfGANcWYIWkbdzc/QQwBoBm4sgYiCJFwW/OiAqxc6Sqersrs7UyJatfA94HV0OjYQwlvQYvzZ6s0j6Qq4N/JCBDAGXxeY+OPUysifXEEQO+uDSIDobijbBk9xhHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7358.namprd11.prod.outlook.com (2603:10b6:8:135::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 22:59:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 22:59:51 +0000
Date: Mon, 23 Feb 2026 14:59:48 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nguyen, Brian3" <brian3.nguyen@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Skip over non leaf pte for PRL generation
Message-ID: <aZzb5COhqfv/3SBF@lstrano-desk.jf.intel.com>
References: <20260129082756.1096935-3-brian3.nguyen@intel.com>
 <be5e3d57544ece734dec2513ab4717e80b49adec.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be5e3d57544ece734dec2513ab4717e80b49adec.camel@intel.com>
X-ClientProxiedBy: MW4PR02CA0003.namprd02.prod.outlook.com
 (2603:10b6:303:16d::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7358:EE_
X-MS-Office365-Filtering-Correlation-Id: 3da7a283-aba7-400d-0abb-08de732f4044
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Ii9bzt27yJfTcIZwkW3zKt5ZVvnMykDqthQcDPz+AjjHeQ9SGwl1B1iQPe?=
 =?iso-8859-1?Q?VAv2IMLEMzeGOSW69kn7IGUzuOpFb4H7kCDfX6+K3ZMTGzqn86bAa25lSH?=
 =?iso-8859-1?Q?t1+0TO+YoohgIpN1g8ePesfCDFnE/vGmGaIGnuNRkSjXxNM8uX1Td2ERcE?=
 =?iso-8859-1?Q?BUy8pooKyJ+KQGACagB6Um1b6XazuAdPN0SX2M6+N+L2QvyCizC6WhgsbP?=
 =?iso-8859-1?Q?IEC87ABFW8Rfu+OIBGlG+OMLzqp8fCR9yS3ZoeXAuN3AIdyueb3g7SVsFp?=
 =?iso-8859-1?Q?GKPSyOZMT+5YUrkrv0VLhMyNcxlTN3devUJ2NgBEQFoGYPU04yoVecNTVJ?=
 =?iso-8859-1?Q?uWQIWe3auqz5fQVQsnkb6+IjR++BWTSzw6d/ljacU2ZoARcQ29pWBxWmEM?=
 =?iso-8859-1?Q?aDgF8042fZMKwjNg8JXnBi1GRF0599xcwIv8kuLOQZogDO/k2hi/R8rVSz?=
 =?iso-8859-1?Q?d0Y/S3GKN3u8Z67RlX3w0Hg23+daVXuRnqjTYvMUtyo+BC+PDabRwOj3w7?=
 =?iso-8859-1?Q?ulihTeZErl4FXQAJrqmVjpWukvRYCpcvTi3h1ciAxD1O27dIqXWT+5vD0Z?=
 =?iso-8859-1?Q?0pp7FUpmwd+CBt7Dh/skmLpBRWMFtO8lOQovg/j4/IkANhykcqafgmYnpd?=
 =?iso-8859-1?Q?ygUs8bpbIwcHzc14P2QiuLI9XRctq8/joL8+hBF8m9w1qf+ETn5GW1IN1S?=
 =?iso-8859-1?Q?7UNDezbqSXMck0Ok0VKwNFlTdrSRc7KUeUMhoUqOCgweCGaMGNIo5fBRVm?=
 =?iso-8859-1?Q?2iz9GFAw1e5ffwsrkZf0syELYDpgyw6IpLKpIyZZrvLMjC5lQKzPdpGVwV?=
 =?iso-8859-1?Q?8HK4WGo4Odr6qbGgNH84P+sX4ymFipkI4k3TPjU/zoIgkLer/xNnuOtO6M?=
 =?iso-8859-1?Q?z5yndk1rgaZByEIiJit++dRr5fvIxIBRLNv9ixPN7lDbxFBRsnARD6JTC9?=
 =?iso-8859-1?Q?GRIuSQHqbGjwToP77jPMB4aVgEn0a8hOn2WFjH/O0j62sASpGE1MLY4Nk8?=
 =?iso-8859-1?Q?bfW0SGnWBrEpz2I8su8P6xmdHArS/xqWHNSSxpVxDTn8ZSsoWrPculErQh?=
 =?iso-8859-1?Q?Q3WZsKEiXhezF+/kU5F8ews/Whk1CRNbhJv7mHXtn6tAX59C7FGJlMjc7j?=
 =?iso-8859-1?Q?LJQbVz01BblHEpv6oNBg2i53Sur6ctLHOW+ydGrj+TH7tpsFfgRoDvsus3?=
 =?iso-8859-1?Q?MJUbIlcORFfOaCQt2any8vw99GHek1XXQaO0R1Z46tFgmzTY7plJxlpDcL?=
 =?iso-8859-1?Q?HKL2W64bY35WZYs+xeb7My0VY6QNYrbQZA8/cUZRXL8tJuaGstc3TSQSZ4?=
 =?iso-8859-1?Q?gvqNn4AweNmB1jqySDSp5s+O4DEM3meehzDf7sGuTmBD7M/9owi6P9Sg+U?=
 =?iso-8859-1?Q?/lOg/7l25yPhRc3xVkAUaJF/K1SdE32QmjCGYhJlQhbFdHqC/5be77yMzI?=
 =?iso-8859-1?Q?UDuIcMyF0VmMt/aYFNSlj4wY6JBSuADloxgVC/DI5fJ0F0qAC4NST9f1KU?=
 =?iso-8859-1?Q?ad+Zzprc5GEEjjbRpBGp4MP6VDWhk9HU8kjIXM4S5ZZ1P2W0XXm3+maNGg?=
 =?iso-8859-1?Q?iih2RH3zAAXz0tDcwy/v8XK+gFmpxyH1vI1+QvLBaO9RJorEB1leEX07x5?=
 =?iso-8859-1?Q?N9zPylCW8mk68=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?IIAMQ5+5VCFOzCFiTGv+N708l+NhTmEux6cDYOWnr4P8N77Ift3uzp3TRz?=
 =?iso-8859-1?Q?hnhIha352OFi0eNDDhTzZEn4rcpF5rDGaNS8MGzKk5ZgCdKbvvBX2q7ODj?=
 =?iso-8859-1?Q?1PPpcNa5rg9Pp62Um8fxt9yo07acMEUERR2BMQFbc96VJqEeXutU6URt7e?=
 =?iso-8859-1?Q?GxEQLblUozmMa18JSW8o5ZzKjGvuxQlvCAZzmEqSAZWFusuQa0MbVXif/C?=
 =?iso-8859-1?Q?L+4Sajrz/U3ZMN9JZdOUeN54S7z6EZC1V8yCu3209Yl324xCSPi/DhTKs/?=
 =?iso-8859-1?Q?b3Pd+gcNchpdtblmMXxKHOmBxJwhqgXYcjVbM5s0rhRY40COu+EpSE2Jd0?=
 =?iso-8859-1?Q?uUSWaXKzDPHKi3/OnKZ7jcUADE3rCEiiKTkWOO6Kd7VpVrEzZxnWdRJLiS?=
 =?iso-8859-1?Q?CB+tO6hAofskhxERSRHdZFWyIF8KpDF9MLwyyLmCmd/L4Gq3gYOHLH9VG9?=
 =?iso-8859-1?Q?8E4EZiVG4pWp6NmUm+mkVCr2gNxxHuLRc+akzHLAGKx+HmEgDgwTCOZ7UD?=
 =?iso-8859-1?Q?fNGvaP3KiN58KYZ/mRN0rkPViRNDcj1ffqLoxa7elRzSF7jI9xTWMRG1tt?=
 =?iso-8859-1?Q?p+buIqgJ0nx5tWXAt3tgu2QQzZPYcD50UdKrhmbSdR2naOBJ/vUEp3DmzY?=
 =?iso-8859-1?Q?DKK5h+JsdkgMA4m/Jekx2KvW6l4pLxlk1Rrw5Ds3ipfgfDDJJEmcHv9GEN?=
 =?iso-8859-1?Q?MEMPIOcJMsMLNl5mAAdaiTp0xxN9nAggqwsZRrMWvVXrulBnjXLCG46BWu?=
 =?iso-8859-1?Q?udw0ub7GbwrRPr8ov5wn5vGYUhnGxLipgdS0bOKo1UUQQXbFedzu66YtV7?=
 =?iso-8859-1?Q?YmCq4YhLFTVbiAdT99ozHv7WImrTFmxFWvPiXFwiOmv27Mt0R0PkWYsy0e?=
 =?iso-8859-1?Q?nN0zaV1OaAziarebFmFkvr/RAdVg9aiE//W1lcAOa7BcAxqS58+xL4PQ/K?=
 =?iso-8859-1?Q?wqI9x4EDYrTkpx8Dfi03dyc7Vfz8TKXYxVZflNSCoSRVlE4ychpmtsSEla?=
 =?iso-8859-1?Q?tFhB9sK/BeL0k0iIQ/Z2a1nN4Ce0J3ap6NnyHA9w87qO8/Ogk6PAKxsa3f?=
 =?iso-8859-1?Q?XVrnJvdTgJUM6CdTDLbCMOm5kDBGjVNGS55pSiGHIephxSHevsdYRt1xF+?=
 =?iso-8859-1?Q?tscsNwyX9qDjeiQ7EB6BvTfKHY+mdPKrHw8GecIPpZ/Rt4cBn9orse1F5/?=
 =?iso-8859-1?Q?ppt14lc1W415MnNOs97q8TjotpK7kiuSsBJKflMaCFpheG8U4jRXH2WZJC?=
 =?iso-8859-1?Q?stWMkjdLy2n5A9astWfvChusXdn1BZe/cjJ0nicOVhr16ZYHKoWF63t1Cx?=
 =?iso-8859-1?Q?e9UXHJcvrE7o+fbu8kCUrQItgqdxzjs4Lbt/WyyC7wQjNYvu9G8DaTJN0a?=
 =?iso-8859-1?Q?Ny9gNrzxkcqbh+fhI/Q74/d6gbjuek3sga0mUKgB5aLwFjoQInjkMyLYA5?=
 =?iso-8859-1?Q?XRg5oaqCAsvjfS4tDl90cSWoL7xBiwPMPoQmQHIGWJMf9eLa96Y/EJZ+Ff?=
 =?iso-8859-1?Q?hPgelKvhlRExCfVqoQ+Co6/OlrKOOdXOt+L9SuQRUSMXGJnj4bsWIpSvnf?=
 =?iso-8859-1?Q?6ATmd0PwlQ+Dt8v3tIZu33U2FtFVruonw4hB3l8FK/SaT+0msxFVJlX6xI?=
 =?iso-8859-1?Q?4F2mBGoi7kUJKmitj8kmQB+OPFoLNZA9qSnEKxCV9SewQ4LLklUF6N1LKT?=
 =?iso-8859-1?Q?u7NJhoY/dD0BjxeuLKV0MH0SYc7StoPqflJq2lBJ++GgZ6Acbs8HV/k0LY?=
 =?iso-8859-1?Q?rQMZ9kn1F9dAsPLct/ikvb9AD1ODaAJHEpBN4yJ+0QS7O7kd6Pfh3/NpaH?=
 =?iso-8859-1?Q?7a587jMv8nBv7EjFXpt0dNtuF1xll9s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3da7a283-aba7-400d-0abb-08de732f4044
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 22:59:51.3406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iqyjeAEhEKAQBdYQBr3GV7jWJlFmACg+HLIEbtYEut2K9QY6LvJ0BQ7esTHIFtVXlcUGbQODCScNfVEJ3qaFpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7358
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

On Mon, Feb 23, 2026 at 10:49:21PM +0000, Summers, Stuart wrote:
> On Thu, 2026-01-29 at 08:27 +0000, Brian Nguyen wrote:
> > The check using xe_child->base.children was insufficient in
> > determining
> > if a pte was a leaf node. So explicitly check for if a pte is a leaf
> > through the bit checks.
> > 
> > Fixes: b912138df299 ("drm/xe: Create page reclaim list on unbind")

Move the Fixes tag by other tags (Signed-off-by, Cc)

> > 
> > v2:
> >  - Remove old assert. (Matt R)
> > 
> > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pt.c | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 6703a7049227..b73a356d0fa1 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -1655,7 +1655,7 @@ static int xe_pt_stage_unbind_entry(struct
> > xe_ptw *parent, pgoff_t offset,
> >  
> >         XE_WARN_ON(!*child);
> >         XE_WARN_ON(!level);
> > -       /* Check for leaf node */
> > +       /* Optimistically check for leaf node, may not be guaranteed
> 
> I would keep the comments the same - we're still trying to check a leaf
> node here and we aren't really doing anything special. If we have
> questions, we can look at the commit history to determine what changed
> from your prior implementation.
> 
> Or if you want documentation here, it's more interesting to me *why* we
> can't see this from the child alone than just the fact that we can't
> (which we can observe by the if condition).
> 
> Also applies to the comment below too.
> 
> Thanks,
> Stuart
> 
> > from children alone */
> >         if (xe_walk->prl && xe_page_reclaim_list_valid(xe_walk->prl)
> > &&
> >             (!xe_child->base.children || !xe_child-
> > >base.children[first])) {
> >                 struct iosys_map *leaf_map = &xe_child->bo->vmap;
> > @@ -1675,10 +1675,13 @@ static int xe_pt_stage_unbind_entry(struct
> > xe_ptw *parent, pgoff_t offset,
> >                                 break;
> >                         }
> >  
> > -                       /* Ensure it is a defined page */
> > -                       xe_tile_assert(xe_walk->tile,
> > -                                      xe_child->level == 0 ||
> > -                                      (pte & (XE_PTE_PS64 |
> > XE_PDE_PS_2M | XE_PDPE_PS_1G)));
> > +                       /*
> > +                        * The check for xe_pt's children is
> > insufficient to determine leaf.
> > +                        * If not leaf, break out and continue in
> > next page walk level.
> > +                        */
> > +                       if (xe_child->level > 0 &&
> > +                           !(pte & (XE_PTE_PS64 | XE_PDE_PS_2M |
> > XE_PDPE_PS_1G)))

I don't think XE_PTE_PS64 needs to be checked here as that should only
be set at level 0.

I agree we xe_child->base.children can be set at level > 0 but now I'm
thinking the outer if statement is wrong wrt to
'xe_child->base.children[first]'. Couldn't
xe_child->base.children[first] be NULL when subsequent
xe_child->base.children[first + 1] be non-NULL?

Matt

> > +                               break;
> >  
> >                         /* An entry should be added for 64KB but
> > contigious 4K have XE_PTE_PS64 */
> >                         if (pte & XE_PTE_PS64)
> 
