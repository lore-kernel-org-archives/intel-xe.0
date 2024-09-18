Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673ADCDD556
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 20:43:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 201AF10E63A;
	Wed, 18 Sep 2024 20:43:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nEqsGP9E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B22EE10E63A
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 20:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726692207; x=1758228207;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=34XG0orcwlAzGpMirvWYsSf5Ew6QFdNqAGZxgtAZjAc=;
 b=nEqsGP9ExZc9oCcjEucsUD8cIEEfgK9a4PyGK09IQnvwFnyMB8EDQ1az
 v2XNYWQzDQPSi7GvvG9cJE76iOn8OyCrQEQ8Ex6y8M6P9zFz9XmzwYp5b
 SWSMI5VBxeOES9Tc1gumJu2uTh67j5kw5oJlyyVwOTHDqrIUPf395mqxO
 y/iD1wy1e+z5FPoKkW+ncoZAgchYwxuileqSNQPvQsYSqmYr55jC6s3HE
 HUV0ublREhRKDz4BUsvmd6omG0HHDUfe2JcKaOMEjDFetzJZxXRa0qXw1
 vRY1rUdfoBuqp7ZeA4lZlU9ai+Nm0UzJYPWgJahqkszl9flzlmI+sP0ti w==;
X-CSE-ConnectionGUID: oeMW62dcTTm/CrDqyJTntg==
X-CSE-MsgGUID: nPUM2RyNSMK1M7EODsXMpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="36759282"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="36759282"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 13:43:27 -0700
X-CSE-ConnectionGUID: dHZLzFAQRpCZ93MGBb0mIw==
X-CSE-MsgGUID: 6gWz74RyTjyTeHzKPNpSQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="74490560"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2024 13:43:26 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 13:43:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 13:43:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 13:43:25 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Sep 2024 13:43:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVUt9FSE8985VWzjxkT3Qg3eE4xdRe4N6U/GvW4yRi1tCmH2Uxgsdfn+u4MUgsijICnkSJG7fZU8EOL92ZFMcgiQlWhx94PJdhmsNOaQuPg70ZofJ3mdzENoSfaKoxMx8zBCJ8RDCZSB6Edzxne+9zvrTEpjVV8tf6/8A+mxhwhNzrKuxZFnlU4fmxp78zlSZW/zdLCCCaDWI3SZovoRvXsdIvn7gZHpeC9XuBwvI22hdF0AO638ZbeSoncBO7fGxMZVBSkELhUjXZ35brpsfzxzdTyfqCwh0Ws/qtBim9Iafz1aioszaxntXx7vodGrttlqUI7VvN58Rwas9jt0Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hrPSUeZyhPACdS19+fraqhyVHV5g4OLY4Dz5+AGKBoo=;
 b=Oaqccygokfcv+Evc9AHGkYX5fWPuKvDl0PyNeVulG7kwotBpUunvT7BguyLzZJP7DRPREQ8vGcCoHJ9REaF8ztWvYI5V/8o1XdOGNeET1+tN4wLOUFTPQnJwsUNlt4jYUHCr1Y2qTSnHHrnA2kYPVQ8lvKDJ2WOehpH3kDT2iRATyO54yA6sDOD2HgEYDDvPWsu0xmqEOndAeVQvzMBgBtv235RnT9o+CEKmllSWkHFLDc/j3+yB+eBD+BEZ7jjrjARqG7fd8Z4//vT1Ldb++raEzkk1cMYKPgZY9NRSHzqQnX5AaJnwRDWHBYKi19FojhGJmvaLhZThClpUn8rW1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB5153.namprd11.prod.outlook.com (2603:10b6:303:95::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.25; Wed, 18 Sep
 2024 20:43:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7982.016; Wed, 18 Sep 2024
 20:43:22 +0000
Date: Wed, 18 Sep 2024 15:43:19 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Nerlige
 Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Vishwanathapura,
 Niranjana" <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH] drm/xe: Decrement client count immediately on file close
Message-ID: <fmn7yawuj6t2o6iwlwftyrxyjefkx2sicow6ynpb3evsdzluwi@vtamjjybuavm>
References: <20240918081150.280055-1-balasubramani.vivekanandan@intel.com>
 <SJ1PR11MB6204E9E9031470ED7D32AF5281622@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <ZuqlWzSaEso1RgI1@bvivekan-mobl1>
 <SJ1PR11MB6204F9F42C3C6C7344C4777A81622@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB6204F9F42C3C6C7344C4777A81622@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4P221CA0026.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB5153:EE_
X-MS-Office365-Filtering-Correlation-Id: bba1beb7-d6bc-4f64-0467-08dcd822890b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8b0hFMMn/c/PoaShzUqzeyrBDNMHOD2gR2sI1zE1BRnx5frr9TEg5RCL9uB2?=
 =?us-ascii?Q?gvWagSjGEvToD3dQ2V9maxLrmQHV0G0QlZeCorKdxddJjGmgQfIoK09e9e1k?=
 =?us-ascii?Q?w2eNU2Eny/Y4FdR1NCWVhsDACtQG6JypR0oh8YNKyu+zti4hSgIh9uFp6P0j?=
 =?us-ascii?Q?jZQxQ67I5UIJaB+EZytLhaVDyLSaFWJSC4NfFRz2DTyvNt2J6hg7Yo2Plv5F?=
 =?us-ascii?Q?y6M+FLffvGiRZ3Am+w2HFK8eC8zwpeyb4iaNYz9m2oTKhB+sBwCp+/tL5QNf?=
 =?us-ascii?Q?aWNlFCEfqlHxEjq12M99KOsy3DlR3c665qI2T1A70zH+FUFzek8P1RkV2a3g?=
 =?us-ascii?Q?wyBnEzUBHtIcoxGVS42D561cZSMbmzfHTW/qEuDtyvVyOa7Jy5G2tQyC1KL+?=
 =?us-ascii?Q?wNl+RRtxDsQAV0Gop1FyUVsU2+F1V5iz39+kQYn21OFJfuPEQMnzvnccPjtI?=
 =?us-ascii?Q?IGdGy7bQFsUOEbjwsPm/ViZgvWgiy0V4jVlTNRtjFAKUiCKJJn7u0/NYFLeL?=
 =?us-ascii?Q?Ez4KqlZtZom+Cz5ZDP5PbmgVqb+ZlNLoTp6oM98FueyTjkHbYURDDcn+CDW5?=
 =?us-ascii?Q?36ps8IPi1B6JyM7jI0gSfHiGuSdH8Bl76f9TQBuRMaB4LwltN9OdxPJ+h7oS?=
 =?us-ascii?Q?sKU5dsvinNnJ1W/nvweIat7+OirSeCXtu0P+w3KKQ/AlvfHvEGAxWB/YRDTI?=
 =?us-ascii?Q?mlcS7EOkpFDLPwgyF8IWLWd142MYiQwKVxg7qOcsxTZF6TPVyanmYun5K/SI?=
 =?us-ascii?Q?Eg5UnLFASvOPf2mJTLnLRNgCv07qehoyXLblL0tpK0xLmngmOnpK+Zqu0QC3?=
 =?us-ascii?Q?Ei90CTYs7G6lbc2MPF19nxvBfyP3liqZpJ5RaLCj6LDnd0AwdZ45N2rdQcpn?=
 =?us-ascii?Q?PF/a+t4dk6GCgOsQQtn7Im7b812+Cm7xTaiJ/FrUT+79oX+/Bd4goi/qSR2q?=
 =?us-ascii?Q?Jdljx5TnC+kUvX++MmFAmDC1aLe5xDMZ4Ie+H07O0vUlAMGJewN7+IjaJHhU?=
 =?us-ascii?Q?gL1NnJtvv06rzGrerpFNivyU2PKfB2YhR01dbefry+4ATVX/P9gyvS0MSpTj?=
 =?us-ascii?Q?fEYoeS6Eq3p9nxwuYrF6rCtGdD/5Rp68l362o8AMl/FwIOMNO4dtxeK1ey2C?=
 =?us-ascii?Q?4PBrd0ouC3ySPodVAGRcKnQPgh/rTJIEDZPdUaJYKYMrPwFL07ERt1XoEZTp?=
 =?us-ascii?Q?vWxIs0nG2A/fVzEhHqedk3C/pCVBDOysCnPlh3qYWpVYqDXiAFHPdyIIg03t?=
 =?us-ascii?Q?FB1MzmGNBAdeN2/0EwG+DexQiCHCmrOiymfrrVKorkiAB0N04Y1GNCurLsbr?=
 =?us-ascii?Q?ChpExq/8b7mQqDV3sqz3MLDfSplZYwSuvlX25iplWevLZBkHcTeQLg4+0+H/?=
 =?us-ascii?Q?zX+CmRyBZYqVlvwNVm6D8dT2j7FASfanXJaQ5WI1MfVXbidJtQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GWrXKUu+te1Bv1KXkb5jq8M6JBp8B0inyNUCEqbmzrsLLpK4vtK+M6Kb1wdH?=
 =?us-ascii?Q?DmNJQ6zqqm9cgxiZ/ZRPBs+opzTzSPzFuTWwAHsY6lCUeEupjTHHOHLDtxHI?=
 =?us-ascii?Q?WjoaRTlAbgE7ypG6RuJO4apTREkI+Fd1fkB7c1Xf7/iA+HSCotKLtBpEPsmj?=
 =?us-ascii?Q?NypGepmtGbqKRsVPTU5r9H2ZYcKitAvEMBUeh1gSYSPTn9I/cKxoGgYpGbIC?=
 =?us-ascii?Q?I3s2SYaICrc4OFqieNoNuR9jVRJOzFEwIplFnwSKwq5mUokiwyNy03wqg/RD?=
 =?us-ascii?Q?3rtoAihKzHmaF7zYi1Qp/9WYN/TqzmhBDXAlCudzxurbLN/Phmnv2Qkczx9w?=
 =?us-ascii?Q?z9iOpephU2fOqrjJjnV/sOY0A5/8mcxYmY2OOPdATlZBkQBBgd/4dQzQctbe?=
 =?us-ascii?Q?2mXTS0j8GT+6Hux2x8iE7FekODIlM2vZAc0/V8tEGJf0DWEp4wipqP/bnScI?=
 =?us-ascii?Q?lZfl1rlSFX5G/EZ4Q7EuipDX/RDQvdwspDk7pKh4LNKXQLdGiXDKZpdTiB3a?=
 =?us-ascii?Q?n986ob060g8Zy7OPEjqClAmYlILRO5ELcuQlWkeFCxe2er5TtlAdia+KxYjl?=
 =?us-ascii?Q?gnDSOP93+yvKNpAjiFFqIMaPfO5xD7apalM9DVn9/yke9MqZdIFcqXuvZ96G?=
 =?us-ascii?Q?K+raIyycqIm8jMeUQ1NvFqoX3rnPx4g5ysi5EVmy4P3zPqBuMurRY5uSCFA4?=
 =?us-ascii?Q?HrKY1f4nHK1lw0tDkBhSY1ZGlPt39E53S5M601DCcjRsX34D5c9oDKb4wL5C?=
 =?us-ascii?Q?XdCbT/8oX/yYBB2PGlHU/5ICiuTAaRDkP9ji6iYhwTRC+901g4sqIzjS1laX?=
 =?us-ascii?Q?m6bYlYW7qOxBncYe+n80ZmtTCiejtC3pdt83pd/1z0dLhNO5LREByTZ6w4ib?=
 =?us-ascii?Q?3vKyKzuXCYYbb5sTdiH7A/a8tWrzHhI7QEKNYRmGUqAtR/yOm0+veVx3JNuf?=
 =?us-ascii?Q?aUnXfEsWjhG50pi1aF2ajKSO43mq++hQpj+MysEgoLgQnrtwfD21XZNCHlll?=
 =?us-ascii?Q?u3Ny/ga6yDoSlEMaSOIz5Zjl19lQ+VeNwEFLK7l/9UUYKsAvbHHda8ASgzra?=
 =?us-ascii?Q?Tge94NeiYMlCDbejcRoskTqlY+ZgXdYloftRQvg+QgTWw5U7sFQUcJhv0nm1?=
 =?us-ascii?Q?9PFZ3lCmNpRb+lzfnBV3HzKFf1EL0s5urhYRHnaTZTdK/iyQsCfaw1Xuavmk?=
 =?us-ascii?Q?5+A+/yKkhnQ85zyzs4/ThHm6NW95S2w1KgCR6X8JWSSjlUGTp4XytYZeeBDy?=
 =?us-ascii?Q?Df98pN0yCQH6Kd86xAirTSftgLYo9JB0V7mM3pR05cOn+whBZ/NNekHvdFZH?=
 =?us-ascii?Q?Yrnrv7pnklYJi74I20GHmw8mNJeg5vXROMNh9Fpw+J06a7GvdEHMJZCBIrJx?=
 =?us-ascii?Q?QY2ZV4xbjoe6CdWXqP5g4/4041bL484nqcShbOoESvzntziy2Hewf26s2gj1?=
 =?us-ascii?Q?3EkolPpobp20VWJIs+02229nZGS5IDzbS4a+yqVpGV2U5ZHA82/5hdUHOzMv?=
 =?us-ascii?Q?r+7Dqttr1bmV0cvPjPdB2M5tj4dmp06vkRnN87OlQg7iZM6asQywO3gX3Mf7?=
 =?us-ascii?Q?y6L9+ApxA3XRehcByw8EVpZEXHMv0VRlzuGHz97k8HdnjXalvC48JjXyGqC2?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bba1beb7-d6bc-4f64-0467-08dcd822890b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 20:43:22.0589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j5pueoqTkZKGb/GJ/0ZfPFmbZhqhoq4g6ESZ5y5z1eajV98MuUg0PVBZ3AYtALyf9s7JrqbCfJUq9q3E3YM+csZTIk6sPxu4jnjsFnHvgoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5153
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

On Wed, Sep 18, 2024 at 11:11:10AM GMT, Upadhyay, Tejas wrote:
>
>
>> -----Original Message-----
>> From: Vivekanandan, Balasubramani
>> <balasubramani.vivekanandan@intel.com>
>> Sent: Wednesday, September 18, 2024 3:33 PM
>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Cc: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>;
>> Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>; De
>> Marchi, Lucas <lucas.demarchi@intel.com>
>> Subject: Re: [PATCH] drm/xe: Decrement client count immediately on file close
>>
>> On 18.09.2024 15:09, Upadhyay, Tejas wrote:
>> >
>> >
>> > > -----Original Message-----
>> > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
>> > > Balasubramani Vivekanandan
>> > > Sent: Wednesday, September 18, 2024 1:42 PM
>> > > To: intel-xe@lists.freedesktop.org
>> > > Cc: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>;
>> > > Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>; De
>> > > Marchi, Lucas <lucas.demarchi@intel.com>; Vivekanandan,
>> > > Balasubramani <balasubramani.vivekanandan@intel.com>
>> > > Subject: [PATCH] drm/xe: Decrement client count immediately on file
>> > > close
>> > >
>> > > Decrement the client count immediately on file close. It is not
>> > > required to be deferred to the resource cleanup function. Otherwise
>> > > there will be a small time window, where there will be a non-zero
>> > > client count even after closing all open file handles.
>> > > This affects ccs_mode(xe_compute) igt tests as these tests try to
>> > > change the ccs_mode immediately after closing all file handles, but
>> > > the driver rejects the ccs_mode change request as it sees a non-zero client
>> count.
>> > >
>> > > Fixes: ce8c161cbad4 ("drm/xe: Add ref counting for xe_file")
>> > > Signed-off-by: Balasubramani Vivekanandan
>> > > <balasubramani.vivekanandan@intel.com>
>> > > ---
>> > >  drivers/gpu/drm/xe/xe_device.c | 9 ++++-----
>> > >  1 file changed, 4 insertions(+), 5 deletions(-)
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/xe_device.c
>> > > b/drivers/gpu/drm/xe/xe_device.c index 4d3c794f134c..3bccea6212ff
>> > > 100644
>> > > --- a/drivers/gpu/drm/xe/xe_device.c
>> > > +++ b/drivers/gpu/drm/xe/xe_device.c
>> > > @@ -107,17 +107,12 @@ static int xe_file_open(struct drm_device
>> > > *dev, struct drm_file *file)  static void xe_file_destroy(struct kref *ref)  {
>> > >  	struct xe_file *xef = container_of(ref, struct xe_file, refcount);
>> > > -	struct xe_device *xe = xef->xe;
>> > >
>> > >  	xa_destroy(&xef->exec_queue.xa);
>> > >  	mutex_destroy(&xef->exec_queue.lock);
>> > >  	xa_destroy(&xef->vm.xa);
>> > >  	mutex_destroy(&xef->vm.lock);
>> > >
>> > > -	spin_lock(&xe->clients.lock);
>> > > -	xe->clients.count--;
>> > > -	spin_unlock(&xe->clients.lock);
>> > > -
>> > >  	xe_drm_client_put(xef->client);
>> > >  	kfree(xef->process_name);
>> > >  	kfree(xef);
>> > > @@ -178,6 +173,10 @@ static void xe_file_close(struct drm_device
>> > > *dev, struct drm_file *file)
>> > >
>> > >  	xe_file_put(xef);
>> > >
>> > > +	spin_lock(&xe->clients.lock);
>> > > +	xe->clients.count--;
>> > > +	spin_unlock(&xe->clients.lock);
>> >
>> > The file_close here is sychronus and serialized call with respect to
>> userspace. Any settings done through sysfs post file_close should not required
>> this change as far as I know. Would please explain scenario better?
>>
>> In the current code, the client count is decremented in the function
>> xe_file_destroy which is not invoked synchronously from xe_file_close.
>> It is called when all references to xe_file are lost.
>> References to xe_file are held during creation of vm and exec_queues. So the
>> somebody might still be holding reference to xe_file while xe_file_close is
>> called. Therefore the invocation of xe_file_destroy might be deferred.
>> As of result, driver might see a non-zero client count even after all file handles
>> are actually closed which is incorrect. We can defer only the freeing of
>> resources to xe_file_destroy but the client count can be immediately adjusted
>> in xe_file_close.
>
>If whoever has hold ref, might still use ccs, why would we allow changing ccs mode in that case!

if the file is closed, there wouldn't be any submission at all. ref is
kept alive for the data to be available for updates on the sw side only.

but I'm wondering on the value of this client tracking... this is so
uncommon that we maybe should rely just on the list of open files being
empty?

Lucas De Marchi

>
>Tejas
>>
>> Regards,
>> Bala
>> >
>> > Tejas
>> > > +
>> > >  	xe_pm_runtime_put(xe);
>> > >  }
>> > >
>> > > --
>> > > 2.34.1
>> >
