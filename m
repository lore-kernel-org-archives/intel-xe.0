Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA0FCCCD183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 22:21:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B73810E0DE;
	Thu, 16 Oct 2025 22:21:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="biUTyPZ0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C063610E0DE
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 22:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760653268; x=1792189268;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0KPtwgXmTg8MBKUGHKH0qvEJgnZ1/4OLR1OlEpYM/CQ=;
 b=biUTyPZ0S6NoVhEAPdcSLzGCjbSZb+nJpGQMqTVWGdasKEcw1yRVoNsb
 mw6JSbNC3d5lRSOJTlZFNA9iUBYiEY0KNWbArIIxorjxCf0atdURXQlic
 84AvTeOPJ9rd4Y4BfEZnIn0akx7b8SYssvDLRWMLVa0iVlnk7mkNCnAx1
 +SWqfFjN859FnQ717lhOy5tMR3+dqjNvwuN8HRyGU/mUe3l7nTRtYhL6D
 xeUPYtQctAXmbEPfwCPrIBDtmLkklr3Xp7HKfETortsAaDTyaYEVK8mmm
 YTQ0wDT29QXjZ9P8yjvroP3OqY7eeHaKQiteXO8tH0hBCverMveycc7lp A==;
X-CSE-ConnectionGUID: ElUv/YMJQVa7leEVv9YZdA==
X-CSE-MsgGUID: zo5jHtTyTlyaaG4dDJ9xbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66724988"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="66724988"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 15:21:07 -0700
X-CSE-ConnectionGUID: RUIYmr16RsmFoEEBzYXIiw==
X-CSE-MsgGUID: TJE5tYo8Rv+zZQSfXKVfwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="182368662"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 15:21:06 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 15:21:03 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 15:21:03 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.23)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 15:21:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XqRB6FVq3yea2MXyuRmCdqk1QndQCi/qdIpWAJ3SYJrcixDRi2TW33ePbT6nS+G36qxPVigyvgPx1edbYqVF1QPFO4ZWQuha5En8WCU1unXIEoiB2uka2U/4KhbajNUt4acQZdFRUGA/b7Ec/jQnP5/BwkeNlHoeXA7c6JTAG8zdIaithPHiMNBlirUszwjfsdySgLG0mzInaz1Z3whMfkFANu9WV+VAaiZ/z8JsSJ5iFGLsKGfv9ba7sSQC9dE1LUq0T3LwwxwAcgweJIrT1OV9eVowz+3Dqt9Mr+1ToNM4Ys4JornAsMWhuvKA5YUVrxmCD9b02MkD2ia0AN980w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2zEj3IAYSjbRXC4XIz4+uldkhb9bsIGbBeu5jClSVc=;
 b=JkgkDbVH80/q69yqwyez8jwGZJkz3ZMpRuigJRaRLQxjoptds5bVIm0mhevCM2dRZBkkdZAp7IGNFKLK/EaESbVG0XJAy5zxPDUMudBlIQfMt5ZYFH4qDnzFjuBwugz4ZIGQvEUt0f62L7nkeXZpaZmudtmR4msZi9Sb+mpxSNZnW0d1mCRq00Vw6ZKicN6H0dIKnRVyz+bFtLPRj/PuM9B4Ndru1n/aL+JIie3UpoEX9+HHUgeSM/ftlhznsGusTgCrx8Fhm9BXeekRd1SXmEU0ymbWdkVNtQEyjHs2pgAf/fpnT4l5igby0NTtZc5TDVkNAJVVSJQxoTC1+gaX4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CY8PR11MB7315.namprd11.prod.outlook.com (2603:10b6:930:9e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 22:21:01 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9228.011; Thu, 16 Oct 2025
 22:21:01 +0000
Message-ID: <d3d9ae10-5128-47cf-8c6f-3aa9ec9f0202@intel.com>
Date: Fri, 17 Oct 2025 00:20:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] drm/xe/vf: Skip fixups on VF migration before
 getting GGTT info
To: Tomasz Lis <tomasz.lis@intel.com>, <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
References: <20251016120511.856792-1-tomasz.lis@intel.com>
 <20251016120511.856792-4-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251016120511.856792-4-tomasz.lis@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIZP296CA0021.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a8::7) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CY8PR11MB7315:EE_
X-MS-Office365-Filtering-Correlation-Id: 43639172-9b50-4a4b-2217-08de0d0249b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eTY5TWZDMlJ3NlB6NU1JK1RXYktmdUtnZG1zUUloRE5ldUU1WXFxZXFXdUoy?=
 =?utf-8?B?YzgzNVUyWll1R1JSUG16MTIvRG5mdWxQVzJ2cklJRkJiT2s3RVZsMHUvekt0?=
 =?utf-8?B?SUNKeWZuT0Eza0hTMEgwMGVQdVcwKzFjaHFSY3lTMlB6cnpHUFZNOW9uWkNB?=
 =?utf-8?B?Y0tWenZDUnVWZEJ6dm4wc2N3VjM2bCtPamxwbHFRMHJTZWUyQ1ZXSWNMUjhN?=
 =?utf-8?B?bEx2STVXa3ArcEZkR2ZaVzdZMWIzN2NFV1MvelFaaFZGRWsybFNHeGZRKy9h?=
 =?utf-8?B?NjA5L0ZMUDBBZndzbEFoeU5mK2VqK0Y0UHlJTHZrR2dLcllJZC9Hd1FPQ2Fm?=
 =?utf-8?B?aG5GR1Q1cnQ3dGE4Z3luUTZVcXdYUmZkNGlvUGtpcTFvWEYwT2ZrMjJra1FK?=
 =?utf-8?B?NDJzTW5ZRlhZUVVUWURhWkhRcmJNd2diMFdJZkVjdllmdGFGRW52WURQZTBN?=
 =?utf-8?B?TkJhbkhhbU41UkU3dEFUU3c5bFM4ZVZWS2VHV2p6eDRQc0ZLa3dkZWd2MStN?=
 =?utf-8?B?T1NBTTVoOVNtcHUwZS9kUURHaDYxWlRzOGdDSno5SDdVUkM4MmJqS0JxNFhn?=
 =?utf-8?B?L3hYOTRCd2xRSGEwbjU5Z21vNmZrM2x4WENaZU8rTjVjRnpkSTVYVi9naVUy?=
 =?utf-8?B?S0JHSXMzUFN1WG5MdEMxcGlrVkh1RFBOcTZKZ2V1VTcraWpRMzA0VjlSdFVZ?=
 =?utf-8?B?UTZsN3crUUQ2VFpqV1k5RjNQdlF3N1NWTldEaDBLZGVuckdRK28xLzA2U1F4?=
 =?utf-8?B?cnpzZ0ZpUTVRaVVMeEFOdEtZYUJpWDQrNjAxQkVOcXRzWVhzOFFqTVIvODJP?=
 =?utf-8?B?UkdyenE1bmJPam81VHNRbGUwMEpRTWNUZ0tSaU55UjYraEp6WEJNSm5SVm1u?=
 =?utf-8?B?MDB1cGdGWEFCUURERGpYUElBdjNhRXhWWEZQK0xBTTF5MkpKNGtrMWpCS3Rw?=
 =?utf-8?B?aGlUOFB6NU43TWVTd3ZjWnRPa0tkcTBOaWFlMXNlUHR4cXk4dlJING5pek9F?=
 =?utf-8?B?QTBhcjg2bmlIRTFXV05WZzBUOWVGaUFJZWc4Y1FidWN3L2pqUHJzTFk5bndP?=
 =?utf-8?B?aVFUeWN1aE5YMUF5Y0NjZDlKUm1lTHNEdEtEK1FNUVFleXRkdU4xRjdEWVJp?=
 =?utf-8?B?RS9tY3B2U2ZuYlFFRkZ5dFA4cDlGalh0a3NzTk95TktqQmF5S2RpbFJpT1dH?=
 =?utf-8?B?cTROMXBoNzlIa2hMYzd6K2M5UWRDUVNOelBNYVZ0TXNtSFA2Q0luWE1QUFN1?=
 =?utf-8?B?TWt5OTFadVJsekRzZStTZHNiYWYyNkt4MkNuc0tJaTlYVmhLNjhLakp6cVl4?=
 =?utf-8?B?Rk5XT0QzNU5LeFduRi8wd1VYcUI1R1dTY2VLWTMxcmkrRjJiQ2Rzd2tkMnR3?=
 =?utf-8?B?cXl2RmJXOE53Zm9CMUJXZkZCckVaeUd4WUl5MVpmWG5pQkQ0MkZuQXlHb0Zr?=
 =?utf-8?B?V1F2UHdiSEJCemV0M2x3S0NONTVtV2hnKzF5L1pWbkpZa1dRUndnbkwrSWc0?=
 =?utf-8?B?a0tneDRpUGNaN2srT1BFUVVJc2M0NEo5SVFNNmJaeEMxaVcydWRpS0IrZHZW?=
 =?utf-8?B?TkNIOXAraTROM0dLbGNHcmVDMHlMa3VmY3JQUjk3eHVPSzBTSUhtUXFyKzlt?=
 =?utf-8?B?NkZuVzZZWjJ2QjR2TUJDWk5zcUdtZlJTdkpiSVNwaWdPMEhQNzBwWnY0bzg0?=
 =?utf-8?B?Rm1tOFdqU2h0R2N2bVkxbkh6ckVKVHc3Mk1FeDM1LzJKVVhTRzQ0b2cwVXpS?=
 =?utf-8?B?cGJaVHRZQlBWYU0vdVlHWFNzbUxIMFZLcFBjTE83bHU5SlFBa25wZll4Skhp?=
 =?utf-8?B?MklUNFY5NTl2Qi9SbnBBWHlSTGRzQmNJQ085SnZEd3lwMG1ZVG43aSs1T3ND?=
 =?utf-8?B?QzA1dDlYbFJ1cnZSRndqeFZScFkzcThZY2pyaWFXMFo1MkFFYlJBVlJJTWxZ?=
 =?utf-8?Q?KSZV6sOReG6E/Hx0sebaod5T79ydjTOX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDkzWHdxR2NoOVl5c2JqdWJ1MzRUR043azNIYUIwckdLL1c3SDNhck9GNlcw?=
 =?utf-8?B?WjB3ckl3QlBiN0MrS2NKTVljblJnMm1aRlRwU0RBUHJ5WjlLa2k2ZFAybUdp?=
 =?utf-8?B?cnJhRWV0L01vUG1wWkFMKzNDVUhMQ3l5QktWb1VIaS9TRjhFcUxzc2grcWtY?=
 =?utf-8?B?bWFCMVp2Ty85emxJTzdxSWxSY3Z2bXo2MXduR254ak1LQU1aVUozdzV3VFBM?=
 =?utf-8?B?dGVLMldnbXRld1N6M0laM2dLdTNEeERWeFM3bnA0VTJkcXVoV2hhcHcwbUFt?=
 =?utf-8?B?WXM0UGNocXlLV0FIcUowckh1RGFhbDJmZjdYbXRmZlBtZmlYVnFESGZsQjZB?=
 =?utf-8?B?Q0dCMXJ5L28rdUV5b3RtVVNmZzY0RVpYRDhERDNUWTFHRm9CdDJFekM3dDN2?=
 =?utf-8?B?bFdCaXJQSjhEY2tLUW84Q1FycVpFdTZ5bytmQklUMi9SN1ZEQlZ2UFg5VDRq?=
 =?utf-8?B?MzBqbGFPREVMNWhhN09HTUdWZ2o1Qm1OQWNvL0RPU25pdGF0Y3pGdG9RL3Ri?=
 =?utf-8?B?WXhIU0g5cE1HQkd0M3YzRERjOCtMS0E3RkRYVnZWQnBRUk5pTEkwSUs2NjFZ?=
 =?utf-8?B?Tk0vbGhPU0tDKzlDMkUxRHJSRmQ0eVJSR0VrWUFmRDU4Z3U0Q3JVNmxpYjBF?=
 =?utf-8?B?RU5Md1hSNWxET2ZWYlVtdTViV01YbEFqN0FIVXl5amZBbkF2dFliNEMraDIw?=
 =?utf-8?B?c0NzSTdUR2FMRXJ6bzNSSTZGd3hDYkgvRTZ4OUd4NDRjRXBQT3RVazJGcG5l?=
 =?utf-8?B?WnRyOWQ2ZGFxWlhKLytOTE96V3ZVU0Q1TXJtcWlMUUgvVUMzMnYwVVlNejZk?=
 =?utf-8?B?ZUNOeTdMbGl5cHZndmNySm9sRWd3dldONE8zZWQ2OExCMzRocVd3QUkyT3pm?=
 =?utf-8?B?MVQwZldxMFIrcXFqVzc4cmt0dmthUXhHQ1FmdWl0Q0lrK3M0ZThwRmhYRVZ5?=
 =?utf-8?B?NEFQTS8vbEt3K2tpQ3B4SnNibXEzQURCcytTcDFLQXdXbktLOElTOHFmdHM3?=
 =?utf-8?B?cHkyRHpvV3RNNXdjbktncUVRaTM4bkpqbzhsTXFUVDhhRVdCMjdoY3pqS21l?=
 =?utf-8?B?ZDk3NEdRdnFXbVZ1Y215bFl6VjFQaFQ2dVpZaURkbXMxdTBsVk9YQmxpb3hs?=
 =?utf-8?B?czlYdDlpWkdlSUwrZkZ0Rmh2c2xpQ0JBdVBlQ25TbFdPU0dTYTZ0emYzcjRY?=
 =?utf-8?B?OWhzWjlZYU9HSkZHYVEyY29nQlBjTmtWTTFBT3UzL2Rkby9Cc0tJQWliQzhx?=
 =?utf-8?B?TmtYVVA1VWJwRlZCMTN4eGJDTTE0T0pJV0MrV1Fsc2djZnVKZldTdUM0dnNi?=
 =?utf-8?B?MmZ2SXhmZHRIRjdxaEhhSkQ0enFYeDI2a2l2Ui85bm0xQ041ZDNXTm9WRjdI?=
 =?utf-8?B?V05XYVh0VUFCYkJTdm1lRGd0T3BZL1dLcitteldVZER2eVZDWStGVTMxVUNB?=
 =?utf-8?B?c2lUYml5bExIdlhUQXRLNGcyWW02bEtiS1RHcDNaOXR0UTFBeDV5SXJQZGEw?=
 =?utf-8?B?cnB6UXBRTmY4bkwrTWhXQm9lWkpXZUFJUWlHU2IzOXBhWExieXNxWmRtenk0?=
 =?utf-8?B?Q1R4cHBpL2J3R0YvazAvWmpudU9FUjZ3azlGMUVZTGFMWkNEdmpxUk1OY2JQ?=
 =?utf-8?B?KzUrdjMxS1c3TW1MMnF5b2tRSTVpcEt4WU5KcGE3RDFNUVNYTUhON0NjS0Vz?=
 =?utf-8?B?NEdBMnlKMWV4VnBJbzJQdmdIQXlTdDJOUEo0SXRTZWpKbEUwL29KRTZzV1RO?=
 =?utf-8?B?RUUzbk4xZllJRDV4RnF6eXllOCtuYkwzRU16bDFQa28yL2FxZFU5T1VzTUlM?=
 =?utf-8?B?UGdDM2haLzVGZVBTeGVQZFpwNlk5RlFoTnJVR1M1U3VDR254U2diQW9KNTVz?=
 =?utf-8?B?N1Vsb25JOW9LSmFOMjB0ZVhTSWFxM29jVE5BQjFxZzFJMVhQSm9FNGt3ZVBp?=
 =?utf-8?B?R2s1TWtqL3pOaHdGTER6UkRIR3dsc2FYekNFMkdMUjJYekgvRXRnRGROL0Zt?=
 =?utf-8?B?YUpsQVBzWlZ2VWNsZk5PbHl4WnJBRS9jOEhON0p5RzNtRDkyZ2M0ZFJMVERO?=
 =?utf-8?B?SjdBYnBnQUc2MUErTlJZNmtjdVRvZlI0ell6UVZaS1JOVTQ0RkY0Q1JOMmxV?=
 =?utf-8?B?RElVY2hKZmE1UDRvR20wamlmdDNnOU40c284cWl6c2FKeFg3ZGlHWXdJMDU2?=
 =?utf-8?B?YkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43639172-9b50-4a4b-2217-08de0d0249b8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 22:21:01.3461 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RS6Lv9E7QO+t1mwcML0/ndh8qggIBpP11SZAn5uB3BiHAjGxMaosZqc9w8oKGNLIZ7dJC3NACo2v7cIUISmshm02oDciqW2E2gEA5W12eP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7315
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



On 10/16/2025 2:05 PM, Tomasz Lis wrote:
> The GuC RESFIX state should be achievable only after a successful
> handshake. If VF KMD has no GGTT configuration yet and we still got
> into RESFIX state, then either we're dealing with unclean initial
> state due to unusual actions before probe, or the migration
> happened while xe init (started by probe) was running.
> 
> In 1st case (VF migration before probe), we should just skip migration.
> Init procedure will ensure exit from RESFIX state as it starts GuC
> handshake with a reset.
> 
> In 2nd case (VF migration during xe init), the migration procedure
> should execute normally if GGTT configuration was already acquired
> from GuC, and can be skipped if it was not acquired.

we initiate recovery as part of the MEMIRQ handling

but to get MEMIRQ interrupt from the GuC we need to setup it first
to setup MEMIRQ vector we need to obtain GGTT data from GuC
only the we can register this MEMIRQ vector in GuC

so valid GGTT data seems to be hard prerequisite for this scenario

thus vf_ggtt_queried() should be always true, no?

> 
> This solution will avoid crashes due to the VF migration running
> on non-initialized xe sub-structures. But it is not enough to allow
> fully reliable migration during driver probe. In particular, the
> situation where the probe might not end successfully, is:
> 
> * The VF is paused and migrated after GuC reset (vf_bootstrap) but
> before config is acquired (vf_query_config). In such case, GuC may
> remain in RESFIX state, leading to timeouting requests.
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 34c68de6e2f3..bb0b71a47125 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1149,6 +1149,12 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
>  		   pf_version->major, pf_version->minor);
>  }
>  
> +static bool vf_ggtt_queried(struct xe_tile *tile)
> +{
> +	guard(mutex)(&tile->mem.ggtt->lock);
> +	return xe_tile_sriov_vf_ggtt(tile) != 0;
> +}
> +
>  static bool vf_post_migration_shutdown(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> @@ -1260,6 +1266,11 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>  	xe_gt_sriov_dbg(gt, "migration recovery in progress\n");
>  
>  	xe_pm_runtime_get(xe);
> +
> +	/* If during init and before GGTT configuration, skip the procedure. */
> +	if (!vf_ggtt_queried(gt_to_tile(gt)))
> +		goto skip;
> +
>  	retry = vf_post_migration_shutdown(gt);
>  	if (retry)
>  		goto queue;
> @@ -1282,6 +1293,7 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>  
>  	vf_post_migration_kickstart(gt);
>  
> +skip:
>  	xe_pm_runtime_put(xe);
>  	xe_gt_sriov_notice(gt, "migration recovery ended\n");
>  	return;

