Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB73C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 04:24:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D3F10E090;
	Fri, 12 Jul 2024 04:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dT4PR9Cn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07A210E090
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 04:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720758294; x=1752294294;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lNihPJlosN5oy0F5HnRuZwa3YAKJF2TFIMDsUikVvVI=;
 b=dT4PR9CnglkPmevwUBV+wYws7d2BY11FCI3jlMGEZeB87deBR/gcls8t
 vlUaXla8j9/M+jjX9nfHBGXsvWF6TpBSkL28N+asRyapdwjJP0Gsk/n41
 syNOgPvHprioJmFB1rr0wchBzurl36OaTZLksGc/3HMzBVKp1nJWqqs4k
 KW4XUbdKYvbIX/YT1fgeLbWIBjvKEFlqwvBmCLTQtDIQ+AdUxsoyYGQCS
 y9FDD7i9M7tADI8cCzZgvWgzpiNfqpCg+v8WqIGoJpa92HVWJ0nHYNztz
 H8zYbJEGHRrfwJhy+AZPvQFJC3B7SJmEhpeCyk6/2QZtSc6Y8qpqtQ8tk A==;
X-CSE-ConnectionGUID: pjp0kAVZT2iH81cukFq5nQ==
X-CSE-MsgGUID: raxtXrnfQdmCdhHiPJk5rA==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="17893585"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="17893585"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 21:24:53 -0700
X-CSE-ConnectionGUID: THT+U4vOR5KfhpCPu+fvWg==
X-CSE-MsgGUID: snsZtnK+SkaAcJ3v8TCmUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="48865353"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 21:24:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 21:24:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 21:24:52 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 21:24:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rRt29uBV5+SQmyyrhtuuxZDSOhUt3h0ZMpAeuXEZOohohytfXptOQ+Q6WXs7iSr54bfwZrahrV66zhfcul+1exYACWHdTrrEYk6WtYUOOqFLYh2vj1RhaPBe+941eZqAqapypIlLaOqFuVt7+GuU5MGSDtDmvR/cdTrilhwN/9DNPCC4jKVvsc6pfnFfNSPDh4sVz6s2OgTB2b6tT6JdKi6CdweD1KMNAiqXhCP9JdtNQFC3XQLxOujzVi5/f+3YW53pM6ZnnuWOSjTJz+8Yh9Zjk2cX70Fpe8bt3rhGZy2rpsMfJZ93s9mzz+r4Rk+vtAoLKzfAqckOrYYivswotw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HuXMfLZrE0cGhkteZqFC2dKVD9OXJhpz5XlinMbGU9U=;
 b=kif2InthfiB52kO4YZfAdEidBvKWcLtpIVyG+4GQOJ9FPG29UyGpya7/cyHEZgRJoWRIpScGxYPR1nH9iRhO0KpG7uNau92ZSGQtNyD8baveuH0X5nrp60tfIE60yZDayDmYigGJCXo7CWvlNhzVIaeai5yYS/Ic+BG3wunN2ZP7Tbq3ZdbTxO6H/iBEZ6hwl6fbuoEZAOO+MANnjqhPFIQPEoqflM7nqP9uN2Dwmh9JI2tCo+GResy7+CoLK7jBQZA6GT3Umdxce/0ccu2/Y8Xa9MbNn8fdcBe1OHckhGmUaY1T1+b3rT5bcVGZ5RPjFkfMGBE8KYov4g3A6T8xjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4977.namprd11.prod.outlook.com (2603:10b6:303:6d::14)
 by DM4PR11MB6527.namprd11.prod.outlook.com (2603:10b6:8:8e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.38; Fri, 12 Jul
 2024 04:24:50 +0000
Received: from CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::ae3c:acd2:8d33:99d7]) by CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::ae3c:acd2:8d33:99d7%5]) with mapi id 15.20.7741.033; Fri, 12 Jul 2024
 04:24:50 +0000
Message-ID: <91be0b86-296f-4810-855e-42d4b4907b5a@intel.com>
Date: Thu, 11 Jul 2024 21:24:47 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] drm/xe/xe2: Introduce identity map for compressed pat
 for vram
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <akshatajahagirdar6@gmail.com>
References: <cover.1720689220.git.akshata.jahagirdar@intel.com>
 <87ec90a618b3977873ea57e781cd594dbc23a121.1720689220.git.akshata.jahagirdar@intel.com>
 <a0c6cc4a-6240-47bf-a3d2-d1eabb053b04@intel.com>
Content-Language: en-US
From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>
In-Reply-To: <a0c6cc4a-6240-47bf-a3d2-d1eabb053b04@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0160.namprd04.prod.outlook.com
 (2603:10b6:303:85::15) To CO1PR11MB4977.namprd11.prod.outlook.com
 (2603:10b6:303:6d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4977:EE_|DM4PR11MB6527:EE_
X-MS-Office365-Filtering-Correlation-Id: d53bbd2f-fd5a-49e3-ac1c-08dca22a91c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SENVOXpCSlUrOG1YWWw0OEg2NE5RamtSK2RXZWxCN3RIcGpUT2FvWVdGRW1v?=
 =?utf-8?B?Y0hlZkU3Yk1DSEVBQ2RxYkFQS1lod2tmL1RLcVRaQzZ6cUFFeFgyb1R3VXov?=
 =?utf-8?B?SzMxRWYzYXo1MnJQcEVGbXdiaGY1Rk5qT2FzQzdhNDk4QVpTOURCc3pqcFpY?=
 =?utf-8?B?a2ZnVi9Za0U5aDZVYlFpRHp1VzBDTHZZNHZSdnJHcXdhcGpvaHV6YVlLbVZZ?=
 =?utf-8?B?QWJHM1A0L3luTUpCMEhuZU5OdWM2VjdURmozbjc5M2UyQnBITDYrYm1oR08v?=
 =?utf-8?B?cmNJWDh5K1RDbEZRaVhsdjU3Z1hFT2lxbENWWXh1RHhGd2pYbzJ1OGkwNWdu?=
 =?utf-8?B?dDcyTU15L1VTb0hTbnk0SW42TmdJMWwzNUxibWlpeUhaMVV5bUtQWUhqV1pK?=
 =?utf-8?B?TWdDQWNQMHhTUzEvVGhtYnAyS0dVVnBGSEVrRGdmVEF1SkhoMCtOMEx3Qm1o?=
 =?utf-8?B?S3FYeGloRDFCdFRrTUFmODFwWEUyNzdRbmJvcE1RbzZvZjk3VXNVemFnUTVk?=
 =?utf-8?B?U296WGI2VTBQQ2thKy9UR0gxZE1KeEJQbWRaUmloMUQwaFdSMkdVbVNDZ21z?=
 =?utf-8?B?ZEwrQUdoWitPNHJTcHhpU0hWeUplRnpPSVlvYnlZNE4xM1owMVgvVWdBb0dv?=
 =?utf-8?B?aHdmS2ZxLzA2aDNSR2d6Sjd2Z2kyVnI5R1k4QUF0cVFwWWJLbUlCbjkwZnJV?=
 =?utf-8?B?Vk95UHp0R1JqYlpwQjRSKzJqeHZCRnRjYmwzb1RBYXZLampUa0VJNW9uaktV?=
 =?utf-8?B?SjBGVk1jT2hMZzhuNFB0cytmQi9BcnhhTVM3SFZjanMyZzk1S0UwN2sxeXdw?=
 =?utf-8?B?bXpmd3ZJZU4yRmUrVU5NeW5MdlNGa0lUaGp3N1RYVFFPK2pkYVpvdEJHRi9y?=
 =?utf-8?B?cVlUeG9FN0dxVElINUlIWFVtZWlDb2swVmV6NlFsYmdIVUZHU3pwOUhzS3Fx?=
 =?utf-8?B?SDRpckZVK2hIMU9vSFNBY0hqYUhzbWVKMlgyQzR3MHNIdExPNnBiVEZ2anJW?=
 =?utf-8?B?VlNUalFibG1LL2tOSlQ2R3JEZmhCYTZtM3g2REdaWFljNVNIbktYSm5CZjNB?=
 =?utf-8?B?UElwaGlGSlNERVhvRnhWNnAvSndhSDFFVjBXc21uTFJ3ZGh0NEk5MjVDQi9M?=
 =?utf-8?B?dExlYW56MnNMNWsxVVEwWFVscU12anBGZXkzditseUJ4Q3dYME5GeTNUYlFG?=
 =?utf-8?B?U2RJbzhHUnoyZjNXNmpPSWVKb2tJcExLRG5CL015Q3AyZTlTUGFDVzVHRmsx?=
 =?utf-8?B?N2JzcVBQMTZmTFRYQkFhZnJ6NjZJTElaQk5HcmNObTRQRjdpNmt2OUUvdndv?=
 =?utf-8?B?SUJpTU44SWhWN0t0NmRNY21UOCtXS2hlaDVvL0NiSXh6WXVCcjIzVkJZYko4?=
 =?utf-8?B?WkEvWVZIL3YwdEswSVlOdlNhMnNtRThOemtEOU5hS0d6NW43cHFsa2FjSHBB?=
 =?utf-8?B?dGdqdjFNbHkxQVVuSXMxT3hOYWRzTU5abDdZQUc3QTBoTUJwVVVlZzJMb1Qx?=
 =?utf-8?B?Q25NMmlSRk9XR1R1SEdkd210eFRiQ0c4SStidFhqMmdLM0J6VzZaclhXYVVr?=
 =?utf-8?B?cExraXJJbHk5Umg4S2RHbGRreXJwMFNlcmpHKzZyNTlOcHVicTg3eUtJUXBS?=
 =?utf-8?B?VXZaR242Qk52bmNKMFVNUVJSN0pZaEhOb1pYSUdZWnh1bDhFdUpJVlRWRG1r?=
 =?utf-8?B?NVZnRWtuWVlPRmc5M2EvZFVERnFEWE8zN3NIVi9ydlRPSFI2QjdRWEd6MlEz?=
 =?utf-8?B?aUNaWlhSMG90RlNOUnkxWERQdFY2NlFjSmQ5VUxkUXJva2E4TFAwOWgvNHJx?=
 =?utf-8?B?eVBQVmZxWk44NFpxZ3A2dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4977.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0ZFcEMwVEptS2ZrM2F5WUt3NUg4b0VRNU5qNjFjTnE1UXdzMUpQZ1NUTS9t?=
 =?utf-8?B?WlU2empUdk91MDNncUVzY0RQZHJubEc5OG43U0VBSWFCTzNOdUlSWjBjZ1N5?=
 =?utf-8?B?RjdjK1EwM3dZeUREVVhXOUhQOExOdXArQW80eUsydjFBT0pYK2MrVkE3L0M5?=
 =?utf-8?B?MVo4eTF2ZUtRZ1MvdXZwNFlSaURmMFpEalc1VjNSRGg4dXl2eFVGNnVzckhn?=
 =?utf-8?B?bVZyZHBGMTdOc3c0YjhhSzh3aE9kc0pkREJ5SU5yT3JhU1d5WEk2WkZNVXln?=
 =?utf-8?B?VkgwOENXTW01cnhYbkd3cFJETGRCT2hYd0pxQ01KSnJtTGM3bDlMNWV1bERz?=
 =?utf-8?B?RXVLdk93TERGTys5UlZ6YlRGeGpKTmRUV1VEZ1Z4dlh5RGVUd2VaODhJUE83?=
 =?utf-8?B?NERobVRTOHNDa0ZqL0JPT1ZabndpMitmTElmSlkwR2kvbW14amkyQ0VRTWhJ?=
 =?utf-8?B?YW9sT0xhdTdhT05XUGJXZHZpN2FrM3g5eUFZSmt1cm92ait2NWdmbWlOTW5x?=
 =?utf-8?B?RFQzNkxmYXZQZnFmc29ZZUxMZVBZY2VXdUVpd2ZmNVRad3kvaWJUZlY0STFQ?=
 =?utf-8?B?UnNaTk1aZS9aR3E0NHcvM0RUNmFwOTNlNEo5Q1BSL09SRHlyUStaVFQvN04w?=
 =?utf-8?B?TjYyeXZoak5nY0pqejZLenM3U0QxY2E5bE9ESFVOVUJiWEZaeDAxc3BsdU42?=
 =?utf-8?B?cWFUMUNzaGFWNSs5UUE3cStnNDVINnZrc3lpZ2p4YnFnbEk5M0pHYk9mUnho?=
 =?utf-8?B?K1RNMGNETHNzeHZ4cDNPSDl0eDRzT01GS09aaFBUMHJJbC9Md2tVc0xoSFVn?=
 =?utf-8?B?dllieHdPRWdNTFJTdjhEMHczMkRNVndYckdoclVxdlpucWxKUVBGZ3lTejFF?=
 =?utf-8?B?UmlQbHdSRUNGcTNqaEFwcmZoM0F3U1g4bVlYYit6M1kzd2lxME5Zb0VkRk9r?=
 =?utf-8?B?cm9STUthSzFJRGdVck9US01LWDRCV3M2V3J0UTAxd21XbkxhWExMM3NYVHhF?=
 =?utf-8?B?WWVpNldJSFZXaEkwZ1dYVnBobkxzall4dUYxditkS25IekNoM2xCNkNDR3M3?=
 =?utf-8?B?UytISTdDcjRuY0Y2aVhZcllKb2ZYYUQ1MGdybXFrMktyVDRNWlJ5R1F2UDFG?=
 =?utf-8?B?eUhMSmZabnZKeUN2RkplcTJkQXgwQ1E4cW5SQytQRTN3Zi83RWgzTm9hZzhl?=
 =?utf-8?B?ZnVBam1JRitpOVpNSC8wanpueWpLZktra1U4bmxXUFUwandBeVZwaEtxVC9Y?=
 =?utf-8?B?MS80eHJXaU5QekxnNFR6SXdGTzlvM3c3Tld1c3JrY2lTL0hMc3VyTDdIYWZ3?=
 =?utf-8?B?Mk90bDlvU3pGWm8xdTQwN2RhZThocUJLd0g1Y3NtZ0hXRW1PZU9DdFBITXhK?=
 =?utf-8?B?TUowNy9OWW9UcWQrN2thYm1ZQ2NpZWllSlZkNlptRldrVjVUQzFMQytnTlZV?=
 =?utf-8?B?V3lZSFZwbmVtTVB0cTkwK0tmVmtWN1RZNDJzSW5hTVJzSDI5N2FoOWtIbnBB?=
 =?utf-8?B?VUlzL0sweWFqVzNQRW5QcElBMmZCOTB5T1hhN0JvSEpuY2JPTU93UitrcGZp?=
 =?utf-8?B?Y1VrQnZTUmkwNzhjb0dRMDhlUjMwUk9lOGI1ajVrSE5QM1FESzVwM0NIalJR?=
 =?utf-8?B?MjU1S1prOGRnejIyS1pQc3E0clNGcEp3K3B0R2lyWGFOVEVMclBwaEpnTUE3?=
 =?utf-8?B?OW1NSTMwOUFieTh2U3dTNDFheWFVejNDU01Rd0pUNGhaT2IxR0xVVGlsZUJB?=
 =?utf-8?B?MnJiMDJwQVJVa3RCZ3lVa2orQWd4MVVRZGpDV3VDUTJjNUJiQjZ5WkMwRlcy?=
 =?utf-8?B?ZkNtNGwwei9VbHRld0JyN3RrRkNURU9kUFFiUFppZGM4SE55cUhvQ2lHbis2?=
 =?utf-8?B?MWhERzYvWUtTNHhPWGg2ZEN2OE93emtHcmhZYlcwOWhtQ1FCTXR1UGlmNmdo?=
 =?utf-8?B?VjB2bldYc0FsVE9uajBTdUkzTTBkaUZRNHJ1RUpQYVBSZXh0d0hWZnVXSnhZ?=
 =?utf-8?B?K0lTK3ZkWkRkaVZUb2p0SW5tN2xwZXQ1ZU11cVZQT3V1Nzh5Ym5GTUU1czVh?=
 =?utf-8?B?UTA3WWpzTklJTUdaYytraTFreWtEeFBDM1pEQlB2WnpXSjRSQW1qRjl0K0Y4?=
 =?utf-8?B?SGxCVjlCUVBHeFhZMDh2czNBdWhYSmFaT1krd1g1VXFTNnQxdW9lRG9vME0x?=
 =?utf-8?B?bGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d53bbd2f-fd5a-49e3-ac1c-08dca22a91c0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4977.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 04:24:49.8789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g14NEUxCpgahJbnwGutdHrWk2yxl9eR+3bV8wNqKA/Cwur1m9eEhJM+kgKVQoVg91jwibKnsM0PO5ePAwTqz2ngFhOig8lF4T80QDREqSIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6527
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


On 7/11/2024 5:32 AM, Matthew Auld wrote:
> On 11/07/2024 10:19, Akshata Jahagirdar wrote:
>> Xe2+ has unified compression (exactly one compression mode/format),
>> where compression is now controlled via PAT at PTE level.
>> This simplifies KMD operations, as it can now decompress freely
>> without concern for the buffer's original compression format—unlike DG2,
>> which had multiple compression formats and thus required copying the
>> raw CCS state during VRAM eviction. In addition mixed VRAM and system
>> memory buffers were not supported with compression enabled.
>>
>> On Xe2 dGPU compression is still only supported with VRAM, however we
>> can now support compression with VRAM and system memory buffers,
>> with GPU access being seamless underneath. So long as when doing
>> VRAM -> system memory the KMD uses compressed -> uncompressed,
>> to decompress it. This also allows CPU access to such buffers,
>> assuming that userspace first decompress the corresponding
>> pages being accessed.
>> If the pages are already in system memory then KMD would have already
>> decompressed them. When restoring such buffers with sysmem -> VRAM
>> the KMD can't easily know which pages were originally compressed,
>> so we always use uncompressed -> uncompressed here.
>> With this it also means we can drop all the raw CCS handling on such
>> platforms (including needing to allocate extra CCS storage).
>>
>> In order to support this we now need to have two different identity
>> mappings for compressed and uncompressed VRAM.
>> In this patch, we set up the additional identity map for the VRAM with
>> compressed pat_index. We then select the appropriate mapping during
>> migration/clear.During eviction (vram->sysmem), we use the mapping 
>> from compressed -> uncompressed.
>> During restore (sysmem->vram), we need the mapping from uncompressed 
>> -> uncompressed.
>> Therefore, we need to have two different mappings for compressed and 
>> uncompressed
>> vram. We set up an additional identity map for the vram with compressed
>> pat_index. We then select the appropriate mapping during 
>> migration/clear.
>
> Nit: Formatting looks off.
Will fix this.
>
>>
>> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
>
> Should this not be earlier in the series. I would have expected it to 
> be the first patch, since both the new clearing and copy logic are 
> built on top of this AFAICT.
>
So, clearing logic is not dependent on identity map changes.
To clear the BO, we modify using an uncompressed pat-index that 
indirectly updates the
compression status as uncompressed i.e zeroed CCS.
So, kept the current patch order as
  1. Handle clear ccs logic for xe2 dgfx
2. selftest to check clearing of bo and ccs
3. introduce identity map patch - needed for migration changes.
4. migration logic implementation
5. migration selftest
>> ---
>>   drivers/gpu/drm/xe/xe_migrate.c | 55 +++++++++++++++++++++++++--------
>>   1 file changed, 42 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c 
>> b/drivers/gpu/drm/xe/xe_migrate.c
>> index 2fc2cf375b1e..a3d6d3113ac2 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -120,14 +120,20 @@ static u64 xe_migrate_vm_addr(u64 slot, u32 level)
>>       return (slot + 1ULL) << xe_pt_shift(level + 1);
>>   }
>>   -static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr)
>> +static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr, bool 
>> is_comp_pte)
>>   {
>>       /*
>>        * Remove the DPA to get a correct offset into identity table 
>> for the
>>        * migrate offset
>>        */
>> +    u64 identity_offset = 256ULL;
>> +
>> +    if (GRAPHICS_VER(xe) >= 20 && is_comp_pte)
>> +        identity_offset = 256ULL +
>> + DIV_ROUND_UP_ULL(xe->mem.vram.actual_physical_size, SZ_1G);
>> +
>>       addr -= xe->mem.vram.dpa_base;
>> -    return addr + (256ULL << xe_pt_shift(2));
>> +    return addr + (identity_offset << xe_pt_shift(2));
>>   }
>>     static int xe_migrate_prepare_vm(struct xe_tile *tile, struct 
>> xe_migrate *m,
>> @@ -214,12 +220,12 @@ static int xe_migrate_prepare_vm(struct xe_tile 
>> *tile, struct xe_migrate *m,
>>       } else {
>>           u64 batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
>>   -        m->batch_base_ofs = xe_migrate_vram_ofs(xe, batch_addr);
>> +        m->batch_base_ofs = xe_migrate_vram_ofs(xe, batch_addr, false);
>>             if (xe->info.has_usm) {
>>               batch = tile->primary_gt->usm.bb_pool->bo;
>>               batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
>> -            m->usm_batch_base_ofs = xe_migrate_vram_ofs(xe, 
>> batch_addr);
>> +            m->usm_batch_base_ofs = xe_migrate_vram_ofs(xe, 
>> batch_addr, false);
>>           }
>>       }
>>   @@ -251,7 +257,7 @@ static int xe_migrate_prepare_vm(struct xe_tile 
>> *tile, struct xe_migrate *m,
>>             | XE_PTE_NULL);
>>       m->cleared_mem_ofs = (255ULL << xe_pt_shift(level));
>>   -    /* Identity map the entire vram at 256GiB offset */
>> +    /* Identity map the entire vram for uncompressed pat_index at 
>> 256GiB offset */
>>       if (IS_DGFX(xe)) {
>>           u64 pos, ofs, flags;
>>           /* XXX: Unclear if this should be usable_size? */
>> @@ -294,6 +300,30 @@ static int xe_migrate_prepare_vm(struct xe_tile 
>> *tile, struct xe_migrate *m,
>>           }
>>             xe_assert(xe, pos == vram_limit);
>> +
>> +        /*
>> +         * Identity map the entire vram for compressed pat_index for 
>> xe2+
>> +         * if flat ccs is enabled.
>> +         */
>> +        if (GRAPHICS_VER(xe) >= 20 && xe_device_has_flat_ccs(xe)) {
>> +            u16 comp_pat_index = 
>> xe->pat.idx[XE_CACHE_NONE_COMPRESSION];
>> +            u64 vram_offset = 256 +
>> + DIV_ROUND_UP_ULL(xe->mem.vram.actual_physical_size, SZ_1G);
>> +
>> +            level = 2;
>> +            ofs = map_ofs + XE_PAGE_SIZE * level + vram_offset * 8;
>> +            flags = vm->pt_ops->pte_encode_addr(xe, 0, 
>> comp_pat_index, level,
>> +                                true, 0);
>> +
>> +            /*
>> +             * Use 1GB pages, it shouldn't matter the physical 
>> amount of
>> +             * vram is less, when we don't access it.
>> +             */
>> +            for (pos = xe->mem.vram.dpa_base;
>> +                 pos < xe->mem.vram.actual_physical_size + 
>> xe->mem.vram.dpa_base;
>> +                 pos += SZ_1G, ofs += 8)
>
> Nit: Formatting looks off?  There are some other formatting issues 
> reported by checkpatch in the ci results.
>
> Also it looks like there were some recent changes in 
> xe_migrate_prepare_vm, with how the identity map is constructed. I 
> think this will need to be updated to match? See: 
> 6d3581edffea0b3a64b0d3094d3f09222e0024f7.
>
I see, will update according to these changes. Thank you!
>> +                xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
>> +        }
>>       }
>>         /*
>> @@ -475,7 +505,7 @@ static bool xe_migrate_allow_identity(u64 size, 
>> const struct xe_res_cursor *cur)
>>   }
>>     static u32 pte_update_size(struct xe_migrate *m,
>> -               bool is_vram,
>> +               bool is_vram, bool is_comp_pte,
>>                  struct ttm_resource *res,
>>                  struct xe_res_cursor *cur,
>>                  u64 *L0, u64 *L0_ofs, u32 *L0_pt,
>> @@ -487,7 +517,7 @@ static u32 pte_update_size(struct xe_migrate *m,
>>       if (is_vram && xe_migrate_allow_identity(*L0, cur)) {
>>           /* Offset into identity map. */
>>           *L0_ofs = xe_migrate_vram_ofs(tile_to_xe(m->tile),
>> -                          cur->start + vram_region_gpu_offset(res));
>> +                          cur->start + vram_region_gpu_offset(res), 
>> is_comp_pte);
>>           cmds += cmd_size;
>>       } else {
>>           /* Clip L0 to available size */
>> @@ -778,17 +808,17 @@ struct dma_fence *xe_migrate_copy(struct 
>> xe_migrate *m,
>>             src_L0 = min(src_L0, dst_L0);
>>   -        batch_size += pte_update_size(m, src_is_vram, src, 
>> &src_it, &src_L0,
>> +        batch_size += pte_update_size(m, src_is_vram, false, src, 
>> &src_it, &src_L0,
>>                             &src_L0_ofs, &src_L0_pt, 0, 0,
>>                             avail_pts);
>>   -        batch_size += pte_update_size(m, dst_is_vram, dst, 
>> &dst_it, &src_L0,
>> +        batch_size += pte_update_size(m, dst_is_vram, false, dst, 
>> &dst_it, &src_L0,
>>                             &dst_L0_ofs, &dst_L0_pt, 0,
>>                             avail_pts, avail_pts);
>>             if (copy_system_ccs) {
>>               ccs_size = xe_device_ccs_bytes(xe, src_L0);
>> -            batch_size += pte_update_size(m, false, NULL, &ccs_it, 
>> &ccs_size,
>> +            batch_size += pte_update_size(m, false, false, NULL, 
>> &ccs_it, &ccs_size,
>>                                 &ccs_ofs, &ccs_pt, 0,
>>                                 2 * avail_pts,
>>                                 avail_pts);
>> @@ -1029,14 +1059,13 @@ struct dma_fence *xe_migrate_clear(struct 
>> xe_migrate *m,
>>             /* Calculate final sizes and batch size.. */
>>           batch_size = 2 +
>> -            pte_update_size(m, clear_vram, src, &src_it,
>> +            pte_update_size(m, clear_vram, false, src, &src_it,
>>                       &clear_L0, &clear_L0_ofs, &clear_L0_pt,
>>                       clear_system_ccs ? 0 : emit_clear_cmd_len(gt), 0,
>>                       avail_pts);
>>             if (xe_device_needs_ccs_emit(xe))
>>               batch_size += EMIT_COPY_CCS_DW;
>> -
>>           /* Clear commands */
>>             if (WARN_ON_ONCE(!clear_L0))
>> @@ -1146,7 +1175,7 @@ static void write_pgtable(struct xe_tile *tile, 
>> struct xe_bb *bb, u64 ppgtt_ofs,
>>       if (!ppgtt_ofs)
>>           ppgtt_ofs = xe_migrate_vram_ofs(tile_to_xe(tile),
>>                           xe_bo_addr(update->pt_bo, 0,
>> -                               XE_PAGE_SIZE));
>> +                               XE_PAGE_SIZE), false);
>>         do {
>>           u64 addr = ppgtt_ofs + ofs * 8;
