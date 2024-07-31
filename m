Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C2DC3DA64
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 20:14:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D3B10E6C1;
	Wed, 31 Jul 2024 20:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BnZaTGil";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3421210E6C1
 for <Intel-Xe@lists.freedesktop.org>; Wed, 31 Jul 2024 20:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722456868; x=1753992868;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=xjxsU6tCoYBGXwtX5PCzEL3t0fTSh5ld1VWgVKzxLNU=;
 b=BnZaTGilctx5/s8xiBXunMybP4uRPg+S9jQj7X514duMV8gTO4zQ8Zqt
 BHlFKrbgyiSj1bWX9qbZNq4vB/10YjgGgYzdCQrD2ds/tM0C7vQ4gO4IE
 I6fDFk4ymMsuzYsNujjEFIX9SVT6CfB628ZcSY3vLIsyUT86+jqQeu2mV
 R6ALz1fO8dNIxc2GlEbPh49adX8Kwmq3Ali1S/MQwSywptbH+9/j0Kc8B
 W1OpOt94FGVKUf66tAzUaIe1TBzLTn/ICfqLhan/Im4txEojrHho5VuWQ
 mkUkf6/xuH9kL201ytgsjBLo/bHVeHrRALO+ZwqcIpRWg7nm95DjX8/3k w==;
X-CSE-ConnectionGUID: lxlJIfCnRNiNc1NB3nOcIg==
X-CSE-MsgGUID: S5LvnH1kQn2CLvJp+VaR0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20311260"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="20311260"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 13:14:27 -0700
X-CSE-ConnectionGUID: bcObrgMqRCCooLskZXvnMg==
X-CSE-MsgGUID: CQDmIrO6Q1K7dbFCd7OpDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="54691673"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jul 2024 13:14:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 13:14:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 31 Jul 2024 13:14:25 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 13:14:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KlU1+RXhjVTsj26/WkwqqgimlOdAGs+A4X+l4whHl4zehnNPTxB5R3RBlVhWOS7fJvncSUX90Fl5WT9B9xcQDNMnDP/gQbOoFHJBp9iIKAaUxbRrShBCcbi6Ob/OLyx2o8nR+BC1meMVPKdzXLidKUxBs4A85mWP5SdQt10sPSSJPwM2STvoAixnPHNHq6DqZv68Bw0EaFHSI8myGcDpzt8h5GIH4A66cNhJ7v8u8wxJxN7Er7B6cjqWbXNzBtkBhivzZBSZDQD8QpspFEacRp58qjRBdivrAnarK6rKJBo0DinnBpGWagcox4i7pM/RkO4dLE7DXDYZb6yubQqIaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xjxsU6tCoYBGXwtX5PCzEL3t0fTSh5ld1VWgVKzxLNU=;
 b=mFeKRy8i1ZTT3gT6mwB7W6db5fn7rtJBMdAoDFJU9fOD3brDIMAvRr8Q3gX2gXcZX8RyxTA3K2n34q0m5nGvCFt8h2MVU94zOIhGmGvOlNupwXdx6nNSKuForvGxazEerLGzZgj8CKh+lnzqkM2NyyFVyUu5GKTmsBcIhA8QBBY9E1GnbnxjPoLohqdWLdVUuHHMeQi1PBy075myiG1K5WkRJsNNBi1wA3rQkygnRVYuvxVWh6CsdvhL1wii/jsrPiKLRtX87V6naDFLMBcr+0FvFMSenvEBeLcSyrWvvO2+Q3yZsqi9stFeC0/oAd3FKpZ4QwW2cWloqfy0azfLOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH0PR11MB4824.namprd11.prod.outlook.com (2603:10b6:510:38::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 31 Jul
 2024 20:14:23 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%7]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 20:14:23 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Intel-Xe@Lists.FreeDesktop.Org" <Intel-Xe@Lists.FreeDesktop.Org>,
 "Harrison, John C" <john.c.harrison@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH v5 1/8] drm/xe/guc: Remove spurious line feed in debug
 print
Thread-Topic: [PATCH v5 1/8] drm/xe/guc: Remove spurious line feed in debug
 print
Thread-Index: AQHa4g2cAsv/bV65Dk+5BVTZgkNA+7IO/bwAgAJFoQCAAAT9gA==
Date: Wed, 31 Jul 2024 20:14:23 +0000
Message-ID: <1dd11a1f9d0ba530483bc443f6ae09481569fb17.camel@intel.com>
References: <20240729231753.3101070-1-John.C.Harrison@Intel.com>
 <20240729231753.3101070-2-John.C.Harrison@Intel.com>
 <9306b3ec-3999-468b-8395-dc3b7900ff6f@intel.com>
 <a9ef6254-f428-47b7-827d-82ec94408ca2@intel.com>
In-Reply-To: <a9ef6254-f428-47b7-827d-82ec94408ca2@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH0PR11MB4824:EE_
x-ms-office365-filtering-correlation-id: 68ddc371-d555-42c5-ccc6-08dcb19d5e86
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VVhCaE1YU3p2RE00aWJZMHp5Smt3cEVQZis2a0F0RmVGR1N3dkRzcjZBWmFM?=
 =?utf-8?B?TFZQa2tmb2RQejE4RlBjUFJhYzgwZzF4SVhCK3dacXlGTFU3TzdtbEFwb2cx?=
 =?utf-8?B?OVhWZmZKY01XeFlSQ3ZTajJjZ2d6WnVJZ21YTXZaa1pnWXRpMlJ5L1hSSCs3?=
 =?utf-8?B?THppM3drdVJmelFjbEZsaTlTblFkeTJkeVNCZGdZNXJxKzdpK0liM0dha1lm?=
 =?utf-8?B?S1dFWmxSUjgrUTk3WXNmaWY0b1NIZTdkU1dOSitHeEQyV0tCRS9xcDlRTkpL?=
 =?utf-8?B?TDZTaVdYNFRHdFNjUEtDaW5BZ1ZnUTVieEY1NWR4WTcza1RoNzFTdnpHT09k?=
 =?utf-8?B?d3VOb0YzclptUXpzeEZ0bmt3RzZEK1pzYzlLb2w4RmFtaktYMm9CbEpZdTBJ?=
 =?utf-8?B?NmhRVHE2UGJaTlE2ODQzanRHelRzR0laUkRZZnNxdGxBZDhTVUlXSEVJdW94?=
 =?utf-8?B?Yk5vckZWT0M4MlVKVmJ3OGNPMlF2dFlIM0NaVi9Qb1Z3TjN6WVZTYnNzZzY0?=
 =?utf-8?B?bjVTZkdTVGswSzhoRWZFSkJORmFYL1V1TnRWeDBqU0gwWFV6UkxPWURtb09P?=
 =?utf-8?B?azYxMW1JbW5oSytiQ1RWWjZhelF1UzQrMkk3Rk85TmZzeXBNajcwUnpjWm1M?=
 =?utf-8?B?MXZidHBTTkpFL3VDZERDZ1Fyd3U0K3Q2bko1cHQyNmd6STBoczVLNjVYaCs4?=
 =?utf-8?B?SkRBSk5xdncreWVWUnV6ZG9ZQVJDd1lKSEdJbmNuVWRiR1NPei8vZXRVc1Bm?=
 =?utf-8?B?d2p0Sjk4ZUFRUE9SRDRtZWhzeEtwOUxQNGlaTERMcUpNblpWTHNpT1RMYkpj?=
 =?utf-8?B?R2R4dXVTWWFMNGF4Y0pSYkwxS0dYWDhkRlVraDZLOFV4UTJMbXFMRTJaVnpt?=
 =?utf-8?B?Z0pMT0wzaEs3ZHVpOXhFODhWOEtJRkQvNFJ3cnBDajZ4Qi80enQwaC9xZncr?=
 =?utf-8?B?OUlYR25pNGZYOGFyOGtCZVN5MFBoMTNGYmw2c3FNanY0WlN0NTY0RyszdTE4?=
 =?utf-8?B?YXR0b0U1UlV1dXNjMTNScjd3Vkh2bFA5dG9lSHNXbERFa2k1WjVGMHR0bHQ3?=
 =?utf-8?B?TUYxWmNueERsZXBCMzZEVythNkFMbTFaSjhDZEgzN2hOSVp2dytlTGlZeWdr?=
 =?utf-8?B?MlpFS3JmZENNQjBMZU94WVNwbnJnQjJLb01rcUpzbzJsa1lSZU5vN0JNampH?=
 =?utf-8?B?cy9BeWlkVXNEbEt1R2ZDMVIvT3k1aGZSVkdybHRObVJ6QzFyNkFvMGIyRWJD?=
 =?utf-8?B?U0FKNHYzd3Q0Um9GeTN1MVdQMElOam9VajN4azdxTmRBdzk3NEZnRVFYaU1n?=
 =?utf-8?B?VTR6dHB4eXFGSmx2WG50ZXdHeFdwQnlaeHNnbWZnclBlTzdWRU5VeHl5cm9R?=
 =?utf-8?B?cjI0UFk3V1JDdlk0bmNidG44NEZ5eHZTTW9TTk9zcnM4bEZOR1ZVYlk2cmNj?=
 =?utf-8?B?ekQzTXZWZDl1bVhlNmE2QTB3Vyt3UXphUkhEMTE0aktTaG05SzhlcHFsZlNq?=
 =?utf-8?B?ellBMzFYcklIQVV3YkpQOHhIbVlGSUhxMlR3WW9kaVVneVI0VHp1eW0wbGth?=
 =?utf-8?B?MFVZTTNJV3VpMTlpdlc2MTZuOHpsVTdhVHExRmx2NDc2Z0hmUUcyOUk3TzV1?=
 =?utf-8?B?L2NNWDdaSURnODdnN2NqRFZyUXhDVHY5c2hDV3RuYkRoMUkzU3ZOcFFyZjFN?=
 =?utf-8?B?eG0wcVEvWVVrdFowVTQvRHRVVnZnZUhlK25iaE9DUzd1MUF1dndYVEkwcmtD?=
 =?utf-8?B?aWt4SVZ5VW9YQXpyQVVkUUVlMnZLU0ZubFdpeEhtN0NyR0lySEJyWitEMmRt?=
 =?utf-8?B?UlNkZG1PdzJ2R3ErOHRZQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RGJhejk3SlJzeXBYeW5Db3VwRzlUMHRBNk5xcXJEazRIbTQveGhCMjNYYmwz?=
 =?utf-8?B?RlNianNyMDZiZWdjSUpzVEt2c2oyU2R0b0V3ODhjY2FNZDNXQy8xQlpHZnh2?=
 =?utf-8?B?NnMyamJUb2F5YnVPOWRtK2xMOVJhOE1FTkJmZGlaa3pjbDFBbVNWb2hsdGxm?=
 =?utf-8?B?Y09MV2ZZSWR0U2dlWEV5MUE3a1VpOVo1eUVmT210bWxzUk9xSzRoNzF3alFp?=
 =?utf-8?B?UjhyWHhyZU4xenhJWldhM2xLUDllRENnaUZSOThIMkFiUHd0dllRVmxEQ2lj?=
 =?utf-8?B?dDhTdjNnNTBuSVlDenIrYzdSRUdvQnRibUNyYXJmbVVIcEIwVGcxK1BUdGov?=
 =?utf-8?B?T0lHaFVoalcrd0pRc01KaklqaDNuTUxVODJlaE50RGJ6TjBNWHB4V0NkK3hr?=
 =?utf-8?B?QXVtMUZWOXV6dWFuUVFhVko0bStXUXZ1ZjAyVHBwejdnZVFDaCsrUHpTYlhQ?=
 =?utf-8?B?aUhxd2JNdUFOTnZpZE9jOFNyY1VCS1J6WW1PMGtoamtZcnNRWTFYc3p0aTlP?=
 =?utf-8?B?eVE0QThMcG1wSlg5UndielhPU1JYVEJhOUphVjFZa1N0dGlWM3NJRnpmbEY4?=
 =?utf-8?B?QTlGT1hsSGxZQXR0NmY1K0RLZTl2UnFCbmxsc08xc2JZNi84eWtWSUpmWStv?=
 =?utf-8?B?emtYUnVDY0lKV0dJTm1XUm5Od1c2Qm9lTm1UMWM5U0NmMlJiSmFZbExRdmdk?=
 =?utf-8?B?MGtGQWtFWXVkOHFSc2k5aWhoR0JoTnIvQXlRZEpadzREdXZxdDYrQm1VWHQw?=
 =?utf-8?B?dVEvV1VxcWlkemVQcnYyb2RSR2t1eWxkR251U3FyZytLRTF2Wm04blRhYTBB?=
 =?utf-8?B?Sml2T0N5UzZYNjJqeUJ1Z0NYUXVFbXFwNll4a3k0VjFzWjZjMnFiV2E1bHY0?=
 =?utf-8?B?QkoyZ2dFUVBvMWIzYWdEaDJ3aEsvNjcxQ0NTSkVpQmNmR1prTTBDdUl2QzQ0?=
 =?utf-8?B?L2hTaDJOL2pQY3RWbWpJR21RSmxzSnIxNU9kRmk3WU9CZlNJdEdCQ1prTjZH?=
 =?utf-8?B?RmN1ZjEza3pVZzJINTFETThkMnNKUm0xQVZudzRwcW5za2d4TlBVY0M1VEdt?=
 =?utf-8?B?cElXRGNYc3dyQUxSVmlJNkVXanhvNlN1TXhBL3NsSTd4SjlZZUw4NllYRGcx?=
 =?utf-8?B?TzJQWS83VFVwV3NLZjBXV095QWc2MGR2bWtNZEtlclRHc3dQcU14K1NQTm9w?=
 =?utf-8?B?Wm1MMXJhMnp1R3VBRFlOcVpIV0IxUUJaSWpzRTdxRmhqOU9kVTVSSzlhdEhE?=
 =?utf-8?B?VVNjRzFrUG9QdzlnR214WjI3d0krNEpwdVhqQ3BrUDNsTjNVL1dlMU1uTUcv?=
 =?utf-8?B?Q1Y5NDhpektlMEduQWdFVThXNENaeWVkWFc0Q3IyNitVdHNsUDZWZ2t1MDNT?=
 =?utf-8?B?QnNGWFJtYmppVlpjWFVVcTR0QTJ3VWdmWHJ5T1ptYk1Xd3l6S1ZwUjdSNHpP?=
 =?utf-8?B?RFJKdnR1Y0duQ2ppcDk2NG9tcy84YWlVbi9uTmtaRkZPdFpCRmlDbnljbVpM?=
 =?utf-8?B?cVp3V1lMdzVVRzhrVlNFQ2czcFRYYW9JVTNrOW15a1dJaWpTS2ZHMnVFUUlH?=
 =?utf-8?B?OVQ3RlJpVGJ5ODVNSXQ5cjhTcEJYck1KUjl1c0lPWWlqaitsNGZDOFdZTTlt?=
 =?utf-8?B?Zk9MSGI5ZFRmM0JUaUVMV3JHR0Y4bEw1VGNPZUxseXMvMW9yb2lUNU9RUXYr?=
 =?utf-8?B?bC90RzM4Ujd4VzRBZ3hCZ0lGZEZYVzQwL0QrSmZlTEZRcVZSQzY4MGlXbDdF?=
 =?utf-8?B?N0U5UmhCQVBRK2ZsSVF2czBRalBFYlNWKzVxRDNzSzMwNmtOY1ppT2tVZEln?=
 =?utf-8?B?cHdhY3NkWlBOb3VOeW05WEdqWVQrZjhUQzZDeEs5NjRjbEZXclFUYnlMbVQx?=
 =?utf-8?B?T3Y2RE9zUER0TzAyd2p2Nm84U0xoeXlWaFpSYyswVUhIejRYVm1ROEZJanJP?=
 =?utf-8?B?SDRWenQrdGl6ZWZPNWtQbXo4dUpjQ1FBYVZ6SzQrS0dBUGhCanZLWWtuQU5l?=
 =?utf-8?B?aDhnK1BOM21mRGdxdW5rS2JBTy9GSzMzRjVNQlRERHo5Z2tMK29OenZRdEM0?=
 =?utf-8?B?c0QwVFZkSHZ3M0tvN1B1U215Sm5ITzRsa3BSZkxLVTBNZGg4ZnZ4MFVlZU5j?=
 =?utf-8?Q?aHE/1UZvS957EfBpP2mCPpqAU?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D263AA2333C9F146B5DB88C057A1728B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68ddc371-d555-42c5-ccc6-08dcb19d5e86
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2024 20:14:23.3063 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iqX0p7caa7olrpmIfTB9gejSQezLGNdj10gdIyVIwoXQv9jlnf72ccbagkzQsEWKzbZTULZAnYqqN1pUXLnQdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4824
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

T24gV2VkLCAyMDI0LTA3LTMxIGF0IDEyOjU2IC0wNzAwLCBKb2huIEhhcnJpc29uIHdyb3RlOg0K
PiBPbiA3LzMwLzIwMjQgMDI6MTQsIE1pY2hhbCBXYWpkZWN6a28gd3JvdGU6DQo+ID4gDQo+ID4g
T24gMzAuMDcuMjAyNCAwMToxNywgSm9obi5DLkhhcnJpc29uQEludGVsLmNvbSB3cm90ZToNCj4g
PiA+IEZyb206IEpvaG4gSGFycmlzb24gPEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5jb20+DQo+ID4g
PiANCj4gPiA+IEluY2x1ZGluZyBsaW5lIGZlZWRzIGF0IHRoZSBzdGFydCBvZiBhIGRlYnVnIHBy
aW50IG1lc3NlcyB1cCB0aGUNCj4gPiA+IG91dHB1dCB3aGVuIHNlbnQgdG8gZG1lc2cuIFRoZSBi
cmVhayBhY3R1YWxseSBhcHBlYXJzIGJldHdlZW4gYWxsIHRoZQ0KPiA+ID4gdXNlZnUNCj4gPiB0
eXBvDQo+ID4gDQo+ID4gPiBwcmVmaXggaW5mb3JtYXRpb24gYW5kIHRoZSBhY3R1YWwgc3RyaW5n
IGJlaW5nIHByaW50ZWQuIEluIHRoaXMNCj4gPiA+IGNhc2UsIGVhY2ggYmxvY2sgb2YgZGF0YSBo
YXMgYSB2ZXJ5IGNsZWFyIHN0YXJ0IGxpbmUgYW5kIGFuIGV4dHJhDQo+ID4gPiBkZWxpbWV0ZXIg
aXMgcmVhbGx5IG5vdCBuZWNlc3NhcnkuIFNvIGRvbid0IGRvIGl0Lg0KPiA+ID4gDQo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBKb2huIEhhcnJpc29uIDxKb2huLkMuSGFycmlzb25ASW50ZWwuY29tPg0K
PiA+ID4gUmV2aWV3ZWQtYnk6IE1pY2hhbCBXYWpkZWN6a28gPG1pY2hhbC53YWpkZWN6a29AaW50
ZWwuY29tPg0KPiA+IHRoZXJlIHdhcyBzb21lIGRpc2N1c3Npb24gYWJvdXQgbWVyZ2luZyB0aGlz
IG9uZSB3aXRob3V0IGEgY29uY2x1c2lvbg0KPiA+IA0KPiA+IFsxXSBodHRwczovL3BhdGNod29y
ay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvNjAxMDE4Lz9zZXJpZXM9MTM1NDQ3JnJldj0xDQo+IFRo
ZSBsYXN0IGNvbW1lbnQgd2FzIGZvciBNZXNhIHBlb3BsZSB0byBzaG91dCBpZiBpdCB3b3VsZCBi
ZSBhIHByb2JsZW0gDQo+IGFuZCBuby1vbmUgc2hvdXRlZCwgc28uLi4NCj4gDQo+IEhvd2V2ZXIs
IEkgd291bGQgc3Ryb25nbHkgYXJndWUgdGhhdCBkZXZjb3JlZHVtcCBleGFjdCBsYXlvdXQgYW5k
IA0KPiBjb250ZW50IGNhbm5vdCBiZSBjb25zaWRlcmVkIFVBQkkgYmVjYXVzZSBpdCBpcyBnb2lu
ZyB0byBjaGFuZ2UgYXMgdGhlIA0KPiBkcml2ZXIgY2hhbmdlcy4gU29tZSBvZiB0aGUgaW5mb3Jt
YXRpb24gYmVpbmcgcHJpbnRlZCBpcyBpbnRlcm5hbCBkcml2ZXIgDQo+IHN0YXRlLiBEcml2ZXIg
aW50ZXJuYWxzIGNhbiBuZXZlciBiZSBVQUJJLiBJZiB0aGVyZSBhcmUgdXNlcmxhbmQgdG9vbHMg
DQo+IHBhcnNpbmcgdGhlIGR1bXAgdGhlbiB0aG9zZSB0b29scyBoYXZlIHRvIGJlIGFibGUgdG8g
YWRhcHQgdG8gY2hhbmdpbmcgDQo+IGNvcmUgZHVtcCBmb3JtYXRzLiBUaGVyZSBpcyBhbHNvIHRo
ZSBhcmd1bWVudCB0aGF0IHdlIGFyZSBzdGlsbCBpbiANCj4gZm9yY2UtcHJvYmUgc28gdGhlcmUg
aXMgbm8gZml4ZWQgVUFCSSB5ZXQgYW55d2F5LiBTbyBub3cgaXMgdGhlIHRpbWUgdG8gDQo+IGdl
dCB0aGUgZm9ybWF0dGluZyBhcyBnb29kIGFzIHBvc3NpYmxlIGJlZm9yZSBvZmZpY2lhbGx5IGdv
aW5nIGxpdmUuDQoNCkkgZG9uJ3QgdGhpbmsgS01EIGNhbiBmcmVlbHkgYnJlYWsgZnVuZGFtZW50
YWwgVU1EIHRvb2xzLCBkdXJpbmcgbXkgdGltZSBpbiBLTUQgdGVhbSBpdCB3YXMgbm90IGV2ZW4g
YWNjZXB0ZWQgdG8gYnJlYWsgdGhlIGJlaGF2aW9yIG9mIGEgc3lzZnMgb25seQ0KdXNlIGJ5IElH
VCBkaXNwbGF5IHRlc3RzLg0KDQpMaWtlIEkgc2FpZCBpbiB0aGUgcHJldmlvdXMgdmVyc2lvbiwg
SSBhZ3JlZSB3aXRoIHRoZSBjaGFuZ2UgaWYgeW91IGFkZCBvbmUgbGluZSBicmVha2VyIGluIHRo
ZSBlbmQgb2YgZ3VjX2N0Yl9zbmFwc2hvdF9wcmludCgpLCB3aXRoIHRoYXQ6IFJldmlld2VkLQ0K
Ynk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KDQpoYXZp
bmcgYSBicmVhayBsaW5lIGJldHdlZW4gc3ViLXNlY3Rpb25zIGlzIGdvb2QgZm9yIHJlYWRhYmls
aXR5Og0KDQoNCioqKiogWGUgRGV2aWNlIENvcmVkdW1wICoqKioNCmtlcm5lbDogNi45LjAtcmM2
LXplaC14ZSsNCm1vZHVsZTogeGUNClNuYXBzaG90IHRpbWU6IDE3MTU4Nzc0MjAuNjQ3MjExMzc3
DQpVcHRpbWU6IDcwNjg0LjYwNTk4MjY2NQ0KUENJIElEOiAweDlhNDkNClBDSSByZXZpc2lvbjog
MHgwMQ0KR1QgaWQ6IDANCglUeXBlOiBtYWluDQoJSVAgdmVyOiAwLjAuMA0KCUNTIHJlZmVyZW5j
ZSBjbG9jazogMTkyMDAwMDANCg0KKioqKiBHdUMgQ1QgKioqKg0KSDJHIENUQiAoYWxsIHNpemVz
IGluIERXKToNCglzaXplOiAxMDI0DQoJcmVzdl9zcGFjZTogMA0KCWhlYWQ6IDk3OA0KCXRhaWw6
IDU5OQ0KCXNwYWNlOiAzNzgNCglicm9rZW46IDANCgloZWFkIChtZW1vcnkpOiA1OTkNCgl0YWls
IChtZW1vcnkpOiA1OTkNCglzdGF0dXMgKG1lbW9yeSk6IDB4MA0KDQpHMkggQ1RCIChhbGwgc2l6
ZXMgaW4gRFcpOg0KCXNpemU6IDQwOTYNCglyZXN2X3NwYWNlOiAxMDI0DQoJaGVhZDogNjI2DQoJ
dGFpbDogMA0KCXNwYWNlOiAzMDcxDQoJYnJva2VuOiAwDQoJaGVhZCAobWVtb3J5KTogNjI2DQoJ
dGFpbCAobWVtb3J5KTogNjI2DQoJc3RhdHVzIChtZW1vcnkpOiAweDANCglnMmggb3V0c3RhbmRp
bmc6IDANCg0KR3VDIElEOiA5DQoJTmFtZTogcmNzOQ0KCUNsYXNzOiAwDQoJTG9naWNhbCBtYXNr
OiAweDENCglXaWR0aDogMQ0KCVJlZjogNA0KCVRpbWVvdXQ6IDAgKG1zKQ0KCVRpbWVzbGljZTog
MTAwMCAodXMpDQoJUHJlZW1wdCB0aW1lb3V0OiA2NDAwMDAgKHVzKQ0KCUhXIENvbnRleHQgRGVz
YzogMHgwMTQ4MDAwMA0KCUxSQyBIZWFkOiAobWVtb3J5KSAyODANCglMUkMgVGFpbDogKGludGVy
bmFsKSA1NTIsIChtZW1vcnkpIDU1Mg0KCVN0YXJ0IHNlcW5vOiAobWVtb3J5KSAtMTI1DQoJU2Vx
bm86IChtZW1vcnkpIC0xMjYNCglbSFdTUF0ubGVuZ3RoOiAweDEwMDANCg0KDQo+IA0KPiBKb2hu
Lg0KPiANCj4gDQo+ID4gDQo+ID4gPiAtLS0NCj4gPiA+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d1Y19jdC5jIHwgMiArLQ0KPiA+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkNCj4gPiA+IA0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndWNfY3QuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY3QuYw0KPiA+ID4g
aW5kZXggYmVlZWIxMjBkMWZjLi40MjJjM2Y1Yzg3ZDggMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2N0LmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9ndWNfY3QuYw0KPiA+ID4gQEAgLTE1MTUsNyArMTUxNSw3IEBAIHZvaWQgeGVfZ3VjX2N0
X3NuYXBzaG90X3ByaW50KHN0cnVjdCB4ZV9ndWNfY3Rfc25hcHNob3QgKnNuYXBzaG90LA0KPiA+
ID4gICAJCWRybV9wdXRzKHAsICJIMkcgQ1RCIChhbGwgc2l6ZXMgaW4gRFcpOlxuIik7DQo+ID4g
PiAgIAkJZ3VjX2N0Yl9zbmFwc2hvdF9wcmludCgmc25hcHNob3QtPmgyZywgcCk7DQo+ID4gPiAg
IA0KPiA+ID4gLQkJZHJtX3B1dHMocCwgIlxuRzJIIENUQiAoYWxsIHNpemVzIGluIERXKTpcbiIp
Ow0KPiA+ID4gKwkJZHJtX3B1dHMocCwgIkcySCBDVEIgKGFsbCBzaXplcyBpbiBEVyk6XG4iKTsN
Cj4gPiA+ICAgCQlndWNfY3RiX3NuYXBzaG90X3ByaW50KCZzbmFwc2hvdC0+ZzJoLCBwKTsNCj4g
PiA+ICAgDQo+ID4gPiAgIAkJZHJtX3ByaW50ZihwLCAiXHRnMmggb3V0c3RhbmRpbmc6ICVkXG4i
LA0KPiANCg0K
