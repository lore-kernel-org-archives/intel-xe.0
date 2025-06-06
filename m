Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72368C5AD49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 13:50:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38CF410EAB5;
	Fri,  6 Jun 2025 13:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BRWL9SZz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD53B10EAB5
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 13:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749217833; x=1780753833;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iE8h8Oxq4R/IWBWRPaZOc7BVJew2ef2wqNdjBeFit/c=;
 b=BRWL9SZzjEQkOyNSIBt/urFXBTPYft8vOu6Fy6+O+b8920ZoeC80YhHw
 FQATWYt6LYrdTghPOXypoCGPF/DT4hbUigzQ01jIoOshqW9JNbBww+Qyn
 mNo0p7UTUHaMoWveKLwIzExcFQ0qUZOmdZShvYtXgZGUGHNNoFWdJi0/y
 EoWOFkDeUk5BmSZI9hPSKHUm8WYvVwy1WO8wp49cUiX96X/AyFuCyqnQ6
 0rqt+n+b5kuECIxGeK9H5LsF+B0OItRT44rKOxGG57RtvN97q4qJqiWWK
 C4m9RtZuDgbK6bbYP+1qxVDGYjWwfuk2+yqiJUfIj+0p7VxfxsHh8+s4P w==;
X-CSE-ConnectionGUID: e+O4uuqRRviuCnzDyrJNQg==
X-CSE-MsgGUID: TfHhm8rrQz2UrpEFhNac0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51275419"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="51275419"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 06:50:33 -0700
X-CSE-ConnectionGUID: qeXMf37VT9ece+v/ZFkq4g==
X-CSE-MsgGUID: WhabPvHRTF2GJ7n60opZzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="145766312"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 06:50:33 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 06:50:31 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 6 Jun 2025 06:50:31 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.42)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 06:50:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MhfpFRhEPsJqLOcfOyyF4VKEX8YeUtis7F5VvX5popNAyK2u5APuYAuHIdmkVLYK6QDBS9dDusdgOWPtdW173eGXS+be1W4NuW7I6ZQYxRAuXrFCcTVFDTLIBy7C2KO/JJqo4Ix10xBitfY9WQNgksoFMbrrS3ecRqh0rw4wjs/O47BggwVDzFlK4L32ASZt9gtTHgJFyfK6AyirlYFEvLUM/BtAEnthwUuz83CjheI20C7/NybVdzYQDhgV3SPiYLcQpJEAmBWRT2tHxTToDZzoAc+gSl2W/JQ5nHDDYwKYCN6I/1rXM/MTnDR6l9Bf8y9aFJpE7/uF/Y3boOYweA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iE8h8Oxq4R/IWBWRPaZOc7BVJew2ef2wqNdjBeFit/c=;
 b=n56z32Cs2J13EgzfgNr5dNA3AOtkA9gbLXGBTKRaQP4Jah5TwpZGwpf8hAO77rGXcOD+xQirqlAGgdP09UfRZ9qLymw5yR9E6d1lMGhFMDdx0BDe1dCA0ykmas+esum7WTX1+agV4VLQMw0t+Ly/RaTI/Gf1aJ67SOtfjIUmsEWrG7cT5Mi/RKHby/H4+OavO00yqQ2dCA9eu5qp+y6jotziQW+ZREN3ckEUzOZLdis8DuhdBj/U+FbRfST8/Fs1JX0xh+xQxcj2Dg33EgTk19CJvFYAJ84g4Zf+ivLOSRW+FfonLkzPe1fISyW9xsY/oEwQ4Ai9kRdnEpDR8xtLBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB8281.namprd11.prod.outlook.com (2603:10b6:806:26b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.19; Fri, 6 Jun
 2025 13:50:15 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8792.034; Fri, 6 Jun 2025
 13:50:14 +0000
Date: Fri, 6 Jun 2025 08:50:11 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>
Subject: Re: [PATCH v1] drm/xe/pm: Wire up suspend/resume for I2C controller
Message-ID: <sjqgy6d2lvsxvtmeu56r3rcwgkco22n3s6ct4vh2qbmpk5566r@caoxdrcf3nof>
References: <20250602070818.701834-1-raag.jadav@intel.com>
 <aD2rsWvCNozyqqcM@kuha.fi.intel.com>
 <aD8z2oY6dPAUZupz@black.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aD8z2oY6dPAUZupz@black.fi.intel.com>
X-ClientProxiedBy: BY5PR16CA0007.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB8281:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c116068-fc42-4695-1d13-08dda5010ffc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3PFqOww9Mm2VszXVNmqmdEFymTId8qpnON0A5DtN2NdYkfyBgB/tcaf+t/hg?=
 =?us-ascii?Q?EgtQQqpFyccYSP1VJMfm0lNkgbdCWZ0/LGzchMosAq8qvTnP5U/LsZr2Rojr?=
 =?us-ascii?Q?WV599/wR4QDWmEsAxFSNGnFX0SnLmk4N6MZNVm0MdOqpMdN6iuQiQPmAblm4?=
 =?us-ascii?Q?pgkFvccg+9L1niEEHa593xcAO69rEkzOLnVKO/DFapI8XKbrXqwXk2l1zGjp?=
 =?us-ascii?Q?Vs1AEbF64Khx2xpvHGEfdTXuMKQIvEoMGoSSzenqMiBd3NY/7glQuE+H862f?=
 =?us-ascii?Q?DYhEFVRNGX1bpvsmIhKLvBGxWhdE2R7TGyHmJg3TbK9ifDNxKcUTl36Iy/yq?=
 =?us-ascii?Q?Kp+Z1DBou6wsDF6XvpIRfRgk21hq2P/zIxsrt2eJybQgChsyvEjw3jmsSuHl?=
 =?us-ascii?Q?AAwxnqMYjejvBQzz2i4GzuPs9e4PSUQ6Fx7s163gtE2flrrkqHkBPs4NNmZa?=
 =?us-ascii?Q?jan145HjLu3FUeSgb7gz4JJ9oELa60K/P2n3gsznN/afhdSCBOsljHmj9eJX?=
 =?us-ascii?Q?pwKFUeFOKb15Dc026S9pbU/bTRlV2GlrYMyHgGszz6vvJStyTlwIYBi5R6jR?=
 =?us-ascii?Q?WmOAv9k8d+rk9LJhqIRku0ENycBpGlSwWDOZE8o9eWySCEW568TngbHPGToK?=
 =?us-ascii?Q?/q27zC5KtLJNw/GiMI7tnqyMLqA4yj9f2MinKFkHIZLKoiXab3ukADoHX2CA?=
 =?us-ascii?Q?xBnEh1BMoRfpA+3pyyAQZiuT7QJ3l5raU8zUNUrdROHqbcYy7nz5LuBFs4WM?=
 =?us-ascii?Q?HCYTBssLg2rISO0j9u6BPgn7lu9XaV/mfHNOLPqzePTdsQBYMNiW0nEuSbwj?=
 =?us-ascii?Q?nnOsuZIedyXawVwJJbE8rWfAzNtRrIjRf/spLUvIfQ1QS6ehwN7Keap30cyt?=
 =?us-ascii?Q?Ogns1bO5EQZzxToRNytq8D6TdtPc31w1NWQAvXQG43j9tqezBrBFLjdelaYu?=
 =?us-ascii?Q?mFSYH0lTqiAPSA/4E3Wwlh+DSlMfhev6SYlh+BudgLkejuCG2uERUfnBLZVA?=
 =?us-ascii?Q?XZ2wY3KLNd1ni1t3P2F+tskPU9CvcGuqu0ksSI9JmvNa7Vw0sU8q+9H9h5bJ?=
 =?us-ascii?Q?gA3THdHtbI5LnxVf2U/uFPyTqPK0tOohR82Shvy8u/OQFX7FO9v6DolH09C8?=
 =?us-ascii?Q?SmVnqTjPj2Yr56iOfP9TJCgddMhh9J4StbayhfP1WGIitv1l9A3WhKe5+n+Y?=
 =?us-ascii?Q?/LRwC/M+LFHlqqeC5wUF8BwSWiqOozklGD3vUiKRm8KCucZZ7m9L5R7sd59V?=
 =?us-ascii?Q?r5YhkZvTUW8Xb9svKJK4seyAKzP7O5CCkGxbxBresR4brLBDeFEr+CksMC62?=
 =?us-ascii?Q?xa0jcjNKjnUc7rmOKuO+GdZd9HufFPg/0hTlKiMBY+ex/8RXASN8MBJZYI+L?=
 =?us-ascii?Q?qKOOKVp6l3Gp/+hUHexbUw2PMgYIFpMAQV5XZsKZXgkE7pYiXq2irUhgIeZk?=
 =?us-ascii?Q?8wpqQGCwXG8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Qs2iYxJQRrEuF5XIX2CGtZGHX2nz/EEpHj/Nb7BmcP+c3nmmBIXbJ9bmrPPX?=
 =?us-ascii?Q?G9+InL55nmVafrLOl9maVmtD08S6Ophy8aW9HLRhyH2s97r8ItPH7squXrvy?=
 =?us-ascii?Q?QbKld7epF5zBV/aiEtXAXzeYRiRpjpulsIvl08AJasSAAi5EAmp4lcm9HDZQ?=
 =?us-ascii?Q?bxUYGO1ZJGlOiyjoNLWdYwBbrtwsKACcq0juuvIZ1tHC6/vpLecZn+ROlbVx?=
 =?us-ascii?Q?3+TT7h8HEcW++O8ALfj0lk56XOMR6ONcbQtjB+CQssVssYiN7HYwwWw9mTf0?=
 =?us-ascii?Q?xT2ryH9m0YF7yYOd1MeaR7fBMzr3Azqe6qgdaH97Xj7HzzEr9fQJpoU9Kenb?=
 =?us-ascii?Q?/o7LYUVxjzfwxSoWA0U5rseVzmu72boZd4eR/QqG6Nz7yBQB/GNSUobd1u7h?=
 =?us-ascii?Q?54MUBt3TJIbkQeqP50d7EexS4LHu7ktEx716W7jLorw8sW5qk4Llx7HBDqNp?=
 =?us-ascii?Q?zMos+KxcpM5ML3ffMuFGIartF7k9teD+JO4pM8GT0bCAs3mxLysqIQnwGwtn?=
 =?us-ascii?Q?NOsVeF8D174pA06ThLWjb6V6tAal6w0WfDQ5E3dV9u8Soht8oSxUt29Q3aLk?=
 =?us-ascii?Q?PNJTtWyqahMbq1eDG5JQ6boRyZX1lkPHzZ3y+6Yatlf6zscNuBctZwPgbpue?=
 =?us-ascii?Q?oE00kwmWkihYKDoS2M0VFeA55Oq07ofbsCEGPb6COJncFr1419q9uIk6a5/3?=
 =?us-ascii?Q?th/an5IY+3q7d+8KP9c56ek79syJycVT+glDniI4+Kwss8auEYV7hxvQiysq?=
 =?us-ascii?Q?bbQq3/cYBEIKY3+9Uq0h6Ewpt0/ECBOqUIn+kKcOb9eZtUnkebm48y6RIug5?=
 =?us-ascii?Q?ulu2YL4W8v/7UX+2vOnD8hPZpyTWohgXz7a/CB4wQJ2D9WPUTH4Kh7Y8MYtS?=
 =?us-ascii?Q?IvCR0USyMKEvCMkA7XdCsSOS4Kep9bYvXJyk1TKpbdSypzdQTr6dQbnSHBQh?=
 =?us-ascii?Q?YW1EordAAB//Bh7HHuqYIV6Pk02D+60Wpqh3YP5eMXEuuvTm0t0fYt2jp/ky?=
 =?us-ascii?Q?3CYDU1WfXp29wbtB816+cpYKgxpHxbitexp1My7aepqgZN2lulk2sZEyGz4e?=
 =?us-ascii?Q?dYI2FeyRic9xXY/SfV41Yfsi81iFCVBZUvom65t/Oze6LLrvjlIe+dM1+UH1?=
 =?us-ascii?Q?Vy2312bVRRPBMQzhPXeTuJfG2gpwd8L+1wQ98LRCFFJUrIy5f3+gNvdE1QMf?=
 =?us-ascii?Q?5FfI1hmviEpUmBwUg6Edtc0IgPXCT/ASbudiowtTCFAG9I3aDh5gTQYjtez+?=
 =?us-ascii?Q?Tj6pFWalbFiuE0KVNAKK+lnsZ9brSRnj/kS5K3JdJP1Y3ip6sNhT0mepgz1v?=
 =?us-ascii?Q?c6MIwe2XYogc+jWFmez6AmaKxT9PH0RlfpBShouhgeRRsH+3y5lrN+eu2c1F?=
 =?us-ascii?Q?rFbG8MI4RDaf2n0/sHpbQpu+UNEDim9DxdVP6HiPAcPlLB/xcNZVRne4F4Ou?=
 =?us-ascii?Q?hRqc+DQ1s8FTUEOvWZkA3HMEL9LUmnPiHttTQ1yaZSQMoNaMqpqfxGMZh3Is?=
 =?us-ascii?Q?gWaXUrvqVXAiaPlN9KAilJdHYcpokslpZV66p9AYEZwgF8ene3Lv9arrInHg?=
 =?us-ascii?Q?A7AGDdns6MvQF9FV3WvkAFcjLoNmW88bmJud/FsIi/1f0xpBMgP913DJFzgF?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c116068-fc42-4695-1d13-08dda5010ffc
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 13:50:14.0467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F1QvnE89x9Bnz4mSe5WVniPqCHtr7+sXcfkh3ouHbvn2gLikFXIeX6utEUoBJ+4q9f6X89p+mrvyBYU6jMM3NmiXM/T5ONBdi4UROPGgU+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8281
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

On Tue, Jun 03, 2025 at 08:41:46PM +0300, Raag Jadav wrote:
>On Mon, Jun 02, 2025 at 04:48:33PM +0300, Heikki Krogerus wrote:
>> On Mon, Jun 02, 2025 at 12:38:18PM +0530, Raag Jadav wrote:
>> > Wire up suspend/resume handles for I2C controller to match its power
>> > state with SGUnit.
>> >
>> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>> > ---
>> >
>> > This depends on I2C series by Heikki on [1].
>> > [1] https://lore.kernel.org/intel-xe/20250530141744.3605983-1-heikki.krogerus@linux.intel.com/
>>
>> If it's okay to everybody, I'll include this to my series when I
>> resend after the merge window is closed.
>
>Let's give it a few days in case of any comments. If not, perhaps you can
>include it.

It has to be included there as there's no way we can run CI otherwise.
For proper CI run you can also send the dependent patch series as a
squashed "FOR CI" first patch.

Lucas De Marchi
