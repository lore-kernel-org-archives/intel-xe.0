Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A75D262AB
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 00:13:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D4410E0CA;
	Wed, 21 Jan 2026 00:13:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HOw/7ZgB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D756E10E0CA
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jan 2026 00:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768954386; x=1800490386;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iDjSrBC6SCuUkZprUdshIxaPs1ZW/3BvjpThmHxM/c0=;
 b=HOw/7ZgBdTQCP7ik90acd1M9gT/V7DBLalxEr+n0Y5ejvb7Hvas4avjQ
 8SNeANHmijvFShQbbGVj9ZGmhobRrGJ/vSH4wURXSrl78NOjianPWhHvN
 nzc82djBFmloVV0Vs4wZsSplinc+gtaYtJdULRHhoRwBJ/dq4Y0vTe1QE
 19wJoeEIHUGwsD36Mq6dGQjEVh/fhofDQNngVEJPS2B7GwCRMnUb+J4t7
 r53nr+ZTAAKCMnNC+a3b8zESmpAJdpqQPKRk5T4QBw3ZxZ/6gn5Axp5vN
 izU1npopvV+/5zu0mHqLL9hhVfEADvG5UMyceufAZn/E11WsgXpN1YtLR A==;
X-CSE-ConnectionGUID: YAXYFrXvQkufTEGGMk5oOw==
X-CSE-MsgGUID: UFGq2LlITIu10VtJr8JHFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="81554006"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="81554006"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 16:13:06 -0800
X-CSE-ConnectionGUID: 6D9525ZrTdqff7HcXdAxNA==
X-CSE-MsgGUID: r/WK3I9PQwachxEvjkXdJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="206073455"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 16:13:06 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 16:13:04 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 16:13:04 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.18) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 16:13:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZWd55hPQMajfS3Dmu+BIQ7AUPeqGLOs7vDpd8BtoDD1YR+Q1NJumq6PcFyj/9vvF+0X/MfJSHgc6DDX/jHKGoqR1gfgFuzEJV12+nJ29GXG16m4bQzenBHRfB/Q1z6fFT7NJhpLAROR7z4trRPrjnMhCg3k5aJJRwjyBjhxV1jLva/CG84TyKbiNX6DYx0ABO/gYpVFY8PC+TRGOhB8HsH/asGA/LopPxL4VtI2IuG+oxvx5dRl+/oSseOIGaEd+ymQtMFie+XRzlaHkRuH7lBTTMqIVLkWUO3BLC8fl4A7/HxOWffn8vqtazmuCIGI1+acxxHCuzvWl+iAOmrBhyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cy6rK/I0vAu8hLffHmG6jWsk3d5jFphkcObUIUWZXF8=;
 b=mD7ynyAeNAjYDPt0Wmlxv7H6IpAwM6QSDRUH/Eusc/VKxIXaURBcMbzB4bMX1M4xyOjCcwKLtkuIqUiuzWlp9TIqq0DWRwLDZBY6WoPMaV42BavN5zvGArCMQejmtvy0QnqWFz9w+TM4aqKGzJCI/oMUpjxWm0i2WmJq+XkwnGoxrv4ZlcqIp+KmRxEF2XaadBu8TgJSOtHvckNMd+iBAo/rq5mAfMkuWWWDGY9EnvsIvFesyjYQIF7Tv1ib+LXGDOW9oz2qp6Ye8+nDmfS0p3vuwneYrw7s44czOV2pSMcVHjk3jzarkvafZkXRRZrkFQ74moMRvA9bWZX8pT+XmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA4PR11MB9106.namprd11.prod.outlook.com (2603:10b6:208:55f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Wed, 21 Jan
 2026 00:13:02 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 00:13:01 +0000
Date: Tue, 20 Jan 2026 16:12:58 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 07/12] drm/xe: Extract xe_hw_engine_setup_reg_lrc()
Message-ID: <20260121001258.GP458797@mdroper-desk1.amr.corp.intel.com>
References: <20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com>
 <20260116-rtp-mcr-check-v1-7-d420b9c1a327@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260116-rtp-mcr-check-v1-7-d420b9c1a327@intel.com>
X-ClientProxiedBy: BY5PR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::35) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA4PR11MB9106:EE_
X-MS-Office365-Filtering-Correlation-Id: aaf0d5e8-89dd-4a61-aa49-08de5881d697
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W6Sv3oiUD8hkPL1MzaPTa7GjDFh8e2LdUhO9FU1WPwxm/dyoMfhZOeh3itY+?=
 =?us-ascii?Q?S9HWC++TlQwcHMG9Ky1iHVn/CLquFBTX/sSj8pYPoebYijSAHM1/k3xYSvEt?=
 =?us-ascii?Q?X2McPZgexBAz05bFWEmg3AtyqNoe4V6TGPyjd8IOUeyxpMSGIiw+j9TSHaWV?=
 =?us-ascii?Q?LuNUi3zmkruZO5fKZbNQye5MNwihZuCwgFDPsagLlcpfcZngh1Kzu9oU82bv?=
 =?us-ascii?Q?AlPs9SrNmq0AQ224i769mW4rhOpWzXhaOa+UqSoVrM0YkpGdTCuZXJO6OwsJ?=
 =?us-ascii?Q?NIaht506yuF6fSzb2lP+TMiJPSulZmplcJSG1eM3wLrKQtdztiKiYEycEV9v?=
 =?us-ascii?Q?9EMPZ2gX56cS1QIvIZDSSMRrg6ou/7LXjEsjBOafW43/Oyw9eqOpGVpmEsLo?=
 =?us-ascii?Q?YqDWKsfNDOvkYdZxUg6mzWsQ2TbKxsfJWS8B5OMR9RF2lKJiPfXmm8Yn5O2R?=
 =?us-ascii?Q?ITB4z/KJ7A5XjwjW3rcS1lNWrG6DLV5ggr6rKjBTTodvfogryD/5dKzKXfx7?=
 =?us-ascii?Q?8C+s85bXw5m+q0Pca05qfmXynmElAf/3hknQGWS7A5J263BAeUmAVYjfXkKr?=
 =?us-ascii?Q?OeInDjbAwy3Aa/8xI2IhKKnQdBrB26CgrtAYgwDLteUcLtKlBJVc7ijiTJf5?=
 =?us-ascii?Q?5stOi05A1L4aR50WiQ2GF4xrLJocimCt1tvKvBoC0ib4etNZkLhSZKyzT1wx?=
 =?us-ascii?Q?JiybASLTdrfvc3EqvhLIzkEpl5hxIn+pgyr1USQkJcsPy8X6FDimy6J1FHw+?=
 =?us-ascii?Q?OcCo95NAqUht3Ym7ScK+3TWT652EAcoAG0b6sG8VdZYSLc95Vgz0ecGHIKry?=
 =?us-ascii?Q?UO8QKWkYV//1mFJER8vsC5ce5valdeaZ1euZpLTqxkiHn03qtGzu/4Klp+SE?=
 =?us-ascii?Q?DH/AzivfxHE6jrEMCA7cl8kxE5xMWQJp19VZ5/gQgH2etJaEFN1u2qCvtfD/?=
 =?us-ascii?Q?VAyr0p6aDOlMJueppSHFYnPrEEw9qk79IRo3nZOSu1KXKSY5j8EZtVj65I7g?=
 =?us-ascii?Q?dVNbK+WouqiFvwI+2y8mU4sSvHpx7qyzK45ASvBawaHm95DHT2iGNCPoq33z?=
 =?us-ascii?Q?0DBKn7sqeofsw7l3LgisXIlhvAf7NgYDehogiYXDuBILGIHdJ3ymK3yiBQKP?=
 =?us-ascii?Q?YOwSMOaONTDe6BekeOiJl+H8t3AlSuQuDuLBKttcseULeGQazY7qsM22AVzH?=
 =?us-ascii?Q?trWGW3jTH20hESFhSigjtJDAUomrvMFRuT0JQtHHOyyvGe4bdPGG19+9G4Qr?=
 =?us-ascii?Q?nkaKTZYeMzuk9Oo2bSxjZqIGwk4Aj685WWEI4bpayKGRlMfx9SGHQ3uT0SmE?=
 =?us-ascii?Q?pjv4Ch8Hbi4FwuHj82KNfPwm3ufFSbra4ENUjNxHUeHMXXKfTennNRZjDIgh?=
 =?us-ascii?Q?45XrMWXi3CHlnrzX1BXgJZ/CbDHPgjT2VK1fRwCicrI/IFwnFMgKkedjtzD8?=
 =?us-ascii?Q?jrvZwSXewwGA2LyHTGX1dubfk+vXqIu0Sy/4QrPvXhgHvUYgGH7lNXFS41AC?=
 =?us-ascii?Q?ukaMCsIYeZ7NKk2PZcao+LRUx8zf00WfdR3nmqCwdDWyxHmwfk99Mm+DgaU9?=
 =?us-ascii?Q?7JdEX20nS2CtcmGDKAU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A2YgPNglazBn2zGrn+TnNCEycSxxjQVxgVwR13/z5Iy2WuM2gffiU6oeHTGP?=
 =?us-ascii?Q?aGzo2HkW2lcsqHGCSAkJm2WgwciHDQNvFoLtNr8gk/1masQTlAM1zwpYzbEn?=
 =?us-ascii?Q?ISU63UyWllhD6wxMCi8T/PQdiHhyWS+TCHcFlXujLWTZKCFdq8NrLRRIhsug?=
 =?us-ascii?Q?hlwxmFo0wIRZpUbaNkI9WzcfFwnLgoXIrEHJSyt9a2qckOnvwVBDn7KoPipn?=
 =?us-ascii?Q?ttX2dqNalT9vRYSizCdRrKvcgO5QEng2477+hefA6asnvIrwxmI3ffBZmoCH?=
 =?us-ascii?Q?q3W0g2noPe8mpbXh0TNWkmHOI5E/9gWd/abHZCLto6oDLNu2nVMJCjd1IamK?=
 =?us-ascii?Q?YtcMXRpUCQ6yYPeHJlEzUQ651XcyaZnmD/7aecfY8I2UNyy5qpLQJVCqKVIw?=
 =?us-ascii?Q?npueIgVScmbW3TYf2JAZdtNIqZaVamEsGVO/DZIVbkl9dvI1nOP8PfJRbMok?=
 =?us-ascii?Q?0pvgbkaTUDf7DC9BDk6mDPLs7Wp8gHmdM5yI+vn2wSn6/0AiqPpZ/b3uMPiZ?=
 =?us-ascii?Q?CkqgIbUsUGZCZ/cO63DeSWUIM7Xip7vE8CzcQsLh8PSj9sb4pukE0XZt5+1L?=
 =?us-ascii?Q?9bUMrOPtO4nLQD3C4i+ucuwkThKrwuekHUU+mLwNnAdWtBjOcoG2/ly7ofpA?=
 =?us-ascii?Q?j41qp5KuRuEq2Nz8T2pLDccQJ6quWcL/KZWVENxNKx1KLMoMudOsDyygvcGa?=
 =?us-ascii?Q?bXupuhw9obUtzH+rDvNhG5Svr1z/xfDqcsTFTow9BbXBKtZIkClIyjgAfBxU?=
 =?us-ascii?Q?ce/axjRZH1Wt6Hv9MUQPMEMVc57krmVejNecSWJoE1EgxxB0r9C/CKg5379T?=
 =?us-ascii?Q?H0EnHlhv5dbNnQmlQfkRt8u6guvLbsfhA2fm94DhoXTkoFU9PGz4xodA5wJo?=
 =?us-ascii?Q?wHLRSTUdanQedN2hzOZIQ7D5kuny0fGC0p62V0Xawdg0lUpP5l5fJjSywAyP?=
 =?us-ascii?Q?JLsJvYvot1B9KA3lOw3u49dK5nsIIzCEo/SUs1JLaHSYec5VQLdyf8LEA4Kx?=
 =?us-ascii?Q?hqsbv5B1vqsy7qIq8cZvxegbIQUUeG+pZWUZ485hV/NizmFgHmz+6jYqzBwk?=
 =?us-ascii?Q?7xq7oKdF3KgFq0fZIxCezbph/CtVBlFXmvhVCRMkQG6jizIWHJ9KQ7IvUTan?=
 =?us-ascii?Q?fOyG3I736M1Yr2KlfKvXujAvzQWoowAJ80Qfp1l4voaztylYHuF4kvGWQ9az?=
 =?us-ascii?Q?MkO/jPRxvFONhuEdd4aVq9SXfKET1HBmHSK3nB7uY0WtIs5Y8Ouu7nFStY7I?=
 =?us-ascii?Q?rrb+Occ1M0O3v5BvxMCbhSRVQGFDW+5o5KKUeRfCy8IMDreoA90Jp4nDorpI?=
 =?us-ascii?Q?fXuqg0WFLTmfVvRmcsNQ6Pwvt2SJPJF5nv5NCIw6AC5zzioJjEj0P8lvKg+H?=
 =?us-ascii?Q?qWmej2povajxC/GsY/iG+INU8dJ4waJF1QwYmXfEE6gvkyibUzin4BcHB/D3?=
 =?us-ascii?Q?jCDkNkQu3RqD32a82Y28Ou5iUwhb77K+dJ2BPAUGymGLpE0EhhnSPsxNyBZ8?=
 =?us-ascii?Q?Xp34w1qvtPRSQiK0iNPIGzqtlU1vgQymBANMN5vnKdt1wxEsh7S/n/z+DkG8?=
 =?us-ascii?Q?OjvWQS7ytj711s9jpGLCn/0axow2ER0aVWnktdSCwH75vTA2ExHfxadxDu2b?=
 =?us-ascii?Q?v6YilQZRF5jyQxm5+WYE6Q8/GAUnqrdMyOfuaMBjRm4c8d394lJk955afn2N?=
 =?us-ascii?Q?m3hVvPlvE2uWiWWk8TWc8Y1nChng8mGLdZxdZ1Afc1AGwZ/cmcABmi22QCUJ?=
 =?us-ascii?Q?5EEGUZsUJZB4IVNthYlufMQMjtrxq5Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aaf0d5e8-89dd-4a61-aa49-08de5881d697
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 00:13:00.9400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2BWhJkWyaC1pYCGrH8+5WpxYcWV+Kv97elmZ+lkfREBzQTXQtgFzhJ1MObTWHrVCFM31WXW7KFuHRvEi1ckmHAcGmS/JViKjc8vN0F6KUjo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9106
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

On Fri, Jan 16, 2026 at 07:12:15PM -0300, Gustavo Sousa wrote:
> The steps for processing RTP rules that build up an engine's reg_lrc
> arguably belongs to xe_hw_engine.c and should be encapsulated into a
> function.  Furthermore, we will want to use that function and avoid
> calling xe_gt_record_default_lrcs() in upcoming changes to xe_wa_test.c.
> 
> Move that logic to a new function called xe_hw_engine_setup_reg_lrc().
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt.c        |  5 +----
>  drivers/gpu/drm/xe/xe_hw_engine.c | 15 +++++++++++++--
>  drivers/gpu/drm/xe/xe_hw_engine.h |  2 +-
>  3 files changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 9d090d0f2438..68cd26286956 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -348,10 +348,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>  		if (gt->default_lrc[hwe->class])
>  			continue;
>  
> -		xe_reg_sr_init(&hwe->reg_lrc, hwe->name, xe);
> -		xe_wa_process_lrc(hwe);
> -		xe_hw_engine_setup_default_lrc_state(hwe);
> -		xe_tuning_process_lrc(hwe);
> +		xe_hw_engine_setup_reg_lrc(hwe);
>  
>  		default_lrc = drmm_kzalloc(&xe->drm,
>  					   xe_gt_lrc_size(gt, hwe->class),
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 4d3ee5226e3a..8d239291bc7b 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -374,8 +374,8 @@ static bool xe_rtp_cfeg_wmtp_disabled(const struct xe_device *xe,
>  	return xe_mmio_read32(&hwe->gt->mmio, XEHP_FUSE4) & CFEG_WMTP_DISABLE;
>  }
>  
> -void
> -xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
> +static void
> +hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
>  {
>  	struct xe_gt *gt = hwe->gt;
>  	const u8 mocs_write_idx = gt->mocs.uc_index;
> @@ -411,6 +411,17 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
>  	xe_rtp_process_to_sr(&ctx, lrc_setup, ARRAY_SIZE(lrc_setup), &hwe->reg_lrc);
>  }
>  
> +void xe_hw_engine_setup_reg_lrc(struct xe_hw_engine *hwe)
> +{
> +	struct xe_gt *gt = hwe->gt;
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	xe_reg_sr_init(&hwe->reg_lrc, hwe->name, xe);
> +	xe_wa_process_lrc(hwe);
> +	hw_engine_setup_default_lrc_state(hwe);
> +	xe_tuning_process_lrc(hwe);
> +}
> +
>  static void
>  hw_engine_setup_default_state(struct xe_hw_engine *hwe)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> index 6b5f9fa2a594..7e897620db65 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -59,7 +59,7 @@ struct xe_hw_engine_snapshot *
>  xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q);
>  void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot);
>  void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p);
> -void xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe);
> +void xe_hw_engine_setup_reg_lrc(struct xe_hw_engine *hwe);
>  
>  bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe);
>  
> 
> -- 
> 2.52.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
