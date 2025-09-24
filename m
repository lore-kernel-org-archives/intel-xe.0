Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4640CAC5A5
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 02:37:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C7E610E215;
	Wed, 24 Sep 2025 02:37:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mAHgUgKF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D8E10E215
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 02:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758681425; x=1790217425;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=r6vf+q4I4gZYhIEEBMp7CfODBXHI8gbpWK/QPbRODKg=;
 b=mAHgUgKFPYccnoOJHHximKWG8S0z4gbozylx4U4NCL92x1YpcWjkNwbX
 Xr9l8CO3KAUkTMONHkESIHuObvVEDwRXlKH8UanuovRk/FMPvYTn2d7EP
 AkHW5v9C81srtnQN7LFqZjaDWBbdybQIEyvC8fJ/1kdK9rbV+sxx/cCey
 uF/7znph4NlmjwEYskpzfynZtVlTyPN/jBe+xzwu7ug+nuNOiew7KHK8t
 SHm+zCXq70+jnwp3jKWNi2ew1x8jvSDPlgrvUaa3W3ABqkO4VzBGvdPS0
 aoPRa3lelnByn5TYcOk1jf9dCcov0hbQn62Ag46+rO8vB+ONpIXOPBeg9 A==;
X-CSE-ConnectionGUID: Yhs0JKJ0RbCCigyPsiw9tw==
X-CSE-MsgGUID: vJLapdtaTvyFpvxu2NHGfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61024218"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61024218"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 19:37:04 -0700
X-CSE-ConnectionGUID: 7yRgqNFCSH+wW967LOV6dw==
X-CSE-MsgGUID: JS3kWOY7SsuXlA5RFDihlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="214048410"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 19:37:03 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 19:37:03 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 23 Sep 2025 19:37:03 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.40) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 19:37:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LYaTcTlTrDGsdtqlthyjpIRJArq4RSOylWVHjonE88yiT2T/KhdyV0oCry64WkizUNtpdX45LNbG1C/HW0m6EMvPBnKTiT3TV9J5VdOBYt3UIc/ooKUkXJ0rysRqanwJGkg3tlyv7qeR0VM6ybdyU462HR7D0qLwJZrZAz1Y0vMqx4qb929pbvNy9mVn4AN5FUWx5h6Sue/1CWRpycRsj67k4HLm1OqKROurlD2hMfi65z51ErFcFN3dX7gxGP9C6OnY0DUEE9vfy/pkY4qnp0LL1N1AcCO9cPhUGbeYhTFvc4F/KbN6O3rqmPWY2uv2V3Eu13gYgd1mBCCEBAd/Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XR2s73POuM3R/r/CDJ1ZS3iq3aSdruY4ydX8Jnk9P+M=;
 b=Yc6gdSXsvmxToWjfnesExxDgVzBGL2/iiUs4Udq+71wDPDElYV2+ruJ0114towrLmFshkL/5m8cmFeLEkuecoI3Ozi5INGIMXFKShkbdvtcxsi47IQI3Y10ygiZVYREk6EsswMcRpvoFXsNrorck3BcJA6jbIqQp9zunOPdgU+hsHgxsyd6G64JTGzh8f/lRWF9ARMDtttdJXSR5PDU9B2JNVwKxtT52CBIHaWUxun0ItB8m1YjGYi9DgTPf11VZ6/gi4/tHjdVT3JkiD75zpYVKpxR35ziki+rAje6/CIgO/ZwCIrg+TZDjXFR85dQ52BkMdMYWUPfFuxYtcGu2sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6504.namprd11.prod.outlook.com (2603:10b6:8:8d::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.20; Wed, 24 Sep 2025 02:36:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 02:36:54 +0000
Date: Tue, 23 Sep 2025 19:36:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/configfs: Add attribute to disable GT types
Message-ID: <aNNZRAF0GvKZkliy@lstrano-desk.jf.intel.com>
References: <20250918211319.603324-4-matthew.d.roper@intel.com>
 <20250918211319.603324-6-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250918211319.603324-6-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6504:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ddc2ac1-2935-4b54-1075-08ddfb133991
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEdRSlBlbWhadVVMRnB6LzhZYS9FN3hiUmYvL2tuSjF3MlNpVnNBOEVpU2pn?=
 =?utf-8?B?N1pETitOazY0alhBN2NtT0ZuNjF1N1U5U2t5cmxvRDQzK1RQVGowRktVYXdn?=
 =?utf-8?B?dStld3JEWDlsTDBLbkhmTlpnRFVkTlRxSE51ZEl0d2c5RmZwZGFXRlJUVnFJ?=
 =?utf-8?B?b0VyMnV0ZHZnQW91Q3poMFlCejNGNThyby9aL0JhLzhoL1lrdDFXU3crRXJL?=
 =?utf-8?B?azBKMjUrU3VDQkpWSjJBbWdMcjJ2OUw3QlZHekxnbHhmN095YUpuVDF4SWtI?=
 =?utf-8?B?SjE2UWdQSHQ1S1AxWXY1OVVoaHBmak43SWE1bWtScmlBVlpqRDhuNlNPSit6?=
 =?utf-8?B?UkVxWnJqRjBzNU9uc2xDZVNOQlgrRC9ZUFBPeUNVd2V6UnNJYW9jOFNqUHBu?=
 =?utf-8?B?NXFxeVQxSkxvL3hnMlFvZzltSnd5Y3Yya2F3dS8wc2V3Y3Zxbm9USjNFREFP?=
 =?utf-8?B?ZHMvTWZpTTBJcTlOYkNmMXk0bGJFaVkwa2ZiaEZFcldZWEFaTGVNWDZsMWpH?=
 =?utf-8?B?cVhCTStmMVdIcTZhMStUUWxzLzJXNmRvSUl6N2NQb3ovb2p5N2I1djlDa1Va?=
 =?utf-8?B?VkpEUzVQemNFWXRpZVAwUjJvbHFHcUQxeDJmeEVzNmJCODJ2bVNhTXM3SlBl?=
 =?utf-8?B?NEtQQjNJcTQrRytaLzlNT2FUT2xMSmdpMHJ2c1dSSVFFWEozTG42bkZxYkMy?=
 =?utf-8?B?ZmY0ZmFiajV4bU0rSkFRYVNUcTdLQ29CR2t6M2thdDFPaSszK1FuU1IwUGg2?=
 =?utf-8?B?SDE5NjMrdTllN1NoNWtjR3ppemVWZk9za3R1NGQ3TkVGR1YzWjJsZUhqanla?=
 =?utf-8?B?OGdvdnhMZDlrUlBCbkRaTVlWb2NiN2N4U2l4S1pQMllRS3BXWXUzekwrZTRh?=
 =?utf-8?B?bVBlZEhhbGJ1Sko1aFExTVozS0VFZ3VSbEpBWkxLNEp6Wk55bzY3emRIcm05?=
 =?utf-8?B?QVVCektMbmxXanNJY09SUTBadkdZcG1qS1VuZGRnYmQxbU1jWU9uRktWc2ZB?=
 =?utf-8?B?TlVkcmdpS0cxRFpEczZPWVBOTUNwblRMSjNCYmVWTDN6UTFNNGhyVXp5alhF?=
 =?utf-8?B?bGVnT2p2MVZKazdqWnJjOGpxQXZNc01pUDN3WmEyN1RJeS9VN2NDTjlaek1z?=
 =?utf-8?B?THJIN0wwSjJIR3JPYmphdUR5YXNvNnVkdktEaU16ZnlLV3l3bWt4SDNRdmxO?=
 =?utf-8?B?b1Q5QmJPMDdMdzRjTjhOdWl4bkM0MzhadUdnNHRjdy8xNy9VcEpqczBCRmIz?=
 =?utf-8?B?d3Jua0ltckVpSWNYaHBaVERkMlJQMHNJUEN0d0ZaOCtjbzJJK1pQckUwYTh3?=
 =?utf-8?B?cENsTkw3SktWdTBEZFZMZWdsbkQrVWc3YUxodm5iYzdNbFhvQUNMU1BzbmNj?=
 =?utf-8?B?M2xVQ0JyaDFiaWxPMGtaaktXbVBtSnB2K3R1a2EybWhzL25QZ29hcWdVaXE3?=
 =?utf-8?B?d1psNldEN3JUODJldUhWVWd4UkRXaGdrdTIvcnM3NXNBbzBMNXMrQ1ZoRmlL?=
 =?utf-8?B?ZFZ3UnM3M2QzWmE5bzl3cy8vNTdSY0ZncjlMWnU2SXY1STBrdHBtSW0xa3FJ?=
 =?utf-8?B?RWtKdzZKbHB3aC9Pay8wNWQyTGJidHJQZGhpUXdSbnJGWGZsbHNtemFXNnE3?=
 =?utf-8?B?RU81V3BvZlpUUXlyaEtJejlCZFhEZUc3OUwva2s3V2Z1UzNIOVcwdXQ4MTd5?=
 =?utf-8?B?VGdGL2VIVnR3NEpDem8rREcyUjlpRmhxb1p2aGNrZCs1T0puTkdYK1dCRzZI?=
 =?utf-8?B?WXJNU0V3c05OMFc2c3phYnJybmMxZ0YrazNveEVsSm54SGsycFNtbHZHZFp6?=
 =?utf-8?B?VlFkNG5sV1JNSXAyQWxQVDY0endCQ0pFT0NjZ0F4cVN3QU9UcFMyaThIOWxu?=
 =?utf-8?B?b05zZjBpdzBrTzBjOGxiaFNlQ3FrcnFLZXI0Q1dGdFBNZHhpSmJRMFlCV3Bp?=
 =?utf-8?Q?fGzYtANC0c8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzFmdzBLL3gzaUpFUkhIQkJmMS9SZWQvcFhWZmNxRG1KTlcvbGlCYjhPNU5t?=
 =?utf-8?B?QlRNZE9sQnZMTFZaaTArTDRoTk9KRlJHSHlPZWlrMTRMQXlSSnI3MmxaWTRT?=
 =?utf-8?B?YnN2NDJZMW55LzJ4ZVU1UVFkRDZYcFN4SUhPdDZON1ZyVnpMNTk0RFNYTnBu?=
 =?utf-8?B?UW11UVJWYmVEK01HamlaZEdGQzdNWkdjMGp1SUQrdkRWRENDdDFScDdqS2Vx?=
 =?utf-8?B?YVpXYUNyRFBlb3FrZmZWNWg2Vjk4OTJ6Q251Y1UxbWpVVFVYbFplcEtyZEdV?=
 =?utf-8?B?RG15WUVBa084S0hSZlZNc0IzdEc0V1JOUUFTNWF6bkphY3AyamRjTHhMMEF4?=
 =?utf-8?B?dHdidm1wbkdmdjVuaHMyMURnSGtuYjNKaEFwa1NjNEtUNmhFQ3k4cGo1c3Zs?=
 =?utf-8?B?azBIYnh3djkxcjhwR1ZLVEE2ajVBZXk1MXRXZEVIcExrRUJnS0xEc3lMSm90?=
 =?utf-8?B?UUFHMVdiS0RFcGNuYnBQR0tSbHNneW14WkJnNmMvRmxsZVF3TFhySU1MUnJE?=
 =?utf-8?B?TXFqZUhxSEI2NUR4RVMyOC93MExxcFJ2OThMcUdwMUJLelpTUHJpb3lQaTNs?=
 =?utf-8?B?dmlyTWlSZ0VkbTg0UHJVTWMxUUJ3Y2JjenBCenMwL3FXbytZOVNJbWYxV2xX?=
 =?utf-8?B?TmZwTHBwLzFNV2trMmNCcEhVYmdRT2F1ek5vQTNqNFlWc3d5M3NVTjZWUkd1?=
 =?utf-8?B?bCt3YzhmanF4MzkxZ000SlNZYlpPMk4weUlDM3QzZU9pbXdUa0duQ2JGQ0hl?=
 =?utf-8?B?YTlMbzZTakZIdFhoS0c4SHZQdVlHMnF3dFA1UDBjM0lpakd6WXcyNzcreWRQ?=
 =?utf-8?B?a2VRNnRLYzdrU1JGUFpGK01DNUhtLzNsMENjZFJmTTdIbyt6dms3K0xZdGZ2?=
 =?utf-8?B?MS9DbmxhSlVYSE9EYmJOaHpxL1FuSWVoYnB4RE5SUExUWWs1c0llTEcxNTJw?=
 =?utf-8?B?TEtxT3kxVGJaRDJoOEQ4RlZ2dFZ3WnN5RmJBYnJCdGg5N0k0cHc2Tlp6WGpD?=
 =?utf-8?B?bW9ZZWZCMXZEVWlOeTFwSU1hTDNQd0ZrcHhvcy9qZW5lMisveWV6UTUwSXpZ?=
 =?utf-8?B?bTdHR1VMZ3Y2SWVpMkI1VlVuWmZEWU1tZDFRSTVEN1NNeDVyQlpSVUswTGpQ?=
 =?utf-8?B?bWFuUFkxNWg4cktZWXpDWlNUa01PQ3hLcXRxd2JuajVvYTBIM2FsUTU0c1BQ?=
 =?utf-8?B?RWszeTd1YVNPYUhLY0ErWmtSSmNnL2dndmtTMnZDaHZMOUFnM2locEFJVk5Z?=
 =?utf-8?B?dXo0QlAxd0NFVkRpUUpCV3ZJcmhhQTM0QlFzRmRoZXh6Z3FXRy9yZUlzN1Zq?=
 =?utf-8?B?VGkydmtPMkNNT1JxVWFJbmloWTQ2Rkk1Z1F4d0ZuTEluS2dpbGRSc3JmUVU3?=
 =?utf-8?B?YTdRMzRGajRpcStSSGF0Z3FOVzNFY0xYdVpRTDhydnlINWhDaFE4Smk2aGdP?=
 =?utf-8?B?Tkw1ZktZdHlLaUZoRTVNNFdVSDRXNi9Yd2EyREkwbUI3Y1pTTkRGQTdaODlu?=
 =?utf-8?B?ZU1wV2pyUHpWcDlTOWNFKzQ2WUNQeVNFQ3VMSDB4RlFxbzBEVy9hUEFyb3l0?=
 =?utf-8?B?YkN2SWRLUnFNbmZ0ZGdjdzVxSzdEb1pRMVRjZHR4VmdBL1RQVlUwM3VoMURF?=
 =?utf-8?B?b0ZCSm8wK1hGMEc3L0hUam9zQkdnKzNJdGQyVlVWSkpuUEFOV1loMERoSjZT?=
 =?utf-8?B?dmNwem90M29ncHNNeC9tQjZ1c05qLzBrMElqb1NGMndRNHp1TUNWYW42dzRT?=
 =?utf-8?B?MU5JeHczR05URDhNS3VXZlNWeEJmUXdMZzMraWNnSURiR2ZlVnVCUHBRdGZh?=
 =?utf-8?B?S20yY2pNVm1mMXY3OGYzOHVXOFNKbXpvL2pDUGdvQTUzZ2ROWVFYdUEyb3JZ?=
 =?utf-8?B?YmwxVm9talRJMTNxZXBrZzB1Mkw1VjlBMWpMd2c0YndhMlQ4ZnI2c2RzcUUr?=
 =?utf-8?B?bTRVWkZDd0Viakw5eEpHQjdWcVNxZENwenFEMEVKZ3VidnQwQlF1MisrZ0ov?=
 =?utf-8?B?ODlBb291aS84ZFBYRmRMWVRjQXdoVlZRSmhvRk5uRTBOa1M0R2pvSjM4QmxG?=
 =?utf-8?B?QkVuQ0JGbExyREFiNkRDc0xXK25ZU2ZNNHorS3ppY214RXRxeGN5LzNBUndH?=
 =?utf-8?B?a3grTWhCcVhQaGozZU9kcFNYeVExU3d3dFVldmdQZHhxK3hyRk1leGRwRHdT?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ddc2ac1-2935-4b54-1075-08ddfb133991
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 02:36:54.6842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VAXYnp4MJY6LfHD81i9vjwSgujWHFWREdSCBxd8fU4zc21mrVfuJYgTg1TFVQYxiWXz1+UqqGfxJIgcW3oupzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6504
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

On Thu, Sep 18, 2025 at 02:13:19PM -0700, Matt Roper wrote:
> Preventing the driver from initializing GTs of specific type(s) can be
> useful for debugging and early hardware bringup.  Add a configfs
> attribute to allow this kind of control for debugging.
> 
> With today's platforms and software design, this configuration setting
> is only effective for disabling the media GT since the driver currently
> requires that there always be a primary GT to probe the device.  However
> this might change in the future ---  in theory it should be possible
> (with some additional driver work) to allow an igpu device to come up
> with only the media GT and no primary GT.  Or to allow an igpu device to
> come up with no GTs at all (for display-only usage).  A primary GT will
> likely always be required on dgpu platforms because we rely on the BCS

iGPU uses BCS for clears and VM binds (currently, may drop for a pure CPU
implementation). So a few more road blocks here.

Matt

> engines inside the primary GT for various vram operations.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 119 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_configfs.h |   2 +
>  drivers/gpu/drm/xe/xe_pci.c      |  18 +++++
>  3 files changed, 139 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index e52808e3199f..c675994439d4 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -13,6 +13,7 @@
>  #include <linux/string.h>
>  
>  #include "xe_configfs.h"
> +#include "xe_gt_types.h"
>  #include "xe_hw_engine_types.h"
>  #include "xe_module.h"
>  #include "xe_pci_types.h"
> @@ -54,6 +55,7 @@
>   *	:
>   *	└── 0000:03:00.0
>   *	    ├── survivability_mode
> + *	    ├── gt_types_allowed
>   *	    ├── engines_allowed
>   *	    └── enable_psmi
>   *
> @@ -77,6 +79,40 @@
>   *
>   * This attribute can only be set before binding to the device.
>   *
> + * Allowed GT types:
> + * -----------------
> + *
> + * Allow only specific types of GTs to be detected and initialized by the
> + * driver.  Any combination of GT types can be enabled/disabled, although
> + * some settings will cause the device to fail to probe.
> + *
> + * Examples:
> + *
> + * Allow both primary and media GTs to be initialized and used.  This matches
> + * the driver's default behavior::
> + *
> + *	# echo 'primary,media' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
> + *
> + * Allow only the primary GT of each tile to be initialized and used,
> + * effectively disabling the media GT if it exists on the platform::
> + *
> + *	# echo 'primary' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
> + *
> + * Allow only the media GT of each tile to be initialized and used,
> + * effectively disabling the primary GT.  **This configuration will cause
> + * device probe failure on all current platforms, but may be allowed on
> + * igpu platforms in the future**::
> + *
> + *	# echo 'media' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
> + *
> + * Disable all GTs.  Only other GPU IP (such as display) is potentially usable.
> + * **This configuration will cause device probe failure on all current
> + * platforms, but may be allowed on igpu platforms in the future**::
> + *
> + *	# echo '' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
> + *
> + * This attribute can only be set before binding to the device.
> + *
>   * Allowed engines:
>   * ----------------
>   *
> @@ -127,6 +163,7 @@ struct xe_config_group_device {
>  	struct config_group group;
>  
>  	struct xe_config_device {
> +		u64 gt_types_allowed;
>  		u64 engines_allowed;
>  		bool survivability_mode;
>  		bool enable_psmi;
> @@ -139,6 +176,7 @@ struct xe_config_group_device {
>  };
>  
>  static const struct xe_config_device device_defaults = {
> +	.gt_types_allowed = U64_MAX,
>  	.engines_allowed = U64_MAX,
>  	.survivability_mode = false,
>  	.enable_psmi = false,
> @@ -157,6 +195,7 @@ struct engine_info {
>  /* Some helpful macros to aid on the sizing of buffer allocation when parsing */
>  #define MAX_ENGINE_CLASS_CHARS 5
>  #define MAX_ENGINE_INSTANCE_CHARS 2
> +#define MAX_GT_TYPE_CHARS 7
>  
>  static const struct engine_info engine_info[] = {
>  	{ .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK },
> @@ -167,6 +206,14 @@ static const struct engine_info engine_info[] = {
>  	{ .cls = "gsccs", .mask = XE_HW_ENGINE_GSCCS_MASK },
>  };
>  
> +static const struct {
> +	const char *name;
> +	u64 type;
> +} gt_types[] = {
> +	{ .name = "primary", .type = XE_GT_TYPE_MAIN },
> +	{ .name = "media", .type = XE_GT_TYPE_MEDIA },
> +};
> +
>  static struct xe_config_group_device *to_xe_config_group_device(struct config_item *item)
>  {
>  	return container_of(to_config_group(item), struct xe_config_group_device, group);
> @@ -229,6 +276,55 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
>  	return len;
>  }
>  
> +static ssize_t gt_types_allowed_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_device *dev = to_xe_config_device(item);
> +	char *p = page;
> +
> +	for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++)
> +		if (dev->gt_types_allowed & BIT_ULL(gt_types[i].type))
> +			p += sprintf(p, "%s\n", gt_types[i].name);
> +
> +	return p - page;
> +}
> +
> +static ssize_t gt_types_allowed_store(struct config_item *item, const char *page,
> +				      size_t len)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +	const char *p = page;
> +	u64 typemask = 0;
> +
> +	while (p < page + len) {
> +		size_t typelen = strcspn(p, ",\n");
> +		bool matched = false;
> +
> +		if (typelen > MAX_GT_TYPE_CHARS)
> +			return -EINVAL;
> +
> +		for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++) {
> +			if (strncmp(p, gt_types[i].name, typelen) == 0) {
> +				typemask |= BIT(gt_types[i].type);
> +				matched = true;
> +				break;
> +			}
> +		}
> +
> +		if (!matched)
> +			return -EINVAL;
> +
> +		p += typelen + 1;
> +	}
> +
> +	guard(mutex)(&dev->lock);
> +	if (is_bound(dev))
> +		return -EBUSY;
> +
> +	dev->config.gt_types_allowed = typemask;
> +
> +	return len;
> +}
> +
>  static ssize_t engines_allowed_show(struct config_item *item, char *page)
>  {
>  	struct xe_config_device *dev = to_xe_config_device(item);
> @@ -342,11 +438,13 @@ static ssize_t enable_psmi_store(struct config_item *item, const char *page, siz
>  }
>  
>  CONFIGFS_ATTR(, enable_psmi);
> +CONFIGFS_ATTR(, gt_types_allowed);
>  CONFIGFS_ATTR(, engines_allowed);
>  CONFIGFS_ATTR(, survivability_mode);
>  
>  static struct configfs_attribute *xe_config_device_attrs[] = {
>  	&attr_enable_psmi,
> +	&attr_gt_types_allowed,
>  	&attr_engines_allowed,
>  	&attr_survivability_mode,
>  	NULL,
> @@ -513,6 +611,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
>  				 dev->config.attr_); \
>  	} while (0)
>  
> +	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
>  	PRI_CUSTOM_ATTR("%llx", engines_allowed);
>  	PRI_CUSTOM_ATTR("%d", enable_psmi);
>  	PRI_CUSTOM_ATTR("%d", survivability_mode);
> @@ -563,6 +662,26 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
>  	return mode;
>  }
>  
> +/**
> + * xe_configfs_get_gt_types_allowed - get GT type allowed mask from configfs
> + * @pdev: pci device
> + *
> + * Return: GT type mask set in configfs
> + */
> +u64 xe_configfs_get_gt_types_allowed(struct pci_dev *pdev)
> +{
> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> +	u64 mask;
> +
> +	if (!dev)
> +		return device_defaults.gt_types_allowed;
> +
> +	mask = dev->config.gt_types_allowed;
> +	config_group_put(&dev->group);
> +
> +	return mask;
> +}
> +
>  /**
>   * xe_configfs_get_engines_allowed - get engine allowed mask from configfs
>   * @pdev: pci device
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index 1402e863b71c..eddb66201edf 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -15,6 +15,7 @@ int xe_configfs_init(void);
>  void xe_configfs_exit(void);
>  void xe_configfs_check_device(struct pci_dev *pdev);
>  bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
> +u64 xe_configfs_get_gt_types_allowed(struct pci_dev *pdev);
>  u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
>  bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
>  #else
> @@ -22,6 +23,7 @@ static inline int xe_configfs_init(void) { return 0; }
>  static inline void xe_configfs_exit(void) { }
>  static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
>  static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
> +static inline u64 xe_configfs_get_gt_types_allowed(struct pci_dev *pdev) { return U64_MAX; }
>  static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
>  static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 77bee811a150..f065b8ea5673 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -668,8 +668,21 @@ static int xe_info_init(struct xe_device *xe,
>  	const struct xe_media_desc *media_desc;
>  	struct xe_tile *tile;
>  	struct xe_gt *gt;
> +	u64 gt_types_allowed;
>  	u8 id;
>  
> +	/*
> +	 * It's not currently possible to probe a device with the primary
> +	 * GT disabled.  With some work, this may be future in the possible
> +	 * for igpu platforms (although probably not for dgpu's since access
> +	 * to the primary GT's BCS engines is required for VRAM management).
> +	 */
> +	gt_types_allowed = xe_configfs_get_gt_types_allowed(to_pci_dev(xe->drm.dev));
> +	if ((gt_types_allowed & BIT_ULL(XE_GT_TYPE_MAIN)) == 0) {
> +		drm_err(&xe->drm, "Cannot probe device with primary GT disabled via configfs\n");
> +		return -ENODEV;
> +	}
> +
>  	/*
>  	 * If this platform supports GMD_ID, we'll detect the proper IP
>  	 * descriptor to use from hardware registers.
> @@ -761,6 +774,11 @@ static int xe_info_init(struct xe_device *xe,
>  		if (MEDIA_VER(xe) < 13 || !media_desc)
>  			continue;
>  
> +		if ((gt_types_allowed & BIT_ULL(XE_GT_TYPE_MEDIA)) == 0) {
> +			drm_info(&xe->drm, "Media GT disabled via configfs\n");
> +			continue;
> +		}
> +
>  		/*
>  		 * Allocate and setup media GT for platforms with standalone
>  		 * media.
> -- 
> 2.51.0
> 
