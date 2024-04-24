Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1703C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 19:02:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C1D010FFD1;
	Wed, 24 Apr 2024 19:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NikkwNuG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E8810FFD1
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 19:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713985377; x=1745521377;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=iHZEJpiq/zIObVCkqV4pVxctWaNGDhcMzp5eB7h4rkI=;
 b=NikkwNuGTixpqkcg92xEPZBvzIARz9GgnfOH79mUfItrvoYwSYS/UCR/
 KUgAUdyS9kcITK1I+8QKaHuirXiaKGv89xjrEv1llQZxDEme1JR721IQI
 Zo7smdqQX92Q4xqTZcZLE7KgZW72+Mahyqs9HjWNabULGroWEJaoveclh
 zFVPXWUBxHZn8LLSDqpa3JV4ZJ6MWwsxBGxdeH1PK7qXWC+d+XGYjBTVk
 Zus27MB9yfWKke2l0Rxrtv0tBZ+JhVZvvG/zXA5s4g5PBMsBlwQ1/7QNy
 kUMtCbhyUbBICiUcZPa09S4p0aqzJs0Hup/jfywuO6J0aGER9aNvoC0y2 w==;
X-CSE-ConnectionGUID: iGRxPhxjQpWe0aQecXxb6w==
X-CSE-MsgGUID: Thvgp50sROufU1I8EXgA3Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9751571"
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; 
   d="scan'208";a="9751571"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 12:02:56 -0700
X-CSE-ConnectionGUID: 2sZ4kRjTSjWVu9tDqT4JRg==
X-CSE-MsgGUID: sGTcLJZNSfaDV2v//z9LkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="62278030"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Apr 2024 12:02:56 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 12:02:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Apr 2024 12:02:55 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Apr 2024 12:02:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=drdtzzEIpGjMkQkoJLbqHP2z1AiG51pnkQFzTDPXcekT1687MVr5UvopBmFAsdlnljcL+vemi5P7ClQBSqBfmXBt3V34w/ln99ajuElWpOvN3G5zkbPejsYtGL7aS7DfAmuhATb33elxP8Ks8jNXjWfp9uu4lBsrvLhKdCJVD1xiJm+OV66YZ4OGXvM8JJHvtdV21DXsv4+mMp1iZfuIvTL6kap1UGJANzOoiXiSQWT39lddYtjxWXIrWrWFYerkuT3iQOUv3IKrAVBlDZwsMt/JBqXquWju1RphCXmLR2eDoyyPRlsuDAl/KDjtWbyfcKpn+9oOZLNGlJKwMsYoLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zeC89iAXvokh739g19y3Xz7XSnUvYQIf5srg3NqRTCE=;
 b=eKTYEni5o27XUGP1H53mMUmFpipTiudcFkrXqP8DTqvS7XLpFkCtPJ4mL9gzkAwWxTDVMxiJm+8cCcDA2JWBB/295wnV4lf3mUdj6mpoeY3TxYSGdo0yl2U7FrZnP63OGW2XDyFvhs6Yke+6j0Sn1kFYq0aO4rcob7zKueMfjLVsJ++X3iAjpCh2kYEVyFZJh0OykKw35ZRhymfzEsN0f3tHDHIO9wCORL8D0KX89MdnJiLq5OrZPwPkvHUs15K763Mp2VZHgqNkBTOnz0w3rYss6eIjztB0WnZ/h7ZPP1vm4q8ctjVm/oTVyJXPxKmpfYXbupwp1CrknYp2b4wHmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CYYPR11MB8359.namprd11.prod.outlook.com (2603:10b6:930:ca::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.24; Wed, 24 Apr
 2024 19:02:52 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7519.021; Wed, 24 Apr 2024
 19:02:52 +0000
Date: Wed, 24 Apr 2024 21:02:49 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/pf: Expose PF service details via debugfs
Message-ID: <20240424190249.jvmj5myct4eyrzu7@intel.com>
References: <20240424171030.2177-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240424171030.2177-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MI2P293CA0012.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::10) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CYYPR11MB8359:EE_
X-MS-Office365-Filtering-Correlation-Id: 45ae0058-d1c1-45e8-cc78-08dc64912449
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dFFTcVRMa2drZ3hlQTZ0NmduODZJeTA2Z21OQlRWbnczNnZIcnZLQlY2eUU5?=
 =?utf-8?B?QW1kTmM2cXFEYmxWZGtSZEZoNUNoZUJaTENUa3RJRUFCenZpdVR3VlhHVUtm?=
 =?utf-8?B?Mm9GV0hBd1dMYWNEdDQ1RnRkZ1NyTXg1VW1CR1VxbHVUQS8vaGkyaGR2S2JW?=
 =?utf-8?B?OENKdk5xQ0RSK2xONjVZM1pkYlBQc2x2a2tlc3RMWWdEWlZ2NkdJanZ2Z25z?=
 =?utf-8?B?VWNOem5ZVjE0c0N3NjQ2ODhvRGJpYWZzK1lhcVNVYlNweDJVK0grbG9ocUNS?=
 =?utf-8?B?eWZlbnhzT2RIRFdOUzVPcEZUZThMeURBQ3VoYmoxRjdlRmRJNzdYcHowOUxy?=
 =?utf-8?B?UVdMTUYzTGJrc1lIelVUY2YveTllQStSdFlxVEM0WEJENUpSZG1PaGpMUkl5?=
 =?utf-8?B?aG1iZy9uUityeEUyN3dyZm0va25abW9lOEtVWUZkS1dNNGEvYnV5Mm1WalBa?=
 =?utf-8?B?WVk5amgrSHBaendIdWtUWmphRnBVSlJncE1aQ1JybGEwd0ttZUw4dkUyZ0Uy?=
 =?utf-8?B?NzdnOGFkUEJXTTBFQUE3akVIMkUzSTNuSnM5QW9NSjhMdEtvWlQrOUhaVnRh?=
 =?utf-8?B?NVJqRm1reFNPUGVmMzJqeXpQdG92aGU3VlpGZXpGTVZETFQ0dGtCQlIzdUgw?=
 =?utf-8?B?SlpDcTNSWjByMjFiZXBSRFM3YXR1OGxZNkZPeDFrZWlneE03TnJRNjQ5RDJ5?=
 =?utf-8?B?TmNveWlGRld4eW9tVmg5NmhyRnpNQ3d3endsYTZwNHE0c001ZDAyK0RzT2Nt?=
 =?utf-8?B?amZFVTEzbUJnRUhZNXpRR0twL1YzcXhoSU1URDVramJiTW1KYlFzS1VUM1pz?=
 =?utf-8?B?NDJsdXoxVVFtVFdKTXZOSVcvVHZxQSt3ajdXSmhRa1A5dk0vU05hbDc1ZEt2?=
 =?utf-8?B?Z05OZnJlS2ppbUtsdnJTbHNYTGplTk94VG5jVXVqVVlnM04xVlE5RW8wZWtO?=
 =?utf-8?B?TFc1ZEZEbWV2MWNMM2FDVDJtUGhLTXNTUDk0Vm0zWWkvSUtRR0JZKzY4cEdB?=
 =?utf-8?B?YkxxVWRmY01vSDltWGp3RHBsbUxicndVdWhLeDJaWHg5Y2t2WjBnbFpoOWth?=
 =?utf-8?B?cGlhYmxYaUd2QzZzYytacTJnbnpUdXFvLzhTcWxKR0xJRlorUVY2S3NMWHVJ?=
 =?utf-8?B?M05hM3lPNktob0xYRXBMeExsbmRvR3F0cDB3ekVmM3VGM0lhc2FUZnRrdkdh?=
 =?utf-8?B?bGs2T2Y4a0xlZFJLdXRxQW9oSVpBVGh1cjlBL1gxLzh4a3VoclJBbURVSWJy?=
 =?utf-8?B?VGh3NjNYRzFUZVhZUU1YUUF5TEZ5TlBGMTVDTng5cXJ3YlpXM01Sb25FMEUr?=
 =?utf-8?B?VXM4T1pIdk9OSWU2RnMyWXBJTmg4SXpLT3U0SWEwblk4VlloOTBqdmlyNHln?=
 =?utf-8?B?Y3lxWmE0aHQ5dllVVGttdjFzWHdMQlBFdHB2Mk9HTlhwbVQ4MjNXK0Jva2xX?=
 =?utf-8?B?eVVGTVZrQlluRmNDREE3OEhMYTZPYk5QU3U0VUZHN2lHRFM3aEl5T0U2U3Rn?=
 =?utf-8?B?bkwzeDNpQnA1UGRhK0lmYVJockhWcmt1TDZNa0RMRFVTVFc2ZFE3Q0YyMU5a?=
 =?utf-8?B?ZERWRHEvV2RXMjV6Rmg0VmhUQVJFa2JyMnNRMmE2QWVWWWwxVkFpeGM4cGVG?=
 =?utf-8?B?V2xVbDZrYng0VTdMOEZ6U3p3VFdIVGFlTG1hcjdTMXdRU29kZ1dTeDJzREE0?=
 =?utf-8?B?cStXZXVQbUE4Z2xBc1ZRTjNweUFOdENpYWtxY21TOW5hSlR0U1RmdWpRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUtsS0MyOG5wTVJ2cGo4UkJ6RUZrOVp6MHd2S0JjMlVlcHFGaXNOMmhTRVY1?=
 =?utf-8?B?UTZQd1JqUmdLSWVjQnBod3M4d1ZrYStRRytNeGxTdlNJQ3ZCOURtK0x6QWQ5?=
 =?utf-8?B?di9EUHowUkp2eUFhMmptSjVMdytXek1iRkdmSHB0QWFleHIzY3BMYTN2OHd5?=
 =?utf-8?B?V1dkK3NPSEZSYzZDSWlPVmxhSXZkSENLaVZxNXJNbHRkT29nSVExYi9yeGNH?=
 =?utf-8?B?S2hzeHR3YnNhUXl4QmZVL05IMVR0bGlRNnc0TkVrYWwzUlJjTldrdktSTVc4?=
 =?utf-8?B?azRUT1JFdnFIbmJVbURjeGJBaEhLVHE4QU9XWEc0azhlVVpmWUxqQkl6aGtl?=
 =?utf-8?B?QmtPRU1acWxwMGM5aHNadmkyVEI4ZTliWklGYk5pQkVYNzBLYlBrNjlRenFR?=
 =?utf-8?B?VXJsczQrQlVMbkgrdm5IcTltMDJJWngrQ3hJY3NPUHFHNWF6Q0FwZXhKZTFx?=
 =?utf-8?B?Mnc3alFZVHl0Q2JJTjV3eUZNQ0YvUWw0c3JQamc3UUNBNHFPK0dvcE5ab05E?=
 =?utf-8?B?STdLS3RiTFNaM1AyVVdpZER6STBXcXJYamlETDNTUFgvQ0F5M2JDWCtXMEV1?=
 =?utf-8?B?KzQ2Vnlic3RZaXBqUml4UXh0TE83Vm1yL2hsVUJFd0Qrc1FYZ0dkSWxWaGsw?=
 =?utf-8?B?N0pmWi9MVUwwY0x0MGcyMXQvUFMxaGdqcjhGbkZiRm9kdytiZFFBYWp6cFZN?=
 =?utf-8?B?YkhUNW1heDA0c1NJSGV5ZW8zb0tvUFh1SnFoSUxwbGZmNittejZPYTExZGNr?=
 =?utf-8?B?VGlwdDFUUUc3d3FzQ3FCcmVJYUtQQmpNMTI1WlFJTXUrZkRzQWx6UTVzMzFh?=
 =?utf-8?B?cFA1K1o4ejU0cXRTcS8zQm5mVG5YWGR2U0pabHBEK3REdXR6aWJYMC9qYzJk?=
 =?utf-8?B?OWtnTE9YTnJ1UElpZEttK1k5VXArL284c3UySHFKV3A4SVg5d0FlKzY3YjhO?=
 =?utf-8?B?M1cxYXh5OEI3WEpnR1FzS3kxK1RZRll2NmFhYUUxU0RVeTdoVE9lSjNqeHVV?=
 =?utf-8?B?UkFGdm9vRUFFU3IxTFljVzFXVzhKRis5MkdreUtGQUJhMTRiamtYYnA2WWRI?=
 =?utf-8?B?anZFeHFvL1dUbEdicmRYS08wRHhxbTd0ZXRhTTVyNnVhVTJTRWFyanFpS1hv?=
 =?utf-8?B?Tld4bmprUWFzdVZrcytUWENMbTNtaDJ1c1lyWkdlNXR0aWxGVDFsNjUwQUw5?=
 =?utf-8?B?RWRsZ0R2NWNwM2VWeXRLL2hSY01lWGhBZC9BQzZtclJzMlhhdTFyOTEza3NX?=
 =?utf-8?B?Sklab3lReW5iRWdrcWtzY2xjU2NWLy8rNmhOZU12MmV0VHlqeWFJZW9pNzNU?=
 =?utf-8?B?bFJ4bTJsZGQ4MWpSYklNNklrYy9IVWF5eDc4cjFPMS9uMzRCUHNCcDV0UWo5?=
 =?utf-8?B?R2M3aEZCWk50L1RnV3hXQWNSZ1JScUZGNHVqd0FmTVhaQU15WXdOOXhEMTR4?=
 =?utf-8?B?cUx1TU9Xb2VEaHpsNGNLNzUzcS93ZHpIUHlqdExGaDNoY1g3Rko5UGNQUUJW?=
 =?utf-8?B?VXVqVisrM1pIT2JucUhaN3NzaEhWMGJkaWNxbG5yOWc4S3IydVdtdGhPaDNl?=
 =?utf-8?B?eVM2blp4TXlhNFVuMWo4eUtVZi9TTWFxT3hReEwwME5NakRVRTRkVGlUSVpa?=
 =?utf-8?B?WkR6S2VXZ1lUZUozQkxuNDNaTlMzdG5XZ01Yd3Q1dFFBN21hdWJxb25wN2Mr?=
 =?utf-8?B?RUpOYzFqVUsrZWk3T2s0MCtSVFA3ZENRNGVnQ05NbDYybHQyUVNTRVBiOVdC?=
 =?utf-8?B?WW1zdEcyYllyM3NNRUYxdnRmelFvdHVNMUxwcENKQ0pSb3VLejVQRVp0S0lX?=
 =?utf-8?B?WHRSYm5uekFlUjIxMmtYZXdRSzQ3cjlNRGVWS2RwRk84ZWhCYmU1WkpLMXRk?=
 =?utf-8?B?NWVoaDl2QmxoLy9iSjBhVW5oOXZJaTY2aG9zMnVyQzRjQXMyMEtXM3VBclVV?=
 =?utf-8?B?YUptRFRmOEhUZWMxdFBvc3BKbGc5RllwMVkrK3BhVHlra3Frb0pXYkV1bFdo?=
 =?utf-8?B?YXJUSXFQbG1hVVFUdW91eHgxYk5pa0JDM1c2dThWMU54bmI2bi9qL0VtN3Vr?=
 =?utf-8?B?c2lkUzZBTWFIU015SkNCQ1ZTczRTdndGN1hTSUtyRHNzRVAwQUZ4aGlGZjUx?=
 =?utf-8?B?TUJrVjd0SWN6a2l1bFNaL2lySEtoSGhNTW9iYWFURWR4OGVMRVNMZWVJdjdr?=
 =?utf-8?B?a1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45ae0058-d1c1-45e8-cc78-08dc64912449
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 19:02:52.3368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kMrFp0srzWA4DoPwt1TAVnB3ugwN8lKLP4t+I3cDvp/Xla9csyfV3ZIulYRfKpJLPh7AMSifKo8t3ZccnfxL17sHxu9KZanflSyw1MAixf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8359
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2024-kwi-24 19:10:30 +0200]:
> For debug purposes we might want to verify which registers values
> PF is sharing with VFs and to view which VF/PF ABI versions were
> negotiated by the VFs. Plug the 'print' functions already provided
> by the PF service code into our debugfs.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> index ab1a26fce3aa..5102035faa7e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> @@ -18,6 +18,7 @@
>  #include "xe_gt_sriov_pf_debugfs.h"
>  #include "xe_gt_sriov_pf_helpers.h"
>  #include "xe_gt_sriov_pf_policy.h"
> +#include "xe_gt_sriov_pf_service.h"
>  #include "xe_pm.h"
>  
>  /*
> @@ -52,6 +53,8 @@ static unsigned int extract_vfid(struct dentry *d)
>   *      │   │   ├── ggtt_provisioned
>   *      │   │   ├── contexts_provisioned
>   *      │   │   ├── doorbells_provisioned
> + *      │   │   ├── runtime_registers
> + *      │   │   ├── negotiated_versions
>   */
>  
>  static const struct drm_info_list pf_info[] = {
> @@ -75,6 +78,16 @@ static const struct drm_info_list pf_info[] = {
>  		.show = xe_gt_debugfs_simple_show,
>  		.data = xe_gt_sriov_pf_config_print_dbs,
>  	},
> +	{
> +		"runtime_registers",
> +		.show = xe_gt_debugfs_simple_show,
> +		.data = xe_gt_sriov_pf_service_print_runtime,
> +	},
> +	{
> +		"negotiated_versions",
> +		.show = xe_gt_debugfs_simple_show,
> +		.data = xe_gt_sriov_pf_service_print_version,
> +	},
>  };
>
LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

>  /*
> -- 
> 2.43.0
> 

-- 
