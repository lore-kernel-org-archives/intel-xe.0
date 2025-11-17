Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F72CEACEF
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 22:17:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A483F10E035;
	Mon, 17 Nov 2025 22:17:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IgOuZwOR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E144A10E035
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Nov 2025 22:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763417841; x=1794953841;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=iGuO0tBLBzHVNgc5gZ0isFlh4hVj/+rm+fmJQZ7w8x0=;
 b=IgOuZwOROd91SPp4P1pMyA6oS/X4AMCx9y90IZtAxaXAc/9vUbHhOPEb
 /ZMAL9ndrATneqwbM7XV5FASBJxwaBZvrJ5ZsnzFKgthWANo/w0oL+Roa
 6BZcV2ssCJUyWCiJi1QXNoS/m2w/8E16G94IvsYRNOKFqb9z0DUdGwYhq
 gF8v9/LpTf0vj3qjmTpbeZxSswXv2hjns5NreSb10qV+Icdp6N2VN7oqq
 1QipbPzyGiNsF0BaBMtyGaJPvedB9N0P2PDzY6Ls1nVBUc3zFcPeIwDXL
 zwvBiLPUea97fnuI0NOIK6eaKcU5ii7sqWGDiOMZAZbqY3QO6iN+wBlFI g==;
X-CSE-ConnectionGUID: jTuZfvkCT7KfnI/bHPSzBg==
X-CSE-MsgGUID: QZkryi+QSJybeCb6DBymOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="69280773"
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; d="scan'208";a="69280773"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 14:17:21 -0800
X-CSE-ConnectionGUID: OPYNWGEAT32rpc27jzjm2g==
X-CSE-MsgGUID: VCFLuuROSL+3ZfpTHybb0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; d="scan'208";a="227904912"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 14:17:21 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 14:17:19 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 14:17:19 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.66) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 14:17:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FW1CuFBqaTGf90Ejnp+cUDXk2WaFbV/PH0iBnkKPMu2hgUHS92t3f2azZCr+T1HTn6RgeXEbpyvHLQXM4DXUsTK2wUUigPZfbgC7rzcFKvJhfsinYYM5fw9/IwjRLTlLc5pst8fe1IsUfzGm9xMuUM3Pr02lLOYeSctcyLgjuKFrGxG7Xm6bSGp7aVp38YTNYRvV+LEIp/+xO0lhzxvvOvXYjJibvDwV8Rb88YHIv7rVCa1HOVMrdfm5IrQZivFQZbQL+2wHE1YhhRaSQiOa3c5gvXY+aPyuzqeKaQddIeYH8jdCV/3REFgkUmDhOUFw/mpHATr3B9UPPY6lePurTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0OQ7kBf5tVUCzuMeSaPuF0Tn+ozczlbMEJ9576RYY0=;
 b=AtQai3QS5vxH+DX0Fv08wpQcSO10bEnbRUEQUP4q+/9lsh6yOM1thaWSLRj8kIfTTMXu7C42UVYENMoP94Zjogm3x6WkeMfHar4YDbPYVCorn6F4JmStqOR96ofHyZ6Kf4vJ7GrQ6e8gHLwOb5BZGvCutrHQsqjcUywAnhzxHPx4f7Cu1tND50j+Dy4+MY/gu6H8HTQMO+hZ3QiOwdA6R9cJT0QoP9KzbfH7aR2Gk51CtjTVod3XgTHZd+5+MZycLGUenKqSTUGVK3OZ8G+AuM+Mif378L9lUYfNzNzmpTVaPYDwAbm+DfXtO2TW9YrU0ZYrXOzzSDyN/HsmtjMSIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA3PR11MB8120.namprd11.prod.outlook.com (2603:10b6:806:2f3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 22:17:17 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9320.019; Mon, 17 Nov 2025
 22:17:17 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <176341700179.5989.401932592264605194@intel.com>
References: <20251114214335.2388972-29-matthew.d.roper@intel.com>
 <20251114214335.2388972-30-matthew.d.roper@intel.com>
 <176341700179.5989.401932592264605194@intel.com>
Subject: Re: [PATCH v3 01/27] drm/xe/forcewake: Add scope-based cleanup for
 forcewake
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Mon, 17 Nov 2025 19:17:12 -0300
Message-ID: <176341783257.5989.1699214202363639279@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR13CA0076.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::21) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA3PR11MB8120:EE_
X-MS-Office365-Filtering-Correlation-Id: 8393d52e-6af5-44f4-35d2-08de26271140
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzFJWGJqclpZanhRcFFrRTJIR2FZcElyVGVUNTBualhMV1o2UEpOK052MFJE?=
 =?utf-8?B?c0ZjWURxU3FJbVM2Q1lieitRcExsVGNYMGZ1UFhFNXFxWXdvQW5mTFp0Nk42?=
 =?utf-8?B?WERWSnNiZmdBbjZtNERBdlk3Qy8zZ2IwMWRuUFhURVFQc3dyNmRlRm51VGg1?=
 =?utf-8?B?RVJvUnU4WVExMkhoWFJnSmZ3d1h0aW5IV2JUMTRPdXNRQmRsdE9UT2hWVXdq?=
 =?utf-8?B?eDJ5SVA0ZzBnd0xKTXVXY1BnTytCdFVhN0pMSXl5VGU3WlJLZ1pCeDlPNjA1?=
 =?utf-8?B?cDA4MUFvMHA1SllNZ3BjSEUwRWJBeGp6N1RFanA5V0NIZTJCcGV0K01VUnVj?=
 =?utf-8?B?amVtaGFZY3lIb1lDQU51V1djNXpzUG9KMWlSVDZuOTg3TmdQN1JpaWJnSzhJ?=
 =?utf-8?B?NzVsZi9QZlRSZGxKWUVBUDRpeDVUOTQzYytVTTltNWZrWTBvQTkraFhyZkxt?=
 =?utf-8?B?enBFZGd2NWU1bXFWUEhnblFjbVI4Rkx0TVVNTWE5dFd5MXFncjRyRElURWRW?=
 =?utf-8?B?c3hlak8ycTVnMVA2SGNxR0NOMXprb3dtQ2xCOGp6RXRRdG1KcUpTY09TSjRP?=
 =?utf-8?B?ckJ0Mm5LZCsyYnNVczFLSi9uVzdqM1MzOXdUMFgyNk5jZ0MwRWhrLzZqOWVT?=
 =?utf-8?B?U3pnREZrMDJMUmpRc1lUSUIvejNqdTBuajloaUg2OEpZQWxTR05DeEs2TWJL?=
 =?utf-8?B?V1Z1YkVRNFhzUFRrYzl3S3pCWmNvMUszTTNlUlprQWdTQnhPdFBrVit1WjEr?=
 =?utf-8?B?MW9EWkdLMUp3amMxRlo5ejJ5aDdYUC9TQnY3bmp2bjkxSTQ0amIvTVJyeVZO?=
 =?utf-8?B?RlcrRW1jWGtUTUZmc0loaHdCZG43WXNRZjhRU2l4dS9McjYwMXdTb3RCMWcy?=
 =?utf-8?B?eFlYK21jbE1kelh5QThhTHB5T0JURzYwZmltZUtpNHM2ZHk5b1kxZzFNQkY1?=
 =?utf-8?B?aUR6VUJkQmh6dm9tYy83M09XWnY3WkVrV0JlakRETENWOXdwbEVibkxpTEl5?=
 =?utf-8?B?VDB6R0hEMHdlL2dVSitKTnRTaTY4TVI4UjhRNURJNkh0Tk5EakpIMlBwLzhs?=
 =?utf-8?B?QXlkL0ZHTzByMXI0cGpyYXhZeEJ1cUhDNE5qT2tVUXVhWVpsUndCeG9BQ0xG?=
 =?utf-8?B?UU5NdU5LbVBZNFVkcjZYZEVVUTRWaS9HbmgyNS81ckZ2RXZINVlFQ2FhaWsx?=
 =?utf-8?B?RFZ5Tm4yZ3hZaS85aldWai8zdEtLa3FKR29DNHVsTUJNRXFlZUV3S2h5eFdO?=
 =?utf-8?B?dWRFTXNxR08xWGxoM0RZQi9ZWEZRV0pHbUlmOVJ0Z2wrT3ZLRHlBSGpQTTJH?=
 =?utf-8?B?cU5EQlBIVkQxdTVVbXlDcUZLOTJmVE9WbktqRFFoM0tQOEVLKzRpY0NkTThm?=
 =?utf-8?B?M2xicE8wd055L2tzWUwrM3B1ZmNlOXRpb2ZLdTNnTFhHL29KTVJCM2ZpbFNo?=
 =?utf-8?B?NHVBc2F4QzZkNnM1eVRVaTNoQjhNTXVEcUUvVTlJRDZrNHhKaWJlRVFNMDlT?=
 =?utf-8?B?V2ZzYUd6V1VxdUhaSnpWZlltaXhIVkp6ZVBJNlRvRk5KOXRReDdLbWVTOU9s?=
 =?utf-8?B?VnMwdjhuaGhLam82c2k3aFlxWm5DdnJQeXJYOGxrZVRsNGhySHZGT3g0RGtF?=
 =?utf-8?B?Zkk0ZktJMG9qNlZFSzN0Zmt1eTc1c0poWDlEYno2NmhSYVBsUUxac0FZMFlT?=
 =?utf-8?B?Z0VzV2g0cFdRVHRZQStMSVlzbTNWdVMzazZ1dUoxM2pmM1MwUWovaXdNdkpp?=
 =?utf-8?B?ckhDVjlRcG1YYXdGSmZBMWI5ZHhPdkc1VEZReHJCemlsNkdhYXFwQ2FRYnpn?=
 =?utf-8?B?eWljakVValROUlBLOE1wdTV0ZzZkaGdWVHYxdGtNY2kwYmpVSFVVaW85bG1S?=
 =?utf-8?B?Yy9kbFRrSHZDSkZ2bnFQNmFobzJvQUM2aWJDS3NMQ0Q2VU1PUjdkK2MxWTd0?=
 =?utf-8?Q?0Txwd2aFqh8pY4BKNOcYdn2Xny5GbPzn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTRvUzAwOWhZZmF0YXRObEl2VC8xYU9xcitNRno4T05BcWtLb3pydHBBQXkx?=
 =?utf-8?B?WXJ6anhuMHlSb1RMa3pFWEdMVitETjhKd09qZkV1cEthRi8zZlNUaVdVTjg5?=
 =?utf-8?B?azU1RTZtdjBoeVEybkZkUGI4UlZqR2gyRWg1MWRmdXF0MU56RVZMREpXb0JH?=
 =?utf-8?B?REhSRWVQeWVWamlxUFpmdDIvdEV2eWEyS05HUmdRRWZ1VXFDa0lQT1pLUHY0?=
 =?utf-8?B?UDJ1U01SRHNCa0RWTjlvVE9WTlJ3V05vZG9EYmVCZ3Q5MGRlNjJtQzlLY0tN?=
 =?utf-8?B?bE1vOFIzZVBMZXoxOC9tNmNuMDFJVmYxTzJHTDNsWHFrRDdabWhyaWtUWmNT?=
 =?utf-8?B?SnpzZEoxalhnTytuQkJqQ2Q2OTUwTzNkbUZ2aDFHTW0ybFV6b0VQOTJER0Nn?=
 =?utf-8?B?cXFmMlFHeUNYQ3A2Q1diOWF2clMyaHdFTVR4YXVBNDM5aVZwQ1JjbHQyU2V1?=
 =?utf-8?B?RzF4blUvbDFQYWZ6cS9Qb3dUSmtiY0ZjN29FV2k0ZFZwZGE3OGdIUXN6Nk0r?=
 =?utf-8?B?Z3dldUd2Y0lIOXN0N2hsWm0zQ3lYRjJNeEJMMGtRUitsWjM0MXJpdEh0MUFh?=
 =?utf-8?B?QXBvYlZvbjdwOFlpcXpUNldQaU56M1RxZGo4KzYweVY5ZEhlZkdJbTRYWmV2?=
 =?utf-8?B?SkJxWHNkenN3RVd4eGx4bmJVYzVhSWs2TUlscFp2akRFaVhwbGFwRTZBeWNv?=
 =?utf-8?B?dStSVjNXWFZHQzBwQkxXUzMyWFB1WElZOVRoK1dBVGQ2aERRMFd3NWZjTHBs?=
 =?utf-8?B?aXFnc2dRblc2Z2lDNnU0amtiRTFNL0ZSOXZWeHRGaFVQL3ZtS21EOWd5N0c2?=
 =?utf-8?B?ejlKQmFNazlUNzFiRWtUS25UbU5rMHFiTFRQNGhidHR0L01Qb3kyUHJVNzlX?=
 =?utf-8?B?NTFXaWVaakloK0lRaVVrWGE1Lzh1OGczNzBkaUo3SERQYzdNZ2VueWFSZ0RO?=
 =?utf-8?B?ZjZoRFRIb3NYZHRDU0prK0JCd01ENEhucnN3RFBXOURFM3JUWGd1SGVOaFhI?=
 =?utf-8?B?TUQ1VjdXQW5ZemNMTU9qamU3WWdkWm9yaVB6enFDZm9GdGtCNnV3M1lINnh0?=
 =?utf-8?B?N05qY3NKVnN1Z1VlNHg4T2lkTEwvaURjZWxBYS9xTklRMTc1bDRrdDVTNjBR?=
 =?utf-8?B?YmRpZUdWZlV1SHBObGFidWpUdnNESGpRcXpGdjhwS3pGbWhKeVFWSmRMdkRy?=
 =?utf-8?B?U0RQSDd3YWxnTEFRQ0N4VHVheWxYWWI5K3huQjRhdTZkUlZzM0xYOStSK3RS?=
 =?utf-8?B?L2dnd0QrM05mSnNRTzZxRWFnOFRTVmt3dWN1YWREU0NySGgxUEdzZlNQWnJu?=
 =?utf-8?B?M0I2RjhyRGpPVWhlbXNlWUNnOUQ4cVV4bjE3YUFiYUQ1dlh6YlRBTUlTd2Q3?=
 =?utf-8?B?bUxBaUE2c3lxdnlGd1hRdzJPVjRDR2xiRGtqM1FoRUpwajB0V3dEZjlIUUZl?=
 =?utf-8?B?cHpNTzBXaTBUVTZMZ1poTHRmZkFYMVFiTzhxVUpmQnBScVhqUW03ZWxXU2F1?=
 =?utf-8?B?cGdBOVBuVnowZkZPTERkcFFoN052eDU1YzFIS000bXhnVzhPcGZ5bU93Vmpk?=
 =?utf-8?B?UDJtR21zdHY5dytFK0tJWi9lNEFGQVZBUHUvM0o3OUJITDdYR1BHOEV1R2ww?=
 =?utf-8?B?dG5MN29MVTIxRXdzeGs0Mm9hVG1uREZVYnFrRzBvbVFBSk5CdEJKTjlXaFVQ?=
 =?utf-8?B?K2VkQW12TlYzL283d0RWbmI1dHd3YXl2UmdtNGQrLzNMWit0QWYrdkxYRW10?=
 =?utf-8?B?QzY0QWlCVUdRUlFEL1gwNG5ja1ZwSjd4Q3RzNFNoQUh5eWtCNFh6RVo5SVZa?=
 =?utf-8?B?VFRuMlNuRC85dXU2UXpZd1BJZjJJampKeEZ0b2dQUkVCWXdzaEJsdnF2a2Rm?=
 =?utf-8?B?UU9hRCs3ZXVjNXJHNTVKM2hITVh3cHY5b2lIUnJDMUNlK21DYkMyTStmTE1V?=
 =?utf-8?B?Q01sRG5ucXZ0NEpoUmVNTzIwajJhYVNrNXhNQlNVQW9CVmlnTTd0TWUyeDEy?=
 =?utf-8?B?ZFpuMUZHdkFRVjRiUnJtMDZyTStzZWxKZDViVG4yL05uTXJ2QzRBNUp2Z2pF?=
 =?utf-8?B?QUhqc1A3bmpSSEFtcklmWGVlZysvejJLWThIMEZLSWk4WjFBUUZ6bDZYcmFY?=
 =?utf-8?B?V0dFdHFwczV2aE5XeHBSRDd5RE1NUkE4U1U3elRXOGV1VnVTT1I1d09renJ4?=
 =?utf-8?B?UFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8393d52e-6af5-44f4-35d2-08de26271140
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 22:17:16.9962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dtQNveOzFX/cfYEXsF4c35yDr4qp5YjP5tIWiDbFgUMVxm+FBxOWAQjp+pG1u87CXAORjctlGVoA8NBzutGKcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8120
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

Quoting Gustavo Sousa (2025-11-17 19:03:21-03:00)
>Quoting Matt Roper (2025-11-14 18:43:37-03:00)
>>Since forcewake uses a reference counting get/put model, there are many
>>places where we need to be careful to drop the forcewake reference when
>>bailing out of a function early on an error path.  Add scope-based
>>cleanup options that can be used in place of explicit get/put to help
>>prevent mistakes in this area.
>>
>>Examples:
>>
>>   CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>>
>>       Obtain forcewake on the XE_FW_GT domain and hold it until the
>>       end of the current block.  The wakeref will be dropped
>>       automatically when the current scope is exited by any means
>>       (return, break, reaching the end of the block, etc.).
>>
>>   xe_with_force_wake(fw_ref, gt_to_fw(ss->gt), XE_FORCEWAKE_ALL) {
>>        ...
>>   }
>>
>>       Hold all forcewake domains for the following block.  As with the
>>       CLASS usage, forcewake will be dropped automatically when the
>>       block is exited by any means.
>>
>>Use of these cleanup helpers should allow us to remove some ugly
>>goto-based error handling and help avoid mistakes in functions with lots
>>of early error exits.
>>
>>An 'xe_force_wake_release_only' class is also added for cases where a
>>forcewake reference is passed in from another function and the current
>>function is responsible for releasing it in every flow and error path.
>>
>>v2:
>> - Create a separate constructor that just wraps xe_force_wake_get for
>>   use in the class.  This eliminates the need to update the signature
>>   of xe_force_wake_get().  (Michal)
>>
>>v3:
>> - Wrap xe_with_force_wake's 'done' marker in __UNIQUE_ID.  (Gustavo)
>> - Add a note to xe_force_wake_get()'s kerneldoc explaining that
>>   scope-based cleanup is preferred when possible.  (Gustavo)
>> - Add an xe_force_wake_release_only class.  (Gustavo)
>>
>>Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>
>Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
>
>>---
>> drivers/gpu/drm/xe/xe_force_wake.c |  7 ++++++
>> drivers/gpu/drm/xe/xe_force_wake.h | 40 ++++++++++++++++++++++++++++++
>> 2 files changed, 47 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_f=
orce_wake.c
>>index c59a9b330697..76e054f314ee 100644
>>--- a/drivers/gpu/drm/xe/xe_force_wake.c
>>+++ b/drivers/gpu/drm/xe/xe_force_wake.c
>>@@ -166,6 +166,13 @@ static int domain_sleep_wait(struct xe_gt *gt,
>>  * xe_force_wake_ref_has_domain() function. Caller must call
>>  * xe_force_wake_put() function to decrease incremented refcounts.
>>  *
>>+ * When possible, scope-based forcewake (through CLASS(xe_force_wake, ..=
.) or
>>+ * xe_with_force_wake()) should be used instead of direct calls to this
>>+ * function.  Direct usage of get/put should only be used when the funct=
ion
>>+ * has goto-based flows that can interfere with scope-based cleanup, or =
when
>>+ * the lifetime of the forcewake reference does not match a specific sco=
pe
>>+ * (e.g., forcewake obtained in one function and released in a different=
 one).
>>+ *
>>  * Return: opaque reference to woken domains or zero if none of requeste=
d
>>  * domains were awake.
>>  */
>>diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_f=
orce_wake.h
>>index 0e3e84bfa51c..ffc4e103fe31 100644
>>--- a/drivers/gpu/drm/xe/xe_force_wake.h
>>+++ b/drivers/gpu/drm/xe/xe_force_wake.h
>>@@ -61,4 +61,44 @@ xe_force_wake_ref_has_domain(unsigned int fw_ref, enum=
 xe_force_wake_domains dom
>>         return fw_ref & domain;
>> }
>>=20
>>+struct xe_force_wake_ref {
>>+        struct xe_force_wake *fw;
>>+        unsigned int domains;
>>+};
>>+
>>+static struct xe_force_wake_ref
>>+xe_force_wake_constructor(struct xe_force_wake *fw, unsigned int domains=
)
>>+{
>>+        struct xe_force_wake_ref fw_ref =3D { .fw =3D fw };
>>+
>>+        fw_ref.domains =3D xe_force_wake_get(fw, domains);
>>+
>>+        return fw_ref;
>>+}
>>+
>>+DEFINE_CLASS(xe_force_wake, struct xe_force_wake_ref,
>>+             xe_force_wake_put(_T.fw, _T.domains),
>>+             xe_force_wake_constructor(fw, domains),
>>+             struct xe_force_wake *fw, unsigned int domains);
>>+
>>+/*
>>+ * Scoped helper for the forcewake class, using the same trick as scoped=
_guard()
>>+ * to bind the lifetime to the next statement/block.
>>+ */
>>+#define __xe_with_force_wake(ref, fw, domains, done) \
>>+        for (CLASS(xe_force_wake, ref)(fw, domains), *(done) =3D NULL; \
>>+             !(done); (done) =3D (void *)1)
>>+
>>+#define xe_with_force_wake(ref, fw, domains) \
>>+        __xe_with_force_wake(ref, fw, domains, __UNIQUE_ID(done))
>>+
>>+/*
>>+ * Used when xe_force_wake_constructor() has already been called by anot=
her
>>+ * function and the current function is responsible for releasing the fo=
rcewake
>>+ * reference in all possible cases and error paths.
>>+ */
>>+DEFINE_CLASS(xe_force_wake_release_only, struct xe_force_wake_ref,
>>+             xe_force_wake_put(_T.fw, _T.domains), fw_ref,

Hm... Should we have a NULL check on _T.fw here?

--
Gustavo Sousa

>>+             struct xe_force_wake_ref fw_ref);
>>+
>> #endif
>>--=20
>>2.51.1
>>
