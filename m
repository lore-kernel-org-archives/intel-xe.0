Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4755DCCFA13
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 19:12:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0645789B57;
	Wed, 29 Apr 2026 19:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PLf36S2h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E89B289B57
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Apr 2026 19:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777489939; x=1809025939;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0/Wmnk1eqcuLkWxZLev8SVKFhrTqYq9tToyaBiiUieE=;
 b=PLf36S2hUj/1MpVUOwhaBEjU+eMBskbc+llKOA13vGAdtS2MycM8JoQo
 ZRz/AO82JbgxUKkNLCz1Dr0JlLuHbPiiYHLOAO7kBJoDN4rwNTDU6d9s0
 o0REka/HmEjcj8oZ+FEaADLWms5QBlQI/ZihlMD4AbAhhd1Tqc1WCnahi
 ZfbZyWG9r3JqKJJni/BfJhRGULVOaPSPMXhszj7kDrOApEa1Y8K+6mc+n
 0SyXMRAB+cfcOjFtTNai3iSSn1exENkugl99lhJBk3hLRMpLE7SuwtGlP
 KlavHUrmgFPY0SLSyxzhxsvt+TbBnoNACFR+UVd+O4qZLjz5jKKe1cnyU g==;
X-CSE-ConnectionGUID: IXYZvr5EQzO4ZlmHQrb+fQ==
X-CSE-MsgGUID: KsOiKC7rSLKpMb98zORVNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="88739891"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="88739891"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 12:12:18 -0700
X-CSE-ConnectionGUID: pxRS5QexTCqAvlLmOmClaw==
X-CSE-MsgGUID: Ke7/1vpFSXySj+1B60m3Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="233326856"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 12:12:18 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 12:12:18 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 12:12:18 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.12) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 12:12:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F9i3hARERQ9nTRTyLxWcan+/mV7NY1fWqkGYhous2e3kydasCHqU9w/g2rRaezn3bqf7f2haIATJvScK+rSgviaO3/P2g7/2oJ24TA36PwmgzPHtgPqFwLB01CMnfYBCHr+epp0rcrQD/010ICV/KYqcEOHMWRY+bUADvMucUiJuGD6xvoFh9vYoE15z/swYBe5P3xctePeGfFHdIlfTk6CQjTULE3z5nsWYMrEqpaYlrQJ3xCNr9XbchAT2LheOMGYwxhZFT4XiHyikLgsq/1LjpzOOd2OTC+TvUzcXId7tHj8KLwl5IUPdxQdORGzG/707ph6wLNKn0PstkubBmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Vn+wil6t+SarTg9IclrndQoRps6zbjSISOgqJqL30U=;
 b=L+eQMYvLeDrH2m45W3PaCJNtg9YujR8q8UW6wW/cy54iM2RebDAVLO0ELXQCT7xIzI4mKEq9WnC+tQ8iqYnU64H2xt97juCyhceUShRi07BurbSM6EdRYM45Zb3/2xs8bVlW0zSI3TsXWQXM6tRFfFB/Ldpb0GpYlSMOTkEKHijNIlWXQG6yzgdfN3itKSlcV7BNWQxa5uVMEgEGFb41cdxjaqSR/Ma0uTUsSfeMWqCIoHjciZpZdkK1E2o68tBdcaOjDOThjDYAB4dA7g6M0CM7Kq3/6oJ8/2XyLcKXKl0UjfbIavhq1gGpVDxBG/Tb4qzhUCy8dmI1fhxPJUg6/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by PH7PR11MB7146.namprd11.prod.outlook.com (2603:10b6:510:1ed::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 19:12:15 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%4]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 19:12:15 +0000
Message-ID: <50f565d0-45ca-4622-a8e0-bbcb68322928@intel.com>
Date: Thu, 30 Apr 2026 00:42:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: suppress GuC error logs when device is wedged
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
CC: "Jadav, Raag" <raag.jadav@intel.com>, "Belgaumkar, Vinay"
 <vinay.belgaumkar@intel.com>, "Koujalagi, Mallesh"
 <mallesh.koujalagi@intel.com>, "Purkait, Soham" <soham.purkait@intel.com>,
 "Tauro, Riana" <riana.tauro@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Poosa, Karthik" <karthik.poosa@intel.com>,
 "Gupta, Anshuman" <anshuman.gupta@intel.com>
References: <20260420112925.1379274-2-sk.anirban@intel.com>
 <ced90e9252d7bed413b9c61d2f8495af72941bf7.camel@intel.com>
 <9bc30d5a-06ac-45db-a797-68f2b9c96722@intel.com>
 <71fb777f-1cd7-42ed-95df-08b6fd75f947@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <71fb777f-1cd7-42ed-95df-08b6fd75f947@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0133.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::7) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|PH7PR11MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: 15040fcb-28e9-4bd4-6d63-08dea6233961
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: qcvUL4p9Bum33dDn8bg8faX8R3BxR1F0B4yhvQPYQyZu+uTEQiwQM80dmijtMnSBuNZZKNXNnDDOxtGVJqw/2bmTsf/tBFvSLy1Iw6ZjzhUqd6+69NW3LbPIOQlsqL4buDO4fOO/HJ5RBmdVp51gtyYtT+ScFXxiLKQBMQU2MFcDLwwgyg+onmSwDGa5hsjiDvvZ1ZI3Yvb7w+dK9kqAAlFpu+ruzdDSJIa0/kFbMe8CWjjyzsTjhRcjxKpBcyRvUtfO1GHBrH5kQUfYcXRWISkxm+4xnBogO5bkk0gciecOavtYGL1ITlc5WjpNOUnUT96CJkSKHSBLCPWu4AG0wwpJQAN2RGFHlnykngZPWV0q0WU8WJMb9qxzlm9RMzgjAZAAKjSw0k8L2l9cliluBaX+4yUaQ5Q8V3zQeMHvGM9XaFAf15ml73iWPij26gNc47oGfeEFHDC7786AbGIywD46Yslnke40lL1yWCd2zhULurV1TFKnFHYiyh9HEnEDgNMUrhpV2De7Hyt9vxFsQzC+ypmM8eMJDN74N0bcnMzdGOyYki/cTubG3XHPLokp991OdJxoqGJ8xSVIR+kFQavuT4J8k9jaUsIyzucUmn8Agf/lKQA3fkBb/bqgArHvd3ZABNRaLrbhvl4ZhCRYJwHXPhSFho1SN1FzZV4gNlG9WXBwiAkyEa+Lr1i5iLwBWLQIiQJeAvgANfmE8/wB+AxBowX8ihpyoykOrRO8MzA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUlCS2ptOWxPa0VrbnVIMEQ5M0lUUGNsRk9xM0p4K1NiTGZsSGxHVGZvbXlZ?=
 =?utf-8?B?VVg1ZERVdHZYbEVNRG1LWGR2eDRaa1pGdFBiOEpDeHhSZHZrRDJmam1Xc1gx?=
 =?utf-8?B?dFVTbHlpdlpudEp4dGxuZkRTNUhHdUJwYUJQeG9Kc2VFeWdSTTJ1clJrVmRU?=
 =?utf-8?B?NDdpUkw3cGY3cFRVZm9TZzloeURxSU4zVSs1VEQvbkkrMUhJdURUWlMzdjVE?=
 =?utf-8?B?UFI3RnRtd1lJeWVYSDJYanZXNE5XWHBNbzZYVUVmTWFKYWdYZE9YZllmb0Ns?=
 =?utf-8?B?NUNQVjZqVzJuRzFpTW40SHNyRG5KRHlERHZtakJoT1FwVkZmVUdybTlrc1ZE?=
 =?utf-8?B?ay9YeE03N095NzlaUlJaamtjeTVoWWpCYkd0UWpYTGJZYkFYRUdsUS9sYWxK?=
 =?utf-8?B?aVlsTW8wd0hIMTM0VzcvbGFPMUV1WDNnb1IzSUNxVFltOVp1R0lLY2tsOVJ4?=
 =?utf-8?B?UjhUVEVocVBGalNEYUQrNFJxTW1xNVpaUmpCREtndENXS28yR1RpeHV6TXJ4?=
 =?utf-8?B?NWthY0ExSUdhS0FlVi8zY2luY1A5SEZ6ZXNrekZjTGRIMWVqVndBZUJzd01K?=
 =?utf-8?B?dFNteDZqZGFJT0pRNjd1Q2dsNG5VbFFoYzdDUkVyWXYrS1NZcy93UXkxYkM0?=
 =?utf-8?B?YS9aOTFQTW9iM3V2UDJITDJXckp5c1FpN3VNNkoyaTdIMGRaNXFtaGtUTEt0?=
 =?utf-8?B?ZVIzYkl3ZnpVK3VyL0V1eDVDc2VZL1ZTUDZJTjNzV1p0RFE2VWVxTUZTSHJT?=
 =?utf-8?B?aUVmbksvbGc3dVUxN2RPcGZnaWcwcnJtWVlCMDduY2UrSGZsK0ptajRjb2Rw?=
 =?utf-8?B?amU1WDhlSGlEc1F0NXZHcWg1eHZmWENTMFppVzdlR1BYOFhFc2tuTFlNZm5L?=
 =?utf-8?B?TjFQVjdEeFhXVm5CdFc3NDlCd1JEVFVJWC9zdWpzVmdzelh6OFhUWHVWVUVI?=
 =?utf-8?B?d1JWUmRjcFhiWGtCdHpEbDVnbi91amFLNlpiUlJtQXBLUUkxSkJjM0YwZHFi?=
 =?utf-8?B?RXRWVmJGNjFxUDdRVXdSZFU4OTN4Ry83OERET1BsbG1LSGhGYUtRSU95U3hC?=
 =?utf-8?B?eEJIVGFCdldrU25EUHRwKzV6T20rUTlJUzcvZ0haN0RyVzNDL3NuUTRMVnZS?=
 =?utf-8?B?OWVVOTVHbTU4dXNSUmN6WExXT2w3d0JQQkdkMHJPVGUvNFU1Q2U3R0tUWkQ3?=
 =?utf-8?B?bmM2VTlkb29mc3o5bDUzQlB4c3hCVVordnNKTEpLakVpenJHRXZRbzBydlpi?=
 =?utf-8?B?d1k2eVphR2lTeGt0cjBlUVM4T2t5SFo5RUx5MkYyZ1dIY2VrUVJ5dEdQa0Jm?=
 =?utf-8?B?RjQyQ01VTXowUUNvb3pLQkl1aktvV1lDeDNuSm5EQzVyd1hlMEoyckpVWFFr?=
 =?utf-8?B?YW54SXVkVDBRMG41anhGc2VSc0tHbXcramZtbnFqU1hiZVVCbXRPT2E2dDRN?=
 =?utf-8?B?QTZCbHUwUXBKbXdxR0cwdEtvamwxbjYrbGhyUUJDZ29ZK016REw1c1RNSUxC?=
 =?utf-8?B?QjU0TTUyNEhGekFBZzhSdk93RGVlRGJNaUhJSFdjaHorVFdFK055cEdMSVFU?=
 =?utf-8?B?eWNTY0R4S0VldXRROWluZ015dHZzMldrWWV4Z2xpVDRwcHNaTlJPSlo5eThx?=
 =?utf-8?B?b282aVBMSUh0Z1ZPWkd5OTkwWXFzTU40MlZVVTBWdjA4VitNWG9vN2Rkd1JC?=
 =?utf-8?B?NExzT1lFSUZ5K20vdk5SMU5PZUQ1dWdoS1RubVJCeDlGS1lRWFlncHJlSld3?=
 =?utf-8?B?YlpCT0N5Y29BWFM1SlhmUU90YkE2d1R1SWV5L3BuVlUvN3NmUVFxRkh5MkFv?=
 =?utf-8?B?Mnkzc2R5alN2b04rVVRPRmQ2SVVVampLT21CR29iKzZGMEhjZzU2K1hkUjMx?=
 =?utf-8?B?aEdJaW4zVHhKNjhOOHYxVHFic3dBby9EY1JNWFhLR2g0d2hXaU8vZTdldVh0?=
 =?utf-8?B?dmJmTWtvVlpWSVhJV1A2M1NwNHlHVGNSdm0zYUpidlIzS0FYS3hhUXdiYkFz?=
 =?utf-8?B?a3dkb2FTc0RCUmFlMkZOWmFDNDFVcTRTOGVEY2N6Rit0VlA4SXRKRDVnZXVq?=
 =?utf-8?B?Q0dnc1BnOXo4R2FCT05UNzNoVFFKeDFKRnRWMGV1bCsvWU1zRU1LS1RselVR?=
 =?utf-8?B?cmYycVRubWdQTm5CekVCTmZBbnBqOFRyaGFQSDhUK1FNbGV0WE5EUFJlREtF?=
 =?utf-8?B?bC8zaGl0M1krL0pmQThsbXpUQlhZZTdvc05OdjJvenExYWY5K2Nqc2s5RTh6?=
 =?utf-8?B?Z0JHS0pmcVdmdW1XWEVEQnZRTXM2cWl2dHhoWWdsMjUvN1ZZU0xreGR1MlZ6?=
 =?utf-8?B?T2o2OVBXYWhiSEFkSmYvK1BtUURLZU9JR1lMc2E5T21zQktmMW5pdz09?=
X-Exchange-RoutingPolicyChecked: GVOpRfguzz0Svj6orBoGq/tQjbBfIM7UsGTkAgSdRDHsEoQffr6G9HXCwe123U85TB6uDxcgPA4iUAAZLrYEfoCxm9ol4PM7hqtOCkUVAEdL52RQVjs5jHtnJRDESzAaQqWARg4F/Q9sZh9v3UB4LDVTcr/D9vuH2OEUDwNW0VoWpg7YXbG/CHIkI+ngA8q2YVd4zt+6r+gjLlUy/M/FdjyBguaXbidreidUFQLC+2o7YSzaHHQvNeufu0HA3mEtc69sEMWz8jg5V1H8IAvlADpOfOfE7kQNcek5bV2wavoJZRsN2UerKRsep6NIA+lae1aSo2gYHiUnC2YhgU2ucw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 15040fcb-28e9-4bd4-6d63-08dea6233961
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 19:12:15.3793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: URai/PV37IwKOldUputfA0yZIPEDicxjVnpClAmSGDiDXsI+/NosuomRo4pqzRmbShbB5tPjRs+N732MUx4IWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7146
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

Hi,

On 21-04-2026 10:53 pm, Michal Wajdeczko wrote:
> + Matt
>
> On 4/21/2026 5:44 PM, Anirban, Sk wrote:
>> Hi,
>>
>> On 21-04-2026 01:21 am, Summers, Stuart wrote:
>>> On Mon, 2026-04-20 at 16:59 +0530, Sk Anirban wrote:
>>>> When the device is wedged, GuC CT sends return -ECANCELED. This is
> not 100% true
>
> GuC CT returns -ECANCELED when CT is stopped
> GUC CT is stopped also during GT reset
> When device is wedged, CT is stopped
>
>>>> expected behavior, not an actionable error. Avoid logging these as
>>>> errors in the engine activity and power profile code paths.
>>>>
>>>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_guc_engine_activity.c | 8 +++++---
>>>>    drivers/gpu/drm/xe/xe_guc_engine_activity.h | 2 +-
>>>>    drivers/gpu/drm/xe/xe_guc_pc.c              | 4 ++--
>>>>    drivers/gpu/drm/xe/xe_uc.c                  | 5 ++++-
>>>>    4 files changed, 12 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>>>> b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>>>> index 2b99c1ebdd58..700f3464fb63 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>>>> @@ -464,18 +464,20 @@ int
>>>> xe_guc_engine_activity_function_stats(struct xe_guc *guc, int
>>>> num_vfs, bool
>>>>     *
>>>>     * Enable engine activity stats and set initial timestamps
>>>>     */
>>>> -void xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
>>>> +int xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
>>>>    {
>>>>           int ret;
>>>>             if (!xe_guc_engine_activity_supported(guc))
>>>> -               return;
>>>> +               return 0;
>>>>             ret = enable_engine_activity_stats(guc);
>>>> -       if (ret)
>>>> +       if (ret && !(xe_device_wedged(guc_to_xe(guc)) && ret == -
>>>> ECANCELED))
>>> Is there a reason we don't handle all of the cases described in
>>> __guc_ct_send_locked()? It looks like before we do the ct->state ==
>>> STOPPED check (which is where we'd return -ECANCELED), we also check if
>>> the CT is broken (i.e. we got some bad return value from GuC and marked
>>> CT as "dead", hence returning -EPIPE here) or disabled (and return -
>>> ENODEV).
>>>
>>> Same question for the other cases you have below.
>>>
>>> Thanks,
>>> Stuart
>> -ECANCELED is the specific error returned when the CT is stopped & device is wedged.
> to be clear: -ECANCELED was introduced only to indicate that H2Gs
> are lost due to CT being stopped, usually as part of the GT reset
> see dc75d03716fe and 94de94d24ea8
>
> and it doesn't mean that device was wedged - hence extra checks...
>
>> Other errors may indicate different fault conditions and imo should be useful to log those.
>> This follows the same pattern as pc_action_reset.
> but that pattern doesn't look great either
>
> maybe we should add that wedged check at the CT layer and then use
> different error code, like -ENOTRECOVERABLE, to avoid duplicating
> the same condition by the all callers?
>
> OTOH, if we expect that there is no point in reporting errors
> after we declare WEDGED state, maybe the same rule should apply
> to the errors after GT reset? so we can just look for -ECANCELED?
>
> btw, IMO we should rather focus on avoiding going to wedged state
> than trying to silence any follow-up error messages (that to some
> extend proves that driver either correctly noticed the fault or
> that we missed to perform some explicit cleanups and driver still
> continues to do something that shouldn't be doing after wedged)
I think this is not possible as csc-error will cause wedged state & we have

multiple IGT tests to verify this flow.

Introducing a new error code at the CT level sounds like a good 
approach—I’ll submit an RFC patch for it.


Thanks,

Anirban


>
>> Thanks,
>>
>> Anirban
>>
>>>>                   xe_gt_err(guc_to_gt(guc), "failed to enable activity
>>>> stats%d\n", ret);
>>>>           else
>>>>                   engine_activity_set_cpu_ts(guc, 0);
>>>> +
>>>> +       return ret;
>>>>    }
>>>>      static void engine_activity_fini(void *arg)
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>>>> b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>>>> index b32926c2d208..188f325a462d 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>>>> @@ -13,7 +13,7 @@ struct xe_guc;
>>>>      int xe_guc_engine_activity_init(struct xe_guc *guc);
>>>>    bool xe_guc_engine_activity_supported(struct xe_guc *guc);
>>>> -void xe_guc_engine_activity_enable_stats(struct xe_guc *guc);
>>>> +int xe_guc_engine_activity_enable_stats(struct xe_guc *guc);
>>>>    int xe_guc_engine_activity_function_stats(struct xe_guc *guc, int
>>>> num_vfs, bool enable);
>>>>    u64 xe_guc_engine_activity_active_ticks(struct xe_guc *guc, struct
>>>> xe_hw_engine *hwe,
>>>>                                           unsigned int fn_id);
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
>>>> b/drivers/gpu/drm/xe/xe_guc_pc.c
>>>> index 7ecd91ad6192..efcd432ef6ef 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>>>> @@ -1202,7 +1202,7 @@ int xe_guc_pc_set_power_profile(struct
>>>> xe_guc_pc *pc, const char *buf)
>>>>           ret = pc_action_set_param(pc,
>>>>                                     SLPC_PARAM_POWER_PROFILE,
>>>>                                     val);
>>>> -       if (ret)
>>>> +       if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -
>>>> ECANCELED))
>>>>                   xe_gt_err_once(pc_to_gt(pc), "Failed to set power
>>>> profile to %d: %pe\n",
>>>>                                  val, ERR_PTR(ret));
>>>>           else
>>>> @@ -1306,7 +1306,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>>>             /* Set cached value of power_profile */
>>>>           ret = xe_guc_pc_set_power_profile(pc,
>>>> power_profile_to_string(pc));
>>>> -       if (unlikely(ret))
>>>> +       if (ret && !(xe_device_wedged(xe) && ret == -ECANCELED))
>>>>                   xe_gt_err(gt, "Failed to set SLPC power profile:
>>>> %pe\n", ERR_PTR(ret));
>>>>             return ret;
>>>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>>>> index 75091bde0d50..b440cf8c431d 100644
>>>> --- a/drivers/gpu/drm/xe/xe_uc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>>>> @@ -215,7 +215,10 @@ int xe_uc_load_hw(struct xe_uc *uc)
>>>>           if (ret)
>>>>                   return ret;
>>>>    -       xe_guc_engine_activity_enable_stats(&uc->guc);
>>>> +       ret = xe_guc_engine_activity_enable_stats(&uc->guc);
>>>> +
>>>> +       if (xe_device_wedged(guc_to_xe(&uc->guc)) && ret == -
>>>> ECANCELED)
>>>> +               return ret;
>>>>             /* We don't fail the driver load if HuC fails to auth */
>>>>           ret = xe_huc_auth(&uc->huc, XE_HUC_AUTH_VIA_GUC);
