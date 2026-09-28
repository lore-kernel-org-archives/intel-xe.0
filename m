Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB500C9832F
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 09:25:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3BC10E6AC;
	Mon, 28 Sep 2026 09:25:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KA1XyGBL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA0710E6AC
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 09:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790587525; x=1822123525;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0xJgfeVAWgo4iexgawWr9KJrA7jQaqHkg/O08h0pAYU=;
 b=KA1XyGBLxk9bpyEjt1UfgUKmsuED8xFsAbFwm5wtNd87ul4OrO4KlGZn
 gdW6Q6BEY57GXlGrLaqmDUZWF4HqRt4Xs75WyNAT/0uNzPM3v8FOxOwi2
 FrST5b1OL71fyr8TM+QQIo58kCKxkqcHT/kWyg27ohF/07jHDMGbcLmWf
 p9rDve5vEsM7rmvrPdjUOymjOPCkkS6iKgeHs3qoot/2qHFDbmIXKa/Rw
 gCDLTXKJk3R1uBxuFx7yXLPY5GK3KeQnCUnjwFJbye1k3n8kQ7KT3WAfl
 ztD52GMhhKGyZqldANyC1OKpX2G01hw7khhXTcXQbgQK35AzgE7kl1mgb Q==;
X-CSE-ConnectionGUID: y+LlklV2R/u2LLTQHz/zeQ==
X-CSE-MsgGUID: f91q0PKSSxS4NeQ9H3reRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="101449467"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="101449467"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 02:22:55 -0700
X-CSE-ConnectionGUID: G7VPhOXoQsSpHRTVjgUZ5A==
X-CSE-MsgGUID: PjWcF4JhTkWYkXBxixMKEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="278207735"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 02:22:54 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 02:22:53 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 02:22:53 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.0) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 02:22:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q9bIlUOrZW/T0skpTkXEM5uPyFVt1yl9Oin4l6PhVweO2J8TEowNz67w/7l/5k6uxEfIeLpTBibiDCcl8e/t0wjuQqbg4dDQqr3oeRbmPJeQoUxzuyJPonhUzFfhxYoBVsUT4WyIeszfyYxYHuGMMJNSSLmt/2Vx2lfzIul0mVqlYiX+A3X7Adbiw/twqRJiHJ697wDhLdKboIBS+GGdBSzqRWOCvtKvx2BPQUTpcetKP9qkSBvHO9nIFECTPbigDGDTVmDENukO46GJYn16iI/qvdAMP/qXjMC9zXBI/aj3U5qX2WgWRpXl0jO3UvUkv+RsEc5jrHq00EwALNvF1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=84JTzH/DMD2NM1noj/BLyQ+A2m+ddJA8uxEETwe58Rk=;
 b=q6pWBSOjP9r5GmoVSu5OfTqcfck7Ep3ZBA6leKg1gmUpIRk4yIWvcZ0T3PPfCXLFSg/I3au99z8DIJrzlMT4GuZksbKKGomr3Of2kEi7GQGQ7FEXIoMi+YlyQfDCyhsR68tz8b5lPoux5eButFknFDw7ZUn5KZmHP1+1Uv/IpTIus0r1gyJeKRaMtF9QjojmIG69fVjwZ6wd20o9pNkUgobEKzJndWwI1r+W48WmZBDaTlP8W4JlE+VaGA7hYr+fv9xcrHZnpsNd4I/0m6qswL3zo/KbL4NngMmC0FN6uA0dub4ky21SuZp9dRvMaeZ7hVXTVpagc8eQQIrBb3jvtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA1PR11MB7856.namprd11.prod.outlook.com (2603:10b6:208:3f5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Mon, 28 Sep
 2026 09:22:40 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 09:22:40 +0000
Message-ID: <1969ea38-fc1f-4b57-af28-da50e76b3829@intel.com>
Date: Mon, 28 Sep 2026 14:52:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] drm/xe/xe_ras: Track offlined pages by firmware to
 avoid duplicates
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <tejas.upadhyay@intel.com>
References: <20260928061830.417395-8-riana.tauro@intel.com>
 <20260928061830.417395-14-riana.tauro@intel.com>
 <a1741726-0042-4133-ad2e-fa6633f7e002@intel.com>
 <725c0e92-617a-4729-acb4-c31efc2facb2@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <725c0e92-617a-4729-acb4-c31efc2facb2@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0233.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::14) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA1PR11MB7856:EE_
X-MS-Office365-Filtering-Correlation-Id: af585316-2fba-4669-0e7d-08df1d420aba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Qeaktm8krooLvTC3NIvUUUUTsUTiVR1lS1ATswX7sB/CU0VFjb9yyKyY7Cfk/Nis4p2vyxt1kYcZVpRt8v6axsm1rdnXPK/3KwTLXUapXOhEtB83ExQZ8+MT+7vh4UAlow+1qQiOZg3WFWfscldaIbTCzwwtJOiy5ZcKEIUvogwnuDtR35SAwOuLFFnWnI50QUGyvR4HawJE/MyzcR6EVXeTmkj9V4vJxL/qoNZRDrCNXPCxDg/I23V4zAvwN3ZK12x0YuYAY04OEForrrwbmOBXfK1JGyiY0I6ufX6x7rLngcQgR/jwvVmbXpkToiYiFkUQvUpJtgN8w+OKJAE3U2JUzNACYwEHMp0YuOuqzxYyLGHOMXesA7tEnlOE4NvPiA/dVTPEkdtlYsP7nuSb3Dg1nzXp5nCL/T012u4Np4AyiOkikDxSpXSMBUAfwWc+NnrIhFM0HPEcPPGEaPc99Eu3QwDTXEyIZgOsGp0AJ5j8dstX/6Zo31n1e4Q0mcyiwoEgJ+o1whiAepOeEZNNu8O/D1Ye9LkEVNTd+d8pf0dD1Z9v80alRZTRjgKgpPtSjy4DJBU1GwHoi5xwxnY9bbjQErFnoLqEduAPegIBSFJR5o8+2m9479A27LeyUpuenG8O9ag0HjoOvX1ATbxtLTf+IZuk1MUYYxDGr8NH5aw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXZ5NUlyUkJpSEk0RHMrRHloODhQcUtPaVdObG84Z29HbllvSFdBa2diVFpL?=
 =?utf-8?B?U3JSYUY2ejFqbmJ4YVI0UzBYZFArTDdiRHdaQk1vM2hjZWhsL2MreFdpOW5p?=
 =?utf-8?B?eEhQUkVOZWhOaGh5cGxFYUJrMlQxc3JpbzhTbExLb0xNWVU3RWlXa2dMdE1Y?=
 =?utf-8?B?c1pUTm1ISExtYkE1dlduTHcyaDFqRFI3VkhBRUFBQjRwWDBZdlJsWjNpakhI?=
 =?utf-8?B?MG02T1FhRjg1RXRGL0tDVXM4a0JXUUE4VDFRSkJpZUpkZjRFMTlXUXY0OUFL?=
 =?utf-8?B?NFYyTndBS0RGWTZmTHBOTUFYZC9uL1JGYWlUOFhuZ2ZPZW9HVVRNWkdkR3h0?=
 =?utf-8?B?eWllWU45d0IxelQxWGhOWndQclpxeDVQZjdnWXd4elVXQXl5V1BKeXpBL1I0?=
 =?utf-8?B?dHlRdndyR1IwY1NHQU5hMEszUklGdnZnNUQ0Sm1xT1N1Z0pHZEhiUjVzTG50?=
 =?utf-8?B?dE8vQjhVY1RTNzNPb3NXc1lSSXBOdFh6cU9rTFd1SmNadkQ4bU5VTXJwc1ZK?=
 =?utf-8?B?bmNFR1d3ZW5Ka1R4OWVHRGd3aGJyME1jSFlDbUtQdFpJUTBqREJCN2xkRzVi?=
 =?utf-8?B?SXFVaVNlYk13U0I2cVltbEtkcS9PSHpFTll5RUQ2S3pBb2JsT1VmL1hkOWFB?=
 =?utf-8?B?ajBVQ0pvMGk5SjJMS1pQMFBEYWYrdEdFdzZQN21VMkxWN1BWblNPNGUvWk1t?=
 =?utf-8?B?c1kyQi9lV3JPVDNtN2NWZm1JZWZ3Si80bFpuQmt3OVdUNGVhYU5vaVdPZXNH?=
 =?utf-8?B?dG1XTnZOakJQTGRRRUFpNHpBamYxZmRUTTJUUHlrNE5WMU93RTM5L3o1eUU1?=
 =?utf-8?B?REZIQVE4YTBmSjdXZS8zSEVsTHVIMjd3bUY2MTM3N1FmVnFkd25sVXB5VXNE?=
 =?utf-8?B?N1V2Qkl1QmFWeFI5Wm5EQXJrcU9KdVFxMU1PUzAwTDdXcVJ6cENNSG1WaElO?=
 =?utf-8?B?eG9sdjVCNkJITGhRZ1lnUEJ5d1pEVnlaOTNWSzF0RnRtUlNkYVMrdm1rV0Zo?=
 =?utf-8?B?amw2a05aMDRiMVR1aFJHclk4V01CRFV6c2ZjU3lJb0YxOCtMTnpkZ2o2ZmFy?=
 =?utf-8?B?MTErMFFOdlF1c2tUNllJN0RaYm50Ui9kMll5UmxhTEdIcEFySE9uVXUva1Rz?=
 =?utf-8?B?NVNLeUJxME5FNEI0czBialBSeHdvZzRCbjVUS2hwUGxmdE9KUkpGbldmOTBV?=
 =?utf-8?B?ZE12OEViZUxXN3BOWEJ2R3NtSUtFWXowTEM1bkJGeUlDN0ZyRlErQi9DbHRY?=
 =?utf-8?B?cHpGMmZVQXFNVzMyWmFWMGRwMGp3alY4aVFsYWdjcmRxVnBsbjc1ck1XYTJE?=
 =?utf-8?B?L3V0UEZLT2FBaXQ5QzhhQ0VtVVpIOHczT055WUJ0Qkw4aE1ZbktLcXlBUmJn?=
 =?utf-8?B?a0hmYVJmTG9Lc3VTTS81aWtLZlJqWHlPNkdVZ3QvRkF5VVZSZGdhMUErVzZY?=
 =?utf-8?B?R0h3RFFYUFBWVDAraSt5NmhJMXJGWUs2UFdvMHk0NVBYbW9jRVZSbXFJcWxk?=
 =?utf-8?B?QkRJNGhxRUJjQnZEbFRaREowNWZyQUpjWDArY3FNTkg2WDJKa1JueGhucjBJ?=
 =?utf-8?B?eTRTWTc0Z1A4VUhqL29FKzd3L2ViK1Q0TlY5OTBQWktJT1VjZHZIcjFFb2pU?=
 =?utf-8?B?aURsSG90ZE1kMVRsbUlRMS9tSENOSEdyOTZBN1AvMWZhZUZ0WjdaQ3RrZ2NO?=
 =?utf-8?B?MmJzWW1zbkQ0emYyZFVYWVBZVU92L28wcHIxazJTWnV2Z1dRd0ZyV2RQQTBB?=
 =?utf-8?B?V2N6azMrdU01VGExZGZ2TFArL0FEVG42ZUJXYUFTNHE5VW5KNVhBZWpvdjRS?=
 =?utf-8?B?L2hET2g1V2RWVWZ3Q0JEWmlkODhOdiszMnRPU1NGclZPVTIvSG9EUnEzdm5l?=
 =?utf-8?B?OU5PUytZNGdEbUFMZnREQWdoWnFoTy93M3dseDhuSVUxKzdwQWwrbnVaVDJ0?=
 =?utf-8?B?ZjhmT3lUemM5OXNUZHRrK3dBQTAyTTV4ZEVZUWhvdjJXQmtITSt6Q0s2Y0lP?=
 =?utf-8?B?WmQwZzJtRGFTckhMeU9wMTBaalM4NThZZ09hdlhFc1lJRVE2alhKT3VwM1dE?=
 =?utf-8?B?NEgzQ0ZxVWUvWE5HN1paU2V3VDNqeUhLdkxZeDdybktHUXZXUVc1Q1FROTVi?=
 =?utf-8?B?VFcxcU81SVUwcTE3aFY3Q25wRERzSjkyTFBScFNFbFZLNEdmdlJsMjhBTVZ2?=
 =?utf-8?B?dXNvdFYvSldwQkVJSUUwTjRnNTlwUklENVJVYnJHakZXV2VoN2tjYWFCMkJ4?=
 =?utf-8?B?ajJ5Q0x1bGhFZmJwZFU2eG80Nm91NGVuN0EwVGVaeVVHd29EUUhqeTliT0Vh?=
 =?utf-8?B?R0dQVzVteXI3R3ZRZXZqZGFDck0vYUlLRGhYcXg2VUNHaXg0OCtRdz09?=
X-Exchange-RoutingPolicyChecked: xDWPdk5t/giY5Q11jEZmW7M2ySY19/t5XHTB4x76WTYdAfzUgwLLBo+B8/jRMysqFa4TKnwiGb1GKR9onS+gOpqSYqxzvuaP44sApQzt4lvgqADhQiZ2GLBByphIV4aEZuZsrXhLRuXR/GknXaUqRH6qyUCfQM4Ktp5gjhbxxgNHY3wF9gAnoo1QmRtzBLxWNlH2012SWXBG7d79LdSKk4C63N+GwDihY6ix3wfSObFvlK5aIdnAdINeAV8SxTtTc2LVhQkVwQIH6Z90sYAHnbyyFoX9W0WMpEFtVVCwDdixAvcAkEv7MlW+v9PL71DM2WRDwyiBw2sFoy/vON+mBg==
X-MS-Exchange-CrossTenant-Network-Message-Id: af585316-2fba-4669-0e7d-08df1d420aba
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 09:22:39.8779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9MVHndE1TiBdKrQXKPP58AWE8ZoDvic8w+Rl2YS+YI2T6mB40xfC9bMMKYTY0rzxL3At4nJxW/DQVmQOFxRqQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7856
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


On 28-09-2026 14:47, Ghimiray, Himal Prasad wrote:
>
>
> On 28-09-2026 14:30, Ghimiray, Himal Prasad wrote:
>>
>>
>> On 28-09-2026 11:48, Riana Tauro wrote:
>>> A memory scrubber can report multiple errors at the same address. Track
>>> pages already successfully offlined by the firmware so that subsequent
>>> reports for the same address are removed from the firmware queue 
>>> instead
>>> of issuing redundant page offline requests.
>>>
>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> ---
>>> v2: use xe page shift (Sashiko)
>>> ---
>>>   drivers/gpu/drm/xe/xe_device.c    |  4 ++-
>>>   drivers/gpu/drm/xe/xe_ras.c       | 44 
>>> ++++++++++++++++++++++++++++---
>>>   drivers/gpu/drm/xe/xe_ras.h       |  2 +-
>>>   drivers/gpu/drm/xe/xe_ras_types.h |  3 +++
>>>   4 files changed, 47 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/ 
>>> xe_device.c
>>> index 205cb4e7f9e8..1ec7c74cbd58 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>> @@ -957,7 +957,9 @@ int xe_device_probe(struct xe_device *xe)
>>>       if (err)
>>>           return err;
>>> -    xe_ras_init(xe);
>>> +    err = xe_ras_init(xe);
>>> +    if (err)
>>> +        return err;
>>>       /*
>>>        * Now that GT is initialized (TTM in particular),
>>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>>> index cfc7f07e9ced..7dee1c804eeb 100644
>>> --- a/drivers/gpu/drm/xe/xe_ras.c
>>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>>> @@ -20,6 +20,9 @@
>>>   #include "xe_sysctrl_mailbox_types.h"
>>>   #include "xe_ttm_vram_mgr.h"
>>> +/* Any non-null entry marks the page as offlined by firmware */
>>> +#define XE_RAS_PAGE_OFFLINED        xa_mk_value(1)
>>> +
>>>   #define CORE_COMPUTE_UNCORR_TYPE    GENMASK(26, 25)
>>>   /*
>>>    * Uncorrectable error type for core compute errors.
>>> @@ -210,6 +213,7 @@ static int send_page_offline_cmd(struct 
>>> xe_device *xe, u64 page_address,
>>>       struct xe_sysctrl_mailbox_command command = {0};
>>>       struct xe_ras_page_offline_request request = {0};
>>>       struct xe_ras_page_offline_response response = {0};
>>> +    struct xe_ras_state *state = &xe->ras.state;
>>>       size_t rlen;
>>>       int ret;
>>> @@ -249,11 +253,16 @@ static int send_page_offline_cmd(struct 
>>> xe_device *xe, u64 page_address,
>>>           xe_log_err(xe, SYSCTRL, ret, "page offline command failed 
>>> with status %u\n",
>>>                  response.status);
>
> if (!ret && action == XE_RAS_PAGE_ACTION_OFFLINE)
>     xa_store(...);

  Removed ret and missed while rebasing.
Thanks for catching this


>
>>> +    if (action == XE_RAS_PAGE_ACTION_OFFLINE)
>>> +        xa_store(&state->offlined_pages, page_address >> XE_PTE_SHIFT,
>>> +             XE_RAS_PAGE_OFFLINED, GFP_KERNEL);
>>> +
>>>       return ret;
>>>   }
>>>   static int handle_page_offline(struct xe_device *xe, u64 
>>> page_address, bool send_cmd)
>>>   {
>>> +    struct xe_ras_state *state = &xe->ras.state;
>>>       enum xe_ras_page_action action;
>>>       u64 addr;
>>>       int ret = 0;
>>> @@ -297,7 +306,11 @@ static int handle_page_offline(struct xe_device 
>>> *xe, u64 page_address, bool send
>>>                  page_address);
>>>           return ret;
>>>       case -EEXIST:
>>> -        action = XE_RAS_PAGE_ACTION_OFFLINE;
>>> +        if (xa_load(&state->offlined_pages, page_address >> 
>>> XE_PTE_SHIFT))
>>> +            action = XE_RAS_PAGE_ACTION_REMOVE;
>>> +        else
>>> +            action = XE_RAS_PAGE_ACTION_OFFLINE;
>>> +
>>>           xe_log_err(xe, DEVICE_MEMORY, ret,
>>>                  "Double-bit ECC error detected at physical address 
>>> 0x%llx, page soft-offlined\n",
>>>                  page_address);
>>> @@ -341,6 +354,8 @@ static void get_offline_pages(struct xe_device 
>>> *xe, u32 cmd, void *req, size_t r
>>>   {
>>>       struct xe_sysctrl_mailbox_command command = {0};
>>>       struct xe_ras_offline_list_request *list_req;
>>> +    struct xe_ras_state *state = &xe->ras.state;
>>> +    unsigned long index;
>>>       u32 total_pages = 0, count = 0;
>>>       ssize_t rlen;
>>>       int ret, i;
>>> @@ -370,8 +385,15 @@ static void get_offline_pages(struct xe_device 
>>> *xe, u32 cmd, void *req, size_t r
>>>               return;
>>>           }
>>> -        for (i = 0; i < common->pages_returned && i < 
>>> XE_RAS_NUM_PAGES; i++)
>>> +        for (i = 0; i < common->pages_returned && i < 
>>> XE_RAS_NUM_PAGES; i++) {
>>>               handle_page_offline(xe, common->page_addresses[i], 
>>> offline);
>>> +            /* The pages are already offlined by firmware */
>>> +            if (!offline) {
>>> +                index = common->page_addresses[i] >> XE_PTE_SHIFT;
>>> +                xa_store(&state->offlined_pages, index,
>>> +                     XE_RAS_PAGE_OFFLINED, GFP_KERNEL);
>>> +            }
>>> +        }
>
> Do we need change order for
> get_offlined_list and get_queued_pages ?


Yeah sashiko comments seem valid. Will re-order it.

Thanks
Riana

>
> Missed them earlier.>>           count += common->pages_returned;
>>>           if (!common->pages_returned)
>>> @@ -1098,6 +1120,13 @@ static const struct attribute_group 
>>> gpu_health_group = {
>>>       .attrs = gpu_health_attrs,
>>>   };
>>> +static void ras_fini(void *arg)
>>> +{
>>> +    struct xe_device *xe = arg;
>>> +
>>> +    xa_destroy(&xe->ras.state.offlined_pages);
>>> +}
>>> +
>>>   /**
>>>    * xe_ras_get_disable_page_offline - Get the page offline user policy
>>>    * @xe: xe device instance
>>> @@ -1125,15 +1154,18 @@ u32 xe_ras_get_max_pages(struct xe_device *xe)
>>>    * @xe: xe device instance
>>>    *
>>>    * Initialize Xe RAS
>>> + *
>>> + * Return: 0 on success, negative error code otherwise
>>>    */
>>> -void xe_ras_init(struct xe_device *xe)
>>> +int xe_ras_init(struct xe_device *xe)
>>>   {
>>> +    struct xe_ras_state *state = &xe->ras.state;
>>>       int ret;
>>>       xe_drm_ras_init(xe);
>>>       if (!xe->info.has_sysctrl)
>>> -        return;
>>> +        return 0;
>>>       /*
>>>        * TODO: Replace platform check with xe- 
>>> >info.has_disable_vram_page_offline
>>> @@ -1145,10 +1177,14 @@ void xe_ras_init(struct xe_device *xe)
>>>       if (IS_ENABLED(CONFIG_PCIEAER))
>>>           ras_usp_aer_init(xe);
>>> +    xa_init(&state->offlined_pages);
>>> +
>>>       get_queued_pages(xe);
>>>       get_offlined_list(xe);
>>>       ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
>>>       if (ret)
>>>           xe_err(xe, "Failed to create GPU health sysfs, err=%d\n", 
>>> ret);
>>> +
>>> +    return devm_add_action_or_reset(xe->drm.dev, ras_fini, xe);
>>>   }
>>> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
>>> index 561c656e2ad3..e41a52869085 100644
>>> --- a/drivers/gpu/drm/xe/xe_ras.h
>>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>>> @@ -19,7 +19,7 @@ int xe_ras_get_counter(struct xe_device *xe, u8 
>>> severity, u8 component, u32 *val
>>>   int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 
>>> component);
>>>   int xe_ras_get_threshold(struct xe_device *xe, u8 severity, u8 
>>> component, u32 *threshold);
>>>   int xe_ras_set_threshold(struct xe_device *xe, u8 severity, u8 
>>> component, u32 threshold);
>>> -void xe_ras_init(struct xe_device *xe);
>>> +int xe_ras_init(struct xe_device *xe);
>>>   enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device 
>>> *xe);
>>>   bool xe_ras_get_disable_page_offline(struct xe_device *xe);
>>>   u32 xe_ras_get_max_pages(struct xe_device *xe);
>>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/ 
>>> xe_ras_types.h
>>> index e09b50a6f77b..50d70e2e2fd3 100644
>>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>>> @@ -7,6 +7,7 @@
>>>   #define _XE_RAS_TYPES_H_
>>>   #include <linux/types.h>
>>> +#include <linux/xarray.h>
>>>   #define XE_RAS_NUM_COUNTERS            16
>>>   #define XE_RAS_NUM_ERROR_ARR            3
>>> @@ -417,5 +418,7 @@ struct xe_ras_state {
>>>       bool disable_page_offline;
>>>       /** @max_pages: Total number of pages that can be stored by 
>>> firmware */
>>>       u32 max_pages;
>>> +    /** @offlined_pages: XArray of pages offlined by firmware */
>>> +    struct xarray offlined_pages;
>>
>> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>
> Sashiko comments look valid and Need addressing.
>>
>>>   };
>>>   #endif
>>
>
