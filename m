Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E522D216BA
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 14:41:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39C7E10E595;
	Tue, 15 Oct 2024 14:41:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HZ/rsF0K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C5210E595
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Oct 2024 14:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729003288; x=1760539288;
 h=message-id:date:from:subject:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4VEngRCnaclnDC8iQLq3EDf/doNxyRViliPge0i9cLY=;
 b=HZ/rsF0KFUlDbmk12b0Q/du98jAsvKpueoDGJX0dKrqVAtTZjzhpPV8H
 uZsHguXN9hqNc9PSMgK2pSQOGGtaM5diGwmnrKTHiLPI0zAIZC4BXvmVi
 LrXYgrTTxp/MlzBYXlAmJfwUB/tVEezvlLzhlSgoBwMsnRShijgavb399
 h4qx7nRvDy0kSrfz/Lwbe7TVG7WOAH/pW8abFjSX3+UXieYkmWVvmH/Qq
 d4oPPsak55lvOcTTN2xydwpoSsp09RNtvoaHEt3SlFlsD3Bp3pz2voBZZ
 cPwJSXyKG95fo99S88KWVuEDDS4sneXAcny+CZxFgJVGBv4505/7NyZIu Q==;
X-CSE-ConnectionGUID: 3kEDuLpvSuicrZSgUK4YXA==
X-CSE-MsgGUID: mflr0Mx0SXym7WCxlmi6XA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="32202301"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="32202301"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 07:41:27 -0700
X-CSE-ConnectionGUID: LsUgdxl9Td6wJ+cJjwr11g==
X-CSE-MsgGUID: B33kXg8uT/WabPqspaY/0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="78376210"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Oct 2024 07:41:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 07:41:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 07:41:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 15 Oct 2024 07:41:26 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 07:41:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SdT8xCjNhlk7v3FEjMm551hueVa4rHyUYzxZhblcZfkoDSd8Ca1w0krPb8M6Wj4F50zxwG1YQ65V7pvYUeaxCBMXQ/uUh4QFK6fEllI6swGlXSWpBSs4DSohKO90s7zw8n2T6EvnBzlSTCf4GcgLRRdrk2u9Q4sJ1qlSITk0/HygyrgWNCuuFFeyFeqAhzf9WXq2qJ5IL1JZslBlC7O8XqJ1gRwWCHws6BgsgaaWPgsM9bl080UbOuCGUvFWajih97Fhf+LuguwFbCsQMUYz1RCCmoMtzS+TX+HERrQ+wHfoNDQfjkCRihGvbhYNnpxFenLnrFCj4zRd7IRXGdjHKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwCvtYEwQC5KzlEM6WyTV6avQGpvW4b1KW8XpKFO+eE=;
 b=D0n9hBicjjr4aCYJ5TBnEYzupnQG3PfnPYAmkFrPqHvZhzcVuMIDOpTm57oGhpXtYP6RdFH6G7XrymKorTKOyFzMpF0Xa93Md19uTPnM09g8VflKeRGnugbgQ8eyUKyU9Xmsv7iZ0olhoBUkURQt3IagQVOEdOcYKcpBjdA3l3nhFA6X54d4lPAro3W5a4ZfpMccG0n51Nq8DnfBnPMitSvzPh1nR0isXwvnkbFGYuFA1jKFinY+MFqBhcbOIwiPELcf7IyxCMNIF/enJ5HCd9PY5jjmEcMFFCsU9LKsN2Rw96u/q2prU/aYXcUL0RXq0Ap4Z7RTP9Ww88CXSK2+gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by IA1PR11MB8222.namprd11.prod.outlook.com (2603:10b6:208:44e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Tue, 15 Oct
 2024 14:41:22 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 14:41:22 +0000
Message-ID: <debca75c-93af-4010-88e9-34981e72b3f4@intel.com>
Date: Tue, 15 Oct 2024 10:41:19 -0400
User-Agent: Mozilla Thunderbird
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
Subject: Re: [PATCH V3] drm/xe/guc: Fix dereference before NULL check
To: <intel-xe@lists.freedesktop.org>
References: <20241010064636.3970-1-everestkc@everestkc.com.np>
 <1a5407c4-3b0f-48a1-940a-cc6b3ff3fb12@stanley.mountain>
 <6f64b79b-391e-4c78-98ac-8741b82201b4@intel.com>
Content-Language: en-US
In-Reply-To: <6f64b79b-391e-4c78-98ac-8741b82201b4@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0197.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::22) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|IA1PR11MB8222:EE_
X-MS-Office365-Filtering-Correlation-Id: 0316d701-0001-4bc5-ee9a-08dced276ffc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFBIYXlHb3Y4dzNqWEhsb3RJQjN4UVoxWC9CYUtndEp3NjkrVG5ZdTdiaUp3?=
 =?utf-8?B?MUswSGZ4UGFqOGlNZUpaTGthQTdxYWJ2UE81QkhiMSt5bFBmS0FGSkFBNUw1?=
 =?utf-8?B?eTVqWlE1bWJIYmI5VDNkZTdQVFZyMGtPQnZmVGtPT0dyYTU2K3c0TVJTcStD?=
 =?utf-8?B?S2oreGdwOEx0U1FDVjVIdXQxS3VqRW9LajdqdXNwbjNWZGlmSUxVendZU2tU?=
 =?utf-8?B?VFpnRlFBeVRtZVhnS0VCWjZLSzYvbmJDeDE5NTNOUWNzTTAzVFQwSGtwNWdq?=
 =?utf-8?B?TUlXTFlzQVE1Q1ROc2JpTmFoV3I0aWRZUUZzcFdCM0QxSTEyV3Z6eThZbFha?=
 =?utf-8?B?WDFLOEJ3a1FKOTVsOHFtUUFkOWY4bmx1aUhVRDBJNFRGSFIySktmckd1Y3B1?=
 =?utf-8?B?dDdNMFJCbS8zSTNnYnR6eFpXMGYyUU0vblIvMXo0bUZqUjNjYUtpVVhKVmtV?=
 =?utf-8?B?dEczMWxsT1pkcXdTZnc2bFNFNHh2Z3kwWVVKK0NOcVZydVpETm9yOUREaWlz?=
 =?utf-8?B?b0xnRVo3bzc1WkVuRjNhMXVERGExS0J4d2hVN1VJMEhYajN4TFdkbUQ0UkJY?=
 =?utf-8?B?WjVyaGhkb1JZVHJVRFRQSUtrajh4RWtmRWNMTjh2L3B0RE5rVm03UEFyZGE4?=
 =?utf-8?B?aGlzclM4bnNvMmZKL0hPZFlWRWVqUGZydG1XSzl4QWMzN3ZlekNjazBkazdC?=
 =?utf-8?B?eU11SUQ2Z2dxaTk1QkxPY3kyM3lVc0hTc1ZhdGh2V2wyN0NhWVIvaVlUZktG?=
 =?utf-8?B?cFJZTGRBMmtOaEF5TFF6ZVlCaTI0QlZxOWl0NzlqNENUV1VKMzJUdit5Kzcz?=
 =?utf-8?B?ZHpnRlh6LytGczJzeFFkZGJZaERTRjRZT0lZMXkxSTdxdDVEZTBvKzFZaEVo?=
 =?utf-8?B?OFp5dFNCc2hsTHNYeWtZQ0doZFBpK01FcHk4S0dGTkhJVmZ0M1NVYUZZS1ZW?=
 =?utf-8?B?dVFKUXgyZGpEOXBTdzlCN3h6eWtxZHhqNGZuSHlxdkdqN1RCTjFEZS9hSlpn?=
 =?utf-8?B?OFpGS2F3M0N0T0J4VWN3SWFkZk93VEhvR0dNY2lYaDZ4WjE5V2RjVG00V2NN?=
 =?utf-8?B?dTVWOEZWck1hcXZod2Q1OUdCRUY1RWhVM2Y1cC9URUQvSzVGUVVwakhFN0o3?=
 =?utf-8?B?WnpML2xLZ1FkTWRzUTFsaDRxQTdLQXJnSUZ1U2hxSGJZV0tuZlhYYk04OGlj?=
 =?utf-8?B?YkFQay9sMEhtNXE4aU8xYmVSMGJxQ21uQnJkRjZSb01mKzdLcVErTUlhdjh5?=
 =?utf-8?B?ME16aVZGMzl6dWhRK2x1cnkrOE5ZUGttaExLTERCTWJwZU5rT21QaFp6RFdk?=
 =?utf-8?B?U2FOK2pUdzRLMFUrTkFZK2RlN3puN3RKQkEzVE9Gc2E2T3NDdTZ2VGhGeWtj?=
 =?utf-8?B?YW92c05Ra29JR0M5VHJ1S2V1cmEzYTlRTXNSZVFnbUFIK04xU2JtbjhhWm90?=
 =?utf-8?B?NlpDeEEyQ3RaY0lNVGYrMFNJT3FScVIxS1UrNW9YSFA2WkY0NVlQWm1kQmJY?=
 =?utf-8?B?VjN2c20zT3dnbXBNeDFQTm1zNnZERXpuMEdZV0k3THdxWU1YTXlxU05HQTlK?=
 =?utf-8?B?SG5hTTV0dzc1M1dGUEYxVW9HTjV6dDVGQ2hUdG1zN21DVXRmaGFkY21ZNG5a?=
 =?utf-8?B?VXFPdTdKeDIwZldqUG5ickU2Z2Q5a0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlVFY21EMVIvSW04bXdod3FiaTFUTVMzeFIxekMxMkcxL0gwTGxHRUxISElH?=
 =?utf-8?B?Yjk1ZkdtRGlUeUpMbkttNXJvakZXSXVoVTdqZEF1NWkvaUhkLzgwbWRQQ2kz?=
 =?utf-8?B?dnJ6aWRzbjlhTVVhOU1DT3dwdVVmRkgzellmTnF1SENzZE9GMTV0b1VkOGtw?=
 =?utf-8?B?cENFSjR1ZG5jZDdiU0NoSGs0UnpaU2UzR1dOUStPdU53Um1iVW94cC8vVlR4?=
 =?utf-8?B?SkR1b0svRzV5bnV6VTh2UXB2T3AwMWdKYUR3S0U1K3pFMlZFeFowdTNZNFdE?=
 =?utf-8?B?SEkvS3RyUEVVTjZ3Skh4OVVXaWxUSG00U1BMRGRKbHVRZ0xOamVOOGVDVWtv?=
 =?utf-8?B?cXNuNE8rTjJaUll1M1RER1VTY1pYcjR6SkRRNlpnaGQ4ZmVaUzJ5WmU5UFk2?=
 =?utf-8?B?SmZBaC9sY3JpNFpPQVpvdDIyM1g0eHkremlLbnRiamFpazBOcGlPcEtrWHVC?=
 =?utf-8?B?MWhqdVAwS1pBTUR2WUVndHVwQ3pYaGlJRm1YWW9waEQrYjRibEN5dzdqaDBu?=
 =?utf-8?B?bVlrUjFudFBwd0tCb0JjYzdzaFA3VVhMWU1qZytSMlk2UVdHVHc3UGNUNHpZ?=
 =?utf-8?B?eXZpQ0k5cG9GSUlEcUlTVUU3Ni9NUnNVdGp2SnNpanlieEs4OHdmOUlUSlE5?=
 =?utf-8?B?czloMEtidnQwWW8yaXJkOEdscFJlOE9yRXVGQkFmZ1B3TllGM1M0K2VrejZv?=
 =?utf-8?B?VGtlUVViVVhGOHdnY1RJd3hQem4vM0ZIUDdFbTEvek04eS9hbXB1RGNLYldP?=
 =?utf-8?B?NzVJN1FEZjk4aDBiNDZNaFg4VkVJeHdIdzFxaHV4V0hwL0JQcWNGcUpGbCsx?=
 =?utf-8?B?MmVlNVBrZ0tTdm5mVHdBYWYyVEpuellpU2FwdFRWbU5kUDJGUjMzZjBsNXR3?=
 =?utf-8?B?b1E1dG5qdGNxS0dLTjJiZDdkck1wQUo5cUtrQjRKSWlnbnUxWFF0RVN0V1hZ?=
 =?utf-8?B?bFk3WDJHeXRyeWNoZHRJN1REUE16aDlKUXAxbURXN09sZThETU1MVkRiQm5u?=
 =?utf-8?B?Wno3RWxhUDdHTE9ONCtUWnhDVGxNbW1odU9JRU5GdFZCNjRCbkFlVTV6Z3BS?=
 =?utf-8?B?aHB4UEtxMXVBd1BrTmRDNTJMaFI3bjd3eTlXNzUvM25odnIvMFBWS0RUR1Qr?=
 =?utf-8?B?d0FKeWNrS3NBemJFZjhraEY3L1hXem9pSUducktZaEczY0FaVm1rV2RxdG5V?=
 =?utf-8?B?bHdmQmZRZzRkalRncFlJcm1HT3ZJYW9yNEZxWXk4NTJNM25zVE1mZFVBcHpl?=
 =?utf-8?B?c0xuc1MzN0pqUXVqUWQ1VTlweHNFc3BxUnovemNQa0o1SHg2Nk1jUnpobW9R?=
 =?utf-8?B?amNaakZCV0U0eUt3Z1NCRTJ1eEljQy9hZGVzUnVhdDlpb00xbjZUT0U0VWV1?=
 =?utf-8?B?YzUxR3llMnFVbmcyMXNYMjZaRWxZOFF2MHNrbHlOS1VXYTVEc0JvSmJSY3Vy?=
 =?utf-8?B?ckpQZUtERTVLSnY5aUpmK0ZMdVVHcHVFdWlRcGRacE01VFJSYUUvVVBiSWhJ?=
 =?utf-8?B?NlN1ajJwVjNjb1Jta3dDWis4Zko3MGpjVG41UFZhT2F4azF0Mi9NeEhqZnN4?=
 =?utf-8?B?SzQyRE5hR1ErQXBxYVBsZVc5OElTRzd5YmNXL01ZUStSWEMyVGNxckhvaUxS?=
 =?utf-8?B?ZWRhRnZPL1FMK2xkTkdWQk81NURHelBtZ1BTTnZadzdIQTIzd0NEMTF4LzJm?=
 =?utf-8?B?dFVURkRXT09VbHNwN1Y1L0s5d0hDcDZ6WWp5TnlGa3lvSExmTm1ENVZjeG40?=
 =?utf-8?B?c1cwUkcvaGJ4bkNPdFIrUlRiZU1kbUNFbTNOazdlY1g5R05ZRlpoTUJQMUJF?=
 =?utf-8?B?Z21EcHJBQkpkUlhTY0dVLzk5V0ZmVlV3NGdkMkRpc1lnZjk1M3RYemN3SExo?=
 =?utf-8?B?eTlqVVFJdStyc3JmdXl1bkZzZEZGNGM3WU4zM1lHOWkxNC9GanFVbnVYZDZh?=
 =?utf-8?B?dmJjY01QdEwvQThSaXJpb1l4bGxicTcvaG92K1hGVCtpdVd0bjZBNHJRT2Y0?=
 =?utf-8?B?M0d0b1FLdm44eG8rY0ppaGRwSkxpeEt2bExXcXZuZGptY1llZ0ptU2U2ekNZ?=
 =?utf-8?B?dmkySzRvN2JQWGhZaGpoVTlnZjkvWFFUekFIMDZnR1pNYlQzZ1c0RFh3U3JB?=
 =?utf-8?Q?GWidqJYsASN0NzHmfQU/ea4ch?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0316d701-0001-4bc5-ee9a-08dced276ffc
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 14:41:22.0462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d/WYiplcIKoE/YiSxUtSze1G40bY1LgjbfEDjqU0JhyBwNyB7DFQasrjEdNxI9Dl+gCHXNHalhpMAKD3Fg+lvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8222
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

With the "Fixes" tag fixed, looks good to me to make Coverity happy.

Reviewed-by: Zhanjun Dong <zhanjun.dong@intel.com>

Regards,
Zhanjun Dong

On 2024-10-10 5:33 a.m., Michal Wajdeczko wrote:
> 
> 
> On 10.10.2024 08:54, Dan Carpenter wrote:
>> On Thu, Oct 10, 2024 at 12:46:34AM -0600, Everest K.C. wrote:
>>> The pointer list->list is dereferenced before the NULL check.
>>> Fix this by moving the NULL check outside the for loop, so that
>>> the check is performed before the dereferencing.
>>> The list->list pointer cannot be NULL so this has no effect on runtime.
>>> It's just a correctness issue.
>>>
>>> This issue was reported by Coverity Scan.
>>> https://scan7.scan.coverity.com/#/project-view/51525/11354?selectedIssue=1600335
>>>
>>> Fixes: a18c696fa5cb ("drm/xe/guc: Fix dereference before Null check")
> 
> hmm, this seems wrong, shouldn't this be:
> 
> Fixes: 0f1fdf559225 ("drm/xe/guc: Save manual engine capture into
> capture list")
> 
>>> Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
>>> ---
>>
>> Perfect!  Thanks.
>>
>> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
>>
>> regards,
>> dan carpenter
>>
> 
