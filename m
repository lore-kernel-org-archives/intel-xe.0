Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE37BC02193
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 23:36:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A494C10E029;
	Tue,  4 Feb 2025 23:36:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="msDgTF+Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B84710E029
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 23:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738712192; x=1770248192;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=f1ibP88oew2Yg0WlX0nB52JVxG7yXQVRJNhpPjCDslo=;
 b=msDgTF+QsblfpigpdvBIT6i3TVRp+BwtppkdLX0+x3NqFN4tWV+wxV8+
 dXR3DwEDKqkGIa6uSq+MzjTkKocWvlvHG6iTcfrc182DlLKnHKHFs9q1k
 cr57Ba3DXDNHmk3ri+uNf5oHBJTNgcHto/n3FoewVk7q+Gk6+4Fn7JNZP
 7je6+LrjrWWZvg6CO0JKN6r68eC5lNNt0kY9XKKv+f3Hhfc0vV2BSWsim
 0XuU3EzwjobsvywoSMbNjmvraT2Fk1FBP4VDwEHTHwBbHUyne2r2X7mCS
 APipGcxiRP01W7elQaY5QBPbldSff7PdYTTVKiPjs/J9xlQQDcCS5SaMv w==;
X-CSE-ConnectionGUID: g7+Hg+LdRguPDVDrS074Pw==
X-CSE-MsgGUID: wfPjn45JQkuzC/8+5nE9tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43183643"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="43183643"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 15:36:32 -0800
X-CSE-ConnectionGUID: 82tV+iY5RU2RqdZ4ffZxOQ==
X-CSE-MsgGUID: PCiFBPwMSqShqtfMITCAqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110574010"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Feb 2025 15:36:32 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 15:36:30 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 15:36:30 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 15:36:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t1oWUel//gpbRh/O0UIW6zjb8pa3gTXfNN88LDvGXyTBZHpciPZSg9wpXQ3ZIuFE4S2PMH/37Po4jwS9jUyZYLO74oVbYGnJaTWTejQzjz6ZQrsDdIWKTp1N0DiHebEV2DGBINvdAn2HONy6A85Q7ykjAB1WPqtGnVlGPk5Z7zTmGk58G7rh39PHjzqQfaCqtobSQmp9bAOfARRZIC68+sEbCs0xgCTDeqDkkzydCdc5I9sDf4nVaZWMdfRAI54rDSAK3Mnc/VIVXFdh0DSHDGHd721AWDo6AFpJrLzuoBHFl3mjkbdbII/QKSCz3cif1CUzW7xRKftPcAy+RRF+Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HzXNzP0cp2/z/vLv7m3Vz8OXtUsqDqMGEPHQN6nKivU=;
 b=tcdI0m2AxQJLUPGw4L7fOcCJKV03bHtNnKcjOv7YkwYSG5h+ZVdWOue5njWLj8QjUHOmXbySGxs2w49ceK3oL6OP22+4Fccn5D5U97PvcsGoBTptswAv6VmVu2rnQdO6K/4l50cRIzdEcVgv0MkU0valFUgkOORk3mIftf7CPxcZ2yZ9fbpo0rGxSr/VSep1eiAreDs6Lf4OatGJIb9Cqf6XScU0yzdJ7FMQit6gN4QKZyHMkfErOWTmKENgCzyHcKP89169YmK+H2MKOdk/e8y0LQnUV7ncPtiMc8nj/9vtiuXBEq6dEIGPolG0hUBajhLjlXsbI7RYPQ0fh3yG9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by CH3PR11MB7817.namprd11.prod.outlook.com (2603:10b6:610:123::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 23:36:14 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 23:36:14 +0000
Date: Tue, 4 Feb 2025 18:36:10 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Ville
 =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@intel.com>, Uma Shankar
 <uma.shankar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1?= =?utf-8?Q?re?= for
 AuxCCS handling and render compression modifiers
Message-ID: <Z6KkahOKuiBTKDfX@intel.com>
References: <20250131142045.47785-1-tvrtko.ursulin@igalia.com>
 <173835518689.3314806.6980040255427143980@b555e5b46a47>
 <eb3a3729-e8ef-4868-b8ff-b6efd66ef4fa@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <eb3a3729-e8ef-4868-b8ff-b6efd66ef4fa@igalia.com>
X-ClientProxiedBy: MW4P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::21) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|CH3PR11MB7817:EE_
X-MS-Office365-Filtering-Correlation-Id: 84bc8f07-c565-48f8-79f7-08dd4574b675
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?opD8QjaTb3lIt+FvShvrUIISYUp3uCM7j1RulBw+Pm80hnw5fvHoaBNLUBUn?=
 =?us-ascii?Q?A3/gl8Acmh4yO2FGq+1RP7t6MZa4BUh5ewBi5e2yISTJmplZNQQ69D6SKyw1?=
 =?us-ascii?Q?PU9Hq1jv+AawL/IdFLofH/Xlj/J9lIEeeQXyWabl7qpEQWOwFziAe1U+ZJ89?=
 =?us-ascii?Q?yYv7VU1Llu7+aauuKn1IMd5MOWY7N7aUoXLoESDaafyt6wFMnnaNggqWZzkl?=
 =?us-ascii?Q?luvWNeK44Wjby+FVWh+iX8QDMKy+OWjMEEasQMlgFZXKlH7PcN4F7mIMmc7X?=
 =?us-ascii?Q?/Rat9DWz8I8B/O/myCLPREtC8Gc9NurxALDhq/wbwF87jB27Hbvoae0wWfDD?=
 =?us-ascii?Q?qm5aHxuvgIw1bTEx4F434hx9orwBydRkj2RX6mHxjTdEydrt9JnyFmXTy6Qo?=
 =?us-ascii?Q?Vr8hfkryckdQCsxmJxcZqK6NvIT4vpp7m60T84vmcFtj1eQVa8vvO+rEq9MJ?=
 =?us-ascii?Q?vBavNo7WEmtZrNcunsE7AZdP0Bn385ujv+8JVDuFbOaMHwie44YhS0QnGjg1?=
 =?us-ascii?Q?LYUst3qeNGYvfdmGXgkQF0vbQZbWOGxJem8BlcJ0KXOuAPhuxcz+NkUxBGka?=
 =?us-ascii?Q?PaumA+qfAz4cIY8x3H1z+xMotWg5yIwFZiUBIAcHJicAbacPou/5yzWRQnew?=
 =?us-ascii?Q?4uLiyUvZ+wJjL0k7+OW7EkKeArqzDcgim1hw5xPKwQ+776vbvof7Yn7MxLn+?=
 =?us-ascii?Q?QtVdrcFqZF7bDCe4vOlwcq5VCJYAT74hqq+QHjhqw64f45A+ktUowXV+zbFN?=
 =?us-ascii?Q?H1f5xAvR7d2SYtPgLyK7iXsuiSVsu2llqZGlJHqu6QklHDiuC/iMe3ekwxtF?=
 =?us-ascii?Q?89tImJYJdHM5oh9aKD3hJWzyDg4FF4R889nyUBGF2VgGEuvlrZN9RXAhkr4y?=
 =?us-ascii?Q?TJxrvo9pJPrhKt1Xr9Ky0ecFnrxNnn2dC8KycU1n+pQ8ONfjjQFOkx6f5DJJ?=
 =?us-ascii?Q?WLHAH8ILq57MMGaYcBczcRW6URsPx08H4kcqMkWFQovSpb8wIqBANBY7xBYu?=
 =?us-ascii?Q?qFeJPF6qWhsz/7cXH+9c7GWBdvEJR4qvNNZcpVc/yhvfhTdG5dfqOZCw4kty?=
 =?us-ascii?Q?zsJwzd1Gnqf95zIpZCLlMk3xe98fM6aNhLnTpsVBJsE0yvSjHOrEZun3TwW5?=
 =?us-ascii?Q?bp+AYhMZkJxrpjKFvBkZzpixHQhh0WXh2xl5QUhjjIKwoGI8IYGv7Ptbl3d6?=
 =?us-ascii?Q?ExSVSTeNaSKM6tDokQyScMLE4rsuEhpY3OvnDL/1Eu2otRZ3Tr1c0h+dMmnR?=
 =?us-ascii?Q?dwMBNpfrn1a7MQBkjvpJuxzpjZgcr/Ec+hCP4cBGAItW7Ea3FjcfdbRYY92Z?=
 =?us-ascii?Q?oO2CM5yjyr81nIW23esDuyXWPptxDUvJ9ktYZr5J8B0g/Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hct30EJRnR2a/VuR1L1ecCHRpO5RiXoqDG9HzyyGqqQgLhsxuG1sUffwVyBi?=
 =?us-ascii?Q?xGVzhJKasO/0BgwQxf7yyaehZbZXRyDaBb0H0BL6JOX3tq4RtzkQg6q+7iHo?=
 =?us-ascii?Q?KAh13a6DfwUiptSJTmW3oQffT+4DKXwpnUFVi3N5zzgIH7RrpnJi2p/rHMdw?=
 =?us-ascii?Q?AIL3JFaYLVa0Ea0OtpwovStA63TtkvuViInGwJ2oUt0Es2WK6zkc0TiP8iAf?=
 =?us-ascii?Q?Zp2+173xtnmpylm7RM2ZXjZ2FxFikYatV9E5rF/aZPy45Ffan9IHL7xZPTZc?=
 =?us-ascii?Q?MZ4+r0H7MctFIMVGMFgUxbHAccyuBvI9GXq6luAGswaL35k6HaDw/0DZjU/E?=
 =?us-ascii?Q?YrDd3pvVh71aN+kfmPksuTy49HMcfKs4MaA7PBjsKKTMmqaKGV/cSKHebSMv?=
 =?us-ascii?Q?JOb1/yP9HzMYJGvN1OpvwZhY//pB3SjqIsAyqdnbfoHQvVTUwnLpCjjL2L4B?=
 =?us-ascii?Q?/9w8aa0xMbDZWSAnbEFIsAU5xq5fAuVtMrT80imVSG5Mvp0MD2AqRtuFwK1v?=
 =?us-ascii?Q?h6ki08fvmfcjQqZ4kt2cYZ1dZoKgWo0HwtlufQ8U2y/WqYH+h9lOBgWt2uO1?=
 =?us-ascii?Q?JtScBA2GbevsS7F0z6m3nRvGRWNIKlLpJxgChkX53SESlWWWGkce7ipYWl9I?=
 =?us-ascii?Q?uy64MTL7uXHrf02t+h0VJ24ntQOjA2qJ2Rl0UYgvXp7vUOo8n2U+wMNjhCdc?=
 =?us-ascii?Q?bsyxSAaIEXS/XOb4hZggP+xx2Q9qLO7jkT6GDi0mcLq7dDwformJYH8EkyiI?=
 =?us-ascii?Q?3r4wVpKVAAfv/Kxx2+qRtlWdn9sSwvo580FlYieV14lnG/YlFA19t18gbIVU?=
 =?us-ascii?Q?QdrwgOLicjCYYr/aV3+tyVivgVNF0XQ/tBepGyz9kWbkzh5i6wkER8+Oh/He?=
 =?us-ascii?Q?BgjFs66HqpMAE8QPgknAbOsCwl3DI5CQfwzG78jS4MZooj7gTkdE/UT0kDx4?=
 =?us-ascii?Q?nkJpuM2BPjLq+7eZAdQmcVgSwrs6j2evibBto2xwkanqlk25KTbh7Tme8YB/?=
 =?us-ascii?Q?hwgH6rrS3gFCtc0trBlGnf1S0NHQQV03ZJv6OJn6fUae5X8SNaFg5Da62TjG?=
 =?us-ascii?Q?pWQz45j110UBPa3kzaW9mbkfbFfcUstuHFv+UAUxhESNrWlvDgrWQkv7RuNq?=
 =?us-ascii?Q?KcX4lNglXWkSVDn4UiWetNLztUi+eUguPvtZxZSfISWGaow8z4+qiPn47roI?=
 =?us-ascii?Q?l/Mxd+rkQcEtO3TM8VuaO9/yrZXrZcDUO2kswm7YROJfAn/rr0HYnVoAKgTr?=
 =?us-ascii?Q?aB+vH0VXCl0BfelqEQO9sUXmrPMo7ho7VaX9/kCahBNTf93C1UPgcUchbC2x?=
 =?us-ascii?Q?SzA2gPONRWwGTy7BDcxApbTJUizpsxhVGL8Glr3xZU/DMXeHAzIvhug3PiVC?=
 =?us-ascii?Q?PPUZ0Pz+99iEYPsOdAWOLWjV+GDo+sWGMUZ3lFiEZgx/dAUtzUszXNHf3Ezf?=
 =?us-ascii?Q?7sgJr7twNLig8x8wPKSsG74d/UHfoM2nGVw7672Nkf+2bU1Kvyn0oqXYcmt/?=
 =?us-ascii?Q?wgciaedo/+rDKs9Zzie3YGmRSeu7iiyTUPEdtaH6kF8VwQmQYM0LT1vixZuN?=
 =?us-ascii?Q?JWcAsPCzkDqURFnQUVN49th2832nOENIn9e9wFdphy7mKzggIe6+h35sZhzr?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84bc8f07-c565-48f8-79f7-08dd4574b675
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 23:36:13.9643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pxCaCQ/B8UGRQYHAEIHg9u9932XGaAJAtxQud20RnwfLLo9BKd9l9yHsDqSnXLDLZjMqAhNwwo6A2ZOMUOxu9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7817
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

On Tue, Feb 04, 2025 at 11:12:45AM +0000, Tvrtko Ursulin wrote:
> 
> + Rodrigo and Jani for possible CI/display insights or adding correct Cc
> please.

+Ville, Uma

I never liked very much the crc checks, but I thought the pipe crc were
more reliable. I had a horrible experience with the edp sink crc in the
past...

more below...

> 
> On 31/01/2025 20:26, Patchwork wrote:
> > igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-rc-ccs-cc-to-y-mc-ccs (NEW):
> > 
> >   * shard-adlp: NOTRUN -> FAIL
> >     <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144186v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-1-y-rc-ccs-cc-to-y-mc-ccs.html> +66 other tests fail
> 
> Two things here.
> 
> First it seems to be some sort of a race condition in crc collection and/or
> vblank counter handling. Tests work individually but fail one run in
> sequence. Bad CRC also varies run to run, while visually things look fine to
> me on screen. Also a delay before collecting the crc seems to improve
> things.
> 
> I instrumented things a bit but I don't really understand it. For example
> collecting the reference CRC appears to have some "collect it at the next
> vblank logic", but I am not sure that works correctly. Ie.
> 
> Working case:
> ==========================================
> 
> Getting the reference CRC:
> ------------------------------------------
> (kms_flip_tiling:14174) igt_pipe_crc-DEBUG: crc for vblank 703868, target
> 703869; crc[0]=b82b36e4
> (kms_flip_tiling:14174) igt_pipe_crc-DEBUG: crc for vblank 703869, target
> 703869; crc[0]=b82b36e4
> 
> reference_crc[0]=b82b36e4
> 
> Compare after flip:
> 
> (kms_flip_tiling:14174) igt_pipe_crc-DEBUG: crc for vblank 703870, target
> 703872; crc[0]=b82b36e4
> (kms_flip_tiling:14174) igt_pipe_crc-DEBUG: crc for vblank 703871, target
> 703872; crc[0]=2aa66f1d
> (kms_flip_tiling:14174) igt_pipe_crc-DEBUG: crc for vblank 703872, target
> 703872; crc[0]=b82b36e4
> 
> reference_crc[0]=b82b36e4 crc[0]=b82b36e4
> 
> 
> Failing case:
> ==========================================
> 
> Getting the reference CRC:
> ------------------------------------------
> (kms_flip_tiling:14145) igt_pipe_crc-DEBUG: crc for vblank 698273, target
> 698278; crc[0]=b82b36e4
> (kms_flip_tiling:14145) igt_pipe_crc-DEBUG: crc for vblank 698274, target
> 698278; crc[0]=b82b36e4
> (kms_flip_tiling:14145) igt_pipe_crc-DEBUG: crc for vblank 698275, target
> 698278; crc[0]=b82b36e4
> (kms_flip_tiling:14145) igt_pipe_crc-DEBUG: crc for vblank 698276, target
> 698278; crc[0]=b82b36e4
> (kms_flip_tiling:14145) igt_pipe_crc-DEBUG: crc for vblank 698277, target
> 698278; crc[0]=b82b36e4
> (kms_flip_tiling:14145) igt_pipe_crc-DEBUG: crc for vblank 698278, target
> 698278; crc[0]=7b978b62
> 
> reference_crc[0]=7b978b62
> 
> Compare after flip:
> ------------------------------------------
> (kms_flip_tiling:14145) igt_pipe_crc-DEBUG: crc for vblank 698279, target
> 698281; crc[0]=dbec96bd
> (kms_flip_tiling:14145) igt_pipe_crc-DEBUG: crc for vblank 698280, target
> 698281; crc[0]=da444d0a
> (kms_flip_tiling:14145) igt_pipe_crc-DEBUG: crc for vblank 698281, target
> 698281; crc[0]=b82b36e4
> 
> reference_crc[0]=7b978b62 crc[0]=b82b36e4

This is pretty interesting.

b82b36e4 (vblank 698273 to 698277) = b82b36e4 (vblank 698281)

But the vblank 698278 came before the page flip, so, why was that different?
It doesn't look reliable. Should we then get a few samples and stick with
the most seen one? :(


> 
> (kms_flip_tiling:14145) igt_pipe_crc-DEBUG: CRC mismatch at index 0:
> 0x7b978b62 != 0xb82b36e4
> 
> Second thing - how come xe shards have ADL-P when xe does not support it,
> while i915 shards don't, when it does? :))
> 
> Regards,
> 
> Tvrtko
