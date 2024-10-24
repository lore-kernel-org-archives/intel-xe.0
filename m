Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC224CE8E73
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 13:12:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59A010E937;
	Thu, 24 Oct 2024 13:12:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JwzydKqq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4060B10E937
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Oct 2024 13:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729775541; x=1761311541;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xR0DVULZTR8T/ftPU1vesi6Nsw++ChldCSRDrpDtf4o=;
 b=JwzydKqqUAbuCQY9al4h410IaOQT4FfYLz8XscPc2llN/sOhs7cOTFSQ
 BXwEJzHl6MvVyoAgohWMHM7nh7cONvNF+aSDKb4seEN/ym/6fPR8on6Xw
 bz0sZpLbSeKzyah6Zb7ATBbc1RIaCOfDlqODfO9RRzNPjbUSSo1LkfJ/v
 tU3Y2yKSVs2nDtgmeoGKouVmdTai258y5dhBJy27ZnGylp5oOb21VO+Qu
 INFw33STTkd9cnLKK++uYenkip2dgItTPq6kLbtuhuPrk1dKUue6q4WVw
 gdn6ZqlkoSPbBq/UaeL0opp8E7eRs5ECfbTS8huAgvK5YZhm+n5Crl64r g==;
X-CSE-ConnectionGUID: RKOaZJN3T2eSfhtDGGKyqQ==
X-CSE-MsgGUID: rDLuZ2Z4S4iEAQQ83Ekk6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="29515802"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="29515802"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 06:12:21 -0700
X-CSE-ConnectionGUID: YDzfBJ2vS66KFD+h72Qrbg==
X-CSE-MsgGUID: j9spZw2XTzuo3s+VSG0IHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="80682220"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2024 06:12:20 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Oct 2024 06:12:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 24 Oct 2024 06:12:20 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 06:12:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ug7yjBTFXOOe7GTgqPooD4kiwZu+QpTUfy+vrl6AybdggRDet8aNdXB8aMtvhMtSyrAscE4N3QqwZVUSi5WMj6+Xg3gBPu3nUR363J2H0EsinGNO+DCPlPmDqCiRBT/3k6OjxpIpDhi8eqQ33lAJV5VoKXms0wdMkx28RSeNywsP6WLBkGTuVeiTi9H4o8KaBdtVgH/+TMOUWiK8rk6a1cJQ+MPz/q0bL1fBFjGWjbkWAgJo/FkpPbVRQlEQNeE3W54Sl+Xvn6ATUtY6Owj00NyH+KuYK2S3GawNCM7UEgTC4GEnKUVy1VYRgRdjdDcBWv7oE9Zw76yBQoxpe8UQIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xR0DVULZTR8T/ftPU1vesi6Nsw++ChldCSRDrpDtf4o=;
 b=M/r4+Mkw9mB9GmHsltwjhKINQXm6oRNDDRy2h0DzAs3sKKDsebLoyU8/yAVlKqP1ye332X/ks9SlRQ3kjBonJxG1aVGlGyX5JivqCFmwMdUlLFsiwYJBj3Pe0x/jWTmfFeNmzvMr5KFUOsdbqRfBOw06a0YbSwoS1UlUOMrtRNVifwtxGiXR/cFmxBa+JJymfciU3n0A8sE0fSE9Mym+gcGKIZ0kQm8T5tHGzMsdqY1i/A6ayxRN96P5aqOa+cHvSYFskVAOQlpTFwWbYh4zRU+Lpcrl9uv1y2sKUAetHLgIICwc0jZTQfF1FmzCErw6mZZccOzCB17wEOtM6dqQsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 CY8PR11MB7947.namprd11.prod.outlook.com (2603:10b6:930:7a::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.27; Thu, 24 Oct 2024 13:12:11 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 13:12:11 +0000
Message-ID: <ee0cff12-721e-497e-9a23-81b9dbbe26da@intel.com>
Date: Thu, 24 Oct 2024 15:12:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc/tlb: Flush g2h worker in case of tlb timeout
To: "Nilawar, Badal" <badal.nilawar@intel.com>, Nirmoy Das
 <nirmoy.das@linux.intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, John Harrison <John.C.Harrison@Intel.com>, "Himal
 Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Anshuman
 Gupta" <Anshuman.Gupta@intel.com>
References: <20241023151343.3463640-1-nirmoy.das@intel.com>
 <20af74cb-1ade-4f75-b73c-7e75b3651a00@intel.com>
 <6179d84e-a746-467e-a0ef-a04567dc0554@linux.intel.com>
 <24bebfeb-ffee-4c3a-8ab2-5ca76d086e59@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <24bebfeb-ffee-4c3a-8ab2-5ca76d086e59@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0011.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::14) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|CY8PR11MB7947:EE_
X-MS-Office365-Filtering-Correlation-Id: ec7d9894-efc4-4c6c-c6a8-08dcf42d789f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlFadzc1M2VRRXJTamF0QW5ZTmlrWTZ1cU5UUzZkc1BvTXZpZ2xtT1FleEE2?=
 =?utf-8?B?RlB6M3lnVS8zdENEbytXY0kzUXJZblI3MjVnS0VCc2t2eXFMbkNLM0RYY0xN?=
 =?utf-8?B?b3NtUjNWdnJ2WXdmODJXRW9qOFJ0dXM4S2lnblQ3TW5pcndraTQ2MXBNZUpM?=
 =?utf-8?B?SStIOEN5MGRrQ0dhK29hOEc4Z2V1WU1ySjZXcVFXRnZtN2tkRE5OOFA1VENS?=
 =?utf-8?B?Ni9PdHhSWTEwU0t6UmpZQk1KTCtHTENZem9qZndzR0MvaFhGTDlFNDg0UkE3?=
 =?utf-8?B?ejliVUVrTWxpN0p1bWJyRzNmb3ZWeHN2cUNSTE81OE9wM1FSRUVTb3l5Yk80?=
 =?utf-8?B?L0JnZ3NqOUlSQUFXa1dMczFsYUV0d2dRTEVsTFV2VWF5cmlIdUgzK0E2bGxV?=
 =?utf-8?B?U05CeTIzeDZqMFFtNWxsSmExdEU3M2tJNnZ1U2VBbEc5RVhGTW9XY05xbldO?=
 =?utf-8?B?Mjh0NUNvUEc5NEJqWWlJZjgySzVxOGd5SGJQSmNoRDNjTnZObmtuWlk3bm1D?=
 =?utf-8?B?VWx3elVEUWRCZE1sOVJqZ2lKM0lWVHAzVml6aWVSdmx4bDM1cnc2TDcweDlx?=
 =?utf-8?B?aTk3Z2JjSWJNdmZZVVJPTmxhNWFMVi8yazRPZUxhdlFZck0yTjQ5NFh6bmdU?=
 =?utf-8?B?dy9zdTd4Zm9ETTF3ZW05QWYvL1NlUnZQQ3NJSXRVK0I0VHVBYWp3cklFaFJF?=
 =?utf-8?B?ZXNCSHJtV3NMK2lvQXQvbGg4d0lacmlFVUs2Ym12dWgyaGNuR1FBVGd5elU3?=
 =?utf-8?B?Q2JpZDlxMVhzNk9uSG9vazEyNUwraGhZUXRuSzJSSXV3UXhZa2dMOG5OeHRu?=
 =?utf-8?B?a1FEVUM4SGt4dHFTby9hanlPbHd6SStxbmdZV0hFNmxndGxsVU1lUGpsTFUz?=
 =?utf-8?B?SkJ1M0NGOWpkVVdtTHFrc1d0UDlKa3IzRGF3UU5Iczk5UFFKMURBNHljSVZK?=
 =?utf-8?B?Y2tXUGNSY1Z3Vzh5NWlpdnMyMVF0TGtDWEZKM1VFN3k2QUcxOFVEWjZUUHFp?=
 =?utf-8?B?cVZEbGdhZWh6emQ3OEdEMkJiTHZpNVlGN0hZdVJnQnFSdmI0TVV2SXdaUGN5?=
 =?utf-8?B?ZGp1VENqWFhUa0FSdGt3cThHc1F4bXEvdUFtYnp4MjlDbHNKSVFuNUdwNDcy?=
 =?utf-8?B?enR1d0x5aGpMbU9uTHYzSHFBODMzSXlsQmZ5ZVAydFhwd1d3WHo3VnN6RFFI?=
 =?utf-8?B?Y0NwdXNIWlU1UXZGRVVGbXBIRC96TkxWQzVSdDdpUUZuMlJFSGkyRkllTURU?=
 =?utf-8?B?anRUU2hkeVNPUDFtWk5hcXpMNzViMk80Ri80RVNVWVVVZ3lNVElWSGgyT0Jj?=
 =?utf-8?B?TmNFcGpTbVk2TThCcmVidWFmMldLSmdFRFpvSHlSMTE3TndYUGpnQmdHRW1G?=
 =?utf-8?B?TmY4TjFscWdBbGcxU3VDYTdYTDlmZTZLNlpubFc1ZERtamZmS3BkOGw3Zkdi?=
 =?utf-8?B?UFI5cUtTTXFLZG1TMjJVS01Oc0VzN0dSK0drSWZwSHhHQUFhRmEvUlNCQmgx?=
 =?utf-8?B?VDBsTHRTY0k1VHpXK2tXV3RxSWwrb3dTRGF3VDc0S0N0ekFTdXM2ODNWRHp5?=
 =?utf-8?B?a3NaMXljbStQWWNhc1ZXeVRQVXpHOTB3NUJtOE9peStJRHRFSGU5ODBLL2pR?=
 =?utf-8?B?NHRnRWtSWklkSTc1YWZlc253WUxHZ2k4Q1M2cWl6Sm5yR0ZDVWthbEpndlBj?=
 =?utf-8?Q?8au+xcNwnG8HH9xsTST9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkpmaHdoWEVPYjNqSm5SWkhWQm5TM2pzV1BMbzhSTHVBcVpTNDJiMDZoVngz?=
 =?utf-8?B?YTBwL3k3c2JMQUd0MmRsTE9MUVJWY2FybmU5M3UyYmZZWFA2Vk5lZ2hubmw4?=
 =?utf-8?B?QUUrYVlOalZra1ZybkhlV3ZXVmN5VFJWZVBjcDU0dGVoTWhCck9YOEtHK2h6?=
 =?utf-8?B?STBvZXVRVmc5eGtaNGxtdy9qUzhYMXlKM05DRUN1dmhlN3RRYXBkN1NHcjdL?=
 =?utf-8?B?OW9ldVBtUDZ3djVGZ2x4QkFCUnpKRDMvY01lOUh5ekxYWGJDZzFYczBtZXJr?=
 =?utf-8?B?WFRHZlBsc0ZZZ05HcENlOGNHcEJKdEdkRzBBci9hTm0veUJYQytCZVNmY2VC?=
 =?utf-8?B?d0FaRCtycUYveTBFMVBsOFdLaWpXY0pFa1ZNOWxwc1BWUjE0YWRVOTVDVC93?=
 =?utf-8?B?WTZsYW4xVGludXB6Y3FoblFSR2NFVWk5dmNkeGVFdGJyUnk3S2lpVnVjNzIw?=
 =?utf-8?B?MW9JZE41NktwM0VKa1BvQlVtZVl2cTRQS2FKS2krUndJd1RoeVRrSTFFeHV1?=
 =?utf-8?B?YzBrR0ZBZEx6Mm5mdXphNENpVkhySjZVSHpqYWxUTlNGS0ZjbHVmS0lsdEVv?=
 =?utf-8?B?QXdUaHN2bTg4RG45MTQ5SnNrMVNsNFVFaGdVQlI5SnFHSUlPY1p2aWJwbjNX?=
 =?utf-8?B?RTRIYlM0ZGdOajVOTGlUTUlyVll0T3BzdkV2UERDcW9uWUVnMGRIbTVGMDBv?=
 =?utf-8?B?RVd2S2dzRnduNmFISmZicmNXRE5CU1JxRWY5OWRVbFNXTjF3SDZzMyt5eWpo?=
 =?utf-8?B?Q2RBS2VOQU5QUkFQSW5BNy9Makc1ZDNLKzJGeVFQeHI3andxbVVHeTJSVjMr?=
 =?utf-8?B?aGo1RnFhR2gzbGozdDZqWStGSWlyUXBGQ0FGWkU1Q3MrcjFobkZrSGhmWE9I?=
 =?utf-8?B?aURnRkQydGdpL3ZvYmV3ZHJHNDZBSlVKbGMvUWM4T2UreWRHakd6KzVaQW9x?=
 =?utf-8?B?NmZYSk9FNHZCdnBPbFh3eEVZTVJWRXBqUFlha0I1Sll0Ti9wRnd2YzZsSjNp?=
 =?utf-8?B?ZUQyMlJiWStQYzdOb1FXdXZLcmU3N1ZyaTlQb29UdWFkSEcvUGxsV2cvOTRY?=
 =?utf-8?B?ZzFnd1I3NU9pTTZIYnBBZW4rSmxMSVBHOVluTDF3WlZFVGphamd0cDNidW1Q?=
 =?utf-8?B?OVM5cDllWng0alVCUU1NK0g0UDBUU25samtYZXRJOHBkRHdrQ2tlaU9EcnNx?=
 =?utf-8?B?bGl5TWdpNFpScmh1aFZqMlhGNGFyc0YwT1dwZnh6TWJsTVlZUjliMWRERmd4?=
 =?utf-8?B?S1FJL01wTHI1NnpPZHJVQ3hkSCsvNGxkMkVoV3pIakpsSnBKbTd2S1gvZlVK?=
 =?utf-8?B?NE9xU2tpS283MFlQSi96TEZqdVdUUFpENnpoUDNBSEpwVXk4azdLT2NLd1k2?=
 =?utf-8?B?QUtxNXhzUDVMMTJ1dkJhT215d0h3WGw3emhNTVZyRXpvdGNhNXZBSi9teEZT?=
 =?utf-8?B?N3VCaGpNbGRFSDZ2U0JtK1FUWmFRd0RINERIcnFVczVZbjBDWVk5ZTl5S200?=
 =?utf-8?B?UmVJZ29SSldrczdWY2hVSU9MYVV6bnFsKzlmTGhIQit1ZCtLQTVJc1dkN2tH?=
 =?utf-8?B?ZVlCaFhKYnFoVnlDcmduRSt0S2p5VjlEbXUveDdMYXh0UUUvamQyRHA2V3Fz?=
 =?utf-8?B?akxqN3kwSkwvTEtCendFVk4vZWZ4UWFqaktnbTMvZ2MySk1TVG4rZ0tlcGE2?=
 =?utf-8?B?c0xseStTUjVTSXJ1UFVkNEhwbHUvcEl4QTZZazBiUkdsYVZXRUlpNC9kelI2?=
 =?utf-8?B?eDBiejFLY1ZFckxQQkV3VmpQNy9YMkt6TEpPcFpIczhYSUNSZlVHQ2RBQjRP?=
 =?utf-8?B?Vk1QaGsrMk5QNEpydzNjKzgrRGFJS2p3NDlIQTA2aGNCNzBmYTk2WUErWEtM?=
 =?utf-8?B?c3M3S2FMS3loRWNVUWEvWjdsakFaYWcvZEt3cnMxeFpYV2FXK0RFTVRsME9M?=
 =?utf-8?B?c20xUERmbEFHT1B2d2hmRldLNkJIZjd3RDlmNUJwZmZqZlBRcVA3K3pVSWtN?=
 =?utf-8?B?ZzM0TlNtT1hQYlo0VHBFVkNtenRKNWVrQVIrczNMS3FIWjcxSkFzaDdWd09w?=
 =?utf-8?B?Tk4vOVdpemZjeFhwK1RsSjN5RDk5dmZkK2JHdlJEYW5NTWQvMDFxYU0zSmJX?=
 =?utf-8?Q?clxETb53i46wmfQYIYLImhrxh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec7d9894-efc4-4c6c-c6a8-08dcf42d789f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 13:12:11.5973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ap05wJew+w3qafxagxxIAZuu/03JubsidKeoktJlRCKTg1fxJSYn7OMc8JV2+UWvc6uzBwAy91LQmPl0tfoc/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7947
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


On 10/24/2024 3:00 PM, Nilawar, Badal wrote:
>
>
> On 24-10-2024 15:47, Nirmoy Das wrote:
>>
>> On 10/24/2024 12:02 PM, Nilawar, Badal wrote:
>>>
>>>
>>> On 23-10-2024 20:43, Nirmoy Das wrote:
>>>> Flush the g2h worker explicitly if TLB timeout happens which is
>>>> observed on LNL and that points recent scheduling issue with E-cores.
>>>> This is similar to the recent fix:
>>>> commit e51527233804 ("drm/xe/guc/ct: Flush g2h worker in case of g2h
>>>> response timeout") and should be removed once there is E core
>>>> scheduling fix.
>>>>
>>>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2687
>>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 9 +++++++++
>>>>    1 file changed, 9 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>> index 773de1f08db9..2c327dccbd74 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>> @@ -72,6 +72,15 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>>>>        struct xe_device *xe = gt_to_xe(gt);
>>>>        struct xe_gt_tlb_invalidation_fence *fence, *next;
>>>>    +    /*
>>>> +     * This is analogous to e51527233804 ("drm/xe/guc/ct: Flush g2h worker
>>>> +     * in case of g2h response timeout")
>>>> +     *
>>>> +     * TODO: Drop this change once workqueue scheduling delay issue is
>>>> +     * fixed on LNL Hybrid CPU.
>>>> +     */
>>>> +    flush_work(&gt->uc.guc.ct.g2h_worker);
>>>
>>> I didn't get the idea of flushing g2h worker here. Moreover AFAIK tlb invalidation is handled in fast path xe_guc_ct_fast_path i.e. in IRQ handler itself. Is this change solving the issue.
>>
>> AFAIU g2h worker can also handle TLB_INVALIDATION_DONE message from GuC(process_g2h_msg). This indeed fixes the issue from me for LNL.
>
> Agreed, it does handle in the slow path as well, but upon receiving an IRQ, it will be managed in the fast path.
> So I suspect this is a case of an G2H interrupt miss rather than a G2H worker delay due to the efficient cores in LNL.
> For now, this change can proceed as it is helping out, but considering the possibility of an interrupt miss, I suggest debugging from that perspective.
> In another thread, Himal mentioned that this issue is also observed on BMG, which strengthens the possibility of an G2H interrupt miss.


on BMG and DG2 the signature is different, TLB timeout happens after GT suspend which shouldn't happen. So I am treating both(platforms) as separate issues

and for LNL the issue appears on BAT so targeting that 1st. On LNL, we likely have both issue, scheduling and possibly the interrupt miss. This helps on LNL

and I am going send a v2 with platform check so this doesn't interfere with the other bug on BMG and DG2.


Thanks,

Nirmoy

>
> Regards,
> Badal
>
>>
>>
>> Regards,
>>
>> Nirmoy
>>
>>>
>>> static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
>>> {
>>>          if (!xe_guc_ct_enabled(ct))
>>>                  return;
>>>
>>>          wake_up_all(&ct->wq);
>>>          queue_work(ct->g2h_wq, &ct->g2h_worker);
>>>          xe_guc_ct_fast_path(ct);
>>> }
>>>
>>> Regards,
>>> Badal
>>>
>>>> +
>>>>        spin_lock_irq(&gt->tlb_invalidation.pending_lock);
>>>>        list_for_each_entry_safe(fence, next,
>>>>                     &gt->tlb_invalidation.pending_fences, link) {
>>>
>
