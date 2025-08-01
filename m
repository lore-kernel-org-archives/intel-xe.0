Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632F3C87FCB
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 10:10:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B46910E00B;
	Fri,  1 Aug 2025 10:10:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aOcSQ+Yz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A391410E00B
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 10:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754043019; x=1785579019;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LlvIerE+SuvXHJsQAgn9EnXa2HFpU0h85z/Czi5v0eU=;
 b=aOcSQ+Yz10TCTJDserYFEEiCMUbpHBWLsVPRnsQk9XAJZS0ARj/FtbDz
 Bkq7qT0w8bK0RiIEKA1nkBvljhWOG/TvFXd+PLeruQ/hjF8jcegaj0Kx3
 MOVcnR73aUeNQZIj6f1fX9ARNAVOz0SHTuwRjnwrDI1SLmg5qjbAw6QqW
 Qj0tVDeRE4LXdM8Fq4I2g/P7KDeC81o0/gu4DqQfeDEis+LOJPb4iuNsf
 iysa372q1/qcKx2mZofH3+tziuoWsPttk+N4ybAOigc5eBkGEX8HI54uG
 IG1ak4LuPwgo4GxGPaN6e7DSQ6733WNuhKy2pYsQ4mnB6eGr5+g4ecj7S g==;
X-CSE-ConnectionGUID: fL98WgwuRTK01a7V95hcSg==
X-CSE-MsgGUID: v1MVP3QRQbmVdL+6ynr+6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="43983111"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="43983111"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 03:10:18 -0700
X-CSE-ConnectionGUID: R/dZcfcuTui4Pj1rq6tj+w==
X-CSE-MsgGUID: 9P31DgFiRwy1HwDZyfrymw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="162780354"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 03:10:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 03:10:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 1 Aug 2025 03:10:17 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.42) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 03:10:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yielbihX9Llgy+Q+0Zy4zF1Y2qXJzlUUBOW5EUvFPAJu4C2lUu62GbzeI2kneyzSonAnenZMkqa/kaD/PIYZbFkbchdmuFu7r0gUB6X2U2CS+xu+B70GKXtSCLbIlhWU0blP4OZrcWL0FOfz0glKja0tsz5ndc6PIHH9T2T+/Q9ro1dgBiivRNjqt1RYoixP8Ge7fHNYPKSTVfKvX3RX95Rno/3i4nVotP3r6j1hiLFB32leWNIDNKOmC0tud0+00/NFJfUtXjX5DUfIcm5jv4DExNnM5or9QCAcw59LKszJy/6OwbRX27uZYkYQXcLF+5xvE0uTInC1RNDIH+jTxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kq/rVfF+HcTfr5zYs55fNjkzW9SOn4GAe1HFx2EHHNA=;
 b=HCNmt6wXSQszFHS8FNBiN5Ba6HkXYIssnGEOWLW8ugHScgP4Uq+thQ3CP2nURFv6zQC+t9h0UiBMJikXJn1l5BEiFgVH7pq7I727B9b4abeDY7dneHvQDsSL0TfCxDLvT90XdD9vZBDgx6Y0oVKchCBwkzMsB72YyIqTSHWE0k/SBhEd+FzDiusoIS34CVY8d0U7dEEe6TbhZ45dOem3PWY/G44dcTN16y7PLoBqUqN+qTXVkBqBW6w/mWn8ewYN06tDUmOYAd6fjC7vHq9eiXdcoLzPCAyIB8ZLLn+IPsrWz+JL3bQmT1pjlXC3cxbmQ0vkGC/c4D1nMMtcEhUCVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH0PR11MB4917.namprd11.prod.outlook.com (2603:10b6:510:32::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Fri, 1 Aug
 2025 10:09:48 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8989.010; Fri, 1 Aug 2025
 10:09:48 +0000
Date: Fri, 1 Aug 2025 12:09:45 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/pf: Skip LMTT update if no LMEM was provisioned
Message-ID: <20250801100945.ieq77v2cjvkaxopl@intel.com>
References: <20250731194633.179852-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250731194633.179852-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DU2P250CA0018.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::23) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH0PR11MB4917:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b53c809-9f4b-48cb-5cda-08ddd0e38bf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFJmWUlYQ3I2VGRZREZyM1F2S2tQUGs2c3NqK3JkZ0tzUzQwU2swOStOTWJm?=
 =?utf-8?B?MXZPbXhuVkhmQ3RscGs0ajQxZ0ZScm5uaWlBU1lFcy9Eb2wxU3R1UklhUXVP?=
 =?utf-8?B?NzJjUDI1dnNWa1hBWFBwMXMxa0dhdSsrc29ZYWV1VDlMZFBUUGxtMDV1VWF2?=
 =?utf-8?B?WkVzN3AzS0NicllUaUk5b3ZsK2Z6V2wyNlFrWUlrVUpnaFRCU2NnQXhLV3Yw?=
 =?utf-8?B?MkVBYXRtc211NUJFOE1xZmx5Vk9NM1ZmNnRibHVLcGxEd0NyVkV2cTZSVzAz?=
 =?utf-8?B?YWxEd0R4TVB2WTB5cEI2dVNVMlFYYzJSK01uVkdGR2M3UFM0SVhQdldrSEZa?=
 =?utf-8?B?djYreVY0c3pDa01TY0thQjN0Sk1JbncySmJHZXFMbUxteFFHTktvRVlWam0z?=
 =?utf-8?B?aXJ4Qis3ZUxQZDk4Z1ErRlRXUC9oUGNkMGxUSzYzNGlZVFhDeHVnTzdNZldt?=
 =?utf-8?B?SmFNRTNGdThKY0JhdnhyN2xMUCtPTE5vZ0RkMDFzNVByRVF2ZENaUXcwRytp?=
 =?utf-8?B?enlXeENDNktvQ0dVaWlPZ0U5Z1VZZUFSMzA4alpoSEtiNE5rODNsa3BnaGMy?=
 =?utf-8?B?eDg0MzgvWkVJSlRCUk1vcGlRekNpMWR0QkRnOE1UWU8vNHAvdm9DKzkxZTJU?=
 =?utf-8?B?NGpLRExJbklIZ3QyV3lISTF1NTdtK1Nkc0s3Mm91a0tiZFhXUkY0emUxNkRF?=
 =?utf-8?B?dUNmeGk4cTUvR3RvSjBFdU50alN6ejJ6YkFCamZFM1J2dThpT295ZDVObXB1?=
 =?utf-8?B?M0dOSzUraWxGZ1lQcU1LblVXc1B4cXFLZW9BQS9lTC93ZCtldHJTRjV6NVVI?=
 =?utf-8?B?VzhRMjNEUytHQi9pSWtJQUpvR1F3MzArazJNYjJpalVwMm9iUlpzWXNCSUdk?=
 =?utf-8?B?Zms5TjFGcWhmSjNJRHp1U25yM2R1MERTbFhBRGh0VzkvemhONVpHNnJKMVFL?=
 =?utf-8?B?SWpjSGthMkl4K1kya0pFREw3aU5sUjRaYVBleTZ4T01QOXdvOHBqd25GRHUz?=
 =?utf-8?B?ZDBVL1VkYlNERTZQSldQRmxGTkdFdFVJU0F6VWUrbXFFeElocmtVNXIzMDZV?=
 =?utf-8?B?WVA1OFAzZEJ0VSt5YXl4NlIvc3VaOU90aTJrT2YyejUrZEZaTC95YXNWT2pD?=
 =?utf-8?B?RkRYaEdIcEprTlhjRHJQQWpaNGpmb041TTZCaXQzdnZLekV4RnJwMURFcGhn?=
 =?utf-8?B?MlQwWm5obHFxTEo4UHlGWHFNdjNRSk1NUVRKSS9zZE5HbXFFaGJVTjBXdEND?=
 =?utf-8?B?aU9oYkNWSmNGZ2F0OEp1Z0RnekxvNEZieU82clh1Zkx1S244MFZzNHBzenNj?=
 =?utf-8?B?SW8xVmtHNnhhVkV2UWZzcHgzZERLWElTNjRGZDhIUSszbURZTGs1TVgyUFkv?=
 =?utf-8?B?ajFTSVVPYUluak9WQzhqdUFZNlJBcUplV2pFRS9OeDBhaFgyb3ZvOEw5R0Nx?=
 =?utf-8?B?MER3Y0locFpYSVkxUVdkS21zWTgzQlpHL00vYVQ3T0V5dkNGWjNhSXZ5VFZ4?=
 =?utf-8?B?am5NMDZobm5YN1l4MVlBRTN6NGhZaWROc2VkbHdIVC9PcDlIOWRNTWZFWHdD?=
 =?utf-8?B?L1pEYzRoMjYzRy9wQ2xEd0dXclMrRngrWE1BR0ZzdDVlemlkcmx5YnRuV1JG?=
 =?utf-8?B?cEIxc2MxVWhwN2tIcm10ekhreFFDbFRRRUJ0QXcxVXhuUGNwSnkvYXZubkkw?=
 =?utf-8?B?SnMvRjFpN0J1b1NlZGZsQk1uTG0zUnA5MjM1VTc1TUJRUjd0YXZjL29IT3pV?=
 =?utf-8?B?QmRLUW9NVFZOY1oySFF0eDRSVmdNUDgvbmtyNU56R3Y2b1QyUXNRT1BpRjlM?=
 =?utf-8?B?aHpxMnpwVkh3Rm9iMDNiTUFkY2ltdzVUS3JYUFZKeGc1cXpqUWFxUzdMTmxt?=
 =?utf-8?B?cEhHMVBERUFrK2VkclRNT1VQU3VwWkI3dkVDN1Q0ckRwUVZ5Tk1qSHJ1Q2VN?=
 =?utf-8?Q?lK7CSPFj3eI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEtFTXdESGVheVZxa01ITU1nOHp6a2hMcnZqVTVxaW5qaENxUkRpZmdZanY0?=
 =?utf-8?B?WVBXbTlzT0o1RUpRUTVmM2ZzQnd2eDNrczIvMndDaUlHY1JrNmxpVlhaZ29V?=
 =?utf-8?B?WjB1REFnZmltRjg0WFd0TzNsTmI1MmU1OEVjcG9KN0dPRlpEK05KdktYTWhj?=
 =?utf-8?B?aHdtUUZYSXB2RW94bzZMSXkxWitzRDcwaCtmdU85T0ZTVGdCMSt2cG9GK2JR?=
 =?utf-8?B?dGowMU5XajhzRW1QYkZSQy9HWVRFMzZ3Y01ndVNTNklkWVhQQ1lHemxaY1Vp?=
 =?utf-8?B?YzJldVU3TjNrMFoxWmVrQ2RsZzVLNTYzanRoa3VVMVJUY0QrV1ZwV2VuY1JE?=
 =?utf-8?B?ckhFNlVaL1NLVWlQNVEzYTI5a3ErR0Q2WDUvMytrNEhHZjZML3hlaTJESkNC?=
 =?utf-8?B?WmxqM00vTjJqVTN5NHZCbjNHRUpKNm55bmRYUG5FU3ZLRXk4amV2ZVFuQmhF?=
 =?utf-8?B?SXNrYndSbVFHbiszS0l1bUptK2x1aUhVSWRpMmFBM1VBOEVRczMzSitIeU0v?=
 =?utf-8?B?aCtZNnhJSHRuNlg1Q3NyRlZ5a3Boc0dMd2tCdWhEWFNFZDlIRkJTYXZ2UzFi?=
 =?utf-8?B?eHoxSlF2K0hJZ2RVbFFUYzdQdWp3Z3JxV3ZMNUhRdnEzYXhpUDJ1MjVCVjJv?=
 =?utf-8?B?SDJqa1ZVNDJjMkxsQTh3bFliN2p4UklLNzlOOENKWUxSMDUrSGFoRjBGeGZW?=
 =?utf-8?B?WmtMMEVPSDhKTmZHZ1ZHbTY4V2dJbzc0eGY2SzNvU1d3WWJnaERDYTdEdlZG?=
 =?utf-8?B?ZHVXaW9lM0c2Rlk5OGt6cVhHUlFwd2RFNm9xWW55YkVMdnp5anN4SlFKSVBs?=
 =?utf-8?B?YStnSFd4N0p3dGJSYWdiSXhmblcyNmxMM290RjQrQ0NVRkcxTnJXcDFUVlYr?=
 =?utf-8?B?b21xYlNtRVlhWnBHdVdMR0hta2N2cy84aGc3eWFjam90UXBqV09tUC90ZEFl?=
 =?utf-8?B?eFJXMUdISW1tRVV1amRaM1h2STNtZ1oxQy9YR0V5YnltQ1hFakQzSmk3aldC?=
 =?utf-8?B?eWs2eFZkbEVESHZ6V3FlY1hSZ1VnM2ZzdmlUcmI0YUFXZXExdU83U2pjTzVa?=
 =?utf-8?B?QW1CSHZkVHkwOFhBUExoZVpwNmU2citzdkdJK1JlN2JQTHpDb2RFa2tzT2NY?=
 =?utf-8?B?NGxxYjhlV2NEZDU3c0duc215bHp0cFVvY0xJWDluV0ZidEQzMVY1TUpLdEtH?=
 =?utf-8?B?REJ1OVJRZHI0QXhNbWJBN3h4cEp0b3ZLcCtUUGVVQ0ZZUm50ekJ4TEdiZjJD?=
 =?utf-8?B?TW1Xazk1WjE5WnZmbWg1WHI0dUJPeU5VTHJtczhwMWJ0Rks1UEYvOGszQ1NQ?=
 =?utf-8?B?MHZHbXpwcEtPMWdoaHVPN2NrVTFmVXJpRzlFUzdIQS9IUzByRmpMSjdNcFg0?=
 =?utf-8?B?MnVyTVcyU0t4dHJzcmN0dTQ0NllaRXJWYW9IeXNWaWJYUXdxbEtPbUsrYVJu?=
 =?utf-8?B?RkhKY3o5dkVFbEd0OHlNaStUTFUrNE5KclhmazlYVlJhQ2hxcVlISFYxWUd1?=
 =?utf-8?B?bUNTVEQ0N2VPMkpJdlc1SEVDUng5bUhtWmU2SnBLUGZZdUptOW9PbnowYUMz?=
 =?utf-8?B?dGdOTmpNSHQ4UFQvN1dFSG1lV0VXZEx3VFB1V253Wmg0RnlKZFlxaHVJWlpX?=
 =?utf-8?B?ZGt3bjJ0d0RyQzhDUzZCM0J1c0dxYmJOSUMyODdpNEVPTXVHWWZ6TlJ4L3Qy?=
 =?utf-8?B?V1RnSmNqWlVlL2xYaW5LVUdFNXNFZ2loZk5yL2k3N1hmOTdKTHRheUdDMW1E?=
 =?utf-8?B?cXJSVWZPTWZkSFQxMzVFd0VnZkVEM1RKaE9HbnRRaTc1MFY5SStIdnVsL3c2?=
 =?utf-8?B?dS9lcm41NTUrUG1salBaektZY1VJR3Bsek45VDFRYldMSDR5cG04ZGtsaU92?=
 =?utf-8?B?K3hnMDFMYWhtTzZWK3A1NFlkVjVHWnFJNmU0c0xLZDd4NHUwZHhVbnNSeDQv?=
 =?utf-8?B?dFdnVUVxRUtTbnV6MC9qeTFPY2w0b3lBWWRhdEM4eWxvVzRib2NkYzJkV2Jw?=
 =?utf-8?B?eGxpcWhzY2ZJOVlwcWRHdjhDWXVlazZvN2VVcHk4Y3lFQXlxUWJGMkcrNjcy?=
 =?utf-8?B?cWdYcGUxUGFHM1Z1L3Z0RkxScGFMN1FRTkFxR1Ftak1yVzU4endrbjB5Rmhh?=
 =?utf-8?B?WUQrSU9FRTYzYXU1RktEL3ltU2ovQlhKNHpEczMwazM1ZkdOUlAyQXVZend3?=
 =?utf-8?B?TUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b53c809-9f4b-48cb-5cda-08ddd0e38bf7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 10:09:48.2415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8jPxDyh8ItqG9O6XS970VG+l87wdpNnHOG9lwEkxn+Ey5i4NLll/OXFbsBvudkmNtFhHknV3etGcmKi2HPdW+5wX/qs++dKi3DcHRZx95to=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4917
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on czw [2025-lip-31 21:46:33 +0200]:
> During VF unprovisioning, if VF was not provisioned with LMEM,
> there is no need to trigger LMTT update, as VF LMTT was never
> set. This will spare us sending full TLB invalidation requests.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index f00cce81f1ff..692b174dd5b8 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1434,8 +1434,10 @@ static int pf_update_vf_lmtt(struct xe_device *xe, unsigned int vfid)
>  	return err;
>  }
>  
> -static void pf_release_vf_config_lmem(struct xe_gt *gt, struct xe_gt_sriov_config *config)
> +static bool pf_release_vf_config_lmem(struct xe_gt *gt, struct xe_gt_sriov_config *config)
>  {
> +	bool released = false;
> +
>  	xe_gt_assert(gt, IS_DGFX(gt_to_xe(gt)));
>  	xe_gt_assert(gt, xe_gt_is_main_type(gt));
>  	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> @@ -1443,7 +1445,9 @@ static void pf_release_vf_config_lmem(struct xe_gt *gt, struct xe_gt_sriov_confi
>  	if (config->lmem_obj) {
>  		xe_bo_unpin_map_no_vm(config->lmem_obj);
>  		config->lmem_obj = NULL;
> +		released = true;
>  	}
> +	return released;
>  }
>  
>  static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
> @@ -2021,12 +2025,13 @@ static void pf_release_vf_config(struct xe_gt *gt, unsigned int vfid)
>  {
>  	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
>  	struct xe_device *xe = gt_to_xe(gt);
> +	bool released;
NIT: The variable “relased” only applies to lmem so could be declared in the IS_DGFX scope.


>  
>  	if (xe_gt_is_main_type(gt)) {
>  		pf_release_vf_config_ggtt(gt, config);
>  		if (IS_DGFX(xe)) {
> -			pf_release_vf_config_lmem(gt, config);
> -			if (xe_device_has_lmtt(xe))
> +			released = pf_release_vf_config_lmem(gt, config);
> +			if (released && xe_device_has_lmtt(xe))
>  				pf_update_vf_lmtt(xe, vfid);
>  		}
>  	}


LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> -- 
> 2.47.1
> 

-- 
