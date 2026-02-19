Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0052C531EA
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 23:22:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8906F10E012;
	Thu, 19 Feb 2026 23:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S4ds0hGi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B98D10E012
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 23:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771543362; x=1803079362;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xFUkvTsGmAgnxLCRsZ9G8mFUqDMPRgnEpRVLc/D5CBQ=;
 b=S4ds0hGiosdC4zIqKsrxZ23yE/gmklXLONaaz7hfe+ZDpZJ9j6o2CJS7
 VEa33UJx0aiYlds3qfwMy+g+ypi/fLrLyXqE/pd1wtFLWyfa+J5p7idhl
 2vMVBqyVaxKtc3Jzr4TzKTaoLRVXmurjwvC2sPmogtkBhCej4roMIVPyb
 sEYD6gZLuRKUCBb3v475FjUnhvYUlm23zfn7fN3KtfO6rG5e098pL16io
 UbuL9wfDUJG18cimN9SyfRTc9CiIwDwvNb0jngixzyNjSFjDUCSWJzf8s
 6TA3mg8Tu2V65bg2CT5w+SEa1XMoOdssiJmeePg3Ocw+mPm7PoY32u8yG A==;
X-CSE-ConnectionGUID: Qwod1wP9RKODHsQhXElLZg==
X-CSE-MsgGUID: w0lM8ShVTO6scvp1lwBDhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72704240"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="72704240"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 15:22:41 -0800
X-CSE-ConnectionGUID: 2ioZtqcfQwCvFB54apikoQ==
X-CSE-MsgGUID: HjEmRaYHTD2mU/UD66SzYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="213274391"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 15:22:41 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 15:22:41 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 15:22:41 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.49) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 15:22:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B/SI+gsIQmxn7OVsO3iFYrLSM0YkXgB3OOMop+3vZ7Zm8Kk2gaMe4lu9XKUBTP3T4X3PpRY6/Iq8KWn1R2fjbE/tZrHnQprpncm4L4ECWj7V8oIGVFAb6hy95xS2ehjHu44F6/CuCN+653TV9it11R2R+7h/57zP8GaUytxKkRlZxR0NSXuPDYzk9KDEic9lgE8DotvvuIC/4Cv5xrEkfJIdPEVOR635kVz/+HeKcAmUzSuo/VSz44fyHFuJMNZR+AvehrLBtgnSLLlCZo6Ox0kbriXTzl+AAkMioGxYvEbZLXZqEaCZrFM9oL/v8yront6ot6e1sLCgm5KHu0MMrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kkCspB+gsxDn97ImW6JDhBUqMbIkKA5oFLpCIjpEtHo=;
 b=Y0q+7VCVjyQ6o+Sg566MppBlIhBo9HRTt+ywjLPyyRnnO6o0LWPVHlnwp8tpCuLCb+CtzZlYeoKbtcdJNlnFRg93rKe+xzHwzhVfsnQKOIbYsUsvglOOh8h9tA9KgpJh0nCXuhk0jwlOLw42//X1ge3b5ybzPZa6KbYcKUT16dA2ENNLq1Eod/XX77JZmZNfQgh/VVM8uE10FaVjAl8nKUH7ZQkUMVmCMl71MkCttvS7RFnruYUbs8IcfseR1ZN1YdF40uHx7Yf7hwH77SnIgIrnp2aAd1nPcTW5oI5yT0mh4eWXRw3GAoBzrgRWXWbvapAQX92v5gBI7VVPxLMTFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CYXPR11MB8689.namprd11.prod.outlook.com (2603:10b6:930:d8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Thu, 19 Feb
 2026 23:22:38 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 23:22:37 +0000
Message-ID: <ae74545f-c804-455a-a28e-3e25b9aef7df@intel.com>
Date: Thu, 19 Feb 2026 15:22:35 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/guc: Increase GuC log sizes in debug builds
To: Tomasz Lis <tomasz.lis@intel.com>, <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Matt Roper <matthew.d.roper@intel.com>
References: <20260213140008.1473400-1-tomasz.lis@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260213140008.1473400-1-tomasz.lis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0375.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::20) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CYXPR11MB8689:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e7ea10d-cd5b-4e6f-ef47-08de700dc4a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGdjOXEwWC9TcTMzZXp0WTJWM2c5M0tkMnYyNGM0bFVETVpKWklhdzlBck9L?=
 =?utf-8?B?dnNqb0Zhb3ZTSzhPbHpnUk9DbGVDdVFtUE5mMGhDYXFsakVxYkcxeVNDR2dW?=
 =?utf-8?B?blVoRUo2MDI1Um55SGUxS01kSURrdUprY2t5b0RYbHRURkZQcU91YmNsL1Jj?=
 =?utf-8?B?N1lHS3diOUdBZ0pQQmE5RTFIL1BDcVpEQk1VMGZRa00yNGlONkkzMkxOMk5i?=
 =?utf-8?B?aTdPcHhkOERjeHEwM3V5K1p6b2FLbzJPblkwWW5MZ3NzYk00YXdEWDZhYVNk?=
 =?utf-8?B?TWVIZTA3QWRjaGVBSkVLMldMVzgxV3BhaG5WcUIvUkJ6bG80eUdoUlJNYi9X?=
 =?utf-8?B?blpWaWV3YkQ0UXRad0JmZ2xCTlg4QWp3WVBWOExDT1c5L21vQjZOVnJ5S01y?=
 =?utf-8?B?dlAxSHhrNEJjMGpiYWdXRThSdjNjc2xYTkUyVHR5NCt6bklPK1M0Z1ZNZ2xy?=
 =?utf-8?B?VlJrZjROcDh0RlY2aWRWYTFLQkVYNUs3dVFhTlhkKzVlR3YzWFA2TksrajBo?=
 =?utf-8?B?UEN0MmlRSGtscFhOWmF2TGVlNVR6Y1VNZitYcW1UOGhtUDNUUUVUWmlIUjRp?=
 =?utf-8?B?bUFrNllHV2hZQXNBR0w3N0pDekJmZmlJUzQ1ZDdhcVhxM3BpZVd3YkNlVmlL?=
 =?utf-8?B?b0x2Smw1NUszZUJ0cklBMXVqTVpmMjZEa1JTcFN4RHMzeFdQa05BekphYUo3?=
 =?utf-8?B?d2hFOTdOTWtjVGxNbHhJVXlOS0dUbWg5MW1yeTdtZVZKUzlzaDlDa2Z3Tis1?=
 =?utf-8?B?Qk1KSitBWEYrc2xiUm5xTkF3VmdJNG5DZG41Wjk1a0MrbTE2a051Z2t2b3Rr?=
 =?utf-8?B?bC9iUisvUWtCajlvS2ZHcUhhR2xGakl4RDRBS3VHMVo0OUEvVjlheTlGbm1S?=
 =?utf-8?B?U3FvdkgyaUFWWUtTS2dHdit0TlczSmk5b2owdG9ydGhWQXVxYytZQlZyNzNt?=
 =?utf-8?B?TFJDZmc4QUJ3WFZBZmNMV3VrTGpOajJsVXROQzcvc3kvVTBWSXZGWDJ1NUkv?=
 =?utf-8?B?SDFMM2docWVZNzUwcTl4eGp2WSthZGZuL1dGTUFGcmViKzRMdVowa285U0Ex?=
 =?utf-8?B?ZzVHNXZaUVdNMGh0elo1R3ZiNWZMQnZZQ3VRWWR5dzZYZ1N2aHN3a2VZZnpH?=
 =?utf-8?B?RXZmNFhNUXY2MlloZWxmd2RxZXNSKy8zYUJ4cngxWCtHTGdjU3k3QUpGQmUy?=
 =?utf-8?B?NmYwTlpTcXFxSCtHdDZxZjhTbldnRW84Uzl2b2RmM0hKdGxRZm01ZVFFYllV?=
 =?utf-8?B?QnNscXM5RnpabUdkYmZ1dHFFdWRkSjVHeWR2YVJJUko0SGhpRXJzTmk1eEV1?=
 =?utf-8?B?bnBvbGxOS3M0TXg0eVN1dWpPWHZ5V0ZYM2ZBWmFmSjFIaGVYMU1sbGNUZktz?=
 =?utf-8?B?blpCbHdMZTB2ejc5VXUwcG5FaWI2V0VyV291U3lqT2hCYUh6Q1dzcVNoY21u?=
 =?utf-8?B?c21EaHpIZHRlVDRjRHNvWkNTR090UzlwQUlvZDRsUDY1aFdKbDJjV254d3Yw?=
 =?utf-8?B?YXJJZlh2cFkybGJZZTFFWWdYemxzZHNpN1BlSWp0enNldzI1WjV5eEx0WFNQ?=
 =?utf-8?B?M1k0SkdOYXFRUWZaUDRmbDBsMENlbU0xUzRLQmpLMEdITkZPQ1JVUjlLMFM5?=
 =?utf-8?B?T0puWDFlT3MrZHB4eTk1Ykk5QmtERmF6c2YydDdPbnJXMlo3OURTQW1qMno5?=
 =?utf-8?B?QkYvWkxDMERzdmxNTC9EMWo3azUza1RKR3JZbzBXQXJUMWZJQVcyZkVZVFV5?=
 =?utf-8?B?ZHRrZEJyYnRNdmdYWS93T2pVdXhOd00wbGpKcTRXU09sM2p2RXhmT1FpbXBM?=
 =?utf-8?B?NzZvRUVpWm9wNXA4ZGhCR1ZHK3RLK2ZUOHBBZGxJcUtqYTZxSld5b1ErNjl4?=
 =?utf-8?B?T05FampwK0RUM0s2eHg1NHV2UEdxTFVHMkdvanNia1pFZ3ArZDRXWlJQZ2NM?=
 =?utf-8?B?N3JKU0huc1NNY1hCeDFRSWFZZmMreDJGVU1IN3BzL2MxaGpTY1I4cUVweXc2?=
 =?utf-8?B?bFJ3OVFwOFp5bnAvMUF1YThGdllMVVFjbWRYTUhiUmpzdEptU0NpOTlMT2lC?=
 =?utf-8?B?SXl0YkFoc0FjYjBzQWVqTmtqaHFMQ3RPUkZpNWg1SWlKc0h2Q3JENHhsT1N2?=
 =?utf-8?Q?+uJI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGhXTXVpYmVZNUJ5Y0RTUDlmRkVHUFV3QjRqdnpxSXNSdnR1Vm15WldKTXZM?=
 =?utf-8?B?VUxVZWJXYUs3OGFlSE1FcUxDeXhoYkc1TXBVQlpzcW82U2R5NVJxYWt0RFVB?=
 =?utf-8?B?WFYwZERDclQ2cjViTmJlRnBIaHczNmtYY3ErRlR3bURsdGY0V0hQNlMvR2VP?=
 =?utf-8?B?K2VGSmF4TzNheWNqVEFtdytDUFJ4aUhxV1ZBUDFlUXcySVlJNWQ4ajhiTkJv?=
 =?utf-8?B?ZVREOU9vTjNzVjdtZkJWWHpreTU3elp2dkx3MHdrdUg3ZDFocU5SNXNTNTFj?=
 =?utf-8?B?RVR4UjhvK1VRdTFhUXh5RldDV0JlZXREVGYxc0xZZml0Z0dONElOck9aRTNE?=
 =?utf-8?B?cm4vUCtNaWVTVUpra1J5SGs3VEY2bktQT000VVpHMGlESldlNkorWEpyTHFT?=
 =?utf-8?B?REFDUGRtN095ZDBpR0EyZTRLQjhaQThUSjFoWGJkRFd4TzlSUmlyQnZEbzNl?=
 =?utf-8?B?OHEzZllRRmlvUEZtQjk4UVYwVm9EQzBsTHBuMkJmblR2b0dJcXpqamtUakpN?=
 =?utf-8?B?OEJ4cWN3K2NhUlpEN0lpRFlaN0JTSmQ5WUlLVVBzNkwrNDJ2QWVrdzllRTlF?=
 =?utf-8?B?R3R5UnVEWlBrMzlKU1ZSaCt2ZjNPM3ZPUWFsTWpXeFEvYjZIbng1OVRqZkF4?=
 =?utf-8?B?ZW9kVnFyK05WUkprenhoeVE0SkN0aHpoVDRuUFZ4dkw4RE9PemxGZ1pIMEJU?=
 =?utf-8?B?emVJZlZzQ2t3THRieS9aREphQU95d2JSakx1cEVodFpQSWJIa2E1bGp0c2ky?=
 =?utf-8?B?ZXY1SGhHRFRzS01la28zT0RHNkc0L1c1VWlody9JREVPVUxDK2NXSDFNZDNr?=
 =?utf-8?B?ZFlzK1RISEpPWFI0K3R6eThIdHNyR0hTNWxjVGg1cEhyKzYzSWIxQXFxMzZR?=
 =?utf-8?B?OXh4dk5ucFh1S0lsMDdrZnNad3Zxd2NDU2xTQ3JPNEJRZGRyM3U1WEVLVmpH?=
 =?utf-8?B?YjNiOVVqc3F2cVlGdktUbUVhNGNQSnRJaUtHUVhoSVlWanVCNzMyV21rZXZY?=
 =?utf-8?B?b2tyaTY2ZEpWQUFXU2xydnNyYmNDSGFSK01JdzM2NW9SU1hQMXE2WUZWR2N3?=
 =?utf-8?B?USsrcktoKzFPdXRIci9BTjFJdU1hVEdhSkx6bTcxd0xEMkx6Q0daWlRrczlP?=
 =?utf-8?B?cnVqazRrM1d6WEIvU29QWm1WaGlWbDY1QlJ5OWdFZmdhdGJ0bmhQVHlmQ2tI?=
 =?utf-8?B?NU1VbzByUG5kSWNPcjZCaGRqVE1ZbUVTVkFIYTJXVyswVFdnaWswY1FWdWZ3?=
 =?utf-8?B?NitidFpoWTRjUFg2eHFsOTFRL2JHTWFsVFFpTHdVSnJRUXo1RjQ1TUY4VVJj?=
 =?utf-8?B?UU52bXprR01HR2FRSjIxSFI4TTRnYU0vZzRPYU5OZ1luNys0MUdSamdjcS9Y?=
 =?utf-8?B?YzNMdnNHVldlRGJqSDc4Uk9TK09RYkZrVVMrcDVnWmtpNk5MNDVzeERDSFVL?=
 =?utf-8?B?Q0lYR3VRL20wTGE4aCtVZWJtUHBpZTNIdEM0dGIrQ01TTHZUY2RQekYwUnJU?=
 =?utf-8?B?aytFY1NFMVZRVzAzc05icERoNS9uK25WK3VDTWNXaFYzM2RCd2s1QjJrdmNX?=
 =?utf-8?B?OEtZWVNoK1JtdVJMM0o3N0ZOdkxubnhHNDZaQ2hlZUFHc0NJRWNHOTEraUJU?=
 =?utf-8?B?RGxKRVpydnJJb2w3WWJ1dG9makhWWjlyUVl6QUxiUnZtZnVsV1E0ZENXbnRC?=
 =?utf-8?B?M3RWc1pWck91a1dtaC9pT29VU3hKWFQ2czFtU1k3RTAwU1lXeE5yVWxhUDNS?=
 =?utf-8?B?NENhYVV1RThUSWdrOFA4YmZhejR6Mm9uOUJrMEtPeXdtU2xTN0t0eWZyMlBR?=
 =?utf-8?B?TXZFbU95azJ6Y0hPNkdZWGdqcHRTb1Z2MmhEK1V5VWJnblRPS2dYN3k5UUlL?=
 =?utf-8?B?YWZHMWJmM09KcEN4SVRYNm9RR1poV0Qxemh6NTdQNWNpd0dVbmFQN0dSRnRy?=
 =?utf-8?B?T2RjQ1QrNm9uZEZLRG5nOTdXbUFHU0V4aWtsQVJGMTVzMWdEdFVsMlJPVDZL?=
 =?utf-8?B?YlJWZ3ZKNTladXEvSXpWMVBRc2lvQzFwUm5VODIyR1ErQkZvT09BanU0aTh5?=
 =?utf-8?B?L2RveXFiNzlhbktaTWtGbStPNWl1NGordS9kNEhHd0JaWDd0OGpIenVMMU1T?=
 =?utf-8?B?NkhWRzJiTWlGKy9xTDl2dm04NGNncWtyMTZNaitrSnV5a0RYcGJvczNQd1pG?=
 =?utf-8?B?LzJzWkQyRmF1d1pWd1F6OVZPdXF6ODNJdGppQm1IMWs4ZnlsUXdzVWxEMG9l?=
 =?utf-8?B?Vk5YL3RLbmYwa3NBdEFZOE41UUFjdHBlVXRpbm5iMmxHUjNzTWJoVzFRTWZK?=
 =?utf-8?B?OTlKVVI1c2c5L0pSU1NCSHhCZlZzYVR6cUtyZS95S0gzUzlrVWNwUUxzWldB?=
 =?utf-8?Q?Puj8517lWa8Ws7sA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e7ea10d-cd5b-4e6f-ef47-08de700dc4a7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 23:22:37.0485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0IbHmTVmBUUM8/iEohriBDgTyBPkrrh5MNHHpt4+uU/z9uvcD2ekt86qctIhCNTn5RR1+1Il00ydc7xY3952skq/Ne+Iq64F/aIqZy9/vQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8689
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



On 2/13/2026 6:00 AM, Tomasz Lis wrote:
> Increase event log size for GuC debug to 16MB, and for general debug
> to 8MB. This allows for useful debug even if performance-affecting
> DRM_XE_DEBUG_GUC is not enabled.
>
> Without this change, GuC logs gathered by CI are useless for debug
> due to limited size, which translates to time frame not even able
> to cover cleanup after test.
>
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_log.h | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
> index 1b05bb60c1c7..4649a260755e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.h
> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
> @@ -13,9 +13,13 @@ struct drm_printer;
>   struct xe_device;
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
> -#define XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE	SZ_8M
> +#define XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE	SZ_16M
>   #define XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE	SZ_1M
>   #define XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE	SZ_2M
> +#elif IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +#define XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE	SZ_8M

Not sure if this is too big if we ever need to dump the guc log in dmesg 
in CI (AFAIK CI has a 2MB limit for dmesg, but we compress the log 
before dumping). We can tune it down later if we ever have issues, so 
I'm ok with going with 8MB for now.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +#define XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE	SZ_1M
> +#define XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE	SZ_1M
>   #else
>   #define XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE	SZ_64K
>   #define XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE	SZ_16K

