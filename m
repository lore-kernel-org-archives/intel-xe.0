Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF03CD4F3D
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 23:52:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F6310E438;
	Wed, 20 May 2026 23:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ihY7PsGy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F3010E428
 for <intel-xe@lists.freedesktop.org>; Wed, 20 May 2026 23:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779321161; x=1810857161;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sHPby3QNHW7iIN1Asc46XDtkH8bfSHq6/mNwgXnuw+A=;
 b=ihY7PsGyHBdHwdA9jtE3yMKmBr6HBcjFwPOY5s3uC+BRxHrfut/TDtRP
 ft7250MHQ6lcvhJetPKpidlXrnJSOBxG53xLiX9T/Yla0BZJMEqLqjzM+
 OQcuLw3wFLPWVHfmZm8rlGDo4Ydow5EP4glqZ1Au67X4ja+ZXdch5ouxi
 BgQazh1stH+PYwP+ueUXgVSH2n3TKuKTJ/q1oMnC+UXmUwkwWSG29FwWY
 qjhrdtWpTjcukr+UAdvtjpOafs0OCkqbEsnKS27HCxxUORQFolc9WV0qh
 J4WHbYzAA9+2F62XOYnaSkMKOCZCM8/60AOak/aYnHkM+fO2JFlE6FUGJ g==;
X-CSE-ConnectionGUID: XPBRNMrZQFCu7237v/GaVw==
X-CSE-MsgGUID: bJ3D6jctS12TBoNzFvXPgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80135605"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="80135605"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 16:52:40 -0700
X-CSE-ConnectionGUID: vFYvtZ67RDikd2xyGKavEA==
X-CSE-MsgGUID: gZIqxWE+TpWvIq4c3yzunQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="240216299"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 16:52:41 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 16:52:40 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 20 May 2026 16:52:40 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.12) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 16:52:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z9E1ajPAx+q7uNDIebOvWnJoQsyYXCheUEYcPKS8gGGL9yncpkCIi86jN8fj00inOi3Ti0DTvmc6klneAmXR1LfaJSEMO7vIe7bEgfhHhCNoglzsa+rE8m3ea/LUAZfU74/8Tajh6+9NfhsHA8XcWRwDzlD7M8m6bE8JnbTvwFO23hNBVK/ZnJviURh16JU6rbFELCCU2kQKAV4th7m9oqJLmuxg2b70UMb/kNaFs51NmfJdWDLEOyoj7S5b/wNA65MXDgwf+PxoYyIhkpBnoMhjCM6iBQGl/CvttOlqlYzZHPzaHkA3v253isvrsdqkMbUBkFTTpoDR/UBYc9m6GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hAxXaxgp2coq8xXMWtz/CKfMeX5Vf05saGvbkaGJBEY=;
 b=AoO3z6ewXFPj1+1xJaaBRRRx0T+DknsJGaiqkQIUvECMaIp0vrJncjQGcKx9kdfZnsfswU/StbbG3hfLqHW4/pQeuf1PX+eEtmFUVJWdeyfZihv/px7P+LydX2ZnfR8Wq+WZt0FamssJPLgvO3DcwqfnDJACs9qyCVwgmCwMK9DeSfvXmcC7f/zZ25l3DNootw8BQrLOEt4307UmmdjLezFnB53Dxxfaynjfgf5qmAea5roRtm0bvhB6Dzj8GkEvPSwAdG3GXlrunJUvEWUdHSsrieQ3cWWAfPpzir2JRZel7DnZaLKmS8Srv8T9Ut62h29Mwo5sr0h4WyBV0IP2Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) by
 MN2PR11MB4757.namprd11.prod.outlook.com (2603:10b6:208:26b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Wed, 20 May
 2026 23:52:35 +0000
Received: from DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::6bec:e86c:e75d:5caa]) by DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::6bec:e86c:e75d:5caa%4]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 23:52:35 +0000
Message-ID: <3f82c08e-d7b9-4811-83c2-bf198192f845@intel.com>
Date: Wed, 20 May 2026 16:51:52 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/12] drm/xe: Thread prefetch of SVM ranges
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <stuart.summers@intel.com>, <arvind.yadav@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <francois.dugast@intel.com>
References: <20260226042834.2963245-1-matthew.brost@intel.com>
 <20260226042834.2963245-4-matthew.brost@intel.com>
Content-Language: en-US
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20260226042834.2963245-4-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0136.namprd04.prod.outlook.com
 (2603:10b6:303:84::21) To DS0PR11MB7904.namprd11.prod.outlook.com
 (2603:10b6:8:f8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7904:EE_|MN2PR11MB4757:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ce06465-14e4-47fc-bfd5-08deb6caddd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|56012099003|18002099003|6133799003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: UpnGTK6K99pu8mflWKwfq9p+Ad3jdUGNCyveoV66BxDhv/YMwFJLU8D0ojLdhj5ulDwRngSnZwTHuRLi1mOFjqsJ/pa8L6WFQanq+hnBNOMiroQmO0xBOl1LIrzSF+/GwjkF7pHakaOtgxdialfSClpNT+nU1c0BdXphU5s1E+iVnNUJ9Gmd37vJzuFxsRLOj+3fWQcs2VomFSj+4fX1gSrgbswFviNtDMlgVOofdxzQ4Zi1I0PwI17JFftBkqQWZCgP7pR586N3prKzCa4bsPsUZNXDZdK+ihSlFQZUKrTCfxQVTWsfcPAKIZmn/xgnF47uHqX3GsPxv4jcHhPl0Uj1t02F1OfHsBjH/J+XQ124NzNZyZFcJnIccLlxI2l9ICoAXqfUBxxMJtpQN0teMzzmNfLCvjBOjktjA7fBErTZqotjyRBwXo6koCR3D5tcoWQYvEY3Cq2RCnOo3wNiD60mqpAZ2dAvkNw7sy7JhmH6Q0umKKRlEiDOr6htc1RKMSaAM0ZdIRVzR2Ws5pBchOxsty+gl+yq3P39ij7YUxfOILkp4kX3fmlAh/hTWoo+T6x11xxIOyZTsBGExiXHlAz+F2WgBBwjG2oRlQv8hXG7IXjHKnPufNASv2YfdFag0B+Nx6XVzQLOhWL0CIRBaKw3uT9jMGUDKy+XD90jF2xuhsjTwSop7mf8G8bAFvbZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(56012099003)(18002099003)(6133799003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDdMWmFzNzUrSkhrMm9YU3VReXQ0ekZNS0p1b1AxbDNyREZ0N0hPYStYNnA3?=
 =?utf-8?B?NjRUclF2emJLVWlnOWhuQkdyYjdjMkdTejVncS9Oc0k4b0N5U1BLMW9IUk9l?=
 =?utf-8?B?aVVUb2x3eXAwQVV2djdPdERPYkRCcEZGbVBReDBaM3MrVnQwVTQvR2hsaWJs?=
 =?utf-8?B?SEJpcWdtRUp5NHh3T0c2amtWUENhcE1qVU1BN3NUN3h2RnlXc2gyUVNMUTkv?=
 =?utf-8?B?cGJNS2N0anJ6N2N5TFl0Vm9QUFRnUndTRHZYQ29zMkZZeWJ2OTNMWWZ6Nks3?=
 =?utf-8?B?ZGt0cG9JZW9kaDBlQVJTZjB0d292VEVCMGtMK2ZLYzEvamZZTDJuaTZTSHJt?=
 =?utf-8?B?TkZaWlY3VFlZTnkrSmlOVkgvOFJDSmdLWDFtZWF4L3dXdm5pRlFuTmdUelB0?=
 =?utf-8?B?NEFvQTU4R2RkS3lUOTk5OUFBOFZBY2JFbmNTV1pvL2ZmZEV2ZFZJWENobkVV?=
 =?utf-8?B?RUI3MEtTRDV3SGZhVEZmMlBtSStVTW4yMzB5bW9uaG9jWGo3UUcyUWY3aU12?=
 =?utf-8?B?S2xzT3V3enlVNDRaMVdrNlgvZlljcm1LSlREYk5IVWJuQ25qd0tsR216NU5K?=
 =?utf-8?B?RzI2ZGp4bjZ5cXY2WmFYTkVaYTFOa2E2WFF3U2tLQk0rY25VeVZYRGJTeHdn?=
 =?utf-8?B?RVhobldIVnJzaTJvanJkWkwvS3RBYi9SWU9EQ3I1N1BUck1HS1ZqMGpKVm8v?=
 =?utf-8?B?SzlaUGFCYjBpUERadTFCdzVCQXg0aENwYnQveW1YSGZ5VjF2SnlONXFnSndy?=
 =?utf-8?B?U3pKZFVRZ1kvKzJCblpyQUtEMDFOMlZ3NjJndk9qWjJFY1FKV1g0K0JZNWl1?=
 =?utf-8?B?andGemN6TXNOaVYvaUxNTU5OLzNxQ2MxVVNOd0FQNVp1U09ia2Y4Snd1UDYw?=
 =?utf-8?B?aHpFeVdsUmNvQTRoZzBCVlhMeTFPdkFMRWNiM0FkVWY3Y0p1enh5UXJWcERD?=
 =?utf-8?B?a1RYcERlSVFQSXJwVjMwbXZwdjNsb0FmRjBveWpPdVE0aFZQU1h2ZDA5MzRW?=
 =?utf-8?B?Z3FiMjhZK21FU0xBejQvOUd0NXVIUFVXN201RmI3RmxxSWJiR1ZOQlBOVEM1?=
 =?utf-8?B?VVIyaTM3RTlKVXlzTUIrY0l1ZXV1SGFybU4yc25YZTdBMjJmcGhMOGJackF4?=
 =?utf-8?B?eFFkRGJ2Qm9PLzhnRmd3TkFTUkw4dno3N2lSVmNOb0FDbDJySVBIcFpRWUxX?=
 =?utf-8?B?U2dWQ21acmp2THVaUVZrNVFXdGlLTzNVUFp1dHJMWkd3NmM5djJ4R1huNW13?=
 =?utf-8?B?RnRzTkthbiswY2l5VW9FVnozRlk0cFZVbG9sRnp6bUd0R1NMcmZWM2F5L3dF?=
 =?utf-8?B?MnNDQkZXTUhXTE9lamVjRmlQejlqUy9Pbm1jRHZFWWpMZmdlYXkyK2VqSU12?=
 =?utf-8?B?MElkV1ZyQjkvdUlsZDBlMEtnNXBJS1piR2ZXUXBwWnZ6WWl6TXo0bDlabnVR?=
 =?utf-8?B?SzZ6OE9Wanp6MWxyU2FvZzQ1anp5N2NiOERRS0hydlRicitUcGpGZkRIOXpI?=
 =?utf-8?B?OGZNQ0lUZFFraWpWWDgrNHV4UDRqYzhZMmRUS1BUQ3F2VW1za1FORGNxYlNi?=
 =?utf-8?B?Yit1SEhqNVhEOXQ4WGwxRm1Jby8vSzltcW9vVXNRMXRFNk9IUVZWTnlDb0JR?=
 =?utf-8?B?UVJpcUo3cmNGMDZya0daeWgvaXFZTFczU1NIMWhYU1Jhelk0WG5lcFoxSnBu?=
 =?utf-8?B?b3EzK0FQZW82U0N2MkZJbVRqd3dVa2VVc3pwdnJic1R5RFNlLzk3VUJIOFV1?=
 =?utf-8?B?ZEQzWlh2MGJveUNFQy9PQlJuemw4cTFLUzEyUTlVU1ZrQTBBQThtYWdYNFJC?=
 =?utf-8?B?dlF3TkNZMDVkK1ZUT2oySXB5cXg5UFBDVWFNQWJLTXdmUHRHUitGbmNReVdG?=
 =?utf-8?B?Si9xSWdyQWpZclRVeUF0WU9PcDBtV0dTV1F1WURTb3BWT3NRaTNBbENOY3VP?=
 =?utf-8?B?V1hXVzJodGh3SlhKVGlHZ2R1MnJPamo3a014ZkQ0NVkyMlJsdzdVa1RwVTdK?=
 =?utf-8?B?MzlQRmtqS0w4amIweG42a09ZcSs3elhqendwcDlXR1NsVlI1ejRTNGIxMjZw?=
 =?utf-8?B?ejZsbU1PUFhFMG9rcEdtczZCbHRSczZrcGNoVE91NkhqaUxuTDI5ZldRR1hZ?=
 =?utf-8?B?MVFnbGFVdnhoajJFNTgvOHc5SnJvTTgrT3cvVksrVFhMdXpLTndxRE14Ujdm?=
 =?utf-8?B?VkUrOTIySCtUOThJTTJjN3FxQnE0aVNkbm5IY3hKOUtPZXpsS1ZySVJDc2VD?=
 =?utf-8?B?QnRrVmc4RWxXRHlnR0dCU01ZenQ0b25YM0F6SlNWRkRlQVV5Y2F0ZFVKS0NP?=
 =?utf-8?B?ZUNPS1lUZkxFM1pvWjRHcURNbkNoaVpHUlNJcHhHVEdxMGtxaDdxZzMxSXBn?=
 =?utf-8?Q?JkSsEE94mhjnfthg=3D?=
X-Exchange-RoutingPolicyChecked: jBvKVDtugBLrFckVGppyHB/HIjIvsuDJdRX3gb4wHnHAqbkskyDqLUAaQYlYK0ysxQYvSj06D8bLIC28vuZMpY5uicpMXKCZ0lVNUxM/32/aDfsCNpJUFH+WqGfhFpslKt9QmtW+Vdcb1RZTgcApcpUFZjEyXz9ok816lgFE8O0/L+xuXHxlp6xI+NK8pBtzuqHKi5vp/jSP/d/OQA0SsV7KQokjDpXZ+rMSMTNRy8BPncolmfvXNS3QmF/GzE7Pl78DEe5bz0tYu6SV3ecFE8AhTaE2Cco0hRO67i8VjHcvRhn+F1jU3KRBKzc9LD9HVviQ2KQHaaaeUQPPgHQLCQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ce06465-14e4-47fc-bfd5-08deb6caddd1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 23:52:35.5827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xMAMneNUFm1jPQbAph1sdfB0mCtZUEo4dwdeLnf6Y6esmI/q3m0nnL5wpO4xqRqLT6xoYF/62W7x7OzW+oH4BoqgPoNxH4hpgRQqbRKZzWU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4757
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

Before having human reivew, here is suggestions and comments from Claude:

commit c2f0c5872b08aae878284b5c2ea1775bfa5fb21b
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Thread prefetch of SVM ranges

Splits the prefetch loop in prefetch_ranges() into per-range threads
queued on usm.pf_wq, with a trylock-based fallback in
xe_pagefault_service() and xe_svm_garbage_collector_work_func() so the
shared workqueue cannot deadlock against a pending down_write(&vm->lock).

 > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
 > --- a/drivers/gpu/drm/xe/xe_vm.c
 > +++ b/drivers/gpu/drm/xe/xe_vm.c

[ ... ]

 > +static void prefetch_thread_func(struct prefetch_thread *thread)
 > +{

[ ... ]

 > +	err = xe_svm_range_get_pages(vm, svm_range, thread->ctx);
 > +	if (err) {
 > +		drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, 
errno=%pe\n",
 > +			vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
 > +		if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
 > +			err = -ENODATA;
 > +		thread->err = -ENODATA;
 > +		return;
 > +	}
 > +	xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES DONE");
 > +}

The pre-patch prefetch_ranges() preserved the original errno from
xe_svm_range_get_pages() for everything outside {-EOPNOTSUPP,
-EFAULT, -EPERM}, only translating those three to -ENODATA:

	err = xe_svm_range_get_pages(vm, svm_range, &ctx);
	if (err) {
		...
		if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
			err = -ENODATA;
		return err;
	}

In prefetch_thread_func() thread->err is hard-coded to -ENODATA for
every get_pages error and the local `err = -ENODATA` translation
becomes dead code because err is not propagated past the assignment.

Errors like -ENOMEM or -EINTR from xe_svm_range_get_pages() and the
underlying drm_gpusvm_range_get_pages() path now surface to userspace
as -ENODATA. Is that intentional, or should thread->err carry the
original errno like the non-threaded version did?

 > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c 
b/drivers/gpu/drm/xe/xe_pagefault.c
 > --- a/drivers/gpu/drm/xe/xe_pagefault.c
 > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
 > @@ -304,7 +326,11 @@ static void xe_pagefault_queue_work(struct 
work_struct *w)
 >  			continue;
 >
 >  		err = xe_pagefault_service(&pf);
 > -		if (err) {
 > +		if (err == -EAGAIN) {
 > +			xe_pagefault_queue_retry(pf_queue, &pf);
 > +			queue_work(gt_to_xe(pf.gt)->usm.pf_wq, w);
 > +			break;
 > +		} else if (err) {

What guarantees forward progress here when the writer is held for a
long time? If down_write(&vm->lock) is held while another path keeps
queueing pagefaults to the same pf_queue, this worker will rewind tail,
requeue itself, run again, fail trylock, rewind again, with no backoff
and no retry counter. Is that acceptable, or should the requeue use
queue_delayed_work() or skip the entry after a number of attempts?

Assisted-by: Claude:claude-opus-4-7

On 2/25/26 8:28 PM, Matthew Brost wrote:
> The migrate_vma_* functions are very CPU-intensive; as a result,
> prefetching SVM ranges is limited by CPU performance rather than paging
> copy engine bandwidth. To accelerate SVM range prefetching, the step
> that calls migrate_vma_* is now threaded. Reuses the page fault work
> queue for threading.
> 
> Running xe_exec_system_allocator --r prefetch-benchmark, which tests
> 64MB prefetches, shows an increase from ~4.35 GB/s to 12.25 GB/s with
> this patch on drm-tip. Enabling high SLPC further increases throughput
> to ~15.25 GB/s, and combining SLPC with ULLS raises it to ~16 GB/s. Both
> of these optimizations are upcoming.
> 
> v2:
>   - Use dedicated prefetch workqueue
>   - Pick dedicated prefetch thread count based on profiling
>   - Skip threaded prefetch for only 1 range or if prefetching to SRAM
>   - Fully tested
> v3:
>   - Use page fault work queue
> 
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pagefault.c |  31 +++++-
>   drivers/gpu/drm/xe/xe_svm.c       |  23 ++++-
>   drivers/gpu/drm/xe/xe_svm.h       |   6 +-
>   drivers/gpu/drm/xe/xe_vm.c        | 150 +++++++++++++++++++++++-------
>   drivers/gpu/drm/xe/xe_vm_types.h  |  15 +--
>   5 files changed, 175 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index 421262c2a63a..a372db7cd839 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -173,7 +173,17 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
>   	if (IS_ERR(vm))
>   		return PTR_ERR(vm);
>   
> -	down_read(&vm->lock);
> +	/*
> +	 * We can't block threaded prefetches from completing. down_read() can
> +	 * block on a pending down_write(), so without a trylock here, we could
> +	 * deadlock, since the page fault workqueue is shared with prefetches,
> +	 * prefetches flush work items onto the same workqueue, and a
> +	 * down_write() could be pending.
> +	 */
> +	if (!down_read_trylock(&vm->lock)) {
> +		err = -EAGAIN;
> +		goto put_vm;
> +	}
>   
>   	if (xe_vm_is_closed(vm)) {
>   		err = -ENOENT;
> @@ -198,11 +208,23 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
>   	if (!err)
>   		vm->usm.last_fault_vma = vma;
>   	up_read(&vm->lock);
> +put_vm:
>   	xe_vm_put(vm);
>   
>   	return err;
>   }
>   
> +static void xe_pagefault_queue_retry(struct xe_pagefault_queue *pf_queue,
> +				     struct xe_pagefault *pf)
> +{
> +	spin_lock_irq(&pf_queue->lock);
> +	if (!pf_queue->tail)
> +		pf_queue->tail = pf_queue->size - xe_pagefault_entry_size();
> +	else
> +		pf_queue->tail -= xe_pagefault_entry_size();
> +	spin_unlock_irq(&pf_queue->lock);
> +}
> +
>   static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
>   				   struct xe_pagefault *pf)
>   {
> @@ -260,7 +282,12 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>   			continue;
>   
>   		err = xe_pagefault_service(&pf);
> -		if (err) {
> +
> +		if (err == -EAGAIN) {
> +			xe_pagefault_queue_retry(pf_queue, &pf);
> +			queue_work(gt_to_xe(pf.gt)->usm.pf_wq, w);
> +			break;
> +		} else if (err) {
>   			if (!(pf.consumer.access_type & XE_PAGEFAULT_ACCESS_PREFETCH)) {
>   				xe_pagefault_print(&pf);
>   				xe_gt_info(pf.gt, "Fault response: Unsuccessful %pe\n",
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 3e59695e0c01..66eee490a0c3 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -436,8 +436,19 @@ static void xe_svm_garbage_collector_work_func(struct work_struct *w)
>   	struct xe_vm *vm = container_of(w, struct xe_vm,
>   					svm.garbage_collector.work);
>   
> -	guard(rwsem_read)(&vm->lock);
> -	xe_svm_garbage_collector(vm);
> +	/*
> +	 * We can't block threaded prefetches from completing. down_read() can
> +	 * block on a pending down_write(), so without a trylock here, we could
> +	 * deadlock, since the page fault workqueue is shared with prefetches,
> +	 * prefetches flush work items onto the same workqueue, and a
> +	 * down_write() could be pending.
> +	 */
> +	if (down_read_trylock(&vm->lock)) {
> +		xe_svm_garbage_collector(vm);
> +		up_read(&vm->lock);
> +	} else {
> +		queue_work(vm->xe->usm.pf_wq, &vm->svm.garbage_collector.work);
> +	}
>   }
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> @@ -988,6 +999,7 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range)
>    * @tile_mask: Mask representing the tiles to be checked
>    * @dpagemap: if !%NULL, the range is expected to be present
>    * in device memory identified by this parameter.
> + * @valid_pages: Pages are valid, result written back to caller
>    *
>    * The xe_svm_range_validate() function checks if a range is
>    * valid and located in the desired memory region.
> @@ -996,7 +1008,8 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range)
>    */
>   bool xe_svm_range_validate(struct xe_vm *vm,
>   			   struct xe_svm_range *range,
> -			   u8 tile_mask, const struct drm_pagemap *dpagemap)
> +			   u8 tile_mask, const struct drm_pagemap *dpagemap,
> +			   bool *valid_pages)
>   {
>   	bool ret;
>   
> @@ -1008,6 +1021,8 @@ bool xe_svm_range_validate(struct xe_vm *vm,
>   	else
>   		ret = ret && !range->base.pages.dpagemap;
>   
> +	*valid_pages = xe_svm_range_pages_valid(range);
> +
>   	xe_svm_notifier_unlock(vm);
>   
>   	return ret;
> @@ -2064,5 +2079,5 @@ struct drm_pagemap *xe_drm_pagemap_from_fd(int fd, u32 region_instance)
>   void xe_svm_flush(struct xe_vm *vm)
>   {
>   	if (xe_vm_in_fault_mode(vm))
> -		flush_work(&vm->svm.garbage_collector.work);
> +		__flush_workqueue(vm->xe->usm.pf_wq);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index fd26bfeb4a07..ebcca34f7f4d 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -132,7 +132,8 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range);
>   
>   bool xe_svm_range_validate(struct xe_vm *vm,
>   			   struct xe_svm_range *range,
> -			   u8 tile_mask, const struct drm_pagemap *dpagemap);
> +			   u8 tile_mask, const struct drm_pagemap *dpagemap,
> +			   bool *valid_pages);
>   
>   u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end,  struct xe_vma *vma);
>   
> @@ -374,7 +375,8 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range)
>   static inline
>   bool xe_svm_range_validate(struct xe_vm *vm,
>   			   struct xe_svm_range *range,
> -			   u8 tile_mask, bool devmem_preferred)
> +			   u8 tile_mask, const struct drm_pagemap *dpagemap,
> +			   bool *valid_pages)
>   {
>   	return false;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 204a89ca3397..06669e9c500d 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2399,6 +2399,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>   			struct drm_pagemap *dpagemap = NULL;
>   			u8 id, tile_mask = 0;
>   			u32 i;
> +			bool valid_pages;
>   
>   			if (xe_vma_is_userptr(vma))
>   				vops->flags |= XE_VMA_OPS_FLAG_MODIFIES_GPUVA;
> @@ -2446,8 +2447,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>   				goto unwind_prefetch_ops;
>   			}
>   
> -			if (xe_svm_range_validate(vm, svm_range, tile_mask, dpagemap)) {
> +			if (xe_svm_range_validate(vm, svm_range, tile_mask,
> +						  dpagemap, &valid_pages)) {
>   				xe_svm_range_debug(svm_range, "PREFETCH - RANGE IS VALID");
> +				xe_assert(vm->xe, valid_pages);
>   				goto check_next_range;
>   			}
>   
> @@ -2460,6 +2463,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>   
>   			op->prefetch_range.ranges_count++;
>   			vops->flags |= XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH;
> +			if (valid_pages)
> +				vops->flags |= XE_VMA_OPS_FLAG_HAS_SVM_VALID_RANGE;
>   			xe_svm_range_debug(svm_range, "PREFETCH - RANGE CREATED");
>   check_next_range:
>   			if (range_end > xe_svm_range_end(svm_range) &&
> @@ -2976,16 +2981,83 @@ static int check_ufence(struct xe_vma *vma)
>   	return 0;
>   }
>   
> -static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
> +struct prefetch_thread {
> +	struct work_struct work;
> +	struct drm_gpusvm_ctx *ctx;
> +	struct xe_vma *vma;
> +	struct xe_svm_range *svm_range;
> +	struct drm_pagemap *dpagemap;
> +	int err;
> +};
> +
> +static void prefetch_thread_func(struct prefetch_thread *thread)
> +{
> +	struct xe_vma *vma = thread->vma;
> +	struct xe_vm *vm = xe_vma_vm(vma);
> +	struct xe_svm_range *svm_range = thread->svm_range;
> +	struct drm_pagemap *dpagemap = thread->dpagemap;
> +	int err = 0;
> +
> +	guard(mutex)(&svm_range->lock);
> +
> +	if (xe_svm_range_is_removed(svm_range)) {
> +		thread->err = -ENODATA;
> +		return;
> +	}
> +
> +	if (!dpagemap)
> +		xe_svm_range_migrate_to_smem(vm, svm_range);
> +
> +	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)) {
> +		drm_dbg(&vm->xe->drm,
> +			"Prefetch pagemap is %s start 0x%016lx end 0x%016lx\n",
> +			dpagemap ? dpagemap->drm->unique : "system",
> +			xe_svm_range_start(svm_range), xe_svm_range_end(svm_range));
> +	}
> +
> +	if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, dpagemap)) {
> +		err = xe_svm_alloc_vram(svm_range, thread->ctx, dpagemap);
> +		if (err) {
> +			drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
> +				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> +			thread->err = -ENODATA;
> +			return;
> +		}
> +		xe_svm_range_debug(svm_range, "PREFETCH - RANGE MIGRATED TO VRAM");
> +	}
> +
> +	err = xe_svm_range_get_pages(vm, svm_range, thread->ctx);
> +	if (err) {
> +		drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
> +			vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> +		if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
> +			err = -ENODATA;
> +		thread->err = -ENODATA;
> +		return;
> +	}
> +	xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES DONE");
> +}
> +
> +static void prefetch_work_func(struct work_struct *w)
> +{
> +	struct prefetch_thread *thread =
> +		container_of(w, struct prefetch_thread, work);
> +
> +	prefetch_thread_func(thread);
> +}
> +
> +static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops *vops,
> +			   struct xe_vma_op *op)
>   {
>   	bool devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
>   	struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>   	struct drm_pagemap *dpagemap = op->prefetch_range.dpagemap;
> -	int err = 0;
> -
>   	struct xe_svm_range *svm_range;
>   	struct drm_gpusvm_ctx ctx = {};
> +	struct prefetch_thread stack_thread, *thread, *prefetches;
>   	unsigned long i;
> +	int err = 0, idx = 0;
> +	bool skip_threads;
>   
>   	if (!xe_vma_is_cpu_addr_mirror(vma))
>   		return 0;
> @@ -2995,42 +3067,49 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
>   	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
>   	ctx.device_private_page_owner = xe_svm_private_page_owner(vm, !dpagemap);
>   
> -	/* TODO: Threading the migration */
> -	xa_for_each(&op->prefetch_range.range, i, svm_range) {
> -		guard(mutex)(&svm_range->lock);
> -
> -		if (xe_svm_range_is_removed(svm_range))
> -			return -ENODATA;
> +	skip_threads =  op->prefetch_range.ranges_count == 1 ||
> +		(!dpagemap && !(vops->flags &
> +				XE_VMA_OPS_FLAG_HAS_SVM_VALID_RANGE)) ||
> +		!(vops->flags & XE_VMA_OPS_FLAG_DOWNGRADE_LOCK);
> +	thread = skip_threads ? &stack_thread : NULL;
>   
> -		if (!dpagemap)
> -			xe_svm_range_migrate_to_smem(vm, svm_range);
> +	if (!skip_threads) {
> +		prefetches = kvmalloc_array(op->prefetch_range.ranges_count,
> +					    sizeof(*prefetches), GFP_KERNEL);
> +		if (!prefetches)
> +			return -ENOMEM;
> +	}
>   
> -		if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)) {
> -			drm_dbg(&vm->xe->drm,
> -				"Prefetch pagemap is %s start 0x%016lx end 0x%016lx\n",
> -				dpagemap ? dpagemap->drm->unique : "system",
> -				xe_svm_range_start(svm_range), xe_svm_range_end(svm_range));
> +	xa_for_each(&op->prefetch_range.range, i, svm_range) {
> +		if (!skip_threads) {
> +			thread = prefetches + idx++;
> +			INIT_WORK(&thread->work, prefetch_work_func);
>   		}
>   
> -		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, dpagemap)) {
> -			err = xe_svm_alloc_vram(svm_range, &ctx, dpagemap);
> -			if (err) {
> -				drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
> -					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> -				return -ENODATA;
> -			}
> -			xe_svm_range_debug(svm_range, "PREFETCH - RANGE MIGRATED TO VRAM");
> +		thread->ctx = &ctx;
> +		thread->vma = vma;
> +		thread->svm_range = svm_range;
> +		thread->dpagemap = dpagemap;
> +		thread->err = 0;
> +
> +		if (skip_threads) {
> +			prefetch_thread_func(thread);
> +			if (thread->err)
> +				return thread->err;
> +		} else {
> +			queue_work(vm->xe->usm.pf_wq, &thread->work);
>   		}
> +	}
>   
> -		err = xe_svm_range_get_pages(vm, svm_range, &ctx);
> -		if (err) {
> -			drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
> -				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> -			if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
> -				err = -ENODATA;
> -			return err;
> +	if (!skip_threads) {
> +		for (i = 0; i < idx; ++i) {
> +			thread = prefetches + i;
> +
> +			flush_work(&thread->work);
> +			if (thread->err && (!err || err == -ENODATA))
> +				err = thread->err;
>   		}
> -		xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES DONE");
> +		kvfree(prefetches);
>   	}
>   
>   	return err;
> @@ -3109,7 +3188,8 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>   	return err;
>   }
>   
> -static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops *vops)
> +static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm,
> +					     struct xe_vma_ops *vops)
>   {
>   	struct xe_vma_op *op;
>   	int err;
> @@ -3119,7 +3199,7 @@ static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops
>   
>   	list_for_each_entry(op, &vops->list, link) {
>   		if (op->base.op  == DRM_GPUVA_OP_PREFETCH) {
> -			err = prefetch_ranges(vm, op);
> +			err = prefetch_ranges(vm, vops, op);
>   			if (err)
>   				return err;
>   		}
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index db6e8e22a69f..7d5a82b2b64f 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -513,13 +513,14 @@ struct xe_vma_ops {
>   	/** @pt_update_ops: page table update operations */
>   	struct xe_vm_pgtable_update_ops pt_update_ops[XE_MAX_TILES_PER_DEVICE];
>   	/** @flag: signify the properties within xe_vma_ops*/
> -#define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH BIT(0)
> -#define XE_VMA_OPS_FLAG_MADVISE          BIT(1)
> -#define XE_VMA_OPS_ARRAY_OF_BINDS	 BIT(2)
> -#define XE_VMA_OPS_FLAG_SKIP_TLB_WAIT	 BIT(3)
> -#define XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP  BIT(4)
> -#define XE_VMA_OPS_FLAG_MODIFIES_GPUVA	 BIT(5)
> -#define XE_VMA_OPS_FLAG_DOWNGRADE_LOCK	 BIT(6)
> +#define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH	BIT(0)
> +#define XE_VMA_OPS_FLAG_MADVISE			BIT(1)
> +#define XE_VMA_OPS_ARRAY_OF_BINDS		BIT(2)
> +#define XE_VMA_OPS_FLAG_SKIP_TLB_WAIT		BIT(3)
> +#define XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP		BIT(4)
> +#define XE_VMA_OPS_FLAG_MODIFIES_GPUVA		BIT(5)
> +#define XE_VMA_OPS_FLAG_DOWNGRADE_LOCK		BIT(6)
> +#define XE_VMA_OPS_FLAG_HAS_SVM_VALID_RANGE	BIT(7)
>   	u32 flags;
>   #ifdef TEST_VM_OPS_ERROR
>   	/** @inject_error: inject error to test error handling */

