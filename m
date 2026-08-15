Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4370C5AD5A
	for <intel-xe@archiver.kernel.org>; Sat, 15 Aug 2026 07:59:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D574610E156;
	Sat, 15 Aug 2026 07:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PSOiA8ID";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD02B10E156
 for <intel-xe@lists.freedesktop.org>; Sat, 15 Aug 2026 07:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786780789; x=1818316789;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p/aEzVXTLmBlFCJ1/eNbEpc4eNLaZMEh67LnGqHc654=;
 b=PSOiA8IDYXaqKA2Q3K6XR//k3C1VydaK8p2ZMomN43gfKJ2NEZRIQ5Y8
 gOiE4goyDnuheZZ/12l+T9DleIb74l8bSZtec7JqYwGSp7/leG3qyJKsj
 cLax+vIywo/12EpyfWN6RkgPuOWTPOOxhyfsS2pksw3BOpiS9OQuD43Ug
 iKczO7GRGkI1kvROAila9noB2GyXDzSsQRRn0tsDrBU8UxKcJClZYVfrl
 wQ6NYkUtLjtS+EYUjoeWp29YbV8uDY45yCSEqL3oyBKszbQRpA6aAZW0c
 dp/eeUrKp8Dq+kOqxrwdMYGtKC7Pu121whKEVtXqK8Sc3ukfcZT8+wMME g==;
X-CSE-ConnectionGUID: DAdJOt3ZRd61fTaApBpozw==
X-CSE-MsgGUID: dEP9nisiQT6AAC7S1vGFpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="87106393"
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; d="scan'208";a="87106393"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2026 00:59:41 -0700
X-CSE-ConnectionGUID: zW+5czNjRD2Q4P45znLjAQ==
X-CSE-MsgGUID: 8paKXmkgRAWdrRIr+DqZaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; d="scan'208";a="265042065"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2026 00:59:41 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sat, 15 Aug 2026 00:59:40 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sat, 15 Aug 2026 00:59:40 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.11) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sat, 15 Aug 2026 00:59:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TSzgkXECRZfFIZtmXNr4xDkX7qHLolLiWYcTrpld9AI1V3pXnECS+g2glMHX0SoaCBwtTF5w1V8rsb1Q8SoHoOdQ5UtFefsOyhLmHpRUQU27vTyk3Bl/zw2GZ6nv4IHR5EKsvNehrbDTcYp69FiFzd9nurWW6U/at/qC8WtX0+X9NCAJLFsqTKTnqkUGyUDOPjkvZywvb8lH7JtWTAhugZD9iE/ekukPbFDOswAFIGCggcrpFsMj8+L070BEXzFhUwi99WNcDtcLRS2haWv0S0Yipicztt3ZAWTE2gr6hvsRcVh4JYHkTesQQYXc3hxQwzcs23kI+67p600tGK5ugA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GKvaBEMM1r7Xjja0qRrGCUdH7tU7PIuAKG1WyT7lIT8=;
 b=wuRbk8MM7cItYzF40UnhWmHYzgKqyRMBIxV7r5ZuwgqYZQ6DzEBxFnTjG4qoxK/wb/uz9fSsViyi0K3wAEgRhb8fquqHUDXO8p7i0tG8yizpIN2PhsBeDM98E/JXxNrDepp5XsWUgl6QOhRoIjEtPquzPmXLhgQTT8aTs0AlMI70rpL3nOCv7GFBrvwqsfOQvuwln8loCubya+AlbUl8+VL7kdFPjDu/Rrdv+luytouR6c03OROqF1RhXFRrrkB5WH90Aj0u8jcppnwLNfMIGiRwmG8AC9fVQSGrUXTUcFipdsr0SjYcud3iEPaT64N6o59QcUkUzgaqbEhXBAjGog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ5PPF8B3F23403.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::842) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Sat, 15 Aug
 2026 07:59:36 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0315.011; Sat, 15 Aug 2026
 07:59:29 +0000
Message-ID: <a228f329-abd6-4a4b-bf1a-24db61084d10@intel.com>
Date: Sat, 15 Aug 2026 09:59:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/xe/ras: Report CSC errors using SIGID
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <mallesh.koujalagi@intel.com>
References: <20260811235254.153783-6-umesh.nerlige.ramappa@intel.com>
 <20260811235254.153783-10-umesh.nerlige.ramappa@intel.com>
 <3520b3ac-9798-4077-a7b8-45b06c01ed2b@intel.com>
 <an9eDL/b0zkDOCtd@soc-5CG1426VCC.clients.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <an9eDL/b0zkDOCtd@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1PEPF00005B9F.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::62a) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ5PPF8B3F23403:EE_
X-MS-Office365-Filtering-Correlation-Id: 9744a087-301c-4a78-cc0c-08defaa32218
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|10067099003|56012099006|18002099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: dCHVmCO7/M8sHobdHTENXHuLb+FnAV9AJ0FuzXcjxap3yg92EcwD/BJR9rXbOQW3QneBthro4LVHvThGoKvAvjU8qV3Pn8BETmxtWjBTu56y2XX/Zc6U7oMM5dzMVYuETPpqg7dcWt0h2VPAyc4x44Y5B6brm9PZs1p4pGVTIEVnQ3KH3vX4SLLbzw3gCFJ7SG/iG+TBU3DrJP3Z0YjxYG7mM8cT0SBf8BZilm9r2T/EcSogz+h7m8J4xhZEznhsaPnEGkCeQ65wju9/J9tJ0HtnYPPLv3QztvVttJQs1BAVnNA98GvLB7M0Lrllk/O9b4Xms9JhW1n8ybXkdkm6IDJdIlLzQ4PXjTpvoUiRWU4lOtuMbauqQ/HiTdoexJLNFSVlJSrrKMB357IIcOWNWZtr0HqSEJ4xeOLrk8XOH1ZMjzCkhzI8mflpWBM05ijJsHGmvH5W84XlHVzie07o2Srb5zBKLh9DQSCgsrqhLLzTF5GRAE2wsfMeYu0yeLjVBYVhnuu9BrJjyMxT4K24B0Rtn5iXcfcsIr9dqOTdFQCeWu0/+2neRSO61+e7PePlbp/5CanIuzLFZQCN3UfeBMpkaR8Ylj5CrfspRN0xuLlZMO2qcxD+tppHNU8dyDNGntcp2QGR5r7VqtmyybDPMVHDZxKfVxeBaxynz6bYIOU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(56012099006)(18002099003)(22082099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFVvbjFJL0pBQ0ptakFKUHRYY1JteGlGL2dVQ0ZoQ0ZjMzJkbE94dFFRNU1w?=
 =?utf-8?B?cGJVYTdIVlE0V1h1QjUrVDl0QWJMb21CNi9tSFd0bDE4MWVCSm1qZSs5QlJI?=
 =?utf-8?B?L3Avcy9WYzhjdGVVVHpGR2FWYzRKTzRuUHo2eW9TaFNCTW5nVVNCM1hrc2Uy?=
 =?utf-8?B?TTNkaUVwNVQzSkdGY1pTNnpsZVg5V3NuLzZtRE9SM0xnb3QyOFR5NzNGRjZn?=
 =?utf-8?B?R01sSjBWWXdNQ0hnWmpFbG1EYjZycGUwYnZxU1JUTktKSDhBNTJFeXNJVUQ0?=
 =?utf-8?B?T1VIRFFMVWIwWHA0b3AwRFMycEF3V3I2MUlPcUEwcW5wMmZFc2FVWFBzYmx0?=
 =?utf-8?B?OUx1ZHNPRXM4S292YlNieTQraU0yelh4UmJTOUpudDFNWjJoZjhTc0kyM2ZY?=
 =?utf-8?B?RldSNGljMHJWNGUwNjFad1dHV3NqMGpvanpnMHMzeHEycVF2MGJUamZGSEs3?=
 =?utf-8?B?bHVXOU95MWRUOElUUG55NlJOTXBkWU5pdUZNQ0NTajFNZjNvVWZ1Ykx5N1gy?=
 =?utf-8?B?ajZEQmtoTW5RSzMvSGViOEN2V3MvdnkwS3ArNDQ5a1poM2Y0djF5cGVxM2Vh?=
 =?utf-8?B?UjE3R0o2dVZFYyt5UllTcXRuMHVaUThsd2llNTBYSHpITUI0ekp6QXB3OHdB?=
 =?utf-8?B?dEtOZGt1SG4zVFYzRkJqUFMxNTFWYzJGTVNnMkxPSmd0Rmp4OXlML09mVVRw?=
 =?utf-8?B?NVgyQTAwQk5qNnRPd2RDR3NhUU9FMGVvZ05tZ3JjWFdXWEcyWnpXTmpDSzZj?=
 =?utf-8?B?ckU2Qy9RT3JucGZDT2tZU2JyOHhBTVdrbXhwZEErU0d0Q2sxbUQyNElRWHNm?=
 =?utf-8?B?RXdHMDlaeGZrQ0wvZXdEL3c0ck5Rdi9ud2MxNHI5anEyN2VFNS9PMXN6cDE0?=
 =?utf-8?B?L01FOGFaaEZqSGMwREs5UEdJdmtuZ0tVWXlWejkrRDY5TlVqMGlYT1huRkp0?=
 =?utf-8?B?cXF2dG85Zkk3OXFRcHIxQjZMQnBhMEdkM084R04vTkF5enVCZGdFWGlsb2Q5?=
 =?utf-8?B?UlJNUEhGZkpXVGFOK2xXMHp1RWRXb0xQNzlKZDVKV1dUNGV2Z1pXUWg0MStN?=
 =?utf-8?B?VHlVMlgweGxuclI4Tkptd3RrMDhZTWZvejQ5OXE2WVhObzlSSUFCQ1V6YTk3?=
 =?utf-8?B?WEN4Ymh6cjNCRTErazZ6amhHdjJlK1UzK3ZLRzdVWUYveXpNdUhIdmt1anBh?=
 =?utf-8?B?aXpKU25FVFovbHY1a2YvZzdFRnhDUTNENGV2SEJrREplSkdhREtFTjVZVEhS?=
 =?utf-8?B?dXhWeThNV0pGK0lnNDZxNGVxM1RxSFBMSVFWRFZ3czVQTVgzUjRyK3AvcDlI?=
 =?utf-8?B?cmZjZ0ZZYWs5cWZEUnpGKzFud0VpaVkwME9NWElwYTQwZlhSZDAvZjRqK3FO?=
 =?utf-8?B?OEpVcU0xbytOWHRzQVlvMFJVelBRWkRDcmVkZzFZQnEvcEI3cmk0R0VkRnlE?=
 =?utf-8?B?UTVLMFlnemorRVU4R3lWQnlZNmE2bGtmMGJiWllBeVRyckZyZytEMVZNMmhn?=
 =?utf-8?B?VytaWHVPTWdYMjMvbjBzdjFJUFJsdmlDVlRxc2lZTjlwLzFsS2hlbFQ2VlFH?=
 =?utf-8?B?KzN6Nzg5LzVTenIwWVR5SVpRTDRYcW0vUU9DNXk1N29ReENZUVppdlNXNytV?=
 =?utf-8?B?eWFpaGoxdCtLVU5VREROZDhiVDhxNnZ5VEdJRGdreUpPQUNueEluSTgzdlEv?=
 =?utf-8?B?emtOZ1hXNEJOYkRhVzd4OTA1VDFrZUlPOHAvZlprM3F0M25aZ1ZGUEVyeGJ2?=
 =?utf-8?B?TDMvakE1dUNCR1FZNGkzMFlnMTV6MHN4N0VwME9jRmFlWmwzRVh0aG1SZVlx?=
 =?utf-8?B?T2wvdWtQdmRuMy9YRklMUnhkNkNyUzJGRDVwTTVKYm1ZYzI0STRyeEFqektE?=
 =?utf-8?B?SlEyL2JTLzJvSFVwZlIyZlc0YkxoUmVpNVlBNy9vMXJZUzZ3MHhJTUhENkNN?=
 =?utf-8?B?ZndpOE9yc3FRVXhlVVY0SHZBNVZpWkdtTkM0bm1PUi9KU014QTdBd1lKbU5C?=
 =?utf-8?B?bzBJeER4VWRUQzNMMVo0WmljZTlWUmgxdG5ZQTdCdjI1ekZ1aTd5MVU2cEtV?=
 =?utf-8?B?ak5jSHFWZGg2RzFCMkg2L0NVNlpOaUQ0Vmx0ZGJ4aWkwSXlMelY1VDhyenVZ?=
 =?utf-8?B?M1hocnZzSEhHLzZlSmM4VHQ2Qkh2WkVQSXc4WE9LZm1aaFJib2Mxc0NPOFNv?=
 =?utf-8?B?NmRXS1lJaUJKRG9DYjNOaGY5T3RnbnVCNmdOZGtheWQ1b296RUZUKzUwc2FG?=
 =?utf-8?B?a0NUTGllMW1ZeFdwZ3VZZWVYMU4yMlJEUUdmWjQyd0NTSmljUUN6NjNQZG5I?=
 =?utf-8?B?di9QYXBBbXhWR1FHSjczOGpHMzEyOGVGNm0yMG13ZmI2ZktZakRiM1BSZ0F2?=
 =?utf-8?Q?oZePR82Ry7MIKdsg=3D?=
X-Exchange-RoutingPolicyChecked: MCQjcq9naRyBxfI+S3GM+MmZmbkWD6sFvEJH3F45H//+wkYU9mv/hkCS9YgmHzHfgjaE9jLA2RmjbojO0o2lWlO1t5C3MRTDjuOSFZXUwNwXfHr7EkdlF3zDwnpwCBjcDxMJQPi61YBVZl0j/ymmjFm46tl1ETgBmlDSDIp/GLG74CZIEVovLbEuQOAJaMeiYZc/WN8cOds4t2P+SjE7gg0fZUK1pHFbmv59TfZP2GVTyP4O8KOKJkaZJGmqAnu5OrunZRgTefI6tFYgB+pOZureLHVSLh81dHfySMUc3ifcbDlggsTAefeGZa9oJgmgQ4McpsqjsYlnyLDsUPKh2Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9744a087-301c-4a78-cc0c-08defaa32218
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2026 07:59:29.6206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4lVsyo/rFuzm5XSfSQ6nvvDbU5BAXHu+enqr2/aEmbwdyVvCHrL7/36AluTLzXFZJiz+z44fd4B6dvIacd+tgG3MW5yxwuEJXvagwIAvBPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8B3F23403
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



On 8/14/2026 8:27 PM, Umesh Nerlige Ramappa wrote:
> On Wed, Aug 12, 2026 at 09:52:22PM +0200, Michal Wajdeczko wrote:
>>
>>
>> On 8/12/2026 1:52 AM, Umesh Nerlige Ramappa wrote:
>>> Use xe_log_err() to report CSC errors using SIGID.
>>>
>>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_ras.c | 5 ++---
>>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>>> index d1aa3794f2e0..e50ab49bce5a 100644
>>> --- a/drivers/gpu/drm/xe/xe_ras.c
>>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>>> @@ -283,9 +283,8 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
>>>           * is required.
>>>           */
>>>          if (csc_error->hec_fw_error) {
>>> -            xe_err(xe, "[RAS]: CSC %s detected: 0x%x\n",
>>> -                   sev_to_str(counter->common.severity),
>>> -                   csc_error->hec_fw_error);
>>> +            xe_log_err(xe, SOC, 0, "[RAS]: CSC %s detected: 0x%x\n",
>>> +                   sev_to_str(counter->common.severity), csc_error->hec_fw_error);
>>
>> hmm, it was assumed that for HW errors we will use 12 byte data
>> while xe_log_err is mostly for the SW errors where we use errno
> 
> Not sure I understand what the 12 bytes data is.

IIUC it would be struct xe_ras_error_class

> 
>>
>> do we still need to use "RAS" prefix ?
>>
>> maybe we should add component XE_LOG_COMPONENT_CSC with SIGID_SOC_INTERNAL ?
>>
>> shouldn't we use common.severity to select right xe_log/CPER severity ?
> 
> Not sure how to use this macro to do that though. I thought severity was automatically handled in the backend.

if you plan to report errno-like SW errors from the CSC FW,
then IMO we should add new CSC component in abi/xe_log_abi.h
with XE_SIGID_DEVICE_FW:

+	define(DRIVER_FIRMWARE, 18, CSC, DEVICE_FW, "CSC")			\

then you can use

	xe_log_err(xe, CSC, err, "detected: %#x\n", csc_error->hec_fw_error);
	xe_log_err_fatal(xe, CSC, err, "detected: %#x\n", csc_error->hec_fw_error);

or if you can match counter severity with CPER severity:

	cper_sev = to_cper_sev(counter->common.severity);

	xe_log_comp(xe, cper_sev, CSC, ERR_PTR(err), 0, "detected: %#x\n", csc_error->hec_fw_error);

but if that error is representing HW SIGID - SOC_INTERNAL
then I guess it is expected that xe_ras_error_class should
be passed to xe_log() using:

	struct xe_ras_error_class data;

	xe_log_comp(xe, cper_sev, SOC_INTERNAL, &data, sizeof(data), "...\n");

to allow proper CPER record generation

> 
> Thanks,
> Umesh
>>
>>>              xe_survivability_mode_runtime_enable(xe);
>>>              return XE_RAS_RECOVERY_ACTION_DISCONNECT;
>>>          }
>>
