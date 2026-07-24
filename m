Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BE1C531C9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 14:34:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC3D10E055;
	Fri, 24 Jul 2026 14:34:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iri87P4f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C45E10E055
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 14:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784903681; x=1816439681;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8uwkusQEpSVPZhRASX6LK4UTXJbjwup+m/LJighoXgw=;
 b=Iri87P4fKB3U+PUXNVfaf2jnEYsjQ91d7IFI0EpbMlmO/S9wFoo7sFZ0
 ck5I1ScD2OhjSEqTrhs/hjo7Qj2gOb2AcJtTRPrcvP2AM8azqIMLHoIE3
 BQchSrkQtJao9ifrvNGi/30ubIUZBsWW8mALtmil7WnW/mLIzUyHZ623u
 A+/vpbEdg9AF4valkTJF3tQrFpyc9fh424fmIoZqEOiz6A1hiCMYzLftu
 NO+ukhlJSku+abiE7iimNUppbuPna83bArl2FUTl2hW/her7odUq6FKha
 GLq0sN3SgokRWi0QmzpjL+/oEamQWBAKjsVCozr4tv6+Akp68cQ4ZR+QO Q==;
X-CSE-ConnectionGUID: gqy8DC8LTJWxjrmwM+u1jQ==
X-CSE-MsgGUID: PkbKTgIhTQySwVNpYH65Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85515172"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="85515172"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 07:34:41 -0700
X-CSE-ConnectionGUID: G4ecahZZTfS6AQ+U1+5kpQ==
X-CSE-MsgGUID: p27gapqCSKqP9vPDigE8MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="262507411"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 07:34:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 07:34:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 24 Jul 2026 07:34:40 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.10)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 07:34:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BCDcd93GSJjmzMTR5b8CpnBiWinwFRo4iWxjq6Y+XQ7cdzYGx5PC1YEywVzJjufQE8gzl2ksnfPiyk5uPChhN3I7FUJsNGXQbLCTQPx7VmDKEMVaA9cPDThItP6obOacHSq2MzG7zj03cTkpTOeQHDCtqHHLIHtiwLqfMzbK4ewnMWh2CGwHdBP4sXYnRpthFXXY9kL/9fNsWpfo4UO/g0cASehtxGKE1uRtBWR0XxmS/1I22NvVEZVQF66y553jG8FmOiV+jQGDNAFAisHlVhaxWTj097QlHK2C49ObUMlsqRkw8MsiHsb+rhsLNgYvADSHFYmpdq3rAP6R0SsRSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JS4+qWMMqaxOHVYwXDyyfihrPbm+vdxDqIN2AhsEK5U=;
 b=GCtEffaVkI49yWz9v0dYYUy3A/6mDWdGj8xA1M9vXdFRozzGniODx/3P5bTQNnzWQm9ubh06yocHtVPNOQVROR9vJ/HQOCZ/BfjIV//oq5yXW19RGjVkUd5UY8wK3ZLA7jbU+v9IKQETfF9tXF++bAWFI3k1cvNci4tcdofRwT5krxjrIXD/4GImbVvLIVbZH286fXadHTtFwg8yb8MHINbgqx+mAClxjeblicuID4nJuENi8pXtcvZAKyUdVbLtm5xBdyglFtP2/rukFGafOg8vnTPMae4WFHRd/Fqp/3CEY8Xi9Mfx8XYlLsnEO/5QTYWPqty77zKTWOsNDMwIHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CH0PR11MB8192.namprd11.prod.outlook.com (2603:10b6:610:191::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Fri, 24 Jul
 2026 14:34:36 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0245.012; Fri, 24 Jul 2026
 14:34:34 +0000
Message-ID: <66d0111b-f0a3-428b-b235-37e87515912e@intel.com>
Date: Fri, 24 Jul 2026 16:34:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/19] drm/xe/log: Add structured SIGID error logging
 infrastructure
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Mallesh Koujalagi <mallesh.koujalagi@intel.com>, Yoni Levitt
 <yoni.levitt@intel.com>, Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Raag Jadav <raag.jadav@intel.com>, Riana Tauro <riana.tauro@intel.com>
References: <20260723203754.3782-1-michal.wajdeczko@intel.com>
 <20260723203754.3782-2-michal.wajdeczko@intel.com>
 <a7e82806-4bc0-4aca-b11b-7492fc07475e@linux.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <a7e82806-4bc0-4aca-b11b-7492fc07475e@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM9P193CA0015.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::20) To LV2PR11MB6024.namprd11.prod.outlook.com
 (2603:10b6:408:17a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CH0PR11MB8192:EE_
X-MS-Office365-Filtering-Correlation-Id: df2d160f-5a1e-4a0d-dd5f-08dee990ae58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|5023799004|4143699003|11063799006|56012099006|10067099003|6133799003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: xazjNE+IPD4ZObb4O4rg43EYGX2GkK9KAPxs7mWLVOPSSwdiEVIc+Okk404/HEJuzmje3o2s3FVd2AFEDq5URIiWiz3hzf65Lqq9jSWhdYPTyZbN0zD6demmXp4hnBxo16/4lZdu8Sysi71Ot3vR/c3iAVOoYK0uh0JxcudgqIOnZLYh0e4nY+tuIoswDLRuXr+Z4uYZZGaXzzCSMdB3egpkGofyhiNTaupDNYsZEd0YjTyKOXgYGElFgZOc3eH8KLmibs91wgKj142jB3paow7oqDP3XA7x+jDNaUeEljFNIEt6wbfj0WmnwyeFxJfUG82JLfgjXuBFEKXWGSvZGpUqIc15XftXv9NNEK2nikdXtMtOV2IqaIBHZF/QrcMO/nQ31XvAqpyQGXT5lrSXH+o6VW5CYVq4X9dhyysDvJUgP7NnpHey2gfn4xHM+MVrUNDLKAjsI9sDatQZnIu1CUJWt4kodngEy7O8XnVfPaylUoiQRyo1AWQdaWjvjyiVIDALjkOaOHO3R90//FWWWOgITfr5ROVU1kXAWa+ZmFjaHljxwOhiCLZve7WEuSvK9cvOQbgy5J/I8NcqQ6QEjb9m0UVjO8YyNZEe0Ni7/HknvBX5UxfoBLIH3JsfXDNSklHo7OV29pXtBk/egFHLmUT03wqQaMWyNSzAyX67L3U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(5023799004)(4143699003)(11063799006)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDNQZk02UTlsU1NDaDRKUlZ0Vi9GZE9VOG16ZXhBYXBqak5ybXNNVU9jc2F3?=
 =?utf-8?B?a05DUjliVmpoeDBIaDRoSk14UERmMmt5ZHJDVWdMK256MER2ZDBCK0JQU1dH?=
 =?utf-8?B?TU9adUczdG9ibEt1aTBncXBZVnBjMng4cHdsZUZETWNxMXVXNWtrUVc0ZVVZ?=
 =?utf-8?B?TVpBMllNdWdUVlBHMTc0UUFYcVlhTjQ1M3oxN0Q1ZkVtMHM3VTJDMTIwc2Vo?=
 =?utf-8?B?bURrdUM5aXVoc2puZmE2RWN0cjRGc2VneVVyajVnKytaN3Y5VkhJMStmalN2?=
 =?utf-8?B?N2RVendYb0kyWWViSVE1ODZQeG5RazBqcm9laTM5SnlPOG9XeGd2R3JOM0Yr?=
 =?utf-8?B?djExeFYrN1NaTXJxUHBPU043RnRxQTNSWGdCNGt5eWJuNG95eStIaGc3eVc4?=
 =?utf-8?B?V2dUd2pLbWdBYkxzTWhmQVZidXViQjYxa21JZytsR3d5eFNFNjdUbXQ2eXVH?=
 =?utf-8?B?amNjR1Nxb1VVMlJTMlBOaUhnREI2QStHaTVRMTFua1BZOUNBRjAwVWl3VE9j?=
 =?utf-8?B?c3pZNFducTI0YW92bHdsZ0t2WlFzY3lUdktJcFJ0YnRCMVJVRGlmcHhISDVR?=
 =?utf-8?B?OUtGYjJlZjRKbGIvUXBYcUcxYkRaSUk1Z3E4THF3SkY4NWVVU0tBVTNLZ3Ay?=
 =?utf-8?B?Z09Tc0V5bGpSWjhqSmtYYndoRnF2N2tuYkZmbGpmSHBKVlRmK3B2Tm0raklX?=
 =?utf-8?B?RG9MTUNYR2VvN2xORHd5RDJCckJvYkVtTmYzRHpMTTJJNU5ORlZESWFDRWp5?=
 =?utf-8?B?ckw2K3ZGTnJWeFJiZlJpUWFubGovN1pGN21QS0tweFhUbnlUYTk1WHFMUGFX?=
 =?utf-8?B?Mzlpek5yb0xZSHovZWpQcnBRRXQvcjVLSkpzZHd3OGxHWDZKUXJCaWIwUVp5?=
 =?utf-8?B?V25uZzB2SHpyV1U1UlR1d2YySGtkcnZFWlhsN0EwUjUvOFE2V3hORnR0Z2Zw?=
 =?utf-8?B?WTVka2V6bnVIcVVnd1V6ZklWaVRPRUgwWTNxendPbEFEMGFUaFFEQVpELzVz?=
 =?utf-8?B?emthbGhTUmgwMjkzK3BNN0QxVnhHRTJOOVhnTFFhU3hrcXVwQkwySWxPemF0?=
 =?utf-8?B?emV2N0RLVWpWeDNPdkExMmJPVVlzZHFRWWxZQ1lsN25XbUdMaElickhGello?=
 =?utf-8?B?QU14c0dScEMzTC9sTk1uODlld243Qm9QbE9wc3FGN3V4NzlEbTVBK0R3OFpY?=
 =?utf-8?B?bW5vZHdNOGJvYzFNdUNabEs4SWtTSWM3WERyUkpLZkRKbWYxWXRjbFB0elZz?=
 =?utf-8?B?ZDkrK2JKd3FyM3FJOFh3VXNpR0pObG13dFR5UHdsNi93dndJNmxNckJxR045?=
 =?utf-8?B?OTlGUHNLR2ZoSjFab1h4MXpWV052Wk9IcWRUcFNaMCtFUERtMkdhWTFzc2FR?=
 =?utf-8?B?VDR1elExSG1RNGxIT3U1L0IyVy9Dd1V0T2VYTUtocHFiWENGMi8rSkpOSTYy?=
 =?utf-8?B?MGI0ZndMRVZwajlHcGUvL292WXRNUzJTeEk2NU1WZlh6S01xZWtCTlQrVUFn?=
 =?utf-8?B?b3ppM2VhelNFMVNGZ1A5K2paRVp5cWNOWTZIREhkZzJtTkhuYmFzZHY4REtP?=
 =?utf-8?B?R2VzNkRUSHZqakVhRHRHR0JwOVFrNG54bURxMXVpMjBYZ3ZjVlNEeTAwYjdP?=
 =?utf-8?B?dXhOUzduUDNDem9rQU5oMUlzWkpXNzUwdjl5dVltUDJ4S1JlbllZWEJmQnNR?=
 =?utf-8?B?RTlES1ZMdGtzdDhJZ2U1T01zOERhVDVFRUZkeG1Da0lyWjE1ejN2NEpkUWQx?=
 =?utf-8?B?blBYZGVFdTArRlBKWlBqNEMvZW5NVnhyMzF6WU02QjUwZUs3dTdZSzhPbjYy?=
 =?utf-8?B?cCtJZkQ0WER4bGhvK3pkN1g5ZVd1b3RDRnhYVG10NFNSSnNBNUZMODFLTjAx?=
 =?utf-8?B?bGwxM3ZUMityZHZWQ1NtRjd1elhPdG5ac21rV0RtbmVQdm0zT3o2Nlljc2s4?=
 =?utf-8?B?UWxGMEhtZmtrQ05TOEtmRm0wUjd6eUJ3SjI2ZE0rdE5DU1k1WDdZVEY2c3Yy?=
 =?utf-8?B?TUQ1emhoMXRpWGkwSHdpMThid2RoaThSWG4zTUZkNnBqY0FUN1d3ZkZaeStO?=
 =?utf-8?B?ZitaRldyeDE4alBpaXpBb0I3N01EdnB4K1JhU2MwTVFxbUJLbzIrMStLWE01?=
 =?utf-8?B?ZDB5K3Jkeko5K2JrOG5LWWd5cjdianVRS21lVHNEeXcyOHMwankvSVZrM1h4?=
 =?utf-8?B?VkFSRGJvdVVTU0ZYaUtjbm1RbjJYeTh4UHZCeDlLREZVK212bUZyOEJ3bnlt?=
 =?utf-8?B?NFdzVkNNcm0vSlIvZXRyd1pQR0RzUGpxYWNuV0R3UndnWUd0SCtyOVl0K0Nn?=
 =?utf-8?B?aXdMUFRxWkJIQklNMjBrQ0w0bHNySzVoVFNjMFErUEV3WWo5UkFZVGQ3TW96?=
 =?utf-8?Q?fGhcEBYvR8F+cyno=3D?=
X-Exchange-RoutingPolicyChecked: rqpT4niC3GOZjfLtqXXEFMZSwMWs9OTNhyeDkcKBKX37xM9ztmGJIkc+SOlCmI9SjNs/ZO/T4i1JUe2KkwYZ8i9lLUruUylixz/z0YI30xf8vAILWfZ7OOiK8ay5FqAnIvJgQb72BLLJkZNJpkpparJFCITcXBMIF9r/3hEg8PieniLbpWqnyJ0ljFC1AhEHRwpDyVesi2tP+1IqmOYHe6vSAu8Lcpr4QMwqbzvBJ2Brnat3UFfAkCu149/HI+93dWe/nqznHSAOo9HsZHHubbfOT3WjMDnSHLRXwyBxKCBjUfzkLUHgs+GSRQtFuKKexxvG6n0UP72kIeJ2b7qb/g==
X-MS-Exchange-CrossTenant-Network-Message-Id: df2d160f-5a1e-4a0d-dd5f-08dee990ae58
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB6024.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 14:34:34.8267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K5Nybp4ia4whZam87INBta5G3eRfITgMN8oQE13+M7MByln7/dGoPtyfVR985U63fWYUhjLTyA3VOpIMlJwDBqdW99tW2TNbWX4GVRuJVrs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8192
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



On 7/24/2026 3:01 PM, Aravind Iddamsetty wrote:
> 
> On 24-07-2026 02:07, Michal Wajdeczko wrote:
>> From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>
>> Today the driver reports faults with ad-hoc drm_err()/xe_gt_err()
>> strings that have no stable shape. That is readable for a human, but it
>> gives fleet tooling nothing durable to match on: the wording changes
>> between releases, lines can be rate-limited or dropped under an error
>> storm, and there is no consistent way to ask "which recognised fault
>> just happened?".
>>
>> Introduce a signature identifier (SIGID): a small, stable integer that
>> names one recognised Xe fault situation and serves as the primary handle
>> for triage. A SIGID maps, through published end-user documentation, to a
>> description and a recommended action; the driver only has to emit the
>> right SIGID next to the usual human-readable text.
>>
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> Assisted-by: Copilot:Opus-4.8
>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Co-developed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>> Cc: Yoni Levitt <yoni.levitt@intel.com>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Cc: Raag Jadav <raag.jadav@intel.com>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> ---
>>  Documentation/gpu/xe/index.rst        |   1 +
>>  Documentation/gpu/xe/xe_sigid.rst     |  14 ++
>>  drivers/gpu/drm/xe/Makefile           |   1 +
>>  drivers/gpu/drm/xe/abi/xe_sigid_abi.h | 183 ++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_log.c           | 132 +++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_log.h           |  20 +++
>>  6 files changed, 351 insertions(+)
>>  create mode 100644 Documentation/gpu/xe/xe_sigid.rst
>>  create mode 100644 drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>>  create mode 100644 drivers/gpu/drm/xe/xe_log.c
>>  create mode 100644 drivers/gpu/drm/xe/xe_log.h
>>
>> diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
>> index 665c0e93601c..0247a255f7e6 100644
>> --- a/Documentation/gpu/xe/index.rst
>> +++ b/Documentation/gpu/xe/index.rst
>> @@ -35,3 +35,4 @@ The display, or :ref:`drm-kms`, support for drm/xe is provided by
>>     xe-drm-usage-stats.rst
>>     xe_configfs
>>     xe_gt_stats
>> +   xe_sigid
>> diff --git a/Documentation/gpu/xe/xe_sigid.rst b/Documentation/gpu/xe/xe_sigid.rst
>> new file mode 100644
>> index 000000000000..45d84a62f185
>> --- /dev/null
>> +++ b/Documentation/gpu/xe/xe_sigid.rst
>> @@ -0,0 +1,14 @@
>> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +
>> +========
>> +Xe SIGID
>> +========
>> +
>> +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>> +   :doc: Xe Error Signatures (SIGID)
>> +
>> +Signature Identifiers
>> +=====================
>> +
>> +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>> +   :internal:
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 67ada1d6c2fb..7ac3954737f9 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -87,6 +87,7 @@ xe-y += xe_bb.o \
>>  	xe_hw_fence.o \
>>  	xe_irq.o \
>>  	xe_late_bind_fw.o \
>> +	xe_log.o \
>>  	xe_lrc.o \
>>  	xe_mem_pool.o \
>>  	xe_migrate.o \
>> diff --git a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>> new file mode 100644
>> index 000000000000..99717fdf74a6
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>> @@ -0,0 +1,183 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _ABI_XE_SIGID_ABI_H_
>> +#define _ABI_XE_SIGID_ABI_H_
>> +
>> +/**
>> + * DOC: Xe Error Signatures (SIGID)
>> + *
>> + * What SIGID stands for
>> + * ---------------------
>> + *
>> + * SIGID is short for *Signature Identifier*. A SIGID is a small, stable integer
>> + * that names one *recognised Xe fault situation* -- nothing more. It is the
>> + * primary handle used for triage: a SIGID maps to a human description and a
>> + * recommended first action. A coarse first-order action is documented in-tree
>> + * per SIGID (see "First-order action" below) so the id is actionable on its
>> + * own; published end-user documentation refines it with finer, cross-product
>> + * detail. The driver's only job is to emit the right SIGID next to the usual
>> + * human-readable text.
>> + *
>> + * Why this exists
>> + * ---------------
>> + *
>> + * Today the driver reports faults with ad-hoc ``drm_err()`` / ``xe_gt_err()``
>> + * strings that have no stable shape. That is fine for a human reading dmesg,
>> + * but it gives fleet tooling nothing durable to match on: the wording changes
>> + * between releases, lines can be rate-limited or dropped under an error storm,
>> + * and there is no consistent way to ask "which recognised fault just happened?"
>> + * A SIGID answers exactly that one question, identically across driver and
>> + * firmware versions, and (eventually) across other Intel devices in a node.
>> + *
>> + * What a SIGID is (and is not)
>> + * ----------------------------
>> + *
>> + * A SIGID names *which situation* is being reported. It deliberately does not
>> + * encode the detailed reason or the outcome. Those are carried alongside it::
>> + *
>> + *   SIGID    -> which recognised situation is being reported
>> + *   severity -> how serious this instance is (see below -- not fixed per SIGID)
>> + *   errno    -> the failing operation's error, shown with %pe
>> + *   message  -> free-form human-readable context
>> + *
>> + * Severity is independent of the SIGID. The same situation can be reported at
>> + * different severities depending on the instance and the recovery taken, so a
>> + * SIGID is never tied to one severity; the reporting site chooses it by calling
>> + * the matching xe_log_*() helper (see xe_log.h).
>> + *
>> + * How to pick a SIGID (the uniqueness rule)
>> + * -----------------------------------------
>> + *
>> + * Pick per *report site*, not per incident. Each site emits the single most
>> + * specific recognised situation *for that site* -- so the question is never
>> + * "classify this whole failure", it is "what does this site detect?", which has
>> + * one answer. A single underlying failure therefore legitimately produces a
>> + * *chain* of reports from different layers, each with its own SIGID -- e.g. a
>> + * GuC communication failure is reported as %XE_SIGID_RUNTIME_FW by the firmware
>> + * path, the failed recovery as %XE_SIGID_GT_TDR by the reset path, and an
>> + * aborted bind as %XE_SIGID_PROBE by the probe path. That chain lets triage
>> + * follow a fault from origin to final effect; it is not a duplicate.
>> + *
>> + * If a site does not match any defined situation, keep using the ordinary
>> + * ``xe_err()`` / ``xe_gt_err()`` logging rather than forcing a SIGID: a wrong
>> + * or over-broad classification is harder to retire than a missing one. When a
>> + * new situation is genuinely worth triaging, add it to the list below.
>> + *
>> + * Scope: software-emitted signatures only
>> + * ---------------------------------------
>> + *
>> + * This header enumerates only the situations that the *driver itself* detects
>> + * and reports from software: probe abort, wedged, survivability, driver-
>> + * detected firmware failures, engine TDR, memory faults and IO/bus faults.
>> + * These are the only values the driver assigns.
>> + *
>> + * Signatures that *originate* in firmware or hardware are a different thing:
>> + * they are produced and identified by the firmware or the hardware itself
>> + * (e.g. via their own records or error counters), and the driver merely logs
>> + * them as they are given to us. They are deliberately *not* enumerated here --
>> + * minting a driver-side id for a firmware/hardware-reported error would only
>> + * duplicate an identifier the reporting layer already owns. The two
>> + * driver-detected firmware situations below (%XE_SIGID_RUNTIME_FW,
>> + * %XE_SIGID_DEVICE_FW) are software signatures: they mark that *the driver*
>> + * observed a firmware problem, not a signature reported by the firmware.
>> + *
>> + * Numbering
>> + * ---------
>> + *
>> + * SIGIDs are a single flat list numbered sequentially within the assigned range,
>> + * in the order the situations were introduced. Values are stable: once assigned
>> + * they are only ever appended, never renumbered or reused.
>> + *
>> + * A retired situation is deprecated in place, never re-purposed.
>> + *
>> + * First-order action (resolution buckets)
>> + * ---------------------------------------
>> + *
>> + * So that a SIGID is actionable on its own, each one is tagged with a coarse
>> + * *resolution bucket*: the first thing an operator should do on seeing it. The
>> + * bucket is a stable, driver-owned hint; external documentation may refine it,
>> + * but the in-tree value always stands on its own. Every new SIGID must pick a
>> + * bucket, which forces the question "what should someone do about this?" to be
>> + * answered up front. The buckets are::
>> + *
>> + *   COLLECT  -- capture logs and open a bug report
>> + *   RETRY    -- transient or already recovered; watch for recurrence
>> + *   UPDATE   -- a firmware update / flash is required
>> + *   RECOVER  -- an explicit recovery step is needed (rebind, bus reset)
>> + *   IGNORE   -- ignore if the SIGID severity is INFORMATIONAL
>> + *
>> + * The bucket is documentation only -- it is recorded per SIGID in the enum
>> + * kernel-doc below and is not printed on the (deliberately lean) dmesg line.

[here]

>> + *
>> + * When to use SIGID logging
>> + * -------------------------
>> + *
>> + * The xe_log_*() helpers are for these recognised fault situations only --
>> + * important, operator-relevant faults and events. They are not a replacement
>> + * for ``xe_info()`` / ``xe_dbg()`` / tracing, nor for one-off diagnostics;
>> + * using them for ordinary logging would dilute the fault stream. Not every
>> + * ``xe_err()`` needs to become a SIGID report -- only those that correspond to
>> + * a published situation.
>> + *
>> + * dmesg vs. the machine record
>> + * ----------------------------
>> + *
>> + * The dmesg line stays close to a normal xe error message so it remains
>> + * readable for admins; the only stable, machine-matchable token on it is
>> + * ``SIGID=<n>`` (``dmesg | grep SIGID=``). dmesg is not an ABI: the surrounding
>> + * text may change freely, and lines may be dropped. The durable record for
>> + * tooling is the CPER record carrying the same SIGID (generation is a planned
>> + * follow-up).
>> + */
>> +
>> +/*
>> + * Top level Intel Error Signature Identifiers.
>> + */
>> +#define INTEL_SIGID_INVALID			0
>> +#define INTEL_SIGID_GPU_START			100
>> +#define INTEL_SIGID_GPU_END			999
>> +
>> +#define INTEL_SIGID_GPU_XE_START		100
>> +#define INTEL_SIGID_GPU_XE_END			299
>> +
>> +#define INTEL_SIGID_GPU_XE_SOFTWARE_START	100
>> +#define INTEL_SIGID_GPU_XE_SOFTWARE_END		199
>> +#define INTEL_SIGID_GPU_XE_HARDWARE_START	200
>> +#define INTEL_SIGID_GPU_XE_HARDWARE_END		299
>> +
>> +/**
>> + * enum xe_sigid - Stable Xe Error Signature Identifiers (SIGID).
>> + * @XE_SIGID_SW: Software component failure. [COLLECT]
>> + * @XE_SIGID_PROBE: Device probe/bind was aborted. [COLLECT]
>> + * @XE_SIGID_WEDGED: Device was declared wedged and is no longer usable. [RECOVER]
>> + * @XE_SIGID_SURVIVABILITY: Device entered survivability mode. [UPDATE]
>> + * @XE_SIGID_RUNTIME_FW: Driver-detected runtime firmware failure, GuC/HuC/GSC. [RETRY]
>> + * @XE_SIGID_DEVICE_FW: Driver-detected device firmware failure, PCODE/sysctrl. [RETRY]
> 
> I do not think these first order resolutions can always be reliably
> interpreted Eg: DEVICE_FW might need RECOVERY and not a RETRY and also

I assume that in case of SW faults/signatures, actual (or better) resolution could be determined after using the { SIGID, errno } pair for the lookup
(as we explicitly don't want to use error message for any triage/resolution actions, as it is not considered as stable part of the report)

so maybe we should just say here that SW SIGIDs represent "areas" of the driver, and if no more specific resolution based on errno is available, the default one could be applied?

> driver cannot conclusively indicate the resolution for HW errors those
> will be determined by userspace tools/admin based on observed errors.

for now, this enum just list SW signatures

and maybe all of these doubts should be discussed [here] ?

> 
>> + * @XE_SIGID_GT_TDR: Engine hang / timeout detection and recovery (reset). [RETRY]
>> + * @XE_SIGID_MEM_FAULT: VM bind, page fault or GTT fault. [COLLECT]
>> + * @XE_SIGID_IO_BUS: Runtime PCIe / IOMMU / MMIO access fault. [RECOVER]
>> + *
>> + * The situations the driver detects and reports in software. Values are
>> + * numbered sequentially, are only ever appended, and are never renumbered or
>> + * reused. The tag in brackets is the default resolution bucket (see the `Xe
>> + * Error Signatures (SIGID)`_ section).
>> + *
>> + * Firmware- and hardware-originated signatures are not listed here; they are
>> + * logged as reported by those layers.
>> + */
>> +enum xe_sigid {
>> +	XE_SIGID_SW			= INTEL_SIGID_GPU_XE_SOFTWARE_START,
>> +	XE_SIGID_PROBE			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 1,
>> +	XE_SIGID_WEDGED			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 2,
>> +	XE_SIGID_SURVIVABILITY		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 3,
>> +	XE_SIGID_RUNTIME_FW		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 4,
>> +	XE_SIGID_DEVICE_FW		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 5,
>> +	XE_SIGID_GT_TDR			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 6,
>> +	XE_SIGID_MEM_FAULT		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 7,
>> +	XE_SIGID_IO_BUS			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 8,
>> +};
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
>> new file mode 100644
>> index 000000000000..7ea8d8cde0c1
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_log.c
>> @@ -0,0 +1,132 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#include "xe_log.h"
>> +#include "xe_printk.h"
>> +
>> +static void log_prep_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>> +			  u32 component, u32 location, const void *data, size_t len,
>> +			  struct va_format *vaf)
>> +{
>> +	/* TODO */
>> +}
>> +
>> +static bool is_hw_sigid(enum xe_sigid sigid)
>> +{
>> +	return (int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START;
>> +}
>> +
>> +static bool is_sev_error(int cper_sev)
>> +{
>> +	return cper_sev != CPER_SEV_INFORMATIONAL;
>> +}
>> +
>> +static const char *log_hwe_prefix(int cper_sev, enum xe_sigid sigid)
>> +{
>> +	return is_sev_error(cper_sev) && is_hw_sigid(sigid) ? HW_ERR : "";
>> +}
>> +
>> +static const char *log_sev_prefix(int cper_sev)
>> +{
>> +	switch (cper_sev) {
>> +	case CPER_SEV_FATAL:
>> +		return "FATAL ";
>> +	case CPER_SEV_RECOVERABLE:
>> +		return "";
>> +	case CPER_SEV_CORRECTED:
>> +		return "CORRECTED ";
>> +	default:
>> +		return "";
>> +	}
>> +}
>> +
>> +#define __LOG_DRM_PRINTK_FMT(fmt, args...)	"[drm] " fmt, ##args
>> +#define __LOG_DRM_PRINTK_ERR_FMT(fmt, args...)	__LOG_DRM_PRINTK_FMT("*ERROR* " fmt, args)
>> +
>> +static void log_emit_dmesg(struct pci_dev *pdev, int cper_sev, struct va_format *vaf)
>> +{
>> +	if (cper_sev == CPER_SEV_INFORMATIONAL || cper_sev == CPER_SEV_CORRECTED)
>> +		pci_info(pdev, __LOG_DRM_PRINTK_FMT("%pV", vaf));
>> +	else
>> +		pci_err(pdev, __LOG_DRM_PRINTK_ERR_FMT("%pV", vaf));
>> +}
>> +
>> +static void log_print_dmesg(struct pci_dev *pdev, int cper_sev, const char *fmt, ...)
>> +{
>> +	struct va_format vaf;
>> +	va_list args;
>> +
>> +	va_start(args, fmt);
>> +	vaf.fmt = fmt;
>> +	vaf.va = &args;
>> +
>> +	log_emit_dmesg(pdev, cper_sev, &vaf);
>> +
>> +	va_end(args);
>> +}
>> +
>> +static void log_prep_dmesg(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>> +			   const void *data, size_t len, struct va_format *vaf)
>> +{
>> +	const char *hwe_prefix = log_hwe_prefix(cper_sev, sigid);
>> +	const char *sev_prefix = log_sev_prefix(cper_sev);
>> +
>> +	if (IS_ERR(data))
>> +		log_print_dmesg(pdev, cper_sev, "SIGID=%u %s(%pe) %s%pV",
>> +				sigid, sev_prefix, data, hwe_prefix, vaf);
>> +	else if (data && len)
>> +		log_print_dmesg(pdev, cper_sev, "SIGID=%u %s(%*phN) %s%pV",
>> +				sigid, sev_prefix, (int)len, data, hwe_prefix, vaf);
>> +	else
>> +		log_print_dmesg(pdev, cper_sev, "SIGID=%u %s%s%pV",
>> +				sigid, sev_prefix, hwe_prefix, vaf);
>> +}
>> +
>> +/**
>> + * xe_log_emit() - Emit a structured SIGID log entry
>> + * @pdev: the &pci_dev device
>> + * @cper_sev: CPER severity (CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, ...)
>> + * @sigid: signature identifier, see &enum xe_sigid
>> + * @component: component identifer
>> + * @location: location details of the @component
>> + * @data: pointer to the additional details, or ERR_PTR, or NULL if not applicable
>> + * @len: length of the @data in bytes, or 0 if not applicable
>> + * @fmt: printf-style format string
>> + * @...: format arguments
>> + *
>> + * Emits a dmesg line that includes a single stable, machine-matchable token
>> + * ``SIGID=<n>`` followed by the optional severity token (like ``FATAL``) and,
>> + * when @data pointer is set, either the error printed with %pe or a packed hex
>> + * dump of the @data binary blob. The dmesg line will also include printf-style
>> + * text message.
>> + *
>> + * Note that the full dmesg line, with the free text message, is only a debugging
>> + * aid, not an interface! Only the ``SIGID=<n>`` token is stable there.
>> + * The durable machine record is the CPER carrying the same SIGID.
>> + *
>> + * Note: generation of the CPER record is a planned follow-up.
>> + *
>> + * Examples::
>> + *
>> + *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=104 FATAL (-EPROTO) Invalid GuC reply
>> + *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=106 (-ETIMEDOUT) Engine 'rcs0' hung
>> + *   <6> xe 0000:03:00.0: [drm] *ERROR* SIGID=103 In survivability mode
> Severity cannot be optional as its left for interpretation and also for
> consistency of the prints.
>> + */
>> +void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>> +		 u32 component, u32 location, const void *data, size_t len,
>> +		 const char *fmt, ...)
>> +{
>> +	struct va_format vaf;
>> +	va_list args;
>> +
>> +	va_start(args, fmt);
>> +	vaf.fmt = fmt;
>> +	vaf.va = &args;
>> +
>> +	log_prep_dmesg(pdev, cper_sev, sigid, data, len, &vaf);
>> +	log_prep_cper(pdev, cper_sev, sigid, component, location, data, len, &vaf);
>> +
>> +	va_end(args);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
>> new file mode 100644
>> index 000000000000..d475e816ee0b
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_log.h
>> @@ -0,0 +1,20 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_LOG_H_
>> +#define _XE_LOG_H_
>> +
>> +#include <linux/cper.h>
>> +
>> +#include "abi/xe_sigid_abi.h"
>> +
>> +struct pci_dev;
>> +
>> +__printf(8, 9)
>> +void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>> +		 u32 component, u32 location, const void *data, size_t len,
>> +		 const char *fmt, ...);
>> +
>> +#endif
> Thanks,
> Aravind.

