Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6889C25B75
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 04:45:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1B810E0A5;
	Thu,  6 Jun 2024 04:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OfIQebCY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85B310E0A5
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 04:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717649132; x=1749185132;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wovLd9ZyiImm4OQoacduz4YWzpgC4VaNnrAfl4dRESs=;
 b=OfIQebCYm3eI1/uRp9CXeChiBoohsLqgy6S2pGbXPYciL2UHjg8qflMl
 nfGHTOCmoMpBH/E5Xf2bFRDtTEs91+I8qbcC8eZyzlJKCDp8Jnc8N+JMk
 eOa6tpbUDmR7IVz+Tclg2hXMArHmDn3PAugCy1w+xKeTKvdYIso0kdL4S
 zqQjunrKB3YMiDbidOh5iJOZ+zWdOixHA7LL5dmGuVdW5O8/cBVP7uIs3
 l9/Gu65eF4aoGn2EJlAHeKgaHzGfgnkGPMYcGv7+b1QqJ97B9mTidwu+q
 pAzsS3Hmy+y/q4jp7L0xj5ddQk/MIcv1GghRxS5cLrODiGJuLwoAB+i2U Q==;
X-CSE-ConnectionGUID: LVFWSJOXRy+pzAjsa5VGAw==
X-CSE-MsgGUID: 5BZCfLsPSCO7vujzXsM1lQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="39697371"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="39697371"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 21:45:31 -0700
X-CSE-ConnectionGUID: WgzP9Cb6TnyvPg/mDmQCnQ==
X-CSE-MsgGUID: SldqIcpqQ82okooLkOLFfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="68987092"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 21:45:30 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 21:45:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 21:45:30 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 21:45:30 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 21:45:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AOUHlseh9Hae/Bu9H+E6H6RmEf0BWtz8ijjqoAiOJhkAKB8yc/pxUzmEHItV4uQqnuz/y7CB+gAeh25kQVRkqN8g4R4WWLPRuLus9kOQviI4kbc2X0lQE+SQHZVg+PhMBXiZH8fCpwsUN6wIg7/y+UA1G+ER8tacP3sm8OIG7bMLQ0G6wMCvcnPvPhc3t+X1mSteK5Y8xtS+ymOT0F0vqY6Q4SCTVneGZ/U0UADes7p0yf8p5DpcoJ39ZGAZkFnDVhBh+ENjJq3mDFEhmiPBCzaTJ16ayR+Xh0scxMl+k/61sBTOoCetfhxp+IDRHSVkeEi3/0dUUPmrnD0yncl3EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O6oI8hZi267rz+EMyyeILYWs6HhySJnp248njZVofhc=;
 b=I1gvXTH1RB8DFh9Ge6y4R/EHt35C+uQHhvq4BWVpcTdMNNeEqPGEvIH6Syy5t2XTrWN5hMpTVkYSqawADwm8VgvvdgkKk6nBKI+LbBcJZtkkWDZ3WHaktdA+j9Z4mxcRGsZUyKbEW3h6SPUFUA+pT2TB5IsNt4QyZNwN9c6iHHzK80xlLNqaieZ1yUnK+7IfjcDWM6+Hxa4BIErMF4/HiP/xbPoi8gNPObdmWlBGcxW5Xc7LxziIDwb3UV6moaw5zUEEjrkeu7O7YmhCsuMUWcSs558FsHZNGSOv0HkiLyLMMs/hpIwwJMJAQcWmmwrZRvcKb599w2s4Q6XJz/C+4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA1PR11MB6821.namprd11.prod.outlook.com (2603:10b6:806:29d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Thu, 6 Jun
 2024 04:45:26 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7633.018; Thu, 6 Jun 2024
 04:45:26 +0000
Date: Thu, 6 Jun 2024 04:44:33 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Thomas.Hellstrom@linux.intel.com"
 <Thomas.Hellstrom@linux.intel.com>, "Welty, Brian" <brian.welty@intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>
Subject: Re: [v2 22/31] drm/xe/svm: implement functions to allocate and free
 device memory
Message-ID: <ZmE+sUVUiH6w+Ei0@DUT025-TGLU.fm.intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
 <20240409201742.3042626-23-oak.zeng@intel.com>
 <ZhcRdy+QnvrA+sye@DUT025-TGLU.fm.intel.com>
 <PH7PR11MB7004D00816F98BE869CEE31B92F92@PH7PR11MB7004.namprd11.prod.outlook.com>
 <ZmD2sk3F3TQXNctr@DUT025-TGLU.fm.intel.com>
 <SA1PR11MB69913A775939C6B27AD8B8A392FA2@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SA1PR11MB69913A775939C6B27AD8B8A392FA2@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR02CA0013.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::26) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA1PR11MB6821:EE_
X-MS-Office365-Filtering-Correlation-Id: 274d2d46-7548-42b2-5281-08dc85e37bae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RlV6bWloTTJTRTBrTjZ6LzBhN1lnV0p3c3NkRmVFUUpINGNiS0UzQ2FRNUNl?=
 =?utf-8?B?aFBiUlZEb0VQMjNCUkxxWmNtUFk4dGZxanhQL1c5QmQ2T3F3NE9BZ3NDMG5K?=
 =?utf-8?B?azlIZWZlRG5ZTnBxcXJzSzh1NnVUaWpRZVRqbG5Fa2haWXkwSStSTzc4Wk02?=
 =?utf-8?B?YVFrci82SzVFTXJIRWNaUlBVcGJoYXRoVWJRbVE5NU9UUGQxWUpGSlZjdkh4?=
 =?utf-8?B?ZWRZbzVKcTV4eHhRaVZPOE5sSnJOMzE5U3hYWmlMN0RpbFhmMjBTbzZEZmd6?=
 =?utf-8?B?YnFET1l3dW9WR05jbWhwUnY3RDNsK3FLZjQ1dTdVczNScG9rVkV3blZ2TmRR?=
 =?utf-8?B?dFRIYWNQV0xKdzBVVkZJN3Q3R3hKbjI2ZG8vSXZpRE1KeHA4UjZjSkcvNWpt?=
 =?utf-8?B?dVFxMkZnWSsxYzZQRjFuRnI3c2xCNUJ4K3cwV1BnWlE5OFNsaDR5UXR4NTRX?=
 =?utf-8?B?aTRzcFE2ZS9nNngrdGxOSG1KQWY5UXF1MUc4cG1ZbTYrdmhoZHpLSTN2VVB0?=
 =?utf-8?B?VVdHbHJjdjZWbEJXUkk3Uk1FTFFqTmZZSW4zbndCWWNpRkJiWWx1c3BmVUFS?=
 =?utf-8?B?OVpPTE8wUmtOTUlYdWZpcDYzL3V3M3Ryd25iUWcrV3NBcjlPaGNRVFRwMDNz?=
 =?utf-8?B?ZHJqV21iNWYxQjZrREtTS0t4bC9YZnZBU1A3bWRVUHFRUWJ0ai9XalpheVBt?=
 =?utf-8?B?MnJzNTVxb2lYdUFQTk1kaUlQNytCRm5xRjNqUWxHUkRzRkxHYVVkTWcweTJ6?=
 =?utf-8?B?RWIzbEhVT2E0azJvdUl3QTNXRzVXcU9hc1ROVmhqOEtTZXBjNnFpSlFkcEZJ?=
 =?utf-8?B?bVN0Z3duUnUrVGFjZlVWeDV3ZzROUVpCeXFLZUpudThkUXpJUDdDQjBtbWxt?=
 =?utf-8?B?Ri92ZGlwZG5SdXBhMlNGUFFSZk1TeUMxbXk2ekYvSnczaGIzMTQ0Mm5jRFJs?=
 =?utf-8?B?UlIxNVNwSEw2ZTJKV3JmclpnbHVDc3BMQmJBTkdRNk1qTitoRzl6dFNZSVF4?=
 =?utf-8?B?azUvR0pYeHFCS0FIWEtDaGhidGZzU3JFbXMzb2kwckowL1JDNWRMOUtDODdw?=
 =?utf-8?B?KzdaNWtQelBqWFVhRitiWXZid0lhV0V3a2xnTnFpbmJzZC9ocEFqSFczeGlP?=
 =?utf-8?B?ZVlKd1VmQ1oxUVBSOEF3NjlvWW1xbFZrUzREWW82YnBVcDFJQmRYNm1BeVVP?=
 =?utf-8?B?TDVrSU9PUVdKNDFKc0pxZGlGbmFwNi92SmVrZkRSamJWbnBWUW11ZTdjTE1m?=
 =?utf-8?B?SmdjU0Q5VUlEZUxUOE81cU1WV1JiY1dVZ2JlR1NObVhPdFB5VGtTaFV1cHp5?=
 =?utf-8?B?a2FMYWlLWmpNUHRKeWNTc2l6dEwrTFo2UWxOb3Z3WW1ld0hzNHVxOTZtTVAr?=
 =?utf-8?B?MWJjQlFEZzdDUWo0NWZOVWNnbm5WNU9kUCtGUVBBZVBRd1g0K3lzNUFmU0J4?=
 =?utf-8?B?bFl3aWQwWlBzVDJtUVV4dVQ0MXIxS3NqZExMZk8yem5waVJ3MGl1dTZBdlFm?=
 =?utf-8?B?QS9jTmdvTmlxU0lrK3JOczF1S2JGOHN1RGV3VXFDQlpyWjczSW82UTlGbGcz?=
 =?utf-8?B?NlV4SXBCM0REWDJqTzVZKzJWVUhrbHFwRTllZHJNS2FSaWhkb29MamU3OG15?=
 =?utf-8?B?VUExcnAzUFhvdkdva0xLY3BwVEdrYlhDWGtJdUtuN3FEK0o2dXlIQkl1Tmk3?=
 =?utf-8?Q?39rxrDIP30AR4sPc4+Rl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXVXd1BQMCsrbTFsUUVzVC9mdzFwOEpkbzlseFNEVzFPOUZPQXJsaStBTk9a?=
 =?utf-8?B?ZDdQQmhaMi9JdUVmQUpFT2ZOMm4rRzRWVTEvSWZJckkvN0I1Y1NsRjZPa3pF?=
 =?utf-8?B?L09DYjNPYkNRQ1BPNU9adUVzeHVLbWFRRHZjeGp6MTk2YVBoSHBwdm5nR3l5?=
 =?utf-8?B?ZU1mTG4za1BZTEJ2NGIrcUZCNTc3Y3FzWWtMVFNGdGZpeW5YdlNXUU8vUFpo?=
 =?utf-8?B?UDF6S0FKaVZLNi91Ynk4blFMTmtqaVNKekVPamZxMjVyODJFK0toSVozV0tX?=
 =?utf-8?B?TkE0aDJtTEJEdVEzNzNpanJPMS82dTBzYm50WTlhY3JPK0JTU0NYUEZRNFNB?=
 =?utf-8?B?ZDJEZThzcnNlMVdueG1uVTlwUW5jZ3hVakJRdlZBeGtIOFZUOWNObG9ZSFlh?=
 =?utf-8?B?M1BuU3g0ckJOVFNCdHJTL3NNNE5PaVJMSkwybGVQc2NsZUs0Zjl3Q21ZUjRL?=
 =?utf-8?B?V3J3b2VDS2Q3TFNmWTBGOFZOaEYvaTdEbGdodW5zU0llTmRaY094ZVp0alg3?=
 =?utf-8?B?Sk1WTmtMa0liU1paZ1NiY2RTT0VYNHRCelpXellWSlcyRDFrdkx1eUtSSEJs?=
 =?utf-8?B?QU02dVpmVkhTWkV2M0UyeHhqYlYwOHQ1aVdCRnY4VFdDT3dXOVJiZndicDdo?=
 =?utf-8?B?RFA4TGE4dXdnVmlkSW5hemNHeDY0VE8reWtkQVJ2UlA3KzN6MUl5SXB2cmlI?=
 =?utf-8?B?N2F3dzdiUjF6Y2JZZ28vUW1DVmFtNEFkNU5DMWMxUG5UYThaWFNESUg2Snlp?=
 =?utf-8?B?dXBSMHloNllpVWpqNzlJMWMrOGpGSUo4cERQbS8yVkVkMytTcThNYW9yTTdj?=
 =?utf-8?B?d2l1Q2hyaVRFbmVVY211eHZ5eVRFS2hPcytsbVFCYzVVODYvUzZVTFVBYjdP?=
 =?utf-8?B?TmV5Y3hQWlAvZE5SSjJNTW1JUzQ0cVRINzlyQ0x2YUl5bXppR3MxamVwOW1S?=
 =?utf-8?B?ZGdINXNNQVU3TmRPRW1hVTFKeStjWUcwbDB0eE9xNVF6OHl3N0pxSFRITEov?=
 =?utf-8?B?NHdwQXFmMEc1eWhTMFcraFVDaXVlZi9DQTZ6WWt3U3lycnhzZ3VmK0tEdUEx?=
 =?utf-8?B?MkFYb1QzZTFMVlA0ajJDV0o0U2hDYm1Dc1Ayd3QwYitURi9abUIwRWY1Uzhi?=
 =?utf-8?B?SE1DSXQrL3J5cWtZR1BUNm1zcmZXNVF1dGtjUlQxQnJEczgyYjBwTUgxMlZj?=
 =?utf-8?B?VWhJeXhTNER5TnhKa2I1emZtN1pYS1F1bUJqdWZWTWRyMng2NUdaVjBBTWx0?=
 =?utf-8?B?Q1Zza1R0cUdhUHdOQWZUbGRjWEdDVG9KWDI3aUdoVXBiQnpCT0ZxR0pIdlFJ?=
 =?utf-8?B?MUtKdHFUNmtwZVJqM1ptc1cvOXhibzh3eXBTcGtKSjZnMDhpOS9MSlVVcWgv?=
 =?utf-8?B?M3I4dEI1UmQ4WW1vb2VVY0FibUdnNFhqbndJbFVwcXBEZERMdzVVTGh2TnQr?=
 =?utf-8?B?VjZvYVhyTjcwSmcwUUxCTjBoQllEUXBmeHNZcHRwMk16NTNkeitwRlAvcmx4?=
 =?utf-8?B?M3NTS24vSCtMa2l5VlFyY2lSdjl6U3p6czY3YmE3TFVqTXRNL1lJai9hdTI2?=
 =?utf-8?B?OVNEdzZsRC9pWjNTVExCQ3RoWUZsRUxZb2RPZVVvK1NjM1gxUnpnQlFHNkpj?=
 =?utf-8?B?bW40ZnhqQkVCMzdmL28yaVlZdlVKcmFhdzZKUW92d1Axd1Q5NkxLR2d6TjFa?=
 =?utf-8?B?TjdoZDRnWHN0a05aQU5BcDBkWkRXU3BwZSt6NDRHaEVrYnRPVmRSUjBTTmI1?=
 =?utf-8?B?d3BRZDdXczRmUHNueG5KcTB2MUo3VlgrZ2FFL1ZlMTMrM3VoaE85eDJ2eVlG?=
 =?utf-8?B?SjB1YkdENHFqcG4wNHFLUktObXFzOVBsTmlPN2JwaUhDM0dZNkdXdzhVdkxl?=
 =?utf-8?B?MjU2TmpTdGNQa1JGaUZoNmkyb0FMOEJhVFN5WDhVVjMxUU1vN2YwNmNrSnZr?=
 =?utf-8?B?WGNEWUlraVdHTTMvQmJ1ZGNuMTlVRzRXeHRTL3V6RjhKWnhrVTZ3V3c4dlFB?=
 =?utf-8?B?MWw5OGpuSVpPT1pEVGpxYXZQOUY1eXp2NGk0djI0d2MyNUFHQTBlUHd4Wklr?=
 =?utf-8?B?Tm90d1lQS0p0SGJVNEFGT0VMZ2JveHVPOXQ1SkJSRkw5N0Nkak14eWNpT2Fx?=
 =?utf-8?B?SkIyQ2hCbEZGMkNlbXhoajdreFFFL243MkhZaFk4QUVkVjhpYWN6YkYzZGNJ?=
 =?utf-8?B?YWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 274d2d46-7548-42b2-5281-08dc85e37bae
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 04:45:26.1211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oy4zaYzaFDamCSNyxR5sBYtyoguZy+x1cGUfRhT3AyuV8EQ8wTM28J+hmse67uEz5jwDvMHAwwc3ltx5UN0a1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6821
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

On Wed, Jun 05, 2024 at 09:30:01PM -0600, Zeng, Oak wrote:
> Hi Matt,
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: Wednesday, June 5, 2024 7:37 PM
> > To: Zeng, Oak <oak.zeng@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> > <himal.prasad.ghimiray@intel.com>; Bommu, Krishnaiah
> > <krishnaiah.bommu@intel.com>; Thomas.Hellstrom@linux.intel.com; Welty,
> > Brian <brian.welty@intel.com>
> > Subject: Re: [v2 22/31] drm/xe/svm: implement functions to allocate and
> > free device memory
> > 
> > On Wed, Jun 05, 2024 at 04:16:32PM -0600, Zeng, Oak wrote:
> > > Hi Matt,
> > >
> > > > -----Original Message-----
> > > > From: Brost, Matthew <matthew.brost@intel.com>
> > > > Sent: Wednesday, April 10, 2024 6:24 PM
> > > > To: Zeng, Oak <oak.zeng@intel.com>
> > > > Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> > > > <himal.prasad.ghimiray@intel.com>; Bommu, Krishnaiah
> > > > <krishnaiah.bommu@intel.com>; Thomas.Hellstrom@linux.intel.com;
> > Welty,
> > > > Brian <brian.welty@intel.com>
> > > > Subject: Re: [v2 22/31] drm/xe/svm: implement functions to allocate and
> > > > free device memory
> > > >
> > > > On Tue, Apr 09, 2024 at 04:17:33PM -0400, Oak Zeng wrote:
> > > > > Function xe_devm_alloc_pages allocate pages from drm buddy and
> > > > perform
> > > > > house keeping work for all the pages allocated, such as get a page
> > > > > refcount, keep a bitmap of all pages to denote whether a page is in
> > > > > use, put pages to a drm lru list for eviction purpose.
> > > > >
> > > > > Function xe_devm_free_blocks return list of memory blocks to drm
> > buddy
> > > > > allocator.
> > > > >
> > > > > Function xe_devm_free_page is a call back function from hmm layer. It
> > > > > is called whenever a page's refcount reaches to 1. This function clears
> > > > > the bit of this page in the bitmap. If all the bits in the bitmap is
> > > > > cleared, it means all the pages have been freed, we return all the pages
> > > > > in this memory block back to drm buddy.
> > > > >
> > > > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > > > Co-developed-by: Niranjana Vishwanathapura
> > > > <niranjana.vishwanathapura@intel.com>
> > > > > Signed-off-by: Niranjana Vishwanathapura
> > > > <niranjana.vishwanathapura@intel.com>
> > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > Cc: Thomas Hellström <thomas.hellstrom@intel.com>
> > > > > Cc: Brian Welty <brian.welty@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_svm.h        |   7 ++
> > > > >  drivers/gpu/drm/xe/xe_svm_devmem.c | 147
> > > > ++++++++++++++++++++++++++++-
> > > >
> > > > See comments about file in previous patches, they apply here too.
> > > >
> > > > >  2 files changed, 152 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> > > > b/drivers/gpu/drm/xe/xe_svm.h
> > > > > index 624c1581f8ba..92a3ee90d5a7 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_svm.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > > > @@ -46,4 +46,11 @@ static inline struct xe_mem_region
> > > > *xe_page_to_mem_region(struct page *page)
> > > > >  	return container_of(page->pgmap, struct xe_mem_region,
> > > > pagemap);
> > > > >  }
> > > > >
> > > > > +int xe_devm_alloc_pages(struct xe_tile *tile,
> > > > > +						unsigned long npages,
> > > > > +						struct list_head *blocks,
> > > > > +						unsigned long *pfn);
> > > > > +
> > > > > +void xe_devm_free_blocks(struct list_head *blocks);
> > > > > +void xe_devm_page_free(struct page *page);
> > > > >  #endif
> > > > > diff --git a/drivers/gpu/drm/xe/xe_svm_devmem.c
> > > > b/drivers/gpu/drm/xe/xe_svm_devmem.c
> > > > > index 31af56e8285a..5ba0cd9a70b0 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_svm_devmem.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_svm_devmem.c
> > > > > @@ -5,18 +5,161 @@
> > > > >
> > > > >  #include <linux/mm_types.h>
> > > > >  #include <linux/sched/mm.h>
> > > > > -
> > > > > +#include <linux/gfp.h>
> > > > > +#include <linux/migrate.h>
> > > > > +#include <linux/dma-mapping.h>
> > > > > +#include <linux/dma-fence.h>
> > > > > +#include <linux/bitops.h>
> > > > > +#include <linux/bitmap.h>
> > > > > +#include <drm/drm_buddy.h>
> > > > >  #include "xe_device_types.h"
> > > > >  #include "xe_svm.h"
> > > > > +#include "xe_migrate.h"
> > > > > +#include "xe_ttm_vram_mgr_types.h"
> > > > > +#include "xe_assert.h"
> > > > >
> > > > > +/**
> > > > > + * struct xe_svm_block_meta - svm uses this data structure to manage
> > > > each
> > > > > + * block allocated from drm buddy. This will be set to the
> > > > drm_buddy_block's
> > > > > + * private field.
> > > > > + *
> > > > > + * @lru: used to link this block to drm's lru lists. This will be replace
> > > > > + * with struct drm_lru_entity later.
> > > > > + * @tile: tile from which we allocated this block
> > > > > + * @bitmap: A bitmap of each page in this block. 1 means this page is
> > used,
> > > > > + * 0 means this page is idle. When all bits of this block are 0, it is time
> > > > > + * to return this block to drm buddy subsystem.
> > > > > + */
> > > > > +struct xe_svm_block_meta {
> > > > > +	struct list_head lru;
> > > > > +	struct xe_tile *tile;
> > > > > +	unsigned long bitmap[];
> > > > > +};
> > > >
> > > > This looks not needed to me but admittedly haven't looked at the LRU
> > stuff.
> > >
> > > I am moving to page granularity memory eviction, so we can either use the
> > lru in the struct page itself, or I will have to introduce some other data
> > structure which have a lru.
> > >
> > 
> > You almost certainly cannot use struct page, pretty sure that will not
> > be well recieved putting a subsystem memory management feature into the
> > core memory management.
> 
> The reason I was think of struct page's lru because, the lru field is not used right now for device pages...the lru field is used for system pages only right now. So I don't see a conflict there. It is just a member not used by core mm and we can make use of it if we want.
> 

If the core implementation changes, then are you broken. If it's not an
explicitly provided private field to the upper layers, then no, I don't
think you should just use it. At least, that's my understanding.

> But it is very possible that we don't use struct page's lru. In this series https://patchwork.freedesktop.org/patch/565501/?series=125879&rev=1, I have some drm_lru_entity concept. I need to go back to that series to work out the page granularity vram eviction part.
>

I've seen that series and it raises some pretty serious concerns which I
won't get into here.
 
> 
> > 
> > I'm going to say this again, I disagree with this design decession as I
> > do not think using a BO / or migration + eviction at allocation
> > grainularity should be dismissed. Using a BO offers eviction more or
> > less for free and possibly dma-buf reuse for multi-GPU. Please study my
> > PoC [1]. It has SVM full featured and largely working.
> 
> It is completely fine that people disagree with a design. Removing BO from system allocator was aligned with DRM community long time ago. The main problem of BO is the memory eviction and migration is not page granularity.
>

Of course, it's okay to disagree. This is about how you're responding.
I'm not buying, or even hearing an argument about how using a buddy
allocation solves the page granularity problem. Simply stating something
as a fact without providing examples of how it solves the problem means
nothing. This is a continued pattern of behavior which I interrupt as
feedback being ignored.

Furthermore, I don't believe the VRAM backing actually has anything to
do with page migration. I see this as a core MM and DRM layer issue
rather than a decision made at the driver level regarding the VRAM
backing store. I'll elaborate on this below.

My concern here is that a design decision is being made without valid
reasoning. If I hear valid reasoning, of course, I'm open to other
ideas.

I wasn't involved the discussions a long time ago, I am involved now and
have an opinion on a Xe level design choice.

> I know in v2 I am not truly page granularity either. But I am moving to true page granularity in v3, the memory allocation, free, migration and eviction are all at page granularity. It is very similar to the scheme Linux core mm has. There are much more work at buddy allocator and eviction lru, compared to the BO approach. 
> 
> Please also note, when said page granularity, it could be one page, but can also multiple pages.
> 
> 
> > 
> > If you have a different design, great. But I'd expect the next post to
> > have feature parity, thorough testing, and well thought out design
> > choices with explainations of said design choices beyond someone in the
> > community said something so I am doing it this way (i.e. deep thought
> > and understanding of how all the pieces fit together and why this design
> > was chosen).
> 
> I understand feature parity and testing are important. The previous posts (v1 and v2) were mainly to get some feedback on the design. Since we are at the 3rd respin of this series, it is probably a good idea to do more test before post.
> 
> 
> > 
> > [1] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-svm-post/-
> > /tree/post?ref_type=heads
> > 
> > > Yes, I removed block_meta in v3.
> > >
> > 
> > I don't like speculation, said this many times. Let's see what rev3
> > looks like and will review then.
> > 
> > > >
> > > > I am thinking roughly...
> > > >
> > > > - I think we drop all this special tracking (kill xe_svm_block_meta)
> > > Agreed.
> > >
> > > > - Have functions to allocate / free the buddy blocks, store buddy blocks in
> > > > userptr
> > >
> > > Why we need to store buddy blocks in userptr? If you do this, you would
> > need another block_list in userptr.
> > >
> > > I currently use the struct page's zone_device_data to point to buddy_block.
> > It seems work for me.
> > >
> > 
> > It doesn't. See my working PoC [1] zdd structure, almost certainly
> > something like that will be needed for a variety of reasons. Also if you
> > allocate a buddy block then it really isn't page grainularity nor does
> > offer an advantage over BO wrt page grainularity. I stated this multiple
> > time in lengthly explainations and not heard a reasonable argument
> > against this.
> 
> It is true that the drm buddy interface is not page granularity. But this should be mainly looked as a drawback of the buddy interface. If you look at the core mm buddy allocator, the interface is page centric. We are working on the drm buddy allocator to improve in this perspective.
> 

Let's put this another way: installing buddy_block to a zone_device_data
doesn't work from a layering perspective. A DRM SVM layer cannot enforce
a driver to use a buddy allocation for the VRAM backing — the VRAM backing
needs to be opaque, with the driver making a choice of the backing store
(BO, buddy allocation, or potentially something else).

Again, this is why in my PoC the VRAM allocation is a void * and a
driver vfunc to signal release of the memory. I'm not saying I have this
100% correct; I probably don't. But conceptually, the VRAM store needs
to be transparent to the DRM SVM layer. Any design that requires a
specific type of backing store at the DRM level is not correct.

To give an example of this, neither a GEM BO nor a TTM BO is aware of
the backing store. This is why TTM has memory managers which do the
actual allocation/freeing of memory. Granted, it provides a TT manager
for driver use for system memory, but that is just a reference
implementation too — a driver can override it (at least that is my
understanding). For VRAM allocations, the driver owns this. See
xe_ttm_vram_mgr.c, which happens to be built on top of the buddy
allocator — this is not a requirement.

> > 
> > > > - Blocks are allocated before migration to VRAM
> > >
> > > Agreed
> > >
> > > > - Blocks can be freed on either CPU fault after migration or on VMA
> > > >   destroy (probably depends on madvive hints for VMA where we free
> > > >   blocks)
> > >
> > > My current understanding is, once device pages is allocated and handed
> > over to core mm/hmm, driver doesn't need to worry about the life cycle of
> > device pages, i.e., core mm/hmm will take care by calling back to page_free
> > vfunc.
> > >
> > 
> > Yes, we definitely need to the page_free vfunc callback implemented.
> > This was a misunderstanding on my part, certainly you can make it work
> > without this but it is not correct.
> > 
> > > > - Blocks allocated / freed at ia chunk (xe_vma in this code) granularity
> > > >   (conceptually the same if we switch to 1 to N ratio between xe_vma &
> > > >   pt_state)
> > >
> > > As said, I am moving to page granularity, moving away from xe_vma
> > granularity, to address concerns from the drm community discussion.
> > >
> > 
> > That's not what the community is saying or it is not at least how I
> > interrupt this. The community is saying on a fault, allocate at a page
> > granularity of the CPU mapping. e.g. If the CPU mapping is 4k, allocate
> > 4k. If the CPU mapping is 2M, allocate 2M. 
> 
> I guess by CPU mapping you meant CPU vma.
>

No. This would be when hmm_range_fault is called, the order size
returned in the pfn. This is page-level granularity.
 
> I think we can create a mmu notifier to match the range of the cpu vma.
>

That has nothing to do with page granularity. We should be able to
create arbitrary sized notifiers which span many pages / cpu vma / gpu
mappins. Your design likely should support that per feedback from Jason
which I also happen to agree with.

> Regarding how much gpu memory be allocated and migrated,  my current thinking is, this can be decided by a memory hint attribute. i.e., if CPU vma is 16M, but memory attribute say 2M, we can allocate/migrate 2M. if memory attributes says 32M, we will migrate 16M.
> 

By definition, this is not page granularity. If you want to migrate more
CPU pages upon GPU fault (which we might), that is fine, but it needs to
be done in a way that ensures allocations match CPU page sizes. So, upon
CPU fault or MMU notifier event, we are operating on the CPU page size.
Hopefully, a user is smart enough to use THP allocations in a
performance-critical app. This is my view of page granularity. Maybe I
am way off here, but I really don't think so.

I'm not arguing that page granularity is a must; in fact, I didn't
implement it in my PoC. I'm saying that if we did, this is how it would
look.

> So I don't understand why you want to allocate the same size as CPU vma...
>

I'm not saying that. See above.

> 
> There quite a bit of core MM
> > work that would need to be done for this to properly work though, namly
> > the migration layer splits TPH into smaller pages. I think that should
> > fixed (e.g. teach core MM to understand device private pages that are
> > larger than 4k, likewise coherent pages). Conceptually I think this is
> > the right approach but would take quite a bit of work. But with that, if
> > we layer the code properly only the DRM layer needs to be aware of this.
> > e.g. We could build SVM without this like I do in my PoC and then switch
> > over to this model once we complete the core MM work is done mostly only
> > modifying the DRM layer. This would eliminate the partial unmapping /
> > invalidation scenarios which my PoC implenents and provides
> > documentation for.
> 
> I don't quite follow here. Afaik, THP is only enabled for linux core mm, managing system memory. I am not aware of it in xekmd. By THP do you mean THP in xekmd? Or huge page (compound page, 2M or 1G etc) to back up cpu vma in linux core mm? 
> 

Page granularity would be matching the CPU page size in migrations and
not spliting THP upon migration.

With all of the above considered, the VRAM backing actually has nothing
to do with page granularity. That is, the allocation size of the backing
store is the key; the implementation of the backing store is immaterial
here.

I concede that using a BO for every 4k allocation will be quite
wasteful, but a buddy allocation wouldn't be all that much better
either. Really, it is up to the user to ensure 2M (THP) allocations are
used if supporting page granularity. If we can't trust the user to do
so, then don't support page granularity and create arbitrary sizes based
on the CPU VMA, as I do in my PoC.

Matt

> 
> > 
> > Below general comment:
> > If we post something that we view as good and working, community
> > feedback can be pushed back on with a justifiable design. Blindly doing
> > things without understanding (e.g. community said do it this way) of the
> > larger issues is not a great way to work. Nor is posting untested code
> > with a partial implementation.
> > 
> > > > - block->private == memory region so we can get pfn from block
> > >
> > > In v3 code, block->private is not used. Will use it if needed.
> > >
> > > Each struct page has a pgmap pointer which points to xe_mem_region's
> > pgmap memory. We can use this information to get a page/fpn's memory
> > region.
> > >
> > 
> > That probably works but there may be scenario where you need to from
> > block to mr in which the device pages are not readily available. You
> > always can go from block -> pages -> mr but it may be advantageous to
> > short circuit that with block -> mr, especially in hot (performance
> > critial) paths.
> 
> In my v3, I don't have a need for block to mr. but it is a good idea to use block private for this purpose.
> 
> Oak
> 
> > 
> > Matt
> > 
> > > > - When we need migrate_pfns we loop over buddy blocks populating
> > > > migrate.dst
> > > >
> > > > Also I noticed the drm_buddy_* calls in this file are not protected by a
> > > > lock, we will need that. Currently it is tile->mem.vram_mgr->lock in the
> > > > VRAM mgr code, we either need to reach into there or move this lock to
> > > > common place so the VRAM manager and block allocations for SVM don't
> > > > race with each other.
> > >
> > > Ok, will add this lock. Lets keep the lock in vram_mgr->lock for now for
> > simplicity
> > >
> > > Oak
> > >
> > >
> > > >
> > > > Matt
> > > >
> > > > >
> > > > >  static vm_fault_t xe_devm_migrate_to_ram(struct vm_fault *vmf)
> > > > >  {
> > > > >  	return 0;
> > > > >  }
> > > > >
> > > > > -static void xe_devm_page_free(struct page *page)
> > > > > +static u64 block_offset_to_pfn(struct xe_mem_region *mr, u64 offset)
> > > > > +{
> > > > > +	/** DRM buddy's block offset is 0-based*/
> > > > > +	offset += mr->hpa_base;
> > > > > +
> > > > > +	return PHYS_PFN(offset);
> > > > > +}
> > > > > +
> > > > > +/** FIXME: we locked page by calling zone_device_page_init
> > > > > + *  in xe_devm_alloc_pages. Should we unlock pages here?
> > > > > + */
> > > > > +static void free_block(struct drm_buddy_block *block)
> > > > > +{
> > > > > +	struct xe_svm_block_meta *meta =
> > > > > +		(struct xe_svm_block_meta *)block->private;
> > > > > +	struct xe_tile *tile  = meta->tile;
> > > > > +	struct drm_buddy *mm = &tile->mem.vram_mgr->mm;
> > > > > +
> > > > > +	kfree(block->private);
> > > > > +	drm_buddy_free_block(mm, block);
> > > > > +}
> > > > > +
> > > > > +void xe_devm_page_free(struct page *page)
> > > > > +{
> > > > > +	struct drm_buddy_block *block =
> > > > > +					(struct drm_buddy_block *)page-
> > > > >zone_device_data;
> > > > > +	struct xe_svm_block_meta *meta =
> > > > > +					(struct xe_svm_block_meta *)block-
> > > > >private;
> > > > > +	struct xe_tile *tile  = meta->tile;
> > > > > +	struct xe_mem_region *mr = &tile->mem.vram;
> > > > > +	struct drm_buddy *mm = &tile->mem.vram_mgr->mm;
> > > > > +	u64 size = drm_buddy_block_size(mm, block);
> > > > > +	u64 pages_per_block = size >> PAGE_SHIFT;
> > > > > +	u64 block_pfn_first =
> > > > > +					block_offset_to_pfn(mr,
> > > > drm_buddy_block_offset(block));
> > > > > +	u64 page_pfn = page_to_pfn(page);
> > > > > +	u64 i = page_pfn - block_pfn_first;
> > > > > +
> > > > > +	xe_assert(tile->xe, i < pages_per_block);
> > > > > +	clear_bit(i, meta->bitmap);
> > > > > +	if (bitmap_empty(meta->bitmap, pages_per_block))
> > > > > +		free_block(block);
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * xe_devm_alloc_pages() - allocate device pages from buddy
> > allocator
> > > > > + *
> > > > > + * @xe_tile: which tile to allocate device memory from
> > > > > + * @npages: how many pages to allocate
> > > > > + * @blocks: used to return the allocated blocks
> > > > > + * @pfn: used to return the pfn of all allocated pages. Must be big
> > enough
> > > > > + * to hold at @npages entries.
> > > > > + *
> > > > > + * This function allocate blocks of memory from drm buddy allocator,
> > and
> > > > > + * performs initialization work: set struct page::zone_device_data to
> > point
> > > > > + * to the memory block; set/initialize drm_buddy_block::private field;
> > > > > + * lock_page for each page allocated; add memory block to lru
> > managers
> > > > lru
> > > > > + * list - this is TBD.
> > > > > + *
> > > > > + * return: 0 on success
> > > > > + * error code otherwise
> > > > > + */
> > > > > +int xe_devm_alloc_pages(struct xe_tile *tile,
> > > > > +						unsigned long npages,
> > > > > +						struct list_head *blocks,
> > > > > +						unsigned long *pfn)
> > > > > +{
> > > > > +	struct drm_buddy *mm = &tile->mem.vram_mgr->mm;
> > > > > +	struct drm_buddy_block *block, *tmp;
> > > > > +	u64 size = npages << PAGE_SHIFT;
> > > > > +	int ret = 0, i, j = 0;
> > > > > +
> > > > > +	ret = drm_buddy_alloc_blocks(mm, 0, mm->size, size, PAGE_SIZE,
> > > > > +						blocks,
> > > > DRM_BUDDY_TOPDOWN_ALLOCATION);
> > > > > +
> > > > > +	if (unlikely(ret))
> > > > > +		return ret;
> > > > > +
> > > > > +	list_for_each_entry_safe(block, tmp, blocks, link) {
> > > > > +		struct xe_mem_region *mr = &tile->mem.vram;
> > > > > +		u64 block_pfn_first, pages_per_block;
> > > > > +		struct xe_svm_block_meta *meta;
> > > > > +		u32 meta_size;
> > > > > +
> > > > > +		size = drm_buddy_block_size(mm, block);
> > > > > +		pages_per_block = size >> PAGE_SHIFT;
> > > > > +		meta_size = BITS_TO_BYTES(pages_per_block) +
> > > > > +					sizeof(struct xe_svm_block_meta);
> > > > > +		meta = kzalloc(meta_size, GFP_KERNEL);
> > > > > +		bitmap_fill(meta->bitmap, pages_per_block);
> > > > > +		meta->tile = tile;
> > > > > +		block->private = meta;
> > > > > +		block_pfn_first =
> > > > > +					block_offset_to_pfn(mr,
> > > > drm_buddy_block_offset(block));
> > > > > +		for(i = 0; i < pages_per_block; i++) {
> > > > > +			struct page *page;
> > > > > +
> > > > > +			pfn[j++] = block_pfn_first + i;
> > > > > +			page = pfn_to_page(block_pfn_first + i);
> > > > > +			/**Lock page per hmm requirement, see hmm.rst.*/
> > > > > +			zone_device_page_init(page);
> > > > > +			page->zone_device_data = block;
> > > > > +		}
> > > > > +	}
> > > > > +
> > > > > +	return ret;
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * xe_devm_free_blocks() - free all memory blocks
> > > > > + *
> > > > > + * @blocks: memory blocks list head
> > > > > + */
> > > > > +void xe_devm_free_blocks(struct list_head *blocks)
> > > > >  {
> > > > > +	struct drm_buddy_block *block, *tmp;
> > > > > +
> > > > > +	list_for_each_entry_safe(block, tmp, blocks, link)
> > > > > +		free_block(block);
> > > > >  }
> > > > >
> > > > >  static const struct dev_pagemap_ops xe_devm_pagemap_ops = {
> > > > > --
> > > > > 2.26.3
> > > > >
