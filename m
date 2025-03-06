Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73131C282D1
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 09:52:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3528410E928;
	Thu,  6 Mar 2025 09:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MkGD8dWI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C4210E928
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 09:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741254725; x=1772790725;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8aFlTvSVb/zojydypqCsyyR/+LlbzZLGxMSOHNnySkI=;
 b=MkGD8dWIwH5FlhZxYRW0dox/V7VGl9nOC8vtHPt/vCtQOvx6OwNnBTrX
 q1ESRvazC4G8h+PulfxTihnQLgCVXj2wIAoHu8pmZsH2sJhC830bvfTBu
 h0GdYOqV9FdJ0OxCodIJ8kHoNS9pwsNJ1nb4E91h7roWBgBGF1aVn0lNF
 cqPnZOyHksrwmGvsSnzi3s1FSeO5wJb23BY93IN4RVDEqr6fhApvJGYif
 OB7ZGsPdr+FPmFHawd4AEVs3RvvUBw3HDFJXD8ZF0nLjilFJt6trgjmNS
 YFQZ3wr8ZmOV9UCRgc2v4CH8AyHIupkKnI6UE4ukZasJhANayXXYjCUUn A==;
X-CSE-ConnectionGUID: Ipc0KFOESKWOtfHohzO3QQ==
X-CSE-MsgGUID: C++FX0hXQTKJ7urvthURiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59800123"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="59800123"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 01:52:03 -0800
X-CSE-ConnectionGUID: o2l8Qi6rRdOvbv/b/Oj8kg==
X-CSE-MsgGUID: rybPgMNmTNqrLM9qyhvQOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="149752176"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 01:52:04 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 6 Mar 2025 01:52:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Mar 2025 01:52:02 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 01:52:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TkgJ1cgkP52hw+nwXOFkenBfhwWtKEWjhlQHPupqaro1uKRJR9RmcKp3vQV6y2OeN7EVPg7Zq1moQEW8HI8aer03pvTJXw/UGte6Pe0GQ8q7bKrgMVtr9+IvmE1aNNfkit7JXo3mZnVVaAyuLBdmAnO9yE95rtMddhadkHZtTPP/qlUNpnhZetKBfAhqM9Pslr7iSVCogXgMwLZbUDOl0Scy/u7j/RSfw2Fef/K2XAAWbczTJlpIJkV8C/75m5fpXyQcXVJpXMNXFhhxrFx5UiOEWpkqA19HqwIrYQ0Z1EY8NP7k3YvUoitpt2ODxsnvqHuPByVtmANbb39sa9x51w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JyMxUwEOAY84REibmR7IrodEi5bRY1y1d9A5pHxGmwE=;
 b=qbtxa34V3BnSjxWR8MOaIpMpYjZGzzt4F3X0UOlIwhQRYbEceTCUA4Ze3hLxhDc+HVXiBdL4tqah3s97A9LeIJodESvDn3IKgeUzLzLkk7RXQZ7yqP2D84UtIaQnmnGHG2iJuimSyO95TLZI9KwRpGnONZliXPFfV+U0buWVKn0+arfJKKYi+n+UtOfvqTOF8mcv++tyfIyhajUToTYsQYe5lLKCl1ms75Q6zYzPFiw2fs5E4IEW/zscgVv2IFp0/9xA6wF6wpcbzaxWsewXHBdlJmRM01QPvOqgHvi5ffOuwfaGNtbI2dS8GKLK57PbrsJ5nZ/xUdBRySwTP5ph/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3238.namprd11.prod.outlook.com (2603:10b6:a03:7e::30)
 by MW4PR11MB5889.namprd11.prod.outlook.com (2603:10b6:303:168::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Thu, 6 Mar
 2025 09:51:55 +0000
Received: from BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03]) by BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03%3]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 09:51:55 +0000
Message-ID: <1e1ebb5f-327e-44a4-9c5f-91ec9c382539@intel.com>
Date: Thu, 6 Mar 2025 15:21:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Allow fault injection in exec queue IOCTLs
To: Francois Dugast <francois.dugast@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250305150659.46276-1-francois.dugast@intel.com>
Content-Language: en-US
From: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
In-Reply-To: <20250305150659.46276-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0006.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::12) To BYAPR11MB3238.namprd11.prod.outlook.com
 (2603:10b6:a03:7e::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3238:EE_|MW4PR11MB5889:EE_
X-MS-Office365-Filtering-Correlation-Id: e679bfab-5549-49bc-c185-08dd5c948747
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?clFyMGxWMDFLKzR0czhGckpEVkRZb0grcWFGTEllQ3hyNFdxRVA0Si9CQXhV?=
 =?utf-8?B?ZVVBcnFnNDJmbCt5eThEVUVUUzRLMDJvZUJTbzB3RUk4SVJmU2F1OFkwOGZ4?=
 =?utf-8?B?NVh2WjVyb0lHR3JjVldUZDhMTVkrODN6Rk8vOVNiOUhQRURxeGJOSWV3VDhi?=
 =?utf-8?B?a0dwSFBjZU11aW9kM3lvQ3Z3b1l5aUJ4cU5Ya3l6R09vanp4SmNsTnVyRG9H?=
 =?utf-8?B?T0dpZXYvYVgraktwYkYvb1U0REk2am5hQ2NVOEFYazNJTVdGR2t5RHExTVZw?=
 =?utf-8?B?aitHRmhFdkUvOHhVLzBSVkVFSFJhMkJoYmQ2S0tuNkxTQjV5cWtPWTVhaFB4?=
 =?utf-8?B?aDFNOThNdnV6RlRqLzdQNFptOHVLUjhCU2dnemJtMVhHaTBhdy9NVnBGaUxm?=
 =?utf-8?B?bi94VjYrbm9Fd25wdHFDUHcvVHhvUTFZUWpYMVk3MDJiUG50eVEyWmcxUmMw?=
 =?utf-8?B?am8yeHlrdU9Db25wSWRTaFVUZiszeE04QVZYck5BSzZqYUhOSHBhdFpIaWYw?=
 =?utf-8?B?aG1PSGE0bnR3b1U2VWxtamhoaXlDRG1iOGdiclhTVjFoTjc1WUNJanN4aWFj?=
 =?utf-8?B?Nyt0aVR3d1RmZEtTeENtWmN6Y3ZIaVFCMENRMStHM0d2SXByMThNaklzNDdj?=
 =?utf-8?B?M0VzVUFzRncwWVlZSTRhWjFCZDJnSzNzVlZrZ054N3N6VFk2ajZacVh2ekNq?=
 =?utf-8?B?Q0tuWkhacGNMZU1vRVllUVc4b0trSjVtUitacHh1MHZrSHpkU3k1OU1pQk42?=
 =?utf-8?B?R1dKT1JTVEVveUpCTkdRaUR4MjZWeXIyYkhZUU9RSWhUSGhzcEIxNTQvQzly?=
 =?utf-8?B?Q1BJZzdPWEVmcXlnQU02eXI5VVBHVmVNNVlVRkRDcHVydVBvY1BjWFNadndJ?=
 =?utf-8?B?REhuZnVGZUlRRHVaQ25ZY29vTkZFMnFObXR0TWtxL2h4aGhSTDdwOC9NRnR6?=
 =?utf-8?B?YkE3bHk4YkluUWFORllZdGg5SlB4eTZ0Vi9KZ2JJaU5yMmRJdC8wUXF4Um82?=
 =?utf-8?B?SnJSdkU1U1RuWEU0b0Nid0tuWjVHdlU1Z2tXSVIrVUVyOXg1K293UWJhL3Jk?=
 =?utf-8?B?U2p6T0ZTejlPbWZjWS8zc2MzZEQ3eCtsaUJ3czBXd1ljUGNwK1pFNWVCcERo?=
 =?utf-8?B?RWNkYXNxSVZlWmZxVm4wQitURXMyOU9YT014SVV0K3BMa3JYSDdYMjk1M3Mz?=
 =?utf-8?B?M3F2QzVRdUpFZytPcXBXcmhjdGdQVDd0U3VWN1ZkeXNONWJvTVpCcUFyaU5v?=
 =?utf-8?B?ZmhrUm1NaVQwNG5BUHhzelhJM1NMa3ZxQW9aSWlaeEpHSXVHSUpSazdDYUdu?=
 =?utf-8?B?MllZQ3BybGNyQlBqellUU3NRTUg3L3pkT2JGdXp2ZGVGVHlnSDlnSHYvL0pn?=
 =?utf-8?B?dGprd1BDREdXTmkwQmZTNGloZWQyaVloZ05xR3VmVWlmMHppZVdkRlZMSVZP?=
 =?utf-8?B?MDVqbWVkeGd1OVhjaHQ3REZ6Tm5ZM2tiZTR5N1JQb25zWi9MOTdjdkpLWW92?=
 =?utf-8?B?YlhjZzBtWlF0ZEtFeWUwQ0h6V1M1QWVjS3RXVU9RZ054L1JJd1Q3UitvRjBC?=
 =?utf-8?B?S2UvZDhIMzM3RVgwSnlGTm9neGltV2ltUlJQVGdnbXVvc3ZHbDQ0ZEpscXM5?=
 =?utf-8?B?Q29CV0RnQlZCd2luVFV6VmZSNEFRb3pNaW1ycEtrTFdpVUhyR0VsYjgzcTlJ?=
 =?utf-8?B?UmRTR2wydldSc1lwVEJyYnRneUdGcEJNWnptNDV1YkJ4aGZ3YlJuRUlmM2Jn?=
 =?utf-8?B?bWVIb1E0SUdpU1VNNk1iWlRHOW9xT1Y2cXU0dUhRSWlXRTUzZ2pKQk9pMTRk?=
 =?utf-8?B?czAzSW9PS0hRckxmUkEyUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3238.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWUvNm1pUWRCNjkwcnAvcjhEVU5xQU9LVExITllicVR3MGxwdTVyOFRTNzQw?=
 =?utf-8?B?NXdQOE11WUhPVlBaclFtcmcwK2tqSm5JenJ3TTZRb0Rnd0FsOTV4dE9raWhH?=
 =?utf-8?B?SERFeDEvNENIUWFNK3BjQXcxbGZBWHZjTVNCeDVEVDJ4QUkzMlhNOXdET0Yw?=
 =?utf-8?B?K3hGTmxLY1NBRWQrY2ZiRHp6Ti9lR2UreDNUZktEQWlKdGIrVFFwbzlyMUhS?=
 =?utf-8?B?U2dNeXdFRzdINmJRMG53U2Y2MUo2bnMzRnFxRjdCTTg0R1N3dWJDSGpNbWkv?=
 =?utf-8?B?YThiaEZ0S3M3MVZXdWJXaEFZejVnSHl3RlZVSjNuTTRVdlFzY3RDOW1ocnVh?=
 =?utf-8?B?SnA0SmpudkVieHUyRGxyOFpvZVlXdVBHK216eldCaGVlL2lPWS9TT25STkwy?=
 =?utf-8?B?YVBtZ0M3NGM3NW9NZlJWYTh2WVhYOUJidkcyQnp2dk9URXcxVmpheEs1dmV6?=
 =?utf-8?B?djJvRndmYThsMHRmK3VReGt6M3AwVEtNODk2dEJkbXk4N1JNRVFkQjN0anJ6?=
 =?utf-8?B?dkhTVTlScElyMkxNR1hYa2Q0MU93NitDTnZXRVVYa1FLNHhwNCt5Nm9VbEVG?=
 =?utf-8?B?Z2tEUllMMlE1My9JbmhaTTQzQVBvVjdGaDRXMWdDK2dTdDA5Skt1VFh4ZUo4?=
 =?utf-8?B?U1ljQ2owN2FwTEF1VU9YMUlpOEpIQzBEWjVGUy9VWlFhOEUxcVBJVlo4M0tU?=
 =?utf-8?B?KzNzVXpLcTFaSE52YUhSMSs2ZzNGM3BSMFZpdDhQOHhrVXJ4Q21zTXptdFBW?=
 =?utf-8?B?R1ZUb0hBOU1WanNhc2dmNTR1OEdBUjNlVGU4aStpZ3R6dmdNSENsaUwrQUlZ?=
 =?utf-8?B?V1NDR28wMVBuT2xzaXRZYkNDUUY5aWVrQllLL3RBdnpOazZTNm50MUl1Q241?=
 =?utf-8?B?VldaN3d4OXc3akNKTHNudm13a0N0dDk2b2JjblNBbURZLzZDdGRpbWlBZkF6?=
 =?utf-8?B?K0FBQkVUNWdKd252MHRYSFpvL2x3b05rcWpyckFmcXM2WTBKUy9NOTgxTktq?=
 =?utf-8?B?a2NrY1AzVFAvdmhwQUV3OGRPdlMwdUVVeERWb25aR1FOcVI0WG1GZGhqVW5U?=
 =?utf-8?B?R0J2RVlrWitrWit0V2FZZEUxS0lhQ01vbDRpU3hSOWpXUUh5SFdFWmYzZkZD?=
 =?utf-8?B?NHcrTjFTMkJDWFZoQTFSS1NYakxQN0UySVZKdjJxK2h5eEc1UTFRd3pnaisz?=
 =?utf-8?B?NnQ3WWVvWjlKcEpMTjZueFZCbktaTHh1YkQ0K3BFdzlwTFRpOUdhZjU1TEdZ?=
 =?utf-8?B?YVA0K2JqaUs0V3ZCTnNZOVVPTTNWVjV5ZkkzVTRURTdweThXa2tzSzdFU3Rm?=
 =?utf-8?B?dHpRa2RCRTJ4aU45MXdTWkJKWlpEcmhjOTJZUURLcTZjWGFmT0dvcVFzQkxV?=
 =?utf-8?B?UHloRkpIanNnUjk5ZitteHV2OTJFaWZzZll6eUNTUjNZM1EvcDhuMXlZK3E5?=
 =?utf-8?B?Wkw3QXE4ODFSWFlhZDlZeGpvZG45a0tpbm5xbG8xdnJ3a0NjNmwyQjVVSk5k?=
 =?utf-8?B?WlRiM2w3YkQxWXN5endLdVNOd3IxZm54SDFORzhuTUMzb0Fock1WTGVuRDJi?=
 =?utf-8?B?cnc1MXVUdEhibFZ3ZUtMY0I0a044Y3EvNEhhanRrd09FTy9DUVQrNlJpdjhs?=
 =?utf-8?B?b1A2SGkwMENublo0Q2tmQWJPN3V0UURncFFMcHZZZUhRT3M2dWdLS2haOExU?=
 =?utf-8?B?NHJVNEtSbWtralQ0a1dhcnlKY3lQTkFENHhWVzlqSDFUKy9PZkp4V2doc3l6?=
 =?utf-8?B?Z1NEeDB2MHhDZ0tKdEpJQk5ZWHdoWmkzOVJlNkFYZUxHSEJzTjdOQWFYV2sz?=
 =?utf-8?B?clBtbGhlbE1WK01CSkZ3Y01Kak9XeUdQQWJLa29zMjZ1MjBMQmNPTlRpeDdJ?=
 =?utf-8?B?RlY2L1lyYmlyOTlCTVdQSGFtdDUzSzJoMHJnanltekNiMUdFZThyT1JROW9j?=
 =?utf-8?B?Y3h2cWNSY2dYNlRTY01CR214R0hRVTJYK0hyTTlqa0doZXRVbHFoUHNuUUR2?=
 =?utf-8?B?NzBLb2l5WW8zQW8wcXZBUytDWXY0dE1PaGYxaFIxMXJRTkoyY1VUQVI3ZWU4?=
 =?utf-8?B?VTE2WmVwWkFaWmx0cFovRXRpYmVtd3c4ZFAzcjQ4RW4wc3l5VjVyTUlaeFlq?=
 =?utf-8?B?QUlyQUZUemRuOE5zV1FpRE84TzkwK0Raano3c014UkV1OWJHdHNRSjRVZ2F3?=
 =?utf-8?Q?2Y2PT1WN7/RhGh2ZjkxLuoE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e679bfab-5549-49bc-c185-08dd5c948747
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3238.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 09:51:55.4444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fZ18eTzagQHAMp5JD9lRFuKfoGL5xrx1nlEwGjX45HuyM7lhgvlYdM0cP2g2/h0nb3ebDxCt8EatB2Mhde3i7icIz4hqmZZyIA/UqJtJv3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5889
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

On 05-03-2025 20:36, Francois Dugast wrote:
> Use fault injection infrastructure to allow specific functions to
> be configured over debugfs for failing during the execution of
> xe_exec_queue_create_ioctl(). xe_exec_queue_destroy_ioctl() and
> xe_exec_queue_get_property_ioctl() are not considered as there is
> no unwinding code to test with fault injection.
> 
> This allows more thorough testing from user space by going through
> code paths for error handling and unwinding which cannot be reached
> by simply injecting errors in IOCTL arguments. This can help
> increase code robustness.
> 
> The corresponding IGT series is:
> https://patchwork.freedesktop.org/series/144138/
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

LGTM,

Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_exec_queue.c      | 1 +
>   drivers/gpu/drm/xe/xe_hw_engine_group.c | 1 +
>   drivers/gpu/drm/xe/xe_vm.c              | 1 +
>   3 files changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 7c5c003d3c40..606922d9dd73 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -203,6 +203,7 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
>   	__xe_exec_queue_free(q);
>   	return ERR_PTR(err);
>   }
> +ALLOW_ERROR_INJECTION(xe_exec_queue_create, ERRNO);
>   
>   struct xe_exec_queue *xe_exec_queue_create_class(struct xe_device *xe, struct xe_gt *gt,
>   						 struct xe_vm *vm,
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> index 82750520a90a..2d68c5b5262a 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> @@ -178,6 +178,7 @@ int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct x
>   	up_write(&group->mode_sem);
>   	return err;
>   }
> +ALLOW_ERROR_INJECTION(xe_hw_engine_group_add_exec_queue, ERRNO);
>   
>   /**
>    * xe_hw_engine_group_del_exec_queue() - Delete an exec queue from a hw engine group
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 3dbd3d38008a..338d98533fae 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -270,6 +270,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>   
>   	return err;
>   }
> +ALLOW_ERROR_INJECTION(xe_vm_add_compute_exec_queue, ERRNO);
>   
>   /**
>    * xe_vm_remove_compute_exec_queue() - Remove compute exec queue from VM
