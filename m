Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FFAEFB7E5
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 03:23:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4596510E497;
	Tue, 24 Feb 2026 03:23:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j2O0zloS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2028C10E497
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 03:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771903398; x=1803439398;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1w74ktmqvIjgcyVUcX/xDWelHqVRVaR1pc13M7MoTyk=;
 b=j2O0zloSAODCzJldrHbG2pPajR00G5Vzve77am/zHyhvHlHWXLUOcw+6
 iuTw24g/C+jtTCC+0Z0qFIxzv5vqgMbhp58UKAAGgqzq1JcXKOHGioT4a
 w08xHDyLATXp72k/qZdIo3JMrrb98cMiJoCGAJO7YqSuPOf2hnDHnr0Le
 U+rrEk8zvZHQwofnV+Wt+WQYZ4xl8WM33bNz5RhUeRDkj00crZY6Xf7d8
 umnBMdNBDjWonqjnNvOTsKimB4NMgTh4AFJ4KG+sHSJWY1021hNP2qTEd
 q6cRHu6qY/rXo+XuotKGMg0JK/vmqp1YumZTUPSkSW30mr75P5btO8So/ A==;
X-CSE-ConnectionGUID: FMRhqP8ERdiGrBNb3kOBsw==
X-CSE-MsgGUID: Uj6qeASCRCK4W1Z2A/WDdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72123807"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72123807"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 19:23:18 -0800
X-CSE-ConnectionGUID: LB65DEekRYKu5A3LOelQzg==
X-CSE-MsgGUID: xhs2JvK4SVuATcuwX0Q84A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="253492256"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 19:23:18 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 19:23:16 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 19:23:16 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.50) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 19:23:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FyDTX/Zpwyd38h5e7DnA0xd5h6Onu34v3euAKMvu5hCfzjk/LGyNMjaneUnh71wW0OPxlOnJI4Y0/B8wMQSxW9GpjHpk1hP58IGyM97jx71bIRhKuInVgVwaU8BHOTDrtWN5NOtejmBI1XAoXlTOnwvLJiB6OK2CgWroCFBS3wL3h3kI38WJcgKgYmQpf8gvgmyhaQ0N4iDELQa2/8hffbPNz/pKD2zyd387fNPbb/eAeilax01uZ8YNKyHGypQJtcMvSCL+VolZQNuWiStg+dYa2vfhyon9cXL5HIQ+0Q0k7+YOeFSmHpC/O9eIEsMoMFFnPgvRf5jJUHeJu7b/NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cxP+bBDBAExvhHSqfpjDM9gWIQYnVwHlAdLdqFDBPoA=;
 b=VIUvUyzRx18jtGhauvVXTtKg3aknmfx/xQqYOLRo09XDQPmXonFWS1ICEp6XJ8TF1fgKVOWGDJ8/ZTJ5bqhzhiFBbuE63uEce3YTVwWrBT5Lp8LGjuW68Aph1BZO7cjNYa5t5fOmjI4VfnXJEZAc4n9mjI5lko56i+lPDg8D5hkw/gGlQkCokK2y+jVEt13xSU1y5uF+ALJ0g97NALdR6RnPQDWCNcWBTiTBYYkLnjHK5ekv43QcfR2iO62vMuHCJtMhnHd4upd+k6Rdh8UAnRqn0FE16RgpSfAO462jLZl7n41iRKUylnOF7YJWrkBuNyw/VNMeo9BHuhnmDQKLqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA4PR11MB9443.namprd11.prod.outlook.com (2603:10b6:208:55e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Tue, 24 Feb
 2026 03:23:14 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 03:23:13 +0000
Message-ID: <efce4bdc-32b8-48b2-a5ae-c0aab1c7df8f@intel.com>
Date: Tue, 24 Feb 2026 08:53:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] drm/xe/xe_pci_error: Implement PCI error recovery
 callbacks
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>
References: <20260122100613.3631582-10-riana.tauro@intel.com>
 <20260122100613.3631582-12-riana.tauro@intel.com>
 <aYhDM-bCiyClOgyL@black.igk.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aYhDM-bCiyClOgyL@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0276.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::19) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA4PR11MB9443:EE_
X-MS-Office365-Filtering-Correlation-Id: 4622140a-1e4e-4e2d-3c0d-08de73540b23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmZqUFdVbzE4QXlGVGowaWdZZG40eWN6QWJGa3d2ajJkb2lvS1FxMENiZm01?=
 =?utf-8?B?ejRGNVY1c2xRdk1rSHFKZHkzNXlKYlFlVWlzNmtEekZhQkxOYUswWndrL3dz?=
 =?utf-8?B?M25KZXd6UDdMU0p5N2pvQ2JKbkdKdStHTEphTXhZOHpKeUVUU2RVSUxyc1VJ?=
 =?utf-8?B?MnVmZTRJY2NXQ0ZVVTRHcVRhU3B2Z1JzeDhhTEc4a0ZFN0FkTUNJT29QYTZM?=
 =?utf-8?B?a09NY2Z4WHBmblJCOTBlRk5QSFBPM1Z1eXo2d1dsQUgvay9zUkswRGgzL1Jr?=
 =?utf-8?B?eE5ONzk1cVJUZzJoSm4xRExId0ZxNlVwQS9CTm94VUtNNE9tcHRUbWdzcHlk?=
 =?utf-8?B?WGhvWmd1bEM3bE4zWDVwY1QxdTNZMy9pRXBLZWRScHNqV25zbVUrMW1KbXVE?=
 =?utf-8?B?MGszVHRNellOV1E2Q2JkT0dHYWRZM3J2Z2thS3dFSUJQYVI5ZjhjaVBLeDlW?=
 =?utf-8?B?dENtOE5jL3VDK0J2N2NJY21hRWdtL1ZQNDA4NmRiRHY2WkJlT0lQTHFxZWR2?=
 =?utf-8?B?czVYcmMzd3Z6MnhaTHRNU1RBODI3NFdNdW1OZkIwMlZTQjhOcll4RUpSd2VE?=
 =?utf-8?B?d1F5cVhOMTdhcGNIMHBadlhZemVJODlrSzR2eG9EeTN0WDJ4NUVCNk1UTmRy?=
 =?utf-8?B?Q091SS9ucXZuUjJwVDRwYmV0L01TR2hhSGlXd1MrN1paVlJKd2dIUnVGbE9v?=
 =?utf-8?B?VGxlOGNIbnpKWDNqRTNWakJldmZuU3JlN3VLWFVjL25leUJOeFpNakhnRnMv?=
 =?utf-8?B?T3pTR1RvOWpuWW5IdnNRR3ZjT29tdll5QzlSclpnMXpBWjdPRVdJRUtWb1M3?=
 =?utf-8?B?SU9Qa05vaFNuSFAxWkpRVlR0ZHcza0JMdS9CNVlrb3JFaEQrREppM1c0SlN3?=
 =?utf-8?B?SzVxQ202QmgxWTN4OU5rTnRtRk9kdlB1UlVnUU42UkE3Q3V1WXJOZTJZcG00?=
 =?utf-8?B?c2djYzJrUnRNQTVQNFA2OXdWVHA1dmhGdGM1MzZOMExPWmZjUm5FcTZtejBj?=
 =?utf-8?B?c3dMUktXbWtXbDUyZXN4ZUlGWjh0amVFNHA4bnlpcXlZbWpNWXZyQ0E5dlpG?=
 =?utf-8?B?cW91cExLR0UycWhHT1dhdlcwV1JHaGJReTU5UVFacUdaM3JqbXY3RVdtZGZB?=
 =?utf-8?B?d0NXbXYwclVNRXFldGVkcUZNQnErRVdPMWc3aG9UVmR1UkdWaTRnSFNmaytJ?=
 =?utf-8?B?dUlyM213OUx3amZZcXBwZkRKZ05XcW1GWWxRb2l3R0Y5Vmx3eFBtTUhTbkVB?=
 =?utf-8?B?SlhNRUN5b1RYamQ1N0JXS2duM3U5S3NXVjdjWE0zOFNvczBNM1lrTHVLVzNU?=
 =?utf-8?B?Zjk1QTU2T1FxcURSZTRici9pTEo4UUlYcWQ3UmVmZEN5R0lGTXZFQ0R4QTF2?=
 =?utf-8?B?bkVNTlJ3aW8vQUpDa0VVUUhxem9DK3Y2Nmc4cEdOZU56Y2Mwazl3Sk1XU3Fs?=
 =?utf-8?B?WXN0Q2hnMzFIR29Vckl2ZTJISFkxbVU1bFJGOVFtamNKa3Q1UXBlNTdaUzla?=
 =?utf-8?B?MzRFalFSTCtNb3p3M0dWbUpDVmMvanVNbzJPUHI3bU1WZ1c4OEVoNTN5VXd4?=
 =?utf-8?B?bzVJOWpUdjI3SkIvSG05OGpVbnNiOFU4ZURQU2UyNHVqbXZGUzdOWEdaUWtz?=
 =?utf-8?B?MEt2UFB1TzdQTnl6dDM3TXpLNUJSZy9VTzhQR1BTVFh2RFFOMm5HZ3EvcjVE?=
 =?utf-8?B?RXMyR2lmSmR6QXRpZUEzSm9Fb1BVTG5iWWwxYWRCTVRoc09iWGFXdVZ0ZGor?=
 =?utf-8?B?U0lVMEx5MHdhOEljcDJBVEcydjNEM3p3aEk4RUhMQjhqaERwRnQ2SktLN0Zx?=
 =?utf-8?B?b2ZFZ1pFenhYZ0lKSnNyVEt6MTlzSnY4Sit2Y1VTbjFhdThvVHMyekVaSW1C?=
 =?utf-8?B?R20yaXJYUzlZU2F4eDNlYi9jZGVGanYrOUZVUEhQemR3VkVtVnhsMHVLQW05?=
 =?utf-8?B?Wi9jRkFpN1A3b3VmWGczR1NwK0d3YUVKYXhKNlFoWkp2VWxGTURYUW92Ukpl?=
 =?utf-8?B?ZktyWVlxRzVvK3VCSmF0ZTRZWUt6QUMrNWhJQTNZa0VwTm10Q3d6ZFk3ek9Z?=
 =?utf-8?B?SUhMVm5CZG1DbEd1OHZEVHQzUWkxdkRHOHRlMGpjZ3plaHdvWHBNZlpTaEFN?=
 =?utf-8?Q?Q/iU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1lSNjJjTGkzdzNtVDlHMEx1U0lCdHRFbjlWazFFenpJUmRtWml4UEtJTVFn?=
 =?utf-8?B?SFpMWHpPY1JxQ2N1d29sbnI3c1RBazJSTFhGK1pzYjJldDRSb3dtUmNDZkZC?=
 =?utf-8?B?dWdxVlBGRFhKSUhkV1VuU2VKQTNrekEwYkZEdlp4Z29UcHpReVd0QXVYRm5I?=
 =?utf-8?B?TXJDbWFaekVBQklnbXZzNXdiM20raGttTit0ODQ2K293VDJiN3ZQNkM1Wk8z?=
 =?utf-8?B?TUhlcm85bGcydnQ0V2kyMU5qS3pQMmlMSFF3WDVhNGhNSzRZclZRa1RXcmdL?=
 =?utf-8?B?aGhrOUFvRmU3V0V2UnlCdFBPWTBIOExvVkFGbkNLNTRQYStJUU1xRHMzK1o3?=
 =?utf-8?B?NXBOSS8wNnhIY1RuQ25TcFYycjAwL0RYUXRkVTVMb2g0OHkrWjE0Mlk1VXNx?=
 =?utf-8?B?VW9VMjYvdVRBS2tjZ25sN05kS093MTh0QU5mVU15clBsbEhwQzJidVhzUEgv?=
 =?utf-8?B?eDVaUnJZY3hRUk53azBmTmtrMDQwb01BdVoxTDFCYUV4U05ESjFrYjRpZmxy?=
 =?utf-8?B?SFNDckRYKzE1Tk1uVmJFTDBKV3NmT3FyWUlXKyttTi96eWFOdUhvUmJHTlMr?=
 =?utf-8?B?RWlIU2dydzNyeCs2emxvczBpNlBDc2FYUy9NVitPZlBWeEg5OVNJSUdpTnFU?=
 =?utf-8?B?VFJ2ZDJhbDIvOUpseGVlRFJYQ1RkK2FrSGxjQ0VYWm5XMkVKcGpyWDB1bUNC?=
 =?utf-8?B?dmJSL1VOdStIWUZnbHBSRkloR1pYY25wWTdBa0RwSVZGOGMydjNxY3lLakZU?=
 =?utf-8?B?ZlpsQkw0Qk4xZlJ6NzRLeWZvZGkvNlZOekRVYzU5cWVCTVNzVG00QURIT1VR?=
 =?utf-8?B?RVJ3cEZQYm5SK2Y5Z1BNdW8yOWpEcURiVU9HRndHbFFIOVNRV3EwSitNSGo2?=
 =?utf-8?B?Vy9zeFBuR2Y3VDZnLzMyRXhxeTc3enpxMitCR1BENTZNTEc3Wk9JZ0pwcVJQ?=
 =?utf-8?B?V25mRHlSZ1I1T1JVOWRzNm1MR1Fqa01EK2krS1hCTDNyM3RjWEJNaEVqYXNC?=
 =?utf-8?B?R1J1TlpyQlV5cWJ0RlBVSFcyV2svV2dUcWZqMjFvTFQ1ZzIvclBRMXlMN1ZE?=
 =?utf-8?B?N040aW1jZElsVnppTVlYVC90STVVbng2REMzQ2c3WUtlc3JwSWp6MXBsaWR4?=
 =?utf-8?B?R3c1VzA2ZE1vVGs0R1VzL2xwakJhdGdrZTZvLy85MWhaczNjOFJrM29FMDFo?=
 =?utf-8?B?U0t1VmVBN1c1NVZIeXBjSmVKL1laVHBGRHkwTFFRS0JzSzgxMm0ycExQYTdI?=
 =?utf-8?B?OGJkNkV1TDBPbDd2WFI4V2MyTEdDaVZGVk5kUGcwQmRUMzBtUFZnT214cERa?=
 =?utf-8?B?TVBPR2IzSFVMdlpla3VIa3lkZkt3VitUME54VjVXc0FLbEJXNS9TVHYveUxY?=
 =?utf-8?B?Ulp0bjVyWHU2UGlQNnFsNytqNEFTZGoySWF1VTQwNUlyQWpGWGhuSEpWVDVy?=
 =?utf-8?B?dWZTVGRSTHFjbnowN1RXazg1U2xzV20vckxJZGMwNktMYytaYVJQQmZqMWN4?=
 =?utf-8?B?NGtJUlIwU2ZCcVBSU3VXa1BxaWF4bHBJcE5jTzdCRk9WeEJKNnl3M0VVWFY1?=
 =?utf-8?B?bm0rZ0ltcUxSdXlCbFEyb3ZhSnVDcVNnTlNEUWhKSnZuUWdDNFRYa3pNR0FH?=
 =?utf-8?B?SFF1V3NrYXh1aERvOTRiL0FNZ0h4K1BjdFdVZ3MzS1Z0dG1RSHJtYVlhYmd1?=
 =?utf-8?B?RnZDSUprOHMveUZGbXp6bU5NeDUxK3dEZ1BQUHhQaUl2OGF2U0xsdk9ZMU9j?=
 =?utf-8?B?MENZeHlaNmJUNjd0bEFKbnBtUmtmdVlzNmZtWXpySkNXOXUrMll1WEdwVm5i?=
 =?utf-8?B?WEpNcXFnQ0VzNkZWSTR5YjNwVkExd3VQVlQrZTlwamFQM3k5bnRBTlVuckFx?=
 =?utf-8?B?dXhJd2NueUV0eC92clZzZlpnVHJ5SVZrc2dmMnhhU1pJL0Rrc3NVa1FXeWs3?=
 =?utf-8?B?MmFsNER3dzlBbkIxNCtkbWJ4NUgxMUJRc2p2eTRuMThaRDV5ak9HaC9QeFlp?=
 =?utf-8?B?bTBiSlRzQmRCRmN1c1NwVXI1Tk8ySkZmTEw1WFlvOTlnWnRUQTdkQlg1NkF4?=
 =?utf-8?B?MHpTOUdnSkp4YTQzSzd5ajZaNWMraVY1eEY1M2FQSU9HbUE3R2dTSmUrT1gv?=
 =?utf-8?B?V0ZOclJibXdJaGlCMUl4YmFNM3dRN3VaaUNwbU05WnNkRThEd0t0RmhUUlJk?=
 =?utf-8?B?aHJBdVNkNzlmWXhkVFArZjdQeVlXZkJxV2w2eFQ5c2NYSlJROSsxZlBkWTA0?=
 =?utf-8?B?T1NNMjQwWnVtVWJHc0tsd1hxVStGdkN1TlFOTGNkUnFUSnUvZ2g1dm92bS95?=
 =?utf-8?B?VXdBUjkzZisyeXJVL1hyNkd6aTFkcExVWDBoSXhzRXc4djFnMEpVZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4622140a-1e4e-4e2d-3c0d-08de73540b23
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 03:23:13.7792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DDdBsW+IeRpnHh+ZXmyea8NQ51lSEF9l4d+EvVxLekjvCkR6zEY9LkJyDBaEsjjaNzH5OLkXyquV37zyUztdYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9443
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



On 2/8/2026 1:32 PM, Raag Jadav wrote:
> On Thu, Jan 22, 2026 at 03:36:14PM +0530, Riana Tauro wrote:
>> Add error_detected, mmio_enabled, slot_reset and resume
>> recovery callbacks to handle PCIe Advanced Error Reporting
>> (AER) errors.
>>
>> For fatal errors, the device is wedged and becomes
>> inaccessible. Return PCI_ERS_RESULT_SLOT_RESET from
>> error_detected to request a Secondary Bus Reset (SBR).
>>
>> For non-fatal errors, return PCI_ERS_RESULT_CAN_RECOVER from
>> error_detected to trigger the mmio_enabled callback. In this callback,
>> the device is queried to determine the error cause and attempt
>> recovery based on the error type.
>>
>> Once the secondary bus reset(SBR) is completed the slot_reset callback
>> cleanly removes and reprobe the device to restore functionality.
> 
> ...
> 
>> +static void xe_pci_error_handling(struct pci_dev *pdev)
>> +{
>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>> +
>> +	xe_device_set_in_recovery(xe);
>> +	xe_device_declare_wedged(xe);
> 
> Is this the correct usage?
> 
> Documentation/gpu/drm-uapi.rst +392
> 
> "A 'wedged' device is basically a device that is declared dead by the driver
> after exhausting all possible attempts to recover it from driver context."

Can't this be used?

"The only exception to this is WEDGED=none, which signifies that the 
device was temporarily ‘wedged’ at some point but was recovered from 
driver context using device specific methods like reset. No explicit 
recovery is expected from the consumer in this case, but it can still 
take additional steps like gathering telemetry information (devcoredump, 
syslog). "

If not will replace it with the gt_wedged function and block ioctls 
using recovery flag

Thanks
Riana



> 
> Raag
> 
>> +	pci_disable_device(pdev);
>> +}

