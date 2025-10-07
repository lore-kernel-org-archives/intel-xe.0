Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C6ACCA476
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 14:36:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1410488697;
	Tue,  7 Oct 2025 14:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NJ0C7kUB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0B588697
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 14:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759847774; x=1791383774;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=oSUyL4lJX3+GehIM7Nk3cd872OhJfgV8jSpYeWjITo8=;
 b=NJ0C7kUBra+CisNUFELEYq6UH/a6r8QuG4n+Uk7+6B11ViHrM/1VmjAe
 hqUbpMlqLW+1G6McoWATksnWTf2HOFwMXUXumMgAVIT5kNsMjy/jw+vR7
 fyk7gih10VVC3y7u7UDlAEPHpN23w+Oh7pUggN+aJhfddmgNL+PGPwpoe
 c22TWGkeea3NWrlUyOlvOAblMVD+emQeXJ+k+rwF7tYEpAbl9zCaLaAZc
 AlB47UNQEhtoDhp6sh8qcw9eMnGyHp9KWATf5AkN6Rx1lXc1hx3g/MDj1
 nGErif8mjiB+VbuBmHn/M9MaR61c4YBJVaYe0AuHI960lvAh4A8krdPrD Q==;
X-CSE-ConnectionGUID: 3ihtXUx3QemWXxrvdb3Nzg==
X-CSE-MsgGUID: hb8uv46fQAietK3ZP9M2pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="72708360"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="72708360"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 07:36:14 -0700
X-CSE-ConnectionGUID: b/M4IV1GQaeAuRWkS+oB8Q==
X-CSE-MsgGUID: CqbBm2X1Q0ODAOC1SwN6rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="217252362"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 07:36:13 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 07:36:13 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 07:36:13 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.24)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 07:36:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tcbtlS8fvaq17bnLuVWmUXejttk+qEI/w5CVoH+tHeLEhvwBpOr2MaGZVF6UzB6t+3EIKEMhcpmxBNUuJrT3Vw2tOHkUClfSaiQlojA8vhxDMvUk5gB7F4+jAtcPCHpoaNOYeJGrLir8rmjc0/VYaBDUxEeYF9o48PCJo+Bz3Ah+spfhyEy+Vs7X1xsfmn1CjihniGPk1mAbbzMLr6+/AQOCrCyja1O68IrYd1j9chRey9QChSKFwGbQlyG9lnl3F+RvH/Kztm4MLuPiQiPSvDZ+HtbrmaH2N/pZrO+P9PqvD6dXLjTCO/p1QJQr18hQarWSrgvWavKiCdyuEL8gUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7eafrocAaaCgN9Rhjet0yAGpf2+Rv/piu65KWkZMlQ=;
 b=J/C3ZQwoloKFnkdoPhkieHHkbzrqdxeR8Wgt5nUxl55zyp93MgTjmlzw91LOEeA0/vjxb4sMRcPtO5p+SIhHhfjwsImqNc8hNUBjJRBiHANANUN9dW7jUmJ7rn0ZVm3lnPM9r4HTWqJL3xmqzAfKg2lBQEOZCIVdUAnq+lHHJPYMpt+zWFXaHj2H8z04jJNARVzVZznAlD992Eq8PfA6pSezsYmLbEz1bp2yYhl52r3A6mk7ioteSOdiVaHqFDenBK5sOfcc2wtgZ1BYsg7kt53mX9ZU/VDYreAhy/fjm7BcDXk58Z9CNJpCNL/5awUT3045EsCfkkofh+TCLWc9Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by DM4PR11MB6141.namprd11.prod.outlook.com (2603:10b6:8:b3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 14:36:06 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Tue, 7 Oct 2025
 14:36:06 +0000
Message-ID: <6d581695-b640-4308-86e6-a77322d7cab9@intel.com>
Date: Tue, 7 Oct 2025 16:36:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 26/33] drm/xe: Move queue init before LRC creation
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251007130505.2694829-1-matthew.brost@intel.com>
 <20251007130505.2694829-27-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20251007130505.2694829-27-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P190CA0037.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::12) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|DM4PR11MB6141:EE_
X-MS-Office365-Filtering-Correlation-Id: 4581c2b6-5ee3-4b31-94bf-08de05aed93b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MENVYXpPb3dXeXYrWXF1bGlGblZ0TTFPek5UZklQYmpjbE1hYnpycjZzMHRJ?=
 =?utf-8?B?a1Q3VG9uUW1zTmpDUjhZUHlpbmRjZUpQYTV2V2VwNWRtOUxiZmNFMUcyZjhi?=
 =?utf-8?B?WEl5ZHJSWVFkMVluL2ZweDJuOUIydm1TMnRDK1dRUlB3Y0VMMFkwNllleTdW?=
 =?utf-8?B?ZjVuTzc0VnJZbENTc0V1cTJ4QWt4MldnZE02RjRUaGJkMzhUUklMa1NIZzRL?=
 =?utf-8?B?dWpXblV5aFpSOVRuMC9QQXpuajl2MWNZejNUd040NEF1bnFZTm5VVzA0c1R1?=
 =?utf-8?B?bHFZenZNZE9xU001NEVjUkRZVkNwVGxrUXE0eDVmSkRPcDF6NXJ6eW9hQ2pj?=
 =?utf-8?B?Mm4zVFhFU1BXNTlzSVhJRWVncyt5YkdTTWh2Z0RTQi80REE3U3FTd2dQTEg5?=
 =?utf-8?B?WDl5ZUh1aVFERCtQR2Rnd0RQSnU3S2N2UUs4VU5FbC82eWxPQUVHL0ZKeFFw?=
 =?utf-8?B?T1pCeUEzTlYwc2R6Qzh5UHhuQ0VIeTdzdTRaR0VaTWVHZFhUU096Z1c1ZjB0?=
 =?utf-8?B?Q1RWbm9ScnVkajhvSlRSazE2LzR5YWVTZ0xZSy8rZURqTXFySk8zMHdLWVc5?=
 =?utf-8?B?NXJDRy9IUGYyUVNVUU5jWjVxMVg0bWxqWko5a2dOWVNVZFh0ZHhDQW5oUUNY?=
 =?utf-8?B?VERneVhOUEQwR1BUYWFydi9Ka3QranhlVkZMWGREcUM1L3VlazNiT1F4dGZx?=
 =?utf-8?B?MHY0QWgzVUp5K0NXSkpnbmVIN21tNzhKeFR3TFdPUDdQWGtJRmFONDBHY2Zk?=
 =?utf-8?B?NXV3L3hZVjhucUZlMUtLWWlhZ1NVcEx4ak1FWGpQRXZ4a2VSejV3T01ab3lu?=
 =?utf-8?B?dGM1QWNidkhrbTRMMkY1Q2NVK3Z5SmFNOGJLOGlid0p6cWRid3hOa29scFhC?=
 =?utf-8?B?aFZKWGkxcklSTWdSRHROOU13NEN1SERKQ0t4QytORTJQSDA1c3RVVDE2UTRz?=
 =?utf-8?B?dWYxREgxNXVJdVN4emYreGVuSkZVSEVrcVpCbkdRUjNjRWRZVDJvSzg3TFZW?=
 =?utf-8?B?QlVMK0VRSXBrclJLR1lCb2tzV2pIbXhDNnNRZkFsOFZ1ZWxuZEs3SzBwYUFJ?=
 =?utf-8?B?aWcyUnlkbGtMR2FVRFNYL1dFQndkMXJwMEF1cjVCMGllbVFWT3FvNTRVQkZp?=
 =?utf-8?B?YTErOWtyMXNRVjN4UnJOdkZoYXJhK0xIc1BCS0o3UmNtc0dDRllQVTR4U0JS?=
 =?utf-8?B?ck9BTG1NZDJ5ZG92eWlmTEk1bXFNSFNLdlFUM3FITDJSNjhZakFEZ0NrQ3RQ?=
 =?utf-8?B?cjk0ckhFVndTdkxka25ubFlhdlFtZXNETmY5bHUwdkxOaEFHNDBLR2dQK0Vo?=
 =?utf-8?B?OEtmMGNPcUVyKytHSXVVSlhibUJvRksxWm5Sb2VYSWV3QWxWM1o5N2xHS2pU?=
 =?utf-8?B?YjhFcVo1SThrNjRDaEJEZlVlTXpNNXMvYnNzak9iVU5UZG9jZ3QraUFVeUoy?=
 =?utf-8?B?bWc5MnZYbWhvdWFjOGM3NFc2c0tlRElWSHpLRDRzcC84N0pyaXRYcFY2NGRS?=
 =?utf-8?B?K2FGRFZsNWZKeW1QbWJoaHV0c0ZIY1dDbHZjTEt1eG56NktuakRJT0lsQnoy?=
 =?utf-8?B?QXB4YVh4QTBWTUlUQUUrd2o5bW8xdzRqUnlQMUZWeW5INGV3YXFrNXFzR3pL?=
 =?utf-8?B?dS9XZE85NytRbzZVenBEQkN1ZWg5TGVOaUhuTm5qeFd2L1YrSlQ3eFZTRW41?=
 =?utf-8?B?cFlENDlFbjBBWFc5ZVh2bnB4d1NEd1FmUlA4ZlNLK0N3a1krd3hFUnY3OSta?=
 =?utf-8?B?c1QyRE1INFZHcFBjb2p4bG5ZN3lFTkFXOVpmNUxLa3QrRHc4dzdiQ21ZWW5a?=
 =?utf-8?B?QkJmOXFscGZmOWhuanhvZDZmdk1GblZoMTIxMnNCamM3ekQvcUZvWlhxekY4?=
 =?utf-8?B?bzVIMURyUUJNZEt0ekZMbEVEL01zNDdFSEFEMEpnWUZlQlZERHFPTWNJUVUx?=
 =?utf-8?Q?5uJb4ha5nIJOiWAp1h7aZ4/xll3KVTnp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTJWZGZjWG51a29heFMyQkNuZjVrcVdHTnErNXE2dTJnTFNsTzBlaEtiTWpk?=
 =?utf-8?B?eVovRXMra09lb0ZDc2R1N0FOcTVtb2dYV3dySTVveTZZU3g0ZTcza3E0MkZ3?=
 =?utf-8?B?a3l3dlM5Y2djNWNaL2NsZ3RsZENYMjM5a09OL1VwQVdyOFZUYzBabGU0cURj?=
 =?utf-8?B?RUJXcjZtclZBVXBRQ00rall6cW01ZFVjUXA1Zk9tMlprR1loRWNUU3hPY0FK?=
 =?utf-8?B?TVhwWG84S1dKTnl0bXFRL3g0SU0wbDVST24wZUJyVEg4RzlGTWlXVFduWUpU?=
 =?utf-8?B?d3dTVzdoKzJxWFJ4NU5lbVNwdVhWazltTWk0NWUySEFGNHJlbWFmZEd4anNi?=
 =?utf-8?B?UVBEcmVCUWdpdUVQeFdjNXVEb0dFTkRDY0RsNUxoOGlvL05FamJ0eEFxWGE0?=
 =?utf-8?B?WHk5VkxuMUpJdXNLajdwWFM2NjAzaWhlOU1mcFpaTU5uT3lGMitiTG1DcjQw?=
 =?utf-8?B?VlZ4YkE3RlY0V0FrWkxhdVZwMnROWVZRZVBRMWtwMHgvWnFFY2E4Y3Q4T3dh?=
 =?utf-8?B?K0hLMXZFbzNtTDNGREtmRmpod0RwaDF3cWVqbThvK3o2N20vTW91WmxlK05T?=
 =?utf-8?B?ZzVSeVFiM0R3Vlc2Nko0YkNiQU1KRXN2M09UL25lYkRXU1ovU08veUtUaXNk?=
 =?utf-8?B?ZDdjNnFULzBIUzlBeUFtRm5sQ3N2ellBOEJtVktvRU9Wa3YyaWdFalp5aEpz?=
 =?utf-8?B?Q2gya1pObCtINW1NUW9KNTJmcGZzczNKTGVmZmtFWlNpbmRKbG9PYW80TzJk?=
 =?utf-8?B?clMvaklpZno3Szl0UWlHSjNWbVpLQm84N1FKOHNaRnZHVWVMbXVIM0V2Z0tS?=
 =?utf-8?B?c0pyTXR1TWJOd1RBUkR0Y2ZrYTg2aHNtbENBMmJZaGsxNTFJSWx3azZ3SnpD?=
 =?utf-8?B?RmJDNmVKeEp5R1YrdlpZRGFKbGJMWGVORlA5aS9BRUZjMkdqdkNsWFFjeFlJ?=
 =?utf-8?B?NDl4MlVXT0RmeVFoY3lsQ1NwTzJvNmQwcUNsWkkrQlBLY090L0hnYTY3Z1RW?=
 =?utf-8?B?dzlOMGJSZHdISllKaVJNREdrTmExbVk3RE5JQWVYcFN1TEhMUlNXai8zZThm?=
 =?utf-8?B?RnZSN2JaNGt5WmNwUW9UVGQrYjNGOGM0Z2R0bXZuQzkya3FpVndqbDkwNVRl?=
 =?utf-8?B?QURyTVpiakdWdHNPcUhHSFVqZkYwZGJyV1hMekxIUDkvQ2NBckZGSGswdkU3?=
 =?utf-8?B?VmFKWGtNTzdMZWZlYzl1a25JRzh5SG5TWHRibkNaRGNvc2s0U2h1Ylp5bTho?=
 =?utf-8?B?bFVaKzJsa0JSK1BkZ2g4cC9MMFNXZ0wxQnhFMEhObkhJcVcwc1dJeG9ObkxI?=
 =?utf-8?B?M2tyYzVPV21HYU51akFBVVFqd2w1WlZqOExYMk9EZXZRTWdiSVZrc1g2UDhy?=
 =?utf-8?B?VjJwTkRldEVYYkVXeTNwTnFqTlMwT2pwdHFqM25zWDR3cWtVUlJqYzdqd2RR?=
 =?utf-8?B?NmRxcHU4bEYrcXNxS1pqNnJZN2NlZThVTGhjTmtwMVA5c3FZOTBvYnc3Sm1x?=
 =?utf-8?B?bW1oTURzRU5WL1lBQ0FXVVJLYmpwMW9QcHlJRVZrTCtXckVsZHZ2MWg1MFgw?=
 =?utf-8?B?NkJqelhsY0Y2b2ZxSE0wYTRkQkVRVlZ2bHY5Ry9pU3BSTnVMYzJwVnVwd3lI?=
 =?utf-8?B?T1g2R3JTcjFnVGVCRkg5SlFocS9PNS9yTk8vb2JZUHlPVXFYTXpTdXlrbS9U?=
 =?utf-8?B?Q1VKM1h0amdaTm9rWEtuMERieUdsR3YyRFI0SEllbENvQ0EzSnl4N2c5bDBh?=
 =?utf-8?B?Ung0cnBHUG1JOHdhWlJRMFk3dWFaWUdBRG9JMUVSUGhPZ3g3ODNzbmJhVEhT?=
 =?utf-8?B?WExsUWJyWWJkN0dON3lraFZZZFJ4ay9oNldnK2U5WCtTVEVNQUNxY3VtTS9M?=
 =?utf-8?B?a3R2Y3NyRE80Zk5tQjl5QVd4YndkMUdEczFrbW5CdU11OTVYRTF6ZVRmNm1R?=
 =?utf-8?B?dW42UUQ3WW05bzhPOFlyWGlpRG5jdHEwd3ovZUJjTEx2UnE0U1FtT0JGMmcx?=
 =?utf-8?B?cmpzZHIrM01Wd3V6NVhUcmJjOFI3M2NIOFBCYWpWMmtQdW92SzlTeXN1dXRj?=
 =?utf-8?B?a1ViR0Q5dFhmZFNBWm5nQzZycHZiaytvdnRQZ1Rpd3dUZ0F4SGJuU1pBR055?=
 =?utf-8?Q?YnA3lliVA8hGYIfLKcBlrhojx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4581c2b6-5ee3-4b31-94bf-08de05aed93b
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 14:36:06.3104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7FLLcfdTKRK8mUl0IZHBFRGDRVxM6szqeQ686YwEthTjEbSoz3T6uvtkfn4fSkrvNvCgs4hLnxPZye3/l70ybQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6141
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


On 10/7/2025 3:04 PM, Matthew Brost wrote:
> A queue must be in the submission backend's tracking state before the
> LRC is created to avoid a race condition where the LRC's GGTT addresses
> are not properly fixed up during VF post-migration recovery.
>
> Move the queue initialization—which adds the queue to the submission
> backend's tracking state—before LRC creation.
>
> Also wait on pending GGTT fixups before allocating LRCs to avoid racing
> with fixups.
>
> v2:
>   - Wait on VF GGTT fixes before creating LRC (testing)
> v5:
>   - Adjust comment in code (Tomasz)
>   - Reduce race window
> v7:
>   - Only wakeup waiters in recovery path (CI)
>   - Wakeup waiters on abort
>   - Use GT warn on (Michal)
>   - Fix kernel doc for LRC ring size function (Tomasz)
> v8:
>   - Guard against migration not supported or no memirq (CI)
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_exec_queue.c        | 45 ++++++++++++++++++-----
>   drivers/gpu/drm/xe/xe_execlist.c          |  2 +-
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 45 ++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 +
>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  5 +++
>   drivers/gpu/drm/xe/xe_guc_submit.c        |  2 +-
>   drivers/gpu/drm/xe/xe_lrc.h               | 10 +++++
>   7 files changed, 98 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 7621089a47fe..90cbc95f8e2e 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -15,6 +15,7 @@
>   #include "xe_dep_scheduler.h"
>   #include "xe_device.h"
>   #include "xe_gt.h"
> +#include "xe_gt_sriov_vf.h"
>   #include "xe_hw_engine_class_sysfs.h"
>   #include "xe_hw_engine_group.h"
>   #include "xe_hw_fence.h"
> @@ -205,17 +206,34 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
>   	if (!(exec_queue_flags & EXEC_QUEUE_FLAG_KERNEL))
>   		flags |= XE_LRC_CREATE_USER_CTX;
>   
> +	err = q->ops->init(q);
> +	if (err)
> +		return err;
> +
> +	/*
> +	 * This must occur after q->ops->init to avoid race conditions during VF
> +	 * post-migration recovery, as the fixups for the LRC GGTT addresses
> +	 * depend on the queue being present in the backend tracking structure.
> +	 *
> +	 * In addition to above, we must wait on inflight GGTT changes to avoid
> +	 * writing out stale values here. Such wait provides a solid solution
> +	 * (without a race) only if the function can detect migration instantly
> +	 * from the moment vCPU resumes execution.
> +	 */
>   	for (i = 0; i < q->width; ++i) {
> -		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec, flags);
> -		if (IS_ERR(q->lrc[i])) {
> -			err = PTR_ERR(q->lrc[i]);
> +		struct xe_lrc *lrc;
> +
> +		xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
> +		lrc = xe_lrc_create(q->hwe, q->vm, xe_lrc_ring_size(),
> +				    q->msix_vec, flags);
> +		if (IS_ERR(lrc)) {
> +			err = PTR_ERR(lrc);
>   			goto err_lrc;
>   		}
> -	}
>   
> -	err = q->ops->init(q);
> -	if (err)
> -		goto err_lrc;
> +		/* Pairs with READ_ONCE to xe_exec_queue_contexts_hwsp_rebase */
> +		WRITE_ONCE(q->lrc[i], lrc);
> +	}
>   
>   	return 0;
>   
> @@ -1121,9 +1139,16 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
>   	int err = 0;
>   
>   	for (i = 0; i < q->width; ++i) {
> -		xe_lrc_update_memirq_regs_with_address(q->lrc[i], q->hwe, scratch);
> -		xe_lrc_update_hwctx_regs_with_address(q->lrc[i]);
> -		err = xe_lrc_setup_wa_bb_with_scratch(q->lrc[i], q->hwe, scratch);
> +		struct xe_lrc *lrc;
> +
> +		/* Pairs with WRITE_ONCE in __xe_exec_queue_init  */
> +		lrc = READ_ONCE(q->lrc[i]);
> +		if (!lrc)
> +			continue;
> +
> +		xe_lrc_update_memirq_regs_with_address(lrc, q->hwe, scratch);
> +		xe_lrc_update_hwctx_regs_with_address(lrc);
> +		err = xe_lrc_setup_wa_bb_with_scratch(lrc, q->hwe, scratch);
>   		if (err)
>   			break;
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index f83d421ac9d3..769d05517f93 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -339,7 +339,7 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
>   	const struct drm_sched_init_args args = {
>   		.ops = &drm_sched_ops,
>   		.num_rqs = 1,
> -		.credit_limit = q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES,
> +		.credit_limit = xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES,
>   		.hang_limit = XE_SCHED_HANG_LIMIT,
>   		.timeout = XE_SCHED_JOB_TIMEOUT,
>   		.name = q->hwe->name,
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 4a3394566c24..dc589cf6ec98 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -480,6 +480,12 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>   		xe_tile_sriov_vf_fixup_ggtt_nodes_locked(gt_to_tile(gt), shift);
>   	}
>   
> +	if (xe_sriov_vf_migration_supported(gt_to_xe(gt))) {
> +		WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, false);
> +		smp_wmb();	/* Ensure above write visible before wake */
> +		wake_up_all(&gt->sriov.vf.migration.wq);
> +	}
> +
>   	return err;
>   }
>   
> @@ -734,7 +740,8 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
>   	    !gt->sriov.vf.migration.recovery_teardown) {
>   		gt->sriov.vf.migration.recovery_queued = true;
>   		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
> -		smp_wmb();	/* Ensure above write visable before wake */
> +		WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, true);
> +		smp_wmb();	/* Ensure above writes visable before wake */
>   
>   		xe_guc_ct_wake_waiters(&gt->uc.guc.ct);
>   
> @@ -1143,8 +1150,11 @@ static void vf_post_migration_abort(struct xe_gt *gt)
>   {
>   	spin_lock_irq(&gt->sriov.vf.migration.lock);
>   	WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, false);
> +	WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, false);
>   	spin_unlock_irq(&gt->sriov.vf.migration.lock);
>   
> +	wake_up_all(&gt->sriov.vf.migration.wq);
> +
>   	xe_guc_submit_pause_abort(&gt->uc.guc);
>   }
>   
> @@ -1253,6 +1263,7 @@ int xe_gt_sriov_vf_init_early(struct xe_gt *gt)
>   	gt->sriov.vf.migration.scratch = buf;
>   	spin_lock_init(&gt->sriov.vf.migration.lock);
>   	INIT_WORK(&gt->sriov.vf.migration.worker, migration_worker_func);
> +	init_waitqueue_head(&gt->sriov.vf.migration.wq);
>   
>   	return 0;
>   }
> @@ -1302,3 +1313,35 @@ bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt)
>   
>   	return READ_ONCE(gt->sriov.vf.migration.recovery_inprogress);
>   }
> +
> +static bool vf_valid_ggtt(struct xe_gt *gt)
> +{
> +	struct xe_memirq *memirq = &gt_to_tile(gt)->memirq;
> +	bool irq_pending = xe_device_uses_memirq(gt_to_xe(gt)) &&
> +		xe_memirq_guc_sw_int_0_irq_pending(memirq, &gt->uc.guc);
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	if (irq_pending || READ_ONCE(gt->sriov.vf.migration.ggtt_need_fixes))
> +		return false;
> +
> +	return true;
> +}
> +
> +/**
> + * xe_gt_sriov_vf_wait_valid_ggtt() - VF wait for valid GGTT addresses
> + * @gt: the &xe_gt
> + */
> +void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
> +{
> +	int ret;
> +
> +	if (!IS_SRIOV_VF(gt_to_xe(gt)) ||
> +	    !xe_sriov_vf_migration_supported(gt_to_xe(gt)))
> +		return;
> +
> +	ret = wait_event_interruptible_timeout(gt->sriov.vf.migration.wq,
> +					       vf_valid_ggtt(gt),
> +					       HZ * 5);
> +	xe_gt_WARN_ON(gt, !ret);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index 1d2eaa52f804..af40276790fa 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -38,4 +38,6 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
>   void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
>   void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p);
>   
> +void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt);
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index c1bd6fdd9ab1..f0bc45a782a4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -8,6 +8,7 @@
>   
>   #include <linux/rwsem.h>
>   #include <linux/types.h>
> +#include <linux/wait.h>
>   #include <linux/workqueue.h>
>   #include "xe_uc_fw_types.h"
>   
> @@ -50,6 +51,8 @@ struct xe_gt_sriov_vf_migration {
>   	struct work_struct worker;
>   	/** @lock: Protects recovery_queued, teardown */
>   	spinlock_t lock;
> +	/** @wq: wait queue for migration fixes */
> +	wait_queue_head_t wq;
>   	/** @scratch: Scratch memory for VF recovery */
>   	void *scratch;
>   	/** @recovery_teardown: VF post migration recovery is being torn down */
> @@ -58,6 +61,8 @@ struct xe_gt_sriov_vf_migration {
>   	bool recovery_queued;
>   	/** @recovery_inprogress: VF post migration recovery in progress */
>   	bool recovery_inprogress;
> +	/** @ggtt_need_fixes: VF GGTT needs fixes */
> +	bool ggtt_need_fixes;
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index d07ff014492e..be7aa1e89d13 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1670,7 +1670,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>   	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
>   		  msecs_to_jiffies(q->sched_props.job_timeout_ms);
>   	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
> -			    NULL, q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES, 64,
> +			    NULL, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
>   			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
>   			    q->name, gt_to_xe(q->gt)->drm.dev);
>   	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 21a3daab0154..2fb628da5c43 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -76,6 +76,16 @@ static inline void xe_lrc_put(struct xe_lrc *lrc)
>   	kref_put(&lrc->refcount, xe_lrc_destroy);
>   }
>   
> +/**
> + * xe_lrc_ring_size() - Xe LRC ring size
> + *
> + * Return: Size of LRC ring buffer
> + */
> +static inline size_t xe_lrc_ring_size(void)
> +{
> +	return SZ_16K;
> +}
> +
>   size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class);
>   u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
>   u32 xe_lrc_regs_offset(struct xe_lrc *lrc);
