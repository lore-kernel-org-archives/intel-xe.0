Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982E4D4A609
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 08:56:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5989F10E10C;
	Fri, 16 Jan 2026 08:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ggcxlzpb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 438AB10E10C
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 08:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768553796; x=1800089796;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XFoJgvYqgOneATPlutpSBgWU/28uX7IHTHI1v1fktSs=;
 b=Ggcxlzpb8QTrWqIavWBKD6JY6t0Ddm0t+v2FnOJnSiQdJPWnhFsVLr0y
 PGFva/6vnhq1lKJCECz40kau72FZ1zfMBlaBl1HPXbtr+EmW2M8PU1iFC
 jvGw0s/VW3JifW+amEW9ZLpvGzSWiHjX0y1GIFf5KuIkMbe9vTsrjkrx5
 OaoxxfV8An37aB+8LD3xJOMBeti/wyxSthbMvwCui2Vu31pU80WTPJtl5
 Mz9hoEwwUQJzgRnYaoKb/s4eRwer0LRBnpoov+Bnbb3nnM8n+VS9Y+D6T
 lfBSisq34N3YkSir4oHpKJTqt73LSU9BOcTXdw7iOl02VvHU2UhNXJ7CT g==;
X-CSE-ConnectionGUID: OOKXxzYhS2yOK2F7IW4MEg==
X-CSE-MsgGUID: P26xI5gYSbeFMdtRkC0kgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="72454299"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="72454299"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 00:56:35 -0800
X-CSE-ConnectionGUID: +3hGfcexS/G2jwaTiJTmGA==
X-CSE-MsgGUID: lsBJsHEvSuS8cKQk69ad4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="235882667"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 00:56:35 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 00:56:34 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 00:56:34 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.21) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 00:56:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R35JEw3dAYytMIaoQ0QWNg5XYYnr6alwVkn4LZS6KjpiZAOpaezBVz44YqL1QoeTmKMLilF79K9xW//vjm/tkg5/BeiVmsWjNuGhSmi+YYWgORQnhxMCg0cDv7leMBQ9lBiQvb5biB8eF6TELcIsGaLRQh9M7vTZFTuJzCRtFhdjkXJtG6zVdOiu0Q9oBe2JBdtW3sBTLe46bxwQ4lC1spAlf+O/OO7F5sCxKpH4JeHP/e0tt1BX3vGVlOLu2jZH2B4iN+RlgRc4ggcdhd9duPN/BBiisujYqhz0+53X45MAzdj85blz+mkIKPbRL5ocyGzEGk/WPlzm5c7R6CzOBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+I1towcYvtg/stJYVnEoJMlr8NCV5yYkPTJygmDnCE=;
 b=GAxz3Iq1F+PnKefcyMgFWrYfVEhaHdnS62Ejt8fF2+m/eOm/N0A/OxCx8yhI9WU+lvZ7WD6WYnnoXlxo0EzilE8BPkW7o5GPm9HRyMrmgG5BdbCL1VPWOgqUD4B1t4qf8dyjbpwjjD+r2TaZFiEvY8RL+HYbi1EU6LFcSnPWdO5k9uQXK4+SdpOdGPYWxrR0tjWAPWywtD7fdnEbzkYvfeH7Az2dQhmfsZHgmv0WIky+z34JMXU1P3m3eR+niaBFXxPgnkmTk00XZX1B//59MKclscBeEa2VGeqHkLPiZN6lLmBAo+xk48ZVkl2wowt5AXe7v/Y6YIu9NbcuoEBBLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by MW3PR11MB4684.namprd11.prod.outlook.com (2603:10b6:303:5d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 08:56:32 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%4]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 08:56:31 +0000
Message-ID: <0c2516b7-bd75-49f4-b77a-183cf020262c@intel.com>
Date: Fri, 16 Jan 2026 14:26:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/guc: Add Wa_14025883347 for GuC DMA failure on
 reset
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <soham.purkait@intel.com>, <mallesh.koujalagi@intel.com>,
 <vinay.belgaumkar@intel.com>, <nishanth.p.reddy@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20260114130015.3917770-4-sk.anirban@intel.com>
 <20260114130015.3917770-6-sk.anirban@intel.com>
 <35fae126-1b3d-4cf0-9240-b1456c9ae37d@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <35fae126-1b3d-4cf0-9240-b1456c9ae37d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0191.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::7) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|MW3PR11MB4684:EE_
X-MS-Office365-Filtering-Correlation-Id: f71b94e2-dcea-4426-e916-08de54dd24d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTZ6dVFoN2VaQkdZQlBtdDdhZFZXSzhXWmtIdnk2QTdvbmg2aGtWMElwbEE4?=
 =?utf-8?B?dWVNejhGK2V4ZWMyWUlvN1RFaUNyOVJkcnkwNGp2TEoyWnJ4U2E0QVZ1bGN0?=
 =?utf-8?B?d1hpMzZkbmU2aWo2SlBpWUhaYjdoalhVNkFsRXlPOHRlWE1pbFV1RUY3MCsr?=
 =?utf-8?B?aFpaeDlNVk9vVG91ek0yWm9GNzFPaEN6SGFHRkVGMEdORGxIYlpMTUVpeGIw?=
 =?utf-8?B?R1F1OGFOM3BtVTlNeEE1dDhraS9maE82ejlpMU9Pa2NKSmRPZlRBRk55dlR6?=
 =?utf-8?B?bmdoMUp6RWhyTmdZMjh6Z2xsaG9vanI3QnNLODJjRXJwemVBa3hLTnZaUDdy?=
 =?utf-8?B?WXFqWmVmbG1Qd0F3RnRITTNsM2h0M1E0ME9JSVZkVTQwOU4yMDdxeVVTS3Zw?=
 =?utf-8?B?aHNKWmlVOEZSNndsd2diaGNIZGRhNmNFL05pV1hNQmlidEloejJXZjV3VS91?=
 =?utf-8?B?bmJMMWo1ZVhlZXRpeXExdGJlOGlrWkpnenoxTFFweFBUcnRHbEJDVWF4cy95?=
 =?utf-8?B?TGtLNk9BL3RjSjBWazdDU3l2cTZEbjd0SFk1ZTVuTit1d2hoeWNQZ3Ezd2Ja?=
 =?utf-8?B?U1ZRbjVMK0RINnVJQm1GbnVJR1NJVlJBT2EwaktIZk5yc0wvL09obXA2bTE4?=
 =?utf-8?B?cTlLOVBLUGlNaUk5UFlvdlduZjZxNUp2amlNdmdySzRMbEtsZm5xZmlRWHJF?=
 =?utf-8?B?d1ErL1JKemZ1eUhwdVZiYWVUcUVNRVgwNG4zbG14STExK3hRMFNSYWQwOHdN?=
 =?utf-8?B?c0N5ODlzM3pjUGg5ZmU5bTA2eFk4Wlh4RG0vb0ovWjBzK3dmaGI2VjVXdEZ0?=
 =?utf-8?B?MURReVk5Ymp1VTlORXJoVEdoTjYvblpId2RLYkx3a0RxRkR5RC9EWW9KRzVM?=
 =?utf-8?B?K2VPZVB6b1ltWHBDRjFCOTNkRmF1TWhST3NQT1dNT3pzU2pOK2lFdVl5ZHVr?=
 =?utf-8?B?YXJqclY5OGxJT3RNL0F5RzAzUWliS1F4OXVuSWd3czc5YUdOajhLVVB3bXI3?=
 =?utf-8?B?SGIrNDNlOFFPSTAvQnVBaHR3VW9EbEpBUVVkSjRzSEhYZHlPUEREVGpzekM2?=
 =?utf-8?B?SHpuMWRKWmNiMWlOUkNjMUVzWjBOa1dLUkd3ZUtPSWNzVjVpd1J6UVNXY1Zy?=
 =?utf-8?B?MTdTaVkwcUxieGVrT1QxbmU0L2lDQWJxVmhzamJkZmFSeWx4ajg5dDlHZ1BT?=
 =?utf-8?B?WmtoT0p3ZmdGUDU3ajc0Z1VObldCWFZHQkh0WGVRVi9WbjFvckFRNDdwZGJF?=
 =?utf-8?B?VWx5dUJnMS9ORldGMnYyNVp4cGUzMlFRSkRVYVovTzlSKzRNNzJUQkN0YnR2?=
 =?utf-8?B?UmprY0FweFFwY1lpZGtXRTRYaXhIb1BBelFvQ2FETVp2YVdMeVhQdDhXOWJ3?=
 =?utf-8?B?ekx3OG5aK240cjdiVlYwNUtuZm1NaGJ5dFVBMlFIR1d3OXEwTnc4cEowYkdX?=
 =?utf-8?B?WWpYKzFtTG5reDMxUE9odWFnUUxtNjZ3OEdGT3BZcTRjcG5sb29MTkFBaDZW?=
 =?utf-8?B?ZUJQR3Yzbk4vYTFSQ2ZzTU9lcXNjYTFuaGFjVWt2VFpiYkdHOExUYjRIa0Jv?=
 =?utf-8?B?YXl2L0pxT3dSR21yK0VyRXJlMlVMQTVHbXBxNmZyNEdaWC9JeVk4WWJUZDZp?=
 =?utf-8?B?bjZjSVIwUktuMDF6eGNINGg4QndCbDB4SU5HM2JHS05LYSt5dWk4a3l4OVJJ?=
 =?utf-8?B?TmlXc3YwVmtLMno2cWVSZFJxT3pWM3JYdkpRdHVRZnAvMVJvWUh1SGhQYjhj?=
 =?utf-8?B?MXUxZHFtNmZWSDBwWU5TcTNFR1o1c2VpSjY5c1R5NUMzcGh5aVpoZ3pFYm5n?=
 =?utf-8?B?UDV2K1Y4dXc2T2V1R3BGaDloQ0lKd1FMUFk4MzJwUjVvNiswbjRLNzJINFhM?=
 =?utf-8?B?Qm9ZMGxRdk02RzVBeXIzY1B1aFB2VzUzT2dQdzc2dlB1aHk4ZUV0c0xXRnJz?=
 =?utf-8?B?VFh0WmN0cEI1SFlVdmZWdTdLcE5zUWVhUzZZL1NXaFhuc1pNTEp3UjJ5T0Qr?=
 =?utf-8?B?VldmcGRvOEtaOXhCZUpJUW93TUs5YUVtc0dDWVVsT2ZsTkwwU3pHaUltdVJh?=
 =?utf-8?B?MVpRUW0xSVNvNVU2MHprMGZzRjVoWUJueXE1QnRlZVV1eU9BWWY3UEtuZ0Rk?=
 =?utf-8?Q?fJEQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STVuL2hmWHpEWnh6eU9NM2FtSGEzTldvMm5ZN0dOYk16OEI1Q1JoazFEVFd4?=
 =?utf-8?B?b3RwKzl6QTJrTm01QnRCb2E0eXJoTE5HNDB3aFJYK0VnMFhUM2RLUHJ5eXNP?=
 =?utf-8?B?UFBTR1BMcFNUaWtTRzY1Smdqbk9xY09XUzIvdXVjYmhLMU5Cb0hXOWRyeWFu?=
 =?utf-8?B?V2VpUTVOVU1oakJKTjZOZ3ZKMWdJQzU5SGNWQTJIWGcwc2hkWGlGTE1zOW50?=
 =?utf-8?B?ZDQ0SHAvcEtHekJTeXRGZUc5WGRuMTc0RnFuZ1hpQmxLWmVhVkVuL2Y3VHFl?=
 =?utf-8?B?U1lVd0h2eGFMNFV6VWVzTjB4SGdjSTZNYVZSb2QzL1FCR0JZL082RUZlOEc1?=
 =?utf-8?B?K3Q3a21iVUp6b3puZmZwMHpodGpVSHhQaVd0STA2Qm5IM3U5c2lnY1NWcURV?=
 =?utf-8?B?WUYwSFFEQk9nU0VrQjlnOXZRcFNyNEhxUm1tZHFvcnM3Ymc2TUJkTllDMmVU?=
 =?utf-8?B?cHdzWTdtTUpVYTFrU0xtdnlkbzFqV0hOZTlTcDBSZ2xqZEZGY3NHekVyT2Fk?=
 =?utf-8?B?dlJlY2JPZTZKNGM2b2ZMZUh0SG1OQ21Qb1NTNFJ4L0hqU0dLNjlmRzJPSVNP?=
 =?utf-8?B?eU85cHlCK1VoQXZDNmNaUmEva3YxemlaN3hkTWRUcVdyVDAxK3ZOY0NlUFdR?=
 =?utf-8?B?cmppbzVUbGRlckJJTVAwd05RTUo1UnhnRGV2clB5VTQya1p6K2tzcXc3cXdZ?=
 =?utf-8?B?ZGpnT1VJRStWaUdENTRvOXkyT1JCUFp5dWFiZjdSNExyNjNvNmN1b2RTcXov?=
 =?utf-8?B?OXl6cUFELzJZUi9yUSsrQzBPMzU2TUhtbWVxZmV5Q1ZDcWJGcXQ0VjBaeS93?=
 =?utf-8?B?aDA3RDh1U1B5ME1hTmNML3RSUXRlQ0hYZ1FKT2VnMThWYm1scktWZElQbVRH?=
 =?utf-8?B?VWZJODFXM2JzcjdIdXhUU1hvRXg2dFY0bE0wOWJ4dFdEdjZYWlNyRVZhQTR4?=
 =?utf-8?B?N25oTVFlM1laeUR5am1IcllldHZnc0tDckYrKy9HOFlRWHdDc3cvL0xFWjNF?=
 =?utf-8?B?Ym1LMkp3NjlqN0pZYlZPRytHbnN5ci9oa1JzaGlyUjRKL0c5d0RDYXZDNlZT?=
 =?utf-8?B?a0dTek5MMTJOTC8vN3cvTSt2MTZ4N2ZRSHpuUHBvSTErZVFNTzZYL1JyR0V1?=
 =?utf-8?B?ZkwyQm9lQU11Ky9LcmUrT2dsQ2tSdkN3R1daUE96cGlJa0xwVjJWcGhpaDNJ?=
 =?utf-8?B?Q1pXam1VbzkxcDNMaU90S0FSdUFpWHVSVERZKzFWMmZWUHFKOHdMUDdhQ3Jm?=
 =?utf-8?B?YUt0ZFBuYU00eU05WEFUbjgrdklqaVVJNGxhU3BaaDJ5VHhNNE91OWMrYUhQ?=
 =?utf-8?B?THFMMXdWajFiNU9xNExwSVhUWkFhWDc1MXdpdFpBYm8yL1piUjBLcHZVdDBx?=
 =?utf-8?B?MzJPSFRha0RNZ3QzZ0w2bDlOaWdUWW80WDdzV0tCeDJWVjUweXl5dDVDR01i?=
 =?utf-8?B?dzE2b0ovaHJqdWcyeDZiR1J5Nm5kakVJZXdpMy9FWFVlZG5VNzAyUTlVZ3c0?=
 =?utf-8?B?SnFaRS9LZlVoWVBqd1lDcEJqc1FNcjJDcHFxa0V4N2hoQVhIckpRR0tZYzZq?=
 =?utf-8?B?endyZHkwK2xnRmNMUkxudVRhZldqMlY2ejBOZGc3V3FPbmF3UVRaQkc0ZVR3?=
 =?utf-8?B?bE5JL3dYQmZwVlZXajBIY28yQU1jT1RlTXF5RjFldjhTOUtjcFdRRTF6OVFK?=
 =?utf-8?B?amFEcy9aYXJvSGZYeUpFSEgzS1ZqN2pIMWswV0VyaGtGVDNIOTExMjJVUmlY?=
 =?utf-8?B?NmZRbmRrTG1nU1JsZVJuNXBnc2I5UlpvZjIrNWdCYkh4WWtaRkttcmlPWHZk?=
 =?utf-8?B?NDJCWFFGeDJNdWZMK20wZ0hLMFNGZGFlalNleWxJZDdqY3dvMzR5b2pvUUt5?=
 =?utf-8?B?TndnYkN6SXRGaEtaVDdTMTRTcEtlRlVhNUc0ZWJKSnFEc1ZTWWloMUZ3SHQz?=
 =?utf-8?B?c05McmlmYUFGRXJwNzA5T083cUZKQ2RjMXd0UTJoSkVZVlJHcU9xdHNZQjhF?=
 =?utf-8?B?ODVleDVsNHVrV1ZGeU5jcXpURDZEazVCc1hLYnUvRTdzK3pyNnZQWmxGcnRp?=
 =?utf-8?B?em1Pb05qVC82Q1M4dSt6T1pyUzB5Q25mZStSa3piNlFudjFpRjFNOWkvMlAw?=
 =?utf-8?B?a05SclhlWG5uOXNuMTVPYmhSOHhGVVpCaVFRdVIvRG04alpPYW1ob0RBb01n?=
 =?utf-8?B?NEhieGlrU3VuVjJiUTZ0QUpScWNIQklQNFJFNHVGdmprV0x6WjhGYWRyU2h5?=
 =?utf-8?B?ckdVOGdqaWNrUGJWNUVIWnhib3FhcmEvOFRhTFBTcWpJWDg0SVIrdjk1NjZO?=
 =?utf-8?B?bEpKaFhpQTdsNXN4MVRXYjB4OS95RVdMUGxrdnl3UUZ0S2ZXRWU5UT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f71b94e2-dcea-4426-e916-08de54dd24d2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 08:56:31.8573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yOJbV5ULsY1eA0VLMywJmoZ490+Mv7c4yjm/9BODWCgOz6iZQiHy1tlXOb5eqm0xjJjbkXnSzDDUyPeEWlhnGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4684
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

Hi,

On 15-01-2026 02:51 am, Daniele Ceraolo Spurio wrote:
>
>
> On 1/14/2026 5:00 AM, Sk Anirban wrote:
>> Prevent GuC firmware DMA failures during GuC-only reset by disabling
>> idle flow and verifying SRAM handling completion. Without this, reset
>> can be issued while SRAM handler is copying WOPCM to SRAM,
>> causing GuC HW to get stuck.
>>
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_guc_regs.h |  8 ++++++
>>   drivers/gpu/drm/xe/xe_guc.c           | 37 ++++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_wa_oob.rules    |  9 +++++++
>>   3 files changed, 53 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> index 87984713dd12..2f38fd231083 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> @@ -40,6 +40,9 @@
>>   #define   GS_BOOTROM_JUMP_PASSED REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
>>   #define   GS_MIA_IN_RESET            REG_BIT(0)
>>   +#define GUC_HASH_BOOT_CHECK            XE_REG(0xc010)
>> +#define   GUC_BOOT_HASH_CHK            REG_BIT(31)
>
> The naming here is a bit confusing, because the register and the field 
> have basically the same name with the word order changed. AFAICS bit 
> 31 has a different name in the specs, so maybe match that?
Sure, I will change the name in next rev.
>
>> +
>>   #define GUC_HEADER_INFO                XE_REG(0xc014)
>>     #define GUC_WOPCM_SIZE                XE_REG(0xc050)
>> @@ -83,7 +86,12 @@
>>   #define   GUC_WOPCM_OFFSET_MASK            REG_GENMASK(31, 
>> GUC_WOPCM_OFFSET_SHIFT)
>>   #define   HUC_LOADING_AGENT_GUC            REG_BIT(1)
>>   #define   GUC_WOPCM_OFFSET_VALID        REG_BIT(0)
>> +
>> +#define GUC_SRAM_STATUS                XE_REG(0xc398)
>> +#define   GUC_SRAM_HANDLING_MASK        REG_GENMASK(8, 7)
>> +
>>   #define GUC_MAX_IDLE_COUNT            XE_REG(0xc3e4)
>> +#define   GUC_IDLE_FLOW_DISABLE            REG_BIT(31)
>>   #define GUC_PMTIMESTAMP_LO            XE_REG(0xc3e8)
>>   #define GUC_PMTIMESTAMP_HI            XE_REG(0xc3ec)
>>   diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 44360437beeb..b5ec08a16aaf 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -900,6 +900,35 @@ int xe_guc_post_load_init(struct xe_guc *guc)
>>       return xe_guc_submit_enable(guc);
>>   }
>>   +/*
>> + * Wa_14025883347: Prevent GuC firmware DMA failures during GuC-only 
>> reset by ensuring
>> + * SRAM save/restore operations are complete before reset.
>> + */
>> +static int guc_prevent_fw_dma_failure_on_reset(struct xe_guc *guc)
>> +{
>> +    struct xe_gt *gt = guc_to_gt(guc);
>> +    u32 boot_hash_chk, guc_status, sram_status;
>> +
>> +    guc_status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
>> +    if (REG_FIELD_GET(GS_UKERNEL_MASK, guc_status) != 
>> XE_GUC_LOAD_STATUS_READY)
>
> Why are we skipping this if the status is different than 
> XE_GUC_LOAD_STATUS_READY?
> During an SRAM save/restore the status can be different from that.
Thanks for pointing this out. As discussed, I will check only when 
MIA_RESET is set; otherwise, we will proceed with the WA.
>
>> +        return 0;
>> +
>> +    boot_hash_chk = xe_mmio_read32(&gt->mmio, GUC_HASH_BOOT_CHECK);
>> +    if (!(boot_hash_chk & GUC_BOOT_HASH_CHK))
>> +        return 0;
>> +
>> +    xe_mmio_rmw32(&gt->mmio, GUC_MAX_IDLE_COUNT, 0, 
>> GUC_IDLE_FLOW_DISABLE);
>
> We should re-enable this after the reset, otherwise the GT won't power 
> off.
I observed that after the guc reset the bit is getting cleared, so we do 
not need to re-enable it on the top of that.
>
>> +
>> +    sram_status = xe_mmio_read32(&gt->mmio, GUC_SRAM_STATUS);
>
> The WA says that we need to poll this register until the status 
> changes, not just read it once.
sure, I had a talk with Hema and a timeout of 5ms should work fine. I am 
implementing that and in case of timeout also
it will for for guc reset.
>
> Daniele


Thanks,

Anirban

>
>> +    if (sram_status & GUC_SRAM_HANDLING_MASK) {
>> +        xe_gt_err(gt, "SRAM handling not complete (GUC_SRAM_STATUS: 
>> 0x%x)\n",
>> +              sram_status);
>> +        return -EIO;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   int xe_guc_reset(struct xe_guc *guc)
>>   {
>>       struct xe_gt *gt = guc_to_gt(guc);
>> @@ -909,6 +938,12 @@ int xe_guc_reset(struct xe_guc *guc)
>>         xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>>   +    if (XE_GT_WA(gt, 14025883347)) {
>> +        ret = guc_prevent_fw_dma_failure_on_reset(guc);
>> +        if (ret)
>> +            goto err_out;
>> +    }
>> +
>>       if (IS_SRIOV_VF(gt_to_xe(gt)))
>>           return xe_gt_sriov_vf_bootstrap(gt);
>>   @@ -931,7 +966,7 @@ int xe_guc_reset(struct xe_guc *guc)
>>       return 0;
>>     err_out:
>> -
>> +    xe_gt_err(gt, "custom GuC reset failed with %pe\n", ERR_PTR(ret));
>>       return ret;
>>   }
>>   diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules 
>> b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> index 5cd7fa6d2a5c..ff2efc7a68cc 100644
>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> @@ -73,3 +73,12 @@
>>   15015404425_disable    PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
>>   16026007364    MEDIA_VERSION(3000)
>>   14020316580    MEDIA_VERSION(1301)
>> +
>> +14025883347    MEDIA_VERSION(1301)
>> +        MEDIA_VERSION(2000)
>> +        MEDIA_VERSION(3000)
>> +        MEDIA_VERSION(3002)
>> +        MEDIA_VERSION(3500)
>> +        MEDIA_VERSION(3503)
>> +        GRAPHICS_VERSION_RANGE(3000, 3001)
>> +        GRAPHICS_VERSION_RANGE(3003, 3005)
>
