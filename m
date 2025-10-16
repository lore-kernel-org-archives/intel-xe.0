Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08570CCD199
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 19:06:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE9510EA69;
	Thu, 16 Oct 2025 19:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dMaDIngW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321B310EA69
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 19:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760641563; x=1792177563;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FioVd+FUB+4D4cfCYSS7Ctuo9TujCMNtg+T5mU5pc4A=;
 b=dMaDIngWOIgFYLWa3W/X6+r9xh9FcVumSpHvgydy8Xa/BvQ4ef85bY2R
 JYFE44MMsafv4+fXAeZ9Ol/HCNQI1oqy+ijknuOmWgu6RvuNBNmmKuqfr
 fyKG2huEGKv2b3FkJur2d6nho9CVMCi3WZ8piOjKTy8o0yxAKvZdfydZU
 y/+5k2mOGGjHTg2QeqnZsTirw/xeU4XwJ1vs+6g3bA7yZCw3nswyl9rnp
 kokBCuXYVwOnaUOvnY0BhPeOXeo43S63aNEoJaPu+QaDvpw7eiXVo0sbr
 sAaHrDqmylaM++6g0rEaBnaUbtYI6bzaXAqIPCUESUvrCqeHDRfO4Z+by A==;
X-CSE-ConnectionGUID: 0kEhA7gLRtmif4PT/aVbPg==
X-CSE-MsgGUID: 1ix+6BdQSa6ju28ivYsezQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="85467866"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="85467866"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 12:06:03 -0700
X-CSE-ConnectionGUID: uRKoBnxOTwa8FK42lqaXVA==
X-CSE-MsgGUID: b2K8ROQ1SOC5ip1sOjxzZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="181745985"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 12:06:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 12:06:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 12:06:02 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.27) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 12:06:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f+0OeyKGRXh5738G4MW+N/bixZmrIuCxzCHsjYrr0r9K3rIgU7lbU1MBOKeaznM2e5l0JXwTC6t57Hcbu0ygkdOlJ9ID/NM0Hn1I1Zll1sy7QBghRufU1UE7+kgpdWYpmSZBSi1KOKDdBi6swLQOichxSoBAfZvTNdu54Zodi6zMern3+w0Bsb5sSV/YyuodxKQHJL8DDZY0/NyXaziHrYMOlexQbiCfpB6oPVahPkNmz/prKUIVebLLa820aJyprRAC3SSY9VXfAeckXM2NyE+DRZEZtdU9wOFxOXRPvc6iG27iESPPJCP371mjeSKnWrj+LaUmwkvUUo+/5bOn6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M5vh1HAD8lQyo03MWyKXv+2XKd+4slcqCWGX5XqkYco=;
 b=sww4BeGWIjjozc6/QzhBUWLAticVG0u7qoFWYQSF4+mjilv73bTKCKtSkhLkd8HfVQglRkjTFu9dvvu/raxp1OrVkS92HlOPmUHsoaWXjwDTiOSd+8uaNh7g/EXZUZIZSVt5uWTrX25WlAh+voXOunNyf1IxYepjKwp3hOT0ZZbg8nKJkVVm0AM83MIUoQXqYSiqmMYVAEOKoy1OGa/GZWY+COpHL0REwJK7FwpPW9zIW9YlfzooXpxn9jz5NBDOvDJHmhsXhSMMA7Wfy83Ji6D2cpCQdbNvPQ0D9fgvl/a3gTm5g6T1c7lwhpkMwgxhcs6JF4+bxm6/NC5gIOXJqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY5PR11MB6415.namprd11.prod.outlook.com (2603:10b6:930:35::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 16 Oct
 2025 19:05:54 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 19:05:54 +0000
Date: Thu, 16 Oct 2025 15:05:49 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>, "Anirban, Sk"
 <sk.anirban@intel.com>
Subject: Re: drm/xe: Prevent runtime PM wake while reading rp0 frequency
Message-ID: <aPFCDefOdE7XO13B@intel.com>
References: <20251015094611.1468939-1-badal.nilawar@intel.com>
 <BL1PR11MB52546B55031A832837655172E5E8A@BL1PR11MB5254.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR11MB52546B55031A832837655172E5E8A@BL1PR11MB5254.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR02CA0037.namprd02.prod.outlook.com
 (2603:10b6:a03:54::14) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY5PR11MB6415:EE_
X-MS-Office365-Filtering-Correlation-Id: 05824d9b-8943-44de-41e4-08de0ce70764
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dEVESithTllRVlAzMUpkZTc4Tmg2QVl4M05UZ2JJbWRLaEtST1V2VE9abjdo?=
 =?utf-8?B?TlVxUzJzWjBSTmZ5ZjZWZzM2RnhKMEN5WHpWTWVaL0M2ME1icVlUa0lYUDZG?=
 =?utf-8?B?UWFCVXJ0aVFISU5ycC9HUVQ0R2ErTlBtekZhQW1tSjdUWjk0NjVJek9GYVRx?=
 =?utf-8?B?YTFYNi9vakIxQUVFeVA3QnUxcWpkblpudkNNdGNLUmhZaDVQUGQ4SlVSNndB?=
 =?utf-8?B?SEE4UEVTa3BwYldrWkhnU2pHb28rNnpIYnBDK2NqcExkUE9BV1p6NEZDZmhN?=
 =?utf-8?B?RFhiMksxOThOOVQyUVhsa3RmMVo1M2Urbk9wOFkranFycktqR05ZOEh0dHZV?=
 =?utf-8?B?S1g5TE9rZlE0YVd3Rkk1dGhBWndndU9HTXZDcGF0djN6bmdpd0hmampjbEVT?=
 =?utf-8?B?eSs3S29DLytqc1V0RGRMR1c5RVRGRnF6MFI1WHdldS9uMlVZbTY5NUIwb2Nu?=
 =?utf-8?B?eFM3MGEvRFlwNk9mK3gzRjVielN4c2kwWFdWY2pobzBwRzZYK0NKZmVJQThi?=
 =?utf-8?B?eDRUa294OEhuOC85UWloeDNVOG8wZUFYS093VDJpMm01dXJzTGZCWUsza2dH?=
 =?utf-8?B?ZVFnc2dUaCtqZkFSRmJHZnpFMGxpVjEzWlJlTlJWMkY0Y3lLMk1WdGtMZ0Zs?=
 =?utf-8?B?SVVVZEdsOHFZMnJtK0t5eHNqQnFJeTMrblVEM0Nsc250ZW5PcG5DdE1sSUYy?=
 =?utf-8?B?RWdQWm9iQWpLVnZaeDhzUU90aHl0ZWRvNUUwTVl5RWdQNy80Y2E5ZlhnbE5r?=
 =?utf-8?B?VTVnc2JlTHlBZmo2ZlZLemhrRFZ3U0NkeUN4YjYyR1hGb095QVprM0hmVmNK?=
 =?utf-8?B?QXJtLzQzVXI3ejJ5NDg3WUxZVjMrRXdWV3NmU1NSR2JsRjRzTzhkUzhla2VT?=
 =?utf-8?B?TVUrSVFvU1Z2Ym5md3BxczJGcEU5Z2RXai83dVFwV25aUFd2eVlTbzVVN0gw?=
 =?utf-8?B?TzgvYWdtalBpMjAwZHF3MHFtOUpOYkkvWDF1aHBoYytaZG1Wczd5YmRKZW9L?=
 =?utf-8?B?czY2K1ViNW05RFhZVVJZQXlEUG5LK1p0TldIaTIyTFZNVDRSOVFUYVVKcW8w?=
 =?utf-8?B?eG9KOVJPUStWWTRSTU5XUnJkM2JiRkhXL3Qxb0F1c0tMQU41RWJPRHlRU2po?=
 =?utf-8?B?WlJoSUFuREl5RkliUzc1MnA5WFJ2U0d0V1RGSm9CT0xNYlBESWd2Z1pPam1p?=
 =?utf-8?B?SE9INWVEYmNGMkhXVzAxQTkyT3BkQkJhNGZxdEpQcUZBZFN1cVZJb3dLODVh?=
 =?utf-8?B?dDcxVTZnUmxZSi9LWUpYL0dMVDFDd3ZzYlY0eHVId3N4bVg5bG1rVmJsVk5R?=
 =?utf-8?B?azhBWUxpaHNOV2tNcDltZEg3Y00xWXN1T2JBQjNhY2xrakdnSWZCSnV4Ni9X?=
 =?utf-8?B?c0xGd0RSQlBJNFVkeTFFVlNqVjBoaWRGTG1qREg5aldPQ2FVaEJDS3E2enBQ?=
 =?utf-8?B?bnB6enVSbGN0ZkNidmRuZG9PeGlCVjlEVUx0NzlLZ2xIQnVqUFdWSzJicVd1?=
 =?utf-8?B?cEI3b21BWGhuVVVHZEpXMktDTWNoeDJrbzBveGtONDFmcVV2OWcrSzJEK2xP?=
 =?utf-8?B?MWRHZVpMUGpmR05yWnNxMzdTdlNaV0lqT29YUm9BUkFnOVEraUlockdjVEdj?=
 =?utf-8?B?SVVsaTk3clowZmFydjRsUzZZUEVpRDN5bEwvQzVhdk82dkZ2dUh5N1Qvc0Mr?=
 =?utf-8?B?VXNLL21BZklYbWRWQmNPZy92c3VidFF5R0NtTG92TGdxanRpM0NKd1ZFUk8x?=
 =?utf-8?B?SE85L2pjTC9IRG5vb3M1MFZDWCtFVFlMZjExNnhMcm5MMjdnTjA3TjMzRUxa?=
 =?utf-8?B?VkVrK2xXaUkxUDIrTzhXaWhnNGcrNFpuRGJ3d2c2M1VqcmRMQkI3b2hCTmZK?=
 =?utf-8?B?cUE1WGM0VE1KQURNWkprNzJSTXdNMmdvV2J1dGI5bjlybEZ5am9veG9IS2li?=
 =?utf-8?Q?/B+9N2B/S8j1j+tGj0Xvlye/K4OztZZc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGdNRW92d2dKc1ZORmN3b1JWNlhmV29NSm1JUm5pU1Q5bkF5a0w1WEkzcDA0?=
 =?utf-8?B?eW5ibmlkY3hlMUdpUUIzdHo4TFFPazRjUG5sdVl2WTV4Qzl0bW9ZQ1RsVVlM?=
 =?utf-8?B?cnE5Zk9yZTl4dGhZTHlwUHpGdndoYzhQOUtnUHY4SlMrT01CMGU1WDB0N2Jv?=
 =?utf-8?B?RFc3RlBlUFVieEdIZmcvZ2hpUDVJOXdTaFVRV0lXSmsyc0czV3ZoelZmWW44?=
 =?utf-8?B?OStTa1RWTWN4OEpqS0V2bUpiTDVBNXdwVHkrNk9TUDJ4UFBWUlVlb1RvZ3Ft?=
 =?utf-8?B?WTlGcDhpQ09hQWhMNUg4VkJvSDhIeC9FOU1adzdjOE9iMmVIaDJsa09YRVJP?=
 =?utf-8?B?Y1NEMUJRWVY4THB5T2xOZzRPMUIxcUJiTlIvc0RMbXFSYUZYb0U2TjhXZnRx?=
 =?utf-8?B?LzlEYWVYL1J5SnFlVXRDMHdhQ2tBcXhNRUsvRXIrVnpRc3NHRGsyRVZaWFo1?=
 =?utf-8?B?Y0ZXUGcwdmNZaUFqb1o5YkhBZjVXc1VIL1lQblA1endMcVBtWVlaeWdBUllM?=
 =?utf-8?B?NHY1QzgxK1ZockZ3WnYreDJaQThYVVk5MTEwTVZmc1BkM2szM0tEOHY0QWZS?=
 =?utf-8?B?dFRSN3VXY21TQTZxZ3lBMW5rOFBSSDhEcmluT3lRY1lrVzlaU0xaeFFDSW5s?=
 =?utf-8?B?dk9TbzVHSnR5YW8yUEJGTDJwNlU5V0xzUi9pejZKTTJiMXpJelhVMVVadXZj?=
 =?utf-8?B?ejI3UG5YNnc5b0k5L092UTFlLzMxK1g5blBiQTJ0RHE1R3U5VEhCOVJOR3dj?=
 =?utf-8?B?NzNaRS93VHNVeUU3Y0o5SGtZWHVEREUxeEIyRm0yWG1WQ1A0aE1JOGFMTEhU?=
 =?utf-8?B?SVhrMXBPTEZBdzkraTlhNVdlMlc1UEFmYi9Cby9EL0VuU2pXamF1SVQ3WlU2?=
 =?utf-8?B?Uis3OTlNbWY1RFlmZ0ZxZ2pwS1NYang4V3NMdE1rSGFCWklUV3lVOTZaL3Vq?=
 =?utf-8?B?Q2c5TUxPYVhqZW1FVmJYMkFuakNSTmErVnFNd2w2WG5YWm5helFENmsvK1Yz?=
 =?utf-8?B?RDBreFlLd2ZhRFJlNmJjc3pRZ0NCSkJhRlc1amd4cUJJNGI2MVBGSGd4VFBr?=
 =?utf-8?B?bE5WbGhHamRTc3pTWW1kQnprWGhMUzFWeThaMDhJc2pLbXIvY29XUUF0QmVx?=
 =?utf-8?B?SjRkZWo2NWN4cmlKdk1IT0pBN0dxaEt0Qno5bFR6WHFzUTBqd2QzVHQ2T2hj?=
 =?utf-8?B?T3B5UVhzS3psOXRXZTV3TlUzNllUUGk4NG10dUhFL0Z6KzB3eDBYdER0UkVl?=
 =?utf-8?B?U2hWSnZRaUxYS0UxS0M1Qmd1ejh4b2hKZlN3TjRVempUNWVXY2dyMTFaMU9D?=
 =?utf-8?B?Y0F1S0cyTmszRHovZlVvUGd0bS9UVmg3Mm5FdHNrYTZWYzVoczdYTld0c0do?=
 =?utf-8?B?RTNkRUdlSElkamdXNm5MOXZQbDRnTTlEcTNvYzgzMW9idGdwdFlaU0ZPVVRr?=
 =?utf-8?B?dEpvUzlDWWFsKy9leTRjM3hXZVlHVFF3YW5TMEdiRjNlM1NpV0xVVXI0b1NW?=
 =?utf-8?B?QVF3UFVHNVB5YlkyTVRTeG5QQUFIUmhpTUFYMWZTeEt3NjRTNzNvWk1qd0lE?=
 =?utf-8?B?dUpzemlOZXltQkdGSUZidDh1MkM0YWV5SmVnZU5MUUd1ZEYzaGZES1pkYyto?=
 =?utf-8?B?MFdYQ1hYc0lBK0N3QVRrNWRWZ0ZpanJJWmsvK3RXZXFTQ2lmWU5IOWRiRU84?=
 =?utf-8?B?TVNuQUF2cFdPK1Qxd0dqaisxVjN3bHc1UHB5aDVjWWxZOGdKOEp3cEhlOHhl?=
 =?utf-8?B?R1BRaGRrU1k0SjhjdGRpcHg1bzVTNGtzUUd3YnNLKzZKQUxGK3ZaZzFJTjEv?=
 =?utf-8?B?ejdQUUhOeExnVUVEVXBZdy9lVGR4bEdZbTh5VkR0S2xZMTdIZUNLTWxYSExl?=
 =?utf-8?B?aW8rcmViWVdVaDVuOVhsTWhJUlpDSFpZM2NZZWF1ZXlCaTNCd2VQMHVITzVy?=
 =?utf-8?B?MUtjMmhpbDR0dVloMGFxaW5vREg0WTZjT2RzUXZJNGdKeU9tL3ZsTEMvem1s?=
 =?utf-8?B?R2RuMWYzTUZvbWRnVUpHdElhTFJkUlFCbFRZYWVmNEhQQi83SmZRbHIwYlY3?=
 =?utf-8?B?bFZMakVlSHhTVVZRc2YvV1FaRkM0N3duSXF3U0dnSGxBeHZxQ0pLalEzaFhT?=
 =?utf-8?Q?QQRLjE1Xf5paZ7lc+P4MjnNt3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05824d9b-8943-44de-41e4-08de0ce70764
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 19:05:53.6223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NJTNX69ZZeOqJXckWYQv8SDrInk1w6Y68vwWJtRwRNS/i26DNkFEQgTGaJqfSQTGF1BZmmeviI25dIdJSTcxYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6415
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

On Wed, Oct 15, 2025 at 11:38:48AM +0000, Poosa, Karthik wrote:
> -----Original Message-----
> From: Badal Nilawar <badal.nilawar@intel.com> 
> Sent: 15 October 2025 15:16
> To: intel-xe@lists.freedesktop.org
> Cc: rodrigo.vivi@intel.com; vinay.belgaumkar@intel.com; sk.anirban@intel.com
> Subject: drm/xe: Prevent runtime PM wake while reading rp0 frequency
> 
> The rp0 frequency is a fused value that is read once during probe and then cached, so there’s no need to trigger a runtime wake when accessing rp0.
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_freq.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c index 4ff1b6b58d6b..701349251bbc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> @@ -99,13 +99,8 @@ static ssize_t rp0_freq_show(struct kobject *kobj,  {
>  	struct device *dev = kobj_to_dev(kobj);
>  	struct xe_guc_pc *pc = dev_to_pc(dev);
> -	u32 freq;
>  
> -	xe_pm_runtime_get(dev_to_xe(dev));
> -	freq = xe_guc_pc_get_rp0_freq(pc);
> -	xe_pm_runtime_put(dev_to_xe(dev));
> -
> -	return sysfs_emit(buf, "%d\n", freq);
> +	return sysfs_emit(buf, "%d\n", xe_guc_pc_get_rp0_freq(pc));
>  }
>  static struct kobj_attribute attr_rp0_freq = __ATTR_RO(rp0_freq);
> 
> LGTM.
> Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>

pushed to drm-xe-next, thanks for the patch and reviews

>  
