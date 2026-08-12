Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770F2C5CFEE
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 10:35:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 014AC10E3F1;
	Wed, 12 Aug 2026 10:35:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lvR+k4Zs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E650F10E3F1
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 10:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786530956; x=1818066956;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=81B/Gnf82nrpNz2Rz4fd39GMDq6awQPYnD5Qf8gRR34=;
 b=lvR+k4Zsf3W4cA7+5bKvyo53YivYZ8cWcTUSh6+0UGim1umjVS95dvOr
 +j2BW5gZmEF6p4weGdImjR7xOQtS2imjiTJyyTMtClqFTBT88oMcTvvGC
 BF6FPboYecPwmK65qsrLKwRzeGo10MpErbqtl9DOOsuFqNHppLODZbY/0
 egbRpskKKfFlLiLpC/w5jkXqSSBanSekXdKcWwHPRKb+kYm4gSbPplcyt
 9aDBlRUCKWfkRIwy218CuEweZDCGFZLILlArgTA5TDnVuNDQbrIEcbMxU
 tl8jkSynikmgHF7sWe2dWmoLVPeGKANZCtHIAbK5RYnkB15+etoRXVgJD Q==;
X-CSE-ConnectionGUID: X5yvzQcXTA+QLpBFuc1E9g==
X-CSE-MsgGUID: NYD19jdiRHyAVSx79JLd0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86954272"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86954272"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 03:35:56 -0700
X-CSE-ConnectionGUID: jLTvWGXjQCK5BfPpqbBpUA==
X-CSE-MsgGUID: ycZyGffcSI6fuhEhgmSORQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="293550419"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 03:35:56 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 03:35:54 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 03:35:54 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.52) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 03:35:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JLcqEhlzH7KJ7C9jhW+cQUwtxoSVA7pYOH7rOetKuRMN21G2qf9CnHngiy7vlhZpPmX2bML/OEU8YMM+CceB407eLT2XyQnw/yGCEc/rS/kNUx1+2KckiGB8r/+ulHjXvhzDYHA7lUaOvV8GR1cae9MQCe/wxIyft7cHiW25wI3jvZqvm+jer1HBK3S6alviT39zFc5LKNmDaY4uxsyOKvcMrBBsq2DHni6DewqK+5M8bMWwFbiBcZY6KrHEpYL0tNDehSuWgvooojISPcmED5ah9NWOX1EL3WOSmtcpcOF9c90OqK1rtz4tYZH6rhFT2KVSwkpbo3rrBi631K+KLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g436JRiMywMkDMirrBiFh0MY6hiHxuteO9V4Mj52su0=;
 b=NZGsLuZNYqurfdJK0vs33j2MpQEWoqYnUoF8KmFYqn4rDL0omxyUTtbe7JdcLYkrvIoIz+de+wFqzKB/VgPQISWbnwGNGG4NHKLmIbsp3IcCpa76z08CYZmg0q5OYMWqR5t/yzwKxjVla6AwXmCFnFtd/GZ2J5QKKMu3k4BpdLQjRtpkDp/9pZVrtO8bzMpqJ263l2LAKJhQ+7ckAc2ISMu/n6085H1579+tbaDOGY/yI1dsi6UnbysyaNPKL1Zvij42R73hHEVcAVVgheNGk0+WGuUtRAz5R12VmPtrYfIk8/ZcqAqInEtKfZkyt2ck+H9Hwo5Qfp0S0NBrji6BdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by CY8PR11MB7900.namprd11.prod.outlook.com (2603:10b6:930:7a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Wed, 12 Aug
 2026 10:35:52 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 10:35:52 +0000
Message-ID: <cb903280-1b4e-4d63-ba79-610744a834e7@intel.com>
Date: Wed, 12 Aug 2026 16:05:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 23/23] drm/xe/pci: Report 'cannot re-enable' error
 using SIGID
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro
 <riana.tauro@intel.com>, Aravind Iddamsetty <aravind.iddamsetty@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-24-michal.wajdeczko@intel.com>
 <138490b5-9fd2-4921-9287-ec0d4434d7de@intel.com>
 <eebdc58f-ea74-4f98-8448-1b162d1d8611@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <eebdc58f-ea74-4f98-8448-1b162d1d8611@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0089.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::9) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|CY8PR11MB7900:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b1b393b-d123-4c80-21f9-08def85d7b70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|22082099003|18002099003|11063799006|56012099006|10067099003|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: Q4lHRt9AJXy/xpMvTm2p46923vpsnUeSVvrrj3SOW2xnBkgUnN0DNViKS2E3YgLpZxlKyu8A/2nsNsArTSbarmc5yU0SNCaUQKlIMzzqcRQc1FeH3NMud2fAo2IVrO33OIuARLxCNoK+NLobpYFwz3GvgqaBJPCIRzfO5ycQX6ztKlc6tyUjhMSNpv5Ol1ZRTI+EDhRan7WHezVQMURHYQIY4oc1lwPx/Oz+k9iklWWkB0SmpHuPei882+RkSMZCo2l4Mf5GQIOomu9R26IpmAZIj8jbc86lSKTNej2uU1by+2onbyUOHVrAOVsHuD9xCM6JkjkwBqGmfSZxnYzvMAETadCh2s05as99uWUW1jUAK/TcBnqj4xR4V4U2zNHayebcGXaLvtXlFYuuBymT+jeGvaRg2KEPbYUKbnh2jJ0HvdpyaGYVEgAdSI81ijq1Tc5aMyrpnrNm6j+v8Jteo1mSqcC1M9suRBXhsbsGaqI0w0Q+6bAbXaVqRXJPkarvc7avAMZTn8iTmnsRpf4gTHyweG+uUtfD9RCM9k/ZSDL0xXQasI3JKIL2VR8LV6qXTDNgIPskDKip08Pa0Fq4/mDhOfUigArbftdc81RBxj+IV5j1pn8EKCzeNTINKGVOqtmjifVBtkwJLrtA12xuejrSXnnBmg6iLGImz9FI1YM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003)(4143699003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UC9GYXZSbExDWVRZQlRMZVNsckJCb094ZGF6a2JwZVNpcGc4S0o5QmxobVZP?=
 =?utf-8?B?aS8vSjlXYVhZTFZOM1BMQTlDOEVFMVdpaGczcnlsQmdVUjA5dXYrNFpxV3B3?=
 =?utf-8?B?MUdzU2FUSVdGZFFCT1NvQ01qbThRVEhKZFFzaXlrOE5nUkQyOHJrcXBhK1hi?=
 =?utf-8?B?MTdvemVaWnR3RENDQi80aTRlVjlSa1dMbVhtbU1CamYvRjRIU01YeERaRE1a?=
 =?utf-8?B?UGU3Q0txRXRIaEpJa2ExWmNBUEpLNEZTWUExRjdQVlZPWG00YURKUVVRVXlQ?=
 =?utf-8?B?Yk5mWmYzQy9qSHFCQ2V5UFlPdm54RDBCc0dFc1I4U1RTNG1LdERYRlVPWmxs?=
 =?utf-8?B?c3N0WndubkFZVzJBaU9oQTlyNStYR1JiOFdSbUJNa0FOTzJDb1M2OEtRV2lW?=
 =?utf-8?B?M1E5cmJkMkxOQXFzU080TXRyYXRDYWt5WFFVdk1sWWVJdGR6UVVnRCs5USs1?=
 =?utf-8?B?RFF6aE42V1ludjhwRUl0VmlhMVRuWkEyTWNDaHAraVpOM2lKZGp2VHJqYkU2?=
 =?utf-8?B?dXBTUlNNaDVXL3dORTgxeHlheUFyVkpoN2FrOEdHdVhNMG9FSXR2STRnVGo3?=
 =?utf-8?B?MHlTOTdnTiswT0Rmc05MUFpvVDRRZGRVcERjdExGemUxdUMxM3M0VDczSDNz?=
 =?utf-8?B?SkxlTmk1REFLc2U5STB2QkZvb2dTbmpSUDNxUnVLWlBhc1doWDl0ZW9xQ0VI?=
 =?utf-8?B?ZndvVmcraTQ0TVFWUS9leVREZW1wbUlBVUpkN3lwV2RPRlozckY5MHRSQlpD?=
 =?utf-8?B?Q1BQK2JUSWxhQkVESXRUWlJwZEhXaFo1T2pFRzhLTUZSTXVXZndaVEVCV0ZL?=
 =?utf-8?B?amRwNWRtZ3F0ZGE1WlNZTlhVbkhmNGMvZEpvcCtLcFV5eG5ESktOcjZSTU5P?=
 =?utf-8?B?Z25WekNSWlB0VEs3YVpscnRFL3NCMkJuMldOdm5mOEc5aGFpc0w1VlIxSHhR?=
 =?utf-8?B?akRNMkhwWkF0L055RExsRGhpYjU5aHVvZWtRbitiMVJsN1ErVGpFRE9yY3dN?=
 =?utf-8?B?VDRndWNEd2c0YllCSXF3TElYSmFPSytZUDI1M1c5UVMvY2ZJNktTUGJqUU9q?=
 =?utf-8?B?TTZTTDJ1YnhhSndONm5BVGJRK0Rwd205T25wSm5EV2dhQjhjOG1lVlg4cUJs?=
 =?utf-8?B?L2FQc20valY0cVZXc0NQckJlR2RzdkdEVGswVmdxOUdsR0tOeGxyTkhEdmVV?=
 =?utf-8?B?WnI1b2lsMXJMTkl2bE5TTVdYZjB1R1dQdmN0Sy9lOUtOOHZ3K1I2NzFkRE9W?=
 =?utf-8?B?MlZhOGlraGxyUW9qaWpUdzdjVGhPVGVrSnQ0aDJFRWU3MWZZVndQaWVRUk5E?=
 =?utf-8?B?Q0tGeW8vZEM2T2RPTzNHQzhyenRzSVRZYXAxM3JrMFY0Y0tDVFpJbFRpYVdM?=
 =?utf-8?B?KzBvRXBwSzJCbVM4S0E0RCt5L2h1Ni9OUUR4eWg2S2RhTkVLdkZIRncvdjFz?=
 =?utf-8?B?U243L2h1dmZnL1kySmZqZ1BIK2lqWnhOcTBDK2FKVlZmTHQrTEpMb0xrMDJQ?=
 =?utf-8?B?Q3FyZXFveVJMbXFvOGxCUjJSRFpnSjJKSGoySEZKcEdubXcrallMM1ozckt1?=
 =?utf-8?B?bHA4QVIvcjBPK0dnZEVSbE9hOHZ3TVBEMVlTU1RyNmFpdGlBQnY1Um1zdFli?=
 =?utf-8?B?NkFMMWNGUHE3RUtydG11YWdhOFc3a3NGZjhEaWZ6blVLSG5GZzVZUVNKdWlq?=
 =?utf-8?B?NUJnT1gwc01mSXd6UGMvTXlVVFFYdGROOGZxakxZTjFpOWxhc2ZpMmdoWjNF?=
 =?utf-8?B?Z3hSZHRlVEpscnpzc2oyVDdEdHRWNlllVUJ1L0FXejUra0VnT1N3S2h1RENu?=
 =?utf-8?B?YVpORXZZdlNibUpjMkI2UlJDQzQxamtTR2NEaWxmZm5NOEttZUU4MzdIZFlz?=
 =?utf-8?B?NG9Qckh5TnQ0MjlRdzhWN2gvYVNmQjVHMjFncjJISkNNRjRGSFZ5cE1KWFZ4?=
 =?utf-8?B?NzRZZUcwUUN0bmNRYkdDZ1hCTXhRSU4wbDdpT0c1c3dHK3FJQUJueFQ3cjN0?=
 =?utf-8?B?NDQyaldNNUFTVjJGZS8xMHlPNFFOVjFwVW1MMDlmZVQ3bm5nWE5wbGJ0b2h5?=
 =?utf-8?B?YjVqejhKUjdzdC9aSDFhaVkvWjFsdkU3cndzTFlSMXRWaWlRdlhteC90U1VB?=
 =?utf-8?B?ejJXazVPcCtteG1FSGFRenYyaDJTNTczZ29LVEw0UnFjNWRQVDRDUUF5c0I0?=
 =?utf-8?B?a29lY0JtSnN3a3VoMVlGZlNQaDFVZ3BnRFNmT05nQzI2VXQ5K1NDczJTcEU3?=
 =?utf-8?B?UDU1eFBGNkNnV1RYOWliWSthd1BBZEFwQ3kxSk9aNnkrVW1rL0lVZ3gvNXhE?=
 =?utf-8?B?T3p3WmhmT0R6S3BNbFhFdnZmd3cvVnlvWUsreXhzSlpjUFFSYnlwUXRTMjdO?=
 =?utf-8?Q?rm+lYFi0cE6bvoSE=3D?=
X-Exchange-RoutingPolicyChecked: fWyR1WTGL0NxUsQDzS6qc7XijfgremVa9kNtBfc7Rn5MerRhrByVo3h+wXX24Yef4sKGeMQE/vMxSH6GgsxgztKMqqFvC0unsmWTgFIOuuH2NRN27S7IerGuMbsfBiukZQyd9Bob2QJeYDcRCvrmB2qny5ONQOj51YvFzPLTGHKfMFAoRu7qLsxYSd/PNGhi+w6IPm/jcgTSqTdGnxSx6oszQmfI5r+6Lcmn4s22/2L4vzosnghuT4a7R4h//6+phnlAZBlGMl/TJ2bduWY8PRm1AFBIjI6egzPGwbfCMLPlQfPNuQf5kfT6sDpMomcp2z+D5RelaMEiUcznHYC6iQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b1b393b-d123-4c80-21f9-08def85d7b70
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 10:35:52.2144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E2Spb45NK1lJCaXOdXnwc79buCsNtslMC7ep0w0KVUTP6/VSOos9/KwSmJ1e23P/PNt5oFFbBpHR/rkwvcRss5BtRZ5RP+KRdt5d0S6t54c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7900
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


On 12-08-2026 02:53 pm, Michal Wajdeczko wrote:
>
> On 8/12/2026 8:58 AM, Mallesh, Koujalagi wrote:
>> On 30-07-2026 08:51 pm, Michal Wajdeczko wrote:
>>> Report 'cannot re-enable PCI device' error using xe_log() helper.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_pci_error.c | 7 +++++--
>>>    1 file changed, 5 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
>>> index e41af2ac7f23..fb965f52be5e 100644
>>> --- a/drivers/gpu/drm/xe/xe_pci_error.c
>>> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
>>> @@ -7,6 +7,7 @@
>>>      #include "xe_device.h"
>>>    #include "xe_gt.h"
>>> +#include "xe_log.h"
>>>    #include "xe_pci.h"
>>>    #include "xe_pm.h"
>>>    #include "xe_printk.h"
>>> @@ -90,13 +91,15 @@ static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
>>>    {
>>>        const struct pci_device_id *ent = pci_match_id(pdev->driver->id_table, pdev);
>>>        struct xe_device *xe = pdev_to_xe_device(pdev);
>>> +    int err;
>>>          xe_info(xe, "PCI error: slot reset\n");
>> Please use xe_log_info.
> but do we care now?
Since it's showing PCI error message so up to you!
> it's info only and I guess we should prioritize to convert
> real errors into SIGID logs first
Agreed!
>>>          pci_restore_state(pdev);
>>>    -    if (pci_enable_device(pdev)) {
>>> -        xe_err(xe, "Cannot re-enable PCI device after reset\n");
>>> +    err = pci_enable_device(pdev);
>>> +    if (err) {
>>> +        xe_log_err_fatal(xe, PCI, err, "Cannot re-enable PCI device after reset\n");
>> PCI component used XE_SIGID_SW looks semantic mismatch, we can add DRIVER_HARDWARE with PCI
> but introduced in patch 3/23 component PCI represents the component
> that is beyond our Xe driver (part of the SYSTEM) as we don't manage
> that directly
>
> and since our SIGID choices are limited, the generic SIGID_SW is
> the most applicable IMO

hmm, I know, we've limited SIGID choice, PCI with SW sigid is broader 
scope however in this case PCI is initiating slot reset

if it's making sense we can use it right?
> if you disagree, please comment patch 3/23 as it is already
> reviewed
That was just my suggestion up to you!!
>> and make
>>
>> a PCIe link failure that required active recovery right?
> this code is already part of the HW error handling
> maybe we should (or there is) declare wedged
>
> but I don't want to make here any changes beyond simple
> conversion from xe_err() to xe_log_err()

hmm, ok

Thanks,

-/Mallesh

>> Thanks,
>>
>> -/Mallesh
>>
>>>            return PCI_ERS_RESULT_DISCONNECT;
>>>        }
>>>    
