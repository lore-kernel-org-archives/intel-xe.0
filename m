Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64C8D49210
	for <intel-xe@archiver.kernel.org>; Mon, 18 Nov 2024 11:24:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A23BE10E1B7;
	Mon, 18 Nov 2024 11:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bnU467i5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A2A610E0BD;
 Mon, 18 Nov 2024 11:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731929079; x=1763465079;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Cuf2TeFzRaxVDNfE6KQUFBekItvGA6arEprstjp+p0M=;
 b=bnU467i5tdjTqOkgWYXsyaTKJD+EwQh0po1lOdLA0HEgidbQt0vqhSCN
 hrXF9iIXg9BZh1vwdfOqtxRNYwh/WfYZSiNvR0D3GP+6pubZ5ilgmnjwx
 eAQmuNy0q+kHUdn8SMymKRb6zpVMjE1BcsQkzi+GDYoou4jryUTMHc0M3
 LuDpEWnGZE2vtxd+DiAIepjckmbhmE8vcz8tfefnyMrhfokjHIPFvrc3q
 BisBFGHnMWG9eJAP82ZyeYcKZPpxkdljX0oKWyt19mj8CN+V3Oo56M+lj
 hfdE5bTVrNP3jbYTRK853Fy22zvXwVA8R0Qh8jkg2Z/Rc2d337lpANWLa A==;
X-CSE-ConnectionGUID: sdVTQK/ISmW4yXC+Hv255w==
X-CSE-MsgGUID: p+YK/x+ETN22mglse7dlLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="43267284"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="43267284"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 03:24:39 -0800
X-CSE-ConnectionGUID: +TnOgcQOTr2IhCVSWBpkOg==
X-CSE-MsgGUID: orlXBFsORUejzTK3u2ovjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="120049915"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Nov 2024 03:24:38 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 18 Nov 2024 03:24:37 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 18 Nov 2024 03:24:37 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 18 Nov 2024 03:24:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=USajS4C/J11j4w+R74degcCCi+hPSZ99woI5n2Thjal8tb2UaA22NGwbZimflXxNm4NuXSm5j51PkVtgQSppFI263NtBvJdMsfoeAH2GrWHJZ2L7z8EqU4Y8eQQ+6xx5lXLluvIBaCBa/hnOVACAQvWmizP60GKgRYVN+Grx05IaYQfoWvhHH/VCwnVzAH5WwCQ21BRRPQWY7vix3JcjYQtwwqYcrVeMWtq93zDYfaTx0rNHWUkiIBoENnL6cUT65XIeOHYCVT+AGGYl69K97cAefFrs/cl7ByB17qNzhV6Vd6sNXQzdMqzNzp+UuP6TZplJsCefiubtef1YMYl0OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cuf2TeFzRaxVDNfE6KQUFBekItvGA6arEprstjp+p0M=;
 b=VVPYS8Y52VDmRgZSfInm8hOpGaDP939AqW/Nb1ms7JnQ9bkF0gGAShpaBMuvRtyhK44w2f5m6AqFWyVm6/ZJkr6rAJu5BbjEovmyoz6yAHbSRqYi7tqg+dGtO7JCFrc6+KBnIJNgEJbqS5rWo7WlU9JiLqxYDLgmu3DGUY2/qLiFLBnvs+p9igJR18M3We5+yKFEG5pc4Bv6XGrj+o8A9D2hi1w0drNl8L6wmtTKF1tqUCposAWjjvzqK2ORRCitJXCQa64UgcSn+alZ/yEj/WqBIDIVkQb1SA4bK4YlGwhLvxp3ID+Ek5sYP2M26xtNVebgywSnQwQlAeSJnZu55w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CY5PR11MB6257.namprd11.prod.outlook.com (2603:10b6:930:26::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Mon, 18 Nov
 2024 11:24:28 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%6]) with mapi id 15.20.8158.023; Mon, 18 Nov 2024
 11:24:27 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [i-g-t V2 2/4] include/drm-uapi-experimental: Move
 i915_drm_local.h to drm-uapi-experimental
Thread-Topic: [i-g-t V2 2/4] include/drm-uapi-experimental: Move
 i915_drm_local.h to drm-uapi-experimental
Thread-Index: AQHbOYc7CPDwxvufe0mYl+0AgGjeabK82gaAgAALX2A=
Date: Mon, 18 Nov 2024 11:24:27 +0000
Message-ID: <SJ1PR11MB6204B4C883F9526CE3BF357581272@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20241118070211.1474372-1-tejas.upadhyay@intel.com>
 <20241118070211.1474372-3-tejas.upadhyay@intel.com>
 <91e2f419-035e-4414-8a5f-f60eebb00403@intel.com>
In-Reply-To: <91e2f419-035e-4414-8a5f-f60eebb00403@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CY5PR11MB6257:EE_
x-ms-office365-filtering-correlation-id: 40726300-114b-49fa-a7bc-08dd07c3906c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OW1uVFRaNGx3S2JYcWhLN002NGtSSzVWVTJYUkx1QlFyMW5zMC9jcGoyNlow?=
 =?utf-8?B?L1RRUmpERUphNk1PVURid2loNm5tdWUxRTYxSExza1I0aU9BbzloalN2ZU5x?=
 =?utf-8?B?UmV3aGtMZFlqU29ueXV3bmFxUHU1Y2hUK3VZWDZqZHpuVldNelJBTGVQR2l1?=
 =?utf-8?B?U3l3VEhId1BpZlVIMkkvNDdKK3NwQ3hqbU5TQ3pURXJUMkVSVjdpNnBjdUNx?=
 =?utf-8?B?TDdGYm5JV1Zjd2tseTFrQ3ZXR0s4NHJlNGhuTzlnUVYzc29CSTE1NG1FTW5x?=
 =?utf-8?B?a1pIRmhqeVpXVWZMRVZnQ21hOHM5OGttUnRLMERsZEdPcmFyTG5oSUtXdm9k?=
 =?utf-8?B?T3ZFWnhlODhQblFleFJMR01Idjl0QmFYSkV1ekdiNkRnb0xiNFgxK3RJcGZJ?=
 =?utf-8?B?aVF3K3NGWWdYM1g4cE5sQi9CaVhZb1h4WXNZOU1TcUhtdnZHUzVyZlI4amRD?=
 =?utf-8?B?TWkvbWJnamk1NFppRFNmTWdKWDVLQ1pwSGN1SkRMVVg0WWdzSjBOeVVyUllG?=
 =?utf-8?B?ZlhmQ2V4S1JyV0VkUUVRUFBBb2R6S2U1T05JQzc4ZWhycDVXeUhYbVVUOHk2?=
 =?utf-8?B?ZWJnYWVSaUhGbDU3QmFLVnRKc2tpZzFqQWhvQXFpbldxeWtjdHRWTGtMQjZq?=
 =?utf-8?B?d2FNamZIUEgrMUozaDhNUjI1YnlZc0hzenJuTW1ESk9xdkxFcDlCVkdocUdv?=
 =?utf-8?B?enNHNVdVYllLdTZSOTl3eXIrano2L3JadGtkbnltc1BVY0E3UkU1dkIzSHE0?=
 =?utf-8?B?bktRdVZZSU51YTNiMHZSWEhZRXFWQ2hUOU80UVh5MnY3b2UybmVlaFBNeDU0?=
 =?utf-8?B?QXBvM1cyVWx2T3JpWmtkVVF1SU9NVndEVk8vOU1NdmpCSHFjcTZYaU94TDZv?=
 =?utf-8?B?K203aHFxeU9PSjdjb0IwTTNQYTYwaCtJcVdmMXdXK3pqREo2ZXpCSlFxdlRp?=
 =?utf-8?B?T2E5OXd5Y29iTVp0ZnJpOU8rL1Z3Um01ZFhTZ0c0dTNZM1lwcGVuM295bEY1?=
 =?utf-8?B?YUN3NGtCamNjQmt4cUQyNlBDQmZZL3hHVy9ZS3MyUUczc0twdTZWUnJuOHIr?=
 =?utf-8?B?UGVHbitLMVZrLzlaS0c2UGZab3p3aE1WenNLKzg4V25ZR0pmYVl1K3JNaVNQ?=
 =?utf-8?B?VVlQKzdzMkJtR0NWZldzc0NIdWY3VUFJS0ZTRnRhdFJtc0ZJUVg4dDRSSFYv?=
 =?utf-8?B?a1dmb1lVTDI5anUxTzhENEErOXlQbFVOVXhWZzNweDc2ZmF2VG93YXg4QnUy?=
 =?utf-8?B?ZEVPazNsdHlnQjlZUGZnb1hZRXE5RElXUldLc1NCV3NoMHZZZzdMcWpJeXov?=
 =?utf-8?B?Z0dWeDhPSzc1NGREZFpuN2dvcklTV3NTdlRSRzhTUEFkOFBQbDM5RWkzZDVO?=
 =?utf-8?B?dWZFS3cxZzBLenhSQUVYOEE0Z3NSOG5maTdkdzc3akM4MFBzWlpOZWJDMytB?=
 =?utf-8?B?NkFKSlhwaEswV1dtdkUzZFJueW8yREtVUlZJRlNneEdhMFBCWGNzU1JXTG94?=
 =?utf-8?B?K0xmV0NxazFTdCtaeDRaY0s3bGczaTQvVW5RZzdHam9iRmxsSGhwcG5MZWtt?=
 =?utf-8?B?cGNDRXd0Y1Y4NXpHTEpXcVgrZDhIR1NiR212VHBib0t1eHBiZHVMbS9RZnFJ?=
 =?utf-8?B?QmlDL0RpSDJFcGJKZk8vcmhlM2lYZTNmMmQyVTRleWpFQVZyM205OWl6aVNZ?=
 =?utf-8?B?K1drUjNaNFQ3dGtramRaMjR3emJXbzhBcmRqeFh1U1IrK2RMbko4L3doM3cr?=
 =?utf-8?B?Nm5IekxkT2w5NEgwREhHUjRVWTFlLzFxTTJpZFRTMWkwOFhrNjlLU3JxRmJ4?=
 =?utf-8?Q?PHWITDaAY0q7d/4Yk2ZjHLuP200vxJnxeeAec=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cjFtU1JneENpM2Z5ZVU1eE0rRGZSMzJJaVZiRDlkT01IYXlvZ0lrcE9TSVBS?=
 =?utf-8?B?N01TeTdEdkczRWVvYUlRQmwyYWliNGtBOGwwOXNSQ29uTHQ4ZS9lVTQ2UEps?=
 =?utf-8?B?QnVlY3FnZWNXbHh4UkxHeXN2YjhIOElNRXluZWpJam8vMkxyOTVHem5SUXNN?=
 =?utf-8?B?Q1kwa2FwdGhJUWJ6cUJra29FWFJnSzE3RDE5aTErYVBwemN2NVNVc05GenpH?=
 =?utf-8?B?anphSndJVlBhdm5JSW5MSCtLQ0hhM2FIcVdCSktLNnEzMmYwQWo2bHR6M0RX?=
 =?utf-8?B?YnZUR01QN1V6UzNtSXU0eHcwZlc2eFlBMUNtTGpXVkRYbUx5L0VOdGlNWnJz?=
 =?utf-8?B?WFBPVUUrOHVadU9wY3NNTFFCZWE2SHZkNHF1VWhWMUI3eWs0MFVYRmd2bUVu?=
 =?utf-8?B?Q1E4VERGTXVCeWtMY3lyN25EK1ljYjVVU2V5Q1NKNkFEY1gwdWljdzhBQko3?=
 =?utf-8?B?R3VabE8vejNNSGx2YnpSeSthV3gvOU1zVC9vaENoc1JMdzhnUGdrMmxhajZJ?=
 =?utf-8?B?eDlMRjhjSlNzZU9EakxFd2NMZmxZZEJiNEJOemFGNHUwMDRWQ0JrSElTRkg0?=
 =?utf-8?B?N1g5MlR1Q2cyem1UY2dBcXh2TTNJMk5HaFg0VUF0c3FWdytNaGQyOUFPTEpk?=
 =?utf-8?B?cnNEY0xIMksvZkUrZldwTURzOFNRSGZWVWt6b1RSY3JpQVFTNm1KSFRNTk53?=
 =?utf-8?B?RWJiSnl3UlRPQ1c5Njhyczc0RkU4cEQ0bHh2eHNBZU0xNlF0N0tuL2FkWTFD?=
 =?utf-8?B?MEltdWNoU0hQTHhWejNabStqSE1qVE1oUzR3WVZZbjJoQmdZbExNb1BhbXpo?=
 =?utf-8?B?ajdRdVdNY08xTTF3STBxNzI5TWkxazMzY3RsdWlhTy9oNGllWHc5c1ArMzVs?=
 =?utf-8?B?UUJndVVuN2tjUWFuQUY2Q09KOXFWRFRNRmF5REp3V3IwNDZ5RjVHRHE0emth?=
 =?utf-8?B?NzFjRWJ2Y0lOUzJzSUdJL1NDT29oLzk5SmpmUUY0VTMzdnM3S1A1UlVMVDBF?=
 =?utf-8?B?WWRWNXh1U2hjR0JiQ1pEVldpK2Q1VVJDVTFKWFIvYkpOUHlBZjRKOVpnenRS?=
 =?utf-8?B?bVUxbnRwZzEreldJbWNlVElxd21zeEZMWmNBSGFKZE9CQitsUU5RZmcwZnp5?=
 =?utf-8?B?NDVyWm90aTJHMXZyZHU0UHJFZVJNdGhqYUNac2JNY0lUYmlQUFBPWlh5bVlN?=
 =?utf-8?B?NUFkd0NKS0RKTlNObzIvS2cwTlhKVDVub042ZFZrVk1xbjIvV1lKcUFHSS9X?=
 =?utf-8?B?SUMyazZJRmpDMXdoNUxNbFE0bHJWSm13S1lmZHgrSVhIUEJvdHo0NXlnVGt6?=
 =?utf-8?B?bS8xRG8yQVo0MkdSbXZqc1dScnhiKzBYa3FEUEtBWlVJcnNMT25SWVZYSlda?=
 =?utf-8?B?ZkpDMmV3c2ljZ0VjYlBkZTdabldTOGk4NFlNc1Ria2RNOUFpTmVaVWQyV0w2?=
 =?utf-8?B?VFliSm9PUkJBbFJZdVZIRTM0R2VSSmRhSUhiWU94NkxOZmZWbmxJK0hqMmV6?=
 =?utf-8?B?K2YzNTR1WnU1b2YvcitXOVArTDdmZGZMdys2bjltQUVSL3ViMStLUXpqVi9S?=
 =?utf-8?B?MHdpMjRIOHdSc2FNZDVaZkx4akFQSURYZDRURGtRMm9GajhxOEhlRWM0VXJz?=
 =?utf-8?B?QVVKaVlpQk0vSTQ1UGMrY05aRWRjY3R3aWp2SEFpRjd6MUM0RHR1aTlGQUhK?=
 =?utf-8?B?NWlzaWV4QlJLbHRuUk1mMTRzYzkvUmpydzc5MHBjM0N5N1RSTVVKVzRJUmJL?=
 =?utf-8?B?YzhSNkZ1bVFleGl5QXp0MVZGMGJVWk5HelpuaHBjdnNoQkE1Mlp3SmliUzlp?=
 =?utf-8?B?YXRQWXBLL0pTK0twNDNvNDlGOUw4ZVpWVkNwWURLbjY2K3pxWnhXRHFxeSs2?=
 =?utf-8?B?UDVWTi9yQUlMblNzODZUSTZZQjBlUk0wU24xUkEwUnYvMlh0NTZ4ZFA4MGVh?=
 =?utf-8?B?UWdFSG1kLzk4ODdRd2RsMGhWclNsc1c0UlFwaUNFbDdETTc4UTZnT2hEdTZG?=
 =?utf-8?B?UzJIeC9RbXVoc1N5dGMrN3ZSMDhzN0RTRGpWUXZOb0ZJNFYyTlJVM2pMKzBH?=
 =?utf-8?B?cVRLdHFITjJpdHNFLzhMME1RTmhFVTFKbU5wMWZkU2FzNVdlUmlnckJSa1lp?=
 =?utf-8?Q?NJ0BOl+SNYWnit1RvXFKw3LxT?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40726300-114b-49fa-a7bc-08dd07c3906c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2024 11:24:27.8968 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4F5a0O8pqap5tHLq/vEkCQDe9VSF/RO4lFLVVkYoITvN0ReelTOqxz9a9/kQFxsUm7+9oatwmSHTWPgQZKwtu8Agzh35hsd+sGYIWIYBdTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6257
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVsZCwgTWF0dGhldyA8
bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gU2VudDogTW9uZGF5LCBOb3ZlbWJlciAxOCwgMjAy
NCA0OjEyIFBNDQo+IFRvOiBVcGFkaHlheSwgVGVqYXMgPHRlamFzLnVwYWRoeWF5QGludGVsLmNv
bT47IGlndC0NCj4gZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwteGVAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBbaS1nLXQgVjIgMi80XSBpbmNsdWRlL2RybS11
YXBpLWV4cGVyaW1lbnRhbDogTW92ZQ0KPiBpOTE1X2RybV9sb2NhbC5oIHRvIGRybS11YXBpLWV4
cGVyaW1lbnRhbA0KPiANCj4gT24gMTgvMTEvMjAyNCAwNzowMiwgVGVqYXMgVXBhZGh5YXkgd3Jv
dGU6DQo+ID4gaTkxNV9kcm1fbG9jYWwuaCBpcyBmb3IgdGVtcG9yYXJ5IGxvY2FsIGFkZGl0aW9u
IG9mIGRlZmluZXMgYmVmb3JlIEtNRA0KPiA+IGlzIG1lcmdlZCB1cHN0cmVhbSBhbmQgZGVmaW5l
cyByZXBsYWNlZCB3aXRoIGl0LiBXZSBoYXZlIHNpbWlsYXIgbG9jYWwNCj4gPiBkZWZpbmVzIHJl
cXVpcmVtZW50IGZvciB4ZSBhcyB3ZWxsIGZvciBzb21lIGNhc2VzLiBTbyBmb3IgY29tbW9uIHVz
ZQ0KPiA+IG1vdmUgaTkxNV9kcm1fbG9jYWwuaCB0byBkcm0tdWFwaS1leHBlcmltZW50YWwvIGFu
ZCByZW5hbWUgaXQgdG8NCj4gPiBpbnRlbF9kcm1fbG9jYWwuaA0KPiA+DQo+ID4gVjIoTWF0dEEp
DQo+ID4gICAgLSBSZW1vdmUgaW5jbHVkZSBhcyBpdCBpcyBlbXB0eSBub3cNCj4gPiAgICAtIEFk
ZCBkZXRhaWxzIGluIGNvbW1pdCBtZXNzYWdlDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBUZWph
cyBVcGFkaHlheSA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICAgLi4u
L2RybS11YXBpLWV4cGVyaW1lbnRhbC9pbnRlbF9kcm1fbG9jYWwuaCAgIHwgMjcgKysrKysrKysr
KysrKysrKysrKw0KPiA+ICAgbGliL2k5MTUvZ2VtX3NjaGVkdWxlci5jICAgICAgICAgICAgICAg
ICAgICAgIHwgIDEgLQ0KPiA+ICAgbGliL2k5MTUvaW50ZWxfbWVtb3J5X3JlZ2lvbi5oICAgICAg
ICAgICAgICAgIHwgIDEgLQ0KPiA+ICAgbGliL2lndF9ndC5oICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDIgKy0NCj4gPiAgIHRvb2xzL2k5MTUtcGVyZi9pOTE1X3BlcmZfcmVj
b3JkZXIuYyAgICAgICAgICB8ICAyIC0tDQo+ID4gICA1IGZpbGVzIGNoYW5nZWQsIDI4IGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVk
ZS9kcm0tdWFwaS1leHBlcmltZW50YWwvaW50ZWxfZHJtX2xvY2FsLmgNCj4gPg0KPiA+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL2RybS11YXBpLWV4cGVyaW1lbnRhbC9pbnRlbF9kcm1fbG9jYWwuaA0K
PiA+IGIvaW5jbHVkZS9kcm0tdWFwaS1leHBlcmltZW50YWwvaW50ZWxfZHJtX2xvY2FsLmgNCj4g
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMC4uMTc3M2M2NDliDQo+
ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2luY2x1ZGUvZHJtLXVhcGktZXhwZXJpbWVudGFs
L2ludGVsX2RybV9sb2NhbC5oDQo+ID4gQEAgLTAsMCArMSwyNyBAQA0KPiA+ICsvKiBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogTUlUICovDQo+ID4gKy8qDQo+ID4gKyAqIENvcHlyaWdodCDCqSAy
MDIxIEludGVsIENvcnBvcmF0aW9uDQo+IA0KPiBDb3VsZCBidW1wIHRoaXM/DQo+IA0KPiA+ICsg
Ki8NCj4gPiArI2lmbmRlZiBfSU5URUxfRFJNX0xPQ0FMX0hfDQo+ID4gKyNkZWZpbmUgX0lOVEVM
X0RSTV9MT0NBTF9IXw0KPiA+ICsNCj4gPiArI2lmIGRlZmluZWQoX19jcGx1c3BsdXMpDQo+ID4g
K2V4dGVybiAiQyIgew0KPiA+ICsjZW5kaWYNCj4gPiArDQo+ID4gKy8qDQo+ID4gKyAqIEl0IGlz
IG5lY2Vzc2FyeSBvbiBvY2Nhc2lvbiB0byBhZGQgdWFwaSBkZWNsYXJhdGlvbnMgdG8gSUdUIGJl
Zm9yZQ0KPiA+ICt0aGV5DQo+ID4gKyAqIGFwcGVhciBpbiBpbXBvcnRlZCBrZXJuZWwgdWFwaSBo
ZWFkZXJzLiBUaGlzIGhlYWRlciBpcyBwcm92aWRlZA0KPiA+ICtmb3IgdGhpcw0KPiA+ICsgKiBw
dXJwb3NlLg0KPiA+ICsNCj4gPiArICogRWFybHkgdWFwaSBkZWNsYXJhdGlvbnMgc2hvdWxkIGJl
IGFkZGVkIGhlcmUgZXhhY3RseSBhcyB0aGV5IGFyZQ0KPiA+ICsgKiBleHBlY3RlZCB0byBhcHBl
YXIgaW4gdGhlIGtlcm5lbCB1YXBpIGhlYWRlcnMsIGkuZS4gd2l0aG91dCB0aGUNCj4gPiArIExP
Q0FMXw0KPiA+ICsgKiBvciBsb2NhbF8gcHJlZml4IGFuZCB3aXRob3V0IGFueSAjaWZuZGVmJ3Mu
IEF0dGVtcHQgc2hvdWxkIGJlIG1hZGUNCj4gPiArIHRvDQo+ID4gKyAqIGNsZWFuIHRoZXNlIHVw
IHdoZW4ga2VybmVsIHVhcGkgaGVhZGVycyBhcmUgc3luYydkLg0KPiA+ICsgKi8NCj4gPiArDQo+
ID4gKyNpZiBkZWZpbmVkKF9fY3BsdXNwbHVzKQ0KPiA+ICt9DQo+ID4gKyNlbmRpZg0KPiA+ICsN
Cj4gPiArI2VuZGlmIC8qIF9JTlRFTF9EUk1fTE9DQUxfSF8gKi8NCj4gPiBkaWZmIC0tZ2l0IGEv
bGliL2k5MTUvZ2VtX3NjaGVkdWxlci5jIGIvbGliL2k5MTUvZ2VtX3NjaGVkdWxlci5jIGluZGV4
DQo+ID4gMDA4N2RmOTAyLi5lODBjNzc1YWYgMTAwNjQ0DQo+ID4gLS0tIGEvbGliL2k5MTUvZ2Vt
X3NjaGVkdWxlci5jDQo+ID4gKysrIGIvbGliL2k5MTUvZ2VtX3NjaGVkdWxlci5jDQo+ID4gQEAg
LTI4LDcgKzI4LDYgQEANCj4gPiAgICNpbmNsdWRlICJpZ3RfY29yZS5oIg0KPiA+ICAgI2luY2x1
ZGUgImlvY3RsX3dyYXBwZXJzLmgiDQo+ID4NCj4gPiAtI2luY2x1ZGUgImk5MTUvaTkxNV9kcm1f
bG9jYWwuaCINCj4gPiAgICNpbmNsdWRlICJpOTE1L2dlbV9zY2hlZHVsZXIuaCINCj4gPiAgICNp
bmNsdWRlICJpOTE1L2dlbV9zdWJtaXNzaW9uLmgiDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbGli
L2k5MTUvaW50ZWxfbWVtb3J5X3JlZ2lvbi5oDQo+ID4gYi9saWIvaTkxNS9pbnRlbF9tZW1vcnlf
cmVnaW9uLmggaW5kZXggOWUyNGJkOGZiLi40NjQxYjE4YzEgMTAwNjQ0DQo+ID4gLS0tIGEvbGli
L2k5MTUvaW50ZWxfbWVtb3J5X3JlZ2lvbi5oDQo+ID4gKysrIGIvbGliL2k5MTUvaW50ZWxfbWVt
b3J5X3JlZ2lvbi5oDQo+ID4gQEAgLTIyLDcgKzIyLDYgQEANCj4gPiAgICAqLw0KPiA+ICAgI2lu
Y2x1ZGUgImk5MTVfZHJtLmgiDQo+ID4gICAjaW5jbHVkZSAiaWd0X2NvbGxlY3Rpb24uaCINCj4g
PiAtI2luY2x1ZGUgImk5MTVfZHJtX2xvY2FsLmgiDQo+ID4NCj4gPiAgICNpZm5kZWYgSU5URUxf
TUVNT1JZX1JFR0lPTl9IDQo+ID4gICAjZGVmaW5lIElOVEVMX01FTU9SWV9SRUdJT05fSA0KPiA+
IGRpZmYgLS1naXQgYS9saWIvaWd0X2d0LmggYi9saWIvaWd0X2d0LmggaW5kZXggZDMyMTMxMjNk
Li44MmVkMjJiZTcNCj4gPiAxMDA2NDQNCj4gPiAtLS0gYS9saWIvaWd0X2d0LmgNCj4gPiArKysg
Yi9saWIvaWd0X2d0LmgNCj4gPiBAQCAtMjQsMTEgKzI0LDExIEBADQo+ID4gICAjaWZuZGVmIElH
VF9HVF9IDQo+ID4gICAjZGVmaW5lIElHVF9HVF9IDQo+ID4NCj4gPiArI2luY2x1ZGUgImRybS11
YXBpLWV4cGVyaW1lbnRhbC9pbnRlbF9kcm1fbG9jYWwuaCINCj4gDQo+IENvdWxkIGFsc28gZHJv
cCB0aGlzIHVudGlsIG5lZWRlZCBhbmQgaW5jbHVkZSB0aGUgaGVhZGVyIG9ubHkgaW4gdGhlIHRl
c3QgZmlsZQ0KPiBmb3Igbm93Pw0KDQpLZWVwaW5nIHRoaXMgYXMgaXMgYmVjYXVzZSBJIGFtIG5v
dCBzdXJlIGZvciB3aGF0IG9yaWdpbmFsIGlkZWEgaXQgd2FzIGluY2x1ZGVkIGluIGlndF9ndC5o
LiBMb29rZWQgbGlrZSBjb21tb24gaW5jbHVkZSBzbyBkaWQgbm90IHRvdWNoIGl0Lg0KDQpUZWph
cw0KPiANCj4gQW55d2F5LA0KPiBSZXZpZXdlZC1ieTogTWF0dGhldyBBdWxkIDxtYXR0aGV3LmF1
bGRAaW50ZWwuY29tPg0KPiANCj4gPiAgICNpbmNsdWRlICJpZ3RfZGVidWdmcy5oIg0KPiA+ICAg
I2luY2x1ZGUgImlndF9kdW1teWxvYWQuaCINCj4gPiAgICNpbmNsdWRlICJpZ3RfY29yZS5oIg0K
PiA+DQo+ID4gLSNpbmNsdWRlICJpOTE1L2k5MTVfZHJtX2xvY2FsLmgiDQo+ID4gICAjaW5jbHVk
ZSAiaTkxNV9kcm0uaCINCj4gPg0KPiA+ICAgc3RydWN0IHBjaV9kZXZpY2U7DQo+ID4gZGlmZiAt
LWdpdCBhL3Rvb2xzL2k5MTUtcGVyZi9pOTE1X3BlcmZfcmVjb3JkZXIuYw0KPiA+IGIvdG9vbHMv
aTkxNS1wZXJmL2k5MTVfcGVyZl9yZWNvcmRlci5jDQo+ID4gaW5kZXggY2E0MzU0ODMyLi4zZjM2
OTJkYzggMTAwNjQ0DQo+ID4gLS0tIGEvdG9vbHMvaTkxNS1wZXJmL2k5MTVfcGVyZl9yZWNvcmRl
ci5jDQo+ID4gKysrIGIvdG9vbHMvaTkxNS1wZXJmL2k5MTVfcGVyZl9yZWNvcmRlci5jDQo+ID4g
QEAgLTQ0LDggKzQ0LDYgQEANCj4gPg0KPiA+ICAgI2luY2x1ZGUgPGk5MTVfZHJtLmg+DQo+ID4N
Cj4gPiAtI2luY2x1ZGUgImk5MTUvaTkxNV9kcm1fbG9jYWwuaCINCj4gPiAtDQo+ID4gICAjaW5j
bHVkZSAiaWd0X2NvcmUuaCINCj4gPiAgICNpbmNsdWRlICJpbnRlbF9jaGlwc2V0LmgiDQo+ID4g
ICAjaW5jbHVkZSAiaTkxNS9wZXJmLmgiDQoNCg==
