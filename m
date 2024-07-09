Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0155AC3DA41
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 14:44:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C682C10E144;
	Tue,  9 Jul 2024 14:44:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iTT5DpVJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316FE10E144
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 14:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720536272; x=1752072272;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8mFJokfGFeGRTEz7BFWY6nS49Fs5u6peGLmuj680x8I=;
 b=iTT5DpVJIT+R4vHI2cafKrrGmUhfDb5kHpRQMm05xVCRTavdxCuwvtMp
 Ge7KBeWlen5Zy4qEOAOeYzxPlb+VkydELE8xpteA1LGXlPTim3sKi1CXO
 okiOsbjn61acwjSzrqIJYIPJXVityFauwax4QEMTZW2+hYd6rSqb06jCl
 nOBpzgReZ5gvSFpXrDymmmU3sd9Ji0naZl3BWtNEbFoifktvGv267ZzHk
 Sc5hYvFjkSkcwmGBsPzQmdCwHD5q/qx8mE6Eb+WodG0uAMcSOuJxwuT2w
 T1adE3b+56KUJqEKeOa1CKgxhO4b5ZRzQiAFrCpnr1Ld1pqmDE0SDpjhM w==;
X-CSE-ConnectionGUID: Qs6DMYDuRhu/wz8gs850PA==
X-CSE-MsgGUID: um0/rBjNQ42tehoHayKOzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="18002247"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="18002247"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 07:43:58 -0700
X-CSE-ConnectionGUID: nbqSfDZ0TU6e11wgEIP1KQ==
X-CSE-MsgGUID: cHsVCOAJT2mJPoquXgxgog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="71093983"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 07:43:57 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 07:43:57 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 07:43:57 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 07:43:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1jOaa2uwpLtf3wI0pNHf0vCdQgCk0lPT//9pMgf9C6b2gdez1KzfBJp24YvJJAX8TNoCg7g5p+JmK5+n/2m2XILw33bX7LtXAcYgAHdI54DCEWQA8MjRDPCaFuQwAMxpx28n47houW+d0J+8ZftCPuLMs6oiDbIRN9fH1bV8jzbE1uByVowq/3QteAVXhU3sgwiDQ4QMavs78yCUtUvorNyr9W2PxE2Ye9EPofiE6fCfJlwtxmUlbQw7cruZCGBff07GzM+mAHVXtB9JG4L6rKMbyTGgv24ZVWktLxA9fxYdXyMqSF3wuwphYft65VmNQhHn7MXXZwXAh0zktXMng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8mFJokfGFeGRTEz7BFWY6nS49Fs5u6peGLmuj680x8I=;
 b=B+A5G7JH1pm5dCHZN6FyQCCOnro8tZCSHAPaE8P3HH7jK/u3oC+FbuF7Jo885N5Lss58X46wzBJg2Q+jfdosMBdtIaaFZ+IUKVOJ3lUXojJI/fmCwo0jZWk4vKCGlhHoajT/aSwcaAKPJGw5Xq4uYpp9YUaSTXuXhLrANUgVT2VIwRGWht5nJvAS/lQbSDWSOWIZd0GogGpdzXAycf+mxCg/tv4GyTaJ33TAz3f6aB0frPSMJT9JzrriOThb/tw52YqolaXVu7KBXLGs6CGTPCH+hByM5L6DJ5R58oG//osBQx7kpNZKxjo/7Py078+eaSEe7bKxkVMHsQF7RYCjww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4609.namprd11.prod.outlook.com (2603:10b6:5:28f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.38; Tue, 9 Jul
 2024 14:43:51 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 14:43:51 +0000
Date: Tue, 9 Jul 2024 09:43:50 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/4] drm/xe/kunit: Simplify xe_bo live tests code layout
Message-ID: <nizerv72a7ns5c54cgbai7oyllzpqntyr52qks3kktykri7iag@qgtrzzphs4ct>
References: <20240708111210.1154-1-michal.wajdeczko@intel.com>
 <20240708111210.1154-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240708111210.1154-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR04CA0199.namprd04.prod.outlook.com
 (2603:10b6:303:86::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4609:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ef6f33e-d50d-419e-53e0-08dca0258cb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?E16DDel8XgFuJlaIyqyqjZdFJMSoRufZ/gztUbAhJdii3aO3AWvEb7m1IOtg?=
 =?us-ascii?Q?3+4NU3Gn1RJxCyGzJ32PIs3FoZ4wJ2anK5K3wZcipG6dvzjehCv3Yca4JYZ6?=
 =?us-ascii?Q?AmRDUZt5vNGL8EPeG6T9IhMuhsK/t6+8Wka9OEe7ppjKZTkeXpe+dR3VnKgw?=
 =?us-ascii?Q?JcuPdmYiMQV80QXZnMhJaAMxBO/mW61E/4f/2Sf2JYV9sYf2fRkdgHfmOF0Y?=
 =?us-ascii?Q?2bZdCP6LD+/QRl5mUAgrfsrfxiezDS0+1zVkmLpMiUpxygPVH2oj8P3ypfFH?=
 =?us-ascii?Q?VVA44QHOBjU529rwNNGPN2jpD5t0BJ2jd/uRwkQOWvFxHdTTvvLFsgAlWP4a?=
 =?us-ascii?Q?/5caKZ68/gUXOIe6UMw6DIRnoY9QazJLAGNCgE7eDhKCEpBim4+lBo9qwR9d?=
 =?us-ascii?Q?TLmnQjuSU0BqJDDvrA9HJ1B2ybpCsLuUMvsaKsZI3btM6eaGXbz+N68LUs7o?=
 =?us-ascii?Q?A2CCWRrvRcXAm1MgrOS5CYclKT/G3uoKuCfEyCG1joBvlb/b/8LVtb/oM9yF?=
 =?us-ascii?Q?h0bJo6rf/2Ton/854hC9zxXT1N2myaRnxyZ3HRDbt+gvQP158H+tLhwaec1U?=
 =?us-ascii?Q?4PkvYGEObpeiLBnluf0FtSpoM3/eTkaNEu+INTRaQaDWvEz8cZezg/LGmbjX?=
 =?us-ascii?Q?lxj6zmE6dEJBrBZkfYOm87Y/eLicQz74iOh20ig4btb9sc8aLLckfnJZEk2p?=
 =?us-ascii?Q?Pd9XcsUSfaYG610mUNfhyeJVboaeIkuxWdXLOU2ThNEglUrhXrqj93ZkH3kl?=
 =?us-ascii?Q?e7gJaEp7VXb0z2wmXawwsiLLcLLvhz4oWl6FS2f3w/dJYYtCHIXjXDWH3926?=
 =?us-ascii?Q?kMSpCgFNg8qImih7HFY6jAP2fhDTz6netPEauwQgRnOrMQ0EC/FmDmKl5NXz?=
 =?us-ascii?Q?hPFUC3p5ynSfRuGSvKxD+KT4WZPT8UxCMFi0EDQvU1o5TEtfUHUyifKuFz3w?=
 =?us-ascii?Q?JYYH3f9dxBOYdICyD3VOQ/WAR/Ftpg/HM8ihyhOkl2r8wvBLkKTe+PeEGtD4?=
 =?us-ascii?Q?6Aahq2RRBuMa1rhMeMnAUgQyYc2N03e6yljj5hbeJNsSt3fI33JtbnjyJVHX?=
 =?us-ascii?Q?iifAywEHSZBnNfFMUAvnzFRdfL7MqtKY9F7Sqtg9eYK1V4C8Sxq0sidblneG?=
 =?us-ascii?Q?N8y3z6r5kEeJ8T5Nc18K3pWDOt42waj3UoL1Xa0bpt3nYrPtR1G54JMb4xu4?=
 =?us-ascii?Q?Y8t7ye/V5TxdVRgzGaaTRKpGqI2fs1Sh6jMuCOsYFyOFa9b1QotjU8NiaHDQ?=
 =?us-ascii?Q?1+VomRYQIgVpH0LPSUoUYccXMZehch9kfX+gslDfl7xMLLBisnKLNKX3vEAx?=
 =?us-ascii?Q?KmZIpos7jsuGKVfAyp9uDI6BLmjoHdGgAareFjTL8IsWwQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5bDx8LbMwQGtliGry3jD/iNPUNJnI2MeG55rrWsdSOkQCjaYdKcSHufD8+rJ?=
 =?us-ascii?Q?GKKZNKrIRx+amkcUav1Qt06n5RQLACiDiceNpFka5rmf1tnUdZviefMwlVYP?=
 =?us-ascii?Q?ozzvG599q8nI4rCPZ1GnwylL7yfJnfLWRrsRb52SUJRE71MAHqZyjXZ3CJnq?=
 =?us-ascii?Q?aYyIZRQsSw1qtph5/j/IkDg4+cakW1JOL2BnzV09m8fPthXTgQcn82AoWoTW?=
 =?us-ascii?Q?Lt+++vgXhdq/yBVFvhPYdiwSip+3D+uwglnS96DBRwadNouP/TwDNJCr0s56?=
 =?us-ascii?Q?gxQK2LPSQ9DY4NGFMghOa0WbHARJw+xSWYM25Q3f7Bobcf5LbVpq5OAJhV7P?=
 =?us-ascii?Q?8WVJofWyMRogD7YJn5wHGNZxa9nqPI20ZMjVa2nFjwbiwLGyQbOATSjxPKjf?=
 =?us-ascii?Q?P6E38NY6mrM6HTzKdMwfIX9FQ5y/WyXtQxX/tgTTgDSKpg2as2tPMJGIklh3?=
 =?us-ascii?Q?FkKUnWJQTirbXbn+HHYL1YEkvzXVB3NcX5Rj5N+u5CBAHHgYYtN1Fq/sWyqh?=
 =?us-ascii?Q?JiTs7LQuzYyOn5JEfNlJxB0fSM14eRgpOkkq6roaLnuopWZ4WWSImlH9OleC?=
 =?us-ascii?Q?3VqtFafhaldVSrME6dGWbXeMu5LsUZ23fxiO6hE93BKFxTh2nWSiDogQtR64?=
 =?us-ascii?Q?bsdLRPtJQ/bgAGAKtTiHJzZV9Q+OCojaiz2r+d4z/QJ7lSEhrRGWzLiuIQ5K?=
 =?us-ascii?Q?z+z5PnDr76Hnfz4RmJvRCbw57pUISHiID0K2sxnuVS4ZUrt1A/atTIadptVC?=
 =?us-ascii?Q?KmEWQYJXIw5vxv0LKOIjjZj71MEYbue1vjagDWt8u+l4OIyEzv/1pfSuj0ct?=
 =?us-ascii?Q?gTdVACw5nzsbBa0rTmMsL4EZYPsA2hjInMPhsCf2ds+HkV1G2nWC3yYTM4bR?=
 =?us-ascii?Q?IuvJyQzeqbXsw3Y5mo88q8mfXx+GrZg5bNjrnLPKZzkKBcEyPurhOFfqJIW/?=
 =?us-ascii?Q?qIKKdgesDgAS6ZALvJQw7SFcdLtF1+0eBKH11ZnWd/9R9j37a2QTFfi8TvQ1?=
 =?us-ascii?Q?mc2BTNc7OZu0OM2UgD1a0WpU5DtvmYf6u7mBmpZlMV6qm5cqRusZV/xcsyNJ?=
 =?us-ascii?Q?gwajO/ADgRmf5MIMSLPpIAWlaElUTA+HLyHNG7MmpvX4yNArrlKKBRu7SITo?=
 =?us-ascii?Q?SVUd13GGQ5RqjywHZKZuFaxkb5ecxIkmcHdqlzY/cDnbw3xTQTgHQbUYftiy?=
 =?us-ascii?Q?xVzDW5IKp40ROKklpou7fTr1vMa9O8wA5F5AdV8yGX6qirHJu3GWg/l33mf7?=
 =?us-ascii?Q?nl41JIj0AgkSM7F7IfQrqjVXY+dUxyqS+sjfh4dFGdbljXo/KNg4uLTk8CIV?=
 =?us-ascii?Q?VxvYRzVwMrMbJF9RI/CC8HqLzAXRaFQlGIw4V/uYZbyCBSYI0mU1rHyABhDY?=
 =?us-ascii?Q?7TJtyCCyowYi7wDtxi0xVjQEfhpMIjqIPkuURQrNo9aieOFM98BSjjiZM7X1?=
 =?us-ascii?Q?2ICdMardJXwziN7N4IasrjVejCouPi5BTjsz8j1wJXURMd1Co2p08mNNmjCh?=
 =?us-ascii?Q?yotAAl48wVdq9sGAH5GnNukP6+/uiaNcUZD9TmmIoTnBXDW/rmVe49jfbksf?=
 =?us-ascii?Q?dypXASbbxMDp7rb5TXc5set8By26rRZXIRV0D35ZRTTZ8CIH//q1njWLxX0x?=
 =?us-ascii?Q?nQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ef6f33e-d50d-419e-53e0-08dca0258cb1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 14:43:51.6218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qDBCK8gJDF+lDA3vK1HLL+r8jkYO0dHZzp+cI18Km45B7YPKqQmzul3sFKqE9V2RtqvIgeW0uy4NF/5BrDJn2IkXXLOcaPKDO2wsEDKUA1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4609
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

On Mon, Jul 08, 2024 at 01:12:07PM GMT, Michal Wajdeczko wrote:
>The test case logic is implemented by the functions compiled as
>part of the core Xe driver module and then exported to build and
>register the test suite in the live test module.
>
>But we don't need to export individual test case functions, we may
>just export the entire test suite. And we don't need to register
>this test suite in a separate file, it can be done in the main
>file of the live test module.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
