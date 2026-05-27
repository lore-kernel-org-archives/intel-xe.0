Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB680CD5BC9
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 10:51:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD1010E775;
	Wed, 27 May 2026 10:51:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CmxawyLo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A4E10E775
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 10:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779879061; x=1811415061;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wFa9s+h91LmjyMWapcvJ0FJQw62hyp5q8rpHeOzQjaI=;
 b=CmxawyLovr1b3zxDys2U4cLhfs/qqeJ6e57UAab2siI1GDdjqwvfge1R
 WOuF5Co9DqgksFHFJ00S6Wnk0ljKd4jf7XmwZqDuDypL5TZp62tGDCIa1
 HvxJ1PfCeZ6/fBMBI3ElrYdL5NPUMzqJiTtrvNyRVJxDyJhiP/Fre/qmR
 JEBpaHCCse8kWzOwfYE4YFwzuMV4mju1oDbkRWGvMTNtb8AT2OZ/CiF1r
 Ek5NQ/W+naV4v9FYDcB71TykuyRpaU/zySdsyE5jxObohJgLVhCbzYQbn
 +nNmWS/58tZiQY112htwGGpMSLTqQo9qA5wGoOkc0XOuWDNo1NUXl/dbd w==;
X-CSE-ConnectionGUID: CZF6HADaR/W4+dJRj6ZSxA==
X-CSE-MsgGUID: JkhXEGa8Ti2LWqNartVhgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="91278052"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="91278052"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 03:51:01 -0700
X-CSE-ConnectionGUID: cqVFMzv5QAaW0uI2YcJNXQ==
X-CSE-MsgGUID: CGu8eXz8RoCZH+AsPM5ngw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="247280158"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 03:51:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 03:51:00 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 03:51:00 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.11)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 03:51:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WBZJT476mqTKTcZda4ydJcHLv2gM2Ijp7PQzLctVcA5bzboBKDGz5HBFbSTC2Hi6ldcK+FdqpVahVcnqws/Kp85SKdaor+wWU/7cgo4dqsiUXWqMRuiajVaL6sN2MTY1//Exg84Gizs5vzMTGGxRmCmCehcYVu/4olO9d7v9Ji8iLSruVRcDoaazdZgKw8t/I333jJ2I1M/OBPtWJ4a54NFyM2M8uMbBRYNts7J/UxPs6HPVhau54LRRpgqPHtijwAqlnbgxUel8zY8h/DzSQMOD8uw07nLwteovDCQ3t43rGcefNwmTlakX7FJ0sxrA02DRgH7zvSbjNxe7upE2Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+JMYE9U5wxq/+zGfJ2KYdymUUQjjJOFXZCZJuEnfUE4=;
 b=By/Lxury1cBL/7QqNJhl5FzWjAnBrJzM2OyLpfTZhMPa5oKYAKgtV4vJlF/mE+mAOsewAWrMjIy0R3ZgzovXiLOc2ycufWheGzntNIJSpIM112vClQ9dtKeYgmhQb/QGxBhrYEQdMX85u0CPDSrQ7LIm0N4R6gDGRSxHKQpHpQR44kPMG4IjebHoFBwyL/1S3NfsmIlM/C7Aj17mly6wVxnrMaPYkywD2hBThDfBemlOQBa6mwgx6xgN1GEhvFFlV6QxweoTpwChw9c8O1XAsgzizSHp70fEx8pLSpzmtl2BS1hc6nyLmtjdaBiR481GJZRsQ+rlgf/5MvjOtQmLDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM6PR11MB4660.namprd11.prod.outlook.com (2603:10b6:5:2ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Wed, 27 May
 2026 10:50:58 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 10:50:58 +0000
Message-ID: <03547a98-ce4e-4fd3-8ca8-ea2cbbc6de6d@intel.com>
Date: Wed, 27 May 2026 12:50:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] drm/xe: Use raw device ID to find sub-platform
 descriptor
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20260526195452.20545-1-michal.wajdeczko@intel.com>
 <20260526195452.20545-2-michal.wajdeczko@intel.com>
 <ahYOD4M54XQH0Lp3@black.igk.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ahYOD4M54XQH0Lp3@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0154.eurprd07.prod.outlook.com
 (2603:10a6:802:16::41) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM6PR11MB4660:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bdd20ea-6428-4eec-0b3d-08debbddd5b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|11063799006|4143699003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: LIKtSnD7ZqzaKfWygYHYzd0StIaWVP9iHwG2QlMPyz24H0wAKSvpzqNv4i77BxgqBZhleXbrAomDj4ZxhtRHFuBVfbvtOh7gCc6K6NIgkMosFU3PZzdpvS2Nf1YOQW4DMVjGEkGcY4xlbxVzWSXWFptwcIqbTiwgQwZisV0biaXdOa7Ks7j8tLHcKr9ZNolY+tt9hhgPbEhDRMyuIC9TXjqHuAxo2o8xhAibvCFJs9Ww4+yiORRIKXjzrESzgxHDcEgT2Dg+XkoZrTUSxKt5OpeqitfiYB3fLohYCX6qX4R9pp0tsM8PHZWCM6Ve5ErH0DSmIdiq9xyTrt9dB2OG+H/oMCoruCqoIGbOaroTaaT8WTa+aIRh1erDjqJi+BbgjAMTEomz9BnQhYY+bFas7WJZNluDbgw/vUzlQ4BKktSUHzYfN6muDU1jyQEUjn0FvxZmR1ZncexN+hQi7qkS9rYair9lnHneKXsAma0L1fEh3E5dIp1yLpgrJgvfyFr3d4W9S7fxZDAwDTA3w1LeFd7+5DibY0OObcuaYuFXY4CN1jq4MqUJ7XUR6cM5TrweZ5YvzmM1D/d2pSXivmXzcWVioSznrPQM0KpmYQepIMZiD6n1LXG45uz53r+1jUfwh52uWL5ATpc7a5uuCqJAl1JS+0qTP7XZCbipHuPlsTFO66Y7hm6gO5awKksEvC/i
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(11063799006)(4143699003)(18002099003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlZkVjQwcklEcFZ3VU1YK1R2UUVNUFpRSlJicld5UXZVbVhnYnhCNk0wekxL?=
 =?utf-8?B?bEp0a0I0RVhSSWp3UG1GMHU2V2M4cit1UHdRN1ltRmM1TXorL1RNalYrU01Y?=
 =?utf-8?B?QXZZbU5wb2tFZU8zZjRlZU05c2oxTzgwb1NzbDBRUlBrSDFvRFBIVmZTUC9X?=
 =?utf-8?B?REdJL2FYRUVrSEwwK241dGRGWnJ0bFVwZ2VLNzc5NVpvTDRNSEpSb1pLZ0Iy?=
 =?utf-8?B?cGh5eHAzOGRUb1dtK0d0WjBZTStpRWF1MFJMTEQxNURCZk1MeGRVcWFBTVZ4?=
 =?utf-8?B?MzlYb09CVUo3cHFEY0VFQ3hLYm9kVnFXU2VXdm1BR205aEQ1RGsvZWozcjkw?=
 =?utf-8?B?SXhzNHhXNmY2cEFkQ2xSd1YydGxmTThERmR5ZDFPWmViMVByMnJKUE5OVzRV?=
 =?utf-8?B?eXV1SVR4bUtlMnNUOWc1U0xYT1hjRzcwSlNoaXduRUVUYjRHV3gzN056M2h4?=
 =?utf-8?B?L0h6Tlo5eGNMRnVMMmVZV3h2eEZzMFh0c1llUFJyUlJ3eXVweGZ2YU1wUk44?=
 =?utf-8?B?Z2VWdWNvSFB6Z0RRTlBlVEhEckJndnh3ME5YemsyeUNYQ25pbzJqUmlPcXlo?=
 =?utf-8?B?UEZzZmo4U05tckJKM3dxK09KZThkcVowRXpjRVBodDFDTzBQVG94YVBZUWdp?=
 =?utf-8?B?amwwRGlFZTMzQUlndDNTdmtGTEJsOHlLMzBqYjZQekduaENRSUZpWHA0SUpJ?=
 =?utf-8?B?YXVBVGtwTzdRMDN1dkFiSTBWZk1VTzN6cHpSblQvM2RhS095cmJNV3l3Um1q?=
 =?utf-8?B?VXNWTi9ROVZVK3FkQkNmZU1uUWtWanpNQkxUQ1NBdHFjQkgrV3hzWmtIRk5z?=
 =?utf-8?B?eGUrN3hLNHBVKzFtUGQrNmk1UDJ6K0lJSUgzOXFwc3g3Q0RDR1BHNGV3QjB6?=
 =?utf-8?B?cjdteHF0a1EwTW1zSUd6S1NZdUlkQnhuN2tZUVB5TEM2bEVZbU9BN3NZck04?=
 =?utf-8?B?bHpJUW9venlxT1pjWlluR1N6VTVHWTUrWGhZVUlEdTBSakRtdjVPSGViT0JT?=
 =?utf-8?B?S0VkaVZHbWNsSG1aM051cThEWHZxdHFwcEhtNHJrSmF3YlFmN0xybTVOU1o4?=
 =?utf-8?B?b3JTWjB6WDhwTENZREVKUDM1N3BUd1h0b0VSZHZ1Qjg5azRIT0xNMzVyMCtD?=
 =?utf-8?B?VXErZE51Z1NsUmRYSkxnNUVJTjNNbUlhSXFnYmtneHU4YTdnbVpxMEFPSkhi?=
 =?utf-8?B?OGV0bC9MRUIyQXBqSFMyNWczQ1BPWHp6dFVsQXFRcjVSR1BhUmFOVHBpYTdt?=
 =?utf-8?B?bXRRN0VodkZZaytHSFN5MDdmN2tWR0ZmMVcxV1YxOS94a1lmTVpsRVV4aDZa?=
 =?utf-8?B?VWRGOUpaTEJOWmpZR1hKcWtYYTQ3QXRPbVlwMGp0L0g4aStYQUNTaGZkdjlu?=
 =?utf-8?B?USs2NWEwUWhseDNESU1DbzRqbTArRXdWZjk4TkM2MDM4emQzRnNtYmJJcllU?=
 =?utf-8?B?SHlhQTNIa0xPMHZuTUhxVFo1TElwUmQxb0pLT21Gb1hUbTZJQzdoWnBsaWN3?=
 =?utf-8?B?RnpQS0hDbnlxZlQ2S0p2QkpTdC9rbFdHb2pBS095U2RMeTk3aHpldE9QOExk?=
 =?utf-8?B?b2ZCcWVSTDZ5R2hBOWlQSXlBVVU3ZDFjQnIyaGljbmlsL3JpRFBoYTlJRWwv?=
 =?utf-8?B?cUt3eUxGcXpPQ0RoNVEyS051Z0R6cVBwcDVveWZSa2dHZ01nSHkxUWVUeWd6?=
 =?utf-8?B?S1VPcjRoNXhBUjV4d3Z3M00xSHBZUzBoUXVxWi95NHJ6S1dLNmEzbXNUNHA2?=
 =?utf-8?B?Q0RZZEZoKzhYUHFZSnUrMmZKQjRIeG9GT2E1cmovUUNGQ3JGcTFkV0taeGtU?=
 =?utf-8?B?Mnl0eE5DT0p4S2JqZFhFV0JqekVwRktkS3JLRlpZL0IvSDRLbXdUaUU5Qkdy?=
 =?utf-8?B?ckp5ZUEySVBwQ1lqK0dxMFJud2ttMC9lL1pRcWxZcmoxMzJKRWkvVnpVVGxo?=
 =?utf-8?B?cURaaC80TjNJdjlFalhNR1hYd05GcjRHS2IyUEp2cHRpRSs0RXVJY21JZmVq?=
 =?utf-8?B?Qnk4eGVuZUtsU2laTjg5Y2kxMTRHWVUvTHdyV2gyVTd4MTVyaWowVS9Pbkxz?=
 =?utf-8?B?UFN5TWVZOUc1eDJJSVlDMGVJbU13Q0VWM1A0Yjl5MTZBM2djVGVVeDJBSHFo?=
 =?utf-8?B?L25EeHNsRXZLUDV2WG5hRGtiTFdjQ2J3Vi9UbzNmUW5uVllMaUptNWh0SXFF?=
 =?utf-8?B?RVJZRzg2dDN2Zzh2R3l5Tk9mQytPK0VYMkNZbU5WQ1d6bFVPTEVTbDkwWUZo?=
 =?utf-8?B?RTRiN2xHbExmWitBay8wOXBHVnVEdGU0QkVTTm0ydTVRNUs4blFZNGhYZUVt?=
 =?utf-8?B?NGdvd29DK3hRUU03MHl1MjhPbWRzNEt5a2VYc3N3RVEzYkJQb0JBZlhWdVlN?=
 =?utf-8?Q?EKA7uUvn48XFpeKw=3D?=
X-Exchange-RoutingPolicyChecked: eMdo+JHPORSKbSvajCpywdFE/mwH9FQYJ9iw8sxOpJ4TZBhB49rJTtPj5cnS2cAh7RaUk+03a8xWkGtlnlKB9rtYbkkUkKBECYtFt9vNpAxNRCwlQ5zWn5M2xIefFynJvzdE8+GpJ5um4CTxrf12kT/XSC8HDzNfP0l4bPvkJHDJhFjVaeT5jB5wct2AK0GA1OEvVTuKgFaJ4X/uDf7g7DkiegpwFDCLH42nvTG+u32UX/C4h7V0rOQpqtEufu4p1VY0TCxbh4+z7YU3O2i6uI6aOj6YX/SWw+A9JdDre94970MWr9btGXBdUCEHac2Pl4ROSoBQRcDZto6EPFNwOg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bdd20ea-6428-4eec-0b3d-08debbddd5b0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 10:50:58.1812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wTLOoHwaaUI/vB/xvJo70rsnJpuixHrPc1yDIBjTsm8d63WJRCDKm2gs5aBuFWoLD7MjbvRWWHtuooxFfw+h2GlNzuWdoDuRdTVE7NNG5og=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4660
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



On 5/26/2026 11:18 PM, Raag Jadav wrote:
> On Tue, May 26, 2026 at 09:54:46PM +0200, Michal Wajdeczko wrote:
>> We don't need the partially initialized xe_device pointer to
>> find the sub-platform descriptor, as for the descriptor lookup
>> only the device ID is required and it can be obtained directly
>> from the pci_dev.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_pci.c | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index e2a1232c4fbf..59b18a80100b 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -576,14 +576,14 @@ static bool id_blocked(u16 device_id)
>>  }
>>  
>>  static const struct xe_subplatform_desc *
>> -find_subplatform(const struct xe_device *xe, const struct xe_device_desc *desc)
>> +find_subplatform(const struct xe_device_desc *desc, u16 devid)
>>  {
>>  	const struct xe_subplatform_desc *sp;
>>  	const u16 *id;
>>  
>>  	for (sp = desc->subplatforms; sp && sp->subplatform; sp++)
>>  		for (id = sp->pciidlist; *id; id++)
>> -			if (*id == xe->info.devid)
>> +			if (*id == devid)
>>  				return sp;
>>  
>>  	return NULL;
>> @@ -1065,6 +1065,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>  	struct xe_device *xe;
>>  	int err;
>>  
>> +	subplatform_desc = find_subplatform(desc, pdev->device);
> 
> Nit: Probably not worth looking up the subplatform yet in case we fail
> early, but upto you.

I plan to update our early welcome messages where having a sub-platform name will be a bonus

> 
> Reviewed-by: Raag Jadav <raag.jadav@intel.com>

thanks!

> 
>>  	xe_configfs_check_device(pdev);
>>  
>>  	if (desc->require_force_probe && !id_forced(pdev->device)) {
>> @@ -1099,7 +1101,6 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>  	pci_set_drvdata(pdev, &xe->drm);
>>  
>>  	xe_pm_assert_unbounded_bridge(xe);
>> -	subplatform_desc = find_subplatform(xe, desc);
>>  
>>  	pci_set_master(pdev);
>>  
>> -- 
>> 2.47.1
>>

