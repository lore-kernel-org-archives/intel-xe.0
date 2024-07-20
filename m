Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B672EC3DA59
	for <intel-xe@archiver.kernel.org>; Sat, 20 Jul 2024 19:16:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86DA110E2F7;
	Sat, 20 Jul 2024 19:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MoRnTZs6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E679A10E2F7
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Jul 2024 19:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721502959; x=1753038959;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=RHJ2oj97BiMigY9gHcQfq7gVkoUgMb9UPdwDvY/RnMI=;
 b=MoRnTZs6W8isZDOVZsgB/pTPq9dFDYszlJLJf6QJZxASKHpMt5bB6/Q6
 i1ZlvEuR9uQMBhHZnvMnwU3h3H3iR0CcSvxCbubNoCkERM9F0I2g5KyVu
 r2s4dz4EhJImHjBvnm26EuT1VOWx0SKmM6NZsEZCDicl7kGDWXsXuQ0Tn
 claAFEavNvn6XJQGtTzd1uZ6hNIZOxR+kLqmW5P3UmK7kgO6gQKHZryX0
 3qcbN77NQVicq6m4hdCeII1HUbqIU6sBX1DtB9lWCGTIevjuDX24yBpPP
 74Y+2ssmgSin+CD3VZlunC9R1q8ktfKiGVXXhqiEEjPyO8JMyzxSOJjLM Q==;
X-CSE-ConnectionGUID: iAC1WSBJTM+FJwuGpuL94w==
X-CSE-MsgGUID: 0CZskcbmSlitYI4dRDxObw==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="36545173"
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; d="scan'208";a="36545173"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2024 12:15:59 -0700
X-CSE-ConnectionGUID: bYtU3oOvSg2fLdjY6r0Bhg==
X-CSE-MsgGUID: lzqfHUMASvCL27z253XpxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; d="scan'208";a="51502944"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jul 2024 12:15:58 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 20 Jul 2024 12:15:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 20 Jul 2024 12:15:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 20 Jul 2024 12:15:57 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 20 Jul 2024 12:15:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WRy0juJlT10MOSZKTVPRSTcqYdkYog97HbLv9d5NyfmvY237KvxKd1MHlv4XbvBefaESksWQcOvE9OJu4zqs3hvzTrBLeb/rw2+Ec4hE4kRvKYLV9wqRgNEhEPBggCQ4fVEaEKaLawnH9MDnvYdP/LahIK37R1TEmQYUiddFCRnqGQizX+2Y1evSqCG3ORIFBfInXrvU3ZT+1h/uymaFkehGzrp7ENegy1xjY8Kqih0JtmHdW/JW5GDz1iq67FkF747J/F8Bjum8rFx+GbYtnrPxH+2Mo8ipwhhwGzeMAA9yDID+MjP1vQeOmmwZVUVJq8cfuYR//CVHgQejiM4TGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fB6fqG5gAPRoXGdmbTRVkXLOquo0pWl28LUWdhmjOVc=;
 b=ozMf1RNRIvvywxLqYLhgwEiUGO538/BHrvSg23A/PbMbixOvbsIJKsUqNif6hAMAm23lnPzfuKzBJq0BM+g7YoFQdlAkrAlSp/6sXzT9h07Hpt96oEh0lWGkawoGTi2ajUEq1S3WDVT04GntJMSI6TbH7bmkOVJJeVEhLW++9xZNV+fGMNnhO0xkQxXLSf2nxgtUigenj2ZfxzlvDQ/tXrz617yPuoK7UsyhBJ2dmFcGl6UtoIa5Vjp8Osc0pwNmbmMtLsn7IbUyNyvMV0eXe/f/nRrLNvVMmrCrT/4JQwCkmgSsvQK55rBZh/ZpneEx97phFuouKxJgzxM6rXvoQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ2PR11MB8538.namprd11.prod.outlook.com (2603:10b6:a03:578::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Sat, 20 Jul
 2024 19:15:55 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.7762.027; Sat, 20 Jul 2024
 19:15:55 +0000
Message-ID: <fcc4e0d9-7218-4fdd-a1d9-56636e540ba1@intel.com>
Date: Sun, 21 Jul 2024 00:45:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Remove function xe_device_canonicalize_addr
To: "Souza, Jose" <jose.souza@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20240715105555.2220444-1-himal.prasad.ghimiray@intel.com>
 <20240715105555.2220444-3-himal.prasad.ghimiray@intel.com>
 <dc1ba1cb5ec819259dda071b400323926f2e360a.camel@intel.com>
 <84b81613-0580-4baf-85fa-a1025df8d8d2@intel.com>
 <1bce8ff9eaf181193401ab2eaa4337a4f9dd7dd9.camel@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <1bce8ff9eaf181193401ab2eaa4337a4f9dd7dd9.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::10) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SJ2PR11MB8538:EE_
X-MS-Office365-Filtering-Correlation-Id: 37d8d255-5845-4bc4-3485-08dca8f060b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QlZFR2x6Zm1USTFIcXlTczB2OUJ2M1hxTjcwSmRxZjNRRUJNZllqQ0ZaT3FU?=
 =?utf-8?B?WlpsaXN0TVJwaEFKMmlCazhPZjRFT3RjS0pRNXV2YmhJbS9GVWd3YitmTjBq?=
 =?utf-8?B?eDVNajYrOFJTODhZRlMyNnlWNmZaZ1psdUZZWkhheGU3SG9NTStpWFpGdCtE?=
 =?utf-8?B?dExZWDFvK3NKYmlEa2krc1FOZGc2YXo3azV1M0NZRHRSem1XZm03TFd4dnFK?=
 =?utf-8?B?OEFhNmhiK2pIdVV4UkpXL0xmbVRNbHp6dWdiaStzY0M0OVZyV2tSRC9pTUJU?=
 =?utf-8?B?cXA5cWtBcm1WZDQ5UkxRRlNZbjRtZU42aWpIWXZtaHNsRXNqUGZKWjVVRkxx?=
 =?utf-8?B?MmhUUmk4ZFJyTDYvUGZRNzJMWDBJZHNoYTl3Rzk1NjVna2dOVm03TEt3QkdZ?=
 =?utf-8?B?S1J4L1dEc0U1ZjhWMWZ3U1BtZFh2N1VNcEtsSUwrMXFHZ2pxWG83R2RHSnBl?=
 =?utf-8?B?eU56THFsRGRNNjk1d0U2U0RITytGWmpKVjNKeXp3dmVRTkhxakc5TG42WHFF?=
 =?utf-8?B?S0hnYXB5ZUQ3aTl5bWFKU1k2eUpDQkNuRy8zdlNuVWhTbWsrS1J1ZGdydWJq?=
 =?utf-8?B?aHNjNFZSVFdlS2hlVXBvY0tTZ0F0L21qdTRqZ2dCbnZtcE5CQUREK3N1NWlU?=
 =?utf-8?B?cUd4SHJRakRVd1ZaR2d2QXZEK09mS2JWREU5dE9nTURDRlMzK0VvSVZwbWp2?=
 =?utf-8?B?TGhGd2NxNjdjWnRoay9RY0FGOWdSWjR2UytEbDR1YkdUMjNSWWF3U25NWVdw?=
 =?utf-8?B?d2d2WEg4dCtmNTFobHVmK012bENnSEtDNTF4czNxaVp5Y0gwWE1YdUUrTkp0?=
 =?utf-8?B?N1pONGpZZG9odlJQT0dndGIybFhKRVlvZzFjT0UyVE9hYjhFT0tVVVJIaytR?=
 =?utf-8?B?U3A3VmNkWlQ0ek0ySGlseDRLZG5WU3VsTmtxMHpnNlZNT2ovellBWjVhQjUy?=
 =?utf-8?B?dXJoSSttU3BHVUtrWksrQ1VpUDZHMXovZlVGWTkxN2J6akNKaVJNSVArdjdr?=
 =?utf-8?B?S05BU3VJa1pXaTRTMlRSQ0ZZN2hlV0ZqVXUvK2ZaMUJ4RGtOR1dQdjIyWmlh?=
 =?utf-8?B?dWtab1RTVC82Qi9sY09PSDFsc1U1alJTaU5qT0Ira2ExYmVpc1JqQjRzQkRL?=
 =?utf-8?B?NlltM0ZTU1RuMFExcC9QaEl5OEEwVTRxVE93TGRFdG85cHYrcTFYWHRuN21B?=
 =?utf-8?B?ODhOTGhJSmxOOWp3ZGtjRFd3UUFEQ2R4RWdhbzVsU1NZaU9KS0ZYQy9yK2lw?=
 =?utf-8?B?N0lWTHZZMVZDSTBDREpjOStMb2J5ek85MHpSY1ViMW5yU0VpbjZtWDE1K1E4?=
 =?utf-8?B?cERTODRCZG1pbXgwd244a0ZmTUtGRUZGb3pJQk4wV0dqZStycUlmVlE2b0xX?=
 =?utf-8?B?RC9yRlp1NmhJTWFtNTYzOU96QnNFZ01tVUpMWW9iNTR3K0xrR3pTTWFudlNZ?=
 =?utf-8?B?VnBBWkhLK0VjWDZqcW95aEZjYnlWajR5QmdYckdOM2hhOGRTcHJ4Nno0NS80?=
 =?utf-8?B?bmIzMlZkQ3dlRFpOeVdZNDVST2tzYTZmREc5cjN3cmdPM0VyR2FodnRCeGZh?=
 =?utf-8?B?ZWwvdDBNZS9pV0ZLVUg2S0lCa0hYMU1iNmtZZXJmYXNDS2Q4ZnNMKy9WUTlC?=
 =?utf-8?B?V2JscnR0OGFyQUhNTU0wZXdHenZWVTRFOStJbVdzUXFQVW9ReUJ2NTBsYmJ4?=
 =?utf-8?B?ejZnb2ZKWFpscXNCUDEyTHRweFdCZWZxUHozY3hDNmJIaExhbmJadDlaL0Rn?=
 =?utf-8?B?UlZtbG1pVllnZjlwa2FwVEcvc0RXT1pYcVFqZWN5em5nZ0JxUWNEQW5LN0hV?=
 =?utf-8?B?MGg3c0JKMXJZV3dodm1RZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkhJeWZza0x0TVYzdUt5bmppQmZka21USC9pSXZmcHFqZTF3QjJJcVgxS1Fr?=
 =?utf-8?B?cGtHTnVsU1F2Y3hUZUw3aUhTMGJvOCs1N3RYckZRNFdEcjdkRXI4Ly9MT1Zo?=
 =?utf-8?B?THQ1RkZHYWcvSmJtZFAvc09YU1VCSm1Wd0cvNGpKc3NxZENjRzE3RE9Wd3Bl?=
 =?utf-8?B?MEkzdUI2dWRURFFPdXRxM1luVk1vMG9jTVFNbTAzMWdYK0tmVWZwSDR2VjNm?=
 =?utf-8?B?N2RmQ1d6K2lIMVVnd0g5K0hZQ2pMYVc1Y2pZc3U5azVYWFNiSFdSOERpZ2JO?=
 =?utf-8?B?ZDcvOXBLSGVMa3craG0rWTNsSVk4MkhUYkJWUmIzRWM1RVBSUExLWWd6aWhY?=
 =?utf-8?B?Q0ZmbWFzLzRBdzdBRi9FOTJZQlVOMXdiQzJCdnRBOURoVjI0d3dDVEFhK0ts?=
 =?utf-8?B?ellveTlDWnB0citmSDhQQmFzc3dsNmFmOFRMU1JGOWpwMVQvY2IrZzFuaWUy?=
 =?utf-8?B?Lyt0aGZpQ05GcUxmdjRoZHVTTTB6aHdLcjNpV0cyMkZTbmV2S2V6U3dTSW1i?=
 =?utf-8?B?OG1kVk5VamQ1azMvcU5PcTZrbC9scGF6QVArMGVJWGY0RkphZmJwV0MyMkJq?=
 =?utf-8?B?a2lXdDJUNDdCTENQVzB2V0JFZXBUUXUvL3NNMWY5OGd2bnM0SkJORG5LR1lZ?=
 =?utf-8?B?eGdWRkoxbUZXRjZyd3d0dGgxVUtocWRabG95bGxNNktIdUQ1cWdMMXppUFRW?=
 =?utf-8?B?aFpLdTU0RzVKTGd1ME83dHQ1NVR4QWhra0REbDBhYi9oWThMWE91WkFkK3Rp?=
 =?utf-8?B?QlYvN0tpNFBCeXJVWHRmck5SSFhYUk5LcmRXN3h0M0xIWkQyeU56OHNERlFP?=
 =?utf-8?B?MUdtYTYxbFRWNVlMYWdlZXNscTd6RElUckVvRC9JbEFlK25EbzltRk51ZlIz?=
 =?utf-8?B?Z3c5NTV1TVJEUXJqS3F6aUkxckxGRFhNNFhEVXVnMUZHUFdybWNQU1MwRzlZ?=
 =?utf-8?B?VCtyMUtHblh4dGViTitnaTByRjZhd0FIZ3pSOTdyOWs4VkRDZC8yWEJlV1BF?=
 =?utf-8?B?dW5tclFlQndad1RKcmlrZUtFY2x5S0hBdXpUODlURmxwSHpoaVcyVDc3Ujhj?=
 =?utf-8?B?UDVRYStJNmpqb2JEbTJ5ZE9CRG9YNFJPRnh4L3lxK3dlYVJxY2ZUWnYzejZW?=
 =?utf-8?B?cEtlNFdScmdjd3dBWFovR1plMytrUXBHc1dEanpRRUNKYjNMYVIrdUZSSUxv?=
 =?utf-8?B?MGZUSmdsUUlBRFVNcjNrcUlON0E0UWlQdkNvOW1rb3hhL0N4T2huVzhVWnNE?=
 =?utf-8?B?alBVREhNYmFMT1RleVA5VCt2Q2o3UEM3OVBsSHIwWVFsaTFhSm5sb0VvTWVV?=
 =?utf-8?B?dURwL21ENnVqZVYxTjhMcVdCMzF2dzZnQkZrQ0dyUXZRbTVqOXVGWGF0UVJ4?=
 =?utf-8?B?T2FiWURrVVdZQUpjeVdPTW0zUkNXUUdOa2VPQjZsOG1JVkdONGNqZXRIeWZT?=
 =?utf-8?B?S2NtRUNVMExGOS9PZUFoeUVPYm96ZFdJcGxFck9UUXo5bzdWTnQ5TnVkSEN3?=
 =?utf-8?B?eG51OHAvT2dTRnBIWGc1MVp5b29ZMmZLbi9DZHZ0dHNVaDZrVzI3QUFESFR6?=
 =?utf-8?B?dTBWS05nOGRONisxSXV0R0xIWE5LZVdQSHpPUVk5bUJYUE5XS00wci9Ldmt5?=
 =?utf-8?B?TXhGMFB5NU54eEpzUWpOcnZTa2ovVnNOZWlIUzR3VFpkQkYyd245T0loUHRF?=
 =?utf-8?B?YWJVSHc2S2Ivekltc1JTdFY1Vkw5elMySHRmckVmWVdnWGpjdVBrdGE5Vnoz?=
 =?utf-8?B?ek9IZWw0TkZWQ2MzMURuTWh1ZkQzVXZIcFhuNG1zT0VUU0RPY3Mzay9QZVd0?=
 =?utf-8?B?aSt2RFBQMXRMMHhOcmtoaVE2ZW1qUU5xS0E2UXdLbTZxbkdlSTJGM1cxbWhy?=
 =?utf-8?B?YjhUdUlzUWpJUXNlM3g3U1ovTlF2cFJGVmhtQm1Ra0JHWXYrZ01SdjZqZGdU?=
 =?utf-8?B?MTZBTERzaXROQVhoNGRDT0ZrUjNYVStOM1laUEVreUNJZUJnd1hmWXlpQlRY?=
 =?utf-8?B?d3ViQ2xKWDBwcUdNUlRwVnJ2SkpwV0hTcnR4OGdhanBYZnZTSUVGN2NiNXE0?=
 =?utf-8?B?a2c4OU9SUjFTNHZSeTliS1RPL3BPQlNGaDFyMHFYYnI1Vm1sQ01GSFhNaVNk?=
 =?utf-8?B?S3FTN3IwUXBWYnFURVB0WWlXMWZaZ0RrZDBtVTk0STltaEhqbHRYL0g2aTZn?=
 =?utf-8?Q?PRpEv5SowGdqJ3UflUW0jAw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37d8d255-5845-4bc4-3485-08dca8f060b8
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2024 19:15:55.0859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BH5WHLW1fdPGRa17/0Rzrv7f9qoxoyAXFG858zIbImJZD5ZPAJkTUhJ8+7yelGg7O774RJKs3BWRQ585BjbIUgt2VN23qsCuMGEd8JDPaBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8538
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



On 15-07-2024 23:44, Souza, Jose wrote:
> On Mon, 2024-07-15 at 23:26 +0530, Ghimiray, Himal Prasad wrote:
>>
>> On 15-07-2024 19:35, Souza, Jose wrote:
>>> On Mon, 2024-07-15 at 16:25 +0530, Himal Prasad Ghimiray wrote:
>>>> There is no need for converting regular address to canonical address in
>>>> driver, therefore remove unused xe_device_canonicalize_addr.
>>>
>>> I can see several places that should use it but are not.
>>> Like every place that does xe_exec, the address needs to canonical in Xe2+ platforms.
>>
>> Hi Jose, Thanks for feedback. Isn't it the responsibility of UMDs to
>> call xe_exec with a canonical address ?
> 
> Yep but xe it self also does xe_execs.
> 
>>
>>> We are probably not getting any issues so far by luck, so I would not remove it to add it later.
>>
>> Can you please elaborate on what do you mean by luck here ?
> 
> We are luck that so far none of the xe kmd internal usage has a batch buffer with that address that sets the va_bits - 1, if that happened the address
> would not be in canonical format and HW would not execute the batch buffer.

Ok got it. Thanks for the reply.

> 
>>
>>>
>>>>
>>>> Cc: José Roberto de Souza <jose.souza@intel.com>
>>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_device.c | 5 -----
>>>>    drivers/gpu/drm/xe/xe_device.h | 1 -
>>>>    2 files changed, 6 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>>> index 06cebaffb451..eb3bb434b180 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>>> @@ -885,11 +885,6 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p)
>>>>    	}
>>>>    }
>>>>    
>>>> -u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address)
>>>> -{
>>>> -	return sign_extend64(address, xe->info.va_bits - 1);
>>>> -}
>>>> -
>>>>    u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
>>>>    {
>>>>    	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
>>>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>>>> index 0a2a3e7fd402..14d4171c467e 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device.h
>>>> +++ b/drivers/gpu/drm/xe/xe_device.h
>>>> @@ -158,7 +158,6 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
>>>>    
>>>>    void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
>>>>    
>>>> -u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
>>>>    u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
>>>>    
>>>>    void xe_device_td_flush(struct xe_device *xe);
>>>
> 
