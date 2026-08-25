Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B21C61DB9
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 21:52:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56D810E1C1;
	Tue, 25 Aug 2026 21:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YZwyftaD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F1D510E1C1
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 21:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787694741; x=1819230741;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GhAcCkedLvEIfEacCkGai2F9tOFpGBOi1RllVk6+b/s=;
 b=YZwyftaD7rNagYk0sjySvSPtNPPgFEtKpcN8FKJOTBYF5uh/9kPUrr+N
 SfFkP+hLs0rzJzAwgN6YOHIlggUp+oNQVgTauaEdYrJ/Fak/1nqs3CfUx
 edq5CaCDneQd4UUiBS/AQC6UztALjejM4VxjxCpZvRGuU4eOoSGT0ekdg
 q0cIXXfZ9/mq8mih8QWYJIg5VJi1LRVPiTsAbmK82/kDFIsuiBICi6wxm
 c7ArwXxMNaw71Q3rMDtuEzjBAn7eRVycihbuQAklZ6cghq+qDKYz0HGMt
 FDIIq8eYcUiQKUb0xmF5KP7gg9fm2fPe+KDFLns1UihT2rO7nBX2e2orq A==;
X-CSE-ConnectionGUID: TaAcQydkQdGfjO+LH/fcvQ==
X-CSE-MsgGUID: UrW5Z8XXSmGbmJWT43AuYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="99329690"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="99329690"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 14:52:21 -0700
X-CSE-ConnectionGUID: oTlfHClIRrKCV12+e9HidA==
X-CSE-MsgGUID: ebe9NACuSaKsU07TmjE/BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="266820315"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 14:52:20 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 14:52:19 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 25 Aug 2026 14:52:19 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.64) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 14:52:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aVvnS5lN+847TQxxR3Iukskc8GH1GH2S3LOJuTDffDD7uG4b3B6nrNsiKIZxSUGS8e+Spe6RWHpjF8Iaz3R72gkcr8HL7IHKwxsvW8mZWpdRdSL4NY4Hl4O6dH5Knqv0A9A4n42SRbFVenpfFfFPc8VxgSOfpquy0y/Yuc8nheDDlsjskzs3bSoL887++T1tmSysUSSEhheZZcHP7JacQ9WtJxacH/hnJz0QEI8Nrl368WdLzMbhV6zsRWHC2aN7p07+KRkAcu9j/RODrufW2PEbtffS/N1NnImzM24eUa2zhQz2MtKkqeW+AQDsjrpSQeZC4mZ9qH/xG6oCtlir7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvt1WEr2Qeh62fEAAxfPpS1jN2hEmBWqhZY0lZsHScY=;
 b=COq4b+828JiK2ax3gtgmSLWxl8G2WTkBLGBYjHV7Vw+ZXOTFQ66OjhFltKfAq51FR58iGdrMmL0Y0THCmJxb1EkWBrykwUNOPVLt1G1fGD4sdHtIBb0MxDVKnsQU1DEhPPS3/plBvJpEZ7noPZMHkWt2D0oa5zgTCsEFnySTS0btOOhs9pbwGHpvFEFjlrcj6FwdJKI5oi2nhTuWj7bVk8EkxI9PMC1wXP3XrVmlU0RdQF2ysog/HP+5ZJYGA1abmw/91ZNgvCpBKnVY2K/lj6okDWXPMwNe0D2u6so1R7IMmeZJAl1Mwm8uhS0gAbrqaTYXwEb4dQC4nXK1vDYnsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20)
 by SJ2PR11MB8471.namprd11.prod.outlook.com (2603:10b6:a03:578::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 21:52:06 +0000
Received: from IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce]) by IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce%7]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 21:52:05 +0000
Date: Tue, 25 Aug 2026 17:51:59 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: "Anoop, Vijay" <anoop.c.vijay@intel.com>,
 <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <aravind.iddamsetty@intel.com>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>, <matthew.d.roper@intel.com>,
 <michael.j.ruhl@intel.com>, <paul.e.luse@intel.com>,
 <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe/sysctrl: Add fwctl support for System
 Controller
Message-ID: <ao4Of-awq9ylNiVB@intel.com>
References: <20260806120310.2054212-4-anoop.c.vijay@intel.com>
 <20260806120310.2054212-6-anoop.c.vijay@intel.com>
 <ano+fWaDSW1hOLIG@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ano+fWaDSW1hOLIG@soc-5CG1426VCC.clients.intel.com>
X-ClientProxiedBy: BY1P220CA0021.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::16) To IA0PR11MB7752.namprd11.prod.outlook.com
 (2603:10b6:208:442::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7752:EE_|SJ2PR11MB8471:EE_
X-MS-Office365-Filtering-Correlation-Id: d873418f-62c8-4df7-9a99-08df02f31a71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|56012099006|10067099003|6133799003|3023799007|5023799004|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: JZ0Czdo4osgjWSdAi30Hob0dQ9FU/ch7U5qR/bghm6x+e5i+jGISbkRgSZ70i2MaJbIsGQAFi4d8trymyVtMOIMgvJxSOPCfqlm+ZrqJIzI/74CxxBjRaaOJ0wKYmWN9/cmaFbfwXUg5KnFNAEtIEoOMhO09YV9rVUcZvSildLT2oXPxKktvBMH27+WvccTCNn8EHX7V4tvjWeGNBv6MrRJdNdFIfRI42uDznUXjLylDfbAY4kCVqhG6mw6nuDtzfBmAIjSvJbaImwVUjjWozxlUD8tk54oLG+hW9fUDAYjB/nRBPPiy8Pi5mHJ6jRrRo8qTWeaMyUMn8vD2ui8eMTmYuMnR4CudWzcA4zbUvJqvaeaywM3yWzuKesPOJcoMC7ejGhV/GCFZ7Y4MyoAaU6QqXZVDrVAwByYmK2Usq8yEYnWAC4Jsq62mCMySa7oZA051mRmjPBBCJo3ITuq52jNdH4dpDOBezPjyYi6B+YgMlkgeBqvGaHX5eIt8KjHfLYc5ahbLLZo5IMqBJyoTsOWV9wXNpZImUonFElGTpjphqbXqSzOdmw7XmgZYZ5bDOu58kQIJRfA//X7+7yAIHjh1L6sRok9zbh10ZOGQOGJFf7cGFuTDXZLgR0MCfRml
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7752.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(56012099006)(10067099003)(6133799003)(3023799007)(5023799004)(22082099003)(18002099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vUmD9ww9m/AjdPadRplMcLC4557Qg4bOTMyRaHERxlc6fH40LNynufTuv3?=
 =?iso-8859-1?Q?vBjihh30N/yEiuOF0kd/9Zlegrl4U/CNVzn5vqHldBtRwENGuZSQRGqZ48?=
 =?iso-8859-1?Q?rK68yniLMELrhCkWkhXVjzl44j3SWX2q9gclue1OUGpIEuLwA8gdACpQ/4?=
 =?iso-8859-1?Q?FQPzEk0GyrMEmLbyyhOJQmEM56wWKObvaugYNSeJ0Ws3G32G0IYqBr9emD?=
 =?iso-8859-1?Q?UcZI4CBDTp1ltsAZlJQLHUMDS0rSQC1FiXR/l5zSg6Z+fVMH/nVkPc7oG4?=
 =?iso-8859-1?Q?8mrkMZ2VOlLM0uv9YUryhqdAJi9ZK5wyu9RJgwURBiVlPiMJTjO+fpvGB4?=
 =?iso-8859-1?Q?DXUWsd1A++TOBSF4mecjbjSkCDrp5l2Pq9lre8+rHpJlvpE0KkyW31ZJzW?=
 =?iso-8859-1?Q?S7cAVSAh7y1HLFCvD2qiDoVuFizYe25M2HdWwo3RPa8mtZioQzNyiFDYIc?=
 =?iso-8859-1?Q?IYz5hvfnQA1w8KauTPhhmf9n39/BOrLZe5fe6AwMGhlBHQBEElujuKM3gB?=
 =?iso-8859-1?Q?EalJeNBlukrggjclcOoEbki5IejZldTK8CxvW4H7+ncq0scWELg+4CEsre?=
 =?iso-8859-1?Q?MnOkS2tTZZbxudzTHQY+7sjEq/xYesSaMy0+iIw0pnvVLmY0E0yzZ0FNYR?=
 =?iso-8859-1?Q?/S/299IekQV4+gIpCOCxvVkQPfND0WltBEj5vov6Ayfdhkn/BbA+M68ZJX?=
 =?iso-8859-1?Q?D3bFa/eYdNrWX5dRyLbkyttEG08O/EYGThs6lqPAqN/vzf1QCBEKvU5b22?=
 =?iso-8859-1?Q?/FSFmIWcgL52PHq7RBYWaXTztpBYRKAjaucpFZpsO/9pK5C938s9/TgqFT?=
 =?iso-8859-1?Q?Hz863UwiALbYPF0xSoNRqF5oe6oR356MwDd6GO5INLGTrvUhqpc90Wmg7X?=
 =?iso-8859-1?Q?w7QmMyv8WgdsJPrsLPR2spNmmECV/jIMWiIU8XJ4lo0RkL0D/RpuJpIP4o?=
 =?iso-8859-1?Q?svJvJ45IsXuWfILhHLzJ8oVqoXPAEuxFF5zbd+Kxfgd5xiYHlaiDeGg3A/?=
 =?iso-8859-1?Q?KzJv+AFjzuFatrAleD6Ug8OBn3IlseCGsyqlQ4YiXgbcmAtPcU1kY30FQF?=
 =?iso-8859-1?Q?WnXm+xtvYQFlsxhmnzC2/YbD3XJO35dnqD8nTCYbhqWbjB3qKDbFGrcB1r?=
 =?iso-8859-1?Q?jm+0RmVg6Us0JW2lEOdq8eAfrmNtLg+cXhv70U7ktaNF2fwGUf9cXcvRNd?=
 =?iso-8859-1?Q?2qbOISYN1cS4izMY0GtP0bXJ/KtdKVFU/n7tK25US3UkPoiWTinlDlB6lL?=
 =?iso-8859-1?Q?7vH355XIE+N2dAZFg3vf1q5+DJ78y//Lf8Mvt0xYodxtHVfBmL/rkFGCR5?=
 =?iso-8859-1?Q?R0M2EJ3JJrBsC8tkrjJinRB21Ited4m0G6rNneOsR83zM2hwMa8qOjMuEc?=
 =?iso-8859-1?Q?r8+jUOQjIwP8IO6D+aX1ikciFTHeuTNW2qRAPwvnGnVEa5hs0SLDtOfEmP?=
 =?iso-8859-1?Q?bLe0myCJDsjduXLwnQy0OOcwnJ7q2pA3TkYUHfFRHH55FxEgCQdo9bLDuT?=
 =?iso-8859-1?Q?W6QDZxQLxrOfxWT7DJ0GV+wjBfJ3C2qzXXbnRMFMKmM0eHs5auuK00AsyF?=
 =?iso-8859-1?Q?Kv/1xDL5BiG4pzISd2C3PkydAFKtPepRukxNVrw0o4U77lbSgs1C/gs5ym?=
 =?iso-8859-1?Q?Hrdt7WQ88e6Ebt1WTmUujf2xEHo3YEAwcBTZdEtn0yyFzZeXiXFr3j1mm0?=
 =?iso-8859-1?Q?OhnBOJqHB3j1qtW4aG2sPqu42EUM2Yiy5sJ1mqQhSo60tvKeT3QO9U4eJR?=
 =?iso-8859-1?Q?ywz4eVH81NTQgmzKYT48giHYsD5xamJy2XJwEzdCYB0DTlo1Tuv2ZPLm6+?=
 =?iso-8859-1?Q?x82PpNONuw=3D=3D?=
X-Exchange-RoutingPolicyChecked: LxTbtmcHDfg/sTiJM223y1H+vRLYSWFj1uyG1grydqEh8bPRZ4zkojcnvuO3w0Mi9UTDsliv8My05DYFi8jqwMdHoESOlBx7wRM5KyNk+xjig2TQXXMrfdGtBAWDUTmPCMSBjBEbdCGbxGe9cm8UAezst32ivTmeuSpezpscsYy1wZCLpkHcbu/jx+cElvkNbANiTItgxwrn863OLHLGSgKBL7e7YHac/dns+9oVzEn/c6DK2ChbjmSXvZhzSbn0Ws1JaRNN/NliKhKWFK6b/2M0lE+/dddNIw3Pndt4hTK8g+Ye9LHcJcynIpEW9tt8Kck0Surk0ZrVhyX+1ZhhIA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d873418f-62c8-4df7-9a99-08df02f31a71
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7752.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 21:52:05.7142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hDdLeZZs0reroqwpcoqGkuEHaqF75QVkqbmNAmIe+wFqJNqGGvJ7z3CA+9OrZ92Rvh/QkDN3HFvYVpi0ywK27w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8471
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

On Mon, Aug 10, 2026 at 02:11:25PM -0700, Umesh Nerlige Ramappa wrote:
> On Thu, Aug 06, 2026 at 05:03:12AM -0700, Anoop, Vijay wrote:
> > From: Anoop Vijay <anoop.c.vijay@intel.com>
> > 
> > Add fwctl support for Xe System Controller (sysctrl), a
> > firmware-managed entity that provides platform-level control and
> > coordination on Intel Xe3p discrete GPUs.
> > 
> > Register a XE_SYSCTRL device to allow userspace to query sysctrl
> > capabilities and issue RPCs through /dev/fwctl/fwctlN. Initial
> > RPCs support ECC status queries and RAS error injection.
> > 
> > Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> > ---
> > v2: (Rodrigo)
> > - Rename FWCTL_DEVICE_TYPE_XE to FWCTL_DEVICE_TYPE_XE_SYSCTRL, one type
> >  per firmware instead of a shared Xe-wide type
> > - Rename xe.h to xe_sysctrl.h to match
> > - Squash uapi and type definitions into a single patch
> > - Replace validate_scope() with explicit per-op scope/capability checks
> >  in xe_sysctrl_fwctl_rpc()
> > ---
> > Documentation/userspace-api/fwctl/index.rst   |   1 +
> > .../userspace-api/fwctl/xe_sysctrl.rst        | 120 +++++++++
> > drivers/gpu/drm/xe/Kconfig                    |   1 +
> > drivers/gpu/drm/xe/Makefile                   |   1 +
> > drivers/gpu/drm/xe/xe_device.c                |   5 +
> > drivers/gpu/drm/xe/xe_sysctrl_fwctl.c         | 251 ++++++++++++++++++
> > drivers/gpu/drm/xe/xe_sysctrl_fwctl.h         |  13 +
> > drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  86 ++++++
> > include/uapi/fwctl/fwctl.h                    |   1 +

On your next version, please Cc the right addresses:

$ ./scripts/get_maintainer.pl include/uapi/fwctl/
Dave Jiang <dave.jiang@intel.com> (maintainer:FWCTL SUBSYSTEM)
Jason Gunthorpe <jgg@ziepe.ca> (maintainer:FWCTL SUBSYSTEM)
Saeed Mahameed <saeedm@nvidia.com> (maintainer:FWCTL SUBSYSTEM)
Jonathan Cameron <jic23@kernel.org> (reviewer:FWCTL SUBSYSTEM)


> > include/uapi/fwctl/xe_sysctrl.h               | 117 ++++++++

To make our future life easier we might ask them to get the maintainership
of our files:

diff --git a/MAINTAINERS b/MAINTAINERS
index 928b3ba23a76..0b912f4b986e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13016,6 +13016,8 @@ C:      irc://irc.oftc.net/xe
 T:     git https://gitlab.freedesktop.org/drm/xe/kernel.git
 F:     Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
 F:     Documentation/gpu/xe/
+F:     Documentation/userspace-api/fwctl/xe_*
+F:     include/uapi/fwctl/xe_*
 F:     drivers/gpu/drm/xe/
 F:     include/drm/intel/
 F:     include/uapi/drm/xe_drm.h


> > 10 files changed, 596 insertions(+)
> > create mode 100644 Documentation/userspace-api/fwctl/xe_sysctrl.rst
> > create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_fwctl.c
> > create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_fwctl.h
> > create mode 100644 include/uapi/fwctl/xe_sysctrl.h
> > 
> > diff --git a/Documentation/userspace-api/fwctl/index.rst b/Documentation/userspace-api/fwctl/index.rst
> > index 8062f7629654..f6fca11e6aac 100644
> > --- a/Documentation/userspace-api/fwctl/index.rst
> > +++ b/Documentation/userspace-api/fwctl/index.rst
> > @@ -13,3 +13,4 @@ to securely construct and execute RPCs inside device firmware.
> >    bnxt_fwctl
> >    fwctl-cxl
> >    pds_fwctl
> > +   xe_sysctrl
> > diff --git a/Documentation/userspace-api/fwctl/xe_sysctrl.rst b/Documentation/userspace-api/fwctl/xe_sysctrl.rst
> > new file mode 100644
> > index 000000000000..6dfc9e70b683
> > --- /dev/null
> > +++ b/Documentation/userspace-api/fwctl/xe_sysctrl.rst
> > @@ -0,0 +1,120 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +=======================
> > +fwctl xe_sysctrl driver
> > +=======================
> > +
> > +:Author: Intel Corporation
> > +
> > +Overview
> > +========
> > +
> > +The Xe System Controller (sysctrl) firmware exposes a fwctl service that
> > +the xe driver registers as a ``FWCTL_DEVICE_TYPE_XE_SYSCTRL`` device.
> > +Userspace opens the resulting ``/dev/fwctl/fwctlN`` node to query ECC
> > +status and RAS error injection capabilities and to issue RAS error
> > +injection requests to the sysctrl firmware.
> > +
> > +xe_sysctrl User API
> > +====================
> > +
> > +.. kernel-doc:: include/uapi/fwctl/xe_sysctrl.h
> > +
> > +1. Driver info query
> > +---------------------
> > +
> > +The application issues ``FWCTL_INFO`` to retrieve a
> > +``struct fwctl_info_xe_sysctrl`` and inspect ``uctx_caps`` to determine
> > +which of the ``FWCTL_XE_SYSCTRL_CAP_*`` capabilities are available on this
> > +platform and in this security context.
> > +
> > +2. Send RPC requests
> > +---------------------
> > +
> > +Each RPC uses a single ``struct fwctl_rpc_xe_sysctrl`` as both the
> > +``FWCTL_RPC`` ``in`` and ``out`` buffer; the driver fills in ``data`` in
> > +place. ``op`` selects one of the ``enum fwctl_xe_sysctrl_op`` operations.
> > +The kernel rejects the request if the scope of the ``FWCTL_RPC`` call is
> > +lower than the minimum required by the requested ``op``, as documented above.
> > +
> > +Code example of querying ECC status
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +.. code-block:: c
> > +
> > +        static int xe_sysctrl_get_ecc(int fd, __u32 *supported, __u32 *enabled)
> > +        {
> > +                struct fwctl_rpc_xe_sysctrl sysctrl_rpc = {
> > +                        .op = FWCTL_XE_SYSCTRL_OP_ECC_STATUS_GET,
> > +                };
> > +                struct fwctl_rpc rpc = {
> > +                        .size = sizeof(rpc),
> > +                        .scope = FWCTL_RPC_CONFIGURATION,
> > +                        .in_len = sizeof(sysctrl_rpc),
> > +                        .out_len = sizeof(sysctrl_rpc),
> > +                        .in = (__aligned_u64)&sysctrl_rpc,
> > +                        .out = (__aligned_u64)&sysctrl_rpc,
> > +                };
> > +                int ret;
> > +
> > +                ret = ioctl(fd, FWCTL_RPC, &rpc);
> > +                if (ret)
> > +                        return ret;
> > +
> > +                *supported = sysctrl_rpc.data[0];
> > +                *enabled = sysctrl_rpc.data[1];
> > +                return 0;
> > +        }
> > +
> > +Code example of querying RAS injection capabilities and injecting an error
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +.. code-block:: c
> > +
> > +        static int xe_sysctrl_get_ras_caps(int fd, __u32 *capability_mask, __u32 *flags)
> > +        {
> > +                struct fwctl_rpc_xe_sysctrl sysctrl_rpc = {
> > +                        .op = FWCTL_XE_SYSCTRL_OP_RAS_GET_CAPS,
> > +                };
> > +                struct fwctl_rpc rpc = {
> > +                        .size = sizeof(rpc),
> > +                        .scope = FWCTL_RPC_CONFIGURATION,
> > +                        .in_len = sizeof(sysctrl_rpc),
> > +                        .out_len = sizeof(sysctrl_rpc),
> > +                        .in = (__aligned_u64)&sysctrl_rpc,
> > +                        .out = (__aligned_u64)&sysctrl_rpc,
> > +                };
> > +                int ret;
> > +
> > +                ret = ioctl(fd, FWCTL_RPC, &rpc);
> > +                if (ret)
> > +                        return ret;
> > +
> > +                *capability_mask = sysctrl_rpc.data[0];
> > +                *flags = sysctrl_rpc.data[1];
> > +                return 0;
> > +        }
> > +
> > +        static int xe_sysctrl_ras_inject(int fd, __u32 error_inj)
> > +        {
> > +                struct fwctl_rpc_xe_sysctrl sysctrl_rpc = {
> > +                        .op = FWCTL_XE_SYSCTRL_OP_RAS_INJECT,
> > +                        .data[0] = error_inj,
> > +                };
> > +                struct fwctl_rpc rpc = {
> > +                        .size = sizeof(rpc),
> > +                        .scope = FWCTL_RPC_DEBUG_WRITE,
> > +                        .in_len = sizeof(sysctrl_rpc),
> > +                        .out_len = sizeof(sysctrl_rpc),
> > +                        .in = (__aligned_u64)&sysctrl_rpc,
> > +                        .out = (__aligned_u64)&sysctrl_rpc,
> > +                };
> > +
> > +                /*
> > +                 * Callers should confirm error_inj is set in capability_mask,
> > +                 * and that flags allows injection (FWCTL_XE_SYSCTRL_RAS_INJ_ALLOWED),
> > +                 * as returned by xe_sysctrl_get_ras_caps() above, before injecting.
> > +                 */
> > +                return ioctl(fd, FWCTL_RPC, &rpc);
> > +        }
> 
> You could just use one function example that injects an error. Part of that
> implementation would be to query if error injections is available.  That way
> you can just do away with the comment above.
> 
> > +
> > diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> > index 4d7dcaff2b91..a472cb52dded 100644
> > --- a/drivers/gpu/drm/xe/Kconfig
> > +++ b/drivers/gpu/drm/xe/Kconfig
> > @@ -25,6 +25,7 @@ config DRM_XE
> > 	select DRM_MIPI_DSI
> > 	select RELAY
> > 	select IRQ_WORK
> > +	select FWCTL
> > 	# xe depends on ACPI_VIDEO when ACPI is enabled
> > 	# but for select to work, need to select ACPI_VIDEO's dependencies, ick
> > 	select BACKLIGHT_CLASS_DEVICE if ACPI
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 44ed055439d4..6560185c0ca7 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -128,6 +128,7 @@ xe-y += xe_bb.o \
> > 	xe_sync.o \
> > 	xe_sysctrl.o \
> > 	xe_sysctrl_event.o \
> > +	xe_sysctrl_fwctl.o \
> > 	xe_sysctrl_mailbox.o \
> > 	xe_tile.o \
> > 	xe_tile_sysfs.o \
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index d25d02b24898..dc7df793d4b9 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -68,6 +68,7 @@
> > #include "xe_sriov.h"
> > #include "xe_svm.h"
> > #include "xe_sysctrl.h"
> > +#include "xe_sysctrl_fwctl.h"
> > #include "xe_tile.h"
> > #include "xe_ttm_stolen_mgr.h"
> > #include "xe_ttm_sys_mgr.h"
> > @@ -1028,6 +1029,10 @@ int xe_device_probe(struct xe_device *xe)
> > 	if (err)
> > 		return err;
> > 
> > +	err = xe_sysctrl_fwctl_init(xe);
> > +	if (err)
> > +		return err;
> > +
> > 	xe_ras_init(xe);
> > 
> > 	/*
> > diff --git a/drivers/gpu/drm/xe/xe_sysctrl_fwctl.c b/drivers/gpu/drm/xe/xe_sysctrl_fwctl.c
> > new file mode 100644
> > index 000000000000..27a40efa0787
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_sysctrl_fwctl.c
> > @@ -0,0 +1,251 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2026 Intel Corporation
> > + */
> > +
> > +#include <linux/errno.h>
> > +#include <linux/fwctl.h>
> > +#include <linux/slab.h>
> > +
> > +#include <uapi/fwctl/xe_sysctrl.h>
> > +
> > +#include "xe_device.h"
> > +#include "xe_pm.h"
> > +#include "xe_printk.h"
> > +#include "xe_sysctrl.h"
> > +#include "xe_sysctrl_fwctl.h"
> > +#include "xe_sysctrl_mailbox.h"
> > +#include "xe_sysctrl_mailbox_types.h"
> > +
> > +struct xe_sysctrl_fwctl_dev {
> > +	struct fwctl_device fwctl;
> > +	struct xe_device *xe;
> > +};
> > +
> > +DEFINE_FREE(xe_sysctrl_fwctl, struct xe_sysctrl_fwctl_dev *, if (_T) fwctl_put(&_T->fwctl))
> > +
> > +struct xe_sysctrl_fwctl_uctx {
> > +	struct fwctl_uctx uctx;
> > +	u32 uctx_caps;
> > +};
> > +
> > +static int xe_sysctrl_fwctl_uctx_open(struct fwctl_uctx *uctx)
> > +{
> > +	struct xe_sysctrl_fwctl_dev *fwctl_dev =
> > +		container_of(uctx->fwctl, struct xe_sysctrl_fwctl_dev, fwctl);
> > +	struct xe_sysctrl_fwctl_uctx *sc_uctx =
> > +		container_of(uctx, struct xe_sysctrl_fwctl_uctx, uctx);
> > +	struct xe_device *xe = fwctl_dev->xe;
> > +
> > +	xe_pm_runtime_get(xe);
> > +
> > +	sc_uctx->uctx_caps = FWCTL_XE_SYSCTRL_CAP_ECC;
> > +	if (xe_sysctrl_is_diag_fw_ready(xe))
> > +		sc_uctx->uctx_caps |= FWCTL_XE_SYSCTRL_CAP_RAS_ERROR_INJECT;
> > +
> > +	return 0;
> > +}
> > +
> > +static void xe_sysctrl_fwctl_uctx_close(struct fwctl_uctx *uctx)
> > +{
> > +	struct xe_sysctrl_fwctl_dev *fwctl_dev =
> > +		container_of(uctx->fwctl, struct xe_sysctrl_fwctl_dev, fwctl);
> > +
> > +	xe_pm_runtime_put(fwctl_dev->xe);
> > +}
> > +
> > +static void *xe_sysctrl_fwctl_info(struct fwctl_uctx *uctx, size_t *length)
> > +{
> > +	struct xe_sysctrl_fwctl_uctx *sc_uctx =
> > +		container_of(uctx, struct xe_sysctrl_fwctl_uctx, uctx);
> > +	struct fwctl_info_xe_sysctrl *info;
> > +
> > +	info = kzalloc_obj(*info);
> > +	if (!info)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	info->uctx_caps = sc_uctx->uctx_caps;
> > +
> > +	*length = sizeof(*info);
> > +	return info;
> > +}
> > +
> > +static int sysctrl_rpc_ecc_status_get(struct xe_device *xe,
> > +				      struct fwctl_rpc_xe_sysctrl *rpc)
> > +{
> > +	struct xe_sysctrl_feature_cap_resp resp = {};
> > +	struct xe_sysctrl_mailbox_command cmd = {0};
> > +	size_t out_len = 0;
> > +	int ret;
> > +
> > +	xe_sysctrl_create_command(&cmd, XE_SYSCTRL_GROUP_GFSP_RUNTIME,
> > +				  XE_SYSCTRL_CMD_GET_FEATURE_CAPABILITY_STATE_INFO,
> > +				  NULL, 0, &resp, sizeof(resp));
> > +
> > +	ret = xe_sysctrl_send_command(&xe->sc, &cmd, &out_len);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (out_len < 2 * sizeof(u32)) {
> > +		xe_err(xe, "sysctrl fwctl: ECC status response too short (%zu B)\n",
> > +		       out_len);
> > +		return -EIO;
> > +	}
> > +
> > +	rpc->data[0] = resp.supported_features & XE_SYSCTRL_FEATURE_ECC ? 1 : 0;
> > +	rpc->data[1] = resp.enabled_features & XE_SYSCTRL_FEATURE_ECC ? 1 : 0;
> > +	return 0;
> > +}
> > +
> > +static int sysctrl_rpc_ras_get_caps(struct xe_device *xe,
> > +				    struct fwctl_rpc_xe_sysctrl *rpc)
> > +{
> > +	struct xe_sysctrl_ras_err_inj_cap_resp resp = {};
> > +	struct xe_sysctrl_mailbox_command cmd = {0};
> > +	size_t out_len = 0;
> > +	int ret;
> > +
> > +	xe_sysctrl_create_command(&cmd, XE_SYSCTRL_GROUP_DIAG,
> > +				  XE_SYSCTRL_CMD_RAS_ERR_INJ_CAPABILITY,
> > +				  NULL, 0, &resp, sizeof(resp));
> > +
> > +	ret = xe_sysctrl_send_command(&xe->sc, &cmd, &out_len);
> > +	if (ret)
> > +		return ret;
> 
> Not checking for short reponse here like in the ECC function above?
> 
> > +
> > +	rpc->data[0] = resp.capability_mask;
> > +	rpc->data[1] = resp.flags;
> > +	return 0;
> > +}
> > +
> > +static int sysctrl_rpc_ras_inject(struct xe_device *xe,
> > +				  struct fwctl_rpc_xe_sysctrl *rpc)
> > +{
> > +	struct xe_sysctrl_ras_err_inj_req req = {
> > +		.error_inj	   = rpc->data[0],
> > +		.additional_params = rpc->data[1],
> > +	};
> > +	struct xe_sysctrl_mailbox_command cmd = {0};
> > +	size_t out_len = 0;
> > +
> 
> We should check if the type of inject is supported. It may mean that we
> cache the err injection capabilities early on (during init). Is that
> possible?

it is already checking on the rpc function below, no?!

> 
> > +	xe_sysctrl_create_command(&cmd, XE_SYSCTRL_GROUP_DIAG,
> > +				  XE_SYSCTRL_CMD_RAS_ERR_INJECT,
> > +				  &req, sizeof(req), NULL, 0);
> > +
> > +	return xe_sysctrl_send_command(&xe->sc, &cmd, &out_len);
> > +}
> > +
> > +static void *xe_sysctrl_fwctl_rpc(struct fwctl_uctx *uctx,
> > +				  enum fwctl_rpc_scope scope,
> > +				  void *rpc_in, size_t in_len,
> > +				  size_t *out_len)
> > +{
> > +	struct xe_sysctrl_fwctl_dev *fwctl_dev =
> > +		container_of(uctx->fwctl, struct xe_sysctrl_fwctl_dev, fwctl);
> > +	struct xe_sysctrl_fwctl_uctx *sc_uctx =
> > +		container_of(uctx, struct xe_sysctrl_fwctl_uctx, uctx);
> > +	struct xe_device *xe = fwctl_dev->xe;
> > +	struct fwctl_rpc_xe_sysctrl *rpc;
> > +	int ret;
> > +
> > +	if (in_len != sizeof(*rpc) || *out_len < sizeof(*rpc))
> > +		return ERR_PTR(-EMSGSIZE);
> > +
> > +	rpc = rpc_in;
> > +
> > +	if (rpc->flags)
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	switch (rpc->op) {
> > +	case FWCTL_XE_SYSCTRL_OP_ECC_STATUS_GET:
> > +		if (!(sc_uctx->uctx_caps & FWCTL_XE_SYSCTRL_CAP_ECC))
> > +			return ERR_PTR(-EPERM);
> 
> 
> EPERM doesn't look correct here. i.e. if the caller were an ADMIN, would
> this work?
> 
> If the caller is trying an RPC that is not available, then this should be
> EINVAL. Same for the below cases.

right, I believe here EINVAL is the best.
But if we need to check for FW permissions given out-of-band even to
admins, then we we need some check on the command result on the injection
function above and then in that case return the -EPERM;

> 
> 
> > +		if (scope < FWCTL_RPC_CONFIGURATION)
> > +			return ERR_PTR(-EBADMSG);
> > +		ret = sysctrl_rpc_ecc_status_get(xe, rpc);
> > +		if (ret)
> > +			return ERR_PTR(ret);
> > +		break;
> > +
> > +	case FWCTL_XE_SYSCTRL_OP_RAS_GET_CAPS:
> > +		if (!(sc_uctx->uctx_caps & FWCTL_XE_SYSCTRL_CAP_RAS_ERROR_INJECT))
> > +			return ERR_PTR(-EPERM);
> > +		if (scope < FWCTL_RPC_CONFIGURATION)
> > +			return ERR_PTR(-EBADMSG);
> > +		ret = sysctrl_rpc_ras_get_caps(xe, rpc);
> > +		if (ret)
> > +			return ERR_PTR(ret);
> > +		break;
> 
> Do these capabilities change at runtime? If not, why not just cache them
> after first read?

if I remember correctly this is a mandatory thing in FWCTL.. to ensure we
only send valid bits.

> 
> > +
> > +	case FWCTL_XE_SYSCTRL_OP_RAS_INJECT:
> > +		if (!(sc_uctx->uctx_caps & FWCTL_XE_SYSCTRL_CAP_RAS_ERROR_INJECT))
> > +			return ERR_PTR(-EPERM);
> > +		if (scope < FWCTL_RPC_DEBUG_WRITE)
> > +			return ERR_PTR(-EBADMSG);
> > +		ret = sysctrl_rpc_ras_inject(xe, rpc);
> > +		if (ret)
> > +			return ERR_PTR(ret);
> > +		break;
> > +
> > +	default:
> > +		return ERR_PTR(-EBADMSG);
> > +	}
> > +
> > +	*out_len = sizeof(*rpc);
> > +	return rpc_in;
> > +}
> > +
> > +static const struct fwctl_ops xe_sysctrl_fwctl_ops = {
> > +	.device_type = FWCTL_DEVICE_TYPE_XE_SYSCTRL,
> > +	.uctx_size = sizeof(struct xe_sysctrl_fwctl_uctx),
> > +	.open_uctx = xe_sysctrl_fwctl_uctx_open,
> > +	.close_uctx = xe_sysctrl_fwctl_uctx_close,
> > +	.info = xe_sysctrl_fwctl_info,
> > +	.fw_rpc = xe_sysctrl_fwctl_rpc,
> > +};
> > +
> > +static void xe_sysctrl_fwctl_fini(void *arg)
> > +{
> > +	struct fwctl_device *fwctl = arg;
> > +
> > +	fwctl_unregister(fwctl);
> > +	fwctl_put(fwctl);
> > +}
> > +
> > +/**
> > + * xe_sysctrl_fwctl_init() - Initialize fwctl interface for System Controller
> > + * @xe: xe device instance
> > + *
> > + * Registers a fwctl device that exposes System Controller debug and
> > + * diagnostic functionality to userspace, on platforms where System
> > + * Controller is supported.
> > + *
> > + * Return: 0 on success, error code on failure
> > + */
> > +int xe_sysctrl_fwctl_init(struct xe_device *xe)
> > +{
> > +	struct xe_sysctrl_fwctl_dev *fwctl_dev __free(xe_sysctrl_fwctl) =
> > +		fwctl_alloc_device(xe->drm.dev, &xe_sysctrl_fwctl_ops,
> > +				   struct xe_sysctrl_fwctl_dev, fwctl);
> > +	int err;
> > +
> > +	if (!xe->info.has_soc_remapper_sysctrl)
> > +		return 0;
> > +
> > +	if (!xe->info.has_sysctrl)
> > +		return 0;
> > +
> > +	if (!fwctl_dev)
> > +		return -ENOMEM;
> > +
> > +	fwctl_dev->xe = xe;
> > +
> > +	err = fwctl_register(&fwctl_dev->fwctl);
> > +	if (err)
> > +		return err;
> > +
> > +	return devm_add_action_or_reset(xe->drm.dev, xe_sysctrl_fwctl_fini,
> > +					&no_free_ptr(fwctl_dev)->fwctl);
> > +}
> > +
> > +MODULE_IMPORT_NS("FWCTL");
> > diff --git a/drivers/gpu/drm/xe/xe_sysctrl_fwctl.h b/drivers/gpu/drm/xe/xe_sysctrl_fwctl.h
> > new file mode 100644
> > index 000000000000..730f31e0d697
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_sysctrl_fwctl.h
> > @@ -0,0 +1,13 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2026 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_SYSCTRL_FWCTL_H_
> > +#define _XE_SYSCTRL_FWCTL_H_
> > +
> > +struct xe_device;
> > +
> > +int xe_sysctrl_fwctl_init(struct xe_device *xe);
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> > index b507e1553cbb..7f39fd1a418a 100644
> > --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> > @@ -14,10 +14,14 @@
> >  * enum xe_sysctrl_group - System Controller command groups
> >  *
> >  * @XE_SYSCTRL_GROUP_GFSP: GFSP group
> > + * @XE_SYSCTRL_GROUP_DIAG: Diag group
> > + * @XE_SYSCTRL_GROUP_GFSP_RUNTIME: GFSP runtime group
> >  * @XE_SYSCTRL_GROUP_CORE: Core group
> >  */
> > enum xe_sysctrl_group {
> > 	XE_SYSCTRL_GROUP_GFSP			= 0x01,
> > +	XE_SYSCTRL_GROUP_DIAG			= 0x02,
> > +	XE_SYSCTRL_GROUP_GFSP_RUNTIME		= 0x31,
> > 	XE_SYSCTRL_GROUP_CORE			= 0xFF,
> > };
> > 
> > @@ -103,6 +107,88 @@ enum xe_sysctrl_app_id {
> > 	XE_SYSCTRL_APP_DIAG	= 0x0D,
> > };
> > 
> > +/**
> > + * enum xe_sysctrl_diag_cmd - Commands supported by DIAG group
> > + *
> > + * @XE_SYSCTRL_CMD_RAS_ERR_INJ_CAPABILITY: Query supported RAS injection types
> > + * @XE_SYSCTRL_CMD_RAS_ERR_INJECT: Inject a RAS error into an IP block
> > + */
> > +enum xe_sysctrl_diag_cmd {
> > +	XE_SYSCTRL_CMD_RAS_ERR_INJ_CAPABILITY	= 0x01,
> > +	XE_SYSCTRL_CMD_RAS_ERR_INJECT		= 0x02,
> > +};
> > +
> > +/**
> > + * struct xe_sysctrl_ras_err_inj_cap_resp - RAS_ERR_INJ_CAPABILITY response payload
> > + *
> > + * Response payload for XE_SYSCTRL_CMD_RAS_ERR_INJ_CAPABILITY.  The mailbox
> > + * layer strips the application message header before writing to this buffer.
> > + *
> > + * @capability_mask: OR of firmware-defined capability values indicating which
> > + *                   injection classes are supported on this platform (see
> > + *                   enum fwctl_xe_sysctrl_ras_inj_cap in
> > + *                   include/uapi/fwctl/xe_sysctrl.h for bit definitions)
> > + * @flags:           Bitmask; bit FWCTL_XE_SYSCTRL_RAS_INJ_ALLOWED (see
> > + *                   include/uapi/fwctl/xe_sysctrl.h) indicates whether RAS
> > + *                   error injection is currently allowed by hardware
> > + *                   security policy.
> > + * @reserved:        Must be zero
> > + */
> > +struct xe_sysctrl_ras_err_inj_cap_resp {
> > +	u32 capability_mask;
> > +	u32 flags;
> > +	u32 reserved[2];
> > +} __packed;
> > +
> > +/**
> > + * struct xe_sysctrl_ras_err_inj_req - RAS_ERR_INJECT request payload
> > + *
> > + * Request payload for XE_SYSCTRL_CMD_RAS_ERR_INJECT.  The mailbox layer
> > + * prepends the application message header before sending.
> > + *
> > + * @error_inj:    One of the enum fwctl_xe_sysctrl_ras_inj_cap bit values
> > + *                (include/uapi/fwctl/xe_sysctrl.h), selecting the class of
> > + *                error to inject.
> > + * @additional_params: Reserved for future use; must be 0 for most injection
> > + *                    types
> > + */
> > +struct xe_sysctrl_ras_err_inj_req {
> > +	u32 error_inj;
> > +	u32 additional_params;
> > +} __packed;
> > +
> > +/**
> > + * enum xe_sysctrl_gfsp_runtime_cmd - Commands for the GFSP runtime group (0x31)
> > + *
> > + * @XE_SYSCTRL_CMD_GET_FEATURE_CAPABILITY_STATE_INFO: Read ECC feature state.
> > + *	No input payload.  Response: struct xe_sysctrl_feature_cap_resp.
> > + */
> > +enum xe_sysctrl_gfsp_runtime_cmd {
> > +	XE_SYSCTRL_CMD_GET_FEATURE_CAPABILITY_STATE_INFO	= 0x10,
> > +};
> > +
> > +/** XE_SYSCTRL_FEATURE_ECC - ECC feature bit in FSP runtime capability bitmasks */
> > +#define XE_SYSCTRL_FEATURE_ECC	BIT(0)
> > +
> > +/**
> > + * struct xe_sysctrl_feature_cap_resp - ECC feature state
> > + *
> > + * Response layout for XE_SYSCTRL_CMD_GET_FEATURE_CAPABILITY_STATE_INFO.
> > + *
> > + * @supported_features: Features supported by the product
> > + * @enabled_features: Features currently enabled
> > + * @configurable_features: Features modifiable by software
> > + * @pending_features: Feature state pending after next reboot
> > + * @default_features: Default feature state from build configuration
> > + */
> > +struct xe_sysctrl_feature_cap_resp {
> > +	u32 supported_features;
> > +	u32 enabled_features;
> > +	u32 configurable_features;
> > +	u32 pending_features;
> > +	u32 default_features;
> > +} __packed;
> > +
> > /**
> >  * struct xe_sysctrl_mailbox_command - System Controller mailbox command
> >  */
> > diff --git a/include/uapi/fwctl/fwctl.h b/include/uapi/fwctl/fwctl.h
> > index 2d6d4049c205..34901d36cd51 100644
> > --- a/include/uapi/fwctl/fwctl.h
> > +++ b/include/uapi/fwctl/fwctl.h
> > @@ -46,6 +46,7 @@ enum fwctl_device_type {
> > 	FWCTL_DEVICE_TYPE_CXL = 2,
> > 	FWCTL_DEVICE_TYPE_BNXT = 3,
> > 	FWCTL_DEVICE_TYPE_PDS = 4,
> > +	FWCTL_DEVICE_TYPE_XE_SYSCTRL = 5,
> > };
> > 
> > /**
> > diff --git a/include/uapi/fwctl/xe_sysctrl.h b/include/uapi/fwctl/xe_sysctrl.h
> > new file mode 100644
> > index 000000000000..a4d117d906e3
> > --- /dev/null
> > +++ b/include/uapi/fwctl/xe_sysctrl.h
> > @@ -0,0 +1,117 @@
> > +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> > +/* Copyright © 2026 Intel Corporation */
> > +#ifndef _UAPI_FWCTL_XE_SYSCTRL_H_
> > +#define _UAPI_FWCTL_XE_SYSCTRL_H_
> > +
> > +#include <linux/bits.h>
> > +#include <linux/types.h>
> > +
> > +/**
> > + * enum fwctl_xe_sysctrl_uctx_caps - capability flags in fwctl_info_xe_sysctrl.uctx_caps
> > + *
> > + * @FWCTL_XE_SYSCTRL_CAP_ECC: ECC status query is supported on this platform
> > + * @FWCTL_XE_SYSCTRL_CAP_RAS_ERROR_INJECT: RAS error injection is supported;
> > + *      requires diag firmware to be loaded and ready
> > + */
> > +enum fwctl_xe_sysctrl_uctx_caps {
> > +	FWCTL_XE_SYSCTRL_CAP_ECC		= (1U << 0),
> > +	FWCTL_XE_SYSCTRL_CAP_RAS_ERROR_INJECT	= (1U << 1),
> 
> BIT(0)
> BIT(1)
> 
> > +};
> > +
> > +/**
> > + * struct fwctl_info_xe_sysctrl - device data returned by FWCTL_INFO
> > + * @uctx_caps: Bitmask of available capabilities (see %fwctl_xe_sysctrl_uctx_caps)
> > + * @rsvd: Reserved, must be zero
> > + */
> > +struct fwctl_info_xe_sysctrl {
> > +	__u32 uctx_caps;
> > +	__u32 rsvd[7];
> > +};
> > +
> > +/**
> > + * enum fwctl_xe_sysctrl_ras_inj_cap - RAS error injection capability bits
> > + *
> > + * Used both in the @capability_mask output of %FWCTL_XE_SYSCTRL_OP_RAS_GET_CAPS
> > + * and as the @error_inj input of %FWCTL_XE_SYSCTRL_OP_RAS_INJECT. Userspace
> > + * must confirm a bit is set in @capability_mask before injecting that class.
> > + *
> > + * @FWCTL_XE_SYSCTRL_RAS_INJ_CAP_COMPUTE_CORR: Compute block correctable error
> > + * @FWCTL_XE_SYSCTRL_RAS_INJ_CAP_COMPUTE_UCORR: Compute block uncorrectable error
> > + * @FWCTL_XE_SYSCTRL_RAS_INJ_CAP_MEMORY_UCORR: Memory subsystem uncorrectable error
> > + * @FWCTL_XE_SYSCTRL_RAS_INJ_CAP_FABRIC_UCORR: Fabric interconnect uncorrectable error
> > + * @FWCTL_XE_SYSCTRL_RAS_INJ_CAP_PCIE_CORR: PCIe subsystem correctable error
> > + * @FWCTL_XE_SYSCTRL_RAS_INJ_CAP_PCIE_UCORR: PCIe subsystem uncorrectable error
> > + * @FWCTL_XE_SYSCTRL_RAS_INJ_CAP_PLATFORM_UCORR: Platform-level uncorrectable error
> > + */
> > +enum fwctl_xe_sysctrl_ras_inj_cap {
> > +	FWCTL_XE_SYSCTRL_RAS_INJ_CAP_COMPUTE_CORR	= 0x0001U,
> > +	FWCTL_XE_SYSCTRL_RAS_INJ_CAP_COMPUTE_UCORR	= 0x0002U,
> > +	FWCTL_XE_SYSCTRL_RAS_INJ_CAP_MEMORY_UCORR	= 0x0004U,
> > +	FWCTL_XE_SYSCTRL_RAS_INJ_CAP_FABRIC_UCORR	= 0x0008U,
> > +	FWCTL_XE_SYSCTRL_RAS_INJ_CAP_PCIE_CORR		= 0x0010U,
> > +	FWCTL_XE_SYSCTRL_RAS_INJ_CAP_PCIE_UCORR		= 0x0020U,
> > +	FWCTL_XE_SYSCTRL_RAS_INJ_CAP_PLATFORM_UCORR	= 0x0040U,
> 
> Same here, why not use BIT?
> 
> Thanks,
> Umesh
> 
> > +};
> > +
> > +/* FWCTL_XE_SYSCTRL_RAS_INJ_ALLOWED - bit in the RAS_GET_CAPS flags field
> > + * indicating RAS error injection is currently allowed by hardware security
> > + * policy.
> > + */
> > +#define FWCTL_XE_SYSCTRL_RAS_INJ_ALLOWED	(1U << 0)
> > +
> > +/**
> > + * enum fwctl_xe_sysctrl_op - RPC operation codes for xe_sysctrl fwctl
> > + *
> > + * @FWCTL_XE_SYSCTRL_OP_ECC_STATUS_GET: Read ECC feature state from GFSP firmware
> > + *	(GFSP runtime group, GET_FEATURE_CAPABILITY_STATE_INFO, BIT(0) = ECC).
> > + *	Requires: %FWCTL_XE_SYSCTRL_CAP_ECC in uctx_caps.
> > + *	Scope: %FWCTL_RPC_CONFIGURATION.
> > + *	in:  op, flags=0, data[0..13] ignored.
> > + *	out: data[0] = 1 if ECC is supported by this product, 0 otherwise.
> > + *	     data[1] = 1 if ECC is currently enabled, 0 otherwise.
> > + *
> > + * @FWCTL_XE_SYSCTRL_OP_RAS_GET_CAPS: Query RAS error injection capability from
> > + *	diag firmware (DIAG group, RAS_ERR_INJ_CAPABILITY command).
> > + *	Requires: %FWCTL_XE_SYSCTRL_CAP_RAS_ERROR_INJECT in uctx_caps.
> > + *	Scope: %FWCTL_RPC_CONFIGURATION.
> > + *	in:  op, flags=0, data[0..13] ignored.
> > + *	out: data[0] = capability_mask, an OR of %fwctl_xe_sysctrl_ras_inj_cap
> > + *	                bits indicating which injection classes are supported,
> > + *	     data[1] = flags; bit %FWCTL_XE_SYSCTRL_RAS_INJ_ALLOWED indicates
> > + *	                whether RAS error injection is currently allowed by
> > + *	                hardware security policy, other bits are reserved for
> > + *	                future use.
> > + *
> > + * @FWCTL_XE_SYSCTRL_OP_RAS_INJECT: Inject a RAS error via diag firmware
> > + *	(DIAG group, RAS_ERR_INJECT command).
> > + *	Requires: %FWCTL_XE_SYSCTRL_CAP_RAS_ERROR_INJECT in uctx_caps.
> > + *	Scope: %FWCTL_RPC_DEBUG_WRITE.
> > + *	in:  data[0] = error_inj, one of the %fwctl_xe_sysctrl_ras_inj_cap
> > + *	                bit values. Userspace must confirm this bit is set in
> > + *	                the capability_mask returned by
> > + *	                %FWCTL_XE_SYSCTRL_OP_RAS_GET_CAPS (and that its flags
> > + *	                field currently allows injection) before issuing this
> > + *	                request; behavior for an unsupported value is
> > + *	                firmware-defined,
> > + *	     data[1] = additional_params (reserved; 0 for most injection types).
> > + *	out: no additional output data (success indicated by ioctl return code).
> > + */
> > +enum fwctl_xe_sysctrl_op {
> > +	FWCTL_XE_SYSCTRL_OP_ECC_STATUS_GET	= 1,
> > +	FWCTL_XE_SYSCTRL_OP_RAS_GET_CAPS	= 2,
> > +	FWCTL_XE_SYSCTRL_OP_RAS_INJECT		= 3,
> > +};
> > +
> > +/**
> > + * struct fwctl_rpc_xe_sysctrl - RPC request/response envelope
> > + * @op: Operation code (see %fwctl_xe_sysctrl_op)
> > + * @flags: Must be 0
> > + * @data: Operation-specific payload (see %fwctl_xe_sysctrl_op for layout)
> > + */
> > +struct fwctl_rpc_xe_sysctrl {
> > +	__u32 op;
> > +	__u32 flags;
> > +	__u32 data[14];
> > +};
> > +
> > +#endif
> > -- 
> > 2.43.0
> > 
