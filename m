Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84BFC25B76
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 18:28:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D4F410E3FD;
	Wed,  5 Jun 2024 18:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XWIoUIWC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E0C10E3FD
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 18:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717612127; x=1749148127;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Veb+sWNGp30gnGFNORexMYW90Ltf28vaXs3P7+mBUFg=;
 b=XWIoUIWC25gPlWVhYRs5134uwQQiR1cSmqXSvVoirurSx8PeW/BULN7W
 ZxyZLpK5zIBLl73tEX4YtMBrSJ3QcSAPcQSOgywjHv/792Zt0oZMZYOSZ
 NZPSiA9gHqM7vniee8aHwiPMf02TA9tOuoJhcNam+6zSWQcEH6MzuGxfe
 pMZxN4nAfNIujPepGtJv3r9UVLRxP1rRXXU4U5yRFiB7vX1nrgsCMHGaA
 FUVctS6FK+VWW3CKxcIvxV9qsFn5JLM7CODzq9Qe8YxDW4C4NcMVxhF7x
 SeThjal/CiVGMUlfJo+o2hAqTyYKrZadBIMepLmp+PCmRv0mDsAOoSTck Q==;
X-CSE-ConnectionGUID: Vbeb3HXlQ72D4ixPJUnseg==
X-CSE-MsgGUID: qupvylJYRESDCbxegOAzZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14200020"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="14200020"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 11:28:47 -0700
X-CSE-ConnectionGUID: hoNR+tYVT4SAFBAnA9rVNQ==
X-CSE-MsgGUID: 5TAqzmmURUiURHw63Ie/9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="42260903"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 11:28:46 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 11:28:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 11:28:46 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 11:28:46 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 11:28:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PpqUGk9u0Lm7gFexKbDPjv6hQv2Nw5NVsvnqCPSW31n2swOP6DMBGBeV/LvRDSbmKkrqo+HT20hkMzSXognlYUQHWOruQ88MQOyEfoqBZqKIILgTx/y9slE3uH8bUB5lUHPs3XBtE7KLdMBhdCfVFQlst7YEcc1vZ8+j5fAXxvSEnYmgAL/rX1WMFmbfiW5So/iwKKkbjLRsHe7mcgZU9fCanlyuPd64+k4n/UxpoLFMsq2hnMR2I6GuJKxzUs65TMdWnqhmdt/Z2jAvafmexws7vSDovp/B084oZbAut01wrf3sYZJaeEn7RI7nZt+03yoTD+mfqQvAtpnMIaEqhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=czDh6MWv1PrmgjS2tPVwjCcsfGfIyscmR5rqanVkJXA=;
 b=LRVuXLWjDKsUPy5OXEMpxySNeEgx6bhAHIW6zACI52219aI42LZ0qDIn0bCYg1T62xZVum6f3NZAHnQmlp/59eY1OtCsnq6lkZAns5YdTX5/5q77ma2p7xA/nrSDMJfER3IHTRmKufo7n3MwFwpW3QgMTqIphz30Gxd+zYXaP/sCsn4/M5s1TZQfEQKVIDmncgRetmSJReEj/vcwl7mUydHxD37pozG0EZ8AVIbfIeLdlx321hTYTNorL3smqHkVFD5ZvZah6vsFezLi7SmLHftnjgAZTutOsq+G/Sd5EfhnWj0kNdSX5B3QpqC/7UiHc3Iw8+1B1BmGyt/XT77JPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB6362.namprd11.prod.outlook.com (2603:10b6:208:3b5::8)
 by BY1PR11MB7981.namprd11.prod.outlook.com (2603:10b6:a03:52f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Wed, 5 Jun
 2024 18:28:43 +0000
Received: from BL3PR11MB6362.namprd11.prod.outlook.com
 ([fe80::497a:383a:6d76:ec5f]) by BL3PR11MB6362.namprd11.prod.outlook.com
 ([fe80::497a:383a:6d76:ec5f%4]) with mapi id 15.20.7633.033; Wed, 5 Jun 2024
 18:28:43 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 =?iso-8859-1?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [PATCH 1/1] drm/xe: uninitialized fence causing null ptr
 dereference
Thread-Topic: [PATCH 1/1] drm/xe: uninitialized fence causing null ptr
 dereference
Thread-Index: AQHat3Qf1J5q1CRzmk2zPRFSuWTKE7G5eseAgAACLGA=
Date: Wed, 5 Jun 2024 18:28:43 +0000
Message-ID: <BL3PR11MB6362BC30E8BB005B09D1E2DF9AF92@BL3PR11MB6362.namprd11.prod.outlook.com>
References: <20240605181528.2047987-1-fei.yang@intel.com>
 <20240605181528.2047987-2-fei.yang@intel.com>
 <ZmCsFytzsaX6hdqz@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZmCsFytzsaX6hdqz@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6362:EE_|BY1PR11MB7981:EE_
x-ms-office365-filtering-correlation-id: 821d376e-03c1-420e-5c47-08dc858d54a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?uIj1hXq3j2hgh5rBzu+K6+yxo0ExzNdit6VoccyusC5RR6lJK2Dn1O/faO?=
 =?iso-8859-1?Q?8VNmOE9F9ffgY1+fg4JISSqeE9fLAxR2AYmuh3fvDQnx1/5m+kmzX4Vynk?=
 =?iso-8859-1?Q?SPAbNxjECX5nY6sAIgkGBF9s3Q/x+fpQnAeaCZtBIIUXAW57bcjj16GKOS?=
 =?iso-8859-1?Q?COQzQzV800DtpUl2ut0aJR4U/uikyigOpRtWMiQ+gwIIZKOXCTNRACmJsa?=
 =?iso-8859-1?Q?8uWgF3YnBI20lkRonomo6IxGz1kppOiY4qFUiU65T4IQk7Zq+qJxltyHlx?=
 =?iso-8859-1?Q?QCmoIHGDJ6zoqr+m1MxGpZyGRwZo6RhmZWF9D6xC/SbBiaIPcsZdsImOYb?=
 =?iso-8859-1?Q?MmWkbKb1TCEIEvDDtYo/jevnsHB9AUOvLzujQYkAZdHYbCP1LZ15/YLrGf?=
 =?iso-8859-1?Q?JNLXRspHRxICM3SH8clzpG6ejGkajspfIvuW39PSIRwZm6+GkmHcmTDP1A?=
 =?iso-8859-1?Q?EVF0iLgqpUD2vt0zz4f0WyRcfIgbArG9DTu7SscE7nzJY2ZA/EFrQB2CA4?=
 =?iso-8859-1?Q?DuFz3nuptDMlEtZJnYSNgchJFDi+1/QhGlXq0zIsbl5ZF5N2ei5Jnn6+AP?=
 =?iso-8859-1?Q?qyX8YviFpFjPE0AzsFqizaER5qf7Pc1iVq2GBh39OK9gSVWp3n2prK2xmJ?=
 =?iso-8859-1?Q?wpZoBr7q5lobMdkUUwEiAHVCEyMY18ty2K14mGjb/Z4ipVZROwZItxkL0G?=
 =?iso-8859-1?Q?FJJwwZkRPGNYPJlbeSgD/3q5DwK2P8QWY8CZFBmtlNLM8sRKvl55yGJUWM?=
 =?iso-8859-1?Q?30+qQtpHr8UpJ887cWcmt+fa6MCpNIj49FAzLeJ3lAA9Kha73EkOudIOy1?=
 =?iso-8859-1?Q?Tp6Ny7tXJArQroXdF3YAgGm3At24VAfhvQPZ/PiFidsvvg5GOKMuSMP0/w?=
 =?iso-8859-1?Q?aRxWfPEaZMq4wt1bSHbE6FapNgLgLUTlLB3WmUISAX6WnqkjdA5fBcVF9k?=
 =?iso-8859-1?Q?Vbd1Nh/F5XvIx0OKdGBVJAWt8IVKqTyLQcHd/gNbaxq6/wpb5HAGHX9F4S?=
 =?iso-8859-1?Q?Jj3DFmeH2M7aTzwOfK01C3Nrp0ijXpG5v/enxvYOst1BUawdXlxzfrXxCB?=
 =?iso-8859-1?Q?IMagUXF5DaPTmCm5kU/qPZ0mh9pOeAVVSvjoDPz7TUDEpPe5TX3f8kn0Bk?=
 =?iso-8859-1?Q?lfa+mnXO7WyeiAd6/feiz1DWfGBrytG80PkIyRC4R5+wk31CdsYO6avK+T?=
 =?iso-8859-1?Q?59A+KB8pgEn7+lRPeg8GJncn0B0ADBS70NV7yQEoCwj5r0ZfU02Y0bhV+l?=
 =?iso-8859-1?Q?v/bh3brtCv+X+AdC7W+BTzavhAdaq385ES8YOFy6hwhCdhgdx7BZIrVz0u?=
 =?iso-8859-1?Q?/n2duHG/jJ2nGbMQZpXt+LsAcId1iqbwqra8bQazE9LGDuyV2zNYOywrWy?=
 =?iso-8859-1?Q?uNvd7EkNs8?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6362.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?2b//UsWflpP1hN4ZRREXj1cq75zI0gkNRmMHoMF/tRCZEE7OfaLTtOyTcQ?=
 =?iso-8859-1?Q?GI2puC6WW0HRxNgjNgahJxswRxmODNxbUxPBC8RLC4N66CUJ3+8/MZH5TY?=
 =?iso-8859-1?Q?vWDcqRn58ZyRl2bGea1KLFa+C7DVE3hqliN7W9h69cZAweAlHL0VbCb6Ha?=
 =?iso-8859-1?Q?R6Mu1agFnxegy5q3qMvbiE2+PA1axe+rtxgFt09aDyugcLSumnQKNpJXxR?=
 =?iso-8859-1?Q?5xOQt9g5UwTGCeky0LsmblTo824AMfC6Oy22nWIapWdcJIUpw4qeqQYTMC?=
 =?iso-8859-1?Q?FORvYTqKbZMPVjXH8atFqBYRDYgQNRn6jsyUc07pHoqairU9AwjozEyxG/?=
 =?iso-8859-1?Q?U3lGdcZmAqxIDYS5auDpXpNVyiuG37avKXFi3KaOT/QIZWr8SkuvhqW84T?=
 =?iso-8859-1?Q?3WW8gSgspIw0UeSXBjeMIVwNjTBM2HAT5u0carqd3RFWlgtSHLOt7u9Ulr?=
 =?iso-8859-1?Q?F4mMdAoslqj/hPx+9/IzDUtX/V+6WFba5cWyoDIE89l9kgEjmFrbNH9Jx7?=
 =?iso-8859-1?Q?68e5v2zOayzJVt0jF3OhtCG6+y98Asix8eG7Cusdpz7oLhkgacJ1G7eKZS?=
 =?iso-8859-1?Q?iy+t/JAllnkzhxJy9GeI/fvgbPNZPwgRTlS/m3/+usECG7/9wKRE2vz7OK?=
 =?iso-8859-1?Q?cKTDBh40ELO18qYi9L19KeJJqPNQ38BcEQbWgbftwmPRgTDjyWS2ctqOCM?=
 =?iso-8859-1?Q?vexSJVyjTYBd910FxE2GALTUZ3XAMiJCE1M45ZKIOmUMwdzqRcP14jVwet?=
 =?iso-8859-1?Q?tkeKRMizZIViKd1jyEt3fHch2/2e/ai/w9Bi4AhUJWDjlDKNHW4g0JBYxt?=
 =?iso-8859-1?Q?MtmG7W2vvtaftiIMgEcIY3pfS47LTKbM6XFSIusQR+hr0qBG5ud2DvK6EX?=
 =?iso-8859-1?Q?VEF53F4ZWz8ZQjLcWmIT/1JsYPMtMQcMzhpZMMG582kcjdudMOtea5xWO4?=
 =?iso-8859-1?Q?71O2wVC9GRm7bd5AxkSjVQ6uwyj0FSoVrNwwZWsbKRLR3T8cydJDb49lvJ?=
 =?iso-8859-1?Q?3zTgqfJscnyt96b+31cKuCgHVpVZoSQPBZms4q51gn9IElbPybcmO4+6Zq?=
 =?iso-8859-1?Q?Y8fAuANuBu8qhisgGzeBADMe+XaiHvUCoY7i432Lojo+AGJyqGa7wPE9nz?=
 =?iso-8859-1?Q?KEP7NtkMXWN/yqACWnfVpD/IW1MmE19u9i9Pjm9NRoE5SS/vJ1QsZY082i?=
 =?iso-8859-1?Q?u2G+84TcjaO1iB8p3VnZnmITsuvpnqy6xpAwrfeLzlfGrYRpIr4t/V4ved?=
 =?iso-8859-1?Q?aPmd/InWo79HKhGSc6odikA3pknpM7r1C4gWw1GSOHlpuTn89wPApPUJvC?=
 =?iso-8859-1?Q?fpkBDdqwfUXPE7diSHzOpx+s0bHH6o16PcbZcLrqxrBI6gnR4wBov0KIbF?=
 =?iso-8859-1?Q?DXf7JAUZsap+Qi83LrEY1Y/AjQ88VaX827fvPF/54fz0WekCDbdCnEcssT?=
 =?iso-8859-1?Q?vX+wHsx+FSNiQjHpyCdWzetbb/UBgme0EpsM/l7SL96s7MZp98Ws7zrTmY?=
 =?iso-8859-1?Q?vurQieEnn/5M5NShjG1LCB0yzahkrJBmiKia3NPqGT52W21VKAA6CZ/ffj?=
 =?iso-8859-1?Q?IyF7QpBfZqW2gVLuBJMKgoCvCT1S7VLi7f9NxrPHRCi44d7gLbmPdDDBkN?=
 =?iso-8859-1?Q?ZotosZmHv6H8k=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6362.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 821d376e-03c1-420e-5c47-08dc858d54a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2024 18:28:43.6666 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dZFxocJgbmcgdS8Un0fGQWjztjokzO2ryEQdJcjXXyqDN6GqihQPcTHT1IziJJEoEx984WBo752LtV3UyeSmnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7981
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

> On Wed, Jun 05, 2024 at 11:15:28AM -0700, fei.yang@intel.com wrote:
>> From: Fei Yang <fei.yang@intel.com>
>>
>> [  141.256160] BUG: kernel NULL pointer dereference, address:
>> 0000000000000028 [  141.257162] #PF: supervisor read access in kernel
>> mode [  141.257943] #PF: error_code(0x0000) - not-present page [
>> 141.258722] PGD 800000018c95c067 P4D 800000018c95c067 PUD 18c95d067
>> PMD 0 [  141.259751] Oops: 0000 [#1] PREEMPT SMP PTI
>> [  141.260409] CPU: 0 PID: 7277 Comm: gemm_bf16 Kdump: loaded Tainted: G=
     U             6.9.0-xe-474+ #1
>> [  141.261812] Hardware name: Bochs Bochs, BIOS Bochs 01/01/2007 [
>> 141.262669] RIP: 0010:trace_event_raw_event_xe_sched_job+0x50/0x100
>> [xe] [  141.263644] Code: 02 00 00 0f 85 ad 00 00 00 ba 30 00 00 00 4c
>> 89 e6 48 8d 7d b8 e8 a0 c4 78 e0 48 85 c0 74 7b 48 8b 93 18 01 00 00
>> 48 8d 7d b8 <48> 8b 52 28 89 50 08 8b 93 38 01 00 00 89 50 0c 48 8b 93
>> 08 01 00 [  141.266281] RSP: 0000:ffffc900017ff1c0 EFLAGS: 00010282 [
>> 141.267075] RAX: ffff8881001c4208 RBX: ffff888188499380 RCX:
>> 00000000000007a3 [  141.268100] RDX: 0000000000000000 RSI:
>> 0000000000000000 RDI: ffffc900017ff1c0 [  141.269123] RBP:
>> ffffc900017ff208 R08: 0000000000000002 R09: 0000000000000001 [
>> 141.270145] R10: 0000000000000034 R11: c0673accd9eb118e R12:
>> ffff888157969908 [  141.271166] R13: ffff888188499380 R14:
>> ffff888188499380 R15: 0000000000000001 [  141.272187] FS:
>> 00007f38147d4780(0000) GS:ffff888237e00000(0000)
>> knlGS:0000000000000000 [  141.273402] CS:  0010 DS: 0000 ES: 0000 CR0:
>> 0000000080050033 [  141.274250] CR2: 0000000000000028 CR3: 0000000188490=
005 CR4: 0000000000570ef0 [  141.275268] DR0: 0000000000000000 DR1: 0000000=
000000000 DR2: 0000000000000000 [  141.276284] DR3: 0000000000000000 DR6: 0=
0000000ffff07f0 DR7: 0000000000000400 [  141.277297] PKRU: 55555554 [  141.=
277758] Call Trace:
>> [  141.278186]  <TASK>
>> [  141.278571]  ? show_regs+0x67/0x70
>> [  141.279114]  ? __die_body+0x20/0x70 [  141.279666]  ?
>> __die+0x2b/0x40 [  141.280164]  ? page_fault_oops+0x153/0x4b0 [
>> 141.280782]  ? search_bpf_extables+0x96/0x160 [  141.281439]  ?
>> trace_event_raw_event_xe_sched_job+0x50/0x100 [xe] [  141.282317]  ?
>> search_exception_tables+0x5f/0x70 [  141.283004]  ?
>> kernelmode_fixup_or_oops.isra.0+0x61/0x80
>> [  141.283771]  ? __bad_area_nosemaphore+0x18e/0x290
>> [  141.284466]  ? __lock_acquire+0xa22/0x30a0 [  141.285080]  ?
>> bad_area_nosemaphore+0x16/0x20 [  141.285733]  ?
>> do_user_addr_fault+0x338/0xa80 [  141.286384]  ?
>> trace_clock_local+0x10/0x30 [  141.286993]  ?
>> __rb_reserve_next+0x62/0x4c0 [  141.287611]  ?
>> exc_page_fault+0x87/0x2a0 [  141.288197]  ?
>> asm_exc_page_fault+0x27/0x30 [  141.288813]  ?
>> trace_event_raw_event_xe_sched_job+0x50/0x100 [xe] [  141.289678]
>> xe_sched_job_create+0x29d/0x2e0 [xe] [  141.290373]
>> __xe_bb_create_job+0x93/0x220 [xe]
>>
>> Fixes: 0ac7a2c745e8 ("drm/xe: Don't initialize fences at
>> xe_sched_job_create()")
>> Cc: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
> Thanks for the patch, noticed this too [1].
>
> Since I'm hear and our patches are the same:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>
> Will merge once this CI passes.
>
> [1] https://patchwork.freedesktop.org/series/134484/

Oh, thanks Matt! I didn't notice you had a patch already, should have been
checking the mailing list more often.

>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_sched_job.h | 2 +-
>>  drivers/gpu/drm/xe/xe_trace.h     | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sched_job.h
>> b/drivers/gpu/drm/xe/xe_sched_job.h
>> index 002c3b5c0a5c..0c3ddbb7e25f 100644
>> --- a/drivers/gpu/drm/xe/xe_sched_job.h
>> +++ b/drivers/gpu/drm/xe/xe_sched_job.h
>> @@ -70,7 +70,7 @@ to_xe_sched_job(struct drm_sched_job *drm)
>>
>>  static inline u32 xe_sched_job_seqno(struct xe_sched_job *job)  {
>> -    return job->fence->seqno;
>> +    return (job->fence) ? job->fence->seqno : 0;
>>  }
>>
>>  static inline u32 xe_sched_job_lrc_seqno(struct xe_sched_job *job)
>> diff --git a/drivers/gpu/drm/xe/xe_trace.h
>> b/drivers/gpu/drm/xe/xe_trace.h index 450f407c66e8..ea61387e0f5e
>> 100644
>> --- a/drivers/gpu/drm/xe/xe_trace.h
>> +++ b/drivers/gpu/drm/xe/xe_trace.h
>> @@ -270,7 +270,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
>>                         __entry->guc_state =3D
>>                         atomic_read(&job->q->guc->state);
>>                         __entry->flags =3D job->q->flags;
>> -                       __entry->error =3D job->fence->error;
>> +                       __entry->error =3D (job->fence) ? job->fence->er=
ror : 0;
>>                         __entry->fence =3D job->fence;
>>                         __entry->batch_addr =3D (u64)job->ptrs[0].batch_=
addr;
>>                         ),
>> --
>> 2.25.1
>>=20
