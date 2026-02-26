Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A5FFFD9E1A
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 22:15:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D10C710EA11;
	Thu, 26 Feb 2026 22:15:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SacoHjTD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5FE710EA11;
 Thu, 26 Feb 2026 22:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772144142; x=1803680142;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AoJ6CdQIow3jlJT9nIT4C4YHCd5lbMok7Ip6X6Nd0zw=;
 b=SacoHjTDTtCeNaVZjwJZGzQe715WCV3I4YRyJHiipW4pinSwVL6btmVz
 /OU3GLQA0VboihgC6dL+jAQo9fB4yor1TSUoGhWkDgYgoigjYPThk/Yk+
 DACxEa4l0O45CHSsWo/OMxnazmMrXrcsmtts0jQKBMPlhJavduV3fE2pJ
 HmKNuA3HCfpicnrXbJdSwkdMUmzi6liEwkGYXn+iNpLV9ZnOxAkIlSkX5
 zIt3Rk1Ni0CU39c62SkAlnKqL88M3aN/UNuaNJvKRh/fWnEZZanKCmcoC
 6ii5kNMocU6Dk0x+HcpBmMr/+kwWaloVFEWQwLezaWUK6YRCZPJegySl+ w==;
X-CSE-ConnectionGUID: u/rCrKMHRYS/Be14E5kfgw==
X-CSE-MsgGUID: 9KwzvlmyRRKDlxzmFHcexg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73130703"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="73130703"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 14:15:40 -0800
X-CSE-ConnectionGUID: 5yreGYLCT2epDuq7U4N96g==
X-CSE-MsgGUID: PJMJdI7YQ4ynfBqjSNW/nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="216613339"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 14:15:40 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 14:15:39 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 14:15:39 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.54) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 14:15:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QSFM8pJwxs8EWFjjlEz2ldMQOoaDKglUf625SqkhXHBg+XvtXuCCL4mrYfAe0+YrSdGV4p2bQ+CEAsLx87t3bx0XlDaH6SmrLO3aWChw8pwAZkaSmQIkaX2k67+1VQlE/0ZybKhEwkbBkA4THREWwgzoMgaio25cZhQxJGGXoE6uhUueg9zOpiCBjqRTVMBNRLPIoDG5F8iiN2jt+NkkJvvm22etTvdw4h0rAlcN3c50FAUesaLfvvecKLyhx13A9oTwLKvLH5WNXVE0rwqtoffzLuXhrK1iYU/7ShEpvCQFv0k3V8iflNSzK4z1RxyEH/EZefRk8VwS9JPlJFAxSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+blBgfMQvgxiJIFmRl7S0QQf6d5A5mLekTdKe6leino=;
 b=n9R5KB73e8g+y5jJ2jC3HaMqNyvaKEK//JBxzXiWOgvOmQfvC8Y4E9+LPrkQkV1yX2PJFKk6NvSsUZtJFi7YRPsTq2uS0H1R/LtaJgQzuuYerl86MdlqMt3roEDRbFzF0xPDDMqvcMSSp/X0i9pvFpn5XOCkh/v5b/ZyUb8nbEXlBSxsndPGkJ0osSlvv9peQRnCf+qH4yUNGmf85cGS3zR46Pj5Wf3NcuX5Xr+StTlEhQT+Qs/maKoWhOM4x3kzcTZrwwTKVa0M3gASiCFsA+T+2WrfPj/V6mBe/cbczK64gTqXIHV+BklOwH4DZK6x0SdMJ8psfMPAZ7WOf4yMOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB5948.namprd11.prod.outlook.com (2603:10b6:806:23c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Thu, 26 Feb
 2026 22:15:32 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 22:15:32 +0000
Date: Thu, 26 Feb 2026 14:15:29 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "i915-ci-infra@lists.freedesktop.org" <i915-ci-infra@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1?= =?utf-8?Q?re_fo?=
 =?utf-8?Q?r?= drm/xe/configfs: Free ctx_restore_mid_bb in release (rev4)
Message-ID: <20260226221529.GY4694@mdroper-desk1.amr.corp.intel.com>
References: <20260225013448.3547687-2-shuicheng.lin@intel.com>
 <177209197131.290166.14553028972240408439@a3b018990fe9>
 <DM4PR11MB5456CBCD1C267D05BA0C985CEA72A@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DM4PR11MB5456CBCD1C267D05BA0C985CEA72A@DM4PR11MB5456.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR05CA0041.namprd05.prod.outlook.com
 (2603:10b6:a03:74::18) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB5948:EE_
X-MS-Office365-Filtering-Correlation-Id: acfcb4de-cc9d-4f0a-bcfc-08de75848e65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: oqxy7NySDpsmMWl+0ZEdyqke65tB4zNMZ4c+b4NN9PUjO+WcEqjFPzRfShWcmHEB3BhcsvKb0ujMe2frGz2BxXesiXd1QHAxgwj4OWxZAw+YV/akPyzezG3k1Wnlf/zJgDUHKLk9TAcjNepAuSdWg9IwGf/DDGCZpz0tAHImehLcytCfNeLFnLS+2CMU4bN+rxK1QZr0Tv+wIK0Agv1xfpmRJ9dt9R9C8S7nue1VLQwaISjqYEkQes40Ek/+DhxGS+Xfr3Muy62+RuRdMR7pikJVkkIwC4nRrisxsHqthGzdIMGmcA+w+TWGAp3IRE32HNET1k+gWKpCe/BKhR0b71DL/mm9CYwqMjFLOGQahjUcy050bXDOnjhFrooVdEaXIL+iPZ0vmzR5y13gxQBzUQZ66QKZeg5dhFvrrraxOS6eHPgY0MVye1qkvSXc3wqEg/l9OLOg0OiPwV6G6dnAdMMyjB3HZF5AA6nTzXGu0z5+9qlu2J2G9gpE7ovP5ZY7lkpvtWPNt+0sHesuZQL9AOkt3yHqAIooGK9AfDCoTqTkQfVFr3z6UiZ4ICaqMDPR35Butxtz2J6JCmnuUMMg9usmPBEV/OLCSMezOvRHu1CReks/vf9X9G/f1Hnh45mUoInnnz7REUO/LMZRZe2bUycgmZOoeliKij/gt6chSDlYoCFGPyOF2tQMNChcbXoi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ncEP3Kd8mhyRIDaiySvVlT1374DcqsOh9oFzVivCYXUl4RaHfQislPHRXDhh?=
 =?us-ascii?Q?ZxjYteBnJZF7Tem60MLM8k0ekzFF55gBR6wCzJHb8/cbk4liG+BH5fbjUlMr?=
 =?us-ascii?Q?MAJ4ev1IEGd6GWkSXYi6ABDFyKqgJLEbuTCKSvgbQhNGghS5+7eKJpJ6jVBd?=
 =?us-ascii?Q?WSZ/uO2M5k0HWZMstcUZr1VjhOi0sKeDYHhgVTjK+UdqlJ+A+E5BmkZyGbAP?=
 =?us-ascii?Q?yoR72KOmcDf8HC4scYqFX+gKr4g12eg/FQwPa8lNdBormsEv+paSGd9WRBzt?=
 =?us-ascii?Q?wJ+XM7Meuz0Olh/RU5oDLBbGH9pLKj2+mxztA16VzR58cxOoIa6VtFEEBjA3?=
 =?us-ascii?Q?KOuedWK8FwiNe72Zvbl3FC9Au95xwNmKqX04rhBHBULEUBjm2UeL03AXkCrG?=
 =?us-ascii?Q?5kRdfk+EsJRAIcuspTDnppbpv2Mncwkx1zlJUdjbY7Z12fJRMHMKu9EhcOP5?=
 =?us-ascii?Q?gdfMLPXfp2K7PPW2J6mLB5O7UO9sW5/hXGwl39LnzC0jGL6WHhHBh8uPwvtr?=
 =?us-ascii?Q?l6+qHscr58fE05W+V1RpbDPndTCETmDy365QbCptRepzMARyazBVmM0LrjRa?=
 =?us-ascii?Q?/CFTRK8f+7qBJ2m5GC8o/upH4QGsvGOEk/hfS+NR9mS9zkheYHHkEsOSj2xi?=
 =?us-ascii?Q?zY61y76Kv/dmILsQTDRsJMgO33ugM7abDStCOzsRlazNo0YmuUhdE+v4m0hW?=
 =?us-ascii?Q?X+nzE5ODwbaZB0Ie/99FbnEt7G48XBAiwuHGxQq3uHDedocRs5jjL3VndZrz?=
 =?us-ascii?Q?yU9P/k+XZxramGqsQddSBN92baAN9h0zoqCRQeDdblleI9RjH0pKSFTO776+?=
 =?us-ascii?Q?9r6eHVtgJsvk2i0vhBcMOF+Y891WxNHIeTOOzpGB0JuVfpbQ413p3vr+cAu0?=
 =?us-ascii?Q?AtFn5OFy5JP3H8idO8BGSjLieJZGfiNYt1OTAZyohCHA79KtFQagOj0NkTT8?=
 =?us-ascii?Q?qRWL/fWiETROlcDeu/Ig/FfKClbwRKDYUlQno+ncS9aNT66pLEmHPbV5pBl+?=
 =?us-ascii?Q?5JYTQDjdFXgx2plRRMKG2w5SXOTQmvu/BUFCoxrxfZWfsV31iKLkLuEql/K9?=
 =?us-ascii?Q?lCgACTXY1pF2VJaqlqEmNtlmspvl8Cvq6RegG0AShU48ArgdVyUl4VuSdsfk?=
 =?us-ascii?Q?3gvNBr8RgfOEMyjQX0uX+BIfxaKzBWO5G32NQh0bVXQMS7wvfaMzW23y/XYD?=
 =?us-ascii?Q?y5PyY+PRnGXSrobv7lqjs/H+qDRKCd5+IXfa9/jHDUo6Xhd1wvO9Ja+hTauS?=
 =?us-ascii?Q?DmXGSuiH7KjLK5t8dL/p4iEY0KHUTFEBO85vGthFFMXyaLxrylNK5WRrKdvA?=
 =?us-ascii?Q?L8La1hPWIgy6SH/VarERgnTJaP3C/WOCK1/w+1WhRBMT+glfLALgphuR9o7o?=
 =?us-ascii?Q?5yCrK+KpioeRUEnF8HzQWwcKd5zG+H+2V7ctDc6+bogQe4aRLaAN28sW/ijM?=
 =?us-ascii?Q?BKAJPB6ImfWBjF5QPWD+xHu9+egZeDDqehGoEX7lU0a2xtcQjXCXvubJRSoU?=
 =?us-ascii?Q?60d/ZQqbYeLD6m9x0f49ylFlIr1HvUyOecTvPhS/WIiVzPczCVHdqfM1FBxL?=
 =?us-ascii?Q?t9XQoz0Oue/j0g51JC2rh86ggztBusHqKpY23EPgIndFi1jIb8xP1wcLuEK+?=
 =?us-ascii?Q?ibnxZINne4vLWmLSA8tsLRctQgNMiNdok7iqakk7ZbezE/Bib8rwBGFq/jFN?=
 =?us-ascii?Q?/N2v4bCppUXR4Hl7+k7gDxSlkOTDfOs0a6dymyRk/LHMqfqMkZwz69kJDKpn?=
 =?us-ascii?Q?NeqOmGTFvfISeNo165iHIsMCF4jTXxs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: acfcb4de-cc9d-4f0a-bcfc-08de75848e65
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 22:15:32.0328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xCSrrL0rAJib6yvfrkIktIqozqyx4U2Uz/RHApSC3VSNStKY8p17wGkFfngfrXVSPNvLsCEN60uC00t1XI4ueC1dSax/opGLMs6ShYAHjyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5948
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

On Thu, Feb 26, 2026 at 04:33:46PM +0000, Lin, Shuicheng wrote:
> >Possible regressions
> 
> >igt@kms_rotation_crc@multiplane-rotation:
>     >shard-bmg: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-4/igt@kms_rotation_crc@multiplane-rotation.html> -> INCOMPLETE<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162105v4/shard-bmg-3/igt@kms_rotation_crc@multiplane-rotation.html> +1 other test incomplete
> 
> This is a display related test case. No obvious error is seen in the dmesg log.
> The failure should has nothing to do with my patch.
> 
> >igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>     >shard-bmg: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440/shard-bmg-3/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html> -> TIMEOUT<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162105v4/shard-bmg-2/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html>
> 
> From the dmesg log, it is due to GuC initialization failure during driver load.
> Nothing related to my patch.

Applied to drm-xe-next.  Thanks for the patch and review.


Matt

> 
> Best Regards
> Shuicheng

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
