Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931CCD58D7B
	for <intel-xe@archiver.kernel.org>; Mon, 25 Nov 2024 19:08:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C9810E115;
	Mon, 25 Nov 2024 19:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TOdM2aAF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC0A10E115
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Nov 2024 19:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732561682; x=1764097682;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4AOaOZ4JfR48Xvcafq+xZG3hAOx7q28/Ow2gM68cz/I=;
 b=TOdM2aAFmK+uJl1uF7J1pfd4+PjVkizygQ9WcARyNEBNcen516CNkeVS
 l/oG98R+CVDVehwaOvwbMFDWQdu37fDPEq59pS2V79qoyvQ8x2c3jfP/5
 MdOee4PqAoLmaZm27QR8isNYIg3lJ588+ym3jpFCPsPRj2eZzguj3nRaW
 eAMVAEzthllMsg1H3XWzWfUE2gjs9X/LH75MIsmBqTzaUiIwCyaYYRKlJ
 9Nthj7B9whh0Od5l7X1B7Rqx9NcEv5OWZb7Zq9lQ/7oE+8ATQn14p1/mq
 LeWJFzZ8UaOF/asrFcPOMjN2sie1Y+PigHMwZ9rGQvudXlZozhdfvzksN w==;
X-CSE-ConnectionGUID: gcl4/tkeQL2wBKHFyZSv5Q==
X-CSE-MsgGUID: ipACxTRyQyqg1RU/5HJ51w==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="43756772"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="43756772"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 11:08:02 -0800
X-CSE-ConnectionGUID: sMjCdeUbTEWVo3N50FgOkA==
X-CSE-MsgGUID: wETPb8pxRGuKmoNp3rrRdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="91262333"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Nov 2024 11:08:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 25 Nov 2024 11:08:01 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 25 Nov 2024 11:08:01 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 25 Nov 2024 11:08:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S/SP0m2fijK3pWV9qPsdqHIQTOgb+PJD6QBI11iLLDwpbZsRoiGz6Ey+co4WV6y1CVks7XpwzcK1vmOI1rgBy+JLxCuT5AD4b8qdRCPPrbOuXzqsg49x/1eoxC3wV7B2k0vbzDGzmQ6XtbzjfkdFgaZxm/lo5CtwLjs61ZEwQRDfqAERdJEr/dBaDpqYqrItf8NNPhUBNLrh/sHXaik1ThMcL2LbkIKSOHvnQ59j3y9/gHLoZOxixCgBppFdAUxjuth4rKfQhrfhZJCWGWeMMq9s9ILwjSbPwfKUMymMTXmjE/WsytKTj/Y4D/kp8uDXMrYT2yusihJ6CvC7TFeOpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmgJ/c4p3x4fnLCXySeapV3pXxJSTVwcv4Hs6LYBRgI=;
 b=VMhDW7863ziXeNrafzr5GK1UDeqD3Nx1k3Z7wpbWmqcCF0I5q+VTo7isBvxLOSxwNOq4BpMMmZ8jmNZMwk45aOP8lCS1jQ3Y34sh0Cfa9BZ5r8+GxQI7G5P6c22AR1dLTq5kI2awFAUFRLdZzKmVHl22tMq02VKfd7eqvt7ZCkiV7ekvzpRQQrhjOkdq4LU5I4Ui986Nt6qcRH4zEwtyjWNTVrY04OQHGXrP2XV2Bg2Rl52NG0gfuqrGKM6GkpCoK5ZBaIcLwdaeRDxIh6yEoL78+v20UcwDMGqN3oFf6B9EP0xXExtIT1c5F8dz8hPijrMkceu36vplFPii5W4etA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH0PR11MB4936.namprd11.prod.outlook.com (2603:10b6:510:42::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Mon, 25 Nov
 2024 19:07:58 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 19:07:57 +0000
Date: Mon, 25 Nov 2024 11:07:51 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>, "Belgaumkar,
 Vinay" <vinay.belgaumkar@intel.com>, <intel-xe@lists.freedesktop.org>,
 "Tvrtko Ursulin" <tvrtko.ursulin@intel.com>, Bommu Krishnaiah
 <krishnaiah.bommu@intel.com>, Riana Tauro <riana.tauro@intel.com>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 1/4] drm/xe/pmu: Enable PMU interface
Message-ID: <Z0TLB2W3n37mPFRM@orsosgc001>
References: <20240827164107.47034-1-vinay.belgaumkar@intel.com>
 <20240827164107.47034-2-vinay.belgaumkar@intel.com>
 <o42m66pseq7yxitt27whcwjntvtuoxndlxcvld2vak5i6ejhtv@ny3ilfuxvwyz>
 <602bffcd-d66f-4b49-b3b4-abb934b00f3a@intel.com>
 <3de57ee4-d8a6-4b39-bd17-0fd2f00adc2b@linux.intel.com>
 <shrwluh7x22szbsntnu7chuxr4i4q2uvrmfy6bxeru4ue6vemd@moyhm6rfrw3f>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <shrwluh7x22szbsntnu7chuxr4i4q2uvrmfy6bxeru4ue6vemd@moyhm6rfrw3f>
X-ClientProxiedBy: MW4P222CA0018.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::23) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH0PR11MB4936:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d375835-ea3a-449e-a1b9-08dd0d8478ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V3ZSNFhvQzNaUWVFYjdTKzFOYXRmT2c0cENTVWFCT3F3dXEyUlBhQmdwNXlJ?=
 =?utf-8?B?SzhmaTBMVENHWmNHbnljdVZvcGFEQmFmb1dXNHc3K1MweUZPbnpnUENoc3Uv?=
 =?utf-8?B?NzVLZkpDT0ZwWDJrNzZnSHZ0eUo4ZGVPU3AyU1dzVjdTZTVrVU9FdytlL3hz?=
 =?utf-8?B?Y1FyK1ZrRE1BUmNwc3Uvb3NPRjVVNDBBbkMwN1ZvVFhXTDNxTTl1Tm82VE1P?=
 =?utf-8?B?cGduL3UvZGRsakN0d1hScEFRSzlLUWlsRytkNFg4OWVmS3dqeHVzSFJJSHpK?=
 =?utf-8?B?OFJPWGFRcDlFWXBmZk9OV1FuTVhYTWdlUEpOOVZCZnpJY2tIQ3pFNWdiWVo4?=
 =?utf-8?B?RFZ5U2pFU2xhcnBiQnpMcWZmZ1RlaHdNT2Rod24zWUdnRUx5dVF4ZmdTaytK?=
 =?utf-8?B?eU45N0RqN1lGWFRYYTVUbGFzeG9rd0pWRUlyRVdHcUZYaEx1Yk1SQzRRMHI2?=
 =?utf-8?B?d29QWVR2YkJiYjZLWVlYdFhSUlNYVml1eXR2YlZkK1NoNmpsQXJBR0I2SEE1?=
 =?utf-8?B?THk1UHppUVRiWlNtank3d1pHUXNEZjVqT1pHZzFlK3ZJRlNWRVYzQXZwaXFW?=
 =?utf-8?B?Mm5EOVpyOTJSTThyTkFUYlpqdEpWU1RjNkkrYTRVT0lBN1FEN0N6cFNWRGZj?=
 =?utf-8?B?Nk95T211U2d2R1NmUlVVeHJXekFlaS9uWElSanVmbG1YRWpucWQ3L001T1di?=
 =?utf-8?B?WE1GSlNOS2puMDVMSzdieWtIMXpnQ0Y3WVpjbWNvbm53NW5qWGoybTN6TTNF?=
 =?utf-8?B?bzRiWDdhNHpOVThtM3BQVVlPaHQ1OVQwNFcrelQ3OGRySzYrc3dDK2VWQlFZ?=
 =?utf-8?B?MWU0WHZIQ3BEOWlFRmV1dlNud2lWTkJHRVQzUXIzdFlaMVJmcUlTODJ3WDRO?=
 =?utf-8?B?clU3QUZ6SmpwVC9mbVlwWTU3bzU5TnVxLzNnc3ErUFdFYmR2VlVtTjBxYndJ?=
 =?utf-8?B?TG44YVZyRXQrdC95VFo2TEViMlY4RTZwUnNJS09WWUdMcE9CVENrUW04UktB?=
 =?utf-8?B?R3lvdWdzdjBTOWJPcjdMNG1sd0FIOHZHTEJEdUlSbGs2Rk5yY0hYTGlGYlNU?=
 =?utf-8?B?UDZPWUdIU3VJdldNWGFadjBFVjR3a0tFcGJWdTZGeWZ1K1ozMlcvRFNxVHhS?=
 =?utf-8?B?RW42TWd0Q2RmMkZGdnBMUnJhY0ZEaGk4ZDFZd0ZWSXJKVU4zd1NreTI5QkFr?=
 =?utf-8?B?bWtvSlVFeEkxQ1E0MTdDN2xWQUxRcnNKTXl5eDB3U004OXpwSHhHNzZQZmFQ?=
 =?utf-8?B?bFVzRGxObHIwaHc1S1pHM0Q4bldVTVlMMmNSUmluUEJEbDViVHpRaHdTNFdQ?=
 =?utf-8?B?dTd2ckoyM2hobkMzZ3FQNU5CRyt3eG5BSTByWHl6Y3pWaUlzNWs1Zk9wNzky?=
 =?utf-8?B?cGRhNElXeUI5TmhsVEVSMndrdG9XYmt1Y0JCdkJEdWFibzBnYldJc01VTldC?=
 =?utf-8?B?SHozaW93WHBCTUJWa21VaHowWnY3WU4yNXF1TWN2UFFVQTNJYXAzbW5UY2RJ?=
 =?utf-8?B?VGtLWi9OaGpkY1VEbGpOUDBMMXVRSWxjaGRyYjhpdUJRZ01lcHNDT2Q0dFVm?=
 =?utf-8?B?K0ZhNVRsdkNaQjlIcXJjYy9tT2dnTDROdDVoRk1NWlEzdnRzWEVEV1hpV0pp?=
 =?utf-8?B?WVFTS3JlTVRYUTV1OFVuWjlwQnNQcncxL2pGMWczRWlqL2oydmhMOFlvQkhZ?=
 =?utf-8?B?U1Bsc1dQSWc3NUk2QnVhSkh2YTZRWGdLMXZmSnVVN3NDZTkwcGVFVHVPdFRV?=
 =?utf-8?Q?QmFbek9Bj1ag/nifTY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVBSRmtVbk1VU0VGTmY0ZEMrNGRxb0RuWitCTW9wL0Z6VU5LWkFRQUxRa2Uv?=
 =?utf-8?B?MzRndklpQ3Z1WTZ6QXZHT3RtN0FndDVtZkl5alc2dmRxZnZhbUdLZTF2bEM5?=
 =?utf-8?B?SnlqZEh1TW5hb2RmYVM5RTB5bEE5SFAxMHBVSktyQmxXd1I0YmlwY2dGekM5?=
 =?utf-8?B?RXBYQmc0WW5QZ3RSVmZkMGlrL0tFY1VxdEwzZElPbkFGY2E0L3cwWk5ldUJR?=
 =?utf-8?B?UGdQZXZiLzFsYk1wQjRKdWVSUEY3ZXh5UGhYd0c3Tys4Z3UvUjdTYXVwMk1o?=
 =?utf-8?B?UnEzMGhwY0p0Q2hSVE5QaWJzeDFuei9EcWYrbWpVclM5TkFUMkwveG93dFpy?=
 =?utf-8?B?VGpCZ2FWeVBzME51bDBvTEUvanRXeVFiVkR4YVJlbXRoLzFTaDl3ZUNFV0Jk?=
 =?utf-8?B?NVR1Q29CcnBnMTQ4ekFwVXZEVFpSK1UzZ1BNLzZjSitqcGtxdVlGaGdITmdV?=
 =?utf-8?B?WjIyRk1KdkZJeWJlS1d6Q0RqRHpQQnZDclZtUWlWb1V1OEFkdmxiVExWbEM2?=
 =?utf-8?B?SnhRUGV4L1NNT1JWcE51Y1JENk4xNWo1TXdGQUhOZmRnaTBNMnhuQmRSdHI1?=
 =?utf-8?B?eEt1ZFAzbjBzVTBwZmVTWldlbkJ0Qk4zRUM3eTFJblpSZ0xvNXd0R0hybGox?=
 =?utf-8?B?STdSV09KUlJRUzFmK3VxR3YyOG50Q2Ryc09ncXQyaFlXaHJSNlkzYzZDMW1n?=
 =?utf-8?B?R2dCeWFnMkwrTEszbkFIRnd3TVJqSjNBb1BaOU5uKzhuZndteHF4NHFRS0Fr?=
 =?utf-8?B?SWUxbytYeDN3MFlRajlOU2R1bnYzeGlGMVRQbWF1OGQzZEFjdmtmRW1RVXUw?=
 =?utf-8?B?WFhJblBHVGVmclpFc1ZFWUxsZm5Dc0NyZTdCclFOd2lYcHl5VjI5ZXB6L3N4?=
 =?utf-8?B?ZEtoVC94RjFDSHZvMUtBWm5KOHhGOXhyQXJKWC9NSzkvSUNKdW9KTmxGT1Vl?=
 =?utf-8?B?dkx6WDlIZ2t2dXcxdzl1U3p1SU15REFXaU5rTEhlYXBrQ0JCYnZPRkZxYzhJ?=
 =?utf-8?B?SVlqemd0MmpTaDJGRzR6VEs1T2FFd1pDYUR1SGdDMUJBM3FHSG5sRExTalBy?=
 =?utf-8?B?SUlPNXE5eUdZcEZIL0JMWFU4eVJiSWoxa0ltc1hvRFVMWWVQQXpxRmF4QjIy?=
 =?utf-8?B?anFzMm8xVVJxR2gydTh1WHlmTnpadkdESW9ZWVlKSnVkUVFHYTJKbkhvRENI?=
 =?utf-8?B?ZjFYOGFIUzhlYVFGREZSb25SWFN1azFTWnhmQlc1WWp0WWt2eFF3UmJsQWg4?=
 =?utf-8?B?UGc0VWE4QTgxWWQ5dHVWeHFrY1N2dFViVnlmTk5tYVdBcVVJQmZUMURaNWpE?=
 =?utf-8?B?MkR3K3QwOVp5OWtnN1ZzM2QvYlBSSFZJUHYxVVNOeXVOM0s3SG83b25tT1U0?=
 =?utf-8?B?NkpkNFErZjB3aEtNRWpEdGpVNkJFUmREdHhHOHdTNGRTa1NOeVBVbVkwQXBG?=
 =?utf-8?B?UXB3V0RuN21RU1RpUlVqUDJvYWZ2WFZ0VVErZmhjNnVUb0s3ZFYrY2Y0a0Ri?=
 =?utf-8?B?MnNSbk50QWF5WThuRnYxMmN0c3dDOFpHbTBWemtrNDN1bFhJcmZaVHpuL2FC?=
 =?utf-8?B?Slhabk5qcVNLMnJYK2x5N3FzMUtmajVtOHJoKzYra0FiWUY1L0lXaW5STit4?=
 =?utf-8?B?dHRZa2hEcWxMZHhyYmllOFhTUWRqWmQvNlE3Q3pHcm9YWnpUMU5NNVd1SFI3?=
 =?utf-8?B?YlBGVWdpbjkvQy83WDBybUZKWXRPdzE2NG9IelEzWnVtUTBZYVJwZVJGaGNq?=
 =?utf-8?B?anY5bG5OOW5ZdFFaM3pVVkNIK0VJMktvd244NVgzV0MrZlpkcEJsbEEzOS9C?=
 =?utf-8?B?aENvY0laUS9OWXY1azhMck5CMG5BY0l4WjNSYWxTY2x3M2JoZ21MMFUvZERK?=
 =?utf-8?B?dlFLWlZqRkJSdWF2ZkdVcTJ6ZTAxYktWUnN4Um9raDl2d3JsYWhENklaR0xB?=
 =?utf-8?B?cHQxRThrL0tRQzJTZHphNFZMbTdlZU5rM2lzejdOdXZWT2FQY2lEaGNxVVdQ?=
 =?utf-8?B?NDF3Zk9NNkJkeThKd0NFRU1ZV1Z0bVdtb0hFSWdGdUxIUWI0SExBUThFK3lM?=
 =?utf-8?B?WmY0VTZTaUlNa09sODBKQytTcnlITitHeXZwbmw4bWtyTkpqbGZiaUc5cTBX?=
 =?utf-8?B?SWNtNW5zK2dDQU85K25OcE5pZzZKMEQwcUovTC9rQS9xdGZnY01PSlEzbzdi?=
 =?utf-8?Q?Vts9jPSow9uGbRJPQEsUHwg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d375835-ea3a-449e-a1b9-08dd0d8478ae
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 19:07:56.9863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 51Hkf8E0S4UnjQyYf+riGn5AiIfF5C7E4xWg3EgMrIrKNYeBbCYnCzvnFido7fyWFJcFkWvYAgSKscx6jeNd33j9O3TCzNTi2oPriPdUcc4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4936
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

On Mon, Sep 02, 2024 at 10:01:11PM -0500, Lucas De Marchi wrote:
>On Mon, Sep 02, 2024 at 11:29:05AM GMT, Aravind Iddamsetty wrote:
>>
>>On 30/08/24 03:40, Belgaumkar, Vinay wrote:
>>>
>>>On 8/28/2024 12:33 PM, Lucas De Marchi wrote:
>>>>On Tue, Aug 27, 2024 at 09:41:04AM GMT, Vinay Belgaumkar wrote:
>>>>>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>>>>index b6fbe4988f2e..de6f39db618c 100644
>>>>>--- a/include/uapi/drm/xe_drm.h
>>>>>+++ b/include/uapi/drm/xe_drm.h
>>>>>@@ -1389,6 +1389,40 @@ struct drm_xe_wait_user_fence {
>>>>>    __u64 reserved[2];
>>>>>};
>>>>>
>>>>>+/**
>>>>>+ * DOC: XE PMU event config IDs
>>>>>+ *
>>>>>+ * Check 'man perf_event_open' to use the ID's XE_PMU_XXXX listed in xe_drm.h
>>>>>+ * in 'struct perf_event_attr' as part of perf_event_open syscall to read a
>>>>>+ * particular event.
>>>>>+ *
>>>>>+ * For example to open the XE_PMU_RENDER_GROUP_BUSY(0):
>>>>>+ *
>>>>>+ * .. code-block:: C
>>>>>+ *
>>>>>+ *    struct perf_event_attr attr;
>>>>>+ *    long long count;
>>>>>+ *    int cpu = 0;
>>>>>+ *    int fd;
>>>>>+ *
>>>>>+ *    memset(&attr, 0, sizeof(struct perf_event_attr));
>>>>>+ *    attr.type = type; // eg: /sys/bus/event_source/devices/xe_0000_56_00.0/type
>>>>>+ *    attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED;
>>>>>+ *    attr.use_clockid = 1;
>>>>>+ *    attr.clockid = CLOCK_MONOTONIC;
>>>>>+ *    attr.config = XE_PMU_RENDER_GROUP_BUSY(0);
>>>>>+ *
>>>>>+ *    fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
>>>>>+ */
>>>>>+
>>>>>+/*
>>>>>+ * Top bits of every counter are GT id.
>>>>>+ */
>>>>>+#define __XE_PMU_GT_SHIFT (56)
>>>>>+
>>>>>+#define ___XE_PMU_OTHER(gt, x) \
>>>>>+    (((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
>>>>>+
>>>>
>>>>The perf uapi is self-describing and users should look up on sysfs what
>>>>to use. Example for i915 since it's what I'm currently working on:
>>>>
>>>>    $ cat /sys/bus/event_source/devices/i915/events/actual-frequency
>>>>    config=0x100000
>>>>    $ cat /sys/bus/event_source/devices/i915/events/actual-frequency.unit
>>>>    M
>>>>
>>>>`perf list` works fine and doesn't know anything about this xe-only
>>>>header. Why would we add anything here rather than encourage other users
>>>>to read from the generic interface?
>>>
>>>Agree. perf list | grep rc6 is sufficient.
>>
>>This was previously asked by Rodrigo https://patchwork.freedesktop.org/patch/555013/?series=119504&rev=5
>>
>>so what changed from then to now.
>
>2 different things. That rev you are pointing out had:
>
> include/uapi/drm/xe_drm.h            |  16 +
>
>so the uapi was being changed without proper doc. Rodrigo asked for the
>documentation to be added, because that is the proper way to add things
>to the uapi header.
>
>In this review what I noticed though is that the change shouldn't be
>there in the first place. We shouldn't change anything in the drm/xe
>UAPI header because this is actually an UAPI (via sysfs) coming from
>perf.

@Lucas,

Agree. This is carried over from i915, where other constraints may have 
led to adding some header bits for gt.

I want to mention that now there are 2 events per engine - ticks (actual 
engine run ticks) and total_ticks (total ticks that the engine was 
alloted) which enable us to take a ratio of deltas to calculate 
utilization at the engine level. If we add the config for each possible 
combination of gt and vf_id, we would have

num_engines * 2 * num_gts * num_vfs

where num_vfs should (ideally) be the number of vfs provisioned.

Do you think that's fine?

Thanks,
Umesh

>
>Lucas De Marchi
>
>
>>
>>Thanks,
>>Aravind.
>>
>>>
>>>Thanks,
>>>
>>>Vinay.
>>>
>>>>
>>>>Lucas De Marchi
