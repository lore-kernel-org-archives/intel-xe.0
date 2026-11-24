Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CA4606A687
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 19:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TRKX/+11;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=hwP0vmVw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E1B2896EC;
	Tue, 24 Nov 2026 19:47:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B6E210E590
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 19:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795549635; x=1827085635;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=BVRG0Gbf11Lg08WoXN3BHpe49NMPClbqw37/IW5M/Z0=;
 b=TRKX/+11+5RK/JAP3YFEXSlNxuqQmZdz4lY2kYjFcphYd71jlfyJerUF
 TDj2Gvk5KH70f6AAt7v8A5SdzxV+StEfqVlpkzfw2q6BZnepSXqcbj4Sh
 UVJlzo3QXfgNUuh4jdVUYUcS9XYIGmolz7Q+pHMXas4w8yn66f51CO7vG
 4+GknsfiJFSYUDUM78m0DiukpeoPYONWVamY3LcVXt2igSpFTgTYADwvr
 TSxz/nQjDKegPCZH7ekYpDSy3qXG9aUUHszRGpYooY+VNdMIfz7Zq/Jd3
 mXHSz60nRGacziJylq3baS2TXvssC23gUJuDvicjp0uTUeF5+RUShlEkx g==;
X-CSE-ConnectionGUID: +j+MfI9IQNmb8CJPSjbnIg==
X-CSE-MsgGUID: V5FEAremSACvW13WQOUmmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4463344"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4463344"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 11:47:12 -0800
X-CSE-ConnectionGUID: o+++TwmpTV20hvXz3x0eiw==
X-CSE-MsgGUID: Njdqe2P3TTWiYXKI8D31VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="11641636"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 11:47:12 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 11:47:09 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 11:47:09 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 11:47:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UpSFmomKMHh/TNEGlPBQQnu+lQpn/417mCN/6GVrkzpjDAWZEYJy16pPKZQuAaEy+TW16ievwq0KITt9RMnKhfKI78HuWPfoSaTucDmka9CTQUSXEexTLWKm7cWlBaFBPsBdmC3O/q3NPIUJBciXZFO4F7O+6+NWEa7HeQspAFX7k5dOgBecRjD9INH/jhYyvIBAmJBJ5MX4y5Be8t7Tw+wqJLM7O4oMq64/73Q6/gAPgPRoEk1kjVPRCMtLgNE8K0iYeRhG5pdzsI2oAQnAT4oke3pk6YRbdykISXbk9E+SrE/YI8AcSr3UBoyCIQWo630zTqsvUyUX7pVnK0deyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VmWDs2qEm2it2irxOccvAHmKLybnCX4cNpO7HdM7HJs=;
 b=SqkHSl6WJg7I2G7J/7T5wW+T3RpflP1vZS1CsiuPuru+Q02Ytfs+okUeC77l7wxULVNuWyaB/vmZ84LGHp+GUwGBARiZu/OWHPf77I3GnFZPjuLp66DKO9QNm/WLppZSfSbtAcOgaxda1qX8zZAziHKX+izwEKwZaHwXC5XW5cZLh2aHVRrUHeZ6SUlx9J+Fp7iF6J64DT+wSV6p0sbZgySDtSC1sS9kUkqZ5V8mTNbH4Vm9kbs9SKri3ID+rF1BcxmZ1QSx8vZV5JEXB9p6y/S5E4iSg7AdCSUvJvxTxZnPOctjpPBOTsD55trObdebhRZeS8KGBMNbm3pZW6zxBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VmWDs2qEm2it2irxOccvAHmKLybnCX4cNpO7HdM7HJs=;
 b=hwP0vmVwxGSdmuW/VmN0PuRBjvNPh9XTguo/duG8JA/lRv7O1vcsY3c/u8roadbFsAD2pSMVsMjGJbLOikDHD87EqvERxKq3UXEuDSCd2YzBuv3T9LlqClCijPI1PX9kScGjtfBNhsR0ZaUQMX6+9IwmhOBNZ7Dx4OdpQFyfvls=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 DS0PR11MB8666.namprd11.prod.outlook.com (2603:10b6:8:1bd::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.13; Tue, 24 Nov 2026 19:47:04 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Tue, 24 Nov 2026
 19:47:04 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <michael.j.ruhl@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [CI] drm/xe: Crescent Island PMT support + hwmon use-after-free debug
Date: Tue, 24 Nov 2026 14:46:54 -0500
Message-ID: <20261124194656.3508212-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.56.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0153.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::8) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|DS0PR11MB8666:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fefe597-8402-4c50-95bc-08df4a63b71a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|18002099003|261009223027099003|6133799003|3023799007|261021130227099003|261021123027099003|261021133027099003|261021121427099003|261026135527099003|261021135927099003|56012099006|261022105027099003|261022113327099003|261102123227099003|261026140227099003|261026130827099003|261022115727099003|261022075727099003|261026121527099003|261028144727099003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: dlX68VlilOdBLnoH/cGkWgpBiP9C2SMIfhiwQV3Rm2dfNg3AiWAtgYy95Rh0NRLMt9qwV/plqCN+YhfyHiH8gD96rl73YN7YlCuucBUfEU47ZYZcrIwbDhUkkVoHaEzta+zJTm3p099Xd/4HCFKQIhHwCnKteZw+gAiaQXujjm55KvV09QOCnTRayzgJ4qjE03WIVq8uDrgh51ehkuetJMVBnztjp1Kw2wTgDefNAxSiTOMIGt3gfLcotIaDaN6Ii8A1Pvg1JMQu8QG+EQpeqzp1tEzKQFcjTugMIpFFYh+dLUzyUFE1QsGrtKe+ltkS1R5JGMr9+4PQ/CrEBabYybJrIxY/kIpiK4TjRxjvC9ZGsgSWr1gduRVC0F8RYTbLmUv+ygj7GWs6hyJp791fn63YRybkxYYgqff8jfUtgxyL2gv6kRwU7VpmJDUWjwJT5umMVuM4Q76mD4QqMnAUmt2nHUWGJbsJZeNBWgh94KyUOP6Ifk/Zi1fWEVb5I694dOuT+sLpFpPqWru7H3zSzW2T6A1Ev+XhvJ/TCpXwcqW0+gjiCfP+ZMqK/1qv5X5ztN9fMpziSr+oWH+5nBpWCoELpQHwhZNGLuIuufCnpYO2OaKeI9viwMFsC38KplXJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(261009223027099003)(6133799003)(3023799007)(261021130227099003)(261021123027099003)(261021133027099003)(261021121427099003)(261026135527099003)(261021135927099003)(56012099006)(261022105027099003)(261022113327099003)(261102123227099003)(261026140227099003)(261026130827099003)(261022115727099003)(261022075727099003)(261026121527099003)(261028144727099003)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akpPcWowck8zdGhSd1Iwak5iaXdqdjFhdzZWc2dPYS9TS0NtYXQ5VjVwajE0?=
 =?utf-8?B?ZHFNaUJ3TGp0WUhnVUFBcmFhTGJuVk9vV3cxelJXZ2VPS3hjcHR1b0M5ei9R?=
 =?utf-8?B?ZlEyRnBlRlc1ajhQUTBLSmhhS1VzNEZHYUVla0VtSFN3NitHUHBETzNOcjVt?=
 =?utf-8?B?SW1Wa2ZkWS9RcWxYeCtwTnJXM0lhczAweTVpbXFqR01oTXZSdWJvQ05FSlpk?=
 =?utf-8?B?eU45b2FLTXVYSmJwT3pROUVkQWl1SUxwbXUyME9BdWFhaXloM0RqV2dNdW94?=
 =?utf-8?B?bXZ5RXdqNGgrY2RMblJOV3lSVmJFYzhDUVFqZlNvOU5wMm44S3dmVk9ORFlI?=
 =?utf-8?B?WmJVM1NvRkgwdUZMSmRJMkJXY3p2ZEV1WGZOUzZhb0FwOHhBeEwxWkkvT2F6?=
 =?utf-8?B?TFFqVnV0S254N0VXZlljUHVwWUdlNlRtbmZtL1A3KzFXRnYweEJQcXRKdG9V?=
 =?utf-8?B?UjR1cDBHZmJRb1grK080RG5uMlhka01ZeXViVHhuRkgwblZDUVY3RC9lVmlk?=
 =?utf-8?B?NFVka3JGMmdCWEE5SUU3VFJyb3hRL3oxRXM0c1F1eG8yOTh1NitzaWk4VzNX?=
 =?utf-8?B?NllNN3h6ZmJhSGJnaytjSEsyVnEweGprUEowbzRNMXlnZHd1aWtwVSt5RnFh?=
 =?utf-8?B?SlFGbk9vcDJ6MDlodWJDNGFMTUplc2VienFNZTdSVXpGa1NKbWJtNFRVMDRQ?=
 =?utf-8?B?aDZhK1lCYmgrUHlySnVSSkk3cTlqa2pKU3czRVZVR1gxbmZjSHBIT1VKSTZq?=
 =?utf-8?B?RFpnbXhDLzhadTdOc3FaYnpwRGNNaXVINHNCZDRpa1krSFZzNEw5TUowRmNF?=
 =?utf-8?B?VlNkYm9ldVJFekdyaTdFcHc3aFhOd1lTNlN0VFZ1TnN1STQ1djRkQ3VBc3R6?=
 =?utf-8?B?WHNtWTdiaUx1L3M2K2dtalk2QlVEMXlSMXB5ZExVWFFFd3FJbml1dmpzcGxK?=
 =?utf-8?B?RHRyb083NzJLdVdsMDFnZzVNRUh5dU5MOVlIVEtYTkw3SzkzemJrdjRjaTVN?=
 =?utf-8?B?RVl0OVhQNWZmd1I4QkxJd1Nua0wxbUcvU0xoQSs2QmxZUFZqV0VVczV4bkI4?=
 =?utf-8?B?M2JaMEpZcGdTdFN4NzNUUDFtUGZRbzl2SEJVRm9JcHlhcHd0VEVXWk9YTXpn?=
 =?utf-8?B?L3Jqa2pXUEV4c2l1SEhDKzFuTlFtM3JTcjEzRHRLcjY1dEY0MkdlR2NHNTR5?=
 =?utf-8?B?dU42dVhCVFhmZzFhTWd0eHFvRlBWNlF4bzFqNjViY2h1c2FGdUpxeXlqUHJp?=
 =?utf-8?B?QW8vQWF5ckh6Qm42aEhOWGh4THVNQVRBbG1WUUNLQTYzaE5PNFdIZEY4anFj?=
 =?utf-8?B?a1RHZUhFL3dQbzIrdlBSZTR5ZFlyZUlQTDBENjZUejVYcEx0STRFNlVjZGFi?=
 =?utf-8?B?bld3NTFsVmZNNzcxQUc0eVJmdFZDeDdBVHNBYzNmSzN2WGlLU29pNXBnWDVV?=
 =?utf-8?B?ZEIxSytzSjFYc3d3dWJpcXNIdUUrbU5rS1Q1RUtGTkJqWmV6K2RyVkc0bWhu?=
 =?utf-8?B?NFpHeDgvNXNEK0R1WE41UXBUOUIzenR2YlpsS1B1aHA3dkdVSUJCK2NkSGdE?=
 =?utf-8?B?U2hzalV5bjExMEh0ckVidDROVjVxdGd0S1Zzd2VIZmFaYmtXRFhVRE8wc3d6?=
 =?utf-8?B?Z1Y0RE5KQi95R09TOW4ydUp1REttNU95dlkwcEd0Ulo4RU9HNnptNFFoWkxQ?=
 =?utf-8?B?RlZBOTdQV2loRjJYMTZSeWpOaGpNQUdqLzd5U1hNVmlneHV2Mzcya0p6OXdx?=
 =?utf-8?B?dGdFdHQ0Rzc2cG9xUURvMXEwNFNwbXhvQ1NNTTBlZ3JvemRGTlNhM1MwWUN1?=
 =?utf-8?B?dDdKUi9tNk9nTTkyTDE2aFJWYnVHT092dXVVUUVMSGZxbWptMyswYk1nL1ha?=
 =?utf-8?B?bEs1LzVlSk9wTTlDYWtsQ2xxMGlSZnQ2eWFXZ3FrOXhHRXBPWEhFLzVYWFE5?=
 =?utf-8?B?NUZmM0dDOVdha1JkMGFvS0V5VnRya3lhYUp5NlpENS9uZVhRRmlKYXZ1MGt4?=
 =?utf-8?B?a0VNRlBvdmFpTHdRc0p5ZDJndDJQZ3RFRHQvcTJVbkRXd3duM2F1L1orZzRx?=
 =?utf-8?B?T3pZRk9HRGV1S3psTEVNVjZVeHJuL29WNE5yVjRnSXdFcm5RY1c1YklXaGtt?=
 =?utf-8?B?MzlUKy80UGhQZXp6VUpHL243MHlubjhMQjFqOHRodEhFNU1pUDB3N3FoVGlm?=
 =?utf-8?B?S253MnRPNDRiRFlaL3E5cE4zUm9zeEFrdWZWOGdRSFVjZHRNWXBaN1NvYUI5?=
 =?utf-8?B?Z1pwWDlHUWI2dDdsTCtUNlZzQVRuTURLRzBZU2FYcVdMU3dIWHJxVnRjUlRH?=
 =?utf-8?B?ZjlIS3VGVklqU0xuN0xBTk82cGw5VXFMM2RrMldZeERiVjNzWUhiQT09?=
X-Exchange-RoutingPolicyChecked: RzPohJwiNX55J7QGPjmPYssKZFks+vEOOedl8plXslDjjWf1b2zv2rlOiG5g0ynenKMS4NlITrJLdEtWBwnTnLrTP6h8myoUBM6VFbs6nsfSktkrBH8i+baEvVsZq4UF+odriq119cCwYsXNG69UZumhF37gsELNMQzcKprClxVhKB36F5ersAMEdDRD2qYfJfLuMYw0JhpnUvszimuUC63ogCUukbyzkDC8czTXLGVaMslBrpxqfuEsH4zlASkmqMxBgruQ5pc/Ew2+3YN9FlgVJAYZPIlbDWuAB8VOlYgFuf4ls+bbnvPF9tdvVA/+9K0fYO05UtYBX0ItDCSlyw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fefe597-8402-4c50-95bc-08df4a63b71a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 19:47:04.7027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v+W+UnxOvM5UOfDO2K3Eejj8orYPtotxGFlJb3rrTTtyXZLQUzPw0iKMXTNHiXcOdylmeHwD52jW8kmiXUpROA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8666
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

DO NOT MERGE. CI only.

Squash of "Crescent Island PMT support" v23 (19 patches) from
Michael J. Ruhl:
https://lore.kernel.org/all/20261124020752.30551-21-michael.j.ruhl@intel.com/

plus debug output to find who frees struct xe_hwmon while xe is still
bound on the SR-IOV PF BMG machines, where unbind crashes in
xe_hwmon_unregister() on a 0x6b6b... (slab poison) pointer:

 - log the hwmon allocation and the unregister call with their pointers
 - devm action with dump_stack(), printed when devres frees the struct
 - kmem_dump_obj(xe->hwmon) before use in xe_hwmon_unregister(), which
   prints the alloc and free stacks of an already freed object

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 Documentation/gpu/xe/index.rst             |   1 +
 Documentation/gpu/xe/xe_vsec.rst           |  14 +
 drivers/gpu/drm/xe/regs/xe_pmt.h           |  12 +-
 drivers/gpu/drm/xe/xe_debugfs.c            |  45 +-
 drivers/gpu/drm/xe/xe_device.c             |   9 +-
 drivers/gpu/drm/xe/xe_device_types.h       |  11 +
 drivers/gpu/drm/xe/xe_hwmon.c              |  25 +-
 drivers/gpu/drm/xe/xe_pcode.c              |  10 +-
 drivers/gpu/drm/xe/xe_survivability_mode.c |   2 +
 drivers/gpu/drm/xe/xe_vsec.c               | 664 +++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vsec.h               |   2 +
 drivers/platform/x86/intel/pmt/class.c     |  18 +-
 drivers/platform/x86/intel/pmt/crashlog.c  |  24 +-
 include/linux/intel_vsec.h                 |  10 +
 14 files changed, 751 insertions(+), 96 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe_vsec.rst

diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
index 497a0a4b12f6..de829aecf8f1 100644
--- a/Documentation/gpu/xe/index.rst
+++ b/Documentation/gpu/xe/index.rst
@@ -37,3 +37,4 @@ The display, or :ref:`drm-kms`, support for drm/xe is provided by
    xe_gt_stats
    xe_sigid
    xe_pci_error
+   xe_vsec
diff --git a/Documentation/gpu/xe/xe_vsec.rst b/Documentation/gpu/xe/xe_vsec.rst
new file mode 100644
index 000000000000..1a87548489ea
--- /dev/null
+++ b/Documentation/gpu/xe/xe_vsec.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+=====
+VSEC
+=====
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_vsec.c
+   :doc: VSEC
+
+Internal API
+============
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_vsec.c
+   :internal:
diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
index a62ab05c6b4c..fb5b5a8648ba 100644
--- a/drivers/gpu/drm/xe/regs/xe_pmt.h
+++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
@@ -10,15 +10,21 @@
 #define BMG_PMT_BASE_OFFSET		0xDB000
 #define BMG_DISCOVERY_OFFSET		(SOC_BASE + BMG_PMT_BASE_OFFSET)
 
-#define PUNIT_TELEMETRY_GUID		XE_REG(BMG_DISCOVERY_OFFSET + 0x4)
+#define BMG_PUNIT_TELEMETRY_GUID	XE_REG(BMG_DISCOVERY_OFFSET + 0x4)
 #define BMG_ENERGY_STATUS_PMT_OFFSET	(0x30)
 #define	ENERGY_PKG			REG_GENMASK64(31, 0)
 #define	ENERGY_CARD			REG_GENMASK64(63, 32)
 
 #define PUNIT_VERSION_OFFSET		0xA0
 
-#define BMG_TELEMETRY_BASE_OFFSET	0xE0000
-#define BMG_TELEMETRY_OFFSET		(SOC_BASE + BMG_TELEMETRY_BASE_OFFSET)
+#define XE_PMT_BASE_OFFSET		0xE0000
+
+#define BMG_TELEMETRY_OFFSET		(SOC_BASE + XE_PMT_BASE_OFFSET)
+
+/* for CRI discovery and telemetry are in an indexed window */
+#define CRI_PMT_OFFSET			(SOC_BASE + XE_PMT_BASE_OFFSET)
+
+#define CRI_PUNIT_TELEMETRY_GUID	XE_REG(CRI_PMT_OFFSET + 0x4)
 
 #define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
 #define BMG_G2_RESIDENCY_OFFSET		(0x530)
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 1a74a7106462..bc62d1054d29 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -5,6 +5,7 @@
 
 #include "xe_debugfs.h"
 
+#include <linux/array_size.h>
 #include <linux/bits.h>
 #include <linux/debugfs.h>
 #include <linux/fault-inject.h>
@@ -21,7 +22,6 @@
 #include "xe_gt.h"
 #include "xe_gt_debugfs.h"
 #include "xe_hw_engine.h"
-#include "xe_mmio.h"
 #include "xe_pagefault.h"
 #include "xe_pcode.h"
 #include "xe_pm.h"
@@ -149,15 +149,20 @@ static void xe_fault_inject_debugfs_register(struct xe_device *xe,
 	}
 }
 
-static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
-				   u32 offset, const char *name, struct drm_printer *p)
+static void read_residency_counter(struct xe_device *xe, u32 offset, const char *name,
+				   struct drm_printer *p)
 {
 	u64 residency = 0;
+	u32 guid;
 	int ret;
 
-	ret = xe_pmt_telem_read(xe->drm.dev,
-				xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
-				&residency, offset, sizeof(residency));
+	ret = xe_vsec_get_guid(xe, &guid);
+	if (ret) {
+		drm_warn(&xe->drm, "PMT device is not available: %d\n", ret);
+		return;
+	}
+
+	ret = xe_pmt_telem_read(xe->drm.dev, guid, &residency, offset, sizeof(residency));
 	if (ret != sizeof(residency)) {
 		drm_warn(&xe->drm, "%s counter failed to read, ret %d\n", name, ret);
 		return;
@@ -296,13 +301,12 @@ static int pcode_info(struct seq_file *m, void *data)
 static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
 {
 	struct xe_device *xe;
-	struct xe_mmio *mmio;
 	struct drm_printer p;
 
 	xe = node_to_xe(m->private);
 	p = drm_seq_file_printer(m);
 	guard(xe_pm_runtime)(xe);
-	mmio = xe_root_tile_mmio(xe);
+
 	static const struct {
 		u32 offset;
 		const char *name;
@@ -316,7 +320,7 @@ static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
 	};
 
 	for (int i = 0; i < ARRAY_SIZE(residencies); i++)
-		read_residency_counter(xe, mmio, residencies[i].offset, residencies[i].name, &p);
+		read_residency_counter(xe, residencies[i].offset, residencies[i].name, &p);
 
 	return 0;
 }
@@ -324,13 +328,11 @@ static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
 static int dgfx_pcie_link_residencies_show(struct seq_file *m, void *data)
 {
 	struct xe_device *xe;
-	struct xe_mmio *mmio;
 	struct drm_printer p;
 
 	xe = node_to_xe(m->private);
 	p = drm_seq_file_printer(m);
 	guard(xe_pm_runtime)(xe);
-	mmio = xe_root_tile_mmio(xe);
 
 	static const struct {
 		u32 offset;
@@ -342,7 +344,7 @@ static int dgfx_pcie_link_residencies_show(struct seq_file *m, void *data)
 	};
 
 	for (int i = 0; i < ARRAY_SIZE(residencies); i++)
-		read_residency_counter(xe, mmio, residencies[i].offset, residencies[i].name, &p);
+		read_residency_counter(xe, residencies[i].offset, residencies[i].name, &p);
 
 	return 0;
 }
@@ -702,23 +704,22 @@ void xe_debugfs_register(struct xe_device *xe)
 				 ARRAY_SIZE(debugfs_list),
 				 root, minor);
 
-	if (xe->info.platform == XE_BATTLEMAGE && !IS_SRIOV_VF(xe)) {
-		drm_debugfs_create_files(debugfs_residencies,
-					 ARRAY_SIZE(debugfs_residencies),
-					 root, minor);
-	}
-
 	/*
-	 * Pcode version read from PMT is currently only supported on CRI and BMG platforms in PF
-	 * mode, as both platforms support the necessary telemetry read mechanism and have a fixed
-	 * PUNIT_VERSION_OFFSET.
+	 * Residencies and Pcode version read from PMT is currently only supported on CRI and BMG
+	 * platforms in PF mode.  Both platforms support the necessary telemetry read mechanism
+	 * and have a fixed offsets for the required data.
 	 * Attempting this access on other platforms must be verified before enabling support.
 	 */
 	if (!IS_SRIOV_VF(xe) &&
-	    (xe->info.platform == XE_CRESCENTISLAND || xe->info.platform == XE_BATTLEMAGE))
+	    (xe->info.platform == XE_CRESCENTISLAND || xe->info.platform == XE_BATTLEMAGE)) {
+		drm_debugfs_create_files(debugfs_residencies,
+					 ARRAY_SIZE(debugfs_residencies),
+					 root, minor);
+
 		drm_debugfs_create_files(pcode_info_debugfs,
 					 ARRAY_SIZE(pcode_info_debugfs),
 					 root, minor);
+	}
 
 	debugfs_create_file("forcewake_all", 0400, root, xe,
 			    &forcewake_all_fops);
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index eafc66d686e2..614b7e376739 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1092,18 +1092,18 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
+	xe_vsec_init(xe);
+
 	xe_debugfs_register(xe);
 
 	err = xe_hwmon_register(xe);
 	if (err)
-		goto err_unregister_display;
+		goto err_unregister_vsec;
 
 	err = xe_i2c_probe(xe);
 	if (err)
 		goto err_unregister_hwmon;
 
-	xe_vsec_init(xe);
-
 	err = xe_sriov_init_late(xe);
 	if (err)
 		goto err_unregister_hwmon;
@@ -1118,6 +1118,8 @@ int xe_device_probe(struct xe_device *xe)
 
 err_unregister_hwmon:
 	xe_hwmon_unregister(xe);
+err_unregister_vsec:
+	xe_vsec_remove(xe);
 err_unregister_display:
 	xe_display_unregister(xe);
 	drm_dev_unregister(&xe->drm);
@@ -1128,6 +1130,7 @@ int xe_device_probe(struct xe_device *xe)
 void xe_device_remove(struct xe_device *xe)
 {
 	xe_hwmon_unregister(xe);
+	xe_vsec_remove(xe);
 	xe_display_unregister(xe);
 
 	drm_dev_unplug(&xe->drm);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 8f2a31949073..ae5426717eb4 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -7,6 +7,7 @@
 #define _XE_DEVICE_TYPES_H_
 
 #include <linux/pci.h>
+#include <linux/workqueue.h>
 
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
@@ -485,6 +486,16 @@ struct xe_device {
 	struct {
 		/** @pmt.lock: protect access for telemetry data */
 		struct mutex lock;
+		/** @pmt.base_offset: device specific base offset */
+		u64 base_offset;
+		/** @pmt.work: support late-bind probe */
+		struct delayed_work work;
+		/** @pmt.retry_count: late-bind probe retry */
+		u32 retry_count;
+		/** @pmt.punit_guid_cache: cache of the PUNIT GUID */
+		u32 punit_guid_cache;
+		/** @pmt.survivability_mode: cache of survivability mode state */
+		bool survivability_mode;
 	} pmt;
 
 	/** @soc_remapper: SoC remapper object */
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 9cbb65891aa4..272ef2aca80a 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -5,6 +5,7 @@
 
 #include <linux/hwmon-sysfs.h>
 #include <linux/hwmon.h>
+#include <linux/slab.h>
 #include <linux/jiffies.h>
 #include <linux/overflow.h>
 #include <linux/types.h>
@@ -603,9 +604,15 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
 
 	if (hwmon->xe->info.platform == XE_BATTLEMAGE) {
 		u64 pmt_val;
+		u32 guid;
 
-		ret = xe_pmt_telem_read(hwmon->xe->drm.dev,
-					xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
+		ret = xe_vsec_get_guid(hwmon->xe, &guid);
+		if (ret) {
+			drm_warn(&hwmon->xe->drm, "PMT device is not available: %d\n", ret);
+			*energy = 0;
+			return ret;
+		}
+		ret = xe_pmt_telem_read(hwmon->xe->drm.dev, guid,
 					&pmt_val, BMG_ENERGY_STATUS_PMT_OFFSET,	sizeof(pmt_val));
 		if (ret != sizeof(pmt_val)) {
 			drm_warn(&hwmon->xe->drm, "energy read from pmt failed, ret %d\n", ret);
@@ -1867,6 +1874,13 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 	return xe_hwmon_init_temp_info(hwmon);
 }
 
+/* CI DEBUG ONLY: show who releases the hwmon devres */
+static void xe_hwmon_devres_dbg(void *data)
+{
+	pr_err("xe_hwmon CI DEBUG: devres releasing hwmon %p\n", data);
+	dump_stack();
+}
+
 int xe_hwmon_register(struct xe_device *xe)
 {
 	struct device *dev = xe->drm.dev;
@@ -1885,6 +1899,9 @@ int xe_hwmon_register(struct xe_device *xe)
 	if (!hwmon)
 		return -ENOMEM;
 
+	pr_err("xe_hwmon CI DEBUG: allocated hwmon %p for xe %p\n", hwmon, xe);
+	devm_add_action(dev, xe_hwmon_devres_dbg, hwmon);
+
 	ret = devm_mutex_init(dev, &hwmon->hwmon_lock);
 	if (ret)
 		return ret;
@@ -1925,9 +1942,13 @@ int xe_hwmon_register(struct xe_device *xe)
  */
 void xe_hwmon_unregister(struct xe_device *xe)
 {
+	pr_err("xe_hwmon CI DEBUG: unregister xe %p hwmon %p\n", xe, xe->hwmon);
 	if (!xe->hwmon)
 		return;
 
+	/* prints the alloc and free stacks if the object was already freed */
+	kmem_dump_obj(xe->hwmon);
+
 	hwmon_device_unregister(xe->hwmon->hwmon_dev);
 	xe->hwmon = NULL;
 }
diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 266deecbb100..fa9f45d565cb 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -365,11 +365,17 @@ ALLOW_ERROR_INJECTION(xe_pcode_probe_early, ERRNO); /* See xe_pci_probe */
 int xe_get_pcode_version(struct xe_device *xe, struct xe_pcode_version *version)
 {
 	int ret = 0;
+	u32 guid;
 
 	guard(xe_pm_runtime)(xe);
 
-	ret = xe_pmt_telem_read(xe->drm.dev,
-				xe_mmio_read32(xe_root_tile_mmio(xe), PUNIT_TELEMETRY_GUID),
+	ret = xe_vsec_get_guid(xe, &guid);
+	if (ret) {
+		xe_warn(xe, "PMT device is not available: %d\n", ret);
+		return ret;
+	}
+
+	ret = xe_pmt_telem_read(xe->drm.dev, guid,
 				(u64 *)version, PUNIT_VERSION_OFFSET, sizeof(*version));
 	if (ret != sizeof(*version)) {
 		xe_warn(xe, "pcode version read from PMT failed, ret %pe\n", ERR_PTR(ret));
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 91a0680e449b..10f9de4eb03b 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -21,6 +21,7 @@
 #include "xe_nvm.h"
 #include "xe_pcode_api.h"
 #include "xe_printk.h"
+#include "xe_soc_remapper.h"
 #include "xe_vsec.h"
 #include "xe_wedge.h"
 
@@ -354,6 +355,7 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
 
 	xe_heci_gsc_init(xe);
 
+	xe_soc_remapper_init(xe);
 	xe_vsec_init(xe);
 
 	if (survivability->fdo_mode) {
diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index a9baf0bfe572..33a5237cf5b4 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -3,28 +3,57 @@
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/cleanup.h>
+#include <linux/delay.h>
 #include <linux/errno.h>
+#include <linux/log2.h>
 #include <linux/intel_vsec.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/pci.h>
+#include <linux/sizes.h>
 #include <linux/types.h>
 
+#include <drm/drm_drv.h>
+
 #include "xe_device.h"
 #include "xe_device_types.h"
 #include "xe_mmio.h"
 #include "xe_platform_types.h"
 #include "xe_pm.h"
+#include "xe_survivability_mode.h"
+#include "xe_sysctrl.h"
 #include "xe_vsec.h"
 
 #include "regs/xe_pmt.h"
 
-/* PMT GUID value for BMG devices.  NOTE: this is NOT a PCI id */
+/**
+ * DOC: VSEC
+ *
+ * Some GPUs support the PMT feature.  For those that do, this API provides
+ * probe, discovery and usage (control and access) for GPUs that have PMT.
+ *
+ * PMT is usually accessed through a PCI function.  However, that is not always
+ * available, so the PMT intel_vsec_register() function can be used to set up
+ * PMT usage.
+ */
+
+/* PMT GUID value for BMG and CRI devices.  NOTE: this is NOT a PCI id */
 #define BMG_DEVICE_ID 0xE2F8
+#define CRI_DEVICE_ID 0xE2FA
+
+/*
+ * sizeof(Crashlog Type1 Version2) = 0x18 (24) bytes
+ * For BMG and CRI PUNIT and OOBMSMS crashlogs are consecutive.
+ */
+#define BMG_CRASHLOG_PUNIT_DISC_OFFSET (0x60)
+#define BMG_CRASHLOG_OOBMSM_DISC_OFFSET (BMG_CRASHLOG_PUNIT_DISC_OFFSET + 0x18)
+
+#define CRI_CRASHLOG_PUNIT_DISC_OFFSET (0x80)
+#define CRI_CRASHLOG_OOBMSM_DISC_OFFSET (CRI_CRASHLOG_PUNIT_DISC_OFFSET + 0x18)
 
 static struct intel_vsec_header bmg_telemetry = {
 	.rev = 1,
-	.length = 0x10,
+	.length = SZ_16,
 	.id = VSEC_ID_TELEMETRY,
 	.num_entries = 2,
 	.entry_size = 4,
@@ -34,12 +63,12 @@ static struct intel_vsec_header bmg_telemetry = {
 
 static struct intel_vsec_header bmg_crashlog = {
 	.rev = 1,
-	.length = 0x10,
+	.length = SZ_16,
 	.id = VSEC_ID_CRASHLOG,
 	.num_entries = 2,
 	.entry_size = 6,
 	.tbir = 0,
-	.offset = BMG_DISCOVERY_OFFSET + 0x60,
+	.offset = BMG_DISCOVERY_OFFSET + BMG_CRASHLOG_PUNIT_DISC_OFFSET,
 };
 
 static struct intel_vsec_header *bmg_capabilities[] = {
@@ -48,9 +77,52 @@ static struct intel_vsec_header *bmg_capabilities[] = {
 	NULL
 };
 
+static struct intel_vsec_header cri_telemetry = {
+	.rev = 1,
+	.length = SZ_16,
+	.id = VSEC_ID_TELEMETRY,
+	.num_entries = 3,
+	.entry_size = 4,
+	.tbir = 0,
+	.offset = CRI_PMT_OFFSET,
+};
+
+static struct intel_vsec_header cri_crashlog = {
+	.rev = 1,
+	.length = SZ_16,
+	.id = VSEC_ID_CRASHLOG,
+	.num_entries = 2,
+	.entry_size = 6,
+	.tbir = 0,
+	.offset = CRI_PMT_OFFSET + CRI_CRASHLOG_PUNIT_DISC_OFFSET,
+};
+
+static struct intel_vsec_header *cri_capabilities[] = {
+	&cri_telemetry,
+	&cri_crashlog,
+	NULL
+};
+
+static struct intel_vsec_header cri_survivability_crashlog = {
+	.rev = 1,
+	.length = SZ_16,
+	.id = VSEC_ID_CRASHLOG,
+	.num_entries = 1,
+	.entry_size = 6,
+	.tbir = 0,
+	.offset = CRI_PMT_OFFSET + CRI_CRASHLOG_PUNIT_DISC_OFFSET,
+};
+
+static struct intel_vsec_header *cri_survivability_capabilities[] = {
+	&cri_survivability_crashlog,
+	NULL
+};
+
 enum xe_vsec {
 	XE_VSEC_UNKNOWN = 0,
 	XE_VSEC_BMG,
+	XE_VSEC_CRI,
+	XE_VSEC_CRI_SURVIVABILITY,
 };
 
 static struct intel_vsec_platform_info xe_vsec_info[] = {
@@ -58,29 +130,60 @@ static struct intel_vsec_platform_info xe_vsec_info[] = {
 		.caps = VSEC_CAP_TELEMETRY | VSEC_CAP_CRASHLOG,
 		.headers = bmg_capabilities,
 	},
+	[XE_VSEC_CRI] = {
+		.caps = VSEC_CAP_TELEMETRY | VSEC_CAP_CRASHLOG,
+		.headers = cri_capabilities,
+	},
+	[XE_VSEC_CRI_SURVIVABILITY] = {
+		.caps = VSEC_CAP_CRASHLOG,
+		.headers = cri_survivability_capabilities,
+	},
 	{ }
 };
 
 /*
  * The GUID will have the following bits to decode:
  *   [0:3]   - {Telemetry space iteration number (0,1,..)}
- *   [4:7]   - Segment (SEGMENT_INDEPENDENT-0, Client-1, Server-2)
+ *   [4:7]   - BMG Segment (SEGMENT_INDEPENDENT-0, Client-1, Server-2)
+ *   [4:5]   - CRI Segment (SEGMENT_INDEPENDENT-0, Client-1, Server-2)
+ *   [6:7]   - CRI Instance
  *   [8:11]  - SOC_SKU
  *   [12:27] – Device ID – changes for each down bin SKU’s
  *   [28:29] - Capability Type (Crashlog-0, Telemetry Aggregator-1, Watcher-2)
  *   [30:31] - Record-ID (0-PUNIT, 1-OOBMSM_0, 2-OOBMSM_1)
  */
 #define GUID_TELEM_ITERATION	GENMASK(3, 0)
-#define GUID_SEGMENT		GENMASK(7, 4)
 #define GUID_SOC_SKU		GENMASK(11, 8)
 #define GUID_DEVICE_ID		GENMASK(27, 12)
 #define GUID_CAP_TYPE		GENMASK(29, 28)
 #define GUID_RECORD_ID		GENMASK(31, 30)
 
-#define PUNIT_TELEMETRY_OFFSET		0x0200
-#define PUNIT_WATCHER_OFFSET		0x14A0
-#define OOBMSM_0_WATCHER_OFFSET		0x18D8
-#define OOBMSM_1_TELEMETRY_OFFSET	0x1000
+#define BMG_GUID_SEGMENT	GENMASK(7, 4)
+
+#define CRI_GUID_SEGMENT	GENMASK(5, 4)
+#define CRI_GUID_INSTANCE	GENMASK(7, 6)
+
+#define BMG_IDX_TELEM_PUNIT		0x00
+#define BMG_IDX_TELEM_OOBMSM		0x01
+#define BMG_IDX_CRASHLOG_PUNIT		0x02
+#define BMG_IDX_CRASHLOG_OOBMSM		0x04
+
+#define BMG_PUNIT_TELEMETRY_OFFSET	0x0200
+#define BMG_PUNIT_WATCHER_OFFSET	0x14A0
+#define BMG_OOBMSM_0_WATCHER_OFFSET	0x18D8
+#define BMG_OOBMSM_1_TELEMETRY_OFFSET	0x1000
+
+#define CRI_IDX_TELEM_DISCOVERY		0x00
+#define CRI_IDX_TELEM_PUNIT		0x01
+#define CRI_IDX_TELEM_OOBMSM		0x02
+#define CRI_IDX_CRASHLOG_PUNIT		0x03
+#define CRI_IDX_WATCHER_OOBMSM		0x03  /* PUNIT and OOBMSM share this index */
+#define CRI_IDX_CRASHLOG_OOBMSM		0x04
+
+#define CRI_PUNIT_WATCHER_OFFSET		0x08A0
+#define CRI_OOBMSM_WATCHER_OFFSET		0x0CF8
+#define CRI_OOBMSM_GFSP_TELEMETRY_OFFSET	0x1600
+#define CRI_PUNIT_CRASHLOG_OFFSET		0x0E60
 
 enum record_id {
 	PUNIT,
@@ -94,44 +197,45 @@ enum capability {
 	WATCHER,
 };
 
-static int xe_guid_decode(u32 guid, int *index, u32 *offset)
+/*
+ * Late bind will delay 100msec for up to 20 seconds
+ */
+#define VSEC_LATE_BIND_DELAY_MSEC	100
+#define VSEC_LATE_BIND_RETRY		200
+
+static void cri_late_bind_probe(struct xe_device *xe);
+
+static int bmg_guid_decode(u32 guid, int *index, u32 *offset)
 {
 	u32 record_id = FIELD_GET(GUID_RECORD_ID, guid);
 	u32 cap_type  = FIELD_GET(GUID_CAP_TYPE, guid);
-	u32 device_id = FIELD_GET(GUID_DEVICE_ID, guid);
-
-	if (device_id != BMG_DEVICE_ID)
-		return -ENODEV;
-
-	if (cap_type > WATCHER)
-		return -EINVAL;
 
 	*offset = 0;
 
 	if (cap_type == CRASHLOG) {
-		*index = record_id == PUNIT ? 2 : 4;
+		*index = record_id == PUNIT ? BMG_IDX_CRASHLOG_PUNIT : BMG_IDX_CRASHLOG_OOBMSM;
 		return 0;
 	}
 
 	switch (record_id) {
 	case PUNIT:
-		*index = 0;
+		*index = BMG_IDX_TELEM_PUNIT;
 		if (cap_type == TELEMETRY)
-			*offset = PUNIT_TELEMETRY_OFFSET;
+			*offset = BMG_PUNIT_TELEMETRY_OFFSET;
 		else
-			*offset = PUNIT_WATCHER_OFFSET;
+			*offset = BMG_PUNIT_WATCHER_OFFSET;
 		break;
 
 	case OOBMSM_0:
-		*index = 1;
+		*index = BMG_IDX_TELEM_OOBMSM;
 		if (cap_type == WATCHER)
-			*offset = OOBMSM_0_WATCHER_OFFSET;
+			*offset = BMG_OOBMSM_0_WATCHER_OFFSET;
 		break;
 
 	case OOBMSM_1:
-		*index = 1;
+		*index = BMG_IDX_TELEM_OOBMSM;
 		if (cap_type == TELEMETRY)
-			*offset = OOBMSM_1_TELEMETRY_OFFSET;
+			*offset = BMG_OOBMSM_1_TELEMETRY_OFFSET;
 		break;
 	default:
 		return -EINVAL;
@@ -140,55 +244,489 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
 	return 0;
 }
 
+static int cri_guid_decode(u32 guid, int *index, u32 *offset)
+{
+	u32 record_id = FIELD_GET(GUID_RECORD_ID, guid);
+	u32 cap_type  = FIELD_GET(GUID_CAP_TYPE, guid);
+	u32 instance  = FIELD_GET(CRI_GUID_INSTANCE, guid);
+
+	*offset = 0;
+
+	if (cap_type == CRASHLOG) {
+		if (record_id == PUNIT) {
+			*index = CRI_IDX_CRASHLOG_PUNIT;
+			*offset = CRI_PUNIT_CRASHLOG_OFFSET;
+		} else {
+			*index = CRI_IDX_CRASHLOG_OOBMSM;
+		}
+		return 0;
+	}
+
+	switch (record_id) {
+	case PUNIT:
+		*index = CRI_IDX_TELEM_PUNIT;
+		if (cap_type == WATCHER)
+			*offset = CRI_PUNIT_WATCHER_OFFSET;
+		break;
+
+	case OOBMSM_0:
+		*index = CRI_IDX_TELEM_OOBMSM;
+		switch (instance) {
+		case 0:
+			if (cap_type == WATCHER) {
+				*index = CRI_IDX_WATCHER_OOBMSM;
+				*offset = CRI_OOBMSM_WATCHER_OFFSET;
+			}
+			break;
+
+		case 1:
+			if (cap_type == TELEMETRY)
+				*offset = CRI_OOBMSM_GFSP_TELEMETRY_OFFSET;
+			break;
+
+		default:
+			return -EINVAL;
+		}
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int xe_guid_decode(u32 guid, int *index, u32 *offset)
+{
+	u32 cap_type  = FIELD_GET(GUID_CAP_TYPE, guid);
+	u32 device_id = FIELD_GET(GUID_DEVICE_ID, guid);
+
+	if (cap_type > WATCHER)
+		return -EINVAL;
+
+	if (device_id == BMG_DEVICE_ID)
+		return bmg_guid_decode(guid, index, offset);
+
+	if (device_id == CRI_DEVICE_ID)
+		return cri_guid_decode(guid, index, offset);
+
+	return -ENODEV;
+}
+
+static void cri_late_bind_probe_work(struct work_struct *work)
+{
+	struct xe_device *xe = container_of(work, struct xe_device, pmt.work.work);
+
+	if (xe_sysctrl_is_oobmsm_fw_ready(xe)) {
+		cri_late_bind_probe(xe);
+		xe_pm_runtime_put(xe);
+		return;
+	}
+
+	xe->pmt.retry_count++;
+
+	/* wait up to 20 seconds */
+	if (xe->pmt.retry_count == VSEC_LATE_BIND_RETRY) {
+		drm_warn(&xe->drm, "PMT probe: Late Binding failed to complete\n");
+		xe_pm_runtime_put(xe);
+		return;
+	}
+
+	if (!queue_delayed_work(system_freezable_wq, &xe->pmt.work,
+				msecs_to_jiffies(VSEC_LATE_BIND_DELAY_MSEC)))
+		xe_pm_runtime_put(xe);
+}
+
+static bool wait_for_fw(struct xe_device *xe)
+{
+	int retries = VSEC_LATE_BIND_RETRY;  /* wait up to 20 secs */
+
+	if (xe->info.platform != XE_CRESCENTISLAND || xe->pmt.survivability_mode)
+		return true;
+
+	while (retries--) {
+		if (xe_sysctrl_is_oobmsm_fw_ready(xe))
+			return true;
+
+		msleep(VSEC_LATE_BIND_DELAY_MSEC);
+		if (signal_pending(current)) {
+			drm_warn(&xe->drm, "Late Binding interrupted\n");
+			return false;
+		}
+	}
+
+	drm_warn(&xe->drm, "Late Binding failed to complete\n");
+
+	return false;
+}
+
+/**
+ * xe_pmt_telem_read - Given a device and a PMT GUID, read data into a buffer
+ * @dev: valid Xe device
+ * @guid: PMT GUID (from the PMT discovery struct)
+ * @data: buffer to place data in
+ * @user_offset: a user offset relative to the beginning of the data to read
+ * @count: bytes to read
+ *
+ * This is a callback API.  I.e this can be accessed external to the XE driver
+ * (PMT driver scope).  Because of this, DRM hotplug needs to be verified
+ * (drm_dev_enter()).
+ *
+ * Return:
+ * * -ENODEV device is not available (hotplug)
+ * * -EAGAIN base_offset has not been set, so init path has not yet been done.
+ * * -ENODATA for incorrect power state
+ * * -EINVAL for unsupported PMT feature
+ * * count   number of bytes read on success
+ */
 int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset,
 		      u32 count)
 {
 	struct xe_device *xe = kdev_to_xe_device(dev);
-	void __iomem *telem_addr = xe->mmio.regs + BMG_TELEMETRY_OFFSET;
+	u32 cap_type = FIELD_GET(GUID_CAP_TYPE, guid);
+	void __iomem *telem_addr = xe->mmio.regs + xe->pmt.base_offset;
 	u32 mem_region;
 	u32 offset;
-	int ret;
+	int ret = 0;
+	int idx;
+
+	xe_assert(xe, !IS_SRIOV_VF(xe));
+
+	if (!drm_dev_enter(&xe->drm, &idx))
+		return -ENODEV;
+
+	if (!xe->pmt.base_offset) {
+		ret = -EAGAIN;
+		goto dev_exit;
+	}
 
 	ret = xe_guid_decode(guid, &mem_region, &offset);
 	if (ret)
-		return ret;
+		goto dev_exit;
 
 	telem_addr += offset + user_offset;
 
-	guard(mutex)(&xe->pmt.lock);
+	/* Always allow crashlog. Telemetry, only when powered */
+	switch (cap_type) {
+	case CRASHLOG:
+		xe_pm_runtime_get(xe);
+		break;
+	case TELEMETRY:
+		if (!xe_pm_runtime_get_if_active(xe)) {
+			ret = -ENODATA;
+			goto dev_exit;
+		}
+		break;
+	case WATCHER:
+		ret = -EINVAL;
+		goto dev_exit;
+	}
+
+	if (!wait_for_fw(xe)) {
+		ret = -ENODATA;
+		goto runtime_exit;
+	}
+
+	scoped_guard(mutex, &xe->pmt.lock) {
+		u32 device_id = FIELD_GET(GUID_DEVICE_ID, guid);
+
+		/* set SoC re-mapper index register based on GUID memory region */
+		xe->soc_remapper.set_telem_region(xe, mem_region);
+
+		memcpy_fromio(data, telem_addr, count);
+
+		if (device_id == CRI_DEVICE_ID)
+			xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
+	}
+
+runtime_exit:
+	xe_pm_runtime_put(xe);
+
+dev_exit:
+	drm_dev_exit(idx);
+
+	return ret == 0 ? count : ret;
+}
+
+/**
+ * xe_pmt_discovery_read - Given a device and an index, read discovery data into a buffer
+ * @dev: valid Xe device
+ * @cap_id: PMT type
+ * @element: element to access
+ * @disc_data: buffer for discovery data
+ *
+ * This is a callback API.  I.e this can be accessed external to the XE driver
+ * (PMT driver scope).  Because of this, DRM hotplug needs to be verified
+ * (drm_dev_enter()).
+ *
+ * Runtime is required to be active.  Calling this out of that scope is not a
+ * correct use case (probe, late-bind probe).
+ *
+ * Return:
+ * * -ENODEV device is not available (hotplug)
+ * * -EINVAL for unsupported device or PMT feature
+ * * -ENODATA incorrect power state
+ * * 0 on success
+ */
+static int xe_pmt_discovery_read(struct device *dev, unsigned long cap_id, u32 element,
+				 u32 *disc_data)
+{
+	struct xe_device *xe = kdev_to_xe_device(dev);
+	void __iomem *disc_addr = xe->mmio.regs;
+	struct intel_vsec_header *headers;
+	int ret = 0;
+	u32 offset;
+	int idx;
 
-	if (!xe->soc_remapper.set_telem_region)
+	if (!drm_dev_enter(&xe->drm, &idx))
 		return -ENODEV;
 
-	/* indicate that we are not at an appropriate power level */
-	if (!xe_pm_runtime_get_if_active(xe))
-		return -ENODATA;
+	if (xe->info.platform != XE_CRESCENTISLAND) {
+		ret = -EINVAL;
+		goto dev_exit;
+	}
+
+	if (!xe_pm_runtime_get_if_active(xe)) {
+		ret = -ENODATA;
+		goto dev_exit;
+	}
+
+	switch (cap_id) {
+	case ilog2(VSEC_CAP_TELEMETRY):
+		headers = &cri_telemetry;
+		break;
+
+	case ilog2(VSEC_CAP_CRASHLOG):
+		headers = &cri_crashlog;
+		break;
+
+	default:
+		ret = -EINVAL;
+		goto runtime_exit;
+	}
 
-	/* set SoC re-mapper index register based on GUID memory region */
-	xe->soc_remapper.set_telem_region(xe, mem_region);
+	offset = element * (headers->entry_size * sizeof(u32));
+	disc_addr += headers->offset + offset;
 
-	memcpy_fromio(data, telem_addr, count);
+	scoped_guard(mutex, &xe->pmt.lock) {
+		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
+		memcpy_fromio(disc_data, disc_addr, PMT_DISC_DWORDS * sizeof(u32));
+	}
+
+runtime_exit:
 	xe_pm_runtime_put(xe);
+dev_exit:
+	drm_dev_exit(idx);
 
-	return count;
+	return ret;
 }
 
-static struct pmt_callbacks xe_pmt_cb = {
+/**
+ * xe_pmt_read_reg() - read a crashlog register
+ * @dev: the xe device that registered the callback
+ * @guid: PMT guid of the crashlog instance
+ * @reg: data read from the PMT data structure
+ * @offset: which data to read from the PMT data structure
+ *
+ * Read the requested PMT register based on the pcie device and guid.  The
+ * supported struct is the Crashlog Type1 Version2.
+ *
+ * Currently this is for CRI only.
+ *
+ * Return:
+ * * -ENODEV device is not available (hotplug)
+ * * -EINVAL invalid guid
+ * * 0       success
+ */
+static int xe_pmt_read_reg(struct device *dev, u32 guid, u32 *reg, u32 offset)
+{
+	struct xe_device *xe = kdev_to_xe_device(dev);
+	void __iomem *disc_addr = xe->mmio.regs + xe->pmt.base_offset;
+	int ret = 0;
+	u32 inst;
+	int idx;
+
+	if (FIELD_GET(GUID_DEVICE_ID, guid) != CRI_DEVICE_ID ||
+	    FIELD_GET(GUID_CAP_TYPE, guid) != CRASHLOG)
+		return -EINVAL;
+
+	if (!drm_dev_enter(&xe->drm, &idx))
+		return -ENODEV;
+
+	inst = FIELD_GET(GUID_RECORD_ID, guid) == PUNIT ?
+		CRI_CRASHLOG_PUNIT_DISC_OFFSET : CRI_CRASHLOG_OOBMSM_DISC_OFFSET;
+	disc_addr += inst + offset;
+
+	xe_pm_runtime_get(xe);
+	if (!wait_for_fw(xe)) {
+		ret = -ENODATA;
+		goto runtime_exit;
+	}
+
+	scoped_guard(mutex, &xe->pmt.lock) {
+		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
+
+		*reg = readl(disc_addr);
+	}
+
+runtime_exit:
+	xe_pm_runtime_put(xe);
+
+	drm_dev_exit(idx);
+
+	return ret;
+}
+
+static int xe_pmt_write_reg(struct device *dev, u32 guid, u32 reg, u32 offset)
+{
+	struct xe_device *xe = kdev_to_xe_device(dev);
+	void __iomem *disc_addr = xe->mmio.regs + xe->pmt.base_offset;
+	int ret = 0;
+	u32 inst;
+	int idx;
+
+	if (FIELD_GET(GUID_DEVICE_ID, guid) != CRI_DEVICE_ID ||
+	    FIELD_GET(GUID_CAP_TYPE, guid) != CRASHLOG)
+		return -EINVAL;
+
+	if (!drm_dev_enter(&xe->drm, &idx))
+		return -ENODEV;
+
+	inst = FIELD_GET(GUID_RECORD_ID, guid) == PUNIT ?
+		CRI_CRASHLOG_PUNIT_DISC_OFFSET : CRI_CRASHLOG_OOBMSM_DISC_OFFSET;
+	disc_addr += inst + offset;
+
+	xe_pm_runtime_get(xe);
+	if (!wait_for_fw(xe)) {
+		ret = -ENODATA;
+		goto runtime_exit;
+	}
+
+	scoped_guard(mutex, &xe->pmt.lock) {
+		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
+
+		writel(reg, disc_addr);
+	}
+
+runtime_exit:
+	xe_pm_runtime_put(xe);
+
+	drm_dev_exit(idx);
+
+	return ret;
+}
+
+static struct pmt_callbacks xe_bmg_pmt_cb = {
+	.read_telem = xe_pmt_telem_read,
+};
+
+static struct pmt_callbacks xe_cri_pmt_cb = {
 	.read_telem = xe_pmt_telem_read,
+	.read_discovery = xe_pmt_discovery_read,
+	.read_reg = xe_pmt_read_reg,
+	.write_reg = xe_pmt_write_reg,
 };
 
 static const int vsec_platforms[] = {
 	[XE_BATTLEMAGE] = XE_VSEC_BMG,
+	[XE_CRESCENTISLAND] = XE_VSEC_CRI,
 };
 
 static enum xe_vsec get_platform_info(struct xe_device *xe)
 {
-	if (xe->info.platform > XE_BATTLEMAGE)
+	if (xe->info.platform > XE_CRESCENTISLAND)
 		return XE_VSEC_UNKNOWN;
 
+	if (IS_SRIOV_VF(xe) &&
+	    (xe->info.platform == XE_BATTLEMAGE ||
+	     xe->info.platform == XE_CRESCENTISLAND))
+		return XE_VSEC_UNKNOWN;
+
+	if (xe_survivability_mode_is_boot_enabled(xe) &&
+	    xe->info.platform == XE_CRESCENTISLAND)
+		return XE_VSEC_CRI_SURVIVABILITY;
+
 	return vsec_platforms[xe->info.platform];
 }
 
+static void cri_late_bind_probe(struct xe_device *xe)
+{
+	struct intel_vsec_platform_info *info;
+	struct device *dev = xe->drm.dev;
+	enum xe_vsec platform;
+
+	platform = get_platform_info(xe);
+	if (platform != XE_VSEC_CRI)
+		return;
+
+	info = &xe_vsec_info[platform];
+	if (!info->headers)
+		return;
+
+	info->priv_data = &xe_cri_pmt_cb;
+
+	intel_vsec_register(dev, info);
+}
+
+/**
+ * xe_vsec_get_guid - Get and cache the PUNIT guid value
+ * @xe: valid xe device
+ * @guid: returned guid
+ *
+ * Return:
+ * * -ENODATA device is not active
+ * * -EINVAL unsupported platform
+ * * 0 success
+ */
+int xe_vsec_get_guid(struct xe_device *xe, u32 *guid)
+{
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
+	int ret = 0;
+
+	xe_assert(xe, !IS_SRIOV_VF(xe));
+
+	if (!xe_pm_runtime_get_if_active(xe))
+		return -ENODATA;
+
+	mutex_lock(&xe->pmt.lock);
+
+	if (xe->pmt.punit_guid_cache) {
+		*guid = xe->pmt.punit_guid_cache;
+		goto unlock;
+	}
+
+	switch (xe->info.platform) {
+	case XE_BATTLEMAGE:
+		*guid = xe_mmio_read32(mmio, BMG_PUNIT_TELEMETRY_GUID);
+		break;
+
+	case XE_CRESCENTISLAND:
+		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
+		*guid = xe_mmio_read32(mmio, CRI_PUNIT_TELEMETRY_GUID);
+		break;
+
+	default:
+		*guid = 0;
+		drm_err(&xe->drm, "Unsupported platform: %u\n", xe->info.platform);
+		ret = -EINVAL;
+		goto unlock;
+	}
+
+	/* the GUID is static, read once and cache for all requests */
+	if (*guid) {
+		xe->pmt.punit_guid_cache = *guid;
+	} else {
+		drm_err(&xe->drm, "Invalid GUID: 0x%x\n", *guid);
+		ret = -EINVAL;
+	}
+
+unlock:
+	mutex_unlock(&xe->pmt.lock);
+	xe_pm_runtime_put(xe);
+
+	return ret;
+}
+
 /**
  * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
  * interface
@@ -210,16 +748,50 @@ void xe_vsec_init(struct xe_device *xe)
 
 	switch (platform) {
 	case XE_VSEC_BMG:
-		info->priv_data = &xe_pmt_cb;
+		xe->pmt.base_offset = BMG_TELEMETRY_OFFSET;
+		info->priv_data = &xe_bmg_pmt_cb;
 		break;
-	default:
+
+	case XE_VSEC_CRI:
+		xe->pmt.base_offset = CRI_PMT_OFFSET;
+		info->priv_data = &xe_cri_pmt_cb;
+
+		xe->pmt.retry_count = 0;
+		INIT_DELAYED_WORK(&xe->pmt.work, cri_late_bind_probe_work);
+
+		if (!xe_sysctrl_is_oobmsm_fw_ready(xe)) {
+			xe_pm_runtime_get_noresume(xe);
+			queue_delayed_work(system_freezable_wq, &xe->pmt.work,
+					   msecs_to_jiffies(VSEC_LATE_BIND_DELAY_MSEC));
+			return;
+		}
 		break;
+
+	case XE_VSEC_CRI_SURVIVABILITY:
+		xe->pmt.base_offset = CRI_PMT_OFFSET;
+		xe->pmt.survivability_mode = true;
+		info->priv_data = &xe_cri_pmt_cb;
+		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
+		break;
+
+	default:
+		drm_err(&xe->drm, "Unsupported platform: %u\n", platform);
+		return;
 	}
 
-	/*
-	 * Register a VSEC. Cleanup is handled using device managed
-	 * resources.
-	 */
 	intel_vsec_register(dev, info);
 }
+
+/**
+ * xe_vsec_remove - cleanup any outstanding resources
+ * @xe: valid xe instance
+ */
+void xe_vsec_remove(struct xe_device *xe)
+{
+	/* Cleanup on Crescent Isle */
+	if (xe->info.platform == XE_CRESCENTISLAND &&
+	    xe->pmt.base_offset == CRI_PMT_OFFSET &&
+	    disable_delayed_work_sync(&xe->pmt.work))
+		xe_pm_runtime_put(xe);
+}
 MODULE_IMPORT_NS("INTEL_VSEC");
diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
index a25b4e6e681b..88e6f6a9e4dd 100644
--- a/drivers/gpu/drm/xe/xe_vsec.h
+++ b/drivers/gpu/drm/xe/xe_vsec.h
@@ -10,6 +10,8 @@ struct device;
 struct xe_device;
 
 void xe_vsec_init(struct xe_device *xe);
+void xe_vsec_remove(struct xe_device *xe);
+int xe_vsec_get_guid(struct xe_device *xe, u32 *guid);
 int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset, u32 count);
 
 #endif
diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
index 2b11c4012f6a..601cdf68f0bc 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -466,12 +466,17 @@ static int pmt_get_headers(struct intel_vsec_device *ivdev, int idx,
 	switch (ivdev->src) {
 	case INTEL_VSEC_DISC_PCI: {
 		struct resource *disc_res = &ivdev->resource[idx];
+		struct pmt_callbacks *cb = ivdev->priv_data;
 		void __iomem *disc_table;
+		int ret = 0;
 
 		disc_table = devm_ioremap_resource(dev, disc_res);
 		if (IS_ERR(disc_table))
 			return PTR_ERR(disc_table);
 
+		/* Used by crashlog driver */
+		entry->disc_table = disc_table;
+
 		/*
 		 * The mapped resource is sized by the namespace's DVSEC
 		 * entry_size (in dwords), which can be less than the default
@@ -480,13 +485,14 @@ static int pmt_get_headers(struct intel_vsec_device *ivdev, int idx,
 		 * region.
 		 */
 		memset(entry->disc_header, 0, header_bytes);
-		memcpy_fromio(entry->disc_header, disc_table,
-			      min(header_bytes, resource_size(disc_res)));
-
-		/* Used by crashlog driver */
-		entry->disc_table = disc_table;
 
-		return 0;
+		if (cb && cb->read_discovery)
+			ret = cb->read_discovery(ivdev->dev, ivdev->cap_id, idx,
+						 entry->disc_header);
+		else
+			memcpy_fromio(entry->disc_header, disc_table,
+				      min(header_bytes, resource_size(disc_res)));
+		return ret;
 	}
 	case INTEL_VSEC_DISC_ACPI: {
 		memcpy(entry->disc_header, &ivdev->acpi_disc[idx][0], header_bytes);
diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index d7018b495217..e2af09732dd6 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -27,10 +27,10 @@
 #define CRASH_TYPE_OOBMSM	1
 
 /* Crashlog Discovery Header */
-#define CONTROL_OFFSET		0x0
-#define GUID_OFFSET		0x4
-#define BASE_OFFSET		0x8
-#define SIZE_OFFSET		0xC
+#define ACCESS_IDX		0
+#define GUID_IDX		1
+#define BASE_IDX		2
+#define SIZE_IDX		3
 #define GET_ACCESS(v)		((v) & GENMASK(3, 0))
 #define GET_TYPE(v)		(((v) & GENMASK(7, 4)) >> 4)
 #define GET_VERSION(v)		(((v) & GENMASK(19, 16)) >> 16)
@@ -208,10 +208,10 @@ static int pmt_crashlog_disabled(struct crashlog_entry *crashlog, bool *state)
 
 static bool pmt_crashlog_supported(struct intel_pmt_entry *entry, u32 *crash_type, u32 *version)
 {
-	u32 discovery_header = readl(entry->disc_table + CONTROL_OFFSET);
+	u32 *disc_header = entry->disc_header;
 
-	*crash_type = GET_TYPE(discovery_header);
-	*version = GET_VERSION(discovery_header);
+	*crash_type = GET_TYPE(disc_header[ACCESS_IDX]);
+	*version = GET_VERSION(disc_header[ACCESS_IDX]);
 
 	/*
 	 * Currently we only recognize OOBMSM (type 1) and version 0 or 2
@@ -608,15 +608,15 @@ static int pmt_crashlog_pre_decode(struct intel_vsec_device *ivdev,
 static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
 				      struct device *dev)
 {
-	void __iomem *disc_table = entry->disc_table;
 	struct intel_pmt_header *header = &entry->header;
+	u32 *disc_header = entry->disc_header;
 
-	header->access_type = GET_ACCESS(readl(disc_table));
-	header->guid = readl(disc_table + GUID_OFFSET);
-	header->base_offset = readl(disc_table + BASE_OFFSET);
+	header->access_type = GET_ACCESS(disc_header[ACCESS_IDX]);
+	header->guid = disc_header[GUID_IDX];
+	header->base_offset = disc_header[BASE_IDX];
 
 	/* Size is measured in DWORDS, but accessor returns bytes */
-	header->size = GET_SIZE(readl(disc_table + SIZE_OFFSET));
+	header->size = GET_SIZE(disc_header[SIZE_IDX]);
 
 	return 0;
 }
diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index 8686e79c4f75..e4afdb6478e3 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -94,6 +94,11 @@ enum intel_vsec_quirks {
  * * data:  buffer for the data to be copied
  * * off:   offset into the requested buffer
  * * count: size of buffer
+ * @read_discovery: when specified called by client driver to read PMT discovery structs
+ * * dev:       device reference for the callback's use
+ * * cap_id:    ilog2 of VSEC_CAP value
+ * * idx:       index to access based on the capability header enumerated by intel_vsec_register()
+ * * disc_data: PMT_DISC_DWORDS dword sized buffer for the discovery data to be copied
  * @read_reg: when specified called by client driver to read PMT state
  * * dev:      device reference for the callback's use
  * * guid:     ID of data to access
@@ -104,9 +109,14 @@ enum intel_vsec_quirks {
  * * guid:     ID of data to access
  * * reg_data: register data
  * * offset:   offset of register to write
+ *
+ * NOTE: Callbacks may be called from the client driver's probe and remove paths.
+ *       A parent MUST not hold a lock taken by the callbacks across the registration
+ *       path or while its devices are being removed.
  */
 struct pmt_callbacks {
 	int (*read_telem)(struct device *dev, u32 guid, u64 *data, loff_t off, u32 count);
+	int (*read_discovery)(struct device *dev, unsigned long cap_id, u32 idx, u32 *disc_data);
 	int (*read_reg)(struct device *dev, u32 guid, u32 *reg_data, u32 offset);
 	int (*write_reg)(struct device *dev, u32 guid, u32 reg_data, u32 offset);
 };
-- 
2.56.0

