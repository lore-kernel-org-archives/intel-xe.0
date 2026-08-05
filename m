Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466F1C55ABA
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 18:58:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D227E10EF67;
	Wed,  5 Aug 2026 18:58:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FfPZKnY7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB82B10E1C1
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Aug 2026 18:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785956329; x=1817492329;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7eJh50RN0uvqxURdD9EGbrJjMyReoiCnSzKr0uSbaiU=;
 b=FfPZKnY7CyyngwfaAYBpMefOIdBmzhaUCSpdUjxI5/n8v3fT9EhYTh3J
 0HoVEj4rxY/cvY8Ghn6SMsbQpnk8s05vodgAk7GRWbA11AV7ORVlH7xwQ
 iOv+Lj9qdH0dP3xwJLmTgBxTOMxZ6zvmvecVmNsruf8TuMpFV2GLIkvW6
 flzntfMmq34Jt8HCxe8Cvq9godMbX5tSp04i+dWHU7qtMw8NUiXvMq7uH
 60rn5AoId6twnMZfdlez0CL9PfLc5YUFeKyJW2kda3e24BvmbpuXu8/wW
 sLY7bljyUqcDa8t5rMAVzaE5qNGLSEU7LLU49cuMSlIwSoNqHrNIuZPdv g==;
X-CSE-ConnectionGUID: G5lg9YiBR3mHYxt2ky5E9g==
X-CSE-MsgGUID: 0u2vWqHKT9+zna2KBO+piA==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="85516238"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="85516238"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 11:58:48 -0700
X-CSE-ConnectionGUID: /QPXhmzxQH6dgaaOPPqOAQ==
X-CSE-MsgGUID: BB9l1uRQSMGs6NINdOw2bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="262498219"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 11:58:48 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 11:58:47 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 5 Aug 2026 11:58:47 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.16) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 11:58:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hfMUq3rVVTJ/AUunw1pEsZSvXJTiu5PH+FeYg04fI/wY+R1de9ZAVsvYCrKdDhko18b9fpvap5WEigdJiAqaBWVXophd+hm9KlNfKKyymZDQFGbDd5SFuVt3/mgF8MY21BtGesZIbtUnI+aQQR5TKA42/+NtV0WVmnjy3u8vmw7ipAzp9ZASF96MEJnTwG7IOo61TAt6TlP9u7Tz1RT2qFRkWp6d2qhjxh2rGzn2GqAKgTUlNDp+IK65aJeagR82M9GueS3VFD2fX7RwD+YJLm68o/jwatTciXf1Wabl4uNQEY/ah15V+DLCt8hSJJtwW49IssgvGJeeJI9sgnv10g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJQzXaSzNGfhZVMpCc8lGfEeAQ3qbY87WSc9ROWcSTQ=;
 b=bhFQPNgebAhb/JDYBqRW5jb71tLry3YEOvwRyepZ7GyGyE6NuHwsqDQY47xZgtP2dyNwnr/S/hjwSIml3iYH75n8AxxxRNHK/tTwPIcarAFkoFmAujVELJalzJZjxGg5rzpyAPFLM+PAAAhNhvFSbg9JLYt4Ug3qTMXOSTz0WHhjhkRkb9nZZxO+7mayuAqqsIvk50CBljjpxcxCQr7o4oMQvWdm9lsDk0dQnMcuYzM8oilAszmR2fwADhC9e68EGZEJXoBLWY8uKKGwJ0/ZXe/wW8SDc7DAt75ifPTxTL8K13AFPhfK4gEcZiQUfaA8xRm0jGxcFekDngH2dz7dCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by CY8PR11MB7747.namprd11.prod.outlook.com (2603:10b6:930:91::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 18:58:44 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%7]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 18:58:44 +0000
Date: Wed, 5 Aug 2026 14:58:40 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: "Tauro, Riana" <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>, 
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>, Yoni Levitt <yoni.levitt@intel.com>, "Raag
 Jadav" <raag.jadav@intel.com>
Subject: Re: [PATCH v3 02/23] drm/xe/log: Add structured SIGID error logging
 infrastructure
Message-ID: <anOH4DUfhIkfPoG9@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-3-michal.wajdeczko@intel.com>
 <ef2906e3-1070-4de3-9de0-ed651fc7cc82@intel.com>
 <anI08vDXBbEIL94j@intel.com>
 <7767b6c1-9695-4d1b-a492-e4fd1be3f410@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7767b6c1-9695-4d1b-a492-e4fd1be3f410@intel.com>
X-ClientProxiedBy: SJ2PR07CA0002.namprd07.prod.outlook.com
 (2603:10b6:a03:505::25) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|CY8PR11MB7747:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ca556e2-52c4-442a-9db2-08def3239299
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|4143699003|5023799004|11063799006|56012099006|3023799007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: fqXmas5MlqPpxYuzT+c4b3/EMx/1DRHafKGutAlxZD72gR5mIN6rFcp7bvTeUfluw+CNb7NyB+Vzupphs1MavOKJta4t+QhtFQsTTrs+GVzrCmERiJpyfmpM0DFI2l/bJpiWu5KkzXF4NDIUhzbxNxXXeWsRaPSZp+VQGLaY+s3w0r1mf3g9+v7dEONx4yYnp8BYV3BnOmfdRFHg4UntpMZwRReSQ5/FP7FSMpffGaeo+HLGAcg4hxn9X2Y/WNZd3oeBSMWHiaq7xYnMdYHxfIV1Nfe1MVTmBUp/UzB4rbBVsnapar1L8uSQuUGiQPVjtNE/oRE2MRKbyEO5lArhPA2Vtvxw0A467kOGeMyAMvt7nNkSR577n8F8n9a38gVKNi9TCRA13oGPQuPEh6iah0LsNrv9ep0dNedBqNntU6/S2hE4LLP6a0U3xtdg/KTBpMBRJY+BPE4HzevlTShfdecQ+JfnoVeWZ+iHTeGhwwcJqojtcKG0qCfDAkwOizB6dzLPcfZkogXHMsIgZhDeiK/gIF0vuWBFd2hoIcSOfCZuvpM6zpPfgi0xpU49vfVFh2TdHQDHRbVBwfSS+XgOg5c2CmWY4A+s1D+OqKikgwuFo/FBPeVrMDwl/BGkx3EQHDp+57Em85lneM0CTbS5gddJnEEFvPr7sBxpUaBHPLk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(4143699003)(5023799004)(11063799006)(56012099006)(3023799007)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGpLbUpJa3VtdkRaV3d1ZU41Vjc0WUJmcTBJQXluN3hub2N3WU5ZNmZYWTNE?=
 =?utf-8?B?Y3hIZEpQa3cyc1VJYmppTzY4ek1QRHFEYVpBQlM1UlkzQ1dCNmNPZ01kWkxX?=
 =?utf-8?B?QlFHL1NpMTBKdXFZUHlzVjBlajQ5YVBDMlNqcDZtd1dSQUlFNSsramUvR05p?=
 =?utf-8?B?REFxVDVkZytBT2NHSFF1T2NtZHhxWWJXVWdWWXB2bVFYYmRnWWh5a2MwWGkr?=
 =?utf-8?B?QVQ5djdxb25rQ3YwdFIvMUhvcUplNHAvWUxiWmhTcm5FRnVjREVIbjA2NVc2?=
 =?utf-8?B?OWxGaGxwNzhWTmpEdmxDUitOU0EwZldXYVlzNkpiank5WkFiS0wzR09RcXUy?=
 =?utf-8?B?RjZ1NlJLMm5jY2N3M2VQekxkUzMxSmxvNVBQSk90bFhjLzdBczVuVE9oT0ky?=
 =?utf-8?B?Y1pPejNoUno3Tjh1a2lWV3Y3UmxHYncrNldjcVpZN0Z4aHdHMmFpWklDQlp2?=
 =?utf-8?B?ekI1UjFQVWNDU0hFOE1RNzhJNWdka3g1NmtmUnUxb2JjN0FUazNUQnJQTlFS?=
 =?utf-8?B?Z21FSU1pZGEybWtHMjFSSTRwTGNtckw2Vndud3pHL2JoSFl2eWRaQmlWbTRz?=
 =?utf-8?B?OU0yTjdHNVlmZFhIQzloam5OdzhtZjJoc0xqMU9haHNtVEhweFU0ZGtIOTg0?=
 =?utf-8?B?eUZXVmFiSWJRK0twS3lRUnFvVTVyYWJnQndzbHQ3U0lLYkVtTEhHUVVGcTcw?=
 =?utf-8?B?amhsTC8xYjY2Q1ZXc0Y1SlNzWUMwbC9GNTg5REIybHZYdFk2eUgrOWtVdnlu?=
 =?utf-8?B?bXRyZHhxZlAzV0lhMHBDL0R2NTZIcUpUYXVxQTdSWFNScGQ3S0JPNjlXVzZw?=
 =?utf-8?B?N3hZV1hlWEQrcEQxckV2dC9wNlNPZ1QzdDNDMWJKbENUNFhodHArSEMvMFFj?=
 =?utf-8?B?MXJUV1IzSUxzSDZZVVN2R08yWWxxQmNlRHZIejdxSVBRQzVyQmVhQVlLcDhU?=
 =?utf-8?B?UDgxcjIrV3k2VDJYQkRwaitsU0x6Mzg3Sit3dnRSN0lIK3Z3R2lBcStPRVh0?=
 =?utf-8?B?aitiWmhFM3FBem4zemRKRlJ1NVJ0VGZZUzFheVRRZHMrdjdKKzQwNmlWcGJ6?=
 =?utf-8?B?bXpXYUtmMDltS3VUejdYdGFoaEVJU3dsNUVCTndkbG1FbmNaTnNESElZWHZF?=
 =?utf-8?B?ZHFjUm5ESTFxaU1hSmNwTSt0WVlPTWN4ZmkyTEJYV3FtRTY5ZGNYS0ZhNUx1?=
 =?utf-8?B?ZE1VWHVLYlloUXgrRUxXZFpMNFUwOHUySllFdkU5QzZlTDBySHNWS2tsd1h4?=
 =?utf-8?B?dzNteWR3WjZ3TzVWTmpIeVRBdEZiTWd2U2RwTWZKUGdLNC9KQ2l0bUVwSkQ1?=
 =?utf-8?B?UkFjMmpKY3M2SWNFb0JiYUNqMEtWcWFHSHR1RG1wVVlhY1pwaFNuMEYzQUVi?=
 =?utf-8?B?V2V5V1RLeTRDZWMrMGVORHNXeHBsNXk2ckRsbzlKUHlFaGJJdmpTaXpTamRI?=
 =?utf-8?B?Vy96dWJRYklvekJjUmhURVp6UVpiNm81aXZYMTBOems2UHFtTzVaamd4T0Nz?=
 =?utf-8?B?d3lNOXlqUTdxSjRiSVRMdnRWaUVIZlZRU1dFekJqVkUyZjFHdE1CYy9xS1Az?=
 =?utf-8?B?Mm13c0h3UUlsMUlFZ3lMam5sMFdSRlpMUnZIMXdON1FvbTFwSXpWK3JURnpC?=
 =?utf-8?B?WU9PNUV6a1RpaHdoOWFKOVZmc0tuZHpJeDc5bW5SUzZqMmZUbVYyd1ZzM0xW?=
 =?utf-8?B?czM3QllDdXJSTVFZc1Q5bU5pU3NPSE9rOUdFL0Nuc21lckQ0WW0yc1VvdDZ5?=
 =?utf-8?B?SDYzZTEyYzFNVlJNWkh0bHZLZmt2RGtZbWZnNU9WQjdkMEI5RE0vSjkvUjcx?=
 =?utf-8?B?VVR1NktYVXhyVkcvNVFSUkp0SWNOZFVpN3lpQldKWkVKTVJ3VnNvcndRbHE2?=
 =?utf-8?B?c1psRG8vWEtTMkkxME9SZ1dUZHVKMGYwdlNZUUZIdEtORGlRaHo4dlhDU2hO?=
 =?utf-8?B?NkZnMktKbHJJbmZhNGVGQzFIaXZuNnhTVzJXdFNjdzIxdi9LemwxUlg1T1VG?=
 =?utf-8?B?bHdxZnVWVlZHa3RsNWpiOEovbjZ3cXFrSytSRWl3emhXYUw4L3lBOXhUUmdt?=
 =?utf-8?B?c0lTNGN3dWxUUG9sY09UREFmblhjSStHWWx1SzZJclhvWjMrS2daNWFSVEZu?=
 =?utf-8?B?TzNTeFA3a1V5UmxQY3YvYUhsQmN2MlA0enFwaVB4dHU4NjdNTEVKNStTNW83?=
 =?utf-8?B?UmR4MnBKc2kxNXRoTlA2OFlJdXJWbGdlazFET2Z0QmM1VlJZQlFTd0prQlhp?=
 =?utf-8?B?ZUV4eXR3cWhRZ0RlS0ZvVFRES0k3Z1kycEF0ZTBONnczZ2Zzazd3WkVKR05I?=
 =?utf-8?B?QTR5eGNBaDB6eGRad2dGQWhnL1V5Ymp2M2gyQmRXSXRybHBvbkZsUT09?=
X-Exchange-RoutingPolicyChecked: Nzy4avpq362SNMD8LEP10x7nPLAXgBCSzf+Mr5ZbaBW/m1FxBXkBrCp/BBPnXlD55mtUNbDJvOqt2rzM6i3fazEDN8vO50t3V+IULGRJKYU/rJEWpAVV8ZuEz2SmJWFyl67+TYFWuu8fByGuIL8ZWNZ5FXDh4avCMJa6nj+r89e7rPEXjQ3X1MqrTSuxIxjrVJBN/hj9C1QFk76rA8gxLUSShEFcsrEscKtJUdE4po/wzGf1umZIBSh/J1GvUqDJUOAKQ2FQ4keMppyNbaokxuMyjViq/VxplQy1ba5sltfN6DZvQc1srceDeIoA11MH7ICKXHX+vdo6VNLQbH4C4A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ca556e2-52c4-442a-9db2-08def3239299
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 18:58:44.4807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 092qVoo46pWR4z+EgoOe2M/aujVLhIhp4GNp7+vAO0LZoYuA7QDbnar5XsgLWB0bpN/SdiWb2iFchihGqydk6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7747
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

On Wed, Aug 05, 2026 at 07:23:10PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 8/4/2026 8:52 PM, Rodrigo Vivi wrote:
> > On Tue, Aug 04, 2026 at 08:30:47PM +0530, Tauro, Riana wrote:
> >> Hi Mallesh/Michal
> >>
> >> On 30-07-2026 20:50, Michal Wajdeczko wrote:
> >>> From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> >>>
> >>> Today the driver reports faults with ad-hoc drm_err()/xe_gt_err()
> >>> strings that have no stable shape. That is readable for a human, but it
> >>> gives fleet tooling nothing durable to match on: the wording changes
> >>> between releases, lines can be rate-limited or dropped under an error
> >>> storm, and there is no consistent way to ask "which recognised fault
> >>> just happened?".
> >>>
> >>> Introduce a signature identifier (SIGID): a small, stable integer that
> >>> names one recognised Xe fault situation and serves as the primary handle
> >>> for triage. A SIGID maps, through published end-user documentation, to a
> >>> description and a recommended action; the driver only has to emit the
> >>> right SIGID next to the usual human-readable text.
> >>>
> >>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> >>> Assisted-by: Copilot:Opus-4.8
> >>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >>> Co-developed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >>> ---
> >>> Cc: Yoni Levitt <yoni.levitt@intel.com>
> >>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> >>> Cc: Raag Jadav <raag.jadav@intel.com>
> >>> Cc: Riana Tauro <riana.tauro@intel.com>
> >>> ---
> >>> v2: CORRECTED is still an error (Michal)
> >>>      prepare to decorate dmesg with comp/loc (Michal)
> >>> ---
> >>>   Documentation/gpu/xe/index.rst        |   1 +
> >>>   Documentation/gpu/xe/xe_sigid.rst     |  14 ++
> >>>   drivers/gpu/drm/xe/Makefile           |   1 +
> >>>   drivers/gpu/drm/xe/abi/xe_sigid_abi.h | 183 ++++++++++++++++++++++++++
> >>>   drivers/gpu/drm/xe/xe_log.c           | 135 +++++++++++++++++++
> >>>   drivers/gpu/drm/xe/xe_log.h           |  20 +++
> >>>   6 files changed, 354 insertions(+)
> >>>   create mode 100644 Documentation/gpu/xe/xe_sigid.rst
> >>>   create mode 100644 drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> >>>   create mode 100644 drivers/gpu/drm/xe/xe_log.c
> >>>   create mode 100644 drivers/gpu/drm/xe/xe_log.h
> >>>
> >>> diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
> >>> index 665c0e93601c..0247a255f7e6 100644
> >>> --- a/Documentation/gpu/xe/index.rst
> >>> +++ b/Documentation/gpu/xe/index.rst
> >>> @@ -35,3 +35,4 @@ The display, or :ref:`drm-kms`, support for drm/xe is provided by
> >>>      xe-drm-usage-stats.rst
> >>>      xe_configfs
> >>>      xe_gt_stats
> >>> +   xe_sigid
> >>> diff --git a/Documentation/gpu/xe/xe_sigid.rst b/Documentation/gpu/xe/xe_sigid.rst
> >>> new file mode 100644
> >>> index 000000000000..45d84a62f185
> >>> --- /dev/null
> >>> +++ b/Documentation/gpu/xe/xe_sigid.rst
> >>> @@ -0,0 +1,14 @@
> >>> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> >>> +
> >>> +========
> >>> +Xe SIGID
> >>> +========
> >>> +
> >>> +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> >>> +   :doc: Xe Error Signatures (SIGID)
> >>> +
> >>> +Signature Identifiers
> >>> +=====================
> >>> +
> >>> +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> >>> +   :internal:
> >>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> >>> index 67ada1d6c2fb..7ac3954737f9 100644
> >>> --- a/drivers/gpu/drm/xe/Makefile
> >>> +++ b/drivers/gpu/drm/xe/Makefile
> >>> @@ -87,6 +87,7 @@ xe-y += xe_bb.o \
> >>>   	xe_hw_fence.o \
> >>>   	xe_irq.o \
> >>>   	xe_late_bind_fw.o \
> >>> +	xe_log.o \
> >>>   	xe_lrc.o \
> >>>   	xe_mem_pool.o \
> >>>   	xe_migrate.o \
> >>> diff --git a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> >>> new file mode 100644
> >>> index 000000000000..99717fdf74a6
> >>> --- /dev/null
> >>> +++ b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> >>> @@ -0,0 +1,183 @@
> >>> +/* SPDX-License-Identifier: MIT */
> >>> +/*
> >>> + * Copyright © 2026 Intel Corporation
> >>> + */
> >>> +
> >>> +#ifndef _ABI_XE_SIGID_ABI_H_
> >>> +#define _ABI_XE_SIGID_ABI_H_
> >>> +
> >>> +/**
> >>> + * DOC: Xe Error Signatures (SIGID)
> >>> + *
> >>> + * What SIGID stands for
> >>> + * ---------------------
> >>> + *
> >>> + * SIGID is short for *Signature Identifier*. A SIGID is a small, stable integer
> >>> + * that names one *recognised Xe fault situation* -- nothing more. It is the
> >>> + * primary handle used for triage: a SIGID maps to a human description and a
> >> The SIG ID maps to a report site as mentioned in "How to pick a sigid" not a
> >> human description.
> > 
> > Indeed, perhaps with simple:
> > s/maps to a human description/maps to a report site/
> > 
> > we get some consistency?! 
> >>
> >>> + * recommended first action. A coarse first-order action is documented in-tree
> >>> + * per SIGID (see "First-order action" below) so the id is actionable on its
> >>> + * own; published end-user documentation refines it with finer, cross-product
> >>> + * detail. The driver's only job is to emit the right SIGID next to the usual
> >>> + * human-readable text.
> >>> + *
> >>> + * Why this exists
> >>> + * ---------------
> >>> + *
> >>> + * Today the driver reports faults with ad-hoc ``drm_err()`` / ``xe_gt_err()``
> >>> + * strings that have no stable shape. That is fine for a human reading dmesg,
> >>> + * but it gives fleet tooling nothing durable to match on: the wording changes
> >>> + * between releases, lines can be rate-limited or dropped under an error storm,
> >>> + * and there is no consistent way to ask "which recognised fault just happened?"
> >>> + * A SIGID answers exactly that one question, identically across driver and
> >>> + * firmware versions, and (eventually) across other Intel devices in a node.
> >>> + *
> >>> + * What a SIGID is (and is not)
> >>> + * ----------------------------
> >>> + *
> >>> + * A SIGID names *which situation* is being reported. It deliberately does not
> >> This should also be consistent with "report site" instead of situation.
> > 
> > Agree.
> > s/situation/report site/
> > 
> >>> + * encode the detailed reason or the outcome. Those are carried alongside it::
> >>> + *
> >>> + *   SIGID    -> which recognised situation is being reported
> >>> + *   severity -> how serious this instance is (see below -- not fixed per SIGID)
> >>> + *   errno    -> the failing operation's error, shown with %pe
> >>> + *   message  -> free-form human-readable context
> >>> + *
> >>> + * Severity is independent of the SIGID. The same situation can be reported at
> >>> + * different severities depending on the instance and the recovery taken, so a
> >>> + * SIGID is never tied to one severity; the reporting site chooses it by calling
> >>> + * the matching xe_log_*() helper (see xe_log.h).
> >>> + *
> >>
> >> It'd be more intuitive for readers if section "When to use SIGID logging" is
> >> moved before how to pick one.
> > 
> > It makes sense to me.
> > 
> >>> + * How to pick a SIGID (the uniqueness rule)
> >>> + * -----------------------------------------
> >>> + *
> >>> + * Pick per *report site*, not per incident. Each site emits the single most
> >>> + * specific recognised situation *for that site* -- so the question is never
> >>> + * "classify this whole failure", it is "what does this site detect?", which has
> >>> + * one answer. A single underlying failure therefore legitimately produces a
> >>> + * *chain* of reports from different layers, each with its own SIGID -- e.g. a
> >>> + * GuC communication failure is reported as %XE_SIGID_RUNTIME_FW by the firmware
> >>> + * path, the failed recovery as %XE_SIGID_GT_TDR by the reset path, and an
> >>> + * aborted bind as %XE_SIGID_PROBE by the probe path. That chain lets triage
> >>> + * follow a fault from origin to final effect; it is not a duplicate.
> >>> + *
> >>> + * If a site does not match any defined situation, keep using the ordinary
> >>> + * ``xe_err()`` / ``xe_gt_err()`` logging rather than forcing a SIGID: a wrong
> >>> + * or over-broad classification is harder to retire than a missing one. When a
> >>> + * new situation is genuinely worth triaging, add it to the list below.
> >>> + *
> >>> + * Scope: software-emitted signatures only
> >>> + * ---------------------------------------
> >>> + *
> >>> + * This header enumerates only the situations that the *driver itself* detects
> >>> + * and reports from software: probe abort, wedged, survivability, driver-
> >>> + * detected firmware failures, engine TDR, memory faults and IO/bus faults.
> >>> + * These are the only values the driver assigns.
> >>> + *
> >>> + * Signatures that *originate* in firmware or hardware are a different thing:
> >>> + * they are produced and identified by the firmware or the hardware itself
> >>> + * (e.g. via their own records or error counters), and the driver merely logs
> >>> + * them as they are given to us. They are deliberately *not* enumerated here --
> >>> + * minting a driver-side id for a firmware/hardware-reported error would only
> >>> + * duplicate an identifier the reporting layer already owns. The two
> >>> + * driver-detected firmware situations below (%XE_SIGID_RUNTIME_FW,
> >>> + * %XE_SIGID_DEVICE_FW) are software signatures: they mark that *the driver*
> >>> + * observed a firmware problem, not a signature reported by the firmware.
> >>> + *
> >>> + * Numbering
> >>> + * ---------
> >>
> >> This section also needs to be on the top. It can be missed if it is at the
> >> bottom of the document.
> > 
> > Also agree.
> > 
> >>
> >>> + *
> >>> + * SIGIDs are a single flat list numbered sequentially within the assigned range,
> >>> + * in the order the situations were introduced. Values are stable: once assigned
> >>> + * they are only ever appended, never renumbered or reused.
> >>> + *
> >>> + * A retired situation is deprecated in place, never re-purposed.
> >>> + *
> >>> + * First-order action (resolution buckets)
> >>> + * ---------------------------------------
> >>> + *
> >>> + * So that a SIGID is actionable on its own, each one is tagged with a coarse
> >>> + * *resolution bucket*: the first thing an operator should do on seeing it. The
> >>> + * bucket is a stable, driver-owned hint; external documentation may refine it,
> >>> + * but the in-tree value always stands on its own. Every new SIGID must pick a
> >>> + * bucket, which forces the question "what should someone do about this?" to be
> >>> + * answered up front. The buckets are::
> >>> + *
> >>> + *   COLLECT  -- capture logs and open a bug report
> >>> + *   RETRY    -- transient or already recovered; watch for recurrence
> >>> + *   UPDATE   -- a firmware update / flash is required
> >>> + *   RECOVER  -- an explicit recovery step is needed (rebind, bus reset)
> >>
> >>
> >> Do we actually need resolution buckets defined here? RECOVER or UPDATE seem
> >> a bit vague since states like
> >>  WEDGED/SURVIVABILITY have different ways to recover depending on context.
> >> Wouldn't detailed resolution steps in another
> >> document be better than in logs?
> > 
> > Fair enough. I would prefer we have some recommendation for a consistent
> > end to end story without depending on external docs and all.
> > However I do agree that the vagueness in some cases here can defeat the
> > purpose and mostly the conflict with the wedge.
> > 
> > Aravind was already complaining about these buckets. So, perhaps let's just
> > remove. But also for consistency we need to change the rest of the text above
> > and below:
> > 
> > - drop "maps to … a recommended first action … 
> > - Delete the whole First-order action (resolution buckets) sectio
> > - Strip the [TAG] from all nine enum entries.
> > - Drop the dmesg note "the bucket … is not printed on the dmesg line.
> > 
> > Michal, what are your thoughts?
> 
> here is updated DOC section, please check if I get it right
> 
> /**
>  * DOC: Xe Error Signatures (SIGID)
>  *
>  * What SIGID stands for
>  * ---------------------
>  *
>  * SIGID is short for *Signature Identifier*. It is a small, stable integer
>  * that names one of *recognised fault site* -- nothing more. It is the
>  * primary handle used for triage and maps directly to specific report site.
>  *
>  * Numbering
>  * ---------
>  *
>  * SIGIDs are a single flat list numbered sequentially within the assigned range,
>  * in the order the fault sites were introduced. Values are stable: once assigned
>  * they are only ever appended, never renumbered or reused. A retired fault site
>  * SIGID value is deprecated in place, never re-purposed.
>  *
>  * Why this exists
>  * ---------------
>  *
>  * Today the driver reports faults with ad-hoc ``xe_err()`` / ``xe_gt_err()``
>  * strings that have no stable shape. That is fine for a human reading dmesg,
>  * but it gives fleet tooling nothing durable to match on: the wording changes
>  * between releases, lines can be rate-limited or dropped under an error storm,
>  * and there is no consistent way to ask "which recognised fault just happened?"
>  *
>  * A SIGID answers exactly that one question, identically across driver and
>  * firmware versions, and (eventually) across other Intel devices in a node.
>  *
>  * What a SIGID is not
>  * -------------------
>  *
>  * SIGID deliberately does not encode the detailed reason or the outcome. Those
>  * are carried alongside it::
>  *
>  *   SIGID    -> which recognised fault site is being reported
>  *   severity -> how serious this instance is
>  *   errno    -> the failing operation's error, if available, shown with %pe
>  *   message  -> free-form human-readable context
>  *
>  * Severity is independent of the SIGID. The same SIGID can be reported at
>  * different severities depending on the instance and the recovery taken.
>  *
>  * When to use SIGID logging
>  * -------------------------
>  *
>  * The xe_log_*() helpers are for these recognised fault sites only --
>  * important, operator-relevant faults and events. The driver's only job is to
>  * emit the right SIGID next to the usual human-readable text.
> 
>  * They are not a replacement for ``xe_info()`` / ``xe_dbg()`` / tracing, nor
>  * for one-off diagnostics; using them for ordinary logging would dilute the
>  * fault stream. Not every ``xe_err()`` needs to become a SIGID report -- only
>  * those that correspond to a published fault sites.
>  *
>  * SIGID log output (dmesg vs. the machine record)
>  * -----------------------------------------------
>  *
>  * The dmesg line stays close to a normal xe error message so it remains
>  * readable for admins; the only stable, machine-matchable token on it is
>  * ``SIGID=<n>`` (``dmesg | grep SIGID=``).
>  *
>  * The full dmesg line is not an ABI: the surrounding text may change freely,
>  * and lines may be dropped. The durable record for tooling is the CPER record
>  * carrying the same SIGID (generation is a planned follow-up).
>  *
>  * How to pick a SIGID (the uniqueness rule)
>  * -----------------------------------------
>  *
>  * Pick per *report site*, not per incident. Each site emits the single most
>  * specific recognised SIGID *for that site* -- so the question is never
>  * "classify this whole failure", it is "what does this site detect?", which has
>  * one answer. A single underlying failure therefore legitimately produces a
>  * *chain* of reports from different layers, each with its own SIGID -- e.g. a
>  * GuC communication failure is reported as %XE_SIGID_RUNTIME_FW by the firmware
>  * path, the failed recovery as %XE_SIGID_GT_TDR by the reset path, and an
>  * aborted bind as %XE_SIGID_PROBE by the probe path. That chain lets triage
>  * follow a fault from origin to final effect; it is not a duplicate.
>  *
>  * If a site does not match any defined SIGID, keep using the ordinary
>  * ``xe_err()`` / ``xe_gt_err()`` logging rather than forcing a SIGID: a wrong
>  * or over-broad classification is harder to retire than a missing one. When a
>  * new report site is genuinely worth triaging, add it to the list below.
>  *
>  * Scope: software vs hardware emitted signatures
>  * ----------------------------------------------
>  *
>  * Some SIGID represents fault sites that the *driver itself* detects and
>  * reports from the software POV: probe abort, wedged, survivability, driver-
>  * detected firmware failures, engine TDR, memory faults and IO/bus faults.
>  * These are the only values the driver assigns on its own.
>  *
>  * Signatures that *originate* in firmware or hardware are a different thing:
>  * they are produced and identified by the firmware or the hardware itself
>  * (e.g. via their own records or error counters), and the driver merely logs
>  * them as they are given to us. They are deliberately enumerated separately.
>  *
>  * The two driver-detected firmware situations below (%XE_SIGID_RUNTIME_FW,
>  * %XE_SIGID_DEVICE_FW) are software signatures: they mark that *the driver*
>  * observed a firmware problem, not a signature reported by the firmware.
>  */

looks good to me. Indeed cleaner...

> 
> 
> > 
> > Thanks,
> > Rodrigo.
> > 
> >>
> >>> + *   IGNORE   -- ignore if the SIGID severity is INFORMATIONAL
> >>> + *
> >>> + * The bucket is documentation only -- it is recorded per SIGID in the enum
> >>> + * kernel-doc below and is not printed on the (deliberately lean) dmesg line.
> >>> + *
> >>> + * When to use SIGID logging
> >>> + * -------------------------
> >>> + *
> >>> + * The xe_log_*() helpers are for these recognised fault situations only --
> >>> + * important, operator-relevant faults and events. They are not a replacement
> >>> + * for ``xe_info()`` / ``xe_dbg()`` / tracing, nor for one-off diagnostics;
> >>> + * using them for ordinary logging would dilute the fault stream. Not every
> >>> + * ``xe_err()`` needs to become a SIGID report -- only those that correspond to
> >>> + * a published situation.
> >>> + *
> >>> + * dmesg vs. the machine record
> >>> + * ----------------------------
> >>> + *
> >>> + * The dmesg line stays close to a normal xe error message so it remains
> >>> + * readable for admins; the only stable, machine-matchable token on it is
> >>> + * ``SIGID=<n>`` (``dmesg | grep SIGID=``). dmesg is not an ABI: the surrounding
> >>> + * text may change freely, and lines may be dropped. The durable record for
> >>> + * tooling is the CPER record carrying the same SIGID (generation is a planned
> >>> + * follow-up).
> >>> + */
> >>> +
> >>> +/*
> >>> + * Top level Intel Error Signature Identifiers.
> >>> + */
> >>> +#define INTEL_SIGID_INVALID			0
> >>> +#define INTEL_SIGID_GPU_START			100
> >>
> >> why does the sigid start from 100?
> 
> there was an offline agreement with Yoni to start GPU SIGIDs from 100
> with the limit up to 999 for any future GPU SIGIDs we may want to have
> 
> >>
> >>> +#define INTEL_SIGID_GPU_END			999
> >>> +
> >>> +#define INTEL_SIGID_GPU_XE_START		100
> >>> +#define INTEL_SIGID_GPU_XE_END			299
> 
> and for the XE we should use range 100..299
> >>> +
> >>> +#define INTEL_SIGID_GPU_XE_SOFTWARE_START	100
> >>> +#define INTEL_SIGID_GPU_XE_SOFTWARE_END		199
> 
> with the explicit split for SW/HW originated 'fault sites'
> 
> >>> +#define INTEL_SIGID_GPU_XE_HARDWARE_START	200
> >>> +#define INTEL_SIGID_GPU_XE_HARDWARE_END		299
> >>> +
> >>> +/**
> >>> + * enum xe_sigid - Stable Xe Error Signature Identifiers (SIGID).
> >>> + * @XE_SIGID_SW: Software component failure. [COLLECT]
> >>> + * @XE_SIGID_PROBE: Device probe/bind was aborted. [COLLECT]
> >>> + * @XE_SIGID_WEDGED: Device was declared wedged and is no longer usable. [RECOVER]
> >>> + * @XE_SIGID_SURVIVABILITY: Device entered survivability mode. [UPDATE]
> >>> + * @XE_SIGID_RUNTIME_FW: Driver-detected runtime firmware failure, GuC/HuC/GSC. [RETRY]
> >>> + * @XE_SIGID_DEVICE_FW: Driver-detected device firmware failure, PCODE/sysctrl. [RETRY]
> >>
> >> Pcode or sysctrl errors cannot be retried. Pcode init failures cause
> >> survivability mode.
> >> RAS sysctrl errors require a secondary bus reset. We could have other
> >> firmwares in future with different
> >> recovery.
> >> That is why it would be better to drop resolution buckets in logs.
> >>
> >> @aravind thoughts?
> >>
> >> Thanks
> >> Riana
> >>
