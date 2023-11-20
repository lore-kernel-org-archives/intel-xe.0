Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552D3C072A2
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 03:33:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC8610E1CD;
	Mon, 20 Nov 2023 03:33:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26FF510E1CD
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 03:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700451210; x=1731987210;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=R1kdrY2+QSXdK5FdpEwpdp6ke6VK1Ynl7ZNAunbd39Q=;
 b=MZ/t3MU7YsnnXgpRwVUgHC26PUPDa6shtj5nHqo/X5W+ql67QAq8ou3y
 ZPltHQeuNB90V4oVr6eZBgXmXaqxfCUk2yoA3VdA3+LE3tMUvzNJkaXxH
 f3OddfjnvgzOYFZ7lGeckEqlI1neYukJ2K2s1HwtewoqoLglHOhP5KrvR
 2WD3qc3WZMWeG2fkk8anGDHkQkIPC6OiJJ+GLCpXgsuG+8edF3b7m7nUv
 ok1olX+J8RiWdn04cAWZyHS5Q/yLOftoYQHHzW1opLUPZJnrvi7G7IpmZ
 SKRRZ0x8uYbd43XMrmmXHLf61mGx6cxoqPDcSqiqzD+vUOXIfeKi1/izG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="458043337"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; d="scan'208";a="458043337"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2023 19:33:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="856871341"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; d="scan'208";a="856871341"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Nov 2023 19:33:27 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 19 Nov 2023 19:33:27 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 19 Nov 2023 19:33:27 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 19 Nov 2023 19:33:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TlF2Uj0G5Erfzw0/Mqi+GkKXbbLB2dxZFLmTND3m+o2dHtQKs4B4sWfzkRs6X79jOxmqXg57rx9w5hbrmIMRjMqWHbqyNiSFIJNc159ILkyEMygXNHh6ILYLhsvfZd31CDiOplQ6vFoU31qPpR3HMCzLdnfkxZPaQSDpBWXIzO7w3earWQLDN1V2V+nKD+/XZKM+qehjR3uPo8SijSW7vn0N8u/lKczYzNZKuPRBQ37q3xqFFYJb8tN6Bg30xewOGfgPahLG93puVAlyV5ejmyyDJ+W7uBvWtgbv/7/dY9oLlYC1GWfo9RlD0uV0LjCovUqcx+1t0LILclb8kXXv/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YpgZbzmaPtVVFYiTV2QlWmVGqiPUzxaEJy4+j7qUG4Y=;
 b=adc3yxek772brNkwFN+qa0XEwsZVtObfslGuqSDXx3HQgk/PVKfTsBjvGy8z49ITth2k9Xk6qtn0Av/zYA/v72HgQlZ3pvDlW9URPiTUTwZlql+koYvg4TjgqqaYSkPi4LpuX6G/lHa4WHeEBKp9Et+pqZmcepLwlkuQTScAh156TX1HZ6fr901SgyobyK7CKiQlcDyUrZMOJVEMeefZc/tfNcq1CYBOL5hsfPsZX9CasPk+42lxSlFIIzxCXmzO6wtpX8ioWK7hePswUdNjNPeOnRxyzbWf7HEdd1+eTsleCHj4cnc6OPSYU6J11esMrX1wCVTwvjGp6XEWurZBjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 MW6PR11MB8440.namprd11.prod.outlook.com (2603:10b6:303:242::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26; Mon, 20 Nov
 2023 03:33:24 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52%4]) with mapi id 15.20.7002.018; Mon, 20 Nov 2023
 03:33:24 +0000
Message-ID: <87cd6ae0-e6ee-439a-b536-7b9fc302f473@intel.com>
Date: Mon, 20 Nov 2023 09:03:21 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20231116143043.908412-1-sujaritha.sundaresan@intel.com>
 <20231116143043.908412-4-sujaritha.sundaresan@intel.com>
 <ZVfeEJmfg6NST0LX@intel.com>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <ZVfeEJmfg6NST0LX@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR01CA0150.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::20) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|MW6PR11MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: 72d6fb8d-d8c8-4fcd-e380-08dbe97973b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DJTOFTMHrVfILxboGRmVb6yBQASyLs/ZgXiBJk0Yd/Pb2APz093+8QQHpl0OUGL3CZ/GqPFJOCtml+FLEEQIubAWaBlb8IoDtU6iU9/9lGdN/Gad13Pfg/dNlbdeZMuoaxsyZG7eKbxvXEcxoOOafYdoFHcMLiRw+/VGY/7ePIr5oAjGH2Cw09od0U7VGauTpY6b3XGvuNgLaCVwOXuytA1G5pU4YLLg3TxP8J126MMgxESyFrn1UTULYQ8NVyUGaKAI54z93Y3GCzAuH7Q6yZ9moqsmZK23neBhxN/qOMsxJrIvZ7ODy/ZLwBF2jIL4zkNdn8x51hDX2YpwJpsggvwlbY7F2lKBNFLB54PLssxto1GWumKzsFLMQFCm+bq9YVyRh3bon9UJmMP90+7kdA372Hzx1dLhiWfHkB37GSVnMEARa7zDnATYMP7I0Zz2Lb2QvbcXZ5UIx+LFJ6WlHgnY4qgTdc0JhJivqaLc69WVVDwHZ1liROreb9XNnGJ/Y2X5ONCcHC/+zyxbgsinofM5NDPSAEUUmbtEjKjd/VuNDwtMhkSlw6lO6laVwjk+cj9x5sl84ROrwphyt6ELDnUd59V5NXLdNo8JvS7ni5/H6T/Ei/pLFS9be2nywG/JvMnRAFTOL+BeyqzqNxdU/DsjBirgckalhnspyZO49h0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(396003)(39860400002)(366004)(136003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(31686004)(6506007)(6512007)(53546011)(26005)(66946007)(66556008)(316002)(6636002)(37006003)(4326008)(6862004)(8676002)(8936002)(66476007)(6486002)(83380400001)(478600001)(2616005)(82960400001)(107886003)(38100700002)(6666004)(5660300002)(30864003)(31696002)(2906002)(86362001)(36756003)(41300700001)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFl2Q0Z0ZGQ1N0ZoR3RZNlpKTSs4WldLVVdFNGgrMkZNSHRYcjNySjVibTJa?=
 =?utf-8?B?ckhkZ29ORCsraVppUWhFWGwwVGNIeUx1Ry9PQXBBQm92clJCYjhLMnhacDJY?=
 =?utf-8?B?Y2diekpwbXE2Z3ZWSEsxRVgwYWw0NExFcVp2R2RFamEwREhmY0g5UUxXQXBQ?=
 =?utf-8?B?eEJCUkptVXRVdEQ0M0xGbTRDck9Fa3FSZG5YSEJYTUQzWXlQanZwdjNKdFd6?=
 =?utf-8?B?Z2lUTTg4WnBvdjhobGVJZEFlRWZEamQ4MWFROVgwOFl4ZUJnVWlTR01uU0g3?=
 =?utf-8?B?dnFiWTN0MWdPcSszZ1RhNGlpL3RGejBiaDhyakVqY05jckxYVjhWQ2JQeHRY?=
 =?utf-8?B?UFpzdVZnbFJNQWVTSUVaOHFHZGlDRUd4MXRNR283R0RQOEF2YVo5T0Erc3Aw?=
 =?utf-8?B?MDFuQmdGMmN3RnVjTGFMSDc4TEV4bDRQa092eG1sUVBZa2JGVnpCRm13b2Jh?=
 =?utf-8?B?Z01DbGRXb3hOTFMwUXA4SHdVOGdUS3Nud0k1NE9qWTRIYVpwQTBpSDFQTFYr?=
 =?utf-8?B?dXZZTXgvWk1nMC91UnlXQ3dES081VGNROUkzbkV6UlgydVF4YXcvSyt5TWRI?=
 =?utf-8?B?YVdGektBemMxb2tiQStpbHFSY05NQWQ2VmhnYUx6cEJBNjV3QUl1UHEvSWRG?=
 =?utf-8?B?YnhTczlKTUI2YVZBRjB0MDY2MDZsdW93dEErSzlRSWtxU0IvS2wxWW14ZWp3?=
 =?utf-8?B?US9GNWNad3pmUjhTWXRza25WZ2RMNnVSc2tsU3kvWUFObjhHeEhsWGlONGRn?=
 =?utf-8?B?bERKYnlEanJUZ2pxTlJVNkFUNldFd3BUNVhEZ3VqTTdEbkQwRFo3RGxnYmJW?=
 =?utf-8?B?bFVvZ2hqbisrd08zQVFFdWNDdUdFTDYzaExtUjcvSCtqOVhLcnkyUDF5dkZB?=
 =?utf-8?B?SVZJZGlSUyt4dzBJWW9pTmRTdzROZk9KcitFZ3ZoZG9JZ1FSMElWSGdiY0FW?=
 =?utf-8?B?cjNNV2IvWEpEa3oyQ2psZW9WdDJtdkp4RjhIcUMwcG56bkRva2JFWVp0cXZN?=
 =?utf-8?B?czFBeXJjN0tWNEw4VnpYRVh5cnlJNUZteWF6UzdpVnljQlI1RkhzYWI3aTlz?=
 =?utf-8?B?eGpSTFYzeUFBVnB3N1NoZnV4dWRZSEI3K1VXeTFSWlRWK2N4dTRYMTdrMTRk?=
 =?utf-8?B?VkJLR0VCV1NiVmRuK0hWR0hTcVplVHRST2NxRVM2SXhBL01kbHB1SzhVbi9C?=
 =?utf-8?B?ZGZpeHZ0OXdmQVFweW5Hdmhvb00vYTU3Y2c5SFpTL1E3YU1oTENVT3JmbmlH?=
 =?utf-8?B?WlFJRFNmQjNNME5tQ1Zuakpjc1QvZFZZOE9Qa1FZMFdLZVRiNXI4Y2M5ejR3?=
 =?utf-8?B?T2tpZWliRkZncEpyWkNWL3VDNDBqcXVUVHpURDNTRDViNVJKZFhFM0puREkx?=
 =?utf-8?B?WGJDd1I2WXpjL2o5c25adVNtdkNGK3NPS1RpTEFzWDErM05oaGVyOHVQeHlB?=
 =?utf-8?B?cjltMnNHMzVjcUNTREt0UzBGTkZVbUFmSGFIcHB4a0RlMU84UHNyNk1wS0ww?=
 =?utf-8?B?bS9IZW5BdnNlYkNLOWZEMXlTNFBBaFRyNFRjZy9TNzB3WTZSSFRHbTlDRHBF?=
 =?utf-8?B?eExJOUpiWnpHc3EvNlFWZFlHY2YrUXQwZUVaOWhiZlFpYTd0bExYL1BDV3Jh?=
 =?utf-8?B?aWE5V05HR0YwVlhWVDZadnBzek1xL05LZFNGRi9ibjNrNFA2Q2JTbGVmczhX?=
 =?utf-8?B?NkFhS1FkcExzK2I3bCtqT1BIYkxPamlNc1NaMWNnbHMrTWlVbVgzNkJyRlg2?=
 =?utf-8?B?cnlWVFJhZFZFRkdNRUthNG9sRXpyYmJJT2EyNWkyd0I2Nk1VNnlpbk1zYVFw?=
 =?utf-8?B?OWZQQkF6U1R1S1NUWEYrZ0QvWUhqYXpqYjl5ZjVRL3U3TWc2bTRUWlgrTkI3?=
 =?utf-8?B?a0psUEh2dE1yNzlOaWlPOHJDZ05pSCtMVElLcEY0eTE3bExCZGlTbER5Vnov?=
 =?utf-8?B?RHczem1Hd3UwMmx0d1dYZm0ydjZINWtOM0E2dWU5SHJ6MlRQaHpPdnB2OXVl?=
 =?utf-8?B?VXF3WFRIOHRXMkR1ZVJ1NE44cUs0UFQzRlBTYU5RbWhUV3RMdnU3Q1BMMFQ4?=
 =?utf-8?B?NVQ4VzdYWHhkTWkxWWRTVExvZGV5b0xrR2FUTEVmbXh1MlNDNXdjV2RGWDNF?=
 =?utf-8?B?OEk4b3VEcWpPeDN2TlE5TjF0WVF6U05rYkEwRnNkVW9qYW9tVEtZdUlDRXFU?=
 =?utf-8?Q?CG3DsRRYEIrukArzv5H2iNg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d6fb8d-d8c8-4fcd-e380-08dbe97973b0
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 03:33:24.7950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GsZ2O7mREOOfSQdQ3IOBtZG/jwiYD7RfctI0PNQCJiq/KQ743HanoRDXJZFIHOB5+KLfLg7W1RCkD4rz5YLDw8abiaWh2VYdFqIo4tQi4Wk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8440
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 3/4] drm/xe: Add throttle reasons sysfs
 attributes
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
Cc: intel-xe@lists.freedesktop.org, vivi.rodrigo@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 11/18/2023 3:11 AM, Rodrigo Vivi wrote:
> On Thu, Nov 16, 2023 at 08:00:42PM +0530, Sujaritha Sundaresan wrote:
>> Add throttle reasons sysfs interface under device/../gt#/freq
>> Currently there is one overall status and eight reasons
>> attributes.
>>
>> The new sysfs structure will have the below layout
>>
>> device/tile<n>/gt<n>
>>                 ├── freq
>>                 │   └── throttle
>>                 │       ├── <throttle_reasons>
>>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile               |   1 +
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  12 +
>>   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c | 266 ++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h |  17 ++
>>   4 files changed, 296 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index a1a8847e2ba3..c02b8e9bd72e 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -64,6 +64,7 @@ xe-y += xe_bb.o \
>>   	xe_gt_mcr.o \
>>   	xe_gt_pagefault.o \
>>   	xe_gt_sysfs.o \
>> +	xe_gt_throttle_sysfs.o \
>>   	xe_gt_tlb_invalidation.o \
>>   	xe_gt_topology.o \
>>   	xe_guc.o \
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index cc27fe8fc363..296ba9831634 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -457,4 +457,16 @@
>>   #define PVC_GT0_PLATFORM_ENERGY_STATUS		XE_REG(0x28106c)
>>   #define PVC_GT0_PACKAGE_POWER_SKU		XE_REG(0x281080)
>>   
>> +#define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
>> +#define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
>> +#define   PROCHOT_MASK				REG_BIT(0)
>> +#define   THERMAL_LIMIT_MASK			REG_BIT(1)
>> +#define   RATL_MASK				REG_BIT(5)
>> +#define   VR_THERMALERT_MASK			REG_BIT(6)
>> +#define   VR_TDC_MASK				REG_BIT(7)
>> +#define   POWER_LIMIT_4_MASK			REG_BIT(8)
>> +#define   POWER_LIMIT_1_MASK			REG_BIT(10)
>> +#define   POWER_LIMIT_2_MASK			REG_BIT(11)
>> +#define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>> new file mode 100644
>> index 000000000000..1b64058d9561
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>> @@ -0,0 +1,266 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_managed.h>
>> +
>> +#include <regs/xe_reg_defs.h>
>> +#include <regs/xe_gt_regs.h>
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_gt_sysfs.h"
>> +#include "xe_gt_throttle_sysfs.h"
>> +#include "xe_mmio.h"
>> +
>> +/**
>> + * DOC: Xe GT Throttle
>> + *
>> + * Provides sysfs entries for frequency throttle reasons in GT
>> + *
>> + * device/gt#/throttle/status - Overall status
>> + * device/gt#/throttle/reason_pl1 - Frequency throttle due to PL1
>> + * device/gt#/throttle/reason_pl2 - Frequency throttle due to PL2
>> + * device/gt#/throttle/reason_pl4 - Frequency throttle due to PL4, Iccmax etc.
>> + * device/gt#/throttle/reason_thermal - Frequency throttle due to thermal
>> + * device/gt#/throttle/reason_prochot - Frequency throttle due to prochot
>> + * device/gt#/throttle/reason_ratl - Frequency throttle due to RATL
>> + * device/gt#/throttle/reason_vr_thermalert - Frequency throttle due to VR THERMALERT
>> + * device/gt#/throttle/reason_vr_tdc -  Frequency throttle due to VR TDC
>> + */
>> +
>> +static u32 read_perf_limit_reasons(struct xe_gt *gt)
>> +{
>> +	u32 reg;
>> +
>> +	if (xe_gt_is_media_type(gt))
>> +		reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
>> +	else
>> +		reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
>> +
>> +	return reg;
>> +}
>> +
>> +static u32 read_status(struct xe_gt *gt)
>> +{
>> +	u32 status = read_perf_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
>> +
>> +	return status;
>> +}
>> +
>> +static u32 read_reason_pl1(struct xe_gt *gt)
>> +{
>> +	u32 pl1 = read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
>> +
>> +	return pl1;
>> +}
>> +
>> +static u32 read_reason_pl2(struct xe_gt *gt)
>> +{
>> +	u32 pl2 = read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
>> +
>> +	return pl2;
>> +}
>> +
>> +static u32 read_reason_pl4(struct xe_gt *gt)
>> +{
>> +	u32 pl4 = read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
>> +
>> +	return pl4;
>> +}
>> +
>> +static u32 read_reason_thermal(struct xe_gt *gt)
>> +{
>> +	u32 thermal = read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
>> +
>> +	return thermal;
>> +}
>> +
>> +static u32 read_reason_prochot(struct xe_gt *gt)
>> +{
>> +	u32 prochot = read_perf_limit_reasons(gt) & PROCHOT_MASK;
>> +
>> +	return prochot;
>> +}
>> +
>> +static u32 read_reason_ratl(struct xe_gt *gt)
>> +{
>> +	u32 ratl = read_perf_limit_reasons(gt) & RATL_MASK;
>> +
>> +	return ratl;
>> +}
>> +
>> +static u32 read_reason_vr_thermalert(struct xe_gt *gt)
>> +{
>> +	u32 thermalert = read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
>> +
>> +	return thermalert;
>> +}
>> +
>> +static u32 read_reason_vr_tdc(struct xe_gt *gt)
>> +{
>> +	u32 tdc = read_perf_limit_reasons(gt) & VR_TDC_MASK;
>> +
>> +	return tdc;
>> +}
>> +
>> +static ssize_t status_show(struct device *dev,
>> +			   struct device_attribute *attr,
>> +			   char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	bool status = !!read_status(gt);
>> +
>> +	return sysfs_emit(buff, "%u\n", status);
>> +}
>> +static DEVICE_ATTR_RO(status);
>> +
>> +static ssize_t reason_pl1_show(struct device *dev,
>> +			       struct device_attribute *attr,
>> +			       char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	bool pl1 = !!read_reason_pl1(gt);
>> +
>> +	return sysfs_emit(buff, "%u\n", pl1);
>> +}
>> +static DEVICE_ATTR_RO(reason_pl1);
>> +
>> +static ssize_t reason_pl2_show(struct device *dev,
>> +			       struct device_attribute *attr,
>> +			       char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	bool pl2 = !!read_reason_pl2(gt);
>> +
>> +	return sysfs_emit(buff, "%u\n", pl2);
>> +}
>> +static DEVICE_ATTR_RO(reason_pl2);
>> +
>> +static ssize_t reason_pl4_show(struct device *dev,
>> +			       struct device_attribute *attr,
>> +			       char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	bool pl4 = !!read_reason_pl4(gt);
>> +
>> +	return sysfs_emit(buff, "%u\n", pl4);
>> +}
>> +static DEVICE_ATTR_RO(reason_pl4);
>> +
>> +static ssize_t reason_thermal_show(struct device *dev,
>> +				   struct device_attribute *attr,
>> +				   char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	bool thermal = !!read_reason_thermal(gt);
>> +
>> +	return sysfs_emit(buff, "%u\n", thermal);
>> +}
>> +static DEVICE_ATTR_RO(reason_thermal);
>> +
>> +static ssize_t reason_prochot_show(struct device *dev,
>> +				   struct device_attribute *attr,
>> +				   char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	bool prochot = !!read_reason_prochot(gt);
>> +
>> +	return sysfs_emit(buff, "%u\n", prochot);
>> +}
>> +static DEVICE_ATTR_RO(reason_prochot);
>> +
>> +static ssize_t reason_ratl_show(struct device *dev,
>> +				struct device_attribute *attr,
>> +				char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	bool ratl = !!read_reason_ratl(gt);
>> +
>> +	return sysfs_emit(buff, "%u\n", ratl);
>> +}
>> +static DEVICE_ATTR_RO(reason_ratl);
>> +
>> +static ssize_t reason_vr_thermalert_show(struct device *dev,
>> +					 struct device_attribute *attr,
>> +					 char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	bool thermalert = !!read_reason_vr_thermalert(gt);
>> +
>> +	return sysfs_emit(buff, "%u\n", thermalert);
>> +}
>> +static DEVICE_ATTR_RO(reason_vr_thermalert);
>> +
>> +static ssize_t reason_vr_tdc_show(struct device *dev,
>> +				  struct device_attribute *attr,
>> +				  char *buff)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	bool tdc = !!read_reason_vr_tdc(gt);
>> +
>> +	return sysfs_emit(buff, "%u\n", tdc);
>> +}
>> +static DEVICE_ATTR_RO(reason_vr_tdc);
>> +
>> +static const struct attribute *throttle_attrs[] = {
>> +	&dev_attr_status.attr,
>> +	&dev_attr_reason_pl1.attr,
>> +	&dev_attr_reason_pl2.attr,
>> +	&dev_attr_reason_pl4.attr,
>> +	&dev_attr_reason_thermal.attr,
>> +	&dev_attr_reason_prochot.attr,
>> +	&dev_attr_reason_ratl.attr,
>> +	&dev_attr_reason_vr_thermalert.attr,
>> +	&dev_attr_reason_vr_tdc.attr,
>> +	NULL
>> +};
>> +
>> +static void gt_throttle_sysfs_fini(struct drm_device *drm, void *arg)
>> +{
>> +	struct kobject *kobj = arg;
>> +
>> +	sysfs_remove_files(kobj, throttle_attrs);
>> +	kobject_put(kobj);
>> +}
>> +
>> +void xe_gt_throttle_sysfs_init(struct xe_gt *gt)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	struct kobject *kobj1, *kobj2;
>> +	int err;
>> +
>> +
>> +	kobj1 = kobject_create_and_add("freq", gt->sysfs);
>> +	if (!kobj1) {
>> +		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
>> +		return;
>> +	}
> This cannot be right.
> We need to have a xe_freq midlayer now and that creates the freq sysfs.
> a child throttle creating that is strange.
>
>> +
>> +	kobj2 = kobject_create_and_add("throttle", kobj1);
>> +	if (!kobj2) {
>> +		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
>> +		return;
>> +	}
>> +
>> +	err = sysfs_create_files(kobj2, throttle_attrs);
>> +	if (err) {
>> +		kobject_put(kobj2);
>> +		drm_warn(&xe->drm, "failed to register throttle sysfs, err: %d\n", err);
>> +		return;
>> +	}
>> +
>> +	err = drmm_add_action_or_reset(&xe->drm, gt_throttle_sysfs_fini, kobj2);
>> +	if (err)
>> +		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
>> +			 __func__, err);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>> new file mode 100644
>> index 000000000000..48e22f6b6442
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>> @@ -0,0 +1,17 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright Â© 2023 Intel Corporation
>                  ^ strange char here

Hmm yes. Not sure what that is. Will fix.

Thanks,

Suja

>> + */
>> +
>> +#ifndef _XE_GT_THROTTLE_SYSFS_H_
>> +#define _XE_GT_THROTTLE_SYSFS_H_
>> +
>> +#include <drm/drm_managed.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +
>> +void xe_gt_throttle_sysfs_init(struct xe_gt *gt);
>> +
>> +#endif /* _XE_GT_THROTTLE_SYSFS_H_ */
>> +
>> -- 
>> 2.25.1
>>
