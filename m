Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59970D2ECF7
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 05:15:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A59510E2B8;
	Tue, 20 Jan 2026 05:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P0peKMES";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C272210E2B8
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 05:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768886111; x=1800422111;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZTL9QidNTiCyykK1dDJnvQlTVc5hrK6Hje0n0iD7sGU=;
 b=P0peKMESgjCIjOcn8+G17S+2BxnozrQkGa0YPL/zSnqg8DeOt74AkuaE
 bSk8LLvoW/8fYKYXiFUHt+RwndNxn6BhvmglHflU0+qtLU2VPGi2zZ09H
 9TkFIOhh381EOgeJ8ZrhwSAjcMLoQe6QZRvlmZbxkgqIRC7LGHn9DvMrt
 WzBSRrHL/0NbBsPPDuqJuWjkSRbIjSLwgPkHi+N3UMxxdDbG4URYJUapL
 Uaob0meINeat9R+CjcknzFaeL5m02GBZ7wQJBYHYZy1n9CET+uBHS5J9k
 g8hvrpSfjXVYD9Ywx8y+uVnvkFXNJlq2MoaRhaqeS8y8KZOMbQpVW+AaD Q==;
X-CSE-ConnectionGUID: Mz90fp0lRW2cm/rWMS309A==
X-CSE-MsgGUID: xm9VZzlES5y9gEw4zWLndQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="69987300"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="69987300"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 21:15:11 -0800
X-CSE-ConnectionGUID: /V7bOSwFQg2kGyXC5MDeGg==
X-CSE-MsgGUID: IabwbG3mSSWBbz8pgaRjNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="210497816"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 21:15:10 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 21:15:09 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 19 Jan 2026 21:15:09 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.69) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 21:15:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WtPGBDPPKyfa869/YRVEH3kwSrYvbT50+trgLzIUK+3+c3974aGLxlvWG8cihbWz9vhDvwedWgoxjGmEPVFSZe4uRe22tiyFr6grg0zBfIjkUQuAx/hQzfdQuhT+RytWTGAC2m94ZwTBbNWmRbuhDnUI6d6voAhn/gafglNoxRHzNji4RbAFzIIeg6kXxzjU6kJcSFqils03J8Sm8xkBZcrTGWiL34EhYHXTaQL8wfReXx6SoTr6UV+IDR2WZiHfEDCNUoH/ANZZ9v0uUtRXVb1mOV3M5DQWHeZ17ojB0dNdbFi5s8bsG/G/Ommcs8WZCu4a6FDD/3lHb33wm/5M4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=au9FRvMnpnvQAjHj5aL/ItiXv3mebHBk4E4MbudCkJ0=;
 b=Y+e+5krRwzIyYl1qv1xNttfMRIuhLlrSVdAO7CTA4UXBnm1+MtmEkPefZeKe29d2rk3ZYBtpPE2XSoL+Z1kwE0AO0rfAVjSqG30RNFVO6OKtpg6GA2ReDL737exxiYM3KLm9ZT6d1joQx5p6xDAZtr/iXn0OR7iWMlZOeY+AmItY65oRZDFJeIUNlQz7JFlaxKQ5R01Hns+eEYduVo9dwmUPhEZfyyTnYF2U6moxSP/PgnyYaSemVbsA1HassSR993za9zxZYqfXJ8kVx7jPflkBP4+3zrihju21K/EnvR3C5pAi71ZUwTNHEN8GQA+3T4+6W6NniCi0Mx47QOOFEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 05:15:07 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 05:15:06 +0000
Message-ID: <2d11cf3a-a6c6-4f56-a48f-fb41f515f5a3@intel.com>
Date: Tue, 20 Jan 2026 10:44:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe/guc: Add Wa_14025883347 for GuC DMA failure
 on reset
To: Sk Anirban <sk.anirban@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <vinay.belgaumkar@intel.com>,
 <daniele.ceraolospurio@intel.com>, <nishanth.p.reddy@intel.com>,
 <rodrigo.vivi@intel.com>, <matthew.d.roper@intel.com>
References: <20260116103451.304716-4-sk.anirban@intel.com>
 <20260116103451.304716-6-sk.anirban@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260116103451.304716-6-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0266.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::14) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH0PR11MB4806:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c24e772-ec4d-466f-f8e1-08de57e2df7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0JOdDJ4VXFaWkdyRHBoaFJ6ajI4UjViNVRqc0tHaU9RYkJkZnpOcWU2cEFS?=
 =?utf-8?B?ZGoxSkpCMkI2TVRDNlpWbGlzRjhvMTQ0NmpaYnpiRnRKN3BhY0g2WnA3czhY?=
 =?utf-8?B?M0pEWDRqY0tpcmlkeVJCV1hmYk8zUjFITkc1endCYnZ4czZhQ3J1dHNMOFda?=
 =?utf-8?B?SVhjYUNpcVZEYXh3czh0MmIvWUlqdVlRejcvczFrNlpYWS9ra2RzK3BQdWRB?=
 =?utf-8?B?ZzU5ODAxRERNaVE5S0JmSTl6bE1mTmpMbFBNMHhramJEcGRVRmp5T2U2NDEv?=
 =?utf-8?B?eUFMUzFYMjRjODloODU0dzEvaDNyQ0JvTFpPMmhFdkdJTXF2a2RhRXZGVUcx?=
 =?utf-8?B?dFRrNVUrSlU1NmYxa0ducG9vZm51SU9PMjR5c3Q0THFxaXZSSldlNXpVaXRu?=
 =?utf-8?B?VGU4WXdiZVBobGVnZzVNTzlFNHhQZ3ppOUJ2cU40VHR3YXY0cXhRVEJBS2w5?=
 =?utf-8?B?RzNKQ0hIRlFFRUUvSXIzWE9ncXd1WmxkSU9EclF6S2cwaldzYklTWERCbXZq?=
 =?utf-8?B?Ky9CdW5YZmtDZ2E5cmU1bUVmekwySWhqbmlmMzFpRjZoa0xtZGwxejdmaHFw?=
 =?utf-8?B?cm1jOUlDYlRmdG43RTFpUENKYVczZm9DZnQ5bC8rZTYvRzZzNnEyaUZaNzNu?=
 =?utf-8?B?STY3ZUY3dDFGVEU2SkpOMnh5N0hpYzB2aWcvTDB6Z1JuOVhJVFNGc2J5c2Fr?=
 =?utf-8?B?M3I1MEhXVXpoOWpxRU02VVlZU3ZRbTljcmZDS0gxWm5sYWpnbkNzQTAyQU1m?=
 =?utf-8?B?amFCcTU1WGZFaVB4SkF4L3dBWEh5WGh4Ni80blV5WTNGWHo5QUp0dUF5eVZo?=
 =?utf-8?B?a1hRcTNVb3FRcm9Wc1VpSTNjVUkyd2dNTXB6MERnOTd0NWdabVdUUnRoMVlV?=
 =?utf-8?B?RmtvNWx0cnFiSFp6RnhuRjA4NnREaWlkMmtIMXdkWnNCZWEvREpPOURkNnF2?=
 =?utf-8?B?YVBMZjEzcjBsMGp1OEF2TkxVcjNqcTBQMmJXZHJsOHBYZ0g2NjAxWlJUOHpG?=
 =?utf-8?B?UjVaK0dlWlhTR1NwTEpSa1VmcmZrbHdBdDIrQzZTcVdDZWFLOGJHeGFhdnMx?=
 =?utf-8?B?ZUpXYzBxa1llUHlxQ0NMK21xdTNTaVdHRXBsam1XRkJqcS9pUzNSTDBJTVBM?=
 =?utf-8?B?VnA0c3NNTFdqMnFwd1o5dVpranRIaFoxUDk4T2lKaHRkaXpPbUxJRDZBSTdu?=
 =?utf-8?B?YkQ5QXZ1M3RvbFFlRGx0bzR3cmorcnhobHhRU1NFVE1WZ280dTJYZVdlWXhl?=
 =?utf-8?B?ZmNrMUNlNGJ6ZU1ZcGx3YmtWTHlHczhieWNyL0NKY2xaWlFrbnpuR3VpeWxm?=
 =?utf-8?B?RCttcHRURHpCVld4MzdHQ2FkTVQzamJTelRIQ1FvcThWVGtsZHRTR0lWLzFT?=
 =?utf-8?B?bno5TVZHWjJub2ZSVVpHd0F2STdDMEc5NENONFlTQW5uQTZ2WFhqMFFyUUQ3?=
 =?utf-8?B?aTEwMW9RQ3UxRldmb05HZVFQZVY5VVJOeXh6WnBPVkdpUmJySUwxYTA0YWZO?=
 =?utf-8?B?dng5bmx3M005NnZwRkVIQmZDNG1QNEo4QlBMNHY4ejF2dTMwU1NxNUJidHNh?=
 =?utf-8?B?a0VmeEJ5ckMyTEJzdnJSUUFWZEVlU3doMHVHcWd1Q2dVbDVFT093RG54a2xV?=
 =?utf-8?B?MWZhTHFLaHhTd1dHVTNvT1p3UFd0NzBRQW1KOENaeUVObGxtQjNiam96dzcz?=
 =?utf-8?B?cmVidnBxSG9CUzdGSWhndGJiRGFFYnVaNGk5dHZZWkM3bnVBWHh1M0RxRjVQ?=
 =?utf-8?B?WC8wSk1pV051ck56TUlKY0NSSVdyQmJJczg0Z1V4azhrZXMyN09PK1VzVVkx?=
 =?utf-8?B?ek5aZktuczB2Y3FuUFpRUFN6a0oxQnczZmtaSk1EbENPa1F6ZThoeFRocno4?=
 =?utf-8?B?eW9wbkNzOEJRRjBhVm5vY0xQd3NWSlVQMndaMCtaaHRzMVEvNGViSkJSV3pH?=
 =?utf-8?B?eEYvQ2VvYXBobThiL01VU0JwaE9mdW9TNGxVY21jaXowRkZWZWlza2k0MzNP?=
 =?utf-8?B?UXZ0aUJZV2tJcG1GOG1IS01iR250ZElTa0RYY0ZNd1NkTktkUUV0NzMvWlVT?=
 =?utf-8?B?cW1SbjBwdXMyUnJVZi9ZaEJVYzI5Uk94WkxzVjN4UjlWZTdYOE5nbXI2N0JK?=
 =?utf-8?Q?bUas=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXhMMVR2WVQ0NHBsR0QrWCt4blV4MUlYNDFSNEVSMmE5YlcvMEhMZW13ZWYv?=
 =?utf-8?B?NFNJUHpyaTFpVjlHdXVkZEp5eks0UEoyTHBtV1JlSjFscE9vZUpWRGQwRWRQ?=
 =?utf-8?B?a2pGZnJPZ2ltZG1NZUdPZ0xaeGdwOUdGUHZrWGhCcTJSSHhXUkxKT3JNNm9i?=
 =?utf-8?B?RndENzJ4YTg1SEFlaWRuMzRXVkJmYjk3aHlIdUFwcXczSEhSelRjcXk1Z1RN?=
 =?utf-8?B?NkROSXRqaWNMVTl3bkkvZ1c1OEFIcEJqcHorVXVEbWU4dTdveGJ6S010RUdI?=
 =?utf-8?B?dHlEbVp1MDdHYnhuSHB4ckl5bk8xWDhmVE8yYVJyWDQzdUNLbFNvUE1TWlBi?=
 =?utf-8?B?bHpRdmZ5WkM0N2s2RWxxRzZwQjg5VmlQV3lRRkMyMFVaVFdSU3c0SzVzcnh5?=
 =?utf-8?B?MXY1QUNqTlZ3ZFhVcGNVcTFqRkJlQVJ5Kys3VjhNaXhqb3lCVzJmeGVFaGF0?=
 =?utf-8?B?Q2grZVBMeTkyejNxVHZ0dXRqS0huRWtpZjhqVW1kYyswWWVPYnBHMWRkZlJV?=
 =?utf-8?B?SFZKTU9acThUUkdoeGl3VXZWdnhDcGhJUkxTWGRRYVFBQXJ0Qmw5THYwV0xi?=
 =?utf-8?B?c09QWmJaOFNXaG0vYXVuS1ZNSk1LaWpaOEd2TlFoYzRXM2pwYzVmYkI1NTNo?=
 =?utf-8?B?UFFXeEVaT3hGOTlQdFdkdk52N3VBNjc3ZTBIdkxyYWQzL2xHVUlRek1zenVm?=
 =?utf-8?B?ZU9tNHA3bmFHZm8rSnViUkJHbFNIZjN2QVViajRhZGlPNVUyWW41MXV6a3FK?=
 =?utf-8?B?eTA5WkNyeXZQMlFXNzM3WHZ0ZmVHQkNyMTIrcnhKSWswN3VxQlIwdmRDZWVS?=
 =?utf-8?B?RDgra29TY0doZG90aUxQZGlFVXpydTQxdmhOOGVYVFJjd0NWRFpqUFBhUEpH?=
 =?utf-8?B?T2dxOEpPUUJKV2pyTVhuWlRsUEpHRGFoS0Y4aTREa1dmeTk4NndlZlVyRzNq?=
 =?utf-8?B?bm1nVCtra2tEN29PSTVGN0NES3Bzbi96NlMwR3J3TnAwU0s0aVNTdXFUQzJM?=
 =?utf-8?B?Q1p3cUJvbWtoeG1JcXVlVG9CTC9IeGxLdEtONk9pM0pvOTlWbllqKzVJUzZw?=
 =?utf-8?B?RzFQVjgyTDF6ZytBang0aFQzRm9JbG9EMEtmOGJGZnE5bTJaN1ZYNDBFWjRZ?=
 =?utf-8?B?clFkaG4xREs3My9SMnhaNUpFVXljWFYrU0tXYisrT2VGcnZZRnpiY3hPd3RB?=
 =?utf-8?B?cnhVWGpRUktIbWVsZU5iNzVtV05LK2VEelYwdkJ5Q3ZRV0c2RHo3WmVmOEcx?=
 =?utf-8?B?dkhPM0tMc0ZkUGErL3FJMm5JWDdEMzJ2ZndVLzFFaGZ6ZU9VcnVGT00zUjgw?=
 =?utf-8?B?VzhMS0xMbnVyclIxdVNYcFI1UUk1V2Z2U2tMZFBvVDlRRUR2SjhDaDBRbjdK?=
 =?utf-8?B?M0NoS2pjSFdXbHNiWisvR0JISXVFVktNR0NrNzdwa0ZUZGJaQzNtRTd2SXlp?=
 =?utf-8?B?d3ExRlUzYWx1U3E5c2k1UWU0eHR2aC9WSS8rNlhnNFl1K2VYRGl0QWFIK2N4?=
 =?utf-8?B?VmE0YXpoNjVDcDZLQ085SzBSbUhQeGI0NDBvT05DWEVVdUdnaDRVK0dsdjli?=
 =?utf-8?B?VmdRMDc4MGxhWWV1Zk5IZUR0bFRlbVh6SU1JMnZZQk1RS1VjTjdISm1iQzY3?=
 =?utf-8?B?cTJ4UDFucGR4MUV0M2Y5dk1iNVVQZEVjZTZYM0JjQ3FoSCtMVUdvNEdQSm80?=
 =?utf-8?B?QndXSkRGQWFRSEh4UGtWOXIrQlRLVTdnSEFwZmVSeHgyaGJ0N3JmaDlxdHE2?=
 =?utf-8?B?cDl2NWNPMFBMN1AwMEVTM3pSTUF4NWxjSXplWEpvQnQ2MGxXWkJEVnFmQlNs?=
 =?utf-8?B?alJtcFcxTTV0SGZUVmdadlJPcjUwM0c0R3F5VjFyNHA0Rm5UcWp3U3VJdVJR?=
 =?utf-8?B?OFUzT0xuV0t3S01XSytGVTFzRU93ZHVGdk5OK29YVjl2MHRLQldiV1I5MWVY?=
 =?utf-8?B?NE1Xd3JtTk1tWkkvNVhRdmFKcFowV1lSQXBBMUVkc21OaVdWNjlucExzdDRF?=
 =?utf-8?B?Y0hXc3BFb0Z6dEVlc3FJbHVNb0FocFdCMHlIWC9KOGxOcnBZVmwrL1hBOGp6?=
 =?utf-8?B?d050TklQTG9kTlpwVmpjR0loSWN4aGM5YzJiMUJwVk9BQVovRHAzOXVPZFpr?=
 =?utf-8?B?cFdpWFZudGR3cDdoczh2aXY5dDRFVXRHNWl1MU1GakNhMEtEcHROOFI3RVJ2?=
 =?utf-8?B?TEg1VGg3V1h1clFRelN4alg3SC9CT3g0anJyVEVqSlRxOEsxaXJsek1keS83?=
 =?utf-8?B?ZkZpNGJoYW5LVUhHYlFBQ3JJdHV0bllsOUMyMUlELzgycHFkY3dXVFlaZ3M4?=
 =?utf-8?B?RUJxREtUd1pBUWNHUmdzQU5xamsxWkhYR0kvenhDV2FXcGxHK1FDUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c24e772-ec4d-466f-f8e1-08de57e2df7e
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 05:15:06.0678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nmHAS3L88bZwX14IeA1CIsjvxXXOSIMCy7Iw772Y/YMG+PAwfjiZSChJwdDiOu8VoM6BkQ+NPyYcnaF3PD6rcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4806
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


On 16-01-2026 16:04, Sk Anirban wrote:
> Prevent GuC firmware DMA failures during GuC-only reset by disabling
> idle flow and verifying SRAM handling completion. Without this, reset
> can be issued while SRAM handler is copying WOPCM to SRAM,
> causing GuC HW to get stuck.
>
> v2: Modify error message (Badal)
>      Rename reg bit name (Daniele)
>      Update WA skip condition (Daniele)
>      Update SRAM handling logic (Daniele)
>
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_guc_regs.h |  8 +++++++
>   drivers/gpu/drm/xe/xe_guc.c           | 30 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_wa_oob.rules    |  9 ++++++++
>   3 files changed, 47 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> index 87984713dd12..c9cb02f32f5a 100644
> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> @@ -40,6 +40,9 @@
>   #define   GS_BOOTROM_JUMP_PASSED		REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
>   #define   GS_MIA_IN_RESET			REG_BIT(0)
>   
> +#define GUC_HASH_BOOT_CHECK			XE_REG(0xc010)
%s/_HASH_BOOT_CHECK/_BOOT_HASH_CHECK/ the way its defined in Bspecs
> +#define   GUC_BOOT_UKERNEL_VALID		REG_BIT(31)
> +
>   #define GUC_HEADER_INFO				XE_REG(0xc014)
>   
>   #define GUC_WOPCM_SIZE				XE_REG(0xc050)
> @@ -83,7 +86,12 @@
>   #define   GUC_WOPCM_OFFSET_MASK			REG_GENMASK(31, GUC_WOPCM_OFFSET_SHIFT)
>   #define   HUC_LOADING_AGENT_GUC			REG_BIT(1)
>   #define   GUC_WOPCM_OFFSET_VALID		REG_BIT(0)
> +
> +#define GUC_SRAM_STATUS				XE_REG(0xc398)
> +#define   GUC_SRAM_HANDLING_MASK		REG_GENMASK(8, 7)
> +
>   #define GUC_MAX_IDLE_COUNT			XE_REG(0xc3e4)
> +#define   GUC_IDLE_FLOW_DISABLE			REG_BIT(31)
>   #define GUC_PMTIMESTAMP_LO			XE_REG(0xc3e8)
>   #define GUC_PMTIMESTAMP_HI			XE_REG(0xc3ec)
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 44360437beeb..42658a409556 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -900,6 +900,33 @@ int xe_guc_post_load_init(struct xe_guc *guc)
>   	return xe_guc_submit_enable(guc);
>   }
>   
> +/*
> + * Wa_14025883347: Prevent GuC firmware DMA failures during GuC-only reset by ensuring
> + * SRAM save/restore operations are complete before reset.
> + */
> +static void guc_prevent_fw_dma_failure_on_reset(struct xe_guc *guc)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	u32 boot_hash_chk, guc_status, sram_status;
> +	int ret;
> +
> +	guc_status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
> +	if (guc_status & GS_MIA_IN_RESET)
> +		return;
> +
> +	boot_hash_chk = xe_mmio_read32(&gt->mmio, GUC_HASH_BOOT_CHECK);
> +	if (!(boot_hash_chk & GUC_BOOT_UKERNEL_VALID))
> +		return;
> +
> +	xe_mmio_rmw32(&gt->mmio, GUC_MAX_IDLE_COUNT, 0, GUC_IDLE_FLOW_DISABLE);
> +
> +	ret = xe_mmio_wait32(&gt->mmio, GUC_SRAM_STATUS, GUC_SRAM_HANDLING_MASK,
> +			     0, 5000, &sram_status, false);
> +	if (ret)
> +		xe_gt_warn(gt, "SRAM handling not complete (GUC_SRAM_STATUS: 0x%x)\n",
> +			   sram_status);
> +}
> +
>   int xe_guc_reset(struct xe_guc *guc)
>   {
>   	struct xe_gt *gt = guc_to_gt(guc);
> @@ -909,6 +936,9 @@ int xe_guc_reset(struct xe_guc *guc)
>   
>   	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>   
> +	if (XE_GT_WA(gt, 14025883347))
> +		guc_prevent_fw_dma_failure_on_reset(guc);
> +
>   	if (IS_SRIOV_VF(gt_to_xe(gt)))
>   		return xe_gt_sriov_vf_bootstrap(gt);

Place WA code after IS_SRIOV_VF check to avoid applying it for VFs.

Thanks,
Badal

>   
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 5cd7fa6d2a5c..ff2efc7a68cc 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -73,3 +73,12 @@
>   15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
>   16026007364    MEDIA_VERSION(3000)
>   14020316580    MEDIA_VERSION(1301)
> +
> +14025883347	MEDIA_VERSION(1301)
> +		MEDIA_VERSION(2000)
> +		MEDIA_VERSION(3000)
> +		MEDIA_VERSION(3002)
> +		MEDIA_VERSION(3500)
> +		MEDIA_VERSION(3503)
> +		GRAPHICS_VERSION_RANGE(3000, 3001)
> +		GRAPHICS_VERSION_RANGE(3003, 3005)
