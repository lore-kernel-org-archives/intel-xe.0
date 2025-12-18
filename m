Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 950DDD70DF2
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 21:04:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55FAE10E070;
	Thu, 18 Dec 2025 21:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HoLM72cT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07CDB10E070
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 21:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766091893; x=1797627893;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vQwJrPxaWZwaiS0qO4iqSX82PDZUJQRkl0TD5ooPGwM=;
 b=HoLM72cTx4cGB7niea6Jo7v0fBss5dMdL2z/fJ9iwmgr+FAWbL3ii47d
 gTqyD+7UM8mF1trFtWXcPtlBD8X9Ulcx30P7N2AEHFbXHXkn2BQHcBZ4Q
 HDaiFu94K0KagNsjRomWjn+c3Eo7bBYNdhPbfUvZ22Tv52K5ZkWu/hlzF
 oB9DPJ10qG3jTQuVzM5lEt1HRnEAC4p6LiwCp73hwBM12pBZkJqnbfq4E
 PxIl/ZS8ivUUReSMqM/dsDV02TljMOGq7mSFhqW1qGn7oTSPxTlvzqDIN
 7Nwn6n5DHNijoBEY69mgs9klOa3fNTF/CUrxkca0e2QHrmxRPbHLvUUB3 Q==;
X-CSE-ConnectionGUID: HwsF/9yEQZugfNyBWUzlRg==
X-CSE-MsgGUID: rH/85yP6SEiEQ9jDJXqVXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68210335"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="68210335"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 13:04:52 -0800
X-CSE-ConnectionGUID: 4vJhdxfITxetJ/prWT7h7Q==
X-CSE-MsgGUID: cUG7gGarT+mrtgh9+PYP5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="197943808"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 13:04:53 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 13:04:52 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 13:04:52 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.2) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 13:04:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yj5Qboqj21jgOs5CZVaiG0H9f1MLeCwGF8lTAOaN8f45ICL2EOEvbu3x+G3HqyeKkFdUAif6k2KjPk9azYVcBvQI9sj/NGF+pqQ5gHLxTw08vma1HY5Jn1o9N9piZHwGvLIRB4jOIlmZ6nxvogyGjEcR4skTOpsIjTukuC5JLVw+ZIi4RFbN4D04apLBjkJQRdXO4qB31wjQn3BQUxIoWl5gIDDIzduqVDlWSdEwCVDwH+FXhPj8TOgMVuZs0XFunk8jNMfAwx1AJqp7S0iT9NDUoza6Swb/BgA/KrABmB8GC2sByrrYCAQhot70vZ4M9CrQ/V1L9qd4YrFgMwghkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2DQQbNKQR1xFRLQZSZDu87rqpcJjuxOu4VLZxcZj5F0=;
 b=RZ7TpazZVzXUWOC7O0YFLjLZBBy6B3gfOSWZLjzGe+yoscT2qgoWBbhKMz4pT306VrcOv1sGxbUuMHhX0UxfEYCiBs0hMf3stN6jyHRZFby6sNNpMz4YEEIcNVwglhXJkhl10er3HUWbWzA3AMzHu3w+1RpMvY4fk5Ay1EH4DaRJkbTm+40hChiYgzySmZdAe2n3lgxr8hObtx0jqiSLhumeGiR5xBU4YwIexl363oYmd+ivWcMIcqmvRUfz/fB7UuoSc0kQFFkd29rOrezrmONYlWst7i9XuTOQlyy3rLnVvHayun65wvQvXtl+8Bozx0ljx/WHmhON0Q/5i7RsYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS0PR11MB7335.namprd11.prod.outlook.com (2603:10b6:8:11e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 21:04:49 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 21:04:49 +0000
Message-ID: <a981d6fd-09b1-43d4-9797-e1ce0fda2ba4@intel.com>
Date: Thu, 18 Dec 2025 22:04:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/xe: Decouple GuC RC code from xe_guc_pc
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251218015340.3800280-1-vinay.belgaumkar@intel.com>
 <20251218015340.3800280-2-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251218015340.3800280-2-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P190CA0004.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::17) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS0PR11MB7335:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fab3a96-dc88-4710-7adc-08de3e791472
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1FaTm1GL3RBM3RJVk84NXZHQXExd01lZDRBYlo4TVhUcURqT0NNMUVOUTA5?=
 =?utf-8?B?R1FTdXU3K1lYZmFDbkFTYmZoMDZ4U1lpTHhiZ2FXcW51aWJlbG5hY2phZU4y?=
 =?utf-8?B?ZnFpeEsvcXR1TUN2VEdKbWVuM2lTYVNqQVFYby9Hd1NKZzF5WDdtMnp3T1M3?=
 =?utf-8?B?TmlLTFM0dUNVbUplSVZBMi9SUUwwZ2twQkVVamtJa2VidkRSakt2YnZSRzVS?=
 =?utf-8?B?L1hNOTBQSVlkZ1RGOXZsbkt5Ykc5Z3RvUmZLU0p1dGp3L0U3S1VnQ3FWZW5L?=
 =?utf-8?B?Ry95L2NUd2pFY1BRN2NKWWtwV1k5UEZnbG4zaTZLUEVnMFNNOVFjdVJiMUhE?=
 =?utf-8?B?SXVLTkJpY3JrQTNkM3VtU1FGK1hIcVc0aVJCNk8vbkJEODBxU3poc0FUdkdR?=
 =?utf-8?B?WW1RdHY5MnlxOEgrL0MzckRjOFJNM2xweHZ2TVV5d3hWKzFwVGJKbVFpdkcr?=
 =?utf-8?B?YnhwVHFsZTIwTnJmMkhvS2Nrc2FGaHFCYytXK1ErNzdOL25xSnNJbGpHSkpP?=
 =?utf-8?B?dVlsYUxDY0llbnRiS3NBMzlJWDd5TFh1SUNvelhzazh1YkwyRTRObjB6cHJG?=
 =?utf-8?B?NHZXbG91SXl5S0FlMU1jYUhKSTdMdmltWVBwOC9UcjlVREtwQVI3WEFKRkZl?=
 =?utf-8?B?cWlJSUxnMjVhOXpubmtaQUphNjBNRFFNSmZZZXpjcHhLT1NpaHgxTFJsd2ov?=
 =?utf-8?B?M3Y3RXNGazYyNk9PVGhITTNWZ1RlTU1xUVBZcllHamsvc2VaVW8rMjlOay9S?=
 =?utf-8?B?ZUt4Q1kxbWROWHlFL29BcnlEYk1raG5pLzRuR2JZQmZxeDJzSEMzelYySFkw?=
 =?utf-8?B?RmhPdmRCQmNBOTNWM2R4Qk9WRGxiOFFaOUFxeEJNSy9naWUvRXN0d3BmNHQ2?=
 =?utf-8?B?RG9uU3UxRE1meHBScjhORjRhblAwVHhYN0oxSzhmTmdxRmNqZitSSitpSGor?=
 =?utf-8?B?T3o4dnc3VHhTZjd1WlMwNStuZGEyUG1XQ05sN2NnTVlnT3AxYjNPWHZ0ZnF6?=
 =?utf-8?B?aWNTbG5SU0ZYNzJrN3VGTVNRdnlBSm94V0wwOUZwRkZ6aFVKa1ZkMjlLL3Zt?=
 =?utf-8?B?dnIvd2w0S0NrOVhhblhWejRHT0VUVmtxRVJKYjRzYnJKZ3FJNXhyaTZHaFdz?=
 =?utf-8?B?QmttWmliWHYvYS84amxQaEZxUzFDUHJSeFZqcWd6aHRXcDVZY3VRdk8wYXZi?=
 =?utf-8?B?YVpnMHRPTXlhRnU1VVc3cld1R0F6SHV4TGF0YVRseldteHNreDBTMWlCUlNB?=
 =?utf-8?B?TDlUSXJqQUpuQkJIU3dOMXZXQTVGUnd0TWxhbndXd24rM0ovYXRLQzQzWkM2?=
 =?utf-8?B?eTQxR09lUE9pTnI2eDBibFhvKzlMZFN4VzZZMVhxb01nTnJSNVF5TFcxa01U?=
 =?utf-8?B?LzRVYXdmN1Bydk9SMlFKVWRzUWNwK1oxWEx5THM0M0l5TnpGR3VRSTdkMDNG?=
 =?utf-8?B?S0xsV0VIVU1YTFd5NzNMZ01uSlBEaTE5T0lhckdRWWRjUGpCV1g2TTB2dWhM?=
 =?utf-8?B?Mjc2empzaEdGNHNkUnlWRUFPcStlN3pTWE0vcDRObGJQdGkwbHRrNHJkb0Zi?=
 =?utf-8?B?ZnN5SlkvQmNTOXQxMTBlcUNBZnVjaE4vc25NbzFFTGFKU2NPd1VkL09HTzJS?=
 =?utf-8?B?d2hjYUROa1dBTms3YWpOVkdJbkx1bERHenBlaTRUc1lnald4d2h1QUVEd0Mr?=
 =?utf-8?B?WG9BMk9ocHRiOWVjUVg5UDNmaENJTUdrN3dmZFVjbmlDeFlTNHpQVDEyblJN?=
 =?utf-8?B?QW1tMGpSU2dhOWpHOVI3SmYvcXVzb1ZvdGRId2VRZmM1dTlEaWRaM3IyblZl?=
 =?utf-8?B?U3RRR01OS1I2bW5zSGNDVkRkSDRibWNHNEpMSGhHQ0pIVGJ6Ri8vQzRaZnVs?=
 =?utf-8?B?UjlxamtiTDc5cWZONnZMU1hpcUd5TURZcExiLzVPMk83Z3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3FhQWc5cFNjb2I3RTNxZlVkVTJ2OVN5cTl2Umc0VkZ2NTBSN01OeGhGbUZz?=
 =?utf-8?B?eFBwQitzVEk4eE5oQUFna3UxY0ZpbkdFaS91VGYzV29QaHk5cEpFSXU3MFZj?=
 =?utf-8?B?bEg4VUYzQm9FUUhUS1M4WXBqdVVYczVGQllCL0FpUlhYTzZrOEdvbmFTREVn?=
 =?utf-8?B?d1pTSlBjNFR5Wnk5NU9lU3lhNHp1VFQrbzlOZjc0cmxBQy9LR0RtTWpUckVT?=
 =?utf-8?B?dDJmSXRNdVdhclUzTE5HaUh2dDNyZ2twMzYxYWtHYjJRdXRWcWlRakFiVG10?=
 =?utf-8?B?TnlBQlBvUEkvUWJtdElqVHRIMzQ4QjUwamZra1hwR0RVTWJUeGd5N2NpVm40?=
 =?utf-8?B?RkZKaUc2WmhPZmlvTFZ1eGhPSEc5OGlUYlBiWDhWaXVaQUozSDJhRmNDbjU2?=
 =?utf-8?B?U0RpK21ZYTdUQWtubCtpZ1pVRE1qYjFSUTZvc09UVUl3TktNTUJ1RnQ5ZEdM?=
 =?utf-8?B?Z21LSTZpeU10b3B5d3hsMU9hR2dhS1RIK3o3cXFaVExUUDZJRUdaY09Uc1Ev?=
 =?utf-8?B?b24vNER6YVJIYW5WcXFaOUFwMmhTVllTcmFYNUJPMzdyeXAzYUxmUzlxaE1m?=
 =?utf-8?B?aGRLdU1qQ2pEblN1c0FNNU4wNXAyUTh3V0xJNHFSUVdaY0o5Q0VmaDNtVmZO?=
 =?utf-8?B?V0UwVE53d01OVVFRdEZ6aDBIMmN2cGphV09lL1QrZHdOT0w2aWYwMlVpM0c5?=
 =?utf-8?B?NVdETTZ0Q0l4UlZ1RlpQSVlWSHQ2L0dGK1MvNGh2OC9TWTRBVmVIbmROdHA3?=
 =?utf-8?B?T3ZDZ1h4K1JncjVYaExsZWVUNlRISmx0d0VaWWhWYjErUzVjcE5wSDBFQ2Qy?=
 =?utf-8?B?YzBkcGlrYXh1S0NmcUN6SkFIWHh3eitTQlQxTHZVRUlOSG1HVG54bzVwOG14?=
 =?utf-8?B?UFRpT01PL2VDU1NIblhhVUU4Z3J3WVFaOUhLdGxja01PdmgzTHVyYVVIS1VB?=
 =?utf-8?B?WUZiejJjaGZEdUxZQ2ZTMzBRc3dmRTNTL1Yva1JKbHhtUFhiMDlQNlh0b3JX?=
 =?utf-8?B?SXNXTm8yWVlwbWY2dEdBYjlpNG9VenBUMGlPTUk5dy9ZdjJrejErNVlBenBY?=
 =?utf-8?B?Uy9uellFcExieXdvVXFtZlFDb0dkOUlWeDgxbFE1eWhhYmt5a2gxSTJNMC9X?=
 =?utf-8?B?TWxoUFYwZnZLZEV1RlZkM25hRE1VSDFibUM0dDd3dlNuSmpyYjBmMUVZaG1Y?=
 =?utf-8?B?TzFJY044VHNoYURUeXBFWktmcHRJTjVVU1hkcDhjYlJBWGhpYXFGeFEvKyt3?=
 =?utf-8?B?UE1jQnNlSDRLeU1jVTZJVFo4Y3g0TTZ2YzNnTVNrOXMvWGR2TGpLT0RnREhO?=
 =?utf-8?B?bmxJUUk2TEZFZDR5NzdyUTZwemRpMGJxakEyUHlha3l6ZmVSZkdPNEFZenR5?=
 =?utf-8?B?UUoxWk4yYkk1anh1OWZuUGpHbXFNVENwWGQ2SEh3VUNKRkZGUktqYmY4R3Ns?=
 =?utf-8?B?NWxNdWdIVlJUYmdRYUM4NVVWN250djVOcklrZ3UwSnJ0Vzc1cy9qcE5UKzhD?=
 =?utf-8?B?dGJvTE1RSXhjaU5ha0RLeUF5aEZCL1JqajFHQTQ4QllFeTEySEtZYlpqRXA5?=
 =?utf-8?B?QWNiNEJLRys2ZDczK2djcTVHT1Q2U3FHdjErcnN0bVNFVEVrQVMrYmVQckhm?=
 =?utf-8?B?K08ydHRJVUpKdDRIaDNlYlNKSjlpc04xOCs4RFhiV1VucWxmTnZUN2wyUmtJ?=
 =?utf-8?B?U2gxWTJtUHJ4b3pYdDYyMTFxY1JlZGRJbk1waUViMEJJOUxYYnVmZXlsTnF0?=
 =?utf-8?B?UmF1c3B4WGN5VGJ2V1pMUWZTenVNNmdDRzhZTkZvcGdNUmtjZ2NzcUNMZmk2?=
 =?utf-8?B?U3JxZ240TGIySlNDc1lmM3ZsSHRaMThvMkwzb2ROVm1MV1JreHE2RUw2UmtY?=
 =?utf-8?B?RFpOLzdpN1NpYzdKUUhaRC95WHlMc1QwcjQzOVUzdnlEUnp4VThxNGdzV2lP?=
 =?utf-8?B?VGF5SzNnUkV2TXAvRzVRdTVhU1lzNW03V1dQSk53WXhLY0lBVExxSnpiMCsw?=
 =?utf-8?B?QWdQWlZ2Z2l4WEhhRzkyNUVMbU1TYW5rbldHUWxxT3Z3eVNXRUxTaHliUnN4?=
 =?utf-8?B?T00zeGVtWUhCTUNLU0xqS1hYMGh6SnAvT2tIeVlaYk1JL3NsdVNCZXVvSURk?=
 =?utf-8?B?Zm5GNGtyNXlhT1hlYnVvZ0Vld0hiZVNXOEk2SWhHai9uQ1VESHJOTzA3dktM?=
 =?utf-8?B?enc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fab3a96-dc88-4710-7adc-08de3e791472
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 21:04:48.9509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4tnpwZPWMwZvV6adrEoAUVtGd8zOuAEBWuncENYmXJn0X8CAfrbm6MLhM/4G8yAXc4mft6x5N0wUa7yu/o7yb1LA/InHq2tbKZMLKn+iYb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7335
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



On 12/18/2025 2:53 AM, Vinay Belgaumkar wrote:
> Move enable/disable GuC RC logic into the new file. This will
> allow us to independently enable/disable GuC RC and not rely
> on SLPC related functions. GuC already provides separate H2G
> interfaces to setup GuC RC and SLPC.
> 
> v2: Comments (Michal W), remove duplicate c6_enable calls from
> xe_guc_pc.
> 
> v3: Clarify crosss interactions between xe_guc_rc and xe_guc_pc (Michal W)

nit: change log could be under ---

> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile    |   1 +
>  drivers/gpu/drm/xe/xe_guc.c    |   5 ++
>  drivers/gpu/drm/xe/xe_guc_pc.c |  70 +++--------------
>  drivers/gpu/drm/xe/xe_guc_pc.h |   1 -
>  drivers/gpu/drm/xe/xe_guc_rc.c | 138 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_rc.h |  20 +++++
>  drivers/gpu/drm/xe/xe_uc.c     |   8 +-
>  7 files changed, 182 insertions(+), 61 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.c
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 6ecba27d85f7..90f86ad11498 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -74,6 +74,7 @@ xe-y += xe_bb.o \
>  	xe_guc_log.o \
>  	xe_guc_pagefault.o \
>  	xe_guc_pc.o \
> +	xe_guc_rc.o \
>  	xe_guc_submit.o \
>  	xe_guc_tlb_inval.o \
>  	xe_heci_gsc.o \
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index f0407bab9a0c..d05380893f39 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -35,6 +35,7 @@
>  #include "xe_guc_klv_helpers.h"
>  #include "xe_guc_log.h"
>  #include "xe_guc_pc.h"
> +#include "xe_guc_rc.h"
>  #include "xe_guc_relay.h"
>  #include "xe_guc_submit.h"
>  #include "xe_memirq.h"
> @@ -865,6 +866,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>  	if (ret)
>  		return ret;
>  
> +	ret = xe_guc_rc_init(guc);
> +	if (ret)
> +		return ret;
> +
>  	ret = xe_guc_engine_activity_init(guc);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index e2e6edb851ae..e7c90b6244e0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -76,7 +76,6 @@
>   * exposes a programming interface to the host for the control of SLPC.
>   *
>   * Frequency management:
> - * =====================
>   *
>   * Xe driver enables SLPC with all of its defaults features and frequency
>   * selection, which varies per platform.
> @@ -86,12 +85,20 @@
>   * thus saving power. Base profile is default and ensures balanced performance
>   * for any workload.
>   *
> - * Render-C States:
> - * ================
> + * Render-C States (GuC RC):
>   *
>   * Render-C states is also a GuC PC feature that is now enabled in Xe for
>   * all platforms.
>   *
> + * The implementation for GuC Power Management features is split as follows:
> + *
> + * xe_guc_rc:  Logic for handling GuC RC
> + * xe_gt_idle: Host side logic for RC6 and Coarse Power gating (CPG)
> + * xe_guc_pc:  Logic for all other SLPC related features
> + *
> + * There is some cross interaction between these where host C6 will need to be
> + * enabled when we plan to skip GuC RC. Also, the GuC RC mode is currently
> + * overridden through 0x3003 which is an SLPC H2G call.
>   */
>  
>  static struct xe_guc *pc_to_guc(struct xe_guc_pc *pc)
> @@ -253,22 +260,6 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
>  	return ret;
>  }
>  
> -static int pc_action_setup_gucrc(struct xe_guc_pc *pc, u32 mode)
> -{
> -	struct xe_guc_ct *ct = pc_to_ct(pc);
> -	u32 action[] = {
> -		GUC_ACTION_HOST2GUC_SETUP_PC_GUCRC,
> -		mode,
> -	};
> -	int ret;
> -
> -	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> -	if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
> -		xe_gt_err(pc_to_gt(pc), "GuC RC enable mode=%u failed: %pe\n",
> -			  mode, ERR_PTR(ret));
> -	return ret;
> -}
> -
>  static u32 decode_freq(u32 raw)
>  {
>  	return DIV_ROUND_CLOSEST(raw * GT_FREQUENCY_MULTIPLIER,
> @@ -1050,30 +1041,6 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
>  	return ret;
>  }
>  
> -/**
> - * xe_guc_pc_gucrc_disable - Disable GuC RC
> - * @pc: Xe_GuC_PC instance
> - *
> - * Disables GuC RC by taking control of RC6 back from GuC.
> - *
> - * Return: 0 on success, negative error code on error.
> - */
> -int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
> -{
> -	struct xe_device *xe = pc_to_xe(pc);
> -	struct xe_gt *gt = pc_to_gt(pc);
> -	int ret = 0;
> -
> -	if (xe->info.skip_guc_pc)
> -		return 0;
> -
> -	ret = pc_action_setup_gucrc(pc, GUCRC_HOST_CONTROL);
> -	if (ret)
> -		return ret;
> -
> -	return xe_gt_idle_disable_c6(gt);
> -}
> -
>  /**
>   * xe_guc_pc_override_gucrc_mode - override GUCRC mode
>   * @pc: Xe_GuC_PC instance
> @@ -1217,9 +1184,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  		return -ETIMEDOUT;
>  
>  	if (xe->info.skip_guc_pc) {
> -		if (xe->info.platform != XE_PVC)
> -			xe_gt_idle_enable_c6(gt);
> -
>  		/* Request max possible since dynamic freq mgmt is not enabled */
>  		pc_set_cur_freq(pc, UINT_MAX);
>  		return 0;
> @@ -1257,15 +1221,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  	if (ret)
>  		return ret;
>  
> -	if (xe->info.platform == XE_PVC) {
> -		xe_guc_pc_gucrc_disable(pc);
> -		return 0;
> -	}
> -
> -	ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
> -	if (ret)
> -		return ret;
> -
>  	/* Enable SLPC Optimized Strategy for compute */
>  	ret = pc_action_set_strategy(pc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
>  
> @@ -1285,10 +1240,8 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
>  {
>  	struct xe_device *xe = pc_to_xe(pc);
>  
> -	if (xe->info.skip_guc_pc) {
> -		xe_gt_idle_disable_c6(pc_to_gt(pc));
> +	if (xe->info.skip_guc_pc)
>  		return 0;
> -	}
>  
>  	mutex_lock(&pc->freq_lock);
>  	pc->freq_ready = false;
> @@ -1310,7 +1263,6 @@ static void xe_guc_pc_fini_hw(void *arg)
>  		return;
>  
>  	CLASS(xe_force_wake, fw_ref)(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
> -	xe_guc_pc_gucrc_disable(pc);
>  	XE_WARN_ON(xe_guc_pc_stop(pc));
>  
>  	/* Bind requested freq to mert_freq_cap before unload */
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 0e31396f103c..1b95873b262e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -15,7 +15,6 @@ struct drm_printer;
>  int xe_guc_pc_init(struct xe_guc_pc *pc);
>  int xe_guc_pc_start(struct xe_guc_pc *pc);
>  int xe_guc_pc_stop(struct xe_guc_pc *pc);
> -int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
>  int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode);
>  int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc);
>  void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p);
> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.c b/drivers/gpu/drm/xe/xe_guc_rc.c
> new file mode 100644
> index 000000000000..321a071b7932
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_rc.c
> @@ -0,0 +1,138 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <linux/device/devres.h>
> +#include <drm/drm_print.h>
> +
> +#include "abi/guc_actions_slpc_abi.h"
> +#include "xe_device.h"
> +#include "xe_force_wake.h"
> +#include "xe_gt.h"
> +#include "xe_guc.h"
> +#include "xe_gt_idle.h"
> +#include "xe_gt_printk.h"
> +#include "xe_guc_ct.h"
> +#include "xe_guc_rc.h"
> +#include "xe_pm.h"
> +
> +/**
> + * DOC: GuC RC (Render C-states)
> + *
> + * GuC handles the GT transition to deeper C-states in conjunction with Pcode.
> + * GuC RC can be enabled independently of the frequency component in SLPC, which is
> + * also controlled by GuC.
> + *
> + * This file will contain all H2G related logic for handling Render C-states. There are
> + * some calls to xe_gt_idle, where we enable host C6 when GuC RC is skipped. GuC RC
> + * is mostly independent of xe_guc_pc with the exception of functions that override the mode
> + * for which we have to rely on the SLPC H2G calls.

nit: I guess we try to fit comments in regular 80 columns, and only let the code go up to 100

> + */
> +
> +static int guc_action_setup_gucrc(struct xe_guc *guc, u32 control)
> +{
> +	u32 action[] = {
> +		GUC_ACTION_HOST2GUC_SETUP_PC_GUCRC,
> +		control,
> +	};
> +	int ret;
> +
> +	ret = xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> +	if (ret && !(xe_device_wedged(guc_to_xe(guc)) && ret == -ECANCELED))
> +		xe_gt_err(guc_to_gt(guc),
> +			  "GuC RC setup %s(%u) failed (%pe)\n",
> +			   control == GUCRC_HOST_CONTROL ? "HOST_CONTROL" :
> +			   control == GUCRC_FIRMWARE_CONTROL ? "FIRMWARE_CONTROL" :
> +			   "UNKNOWN", control, ERR_PTR(ret));
> +	return ret;
> +}
> +
> +/**
> + * xe_guc_rc_disable() - Disable GuC RC
> + * @guc: Xe GuC instance
> + *
> + * Disables GuC RC by taking control of RC6 back from GuC.
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_guc_rc_disable(struct xe_guc *guc)
> +{
> +	struct xe_device *xe = guc_to_xe(guc);
> +	int ret;
> +
> +	if (xe->info.skip_guc_pc)
> +		return 0;
> +
> +	ret = guc_action_setup_gucrc(guc, GUCRC_HOST_CONTROL);
> +	if (ret)
> +		return ret;
> +
> +	return xe_gt_idle_disable_c6(guc_to_gt(guc));
> +}
> +
> +static void xe_guc_rc_fini_hw(void *arg)
> +{
> +	struct xe_guc *guc = arg;
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_gt *gt = guc_to_gt(guc);
> +
> +	if (xe_device_wedged(xe))
> +		return;
> +
> +	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
> +	xe_guc_rc_disable(guc);
> +}
> +
> +/**
> + * xe_guc_rc_init() - Initialize GuC RC
> + * @guc: Xe GuC instance
> + *
> + * Initializes GuC RC feature.
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_guc_rc_init(struct xe_guc *guc)
> +{
> +	struct xe_device *xe = guc_to_xe(guc);
> +

should we care about xe_device_uc_enabled() like we have below?

> +	if (xe->info.skip_guc_pc)
> +		return 0;
> +
> +	return devm_add_action_or_reset(xe->drm.dev, xe_guc_rc_fini_hw, guc);
> +}
> +
> +static int xe_guc_rc_enable(struct xe_guc *guc)
> +{
> +	return guc_action_setup_gucrc(guc, GUCRC_FIRMWARE_CONTROL);
> +}
> +
> +/**
> + * xe_guc_rc_start() - Enable GuC RC feature if applicable
> + * @guc: Xe GuC instance
> + *
> + * Enables GuC RC feature.
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_guc_rc_start(struct xe_guc *guc)
> +{
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_gt *gt = guc_to_gt(guc);
> +
> +	xe_gt_assert(gt, xe_device_uc_enabled(xe));
> +
> +	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
> +	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FW_GT))
> +		return -ETIMEDOUT;
> +
> +	if (xe->info.platform == XE_PVC)
> +		return xe_guc_rc_disable(guc);
> +
> +	if (xe->info.skip_guc_pc) {
> +		xe_gt_idle_enable_c6(gt);
> +		return 0;
> +	}
> +
> +	return xe_guc_rc_enable(guc);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.h b/drivers/gpu/drm/xe/xe_guc_rc.h
> new file mode 100644
> index 000000000000..2500b0d1c151
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_rc.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_GUC_RC_H_
> +#define _XE_GUC_RC_H_
> +
> +#include <linux/types.h>

still not needed

did you miss [1] ?

[1] https://patchwork.freedesktop.org/patch/694838/?series=159128&rev=1#comment_1276769

> +
> +#include "xe_guc.h"

still not needed

> +
> +struct xe_gt;

still not needed

> +struct xe_guc;
> +
> +int xe_guc_rc_disable(struct xe_guc *guc);
> +int xe_guc_rc_start(struct xe_guc *guc);
> +int xe_guc_rc_init(struct xe_guc *guc);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 157520ea1783..91eaddad331e 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -14,6 +14,7 @@
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_guc.h"
>  #include "xe_guc_pc.h"
> +#include "xe_guc_rc.h"
>  #include "xe_guc_engine_activity.h"
>  #include "xe_huc.h"
>  #include "xe_sriov.h"
> @@ -216,6 +217,10 @@ int xe_uc_load_hw(struct xe_uc *uc)
>  	if (ret)
>  		goto err_out;
>  
> +	ret = xe_guc_rc_start(&uc->guc);
> +	if (ret)
> +		goto err_out;
> +
>  	xe_guc_engine_activity_enable_stats(&uc->guc);
>  
>  	/* We don't fail the driver load if HuC fails to auth */
> @@ -246,7 +251,8 @@ int xe_uc_reset_prepare(struct xe_uc *uc)
>  
>  void xe_uc_gucrc_disable(struct xe_uc *uc)

again, do we really need this as separate uc call?

>  {
> -	XE_WARN_ON(xe_guc_pc_gucrc_disable(&uc->guc.pc));
> +	xe_gt_WARN_ONCE(uc_to_gt(uc), xe_guc_rc_disable(&uc->guc) != 0,
> +			"Unable to disable GuC RC for gt: %d", uc_to_gt(uc)->info.id);

again, can't we have this in xe_guc_rc_disable?

>  }
>  
>  void xe_uc_stop_prepare(struct xe_uc *uc)

