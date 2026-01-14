Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBC0D3901A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 21:22:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E58F410E19D;
	Wed, 14 Jan 2026 21:22:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mJ5v5n1t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39BDD10E19D
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 21:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768425719; x=1799961719;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p8cj/Md+49RqahB4vkbEvZepwTINZDasdvue/dAbfsE=;
 b=mJ5v5n1t8NX9s8mwf6Od+c0THfV90WzcDhUt+tkSyOT/LM7wJHgZRYmD
 q0vDnSu4Sc5ynxEM3hxZhdJo5gOSahyPHjUB7JLuDPOdk0mPIbmnwsM1h
 d3z7Gmm9stKEvNC5B1RJS/wbAECUx9+n5tNIdfjQUnFw0Lmh8UilnOUMg
 l5jFyij2B9rTYfTlvJm92lUpTtNcQM2w+J2XkJCeuQM13Bfgq80NfA/nr
 Xd5P0DApEEXU8k6NzB4+Gvc63OOw2XbnmW8oCQYbc8hOb78klXvSoNAKQ
 cs3VaQ2rSY0Cr2WPQYPavE0jmevqq55Z51k/gj73sNaTJeQbxG0Tpxrne A==;
X-CSE-ConnectionGUID: Zd64k3NHQLqMDVQ4uG4Unw==
X-CSE-MsgGUID: yCJkWm5jRZGMrHAcZNoa3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80454309"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="80454309"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 13:21:58 -0800
X-CSE-ConnectionGUID: W+fE+5RbS4iaiFhTWQxTUw==
X-CSE-MsgGUID: AM2l25B1QFKCvTKXrZ7wEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="204000942"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 13:21:59 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 13:21:58 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 13:21:58 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.1) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 13:21:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sn+BU8hoQ4zEOcm2W2C2PDFu/cT/4Hjyzi4Aohm6Wt4b0EUcpcUkI0l7A/YPkVXqEHRAReTixcW/9CYe0onk+mFe4JMJzMz0jS9KQpfIR1ibRCeY9fXI5YDKPCUAgBL2xLcnPqbDdgC69lEjLvRlQEU+DPbYuKlvaJnXNVS/+3kakN33JvS/sMok3g1unO552AJmJi8guMDCysTrXc1SZ7RlGplkNmJoRmROXxSX+wjhGssHKh1JWupRCl/anJZBwBAat/UCmXgBjLSnWu5TGSFj76X8RT0MhfMslU0Slj0ISYUuVBqBijCbN/XFipUeIAHFZZr1gFSsuN74gmHWDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYb5abNkwliQ3qLZg/IqbEojDxAhmoUqobtDOGK5r0c=;
 b=RoDxY5HcJGpS31o+kt3KUT4bqWXxJucZ7boXDu28olBH764Rz//VetHzcVL+HYCMH/pOUDnhNWLZQKW46osp5ls8qgB4jWl04imdGG+sUSnRcJr7G6z051XEnzqAZD+jBLwNwfbNz6sj3wsegLbre1BCy911RV1BVDp15GpKNgJcJCGmAJEVZNmZp/0GLHkywsNbS+jII6PW2bm+Q8YbNei+mVr2ZvPdL+PhY9iIp5xCQG7Rek8RrrGb/8Hx1T/lW3PE5oRh0NotAQCnLm3cwowsvON1JSzinBJd97TxOHGRrxNJkagqRakHUp/4l9TrvEeoMRj9go4wa+mnf5uEwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by MW4PR11MB6620.namprd11.prod.outlook.com (2603:10b6:303:1ea::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Wed, 14 Jan
 2026 21:21:55 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9520.003; Wed, 14 Jan 2026
 21:21:55 +0000
Message-ID: <35fae126-1b3d-4cf0-9240-b1456c9ae37d@intel.com>
Date: Wed, 14 Jan 2026 13:21:54 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/guc: Add Wa_14025883347 for GuC DMA failure on
 reset
To: Sk Anirban <sk.anirban@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <soham.purkait@intel.com>, <mallesh.koujalagi@intel.com>,
 <vinay.belgaumkar@intel.com>, <nishanth.p.reddy@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20260114130015.3917770-4-sk.anirban@intel.com>
 <20260114130015.3917770-6-sk.anirban@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260114130015.3917770-6-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0080.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::25) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|MW4PR11MB6620:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a8efe40-5365-456e-f72e-08de53b2f143
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3BrT1VMSzhCaHRpMVNPem9UQlNxdmpYMnJHendLQXZWSTJrUkZueThmRTFk?=
 =?utf-8?B?OUppMzJkVG5qVW1wTnZvTjBKS3BEd1RyMU0zNEdNQ3Z1djhObFlqL3FKZXFQ?=
 =?utf-8?B?ekxUNW5lUHlxOXJlWWNKdy9UcVVNc3gwMHB3T2tUMm0xL0UxeUpBL3ZlMjY2?=
 =?utf-8?B?S0FwbTFDWHpETFZXMHIyc2s1RzlIUFJLK0l3QjVXTU5OaWt6cEhGeUFNWUhl?=
 =?utf-8?B?bkVvSVJBM21KQUFoaVUwNStUbXk4cFB5WU5BR0JkUS9nQnZmbU1xQTZDV3Y0?=
 =?utf-8?B?VzlrQVA0MXlDVlZuT2xRb0djWmNDd1ZMc2pUS0VRMFViUW9XQUVVUTdaaTJz?=
 =?utf-8?B?cGN4ZDVESTMyVG5IYXpmNG05eE5lSXZmRXNJUVNWTmFFZFFTV2s4L001VWI1?=
 =?utf-8?B?VFBBTUlJUkVSdU04Z0xaSmVqaHNSNTBSUW5sUjVydmVZNFZpbk9iQ1NSRW9L?=
 =?utf-8?B?ZzJqUENWd2pGS05hd0pxOEtLN3lkL1JKNG5DK3RPMHJ6WkxTMXVjS05IMUd2?=
 =?utf-8?B?Vzl3eEZjUjd4ZzVZQnBFOGdjMTBqNk5Sd1RXdi9naFl3TWZyVGpyWjJBRE9m?=
 =?utf-8?B?R3RoSFZMelpzMithSmRPaEloWDJHdEUwMXRnRXFyVjN6SUF1UWp6WHE3YU4x?=
 =?utf-8?B?TUFwZ3Q2Y0svMEJ5c3dzdWtSU3BBTURwM2h6TW8vMjN1akpGWnJSOWZuS0dX?=
 =?utf-8?B?RFNXWGRYbGZxeHNZcjhpbXhyaFZuSVV4R1Nxd2RMcDY1M2d2dDVDeTJieUt1?=
 =?utf-8?B?OTJqQURmeVF6WHdpRGxZQXZhMWxQRUJuaUZQc2tROUJlVnZ1TU10SE51SS9J?=
 =?utf-8?B?QmlWQldiSFhzT3lUb0w4bE9KNE9SNjlZOUppc2ozK3RXT05RY3pLalhHOFlE?=
 =?utf-8?B?WTZ6VStYTXQ5RFRlQkxIbHdVeDY4RDJ5dHJYeU42ZWk0L2V4MGxIRURHNFlV?=
 =?utf-8?B?N2pWUzF2YnlURlVER1ppZHRFZGRoZE5OQjQrWXB4QnRlRk1DS0h0RUlIS0po?=
 =?utf-8?B?OXRGR29uQTZwaEJrc3d5WGhxZ3B0ZmtoNEZxRXZuWit5dWFZRi9taE5ndWd2?=
 =?utf-8?B?SGlsUVpKNFNsRUFLUDVJaDV3WTByWXkwQzBkeUJVeTBhZFlaUFJvTHVvY2d0?=
 =?utf-8?B?RmlSVFNZMUdsNldaTldyeFhBMGxKcVlUblpRWEJyRHlaeDBYaURXMFZJM2VI?=
 =?utf-8?B?VWJDankzbVBzczI3eU1GaVZoSTBLOXJKNHhvZTZIdXhXQ2pqSTVtUzBmUno3?=
 =?utf-8?B?NkdCbzlkS2dKL0tmV0VSRkdKaWZlRmJjZGxseDZpQVVlUzRyR2hycFYrdGQ0?=
 =?utf-8?B?cXNoUEswU3pXMDdMOTJSRm5DelloSXFuT251d2pUMXlhZU1IVkdLQUVxY1Y4?=
 =?utf-8?B?Y042QnQycHpGWklkQjdkRjNoVFYzSEYzcmJvWUVxd0pWTWFuYkFkOVF3RmFK?=
 =?utf-8?B?eTVHSFR3Wmo5em9mL2RNTnVISldtRHZ4QktGcmZKTTlqUTlZYUVHYlppa29q?=
 =?utf-8?B?T0lGaDJ0Ylg1RXpPZFl1SXlFaERXcHByT0RqR2lpMlh4ZnJlREJ3b2k5TjVC?=
 =?utf-8?B?SUN0TnliMWtqclNiRW5PN2s1RmVoeDlwREcxbUVoOHhmODg0UEVLcGZXMDZs?=
 =?utf-8?B?dHdwOG40VE96VEtvaFFVZTdnT3RTRDlvSXI0Zm9kQzRQbHB0N3gzVDI2SWdz?=
 =?utf-8?B?TUcyRW9mY1VwU001bU5hekxEdHdkN1ZiaTR5UXpINFJ1OWs2U3lqR2loa0Rk?=
 =?utf-8?B?S29WS3U1WHlHQ0FLWEVIVExreHVYYzZGaEZtRUtjcW5OcXZHclpaZnVJaG1C?=
 =?utf-8?B?TWNMUTFsWS9CTDV5eGhKRVB6RWpzYk1sSmlEL29DcysvS0xhbFg2TytqcExu?=
 =?utf-8?B?K1BSVmQwMytvSUF1WTFPN2VKV3FzL3ErUUFPSjMvWVBZWTA1bWZpSEY4RXJN?=
 =?utf-8?B?SlZBeUxLNGhyd0ZrZU5TNzVrM1Q2VjlJQllqL0xMdk8veGRwNFdiQmRaNXAw?=
 =?utf-8?B?VmdDQUNKSzhaM3NOMmsveVJ3VnVDUGxOYmVrN25IYnpuZTJldG1PMS9BdmhR?=
 =?utf-8?B?dWhLb1IyNVhlNWdRYTZyVGRwUmU0blp5K0s2anhGQlB1c0hFY25Yc2Y5bEsz?=
 =?utf-8?Q?P0PA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEtzREJNQnlsazVDcUxldHErcW5EY09nMU4xN0MxMHA2V3ovblNjcXB4WnZr?=
 =?utf-8?B?dWVrdmVYajNHYmg5SHpSWThzZ1NPTG8zKytOZ29lOFNna0VYblA0Z0xaT1gz?=
 =?utf-8?B?Ym1SUjhZam9JeHpBK0ZZWFhmZTQvTWFsaldUUWdFVFVYU0RuRzNTMGZGWmZE?=
 =?utf-8?B?bDBhY3FvNDF4dlNDR21qSklNVzhsOWRuME52QldUUjhLcTNsVU1PNFFQOGF0?=
 =?utf-8?B?QXB5WHFROWZmZDVNODBSeHFsN0h0bU1UUDl3Z0t5VXVlSEIxVjRFenVzRmtC?=
 =?utf-8?B?a05heHdPNlZ2ajZpOXpBUTBuNEprbzZuUm5rUm1FeHVYQ2VGUHpycWFpM2V6?=
 =?utf-8?B?M1dUcDlCQXQ1S2Q4bUM3NFp3QmNyQk83UGp6VUVPQzdHbXNLWElJSFN5bFFG?=
 =?utf-8?B?T2xHQmp2OGZMeWpTMTdLcm9BWmZ6UkRJc1FPNmVQcENHdzNIS0FtckVodVlz?=
 =?utf-8?B?ZGJDRkljbit2Smhld0xwc2tzVzVXVms0YVF4T2JyQ2dqSHVsNExIWWZOcmY0?=
 =?utf-8?B?bmszMVBFSGFEQ09rbzAwbzgwK0xndnZ1WkxWbDc4STFvVDVtUitrRVVIZDRG?=
 =?utf-8?B?ak8wMUVUVWZRKzE2a3dTTC9aR2ZYdXBibVNlaFpXU3hiY2g5RjhsNEVIaHRC?=
 =?utf-8?B?Uit1ODZmU0NYM2pLMzQvV0RheThMdmsvWnZMRytzR21kUjg3WnZ1Z1MxRTdI?=
 =?utf-8?B?VTRXY3VuSFJSdCs2QnBqb2dxaklEeWxXbWtZNnlTMU1nbStZTTZIMXEzK0Zt?=
 =?utf-8?B?UkpadzZvdUxJREEvUzZ6M3FHaUM3Q0hyYmMweWh3c2djeHRZTjl6cWZwaENo?=
 =?utf-8?B?K2h2RSt4MmZwcGRKVUEvNDlCZlBENitBWFJGZUUxaE5MdjBWVTMwVVBsNGpm?=
 =?utf-8?B?QTNZS05oQWU3VDFHdUsveUhIaDd2U2dJaVVhZWtBcVJoT2svK1Y2YTFOSU9r?=
 =?utf-8?B?a0dkLy92Y0hEWlVTV0U0T0FKV2dnbEl3aCt5OVlOZUx1WFdxM2ZDblpjaGpi?=
 =?utf-8?B?RTJmdUNXYVhxNkhxWFJDY1B3Q0NGd1h1OVhmWm9JNW5UKzJoTDRzaThNN3Zr?=
 =?utf-8?B?SnhxbTVrNXJQWTM0dkZNbHJYb1ZzRlpuVHZjN3ZrRlJkanhFaDYrY0RDWmpy?=
 =?utf-8?B?THdxU0l5ZDZ3TW9GRHFEazNKd0ZTOGt2TmQvMmVDQVhyVi9zSmpIQlV4Rzd1?=
 =?utf-8?B?c0hWYThZcVhzZmltOEtSOW9lUUJzK25aaGxHQjdReW1qWUZKSGNkZXZOQkRq?=
 =?utf-8?B?VGRqYzVEMUcyb0JEekFYbnJhclpyajRLZ0FNL0NlOHVvOVRsRWpKcWNpZ1l3?=
 =?utf-8?B?a09zWlJneHZ6UVFIVnJLUkZ1M1RGd1FEZXA0cXFEU253Mk5ZL3N6QnBSRUVk?=
 =?utf-8?B?NzEydTR5RVZhU0RlakN3c3NsR0VjajBWeFJEbXE0ajlPSDJ2ODk1YzA3ZmFF?=
 =?utf-8?B?UllFak1OUmRQWWFTYm5BeFlZNXhrV1hlYy9TMEg5OVEveGRxWTMvNWxheHFG?=
 =?utf-8?B?Y1czV3VwV1d6cEZtSmRSLy8xVThkdHRmM3EzYVlsM0VzU0FjSTYrL3NRelo2?=
 =?utf-8?B?Q3QxbndrL29uL0l1UWJuTXpSbVRLZVJFN2JTZEFBWk9FSXZHNjZCbmxxUWxS?=
 =?utf-8?B?NFdlRzQ4NWtZWHN4MVNoNmlYYVVIS2JXY292RDU3d2dDWlQ4a09wQm5KMzRU?=
 =?utf-8?B?MG9ocE11VDh1M1ZnRVFpZXhhc01PellkU05mdFZIcEF6Y21qcExUazV2RThJ?=
 =?utf-8?B?L2lCeitVWUJmK2xaTE5Ta20vNXZ2R1Q3U3FlSHg5N1c5R2RSNzJyaTFmMVdh?=
 =?utf-8?B?YVg1Vm0wSFpmbXkreVMzUmhJUmcrUFRiZUJwOTh3dTJRU3pHNGQ3Nkw4Wkhw?=
 =?utf-8?B?TVhIZ3ljUThHbUxSVjVXUlhDK1pESGphVVlHRzkxakpsaUF6dlkwT1hXQm1n?=
 =?utf-8?B?djd4R2ZmNzJlNFNPOGVJaGk2dHordjU2Y1hMdE5KUHFKb2d5NExtWHQ3bHJV?=
 =?utf-8?B?RlpISkt4TXAxS0hadWlUQjBWMGtTaExtcEFMT0RuU1U2cEhyRTZpVVdIdUU4?=
 =?utf-8?B?bHM0bSthOFMxcXlpUENqTjlBRloxaEV5YW1veUZmQ29SYkx6QW1WNTVsWHo0?=
 =?utf-8?B?NHVUUzNrUTJUOUZiWDB6U3d4WVdFcDNnTkdKbGNDRlUweVpDYXlQMGo5Tnd0?=
 =?utf-8?B?WG5rNVlLWktiRE5qazVWTEZwbmU3M1JkYTRvcS9Yc01kYjZFNkQyZGxLVlZi?=
 =?utf-8?B?SmVPZUtLUGNxcVN5NEtrVjhkc0FyUlhXVkN4YVJCa1lYRnJOd1FkclF2OHhU?=
 =?utf-8?B?Qzl1cUJtUUR1TDlyNmVoUlo5ZStwWm5RQW54Wk55OG1Rc0Q2MEIwNXNEVm9v?=
 =?utf-8?Q?1qAWN82qaFWdwTYs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a8efe40-5365-456e-f72e-08de53b2f143
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 21:21:55.1494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eNs+vjghBuc+bFde++tpmKzb/FmotS9+bFwET2e7ZYU98+v5ldcNs28RaMb03n7rFmLxO8CSnKnsoFNQUZQOrO/Ubau6q6THZHsnXQnbDF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6620
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



On 1/14/2026 5:00 AM, Sk Anirban wrote:
> Prevent GuC firmware DMA failures during GuC-only reset by disabling
> idle flow and verifying SRAM handling completion. Without this, reset
> can be issued while SRAM handler is copying WOPCM to SRAM,
> causing GuC HW to get stuck.
>
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_guc_regs.h |  8 ++++++
>   drivers/gpu/drm/xe/xe_guc.c           | 37 ++++++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_wa_oob.rules    |  9 +++++++
>   3 files changed, 53 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> index 87984713dd12..2f38fd231083 100644
> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> @@ -40,6 +40,9 @@
>   #define   GS_BOOTROM_JUMP_PASSED		REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
>   #define   GS_MIA_IN_RESET			REG_BIT(0)
>   
> +#define GUC_HASH_BOOT_CHECK			XE_REG(0xc010)
> +#define   GUC_BOOT_HASH_CHK			REG_BIT(31)

The naming here is a bit confusing, because the register and the field 
have basically the same name with the word order changed. AFAICS bit 31 
has a different name in the specs, so maybe match that?

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
> index 44360437beeb..b5ec08a16aaf 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -900,6 +900,35 @@ int xe_guc_post_load_init(struct xe_guc *guc)
>   	return xe_guc_submit_enable(guc);
>   }
>   
> +/*
> + * Wa_14025883347: Prevent GuC firmware DMA failures during GuC-only reset by ensuring
> + * SRAM save/restore operations are complete before reset.
> + */
> +static int guc_prevent_fw_dma_failure_on_reset(struct xe_guc *guc)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	u32 boot_hash_chk, guc_status, sram_status;
> +
> +	guc_status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
> +	if (REG_FIELD_GET(GS_UKERNEL_MASK, guc_status) != XE_GUC_LOAD_STATUS_READY)

Why are we skipping this if the status is different than 
XE_GUC_LOAD_STATUS_READY?
During an SRAM save/restore the status can be different from that.

> +		return 0;
> +
> +	boot_hash_chk = xe_mmio_read32(&gt->mmio, GUC_HASH_BOOT_CHECK);
> +	if (!(boot_hash_chk & GUC_BOOT_HASH_CHK))
> +		return 0;
> +
> +	xe_mmio_rmw32(&gt->mmio, GUC_MAX_IDLE_COUNT, 0, GUC_IDLE_FLOW_DISABLE);

We should re-enable this after the reset, otherwise the GT won't power off.

> +
> +	sram_status = xe_mmio_read32(&gt->mmio, GUC_SRAM_STATUS);

The WA says that we need to poll this register until the status changes, 
not just read it once.

Daniele

> +	if (sram_status & GUC_SRAM_HANDLING_MASK) {
> +		xe_gt_err(gt, "SRAM handling not complete (GUC_SRAM_STATUS: 0x%x)\n",
> +			  sram_status);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
>   int xe_guc_reset(struct xe_guc *guc)
>   {
>   	struct xe_gt *gt = guc_to_gt(guc);
> @@ -909,6 +938,12 @@ int xe_guc_reset(struct xe_guc *guc)
>   
>   	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>   
> +	if (XE_GT_WA(gt, 14025883347)) {
> +		ret = guc_prevent_fw_dma_failure_on_reset(guc);
> +		if (ret)
> +			goto err_out;
> +	}
> +
>   	if (IS_SRIOV_VF(gt_to_xe(gt)))
>   		return xe_gt_sriov_vf_bootstrap(gt);
>   
> @@ -931,7 +966,7 @@ int xe_guc_reset(struct xe_guc *guc)
>   	return 0;
>   
>   err_out:
> -
> +	xe_gt_err(gt, "custom GuC reset failed with %pe\n", ERR_PTR(ret));
>   	return ret;
>   }
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

