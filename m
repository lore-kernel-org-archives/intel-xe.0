Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34235E74AC3
	for <intel-xe@archiver.kernel.org>; Tue,  3 Dec 2024 18:22:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F38C910EB05;
	Tue,  3 Dec 2024 18:22:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TZy4Tu6a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C09C10EB1E
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Dec 2024 18:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733250133; x=1764786133;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oIUPaSKreeHHEayMO9HlqUpXquf95xlrat/1EF0Yy/I=;
 b=TZy4Tu6a0DicbDN5rkZZPR7qtRkhr4qLrPl3suJRgfNQEiryu511lSqE
 fX8b9GdRknu80Jv1JH8f1cQVGO7HAliMFpsz/51u6TwMlmiVpb7Tszrb0
 KX1VC08zSHHcXiCC3HqSWr3k+G7Fz5KBuuUvsSISOyYb7D5hZYk2AwKm/
 0Ld1r7GL1SNOAg8jnzCaoLSDAdJV+RoJ1ag3VibWyKgkwlPhMHdkMpK2D
 wYXpZh42ChHWx7M2fUSogoIF/awLmj+/STjWJNwfmMSuqBjL9OGtStt2t
 d8MkPI+vWwMxWek6cvPqvbZHSpMBcBVmGABtPz6EnqBU8ZCw01LDU2fFi Q==;
X-CSE-ConnectionGUID: r0C8egeYS2SbO9ouuaYvZw==
X-CSE-MsgGUID: sKCsQThgQzatY8622lHQjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="55970195"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="55970195"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 10:22:13 -0800
X-CSE-ConnectionGUID: NqqLpnNuS/ukHBPFUpFAqg==
X-CSE-MsgGUID: hQybUvY9SdCYFXoZKgMreA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="97953316"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Dec 2024 10:22:11 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 10:22:11 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Dec 2024 10:22:11 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Dec 2024 10:22:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQhBR3mPq7xHHBHOk/Qjsv5p/G7Gz2GgASzTudgIm/XEDdx/DNoEsqnWnMjkq8XwWZaphdVNgD8C/6FgKEshjfpUz3k6hziaK80BM+N9G0MLf74c5n9DS49osbcdXJmnKnE1qMEqYI5Ud3to1tipkVaUiHWf0WZlgaqiT+LADw4ka3qXXFDHwJ+PUJTKl8XPvm6ud8wkzWlyI3rFlJ5w6Ah1ICD0sl+cC7XyPe+IQk9lhRzoo9x/vc3i1PkWZ9Grw8jQr63LgpVoOcwQu+IKTH6YGIaHu1kDfC+waeDP11j/5Ozcav1RmWM/KTwZ12MbzWeIKPQ5s65gBsgrHzam7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gUii/Q7whtzxx9do7rG+ghJc2zRMerUtxcfVrW9nx6A=;
 b=jbAlvz0Orwrvk2kSsf+5qXfZ1hsT1fMpZey6oXZuYiuVVL0nzAAtoMcKC7TJVw1qXFsuucdAJ/gx43yga10k7Ru8IJFTfHvLgurGxSxTedF6RYucJZUToyTILqsLpEZmpJNPMkJ0miRYklGqPxpjSMxO1yOcaaNPhp+qCy+Ich5Wyw8taVZNnP2KWFQA1TiT4zbmLOZVlmoOt3X4TbEsrKxtDXCQRBUYeqcRS1jkcKpdtNWHojviU2bXw7Vz33J8Yl340b4jggUlPO9byedROHaLntLiGxdhpCPvJVPaaaXsABTCBzWwo8Hj75qD/IiNQBSAcY10gofIs54uq0P7rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by CH0PR11MB8086.namprd11.prod.outlook.com (2603:10b6:610:190::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 18:22:06 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%6]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 18:22:06 +0000
Message-ID: <52e53dff-37f2-4fee-a310-01ef8bf5080b@intel.com>
Date: Tue, 3 Dec 2024 19:22:03 +0100
User-Agent: Mozilla Thunderbird
From: "Lis, Tomasz" <tomasz.lis@intel.com>
Subject: Re: [PATCH v3 2/3] drm/xe/sriov: Shifting GGTT area post migration
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20241123031333.3435414-1-tomasz.lis@intel.com>
 <20241123031333.3435414-3-tomasz.lis@intel.com>
 <20379fa5-3cbb-4753-8d65-de390197d6dd@intel.com>
Content-Language: en-US
In-Reply-To: <20379fa5-3cbb-4753-8d65-de390197d6dd@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0023.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::7) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|CH0PR11MB8086:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f9418ed-f888-4dcb-1887-08dd13c76440
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?djVNK0FUWHprYUNESnFsZWFrZzBGWE9aYkNjbkUwV2R5azlGdW1ReENEUksx?=
 =?utf-8?B?U0x6UVlvOEpIcmVyR2xGUU5KSnRGclFENmRNZ0ZLblI1SnB6MGx3QlNPM3R1?=
 =?utf-8?B?MkV2TzhDczJMeFZnNFpsblhBZXNDL2lMdDR3TnNpNzZRL29pakJFVWpjWVZw?=
 =?utf-8?B?RjduNVN0eVRoczlST0pVYzdIN2N3SUxZa2kyNFBYQUlPV3U2V20rVnFBTkw3?=
 =?utf-8?B?QmVRbEgwdDlpWGVOZzVYRWhEMUxubTNOYzNRV2IxSjhnMFdxeWhhazZmdWJq?=
 =?utf-8?B?Ky81VWJpekUrWFgyc1p6Z0NjV3ZkT20zVFphV2tQSzRxVUdUUEdDd2lSS1dV?=
 =?utf-8?B?d2tiSngrRUw0MGxjaCsvT1dUN0ZIUzNFYnIzSUwxa1ovUXVMZmVaTG5HNS9i?=
 =?utf-8?B?NDFCQldGejdoTllpNEMrYWJ2SFlvKzVIbXFTQkhPZG9BbzJJNnIzMjdyajVn?=
 =?utf-8?B?YVFXSnVHZkpCb0JOUlRCTjI0V0h2ZldHRkFFUlV6dFFnVkJYZVhzTXg3UStv?=
 =?utf-8?B?bWRueFpOQ3FMSEw4ZkgvOSt3OEsyUEFNTXRGQUlkeGNTeUtrcDdMOGlaR2cx?=
 =?utf-8?B?Tm9Lb2NrVkJpTFI4dHQyVG84QXQwU2Z1RE4zVGZxOEdraVlzNVhkMWFKSkJL?=
 =?utf-8?B?NWZTbkF0WXFkVndzU2VGa2UxeFNITTdpRlhaMzJSdnYrWUkwTjV2cjE5QjM3?=
 =?utf-8?B?bnZFTGxpMWZXWlBIK1ZucitYZ3cxQk5SUUlQMU9QRlVNUWxoSGRDdk5ueEs1?=
 =?utf-8?B?Tk1sSWQwcVdXQnVZY3JJSHZJY09RM1lBSUd1alZrUEkwbnZKK3hmZ0YvVFRu?=
 =?utf-8?B?S1d5OHhoVHB1UldISENNVWN4ajlqS2FQdjVIOTBrT2Z6QW53UnYzK3BYeGlm?=
 =?utf-8?B?R0hIT1FYZmpDU2lmN29PcUlYU0NlZUZvb3BUa0taeHZMK0VISzczVTdTUXJJ?=
 =?utf-8?B?YU5XNDdlYTgxdFNFeXROWDROdTBYK0IyOVAzblB0RlorNW5UQnZHNHo3eG03?=
 =?utf-8?B?TG5qMWpqdTZXNUNtUWs3K1FRVDlSd2o4NjlRQnI2RWNiYkVlM3JWcVkrY2RX?=
 =?utf-8?B?cXlGbnpBVDBaZERNaXJwWjhXM21OVHV4aEhwZHJ5Vkx5MlpMNXp6a0s4eW5N?=
 =?utf-8?B?Kzh0SitKVjlwK3ZHd3RaRW0ycFgyOHQrQmdveXBqRFhSeFM5QnZWY1o2akF5?=
 =?utf-8?B?K3pGVit0K0pkZFRyV09jdnlzcXpvSFZCc1RScm1idjJvUGxkYnNPcVlqcjM3?=
 =?utf-8?B?YkhrT00rNUFsT2ZWUUttQW5QNGRjUXRoM1V6dzByb0xaWTZVbGE1bjQ2T2FO?=
 =?utf-8?B?MzNWSnQybytWQ3NJUzUxUHNjN0hhK0FxalZxZUxNaEV2TTBRVCs0Ull2dlpi?=
 =?utf-8?B?eGlKdmdiVFJ5N1Vhbk1HNjZPUEpVZ2ptL2t0eGxSMytGNFVGQTdUaUV2akxJ?=
 =?utf-8?B?V0JsYThFTkVnVGMwbXE0bjJUNDZ2ZnM3ZE9Qc1I0TXYzSmxHTnhLYVh5Tncz?=
 =?utf-8?B?bWxWM1hSMFNQM0daYThpUUkwKzYrSldoc3A0WnhRZWtsQnJoZ2Y4bWg3UUgy?=
 =?utf-8?B?bGNhR2N5QVlGUlhXN3FhOWNzbytqOUF3amdaRHdqS0RSaDdNblFwM3d5d1Vs?=
 =?utf-8?B?YzFQODRJOEJ3QWczYmJLbDBjeGhNQ0srUmZtVTV0b0haQ3FCV1haVlFNQWNm?=
 =?utf-8?B?VTFrN00xc1MxRFVCRVJFYUdPRGRqem9EMks2a1NDa3M3RjZkcmtJZ0lNNWJp?=
 =?utf-8?B?K0ExTjhpM3NQNDVMbDdZMVdXWkFMQ2UrS1B0dDBUaFBvdlJFaC9GLzdiVklm?=
 =?utf-8?B?MlFGWGgvUmYwSTl6eDhMQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3MxMTV3ZmN1V2xMNElOTDlscnpBVTE4TzZrT21LTElXQmthWlNRTllEblFx?=
 =?utf-8?B?MHkxNFRBNVV1eFJUN1ZKUE5rTzdERWgvMkpmQ0hDL1ZpamFPSFEyOXNmYjRw?=
 =?utf-8?B?ZXVtUHZDbDFPRGhTMStjM1FMNDdFNm5neUtCM1gwVkFXMXphTFVxY1NFWmhD?=
 =?utf-8?B?b1JGTHcveDYzVGNJc1pUYVJRaGM3eThvQ0JjL1RGWGdtSmUyQ1V1MG1XWTkw?=
 =?utf-8?B?SFRYNWFiTkpjZzFMUlp1M25hNU10Q1lnL1k5SnJmVnJhcEFNejAvNUNVdVdS?=
 =?utf-8?B?cmpyQmJzSk10elRSNkM1VDdEL0Qvd2I5anJmb3I5Z2svUDVXVGE5bmlDZGJv?=
 =?utf-8?B?Y20yajI5K2hyQ09jZjY1bDZocVdWWWNzU2xzTmhmcmdCb2VqNVk0RWQ2cW0w?=
 =?utf-8?B?azNReEVrK3JrYzJ5RnJDT1JvN0FsVjFUclhXVmQwb2hTelFsN2l6d244ajRN?=
 =?utf-8?B?dkFLSFU0eCtrbnNzajdocGlzaWtFRFJMcjFtR0FoUGNVUVVIVVBuQjUxekpr?=
 =?utf-8?B?MnhxMWN2bXJLNzBLT1dSS3JYeGh6RTh4dVdtRGdXMjJhRXcrZ1VoeDZrQmxU?=
 =?utf-8?B?RElXOUNRZDNONzlYSHVORGtRc1h1VzBmMlFEd09kMFQ5SDRlaElrd1dDSC9S?=
 =?utf-8?B?OENUZk5JNzF4Y1ZqSjNwOHlab1czVWU5OUFDNlo5VmxubVllbDRURmljaWsz?=
 =?utf-8?B?U1N6bTBCeDlHL2lVUkNIL3dOM2JKeENiWmFFSjhXazZkbTB4QVR6dkdBTkE5?=
 =?utf-8?B?QXFudm5NM0lyWXpPd2lpRTRkdWhsUzZFYWdta0NMNUFrMEZRcXJMWGxLR0Ro?=
 =?utf-8?B?RlpTYmRha0NibnlNZ3NRTzU4WmdoRmJmQWROdXdWeGV3aVlNa2hETkhtaEZW?=
 =?utf-8?B?NjA2RndyZVkwVE4xSkk1SjNYREpyMUtDL2pxTmt5a2hiUG5aY2pMczZyN2l3?=
 =?utf-8?B?QXRHdWUxZ3N6V2ZoTkFtRksvZ0tMZGJxaWdKTzRrMFE1dnZEWE5HZmRTY1Ax?=
 =?utf-8?B?WkIwdVhrazMrU2ZlVVg0Qm9SU3B4dlVlV0VzbXkvVEpNanA2M2Y1em5hcXdU?=
 =?utf-8?B?UytjSk5MYjd4ajZ2ZU9JcDl4L25QTndUaXJwU2thOEMzZnhUdCtDV0tPQmVY?=
 =?utf-8?B?V3FuSkRzRk5BVURTQ2NoL3I3N2VaNEF4WjJLSElONUtWMXk4RFlTYnBZTFEz?=
 =?utf-8?B?ekZQWDNNMWJlbXhGZHVTcjJScEFnR1dVcHNLQmlwczFGL2tkU1lGRnlMdFlY?=
 =?utf-8?B?ZzNyQ3ZRTTYwZ3JtRzZhWGJvS25sdk12ekxmTWhLUmhZZHJFK2k2Z1BSelBP?=
 =?utf-8?B?V3R5UGxQS2U3RlE5R3RlTXJ1Y1dzVnhUYlpUS0twVnZoK2cvb25ESmpyeUVP?=
 =?utf-8?B?WjdMbkJGelhGdEdTZXlZQWIxdHNKRUptZ0ZScWNaQlkwSWtnNWRoQlo4N1pX?=
 =?utf-8?B?WDhuQzJ6aW00aWlWZFRpcmRmTE1lbjI4MGJVaWhWR1JDemt0YzdVNzNiTEY3?=
 =?utf-8?B?RzVBU2htb2NOUytnYVhHOXc3YXBxZWE2QzNFMEx6eVVZakkwaG5xbmNSL05J?=
 =?utf-8?B?NWFmaFlVbXRsV09MckYzQkZRTnFiYkpsSU5xc0pKT2dkNmkrUmU4OFNsZG9r?=
 =?utf-8?B?bk1jQ3hCcGVydHVRRlZ2N0VCeXdCVHp2MnVGdE1SSzNqdWhuM01TWEI0S3Rx?=
 =?utf-8?B?dlJKZmpQSldnbW5iOUwwVlVsOUxpMUR5MjhYNnBrT2ZiVS85UDJoOGZaUktD?=
 =?utf-8?B?ZnVrQlNOTTdaWHNOeUlKZEtkS2JDUzl6NlI3Yjh6QmJ0dENlbmR1Nk9SdGs3?=
 =?utf-8?B?QUFDVWM5UlNjVVNsaVZPNlpOMTVHbWFNNlphMThoWkZjUVR1ODdJdm4wUHUx?=
 =?utf-8?B?cnorZm1wSHBMK05iYlVna3pWb05Xc3E4UnFpQTBrYXozZGUwTDhwcFg2bHdF?=
 =?utf-8?B?aGhNRDNjejFaaGVwcFR3T2hzL1FSa2Z1UDY2NWlZUlRDYUgwYWF4MkhYWjRx?=
 =?utf-8?B?NW1XKzBPZGZSaHZNYVV4aUx2UUl5cXQ5WE9TY21OUWhvYUZ0aTZWRWR6R2RU?=
 =?utf-8?B?WjJJcWNVME9acWI1Y2IyZHlMbW43ekFtaDcxU2E4VCtqRXp5WnlHdEs5ZHBU?=
 =?utf-8?Q?jWRRBlgTjfwt6HB6a08VbIKM5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f9418ed-f888-4dcb-1887-08dd13c76440
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 18:22:06.0501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q8X5dLv3BgZTAlbRdhB/Xitx9ad03a9ivi5FLeBLeFb+IUcourWAUUsh1ain5tvv57rM1/Q59wuktZA1BSXwXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8086
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


On 27.11.2024 23:30, Michal Wajdeczko wrote:
> On 23.11.2024 04:13, Tomasz Lis wrote:
>> We have only one GGTT for all IOV functions, with each VF having assigned
>> a range of addresses for its use. After migration, a VF can receive a
>> different range of addresses than it had initially.
>>
>> This implements shifting GGTT addresses within drm_mm nodes, so that
>> VMAs stay valid after migration. This will make the driver use new
>> addresses when accessing GGTT from the moment the shifting ends.
>>
>> By taking the ggtt->lock for the period of VMA fixups, this change
>> also adds constaint on that mutex. Any locks used during the recovery
> typo: constraint ?
ack
>> cannot ever wait for hardware response - because after migration,
>> the hardware will not do anything until fixups are finished.
>>
>> v2: Moved some functs to xe_ggtt.c; moved shift computation to just
>>    after querying; improved documentation; switched some warns to asserts;
>>    skipping fixups when GGTT shift eq 0; iterating through tiles (Michal)
>>
>> Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ggtt.c              | 139 ++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ggtt.h              |   3 +
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       |  25 ++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |   1 +
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |   2 +
>>   drivers/gpu/drm/xe/xe_sriov_vf.c          |  22 ++++
>>   6 files changed, 192 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>> index 558fac8bb6fb..44500707f8ae 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> @@ -489,6 +489,145 @@ void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node)
>>   	xe_ggtt_node_fini(node);
>>   }
>>   
>> +static u64 drm_mm_node_end(struct drm_mm_node *node)
>> +{
>> +	return node->start + node->size;
>> +}
>> +
>> +u64 xe_ggtt_node_end(struct xe_ggtt_node *node)
> please add proper kernel-doc
will remove instead.
>> +{
>> +	return drm_mm_node_end(&node->base);
>> +}
>> +
>> +static void xe_ggtt_mm_shift_nodes(struct xe_ggtt *ggtt, struct drm_mm_node *balloon_beg,
>> +				struct drm_mm_node *balloon_fin, s64 shift)
>> +{
>> +	struct drm_mm_node *node, *tmpn;
>> +	int err;
>> +	LIST_HEAD(temp_list_head);
> nit: please reorder vars to follow reverse-xmas-tree style
I did commented on that request in the previous round.. but ok, can do.
>> +
>> +	lockdep_assert_held(&ggtt->lock);
>> +
>> +	/*
>> +	 * Move nodes, from range previously assigned to this VF, into temp list.
> hmm, now that function is taking generic params, maybe all this comment
> should be in the VF file as full kernel-doc explaining GGTT fixup steps?

I don't have a strong opinion on docs location. If you provide details 
of your idea, I can move that.

Though this is only one of the fixups applied. I hope we're not leaning 
towards making kerneldoc

chapters about all of them.

>> +	 *
>> +	 * The balloon_beg and balloon_fin nodes are there to eliminate unavailable
>> +	 * ranges from use: first reserves the GGTT area below the range for current VF,
>> +	 * and second reserves area above.
>> +	 *
>> +	 * Below is a GGTT layout of example VF, with a certain address range assigned to
>> +	 * said VF, and inaccessible areas above and below:
>> +	 *
>> +	 *  0                                                                        4GiB
>> +	 *  |<--------------------------- Total GGTT size ----------------------------->|
>> +	 *      WOPCM                                                         GUC_TOP
>> +	 *      |<-------------- Area mappable by xe_ggtt instance ---------------->|
>> +	 *
>> +	 *  +---+---------------------------------+----------+----------------------+---+
>> +	 *  |\\\|/////////////////////////////////|  VF mem  |//////////////////////|\\\|
>> +	 *  +---+---------------------------------+----------+----------------------+---+
> hmm, I'm wondering if maybe after all recent GGTT refactoring it would
> be easier to trim VF's xe_ggtt size at init() instead of playing with
> two balloons?
>
> then layout will look like:
>
> PF:
>      |<---------------- xe_ggtt.size ----------------------------->|
> +---+-------------------------------------------------------------+---+
> |   |/////////////////////////////////////////////////////////////|   |
> +---+-------------------------------------------------------------+---+
>
>
> VF: before migration
>                     xe_ggtt.size |<-------->|
> +---+---------------------------+----------+----------------------+---+
> |                               |//////////|                          |
> +---+---------------------------+----------+----------------------+---+
>
> VF: after migration
>                                      xe_ggtt.size |<-------->|
> +---+--------------------------------------------+----------+-----+---+
> |                                                |//////////|         |
> +---+--------------------------------------------+----------+-----+---+

That is a change which would require address space shifting capability 
in drm_mm, and

changes outside the scope of these patches. I will try to prepare an RFC 
for the drm_mm

part, then we'll see whether this is viable.

>> +	 *
>> +	 * Hardware enforced access rules before migration:
>> +	 *
>> +	 *  |<------- inaccessible for VF ------->|<VF owned>|<-- inaccessible for VF ->|
>> +	 *
>> +	 * drm_mm nodes used for tracking allocations:
>> +	 *
>> +	 *     |<----------- balloon ------------>|<- nodes->|<----- balloon ------>|
>> +	 *
>> +	 * After the migration, GGTT area assigned to the VF might have shifted, either
>> +	 * to lower or to higher address. But we expect the total size and extra areas to
>> +	 * be identical, as migration can only happen between matching platforms.
>> +	 * Below is an example of GGTT layout of the VF after migration. Content of the
>> +	 * GGTT for VF has been moved to a new area, and we receive its address from GuC:
>> +	 *
>> +	 *  +---+----------------------+----------+---------------------------------+---+
>> +	 *  |\\\|//////////////////////|  VF mem  |/////////////////////////////////|\\\|
>> +	 *  +---+----------------------+----------+---------------------------------+---+
>> +	 *
>> +	 * Hardware enforced access rules after migration:
>> +	 *
>> +	 *  |<- inaccessible for VF -->|<VF owned>|<------- inaccessible for VF ------->|
>> +	 *
>> +	 * So the VF has a new slice of GGTT assigned, and during migration process, the
>> +	 * memory content was copied to that new area. But the drm_mm nodes within xe kmd
>> +	 * are still tracking allocations using the old addresses. The nodes within VF
>> +	 * owned area have to be shifted, and balloon nodes need to be resized to
>> +	 * properly mask out areas not owned by the VF.
>> +	 *
>> +	 * Fixed drm_mm nodes used for tracking allocations:
>> +	 *
>> +	 *     |<------ balloon ------>|<- nodes->|<----------- balloon ----------->|
>> +	 *
>> +	 * Due to use of GPU profiles, we do not expect the old and new GGTT ares to
>> +	 * overlap; but our node shifting will fix addresses properly regardless.
> whether we use profile or not, we shouldn't make any assumptions about
> overlap, so maybe just skip that comment?

The profiles are part of SRIOV architecture. Without a comment, it 
should be assumed that the code

is only compliant with use cases from said architecture.

>> +	 *
>> +	 */
>> +	drm_mm_for_each_node_in_range_safe(node, tmpn, &ggtt->mm,
>> +					   drm_mm_node_end(balloon_beg),
>> +					   balloon_fin->start) {
>> +		drm_mm_remove_node(node);
>> +		list_add(&node->node_list, &temp_list_head);
>> +	}
>> +
>> +	/* shift and re-add ballooning nodes */
>> +	if (drm_mm_node_allocated(balloon_beg))
>> +		drm_mm_remove_node(balloon_beg);
>> +	if (drm_mm_node_allocated(balloon_fin))
>> +		drm_mm_remove_node(balloon_fin);
>> +	balloon_beg->size += shift;
>> +	balloon_fin->start += shift;
>> +	balloon_fin->size -= shift;
>> +	if (balloon_beg->size != 0) {
>> +		err = drm_mm_reserve_node(&ggtt->mm, balloon_beg);
>> +		xe_tile_assert(ggtt->tile, !err);
>> +	}
>> +	if (balloon_fin->size != 0) {
>> +		err = drm_mm_reserve_node(&ggtt->mm, balloon_fin);
>> +		xe_tile_assert(ggtt->tile, !err);
>> +	}
>> +
>> +	/*
>> +	 * Now the GGTT VM contains only nodes outside of area assigned to this VF.
>> +	 * We can re-add all VF nodes with shifted offsets.
>> +	 */
>> +	list_for_each_entry_safe(node, tmpn, &temp_list_head, node_list) {
>> +		list_del(&node->node_list);
>> +		node->start += shift;
>> +		err = drm_mm_reserve_node(&ggtt->mm, node);
>> +		xe_tile_assert(ggtt->tile, !err);
>> +	}
>> +}
>> +
>> +void xe_ggtt_node_shift_nodes(struct xe_ggtt *ggtt, struct xe_ggtt_node *balloon_beg,
>> +			      struct xe_ggtt_node *balloon_fin, s64 shift)
> don't forget about kernel-doc
will add.
>> +{
>> +	struct drm_mm_node *balloon_mm_beg, *balloon_mm_end;
>> +	struct drm_mm_node loc_beg, loc_end;
>> +
>> +	if (balloon_beg && balloon_beg->ggtt)
>> +		balloon_mm_beg = &balloon_beg->base;
>> +	else {
>> +		loc_beg.color = 0;
>> +		loc_beg.flags = 0;
>> +		loc_beg.start = xe_wopcm_size(ggtt->tile->xe);
>> +		loc_beg.size = 0;
>> +		balloon_mm_beg = &loc_beg;
>> +	}
>> +
>> +	if (balloon_fin && balloon_fin->ggtt)
>> +		balloon_mm_end = &balloon_fin->base;
>> +	else {
>> +		loc_end.color = 0;
>> +		loc_end.flags = 0;
>> +		loc_end.start = GUC_GGTT_TOP;
>> +		loc_end.size = 0;
>> +		balloon_mm_end = &loc_end;
>> +	}
>> +
>> +	xe_ggtt_mm_shift_nodes(ggtt, balloon_mm_beg, balloon_mm_end, shift);
>> +}
>> +
>>   /**
>>    * xe_ggtt_node_insert_locked - Locked version to insert a &xe_ggtt_node into the GGTT
>>    * @node: the &xe_ggtt_node to be inserted
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
>> index 27e7d67de004..3d2ca6f7185d 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.h
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
>> @@ -18,12 +18,15 @@ void xe_ggtt_node_fini(struct xe_ggtt_node *node);
>>   int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node,
>>   				u64 start, u64 size);
>>   void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node);
>> +void xe_ggtt_node_shift_nodes(struct xe_ggtt *ggtt, struct xe_ggtt_node *balloon_beg,
>> +			      struct xe_ggtt_node *balloon_fin, s64 shift);
>>   
>>   int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align);
>>   int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
>>   			       u32 size, u32 align, u32 mm_flags);
>>   void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate);
>>   bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node);
>> +u64 xe_ggtt_node_end(struct xe_ggtt_node *node);
>>   void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
>>   int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
>>   int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> index cca5d5732802..a1841862c97e 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> @@ -389,6 +389,7 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>>   	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
>>   				start, start + size - 1, size / SZ_1K);
>>   
>> +	config->ggtt_shift = start - (s64)config->ggtt_base;
> is this explicit cast really needed ?

"needed.."

Due to the characteristics of two's complement system, not having the 
cast would lead to valid s64 result on all relevant CPUs.

But according to C specification, result of arithmetic subtraction will 
be unsigned if both arguments are unsigned (see "Usual arithmetic 
conversions" for details). So for logic compliance with C standard, the 
cast is indeed needed.

While in all relevant CPUs the unsigned underflow works as expected, the 
C spec defines it as undefined behavior in the chapter mentioned before.

>>   	config->ggtt_base = start;
>>   	config->ggtt_size = size;
>>   
>> @@ -912,6 +913,30 @@ int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt)
>>   	return err;
>>   }
>>   
>> +/**
>> + * - Shift GGTT allocations to match assigned range.
>> + * @gt: the &xe_gt struct instance
>> + *
>> + * Since Global GTT is not virtualized, each VF has an assigned range
>> + * within the global space. This range might have changed during migration,
>> + * which requires all memory addresses pointing to GGTT to be shifted.
> Return: ?
will add.
>> + */
>> +int xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt)
>> +{
>> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>> +	struct xe_tile *tile = gt_to_tile(gt);
>> +	struct xe_ggtt *ggtt = tile->mem.ggtt;
>> +	s64 ggtt_shift;
>> +
>> +	mutex_lock(&ggtt->lock);
>> +	ggtt_shift = config->ggtt_shift;
>> +	if (ggtt_shift)
>> +		xe_ggtt_node_shift_nodes(ggtt, tile->sriov.vf.ggtt_balloon[0],
>> +					 tile->sriov.vf.ggtt_balloon[1], ggtt_shift);
>> +	mutex_unlock(&ggtt->lock);
>> +	return ggtt_shift ? 0 : ENODATA;
>> +}
>> +
>>   static int vf_runtime_reg_cmp(const void *a, const void *b)
>>   {
>>   	const struct vf_runtime_reg *ra = a;
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> index 912d20814261..49af35484a57 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> @@ -17,6 +17,7 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
>> +int xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
>>   void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> index a57f13b5afcd..5ccbdf8d08b6 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> @@ -40,6 +40,8 @@ struct xe_gt_sriov_vf_selfconfig {
>>   	u64 ggtt_base;
>>   	/** @ggtt_size: assigned size of the GGTT region. */
>>   	u64 ggtt_size;
>> +	/** @ggtt_shift: difference in ggtt_base on last migration */
>> +	s64 ggtt_shift;
>>   	/** @lmem_size: assigned size of the LMEM. */
>>   	u64 lmem_size;
>>   	/** @num_ctxs: assigned number of GuC submission context IDs. */
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index c1275e64aa9c..4ee8fc70a744 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -7,6 +7,7 @@
>>   
>>   #include "xe_assert.h"
>>   #include "xe_device.h"
>> +#include "xe_gt.h"
>>   #include "xe_gt_sriov_printk.h"
>>   #include "xe_gt_sriov_vf.h"
>>   #include "xe_pm.h"
>> @@ -170,6 +171,26 @@ static bool vf_post_migration_imminent(struct xe_device *xe)
>>   	work_pending(&xe->sriov.vf.migration.worker);
>>   }
>>   
>> +static int vf_post_migration_fixup_ggtt_nodes(struct xe_device *xe)
>> +{
>> +	struct xe_tile *tile;
>> +	unsigned int id;
>> +	int err;
>> +
>> +	for_each_tile(tile, xe, id) {
>> +		struct xe_gt *gt = tile->primary_gt;
>> +		int ret;
>> +
>> +		/* media doesn't have its own ggtt */
>> +		if (xe_gt_is_media_type(gt))
>> +			continue;
>> +		ret = xe_gt_sriov_vf_fixup_ggtt_nodes(gt);
>> +		if (ret != ENODATA)
>> +			err = ret;
>> +	}
>> +	return err;
>> +}
>> +
>>   /*
>>    * Notify all GuCs about resource fixups apply finished.
>>    */
>> @@ -201,6 +222,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>>   	if (unlikely(err))
>>   		goto fail;
>>   
>> +	err = vf_post_migration_fixup_ggtt_nodes(xe);
>>   	/* FIXME: add the recovery steps */
> nit: ... add *more* recovery steps ... ?

the idea of this comment is to alter the code around it, not to continue 
adding only slightly relevant fixes to the temporary comment itself.

-Tomasz

>>   	vf_post_migration_notify_resfix_done(xe);
>>   	xe_pm_runtime_put(xe);
