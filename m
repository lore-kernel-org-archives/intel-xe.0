Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C425C282D1
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 22:28:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F9410EA9B;
	Thu,  6 Mar 2025 22:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LPvygbh4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1B110EA9B
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 22:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741300110; x=1772836110;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Iw3ZST4HIlI5S3mIiscsPhXiMtxwe6zk4oFLYtqzaBE=;
 b=LPvygbh4WWYgYSlyQ6kfEID108UX5GtVJTp3EmSZS7gwO7SXwWE/sUwE
 3Zd7POvkuqkZC3EfUiyNI2sLWqMtUo9R2NZceo5aOMg9NSlM6dY4h47tx
 L+osZXV7MnpjVAltsL6iyEIxz4osUAu4dMTyCferliEn5FmIYNscuPAZ8
 /C0QOFgZz+rRXo/K4sO9As02mfeCa6WV4UpeCO26hSvDUzAjZE9+j8gmE
 xBVU8U9fB7Xgola4+6jSHBAvcdZZhI45vNS0BN1emGqekjaNj7muMwAgE
 GLNFGSBfAxE22a0ujenrRlzX62SI52h6rzVPkEaMV0NE716rlDWAuxiZD g==;
X-CSE-ConnectionGUID: ufgdLaX9RciORMxlaaT2Kw==
X-CSE-MsgGUID: 6TAILhzsTWijN/VnCedX4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53325793"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="53325793"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 14:28:25 -0800
X-CSE-ConnectionGUID: 9nz3ugtWReK6vT8CnTWl2w==
X-CSE-MsgGUID: WkyzusJFSoSDLOfQ32ccjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="149948466"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2025 14:28:25 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Mar 2025 14:28:23 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Mar 2025 14:28:23 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 14:28:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SxhvEHLBR4sUTdziACwdyKhDmMuaNi6VJp4NCYrclydm8Kmp5WKA/xq6ziaCKNweNUYvNMmPvJ/dwYbB/1WrM/fyz3J4SOMvM4G6n0+chEsw/t1ngJ+/qydxNrth0JY841+vGkdloV3i85oIa7VE1kNhFsbmZF1zBxqHOPuZyca/xWJzmzsDRYxUS4jYLK5vCn5JrqeWK8FpXoe+eN1xMlpptYsuJieiOP3vJo1OrmHXcw60zXk+U881voZ/uIgOzcjMgUrmuTFoYzjwuiC6366YlvXdVRU1W0uckJwzKHBtB93TQkgVVhQNzIkYNSuq6Ls/xjLeP+urSJmT23TPCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iw3ZST4HIlI5S3mIiscsPhXiMtxwe6zk4oFLYtqzaBE=;
 b=I54WtLVbXQuHFjt5Xblhb3g8bemS6Gmbd9stxwNJbQS3z6P9DwJxpofWV8xqhhJC2fGkza7jV73u/jjEtuNOu822+dqt250HOOs//97k+YpbzrxbaVI3PI6XNs+GAyhBz4R89fgQBBqZTDDvuwtI+6NOib/bOu4jSxM7Ua3tMXnLx2VPz43TLKlqf9H1SxFYrbxCq64e91vR64u6t/MBqG6pinsD8edYI3dtqEzg4HAjGirWxwWf1f3EPsGJF8hWuA2NIlYu1iqyO07AqVap3R1T1JI35j098X3jXrYCdfMk0PlEtrDFSMt5TGomfT3pC7oDj7qrWVZgJGqF0xcmDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH7PR11MB5796.namprd11.prod.outlook.com (2603:10b6:510:13b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.18; Thu, 6 Mar
 2025 22:27:40 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 22:27:40 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/2] drm/xe: Remove GEN11 prefixes from documentation
Thread-Topic: [PATCH 2/2] drm/xe: Remove GEN11 prefixes from documentation
Thread-Index: AQHbjuRR+RXhApS2l0CFW3Bxba8H+rNmrOvA
Date: Thu, 6 Mar 2025 22:27:40 +0000
Message-ID: <CH0PR11MB54445F8F43EFD5E596830845E5CA2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250306-drop-gen-v1-0-03683e56006a@intel.com>
 <20250306-drop-gen-v1-2-03683e56006a@intel.com>
In-Reply-To: <20250306-drop-gen-v1-2-03683e56006a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH7PR11MB5796:EE_
x-ms-office365-filtering-correlation-id: 837c6f93-1cd5-450c-ab47-08dd5cfe1b2f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?d2ltcTZZR0p5cytoQXR6TWJtdnh5VEhHZUZmcXgvNXpubUl2WFB5NDlhNm9Y?=
 =?utf-8?B?c3c3M1hPNnRBckd6bnlTRnlmMVF4R2JyZ3hGU2wvRFdNQWN6bldNVUQrcUNC?=
 =?utf-8?B?UlBtTEtHRmF4M3VKMWdqM1B0NzRYKzNMYUpBTXFrUjNBRms0NHVFMUg1SzR4?=
 =?utf-8?B?R29qZlNXdXZSN2tDekJlTGdVVkNLVkYxRzZkWHd0TlNjKzdGZ3RuNmV6L3BL?=
 =?utf-8?B?dXdFS01KaFRWb2taSkNKWEVIRngyc1JyUHBuV0R3MkU1NEVybWYzeU1iWVdU?=
 =?utf-8?B?U25WZjh6MlVNRnR1aDd1Mm9FcUNCdFFLRlQrZXl6cDdCeDNCM3V3M3BaUnh0?=
 =?utf-8?B?anJ6bjE4d2lwUCtWR0JLN1RVUy9QY004UmNSOGtRQ2dzdU91bzNkVmhucU1T?=
 =?utf-8?B?djlmdnFuQlhEdTdnR0o4ampiNUU4RVRnaE83bFFEeUU0UFR0YXBOOHdyanhV?=
 =?utf-8?B?Rmo1UUVWVkQzN3Awa2R1WW00WGc1K2srdDJRK0xlcmNvaVo2dEZxdE8rUGdN?=
 =?utf-8?B?NmJWSWlhS3JQZTQxb2NYSHRhQUZyaHY2MWJTU1Y1dk4za1Nrc1hHUkVkc2Fn?=
 =?utf-8?B?OFMxTzExTGNxK2VUNEpxNmFuNFdTcDByVEN2eGhzN2t6RDNuWXRpSFNoVFc0?=
 =?utf-8?B?QVVpUmw4bjdzdm9QU0JULy9ZYjU0Z3BWbEw5VDVwOWh4ZXNpaWhxZTg0L2N1?=
 =?utf-8?B?eW40MDZyYlQ0VUFkN3lPNlVYeDk5S0ZEVVBMaU9FaURnSzRRdVhjRWYvZlhY?=
 =?utf-8?B?MFZvOGw2N05iZnMyVzNmL2xkWEtvQkNncW1XK09PbU1SVXV3bDgrUkthd3Mr?=
 =?utf-8?B?MmNWZHRyYVc5SmNEZDhkaHBuTFpNWXRDS3VicVNxKzhxTEpQSTVxdlA5NUN5?=
 =?utf-8?B?dXFKV2ZHMFh0V1VFUFB5K0MwYjAxMzZ4dDhlYSt4b3NaV3A0ZTlSTm9sUHNE?=
 =?utf-8?B?ZFNXZUl0QkxzNGx6WU90bzFXd0NwM0poQzlRL3RybHBhK2RhQkU1ajlaVXlw?=
 =?utf-8?B?RUdHaW1qdkEydUk3a2ZiT0o4Z1ArYXQ5UU5lNjJON01laGRwMnhDN1dWSjNj?=
 =?utf-8?B?TEFHYy9NZGxYL0FXSEFWWitqZUw0YnVIRms4ai9MY3RCeG9zd1psVVlaZUFM?=
 =?utf-8?B?NldzWDV6VHJ4NW5uU3k4a3NScFpQbHZBalpnRjhpMmt0NnRzN2YxSXRIeWdt?=
 =?utf-8?B?cnZRaDF4RmFjZHpQMWx0WDhDV0huYkE4YlA5dWJTTVdMazhNVHlucVlSZW14?=
 =?utf-8?B?RzdQYkhCc0k2U3FuTnBZRGNBb3JYZjBYd1MrQ0hkUGZuYUxxNy8zUGF0ZDJ0?=
 =?utf-8?B?YTBOb0YyME5jWnlaQzVBblN4ckxtaE9qTnRTempDQlprdlRoUUVPaDN5NmRE?=
 =?utf-8?B?N1pVNk03QThLNnpyNFo4MWg1UVNmZG9haGJSQWJNYlZ4VklaQVVVTmlBM01v?=
 =?utf-8?B?c3JMRWQ3YW1WQXprMVdyeEtvR0lvQXl6WER1M3VTV1dySDZseDdTQjlSS0pN?=
 =?utf-8?B?TE9XWGZpZGd0WTRIVi9weUc5bHNlaGRpWjdsSzAvU2pvZnhmSXR2RDBRekdK?=
 =?utf-8?B?WGZ3RVJ1eFNNNUsxRWF5eGRaOUNLNm5mOVhlWVFxRWZlQWhxSC9NTU9HRFpl?=
 =?utf-8?B?aVJINXdCS0FEdVlKS2VPTHN4OXZ5S2lCRXE3MGQ3VkEyc3JRa1daZVpmejhB?=
 =?utf-8?B?WDJBWnQybFNDdTVFREx2SDRRdG9rVDRzbWxBdzNVZjN3RitmaVhBVmV5RUlq?=
 =?utf-8?B?OWxsVU14akQ0ZVF6QXNqQlptTmdSTlZqOXhLY3dIa1lZMVNpblMxZGZBcE52?=
 =?utf-8?B?d29JMDlWYVNFVFVMekdwdXBDWWMybVFFS1IwUmIwb3BiSituNjlTUXhpODBz?=
 =?utf-8?B?ZmFoN1o3Vi8zZXpQemtpYndKcFhYRXNMTTd1L05Rd25rMGZaVnZIUi82amU4?=
 =?utf-8?Q?gh0/KH0lt9ew8KhxdRqkJSzKoqSqXCEk?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N3BuSFVwUEd4NzM2TnZHTGY4N1EwS2NpRkJXSEFpeTNRZjYxRzJJS0Y1Mm56?=
 =?utf-8?B?aTFMeWNIS1N4V3E1ZVNON2t4VHpIZ0NUYWxaZzFnT1pQSzgyN0szbldPZUtI?=
 =?utf-8?B?ZXZHRldoN2svVWtmMGtKUmY1SSs2ZEtFMUJaSlhCR3kyMHBuZks3RjdkTklL?=
 =?utf-8?B?b3R0UjFMTVJhTk93ZTFmdFFsN1ZGcjkxU0E4V0R0bDIyZDFKS3lFSEhLT1Qv?=
 =?utf-8?B?bHdkZWswUTZvWXYvck5aZjkvbis5VkI2MXdWQ2EzNGdZYVIrMFRmclVXSEhD?=
 =?utf-8?B?bUFsNEVCbHlXVEFCVjVmR3dWQWYxSjhvZ3JKWEdmc2pZK051SzRNSm96TnFm?=
 =?utf-8?B?c1ZSc0Z5cFZOVnk3dTYrNGhIdEtyVnlRSDRLbGRYRldva3hmWmxGZlU5d3VR?=
 =?utf-8?B?WEplc1lCWDdxeFo3R0NmYkdPdm00QnBtOFpEVCtoSDltZkVLVWVqQW9jVnJF?=
 =?utf-8?B?T1NzU0oyUTNmK0szanVNb1ZUMERyUGRSYWhLNmdaTXhIbHVUcWtUdHE4Zzg4?=
 =?utf-8?B?ZFR2UE1xbWZkSUVQM21qVnluYjhTQlplK3lKK0pKM0IrTG93Z2Fya054VWlV?=
 =?utf-8?B?cG1vOTNDSUovbFY3cGMwbHY3aGNPaUo1d1RYS09NZENmODlRWEdEZ0hicXhm?=
 =?utf-8?B?VTh1ZWc5Y2VwMGV0VHNqdkRBNy9IS0NuSE42TktPd3VnZ2dQRTZnSUhQa1pu?=
 =?utf-8?B?RWtNSXZoS2xJQVU0b0k3aUUzU2Q0R1ZIUkgwUVlQeTZmdmhBa3RMMmtxVVcv?=
 =?utf-8?B?NXFHR0tNeHFxYktpYUNIZk15c01ZeUMxcnpoVzVXNVBLcVVYUUZJTVJjQVZh?=
 =?utf-8?B?NkdvQ25sQmNFRExWVDlKbWp5RW5Hc2E3MjF4TXEvZFppVGQ3WUJzUzRoLytN?=
 =?utf-8?B?K3QxVjhEYWJuQnM1WlZLb0ExVWVLUyt2amdnVjQyUFA2WjZwNkkrb04raWdZ?=
 =?utf-8?B?VER3MGUrUUZZMGJrN1EyR2l1N1ZRbStYWnlIYVNna0kxSkpCZkVrYW5LZkMv?=
 =?utf-8?B?SlphRHp2L0lHV0tJTTAwTVB0T1VycmVWcHRmQS9RclVwTkwrbXJOVTMxZWVL?=
 =?utf-8?B?WHUvODFMSGZoMGJnV3M4UDB2bVg1Qkg3N3B3WldkWEM1Ukt4N0JvN20wMFEw?=
 =?utf-8?B?RTlYanVBQnpMaytuVFdUWnN5UHhzWllTaDU5TFdZT3Q0aTRyMVZEV1crbm5a?=
 =?utf-8?B?WUZWUUkyd3NVcXZPMGdBVmYwRnNsSUtYb3Y4SGdONTN4NUU4ZHhCdGFBNXor?=
 =?utf-8?B?QndnUkFkZ2xOQ0VyRGtnNXl2Rk9vZHZSMEhPSzg3cWxLb01qTExtck9LSEVI?=
 =?utf-8?B?aFRUeTlvYnlHZ1c4bzBzM2ZVN3J2S0prZTh2bzhCanBZQ21uWEJpUXJ5MWoy?=
 =?utf-8?B?emcvVTFYbHNGMXJ1YUVaNS9EckEzRXFFZUVDYXNacXpqWTRaQ2lQSVBuZTha?=
 =?utf-8?B?QW1UN1F6M1JmNVhCb3ZUYnhtTW1vWmJmdklWV0VIMS9id3pBRnRQRlIyc1dl?=
 =?utf-8?B?ZTJWMmRPbTJEOFNGSUFHTWl1eThWV1ZPQ2JHYnJMa2lNMnBkeGhoSmNnT3hz?=
 =?utf-8?B?dEtSZjg1Mm8vQXdKSHJDY204RS92QmRXUHozUG1aMC93UU5NNEVleVVZNXhZ?=
 =?utf-8?B?RG5sM1p4NWNVODkwOVltRUFqVTdsMWNacGd4TnpyRXJBYUo5OFRkSFhQSmJo?=
 =?utf-8?B?Y2VTaUZUZWlCRkh5OXAwYW9EWXI4dDE4d2ZnY3B1WmFEbXpZRWRPSFdBNG5F?=
 =?utf-8?B?REZvK2svN2puaFVFOVhJa0ovS0NYM0EzVm4ydGpXZm5uYUExS2ZtY3lHekxK?=
 =?utf-8?B?S29HZjVWRTJUMEJuZUlEMnhsTkNHanZCVGZyTlo5MVRnZUo4bkUxY1FwUTds?=
 =?utf-8?B?SFFURGVUOFI1ZklsSEdFTEkzVlp4THpZWmVIQ1BnYnpOeUVxUGdoY1gwRlBq?=
 =?utf-8?B?Ni93TUFOTFBVbHJrTUJ0SWxUbkFFSXFrZ3ZmUDFWT3pWODdUSVhSall5VmJj?=
 =?utf-8?B?ZkdXR2FaaDJkK3l4NWV4Tkt5TnVIS3ZMa3ppMEhtZWxFenYzdUY2UFdSbHJH?=
 =?utf-8?B?eldiYWtKRzRwTlcvLzJ1VmVNek9paTB0Q2VFV2U0RWM1dXlFb2hzQURlRTV4?=
 =?utf-8?Q?f8NHQ4zD7RQWqEUtLABK6CStG?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 837c6f93-1cd5-450c-ab47-08dd5cfe1b2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 22:27:40.3896 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pD3Ffzc3nD9qNSKZ63l9BtcGs9V8ICBYkMvRCg3s3ogM3sPlGIgSIjsnbkIyMyJHfcq3p+N2CJo/9Mp7vHmVt5KjKhUcW0ut5Xb4495+7jY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5796
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEludGVsLXhlIDxpbnRlbC14ZS1ib3Vu
Y2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEx1Y2FzIERlIE1hcmNoaQ0K
U2VudDogVGh1cnNkYXksIE1hcmNoIDYsIDIwMjUgMjowOCBQTQ0KVG86IGludGVsLXhlQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZw0KQ2M6IERlIE1hcmNoaSwgTHVjYXMgPGx1Y2FzLmRlbWFyY2hpQGlu
dGVsLmNvbT4NClN1YmplY3Q6IFtQQVRDSCAyLzJdIGRybS94ZTogUmVtb3ZlIEdFTjExIHByZWZp
eGVzIGZyb20gZG9jdW1lbnRhdGlvbg0KPiANCj4gVGhlIHJlZ2lzdGVycyBhcmUgYWxyZWFkeSBu
YW1lZCB3aXRob3V0IHRoZSBHRU4xMSBwcmVmaXguIERvIHRoZSBzYW1lIGluDQo+IHRoZSBtZW1p
cnEgZG9jdW1lbnRhdGlvbi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIERlIE1hcmNoaSA8
bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV9tZW1pcnEuYyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9tZW1p
cnEuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9tZW1pcnEuYw0KPiBpbmRleCA0MDRmYTJhNDU2
ZDU4NzA4MzdmY2UyMjViNTE1MDM5ODczM2QxZTk4Li40OWM0NWVjM2U4M2NhZjlhZWZmMjc5OTEy
YjgwYTBiMTA5YmM0YTk0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbWVt
aXJxLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21lbWlycS5jDQo+IEBAIC04Niw3
ICs4Niw3IEBAIHN0YXRpYyBjb25zdCBjaGFyICpndWNfbmFtZShzdHJ1Y3QgeGVfZ3VjICpndWMp
DQo+ICAgKiAgIFRoaXMgb2JqZWN0IG5lZWRzIHRvIGJlIDRLaUIgYWxpZ25lZC4NCj4gICAqDQo+
ICAgKiAtIF9gSW50ZXJydXB0IFNvdXJjZSBSZXBvcnQgUGFnZWA6IHRoaXMgaXMgdGhlIGVxdWl2
YWxlbnQgb2YgdGhlDQo+IC0gKiAgIEdFTjExX0dUX0lOVFJfRFd4IHJlZ2lzdGVycywgd2l0aCBl
YWNoIGJpdCBpbiB0aG9zZSByZWdpc3RlcnMgYmVpbmcNCj4gKyAqICAgR1RfSU5UUl9EV3ggcmVn
aXN0ZXJzLCB3aXRoIGVhY2ggYml0IGluIHRob3NlIHJlZ2lzdGVycyBiZWluZw0KPiAgICogICBt
YXBwZWQgdG8gYSBieXRlIGhlcmUuIFRoZSBvZmZzZXRzIGFyZSB0aGUgc2FtZSwganVzdCBieXRl
cyBpbnN0ZWFkDQo+ICAgKiAgIG9mIGJpdHMuIFRoaXMgb2JqZWN0IG5lZWRzIHRvIGJlIGNhY2hl
bGluZSBhbGlnbmVkLg0KDQpOSVQ6DQpEZWJhdGFibHksIHRoZSB3aG9sZSBjb21tZW50IGJsb2Nr
IHNob3VsZCBiZSByZWZvcm1hdHRlZCB0byBhbGlnbiB3aXRoIHRoZQ0KY29ycmVjdGVkIG5hbWU6
DQoiIiINCiAqIC0gX2BJbnRlcnJ1cHQgU291cmNlIFJlcG9ydCBQYWdlYDogdGhpcyBpcyB0aGUg
ZXF1aXZhbGVudCBvZiB0aGUNCiAqICAgR1RfSU5UUl9EV3ggcmVnaXN0ZXJzLCB3aXRoIGVhY2gg
Yml0IGluIHRob3NlIHJlZ2lzdGVycyBiZWluZyBtYXBwZWQNCiAqICAgdG8gYSBieXRlIGhlcmUu
IFRoZSBvZmZzZXRzIGFyZSB0aGUgc2FtZSwganVzdCBieXRlcyBpbnN0ZWFkIG9mDQogKiAgIGJp
dHMuIFRoaXMgb2JqZWN0IG5lZWRzIHRvIGJlIGNhY2hlbGluZSBhbGlnbmVkLg0KIiIiDQpPciBw
ZXJoYXBzOg0KIiIiDQoqIC0gX2BJbnRlcnJ1cHQgU291cmNlIFJlcG9ydCBQYWdlYDogdGhpcyBp
cyB0aGUgZXF1aXZhbGVudCBvZiB0aGUNCiAqICAgR1RfSU5UUl9EV3ggcmVnaXN0ZXJzLCB3aXRo
IGVhY2ggYml0IGluIHRob3NlIHJlZ2lzdGVycyBiZWluZyBtYXBwZWQNCiAqICAgdG8gYSBieXRl
IGhlcmUuIFRoZSBvZmZzZXRzIGFyZSB0aGUgc2FtZSwganVzdCBieXRlcyBpbnN0ZWFkIG9mIGJp
dHMuDQogKiAgIFRoaXMgb2JqZWN0IG5lZWRzIHRvIGJlIGNhY2hlbGluZSBhbGlnbmVkLg0KIiIi
DQoNCkhvd2V2ZXIsIEkgd29uJ3QgYmxvY2sgb24gdGhpcy4gIFdpdGggb3Igd2l0aG91dCB0aGUg
c3VnZ2VzdGVkIGNoYW5nZSwNCnRoaXMgcGF0Y2ggaXM6DQpSZXZpZXdlZC1ieTogSm9uYXRoYW4g
Q2F2aXR0IDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPg0KLUpvbmF0aGFuIENhdml0dA0KDQo+
ICAgKg0KPiANCj4gLS0gDQo+IDIuNDguMQ0KPiANCg==
