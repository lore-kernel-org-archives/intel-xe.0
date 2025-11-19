Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E9ECF397E
	for <intel-xe@archiver.kernel.org>; Wed, 19 Nov 2025 17:38:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED3310E24F;
	Wed, 19 Nov 2025 17:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SH53jDt0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF8010E24F
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Nov 2025 17:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763573902; x=1795109902;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ziE+3W/+a3vEEtIbx5hU5D7tQdOMFB8uYmbDDq24F2g=;
 b=SH53jDt0nn4FrBEom8SDewtuNRZsKOnoj4mCiIyMuoh7xJMM5y9PqMMw
 w69oz0T3Dx7S1b1ghMgmuUvQyqWsPRp1fpEE7mVcJR+EkDdDc2ETPvscL
 lCh4c36kM6//AginVpkUI0Q4aMocrJZEbZQiM4f4tDb7uUFx9tAVWizaC
 XUZEMxgB2KYv8KrG6jxCeC9Xf77oNyKVpp1N1OsAh6fNNoJLnMFFvQcWi
 cou4wXMEQ+dSVINl7p8effdtt06TdR/RlvoaXZys2LHro15qCfPARkfYc
 C3Pa/NzMpTZBRpUXERLAV+baOcljw4bx600a7fLOuTsZsn3jCnBSyJf+m Q==;
X-CSE-ConnectionGUID: lbv1XPMVTzuzbcHfuvNqVA==
X-CSE-MsgGUID: XINbzGUHSg62scxd1Qalcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="76236248"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="76236248"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 09:38:22 -0800
X-CSE-ConnectionGUID: p/BSL0cmTyeec9oM0iTMQw==
X-CSE-MsgGUID: E4inBl5oTDWApf0jluk+2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="190371202"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 09:38:22 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 09:38:21 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 09:38:21 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.3) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 09:38:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yRIsmlcBQc+HqjqH2euLWa0ia/FBZxAnvuweZ367f6QVqZDr1cZqsmrkjAgtbUesgwUpdec7eWhbu1sa+OvNm52y1awmTOEjw8TStQkMKdEow1jRlXo+jK2xkWKneTPojSbJPPc/DlzQ74/Kh6AC0zAhjmzpp0eO3dELtAFr7luQnl8tFemMJ/7gIeeN6FV+CZkCFcU4KzsX4ttrv4HSadGZJvX7WQPIYHV5ym0QDPAEedl6LwtmfM+SEie2tg6Flz5CI2nkZWgvQyMGTkGoYkgP9D8JlAStLRUyI1WMhj7XmEYv+mAQkGF1HA/1IxWq5LOZQT+gjeLSf1sqCQgJ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MRLE9xG8SH3PiKTjEJkEZKL5lSrxArB6jD+ObiqtGqc=;
 b=pX+vuhq2G5ThkfJM+sX7/zj34T0xtCB868NWyCvyXhKB3llerTVZ3gPXE1rIMUb+2cgi2C5GHNIdWE63Y7YIg/0F4p3lnBLcDpdZvUlcVjQPzZlrP4IborljLB0/5dYsGZaXYzQ3h36+YralfKLG5gi7fACMsJ7E2LMtu4GWxNWRv3YpcGpcjJnozvYPq/9lzjIt9ed4zUkBG48h+9M2hoVxbdR+ce2FViJgdmyN/MFS2YtwPRHDrQoKN3riSKBWgnUQJrQzadXBm70ibuYCHaAfR1l7XSYzjcslcXns/CK682/UgjJnC4PZcJtp2li3xOK1ZErBntbQzTQWLgjI8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4822.namprd11.prod.outlook.com (2603:10b6:510:39::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 17:38:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 17:38:16 +0000
Date: Wed, 19 Nov 2025 09:38:13 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, Tomasz Lis <tomasz.lis@intel.com>
Subject: Re: [PATCH v4 2/3] drm/xe/vf: Introduce RESFIX start marker support
Message-ID: <aR4AhZI4DJe2JJNS@lstrano-desk.jf.intel.com>
References: <20251118114116.3429730-1-satyanarayana.k.v.p@intel.com>
 <20251118114116.3429730-3-satyanarayana.k.v.p@intel.com>
 <dfab58cc-2d70-446c-9041-b980e64da10e@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <dfab58cc-2d70-446c-9041-b980e64da10e@intel.com>
X-ClientProxiedBy: BY3PR05CA0052.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4822:EE_
X-MS-Office365-Filtering-Correlation-Id: ee7be5f8-c5c5-4cec-decf-08de27926be0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Qi6uDo/y9g2IYJzQsObRgeOKpRhFJyM5fN5OxQfl0NbtCEsWRxm/gO1kquXP?=
 =?us-ascii?Q?xPCmz1hr5No/XWt/JmXGb0hLWXgitnxKibtVPGVkNwP5J868zE1+8c23nKNs?=
 =?us-ascii?Q?G8zrg94fi+k/zOl5i73FZB/Gd6K0uM6pn4ltufvNzZY5CrUB8eDMoiSg6uzT?=
 =?us-ascii?Q?BLA02fXbM73BFgFWLYtCiMNic31ZXdSH6mCf6I7ANaa+OZ0jkH255qHd5grN?=
 =?us-ascii?Q?LTDuTpStnvLxJiCzFqjwP2WzRqTi7YvHVeLOXswZ96AFoVt4snMOs8xCvDNE?=
 =?us-ascii?Q?MaOYHwUaEAYOgl8tC7Tl3hiQoG70ITcwvpvhbo14tZC9zvitZ3j4SpuY9ADx?=
 =?us-ascii?Q?n0M1Lc6b81TwS/jVmC8DOnKLAi7Nt0e/SMwxKWWGz6JyXUzpiaP7vTvf9/Fh?=
 =?us-ascii?Q?h11ptCrSzFWJ5L/ZzZThSKxIOag1DTQhBVWouMtgcN7QNCaQdnDMpK29DBGp?=
 =?us-ascii?Q?E41gIcVoOZXXa2FDu7nhcqRs+zUzh0q+gV7B3UiP0XGMyKrZK8MwrrPqPcWD?=
 =?us-ascii?Q?A6AH7bYEzczRJ7CkP0LsXDNtGXgANrlXOKczn166JuR2NUb/3wdMItZFNXan?=
 =?us-ascii?Q?lcG9OqylFiK9NwljJ8OnqLLvu/Www7BgSFQT+qidWDsh1as4EXRcGGSFF8vZ?=
 =?us-ascii?Q?9ze27bSeJS6O9PdkSG3x95PToYM3gUSP7XVxYGo3ZBFBjWFwA88VCvSCT4JZ?=
 =?us-ascii?Q?fwpeWncDGjfDHm4Luv6hRdlZwtW+vyEoi1aSUzV1itD5uxShdmVmnSDL0ko5?=
 =?us-ascii?Q?Zyeh5dhVqxpmdp+IplGNpbvl+DWlr7Gws4vAaYW48fzzMDjCla8GNRnvX6+m?=
 =?us-ascii?Q?t+1JxoCbf1JzDpKfl8S7aJG3UWyM6JFMgSW14gyRtRVE+Ubkgg+RiJW10slY?=
 =?us-ascii?Q?5lkJtg+4eGw4XUAAIKIc0AfGdFx7FhE6+KUs6tPNHh2kBAsEWgLN0curnAqP?=
 =?us-ascii?Q?fRDxMA233YjX9LcbvCYdlGXbuTVt5h7uzhBKtfyH73LEzyK2LzNebMh7GwEW?=
 =?us-ascii?Q?cywKJPuaoNROON4UB4FFVAZhw1i3GL/5sICBQxD09cnEHGPOQHtlX2QZ5/AR?=
 =?us-ascii?Q?cuFIMB2WwiNOMWlgD/pBZmLDHB0JBs/tT3u+0Qo75z1OCaJ+y1d7jxi6UjWs?=
 =?us-ascii?Q?fcG75h4W3jKZ88gHoIhmvX6AFUueolIGYzt73M/e6ev1dBWU5wM6/dlYr7Uy?=
 =?us-ascii?Q?kwrrTEL4orYEvZ5L4Wcj8zfwngKQOWUwE/06mRsEjq8Y9vr1gNQ8vCZlc0lr?=
 =?us-ascii?Q?zdAkce33ZywKdD09inXykSpfrPzCuhRtoNzlGzPsCIvpuq6lP4JOAQz94Hkn?=
 =?us-ascii?Q?vrDYe/OaEjRJVSmdLpgAaree6SAxEfcVjcLiGN02ErtKFBKtvy3hh123aWy/?=
 =?us-ascii?Q?ZsXR8/CykVN9ijftUEcNb4HMF+BiwX92L1Q4JsFnHmMo7yiNihjPH7Esh2kk?=
 =?us-ascii?Q?lZQYmex+KRoaqifTXEiKpp5/fP+/kmxE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e5NHLE+DFRJ9+HmR7v/v61chuo9Jo33nEY5+57KAGCPELyRNaqn61fc7PzdZ?=
 =?us-ascii?Q?V8QNGvo2KhHB5cVzoi5cdwzIEd9iVSvx0E2YpSz969p/alfhM1NENcuu/IDy?=
 =?us-ascii?Q?7CnY21q9ndXlp+1VB3UKdIphhVlLwijiy6Zmx68pcPHcZsey34Ga03i75CKL?=
 =?us-ascii?Q?niydqhn2WUDVO0b1Ustb+DaLTxoojv7DKf8aaTXTHGY5/oAbq9ZRpXFDUjVy?=
 =?us-ascii?Q?T2Km2hQkDTYTug89p6vbeo7pdu/6x/Xi5qBjm6UjyMJxj0vc+/+H3yeUfifE?=
 =?us-ascii?Q?MpOmFR8/XoUmxyNxn7dyvZwdpZuJWAUODFJYr8P3a4OBBbSxtiP7xNLp8nUK?=
 =?us-ascii?Q?Rz897SyDMdKbXKE0jUhuoC5nOVtkpYmhoVM//J6vdUJXpc4BSiGOMLb9QO5c?=
 =?us-ascii?Q?Qp5wv9fD5AqHXyhuvI2d26rP+K/GH5udMPj61g9fFe8vJAnzX8KU7Q1kNk8X?=
 =?us-ascii?Q?0GSt8XAE9LxghyRIwCXcOFfapAvFSKDav1qosTfw9A6FqodXMDUM7p2mW6Mz?=
 =?us-ascii?Q?c1WoNPx6jmBKQuLwm1WbjbJbH9A5o+4yvivb1ujJ0yKl/0fDHd6P7goG5w+v?=
 =?us-ascii?Q?vvLlVIhuIAws11/3mzEqgQtgphLwjNobMxVv+eHZ4taxLD4T7dsWyGIUDkzY?=
 =?us-ascii?Q?vEV9o+94aagk3T4SW+vpWYFuHZRF+sX8JVmP8gGXvyln5DY9hNjw0u7yIST/?=
 =?us-ascii?Q?52M38ElKVgJFJXroaAlxxPWj5wKmRGo/roGkFj9TtjIZLBkjlCJej3JTvgWn?=
 =?us-ascii?Q?OpVxp9YnXEzBceRyQz4AmrI+X/L6L8jILgGL26fLig5YSGbmtkM7r6vl3h0t?=
 =?us-ascii?Q?osmYgc+Xdb/+eIFD3IytBxAfCr+CeEGZ3BMO5/k3xrsV3W2/sJ+KrmTBMWfb?=
 =?us-ascii?Q?cGVeL6A7vuh1W8+17my5BaoT4taVjwoT/jRMwxWB1LUKqZ9EM0QwO5zWZwFm?=
 =?us-ascii?Q?5RxbMXchEYB7yj+rS8YjrkchVz87oXWmYgwEDVru9GV8w1kbhTsINYxcLzbi?=
 =?us-ascii?Q?ATdZpXgwrPBrqfwuvDaSm9Q4XnyelcdcfVyD6WsKWGM3A53wYVRWMANkd5V0?=
 =?us-ascii?Q?CCL3H8kvfHDfCtRLLvC303K8VseEbfKnF15YqfLGJI4uH4bOxpmI/1lDUaWE?=
 =?us-ascii?Q?5INPpNAMVxxUvdNTsP5UrRr/LuImpFLgSiicvpigBeZjl8mckJ2LpeQ1QzZ9?=
 =?us-ascii?Q?S0XbGWyKfHmVoU7klaNc5TtGSKHSsWmRk2fkWpMcLo2fLBsaVkCvD/QGTCF8?=
 =?us-ascii?Q?NIC8uIPMcHgiKQyCJsadfNcKAp2I6oR2Z0M36r1c4Q4z1Rxe8KbD3dNYtjgH?=
 =?us-ascii?Q?lwAPPt5CUIA1nsSqBYYaR6fDyG9eLTa6EWusD8LsU9Q60xfQRozFNe3QipAc?=
 =?us-ascii?Q?nFBfaXcG5DgB2Tevw9ZdMDdG2z3T7nMAhJd8g42k4pbsEvYG6lgOxJ3qz+vW?=
 =?us-ascii?Q?i5JmG6DGhsf0ZoINbf0T1Bo2c07AchpxbcHWdqX9jakl7NLbbM8c8mUJBh9j?=
 =?us-ascii?Q?tBPOQc78uIgrF82o2rqraTVQkaC3FYsyfe7d/KVxuA3cnZrWUqIYAdh0Edq1?=
 =?us-ascii?Q?15ygGXkeLNXr/Mr5+AEP25OrdS0M7HD08b3gt7R1IBN+ROBLdRUIlodTGz6n?=
 =?us-ascii?Q?7Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee7be5f8-c5c5-4cec-decf-08de27926be0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 17:38:16.4046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ir8tTlq7nlmzhODhYZk8vPOUCIHV/YCwiyE7JsNxaXEzEJ3wDYLQp4lRFA9n9960TC/lron9ozL4tsn7jszG6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4822
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

On Wed, Nov 19, 2025 at 06:24:45PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 11/18/2025 12:41 PM, Satyanarayana K V P wrote:
> > In scenarios involving double migration, the VF KMD may encounter
> > situations where it is instructed to re-migrate before having the
> > opportunity to send RESFIX_DONE for the initial migration. This can occur
> > when the fix-up for the prior migration is still underway, but the VF KMD
> > is migrated again.
> > 
> > Consequently, this may lead to the possibility of sending two migration
> > notifications (i.e., pending fix-up for the first migration and a second
> > notification for the new migration). Upon receiving the first RES_FIX
> > notification, the GuC will resume VF submission on the GPU, potentially
> > resulting in undefined behavior, such as system hangs or crashes.
> > 
> > To avoid this, post migration, a marker is sent to the GUC prior to the
> > start of resource fixups to indicate start of resource fixups. The same
> > marker is sent along with RESFIX_DONE notification so that GUC can avoid
> > submitting jobs to HW in case of double migration.
> > 
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Tomasz Lis <tomasz.lis@intel.com>
> > 
> > ---
> > V3 -> V4:
> > - Updated RESFIX_DONE action name and documenation part. (Michal W)
> > - Enable resfxi_start marked by default as sav/restore is gated on
> > Guc version 70.54.0
> > 
> > V2 -> V3:
> > - Fixed review comments (Michal W).
> > - Updated commit message.
> > - Fixed CI.BAT issues.
> > - Added helper function to assert on unsupported GUC versions.
> > - Updated RESFIX_DONE action name and documenation part.
> > 
> > V1 -> V2:
> > - Squashed "Enable RESFIX start marker only on supported GUC
> > versions" commit into a single commit. (Matt B)
> > ---
> >  .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 60 +++++++++++---
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 80 ++++++++++++++-----
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h     |  5 ++
> >  drivers/gpu/drm/xe/xe_sriov_vf.c              | 16 +++-
> >  4 files changed, 131 insertions(+), 30 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> > index 0b28659d94e9..1d84ce07b201 100644
> > --- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> > +++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> > @@ -502,13 +502,15 @@
> >  #define VF2GUC_VF_RESET_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
> >  
> >  /**
> > - * DOC: VF2GUC_NOTIFY_RESFIX_DONE
> > + * DOC: VF2GUC_RESFIX_DONE
> >   *
> > - * This action is used by VF to notify the GuC that the VF KMD has completed
> > + * This action is used by VF to inform the GuC that the VF KMD has completed
> >   * post-migration recovery steps.
> 
> please mention that from 1.27 it shall only be sent after posting RESFIX_START
> and that both @MARKER fields must match
> 
> >   *
> >   * This message must be sent as `MMIO HXG Message`_.
> >   *
> > + * Available since GuC VF compatibility 1.27.0.
> 
> hmm, actually RESFIX_DONE is also available prior 1.27,
> just a meaning of the DATA0 has changed
> 
> maybe:
> 
>     * Updated since GuC VF compatibility 1.27.0.
> 
> > + *
> >   *  +---+-------+--------------------------------------------------------------+
> >   *  |   | Bits  | Description                                                  |
> >   *  +===+=======+==============================================================+
> > @@ -516,9 +518,9 @@
> >   *  |   +-------+--------------------------------------------------------------+
> >   *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
> >   *  |   +-------+--------------------------------------------------------------+
> > - *  |   | 27:16 | DATA0 = MBZ                                                  |
> > + *  |   | 27:16 | DATA0 = MARKER - can't be zero                               |
> 
> and then we can keep legacy definition for the record:
> 
>     *  |   +-------+--------------------------------------------------------------+
>   - *  |   | 27:16 | DATA0 = MBZ                                                  |
>   + *  |   | 27:16 | DATA0 = MARKER = MBZ (only prior 1.27.0)                     |
>     *  |   +-------+--------------------------------------------------------------+
>   + *  |   | 27:16 | DATA0 = MARKER - can't be zero (1.27.0+)                     |
>   + *  |   +-------+--------------------------------------------------------------+
> 
> 
> >   *  |   +-------+--------------------------------------------------------------+
> > - *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE` = 0x5508    |
> > + *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_RESFIX_DONE` = 0x5508           |
> >   *  +---+-------+--------------------------------------------------------------+
> >   *
> >   *  +---+-------+--------------------------------------------------------------+
> > @@ -531,13 +533,13 @@
> >   *  |   |  27:0 | DATA0 = MBZ                                                  |
> >   *  +---+-------+--------------------------------------------------------------+
> >   */
> > -#define GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE		0x5508u
> > +#define GUC_ACTION_VF2GUC_RESFIX_DONE			0x5508u
> >  
> > -#define VF2GUC_NOTIFY_RESFIX_DONE_REQUEST_MSG_LEN	GUC_HXG_REQUEST_MSG_MIN_LEN
> > -#define VF2GUC_NOTIFY_RESFIX_DONE_REQUEST_MSG_0_MBZ	GUC_HXG_REQUEST_MSG_0_DATA0
> > +#define VF2GUC_RESFIX_DONE_REQUEST_MSG_LEN		GUC_HXG_REQUEST_MSG_MIN_LEN
> > +#define VF2GUC_RESFIX_DONE_REQUEST_MSG_0_MARKER		GUC_HXG_REQUEST_MSG_0_DATA0
> >  
> > -#define VF2GUC_NOTIFY_RESFIX_DONE_RESPONSE_MSG_LEN	GUC_HXG_RESPONSE_MSG_MIN_LEN
> > -#define VF2GUC_NOTIFY_RESFIX_DONE_RESPONSE_MSG_0_MBZ	GUC_HXG_RESPONSE_MSG_0_DATA0
> > +#define VF2GUC_RESFIX_DONE_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
> > +#define VF2GUC_RESFIX_DONE_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
> >  
> >  /**
> >   * DOC: VF2GUC_QUERY_SINGLE_KLV
> > @@ -656,4 +658,44 @@
> >  #define PF2GUC_SAVE_RESTORE_VF_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
> >  #define PF2GUC_SAVE_RESTORE_VF_RESPONSE_MSG_0_USED	GUC_HXG_RESPONSE_MSG_0_DATA0
> >  
> > +/**
> > + * DOC: VF2GUC_RESFIX_START
> > + *
> > + * This action is used by VF to inform the GuC that the VF KMD will be starting
> > + * post-migration recovery fixups.
> 
> please mention that @MARKER sent here must later match the MARKER posted in the
> VF2GUC_RESFIX_DONE_ message
> 
> > + *
> > + * This message must be sent as `MMIO HXG Message`_.
> > + *
> > + * Available since GuC VF compatibility 1.27.0.
> > + *
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  |   | Bits  | Description                                                  |
> > + *  +===+=======+==============================================================+
> > + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   | 27:16 | DATA0 = MARKER - can't be zero                               |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_RESFIX_START` = 0x550F          |
> > + *  +---+-------+--------------------------------------------------------------+
> > + *
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  |   | Bits  | Description                                                  |
> > + *  +===+=======+==============================================================+
> > + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   |  27:0 | DATA0 = MBZ                                                  |
> > + *  +---+-------+--------------------------------------------------------------+
> > + */
> > +#define GUC_ACTION_VF2GUC_RESFIX_START			0x550Fu
> > +
> > +#define VF2GUC_RESFIX_START_REQUEST_MSG_LEN		GUC_HXG_REQUEST_MSG_MIN_LEN
> > +#define VF2GUC_RESFIX_START_REQUEST_MSG_0_MARKER	GUC_HXG_REQUEST_MSG_0_DATA0
> > +
> > +#define VF2GUC_RESFIX_START_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
> > +#define VF2GUC_RESFIX_START_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
> > +
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > index 4c73a077d314..08c00b773a13 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > @@ -299,12 +299,13 @@ void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
> >  		*found = gt->sriov.vf.guc_version;
> >  }
> >  
> > -static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
> > +static int guc_action_vf_notify_resfix_start(struct xe_guc *guc, u16 marker)
> >  {
> >  	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
> >  		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
> >  		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> > -		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE),
> > +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_RESFIX_START) |
> > +		FIELD_PREP(VF2GUC_RESFIX_START_REQUEST_MSG_0_MARKER, marker),
> >  	};
> >  	int ret;
> >  
> > @@ -313,30 +314,54 @@ static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
> >  	return ret > 0 ? -EPROTO : ret;
> >  }
> >  
> > -/**
> > - * vf_notify_resfix_done - Notify GuC about resource fixups apply completed.
> > - * @gt: the &xe_gt struct instance linked to target GuC
> > - *
> > - * Returns: 0 if the operation completed successfully, or a negative error
> > - * code otherwise.
> > - */
> > -static int vf_notify_resfix_done(struct xe_gt *gt)
> > +static int vf_notify_resfix_start(struct xe_gt *gt, u16 marker)
> >  {
> >  	struct xe_guc *guc = &gt->uc.guc;
> >  	int err;
> >  
> >  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >  
> > -	err = guc_action_vf_notify_resfix_done(guc);
> > +	xe_gt_sriov_dbg(guc_to_gt(guc), "Sending resfix start marker %u\n", marker);
> 
> shouldn't this be xe_gt_sriov_dbg_verbose() instead?
> 
> > +
> > +	err = guc_action_vf_notify_resfix_start(guc, marker);
> >  	if (unlikely(err))
> > -		xe_gt_sriov_err(gt, "Failed to notify GuC about resource fixup done (%pe)\n",
> > +		xe_gt_sriov_err(gt, "Failed to notify GuC about resource fixup start(%pe)\n",
> 
> add space between "start" and "(%pe)"
> 
> >  				ERR_PTR(err));
> > -	else
> > -		xe_gt_sriov_dbg_verbose(gt, "sent GuC resource fixup done\n");
> >  
> >  	return err;
> >  }
> >  
> > +static int guc_action_vf_notify_resfix_done(struct xe_guc *guc, u16 marker)
> > +{
> > +	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
> > +		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
> > +		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> > +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_RESFIX_DONE) |
> > +		FIELD_PREP(VF2GUC_RESFIX_DONE_REQUEST_MSG_0_MARKER, marker),
> > +	};
> > +	int ret;
> > +
> > +	ret = xe_guc_mmio_send(guc, request, ARRAY_SIZE(request));
> > +
> > +	return ret > 0 ? -EPROTO : ret;
> > +}
> > +
> > +static int vf_notify_resfix_done(struct xe_gt *gt, u16 marker)
> > +{
> > +	struct xe_guc *guc = &gt->uc.guc;
> > +	int err;
> > +
> > +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> > +
> > +	xe_gt_sriov_dbg(guc_to_gt(guc), "Sending resfix done marker %u\n", marker);
> 
> dbg_verbose ?
> 
> > +
> > +	err = guc_action_vf_notify_resfix_done(guc, marker);
> > +	if (unlikely(err))
> > +		xe_gt_sriov_err(gt, "Failed to notify GuC about resource fixup done (%pe)\n",
> 
> hmm, it's not only about that _we_ failed, it could be that _GuC_
> encountered some errors, as there is ERROR_RESFIX_FAILED, so maybe:
> 
> 	"Recovery failed at GuC FIXUP_DONE step (%pe)"
> 
> > +				ERR_PTR(err));
> > +	return err;
> > +}
> > +
> >  static int guc_action_query_single_klv(struct xe_guc *guc, u32 key,
> >  				       u32 *value, u32 value_len)
> >  {
> > @@ -1183,7 +1208,7 @@ static void vf_post_migration_abort(struct xe_gt *gt)
> >  	xe_guc_submit_pause_abort(&gt->uc.guc);
> >  }
> >  
> > -static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
> > +static int vf_post_migration_notify_resfix_done(struct xe_gt *gt, u16 marker)
> >  {
> >  	bool skip_resfix = false;
> >  
> > @@ -1206,14 +1231,21 @@ static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
> >  	 */
> >  	xe_irq_resume(gt_to_xe(gt));
> >  
> > -	return vf_notify_resfix_done(gt);
> > +	return vf_notify_resfix_done(gt, marker);
> > +}
> > +
> > +static u16 vf_post_migration_resfix_start_marker(struct xe_gt *gt)
> > +{
> > +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> > +	return ++gt->sriov.vf.migration.resfix_marker;
> 
> should we protect that with lock?
> 

No lock required - this code runs a per-GT ordered workqueue which has
built in mutual exclusion. 

> also see below
> 
> >  }
> >  
> >  static void vf_post_migration_recovery(struct xe_gt *gt)
> >  {
> >  	struct xe_device *xe = gt_to_xe(gt);
> > -	int err;
> > +	u16 marker;
> >  	bool retry;
> > +	int err;
> >  
> >  	xe_gt_sriov_dbg(gt, "migration recovery in progress\n");
> >  
> > @@ -1227,13 +1259,25 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
> >  		goto fail;
> >  	}
> >  
> > +	/*
> > +	 * Increment the startup marker again if it overflows, since GUC
> > +	 * requires a non-zero marker to be set.
> > +	 */
> > +	marker = vf_post_migration_resfix_start_marker(gt);
> > +	if (!marker)
> > +		marker = vf_post_migration_resfix_start_marker(gt);
> 
> this "overflow" logic shall be in vf_post_migration_resfix_start_marker()
>

I think I suggested the above as well or at least thought about it.

> OTOH by looking at the expected flow, maybe we don't need to track this
> marker at all, as it should be sufficient to always pass the same const
> non-zero value, GuC will just compare it with 0 anyway
> 
> and we send RESFIX_START/DONE only from within this worker, so we will
> never have two parallel recovery sequences which would warrant different
> markers

Yes, I think a const marker probably works. A marker that moves does
maybe is better for debug logging though?

Matt

> 
> > +
> > +	err = vf_notify_resfix_start(gt, marker);
> > +	if (err)
> > +		goto fail;
> > +
> >  	err = vf_post_migration_fixups(gt);
> >  	if (err)
> >  		goto fail;
> >  
> >  	vf_post_migration_rearm(gt);
> >  
> > -	err = vf_post_migration_notify_resfix_done(gt);
> > +	err = vf_post_migration_notify_resfix_done(gt, marker);
> >  	if (err && err != -EAGAIN)
> >  		goto fail;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > index 420b0e6089de..66c0062a42c6 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > @@ -52,6 +52,11 @@ struct xe_gt_sriov_vf_migration {
> >  	wait_queue_head_t wq;
> >  	/** @scratch: Scratch memory for VF recovery */
> >  	void *scratch;
> > +	/**
> > +	 * @resfix_marker: Marker sent on start and on end of post-migration
> > +	 * steps.
> > +	 */
> > +	u16 resfix_marker;
> >  	/** @recovery_teardown: VF post migration recovery is being torn down */
> >  	bool recovery_teardown;
> >  	/** @recovery_queued: VF post migration recovery in queued */
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> > index b73498097df5..64b2ddabd3f9 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> > @@ -49,11 +49,13 @@
> >   *
> >   * As soon as Virtual GPU of the VM starts, the VF driver within receives
> >   * the MIGRATED interrupt and schedules post-migration recovery worker.
> > - * That worker queries GuC for new provisioning (using MMIO communication),
> > + * That worker sends `VF2GUC_NOTIFY_RESFIX_START` action along with non-zero
> 
> drop NOTIFY tag and use trailing _ to create a link:
> 
> 	VF2GUC_RESFIX_START_
> 
> > + * marker, queries GuC for new provisioning (using MMIO communication),
> >   * and applies fixups to any non-virtualized resources used by the VF.
> >   *
> >   * When the VF driver is ready to continue operation on the newly connected
> > - * hardware, it sends `VF2GUC_NOTIFY_RESFIX_DONE` which causes it to
> > + * hardware, it sends `VF2GUC_NOTIFY_RESFIX_DONE` action along with the same
> > + * marker which was sent with `VF2GUC_NOTIFY_RESFIX_START` which causes it to
> 
> ditto
> 
> >   * enter the long awaited `VF_RUNNING` state, and therefore start handling
> >   * CTB messages and scheduling workloads from the VF::
> >   *
> > @@ -102,6 +104,11 @@
> >   *      |                              [ ]        new VF provisioning  [ ]
> >   *      |                              [ ]---------------------------> [ ]
> >   *      |                               |                              [ ]
> > + *      |                               |   VF2GUC_NOTIFY_RESFIX_START [ ]
> 
> ditto, drop NOTIFY
> 
> > + *      |                              [ ] <---------------------------[ ]
> > + *      |                              [ ]                             [ ]
> > + *      |                              [ ]                     success [ ]
> > + *      |                              [ ]---------------------------> [ ]
> >   *      |                               |       VF driver applies post [ ]
> >   *      |                               |      migration fixups -------[ ]
> >   *      |                               |                       |      [ ]
> > @@ -114,7 +121,10 @@
> >   *      |                              [ ]------- VF_RUNNING           [ ]
> >   *      |                              [ ]      |                      [ ]
> >   *      |                              [ ] <-----                      [ ]
> > - *      |                              [ ]                     success [ ]
> > + *      |                              [ ]   success (on marker match) [ ]
> > + *      |                              [ ]---------------------------> [ ]
> > + *      |                              [ ]   error (on marker match)   [ ]
> > + *      |                              [ ] ERROR_RESFIX_MARKER_MISMATCH[ ]
> 
> this error is about bad programming, not worth mentioning here
> 
> for the double-migration case, we expect STATUS_VF_MIGRATED instead
> 
> and in case of error/double migration, VF will not be moved to RUNNING state
> 
> >   *      |                              [ ]---------------------------> [ ]
> >   *      |                               |                               |
> >   *      |                               |                               |
> 
