Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BCB2C5CFC1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 14:00:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7AEB10F5DC;
	Fri, 14 Aug 2026 14:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B7cDO5V4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 082C210F5DC
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 14:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786716023; x=1818252023;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AxiiBpDzLOx66FOBEQX9yKcjdA12d9KHui655chrraY=;
 b=B7cDO5V4U9uL5DjPONy6plZkApqoJlCiosPh0smAVxxBgWN8x9GXPaNc
 83e30XM+hDqyydjL8xtyM/JmZBBBuj2Vg/ocWDpc5AkJOiGKInaxmO+kY
 JGh/H1kJLNYjC+pK9Z6foAlXPGmH1KTnBTEdr1Kuqc8MbtJv3t0RyIVLd
 62QdPJlC9fWxTRebmdfP0zYVXg5nc7W0aKutcmN42FGXlqd8wAwRF/33B
 CfR+4sdw6FHI3ukJo3KWFhp5RY0dHJxQ4gu3faaO7pF3+Gw6aHpDfQiFR
 Qhxi+TIAwA5eHkyu9q3kJY2HGYNsEm/WsijMKDJtPxc5DaR9nh6hmmFB6 g==;
X-CSE-ConnectionGUID: /vL7vrnQR5a1UweGzwAXZA==
X-CSE-MsgGUID: uY9W8WoWThK+bqQblflG0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="87316375"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="87316375"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 07:00:23 -0700
X-CSE-ConnectionGUID: nwtwKMEPQIupeZ8MseblPg==
X-CSE-MsgGUID: WMZ5jv1mSA2NDCBo80S1tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="289032237"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 07:00:23 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 07:00:22 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 07:00:22 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.28) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 07:00:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zEZMpEaycEuL2kN3zQRmAo0aYvRErulLUACXCsFRJJgUw5xfxhz27zXJAp2mjwrN5KAMUS8sviOHBrVH03TDE4mKCQdnFXR1r5ye8AT3s9AyFWskzLA4iEZw6ZmZ48jOEw+tW2qlgSGlOuz0oH02WJN7v3+hW02KUCL5/kR2us+mPlObGgOcCnOJhMV+ITLERmuJD5yG/6MzsvtKoKJTh6w9GBEtzBiXXTe6VQmgXDCrhwaR6K5cxGa3yUUBPeW91j0nKFvEejWeVWBwTXCuHr8ri2zOdWHoRW8tkB4OWFSItz3mlINgjSvJrl/wSUIOb/zv1+d/TDZybhLKWykXaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KkkEmvvkxkwVDagOjnpSUE1Se0wqt72h1tTyjUzG+Mk=;
 b=nH+VMth6bsseUZnGMHNM6/pkewROacQ63DAU5Kq4FZ8/V+fVdYftIxphvhiVzoJN4Tk96JnsekkTHK7eAwrUrpjWBUN6hrNqCJ55VE6Rr3nRAJK+LiIdrCHULBeix/UuUjDF/DScWHiTBYuKeRVEQ4ztLMirSp0CqkZaozCIqg8Bk3g6o28gYSFK1hcVWEELzNA8K3yAGaZGV04A4ZWyc2yvmQfRPd9pvd1c8L6lJyEb5x2dDwxOhAjxNd7/1SQcwtf99kvIBohDHJkP7oRuW1hUua4PtlK8a4hPnTL4xVo/QoVP7CD51+8lhG+4X8yeb3woBnwYHrxuWuGPfS5wiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM6PR11MB4755.namprd11.prod.outlook.com (2603:10b6:5:2ae::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 14:00:14 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0315.011; Fri, 14 Aug 2026
 14:00:14 +0000
Message-ID: <8bad01f5-be2f-4253-b2bc-7a814a33f0ce@intel.com>
Date: Fri, 14 Aug 2026 16:00:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/32] drm/xe/log: Add structured SIGID error logging
 infrastructure
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Mallesh Koujalagi <mallesh.koujalagi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Riana Tauro <riana.tauro@intel.com>, Stuart Summers
 <stuart.summers@intel.com>, Yoni Levitt <yoni.levitt@intel.com>, "Aravind
 Iddamsetty" <aravind.iddamsetty@intel.com>, Raag Jadav <raag.jadav@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-3-michal.wajdeczko@intel.com>
 <860e37e3-40b8-4606-a294-0e572812de74@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <860e37e3-40b8-4606-a294-0e572812de74@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA3PEPF00000512.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::666) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM6PR11MB4755:EE_
X-MS-Office365-Filtering-Correlation-Id: c1e84de0-0d3b-42c6-277f-08defa0c5d3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|56012099006|6133799003|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: nrJqzrfvsVynQgAClUHtIGRjTVEWXmPSXwaYxdjurV74ld7BHYTJl4BzuIe9UiyHrI/wP+gXBQTp9RzzkgYVd0FeG2PP7N4c5tizmPa0w4KMarL0d6R57yYAh0uMAIF02ZKU17tSuQkiAE/6jkVgWiBViAUaWJpNk+s4Wi5DvFV5SfQxmrbFn8cS+7/iqc07HBKFevZduTinoMjh30taipvvIkQ2yUg4xIobG5PNyCKop7b8gxst5Sct8mT7udqZPpoRSkQhxHza8JlIE19Na4aX3UtfbzaNgwazocYrpgkhP3q/oZVKm04ZXvFLIF65VUuHeRVtjSmxER2nTIPt0QdfgT7HSlbfKHLWPyTn4zyDYRwTghRddT5gTiRvRV8fq8EYLSmcNsK1mEiPTY31m7bK5nAYTW4GVDQ0tPFrVlvCnXFwOOSVUMnLmmMy7oGQoGjztAS1O9i4ePOTGX6p5gT6Kq+rfBM0ICIClNTDSRRiuju+6m2QgJTG1w/6tjTayqA7vU3BRAMznz8mPdlQqsknL12QQzO5hlr6sdSbts/inxwKLhv6KPUNSpMIMl/q48S6DfpRdFPpu3jPt8sjRy36wywXFf/RbAde+KJg16WNF/kLHkD13D7aTI4Co6YNbKLLyfR9iuWpPVHpEc/o0ZxaLs82TB7YmsQfqF1phaI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(6133799003)(4143699003)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEZoazkybTRaN0pNcm1VZDR1N0FkSTJHUDduMGVEeC9VeCt6UG5iUkRMUldN?=
 =?utf-8?B?LzRKZ3YwRmVpQytDTXR5ckQyeWtuR2Y2N3o0aDZPZjBCRVp6ejB6N3cwakt0?=
 =?utf-8?B?eGNuUlp6YWpnUGVjUkFmUWFNVW5MaVltS3FyMG1xRmY4RG1WNHZqQTQ1ZnAr?=
 =?utf-8?B?UitsL2U4ZVE3djEvT3ZISTIyZmVpdStVNmFTSTFkLzM2b2hYRTlBekUwYzR6?=
 =?utf-8?B?c0NXcEppbEd6T0dwVkh6Y1UyZG5DR3U4OTNvZnFSTFo2a3hGTGdoK3RqT3JG?=
 =?utf-8?B?bTdOVWcvYzBMdXZwZ0p2a2VsYnozYTdlbjZ1MlR2cllyUEE1QjNnVXZWTHY4?=
 =?utf-8?B?NzAveC9sREVMVGlBU3pnZmNyMUVKRWlXT2xCNlc2NGhmN0xLUk0ybW9Sb3VF?=
 =?utf-8?B?NnpmeXdBMHpQdnRORjZGZUxXWlBVaEpKb01tTk96R0g0dVBNQlpOVi9Pdm9p?=
 =?utf-8?B?SE1JRWlNekxhZU55YnhNZnJTazY4bEhaWEJ2VWdkTGI2ZnBhOGlCNUpvQW83?=
 =?utf-8?B?REttcldrdU5ScWpHcDkvUXFJUXh4aCtMTGp0YU5ZaFRTUTZETEt5Z0g3bTZj?=
 =?utf-8?B?TEovQjVlSzhhRVNlUkg4cmJZTkhQNXpBdFpObEVGY2hFeGFxaTlXaGhJSDJW?=
 =?utf-8?B?VncwMnBTNzV3bW5YSnBxVVZOQ1V4emNIcGlLSFhEdTVOV2wvNmo2ditXMUh1?=
 =?utf-8?B?VGNqQTZJZkFnUEI3ZWs5YmZudkRROUhHbE5XZXp1MkRFb1pQYkpyQ04vQVVC?=
 =?utf-8?B?ZkJjbThhbzdCcmtBODcvVmY2Z1NybmRhS1RkRkxXZnh6TEdrMWZHMEQ0QkNT?=
 =?utf-8?B?QUdTdzlITVR3V1RmMHJCcUNGRk85N3I4NEF2Z0NPVGdrTU53UVBKYUlsNUcz?=
 =?utf-8?B?SG1UbTBhZ091R2pPOEJzaUR1cFBTMUc2eWlYcUFlVStva1FNblRDOElUWkdu?=
 =?utf-8?B?TmxxTVFxVDVrZm5RM3pSWlEvckorWmgrK0FVUW1lM3d4cGl0dTh2RzdPSGxD?=
 =?utf-8?B?TS9QeGpZSXVieUtOQkpBNUYvSk1xeWl4djNyNFFXdUlBREdiaWo3VmZ4Q1Zi?=
 =?utf-8?B?RUFvZ3k3T004TU1EQzV4VEhNVkwrNFdaZXNXdkNBUklDRVFYeFUxYjFwZm5a?=
 =?utf-8?B?T2RraGZDVWZTaUh2NmVhMkFjTU1BU3JOVW56SVVYMnFzaHFhQ2ZQMldZMCts?=
 =?utf-8?B?ZlI2cG9qQUNMMlRLNnV2dlY4NUJFT0lpTks1VUU2L0lUTElLTGRWcE1WdzE1?=
 =?utf-8?B?UjB6cFVvL3FtR1lRTm5hZlpCNENFT09yV3MvZk53di82blllcm9aQ1A1KzVG?=
 =?utf-8?B?L1lMVlcxWVo2ZnVHbldyT3ZJL1BtTWliK0hNN0VlbXpmclFCcnl0c2REclQw?=
 =?utf-8?B?bC9hazJvaml0Y0RWUVNwNURKdGo3UzRlYkVVWUhhWEFiekdaSzNFUmJ5N1RO?=
 =?utf-8?B?dDhHV1NsNENkWW12WDc2S1pqNUVLbkJhSlNBb2cwZndDeHVzOE1lQWJLdWtG?=
 =?utf-8?B?U3QwRmtNVnFsOHhvYWNPZmFqVU5oQ2ZoNkRNYWpCc21MdEFnTmpGNDVOcVFm?=
 =?utf-8?B?ZEo0RG5CeFd4aTJsNHZNRnI5ZmpQM2hrOGxMSUhuTWljTTZINGVYdnZIN29w?=
 =?utf-8?B?ME9rYWhlQW9KSGlTcDhOdVA5b2FDdzFNSk5ZVTdyaHVqODVYdHllOVgxTE9a?=
 =?utf-8?B?eW1nSHppQnpaUFRKSVovQzFRMUZsamtWenBrYTZxWWNFTEdRMmFvU2Eyd1R6?=
 =?utf-8?B?NzlMcjgyaU1TRjFnd1pkNnVZTlE3OGhzcHN4RURLU28yejcyYUcvd0FrVlM5?=
 =?utf-8?B?TzdPRGR6TEZEY1JFKzgyQkRrM2xRQmI2QWR6R2FKcnUwa0EvTlJMQzJVM3d3?=
 =?utf-8?B?b0cxR1ZVM1RDV3J4MGVZNitaZFFWZ3RxNENJSHFmaGVaNlZFZ2ozWVBwTURT?=
 =?utf-8?B?YzFXZnpyYzJ1QUFBUi9WUWlZTWFPZ015NWFRK08rRnhnZnNxOG5JSHU5UUtU?=
 =?utf-8?B?aE41OHczSTVTMU5NanFxMFpPTE9WVklqWDFONi90U3I4SzRVWHpvb0pmRVg2?=
 =?utf-8?B?dE9xbU5hRjlKQ0RDVjg3MmM2SStjY2NLSldNbFR6bUFJYzZ0c2NtdDlLa0ky?=
 =?utf-8?B?dExiL0RuV3dRdjFjeGVBS3UwalYyRXdvRGFIWWt1NlZERExUNTlrVnJkVVMr?=
 =?utf-8?B?a2dZOTVKMW85NjdQdzR6NFBSOU1EOHVlVmtVNDk0czMxV0ZCb1pEYkdmY29V?=
 =?utf-8?B?MVYvZXd3L2hhMm94dTJHVzJqYSttSHR2WlNGWGtmSjNoUFYrU1UrK2tySkdt?=
 =?utf-8?B?Z00rWTFOaFpBK3BiUUpwbGVvOWJEWlFqcTRzSVErN09SYjhpS1hwVVE1dUxn?=
 =?utf-8?Q?QUF/lblSdMsKRqZ8=3D?=
X-Exchange-RoutingPolicyChecked: Q9w7wxuUYhk937ClLf0WoIrNNn78EwUixhHiwbWat2117655SX2w8NjWgLIz0m/xUG0g3nSWESEGxHc2lI4/W8wgkN3hFhrTizOwjOBcF9l7lYDQvQBBErD6WD1wAAuXIOVeog45FpNukfdBQ3hHLRxdTTbtzymsidZPQd0JKBHR/Z8LBwAZaHCZvyaSLfW1D+DC4xWJgkwu4pKvOAhU+3Dw8XOksrWOgtrkAi3kQd/XPCTkGZa9KTKPSDfuvalonkDcT5FdThQ3lDsRbI9FNC7co08zL+JfXlOgil49/IgI9gsy1OamnTVHaG/GIhNptTK7S1iv7r+KCfgG3CTu9g==
X-MS-Exchange-CrossTenant-Network-Message-Id: c1e84de0-0d3b-42c6-277f-08defa0c5d3b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 14:00:14.6107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T5SFBNn2iAdQ5BZzSeIGzRJ5FfC0FiIYt3ljNWlj4/z5fIpkP+8H3nIW+Bo0uO55AqnAI+7equ54r296gPpoWCeTA0jvUDRKcjKNsZjXkYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4755
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



On 8/14/2026 3:32 PM, Nilawar, Badal wrote:
> Adding a few more review comments.
> 
> On 13-08-2026 00:44, Michal Wajdeczko wrote:
>> From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>

...

>> +
>> +static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>> +			  u32 component, u32 location, const void *data, size_t len,
>> +			  struct va_format *vaf)
>> +{
>> +	/* TODO */
> 
> Just for information, CPER log construction for hardware errors involves a system controller mailbox interaction, with the error_class passed via the data payload.
> 
>> +}
>> +
>> +static bool is_hw_sigid(enum xe_sigid sigid)
>> +{
>> +	return (int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START;
>> +}
>> +
>> +static bool is_sev_error(int cper_sev)
>> +{
>> +	return cper_sev != CPER_SEV_INFORMATIONAL;
>> +}
>> +
>> +static const char *log_hwe_prefix(int cper_sev, enum xe_sigid sigid)
>> +{
>> +	return is_sev_error(cper_sev) && is_hw_sigid(sigid) ? HW_ERR : "";
>> +}
>> +
>> +static const char *log_sev_prefix(int cper_sev)
>> +{
>> +	switch (cper_sev) {
>> +	case CPER_SEV_FATAL:
>> +		return "FATAL ";
>> +	case CPER_SEV_RECOVERABLE:
>> +		return "";
> 
> Can we print "RECOVERABLE" here? In my earlier comment I mistakenly used "CORRECTABLE"; I meant "RECOVERABLE".

but this is to some extend redundant information:
if it isn't a FATAL or CORRECTED, then it must be RECOVERABLE, no?

the same as we don't add "INFORMATIONAL" since dmesg
is already using KERN_INFO level

> 
> Thanks,
> Badal
> 
>> +	case CPER_SEV_CORRECTED:
>> +		return "CORRECTED ";
>> +	case CPER_SEV_INFORMATIONAL:
>> +		return "";
>> +	default:
>> +		WARN(IS_ENABLED(CONFIG_DRM_XE_DEBUG), "LOG: unknown severity %d\n", cper_sev);
>> +		return "";
>> +	}
>> +}
>> +
