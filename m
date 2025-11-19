Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121BCCF58FE
	for <intel-xe@archiver.kernel.org>; Wed, 19 Nov 2025 21:33:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD3D10E69E;
	Wed, 19 Nov 2025 21:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SqQBOFeC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D60310E69E
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Nov 2025 21:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763588030; x=1795124030;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=a/iMkyBNjlwtrHIJVN/IMN1DD5nlzRJvp3joYHd4+8M=;
 b=SqQBOFeCZJPxTR7C3fWv8+Qq9EFzT0SkTBDpMoWYSqCCg3MRO6X5mCoV
 T7fmu7hMVPTEByYzlv/nNN+q8p3Lka5m+lRwSL34GHZ8hnqi33VdHITxb
 jLljSa0SmwMzNJXAX8huhp2CYxR36ZfRPQj8OwHailEJGYiirOjSl9VP3
 xL3R3jLLMtTVmAo0L3WNCpw8uwlLMujYO9E7sczXyk+XyZFzriPuSTRD2
 UERYN7njHtao5rKBK7FigqvD1qiQWrX0P3pC224JlRHICBtSrT0DLY87T
 44EsR41TgYm8UZXxwKdOJSke1xPTc9GV5/cua7u13+NWgnV2TumMsw+zZ g==;
X-CSE-ConnectionGUID: NHuHqQjARKqfUM8vUj9fUw==
X-CSE-MsgGUID: A8U8xcQdQSeOMm3gBZyiXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="76322933"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="76322933"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 13:33:41 -0800
X-CSE-ConnectionGUID: E2DB6UwhQAizglPlSAsFLQ==
X-CSE-MsgGUID: Ew8Uo3ppT+WVMlYsxihTBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208";a="195287988"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 13:33:39 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 13:33:36 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 13:33:36 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.26) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 13:33:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHqs/4SM9Wy5x587jqJPT/wYqG2SRaWH1DecybyDuMpO/S2ixmNd8LZTkr1RZwL3WTXt35qQFm4EzsAtrSSr5jUNT8pKrkjrarbtlGQxsSW/FgJ4ircFRHn7FNDqPv1JGupxfoL0dAKj5rhcyb3jnqtx25+lc4fWbwCIezwV7xcXkuRajt5gjEoaYAeQv0D/4M3LfdI/f4zKfEA6VphcpKohoUcDfDpzAMSayK+UWUE5SJvjFN/oUsV5sQ3zwSte6+doTnV7DcrfyU2OlNZLBPr0q2aSFwmyJysneWASObv9s6Ub2zzDsfGESgp+qE+kQ3JlovNi3mm9J7zQpQr4OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJC0UIZ4OhSe6+tzirYBHXQNSPwEOKOxfQnwmLyAIxI=;
 b=nj/NvOZsLXLQKS2taEs1oPRpD4gyo2BYHtt9AVJLLSjX/nXX+EQhGITv6hRRTOY9RGZ5gqZ9F7R1flsF2alO3KLl9wpz2txYJibXyoEzrp9E+tNyt+2jlVz5WRAZ6q8+wpP6e5Wjn08EuiSiyNHYLJNXosh7TMnViw3Y7mChKligPcQxvjDwt7f6Z6e5WHKpv7v5ea2TotmlkCksHCr9r2nFFhlai0XXwrptYD2bji9lxwm9093H0p0F8W9baLXsBlEs/GPfeoJN0O0ZWZYkT+zg64TGKJMJH7jt3k1JvF68RvDvNqEEgZg4buMMmgJVoCbxpbheCOLKVHzYdwwidA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SN7PR11MB8262.namprd11.prod.outlook.com (2603:10b6:806:26e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 21:33:28 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 21:33:28 +0000
Message-ID: <9cbbfd8f-8824-4aef-8ef2-c926f2e7d46c@intel.com>
Date: Wed, 19 Nov 2025 13:33:27 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/20] drm/xe/eudebug: Mark guc contexts as debuggable
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Jan Sokolowski <jan.sokolowski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>, Maciej Patelczyk
 <maciej.patelczyk@intel.com>
References: <20251006111711.201906-17-mika.kuoppala@linux.intel.com>
 <20251118144804.2540812-1-mika.kuoppala@linux.intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20251118144804.2540812-1-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0095.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::36) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SN7PR11MB8262:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a34a0e5-3cb1-48b0-4a95-08de27b34739
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUJndHlyS1p6VmxOUzB3bk1EM2dYZzJXWTFKYTB3alNiZ0dKVmhiS1lqWGFC?=
 =?utf-8?B?YXJNcjJYWUFXNXJsSUo1MS9zNTNxV3BxSUJ4bC9NcDdxdWxlZ0JXL2hnd29o?=
 =?utf-8?B?UFNlYkdnZm50ekV3NldkMlFTa20rZklWditzbTFsajVCaGkzTDgzTzFoODcr?=
 =?utf-8?B?Nm9BUkQxRHRneDJCSmJsYmV2Y0ZXRG9xWHJ1ME8wanU3eWtFdFVLMW0yenF2?=
 =?utf-8?B?ZFhabk1jQjllWGtWRWVYNUxreDMzb2V1UWNDRXNSVXAwQlFzWW51VHcvSVpo?=
 =?utf-8?B?bFc3OS9YU0V4WlRuZkpWWmMzajBzSjVJUXV2dWNSMG9xb2VRNHRMTWhKYXA3?=
 =?utf-8?B?YUJVVksyR2p2ZmxKV2pXOWx0N0w5MHRBaHNnUlNSTjNMd3RtbmNUVnFlRGxi?=
 =?utf-8?B?TUoyM2Q5Wml1K3lOVlhzamNKR2hESS9vVjRTcTFjSk1NSGVlbHBpZHh4M1dW?=
 =?utf-8?B?RVZvSG9ScXZGaUZySUlFUllSNFdPRHNKbUVKRUUwMjZkYUIrUWVPZkVBaGFK?=
 =?utf-8?B?dUx1M0kwdXJFLzlUVkJNOWNFWjJCS3lBUmNQem1pQkdycC9oZlhCSitXVkhn?=
 =?utf-8?B?NXVUMUdwOE9VWEZES2dwM3lmWXNoNmZVSXUxbDBkakxKS2oweG5BUzJYSi9o?=
 =?utf-8?B?bTV1NFI2Uyt2dDJYbmRlTlN2Y0dERWZQcU4vZ0Urajc2ZHdtd3V6RHczZzhw?=
 =?utf-8?B?R1MwdWRSK0J3QXdWQzE0VU1wSmkrK1lrS2xKRHJqT01FZkJNYWxZTWxLT0hK?=
 =?utf-8?B?SGU3NkQvZ1o2d3ZSRnY4ZmpiZ0M4cDlvWVI1SFZCRUJkYzVpQmE5MXI5SEE4?=
 =?utf-8?B?bFZnajhmeDFFWDYwK2JBTWhsNTMvWFNWTVJ5TGlzelM4M1drRWRoUy9Bb29p?=
 =?utf-8?B?RGtKOU5sQ3UxSlpvd0l0S2RLUnZBdzJ3b3d1SzhORFZveTRqTTQyYXhodTA5?=
 =?utf-8?B?TlZCWlBYUjFtSDVpeWJISXp3TEpqNlk0SE1MWjlqbjk4ZnkzNHFoY3RxR2Fi?=
 =?utf-8?B?VXJ0emo3Zk4wcTR6eVJBcFVBaG9rMENudGN0YlF1ZllCVm44c05rZ1VweTlZ?=
 =?utf-8?B?UC9KOFh2MGF1NEpJbFVIcTZSeTJIakRsWjhqTU4weXZRcGwyNEI2WGMxUG9V?=
 =?utf-8?B?M0Q1RnY3a1lvVEdSdGlxdHA3R0JYTjVjVmdHaU5wSTJ2S05XYXRLSmhhelRZ?=
 =?utf-8?B?OHBsM0ZMb3U0UFB3OVdiQi9UQmZGem5GakpTM3NKMHNKRHB4cGdzRCtBWCsv?=
 =?utf-8?B?cGxod0JuQmFoSkhmYTRaQUZncktWNTVVTXlkUmZKOGRDM09hek1mN0NLWkc1?=
 =?utf-8?B?NWFaR0EvR3loNnUwRFljdWE4aEZwUlMwbmtzSHJ0M3p4QmJ3N1BNdVE1RE5U?=
 =?utf-8?B?QXBDTWNUMS9YQzk4aUpMRFNkOU1xOWlCZXVONmVZbE9lbW9oTkdDYk9lRGVr?=
 =?utf-8?B?angrOHRsT1Urbi9SSHhDRXJoV1ArL2xZVGdlc010dTk2ZU9JemFwY0xRRHV2?=
 =?utf-8?B?N1FsTWNSMC96bVY2L3FSSE5CSEx1WnA4K0pDMmE3U2JiSmlKSmYwQmNtTHdx?=
 =?utf-8?B?aE9DZWdHTXAyMXJNUmVtcUlEMkhSRjI0c05NU0RLTDlNS1hhN2NJNmZSRVgz?=
 =?utf-8?B?YURhTmlxQTNnWjBqOXBJaVNqYW1HYmM4ZGhCVlVLTFpyS1lDcE9Zcnp2bUoz?=
 =?utf-8?B?azdocnc4b0N3L3ZMYVJ2cGhkb2krazNxc0ozNmZUN21vbXZiMnUxczRWUEY4?=
 =?utf-8?B?NkJHazlIa1ZIaEhLb2JmeXhoeGJuRVAwbnB2SUpjR01Ja1hWNzRrTDZBVVAr?=
 =?utf-8?B?OFd6Y3gxQzJGd01BQTRjMVJVSDFLRitITWtrdU5MVHVYbXNGTFZYdWI1RWdy?=
 =?utf-8?B?SVE5S1lzTzZEMGhrS3ducGRSODdkVnlSL3p5MXlNRXRBdnNsTVd1N0RuU29j?=
 =?utf-8?Q?u0JJErIlCxJwWRh68sEpfUcXA6GSQFgl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFZjUUkra1hZVmF0YXVmblpjbGQyVU9IOWNRUzAyV2FVNXgzQ1ByTTkvSEZN?=
 =?utf-8?B?N00xOWtjczJLdElJejRYSWc1M1FJMTlNcnA2eTB1Y1pHdGhOUTNqeUlYdmND?=
 =?utf-8?B?MUo4Z3hkUWZZaUdEWkEyY1p3TnExdGxTSnAxZEllaGhnSHFlRlpSVyt5a2dR?=
 =?utf-8?B?TFBFYmdXTlA3R3FsU1RpaEZLYlljT2pISkt6SHNMNkJScktMd2RTNlRJT2xl?=
 =?utf-8?B?TDBST1NYWnh0NU1GZ2Y4R1BRZC8xdzBnZXc2NDdtQUlQcnZOanhYK1BVUVJY?=
 =?utf-8?B?dk5WUktYeitjMDF1QysxcyttaDBzTlZPdnZNQU9PcjV2TjBpNkFNQ2NyK283?=
 =?utf-8?B?MlgyQyttbHVTeTdmR284b2Z0OFR6U0VST1ZEUFFZN0ZoSWNvNkVSMXk3a1Rn?=
 =?utf-8?B?K1ovVGVCcFVZT0tPRFhHakE1OTVvbDQ2QjBNcExqQ3IwTVJIeWhwSE1BZ0Z5?=
 =?utf-8?B?WUk1UnVhV2hBS2Rwb1lCRDFqaUVxaDlERVNFYllITnJyTFBXejVtaDBwd1Vw?=
 =?utf-8?B?YzQrc3dPNExzQlRGVXg2bm1iczQvbEI1Rmx1YUM5bktVcUZQMHZ1QW82eERr?=
 =?utf-8?B?dEM1QVZSYU10S0g4VmhEek5lK1h1OS9qaVFLZGJmSGh1bERtRTFUOC9nT1d6?=
 =?utf-8?B?Mzl5ektKS0g5ZmVkSEVzUzFmaEx4UVF3blpYVHVwSHhKNmJVUS90WUt1cGda?=
 =?utf-8?B?TiszNG93STRmY0UvcXRzdGZOd293WFpYNUlWUElqTkFha01XbXRCZ0xLUWVz?=
 =?utf-8?B?VlpuMkQ1NU1UeDRDbHp0VGN3WVVpVFo5cVRwYnR5YTNmcGdIUHEzakM0cU1j?=
 =?utf-8?B?UGRPSmw4NXRHK1ZVTU9SU3Rlc2QzVkJyK041M0x4YSt0RldiQWNBVHRiTVdW?=
 =?utf-8?B?SFJnQjFsMTZrU3JiV1d1bnF5UmQrcGVRV3FwdHF4eVNvbktFVFZIK0w3VVRx?=
 =?utf-8?B?S21KZ09FbUplem1zcXlWZEVpS21TYnoxSkFtZ2JqR2tCQ0tLRWo5N2h2TU9P?=
 =?utf-8?B?Y3hmZkwxYnB4dmlBNzBwazUzNkRGVE1xc25hdkxEUHYyMWdHTFdFQ0paZUZu?=
 =?utf-8?B?K2lFbXg0TStaSHp5Slh2THRXNEh5Q2pHVy9BVlBqTDIrRi9BVnBDUHU5S3dO?=
 =?utf-8?B?VFJkTlR0NUIwSHdDaVBrV3c4YVJ4c094YXdLM1ZMN3FqM2hGL21GMzV2Vldy?=
 =?utf-8?B?UnRWbGpnOVNvc1lnWnZkZURxNGRrTVhHQnNRT1piTk9Sd2RiNC9kWWs1MUxQ?=
 =?utf-8?B?L0pKT0F0UkVydFFKbUltWlUwNU9TZE9KNkRkd1N3K1NTZHRUSE55SUFVdXEw?=
 =?utf-8?B?RDNvbzdScXNXc25JQXpTdVI3czZDQ3lzS3BhMDc0bk93WFpBTndTQS9qQWJk?=
 =?utf-8?B?VGozTHRGUC93OXpMajduNUowNlZ4Rnp2RDAyOWxEMkJiM2JIY3p4K0t4NUhF?=
 =?utf-8?B?K01EekFtejFHRmkrbmxIQTh6OVBGeXE2ZFIyNkxIZlFuYkNEMXlGQ3ZkbGQ2?=
 =?utf-8?B?N1I0OHhuaHMvVUhWUmJGcTJTRGEvWGhBTmlUaS9HYm9KZ2R1bHlZR0JNL052?=
 =?utf-8?B?OURNUzVRYW5WZGoxY2d0TVpJVUdkQWVVMUNmbWJDSU95T3BRWWFDTllPYzlr?=
 =?utf-8?B?NHFnaVRWV25pYzFXUUgyVDhrUXpMdXFDNHNjOERpZTBSM1F6VkNXZG9qVkd3?=
 =?utf-8?B?NFNySlRlSVhNdkdtRDk5MlVNVHB0MzlTM2lnT3N5Q3Q3QUtBamNiK3d4VkND?=
 =?utf-8?B?R2lOakVxZXFkaG9IVkxzSHY0cmp2YW5uQUxRdW5pemMrQmFTMWdULzZhejZC?=
 =?utf-8?B?Rkg4TDJab24rRVU4ZmwxNW9LdHNsay9wY0NXcVpRV2xMQnphT1NtQnRtcHRr?=
 =?utf-8?B?VWxLbnY1ZzhkNjNULzJjM2NhWnZOM3VjSzJ5WUZudFdpS0cyUkFlSVV5L1lu?=
 =?utf-8?B?eG05ZGFXdWRTTGgvV0RsTmRMSU5zYjhkY1RLL2J4L2ZuaXN2dUtqUDZaU0tI?=
 =?utf-8?B?bUlPaGpaRm5NYkdYUVZ6NjduU1ZkZFhneWtpN3RzVXVXeEl3T0VUeXhDYko2?=
 =?utf-8?B?elVRVk1XZFNXUzdQbzBybS9JdDRnN3l5b3pxK2plUExQTG9teTUrSW1lbGNO?=
 =?utf-8?B?WkxhU0VKalFTVlpuMkw4Sm9kb2hXL0hUcHg0aHNqV2Mxb21RQjA3T01ZeGFq?=
 =?utf-8?Q?gdUS/sPbnwOzv+ONM9Uog04=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a34a0e5-3cb1-48b0-4a95-08de27b34739
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 21:33:28.2966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lHchX+oPGcsUSHXT650Ix+RLROezndS3V5Cuc8QVVXTExsr/ksyA7k7PK0JojtgUVBHuZcbgaqgW3S1g+Ea3qtfHc+ENnV6hy1BVAQInx88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8262
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



On 11/18/2025 6:48 AM, Mika Kuoppala wrote:
> We need to inform to guc which contexts are debuggable
> as their handling is different from ordinary contexts.
>
> v2: void return, use xe_gt_dbg, no need for lrc (Matt)
> v3: add the workaround enabling (Daniele)
> v4: version needed to 70.49.4
>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Jan Sokolowski <jan.sokolowski@intel.com>
> Co-developed-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Co-developed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/abi/guc_actions_abi.h |  5 +++
>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h    |  1 +
>   drivers/gpu/drm/xe/xe_eudebug_hw.h       |  7 ++++
>   drivers/gpu/drm/xe/xe_guc_ads.c          | 18 ++++++++++
>   drivers/gpu/drm/xe/xe_guc_submit.c       | 45 ++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_wa_oob.rules       |  2 ++
>   6 files changed, 78 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> index 47756e4674a1..32a5f680a6d2 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> @@ -155,6 +155,7 @@ enum xe_guc_action {
>   	XE_GUC_ACTION_NOTIFY_FLUSH_LOG_BUFFER_TO_FILE = 0x8003,
>   	XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED = 0x8004,
>   	XE_GUC_ACTION_NOTIFY_EXCEPTION = 0x8005,
> +	XE_GUC_ACTION_EU_KERNEL_DEBUG = 0x8006,
>   	XE_GUC_ACTION_TEST_G2G_SEND = 0xF001,
>   	XE_GUC_ACTION_TEST_G2G_RECV = 0xF002,
>   	XE_GUC_ACTION_LIMIT
> @@ -278,4 +279,8 @@ enum xe_guc_g2g_type {
>   /* invalid type for XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR */
>   #define XE_GUC_CAT_ERR_TYPE_INVALID 0xdeadbeef
>   
> +enum  xe_guc_eu_kernel_debug_request_type {
> +	XE_GUC_EU_KERNEL_DEBUG_ENABLE = 0x3,
> +};
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 265a135e7061..fba190d4f84b 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -423,6 +423,7 @@ enum xe_guc_klv_ids {
>   	GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO					= 0x900a,
>   	GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH					= 0x900b,
>   	GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG					= 0x900c,
> +	GUC_WA_KLV_RESET_DEP_ENGINES_ON_DEBUG_CTX_SWITCH				= 0x900d,
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_eudebug_hw.h b/drivers/gpu/drm/xe/xe_eudebug_hw.h
> index 8f59ec574e4e..7c5df12859ac 100644
> --- a/drivers/gpu/drm/xe/xe_eudebug_hw.h
> +++ b/drivers/gpu/drm/xe/xe_eudebug_hw.h
> @@ -14,6 +14,13 @@ struct xe_eudebug;
>   struct xe_hw_engine;
>   struct xe_gt;
>   
> +#define XE_EUDEBUG_GUC_VER_MAJOR 70
> +#define XE_EUDEBUG_GUC_VER_MINOR 49
> +#define XE_EUDEBUG_GUC_VER_PATCH 4
> +#define XE_EUDEBUG_GUC_VER_MIN MAKE_GUC_VER(XE_EUDEBUG_GUC_VER_MAJOR, \
> +					    XE_EUDEBUG_GUC_VER_MINOR, \
> +					    XE_EUDEBUG_GUC_VER_PATCH)
> +
>   #if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
>   
>   void xe_eudebug_hw_init(struct xe_eudebug *d);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 58e0b0294a5b..8ff90437c976 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -16,6 +16,7 @@
>   #include "regs/xe_gt_regs.h"
>   #include "regs/xe_guc_regs.h"
>   #include "xe_bo.h"
> +#include "xe_eudebug_hw.h"
>   #include "xe_gt.h"
>   #include "xe_gt_ccs_mode.h"
>   #include "xe_gt_printk.h"
> @@ -363,6 +364,23 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>   		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
>   				 GUC_WORKAROUND_KLV_DISABLE_PSMI_INTERRUPTS_AT_C6_ENTRY_RESTORE_AT_EXIT);
>   
> +#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
> +	if (XE_GT_WA(gt, 14022766366)) {
> +		const struct xe_uc_fw_version needed = {
> +			.major = XE_EUDEBUG_GUC_VER_MAJOR,
> +			.minor = XE_EUDEBUG_GUC_VER_MINOR,
> +			.patch = XE_EUDEBUG_GUC_VER_PATCH,
> +		};
> +
> +		if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER_STRUCT(needed))
> +			guc_waklv_enable(ads, NULL, 0, &offset, &remain,
> +					 GUC_WA_KLV_RESET_DEP_ENGINES_ON_DEBUG_CTX_SWITCH);
> +		else
> +			xe_gt_warn(gt, "eudebug needs GuC version %u.%u.%u or greater\n",
> +				   needed.major, needed.minor, needed.patch);

We usually prefer to use gt_info for specific features needing a certain 
GuC version (see e.g. is_engine_activity_supported()), since there is 
already a warn-level message at GuC fetch time recommending a new enough 
version of the GuC

> +	}
> +#endif
> +
>   	size = guc_ads_waklv_size(ads) - remain;
>   	if (!size)
>   		return;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 16f78376f196..26dc4a4a67f0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -21,6 +21,7 @@
>   #include "xe_assert.h"
>   #include "xe_devcoredump.h"
>   #include "xe_device.h"
> +#include "xe_eudebug_hw.h"
>   #include "xe_exec_queue.h"
>   #include "xe_force_wake.h"
>   #include "xe_gpu_scheduler.h"
> @@ -608,6 +609,47 @@ static void __register_exec_queue(struct xe_guc *guc,
>   	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
>   }
>   
> +static bool xe_guc_has_debug_contexts(struct xe_guc *guc)

nit: we usually don't use the "xe_" prefix for static functions (below 
as well)

> +{
> +	return GUC_FIRMWARE_VER(guc) >=	XE_EUDEBUG_GUC_VER_MIN;
> +}
> +
> +static int xe_guc_action_eu_kernel_debug_enable(struct xe_guc *guc,
> +						struct xe_exec_queue *q)
> +{
> +	struct xe_gt *gt = q->hwe->gt;
> +	const u32 action[] = {
> +		XE_GUC_ACTION_EU_KERNEL_DEBUG,
> +		q->guc->id,
> +		XE_GUC_EU_KERNEL_DEBUG_ENABLE,
> +		0, /* reserved */
> +	};
> +	int ret;
> +
> +	ret = xe_guc_ct_send(&guc->ct, action,
> +			     ARRAY_SIZE(action), 0, 0);
> +
> +	if (ret)
> +		xe_gt_dbg(gt, "GuC ctx=%d debug enabling failed with %d",
> +			  action[1], ret);

I think this should be gt_err and not dbg because it has info that we 
would want even if debug logs are disabled.

> +	else
> +		xe_gt_dbg(gt, "GuC ctx=%d enabled for debug", action[1]);
> +
> +	return ret;
> +}
> +
> +static void set_debug(struct xe_guc *guc, struct xe_exec_queue *q)
> +{
> +	int ret;
> +
> +	if (!xe_guc_has_debug_contexts(guc))
> +		return;

This seems to be silently dropping the setting. If I'm not missing 
anything, this means that if an app tries to enable debug on a context 
on a too old GuC it won't receive any actual error return and the only 
way the user has to know that something went wrong is to look at the 
driver load logs in dmesg. IMO we should either escalate an error from 
here (which would require de-registering the queue) or have a guc 
version check much earlier in the debuggable queue creation flow and 
fail there.

> +
> +	ret = xe_guc_action_eu_kernel_debug_enable(guc, q);
> +	if (ret)
> +		xe_gt_warn(q->gt, "Failed to set eu kernel debug enable");

If the other log is raised to gt_err then this one can be dropped.

> +}
> +
>   static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
>   {
>   	struct xe_guc *guc = exec_queue_to_guc(q);
> @@ -662,6 +704,9 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
>   	else
>   		__register_exec_queue(guc, &info);
>   	init_policies(guc, q);
> +
> +	if (xe_exec_queue_is_debuggable(q))
> +		set_debug(guc, q);
>   }
>   
>   static u32 wq_space_until_wrap(struct xe_exec_queue *q)
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index e8f09ae7a67b..31272c83c6e0 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -85,3 +85,5 @@
>   #eudebug
>   18022722726	GRAPHICS_VERSION_RANGE(1250, 1274)
>   14015474168	PLATFORM(PVC)
> +14022766366	GRAPHICS_VERSION_RANGE(2000, 2004)

Looking at the WA details this seems to start at 2001.

Daniele

> +		GRAPHICS_VERSION_RANGE(3000, 3005)

