Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4EDCCD1BC
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 18:47:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F6410E08C;
	Thu, 23 Oct 2025 18:47:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g6UGxV28";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D56BF10E08C
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 18:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761245251; x=1792781251;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=jRNtsGP/JZn1EvG5/mi18XK+LikDO0MrMF8qEozcsto=;
 b=g6UGxV28ANesoIwsZLCbZdt++3EBD/+XYHmZALlg2XyM2VBH35iCAyUM
 M1hzh5uK6pY30LQRKv0TTTXQxu2QJXb8Pifm2NOS3WreLYpHi12AAAmb+
 CwN+PypSvtU6uN4FnzDclO511GgZAX+EcfHkqECQF9VK2xOK+Bf1/LHXi
 3OSq7k3p7/hGaff5sQ7XVPnIsVa0NXePlxiwZH0OBAg3oc77dQ4QgfEnZ
 c1QSQOgqMIF2kTyMVd3EgN3N8todDbw6GsofYKkcUa/n4YoXu+yta9iDO
 K64IasCsWy3bItPW7tZYcJY4JTJWtWDW8UKgJm8wzJkb0mPreGlozvWA8 A==;
X-CSE-ConnectionGUID: pkjXwwngQ2yFFrnTuEao8w==
X-CSE-MsgGUID: JIoC5YkYT2qQpDZ/MVrVww==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74865680"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="74865680"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 11:47:30 -0700
X-CSE-ConnectionGUID: fm3urVJFRR6bg9l1h0o8nw==
X-CSE-MsgGUID: jGNNW5KORWG/Lbj7jTRoSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="189487241"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 11:47:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 11:47:29 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 11:47:29 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.2) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 11:47:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pBLXaXH9bDa+OeHP+UVDyC+Ngs9f73OQ/ZVsnuTzGuh38zFKy5K/yYouzQVTUj7cKRMRlCqI6E/pnL24hbiQg3BXzmIzdudeDpEVwbba94H5V9c8zb5fOLA+bnkilq35F/qxW1Ig+xSe0mp9RKI9bcSgoGTCu98FlNq6HLsfIBZV0JhPVLjrpcBTPrFkHBI3O2NbbjlEO7oU2b8TNnZRmgxVicIWXqVdg9nnfkZ/AwRrCDPdy3RzNi9FIp+XW/imyl975gDROTYeUARME3M4LdC+sowqMYKTOzmZ9XhlipCu79Ozz/s57xV5P510al8LSoBbAwe7zFgJz8CA2AKz4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ook3GKcyiafP3K9g3Qc06/FNKYJU5ubJiTbbqyOrZOs=;
 b=CzGdamp+K0ntGQ3U4MuOmyCj6PmBwkAGacpfgW7dipmB4me4dEUkKhCk4B5IA5VE1VrKAIOwtr2+fiqY3a+jfIHIfeUj1FcJfWCQweEuKKob+ESCjJw3TdbcglO6qAXzVgrYyOb7yDWT1a+qDCAiu4pc1mTGQCCdvTRSykftME+M7EVAuhQmnjM8rrj6QUuc34mxhfSIPun38ccszTiHq3/n9kOlfAd1ESXJWXFfCiEG4lbDLTr7jbGjwdMJNt5WsaxT9w+tPietTGJEr7oxOOITFRXO1G42e/FCU7TQr7K7a2tGvOP1pmuw8a1mCEuo6K4vexRLP8uwEnFAK0Pcxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by PH7PR11MB6881.namprd11.prod.outlook.com (2603:10b6:510:200::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Thu, 23 Oct
 2025 18:47:09 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 18:47:09 +0000
Message-ID: <057a1132-f011-421f-9561-1c2902a28002@intel.com>
Date: Thu, 23 Oct 2025 14:47:06 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/uc: Change assertion to error on huc
 authentication failure
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251023181332.2490921-1-zhanjun.dong@intel.com>
 <93041111-61b6-4442-a663-2d7c78a0a5e1@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <93041111-61b6-4442-a663-2d7c78a0a5e1@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0270.namprd04.prod.outlook.com
 (2603:10b6:303:88::35) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|PH7PR11MB6881:EE_
X-MS-Office365-Filtering-Correlation-Id: d83d122c-ae96-4ab1-85be-08de12649262
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVlnbVkvWjlqZXZtL2Z0WlFodW9URmkyY05TY1hXUVY1TFJ3d1hDOGpoUWdN?=
 =?utf-8?B?WTh3YXptYXpSNEI0VkRuSGF0ZDZXaTlsTWVZalZHOXhPWGpOdUNHaUdsMHpS?=
 =?utf-8?B?b05hVmcrYjhWU3BsVXNuZmtBT2xzSXVYK1V4VElYOVE3LzhqaXNNVm1XVFBy?=
 =?utf-8?B?NStCVUkwQ1hxVTJoT2VyOEZaVHRQY1ViYjhFNzRLUDJnVkI1Ujl3Mld1UmZO?=
 =?utf-8?B?bEloMlRuZU9kbXE3enljcGd0WjFaWGZjN0VCV2xaNy9mZS94ZkJrd00zU1Mx?=
 =?utf-8?B?TDlIa3BCQ1pHRFJVVHRkd0FKMHlQRExPL0JsQWRBSFVTNDFwdEZCMjllZUR2?=
 =?utf-8?B?L09iV2h2YnY0UUZ0VjBlSjVRZ3RheGpZQ1U5SEo4TzlxSWxTWk1yWW5Gd2Zy?=
 =?utf-8?B?NWJkbWxVdWJmWHcwOXF0cytyZ1VvYitDUU5nWWN2SmhrTFdOdEEvbFNpcnds?=
 =?utf-8?B?ODhoSW5qQ0IyY1JCMm0ycnJMTDY3dGlFZmdEMnEwMFlreGppSGxhSmd0aGph?=
 =?utf-8?B?SC9HRkE2OTJvQ01JWlpBTnR4TU42QWttSFBqRmE1WEZueFZXV2grUWEreXcy?=
 =?utf-8?B?R3I3N0NWNmNMNlpycXNLVHJoS1hqNENvUTVTN3ZxK0hMNkcyTGtBQTdzTVNy?=
 =?utf-8?B?dWVieVp4MG5XTTk0Y1dxbnlMRGx1WjhUUEcrSWFDbVQ1RS9PZDNrMWxaTzVC?=
 =?utf-8?B?ZWFHWEJNdVZNM0g2b1RCUDhubGw2Mk95YzhRL0hGZ0laNUZJa0hKRmpod0tp?=
 =?utf-8?B?OHFKcmxZTnFmWW9kOXdrWE1MSlJ0UUJaRHZmUlpLNUJtQjVGTVJmQk9WQnlv?=
 =?utf-8?B?NE1FUW92L0gwNVdaNE1nWDBtRHBteHAxdTQ4cmkyN0loRk9wUThiSEtKTEdB?=
 =?utf-8?B?b1JGMXdON29kVlZrZ1A0QzhFS2x3OVlzZmxVREt0VUFWVDJ2RkNtZkFHTGRt?=
 =?utf-8?B?OXg1VEhDeUdnUjRLYmEzNGJicW8rT3ZxZ1pzSnZFeGNnMG5iNWcyTzVrWXFv?=
 =?utf-8?B?bWUrelphQUZMU1hINFRJKzlManhNTjE0bkttSjRqSEtlVzUyaktpMURnVEVU?=
 =?utf-8?B?REJuMHlYT01OTjRNRmZkOU5HVnMwKzlNRWFrM2xseTZYcmpCc0hXaEhMUzlL?=
 =?utf-8?B?TWtPRjMrT0U2Uk5vK2dBREdzYk5udEVOSVk3Q3lYVmRzRFBXL0hNZHNQRk5P?=
 =?utf-8?B?WDZueFpqM1JiQTViNWVZRVcwUDl6YkM4WHE0dVNMdUZRS21kUjYzeUUxR0Mz?=
 =?utf-8?B?SUQ0K29tcG96ZFJ5UC9xdVRib3lkMk9sQm9aayt3RUc5TEQ2MVNPNTVBb1FE?=
 =?utf-8?B?S3JBOHh5blJtd0dzeC8zOThxSkE2UGpKM0ZGWkhQVlNhTXFtN0xkMytBRlM0?=
 =?utf-8?B?Q2swUVdraDYzQ3NwZFczeWVTOEhzdklVN0N1b2tmNDBJQnE3UHYybFU4V0RR?=
 =?utf-8?B?K0c4bWpFa0Y5bTJoVXNBcGRlZ1FmSFNKYXNJd1RLS0R1TEZpcWF6NGV0alRY?=
 =?utf-8?B?SVN6UDZFQW9rV2Jwa21jSFl4NlQ1cnpvd0oyZEVRWE12bW1nRVVIODVDaTRu?=
 =?utf-8?B?ZCtvR3Q3cnRQWlBtSVpwajdTekUrUWxjY2pPbkNZYlUyQTZrSjAxUzlYa2NL?=
 =?utf-8?B?SlJnOGhOVU1JRHlVSzhweGJFQ28vT2VvcEdOWkIvV1lmeUUvRmhtR1Nvai9i?=
 =?utf-8?B?eHZnaGF6NHZiSDJHU1VlUGJPYVpFYllZazd2eUVwU1N4eU1EWVM2RUNYUmdq?=
 =?utf-8?B?aXlnd0Nzd3lKNS9TRWU3WWhYc0V6YnFia05NM1BycXFidFBLRHF0b3BRc1dK?=
 =?utf-8?B?YWE2cy80SEx3em5RUUIzbkU2Njg1RHl1R3ZWVmVXV3h4Wlo1R0pyZHkyQTFr?=
 =?utf-8?B?Vml1VXZNT3dMd2hBOFF3T0Vzc0tDa3EyaEs0RkxFQy83MnlML1ZSVFFPYnR5?=
 =?utf-8?Q?2vSf4kD4XHbxVb53GDhnYjUGnoi1hzwj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STF5TE1yNytZR2pmeG1FazE0QXpzRlhQRGttTEJSWGFHbERRWUlya08yTkFT?=
 =?utf-8?B?SUNtSmI4YWNqV2piVUNOczFLU012cjk2Yy93T0xxQi9tTDA5TENZQlJHQzNa?=
 =?utf-8?B?RVJiU1hDN3NEUnpZc0dMNXp5N2JraXRWMTBRWVpJT1M2M3RyclphaHdoU3Zs?=
 =?utf-8?B?eXB4bUN5LzZWZUdXbjZySVl0bmRYNkFNNE5lU2sxZWI2NitlOVlKQ0EzbWs0?=
 =?utf-8?B?YzN6M2lOcHNDcENacnBZbWJ1d1lWU01JUnR1bjU5Z3AranlDUDFtTVc0eVVM?=
 =?utf-8?B?eXA2eEtUbnFLUGxsRVJoelhMZ1loK3NqMFpIV0xHUlBlQ0NRUVZRQVJrZUNl?=
 =?utf-8?B?OEhEZEtDd1pZSSt3NXNoZExrSjhCQjM0SFBtWW53ZEZmbzRYcFhYS2tONUU5?=
 =?utf-8?B?ZlFuR25yNGM4YTRTUldjWVJJdHNrdXFtblBsNmk1SE9xenFGTWZmN0w2SndM?=
 =?utf-8?B?R3BCVVlUdm55TW1SQzBZNE1QTm4ralZvV2lUd1g2SXJaVEI0dkpMQkRHV0V6?=
 =?utf-8?B?K2tITTczU2R2cmNaMThHQUR1YnhKamEzZDVFTWdtY0JiSHJQcTNyUjVXZ1Bw?=
 =?utf-8?B?Z2VxdkZTcUwrd2FxNFFpNWkycDU0eGZjVzNiK2tuc3ViNG1hS01IRkZtbG1Y?=
 =?utf-8?B?Qjh2bUtSVmtPVlJPUHJHVDVHNjVYRkpSWnhibnltYnNMRFNTQ3JnUXJ2WFhQ?=
 =?utf-8?B?azVQdk55MFJVa0FIejRIdlZIUjVkYXRmR1g1ZGtoM2FCdy9LOUh2MnVzRFdK?=
 =?utf-8?B?cS9jM3JxN0wwQnk3Qy9iNjkya3JEVktkSmllM0pYUHoxRHFSaElhTGJUR0RJ?=
 =?utf-8?B?ZzNRK1Z5dkVpMUNydExTdTBuUm9zT1I4UkZ6a2V3TklYVzlqb3I3aEpCRzhu?=
 =?utf-8?B?R1lpQnlYbStxN21RTE1ZS3lXTFl3cFhQVXVvNEVWK3Q5Nm52WCtDQTd4STZP?=
 =?utf-8?B?U1NGUWZock9CazJrK05uZXZnc1FRT0hpdzhxYXRtSS9qTDJDT0ZRaG04elVJ?=
 =?utf-8?B?S3FoNk50RWdKQ3MzeXN2UWRmN3ZBejhCN2dyK3lyQTNxZFhFL2JUMjE5aEhE?=
 =?utf-8?B?MjBXTG9MVTdtS2hzdVhQOHJLdWVLY2xIU2xVNkFKa2ZHTE1JUnZyZWV2cVlP?=
 =?utf-8?B?bWwwSnJ5cmZzOWpDaVNyQlI1RDZzUmtuT1hST2VBS0k0OVN6RTVuOTd4S3BB?=
 =?utf-8?B?eVJnK0ZhTHVIVmIvTi90T1h6OE9pdmd6blp3QVg4c210eVN6YUkzTE5wdGtw?=
 =?utf-8?B?TXFvdGgvRGRzdHVzVXcvTGx3SVpSS0FXY29kOTd0ZWh4bmJrSzV2RGtCbUJF?=
 =?utf-8?B?NFpjUTloZ1RLWm91UVZZOCtCb3lpRjRJMHFTSEVnWjhiT3kzYkR5azZpK21M?=
 =?utf-8?B?VjJyS0xuc05pdEhEcGwxZUFRbi9vTzJRR0R1ays1MmtnSWpyRFJKTm9OV2hs?=
 =?utf-8?B?NjVFNEdKZWdSV3oySitEbVpDSzNDREkxNGYxcjNJU084Qm5tblR1djhRSklh?=
 =?utf-8?B?MllFUTQwZ0J3Z3NjK205c2ZRRWdrNTJ4VEhuNkQxZHpHdURrNzR3SnVaNUJq?=
 =?utf-8?B?Wis4eVRsQnhUQ0dRSnd5WnRZVEVFWGQ4MUJTYzlHaDZtcVlXbHF2dmNla0ZG?=
 =?utf-8?B?amZGQjZDOEMzRUVHV3hhSWZCb2M2cm0vZ0tGbk1qM0kvOVl2TVVNZnYweFJh?=
 =?utf-8?B?Wks0VEc5WXVrOENycEgxelhYeU1vMUR4aEh5MG5OTDNodXhkaSt4a2NiK1Zl?=
 =?utf-8?B?d09WOWxOaktCcnpRbDMzSVhlSzQ4QVgySFFERzFENEs0amM5aHJNZ3pHN0JL?=
 =?utf-8?B?UlVZamZQUG5HelFOaVdqcHFBRDRONC93bGkxRUxzcmRucEFzbTRvL3NFbnJ0?=
 =?utf-8?B?d3ArZVkwdldHNE9yWUZUOC9acWtQNjVXZzlXbWxENGVqV2hHZWtUekdXaDB4?=
 =?utf-8?B?amNWdjIzS3o3dFE5UVRDZkk3M0YxTVAvU0ZmMGFNR3BBcVNIQ25sZGljOEI0?=
 =?utf-8?B?eGtCV1ZIOUFIaUxHSW5BOEtUOXVBMUtrT29QRWwwUlltUUlpUit1Z1UydUdm?=
 =?utf-8?B?VjdRK1M5Q1VtaGtHenkxUHpxcW5DNURRVExOcE5GbHdZOG1UZ2NQSExhV3Vx?=
 =?utf-8?B?SUFubWk5dXJqWDFvNkM0UmlTQUJVY1psL21qS056WFJISGgwTDhsWWpSR0hN?=
 =?utf-8?B?MFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d83d122c-ae96-4ab1-85be-08de12649262
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 18:47:09.7894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yhCSy8l9shzowcMnhlCDnfdiY8nfez7FmDStd6XfMa+O9q1WhBRlvddtoEg6giUCZCCJtjcJ5Oa/M6E9BiypJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6881
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

Please see my comments inline below.

Regards,
Zhanjun Dong


On 2025-10-23 2:27 p.m., Daniele Ceraolo Spurio wrote:
> 
> 
> On 10/23/2025 11:13 AM, Zhanjun Dong wrote:
>> There is only 1 place that HuC authentication is critical, changed it to
>> error to avoid tanited kernel on assertion failed.
> 
> This doesn't explain why we need to avoid the tainting. I would preface 
> it with something like:
> 
> "The fault injection test can cause the xe_huc_auth function to fail. 
> This is an intentional failure, so in this scenario we don't want to 
> throw an assert and taint the kernel, because that will impact CI 
> execution."
Will follow this.

> 
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_uc.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index 465bda355443..2ae48dd234ee 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -220,7 +220,7 @@ int xe_uc_load_hw(struct xe_uc *uc)
>>       /* We don't fail the driver load if HuC fails to auth, but let's 
>> warn */
> 
> As Ashutosh already mentioned, this comment needs to be reworked as well.
Yes, will update the comment.

> 
> Daniele
> 
>>       ret = xe_huc_auth(&uc->huc, XE_HUC_AUTH_VIA_GUC);
>> -    xe_gt_assert(uc_to_gt(uc), !ret);
>> +    xe_gt_err(uc_to_gt(uc), "Huc authentication failed:%d\n", ret);
>>       /* GSC load is async */
>>       xe_gsc_load_start(&uc->gsc);
> 

