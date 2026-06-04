Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7BAFCD6E68
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 05:32:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1B0112657;
	Thu,  4 Jun 2026 05:32:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ejWHSJ/o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD292112657
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 05:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780551134; x=1812087134;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OOsf2ebZ02aHoAlr5RX9Yf4m5cNp/+qKh3nDY4RDBFc=;
 b=ejWHSJ/oXQe7debik4baYAms3IU/mrZh9bLN8QeUG6hyYQEoX+yiDsOt
 mVglvaZXJhskeGUxDlheClcUw1TCao0sImIMU870bzmORsmOHiqMErg9l
 O+bZSv0KtuFYC7qiYBcVgT7YAVg0AOfhOaUe/MiYkRJLh8iaisa9WU/g3
 5phh9DD9CmahBnX2KzeeTm9r4Bwtqrsz2mpzu7u9npi6lGK+NrMJxnasL
 8V2pJtEdUubmBvpeYndLbAcbJnHrSHpxUtT+uR/rlnwCj2YgS6c7Qm+kU
 cL4dlC8LK+I5lxhRMy1wuYSwnwyuVOj8ySx1bIOwZAv5amykGNTpwTa/Q Q==;
X-CSE-ConnectionGUID: eSJP1Y7gQbyNdvKEMePUWw==
X-CSE-MsgGUID: djNsOJzWTduQLOubq0lVDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81404439"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="81404439"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 22:32:13 -0700
X-CSE-ConnectionGUID: llvMs6b7Qn25Zgnfw0s6wg==
X-CSE-MsgGUID: WX9q3aNfS8C6YOvMnNxZqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="249529663"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 22:32:13 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 22:32:13 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 22:32:12 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.57) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 22:32:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PmtEvKfdHrU0/+l4MOrpkugv9yIM7nMh9vFF7uAtnzdqPvFvRGQMl4Oqky2cHkt5HXFGMA1ChgCfcBFyFsbEjTK0TDUmvQBfr/M9v6PuNP9utytL9b/miBYi8L9bw/8itpmYdOl7qUXkcKy+oXxFb5cgGODBYmnnGu2i+qkt/Qmnhc6QUMyHR02TgrX1ZxRyAcTBGcX7P4RUifLmw6ExEFs6bBA1AdZU89XddE/U2YxewfKZhnYGfMAgeEbokRxbZi38mPuzVpK0zSGqr3bAZj+dRv6NuyEi204B6HqO5GpbqQWp+RitnfAL/V4n47dx/BBaGdWTbNumqInf/ubIXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLooHdwiXlwm6yffInjea3ebYbETErXNV/AboKlGvmg=;
 b=iQBinS6XJUKqyLKzJYEhjlgISBNcsnnWAsMC+oyhZr8Znip9533Te64c4wFprV0PL7+1njHqFlifvN1nNLsdFBQSZr0vnQUTdXGN/KF8o9epMP/Il3cq/qGdGSmCewwhsBOQU+H2bfRc5WrrpyHE3LHkinxxDRYf1UzZiuzoRzKlXIA04ZdOmh0y6JQuJm161/61IT0t+De4R0bZJyZ9mWcQm7XeaGOIdErPZZ7WsFcgdnm06tVyU1c+TpGK4J1Cix7zOFsxDbvGqoqNpjPeey7W62Exi2A/0Fq8i6CzrOFTz20MnVY1E+nccleAF/W94hpk+6h5umLODfJ4Ps2Ztw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by LV3PR11MB8554.namprd11.prod.outlook.com (2603:10b6:408:1bb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 05:32:04 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%5]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 05:32:03 +0000
Message-ID: <282bd7ae-522a-438d-abf1-a09ed32727a3@intel.com>
Date: Thu, 4 Jun 2026 11:01:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 1/7] drm/xe/vm: Track CPU_AUTORESET state in xe_vma
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>
References: <20260406085830.1118431-1-arvind.yadav@intel.com>
 <20260406085830.1118431-2-arvind.yadav@intel.com>
 <afLVfDml8ozfA6Te@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <afLVfDml8ozfA6Te@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0161.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::31) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|LV3PR11MB8554:EE_
X-MS-Office365-Filtering-Correlation-Id: 0732e631-09c7-48af-97d3-08dec1fa9bf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|6133799003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: ERiS32SFNuXnJ06BKzKm8ThMg1erM0vi+6e1T5H/jUNvUCjyzXv11fzGq9cH1qO+bxIj2PHURE0byG+EuxFSx9HJlWZTn3msbqVBWSLZslxjYarU2Brrm+wH6O4+LibiU84ILHRewrzQUyiVtRT5CeQgdvi1s49eEIzvVyq1c+57PjGcw08C2x2yb62kBxunU75Ck/661zfdPB1nZ9KfEswgFf/x26ok7yy6wDs4X+YmVBjq8KUvIrvMW3Ot9RLvdKYPk3/KnVxF9jFX2Jc1p0J4NkaZ2HGOMuttM+v5oQAiW8A2ndWQDuF6r8nV1c6j8yoZ5hoejaD9zFq+E04T4vXAK+SFNXh1bYSr7d6x2w1AiChh5FjCNaTSNaKV2RsqQQgt1UJsPzqdY9PDBzmQYEN2/XYyjO0OWs5Vonak3VqTuNCBzmMAVyiXsAhICQVdmBc26bYgY0yvsfg8g4hX2hQhGNwD+0ESlLcmZLkY+vrMSe/EtBpHIqrEzFK/GJI6vsPEWYIvlu9yJvDmcHgLGBN+18XdWT8A+zhUcC295V/rLGiAaixNDCBwG4BR0+9MuuDqrOdAujdqjWgyghtS8rBJGn/rOtQPu41m2l1kBKWPTf9Y8X8E0FHzOqwnOn11Gmsl3av2cxEEoQAXlU3mHMG1CONdwhW3FZjb5MmrlHyWEd9hOVc/fkUkC4QXkCYa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(6133799003)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXpUZ2FkckQyQlAvb3FwMEhRN3hNVEZWS3h1cEFQbHBQbHBrcjZiOExPaUdK?=
 =?utf-8?B?YmdCSFNGZjczaTRESnRCN0xTa3dRRjdKem0weUhJNW16dUFQNk1SUVhabzdR?=
 =?utf-8?B?VklLUFErYnpSK3dGa0lCY3lHVlQ3U1p1Um5VYmJPY1VXdHFBaE96MkFBVllH?=
 =?utf-8?B?NVY3UmVFNWhTN2dxeHhsb2RacTNDaUJUZmVZaC9HTndES0dFakd1a0p5STNI?=
 =?utf-8?B?Q2VoTklMKzc2QzlESlBMUTl4K2c5eGN0MUc2L0RHbDdyYU5hVUVxalFMOUdE?=
 =?utf-8?B?dVAxMXNpN3pWWVo4ZldFZGlyRUE0Y0pwVXg0L00rYThialhFMG5WKzhDRDhh?=
 =?utf-8?B?ZEZqb3ZNOHp3aXVwRmpNVHNhTlR1OGhlQVdmcmtueHRsdzhmcm9hemVmeG4x?=
 =?utf-8?B?c0ZyVnlqYkpjZ1VoY1VPai9RT3Z4RVoycnYxaWcxc3I2N0NFdFZhMm1ueTU3?=
 =?utf-8?B?M2NURTMwSFBpK0ZrU3Rxb3VYcXE3R3pKeE0wb1hMdTcrNWY5WWFzbVVVYnRs?=
 =?utf-8?B?L2JCbkErV0FYMXVOcjBRdUR0RnppS284Kzlsb1VFV25majNhVit0U0w4S2RR?=
 =?utf-8?B?MnVxbHpOZXhTYnBsSEdRekJSaU0vV0xCcmZyc0U3YXMwYU1ieXpJSTJ4cS9t?=
 =?utf-8?B?WEV6WlRIUmRhRUlEMnBLZFZlS0t2UnYyTmFWNGJhcDc0YTBNQmdRRWJhTkF4?=
 =?utf-8?B?dndoVEszdnoxM3l1RWliczlDUFBLM0x4ZWlIWWlEV3hOd0p2aXNFRDZldmtU?=
 =?utf-8?B?K3N4V3BsU2VmaXV3bFd2cnVyOU9qNXExTUV0eTNPNWw4eWd4QU5rTUZIM3Uv?=
 =?utf-8?B?QXgxYWZwTEcxVURpTUgwaXZUelQ4YTJmZ1orRXl6bVduUnN4T2p2UDRvY0Vz?=
 =?utf-8?B?MmQwNHR0TFpwNnNYbkpYOW9TTDZwYUoxTzBYOTluRWNCeFdTQzRjYUh2b25Q?=
 =?utf-8?B?RWFOcHV1WWhhVk0rSXk4OHZCUnJHK2xOdW80VmIxeFBUNWk1N2hpc2J3ZDRm?=
 =?utf-8?B?RmFBYlNVRTF1NkZMNDY2YUdmT2NVckt2WUYvY2p5WTB0eTJMSDQwNUdGMHVV?=
 =?utf-8?B?eVU5OGRTVHZ3NTcyUjFWT1ptY1VxeStiQnB6cUovM1lURWZmVzR0ZlhJcTdn?=
 =?utf-8?B?cnpna0dUNkFJdjNxVzIyTHFvNjRMdjVWSGdHYVBmYnhzQm9BckpYTGQrVGVl?=
 =?utf-8?B?OXI3ZitjRS9iQUp5d0psbnpaNktvdUovaVBHdThLOUxKNU8vblpIM1VlejRz?=
 =?utf-8?B?UzAvUnZ2bFRlbkcvUjNldC8rUkRIcWJxUnpqRmM0ZGNudDB6b0lTTEZ4NFpG?=
 =?utf-8?B?U3ZSUmxCWHg3MzN5cXp2UWlFeTdkTkx2OTQrQ2xoQ0pmUHlJcWxCUkhFWWoz?=
 =?utf-8?B?VE1NWFAwUS9jbzM3WXo5REJUZHVYQjhvaGFqN3pZb3ZrQ0VHc3lrYVVSWmp1?=
 =?utf-8?B?c1E0WTJ0dTViOFlRZ1g2MVM2ckRmNUowdk5WVkR1QlJ6OU8rTW5XWTBhVlFt?=
 =?utf-8?B?TkhJUXV2dHk4bC9GSE9hRzU4SWVMT3djSWtia0pyZHZZZE5Wb2diUGVPY215?=
 =?utf-8?B?c0JuQlNJM2VlVUNMTWdweUgweUVxd1pLb3RROWVROElRVUhySVlTNDlNaHBR?=
 =?utf-8?B?SmlsM3dMWVMrT1AyeEliTGk3blhlakU2VVY5Mm5aNlEvV3g1NkJpZ1JLU09p?=
 =?utf-8?B?MEpacHJVcElQNWkxNW9Qd2dQSHNVSVlERTRFSDdRdzYwT3IvTUFWTDdRa2RF?=
 =?utf-8?B?ak0rMnk4cDdhNnZpQTFZR3Zuc1NQekwwS09Lcy9YUzZzUUxVYkFiNTg3QWE0?=
 =?utf-8?B?WDJMOXZoVEpyNlRUeEY2THh5UVFLQVJIcExnZy8rNVlEMFdoRHNONmwvSjBt?=
 =?utf-8?B?SDNVc0QzT3p6RVhLUEg2YnFZeWxUUkpBUmFHd2NiZE5MYmc1MUFqbmlSTjhv?=
 =?utf-8?B?cVN5WnBTclpaZDN3WGU0RjNUMEVRckNUUUZrSFNOV1pIb1F2bTFKZllueng2?=
 =?utf-8?B?MllXd0pIckxaU0tMVkVwTVV6YnlNOTRXa2I3VDBFK055d3I5bmlKSlJxTW5F?=
 =?utf-8?B?enp4a09VM1Z2SHNTWklWTHVxMkVkN1QyUDBtOUY0R21vVGVvck5KaXhqRXUw?=
 =?utf-8?B?dmVYNTMzSExiU2d3WmVrU016VkFDWWdZN3ZJYWZpWW9Ma2VoM1g2TzZFemVa?=
 =?utf-8?B?TWRXQ2xCWVBZcEx5M3BwOUpOUGxOSk1seGZnTk5kMmZuVGhqWWFEbHRiZEVw?=
 =?utf-8?B?Y1dNY01kdHFnemVLK05VeElraCswM295OHF1TGgybDNobWxoUnBWUlhxcjAr?=
 =?utf-8?B?TVVHb0hsZ1BCalZ4Y0o0L1NKTXdwbzQwcEpaeE5MR1dkR3dwdzBKUT09?=
X-Exchange-RoutingPolicyChecked: AB9kvZdVhmodXKGakOgqUm9GmdADHy7nWrAyjAuEt/OYLhWasIkHLXlbk9O23JLE1/UWi+rG/pkcUs2WwwcSqXjDPBFLfPN7RtijNZs110wflVbeWCarVK8KP3l/iY+fKmn7UBer8hr1mYLaCpsJLhVBsC+MjAc+5iAd+9buTWVCNdkEaffd0Js3/x6lOMUEj+WFNcGeqMkVyigBItRJarXbUfwZT6dDH9CfzIpZEhSf4vGOo7e8hqI9qDKCqX5WAJGG9J/tRBjWue6wRJfdxe29yNEkEe7q6dQmMsY9lYUeovP/6PFcht37v3J3DYVZlAYNgg09zPXh5cLFT2CYWw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0732e631-09c7-48af-97d3-08dec1fa9bf2
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 05:32:03.9404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1MzY2OA8TIw0MxE1AKMAvuOllb7rBaLfT5+aOGO6LokppN5b6Wr8xz3y+lyZth3rrXnCGVqkyod/0RUdjle2xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8554
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


On 30-04-2026 09:37, Matthew Brost wrote:
> On Mon, Apr 06, 2026 at 02:28:24PM +0530, Arvind Yadav wrote:
>> Track MADVISE_AUTORESET CPU-only state in struct xe_vma with a dedicated
>> cpu_autoreset_active bool.
>>
>> Add XE_VMA_CPU_AUTORESET_ACTIVE as a pipeline-only bit to carry this
>> state through MAP/REMAP operations. Runtime state lives in
>> xe_vma.cpu_autoreset_active rather than vma->gpuva.flags.
>>
>> The state is set at bind time and cleared on the first successful GPU
>> fault.
>>
>> v2:
>>    - Move runtime state from gpuva.flags to xe_vma bool. (Matt)
>>    - Keep XE_VMA_CPU_AUTORESET_ACTIVE pipeline-only. (Matt)
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_vm.h       |  5 +++++
>>   drivers/gpu/drm/xe/xe_vm_types.h | 10 ++++++++++
>>   2 files changed, 15 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>> index c5b900f38ded..bdf42083da86 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.h
>> +++ b/drivers/gpu/drm/xe/xe_vm.h
>> @@ -181,6 +181,11 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
>>   		!xe_vma_is_cpu_addr_mirror(vma);
>>   }
>>   
> Kernel doc
Noted,
>> +static inline bool xe_vma_has_cpu_autoreset_active(const struct xe_vma *vma)
>> +{
> 	lockdep_assert_held(&vm->lock);
>
> ?


I will add this.

Thanks,
Arvind

>
> Matt
>
>> +	return vma->cpu_autoreset_active;
>> +}
>> +
>>   struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr);
>>   
>>   int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool is_atomic);
>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
>> index a94827d7fbec..6a19ecca5518 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>> @@ -52,6 +52,8 @@ struct xe_vm_pgtable_update_op;
>>   #define XE_VMA_DUMPABLE		(DRM_GPUVA_USERBITS << 8)
>>   #define XE_VMA_SYSTEM_ALLOCATOR	(DRM_GPUVA_USERBITS << 9)
>>   #define XE_VMA_MADV_AUTORESET	(DRM_GPUVA_USERBITS << 10)
>> +/* Pipeline-only bit used to carry cpu_autoreset_active through MAP/REMAP. */
>> +#define XE_VMA_CPU_AUTORESET_ACTIVE	(DRM_GPUVA_USERBITS << 11)
>>   
>>   /**
>>    * struct xe_vma_mem_attr - memory attributes associated with vma
>> @@ -157,6 +159,14 @@ struct xe_vma {
>>   	/** @tile_staged: bind is staged for this VMA */
>>   	u8 tile_staged;
>>   
>> +	/**
>> +	 * @cpu_autoreset_active: CPU mirror VMA is still CPU-only.
>> +	 *
>> +	 * Set at bind time and cleared on the first successful GPU fault.
>> +	 * Protected by vm->lock.
>> +	 */
>> +	bool cpu_autoreset_active;
>> +
>>   	/**
>>   	 * @skip_invalidation: Used in madvise to avoid invalidation
>>   	 * if mem attributes doesn't change
>> -- 
>> 2.43.0
>>
