Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90FDC27C52
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 09:59:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58AF010E8B7;
	Thu,  6 Jun 2024 09:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YmEyxseD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7421810E8B7
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 09:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717667993; x=1749203993;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=EKYhZX8b2WTDfXfJpcR8C5DSVOe+RAU+04OBjrXz3vY=;
 b=YmEyxseD69CnL52Y9wgyqG0XiIEXRu92bf8gdawMHAZOnpqkB2adNW/r
 EOae6mq+Bt9ceLoZAipdMSp3kqdHgv9FpFL5dgSHtCf0KTuLuON6x5U4u
 AxbDKmp7GvGoY3xWDgwvC/Ut3OlwmhVrPFiH1Z4NcItCGiiJUOPJ8ygpQ
 nxGlx1sXeOiZEHi6G92p3i34/mNLCPfr98YDUee3aq73PZpcqvpCm4xXA
 2k0kwoOCj+0MTyFPj7/2G54LoIOg4h0QdeR907MxChAP0vKjQRO3OuB2r
 xxC7P059ksVQWxnU0YkLDaInLR621Z5NW3EJkfMixqEuJquEBPgt0ZfKY w==;
X-CSE-ConnectionGUID: I486MW2RQAOymibtdG0Szg==
X-CSE-MsgGUID: uDL2mmMUSISdflNeWvz58w==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="31824241"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="31824241"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 02:59:53 -0700
X-CSE-ConnectionGUID: 2Avi2e/BQfi5/uPUacV4zQ==
X-CSE-MsgGUID: BA50xsNXQliMafAYnDlrmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="38354452"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jun 2024 02:59:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 02:59:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 02:59:52 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 6 Jun 2024 02:59:52 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 02:59:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1cjip7ekjjOFDbZ8BP0eZj3SbTT8NdswkAFtJw63rQL6B7cOYASky+dDD+cJFPhilbWScw1GyJP7TgFpLC8aZSNksEO/6ObQ8KQU3SW9/WlrAIpI4j9kRMaaxSNoI1dnzI1hEvCvfsCTX03lUlOwp2kiT/fYmo7YX2E/Lu9mK6U21AEIWlian3GUXocUaFDPG1wDBB4UccJW6ARXpi1fBWfKjnYIEp9eNOsg2i831zMq1p5KfzWzDtOX946a2A8zpJWi7SWxJaibBVEdijexTqWP204DzlW2BIQUunZTMmowRdGn1j9e/Qdwk3Qnf8qfQGYGVOCfIl0p5glE36eow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EaqSzJtEEE+asmIqNmZB59iRSD7Zm89zIr6ccbLKA4s=;
 b=Rw135CWiblLgKL3JCb3/5E0hJriKt/eGI7zPzutPuuV9cPSzbOK6wtLHatdi4BcjkDXnST54XWTmjlXGb1VcsWnFVCBJrWYxQffZ3tTurIsFjBC9+1WibZbPO2XH8FSqUqzAmJgC/1h43Ng/3W6GCQKj4iihqae6srVjWrjLoocGIs54NPxVsqaeHE3eIiq8UwSV+C4xD5P4nxIeMewxRhtSaDkzypaSp5qY/outiQ+3YXXWLoLbzGPDOdQZVki3MV7ZZeSuAniIUHFKBXV7oSl0myGx/snkznU4Yi+WuZT5Q1MEOxdao05FkM8gTv9tAqF28NBzEEpcEZKFsHpHmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SJ0PR11MB5216.namprd11.prod.outlook.com (2603:10b6:a03:2db::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 09:59:50 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%3]) with mapi id 15.20.7633.021; Thu, 6 Jun 2024
 09:59:49 +0000
Date: Thu, 6 Jun 2024 11:59:43 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Souza, Jose" <jose.souza@intel.com>,
 "Jablonski, Mateusz" <mateusz.jablonski@intel.com>
Subject: Re: [PATCH] drm/xe: Drop EXEC_QUEUE_FLAG_BANNED
Message-ID: <ZmGIjwoJdj1EKqIU@fdugast-desk>
References: <20240604184700.1946918-1-matthew.brost@intel.com>
 <CH0PR11MB5444AE223F9CEA03E93C37E6E5F92@CH0PR11MB5444.namprd11.prod.outlook.com>
 <ZmDg8mpQ1J0lF9D7@intel.com>
 <ZmEjMXSuOL36tiQ0@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZmEjMXSuOL36tiQ0@DUT025-TGLU.fm.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR3P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::7) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SJ0PR11MB5216:EE_
X-MS-Office365-Filtering-Correlation-Id: eea2445e-c65e-46bf-47ca-08dc860f6768
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?pLpyDif5XuDJWGSF4mw76puVIXc9x2AoxN7YYbs1e7cUhdh+4/BOleBPMx?=
 =?iso-8859-1?Q?nRVc4nZ6OBQQRpKxXMntrpF9RcMQ5FAQSrwUKwEGfRzcZI+sBeOm0m/6vQ?=
 =?iso-8859-1?Q?c7DSPTHYv7ISWZLHicsbFyPbmrcSZ+vxreca4HwE5BuSIFTiCGq82SCeR6?=
 =?iso-8859-1?Q?GiCRLWsLtyKNi/Xc/vS/tgD/6hV+q5GTfe8MwgPyrW1HRBAscvsgH/oWbc?=
 =?iso-8859-1?Q?VnLVcvetHU2xDQwxI9vTGu3P31hv9tVIAw6IORqdnF8rkop+J4n0OhyQCF?=
 =?iso-8859-1?Q?zt1pGqpPmSUXCLzqHydM5RpggMDN9/a+8tpJK8jKzErRWpNwPmTLu2NLyz?=
 =?iso-8859-1?Q?ri8bzd6L5GqIzQzF0GMARZOpvVU2mTyJHJyI1e2lCB4yfNWg/27oVsKhGC?=
 =?iso-8859-1?Q?XyCD7BZP887Yyepl9oqk2nFDCc17K4IJARnd/D4xX4unme8cr/+cRDAMUe?=
 =?iso-8859-1?Q?NEQRTnj4Q5mMMKipP9catHkhk+z9qO60zGj/r+d+SGexe9ZaldHO5F4eyB?=
 =?iso-8859-1?Q?lfD7O/p+Bbb/17aD5JivhqNInYaejiOCB5FeuaLUm4n5Ji6O0xUsi4J4F4?=
 =?iso-8859-1?Q?f/HgI+rQB86pRlKmc5jkicyOqACj01z0sykbe/HrdVV76gPYlNGinQilSs?=
 =?iso-8859-1?Q?YGVyYzabh8t6ub/hCkMt19igpoPXuFG+1S1x/W12iPtGsntdzsGsTIMdjm?=
 =?iso-8859-1?Q?cGnHIG89aZO1lBFS8xtvmrFiJWsY5yrG/woKgUEUtF0vg4B5fDYqk4natL?=
 =?iso-8859-1?Q?qdztVWtcuQ5hPpDwfqLN3A0NCk/NqUs+TiUFWTk194hRthpusyEnj0mnRY?=
 =?iso-8859-1?Q?EVc7XOwKXjyXEg0lW0BldghIEO5GUTRdHho1Na13fgsvFt/mZjEmcpEawo?=
 =?iso-8859-1?Q?t8z4M0biua0E9O6R8loEdKiKskRmJGnPj3pCP/XcRwhtczprAJF0h72KLQ?=
 =?iso-8859-1?Q?uR0OwXdwvgFiSiJGsdv8w3G1B0vKbGIhQ8VfwELsTBDmUZzeRZ21Vks/3C?=
 =?iso-8859-1?Q?joBpGUPI5RiqhTGzaFIu8pCZxF6m/OZIvDT3tIqkOWmApwv5/tHpQSvC4Y?=
 =?iso-8859-1?Q?hk8NQWVXq1ZS4eHWbNIlgUDqhKWNyMKe4p+UXKf6qODv+DuhIF6a+Mc2V2?=
 =?iso-8859-1?Q?MFhSqIdLgH+PTCU7PKKxCZHcKdp8f0aH/U3KnztdRVDTABeyt9kVzSdgBl?=
 =?iso-8859-1?Q?8UmlJWbXTgxARy3REZwG//LXma1fzFlj0iwqssjJgwsCn/2abW7T2W2H66?=
 =?iso-8859-1?Q?NhoxpF3s4H9NtHRPwSzMvWdl5nCq/w1fP94kycwjjHEYvFn9y95zz8MS/9?=
 =?iso-8859-1?Q?9xNX51+C3+YYPw6TeSCDa2to7KVb4x0AGhmb4m1B02Jq+NB/wmG55RV9Ze?=
 =?iso-8859-1?Q?xoDONAVlCK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?eN4HtmnjecRMsDlrhifeFMbJN7skMMXkrUaabolCukw4yND193Dnqf08Xi?=
 =?iso-8859-1?Q?LY7JhZMbCSp/ilFI7e/BJ9cdpJQgg4nb7L260fi+2AVlMZTfQgEi3vO0ZL?=
 =?iso-8859-1?Q?LumffbpKjDdYELRSb1KUDfK/0f5dDUXxuQujmajPHxkdy1j17ffSJVXBFD?=
 =?iso-8859-1?Q?tPhkBsW8E2ndIrfhN6QOqumnSrcUMZ5RyRlnjthUcNyN8DGzCI15fget3+?=
 =?iso-8859-1?Q?dWsRu8cfgy/jrcUn6803cmUuQvdMqcCkS5obXwZHG7i3l4jOCfWNTDKq22?=
 =?iso-8859-1?Q?H1p+jAP/Ctul1LCZHuEiw1yV/eBNOHE/tXDRas6oJhZ5mGcoZ2T7baMlgZ?=
 =?iso-8859-1?Q?3ZEQPBCZTz66cFQDA4XdcG7p0+gWOMt98bGVgQucmAO0KVZ0SLxilh0Udr?=
 =?iso-8859-1?Q?WwMDyAIVOZNAdxkIR/bzowaEyVbiSgB3kBfR704x4WYbMuStX0GjFcucMy?=
 =?iso-8859-1?Q?ekb6VzwBnDpbWR0olwi0hxLk4bpphpBYVAo8yPpB3qVy0iT0h2Drf4Po+B?=
 =?iso-8859-1?Q?Fj6CkKwxjxlywjOv0wAftsGX6v1px/aLBTin5ieX7zm/DG9/b+1kfa2l9r?=
 =?iso-8859-1?Q?0S2DONSphk6gora07onAofgUP5jNSWGlyaMEh2RdDRZ/Fq9DMr26fPN51G?=
 =?iso-8859-1?Q?f3cTkoftI5nBYt4Wxwlh/9r3zaM2g7MgR/vwihB7U2v4INXBhN6TuMhB09?=
 =?iso-8859-1?Q?Y7xTCdt1iniEenLqk/COdNp7igZQga+t/XuAUv/zAl/MkV8cmi4iF6xm/+?=
 =?iso-8859-1?Q?6DQ3HL9voue3Is7L4dcHH13B9AG3ddWlkOWOywgcnAkksewKpuTKj0Qh3i?=
 =?iso-8859-1?Q?9epVaSv/MGP0Y5g4UGQmO/Qt5BSDDPztpPDnLJLDI0m68+Ip4Ifro3koWy?=
 =?iso-8859-1?Q?AlblH6Z83k7qNnTFSznXEmSjlrv28Z3v66X43WsRgeaJNQQfEBiiB3BuIM?=
 =?iso-8859-1?Q?tIjBfZ8Oi3O9HI/H5/WpIc1cpm7n6X5gHvSNMAA8GeaWsUTnoY8gxjgUdj?=
 =?iso-8859-1?Q?MQ9Nzr2aK4ehAratqwF3vReYKDJW2JWajEqv9UYayX4QKWKdqMjwfDR+3o?=
 =?iso-8859-1?Q?WB4sFQ9k2DjZoiOKVRjJ/p7zzHbt2CMRkhohlQ64JCRiWUvJam6AL1kCff?=
 =?iso-8859-1?Q?/x7yf/XP2H4xiXVfqizn7SxZ54/pTH3xlO4jjRFXkcsoSc8e/Sm29g6ftw?=
 =?iso-8859-1?Q?3HNUInlVPuEEmXszsKYx8KcUjIkJ0dA0r7XRbaCaPnQbuKWskB6c7npL0T?=
 =?iso-8859-1?Q?pOnek1pOgKhLT9aXFkD0Weggb6mWybLcfC24gG5FfGAh+9AY1gNEbqulBt?=
 =?iso-8859-1?Q?potqjMSarytp3se+8OvMoYydfx0UR3D2oaj845U+E9Y7eit3PLj3QLzyqW?=
 =?iso-8859-1?Q?YzJg6gaavgwv5WnOTSSlDfogwoGe1Vs7vObuZAJvyjWxrcl5OQcho0ItMx?=
 =?iso-8859-1?Q?AXUydftC8ms33rXef1ZqGMFbxNSYhHIMxYyG4+MRIEv8y7Z22dYZFoStnM?=
 =?iso-8859-1?Q?kCQOBUGDN4j026/9ioTfnuWPJb8fU2HUfETs533qtAyuobu40NyS5O7+FO?=
 =?iso-8859-1?Q?9Zs3heeUDB6hdt5VR1N5lG5DSJv4BbrHP6d64fOXLYJNagnc7TZl3cUK0b?=
 =?iso-8859-1?Q?uRUlIs+/EGCdDD6Qag3ixcMjGFKwwpxkHogJQJLhQEgDrkjgXO/CATvA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eea2445e-c65e-46bf-47ca-08dc860f6768
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 09:59:49.8540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tl53d8Nt2LSwWnWKbAD1qtWVSb+4Ce1TTv7utHbsnGhvnS7jJT7oRhGTmN9+i2bPQzLX1lInbD0l/T46q5igoWQrZB2n5e0kMeO08+4lA2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5216
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

On Thu, Jun 06, 2024 at 02:47:13AM +0000, Matthew Brost wrote:
> On Wed, Jun 05, 2024 at 06:04:34PM -0400, Rodrigo Vivi wrote:
> > On Wed, Jun 05, 2024 at 09:01:06PM +0000, Cavitt, Jonathan wrote:
> > > -----Original Message-----
> > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew Brost
> > > Sent: Tuesday, June 4, 2024 11:47 AM
> > > To: intel-xe@lists.freedesktop.org
> > > Cc: Brost, Matthew <matthew.brost@intel.com>
> > > Subject: [PATCH] drm/xe: Drop EXEC_QUEUE_FLAG_BANNED
> > 
> > please prefer drm/xe/uapi: when the changes impact uapi.
> > 
> 
> Got it. Will be more careful going forward.
> 
> > > > 
> > > > Clean up laying violation of setting q->flags EXEC_QUEUE_FLAG_BANNED bit
> > > > in GuC backend. Move banned to GuC owned bit and report banned status to
> > > > upper layers via reset_status vfunc. This is a slight change in behavior
> > > > as reset_status returns true if wedged or killed bits set too, but in
> > > > all of these cases submission to queue is no longer allowed.
> > 
> > This is an uapi change that is in use by mesa and we cannot regress.
> 
> Agree.
> 
> > We need to ensure that no user space is really using that before we can
> > apply anything like this.
> >
> 
> I don't think affects the uAPI. The killed bit is only set after
> removing exec queue from the FD or the FD closing. In either case, the
> exec queue is not accessible to the user by the time this bit is set.
> 
> The wedged bit is slight could be a change behavior but I'd argue this
> is actually fixing a bug. If we set the wedged bit, we skip setting the
> banned bit. IMO this fixing bug in the wedged series - when we wedge an
> exec queue it should not longer be available for the user to used. 
> 
> Now that I'm typing, I realize beyond that all IOCTLs return -ECANCELED
> once the device is wedged so this change likely isn't even visible to the
> user.
> 
> In any of these cases - killed, wedged, or banned the exec queue is no
> longer available for use by a user too.
> 
> > Cc: José Roberto de Souza <jose.souza@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > 
> 
> Again will be more diligent about Cc stakeholders on uAPI changes. Let's
> get everyones input here.

Cc: Mateusz Jablonski <mateusz.jablonski@intel.com>

>  
> Matt
> 
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_exec.c             |  2 +-
> > > >  drivers/gpu/drm/xe/xe_exec_queue.c       |  2 +-
> > > >  drivers/gpu/drm/xe/xe_exec_queue_types.h | 12 +++++-------
> > > >  drivers/gpu/drm/xe/xe_guc_submit.c       | 10 ++++++----
> > > >  4 files changed, 13 insertions(+), 13 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > > > index 97eeb973e897..4cf6c6ab4866 100644
> > > > --- a/drivers/gpu/drm/xe/xe_exec.c
> > > > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > > > @@ -141,7 +141,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > > >  			 q->width != args->num_batch_buffer))
> > > >  		return -EINVAL;
> > > >  
> > > > -	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_BANNED)) {
> > > > +	if (XE_IOCTL_DBG(xe, q->ops->reset_status(q))) {
> > > >  		err = -ECANCELED;
> > > >  		goto err_exec_queue;
> > > >  	}
> > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > index 27215075c799..cf45df0328da 100644
> > > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > @@ -677,7 +677,7 @@ int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void *data,
> > > >  
> > > >  	switch (args->property) {
> > > >  	case DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN:
> > > > -		args->value = !!(q->flags & EXEC_QUEUE_FLAG_BANNED);
> > > > +		args->value = q->ops->reset_status(q);
> > > 
> > > LGTM.
> > > 
> > > Maybe migrating over to using q->ops->reset_status could be done later, and
> > > instead we could just check the EXEC_QUEUE_STATE_BANNED flag directly for
> > > now, saving the change to reset_status for a separate patch.  That way, we'd
> > > have more room to justify this change in the commit message separately from
> > > the one made to the EXEC_QUEUE_FLAG_BANNED.  But it's not strictly
> > > necessary, IMO.
> > > 
> > > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > -Jonathan Cavitt
> > > 
> > > >  		ret = 0;
> > > >  		break;
> > > >  	default:
> > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > index 18d8b2a60928..f0c5f82ce7e3 100644
> > > > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > @@ -70,18 +70,16 @@ struct xe_exec_queue {
> > > >  	 */
> > > >  	struct dma_fence *last_fence;
> > > >  
> > > > -/* queue no longer allowed to submit */
> > > > -#define EXEC_QUEUE_FLAG_BANNED			BIT(0)
> > > >  /* queue used for kernel submission only */
> > > > -#define EXEC_QUEUE_FLAG_KERNEL			BIT(1)
> > > > +#define EXEC_QUEUE_FLAG_KERNEL			BIT(0)
> > > >  /* kernel engine only destroyed at driver unload */
> > > > -#define EXEC_QUEUE_FLAG_PERMANENT		BIT(2)
> > > > +#define EXEC_QUEUE_FLAG_PERMANENT		BIT(1)
> > > >  /* for VM jobs. Caller needs to hold rpm ref when creating queue with this flag */
> > > > -#define EXEC_QUEUE_FLAG_VM			BIT(3)
> > > > +#define EXEC_QUEUE_FLAG_VM			BIT(2)
> > > >  /* child of VM queue for multi-tile VM jobs */
> > > > -#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(4)
> > > > +#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(3)
> > > >  /* kernel exec_queue only, set priority to highest level */
> > > > -#define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(5)
> > > > +#define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
> > > >  
> > > >  	/**
> > > >  	 * @flags: flags for this exec queue, should statically setup aside from ban
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > index 47aab04cf34f..4464ba337d12 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > @@ -61,6 +61,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
> > > >  #define EXEC_QUEUE_STATE_RESET			(1 << 6)
> > > >  #define EXEC_QUEUE_STATE_KILLED			(1 << 7)
> > > >  #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
> > > > +#define EXEC_QUEUE_STATE_BANNED			(1 << 9)
> > > >  
> > > >  static bool exec_queue_registered(struct xe_exec_queue *q)
> > > >  {
> > > > @@ -134,12 +135,12 @@ static void set_exec_queue_destroyed(struct xe_exec_queue *q)
> > > >  
> > > >  static bool exec_queue_banned(struct xe_exec_queue *q)
> > > >  {
> > > > -	return (q->flags & EXEC_QUEUE_FLAG_BANNED);
> > > > +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_BANNED;
> > > >  }
> > > >  
> > > >  static void set_exec_queue_banned(struct xe_exec_queue *q)
> > > >  {
> > > > -	q->flags |= EXEC_QUEUE_FLAG_BANNED;
> > > > +	atomic_or(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
> > > >  }
> > > >  
> > > >  static bool exec_queue_suspended(struct xe_exec_queue *q)
> > > > @@ -189,8 +190,9 @@ static void set_exec_queue_wedged(struct xe_exec_queue *q)
> > > >  
> > > >  static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
> > > >  {
> > > > -	return exec_queue_banned(q) || (atomic_read(&q->guc->state) &
> > > > -		(EXEC_QUEUE_STATE_WEDGED | EXEC_QUEUE_STATE_KILLED));
> > > > +	return (atomic_read(&q->guc->state) &
> > > > +		(EXEC_QUEUE_STATE_WEDGED | EXEC_QUEUE_STATE_KILLED |
> > > > +		 EXEC_QUEUE_STATE_BANNED));
> > > >  }
> > > >  
> > > >  #ifdef CONFIG_PROVE_LOCKING
> > > > -- 
> > > > 2.34.1
> > > > 
> > > > 
