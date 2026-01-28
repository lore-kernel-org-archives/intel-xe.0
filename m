Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE58D46C01
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 23:43:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7824D10E0ED;
	Wed, 28 Jan 2026 23:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XAf97OtZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E599510E0ED
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 23:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769643787; x=1801179787;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9WzvroAMSrWJ42nnJa/fB1vybq9kSuQIpjLKLKZDUOI=;
 b=XAf97OtZfdmEvKaaqHknoMyT93ULzk+i262kJMMEWCMyV2FCupGeH2tS
 YR/XJQuG2jmrl82XsbwYThQisYAm37Wiy5/sYGc2QXGKhDfbnNBzm30SM
 fkx9/c7IFUTP8JABVQBCyIMWlIM80i/TStTPndRFnDu0W7KIY3DUdZMZS
 yf1LkSgCu7Oq+gNRLgvteAjqxXDowx1/MRyme76Ud7f6Xd3sMDsMoAk3j
 1/Frc2Z6Crazas+dbfsO4RTM4CqgiCggTXzR0Ny+Nolx880Msc7ZIRTRP
 FyhcIbg4+e8ARwYVKJhhCTL22P8E7F3L9y63t31X1xpZ2fveHnA8kGebM Q==;
X-CSE-ConnectionGUID: PPBrxdZDTe+OCluEwsLXBQ==
X-CSE-MsgGUID: QUiRCtcfTqWQv2EuN8yV9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70910455"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="70910455"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 15:43:06 -0800
X-CSE-ConnectionGUID: bYZGUqC1RNON3MVtamfsGA==
X-CSE-MsgGUID: De0CHzlxT8yjhcB3+0YlDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="208768059"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 15:43:06 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 15:43:05 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 15:43:05 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.36) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 15:43:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W6TMB3uyM0H1R/Pumi/MlmxxhquFnTLebHtRHnjDzXRWkiFjcMTMNYQc4VoKe/jfQEwPAnTr3EpaRJzjzuhr0fLsDjqzGqWHDRH6iVme8JMGbSfEY2pbbtNxaXdyy5wwV6IQzRi4Ysk7P0cF2hgXY0TlNaIeN1i7OjgEzxctudHR5wzhjc/JD+boi+W+cArRCwfaoIns9nYA6wln40+bQGVupTQS8MI9llNKo//NiHWdDSIWyIDvdvN+Ruq4SzHXlqFeOPa3irHolRskygmLIrWWeb524xi9qx3jITndL2hehwH9GsR5A1jv6W0LHNJd9yg28cN9ko0j50Remul0bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SGwy68WIPWp/rYEXb1Qu4Iyj2X8zou/srWrHQNyqrK8=;
 b=WoDqnWiwIVQMG3bZcWH8LMSjAgGDlgVXm66UIwdXV8dSCxit87rxew3sxdaKhu/TskRzeAYgI0r0pkHMVHEyFkDUiDE0MnPmOFE6yFKkAP1YtGAeMbMLThpOnCSuSOhKPr/ktSVmEv2jS+VNeKxTPuOx8HKRF1+kl3jHJ0D2Cbgk58+Jevi4Z0FB5RXz7vuj8+dQtJELXIoS/WMEY9ZTdm/Uno0XZFmA4WfwX6lriG3EOchV2S6rsj2y97vjJX/Xabi40oKmecovFkvrIxR0EgOC7WAgNZfQmzhkmBehBXTSAzzDOSNKNVQIF5imXdrsS57EUue9MkWjZTvaAmMAhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM4PR11MB5261.namprd11.prod.outlook.com (2603:10b6:5:388::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 23:43:03 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 23:43:03 +0000
Message-ID: <ec7f72fa-409b-466c-8cc9-65b50c46b1c3@intel.com>
Date: Thu, 29 Jan 2026 00:42:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] drm/xe/configfs: Add sriov.admin_only_pf attribute
To: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20260121214218.2817-1-michal.wajdeczko@intel.com>
 <20260121214218.2817-6-michal.wajdeczko@intel.com>
 <20260128163514.snhhdbgdwzchu3x4@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260128163514.snhhdbgdwzchu3x4@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::19) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM4PR11MB5261:EE_
X-MS-Office365-Filtering-Correlation-Id: 68f7b150-7312-4ea6-5e80-08de5ec6fa6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ulh4YkRFM3pMaEpBbElaSXYvRjNyOUxtcUlmbmhVclo0MmErUXNHYi9BczRD?=
 =?utf-8?B?TXFlNjA2aVpVekhOd0dwaU1zRmc4d3Q5WGE0VVpkL1c5NWRTK3Q2eGEwcHNI?=
 =?utf-8?B?UEpkMUpzajZZZW5wREx3Y25VYTJIeDNwTmdDQkd3dVZIOVFqZnJYMVBOREY0?=
 =?utf-8?B?SDM3ZmFkbHhvNFpaOVREYW9Yb0dFSmwwZmJvZlFqM1JMczZBdkRKT1lDeWZO?=
 =?utf-8?B?ZFlENEtad2M0SWh3NzQ3MjBiN0JyTDNwL3VhMTZYd21UeFZkY3NvKzlGTXg5?=
 =?utf-8?B?UnVyQXVKZjNnOHQvY2F0N00wUFNzMkJHM0tmaHJpOVdMQ2N0UDRWMDJxb29v?=
 =?utf-8?B?WkszeXFyZGhUbzEwcG1YcCtSWFlidVU4VlBzWGI0a2FWcEVqeS90ZXJORkU3?=
 =?utf-8?B?dHVNSGM5dGU5RXgwZ0ZJOHhCWWJsWHlVdTFIWFZMYTlqRDd3Wng3OWdvY2gw?=
 =?utf-8?B?eFpaQmVzZHFFYThjMlJma1Q3VCs0cGhmZ2g4dnhKYzg1cERpd1ArcTRnZis3?=
 =?utf-8?B?Z2FJNnZQenhsWVpHb3UzNnR5WkY2OVRnaS9mem5VQ2UrVTdHZHBqSWZHWlV6?=
 =?utf-8?B?eFlUcUMxam9MbHVISW9VRzJYSmRhZmM5WHdSZWlhcWFvT0dxV2NKYUZLUk9U?=
 =?utf-8?B?UGZvLzdmbDkyUUh2VFpjbnFFSnhTUzdkektSVGg2TjRFUHE2dkNicG55ZXRY?=
 =?utf-8?B?L3BXYlEzR2dqTjBCTWQxVnFCMlZlVGZYZFA4VFJXWmU0LzExUWRJdkZaWUhI?=
 =?utf-8?B?YXMxakdYMXM5MEg1eUl2ek4wai9UUy9kajUvNHBzNUhDdDgwOVF2ZENoWEhC?=
 =?utf-8?B?ZU02TFhjaDZiV2p0eGt1eHRUTEZwQXVqUGw2VWsyTmR3WmVjQU04bE1ZNCs5?=
 =?utf-8?B?VVp3YUpwV080VUJIc1JsU2xjS3AxMm81QUFyMGFHMVlzY0U2TndBWDlwNkpK?=
 =?utf-8?B?bWhUdVZFbjEzNGNWVlgyYTVtTzZWQlQ4a1Z1UzRINzl4UmwrT21nektxRi9m?=
 =?utf-8?B?QWMyU0JvRHY2Vy9FZng2dzZhK1RNM3VIME9ZeU13ZFlTcm9BTWxDK1lHZkVJ?=
 =?utf-8?B?L3VnV0psS3l4WDJ2MHNzYVRJRUpLSlZjcnI0RlFxRDNxUktESERRSjJMbEhS?=
 =?utf-8?B?MDF0eFpuSzREdXNZT1RRanNXcGY4Q0g1TzNQdGV6dFVyS3o5TDROcGNiZ0gr?=
 =?utf-8?B?dWFCbHU5RE9sTWtiVnpiN2pEOGxMOVVLaUo0d3pmZnUrQWdGYjk0NUl0bUNS?=
 =?utf-8?B?WW9ETlJLaTY4MTcvS0R4NnhXcG1HaGdBQ0x1ZGxXblJSUFBxVStnWXZWK041?=
 =?utf-8?B?OS9hQWM0V09aNXNGSVN0WTNkT2JuN0UvUnNvYm9WNVpvT3BnckhWQzdMaGE4?=
 =?utf-8?B?OEJyMnFqa2JNcyt5d1VYR3ZkRVpLYmpsL3NQakJ4am03TDJPT1AzeVZ5U0Zt?=
 =?utf-8?B?clhNaWU0bFdWUjFrVkQrbjhjSG1Bby9kVEpLTjNLM3FZUW1VS0FkWVA4eXFn?=
 =?utf-8?B?UFdXMmxJTnE2dHdLbjZCU0paWkZ1SGFWNnRQNW9aOHREYTc2VjV1KzRoNUhF?=
 =?utf-8?B?b0NGTkpUUWo3emJDUXpmU1Z0d0tIMVdmTXVOL0tmU2hxYjQ1ZFpsNkNjYm5I?=
 =?utf-8?B?Q05UVk9qRjNDdU9pNUlranBXbDY5dW83NllEUjNPcm5EQW9wbEVBR0VGZEtU?=
 =?utf-8?B?d1Z1dFhwUFozVjZyRmRiKyt5NTVCOW9lTGkzcWlNbklOenVDQWlRblFXcEM5?=
 =?utf-8?B?Ylcxb0N5cmNTKzRmY2c0Zm9UNkpjVVVsODNoZW5uMldNZHB2NU5Jc29TemRq?=
 =?utf-8?B?OFh0ZEw2WG5DOXlxY1gyMmRwUmE2L29qdkZ2bVRFUTRGVWxSQ2JYUzY2SXJT?=
 =?utf-8?B?OG5zY1k5b0Ewc0hlRWxnbWZmd0V6MU52NGZYaXJwdTRtVnJiV0s3WVpZRE1I?=
 =?utf-8?B?OUttRDU3S1VUZnJsSmVIdzdwRVdxbFI0aU5EWGpJZStWQjJudGxadDBjUUlD?=
 =?utf-8?B?bTJSMTZBaW9SUXFGNHNjUEFPTWs1YUJ5M0hmcTkydWVNVlNhZmFpS3UwOC9j?=
 =?utf-8?B?cHFSNEkza1hHTVllQ2RNWmpJNmpLeW9QTmRhWVRSdFVTVWp6YWJMUmZGYWUy?=
 =?utf-8?Q?VeqA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWVqZkgxb0xxUG5tODdpTi9kLysxYThLT0hXL3dFZVlVUHhaemRLMEpGTzlN?=
 =?utf-8?B?MWZVb0V0VC9IOEJDTlBvMlRDdGUzTHBSMC9DTWNjcDdEdkw5VFp4NVpvVHJS?=
 =?utf-8?B?ZENVREQwcUJJNnp1Z3VrRmZQRURPbHB4MVd1UE5uSzBTZ0g4NXB1YzFTNHNo?=
 =?utf-8?B?b2llR1R3RWFzY2xVZXgyd3hBY3A3SGxGUjhHdUVSWHBCbC84Y0Q1SUdMbW8x?=
 =?utf-8?B?VTUwT3gvRVg4anhOY01tU2JiU3NTTWMxTmdscWJrTFBqeWFhNFE3bGRMUzVk?=
 =?utf-8?B?cjhadjBwMkxaVWdHY3lKMEZUVW9ORGszSWZhU2RzRTRoNjJKZ1BYYnRjMjZQ?=
 =?utf-8?B?YUJnSWs2UFR0WC9WcE5QUFg3QzV3T1h1Q2hLTTVpN01tM0RkWkV0NlhqSzZ2?=
 =?utf-8?B?RGRwNUJOZFZDVERhR3oxUWpONU1CSXZoY1JWVE9Gd09jc0hKZlpoWTNwaHFk?=
 =?utf-8?B?ZVBoWUdFdm5MMXFXYys0aWpZVWE4YlN4TGVJZGczMjJ1L1VzdEorVlhBSUZ1?=
 =?utf-8?B?SXZWbEJ2UW02bUxocHhYNUdhd0RJOVZLWVgwWVhTMXdyMk8vMDFFNzVmTGJD?=
 =?utf-8?B?SXlRNkNYZTF3VjZSU004cEVLTnQzZXFEVDNJc2dWbkpFT0pFa1RVN01PWlZU?=
 =?utf-8?B?MFhYSHJkWG5YWlBBWE1IMU1IMCtoaFpoS05hdGZCbWZQcHpKbm9nK3ZCWmJt?=
 =?utf-8?B?dDRMNElLK0lvcituanRwNmsvZ2FuSnd4UkpPeUUwMC9RN29MZUxhSTJXM1Vl?=
 =?utf-8?B?Zk1NeHZIQXFaWVpQcmxnZkp1ZTJhUWdFQW5TS251OGtTaDhtVDZ4bitBSGo1?=
 =?utf-8?B?VzFNOHRqVUpKUi9TTjRlWXJyNE45Qkp0VFl6QzlMZGNKRGd5NGxDUXo2TkFK?=
 =?utf-8?B?OXRNNzYvSGZtNFNDMSswNzNzNjRKUnREeDUzRUtpVDE5dFRxWXYrNm5raGo0?=
 =?utf-8?B?MHEwbWFrYjNLeHFiYzZ5R2k3NzJ3aGt0WHlVL1NKcWxwUy9pdnprdUF1WU9q?=
 =?utf-8?B?WFBQODNpVkdwc1ZZcjd3TGZUdnRhUjNWQVZGYU12S3RKaGhzUk16b2tWK1NR?=
 =?utf-8?B?cm9YNVJxdXA3MWlkcERjTDFkR3VpaFA3dlZjZ1JGRnREblE1R3dDTGtDUitP?=
 =?utf-8?B?dm5vR2FHYUt0T0RSckhReWZKdjArTmxKUGhENTQyb2tiQm1mbUN2TFQ4eTAw?=
 =?utf-8?B?ZExkcWl1RzV6ZkwxT2xlWE1YK3VFcytlbEFGcS9pL0RORmtzbTFRTGNNMTZi?=
 =?utf-8?B?YUsvUU1MeE1NaVpVTU1iTUhMOUpGUjYxZkpSOXk1U2RIaTZwQVo2cGZxcEpJ?=
 =?utf-8?B?SlVJekFQbHgrbzd6SVcwS2U5TnlGOXNkbEFhYUtMdHY2QmM4QzRKU3YyUFBq?=
 =?utf-8?B?eEZPdXE5NjZ5blNLTWIzK2lZMmZLd1pXN05CK2U3YVZFTTVMaHZINTdqQkdM?=
 =?utf-8?B?d21aMWxtZlUrbzE1NlpaRWc0VloyTUNnSTdjc2MzcSt5OHdiajBBOUVtWldD?=
 =?utf-8?B?eUNTcHpyRjJhLzNJUHRhbWNRb2ZTUzdIY3N1MU1ydHlhVXFid3pJV3E0Q2J2?=
 =?utf-8?B?ZlVGWGczbllIbzYydU9kamVhS2xCa0lGNHRsRFNUSHRTM3YxU2dkL3g1V0di?=
 =?utf-8?B?Q2duS08zNzlYZ0VpNzJsZ1pwd01nT3ZDQk5GWVcxcHdHR0hWd2JEYkcyVW15?=
 =?utf-8?B?Qzh0OW1SaVNVaTRqQUlMM2ZNRWdxYUJneUxNbzV3Smx2d1lMMjB6UDM4Vmlr?=
 =?utf-8?B?Q2JZdnVNL3hCNUYxYlNYc0J1QkQ1TVNPVm1zanZ3dnFtM3lDSDBmU3hWRnY2?=
 =?utf-8?B?UlJjT0hjeVBGRCtBc2c0YVVBQzBFRXhyMmNNbzJpZDJjbmxDNXllYnVNZWVp?=
 =?utf-8?B?V3oydEtueS9PQkN0dEo3WkNndGpnOFhkdE1Dc0N3M1lWYk9udXFhUFlrR09u?=
 =?utf-8?B?d3hTVWFsWkNpbXpDZkJmTjcxT2VMZHVYMWQ1ZE91SWRGRU1ZNGxCOG44ajdJ?=
 =?utf-8?B?R0duM0xMWFlZcC9Gc0JWR0dBZjE5ZjJUSWsvUGdZakVBaDJla3RlT092bXVk?=
 =?utf-8?B?bW1yTCtxWWxPTmYyY1pvWERlSGN4emsvT05aNDNJb0FzbmxOYWdtUEhJRkVm?=
 =?utf-8?B?OSs0clVxTEFlVkZwdGtzYm04YUZwbWkxN0h4dGxrb1ZSZGtwRlZnVFRWZzlu?=
 =?utf-8?B?aDQ3eUJZZXQ4UHJOUFJPa2tOQnQxaEk1TXNRS2FHeXh6MXAxNm5tOXl1cWJp?=
 =?utf-8?B?cnA0VWJ0Y09hWUpuL2ZUMDkvdTV2YVE0Tm9zWEl3L1ZUTTQ0UmhIK25jYjJD?=
 =?utf-8?B?MHg4cHQ0ZmprdDlaQTJ4cHF5UkxIYjJJVWdFVHBZeldEZ3M2ZTNRZXNkNUF0?=
 =?utf-8?Q?BSFXc5QXDG9xtDcs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 68f7b150-7312-4ea6-5e80-08de5ec6fa6a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 23:43:03.2081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TSdexDzbufu4arZKC29JccLrsEopL0LQ+SWrgsejPXiY4foV9k4ZIaUKe2RTmlubfKWRZf29pr8IPFVaeJI2ma/dzg1DVDP17kahA0FF8UI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5261
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



On 1/28/2026 5:35 PM, Piotr Piórkowski wrote:
> Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2026-sty-21 22:42:16 +0100]:
>> Instead of relying on fixed relation to the display probe flag,
>> add configfs attribute to allow an administrator to configure
>> desired PF operation mode in a more flexible way.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_configfs.c | 61 ++++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_configfs.h |  6 ++++
>>  drivers/gpu/drm/xe/xe_defaults.h |  1 +
>>  drivers/gpu/drm/xe/xe_sriov_pf.c |  2 +-
>>  4 files changed, 69 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>> index a823b0bd4ebb..2596810f4366 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> @@ -264,6 +264,7 @@ struct xe_config_group_device {
>>  		bool enable_psmi;
>>  		struct {
>>  			unsigned int max_vfs;
>> +			bool admin_only_pf;
>>  		} sriov;
>>  	} config;
>>  
>> @@ -282,6 +283,7 @@ static const struct xe_config_device device_defaults = {
>>  	.enable_psmi = false,
>>  	.sriov = {
>>  		.max_vfs = XE_DEFAULT_MAX_VFS,
>> +		.admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF,
>>  	},
>>  };
>>  
>> @@ -898,10 +900,40 @@ static ssize_t sriov_max_vfs_store(struct config_item *item, const char *page, s
>>  	return len;
>>  }
>>  
>> +static ssize_t sriov_admin_only_pf_show(struct config_item *item, char *page)
>> +{
>> +	struct xe_config_group_device *dev = to_xe_config_group_device(item->ci_parent);
>> +
>> +	guard(mutex)(&dev->lock);
>> +
>> +	return sprintf(page, "%s\n", str_yes_no(dev->config.sriov.admin_only_pf));
>> +}
>> +
>> +static ssize_t sriov_admin_only_pf_store(struct config_item *item, const char *page, size_t len)
>> +{
>> +	struct xe_config_group_device *dev = to_xe_config_group_device(item->ci_parent);
>> +	bool admin_only_pf;
>> +	int ret;
>> +
>> +	guard(mutex)(&dev->lock);
>> +
>> +	if (is_bound(dev))
>> +		return -EBUSY;
>> +
>> +	ret = kstrtobool(page, &admin_only_pf);
>> +	if (ret)
>> +		return ret;
>> +
>> +	dev->config.sriov.admin_only_pf = admin_only_pf;
>> +	return len;
>> +}
>> +
>>  CONFIGFS_ATTR(sriov_, max_vfs);
>> +CONFIGFS_ATTR(sriov_, admin_only_pf);
>>  
>>  static struct configfs_attribute *xe_config_sriov_attrs[] = {
>>  	&sriov_attr_max_vfs,
>> +	&sriov_attr_admin_only_pf,
>>  	NULL,
>>  };
>>  
>> @@ -912,6 +944,8 @@ static bool xe_config_sriov_is_visible(struct config_item *item,
>>  
>>  	if (attr == &sriov_attr_max_vfs && dev->mode != XE_SRIOV_MODE_PF)
>>  		return false;
>> +	if (attr == &sriov_attr_admin_only_pf && dev->mode != XE_SRIOV_MODE_PF)
>> +		return false;
> 
> I assume you have a reason for this, but without an explanation, I don't understand this approach.
> I assume that sriov config should only be available to PF by definition, so I don't understand
> why you are checking for individual attr. 

sriov group should be always added unless there is no .has_sriov flag

and while today in this group we only have attributes for the PF, soon we might add more attributes that will be for both PF and VFs, or just for VFs
hence the check per-attribute, to show what to do

> 
>>  
>>  	return true;
>>  }
>> @@ -1065,6 +1099,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
>>  	PRI_CUSTOM_ATTR("%llx", engines_allowed);
>>  	PRI_CUSTOM_ATTR("%d", enable_psmi);
>>  	PRI_CUSTOM_ATTR("%d", survivability_mode);
>> +	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
>>  
>>  #undef PRI_CUSTOM_ATTR
>>  }
>> @@ -1243,6 +1278,32 @@ u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
>>  }
>>  
>>  #ifdef CONFIG_PCI_IOV
>> +/**
>> + * xe_configfs_admin_only_pf() - Get PF's operational mode.
>> + * @pdev: the &pci_dev device
>> + *
>> + * Find the configfs group that belongs to the PCI device and return a flag
>> + * whether the PF driver should be dedicated for VFs management only.
>> + *
>> + * If configfs group is not present, use driver's default value.
>> + *
>> + * Return: true if PF driver is dedicated for VFs administration only.
>> + */
>> +bool xe_configfs_admin_only_pf(struct pci_dev *pdev)
>> +{
>> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
>> +	bool admin_only_pf;
>> +
>> +	if (!dev)
>> +		return XE_DEFAULT_ADMIN_ONLY_PF;
>> +
>> +	scoped_guard(mutex, &dev->lock)
>> +		admin_only_pf = dev->config.sriov.admin_only_pf;
>> +
>> +	config_group_put(&dev->group);
>> +
>> +	return admin_only_pf;
>> +}
>>  /**
>>   * xe_configfs_get_max_vfs() - Get number of VFs that could be managed
>>   * @pdev: the &pci_dev device
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
>> index e0a555b871b3..487531269511 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.h
>> +++ b/drivers/gpu/drm/xe/xe_configfs.h
>> @@ -8,6 +8,7 @@
>>  #include <linux/limits.h>
>>  #include <linux/types.h>
>>  
>> +#include "xe_defaults.h"
>>  #include "xe_hw_engine_types.h"
>>  #include "xe_module.h"
>>  
>> @@ -28,6 +29,7 @@ u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_cla
>>  					const u32 **cs);
>>  #ifdef CONFIG_PCI_IOV
>>  unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
>> +bool xe_configfs_admin_only_pf(struct pci_dev *pdev);
>>  #endif
>>  #else
>>  static inline int xe_configfs_init(void) { return 0; }
>> @@ -47,6 +49,10 @@ static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev)
>>  {
>>  	return xe_modparam.max_vfs;
>>  }
>> +static inline bool xe_configfs_admin_only_pf(struct pci_dev *pdev)
>> +{
>> +	return XE_DEFAULT_ADMIN_ONLY_PF;
>> +}
>>  #endif
>>  #endif
>>  
>> diff --git a/drivers/gpu/drm/xe/xe_defaults.h b/drivers/gpu/drm/xe/xe_defaults.h
>> index 9183d05b96e1..5d5d41d067c5 100644
>> --- a/drivers/gpu/drm/xe/xe_defaults.h
>> +++ b/drivers/gpu/drm/xe/xe_defaults.h
>> @@ -18,6 +18,7 @@
>>  #define XE_DEFAULT_FORCE_PROBE			CONFIG_DRM_XE_FORCE_PROBE
>>  #define XE_DEFAULT_MAX_VFS			~0
>>  #define XE_DEFAULT_MAX_VFS_STR			"unlimited"
>> +#define XE_DEFAULT_ADMIN_ONLY_PF		false
>>  #define XE_DEFAULT_WEDGED_MODE			XE_WEDGED_MODE_UPON_CRITICAL_ERROR
>>  #define XE_DEFAULT_WEDGED_MODE_STR		"upon-critical-error"
>>  #define XE_DEFAULT_SVM_NOTIFIER_SIZE		512
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
>> index 919f176a19eb..47a6e0fd66e0 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
>> @@ -22,7 +22,7 @@
>>  
>>  static bool wanted_admin_only(struct xe_device *xe)
>>  {
>> -	return !xe->info.probe_display;
>> +	return xe_configfs_admin_only_pf(to_pci_dev(xe->drm.dev));
>>  }
> Overall, it looks good. I'd really like to know what's going on with this approach
> in xe_config_sriov_is_visible.
> But still:
> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

thanks!

>>  
>>  static unsigned int wanted_max_vfs(struct xe_device *xe)
>> -- 
>> 2.47.1
>>
> 

