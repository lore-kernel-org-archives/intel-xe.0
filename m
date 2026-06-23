Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F4BCDB470
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jun 2026 17:51:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D3110EC66;
	Tue, 23 Jun 2026 17:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="etQRRnmo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A7410EC47
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jun 2026 17:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782237068; x=1813773068;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ykeQR0h1cmCyxo8eE/Y11ppD6vgnlzEY0AJGlMOFpVQ=;
 b=etQRRnmoOxy1gGdIbdRqxjdNgjtM/6Oos+9Va9dHQo+rdqrceRCeInYg
 vyK9Xu3WF86CQxnGgFDvFeTJXZyGWSKYGoZuFLs36qiXhh4ME0XbdiAy7
 sqmCCJcBKLhe1NKh5BS6JdB9kIRLh7FjhRn63Jh82d2LbG1iXIURw3WvG
 /FkW0xqoshHuLlPiSFfQSAxgQQSPk/mPhot1TdTaJQUjQGwujmKtSibSC
 shtY55UTGVO914BLshg1TCrzf7z3M7JAc0hYnGAKzRCqgh8K/FF8UoDEN
 YjUwqNMCmklppqpeWCjuHKCyTcJ3HExKl7Sh2IeETiXH0tWxesWuMWNMM A==;
X-CSE-ConnectionGUID: fv77QbWFTlKf/RxA+9gcVw==
X-CSE-MsgGUID: aTqRJXRARgGriJP3VPkjzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="82990793"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="82990793"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 10:51:01 -0700
X-CSE-ConnectionGUID: K27+vMbrQm6/xE63awtnFA==
X-CSE-MsgGUID: 354WxcLZS7WlUzsbELd7QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="246661018"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 10:50:59 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 23 Jun 2026 10:50:58 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 23 Jun 2026 10:50:58 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.13) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 23 Jun 2026 10:50:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VOSPdvwq/byGz9NoEUUMWOPWwJm0W89kPAz7wndcPwx9BJa/+oXNdMgfSl3ES56rhJix9zhlBJXTOasDedct0lrqr7H74XT4O+sYQ/PwxodabTalXk6CCAzg9u83KoZQrV3XVtilmrB6pJ0TBpgqAYUASAyZls5/b3LnnN263RaLgfCSN72P3daF4gyy/+++Rv4C9DVq3Rv4TGdChaz8AlFYKnjX2TD2hLzHaGo4Vfc9vnyknYtcExaSedCG9zXTutzXw3WvkiZ8OHOD+nLdWNu/Zk99OZU0+P+o/rkYNBlUzd4Qja9l/adeUP3W1dfkqDUHN2IQAGokxk+B40P0Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FrzIgtRU3zZggzLa3nLH8HOaVgqT48ckLzxALKPkjZ0=;
 b=Vdi9RMXRI2rbgOaUWjuHkbyNS/GtzzLU0iO9YQA6N5zVpEjUmUV5gDnPbPMZjoB1xpzHGzZPeiiD4U5qTMHPXDbxp9ukz+Llv1oTWfnUv1InOHyRWSeJNQjpT2kE1LHoX2BRtyiHMQ8UTfPJ7DU4SRWxfqfYZSr2/7cgsru+AkKfMr5PHr9URBVuAVNVcdZJB+2Ze17kfzjVQ5DmMLRpcJAFn+3h09pER5Iap1GFh2Res4HgLvQ5TKY7rhtjMbSprtXiMZ+vbbfvS1WIWWmpTN1xX19DImeTbC72YJRt1ErIC/T4cV4RM72E4bolrwc9FemX9EiTmZPtmsDo+oWAbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Tue, 23 Jun
 2026 17:50:56 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%2]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 17:50:56 +0000
Message-ID: <172ca7a0-4860-4aa3-b0c2-9afb788d6613@intel.com>
Date: Tue, 23 Jun 2026 10:50:56 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/10] drm/xe/vf: wire up NUM_PAGING_ENGINE_INSTANCES
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20260611161634.506476-12-matthew.auld@intel.com>
 <20260611161634.506476-20-matthew.auld@intel.com>
 <b67be657-cfd7-4dbb-ac4d-734ef6214b6f@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <b67be657-cfd7-4dbb-ac4d-734ef6214b6f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::12) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|CY8PR11MB7777:EE_
X-MS-Office365-Filtering-Correlation-Id: a486200d-cb91-44c0-ec85-08ded14ff9ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|56012099006|11063799006|6133799003|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: 0yzj7eP430WGZ9pD5K8bWilCbAb9VCFxUioJKgFI3VkXIjz+AwVsWWWFep5/Nc8ybJOcJcWADJIsFX2hZbt4abKNT63EhpRKPHp/NjYmo2e4no8aSd1FV+Vru/PpBpnSdB9HvCjmNVcVLVo3Df+qiGH5Dgtr/nFD8jnMK841tMh14RbwgbvwpQ4z1nUh0+FoGYtF2c7wap9SyJfKzT1T7bEQ0knbVXycD8zMZqbkzVRCP4nhkyWqtXQv9cYaIJ24zkqaNUQIiVugGV5rpliFEEEUsWcRyd5P9ggx980E/Exj/pQ4zyBALx2UlCCwBkoeKDp+kDpp54CJ2Y9Vhh3f910w1yAbQyzE0+CF/nawCktZBIXqu9JM2qc+BKJYQt3Nzw9rqiKZytHcw9p7q08MO79d2eNqdQ0fGTxkyqMuybdmprfVZzd8O7ciTKzBKMtyZ4jULQ1bgHnLnP1d8t05OWtl7u9ElhIsgb4B1gA8V0J4fDM7z6KXfilEv4UNRod/GrprW2LlvFUG8OtOAgl2qu9edpwNzBYwSQ6kH92WLLBQQ6Rz1eaFdTFkH4IRQinuYeSrOqBt/nZhGL9U+Rjgql7CWIQSPu6rCH2040XEHt5iYlCPtjO3FUYeK4+bE0m3/nAymzmYotRhzQgg9Oe5vgW2+os+Lg3+YAjkMNtqyB0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RldUMVlUNWtjdEhkcWxpa3daazdoMGMySUVLZmMwbGNMSEFnUkhGNXVKQTky?=
 =?utf-8?B?N3Boc2NBM2ZROUxoRzF5QzRhNjVLaDVWMmE5Y1ZVbUdCR1BJdlhuUTFFNUFr?=
 =?utf-8?B?Yi9GVHNUV2FXdXFYbHRDUjdTRDV4emRnUE8wTEtpZVNzZmx4K2ZKTW0xRzJL?=
 =?utf-8?B?bUdsY0JxajlZeFh4bDd6b0doeW5WTUduK3hyTFJjRGtPQ0s2aDFvQ2hiMXh5?=
 =?utf-8?B?WEpwN0VoYndvOXE2VUVvOFhrTWtieE1ZOW84YW0zKzJYUkJ4d2FjRCs2dDN4?=
 =?utf-8?B?eHdMSDllTFhSdEVrcm5BbzlONmZCTmZ6bUFCZVZSWjh5cjJ3QSt2YVMyNE53?=
 =?utf-8?B?UjhDSkpsZkVpZjZwQW43VnZ3YzFMdVh6bWt2Z0RqOFR2WUlMT1ZCVkRsdnpz?=
 =?utf-8?B?WTB5UVBvUTFITFdiR0RGQkxMOU43ZEgvaG5QN096QjAvZ3YvWFpEQ1ZJUjBo?=
 =?utf-8?B?alNNRzZ4a3o4SzNrdFdzQVJoT1lNb1h2MDhRVkVQVGoxSTVDSHZRMGZoT3Zm?=
 =?utf-8?B?bkthTEVzYmlVemtwMHdXU1VIYkhLTzVuWTdnMXBMVDVDYjh5Rmk1SVM2dDFB?=
 =?utf-8?B?aGh3MlVHMUtPbkRPZFRTNGdDSUllS3Npd0JqV1F3Q3NIMEwycWc1eFlDUjJJ?=
 =?utf-8?B?S1kvcjUvTjNuNlJ0dmZkODl0SUE1VWlONXBHOVhJUkJ1UUJJOGg4K3A1NCtE?=
 =?utf-8?B?MCt3aFg1MVVyc0Z2dGFuMDFUb0tHck5kVmplT2pkaFdQc29MZzEvZjNmL2dF?=
 =?utf-8?B?dEZCN1V3WjNSNUgyYWNUQzVCdlhLZVhUMFpYZXBXTjR0N1dwZ0djc2U0Kzlt?=
 =?utf-8?B?RmNPRVpoaFl1ZDQ0N2xPODdrY1V0TGZWQWtuZWFsa0FSTUh0bzVDWDArc1Vj?=
 =?utf-8?B?TmZhUm9FS3hpOUo2NHhYWU1VNXJMRkxjY01mNTFkQjlZUXhFYklGRjlLR3A5?=
 =?utf-8?B?Ym5Lb3NvVjM3NmZ5c1pnODlKZ1NQUEtYTHNEMG8reWJWalhiK3FCcStzTFE1?=
 =?utf-8?B?UDk4NEZwYnhya3YyelB3SVhDQUtNYlBibm53YVJHcmxmcmdzY0dvZ2t1bFly?=
 =?utf-8?B?NzBhQ2RDWWRCUVdBNkR5YTZ0akVwbGNCaEdmNlgzSWxqSUxhRnBsZEFIeHZV?=
 =?utf-8?B?V3o0L3pmWTNSQ2xoQm41azZha1o0TmdCVElTR1dxTXpaOVkwNlZud2l1UC8z?=
 =?utf-8?B?U1E4QmFkRkdEVlI1NnlLcmhiT1liUjNDeXE3SjBidk9MdGpOSDdRcC9TQnM3?=
 =?utf-8?B?ZVVhdWg2QU94eVZRdlN4OUtiSFJma051ZXV0MC9oejdzZ1FKVEpyZWhBWGVK?=
 =?utf-8?B?MWk2MDB2TmdER1lTVFBidDJ1RDYzZDZLdVF5a0R0em13V0xGUlpzcTc2MWZI?=
 =?utf-8?B?OGhCem5YcU9sTnYvUk1GNFlUZkFTcGkwbEpqR1hoU3ZzRENWb1RyUjNtM1E1?=
 =?utf-8?B?b3ZDWSttMjJVRGRaNUdnWTZPTXVwTFNmUTFXNUF0NC96VENvVVpJRUZaS0Fw?=
 =?utf-8?B?WXhiYWpuOS9pSGZYa1NISy9wUzJGMUhNYUswUVdYVmJ4VVE1Q1YvNi9nc2Jn?=
 =?utf-8?B?WFRKL3VaV1I5cVJWY3pNU2psTzFlRUFtM2tPTVpDWVg0YUI3dWNDQ3psUlJG?=
 =?utf-8?B?emNjaFZ1TFdzQkRxeUp4OTNSZkVaaTVQcStLK0VDamZVaVo5RlV6VEtKWEZU?=
 =?utf-8?B?REVjR2xYTGVKN0c2TER6aXhEOVRPbnVjU1g1c0x1NE9lZkVZTmgxNjB0QmFt?=
 =?utf-8?B?KzBuM2hVSVJyU1J5bmJxazZXL0JZdHZwekJmbjJDNzZYNjlVTFlLcXd6MnRm?=
 =?utf-8?B?WVhVR1N0VEE0WHFxMWEybkROTjlpK3BnQnpCOWpQWngrdFFsazJvbVFMSXlL?=
 =?utf-8?B?T0xKMUQwTHBLVGxGZitqR3VnblltRDU5UGhvRzgwYTRWVjJiRlBjcVgzaWRh?=
 =?utf-8?B?TUZQZ3pJMWtXOEppeEQ0OFFLNG1JR0VuZjNvZkpZMmVVenlid1ZmbVJhSkRa?=
 =?utf-8?B?aC84V3Z5eVM5Y0ZTNFRCMEhxQStrMGlaRVhhK3NMaHNBVTFPQXlLS0EwNnJ1?=
 =?utf-8?B?Q2JxVHhrcnBRWjBQZW92bWYxWTBxZzAwT0JuUWpoSXNJazd1eFlycWN3MW5H?=
 =?utf-8?B?MzZndFlYbTJaSnltOG13L3VhU2Z2RjhTVk40Ty83Z2ZqVitLTFkyVEMwdTdU?=
 =?utf-8?B?RUJvRnBzMmkvdTl6ODVmRFo4bFpianVXZSt1R0hsQzE3Q2Z1MlVxbE82VTN0?=
 =?utf-8?B?Y1UvREZ6RWNTallUT3lvQWMzZUhLNEIzbHcyZkQwMlBydkNad1QxVlU0Ykha?=
 =?utf-8?B?VzlSL3BzTTJ4eW1zWHZVby91cWZKWUQ5VFEyR1FrelU0Zkl4eGdObytQcnZF?=
 =?utf-8?Q?tDogbznDQKL+7dDY=3D?=
X-Exchange-RoutingPolicyChecked: X1dFGTAPCZ/MBXjn8baJxBVur8PFZUNq7SXCBJlpC6AvA+oiw/eGgT2dZj+SEGdg+YNUXDn0UE3Ok0DWyJwIdoIMCQFwlFUt1uJASB47LScXUiOnvw2qYPMFH7u5GIG6Xu4uJsIKhvxR0HF5TnVV6iU1MwYB8QqHjIk/D0BKcku11qLzCBS+PgyVTUJ3R6OQ3d/0Lb82JWt3g65pUSWDGyIF+HTwSa9OYjvkAGz2akrwaJuEArbjnBr4aSSYOH3IhbSRpP7qNcDrqNS0LMzzRqbHtqLGiIN+4r2nuLrqOuPtDStRz/za+k3cwa0gsUDCwH1EBKlcDG/Up8B8XEegRg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a486200d-cb91-44c0-ec85-08ded14ff9ae
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 17:50:55.6330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1sOw6UxlmzR+arEKLpOs3p1WQ2hBcRVwx7vqAE8lnHGVD0+o7GhFZi7m9tggGru9AwgZsTmvv2HREeEwRNaDnUSJRu2hvZLZ4Aj5ipRWI4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7777
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



On 6/23/2026 9:28 AM, Michal Wajdeczko wrote:
>
> On 6/11/2026 6:16 PM, Matthew Auld wrote:
>> When host PF writes the logical configuration for the GUC PAGING engine,
>> the VF is meant to query it, and mirror it. Size of N means we have
>> paging logical index range [0, N-1], with N fewer normal copy engines.
>>
>> Agreement is that PF will only spawn PAGING engines on NVL-S+, so this
>> should be zero on older platforms, where we should simply fall back to
>> the old behaviour.
>>
>> v2 (Sashiko):
>>    - We can't call use the guc_has_paging_engine() this early in the VF
>>      code. With that just unconditionally do the query, if the GuC is new
>>      enough and take the value as-is. With that drop the -1 special case and
>>      just let the upper layers figure out the rest.
>> v3:
>>    - Also update xe_guc_klv_key_to_string. (Michal)
>>    - Add kernel-doc for xe_gt_sriov_vf_paging_engines(), plus other
>>      tweaks. (Michal)
>>    - Update with final GuC version.
>> v4:
>>    - Just fallback to manual reserve when vf reported paging engines is
>>      zero. Will revisit in the future.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h     |  9 +++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 47 +++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  1 +
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  4 ++
>>   drivers/gpu/drm/xe/xe_guc_klv_helpers.c   |  2 +
>>   drivers/gpu/drm/xe/xe_hw_engine.c         | 30 ++++++++++++++-
>>   6 files changed, 91 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> index 644f5a4226d7..753c049d2fc8 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> @@ -52,6 +52,12 @@
>>    * _`GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE` : 0x3001
>>    *      Tells the driver whether scheduler groups are enabled or not.
>>    *      Requires GuC ABI 1.26+
>> + *
>> + * _`GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES` : 0x3003
>> + *      Tells the driver the paging engine configuration.
>> + *      Paging engine logical instances are guaranteed to be dense starting at
>> + *      index 0.
>> + *      Requires GuC ABI 1.36+
>>    */
>>   
>>   #define GUC_KLV_GLOBAL_CFG_GMD_ID_KEY			0x3000u
>> @@ -60,6 +66,9 @@
>>   #define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY	0x3001u
>>   #define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_LEN	1u
>>   
>> +#define GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_KEY	0x3003u
>> +#define GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_LEN	1u
>> +
>>   /**
>>    * DOC: GuC Self Config KLVs
>>    *
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> index 0cd9d77f3351..0a11e63f470b 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> @@ -658,6 +658,33 @@ static int vf_cache_sched_groups_status(struct xe_gt *gt)
>>   	return 0;
>>   }
>>   
>> +static int vf_cache_num_paging_engines(struct xe_gt *gt)
>> +{
>> +	struct xe_guc *guc = &gt->uc.guc;
>> +	struct xe_uc_fw_version guc_version;
>> +	u32 value = 0;
>> +	int err;
>> +
>> +	xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
>> +
>> +	if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 36, 0))
>> +		return 0;
>> +
>> +	err = guc_action_query_single_klv32(guc, GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_KEY,
>> +					    &value);
>> +	if (unlikely(err)) {
>> +		xe_gt_sriov_err(gt,
>> +				"Failed to obtain the number of paging instances (%pe)\n",
>> +				ERR_PTR(err));
>> +		return err;
>> +	}
>> +
>> +	gt->sriov.vf.runtime.num_paging_engine_instances = value;
>> +
>> +	xe_gt_sriov_dbg(gt, "num_paging_engines %u\n", value);
>> +	return err;
> 	return 0;
>
>> +}
>> +
>>   /**
>>    * xe_gt_sriov_vf_query_config - Query SR-IOV config data over MMIO.
>>    * @gt: the &xe_gt
>> @@ -694,6 +721,10 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
>>   	if (has_gmdid(xe))
>>   		vf_cache_gmdid(gt);
>>   
>> +	err = vf_cache_num_paging_engines(gt);
>> +	if (unlikely(err))
>> +		return err;
>> +
>>   	return 0;
>>   }
>>   
>> @@ -731,6 +762,22 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
>>   	return gt->sriov.vf.self_config.num_ctxs;
>>   }
>>   
>> +/**
>> + * xe_gt_sriov_vf_paging_engines - Query the number of paging engine instances
> nit: we don't do any query here
>> + * @gt: the &xe_gt
>> + *
>> + * This function is for VF use only.
>> + *
>> + * Return: number of GuC paging engine instances configured by the PF.
>> + */
>> +u32 xe_gt_sriov_vf_paging_engines(struct xe_gt *gt)
>> +{
>> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>> +	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>> +
>> +	return gt->sriov.vf.runtime.num_paging_engine_instances;
>> +}
>> +
>>   static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
>>   {
>>   	u32 request[VF2PF_HANDSHAKE_REQUEST_MSG_LEN] = {
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> index 79878f21b1da..d171a8242a34 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> @@ -31,6 +31,7 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>>   u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>>   u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
>>   bool xe_gt_sriov_vf_sched_groups_enabled(struct xe_gt *gt);
>> +u32 xe_gt_sriov_vf_paging_engines(struct xe_gt *gt);
>>   
>>   u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
>>   void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> index 80562ffadb16..21cb9bc1a341 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> @@ -40,6 +40,10 @@ struct xe_gt_sriov_vf_runtime {
>>   		/** @regs.value: register value. */
>>   		u32 value;
>>   	} *regs;
>> +	/**
>> +	 * @num_paging_engine_instances: number of configured paging engines.
>> +	 */
>> +	u32 num_paging_engine_instances;
> nit: can we move this up near .uses_sched_groups
>
>>   };
>>   
>>   /**
>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>> index 97600edda837..be992b8da9a1 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>> @@ -24,6 +24,8 @@ const char *xe_guc_klv_key_to_string(u16 key)
>>   	/* GuC Global Config KLVs */
>>   	case GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY:
>>   		return "group_scheduling_available";
>> +	case GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_KEY:
>> +		return "num_paging_engine_instances";
>>   	/* VGT POLICY keys */
>>   	case GUC_KLV_VGT_POLICY_SCHED_IF_IDLE_KEY:
>>   		return "sched_if_idle";
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>> index 4d7cb8b54b4b..1227b9e66fd6 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -650,7 +650,7 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>>   	return err;
>>   }
>>   
>> -static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
>> +static int hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
>>   {
>>   	struct xe_device *xe = gt_to_xe(gt);
>>   	unsigned int num_copy_engines = 0, num_paging_engines = 0;
>> @@ -667,6 +667,27 @@ static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
>>   	if (num_copy_engines && xe->info.has_usm)
>>   		num_paging_engines = 1;
>>   
>> +	if (IS_SRIOV_VF(xe)) {
> maybe:
>
> 	if (IS_SRIOV_VF(xe) && xe->info.platform >= XE_NOVALAKE_S) {
> or
> 	if (IS_SRIOV_VF(xe) && xe_uses_paging_class(xe)) {
>
>> +		u32 vf_num_paging_engines;
>> +
>> +		/*
>> +		 * PF could in theory reserve multiple paging engines, which
>> +		 * internally the submission/scheduling backend can load balance
>> +		 * from. Not something we currently expect, but we are at the
>> +		 * mercy of the PF, so we just need try our best to mirror the
>> +		 * paging configuration.
>> +		 */
>> +		vf_num_paging_engines = xe_gt_sriov_vf_paging_engines(gt);
>> +		if (vf_num_paging_engines) {
>> +			/* This should only be non-zero on NVL-S+ */
>> +			xe_gt_assert(gt, xe->info.platform >= XE_NOVALAKE_S);
>> +			num_paging_engines = vf_num_paging_engines;
>> +		}
> hmm, so what should we do if vf_num_paging_engines is actually 0 on NVL-S+?
>
> can it be due to GuC FW being older that 1.36 on NVL-S+?
> can PF skip programming paging class on NVL-S+?

PF can indeed skip programming the paging class and that is a valid 
(although currently unexpected) scenario.

>
> maybe 0 on NVL-S+ is a good reason to abort the probe?

The expectation from the GuC side is that if PF has reserved a paging 
engine then VF must match it, but if PF hasn't reserved a paging engine 
then VF is free to reserve a BCS to do paging.

>
>> +	}
>> +
>> +	if (xe_gt_WARN_ON(gt, num_paging_engines > num_copy_engines))
>> +		return -EINVAL;
>> +
>>   	reserved_logical_bcs_start = num_copy_engines - num_paging_engines;
>>   
>>   	/* FIXME: Doing a simple logical mapping that works for most hardware */
>> @@ -688,6 +709,8 @@ static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
>>   			}
>>   		}
>>   	}
>> +
>> +	return 0;
>>   }
>>   
>>   static void read_media_fuses(struct xe_gt *gt)
>> @@ -906,7 +929,10 @@ int xe_hw_engines_init(struct xe_gt *gt)
>>   			return err;
>>   	}
>>   
>> -	hw_engine_setup_logical_and_paging_mapping(gt);
>> +	err = hw_engine_setup_logical_and_paging_mapping(gt);
>> +	if (err)
>> +		return err;
>> +
>>   	err = xe_hw_engine_setup_groups(gt);
>>   	if (err)
>>   		return err;

