Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141E0CD98CE
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 21:43:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A172B10E2C1;
	Fri, 12 Jun 2026 21:43:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kMs6daNX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6D010E110
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 21:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781300621; x=1812836621;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UrjMJg/plPsRi6jsRd9P+iY3xv8xRyGcA69B1QWOKEE=;
 b=kMs6daNXKj5GvpVJHniPVYVSc7bG2a2Rj8e66GkvmvOW+8jnt4NkABpY
 T9yt5csWkkFsMN/18MZd6KVxCapuBDXlyVIPYUpW4GpE1VrGNxS+k93Cx
 lM1Qq/9zIOJh7hX8JEPl8ptUSGkFjtkjd59DkU+Im/18n/TvN5OqOkNVt
 /kjSu36+2m7rvdov5CqiIoVkcGomfFQfrecDGrybvPYiOTzBsK5lct0EX
 gAq6KKLjUjPUDvO0CqRIxb1pJDtGHvrVgqLwDnfsRvAuIN02lE5rjM1AK
 iHQxoqCSLJUROrS5sdwkF90MATX6UNnXQ4I3w+jv0whPJ8oGMGkEJ+56/ w==;
X-CSE-ConnectionGUID: qvGQMHIHTeeIZS0Ewh0E7w==
X-CSE-MsgGUID: 7+w64lOYT1OynmUXxZhQpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="99717517"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="99717517"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 14:43:41 -0700
X-CSE-ConnectionGUID: ML0G8z6uSxWPUd01EEd/hw==
X-CSE-MsgGUID: 3Zi+JOzpR8KDXemHZpKxvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="277120720"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 14:43:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 14:43:40 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 12 Jun 2026 14:43:40 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.44) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 14:43:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ucv5DUJT95gj1QouXyaS8WjBsqoosfPxeZFyk+PHGwin+MTOmU9tH5Pkr047nWMCg8gjXZGP/iP917FoYEBpl9KpkwAwL8KrrzZpUJta9Dh4t7lUjJsoma3Rf03pt3VF0QD14YEwH503rcfT4iRqkdAqaroLkD4NAifK1/F2IKiDBDwf6X36rb+N3E2U86CCjnxNdpZi6Kuy2LTuxIrCrs7hBQlcVUlWy8QC0CIxl37XTOQ5V+Xv7REsuMceutfhtxPCkRq9cE27VPl9ROr7Dj6NceQXVNZMDK2ofwR1MSLZXl21Le4C5liPWd+LTK/U01h6QZp7x4Y57zdZNfX6bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RV5clY8IGy7nRjlpgeU51G+uqZwUjC3EU0XAyEdHIEc=;
 b=ggVoJohQcIWHD2U9u0P5NWN1lT85MNzGmqDU2PuaCuh+mNaYFhuMc/leT4bWbbHg4XxUoo1kMCamLwX+sITw13gLielFnJRcJJFqH5KxnV3wMHwhhzKoPz0m9w77NVWoz+QYJil/iAtU14/hKUm06bnc5uRMDxGI1JnSEzJ9W1Tt68ifFgSA0TmYS9Bekm54q1kQFxGYM8GTR03oaCwgIaj+68/h7uB99RsmJArM2m2+eZpljm9iCv6930EqoZFT01F+IJIwW2V/CHi0Yx5U87LN02dipkukaPHGKxaWO0Fu57pK8A7I/dDNh7zdF8LbJpmgLNfHeXEKHqHwu/MSVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CY8PR11MB7290.namprd11.prod.outlook.com (2603:10b6:930:9a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Fri, 12 Jun
 2026 21:43:37 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 21:43:37 +0000
Date: Fri, 12 Jun 2026 14:43:35 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 5/9] drm/xe/rtp: Save OA nonpriv registers to register
 save/restore lists
Message-ID: <aix9hzIx+lYRMDya@soc-5CG1426VCC.clients.intel.com>
References: <20260608223624.3711760-1-ashutosh.dixit@intel.com>
 <20260608223624.3711760-6-ashutosh.dixit@intel.com>
 <aixelUZQmO1ShXbo@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <aixelUZQmO1ShXbo@soc-5CG1426VCC.clients.intel.com>
X-ClientProxiedBy: MW3PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:303:2b::8) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CY8PR11MB7290:EE_
X-MS-Office365-Filtering-Correlation-Id: 557a6839-7738-4802-a4bc-08dec8cba932
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|4143699003|11063799006|5023799004|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: R8m95Pn/bK24Ju7pbPjEjhvkryyRvxPV/XR/sjvXeXQUlsuRDn6tSV6EuTxGPIgW5l2yP7KbmRS3ptuGD6zJl7+JAWFWTY/1oZl44vTa4hm/NcSYSdTY4+s4ymxT2Ko2s5rBy2Wxch2c2WFN/WyHFyfNY5rm+KI35Fm4bipkXqR0kHTTM87smzw/RHB22MZwrCRg+EclxboMkI0vFye9x067/k8kxyM3sAkNcNGi8gd4IjdtiygTZKoDfaa6jXj4LwtEQQyjiI+ARfHdVqQbn0DJg6pB3ckTXTHpoq6IRvHUm+db8p+bty48wkpekJ2pY8taAPruZgsesER3pi9bpQsWF2/nhbzQ/c2pPipr8YmCfYpG3xyIeA3931KPwFKiC4EDIw/2jV/nnfEm5T0zHYmb1i8d3SaMYWfpLYRUa0deT5blf40bZKoJIUslzkva0Ft9UacAC2huY+J43zihaRuKgB7WQhp7R2Rws8kjl4CbeMWEz7JsWPqNtUY78KV2Jat7ZeKsLi0VX8P2EvHUgScvuZdUNVXK1H3VY3kMN4bLb7HZsefHxFxvWpITyKfiSrfE60sE5ch9DYGSMB+eWapL6ACGE6+bF+Gh9FBw4fSguPXDu6wQe5oWPX/eKSkVznajYRDiLDdplMdLzRFt3i7G55Qkt9UHy9WcjSsLrtcIiqrZlh5tRMSomPN/t28Q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(11063799006)(5023799004)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUYzcGVCWWJpQU5qdldrdyt0Yml6WWlXVkQwMHNHeHM4alpTOEFJODByTy8w?=
 =?utf-8?B?cDcxWGN6a3Y2V2ZiYzFZN29IaGhxUDBpMnExNjBzRGFXbUhHaEtDd2tnKzFC?=
 =?utf-8?B?U2l6N3J5ZnBwWjltekVHNGV2V2ZxdTFsSjVyNzBSTFhIczBzRyt3bTZlMis0?=
 =?utf-8?B?RHloUU5jSU1TMGlzVHlLeitpVEVOcklWZHpsOCs2K1BQRUVYa0dnekdvZ3ps?=
 =?utf-8?B?ak9SbFVhRDJaeFJzSEZROVNLMEVCSE42TDErNUNmUUIwV1l2RkxyUmxwaTdu?=
 =?utf-8?B?UmRMajdCU3dxSWRsbHZ0Z1ZEQ0RMTG1GbWpkVkpEb0w1M01iTXZpK2s5Zm0z?=
 =?utf-8?B?UUpQZjZmM1ZSK3dyRFE1MmN2UzY0QUdJU1VobmxyazJXUmJNWlNqSEFlRjNn?=
 =?utf-8?B?SXZEQ2hnRWJ5WkFtNjAySFNTU1ZadGFBZFFXTDloUFRqWDIwelQraXAwSDBV?=
 =?utf-8?B?dzdkUzk1UHY1YmRDWUZQd2ZWNTcvUjZScyszRDFMdEdRVWJVWUdCdDZKQ25Z?=
 =?utf-8?B?a2lZelpTN0JTYzJEOXFHdVluVkduUFFScXJiUDB3MWxSNnFzaUxxUGdCTldI?=
 =?utf-8?B?NHFiL3BETkZ6dHZrbjhCZUh0dnpZQ0s0eG92TVRaOHdvNjgxM0RCU08zTnhK?=
 =?utf-8?B?c0RoWi9UNVlrdWtoZEUwVlF2TmM4a1lCTjlTMkM3bDd1SmtMWjJ6aHFidysy?=
 =?utf-8?B?SjVsYW5jSm5PZDF2R1hzbXlWV1VGNkx4ckttTGFmM0QrRGhUbkxpTjVJRWEy?=
 =?utf-8?B?dWhxZGgxamxRNGk1QlozeGs1YXZrN0haa0xDSllacFZtOER4S2tLOGY3N3Zm?=
 =?utf-8?B?a3hiaUtFaU9wdURmWnhTd2NKd2E5K2ZDUlE1aldaR0ZDMHZBTWliZVVnQWlY?=
 =?utf-8?B?K3Z4SWN1cGF5c1NyMzEyQ3JnZVltbXBPWXRES0RiVG1aL3U3cE1TVTNmT2VV?=
 =?utf-8?B?ZmhhRXhtOGFwaXQyRS9PNG05c3lXZ3FUZ1ZMaG0xRHdoK0NQK1duQkNVbURZ?=
 =?utf-8?B?VElRUWJ5VHhvckRxUEF3MDNUbWpscEtPdDF5eWQ3VFZDb2Z1WVNSQWhjZXRy?=
 =?utf-8?B?bTZ5RDRvRlZEV0FwamkvVHJPa056Vkt3SDlvYS8yUWkyUGxzK3ZWTEwxckM3?=
 =?utf-8?B?Z3VOa2dWZ2RwOXRyQTMxeHRodFpzMjZXUHRJWXNnVnpESFFuVlN3Yi96KzdN?=
 =?utf-8?B?YUpCNHlqMWNaSUlVU2VVMGVKVUp2Nm1MWXhKc3RTak01cjh2eEpERXBJdDhD?=
 =?utf-8?B?VGcvRStBQVJUbVFDVkZPMi9GK0FiLzRhRUdtN3lCSUt6WnI2SjJVNzV2MVdG?=
 =?utf-8?B?Rk9CeXZxN0FCYlVWMHJsS2srdmF2dU9CWnphWTI1aTNjVDVYek1IVlBWZVJw?=
 =?utf-8?B?RUoyOVZVZmZrTzF0VEJMYUhxcGdZYktvWSszMHRmREtPSVBYZ29BcHFyYW5S?=
 =?utf-8?B?dERLRXBoVFpmY25PT0s4anRWWmUvQ1lwcFZGczhXMWhVV3Q2TzV3VndwaWRZ?=
 =?utf-8?B?dUtsNW1vY0pmc05jM1hlSlFla3pxUEVYSUNjS3N2dnBuTDE2d2l5c0MzVkR6?=
 =?utf-8?B?MmgyeERNMllPeGZhRHJwQmsxa1JrZlVIbzNjbXR2Y3o1QUFRV3NNMG51MXZI?=
 =?utf-8?B?MWcwRUVaaUQ5aVljenVwTVprcGZoV3huV01XemxOMVkvcDdockhIOVJhd29M?=
 =?utf-8?B?dnAzZzU1alQ2NFkyYkNmdkc0REJLUXU1eCtYMFR5REtlazZrTnRWVjV1QnE0?=
 =?utf-8?B?S2pIcms0R3RQeVl5VzhGZG5QdlVEenVxNHlQWlVJRTBBbW1oQWZERjN4Zjlv?=
 =?utf-8?B?Z3djMkV4eVpXTmZPTGViVjVRUjBQRi9Ya3gvMkNsRVdRelFrRlRnVnhPM0Zj?=
 =?utf-8?B?TkM3bForRUw4bHV1bjIyZ2YyQXlnL21zR0l4elk5ZzF0b3lCaVhhdWFYZFdR?=
 =?utf-8?B?Sm9ORGEwQkoySDhob2R6NmMrWnFpK2svQmRpWDUySkt4ZVh2Y2ttM1hPdnZx?=
 =?utf-8?B?cWh1aExCZkd2QkdQVmVrWnVBUUx4bmxIdnFBbnU3SnhBcVFzcy9qbDlIZlBk?=
 =?utf-8?B?Q3VjZTRyRTg0V2M5UUtJdlhzZnFjRjJyWXg0S0RDMkN6RFlIOSs1Q09IMVJI?=
 =?utf-8?B?K01qdkNKUVY2dkg2T0w1YWhsZ0ZHdmpnSlViWjFuODhJNXorRHpFVHVMd2Iz?=
 =?utf-8?B?UmZEdXdpaFp2bGJtY29kZTBST0J4eXQ2ZlRINUk1MFNETEJQcmxHSHVBOFYz?=
 =?utf-8?B?dGliT1hWUWpRS3hpeWl2SlhOR2w4WXQ0eEpadHdUSzR4L0ZOaDVyNStDUG9E?=
 =?utf-8?B?VU1NRkx3d0hoLzd0TE1NaHAyYWZZMmhkZEp5S3BzQ0lKVzhUVGJwVzNOMGdD?=
 =?utf-8?Q?3k+HM+SaHxTqVCts=3D?=
X-Exchange-RoutingPolicyChecked: TiUan7EWzFFqUVU09HwMe5KIOVnc162iOooX5l6ZHiX2GK/3uDbW3s8hBZlWTawdklTjnekpvalnUnVlb4J/Yx9CcGc7jwHuzhZoPr5BJwzPf1SkXVMG0EEblymulveK+uf1TH95mH2gxiKmP1WXtbBrx5hy3I39Zf4AGvJsZkBP8ZXZiACuBzBfjjKReKY9/+VvZ2Am+05lVQht8NqgGzgFf7A4aanpVnf2XqdMz/MZWZwCDsIy1aNWaJxGRP1GGDTPlOiqzwWierBcYzwPNnKOMrWRN/KSLDGWQsDjHe5YARX6cBo2xg/yfeZzMeLsfHG6LgyH6+m5ty2vopFT+A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 557a6839-7738-4802-a4bc-08dec8cba932
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 21:43:37.6683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B1s40/2OshhqqqBTTzjaePLE0hbLGkH0+MFh6tPoCP/3CqskBfwiJ1U7URCV5B2KUShUfYjhkidrjnaNVFxJ5G3JIfNvBSdc2488701ApRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7290
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

On Fri, Jun 12, 2026 at 12:31:33PM -0700, Umesh Nerlige Ramappa wrote:
>On Mon, Jun 08, 2026 at 03:36:20PM -0700, Ashutosh Dixit wrote:
>>Now we can save OA whitelisting nonpriv registers to register save/restore
>>lists. OA nonpriv registers are saved to both hwe->oa_sr as well as
>>hwe->reg_sr.
>>
>>During probe, resume and gt-reset flows KMD will apply hwe->reg_sr,
>>ensuring OA registers are de-whitelisted after these events. For
>>engine-reset, hwe->reg_sr is registered with GuC and GuC will apply these
>>registers, ensuring OA registers are de-whitelisted after engine resets.
>>
>>hwe->oa_sr is used for whitelisting or de-whitelisting OA registers during
>>OA operation, by toggling the 'deny' bit on oa stream open/close.
>>
>>v2: Provide more details in commit message (Umesh)
>>
>>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>---
>>drivers/gpu/drm/xe/xe_reg_whitelist.c | 12 ++++++++++++
>>1 file changed, 12 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>>index 0c01e289dc4bc..3925331348bff 100644
>>--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>>+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>>@@ -216,6 +216,18 @@ void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe)
>>	first_oa_slot = whitelist_apply_to_hwe(hwe, &hwe->reg_whitelist, &hwe->reg_sr, 0);
>>
>>	xe_rtp_process_to_sr(&ctx, &oa_whitelist, &hwe->oa_whitelist, false);
>>+
>>+	/*
>>+	 * Save oa nonpriv registers to hwe->oa_sr, from which oa registers are whitelisted
>>+	 * or de-whitelisted, by toggling the 'deny' bit on oa stream open/close
>>+	 */
>>+	whitelist_apply_to_hwe(hwe, &hwe->oa_whitelist, &hwe->oa_sr, first_oa_slot);
>>+
>>+	/*
>>+	 * Also save oa nonpriv registers to hwe->reg_sr, to ensure oa registers are not
>>+	 * whitelisted by default after probe, gt reset, resume and engine reset
>>+	 */
>>+	whitelist_apply_to_hwe(hwe, &hwe->oa_whitelist, &hwe->reg_sr, first_oa_slot);
>
>Hmm, this messes up my assumption that hwe->nonpriv_slots can be 
>hidden inside hwe since you expect to apply the whitelists to the same 
>slot in oa_sr and reg_sr. I don't see a real value add in using 
>hwe->nonpriv_slot then. You can drop it. Sorry.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>
>Umesh
>
>
>>}
>>
>>/**
>>-- 
>>2.54.0
>>
