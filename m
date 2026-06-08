Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2588FCD6E79
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 20:30:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D350F10F9B1;
	Mon,  8 Jun 2026 20:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e49CyxXk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BDDC10F9B1
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 20:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780950615; x=1812486615;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=tcgM4I6iyWXMGOkq0Q7aBKq9wBEy7pIZ0VcA6BInHOs=;
 b=e49CyxXkNoWPvSEEX7uNRy3yYNIZ4eTOfYWi6gvBkgzBMGpdj3ownPWR
 3tF455mZmZdpqCTHoCT5hkEG+O8+7HUdH4mI2r8kduRnu05gQ/0aWRWtM
 2COHgN+pZN203J3KS4wB2kmVHX7aqIC68NBL2J2AZMDUv0Kh/BgjyXKeL
 BGtxYL7YUHHAzkYfGI133MSay57oMGO437YCglJu21urZ0i/td1dZxWLR
 8ul4inyUGpQtH2nDxmx3bIzY3r3nceLBcxbC4Ai6gmYWkpSGaZhiUF723
 dVFCR40asZ0eFIZT8nT1/UUc3Ex0CYo8wZffAncTLJSEtE4/W8sm+mjsN Q==;
X-CSE-ConnectionGUID: 7xyRoXevTF+V4mH4FOHB0w==
X-CSE-MsgGUID: GDtJ2NalS/+nxTls2p6N4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="80833214"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="80833214"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 13:30:14 -0700
X-CSE-ConnectionGUID: Q7JPQBcmRzGMvYTYajaXsw==
X-CSE-MsgGUID: kvRd5VOdT0GIu343mofjSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="269659174"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 13:30:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 13:30:14 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 8 Jun 2026 13:30:14 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.58) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 13:30:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qFPYLkTRHMy6OlEo5gSopx6UCwKDiNNgKvkjpchVs3GpswRjWhu2h3i2aYRn+EBgGBAB7qwZLPL+HwKv59kygbJUKn4bmiTGtASfsbALtXkRgcgUW1VxqdCra8M88RaNkShWgbLpWoBBujdgKDVHW8qiEMEes8EKZLkog5txeIdd4SPO3bbUvjjDweHXJec9F3Bzpg6EfRBjb1jtuJdqi+QG2cnyz5d7O6nZF9s4IUnFaqAmTpQO3Qi97Kl+QIXzGqB+5BRjAsrhwFTZzoXhpKQnAyt6tmIi/W1DkYCY5VimfMpl6v57T/o121l+oehZCVq2b8YvwOdolvTzOG+LTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tcgM4I6iyWXMGOkq0Q7aBKq9wBEy7pIZ0VcA6BInHOs=;
 b=pAOyI1QKhZr5ORMWQwuECNoFthlLFRYO6ydcDNuWmmk9mOe3CUZHGYSLFg+9E3YtcpjJxAlGnTCx/yZ/dC6gY6jXTp8po3w7e7SW/QJz8nByDIx+eF5aezDsnOstzKiSHLZ6YasR7du0DGARkj0JQKgnyOCTVCFz43YwiZX9RTGpTMHWhXt3QvavfJf6Y6PMmKIJuxmmjXpzzMhIDXv9F8chbv7HzVIZS6DowjxJFQcxo+jnHEN4h2hv8Y+uObv7gbUYOUrp1y+fCKpc9Qs5YxjRlPD7K6sAs55rpP09rLnJ1P4yOlG7vE2fGpDL6ejiI8moS8wdqCwMMaQPPRcx4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DS7PR11MB6128.namprd11.prod.outlook.com (2603:10b6:8:9c::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.12; Mon, 8 Jun 2026 20:30:05 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%5]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 20:30:04 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Wajdeczko, Michal" <michal.wajdeczko@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Wang, X" <x.wang@intel.com>, "Teres
 Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "Levi, Ilia"
 <ilia.levi@intel.com>
Subject: Re: [PATCH 06/12] drm/xe: Change MSI-X assignment failure to drm_dbg
Thread-Topic: [PATCH 06/12] drm/xe: Change MSI-X assignment failure to drm_dbg
Thread-Index: AQHc9UIJDkKe0UNEUEeNUVBknI3WULYxW/4AgAPEqYA=
Date: Mon, 8 Jun 2026 20:30:04 +0000
Message-ID: <bbe7a8d32e75b7263994c93eb2b3a0c714eb3714.camel@intel.com>
References: <20260605232108.674580-14-stuart.summers@intel.com>
 <20260605232108.674580-20-stuart.summers@intel.com>
 <afff928e-6e5f-45a7-999b-b9eb1e9f499a@intel.com>
In-Reply-To: <afff928e-6e5f-45a7-999b-b9eb1e9f499a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DS7PR11MB6128:EE_
x-ms-office365-filtering-correlation-id: e59e764f-5eb1-48d3-80ae-08dec59cb960
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|6133799003|22082099003|18002099003|11063799006|56012099006|4143699003;
x-microsoft-antispam-message-info: GUo9uXRv6NzhSI++diDazTyqVdMO224l1pJI2VdoUXJGp0bB4yWJtZ9nMGct6XA8IpNP0plNy5ojlbNqKL9hrcWFp/7OVf5hXsDZb6dmHyHMQaV6OKkX715Or5vvw/JhUlaBe7lbqyqEKD3WUBgrk/2T5UJDjybxfq5184M7rd1fve+lYPN0ZJEpLOYYqYqgzi3M6Y2wy8rDWvF8E+AmQfoch3z7lLLgBw3zoiuynyYbAYemOBwoEm3itPcD80R4Py9z8yuNB+5oVRBsBLqSrz5QK0GEL+T2bYp6lGtZoTY6IvRZco7/sLZASLYDxz0z0VUFhi8dmfK90beMp4FwKIXnzicnRr4fPVkR+1eHjwNkyt00wyp6+AXJVW3lPHWkhzXG4TXUdLT5NMrmVewP8wva7qp3oqpfLSFv5AdTVCg1o062xznCxnAb6d7RHhLSObVDsm5VJzCrZ5j4+BwXOo05UWCDO8s5ZIvDFF6o+KvCzPKWMjQQvXvIt+o/begvQiX4AFqNDJtl/1hGporqn1TMlXGLb4m4V0IrCCAuKyfasusFgf/p66wJaMLKUYqOs38gOLCEumdmTqJUZ7HcTgPIsgVqpZ2FMtrnRG1x7o8KcxDB2BbQQ34ztFERXzKbn5ftIIeQVn53sSm4qkddz3/KappAemcKzOjCwUOcUaCH+AoAQgqFD0RbOznFuBr6WEjTCtKCetbmM8GXnPZOqGAStHE/+CA7E8cSLkfh6tSO9gw2CSxZbHcg4gDA8FfW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cm96TUIrckFSRFd2dm5tbFlkYU5MNWxSUS92ZkQwZWZoVFZCOFVFYkRqa0Iv?=
 =?utf-8?B?UzJ3aTU1WEE2UWpqYUhWVVlBVDlpTFh2QkxLaFlJNDlReUR6Y21mQlpHL3BP?=
 =?utf-8?B?SzJBd2Y5S3JiVE9hNm1RZ202ZUh3dS9zck5nN0l3MnRYRlErTExzbkJzUFps?=
 =?utf-8?B?cnc0ejgzUk1qdDM0UFdUNTUrL3hOM2lGYVMxQmxkbVltOVVxUVd4MGpLNUxQ?=
 =?utf-8?B?S0t3K0xLU1lpbHJNdzE4Vk56eGdoSGV0ajE5QXd0Q2dLOVk2RGRjZmVyeVBN?=
 =?utf-8?B?TDNkakMzRUs1NmN0T2M4QnozNlJRL1hhY0w1eDlRMG9qUkpEQWMydmhobHU1?=
 =?utf-8?B?Ukt0Q0tqTEZJWDBlbUt5emRIS3ExUUZueGV1eHBTc092WVY0Zlh4cFpzUHlB?=
 =?utf-8?B?L1RpTHVKMm01UUxyTTdIQzRLNlVaL0FZZWNIZ0daTnptMmdzUEd6NmVrSWhj?=
 =?utf-8?B?WjlwQWFIQUJkQ2xjTjVYSTl3Q0QzUXU2SkpwSmo2Vm1jRlN5VFRzQ0pET1FT?=
 =?utf-8?B?TlVWa21wNlpLaE1PcGlLVTNETVZNL3pKRG1VRlpqQUdsS216c3R4UFR6c3dM?=
 =?utf-8?B?K203cU1PM2luSjlIaXlwTW0wekRQU0lnMHcrUURJQk5vcTVlUFhiM2R3ZGZC?=
 =?utf-8?B?OEVDQituVlE0WUNveG45WXMySWp0WVZwSUdiQ2dxeUJ3aWZiUEg2Z2lLYUR2?=
 =?utf-8?B?RVY2ZFZEWDNxMW40M2F5ZWNsaGZzL3hpcjYzSEVRRHRCY0hnOHEyWUJKVE50?=
 =?utf-8?B?aUNDQU1KVnByMjZMRjBpRUtML0VQc2JoRUJobHA1ZnJYVHUxcXNGOGFBYTVD?=
 =?utf-8?B?Q2c3TTNRNTYwK2JCSUhKUlR4TU5UK2Y5NzFkQXpxVFFsdlptaTdVdWVFck1w?=
 =?utf-8?B?RGdEWG9zc0VLbWhxV0JaVFErQUM5UWpMOThiU3JOeDV5bW43aGlZdUNwMFpq?=
 =?utf-8?B?SXNQMC9Za0o2bGMxb0JLK3pOV1pScTNha2IwZlJGeG9aKzBkajR3ZVBGQm1a?=
 =?utf-8?B?MWEzRmFzcTlkVHpqL242SFVQZGFLOEpKbXU5cWNFeTZvS1lXdTRpMjBBMVBK?=
 =?utf-8?B?SUMvNGVGeFNmV3ZDZlR5cGJIMjZJQkQ0QldaWWVkNFdCS2o3TU9yYTB0Z0Ft?=
 =?utf-8?B?cjlCM05KY0NIVzdrOVZGZXRVRFREaTYzUll1Z0FhQlBlMDlDcjJ4enM3am1u?=
 =?utf-8?B?aFp4WTN5ZFVyQ0l3c3hTTjd6UVVIUk1Edjg0ZnhSNVd2d1lpdnB0TlZUMjF3?=
 =?utf-8?B?TldPYnFEdWJtMGdHR3MwQ25KWHZBOVZCNWkyMnZZVmdMTTZyeEJiNWxoNG1h?=
 =?utf-8?B?bFYyeVoySGRVUDkrRUhyUGlVVkNmZjRwN0RTVUUxVDlKbDRHcmloKzFEU3Iw?=
 =?utf-8?B?TzlFM0t4TWlDOFpKOEdERXN4RG9KUmE0Q0pJREt2enNJSUl3aWxyejIwY3dV?=
 =?utf-8?B?QW1oNTZ6VzhVaEcxNkZTcE9rLzFnSzNLajNwUUVtVExoVGVOdWIydkIyY0hp?=
 =?utf-8?B?YXhCQ2lFeTVCcmhKK3NjNXhQMUxIeDlBaUJRU2Z3TTBLNStxZDdQWUU1QTE1?=
 =?utf-8?B?MVhmZGcrbE5Jd01abUZuVmJ4VU04RGhiVHllWmVMQTFIZEVaTXJVNXpiTi9B?=
 =?utf-8?B?ZG1pV3BEUG8wRGE2UUhrRUtUM2wzWnNSMzVjQXhHZ1k5eExJaXNyVzdhTEF5?=
 =?utf-8?B?ZXhHZjMrVVh4bTdnNG5hR3BHR2ZmZzR6cXRhSVR5U3ljb3VURzRTVDRRcTc4?=
 =?utf-8?B?YzFhRGNMY25jNGhFSGVRT1piUDJoeGdCZjFJSGpsaWlvZGVrb2g3WGE0ZGdF?=
 =?utf-8?B?T1ZsbFY4VEx1elYrTk1jTU9xTFBHcWVMZGh1eFU0M29TWGRKcDZqY3NUK0Fa?=
 =?utf-8?B?QUJZcC9VYVVFQ1lNdnBMU0QxZWpISUpxZmcxWHJaZDh3eUZhV2t1VllaS3Vp?=
 =?utf-8?B?MCsvbmNoOVg5dGJBZ3dkWm02czZuU0RqcVNlakl3UjlMcm9VbGJHaGg0RTlI?=
 =?utf-8?B?alpER3dMdmRQVzdrcGlKK2tqVGNVaTQ5RUtQM2RFdHhhbXh6NllRZEtlRjFG?=
 =?utf-8?B?Q3dmNHV3bXFOeHgydWlwdTRJZzZBVzBKa1F0YW9LRXQ1MlhBYTdKdkczUHJz?=
 =?utf-8?B?SkJ4QTlFU211bXF1RTZYRzZ4a1NiSHhuMEpzRFpKTnhpc0owRFg3NUtUTlJM?=
 =?utf-8?B?b3R6citpRGpVeXdhRGdGV0dGaEdHNkFVV1FORklHR1pDNlg0MkdtdFpTUUIz?=
 =?utf-8?B?VDFwbWg2T2dQN0Y2dGlla1hEOVV4NTBWNmV5dS9Ua3FwS0R6VmJUVWhqczR0?=
 =?utf-8?B?bVlVbnlIOHBXVlhWUlplV090eW1JbmU1NTR4L09Cdk16R0JRRmdEWWk5ZTly?=
 =?utf-8?Q?Kb9W3QEGVWh+7uN8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7F1F088F62B50748BEBFDE5098B7A069@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: J8yWKNytIQNtk55i0rFB/jhGLS5R6n/8dMlKkkYPlI/Nvk30WO8nMcigRjbcwXfp3Xt2M4f3kQBzz4RdppF+BAYOsFkcjyd3qoDM7LHQAmy74ja8TsML0aXkr6Z4C8A7zkbY1nuKehkb5pP4gsUng6bYCOE3oG+M9LOln3bjKqgQgdSDXUC+D1KIvB3ZFLkNQeUIguWF5/YgEtE5ZokaiHyc7+tmpQsy9O2G8l0pr3TUi1hLktpEfxg5cRahHWRarCd/HNS4hf82YMPxMqJOlqYMigMmAG3sNvTnufDReJRFmrwZdWuFfe5b6R1zRAFNBnd8q9g9uFWfa7v4VBgQlA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e59e764f-5eb1-48d3-80ae-08dec59cb960
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2026 20:30:04.8820 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i7q/m5XRVfmXGsE5dmUIWbMUSvG2IeKYHbTfeINJmXBCd22ev232HrurN/lGYAQosUcyZbJjGPFLN/SchOtlmeKYH+qaFDtwFA70+wTP8/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6128
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

T24gU2F0LCAyMDI2LTA2LTA2IGF0IDEyOjU3ICswMjAwLCBNaWNoYWwgV2FqZGVjemtvIHdyb3Rl
Og0KPiANCj4gDQo+IE9uIDYvNi8yMDI2IDE6MjEgQU0sIFN0dWFydCBTdW1tZXJzIHdyb3RlOg0K
PiA+IE5vdyB0aGF0IHdlIGhhdmUgcXVldWUgYmFzZWQgTVNJLVggdmVjdG9ycyBhbmQgYSB1c2Vy
DQo+ID4gY2FuIHBvdGVudGlhbGx5IGNyZWF0ZSBtb3JlIHF1ZXVlcyB0aGFuIHdlIGhhdmUgdmVj
dG9ycw0KPiA+IGF2YWlsYWJsZSwgZG9uJ3Qgc3BhbSBkbWVzZyB3aXRoIGRybV9lcnIgbWVzc2Fn
ZXMgZm9yDQo+ID4gZXZlcnkgZmFpbHVyZS4gQ2hhbmdlIHRoYXQgdG8gYSBkcm1fZGJnIGluc3Rl
YWQuDQo+IA0KPiBvciBtYXliZSB3ZSBzaG91bGQgdXNlIF9yYXRlbGltaXRlZCBvciBfb25jZSB2
YXJpYW50cyB0bw0KPiBzdGlsbCBoYXZlIHNvbWUgaW5zaWdodHMgYWJvdXQgdGhlIGZhaWx1cmVz
IChhcyBkcm0uZGVidWcNCj4gY291bGQgYmUgZGlzYWJsZWQpDQo+IA0KPiB1bmxlc3Mgd2UgZG8g
aGF2ZSBhIGZhbGxiYWNrIHBsYW4gaW4gY2FzZSBvZiBzdWNoIGVycm9ycw0KPiBhbmQgY2FuIHJl
Y292ZXIgLSBidXQgdGhlbiB3ZSBsaWtlbHkgc2hvdWxkIG1lbnRpb24gdGhhdA0KPiBpbiB0aGUg
Y29tbWl0IG1lc3NhZ2UNCg0KUmlnaHQgaXQgaXNuJ3QgYW4gZXJyb3IgcGVyLXNheSBpbiB0aGlz
IGNhc2Ugd2hpY2ggaXMgd2h5IEkgd2VudCB0aGlzDQpkaXJlY3Rpb24uIElmIHRoZSB2ZWN0b3Jz
IGFyZW4ndCBhdmFpbGFibGUsIGl0IGp1c3QgZmFsbHMgYmFjayB0byB0aGUNCmRlZmF1bHQgb25l
ICh2ZWN0b3IgMSkuIFdlIGNhbiBzd2l0Y2ggdG8gdXNpbmcgcmF0ZWxpbWl0IGlmIHRoYXQgbWFr
ZXMNCm1vcmUgc2Vuc2UgaGVyZSB0aG91Z2guIEkganVzdCBkaWRuJ3Qgd2FudCB0byBvdmVybG9h
ZCBmb3IgYSB2YWxpZA0Kc2NlbmFyaW8gdXNlcnMgbWlnaHQgaGl0Lg0KDQo+IA0KPiA+IA0KPiA+
IFNpZ25lZC1vZmYtYnk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+
DQo+ID4gQXNzaXN0ZWQtYnk6IENvcGlsb3Q6Y2xhdWRlLXNvbm5ldC00LjYNCj4gPiAtLS0NCj4g
PiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9pcnEuYyB8IDIgKy0NCj4gPiDCoDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaXJxLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9pcnEuYw0KPiA+IGluZGV4IDQwZDNkNDNlNDkyZi4uODcxYzZjNWM0ZmFjIDEwMDY0NA0KPiA+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9pcnEuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9pcnEuYw0KPiA+IEBAIC03NjgsNyArNzY4LDcgQEAgc3RhdGljIGludCB4ZV9p
cnFfbXNpX3JlcXVlc3RfaXJxcyhzdHJ1Y3QNCj4gPiB4ZV9kZXZpY2UgKnhlKQ0KPiA+IMKgwqDC
oMKgwqDCoMKgwqBpcnEgPSBwY2lfaXJxX3ZlY3RvcihwZGV2LCAwKTsNCj4gPiDCoMKgwqDCoMKg
wqDCoMKgZXJyID0gcmVxdWVzdF9pcnEoaXJxLCBpcnFfaGFuZGxlciwgSVJRRl9TSEFSRUQsDQo+
ID4gRFJJVkVSX05BTUUsIHhlKTsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKGVyciA8IDApIHsN
Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZHJtX2VycigmeGUtPmRybSwgIkZh
aWxlZCB0byByZXF1ZXN0IE1TSSBJUlEgJWRcbiIsDQo+ID4gZXJyKTsNCj4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgZHJtX2RiZygmeGUtPmRybSwgIkZhaWxlZCB0byByZXF1ZXN0
IE1TSSBJUlEgJWRcbiIsDQo+ID4gZXJyKTsNCj4gDQo+IG5pdDogd2UgY2FuIHVzZSB4ZV9kYmco
eGUsIC4uLikNCj4gbml0OiB3ZSBjYW4gcHJpbnQgZXJyb3IgY29kZSB1c2luZyAlcGUNCg0KR290
IGl0IGFuZCBtYWtlcyBzZW5zZS4gSSdsbCBmaXggaXQuDQoNCj4gDQo+IGJ0dywgbWF5YmUgaXQn
cyBhbHNvIGEgdGltZSB0byBjb25zaWRlciBkZXZtX3JlcXVlc3RfaXJxKCkgc29tZWRheSA/DQoN
ClllYWggdGhhdCdzIG5vdCBhIGJhZCBpZGVhLiBJdCdzIGp1c3QgZG9pbmcgd2hhdCBwY2lfcmVx
dWVzdF9pcnEgZG9lcw0KYnV0IHdpdGggY2xlYW51cCBhbmQgZXJyb3IgaGFuZGxpbmcuIEJ1dCBJ
J2QgcmF0aGVyIG5vdCBpbmNsdWRlIHRoYXQNCmNoYW5nZSBhcyBwYXJ0IG9mIHRoaXMgb25lIGlm
IHBvc3NpYmxlLg0KDQpUaGFua3MsDQpTdHVhcnQNCg0KPiANCj4gPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHJldHVybiBlcnI7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoH0NCj4gPiDC
oA0KPiANCg0K
