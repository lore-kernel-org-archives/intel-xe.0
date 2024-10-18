Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020BFD30011
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 15:29:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A1D10E95A;
	Fri, 18 Oct 2024 15:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W0/S48Su";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 111E710E95F
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Oct 2024 15:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729265362; x=1760801362;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=fWTymm26qT/mehV84X00bh6iq/rAond1FXvDO31Z8FU=;
 b=W0/S48SutjbOr3VkWSbnay2fb7hrXYJYNGsbVwmcFebQVFWnOf9NgMst
 fL1yB/N74PyAICbuhEwT7TEyivFhg0xBZd5kuEK4OmHV4IQzPzzg1q7JV
 J71s1OTNzm2xG3DoKAlKsvWcuQr88hueQVigQo8mP5Cks314dVXK7xnCQ
 BL02N5Fhm2hSEZxWB9Yknk/I3FBHGZkDRNqCPnDQgeW4XpNybqtbs3eR3
 5YusaT3vca2G2rHJmj0C2y8lb3dfEmxQUSPCLGy4u3GXJj9L2e3rVI/24
 lOxRQyIXAT5MZ1ySufo7WkbueAa7wnb+78yVxvVl6jzGPMYWYoFC0grKd A==;
X-CSE-ConnectionGUID: 7/8cSCl0Sq+F5HLHQB06+w==
X-CSE-MsgGUID: zogFLNz4RfSaZbhWSh3ewQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="16416914"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="16416914"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 08:29:20 -0700
X-CSE-ConnectionGUID: l+lWToyYS6iuXodqiLbcyQ==
X-CSE-MsgGUID: uIDWPc6/TXGHTOcvkIZyGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="79040457"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2024 08:29:21 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 08:29:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 08:29:19 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 18 Oct 2024 08:29:19 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 18 Oct 2024 08:29:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yBG9LWrbMwrAeSN9xoLkNEM9LziflyxP0AwdTfDAW8NuezdlVRxvIHk1oV3cRYJrSuUBukmi3Li4lDJ2hj+AkpOntu3j7SFqvT/dj2eJsr8Ydj/M1laWGTx7a7koZvsRQFgThwZXc2HD1yKor9pby0h9mWHqTZyvavkqMwpe0fgzJkJoKlfqdWGKqAxA9bHcBWtCVHTVTzIEJ87DXKhVTpopp/C9Pa2Wsg8hk9VwNIkLGyRsIkVZu+q7GI1XrlCTOhpBMA8g2TTeQIXjlDWyyv476NwS5Lsyx0B0gJZIqlqvsrJa6nf0yu44Pl5X0T8iwsFBKNVcMC5hemfqMppTUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fWTymm26qT/mehV84X00bh6iq/rAond1FXvDO31Z8FU=;
 b=Y8aUsjkxuLmjscToNdF6El5fJ1MRFxttULQW2oDq7F++r8jGlgbpHadvPxUbNhKgbLcJMQagxCHVWaAki9Bets76/qKDhG8xmpEysmhT5sMk3OTKbVtU7HdY7Ah7l5txkKXSXVn6/BN23xKydEzqSDbkOw5HHouwC/uJw8Ikvb5wS9ksA94+4t7pB7I7UGBnw7cSYpAMBFwUrknwSrgZVJK8R0R8vKy47KqyqGrJin/BqJ/mICxML6jY2B3uD+0RfgY/XFPPll2TAtteNQ3LXJMm7XAW9FqxmAMdHoZ0jFdnMnSTEhqiOKxsY8itRLnBSGHY2izZh009R4MdcO9XvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SA0PR11MB4655.namprd11.prod.outlook.com (2603:10b6:806:9d::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.23; Fri, 18 Oct 2024 15:29:14 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.8069.020; Fri, 18 Oct 2024
 15:29:14 +0000
Message-ID: <cdddde09-428b-45b5-a058-3a7a8b80bf77@intel.com>
Date: Fri, 18 Oct 2024 17:29:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/ufence: Signal ufence immediately when possible
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20241018124710.1536948-1-nirmoy.das@intel.com>
 <2ef62119-1b98-4e5f-8218-0c99b4dbce36@intel.com>
 <52c18f08-0d8a-4419-ab36-9f072c54f9cf@intel.com>
 <9fb1e3a2-c4ab-4520-996f-b5d20f634093@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <9fb1e3a2-c4ab-4520-996f-b5d20f634093@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0003.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::20) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|SA0PR11MB4655:EE_
X-MS-Office365-Filtering-Correlation-Id: be0afdbd-252d-479f-8e6e-08dcef899f43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2I2cHFMMkVpZEYwY2xTMWF3bHJLMFErT0Q2Y1hxT2xIWnpPQXBDZFNFQ042?=
 =?utf-8?B?ci9rWElDMy9lTUVhYVlSdElla2RXQ24vZ0NYTndFNnpKNjl6ak42bXhmWi9U?=
 =?utf-8?B?QVRHVVlmaEhkWEFkZ1dLZHpXSXh4QTBlNFpTQnZuSUJoMHlOaWZKbXd2bGVr?=
 =?utf-8?B?di9ZRVdDWmdLRkoxcWh5MzBMYlZTcFg4Y21OS0dsSDVzZS9tN0poL2JLWjFi?=
 =?utf-8?B?c0RCSXBwNkFpTlNWTW5SUnRPU1k5QUZIS3pJVUFUbEZsYVg2MGtZbjMvUGw3?=
 =?utf-8?B?Y0tjMlhaMGRZVUxwVkRURWtvM3dPSTh4eGZYZmN2VnV6byszVFZzeW1nWlg2?=
 =?utf-8?B?QTYvcjRkNFN1OUxOOFJDekprNnNVdi9sZWVYSVlHSDAvQzZiQlV1TnpPbXJ2?=
 =?utf-8?B?cGI2amZKR0ZXZnc3WjQ1emVLeURVZDZ0YTNWT1RRWWlEQUkwUkFEanRDb1pQ?=
 =?utf-8?B?WU5FaDF5RkNlMzF2RzJ1WmxFam9pUmhrNjZ0TXdXY0JKbkVaLzA2OWFKbDlr?=
 =?utf-8?B?NVhOL2R4dFZNeDhVbUU0V3AwNUN5NUdSWGZwMC9VYmo4YUQvOVkvTTRpWHVp?=
 =?utf-8?B?Q1BUSU1vNUtuZ2JzK0lJQWU0YlYrQzBEUDFvWENSNWtiMktvWkJLQTZqclRP?=
 =?utf-8?B?LyttbHAyTW05VTFFcmc1VU1GM3lDUE9vZC9hejFhZXpUd3FhQlZhbi85OS90?=
 =?utf-8?B?SkU5WlhnSU1ndXVSeEMyK25hanlDUmoyaWF2NjJnNElseE1tTmJDeDFsVEJh?=
 =?utf-8?B?TG93TEUybXc2dHQyZWpJNkx0Y1VHSVNZWWlZWVJLT3dmbTBhZnovZHZKaitT?=
 =?utf-8?B?REQ4dk5OVDE5MlpMRmQvYlROMUdXcGcxRzJJazFqK2gvWmllNVhtaVRDUHho?=
 =?utf-8?B?OGQ0eHZxajhXSUVDTyswRmF2dGFWcUJodm5YT3RjeEpNRmxRdzVNZXB5bm9q?=
 =?utf-8?B?K0NsY245ZkY3a3BrZHVUT0IzK2lXaGNqaUtSRDlSMEZad25POGQrYkVWSE95?=
 =?utf-8?B?LzZOWkZtQlE5V3NQVDFQTDZCZmdsaFg3eTQ0YVRSVkRUSDFOTGs1RFhBOSti?=
 =?utf-8?B?c1VHMmlPTHNLdlRnaG1iMkxjYnNYd2lTK0UrRGNMVHNFRFh1T3BPc0lUT3VD?=
 =?utf-8?B?aHQwMkR2NmxnOWFRdGwyb0hzOU5ZUTROeGhnbCtlTDdQSTBCOUNqK1RzUEZT?=
 =?utf-8?B?aC9UT0oyVFp0WE1GSE9aaVNsaHJHTDRMWmg5d05NMWhlMnhpaGxES2tZUjlr?=
 =?utf-8?B?QzgvYzNITFlEQnR1U1F5aVl0ZzdHelE5cFp0QVRRcUltTDhlM3psZGx1SmhU?=
 =?utf-8?B?SFMzZC9sVTJIYUF3QlZVNUovT3A0VTRFaU9LUWloVUpVYVpqWWZieVNwb0dT?=
 =?utf-8?B?eVpScjVaMGdtZHNxWWxCcmliYndBOStEeVE0TWFzZlFLeWVHZVlmb3g1Q3NZ?=
 =?utf-8?B?b01NY3h4V09sUFdYaTlZSTExSkp6NXhiM1YrMGFxbWEyLzlZeEk2YVY4M254?=
 =?utf-8?B?Ly9mMnBFdGV3bGcweG5qL291YWFWV0ZWcHRlamlVTXg2M1FpOFNGRmJGK1N4?=
 =?utf-8?B?UXJheWpIeEhiNTgxUGlqVUhVelJpOEFVc0ZCbU4rbHpjWGY1TnZnTzBHK2dP?=
 =?utf-8?B?MFRqd2RqNUZOZVNIN3hrNjd1RXhjU1hPcHNDci9WeXQwYnI2R040R1RzbGNs?=
 =?utf-8?B?aGN6dnBjbjIraHUyUnpiaGx0RDZrbFVRYVJabERwRmJPeHozZXg2SVJnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VW1UZ1QyUkxxZjlIaU9DTXc3SFJETGZwTjV5OTQ1MklVbi9mYStqYmdHak13?=
 =?utf-8?B?SUY2WGs5NlJNZHBWYklFRmp0dmlsdjBFZVZBQnBDMFI3NlJKTDRhbzdYdE15?=
 =?utf-8?B?NmF5VWVhZEFaQWVITGhyNGlnMERWeXo1bVpSMURHVmUzck9GSlMyaUthM1Fk?=
 =?utf-8?B?ODFJNytpczliK3VITEllT1RrWVk2aDlJcEFNVlFabVpwSytxZ3l1SHZ3eHRX?=
 =?utf-8?B?dmN3WHFnRkpzVnJjb3V0ekdIRFVtQlhkbUl0SUVYTFlUTnExN2JYZ2FaK0s1?=
 =?utf-8?B?QTdSUlVWaGx0UmZSSnNIK2hVWDZ3M3YyK1RXRm9HeFE0a3dsRXQyN2V0b2Nx?=
 =?utf-8?B?bTRUSEo3enlHbk5Nc09QQVVWblUxTTh3d2tPUUl0dWNoMUF3RDhMZnJoRXUy?=
 =?utf-8?B?dUhpYVBjOUJwZjdwUFBNZ3JlcXJCbTNqK3dPREVUbVI5RWZ3dGV4MFljTTE5?=
 =?utf-8?B?eVR2SDRWSE1YM0FnZnU3eXZFaERETHUydTJJSXlpSy91MnltQlRvWjJ4TFNF?=
 =?utf-8?B?VkFuUHZzdkxFelhoK0s5eVJjL0FOejFmRm15SjhZODdNVklkNTB5UW1vUVU4?=
 =?utf-8?B?T0lmSG85R3MycHBYTFR4RkZLM1EyOVJHWTA4VDV2OXRXbXFaaFNGbG1UUWJn?=
 =?utf-8?B?ZUZ5ZHJiZ0NoUFBpREZGY2gvMVlORjljeDQwNFhnT2FrTlVwNUM0bCtZOUgx?=
 =?utf-8?B?eFYxbWQ5QzNYNCs4cVpsd1VkTFA3K05nNGdQcTJZa1dTRjhzVWJteFIxdzNV?=
 =?utf-8?B?aVRZT1UySklPZXFvdFpvaXN4MUNHdXJzajBzdEZTZDhoaDdXaDBPRE9sRG52?=
 =?utf-8?B?T0twb1J3QWNoSjA5OGVOUVRucE5mbE10MitZNzlrdm85bjRraFhoK2R0Q2JQ?=
 =?utf-8?B?V0d6eklycm5yRVpzbUlQUjI1NDdDY2l0akc3bHdKZUZUZDZ3TTNpMkdTYkFt?=
 =?utf-8?B?Zk0wblk3WVl0bzdIcnU0Y2xDb3JtTDkxa3JtNFdVUkNWUXRraUp4c3dVRUpy?=
 =?utf-8?B?MmxISktiQno3VDhUMmlaZFRyek9ML3Q2dlI0MVRqMzFwK1NhY1ZzSjFpOVhH?=
 =?utf-8?B?WW5HRjh6SGZYb003NVo1eENER0p1dGxYS2xBNlNEYW54K2Z2eGxxdHRScG1s?=
 =?utf-8?B?bzNSb25RUnFUanlxQnMyMUlvNG5ESFUwVEdOcjEzVnVCdEFENzVGZXZsQzdq?=
 =?utf-8?B?YTNoTDFVLzNOdFdYcis3Sy93MDNwa3laeVg3dDYwdFVJUHJXS20zZFh0bXdQ?=
 =?utf-8?B?eDBuMm1CYUllZmVKbzBGTDQ4MVdwZVhLam1kRit5WkxHUFZSM2J4MEcvK1Yw?=
 =?utf-8?B?R2I4U1o1S3hPSW5SS0kvQ0poM0NWaE94NTlFK25rUGVzUUNQODJ3Y3kzR2FS?=
 =?utf-8?B?N2ZjcmRGWExZcXRYTWJUdmtVSTFJUktMTlVLUzFXb1NrWjJlOHJxdGFnMEtN?=
 =?utf-8?B?NTh6U0g5Z1Q2VGwzZy9hbTlaTnhZSlZVZTQyZWhYUmhPV2E4Tlh4Mi9YUk5k?=
 =?utf-8?B?MFQ3bFdONFcxT2NWbWlWVUhKVWVPdmpMejVlbVFPQU9CWGtmVnQyUitVZE9a?=
 =?utf-8?B?UmpJQm1mMWg0dkZxdVJNN1RBdWlsOE1XUjFrTFBDc0FkZkJGUzBpRjZBOFlQ?=
 =?utf-8?B?bWRKUXQxT2owSjRydS9wWmNqWFdSTHk2ZG5VR2Jjeko4bVZlOUtmWVFXNkx6?=
 =?utf-8?B?aEJ3a3Y1NG0vSUUrSnVhcERaRytuOVJxZ0tWZmdQdG1Ja0ZRRlhtV2hHdXVD?=
 =?utf-8?B?QkVWc0lBeXNZOEhCa3VHL29ZVmVER1lVTDRDRDQvRVU3ZXltVGlnMEZoQTFq?=
 =?utf-8?B?RmMvV0FBQUZGZnFGUCt0NllFOXpvamVQck1jZDhNa0UrcHhPSXlaZWFMM1p4?=
 =?utf-8?B?WnJseUxBOWFTenBmUnhSbTlxV2Q1Mmt4YzN1ZXk1VmVKc1B5RlAzRHNKTVRZ?=
 =?utf-8?B?Z3RJVUxIWWFDaWpaZVRSVVVWNCtabWNSMk9vUWdLUUFHeWJPalJKZUZDL0ZP?=
 =?utf-8?B?S1pyYU1wbHRzcG9Nc1VWMUo2cHJWcjFjV3Y3N3M2dzNZSk1YNHJXVUtvbFYz?=
 =?utf-8?B?UWpUWGQrem1WQXgyTXptcFpZeWJBNGQ3SHd4enBOTy9pN0Q3Ykt2bUEyN3k0?=
 =?utf-8?Q?10YqrHfXvF4tcAeB+tM++HJ1l?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be0afdbd-252d-479f-8e6e-08dcef899f43
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 15:29:14.4471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nGgQF7yJOp2+ckrcNjMNJ/Q3xVBmSkbaeziVl+TDNM0SkO6eaBIi7HwVvHSKiJ6CfYIk75nd6QTFZcX3AYBJLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4655
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


On 10/18/2024 4:53 PM, Matthew Auld wrote:
> On 18/10/2024 15:40, Nirmoy Das wrote:
>>
>> On 10/18/2024 4:23 PM, Matthew Auld wrote:
>>> On 18/10/2024 13:47, Nirmoy Das wrote:
>>>> If the backing fence is signaled then signal ufence immediately.
>>>> This should reduce load from the xe ordered_wq and also won't block
>>>> signaling a ufence which doesn't require any serialization.
>>>>
>>>> v2: fix system_wq typo
>>>> v3: signal immediately instead of queuing in system_wq (Matt B)
>>>>
>>>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>> gc: Matthew Brost <matthew.brost@intel.com>
>>>
>>> s/gc/Cc
>>>
>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_sync.c | 15 +++++++++++----
>>>>    1 file changed, 11 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
>>>> index c6cf227ead40..069c1e4ebea5 100644
>>>> --- a/drivers/gpu/drm/xe/xe_sync.c
>>>> +++ b/drivers/gpu/drm/xe/xe_sync.c
>>>> @@ -72,10 +72,8 @@ static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
>>>>        return ufence;
>>>>    }
>>>>    -static void user_fence_worker(struct work_struct *w)
>>>> +static void signal_user_fence(struct xe_user_fence *ufence)
>>>>    {
>>>> -    struct xe_user_fence *ufence = container_of(w, struct xe_user_fence, worker);
>>>> -
>>>>        if (mmget_not_zero(ufence->mm)) {
>>>>            kthread_use_mm(ufence->mm);
>>>>            if (copy_to_user(ufence->addr, &ufence->value, sizeof(ufence->value)))
>>>
>>> This can end up in a CPU fault handler? There might be some locking issues if caller is say holding dma-resv. For example the caller in xe_exec which is holding dma-resv. If it can indeed hit this path, then we might get some splats/deadlocks, I think.
>>
>>
>> What is the connection between writting into ufence addr  and dma-resv  ? Trying to understand this locking problem.
>
> Basically the user can have the ufence be an mmap address from a BO, so it can basically hit xe_gem_fault() here. The mmap lock should already be tainted with dma-resv, so might_fault() should complain.


I see what you mean, haven't thought about it.

>
>>
>>
>> it looks like I have to use a worker anyway to do kthread_use_mm(), https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/bat-atsm-2/igt@xe_exec_balancer@no-exec-cm-virtual-basic.html
>
> Yes, exactly that just with might_fault() in copy_to_user. Good to see that CI caught this. From the logs we can also see the exact dma-resv splat as per above:

Back to the previous rev but with the bool as suggested by Matt B.


Thanks,

Nirmoy


>
> 4> [233.110447] xe_exec_balance/3613 is trying to acquire lock:
> <4> [233.110457] ff11000100085998 (&mm->mmap_lock){++++}-{3:3}, at: __might_fault+0x43/0x90
> <4> [233.110481]
> but task is already holding lock:
> <4> [233.110491] ff110001231a1da0 (reservation_ww_class_mutex){+.+.}-{3:3}, at: drm_exec_lock_obj+0x88/0x2b0 [drm_exec]
> <4> [233.110517]
> which lock already depends on the new lock.
> <4> [233.110530]
> the existing dependency chain (in reverse order) is:
> <4> [233.110540]
> -> #2 (reservation_ww_class_mutex){+.+.}-{3:3}:
> <4> [233.110558]        __ww_mutex_lock.constprop.0+0xe1/0x14d0
> <4> [233.110574]        ww_mutex_lock+0x3c/0xa0
> <4> [233.110586]        dma_resv_lockdep+0x1a4/0x340
> <4> [233.110599]        do_one_initcall+0x76/0x3e0
> <4> [233.110615]        kernel_init_freeable+0x3dc/0x690
> <4> [233.110632]        kernel_init+0x1b/0x200
> <4> [233.110645]        ret_from_fork+0x3a/0x60
> <4> [233.110658]        ret_from_fork_asm+0x1a/0x30
> <4> [233.110671]
> -> #1 (reservation_ww_class_acquire){+.+.}-{0:0}:
> <4> [233.110689]        dma_resv_lockdep+0x180/0x340
> <4> [233.110699]        do_one_initcall+0x76/0x3e0
> <4> [233.110713]        kernel_init_freeable+0x3dc/0x690
> <4> [233.110728]        kernel_init+0x1b/0x200
> <4> [233.110740]        ret_from_fork+0x3a/0x60
> <4> [233.110752]        ret_from_fork_asm+0x1a/0x30
> <4> [233.110764]
> -> #0 (&mm->mmap_lock){++++}-{3:3}:
> <4> [233.110780]        __lock_acquire+0x1623/0x2800
> <4> [233.110794]        lock_acquire+0xc5/0x2f0
> <4> [233.110807]        __might_fault+0x63/0x90
> <4> [233.110818]        _copy_to_user+0x23/0x70
> <4> [233.110830]        signal_user_fence+0x46/0xd0 [xe]
> <4> [233.111108]        xe_sync_entry_signal+0x14e/0x1b0 [xe]
> <4> [233.111366]        vm_bind_ioctl_ops_execute+0x3f8/0x910 [xe]
> <4> [233.111665]        xe_vm_bind_ioctl+0x1623/0x22a0 [xe]
> <4> [233.111951]        drm_ioctl_kernel+0xb1/0x120 [drm]
> <4> [233.112052]        drm_ioctl+0x2e8/0x5a0 [drm]
> <4> [233.112140]        xe_drm_ioctl+0x53/0x80 [xe]
> <4> [233.112331]        __x64_sys_ioctl+0x95/0xd0
> <4> [233.112342]        x64_sys_call+0x1089/0x2060
> <4> [233.112355]        do_syscall_64+0x87/0x140
> <4> [233.112365]        entry_SYSCALL_64_after_hwframe+0x76/0x7e
> <4> [233.112380]
>
>>
>>
>> Regards,
>>
>> Nirmoy
>>
>>>
>>>> @@ -89,6 +87,14 @@ static void user_fence_worker(struct work_struct *w)
>>>>        user_fence_put(ufence);
>>>>    }
>>>>    +static void user_fence_worker(struct work_struct *w)
>>>> +{
>>>> +    struct xe_user_fence *ufence = container_of(w, struct xe_user_fence,
>>>> +                            worker);
>>>> +
>>>> +    signal_user_fence(ufence);
>>>> +}
>>>> +
>>>>    static void kick_ufence(struct xe_user_fence *ufence, struct dma_fence *fence)
>>>>    {
>>>>        INIT_WORK(&ufence->worker, user_fence_worker);
>>>> @@ -236,7 +242,8 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct dma_fence *fence)
>>>>            err = dma_fence_add_callback(fence, &sync->ufence->cb,
>>>>                             user_fence_cb);
>>>>            if (err == -ENOENT) {
>>>> -            kick_ufence(sync->ufence, fence);
>>>> +            /* signal the ufence immediately if fence is already signalled */
>>>> +            signal_user_fence(sync->ufence);
>>>>            } else if (err) {
>>>>                XE_WARN_ON("failed to add user fence");
>>>>                user_fence_put(sync->ufence);
