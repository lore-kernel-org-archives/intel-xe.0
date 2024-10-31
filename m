Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F5DE67485
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 22:40:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B5A10E033;
	Thu, 31 Oct 2024 22:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E2u2io50";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58AC910E033
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Oct 2024 22:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730414447; x=1761950447;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=8Qpja52EVHbYEPpkCrIBewugoaEWgh+W+o17HjHDSHA=;
 b=E2u2io50vkXqNcrFc3Eo4fh3KPszYXdKlSw6Jg3GC4BwCuB0VRP+xRKn
 6/HFqU+zHUIrvWnjrRSJ/ZsFYGsLjp/OSDm6/Nmc/exGviLcVQFCyj9kE
 ZB/jewiczJxnt4swT9t/vnc+V+Uozemap/dW+vybN8VJB6YtQOgKTg4rX
 WC3kqmv/h9DwF4EezGtuaFAgsgc2UVcnyK5KM53Vpyk4ub6NIShwEwRNH
 NClWbMIsoc2Mmo0mBxG7bycrkV7KtRPwBk5IiacFArs0XKz3lrV4fgayI
 XifSSBh+l9t9E9eK9RonvHVIJL4qQqc0pUFJSxmZgdIEvTJVKrXo8AyUi A==;
X-CSE-ConnectionGUID: +hvh9WeQROC+Vp3XB8NvKQ==
X-CSE-MsgGUID: xcD+z9t2TWWkrIDbg/i2Sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52745889"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="52745889"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 15:39:03 -0700
X-CSE-ConnectionGUID: 7oRT51wdQEWMVyklBaNwuQ==
X-CSE-MsgGUID: 2EnMh9N/S2GFvJgPIRXdIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="87319946"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Oct 2024 15:38:59 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 31 Oct 2024 15:38:57 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 31 Oct 2024 15:38:57 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 31 Oct 2024 15:38:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OTlgKIif0dZaGvHfsTp3nwPAGpeT3FJ8da//bLfsWPRf/7XRPoMQC1asFxMCQ1ROLR/jUyaPFLKB2AVROy0Dr0WUxXB+AvGiA8x2yxgQ/67XrEirHeKs2HYwPBUwaBTW3wbgDZ/df5xwebtuUz0b76kcq+myCWroC+i+Km6n/HmuQSpg1HCo5JgkCe2P37v0oCde2CkN49ACpoKGIfRr1VnnmTHFj85dJT9dIram1dlqdeKyRsv0PPx/A9LBWdcJ/crvB0tr7MqZu56q5SbtCIpJxkp4oevI53qhQOeqkwXUOcv1Hkmc8WQJ8KTswBaUDb5e5M6OHYeTNEJZsvhQCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Qpja52EVHbYEPpkCrIBewugoaEWgh+W+o17HjHDSHA=;
 b=kEI9V1jZ14mh1o0RO9LGHJCMicLtvLc0FIMjD/KNU3DJMRdc4hlleeia1SI5kkUGZsd81LhZC2jUphFVmxe2EgBkbU2UH21AbNqltsTwkHyO1EnRl9Q7K+ajfVlNTDV8Rgf1lgzOTuayHsKXrwPfJZxAeg2DUX13BIT0LY9XYZHZewYbKtLpwJ32YYjE9rEyEWooyP0J82C5klaiISWlk2lBc5X8KSNGn3Lya80XBx2xBg0g/8tPAKrDLhHio+vi+DMX/BUlTM8TR/EXgN3cs9QHqjvK95m0VNKRw0efk8HpSSzoUxtXarnHYEsj7UWA1cZaBNWaUEPGljCxAWtaSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN0PR11MB5758.namprd11.prod.outlook.com (2603:10b6:408:166::18)
 by BL1PR11MB5256.namprd11.prod.outlook.com (2603:10b6:208:30a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Thu, 31 Oct
 2024 22:38:54 +0000
Received: from BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::5183:feab:8a06:b19f]) by BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::5183:feab:8a06:b19f%4]) with mapi id 15.20.8114.015; Thu, 31 Oct 2024
 22:38:54 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v1 1/1] drm/xe/guc: Fix missing init value and add
 register order check
Thread-Topic: [PATCH v1 1/1] drm/xe/guc: Fix missing init value and add
 register order check
Thread-Index: AQHbJYEZyeC3gjjTgEOHlTKyd0WKbrKhgE8A
Date: Thu, 31 Oct 2024 22:38:54 +0000
Message-ID: <ae2c5a7e6467859249c3c90cead887003ee70425.camel@intel.com>
References: <20241023192307.746525-1-zhanjun.dong@intel.com>
In-Reply-To: <20241023192307.746525-1-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR11MB5758:EE_|BL1PR11MB5256:EE_
x-ms-office365-filtering-correlation-id: 107baa1c-e03f-4319-93b3-08dcf9fccce2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?czQ3dlh5dndrZmFvVTlHQVNxQ1JhWXRCN0JrQ216dENQaTVGdVdjUUQ4WS9T?=
 =?utf-8?B?b3h6NXBHZjFoTWdvRUpBdWo5NmVPczRJeEFhVDVIbVY4dnlBTGRwa3RDNk4v?=
 =?utf-8?B?eCs5czFicDRWOE9Tb2xFNzI3N0ZTS01tdktobG01UzZOZzQ5VFpreWdyeVU5?=
 =?utf-8?B?OUJaVEZJd2YzTjhBbnVPSjNzSExJK3RVZDZHd1I2S3FOYWpTeW51QlBDc2V1?=
 =?utf-8?B?THVCS1JybDdUUklGaTJBOTVmTEd0Vy9hQWI2OUxDck85UDdKeXUwbUlCMHRX?=
 =?utf-8?B?S0JFQnlCVWVxeUNyTkNvTWdFNTk0c29CNm8wcS9JdHJuVE9tc09nREJ0SHJN?=
 =?utf-8?B?MUNMa0xqZzRscEt5R1hJZ1IxRTZCRit0SDRJQnU4c0Z5UzU4R1ZZMlkycDBJ?=
 =?utf-8?B?UmJ2MngxSVdVYkdlc211OTE3dDV1WmZjdEZMNWRGMC9NWG95WUJ5QXhlQTUr?=
 =?utf-8?B?RnlpalphQ09EUFordi9zeGwyYjZRZWtZemZNVWthSktYRi9hT1NzVXZudUJ5?=
 =?utf-8?B?UWUvMmdrVWRScXBNVjBVUnVCcnRCU0pteW1qVDc5WG1ZT2MvVFd3bzdqR0hp?=
 =?utf-8?B?WkhPQy9IYkw5NUZzSWtkMStWc1NFQW8rOTIvakU2YjV4MURsOGJ3ZVI4a0NX?=
 =?utf-8?B?NllHem1aSWlsc0RyNHloTzZGUWl0bHFjVGNqR2xRM2xTZ1NJdmFBYUpxbFhB?=
 =?utf-8?B?QjNDUFZya2lOcWc0ZHZYaUM4amd4aldGdzhEblNsN08rMlEzNXVZOXpQaXhE?=
 =?utf-8?B?Uk1GNWtMNkwxSlZmdGlIbkpmZVFzOUptSU9SajdVTXBCRE5Pc1c4U2gvZnds?=
 =?utf-8?B?SEhodXNTc3NYUDkxa3NWRnc5ekdpbTJyMzN6LzMrQTVHbDliaGNWanJlbmxU?=
 =?utf-8?B?MW80WERkV3AzL3Vjc1JaazRNb0NoTUhoTStNOTZPYmdYOUJHM2JpcWd0eGlx?=
 =?utf-8?B?T2lmNE1GSWZHQzhKdG5hbHU5bjlDamhjWVhhNCtmWjYyb09tQXZKUGhteEZS?=
 =?utf-8?B?WnJPRHdEejk1S2MvNFg2MnZ6M2syMFo4WWl4ZU03ek0wdGU5K0JOdkR5RHBK?=
 =?utf-8?B?NjloUXdWWnZZanRtTWFsU1hQbHhjZVc5WWhsajRGdlNmTDRYU2lRSElmVWth?=
 =?utf-8?B?RTJpYlcvYVRLMENkTHlrTlNTblhKbytEQU4yZlpCQUhyeGxqYi9nNXlaaFg3?=
 =?utf-8?B?ZmtGMVVIQmg4MkplREp1UW5VdkZXWEF6SE91MFRpV2NaY3FoSXhLY2JHZ0t1?=
 =?utf-8?B?OWRYN29SRldwKzgyWWVNVXFLLzc2Tm8xQzIzY2pIZEpuNUFiS05ja3VRbHNh?=
 =?utf-8?B?TUpud0srTFZ4WC9BQWpwRkNGZUlCbzNyZzFONU1BY2hSQ0ZSNTEzMWZvMTZZ?=
 =?utf-8?B?cXgrUFVzakhQL0tESU1jdnZpS1BiRmNhMEJrdU1wUXRFeU1EeGVrdTl6NEdp?=
 =?utf-8?B?eU5lZko5Y296VUV2RWJZcE9Sd0F0QmNTUGFWZWlpcFNvekd0VVFCemtEaGNs?=
 =?utf-8?B?dHR1cG03MHBUWGkxZlBSMlIwVUdibEdEanlXQTJNMEwwdHl0OUI2RjNhb25a?=
 =?utf-8?B?SnVSYUIxR2oyNkdEREtGLzhIUDJwN2dpUXFBbFArNWxOcmE4Z3p3cmFRcWJp?=
 =?utf-8?B?N0xsLzQ2M2RNRlNSdFFCeUtXWTFVbE5ENERTRldSUjFTZlBGSldTQ0ZpampX?=
 =?utf-8?B?RDNtV0lrSVdmdjkrOFk2RHpVOUpGdGhKaDZNUHpIWUQvUitaN3kxUkk2TVU5?=
 =?utf-8?B?NFpwSllFejJJL3dzQXpQWkFleGF1UXJJNUorVUhsRmNyaDhMOWkwcmxzVjFm?=
 =?utf-8?Q?Z1GLhnMttNaycTdbqwI8nm3nqOoC0xvcpdges=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5758.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a3kvZVdFaE1Gb081cXVmRDVJRXNIQ3Ruck45K3ZDcjNTSUJFZTYyaURZZ280?=
 =?utf-8?B?TjA1S1IrY2V3OHUzTm5iODJMQlZzUG1seEl3NTNETTJRMmhsVUJTOXhROFNT?=
 =?utf-8?B?QWlaZ0ZYOEVxTEltaXF3b1ZEdE1rd3ZpMEtFdEU4QzdDOE8vcDVMdnB4ZUly?=
 =?utf-8?B?WGkvcDZCT2RyZGkvYkZKS1djaWtEK2E4MzJ0ZmZLVlRIUFc1ZnZ5RTZPN2M0?=
 =?utf-8?B?YW9iVVZKd1ZoTWJrQW4vZ2dZa0R5dUdSdXVXcTF4M3BMS2dpbnI2TlNyNlRY?=
 =?utf-8?B?NXBIdVc4Y3VsWmNnMDBvQTlwZm94TTFmVUVjT3BkdytpS080OGV4c3BuTGMy?=
 =?utf-8?B?aXppbmVQemJDL3dFOWZwdDdzeWZxYUxod014ekdjNFlBeWlWbjlsWkcyUVlo?=
 =?utf-8?B?c1M3dklaclNUMW9HSlNCeWpDM2pXUTRVREhybi82UmJoNkVqa05mMXE4MXcr?=
 =?utf-8?B?QXYrek1hQmxVTEUyd1VYTEpFNnhkRTMvQzU0UlFnQW9EakdTRUpLaGhWMVRS?=
 =?utf-8?B?TUFMNDJGUUtrRnJXZCtHMFFWdjBqQXE2NGlNblQ0Q0h6THh0SzUyYVhkcTlR?=
 =?utf-8?B?WXBxYTdlMTk5WGtsNWVXdmdwaVFzRklBWnExOVlJSkpISkRhQndZWWFmZ1dr?=
 =?utf-8?B?dnFvbVp5ZHBNRUlsT3dOOFl1blVNSFE4eXFHc2M4dTVKV0JIOFRIQmNENjQ1?=
 =?utf-8?B?SmdSNnRlczY4U3ZkbngyN2RiRndodHVZYld0aHRtM0ZWV1Q4UWJwUU5pMFdK?=
 =?utf-8?B?TmROZ0Z1NFZobWZrY2UxK09rSmZvcUhUYmdXdTRydUFDUnZ4cGFjUXB5WmFh?=
 =?utf-8?B?UmJRMWRJdjh3di9rUjNnYjFhWDNaZzQ1ZnVzbUxpeWRHQUxGYnRXQmxzSHlX?=
 =?utf-8?B?R3dqdmlPSmFDN0JXcFI1ckduUlpFOElCa0Q5cXVCZTFvNEU5L2ZrVWtiMXBK?=
 =?utf-8?B?bG5zcC95Z2RrZUpxWi9ZL0ZhV0U3bFl6Qld0dVY0ZExyODM5bldhYmtCQmJz?=
 =?utf-8?B?RmNWNHhwczhSSGtGenhSTFJTbG1kT29lRlhMV0E3QkJ1dWVVOG5TcFBUQ0Ra?=
 =?utf-8?B?bml5WGxCQ2tNaGsyWS92b3Z3ZG1BRnQ4ZzNUMWxDSHBqdDIxelMvTE9PTHZW?=
 =?utf-8?B?R1RwNG1wUEZGaDVxREVaZWZlSXpTUDhHRTRwejRvVk0zZ1llUlY3Q05jYXp2?=
 =?utf-8?B?NG9aMEdTMHoxNjYxd1Q4VWpLdFA1eGFyMFZ0TGxEVFloREl6cDhZei9abG9M?=
 =?utf-8?B?MHRFQ1BMVWRrTDZMTGozTGZEbEN2S2ZQVEJpVFJoVjlGTjJJdzdSU2tzS2RQ?=
 =?utf-8?B?NXppMzB6Y2g2emhQQURVWUUwM0NrKzNaWXdmZmxFMjRBaFZsSlJTUC9mV2s4?=
 =?utf-8?B?Q3NnNUtJUUl1akZSWlVyUE1oRmZzY0s3dDRHRXV4TSs0QkVrQTRaQ1JRc00z?=
 =?utf-8?B?M21PcW1sMG5xVzJ4RjEzWjVXM0FPVzBkMS9Pb29kRldPS2xWZjBZcUFvUGds?=
 =?utf-8?B?bnpIaStnS0g5TzgyYTJRMzdWVnJMeXV0dzRMS0kwWktocnlodjdvQlhEMm1m?=
 =?utf-8?B?c2liTXdNamRLTEY1dm5HMm1uT3d1alVMb1laMjIzbFRuUy9uL3A1UmoweWVa?=
 =?utf-8?B?TTV6Sm1nVllxdCtNYkFkc1BNVm5VaGFlT3BwNVV1N3pQWStLWW1pcU1UeHRa?=
 =?utf-8?B?WlZOZ3R3dDM4U05nVURUcHhNYTVVMmdJQmRzMmJhL25FQm1TSUpQMXdxdExp?=
 =?utf-8?B?eTU3RDljQjVxb21hbVV5dCtmb1F6U2VMajlIMlZjZDNva0cyeEE2MER2RUNZ?=
 =?utf-8?B?OG1CaTl6NTExaFpGR0pVZVpkVW1zY1J6VFRsaWFvNHpGQzRtYUJEZHRDK3N1?=
 =?utf-8?B?YVFHOTZXbjZ2bVgxVDM0RVlnZ1BwRE85bUtlenRPMys1N21BeUZxeE1tOXd1?=
 =?utf-8?B?R0s4RE9zM2l6bWtUYUtpYS9maE5rQjMvNVVISVVKRVNxeGxpU3huV2M3bzlW?=
 =?utf-8?B?Q01kdkFMTmJEcTA1Z2xMTmIyUDBqUjlGbGFhV0F0Njd5VkpWVTFLd3BzMjJm?=
 =?utf-8?B?ekwzLytNNmtPSzZjdkV1UDlBeHVNcEZNQmhDRi9XM1k5UlpZWnVreFJvazdC?=
 =?utf-8?B?SlNQeVZXTW45WmFtYUxTZHgwTFRkVUdZU2NmTzN5L0VuTi84SUttNEZickd1?=
 =?utf-8?Q?YRzRb5xc2runIHR4X9zbEC4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B1629FA551583F4CB167DEB11F56A9BC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5758.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 107baa1c-e03f-4319-93b3-08dcf9fccce2
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2024 22:38:54.3882 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LIqU6lGBz0+qj3c3KvopsKnAmcZ/wjxDxNk5PilAglz8tqod3An/z13B+TmxCuKOJxQjkH8uxmvpJDnsMJ7ZMHtGczndASPP3MsISuvC6ke308FBru5uZBMdPPQkY7pl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5256
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

VGhhbmtzIGZvciB0aGUgY2xhcmlmaWNhdGlvbiB0aGlzIG1vcm5pbmcgLSBhcyBzdWNoLCBpIHNo
b3VsZCBoYXZlIHJldmlld2VkIHNvb25lci4gCgpPbiBXZWQsIDIwMjQtMTAtMjMgYXQgMTI6MjMg
LTA3MDAsIFpoYW5qdW4gRG9uZyB3cm90ZToKPiBGaXggbWlzc2luZyBpbml0aWFsIHZhbHVlIGZv
ciBsYXN0X3ZhbHVlLgo+IEZvciBHdUMgY2FwdHVyZSByZWdpc3RlciBkZWZpbml0aW9uLCBpdCBp
cyByZXF1aXJlZCB0byBkZWZpbmUgNjRiaXQKPiByZWdpc3RlciBpbiBhIHBhaXIgb2YgMiBjb25z
ZWN1dGl2ZSAzMmJpdCByZWdpc3RlciBlbnRyaWVzLCBsb3cgZmlyc3QsCj4gdGhlbiBoaS4gQWRk
IGNvZGUgdG8gY2hlY2sgdGhpcyBvcmRlci4KPiAKPiBGaXhlczogMGYxZmRmNTU5MjI1ICgiZHJt
L3hlL2d1YzogU2F2ZSBtYW51YWwgZW5naW5lIGNhcHR1cmUgaW50byBjYXB0dXJlIGxpc3QiKQo+
IAphbGFuOlNob3VsZCB0aGUgZml4ZXMgdGFnIGJlIGFwcGxpZWQgdG8gdGhpcyBpbnN0ZWFkPyAt
PgplY2I2MzM2NDYzOTEgKCJkcm0veGUvZ3VjOiBQbHVtYiBHdUMtY2FwdHVyZSBpbnRvIGRldiBj
b3JlZHVtcCIpCgo+IFNpZ25lZC1vZmYtYnk6IFpoYW5qdW4gRG9uZyA8emhhbmp1bi5kb25nQGlu
dGVsLmNvbT4KPiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY2FwdHVyZS5jIHwg
MjYgKysrKysrKysrKysrKysrKysrKysrKystLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZ3VjX2NhcHR1cmUuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY2FwdHVy
ZS5jCj4gaW5kZXggOGI2Y2I3ODZhMmFhLi5kN2ZmN2RkNjBhMWQgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jYXB0dXJlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3VjX2NhcHR1cmUuYwo+IEBAIC0xMDIsNiArMTAyLDcgQEAgc3RydWN0IF9fZ3VjX2Nh
cHR1cmVfcGFyc2VkX291dHB1dCB7Cj4gwqAgKsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBBIDY0IGJpdCByZWdpc3RlciBkZWZpbmUgcmVxdWlyZXMgMiBjb25zZWN1dGl2ZSBl
bnRyaWVzLAo+IMKgICrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgd2l0aCBs
b3cgZHdvcmQgZmlyc3QgYW5kIGhpIGR3b3JkIHRoZSBzZWNvbmQuCj4gwqAgKsKgwqDCoMKgIDIu
IFJlZ2lzdGVyIG5hbWU6IG51bGwgZm9yIGluY29tcGxldGVkIGRlZmluZQo+ICsgKsKgwqDCoMKg
IDMuIEluY29ycmVjdCBvcmRlciB3aWxsIHRyaWdnZXIgWEVfV0FSTi4KPiDCoCAqLwo+IMKgI2Rl
ZmluZSBDT01NT05fWEVMUF9CQVNFX0dMT0JBTCBcCj4gwqDCoMKgwqDCoMKgwqDCoHsgRk9SQ0VX
QUtFX0dULMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBSRUdfMzJCSVQswqDCoMKg
wqDCoMKgMCzCoMKgwqDCoMKgwqAwLMKgwqDCoMKgwqDCoCJGT1JDRVdBS0VfR1QifQo+IEBAIC0x
Njc4LDEwICsxNjc5LDEwIEBAIHNuYXBzaG90X3ByaW50X2J5X2xpc3Rfb3JkZXIoc3RydWN0IHhl
X2h3X2VuZ2luZV9zbmFwc2hvdCAqc25hcHNob3QsIHN0cnVjdCBkcm1fCj4gwqDCoMKgwqDCoMKg
wqDCoHN0cnVjdCB4ZV9kZXZjb3JlZHVtcCAqZGV2Y29yZWR1bXAgPSAmeGUtPmRldmNvcmVkdW1w
Owo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfZGV2Y29yZWR1bXBfc25hcHNob3QgKmRldmNv
cmVfc25hcHNob3QgPSAmZGV2Y29yZWR1bXAtPnNuYXBzaG90Owo+IMKgwqDCoMKgwqDCoMKgwqBz
dHJ1Y3QgZ2NhcF9yZWdfbGlzdF9pbmZvICpyZWdpbmZvID0gTlVMTDsKPiAtwqDCoMKgwqDCoMKg
wqB1MzIgbGFzdF92YWx1ZSwgaTsKPiAtwqDCoMKgwqDCoMKgwqBib29sIGlzX2V4dDsKPiArwqDC
oMKgwqDCoMKgwqB1MzIgaSwgbGFzdF92YWx1ZSA9IDA7Cj4gK8KgwqDCoMKgwqDCoMKgYm9vbCBp
c19leHQsIGxvdzMyX3JlYWR5ID0gZmFsc2U7Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqBpZiAoIWxp
c3QgfHwgbGlzdC0+bnVtX3JlZ3MgPT0gMCkKPiArwqDCoMKgwqDCoMKgwqBpZiAoIWxpc3QgfHwg
IWxpc3QtPmxpc3QgfHwgbGlzdC0+bnVtX3JlZ3MgPT0gMCkKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHJldHVybjsKPiDCoMKgwqDCoMKgwqDCoMKgWEVfV0FSTl9PTighZGV2Y29y
ZV9zbmFwc2hvdC0+bWF0Y2hlZF9ub2RlKTsKPiDCoAo+IEBAIC0xNzA2LDExICsxNzA3LDI3IEBA
IHNuYXBzaG90X3ByaW50X2J5X2xpc3Rfb3JkZXIoc3RydWN0IHhlX2h3X2VuZ2luZV9zbmFwc2hv
dCAqc25hcHNob3QsIHN0cnVjdCBkcm1fCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqB2YWx1ZSA9IHJlZy0+dmFsdWU7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBp
ZiAocmVnX2Rlc2MtPmRhdGFfdHlwZSA9PSBSRUdfNjRCSVRfTE9XX0RXKSB7Cj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbGFzdF92YWx1ZSA9IHZhbHVl
Owo+ICsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8q
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBBIDY0
IGJpdCByZWdpc3RlciBkZWZpbmUgcmVxdWlyZXMgMiBjb25zZWN1dGl2ZQo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogZW50cmllcyBpbiByZWdpc3Rl
ciBsaXN0LCB3aXRoIGxvdyBkd29yZCBmaXJzdAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICogYW5kIGhpIGR3b3JkIHRoZSBzZWNvbmQsIGxpa2U6Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKsKgIHsgWFhY
X1JFR19MTygwKSwgUkVHXzY0QklUX0xPV19EVywgMCwgMCwgTlVMTH0sCj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKsKgIHsgWFhYX1JFR19ISSgwKSwg
UkVHXzY0QklUX0hJX0RXLMKgIDAsIDAsICJYWFhfUkVHIn0sCj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogSW5jb3JyZWN0IG9yZGVyIHdpbGwgdHJpZ2dlciBY
RV9XQVJOLgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICovCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBYRV9X
QVJOX09OKGxvdzMyX3JlYWR5KTsgLyogUG9zc2libGUgZG91YmxlIGxvdyBoZXJlICovCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBsb3czMl9yZWFkeSA9
IHRydWU7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
LyogTG93IDMyIGJpdCBkd29yZCBzYXZlZCwgY29udGludWUgZm9yIGhpZ2ggMzIgYml0ICovCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY29udGludWU7
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9IGVsc2UgaWYgKHJlZ19kZXNjLT5k
YXRhX3R5cGUgPT0gUkVHXzY0QklUX0hJX0RXKSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdTY0IHZhbHVlX3F3ID0gKCh1NjQpdmFsdWUgPDwgMzIp
IHwgbGFzdF92YWx1ZTsKYWxhbjogKGp1c3QgYSBjb21tZW50KSBpIHNlZSB0aGF0IHdlIGNvbnRp
bnVlIHRvIHByaW50IHRoZSB2YWx1ZXMgb3V0IGlycmVzcGVjdGl2ZQpvZiBvcmRlcmluZyBpc3N1
ZSwgYnV0IGkgdGhpbmsgdGhhdCdzIHBlcmZlY3RseSBmaW5lIHNpbmNlIGFuIGF0dGVtcHQgdG8g
bWl0aWdhdGUKY291bGQgYmUgY29tcGxldGVseSB3cm9uZyB3aXRob3V0IGtub3dpbmcgaG93IHRo
ZSBsYXN0IGRldmVsb3BlciBpbmNvcnJlY3RseQptb2RpZmllZCB0aGUgcmVnbGlzdC4gU28gdGhp
cyBpcyBmaW5lLgo+IMKgCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAvKiBJbmNvcnJlY3QgNjRiaXQgcmVnaXN0ZXIgb3JkZXIuIFBvc3NpYmxlIG1pc3Np
bmcgbG93ICovCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBYRV9XQVJOX09OKCFsb3czMl9yZWFkeSk7CmFsYW46IHBlcmhhcHMgd2Ugc2hvdWxkIGNhdGNo
IGVycm9ycyBpbiB0aGUgb3Bwb3NpdGUgZGlyZWN0aW9uLgpzbyBwZXJoYXBzIHdlIG5lZWQgc29t
ZXRoaW5nIGxpa2UgdGhlIGZvbGxvd2luZyBiZWZvcmUgdGhlIGZpcnN0IGlmKExPV19EVykgY2hl
Y2sgYWJvdmU/CiAgICAgICAgICAgICAgICAgICBpZiAobG93MzJfcmVhZHkgJiYgcmVnX2Rlc2Mt
PmRhdGFfdHlwZSAhPSBSRUdfNjRCSVRfSElfRFcpIHsKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgLyogSW5jb3JyZWN0IHJlZ2lzdGVyIG9yZGVyOiBoaWdoZXItRFcgbm90IGZvbGxvd2luZyBs
b3dlci1EVyAqLwogICAgICAgICAgICAgICAgICAgICAgICAgICBYRV9XQVJOX09OKCFsb3czMl9y
ZWFkeSk7CiAgICAgICAgICAgICAgICAgICAgICAgICAgIGxvdzMyX3JlYWR5ID0gZmFsc2U7CiAg
ICAgICAgICAgICAgICAgICB9Cgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgbG93MzJfcmVhZHkgPSBmYWxzZTsKPiArCj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZHJtX3ByaW50ZihwLCAiXHQlczogMHglMDE2
bGx4XG4iLCByZWdfZGVzYy0+cmVnbmFtZSwgdmFsdWVfcXcpOwo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNvbnRpbnVlOwo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgfQo+IEBAIC0xNzI3LDYgKzE3NDQsOSBAQCBzbmFwc2hvdF9wcmlu
dF9ieV9saXN0X29yZGVyKHN0cnVjdCB4ZV9od19lbmdpbmVfc25hcHNob3QgKnNuYXBzaG90LCBz
dHJ1Y3QgZHJtXwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGRybV9wcmludGYocCwgIlx0JXM6IDB4JTA4eFxuIiwgcmVnX2Rlc2MtPnJlZ25hbWUsIHZh
bHVlKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiDCoMKgwqDCoMKgwqDC
oMKgfQo+ICsKPiArwqDCoMKgwqDCoMKgwqAvKiBJbmNvcnJlY3QgNjRiaXQgcmVnaXN0ZXIgb3Jk
ZXIuIFBvc3NpYmxlIG1pc3NpbmcgaGlnaCAqLwo+ICvCoMKgwqDCoMKgwqDCoFhFX1dBUk5fT04o
bG93MzJfcmVhZHkpOwo+IMKgfQo+IMKgCj4gwqAvKioKCg==
