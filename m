Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70595C0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 05:20:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ABA410E24C;
	Thu, 30 Jan 2025 05:20:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j0KQYjUh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B7910E24C
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 05:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738214426; x=1769750426;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jcQP6V75gFMEp6DDhJI32Tzbxr2I+APVh/Ube7bPMOA=;
 b=j0KQYjUhGKY5Nfp10uxpjPTTAqfs3tUXVU20rnvi7mk/i4KNjE0DeHkm
 URCJzeOHOot0LGAiqUEZ3AeF8M9O7Ot0lTxr0og1SMj/5Gv8UZtMGRlu7
 /bGj2slypWozm9CsWxI3pz+8hYN4EhOzKHvhv6Lze42lUgPX+uGEsqwZt
 rVPOk3vi37gxQS2WDAQHcfd1G10avyhHoOJUOZg4HYCvTkI+RFTEES7g3
 VSlv7MKXRMthmyatTbhjWP4qB03BsFDQCxpktelcviwwWZENtZP9KuNMd
 9pNQnuhnb9zpwYtqexwbGMzPj4STmO5CX+NwNH1BDMATiDvkkGi1uKXCK w==;
X-CSE-ConnectionGUID: oztcohTxSFKhk6crlut1Hw==
X-CSE-MsgGUID: E5T3HKgbTCqrDiKvVZKiYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="38887946"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="38887946"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 21:20:24 -0800
X-CSE-ConnectionGUID: KbDWtZFHTjGj46e6F/5/gA==
X-CSE-MsgGUID: MZuS6M1IQAu9cScQwKG7xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110139043"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2025 21:20:25 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 29 Jan 2025 21:20:23 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 29 Jan 2025 21:20:23 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 29 Jan 2025 21:20:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tQsjOvHq051miCpA6PT7Nedx6HZ0kmo+PW4QsRCAbXGj+IMsK7kYIKcNN5IEcQ02N7FeaQ2yuU5KMHosOu/vUKmi1yHTALKYGv8psD7J+LSmRnWeRwiasDtH3HVifatSW0DxJyeUplTVa1BZ2SwfMRQNurelTDZdnkb77VwOLQ5F/ukJbbEBCnXjgggUiPCB/uc15wNmXA0H17UNylIRPe5r1CAYRmGvT3VUUvQmjG6zF/5QhoWosKW3whH43ven8JoDE0atEEsrQKdFCPA30yCtdcL6hGrpD8R2fzR8VCME3p89KX8Pah7Wj1WwWZEyOf1PIQ0Jeujc6YkcGEXILQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=swG/8zcg4L5O9SlMgOH1IzXtn7eMUCrVL5a54oI/LEY=;
 b=ro+8Zls6p9RXidy9cwvthLYlUNNhc1KV0wO9fPMTyXa6McDoPjOVqlL9dOEsd+vdvaF24JtGXDzGWFyDCHHLGaeu4rt9EUEkE8cxIcLNmz+yETM8UAUlTul7kzqsb5pvvc0GzMwFqSotqg5dLhnYekbegp4IkCeRX2RiQTCeewMHgqRKdyfbSMPcfVPG+slaSeNUhF9P/e27bJ6LNpz3m8389aIG+n1GvDsyWRmt5VujHIoae1rqgiwIDDucExLfrvYrHLtFlc2s9kDSh+PcQn++meAdHQ3hKL9q47nonolosVIZb2XN7Fzq1afY+6CjjDUav2QUBRfCU26usZOzXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM3PR11MB8757.namprd11.prod.outlook.com (2603:10b6:8:1af::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.23; Thu, 30 Jan 2025 05:20:08 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8377.021; Thu, 30 Jan 2025
 05:20:08 +0000
Message-ID: <c0406e8d-7a38-447c-9d5c-647306e7b2ca@intel.com>
Date: Thu, 30 Jan 2025 10:50:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] drm/xe/guc: Expose engine activity only for
 supported GuC version
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>
References: <20250129101653.1976699-1-riana.tauro@intel.com>
 <20250129101653.1976699-4-riana.tauro@intel.com>
 <01266996-b575-46a2-8334-db44a978719c@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <01266996-b575-46a2-8334-db44a978719c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0156.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::9) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM3PR11MB8757:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cdef5f0-0170-4e8b-0caa-08dd40edc2d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmlRbHRqMVUvQW82L05hQkNYaHlmRWdQazJPUVV4OWk0UDBQY0tTMHp2bDNH?=
 =?utf-8?B?ZzN4OHUwQSt6M1N6Nm9EY3BTV2ZSWEFoaGkwOHR6UDZDMUFQRDlzRjZKTjZs?=
 =?utf-8?B?QTlsZGZLT2x6bGx0aDdqaThhMnI2VXo3MHM1a1ZQUUdMLy9odnJJSGJSNWor?=
 =?utf-8?B?bmFoQlBENk5iMWFEanI2VzRrb3NYSDEzV0JjcU1uWTlWY0dkUmJUd3FaUDZu?=
 =?utf-8?B?SC9yZENUOTZEY2FVQlFtWVV3VG9BUWlYNW5SSnpDYStFRmlUdjhGSHBWKzlw?=
 =?utf-8?B?WE1IY3BGekxIRTljc3NXajFRZW8vT3ptR3JhTHRwb3YxYUVVc25pK1V0c2hs?=
 =?utf-8?B?a3FHS0RMTEkvM3ZKTG0zdWtKRzFnT1o4emtHYVQzb3BDTjZ5UlZRYkpJZklp?=
 =?utf-8?B?TzYyUFc3NWRWUDFieXRzcWNBWVBWOHJlNEpQUEhGcHpTeGpvTnRKREt4QzNX?=
 =?utf-8?B?elpiUlorUkRXUlpYWTNGbFNVTzFDWHBSWFRwUWFvYjNJTDZHcTh5OGdYNUFh?=
 =?utf-8?B?TTh0R2Vmc2lVU0gxWXNkeVM0VWNPM0g1UG1SM1lRTW5XNnVJaDlMWXlzbUg5?=
 =?utf-8?B?REw5bE5TYVN4ZjhRRHU3U1l3R21yS3dYRndKQ1FiTzJBN1VJZ2pxRVAxTXhv?=
 =?utf-8?B?WTlkT3BYa3A4WDdRUzRpR3JNZHR6bUkzY3h3ZHNyeGdtaDAvMUJmajlGWE9r?=
 =?utf-8?B?YXdiQ0tyMjQvZG93RENlMWlodllSZDExZU1Dc0ptd1Fpa2NVR2h3KzIwb0hL?=
 =?utf-8?B?WEdBcW5NOUhRdFRNQWZlM3VRNFdVeDJpNTkycjZPeWJ1OWdDOFQydkFKck5N?=
 =?utf-8?B?TkZCTEliRXlVaXZIcUJQT2dHY1NBRmdiTXBWOWlrd3d0cnF6Rk5maU5nTFln?=
 =?utf-8?B?WDJuamE1MHJQa3NVdlRmL2JvL3N2T3Z4VldKMi9CREVTR003MFBsa2NXM3Zv?=
 =?utf-8?B?dzZXYU5lZitvVVVQN0NUOFVzS0hiVHFscmpWUk5CYXZLVXkxaUdOKzRlb0VN?=
 =?utf-8?B?UFhubS9pMHNDSVVJZnhkc2EvS05SdytkakRYOUJUZVc4dDEwM3pmR3pHSnd6?=
 =?utf-8?B?ZmpLeENReWZBT1F0WEJEU3VoUVNvRWtLSVZOeHFrZzNXOUMvQTIwN1JWWWdO?=
 =?utf-8?B?c1NsNHRhYW0xK1UvNGZaZlhpZTFkODkvQkhuYk5ndkdiSklaNmVrMFlUWGtq?=
 =?utf-8?B?NlViYXc5V2E5ZnFPb1FZaHJlNUlkVnNpeHlqZklNWG44NllzczRKWUlOenVm?=
 =?utf-8?B?cVQrK1ErWnpyYjN0SmVURVV5NWl5OVozSFVkeTNtenpoY0QrVzdpTWpkcFhK?=
 =?utf-8?B?ejAwMGFwU3BBaENXY3JQRlhZU1Q2cE0rZ1g4WEpiQTVjN1IrSnhkNURveUVV?=
 =?utf-8?B?cUE3STlCblBVK3BwbnRxVmVoQ3Nha3R4TzUrTHVTQXVkQjI1QlhvMUZFdXR2?=
 =?utf-8?B?NVh2dHNUL1AyZGNFb3d1cUpnQysrdktaRm92TFpkOVovVFhpQkRBS0llb2tE?=
 =?utf-8?B?bDIyNENvcjduQjZNcmlTdnVOV1Nva2lJd1JMem1UR21lT2F0RkJxMjRCL2l2?=
 =?utf-8?B?aHRpRmJrN2tibm9MMlc4QXIvVjdWbXg5VzIxMGR4YU1zZE9KNmlwY3pUS3Zl?=
 =?utf-8?B?aGs4TFJnT2JUL1FFODMxQ1RLblpuc1FPNkZxNVJqR1FKWm1Tem9JaFprWitt?=
 =?utf-8?B?OHZQS0llVXNJL1M1TFpmM042QmZtQmdkQ20vRWUyaHRxYnhEWVUzTEJ3YXhC?=
 =?utf-8?B?MHBFOEk5MWZCczhJU0h0eXdjYllnMnVEcG8zVVlRNVV6a21ZcDUrZmxuclo1?=
 =?utf-8?B?NnhGcWxKOVkxTUFyNWhyS3FwUDN4UG1TNDk0RTI3RmswK3ovbkttRGo5TzdK?=
 =?utf-8?Q?8T2F2fqvbQQhh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0pzR1VhbXVEdGZoMit3dWhOY0xUS0dHMThMZllOR1J4elVydndVYU51aVE0?=
 =?utf-8?B?bHFYcjFhSk5RcUt4ZW4yUkpVY1VQUHJxOWJMRlZnOWt0U1FscHNXZVBEUTRr?=
 =?utf-8?B?ckI2WjJlOTE1WVFvc25SS2VjSmUwYWh6UzBXTG5kQnNKVWFJNHNiSTBFWExr?=
 =?utf-8?B?SXZSUE00dDUzL2hBelBJMWErVmdDazkvODNERTN3SlFLT0JoSmVIYXpMNmZO?=
 =?utf-8?B?dGljaWpMSit2bGQyY3BIbG5MQW9RYTRieCtvYVFPZ1ZSSDVPR29YU3BUWnJ4?=
 =?utf-8?B?bkVmTTVnVE9BQ3lOdWhEVnBMVTMvQmlWcnZmL05JR0svQkdDUWpHZXFOcHh5?=
 =?utf-8?B?NzU5cVg3M3BKaFdOMno1ZUxlOGYzaXdwZWFpbGV0TnRWZUxiR0E1Um12V0xD?=
 =?utf-8?B?blJjcXMwZVc1Y3YydzgxNE9STExSb28raGVJMmRsL3l1bmZJTnlOT2I4WUk4?=
 =?utf-8?B?TzZveVh5di9maERNUUpVMFBwTExpanhXN2duODdhOXJORTdvbmZwb2oyZm5O?=
 =?utf-8?B?bmhheUhNcXRXNy80b3pRYnBLN3A2MGtuaiswdmhSWEZYVHpnbmxRa1c3RS9Y?=
 =?utf-8?B?U1dyV0pWVVFlckxhc1pBZFY4bFJKTWxNdUI2QW40SHVybGJrS0NveWJCcWhG?=
 =?utf-8?B?RjVnYnlqYWdkL3RGc1Q2dTNpNVJYbDVJUFR4dWtiTXVmUnE2T3pXK0JLYnRI?=
 =?utf-8?B?VWRsSGV1MEwvcC9XVUJUSmEvdXIrVDRTWVlEdDdUNmNnem1jVXNsc1dzWTVi?=
 =?utf-8?B?c0VYSHZ2TU5Yalk4bWVYMVhUbFpoeERwTFk0UHkzTjdXK2c0T2FmMFhpWTBP?=
 =?utf-8?B?c0NhVE1kcFBHRndYN3FKWXBiTzJQNnpJLzFpUCtuZEczUFN6cUM3dlNoNmw0?=
 =?utf-8?B?UmhVL29UUGFaTDcrMExQNWtPdlRRSzd5bEZjdDI2UHhkb21PYS9vWGx4eDNs?=
 =?utf-8?B?emxNU2N3OFVqemZMOVlLbTBQMDhsU3ByY1BFQllpS3RQOEwybXkxMGxIaVc4?=
 =?utf-8?B?WW04QUVkWGxYOHV5b2dwRTJaN1F0WlpHYlN6cnVjblY0VXR0SDFEM2Z4cHF0?=
 =?utf-8?B?YlJZYVNid3l6YU54Q0dGU0d1Y1pFeEZYUm5FeUpKbFF4MWoyTERaNDVmMjJQ?=
 =?utf-8?B?MS9LdkdQSEFIM2t1WnVsMXlsenZ5MHduZnI2ckxhSlpUVm5VVTRSNWdQS1Jk?=
 =?utf-8?B?TkNXWFNPRTJqYUV2blAybmdJNFJ4dWpKZFBXUFdDMTVMQzU3Y0I0N0QyZE5X?=
 =?utf-8?B?MEQyU3RjdlVDbGs3bnFLbjZWRkhKNjJIck1TV3pjK1k3Q0JqN0kxUFc4cmY1?=
 =?utf-8?B?RHBuMVZ6S0NSeFYycjRRbXIxcjJqSnR3b1MvSkZ6RHdvUWNVck5wLzBWTC9h?=
 =?utf-8?B?WVBLemZtUE5NMU1adDZIdWNBTUNtVzVWNkhIbWlxYzFvSWtKNzhKYjBnVHN1?=
 =?utf-8?B?TjBlNm9zcFVIdWVxSW9SdTlYRjgxMXJ6NHcwcmZwNm9hc0xRRjg5TEtmejAz?=
 =?utf-8?B?TWJRbEF1dlBqWUtRalpyZXB4eWlvUER4clVxWEp1UWhZMmJudEQwbERqUHd6?=
 =?utf-8?B?bktCVXUzZFZZYUtnRmc4RHhOL0JXQ0E1eGMyK25qSmNrY2JGTzhUb0ZtQUJF?=
 =?utf-8?B?dXppamRBVHUrZWJocmdubFlvTmtCdlpJNlVOSHFMV01WbTlVRUZndzhTaThz?=
 =?utf-8?B?R2VtR0QwTkVqVnRQMHlZSzNvWXlHUkxIdTFnQnhDQ09BcTZHUEVJMGtOK2lR?=
 =?utf-8?B?d3VsVnJmNHJlblVCd3VvQlVVL0NrN0RsR3pDVm9VbVlLMStmUElzVXg1aVBR?=
 =?utf-8?B?TE1LQVJCZFppR1l3Q3JSaXJ6M3FJbXBRZEVDcTRIYlpPWmIwT0puRHJuT3Ri?=
 =?utf-8?B?SUIrWGs2a3g4TkpZaVp6M0ZIa0VYLzIzeWh1RFVlZkQ4aG9rZmZEOTJFb3hZ?=
 =?utf-8?B?QWRiRkhlL3lCTUcxRlgwVFBEQTFzM29McEZXUFJYR2RVTFdhdFpXZFlNanNa?=
 =?utf-8?B?WlMyeUtadUhMWDJVNTNURE1RN21yd3BGb01NUE52cWlOcEtSVnUwU2N6SnFZ?=
 =?utf-8?B?TUtpeHRTQkNhclllWmV3QnNBMzFHVDNlWnVCTVQrMG5naUJVVHlPMmRyMW9R?=
 =?utf-8?Q?XRmWGeDEb65b/kl9Nz5BUiA8A?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cdef5f0-0170-4e8b-0caa-08dd40edc2d0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 05:20:08.1201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 21Y/xr+YTVasoclTOJTm+bgizuwNFzkJPBX8gGn5UDT3iJAEhujrGTKIiWCFi4jkrzrFZkRzIFbuXR29G1VA3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8757
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

Hi Michal

On 1/30/2025 1:48 AM, Michal Wajdeczko wrote:
> 
> 
> On 29.01.2025 11:16, Riana Tauro wrote:
>> Engine activity is supported only on GuC submission version >= 1.14.1
>> Allow enabling/reading engine activity only on supported
>> GuC versions. Warn once if not supported.
>>
>> v2: use guc submission version (John)
>> v3: use drm_warn_once to avoid stacktrace (Umesh)
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_engine_activity.c | 32 +++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_engine_activity.h |  1 +
>>   2 files changed, 33 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> index 9c08af273397..4d720afd12ac 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> @@ -250,6 +250,9 @@ u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe)
>>   {
>>   	struct xe_guc *guc =  &hwe->gt->uc.guc;
>>   
>> +	if (!xe_guc_engine_activity_supported(guc))
>> +		return 0;
>> +
>>   	return get_engine_active_ticks(guc, hwe);
>>   }
>>   
>> @@ -263,9 +266,32 @@ u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe)
>>   {
>>   	struct xe_guc *guc =  &hwe->gt->uc.guc;
>>   
>> +	if (!xe_guc_engine_activity_supported(guc))
>> +		return 0;
>> +
>>   	return get_engine_total_ticks(guc, hwe);
>>   }
>>   
>> +/**
>> + * xe_guc_engine_activity_supported - Check support for Engine activity stats
>> + * @guc: The GuC object
>> + *
>> + * Engine activity stats is supported from GuC submission version
>> + * (1.14.1)
>> + *
>> + * Return: true if engine activity stats supported, false otherwise
>> + */
>> +bool xe_guc_engine_activity_supported(struct xe_guc *guc)
>> +{
>> +	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 14, 1))
>> +		return true;
> 
> this patch seems to be redundant as patch:
> 
> [PATCH v4 5/8] drm/xe/guc: Bump minimum required GuC version to v70.36.0
> 
> now requires at least submit version 1.17.1
This feature support was added in 1.14.1 hence the version.

[PATCH v4 5/8] drm/xe/guc: Bump minimum required GuC version to v70.36.0
Upstream firmware latest above 70.33 is 36.0
> 
>> +
>> +	drm_warn_once(&guc_to_xe(guc)->drm,
> 
> btw, for GuC related logs we prefer xe_gt_info() logs
will replace in the series with gt versions
> 
> and _once() variant is n/a here as it will hide any other messages from
> drivers running on other devices that might be present on the system
I thought _once would be per-device. Will re-check

But removing _once would log the message after every suspend/resume or 
reset. If that's okay will remove once
> 
> better option seems to be check/log once in the init() and then just set
> a flag that could be used later
This sounds good. Will add this in the next rev
> 
>> +		      "per-engine-class activity not supported for this GuC version\n");
> 
> and maybe we should be more friendly and instead "this" also print
> actual version used to save the user looking for it elsewhere
Sure, will add this

Thanks
Riana
> 
>> +
>> +	return false;
>> +}
>> +
>>   /**
>>    * xe_guc_engine_activity_enable_stats - Enable engine activity stats
>>    * @guc: The GuC object
>> @@ -276,6 +302,9 @@ void xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
>>   {
>>   	int ret;
>>   
>> +	if (!xe_guc_engine_activity_supported(guc))
>> +		return;
>> +
>>   	ret = enable_engine_activity_stats(guc);
>>   	if (ret)
>>   		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
>> @@ -302,6 +331,9 @@ int xe_guc_engine_activity_init(struct xe_guc *guc)
>>   	struct xe_gt *gt = guc_to_gt(guc);
>>   	int ret;
>>   
>> +	if (!xe_guc_engine_activity_supported(guc))
>> +		return 0;
>> +
>>   	ret = allocate_engine_activity_group(guc);
>>   	if (ret) {
>>   		xe_gt_err(gt, "failed to allocate activity group %d\n", ret);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.h b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>> index c00f3da5513d..9d3ea3f67b6a 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>> @@ -12,6 +12,7 @@ struct xe_hw_engine;
>>   struct xe_guc;
>>   
>>   int xe_guc_engine_activity_init(struct xe_guc *guc);
>> +bool xe_guc_engine_activity_supported(struct xe_guc *guc);
>>   void xe_guc_engine_activity_enable_stats(struct xe_guc *guc);
>>   u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe);
>>   u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe);
> 

