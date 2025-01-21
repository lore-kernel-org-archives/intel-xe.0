Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC0BC0218B
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jan 2025 17:39:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E0310E615;
	Tue, 21 Jan 2025 17:39:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YlepBTcn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DBBF10E615
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jan 2025 17:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737481174; x=1769017174;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=EotkfiwEqpnI3GOMYuihkEI7NPxWPDpM0dHRMytIi6M=;
 b=YlepBTcn2VC9s/bAkDOUbIcr07z6AtSEe7XouMwXgstcEEAAy5NCympy
 xTIsGmRRqpAqF0xFpahUwajij9/oNFuG6pCp50G3rAVuJr6EreG2udPGX
 ryHbtQdY436srStLvXgouEUo0oXRJqGfEE2qJi1x57cgn4KdXWDtrqMuL
 MaQf/BBYLv9zfjNfP4OovmySzmTPYTCCoy3zhBOErOph393vPmO7dG7nf
 O7s14n6RIupWxHgfVYP5GXFgxHXXp0Ke6mWiYxVWzre2vnKEdgSLjt3vf
 G8FoyI0z/PXm1e9dOPla0vkNYCn/mAbdqdS54oDJAsy6nwknpmsmD6YJ1 w==;
X-CSE-ConnectionGUID: YGUvBTe6QpuLtiuNk002zg==
X-CSE-MsgGUID: QtXs3JbQS1C8gVRoxDTvrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37175360"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="37175360"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 09:39:32 -0800
X-CSE-ConnectionGUID: ECpj5dXtTle2m36lqaISTQ==
X-CSE-MsgGUID: j4XFLqeCQTWX3ESMneefiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="130167614"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jan 2025 09:39:32 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 21 Jan 2025 09:39:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 21 Jan 2025 09:39:31 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 21 Jan 2025 09:39:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bt3iXpjKcnguKJQnLt2HUPzrqxcQ3F4ZDuwlbTCGyWhuJqcgCYI3a2boQpU5iuvz5qo7Mpc/8k9MEXg7JbcSWDy94U63+Wgszlor3iwKtWQP2BP9feM4oQEIycLJZO38MH0RGIjc2z4lC2oDibX4LAx4eyxgON9+WLpvshFNXkqx5KeUooKVFsUBKd2UKEHRK3Oq7Dpf7qLeohqDWCBjfumWMZO41KTvF+shjx4SDzxUKYKsMbLg794kKmj6QzQErwa5HszfMVhJimYvTnhGI1Bpe12D1ofryJJODWX/zFhDCi2zKUqzqgC3NZA/Hw/qZJdL1HNmPVk1ILuqp7/mGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EotkfiwEqpnI3GOMYuihkEI7NPxWPDpM0dHRMytIi6M=;
 b=M8590cl/sCOunYnQyHZpD8wEdhaNZZizlEImF+BzCe86fuf4pTG++PE5zW6OscZJvKaV3zOSz+4GC/s0jeYts6wNodGtoScO6sUI+1Ht8Ib26qqP/UP5YdX8Ztd2RPgpH1zslbsSBPlVTfoxkK6GDAE7Yj/UYDs8SFlBMkmPdMvX2Vbx0WE+gGBJWxTdRADbmRW4UmUpkeg9M6EYXklRUehAXtE/6jsLNb9ULKj+hyxvbhz1I7nswfOXmsHsQjnvdXdS+scoI1aAStjlQU97S8HZH66mTu5i8wIWceww4PshDx2YLqqNhD4bcQkCtJ2NkkICakQD9oZ66kIyRcxXZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DM4PR11MB5996.namprd11.prod.outlook.com (2603:10b6:8:5f::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.20; Tue, 21 Jan 2025 17:39:29 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%6]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 17:39:28 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "dan.carpenter@linaro.org"
 <dan.carpenter@linaro.org>
Subject: Re: [PATCH] drm/xe/guc: Fix sizeof(32) typo
Thread-Topic: [PATCH] drm/xe/guc: Fix sizeof(32) typo
Thread-Index: AQHba+mvVxZ8uatwVUSPgDapdxVfVbMhfwKA
Date: Tue, 21 Jan 2025 17:39:28 +0000
Message-ID: <18dfdc8b8d7ab85c09d9aed0dc40979d537d8bed.camel@intel.com>
References: <20250121094832.588-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250121094832.588-1-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DM4PR11MB5996:EE_
x-ms-office365-filtering-correlation-id: b2669313-21b1-4836-4fde-08dd3a428e07
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?c0ZhSEJsaDI1Nnp1YTh5eWpWdDBDQjVQMGIzTGJ5dDVJOXB4Vk95alRZNURy?=
 =?utf-8?B?djBzdjBseTVZWFF3aDdqdXVrVTE2elJTTkNXZlB3Smh5M0NoTnJGM1ZuYlJR?=
 =?utf-8?B?TXBDRjhFdmQvRXZOM0EzelFYVk54ZlRnWG9meWVGNDRneVRZdDd5Q1RrcWF0?=
 =?utf-8?B?d3NrQmlTcjBzc2RNZmtIVUhTWjgzVFpFYWNzcUt3QzBZak5Zenh3d3M2V3Y4?=
 =?utf-8?B?OEtvSUdSeGFEUEQvQkRCbG4wUGVkU0pQZ0dZVitCYlRsdEJSVFpVd0RtWmky?=
 =?utf-8?B?K0FERXA2ZHN5NVJBaXVCUEhwTmhVT1BYNG5MK0E0eW01Q3ZzTFFTOG04d0VM?=
 =?utf-8?B?aHM3cTBUNnY0OFJ3SlRXNjNzaXE5dzA5ZERXbmVpa09tSXNGYnppOXoyS1E4?=
 =?utf-8?B?TDlzQ3FWdkZNY3g3eFpoSXgzL0ZhZU11RkJZTXF3U2NFNzFrMzF0NGFzOWc0?=
 =?utf-8?B?eHkwQ3lBYkNCOC9vMnZ2bC96NFBmN25DWDJFVnlxYkRnV0RwNmdyenVDTGMr?=
 =?utf-8?B?aWpsd1pzZzcwS09BM3FtMit0SHBPa0ZHV0kxelAvVzZqb3BzcU9VV3hHR3ND?=
 =?utf-8?B?ZWN5Rk1sTFkzQ0ZkR1I0QVNvZDBTbHNhdjlwZVY0cXBVbEpERHRaNElUNFpX?=
 =?utf-8?B?eGMxd01zdWhhRDQvdjdSWkhQZHhzTU5HZ3AxcmsvYzByYVExVTdZRzcxZ3BO?=
 =?utf-8?B?NzVGQ2ZtczN2QzA1aXA3L09BMWVuRlRLMWpTV2VRclE5ZVJtS0tMRFFIYnd4?=
 =?utf-8?B?cUFuUUQxTlhYNU5oN2g5NlJUYi8xa0hDem1wRzU0cHd4a2JNNkt1OVJLRzRr?=
 =?utf-8?B?Yk11bkJtTjlNVTc1ZUdYemt4SENJMjZMUFRqc2xGL0dseUswQ1dQVkNidEpm?=
 =?utf-8?B?dTFjdDUrSms2VW5TTTNML1lPcWdRaEd3RzZmUkowQ0NGajVYZXZxRXdJWGRp?=
 =?utf-8?B?RzIwa3dIeU5mMmt2dE1aaSszU1hCdFY5UkoxbE4vblBRR1AvcVZlWm4wZTl3?=
 =?utf-8?B?RnVwR2tHbUN5MTdva09WaHpWcjJDK0FHSWhtc25lK3VWa01nZDlyemdjWXRB?=
 =?utf-8?B?NnJwd0JWbVJFd0xvTzluTXQ5Snl0TXcrdDhRYlR2L2dqeUZzY0g3NFJoejFu?=
 =?utf-8?B?Z2NIMlNRYkRJRGx5ZHlKMlpnNmRFT3FaSUVJbkVHNU5JaXZOTzUwaHVOb3Bt?=
 =?utf-8?B?dTJJM3ZoaXlmWmxsMmgyVERjU1pReVpuaU5wUjlrYkJTYUhTYXZ0QzVsL2Iy?=
 =?utf-8?B?cC9IN0FsNlZ0ME1HUEt4RU5SWkViQUVQTHdZYVQ3Zmo0TXZFZmdscU9vbTF2?=
 =?utf-8?B?M1hrNDZ5YmdIZFJJREJXa0I3MWxqRGdOcUE5WVJzdzgzd2p3TDM5YWdodk90?=
 =?utf-8?B?UyszZzcrTmt1OVRiMEZKRGtzUTYrNGViaUFBMU5qa3RWbzlyWWpuTEpvYmRn?=
 =?utf-8?B?L0tZcTR3N3MrY05CbVRVVmJFdjVpRmpRT3h1U0FZTjBib3RmTmRNUFUrMHBq?=
 =?utf-8?B?a0pNT0VwS2dORVFBMjNCb3NNTHhqb29va1UxYjN6OUlDU2ZVZmVrY1FaZlFO?=
 =?utf-8?B?RktvaXhrQ3dOT0pIYXhXelc0QnpJSnRPcm5nWkR2K1ZRYjJzTmoyaUo1bFg5?=
 =?utf-8?B?VURQeEI5TDd4SWphbDBjMTdxT0ltOWh1N3JPNTQ1SjZOdUh1azNDRVFyT0Nm?=
 =?utf-8?B?cFR0NFRqOFFic2RyNGVWcUlvL0pRUlFTaStLbmZMQWVNNGlWcHkxMDF0RlM4?=
 =?utf-8?B?TnNvMEVJNXdGQXREWmRVWHNCcm1iUlpPMGIxN2VBdlBJcitZdTY0bnc5MGhI?=
 =?utf-8?B?aXNDZGxsbHFRRXhzekJ0QXJzLzBxM1Zxd0ttdG1GdFJZNnRRbFdEOWFaUVhV?=
 =?utf-8?B?WHlPeDYvZ1lHMGY1RkpZcnA2RnFLVmJTTVJ1OGJPckRaQ2VDWHJWN1B2dEVn?=
 =?utf-8?Q?bTCDRpAL0Svm5PbqCGBtl6j41IBobx6S?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:vi; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SHd2S1AzRDZ2bnFkcUFidGhGYUVPOGk3aGFYMEIwRW9zUEc4WFliWENROEpK?=
 =?utf-8?B?cnA2bER2eE16Y1cyUzAveDhVbVd3bVNqTTg4VC9NQ29DWXFDQUNGYm1zZEc1?=
 =?utf-8?B?Q3VhVm11M0V0OEJ4b2l0QVlCZmF3bm9jN09xemprdW55a3ZvUVZBdC9CRW1x?=
 =?utf-8?B?ajl5T0wwWW9YcEl6VjVGQlErV0U2ZlVHWUR6anNiZnlJOHpLZm1YQUxQOG9K?=
 =?utf-8?B?eDBEb2NNWjgyRStwVXVRQUVuNUdINmJnVllqak5peWJjNjFxbGpxSmRxaTZQ?=
 =?utf-8?B?ZzhZYWszTkVYTDdHTCthTHVxZDVrdkdrTGducHp1NUhwYk5TeC9KOTJnM2tF?=
 =?utf-8?B?VmhHK1BxWWo3YjkwNFNOOHBNVlRoVWtsWjNreU43eEgwOG1aUW1zdHpHekFx?=
 =?utf-8?B?MGlVK0ZoVUpZYzlOQWtNT0V6NDYweGh0QjJsYklLYmNTbzFnN1VVYVJtdSs2?=
 =?utf-8?B?Sm9QMEk0dmlMYzhOcTlMbVZ2ZUxudHhCTVNZUGtYVWJtSkVCRVJkZ1RPTWRZ?=
 =?utf-8?B?aHpFY2QyNlhjRnB3NUdvTE5sbzdZb2Izc0kxUms1N29nWTZ2cS83OU5ZWnVk?=
 =?utf-8?B?MXFIOHU4R05sTFlzbE90VW1meXBPTlBzRDFDc25nVCtoc3FDRHVMbEpsMnJm?=
 =?utf-8?B?MFRCNXdjRlNkdC8wWStQRlNIYk90S2FJYnZXcFFMWlBPQTUyaTFmSFNiMFFE?=
 =?utf-8?B?aWxzcXJDWEQxUkI5VDhLa3BuOHh6dTlObldNb3ZQQ1JsWGs1UzZvK2s4Tm9h?=
 =?utf-8?B?NU0wYlF5Qk4wQXlkemwxMDY4SWFXYUpKUFdESWFmakJnU2lYbjlqcGYzQ0V0?=
 =?utf-8?B?M3BFSkxQL0pKenRHeHN2akRpN3FUM09yVEJ6a0pOdmRvaHRiblYrMnRPRGhj?=
 =?utf-8?B?ZU5LUlJWUW9WbDJDRGw5TWFzNk52TWZJZWptWlRrWFh2dkc0NGN1UjFIZDF0?=
 =?utf-8?B?YkN1SG9JRjNhb3Q3Q3NpWWExVXljUjArRXFKSWs5cnNldCtvYTUvdTczMkNG?=
 =?utf-8?B?NDRUWU9vYi9CRTh1NmQvUVZXZDlUZmswcGpGdGFtTDRDQm9EMGwzZU84eG4x?=
 =?utf-8?B?S3pjSVBJMHlWbnp5dFZoZ2loOHpVOVZMV0pGakNvdXFqYzcwa2hRejB0T3Jr?=
 =?utf-8?B?Q29GVGl4bWVuUDFaRFpkZHBOS1p1alhFY0NhSG5lRzFxQnJUMHZWcXBRV2RQ?=
 =?utf-8?B?aWNadjQwS3FIbm1KVlVuOEk4bVNUdXI1ZUFGWDRwK05VNERibHpObXBYRHpD?=
 =?utf-8?B?L3BLWExYL09xWmM3RDNVcnFQWWVqUGdrODgydU9HYkgxZEU2RE1hcEVaU2NO?=
 =?utf-8?B?UWNFeEtvRUxvb1FZc2tSMEQxRGdKdlQ3VENnVW02azRFeFlaemhZM2l3OVJC?=
 =?utf-8?B?MEVBSkhUQVcvZGNDdzFQdEVINDZ5SGNVWUptOTNaS1RkWVRFZmtRTDhlTm8r?=
 =?utf-8?B?aUZ2RFNuK2V6V0puK0x2VnJWeFNjRXI0UEJSRkJ4QmcwL3RjRjZ1WHh2Qmtv?=
 =?utf-8?B?M2swZXBHWmI0MkFsY3gwaVlmdzBlRDdQL052UVE4Tk1aT1M2MlEydjlaUUZo?=
 =?utf-8?B?aU1XQWx4RVdWSUY4bGlCQVdNTnU0czlPYTdaeXpyeGNOd2NqVGZhNVV3STQ2?=
 =?utf-8?B?WCt6WUJMd1N4bjN2NDh4bkMvTEs3eGhPN0VBeGVxME1HMHZYUG9lcnJxc0Mv?=
 =?utf-8?B?TEFZZGFKOEN2RjNaRnNrWmI1TTYrMmRkVU9Bb2p4UUVGRlBOL1Y1M1o0cnVp?=
 =?utf-8?B?dzhCcENCRDl1OXJ6WEszNk9UcGxHeUtaTE9BLzl2WmZIYnZQTXF3cjg2UFFB?=
 =?utf-8?B?MUtqb0h2V3JLVSs3SHptYlVsd3lrR2NhL0hEdS9VR0FsemNXNkw2a2RyNmdC?=
 =?utf-8?B?Vm1ZcHZ0ZEFGREhNOGM2VlFRR1RUZHFFcnVoTWN0MjFmUnpGSXpFVHJ5dHhm?=
 =?utf-8?B?VGRBTFJ1Y29MQW03NDRueWpkY0JZZmxRQWlNcGFONEdmY0lSNjhmYXo4SlFi?=
 =?utf-8?B?bjNkWTVnaHQ4S1g2SVVaM201M1dJNTFmUkhta2dZSlhxZlZsZXR5SC9Ecy8y?=
 =?utf-8?B?UXdEbkJLK3ByK2IvT3FKKzh6UlptTG9xOVlEbVVzTWx5RzdQT1FGWWRWWmlK?=
 =?utf-8?B?ZUo1RDVsMjJoUFU5OUsxVVhKVTVTYXZZSWw3UEdiR1ExNDRxcExTWm5IWGFx?=
 =?utf-8?B?VEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9E67EFE2FF61DF4EBE06928AEE903BE8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2669313-21b1-4836-4fde-08dd3a428e07
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2025 17:39:28.1197 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7muwUIHpla7STsgNNidNnf0QkMuFfO1IjJayMX85xqATSHhIyQFZR+kZsnwo42EQnsDNI8jyBxfs3AL93En5e6hyxyFGWUWFG62IO/2TPT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5996
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

T24gVHVlLCAyMDI1LTAxLTIxIGF0IDEwOjQ4ICswMTAwLCBNaWNoYWwgV2FqZGVjemtvIHdyb3Rl
Og0KPiBBIHNtYWxsIHR5cG8gbGVhZHMgdG8gdGhlIGZvbGxvd2luZyBzdGF0aWMgY29kZSBjaGVj
a2VyIHdhcm5pbmc6DQo+IA0KPiDCoMKgwqDCoMKgwqDCoMKgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d1Y19idWYuYzo4MSB4ZV9ndWNfYnVmX3Jlc2VydmUoKQ0KPiDCoMKgwqDCoMKgwqDCoMKgd2Fy
bjogc2l6ZW9mKE5VTUJFUik/DQo+IA0KPiBSZXBvcnRlZC1ieTogRGFuIENhcnBlbnRlciA8ZGFu
LmNhcnBlbnRlckBsaW5hcm8ub3JnPg0KPiBDbG9zZXM6DQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2ludGVsLXhlLzBkNWJjYmYxLTc5ZjktNGExMC1hMjIxLWRkYmFlYzlmNjEyMkBzdGFubGV5
Lm1vdW50YWluLw0KPiBGaXhlczogNjk2YmZkZjI3M2VhICgiZHJtL3hlL2d1YzogSW50cm9kdWNl
IHRoZSBHdUMgQnVmZmVyIENhY2hlIikNCj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIFdhamRlY3pr
byA8bWljaGFsLndhamRlY3prb0BpbnRlbC5jb20+DQo+IENjOiBEYW4gQ2FycGVudGVyIDxkYW4u
Y2FycGVudGVyQGxpbmFyby5vcmc+DQo+IENjOiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0
QGludGVsLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVy
c0BpbnRlbC5jb20+DQoNCj4gLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19idWYu
YyB8IDIgKy0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2J1Zi5jDQo+
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19idWYuYw0KPiBpbmRleCBjZTZkOTgzMGUxM2Iu
LjAxOTNjOTRkZDZhMCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19i
dWYuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2J1Zi5jDQo+IEBAIC03OCw3
ICs3OCw3IEBAIHN0cnVjdCB4ZV9ndWNfYnVmIHhlX2d1Y19idWZfcmVzZXJ2ZShzdHJ1Y3QNCj4g
eGVfZ3VjX2J1Zl9jYWNoZSAqY2FjaGUsIHUzMiBkd29yZHMpDQo+IMKgwqDCoMKgwqDCoMKgwqBz
dHJ1Y3QgZHJtX3N1YmFsbG9jICpzYTsNCj4gwqANCj4gwqDCoMKgwqDCoMKgwqDCoGlmIChjYWNo
ZS0+c2FtKQ0KPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc2EgPSBfX3hlX3NhX2Jv
X25ldyhjYWNoZS0+c2FtLCBkd29yZHMgKiBzaXplb2YoMzIpLA0KPiBHRlBfQVRPTUlDKTsNCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNhID0gX194ZV9zYV9ib19uZXcoY2FjaGUt
PnNhbSwgZHdvcmRzICogc2l6ZW9mKHUzMiksDQo+IEdGUF9BVE9NSUMpOw0KPiDCoMKgwqDCoMKg
wqDCoMKgZWxzZQ0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNhID0gRVJSX1BU
UigtRU9QTk9UU1VQUCk7DQo+IMKgDQoNCg==
