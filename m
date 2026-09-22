Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC5BC98302
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 08:53:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1949C10EB4B;
	Tue, 22 Sep 2026 08:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KPaK86WZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20FED10E673;
 Tue, 22 Sep 2026 08:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790067221; x=1821603221;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QudNPdpTFAFVzZqVY3tQMOFtvsLOH2A6+4eWJfdUnJg=;
 b=KPaK86WZnBKpu/jfULZZw7RRlJbmpQYXi4IGgJnQFdHVFfeRtQOMLzid
 VVA9OEhs08j/renRMgBbh1814L0VO3DkVSHUa2qjr+akKaql/1tJrXgKA
 mgnE2pMw4oKt8CHaplBo9jmnZHTmfsSLOF5KgtrLLeuktbM8vAjg5SGnL
 bi/KwwRgjSDawzkebqTdSmGHVvq5CCQAE93Uk1tnYUH/XaaGcIFrvESSM
 C/Jdzwad+aW6wzj1mm+3Mum5w1aNnKp8yU0l2c9h6+HzNq7/FJ9O1xxwC
 5faJA082YU/8s6fNjDciPIKC9UmNheX8wRq/CGiZKNPcS6gq/Dh7gakrh Q==;
X-CSE-ConnectionGUID: lXRnPsPIRHuJr7wgFtTBkA==
X-CSE-MsgGUID: XboE2E0xQQqyBxc5mHM2lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="78205160"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="78205160"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 01:53:41 -0700
X-CSE-ConnectionGUID: RgB9ZvG5SDi7CUBgt9cG2g==
X-CSE-MsgGUID: d7lM/Mf7TNOG7kwpQ6qJYw==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 01:53:41 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 01:53:40 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 01:53:40 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.70) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 01:53:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IFcSivGP9vInppIldFQ9y9qDjHtkxzftspr7PCzx4mwYRaItSZheNPFOKOWPO8rOL6/yGkCjZnhm7qIS9Be2eHNX50BmT4eKr+fA4tQ4vHTtBljH8lQo15Sz6tRMHj+DaPiPJa580Ao4nueDmUayhbQSA38Dyn9Ko9CpQFqLLVVMtMDxmNeTKEDqR8CapIS0UaGkN3vy73IrDTm6GN63wJGi2f3iQ5DjT8WqAGGMaYsztPK9iV9fQV9xlYjS6ortoff4wnrAXl7G5E74naITJzurpKwJQE4CryXsrQI0PTStw3vwC27XyByuakj1oCxefI6BlrRL6exE9gf5T25vjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t3yQR6QepYpgBwv3AAIze+dnWsh8CfAdcy4D06tAtNE=;
 b=wdeqUPgZHmXbfDO04OVWoIgmR52mQhxK2R5uT6kyoDmC4aClVn0I4QjDJ3oxqmApM8T5+Ol6XbEKvQocAV4XY44PFZGimmTM2L1R1ChQ/Vj9tVCF5w+tOAfZbnauBwN98nNJOm1XRwvW9nLDDpgSwEKyFi6QXSlZs0pZ5PYNl/lBhmrIElSuqTQM+RkMrTC33hFIhWEcKRkP7DRGp8S4WpgkK+iDDRzR9Am9OXYwTW/ynIJWuLw1KxANFzkqH0BhJSley9o9lEjWjXxF+N6FDUyXpiQrDy5A0Ud9n2ff/AUSSFIAYBAJzi7LAwTrpxygEg/zuLiNkbMnRcfET07bDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7183.namprd11.prod.outlook.com (2603:10b6:8:111::10)
 by IA3PR11MB9328.namprd11.prod.outlook.com (2603:10b6:208:579::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 08:53:37 +0000
Received: from DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::d9c7:d2fb:680d:1ee1]) by DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::d9c7:d2fb:680d:1ee1%4]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 08:53:37 +0000
Message-ID: <e6727396-791b-4509-863b-9fa9e1347839@intel.com>
Date: Tue, 22 Sep 2026 14:23:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] drm/i915/dmc: Add sanity check for DMC load address
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>
References: <20260907171856.1484854-4-dibin.moolakadan.subrahmanian@intel.com>
 <20260907171856.1484854-5-dibin.moolakadan.subrahmanian@intel.com>
 <IA1PR11MB63481933CAA623068BDE2B54B2B82@IA1PR11MB6348.namprd11.prod.outlook.com>
Content-Language: en-US
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <IA1PR11MB63481933CAA623068BDE2B54B2B82@IA1PR11MB6348.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0065.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::7) To DM4PR11MB7183.namprd11.prod.outlook.com
 (2603:10b6:8:111::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7183:EE_|IA3PR11MB9328:EE_
X-MS-Office365-Filtering-Correlation-Id: bbcadb5b-1bb8-41f3-633f-08df1886fdc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: dScyzpP7HTzkV9NEQ12Son6AtawQbepuEf0aqLbfE/bdJwzc4VkNZDpuyZW5uS7wl7elhHk2gMKL8dfvzTSXNbWFh18imJSzTPThWvEfzrhbQ8PSfqNAKUNX5HHgMGsR9Ev8La4ml9Ew0x9224oiPIR00STCo8xRz3e674AFu7Akj0jAWHXGaB1UCUp1bi2kYD1QZM/MbkU/iSF8sHWh9BWISHyaNvF/Z0kN5IGPoFHbr/5k31lbqu8Ww1icOslkfpvu4J6GP+tlicaSjRgryRV0rl0IQqR9aylkM6uBHrZtydGUfRZpOA2ZKWKyHvUdnFQROXZsFlOJp1cTJIumxnbnM9/7t/tQfa4Yrtg4HkzHCiKZGEmle3W7n+0/e+770J1NrjT0HEaZSX4tSXhEjGvuff1m7YG1LjLQj7DMf3L/cVoXhJU2OYWb00tXAibUtQVkbaFmumEaMJxd9K4ZsIBNgCBjNoX8/IjWlK52leUkdg3jrwJvK+wicF1VD5aAf4P7jb/05hG9aQ2EY1YxozrU+JsnxA+9c0VEkac5ahWcHUsZ+6A85bL92gxfYuUAmb9gz8bJgoQAwNAw6N0Tx3N7Pjl6S1odwizjpxPB+KaeDxEMV8rBwjMEegTn+p13SUyIS/RdFBu4v7GpbqVF4FPzHKU1cJFY+06BR5fzOck=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7183.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3FsYjg3MzlXQVFpSEdXVDdHaFh1d2ZXUjFiUDB1T2hQZU5aWVF1cnBaNEtZ?=
 =?utf-8?B?T0I1OEhURGpqS3YvdGZMOEgrTnlEaEFhNE1XWmlUOFhmQXVuNGZvMVhpMFU3?=
 =?utf-8?B?RWFVRldZQ2Z6Vm1QeUJjWFk1bW1JMTROTFY5cnhPamRKamFRRHowSTJCMjRk?=
 =?utf-8?B?a1RBQ1RoY3EvQVVBOGZhbWRqQTc1bFpvZXRDRklVYUhSaWN2TndTMkY4Ym03?=
 =?utf-8?B?bjZjTnEvNk9YQnNraDRjKy92TGtTRFZJbGViTWpkRW1oK2NJODdlZUlsU1Nl?=
 =?utf-8?B?QzErbU1uOG80T0pHMUNwTUp6dXNYUDRKeThxeFVnMEFRNFM1ZGZCaVpyckZl?=
 =?utf-8?B?U3ZjckdaSkRpUXQ5OFpNRkhDblhmUnhyUm5DUDRKdTh4T3cvRXdkTnZXUzhX?=
 =?utf-8?B?djc4L1R5all4dmpNZ3lweVRRMUlVdmVBR1hPVXVRYTFQamthUzFqNE9mUytI?=
 =?utf-8?B?MGhONmhDODNJLzRwdDFxQTJmZERwd0p6SkRnUlNCNExkWm1wZ1VnVDdtdEZG?=
 =?utf-8?B?TkUxZlBRL0cwVHJnRmJPZUV3SHJoNkM1RHkxWkhIRXNqcGxxU1R3YytDcVpv?=
 =?utf-8?B?Umo5enlJQzJrRDBaMnhCakRNY3poWkMzb2xESnl1YUlRaUZGVE5EeXBLbDFu?=
 =?utf-8?B?K3Q1TExEUU5KeXoybE9ZTHMzd0ZsWmpQanJXSkVwWGNJNjFzUU50dTBrNFpL?=
 =?utf-8?B?VW9Pek42UTZDU1BaRVV2elpOVWRFSnJ6NnBZNEhoV2dVVDBIZW9VejhYUUdX?=
 =?utf-8?B?YjVJVFEwalEvNnVWT2h1b3RmdTlndzJ5cnFLQ1AwRkdQQnkzbjRTbDRLS1ZV?=
 =?utf-8?B?SmhNbzZZS1RvQkVydWM5V25SVlhsbmVUN2w5dHU3K3dUY1BuWW4vMW1NOFdU?=
 =?utf-8?B?ODR5amFHTEdsTVFmZGJpMWxETHJpdDNxcHRzMUhLUkNTYzdwd3kyL3AxYzgx?=
 =?utf-8?B?b1Q0V1VPUkIrS1hNYVgzNkNOODkwY1d6UnZRaUtNV2JSSlR2ZlQwZWpUNjMv?=
 =?utf-8?B?YWxpbFFjK3cvV0orR21Od2NodE8rYkNRbzk2eHRoeW1NUDJLWC9XV09EOXpD?=
 =?utf-8?B?TGkxOElPeXhLTGthNHNBR0wwbGFSWllZYXFpd2dnMnpzZTliemFQWmFHcTdu?=
 =?utf-8?B?TW5ETkt4VDFCVXFiN2F1Wks0ODRZWVU2T0kxd2pDcnMvQnpsMGttNlZ1VFVy?=
 =?utf-8?B?T09xTkpuMWQ4YXN4Q1NscWh5ckNjVzh3MmpRRDF2LzJ4aXpaM3FsRklGN04z?=
 =?utf-8?B?dGR3SmxuNVg0MTcybDlTUmVUcERpWGtKQU9nRWp5Vm92cVZkSWs3dWZHeHZ4?=
 =?utf-8?B?bno4UzlyUFUzaGlVRWRSMVIzbkNocVYrNTlCdDZxUVFBUy9OdW4vZEVoY2NL?=
 =?utf-8?B?R20rTGE3N3lBaDBnV21HSERQemM0bXYrNEh1QzUzUEpzd2NqakhVSy9xQ1No?=
 =?utf-8?B?MmpRdVR6bkhtRE1QYkZhaFlLTFR4SDJ1VGJVOWQrMXhIUXRERDlPK3lTMFhz?=
 =?utf-8?B?Qk9LalF2Y1BmZ0tLREU1RndpNkMxREhnTEV2VHNsT1JyRm5zU1MvK2RndnQ2?=
 =?utf-8?B?WlRFUFVNaXQ3SGcvUWdQdjY0TGNGMHNhdi9kK1I1Yi9UTE4zL2xmRDMwUkdE?=
 =?utf-8?B?V1J5OUxMVjQxMDBCMFVkZlNzcFkyUWZqVm1XU09GbXVtSENSWmZUUVhBbkli?=
 =?utf-8?B?VWVMQTN0bzFsYm9YV2FFdUVaNjBGaEZ4Rm12U2pHNmxTdzFPY0tuWHBRYi9V?=
 =?utf-8?B?WHdtNGlmWlU0Zk00bVN3d3FxOG90SXdZWGE2WG5TTGxHd2RBbkNlVm9kLzg5?=
 =?utf-8?B?OHlwak5qVEgxaDJJdEI0YzkvSEhFbjNmUFZZbDYwZE82cHIyUXdTVlVUZUox?=
 =?utf-8?B?UHFvZW92ZG50MGpkUnROZEcxdVdwRlpDNWNiZVVRRDRDYVdrOU8xaTNTN2FN?=
 =?utf-8?B?ZUxwcGhYVCs2WHVJVnBrS0krd1hMOXBQSFRPTzFpZkNwN3RXZXYrY09ZZ1gv?=
 =?utf-8?B?cS94eWtrb08vTVFFWG04M21pc3pmWTIyeEtNQ1FHNGwrdFd4L1FtRDBHOUw0?=
 =?utf-8?B?TGIrVHFLbE5wbTFiOHZxVGtTQ0p6UnlTam8rc2ZxUnlWZENWaG5LeTdRNzM5?=
 =?utf-8?B?eFQ0eFN6eGUyVFY3ZTZDR3RIL0RnMGltcWVOT1NYNnZRWlBVdXdkenJHb2J4?=
 =?utf-8?B?dFBiZmcrU1BHRlFnRWFPb0tBdEU1QkJHMG9IMWoxSzlNTERCRGNLY3ZCVnpV?=
 =?utf-8?B?d0ZLUTNiYmVkUUd6OWVuUEdsb2hXTllodUFaL3pBU29yRkhLSTZQdzVJZlZQ?=
 =?utf-8?B?NkplZ1RXVnQ4cnVmZytXZ1l6VEFZSUZCdFpsYTJ5TlRsY0xyTTZ4RFQ4MzNq?=
 =?utf-8?Q?yDv1Nnc/lSnCQ+Ss7MyRCMESEgAg+Cx8EyL4o?=
X-Exchange-RoutingPolicyChecked: pmdrOZDpUR3ChNyg4CAGpJL4HYrL3hsaj66ozImGpeNAAWfaCGGLnNo5QaQ9PTAHx6ICAo1L/WfrwDdLOStnPJ5KbSEEteqfiH+DkuGXCl85li1M0Le/8u3lqfsz599ZytXdTC1L2CJzuXtEKYZQFMCsYCHJme9O+s+CVj1LlOIL+60ab7TI3cA51GRUrhj6JW5UwUPOkCAqnJcA2twULAjCKFud+OPOtaBKaY3VbLHFVUZdwCMzfXd4rcVLjeyJwBn/ijo+0Nfhh4kSyJ9aDUEYTE+cJ0oRPqpsglDQBAOitvTLqplUkD22MCqZAjB/VGbrME9FHYCoghtoW/y/YA==
X-MS-Exchange-CrossTenant-Network-Message-Id: bbcadb5b-1bb8-41f3-633f-08df1886fdc8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7183.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 08:53:37.5927 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U3SYw9NQdAeeeVF/yQISWWoM0jgDPDijJ86SWfwj0iXAdZLzrAdg71SZWMOzS5RqsMcFQVJW5r1LWoh8ggNs/WNt9RUeZSEXYAigeiTG4u/x/LC6BEyUAAhdXqVjgKgd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9328
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

On 9/18/2026 12:12 AM, Golani, Mitulkumar Ajitkumar wrote:
>
>> -----Original Message-----
>> From: Dibin Moolakadan Subrahmanian
>> <dibin.moolakadan.subrahmanian@intel.com>
>> Sent: 07 September 2026 22:49
>> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
>> Cc: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
>> Nikula, Jani <jani.nikula@intel.com>
>> Subject: [PATCH v4 1/2] drm/i915/dmc: Add sanity check for DMC load address
>>
>> For DMC firmware header version 3, the firmware load address is stored in
>> dmc_info->start_mmioaddr and later used by dmc_load_program().
>>
>> Unlike the MMIO address table, the firmware load address is not validated. Add
>> a sanity check to ensure it is within the valid range.
>>
>> BSpec: 69671, 68378
>> Fixes: 3d5928a168a9 ("drm/i915/xelpd: Pipe A DMC plugging")
> if available, please add Closes: <url> (with Reported-by:) to link it.

Thanks for the review.
Reported by internal tool , Closes not available.

>
>> Cc: stable@vger.kernel.org
>> Assisted-by: Claude-Code:Sonnet-5
>> Signed-off-by: Dibin Moolakadan Subrahmanian
>> <dibin.moolakadan.subrahmanian@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_dmc.c      | 79 ++++++++++++++++---
>>   drivers/gpu/drm/i915/display/intel_dmc_regs.h | 12 +++
>>   2 files changed, 80 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c
>> b/drivers/gpu/drm/i915/display/intel_dmc.c
>> index a191eee240d9..051b721a0895 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dmc.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dmc.c
>> @@ -1023,6 +1023,56 @@ static void dmc_set_fw_offset(struct intel_dmc
>> *dmc,
>>   	}
>>   }
>>
>> +/*
>> + * Check if the load address is within the valid range for the given DMC ID.
>> + */
>> +static bool dmc_load_addr_sanity_check(struct intel_dmc *dmc,
>> +				       u32 start_addr, u32 payload_size,
>> +				       int header_ver, enum intel_dmc_id
>> dmc_id) {
>> +	struct intel_display *display = dmc->display;
>> +	u32 start_range, end_range, end_addr;
>> +
>> +	if (header_ver != 3)
>> +		return true;
>> +
>> +	switch (dmc_id) {
>> +	case DMC_FW_MAIN:
>> +		start_range = DMC_MAIN_PROGRAM_BASE_START;
>> +		end_range = DMC_MAIN_PROGRAM_BASE_END;
>> +		break;
>> +	case DMC_FW_PIPEA:
>> +		start_range = DMC_PIPEA_PROGRAM_BASE_START;
>> +		end_range = DMC_PIPEA_PROGRAM_BASE_END;
>> +		break;
>> +	case DMC_FW_PIPEB:
>> +		start_range = DMC_PIPEB_PROGRAM_BASE_START;
>> +		end_range = DMC_PIPEB_PROGRAM_BASE_END;
>> +		break;
>> +	case DMC_FW_PIPEC:
>> +		start_range = DMC_PIPEC_PROGRAM_BASE_START;
>> +		end_range = DMC_PIPEC_PROGRAM_BASE_END;
>> +		break;
>> +	case DMC_FW_PIPED:
>> +		start_range = DMC_PIPED_PROGRAM_BASE_START;
>> +		end_range = DMC_PIPED_PROGRAM_BASE_END;
>> +		break;
>> +	default:
>> +		drm_warn(display->drm, "Unknown dmc_id %d for load
>> address sanity check\n", dmc_id);
>> +		return false;
> (nit) The switch already covers all five valid enum intel_dmc_id values, and callers only pass validated ids. The default is dead defensive code; returning false is safe but If the goal is to force a compile-time reminder, consider using "MISSING_CASE(dmc_id)" for consistency.

Will useMISSING_CASE(dmc_id)in next version.

>
>> +	}
>> +
>> +	if (payload_size == 0)
>> +		end_addr = start_addr;
> Bounds are computed on payload_size = fw_size * 4, which is 32-bit and can wrap. For fw_size >= 0x40000000, payload_size wraps small/zero, so both the max_fw_size cap and dmc_load_addr_sanity_check pass, while dmc_load_program still loops the raw dmc_fw_size and defeating the new check and causing OOB reads. Please validate fw_size (reject 0 and oversized) before the multiply.

Will fix the 32-bit wrap in next version.

>> +	else if (check_add_overflow(start_addr, payload_size - 1, &end_addr))
>> +		return false;
>> +
>> +	if (start_addr < start_range || end_addr > end_range)
>> +		return false;
>> +
>> +	return true;
>> +}
>> +
>>   static bool dmc_mmio_addr_sanity_check(struct intel_dmc *dmc,
>>   				       const u32 *mmioaddr, u32 mmio_count,
>>   				       int header_ver, enum intel_dmc_id
>> dmc_id) @@ -1125,6 +1175,24 @@ static u32 parse_dmc_fw_header(struct
>> intel_dmc *dmc,
>>   		return 0;
>>   	}
>>
>> +	rem_size -= header_len_bytes;
>> +
>> +	/* fw_size is in dwords, so multiplied by 4 to convert into bytes. */
>> +	payload_size = dmc_header->fw_size * 4;
>> +	if (rem_size < payload_size)
>> +		goto error_truncated;
>> +
>> +	if (payload_size > dmc->max_fw_size) {
>> +		drm_err(display->drm, "DMC FW too big (%u bytes)\n",
>> payload_size);
>> +		return 0;
>> +	}
>> +
>> +	if (!dmc_load_addr_sanity_check(dmc, start_mmioaddr, payload_size,
>> +					dmc_header->header_ver, dmc_id)) {
>> +		drm_err(display->drm, "DMC %d: firmware has wrong load
>> address\n", dmc_id);
>> +		return 0;
>> +	}
>> +
>>   	if (!dmc_mmio_addr_sanity_check(dmc, mmioaddr, mmio_count,
>>   					dmc_header->header_ver, dmc_id)) {
>>   		drm_err(display->drm, "DMC firmware has Wrong MMIO
>> Addresses\n"); @@ -1169,17 +1237,6 @@ static u32
>> parse_dmc_fw_header(struct intel_dmc *dmc,
>>   	dmc_info->mmio_count = mmio_count;
>>   	dmc_info->start_mmioaddr = start_mmioaddr;
>>
>> -	rem_size -= header_len_bytes;
>> -
>> -	/* fw_size is in dwords, so multiplied by 4 to convert into bytes. */
>> -	payload_size = dmc_header->fw_size * 4;
>> -	if (rem_size < payload_size)
>> -		goto error_truncated;
>> -
>> -	if (payload_size > dmc->max_fw_size) {
>> -		drm_err(display->drm, "DMC FW too big (%u bytes)\n",
>> payload_size);
>> -		return 0;
>> -	}
> (nit) Mention the code motion in the commit message. A single line "move payload_size computation earlier so the load-address check can use it" would save the next reviewer the diff archaeology.
>
>>   	dmc_info->dmc_fw_size = dmc_header->fw_size;
>>
>>   	dmc_info->payload = kmalloc(payload_size, GFP_KERNEL); diff --git
>> a/drivers/gpu/drm/i915/display/intel_dmc_regs.h
>> b/drivers/gpu/drm/i915/display/intel_dmc_regs.h
>> index 6b7978fb8986..324320afad58 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dmc_regs.h
>> +++ b/drivers/gpu/drm/i915/display/intel_dmc_regs.h
>> @@ -521,6 +521,18 @@ enum pipedmc_event_id {
>>   #define TGL_PIPE_MMIO_END(dmc_id)	_PICK_EVEN(((dmc_id) - 1),
>> _TGL_PIPEA_MMIO_END,\
>>   					      _TGL_PIPEB_MMIO_END)
>>
>> +/* For DMC header version v3*/
>> +#define DMC_MAIN_PROGRAM_BASE_START	0x80000
>> +#define DMC_MAIN_PROGRAM_BASE_END	0x86fff
>> +#define DMC_PIPEA_PROGRAM_BASE_START	0x90000
>> +#define DMC_PIPEA_PROGRAM_BASE_END	0x96fff
>> +#define DMC_PIPEB_PROGRAM_BASE_START	0x98000
>> +#define DMC_PIPEB_PROGRAM_BASE_END	0x9efff
>> +#define DMC_PIPEC_PROGRAM_BASE_START	0x52000
>> +#define DMC_PIPEC_PROGRAM_BASE_END	0x53fff
>> +#define DMC_PIPED_PROGRAM_BASE_START	0x59000
>> +#define DMC_PIPED_PROGRAM_BASE_END	0x5afff
>> +
>>   #define SKL_DMC_DC3_DC5_COUNT	_MMIO(0x80030)
>>   #define SKL_DMC_DC5_DC6_COUNT	_MMIO(0x8002C)
>>   #define BXT_DMC_DC3_DC5_COUNT	_MMIO(0x80038)
>> --
>> 2.43.0

