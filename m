Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6532DCAC5BB
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 18:28:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A91110EACF;
	Fri, 26 Sep 2025 18:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dbnbcZW0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6061B10EACF
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 18:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758911334; x=1790447334;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7w/fIqxqDVMHoFTnVw8BIkhZyUdpt/jAdPMPVyxGOxA=;
 b=dbnbcZW0+IsX80vx9Oxx4rlK6m/pX0F8xVrCVj5/d0+g2ihvqegA+CVB
 vveU5knE+ISNXsutFOj1SvMCDSud8t7cclH/n0UoFRzArVxJ6s2KEYZGj
 i1hsLCTG7Ag5KUPoDCej+4kLxUvrLuC37xXLFbfLzzJZKJbQODGncobOF
 fEk2gu0riCt2Hg5V8faHZ0UYr6o9MJhBTaa1SQ8bMuZmZY4aEMYkzY+QB
 28PKUw3KfTZarp9rznbJQ3N9V2FAVE5IRvhFgu0JmE8e2ZQ+/9ZOKbCdC
 tU+Om620Hr8bUl0biaTg53Nw26Pz/7ZMqHJLnXH7qMCG/38oKniMrFqig g==;
X-CSE-ConnectionGUID: VHV+tN++SUWqOkoVzlIXOw==
X-CSE-MsgGUID: EicNQB4CRT2sClNU6dFbXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="72346354"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="72346354"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 11:28:53 -0700
X-CSE-ConnectionGUID: n62BBGWPTpmt/MJ2XGJnJA==
X-CSE-MsgGUID: iwDYStBYTlq6LCMzEANx3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="177732929"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 11:28:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 11:28:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 11:28:52 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.67)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 11:28:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eJyb+S3Z3ETwSG7grRpFI6KZThzDy/q3TL1xIDpLB9kePoB44ntMXFIPO39x1GQP5SW8Y1LpRsgxbwDpYhIzWUcCzdlchaLfdj/fyy4SjaDBXZjwrvwNy5mjooIdgQjXOEe2S/Vu0vfoht95e39Py4bWyeIa2fa8eIDcn8WJVA4hp3cYgz7r+SBR0d/kIDS3MdHuwDMFa5D8MduIKS6wemhx53VGlDgGA4/G2nOFRyEIE62EZvasYgeWtzqGA6+1PnMKojRoD7H8n3b2iUWWuzXhW/NpceMY+AddHOmgTygNkbhncktLjVjkzzBbB4rnF8Po9VvoVHfOecqYYlzffA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+XwJh8sKCawruhFDyH7mI5+zYC4L+howP4U5jUemDGY=;
 b=XBnlMCaM3WxyHg7hW7ZhqY2EJCaVECx8E40dc0GV3aUrLvDNZRI2OuPemGY+BU9V+mTLMBi0T155sXcue/gf5RMwIaBE9EW2tzgGsLrwznO/KlV/n0kMFN/Btt+wFs7qNlJxG5aHvkcDjqZdkUAOJMFl9C4GhiyG5gTCWorqiGk8SAob0c5Z4Wb+r8TIxyqGgXlfj1hWfdLbanCToEDMumo75+VCRGuY/IVOiRCDHmFWr9d3BvRO8dOtMUn0BUpE2n0ZrvkXaI+dE/1TsYGrKvibkVwJGO2+67H52e6hW7BRLmj2oWbWWAgXKStLbWylvX32doO7ow5qBvkCev1Rqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM4PR11MB7352.namprd11.prod.outlook.com (2603:10b6:8:103::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.23; Fri, 26 Sep
 2025 18:28:43 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9160.010; Fri, 26 Sep 2025
 18:28:42 +0000
Message-ID: <b2975af6-94fd-4b68-883d-94edecd2c4d3@intel.com>
Date: Fri, 26 Sep 2025 20:28:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/xe: Don't call xe_device_get_gt twice in
 xe_hw_engine_lookup
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>
References: <20250926155948.145934-7-jonathan.cavitt@intel.com>
 <20250926155948.145934-10-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250926155948.145934-10-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR03CA0052.eurprd03.prod.outlook.com
 (2603:10a6:803:50::23) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM4PR11MB7352:EE_
X-MS-Office365-Filtering-Correlation-Id: b0e70a48-732b-4c2b-54fb-08ddfd2a851c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmtpUFJHcEJSaGhxOEdtWVRCRklDcjR0bld0U25ZSlVjczhFSW1jelV5VzRu?=
 =?utf-8?B?VGNqTFZzdTdudytuUXlXQmZLd3BmREVYN3BIQS9aVndEMExkN0hGcGczUE5r?=
 =?utf-8?B?M1FPUTJ2VnBPeEpxdFhoSXN0SjRxcmFsVEo5eVpzZlhEaXIwWUJpb2pyeXZo?=
 =?utf-8?B?NjNUeDh2MWRDOVpVaUtReGVxR0x1bjZRaWNPeVhwSXVxd0xxS3UvcmNVdEZy?=
 =?utf-8?B?Slp1eWZBODJNalNXd2VwUUxMR0lHZmtLSTZNYURxRXlrSHN1YkZ3aFVmWVcz?=
 =?utf-8?B?K2tSS1FuTG9vcDFSYVA1VklsWnVLMXNhYzFkNW9Lc2g5M094UHFvMFpLc2V3?=
 =?utf-8?B?dEFnL0c0N0RseVV2YnNGTzNPLzN4cEt1cURMc2Z4ZFVIbFFrV3hNZjk0TE1U?=
 =?utf-8?B?YWFoa2RMbVRDdktqMHBRK2N4MjVJbU00Vk1lcDNTOTYvOFQ3cjJtTzVvbzFB?=
 =?utf-8?B?OW1hSTZnQjlKQVBmTmVDWWkzaHBpdmE0cDhObTQwS1JoSzNJeW5wWmRYVzhP?=
 =?utf-8?B?Rm1oOHUyb2w2WmIvRlFuMVJzQk40QmltcWMyMkRUTnJOZ3phT05aRVc4Y04y?=
 =?utf-8?B?OWdOdjIxWXF5NTZlYzU2bm80a2VaSnFjQjNtS3NqRE52Z3BlbXpKTEpkUnNp?=
 =?utf-8?B?ZzRMSWU5N21YMzhvMlpoS1lqOU9mek1jZVk4L1lDQklhWWlqbzdmUjlWaDda?=
 =?utf-8?B?dHBkNmR4MndqTmgvVlEzdnRBVzBTMnNOL1I1VUVWcGZZMXdsb3E3N2kwTGVR?=
 =?utf-8?B?S2U2R1pNaVFrcVNucWplV1dhendsY2lSMFNKU1F4TTVNSFpDMnhhUWwzeUkw?=
 =?utf-8?B?c0Rwdk9nMExLUFp2Zm9vamN1T1EvNGU1Um9mWXA5Q0RzQXY1ZThZVFV6cWxI?=
 =?utf-8?B?K0dPL1AzbVArMndub2pOam91SWRXREJVOVJRL0o1VmJTSWdza1RZYzBBM20x?=
 =?utf-8?B?SVpmSGN4NkE2dlB6SXlWRjVDWWFLdFFmRmtLMm9zdTREUk9ieGJqT3NoVlE1?=
 =?utf-8?B?OU5SaFlCSy9wV1BFQWZRNjZxTW5ON3dtNWQyeGcvdnV5N2xzTUNBVVJwdEJj?=
 =?utf-8?B?L05tN0hWNnpYTnF1ckx2dmp1V2NyU3YzWGJsSm9Hc2hWSFB3QzQ5MCtXamF4?=
 =?utf-8?B?VFVGeklTTEFOaitPcGt1cG55cTB0dU1DUjJqTE1vRlVmVnRvNGVFbDhLT292?=
 =?utf-8?B?d0VzR0Jva0tIWWJjSU5Pa3Z2eGh1NFRQWnlhSk1JZjlJYWgvTUl0WE51NS9m?=
 =?utf-8?B?SkE5RDEwRVFyM1lYSS9yN3gxNzBQQjJseXB3L3pLSlhuRXM2Ump4THlJWFFm?=
 =?utf-8?B?VG5IdUVMZTNmSVV3UmFpc05VbUphRHRIcGFaQ2FaMnZrLzl4RTZ5K2VRY1Vz?=
 =?utf-8?B?YnIxTGhIQ3VZOWM0RW9nckdISjcweDd5SjFJaWFWdHRBL0NTQnVVMlkxdkN4?=
 =?utf-8?B?elExaUdEeG05dUdPSGZsdjgzbkoyL3FHeUdCT2daWXArWWwxYkVtRldNSERX?=
 =?utf-8?B?alVZcDF2bzdhbUtxTVFSZ29jLzV2T1BKLzlrSnpUQThPTmZycmlGZThtT1lL?=
 =?utf-8?B?YXdZbG9jMWtoNHJiNFZjZitCeHlBdjF2aE1haDdKclNWVnM1Vi9MRFg5OHlm?=
 =?utf-8?B?TUtYZzMrampyQWYvU2s3a2VpMVFicVJUU2JCUjdlVVdhRkExTU91Q1RiZk8y?=
 =?utf-8?B?VytJT3p1Z0dza1dUZ3p1c0Z2a3VkRVhncmZCNkx2TTVqenhuN2xkUTBOZFVU?=
 =?utf-8?B?VVZheEtHaFdqeDRwM1ZNMkZKRHhZdmtmcUozQTNXQWZPSE43TERmbkJEaHU3?=
 =?utf-8?B?K3ZINFdXQU9oR3VPdm9hL1hydGthcWJPdmVtSk1qdzk3MjJ5dmxSMTdWeW40?=
 =?utf-8?B?VldYVkFmbG42NXpCenAzY0pZb0psbmNVNGFyM2lCWU5rZFRRSXlXSFpZeDF6?=
 =?utf-8?Q?FTgV43KsZ5KpWeg/YN4BgL+lr6k38hmC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFI1SVM3N3g4WTE1QXRlSVNPcUwzSDVjZzM4VjVuOHhBUFBuWjRNeWRZRlZF?=
 =?utf-8?B?RGw0RUphUC9Lczg2TWxKTlkrTXlwTGloZ2tFcTlkZStueERjK0hiZC9XVFF6?=
 =?utf-8?B?MjFXd2hta0ZoN3hYdC9YeFlJS00ra3M1Vk4xazlVL2UxWWJVRFZSK1ByQlZi?=
 =?utf-8?B?T3pXU215aXdLOTlvUzYzRm9VRlhjcUF3NzFkalUrVXcwS1l4bzhHRm5XWGsw?=
 =?utf-8?B?R053UERScnd2Qyt1YjQ5TDBVZzlPYTBwVXM3Tzh2SEFUM2pQUU1ZTytvTFlX?=
 =?utf-8?B?eWtqK0xHNitzNVRhMWN1VnMvcy94Zjc2eTU5VmNQTi91blpUa2RqZXVjWk1w?=
 =?utf-8?B?TWNQWnRuanVFRnlPS09sQTFmdFlQbTQwT2ZVaDBObDFsZE9aN1ZxY3krbVQ0?=
 =?utf-8?B?TFBlWXFGRXdLSW1xZTM2RWNTSEpXYzRXK0lROXFhdTFnRTVsNmdqYXNESDRr?=
 =?utf-8?B?dHc5MU5ha0NrRFQ1d2lhVmRxT3lNbjNqZ093YmRGVk03YUttTzF6WERIUU1y?=
 =?utf-8?B?MUZvdEp6U2VFUEtpbHpVaWJlei9kNjhjZHUzQ1NWQlZVVFdQRG9XeUp6VXZS?=
 =?utf-8?B?bGZKNWY3ZUczSVB6b2tHbGtFY1BnTmN2M2FwenUrNXN5TXhDaVdTaHRmNUdE?=
 =?utf-8?B?ajh6TmlpMGJkNVlKb2Zja2lIOUFDaG9JVFkyeXorVEltd0o0U3JzWWJOM3dF?=
 =?utf-8?B?MnRDRHpOYUVoUFpac3ExT1o1Vmc1SWxpNWpySUtNaTBweDNZbmpRTU5JQ0VC?=
 =?utf-8?B?MVFwZFh0dXM1REgwUnJleVkzWDNFck5salcwWWdsT0FtT3c0OFRwSWF6Yjh2?=
 =?utf-8?B?NlRpU1d0WnIxUU5PNE5CRmZFeng1QUNtVVNyZXNqUzdKN3Rzd3kvejdRQUl0?=
 =?utf-8?B?TDc4UVlwOU1LOGpidzJxd3ZEUHpLRXZCdVhpNWxTRjN6MnZhYVpTZWpZWWZS?=
 =?utf-8?B?Q2lSMlpGR2pkRTZFR0xQYmZIMDBXRnp1LzVFejIwSG5EazhwcTQ4SE5oRmpI?=
 =?utf-8?B?NWtVdVJaRUZIdXF5ZTc4ajhVREtLTEdvdm1NU0VhdUtaZitGS0NUc0tucWc0?=
 =?utf-8?B?dzRpUWh6NTlrcUxOQXEvNUFiMGVNRGZpVDRidncrUkZvaTJNMjhyNmQzVEQ3?=
 =?utf-8?B?Wkp5UmlCcSthUHp3eVlKR3FrZ1R3ZVRWOEhHSFVpK0lBQjVjSUdzL0szU2pr?=
 =?utf-8?B?ZWFLbmc0V2RBMEM3K1F6aGZFRTkrVnM1TjZUbW40VEsrV1B3WW9hSzVxbmpl?=
 =?utf-8?B?L25zeWt4OGVjUGxRMzR6K25weVRuNmd2QmFXR3AyUHE4TERWQ25qUUZUVDVY?=
 =?utf-8?B?RXUrQ1NGNjhZOEJhMmhKWEdSaG1kNTJka1Z3ZkdQTThiUUV5dVNKdysrUHpW?=
 =?utf-8?B?eUZaZ2Zic2dLSyt0U2dvVmgzbCsvWDhacjUreDBqMHZnV2YwVm1pWDlIQzFp?=
 =?utf-8?B?SmFlcWlteDJsNmxpYmxkenpES3UvYVZTaDJ1TndONzRFZXptTU1VMDIrbkNV?=
 =?utf-8?B?Qi9ock1teXE3M1lwL1VxUzVjbVFjbDBuUG9Wc1pYWDJ6amFBZUV1eEVsQmIz?=
 =?utf-8?B?bXFkb0pYL1RvVFZ1ZW1KbURBcEYrdzR0UDFzSFV3NEc0NHdHemJoSGxmb1VQ?=
 =?utf-8?B?emMxeG1TNkxJS1BYVkM4L3dRKzFWTHpoc3UvTTcxMVZ0Ykcya0FWQ0lVb20z?=
 =?utf-8?B?TVBubUlkdWxOZVladDcwdkxGUWtmK0ZnVlFwMUhmL0VuNVd0bk5ObFpsaCtT?=
 =?utf-8?B?TFVCSVpwY2NmMllFVjV6bmsraGY3ak1VUUtHVnpFdnZIRldveDlBeCtOSytD?=
 =?utf-8?B?ek5PK2p2R0cwTTh6UWYxV0ZtRnV6UE9qLzhpWE5vU0ZYNmFJVWNzZnJHTG9C?=
 =?utf-8?B?akdNM1Yyb2xzRldJeHRMTHh3V1lyVlhTNjB1Y3JQckFQY0RWRE80a1JpTS85?=
 =?utf-8?B?b3dkNm9qSm1rN1F0MjRSYjBlQVFDUks0Q3lqM2Q5Q09vdjVHSjQyVHpKUlJ2?=
 =?utf-8?B?RUl2cFFmT0cvYXM0WDN3d2IwSVlYTkR5Y0RTUGU0V1BHTStmMUNwRmNlN2sx?=
 =?utf-8?B?Uzlzc3AvcktQSFpHTVdHbGM3bW5sN1ZId3dGcHdCa3VTSHdwc1laL1BTQitW?=
 =?utf-8?B?d044dWNFNnFNN3c2RmozZCtxT0xqNTN2ZHM1T1Nnc0dpbDY5RXk4VUE5QWx1?=
 =?utf-8?B?Qmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e70a48-732b-4c2b-54fb-08ddfd2a851c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 18:28:42.1742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ACZZ23QpWg3sGzUFgKoEFMhHs3Nk8LG/bZySNGly7ZlSG01ZtE0QKyPCO2hda4zkmOfOHXeY1Hfe31jJpzeVjppzWmDnYpOl6IT92Crb8Pg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7352
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



On 9/26/2025 5:59 PM, Jonathan Cavitt wrote:
> We already initialize a
> struct xe_gt *gt = xe_device_get_gt(xe, eci.gt_id)
> in xe_hw_engine_lookup to ensure the given gt_id is valid.
> We don't need to call xe_device_get_gt again to pass the same gt to
> xe_gt_hw_engine in xe_hw_engine_lookup.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 1cf623b4a5bc..f4b9857d6195 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -1071,7 +1071,6 @@ xe_hw_engine_lookup(struct xe_device *xe,
>  	idx = array_index_nospec(eci.engine_class,
>  				 ARRAY_SIZE(user_to_xe_engine_class));
>  
> -	return xe_gt_hw_engine(xe_device_get_gt(xe, eci.gt_id),
> -			       user_to_xe_engine_class[idx],
> +	return xe_gt_hw_engine(gt, user_to_xe_engine_class[idx],
>  			       eci.engine_instance, true);
>  }

