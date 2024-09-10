Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C34EDE996
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 01:31:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E829210E585;
	Tue, 10 Sep 2024 01:31:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JCW2dO4m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAFDB10E585
 for <Intel-Xe@lists.freedesktop.org>; Tue, 10 Sep 2024 01:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725931910; x=1757467910;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vaox456O1swMq9u/Qn9vxqpX5DeL3V4+iJ7u0Jzg5fI=;
 b=JCW2dO4mQy0OmZc540ISFwBraDgxvX53LkNChjK6lqEm9SzKpx+EJdcN
 utm2a/+cTaOW8xiFIPcczbXUa+SRtNcYKlBYZrO8jsUU+VDT/YyJWjL0p
 s4jB4qdd9OQDbKG8L/yxVl0LC9I09f56Gz9x+IWwbrQwnq4S+sL+DNKRp
 XqEM/37TJuu4bEz+FWJ0UM0xmRQ+R0TSP3T2c2P8/+Tnz97CFTzo2OtoZ
 XvqFss15vCdzxacVxuDvHO4u/c2by/OtjMLtgsmVsx6FVHLNp4ejWo/ry
 GrgJEEHl4++JULskKaz9tMV+z5ZtoDoZsX4I5EzsZOKqfY+N4P1fTcuaR Q==;
X-CSE-ConnectionGUID: Rnv0nq61SueqpwollTil+g==
X-CSE-MsgGUID: d8qwTwabR6KOsiJROLS1jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24601132"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; d="scan'208";a="24601132"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 18:31:49 -0700
X-CSE-ConnectionGUID: 7Of0GuUQTqep4N2jutaj/g==
X-CSE-MsgGUID: issS43iWRSqmeyGrWf1e2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; d="scan'208";a="67151091"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Sep 2024 18:31:49 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 18:31:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 18:31:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Sep 2024 18:31:48 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Sep 2024 18:31:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bTRo7d1ao3YCoeW6Nyel3F4pJB4OnTOrJWSRS2gbUUDByjXqvJQV5g29z8H4GfcN5Ki+6HpAi9uXoYVc0RhqEfBH+uml13PnNhRwclGBqPDeQOwKaeFqaEz3AhF32n+WmstLTTcA3/8oSqaD9x6IIQbSsof4q86tsxM1gFX1yVQroRn+P8uSWW9L9omHsJzyX+ZswycqtK0d4IPdUdQo0sjpjk7n5rvbghyeAC2xgjXyfPPH9q1KPcT2n4+fVjzzjEEaXKdbKRu4k5LB4HikFWZxy+vaCulJ0sfqAFbd5U1mT1ecCU3CWQhCeNDZzrskSeg5OvgHJWZvVYTtjWxnfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNuCT5M0KRG3dBuPN/0H+L9jVkPyJzIJK33X/s1FzhU=;
 b=hrA72iIibHzkCmBMRTZ2zavnfPoH2fH5Soyp94r3n2PyhQpySKI6GxeH7nph5IPWevWOSalhBjaeB0oH3WxwTp4xfowAABO7e8o0B1o29ijW30VrVuNdGha3quqcwUY0JzMWdfKjQR6AqBb2H7wCpyhI4oGg9nahrzT7Mm65hnaGtxzu2IWQLsq7GRVcaZxThzeb/VAwKyeesL8cHdNm16rgdTbZQYw5FPpmUbM5DeFTLbSjHDW8iA3arQQ+fw2ft0pQL+NXk+pSFBNVF2KHiJrEhZJQHsopHkRvSlznCeSJgAq/V1p8QUDdbXGtI6N29qCKOvwopubZhgNOyJX4Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CY5PR11MB6437.namprd11.prod.outlook.com (2603:10b6:930:36::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 10 Sep
 2024 01:31:44 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%7]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 01:31:44 +0000
Message-ID: <21bc8c69-3a0f-4c68-99af-63f3f029f37a@intel.com>
Date: Mon, 9 Sep 2024 18:31:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/10] drm/xe/devcoredump: Add ASCII85 dump helper
 function
From: John Harrison <john.c.harrison@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
References: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
 <20240905205106.1063091-4-John.C.Harrison@Intel.com>
 <sm6iyfzcaq6vbgytgueqqbjjzjniarulya6xzsuo7gyollceyj@iovrnktwvloq>
 <d80bec85-adfe-4410-ae04-e6bb0f41c764@intel.com>
 <avsxdhqepybtshgp3zfhdtv2beqaub7mg3nvkj7yws7utc5e5p@44uqzzgz6h3m>
 <b2002802-50d5-42bd-abb3-ffdf8ed33e69@Hendrik.org.uk>
Content-Language: en-GB
In-Reply-To: <b2002802-50d5-42bd-abb3-ffdf8ed33e69@Hendrik.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:254::22) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CY5PR11MB6437:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d3c64ce-3987-4399-f958-08dcd1385467
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VCtpMHlxQ014QVk2bU16RDhWY0FHZUt0RjNKaWR5ZGpRVGM1Q0lMT0U2MWpk?=
 =?utf-8?B?YmhqWXIrdTZrRzErQzliVkdTYVVwR1FzRWJ3VDlnaTljQ0poQTVsbExlRTFs?=
 =?utf-8?B?cHJrdXhlRlhabnhkakVIYWZaNVpjUyt4TDRBQm5BS044aTVJN2pwa2dJRVMr?=
 =?utf-8?B?L3dzQlZUcEd2YUJqY2pSallYclYyV1hiWEZlOHpIY3dQL0hGSksvNjlKSXAz?=
 =?utf-8?B?em05eW14alRaUTRla3Y0clloQnlTVmpJQUZaTmp4aWhMUGU3YnYvWFU2c0dw?=
 =?utf-8?B?ZFFuUmlxMjlLT2pNdVljdmRjc2hlenlsU2pOc041MVgrM3dHcy84NXNmOXFH?=
 =?utf-8?B?dW9yeldFUVNEeXV0cHJQd2lWcm5wdERRcWREeXJLa2luUURwd050Mnp6Kzlz?=
 =?utf-8?B?eWU1ajc1ekR5T0QvazlsUm4yVkk0V0lmWGUySjYrUVRyUm9wbDROdnIydDhl?=
 =?utf-8?B?TGVtVExJdVdhVWFXdVo1eFlDNDg5M0hVd1pvUHppM0RmQjdKOFhjOFFzUWxK?=
 =?utf-8?B?ci96OHZnUnNTZjE4THk2S1BUdEQzUzZGZndOL0dQUlpqb2JYcnVUdnRhSVdP?=
 =?utf-8?B?SXhIdU5vQnJVMVNyWjVEMVdjL1NLVDRxN1MweHlURStTM29uUWFvNlVlb01Q?=
 =?utf-8?B?Q2tCSm1UdkFxaTBCY1Z1dHlvT0lBS0hxblkwemtQMTR2UG45b3d6aEE4SlMz?=
 =?utf-8?B?SldhVmN4Snc4ckJyOTRhenRSdHNScjY1elhZUXVhSkthY1pRWk5LbCtrekly?=
 =?utf-8?B?Tms1RlozaWd5dnJpOWFtdFE3WnlueGtVVk9iNzZOVW5UOGFGUzdSLzNYQklR?=
 =?utf-8?B?Wm1zL3hmT3o2ejBBdTM5YVJzVmJOcmUweUdVdWg0NEpYdWsyb2VCUFNyMVh5?=
 =?utf-8?B?UUJuZzZ2WE5ERjQ1aVpueWVrdUpyMjJwbU9PRnoxZkNzNXl1TlhVM0NaUis3?=
 =?utf-8?B?RXhYbldIeFo4WHdDb1VvbldNL1N1SmtIMWlGUldpdzNWejIzNEY5NnN1eG42?=
 =?utf-8?B?RThqQVQyUjZQdlExUUhLWHV4RDhlNzJ5WWlPZExQbks2eCtsV0tvQnptS2ZL?=
 =?utf-8?B?UHQrQlFlQS9rbGk3VTcwaXhiRjVOSWhlSzNPR1dmZ1BNRlpOQi9LZ3QzZ01H?=
 =?utf-8?B?b2dXM0hJeUR6cklvZUVCQmx0ZExoTEN3S3h1NDR3VG0yYjg4WnFJL3hzK3pU?=
 =?utf-8?B?aTZkNEYzZWk0VHl1MUdORFdQZFpEK0pDM0M4YnM1OGI5Q2Y4OUEyUXZqZ0N3?=
 =?utf-8?B?WTRKbWZ4bnppZ1I4TVdxMUxUYmd3U0VzQVVOL1duZUxDN0JQdEwvTDV1VjBl?=
 =?utf-8?B?VW95K0grOXdOV0JkQnE5WVNhUXdUbG5aZkk4SSs5OE10M2JudGtadHRvK2U5?=
 =?utf-8?B?bHRLeFJ4d0pXUkUrenIyNlpVaWh3UFlxc1ZXNXNEOWcvVkFjTHhqM0Z4RCth?=
 =?utf-8?B?bitDb3pSMTREelpyV3BuR2cwcHA2MUFPb2JWeTFMS2JUWmFXd0dlSlRkbnZW?=
 =?utf-8?B?THIzQ01ORUJMS21QdDdiSHRqVkRZYVBIaUkxa1ZsZThXM0NkL3A5OG1UVmNs?=
 =?utf-8?B?SHg1ekhKRkwyazU5Ynk2QVN6YnJRQmF6K0RMS2hLbitlWXoySk9wUW90anBh?=
 =?utf-8?B?RW9OYVgrYjVQamRFSzhwRHRENkZPOGZaZXlsMXMyZjZFN1VCUnV6b1M3aU1J?=
 =?utf-8?B?MjFQM3JaRGVTVEhCQVRnUjhnekJhTnkySDdZRzR1MEJSR3dMbFl1WklYQzZq?=
 =?utf-8?B?QldXTzB6d2x4R3N2cUJmYmpwNzl5UmlGcmxlYzZkMW1LN05seHlsT1FuZTQ4?=
 =?utf-8?B?N0lYM29zOGJkMEd3TmVXUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUdWUWdva2dvUHNCK1Z6ak5wU0k1eXExZENYU201ODJVaFBZVllFZXpocGpi?=
 =?utf-8?B?NGhmcDM4M2pZV0VZSWdLV2Q5NFVZT2VoaDhRSVRneVY2ZDVvY0s4TmNlUVRt?=
 =?utf-8?B?bXlhWW44ajVuOXh3ZHl3TEtwQnorUnhhNFZyS0xXd0JBMkZHYVoyVTNrY256?=
 =?utf-8?B?Nkdpa1J0VDNyNmkrRUlZWmpXeUxUbk1HNno4M2E0K3NHMkNpS0ovbVM2dzRu?=
 =?utf-8?B?eTJPZ2xzbXpibWN6SHl6QTZCMkNkMG5UVWtmT2VWMzZnams5a3c3b2xkWkFD?=
 =?utf-8?B?UHdPWE9lR05waGc2V28rNTludVlyaWxMaTd6OHZxQzV1MFJQTU9Ic0E1SEpJ?=
 =?utf-8?B?K1JNTG1uWDhMdTM0cG5tb3YrU3ZKYjVyQ1lFSm5vR2tlSytYWHh2OWJyd2pu?=
 =?utf-8?B?TWNzb0NUUlpwOVk1Q2pEUVc4VDQrQ2dlRU5hWXE2bTB1OTBmV0N2dnF4dHhm?=
 =?utf-8?B?dmtYbWdhY05lb2d3TEI3elhVTzRaOHpEQStjN3hGbWhxOE4xN3kyaVUyb3pC?=
 =?utf-8?B?VlNsN3N4cnRha0RPTEhwTjBIWEtuR2ZCSHNTMW1ucms4SSt0M3NxMS91bjZX?=
 =?utf-8?B?VDh6MEhNNktUb2JyNTcyV1lOcWxMdk5XZUw1RGFXWDh4S1pNOURiclZXRjlR?=
 =?utf-8?B?Z3R2MStoZzR3VWRFMmozZTRvN3Q1VXBhdUVGWDkrVlE0SFFaQUR1NGhnMHhP?=
 =?utf-8?B?eFErREFRbzBQRFRaMkxMN0ZTdkJjVGpUREN1UDQwc2NENDFpMGo5aTNuVzlP?=
 =?utf-8?B?ZVQxRmFZcklhZno2SmZ0KzFPWXl1bDJFOW1CNTZYZ2dyUUVLdWVlZFNzclhz?=
 =?utf-8?B?ak4wejlmZlR5bUNiVFBnQ1ovUUVNZzJZRjZEUkw2L3VoYXZDY1Z0b0xscnJV?=
 =?utf-8?B?SThldmRJSWlZWGhKcDJZSUk1TnRFQUYyL1d0bDhnUVR0WHFpTXJPTjBqMERi?=
 =?utf-8?B?NzR1dzlhazYvTEtoeXRqeDNnYWhTRUJTVlh0NW93SzZCNE9TbDJkcGlFN01m?=
 =?utf-8?B?a2FzTWZodFBacEFPN01jZGFiQzV2N3Q0TjZPY0pjSDE4Z25qN255RXJmWU02?=
 =?utf-8?B?NWZ3dnVVSkJTVHpKU2Z6REdVQXdSdW5YMkM2dGpxOEU3dkRxUDdJWllNM3F2?=
 =?utf-8?B?bkhndW1XRTFNekV4TGp6eGpZOFhYTDVSeUU1WFNtb1E3aE03Tk96UEFHWFNS?=
 =?utf-8?B?U0RaQUxsTDRRSk43UkF4elRsNFdjOG5wUGpnTkRHWVQwSVRuQVZXeUdoQnpP?=
 =?utf-8?B?WHpSeFlkYmlhelNEY05FaGN0MjMxQ09nR0ZRSlNiWVJTS2hNOWJ0dExNc0po?=
 =?utf-8?B?b05ibUFYKzZLbk8wNFZ1dDhiN2M4WFE2THBxTHRLV2lQNmdvRmtqd3dRajlH?=
 =?utf-8?B?WjQ4OEQ2RlJiZjJMdUJmcXVTdkE5VXlZWWN4Q0FjRFNRN3h0T05ZWCsxcTh1?=
 =?utf-8?B?S0doYlV6QWJSS1ptTDVLTGNxci9xVEY2QzBmTUtDNUpVbzIzaWkvMTAxOXZD?=
 =?utf-8?B?OFhySi8vOXIyK3ZKYzhCeE56dWNpSXU0dHQwQ2pyUUxtYjI2cUI3Z3BjSXVH?=
 =?utf-8?B?czJTSXFiR3ZOdWppQ2tONW9Rd3hWdGhpRkZSTWNZTDNuL1Z5OWdLdi91V2c3?=
 =?utf-8?B?bkFRdjlRaVJEVHp6VE1ibFFkVFUwQzVKeUZmWnIyZUV6YktnVVY5YmVnU3Yz?=
 =?utf-8?B?TEkvRTlCOWtJaGo5V2w2UExCZVFTMFZpQWNjTXFONlRoTjdFVlJsZk5sUFZV?=
 =?utf-8?B?cHhGTjZsZFRvUERqaThlYWhIS283RGx4LzdiYis2MmxNTjJEV1RVbXFjemp2?=
 =?utf-8?B?YVlvNXJ4RmRNNGtBYTZtalFKUWUrSThacUVZOUFka083NFBaNjc3aXhrdS9l?=
 =?utf-8?B?OWZ3TGwrYmphMmJGaEtOMUZTVzRxTXFwSlh5d0grRVBhNWhuTFcwdERDbGk3?=
 =?utf-8?B?YmpBNjdlK2NDNVlLTUlkMGlwcVRyMnQxc2lZMDZsZ2F2ZXhzaVB2Wllqb0ly?=
 =?utf-8?B?SUhRRTZnWS9GL0RrM2twMGtodmtwQW4xa2dMY3o3cDZhbG9OdlhiQkVBak5X?=
 =?utf-8?B?a1hTdUZlbU1tYXpGaktFQlI5RzVnbHdLK0VJcElSRVllTzB2bmNFWDQwSy9l?=
 =?utf-8?B?YS9zdUEwVzlCaHF5Skt6OFRIMW0xenFWYlljMlRhaGk0ZXhZNGIxQVFzTGJ1?=
 =?utf-8?B?Qnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d3c64ce-3987-4399-f958-08dcd1385467
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 01:31:44.6370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YJ+dLUHY9z1CT7AHmtsK1eFqdympfw6NOzXPAynfwnQxz+auqxaxwB63wOupt4sla/hpSKLOyoelHwWLWUhnjgKiK/YOvTag/2CL3eLj/D0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6437
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

On 9/6/2024 19:06, John Harrison wrote:
> On 9/5/2024 20:04, Lucas De Marchi wrote:
>> On Thu, Sep 05, 2024 at 07:01:33PM GMT, John Harrison wrote:
>>> On 9/5/2024 18:54, Lucas De Marchi wrote:
>>>> On Thu, Sep 05, 2024 at 01:50:58PM GMT, John.C.Harrison@Intel.com 
>>>> wrote:
>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>
>>>>> There is a need to include the GuC log and other large binary objects
>>>>> in core dumps and via dmesg. So add a helper for dumping to a printer
>>>>> function via conversion to ASCII85 encoding.
>>>>
>>>> why are we not dumping the binary data directly to devcoredump?
>>> As per earlier comments, there is a WiFi driver or some such that 
>>> does exactly that. But all they are dumping is a binary blob.
>>
>> In your v5 I see you mentioned
>> drivers/net/wireless/ath/ath10k/coredump.c, but that is a precedence for
>> including it as is from the device rather converting it to ASCII85 or
>> something else. It seems odd to do that type of conversion in kernel
>> space when it could be perfectly done in userspace.
> It really can't. An end user could maybe be expected to zip or tar a 
> coredump file before attaching it to a bug report but they are 
> certainly not going to try to ASCII85 encode random bits of it. 
> Whereas, putting that in the kernel means it is just there. It is 
> done. And it is pretty trivial - just call a helper function and it 
> does everything for you. Also, I very much doubt you can spew raw 
> binary data via dmesg. Even if the kernel would print it for you 
> (which I doubt), the user tools like syslogd and dmesg itself are 
> going to filter it to make it ASCII safe.
>
> The i915 error dumps have been ASCII85 encoded using the kernel's 
> ASCII85 encoding helper function since forever. This patch is just a 
> wrapper around the kernel's existing implementation in order to make 
> it more compatible with printing to dmesg. This is not creating a new 
> precedent. It already exists.
>
>>
>> $ git grep ascii85.h
>> drivers/gpu/drm/i915/i915_gpu_error.c:#include <linux/ascii85.h>
>> drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:#include <linux/ascii85.h>
>> drivers/gpu/drm/msm/adreno/adreno_gpu.c:#include <linux/ascii85.h>
>> drivers/gpu/drm/xe/xe_lrc.c:#include <linux/ascii85.h>
>> drivers/gpu/drm/xe/xe_vm.c:#include <linux/ascii85.h>
> And the list of drivers which dump raw binary data in a coredump file 
> is... ath10k. ASCII85 wins 3 to 1.
>
>
>>
>>>
>>> We want the devcoredump file to still be human readable. That won't 
>>> be the case if you stuff binary data in the middle of it. Most 
>>> obvious problem - the zeros in the data will terminate your text 
>>> file at that point. Potentially bigger problem for end users - 
>>> random fake ANSI codes will destroy your terminal window if you try 
>>> to cat the file to read it.
>>
>> Users don't get a coredump and cat it to the terminal.
>> =(lk%A8`T7AKYH#FD,6++EqOABHUhsG%5H2ARoq#E$/V$Bl7Q+@<5pmBe<q;Bk;0mCj@.3DIal2FD5Q-+E_RBART+X@VfTuGA2/4Dfp.E@3BN0DfB9.+E1b0F(KAV+:8 
>>
>>
>> Lucas De Marchi
> They might. Either intentionally or accidentally. I've certainly done 
> it myself. And people will certainly want to look at it in any random 
> choice of text editor, pager, etc. 'cos you know, it is meant to be 
> read by humans. If it is full of binary data then that becomes even 
> more difficult than simply being full of ASCII gibberish. No matter 
> what you are doing, the ASCII version is safer and easier to look at 
> the rest of the file around it.
>
> I don't understand why you are so desperate to have raw binary data in 
> the middle of a text file. The disadvantages are multiple but the only 
> advantage is a slightly smaller file. And the true route to smaller 
> files is to add compression like we have in i915.
>
> John.
>
PS: Also meant to add that one of the important uses cases for dumping 
logs to dmesg is for the really hard to repro bugs that show up in CI 
extremely rarely. We get the driver to dump an error capture to dmesg 
and pull that out from the CI logs. Even if you could get binary data 
through dmesg, pretty sure the CI tools would also not be happy with it. 
Anything non-printable will get munged for sure when turning it into a 
web page.

John.

