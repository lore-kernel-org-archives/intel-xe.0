Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C4BCAC582
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 04:56:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BABF10E42B;
	Fri, 12 Sep 2025 04:56:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Frmu0try";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1252810E42B
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 04:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757653017; x=1789189017;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Hx/VbV2PEIzsXucmh/pDZqcTkO6BPzY68m4V+Z7aLDI=;
 b=Frmu0tryJVy8XIJlhiY8vrZDqZv4HBJVx0fFfqWmYoNEBuBYNktSiDXw
 fAUOd6zUbhlHToB+Z+bif9KawZE5ugcR0oglQituQ7tRhp+xss8k2sVc8
 TFIycDPlrlylMwNr9nUOHhBIetLOPSAPS8pRNMxfRSflmSgv0y4HnOtt0
 0ou83pVMcyOdERbysvSKG1LEkvoef+WeQfHKNhFr+3/vP9jnTTA5Wssu4
 fSw5vOktAWdNBZRlgY+3bAP/GtJy9MxljnT9J36mpOh7UaH49lV64rWEY
 l7q1UFRBieql3DZngoNR1DYn7hvhPNt/YxB76PPWptsV9LRu0pJQegY2q A==;
X-CSE-ConnectionGUID: ZaCHQdtpQEWwYjAKxgVcHg==
X-CSE-MsgGUID: e8ExbcxESrS5QnD7oPfxow==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="71421278"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="71421278"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 21:56:56 -0700
X-CSE-ConnectionGUID: 0qFIRA0aS1SXufcU5h6KOg==
X-CSE-MsgGUID: j+rnHjCdRDyPBxd2hSpwhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="211032345"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 21:56:56 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 21:56:55 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 11 Sep 2025 21:56:55 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.74) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 21:56:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qwn76zkgXSbULja42HIEUxAwkVnaA7Rx3PEsmhrCfAAzO/GE3JFvUlEvnL7CqnTecshRE7GGB6PTle2654lFucDJ2Sbdg+h7liYqYR6Yk1gQ8ya4cjwe0l5PQ+JGUsMcmacGIsmrNah96GphMl0R3BFjz4WPFWrfvjwIdf7f9OKkc6RAIo5RTfR7Uj8owY09jd3yODoUSqmJgETOe6lZttVcZI0mdQziQNo+3NwQbXTmCwR4qU3Uu6mmsnKED+i9PWaZMrqB3H2tcCP9mMAVU0WeLUOH+jtNXuipqPGZz/yTrC9zLA9ZG7xFGGhApi6V6FQjkxuYRHgtwsefq8HPQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tNVL2TNI4hevaAYkjARCboPIYHRKVB2v8RkPczdngeQ=;
 b=GJApNEjgORhVG9puPupCiw4/CjXJzvk7kkX9eyeI3+RejfTV3BlTEC/t/T6WJeVsz+kwRJ3rRIDpp19gjTm3VpP3x4cEtzilwT5IxBbgBHI2cHSk9UKJX5SKLQNMaXCeCFsAxU9AgYaWZOa4AKdo6dgEGbmevAeBwI6qbYyuRnYoYJ/UUVOv+w4KSidI0tHJU8iLmVYNrzpMqJ/X1oVu0uHSuClRY46BqR1ui7NWriKoI6s/6ZtQmcQVVR9ysw1XAZZMvIpdIi5qDhK+o3YVFtieJKwkV4kTcjGBMluONomUWRGB26fZdKA1K3742mcLVFVrtWCRSQOdzb/ou8QbOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH3PPF5ACB2DC0D.namprd11.prod.outlook.com (2603:10b6:518:1::d23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 04:56:52 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 04:56:52 +0000
Date: Thu, 11 Sep 2025 23:56:47 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>, "John
 Harrison" <John.C.Harrison@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <dev@lankhorst.se>
Subject: Re: [PATCH v3 2/5] drm/xe/guc_pc: Use poll_timeout_us() for waiting
Message-ID: <6pt5o6cgres5n3argefbocisccmfbjpawk5s6cts2k5fm3ropr@xmbnve5zwltu>
References: <20250911-xe-iopoll-v3-0-6a95f1cc3b0b@intel.com>
 <20250911-xe-iopoll-v3-2-6a95f1cc3b0b@intel.com>
 <6934c194-9d1b-44ba-aee5-3ce106143144@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <6934c194-9d1b-44ba-aee5-3ce106143144@intel.com>
X-ClientProxiedBy: SJ0PR05CA0164.namprd05.prod.outlook.com
 (2603:10b6:a03:339::19) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH3PPF5ACB2DC0D:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ef0f39e-1445-4179-9b54-08ddf1b8c9c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QJoOQndgx/eQ5mp26VurHYPFPPi8oi1Wbn6x39L3a1TsZ7T0a4lf01AVBeQi?=
 =?us-ascii?Q?JD/D4CO8Gc3zb2nyCRd0IA/DJTuG6vtllG3wkagqc+n67K14pWw+Hyf85fJx?=
 =?us-ascii?Q?Cg/daSeCDZmzA/EEYl+i6OroafW91AGejW+LO/2hcC4QJNbAi5CwCTuSxOCe?=
 =?us-ascii?Q?iUkNRJx1/Z1EO4JQwT9k7v3KENe4E5NbXXqGPqn/qCFZMbryR/0lejSeKxhx?=
 =?us-ascii?Q?tMgahwBmOXU/gh1n/lTAsyzqKMEUZTQkMRCF14FY4m76nU/D8xFFEZeStrYA?=
 =?us-ascii?Q?T54sh5FnQvBT0YP709Gs0F6ge66aRth/9Jn7T+3VM/Zhw+y7KfYSNnygv5a2?=
 =?us-ascii?Q?OoGxswOoB4JB7Uoja4pithm7sCUFHDdQv0O2uqHHPpnb99knez9GcTkTxPPp?=
 =?us-ascii?Q?YdYg9dLUHFUKWtZ4udqUgwJXuQJsSK3+dmZfrVwf8cLNi5vIM2l1+20e/DAM?=
 =?us-ascii?Q?zIuKewIRuCQHEqAiNk8guXGWPrGgxibCu02avyqtiZcUU0kQPy/0u5s69CDV?=
 =?us-ascii?Q?3T4eFj40m34YSzsg9Ol6nTeZ5HkYWOfp7l08TaJwBnWpqN76dh/fB6wzAPWs?=
 =?us-ascii?Q?ruK/K7YFvkvlZmqj0lAF2XvzWIsjTSrRZDijNVL0wqSAKdYZqr0Onjkt0TED?=
 =?us-ascii?Q?msCdy1+cHy+MFPUerdH3c7od8zjDIKoxtuMqg00wVKvVNbvBfay7RWTBh3pu?=
 =?us-ascii?Q?3fossSEu4SOax4V/TxbFKbDL9LWnyymYt2HxbJwuYdoF3NWNSiFWUDFqBnEK?=
 =?us-ascii?Q?dRTCmJZR+RJ3vsFNv+7gqhtR3jKQaIjnWjAXsOJ82zzRuFzB8jVlQU+GdVQ0?=
 =?us-ascii?Q?nC7SzhoCeH+IqU1oE+LohWlKpR3/IvpWD+GXPBEoavMtmurNzNjd50dORgnN?=
 =?us-ascii?Q?ndIgBbyWLENZtb7ZopXB3IN6HBbParUFRklvp6jUoV/akvzPlbe+U9qsYfCR?=
 =?us-ascii?Q?luVakVS67g7Vnzb21ceQtJaxxTI2XE4N5rDgbogyLQVPBI6Z5kbN80jdf+ZY?=
 =?us-ascii?Q?qLerOjOYbjwbG2kLIEI5JmBqko2f3syRf4QbBnmZshLmbviCw5T/yHn74VKK?=
 =?us-ascii?Q?gsw8PCS/mPLs/0l2n5c9egS+zUq8ZUNUw+k9cqQmgARqzy2qO1bL0rl1W0WC?=
 =?us-ascii?Q?aVo+bLTehUOL+lwSz5+RMSJ9QwfZ4PuZJRfiV4Ckf0QbbqXRDbI2lVO8Aj2r?=
 =?us-ascii?Q?MRlU0gNqnL096CEHjmkuFJF78MKuoh2z5hjXnCb85XJ5mzO6+2DsM8nO6uhK?=
 =?us-ascii?Q?76HPF8FO8c0XEgeRVZVm9pv2YmuvGBbIiUhQm15AGRpf4DY4Z7HwfoqqLSPt?=
 =?us-ascii?Q?/VTRjeWr+1YcmNpK1uSOM3jH3F37DAQjatrfZeRXmIkYSPD7L4VbjqelXJVR?=
 =?us-ascii?Q?WN/NgfGcA1L4X8YNJ9gBKX3h/h/aIuKZ3SoRp1CRHNXxzsCTmiLf3cqBqCOg?=
 =?us-ascii?Q?Z7nOXq+v0L0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ktSAKodO21FsmoPCBZbbq0TTG9FbEySdL6kCBJcXZsxdxIATW0qCYfaafhP1?=
 =?us-ascii?Q?si2ynDHA0ZPxhtVStOVrquO2pExWEMKqtOBPRou3Ke03M0Iqj+H3vHbB8/FT?=
 =?us-ascii?Q?ifSWBecUdx/mSPIW1es5Yjw3uPd/sUow0DTSs6O06kG+YURkgFBRQ7ysW6G3?=
 =?us-ascii?Q?hB6tMzoibhtt9FlILazPnhxs9zBQljaK2EO/KaAxSUfR3IEacZfNhBRFbV+G?=
 =?us-ascii?Q?+0BWOMUzJTvFhHDKzRGYZNiMysQYyo/ZFq87IxU6j3Xlw3h0H8B4WbqbIdCM?=
 =?us-ascii?Q?MMXCTOG6HhfW+lAhZWriYfF8VpHqpyBn8tDwVRH+a8UvlwS0fsAuaedLbtTb?=
 =?us-ascii?Q?WlIxDlbFqLNK99s2cCM8Htp1GyiZXraSbFCETVmXVE0eL2QD5e4gHqyEwpcB?=
 =?us-ascii?Q?TEvwCk27bgUxmFwI1EI1IhpbFuuM0ODVTSwQjPxWgzuiOWK9gLfstyz+l5LS?=
 =?us-ascii?Q?XaKtMR2xlQKc8obFiiT0y9fww+BEUzAPv3Gw42MPlXe/bXlBTbJt7nB+iKC0?=
 =?us-ascii?Q?xI56VgPWpxMpJb7/ystJ4l/JhTed50yNVqeWWni6Wrw/h/L1/9j1UrUSXM7S?=
 =?us-ascii?Q?8FUAEbwcXpuJYVkja6ZX07bT+F9XWah3+CDlpgzvwTxNAV/qQ0EdrHDpDRXF?=
 =?us-ascii?Q?l9yXML7PxmnqG/Nt4AzMmA/c+TF3BGcqseeikZxN8o/TQt04iOgL+fCulowN?=
 =?us-ascii?Q?XvD/wdkXu3e3NfyWxfDlwr/s5zAAljZQ9CLpW0z6ZD+WI23pGVLrpQk1A40K?=
 =?us-ascii?Q?M+itx40Wl3VRe888WpYPv+MEW/N4isI/0guMzMgRUR2rP/BQ46H4yQM3fLAy?=
 =?us-ascii?Q?vM4ScZ+o8yQXGfmFi0amNobuNHD9nCR/lTWe1IX61LyjdlawT8K9u5KOMX19?=
 =?us-ascii?Q?eW2hmhuRKKY3ykyiPzKA87OVFPvPBp5tn34ZL7nRPHfJW7pkA7pJ5B2WAv3e?=
 =?us-ascii?Q?EkxFRgPcPtsP3EzsfF8Miw+3kWtf9R4fflmZXzPnm7I0CF/xztArEmua0Diz?=
 =?us-ascii?Q?TVYqRcF8oJvu9nmaPcrAAvmPEjQiNKZocHNQG0s4uv2U6MSgVmeBSzMcOTNN?=
 =?us-ascii?Q?6IV43twPKok/la2fj/p05AUqKfpyN23BfM6tVlf0c8jgpb2tmponHe1901e7?=
 =?us-ascii?Q?oTv53a0XaoKCs/uEj0cMgj07wAmkzkosbkIhwhQGLZlR1mChXYCeAcpe8DNk?=
 =?us-ascii?Q?3eWnP0cjLF7xuXTg2Ji69oK+NJ46zmbY3pzC9F9GhRyg3wbuxRMEWeoZPuAY?=
 =?us-ascii?Q?ivWkDDFJzgGwbi0PnoAGIRsfxzAre4A/moUeVJeIXZSa1kkp+lcGrvi0gASG?=
 =?us-ascii?Q?faAOg2mHKIb6Oy0gaR5+tG29dsb5rbmKN4lg4eFpGVzGdzPRRhWtBhr7GDhk?=
 =?us-ascii?Q?D1NKa+Cia99UjSWIlZ2rNKbDaQ8Mr8n4fGqYA8pvfcpZrU3z6OreA2k1qMTw?=
 =?us-ascii?Q?mSA2/IXQy3QL2w8uwHc8vaktPc2VviBxxt+NS9LY//x4jXcYDY3MnWcp2bn4?=
 =?us-ascii?Q?DZ/1FV6jwaf1NSyGRDQuxN8shHZ3515g2cpAXrQAqyYfOKGHOEW9f75PESh+?=
 =?us-ascii?Q?dflzPsVYUpGa6w3zdqiKmS+o78I+zedHs5lPTp1prNkQLWzLXLJ2GB6l12s9?=
 =?us-ascii?Q?xA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ef0f39e-1445-4179-9b54-08ddf1b8c9c4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 04:56:51.9257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YWUUmdU98PrC9SSpb3M0pzHOMoVr1TWCnG2jm9EMu2weZN/RTBszzpK8/fIbGj4hMii55ki55b/A6yKyr00KYHevowQ4ncfp2i/La6eFJ04=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF5ACB2DC0D
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

On Thu, Sep 11, 2025 at 02:21:28PM -0700, Belgaumkar, Vinay wrote:
>
>On 9/11/2025 10:25 AM, Lucas De Marchi wrote:
>>Convert wait_for_pc_state() and wait_for_act_freq_limit() to
>>poll_timeout_us(). This brings 2 changes in behavior: Drop the
>>exponential wait and fix a potential much longer sleep.
>>
>>usleep_range() will wait anywhere between `wait` and `wait << 1`, so
>>it's not correct to assume `slept += wait`.  This code is not really
>>accurate. Pairing this with the exponential wait increase, it could be
>>waiting much longer than intended.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>v2: Simplify functions by removing helper variables and changing break
>>     condition on poll_timeout_us() call (Maarten)
>>v3: dial a little bit back from v2: better to have some helper vars
>>     and avoid the weird syntax (Jani)
>>---
>>  drivers/gpu/drm/xe/xe_guc_pc.c | 42 ++++++++++++------------------------------
>>  1 file changed, 12 insertions(+), 30 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>>index 68a5bf8e39462..ecfe37836692f 100644
>>--- a/drivers/gpu/drm/xe/xe_guc_pc.c
>>+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>>@@ -7,6 +7,7 @@
>>  #include <linux/cleanup.h>
>>  #include <linux/delay.h>
>>+#include <linux/iopoll.h>
>>  #include <linux/jiffies.h>
>>  #include <linux/ktime.h>
>>  #include <linux/wait_bit.h>
>>@@ -130,26 +131,16 @@ static struct iosys_map *pc_to_maps(struct xe_guc_pc *pc)
>>  	 FIELD_PREP(HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ARGC, count))
>>  static int wait_for_pc_state(struct xe_guc_pc *pc,
>>-			     enum slpc_global_state state,
>>+			     enum slpc_global_state target_state,
>>  			     int timeout_ms)
>>  {
>>-	int timeout_us = 1000 * timeout_ms;
>>-	int slept, wait = 10;
>>+	enum slpc_global_state state;
>>  	xe_device_assert_mem_access(pc_to_xe(pc));
>>-	for (slept = 0; slept < timeout_us;) {
>>-		if (slpc_shared_data_read(pc, header.global_state) == state)
>>-			return 0;
>>-
>>-		usleep_range(wait, wait << 1);
>>-		slept += wait;
>>-		wait <<= 1;
>>-		if (slept + wait > timeout_us)
>>-			wait = timeout_us - slept;
>>-	}
>>-
>>-	return -ETIMEDOUT;
>>+	return poll_timeout_us(state = slpc_shared_data_read(pc, header.global_state),
>>+			       state == target_state,
>>+			       20, timeout_ms * USEC_PER_MSEC, false);
>>  }
>>  static int wait_for_flush_complete(struct xe_guc_pc *pc)
>>@@ -164,24 +155,15 @@ static int wait_for_flush_complete(struct xe_guc_pc *pc)
>>  	return 0;
>>  }
>>-static int wait_for_act_freq_limit(struct xe_guc_pc *pc, u32 freq)
>>+static int wait_for_act_freq_limit(struct xe_guc_pc *pc, u32 max_freq)
>
>Nit: rename to limit_freq or something instead of max_freq in order to 
>avoid linking this to gt max freq.

problem with "limit" is that it gives no clue if it's limiting down or
up. wait_for_act_freq_up_to() or s/max_freq/max_limit/ ?

>
>with that,
>
>Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

thanks
Lucas De Marchi


>
>>  {
>>-	int timeout_us = SLPC_ACT_FREQ_TIMEOUT_MS * USEC_PER_MSEC;
>>-	int slept, wait = 10;
>>-
>>-	for (slept = 0; slept < timeout_us;) {
>>-		if (xe_guc_pc_get_act_freq(pc) <= freq)
>>-			return 0;
>>-
>>-		usleep_range(wait, wait << 1);
>>-		slept += wait;
>>-		wait <<= 1;
>>-		if (slept + wait > timeout_us)
>>-			wait = timeout_us - slept;
>>-	}
>>+	u32 freq;
>>-	return -ETIMEDOUT;
>>+	return poll_timeout_us(freq = xe_guc_pc_get_act_freq(pc),
>>+			       freq <= max_freq,
>>+			       20, SLPC_ACT_FREQ_TIMEOUT_MS * USEC_PER_MSEC, false);
>>  }
>>+
>>  static int pc_action_reset(struct xe_guc_pc *pc)
>>  {
>>  	struct xe_guc_ct *ct = pc_to_ct(pc);
>>
