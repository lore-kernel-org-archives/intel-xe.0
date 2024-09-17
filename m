Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6529ACAC5AE
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 22:42:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3097C10E1F8;
	Tue, 17 Sep 2024 22:42:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GBACLAEW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E0D10E1F8
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 22:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726612974; x=1758148974;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=425V7hjqORyVddosXb9LhXJd4jnjqRlfpmoWJITTchI=;
 b=GBACLAEWg+auhChFufiwzJgXKt+yIj7cnChy2l9T+ExUW4gALVohP/2K
 qcm3ELrPMKNCayN2VUUY6PlIHIr9bW3dunQDxI6ayxD2J4fCZEzn/tQ82
 qksVAbOQhgr0PMLzmIBR2YAkuRjt7UeDa4hL6Ha8yEaqtsblxcnCTD2GN
 50ihm6i3mrNSCPBTh/y3ynkfqtsRcn/McH1aJuJK/gxIKifOd7JDgRAV9
 suAhlM5uMqwKz1FD5ddKup4kQsH8ZScJpivQ28psEaOMwaIms7UVL9ZVQ
 rkxBjTc3iNPGiZ9EW69gC8ykqVFa4h22zTQ+bcq0CUoCzX51Nu/FVyjjx g==;
X-CSE-ConnectionGUID: As2K/sf2Q1quzuiy4e79HQ==
X-CSE-MsgGUID: bWhVbGVjTMuI1vqj1vDLaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="50913691"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="50913691"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 15:42:54 -0700
X-CSE-ConnectionGUID: 9lrO28M9S5ySUb4wGFcC2A==
X-CSE-MsgGUID: WUTe6SYwQZa8aOGYhPkTEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="100180122"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Sep 2024 15:42:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 17 Sep 2024 15:42:48 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 17 Sep 2024 15:42:48 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 17 Sep 2024 15:42:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RL4UCQUQRaQRCtZ8y9AiikDswpXg+/huYmRUadrbenwFe8HMaK+fAhInwzK407z8G/oGPW8eF/ngQsJCQgWt2Kw4E5Ci4syaA6AeEtLgNwC3GU1NGPqHyH+n0/HS2GjvJXCc3vGLAHrFSHdIeutcVKlRvDGI1EkDygW+ikVmxgAhAqVX7Z+YrJ80XmXwrXbqFS5KtVkugqRIWW8mjnk4Jg//pkES0q96qP7i3HdaWOg8IybOduDWQP13WchfQ1e+Fw4n+0R/kjOBvlkwHz3j6169hhXUY9o6LL+GBHxsFN469aidtKw9cb9gBDmdI6GOdngOXtRkgpQ1osXQGhrU9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SagTwyWd3EP8WWXfZTL8PZ0cTEALmiNp3/9IFKiySBU=;
 b=YrzUyU20ckP0E5m8+difAOXDpbeaWD6+KBbPrPOjNVeCGeq7lJkb9mMMUd1vlkrx3v4ktfSoP3rpsVg2OWk67lX8ZFPtEEYsMCS8z6ahw4y3hW0LnWSrt1kWh80TydgXArhfak5uURPoz7mv1GFiLpp7S2beCd4aRSND7Tgq2oire5/P7CH3WfngjAG1IcjL/NzBYv5Fu6yX+1H/+u4Lg1SrHme6XvinDXRqZUwg3wbB0Ex8cLwGsv7NVaFLgPLPXaJkyUhj8dxxvl2Fv/G9/VheK2P+4B6HIZbrZXbMY4dUUs7JZzf7grjGYbDMehTDC6l3/ASLMFxBWjKKO9pXEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY5PR11MB6365.namprd11.prod.outlook.com (2603:10b6:930:3b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Tue, 17 Sep
 2024 22:42:46 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 22:42:46 +0000
Date: Tue, 17 Sep 2024 15:42:43 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe2: Extend performance tuning to media GT
Message-ID: <20240917224243.GQ5091@mdroper-desk1.amr.corp.intel.com>
References: <20240917165400.40592-1-gustavo.sousa@intel.com>
 <172659255821.1857.18423882338010122836@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <172659255821.1857.18423882338010122836@gjsousa-mobl2>
X-ClientProxiedBy: BYAPR05CA0062.namprd05.prod.outlook.com
 (2603:10b6:a03:74::39) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY5PR11MB6365:EE_
X-MS-Office365-Filtering-Correlation-Id: aea0c539-1674-4ce8-d95a-08dcd76a0cf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AM1jJgQBElvEMOiQJoP7eaA5VZ4cameBTiUcemjJOTEJwu4vtnDaN83O1BJG?=
 =?us-ascii?Q?COBPK5sPuK03WmgcVS/dWusebJeMvBVy1nTNd8N0aFEMuXKioUUDPP3GaL+/?=
 =?us-ascii?Q?HoCar1dZYK/wyxOr8Crc05oD9Xd4C8EK7TiavkxNAJBV79pm2ddbyffxp6c2?=
 =?us-ascii?Q?j5/bpvj49qqAx0zm3gyg2RI1T0w+di4LnpGdRnxBEqZ+LssLGqDUEnPUB6bL?=
 =?us-ascii?Q?ALfKxkPgLrCC9xeml1oNkEQjIy9h03xZzuU2uVXVD0BHYCuDzknILl7M7ffo?=
 =?us-ascii?Q?d6HBKW4q/d+oIahFu+OQwMNgGtV1orTuZ8LDrAujnMgoaIhetJ8uIFYXCLXq?=
 =?us-ascii?Q?FQlUIlQvUddxr+edQylwaM+9Hdxps15CbrjAvSn758nWrYgWgMoM7wF04K6J?=
 =?us-ascii?Q?7RhOvrH7t+zhrBZbx82b79q4ftW8UQcYKDrIMXIwdTm9Hg0yNQbpqoRtrRuJ?=
 =?us-ascii?Q?VFa/35LmAgu2tTLNNQpFI/Lz1Q/VhJixj8VyE+mP0Dqpm8vMLRySTEY03vN2?=
 =?us-ascii?Q?XXXzRk79hOhC8TEfJeShQZtiuakHte0AHKQ3uY3gmq3SIRX8ToCTx26hYjpe?=
 =?us-ascii?Q?M+q0uxymfSGbzOm4sm/di13fa8ePtpCkpaDshIZ7snYDTq54ESKmsyxIJ/AL?=
 =?us-ascii?Q?ygFLYLFPB1AiyVPFY5XuABHKsAvk4HyQr7gwbLP2fIyghhzwtrbAqBsRXtK+?=
 =?us-ascii?Q?qOgl+PiRB1Uu4rUjKDJfPUSMJSDKi+y78VXjkUJp2rlpb5EityttgFkHyJ3J?=
 =?us-ascii?Q?0W+0uQ52pfX8C3rgMdLa4Z3O7RpwJCQQQefYtzGd2i3tVQTsBvWSWbTa05m3?=
 =?us-ascii?Q?Eiws2COFFdHZReD7ORIJZ256N0ny8kCzXY+oi7kMKV+ee6G4TFZzSROjwoDw?=
 =?us-ascii?Q?pII7dY1bY5NejZzqCj6wdPCY6DJ9wsuYLrB15+cili6+rA8js7ADUYGgev/J?=
 =?us-ascii?Q?ZlgXCYXWUyj9ssCzN7kOGinYaZs9PzCzRcy1bru9b9gxrOnC2X9b03I6BsnP?=
 =?us-ascii?Q?diCJhhR1injsZGI51xeMhy5P3GP6HduJKiaXDdWCT5P6UYQhRhbDEVD7fa/r?=
 =?us-ascii?Q?gYY9ChKmmMxh6SOLwfM6FPOhXRfMGewAJtxJTPjCdHDk0hRxyAv48fitSMFx?=
 =?us-ascii?Q?sg+z3fFht9QcR/0C+GOuumZ+vMfr1Y/uNKaKro1L90ynYKt3XdjwIg18omL8?=
 =?us-ascii?Q?bz9GPhSGau5ZdSGqSndCitr4al+EstTOEYoTLr2zrbUSRh7dyy7Qnb0QRW1O?=
 =?us-ascii?Q?dmQr+/7X+69TQlFW2tXnfplfi4t/PwAReZDkc2HU8qOaMOZYxqAKJ6l9VTzP?=
 =?us-ascii?Q?wl8q6gpLBJ4anXEQYND4GAWpPsc2Qy3q4H0Cr6VSBjJigw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2kim89NHOZNLuBGcckFskK9fC8e4MdwWgKehX3R0CELOuvSWS4LWJaK0GG4J?=
 =?us-ascii?Q?4FuGDdmFxA70KoOnq+jstZ6c3aXp8ZORgj1pBDFEE24UmWJ/N8WVBBP2Ofrz?=
 =?us-ascii?Q?/IKXbxOPrx68kvv6kQdHgguDDQPx+FiCGRkMBVyoYqc7WPzfxoT+LUHaWLBn?=
 =?us-ascii?Q?QNWtUKTmkE59zPROWZ3Q1Aw42ViMFxvEUyEoXWeGb3Niy0Ftz1KZ2BOs+gWJ?=
 =?us-ascii?Q?cSsyFY9AMzaoMK3+nZmhw92I9XZYVevm79dqSBcmqMwoYopa1kCCTv3NNx/i?=
 =?us-ascii?Q?Jn3Jl9z/AiS5z+d7TaWvphuWZ9DeOHa4RS+1ut8QualbnsQ0MmqlQZOg1mK3?=
 =?us-ascii?Q?mxkL4zonH2quidFJ7N+IxZPSOci8a5PJuds4jdEoG5gmpLHSYOWP/YLshJ+n?=
 =?us-ascii?Q?6lpityquwPiR7oXKyPSoXIzPbav8wCCq+lQHedodrDIegGBZNZHCU+iOLGuu?=
 =?us-ascii?Q?guhAyb71yNjP5cy53or8VQOKzPeHXP6I9hYoefLptci/JddlJ427LCEzjAaH?=
 =?us-ascii?Q?n4DWf6T+EZ7jaM8l37JW6L8bcab5ef3grPOlRLMP9NI8vBiAhr6mqX+BK1hv?=
 =?us-ascii?Q?+nbv/7ovzYU/30zhH+irWOtcSWbptdLedf39BnCrsaiaqIMbD2HiIhe1dlH8?=
 =?us-ascii?Q?Pj8IxpYHnzDfQsavLrKJDj7mqZ40m96QjYpr6C3sArKWN3Ab5gdHVKKrsdIH?=
 =?us-ascii?Q?ECICCWX+zizHNTcbz8YdxJi5cQYEk0eFQituEWPAIj5b/Cz6K6OP8CdGA/gz?=
 =?us-ascii?Q?ve2VSumewTXSQMb9MNqthoViwC64tH/SMkHw+BfgiiDynrbu+Uz9K9RJWndo?=
 =?us-ascii?Q?ETY8wAEXVMNcfO1Pk8IcNcJZHDj4eyYL6/QppnUsU6L26eBsDXZZ+/Pojlcx?=
 =?us-ascii?Q?bGRt/d5Mcc4r8GcIR3SH8rMZ66J9QOKP+89JNG5rg1fH+kuf3ty4Y29X19DR?=
 =?us-ascii?Q?B6y7EpX5b/L0We4GBf2hh2XoKAc2yv3NMUNeprnhabLetTek7OvHz1fIATP8?=
 =?us-ascii?Q?ErQwGfcCzDz5FwxQMAXRjZ0RneupwITGaS5znjtRG9k83HkMtinf/GGuLF8D?=
 =?us-ascii?Q?G0Fw+cfqYAyg7+mRGmbHHiCHffDG/czLc4hHD6TDUN0qj4djvyCuO1f8uJFT?=
 =?us-ascii?Q?xcQ6tOaGoHfUKw0DffQ4jnY2jyet44eBxzYJoiqQnweJuEBpjiOQdr63+N0T?=
 =?us-ascii?Q?fCl0YjuzNkgALiLgKB/vdUXkVXNB4Gq+vWBzluGwP3gUq9YkcMUfrjDYuL6h?=
 =?us-ascii?Q?ugkftlvJ0bLObwm5laDGjvGfQahfebGG877s2tcJ7gwFAoHvh6aPV1pUAxxm?=
 =?us-ascii?Q?hMPpspMH2TiKnHfoDPwxur0fiZwTxU4Gx9JK786Itx5VbpI8TB9ZgHM520eV?=
 =?us-ascii?Q?kbcObleYGmkJsDo2LX/ruUWYCSZB6S/u2R3PdSfc30BZT8WqR3OCKVlVXbhi?=
 =?us-ascii?Q?az8A3L584WEXVKDGQy5mvM/WCxqSQ2Hyqi208NaMSBsPmX8/jbC/BdVfM9qq?=
 =?us-ascii?Q?e5tbualsokYoXHnErzhnqeg4wimRdfV13Q3AxZOqiUO1KKcpNKvcWDSb7qU1?=
 =?us-ascii?Q?T1hgeO+VRdkIdQEoulfzWaIiXBlddn0aL5XAJV/YBhBKENnJzsQLykcPTNdU?=
 =?us-ascii?Q?eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aea0c539-1674-4ce8-d95a-08dcd76a0cf9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 22:42:46.5690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HAwqsLrzAePwsinVrQ1eG0/YZaDLe5IteuEiQH0L0o57BtaFWNl/6QaLjUReAdTR3AgaA9WEM+T5HBuVuiwIERUXwt14HIPRPvUoJh2Ry+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6365
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

On Tue, Sep 17, 2024 at 02:02:38PM -0300, Gustavo Sousa wrote:
> Quoting Gustavo Sousa (2024-09-17 13:53:54-03:00)
> >With exception of "Tuning: L3 cache - media", we are currently applying
> >recommended performance tuning settings only for the primary GT. Let's
> >also apply them to the media GT when applicable.
> >
> >According to our spec, media GT registers CCCHKNREG1 and L3SQCREG* exist
> >only in Xe2_LPM and their offsets do not match their primary GT
> >counterparts. As such, we need to have Xe2_LPM-specific definitions for
> >them and apply the setting only for that specific IP.
> >
> >Both Xe2_HPM and Xe2_LPM contain STATELESS_COMPRESSION_CTRL and the
> >offset on the media GT matches the one on the primary one, so we can use
> >the common definition and apply the setting to both IPs.
> >
> >Bspec: 72161
> >Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> >---
> > drivers/gpu/drm/xe/regs/xe_gt_regs.h |  6 ++++++
> > drivers/gpu/drm/xe/xe_tuning.c       | 19 +++++++++++++++++++
> > 2 files changed, 25 insertions(+)
> >
> >diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> >index cf21de3adca6..2e655291a84a 100644
> >--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> >+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> >@@ -169,6 +169,8 @@
> > #define XEHP_SLICE_COMMON_ECO_CHICKEN1                XE_REG_MCR(0x731c, XE_REG_OPTION_MASKED)
> > #define   MSC_MSAA_REODER_BUF_BYPASS_DISABLE        REG_BIT(14)
> > 
> >+#define XE2LPM_CCCHKNREG1                        XE_REG_MCR(0x82a8)

It looks like they forgot to fill in the complete row of bspec page
71186, but I don't believe this is in an MCR range on the media GT (and
we're not considering it an MCR range in xe_gt_mcr.c, so defining it as
such here will cause a mismatch --- looks like CI already flagged that).

> >+
> > #define VF_PREEMPTION                                XE_REG(0x83a4, XE_REG_OPTION_MASKED)
> > #define   PREEMPTION_VERTEX_COUNT                REG_GENMASK(15, 0)
> > 
> >@@ -399,6 +401,10 @@
> > #define SCRATCH1LPFC                                XE_REG(0xb474)
> > #define   EN_L3_RW_CCS_CACHE_FLUSH                REG_BIT(0)
> > 
> >+#define XE2LPM_L3SQCREG2                        XE_REG_MCR(0xb604)
> >+
> >+#define XE2LPM_L3SQCREG3                        XE_REG_MCR(0xb608)
> >+
> > #define XE2LPM_L3SQCREG5                        XE_REG_MCR(0xb658)
> > 
> > #define XE2_TDF_CTRL                                XE_REG(0xb418)
> >diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> >index faa1bf42e50e..ea1444358b4f 100644
> >--- a/drivers/gpu/drm/xe/xe_tuning.c
> >+++ b/drivers/gpu/drm/xe/xe_tuning.c
> >@@ -42,20 +42,39 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
> >           XE_RTP_ACTIONS(CLR(CCCHKNREG1, ENCOMPPERFFIX),
> >                          SET(CCCHKNREG1, L3CMPCTRL))
> >         },
> >+        { XE_RTP_NAME("Tuning: Compression Overfetch - media"),
> >+          XE_RTP_RULES(MEDIA_VERSION(2000)),
> 
> +Matt
> 
> I used exact match on the media version here because that's what is
> already used for "Tuning: L3 cache - media", but I wonder if we should
> make it MEDIA_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED),
> similarly to what is done for the primary GT.

Yeah, based on the way they're documenting these in the bspec now, I
think we should start assuming "undefined" upper bound for all of these
until/unless we know otherwise.  In this case it already looks like
PTL's Xe3 media needs the same setting, so we already know this extends
past 20.00.


Matt

> 
> >+          XE_RTP_ACTIONS(CLR(XE2LPM_CCCHKNREG1, ENCOMPPERFFIX),
> >+                         SET(CCCHKNREG1, L3CMPCTRL))
> >+        },
> >         { XE_RTP_NAME("Tuning: Enable compressible partial write overfetch in L3"),
> >           XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
> >           XE_RTP_ACTIONS(SET(L3SQCREG3, COMPPWOVERFETCHEN))
> >         },
> >+        { XE_RTP_NAME("Tuning: Enable compressible partial write overfetch in L3 - media"),
> >+          XE_RTP_RULES(MEDIA_VERSION(2000)),
> >+          XE_RTP_ACTIONS(SET(XE2LPM_L3SQCREG3, COMPPWOVERFETCHEN))
> >+        },
> >         { XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only"),
> >           XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
> >           XE_RTP_ACTIONS(SET(L3SQCREG2,
> >                              COMPMEMRD256BOVRFETCHEN))
> >         },
> >+        { XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only - media"),
> >+          XE_RTP_RULES(MEDIA_VERSION(2000)),
> >+          XE_RTP_ACTIONS(SET(XE2LPM_L3SQCREG2,
> >+                             COMPMEMRD256BOVRFETCHEN))
> >+        },
> >         { XE_RTP_NAME("Tuning: Stateless compression control"),
> >           XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
> >           XE_RTP_ACTIONS(FIELD_SET(STATELESS_COMPRESSION_CTRL, UNIFIED_COMPRESSION_FORMAT,
> >                                    REG_FIELD_PREP(UNIFIED_COMPRESSION_FORMAT, 0)))
> >         },
> >+        { XE_RTP_NAME("Tuning: Stateless compression control - media"),
> >+          XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, 2000)),
> 
> Also in this case, where we are already using a closed interval.
> 
> --
> Gustavo Sousa
> 
> >+          XE_RTP_ACTIONS(FIELD_SET(STATELESS_COMPRESSION_CTRL, UNIFIED_COMPRESSION_FORMAT,
> >+                                   REG_FIELD_PREP(UNIFIED_COMPRESSION_FORMAT, 0)))
> >+        },
> >         {}
> > };
> > 
> >-- 
> >2.46.1
> >

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
