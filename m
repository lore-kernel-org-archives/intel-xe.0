Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE547C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 16:41:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326AD1134BF;
	Tue, 23 Apr 2024 16:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ROSbXaCp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 467E81134A9
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 16:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713890467; x=1745426467;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=c8ZYUeU9c9mjIOc3ckVS6NZgsQ1tlg9fg+2ExC9pl1c=;
 b=ROSbXaCpdExwVmBkeC/fNA8bqNalaGOy3dvHmeGhD1GMYnL++B3AULyB
 oS9tFAw1ujdck5nWsqkpzuemvnokN2mWuDwFU2mpeSiMyKTGYGZDwF2jm
 vbw7+DeajqiBtF7QZ/4cocO+b8xv1+vKLnm46jTKoeEfJQqPDGZ6vXSdo
 74GXBd2J2zf0MHnCrV6OCIsDMJD7oehrg4m2/z8rS93wCH99g7nS+4c9t
 BA4tKal8DbMh3mQT+WHx1XX9559tgEYYNQvmG/Av97fAnOGyqxSDaSJ5C
 5HLx618qPxaF99ZGp32dbWg2kKS3qGesqkHmSApOkNQ2COi8L+659nTUa g==;
X-CSE-ConnectionGUID: O8JPBeERSuGM4m92S5pTdQ==
X-CSE-MsgGUID: T56o9SjrQOqG5H0T4xKbWQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="20182489"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="20182489"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 09:40:54 -0700
X-CSE-ConnectionGUID: m7nUBx7vQEWEEhwh8c/pnA==
X-CSE-MsgGUID: 6dLd2IUGTSaGC0L2Suq6JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="55625233"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 09:40:55 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 09:40:54 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 09:40:54 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 09:40:54 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 09:40:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aLNVP2wpAgdrFYc2MM+lwQCAZTQTDvkDRrsd7WKYGQ1z3Re59gVuSJukK8zhYCr8cyd3yad7Ed5P5fdxr4/kkJ6JPMPomVlzNMTECn/enUbKDIvs38MlPPNZJxnAWty5nnehheGDEceJO38ckB/OwChE/pdO0DniZKGzU+6+dZYwRpDcWqaBbmS/Rh3ybPE3ppLJW3nnfY104amD0kHWY9po52bXNruhkOQR/WGD6HbVT4CKXR4khZqlUhhDu1Y2wwjvsDjfg9a3OJeJv/yoST3tI/31Z8qI0UnthCFsi/FKPP2f77YVJSimncH0qZjPcXsaa53u3ZklpZXyb7nfxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UagVf0LKyiFCylqbRsPU4o5+/vnEocJQuWcB1vOSTnA=;
 b=hd9l28AE4ENhSIrpyVScL+kxxNrsxNhOc0A5zdJaUj9XiOpoqDJVhjNvQbGS0iiq5Fwu+WY2GFWF7hhw27ttzT11ekCliMFGxJjLpdtBD7FxrhgvoqSlw2pD79LlxgEeJXxbdaAnInUOXs2ncnSYjMTvwX3yAkxlMv4HSYj3LsnDfOX3oueHvL7IL3JXmGr4Ax4IKb85Ik49qlFDISOmxJbPMHfKMjLUB3jjkgvFlUSfiBI1nQ/L+tsetrMLoeI+J8Qny6XJdeut6JubjrY6FzrMUBNGATQEFzhMWcXFxf6Aw4ap6Y90WwZZzZ2kVRoedvDJfYpTsiq6S/BztO485g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by MW3PR11MB4587.namprd11.prod.outlook.com (2603:10b6:303:58::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Tue, 23 Apr
 2024 16:40:52 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8e17:1f3b:64f:9c67]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8e17:1f3b:64f:9c67%4]) with mapi id 15.20.7519.021; Tue, 23 Apr 2024
 16:40:51 +0000
Message-ID: <b50a93a2-d361-4561-808a-7efd940afd59@intel.com>
Date: Tue, 23 Apr 2024 22:10:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/lnl: Apply Wa_22019338487
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240419201344.2467569-1-vinay.belgaumkar@intel.com>
 <20240419201344.2467569-2-vinay.belgaumkar@intel.com>
 <k3jikyitmhmgwboorl4f76iio744risyg2qradk4p44lhsaqdt@whn77wuihwtt>
 <e6b3fb73-db62-49d7-8e91-cfb5fe094587@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <e6b3fb73-db62-49d7-8e91-cfb5fe094587@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1P287CA0020.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::23) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|MW3PR11MB4587:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fbccfd5-c0cc-4dcf-3014-08dc63b42311
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWpLY1pGRVpqM3dnMDFhaTRDbUl5ZFRxUnowYzc0SGtoOC9WZFo1TTJJODM2?=
 =?utf-8?B?QzI0N1VITWJqcEpwK0FKUDVWVkV0eXArY0QxYzdTWjAzYmVRbDlOUUJrOUQv?=
 =?utf-8?B?QXBQL3ZZc2ZiZllEZEdKSjNub3FFemZTYzBXSGNadVM5akR5bVl5NnJKQUZ0?=
 =?utf-8?B?cXhWbk1PN2wwYUc3NjBwMUg1NzZ6THI4ekhsOU9BcDB1eDZzbEszQ2ZObFpB?=
 =?utf-8?B?L1M5ZWRPUGlBb0tEb3JWMjNMaGM3R0dZclNGcGh1aGFwbkgyd3ZmRldIbG5h?=
 =?utf-8?B?cDZrNHRPWGw1MEtLbXNvOWIwMUNLWGZHTi9yM0hrZVl2dWpYc1J5M05zSlZT?=
 =?utf-8?B?Tm14NnNqMHlpaGxzVk9NT1FFa09MRVZZQVFNMW1QTmE3bWtxMGovVjRsbHFC?=
 =?utf-8?B?S0grRzNQYWE3R25rM05QbHNCS1Y1d2dlME9GT3dtaXBhOTNPSHlEZ2g0dnhs?=
 =?utf-8?B?czVYSmdrU2NQNkNPazBERS83SllaOWhLSFpiZkVZa0RVN0U5YzVudSt2dWhj?=
 =?utf-8?B?enZFdzdnMEkwSVdoWWZmQTVONk5IblBheGZWYTlHL1IvRzhEU3BtSWZCMlU3?=
 =?utf-8?B?dHB4T2xtRm1mVmdSN0xub3Q1MmI0N1hrYjdJZG5nVVE0dVVEQVNMb2RJRVgv?=
 =?utf-8?B?aVhEUzZ6YnJHc3JidjhVTHhob3N3MVZPSm5LRzRkRDNZdFBnTkNyblRkMGc1?=
 =?utf-8?B?YXlhVVFtaGdNclRkRFgvRHhYa2FDeFc2S1l5Y0ZXRURuS0s2ZnFiTE4zQmtw?=
 =?utf-8?B?clk5cmJ2U1NRUEVvWGpEb3V2ZFBITEVhcHRMaklGT29IN3JGRU1PS3MvY3lU?=
 =?utf-8?B?UHJkQnZuRTJncXd3RlhHWmJxMHY4eVNvSklQamVrMW4vSU4xV0dpYllIMkdZ?=
 =?utf-8?B?NzNBd2U3TkVaQlg3dGpTSDFmNkRtbzhuNFdTeFdQN2E4eEJxdktzc1ZrWTdG?=
 =?utf-8?B?WkNPQUlyY3VEaTZRRGVZVlpXTnR6Qy9URlczZVZ1cDF5cnhoc2NoTzY0RHJw?=
 =?utf-8?B?a09LMkwwcXRIQVd0NHJyYlQ5TEZ6dXVkVTNYN2JIZnpGalV3WjZBN1d0SnJ6?=
 =?utf-8?B?RDJ5d294OVJlSFVPV0ZNZ2VKcVIxeUx1aGVpdGJpZENzR1dhNTF6UmU3cWQz?=
 =?utf-8?B?M3MxZnRrNTVBb3ljWVhOVXFpNnUxWCtvMnpQeFMrbFFvbS81Tk10TWFvM1pj?=
 =?utf-8?B?bjNSVG9tTGVVU2ZBMkRudElBWk5OZmhUbE53eHV2YlBKM0VPMGNHZGsveVND?=
 =?utf-8?B?Q1I1Z200K1V2Y20yeDlXNXg0UVFqelhUVDFFR0FOeXViYWtqTUQrd1FVb05F?=
 =?utf-8?B?emc1bTVTWEFjald6dGxpSXFSa0ltUml2OHY2NHF6MFlON00yZ3ZWbWllenp6?=
 =?utf-8?B?WjNLSU9MZWFGb01GUEhkOXUwVVR3YzRXTkR2M3F0TERRMkp6QjdNV2pJTzhZ?=
 =?utf-8?B?RGxRSHVTbTh5WndNWStZajEvV3k4OFpQRWVia29QYXYzUDF4R29JYTFpaTYr?=
 =?utf-8?B?akRURXE3dnFCNE5lM0FLbzZLai9JaENkby9rSTkyNll4aXMvQmtJMXpjd0wy?=
 =?utf-8?B?Y29vT0VjL1JYUU1KMHo4bVNiWFpYeGZMdUJXR0VvSXBUN2d6M0ZNYjd0ZGdY?=
 =?utf-8?B?ZnVVVkFneHhyUWJKZWQ4dTZvUThUREFNSmxoU3BQZ2MxVGI1dml1cGMya3l4?=
 =?utf-8?B?Z2tDQmNlK0syb29RaDlEYVhxczd1QW9yUjBKdi9WNVlQMHF4VFNXNXRBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGNicVJPTVZhVUZIWEFsTzVXMGJuaURHTlBVNDlFZmN3ODhSdTFFckY2cnox?=
 =?utf-8?B?WUl1OW9zaCtLTDdtUXdoa1dCcHRDMW1ZWFEways5NEh2TUFycmtSdUQ2SXZV?=
 =?utf-8?B?TGUxTncyaGkyN0F6Vk1KOG1RbndqVlZuNXIza3FDQ21YN29ySGJOZVRLcEsx?=
 =?utf-8?B?TTA5VXdpMEFCaDIvRHpDVnhoWEtDb1kzVTJnaGhzekdvS09uR09leTN5dXY4?=
 =?utf-8?B?b3c2VFhmWXNxWElKWDkyL3VGT21kUmZqcXJEaTc4WkJXUUpsZUIreUZmZG9O?=
 =?utf-8?B?MWFxNHh0REE5K3JjbXpGWG5GN0hWT1VSZ2p3RjhhdW1VTUdOSGVPRjN6b1pC?=
 =?utf-8?B?QnJVU0hodG1oZXZJOEVsN3FIMHA4RG9kRG4xVnl0MXJxdzBEN2JBY0tDZUdT?=
 =?utf-8?B?c2FFMlZUcmhZZ0Y0NzB5N1RmVTBkWTZNL3djVndQTGdLWWNzb2pYbE9IWWF3?=
 =?utf-8?B?MTZaaHpTSUllOVZHcGZzU1NtV1grbTViRXI4eHViNVkrZHNaTTdRaU1ZL3lh?=
 =?utf-8?B?VWFSRUlJY0lDOXJpYUtWbExnWWR5VmNZNC9VZDgxc3B0bGE5VWxPMWNuYkNU?=
 =?utf-8?B?QUZzMS8vVjBPNWxSS0s2L3NJSXJiRkJTbEdnQ09yU3hzdmRCWVlDT2pPaGpD?=
 =?utf-8?B?SjFLNG9seHpHQzkvTnc4dFNBUDlsbGxTbHpZUW5lT1Fudzd2R1FXV09MSzFQ?=
 =?utf-8?B?VjhiWE11VWNBNWVMZXF5aE4yakZuN2MvSFpsczhqOXVBaUNDZHA0LzVmaWZl?=
 =?utf-8?B?bi9hVmx5bVR0QzlWbHN2aUhBTjQxVjhSWmk4ekpzU2dkL2JWYk14ZnVxNjh6?=
 =?utf-8?B?d1QzZnBYekVGZzhRSXdsYWQ1ekZ0NnNlQXFZOGFoaHpjWjJWeTZFS0NyTzlB?=
 =?utf-8?B?Uk9UNFNqenZzZ29vMVJlYjBTTTdKbGNSTFlaSUhiU1lDRGJPMjB1dEw0bDBK?=
 =?utf-8?B?NkhzSGZwT1hyTlQ5b3ZNK2w3ZE9hUUZ5RU9KOXdZbXZ2STdlRGIyS2YyY1Nx?=
 =?utf-8?B?UzE1NkxwZHBydTY5OWVuRDVJTFRzUUN1TzJ2TUlNeHgwTHNyYTJMTmtaNDBs?=
 =?utf-8?B?YlFIcFVncDBDT1hqUVRDVzhheklqUmpMdWxwTmpQeERjSmNGVFdxZVE4VlBl?=
 =?utf-8?B?LytKYjhEdDlma1RudVVRUXBrUmpLK2lFTUJUNUV4QmdSblNoVUNiRjF5dnVl?=
 =?utf-8?B?NVhLWHNNL2cxVW5jR3U2TWRQRmUramkzUGF6OE1XVHdQb3JRMjJFMll0SkUw?=
 =?utf-8?B?U1EzTVhtUkhBWUxoK2JQSHlDMCtqbERXTFRSWjVJR1E3S0xET09kU0FHa0xI?=
 =?utf-8?B?QWVQeGtzaXIxZlE0V3RWVS9wd0grcDN6eGRJNUwrZ05LOXljVFJoams0SFlN?=
 =?utf-8?B?QUtBV0FOZ3UvMVdPN0ZtczdpTDZ0ck5xbmVFYlRjbUN0bHE4MTcrbVZaaU5V?=
 =?utf-8?B?ZnMwbllTWHF2N0k0ZjFhSVYxWFZiV0xaRXhmb2RFM1hva3hnZW4rUVQzOE9v?=
 =?utf-8?B?UzRjd3VTUFU1U1dBc2Q2RFNPV0o0WTQvdXM4MTNZSzJqQTVFMzVUQmRiR2hG?=
 =?utf-8?B?UVdEa0JHU1Irb1k2OGx0azJ1ZWgvY1UxSnBNdEFHQ0szS0ZqZWcrdk0zNDdD?=
 =?utf-8?B?R3dOSHlnR1dlQzl1dG0rT1d1RjZHelk5R3ZHSlJyZUdDS3pISFg4T1hLMnZN?=
 =?utf-8?B?ZDkxQzljemE3SEc0WStpd244T1dMQ2tIdjh2M2svYWRnNjRYelczL0lDUTRQ?=
 =?utf-8?B?LytPb3lIVjEyV2g5RUpCbjBqQ2lVWVpmellYTlNocVMveUJwL3Y3cUhNaGgv?=
 =?utf-8?B?bXBKbVZBMi8xWE9taWwxN253c2R1QXp4OUtaNCs3WE1FRnJKOStIcU0wQmFW?=
 =?utf-8?B?RnZvQ20wSjZPU29hZmFQdDZmem9UYzZ1K3BaVjFDNmJBclMzbWxaWHh2UkN0?=
 =?utf-8?B?UUxiV3ZReGtOdVVHREo1enJPZ0lWRzJQcVFxYTJxYWdJTHI0eGtUeGRVWW4v?=
 =?utf-8?B?Q3ZjaktPSGJNWE1SeDk0WXNuT0x6UCt2Qno5SGxRS1dOcW1JT3R4RG5iY0Vr?=
 =?utf-8?B?WTBGWGY4U1ZXeUFtWlhia0luRndFVkpEMmEwQ3hBbFJ4VEpLdlE5MUkyQkNT?=
 =?utf-8?B?ZWRCei9NUVBTVE1PaU04UjFJU3RsTW92QXFQQlM0YStBSmhkaWM1SWtMOWFG?=
 =?utf-8?B?TUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fbccfd5-c0cc-4dcf-3014-08dc63b42311
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 16:40:51.6758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q2PlQh/VwiYbcGSnZ6mPyrHJMDmenJfaW7AV6f0rDpP4LlRv4gOLZ/ARdMbLPhKcTIR3r+G4bXB1LRJsrTj5IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4587
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



On 22-04-2024 23:40, Belgaumkar, Vinay wrote:
> 
> On 4/22/2024 11:09 AM, Lucas De Marchi wrote:
>> On Fri, Apr 19, 2024 at 01:13:43PM GMT, Vinay Belgaumkar wrote:
>>> This WA requires us to limit media GT frequency requests to a certain
>>> cap value during driver load as well as after driver unload. Freq limits
>>> are restored after driver load completes, so perf will not be
>>> affected during normal operations.
>>>
>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>> ---
>>> drivers/gpu/drm/xe/xe_device.c |  6 +++++
>>> drivers/gpu/drm/xe/xe_gsc.c    |  8 +++++++
>>> drivers/gpu/drm/xe/xe_guc_pc.c | 40 ++++++++++++++++++++++++++++++++--
>>> drivers/gpu/drm/xe/xe_guc_pc.h |  3 +++
>>> 4 files changed, 55 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device.c 
>>> b/drivers/gpu/drm/xe/xe_device.c
>>> index d85a2ba0a057..e29c152a6c4e 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>> @@ -30,6 +30,7 @@
>>> #include "xe_gsc_proxy.h"
>>> #include "xe_gt.h"
>>> #include "xe_gt_mcr.h"
>>> +#include "xe_guc_pc.h"
>>> #include "xe_hwmon.h"
>>> #include "xe_irq.h"
>>> #include "xe_memirq.h"
>>> @@ -336,6 +337,7 @@ static void xe_driver_flr(struct xe_device *xe)
>>> {
>>>     const unsigned int flr_timeout = 3 * MICRO; /* specs recommend a 
>>> 3s wait */
>>>     struct xe_gt *gt = xe_root_mmio_gt(xe);
>>> +    struct xe_guc_pc *pc = &gt->uc.guc.pc;
>>>     int ret;
>>>
>>>     if (xe_mmio_read32(gt, GU_CNTL_PROTECTED) & DRIVERINT_FLR_DIS) {
>>> @@ -343,6 +345,10 @@ static void xe_driver_flr(struct xe_device *xe)
>>>         return;
>>>     }
>>>
>>> +    /* Set requested freq to mert_freq_cap before FLR */
>>> +    if (xe_guc_pc_needs_wa_22019338487(pc))
>>> +        pc_set_cur_freq(pc, min(xe_guc_pc_mert_freq_cap(pc), 
>>> pc->rpe_freq));
>>> +
>>>     drm_dbg(&xe->drm, "Triggering Driver-FLR\n");
>>>
>>>     /*
>>> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
>>> index 60202b903687..556e73fca813 100644
>>> --- a/drivers/gpu/drm/xe/xe_gsc.c
>>> +++ b/drivers/gpu/drm/xe/xe_gsc.c
>>> @@ -19,6 +19,7 @@
>>> #include "xe_gt.h"
>>> #include "xe_gt_mcr.h"
>>> #include "xe_gt_printk.h"
>>> +#include "xe_guc_pc.h"
>>> #include "xe_huc.h"
>>> #include "xe_map.h"
>>> #include "xe_mmio.h"
>>> @@ -339,6 +340,7 @@ static void gsc_work(struct work_struct *work)
>>>     struct xe_gsc *gsc = container_of(work, typeof(*gsc), work);
>>>     struct xe_gt *gt = gsc_to_gt(gsc);
>>>     struct xe_device *xe = gt_to_xe(gt);
>>> +    struct xe_guc_pc *pc = &gt->uc.guc.pc;
>>>     u32 actions;
>>>     int ret;
>>>
>>> @@ -367,6 +369,12 @@ static void gsc_work(struct work_struct *work)
>>>     if (actions & GSC_ACTION_SW_PROXY)
>>>         xe_gsc_proxy_request_handler(gsc);
>>>
>>> +    /* Revert the min/max freq limits as we're done with GSC/driver 
>>> load */
>>> +    if (xe_guc_pc_needs_wa_22019338487(pc)) {
>>> +        xe_guc_pc_set_max_freq(pc, pc->rp0_freq);
>>> +        xe_guc_pc_set_min_freq(pc, pc->rpe_freq);
>>> +    }
>>> +
>>> out:
>>>     xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
>>>     xe_pm_runtime_put(xe);
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c 
>>> b/drivers/gpu/drm/xe/xe_guc_pc.c
>>> index 521ae24f2314..7f82b6c2ad3c 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>>> @@ -40,6 +40,8 @@
>>> #define GT_FREQUENCY_MULTIPLIER    50
>>> #define GT_FREQUENCY_SCALER    3
>>>
>>> +#define LNL_MERT_FREQ_CAP    800
>>> +
>>> /**
>>>  * DOC: GuC Power Conservation (PC)
>>>  *
>>> @@ -237,7 +239,7 @@ static void pc_set_manual_rp_ctrl(struct 
>>> xe_guc_pc *pc, bool enable)
>>>     xe_mmio_write32(gt, RP_CONTROL, state);
>>> }
>>>
>>> -static void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
>>> +void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
>>> {
>>>     struct xe_gt *gt = pc_to_gt(pc);
>>>     u32 rpnswreq;
>>> @@ -673,6 +675,25 @@ static void pc_init_fused_rp_values(struct 
>>> xe_guc_pc *pc)
>>>         tgl_init_fused_rp_values(pc);
>>> }
>>>
>>> +bool xe_guc_pc_needs_wa_22019338487(struct xe_guc_pc *pc)
>>> +{
>>> +    struct xe_gt *gt = pc_to_gt(pc);
>>> +    struct xe_device *xe = gt_to_xe(gt);
>>> +
>>> +    if (MEDIA_VERx100(xe) == 2000 && xe_gt_is_media_type(gt))
>>
>> that's what xe_wa_oob.rules is for. Why are you adding it as a separate
>> function that won't allow debugfs/.../workarounds to match reality?
> 
> The workarounds are not initialized at this point, this is early in the 
> driver load process.
With below steps xe_wa_oob should work for your Wa.

	1. Add "22019338487  MEDIA_VERSION(2000)" to 
drivers/gpu/drm/xe/xe_wa_oob.rules
	2. #include <generated/xe_wa_oob.h> at the top.
	3. if (XE_WA(gt, 22019338487) && xe_gt_is_media_type(gt))

Regards,
Badal
> 
> Vinay.
> 
>>
>> Lucas De Marchi
>>
>>> +        return true;
>>> +
>>> +    return false;
>>> +}
>>> +
>>> +u32 xe_guc_pc_mert_freq_cap(struct xe_guc_pc *pc)
>>> +{
>>> +    if (MEDIA_VERx100(pc_to_xe(pc)) == 2000)
>>> +        return LNL_MERT_FREQ_CAP;
>>> +    else
>>> +        return 0;
>>> +}
>>> +
>>> /**
>>>  * xe_guc_pc_init_early - Initialize RPx values and request a higher GT
>>>  * frequency to allow faster GuC load times
>>> @@ -684,7 +705,11 @@ void xe_guc_pc_init_early(struct xe_guc_pc *pc)
>>>
>>>     xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>>>     pc_init_fused_rp_values(pc);
>>> -    pc_set_cur_freq(pc, pc->rp0_freq);
>>> +
>>> +    if (xe_guc_pc_needs_wa_22019338487(pc))
>>> +        pc_set_cur_freq(pc, min(xe_guc_pc_mert_freq_cap(pc), 
>>> pc->rp0_freq));
>>> +    else
>>> +        pc_set_cur_freq(pc, pc->rp0_freq);
>>> }
>>>
>>> static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
>>> @@ -715,6 +740,17 @@ static int pc_adjust_freq_bounds(struct 
>>> xe_guc_pc *pc)
>>>     if (pc_get_min_freq(pc) > pc->rp0_freq)
>>>         ret = pc_set_min_freq(pc, pc->rp0_freq);
>>>
>>> +    if ((!ret) && xe_guc_pc_needs_wa_22019338487(pc)) {
>>> +        /*
>>> +         * Setting min to RPn disables use of efficient freq
>>> +         * which could otherwise interfere with this WA for media GT.
>>> +         * We will also bind max to MERT_FREQ_CAP until driver loads.
>>> +         */
>>> +        ret = pc_set_min_freq(pc, pc->rpn_freq);
>>> +        if (!ret)
>>> +            ret = pc_set_max_freq(pc, min(pc->rp0_freq, 
>>> xe_guc_pc_mert_freq_cap(pc)));
>>> +    }
>>> +
>>> out:
>>>     return ret;
>>> }
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h 
>>> b/drivers/gpu/drm/xe/xe_guc_pc.h
>>> index d3680d89490e..25fe693c7ee3 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>>> @@ -27,4 +27,7 @@ enum xe_gt_idle_state xe_guc_pc_c_status(struct 
>>> xe_guc_pc *pc);
>>> u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
>>> u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
>>> void xe_guc_pc_init_early(struct xe_guc_pc *pc);
>>> +void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq);
>>> +bool xe_guc_pc_needs_wa_22019338487(struct xe_guc_pc *pc);
>>> +u32 xe_guc_pc_mert_freq_cap(struct xe_guc_pc *pc);
>>> #endif /* _XE_GUC_PC_H_ */
>>> -- 
>>> 2.38.1
>>>
