Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4FC2C61DE2
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 09:31:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54DC610E28E;
	Mon, 31 Aug 2026 09:31:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UVbtNsHp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A5210E281
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 09:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788168692; x=1819704692;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=e/KrED2b7IRuOwcr1KuKp509u2rr4TjQI7HEXVlOack=;
 b=UVbtNsHpRzyQOPxUDlj77e3MHmv6qXmkqWGKqMliuvNl8/GU5/bkpY5h
 0h159n5dPhr1O1yg1mzA5twE+CsSn8XTje1IcIERD9vYHu4vYEmxWWUTZ
 R2EAIygb6Q7um4vHWcwi1oVduyfYqDMy8t82MukD8qkGMmZZmTi/OsoiG
 oq3RoJ5wdzYUKWXQJafci7uGaaLgevksYGfG4wNfpNxrR0REK6xwKoZZE
 yQYSyOm7CzNF+ZWGmY1Fff93RfZi0uG/CKMv+UBmZtNGW3ogwfNtwX2IY
 SZP3+rSHUjDC1qE6vkQ7xsrmuvJtoK1zRUTWKBfuicY/Km57njKszTuyz w==;
X-CSE-ConnectionGUID: NwBft+xDS1WA2uB+8hOFWQ==
X-CSE-MsgGUID: qj051DSlQpmwoqeoWhVtzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92258006"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="92258006"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 02:31:32 -0700
X-CSE-ConnectionGUID: s/X6CUxdQ8G5qWYSEMnNkQ==
X-CSE-MsgGUID: uZgr3PlOTICKIW2JufNfjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="298661308"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 02:31:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 02:31:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 02:31:31 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.12) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 02:31:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b2U0EniI+W8S3zzdRmPPAN5wCFQNtsAgIF1a+2sOmIgnmA3BC+CDAXPHVQrmteMPdVqzFSgEJsbjeqtpy3OhCtFlGp0ZfNHGCRsguLmZPgN/fiDC96c7XWiMo5j3s0aHbkg6w7w34LYsccQUohknfGTeZ4yRzWhniMnl+BX16FpnRDeeqLLNlro6vHCmni3KuyS67nDEr5eyExl3F2wzSRVDmKYmkuyqOqk5GlFbbeozNLT9rJzPhX9bZgBm8cZ+C7UhVa0CiTQ+JmLbKqqBi6xdO28FfViSbQWyJm/Ypt2N7CsC+Da6QoOT6UFQ6Hrkw204PkuvYtqYQrQKl7FhWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vKp+tTzIAaFrhrFKiMToXYJpka8xPWCOeNlj42EgjRw=;
 b=Y0M0Rpkb9IrF+6YVvcbF318BR2tzk5FIs+dyLLTGL4WCo5IIQvfnyMS6YQSXyQaVWvgAh+6FFUjyTt/eafs2LL0Sbai3qUdLcMrEKWJTDPCmck/N7aCb3RW9C6pQHelgXL60De2Ixg7M/u83eGuja9SDqevsMgrBHjuxXTX1l1eEf+vawFC1sVQtW+swSZ4DGx1GwImqwiFzw4qQDzAI+CrjVn9iiXeWd06w1x7uYY1gDroaPbK9+UTClLQUcfK1NesDJEFq6JIdQaerb0/Zbt++HltbZneib8VFqa5YFWnbgtownxY5UwQl+AasucZQm4bet7+7ss2qWayyDwaLVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH3PPF4E874A00C.namprd11.prod.outlook.com (2603:10b6:518:1::d1e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 09:31:28 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 09:31:28 +0000
Message-ID: <93b12e0e-4995-40cc-b00e-06af5d0345b3@intel.com>
Date: Mon, 31 Aug 2026 11:31:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] drm/xe/guc: Report reset failure using SIGID
To: Arvind Yadav <arvind.yadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <badal.nilawar@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <dnyaneshwar.bhadane@intel.com>,
 <mallesh.koujalagi@intel.com>, <matthew.brost@intel.com>
References: <20260831080507.2364687-1-arvind.yadav@intel.com>
 <20260831080507.2364687-3-arvind.yadav@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260831080507.2364687-3-arvind.yadav@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0042.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::14) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH3PPF4E874A00C:EE_
X-MS-Office365-Filtering-Correlation-Id: cf4b7af0-5279-4a84-3c0d-08df0742a220
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: +Yz2Lm//d+af/KsPoMbbjGDnvqTD1CNyOvh+agtggu9BoObCSaeeShaGSE2mLGr3bDsUb4DNLwdzj4b92TeRiOBHbH1+at4nL9y9EgQocUuWPT1q4s5fO7i80xi7FV3iIoLpAiPF2mSSLnltg0Jw1V2bgg9SIdAqxR0N9R0XGH9Tzh4wHzD6o67cqql6ubTAzo6VU6S7lKUbugd8z4jE8J7Sj4FHpOlx6d3zDk+B13LCUZ3aet2D1W9tnBBaLAeU6zu26pDichemkqK4fpK/OuZZtpgLfnMJWmJCGPnBVeYBXEPPbXM/n6O3hfADPZHP8U2WTEa47y7vGLS9uKkhDq80E7NvBE847a1DRDOC42m8XsLYG9FEzwkF42bhN3RTHEjGCZnlP3/KOTqT2a76X6+2hxX3ywwIlRvmdh2n9tQTNfSOMfGpTvArwMT9dXextoSa5kDyUC4qD60m6DGMgT/WP6BSNRB/sTYFCHR8rFIGWUQKLcv5Tu/lczo787KOrT2hA10ey08Mbzy6/BEHn35XX0rUQClOJm+iaKd7eiIKeLkFfQxwne8xuVbHrPaiwFn2aWQ82G2d1zDNr4ddNZW1KHl8GpD3mCnjoHRaikGX5wI3ulztEPrQI4MhuzoRpxHQAMbZFl2ryV+TH9UuqERR48xPZkruvkL4TdPZ0dA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUFucC9kamxJbjVIM0VhYXFCL1BNQTQ2K2ZzbU9ZdUk0UDBXSGlrQUR3VmhF?=
 =?utf-8?B?TEdYNko2TnNoRi9uK1JGYjdPcklFK0gxNTJoUVltUWFDSEJrdUwxYUY2Y0tV?=
 =?utf-8?B?TjUvbVhKcHRmTTQxQ0R1ZEpNTkRBbWJiTitrTnZ3eTFZNTJ1ZERObENOTUFK?=
 =?utf-8?B?ZGIwL1VNRmkxRDBwQ1RXZ2g5LzI1UVdxelpDSzlER3J2NkFzZ0tTWDZNQXgw?=
 =?utf-8?B?Zi9YcVhUcUluU2RLZFB5WXU2VmV4VWo5T3YvZTljM3JoaldIdWFkcXB2ZHVu?=
 =?utf-8?B?SmdpUGY4WU5HSXBHSjlmeW5kQ3d1YXMyZFo1amxtWUNFOFE2NVBmUzNFK1c5?=
 =?utf-8?B?M1pMNVBES1gxZ0JTMVFmdXBBY1JmOWllQVU1VzVqSVh3S1hqZ2M5Q0hra0d2?=
 =?utf-8?B?bXFZbmU3aDU4SDJyakJRR2cxeUhVMlVNNktOVG9oWHRBTVJGMjRYMGtUb01j?=
 =?utf-8?B?d2xia1RzM3FwTlp2Y2FKeG5wZGdHTTBTQUJISCtGWkxZellEY3NZVmhEZU5T?=
 =?utf-8?B?aUNKNWlKdnEwRWNNdEZDWVF6Z2lCUnpET0x6NGhVYjlzM3UvMG80QUxYbC93?=
 =?utf-8?B?TzZOTWxPekt0Ynk1dlFIemFxcit4OVFQVENUVS80c2U0bWxTM0tGZ0I2aDI4?=
 =?utf-8?B?dzYzTysrUEE0TlNLSTNHZXIxMlBaVm41UlNaV1JpNnB2KzBjNGZPL3M3bys3?=
 =?utf-8?B?OWNabldHeXhkb1Y3WXJUZTREdXRJN3k4MWhPSi84M3hIM2Q1aUtUanhMTlU0?=
 =?utf-8?B?aStkNnZNbnNNRWo3TVJ4YnpIc0tMcHAzbFNYSWtqLzlyNWZtKzhobHZMYWZo?=
 =?utf-8?B?bDhZS1k3TlZ0SnByNkpNTVBpV3FLZ250TWsvcmxua1JFVkFEa0VJeE51Nko4?=
 =?utf-8?B?eUdhRVRhQ3NnS2VkSFk5T01EWGkvdGhlYitQclI4bXV3Rkg0ekxiZkhGTXRO?=
 =?utf-8?B?elo0UFB6MjM3VTNKUmpyMitKeGQySE1wMGNuNXFzKzd0bkJ2c0h2MllITUlQ?=
 =?utf-8?B?aWx4M3RkcWY4RmRvRzFCTWIvOU5sSDdvL09jd3NlUWVyQ2pUcEkxbmZmeVpa?=
 =?utf-8?B?NC9oZFl1VUhOd3VkUHVwdlpVMnJMYkRDM0R4c0R0U1VyMnBrNSthS3RMSFB2?=
 =?utf-8?B?MWlTQldQMkhsWk5qTi8wTFZJZ2lYb3FMSDQrODhCVERoaWI0Q2lSR3FCbFJi?=
 =?utf-8?B?VGpya3BIMlorNzh5RnkvVUIxRExuTm1HcWtld0JtL3B0TTJ4bEhRdTlIcGVr?=
 =?utf-8?B?OXU3S0tCTnRaS202dmt4d01tdndod0Jna3VlNU5YRmk0VURmOFptZkZ5Ujlk?=
 =?utf-8?B?bW1tL05UOXg1RVBvWm8wNThFc043cGplT1Q2V2ZZNjZsMnY5TC82Zk9UK3do?=
 =?utf-8?B?SjNBaDlyZW16aXZqUXNRYzc2eVFqMFhHZzV3ZGJLOUZvRCtZd3c0bkdNdkc4?=
 =?utf-8?B?bjc2VGh5ei9ySGRPeDU2NUZ4V01ENjAyMUh5QnlhMVR5UWkxQ1VUUTlBQ2V5?=
 =?utf-8?B?Y1IwV0VNL0cvYU5yN0wzRVFlamhJVnR6aGwwNXo5UHNpZXQwcWl3bWtnWXlI?=
 =?utf-8?B?eXE2VXVGWlRhM1F3N3VyclFKOE11bEtDeTR5Q3BWTDBMV2o1UnNQMnF5QkEv?=
 =?utf-8?B?WUp6RnFETG5VTDlzVE40SFM2c1FnZFlRUXpLM05VdTBhVTRHZUpxZlZtMElY?=
 =?utf-8?B?a1Jrb2dYYTNYamdzZ0YzY093NHE3RUFMVGZ5N0ZlTVFoQ0ZBWTVTS1pwTGRH?=
 =?utf-8?B?Z2EzYlBWZUdBMkxpdUsyM0NTNE1iVHVPeC9uNEdrT0VXSGpSYmN4Q045ZVhi?=
 =?utf-8?B?RFk4NGNVVy83RXYyR0EzZ0QrTWxPMUMxQ200Uk9pY0pDQ0puTjFrT1BXZjlS?=
 =?utf-8?B?dkIraDc1U2EvZEJCM1oxbXVUVnN5eXlaR1c5Nk9zNVZPMDFOanNNY2hBYmFL?=
 =?utf-8?B?NjdaaktMMWV6S2ErSUV0ZHBNd0xwTkVNdFA5c0orOHdwRGg3Tnl2RjY2MktH?=
 =?utf-8?B?Nk5INFJQMWpuZ3QwbllSN0RUMThWZCtTVWloYUxTb0F2Y2JidDNRaU5yOGl4?=
 =?utf-8?B?YXBuRldiWVZIVmVqZXVCcXIxK0wrVVh5ejNaUWJwZGdWQllKNWRBOFlHNGxK?=
 =?utf-8?B?WUJoSi83NlVUNm8rWlFveU00SUIwVi8yQXVVNmN1VEpDS1hyVDJDYTMvS3RS?=
 =?utf-8?B?RFJNQ3RJQW56SllRanlSbk96SjhJUkdLMFdDZEVDeW5HUjMvM2x0WU5pWHNq?=
 =?utf-8?B?L1JGQ0JLVVRiZGxZQ2F4VmZiV3BMd2JBbCtRalYwcTV5cTZ5UjZscmF5aDdi?=
 =?utf-8?B?cU5tekx0VXVZWWMyRFI1T3ZpbHcrLzRRS0RNbWN5OHlNaVZ2d25UTGQ5ZTc1?=
 =?utf-8?Q?vZq1ps0f7nSsJodY=3D?=
X-Exchange-RoutingPolicyChecked: wjg/G8BZMhkc2F0Yjc3YtPt+EXR+BzPvv+Bpb5BbCcYwR/bW0KLSDPQQL8RhQ4NPRWTqwx1Hldu8hHIT16jHSGO+t3w6dqn7cYHDE1Ts/L6J+YhtIEVP5Q8rDyAc9rl1oT26tUAmPG7137k8AMTZ3G4OXnHy6Fj/z9Q2sJ8wrihwXWERShJH92UOfyz1yhHmFSH8NOHopwVnsyiIYMPeF019YmaJX0e29Q8+bjbxb62ciwJk/o/OBaHCaSjPbnmp/vVcwCUAaS4H2xqDAcfHTA8oxdS/CI8qYGLOJhpfsCDijQbrU2B78x26Ssoo7/NI4JKC6RNm+d4l0cI/AlISag==
X-MS-Exchange-CrossTenant-Network-Message-Id: cf4b7af0-5279-4a84-3c0d-08df0742a220
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 09:31:28.0182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zZNtHxlZDk5Sxi1DuIaZ62ee+uV4kc+3dc4dn0nvEYV05VQK9D3mPfg0ROU67YKsSkTX9CVMXzqdn2FzAP0s0xZPKJReANh+IQy4H2btG+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF4E874A00C
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



On 8/31/2026 10:05 AM, Arvind Yadav wrote:
> Route the GuC submit engine reset failure through the structured SIGID
> logging helper.
> 
> Use the GUCSUBMIT component, which maps to XE_SIGID_GT_TDR, and pass -EIO
> as the errno value.
> 
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
> v5:
>  - Added GUCSUBMIT component and mapped it to XE_SIGID_GT_TDR.
>    (Michal)
>  - Used GUCSUBMIT instead of GT for the GuC submit reset failure.
>    (Michal)
>  - Dropped "request" from the reset failure message.
>    (Michal)
> 
> v4:
>  - Clarified that the GT component maps to XE_SIGID_GT_TDR and -EIO is
>    only the errno value. (Sashiko)
> 
> v3:
>  - Split the GuC reset-request failure conversion into a separate patch.
>    (Michal)
>  - Dropped GuC job-timeout warning conversions to avoid changing warn-level
>    logs into error-level SIGID reports. (Michal)
>  - Kept only the existing error path that maps naturally to GT_TDR. (Michal)
> 
> v2:
>  - Rebased on the latest structured SIGID logging series.
>  - Switched from the old xe_ras_log_() helpers to the new xe_log_()
>    helpers.
>  - Dropped paths already covered by the base SIGID series.
> 
>  drivers/gpu/drm/xe/xe_guc_submit.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 99d8c807ff05..543cf7baae96 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -34,6 +34,7 @@
>  #include "xe_guc_klv_helpers.h"
>  #include "xe_guc_submit_types.h"
>  #include "xe_hw_engine.h"
> +#include "xe_log.h"
>  #include "xe_lrc.h"
>  #include "xe_macros.h"
>  #include "xe_map.h"
> @@ -3494,8 +3495,9 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
>  	reason = msg[2];
>  
>  	/* Unexpected failure of a hardware feature, log an actual error */
> -	xe_gt_err(gt, "GuC engine reset request failed on %d:%d because 0x%08X",
> -		  guc_class, instance, reason);
> +	xe_log_err(gt, GUCSUBMIT, -EIO,

shouldn't we try to use different errno based on the 'reason' code?
AFAICT there are just few reasons that GuC will use here

> +		   "engine reset failed on %d:%d because 0x%08X\n",
> +		   guc_class, instance, reason);

nit: as both guc_class and instance are u8, we should print them as:

		%u:%u

nit: the reason could be printed with just:

		%#x

>  
>  	xe_gt_reset_async(gt);
>  
