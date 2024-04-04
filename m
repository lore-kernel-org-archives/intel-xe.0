Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28EC6CD128A
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 01:10:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836DC1128E3;
	Thu,  4 Apr 2024 01:10:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NmFQfNLs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5FD1128E3
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 01:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712193049; x=1743729049;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zbaM3XHPWcib0Vd+qapuCPTBBI0M1oQYBwwR+1fQbHM=;
 b=NmFQfNLsEBcCIEBY3IQQAn0//FnkbWCpznWKkZN3KZrFGIhI33KQwzHJ
 vT4Ps62IKiZqVvLsueZWAekvowZL6zpu/3cfBFLuVPDHNrZCpIN854YJ6
 JeooCJIZ91+fZaGMg2vkVGOjdoZh7fSTwUJHwwtKDoI+DH3rUBNNWhi3x
 V8inlsskLCF/vYWlaUNxFP85rEkxiEypKNoL9hdQtBou8WIsZLQZw6aPM
 jzspTxu43vq/yRCkS8OK5O2ltcaGlSP8F8cqipT02munM7H9ea9m1BfyQ
 w2uAsuafcKAsIgHkk+kiF73Rofk6uHXkdZac0PTdVCP8PvWwvTo9uY+TE w==;
X-CSE-ConnectionGUID: shE8/pD+TCydT4AQ0uqQbA==
X-CSE-MsgGUID: MtefNa/dTLuxdm26tWv6+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="8035115"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="8035115"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 18:10:48 -0700
X-CSE-ConnectionGUID: +Qij/quVQmO7mz/Ah5vUqg==
X-CSE-MsgGUID: P3JUF06bR1+09jvctrQUtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; d="scan'208";a="23375151"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 18:10:48 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 18:10:47 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 18:10:46 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 18:10:46 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 18:10:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GExL0NtQK+6qJrncPt2p3eIbTHHuwZ/gEUvn49rHNfp2i5B5v3eSiiuYsU0SOT65AU+iL92GJULYnWI4EzkzLqmcmB8lx5JqHQYnlzDvA7U+CXwoXKL0IeRpoWEetyNNeIftpUYy9Tfy6nEdy02A5mPsLULG5sPOB9WyOnqIWdqABrjVkj4cC+wb4+Ug9govmFQnN4T/s5OIsKO8yFv1w+Gi0CU1Ybv9kZf6fysgjA0J6JWbe+/O3HQMRuQyOl68L2O4RgaznXgaQ+PmCUj0SskYI4XQ1fZo9grhrilyvyYA4FaVqZBx/62x9QFTgNDAqE67nADhJIT5/scGKkFKLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9sZ6wRx6lREVUEgRbP02LUM47mXmVkBX0HbP/gXsMo=;
 b=UFsQy5FgsKPcuIIR2aIqz4zMl109HE6f3aGZnKUmjL7jdtRYDam7fhZpEkhyQQFTLIqiZBuLMCgSF6SZ1oXKRHbCHaUleWbqdW8JGGVjuMoXiIZQ5YtZq7RpEnQVCe6CNQjwJuV0H9h52nMMG/8V7b+Lt1Fqm5nfQvCRh7ZACH06Z3VcBtXSnGFLi6HS4bGDwOAskF36BnhoMabqyV0if2JrfOfmdyi4cHaisbEigGpPontTW/ttMrWkpKdB6TVMyvoNssMk6FkY8/YQPqc3F0bBVlZqSl6YIXrfJV08H1HVteJGAyt2LCCLT8wH4YSHWfa2Rfax345E/2S05Sl6/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DM6PR11MB4737.namprd11.prod.outlook.com (2603:10b6:5:2a2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Thu, 4 Apr
 2024 01:10:44 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7452.019; Thu, 4 Apr 2024
 01:10:44 +0000
Message-ID: <799f60c4-37ce-416b-9970-15863de78509@intel.com>
Date: Wed, 3 Apr 2024 18:10:33 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Update GuC ABI definitions
To: Lucas De Marchi <lucas.demarchi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240328183147.495-1-michal.wajdeczko@intel.com>
 <xxpank76lzfhakpmqa5srfqzq3fnpxlklttseyczfrajemvjzz@iqxhplnfmpcc>
 <92f47e87-a638-44c3-94a8-34f901a92eb5@intel.com>
 <fwbgnwpthgurnrnbofm3wmeviqh6laehk4ulf2e3hxinphnzyj@fdaweorbztji>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <fwbgnwpthgurnrnbofm3wmeviqh6laehk4ulf2e3hxinphnzyj@fdaweorbztji>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0202.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::27) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DM6PR11MB4737:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b1rMoWfSyvuxAuj9oWTikL06qZPTie+MK62MSGAUWzqfzy/tgdakPpDqqCWJPq+sciEem7FGyxI4tHTkdzFBqE/oXsz1D0/+Jn7ehtcjWVrdImFC90fpRMPx9MOYlqc9UflknITYpf/Btv8/Oftv70u2usI1g4Om7VzDOVYMK5ObgLiIx96grdcn1w+S5vMrTwMctCqoMOWRfplZCme7AG9PhsXnv3TrvULlWJGp/ntPy+fHmXEQK6oQN4b8Lxzem/tN8sKM7srkj9pawnIdmN36r0u2Zd99IGv8k/n0vffwd6hLMekJpXithNsmDcPx8THFAZP7i4B6wNM83jm+LzXgVNSJDU9H8zJ0EEtcgOwVLGKm4xgvYowuxmy3FUPQ1b6W84M6hfWPdE+gE4kR0TmIdolhg9A1qVzZeK+kF+7s+J5Qj7sKOazAmm4Kfq206pWTVt182gWm6cC8E4bkeL9HgQHBoC7XzOEre9cpo09f7dhjY86nNxl/RzS2qLIv0QakWfX6xwvlQhKBDmYKosVWQjxL1AwMOSh2aDVOaRk3mveHdV+CqFatxq9jKerXHglUATHAml7kagizTGpihX5rQsseeZJZoZZJp5A7y3HYAnoKvpiFktFgOP4zsNJb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVFGL0lSOU1RZDQrUlc3VXRlemtEQ2NqaXo0d0NlanZCSjBUWnVaYWlFTFRn?=
 =?utf-8?B?MmxUYWhFaTR4bzFNc09hM1RYdnFIcTF2RDNkVmtNQUJaUkRpcVV1M3owaGdV?=
 =?utf-8?B?dUI4c0pPUHZhM1J0WmJJcExzeDdKV1MrUjl1SVkra3ZLZnlyU1IzalBhWlNi?=
 =?utf-8?B?a29YTW0vTHNnOU9jR3pwc1pUbXBibjBibng0K1h3anZER21XeU85eGFkWjJk?=
 =?utf-8?B?VkkrVGppa1dCNVlyZUx2QlNvT1poMHpRaGlLa1IzV29neUx1TEVvSnQwOWhO?=
 =?utf-8?B?L3haMllhREU4NmorU2RVWnhKcmI3dmErSlRtK1BQTHZFRXUzZWtPWTA4WTdm?=
 =?utf-8?B?VzQwb2d4N2pOZEprVlpjWE5lMTkzaUlXcUIvL01iaDhtWjhvQm9VQTFFRDha?=
 =?utf-8?B?ZDBJcnE0RDJ3SHo0L0Vhajc0K1AveW9MR2hNVzcvS2phb0xSVm91blIwSDVk?=
 =?utf-8?B?Qk1WcFEra0x3Q0h2UjdOSkhmR3NzMTlGZXpqWERJaDdLS0d2V3BHajIyc2ts?=
 =?utf-8?B?V0RTOEtDTFNielRhdGVhQ1dnVDFoN1FiSGx4YVRwRHBTQmpBVkhLU2pqVDRj?=
 =?utf-8?B?alBPK0liS3YyY2l5TVZNSG5jS3BMUHNkUjg4R0RMOFkxZjBDMVBUWm81MjNH?=
 =?utf-8?B?YzArTTlSN013YzVMU3NINFRCZmlGU2dLVVQyNW8wNmJHOWVFZDdkODR1R2Ez?=
 =?utf-8?B?TjVjUFBhTldCZjlhRnNVYjBtRjY2aXErSjVCNFNCbzNSLzRTOFd1aDkxVldo?=
 =?utf-8?B?ZG0za29tSHU5YXpNaTBFdENuWWc4b0Zpa2RWMGFSdVdpa2R1dzFsR29LazEy?=
 =?utf-8?B?VlBnRTg3MkdlZWFLL09TUFBTSEkzWitDUjIzMzc2MDdhRVpnb24xR1lWckFJ?=
 =?utf-8?B?L1pwcFdQNDNQbDdSUHp2LzltQy9KNHFsTkh5RGQwazFnUmVNb1laekxVd2Z1?=
 =?utf-8?B?YUNwQUhuV0s3VkNFOUh4OUIyeFhxcDFmR2dFWHVKWGZSdnBQdjQyV2wramRD?=
 =?utf-8?B?bzhKaUF5SUVMeUU5NzQvSE1sQ1dLakljd1YzSlU5WC92RWtmMTVxVU9JTWlE?=
 =?utf-8?B?T3F4dTQ0OUFYYVNjNmVQNGFKREtzajFZRTV2R2hrM1pDZmdyOWZUYlIzT2tM?=
 =?utf-8?B?VDU3VXhuMjM4NUplUkp3anRZKzYrNnVLZjhXWURYZENVamp2R0ZmRWYzdkdm?=
 =?utf-8?B?V2pScjNqRWhMbVI4MHU3VHI1bWpGU2J4QnZZWEhxTEEybGp5VmF1dStNelVV?=
 =?utf-8?B?eFBGVlBJNEEvdXhPa1ZranBtcWVLYVNjM1RIV1luSWFZM01ZYVBIdlF4a1FJ?=
 =?utf-8?B?R05NMm9lUFB5NnJPMlREOTJYWkhhT091Z0toMTNrU2xTVlFCc2loNDZHZ2I3?=
 =?utf-8?B?ZW5BYzh2OXBQZ3U4Y0xWRzZXR3M0Tkd4Ti9RZWV5clBrckJVcTZKajdQcDNm?=
 =?utf-8?B?Q0dZR2p2b3BmN1paUVlGY1VPMXNXWEtmY0RjSkZQbDA1YUloQm1mRTMwK3dR?=
 =?utf-8?B?L1FPS3Y0YXRVaEFuRm56ZnRYWkQzZHlocS9YNWtUZis2blRsU1hYOHNLN3pL?=
 =?utf-8?B?K085clNvZFlLTXM1S2N6elFlWk5kOUkwSHF2Z2IwczhwTGUxaXVpaHkrOFRx?=
 =?utf-8?B?UHdWS25ZQVZCT1dpTlpqNi9Gby9ENDg3Y3BTWjZoRUo5eUlvZHBpZVJJUnlT?=
 =?utf-8?B?cy8yeHhsUTJISVhJSmtwQjh2RzJPbFZSblVhNFpzbExDWUR6ZlQ1MWVKaFBB?=
 =?utf-8?B?VDN3QWNNN0NqeWZmMjdvdTRnN1pqQnUzUjkzc3B4RllYNGdCaS9vTGRreTNz?=
 =?utf-8?B?cDBiZE54VnRranFYTFFPcExHR2xWR0w3alQxMmtHUVVhVEtsQlJPbVdvSUxC?=
 =?utf-8?B?My85clQ3djhZKzJ1SDJJNmpYY0dzN2FKRThPeFA1cHRRMjQ0Q0NWc203YUVj?=
 =?utf-8?B?VGtIWG5yOHRKcHBLaWsvN29kK2x5NE5hODhYZVEwdG9DL2k0WE1pbFNKdklr?=
 =?utf-8?B?SE8ybis4bmVveUpQOStRSDZ1YmhJbFdNN2pSQW01LzZ1TmxXaDNjYmpBWVpq?=
 =?utf-8?B?Vk45WHZRV1Z2QjZDOVQvYnVreGZKeDF1QTVaOTcxNFV6TlYvV2tlZ3phZkdK?=
 =?utf-8?B?bjU2cjROV1V4bTRQT3IwS24rMkdIdW0rTlpaNlBwN2UrcHNuNSs5a3BtaDdT?=
 =?utf-8?B?MEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a45e192-a169-4c84-6daf-08dc54440dad
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 01:10:44.5321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l7DgHEaEFzxaptCmCG5RBSg7F5+sgCoOiCGDfLJRKsAzoFWGtJZAxlApZL7EcQ3GtmzRD3PraHdBz2J7izdge5/VurJ8msZar1PDHK/P1mE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4737
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

On 4/1/2024 05:54, Lucas De Marchi wrote:
> On Fri, Mar 29, 2024 at 05:50:32PM +0100, Michal Wajdeczko wrote:
>> On 29.03.2024 17:14, Lucas De Marchi wrote:
>>> On Thu, Mar 28, 2024 at 07:31:40PM +0100, Michal Wajdeczko wrote:
>>>> In upcoming patches we will use additional messages in communication
>>>> with the GuC firmware. Add necessary definitions to our ABI header.
>>>
>>> but it would be better if these additions were done when they are
>>> needed. We don't want to keep updating this with things that may not be
>>> needed at all (plans always change, ABI may change to fix bugs, etc)
>>
>> fully understand that, but...
>>
>> this ABI definitions reflects what current firmware already supports
>> and it is just complementary to what was already pushed in initial
>> driver drop without supporting code:
>> - [1] GuC VGT Policy KLVs
>> - [2] GuC VF Configuration KLVs
>>
>> [1]
>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/xe/abi/guc_klvs_abi.h#L114 
>>
>>
>> [2]
>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/xe/abi/guc_klvs_abi.h#L154 
>>
>>
>> it will also help me lower my pile of pending patches, so maybe there is
>> a chance for a small exception ?
>
> I don't see how it really helps with reviewing your pending changes.
> IMO it will make it harder. When you need these defines, just squash
> them in the commit you are making use of them.
>
> I'm looking at this the same way we handle new registers... we don't
> just dump all the registers the hw knows about into regs/*.h
>
> Lucas De Marchi
We also don't copy the entire bspec definition of a register or MI_ 
instruction into the header file.

John.

