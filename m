Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CF5C369AB
	for <intel-xe@archiver.kernel.org>; Mon, 21 Apr 2025 04:55:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A712110E042;
	Mon, 21 Apr 2025 04:55:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ziu9f+Dp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C39B10E042
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Apr 2025 04:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745211341; x=1776747341;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IoiqNBLDYE9zp0+/XSq9wmuqmITqujm8BXAxUHrppHo=;
 b=Ziu9f+Dp0t+D21u0MWmqTpoBFQnHELTn4sJeJyuUecmxmXQY33rOn9AH
 GYgdDet3Ki9FFySY4coP+F/k4aFKqfqyPBX59uaqfa6i11TigO8Yq3Bel
 nG74lwUZnBx0Ie0r06DjdBwAyqN7UKzTUJDQyi5XL1bZ0KQdr8R9eEonw
 07t8qba+G6CBOojgKorQ3XQtSwhWV2aDH876oV7vOPxJOpQN3Ei5pdoY6
 ofiBP1+tj6u/EO2iJImOAM4g1ovGd9Z0+CgTEx0U96/yg8kVsmBcJcwcY
 J9oxWW7xS0aBjhPvio0ISfdTuRvjpsDxSs9/6kkVHAUhpuY9d3vvRc02u w==;
X-CSE-ConnectionGUID: 72stvxvdRqyJN9zp6fYIEQ==
X-CSE-MsgGUID: NcdDruxvTbeL2PXTAMaTIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="46859108"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; d="scan'208";a="46859108"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2025 21:55:41 -0700
X-CSE-ConnectionGUID: sVS4V7sDS6ObrZiOu8at2Q==
X-CSE-MsgGUID: +9XVsG/PTvm2eVKgjquDDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; d="scan'208";a="136773920"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2025 21:55:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 20 Apr 2025 21:55:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 20 Apr 2025 21:55:40 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 20 Apr 2025 21:55:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SqQ699aH++VBiH3DaP3nkHRk9onBsmONCnfaVoecuwmV4wAnjTRHwG7WGcnIzNdg5G4GpCuQKVueaahQ3FRfxJw14VTZIQTVSK3qmCTekDRLegBDxrdcB/W+9rr5ZUfJ3jKn0Hchs9dWP/upvC3NBi7p2lOb7Duwc95tCOYxz26wV6vxYTuS3b8TlLQ6D6CD2EW9oLe9fmdsjh+IdRrSWWu+1s7j2b0VTpQci7zt+5Q+wiIPNdmFOFfyPhWgLLpeEahdg5IGjeN6ph+K6xUtXJPjLGepLVrjL1oHajcNe81mBfoCxiN/LBBhUo7stG4JVRJM8tMj6YV3QPSCS3OjjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wf9ig/ui70zKO+tGJVJ6HwNULhk5YmV9OJOY1KjijSA=;
 b=aVBmBhS3pgE7g7fIvL2OqhHj5KS8tBLio3E4qZ+Z+MZ0tuh8MaOh588t5cwlqgHzajm+mG9mvwQQlv/iJaf3kFtSegaoAcQO6fHJXWGc/7ID5suBAMvh4RBEZ1Z7XXCsN6uRJ1md9JqzFpVDmm9QCOpui6/geo7GfsJUumuN6Fe1fg0u7/G7iIf0dOaia1WiMKmu24gQ+ssACw/y2ebhHwnNjOufj4juv2wyBC3K+IEOWPRycQQJRAJCaTHGay9YN7tnyOgc1h93XVDejAPwySlza5T84UTEkHFdMWId9tNdU2xywefHG7PLWWIpjMLZ592tvYpogmrpelugHrNJcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DS0PR11MB8206.namprd11.prod.outlook.com (2603:10b6:8:166::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 21 Apr
 2025 04:55:10 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 04:55:10 +0000
Message-ID: <bf7abc7a-3a68-45da-9d25-ab247562efa8@intel.com>
Date: Mon, 21 Apr 2025 10:25:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/32] drm/gpusvm: Introduce vram_only flag for VRAM
 allocation
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-13-himal.prasad.ghimiray@intel.com>
 <aABwdyACY3nfxcST@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aABwdyACY3nfxcST@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::26) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DS0PR11MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ae6aaf1-4b1c-470f-56bd-08dd8090b1f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUdyUE5xZ1A0elEwS2Q2TmtvVHFxQysyNDg4Ri9tSS9CV3JIRC9ReGt0cFg2?=
 =?utf-8?B?Ym5GMXVtSHNtbnZmUWttUTdJakZzZXlyd3IwV0RLNWUvSEVibzZaaUNueFVG?=
 =?utf-8?B?QUlJMWJUbHdFclkyQXZUU3JTUW05RWM4L3VSQTh2TWs1QW5tSDhuSmdGLzFh?=
 =?utf-8?B?VWdWTE9VQjNXbGpRSGZKSkxBazViVTJGU0dwSC9PVWdKSHh2em5XZGRzbmI5?=
 =?utf-8?B?SVZwSm9Hd243WHhnUVhwUFQrNXUzZWhMWXVZdXVaeTR5UWVhVktLdVdaNjBo?=
 =?utf-8?B?V2R0L0hoZk9OWGd4aEthNkI2Qzd1WkNmWkJkVVRVbWo4by9xUUN6UDdNeGNH?=
 =?utf-8?B?ZHBUSWUvZEc2cm8rUVhIaG1EblFCbkk5SzRKaE1kREEvSnNERDBVeWl1R1Uv?=
 =?utf-8?B?RUh1dVVmTEQyOU5ZcGJyOElBMk1ITVpUQ1VPSTdNMEdyeW9Zb3hpd0I5RlRi?=
 =?utf-8?B?cU5ITEZxaitoYjFZZGZHOGhCYnJTRkwrUEFBWVd6MkVlTUVWOHo3M1ROb3hx?=
 =?utf-8?B?K21BTEtOTGU3Z2h3ekI3dlVhUlByNUN6OE5rRTQ1RlVOdUJldmNLSGt2aUd4?=
 =?utf-8?B?dUFCVVNhRlFub2Z4TSsrU1ZEMHUxM3kveEVBa3NGUE9acm1DcnB5czVGMSsw?=
 =?utf-8?B?VE1JYXdxSUJUQjRsUUlIVGZYUW53WUh0ajdBYXF2MjkzSFJpZnVmaGN3Y0hD?=
 =?utf-8?B?VjUxMDlQTnVuQWlvKzZtVys1Rnc0cSt3TWttZXJTeHpVK1ZzOWtYY3ZUdzFt?=
 =?utf-8?B?U1dZUjR2VXVFQ3ZPdDFvNENMMnE1V1dBcUFsMmU4VEs2eWRRVkJyQ29KaWlp?=
 =?utf-8?B?TGdNTUVteGVxOE5pUEdLK21nMkRCT2hTcytvcWtSeFFNeEJZaUlwODVIVmI3?=
 =?utf-8?B?Z3QyK01QeElDK3RZRmx6NjJLN1pJbEpicnh2RmFqVXZWZkdrTzdVY0hQbG51?=
 =?utf-8?B?WEFPV0gyaXdoVGdWVUk4ZFpsWkhkYUdHUVg3RjFQQXRNRGlibTdRTDBUWk5V?=
 =?utf-8?B?dFhadldOdHQyQTdUOGRPcUJlVytEMWt5V3d1MG9hVzNIRXpRUGRxM3RPdStL?=
 =?utf-8?B?WjlVNVpWM3YrdUpmUWhDT3FwY3NkT0JDcGZPRHdvdHNrVGFHbU55QS92eHFW?=
 =?utf-8?B?QVcyMmsxNHI1Wi9aSGFLalFiYVlVODJ4RDFNUXdvcDZIOFNBbmRMdVl5Slg0?=
 =?utf-8?B?THRxeE8xbmRVTVc3SDA1UkF5cTh4cFRkNUd6cmVPQTRRQ25QNzNrTzAvL3g4?=
 =?utf-8?B?Q2tZalNhbm96TzNsRllyMUlzSzdkN2doaWVPbFdibjRwenhILzdVK3U5eDhU?=
 =?utf-8?B?MUpMWDlycTNlOVFGbW9hRzZYYmRnT2VRSERKUXVlRjJZYWhLMmRrbTdaenNa?=
 =?utf-8?B?ZDcwQjBXdmh6UWYwU29uVzllYzhPT1lraUZjMGNkb0lMQkQrdGxCNEZrd05I?=
 =?utf-8?B?c2pIYlQzRHYxU0E5em1mTDFqNjhRZUovY0xNWno2SFdxZVhnTUJKM1JUU2lu?=
 =?utf-8?B?Y1FtY0dwYk0zRmtuem1ReDlkWm5sa3JuSTlLdXBOQzJqdFNaWHY2c1VHa082?=
 =?utf-8?B?SFFJSlc1N1cyaXoxUWNXN2lWL1dRT25lWHczZjNGcGFvQXRQSC9aZ1AxM01q?=
 =?utf-8?B?cjlYdWRvSC9mQmh6UmhlRWxHL09odEgzalh0dWlCVnpnNU1seUdyTGxOdnJD?=
 =?utf-8?B?bEFaTkNIVDNtZHR0UytlQm0rM2hXZm9GVHcvK2FycHZUUVMvOE1MczBIUEd0?=
 =?utf-8?B?dXFINVRibVZZUzZ4cC9JNjllME43aHdkMVdpZnZmWTdwenJiNC9PbzJDbCtm?=
 =?utf-8?Q?kmeFs9HLkyaemRafuVuRm9s3vRAxTTsalCc4k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aU01YWdpL2V4bTRxKzl6bHZsclEzU0t5WUxzcEZXRGtVNTJxRDV1dk1vWDVL?=
 =?utf-8?B?OGlqdEJqMVdoVXNCL243U3loME1yNWJNdnRNL0d2NzhKODZmNlRCOXNyUmlE?=
 =?utf-8?B?alRwSFRZZXRWODl3ck00cmxlV2FkZEpoR2k5cG1WdHRGVi9NcGZqcXFXT2s3?=
 =?utf-8?B?MG9yYjNxSmNSZWlHdS9ET2ZBV09kZnBsNTlqRlBJRldabkdML2NaL0pKdUkz?=
 =?utf-8?B?QXBXMGhWZHNQRnFlYVF3SHRYekQvd29EV0tSUEpQQTlBL3JqN240cW45RjIv?=
 =?utf-8?B?SHpoWktlcklMVGhSeVZsK1F0RjJWUnlHQ0wra1lZSFFSTnYrWkpoYnJvTmFB?=
 =?utf-8?B?dlhwYjB5dVVIMmJDdXhpbVhIaklQUmMvNkZFUDFISVdyeWZMMUYvNmxVSXYz?=
 =?utf-8?B?T3h3VktybjkvRDQxWkJvR1BrUDRMa05PQm0xM1lnWVRHTThMaWE3cG9paGdD?=
 =?utf-8?B?bkRlblhnN1BsM05raFcydTNuT0hlT0ZtTGpEZWxTYWt6WGkyN2M3WmNCVERG?=
 =?utf-8?B?VEN5ZlpPU3MvUksweFdmVVptTzMrbzNFak01SUlTK0VCQmp4VmlLZG9ObmQr?=
 =?utf-8?B?SDB3M0xMS0Jjc0lOa0RiOUUvSmpxV3oyU0xKZFRFRHdkdlg4MkF0MjEyNjBP?=
 =?utf-8?B?VjZBdDlIOE0zak5wVUQvZEZMT1Q5S0VXZVNUaDJnb1l1SUxpWDlpRWU4aVdJ?=
 =?utf-8?B?OEQvcGZ3ZVZZVnZiSDhwN21XMkdSSTNyaUIwMmhmRDViVVNmVFM0R1ZRRyti?=
 =?utf-8?B?QjRwVTRuNjEweEdKMUZjaVQ0V1R4d2JjK2xOaVJJM1pHWUp5UVZKL3NtUmRq?=
 =?utf-8?B?NzNMd2J4RHhXeWZNWEE5Z29HM1h4VHViaXBJL0JMMGY3U1kyTXVIajFHTDA3?=
 =?utf-8?B?cDN3RzdDWHNReFhlWEF6QkhaWWN0bFNHV0lRaU9IRHZ5VE5MdkNYTUU0b2Jm?=
 =?utf-8?B?TDc0VUxNenlQWEZXQUVKeHR0Szd5RDdtOEhBNkwzTXIxS0l5UDhQTDQyWFVh?=
 =?utf-8?B?TmY3WlhBOTJnUDd0aklCd1ZidXc4Um4vZDdCeGN5RmNpV2JqY1l0dTFKYzVG?=
 =?utf-8?B?blNHbFBzMHhNYWM0VlRMdmdaRWhjR003eWNIdW91YURmbW4wNEYwWnZOczF3?=
 =?utf-8?B?bkFDbE9BbWxkeXpkNFpiMzJKREdHUkVZdXpkZ0VJVjFYT3l6bmNnNnozTnZU?=
 =?utf-8?B?YXlFQzg1Qm1IQ2hGbk0xQ2JHMlNGSkdKbzN5V0RxVE94QjNXR2dCaUJyZzRB?=
 =?utf-8?B?QTcrVzFRVUV3T1l0djN6NzJYZFhndVI1SHBpd3BuL0VxaVlpdHB4S1Z0bzFD?=
 =?utf-8?B?ZEVYUDRQYmI2c3lrZWNxZXIwQnJ1cGRhNGtCVUdIU2FxQ3ZhL1RzQ1V1RFgx?=
 =?utf-8?B?ck9jYmVCVDZrcUdhd2lCZ3BzVTFNNDBDVE1iZFc4REg2Q011QnVwZHFqSzlI?=
 =?utf-8?B?RFFPc3hvOEs4cWRrY3hoTzkraTg3UVRpRzZrUXdIQWdsaW5SSGJ4QWxCN2ZP?=
 =?utf-8?B?dUY3QmN3OXJCR2ZJR04zaTdSNDJ0cEJ0L0RxQmJEVDB4aUVkazJZZDJCcXlq?=
 =?utf-8?B?SVpCNlVERVF6U1FCOHJucnlPWEhmZXJ5UHpKamcvRURwMmRmSXJqL0crYjZZ?=
 =?utf-8?B?dDZBZVRRL21tbHd3eFpHN2F1Ykd1Qnh3ZGlHMUg3ZTM3UGJBVVZqRmtOeVJz?=
 =?utf-8?B?NVQ3QkhpOUtoa0ZWUkZCcXFYT1h1VkZRWkRCRkI1bkZONVZwU2RWNmtBQ1dh?=
 =?utf-8?B?bEEyS1BVRGJpb1BrL3JCd2UyTnN4WHVZK0l5cGVWdGM5NU5jaGduaHJ0UUly?=
 =?utf-8?B?TytybW5CWVhMVUtaSFovWmZaVkhNeXVoR0RNR2RMNlNBeTJ0Njc0K044WlJ3?=
 =?utf-8?B?ODdKUGprSHZNdmdNVVlVNmJHZnZuaXplcHBSRnBnMFljdThNa0xLRzNZV0lI?=
 =?utf-8?B?c2lGcUZTZ0JSZUpkc0hwNi9kZmIrUGU2SFZ5UmRaa3B5RDhlakJnQmdVdXd0?=
 =?utf-8?B?NWZYcHRIM2tEdFFSWnZBZjJyUG5YM3dwaEZZY0QzOTd6NHpZZXhTVUk1SXJt?=
 =?utf-8?B?dWk5Wlp1Rk1Da3RhUDYyOEVNZGk1V1JxeW8wRHdkWThpOWhIeXNtVXdNN1NH?=
 =?utf-8?B?RVc5SS9VUFFZbVkzRStRYk9wSXdlN05DY3pPNkgzaWFpcGp2bEM3Qkx2dTNX?=
 =?utf-8?Q?BnkNa4xA/Qs2nUoH/P/K9cY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ae6aaf1-4b1c-470f-56bd-08dd8090b1f7
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 04:55:10.7391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8T2HHJ7i9Jf+R6NHuVNU904Kd+UuwheuthLQn/R0fdy/3HAuFXK+QFRc6AcFu8I8dCxSu84gsCbuZm4caP/0ZHWjDUjCK1pxFpg9/0nRLns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8206
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



On 17-04-2025 08:37, Matthew Brost wrote:
> On Mon, Apr 07, 2025 at 03:46:59PM +0530, Himal Prasad Ghimiray wrote:
>> This commit adds a new flag, vram_only, to the drm_gpusvm structure. The
>> purpose of this flag is to ensure that the get_pages function allocates
>> memory exclusively from the device's VRAM. If the allocation from VRAM
>> fails, the function will return an -EFAULT error.
>>
>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> 
> Again this is included in [1] with you remaining as the author.
> 
> Anyways:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Thanks

> 
> [1] https://patchwork.freedesktop.org/series/147846/
> 
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/drm_gpusvm.c | 5 +++++
>>   include/drm/drm_gpusvm.h     | 2 ++
>>   2 files changed, 7 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
>> index 2451c816edd5..149ac56eff70 100644
>> --- a/drivers/gpu/drm/drm_gpusvm.c
>> +++ b/drivers/gpu/drm/drm_gpusvm.c
>> @@ -1454,6 +1454,11 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>>   				goto err_unmap;
>>   			}
>>   
>> +			if (ctx->vram_only) {
>> +				err = -EFAULT;
>> +				goto err_unmap;
>> +			}
>> +
>>   			addr = dma_map_page(gpusvm->drm->dev,
>>   					    page, 0,
>>   					    PAGE_SIZE << order,
>> diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
>> index df120b4d1f83..8093cc6ab1f4 100644
>> --- a/include/drm/drm_gpusvm.h
>> +++ b/include/drm/drm_gpusvm.h
>> @@ -286,6 +286,7 @@ struct drm_gpusvm {
>>    * @in_notifier: entering from a MMU notifier
>>    * @read_only: operating on read-only memory
>>    * @devmem_possible: possible to use device memory
>> + * @vram_only: Use only device memory
>>    *
>>    * Context that is DRM GPUSVM is operating in (i.e. user arguments).
>>    */
>> @@ -294,6 +295,7 @@ struct drm_gpusvm_ctx {
>>   	unsigned int in_notifier :1;
>>   	unsigned int read_only :1;
>>   	unsigned int devmem_possible :1;
>> +	unsigned int vram_only :1;
>>   };
>>   
>>   int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
>> -- 
>> 2.34.1
>>

