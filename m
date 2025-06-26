Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D815FC7EE30
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 15:01:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EEFA10E8D1;
	Thu, 26 Jun 2025 15:01:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cYzaivgn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E376910E8D1
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 15:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750950093; x=1782486093;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=53aW4dH2StoSdOrgK5JggiU5o/f7EkgQH7UeOuuPiEo=;
 b=cYzaivgn5+JdOVpStoxLL6OJwOJ942l8asO1h7jNUpv1rAm7CxrqDc/z
 pW2wCNRnmZgDv1uLPtZiESDpxHb9I2Lt3jYZBjESz9A8BiG75Aol8Q8Wf
 LQ6Ov1HFX5VpOnPaeksOhhzFfeNG01RGD929D+jOzF4dkw9kit9QM1ypb
 ZZwfo/VeBNrrdbAv83jwHt66SB7a/G2op/s3hrQ/yDxF168V+lQUJ6LC1
 OnBFXvxbPd7uaRtUaJnadXJsUo7zsXtPccoS2lCizU3Z7z8SPXBdnlUZh
 tTf32U2MLvKJG541/OfeEkqrxICwTTcZbK6+jphIQvmgAHrnPsQC+Mgz0 A==;
X-CSE-ConnectionGUID: usXmqDABSYOSibyu2ZCy1A==
X-CSE-MsgGUID: D4IrQEieQv6AezXYWDktiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53122807"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="53122807"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 08:01:24 -0700
X-CSE-ConnectionGUID: gHo76yVFQti5+0kUyal2sw==
X-CSE-MsgGUID: c1fZvijzQKWyttkxD1pESg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="152835084"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 08:01:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 08:01:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 08:01:23 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.52)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 08:01:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b3mwj4Mv1RBz3+TD4TIpiqOwXoXHvByST/vOytvEUw5+UAd7ybudh+8gpGfSWicF3KBGVRXKkAM5zoz6qauFJrPEn19oB/DhuLIEZVOQ9A1O2JEIvSCw1oUInWXF4bfYWvfHb5KX0ZWCYQ0vBVN+p4zIh1iB6mQo2twDiJ08vG6oboVixpdf5whK6FbHWbUCaK9dnZh/wYcvSxO88V4oUAQwzcvrKScTEs6UxmZFS34XHZyFnu2BaC3GKd8xQkKOOgH1q4JrcT6WtOlP4JV0QucBAQZkUDQ0HDEHYxW7LXtXRNbd85fLSfWvSNXoUhoIeUR4ibkNfWDzf4cwBY0nkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LC71z6ZxgsuGLFu0hi42ZBKl+p7zjzht2I0OhPHxHk0=;
 b=OGR4/tWFxsb+JMr0Kt9vjQpzVXCC+ilUOkLSW3l1sBK3iJXQmf00wi8yOBRudayxFbOxrJCFYjVahvIpggq82+D87GhmrqxhYSDMjmLQuCVxanDj6N4rLVMPmU3siuIVJw+jfQdSabnnar1d9pike8MPwvl94a+BdRpX4BTOPSXVhFbsQ9PnEs+WV/XiBCwPvyr3ZunbNuQxo6vNev76LD19ZFDEGsDROiO9pbtOuHSl36mTk4Jd8lKkkLxPBfpSq7k+fi9l3fVWGMQDFZJ1uBNxYHmBmYQuCjisQQGl4eSbwdLJY/8CW+opiyu2txR7l2ggl1V+XalLAonIGdKX8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7066.namprd11.prod.outlook.com (2603:10b6:806:299::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Thu, 26 Jun
 2025 15:01:20 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Thu, 26 Jun 2025
 15:01:19 +0000
Date: Thu, 26 Jun 2025 10:01:16 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v5 6/7] drm/xe/xelp: Implement Wa_16010904313
Message-ID: <qx4lesckygv7f2i65234ctv6o2kw76gsjgaxdrmdas2ejmmovt@n2fclpinszcp>
References: <20250625153632.21220-1-tvrtko.ursulin@igalia.com>
 <20250625153632.21220-7-tvrtko.ursulin@igalia.com>
 <o6dw26fxwlpnj7dxpbdt2r62662rbyamjb24dcnvzysf3jh2yi@rnragrribl6k>
 <856c8bb5-c702-4079-b581-da40b743d0b4@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <856c8bb5-c702-4079-b581-da40b743d0b4@igalia.com>
X-ClientProxiedBy: SJ0PR03CA0083.namprd03.prod.outlook.com
 (2603:10b6:a03:331::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7066:EE_
X-MS-Office365-Filtering-Correlation-Id: bb1b2bdc-b836-4cec-7838-08ddb4c24e8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XC+qWfhehawOBFewUt0FogShr0CkEoCjFuGYmK7CNkzk/PTTtw3hePzokbpB?=
 =?us-ascii?Q?cxZK9d0XS4DPkmKXUzPUgJyP1V91kSyqaQNXbr4lf4Fr8dMAcYdk1an6x5JI?=
 =?us-ascii?Q?RIX2O5tWBjcnohvCxe8cYlv4kRjJ3WbDE8c08BTymul3k66RnIA23TbugeJw?=
 =?us-ascii?Q?fw1UCO0OPE33nSPBMl4MPozsFjtrfXHneQ7GIYRqORor+a7gBtLjQERroQNY?=
 =?us-ascii?Q?5vuRXlPIcTAjQn5uDZH7ED6huv6hVgxQTe74v7Iuy09KtOChhxlU/u/Gh3KA?=
 =?us-ascii?Q?kyEEEMr6mAotCTv07YdyQz0zJyMcJGenQdln6oDg5VUtCli+ggqph6k/qhpa?=
 =?us-ascii?Q?OhlTyuyr7RI3WCwgiOFWKp6aTUpUGurgZpivpM9VU78SJkOe5Hav5ugy8UAj?=
 =?us-ascii?Q?i2zwT43pDe+W0iuyqLSjJAAuMAD0ik/lIZUFBGkX9lLuB1GPYS9j80KGSiWa?=
 =?us-ascii?Q?G8NmT3qlKH3esxLNiQeU+Qc06IYq5e7bwVWaxQiV/rFmuNdxuJrJSAy1JiC/?=
 =?us-ascii?Q?AzS+8TO1ObmmR+f3yT8VI5zPMvU85y+LQ4kUdftFHYcYc78qk2NCl4qHxLrv?=
 =?us-ascii?Q?ZOq9yIqHb2BXmi4JUgwfK2rXMxzEdWqqn+jpVYLTvPRQq/+ZdEy1bnJxzPWR?=
 =?us-ascii?Q?W2Oiysd1uzPCdx+x7jh+4Gk9Ktg2SmlKexLh5J5K2ZfGcXwQGl2QjUoKaFMP?=
 =?us-ascii?Q?uXqwGzOgkhjTUFfhW/WWfumRXXn4w0cq0O5u2tOL9ej3Lov2dITX3oft0E2T?=
 =?us-ascii?Q?Xe6IA3hcTG5c2gMHMD5O2IGCHtRbUfmHPv4u7FreLksyKCotpsQcxYuh3Y2H?=
 =?us-ascii?Q?9NlPUBzXRqGFuKsAFukI905WIYoZQyVv66AyAFjNv6jzy3EJqeiQr6B+GqDc?=
 =?us-ascii?Q?jYNJ4Ppj3Z1xbrhciA6FyGqYRxO6a4swU4pCMqF8T32Qxi76IfbXNaruMmq8?=
 =?us-ascii?Q?gL87Pxrmi/WBMpy6NK+M1AhbldKYWztR1p1Vtkgtp7rJ391ulEXYKzFWV/66?=
 =?us-ascii?Q?MedWoSkgatME+clNsD5XsE9HZ7WQhC9PpJrbPPBv+L8n1iYgOWz+N6wdKxWm?=
 =?us-ascii?Q?iQTemq/CjcdI1Nvu/UBnSmu6TPKmbeCWpiBxu2g7c9k8qis5QZ0H0bXoPMfx?=
 =?us-ascii?Q?7z/C8aUw0Nbwwrvt654ID+/56huyCWB4nY+RaQfl6tYPIjYuPY8fPufxCRYM?=
 =?us-ascii?Q?vJA0IounTtsbOsvCPf9UeuBjGtCqqJ7fKKu8cg+LTiHw09TIC2Kt8gzxSi0B?=
 =?us-ascii?Q?pLZyewjR1ROu9qRpne0jeCjJGWdY0DGDRDKYXP9aGkWMyBmVuBDlKDZnZr9b?=
 =?us-ascii?Q?k5sUdt9ANffZg6Jn0NLTB+gVfRGCtB6FtbllTstCQMxyNl45qN6xvskkSuqI?=
 =?us-ascii?Q?keKukk/ARpGhd6SoUrmLr4Z1rGYXxpJQJ5dGV9altUaUAlbb8LLB5UrkJKmG?=
 =?us-ascii?Q?rfP/eevA51Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+yJzwYlwsyC97JcF7MKa9rWeW8No8qN7fV0OAyjGyPiTMvvapV419ZVE24Zx?=
 =?us-ascii?Q?7T4czXPkbVpCJInejYfJQpQLRUljO6uGVH5M1aMm3jFQD6NGQ/zxccPSflqz?=
 =?us-ascii?Q?9CdoMQu1yZwb07fMoB5Ekgpo9lh0g2hTPcmqcDiWLhc9OtI92Xk/5uVjuf1K?=
 =?us-ascii?Q?BMsiWfh3nKJr56LA8akDtoth3sgTSAwbv8gzmP9h1ipGPjNJqYB19kaqIFWv?=
 =?us-ascii?Q?gwCwgxr02FW0meGXuQgoogePeAGabDznE9yFWS5ogmq5FuDIUC2vEFNFOnaJ?=
 =?us-ascii?Q?7jjeejVsns3kBP5+aahiK+gbu/3xloqPRGyYyll54tv/sWhP3KzLecobsAgm?=
 =?us-ascii?Q?8E87tkOnku8s0Pv7z1ODF4k/jHKWopMSYrlOdvpWC3IbuXtOOqqCr9ILMnnN?=
 =?us-ascii?Q?WNctEX8AAo5Lpjldx+Jc2rexQj5G2x36WNkLCfKMRY+icbm41CI+qU56Q/lF?=
 =?us-ascii?Q?knTeeLfUp6CvrWu/Q8tDxS3d4+alaB01kSICjKiXzgUbcFLKVyrBSKdpzU0I?=
 =?us-ascii?Q?/2rmLY/t2hADgRFERtkNw0Ah5VCZw+WyXXYoaGg/lK2GGQAbrAlaekYjCXBQ?=
 =?us-ascii?Q?065zTQhhDhZz2MXL9XbXlRlupj8cn9TX+cwlVAeOop0ue4fd3lVCinsQX7Xf?=
 =?us-ascii?Q?xLizzS1oBNw79KWQv1tUQJSOPGe3TBrMUj5EiyI5HVdjYJaf2lS6vzRa4Wyw?=
 =?us-ascii?Q?f0Jg/RvGceY1aw6oH/VvEbGVFWUoBEaYMJW9FpAEcAbfj/eRp8DVjYvGNl/x?=
 =?us-ascii?Q?vFNLuTVtasjTFC+x6kkOznmoz1j2UtQsJtcKu9aV34cyS4derMQhsPLGecRJ?=
 =?us-ascii?Q?SRQO8imV43Cei5bxj97cEBSpUTQyv2klzsJyf8tcv6Zzpu7OJt3SP450NemX?=
 =?us-ascii?Q?9AW62uITY3dLtEAdJkqryPIG6CjLPvqQdDRLVopWmvoWCbZ4hlK0hQOV9uof?=
 =?us-ascii?Q?6clZsRS/DkhNZSyl0qUsSXoF3CGQfewKwrTz4bTaI7gbzmlhgoMHaPEjZEdx?=
 =?us-ascii?Q?AHN2lXLnzZYsNjc7R++gtj46HVsFGq9QGsFqj5TaWXDjup0VgC3lxqkPpSIR?=
 =?us-ascii?Q?JThm/6F9et4Nx4+6147wsPJIM/EcqEHuQMKAS07lBKZgZN22EKGepTzaJ9ur?=
 =?us-ascii?Q?0LB5AIYQ7oqhFs8UdEcB6ScW638HRV9eR3UElJcfB42qvTNky2Fs1yeaamqL?=
 =?us-ascii?Q?L/gi8IwD0oXOl8zvnAY8kbPQAUDtdajgECb5zHYDQSOKZbzpgYgaHNw7Ag4t?=
 =?us-ascii?Q?a3FX1ctNh25LH5lGFxJCA0VtbyuxgE7pRxe/2+Z0PqSzuUuf8QqkK62/Ipbq?=
 =?us-ascii?Q?RSmasALdatdl0VQG7n/nWhjGPyVoycbN6E93tV/dhRvoyTT9b0XV47yIAewC?=
 =?us-ascii?Q?N8TYRrM8zdMCUODaYIEwnfXc4pZWoHg5//z1Tu0xS3+cBp0E/jy4HSMGiFFD?=
 =?us-ascii?Q?E7/157WZ9H3zokeLM54OD8p/LXY/GfBglBNdSuk+Oi/8gLyzhhmMujHiWHDn?=
 =?us-ascii?Q?XAiC6mQAnlomSNC3HaNXpblQqZlj69qgeuF8lkjZPHFpDAg1n8yeeb96M9Qw?=
 =?us-ascii?Q?YSB5XNLhnee78Vmtycq3wkCp3rlHf4ezzYtcpfBpPoMQPSQGGWGwDpUowK9h?=
 =?us-ascii?Q?7w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb1b2bdc-b836-4cec-7838-08ddb4c24e8f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 15:01:19.4721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KlA46VfvM3119gdWVK3TXQWLzRTnX2gO+tiFHxF5T8yfEEIEN0T9BQ1Zb2UhMkIoJl8MGY2kKUgOKT5Ot41jZhVaATiftYk9j8zhRBK7yGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7066
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

On Thu, Jun 26, 2025 at 09:57:05AM +0100, Tvrtko Ursulin wrote:
>
>On 25/06/2025 22:47, Lucas De Marchi wrote:
>>On Wed, Jun 25, 2025 at 04:36:31PM +0100, Tvrtko Ursulin wrote:
>>>Add XeLP workaround 16010904313.
>>>
>>>The description calls for it to be emitted as the indirect context buffer
>>>workaround for render and compute, and from the workaround batch buffer
>>>for the other engines. Therefore we plug into the previously added
>>>respective top level emission functions.
>>>
>>>The actual command streamer programming sequence differs from what is
>>>described in the PRM, in that it assumes the listed LRCA offset was
>>>supposed to actually refer to the location of the CTX_TIMESTAMP register
>>>instead of LRCA + 0x180c (which is in GPR space). Latter appears to make
>>>more sense under the assumption that multiple writes are helping with
>>>restoring the CTX_TIMESTAMP register content from the saved 
>>>context state.
>>
>>humn... but i915, which is supposedly doing the right thing,
>>diverges from the PRM by using LRM + LRR + LRR. Here you are doing
>
>Matt reported i915 was doing the wrong thing actually, compared to 
>what was documented in the WA database at least. Not that the latter 
>was completely clear, but we had a brief guessing game and I 
>understood the conclusion was 3x LRM to forcefully restore 
>CTX_TIMESTAMP is what made most sense.
>
>See https://lore.kernel.org/intel-xe/20250523174135.GS5080@mdroper-desk1.amr.corp.intel.com/.
>
>>something different from both. Does gputop show saner values after this?
>
>Gputop looks okay to me. Are you saying this WA is fixing something is 
>regularly goes wrong so could be easily observed? I thought it was 
>about a rare failure to restore CTX_TIMESTAMP but that was just a 
>guess to be fair.

yes, it doesn't really work in TGL.... it just keeps reporting ~0% or
100%, rather than something sane like it does in DG2 and later.

We could go the other way around for testing: do the way you have it
here in i915 and then check gputop if we start seeing the same thing.
Then at least we will know if this is really the case instead of
debugging the addition of indirect ctx.

Lucas De Marchi
