Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EEEFC83F1A
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 03:30:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537FB10E252;
	Fri, 11 Jul 2025 03:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mEL0i8qD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC4010E252
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 03:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752204611; x=1783740611;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LdPsvZ076kiX09j43je99C5VbCF74RnhzecJt0RLb18=;
 b=mEL0i8qDx+5/zj6EUL80kjY7r8WJmom7uvc3ltbUJTy8nkmwbAJbXspV
 KFo4lsbW+zfjItrnSP5M+teJSg+XhJz2VxJOvkXGYvbUWEYyJs8ZtunaH
 +9MDXPxYFQ6Nc4YmriOFperh6uYGJmvGGBa8tM+kTCulrtCLYnmSQLUwj
 npNFaWBt742hJrcJbry3FcPPhuZyfztMpb5+yjZ2Nh8I0x/wGkSJgVOWg
 d48OV3r6folzmJTOuhK3fP8KSuYIM8yjnEOijqVgsTOEBdZ3bXN4XQJz2
 nxgK5Hk6awMeXw5bStWVCHUDe9a7Ool70pF2BbHDhFj16u4Pw6NyHL7Cr A==;
X-CSE-ConnectionGUID: +TX4AtQbRFyM6ctWJkdQMQ==
X-CSE-MsgGUID: LdSfWHJATGa7z3jXxHhdlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54375217"
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; d="scan'208";a="54375217"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 20:30:10 -0700
X-CSE-ConnectionGUID: CeVWLLZAQzGsA2XVEYQayw==
X-CSE-MsgGUID: mVVwskzrRj+4woF+IpgzWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; d="scan'208";a="179959631"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 20:30:09 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 20:30:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 20:30:08 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.76)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 20:30:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gCtzyExTH6BA1IWGHLONKwpijJ0VDrq85Nb2VW5ovxEd856Js+g8YkRpB05fRUb4q5yth34qCv3Nv58vyobuah6/pRx6UqYyZIqER8nvark91ulLUnSefpBTY/vp7MGHoiJ2EXCRmpVJ1XgHbzoTBZsVxHr44bkHWn4YapJcoUhqqUgc5BpqPH7jKy+7/uTrEwUFzHj0ZDemr+yrWTJf6zhJId8q1Y72gEF/KBUWtH6K+4O6HjAp1k7SnS8NIL/PAvBE3lB7sefSqvW1D4F4B7EeRWsXVRLzUI5rvwS4WO7u2ZYdpW0OBP1EyGdJxCBOxnPv5AI7+clTB6DyFuDDEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LdPsvZ076kiX09j43je99C5VbCF74RnhzecJt0RLb18=;
 b=jkCGOyUK74GhcJN3hMeoeJzgXhta0rpHK0NM4X2G3xhMimhMcJianXuLCNdEnepYQQMIhNG8/uNymlHT6gjnsHHh+gGnfnYOyCe6xyJj3lWDZv119oPDWJJObkxkfkvKQ/U5CK7A4MnvV3G83iPXpoechZfPl9/HknZ53RowI1kkrK7DOBsQ9dICEk0CPEzfGHbi2m80leOPIXFiEdPHQ6w7Z5ap7I1cvK0VAeYnMrp2KOR98iNjFx2uRvTKFr1MM8oHEPF+QXYFDBHO/EIhRkdCgXtOvm91+8oyhl07emp/i+JrPMGHc87XlCCAj6iOqDQwrQ1C5rP8Qf8Qtr555w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB7781.namprd11.prod.outlook.com (2603:10b6:8:e1::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.26; Fri, 11 Jul 2025 03:29:50 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8922.023; Fri, 11 Jul 2025
 03:29:50 +0000
Date: Thu, 10 Jul 2025 22:29:48 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH v9 2/8] drm/xe: Pass wa bb setup arguments in a struct
Message-ID: <arv6zzbp56fd6uk2ain5l5apu6ln7gt3jpovjv2khg56sfwwhp@oin5z3g7cwr6>
References: <20250709105455.93902-1-tvrtko.ursulin@igalia.com>
 <20250709105455.93902-3-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250709105455.93902-3-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: BYAPR21CA0024.namprd21.prod.outlook.com
 (2603:10b6:a03:114::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB7781:EE_
X-MS-Office365-Filtering-Correlation-Id: b308245f-68b5-4939-6afb-08ddc02b316b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XSrBeK2r/yXlFXMf4isV608Db+ZXIfyoPGuewZ5ebPSXCdajPnLYHH+Wvjoa?=
 =?us-ascii?Q?93a10mEJ2Ln5b5KmQnYNoRms7R9zCClxRGHnwZcKjZ15ko6//1w8bbuWjFey?=
 =?us-ascii?Q?nD0iFG01N6APfGBiSbIRmt8Q8LT0dULTEtm9aKGaYSntLJEdI+Ec9Ok6lBRY?=
 =?us-ascii?Q?3Rev2dC+1dpgx8jeqEgsmcqETVOj2xRh65i8Fp35FIugJNfqrGBeVlvfYgON?=
 =?us-ascii?Q?bltb5p7dbay71twm+XBqI2WzTnV/D3lDJFJF1fAuRedNN2rGuS6eAQkH/DU2?=
 =?us-ascii?Q?0d2aD8qrLdTe2Kj0+8UXI2Mcus43cBaiTR30AolQUlR28uKhdsIKfhzY/nFi?=
 =?us-ascii?Q?cCL+C/5LFhpIRLPy0lI1iexoYOvfw7pxIjV+wk6eGfgwUmKD6BjMoqbC1voS?=
 =?us-ascii?Q?EsRX9naASsd6VWwiaPKeAZaLeN3DFJABVM9PA0ZvQh4wYCNc38KQ2WxygOyX?=
 =?us-ascii?Q?OFWRcAubku0Y/UANpuNpuF5mSA+Q8QTsXIgtfJtwVJHuHXhcy2A6V1P2gX9a?=
 =?us-ascii?Q?EtmB4zCBzbfiu3rkfZyw/ILiu+t1P7NhMySFP7Lf4tz0fkDoDvd4vXKyPcXA?=
 =?us-ascii?Q?g1oG+DTRCj3DpCt63ff+Yf3mKIAI4B5DcVStER4p87uavgKuWucRUrdOByVc?=
 =?us-ascii?Q?kWQ1kgsruiETU297F8+wwDBkegB9hvDRaLLyD48N4dII2cK/x9nE+/+vfNAx?=
 =?us-ascii?Q?LGMVL9133d0kQ/UYmcoqqTe5LpgGT3sOIt9K9EHp4AHbS0pyBr36zN89y+lq?=
 =?us-ascii?Q?+jVfaVev44jHK22DJcNeKIU7bDNywn/x+Bw1SDdEPspOTkpZy53lH63kTgr4?=
 =?us-ascii?Q?xGNQ2GAVFXhPdyzspv3vc4r5b+nrA9hNfdf6/4nzh+GZse+8xWYbbzJJmcXS?=
 =?us-ascii?Q?EXbCJAyCRENptSBg5QEn3Sm9qRZW/YJThlxvOt9Hy5snXYznanD+fFwyA0ns?=
 =?us-ascii?Q?eQC+nZKCa0OfQKzHIpx/RyW5ErgvUUmLeLqrTtrDM0wmKwBOE2GQQRbIWItO?=
 =?us-ascii?Q?EmuvGNYNVHaLmoBOl4wZ5JTuAAzOnNkztTeT8ORzz6KSosUDG5oaWnnI8YBG?=
 =?us-ascii?Q?qnGczuQc0fbtVPAWjyCUPek0CdPm/+Sp04Y+TA3PCz3/ELcjxLxJv87t8xLK?=
 =?us-ascii?Q?YqRHnSpRMFpJePi8nl49vhge8rQ8msY4rGqDGa5beOjHHA72OCeUNXi+Dczk?=
 =?us-ascii?Q?p/nw1sXT/Rcogpz3gDLcEf+LC2dyDQMduI+1w557Mn+H7nmzasbUWdnHa9LN?=
 =?us-ascii?Q?TdjgJiK+b9iWnUHWuiOsaCLFNMBnSfINIoD8xv/VxX+0woboWJ3V8dAujAzg?=
 =?us-ascii?Q?BY6VdElFaGR7MPnSEhqGmUG42fCk1W3LUIZ+lHGg+hEqC+IxS0NqaJb4xJri?=
 =?us-ascii?Q?ZsdfGB96dDd5Oyc8fRzJC/Cw7eSYvUWlhMrCd5zKKFJhKPYs/tn0MSDo1Vf6?=
 =?us-ascii?Q?k/phBXC7KoA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ciVANRWZ/ER/GG1VMI+iLt/tpI2IBbrT/3ZacA5gV6RGu4B4GSLeZ9/F9J+y?=
 =?us-ascii?Q?9O+8OocBduQtRaaNuBzGRkwIREViB3Y0J7bt3RCC/bgQIZwPx0pG9brSeUcO?=
 =?us-ascii?Q?8wqTRAbJGYU6T8hWlVAeG0FLNuLxR1POnTQzsFjKEQ1osCxSJr1wIx/FbD/f?=
 =?us-ascii?Q?9ATyYdhywE2I9WEAXygtNUBSxY4nhGLG8vL5pdDnxaDkjedknJcWfjczpao4?=
 =?us-ascii?Q?ToJDYjaC/06og+2+GvHBSc34VjevsOLNAnHvH1yLcV8T2xB6GTWXnLU8FDQr?=
 =?us-ascii?Q?lVtNgt21u3c8T63JFeDKYFGq/JoyRSyfCz73uvkNwPa+OaQaA4Qw/BiU+1+3?=
 =?us-ascii?Q?oMt4KahjqymsxGHDnrWprWcdKwwRZOFA7rVXafeYlvvZW3eSDPTmpvq0Js8q?=
 =?us-ascii?Q?a1TLLNeSJU9BFd9UiYpULOBZxANpH003TObeoy9ytpyO4oE7hhOKm6wyeL5k?=
 =?us-ascii?Q?gNQJAlZrQVWjxkn6JwtC0ZabW0jBcGaeyyTQVBEXETysskTxRLW8eIfUKwLH?=
 =?us-ascii?Q?SfXQaufhzCx0wj7/6ow0iiGUbYjPJlvSZLfBHM5xPy8r4MoCotwUf/HflLZQ?=
 =?us-ascii?Q?tI0X1Ox7BPUpjcRW2+BYls5WHPNTfuStllZiDLba85mODB2pySMBBEcOaISJ?=
 =?us-ascii?Q?NypfpB3SSpG/NQtEx7WbkTdpsv5K8MgiL2anXXhl+iJO+6N+QI3/uevZYYDu?=
 =?us-ascii?Q?MQlpYVLOkRHLFx1MN5devHDWxCB+WAtxazXc+ktqrkDEit0yf/MNBcDm9OXA?=
 =?us-ascii?Q?GRyAICgLyUc8KYzcXZqrklXMCgocZd2/rP5E1mnbJNcCLZ0Gg4y0/uTIIMU1?=
 =?us-ascii?Q?6dxcE1wRKCWgT9cSAvmiwqx7x5afNNmswbK3luC64nMPEH4b5heJaWhAmW1U?=
 =?us-ascii?Q?J+uIdixM8dRtbyZVlvVi7SeqyXaIImFbpnjUcYmgXDtpiDXFdx4uoewDMSi1?=
 =?us-ascii?Q?Dy/QnV3crWGpkuDeXmZuRPnSjj47+y/zzgs2tO2eMtFfdMgBkzbKWk/7Iwon?=
 =?us-ascii?Q?3KEVgtMorcTsY5aokdo0SxKNdhik4HsP+oEdvakuOCgBNVpbgMXhGzt9pJe4?=
 =?us-ascii?Q?6hFR7fUKl0uIRhQr6LfFQNZRFuZvjODrb9a7cXtk42+NUPbm/Q6hX3ml4RIX?=
 =?us-ascii?Q?lMxfEddlXBqEJZXJoaAllZ7f27icbaCDHijfV4xWaAfqkMmFE0596sdB76p0?=
 =?us-ascii?Q?sBDfh4EeGT/B4ERvQ9He0vaePaYOBVUEhMv1LvmmhA4kGxQikMUYcmrJlD4/?=
 =?us-ascii?Q?4BxBPru2L02EMMk598lP1RDC1vOm1lwU65X7iLnxbmxFlbq8m1EZaigRMlrQ?=
 =?us-ascii?Q?+PHZMhASyC1XLLqBMRC/XxOuZDYGMJ7TxrMrhz2Ceg0aVH06znhdoK8sC6kV?=
 =?us-ascii?Q?FnC35RGo+orjLhNZYBunhb2GGVVdr7AfUILBimUqiw5UtdFnLCXekI0Wh5pH?=
 =?us-ascii?Q?59I85+J1C/9oI1FW0mkOBlU2RgDxMvCXc/ufeIJmeQerV2qQBAxbXlOR5iz8?=
 =?us-ascii?Q?/w7fOMAjnPT6REJsj8ejCMpz/A1L6tmksmonq9VGmon2pXNwVHO3aRA194Ix?=
 =?us-ascii?Q?Bf8Ny2C6H+msQK8RdzHk8qTr3pXPuXMZv5FB1CTjKSCl2wrPTVxB6cUCPJDT?=
 =?us-ascii?Q?8g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b308245f-68b5-4939-6afb-08ddc02b316b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 03:29:50.2947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UnBiZEItfPNlghXTuSAA80NbzK+cla5PvDohoWy9ECeLIDbwHWwDk391doouPKY2ssKoFlReiBYfzqdevNRoEnfhMfTVxhLP/P4EUPKw9eI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7781
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

On Wed, Jul 09, 2025 at 11:54:49AM +0100, Tvrtko Ursulin wrote:
>Group the function arguments in a struct for more readable code and easier
>extending.
>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
