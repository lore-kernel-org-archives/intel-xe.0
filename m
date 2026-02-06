Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACD9EE6B44
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 17:55:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9564710E87E;
	Fri,  6 Feb 2026 17:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UkGLNd4p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 776AD10E87E
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Feb 2026 17:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770400555; x=1801936555;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=z2D1iFMLR+yvtH5EBTYN6USYcgcMOxOOKZ4hG+CU+Qc=;
 b=UkGLNd4pk/wA24D4Zk+5I4+DSoA8Hf2tAxvZvr5CbFuDgi7y5rCpHOVR
 emlA79XyrXvF8QarcBrCXfeU+Z8whxLe6aB+fBS2ld1CVK8/1Y95e3XUq
 M1yzTHGflhogcKmiJvswLFblTKVnPXJxz8pngC8IBlK4MM3EmIiBDaSPj
 48e6zKXEOjIv5i/U1jO8U9A7JPpKsfMOEJ+rfO6xXnkmmYee+5ZrbSjv7
 eUW4L4+lxsxmg/kto7kkWHY132xx/FLAzQofJGuGX2Si/Z9kxoN3MG83o
 XJ8UgkzGYpUTOBeCls+hJRxn4QwVc1eAS8xkDFHcB9aPs/gI8yrHJLx2M g==;
X-CSE-ConnectionGUID: ZY7ui24jTsWXF9WEL3McdA==
X-CSE-MsgGUID: L9PTx9vqSsmropeLHIrwhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="97068789"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="97068789"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 09:55:54 -0800
X-CSE-ConnectionGUID: 0K6VpQBXSiC6eNMJRECxig==
X-CSE-MsgGUID: RsjaJTQqTEapfo8QhzCd5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="210214957"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 09:55:53 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 09:55:50 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 6 Feb 2026 09:55:50 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 09:55:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PmcvX2QNNSpfyQm9A2v4n21G2CrkL3XQ3nKl/NO2urW0uxtjkZbBWZZ0gF3illi7r5VRLzpf2Pm/sgHoWjFVKWC9cwy5l3dlC62yVzijukdzWsDqQ6AASOQih45yobXvQ11mh8zUpWrCVhjUp9zRFdyOlpO+joo16xUQKxW8PpHO8bjA5/tqLKGM2B7pSYRAdP+D3wHzbOcgZj82guEcAcH0kjakLxs9b3+C604FRW4XmykKDG9ylBIYxtQE/McdteNlMdf5J90ytdNEtUB36qBfmCQdYiLSh4SOXaAaijh7imQBNNGz1rJ1bFEG9aJkdqnvTxGN4R+QEk2RrtIHCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IN8qQA8xe3zP2z/X+ZlOnb9zrIiH/ZnuXA1GpVe2+UE=;
 b=p4d0sPZGlZZpFOTBVfUahztTmKGSgrBVUZZ9CKbSQ8sx6EEz7YgbdPnShlNnmewbGwpH/FsKj5wH8+3gHQvJGnCqDaL+0UiTficDHJ5u82X2O07cfXqvQFSV/zCk783eqflKrSrdhxaxV3Zo3oZEev7UjH+9y45YoxvjonGz7ic/8PFbaPELkML82YXcEM6wBOVUJom3LPJ0211UmIDtcYHZY0GaLrSWQf3aGoHSCa3bGzdRen0T2c42dSi85CK96AgHFLRCm/+UjSqoAUrBKQAsPWVUHLbqdDi/u8MR2MuLncQgI8jH7Ye8fbYy45JlIq237WPk/rMGyq1HU9IIeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB5814.namprd11.prod.outlook.com (2603:10b6:a03:423::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Fri, 6 Feb
 2026 17:55:41 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9564.016; Fri, 6 Feb 2026
 17:55:40 +0000
Date: Fri, 6 Feb 2026 09:55:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkJBVDogc3VjY2Vz?=
 =?utf-8?Q?s_for_series_starting_with_=5Bv2=2C1=2F2=5D_drm=2Fxe?=
 =?utf-8?Q?=3A?= Move number of XeCore fuse registers to graphics descriptor
Message-ID: <20260206175538.GC458797@mdroper-desk1.amr.corp.intel.com>
References: <20260205214139.48515-3-matthew.d.roper@intel.com>
 <177033148816.228376.5894547861377564660@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177033148816.228376.5894547861377564660@a3b018990fe9>
X-ClientProxiedBy: SJ0PR05CA0176.namprd05.prod.outlook.com
 (2603:10b6:a03:339::31) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB5814:EE_
X-MS-Office365-Filtering-Correlation-Id: e3394d3b-f2ae-4ec7-32b9-08de65a8f118
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4Obe6NoUA4VKbG0PKpl+jVY50nSzO+hs5FQgT1EFW9LB3gtCtephn+Rlq93o?=
 =?us-ascii?Q?6UR0IIRMBiyGJxftobOIbVvfbUK8okG9yDfWB1+iD5/jQQjPtsIc9f3Y+b4D?=
 =?us-ascii?Q?1RGSEVhR2CdTN3YAw40Y4VmFm8DSJFC9WPsa9EnZnfWrx/EOMOZGI6u26wRo?=
 =?us-ascii?Q?Eeo8kCBtwCVYQriY0B5/9uzcwIlgSmrpZ+Vl8+1Osd16K1DkACVIUzUtWJ5k?=
 =?us-ascii?Q?lRB1Vc2yEQkpezVtC42CmmJmcGH4yQxr2eemlQEpx5NWbxDO8eYA8P9QeZl9?=
 =?us-ascii?Q?VRF5e0Q5pCL/zcjkOfBbpdvW4u5OXHnljr15RMQxnpiwk0ANPvNzkZuK5gth?=
 =?us-ascii?Q?H6Ych2XohC6ya1vqacumRf7lDBWXjodTyXmzTfY425fU0YGFDRonQ/KngD+V?=
 =?us-ascii?Q?VIAEAkP/bJay0hM8l7tUxzyJXHAtp8BGrApGPWLAWD+GIaOOzEXwqsn56O2j?=
 =?us-ascii?Q?qGd8bRBvZEARdbHJm6iZi7T0QkHjakj/TP2/xIkPoz+47ybv7PId8mXxMNKi?=
 =?us-ascii?Q?WJnYOJVAIn+EluhNNJ2jpkFjlNN8BIu4wmOlfIj3P6PxlqP4tJTPMU9wIzkM?=
 =?us-ascii?Q?3f9bY/WG5gyodBsW+4GgEvwhGvsyHjW2SRE5QcLzsTM0rHtQ0LOZnmcuv+xU?=
 =?us-ascii?Q?ErxoC7wyh9xQMHf830M54f2xB49cn3jOjEFKUkiIu43MWV6Hg9rulUrj2uT2?=
 =?us-ascii?Q?eypuRe88kfn01IpxETHvKuXlkNKEswRvXsEUGgxyq0ADTLsrw5S5o//H8Dne?=
 =?us-ascii?Q?uEumqkzY6ufkkEJ/lhksapH+UCy+XT4Zeok3B6asgfR/llK264nEj+psfzjd?=
 =?us-ascii?Q?f407fFdkxfT1+H1OlrdhNz7us9HlSf+w3UM6VN8C9t+sUDpLgj44nVuNwdUH?=
 =?us-ascii?Q?Nv/SeyfOULSXCu+cTamv8WMV86hAJjm4QsxenIOEpnTOoUtxvdUNjs0FhkO9?=
 =?us-ascii?Q?7bLNbTvvVyjexlfPtsk1W1kmVbormc70MBsRH2Xpk9WeMAs6Lee2p0vZaRx7?=
 =?us-ascii?Q?rEWnOFRnIcq4pP4/SL/nWwDWbmBxnwbfJv3aBsggQcqmyGvUfDHZi+1HllEd?=
 =?us-ascii?Q?Ik0YqtapaLNKbsLZgW0w3mrU/ey6IrjtqGB7tTFIVq++rVFBXxsXMjn0OUj3?=
 =?us-ascii?Q?DYx620CU/+t1U8vQtvT/gWwIkDL8ymvIRzoJlZfSA1NZCqZphpd6xds8dccG?=
 =?us-ascii?Q?zfnu0a69lU+FOA8CQ0oFykf4pnL0pKbkQlikw+DWs1goEG4y72JxcKFQl0zk?=
 =?us-ascii?Q?yemREsl0LnExyx4E5Vk6Qc5nFMkh3AwQfjoXKNO8C5vGHnIxbMbFW9Zz1ETC?=
 =?us-ascii?Q?a5td49wq7+Jk2tYACroL6T7yXemXOLBO8XOOlFpUMw+QZnMvXURf7ehTeB1z?=
 =?us-ascii?Q?ZcanzkotYyw7rj26ojgwFRjfQuLjzsf245kkf/3HE3wZYM3fjMR4TLttaPqB?=
 =?us-ascii?Q?+NwtRbfdjl4EXPd+gZbFL0pxtN1qBSMAcW/tvsTCtnzS2GcRuny1l+tpFYvr?=
 =?us-ascii?Q?jAdVf02qArfTLrZCUXaHs4T9kL1wrErqp3Jt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cql6uQyhBnd+74apH/Vogpe5eklflL+U7kXSGwCaly5F2IhupZLQRVz4/qRI?=
 =?us-ascii?Q?MKPQeRGgHZVIm5GXzGeSOR3KOW5NPpv270EYbDEdtpntjyVbqmdkBR5fgcjJ?=
 =?us-ascii?Q?zhi/XcDwqLTB6Pl3iwmqD5BfmBxz1xdmKafB4QWfDHebmD/SwOiS/QxKKI1/?=
 =?us-ascii?Q?Xy56x0ETd3HguH9SOje2pYHgsvxEgv1VdVGL7eqY5aTVmFDLSItrGOIGbGCP?=
 =?us-ascii?Q?hKvsPS3C1DdOqJNiqaAAE9bsNPiin79WJu5sC3u5ZVjo01seup9+Nh3ZQyl/?=
 =?us-ascii?Q?UA4WYWfeeRaDBiNOG6E125DbeHTi1HgUJ5LE3DJp/a8Q9cUBWRl7NJ5ZzOIG?=
 =?us-ascii?Q?MEzhFxqNsF2cdct/JRQoDCRs3YjydOypRvezNzZ194VNnKW0wyxwS45tTL26?=
 =?us-ascii?Q?Cu1sbAxkB7KnGHD/lHSXwUB+k59KQv23qT0fPZPKDaz+9/NSQltdLFjJgeE8?=
 =?us-ascii?Q?DCOl1CWwMPiu0AEhnGtRLMUJ5y/5qQfQZgYB+mSZqAmTMjQfT1TH3KWOiLrj?=
 =?us-ascii?Q?VoPfyWWScz+75o8z3PQsIJAhCuzvtfOdrJOMUPOWgxH1hr+NoeLkoh3mvDbk?=
 =?us-ascii?Q?V39wUDuZlSIerLbrjcoQiFBFYfJA8yJ64XMI1LykCXXT2NIcy/+wzbXIj3Bk?=
 =?us-ascii?Q?dCXrPWucoWQvcH81uoFp5TQBCX2v/R137RBUV17HrBvwIm0i9YfQSRZhN4bD?=
 =?us-ascii?Q?BVNzRlwAo6Em+hAGcUQkwpMGXzOAG/9GnnshZMAmqpIqDG8n3SpkYju02DmL?=
 =?us-ascii?Q?qGexFKCcbTpf/fSispzV1A6L4P5Xu3x3w33a5iELWF7bMIOnMielrbAufDcv?=
 =?us-ascii?Q?MkKHeTwkOu+558KlfFQ2HxD8P0D9WN0IiT8WrAHN/mZMtiiJSEe3aLwvpza2?=
 =?us-ascii?Q?6X9rTbsCCJQG3OieHTCtYp0fOW/2zaF8WLImN/ZQ3VBa2AnyKtdciIa5qF4K?=
 =?us-ascii?Q?NJvvEfsldo6dJ1tXZR5iNImIFHabJGT0PUm882eMeKC70UeaF2yDGiOqQpEp?=
 =?us-ascii?Q?SRIb1EnKw7M4T2oaO8W4+qpKw8kB1yhrI373q7xuOq2xGMU2r7MMKppBvU/T?=
 =?us-ascii?Q?x/52yhATw3A0ZCn8nDzPWTE5a640UjVQ7DzIbuoK5UYyfmPqjqjSkpP2lKSQ?=
 =?us-ascii?Q?S5Ia1PFw+FzrgA/zBE96EjKCfzy7UaXlgkvUlmVgdb76ZDTfcy06PbTOH7Kg?=
 =?us-ascii?Q?5QZzsdvsLmHDTzqtNcYFOScgUzGPNcFiQuaHvd3rQGvpzfggaJvE+IETdnfF?=
 =?us-ascii?Q?M2S/OU0fhPuV+qJ7UtSS2otMmcp/UQC2IZ2QvIkIb1rQNZm5YtquybAM1eOW?=
 =?us-ascii?Q?OABxrnLjSCz3ioBmAvAy0nQN1BsYCTc/hWOEsAO0xbgttc3luhWEK66K4tls?=
 =?us-ascii?Q?xUgJZvVijot9PKmy2DCjC/14BngozXA0Hp/wkhxOC+S8xk+t3SgncstlSJ0y?=
 =?us-ascii?Q?OWY2UGLrsopSEXjpekMzrJCwAsqKguio7MZg4lGQTkIw/e0OkUmbnzcdem3P?=
 =?us-ascii?Q?WXOOOB6XHOLVIC2IuNBzGkW99r2natVwXU4O4y6z17IIWNaowjFc8AI+kr5Z?=
 =?us-ascii?Q?ltjXvsjhkk7AnyZyK9L4kd1xdgJCGClHXZJMGrCmI4xBUMWqxMQzczdIMmNj?=
 =?us-ascii?Q?ojUDmGpdjMaDrZ1RRiK+mD5TTjNdQGXbrTcUyAgJ+Vuza1btrjnrD9Z4iVY6?=
 =?us-ascii?Q?fA6Xl12EUEL4QuHhJCJrGbzcUjeQ0ly0YP2qSKFt3UKJSvoDeP8JgsCcODTy?=
 =?us-ascii?Q?HCRxKQxfOCSxAqDXtiy0PXllqH3EqEc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3394d3b-f2ae-4ec7-32b9-08de65a8f118
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 17:55:40.8444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nu2+CGsJboML330bpTdPoQC/1nonH/Rrzfc0pUdV7aOI7Fo1ONE7PtyZDcW6TR03FqtQJ+/Ng0xCunKvsStTQ4ulqWwQbUG1HhRHLdGKzMk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5814
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

On Thu, Feb 05, 2026 at 10:44:48PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [v2,1/2] drm/xe: Move number of XeCore fuse registers to graphics descriptor
> URL   : https://patchwork.freedesktop.org/series/161222/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3_BAT -> xe-pw-161222v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 

Full CI results aren't back yet, but v2 is identical to v1 except for an
extra kunit assertion that doesn't affect the runtime driver.

Applied to drm-xe-next.  Thanks Gustavo for the reviews.


Matt

>   
> 
> Participating hosts (11 -> 12)
> ------------------------------
> 
>   Additional (1): bat-bmg-3 
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-161222v1_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p:
>     - bat-bmg-3:          NOTRUN -> [SKIP][1] ([Intel XE#6566]) +3 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p.html
> 
>   * igt@xe_waitfence@reltime:
>     - bat-dg2-oem2:       [PASS][2] -> [FAIL][3] ([Intel XE#6520])
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3/bat-dg2-oem2/igt@xe_waitfence@reltime.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/bat-dg2-oem2/igt@xe_waitfence@reltime.html
> 
>   
>   [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520
>   [Intel XE#6566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3 -> xe-pw-161222v1
> 
>   IGT_8739: 8739
>   xe-4511-af5dcbe7f59f0275168f750fc7c80160db3b6ab3: af5dcbe7f59f0275168f750fc7c80160db3b6ab3
>   xe-pw-161222v1: 161222v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161222v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
