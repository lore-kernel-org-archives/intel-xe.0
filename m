Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED86C25B75
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 22:15:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D9D10E02A;
	Mon,  3 Jun 2024 22:15:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G/+QLqEm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D75E10E02A
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 22:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717452950; x=1748988950;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=8XCF9EOE0KkOmd9d7NB7mNOCuvB8EwiVsbUjLi0pb7w=;
 b=G/+QLqEmlVw7Vrxl/+ycQGsmsDvPq4S35gDTTLsS7b1gvGeUTd+QAjPc
 7uoqczVjmyx+LMfEA/8Eox+7QVD9Bnx0wpqmRYUE6IuCu/CmZAX8lz16T
 cnPz5Ee90lEMnUEDTPoEjvHI3oSmnWRWM02bTPJVYZdJz5b4kAmJZcW5j
 dfstluh4IjBcjI9zavVLbSuV1HPqGxlAXVw8NxaQdPAb2GJ0ayBAFjPjU
 Dn+3s9alwszE7t8Xkry25VhTZv2pF40wGvQH3cR6vB7EcQmDeXWTkyHIj
 xdrcvkvj+cHtUI2wf51sKpamUkF4eQZiTtsuEcljUcedx3X8Q2LSmXBLj Q==;
X-CSE-ConnectionGUID: PUGu54hdSCmRs6R8sLwfZQ==
X-CSE-MsgGUID: HK1Pp+IaSY2cNehnIZx9Fw==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="17796025"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="17796025"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 15:15:49 -0700
X-CSE-ConnectionGUID: 04E0HiT3Rv69q6AcacaFdg==
X-CSE-MsgGUID: kWjTopMqTO2EaJZHryM1DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="41465096"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jun 2024 15:15:49 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 15:15:48 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 15:15:48 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 15:15:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XZRBtEFa0+aCoZF4F2SFqPA0t3kcNau0IV7gDW/eWQBziuJJsXHjwmUtCyGizGVnuyHylQVhivrVI9f1AXqljwsvLotYlTCONW9kCIOiI6g2tJc6fhPy5huHo/KAhBJAI+EZyHwMsiPWphf/uKSgAiSXJ/0ogKfsaTBJ44sMxUUzRBsM26DRjYfUWjSbS056dhthmgQYTuVfrDIbZNbdogv/wuOIoHAlKSo4+ZU5hK0erk8R7ajdwQX5WZrb1EyCFOzY0WcBa5RARmD/CbonzklN1Q/BQSxcsE/YWrfd3qoncEL04PsHGiQNuwoqER9zTOVKBAFreSOR664li6RAvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XCF9EOE0KkOmd9d7NB7mNOCuvB8EwiVsbUjLi0pb7w=;
 b=H38U4CKYxSXz19LV6wi62ub0Xmn36TLTN+ImllpriXnOCskzO87o0uZflBUziux4IdiS+xLdUVJZQbfXY6pB7NQdmUGxygsf0rpg82ZyA1x5pc/4mVhMBQ4q/J3tWS6Wy7V5hCXUncyZL4X0Rxn6uFoTIiX1f8PXY95gzfBASNvGkGZGGQEABlN23EOBYruyn60QGGMQp3xrEzKujbT7GbM5b9GJSKRwDbK7NBoVgIr+cSEQzeNpujW0Cn0iZDmkdw7IUPJSo0iSju+4I+w00Cqj04dN88KG+sjLO5CvKn/5qcSplov3JGLjVz/BxYeJDjGQ+CxsOISGOM9vSkrDqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO6PR11MB5620.namprd11.prod.outlook.com (2603:10b6:303:13e::17)
 by PH7PR11MB7644.namprd11.prod.outlook.com (2603:10b6:510:26a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Mon, 3 Jun
 2024 22:15:46 +0000
Received: from CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::f75e:610a:4cc0:5ede]) by CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::f75e:610a:4cc0:5ede%3]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 22:15:46 +0000
From: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Ensure d3cold is only allowed in DGFX
Thread-Topic: [PATCH 2/2] drm/xe: Ensure d3cold is only allowed in DGFX
Thread-Index: AQHatgBTRV9lyavX8kC7Oh2hUDlgpbG2myeA
Date: Mon, 3 Jun 2024 22:15:46 +0000
Message-ID: <4305f424b0eb58a885c803a57b0303d3109178ce.camel@intel.com>
References: <20240603215218.14278-1-rodrigo.vivi@intel.com>
 <20240603215218.14278-2-rodrigo.vivi@intel.com>
In-Reply-To: <20240603215218.14278-2-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4-2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5620:EE_|PH7PR11MB7644:EE_
x-ms-office365-filtering-correlation-id: 37d6cf41-49ca-481a-1c69-08dc841ab7bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?OHE1OUlxYnY5c2VWNldQaGRJbklFYnkySVBDRm41VEQwaGVQZDJaWnNHM29T?=
 =?utf-8?B?V0lUTjAyaWZaT2EvRDVwZEtzK0tCTzhRSTZHLzZYbzFaYXR3KzBaSTd6aGpD?=
 =?utf-8?B?ektXdFNMT2J6aGdPdDR5RUxLY0VvQm9OdWJ2T0VLa2x1RS9xU0FxMkR2NlFU?=
 =?utf-8?B?bUw2ejI2cXBjeHI3d1dMdSs0QXhJanE2MGYxdThBS0dPMUoyVUFRT3NsMXZ0?=
 =?utf-8?B?eXNIekl5OEFLNDByb1hLS2crek9BS0VqWVNaclJUejV0MVVZWmVsVkhVMlVO?=
 =?utf-8?B?R1lSQlg1bjljMkprN0N1dVNabVJGS3gwclBQWkpaV1l5dmp6REVNczAyaHdB?=
 =?utf-8?B?bWZQZjZZOFM0MGtWZC81SDdFSjA0RmZPOU5lUlhaYVJBWkg2bkRQc2U3Z1dl?=
 =?utf-8?B?Q0lwNWJqUWtzemVvVWZxZWF3dThvK2pzUlhiNXFXT09Udml4NlRVTVE3TXhp?=
 =?utf-8?B?WjNpRjJkanhzK0NvTnlod1V1Z1BpeTNpY1pVZjA5RDRsMVVUeFExYW9HKzB6?=
 =?utf-8?B?ZjdrUGNSWFFja1UwWmpvQkNIL0ZyaWxBSkt4M1oxK0xCVnFpZ3hLZ2hHUGFr?=
 =?utf-8?B?WkJacFlDSHhrcXNPTWFLY2ZuL0RxTFNWWWd3ZjJhZ3czYmVpdWpHT3U4Y3BL?=
 =?utf-8?B?ajBZbTR0eTNncVRLWjBncEF0ZklaT1c2cThxTER1U3VVU0ZLeHprSUU3MFhp?=
 =?utf-8?B?WUpMYTU1UFpFT1cwVE9LL085TTk0Q0htYnhUTldEMDl2YnA1TWc2TFYyUkFR?=
 =?utf-8?B?MG5TWi9XMC9EOXIwamJabitMQ3R0NUJxZVJNbEdub29rZ0ZuMFo0UU1BVXl3?=
 =?utf-8?B?ZVFmekJhZ2dzKzZKWW9xTFlRZ0RheVpULzFmcWlWdHBFMGRYaHJxTWZkd3p3?=
 =?utf-8?B?N00vZ0VoelNtSjM2SVNsbXIvalpLVkVONVRjRVRHRmNqWUN1c1I1ZElPZTVn?=
 =?utf-8?B?OEMxK1pBeURpMXVET1k2UkF3RjZTV1ZUZFp3MWZYTVg5b1hHalVOdnRIUVFK?=
 =?utf-8?B?MGZoUS9FNVpSTFRZN0k2THdLeUZnTXdxMzQzTXdlVTJHQUU3QytZbkd0WWhF?=
 =?utf-8?B?MDZjNDdxQWhMZ05aWHhPeFI2ZXk4TU91S3NsMFNPV0ZjZGVRcThMS0lGUlBx?=
 =?utf-8?B?K0pFZkRqSEJvdWZ2bFFvajIxajFadjhSU3IvMG1XUTFaYzNraVBKbEc2bDk0?=
 =?utf-8?B?c043RDUxTnNBcml4Yi9SamFnN25La1hNQ1BNb2h3V3lwT1lVRUFPcjFVYmd3?=
 =?utf-8?B?RkNaQi90N2dGNFZiMkhoVTkrMEhTRlJkZ1NIc1RWcEFZaWp3RUJHOS82VWNT?=
 =?utf-8?B?ZmhtMlFTQ1JXdys5SE4wVlp1YUFnMWFsNW1Wb3J5Z0pyRDRycFVmbGQ3NnJR?=
 =?utf-8?B?UEdrZnNsVTA0dHYvbXk4M0NIQ3dTcUUvZWx1YWpRc3h4WEZQNzFJRmZ2U05P?=
 =?utf-8?B?akVVSkdLbU11eUlnNnM2MC9FZHk0eFFWVVNCNDFaVVdsS29BcWZWbFhQYitJ?=
 =?utf-8?B?SnlLUXdabURQamFRSm1iNmd2M3AwQmZzQnVRN3h5WGVKbTJUT2xudmx3VVZk?=
 =?utf-8?B?SUlpKzBzSHFzRHVnVHJNMXo2bWovdG5GTjNWeWxoZDFQZ3RCd3BPUE9GclFG?=
 =?utf-8?B?SXhYK25WcTN2QTE3Vm5RcHBoTDMvdGJhRUxxWFB2MXQvNllZSGRNSHh4R0Uw?=
 =?utf-8?B?NkNwV0pwTnhHVHo3aE5xTWs5dUoxclRGOFQyOWR0K3VhVGppajlnMEpRbzd2?=
 =?utf-8?B?R0R0bEpZdEtmNDc5OGdCZU4wYW9Ub2JRUjM5aGZxb0NiSE9DQjNzaDErSmk2?=
 =?utf-8?B?aEI2T3U2Z1BFVzBqclRLQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5620.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QU15UUp3T1lOMjNFUEJIYXg2bXAwQ3J3aXhURDlRTnB2dWFYS0MzQ250NzY1?=
 =?utf-8?B?eWhMVENGcFovTzB6ZXU3QlltbHZzbEpYMlc0WG0xU2xBV2Rhbml0VnM0T1Vq?=
 =?utf-8?B?NHhTOTVwYkp1cWc2OElBajUzeWhTWHV3d3hNR3BNK0RtSVd1VFJOa1Ztc0h6?=
 =?utf-8?B?ZDhWd0lDVGdaUDU1WnpMK3B1QlBjL0FWNkxvVUw3ME16Y3F2T3Q5ZXp1NGNH?=
 =?utf-8?B?WWtWTm1EaWEzTkZtSCtnSUFQS2tEanpreEpWazB0cllnOTE1cUIxT2RWMWV1?=
 =?utf-8?B?cnhsd0NTUjh2SElxMy9sS2hmUkc0dWVGeEh3aVFBU1VwZCtKbXVQMlMxSU1i?=
 =?utf-8?B?THBWcG9NU0ljWnU3VGlrYzNLbVFhNkNuREpwR3ZaQW4wajBJcjVIUXRUUTRP?=
 =?utf-8?B?Z1Y4R2pmVXRsT3kvSVF5SHV5VDIzemFDLzNyc2JmVGUySTZBZHFoYXpOMGJr?=
 =?utf-8?B?OWVCOFJsdjhXZWhzUGh2U2s2VXF3VDZaYWNRRXJZdlNGZ0FMZW9kS3ZhY3Q0?=
 =?utf-8?B?VFJSVTBzMXdyUWpMK29QbTQ3NmI0elFPU0Y4bmxwbGUvUm1NRW9JNWVrYzJi?=
 =?utf-8?B?K05NZk9QTDdvRWhDczhrZW84Vkw0dW1zaTUyQ1RqYjRHRng2M1VxS3NRVGl1?=
 =?utf-8?B?aGtuUStGaEFpNk90cS9JaUs3cnpBWElaUk1kRjNnVTNJMEtIWmxtZ0dKckY4?=
 =?utf-8?B?RlczWlFGNFB5eTdpcWRGTlpEdWNmQTltWWRMWE5lOC9McTJVSWJ6djRqM29Y?=
 =?utf-8?B?Mm1KaWFrWTA4VFg3YjlvYTdlNTNrOWFpNVB6V2MrQnhlcENCQXRpUHVuUXRu?=
 =?utf-8?B?NzRGRFlPVlBJeU9SUHNmYVVXUW9sTlNSK24zVlpoNis1V2cyYUpoWHZNMmpD?=
 =?utf-8?B?aTF0a1Jza1QvMFFhQTc3OU5VTk84QnV1ZDc1NEptT1Z3Z2RLLzBrMWViWEJH?=
 =?utf-8?B?ZGlLSjVRZVFmSTdmQi9zM1NGY0R1SlBXN2hZZmRmSGs4b0FWdGZDVGVHeEY1?=
 =?utf-8?B?T29nckVxYjBNdS9TQjRKSXZIS2UwbUFScnNwSFpudTlFYTlqUjNBSnVOKzZW?=
 =?utf-8?B?R3lOZFJETzQxNUlQbTROK1FCWFZ5ZXZYYzVHeGlaNzBOR1U4SHgzU3ZOcUkw?=
 =?utf-8?B?MENlNXlMY0JzYlJ1V1dRN1VNNHZoNWpIT1l1YVU4TFVtczJxQTJSUHMzUksw?=
 =?utf-8?B?eGxVNzVORUNJblRCNU5uajJJMFQrVnB6c1lGemZ4ZkVuUFF6cjdLYVVWVlhq?=
 =?utf-8?B?ck9Ka0dCSThzSmpZVlplbWdBaU1EVDR2N3UrZGxzMHB5M0dmdEEwYW04cmpj?=
 =?utf-8?B?RW1keE4rWWxCQWdyVXl4VVp1bTNpa1pha3c5dEltVHoyZVBTK3pPYVIwQWZH?=
 =?utf-8?B?ZXR0QVVnMFZjMGE5bEZpc3Y1dkQ2VFF3UENRbXRzYXlMSEM0bjZ0UUVERGxC?=
 =?utf-8?B?eWlqMnZvTTY2NHBsK1VhQkh6aE5kQk1EeEVFSm5CY21zU1ZZdkpDT2FKbWZy?=
 =?utf-8?B?Zkt0SXl4RE5VT3dyUGlNanlNMGVhajdyMkxtL0t2bmsxUTFpMHQrRXBYK0g3?=
 =?utf-8?B?c0cxVzJleUR6NHhaeEtLTDdtZWFSNzFuR08zRitaWWZSWXNGZWplSDlEdnI5?=
 =?utf-8?B?Uzlya2piUXFQN2JHeUZYTUNFT1FJY3pWM2xneDRkSDlIbzdNdy9aeEd0RHMw?=
 =?utf-8?B?MDhGWElSWFQ1OWJYa2t6TnE4QWF4UVlrenVrRDNRRW1IcWI1OVlRWmJqV0Fi?=
 =?utf-8?B?VE1VRlg5dmxRa1NrWnZwMDdSZnhlckFMS3RMWTZOOSs4OGNRMThzejVLTUZy?=
 =?utf-8?B?ejRRbENTbXAxaFVLZXZlb2JndE5HK0VhUkhRelNWUHd2QUpQeTd5dFZVM1FK?=
 =?utf-8?B?bGk5cVM0SkFJcDlwS3oyam81K0tkakpYUytPQUdwc2g4dHVmenZRK3dpaXJU?=
 =?utf-8?B?NWl3elhkUDFBSmxVR0NqdlRFQVpkTTJ0QVJhbm1VNC9ONWFWTENPdUtKOFM3?=
 =?utf-8?B?dlpOR216aDk0MmV6SFVObCtkdlovK0MzeVc5aDY2MWphT05odW5wTGdHQUJj?=
 =?utf-8?B?NkVHRFZDREcvM3JXbWFUbC9wTWRleWhSU2VrOHB0d3VLd3kxeURZZUhKUExE?=
 =?utf-8?B?NmY2WWpRa3F0MUpCUVZUdGpqeGpCTjlOdHprYXBmMjB4clB2aDBQQTdqcHBt?=
 =?utf-8?B?M0s2eGZUaE5vdFBhTTRRbE52TTNVWFVhQUROY3lqQkh1OGw5MTkyN2k4M2Jo?=
 =?utf-8?B?dmcxZGl1RWxoTGhmYStlaHdpYUZ3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9D96ECBEAE807F4CB670F44FEC0C8917@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5620.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37d6cf41-49ca-481a-1c69-08dc841ab7bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2024 22:15:46.5648 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: idxwrJPSko+v5FEhnyGKfJu6r09Rb8j0rk/1zLQLBC5E1fGF3dWlIA+Yb4hUpJvwKcgXX2qxKs/0BzRchdCpRuS5g1gKVkUl7l90/SrFxqM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7644
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

T24gTW9uLCAyMDI0LTA2LTAzIGF0IDE3OjUyIC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IEZvciBvdXIgaW50ZWdyYXRlZCBwYXJ0cywgdGhlIEdQVSBpcyBwYXJ0IG9mIHRoZSBDUFUgcGFj
a2FnZSwNCj4gaGVuY2UgcmVtb3ZpbmcgdGhlIHBvd2VyIGF0IHRoZSByb290IHBvcnQgaXMgbGlr
ZWx5IG5vdCBwb3NzaWJsZS4NCj4gDQo+IExldCdzIGFkZCB0aGlzIGV4dHJhIGxheWVyIG9mIHBy
b3RlY3Rpb24gdG8gZW5zdXJlIHRoYXQgd2UgYXJlDQo+IHJlYWxseSBub3Qgc2VlaW5nIGQzY29s
ZCBhdGVtcHRzIGludG8gaW50ZWdyYXRlZCBkZXZpY2VzLg0KDQpJIGRvbid0IHRoaW5rIHRoaXMg
aXMgdGhlIGNhc2UuDQoNCkl0J3MgYmVlbiBhIHdoaWxlIHNpbmNlIEkgZGVhbHQgd2l0aCB0aGlz
LCBidXQgYXMgZmFyIGFzIEkgcmVtZW1iZXIgeW91DQpjYW4gcHV0IGludGVncmF0ZWQgY2FyZHMg
aW4gRDMgY29sZCBieSB3cml0aW5nIDB4MyB0byBQQ0kgcmVnaXN0ZXINCjB4ZDQuDQoNCmh0dHBz
Oi8vY2RyZHYyLmludGVsLmNvbS92MS9kbC9nZXRjb250ZW50LzcwMzA0NyBwYWdlIDk5MCAocHJp
bnRlZCBhcw0KOTYwKS4gT24gQlNwZWMgdGhpcyBpcyBwYWdlIDQ5NjY0Lg0KDQo+IA0KPiBDYzog
UGF1bG8gWmFub25pIDxwYXVsby5yLnphbm9uaUBpbnRlbC5jb20+DQo+IENjOiBBbnNodW1hbiBH
dXB0YSA8YW5zaHVtYW4uZ3VwdGFAaW50ZWwuY29tPg0KPiBDYzogRnJhbmNvaXMgRHVnYXN0IDxm
cmFuY29pcy5kdWdhc3RAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBSb2RyaWdvIFZpdmkg
PHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3BtLmMgfCAzICsrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wbS5jIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3BtLmMNCj4gaW5kZXggZGUzYjVkZjY1ZTQ4Li4xZmFjYjdkZDhiNjYgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wbS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9wbS5jDQo+IEBAIC0xNzIsNiArMTcyLDkgQEAgc3RhdGljIGJvb2wgeGVfcG1fcGNp
X2QzY29sZF9jYXBhYmxlKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPiAgCXN0cnVjdCBwY2lfZGV2
ICpwZGV2ID0gdG9fcGNpX2Rldih4ZS0+ZHJtLmRldik7DQo+ICAJc3RydWN0IHBjaV9kZXYgKnJv
b3RfcGRldjsNCj4gIA0KPiArCWlmICghSVNfREdGWCh4ZSkpDQo+ICsJCXJldHVybiBmYWxzZTsN
Cj4gKw0KPiAgCXJvb3RfcGRldiA9IHBjaWVfZmluZF9yb290X3BvcnQocGRldik7DQo+ICAJaWYg
KCFyb290X3BkZXYpDQo+ICAJCXJldHVybiBmYWxzZTsNCg0K
