Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607D6C3DA7F
	for <intel-xe@archiver.kernel.org>; Sat, 10 Aug 2024 13:43:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE68C10E0CA;
	Sat, 10 Aug 2024 13:43:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K02t/GVt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A933710E0CA
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Aug 2024 13:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723297387; x=1754833387;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rm9qr2RmX0LZILOOrmObRTjuO5O7Dx0glqPjIPR5x2g=;
 b=K02t/GVt9uxnMxVXTyVwtt/vsTk3pIocxTpXtdqUr2c0RLMEPYE9osRD
 1yZGLisNJsrIL5hFP261BH/wGgIy1tDteqyIH7Iw1BB2T8kne+N3Fwfhq
 HrZ71/vmC3HraF2s0bbsfEck8mSNaA2qMw9Y+2AvQmpW6uaz7gMTgCCm9
 UkriXMCNiKV9u9HJl7p1+A7G+OIfo8LMf/I2eM8WD8aFmqkwSyxlBw2e1
 esn4AHqr/P0PqoJNAztQaSjcOGb9IxBfPW+EMfTm3SwITQmVJpMHI+qT4
 U+OR8higz8BlRfz9wRjkNEEE3sRXTFGPMYOgGoYb1p/PJCmV3siTTpm+r Q==;
X-CSE-ConnectionGUID: HbfrCeyrTbSgrNYgYrTPSw==
X-CSE-MsgGUID: QQ2uQx1eT0u10iG3xRXQeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="21317698"
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; d="scan'208";a="21317698"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2024 06:43:06 -0700
X-CSE-ConnectionGUID: ++SikpS7R2uH9AOx3VfsUg==
X-CSE-MsgGUID: WLEhkwn8Qjyj9tUndpJXJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; d="scan'208";a="58393231"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Aug 2024 06:43:06 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 10 Aug 2024 06:43:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 10 Aug 2024 06:43:04 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 10 Aug 2024 06:43:04 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 10 Aug 2024 06:43:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FGc9PMxemgpW0HbZpJkEIKBphuVj1urZkSXosDfX2zOfIuzB5k+zk7KycRQNadNH0SX/cepooTxRw18bKpjGttFEZuuHfsuoOxDWb+lKznu7G0aqXb7WeoZXQV/adctyBgITdDOSt4WGj4kvQsWqqn+A2EoGP24Xur9CxtZ15Deu6XNgMcu3T5sboRNYhb+wp75Kc7dTi6uMxrMze7rOXj8/kUfVUX2V2J5HaqHi3OT3PchkJDVrCW9TWPJ7H2VMgKjJ9QjZoxnGCUJGd7FPu4dXxTd1O1ZencFBOAYlZUhvlneA/+9gHiaoS0gdR0UFfNglVsA3nNet20Ymprlp8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGu1aOACaM0ZKy+vChgNQfWJbQCUIxfcwJkZfB4MCU8=;
 b=UDyus3EwneN9xoLJNwHNXAop/jJi47TI2OGrhifTTNSvoRzZiTQ5U0dZ3w7rdiBmZwFTqtMw/tve71esEh5Jos8r/D4xtQe4fZuFgwnxtLn6un11PQPRroNpeuTYXZhnVhGJw80oGlSsb45UquGqK8iKBBUMinefCX2Z3olqZlDnufRlHKsxOJhV8Ay8e4R5VPMawlb1hUr2wQqHdfdmFBHs9dmMqshOs4yNcpDiKmohMmB38hh1ZOTDEMAmpmzTIjrWj5ITFeLSRFeiVZ1jGcassweL9Ui/1DR+beRyVoVSpUiME7qs/NDPaC8osU0NC5xzA2CA/vzW9prdHpI2KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5187.namprd11.prod.outlook.com (2603:10b6:303:94::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Sat, 10 Aug
 2024 13:43:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.031; Sat, 10 Aug 2024
 13:43:02 +0000
Date: Sat, 10 Aug 2024 13:41:51 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC PATCH 1/1] drm/xe: Add driver load error injection
Message-ID: <ZrduH7WZvUGDxUSg@DUT025-TGLU.fm.intel.com>
References: <20240809224424.3212551-1-matthew.brost@intel.com>
 <20240809224424.3212551-2-matthew.brost@intel.com>
 <sm7bvlh4s6djffddiywpjuboui6qdzcww3pjvtybt46c2xbp5f@c3s4vcaqe3ja>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <sm7bvlh4s6djffddiywpjuboui6qdzcww3pjvtybt46c2xbp5f@c3s4vcaqe3ja>
X-ClientProxiedBy: SJ0PR13CA0006.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5187:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b18577f-4cfb-4664-f3d5-08dcb9425aae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4Dsr/mJ4R+lNKivQm9bWTurUfitXitAPQ3rj3N30lwohjNYZcijUfgTj6BJH?=
 =?us-ascii?Q?yudBQq4J1xJMOtJC0GUNreaGzkjhp9mlRqoTKHmwXgK8p/05OclBeSGHCheV?=
 =?us-ascii?Q?VfwpxUiZUAW1TS6DtuI4zdBNxJTqalGMFWxFjOhSKkSR4Aq6t8yp2A0O0xQs?=
 =?us-ascii?Q?coBKDy4Yp0UKsZBatdRe0rETI0gRmOcjaXHAnGBLXNuCSYP0LoPawYyJBbXg?=
 =?us-ascii?Q?u5U7LgxkvIU0Du4BqF/DtXq26QA36Sw6alGCszE3ImNygsTDOwNw30X4ChM4?=
 =?us-ascii?Q?PG9Af8i9nClj0shXZYZtPkJemFEUOK1UqmM+vAkc4ihGHhT6Ax/4q8qa54rB?=
 =?us-ascii?Q?Sn/liRYatl7oZ7SBIgMcxhfsUVpyf+Mmv12AtgOjGEBXx/tTbV6mISRcUGro?=
 =?us-ascii?Q?aWgCNMUvzQrWM82kw+/QHW+RiBqmOWMRnlWwrUC6Bvskl9QhvB1CTxUnBYsS?=
 =?us-ascii?Q?FZ4dEpPYMmtcZ1fvS97SVhK3iW9tfuyFjnRMQeB7Wc0ZLQzVJf9rN4k5UGXe?=
 =?us-ascii?Q?wCyyZalY6qp4Uc+zK/W31VGA+K54T9T6QP39pWZhuzN+S2thp+se3zNU0X4i?=
 =?us-ascii?Q?2x1wBW2YExAb7UwA/+Fe7HqMfMNRn0HWfHr6Hlt6VKMbkIOzF+3UG69DydOM?=
 =?us-ascii?Q?Hb0IpoCOPQphdSsGyD060AyeCyIINIV9VQ31T6k9ihLM6TjrrWaIvLvEGGEj?=
 =?us-ascii?Q?vdkTljcUg6/wNvmfMr+XY38xWKkHZQY1aJMKU77Hlgngx7uvpLwA9piCWl7C?=
 =?us-ascii?Q?kLN7d5JPYZ0hQMwy9pl8ONqMa79kHKYexpYpDlXwyznSQx0uFEO/HnmKG4bc?=
 =?us-ascii?Q?D5nwUtIeW5bkXFzsasMNkEphSfSQ+vf2Z8hTSZ5km0j7Xz8BfprzXHYm7Hko?=
 =?us-ascii?Q?RgQLRN6/e7IJuAWvJh8cxlsHawgRkvqEtwTqPGoACKd/PCkvUl0qe14rk/fJ?=
 =?us-ascii?Q?wuQfRFsmSFyjQQcj0mxr9GdRIRDqmT5INR6WflfZAoMO2cz6sPZ8akEs9QPo?=
 =?us-ascii?Q?RNZEVAO/V1K3IvvABCiInbUnxRCXofY5JxXwOJfLfuO/ECyWYGjkdvLSlfQs?=
 =?us-ascii?Q?kYHQVSpWim0FVqDESbPfY5M0GWP8ohRrziMEIHOTfG/MrafBjSFVFhiovX8q?=
 =?us-ascii?Q?Isaaj6WVGONI1tcdBVCU05HMyUQ7uc559/nyEzQrckOMJRPUsFBJwWUdapND?=
 =?us-ascii?Q?D62+oAhCSFrueUVzJAihUCwmdO8fWcL3Kh7P3McYmkOELSs3P1tmLfpD5M5f?=
 =?us-ascii?Q?ETI4/LKdQpHHSPKHSCrOL2suj0MxXktYK+dVDsTA9gckMROIijuAqUNIEKMg?=
 =?us-ascii?Q?Hl0QWuWXPBC5h9qXw1RcOOlJlvdbS3wn3PrBYK2VqGiT4w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wqgkwS1bnoXmr0HCE7C0gchZ4sYWahEp4SF/G0aKMagssaDH1lA0ErzHkVuM?=
 =?us-ascii?Q?tc8V682zNdMtnoiLmSuV1WbDbvZQqtx9ArBU1Y3q8QXLh2hwDdCgP0I7jGH2?=
 =?us-ascii?Q?ZcmE8yDNtRFZ0bJIGfxnPoahU2J3/3nt4IpUgSDr94E14LCb4163w20sTT99?=
 =?us-ascii?Q?rTdaix/xsvop1V/DhtdcdoZIVoNyVxdW0E6cMo3GfGtRjJU1op31GSm1EGYD?=
 =?us-ascii?Q?F4UjS6vNLnO70QDldeZY+Su8hMyYuZS5bN8IwG591s2unVgsAVy36Ba9uhDr?=
 =?us-ascii?Q?mAeL1cj4cti2CY0ad2BPKOtRylu0WL4Ay52t0o/csjqJppkOO5G58kahliLr?=
 =?us-ascii?Q?PDlA+edVypJuKSrduPQIDff8vTeXW4Op8ok0a2g3xOcVJ9d/Sz/sxS9D4AVD?=
 =?us-ascii?Q?SpnwUuDkwRXEg+O/eCY9WwdL9cPJjMRkVIf9HvELFUzPp7jBjpFtrNjPf6Ub?=
 =?us-ascii?Q?ibmiPEDfkqUPyWBoFrXTcaNLLE68BPzmcf6MgGTgdtBUcWJP1nR4IeEaoqcp?=
 =?us-ascii?Q?NAMEW+OaWMZOxMMq77MH0ChgT1+G3H6PgjgecmcE0XAAVCk2U/eU4KxKeyCj?=
 =?us-ascii?Q?zct4UD2RMsqYdLdoMl18Q6meihoL6+bSDvRvUVSqLmoxwuu68OzCM5S6DQ5p?=
 =?us-ascii?Q?dJUS8H6crgypNyd0drBMdwaSlxtfbFPrTAM6CeDDymyq097aEhW8qMzSRBxX?=
 =?us-ascii?Q?Xw/LUHLVv9UYgg4lz9SKydCGBmDOLT4VKXr8mjsh2g61Rz1fxjrteLYh7K0f?=
 =?us-ascii?Q?stlmEOR7wlx6RpuCLy2AdCwRLBVoklBA/Cl74ymowydswnWQAX8B+Pz2ZSb3?=
 =?us-ascii?Q?bS/2IhONhBmevpKdmaIcM4xl+UyyhqrJxgD5911BuZRswk+v7Ka5KDSU9Rda?=
 =?us-ascii?Q?Bo9MuyunF2J3cSMl/dqtE/tSAxU6DNo6eQ9/4ERciqUBbGUV7tnmwZaP8f2b?=
 =?us-ascii?Q?aina65aU6fU7RoEX0Q6dRbF+NOxQJsPt96+SXySuCtx/klcbX5tepGMgY8Jy?=
 =?us-ascii?Q?dit3kVE3vl07L89PQXP83BsmWTtEwEcz8fou7M9Lwm7gwQ+5ldqCY/G/nM6y?=
 =?us-ascii?Q?rV9ubmfNWHQ2fawbrPVlfPZ45eDqf5ws6BUxah80cmBgQ6JtCU9Z3Myze25v?=
 =?us-ascii?Q?3nisgy6a8VVm04KPrJlp2EJSMal0oU1CDAGDkUZH66FpcsOiwMgnLGPOaCQa?=
 =?us-ascii?Q?dfcqU4ASHVbC365MUIg0P+TxUkstEtADPknIPUPQ7Dn2KAoJMhSNEiU2QfV3?=
 =?us-ascii?Q?ivxnBmmMupsh/TBZDLbhVFmFEqNbERG7kvcUj9isSWdrz2CllxU0nva5cGxV?=
 =?us-ascii?Q?jj4dc5nmiHJpv6rVufQMlDURtWfR2Of/zUr19+35JmklEAnAPGPPNuCqzpZn?=
 =?us-ascii?Q?TDO3aZFzWiqkagGhrjSrS4qekIMbF+HQHg456NXoFjmTGUOxvmWn3HdLp+L9?=
 =?us-ascii?Q?FDVoQxiDbyvhl3Y7Vdh+I7tbF1K82EvIowX5ooyTImluVa4LtMvKt5lgQ4sL?=
 =?us-ascii?Q?NsgOIcZ5MYmLC8tNwkODqBT+wf0HHQb2EaG3gasaDtf6vU4CLDpW3PouIjta?=
 =?us-ascii?Q?XQ1lb2V9iAYqW9yhcplkNVFOB/7GAg4fnvuJDvehupz3ioLDyWrjKoqFjpk9?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b18577f-4cfb-4664-f3d5-08dcb9425aae
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2024 13:43:02.1349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 42M3npKEGae1tmq5tUw7792b6QuI/uKd/OTIujjIw6q8Zyv4hT9JIb5cu21hCMpv7PZb9vTwcua1ELIcblUMng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5187
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

On Sat, Aug 10, 2024 at 12:16:32AM -0500, Lucas De Marchi wrote:
> On Fri, Aug 09, 2024 at 03:44:24PM GMT, Matthew Brost wrote:
> > Port over i915 driver load error injection.
> > 
> 
> I don't like much the manual approach, but it's better to get the driver
> not exploding. Then we can think of replacing this.  Some comments below

Yep. I chatted with Rodrigo about this and we agreed their isn't a great
way with the existing kernel error injection to easily get coverage like
this plus a very simple test case [1]. Agree longterm we should not
invent our own things and come up with either a kernel or drm level
solution.

In the short term, yes this better than our driver exploding. View this
as a force probe blocker, so we need to get our driver fixed in a matter
of weeks and this seems like the only viable path for now.

[1] for i in {1..N}; do echo "Run $i"; modprobe xe inject_driver_load_error=$i; rmmod xe; done

> as I think some of the checks are not right.
> 
> 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_device.c       | 31 ++++++++++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_device.h       | 15 ++++++++++++++
> > drivers/gpu/drm/xe/xe_device_types.h |  4 ++++
> > drivers/gpu/drm/xe/xe_gt.c           |  5 +++++
> > drivers/gpu/drm/xe/xe_gt_sriov_pf.c  |  4 ++++
> > drivers/gpu/drm/xe/xe_guc.c          |  8 +++++++
> > drivers/gpu/drm/xe/xe_guc_ads.c      |  5 +++++
> > drivers/gpu/drm/xe/xe_guc_ct.c       |  4 ++++
> > drivers/gpu/drm/xe/xe_guc_log.c      |  5 +++++
> > drivers/gpu/drm/xe/xe_mmio.c         |  5 +++++
> > drivers/gpu/drm/xe/xe_module.c       |  5 +++++
> > drivers/gpu/drm/xe/xe_module.h       |  3 +++
> > drivers/gpu/drm/xe/xe_pci.c          |  9 ++++++++
> > drivers/gpu/drm/xe/xe_pm.c           |  8 +++++++
> > drivers/gpu/drm/xe/xe_sriov.c        |  8 ++++++-
> > drivers/gpu/drm/xe/xe_tile.c         |  4 ++++
> > drivers/gpu/drm/xe/xe_uc.c           |  4 ++++
> > drivers/gpu/drm/xe/xe_wa.c           |  5 +++++
> > drivers/gpu/drm/xe/xe_wopcm.c        |  4 ++++
> > 19 files changed, 135 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 1aba6f9eaa19..f6cd13ed6d20 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -374,6 +374,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
> > 	if (WARN_ON(err))
> > 		goto err;
> > 
> > +	err = xe_device_inject_driver_load_error(xe);
> > +	if (err)
> > +		goto err;
> > +
> > 	return xe;
> > 
> > err:
> > @@ -477,6 +481,10 @@ static int xe_set_dma_info(struct xe_device *xe)
> > 	if (err)
> > 		goto mask_err;
> > 
> > +	err = xe_device_inject_driver_load_error(xe);
> > +	if (err)
> > +		goto mask_err;
> > +
> > 	return 0;
> > 
> > mask_err:
> > @@ -580,6 +588,10 @@ int xe_device_probe_early(struct xe_device *xe)
> > 	if (err)
> > 		return err;
> > 
> > +	err = xe_device_inject_driver_load_error(xe);
> > +	if (err)
> > +		return err;
> > +
> > 	xe->wedged.mode = xe_modparam.wedged_mode;
> > 
> > 	return 0;
> > @@ -995,3 +1007,22 @@ void xe_device_declare_wedged(struct xe_device *xe)
> > 	for_each_gt(gt, xe, id)
> > 		xe_gt_declare_wedged(gt);
> > }
> > +
> > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > +int __xe_device_inject_driver_load_error(struct xe_device *xe, int err,
> > +					 const char *func, int line)
> > +{
> > +        if (xe->inject_driver_load_error >= xe_modparam.inject_driver_load_error)
> > +                return 0;
> > +
> > +        if (++xe->inject_driver_load_error < xe_modparam.inject_driver_load_error)
> > +                return 0;
> > +
> > +        drm_info(&xe->drm, "Injecting failure %d at checkpoint %u [%s:%d]\n",
> > +                 err, xe->inject_driver_load_error, func, line);
> 
> I wonder if it'd wouldn't be sufficient, for debugging sake to use
> "... [%pF]", __builtin_return_address(0)
> 

I think that probably works. I their a way to decode the line number
though? The line number is a bit more helpful can some hex value.

> > +
> > +        xe_modparam.inject_driver_load_error = 0;
> > +        return err;
> > +
> > +}
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > index db6cc8d0d6b8..4f7e9cdac9fe 100644
> > --- a/drivers/gpu/drm/xe/xe_device.h
> > +++ b/drivers/gpu/drm/xe/xe_device.h
> > @@ -179,4 +179,19 @@ void xe_device_declare_wedged(struct xe_device *xe);
> > struct xe_file *xe_file_get(struct xe_file *xef);
> > void xe_file_put(struct xe_file *xef);
> > 
> > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > +
> > +int __xe_device_inject_driver_load_error(struct xe_device *xe, int err,
> > +					 const char *func, int line);
> > +
> > +#define xe_device_inject_driver_load_error(__xe) \
> > +	__xe_device_inject_driver_load_error(__xe, -ENODEV, __func__, __LINE__)
> 
> is -ENODEV the only error we may want to inject?
> 

I was little lazy here, should be easy enough to add another macro (the
i915 does this) to control the error value. But in general I don't think
we really care about the error on driver load as we pretty much always
just fail the driver load.

> > +
> > +#else
> > +
> > +#define xe_device_inject_driver_load_error(__xe) \
> > +	({ BUILD_BUG_ON_INVALID(__xe); 0; })
> 
> if the suggestion above is not feasible, then maybe better to leave
> this outside the ifdef and provide a dummy
> __xe_device_inject_driver_load_error() so we type-check?  Or we can
> type check manually too.
> 

You mean?

static inline xe_device_inject_driver_load_error(struct xe_device *xe) {}

So we get type checking?

> > +
> > +#endif
> > +
> > #endif
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 5b7292a9a66d..3e620314eec2 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -484,6 +484,10 @@ struct xe_device {
> > 		int mode;
> > 	} wedged;
> > 
> > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > +	int inject_driver_load_error;
> > +#endif
> > +
> > #ifdef TEST_VM_OPS_ERROR
> > 	/**
> > 	 * @vm_inject_error_position: inject errors at different places in VM
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 58895ed22f6e..8209079c0334 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -389,6 +389,10 @@ int xe_gt_init_early(struct xe_gt *gt)
> > 	xe_pcode_init(gt);
> > 	spin_lock_init(&gt->global_invl_lock);
> > 
> > +	err = xe_device_inject_driver_load_error(gt_to_xe(gt));
> 
> for the ones I check before this, things are ok. For this and some
> below, I believe they are misplaced because this currently is not a
> failure point. Adding a return error here is wrong IMO because it
> changes the expectation: the function was expecting that after
> xe_wa_init() there are no more failure points so nothing to unwind. If
> you inject an error here, you may be then trying to fix a non-existent
> bug.
> 

I pretty much agree. I really hacked this together as fast as I could
without tons of deep thought as a PoC + to see what exploded (quite a
bit so far).

But our error handling should be robust enough if I coded this a bit
goofy, it should work.

> From what I can see, the a valid point to inject an error is always when
> we are already checking for an error (and if we aren't then we should).
> So they should be always in the pattern as the ones above...
> 
> 	err = foo();
> 	if (err)
> 		return err;
> 
> 	err = xe_device_inject_driver_load_error(xe);
> 	if (err)
> 		return err;
> 
> I think that also means we can do better:
> 
> 	err = foo();
> 	err = xe_device_inject_driver_load_error(xe, err);
> 	if (err)
> 		return err;
> 
> And in xe_device_inject_driver_load_error() we implement it
> to first check `err` and return it if != 0. This way we only even try to
> inject errors in valid points, and don't risk getting problems if a
> later patch mistakenly update the `return err;` with `goto fail;` in
> one place and forgets the other.
>

I do like this (xe, err) semantics with if != 0, but think it should be
seperate macro / function than the one in place as (xe, 0) for cases
without an existing error is a bit goofy.

> 
> 
> > +	if (err)
> > +		return err;
> > +
> > 	return 0;
> > }
> > 
> > @@ -570,6 +574,7 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
> > 	xe_gt_topology_init(gt);
> > 	xe_gt_mcr_init(gt);
> > 
> > +	err = xe_device_inject_driver_load_error(gt_to_xe(gt));
> > out_fw:
> > 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> > out:
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> > index ef239440963c..897815ddf954 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> > @@ -57,6 +57,10 @@ int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
> > 	if (err)
> > 		return err;
> > 
> > +	err = xe_device_inject_driver_load_error(gt_to_xe(gt));
> > +	if (err)
> > +		return err;
> > +
> > 	return 0;
> > }
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index de0fe9e65746..980691c178c4 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -354,6 +354,10 @@ int xe_guc_init(struct xe_guc *guc)
> > 	if (ret)
> > 		goto out;
> > 
> > +	ret = xe_device_inject_driver_load_error(guc_to_xe(guc));
> > +	if (ret)
> > +		goto out;
> > +
> > 	guc_init_params(guc);
> > 
> > 	xe_guc_comm_init_early(guc);
> > @@ -411,6 +415,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
> > 	if (ret)
> > 		return ret;
> > 
> > +	ret = xe_device_inject_driver_load_error(guc_to_xe(guc));
> > +	if (ret)
> > +		return ret;
> > +
> > 	return xe_guc_ads_init_post_hwconfig(&guc->ads);
> > }
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> > index d1902a8581ca..1944912ef9b8 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> > @@ -402,6 +402,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
> > 	struct xe_gt *gt = ads_to_gt(ads);
> > 	struct xe_tile *tile = gt_to_tile(gt);
> > 	struct xe_bo *bo;
> > +	int err;
> > 
> > 	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
> > 	ads->regset_size = calculate_regset_size(gt);
> > @@ -416,6 +417,10 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
> > 
> > 	ads->bo = bo;
> > 
> > +	err = xe_device_inject_driver_load_error(xe);
> > +	if (err)
> > +		return err;
> > +
> > 	return 0;
> > }
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index beeeb120d1fc..76a26aaabb13 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -197,6 +197,10 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> > 	if (err)
> > 		return err;
> > 
> > +	err = xe_device_inject_driver_load_error(xe);
> > +	if (err)
> > +		return err;
> > +
> > 	xe_gt_assert(gt, ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED);
> > 	ct->state = XE_GUC_CT_STATE_DISABLED;
> > 	return 0;
> > diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> > index a37ee3419428..f26c37e3ee3a 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_log.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> > @@ -82,6 +82,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
> > 	struct xe_device *xe = log_to_xe(log);
> > 	struct xe_tile *tile = gt_to_tile(log_to_gt(log));
> > 	struct xe_bo *bo;
> > +	int err;
> > 
> > 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
> > 					  XE_BO_FLAG_SYSTEM |
> > @@ -94,5 +95,9 @@ int xe_guc_log_init(struct xe_guc_log *log)
> > 	log->bo = bo;
> > 	log->level = xe_modparam.guc_log_level;
> > 
> > +	err = xe_device_inject_driver_load_error(log_to_xe(log));
> > +	if (err)
> > +		return err;
> > +
> > 	return 0;
> > }
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > index bdcc7282385c..1d52b1f57f4c 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > @@ -136,6 +136,11 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
> > {
> > 	size_t tile_mmio_size = SZ_16M;
> > 	size_t tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
> > +	int err;
> > +
> > +	err = xe_device_inject_driver_load_error(xe);
> > +	if (err)
> > +		return err;
> 
> yeah... I think this is a valid one, because it means
> "handle errors from this function". As long as it's the very first thing
> in a function, not leaving side effects, it should be fine, And in this
> case I'd do:
>

Yep, I think beginning of most functions in the driver load call stack
is likely the correct placement. Again didn't really have time to do
this perfectly. I'm hoping to find someone to own this full time next
week and your feedback here it helpful to get this done correctly.`
 
> 	err = xe_device_inject_driver_load_error(xe, 0);
> 
> to follow the logic I mentioned previously.
> 
> > 
> > 	mmio_multi_tile_setup(xe, tile_mmio_size);
> > 	mmio_extension_setup(xe, tile_mmio_size, tile_mmio_ext_size);
> > diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> > index 7bb99e451fcc..972b64a9f514 100644
> > --- a/drivers/gpu/drm/xe/xe_module.c
> > +++ b/drivers/gpu/drm/xe/xe_module.c
> > @@ -53,6 +53,11 @@ module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
> > MODULE_PARM_DESC(force_probe,
> > 		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
> > 
> > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > +module_param_named_unsafe(inject_driver_load_error, xe_modparam.inject_driver_load_error, int, 0600);
> > +MODULE_PARM_DESC(inject_driver_load_error, "Inject driver load error");
> 
> hum... are we doing this when loading the module?  I guess
> inject_driver_probe_error would be better as those tests are not per
> module but per device (and instead of modprobe, we could test by
> doing bind/unbind).

So s/inject_driver_load_error/inject_driver_probe_error/

Makes sense.

Matt

> 
> thanks
> Lucas De Marchi
> 
> > +#endif
> > +
> > #ifdef CONFIG_PCI_IOV
> > module_param_named(max_vfs, xe_modparam.max_vfs, uint, 0400);
> > MODULE_PARM_DESC(max_vfs,
> > diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> > index 61a0d28a28c8..409ea10be942 100644
> > --- a/drivers/gpu/drm/xe/xe_module.h
> > +++ b/drivers/gpu/drm/xe/xe_module.h
> > @@ -20,6 +20,9 @@ struct xe_modparam {
> > 	char *force_probe;
> > #ifdef CONFIG_PCI_IOV
> > 	unsigned int max_vfs;
> > +#endif
> > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > +	int inject_driver_load_error;
> > #endif
> > 	int wedged_mode;
> > };
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index f818aa69f3ca..8b278c83128a 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -629,6 +629,10 @@ static int xe_info_init_early(struct xe_device *xe,
> > 	if (err)
> > 		return err;
> > 
> > +	err = xe_device_inject_driver_load_error(xe);
> > +	if (err)
> > +		return err;
> > +
> > 	return 0;
> > }
> > 
> > @@ -645,6 +649,7 @@ static int xe_info_init(struct xe_device *xe,
> > 	u32 graphics_gmdid_revid = 0, media_gmdid_revid = 0;
> > 	struct xe_tile *tile;
> > 	struct xe_gt *gt;
> > +	int err;
> > 	u8 id;
> > 
> > 	/*
> > @@ -745,6 +750,10 @@ static int xe_info_init(struct xe_device *xe,
> > 		gt->info.id = xe->info.gt_count++;
> > 	}
> > 
> > +	err = xe_device_inject_driver_load_error(xe);
> > +	if (err)
> > +		return err;
> > +
> > 	return 0;
> > }
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index 9f3c14fd9f33..64d992c12364 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -231,6 +231,10 @@ int xe_pm_init_early(struct xe_device *xe)
> > 	if (err)
> > 		return err;
> > 
> > +	err = xe_device_inject_driver_load_error(xe);
> > +	if (err)
> > +		return err;
> > +
> > 	return 0;
> > }
> > 
> > @@ -264,6 +268,10 @@ int xe_pm_init(struct xe_device *xe)
> > 
> > 	xe_pm_runtime_init(xe);
> > 
> > +	err = xe_device_inject_driver_load_error(xe);
> > +	if (err)
> > +		return err;
> > +
> > 	return 0;
> > }
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> > index 5a1d65e4f19f..1e738f1d80df 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov.c
> > @@ -102,11 +102,17 @@ static void fini_sriov(struct drm_device *drm, void *arg)
> >  */
> > int xe_sriov_init(struct xe_device *xe)
> > {
> > +	int err;
> > +
> > 	if (!IS_SRIOV(xe))
> > 		return 0;
> > 
> > +	err = xe_device_inject_driver_load_error(xe);
> > +	if (err)
> > +		return err;
> > +
> > 	if (IS_SRIOV_PF(xe)) {
> > -		int err = xe_sriov_pf_init_early(xe);
> > +		err = xe_sriov_pf_init_early(xe);
> > 
> > 		if (err)
> > 			return err;
> > diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> > index 15ea0a942f67..2d25c7b59b0d 100644
> > --- a/drivers/gpu/drm/xe/xe_tile.c
> > +++ b/drivers/gpu/drm/xe/xe_tile.c
> > @@ -124,6 +124,10 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
> > 	if (IS_ERR(tile->primary_gt))
> > 		return PTR_ERR(tile->primary_gt);
> > 
> > +	err = xe_device_inject_driver_load_error(xe);
> > +	if (err)
> > +		return err;
> > +
> > 	return 0;
> > }
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> > index 0d073a9987c2..a3786020838b 100644
> > --- a/drivers/gpu/drm/xe/xe_uc.c
> > +++ b/drivers/gpu/drm/xe/xe_uc.c
> > @@ -62,6 +62,10 @@ int xe_uc_init(struct xe_uc *uc)
> > 	if (ret)
> > 		goto err;
> > 
> > +	ret = xe_device_inject_driver_load_error(uc_to_xe(uc));
> > +	if (ret)
> > +		goto err;
> > +
> > 	return 0;
> > 
> > err:
> > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > index 564e32e44e3b..e558715d8027 100644
> > --- a/drivers/gpu/drm/xe/xe_wa.c
> > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > @@ -821,6 +821,7 @@ int xe_wa_init(struct xe_gt *gt)
> > 	struct xe_device *xe = gt_to_xe(gt);
> > 	size_t n_oob, n_lrc, n_engine, n_gt, total;
> > 	unsigned long *p;
> > +	int err;
> > 
> > 	n_gt = BITS_TO_LONGS(ARRAY_SIZE(gt_was));
> > 	n_engine = BITS_TO_LONGS(ARRAY_SIZE(engine_was));
> > @@ -840,6 +841,10 @@ int xe_wa_init(struct xe_gt *gt)
> > 	p += n_lrc;
> > 	gt->wa_active.oob = p;
> > 
> > +	err = xe_device_inject_driver_load_error(xe);
> > +	if (err)
> > +		return err;
> > +
> > 	return 0;
> > }
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
> > index d3a99157e523..edaad1c93e58 100644
> > --- a/drivers/gpu/drm/xe/xe_wopcm.c
> > +++ b/drivers/gpu/drm/xe/xe_wopcm.c
> > @@ -263,6 +263,10 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
> > 		return -E2BIG;
> > 	}
> > 
> > +	ret = xe_device_inject_driver_load_error(xe);
> > +	if (ret)
> > +		return ret;
> > +
> > 	if (!locked)
> > 		ret = __wopcm_init_regs(xe, gt, wopcm);
> > 
> > -- 
> > 2.34.1
> > 
