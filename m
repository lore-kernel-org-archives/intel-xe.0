Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664C0CCD1BF
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 19:46:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 061B810E00D;
	Fri, 24 Oct 2025 19:46:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lOfli28n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D56310EB34
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 19:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761335172; x=1792871172;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GCz1pbFRDvrDYawcoG590SXgKpouHhW5InWjqq7MBW0=;
 b=lOfli28neB/lIL5s6FFVyIC+Kq7H8X/TNLexOYIwinFFKAYpLR7W+gG6
 wFvtyJNCiaBk0oh3Aj53j/rDr+hpnbZqg6JDFlwHGbjABs0DwpE949RCl
 GszYLZ8x8xBaymNryUsT8PMsBqD5TC5FuZiAkqtUEwKlyyhun5UlM7o/9
 /x43pNAymD5odgOrJLCzkpGWgAFxxHjnJU5DhtzZmnhy2/CMH2Oxc7B1o
 yLhfQiKGT+bxbYPU28WccFA6eHNIycjH3hnrpAgPB00++EQrsz9UijpVg
 Db8tSx2M8PqlyHeh5cx7msQuhIF+rTtd48iFMIQGzwEEscwYV4WBiiojH g==;
X-CSE-ConnectionGUID: LALrexznQEO5glL0vuVoaA==
X-CSE-MsgGUID: TnpRSJrzTFGG0bsv5mHl4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63560565"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="63560565"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 12:46:11 -0700
X-CSE-ConnectionGUID: Y8uO7lS7Rv+4Fj7B1UoCRA==
X-CSE-MsgGUID: ltpp18UGQh2OcJECHNB7Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="184575534"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 12:46:11 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 12:46:10 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 12:46:10 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.15) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 12:46:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xCqwKSGgcmdfrQtjJLkEN2+XCLQDlIEslDQ3mFYGkQUjJeh0xRVVOiEwvPHb/VPVakHgYeTM5EWwqhLmTJmmb2Xj0GyHXDe2TU8izyjHdWLDwHd3QsKtGxOHwyYWBS5NovpWHFgfmrWaChYh+xi52NfPOsSkE+RMnOtkQ05z0GG8QXXGcXUy7E4wZgnzha6Femg1W+PWzjtkDu4YxgTDru05dAQP4gl0UIZeCSTYVSUq+X4d154NFkjp29hALahzC1tUj3rfsZgsaEH7xCyF49uV0adxacwsHxrs3uv+6pi0pKWQFWkH27cBrGQdYS4/J3v0SEIGpO4/DQCRZYZzHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wopjb4JHx9bxCZQFtdSWg31lteueLQhfSNLeoe6QdBg=;
 b=Hspbd187y27nU/tjRnRJQr/XQRfjyLrQDY4lJvqQmz+psaed+EUFZj6HrfJZhNFuTEHTGbXIDvCkUjdp/Oh9eTGe5/bg8khZLNbh1hwS5/k+sZfO0LQ0wf8QQ3WXduU//FfD37DcPBXdffTdwCwzYErISPvdfl+DA9d2D6zX6pi2aqLZ+nxLxeuLcgrJDPPZsp3Xvls3kRfSV4/QuOLcICdi+aSLPVVoXKtL7ZSKFKfJZ67/76GSrxyJPxgJOkfA9Er+EBfCnJx3+tlJW+fJy4qZ+QH0MNUIm7wjdlxtTy0e33ISx3ZCzIVCuM48QBHJMgsDcx6utFpS2Sr3GD8YgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ0PR11MB6669.namprd11.prod.outlook.com (2603:10b6:a03:449::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 19:46:04 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 19:46:04 +0000
Date: Fri, 24 Oct 2025 15:46:01 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 07/14] drm/xe/pf: Allow bulk change all VFs EQ/PT using
 sysfs
Message-ID: <aPvXedU5iSYM0k0h@intel.com>
References: <20251020182414.576-1-michal.wajdeczko@intel.com>
 <20251020182414.576-8-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251020182414.576-8-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY5PR16CA0025.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::38) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ0PR11MB6669:EE_
X-MS-Office365-Filtering-Correlation-Id: 909e51f8-72ef-4139-bf21-08de1335f7d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Um9QQ090RVpVZkljM1drV3RDaHo3aUlUcE1FdTAzNjRWR2JDcGcrVHFRWk9K?=
 =?utf-8?B?QlRnQjRSNndybmtNSkEwMk9ualdDclRiM2NTSTltWGozZlI1cFdrd3hFeWFH?=
 =?utf-8?B?Wk1La00wYUd5dDR4V1BicUlLaHVDT2R3emVyWTYzdG1TdzVub3A1amJlWGV2?=
 =?utf-8?B?ZStMSEp1WU9UU3JadE1rUXhFWjVmRFFDN1dldkFyNkVvcEUyUXlpTlRrcmxD?=
 =?utf-8?B?OTdmUUdFL2plSHE1MVdyQmhOcXFicmxDTGtPUHdHTUZ2eXMrR2FRMnl3dTZD?=
 =?utf-8?B?VGd1U25hV3B2b2kxeDVleDk0MEk1YldIZ3I3QTBvWGhOTjVxeFZqYmw4bDVS?=
 =?utf-8?B?d1Vxa2tXUlQzL1h0M1FCR2dWRUZsYlJuNDNsRnpvRXM1ajR5amtBTGFZWUFo?=
 =?utf-8?B?TVYySmhZYUxBTG8vSlJzTDhrNEZEK0w2STQwU0RkaTRXWmhwUE1QOXNKUXVk?=
 =?utf-8?B?WXdNNDkxVmJBZ3dYeWdWZWdZNUp1dnpDdlZsTjl4NktxSzVtR0o0bTZzYmN5?=
 =?utf-8?B?ZG5EOG1TV3U5T01wcUxUNXYvUnZ3TCtQL3gvQTZzeS9seGZsSTJzTTFHWlA3?=
 =?utf-8?B?QXBIL3dZRmxtMDhkRjl5NENzandvUXVXdjhHcCtKcUptSEVDMlV5UFRJT0pI?=
 =?utf-8?B?OE56OU9pNGRHUVIybWJqUjVxOSttTEhBR2xabnJkTk5uUldqRGlSWFpNT3Jw?=
 =?utf-8?B?d01XTC90VnVxWmN0YnByZmZ3WjgwcEt2RlE4cWRXVGJONnJjQU9Xb1JydVdp?=
 =?utf-8?B?UXhBY00rM2xXdlNOWnZSOW5XVTlQeEpkMk5WTE9kNDluNDJRWGRrdExkbThW?=
 =?utf-8?B?TkpleDlBa01saHZ0S1Arc2RMQUZqZUEyZUp1SmpJeDZxZXV5bkIzWTRZU0NI?=
 =?utf-8?B?VnZjUFBibU42eFI0VW1DcGJPbHJmbmpvQ2lnSXJvbW13eG5DYW5yb1RjbUdX?=
 =?utf-8?B?ZkYxN0ZPalgyNzBHVm0zVUZWdGR5TmhjVkdGNUsxWkJGMHR3VXZCR2FodTZN?=
 =?utf-8?B?bTc5blFyMnVkREd4VWd2TVlNUW50Nm5GTVM2MlBWOHRhY3dnVUcvZkNrS2Mv?=
 =?utf-8?B?Q0ZHbUoxMXdhQVQwNjg3ZlRROC9jZVN1bTZCV2pIVTRwS09CSUV4SXdvMTFu?=
 =?utf-8?B?b3VKYWdadWdJTFRPY1FMWE00SzlmQ2cwTWV0WGVGVDcxQkpWdWZ6dFUwOXcz?=
 =?utf-8?B?MGhoL3pvY3RzVTFaSHhudEdJeDQrMHBvVjBJemxSRFNvMTdMS0NQdUlLKzJx?=
 =?utf-8?B?MFppSDJxc29kOURVVzJRVlZOOWdSODRkdU5GSk02WlRFTVVDL3M5VXlBT2dT?=
 =?utf-8?B?djIrNUJoYmpoeEpLNUhzckN2amp2MEdTTGZVRVZQQU56MjdOdVkweit6SUdq?=
 =?utf-8?B?eGhZUTJ4cmxxQ0RmZ1B5eXZEM2pMb2dMRElHbkZhYkVwcDlqejArUEI4YUVG?=
 =?utf-8?B?UVVCTmdnaU5vb3JhWFRNTEpablM4b3FBSzJuRzRROUduVld5L1RialVyNWFM?=
 =?utf-8?B?dy93dE9hUlBadTlzODVUMjBNYVpxcVFkNGhaVjYxbGpLdjF6dEJMSlcvNGs3?=
 =?utf-8?B?S2FscVlTZVMzYlFoOUhUS1Y4WHFTTFAvYTNZRmd1cXR3ajRrbnUxc0J1dDlo?=
 =?utf-8?B?a3NLM1piaXcyWllwMTlXZUJhc3VYU1VSbUFFSkYyZm8zSnY3NHhqK0ZYYjRS?=
 =?utf-8?B?WmxXSm5vamYzb0FZMC9oMEp0dHRRcnlPVXJMRUEvNFM1VC93TnVoUURRUEJW?=
 =?utf-8?B?ZHhqQmJ4Z0t6M2pCM1JyWHFvS29FNUVSVGEwanVyRlFYaGh4QmtvMTQyRzMx?=
 =?utf-8?B?SFM5NlNXRU51UXROZ2hBR2xNTkFRRGw1UTVlcUNING5kVkpKenBXajJkOXRm?=
 =?utf-8?B?NURhQzRTZVN4T3p1b2x4MDg0OTcwMURYa0k2ZTZsWWR4Qy85MnpTQjhhcHZx?=
 =?utf-8?Q?vVJfGbcxfFRcT6FpbA6UN0/VIk2PgCcz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHp3NVZsOG9YdCsyNkV2ZS90aDRReVlxRnIvaTI5S3MvUnUvdFQ3TW5CL1Zy?=
 =?utf-8?B?RWFFb0RZd1I2NEJHUCtWd1ZxS0pIT0xHdG5OZnJuVDlndlpMalhUbm0yYlln?=
 =?utf-8?B?Y2VBTHJCOFJHNU1XM1hDY2VWeWVyN1dzSUVzMXZqY3pVbGJiUGlueTY0d1dH?=
 =?utf-8?B?eEllTGs5U0ZOMThRRGlWQS93ZDRvUU1YYXNlWUp2ZVRibFZ0RUZlZkxBNkFU?=
 =?utf-8?B?Vk91MUM2RzJvZXVmVFBJdEE5Nlg4QUxTbnZxR1NVSCttMzRaUUxYQXFmdFlr?=
 =?utf-8?B?dW5qRDB3czNPa2xOcXgwUzA0Zm94UkVPQ2NLcDA5bEVRY0d5d0RONm1CaEtt?=
 =?utf-8?B?b1cyOXBZZnhldDlQTW95dGZvTng0cytnUG43V3JXY1RTSkJYQ2ZvRTJ0bTJQ?=
 =?utf-8?B?WGpHbW5RdGtIWGlyVnVoUEprWXZ0azZTV2dqUmhyN0tTTXN2NnNHcVA4RFAz?=
 =?utf-8?B?a3ZYdE8rOVZ1aHRTM3ZIdkRkUnFYT0Eyclg5NlV2V1RUTm94K09lQk0yTTJZ?=
 =?utf-8?B?aHltR2NqOU1CRlBDVTVLUXVZUmFaU1czY0VvOUZPTHBld2VDZTFXeDRlWlhw?=
 =?utf-8?B?bFN2MUdVMVgydjFiUkpKRm9tcW5ZK0xpbHl5bmlna0k0NTdJNWtnZS85VHdV?=
 =?utf-8?B?MmczVkUvaXlpdUFDdXpvdlp0Wmp3SFN4TnVvQldVM3dzYzkvZFpxQ3FSdmp5?=
 =?utf-8?B?eGFobDdXUnoyMDVJU0ZFM2dudFdtUnVsRkVSTGVVYWphcUF1MlhNbHppekl1?=
 =?utf-8?B?QlR3UUNlYXp4MHN6WDR3MjQ1eGZjOHpyU3h5RDFGYm5yNG82Mng1ZEkzNTBB?=
 =?utf-8?B?cmZ2MUp0dHdUeThhSys5ZS9jR05kU1IvbU52Q2RJeHU1c3hoZS9WRjFGS3Vh?=
 =?utf-8?B?ZE1mSWlwVTl2TVYwQ080WjdsVURVVThFY0tZamZNa3U3UTlRVjkxWEQvaEFC?=
 =?utf-8?B?bnhWc1NuMVl5SG5EREVSVlZ4eU9IdE5wQ0Jhb0dBeUJiajJiSTI0Vm1yaWFP?=
 =?utf-8?B?TlNFN0w2S2szcjJzZXRSV2l5djR3MlRNd1N4LzZyblRzSjUvSUhQUVpTMWVB?=
 =?utf-8?B?aXBMcVEyYUhia2RmUGFXTS9rMEFRQi9zcm01bEhQdWRWTjdWd3ZkZHh6K1BG?=
 =?utf-8?B?Vm1TbWNDQkZwSG82Ukp3aGdUajcvb2xkN0drWWN6SDdINVB3Q2R2UGtzRWZy?=
 =?utf-8?B?bjVjdlFwYnNpUktjMkNNbmJsdVNwUXMvQU9sQ0VOSmNXU2VUZkxWRzFNdXgy?=
 =?utf-8?B?cnJIUjFoZk9PVkEzTDJ6RmY3SHA5bFVaNnFldkk1UWdkaHd6UU4rMzMrKytu?=
 =?utf-8?B?WVh5RDRSdmZQUXVSM3A5d2NRUWZzZGhWQmM0eXJFNGVIZkR2S2ZITkhrRExa?=
 =?utf-8?B?NEtlUW1NZ1VJbFZ4VWswSFlURmlLemhMcWJpM0FWMU5CS2lIOCswcVRKUFRn?=
 =?utf-8?B?eHpINGRha3pFbjlrTVRrZjBqdXVGKzlJS1FWWXIrOUhkMXZUeUdKTlBlbU9z?=
 =?utf-8?B?Z2FwbG5LdUd2bFFYREdGY2FVaVIySHlsT3NOcHdPaDlDdG5UUHNjMnozaURB?=
 =?utf-8?B?dDVzRWVVVkFQYjNKeHJWSmtJL2loeWNTM0swemMveHMra3dkVFNid0QxbE9E?=
 =?utf-8?B?dVROYVE1NktWSGNTWDE2MlBYbVYwMEFvSDlPaVR3MkVrVkpFcnZlK3VBcE8w?=
 =?utf-8?B?ZVlnUWZmUlhWbStjTjhqNWtFN1lqamlJQjU5SitSamZEMXBHM24rSm5jTktD?=
 =?utf-8?B?bEljWkMyalhCQ2duVDJ0cEplRzFLRzFxaW9GRmRvd2VUbnp3N3A2VGpnajk1?=
 =?utf-8?B?VUN3YXlydXFGRjZHU2s0UkFzUmE5MUhPdUVhY0M5ZDNzcUFvcmxaREh2dEh0?=
 =?utf-8?B?cWNpR09MZU40RGtMU1JFNXVEZEJCbE1pa1IyV1FEeWlIbEVkbEdTR0l2czFa?=
 =?utf-8?B?UlNZMXVGV29zSTlUaEN5N05sMnNibCtiUWJYSU1VVlAySTlPbHVJcTZpanNJ?=
 =?utf-8?B?YUV6bGpFT2ozdWJmdnlmSmJmZjhXRGp2QWtlZ2NrVVVDMVVVVDM2MnVHZ2JT?=
 =?utf-8?B?ck9tMDVFVXVDQWdNaHVZNGd4ejFrZ1JSQVlZMzZJZy9GUnJSb2c1QjdSZ0l0?=
 =?utf-8?Q?QL28X8hx9mhqmNrFSW4JO6F7+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 909e51f8-72ef-4139-bf21-08de1335f7d3
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 19:46:04.7274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3aedWGPmcn7HC1jeFwwqcfy30HVFYSL+r+gDfPNLTSgs8Tg9zJQGHQnXnbExXxIw0QFQfXx7YF8y4Nr7z8/dTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6669
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

On Mon, Oct 20, 2025 at 08:24:07PM +0200, Michal Wajdeczko wrote:
> It is expected to be a common practice to configure the same values
> of execution quantum and preemption timeout parameters across all VFs.
> 
> Add write-only sysfs attributes that will apply required EQ/PT values
> globally, without forcing admin to update PF and each VF separately.
> 
>   /sys/bus/pci/drivers/xe/BDF/
>   ├── sriov_admin/
>       ├── .bulk_profile
>       │   ├── exec_quantum_ms		[WO] unsigned integer
>       │   └── preempt_timeout_us	[WO] unsigned integer


Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c | 36 ++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
> index d5ad7aa7a899..5c445094e223 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
> @@ -22,6 +22,9 @@
>   * :
>   * ├── sriov_admin/
>   *     ├── ...
> + *     ├── .bulk_profile
> + *     │   ├── exec_quantum_ms
> + *     │   └── preempt_timeout_us
>   *     ├── pf/
>   *     │   ├── ...
>   *     │   └── profile
> @@ -84,7 +87,40 @@ struct xe_sriov_vf_attr xe_sriov_vf_attr_##NAME = \
>  
>  /* device level attributes go here */
>  
> +#define DEFINE_SIMPLE_BULK_PROVISIONING_SRIOV_DEV_ATTR_WO(NAME, ITEM, TYPE)		\
> +											\
> +static ssize_t xe_sriov_dev_attr_##NAME##_store(struct xe_device *xe,			\
> +						const char *buf, size_t count)		\
> +{											\
> +	TYPE value;									\
> +	int err;									\
> +											\
> +	err = kstrto##TYPE(buf, 0, &value);						\
> +	if (err)									\
> +		return err;								\
> +											\
> +	err = xe_sriov_pf_provision_bulk_apply_##ITEM(xe, value);			\
> +	return err ?: count;								\
> +}											\
> +											\
> +static XE_SRIOV_DEV_ATTR_WO(NAME)
> +
> +DEFINE_SIMPLE_BULK_PROVISIONING_SRIOV_DEV_ATTR_WO(exec_quantum_ms, eq, u32);
> +DEFINE_SIMPLE_BULK_PROVISIONING_SRIOV_DEV_ATTR_WO(preempt_timeout_us, pt, u32);
> +
> +static struct attribute *bulk_profile_dev_attrs[] = {
> +	&xe_sriov_dev_attr_exec_quantum_ms.attr,
> +	&xe_sriov_dev_attr_preempt_timeout_us.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group bulk_profile_dev_attr_group = {
> +	.name = ".bulk_profile",
> +	.attrs = bulk_profile_dev_attrs,
> +};
> +
>  static const struct attribute_group *xe_sriov_dev_attr_groups[] = {
> +	&bulk_profile_dev_attr_group,
>  	NULL
>  };
>  
> -- 
> 2.47.1
> 
