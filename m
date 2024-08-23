Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D51CC52D7C
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 07:08:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3A810E055;
	Fri, 23 Aug 2024 07:08:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RLAdQ3ay";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB05E10E055
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Aug 2024 07:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724396880; x=1755932880;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=zo5YXPCvPF02J6JMkkAidYbf5Y2mk1bagsyFVNwjnto=;
 b=RLAdQ3ayFIc4iNHTqXEzSSIEqQYLgInX1bkk6W2GG+JT9wGBS0gCfKjO
 DxqGGOkvMatuPuYlIf4B0WB7HqhUiPuN8lEXjKr5ryoXoDbxx0KEgKb1z
 Mb0J17XZ6AtPKiaeOD8BZ/uN8N3BkV+oIcCYHVEUlgd9EQkURkGmdNMg3
 DZ2RV3WJBjSzwPRyiTYi6kwapLG1ONTEkie0h6BTru604Vhn1eFr+1HWB
 pQCUR3HUzJPbBf6xjn5MxyF7IKesef6a+8kTdMiYGusHeJu/op5p7tE05
 nOZbq15AHj3wDfN4Q0OxKR6FLu4xWjDuqUJuoHjvPXE+Ph8j3jOk7qiyc Q==;
X-CSE-ConnectionGUID: +o/2z/LzSWqWshdlSPOchQ==
X-CSE-MsgGUID: tpCgr7oZR0mftkquwMNlAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22974854"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="22974854"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 00:08:00 -0700
X-CSE-ConnectionGUID: 15Cq97U0RRKSU5IBm/fz8g==
X-CSE-MsgGUID: htPMEFoJRXuelXS/b+KpyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="66538048"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Aug 2024 00:08:01 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 00:08:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 23 Aug 2024 00:08:00 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 23 Aug 2024 00:07:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UFzsX/aSWEI97RnrJQ/suqyjsvyjhi9EjxAwh5D+kfYRP0uckjJGFK5ycBdNYfWxjtyO+1vD9kvdttM1h5hHdVRbER26ZVWOzstjm5nJ+cfCkGFQYCEsW0CRoWawaecl7YaIpk3a2jZBghfxwaN8EXMZN9aTAcMuSTlasawiM7Dc2wNouqXVM/Sl4DUIwxg3CKumsUJIf+EPcgMQQFMlEO2ebw4/YpLc5WueKxNK7FvugUZo+kV/FqrYscniUgKua9G8pKdHNgNk8yfV2PPRl52ZDHMb4kH0rvoQ0ZYrqVLkEvGXzMWkhcTOszGqYFjg6TdiNaEUCfdVDAj7+JBAJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zo5YXPCvPF02J6JMkkAidYbf5Y2mk1bagsyFVNwjnto=;
 b=tRT12QTIWkqa3DTZCNy5DyeL/oL5txGdg4caxKE1yNF39qfnIgo4W6iJmnxlR1v8HeBdofc/Ci7KNCf53gNsHV61P1wSMAtFpvQrVMPYqCIkuAxaYZR/0GUc8kZg5Eare7Xm+b044nYCKBIPA77fuR1MdqkztIGO2sYwkHplaAwLGUUbgPqc/pFjx6U9PxVvL5JaF8Pb28VuHYdKRWT+U6oqN1C3cOqZ6Eu/PSwzmpqkFny/lf1BdAk194th6YHLsvmogVUVhnDEgHLxyPPpQJJpfIe5Y/A/p7WSsykCrgr8Us7k4eTK8YVmK13dJIZzxQWmiEO9tlYqy32FY3LcNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7785.namprd11.prod.outlook.com (2603:10b6:8:f1::8) by
 SJ0PR11MB5213.namprd11.prod.outlook.com (2603:10b6:a03:2da::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Fri, 23 Aug
 2024 07:07:52 +0000
Received: from DS0PR11MB7785.namprd11.prod.outlook.com
 ([fe80::7a4d:ceff:b32a:ed18]) by DS0PR11MB7785.namprd11.prod.outlook.com
 ([fe80::7a4d:ceff:b32a:ed18%6]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 07:07:52 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Shankar, Uma" <uma.shankar@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Deak, Imre" <imre.deak@intel.com>,
 "ville.syrala@intel.com" <ville.syrala@intel.com>
Subject: Re: [PATCH v3 2/3] drm/xe: Handle polling only for system s/r in
 xe_display_pm_suspend/resume()
Thread-Topic: [PATCH v3 2/3] drm/xe: Handle polling only for system s/r in
 xe_display_pm_suspend/resume()
Thread-Index: AQHa8yRxfJ4CHb70LEyCnWHhRM26erI0VNGAgAAbOgA=
Date: Fri, 23 Aug 2024 07:07:52 +0000
Message-ID: <160aa8f8d1bc55fd12f6332a27aa325da3a0e944.camel@intel.com>
References: <20240820171408.192309-1-vinod.govindapillai@intel.com>
 <20240820171408.192309-3-vinod.govindapillai@intel.com>
 <IA0PR11MB73071438F92AEF10750E423CBA882@IA0PR11MB7307.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB73071438F92AEF10750E423CBA882@IA0PR11MB7307.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7785:EE_|SJ0PR11MB5213:EE_
x-ms-office365-filtering-correlation-id: 71b34ea4-e7f7-4dff-1cfc-08dcc3424dec
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YXlmdGx5eGFNUW15V2UzUFFxQlU4dEE2RnhLczczSm5nQlJqRjNvSmJlSVFV?=
 =?utf-8?B?N3VrWmNnaDNHM0Z1V2U2TGJOQ1NIZDlWeE54UTRmS3B6WnhUUi80dDE4Rmx1?=
 =?utf-8?B?V2lzcC83bU0xME5RQ0ZhaUNOaFhidStTVStJZVdCV1lMUTVOeGxuWnNZSzIy?=
 =?utf-8?B?SkZJcXhIeGpEd1cwektieUJycXkvalVrdE1yR0tCdzZLb25UZlZWbnRjRnNt?=
 =?utf-8?B?M0pWWmRyNXBlRXQwTnFTcTdTRVROTkFNYlkvNkZadmQ4RE9pOG53bXpRN1JH?=
 =?utf-8?B?NlVZL0l6UktuREZnZFpuTjlBSnF1OUJidkJaSStUUXdvdVBVRHNEQytyckhz?=
 =?utf-8?B?aDJrTE5mVWlPZnhpVEh5ekYwUldLQXJkRURnVFFGNndxZGgva2tBSVpuall6?=
 =?utf-8?B?aVMreXdZZDBiMzZmeEIzSkJ4QjgrVVRTS1ZUTTRER2lRM1d4TlgyZkJ5clRM?=
 =?utf-8?B?Qnh5YitBb3FaMEdxbDVvNXc1OEFkL2JRZWNDSFVSME9jUEtSSmZxK0NsNWRz?=
 =?utf-8?B?bG1Ea2tCN1dMRnF6YVpuSHUvc1EwVi92bkJHSkx5TDNYcjM2M2FLb01RZkpB?=
 =?utf-8?B?K3FqcU5QVFBybEZURHZFbkJDQUg0eklQMS9vTlp0R0lhUkV0WDAvdnk5T2RJ?=
 =?utf-8?B?UkhFbG45Vy9FYUNjUTR6UjVFQ3l6SEx4VjB3ejZjT0pWaXNock9JRTZyNm4y?=
 =?utf-8?B?OGdLU0dyR0dEZzhvQUF2dERTTlV3SjBrL2x4N3p2cUFNNDdCditzbVhrL2JV?=
 =?utf-8?B?TVZwbkJNaGVXT1F6S1YraDgyMFNZMmhFT2dUc3Z3ak1CMHhKdllXV3J5Mnhs?=
 =?utf-8?B?YlY2U1dENVNhZVdIYnl4NWdXSG5hZStad2FQc0R6c2lRSGI4NjFyZjRCLzEx?=
 =?utf-8?B?bGsxa0JWOUxBeG4xL1pkRzdBZDBxdndXMzhlRWkxcGFLWC9BQnZUV1Vhd3gx?=
 =?utf-8?B?YXphQ0dkNksvalNDV1l4Vkgyc0ZRYitBZTRSbUJYQ041WVh2bXFKdHJHMWcr?=
 =?utf-8?B?WGs2UzFjaVVBNThKT1FheFo3Q2srditKMkVGNmc0dTU2MnJBblJKblF3Tk9m?=
 =?utf-8?B?bG1va29oY2haWW1wRVVwcHI4WEFKdmF0MTlibVNtaVVDRllxSnpJQjZKOW00?=
 =?utf-8?B?WGZGeGVvYS9HbjY0dFpyNkFVbGpUWGZndVBzbUNZY3NWdDM2SXFuWlg0UUd6?=
 =?utf-8?B?RlIwVEZ0NHhVK1FDTkhxUzI4WWN3MzVQS29vZEV1RHFnbU1rU1dzL3l5ZnA0?=
 =?utf-8?B?R0V2TmFubC9VV0drdjZIRHQ3S2hPN1JhWFdYUmJlMGR0NzNEa0dHMGlCaVI4?=
 =?utf-8?B?U3NqWkV1UlNuS0xkMjJiSDkwbytqYStYblpWTVlLcWZmaHlBS1pvV0JGeDZL?=
 =?utf-8?B?dGg5K3pweW43b2ZUS3JDdmVDZmxsWk9XTGxaeVQ4SXVaVnR1U3NFZkV3QWl4?=
 =?utf-8?B?S2t2YUp0R2FEQzh0VjhoSk9iU09DOU1mcTA3d3BsbDZOZzhDWDBzUHN2dHNs?=
 =?utf-8?B?eDhwbVR4RG4wTW5JYWRieVpFdGxNOW93ZlpVNU1wbDdWL0NDL0hnbmFscFlB?=
 =?utf-8?B?MG1wYXBOaXU3T3lnWUVlWVVwZzJzVU41R3VNZnRPeHBZNzc1Y0k1THdNSDhl?=
 =?utf-8?B?YlhCU1NzaDV4SW9PQW55MkM1Rm0yQkcxZ1VwUUhwZEtHeUplSEtqWUxVdm14?=
 =?utf-8?B?ZnlpNEc0NWgxb1FZczlsbUJlVlJPMERxM2JybWt0dCtoQ1M1RWc4VTEzZVdL?=
 =?utf-8?B?ajJJVUlwdXVIUEN5aTJqNGRYMURLek5LR0dvRmNJckFTKzgyV0I0enhEMTY3?=
 =?utf-8?B?VlN0TTlqcVNrMjZiRFJKYlM2dzBXd2ljcGsvc3RmV2l6cXpUQmRQRGQ4Vkk1?=
 =?utf-8?B?KzlmRXZXZ3RoMXdnZTBSSmUzNnRnY1NuUFR6OG81VXdKYVE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7785.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dXd6aXV5Y2I5d0xIUDcwaXJheUJSQlJ6QVhDdktBbWpBSEpsQWRiS3ROMVVZ?=
 =?utf-8?B?TUxLYW1MR3lnc0dneUJPbHg0d3hxaHNvVVl1TWNIbGxiajdTYkxuK0FFdFkw?=
 =?utf-8?B?TTBiQ0pUeFBMcFBRNDlyeUE5RWJ6Snl3QnpLS3UxM3JhUC9OanF3bTFvaFBW?=
 =?utf-8?B?N3h4MVdNU1pVSTJPZGkreFhFL2FSZE5hWjF0WHIrMzBqcjlmSUdQdUVyM21I?=
 =?utf-8?B?RjRUd3JDYWwyQUxDbUl2VGgyd3NoaG5nVERUWE5yMU1OTkNtVWVIZXlFVmtq?=
 =?utf-8?B?R1pqOXJKbWd0RnZLM25YalJtMDRyYWRFcGozbCtId1JOcXREdWMvWWdKU3Vj?=
 =?utf-8?B?RXljZEFDQUNqMFBGb1hyKzdhZWVZTGd5MzNQV0RGblp0NDJaeVZQK21jTU9K?=
 =?utf-8?B?NlpzUzNrUXZEWWNRb29WQ2dnN1BYWFF6Y0FUVFJxVWpsaTJ1OWg0RWQ3QVdw?=
 =?utf-8?B?YmE3ck9sbHlBTUtWa2g1dTZkTWswN05XdVBkZXR4NWZ2SGxDeVhjbkpRRXVK?=
 =?utf-8?B?UDBHeVlXVndmUFVuc0t1anZkTHVXMW5DR2FPazhlRmtLL1VJcUR3aE5odk8v?=
 =?utf-8?B?SklrNEpMWnplSElIVmV0MURHdmxRNWZmdlNER2JHb0NMWTMySDdxRER6aGRh?=
 =?utf-8?B?UUoxSFFmKzhjcm91ZlBoMk9SKzlwOTJGNTZmOXdyTnlIS0xpQTNrUzEyR2pz?=
 =?utf-8?B?QUFpOVFST1A0NW8zdDFaQ0RHYnhxcVhheGxCVTA2OTQ5bDd3VE5qOU5CdGlT?=
 =?utf-8?B?UG8weHNPM0NNR0tOQ09lMWx0MldsVWl3OHA4OFpPQXFrdjFrb3ArcnRGY3F3?=
 =?utf-8?B?T0JnbFVNQU1yMlBacEFQa01kcVF5b09aWk9JMk96ZzJVclhEZ0dIdm5EWXpD?=
 =?utf-8?B?Zm1xUkdybDNQQmI3dHhCcWw4T1RwTStrZFhMK3hFcGNlR3lpdWJVNEhxMjZ1?=
 =?utf-8?B?R3M1aG5DMk9yQVk5cXJIQ0VlNk9aNmVHMzJOZE9BVC80dDV5QmsvU1gybGRH?=
 =?utf-8?B?Q0RhQjhCaWZpUjJWbWFqZG5XSjc5dzRGM0QwVHVtRVVrMkdDeHFibmdYTXRz?=
 =?utf-8?B?MTBDQ1k2cHhTQmFkbnVuVjl6RldaSm5BVVI1dlkvZnllYXNwYXlHOEpMWklH?=
 =?utf-8?B?L1ZPb1RCZVR5MkVsVFA4ZXVvTDBrUk9FdDF3MUNrMUlsc2FBRzc4VHVNNnl0?=
 =?utf-8?B?cGdLRDNYaU1sNGFqQmVkUjlSSFFnNlJRV2JjQndQNnowN3kvOHFOUWg2aHdP?=
 =?utf-8?B?K25JR3p6Z1RvR3hxSVN0WDVFRWhzbHc2bFpWdzBxTEdocUV0NzNXMnhreHd5?=
 =?utf-8?B?L1FROFROSHdEYmVVejNCT0hGR05Ya0NpZERML2xUWjc3d3NuUWZMSmFOUEda?=
 =?utf-8?B?VkNWNmxQV0MyazM1S1prekxlZmdTOGRidmVuRTR2MWdJUEtpU1lEWm55cldF?=
 =?utf-8?B?R2NtZ1pSNTJBSGNrd0VNeHFkZ2dneFkySGtWS25UWFhEdjdlL1BSeXhCMEhJ?=
 =?utf-8?B?TVlhQ0F1S2tvRmRnaHFtODFpK2pCL0FmeU5TeCtXN0FSWXhiUkRSREZYOGR2?=
 =?utf-8?B?bnh5UjhFbG8xWUlWZGoyQ0ZDYjFHMTVQOExpRTl4MjZ3QWNZUVF2TU5UUm1D?=
 =?utf-8?B?S0FWd2JrVGYxZ1REUldHd0xjZmhMZ015Rk94NDlhNCtCcHU3ZU1sRWZBNmhr?=
 =?utf-8?B?NzNWRG1FOFJFZTdDek4yNE11VVdNWTBCY3F1UkwycW1TbTRCcWtNSGhUbnZ6?=
 =?utf-8?B?UXhNTVZrMDM0UEZPb0p5ZE5RejhLQWtERGJtYzlnT3Bqd2lpSXlQNUZnMHRx?=
 =?utf-8?B?RTVYNkRkbGxoU0ZMSXF4c3BkdXltWEk5aDUzVituOVlFb200NVAvZDZZREFa?=
 =?utf-8?B?M3k5RWkvTkljcjd2VDJiUTR4ejByRHYvbmFuNVJQcWtsWmYwbWxaSGFrSllL?=
 =?utf-8?B?ZFNOWG1RbEJ3WGpUZ0ZEMGxZbDlJVTVnS04xUER6SS9IdjFlSjNuVTVhempC?=
 =?utf-8?B?N0dGdU0yK3AzeWdaTXI3Y2lNMzdKb3BvRWxoLzRaaUdyNGtDTERnVE1MOFVW?=
 =?utf-8?B?RjlyOC9IVU5wa2NWZWZ5VGpLT0FDbC9wb0o1S0tFeHJKVnZpQkc4MEo0V3N5?=
 =?utf-8?B?aGVTSjY4M1JXb0c2bjFEV3ovVlovMEZ5bzVOOEh1dXJ6b0dtQTFuUFFXclpo?=
 =?utf-8?Q?/Y92D++qhvfJgdxdQ9MDvKI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8B8BA9598D665245BA0BFD1AC1FC14C2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7785.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71b34ea4-e7f7-4dff-1cfc-08dcc3424dec
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2024 07:07:52.2030 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: je1t9g6MJxJpkiN/z81uzQ6B0Ckz8JXFCp7C/oChoW8aqe4CxAGmVVWn7FPaGOImaWKa2abaowGThj6d1rKKJtH9WJvpVx78SmizOfsXx8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5213
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

T24gRnJpLCAyMDI0LTA4LTIzIGF0IDA1OjMwICswMDAwLCBNdXJ0aHksIEFydW4gUiB3cm90ZToN
Cg0KSGksDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldyENCg0KPiA+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+ID4gRnJvbTogR292aW5kYXBpbGxhaSwgVmlub2QgPHZpbm9kLmdvdmluZGFw
aWxsYWlAaW50ZWwuY29tPg0KPiA+IFNlbnQ6IFR1ZXNkYXksIEF1Z3VzdCAyMCwgMjAyNCAxMDo0
NCBQTQ0KPiA+IFRvOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPiBDYzogR292
aW5kYXBpbGxhaSwgVmlub2QgPHZpbm9kLmdvdmluZGFwaWxsYWlAaW50ZWwuY29tPjsgRGVhaywg
SW1yZQ0KPiA+IDxpbXJlLmRlYWtAaW50ZWwuY29tPjsgTXVydGh5LCBBcnVuIFIgPGFydW4uci5t
dXJ0aHlAaW50ZWwuY29tPjsgVml2aSwNCj4gPiBSb2RyaWdvIDxyb2RyaWdvLnZpdmlAaW50ZWwu
Y29tPjsgU2hhbmthciwgVW1hIDx1bWEuc2hhbmthckBpbnRlbC5jb20+Ow0KPiA+IHZpbGxlLnN5
cmFsYUBpbnRlbC5jb20NCj4gPiBTdWJqZWN0OiBbUEFUQ0ggdjMgMi8zXSBkcm0veGU6IEhhbmRs
ZSBwb2xsaW5nIG9ubHkgZm9yIHN5c3RlbSBzL3IgaW4NCj4gPiB4ZV9kaXNwbGF5X3BtX3N1c3Bl
bmQvcmVzdW1lKCkNCj4gPiANCj4gPiBGcm9tOiBJbXJlIERlYWsgPGltcmUuZGVha0BpbnRlbC5j
b20+DQo+ID4gDQo+ID4gVGhpcyBpcyBhIHByZXBhcmF0aW9uIGZvciB0aGUgZm9sbG93LXVwIHBh
dGNoIHdoZXJlIHBvbGxpbmcgd2lsbCBiZSBoYW5kbGVkDQo+ID4gcHJvcGVybHkgZm9yIGFsbCBj
YXNlcyBkdXJpbmcgcnVudGltZSBzdXNwZW5kL3Jlc3VtZS4NCj4gPiANCj4gPiBTaWduZWQtb2Zm
LWJ5OiBJbXJlIERlYWsgPGltcmUuZGVha0BpbnRlbC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTog
Vmlub2QgR292aW5kYXBpbGxhaSA8dmlub2QuZ292aW5kYXBpbGxhaUBpbnRlbC5jb20+DQo+ID4g
LS0tDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9kaXNwbGF5LmMgfCAxOSAr
KysrKysrLS0tLS0tLS0tLS0tDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCsp
LCAxMiBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3hlL2Rpc3BsYXkveGVfZGlzcGxheS5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxh
eS94ZV9kaXNwbGF5LmMNCj4gPiBpbmRleCBhZDdmYzUxMzdiNDIuLmIyYTBiNGI1YzQ1YyAxMDA2
NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9kaXNwbGF5LmMNCj4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9kaXNwbGF5LmMNCj4gPiBAQCAt
MzIwLDE1ICszMjAsMTMgQEAgdm9pZCB4ZV9kaXNwbGF5X3BtX3N1c3BlbmQoc3RydWN0IHhlX2Rl
dmljZSAqeGUsDQo+ID4gYm9vbCBydW50aW1lKQ0KPiA+IMKgwqDCoMKgwqDCoMKgwqAgKiBwcm9w
ZXJseS4NCj4gPiDCoMKgwqDCoMKgwqDCoMKgICovDQo+ID4gwqDCoMKgwqDCoMKgwqDCoGludGVs
X3Bvd2VyX2RvbWFpbnNfZGlzYWJsZSh4ZSk7DQo+ID4gKw0KPiBVbi1uZWNlc3NhcnkgY2hhbmdl
Lg0KPiANCj4gPiDCoMKgwqDCoMKgwqDCoMKgaW50ZWxfZmJkZXZfc2V0X3N1c3BlbmQoJnhlLT5k
cm0sIEZCSU5GT19TVEFURV9TVVNQRU5ERUQsIHRydWUpOw0KPiA+IC3CoMKgwqDCoMKgwqDCoGlm
IChoYXNfZGlzcGxheSh4ZSkpIHsNCj4gPiArwqDCoMKgwqDCoMKgwqBpZiAoIXJ1bnRpbWUgJiYg
aGFzX2Rpc3BsYXkoeGUpKSB7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBk
cm1fa21zX2hlbHBlcl9wb2xsX2Rpc2FibGUoJnhlLT5kcm0pOw0KPiANCj4gQ2FuIHdlIGdldCBy
aWQgb2YgdGhpcyBBUEkgYXMgd2UgZG9uJ3QgcmVwbHkgb24gZGV2aWNlIHBvbGxpbmcgYW5kIHVz
ZSBpbnRlcnJ1cHQgYmFzZWQuDQoNCk5vdCBzdXJlIGlmIEkgdW5kZXJzdGFuZCB0aGUgcG9pbnQh
IFdvbmRlciBpZiBpdCBpcyByZWxldmFudCBhdCB0aGlzIGNvbnRleHQhIEJ1dCBhcyBtZW50aW9u
ZWQgaW4NCnRoZSBzZXJpZXMgcGF0Y2ggZGVzY3JpcHRpb24sIHRoZXJlIGNvdWxkIGJlIGZldyBv
dGhlciBzdGVwcyBtaXNzaW5nIGluIHRoZSB4ZSBydW50aW1lX3N1c3BlbmQNCmhhbmRsaW5nIGFu
ZCBhIGJldHRlciByZWZhY3RvcmluZy9jaGFuZ2VzIGFyZSBiZWluZyBwbGFubmVkLiBTbyBJIGd1
ZXNzIHlvdSBjb3VsZCB0YWtlIHRoaXMgdXAgYXQNCnRoYXQgdGltZT8gDQoNCj4gDQo+ID4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICghcnVudGltZSkNCj4gPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGludGVsX2Rpc3BsYXlfZHJpdmVy
X2Rpc2FibGVfdXNlcl9hY2Nlc3MoeGUpOw0KPiA+IC3CoMKgwqDCoMKgwqDCoH0NCj4gPiAtDQo+
ID4gLcKgwqDCoMKgwqDCoMKgaWYgKCFydW50aW1lKQ0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBpbnRlbF9kaXNwbGF5X2RyaXZlcl9kaXNhYmxlX3VzZXJfYWNjZXNzKHhlKTsN
Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGludGVsX2Rpc3BsYXlfZHJpdmVy
X3N1c3BlbmQoeGUpOw0KPiA+ICvCoMKgwqDCoMKgwqDCoH0NCj4gPiANCj4gPiDCoMKgwqDCoMKg
wqDCoMKgeGVfZGlzcGxheV9mbHVzaF9jbGVhbnVwX3dvcmsoeGUpOw0KPiA+IA0KPiA+IEBAIC0z
ODcsMTUgKzM4NSwxMiBAQCB2b2lkIHhlX2Rpc3BsYXlfcG1fcmVzdW1lKHN0cnVjdCB4ZV9kZXZp
Y2UgKnhlLA0KPiA+IGJvb2wgcnVudGltZSkNCj4gPiANCj4gPiDCoMKgwqDCoMKgwqDCoMKgLyog
TVNUIHNpZGViYW5kIHJlcXVpcmVzIEhQRCBpbnRlcnJ1cHRzIGVuYWJsZWQgKi8NCj4gPiDCoMKg
wqDCoMKgwqDCoMKgaW50ZWxfZHBfbXN0X3Jlc3VtZSh4ZSk7DQo+ID4gLcKgwqDCoMKgwqDCoMKg
aWYgKCFydW50aW1lKQ0KPiA+ICvCoMKgwqDCoMKgwqDCoGlmICghcnVudGltZSAmJiBoYXNfZGlz
cGxheSh4ZSkpIHsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGludGVsX2Rp
c3BsYXlfZHJpdmVyX3Jlc3VtZSh4ZSk7DQo+ID4gLQ0KPiA+IC3CoMKgwqDCoMKgwqDCoGlmICho
YXNfZGlzcGxheSh4ZSkpIHsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRy
bV9rbXNfaGVscGVyX3BvbGxfZW5hYmxlKCZ4ZS0+ZHJtKTsNCj4gPiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgaWYgKCFydW50aW1lKQ0KPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaW50ZWxfZGlzcGxheV9kcml2ZXJfZW5hYmxlX3VzZXJf
YWNjZXNzKHhlKTsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaW50ZWxfZGlz
cGxheV9kcml2ZXJfZW5hYmxlX3VzZXJfYWNjZXNzKHhlKTsNCj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgaW50ZWxfaHBkX3BvbGxfZGlzYWJsZSh4ZSk7DQo+IERvIHdlIG5lZWQg
dGhpcyBkaXNhYmxlIGhlcmUgYXMgd2UgYXJlIGVuYWJsaW5nIHRoaXMgb25seSBpbiB4ZV9kaXNw
bGF5X3BtX3J1bnRpbWVfc3VzcGVuZCgpIGFuZA0KPiBoZW5jZSBkaXNhYmxlIG9ubHkgaW4geGVf
ZGlzcGxheV9wbV9ydW50aW1lX3Jlc3VtZSgpDQoNClRvIHF1b3RlIEltcmUswqANCg0KImludGVs
X2hwZF9wb2xsX2Rpc2FibGUoKSBpcyBuZWVkZWQgZHVyaW5nIHN5c3RlbSByZXN1bWUgYXMgd2Vs
bCwgc2luY2UgaXQgZG9lcyBhbiBleHBsaWNpdA0KY29ubmVjdG9yIHByb2JpbmcuIFRoaXMgcHJv
YmluZyBpcyBuZWVkZWQgYWxzbyB3aGVuIHlvdSByZXN1bWUgZnJvbSBTMyBldGMsIGZvciBtb25p
dG9ycyB0aGF0IGdvdA0KY29ubmVjdGVkIGR1cmluZyB0aGUgc3lzdGVtIHdhcyBzdXNwZW5kZWQu
Ig0KDQpCUg0KVmlub2QNCg0KPiANCj4gVGhhbmtzIGFuZCBSZWdhcmRzLA0KPiBBcnVuIFIgTXVy
dGh5DQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+ID4gwqDCoMKgwqDCoMKgwqDCoH0NCj4g
PiAtwqDCoMKgwqDCoMKgwqBpbnRlbF9ocGRfcG9sbF9kaXNhYmxlKHhlKTsNCj4gPiANCj4gPiDC
oMKgwqDCoMKgwqDCoMKgaW50ZWxfb3ByZWdpb25fcmVzdW1lKGRpc3BsYXkpOw0KPiA+IA0KPiA+
IC0tDQo+ID4gMi4zNC4xDQo+IA0KDQo=
