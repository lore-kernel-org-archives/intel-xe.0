Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DD2C27C6E
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 18:23:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E01C10EB50;
	Thu, 13 Jun 2024 18:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R+3YEOMe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7465010EB50
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 18:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718303030; x=1749839030;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=E/rfktPUhC/WxUOe6lgM2vxaQ87/kJPM4tIa6cVQEFE=;
 b=R+3YEOMe3451GBUvv7CRPpcIpkndI2Q2g9nPTDMeKjuz7oM+rkiyRSQC
 k+WudAFMRVEi8TYXmAy7709+RPr1t5xZPKuU6DRW/1lf+r6Isi4KOd1XD
 tG2Pnd4Kp0xHGO0063pvl0zI3szDxWJRW8EMheicDRqEN65P4m777QzIA
 +jZyBXBFW3H9ouw7u1DJtCd+BzTH4mi1LksvMS2JNMnDRnIBMJzutZv5H
 6sPVgR7zIssaSlSvmkzo0VU2lvW1qZ48UKsvsawC9dzwvQw0KpkvvdS4j
 b2HyG6KxSY0gbR+A0YMaw3KR3EOujnKSESdV1HWJxk1JLggHEVGNvYQNn Q==;
X-CSE-ConnectionGUID: Pn6tGqy/T3iOW5N36rH5iA==
X-CSE-MsgGUID: 3QDzfejoSOW1XpuFDcQvCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="18080030"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="18080030"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 11:23:50 -0700
X-CSE-ConnectionGUID: 6niy5ej2QqaukpfEPnPt/A==
X-CSE-MsgGUID: buYpmD/2R6KznXH/HyizSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="40945141"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jun 2024 11:23:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 11:23:48 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 13 Jun 2024 11:23:48 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 11:23:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJDelfMHd1FOzB+9D5XvkEeFcj7hgRyDJ6EpJxsIeRMhEEwfjiwYTkrglIeBhjdPFE6P6402ahXCSNk6t2/RN4V7tOzhSP6ZsBS5gdUQPv/XMmxoL8Q1cf3sISrpegVv9bBogt7G4Vg7AvXxD4ffXoF46Q4bN4mFHEVn58603U+hpLi1NLYWT/VmThHXek39dT75px/Ae1FPgRAwN2c9Hn4VJbC+yaLpgDGg4C8vQV1AnLaFJOKY7ANwvVA8JMZ/XCZ0bfvqZAtVea6MLPZ9bJY023HmHXu7lasQ2BWx/4/iDPZ9hpu1v4Qn1GlAJILMdgRqfWknbbw09fRlpIlkeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fY9gnF3xN3s2jehjwd6uPrxjAzrMB16++GUSemDRZR4=;
 b=ZhjLssSsZbIT3r62EjJBX3Wz7RWI+0QoG4b6MffvBdWelhzhS1uvLk+Rew5bN1yWSybTF7xe/1Xk6QBGeAcbzoSOMh9J+0Vf2hnpGwBDB17v3UC/rYCjqT5FzaaPnqk24XHfF77Gp478YrGIOiya0db+9p7yEzSpLagKDhUzjGtiLKSlYcu5h94zm7J6SKdQDPcc7R+I8BhwM/W/K0ow9Fy7LJ9fjY9XtFTrntF/4Ke+dWvW5ClYx1ETPqjnhUshwBnV3T8/pgDozescOMX1jIYjsyC9aeHKNMiR2dljiSzZA6Xv7kc1QlspgUJv8lL8yTaulJYJJ/lphJVPC0ymow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DM4PR11MB6432.namprd11.prod.outlook.com (2603:10b6:8:ba::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.37; Thu, 13 Jun 2024 18:23:46 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7633.037; Thu, 13 Jun 2024
 18:23:46 +0000
Message-ID: <ac2a8e03-db3c-4811-91aa-765ad79408d8@intel.com>
Date: Thu, 13 Jun 2024 11:23:43 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Invert runnable_state / pending enable check and
 assert
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240613023452.2913247-1-matthew.brost@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240613023452.2913247-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR21CA0019.namprd21.prod.outlook.com
 (2603:10b6:a03:114::29) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DM4PR11MB6432:EE_
X-MS-Office365-Filtering-Correlation-Id: bcf2246d-9333-4481-de02-08dc8bd5f6a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|376009|1800799019|366011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N1VTcFJRMmRIKzIrU3pFUVg5LzY4ckNVTzNDcmVzVHdzTVNGT1plSStTbUFW?=
 =?utf-8?B?NEdabExFK2pxQXllendHSXJOTnRvZW9zVWtyS1phcmZJWENyNGNiaHRzZGRt?=
 =?utf-8?B?dU1OOGFLb0FpRXQyVkZLOSsveUZNdStMQit3Rmt2dDQ5aVYvQ1gzT2RtUlpp?=
 =?utf-8?B?RWlacmdZV2Y0aE9DY200V2ZKUjRkL01SeklEY240ZElZRVpzMGwxeWZqTE5P?=
 =?utf-8?B?blNVNUxJL0JkMXgzQjJvZU9vZURmczBuUzZYQmRzclBWeElQRnBMaUtIVXpK?=
 =?utf-8?B?TUU2QlM1bWFIU0xOM2Z4KzJKcGpza1Z3RXZxck5OYi9RTS9CQThma0pYQ0VC?=
 =?utf-8?B?Ui9wd09VWm0zbHdFUkM1VFBjZEVISGNqTkExeDNDcUlDQkd3YWdNMENIam9H?=
 =?utf-8?B?V3F3V21oODFHcnVWSnNGUUdkU0ZLd3l4cm1Ra0Q0UCtScE5vOGZWb2ttNVFX?=
 =?utf-8?B?czFPcnBMdTFwR1FlZzNIc3ArcG9KMnlDT1BmZW1ENmJJa3FCSk04R2IvNEZj?=
 =?utf-8?B?T2F4NlBYYVhTdGFSMFZzaEkwK2hBWXQrUURoeXhUa1pZb0FJOXAwU2xQd3I0?=
 =?utf-8?B?MWtGSCthL2tVSU9VamhvWHZsOVAwaExhSEJmNFpGekhyRy9kc1hxM2FxVXd3?=
 =?utf-8?B?TXd4MkRhem1SMnUwc1JvRm1iMm5YOGJGSi9XMGVGZ0hHR3JzT1RqdldVSURD?=
 =?utf-8?B?bnJYcmhiYUJtdTZDdjN5UzNoRVNtQ0VEK2tBOVc4TG9lZDdhYWREMWIrSXQ5?=
 =?utf-8?B?VW81Q3doU3dUUytEWkJWUy90Nnhvc25Rdk9Udi9WQjRyWHlGWVdiRlU3RTBq?=
 =?utf-8?B?M3NWaWJ1V0dKVW4vdlI4SEhJalNDcUJDMGNQdnd2OGI2eE5FR3pUeVZVMEcv?=
 =?utf-8?B?S2pjTDl1MTZIQ1luZTllclhlZE52djcwTlZNZ0M5aHNKWHEyVUgvK0tHRGdM?=
 =?utf-8?B?R3hySEFwTFJETHFrb3FPZGUyV0VXcDdtNlh3SVJjWmMvL1pQVWcvekphRHBO?=
 =?utf-8?B?ckR4cnlaUzJBeVlaaDgrdUg3em1tdkdIMjFFZk92cVhVUWVOK0E5aCtBT3U4?=
 =?utf-8?B?OWdQMmtzczErTXB0NC9QRVhORFRwejJUMDMwc2RGVlA3eGxQaWxSSDA1Wks1?=
 =?utf-8?B?djMzVDJtQkhJWWdSK1NCK0ZxTGd0Q0M0YlFtRTViMzg5MXlLVi9pV0ZaeXZW?=
 =?utf-8?B?Mm9jSHEwUVBkZFczUWFjTmZaVEViaGxNNERnNHF4YUlKM0phYXZSRTdWbXM5?=
 =?utf-8?B?UG93WHF4azQ2eER2MVlwSGZhT2g3ZU9PTUYxbldYRlRCQkx0S1p3V1J0L0wy?=
 =?utf-8?B?dXd0ZHNndkdEVWpXYjFjeHlMWXV1Ym55d3BWQnNiSjZiY3Y4S0NtbU1TRHU0?=
 =?utf-8?B?d0RpOXIzdlQ3ZFhOeWd6akw3L2VrK1pVazdBZ0xtcHRxbExGcHplcUR1MjJL?=
 =?utf-8?B?S2xNOGpnVXU1NVRLODdMcURDeGlaZnpZNE9xYlVrMTNXNnRKUnVzbmplalZs?=
 =?utf-8?B?VGRvK2NTVmlsQ3psNjRMQXhmcmhBMXY5SFFxQU80M0tEeC9QejZpYTdXTUdV?=
 =?utf-8?B?Mms2djhETmxhaXdWdk0wMERPVWtKQXR1YUtnYU90Ym5EZ3NTcTdERE5mOXdI?=
 =?utf-8?B?UVVLUkFmKzA3dTJzQWh2S09KSzZxTFdxSkVnYnd1NkxiVzlXTUdwcmpkN0o1?=
 =?utf-8?B?UHVUbmE5MzArdGM3S3RIMWJSQ201VTN3Zm5nNUZaNkF3aWgzL0hmS3hEcG1J?=
 =?utf-8?Q?tK30oG8XaLZsu3dRBBrivLzqF2MC710fmrbdYS9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(366011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGVOVGlLKzJOdzZ4c0g2djVqUDhYWStJSloyZVVSZWtRN0lsaGFvRE1obDUw?=
 =?utf-8?B?MWtjYmZ2OVhrcXNOSlJOTUxyUXJxVXBWZnFOR2FBMUc2M2tQYnIvNUtYQjU0?=
 =?utf-8?B?NlZ3SlB6Y2s1NjFENHlNc0lDQ1d5aW1URVpqNHh5dHVGN0p2UVhYeTNHZC84?=
 =?utf-8?B?MjdueWVYRUxhZzBNSkZOT2Yya3o5Yk1KMy9XSWZYN0lyOFNYaktIREhyTVhW?=
 =?utf-8?B?TUFiN05LcXZXVUVXalRxVGtjZXlQRU45VkRFVk1SZDBjVlF5ODNjNTdFSnRx?=
 =?utf-8?B?Ni9NRDlsU0VoR0lOOGhsN290Z2lhU2E0dXV5VnNNVlZ4NmlyQllrQTdaYXR4?=
 =?utf-8?B?eDFpOVFQQ2xOVXZNSUtUVzJqRGpsL05kODNuWGIxZm9rV2ovYTRpSTBLNzFk?=
 =?utf-8?B?M2JvVmVNSFVwbExhWE9IM3JJWEFLSHFPcS8wRWRlQ1RXa2k3ZWpwSU5Udll6?=
 =?utf-8?B?RTFUZkRQYWxnRy8wL1lLSGxnekFYRXhjSGhwUmU2NlRkSWlHMG9hQ2lrTDNv?=
 =?utf-8?B?UzRCSjRKTFB1cnFkRm1iWWhOY0E2YklmeERFOU04eDNlbDRmTURZSnJZcXlI?=
 =?utf-8?B?N2ZpSVRrRHpmRUxRcHcwSmJXOUJvQ05TM2pOalpZK21DbkRFT052VHR1UUlt?=
 =?utf-8?B?MGxkc0pnb3ZOc1ZKQ2xzTFA0OXdWVGZWdy9FUnl3UTgrUDBpOXZKWEdlMk8z?=
 =?utf-8?B?dFRBUDBXSFhlT0dLbG9PU3ZRNXNKVlZmNnNWN1p2LzB3Wk51eWhHQnNoODBh?=
 =?utf-8?B?OWduanhEZFV5UE5nSE1iWS8vZDE3S3pzL3FWQjErVVkxcldSdlZPR2hKZFhq?=
 =?utf-8?B?UjdPdGkvaEJPM3NLYTVpK1VPRVYwaWdwTjlNWDlJWTJSOTZ5TmhmUDBXTEMz?=
 =?utf-8?B?Y1dRY1owZmNTRWlaQWdEWVRGeTZqb3YzR1JxMEFZdDhSNC9XbmlaYnNDMjVL?=
 =?utf-8?B?UnVKUWRvbW9FWjBBSWpDS05Qb0JMZzIwLzJLaVFtdDUzc3I1RzMwejloUWNa?=
 =?utf-8?B?aHlXeUs5STdmbGxoUENaTlh1b3dMUWE4ZzRCM1RpMVJHNmVrR2IwOWJ4ZThu?=
 =?utf-8?B?V09tRExtZTR4d2lmVEw0SWxLMlUxUGhuTm1LcjFnOXpCcmxKV29vV2c1Ky9F?=
 =?utf-8?B?VTVnaU9nUVZTREN0aHhyZ3lsNml2eVVwaHoxaGM0V1FoRDRJVmlJeXd4UU0x?=
 =?utf-8?B?RzBEa2kwZk92bGpkUkVrbEllVnQrSThXZVBocmx3Zi9COXRjampoVW9sS1Rn?=
 =?utf-8?B?aTdmclFhQVg2SFdSOHcxZVFYcVFnVnhLdGJrejI4RHZGME1CRnJXbXhPd0xF?=
 =?utf-8?B?dGpzak9lcEJUcUNQVGt0QzZmcWhwM2x0R01oRUVWdnRWemdBMlZJMFd2NS9L?=
 =?utf-8?B?U3l1RUxVOHhSMmx6NTYwcWNiY1d5UmVSZXlvbDQwYjhZbFJxU2JPZVQzSitz?=
 =?utf-8?B?SGVoN3RuOXBmaDhqWTY0QjB2RTFIcy9oNHNGVUFTZ0JhWThQVURSblk5REdq?=
 =?utf-8?B?WHJwZXFOREwzckN6OHg4TklkNHVlcEJxU2g5eFg5SVUxa3dDUG90TUJKUHdh?=
 =?utf-8?B?MHFUY3FzNGRMa1JaZHZwbFI2TURjKzI3MG9nVGtrbENmWnpCZE1FU2NJRlgw?=
 =?utf-8?B?Vm53Y2JpNEZ1TzlCeGFQL2ZsSzJlYjR6anZzQ0k4OE81dUFoYk9WRlkrTHdo?=
 =?utf-8?B?amxWeGZuSDJZTmVVeE13S1B3K21NZnVncktnSlhzbGhXeXp6VXJiWWtlYWtp?=
 =?utf-8?B?a1dBWGZyZ1NkNVJrT1Fra3hKWlBxOGVBNFoySzFNQXB3Tmd4K0M1cTJZK1BL?=
 =?utf-8?B?b0Q1bEkvN1E5OE9JTDVvSzU5enhIQUI2ZW55WENOM3BuT3NNeU9uNzEzTjhB?=
 =?utf-8?B?Y0NnSVhTL1dhQjFGTEhVMG1hTGRJb2xBV0pLVnk5clJPajdVaFl0c0p4SnQ5?=
 =?utf-8?B?MlMvRzdXb1RHbXhrbGxnNmZDcUtsSE1Lb0JKQkRKNFVJd2trSGUwVUtYNXVS?=
 =?utf-8?B?NVA0eFl3SWs1eFJjYUFDVEtWQUswN1MyeURySTNSak5NV1NkUHhnanZFSjN4?=
 =?utf-8?B?ZkREZVBpZldrQVpCdzA0Y3hGZ3VMR0cwVWxyQzJFVUhDbXR1Q0FwUktVMnp6?=
 =?utf-8?B?cFZuTEgzcFJZY3dSa1Mrek5kTzFYT3JuS0FhZUZ1b2dXSkcxTHNvNDlrclk4?=
 =?utf-8?B?SWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf2246d-9333-4481-de02-08dc8bd5f6a5
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 18:23:46.3728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h0iyD/uvwQkra8RqYTEcKSWFJlUZiS0+n2HE8w1ictxErMEPHS8gm+nthlxXhPXn21zeoOZSx0ldmRDIZoGfZFn1Peak9vRf8uEnqsFN/xw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6432
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

On 6/12/2024 19:34, Matthew Brost wrote:
> Rather than checking for pending enable and asserting runnable_state ==
> 1 in sched done handler, invert these. This is more robust code taking
> action based on the G2H message and asserting KMD tracking state is
> correct.
>
> Suggested-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 74552391dc5a..373447758a60 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1782,8 +1782,8 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>   {
>   	trace_xe_exec_queue_scheduling_done(q);
>   
> -	if (exec_queue_pending_enable(q)) {
> -		xe_gt_assert(guc_to_gt(guc), runnable_state == 1);
> +	if (runnable_state == 1) {
> +		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_enable(q));
>   
>   		q->guc->resume_time = ktime_get();
>   		clear_exec_queue_pending_enable(q);

