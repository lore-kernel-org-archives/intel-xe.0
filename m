Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF9E606A321
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 14:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Atkp2QJk;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=nMN2NGRG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6752410FCB5;
	Wed, 25 Nov 2026 14:21:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D4C10FCC7
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 14:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795616449; x=1827152449;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9Cj5+f4IQk7RANkuMRji0I4GU3ZTo84etqi5jaE6rO4=;
 b=Atkp2QJkPmjkVtwNXOPtgOykRPNoqcTqdWg798RjkBJVJuZMrq4zh7bN
 IBOEl0gQcPYrfxs47WmaGj3tSQEfeETDb/lEvY4K4KkJxAz5TntxyrfOj
 XbOxb43aYodz78FnKZtkULRGS7Vt/ZvhtOhQUNLeChQMJ+qE5D7vn2lOH
 oMWQ3818vZDSU7sMAt9i326RQ+UZa8g1P2N8hshrVoHQHzz5gFefg8szh
 M4Sa0h3WGOhPcYzZL3hb97TBct7EDYBMCMRlrBlRwknFXikqbd6+YPsv3
 cXRx4tYtMkeTiHWErIY5PdoGIp5Mwqp1F5KBZ8UNGxKmlDoBuwPfxMKiZ g==;
X-CSE-ConnectionGUID: on30dk7tQRub0SXvjBeLLQ==
X-CSE-MsgGUID: ymVXasM/QC+K3GhsfHygTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4386040"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4386040"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 06:20:48 -0800
X-CSE-ConnectionGUID: fnNWNcQeTLOWsi0fudrddg==
X-CSE-MsgGUID: CKZoKl25SIWaUg42aPqJ5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; d="scan'208";a="12317286"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 06:20:48 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 06:20:47 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 06:20:47 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.61)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 06:20:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yLjsPKyyqTkkn0tlfIWdRiaYrFKdapppli533NvCHO3fWl6n+KB80soaywLgTWmIWJU0vOHIYi6vKtfm5fRwlPDP3Vp1XNvJbbaFWAwd/7i2qEmHGldnxVplTGMMLJ2MRiSC6nLLoUNIpUx4rYRW2JOnJheVSZO4c4reaDl47ZpRDush89JXF1yjH0ULguedP7TkWf+//8590CNB8dKpDObkhUd1G/76Gk+ao8HKdc3wUFSaxgDWuAhDmnLp8CsfwZRwvhJe2axK/TqwsXG8zsry9UiiXHt04kPmQzIoVUb+iOriEd1zJaDe1jLJ56oCFxBjmvJalUiY3aPkioyshg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JrHSZwun7+A9ncE2BHglzOZA/xxZVQGHxlAbQcXoMTk=;
 b=pmQ2hhem0Oj6Vsd18whe29LMwQTHPQ7M/CHAOC7Qg0lNt8N1Gj7XOQwdGDmDPCTNbG/D2ZI+7OU+G7p/qQP8Fzy4hGypxurhRswnTv+W5FvaGp+oa6JnSui/89OSK8jY9POjJ+Awkg6Dafz71MJ3ATsHhVVs/hC3Obq2Asj44v0QnLxirvvnOqAuo9K2oBsxyoepdbHumtwcraIr5qy/qHd+aqd+79+qAepuR2TgdNfIEEd/TKTpIg/OaDMJ7GL++yv9cjthG8rtISfvTXKrNuPKxJF58o75jJ8Bp8gosEXwJCwwxqv7C/XZjcBU8M8exltNHrHK2sIyP1uUo1PXow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JrHSZwun7+A9ncE2BHglzOZA/xxZVQGHxlAbQcXoMTk=;
 b=nMN2NGRG368v4HMy7DxfOGpvfbifzwdDOEcIPiJwP4cKePMpYuj0Gp9k/39/roXo0g+eHyeTW44OHnlyVQiDEc1PqCaHCtZnGAWqgj0cZLeMGwYHTpkB0rfX5ZuSyU93ylRxYCL+qCyKip12ZrLzuy/ar7YyzZtFCeZZn4XTl+0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH8PR11MB7048.namprd11.prod.outlook.com (2603:10b6:510:214::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.14; Wed, 25 Nov 2026 14:20:43 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 14:20:42 +0000
Message-ID: <87e188ab-efdc-424e-9d18-8ec610a7bbb0@intel.com>
Date: Wed, 25 Nov 2026 19:50:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/survivability: Fix infinite loop in aux info
 traversal
To: Sk Anirban <sk.anirban@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <hiresh.kumar.yadav@intel.com>
References: <20261125093252.4188423-2-sk.anirban@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20261125093252.4188423-2-sk.anirban@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0067.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH8PR11MB7048:EE_
X-MS-Office365-Filtering-Correlation-Id: d063ad00-bc05-4753-cb7f-08df4aff48d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10067099003|261026140227099003|56012099006|11063799006|261028144727099003|261022105027099003|261021121427099003|261021123027099003|261102123227099003|22082099003|6133799003|18002099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: ZZh+3+RTo25VMPlVpaqh5G7Dcx/Uz6T6hmBiGUA1bJtf4Tl/GCM2EmQj751EptwoqoZMrnSMx/hdHNjM3dkE/yK0cabRtFDqGmFexfuO7pYZM3YtBHZgKkDHn9iLBuPtkPe43tosEOD0RfSxHchcIuYhkqP4aLJ9++Zdfv8BPl/LMhj5uplqKxYYzycgEZcEdLSztW1c6E+JKSR8MDvUNvN2a+AM3bh8L3akaHtzsw605bJ04KjczyYfBRGoPELgEHolPNWVKUkgHDz6XaidLkf9SeNDTofOrYWzwM39iB7B5gteRq1XvhFYThduh2b61e2NXiDqVKHAT44bHWbO2YZS0tfX1Xlc5PvssgOcZxYeDm8O7ctlpBD2FjwKNbvqSi1ixoIzBTrnHcVMFi+hkCSRHJ7yCHhw+MJwCO5Tm5ZP5MAnbgjFH3BkogkV8IbRIVT+6+quFK4kIiH1+MfEITtffdtlNNadtaUdJ9XZcsZnpZpEYh5OpS9qnPJ1mr0ojWrZQ8aDZGFKtFcgcsYaOuk6MFG8cAsvzZwBHuGo04oOp0FPLNXXG6NJ2v1Y8sH6kcKG+PzQci46kjl0xivhxnITqpAx0gKUDbGt9a67bJ0TodmyMHuo+mTr7xKa2DkkyNiahZ5Blkg9yjT4dtTuYD+Ww2LsTC97/SkKNvI4HmU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(261026140227099003)(56012099006)(11063799006)(261028144727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261102123227099003)(22082099003)(6133799003)(18002099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NklVbDdINEhzUHArSVJUbEhUb1dKZW1wd2VTTHBLQ3RqaGptY2lhZXVxRUZF?=
 =?utf-8?B?ZlZDeFU0c0oyWDQ4REZhWUd2S0ZEVWNKdzR2b0NicnpmUWQ3L0VnaGlRZlgr?=
 =?utf-8?B?em1vRFNXNnpUbTJ6TzhXczJFZmJubmI4Ty9tKzJJQzVETVQzMlVUZ1RvR1Fx?=
 =?utf-8?B?NFVhSlQwRHNQWE94YnNUcXExQ3lzUXZ0aDJ1K2JFVk5rN1djUG1uWDVpdDgz?=
 =?utf-8?B?K2xQZDFtcnV4OHEycmpoTDRYK0dkMTdic1dUNUxGMHh2NU13UmZaSnM1TE9q?=
 =?utf-8?B?WG9vWXlvakQ5VlY4cFVRWjFXZEJuVHZlTHlQWVZ6a2htTG45MTlKanJhYU9V?=
 =?utf-8?B?Z1lzK1c0NzRIeDc3cUlaUU0wOEZHZHJRcWtiVHcwL2RVUGQrYWVzUWRpWTFz?=
 =?utf-8?B?TDN1UmdUSHZncUtRWlRBakcyMXE5RzQvOWpPTThKTWJpZXNWaHVTVGxxNnJx?=
 =?utf-8?B?Wnd5OWI2b0h6SE1yYXI2QUFoQjdsSTErYzhKZlFBUUdZRml0dkl6RFdiUUxI?=
 =?utf-8?B?WUhSWWc0cy9PZmtvUWQvOW0zSEI0OW42VEVHQXdTejB2OXAzaGg0Si9vNThH?=
 =?utf-8?B?cDRualZKY2hmWkV1Q3ZrV1ozSHR1UkhWYlVPV3JSMEtRRy9pZEdJbHdLTmEz?=
 =?utf-8?B?VWtwRlV4Y3BoRkdUai9uUEpXeUtYMi95UVZ5YnB6YjlueVd6d1Z6eEloVC9N?=
 =?utf-8?B?OVhoT05WTDVQKzRJYTJlOXJQOTZnYk5iZGdmQStJTVFUeTdiQnFKZHJyZWt0?=
 =?utf-8?B?SkkvbDQrWG0ra2RCTmYwMjFaZmhLd0tYZ0E5QURYZ3FFTXJUQkQ4VEpGbE9E?=
 =?utf-8?B?MmZvcVA3Vk1Qck1LZE5La0FleUQ3ejV2NHQwRjBad0dkOVBNY2JITFUwNisy?=
 =?utf-8?B?YU9xREt3ZnRPOEtDb25FZzFYTmJIaUxMN0hFYi8wUkh0SS9NN3ZCbnVIUGpY?=
 =?utf-8?B?OElXc0UrV1IvaE1TSkxGMTR2eVNVTzZGeWt4eFl4cjZpd2pFcVVqUDlFRHpy?=
 =?utf-8?B?blcwa05BR0ZIWHZCaVRXY0hOUmcvaHY1a3ZqeHBMb3AwU0ZxUTNseENqMy92?=
 =?utf-8?B?cXJlc1VXaHEzblJNbDNhOTJjd1grWS9KdjZCNFJzbXhYTzY5TWxWTkdOL1NU?=
 =?utf-8?B?b3l3SUFLTE8yVEEwY1hXU2J5dXJiVWlEOG5KVVJySWVkb1g0OUg5b3F4VUgy?=
 =?utf-8?B?djBpUy9SdnVYL1B0OUI4amVxZUU4a1R1L0VDaHl3U2p0elZWbVBQV0RyVjds?=
 =?utf-8?B?UVg4eTEzRC81Z3Y3aUptb2hEdnJiY093ZGwrNmlNb0dMQ3FWV3A5WUw3TVdu?=
 =?utf-8?B?ODc4M1NONDd1NnVLQXBOa29helZEcTNXN2FycDMvSmY4STVFbHZaSjhEaVhJ?=
 =?utf-8?B?VUE5R3RnTGUxQUx5K2RxL2hvYnl1eWp2SUxSL2JtR2NhNzNsSjd5bWFQLzNr?=
 =?utf-8?B?dnJZVGZ6YjBiQ0U2dWRSMXBTZVBEVG53WXFwc0ZtT0RNTUZlcWJLbTFTM3Br?=
 =?utf-8?B?NHN1TThkeDU4T0xBeW01ekt6VjN6YWZhT25pZ1JpZzA5THNrclBMN2ltdUV1?=
 =?utf-8?B?cVVLYVV5Y1Z2L0k0QjdRbDc3aHZsdkUzbzN2b2I1akhNRGJSVGhhWmdnZXZm?=
 =?utf-8?B?WWxQaTluS1V0TnluQm5pcDJ6SFJNbFZPdTMyckJPbFNPbW1FUkxnUmNiMXQv?=
 =?utf-8?B?bWdvTkIzVnJmNTRiL1Ywd2dLdDVpZ05iVnNnSUk0QWhTUVpLR3FEMFAzc1hp?=
 =?utf-8?B?b05KVlB0L2haVXpoUTA0aFR2blo1VHdPdE9iQjU0N2xKckVhNk0wVHE4QnN2?=
 =?utf-8?B?YXZmdExtRGxXL3RXdUVMM3drTnBlNytLeFcySzhpTnl2SFViNkhoenlDOHNx?=
 =?utf-8?B?c0FjNDM3cmNBNmhTNzFJbUJUVUYzTEZFeTFmVVBGaU1BZTFTMjNEOHZGaGRa?=
 =?utf-8?B?djRRNXBFVXFHRE4xNXpqVXkvc2M0cHlQRW9nQkZVNC9DY0cvbUVsaTRWYk9i?=
 =?utf-8?B?OHJvZnlTYTVLN0ZhamthWDdqU2orbVB2T25TY0ZINDNUenFsaHZGUkhicnVi?=
 =?utf-8?B?ejA3OXAya2NPTHo3YnRqTUV0UUVGQm1DQ1NqQ21scFlxajdGY243M3pld0ta?=
 =?utf-8?B?aGljNHhBZ3hsZ2lvM2xIY2xQUnY5d0c0ZExiQXV4eTNqcFRnZXdYSzUvYi9N?=
 =?utf-8?B?TU5neHJUeXJUSFk4dVNpQVpONzZXVVZmZ3NDQ0lLTDBkV0NoNFFXMWxkakNp?=
 =?utf-8?B?NUlRam4vREtacTMwalhTSzNweVR2VklMcmR6TUgrWlpSZGNwQWZEbDB2bFJE?=
 =?utf-8?B?Z2VkaVFmQklGQVJQVlBZV3dUTkNMZm8zbGw5OS9abnRXdHJaTEV3QT09?=
X-Exchange-RoutingPolicyChecked: h8YLVgmAUeyeUwcxzHH6/CJV65hNStlu8pu6q4kqe8IaacS8W2y2SkvFiUoVHCJFibxxKTExxpgcn+Y6DeRGIgwqz1QuQZedP1nfIPMxQ0MOD2Zgh/Q882ozvsRjUD4tHg/WnvREM8WWWe0EyRaqCBhGebLzKonNYIbH2KbyinOHgc2sQh5G84tBX7hewZTgkPju4vKsTWT+HW6Oc269EVSxOunn+ayK2/eXoR7MgO1xQ0HVIZPv0DdvKFyA9T8LU7uPkCW9uzDlluM9JjfS/aeeYgCs457HcM0BgXCMwvGcY7/o7iB6ES5tK+sUcZaqXGhOAw/4cj+KMfd7I7foxw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d063ad00-bc05-4753-cb7f-08df4aff48d9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 14:20:41.9287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gII8zsIrYjhMGwrnlQnBgC3XSH0rKtlsk5BOywZvDvIzhWkQDLkqqHkBYUDbdj1zF60Nz0WG3WQR3fARUSWvqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7048
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 25-11-2026 15:02, Sk Anirban wrote:
> AUX info register traversal can loop indefinitely when a register
> points back to itself. Avoid revisiting registers by reading each
> register once and collecting the entries that contain data.
>
> v2: Add fixes (Riana)
>      Modify loop (Riana)
> v3: Remove non-zero check (Riana)
>
> Fixes: 5e940312a2ac ("drm/xe: Add functions and sysfs for boot survivability")
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>

LGTM

Reviewed-by: Riana Tauro <riana.tauro@intel.com>


> ---
>   drivers/gpu/drm/xe/xe_survivability_mode.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 91a0680e449b..2787ed952d2b 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -168,11 +168,9 @@ static void populate_survivability_info(struct xe_device *xe)
>   			set_survivability_info(mmio, info, POSTCODE_TRACE_OVERFLOW);
>   	}
>   
> -	/* Traverse the linked list of aux info registers */
> +	/* Read all aux info registers */
>   	if (reg_value & AUXINFO_SUPPORT) {
> -		for (id = REG_FIELD_GET(AUXINFO_REG_OFFSET, reg_value);
> -		     id >= AUX_INFO0 && id < MAX_SCRATCH_REG;
> -		     id =  REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, info[id]))
> +		for (id = AUX_INFO0; id < MAX_SCRATCH_REG; id++)
>   			set_survivability_info(mmio, info, id);
>   	}
>   }
