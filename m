Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10877D35177
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 12:22:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC56F10E345;
	Wed,  1 Apr 2026 12:22:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aya3Iq9W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7066A10E345
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 12:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775046159; x=1806582159;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=80TsOlg8XYEFhb2EGJ8+eNmSgtwVotxAVxeDVxMqXxA=;
 b=aya3Iq9WCFqNd5fs8D/hJpmAFgiZdNWaMpP/VcQNI1bbcctNR7szqRvI
 dFa528VGlGhzjRqL7i/vP9uYjD8jO0HZLL4SrswRzT8hD9pOct4RHZfrB
 fvj2RpG8D700yANA7CL6CklaShaJJ4AKtvDVh/slTANfQD7iQb11y4MZq
 n3OfISUKqJ+YTFhNuFglWlrF1yDfIxDn4HnfT5n/dncRv5S7E6jNSBWWV
 frKf7k5psIanfm3WO3pCHZbIAbGLTI89PXDuQ8sNr9VaJqOLHtwVu2owv
 /pm9b5Y7OnD4d4f4pVDUoLE8VEGQm4pVGi74/9cMl4Wsb1B/FUp4osGAR w==;
X-CSE-ConnectionGUID: 7cMj56SRTaymwwYK/D/MDQ==
X-CSE-MsgGUID: 5MVshCPKRu+FWO5LDf9jdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="79686723"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="79686723"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 05:22:39 -0700
X-CSE-ConnectionGUID: u3i62kXtR/WH7Od9qYjmiQ==
X-CSE-MsgGUID: PqY0/yMeSEm+hHu/kzzNDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="231459309"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 05:22:39 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 05:22:38 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 05:22:38 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.54) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 05:22:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nKYjbUBrZshZpe2FFXRWQgyELUyNBnb6R/Azn7k78ixjpJ6OY2g6AE2Hlbj9q5Uwr5nPp7fcaU8bYMFrldwNgqsVKm+b+OedxIHGk0IeZ3tYA8I4fWH9D56rv9VZ3ZQalJRh1C0A4itldIWttEh2cAIEYH3XgzZIahUBvMPEONR3SaQ/qAiba4CDpk0HcpaiuoX+8J336aqPZw5IWO2+cA1UMWFLbpdsl9CvhOd/tfMKPx5w+I1OcR8JyLOz7Sr+ioNXGv/MEaMX/NftV9GyYHssUAFQ1JMJc4j2snsV3RGa2UC1jAh3SsgdZO0SHb/OdYWqtvFhIzPFu53gjNXaWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QTJ9GkbPHuYyk40+Bnzlxo3VYlVFnMafjT26aTwIC9o=;
 b=JaDZX+zCGm3CNmxwwJOwv+A6bHhTo8eTrQmM6082IUM/KCtf71zw5XoVtSrFKKgT8rLztCJd2YCYf3eF4A3KjdVRKUwvmLDQK+yEzSW0EuaXmcEGhw/6tupOVkIfCxSWNbVy/7Lu9TPYsDyCZ4EVGj3Ym6zXtMF5Aozq5osd9G37ec3nD0ZiUSVfmOTmXgJFAb8BOhvVzrQlLeV5yo2rt6NRSQMA/RRAmEg2cSnsdaSeEaWWM7gSzttmbkmzs2wDv+4hDHqP1SIBGVwvf8QTqNxTTEQHGD9bWoCwnODGTPHkE40p+Fv5tqbBjJr3P0oVbuJWayjw+tgwe88GAn2dEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA1PR11MB8796.namprd11.prod.outlook.com (2603:10b6:806:467::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 12:22:14 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%3]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 12:22:14 +0000
Date: Wed, 1 Apr 2026 14:22:09 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <arvind.yadav@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3 06/25] drm/xe: Add XE_BO_FLAG_PUT_VM_ASYNC
Message-ID: <ac0N8dh5fVvBsLTB@fdugast-desk>
References: <20260228013501.106680-1-matthew.brost@intel.com>
 <20260228013501.106680-7-matthew.brost@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260228013501.106680-7-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU7P195CA0009.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::10) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA1PR11MB8796:EE_
X-MS-Office365-Filtering-Correlation-Id: 2941fb1c-b127-45ea-9523-08de8fe94e5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: bBLkXcr+Oged+W1S6/+gJdbhQfROMOF+VoMuV1k8fg+DfLxhu3w32KZAtSSX9eb9k1h1YHd92sPT0qCmYoZDlBC44dWlPk56P6meQKu4vqonsr2EKEDdxsV4mHv18lSWUCf9Zlm0A5YwEhqvHkvFoevedzpZ4/d3H4ND+7TEIh2S+8qSwbtGQ/c/RVfZLBPFIkett+UMJ8WS6DqEtAs8j8NZ2FeCxg5AoI5agdqUWcfQxoaxbWGJQEHIB6CELg3392vDyi+/nv/lU4fNOaIBUASVM695RgFsrUaSqgAKJM9zl2/we9VfY7imNd1f7E1Kx6wLyDBPcOKtdFiUB9HkjhUE4Y9Zo1bye7VjXXOYGQKXP022H7XcB5l4nMIFg4im0MX/jXM7cAw5kcBbO8WDlFdREUZMsakbhfYJ6Ug77BRsOcy/nEi7DN00if8QQeBim/qQzR/B9k+mmk9E3xl9iKLqs3v1+OSKQ1/Ij932vFE4/0+VVU+8Cwgy/M5p9vr1dVLpcqXWtg68zpBs+++LTZHqMN86XtefHFS4fwUZV8JE/TnW24g/Qb/AvHO/Pt8njFhj1jvGVVxgvA4IkdC1lCjw3n0UNceV4r0NW+mWR+5sqR376YAxVKahX/dn3iFwA7NUvmhgbpqVrbQEFIVuxKyIzYA3TflvWYHWUZQRSbD5HS/Ifj+ID/uD4UhQBW4087U5L9FjNN4xvDEpIADenLFzya7CIuxaSiKc3FphVXY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MURiajJZaGh4WDUxZlNlL2tHRHpGYjNvc3dUQXdGNXRRVmxMaWlkKzhnOVNS?=
 =?utf-8?B?VTRySC96MjhWN3NLMG55dzVsUGpaWlQyTEhjRjZhc3hVOTJrLzhvVEZTTWdP?=
 =?utf-8?B?YkgzSThFRmNLU2NmdXZPQkVaajhCSktJRTBVNTg3ZTRMU1FsVjVQMWVoYzQv?=
 =?utf-8?B?NTBEcDh1TWhoaTY0STNCYzJKcTc3T1VpNjVWTzViYUd6b1pqRExpcmp4enRw?=
 =?utf-8?B?cUpYaG45S1c4b3MrZ1lib08xTTFhZkd4bDM3ZFZwZ0JKNHlDTHNDb3FJWGFw?=
 =?utf-8?B?MVdERTEyaVBObXdvQ0hWbDBwbVA4S2pSaUFsRjJiTTRQVXZMcXVYMmU4bktV?=
 =?utf-8?B?eVFSVzJiZnVKd0ZvRnhVUFJ5UG5GWmZkSkxidzJSZ0pSV2kybVdXWTJ6Tnhv?=
 =?utf-8?B?bzZWZ1c0eWUwWGhSeGsrSW9kamR2QzlJQm5aRVNGYWFuK0pVTVZnTTBJcGdZ?=
 =?utf-8?B?UDZGUHNldGtkdEhTenlSUWtvMjdLREtRVnMwNnI0LzlLcnJYSFRhc1RtZzcz?=
 =?utf-8?B?UGlIdC9Oc1VMOVVPcit1aDVzUVZQdHJaZ0htbmd4cWE3S1hreTlLMk9aZFdW?=
 =?utf-8?B?ZmR0UjRxTkhjWDZyN2JHTEM4RW1oWTV3MFpwSWszUG1YOXEvT3ZGblFFa0cy?=
 =?utf-8?B?dGpXNmxoK3pBNjh5UXNaZzNZYnJmSXczSjg1VEJDakh5RnhJN2J1bFFpWkJH?=
 =?utf-8?B?NlIzL1NyMmxuc3JYWHdxTjJsRWpMNlRjNnQrbWs5WEQwSy8xcmorOEMzWTFR?=
 =?utf-8?B?YS9aa0JBUnE5TGZsbXJOcUFIY2VQUzhkQ3hnRm9GendoeCtUSmpVTzZ5RHRz?=
 =?utf-8?B?NHFBY2EyWEp4emNrRHhEQThIZENuMmlKdFFtMlpPYnNvNWNKWTVkV1lKSG11?=
 =?utf-8?B?VzNHcmxzL0VLMmRhY1VVOWE0NFRVT3NKekR4aVhnRE5wbVA2YnZWS3dZM1dy?=
 =?utf-8?B?Mkp3dDQzbXJleUV0bWo3MDF4STRwZVZBc2w2N1pQYXhialgrckFrZVNGWkQw?=
 =?utf-8?B?V2Y4U3dwenBkQm90U3FHWDkzanVBM2h5OFFFRjRBQnlGRWxoOEJ2aEZzRlox?=
 =?utf-8?B?ZktobllvWm5YK281Zisrd3hoc3FMNU1YVFkvTGYvNyt5S0JaT25ZbENsb1hO?=
 =?utf-8?B?MHBQZDNCRU0rNWJmNkJhcmhxT0VWZ2NRMm5NNTE1ekVaV2M5cVVLTXFqZWhR?=
 =?utf-8?B?L1VvZGFpaVIzc21NUTBXb0FBa2RXdlVTL3dSblNlUmRGcGEwLzlZTHBaSmtD?=
 =?utf-8?B?SWxDaDV3eVJFQ2lOcjltK1RnRlZvKzF3emV4cEpBN1dVaTB1dTNXZlh2ZFJo?=
 =?utf-8?B?MUNQaS9TcVhzRHFEVWEzYzJXVFdHRTlWU2MxOGYrbFlmOW1CMEdCaHNXZXpa?=
 =?utf-8?B?UkNZdVVFUWRQNVlhSUFoWnFhM3U0d3VSeENPaUtlZEcvckJ3aFRLenhzVWZH?=
 =?utf-8?B?aGcxRitJK0w4Si9Yb3RCQ3cyeVZBTmpjK1Z6VmlYU1BQeTBNYnE4NFhEMSt0?=
 =?utf-8?B?bmY3WUk5eVMxUW9MNVVWcVhYc1g3dDB0K3Btd1ViVkMrK2JTVHQrK2xqNjgw?=
 =?utf-8?B?blV6QjEzZ0FQTFQ4Y0I1Qi81RnhiMUpFYytyTlVLbVIrZ3hvZmdLNHZBdFNM?=
 =?utf-8?B?VFFpTDNac2M0M0hCTFVWWFVpMHN0MEFPZU1pMXkzUW50UWQ5OXJEbk5tSlFD?=
 =?utf-8?B?ZDZ6WUE5T0VPQ3pab2xYa0RpdmlGMldBcUFBckFNWEoxTUZFSjR5MHMybWs3?=
 =?utf-8?B?MHJONTA1N3NObmVBbzExTTlycUR5VGNZRm9waWRaTXFYOWNXRzRoUllBRVNu?=
 =?utf-8?B?TUxOZm9PeG1hODE1UFJ0bmlkRW0zSHJnWFNRaHh3ZmExdWFpbFhsUloxT21x?=
 =?utf-8?B?c2xTKzlPa0NRV29RVWoyUmZJRFNIa0pObjFmNU5WaXd4WXBtcnVrOHFydGtP?=
 =?utf-8?B?L3pBVzdNdklqT0MxcGk1UG9ySVFYM1JHd20ySFh4RmZFSFJadDVlVjN1dWhN?=
 =?utf-8?B?d0NkaFZKckovQ2pzTStheVJ6bjN3d1VvNWthL0lnQU0wNDFNSFRZeTR5VVh4?=
 =?utf-8?B?MW1DVng5WUVJaitBZUVMQkF1U0EzR3hTamxyNE9zVHlLTEFzVlE1ZE5mQUl6?=
 =?utf-8?B?cGZtREp3TFAvRG5oQzNIVi95cVNCVmMzQ2xxYVRMdEJ6VDBzSzhmc0NtQndq?=
 =?utf-8?B?VUVJV2tlUzVhcmpsVldwZUFGeUQ3QkdrS3lvTkJBWjNaNXBDcDFmVGJ0Ykhk?=
 =?utf-8?B?dktobDQ4cUU1WTJnNjRid0cvS1d5V0QwOGZzS0lpREpwWFNJNUgrRUJGVXd5?=
 =?utf-8?B?QktoSk5FTG9yU1FTRTluYldqbE9xdFhpV2hXQmRGeXZZREdZbjdPL0dMOVd3?=
 =?utf-8?Q?YeDggq3aa6CBhV4s=3D?=
X-Exchange-RoutingPolicyChecked: CvEpQGd1tfRxCpZAXBg/cu7NcO/A9oThS6fAs92GxNo1cd7jU1x9svr6BhpYTmpr6CJ5ob3pz4EftnyV8NHLefkUIQ6MtQH+R8g/xvqTz4xv54ttdnroNe29LFmO65Wg9vD27AFrB20bPK6N0Bimn1zoJen2VrE9QFP4eUYybXBs+wveA3TNzdo8IW4dYGMeawYWrfsQ3WSxq2qFS7O1R+fJNtbGYEv81oJsKLSc0n/UB7CZQDkcpsVFre+jSy1s6EUmTYIQvIwwNxzUVTjzjJtM5yvWop1j1yKuA6jrWEAsAZ8zDXloG2BCkImkhGc0o7KyftnDXBn5FSiIvEADnQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2941fb1c-b127-45ea-9523-08de8fe94e5a
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 12:22:14.0127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F2UbPzFgzoGkDrieRlMJh5HzpdL4dvf6DgGinrbNL5ZxNHetgskLrCQIMI6aUvL8wRUNmt9t318hRvjiOB5ZOOlmyg2UGUmn6uRJ0rV1UqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8796
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

On Fri, Feb 27, 2026 at 05:34:42PM -0800, Matthew Brost wrote:
> Add XE_BO_FLAG_PUT_VM_ASYNC, which indicates that an async BO put must
> also drop an additional reference to the BO’s VM. This is useful when a
> kernel BO, one that does not normally hold a VM reference, needs to be
> put asynchronously, ensuring the shared dma-resv object does not
> disappear before the BO.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 8 +++++++-
>  drivers/gpu/drm/xe/xe_bo.h | 1 +
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 8ff193600443..d4c8ef8ff2c3 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -3567,8 +3567,14 @@ void xe_bo_put_commit(struct llist_head *deferred)
>  	if (!freed)
>  		return;
>  
> -	llist_for_each_entry_safe(bo, next, freed, freed)
> +	llist_for_each_entry_safe(bo, next, freed, freed) {
> +		struct xe_vm *vm = bo->vm;
> +		bool async = bo->flags & XE_BO_FLAG_PUT_VM_ASYNC;
> +
>  		drm_gem_object_free(&bo->ttm.base.refcount);
> +		if (async)
> +			xe_vm_put(vm);
> +	}
>  }
>  
>  static void xe_bo_dev_work_func(struct work_struct *work)
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index bf284ed47325..14be9c1bb09d 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -52,6 +52,7 @@
>  #define XE_BO_FLAG_CPU_ADDR_MIRROR	BIT(24)
>  #define XE_BO_FLAG_FORCE_USER_VRAM	BIT(25)
>  #define XE_BO_FLAG_NO_COMPRESSION	BIT(26)
> +#define XE_BO_FLAG_PUT_VM_ASYNC		BIT(27)

If I understand correctly, this flag should only be used in the deferred
path, which is why it is ignored in the non-deferred path. Maybe it would
be good to add an assert there to make sure we are not mistakenly leaking
a VM reference.

Francois

>  
>  /* this one is trigger internally only */
>  #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
> -- 
> 2.34.1
> 
