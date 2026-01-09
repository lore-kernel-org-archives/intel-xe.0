Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E2CD1A63D
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 14:50:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18AC310E8DF;
	Fri,  9 Jan 2026 14:50:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vt+Wbuf8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB0F10E8DF
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 14:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767970222; x=1799506222;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=2SONRF0LgradojoNIQM3EEREOwIdm93yeA9qik962uM=;
 b=Vt+Wbuf8aemFMzjCVw2UaaHr7FGx1r0/4FCPIDWfGsBQioc5gtt1OjoC
 ISG1rgPR5ccx+ST3ge8DdJA6y6vqTupeUjf86PLL6to64r5pN0v7t01n7
 TsgnpTw0KvsQkbakW2MNo+2CGwVP+ogNdVKS8UeD8oX3Yw/OLgsY1zi+n
 SBfHvOigecqU4fyUMsZkh3kG3yJZ5ZFPdqjlsZrwZiHWk3/3ikQfE2Rgt
 0ldg6oZONy1YJGoCyDpZ/+RBcM8aeXLqyo3Qd2hfVWi1aLDrdwzF+eDfP
 k8mIuOKOdmswP5DQy4mgO62p8ntnNZlOMNknQESlkd0IjOxKVyPPAw75R Q==;
X-CSE-ConnectionGUID: LtbSvoU0TkiJ1pw7hhFU6g==
X-CSE-MsgGUID: QsoPeg4TTxyLpDzoeF9lyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69089544"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="69089544"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 06:50:21 -0800
X-CSE-ConnectionGUID: ZuN9iHboQ8Sr4khHRw1vWw==
X-CSE-MsgGUID: yVjMzQ+fR2SAJH3zXSvrvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="203554350"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 06:50:21 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 06:50:20 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 06:50:20 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.17) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 06:50:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AUFAsDEeYtXMAOut6mYoApPstwNpj+F4zIO4S0IZj0DMZ6cjANAEH3McMmBockdtDtkGMDA8Ao8Gt53zXp29SibMen7xi25tEfCQmq+VoAnqLo2mm4a+m/tU9QmspNqBtCZekl55/ZsCDgfx1Rh5Y8hHS4Z/ylyRdsiaGXvFRXKbveNGNWLb+UdDZ2qm1J8LPmWRNO2k2HMqxjqSRy7hMK/kGEtrfWqEMnh1LYX/PalGuuDbGZI+NnUgsST3+3rI4gzNnTHzcQciIiyB0Zje3jVGrM5OpRFmQh8ydHdCAYZ0Kc8uIcwaNxT+PFvbcZjHQQk7gylPfqeE7TUVzCHnZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2SONRF0LgradojoNIQM3EEREOwIdm93yeA9qik962uM=;
 b=K8lWPRuj1sq+pGhhYjVI3uwd4kVmC7H6TASTOAyunxD2Qlf9dC4jMFixaW5qJxp2En3jP8I6VWOo/oUrUvUigzf0H288PD8oUYtSMPcgZn8FKWwwXwCXMGBFPriiPvJ0AAaLVvGZuXJnPXcogKOug6AAAiLYiAKLh9FkX2oiivsYGYB0SCBVPEr7sBjaEGp9CjLEiDJIvO83Bsmpx68T4VjRWjIj0CeNnUwNx3LxtsnRhsWbX20YbBPVIvQ9aeopKBu0x2u4mVDWxiM0reMbg1itiukgxWKxIkQI1OngoJMaGqz4GjAcp2mtEauOgv/bTrbhVF2srsDvu09JX2Xppw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB8034.namprd11.prod.outlook.com (2603:10b6:510:247::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 14:50:12 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 14:50:12 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>, "Jadav, Raag"
 <raag.jadav@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nikula, Jani" <jani.nikula@intel.com>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>,
 "dev@lankhorst.se" <dev@lankhorst.se>, "Shankar, Uma"
 <uma.shankar@intel.com>, "Poosa, Karthik" <karthik.poosa@intel.com>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH v2] drm/xe/pm: Handle GT resume failure
Thread-Topic: [PATCH v2] drm/xe/pm: Handle GT resume failure
Thread-Index: AQHccYPNIzH9IDP9EECqmFjJMhNYKbVJQJyAgAA2PYCAAFZ1gIAAK38AgAASrYA=
Date: Fri, 9 Jan 2026 14:50:12 +0000
Message-ID: <a8d6db36025d026a07eb7c1de07dfff376b69cc2.camel@intel.com>
References: <20251220073657.166810-1-raag.jadav@intel.com>
 <78e5bb9e-595c-490d-96b0-bb01126d2f8a@intel.com>
 <aWCY9Y0CKyF1OyGC@black.igk.intel.com>
 <7fe6e5fc-532d-4b27-878c-de47520f2482@intel.com>
 <aWEF-MRhF5PiGTkP@black.igk.intel.com>
In-Reply-To: <aWEF-MRhF5PiGTkP@black.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR11MB8430:EE_|PH7PR11MB8034:EE_
x-ms-office365-filtering-correlation-id: 764bfd33-f28b-4093-7f21-08de4f8e64c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?UjlVSWFhR0F5VE5LTk02Q0JsL25ZOVNSVTVISDkramtRNFMvTFJzZ1lhL0NR?=
 =?utf-8?B?RTNmdEYvRmdya1J4UFBPb1k5TXZYU2J6UDJvdTRwUVpCeXpFWjVzazY1clhD?=
 =?utf-8?B?Y1JwK2VSTm9OdG1hdjA4alU4N3U5VExwZnFlSkNHb3RiUDQ5NnArTm5PV0Ns?=
 =?utf-8?B?WFBCRlR5WnlxZmkrdXN1V3lZUm11V0E5bEdTTVM2TnptMmcrTFREMFpoY1N0?=
 =?utf-8?B?TElBQWNPVXpQR2NKNkN0ZzdURnJtRDUzZ0FHRjJ2a0hxQjNuMndKeFNtWmVz?=
 =?utf-8?B?S2paYU1Va1MyUmNyaGJBMzFVSm9PSWVmM2VCYXJ6WWVEQ3AyN2IvbjlaUlVP?=
 =?utf-8?B?MGlDOU9WbXJMY1I1TjZTRjRlM2VvVENsVHc5ZnlycktkVGRVQ0dsOGdUVHdi?=
 =?utf-8?B?STUwd1NKZHhOd0pXVTg1MXJNODdrV1NzQzI0aFJwekpmNGhmRUpUeWM0Slho?=
 =?utf-8?B?eFdwT0JJVktqRU1leEZ1ZTZTN1lkbHR3dzU3SkJEWVV1cHAvR0czWFIwSWtM?=
 =?utf-8?B?TkZzMndJWVZLS0o2VVE1d2hqTjlUVlRvNTY5ZzBNc0tMT0JLZXNCYmQrSkht?=
 =?utf-8?B?dVowb1ZyZUtGSnFBeXgwdnJoVU1vVzVMMWFwUHdFNFlJL2pMQ01Nd1VGazBR?=
 =?utf-8?B?NURVeFFaZ1BxZ3g1OHlOYVpnUlpGNkw4UmNoSUdOaUNCL3I3TEpzV3FLQVpM?=
 =?utf-8?B?aXVDWnI2bUUycU9USHVDc09DVDFlTzRRU1F3aVV2cDNlZzBTaldKVVhrbGRx?=
 =?utf-8?B?cjhON3l5VE5RNHQ3R2RCZC9UTnFlMXZaNUJ4SVRMRWNhYkh6dzJCU3lJekVp?=
 =?utf-8?B?dUxXTWZ6SjhNbEFyQWphd3RUR2twYXI0a2YrcDJsZlpMb3JONG5BVURLVFRN?=
 =?utf-8?B?RFJ6M0xzS0VnM2sxTE1KQXVRdk5UU2l3Yk9DZlNEZ1BZdnJ4KzRIVE9MeGpn?=
 =?utf-8?B?enZ5cjg0blpkY3gxVkd1VEtJMDVqeTBKZHFkeVBUdzBGckM0MFVGd3puUWh6?=
 =?utf-8?B?ck9kby9FS01obUlEUkh4Sm9RaVN4R3BERlJCUkZzNGFodERyVWw4c0tNQitD?=
 =?utf-8?B?QzIrVVNZNDRtbWtZSXF6UkVtVk8vMTdsYXpOaWEvblNQR2kxSXpVb2JhV1pX?=
 =?utf-8?B?S3p3REp0cEFjU3JyZVhGbzZrbDI2YlNoSlo4amQ0Zm9SUWtSVEJSRGNVRzdy?=
 =?utf-8?B?ZEhuY2tnT281L2FmM3hsL1g3VGhrT3hHL3dYR3crVlVNcWVuUEhlODJ0alJk?=
 =?utf-8?B?R0EyMGorazV4QWR1UXhiUDJkd0RLNHRISmdLVEpIelBoVFRZOVgzaHE2Vzky?=
 =?utf-8?B?SmRaVS9qVmdEL1lpemJjVWIzRUlnNXJJcnNrTzk0cmM1dXBoT0ZEeGdpVnp2?=
 =?utf-8?B?LzZyNSt5emdPS3hOWTdROFo3OUkyTm5pUjIxLzdoUjBwV3l2MlhNR3ZSM0J5?=
 =?utf-8?B?aUcvbGF3My9iWEJLRVhJUTZTU3JUdGxuTERFOXVOeTdsN1NMelVPKzZrdEhm?=
 =?utf-8?B?WkFWeDdsQjkrT1E1UWFUUzV1MjViNlNPd1BDc3pWdUlTNS9KNDB2NVNESUZO?=
 =?utf-8?B?NHYxU1AzVXpvTG9DYzgxeURiNkUxTEpqMXFIRnprV1dDc2tvSzI0YUs2SGJF?=
 =?utf-8?B?UzFtYWh6eEtFZVRtMm8zMFB5YTZuampGSG55RlNrN29tS1VHN1g3YWhPc3Y1?=
 =?utf-8?B?UEJCQ2VYRklUUFh4WEpuVkhmWHVqVHA2Uzg5QnBTN1lKZkdGVmR2SzNaeFlC?=
 =?utf-8?B?OGE1bXRvNVhISloyVWt5Yi9TR2ZJUlFHdnVpUDhJVDZBbWw5SUhwRU5LV0s3?=
 =?utf-8?B?QWhnQ0Q4OXZKYjJXck9WdGwxUUI2eHUwNVErWEJkdkVsRXg2cE05c3RHd2cw?=
 =?utf-8?B?U3BYNHlwQjdZTTU2YnB1ODdSWUdxYmVwejRxbFFSSVBaWnlKamc4cUU1dWwv?=
 =?utf-8?B?WlY4WU9lUE0wZ0IvMW9Pc3d4QlRaYlhmVU9tUUZ1d2lkNCt1bWFjVXo5TWJT?=
 =?utf-8?B?K3dncXp2MnBBWFJUMVRXcW80M3pYTnpwRk5veTcxMjkrVGxqSFpsMUNXS1gz?=
 =?utf-8?Q?/qZ8jL?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N2FhSWlqcUR3a3NvV3NEa2JIR2d3MHNEMEhPOUhQakZ2elI3RnNLWjRIckFM?=
 =?utf-8?B?WnhIOFlYbzhIQ1o5R0xQSG43S0NIeXlxamFsUllxendsRHZnZ3F6RlJsSFhw?=
 =?utf-8?B?d3pLbGJ0bnpVRW5uQU9BUS9qcmsvK0N5TXVtRWwrWXFWZG5SbnBLYnVGWWhU?=
 =?utf-8?B?Ymd4WkdZaXBYN2kvQitmQ0JxVDE3Q2NqSTN1TlFkcVA3dkVudzlwUUtydlJM?=
 =?utf-8?B?OGpobXl2RUJuV2NuOXp5MGIwRzBwOGdyQlFtVi9la1VFQ1Q2bGREOTkzQmZp?=
 =?utf-8?B?aHRWaGZuUUVIR3lLOC9VcUMxSXgwQ2VSdjM0amxzeXlSY3hNa1g0ZVlVbTI0?=
 =?utf-8?B?UUFjRmRMOHRyb1ZGRU1aTEFoeXFqWjVQUGREYUhTd2xKOVAxL0kydnMxTDl1?=
 =?utf-8?B?TzVvTFZqdDZEMWUzZ0w1M0xMRXJtWkE5VXUrRWs1RzRFbVhNQjhkNFdwNXdF?=
 =?utf-8?B?MldhVEQwWFE4SFJqNUN5VDAxSEJ2OHpDUWh3TXdtRkl0L1B0bFNxdWRuWUp2?=
 =?utf-8?B?RitWd1BuS0UxMzhTZVZtQ2xCUTlFdjlqUFFWQmpqNzdUd1BNU0Q1Z1Zsdm5U?=
 =?utf-8?B?b2hNUUY3a3MrNW9CV0YxQ0VnREFTTXlMMlFEYTBQSnVOd2V2eUxzdlM0UW1l?=
 =?utf-8?B?akpxSkxuS2VLd1dMQnRyN3RpQlBkNkd2SWRua1BuQjJhbUxoWDVVQzBMU2Y3?=
 =?utf-8?B?UXo4T3BuY2RpYmJxWkRNbzk5N0FWaEppT3QxVWpCZi9QclZlcVYrSTdlMm5h?=
 =?utf-8?B?L2tiS3RPVWUrZDl2Nm9BNEFmVkZrUm9ibkxPcjV1eWFrdkJpZ0t3aTNkUnZF?=
 =?utf-8?B?U0hXM2hvZ1I5dzF4NHV4UFNvb3lTT1k4MFhnd1FoVTN6RUcxbGpIeVBXa3pZ?=
 =?utf-8?B?VDlZNC9wS0p1bFpjQUFRMHJoRUpOTmo0dW1oSi9vdHNyWWVsdEVlNGdaT01O?=
 =?utf-8?B?QmFoeFlBT3JqMi9jTFlhMWZwL0dHc0MrOWJ1My9kQUt3NEphdUlGc2FWNVhx?=
 =?utf-8?B?dlY4cjlnQ2NuV1ZyNk5PaHNkVEJoaDh5L2FiVkhrRXFacTFjRE11c1crSmcx?=
 =?utf-8?B?RzdjOEZRL0ZUT1RTU3pTKzlhbytYN28rRHlJRHh4VFRkL3VxZTd3WXlCU2tT?=
 =?utf-8?B?RUJybXJ2dm9qNStOcXZuaTlNeGF6OEZ1QlFwdmROeUdpejFodUlkdm8zaVlt?=
 =?utf-8?B?TU9kc3hnNzgzZzJxbVVJUUtFTHVKdmM3RzZYQlhXQkZwd3QyWFk4KzBtajFy?=
 =?utf-8?B?d2JzOCtOYXpMRlRoUCs3Z0tqeDFPUWxlMEMrdWFYODZoREhtVGJlMU9Lclox?=
 =?utf-8?B?UnBIeDhwQWhnR3Nhbkw2SmdNcjNzOTdrcVRKbG1RMFR0TlhGZTQ5OWRPTHNN?=
 =?utf-8?B?QzVMZkJhSkRWRTNUdkhKa2JwNEdZd3lYbVVyeE1NK2JZL2RGanFzTXNtVmhC?=
 =?utf-8?B?VFVFYzlwWGJZNjgrK1d2RlQxelJCMTlRZTc2cW9qdnZqenV5djZXUXU4SWlZ?=
 =?utf-8?B?SzAzYVpuQmF2d25QaWZEQStHdnpvSnp6ajBTaEt2b00xd2czLzVFQkRRbG16?=
 =?utf-8?B?UDNNUXRWbGVkaStnRFVOVFlZeGE1OG85bXV4a25BM2lUbzk2RTVXL2tyeFRh?=
 =?utf-8?B?VkRscXBieWlEMzJyTWxzT2MxamJjdlZPVmxPYy95OXpibVFlbUVVYTlHSjU2?=
 =?utf-8?B?bCtCSnE5czhJWEcyRGxFTnlVb1BhT1JEcnQzaC9OdzAydGhuSXkwS3o3c1k2?=
 =?utf-8?B?S21Ob0hFa1ZhY0FucktjNXhZNHltOEFZR3k0cGF3MVB5TERId1d0SU1vU1oz?=
 =?utf-8?B?d0hZd3VzejVxNXdEa0RwZDJEanJFS04zYkJiYnBxaGJJZHUra3J3emVVVWZY?=
 =?utf-8?B?ZFllWGVRa3lBR0JJOGROb0ZKaXlqeWY2Z3hVeStNaGkzeG8rcFJZV2YwcW8v?=
 =?utf-8?B?U2YrWjFmanBZZWtMUDhISjJXVFJ0MlI2QUE2bThtK3NhZm90S3BYSndMcllw?=
 =?utf-8?B?ODd5ajVzdXBtTVk5NWNJckphYU5KZkprK0RhbEtlak92YjFud2RkT3l4c1py?=
 =?utf-8?B?WGRNa0ZXSjVteHRvWDREb0gxOFJTOWIzak5CSmwxanc3c3hRQUZza0RJaWlG?=
 =?utf-8?B?OEt6b243Mk5CcHc0K2NzOFB4eCtkRmNwS2tCKzczYmZUcTFLNGN0S1JkUm1l?=
 =?utf-8?B?RWlORVJoQW5DeWRqNWRpWTNzcTlTVGVySmRkWDhaZndDRDBYbGYwTFJDSnVU?=
 =?utf-8?B?cU93a05JT045cldaZVM1N2JrQmhEdWNtUklxOUJPZHl4U1NLV2djWExWdFFs?=
 =?utf-8?B?bm5raXYwNjNRWmxqMzFBTlErOS9acjNtSVd1WXZoRTMrOGFxcU9lbTZKK1JG?=
 =?utf-8?Q?sMDnxOUNJA/AbZWk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <446E97B121CE4040925282C6CED8775C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 764bfd33-f28b-4093-7f21-08de4f8e64c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2026 14:50:12.7512 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L9WY73kRJRgr+UKDQG/mpsGkJmvmCAWbb+VTVhOxUIYQkqYpJsHKqM7MAGD4Dh/WOU2NzmRwzr6B5E/rp8EMYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8034
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

T24gRnJpLCAyMDI2LTAxLTA5IGF0IDE0OjQzICswMTAwLCBSYWFnIEphZGF2IHdyb3RlOg0KPiBP
biBGcmksIEphbiAwOSwgMjAyNiBhdCAwNDozNzozOVBNICswNTMwLCBOaWxhd2FyLCBCYWRhbCB3
cm90ZToNCj4gPiBPbiAwOS0wMS0yMDI2IDExOjI4LCBSYWFnIEphZGF2IHdyb3RlOg0KPiA+ID4g
T24gRnJpLCBKYW4gMDksIDIwMjYgYXQgMDg6MTQ6MDVBTSArMDUzMCwgTmlsYXdhciwgQmFkYWwg
d3JvdGU6DQo+ID4gPiA+IE9uIDIwLTEyLTIwMjUgMTM6MDYsIFJhYWcgSmFkYXYgd3JvdGU6DQo+
ID4gPiA+ID4gV2UndmUgYmVlbiBoaXN0b3JpY2FsbHkgaWdub3JpbmcgR1QgcmVzdW1lIGZhaWx1
cmUuIFNpbmNlIHRoZQ0KPiA+ID4gPiA+IGZ1bmN0aW9uDQo+ID4gPiA+ID4gY2FuIHJldHVybiBl
cnJvciwgaGFuZGxlIGl0IHByb3Blcmx5Lg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IHYyOiBCcmlu
ZyB1cCBkaXNwbGF5IGJlZm9yZSBiYWlsaW5nIChNYXR0IFJvcGVyLCBSb2RyaWdvKQ0KPiA+ID4g
PiA+IA0KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFJhYWcgSmFkYXYgPHJhYWcuamFkYXZAaW50
ZWwuY29tPg0KPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+IMKgwqAgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3BtLmMgfCAyNiArKysrKysrKysrKysrKysrKysrKysrLS0tLQ0KPiA+ID4gPiA+IMKgwqAg
MSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+ID4gPiA+
ID4gDQo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wbS5jDQo+
ID4gPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcG0uYw0KPiA+ID4gPiA+IGluZGV4IDQz
OTBiYTY5NjEwZC4uNTU5Y2Y1NDkwYWMwIDEwMDY0NA0KPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9wbS5jDQo+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3BtLmMNCj4gPiA+ID4gPiBAQCAtMjYwLDEwICsyNjAsMTkgQEAgaW50IHhlX3BtX3Jlc3VtZShz
dHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gPiA+ID4gPiDCoMKgwqAJeGVfaXJxX3Jlc3VtZSh4ZSk7
DQo+ID4gPiA+ID4gLQlmb3JfZWFjaF9ndChndCwgeGUsIGlkKQ0KPiA+ID4gPiA+IC0JCXhlX2d0
X3Jlc3VtZShndCk7DQo+ID4gPiA+ID4gKwlmb3JfZWFjaF9ndChndCwgeGUsIGlkKSB7DQo+ID4g
PiA+ID4gKwkJZXJyID0geGVfZ3RfcmVzdW1lKGd0KTsNCj4gPiA+ID4gPiArCQlpZiAoZXJyKQ0K
PiA+ID4gPiA+ICsJCQlicmVhazsNCj4gPiA+ID4gR1QgYW5kIFNBTWVkaWEgYXJlIGRpZmZlcmVu
dCBlbnRpdGllcyAoZXZlbiBpZiBib3RoIGFyZSB0cmVhdGVkDQo+ID4gPiA+IGFzIEdUcyBpbg0K
PiA+ID4gPiBzb2Z0d2FyZSksIHNob3VsZCB3ZSBub3QgY29udGludWUgYXR0ZW1wdGluZyB0byBy
ZXN1bWUgdGhlDQo+ID4gPiA+IHJlbWFpbmluZyBHVCBldmVuDQo+ID4gPiA+IGlmIHJlc3VtaW5n
IGZpcnN0IG9uZSBmYWlscy4NCj4gPiA+IE15IGxpbWl0ZWQgdW5kZXJzdGFuZGluZyBpcyB0aGF0
IEdVSSBuZWVkcyByZW5kZXIgZW5naW5lLCB3aGljaA0KPiA+ID4gdGhlIHVzZXINCj4gPiA+IHdv
bid0IGJlIGdldHRpbmcgYmFjayBlaXRoZXIgd2F5Lg0KPiA+IA0KPiA+IE9rLCBidXQgaG93IGFi
b3V0IG11bHRpLXRpbGUgcGxhdGZvcm0gbGlrZSBQVkMgd2hpY2ggZG9lc24ndCBoYXZlDQo+ID4g
UmVuZGVyDQo+ID4gZW5naW5lIGFuZCBNZWRpYT8NCj4gDQo+IEknbSBhc3N1bWluZyB3ZSBkb24n
dCBuZWVkIGRpc3BsYXkgdG8gYmUgYWJsZSB0byBkZWJ1ZyB0aGVtPw0KPiANCj4gUmVnYXJkbGVz
cywgYSBzZW1pLXdvcmtpbmcgaGFyZHdhcmUgd291bGQgY2F1c2UgZXZlbiBtb3JlIHByb2JsZW1z
DQo+IHRoYW4NCj4gc29sdmUgSU1ITyBidXQgSSdsbCBsZWF2ZSB0byB0aGUgZXhwZXJ0cyB0byBk
ZWNpZGUuDQoNCldoYXQgSSBsaWtlZCBpbiB0aGlzIFJhYWcncyB2ZXJzaW9uIGlzIHRoYXQgdGhp
cyBpcyB0aGUgbW9zdCBnZW5lcmljDQpiZXN0LWVmZm9ydCBhdHRlbXB0IHdlIGNhbiBnZXQgdG8g
c3RpbGwgYnJpbmcgc29tZSBkaXNwbGF5IGZvciBzb21lDQpkZWJ1ZyBvciBpbmZvcm1hdGlvbiBp
bnN0ZWFkIG9mIG9ubHkgYSBibGFuayBzY3JlZW4gb3Igb25seSBrZWVwDQptb3ZpbmcgYXMgaWYg
bm90aGluZyBoYWQgaGFwcGVuZWQuDQoNCkEgbW9yZSBjb21wbGV0ZSB2ZXJzaW9uIHdvdWxkIGJl
IGNoZWNrcyBwZXIgcGxhdGZvcm0gYW5kIHBlciB0eXBlIG9mDQpHVCBldGMuIFdlIGNhbiBzdGls
bCBhdHRlbXB0IHRvIHRyeSB0aGlzIGFzIGEgZm9sbG93IHVwLg0KDQpGb3Igc2VydmVyIHBsYXRm
b3JtcyBzdWNoIGFzIFBWQyBpdCBpcyBhIGJvZ3VzIGRpc2N1c3Npb24uIFN5c3RlbQ0KU3VzcGVu
ZCBpcyBub3QgYSB2YWxpZCBjYXNlIHRoZXJlLiBQZXJpb2QuDQoNCkZvciBzb21lIGRpc2NyZXRl
IGxpa2UgQk1HIHdoZXJlIHJlbmRlciBpcyB0aGVyZSBpbiB0aGUgbWFpbiBHVCwNCmJ1dCBkaXNw
bGF5IGlzIGZ1c2VkIG9mZiwgd2UgY2FuIHNpbXBseSByZXR1cm4gdGhlIGVycm9yLg0KDQpGb3Ig
dGhlIGNhc2Ugd2hlcmUgbWFpbiBHVCBmYWlsZWQsIHdlIHN0aWxsIGNhbiB0cnkgdG8gYnJpbmcg
ZGlzcGxheQ0KdXAgYW5kIGdldCBzb21lIG91dHB1dCBsaWtlIFJhYWcncyBhdHRlbXB0Lg0KDQpG
b3IgdGhlIGNhc2Ugd2hlcmUgbWVkaWEgR1QgZmFpbGVkIHdlIGNvdWxkIHByb2NlZWQgd2l0aCB0
aGUgcmVzdW1lLA0KYnV0IGtpbmQgb2YgYSBwYXJ0aWFsIHdlZGdlIG9mIHRoZSBtZWRpYSBndC4u
Lg0KDQo+IA0KPiBSYWFnDQo+IA0KPiA+ID4gPiA+ICsJfQ0KPiA+ID4gPiA+ICsJLyoNCj4gPiA+
ID4gPiArCSAqIFRyeSB0byBicmluZyB1cCBkaXNwbGF5IGJlZm9yZSBiYWlsaW5nIGZyb20gR1QN
Cj4gPiA+ID4gPiByZXN1bWUgZmFpbHVyZSwNCj4gPiA+ID4gPiArCSAqIHNvIHdlIGRvbid0IGxl
YXZlIHRoZSB1c2VyIGNsdWVsZXNzIHdpdGggYSBibGFuaw0KPiA+ID4gPiA+IHNjcmVlbi4NCj4g
PiA+ID4gPiArCSAqLw0KPiA+ID4gPiA+IMKgwqDCoAl4ZV9kaXNwbGF5X3BtX3Jlc3VtZSh4ZSk7
DQo+ID4gPiA+ID4gKwlpZiAoZXJyKQ0KPiA+ID4gPiA+ICsJCWdvdG8gZXJyOw0KPiA+ID4gPiA+
IMKgwqDCoAllcnIgPSB4ZV9ib19yZXN0b3JlX2xhdGUoeGUpOw0KPiA+ID4gPiA+IMKgwqDCoAlp
ZiAoZXJyKQ0KPiA+ID4gPiA+IEBAIC02NTYsMTAgKzY2NSwxOSBAQCBpbnQgeGVfcG1fcnVudGlt
ZV9yZXN1bWUoc3RydWN0DQo+ID4gPiA+ID4geGVfZGV2aWNlICp4ZSkNCj4gPiA+ID4gPiDCoMKg
wqAJeGVfaXJxX3Jlc3VtZSh4ZSk7DQo+ID4gPiA+ID4gLQlmb3JfZWFjaF9ndChndCwgeGUsIGlk
KQ0KPiA+ID4gPiA+IC0JCXhlLT5kM2NvbGQuYWxsb3dlZCA/IHhlX2d0X3Jlc3VtZShndCkgOg0K
PiA+ID4gPiA+IHhlX2d0X3J1bnRpbWVfcmVzdW1lKGd0KTsNCj4gPiA+ID4gPiArCWZvcl9lYWNo
X2d0KGd0LCB4ZSwgaWQpIHsNCj4gPiA+ID4gPiArCQllcnIgPSB4ZS0+ZDNjb2xkLmFsbG93ZWQg
PyB4ZV9ndF9yZXN1bWUoZ3QpDQo+ID4gPiA+ID4gOiB4ZV9ndF9ydW50aW1lX3Jlc3VtZShndCk7
DQo+ID4gPiA+ID4gKwkJaWYgKGVycikNCj4gPiA+ID4gPiArCQkJYnJlYWs7DQo+ID4gPiA+ID4g
Kwl9DQo+ID4gPiA+ID4gKwkvKg0KPiA+ID4gPiA+ICsJICogVHJ5IHRvIGJyaW5nIHVwIGRpc3Bs
YXkgYmVmb3JlIGJhaWxpbmcgZnJvbSBHVA0KPiA+ID4gPiA+IHJlc3VtZSBmYWlsdXJlLA0KPiA+
ID4gPiA+ICsJICogc28gd2UgZG9uJ3QgbGVhdmUgdGhlIHVzZXIgY2x1ZWxlc3Mgd2l0aCBhIGJs
YW5rDQo+ID4gPiA+ID4gc2NyZWVuLg0KPiA+ID4gPiA+ICsJICovDQo+ID4gPiA+ID4gwqDCoMKg
CXhlX2Rpc3BsYXlfcG1fcnVudGltZV9yZXN1bWUoeGUpOw0KPiA+ID4gPiA+ICsJaWYgKGVycikN
Cj4gPiA+ID4gPiArCQlnb3RvIG91dDsNCj4gPiA+ID4gPiDCoMKgwqAJaWYgKHhlLT5kM2NvbGQu
YWxsb3dlZCkgew0KPiA+ID4gPiA+IMKgwqDCoAkJZXJyID0geGVfYm9fcmVzdG9yZV9sYXRlKHhl
KTsNCg==
