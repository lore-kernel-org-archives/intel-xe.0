Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615FEC4345F
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 07:13:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C371A1121A3;
	Mon,  6 May 2024 07:13:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ibOvEOH1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A82EC1121A3
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 07:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714979580; x=1746515580;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=b8A+QnCj+bO/b56aHzwRd69Poyxhuz3KoTydNfSFCvQ=;
 b=ibOvEOH1CkJKtaQiR2lmGOENfBxYE4BWRRsX4PSl/bl/00hk29x0QJql
 xnryM/P/JxWEy39KfB4iDYWd7J66e+qxuOfk3ybaLuZZQyJbUSl1rYF3L
 21Zh/6Hc8f76A4yJsITtmm0z6BNbiqVnXBgR7bifSkYoEJ+10Spx7xpDD
 us7Obr2adHgaV8MnTvBNUzQXsyuS1mG6hALlv5UCP7zuSoUfvykKIYzlz
 zrOStCAIktAJQ0gitQ7IfT99WH1W8zOH6+PVIuoFo0ceDMuA6pgM0BVbW
 UOz9O90e1I3oxK6kxLLe5CXKhi0zEIXEC0mxjsYBpF3jEIH2dL0i4/foU A==;
X-CSE-ConnectionGUID: rX7vRDQcTHamAvDbkwnuWw==
X-CSE-MsgGUID: UxxHcbc5Rq6dbHUYM0GaVg==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="10836112"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; d="scan'208";a="10836112"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 00:13:00 -0700
X-CSE-ConnectionGUID: VJrAipP9Q7iEv3pGQPwGgQ==
X-CSE-MsgGUID: wN+JujPzQTmwIYfIe39Sew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; d="scan'208";a="28088476"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 May 2024 00:12:58 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 00:12:57 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 00:12:56 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 6 May 2024 00:12:56 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 6 May 2024 00:12:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nWpOFWmS1BvYYJtw9q40LDZySI0Uk8pKTbx+6dKysEW5jp6aCzI4bHFpTpg5FDayAYwWUvjXZFZZKeKROPzaDcYDQUgaXbfaQ7iq16REWoEAKdCq08Z1yMwrAmZVaweEHLAu9t7zPqqQ9hUQXM1rbXlihDXp1hupxwJqsWUywxhwyTkqZs/9CYun0oBFVpvpmghgeMS/HxXSLvtVWhP7ihKehJSYzL/7xiJ2f0/qnzKlhN0132WbXKkgyEVkqFm5YOYkA9OxPhBfsZqzj2+vwcQbOxjq4q1yPf5wBV11rSEorGxZ6FcueRkbJq4XQPtZfS6nVRki/YBQxsSDlLHwrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YPDMGxeIe9buHql418WY0d+zQdoEnbzDLFnQEifL1Hk=;
 b=mqFtIlT6P2h/GAhuO9pQm89Y17vuIGaeT2HIrNQ/U3wftZOP4TG9RM7Wyx7QYolX7mprwcR518OZD55qq7Y+I/m+psj6m5m34AKEzMD50+bVpcCUYOQxBkuDDSpSPcPeO/s6Gn/n2eYanjvsz50GO43bqY8P49YGRmBPM1PVjagqc8x5SNgaFO3VtIqcrsZ+Cv3VBtpMBE0Fe7YVS4PTZn59hE82q/uvJIHFLW2Eg6wvGugZNYmo2X9hGH3c/NrSIXBJvxO6UqAXOXpB5n1I9Vzlxc9E6U5wgiqSytGx0UUGF+UV4rfYtn3pATpN7YTKIq4tMEL1kTh+9wvH7y+ifQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by DS0PR11MB7902.namprd11.prod.outlook.com (2603:10b6:8:f6::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.41; Mon, 6 May 2024 07:12:54 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::3bc7:767d:bb72:a6d0]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::3bc7:767d:bb72:a6d0%7]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 07:12:54 +0000
Message-ID: <72c32248-a381-41a9-8504-4f07b3f60b2b@intel.com>
Date: Mon, 6 May 2024 10:13:36 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/5] Refactor default device atomic settings
To: Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>, "Brian
 Welty" <brian.welty@intel.com>, Fei Yang <fei.yang@intel.com>, Jose Souza
 <jose.souza@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Matthew Brost
 <matthew.brost@intel.com>, Michal Mrozek <michal.mrozek@intel.com>, Oak Zeng
 <oak.zeng@intel.com>, Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
References: <20240430162529.21588-1-nirmoy.das@intel.com>
 <6fbb932b-9525-4fce-9376-30f422da703d@intel.com>
 <7e379db6-3b3d-4129-8254-29ed548408d5@intel.com>
Content-Language: en-US
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <7e379db6-3b3d-4129-8254-29ed548408d5@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::24) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|DS0PR11MB7902:EE_
X-MS-Office365-Filtering-Correlation-Id: b1eea27d-16e3-4af8-2259-08dc6d9bf2ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0o4dE9HQzc3UzhSR1ZyendLOUJRL3kxOEwyL1RNYzUyTHNScFk1b0U0WjU0?=
 =?utf-8?B?WVY3c3pFSE96RTJOYWpXamNxMHRZd1ZWNWc5czAxRWVUWCtCeHNLekZyNkkw?=
 =?utf-8?B?Snd2UFdQVVZ5cDZQanUzNHJrS1l5SUh6WllycCtCUG1OZ1Y3ZklqejBEYk5q?=
 =?utf-8?B?T2FwZkxsKzI2NlNjYzNWRXYwODd1Nk1XaE9UNmZYUXVoRE1pdzM3QlM5Mi9W?=
 =?utf-8?B?MUg0MnVNZm53b3lpTlhteU0reHdmM1VNbmgzL2Rpdm9xK3AzUDVKVWxrNXJq?=
 =?utf-8?B?OXdYMHlMaHhMYWxhZUN5N3duVEtkWkYwMDcvWlNVM1o5T3BPQ21IcTJZQ2cx?=
 =?utf-8?B?dVdjRUVwZHZKM1NlVlloVU0yN1ZsakxCS3ZJM21kMUFOWldNaEtpZjNicmFC?=
 =?utf-8?B?SFhncE9lb0JSNXFOWW9HN29NVEtjQXBpMzQ2V2VNUEZmd1dUcGRETm5LMG8v?=
 =?utf-8?B?ajdjOTFKUHhtZmppMkdjeXFmUHNzdUxBdFEvVEpvZkF2NHNKS0psaWllOGs0?=
 =?utf-8?B?Ulp2RXI1dTdGYUlZNTFQY0swMnF5ZjJRcjhjMEFTd2RMdm1GMjREdU94SmRM?=
 =?utf-8?B?bGZPVXgvTDR1MzBHRHRJbjd2Vm9teEZtMFFNY21wZ1BGZml6T3I5YWNEVmJI?=
 =?utf-8?B?SEZHejY5RHhpUG1TMyt2dG9CYnNTTWUrRFhRSDZMTVF1ZGRFTUViVnVyME01?=
 =?utf-8?B?eGNvWlAvQVZMRXdOU2tDcU5MTWJ2ZUJWV2N3Y3ZnMzlaQWt1NnA0dHBMMkor?=
 =?utf-8?B?MEN5cnJlVTV2TkZZL29tbDhJNFppcngwMHR4VU9XV2RxcXJUd0RjNkNUTnRI?=
 =?utf-8?B?VzJiMVdkNEZtRjd6R2s3UTFVL252MDlZNGU5bC9FbWtXR1o5U3RydnpHbmI5?=
 =?utf-8?B?Y1N2VVdTUkwydW9WeUcrOWNNcGFRYTFzdGg1ellhN2ZlZnJrSURQS2VNS1hn?=
 =?utf-8?B?ZVhZQlYrRHc3cGV1SFZxaUNBOVIzeG5SdkJtMHJ0SHczbnAxeFcwRnd5REhD?=
 =?utf-8?B?emw1MlNVenJvWVpxMG0wRUY5M09DSHhNZG90b0QyS0NUUUJQRGFCRWVQaWx6?=
 =?utf-8?B?LzA3RW1SV09Qb3gyWmNuT091NjlQcC9lYlV4YjlOdDZRNzBwZ2IxS09KMUVZ?=
 =?utf-8?B?T2dhWXVzRkN5WXJYL3VVbnhDaDFIVGxuMFpUeEptQ0dJLzIveENRclhqTzIr?=
 =?utf-8?B?cGdDWnZ4RzZNVHpaUUhnMEVlZkdTSjZVS2N5RHF1ZFNoRFFIa2pvNHRuMHNm?=
 =?utf-8?B?cFhPbVJWZUltQTA5cUdrWFNBUlVMbWM3OGpMY0F0LzVTQ2hKNFNrRTJSUkoy?=
 =?utf-8?B?cTRTc1F3TjFXZnI2azZhaFhIMmxDWUFMT056Wkh3ZGdjckdqKzUycnVZb3hI?=
 =?utf-8?B?SkM1dW9XR0RWYTFvMDNaR0lOSml5ZC83VmpUVm9Lb1p6aGVTdU5sRmdseWE2?=
 =?utf-8?B?ZmxGTlFXVnY3Vy9HQWU1ZkZDbEsvM3VITWRocDJOTUo5K0J4SVExNEsrSW9F?=
 =?utf-8?B?dUlBYjdvOUZ0VnNyU3JrUGlWYVAwTDN4bEhVSkFmaEE4OERPa3hlUnl4dlJR?=
 =?utf-8?B?SCttbmhhdkFuNXFtMDgzNVRxNkVOU2luZ1NYREc5NVFCcnM3bjkyMTlwNWRo?=
 =?utf-8?Q?NWPJReDdMPVlwNpliPRJzI+uaSXPgt+RK4s06h7crFe4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDFDcjZLK1BTZDdLcTBKUmhyTUJSQnBwbmVOZW1IQlhzbVBQcG1yTThxVFRs?=
 =?utf-8?B?Snp2UFhlQXZ5NzJQcGlkampnV1MzS0M1UktTcmtBNW1jOTVNQWpXTW41SE80?=
 =?utf-8?B?bWpvbEFMVGxQbjNLZ2dqUFhuejU5SlFUdllkWlRMQ2hEU3cwSnp3RVVXdWx1?=
 =?utf-8?B?RzhhNEdkVFQ0eU1yT3hDa3JYY3IyK241c0pSemFoT3lZVmk4ckZjd3RpSHpp?=
 =?utf-8?B?dTZBVHFxM0NSc0FWbGRqL3crdnhEdDRpd0RndXNuSFprOXVhNXl6eFpqNE52?=
 =?utf-8?B?Zm9jZG94d3M0NktmSGNlUW9URmdmdHE2Z1BtbHJiaG1ZWjhhVGVHcWJRWmVR?=
 =?utf-8?B?TzIzemkzQjROaGRZY1k2YThjNzhBVHVvVVMvUC9sZ1Q2cG9XblYrd0tGRUkx?=
 =?utf-8?B?SnIyYTQzTlRpSXhhOU1FRkV4Nyt0clBFQzVHOXBBeXp6L2NLWXJ5QW1JVVg3?=
 =?utf-8?B?aTlnVURJWXJmZHdIdnNEbEZhM043UVc2UkNPd1E1T3NhN290b1kwbUVWT3hX?=
 =?utf-8?B?clBzQ2t0RTUzZGQ3S3ROZG16ZkxubXFhMEdtbUxndHhDRUw5UHd0UHlRUE1Q?=
 =?utf-8?B?UEhJMlRvTU44bmIvZ0U2ZG5tQ25GNGhxek1CRURCSzlaOThpdkI3Z0hlOXJm?=
 =?utf-8?B?Vk9sUjNocVN3U1k5QzJ6SnUrai9xd09ONWdmQ1JFMHI3a01QclBKUzhqVUpH?=
 =?utf-8?B?R09QMEVEV2hnMENieTByL0FwMDY3RXExeTgySVZVRHE0SXJLZ0YvTDBlL0Vx?=
 =?utf-8?B?ekcxUlZFVXhMSU9zdFp3dk5ZWWNTbkRta2NjSEp2c3M3QjVuZlFVOHRGcEx2?=
 =?utf-8?B?MVE4QXpWNTZKaXoyUFZqdlJHNW1hQlg0TTZZUDBFTWx1dDdCaXo3QXYvS05U?=
 =?utf-8?B?bWFMV0lRbXNKaHc1c3lwNUJrZnpERm9nNFVKUmtzUENWcEZmWTNtdlpWR0M1?=
 =?utf-8?B?aVRPS0RLRXpFS2poT0xZN2U4WlQwMmNiV2Y2RnlZZFA1dHg2MUhpcitIUWdU?=
 =?utf-8?B?SFBEdW1YZjVrM0VRNkFaV2c2OHFiTnNPNDVkcVZFWTNPb2g4WWxDSzZWdWpn?=
 =?utf-8?B?cXNSeEdRRk9CTkNZY3dJdXV2LzJTM1ArQUsrRyt6S3REVlZkMk5CYmUxU2gy?=
 =?utf-8?B?ejJkV1luMTVNZ1JRV2RDU2tLT0gvdXJ6SGRvdWt4c1l0NmIveHRyempzWmN6?=
 =?utf-8?B?dFlVbEplN3ArMEE2V1Rxem5jb0o3NkllcWJtaXN3VEZCY096Y1JWTGllVXMz?=
 =?utf-8?B?SEpzc3ZkMGNCYXZFWXpjdDE0QzE0RTJFTEhIRk5tejk2RGptTWtJUUlQSVR2?=
 =?utf-8?B?V1lEc1BZOEttanVLMU5JUDNDZm5GV29EbGFHbGlIQ1krQWQzZFVRQWh6NmdR?=
 =?utf-8?B?NlZtbGRuSWdiQTExOGoxSCs0OXIrdStZVTZOWU04dWpJb1RkSHd6RDRMc2Vq?=
 =?utf-8?B?WHhGZkFxTCtRcXpwOVRaWVNQN0pEclBuWnhYTWFIbUhZSDRacDd1aGhPRjNW?=
 =?utf-8?B?dTlrU3pZMWplV0FFdHo2czIzT0V6NnRPTFRxclM0S1FESk5zVmNsL3BJdDNY?=
 =?utf-8?B?V3A0MUFaWlY2OEgwcmNMOHhoY1JoZjk1OW9iMU9sNFl3YzdqSStIczZua1o2?=
 =?utf-8?B?NHdaV2FnWjNuWDdYQytwZ3FQa01DR3NEbTU2YlpxcjVDUDNDU21ybVMweEwr?=
 =?utf-8?B?djllM0I1MW01Y3dEcjIvNkl3Tm13dkhsUDZRMHJ2THNzdkh0R0RtUUlnRmxT?=
 =?utf-8?B?MFJMZHNzWXpwWU9nUUNkMmgrWnN6UjFPdzRzNVdNc2xMWlFoRnovbjBOWGZS?=
 =?utf-8?B?RG9LM3pGMWFIWlR2R2diS01aOTkyY29ZWkZGV2ZrelV3N21zSitUdWs1N3Zo?=
 =?utf-8?B?YXBvU0hGMC9BeTJxYUF2d1kvRGVHazhQWXJLV2pKcXhwK0RHcDE4cVI1dWRQ?=
 =?utf-8?B?ck5NYm82U00rMzZ2SEdhaS81a3ZRbEFIYVpZbmlQQmtMbEJyYlM0cGt5RURU?=
 =?utf-8?B?ZTNKR0Qyb0E5bnQ2cStYT3JhdlF4V05HTXBLTkNDcWQxTC9wTGlia2dhOVZ5?=
 =?utf-8?B?UEh5dGV4QjZ3enRkL1RjZkhuYS9wTitnN3Jhc0U1QUZ2OXpvN2oyYXBRbHhV?=
 =?utf-8?B?cnBHOS9RcnNtdk9LUGMzKzNPYnFHK2dyZW5WRjdmUXlJQjNNSm04anUvSXB5?=
 =?utf-8?B?RHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1eea27d-16e3-4af8-2259-08dc6d9bf2ed
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 07:12:54.5048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S8/8jBF6mZZ8LjbQuQf+v+3wVgZeBBU0ueWm2aFQ1HG8Gq4gd++xk4pnINUL8YT+C7TZiyyboPkUDh/j/qPTNkkRSyFvsd9jrMOnNNepuIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7902
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

On 03/05/2024 12:54, Nirmoy Das wrote:
> Hi Lionel,
>
> On 5/3/2024 11:47 AM, Lionel Landwerlin wrote:
>> Hi Nirmoy,
>>
>> I've updated our Mesa MR for this : 
>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/28823
>>
>> But then I started to wonder if we needed to do anything at all with 
>> this v6.
>
> No, there is nothing to do for traditional APIs.
>
>
>> The only scenario I'm not sure about is this : a BO is created with 2 
>> placements LMEM+SMEM. When Xe migrates the BO from LMEM to SMEM due 
>> to LMEM pressure, does it set AE bit in the PTE?
>> And then if promoted back to LMEM, is the PTE config DM=1 and AE=0 
>> again?
>
>
> For traditional API( not using fault/LR VM) then both backend will 
> have AE=1, so on LMEM pressure if the buffer is backed by SMEM, it 
> will have AE=1 as well.
>
>
> Regards,
>
> Nirmoy


Thanks a lot Nirmoy.


Then I think with this series we should have everything working in Mesa 
without having to change a single line of UMD.


-Lionel


>
>>
>> Thanks,
>>
>> -Lionel
>>
>> On 30/04/2024 19:25, Nirmoy Das wrote:
>>> The default behavior of device atomics depends on the
>>> VM type and buffer allocation types. Device atomics are
>>> expected to function with all types of allocations for
>>> traditional applications/APIs. Additionally, in compute/SVM
>>> API scenarios with fault mode or LR mode VMs, device atomics
>>> must work with single-region allocations. In all other cases
>>> device atomics should be disabled by default. PVC needs special
>>> care as it doesn't support device atomics on SMEM.
>>>
>>> v6: Only check LR mode to determine compute API as fault
>>>      mode requires LR mode(Jose)
>>>      Set AE=1 on SMEM+LMEM allocation when a buffer is migrated
>>>      to LMEM from SMEM(Brian)
>>>
>>> v5: Fix broken atomics on PVC from v4 changes.
>>>
>>> v4: Previous assumption that device atomics should be disabled
>>>      by default on SMEM only BO was wrong as traditional applications
>>>      will not use such allocations for CPU atomics. So remove the
>>>      VM bind flag and the query uAPI and instead refactor default 
>>> device
>>>      atomics settings as per VM type and buffer allocations.
>>>
>>>
>>> v3: Capture ret value of xe_vm_bind_ioctl_validate_bo(Matt B).
>>>      Remove redundant coh_mode param from 
>>> xe_vm_bind_ioctl_validate_bo().
>>>      Remove has_device_atomics_on_smem from xe_graphics_desc(Jose).
>>>      Replace DRM_XE_QUERY_CONFIG_SUPP_DEV_ATOMIC_ON_SMEM with
>>>      config flag DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM(Jose).
>>>      Mention that PTE_AE will not be applied to userptr(Matt R)
>>>
>>> v2: Add BO helper func in xe_vm_bind_ioctl()(Matt B).
>>>      Use XE_IOCTL_DBG for checks(Matt B).
>>>      Move platform checks with help of adding flags in
>>>      intel_device_info(Matt B).
>>>      Add document for DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS(Matt B).
>>>      Create query uAPI for this newly added VM bind flag(Jose, Lionel).
>>>
>>> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>>> Cc: Brian Welty <brian.welty@intel.com>
>>> Cc: Fei Yang <fei.yang@intel.com>
>>> Cc: Jose Souza <jose.souza@intel.com>
>>> Cc: Lionel G Landwerlin <lionel.g.landwerlin@intel.com>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Michal Mrozek <michal.mrozek@intel.com>
>>> Cc: Oak Zeng <oak.zeng@intel.com>
>>> Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
>>>
>>> Nirmoy Das (5):
>>>    drm/xe: Introduce has_atomic_enable_pte_bit device info
>>>    drm/xe: Move vm bind bo validation to a helper function
>>>    drm/xe: Introduce has_device_atomics_on_smem device info
>>>    drm/xe: Add function to check if BO has single placement
>>>    drm/xe: Refactor default device atomic settings
>>>
>>>   drivers/gpu/drm/xe/xe_bo.c           | 14 +++++
>>>   drivers/gpu/drm/xe/xe_bo.h           |  1 +
>>>   drivers/gpu/drm/xe/xe_device_types.h |  4 ++
>>>   drivers/gpu/drm/xe/xe_pci.c          |  5 ++
>>>   drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
>>>   drivers/gpu/drm/xe/xe_pt.c           | 37 +++++++++++--
>>>   drivers/gpu/drm/xe/xe_vm.c           | 79 
>>> ++++++++++++++++------------
>>>   7 files changed, 103 insertions(+), 38 deletions(-)
>>>
>>

