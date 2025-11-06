Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4CDCCFA03
	for <intel-xe@archiver.kernel.org>; Thu,  6 Nov 2025 09:58:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9C210E86D;
	Thu,  6 Nov 2025 09:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="blVLWp4K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0407610E86D
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Nov 2025 09:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762423117; x=1793959117;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VHwIUb7PvjeZOQNpnRUGb9JqY2if/sWv7gZgFB2t2xA=;
 b=blVLWp4Kc4XD6R2aw+9R4yDjemPMDMtpzGwkyT/qufBbBIenn3tFuJ9C
 Rq5b0hBlXLC6zyEGFuL52SrMdFy+6SSS5O5n+M9ibIUUF8LPfCNXKhbjn
 p6RP1HsPM+er0KS7n0xik3isqhJvFlGFeGGTsw+hpOm+KaXQrLmkBFztS
 Pj4PzfCtK5VDvRXOpmrfFWWIXXn93mKdY3rMYQ6xCkuMrArnpEkVnNOt0
 Szso04GiXTACzuMQmfYdSSafW6TYtZvc8PULQLwUDG+HdP5XLICd7NltG
 f5mMwzhFC8bSLSy6howwXjg7dD3bbP4aPxwkmoMXNOalegvZiU7anehLQ w==;
X-CSE-ConnectionGUID: PM5VmTmQQLe7mTzJ0yIJQA==
X-CSE-MsgGUID: nGHOaVlvRmCrlP8NXQZR+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64651587"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="64651587"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 01:58:37 -0800
X-CSE-ConnectionGUID: skc2OmBrRwGP47FxZbjgew==
X-CSE-MsgGUID: YHHSQI65TSqNN41LJqGqCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="218476543"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 01:58:36 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 01:58:36 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 01:58:36 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.70) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 01:58:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xxUHwlwYDjVAR2TTvdgoD+WaM4/Fwzhv0pbF+PhPUtyaSmr0Csea/qYInhKey1LCvSmvY8bWV4jiB580jKSS7GD7L43NbozOFL1rhinVOCJ69zkiBfmO4uKqWrRYGxFu9MAc7VFf3DS4sb5wtu0TVxuBsYNBASgxEFlyPt+eLB5k65hEkepTgPUOV6+ob62WB218pSWAx5SheyaJGjCPF0b9mEwmAMisYtVGUEgUHEm6yklweSZ0+bNfTYclAk687AvIF0/LksC0GF7O7TgWi4uhB4U7CjZDXjGCSXbTKtxvz0cQRk1y/8K/rJKYesFzp0iN3MwarM9muAyfHaKv0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kCs1TmYggJ7gYUjtWt/BOgsUbCszk54+etW4qdUTJ8s=;
 b=NvC+RKdGm4DOwU/ZesmT+Ra0aM5PNEPs3Titv/Br3FVzFwpJ0r/qPTOt2kClQz8G9lxEojJ0o3aUESnb5XLgGcuU7OFx0GH72OS4OlkzXd1tn8vArZqpO7wE+IkAuXpyguAZOClJoQgjy+gbVBBRya3arwNsE1n7tK2WkTcO0HHpAPV+G0ytFH3sJophD/ilQcNHbQLdouJPcE0lMaXRYVh/ssxiVjsO04zr7Wt41CrdUsMrdc8sJJh+KzELGJcalbZa8x93VAhZevJBK/ezoxW2QapiO0lEsIIbHEbN1OKuITjLMl2KdUNkmxJkQbGaK4nCF0oEN3x0GYuLOdnmkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6096.namprd11.prod.outlook.com (2603:10b6:8:af::16) by
 DS0PR11MB7802.namprd11.prod.outlook.com (2603:10b6:8:de::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.12; Thu, 6 Nov 2025 09:58:30 +0000
Received: from DM4PR11MB6096.namprd11.prod.outlook.com
 ([fe80::f3b4:61a8:7022:df18]) by DM4PR11MB6096.namprd11.prod.outlook.com
 ([fe80::f3b4:61a8:7022:df18%7]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 09:58:30 +0000
Message-ID: <c0c3f6f5-7a54-4cb6-92a1-0720bb317523@intel.com>
Date: Thu, 6 Nov 2025 15:28:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/9] drm/xe/madvise: Implement purgeable buffer object
 support
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>
References: <20251028122415.1136721-1-arvind.yadav@intel.com>
 <20251028122415.1136721-4-arvind.yadav@intel.com>
 <f976fdad404f4e8704ad2974dfed06f80ba31e6e.camel@linux.intel.com>
 <93be3dde56c24ce83c28a2dfe3bffeaf9a47b25d.camel@linux.intel.com>
 <59ccc1f9-efb6-4584-93ca-7114a644a851@intel.com>
 <29fdde6904e00bcaaefc9148c97d7cdd833c5bbc.camel@linux.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <29fdde6904e00bcaaefc9148c97d7cdd833c5bbc.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0172.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::16) To DM4PR11MB6096.namprd11.prod.outlook.com
 (2603:10b6:8:af::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6096:EE_|DS0PR11MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: 74bc48af-3131-4292-56ac-08de1d1b09a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zjh2cERBWmZ5WW1JU24xTDhOL3BCcWVrSlovc1ltVkxCcjRTV0FEcEt2N0tG?=
 =?utf-8?B?MGd3THI5NGJ0NWg4QlBRMmRjRUJoZXp2bEJjbE0wSlRvYk02NjVKTUhETFcv?=
 =?utf-8?B?M0tnN2ZuQlg3R1VxV3RxMUJmdkZFVkVyRXRMNHdVZURteHh1UWEyWWpTL2Mx?=
 =?utf-8?B?RXVHa2dGQW1adDdBcFhnMUk2SGRScnVsYnBUbUhxc200SU9RTHJ4ZWZ3NmJY?=
 =?utf-8?B?OEV2VW56SVlzazJDR3JKL3ZMT05EL2xmZDROc2pXOEFUQmdXL0NveVZaWGZ3?=
 =?utf-8?B?REc1YStXaXR3S3ZwdVVzTVJMTmhyc1J1akUvRzBNcVcxb2ZxUGtwWVVzTXFI?=
 =?utf-8?B?cVNZeFZqcUF5VTJFRnRCNC9QVFdTeWZLN0xNaG9pa2dzbFMweVpKY1JUOFhJ?=
 =?utf-8?B?VDhPVElOTC9tU210K0QrN0RJbTVYMnMvWDF4di9OOHljU2tSaUJ5VTV1cTho?=
 =?utf-8?B?TmJ0b2NodVBYSEVSNnZ5Mjh3dDVSUU1YUC9VRTB2UWpjWE1XVWF4cXJxU0FV?=
 =?utf-8?B?MXVYZHh2ZGIvOUFMbkp1L2UwbStNV0Z6cjJYV2dUZDVIRER0Rk5uYmN2a2ZN?=
 =?utf-8?B?L2dnMXVlc2ZzMWVGeCtscTJrQkUrWVN2S0JsYzh6dkxtRExhbWpBZlFuSFl4?=
 =?utf-8?B?TWJMaVB2eFBNUlJ3TjFnTjVkcDRhdHllZ3JGVE9vWVlIdnc1aTIzR2VlZmF6?=
 =?utf-8?B?bTg1U1BIcHBHTUpmMEdtN0ptdDlBLzRaVjJXZmN5dWdzQjJJUUJQVEF5LzQz?=
 =?utf-8?B?dklKWkNmOWFqUDRJN1djSXZzNTFTSzhiZktpR01xYkQ0WUsrSlNaZTAzdjI0?=
 =?utf-8?B?WkczNFBobGJEZ25adnZlczY2REUrRm9LWGhhTWFlL2ZQTmppUHUzNWFTb1pL?=
 =?utf-8?B?ZG5VRFhDRW5DNEVtTWdDWnpYeklkYldNVDNoWG5kYnZUd3J2dXJZZlNFeTdt?=
 =?utf-8?B?Y3pxbjE4akF6OU5yMUVRT3RQc0xxb0E1Q3k3dnFCM3dPaXQveVE1N0hua2Rr?=
 =?utf-8?B?WEIxaWUxbG91dkprQkdQZXRFQytUNEFZY1ZEcDIrR3MxNTdOSStNN3FETjZ3?=
 =?utf-8?B?YkwzSzlqTDlpQTc2UFU0RDluVXFlQVVKenlONXlkelphRjY2T0JvSUFzN1Vj?=
 =?utf-8?B?bFllMTRDOFNTRkJWZkgzb3M5RDdPTDZyekphdXZhRm5zZThqd1FaVjluSDVh?=
 =?utf-8?B?VFcyOVdqMFZ2V25jeVUzMFBrVUZUZ2JUdmNEY3dITFVzNWlFeEp1ODBkU0k2?=
 =?utf-8?B?UGJueUlHWXlTaTd0QXkvanlsZVQ3N3I2aS9YNUc1Wkg0aEdFbVlUa0k2MkNP?=
 =?utf-8?B?bitWaVFhaUUxSXJlQW1vV0c1aXY5Mlo1WlhENHRsbXhQbHZTSWk1ZVlzWlZi?=
 =?utf-8?B?WjFmVEdac2NmZlBzQUc0K1FTMnRjTzNZWis4WEd1VlVQS1lOMEFVL1BtWWFk?=
 =?utf-8?B?VkZiazhEMnYvdzUwakxmWnZXL3AzZmNhTTZVcnYwenhIUmsvZ1h2c3ZJVFVp?=
 =?utf-8?B?UWtscFNlWTJrdE9vdVRyd3Vjd3BEMW4zcENBNkJqYWxkeUtFZmVrbmlEamtM?=
 =?utf-8?B?ZlN1SnFuVDRURzIwbzcrLy83dERlaUhnbHgxNkVKTElVczUwdkltWHA1L2ZU?=
 =?utf-8?B?VGFZWlY1QUtPTlF3VTkwZE8vWjlSc3gzWHBMSlJTcVp1alVEMUxzdjVpR2FK?=
 =?utf-8?B?UncxNDQ2cllNd3g4WHYyOEdVYmM4YU5jQVhLZ3lOWGhwak9UMUxzS0tOREdU?=
 =?utf-8?B?a3N1VWZzZmJ5TFZGWnI2TGRTcVN6YXFQSUxtbVBXSG1RQUxKcitoMXNGR0px?=
 =?utf-8?B?ZDF0NHIxbTgwcURuZytNS3JSRUw3anRMZzdpeTgwUThSdDYwUTFNNkV2YWlq?=
 =?utf-8?B?VzlJUEJOWlhUVXVTUGZLUkJpSitzQ3RTL29qYkhPS2Z6b3NMS1JUcENFaFQr?=
 =?utf-8?Q?bh9Wq8md8DHId+9zoqDRFLyN6dVBA07U?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6096.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUpUSVNZNmV3Rm83ZVNuVlE4cGdYT3ZTTE8zSVlzTkkxRVpDcDNZN0NxTHgx?=
 =?utf-8?B?aHJQR1JoMFJCaFlQR2hRNkpBOEZUMnJNcDJhcEVtdFFQQzFqb0lqVkt0bmtL?=
 =?utf-8?B?WUlaeWRHSXVQZ2NHNWNnQTlQNmc1cGRidFJRYkNyUmg2MGllRml6Vnl6WS92?=
 =?utf-8?B?NVVmV2MrZjlOVFhaWVVaeHk1M08zZEo0Z28rT0xZZGtucFZESVFIZGpDZ2Fl?=
 =?utf-8?B?QUVzOEN0UDZZTXQyVTd3Wm56TVRRSzVINnIwSWpISHlVdjhMVS80TVcvSU5D?=
 =?utf-8?B?WDhYNXBSLysxb1FPR0xwWGtRaHhHMHlHTDR3RzNHWlphYStRNmRERzBIYjZZ?=
 =?utf-8?B?SUJiakZUbXZrOVlKUE0vaTNzSUJvekpXMFEraGN6c3FkdjYrU2dkUi9BNEIv?=
 =?utf-8?B?S1hQYU5SRUZoTUcvUHkrZDNNL0J0NFBOTkN2NmY1Q05TbXd3ZlVkOVJ4MEox?=
 =?utf-8?B?UkxUWVBycVArMzFha3RCeG4zQjQyVzlpRGNzMk1tMHNheUFpdHZyOURQZUpS?=
 =?utf-8?B?RnJ6U1ZQaGJobmUxWXhHOXluRGFFMTFDRXlPNU55NFBnRmV3VHNhMmg0bVlO?=
 =?utf-8?B?Tm1uaEg0K2Y2eWJwcG1lV0w2ZXJaY0hwU1FuZlVZNnovN0NFazZ6TGkyN1ZV?=
 =?utf-8?B?NVhoQ0liMWFjc0N0YkM2OTM3LzhCVmpyZHk4RGd3ZFN3S3NyUTE4dVh2QjU3?=
 =?utf-8?B?MDFCdnlOd3RHZE50K0FXVGFqcFRXNHlyT2l0THE5RGdCRnppTGJsa1BaM1Q5?=
 =?utf-8?B?aEtDUDZlNDRFbDY0bmE5cmtLcFdncm9TREJwejdpclZQeG9uZFhEampaay8z?=
 =?utf-8?B?aFdvcUlTRUZnZENsdEdpS0w4UjlFUzV6NzJVMVVUTVVqeVBGMjNBS0xRS1Rq?=
 =?utf-8?B?eUZLbTBQendaOENWZmRkTUVCNjFmUWdXTmpva0YrWWZIajUrd3VVOFhDdmlS?=
 =?utf-8?B?bUNHa1pseFNEaEc0ZkN3TzVHOTViN3ZxSXRYTGwyS1dqU2dCWFNhU0VCZzZZ?=
 =?utf-8?B?aXRXeGhoeUp6QTZyTDdZZVk3czZTbENLYkREQVNhZjZrK1V6WktBOWFPZDY2?=
 =?utf-8?B?Wnltc1JCL0FzaXQ2UE9GeDNaQmcySHVZZjZvYmFrK2x6R2RuY2ZkT2NFM2dQ?=
 =?utf-8?B?a045TDF6UDZrRzRHMFkva2lQQXBRYTJZVGFKMFUzNDBSNGl2dlY4MUd1QTgy?=
 =?utf-8?B?V3E3RzA2eFZUQ2lkSS8vYTRkSkpFUkk0MkpDV3FXZm92bkxFWkZ5NFlRYllS?=
 =?utf-8?B?TWtFZTBMZVV4c2JwR0tzRml5S1prMTc2cFViclA4RXVzYUlUT1AwRmVKRzBT?=
 =?utf-8?B?NHpyMTZhWkNETlo0Z2d1SnRmZlUvVVB2bzZvRTFmbVo2Tnh0aW9NcVFKSFhl?=
 =?utf-8?B?aS9lcWZzRE1pT3lWQ3ltV2QzQm5VOU5tbm53MTVKeW1pUVFPYURYTnZ2a0xC?=
 =?utf-8?B?TkcxRGpSOEhrek8ramo0Z2JHL29tbXRiZTBIbFZlL3NQWktNaDNQRUo1R3Y4?=
 =?utf-8?B?VEVUcm1CcXpxWHRDa1E1YVZ4cHgyTUVqTW5TWmlSRDZyZHg3VVZwdDBoL3JL?=
 =?utf-8?B?cnZhZXVoKy9veTI5ZGJSVVZqWnVnZUROVW9lczFKY05qTzVJWFBHOU4xVnpp?=
 =?utf-8?B?aTRkdjBNSGpDRlRRMEZUODQ4bnFVUUVlUXF5N3RZUkxYMStmaGxYa1NXWTBI?=
 =?utf-8?B?N0VHVmdERDJuY2s2alc0cFpqKzJrQW1MZERKN2pkZmRMWjNlemRWSDZmZ0hG?=
 =?utf-8?B?K3hsRk5wa3k3MmdYWUMxMWpCN2Q0S3dRK0JubTRzcU51R3cxdnp2NFlRYThP?=
 =?utf-8?B?NE91VVp2R25BVzRNaUpWd0lBNVYrenJpU1NDS0tzYUxQTU11MEM5cVB4Yyti?=
 =?utf-8?B?QlNGZWhLYStmem1lMXh3aE5GY09LMUxIZmdUbnN6VzBrV1pyK1JvK0N3Yk9F?=
 =?utf-8?B?R2dHVTdYMW01VkMyT0VpU1FzSi9MMk5scGRvdGRQQzRXUGw1SWtwUS9iVXN3?=
 =?utf-8?B?bzFEdVp1aWRDUjcwRGtIK2lwTUkwYkJDUzFTbUhhenJWTnFQdzVEUDA0NVdC?=
 =?utf-8?B?ZE9kY2N6b1FUSXBXOUl5dkdudzhkVUx1NkVOK0lxakw0VzFFTStMZmJKdFJn?=
 =?utf-8?Q?nEkhEWIfdp+BQp5+KWY+Zx+oR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74bc48af-3131-4292-56ac-08de1d1b09a0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6096.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 09:58:30.0053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lbRL46jxUSjySPF1f8YvZVGL4e8Yft4P8dXoF90PfQSiOnkETVqblAv07CZtdN2H/3hODeZgMLc1pQYKyJ9RIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7802
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


On 30-10-2025 13:47, Thomas Hellström wrote:
> On Thu, 2025-10-30 at 12:33 +0530, Yadav, Arvind wrote:
>> On 29-10-2025 16:21, Thomas Hellström wrote:
>>> On Wed, 2025-10-29 at 09:55 +0100, Thomas Hellström wrote:
>>>> On Tue, 2025-10-28 at 17:54 +0530, Arvind Yadav wrote:
>>>>> This allows userspace applications to provide memory usage
>>>>> hints to
>>>>> the kernel for better memory management under pressure:
>>>>>
>>>>> - WILLNEED: BO will be needed again, re-validate if purged
>>>>> - DONTNEED: BO not currently needed, may be purged if needed
>>>>>
>>>>> When userspace marks BO as DONTNEED, the kernel can reclaim
>>>>> their memory during memory pressure. BO transition to PURGED
>>>>> state when reclaimed, and attempting to access purged buffers
>>>>> triggers appropriate fault handling.
>>>>>
>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/xe_bo.c         | 75
>>>>> +++++++++++++++++++++++++-
>>>>> --
>>>>> --
>>>>>    drivers/gpu/drm/xe/xe_vm_madvise.c | 67
>>>>> ++++++++++++++++++++++++++
>>>>>    2 files changed, 130 insertions(+), 12 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c
>>>>> b/drivers/gpu/drm/xe/xe_bo.c
>>>>> index cbc3ee157218..3b3eb83658cc 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>>>> @@ -836,6 +836,60 @@ static int xe_bo_move_notify(struct xe_bo
>>>>> *bo,
>>>>>    	return 0;
>>>>>    }
>>>>>    
>>>>> +static int xe_bo_invalidate_tlb_before_purge(struct xe_bo *bo)
>>>> In the future someone might want to reuse this function for
>>>> invalidating somewhere else. Could we perhaps rename to
>>>> xe_bo_invalidate_vmas() or something like that?
>> Noted.
>>>>
>>>>> +{
>>>>> +	struct drm_gpuvm_bo *vm_bo;
>>>>> +	struct drm_gpuva *gpuva;
>>>>> +	struct drm_gem_object *obj = &bo->ttm.base;
>>>>> +	int ret;
>>>>> +
>>>>> +	/* BO must be locked before invalidating */
>>>>> +	dma_resv_assert_held(bo->ttm.base.resv);
>>>>> +
>>>>> +	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
>>>>> +		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
>>>>> +			struct xe_vma *vma =
>>>>> gpuva_to_vma(gpuva);
>>>>> +
>>>>> +			ret = xe_vm_invalidate_vma(vma);
>>>>> +			if (ret)
>>>>> +				return ret;
>>>>> +		}
>>>>> +	}
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>> +static void xe_bo_set_purged(struct xe_bo *bo)
>>>>> +{
>>>>> +	/* BO must be locked before modifying madv state */
>>>>> +	dma_resv_assert_held(bo->ttm.base.resv);
>>>>> +
>>>>> +	atomic_set(&bo->madv_purgeable,
>>>>> XE_MADV_PURGEABLE_PURGED);
>>>>> +}
>>>>> +
>>>>> +static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo,
>>>>> struct
>>>>> ttm_operation_ctx *ctx)
>>>>> +{
>>>>> +	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
>>>>> +	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
>>>>> +
>>>>> +	if (ttm_bo->ttm) {
>>>>> +		struct ttm_placement place = {};
>>>>> +		int ret = ttm_bo_validate(ttm_bo, &place,
>>>>> ctx);
>>>>> +		int ret_inval;
>>>> Christian from AMD once mentioned that instead of implicitly
>>>> calling
>>>> ttm_bo_validate() with an empty placement, we could send the null
>>>> placement through the evict_flags callback. Would that work?
>>>>
>>>>
>>> Actually it doesn't since we don't get to call move_notify.
>> Agreed,
>>>>> +
>>>>> +		drm_WARN_ON(&xe->drm, ret);
>>>>> +		if (!ret && bo) {
>>>>> +			if (atomic_read(&bo->madv_purgeable)
>>>>> ==
>>>>> XE_MADV_PURGEABLE_DONTNEED) {
>>>>> +				/* Invalidate TLB before
>>>>> marking
>>>>> BO
>>>>> as purged */
>>>>> +				ret_inval =
>>>>> xe_bo_invalidate_tlb_before_purge(bo);
>>>> Since the page-table update and page-freeing is really intended
>>>> to be
>>>> an asynchronous operation, and the GPU bindings are intended to
>>>> be
>>>> invalidated in move_notify() / trigger_rebind() where we properly
>>>> take
>>>> care of special cases like faulting VMs etc, can we move the
>>>> invalidation logic there?
>>>>
>>>> Perhaps it is even possible to skip the synchronous page-table
>>>> zeroing
>>>> here in favour of a NULL rebind (when rebinding a purged BO we
>>>> set up
>>>> all zero mappings, or whatever mappings are required given
>>>> scratch
>>>> page
>>>> mode etc.) Then the page-table clearing will be properly inserted
>>>> in
>>>> the asynchronous execution.
>>>>
>> My understanding is that you are suggesting two main changes:
>>
>> 1. Asynchronous Invalidation: I should remove the synchronous
>> xe_bo_invalidate_tlb_before_purge() call. Instead, I should rely on
>> the
>> existing asynchronous invalidation path that is already triggered
>> during
>> eviction via xe_bo_move_notify() -> xe_bo_trigger_rebind(). This will
>> handle the TLB invalidation correctly and more efficiently.
>>
>> 2. NULL Rebind on Access(for VM Faulting Mode is ENABLED): When a GPU
>> operation tries to bind a buffer that is in the PURGED state, the
>> driver
>> should not error. Instead, it should perform a "NULL rebind" by
>> mapping
>> the buffer's VMA to a scratch page. This ensures the GPU reads safe,
>> zeroed data instead of accessing invalid memory.
> Yes. We want scratch PTEs if the VM is scratch-page-enabled, and the
> "clear_pt" mode otherwise.


With the current approach, we invoke xe_vm_invalidate_vma, which 
internally calls xe_pt_zap_ptes to clear the page tables.
For handling the "NULL rebind" scenario, we can utilize 
__xe_pt_empty_pte, which effectively writes either scratch or zero PTEs 
based on the VM configuration.
I'm considering routing this through the vm-ops pipeline, as all page 
table modifications are expected to go through this path 
(vm_bind_ioctl_ops_* → xe_pt_update_ops_*). Specifically,
we can issue an UNMAP operation for all GPUVAs of the BO in the VM. This 
will trigger xe_migrate_clear_pgtable_callback, which is designed to 
handle page table clearing.

>
>> The BO would only be re-allocated and re-bound when userspace
>> explicitly
>> Call WILLNEED.
>> I’ll now look into implementing the NULL rebind logic within the VMA
>> mapping path and will follow up with an updated patch.
> IMO we should try to mimic the i915 behaviour here, since it's already
> implemented in mesa: That is, if we call WILLNEED on an already purged
> bo, we return an error.

Noted.

~Arvind

> /Thomas
>> ~Arvind
>>>>> +				if (!ret_inval)
>>>>> +					xe_bo_set_purged(bo);
>>>>> +
>>>>> +			}
>>>>> +		}
>>>>
>>>>> +	}
>>>>> +}
>>>>> +
>>>>>    static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool
>>>>> evict,
>>>>>    		      struct ttm_operation_ctx *ctx,
>>>>>    		      struct ttm_resource *new_mem,
>>>>> @@ -853,8 +907,14 @@ static int xe_bo_move(struct
>>>>> ttm_buffer_object
>>>>> *ttm_bo, bool evict,
>>>>>    	bool needs_clear;
>>>>>    	bool handle_system_ccs = (!IS_DGFX(xe) &&
>>>>> xe_bo_needs_ccs_pages(bo) &&
>>>>>    				  ttm &&
>>>>> ttm_tt_is_populated(ttm))
>>>>> ?
>>>>> true : false;
>>>>> +	int state = atomic_read(&bo->madv_purgeable);
>>>>>    	int ret = 0;
>>>>>    
>>>>> +	if (evict && state == XE_MADV_PURGEABLE_DONTNEED) {
>>>>> +		xe_ttm_bo_purge(ttm_bo, ctx);
>>>>> +			return 0;
>>>>> +	}
>>>>> +
>>>>>    	/* Bo creation path, moving to system or TT. */
>>>>>    	if ((!old_mem && ttm) && !handle_system_ccs) {
>>>>>    		if (new_mem->mem_type == XE_PL_TT)
>>>>> @@ -1606,18 +1666,6 @@ static void
>>>>> xe_ttm_bo_delete_mem_notify(struct
>>>>> ttm_buffer_object *ttm_bo)
>>>>>    	}
>>>>>    }
>>>>>    
>>>>> -static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo,
>>>>> struct
>>>>> ttm_operation_ctx *ctx)
>>>>> -{
>>>>> -	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
>>>>> -
>>>>> -	if (ttm_bo->ttm) {
>>>>> -		struct ttm_placement place = {};
>>>>> -		int ret = ttm_bo_validate(ttm_bo, &place,
>>>>> ctx);
>>>>> -
>>>>> -		drm_WARN_ON(&xe->drm, ret);
>>>>> -	}
>>>>> -}
>>>>> -
>>>>>    static void xe_ttm_bo_swap_notify(struct ttm_buffer_object
>>>>> *ttm_bo)
>>>>>    {
>>>>>    	struct ttm_operation_ctx ctx = {
>>>>> @@ -2472,6 +2520,9 @@ struct xe_bo *xe_bo_create_user(struct
>>>>> xe_device *xe,
>>>>>    				       ttm_bo_type_device,
>>>>> flags,
>>>>> 0,
>>>>> true);
>>>>>    	}
>>>>>    
>>>>> +	/* Initialize purge advisory state */
>>>>> +	atomic_set(&bo->madv_purgeable,
>>>>> XE_MADV_PURGEABLE_WILLNEED);
>>>>> +
>>>>>    	return bo;
>>>>>    }
>>>>>    
>>>>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
>>>>> b/drivers/gpu/drm/xe/xe_vm_madvise.c
>>>>> index cad3cf627c3f..1f0356ea4403 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>>>>> @@ -158,6 +158,54 @@ static void madvise_pat_index(struct
>>>>> xe_device
>>>>> *xe, struct xe_vm *vm,
>>>>>    	}
>>>>>    }
>>>>>    
>>>>> +/*
>>>>> + * Handle purgeable buffer object advice for
>>>>> DONTNEED/WILLNEED/PURGED.
>>>>> + * Returns 0 on success, negative errno on error.
>>>>> + */
>>>>> +static void xe_vm_madvise_purgeable_bo(struct xe_device *xe,
>>>>> struct
>>>>> xe_vm *vm,
>>>>> +				       struct xe_vma **vmas,
>>>>> int
>>>>> num_vmas,
>>>>> +				       struct drm_xe_madvise
>>>>> *op,
>>>>> struct drm_exec *exec)
>>>>> +{
>>>>> +
>>>>> +	xe_assert(vm->xe, op->type ==
>>>>> DRM_XE_VMA_ATTR_PURGEABLE_STATE);
>>>>> +
>>>>> +	for (int i = 0; i < num_vmas; i++) {
>>>>> +		struct xe_bo *bo = xe_vma_bo(vmas[i]);
>>>>> +		int state;
>>>>> +		int ret;
>>>>> +
>>>>> +		if (!bo)
>>>>> +			continue;
>>>>> +
>>>>> +		/* BO must be locked before modifying madv
>>>>> state
>>>>> */
>>>>> +		dma_resv_assert_held(bo->ttm.base.resv);
>>>>> +
>>>>> +		switch (op->purge_state_val.val) {
>>>>> +		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
>>>>> +			state = atomic_read(&bo-
>>>>>> madv_purgeable);
>>>>> +			if (state == XE_MADV_PURGEABLE_PURGED)
>>>>> {
>>>>> +				ret = xe_bo_validate(bo, NULL,
>>>>> true,
>>>>> exec);
>>>>> +				if (ret) {
>>>>> +					drm_err(&vm->xe->drm,
>>>>> +						"Failed to
>>>>> validate
>>>>> purged BO: %d\n", ret);
>>>>> +					return;
>>>>> +				}
>>>>> +			}
>>>>> +			atomic_set(&bo->madv_purgeable,
>>>>> XE_MADV_PURGEABLE_WILLNEED);
>>>>> +			break;
>>>>> +		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
>>>>> +			state = atomic_read(&bo-
>>>>>> madv_purgeable);
>>>>> +			if (state != XE_MADV_PURGEABLE_PURGED)
>>>>> +				atomic_set(&bo-
>>>>>> madv_purgeable,
>>>>> XE_MADV_PURGEABLE_DONTNEED);
>>>>> +			break;
>>>>> +		default:
>>>>> +			drm_warn(&vm->xe->drm, "Invalid
>>>>> madvice
>>>>> value = %d\n",
>>>>> +				 op->purge_state_val.val);
>>>>> +			return;
>>>>> +		}
>>>>> +	}
>>>>> +}
>>>>> +
>>>>>    typedef void (*madvise_func)(struct xe_device *xe, struct
>>>>> xe_vm
>>>>> *vm,
>>>>>    			     struct xe_vma **vmas, int
>>>>> num_vmas,
>>>>>    			     struct drm_xe_madvise *op);
>>>>> @@ -283,6 +331,19 @@ static bool madvise_args_are_sane(struct
>>>>> xe_device *xe, const struct drm_xe_madv
>>>>>    			return false;
>>>>>    		break;
>>>>>    	}
>>>>> +	case DRM_XE_VMA_ATTR_PURGEABLE_STATE:
>>>>> +	{
>>>>> +		u32 val = args->purge_state_val.val;
>>>>> +
>>>>> +		if (XE_IOCTL_DBG(xe, !((val ==
>>>>> DRM_XE_VMA_PURGEABLE_STATE_WILLNEED) ||
>>>>> +				       (val ==
>>>>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED))))
>>>>> +			return false;
>>>>> +
>>>>> +		if (XE_IOCTL_DBG(xe, args-
>>>>>> purge_state_val.reserved))
>>>>> +			return false;
>>>>> +
>>>>> +		break;
>>>>> +	}
>>>>>    	default:
>>>>>    		if (XE_IOCTL_DBG(xe, 1))
>>>>>    			return false;
>>>>> @@ -402,6 +463,12 @@ int xe_vm_madvise_ioctl(struct drm_device
>>>>> *dev,
>>>>> void *data, struct drm_file *fil
>>>>>    					goto err_fini;
>>>>>    			}
>>>>>    		}
>>>>> +		if (args->type ==
>>>>> DRM_XE_VMA_ATTR_PURGEABLE_STATE)
>>>>> {
>>>>> +			xe_vm_madvise_purgeable_bo(xe, vm,
>>>>> madvise_range.vmas,
>>>>> +						
>>>>> madvise_range.num_vmas, args, &exec);
>>>>> +			goto err_fini;
>>>>> +
>>>>> +		}
>>>>>    	}
>>>>>    
>>>>>    	if (madvise_range.has_svm_userptr_vmas) {
