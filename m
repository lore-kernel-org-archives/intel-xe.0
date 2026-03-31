Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA1710F92E0
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 16:16:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F5910E1B0;
	Tue, 31 Mar 2026 16:16:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dZlAw2FI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F8510E1B0
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Mar 2026 16:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774973785; x=1806509785;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DN4PP1BQCjCurwioab5oJXD5XL4de3QoDSYVssATmFk=;
 b=dZlAw2FINYBfujcATHusGJYn1g00xtZ301s9ugKyMCN2qPkM61taz+ho
 DMkd+wm0x0o4LG8cVEp7SXpvCiyXxQ4VloYtFZFzhVtSOpzWia94X8FD3
 8+s9HYA5S4O45Mj9y7OxpQkpMC3AW66JHBapUN0xOE7gtMtLVaJVEUjrv
 7rl3W25tCGXoYZ9tCnfkjulgqRGD5zPaKdPQwkh4AzZNWwSkfsfRy/w2D
 Io0gQSjahqf0K+2eCbKxtX88PWzcJqO3RTPGbZpd43qpg4g7Qhj/t73DZ
 kNoxEoUy1Ol2vG22hN2XAPXhsMAfh7wXnsVOGtno6cSXTECyNW2XcdIZx g==;
X-CSE-ConnectionGUID: FwbEhpp+SBeZ2+KAoCjvfw==
X-CSE-MsgGUID: pjXrI3rhTi+jlGbF8dAh7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75956388"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="75956388"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 09:16:24 -0700
X-CSE-ConnectionGUID: PmOz404sTUOHzvyI2RsqQg==
X-CSE-MsgGUID: Y3Vz4clrRMqIW+8DgiveVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="226660623"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 09:16:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 09:16:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 31 Mar 2026 09:16:23 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.43) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 09:16:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Chnep7XrNb1IbzD8iGLsJYoTh9/glEO6WQFOxu04a9Xv55AMwdfNNTINqP1evkL5WHLLXdupUcrOeiDogblM4jbWftAs3akv0eZt54zuKVRWYfNVM5Q38sQjt3wWguWiXlMt+jlRZGvwzdu9IfUHnb932erhfhkh/LDMN+FX/rJkgT1p2J5EdEOFaYoVAxIDZLzGDpFEuAQkAaINo61q7CGTQPaHq0+LkBebJOWe45QOdrdj1exk66GMlL2yW3Hno/9tJgetX0Wu+IuUVYzREQzIXsZcvZkZqnrD3/DQUVF9zCT2yLjzou7xgHYMOUCN2YL9C0sOlKPvXmkeSGmdqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGjUUFOZUK7zGHh3HhwbDDdRHZVYhhUfXXS7RCiVCrs=;
 b=VG+oy++qIbaaaYCBhZMapEa/hFs1ANt+iIzu7PMIt8UDmhFwEbDYcnDH+eoAVBTY8dm5b+eTfj1ocyHk2GFjBWi2wEWhBTIGpP2VB9ydVMiJijjPOmpPP1tm4fEo+iUxXXdWo3iAgvajv1zCuixHT2TaB957XfuJYr5k5yW90rhZFmCJkV0bGgWW7nRaQupaZq+1n++2Ihp0T5r3uOw1qetgEcVggRRcyipbpOyF2VUAiVouWUfiQE0BaH0T4Exqu/2jqGpuyFJAsthIhNzwG8n9XGD0j9O2NX9uffjaelNtOBG5eYoKK/iiPlLQ8D9QhgTeh605oJNcf/b1C9fRdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA3PR11MB9253.namprd11.prod.outlook.com (2603:10b6:208:571::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.14; Tue, 31 Mar
 2026 16:16:20 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 16:16:20 +0000
Message-ID: <ccbda115-926c-4975-a62f-e901158d2f37@intel.com>
Date: Tue, 31 Mar 2026 21:46:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v2,08/11] drm/xe/xe_ras: Add support for Uncorrectable
 Core-Compute errors
To: "Purkait, Soham" <soham.purkait@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>
References: <20260302102155.4074630-21-riana.tauro@intel.com>
 <6392e82e-371a-4474-b456-0a0affa29db5@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <6392e82e-371a-4474-b456-0a0affa29db5@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::24) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA3PR11MB9253:EE_
X-MS-Office365-Filtering-Correlation-Id: 21a8dd8c-7812-42d2-32e5-08de8f40d814
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: BJ7TjTjAG2HAT1m25A3GtSzbMT+hSRC2axHdIcZpsPK0U6z+TDNnfrbbocFAZd650RwfW1quFS7PJCubuM9zzY1AaiFcPe0iVZeWh+MzBIE7Z0h6rrkUvZMAXPOyAipd2AKrL+aWMqY5Xhr5zpvg3Ac7Pheoi3TcjK4fH99rjaUEv0gKIFOI3J71JhsEc+rDtbthTCwmhHi+VjowGjpDY/7wovGxQTW45eOb3UhhcHpxfPWztyJEzwZtyjlkYkIyMEJCE23M07gkhyhqH/E783QQLfuPTzPXym9ZSoKXEc9Cq4DPvxmRkNy4vn1TnUQxNbHjobvuNWIjft96PvZCVEgDIK6xLBB5k9fVsCIdjhRDi9cBBGauc5yDK9bF86QMxF14KLr4d5Dqjc0aLdolg25jCBY0Sv1aJwzwYudWnhes6jwz8dktk7Rz0ZmLOwcNnsnAm+MBpsGCDjGgGuQHc22B8jDJhcOaWs4cureJnvQe5yPRjAav9ohRGEsq/yUr5StLo4bx6W5t+SoV3opsPoMcDIrGNZ7sAK1VwigR7sSHkWkz+v0mE/8Rj8OS8yeXEmpYUhmD3/J1Z4bOnHlVknIsTobNYhLvtz7o5PsOCafYma06/h0no3gWxhiWuLzYaYmVxdfziH7oqQy069vNX3c3/adAFyuFZGcChs5YnTLWnfscz2usA4iwka7F+s5dX2jp5+toS65HMOm6elLvOPgSy6iNXJeLpWmBmcYfT+c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bm9pRVhIZExmbkV5ZENjK2ZGZlVqVkQ3Z3g3ekRVOCtJL1lmekRHYnZTYnl2?=
 =?utf-8?B?b2YxQ01YaUM0N1JUNmN4VzlWMHE5YkVGYnNBWWt6eEJjTU1yMmdSdmhOazFC?=
 =?utf-8?B?WnFhOFFNYVo0anNlVldGRnkwS1U4UHRsbndMcWR6TC9JVjJHMTBtTWtvWlgv?=
 =?utf-8?B?QkpFbUlzYWszWWEzcWpqcFZCNHZ6OVg0ZkkrS2l6cW1mMGNOL013TEphR1BK?=
 =?utf-8?B?L1RUeEhLdU5ucUljVytCcDg0YUdmU0tSbjRlUkd6N3VEYUlLd1hqMkh2T3J0?=
 =?utf-8?B?TlpLUlNETk1IUkFQMUZVZExIaVNPVWR3ZTRwc3IyZVRvUEoxZnJvME9nQnhT?=
 =?utf-8?B?OUdsZFk4V0g2Sjd6S3pxRys4eGJ6TUdObXVpc0lqZkx2TnlacVZ6dmF6a1do?=
 =?utf-8?B?c3AveWFpM1pOSlZUTWppbmQwd3crUFlWdjAzUkMyZjZOWFdXVGp3YnUyclBU?=
 =?utf-8?B?T0kxUVZmNFpwSWZhMmtHaUd6S3pGWGo2YkpRd3pFbXFMZmxxTlhiWGVtT0d0?=
 =?utf-8?B?bFA4blBSMWhUYkNaMFZ0NjQzT3JxYk9GdjBXazZGazFFL0k1YTlyNDAwQklo?=
 =?utf-8?B?VWFRdFgwTzBaTzY4cU1NTWJFVy9WZVNqRFRIaFRQY0FzOXZFYmNRZjJZQklB?=
 =?utf-8?B?dnpNMmZzYisvNUNhUXo0OGJERnc2OSt4NzZxVkNHdkFhRVh6SEZBM29LUXlh?=
 =?utf-8?B?TmR0Y1NTUFJpd3hSZXkwaE5Va2tMaWJadmVsMWlpdWNoZ3hMNWdHT1BRamRN?=
 =?utf-8?B?WFJOWW9zZ1FDb2pZY0gzVXY5SDNocWZmVkY1L2lsUGZSU0diTnJlTFBPdWIx?=
 =?utf-8?B?dDRYNFdtRGdQQWNnYStIS0p2S1NYZFlURkNBTlN0Z2t2dGNKaDhENXJKY0V4?=
 =?utf-8?B?Z0xtV2ZSN3JkTWxHNnVtVEtNT05mVkt0THFkcmZBTDdWWE9RWmpncFFaanFZ?=
 =?utf-8?B?bVZHOUx4NVZ3Z09zaXFjMElYcnQxVWx2SmtGamVUTWJBSUJvTlVVdmw0akZM?=
 =?utf-8?B?b1dnSnNrM3dCWkRITGVHUkcyUUFjbGpSa0NZY1ZzOW5CVFBhTDBybXd4OGp0?=
 =?utf-8?B?T2xwYnJ3NE9QOTc5YmhlekNSUTdVN1lWWUFkZUlBQzhkdHplNjJ3OHM0RTZR?=
 =?utf-8?B?Q2FwR2IyOU5JL1RoOE1KZ2graWk0RHAwWU1lQjllSzVabDVLcmlrWEtyamQ5?=
 =?utf-8?B?RVdZYzlnR29KS1I0MXlERmgxVjJEY3FPV3YwemUwTHBwMU13WjViTGRUT1pF?=
 =?utf-8?B?K1N3SmZvenVYSUkxUDlScnFRemxMbHMxTlliK1JGMnhLc0pKaklCRkUvT1BW?=
 =?utf-8?B?UGYyUi9kQlc4K21HYURLQkV5SFJmSHVodlBPbElzUm5IS2RXOUE2Q1RNWnBv?=
 =?utf-8?B?bUxoYmJJclpJcStzWHB2NDVNM0xaQ2R2djRNOFRpUVQ4VjI0TXVQeVRUUmx1?=
 =?utf-8?B?MUhSMHlPWXIxR1NvQWd1OE5lL21acU00N2MrbXV5WmdhclV0Sk1nRzNIdUhj?=
 =?utf-8?B?RWRCMjFxV0ZlMkd1ek1mU2ZycjRGSXhCaEZ3ZjBKa04rUkpFZ0lBenVRaGVT?=
 =?utf-8?B?UHhuSkQ5UnJzZnUvdUZJTnNzaWFwdmZSalg2VDhIUms0QmxvUDdudjV5bVZH?=
 =?utf-8?B?ZkhJdWcrZEp0bTVUbGx2QnExbithMVNDcWJsY2VNTWIxNUUvRk1RTXdLZlUx?=
 =?utf-8?B?YzlCb1VYVjkxcXpQZEo1b2pkUVNMZ0FsNmtNVEtLeDlFbFJ5T1d6ZGFVWlFj?=
 =?utf-8?B?U1dtSUdUTFlpLzd3WmMvQXJaaHN5MGI4TzY1YUZXSFB2SmN5MW13SlVTb2Rn?=
 =?utf-8?B?UGJ0azZ1b1BzZXpHY09qbWx3QUxwVjJ4Q1g5dnhkenpqMlNKb25IZXV1WDZu?=
 =?utf-8?B?RGMzbmRVb2FJSTBPM3M4dkU5WmpBYjJ6NGMxekZ0Z0JRM1l3LzhicENuYUt3?=
 =?utf-8?B?ZEMrY0N3cnZHMjcweENqR2Q1WTc1eE9Md2lReEVRUk10RHJIKzUyTjFXbk5x?=
 =?utf-8?B?WWE3elV1TkRGZFVRaTRWUXFINHAzTFBzYWRZU043cy82WCtkcTZ0bVQxSWxT?=
 =?utf-8?B?Z0ZQVFE1UnhiaUtHSktyN3F6aDRRU0Y2YVlNUEYzZzhrbjY0ckp3bERtT0Fw?=
 =?utf-8?B?QldYc3hQSkUzT1lNSm1ZaHIxS0NEd3h5SXppcFJzNXlXK1JRaXNhWmVSQ2Yy?=
 =?utf-8?B?RUhRbnhJOVlobzZNYlozT2F5bXVmajBXdHh1cTRVeTRiSmN1ekRzZjYxUVhK?=
 =?utf-8?B?TUVEVWREMTdCR2hBbGVpSllLZU1YYW1wZmRRMVcyT2xnRFVNb3EyMlMrRTlK?=
 =?utf-8?B?VjNMRXhJdTJKWGUzcDlkVitMbUswOFN3eHRnY09mRHFveEFyQlNQQT09?=
X-Exchange-RoutingPolicyChecked: IRMAA1hFJHsHbolgSrjOhzhxsrnlBKBJOAn2IjKUrpmUHrW/jVDaclkuzd/9Ts2zp50xkp2gTC00cuTUKWPrX9Do5pCGpwRJhbDDeV8cP0xzKi6VhqofjYBKhXXVOc5aOXh2QWR64v2yD5Fj1PEVNtpDsHR7wpfhXyaimU1+9zRvBdQzgyTjwNF6sRl1tBa+/WlJRSoCtLh1c/AZvE9kxf6xJSvPDQNl3BJAJ8V93XLViXopHrHDjRBamHfTMaznTK0lRieGRxy1w7o6MEab/3PZeqf3fWX3144WTENYzFXaszLIWaOsefJxzOXlRCaun+YgFbLIePFcLvaAy8hSQA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 21a8dd8c-7812-42d2-32e5-08de8f40d814
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 16:16:20.1658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fdKd0Ci/esax+B11cix/g/Zq9/pXdggBiKE8CfPo9RAQr0YhYmiXqOLJlsIIeUPHvThWxDdPLxEBBk+v97nF5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9253
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


On 3/6/2026 9:20 AM, Purkait, Soham wrote:
> Hi Riana,
>
> On 02-03-2026 15:52, Riana Tauro wrote:
>> Uncorrectable Core-Compute errors are classified into Global and Local
>> errors.
>>
>> Global error is an error that affects the entire device requiring a
>> reset. This type of error is not isolated. When an AER is reported and
>> error_detected is invoked return PCI_ERS_RESULT_NEED_RESET.
>>
>> A Local error is confined to a specific component or context like a
>> engine. These errors can be contained and recovered by resetting
>> only the affected part without distrupting the rest of the device.
>>
>> Upon detection of an Uncorrectable Local Core-Compute error, an AER is
>> generated and GuC is notified of the error. The KMD then sets
>> the context as non-runnable and initiates an engine reset.
>> (TODO: GuC <->KMD communication for the error).
>> Since the error is contained and recovered, PCI error handling
>> callback returns PCI_ERS_RESULT_RECOVERED.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2: add newline and fix log
>>      add bounds check (Mallesh)
>>      add ras specific enum (Raag)
>>      helper for sysctrl prepare command
>>      process all errors before deciding recovery action
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c       | 139 ++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ras.h       |   3 +
>>   drivers/gpu/drm/xe/xe_ras_types.h |  16 ++++
>>   3 files changed, 158 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index 3bef589082d7..61c01a4bfadb 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -4,7 +4,14 @@
>>    */
>>     #include "xe_device_types.h"
>> +#include "xe_printk.h"
>>   #include "xe_ras.h"
>> +#include "xe_ras_types.h"
>> +#include "xe_sysctrl_mailbox.h"
>> +#include "xe_sysctrl_mailbox_types.h"
>> +
>> +#define COMPUTE_ERROR_SEVERITY_MASK        GENMASK(26, 25)
>> +#define GLOBAL_UNCORR_ERROR            2
>>     /* Severity classification of detected errors */
>>   enum xe_ras_severity {
>> @@ -62,6 +69,138 @@ static inline const char *comp_to_str(struct 
>> xe_device *xe, u32 comp)
>>       return xe_ras_components[comp];
>>   }
>>   +static void log_ras_error(struct xe_device *xe, struct 
>> xe_ras_error_class *error_class)
>> +{
>> +    struct xe_ras_error_common common_info = error_class->common;
>> +    struct xe_ras_error_product product_info = error_class->product;
>> +    u8 tile = product_info.unit.tile;
>> +    u32 instance = product_info.unit.instance;
>> +    u32 cause = product_info.error_cause.cause;
>> +
>> +    xe_err(xe, "[RAS]: Tile%u, Instance %u, %s %s Error detected 
>> Cause: 0x%x\n",
>> +           tile, instance, severity_to_str(xe, common_info.severity),
>> +           comp_to_str(xe, common_info.component), cause);
>> +}
>> +
>> +static enum xe_ras_recovery_action handle_compute_errors(struct 
>> xe_device *xe,
>> +                             struct xe_ras_error_array *arr)
>> +{
>> +    struct xe_ras_compute_error *error_info = (struct 
>> xe_ras_compute_error *)arr->error_details;
>> +    u8 uncorr_type;
>> +
>> +    uncorr_type = FIELD_GET(COMPUTE_ERROR_SEVERITY_MASK, 
>> error_info->error_log_header);
>> +    log_ras_error(xe, &arr->error_class);
>> +
>> +    xe_err(xe, "[RAS]: Core Compute Error: timestamp %llu 
>> Uncorrected error type %u\n",
>> +           arr->timestamp, uncorr_type);
>> +
>> +    /* Request a RESET if error is global */
>> +    if (uncorr_type == GLOBAL_UNCORR_ERROR)
>> +        return XE_RAS_RECOVERY_ACTION_RESET;
>> +
>> +    /* Local errors are recovered using a engine reset */
>> +    return XE_RAS_RECOVERY_ACTION_RECOVERED;
>> +}
>> +
>> +static void xe_ras_prepare_sysctrl_command(struct 
>> xe_sysctrl_mailbox_command *command,
>
> You can drop prefix for static functions.

Sure will fix this

Thanks
Riana

>
> Thanks,
> Soham
>
>> +                       u32 cmd_mask, void *request, size_t request_len,
>> +                       void *response, size_t response_len)
>> +{
>> +    struct xe_sysctrl_mailbox_app_msg_hdr hdr = {0};
>> +    u32 req_hdr;
>> +
>> +    req_hdr = FIELD_PREP(APP_HDR_GROUP_ID_MASK, 
>> XE_SYSCTRL_GROUP_GFSP) |
>> +          FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_mask);
>> +
>> +    hdr.data = req_hdr;
>> +    command->header = hdr;
>> +    command->data_in = request;
>> +    command->data_in_len = request_len;
>> +    command->data_out = response;
>> +    command->data_out_len = response_len;
>> +}
>> +
>> +/**
>> + * xe_ras_process_errors - Process and contain hardware errors
>> + * @xe: xe device instance
>> + *
>> + * Get error details from system controller and return recovery
>> + * method. Called only from PCI error handling.
>> + *
>> + * Returns: recovery action to be taken
>> + */
>> +enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>> +{
>> +    struct xe_sysctrl_mailbox_command command = {0};
>> +    struct xe_ras_get_error_response response;
>> +    enum xe_ras_recovery_action final_action;
>> +    size_t rlen;
>> +    int ret;
>> +
>> +    /* Default action */
>> +    final_action = XE_RAS_RECOVERY_ACTION_RECOVERED;
>> +
>> +    if (!xe->info.has_sysctrl)
>> +        return XE_RAS_RECOVERY_ACTION_RESET;
>> +
>> +    xe_ras_prepare_sysctrl_command(&command, 
>> XE_SYSCTRL_CMD_GET_SOC_ERROR, NULL, 0,
>> +                       &response, sizeof(response));
>> +
>> +    do {
>> +        memset(&response, 0, sizeof(response));
>> +        rlen = 0;
>> +
>> +        ret = xe_sysctrl_send_command(xe, &command, &rlen);
>> +        if (ret || !rlen) {
>> +            xe_err(xe, "[RAS]: Sysctrl error ret %d\n", ret);
>> +            goto err;
>> +        }
>> +
>> +        if (rlen != sizeof(response)) {
>> +            xe_err(xe, "[RAS]: Sysctrl response does not match 
>> len!!\n");
>> +            goto err;
>> +        }
>> +
>> +        if (response.num_errors > XE_RAS_NUM_ERROR_ARR) {
>> +            xe_err(xe, "[RAS]: Number of errors out of bound (%d)\n",
>> +                   XE_RAS_NUM_ERROR_ARR);
>> +            goto err;
>> +        }
>> +
>> +        for (int i = 0; i < response.num_errors; i++) {
>> +            struct xe_ras_error_array arr = response.error_arr[i];
>> +            enum xe_ras_recovery_action action;
>> +            struct xe_ras_error_class error_class;
>> +            u8 component;
>> +
>> +            error_class = arr.error_class;
>> +            component = error_class.common.component;
>> +
>> +            switch (component) {
>> +            case XE_RAS_COMPONENT_CORE_COMPUTE:
>> +                action = handle_compute_errors(xe, &arr);
>> +                break;
>> +            default:
>> +                xe_err(xe, "[RAS]: Unknown error component %u\n", 
>> component);
>> +                break;
>> +            }
>> +
>> +            /*
>> +             * Retain the highest severity action. Process and log 
>> all errors
>> +             * and then take appropriate recovery action
>> +             */
>> +            if (action > final_action)
>> +                final_action = action;
>> +        }
>> +
>> +    } while (response.additional_errors);
>> +
>> +    return final_action;
>> +
>> +err:
>> +    return XE_RAS_RECOVERY_ACTION_RESET;
>> +}
>> +
>>   #ifdef CONFIG_PCIEAER
>>   static void aer_unmask_and_downgrade_internal_error(struct 
>> xe_device *xe)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
>> index 14cb973603e7..e191ab80080c 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.h
>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>> @@ -6,8 +6,11 @@
>>   #ifndef _XE_RAS_H_
>>   #define _XE_RAS_H_
>>   +#include "xe_ras_types.h"
>> +
>>   struct xe_device;
>>     void xe_ras_init(struct xe_device *xe);
>> +enum xe_ras_recovery_action  xe_ras_process_errors(struct xe_device 
>> *xe);
>>     #endif
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h 
>> b/drivers/gpu/drm/xe/xe_ras_types.h
>> index 676755732ef6..221d07efd84c 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -11,6 +11,22 @@
>>   #define XE_RAS_NUM_ERROR_ARR        3
>>   #define XE_RAS_MAX_ERROR_DETAILS    16
>>   +/**
>> + * enum xe_ras_recovery_action - RAS recovery actions
>> + *
>> + * @XE_RAS_RECOVERY_ACTION_RECOVERED: Error recovered
>> + * @XE_RAS_RECOVERY_ACTION_RESET: Requires reset
>> + * @XE_RAS_RECOVERY_ACTION_DISCONNECT: Requires disconnect
>> + *
>> + * This enum defines the possible recovery actions that can be taken 
>> in response
>> + * to RAS errors.
>> + */
>> +enum xe_ras_recovery_action {
>> +    XE_RAS_RECOVERY_ACTION_RECOVERED = 0,
>> +    XE_RAS_RECOVERY_ACTION_RESET,
>> +    XE_RAS_RECOVERY_ACTION_DISCONNECT
>> +};
>> +
>>   /**
>>    * struct xe_ras_error_common - Common RAS error class
>>    *
