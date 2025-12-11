Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98D7D41C24
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 18:20:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8275010E815;
	Thu, 11 Dec 2025 18:20:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Az4QchwK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB51210E56B
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 18:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765477246; x=1797013246;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=1q9CA/qqc7PNCrZ18Y5rvQwogw9YTDIpO9+3yGfwIOQ=;
 b=Az4QchwKnlI/sAjm7M8Ae/SNjskhMGpER8PbW9cifaNn5sZlri1DwLJx
 U6kls/u6q7/u1sHvPiDKuK1EZPbHiuzDo2109uQYa8p40biU+qJrrjFTw
 nDOT6mIGs1A8G44dUo7b7OPj1+Eq6AJwyHV9f/5l35d15SpV0wPxkea6C
 p2kECKNL3u3b+AbDJH7IN1isHD65+Sn8UEC9A+qAQDNwVuXpn8LUSd17X
 0NuPlkQSIMrIapiBD8HSXryloTwSaChx3Y5Cm/m3bkUePd58BvocPcYgD
 pguTI3lBBQzHzqpF+XKhXDUurnzM1RjEkg+DvnTcs/7k/lPfo5Hyfi757 A==;
X-CSE-ConnectionGUID: YvOzgo6RS+OSw2IpTrWlTA==
X-CSE-MsgGUID: GdjtZp6UQmWIgn/u9soezA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="66650524"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="66650524"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 10:20:45 -0800
X-CSE-ConnectionGUID: koHgQOQlQMSfYUu13VxKYg==
X-CSE-MsgGUID: LstrRdraSj+neVVKs8N95A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="201338976"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 10:20:41 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 10:20:40 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 11 Dec 2025 10:20:40 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.70) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 10:20:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ofv534Kvk9ycV2zYVYc78VV6WabiV78o0jjPTondcj4plbgA/aansEWOzOVNcAO/dlOLvRVJqFewniKEcneHNITFdW2XkG7Uc8uquNd39KftasHNLmEfUM6Xachf+OIKETlBVAeetaHvF6AhpB+snR+g38z6hVAhczWBWZv2OOOfd4qSqOmr8F/FljdPK5hhWTT4zn47N7wPEshE6Fov9y08skN2yIVyhklrxzkMsi2FywlSSMGItndIN43UP2W1AwGvAtFTvvgivtdaHjmExuyY+HlWcjKxYnJavVUQc4z4/v79BP+GNTUxmCrF5uTvu79JrsuqcZa3qlLq7m1YPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zY8+Tz6TR8OGiIsoh64ZopFcp0boJehBOuGTGYJJxhg=;
 b=PuvHMq/FEXMaE0cuhSWjjfijNZybdVveXoXKpoQCYuxAopID6U7KxBvH1654mOFUrD4E/owADbdgjvtomjQ3XJi3g5aCev40lsluDH5QvXhfKboWZUi2VWZWo5D19V/HeXdEBDGMiWpAPg0mG6UOBS2Q0HgRlWB0YDC1NmeUjhmMwpXRYlYQGRWLOoctFwosckK6vzOA3hP9fx55kIpnKBahRH1E3+Y0YVy9p1H+ig+0VOqqOHwOP3y5rEdbV0z17FVgh4ESC2maikQB9szSVOXdK3rQns2DaaXtbsApN9dmzWzYLzqf0DX9RWIdUe+kWVxjfL4zdVa+fpuv+eUoVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ5PPFD56E32CC2.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::859) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Thu, 11 Dec
 2025 18:20:37 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9388.013; Thu, 11 Dec 2025
 18:20:36 +0000
Message-ID: <677fa545-802c-4e49-8334-d2138bd185fb@intel.com>
Date: Thu, 11 Dec 2025 19:20:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] drm/gt/guc: extract scheduler-related defines
 from guc_fwif.h
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251211015700.34266-14-daniele.ceraolospurio@intel.com>
 <20251211015700.34266-16-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251211015700.34266-16-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::29) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ5PPFD56E32CC2:EE_
X-MS-Office365-Filtering-Correlation-Id: 2829e76f-f57c-4cb7-7392-08de38e1faa4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TEM1cEFkbnFVY3A5UUVwNVpkSzJ0YTZNV0l5UUdBT0NOQWZDNkh4MXNSV0lR?=
 =?utf-8?B?WjhsdDg3MG5VaWdaUEpFcmtHYVJmMVVXdmxSU3N6TUx5U1pRRVZ6QjBOMjFl?=
 =?utf-8?B?NVZVY2NtU3VhVlBrWlNmNVJMdjhObVU3T0tJUmR4aGJyS0l3YVA2bmJBb2tW?=
 =?utf-8?B?WFpKWUw5dDZjTkQ3ckNXYVpuRlk1V3Z2dkY2TjJINjYzMmxjVmZHNmxZUHhH?=
 =?utf-8?B?NmhTQ2doK1BhZ3RxcXVxWWJ3bDhYZ2tYQ2RkWTYva1R5TFRWWWdFQmhld0I1?=
 =?utf-8?B?ZDB0bDFHL2VmRjdLL1ZXTm5lbnVtWWpaWEZPUGl2ZWdBb3QrcUE5anROMURJ?=
 =?utf-8?B?SEZNSXVBdDhZejl1bmlvSWNvTjBoOUJGVERST2tlbHAyQ05BNHUydWVFMTVI?=
 =?utf-8?B?aklNdlNWYWlKVkl6L21NdFZxLzNxV0luZnBYeDRnRml5b0IyYWV1T0twQVN3?=
 =?utf-8?B?MTExeVFHOFd3aGlQcVZXZnJNL2ZLdjZ4bmpjMGR3eFAxU1puc0RHRlVJcEhr?=
 =?utf-8?B?SDlTT04yWDU4QnMxVUU5My9wZVViMk5CNVhSZkdqelZxUkdybTFJTzVUdWZO?=
 =?utf-8?B?VUtZZFJQNVd4clZHL1VhWGU3Z3ZFcit1UWVwTUQ5MFRrRVFGcTJsdkdvSXox?=
 =?utf-8?B?YzVzU3RKbnRJdkxHU0VmNDRpbmhMVHBHTXhPa01FR0RnUkh2YTg3eEFWUUZC?=
 =?utf-8?B?R0NUaFNlb29QMDREaWpTNjZ6RDc5d0NUNCt6Mi9iQkZPQzhkMGliRzd3N3hm?=
 =?utf-8?B?ZVZOSEJySlQrMW5WR2dYYWdXdjRlVk1NU3pBOXZ3UVBqY0NvdEJOSDdlRlJT?=
 =?utf-8?B?Y25RUThpZmtIbHMyL3N3dnBMaWlZRk90TllPOHJYY0VTSXdydHB0VmpmQ3Fn?=
 =?utf-8?B?RHB0VTBRQVY3Z09ocTg4dzVvdXFWNDJPUCtoT0JiL1M0WUlOUFVCVUJhOXNi?=
 =?utf-8?B?cFRsMElRbzkvWU9oVFU3ZlJnNjJNU3V2ZUFBeGN2WG41c1ZxWWVpVTFKTlRj?=
 =?utf-8?B?b1cwNDAwMTZhK0Y5c2swWVJ2dkdkb25ZejlTT084NzNTOEJmQ2kwbzVXZ2Jt?=
 =?utf-8?B?dzNEK3JvQ1BGLzIybzNSckE0bG9JZVhWZDBucHc2L0pFaVNUWXloUDVUM1BI?=
 =?utf-8?B?TnNHZWt6Umx6T1BLeFR3MHpSVFNxdzdIaURmUzBqZk5LeWZ1S041dHRmN3Rs?=
 =?utf-8?B?Y0J2MFoycVVUaWtoc1Z6SGNNZUpYbzFJVjdoMFBZZkZsemp5Rzgxc2Fma2J1?=
 =?utf-8?B?MWxLclV6TVNQUzFmTlQ1TEZuWjF5RzBoS2hQRXl1KzM1ZVNHOUlWZE9FUHJq?=
 =?utf-8?B?VGJrTDhBNTc1TW1Pb2NxOXN1cVgwYmJiWjJ1ejFzMTN4T2F2ZmJ1UHpFNzFJ?=
 =?utf-8?B?UTRIK1VhajRuRHcvUkl6dHBFWElXQ0tQMVRmbUNPMkFsdGRmdWN0WGsxMG8w?=
 =?utf-8?B?dTZ4MitRRUhOTWJ1MldoNTc3a1AxRzJjQmdZaVptOTN5S3lFWkt1dXFGTnVq?=
 =?utf-8?B?QXZIT0dmVFRlcXU4ajQ2S3RrTVdvcEIvQVBld3pHbzcrT1hkRUxrZ2R6T1Bz?=
 =?utf-8?B?OWpZWDhpU1lmOFpyZEEyUXUwS3FIRzQrRW9xSHRETExKSExlS2dQQ2hweUds?=
 =?utf-8?B?aVhzV3ArR1k2Q3ZxL0xrYWx0MktlTzNxajNPT0RoNEZLK0VuMHVIQVlsOVF0?=
 =?utf-8?B?YUxnUm0zWEZzWGpYbVhRSUpYWWNBRnl2amFvcjhhTXZUV2JqVHlWQk41YXEw?=
 =?utf-8?B?cmZrdmt1ZjFod2ppTGYxcnQ0SG1QNWJ5RHYyemRWOGtWU3JXOUY1TTk5S05i?=
 =?utf-8?B?UU5LdHBmTXQzOVkrT2pnSTM4eXhCMFdONzdsSm1sOFAvS29yUjlRcGp1NlJL?=
 =?utf-8?B?amZVeDMvei9TbXAyNDVNWE95WjZPRjNod0NJMWFxUEFDRTJtZEc4cWRSV2xU?=
 =?utf-8?Q?WRsplBN8GHAE40RKOwpWhhbDb6A4PcpY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGs0VWhMVGU4R1VITjNKTS9DZEVRaWEyNk1lanBrMWp4WkNTblBnbHFMTUx2?=
 =?utf-8?B?RkFUVG5lZFh4OUdaOXdXaTVKSzkwUlU5TyttU0pmdUk3RTBhTXhjQTZmMHJp?=
 =?utf-8?B?VUdBNzVvVGhkRGV2UjY1VnM1YmdodXhQUGZjVFVXaTZRMGdua1JBRVlHS2hm?=
 =?utf-8?B?bnYxMzE5NENMT3lIaE1DcDlOQWpqc3BpV3BCbTd4NGtobGZneGlRc281cW4y?=
 =?utf-8?B?a1c1L1BnTldjQS9FdERuOFNkcFIzVFRIdGI5WnYrcUVUZVV0c1hwWXNrWTZC?=
 =?utf-8?B?TTJZY1pxUHVuWU5mT3QvQ1Z6dHYvTGlOV0taa3owa0ErN1FkS29ubks4QlB0?=
 =?utf-8?B?c1E0aHF6MkloRlpIRm5IcmZ6bElEL3hZaFN1TXRReGVEaEN5ckMyRHBXQW05?=
 =?utf-8?B?YmJvckxOWnBab3IwVEtDWjJkQ3NMeE8rK2dFM0VuNENUNnRSSWd1N01QSzJz?=
 =?utf-8?B?WU8vZk0xU3lkZnhwVFJ3Ymhickx0aTIyQ3I1aGRLbzJYMWdjQlZCOXhrbk1s?=
 =?utf-8?B?RGhYR0lBeEROeVRLN0NDZ0FvRTFZUkFTUFlUd05HR0YwWkZSUi84c2VtRmFw?=
 =?utf-8?B?bXdZeG1KL1lteW1saGNuRjQ1bStzRDd4Y21QNmhacWVTZGlVTGZ5YU5NMG04?=
 =?utf-8?B?OHJMcVdhMzB0NGphUFpValJQdFFEZXRCYXJMTzZsbVp2dkp0cWhrZVVsdG9n?=
 =?utf-8?B?TGJZL3lsSlVFTDQ3UHFrRFZyM0JsUkdjbzdXck9maEpqNk14ZkJVQS93dEZX?=
 =?utf-8?B?aGlGWG83cGdVTUhiZEVJZkRlaUprUGJFVzNoaWp5ZzEyZmFQbkhpMHo0Nmpn?=
 =?utf-8?B?M1R6TWpBUWh6WmdXS25GYlFsbVVRNUVOR1Y1ZXJXUHFvZEJvTW5VNU4yb3RX?=
 =?utf-8?B?L1MxeExENm1pZHE1QWlTQjAxcDVMMHV2dURVR01tTUZkbVRjK3kyK0JzRVZ6?=
 =?utf-8?B?WlBjK2NSS3hpbUREaHlGRW5udytKQUtpVjhDNjJTbnNUdkorU3AxZHdzbWUw?=
 =?utf-8?B?QjVpMEUzbVpYUkhIUjdncldPVm41TjVxNk51MFBPM0o1TFUxZmdHcmJ0T0la?=
 =?utf-8?B?aTRYanZmYTR4N0gwTTJEZjk3dm5TRmFhKy9iWEkwU0IxelFJSUNRNXNzRFd4?=
 =?utf-8?B?OVNFeWhZenl6NmNPNzI0bkRxSkVvZHZxa0p5Y2tFTDB5WFNFN2RDYS9lUUpu?=
 =?utf-8?B?aXNmb3lsZ3FWL1ZtZzBrNW9yTkI0QmQ1cStCMFFjbGw4QmwzdW04VnBOcmVZ?=
 =?utf-8?B?aktXemFKL0pZMkN3S2RDS0ZaNkt4aFJJakpzU0o0LzRnejJFRjVOaEcxUUZM?=
 =?utf-8?B?T2ptRUtzTWsrcmRLM0ZlWEhFOGxGVllDUXpZeTJHa2RrT3F5OVFwcHFnY2RW?=
 =?utf-8?B?TDMxVHJnc2M5UlBwdUQzTWJBTEhucFVFcVpqM2dTQzJhMEVjZHRuOVRoc3pt?=
 =?utf-8?B?Nm5rL0s1QTJBcDQ0K0NKUnUvSkEvQ2ZuVks4QWtldFp4YWxTNHlqbVhuSkdN?=
 =?utf-8?B?em1pbVJHUGJrYzVZWVhGQnF4Tk1KRTMwWktaWkU5SGx5Sm5VSG9qR3E0NXo0?=
 =?utf-8?B?MEZtN0hWT2thMjArWWI3Rm1XMnNJSEhJRVArNmJCeWhhZ25kZ1pEMXdFUXRq?=
 =?utf-8?B?QlNPVTJ0bGNvSlV4eXdkN1ZsekYydXROMmMxbENMaUg1U0JSV1c5VnhqMkxP?=
 =?utf-8?B?S0FWUlBzVFhaSjY0Yi9HQmdiK0NzWUVBSm5LZGJ3Tkx0YzIweXhqUzE1c0FD?=
 =?utf-8?B?VlNnUDFNOFlXVitYVXlHNTBtRlp6RVJYeGp2clNJSzR4VXhEYTJvbWtBYXZl?=
 =?utf-8?B?NVY4WXhCMUNTOFlYVldQdWh4c1hGMlRSMkgyTVJwd1gyMGJhUEJWSUNreDdq?=
 =?utf-8?B?bDNUT3lpMUJKS05SNldaOTd0WTV2SzltT3lhODJjZWZNWGRDa1RnTHd6UzIz?=
 =?utf-8?B?bjJ2SnNoSWFwQlphUm8zRU9McmNvMDZYaHlHckx2VzVjdzVEK1IwM0VTV0to?=
 =?utf-8?B?MzBzTDNjU1ROazBLOWxLSTNrcDg3TXVQSXdrVXpicFJBb0lYSEp0cUhmbjY0?=
 =?utf-8?B?a0RjUUxMZ3A5ZWhlV05MckRreGFTZ3Q1cVJjaER1TnR6NDk2VXVBMVFrSUtQ?=
 =?utf-8?B?MEJkQ3g4THpnbUM4Vm5wUVpLR2NKdGpseWVEQ1lkMkxnalYzcncxcU1YenBh?=
 =?utf-8?B?WFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2829e76f-f57c-4cb7-7392-08de38e1faa4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 18:20:36.0387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CmfPybsBFY227vkM646sPSKFUEZWr2U9cEeA7yXrOEZv8vL/TlJyH3bCXiwasyoRoDyMhoXdBibqMIyaE0LdKcWVJRgy4B+5VIiyYukKo2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFD56E32CC2
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



On 12/11/2025 2:57 AM, Daniele Ceraolo Spurio wrote:
> Some upcoming KLVs are sized based on the engine counts, so we need
> those defines to be moved to a separate file to include them from
> guc_klv_abi.h (which is already included by guc_fwif.h).
> Instead of moving just the engine-related defines, it is cleaner to
> move all scheduler-related defines (i.e., everything engine or context
> related). Note that the legacy GuC defines have not been moved and have
> instead been dropped because Xe doesn't support any GuC old enough to
> still use them.
> 
> While at it, struct guc_ctxt_registration_info has been moved to
> guc_submit.c since it doesn't come from the GuC specs (we added it to
> make things simpler in our code).
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

with 2 nits below to be fixed later

> ---
>  drivers/gpu/drm/xe/abi/guc_scheduler_abi.h | 48 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_capture.h        |  2 +-
>  drivers/gpu/drm/xe/xe_guc_fwif.h           | 52 +---------------------
>  drivers/gpu/drm/xe/xe_guc_submit.c         | 15 +++++++
>  4 files changed, 65 insertions(+), 52 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/abi/guc_scheduler_abi.h
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_scheduler_abi.h b/drivers/gpu/drm/xe/abi/guc_scheduler_abi.h
> new file mode 100644
> index 000000000000..db9c171f8b64
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/abi/guc_scheduler_abi.h
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _ABI_GUC_SCHEDULER_ABI_H
> +#define _ABI_GUC_SCHEDULER_ABI_H
> +
> +/**
> + * Generic defines required for registration with and submissions to the GuC
> + * scheduler. Includes engine class/instance defines and context attributes
> + * (id, priority, etc)
> + */
> +
> +/* Engine classes/instances */
> +#define GUC_RENDER_CLASS		0
> +#define GUC_VIDEO_CLASS			1
> +#define GUC_VIDEOENHANCE_CLASS		2
> +#define GUC_BLITTER_CLASS		3
> +#define GUC_COMPUTE_CLASS		4
> +#define GUC_GSC_OTHER_CLASS		5
> +#define GUC_LAST_ENGINE_CLASS		GUC_GSC_OTHER_CLASS
> +#define GUC_MAX_ENGINE_CLASSES		16
> +#define GUC_MAX_INSTANCES_PER_CLASS	32
> +
> +/* context priority values */
> +#define GUC_CLIENT_PRIORITY_KMD_HIGH	0
> +#define GUC_CLIENT_PRIORITY_HIGH	1
> +#define GUC_CLIENT_PRIORITY_KMD_NORMAL	2
> +#define GUC_CLIENT_PRIORITY_NORMAL	3
> +#define GUC_CLIENT_PRIORITY_NUM		4
> +
> +/* Context registration */
> +#define GUC_ID_MAX			65535
> +#define GUC_ID_UNKNOWN			0xffffffff
> +
> +#define CONTEXT_REGISTRATION_FLAG_KMD	        BIT(0)
> +#define CONTEXT_REGISTRATION_FLAG_TYPE	        GENMASK(2, 1)

nit: we might want to rename it by adding GUC_ prefix like all other defs

> +#define   GUC_CONTEXT_NORMAL			0
> +#define   GUC_CONTEXT_COMPRESSION_SAVE		1
> +#define   GUC_CONTEXT_COMPRESSION_RESTORE	2
> +#define   GUC_CONTEXT_COUNT			(GUC_CONTEXT_COMPRESSION_RESTORE + 1)

nit: candidate to drop, the only use of it can be replaced with FIELD_FIT

> +
> +/* context enable/disable */
> +#define GUC_CONTEXT_DISABLE		0
> +#define GUC_CONTEXT_ENABLE		1
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
> index 20a078dc4b85..34d6fdc64f56 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.h
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.h
> @@ -8,8 +8,8 @@
>  
>  #include <linux/types.h>
>  #include "abi/guc_capture_abi.h"
> +#include "abi/guc_scheduler_abi.h"
>  #include "xe_guc.h"
> -#include "xe_guc_fwif.h"
>  
>  struct xe_exec_queue;
>  struct xe_guc;
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index 7d93c2749485..08149c8159c5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -10,6 +10,7 @@
>  
>  #include "abi/guc_capture_abi.h"
>  #include "abi/guc_klvs_abi.h"
> +#include "abi/guc_scheduler_abi.h"
>  #include "xe_hw_engine_types.h"
>  
>  #define G2H_LEN_DW_SCHED_CONTEXT_MODE_SET	4
> @@ -17,57 +18,6 @@
>  #define G2H_LEN_DW_TLB_INVALIDATE		3
>  #define G2H_LEN_DW_G2G_NOTIFY_MIN		3
>  
> -#define GUC_ID_MAX			65535
> -#define GUC_ID_UNKNOWN			0xffffffff
> -
> -#define GUC_CONTEXT_DISABLE		0
> -#define GUC_CONTEXT_ENABLE		1
> -
> -#define GUC_CLIENT_PRIORITY_KMD_HIGH	0
> -#define GUC_CLIENT_PRIORITY_HIGH	1
> -#define GUC_CLIENT_PRIORITY_KMD_NORMAL	2
> -#define GUC_CLIENT_PRIORITY_NORMAL	3
> -#define GUC_CLIENT_PRIORITY_NUM		4
> -
> -#define GUC_RENDER_ENGINE		0
> -#define GUC_VIDEO_ENGINE		1
> -#define GUC_BLITTER_ENGINE		2
> -#define GUC_VIDEOENHANCE_ENGINE		3
> -#define GUC_VIDEO_ENGINE2		4
> -#define GUC_MAX_ENGINES_NUM		(GUC_VIDEO_ENGINE2 + 1)
> -
> -#define GUC_RENDER_CLASS		0
> -#define GUC_VIDEO_CLASS			1
> -#define GUC_VIDEOENHANCE_CLASS		2
> -#define GUC_BLITTER_CLASS		3
> -#define GUC_COMPUTE_CLASS		4
> -#define GUC_GSC_OTHER_CLASS		5
> -#define GUC_LAST_ENGINE_CLASS		GUC_GSC_OTHER_CLASS
> -#define GUC_MAX_ENGINE_CLASSES		16
> -#define GUC_MAX_INSTANCES_PER_CLASS	32
> -
> -#define GUC_CONTEXT_NORMAL			0
> -#define GUC_CONTEXT_COMPRESSION_SAVE		1
> -#define GUC_CONTEXT_COMPRESSION_RESTORE	2
> -#define GUC_CONTEXT_COUNT			(GUC_CONTEXT_COMPRESSION_RESTORE + 1)
> -
> -/* Helper for context registration H2G */
> -struct guc_ctxt_registration_info {
> -	u32 flags;
> -	u32 context_idx;
> -	u32 engine_class;
> -	u32 engine_submit_mask;
> -	u32 wq_desc_lo;
> -	u32 wq_desc_hi;
> -	u32 wq_base_lo;
> -	u32 wq_base_hi;
> -	u32 wq_size;
> -	u32 hwlrca_lo;
> -	u32 hwlrca_hi;
> -};
> -#define CONTEXT_REGISTRATION_FLAG_KMD	BIT(0)
> -#define CONTEXT_REGISTRATION_FLAG_TYPE	GENMASK(2, 1)
> -
>  /* 32-bit KLV structure as used by policy updates and others */
>  struct guc_klv_generic_dw_t {
>  	u32 kl;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index bf289c480cd2..0fd08d59b644 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -568,6 +568,21 @@ static void set_min_preemption_timeout(struct xe_guc *guc, struct xe_exec_queue
>  		       __guc_exec_queue_policy_action_size(&policy), 0, 0);
>  }
>  
> +/* Helper for context registration H2G */
> +struct guc_ctxt_registration_info {
> +	u32 flags;
> +	u32 context_idx;
> +	u32 engine_class;
> +	u32 engine_submit_mask;
> +	u32 wq_desc_lo;
> +	u32 wq_desc_hi;
> +	u32 wq_base_lo;
> +	u32 wq_base_hi;
> +	u32 wq_size;
> +	u32 hwlrca_lo;
> +	u32 hwlrca_hi;
> +};
> +
>  #define parallel_read(xe_, map_, field_) \
>  	xe_map_rd_field(xe_, &map_, 0, struct guc_submit_parallel_scratch, \
>  			field_)

