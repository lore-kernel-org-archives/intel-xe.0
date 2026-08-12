Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92959C5B56A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 07:00:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E9AF10E05D;
	Wed, 12 Aug 2026 07:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CD3ozE2e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4891410E3CB
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 07:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786518039; x=1818054039;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k+duvo76Q+I9u89buXC0DWpmV7WjQJUsOv5/GJlLqzQ=;
 b=CD3ozE2ewCTM6W59l6POH95cbwb+NJx5gDP9BD07gN1YHX9s2An2bh8z
 RjPGLj7xFMLtYPFx7bHSTZUEJa2Pw367dq/k13wOYwCKG7zP5KAfl31je
 EY5C6XlAzm6TP9NpyY6JDKOXPiTaTZV+e9XwkgquPyYOWCmieaWjULHkh
 6vajFDaWwCgxjBx82SA4WLwaMh6uxjqLTzUOHLbLA3TfaKPDHmLKZedAV
 CPwiPBYRvH95utcpUf/+cO1ZIPhKksCEQSgrK4UAfUdc/WocAwpWbzYG+
 lFs32cEi81zeP75+PpLFHdRwDGJ4LgzQix/YpTxOwpXvblSJQOh4WVM2y g==;
X-CSE-ConnectionGUID: /hWJk8f3Rkyexw4s3PYtbg==
X-CSE-MsgGUID: PjMYUe7BQyyEw5EQn60SKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="87074252"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="87074252"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 00:00:38 -0700
X-CSE-ConnectionGUID: ck0tbHjnQCuCAbnbxsUq+w==
X-CSE-MsgGUID: ftKw7VBsRIK+ukttPrGc/g==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 00:00:37 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 00:00:37 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 00:00:37 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.55) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 00:00:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VSXqQjRumKlqm9+kv7yi16kiGNHgxBwUhaEuKSPMCqniVllKUwIfeBhyx7FrGgY668rTJTeg8117LIB1TEj8UZeNAervIvZNE4FuTbPNOjEJQ+sXlZg1YhzfnR6ii+K0fQil+8lLvmxD6ZfSQM+mBj3pJMxeTxdUSu0VMHxaol2NlWYum/kdTF60pJyp+KmE6mn02SBK42pVq/VIpPo3U30V4ujRiH4V2jABJee/K7fzHrG8DR5lqJFHb7DDm1t623ZBBIViWZBV0Kf3XSp88BAWb9ao/JEgpETZTKUr6ASLslv1OQb5Ge+AAD7uCXdv5b9UcansZY3DzFuUe23bYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSEl3oYe+7x3n8BNWcLlYKI/udWTg80cVibM6t8PnHo=;
 b=hqYU6eN0q1KOo+B/qaGNbwlbTagk86/otUhRkHIpwTgUYf3Fq9xz9+gQVVkJzekit0BvM0qzOaX9B1REGPaNoNbreasxr75yGz/M/Z2j2AVm5AGzSFAtzXECpho9eMENqOrziEuyebFvqDj/1ROH3vJn6J63y1TMppxfnS6vG2XnMfb/scpzYaAAJClUW57CRBltRxyYQz/sQknSkTCvQCKJrazmjo0tyciKcsV2jMekUSwGNEnswwDPYdRCALPr09p6u5ZT9N3y3EovnVVfwkaJmR4lye4mvgGiVzcredpaX2dxWjfxqw49yUp0TWczb1yPBPRu05J405jBuUJL4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SN7PR11MB6923.namprd11.prod.outlook.com (2603:10b6:806:2aa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 07:00:34 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0315.011; Wed, 12 Aug 2026
 07:00:34 +0000
Message-ID: <1bce5332-0341-4ecc-839d-bd36df33dff7@intel.com>
Date: Wed, 12 Aug 2026 12:30:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/23] drm/xe/log: Add hardware error signatures
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, "Mallesh, Koujalagi"
 <mallesh.koujalagi@intel.com>, <intel-xe@lists.freedesktop.org>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
CC: Yoni Levitt <yoni.levitt@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-11-michal.wajdeczko@intel.com>
 <9e60e8e5-3942-4537-bb10-ac5a3bc72c69@intel.com>
 <d9b9afb1-7e39-4ad0-9e8a-ad6888238ab6@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <d9b9afb1-7e39-4ad0-9e8a-ad6888238ab6@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0237.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::17) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SN7PR11MB6923:EE_
X-MS-Office365-Filtering-Correlation-Id: cde921b6-4004-4bd3-309c-08def83f67bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|56012099006|11063799006|10067099003|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: DWKdKquU85KoTZcxGDUBGtJS6FP0WMky3fgnqbSv2oSMZ2CNT/ofHN2AEhCUAut2S4bbiXjnlP7myj7AGNkkr/w/jd1EdS6aX4o7Mb0VWZiyuSABz8r7tSJ3zWqp8pY4W6uMdowU+UbzIxQMZnUEJkKaITgImK8LG8jFzq9+nMGXnTeWkeyJtn1NLtTLnTQ5+t7VBCwgF/7/ZsFTeFco4jNX3DCzFbmmWgjf/ceK9rVr+hoMJbnXtseNFshwqHgZgg4Y21VlCv3436PRW02NXYkslY7PIfbOo18xnmGI6HPdblZk3qYRF1vZP61FEohf729Fobm88cYzMJPU+JGPcWHqYzxos1YPgShGkc+xB9oGnQ5ziy68FhNSJnCVqETtZvWW20HE+KwDbA2kwvxhtW2Hqa3i1lCZz4rkZ0b0ywZlGlBXU12Mk74sn/kh1CDa9rtD1SFL8zr9JwoEbuaspVjZGi/k2SbR9llnUn5VIKZNK3Yk3ej7WbdIAv9Fih4+Ykw7gu4uvtCqfu5bXoCcQ5Qi4xfHwV2ncNUajzftUXylA/TTNjGs/0xCDfSTqlDwxQAdWlMqwLmnEuumHzD4icwBvndeeX9HdWDwtiqFAnRGgAiByA9kl39zVfJdHv4B/sqMHfrEd1+C4oXoC51m8OvUwxIcOl9NeOxwlkOqe4Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVN0WmxXNGsvUmV1ZUhKR0U5UGNSaUVEYVBQUGpPSm52UHJ5N0NmblphK1By?=
 =?utf-8?B?bzZlcFhtTXpycHk1NzlFSThERzlPdEFvc3gwSWhoSXE4dDcrOTRzZ0RXZmlN?=
 =?utf-8?B?TlNPTGhVNjMvRmxWUU1CL3Vyd1F6UVFVM05DaDltNENFRXpEVVhMOXVOenM2?=
 =?utf-8?B?ZkFmenR5YklvZmdPUmVhYVBISTJwY3VqdDNWVWk5T0x4YjY4a1lGNGh6SFZO?=
 =?utf-8?B?UWRMN1hHdVdlVzJxVWpOYlZnUFRWcXYwYjMwQU5iTWU2Rmd1L3h1ZXhGRTk5?=
 =?utf-8?B?b3hjMFZEemdBM0dKcFNobEVhM3A3WGI3dmNMN1ZXOVVVYnRRL0VkOXRzckc4?=
 =?utf-8?B?QlNFUXZ0WC90SFNlWGQ2SFJodDhSZC9NOFNiak9OT0tsMExMSmhRdTJ3M3Y3?=
 =?utf-8?B?TyszNDgvR25SMnJvT3ZqMlFCb2tZbjdCdDZaaHoxY2JNdUZaZFlvM2lrR3FF?=
 =?utf-8?B?aThDRDN5c3loSm5UNllZVkYxRW5IL0dOK3pWUnMwM09kU3VyTHhtclFNVWk1?=
 =?utf-8?B?RWxSZUgrbVFDRFNad3pndWJqcU41NU1UZk5TNmdjT1l6UERqTEVxSWN4VCtV?=
 =?utf-8?B?M0x5TGN5dkNIbVBXMzkwTjF1UVpPb2NETU5HZVJRSHFvZzRMZDg5NTFtSHJT?=
 =?utf-8?B?RUk2elIyVlhmVmQ5cG1JKzhFTVpoSk4yRzNLSnFZd0liZFF5dkVjY1czVXN5?=
 =?utf-8?B?eFBtQVEwbFBPZm0yTTdqVGJtV2t0M05VQVJHK01ZeW15QTFsM1h6UDUxWk9p?=
 =?utf-8?B?cFZsZVdxT01DS3cwWjJ2QTRUR2QxNm1BWnBFc1FwREdKODE3eE91TU90Szc3?=
 =?utf-8?B?TGdzdFJyTTFwUWJsTlRMYzZYRGZTQVdCYko3TXFTVkVEQ2s0S0NjbUZLZTlw?=
 =?utf-8?B?dDQyZWNHcjVzOVJJcWp0RFYwQ1pjYy9VUGRKSHdaa0VsUm9OS0I2UEhIMXB4?=
 =?utf-8?B?Z3NBQVlLZzhpZW1YcFhMSlIydWFPZDBmRElXYnVPRVNsWHhqaG9OakI2Slo1?=
 =?utf-8?B?L3BPdk1HRlAzUHpXbGNkRGxRdDAxdG45M1QzRkkvL1pkM2o2K01iSkI5R1NJ?=
 =?utf-8?B?bnJGemxTMWR4bUM2LzdvV3hmVW1CTk5yUVlLWHJsRS9CeSs5cDN3UE9kSUxo?=
 =?utf-8?B?enhPMmxmenlCK3RyMGN1SjJjU3dRcW9GMkQrWWVtaDM0YmtucW1uanpTM3E2?=
 =?utf-8?B?dWNUdGNGN2dnR3NYaGlrai80aW5LdUY4ZEpIbTZFOFc0dDZrYkJMY3IvT0JS?=
 =?utf-8?B?c2ZmWkE0bVBGaE9zUHA5WEdZMGRsMmtZNWl2ekh5RlVwZkV4TjFENXdpSUh0?=
 =?utf-8?B?ejBDZVBKUDJWR0RJWnZyQStFNkVZL0VRbjJJc3dmZjAvNjFCV2FqNTVzc1A2?=
 =?utf-8?B?S1BWRnZMV2lzNWQ4YmdDNFFwcE1QbjNoVkVrVTQxVnlEMFBSWXVveXg1Y1B0?=
 =?utf-8?B?NmxpMHpXM0lpaXg1NllOaVF4OHRYTmQ2cm52NnFLWE5IL3o3Q1ZpKzFVVS9N?=
 =?utf-8?B?UGoyL1d6RW5OUCszL2thY3VLaDhmQ2Rvemo2SEhzZ0szb3NIc2NhRzNVL0Q1?=
 =?utf-8?B?ekZDc09FRmpxWjFCMTB4NlN3NUhrWDA1c1BLMGN5eFBGRVV0Zkx0dW12NFk1?=
 =?utf-8?B?Q1Uyai9oeG8xWFRweW8xdGlncHF1QnZTclQ5NklMYjBIWDI1cVQycDliaXhi?=
 =?utf-8?B?YlcwQUhGcThIc2RMdmJHeGt3OFhkVHBVQ0xVN3NPV1NhZG5JQnltclNqVlo0?=
 =?utf-8?B?Tms5bHFoTUJ1azdpS1B6dUhOMGRpZGZXOE5QcDh3QTBrd2FlMVFITllGQkN4?=
 =?utf-8?B?MUdTcjJkdUV2cm5mWGJ2NllHMnlsSzJ4a25TaHRRcEVIcjBmbjJ1M0MySTJn?=
 =?utf-8?B?VE5IM2pTWGwvcy8rWXozZTlKL3VrNE1VMzU4M0JnSmpOQmRoZHpiOGtXYzNK?=
 =?utf-8?B?Ym9yMGxFQ2gzKzUxeE45S2lzNytWZDd3YUJNbXdHdW1CZzJpRXFBYytRTW90?=
 =?utf-8?B?a2ZTd1crMDNBbHduYVRXTWFQU1ZIZUxVaDY1UmxzVnhJODdlYUhsOXU5MEVm?=
 =?utf-8?B?RWV1bTIvdmVHc242UDhjQU50bE9KZXdxSmZwcmM1VW5udWJkazBhWkhVZWda?=
 =?utf-8?B?bVJ0VEh2NXM3M0JSUDM2SytWWUgyNHJmT3VRSCs5Yk4xd1dFMktIbVhJdkFp?=
 =?utf-8?B?eFc0UHYvVzBBa2hPUmhrS0hBbVYrM1BWWWtGNTZoTTdROHo0K0tQNm9BVkli?=
 =?utf-8?B?R3E2eEpZMloxdFJwSFJWWDlRZG0yck85cTAySjc3bmlGcnV0WmluaS9qb1F3?=
 =?utf-8?B?ckJhK2FnY1lVQTYrTkExa1ZVVDVVUXRkbUdoOE1xcHFhUnNtb3o0dz09?=
X-Exchange-RoutingPolicyChecked: GTEwGr56bMyeavhrn4TCfEFFmCDlUtqpT5hThEb0TRicvFPfo5HV0+fziE3li9i95y9Hn36F34fy61Ggch5pDfRRrJiPrBBi7IRzeCoESC+ri/23D0lHKi/ZDIphg6rIcRC+l3CEnNiFk6kd3JCGMNJF5ssOWiQ/X+3UfMXu9v+fACAZn1qDaPcvnRF+ulx7dP2WxVjxMESfa4AlF70RsheGzgGsO6c5px2Mt0SzKflWLw7wQF57iQ0lzNctoednqYBfqlllLxqgo6RtKVJGAUrxRc50W/fGMc74LmqqChD2ibHxm52SdVm6jpYKlc7OhLK8J5UQhwpSmxFWSOjnQQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: cde921b6-4004-4bd3-309c-08def83f67bb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 07:00:34.1910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9NlAnNhip/z+XB/a4hm1Dv+vcXoORe5D9Cg92fGXyx9MMBLGZLuhWaACLY74huFcyzeFtz5SS71fFQtiqcVWdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6923
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


On 04-08-2026 21:26, Michal Wajdeczko wrote:
>
> On 7/31/2026 1:41 PM, Mallesh, Koujalagi wrote:
>> On 30-07-2026 08:51 pm, Michal Wajdeczko wrote:
>>> Extend our error signatures definitions xe_sigid to cover also
>>> hardware-originated errors and make them distinguishable from
>>> initially defined software-initiated errors.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Yoni Levitt <yoni.levitt@intel.com>
>>> ---
>>> v2: update comment (Sashiko)
>>> ---
>>>    drivers/gpu/drm/xe/abi/xe_sigid_abi.h | 16 ++++++++++++++--
>>>    1 file changed, 14 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>>> index 99717fdf74a6..69cce4b45635 100644
>>> --- a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>>> +++ b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>>> @@ -159,14 +159,19 @@
>>>     * @XE_SIGID_GT_TDR: Engine hang / timeout detection and recovery (reset). [RETRY]
>>>     * @XE_SIGID_MEM_FAULT: VM bind, page fault or GTT fault. [COLLECT]
>>>     * @XE_SIGID_IO_BUS: Runtime PCIe / IOMMU / MMIO access fault. [RECOVER]
>>> + * @XE_SIGID_HW: Generic hardware failure.
>>> + * @XE_SIGID_PCIE: PCIe interface errors.
>>> + * @XE_SIGID_DEVICE_MEMORY: Device memory errors
>> Add . @ end
>>> + * @XE_SIGID_CORE_COMPUTE: Compute/shader core errors.
>>> + * @XE_SIGID_FABRIC: Fabric errors.
>>> + * @XE_SIGID_SOC_INTERNAL: SoC-internal errors.
>>>     *
>>>     * The situations the driver detects and reports in software. Values are
>>>     * numbered sequentially, are only ever appended, and are never renumbered or
>>>     * reused. The tag in brackets is the default resolution bucket (see the `Xe
>>>     * Error Signatures (SIGID)`_ section).
>>>     *
>>> - * Firmware- and hardware-originated signatures are not listed here; they are
>>> - * logged as reported by those layers.
>>> + * Firmware- and hardware-originated signatures are numbered separately.
>>>     */
>>>    enum xe_sigid {
>>>        XE_SIGID_SW            = INTEL_SIGID_GPU_XE_SOFTWARE_START,
>>> @@ -178,6 +183,13 @@ enum xe_sigid {
>>>        XE_SIGID_GT_TDR            = INTEL_SIGID_GPU_XE_SOFTWARE_START + 6,
>>>        XE_SIGID_MEM_FAULT        = INTEL_SIGID_GPU_XE_SOFTWARE_START + 7,
>>>        XE_SIGID_IO_BUS            = INTEL_SIGID_GPU_XE_SOFTWARE_START + 8,
>>> +
>>> +    XE_SIGID_HW            = INTEL_SIGID_GPU_XE_HARDWARE_START,
>>> +    XE_SIGID_PCIE            = INTEL_SIGID_GPU_XE_HARDWARE_START + 1,
>>> +    XE_SIGID_DEVICE_MEMORY        = INTEL_SIGID_GPU_XE_HARDWARE_START + 2,
>>> +    XE_SIGID_CORE_COMPUTE        = INTEL_SIGID_GPU_XE_HARDWARE_START + 3,
>>> +    XE_SIGID_FABRIC            = INTEL_SIGID_GPU_XE_HARDWARE_START + 4,
>>> +    XE_SIGID_SOC_INTERNAL        = INTEL_SIGID_GPU_XE_HARDWARE_START + 5,

Nit: Maybe retain the same order as firmware

>> Since we've resolution bucket for SW sigid so do we need resolution bucket for HW sigid as well? If so how are we going to put HW sigid to resolution bucket?

We shouldn't be having resolution buckets here. This is just the high 
level class.
For ex: Soc internal has multiple recoveries. I think the decision in 
02/23 was drop resolution buckets.

Thanks
Riana

> there was discussion about this already [1]
>
> and I guess we can add [COLLECT] here as an overall recommendation for all HW SIGIDs,
> as likely all such errors will sooner or later be reported as separate SW incidents with its own resolutions
> and official documentation will have more detailed recommendations (out of our scope here)
>
> [1] https://patchwork.freedesktop.org/patch/742246/?series=171022&rev=1#comment_1368419
>
>> Thanks,
>>
>> -/Mallesh
>>
>>>    };
>>>      #endif
