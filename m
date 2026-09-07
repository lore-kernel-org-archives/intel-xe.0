Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C261C79FA0
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 19:28:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B582510E081;
	Mon,  7 Sep 2026 19:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mX8+gIQR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDDAC10E081
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 19:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788809299; x=1820345299;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eR6rf/g2uUNnaIY1yii3LM/cza7qurNVeS7NGWOdA80=;
 b=mX8+gIQRwPY0K0GTeWQ/DzCbmKI2/2xDD3qu/Z6QMYnkhY6OTC5YhEbo
 4d8YZtoRprTrhlUja1YwmVMB0iDedyn2LItIHXSslGcQlzTgHWxbzbP1m
 LHD3lOT7G3rUK1cckWoVbB15TD7cbP9Vt29CnkrVmhOI6AxmA4LtQIPWV
 VNp4XfcCxD5s4q4AuK8bZyOBFCAW6vaWtGaubpYklQ7lfvvgH9vdf9wce
 BUDaXm6dM+TiLPbCoNw1g9v5M0z8lPAYU4+s+7hAqz+iEfEQFtK6ot7tE
 1+2q7Doi8hp2o+61ukTwczEqtufBdA08maOrv8Ki3zqSK47wT9EQ6N/aP g==;
X-CSE-ConnectionGUID: 4KlRB694T6KR0UFoDvyjQg==
X-CSE-MsgGUID: 3cbN4CavR/miNCqlCl9WEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="93032203"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="93032203"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 12:28:18 -0700
X-CSE-ConnectionGUID: XoH95bgaTUGjy+l0I5UxaA==
X-CSE-MsgGUID: 5/qLNQEJQfWE6ZzA2CPK4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="269065085"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 12:28:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 12:28:17 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 12:28:17 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.4) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 12:28:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2FwyCBx6dnepeJRXMbXWyzjNhHdzklE9EZZjE/zozUBFpa/5SGTAryOa9zymoh+2dyHuMchneWa4w958Yk7NGrVCaHG02Q1N+q8nlVygYnW8W98CwC2nEibTxK7KRjr59sW1XeU2/Bd0/9a9CXRdsVBKlOpjwPVD0BsmBkoXzVcF0AF3SfLPcoKa42n4capyYeNOxi7md6Q2x1M7P18FCp79rp17MMHrHiUkX8+WDb6csZSxo+cX1UyKI1/8raEHTEtJAxVe81L/tfjlunKMqAFi81MhHpGeWpoDbRIP5xKc9EHCEWrTR7psvrlg1t3KgoKtNe+OUfAGfsEQpbPkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6DjPaHPn1ycK/kvWR7DTTTM9BADDj7dChRStCtvg2wI=;
 b=YYzqRAT9N3fhxxYegHyRcaymdzjqvKq2eg9EE01UAsH/QFUcRbobOB++jWlt1OL0vGCMCejlA8vBeiT5s7xxddHHc+m4XlK3zpvlQx1iqAqETIJez7icTAD3jz3r3+jr1ipK2HeecYsU4zVFSwFTfeeRXGMRYQdVeMephWDaC/IV7BU0cRs0OArFRTon2k1K9pU3Y+xUUb163mtVXxiV7Vx5qIIK1VUyZNmsGItUNEroqRp0Ji9w5HqitvmvvLvNuA58HxziLu16EMJJNwRBAWm9lBFJqM7HJutoYskVVBTEicDbazDUTM5opaTNYC3P6JzJQoZ3t5i9G1Sp3erViA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DM4PR11MB6454.namprd11.prod.outlook.com
 (2603:10b6:8:b8::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 19:28:15 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 19:28:15 +0000
Message-ID: <a081b43b-c4db-4744-8b81-7a87040b573b@intel.com>
Date: Tue, 8 Sep 2026 00:58:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [V2] drm/xe: Skip clearing purged page-table BOs
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>
References: <20260907153706.888679-2-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260907153706.888679-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::13) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DM4PR11MB6454:EE_
X-MS-Office365-Filtering-Correlation-Id: 641b6a6b-e521-47bf-5fce-08df0d1629f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: yOqMFOpry1bNkBKJCWtfJO/kffs5vUbpl3Rz7XAJG7F+jBWhHA9ueqCO/yceK1GuQwkq/Mm2D5OtVARSDS9ZzQefZ4UmOZUSg1+16v4RMC2Olo/YZ1SDyzOt1xyBPKeejI0PMJPUElEZYZOKhWr8SuZsrW0fmhKborni/mIVSYKNzs4rsRBXD5n1+91dXnMJB10IwD2SCKZFZ+Zqx1MwtAi0Zj4TkXkNNp2C+Rq0CxqtsEmtOy6bGPeeV0fhDU8V/qzjLIrF1lh5IYhAHOPmgNYOWsEtYNC5djHXsthHod//C72BvdS3lMiKkeVUkbRcsIzHi4l0zwNgTtx7Z/E3/W9CycMe0NixKZz9c1khLoA8MPXyPSKLbpykK0y0CrPvONZZiyovtJt3mmXHQ6LlKBK/THmJ4mQQ0dsn7x2fJ9qiS/in4Y9sPH+3rNbHixdxw7RFlEHJ9mXOOCA/Izu153EuiT15qlE1uIQwRYzgPXoxdk0GYDNcKFxIWAJdVX9m56FU7AULw2PTa37LrUj8Epa+XlqyVRVrR4tj/VTozm2/LM0ZP2WllOv/dMd/dm9XLqmYdxwHB9C5Mh9GXka2COEbhAAnYScon5mEOrEmOD/YoR0YLTq2E/UIfhLYugisfSqVC+DWUklW8QIppZHZYhzAj2F0dwD9B+zKqbZbiFM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVcxcXVCbkpmMTlCQXBXNVNRNlBQOWFRY21xS0R4Rm9FZW1yN0NJTnU1NVBq?=
 =?utf-8?B?ZDRxRG1zdDBlMklaVmVKdVdVMGVOOTFKL3JOR1BtUE1RMGVjcERHQTA2RTBx?=
 =?utf-8?B?VEg4ajBZOERxV0daQTZoRVM0TVEwMXRyM2FRV0MxcFNVTmsyYTlHTmgzSHlF?=
 =?utf-8?B?ZFNZYkdEOFpJY2krNDBzWFl2YXU0MGtGK1hiVnBIRysxKyt2MEQydHhOVytn?=
 =?utf-8?B?ZXZ2TVllM0cyanVqTEhhNGFPTVpXSm1GMkdzODZvSzlpNGFQdU9JNWV1TFJ6?=
 =?utf-8?B?K2JDOFRRR1dIeTNXdVNzT21oNHNQUG5hM3VNN01sdERGa3MwcWFOZm5FWFAy?=
 =?utf-8?B?ZkRCcC82ek9uekpoNVpyWUp2ZkZYNS93ZnplZ0ZQc3JKQkt2Z05iUGpha2hy?=
 =?utf-8?B?eVVmVVNuY1hjR0ZLOUhFQ2Y2eUZXZWpKMm9ZaXliYXVFRFdjQm5UUmVTcEZS?=
 =?utf-8?B?VmV6dlZpTU83S2pTaVZJY21UaXpHbzVuUHRtRVNZTHVhdzJ0TlBiRjB4SFkv?=
 =?utf-8?B?RksyS0d3UjZGaU4xVUVqaFdqUWFVa1FIdjNUUU91VVZBYklFQng1RHVRRTBr?=
 =?utf-8?B?eTZSRUZhbkpkTkR3dlFrdnBHMVFwaURIeDhFNDVEV3JmZHNxTFhQWkc5S3VE?=
 =?utf-8?B?VDlUcE1oK2FVRXNLWlVudTM2R3ZXUXIySkRKUFB1T2s3UXBtcnlRcjlpaHBp?=
 =?utf-8?B?L1lkK3dUdzU2OC81UUI5K0ZDZ0NiUElNNWpLK2lJSnRhbmhmU3lCemdpbVdL?=
 =?utf-8?B?NUFUYXFKZHRKVXRlN3BLNHYvazFmUWVvN2VuSjFMaGw1SWJJajd2M09CRlc3?=
 =?utf-8?B?ZHpEa1E1RWdzYTZRMmF4ZlE0VzYwMXlsTXYwZXQyU3p1eDdLT0pMbUFIU3ky?=
 =?utf-8?B?SDdBSXp6NEV4QldjNkg3UVcxMWs0M2lOREZHaHN1SytTM0sxZEtCVlhWYmkx?=
 =?utf-8?B?YXloVjZRaHV2a29lS3FHcXFGV3UrR3M3YVcyS0RXZFFtVlBkUENXL3RhSG9L?=
 =?utf-8?B?MVNGSHovWEdmV3BGam4rdnhWNVB1TXA0OUZLcUVPZ3g0OUdFdFZRUlRDbmtt?=
 =?utf-8?B?c3pDL0svTURSbDdVQlhaRm50UmV2czFSSDlCaVMwZng4T2paR3hweVBGeEdD?=
 =?utf-8?B?Rldyd1htY1U3cWR5U0dITjJCSEhyMHNEaCtvVlZ3Z1BKYkZqeUhNdVh6eDNm?=
 =?utf-8?B?cW9sY0RubFplcjNEMHZvSTByMkdkQTBIdzF5WlZLUG10cTR0KzZXcDdjZEtG?=
 =?utf-8?B?KzJSakttNEJvNWVuSFljbXRMWmN0SVlWZ2YvSTJyckY4aVI5aTJadUZhZE5X?=
 =?utf-8?B?T2RVVzlJSlpZOEM3SkYwZmlnMFVxa2Ryd25sSlI5am5NWUcwMXp5aDQ5RTNM?=
 =?utf-8?B?dnNxRktwQkFnSE5YTUJUQ0VXOU5aWFprb2R3cGhlbElHamZVc0QvL1dpd3dy?=
 =?utf-8?B?TWtHWWhlcWwzUEw1MFdvQnpLckVjRHBpMHdraEtMVUNNTjJGQ2VpcU9IYkhk?=
 =?utf-8?B?UjhHcTdDczAxYnBGSUtZcEh3K09zVzhndnVtbUtyVG1qT1Y3RWs4M0pBQmNM?=
 =?utf-8?B?WmtGNHpFUm5ldHlsdk5rdk5WVWNnRGIwM2JLbXhHek5YOW05T0lOMFQ3cUpr?=
 =?utf-8?B?OCtVMkdaU1lkc3k2V3B4YUJDb1R1cmQ3VXJ6ZjlZcE5GdTY1V01HRkl3bm1l?=
 =?utf-8?B?ZUxHMi82L0lUd0JSN0FFTE5KWnB1ZVRwR2d4WEdpZmNpUThQVzRDeVF1Rnhl?=
 =?utf-8?B?Z0hLT3hsWTJ2a1hZMUtjd1V4NitBZzhqR3JpblpTS3FaNWM4R3dEaVVManQ4?=
 =?utf-8?B?T0pjMUNYaDBZQmhZL0hBclY4ZGJHUXVWa1UvSHhnVE1qMHJrdHZrYXhTdUl5?=
 =?utf-8?B?djZzMFRvMHl5YmZDSzg2cm9LWlRyTEcrWDkyR0pOZ2x3RldnRWdxdWZuYmxQ?=
 =?utf-8?B?anZTNlpDOFBBanIwRHNzdGlUTi85V3FBMUNaS3lONitOeW1rNUJYYjdkaDNW?=
 =?utf-8?B?WHVLMVNiRWZLU0FLUHYyUUpadkhWaDQvSFcyTHZWRndueHM2NDhXZFNndlhW?=
 =?utf-8?B?MVBndTdyYlVoVUJKZmJvSklETlBocVBRdDlQaU5qbFZtRVdFSXJVN25oV01T?=
 =?utf-8?B?Z0I4WEU2Y2JiN1BuTTVybzNJUzNRdW9XVGNyc1FoUE4zVXJ2SkxJcVZVR0Nr?=
 =?utf-8?B?TjdUSkw1a2ZGZlkyQWdWVDRXUDRJWHprTG1CWEJoRHRkOTVPZTBHSnJZamNi?=
 =?utf-8?B?YmpkTTRkeGNjbFNSM2J1Wnk1RDRGT3FOSHI3M2l3M050OVpISE1kUW9IeGpU?=
 =?utf-8?B?RU0yRlQ1TGJlbEoyUXM5Y1V2cjNYQ0NxWWZhSFpxSDhDUWlya2JpdllqK1RR?=
 =?utf-8?Q?Yga+xgsWOz7Y1R9w=3D?=
X-Exchange-RoutingPolicyChecked: f+HAIMCw4+Lt8SRiG+u2WXg/WL4NPhxYu7KsFRdqCSCS+1dZZLpW3HfBZ5gUmlTve7SRE/WoxmAJzpTz9fx/b/vBZogIv422rrO6CggpoqbispnpLPCwB/kcY1CqeGwL9w73qRYG8VhBq2+md8mkQqaaZlq37gw1GYOTc4hjJ+O7CQOrbBnTLZjtLVOHkETr0Q5ZV5hv2ec/ZOcXD5itUs6Vm1BDRDPZai+3FRy12RAOhInGr8CG+0+H/BacD71G85tXr5Q/RHMNHIC/TiwtyHySt7vw0LcNJD1heialMXtDtHbP8hpjZe8XxribDlS1gyD9mwF94yt2BFQXHC2vcQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 641b6a6b-e521-47bf-5fce-08df0d1629f1
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 19:28:15.5350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CPMMCC9z0wymWK0IQlbQR0uejy92OBeUfhHzDI2zCDcclHov8bNI12LvEsbYD/r0RPYPu5FtpM5k64QohgIObEX+8OeDcfIRYLMyM969JkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6454
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



On 07-09-2026 21:07, Tejas Upadhyay wrote:
> VRAM page offlining can clear a page-table BO's vmap before VM teardown
> calls xe_pt_clear(). Check for a purged BO under its dma-resv lock before
> writing to the mapping.
> 
> v2(Sashiko):
> - Fix lock ordering
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pt.c | 6 ++++--
>   drivers/gpu/drm/xe/xe_vm.c | 8 +++++---
>   2 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 5d990c1c3740..a9b9cd7ac2c8 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -236,9 +236,11 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
>    */
>   void xe_pt_clear(struct xe_device *xe, struct xe_pt *pt)
>   {
> -	struct iosys_map *map = &pt->bo->vmap;
> +	struct xe_bo *bo = pt->bo;
>   
> -	xe_map_memset(xe, map, 0, 0, SZ_4K);
> +	xe_bo_assert_held(bo);
> +	if (!xe_bo_is_purged(bo))
> +		xe_map_memset(xe, &bo->vmap, 0, 0, SZ_4K);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 9e71567b27cc..e77ff3cf3ca3 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1876,10 +1876,13 @@ static void xe_vm_close(struct xe_vm *vm)
>   	bound = drm_dev_enter(&xe->drm, &idx);
>   
>   	down_write(&vm->lock);
> +	xe_vm_lock(vm, false);
> +
>   	if (xe_vm_in_fault_mode(vm))
>   		xe_svm_notifier_lock(vm);
> -
>   	vm->size = 0;
> +	if (xe_vm_in_fault_mode(vm))
> +		xe_svm_notifier_unlock(vm);
>   
>   	if (!((vm->flags & XE_VM_FLAG_MIGRATION))) {
>   		struct xe_tile *tile;
> @@ -1901,8 +1904,7 @@ static void xe_vm_close(struct xe_vm *vm)
>   		}
>   	}
>   
> -	if (xe_vm_in_fault_mode(vm))
> -		xe_svm_notifier_unlock(vm);
> +	xe_vm_unlock(vm);
>   	up_write(&vm->lock);

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   
>   	if (bound)

