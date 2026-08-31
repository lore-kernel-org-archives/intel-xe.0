Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1F6C61DE2
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 10:51:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C6810E195;
	Mon, 31 Aug 2026 10:51:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QitDeayc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68DB710E195
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 10:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788173504; x=1819709504;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jYk97xnADsmgx2peBfZS5X/EX3uQ1kspLiskxMHl3oc=;
 b=QitDeaycNt1zhmfq7q2UQUZESYhjhvAQHUnaXLX0rnf1RqGdMGYIa9hs
 Yl3s81kjuvfso1/tmg+v/GvGgyqs/l2US3SuwA7/wpgRE0/c/vrPA1x9N
 w6xMetLMT6ku2HkLsa8xLUdesDLUSBtMl6eLDEN7af7/yHmt7KWqCfDBv
 ahYBOfIqtTL/TKqgisluAs4tc8tjIBW5uNGWbCmp/7I8gM0LeX8tAJ9m/
 dTsjow1rlFLfFhO0AXozVFGYJ2TmYqyXG7ZC/r5gM4K+OnORMJbZmTYxU
 8mkDBautUCdI1Wrn+G72hbERiQZU0mQYO4awj7DJIpHUyAbuD0yPPGxNy w==;
X-CSE-ConnectionGUID: SE43VHE6TlOt3BGuc+MpDw==
X-CSE-MsgGUID: ScFXifMdQaqjFDPs2XoY6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88701106"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="88701106"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 03:51:44 -0700
X-CSE-ConnectionGUID: KzNAOzkOQ4KGhnXOSErLdA==
X-CSE-MsgGUID: 2/5kGu/BSDChCEahayXEuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="264473877"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 03:51:44 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 03:51:43 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 03:51:43 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.18) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 03:51:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TYXXecPWBpPFCgQkPY1ItY1VJ7ESNZMSi0chuFCaATK8wdZ8HUSjyP/f3bGVMOcBvl9FSmAEgddxdRomGIrxMMtaQNeQFAlFEsqmhwKOUPpOTVcJag+WQaIgqZ1jYUV9hSXNILlrvZw+H22Iz+GLisHzkrFzFA/PIdIcnwVerouy35mTx86/SjlfuRUdvFNu6IIuPnHUtD6CmJ1F8vEYUHrMvyNoHg8K+p9g4S73ZTtjpXONsjPgrU1KwzyQK6cHcK9EnfgOfV2pWCTh0sa6ORxYgoSuPCs9eJXA92Akp5bJUqtwzjuYGLQBpr9rHsnjuOTYHb4M4iLCa/FVoyHA9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=weY8a9PKE77Y2xqCqIZhyLkUMZKdJP8i4jaHp1wmEe4=;
 b=tvy7VVfC7WMIJAGsyVwVKpdAA8CKkUYTEy0UaLMkp0liU+/HiswOW8htYQ1V/+A2EEHiQiCod+FOz39wJc3FpdqevDJ2vFzfZxM+ZOIjr+l+51OgGGC28AJg0byISF+9zCs714dWFjI4PP1o8Ojuhe9GM6jlbfUE1pWOVcOeLY77ZDEOHYzPWqZs9D0T4BpkQLmLTPyRxUNoCnm/cqtTfsCOQRT4yq3GkU4LMVPHvxqYMXIqzPerwgB6Ftw3YWshB4M7zTw0RrK5eQWWqdWx/19zy5LRMgM5op57ngYukDf9erqgy+CfRMDgepDSY/QgGlT9V4UFAn5aLjUu6omKnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by MN7PR11MB993112.namprd11.prod.outlook.com (2603:10b6:208:5f5::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 10:51:36 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%4]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 10:51:35 +0000
Message-ID: <7484907c-aa30-40dd-b19d-4c69391d2e09@intel.com>
Date: Mon, 31 Aug 2026 16:21:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] drm/xe/guc: Report reset failure using SIGID
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <badal.nilawar@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <dnyaneshwar.bhadane@intel.com>,
 <mallesh.koujalagi@intel.com>, <matthew.brost@intel.com>
References: <20260831080507.2364687-1-arvind.yadav@intel.com>
 <20260831080507.2364687-3-arvind.yadav@intel.com>
 <93b12e0e-4995-40cc-b00e-06af5d0345b3@intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <93b12e0e-4995-40cc-b00e-06af5d0345b3@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0004.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::14) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|MN7PR11MB993112:EE_
X-MS-Office365-Filtering-Correlation-Id: 73ecd604-4cb9-4fab-e417-08df074dd369
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|22082099003|18002099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: pCi3Ehykz3OaOdCyQwhuMpHqH/A3ANkJ38SPnPM+6SL+5oO8zeQ+uuYCy+IRwqKiMXI+UnkGObU6IxhPiuPtRipYHXLZYwPyds5ks816zB7d9PkT1BWsfwm1LBoeRmbVkR1pRR7vsPoXkidmHEMNbSdsdnlMzoUnzBS6MtR6n1lc3MWhZ4JoWZW3rDnH/MzKsVIue2S4G/7EEX07yLO6DyxX1hYYsyYEhLnmvUUudQ+r44Pv3GdN3gS0qGJAq37inLlnaVO70qfLrPXwuAuvDtKYM6TRzZFTTW8loGW4RVJgOpbs19rpcKGkqb/krSobXIeRhPltntnUJcsFpfbST7wdiUbCl7Ik/VWudQyY5/PotPEqCwK2GbrvGsEE8mk82pMuY+D9LWnYvjg0iIjO1A/fKAXFWm13r7Hp60qwvftMNdz4tZjYUhdiFtV3P+z7WXJwBg/QSqyTP3OaPSeoI2tTMzlx+SgvPTrEBLdY5fso4jKqPqLx1cQKsjNu6IJJGq0/GZ89nsTpws9iqGHcbiFKS+hjKKlB1yazwG5GegQIy2UYmgwioE6nKJDJ5/iTqceW6S7hf7vJADRQ8F0aLky1udUlAbeeMtTScHGS691lB3DU8xGgZ9Z+dlyO3fyFmCwyxoto2XSGaHT2wBf1JNsbtS1+XmLAWfH146qSxWs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3pibGpDNXgwa2xKNmtKY2M4MDdtOHhBMS9yN2N1cmpWWkpzZGFWWnBSWGpk?=
 =?utf-8?B?Sjg3VTkrZGU2Z29YOUQwWHdBOWFZZlFtbCt3QlhTcHFrYVAxT2l2cFQveU9T?=
 =?utf-8?B?bXc3MHBtZWRvaU1paWdXQmVzZXcwVE5YWXpJQ01BbUlqL1FicVZUYk9WOTRE?=
 =?utf-8?B?Rng5b2tZU2NzYm1wa3JvMjBwalEwMmFLZGpnZnQrRHpkaTQraWUwRmgzNk15?=
 =?utf-8?B?MkNWc1EwQWdIRWQvOVV1RVZ4K2EzQ0h1eDN6Uy9rbERGVTQzaEV1T21ZYjdN?=
 =?utf-8?B?Wm14V3JmNUdMM3FBNmtSc0FVWU5XeXVtRktKYUF4ZENHRTliWU1mOUpHdjgr?=
 =?utf-8?B?TXV1dG9MTEduNjM5aUtpd2NpRlVxSVlMSWZFUU84ZVFhU01zNngwODNtTU9M?=
 =?utf-8?B?OG5zd05Gam94eVlTUTkxZ1VrZDRvSlRRSG9DMHg4L3JtQnJqSzNVY2VsUlA1?=
 =?utf-8?B?eUJ4Q3FLMlVUaG5hOXREblh1ZFVjcGxlSmMwVlJQQlM5Qkt1bWthOEYrVzVB?=
 =?utf-8?B?ZDRkVUVjZDZUWWJGTDAvRmJFNHF0ZFdlOWFTV3pqaGRIanpqcStFMmxZRDcw?=
 =?utf-8?B?OUR2QmNodjdkRXN0c1k1MGxtWTFybDFsMUk4ZkIxQUxnbEcyT1JpTzJnS0M5?=
 =?utf-8?B?SXNjNFVhRFExaDNwdmNRNkhMZmlLVzFGYkJ2cXBjVGJhWGtoTlBVdWFlZUJk?=
 =?utf-8?B?OGFWcHFWeWJOUXhyMC9UZzdXOERReEdEcmI3cEpwSlppWWJlT05LbmErVThm?=
 =?utf-8?B?NEpYbktuSGsxdFZHVTFMREozSERUQlFVVlI4OEVjVkgzdlM3dk1CVmtCY3ZU?=
 =?utf-8?B?M2JNOVpPcDBnajNRUzFXMmN3UTZMVUFvUXhXY3JheUYzYnVsSXNsbFBBbUxY?=
 =?utf-8?B?NHFNNEx0MG9xUDI1ZEwxNE1CcndIZ0FwYW40ZENDRTU2NTkzM3l5eFY1Y0tS?=
 =?utf-8?B?NUFnTjVmQnd2clNmQm5vcXU5a3Q3KzVBdkVkaks2SlVjYnJEWTBxNm8wWGpp?=
 =?utf-8?B?YmYxdlpOSUxieWtzS3FoZmsrenhIOFBueVVsenNQaWtYbGtVbHhwRFdzQ3Qx?=
 =?utf-8?B?Z3NBV29zVDUyL0N4MlZ4T3NkeWtNZzZrTGVsU3Vybm9HT2hXQmM5SWJIWGdv?=
 =?utf-8?B?ZG1ZZ3hXL1ozVVhwa0dmL3FVeGN6a1pOaW5CdHFEUStVdlYwTkNUNmRtS25D?=
 =?utf-8?B?MHlpcjdsdUJOWEpIN29RUjVPc3BPUS9XakdmY3pzd3FCWG1rd2ZkVWZQMTBH?=
 =?utf-8?B?VWVjN0RldDNFSVRVMWlaZzIrYnFaakordDNGMmg0UmdoejJEaEJSaFVxalAx?=
 =?utf-8?B?TG95WUk2UkgyL2dOMEhVaE9iN05KZnpYei93ZWZ5clpqZC9FUTVsTUVyd2Zu?=
 =?utf-8?B?d0hNOXRIT1B3SUJDNEpnWjhIL3FJakNlZGIyQjAyMElWc05YblZVNmJBMjJL?=
 =?utf-8?B?eEZGSUVxWkV3dVR4UjZvdG01MWh1TTZ4V2d4OS9xSTBTMk1mUFBGckQ3RkxC?=
 =?utf-8?B?V2xJMFdiRUZQalpvSC9pM0MvTEtHbTY4WnFRMTM1Ly9BSldYNHcvVTk5ZFZh?=
 =?utf-8?B?bk1KU0VlV0hUSjJtSXBUcjlBWjZNQ0RYT1ppc3FldWoxUk53QWViUHNmckw0?=
 =?utf-8?B?RHF6bHZvTmFlMGdFNEZ2UlQ1NjMzS0lCaWZUL3RqUHBGMUtWcFNFMjh1NFor?=
 =?utf-8?B?aVpXVnRmeUJqdUZNL3BEZ2lqMlhwQWE4bHZKcGFReGRFSFVvRVVyOC92emgy?=
 =?utf-8?B?dmRuU0N6bjFTV2VzckhBeXE3TmVPNWhTZUN1aFdpZDJpMEpmMGpDdmNaTUov?=
 =?utf-8?B?aXYxWFJRVlhLcThXeUo0N25TSWR2L0dHQ3FjNHdpUzNjUy9RWnI5UCt1d1Rs?=
 =?utf-8?B?VjVKaXl4bTFtdDMwdDdXc1FUWnYweUhYNEg0UkJJS3RrWllwSEhlLzJEWU83?=
 =?utf-8?B?TEkvQjR4WVEzNlVHNUg3SlB6ZUFkQ09HS0NvM1ZRdWRqMGhmNWl5c2R5UVpi?=
 =?utf-8?B?OWs2N1BQV1k3cmdLVzJKZUxBRGZsbElsQWIzTk5rVUx5a1MyTldMMEhVRk1l?=
 =?utf-8?B?aDdnVlduVTlnK0lVNEM0MDN2aHpQNm9tK3hTMFljYTMzY0E2ZlNEZXBVTEtS?=
 =?utf-8?B?elNXQmZ5T05NMVNqNHBvOExtTFJUMktyeEp4SzVVdVhldlQ5VFlBa3cva2Ro?=
 =?utf-8?B?MGNTVDlwamxYTnA4Mm4vTHNyNGNLQ1NhOS8wQ3FSYzcwWVdhS0lydERXdEw5?=
 =?utf-8?B?aXhQSVAxSDFmcm5PYWhWVVRLOGU3ZWFpZHV0WjJCcnZYNVYwNmRGdjcxc2p0?=
 =?utf-8?B?R2RQOXJFSFhtck9DdnVxR25xcmtGUzJaU0EzRnpUcWRobVBLSk9adz09?=
X-Exchange-RoutingPolicyChecked: hasDbc/OISji9l9tb2qybzFnzuYZwVhenVEJEIjEvefjPhry8IsWTLH8VTuBdy1p6ZRK0ylb2PqqfWD+IFBZuHpWeKnQNI5f02LCyUWTd42e1E+lCNUxMy1fLDKNpx9OXlf6C/mv6KvHTjmgIcu2Ofl8BpnArRJkxj/ihZAfKUGMxM6HozbK4Kux6xz8p6/vYWTGBV87C8E8DaXJ47LSVEg+pIVYSuyKKZOsepEdN+qihL374xJkN+Wb4Zfc8UN0Qyfc2D7wIx20AlwrlVpF8VO6c42puBw0Z0HYmEZNO54cfgyE2CU0MSta+eHWkrfBOFMmHAMhAC0Dw94bji00cQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 73ecd604-4cb9-4fab-e417-08df074dd369
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 10:51:35.2176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7mqKKBJzuV8ekqAKC/t7gHTArW5Qfl3BLcp77MYbrQrTjXg29PM4FPSxOLYVDxPz7kmdgr8mUd3u7oTLVCEWCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN7PR11MB993112
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


On 31-08-2026 15:01, Michal Wajdeczko wrote:
>
> On 8/31/2026 10:05 AM, Arvind Yadav wrote:
>> Route the GuC submit engine reset failure through the structured SIGID
>> logging helper.
>>
>> Use the GUCSUBMIT component, which maps to XE_SIGID_GT_TDR, and pass -EIO
>> as the errno value.
>>
>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>> v5:
>>   - Added GUCSUBMIT component and mapped it to XE_SIGID_GT_TDR.
>>     (Michal)
>>   - Used GUCSUBMIT instead of GT for the GuC submit reset failure.
>>     (Michal)
>>   - Dropped "request" from the reset failure message.
>>     (Michal)
>>
>> v4:
>>   - Clarified that the GT component maps to XE_SIGID_GT_TDR and -EIO is
>>     only the errno value. (Sashiko)
>>
>> v3:
>>   - Split the GuC reset-request failure conversion into a separate patch.
>>     (Michal)
>>   - Dropped GuC job-timeout warning conversions to avoid changing warn-level
>>     logs into error-level SIGID reports. (Michal)
>>   - Kept only the existing error path that maps naturally to GT_TDR. (Michal)
>>
>> v2:
>>   - Rebased on the latest structured SIGID logging series.
>>   - Switched from the old xe_ras_log_() helpers to the new xe_log_()
>>     helpers.
>>   - Dropped paths already covered by the base SIGID series.
>>
>>   drivers/gpu/drm/xe/xe_guc_submit.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 99d8c807ff05..543cf7baae96 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -34,6 +34,7 @@
>>   #include "xe_guc_klv_helpers.h"
>>   #include "xe_guc_submit_types.h"
>>   #include "xe_hw_engine.h"
>> +#include "xe_log.h"
>>   #include "xe_lrc.h"
>>   #include "xe_macros.h"
>>   #include "xe_map.h"
>> @@ -3494,8 +3495,9 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
>>   	reason = msg[2];
>>   
>>   	/* Unexpected failure of a hardware feature, log an actual error */
>> -	xe_gt_err(gt, "GuC engine reset request failed on %d:%d because 0x%08X",
>> -		  guc_class, instance, reason);
>> +	xe_log_err(gt, GUCSUBMIT, -EIO,
> shouldn't we try to use different errno based on the 'reason' code?
> AFAICT there are just few reasons that GuC will use here


I used -EIO because this is a generic GuC engine reset failure, and the 
GuC reason is only reported as a raw firmware value.
I would prefer not to add errno mapping as part of this SIGID conversion 
patch. We can have separate patch for this.

>> +		   "engine reset failed on %d:%d because 0x%08X\n",
>> +		   guc_class, instance, reason);
> nit: as both guc_class and instance are u8, we should print them as:
>
> 		%u:%u
>
> nit: the reason could be printed with just:
>
> 		%#x


Noted, I will add this "engine reset failed on %u:%u, reason=%#x".


Thanks,
Arvind

>
>>   
>>   	xe_gt_reset_async(gt);
>>   
