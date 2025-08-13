Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89815C87FCF
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 21:37:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F8210E661;
	Wed, 13 Aug 2025 21:37:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GF8OFUVi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A396910E06E
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 21:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755121069; x=1786657069;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=m1P+Pf7i7De4dMQBYCKtUXafKNdw9Fro/5RyqHDRfdQ=;
 b=GF8OFUViFkof/yknM3p1T/PznGWJCn5Oqix55nTo0ebdh+Cd3YrphBBE
 Ps2z3bKPM7mKYKwxy1TwbPgSfzEBZwHdUWfmB+7uBvnuuXWJu3/y/aoYa
 SmI6PKQi5bYByGPcqUFyR831h9/rrufAQ2wgtQevuSHCOyxpz+57FVmfQ
 JLevA6jqiFScRQdd+VHaT+g9Uzpc3D4CkwSHB/FhkUkJlNXjDGLJAZmBG
 4uwUPpkY5Y7RmpGeREjQ8X8rOvVW9o8PJT2VA9/uyzQ+PV5PjjoEAGVUl
 33KJKFW5CUOMYS26KLm7ahxIpKE0lWjhd8Ya3ZgycSlWRvhbyf76f37zC g==;
X-CSE-ConnectionGUID: jh/vjf/1SyWnIOYV2WX6Pg==
X-CSE-MsgGUID: M1aRCBBqSAWLrE9zi7Wpjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68131984"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="68131984"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 14:37:48 -0700
X-CSE-ConnectionGUID: JrT9g8S3R2Ss+/MN1+r+Mw==
X-CSE-MsgGUID: xOvpa20BTgyzsHE/v5DMew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="171918952"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 14:37:48 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 13 Aug 2025 14:37:47 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 13 Aug 2025 14:37:47 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.50)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 13 Aug 2025 14:37:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hxDAbkGloefJ4Sy8dz+a4SPCdFtdVGXiMgxHIcibHTSABtkk1JALYRK4rD4EPCyf8h5JtPpg/k8sAPpuCz/PE2XA4KzRsT6W1NZmCMLpuPH0r38XWNoIKuKvwKAIi3ARxwC0/BPptC+2w0uLF4rrAPRQuBSxCahzduLeE8iO1JVwe2EM91+PY/jsAIVfoJf0K/z377P2UYasQ/d/N7XmdjE5VKPXncRFNexLirybprGmpRrfFA6P7cl6tacCWPN/FRrQmLJndNqP8E1CneA5ogkxKspZePpduWI1TtgWDHSD9zRDd3cn+ECjJhJsje+CTslFLAghusPOxvsfknqW6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2Ulw6zOTGqvecHJXQpvfuQ5OJqG1au9PAXPzx1Zr+M=;
 b=sArEy+6QPZMbyz1nRO+wMyIiRVEH/U2zgtbSWSGNZtGG6n45mewH+LWS560svGAsoDHgxDowgVdSeEzLySilia8z8FF8iaYDX9at3RwIrQIKrhe7xJFpCif1IO3nrkrp0hbiwrmpdpM9tsBlpRe4IgWfqxvIzs93yHzZvSlToeB/Vh9ocm4FivS0hAYlBvDg4o/kOq/yBxZbIt0H8nj3zeZVX9ScC3/ZpVuUPwjgLbMPki9c7yZ3Vck79z8D+K6loF8mUhcmPEgSdQ9J/lDYjak6zEHgIalRIdFIqqGLfOvDBMm+LlI7AFZ5z/o/RiOGMMo1Fe07vEybP9RB6VLAwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ5PPF0DADD6EFE.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::80d) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Wed, 13 Aug
 2025 21:37:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 21:37:44 +0000
Date: Wed, 13 Aug 2025 14:37:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH 11/15] drm/xe: Convert xe_dma_buf.c for exhaustive eviction
Message-ID: <aJ0Fpv73LuczBZqW@lstrano-desk.jf.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
 <20250813105121.5945-12-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250813105121.5945-12-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0074.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ5PPF0DADD6EFE:EE_
X-MS-Office365-Filtering-Correlation-Id: c7b6d65a-4afe-4f8f-7eeb-08dddab1a361
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?YWOqZfRx/LEwheOqDwmQ2V5UPzad8iDYOCR2+uu65wb3ER9EgnObU5i6Zv?=
 =?iso-8859-1?Q?txuT2gFIM6QDbDO2zdTngW0Rf1BCmQivaADw1yGi7oFSyvD3PCoLYCLJFe?=
 =?iso-8859-1?Q?hWQAnAlKCWn2vhociZuRqOLnKFhFQ2zQEZqMWFUSPWZoQZRJw5JMeTVQXn?=
 =?iso-8859-1?Q?rvnplSQlGdXHT06kRtJDZyMGqPrVRi7tyNmz/2wt7ujlcOFVJBjLRFbdQ5?=
 =?iso-8859-1?Q?ciJaUfbEJ6vuzOGi6f+gt1XuKTDylo1iqaTUxCzs0QWkP4jrCp5hPHeZSN?=
 =?iso-8859-1?Q?E5pfSvIpl6n4xuUqwBgHRzFghXysOBUHrluyXj4Ru6rKJLcGEbPkhL9dui?=
 =?iso-8859-1?Q?ioaInYB3Usurna+KNlWSBoWJZxmC8YJN4ZrQ033isSQStEUkWhxKenWdjl?=
 =?iso-8859-1?Q?P20RLf5g7GaXwONE362A+4ip6nhfd8NAurVVRZ1NADVTL371Et2NPQ7wKN?=
 =?iso-8859-1?Q?quynuaWuCVwCtab5Dwbp0iDmpGbTzWjdcLqegFaZIS3hnSFNCxU2z4kZc7?=
 =?iso-8859-1?Q?sxsb6bhRVgAFLffkvVjzlDpue3AvtMXMrAGB/iCSw6SDgzxdw0CIfquzfj?=
 =?iso-8859-1?Q?zFqIVNoJDvBFS0yy4nJFKkc+Wf3lP961g6ellO1YHPMKYWq23Hoj8pwo5y?=
 =?iso-8859-1?Q?+OSEQnlN1ikPD/x9WJdb1F5XR5dxClW9Icy7cACXym5s1hQPjlO7KCh8o4?=
 =?iso-8859-1?Q?MCQL05xIKI/8vtFekBH8s4wj3zwmTR0FG09HXlr6AX6O2Y9aLGBa6dCgnu?=
 =?iso-8859-1?Q?BwCvBPYjJUpbcvZnXprQLzsxmCLHz5gsCD3SUXWAVhLNiapVtc9UDPjIeM?=
 =?iso-8859-1?Q?CAccSNLtgoog4+/C4ntOA9S2FqXcr71jQAScs/LXH9zaYP5R8zQ+9cqbGJ?=
 =?iso-8859-1?Q?cmU9FWz/z0tYwz0ZWf3OmMp4pFfz+6tDjhBs+ZBjGgA+MmvUfMw3XG1jKp?=
 =?iso-8859-1?Q?j5pZ20i6ETTmpLnI46BSuLgZsRsEszrqzyTVh6qfo8B3/1wLvUB7VpDW+3?=
 =?iso-8859-1?Q?ShentH5bIphLrRTqpWijAGIx4fEwyISBeWciB8ie+NeD0Mn9wGVEAYkj70?=
 =?iso-8859-1?Q?Ns70j4CwDsDtaoMcV1chD+8kiUE1oqdR/vE0lw37byJQ25smgz10S/jtL4?=
 =?iso-8859-1?Q?coDplJZVNOqndaoIHRlQDmnLwYeV72HdwTyEfZFCHynXmAYBrZu2Lp7uN/?=
 =?iso-8859-1?Q?KUXzS3x0p4f4J1qK76yQowgbZ/0vUrOt7X1O3uuADY9gXc8YOcvS5rO8ow?=
 =?iso-8859-1?Q?34xaScqqIzIaZbjqjKzySB8BRF7TWQ+vbDWd5RMJn8kR4T+hNOqr8CCeHG?=
 =?iso-8859-1?Q?Hb0OCeBE87VSgT9Q4JZAupazHcFieJJa+EMsT/iSbIU25tzZ037xT9iX8b?=
 =?iso-8859-1?Q?ifRjLq0/hmtWsI+3XoqfeWKLJXNPbUi49hRnyCr/CYiOQUCorIrhk6rkb6?=
 =?iso-8859-1?Q?dqt+sG1nX0mubA07I3Q3W+luJIhz8dtEYvu3bWI8EizXYUrpzwtHaq7A+O?=
 =?iso-8859-1?Q?0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?I/0HoGOSHiVZs8Q4oHJFrOk7HO7nr+vaOQzzKmzuoAR/p4ygd422YsXBjr?=
 =?iso-8859-1?Q?VbH1/0qnjOkTEjMwKkcXSsxt85qcdnZ1UElTk3O95PHte8XRyx2mQus8VM?=
 =?iso-8859-1?Q?PxzF+ydEchgefOpxH1ofWyhmCLrpGnkLG5bf2M47zA1VYPRG/fVAc6AtGU?=
 =?iso-8859-1?Q?uCe8SZnxYJX1cT1Q/g22f8ZkpUqa8OxTDvdsiMztF6d5NQIMzNzhK1CgkA?=
 =?iso-8859-1?Q?dbISVliNeF70snut3slNT6/r5o9Rp2HRf9+1AbSgZXRXCq2FgiEL7Uy7b9?=
 =?iso-8859-1?Q?py4AqA61RfRNbfjHLaXd4T/rHYABYflrVBZoptdtGNuSX/sWRU0YZu8PkP?=
 =?iso-8859-1?Q?H3uVBrUKJyqPLfrml033SygXOSyy+ivM79+hq992n/tAGPNIwhJ8mrnYGj?=
 =?iso-8859-1?Q?kUCiHfZPSjyC0UmitVapSIFom62fM2VsLruZ4A57ocOTatCKrUeojSgPrD?=
 =?iso-8859-1?Q?RtV7+sGjijgFrljtHMMvk3UtPE2CypNz0yb+AWvDDexzL4zHAYapOaVOrU?=
 =?iso-8859-1?Q?RbtaDn72ZBcCT3NM3BU2kpVt8qMLAkmp2IBzAme0X2ilCMlgfJA5/0AdlI?=
 =?iso-8859-1?Q?Cm9Z5JxBM5WN6NVfZT3zQSeqDiTZATY83V898LBDVRV5Vel0/Zk2pICKzo?=
 =?iso-8859-1?Q?D6ASsUHDPOtSX1BpCB2dnjKAltRqOxlK25enqlb4cGwyh6sPpC08rtNPlG?=
 =?iso-8859-1?Q?t7eFcAcWqmfPEbzrAckE1Pj50Z0a7FeQYxR1SwRHtdMGOYG4CfXbvJBAB9?=
 =?iso-8859-1?Q?JlI058KCg9w7KdEmWsGvrTOIRAvaNedMTbIH8y9jSj7YGMnkFQ5ul70KWb?=
 =?iso-8859-1?Q?eXMMy8xWXofz4WKB/LhTrIgmr2FiZhrlV0BrhaDiO9rOiP5G3+zQkNvWOO?=
 =?iso-8859-1?Q?HX2bw5fZKaPdcL+SHm20tkMiW0FADU1QQcgGTHOFlwM1mKNITEc/NSnPIW?=
 =?iso-8859-1?Q?csySahkS2/VrVLKRItCDyup3j0r0LED8sJ1/yTTF5o/KPFTr+dU24DVkmL?=
 =?iso-8859-1?Q?BDyQCuSYBJ5Sz6sh6n1+fb372B2wFoJwLe9piUzpFN81bXvuqnaKRfD2Zk?=
 =?iso-8859-1?Q?rX+Si+vCQhpnmSlF9qOL90IULSnLq69ZKtnFGC3tlTIeBn6cgqeimymFHM?=
 =?iso-8859-1?Q?eT2t8yyW9AJR1z80b99Q6TNTZ0dazClxkvT+xTeIVAMWaYCgzX3v9jGHPa?=
 =?iso-8859-1?Q?CVDc0IU68CJ5w0D4D4fAvFQByQGJwIOemyTrkPhJsfiKC7lFCLEeL+67JZ?=
 =?iso-8859-1?Q?qXQ4nA2hBqHRb/nXABBEeVWWAmrveM7v21xuYjCFQpizQkFuINooqYqJfL?=
 =?iso-8859-1?Q?AH6Xxl1maeN4fLcTd+h12WtQb5erldlUOZjMUku9QzycB+UcVCbrH0b+x/?=
 =?iso-8859-1?Q?rtCB8wpGOKZXdtcJ46KJDN1dd6nmq+GAO5kgk0ddaw0q1otENCgRufArN8?=
 =?iso-8859-1?Q?xMpOuy09kEWqpAdDPzAzvLVGba04WyR3HIVJ7W9Tvkkeqzo3ei3JYCmFFx?=
 =?iso-8859-1?Q?mzuyX/OwvA1liPLqinaBKtqcXmWSXiXa3PFrOUuMbzQpuLUlDfpBFp1AIR?=
 =?iso-8859-1?Q?vef2oCLZGHMrfhabHK2pD64Xio7fWrvf/Obi9Az1PVUNXOlq1TrU8J54/d?=
 =?iso-8859-1?Q?2R1ZSZZNBP3YnsA8mOBVJ6o9vMMLDoACR+qju6SBFC1NaTuLvnw6DjsA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7b6d65a-4afe-4f8f-7eeb-08dddab1a361
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 21:37:44.3235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RaVVpAYqlKgom/UtrkNaKRiSc0keHpIgf8BfosVDjfM6rdtw9nD3FrYqARvIieHk6EFdEHz1miaghOLo4t/OmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0DADD6EFE
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

On Wed, Aug 13, 2025 at 12:51:17PM +0200, Thomas Hellström wrote:
> Convert dma-buf migration to XE_PL_TT and dma-buf import to
> support exhaustive eviction, using xe_validation_guard().
> It seems unlikely that the import would result in an -ENOMEM,
> but convert import anyway for completeness.
> 
> The dma-buf map_attachment() functionality unfortunately doesn't
> support passing a drm_exec, which means that foreign devices
> validating a dma-buf that we exported will not, unless they are
> xeKMD devices, participate in the exhaustive eviction scheme.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_dma_buf.c | 59 +++++++++++++++++++++++----------
>  1 file changed, 42 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index 78a827d4e726..56df1d84df21 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -163,16 +163,27 @@ static int xe_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
>  	struct xe_bo *bo = gem_to_xe_bo(obj);
>  	bool reads =  (direction == DMA_BIDIRECTIONAL ||
>  		       direction == DMA_FROM_DEVICE);
> -	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
> +	struct xe_validation_ctx ctx;
> +	struct drm_exec exec;
> +	int ret = 0;
>  
>  	if (!reads)
>  		return 0;
>  
>  	/* Can we do interruptible lock here? */
> -	xe_bo_lock(bo, false);
> -	(void)xe_bo_migrate(bo, XE_PL_TT, exec);
> -	xe_bo_unlock(bo);
> -
> +	xe_validation_guard(&ctx, &xe_bo_device(bo)->val, &exec, 0, ret, false) {
> +		ret = drm_exec_lock_obj(&exec, &bo->ttm.base);
> +		drm_exec_retry_on_contention(&exec);
> +		if (ret)
> +			goto out;
> +
> +		ret = xe_bo_migrate(bo, XE_PL_TT, &exec);
> +		drm_exec_retry_on_contention(&exec);
> +		xe_validation_retry_on_oom(&ctx, &ret);
> +	}
> +out:
> +	/* If we failed, cpu-access takes place in current placement. */
> +	(void)ret;

Do you need the above line of code? I don't see this often in kernel code.

Nit aside, patch LGTM.

Matt

>  	return 0;
>  }
>  
> @@ -211,24 +222,38 @@ xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
>  {
>  	struct dma_resv *resv = dma_buf->resv;
>  	struct xe_device *xe = to_xe_device(dev);
> -	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
> +	struct xe_validation_ctx ctx;
> +	struct drm_gem_object *dummy_obj;
> +	struct drm_exec exec;
>  	struct xe_bo *bo;
> -	int ret;
> -
> -	dma_resv_lock(resv, NULL);
> -	bo = ___xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
> -				    0, /* Will require 1way or 2way for vm_bind */
> -				    ttm_bo_type_sg, XE_BO_FLAG_SYSTEM, exec);
> -	if (IS_ERR(bo)) {
> -		ret = PTR_ERR(bo);
> -		goto error;
> +	int ret = 0;
> +
> +	dummy_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
> +	if (!dummy_obj)
> +		return ERR_PTR(-ENOMEM);
> +
> +	dummy_obj->resv = resv;
> +	xe_validation_guard(&ctx, &xe->val, &exec, 0, ret, false) {
> +		ret = drm_exec_lock_obj(&exec, dummy_obj);
> +		drm_exec_retry_on_contention(&exec);
> +		if (ret)
> +			goto error;
> +
> +		bo = ___xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
> +					    0, /* Will require 1way or 2way for vm_bind */
> +					    ttm_bo_type_sg, XE_BO_FLAG_SYSTEM, &exec);
> +		drm_exec_retry_on_contention(&exec);
> +		if (IS_ERR(bo)) {
> +			ret = PTR_ERR(bo);
> +			xe_validation_retry_on_oom(&ctx, &ret);
> +			goto error;
> +		}
>  	}
> -	dma_resv_unlock(resv);
> +	drm_gem_object_put(dummy_obj);
>  
>  	return &bo->ttm.base;
>  
>  error:
> -	dma_resv_unlock(resv);
>  	return ERR_PTR(ret);
>  }
>  
> -- 
> 2.50.1
> 
