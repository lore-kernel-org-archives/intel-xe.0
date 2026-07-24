Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE26C531C9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 14:20:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E969F10E055;
	Fri, 24 Jul 2026 14:20:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jL+AlyoP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 576BD10E055
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 14:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784902810; x=1816438810;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Aal9Gp+GJUGJCG3rcqMM+9G1xxMxXaWOYZyHSZlbIEY=;
 b=jL+AlyoPAsC0S6I0O155xu99MCWKBXNfC076Nx6z7DOQUe/nowbqhG5u
 ZvLNFtx4xNGtaGFLb7HDlg7RZ2uhySHco23y8M1nw8kDZaTmG1R/902Ij
 DKyLhyP/BwusSlGjt7kB4r7nnkDLIDqrNKak8z59zyOT0HwzBWLtmuLnc
 m37SUmpJZwi+rb5JUpRmrOQr1rtpzwSsMa3Nqt64W38R4QAZ6ErMTr6mw
 2TvFZL2Ujgvu1mfjx/hx3pJHIwmq+4S6AzdyAR7kEJuCO7PqBvY/QxakD
 w5dNvmXZu867gHyqCOZsOd0As5d2v0p5zNZ+3wALr1bAQovp0K10i47ck w==;
X-CSE-ConnectionGUID: 32WGgkaoT4egLIy0qfJ9mA==
X-CSE-MsgGUID: d9hkz2TLR1iDGsCBWS7VPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="89460361"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="89460361"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 07:20:10 -0700
X-CSE-ConnectionGUID: sHdgC64ASA2tZa9jhOMYKg==
X-CSE-MsgGUID: xhLC+DGRQaSX22dJIJNeJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="288699323"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 07:20:10 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 07:20:09 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 24 Jul 2026 07:20:09 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.16) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 07:20:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cN6eTJpQIvANmuoaXZpTDUYjKwQecBocrsIqR0k8OWXEeAUgqH/IONCxqXPcxTbYwGaR/BJgeI8ljMS1VHFs3JNgaMaj5qO5850fiHIWeR02zkvYxW+T5bu+JThrKUjFZGpZwUAs/1mDh7RKLOCn2MM1EMV4ktfQotfc+Mla1DPz1Jvg3Q4Y55OfJOIz/WPi4hDHxS726qQjfb5ONr8n0nG5bqcHC12bYkDBXkQQh/rcgbbe5q28SaSAti9ATmbgFVpZPVAOfYUMLTJ4OVkKRdaMAY0AlXb5Oj7jUizKTKGgS28c0MsLt6APChCjLpAvneobiKGM/YqFwS7JL5ShxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMzUB3jG84CgJQrq2USrjummrJt4hDib2/o4o41UOtI=;
 b=iEMQYRHo6OmXGLnjnffvc/64gaqWYMcBPNHc+X8wOIdmKBGZ6VF2uOJz40OF5VetzqJslTxZGzBrYWfFIgnHZ8MljDTuHzcsQyyS9Cuk+dNBNLWd4UR7GeqsxM6wQW4WDKkK0ycjnVlF6EdSWMooP8kMNAeLCw5U0yGuwY1EU4mL7qB2+pZNcTtsC/y29I0R0hZGER6SfbxIoWtVVwdkdS7166YAcg3Q0vc84JmgOE+ciIN/cVneHizycHhbI7pkF/CGwLoMztOhMPUzyhaBq+PHS9A3uDkTTRsJ94AEVPq4i2q0G4Fl+2tFFUnR6zNynmGYORIq2rw74SpQOwEwcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by BL3PR11MB6458.namprd11.prod.outlook.com (2603:10b6:208:3bd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Fri, 24 Jul
 2026 14:20:04 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0245.012; Fri, 24 Jul 2026
 14:20:04 +0000
Message-ID: <b58fe765-eaf1-4ca1-b2b0-56f756f6f822@intel.com>
Date: Fri, 24 Jul 2026 16:19:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/19] drm/xe: Report 'probe blocked' error using SIGID
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>, Yoni Levitt <yoni.levitt@intel.com>
References: <20260723203754.3782-1-michal.wajdeczko@intel.com>
 <20260723203754.3782-13-michal.wajdeczko@intel.com>
 <16c11f76-f382-490a-8618-2aa0c02130d0@linux.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <16c11f76-f382-490a-8618-2aa0c02130d0@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIVP296CA0053.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:353::13) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|BL3PR11MB6458:EE_
X-MS-Office365-Filtering-Correlation-Id: 000e3edb-d831-437c-b63d-08dee98ea78a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|11063799006|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 7AxyiZvXl6cK098SX6fY902E5TCbj6RK99B9L5HboU01ZMGj6QtiGlbivIGI4rYj6YL6F4b1+FOJiHag+KgvZ6pxajzFPy3zvBXv1psK8oWkcHF4ImXoEGERak/q2b2Q5bnpgANe4++U2CoaAgqqfn+Sm/yr+7SltsWi0CtpbsL06tZBtnZQFd+I/UypuBsrj4cXBcHwJLHC+rdNQ9BxYm7tLB3auS4Xk1TetsQvliouwLE2c5S4QOiVk65wGXMzr0fsu7SNiX/kMACM4WbJ8p5Ev1DVHlVVV+O+RuzT7sRtOcptC/rM5GBYtbhzFCVGdupOwUzjUp9dmXajlPRVCW5ZdkAiosyqPvNvrCTRQSCJvz+1gQmR6lwCJZxMI5JLesoibL8e8vcjO7JCHZIxhJSR7T5+brllEIA17sdwjK1dkgorTQU4e0XwZyPzkv6mdHy1LcYMKtTqjHQbVkBk3YYW02VjOUPBQXiG1UbIY+e3ogDIhY1o+Ok/asee0sTFXJpGpZ06iWouzW12JFYZQ59h2ZbpJAGmkDf/FunINdLXHs2UnhMPXtzfWzsr6IL/RFTRMRxRPUruHLWjWK3BNDY7U0xkkG5KZAPVIEG79BiXf7sfb0+M5PQMb8MAMX8GiQSoorBf4EMNLOO+xITnd931nLLNCGw0OsLbxMDm1cE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHZRZmRMRWp2WktjN2pJQXpON0NGcUFTTkhxK1plMmNIaTczL3JwUjVPVFFI?=
 =?utf-8?B?Q1dkSnlIM3VhVHYwV2ZzWWdJd2J3TzhTZzNzOUxEcWV6RCswMDhRVkpGTGEr?=
 =?utf-8?B?a3VkMlBLanE2c2M3MmtQQ0lhU3NJQWpZR0RSaFNXQWZ2cndZMVBBY2gybG1r?=
 =?utf-8?B?UWpjRW9EcURabDRCMEw0bzFPR3RQTkJmREwwSVZQdFZ6RTRCdVpwVTV6NEdu?=
 =?utf-8?B?WXozQW8rZnl3SjQySjhtb1gzM1JXSlZraG9wMndWSG9kczhBdmJMSkNncm5E?=
 =?utf-8?B?TW5mUml1OEl4UzIvbHp3QmxhRzM2VHAyUU1FVkFZcTVLS1dZNGtGMTNacWo3?=
 =?utf-8?B?anorbVZaRmI4MkZBbHpxVG1EZXg2VHlFYVA1L1VFWlFIUnAyeUc4QmUwdlVJ?=
 =?utf-8?B?WlJ5emN5QllNNE9aWTJjWmhBbFk5MEd6YUxqVVBJZTNMc2RoaFB0K0lPUXNN?=
 =?utf-8?B?T1VyczBDME1VSEpMeDBvMWwwQUZrNVg0OU1JRW5HK0srV2ZNMEtxYzZnL1Bk?=
 =?utf-8?B?SDJhZ3hLcXJ0UndWWDVxS2JOL2Y2U0xYV3lheVpSNnhYZkdUN000WWljM3lj?=
 =?utf-8?B?Nnk5K3QwKytlb2ZtOE1aQm0xNGxiTEN1Skduem1jeU9waG1aVUVRV2dpWDVG?=
 =?utf-8?B?NjcvZjR2VVdlUHJ2cGRRdFVkS3NJdmVQTnZPV2NNQlFNUWhLYnVJT04wOVh4?=
 =?utf-8?B?dmpUcGhKdWZuVlIxNWIyWFZuRHJMMVB3MVlsZTM2YjNvQ2M4dkJtaW9ZRkc1?=
 =?utf-8?B?bDU2QkViTnJQNTNBR2VvK0dKdFU4ZlJWekd3Z20vVlROZkw0emZRbjN2VjQ2?=
 =?utf-8?B?dmFhbE1ZVUdXT25KNHp5aiswaWQ1ajcrZmhqRjY0dWdFTGs2NmtERDJ1RktU?=
 =?utf-8?B?MUJDc2FLNVlKZkozWE5TR0tjckVoNU9BMTlMTHQyNjJRekpXMHFBc1NzWmR3?=
 =?utf-8?B?RzdHb3g2TXk4VDdCOWJ6ZklGTjQrMkEvVGVUSWFEL0VFcEhRYjdzVVFNK2lF?=
 =?utf-8?B?RHlCb2pvOUlJV211VkZCdUhoR0JYRFZ5aVBVeFhFUGVlN3ZaZ2xBMStDS0oy?=
 =?utf-8?B?bHc1NDJjZzFiUzgvZVB6VFRwazFqc2ZibHhxU2JHVTNqVlYvZndRYkdVeFRt?=
 =?utf-8?B?amlWSi82QUdiYnZ5QXhTenZObWQ2cVl2bEh5OUdxMFNvRVE3RmNpK05JVGVZ?=
 =?utf-8?B?ZlpXcXlDbGxYTnJVSHJyYkNSbGpadm9zNzBjOTIvUng2aWprcDBaL3hjWllS?=
 =?utf-8?B?aklxZ0dJem5LZmw4NSswR0piVkdUOTFvWEhjL0lYNWFTaVRMc3UwN0dZS0cz?=
 =?utf-8?B?dWZTZVpSQ1Y4Wml1WXc0ZXZ2Mkw5UGF4YnU1MTd3UE96YjZuUnBubEttM3hj?=
 =?utf-8?B?ME5nUnNwRlBoc1dialVqVnNXOVJQQ0d2NW10VXRwQ1pYSitSb01XNGIrZGI1?=
 =?utf-8?B?eENiMko5d1FyTWRoK3MzeU5wV2FrMlljenJobGVaRi9NeDNOSlp1Vk1SNE1r?=
 =?utf-8?B?dmw5UTkwZHNVeUVJSmd6ZjhIRTl1SVMxTlVkYktiYm1uenRKSVJ1dmppVllt?=
 =?utf-8?B?eHdDY29iNXBqRTFBaGFuMlVSN0VmQmFta0l2Z2VkcHRLdDIyQmlGNmM4SCt3?=
 =?utf-8?B?ZnFibXhraCtxZStNR1BweC9RbVBJdUhTNHdJck0wVmwxQWVwRElPand1dGI3?=
 =?utf-8?B?c0RkQ00xY3E3cHlLQ2s4U1Y4OW1JbEI5dVFIRG9PNHRMT005d1Z0YnY1WFgy?=
 =?utf-8?B?T0VkamZjODF1RG95SWZSWStxdC92R3A4WEwxeTZkQTMxVUI2cW1Vd0ZWUjh6?=
 =?utf-8?B?WlJnMHB6Nm1jME5QcFhKVDZXUWZwWitmRkRHZjlCRDR0RC9hY2lxT2Z3V240?=
 =?utf-8?B?bkpweDJvZlR6K1pYajU2cGpTaDMrZE9FanBHTEhZQml4RmNZaGJkWkZ5UUFv?=
 =?utf-8?B?UWNneUdMVFVkRjlVc1hJM0tRRytOYXIwN2UwK2tJRktjYXpjdFhrVVFIeG5B?=
 =?utf-8?B?Q1FkRUhrLzkxWVEvU3hxTjBDSnlWNDVidC9lZ0E0cW1NYU91ZXB5cWtTcGJt?=
 =?utf-8?B?NXIwSzZrRUVMTTZWY2JES0lPVXNpRXdKaGZTYUE1ZGRjR2xXMmQvVXhPUWVB?=
 =?utf-8?B?RlBxOUFvUmdmanhYa1JWaS9SYTBXZjdvbVZ0YXhET1BaNnFlMzNLMnpLOUFU?=
 =?utf-8?B?aUJ1b1l3NDlaM3JGUnQ4TURKODZsT1NPRXhTTVNyS0hhUkRoNlN1QitwRFdk?=
 =?utf-8?B?akQrcEJuYkd6TldhanZQOTNyOXMvQmlUSGp4MjJrUkhhMDBzUkN0RmRmMUQx?=
 =?utf-8?B?TjJxWU15MnZ0M3luWG00VGV1akRXb2RLMk0xQUVWcFpZT3p3S29aWVJyTitK?=
 =?utf-8?Q?7IsdrsBDjIofBlAc=3D?=
X-Exchange-RoutingPolicyChecked: ZtDV75o9VaqebHljID/nVDwWfMF0PzOB/aetDIWGXXAsGoEBFRa27EQfxlGwrcCmbLfgO/MZcsPXBUM4+fCJwCrXGl9ucexVTldV3Kl40LvGNNuRlcPwbH/hcyrNY7MmAak/Ar43ulHFLaeuBQfQ3f0hqKxonqOeh3BkDy/PvUc2RSMqT2elocqWJPP9cS3OCsxRkTdF4T23imBqUNpe1kcMTY9O33xhnFtthiStSu2XVo0HXC15uugP2o/KSv5OXYaaXeBD+6hm6eZXE+HysvAaeBktcjaWKt/t+L5a8J2sk3oXygZInUHH651C/zWw7a3ib9Y8+NQajYW7SitRFQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 000e3edb-d831-437c-b63d-08dee98ea78a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 14:20:04.3761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YBtEmUCVXQRDHn0TKfF9jssajwKFEXArjCFSficcffVZSxXq4BF3ZDJeAyttqLjPUp7jHesulGLBkU8hy/3cSmhICVoo1OIIgBhE56zVM8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6458
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



On 7/24/2026 2:28 PM, Aravind Iddamsetty wrote:
> 
> On 24-07-2026 02:07, Michal Wajdeczko wrote:
>> Report 'probe blocked' error using xe_log_err() helper.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_pci.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 36d62927b969..a9ada8e4f081 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -25,6 +25,7 @@
>>  #include "xe_gt_printk.h"
>>  #include "xe_gt_sriov_vf.h"
>>  #include "xe_guc.h"
>> +#include "xe_log.h"
>>  #include "xe_mmio.h"
>>  #include "xe_module.h"
>>  #include "xe_pci_error.h"
>> @@ -1172,8 +1173,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>  	}
>>  
>>  	if (id_blocked(pdev->device)) {
>> -		dev_info(&pdev->dev, "Probe blocked for device [%04x:%04x].\n",
>> -			 pdev->vendor, pdev->device);
>> +		xe_log_err(pdev, PROBE, -ENODEV, "Probe
> 
> if this is due to force_probe passed by user shall not even be
> considered an error.

true, we can use xe_log_info(PROBE) here

and I assume the plan is to use use xe_log_err_fatal(PROBE) on all other error paths from xe_pci_probe()

> 
> Thanks,
> Aravind.
>>  blocked for device [%04x:%04x]\n",
>> +			   pdev->vendor, pdev->device);
>>  		return -ENODEV;
>>  	}
>>  

