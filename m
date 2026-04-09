Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDA3EA3C23
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 10:15:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F74C10E74A;
	Thu,  9 Apr 2026 10:15:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QSfPcdh9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC98910E789
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Apr 2026 10:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775729715; x=1807265715;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=R6bQR468tgCt/txIA6erRI3+TzOMv6uHmBb3tnwkMyQ=;
 b=QSfPcdh9Tw0I/7KJYK9zOra72PTCv94agi4vxiPZqkimbOH9f7gHQyp1
 bsrso3xXk0fUIISIFAEdKe8e+BcEmlP4X8Tk+MM9CEKIugrYdWVsY535y
 EEmwRYYH6ESavBXW2MtbyyRgYUHQy6dVRo1UVTZZAU3GPK+8kJSqhTIDk
 g6oO4r2CD41/LJk9vtd4ZW9BLmvkdlOeMtvsMTo+IRoPYsNWbao1EMzf7
 UBUnwL5U2Om0aq6uaP+eXiQ1HrX/E3yC+Tig8d+KyXoaTRiWVFmTR9EJf
 oAime+bhrmiAU+9OA06oZW9Sja+WMtlyNsKxvGMvO3WFY77Gd0wRLy50O g==;
X-CSE-ConnectionGUID: KQDjIUPySVuK2l9264FChg==
X-CSE-MsgGUID: vfJ2kkAnStW5rGEI9Rve8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="76693819"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="76693819"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 03:15:14 -0700
X-CSE-ConnectionGUID: Y2tF5XEsTNaMTypKIV6YZA==
X-CSE-MsgGUID: saojyrMuRmSjqK8eJVbnnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="233098678"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 03:15:14 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 03:15:13 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 9 Apr 2026 03:15:13 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.48)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 03:15:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IMl+i3R/zJkXNzClpOOks6cbShkeKC/3lrTOHP+vbh3QRUzNi2wbfTEzIPpz4J7vFbFlziHE09g06p5uHrdd4AI/kWg4haxb+XSaQhMGUSTFwGC4Y3XXh8PVj8ae81saPhLW4OdwMhISsYHRX1S7HzpezWBZ3XJGu7YWu7LUEwQsiy1dlKKCTC9rasdTvSIYLhURozNnFjcYOfd2jBDAmU7Qa14WRPQuJsdGXGZ0dZCrtYGz4IAJLCdqHKAV1tjnYX7uWmmGTSJV9X2Swy35tO9nIBcBD29i9BbLKmhuhskJ4tlTc//bKyD3p079qvdYxCDxn8VnpEFjVDd3yEst7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ztxq2xYrOEO/qWvP5MVnB0s6mbwasvvO9OOx4I151iE=;
 b=J1xoQw8nfczHEtLLivBNLVZZBmFk8+UNRZ+7tMqO6GArKpleD6mLNPIkFCGYkj7/30azZaMYjM+PaF8dIs3Q4S5jz/1LQ36EYMU+btDwFnwjJOmPUxNtQjNan7yyTcFsSB629i2CYqILmDKhR4rCJTlyFnwt4iCsLgPZIb+gWSU/adxoF7Ldj57T51CoUhMI8tR8Totpyj85KTAjwco1d/qUNNbMXMg//USIZ4a5lY8MhxLbe6768xvPXnx+exFwsj9tcpO8lFhY9kXYgtJ6TPn7eZccfh7fUbjYDETM4ChguZqO89UhfA5jT3gjkWVvhYcVYBFAMuMjaLkCrBOIjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA1PR11MB6466.namprd11.prod.outlook.com (2603:10b6:208:3a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 9 Apr
 2026 10:15:01 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 10:15:01 +0000
Message-ID: <2407952c-982b-4b5d-85d4-9c01fc862a03@intel.com>
Date: Thu, 9 Apr 2026 15:44:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] drm/xe/ras: Introduce correctable error handling
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>, <anoop.c.vijay@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
References: <20260407110629.198158-1-raag.jadav@intel.com>
 <20260407110629.198158-4-raag.jadav@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260407110629.198158-4-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0265.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA1PR11MB6466:EE_
X-MS-Office365-Filtering-Correlation-Id: 13c48c7f-69aa-4bbc-0bc6-08de9620dc52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: vJQN/TqlRCy5EDEzO5d6natz4/29Xa7lCaI6ytWV31PnCYmDAgfPg7dhg6xxHvM+rnR3QaHJqP+VQHIVFN7cZ1pik2ddcJpADpWD4eYK7XFXVbWcxyQ5XpGT54+I5MYIRgpYRjzFMI1pFrbWAC1zhZ9GPq6yhcZmWOIygwKdoqI18KRTB/IN+lJvxaweq3/MNxeZg6XZ4PYP6DpccaVNKRUCbNs+3lE1M7k9EAz2XN51lyFMNzOP+XPVzGMP3kHYHWCaGbRu213LP+6LDkDeeN4nm9GfEAvFwVJlEzItuxqjBhq887/tiwVicN/WsqhwSSX9A1M2VO/PQQxlZzFKvv/s7ofCPKD1dwRWNfAHfQmudotumwiCzBAKQrH3Rl734mDz9E1uj3bX3W8FbsQg/Cy5Ssb/H3awRFxbkUOcJiBlSMaSi8u0gKMWl27/Q0yakk4HBjoaYmo36UoR8xKeOd1FsfiXOSKuLVez5gtWv7LwjzMYvalGoW0vAvXOPa+b9glGMUtMrwRPyVjPIVdJsqdflvTYmbHHnRHLJ8upM6gXUUQZ8P2HIQra2ajQxBgSr5aRec2D54h6bJaqx/cViDBd2RFTk1k3KBgJi3yvYyw3xSmbNE+CmEV6XnsRgQpa+qmuaNM4EzdvZDChu3a4hn+c8CpSuKHd8mbfyCcBInvxLSbiGqCX1+heapVmPvdscj1uJTav0/72CXjI2Gtx2IIivQgpXUP9jB/wgj6JOeo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2ZHRnlJUThjY2twZmRnQWJsQnBDVjc2bTQ5Q01COUxvZkV0dVNJUGpGa3Nr?=
 =?utf-8?B?V0tFamQ3eTNra0VpL1JkN1JHdnJSYlA1cTRLL3ZkU0E3MFB1Qm1aK09NWDNy?=
 =?utf-8?B?WVY5cjBIT1V2TVZSQzA3bFZ5eE9GRjdNNW1YZTZDZFB1OHNhS0pQaDUyZzIx?=
 =?utf-8?B?ZWFpQnIzZkdvTExGNDJ2Qk9PelppSGoxUFV1QlNHbUJPOVBKYUtYWldNRldO?=
 =?utf-8?B?aWxvb1p2NGJJNnFpSU0xcUcrRXAxVW4vaGJnbUtoS2ZXUm5peWVSVTZYVkYx?=
 =?utf-8?B?SGdlZFRkMlA5VFowQW5HS0RuVTdDSCtKdFJvcnVsejU3enhOM3J1bFQ3d3F5?=
 =?utf-8?B?Mnk4aEd3endKdGE2VGlHQ3I3QllGejN4aXY3clZRaWR4b05RVHpXN254RDVM?=
 =?utf-8?B?YjB2dlY3Q2hxUEkvVTc4emgxTEU2MDY2Z3JsSUhuYTZ6amNXbStXYU1lUGJM?=
 =?utf-8?B?elZTK1JOZlNVaGZmOVRNUFlqdUdlZUlpcGhkRllGRFM3eFJvNlcwZUVINGJz?=
 =?utf-8?B?T25VNnp2VGs5MHIrZm56bGQ5Mm8wNmsxeEh3dzhCMjlRbzRrK1hWVGFHZlZo?=
 =?utf-8?B?SnFjdXlrbDF3aVJuNi93ZmxTclJBNVdaWG15YUYzeGUxTGNQZG9HL3FySklm?=
 =?utf-8?B?dHFjdHl4WGtkMTdQNFdjNDBlaHE2QmZzYit2Wlk1TUFQOWhhWStVbmE5MkIv?=
 =?utf-8?B?N0Q4QlUrc1NjbGhlR0NpRVlsQ1lvOEFaMFpNTk56bmZ5V1VXVEJaYWUvVmE2?=
 =?utf-8?B?YlQ1aktBS1p1d21xZE9MZjBVeHlFRkR5TlpBNHd5dGdQUkxtMnJpMDJydDBu?=
 =?utf-8?B?dFF2a0RNYVZYeFFhZ2FkcHRFSHdRblZtSWFkdnNJUE9TMzdla2dpdm5mamFx?=
 =?utf-8?B?WkdVbHgxSC92WFEwZ3JPallnTkpSODlSRkhSTmZqMm5hWEVqZTNvTXVrZE1Z?=
 =?utf-8?B?a2FvNU5kZ2ZOczJCbGRkcXFndkw4MWRrNnIzT2NXdFVVYVVvOHczR010MjRx?=
 =?utf-8?B?enB2WDZnemVWUkNRVEJnNUxRaG9YdWNXeFVuNFFTWlMvNDcwUEsvYVE5Um85?=
 =?utf-8?B?d25INlA3M3hnNHJNWXNLam03bk5iZmlscFdIWEQvRlJPZGluZ3JRL05VQXcx?=
 =?utf-8?B?ekdDUWdVd1JEM2RYeHZYWlhjSHBxQUxaTjZaMmduajUxSkxWbVBadFMydVJL?=
 =?utf-8?B?d1FuVGVIbnE5ZnIvN09xRU1QYm81UEVaQndpU05oMWYwT1BGd3lvSndsTWFm?=
 =?utf-8?B?ZEhDc3BqeU5KMTYvOExuY1hrVlZqUnB0eHRZd2tYdmU5eXNxTjE0aTRGR1ZP?=
 =?utf-8?B?OTRMc3p2eHFYa1QyZk1Ma1hhbWo1OTMwTmVOUzVKSURWbnNqVEkrcm1TSmVK?=
 =?utf-8?B?c0RvUmhhZ05UWEtHa2J0Mkt3N1djZXB6dk1TUW1IZGFFenFsY2F2UWQ0cEo2?=
 =?utf-8?B?bTdxVnBGZVlTSzY5amp6aWJVNTlSa0NmZ3BMOXVsSjZqUFlXZkxMQ24yOWlm?=
 =?utf-8?B?c2QwV1V1ZWsvTk9GMTk0OVhWZWtWZ1V6aERZV0dTLzdmQ3FvTERrRFloVkVZ?=
 =?utf-8?B?QzZQVjVPeVkrVG9Femk5SUFzSy9lLzhGd2FrUklDZEZSUUszNXpSdUlJMk1v?=
 =?utf-8?B?dFVuMkFFQlhjTzNuc2YxdmQ4N3k2OFFNR0w3dVVXM3dCdzgzWkpxVDc3RnVv?=
 =?utf-8?B?N2JLenZQdUt6OEw4bE9oblpBZEkyd0FlcWN1V3BKRUswVm5odCswMm1xaVF2?=
 =?utf-8?B?emUzNWVyOUhLYjRZaE4wd3VIKzJZRG9HK3N1enJVR0g3MEl2amI4ZnFEWEp4?=
 =?utf-8?B?TWhtVG9KMndpVUx6V2N4QjN6K29XM3Y3dmhvZkNic3VVam9GNjM5bGZmUkNm?=
 =?utf-8?B?OFRZSWlYWjcxcXJ2WFAzM1NhRUNNYVZFcXFKcE03bnRFKzhxb0J6dG1sbmVP?=
 =?utf-8?B?SWozM09nN0k3TEc0bVZwUDFlY3lERmVkNUVVS1NVb0pGMFhVOXNyWnl2OTd1?=
 =?utf-8?B?VHdFaUdCN210OFhoRnRxRHVjSzhzODJEL0xmSlh4K3oxOG5IYlVBTmZFNThH?=
 =?utf-8?B?Vmdjd1hERVFyTTdvREJ3QmFLcHpiazYzTmk4VmFEMmZSeUlZZnU5OEE4aEZq?=
 =?utf-8?B?UzYyVmxnN2RIRUp5aStnRzdNWmtoZ29aK0phZXRINVpTY3NjQ202TG1Bd2JS?=
 =?utf-8?B?bEF1dFp3YlBDWTJtRTZjcXVsMFM1THAxeGkxUHducldZWnFodENoNENXWWRL?=
 =?utf-8?B?aFlndk9ZbTR3dXhRUmszNVFlZ3pnSk5BbEpUU2dxaWhJY25XNHRidk1rTXhM?=
 =?utf-8?B?UXRoN2dEbzVrN2lycnNWWHZZcm5wK09yY0FldVRCb1VJV2FGSFNRQT09?=
X-Exchange-RoutingPolicyChecked: Tkwkx1dpbXlhsYk7Q7S1bJCGUzEMgAjLgzE5tPI7jwNOUXLeLHKiwhqurQoOhTLrXRkMMs7Rvj63BOsnq34YmyZdKAwkgwJgRVinDC/YlwX6xDy0mTojD95MfQygmXv6bZEBYP+ujPctTN7PGHV0QMkmH0/ZNJx3806UVEKNnNB1PnHK4HhQ6YkzDpGqeMcx0kS8SpoZToTnYoeEOIxKDYsKxBLHpqfDr7zxGCmfO+vtis85KR3UjrQ2baYS/NuRYEl4kM3Ydlj8D+dt9jgzC8mrdQa6IVfUp706Hqiyt0v39sMStAM+gED6bOI5XqrOdKPSWl5vDHNu36/np4VHyQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 13c48c7f-69aa-4bbc-0bc6-08de9620dc52
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 10:15:01.6330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nYxuTcUT+e863IKfrJ1cNlO2uBnwXiGnmKmEVXZzVTr3OZGB/VD0/ghQSLCT+r6SBb0FhSZ5A4RnzLmWNkhvjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6466
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



On 4/7/2026 4:36 PM, Raag Jadav wrote:
> Add initial support for correctable error handling which is serviced
> using system controller event. Currently we only log the errors in
> dmesg but this serves as a foundation for RAS infrastructure and will
> be further extended to facilitate other RAS features.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
> v4: Fix Severity/Component logging (Mallesh)
>      s/xe_ras_error/xe_ras_error_class (Riana)
> v5: Handle unexpected counter threshold crossed (Mallesh)
> ---
>   drivers/gpu/drm/xe/Makefile           |  1 +
>   drivers/gpu/drm/xe/xe_ras.c           | 96 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras.h           | 14 ++++
>   drivers/gpu/drm/xe/xe_ras_types.h     | 73 ++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl_event.c |  3 +-
>   5 files changed, 186 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_ras.c
>   create mode 100644 drivers/gpu/drm/xe/xe_ras.h
>   create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index c0e820eeea30..f66561977a45 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -113,6 +113,7 @@ xe-y += xe_bb.o \
>   	xe_pxp_submit.o \
>   	xe_query.o \
>   	xe_range_fence.o \
> +	xe_ras.o \
>   	xe_reg_sr.o \
>   	xe_reg_whitelist.o \
>   	xe_ring_ops.o \
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> new file mode 100644
> index 000000000000..6f84ade02057
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -0,0 +1,96 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include "xe_printk.h"
> +#include "xe_ras.h"
> +#include "xe_ras_types.h"
> +#include "xe_sysctrl.h"
> +#include "xe_sysctrl_event_types.h"
> +
> +/* Severity of detected errors  */
> +enum xe_ras_severity {
> +	XE_RAS_SEV_NOT_SUPPORTED = 0,
> +	XE_RAS_SEV_CORRECTABLE,
> +	XE_RAS_SEV_UNCORRECTABLE,
> +	XE_RAS_SEV_INFORMATIONAL,
> +	XE_RAS_SEV_MAX
> +};
> +
> +/* Major IP blocks/components where errors can originate */
> +enum xe_ras_component {
> +	XE_RAS_COMP_NOT_SUPPORTED = 0,
> +	XE_RAS_COMP_DEVICE_MEMORY,
> +	XE_RAS_COMP_CORE_COMPUTE,
> +	XE_RAS_COMP_RESERVED,
> +	XE_RAS_COMP_PCIE,
> +	XE_RAS_COMP_FABRIC,
> +	XE_RAS_COMP_SOC_INTERNAL,
> +	XE_RAS_COMP_MAX
> +};
> +
> +static const char *const xe_ras_severities[] = {
> +	[XE_RAS_SEV_NOT_SUPPORTED]		= "Not Supported",
> +	[XE_RAS_SEV_CORRECTABLE]		= "Correctable",
> +	[XE_RAS_SEV_UNCORRECTABLE]		= "Uncorrectable",
> +	[XE_RAS_SEV_INFORMATIONAL]		= "Informational",
> +};
> +static_assert(ARRAY_SIZE(xe_ras_severities) == XE_RAS_SEV_MAX);
> +
> +static const char *const xe_ras_components[] = {
> +	[XE_RAS_COMP_NOT_SUPPORTED]		= "Not Supported",
> +	[XE_RAS_COMP_DEVICE_MEMORY]		= "Device Memory",
> +	[XE_RAS_COMP_CORE_COMPUTE]		= "Core Compute",
> +	[XE_RAS_COMP_RESERVED]			= "Reserved",
> +	[XE_RAS_COMP_PCIE]			= "PCIe",
> +	[XE_RAS_COMP_FABRIC]			= "Fabric",
> +	[XE_RAS_COMP_SOC_INTERNAL]		= "SoC Internal",
> +};
> +static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
> +
> +static inline const char *sev_to_str(struct xe_device *xe, u32 sev)
> +{
> +	if (sev >= XE_RAS_SEV_MAX)
> +		sev = XE_RAS_SEV_NOT_SUPPORTED;
> +
> +	return xe_ras_severities[sev];
> +}
> +
> +static inline const char *comp_to_str(struct xe_device *xe, u32 comp)
> +{
> +	if (comp >= XE_RAS_COMP_MAX)
> +		comp = XE_RAS_COMP_NOT_SUPPORTED;
> +
> +	return xe_ras_components[comp];
> +}
> +
> +void xe_ras_threshold_crossed(struct xe_sysctrl *sc, struct xe_sysctrl_event_response *response)

Let the parameter be xe_device for xe_ras file. I don't see sc used in 
this function.
I think the second parameter should be void. But upto you.

> +{
> +	struct xe_ras_threshold_crossed_data *pending = (void *)&response->data;
> +	struct xe_ras_error_class *errors = pending->counters;
> +	struct xe_device *xe = sc_to_xe(sc);
> +	u32 ncounters = pending->ncounters;
> +	u32 cid, sev, comp, inst, cause;
complete names are better than trimming or acronyms
> +	u8 tile;
> +
> +	if (!ncounters || ncounters >= XE_RAS_NUM_COUNTERS) {
> +		xe_err(xe, "sysctrl: unexpected counter threshold crossed %u\n", ncounters);
> +		return;
> +	}
> +
> +	BUILD_BUG_ON(sizeof(response->data) < sizeof(*pending));
> +	xe_warn(xe, "[RAS]: counter threshold crossed, %u new errors\n", ncounters);
> +
> +	for (cid = 0; cid < ncounters; cid++) {
> +		sev = errors[cid].common.severity;
> +		comp = errors[cid].common.component;
> +
> +		tile = errors[cid].product.unit.tile;
> +		inst = errors[cid].product.unit.instance;
> +		cause = errors[cid].product.cause.cause;
> +
> +		xe_warn(xe, "[RAS]: Tile:%u Instance:%u Component:%s Error:%s Cause:%#x\n",
> +			tile, inst, comp_to_str(xe, comp), sev_to_str(xe, sev), cause);

As mentioned in previous revisions, let's keep minimal logging with 
severity and component.
Logging should be consistent across all patches so let's keep minimal 
for now and add detailed logging
as part of a different series.

> +	}
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> new file mode 100644
> index 000000000000..92ee93d4e877
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_RAS_H_
> +#define _XE_RAS_H_
> +
> +struct xe_sysctrl;
> +struct xe_sysctrl_event_response;
> +
> +void xe_ras_threshold_crossed(struct xe_sysctrl *sc, struct xe_sysctrl_event_response *response);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> new file mode 100644
> index 000000000000..0e3ba9e81538
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -0,0 +1,73 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_RAS_TYPES_H_
> +#define _XE_RAS_TYPES_H_
> +
> +#include <linux/types.h>
> +
> +#define XE_RAS_NUM_COUNTERS			16
> +
> +/**
> + * struct xe_ras_error_common - Error fields that are common across all products
> + */
> +struct xe_ras_error_common {
> +	/** @severity: Error severity */
> +	u8 severity;
> +	/** @component: IP block where error originated */
> +	u8 component;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_unit - Error unit information
> + */
> +struct xe_ras_error_unit {
> +	/** @tile: Tile identifier */
> +	u8 tile;
> +	/** @instance: Instance identifier specific to IP */
> +	u32 instance;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_cause - Error cause information
> + */
> +struct xe_ras_error_cause {
> +	/** @cause: Cause/checker */
> +	u32 cause;
> +	/** @reserved: For future use */
> +	u8 reserved;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_product - Error fields that are specific to the product
> + */
> +struct xe_ras_error_product {
> +	/** @unit: Unit within IP block */
> +	struct xe_ras_error_unit unit;
> +	/** @cause: Cause/checker */
> +	struct xe_ras_error_cause cause;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_class - Combines common and product-specific parts
> + */
> +struct xe_ras_error_class {
> +	/** @common: Common error type and component */
> +	struct xe_ras_error_common common;
> +	/** @product: Product-specific unit and cause */
> +	struct xe_ras_error_product product;
> +} __packed;
> +
> +/**
> + * struct xe_ras_threshold_crossed_data - Data for threshold crossed event
> + */
> +struct xe_ras_threshold_crossed_data {
Why data? Can be xe_ras_threshold_crossed Thanks Riana
> +	/** @ncounters: Number of error counters that crossed thresholds */
> +	u32 ncounters;
> +	/** @counters: Array of error counters that crossed threshold */
> +	struct xe_ras_error_class counters[XE_RAS_NUM_COUNTERS];
> +} __packed;
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> index 8a2e44f4f5e0..139ecd4aafcd 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> @@ -6,6 +6,7 @@
>   #include "xe_device.h"
>   #include "xe_irq.h"
>   #include "xe_printk.h"
> +#include "xe_ras.h"
>   #include "xe_sysctrl.h"
>   #include "xe_sysctrl_event_types.h"
>   #include "xe_sysctrl_mailbox.h"
> @@ -38,7 +39,7 @@ static void xe_sysctrl_get_pending_event(struct xe_sysctrl *sc,
>   		}
>   
>   		if (response.event == XE_SYSCTRL_EVENT_THRESHOLD_CROSSED) {
> -			xe_warn(xe, "[RAS]: counter threshold crossed\n");
> +			xe_ras_threshold_crossed(sc, &response);
>   		} else {
>   			xe_err(xe, "sysctrl: unexpected event %#x\n", response.event);
>   			return;
