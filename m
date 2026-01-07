Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C324CF6BE0
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jan 2026 00:36:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23FB010E1EE;
	Wed,  7 Jan 2026 00:36:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h7yze1gN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1878D10E1EE
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jan 2026 00:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767746165; x=1799282165;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7n0K1PdxZgorft8aH5JagEWqm4f/72xCT5KYikt0GGg=;
 b=h7yze1gN010XjDvzoPI7icE1p1fcEYeL2e3kGhLYIbE3lwvFtmPbdkhu
 SCw6lTwk27g2jxoQJ6luXMt080BGKdqLXht8kGr5NygevTqYu58x4wsYj
 N6S+42Tqwc72SmwCAn1E0Nr8jPRJKiJGOdV1QoOjRxJcrKHFiVbl70OMz
 YlCCXleXVsItOljP8E0RrBG9e8wDDTeraYm0I5fPRUW+7yf1nldTG8W/S
 n+ErxG/wGFNtfkM58RrXeZY/K4XZVPxWCpwVRTbZxZzBhj8a7SuSvigcS
 QWtVPTR2Fiiqla+qhBc9UvcehG8IJ0l6ZeesIxwcc29sW1KiunXsuWMW+ w==;
X-CSE-ConnectionGUID: 2aKEMkRFR+2u1pk88jD7/g==
X-CSE-MsgGUID: 59dCf6aMRYCpNQoF8j8djA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69191906"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="69191906"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 16:36:04 -0800
X-CSE-ConnectionGUID: BynV8LKzQ7WU9OgDfWpSqA==
X-CSE-MsgGUID: nUp9qjITSPm4xtacsRi/Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="207845631"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 16:36:05 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 16:36:04 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 16:36:04 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.16) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 16:36:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c9Yx8gA5m6XTjDrVoz7wFlHwayJxyor7BcCVZuIiBMjKOKLHwE6EYwn2zItGw/TVWY2EVISMBjxGaieBnJxSFq1jvPjN8Y60U2qeHQtUGXDuciM6MBLHyz/owoNgQDBXSkfFEc6g8Oyaj/U70nB5c0EO2yJqsxm3p1/petBsfFyA9aEe0iyK+1i2J4sivrr6iRSsfP27CHOdFlH9Lbq2zwb+bKeM7ffVlERvaMo8/suUKtzfK4YFCMDOq14RjLHNCcluP9C8dN+8gr4kKmrcQ+Vt1BeTnEPJTJ3cFTt424AIXwPnnpRpNC/uqg/UXXK3u3YRPK8KCPYRgWCARzR4qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gIREf4emsqqLlaQ4OuDm7Td+Eb1MJIh8jtuAImSX0wI=;
 b=MbLHx6KEdojRvwiLLrDfW9ufXQqYzvohUpbggcNbceCk5Z8aKJXG7tMinVcCXZBSsMUEbftzEAPqG3JU4akv+bf7pNfdNmwH/okEHynSpxYHmJr1nyJa4vukX77uDF6thBts4Zw+m4BJiXPATF97A1zGomsy6lzMIvt4cQ9t4H0s5Lz10W0fndAuuAmp7GMAdANPL2ahNfSQCUdVCRbiCHRHJxRlcZPgRZQ85h/gcUEwB9zaLdXJV5+pwS8F869A8nuTA/RsdfpInH3o4tOt14M7186r0lvzDS5H2ZO2I8QG0J4AhwWewyZrnxUOnWkTmpBy+MSdn4WXclAlS2QgYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB5777.namprd11.prod.outlook.com (2603:10b6:806:23d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 00:35:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Wed, 7 Jan 2026
 00:35:56 +0000
Date: Tue, 6 Jan 2026 16:35:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta,
 Saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>
Subject: Re: [PATCH v3] drm/xe/xe_guc_ct: Exit CT submission fence wait on GT
 reset
Message-ID: <aV2qaVmFEaW8IVIs@lstrano-desk.jf.intel.com>
References: <20260106205533.60180-2-jonathan.cavitt@intel.com>
 <aV2WDZ0uaMW6TYmE@lstrano-desk.jf.intel.com>
 <9e8fd19f0297426bde379e01a8a9ad3f109de12d.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9e8fd19f0297426bde379e01a8a9ad3f109de12d.camel@intel.com>
X-ClientProxiedBy: SJ0PR05CA0131.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB5777:EE_
X-MS-Office365-Filtering-Correlation-Id: 31091ce8-126c-4ef2-4154-08de4d84b8a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?wm5U9S3a5WIuuUJQbmf807TnvbGza0vz360HlnmUM+piipok8RF5h+u8Ug?=
 =?iso-8859-1?Q?TnfZLJUivx1ueqV1YYJBfwDgL4NgmQctEzX4c5z2wgKZJyCZBsoEhtb8UE?=
 =?iso-8859-1?Q?dyX2XDYr2reV+2Y5EGT8gAV5W8phDIk0ReqZvI2ZFTcOh8TYa/4VWVIhN2?=
 =?iso-8859-1?Q?/fZ1zE7/kvD+zyR8Wd4bssm93oUazClbdDuBmaU1xiy979/hHt3FUAxzzT?=
 =?iso-8859-1?Q?2wsdHn97+yGveh5rX0vMmzqPXhl1l5jYC96pTUDNLZ3QLfVnCRBweUBJTM?=
 =?iso-8859-1?Q?Sd9GvTugNkg3vAOFv8gcOuRqhMaz7Z5o7ND9nzQMt3P7+AFSFjxFLoh3R9?=
 =?iso-8859-1?Q?dTdDuO/oD+YixT8JOoSLpCPrF5Mb0QPEufpb187JNMGFJiW7p+aDnh3zJC?=
 =?iso-8859-1?Q?PsyXlscb39y0+J+m7av4mm2kXL6l+64UWsei0YTO7FKL3aKmIXfSpe9TP0?=
 =?iso-8859-1?Q?CYIPKb0OP0gx7yhw8BR5GPbCcBjL59P0yFqjdYsxg1J4AVjzxf8HV+BZyC?=
 =?iso-8859-1?Q?YzGq1BA21Eg7g9gPG1R0f0rHeU8f6cLszgUjbsuPviidA3vMNofF08T0Nc?=
 =?iso-8859-1?Q?lKfBob+8bNDSS/7p9V/OQtc0drp1JPI+9cEI3QX10zEV0lpW1NpdPtgADV?=
 =?iso-8859-1?Q?X67WW4Gyx3yeK3pT6lHo51CWJ8CXzwxtl5Sc68IlIMi29TK/hfprjZ3/Na?=
 =?iso-8859-1?Q?bAj1SQ7XIryN5FOKppcNbNu11C8V90h1pxcVnyHuV4ztPL64DolSxoTcXX?=
 =?iso-8859-1?Q?HPxjeeAXWk67mCnFMRipb9sZrB+xhanjZvZXJs36VukPHHzWD+RAVJUAsv?=
 =?iso-8859-1?Q?URSPzgd+s3RPzEiFh/ySuW70DmmKWD/KTs7drzF+PUWtoZ7LoekmvvverP?=
 =?iso-8859-1?Q?SZdHo3CrCpKbIaRss5SuqPJRJlc1+nnmtwziblhpr/Ao4IOX8ywS90cdJW?=
 =?iso-8859-1?Q?jyNp0JVSulqx93CzuoSGcwDs0dZl8tt48qKw2eFDH2KMBL/+Wb0kRoj6+/?=
 =?iso-8859-1?Q?uf2RvZFET3EeEAzl+bxgVOqjYDy5EY9rH1Exhn0EBh01VxoOLSPsD6lIcm?=
 =?iso-8859-1?Q?ERiZxy7lAT9C1cEr2hV9wdda74tOc7/O2dePtp4PEtmu9HI0kCkuCI/aL9?=
 =?iso-8859-1?Q?sly47lhcy8V8rOG5Pbh9ZnCPZhT3pouNY59DkjmiLtq8KRt/RVq4QFm6sv?=
 =?iso-8859-1?Q?kPRdoqR8x4DM2XzGffflCAhi/yeRwEkpE7f5SrdZmo970aXQBWdRE2+fFw?=
 =?iso-8859-1?Q?XO/DGDKFIHg4OZfqMwkPIcPqOaYi6HpV1kzPuGGJ/ilSC+eT+CLcNQDbBy?=
 =?iso-8859-1?Q?DWEWXHRKCV5nWejBtk9sAW6o6qMuj+MJdA77ZXDXrRldTanID89DQtgpx4?=
 =?iso-8859-1?Q?b7MDexslq4cQ/LIHD7qfc3UeMS1fG/vwCiJ9I6RY6IbiZAnPENteElyab9?=
 =?iso-8859-1?Q?SNpHaAv0+PItX3+vuiviphY/3N7My8EES5Vg17g8g1SzgUEtOf6G184gOG?=
 =?iso-8859-1?Q?1HQCilmq/VY18jG6/HpNTk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?BeeTdPde9pxZcFgkADyOHwu1cUpeBDKxeS8eyiFZaxu+D5X96GrfLXFkVc?=
 =?iso-8859-1?Q?mDA2/2j5P4s51cgilKWhFAc3rSLi2kl/+4MD75vNM2f7W1ObM4/3vKB4lv?=
 =?iso-8859-1?Q?6mqaj2pZZjRnC+Qk8QqnovkoqKOFl25RjxHDPF7t3d4mvN/lceBbe3+84I?=
 =?iso-8859-1?Q?BUygia2ZWQtpSMe3FTBuLSaOjYs7H95dk1/inmHmjMFhSKBazb4u0Kyd/N?=
 =?iso-8859-1?Q?jRvhmcon8MkhU1K4eL1NAp8prciCoNj4M0qohHLjQ8n5f+DVTCQFnajxOW?=
 =?iso-8859-1?Q?pHIb9HyINNexWQHRLM+KpuRYJE7vKly3h5ZSQGCNA6L4fS2SnGnwYKiY1z?=
 =?iso-8859-1?Q?7wz+o9Vow1MHtXQrY0FvhJsJTcdEtOSIhi1N95J2crrQx0LQpoOA2jBru8?=
 =?iso-8859-1?Q?nriLLWGFpU8OzTE4HFkoXfVwv7juDaOdjiiBNu29vIaK95URi4mSYPRane?=
 =?iso-8859-1?Q?S1dPOwwQ3bqs43xSoQr+4nS4mEWO450NgLqvZg0Pk0HIdL8ZkRb39NYTE4?=
 =?iso-8859-1?Q?Z0QIQ0X0FMKGGNBQDlD3KoOff3Z82XDZm1gbCpkEzEHbubApOrG7slEv+G?=
 =?iso-8859-1?Q?JnGuW5uPMD29NM8whFdE8R/aw5IPoNZWM/C0V7T/YxlnBhr4h9+2I90TaP?=
 =?iso-8859-1?Q?dHGHh62J4gFLecen0iGiUi1y6xhVGmel59iYX3AaN8luOpymQcucMGKbyD?=
 =?iso-8859-1?Q?lxPFGa77Mqj0l+uBBeoQUuNSOmreyoQDfbU37HD/Bs95cEtDZ4WUzEbQVf?=
 =?iso-8859-1?Q?jYgqpZGlGBg9BjdoSzrzc9GpCpnVEq/ooCdDuUBtGevSnEmyIMgkRDvTYW?=
 =?iso-8859-1?Q?l2jAWVN7H0Afq8fhBS+ZwvYHEph3yZMp0L1P1KBbtFkpDqgrCmRBftzibA?=
 =?iso-8859-1?Q?cLOT4QREzOO7MIaGeF7/iqzcjnIXetEj9sPfmSZihZ4qSwa4IRqx9EfhCA?=
 =?iso-8859-1?Q?0t64C/pkoybrcG59D/ujpVF4sl7U8r8Zwlyrc5dNcu2C4oXzlbEjstqiKa?=
 =?iso-8859-1?Q?ODgDIjIP6T/JQ3/SteUtAfTPQmzwD21WK/RQw2A0naDPq9JnfdOruQ75BV?=
 =?iso-8859-1?Q?FL8entA0474UwjQpcj239/spsFniVMIrxv7/nJGRc2J7TvysJ7a/UQIeIc?=
 =?iso-8859-1?Q?SjYKAFHZV/Z1aZxEzSxfXa9OCxEiV9+uVyHplS9jVz2D0b2i8Ug0epaCNy?=
 =?iso-8859-1?Q?rslAJZo3XFt/eITLMch2NGjPIN+XGiYRoCnGMyZrANyWQdwd8GSBFJq1J8?=
 =?iso-8859-1?Q?SOrh49NOrtPLSMOpPR0ZeT5kFvei1EJSwPxeIxRwz9qKbtoQInBL+4y8hA?=
 =?iso-8859-1?Q?72qbigMG9H9j35yioVz++pz0ldDCiw01j3tg/aBabC2dxinfRwO83RcFBL?=
 =?iso-8859-1?Q?8C6WTt+lVFaf7fojQiyzYXFlWP1Ivphovcj7lr0Xec8Gi0M998PvOFxB0D?=
 =?iso-8859-1?Q?seyMXddfYVYVXx/VlV/Hps1ot04iAS3FN4hT6FkHUhsBmAT2ZSQXfIl5wH?=
 =?iso-8859-1?Q?z1/FhnVSebRYokuROUYhQS0BAbWcyHg3jUov+PKcWyE7zCt9YoOiYAd3W2?=
 =?iso-8859-1?Q?ckzd0kaWzBRHUvAr/Pm+HEaXh4yaTEbk99/05MoZ7DZq96BrnmWkoW2rps?=
 =?iso-8859-1?Q?vpSAFwc5zEgCb8u9a+AVv/sWzH4wnYh8XVaD3egZTwZjyFpqDGaf6/zF1D?=
 =?iso-8859-1?Q?4+6ADHWAjoS9gsuzH1dvb+2ou2P71sX7UKUfMmkKnri3FFi7qZYvzzgrpk?=
 =?iso-8859-1?Q?Jb9JR9NKoTr8DWw9uRbr/t6KhIlrmUnp8aDQpGtvyZFwPoMpUlkyWna9LG?=
 =?iso-8859-1?Q?phAxARIr/xtodna7y5xRIgn4og/9EsM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31091ce8-126c-4ef2-4154-08de4d84b8a5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 00:35:56.3565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wgRNCIHewghGY0yH+q8r01VxWHSjOKIZdYvFBvdLfDUsMWneRNOR2o6oAW5qKCqBne+qFiYK7TmCHzaVU5vGrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5777
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

On Tue, Jan 06, 2026 at 04:11:27PM -0700, Summers, Stuart wrote:
> On Tue, 2026-01-06 at 15:09 -0800, Matthew Brost wrote:
> > On Tue, Jan 06, 2026 at 08:55:34PM +0000, Jonathan Cavitt wrote:
> > > It's possible if unlikely that the GuC could be reset in the time
> > > between performing a guc_ct_send and the G2H fence completing in
> > > guc_ct_send_recv.  Exit early if this is occurs.
> > > 
> > > v2: Rebase
> > > 
> > > v3: goto retry_same_fence if ct is not alive (Stuart)
> > > 
> > > Suggested-by: Stuart Summers <stuart.summers@intel.com>
> > > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_guc_ct.c | 14 +++++++++-----
> > >  1 file changed, 9 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > index dfbf76037b04..0bdcbe6503a7 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > @@ -1238,6 +1238,10 @@ int xe_guc_ct_send_g2h_handler(struct
> > > xe_guc_ct *ct, const u32 *action, u32 len)
> > >         return ret;
> > >  }
> > >  
> > > +#define ct_alive(ct)    \
> > > +       (xe_guc_ct_enabled(ct) && !ct->ctbs.h2g.info.broken && \
> > > +        !ct->ctbs.g2h.info.broken)
> > > +
> > >  /*
> > >   * Check if a GT reset is in progress or will occur and if GT
> > > reset brought the
> > >   * CT back up. Randomly picking 5 seconds for an upper limit to do
> > > a GT a reset.
> > > @@ -1247,12 +1251,8 @@ static bool retry_failure(struct xe_guc_ct
> > > *ct, int ret)
> > >         if (!(ret == -EDEADLK || ret == -EPIPE || ret == -ENODEV))
> > >                 return false;
> > >  
> > > -#define ct_alive(ct)   \
> > > -       (xe_guc_ct_enabled(ct) && !ct->ctbs.h2g.info.broken && \
> > > -        !ct->ctbs.g2h.info.broken)
> > >         if (!wait_event_interruptible_timeout(ct->wq, ct_alive(ct),
> > > HZ * 5))
> > >                 return false;
> > > -#undef ct_alive
> > >  
> > >         return true;
> > >  }
> > > @@ -1304,7 +1304,11 @@ static int guc_ct_send_recv(struct xe_guc_ct
> > > *ct, const u32 *action, u32 len,
> > >         /* READ_ONCEs pairs with WRITE_ONCEs in parse_g2h_response
> > >          * and g2h_fence_cancel.
> > >          */
> > > -       ret = wait_event_timeout(ct->g2h_fence_wq,
> > > READ_ONCE(g2h_fence.done), HZ);
> > > +       ret = wait_event_timeout(ct->g2h_fence_wq, !ct_alive(ct) ||
> > > +                                READ_ONCE(g2h_fence.done), HZ);
> > > +       if (!ct_alive(ct))
> > 
> > I think you only want to do this if no_fail is set, but again that is
> > dead code and likely doesn't even work as is. I don't handle the
> > device
> > wedging nor does this patch, so either case could live lock.
> 
> So is the suggestion to just bail out if we're in reset here? We could

We already do. guc_ct_change_state will set g2h_fence.done.

> also tear everything down like we do in the !ret call later. Or we
> could add a retry count here so we at least aren't stuck looping here
> forever.
> 

I's say leave it as is or fix the no fail function version and use in
possible places we care about this (e.g. changing GuC PC freq - those
really shouldn't get lost across a GT reset or VF migration).

Matt

> Thanks,
> Stuart
> 
> > 
> > Matt
> > 
> > > +               goto retry_same_fence;
> > > +
> > >         if (!ret) {
> > >                 LNL_FLUSH_WORK(&ct->g2h_worker);
> > >                 if (READ_ONCE(g2h_fence.done)) {
> > > -- 
> > > 2.43.0
> > > 
> 
