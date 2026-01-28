Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE55D46C08
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 22:25:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B50F10E129;
	Wed, 28 Jan 2026 22:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H/tRsBS2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF5710E129
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 22:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769639107; x=1801175107;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/lq6eKe0s+ch4gwMN0kQw7/LN1cc++QnryZynwO+zzo=;
 b=H/tRsBS2vMKY3LJk6CloKpq3Wa6YfsNl+9T2onibpWM3+eOAqjegR2fQ
 /XtnuGjgC3SYKkcHU8V42WUHWBj5KjJfSjbMK5zw3mME0w1l3s208Ep+M
 Vo3xixBdw2Mkl7mKeOPDjN8D/iTYkiGHCfDBbfY+PDuaHcZkxT27c5tiH
 9j/8rIGLdm7L4RfKA1t2fh05dMvbTqUfCYTI64f/3wMimNRuSJMGJTuzN
 3+Ri4g5GSwSy6M69Nf3SiAjtUHDMWLVVBqGN/fMq+QSb1w9JxAPI8+kQd
 aeoIoyMBeScT/MbSTy2m1jFohR3t6rvmyDWldWL9Z/1EDRZER7psuv2ui w==;
X-CSE-ConnectionGUID: dGtb+KALQr2aMOVo8zT9oQ==
X-CSE-MsgGUID: OvVk+DU9QsO6+hZ+MMQmVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70840013"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="70840013"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 14:25:06 -0800
X-CSE-ConnectionGUID: qiWuxnJtRMShp6YVU9RDAg==
X-CSE-MsgGUID: c9E+/L6HTpOcVFnnBc0K8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="208481246"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 14:25:06 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 14:25:05 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 14:25:05 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.19) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 14:25:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XK076XUA8d8snxEVYEMhQyDL5h48iu49Q9SGqABeJUrwyvldnh0KKlBdP0AFzjmhPMj6ZYGEf14kTTkYAx5XyGiSrKObPVnTR5GonS/dj7o/NB9mYCOY/cEHERmdxSqwg9HrRblc+zWVmD7V6XpLDTFlevSwh1OPoapTmgX3QqugbbmLPRXGzdVRiJ2tCHg56TWLb4221zxuDEMIb2+2/q0cfGNU+Fel/5lH3+I+23t1wpEelrb5NRGuERhVTCdF3GlHC5iQyAHAzAWNfkh7baDjYPXN8KjqDNk3ZTY8WUJCxmWKwCmfeI4S75M86t7OCDhkMHBVotwHLEM2qLdbuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/lq6eKe0s+ch4gwMN0kQw7/LN1cc++QnryZynwO+zzo=;
 b=cao+BDwzZIJ4FhYEsRar0szWxkBYA7YHR4i0gdlgMb3EQgo4Ltr25sntBkXj9xffm8SMmBfumD0th/TZCt/s4NsEZFYPytC+2THT9MUFzQe+ii9b9/Gpu1AjFmX6pumq7D71E7K+jSzO37It7eP04EQWbcgVe0W6m0t4o/7qplhsXpqS2c6xZzNOFhViKn0+pHiIKZWlA2/39qiMPU29nhG4l/LKuVQUQgyhSIyckrDv9CcuFSu0/gcXbFyP2m/i1mn7fW9Sz0zcdlXglKY7FMrEsY7RXwyZcKwYFtC6bRMB3TTRFQNePypg15iQe/8J6BJDgdw0bUWf/VrRXkAPxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by CYYPR11MB8360.namprd11.prod.outlook.com (2603:10b6:930:c3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 22:25:03 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 22:25:03 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Vijay, Anoop C" <anoop.c.vijay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Nilawar,
 Badal" <badal.nilawar@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>, "Ruhl, Michael J"
 <michael.j.ruhl@intel.com>, "Luse, Paul E" <paul.e.luse@intel.com>, "V,
 Mohamed Mansoor" <mohamed.mansoor.v@intel.com>, "Nasim, Kam"
 <kam.nasim@intel.com>, "Vijay, Anoop C" <anoop.c.vijay@intel.com>
Subject: RE: [PATCH v6 2/6] drm/xe/sysctrl: Add System Controller types and
 structures
Thread-Topic: [PATCH v6 2/6] drm/xe/sysctrl: Add System Controller types and
 structures
Thread-Index: AQHckC4tRu/fCuJ6Ck2yORrLtFU22LVoKNNA
Date: Wed, 28 Jan 2026 22:25:03 +0000
Message-ID: <DM4PR11MB54567ADA9436AC7380EFA6DEEA91A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260128081403.3138456-8-anoop.c.vijay@intel.com>
 <20260128081403.3138456-10-anoop.c.vijay@intel.com>
In-Reply-To: <20260128081403.3138456-10-anoop.c.vijay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|CYYPR11MB8360:EE_
x-ms-office365-filtering-correlation-id: 18b926a7-fc11-4f50-6d21-08de5ebc14fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?MGVubXZEdmN6UzlsL01xTENqYS85L3BJQWhVRjNlUzR1Q0lxZW5pZ0ZvdWJL?=
 =?utf-8?B?OGd6aGc4Nlo2LzlkUlJQOUh5Sy8rVmJEVGx2WWNVZHJuR3p1K1UvUlY0cENP?=
 =?utf-8?B?SkhKQkFzeVJIZk9SOHNmcUsrWW1yKzFtYWUrY0R6T1NPYWVSc0tUdHBwRzhr?=
 =?utf-8?B?KzRrcHQ5T3MwQ3BzM1dDYnY1TmdEalNQeVRGN0ZaNnJYYys5OFVoQVprMTAw?=
 =?utf-8?B?SEJsR3lQNzl0K2FiQ0tTbiszOGEvd3VnbUVHZjYxNXRQajVaUW1iU01SNkM5?=
 =?utf-8?B?SmVUcm1mT1crdVR2dThSU3hpUXZuZGpXZWpUZUloU0Nhc2NwcWxtZW5pY1VW?=
 =?utf-8?B?TE5TYzVEYm5FTTVVdi9sOTJDcE5VSnBoaHhuckVUQVBBSGZDNWgxaVAzNEpL?=
 =?utf-8?B?NzlrWlQyanhQUHRVVnBSbzRJdUQ3UDFLbFYwKzgybVhraGZIYjhzeVloRWQw?=
 =?utf-8?B?RUZVR0hxMW1OTGNXWkgySi9DaWw3TEtZeEtWY1dYdkQzR3cwdjdpWk9OQ3Bo?=
 =?utf-8?B?WFdBbXJmeWJLMGVlSkRrOFJoRE9lRHJldGxZQWJ4M29vbWo5TlBpYUljalY4?=
 =?utf-8?B?cTd5RjlRVnpxTUpkakQ5WUpGbzFGMWtzQkh2eXRmSGR6S0lYSlVseWdOM3lV?=
 =?utf-8?B?YStnVWdqQXR3TXZaNElUNStCOUw5eW0rNDI4U2tFVFNXMHlhcHNpajh4bmFR?=
 =?utf-8?B?d1BKMlBxS0tnanV3WXE0UHdEdXdkcy9Fd2R3REd0VWJIdEZTdjlYOGZLc2k0?=
 =?utf-8?B?eGFnWERxMXBoaEF0d0JUUlB6a0syRnRKS2lXeVdQNE0rZUcyOWxsU1hUTnRE?=
 =?utf-8?B?VXY0ckdzdFJPVmlJb1hkUWtROGxyK0tlVHo5Vk0yNy9JY3VLalJ4TjUxbndH?=
 =?utf-8?B?YmJDa2hSMStSZCtlWFdPSU00WjI1WHdnSzVIRG8yb1U4Tk94YVlwU2s3aHNS?=
 =?utf-8?B?ZGZsVkJxeFJ5VEZYY2pKRnRsVHFKWG5TWW4yaEV0QVVPT0FPZ2U1YzFIZDhx?=
 =?utf-8?B?R1ljWHN4QWxYNGZIckQwUUVYZm5pNXl5UE0zSHAwYk5XREJUdkZ1UkJXdE5u?=
 =?utf-8?B?ZmlzS1FRU21DMlptYk1aOTY3aDI1dDBLZGJxakdicTQ5R0poWThUM3VrSkhL?=
 =?utf-8?B?UTlxTDVQdk9OWmxnQmx6TE9aZ1djdGpsMDZBQmtjamhMbzBhODZwTHJsbDNr?=
 =?utf-8?B?aW54Qm9iVzlOclVUNCszVFZNN2QySEFNWjYwbDAwd3J5Rnh4ZnQ2bXJ2ZnBo?=
 =?utf-8?B?Qml2SmRlVXpGOTBKZWxLZzJpMk9rVmRlOHZLTDMvRmlOMEUvMjlESEhwNDQr?=
 =?utf-8?B?SGd0MGhpcGhIZEVvMTA1ZGRTNTIrcEt1YjF3Z3VDOGNvcS9VdDJudlU5Uk1Q?=
 =?utf-8?B?QnBTblhkZEVDVDd4cmp5VVE2OEcrd01nRVJtMG1RN0paNlREODlnSGxwRExV?=
 =?utf-8?B?MTdmZzlBdTVsdUpWWkJSQmZCYUhlSGowVWpJTVFEKy9FWHdDcFRNamRxZFcx?=
 =?utf-8?B?NHhYQkhMa3l3czU1UzlBWFhlY1g5NlgxbG82c1l2eFBlNFBZRlFBekdiVWNt?=
 =?utf-8?B?UEZiQ3U1ek1YN3Z1YjdPTDBhRzUwaTZVVmt3SHl6RUpURGZtdXEwbzVhNDda?=
 =?utf-8?B?K0lIdzFJUWFqVzZWN3VwaXRrV1JSTEZqMmwzeDAxUEYyQ3R4eHltMG9xa3Fv?=
 =?utf-8?B?TzlLa1BTRWhabzNOdFJyYlkxTE1jalBMNkpmZys0NDVpRDgwMjNnanAvYllM?=
 =?utf-8?B?cG9nYkMyVDMwNURqWStta00vY2FtVW5nMU1YOVFhNmR3bUhsYkNmVkJEb0k3?=
 =?utf-8?B?YzFwNmdsM2tPdkJRUWx0YkxycGIvVEhTU1dEMzl4d3NYV25GWDUxU0MxMG9v?=
 =?utf-8?B?dm1BMVRnVzIyYkJtbHVPYTZDL2JWd2RpNHRCTzBWTHpJMnVEZElMZnAwNFZt?=
 =?utf-8?B?STl0VFBHdUl1d0xPNFYvc21mR1lsdktUQityNllEMzQ2Wk9oZXRMbXRhUEVh?=
 =?utf-8?B?L2hadXROZVBaYmxDWitmekVZbVdsa3VXNzFxOXdldmxESG1rcFZKcjYwZnNl?=
 =?utf-8?B?WEFoakpuMVhwZ0paTTVweWJLMjBZNVI1WWpmdCtjb0hSOTJ2K01ZcjZ3Rk4r?=
 =?utf-8?B?d3hHam40VWowb3dwWXlnb3pJQTRReDhVMzltaTdKM0s3MnE1SlFOOHlPT2ds?=
 =?utf-8?Q?9/gzJ9x3/ostPvLO4fHB2/U=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U0VvcklQZEpleng1V1BjQjhSYTYrVXZCeUhXZEN6ZE1xTjlRU0xDeDNWTmxM?=
 =?utf-8?B?MTdqdUtBMzhVazJCUUJaZm1BbHNiSnZZeTNiR3VMZktQMVBrV2F6T1E4WnNO?=
 =?utf-8?B?VWpuc1RTNE1kaXZoeDB2MnRNRHV4VzRZa3UvRnB4VWhjaGZtSGhyNVQ0Y1Nl?=
 =?utf-8?B?YVA0Ylo3L1BIRGQxZ0dCb0VNdWhEaTRHcm1OVVFva1JIVmlmRUNsMnFhSzNK?=
 =?utf-8?B?UWU0SlhHYjFTVWpVRFdRL0R4akNIM1FMZGNNT0RPSlI5Q3NFbmJKeGZvSUhh?=
 =?utf-8?B?dTZOa3gvNmVSNWpDb2w5NmpEL09IWUZPQjIwNFlVdm9uV3dDUUx1SDc2R1ZN?=
 =?utf-8?B?REFESDF3TFBnMit3TUQ2VlNxR3dTc01yUHFrT2dzdGk5LzNZWUFNNTJDdGJM?=
 =?utf-8?B?TkZvMzBmUDhvZUpaVGlWOVA0UXJNcWdVeWMxdFJPVUFDUXZQbkZmbmdXWFlT?=
 =?utf-8?B?ZzJqaGUyT3Jld1JwUS9MNGkzeE8zZ2EweU9Rak5YZ1lnY05mRDBYU0ZSMndJ?=
 =?utf-8?B?dkcyN3Ayem9qUVBLenBzVzRuYXc2Uzk4dWV1VFc2OU5qNXVrU3laN2Nsc1Ju?=
 =?utf-8?B?NUJJcXlsRDFsajZzaHNNeVFiSGtOSkRRRTV0Z25vWU9MaDVrZk5DbEJoUUpD?=
 =?utf-8?B?VEk5eUlDeHJUdXF6UFZXaXBTR2VVbWkxNUxRU1UvQ2tDejdoMUZFTnpJTm5H?=
 =?utf-8?B?dzFBbjdHMnJsZlU3ZnhLd2FWWjNYeDZiQm40MVpFTUJiV2cxaGprWFpubGNp?=
 =?utf-8?B?bS9Ddm5YQytGdlZSMFMxUExEVC9lbkpMSFlkdFhrVytYczBGaGpnWEkzN1M2?=
 =?utf-8?B?L3YwVS9KYVJnaG9reGxHa2kxdmZITnNRT0FQUmZyVDBJSFRwOGpkRTN5WitQ?=
 =?utf-8?B?ZlpxeTREb3VMUmtraG5OMjhscXNWYkRHUVdNSTVUL3IvbVpNeEg5N0U5VWoz?=
 =?utf-8?B?WnA4cGg3b3YrMFRHa3llZ252K29yeGhKcjhUa0xtNE9aM2w4NUh1Mkh3eVpM?=
 =?utf-8?B?RHJEM25WWDc5SEgvWWliMTZ5K3dYblhZTitZWHA1RHhNWlppTUIwZENWOENw?=
 =?utf-8?B?emE1YTlqalV4L0tRQWNpM2x1cXRXKzZ3S0kzZTVBY0V1Qlk1aGg2NTRQdGtk?=
 =?utf-8?B?VkJ5U2JmU0prTTc3WjV5eGhrc3c3dnNaR1JENDQ4OUV6dFJET3BON2FqdC9j?=
 =?utf-8?B?NWZzMitBSmZETDFFM0VDNWNQOEF4NURMdU16eGsrNjRHS0pKYUxMUGF6Y0I4?=
 =?utf-8?B?MWMvYXV2YnFLeTJqdTF0cER5eDkrVHovUVk4Ymx4eE9pdVZPKzJYOFhPczlS?=
 =?utf-8?B?eDJMM0hNeFhRYlRZbkloTTUvOU0yZHJ2cW15ZWRaRllSRzhNYURHOTgzYXdm?=
 =?utf-8?B?WnNHc1M3djZyckZRQ21PMlV0TlA3L3B0d3RMdFlMcElYK2NJcjEyc09MM2do?=
 =?utf-8?B?K3RrMjI1SW9aMXNxN1F3T0pJQWkwcVREVW9BSmxjWmhTdk5ZOS81Qld6ekJN?=
 =?utf-8?B?dkhqWlBvN2pUaTFnRjI0Szc4cTl1elZibkI4WHg4c2xld3N4YTk0RU92Smc3?=
 =?utf-8?B?V2tNeHk4MG9PSEoyYXNVQ0ZGZnhyZ2ZUU29pQ3hLck5CaDRtMS9zeDFYaDdj?=
 =?utf-8?B?ekRpRjdJZ3gyY1pMa3g4T3RFa1hxMDdSTlprOUVmdW5lVmVTSExJVEh6N0dR?=
 =?utf-8?B?OS9Ra3N2RWt2dmJ5U0kycjBYelRQS3JyMTIvRCtES0NtaitUK2hjeXV4STk1?=
 =?utf-8?B?a2hMUGZtTklrUkdjSUQrVUl1YWRSbEFTYWF3TzF1SGRzc3Rnc1FRWGs2YWY0?=
 =?utf-8?B?MUVlZkllN3VXeUJlTzRtTU9SKzlIdXFxcUpna0FKdi9HemQ3cW5ueitOVUM3?=
 =?utf-8?B?am5FeVNWdWlVc2tGTDJUTEY3d3VRK2VTbnFtRWk4TGVEb2xwYTFodFdPQVdn?=
 =?utf-8?B?Um5mTm1yU0t3cGIwN1ZrY2VPVlBGejcyZ2hWZ1creXExa2x0R0EzeDliMGtp?=
 =?utf-8?B?NXFUMTlpd2VmZjh3Z0NhRUkydFJyNUJqQ1pWMmhmVHBpNlRBL05IYjRmRXRD?=
 =?utf-8?B?aS92eHZzd1FVYk9TVWJnSnhyZWR5NnVvSzIxYUd3UWZwblhMYnVuVzY4K0NJ?=
 =?utf-8?B?N1VrOXduR1NTOTFnK2Zjd0VlRFVkSkppb01iS2JaYXBnY0w0V3hEWXhPeWM2?=
 =?utf-8?B?K2VuYlF4OFJ3cmpKNVpWbVBIYytoSStnTmlTOHNreXZFNi9TRTJqUUN0ZzBj?=
 =?utf-8?B?SVBNOVRVRzlXeXZyb1VEVkJ0TVVHL3N6SFRWY2VaTjNpeUdpTFNOWlRMTHBT?=
 =?utf-8?B?YVJUbGUwYkxrNHVLMWZwVWl5MzFwUURuM21VWXZ2RitKbnROR091Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b926a7-fc11-4f50-6d21-08de5ebc14fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2026 22:25:03.1661 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qs1G+NQwnUbNjrWgvvh1zZl786ZQ+jwi7YyFsVWoFYoirBW3O2Uy5iNG67oabrY2w6jbYnXaPGjt6++0P02btA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8360
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

T24gV2VkLCBKYW4gMjgsIDIwMjYgMTI6MTQgQU0gQW5vb3AgVmlqYXkgd3JvdGU6DQo+IEZyb206
IEFub29wIFZpamF5IDxhbm9vcC5jLnZpamF5QGludGVsLmNvbT4NCj4gDQo+IEFkZCB0eXBlIGRl
ZmluaXRpb25zIGFuZCBoZWFkZXIgZGVjbGFyYXRpb25zIGZvciBTeXN0ZW0gQ29udHJvbGxlciBt
YWlsYm94DQo+IGNvbW11bmljYXRpb24gcHJvdG9jb2wuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBB
bm9vcCBWaWpheSA8YW5vb3AuYy52aWpheUBpbnRlbC5jb20+DQo+IC0tLQ0KPiB2NDogKE1hdHQs
IE1pa2UpDQo+IC0gQWRkIGRvbWFpbi1zcGVjaWZpYyBNTUlPIGFjY2Vzc29yDQo+IC0gQ2hhbmdl
IHBoYXNlX2JpdCB0eXBlIGZyb20gdTMyIHRvIGJvb2wNCj4gDQo+IHY2OiAoTWF0dCkNCj4gLSBB
ZGQgbWFpbGJveCBwcm90b2NvbCBjb25zdGFudHMNCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfc3lzY3RybF9tYWlsYm94LmggICAgICAgfCAzNSArKysrKysrKysrKysrKysrDQo+ICBk
cml2ZXJzL2dwdS9kcm0veGUveGVfc3lzY3RybF9tYWlsYm94X3R5cGVzLmggfCA0Mg0KPiArKysr
KysrKysrKysrKysrKysrDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfc3lzY3RybF90eXBlcy5o
ICAgICAgICAgfCAzMyArKysrKysrKysrKysrKysNCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTEwIGlu
c2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0veGUveGVf
c3lzY3RybF9tYWlsYm94LmgNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfc3lzY3RybF9tYWlsYm94X3R5cGVzLmgNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL2dwdS9kcm0veGUveGVfc3lzY3RybF90eXBlcy5oDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3N5c2N0cmxfbWFpbGJveC5oDQo+IGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3N5c2N0cmxfbWFpbGJveC5oDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4
IDAwMDAwMDAwMDAwMC4uMmI2NDE2NWM4ZTc2DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3N5c2N0cmxfbWFpbGJveC5oDQo+IEBAIC0wLDAgKzEsMzUgQEAN
Cj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQgKi8NCj4gKy8qDQo+ICsgKiBDb3B5
cmlnaHQgwqkgMjAyNiBJbnRlbCBDb3Jwb3JhdGlvbg0KPiArICovDQo+ICsNCj4gKyNpZm5kZWYg
X19YRV9TWVNDVFJMX01BSUxCT1hfSF9fDQo+ICsjZGVmaW5lIF9fWEVfU1lTQ1RSTF9NQUlMQk9Y
X0hfXw0KPiArDQo+ICsjaW5jbHVkZSA8bGludXgvYml0ZmllbGQuaD4NCj4gKyNpbmNsdWRlIDxs
aW51eC90eXBlcy5oPg0KPiArDQo+ICtzdHJ1Y3QgeGVfc3lzY3RybDsNCj4gK3N0cnVjdCB4ZV9k
ZXZpY2U7DQo+ICtzdHJ1Y3QgeGVfc3lzY3RybF9tYWlsYm94X2NvbW1hbmQ7DQo+ICsNCj4gKyNk
ZWZpbmUgQVBQX0hEUl9HUk9VUF9JRF9NQVNLCQkJR0VOTUFTSyg3LCAwKQ0KPiArI2RlZmluZSBB
UFBfSERSX0NPTU1BTkRfTUFTSwkJCUdFTk1BU0soMTUsIDgpDQo+ICsjZGVmaW5lIEFQUF9IRFJf
VkVSU0lPTl9NQVNLCQkJR0VOTUFTSygyMywgMTYpDQo+ICsjZGVmaW5lIEFQUF9IRFJfUkVTRVJW
RURfTUFTSwkJCUdFTk1BU0soMzEsIDI0KQ0KPiArDQo+ICsjZGVmaW5lIFhFX1NZU0NUUkxfQVBQ
X0hEUl9HUk9VUF9JRChoZHIpIFwNCj4gKwlGSUVMRF9HRVQoQVBQX0hEUl9HUk9VUF9JRF9NQVNL
LCBsZTMyX3RvX2NwdSgoaGRyKS0+ZGF0YSkpDQo+ICsNCj4gKyNkZWZpbmUgWEVfU1lTQ1RSTF9B
UFBfSERSX0NPTU1BTkQoaGRyKSBcDQo+ICsJRklFTERfR0VUKEFQUF9IRFJfQ09NTUFORF9NQVNL
LCBsZTMyX3RvX2NwdSgoaGRyKS0+ZGF0YSkpDQo+ICsNCj4gKyNkZWZpbmUgWEVfU1lTQ1RSTF9B
UFBfSERSX1ZFUlNJT04oaGRyKSBcDQo+ICsJRklFTERfR0VUKEFQUF9IRFJfVkVSU0lPTl9NQVNL
LCBsZTMyX3RvX2NwdSgoaGRyKS0+ZGF0YSkpDQo+ICsNCj4gK3ZvaWQgeGVfc3lzY3RybF9tYWls
Ym94X2luaXQoc3RydWN0IHhlX3N5c2N0cmwgKnNjKTsgaW50DQo+ICt4ZV9zeXNjdHJsX3NlbmRf
Y29tbWFuZChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwNCj4gKwkJCSAgICBzdHJ1Y3QgeGVfc3lzY3Ry
bF9tYWlsYm94X2NvbW1hbmQgKmNtZCwNCj4gKwkJCSAgICBzaXplX3QgKnJkYXRhX2xlbik7DQoN
CkkgZG9uJ3Qgc2VlIHRoaXMgZnVuY3Rpb24gaXMgY2FsbGVkIGluIHRoZSBzZXJpZXMuIE1heSBJ
IGtub3cgd2hlbiBhbmQgd2hlcmUgdGhpcyBmdW5jdGlvbiB3aWxsIGJlIHVzZWQ/DQpUaGFua3Mu
DQoNClNodWljaGVuZw0KDQo+ICsNCj4gKyNlbmRpZiAvKiBfX1hFX1NZU0NUUkxfTUFJTEJPWF9I
X18gKi8NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9zeXNjdHJsX21haWxi
b3hfdHlwZXMuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9zeXNjdHJsX21haWxib3hfdHlw
ZXMuaA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLmNlMTA5
MjRjNTg4MQ0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9z
eXNjdHJsX21haWxib3hfdHlwZXMuaA0KPiBAQCAtMCwwICsxLDQyIEBADQo+ICsvKiBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogTUlUICovDQo+ICsvKg0KPiArICogQ29weXJpZ2h0IMKpIDIwMjYg
SW50ZWwgQ29ycG9yYXRpb24NCj4gKyAqLw0KPiArDQo+ICsjaWZuZGVmIF9fWEVfU1lTQ1RSTF9N
QUlMQk9YX1RZUEVTX0hfXw0KPiArI2RlZmluZSBfX1hFX1NZU0NUUkxfTUFJTEJPWF9UWVBFU19I
X18NCj4gKw0KPiArI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+DQo+ICsNCj4gK3N0cnVjdCB4ZV9z
eXNjdHJsX21haWxib3hfbWtoaV9tc2dfaGRyIHsNCj4gKwlfX2xlMzIgZGF0YTsNCj4gK30gX19w
YWNrZWQ7DQo+ICsNCj4gK3N0cnVjdCB4ZV9zeXNjdHJsX21haWxib3hfYXBwX21zZ19oZHIgew0K
PiArCV9fbGUzMiBkYXRhOw0KPiArfSBfX3BhY2tlZDsNCj4gKw0KPiArc3RydWN0IHhlX3N5c2N0
cmxfbWFpbGJveF9jb21tYW5kIHsNCj4gKwkvKiogQGhlYWRlcjogQXBwbGljYXRpb24gbWVzc2Fn
ZSBoZWFkZXIgY29udGFpbmluZyBjb21tYW5kDQo+IGluZm9ybWF0aW9uICovDQo+ICsJc3RydWN0
IHhlX3N5c2N0cmxfbWFpbGJveF9hcHBfbXNnX2hkciBoZWFkZXI7DQo+ICsNCj4gKwkvKiogQGRh
dGFfaW46IFBvaW50ZXIgdG8gaW5wdXQgcGF5bG9hZCBkYXRhIChjYW4gYmUgTlVMTCBpZiBubyBp
bnB1dA0KPiBkYXRhKSAqLw0KPiArCXZvaWQgKmRhdGFfaW47DQo+ICsNCj4gKwkvKiogQGRhdGFf
aW5fbGVuOiBTaXplIG9mIGlucHV0IHBheWxvYWQgaW4gYnl0ZXMgKDAgaWYgbm8gaW5wdXQgZGF0
YSkgKi8NCj4gKwlzaXplX3QgZGF0YV9pbl9sZW47DQo+ICsNCj4gKwkvKiogQGRhdGFfb3V0OiBQ
b2ludGVyIHRvIG91dHB1dCBidWZmZXIgZm9yIHJlc3BvbnNlIGRhdGEgKGNhbiBiZQ0KPiBOVUxM
IGlmIG5vIHJlc3BvbnNlKSAqLw0KPiArCXZvaWQgKmRhdGFfb3V0Ow0KPiArDQo+ICsJLyoqIEBk
YXRhX291dF9sZW46IFNpemUgb2Ygb3V0cHV0IGJ1ZmZlciBpbiBieXRlcyAoMCBpZiBubyByZXNw
b25zZQ0KPiBleHBlY3RlZCkgKi8NCj4gKwlzaXplX3QgZGF0YV9vdXRfbGVuOw0KPiArfTsNCj4g
Kw0KPiArI2RlZmluZSBTWVNDVFJMX01CX0ZSQU1FX1NJWkUJCQkxNg0KPiArI2RlZmluZSBTWVND
VFJMX01CX01BWF9GUkFNRVMJCQk2NA0KPiArI2RlZmluZSBTWVNDVFJMX01CX01BWF9NRVNTQUdF
X1NJWkUNCj4gCShTWVNDVFJMX01CX0ZSQU1FX1NJWkUgKiBTWVNDVFJMX01CX01BWF9GUkFNRVMp
DQo+ICsNCj4gKyNkZWZpbmUgU1lTQ1RSTF9NQl9ERUZBVUxUX1RJTUVPVVRfTVMJCTUwMA0KPiAr
DQo+ICsjZW5kaWYgLyogX19YRV9TWVNDVFJMX01BSUxCT1hfVFlQRVNfSF9fICovDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfc3lzY3RybF90eXBlcy5oDQo+IGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3N5c2N0cmxfdHlwZXMuaA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0K
PiBpbmRleCAwMDAwMDAwMDAwMDAuLmQ0YTM2MjU2NDkyNQ0KPiAtLS0gL2Rldi9udWxsDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9zeXNjdHJsX3R5cGVzLmgNCj4gQEAgLTAsMCArMSwz
MyBAQA0KPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVCAqLw0KPiArLyoNCj4gKyAq
IENvcHlyaWdodCDCqSAyMDI2IEludGVsIENvcnBvcmF0aW9uDQo+ICsgKi8NCj4gKw0KPiArI2lm
bmRlZiBfWEVfU1lTQ1RSTF9UWVBFU19IXw0KPiArI2RlZmluZSBfWEVfU1lTQ1RSTF9UWVBFU19I
Xw0KPiArDQo+ICsjaW5jbHVkZSA8bGludXgvbXV0ZXguaD4NCj4gKyNpbmNsdWRlIDxsaW51eC90
eXBlcy5oPg0KPiArDQo+ICtzdHJ1Y3QgeGVfbW1pbzsNCj4gKw0KPiArLyoqDQo+ICsgKiBzdHJ1
Y3QgeGVfc3lzY3RybCAtIFN5c3RlbSBDb250cm9sbGVyIGRyaXZlciBjb250ZXh0ICAqLyBzdHJ1
Y3QNCj4gK3hlX3N5c2N0cmwgew0KPiArCS8qKiBAbW1pbzogTU1JTyByZWdpb24gZm9yIHN5c3Rl
bSBjb250cm9sIHJlZ2lzdGVycyAqLw0KPiArCXN0cnVjdCB4ZV9tbWlvICptbWlvOw0KPiArDQo+
ICsJLyoqIEBjbWRfbG9jazogTXV0ZXggcHJvdGVjdGluZyBtYWlsYm94IGNvbW1hbmQgb3BlcmF0
aW9ucyAqLw0KPiArCXN0cnVjdCBtdXRleCBjbWRfbG9jazsNCj4gKw0KPiArCS8qKg0KPiArCSAq
IEBwaGFzZV9iaXQ6IE1LSEkgbWVzc2FnZSBib3VuZGFyeSBwaGFzZSB0b2dnbGUgYml0DQo+ICsJ
ICoNCj4gKwkgKiBQaGFzZSBiaXQgYWx0ZXJuYXRlcyBiZXR3ZWVuIDAgYW5kIDEgZm9yIGNvbnNl
Y3V0aXZlDQo+ICsJICogbWVzc2FnZXMgdG8gaGVscCBkaXN0aW5ndWlzaCBtZXNzYWdlIGJvdW5k
YXJpZXMuDQo+ICsJICovDQo+ICsJYm9vbCBwaGFzZV9iaXQ7DQo+ICt9Ow0KPiArDQo+ICsjZW5k
aWYgLyogX1hFX1NZU0NUUkxfVFlQRVNfSF8gKi8NCj4gLS0NCj4gMi40My4wDQoNCg==
