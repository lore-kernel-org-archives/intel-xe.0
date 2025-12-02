Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61CEFD116F1
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 02:55:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B1610E513;
	Tue,  2 Dec 2025 02:55:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WUUQQIpg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807DE10E513
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 02:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764644136; x=1796180136;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=X2XOb5+EqoVmNHSsvV8Zgh8TqzL2AUsr3dv9C+lo6qs=;
 b=WUUQQIpg7QjEzPUp03JugPCOT3/JSCcmFkTg4DIDYHtj0tU0oTAdFgKl
 Ck6417qdBJffCYUUAktiQys4zbwrREq4Dg+XyfMXByo0+CiGrE+FTNwmD
 Ubt9mkWCr2yE8mOJbhjp6NqE6xnL5UFR/oB9MTnsFEji5XI7LkW2+ufMs
 Fzn6cmJJ0Ak1NtIohbL1fF1oOIj4S8p2ScalUIs5jBzWCzlIxt/ms46Mj
 g1d50z5ZxA/1h83+XLruXxL0ZZQeaFnsGWCuXPOJEDZ1pXwvQlqgfxGuk
 qYkfNryOJRoxb9MoJBA5ygugtP3lwZCxArEzUK+OnxeYn8bwrMmdcoD8c Q==;
X-CSE-ConnectionGUID: ArHxtD/GQ6i0eyx/HBaBMQ==
X-CSE-MsgGUID: N/MxKCvFS06507I6LN+G8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="76921394"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="76921394"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 18:55:36 -0800
X-CSE-ConnectionGUID: 3wOSqLDWSqegnQ2N6Oj6Bg==
X-CSE-MsgGUID: ChfUSsHKToq2MIFJIOHvWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="198619294"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 18:55:35 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 18:55:34 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 18:55:34 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.29) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 18:55:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BC2BC2Q8/Q4VHk5vfBSpCwD+PNgB0l8fVDvSg4mjEmDa02ivOGQ3cXDmNXaTOVdOFAz8Bm8a+cONNfUTLzXhMFk5XE9fLTTfgfZHnOY3DYtDdqKTkcWv2DOZaZKX8Tftdvq3UwOVG2zUpN13aQY/l2uq20812CyAH9LcOFjgFgmwFUZnM9BEtzpGCFK2vTp2QSrY7FgQsEUFjRveEpNCkvS7gRJH5X35gWAmvUMUV51CZf3UPQtbrGyzijCVePwyylihwPKcSiUNxqpxV9pHbvOg/aCH9WEnhWKVy3CG5tdNvd2dvTc0mcLV7DbEJvGJquy4u4F0iBzf7NMTFqlo+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Vk/uUDH+2fdRZq3ch6KVJ+93qnLCVD/qAJ+9q3Xm7c=;
 b=K9SQhovwlWqysCz7jG4iQH9dL1NRvdljHUxQTNivEx/CCE5FTVNYQjZwck84pvUr8Sm22Hh2J03IvRpSe0BDLN8LTv3vzydbfIYm2s22t7crB0miIKWrD/Id3zrCq/9xDFOV89WrAXGdF8VP/03o+MSv5TQkyhdJ/zKdczqiXOuXc+P/ki2ScS5c+FpA4s+l9P1fmEVLa8CFRgrHip+BfwoyjcoVr9AOCcq2rFODH12GBH2NWCsVBeoWElCtByUiy4qpmbnuQzJeB5QAXTIeM+E10jLuwoR3xtdoTgqlrh/D0LCnxNVV2AAkb65lRNuw7+G82TyELu8CF3Ps1Wb9aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3041.namprd11.prod.outlook.com (2603:10b6:208:32::17)
 by DM4PR11MB6477.namprd11.prod.outlook.com (2603:10b6:8:88::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 02:55:32 +0000
Received: from BL0PR11MB3041.namprd11.prod.outlook.com
 ([fe80::8f61:c439:8828:cbb3]) by BL0PR11MB3041.namprd11.prod.outlook.com
 ([fe80::8f61:c439:8828:cbb3%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 02:55:31 +0000
Message-ID: <85e87162-38b9-47f3-a883-969fd8685d5d@intel.com>
Date: Tue, 2 Dec 2025 08:25:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 1/9] drm/xe/uapi: Add UAPI support for purgeable buffer
 objects
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
References: <20251201055309.854074-1-arvind.yadav@intel.com>
 <20251201055309.854074-2-arvind.yadav@intel.com>
 <aS4eHV3H/qcb3uOz@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <aS4eHV3H/qcb3uOz@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0079.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::7) To BL0PR11MB3041.namprd11.prod.outlook.com
 (2603:10b6:208:32::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3041:EE_|DM4PR11MB6477:EE_
X-MS-Office365-Filtering-Correlation-Id: bab932cb-cada-41cd-138f-08de314e41c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjVZNzArOUFHRnBzMTkvSVdROXJFazRMMmhsM3daNXRRREZMaVdHV0Q5L2RX?=
 =?utf-8?B?K1Z3d0ZjZHIvN1gvcVVRWTBaNDhWcUx0OGZWS3BhY0hmODdUQ2VDcjRObGVW?=
 =?utf-8?B?Mlc0cHltRzNMV2x1LzZmejJ6ekFRTVNkbFhEVWoxbEtDM1dVN1ViRnVoUEll?=
 =?utf-8?B?TExMaExET3VGU0pSbzVudk1Yc0NtQTdwUk9BaEV0RVFFSSthQ2VsTFZQbnp6?=
 =?utf-8?B?c0hCN3hkcERoOE01UC84OEx3V0MybFBrMkxNOUc0QmRkMy9tbmtlN3B1NUdB?=
 =?utf-8?B?bVJ2ZENBVVlMTEtVV0ZKT1dxcGxyNzI1NGxyVFlIVlVWbFo0MG1aTXRGbzV1?=
 =?utf-8?B?Z2tYTm55a01wYlZNK1cybmZVNkFjVmIwcFdBaUpIdmFvYWk4YzFDcm9aYVZB?=
 =?utf-8?B?ZVptdlI5bzl3U3BqdDQwWDEvWVYxQ083czJXRGFBVW5UajFpekVib3lQMm0y?=
 =?utf-8?B?R1VOM3VFeERuenkwZGcwanFhVnZ5WlFURitCK1pjTDVIWjU2d1ZpZysreGti?=
 =?utf-8?B?VERUbm5Hcmt2S1RFYUlpemNBRVBIVDJjTVJSNlVJVW9qdFF2R3hlUVM0SG1T?=
 =?utf-8?B?Umk0RVRRaXJ6djV0TDhJVU1zN2JjOHRTQVNFWTlRb09VWEppd0pZTDlYSHVt?=
 =?utf-8?B?dWg3NFNlUGhFaXRDaWJVdXF0ZmE1ck1DOEE5ZG1zT2NtY052dEtYMXlEdjlZ?=
 =?utf-8?B?eGhUTFRwclI3aWJtMkNpaWE2dnIzQXR4bWNyM2NIUm82d1Rxb2hmTVUrUmlx?=
 =?utf-8?B?eFNMSmp3ZjhvRWlSUkRGZHNqQ29BTGlDSlFRVEZiTHNOZ0E2M05nc3B2R0tU?=
 =?utf-8?B?b2UvQUl1ci9xb2tsTm5vSlFuUkg1M3VPTm92NmQvSzdFeGZnQXpUaXdObnRi?=
 =?utf-8?B?Z0JqSDErdUhEUWxMN1NuNytsdllnYVRMaXUzejNqY2VqYmYvZ0tJaTZDT0hM?=
 =?utf-8?B?S0w0VGVKdnoyUTQvT1pQdVlRczYzcDk4YXJsOVBwM0pjS0Zka2c3RC9qNGZM?=
 =?utf-8?B?UG43eGtKY2IxdW12OHJ1djJhYXFmWGVMbStQOGZLTGQ0azZiWGFHQU15S3dk?=
 =?utf-8?B?ZWR6SnljUngwUmVHcmJqSldlRCt1NUNlN3cxQlJVRys0VUxyVnR6KzFQcmZL?=
 =?utf-8?B?UGpkMTNHaHpwY2tmMTh2ZXBxTlpPSDRIc1pWZ05KRVlGYURQN2Y0RHhOUWhi?=
 =?utf-8?B?VXd3S092bUlMZGFFNjJyWmNtUWVBbm1uOEhqeXhOdUFEZFcvbnhmTHNLZEJK?=
 =?utf-8?B?REVSYkxEaWl3Q0lRRjA1VmIvdkZycURhZGZ3VTFkeElnU0tDY292UFlzZGxO?=
 =?utf-8?B?Mk9TZmNDUHpEbkdMRXc3UFVEQ0FubXBCRDNvTnovb3YxQU5rTnd3N0NNdWtZ?=
 =?utf-8?B?c05XNnc5OFllYU95OUxZSGEzczNtcjZkMlozUStEYzdyRS9sZG1DeXg4SXpx?=
 =?utf-8?B?ZXZxYlJRUU84cDBDaTRxTythVFNuL0hYSG9IQURYSVo1WEdRb1NLdDlLRFVa?=
 =?utf-8?B?VXk5UjMyTk9IRFRrOWtJMUxVdWp1RzFIMzViNVlKNlpuRERCc2xzK1NEbGox?=
 =?utf-8?B?MU5DZ2pScUduQVg1T0RFNmQrZjJPL0xTbnJuNUZSSVhIdlhzS3hGaHozRGo0?=
 =?utf-8?B?bUJsYm1JRklrQzdYemViTjJIb2J2SnJlOFVWRzFKOXN2NzZmOTBtZWpSRVEz?=
 =?utf-8?B?bzVMMmNGMTh5bFNmQW1ZSGlCNkxpQy9pcjN3WHpDU1FFK0NIem5nNW1vSmww?=
 =?utf-8?B?MzVXek4zUzkwSjF3ajNwSW5tRnNxZlQzQ01HblZQbDJtR01rQ0lIRDZLN1VH?=
 =?utf-8?B?Z1lvbEFYSWpnVU40V1RuYm8yYVhTNDI2VFdyM1V0aE9OdG9RekNJbVlOUEFG?=
 =?utf-8?B?VEY2MnV2ZjQ3b2RkdUk4TjhWdUZnc0JLSk9MRWl2UVU1MU9SS0RLRzI3OHc4?=
 =?utf-8?Q?Q9cUFMaHPhUH6RwBy4+8sj+rsuO1adKz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB3041.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHZUSTExeGoybHUxdFVaNHhReWM5UC8zSFJMQVk0Ym1PMEhnWTN3WHdWQWFo?=
 =?utf-8?B?dUxPVFl6Y3orYTNVRDRvZkRnT3lqNy9jYnM5YVVac0FCUC9VWXFVbTFUaldp?=
 =?utf-8?B?cXpyZ05SSklzaElnUG8wOEQwalczMmtDaG83NGw1QW5tY1IvWTliRER3a1px?=
 =?utf-8?B?MkVkdWZmWUJEdnZ1WE5nVU9wQzk3YTdOcFY0aUdreUlPY0RET1VudDJqdDZM?=
 =?utf-8?B?VVcvWkI5RWlOUTRvQURzY00yZjM0WkNEZ1V1cCtTN1RFWnJ5VytWeExSVDRs?=
 =?utf-8?B?MnQwaXFRY1cyazMzYlErZmV3M0FsWldQT2VFZzEzNjJhOVBsdlBEU0l0N2hB?=
 =?utf-8?B?TGI2RFNjak15RXpYL2RtbE9YTWcyYXZEV2pxSGpMOW1UajZUQWlWeTFaYmFZ?=
 =?utf-8?B?cXBJZ1N1UXFsZDVudEdQZ1dNWXdHR3ZpT0t2VjNLWXh5YnRrL3BKVml5R21z?=
 =?utf-8?B?Z2xhQmVPK3cyTEVyczVRNDB6OTRSa1Y4WEpDalRudmtSakZxdXAxQW9ZbHVw?=
 =?utf-8?B?a2kzU1dsZzZpR3dLNksyQTRYbEE2SFdVNUdGL1I5Rjh1MW1tQmFUSUpkWERK?=
 =?utf-8?B?RmFQN3dnZUs1RldTUmhBOHkvSWNUNi9JdXp1Nkhhc1h6d1gyZVg3OXVkd0J2?=
 =?utf-8?B?UzZJa2ZldTB2cG9sTHhOc1NYWDNJaDF1VjhCeDZDL2FMR1lrT0dEbjVQV1Bn?=
 =?utf-8?B?RDBzamh5SUMwcUh4NmppbFV6LzJQeXZjY05Ob2pvdU5CM0l3dlp3NXhQMVg5?=
 =?utf-8?B?MXhpN2ZTSlJ0NkNhb1gySVZzZnpWNENaaCt4ME9iRVU2T2RLbDRUckdmM2tV?=
 =?utf-8?B?K1hDUE5zNXh3dFVXb3JBNTRiMStCRWhHU0xoaGRxbjlySU50TXN3Y3hMNFZ1?=
 =?utf-8?B?NTJWeno2QWpiYm1FWVR5MXlQN1cvNXpJbXBDOTZ1VFQxZ1pQNjNINTVXV1gx?=
 =?utf-8?B?QUhxaUp1VndvbGpPb1oyNnFUUGNSMmhtTC9ob1c2S3RNZ0doa1JUZnpsa05C?=
 =?utf-8?B?TDlyU25naVpVRDFXSitPSC81WG9RSlRZTWZhWWdta3pjeFJzQVRPM3cvcnNZ?=
 =?utf-8?B?bE1uNG5RM3lxeDB6aERZV01ONWFKdWVaT1B0OElpN3RIWXpWZUVnaXl1QVV6?=
 =?utf-8?B?Rkl5c3RyOFFTTit2ZTFLbGI1SnhDSzFEN2MycmsxbC80ZTVINGVpYkltRmcr?=
 =?utf-8?B?cUsxNFdGL1oyejBrNmdEbEROWmdKTDBIZkpJdy9PYlllVmdjWGd5SXVCdzRw?=
 =?utf-8?B?WE9NUFNYU2FxWTBtUXlocWFGU2hxNXp6WUVvN2J0VHBqcnlyR1h1OHR5dkNO?=
 =?utf-8?B?YjI5VFlURk1NblRXWDZ3S3NKdTQ4NmZmOEFuWFVtbSt1M3c3ZU9jQmF2RnZ4?=
 =?utf-8?B?OHRTL0J2andPV1lzZCtGNy91MTJZcnE1UXBUNlZtRm44eVdON0pHdzZodUZl?=
 =?utf-8?B?dzRFK0tqbzcvTGJzdktkeEU5TmZJZzZhSzdPYUgwb0ZwNExVQTFaMHRVZEtZ?=
 =?utf-8?B?anZsb0pWZlVKQUV1YjlBM3hoNk9QVTNkMGRGZlVvNzZyK1ozUXFaTHhIK1lE?=
 =?utf-8?B?RGd0TUk2MHdQTGtnNjFWREhrSWthNnM2VkdCMEZ0UjZkUG9CTmFQUFJNRmMw?=
 =?utf-8?B?M08rSXpEMEhpaU44MmxFeGRBVnZyUWdScW1WQ21MTEZZdTVvb1JXOGpGazh4?=
 =?utf-8?B?QjBnYTBOaEE0eno1M1k0Vkxjb2pHUEpwUWs0Mmo5UExMTWQzVDZ4VFN6VE1S?=
 =?utf-8?B?S2lKbVlQeS94aE9UNHA4U2lFR3prQ2lxUVU3dXJZb2dBdXRHbWJrVXdXZi9q?=
 =?utf-8?B?V24zUHNZMGU1Zlg2ZDFudzZxaTBoNWlJTDFPNEZVK3M1bGg3NmFsQmxKTC9M?=
 =?utf-8?B?a01WTHlwSlFHSkIvVjFTRHVXR3RnZm4zQUVtSE1OMkgyOFc2ZVEvYkNHVnhV?=
 =?utf-8?B?Ykw2WEpQVE1WSTRiOVNmNzVtNW5PSXViSUdqS3phQnU0elNrcmFTWTZYT3E0?=
 =?utf-8?B?bGRnejBVNzk5OGFHbnYxM1pGellIMysyTGJTNWNERWJ3V3pjM3VhWktvd1I4?=
 =?utf-8?B?ZGJnU2UxQlpqVXFTcURvV1Y0bFV2M09neTV4SWIzMm1JUEgxaW1ReHpqbEti?=
 =?utf-8?Q?bGtjLm9qO6KHjaLcZ4cfKde2B?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bab932cb-cada-41cd-138f-08de314e41c9
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3041.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 02:55:31.7387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4sCxOC7OU8ns2sE4Cwq5N455yO0AESrS61nvRSv+lXHgFahDUD5lcAdGj00CAJdkvI6ijFi89drMu67pAdcOlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6477
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


On 02-12-2025 04:30, Matthew Brost wrote:
> On Mon, Dec 01, 2025 at 11:20:11AM +0530, Arvind Yadav wrote:
>> From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>
>> Extend the DRM_XE_MADVISE ioctl to support purgeable buffer object
>> management by adding DRM_XE_VMA_ATTR_PURGEABLE_STATE attribute type.
>>
>> This allows userspace applications to provide memory usage hints to
>> the kernel for better memory management under pressure:
>>
>> This allows userspace applications to provide memory usage hints to
>> the kernel for better memory management under pressure:
>>
>> - WILLNEED: Buffer is needed and should not be purged. If the BO was
>>    previously purged, retained field returns 0 indicating backing store
>>    was lost (once purged, always purged semantics matching i915).
>>
>> - DONTNEED: Buffer is not currently needed and may be purged by the
>>    kernel under memory pressure to free resources. Only applies to
>>    non-shared BOs.
>>
>> The implementation includes a 'retained' output field (matching i915's
>> drm_i915_gem_madvise.retained) that indicates whether the BO's backing
>> store still exists (1) or has been purged (0).
>>
>> v2: Add PURGED state for read-only status, change ioctl to DRM_IOWR,
>>      add retained field for i915 compatibility
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   include/uapi/drm/xe_drm.h | 37 ++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 36 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 47853659a705..02d63938d16f 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -121,7 +121,7 @@ extern "C" {
>>   #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
>>   #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>>   #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
>> -#define DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
>> +#define DRM_IOCTL_XE_MADVISE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
> I'm not sure if this is something we are allowed to change per Linux
> uAPI rules. I'd check with our maintainers (Thomas, Rodrigo) on this
> one.
>
>>   #define DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_MEM_RANGE_ATTRS, struct drm_xe_vm_query_mem_range_attr)
>>   
>>   /**
>> @@ -2051,6 +2051,7 @@ struct drm_xe_madvise {
>>   #define DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC	0
>>   #define DRM_XE_MEM_RANGE_ATTR_ATOMIC		1
>>   #define DRM_XE_MEM_RANGE_ATTR_PAT		2
>> +#define DRM_XE_VMA_ATTR_PURGEABLE_STATE		3
>>   	/** @type: type of attribute */
>>   	__u32 type;
>>   
>> @@ -2129,6 +2130,40 @@ struct drm_xe_madvise {
>>   			/** @pat_index.reserved: Reserved */
>>   			__u64 reserved;
>>   		} pat_index;
>> +
>> +		/**
>> +		 * @purge_state_val: Purgeable state configuration
>> +		 *
>> +		 * Used when @type == DRM_XE_VMA_ATTR_PURGEABLE_STATE.
>> +		 *
>> +		 * Configures the purgeable state of buffer objects in the specified
>> +		 * virtual address range. This allows applications to hint to the kernel
>> +		 * about bo's usage patterns for better memory management.
>> +		 *
>> +		 * Supported values for @purge_state_val.val:
>> +		 *  - DRM_XE_VMA_PURGEABLE_STATE_WILLNEED (0): Marks BO as needed.
>> +		 *    If BO was purged, returns retained=0 (backing store lost).
>> +		 *
>> +		 *  - DRM_XE_VMA_PURGEABLE_STATE_DONTNEED (1): Hints that BO is not
>> +		 *    currently needed. Kernel may purge it under memory pressure.
>> +		 *    Only applies to non-shared BOs. Returns retained=1 if not purged.
>> +		 */
>> +		struct {
>> +#define DRM_XE_VMA_PURGEABLE_STATE_WILLNEED	0
>> +#define DRM_XE_VMA_PURGEABLE_STATE_DONTNEED	1
>> +			/** @purge_state_val.val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE */
>> +			__u32 val;
>> +			/**
>> +			 * @purge_state_val.retained: Whether the backing store still exists.
>> +			 *
>> +			 * Output field indicating if the BO's backing store is retained.
>> +			 * Set to 1 if backing store exists, 0 if it has been purged.
>> +			 * Similar to i915's drm_i915_gem_madvise.retained field.
>> +			 */
>> +			__u32 retained;
> If we can't change the IOCTL to DRM_IOWR, then we could hack around this
> restriction with making 'retained' a userptr which the madvise IOCTL
> explictly copies back into rather than relying DRM IOCTL core to
> implement the copy_to_user.

Noted. I will do the changes as per your suggestion.


~Arvind
>
> Matt
>
>> +			/** @purge_state_val.reserved: Reserved */
>> +			__u64 reserved;
>> +		} purge_state_val;
>>   	};
>>   
>>   	/** @reserved: Reserved */
>> -- 
>> 2.43.0
>>
