Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CE3FD88C0
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 22:17:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A0710E78C;
	Tue, 10 Mar 2026 22:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VQdASI36";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF6310E78C
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Mar 2026 22:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773181034; x=1804717034;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ei+SrHu/tQX3P0qJiMWfZMX4G/v+bZEAsBIROvq/mL4=;
 b=VQdASI36jebPa0Egg+XFHDM7MhFBSHvhLKWPoTHTZEEaGm1fl/PQFk8W
 5hx6QXwZ0sF4kf/qqE+sUw4LyLhtGROQjOxP1jkTGPq76EoItC4reKAjl
 o0x7nX7A7hAkEfHdSQK9Ph1vjepz8k3VP9FGije/VsA08qi5S8nmXdVZZ
 SRu/XAqbNfiKI9YB8RjiOzOzeFMiXy8cNKgfTwGRYZHtahGYvuqs2LHyD
 LTxIntq9M2hOPXuoMwcu81wrbieARI0cXd5vTtFpwd/uqCgG/8c5dNpNr
 4bssXBYfjIPd53nvRZweLzNLFEOkIlnyFNGrCSy82s5JUPIl4mlLDSNA/ A==;
X-CSE-ConnectionGUID: SFdEOhRsTc2bpUwO4fDbPA==
X-CSE-MsgGUID: PphZ9/DdSh+61XajXWAyeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74284448"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74284448"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 15:17:13 -0700
X-CSE-ConnectionGUID: ivbtV2AgQXi3HPgllsFdAA==
X-CSE-MsgGUID: VIykKe0eQqW3S5vvpFG2vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="219503742"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 15:17:13 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 15:17:12 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 15:17:12 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.20) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 15:17:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AXRfQtzuYjCjjvwsCYzCPMfwu6kdYiG5YM4R2ZyktUh6YvWYKjQZCBKU88qgWWdzzj0ZyBLjnVgwpbO6NcsBO9Ez0SztZ+WA8l55I8Go3rdklgDfoVhno0C7nXgP6k4yBmLizdevuhB3pKEWH0R0qb+pTMKFMxb2ekaRYRMZltyusfon9S0dtTqR2PsRzFASG/z9LVoRAJgG/J/f1T6enIP/rUuyyzfsmEc8xKcHP/VZUqzuf+samzQHIKSMm+r654EVBvaBCFWFsYMdsgPhJxg316OVDEkB0kf2Ooh5XDaOmaCoWtKB99Ksl33HVpBMuXiM6t2iLsWvp+6CQgTdKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FYTrX6sSzYDoy40A06Xj2RD/sTLQYL/hsaPmXfhAfJM=;
 b=C51b09NA9CY6R6TJw3tbrfU+6zT4MdX3D7Y8JnTv9PUkemkWSZegyh6s/+2jwxBoXQUxIG4wzztz0G8A3Yi2WTggpvmFj0lGiw7vovFr4A9L9Im+Mc2xoJ1ffB5vV/cmXHzGVwgFZ1rBPCtEwrp+QJCguKMB5cr9ZY6NaHmNgBUYqt/SDMPPbFBwFyMygkIXtpGOL8t7PvFDBDAf1a+ewGBKXKpTzNYsgmm7YSK2MwEqI9F+15tSaVLcS5pxcOhv2Rhbll7mhC5ne6EQkyic9zy5d4qGWJyUG8dua6EqIrrCUmGPG4rQFCvxd48Ji59yNToW2uhuG1HV5HTB5LGaPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7432.namprd11.prod.outlook.com (2603:10b6:510:272::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 22:17:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 22:17:09 +0000
Date: Tue, 10 Mar 2026 15:17:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Yadav, Arvind"
 <arvind.yadav@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Subject: Re: [PATCH v3 00/25] CPU binds and ULLS on migration queue
Message-ID: <abCYYllIzH3I3N8h@lstrano-desk.jf.intel.com>
References: <20260228013501.106680-1-matthew.brost@intel.com>
 <545e42a856cbbd924619f4b364242ba1777af0ea.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <545e42a856cbbd924619f4b364242ba1777af0ea.camel@intel.com>
X-ClientProxiedBy: BY1P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7432:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a5fa69a-fcd6-467a-65c9-08de7ef2c528
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: TWlwjAi8SCg97W0sc+vdopqklJDKbSLRFyRcznEjDm6CPGLhq4rhXqsOFmCAyZMkF8jMC+luWev60YFoeailCWNLbl48jL4xIMwvcdgFLD7NiOuwh8oYuSxBNitc/Cob5X0cEi3ixvNX6Ert16RROHFHvJzdqDxh6tRs/IX+11uIGxu+t8shqwPwmwq4IWK6osZqRk3uOgDh14ioAy4tGAQ+NBd245enKPwLx7F4OVNCUiRui2ahyogStDQzzkU8AIFmcigcZUGCYdnz3SBX0zgrGLxrFNOAd+x3VZ0WbA73RaUwnbCIbGqrKTNy5Qwbe7bwVvNFDu1i/ka4csW3i0DYT33KE9xOvu5Ls39Doap8mdIQYmiTnlpGF4CIm+p3cTi5lcE0U/lBvJ282ncNJJjmP+lDtTV0P/Uj9gUPSKCXcQDaSbB0T9ARTYoyW0SWQ+GPwE2kcbGwUPeqtwsye7eHqWGaM+fDDjz8JHn1xBcvL2s6Lciz5IhLpf3kTt2uggsRUFPat26eqzLmGisY2UArGtsL88C65BZgMAHKXJNyicMm7QlM2BY2In1tln9D378kRkRVgyDf8tqun9pUJPoOHwyvFkLEBGhqF+2fMG+/CReTDws0IR1whQfszcmx+jNnH4RwDwgjTxir+0j0HFVGc4BqxsTLZL2irxbyHpn34O8R6dLG8lu7OqYqOQvq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGJTeDVPZ2F5cUpaUXFvR2Z1M3R5c2ZWQjA5U2N4M0V1QlZjUTgvalZsS0Zs?=
 =?utf-8?B?dzk5bmNabWVHY0pubUwyWDlyRDZoRnlxYnVPNjdGZGt5bjdlTndDS0Z4NFNV?=
 =?utf-8?B?dXRLQjRmTkVrOVcrdVQyRFdHZVJnSWhEckJNcHF1aDJlV3Zod3B3SGZLcnQ1?=
 =?utf-8?B?TzNZbExFWlU5TFdzczl4QW1ReFYrTjV5VjZPci9qS1ozVkdMWXNBKzRXQnVN?=
 =?utf-8?B?QTUrUkh4ZFd0TkcrV0NTNVBGNUVZbTBrT1NUV0h4eHg5NWpCUU9CMFJEN0tO?=
 =?utf-8?B?clNnZ3VidGlrcWtHbnNsRUl2WElnMXg4ZFJYRWR5L1Y4QlQxWTFQQ2RibC9s?=
 =?utf-8?B?QkhybUdBYmY5UUxxMVBzM0ZaWmdLWkJlSnlSRDI4K0JKUkQxaElHTVlDMDJp?=
 =?utf-8?B?aUZEdHJTZEdYM0ZNWHZwZnJUKzZmTlZINzkzdkRnZjdRNzRSZHd5ZzhoTVBq?=
 =?utf-8?B?RzRCNkRZT2pRUzFDaGFvNFhUSkdRL2dxdjJhM3FNQ3N2aHFYTVJaWTBGSndM?=
 =?utf-8?B?RzZzQXpKa0ZheU5RK3Z6VmVoODg2L2hLa0dIMW1pVWZ4Um1TeC9LM2lCQjJt?=
 =?utf-8?B?Q1Bzelp5WkhEYi9PS1cvdG52NGxrd0kvMHVxTFRTL3VkRFhZN2d4NDJTMk1t?=
 =?utf-8?B?UlNNcXBWY21PK0d1Rk1tb1FMMTEyZGZicVBDVUk0d2pwQzJOVUZpbzd6dzE4?=
 =?utf-8?B?a3VOZ2ZtY0NveS9HNWl5d3hNSktCcEg3R2l5M0UzV1VGWEY5cGpMTDBuQ1Z2?=
 =?utf-8?B?MFRLaGs3dFBoTlV5ZUdMaWYrSFRmdjBtOGpET2tQd09mdDd5SnJTODVlRDhz?=
 =?utf-8?B?VmxYYk1GMjF3MzJTZmdHc0ZLcnNqYm9YZnc1aDZDNHlseGJUS0d1dnZaMjBX?=
 =?utf-8?B?cVR3VDZRckk3ZkhxblBWc3Z5ZTByMlRhVGR2YkxFY21PRkd6NXNzS0hHKzVn?=
 =?utf-8?B?NG5VbFZHZlhhOXZZVFNOc01tbUpQbFhNQWs1MW9vN2ZrRmdRZ2dTbXdEWk1n?=
 =?utf-8?B?Y1JEcU8yQnlpV1FzTERWSG5QYnU4N3BCTTh2OXZrTHJzTTZDNmlxWEJnOVdX?=
 =?utf-8?B?bUJrUHNodlhJM2VsSFFTRStPOFlWVC9FK2NXTURERjYwMFRzVWlXU2NIVjNv?=
 =?utf-8?B?cXFRQ1l2ZGNBTTVRdFFDUFlGY1VGR2tHSlA1eGlXMVBwd3N2WFpjeEw1ZmJ2?=
 =?utf-8?B?VDAzSGpyc3FXcGkycVpxc1BMYm1YREM3aXNoaFdTMWF3M0dQUVpRNk1iaHFt?=
 =?utf-8?B?LzJCYVpTZlo5Z2x5T0doQmpPU0M4ZGtjV3VGOE5XdXlYdjlVV3d0K0hjRCt1?=
 =?utf-8?B?NjZsZm55UHVKdEFjMko1Snl4Q1hUam9NZUNxZnlaM2NlcWdjUlRXa3ZBTURF?=
 =?utf-8?B?dHBIZlA1OXA2cThkR00wVlJGeE4yWGU3b1liU3ZkdXU3TUZaVXgwL1A4VWJB?=
 =?utf-8?B?MG9OVTdPelJaWnJORXVISHRFNTRxVk5heXRBcUdDNk9uU2NTYi9FbU5NNDRL?=
 =?utf-8?B?UkFBUDFvNTdCeVVMR3hmajhqVjNKOFZWSUJ6U1k4MjU2TG5WRXNPMHpQVkZC?=
 =?utf-8?B?SW1kTU9NV2NYbFpHSjczSkU5RnE3NHlvNTZjK29ZdGxMbzZNMHdGQ29SQlY0?=
 =?utf-8?B?c2JIZlZuREV1KzE2ZUJHblVYWHZCU3hhTkRyTVlCWXFWU2o0Sjg3eUZNZVVP?=
 =?utf-8?B?bEE1eDZUOERjSlY5NzEzRzA4UGRZV0FUcDQyUU4wTFZRdng2cTF5bXZPYlVs?=
 =?utf-8?B?T0RwNmxqUm5JYXBVdURCeXFBWGpSS3RtTEsyNkl5NC9VM2lDMll0SC9WOEdH?=
 =?utf-8?B?amVMNkJNYVJ4UFV0YTRtcURabXlMNFlVWjNEL3pVaUFZaERJdUlTNzhHU2Zi?=
 =?utf-8?B?RHhUQko3SUxVWFJnZi93S05QcE0xMTNCZGI3Zk1KYXVoSHhpTmg4Y2pCNU5l?=
 =?utf-8?B?R2lZQmloOEQ4THZXREwyNnZsNUVUa0I3TVFncnBqa1puc3ZBcjJOMCtaNDlJ?=
 =?utf-8?B?dFlsNFFOc09QZDNaODgzdVdYb2w3dldXdUJTYkVtdjBJREpNdzhzZ0ZwOFpY?=
 =?utf-8?B?akFmL09aeGwzeWpablFReG95UFJIWnNyVkZqN0g4ZFB3ZWh5QXJBNktTVExK?=
 =?utf-8?B?Tkw1SFo3cnpCOFZHcmdQbGlZbEtpeVA3WWFqdUJtYklJSGdINVg1T2I0dW82?=
 =?utf-8?B?RXhRaFBOeExITEFRSWF4dUVhVkRYR0ltWXVYYlZUYW80bGxidmZLMVhZQWd6?=
 =?utf-8?B?VmNvRVdDbXYwaE13U2pyWEY2UWtrS2picFI3bzlMQmxkNy9oc0NPNlJJdTRN?=
 =?utf-8?B?S1lZTzZiWWE4SFEwdkZUSXNyNkhyMEVobHI2M240UmZmQnBscW5pYzA3WjN2?=
 =?utf-8?Q?ugP+23i+qhbtmwPU=3D?=
X-Exchange-RoutingPolicyChecked: NBO4ffx+OsxOP/n7vzxVWA+ZlhkcszPJ1U5XOTzNboCMC4FaCJZlzJUgPwm9FJH3neCYXC0gyFX/KKTWkzKK1XIC3XwAE/STrW072ApbAIz2u5mUR41rhytUD5mDh6KhanOSPgyosQbL/SYIDa9r9XanobRF3pLcET6ATqFISUkbRtQxlHKxZOwcSBNQ6eU2/vQmDgFTVh5crDCn5ZB36cFyroJkgzEgb6/jQESJ4Xx3iqIHEUQx1fcasxhlrABrl3k5IzwdyP0U7tysIUy4gbledgw8gL9ffBYklcWuWJfO0sopCN84EoOFkepB9pN81FP9HJ+dqGEqOSjH3O0mkw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a5fa69a-fcd6-467a-65c9-08de7ef2c528
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 22:17:09.0168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yoFXk2VU8izboOS1Phz1lVv/R79WOHWmRpZBkjiMm38KxWfVISFJIblXuFvhLg81RpCCM+4rYzPNmoAF1FvFyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7432
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

On Thu, Mar 05, 2026 at 03:56:50PM -0700, Summers, Stuart wrote:
> One question I have reading through some of the ULLS patches, why do we
> need to do this in the kernel? This adds quite a bit of complexity here
> that IMO might be a better fit for userspace migration, particularly
> for the userspace that already handles ULLS like L0. What is the
> benefit of doing this in the kernel vs adding a new API to allow some
> kind of opt in for migration in the UMD?
> 

I cover some of this in the cover letter, but I’ll type it out again.
Page faults are handled by the kernel and trigger migrations. For
something like SVM, where we migrate chunks of 4K, 64K, or 2M, this
makes a large difference in performance.

Our SVM stats show that a GuC-based submission has roughly a 30µs
overhead. Now consider the individual copy time on BMG with the fastest
available PCIe: 15µs, 20µs, or 60µs for 4K, 64K, and 2M respectively.
The context-switch overhead is huge in the critical path. With future
devices and faster PCIe links, the ratio between context-switch cost and
copy time becomes even worse.

We also have compute benchmarks measuring pagefault bandwidth, and
enabling ULLS (via modparam) shows multi-GB/s bandwidth improvements.
François and I can provide exact numbers, but we already have a ton of
performance fixes in flight that collectively result in roughly 10×
speedups in compute benchmarks. If we can get SVM operating close to the
PCIe line rate, this becomes a very useful feature for
applications—we’re basically already hitting line rate on BMG after all
the performance improvements land.

I’d also argue that it really isn’t all that complex. It largely fits
into existing concepts and is layered quite nicely.

There are prefetch APIs for SVM, but those require applications to
explicitly call them rather than relying on the device to fault in a
malloc(). Those APIs also speed up when ULLS is enabled. Also, if it
isn’t clear—the only option for SVM is KMD‑driven migration, since we
also have to modify the CPU page tables (i.e., user space can’t just
issue a copy command to migrate a malloc’d buffer to the device).

Matt

> The CPU binding generally even outside of the ULLS piece makes sense to
> me, so I don't think this is blocking particularly. But it would be
> nice to have a little more detail on the above before we move forward
> here.
> 
> Thanks,
> Stuart
> 
> On Fri, 2026-02-27 at 17:34 -0800, Matthew Brost wrote:
> > We now have data demonstrating the need for CPU binds and ULLS on the
> > migration queue, based on results generated from [1].
> > 
> > On BMG, measurements show that when the GPU is continuously
> > processing
> > faults, copy jobs run approximately 30–40µs faster (depending on the
> > test case) with ULLS compared to traditional GuC submission with SLPC
> > enabled on the migration queue. Startup from a cold GPU shows an even
> > larger speedup. Given the critical nature of fault performance, ULLS
> > appears to be a worthwhile feature.
> > 
> > In addition to driver telemetry, UMD compute benchmarks consistently
> > show over 1GB/s improvement in pagefault benchmarks with ULLS
> > enabled.
> > 
> > ULLS will consume more power (not yet measured) due to a continuously
> > running batch on the paging engine. However, compute UMDs already do
> > this on engines exposed to users, so this seems like a worthwhile
> > tradeoff. To mitigate power concerns, ULLS will exit after a period
> > of
> > time in which no faults have been processed.
> > 
> > CPU binds are required for ULLS to function, as the migration queue
> > needs exclusive access to the paging hardware engine. Thus, CPU binds
> > are included here.
> > 
> > Beyond being a requirement for ULLS, CPU binds should also reduce
> > VM-bind latency, provide clearer multi-tile and TLB-invalidation
> > layering, reduce pressure on GuC during fault storms as it is
> > bypassed,
> > and decouple kernel binds from unrelated copy/clear jobs—especially
> > beneficial when faults are serviced in parallel. In a parallel-
> > faulting
> > test case, average bind time was reduced by approximately 15µs. In
> > the
> > worst case, 2MB copy time (~60–140µs) × (number of pagefault threads
> > −
> > 1) of latency would otherwise be added to a single fault. Reducing
> > this
> > latency increases overall throughput of the fault handler.
> > 
> > This series can be merged in phases:
> > 
> > Phase 1: CPU binds (patches 1–13)
> > Phase 2: CPU-bind components and multi-tile relayers (patches 14–17)
> > Phase 3: ULLS on the migration execution queue (patches 18–25)
> > 
> > v2:
> >  - Use delayed worker to exit ULLS mode in an effort to save on power
> >  - Various other cleanups
> > v3:
> >  - CPU bind component, multi-tile relayer
> >  - Split CPU bind patches in many small patches
> > 
> > Matt
> > 
> > [1] https://patchwork.freedesktop.org/series/149811/
> > 
> > Matthew Brost (25):
> >   drm/xe: Drop struct xe_migrate_pt_update argument from
> > populate/clear
> >     vfuns
> >   drm/xe: Add xe_migrate_update_pgtables_cpu_execute helper
> >   drm/xe: Decouple exec queue idle check from LRC
> >   drm/xe: Add job count to GuC exec queue snapshot
> >   drm/xe: Update xe_bo_put_deferred arguments to include writeback
> > flag
> >   drm/xe: Add XE_BO_FLAG_PUT_VM_ASYNC
> >   drm/xe: Update scheduler job layer to support PT jobs
> >   drm/xe: Add helpers to access PT ops
> >   drm/xe: Add struct xe_pt_job_ops
> >   drm/xe: Update GuC submission backend to run PT jobs
> >   drm/xe: Store level in struct xe_vm_pgtable_update
> >   drm/xe: Don't use migrate exec queue for page fault binds
> >   drm/xe: Enable CPU binds for jobs
> >   drm/xe: Remove unused arguments from xe_migrate_pt_update_ops
> >   drm/xe: Make bind queues operate cross-tile
> >   drm/xe: Add CPU bind layer
> >   drm/xe: Add device flag to enable PT mirroring across tiles
> >   drm/xe: Add xe_hw_engine_write_ring_tail
> >   drm/xe: Add ULLS support to LRC
> >   drm/xe: Add ULLS migration job support to migration layer
> >   drm/xe: Add MI_SEMAPHORE_WAIT instruction defs
> >   drm/xe: Add ULLS migration job support to ring ops
> >   drm/xe: Add ULLS migration job support to GuC submission
> >   drm/xe: Enter ULLS for migration jobs upon page fault or SVM
> > prefetch
> >   drm/xe: Add modparam to enable / disable ULLS on migrate queue
> > 
> >  drivers/gpu/drm/xe/Makefile                   |   1 +
> >  .../gpu/drm/xe/instructions/xe_mi_commands.h  |   6 +
> >  drivers/gpu/drm/xe/xe_bo.c                    |   8 +-
> >  drivers/gpu/drm/xe/xe_bo.h                    |  11 +-
> >  drivers/gpu/drm/xe/xe_bo_types.h              |   2 -
> >  drivers/gpu/drm/xe/xe_cpu_bind.c              | 296 +++++++
> >  drivers/gpu/drm/xe/xe_cpu_bind.h              | 118 +++
> >  drivers/gpu/drm/xe/xe_debugfs.c               |   1 +
> >  drivers/gpu/drm/xe/xe_defaults.h              |   1 +
> >  drivers/gpu/drm/xe/xe_device.c                |  17 +-
> >  drivers/gpu/drm/xe/xe_device_types.h          |  11 +
> >  drivers/gpu/drm/xe/xe_drm_client.c            |   2 +-
> >  drivers/gpu/drm/xe/xe_exec_queue.c            | 163 ++--
> >  drivers/gpu/drm/xe/xe_exec_queue.h            |  18 +-
> >  drivers/gpu/drm/xe/xe_exec_queue_types.h      |  21 +-
> >  drivers/gpu/drm/xe/xe_guc_submit.c            |  82 +-
> >  drivers/gpu/drm/xe/xe_guc_submit_types.h      |   2 +
> >  drivers/gpu/drm/xe/xe_hw_engine.c             |  10 +
> >  drivers/gpu/drm/xe/xe_hw_engine.h             |   1 +
> >  drivers/gpu/drm/xe/xe_lrc.c                   |  51 ++
> >  drivers/gpu/drm/xe/xe_lrc.h                   |   3 +
> >  drivers/gpu/drm/xe/xe_lrc_types.h             |   4 +
> >  drivers/gpu/drm/xe/xe_migrate.c               | 585 +++++--------
> >  drivers/gpu/drm/xe/xe_migrate.h               |  93 +--
> >  drivers/gpu/drm/xe/xe_module.c                |   4 +
> >  drivers/gpu/drm/xe/xe_module.h                |   1 +
> >  drivers/gpu/drm/xe/xe_pagefault.c             |   3 +
> >  drivers/gpu/drm/xe/xe_pci.c                   |   2 +
> >  drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
> >  drivers/gpu/drm/xe/xe_pt.c                    | 773 +++++++++++-----
> > --
> >  drivers/gpu/drm/xe/xe_pt.h                    |  12 +-
> >  drivers/gpu/drm/xe/xe_pt_types.h              |  49 +-
> >  drivers/gpu/drm/xe/xe_ring_ops.c              |  31 +
> >  drivers/gpu/drm/xe/xe_sched_job.c             | 100 ++-
> >  drivers/gpu/drm/xe/xe_sched_job_types.h       |  36 +-
> >  drivers/gpu/drm/xe/xe_sync.c                  |  20 +-
> >  drivers/gpu/drm/xe/xe_tlb_inval_job.c         |  28 +-
> >  drivers/gpu/drm/xe/xe_tlb_inval_job.h         |   4 +-
> >  drivers/gpu/drm/xe/xe_vm.c                    | 241 +++---
> >  drivers/gpu/drm/xe/xe_vm.h                    |   3 +
> >  drivers/gpu/drm/xe/xe_vm_types.h              |  22 +-
> >  41 files changed, 1658 insertions(+), 1179 deletions(-)
> >  create mode 100644 drivers/gpu/drm/xe/xe_cpu_bind.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_cpu_bind.h
> > 
> 
