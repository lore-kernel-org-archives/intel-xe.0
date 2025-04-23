Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB763C369D1
	for <intel-xe@archiver.kernel.org>; Wed, 23 Apr 2025 15:56:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B4910E6EA;
	Wed, 23 Apr 2025 15:56:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L/CotlUV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7384F10E6EA
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Apr 2025 15:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745423774; x=1776959774;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=nneiWUy9reQSiEYMC34USCkvjUhJsu94GbURNncXnds=;
 b=L/CotlUVRwuBCaR0hJ7c2gi8etFbgYCBmbX10/mKwYSkaxTZvkfrCirL
 fwoyKP7UZjA1+D5lznoylc9+cGPHkM45e46vNlW3eUexCYDFoOz2yfn1C
 IaZwOb33YtzKJ/O+Uq+2/kpugtuM2hH3PVcefpmdgC6na17U+PPh7Mhif
 GHHp3AA/AD2eTuiYJA6osNLO4rynwS6JoNca52dEFtrsNYNk+u1fDlzoY
 jFkvqeV7vGJ4l3ZNR9Zr5a93b5TwSaQ8hkP7/3jB5ir7mOQv9Elhhl9id
 CWFneXkF54G7qyxULp88x/W759X7DrllA3oX8CscODAG4zNIRRK8lmnLb Q==;
X-CSE-ConnectionGUID: H2aTcRZrRN2kvDEm5swtyg==
X-CSE-MsgGUID: R/ODUWbLRDynXrLNzuEAPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="46730701"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="46730701"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 08:56:13 -0700
X-CSE-ConnectionGUID: uyNi0uQcQeCJgX/zCCegxw==
X-CSE-MsgGUID: IbFe3sBhSmev4+QVKZvmWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="133243479"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 08:56:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 08:56:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 08:56:11 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 08:56:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q6Xm4ht678dEM3M7lwXBYi+bpnkKs1dXEyIu5puDIwqSHWoDMqrr4DBCiYEQkQeLO0JpaWjQKZf22nzmb50+QGNPXTFNoelbBzN1DhRt+TRDYZoH9gq6jVPMJfrJR4DAHl5EPnLDSN49VbuJ2cE3OtNNaacmvh4t1jy6B/wt6RgmL6Y98QL33RJSjxFp1NEjOpajsczgSWUCqZKrbaBWwHVEoa7P0pkkv9lopZn8DfYFuBvsTnmg2b+HgAh3IQV8hqOKJGoQozkEICuXOOvVfht+httGXceRTc6QIfXH6sLQxodgcO1PHKLwe6k2xr+bOnP/1tQv/LSQYw5s3WTK/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nneiWUy9reQSiEYMC34USCkvjUhJsu94GbURNncXnds=;
 b=SyTiOOTYd2MzFVbsQVSuO2lH/mSC/q4o1ho/G+2qHoUzVfzOx1vqY5BBxXFwc39jRF8SydHPHHP4dHAE8gOGf8Kzmkx2LnbhTgnbqsQA1flxANrRtozg9ywLe7OxB4zrazWk7VSjsTaG6j18CaQZeVOjqXdToN4iIdwayfUhi40OogauoCxjsZ0kHSAC8kA6LSA/Ka7MxJQepj3Vp9CMk0Sb+gByH2jYrL+3U10Mfjt5o+qfGvefDNoGMiue3oDhhleoHvu0bs1NyG81E/2z14RS+vNBMP0JU7eT4KEQi7Z0EXyXimeqOZUHvrSip5A3zOW6Zb9D22+5o+8RYdgMkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB8246.namprd11.prod.outlook.com (2603:10b6:208:445::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 15:55:28 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 15:55:27 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "Jadav, Raag" <raag.jadav@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nilawar, Badal" <badal.nilawar@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>
Subject: Re: [PATCH v3 2/3] drm/xe: Expose PCIe Gen4 downspeed attributes
Thread-Topic: [PATCH v3 2/3] drm/xe: Expose PCIe Gen4 downspeed attributes
Thread-Index: AQHbr4nXhHG33StpjkembsN1IKMzSLOwwS0AgAA4w4CAABPZgIAAEYKAgAAq2ACAABgHAIAADwOA
Date: Wed, 23 Apr 2025 15:55:27 +0000
Message-ID: <34b33d3135fc24302db2764ce86a641e7c49054f.camel@intel.com>
References: <20250417111233.2322000-1-raag.jadav@intel.com>
 <20250417111233.2322000-3-raag.jadav@intel.com>
 <02d74b93-563e-4fab-a330-f05cf1898ca5@intel.com>
 <aAipZ3pFfD_w7e2z@black.fi.intel.com>
 <05dc8b40-a37a-4fc6-a759-d1ddc0a6c56d@intel.com>
 <aAjIvZ0eqLBsI2Nt@black.fi.intel.com>
 <csahlwfbgaxsm7rf4g5i747wftr5zet7ta434jop5vr2he5lmw@baknat76wftw>
 <aAkA1swWzrROJbqv@black.fi.intel.com>
In-Reply-To: <aAkA1swWzrROJbqv@black.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR11MB8430:EE_|IA1PR11MB8246:EE_
x-ms-office365-filtering-correlation-id: cf647c6d-92cb-4646-77a8-08dd827f4474
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eWk5T1lERFQxRGViTUNPWHBqT2hDTTNueEJSbDF6YkNML1IzMVhTbHZrUFFW?=
 =?utf-8?B?S0hNaGp2ZkdVVjR1bXM5MzlnNU1jSzd2d3hleGx0VE8zWHY5YmNHc000VVRp?=
 =?utf-8?B?RkFkQWhuWGFkdjRKVXFJaHFpdzdmOForeCs1TS9EdGVQRTJBdHp5eUJPVENt?=
 =?utf-8?B?dm9mMUVCSjFKZis3R1JFMFdWWlNCNkhqQjY2b2FYOXBzYjdtUUxUS2dldUk2?=
 =?utf-8?B?WW9mZmtTdXNGd3VoSUszYzVjS3k1Y3lxWlhTSWpVZnc1N1VUMmx6eFlCS3I4?=
 =?utf-8?B?SVh5THpkTmsrblNuLzl5bjNjc3dYWUZ3RHBlbk1DZnAweFovZGpyWnloNU1Z?=
 =?utf-8?B?UFdETFZCNGxhcXVUVGZOUVRvR2REZmVXa0szS1RkMFMvUjFuQ1BjTzRGSDds?=
 =?utf-8?B?Y0dqQUM0TkY2V1QySU8zc1FET2JmT2hXVGVyQndYWnE2QW9BQWErVVhobE1L?=
 =?utf-8?B?a2ZFdi95TnNKN0hTTUdOb3NIalJmSEh3VXZ0VHpVc0tzekJUWkh6WGlwbVhs?=
 =?utf-8?B?cWg3K2lnUnlkVG12WG5ZUENvTjJ2ZXVJS1Q5NnpLb1Fnay9QSmYrUWJ6QW1h?=
 =?utf-8?B?UkFvZEROb3JCdW9wL2ZXNTlCeUhUVVZDTFprbnovQ0pJWmdkS1BlOFBBVUZr?=
 =?utf-8?B?a0kwMFc4S1hiWG1JQnRMVjRDaFdwcnROVktSOEFKYWI4SkFMbFNoWnFqWnR0?=
 =?utf-8?B?TUQxMUdKYlVGbUZGeVlDSzBlSHJVYmFlVE5hTkM4a0xOb3RSc3Nra2s0bVg3?=
 =?utf-8?B?ZTFybzN2dHpSdnpZZ0JIZk4zSG9tZ1RKbk1LRDlTZ1dlUE5xT3IyaWZZQk5R?=
 =?utf-8?B?NlUzbTVja296Z1Q0akdMaFdCNkJsWlUrU041TlMrcmJIazdGaE45VlBEaFdX?=
 =?utf-8?B?c2E4Z1FsdDBPeWVEQ05ldDJISUt3MXpqbkFmSWRERFcvVG5sb1VHdUtLWVBj?=
 =?utf-8?B?aG5SREsvMjN3Rk15Sjc5M3hNSlJ2c0NYcFpwSHM1WjZEODRtQzhWcUJjRDlH?=
 =?utf-8?B?LzlSVEdCdkJqT1d2VUZld1dFK1hZa09uYkU4cWJCRzFoOEFzMEdvbElkWXVv?=
 =?utf-8?B?d0xOUHNha1dYUWZNbFpMTk5DMXczQUdIT0NuQ3pDZmgrZUpzSnF4YVZjUlFa?=
 =?utf-8?B?dmZCeDMvQmFTTU5pQk9nS1A4WW1lMzl6WEdoR1dTQkkrZlk2WXl0QlVxSnVH?=
 =?utf-8?B?dWFIUEplZFc2R3ZDR3U5L1lVMDd1VWhuU3IrMVkyamhNUWIvV29OUW9aWGs1?=
 =?utf-8?B?dnJNSzRzNGRxMGdpejdnOUxwRHpTYnlkcXE4cy9nS2RUSitSMWFZd3BLOHVG?=
 =?utf-8?B?dXorVXNaTExGOHh6TU9aZ3hTdmdRMmpIbEZWMTAyRGpNK2owSFJmU1ZZOXlx?=
 =?utf-8?B?MVoxcmRIeGtGN0FTUXF4ZnRuZTZUUnhmK3JFRHVnUC8wQldpVCtRa2dvdW9I?=
 =?utf-8?B?cGVwbjE0RUg0YUdqZ3R6Z1ZYYnJhZkEzZHVqWXRNYndTMEdNSEIxS0R2NkpI?=
 =?utf-8?B?dDk2N3pha0dMaXY0Y202ZGRibGZRdU5Qb3RiZUZtbDJDSHJXYURscTdaME9q?=
 =?utf-8?B?TGl3cEtNaVJ1WFZqa3JnQSs3WEU1SW5aQkJYYWc2MG5SeHlod2IrQUkzaFBS?=
 =?utf-8?B?TnVSMFlpckJhUW5KTTlyRmNJNGU1T3huNzlEdHV4dlk5aDJiU05HODhFZVZR?=
 =?utf-8?B?czh5b01zeTVzcWt3aURZczBJcUl3U3dYTk1taUhrM29PUm9EY1VCMWEvYzlG?=
 =?utf-8?B?U0w1ZjBSbHA0MXBGbVVTNXFKOEtPd0pvTjQ0VExxdzJ3Sk5OOGtNM0gwOHhk?=
 =?utf-8?B?dlViUzgrbmt2MTVac3FWUHBRSERCbUpYMHRrbGpBVitRZFdzTHIweGY5Z2JQ?=
 =?utf-8?B?ZDAzZmd6U28vN0NpQXpHQ2JWZ2M5VC9SdWFtd3d1QXA4bUFaYURHZEpPemhq?=
 =?utf-8?B?YUxvaW5yQWpnVGVIYVg2cDVnM1c0NkNIaWpFcjRlYUdwTHo3cGwyOFluSFZM?=
 =?utf-8?Q?uvgaWvNwwHYha/g4hkVQX/5JPd5NL8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cE1rMTBURnRHMjZUcUs3N0dDdDhRU0NrQTdWOEE2a2h0R2lrdU5SaG1hZXhL?=
 =?utf-8?B?OXp0L2FxSWkxOWNIOThueUlRZm9kaU9kNXdvRTBUbHZYWUlWQUFFOEhUQWcw?=
 =?utf-8?B?azRERmY4OWZZRjZTR1dIcmludUxkQTF6cVRhdU8rWUNKL1hTWVJoeG9zWnI3?=
 =?utf-8?B?T1F2WVBscHFEWWpwV0lqRGdhREhrMkFrbkYzYi9XNE9XdmpVaEkrU3c3OGpZ?=
 =?utf-8?B?emRwek85a2lJK1cxbDFWVGo4MGZzRVIwK3JWNzBoRHBtY0ZsQVU3bjhRbkJo?=
 =?utf-8?B?VFBCMnRlOGU0TVo2ekNPcTlnVFY2K2hSSE5hdERKZThPSld4ZjFpbjhYSllD?=
 =?utf-8?B?SmhEZ2RCMklJOWhKek5TYUJnbzcrbjUyMmZqZU15KzhiRHFHeHlNa1p0VUgv?=
 =?utf-8?B?VWdGQldST0kxZ1VEUmNFNjFaYlFCd2Eya1FKQTcyWnUveGUzSGxFQXk1SURU?=
 =?utf-8?B?and0UE54V0JhVjlVRXlQUXBQZDExbkVrbDZTcHVRUGxjS3dVQ25nTnlYQzI5?=
 =?utf-8?B?RDZXYU1HN2JqcWRKT3RQaXg0MTlZYTduM2wxU2lsUkE0QWlDREZUck84OWtN?=
 =?utf-8?B?MTh3UnBGd3JlSmoxc1hrRXZRT0sxSGRxZTJtNmZsNk5Rb2MySndmQk45OVlx?=
 =?utf-8?B?WExoNXp0T2JDYjh0YlFRMnprWitUcVdwcnpBb2kxUjF4TFNBdXZuMThyWlho?=
 =?utf-8?B?eW1pWU9YYlQvRWVxRnVHZW9XN0pSdzRVbXQxWldQMHBGQ3Zmb3V0MnRhZXBr?=
 =?utf-8?B?azc0OXNzWXhDRUpSZmRrRkJZeDZRZ3U2YVJ3MVY5NzA1UEhzM3Z5dWdQSzM4?=
 =?utf-8?B?d1c2VHB1aGl2QjRIK2paK3JPNG95bU1DZDA3djNiYlRMZCtyUDRyN2lrQ0Q1?=
 =?utf-8?B?UCttUXI5ZnNPdkV2Zjd0aUxLd2haUG9kSkIxTnFTRkRBQlhFOFpZbG1OQVhp?=
 =?utf-8?B?eVROMWZMSm9PSEF2SC9KcmNseVBpaTlJSzF4QzU1TkxpZVIxUEl1Q0VHSDhp?=
 =?utf-8?B?L1UweDR2WXFlWEV2TTVEK3dkUVQ1VFRnMC95SDliSzU1NTdKVHFRRU5rMmZD?=
 =?utf-8?B?RllnRTZUNTRvVXJ5VGJnSmswaEhZSVJsT3orb01TVmNNNDVCSzJjcU01NnBu?=
 =?utf-8?B?NkZEay9GSWdPUGkyc3BSZDV2QUowSGI0MnR4YllmSzNFUi80TVZ1OTFlODRl?=
 =?utf-8?B?OC9MTnFYQlJVK0lXQjlaZ0R1Z05DVjd2bUZqaTVoVGM5RGRBZFRDL3ZSdVpk?=
 =?utf-8?B?OW9VY3FDQ00rMHdMNm8yNTFRSGtJNTlXK01GaWpKRDdBc1U3ZFVEeVVYSExF?=
 =?utf-8?B?YjNJNHVoTjdLaThnc0svZWcrM2VMU00vS1ZBbk90MmR3NWw2TjZXSzFwQzVW?=
 =?utf-8?B?SlVOajZoVTRMd1R5MEYxOGlyQmR0VDB2aVBMdUFTZ3lPVU5YeHVjMk5PY0NE?=
 =?utf-8?B?d3Q4bVBKeE1pNzNwNDhKUGJ4KzRabHVtTURQOGtBNnFLNXlUMFYvRDc4bEhV?=
 =?utf-8?B?ZCt2Rjk2a1J1SzQzTGtBTER6bm53UC9md1pnZlpuR2Q3bm1vcElldWFoMGlM?=
 =?utf-8?B?Y1lFRGo2SlBJL2IyaWNFRE9vZmJvODZ1S1NjUFBMMGd4M0djUVo1QjR2ZXBu?=
 =?utf-8?B?bDN4a1RIN0Q5UHNMd2QzM1JqZ1BPd0l4UzZjRnZVU3ZrZnJEd21EYW84K2s4?=
 =?utf-8?B?WTZXUGZmUDdKNFJ6VmVzdFpKTTlvblp1VTFCZ3hWd0tuNDh0RG45dmd2OFdJ?=
 =?utf-8?B?RG5mNkNrSTdhS05QZ1BZcVRtUzk4TndqcGV6TTdraU9LbEsvbDFjOGZCbTVS?=
 =?utf-8?B?T2RVM1lhTVZxME1zV0hKZUZ5azd3anQ1UDVqWHR0RjhDSERncVJya0RRdkJX?=
 =?utf-8?B?Zm1sN2tSdWV6TzIzY2I4RUU1QzU2YWhNRWErUW5sSThMYkpmYjZRWHA0VFdV?=
 =?utf-8?B?VGtkRXp4M1ZQaTYxWHBHcmRQTWErYnBJT21RdmJIVHpaSTlzN2crbkhnQ2Rp?=
 =?utf-8?B?NUhjakFZcE5QTEhCN1h5U01aanVxM25WbDhlS2NkeEp0eENxQzZmbWsvUEtu?=
 =?utf-8?B?aDN6WSt2QW9FbEE4dE9LU09wMlBrMk9jYkVtUnZqSFBoRFU0VGxFRzR2WVlQ?=
 =?utf-8?B?ZGFYSW9icXN4ZVAzQ29jZXRXTnhrcmZPQndjcHViV3RHSTE4Zk12THV6Vngv?=
 =?utf-8?B?NGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B6E2857E883CB94192B4C43540A8CD5E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf647c6d-92cb-4646-77a8-08dd827f4474
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2025 15:55:27.7298 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UAyMjJhTQ3IJF4Gm4tS/PwyPjW2g8CZr0+9tC5NR4wLE966TGKGj5zpk/qFDQ0v6GPkOkW/ALDl1er3gXVIrdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8246
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

T24gV2VkLCAyMDI1LTA0LTIzIGF0IDE4OjAxICswMzAwLCBSYWFnIEphZGF2IHdyb3RlOg0KPiBP
biBXZWQsIEFwciAyMywgMjAyNSBhdCAwODozNTo0MkFNIC0wNTAwLCBMdWNhcyBEZSBNYXJjaGkg
d3JvdGU6DQo+ID4gT24gV2VkLCBBcHIgMjMsIDIwMjUgYXQgMDI6MDI6MjFQTSArMDMwMCwgUmFh
ZyBKYWRhdiB3cm90ZToNCj4gPiA+IE9uIFdlZCwgQXByIDIzLCAyMDI1IGF0IDAzOjI5OjQxUE0g
KzA1MzAsIFJpYW5hIFRhdXJvIHdyb3RlOg0KPiA+ID4gPiBPbiA0LzIzLzIwMjUgMjoxOCBQTSwg
UmFhZyBKYWRhdiB3cm90ZToNCj4gPiA+ID4gPiBPbiBXZWQsIEFwciAyMywgMjAyNSBhdCAxMDo1
NTozMEFNICswNTMwLCBSaWFuYSBUYXVybyB3cm90ZToNCj4gPiA+ID4gPiA+IEhpIFJhYWcNCj4g
PiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gT24gNC8xNy8yMDI1IDQ6NDIgUE0sIFJhYWcgSmFkYXYg
d3JvdGU6DQo+ID4gPiA+ID4gPiA+IEV4cG9zZSBzeXNmcyBhdHRyaWJ1dGVzIGZvciBQQ0llIEdl
bjQgZG93bnNwZWVkDQo+ID4gPiA+ID4gPiA+IGNhcGFiaWxpdHkgYW5kIHN0YXR1cy4NCj4gPiA+
ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IHYyOiBNb3ZlIGZyb20gZGVidWdmcyB0byBzeXNmcyAo
THVjYXMsIFJvZHJpZ28sIEJhZGFsKQ0KPiA+ID4gPiA+ID4gPiDCoMKgwqDCoMKgIFJld29yayBt
YWNyb3MgYW5kIHRoZWlyIG5hbWluZyAoUm9kcmlnbykNCj4gPiA+ID4gPiA+ID4gdjM6IFVzZSBz
eXNmc19jcmVhdGVfZmlsZXMoKSAoUmlhbmEpDQo+ID4gPiA+ID4gPiA+IMKgwqDCoMKgwqAgRml4
IGNoZWNrcGF0Y2ggd2FybmluZyAoUmlhbmEpDQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBSYWFnIEphZGF2IDxyYWFnLmphZGF2QGludGVsLmNvbT4NCj4gPiA+
ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gPiA+IMKgwqAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Rl
dmljZS5jwqDCoMKgwqDCoMKgIHzCoMKgIDUgKysNCj4gPiA+ID4gPiA+ID4gwqDCoCBkcml2ZXJz
L2dwdS9kcm0veGUveGVfZGV2aWNlX3N5c2ZzLmMgfCAxMDENCj4gPiA+ID4gPiA+ID4gKysrKysr
KysrKysrKysrKysrKysrKysrKysrDQo+ID4gPiA+ID4gPiA+IMKgwqAgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2RldmljZV9zeXNmcy5oIHzCoMKgIDEgKw0KPiA+ID4gPiA+ID4gPiDCoMKgIGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9wY29kZV9hcGkuaMKgwqDCoCB8wqDCoCA1ICsrDQo+ID4gPiA+ID4g
PiA+IMKgwqAgNCBmaWxlcyBjaGFuZ2VkLCAxMTIgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPiA+ID4g
PiANCj4gPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZp
Y2UuYw0KPiA+ID4gPiA+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYw0KPiA+
ID4gPiA+ID4gPiBpbmRleCA2YzlkMzAwOWFhMDMuLjc5YjdiMGVjZmJhZSAxMDA2NDQNCj4gPiA+
ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+ID4gPiA+ID4g
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYw0KPiA+ID4gPiA+ID4gPiBA
QCAtMjYsNiArMjYsNyBAQA0KPiA+ID4gPiA+ID4gPiDCoMKgICNpbmNsdWRlICJ4ZV9ib19ldmlj
dC5oIg0KPiA+ID4gPiA+ID4gPiDCoMKgICNpbmNsdWRlICJ4ZV9kZWJ1Z2ZzLmgiDQo+ID4gPiA+
ID4gPiA+IMKgwqAgI2luY2x1ZGUgInhlX2RldmNvcmVkdW1wLmgiDQo+ID4gPiA+ID4gPiA+ICsj
aW5jbHVkZSAieGVfZGV2aWNlX3N5c2ZzLmgiDQo+ID4gPiA+ID4gPiA+IMKgwqAgI2luY2x1ZGUg
InhlX2RtYV9idWYuaCINCj4gPiA+ID4gPiA+ID4gwqDCoCAjaW5jbHVkZSAieGVfZHJtX2NsaWVu
dC5oIg0KPiA+ID4gPiA+ID4gPiDCoMKgICNpbmNsdWRlICJ4ZV9kcnYuaCINCj4gPiA+ID4gPiA+
ID4gQEAgLTkxNiw2ICs5MTcsMTAgQEAgaW50IHhlX2RldmljZV9wcm9iZShzdHJ1Y3QgeGVfZGV2
aWNlDQo+ID4gPiA+ID4gPiA+ICp4ZSkNCj4gPiA+ID4gPiA+ID4gwqDCoMKgCWlmIChlcnIpDQo+
ID4gPiA+ID4gPiA+IMKgwqDCoAkJZ290byBlcnJfdW5yZWdpc3Rlcl9kaXNwbGF5Ow0KPiA+ID4g
PiA+ID4gPiArCWVyciA9IHhlX2RldmljZV9zeXNmc19pbml0KHhlKTsNCj4gPiA+ID4gPiA+ID4g
KwlpZiAoZXJyKQ0KPiA+ID4gPiA+ID4gPiArCQlnb3RvIGVycl91bnJlZ2lzdGVyX2Rpc3BsYXk7
DQo+ID4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ID4gwqDCoMKgCXhlX2RlYnVnZnNfcmVnaXN0
ZXIoeGUpOw0KPiA+ID4gPiA+ID4gPiDCoMKgwqAJZXJyID0geGVfaHdtb25fcmVnaXN0ZXIoeGUp
Ow0KPiA+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Rldmlj
ZV9zeXNmcy5jDQo+ID4gPiA+ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV9z
eXNmcy5jDQo+ID4gPiA+ID4gPiA+IGluZGV4IDJkMjVlNWI1ZDRiZi4uOTIzNjEyYTBhMmUwIDEw
MDY0NA0KPiA+ID4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3N5
c2ZzLmMNCj4gPiA+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV9z
eXNmcy5jDQo+ID4gPiA+ID4gPiA+IEBAIC0xMSw2ICsxMSw5IEBADQo+ID4gPiA+ID4gPiA+IMKg
wqAgI2luY2x1ZGUgInhlX2RldmljZS5oIg0KPiA+ID4gPiA+ID4gPiDCoMKgICNpbmNsdWRlICJ4
ZV9kZXZpY2Vfc3lzZnMuaCINCj4gPiA+ID4gPiA+ID4gKyNpbmNsdWRlICJ4ZV9tbWlvLmgiDQo+
ID4gPiA+ID4gPiA+ICsjaW5jbHVkZSAieGVfcGNvZGVfYXBpLmgiDQo+ID4gPiA+ID4gPiA+ICsj
aW5jbHVkZSAieGVfcGNvZGUuaCINCj4gPiA+ID4gPiA+ID4gwqDCoCAjaW5jbHVkZSAieGVfcG0u
aCINCj4gPiA+ID4gPiA+ID4gwqDCoCAvKioNCj4gPiA+ID4gPiA+ID4gQEAgLTgxLDMgKzg0LDEw
MSBAQCBpbnQgeGVfcG1fc3lzZnNfaW5pdChzdHJ1Y3QgeGVfZGV2aWNlDQo+ID4gPiA+ID4gPiA+
ICp4ZSkNCj4gPiA+ID4gPiA+ID4gwqDCoMKgCXJldHVybiBkZXZtX2FkZF9hY3Rpb25fb3JfcmVz
ZXQoZGV2LA0KPiA+ID4gPiA+ID4gPiB4ZV9wbV9zeXNmc19maW5pLCB4ZSk7DQo+ID4gPiA+ID4g
PiA+IMKgwqAgfQ0KPiA+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiA+ICsvKioNCj4gPiA+ID4g
PiA+ID4gKyAqIERPQzogUENJZSBHZW41IFVwZGF0ZSBMaW1pdGF0aW9ucw0KPiA+ID4gPiA+ID4g
PiArICoNCj4gPiA+ID4gPiA+ID4gKyAqIERlZmF1bHQgbGluayBzcGVlZCBvZiBkaXNjcmV0ZSBH
UFVzIGlzIGRldGVybWluZWQgYnkNCj4gPiA+ID4gPiA+ID4gY29uZmlndXJhdGlvbg0KPiA+ID4g
PiA+ID4gPiArICogcGFyYW1ldGVycyBzdG9yZWQgaW4gdGhlaXIgZmxhc2ggbWVtb3J5LCB3aGlj
aCBhcmUNCj4gPiA+ID4gPiA+ID4gc3ViamVjdCB0byBvdmVycmlkZQ0KPiA+ID4gPiA+ID4gPiAr
ICogdGhyb3VnaCB1c2VyIGluaXRpYXRlZCBmaXJtd2FyZSB1cGRhdGVzLiBJdCBoYXMgYmVlbg0K
PiA+ID4gPiA+ID4gPiBvYnNlcnZlZCB0aGF0IGRldmljZXMNCj4gPiA+ID4gPiA+ID4gKyAqIGNv
bmZpZ3VyZWQgd2l0aCBQQ0llIEdlbjUgYXMgdGhlaXIgZGVmYXVsdCBzcGVlZCBjYW4NCj4gPiA+
ID4gPiA+ID4gY29tZSBhY3Jvc3MgbGluaw0KPiA+ID4gPiA+ID4gPiArICogcXVhbGl0eSBpc3N1
ZXMgZHVlIHRvIGhvc3Qgb3IgbW90aGVyYm9hcmQgbGltaXRhdGlvbnMNCj4gPiA+ID4gPiA+ID4g
YW5kIG1heSBoYXZlIHRvDQo+ID4gPiA+ID4gPiA+ICsgKiBhdXRvLWRvd25zcGVlZCB0byBQQ0ll
IEdlbjQgd2hlbiBmYWNlZCB3aXRoIHVuc3RhYmxlDQo+ID4gPiA+ID4gPiA+IGxpbmsgYXQgR2Vu
NSwgd2hpY2gNCj4gPiA+ID4gPiA+ID4gKyAqIG1ha2VzIGZpcm13YXJlIHVwZGF0ZXMgcmF0aGVy
IHJpc2t5IG9uIHN1Y2ggc2V0dXBzLg0KPiA+ID4gPiA+ID4gPiBJdCBpcyByZXF1aXJlZCB0bw0K
PiA+ID4gPiA+ID4gPiArICogZW5zdXJlIHRoYXQgdGhlIGRldmljZSBpcyBjYXBhYmxlIG9mIGF1
dG8tDQo+ID4gPiA+ID4gPiA+IGRvd25zcGVlZGluZyB0byBQQ0llIEdlbjQgbGluaw0KPiA+ID4g
PiA+ID4gPiArICogYmVmb3JlIHB1c2hpbmcgdGhlIGltYWdlIHdpdGggUENJZSBHZW41IGFzIGRl
ZmF1bHQNCj4gPiA+ID4gPiA+ID4gY29uZmlndXJhdGlvbi4gVGhpcw0KPiA+ID4gPiA+ID4gPiAr
ICogY2FuIGJlIGRvbmUgYnkgcmVhZGluZw0KPiA+ID4gPiA+ID4gPiBgYHBjaWVfZ2VuNF9kb3du
c3BlZWRfY2FwYWJsZWBgIHN5c2ZzIGVudHJ5LCB3aGljaA0KPiA+ID4gPiA+ID4gPiArICogd2ls
bCBkZW5vdGUgUENJZSBHZW40IGRvd25zcGVlZCBjYXBhYmlsaXR5IG9mIHRoZQ0KPiA+ID4gPiA+
ID4gPiBkZXZpY2Ugd2l0aCBib29sZWFuIG91dHB1dA0KPiA+ID4gPiA+ID4gPiArICogdmFsdWUg
b2YgYGAwYGAgb3IgYGAxYGAsIG1lYW5pbmcgYGluY2FwYWJsZWAgb3INCj4gPiA+ID4gPiA+ID4g
YGNhcGFibGVgIHJlc3BlY3RpdmVseS4NCj4gPiA+ID4gPiA+ID4gKyAqDQo+ID4gPiA+ID4gPiA+
ICsgKiAuLiBjb2RlLWJsb2NrOjogc2hlbGwNCj4gPiA+ID4gPiA+ID4gKyAqDQo+ID4gPiA+ID4g
PiA+ICsgKsKgwqDCoCAkIGNhdA0KPiA+ID4gPiA+ID4gPiAvc3lzL2J1cy9wY2kvZGV2aWNlcy88
YmRmPi9wY2llX2dlbjRfZG93bnNwZWVkX2NhcGFibGUNCj4gPiA+ID4gPiA+ID4gKyAqDQo+ID4g
PiA+ID4gPiA+ICsgKiBQdXNoaW5nIFBDSWUgR2VuNSB1cGRhdGUgb24gYSBkb3duc3BlZWQgaW5j
YXBhYmxlDQo+ID4gPiA+ID4gPiA+IGRldmljZSBhbmQgZmFjaW5nIGxpbmsNCj4gPiA+ID4gPiA+
ID4gKyAqIGluc3RhYmlsaXR5IGR1ZSB0byBob3N0IG9yIG1vdGhlcmJvYXJkIGxpbWl0YXRpb25z
DQo+ID4gPiA+ID4gPiA+IGNhbiByZXN1bHQgaW4gZHJpdmVyDQo+ID4gPiA+ID4gPiA+ICsgKiBm
YWlsaW5nIHRvIGJpbmQgdG8gdGhlIGRldmljZSwgbWFraW5nIGZ1cnRoZXINCj4gPiA+ID4gPiA+
ID4gZmlybXdhcmUgdXBkYXRlcyBpbXBvc3NpYmxlDQo+ID4gPiA+ID4gPiA+ICsgKiB3aXRoIFJN
QSBiZWluZyB0aGUgb25seSBsYXN0IHJlc29ydC4NCj4gPiA+ID4gPiA+ID4gKyAqDQo+ID4gPiA+
ID4gPiA+ICsgKiBQQ0llIEdlbjQgZG93bnNwZWVkIHN0YXR1cyBvZiBkb3duc3BlZWQgY2FwYWJs
ZQ0KPiA+ID4gPiA+ID4gPiBkZXZpY2VzIGlzIGF2YWlsYWJsZSB0aHJvdWdoDQo+ID4gPiA+ID4g
PiA+ICsgKiBgYHBjaWVfZ2VuNF9kb3duc3BlZWRfc3RhdHVzYGAgc3lzZnMgZW50cnkgd2l0aA0K
PiA+ID4gPiA+ID4gPiBib29sZWFuIG91dHB1dCB2YWx1ZSBvZg0KPiA+ID4gPiA+ID4gPiArICog
YGAwYGAgb3IgYGAxYGAsIHdoZXJlIGBgMGBgIG1lYW5zIG5vIGF1dG8tDQo+ID4gPiA+ID4gPiA+
IGRvd25zcGVlZGluZyB3YXMgcmVxdWlyZWQgZHVyaW5nDQo+ID4gPiA+ID4gPiA+ICsgKiBsaW5r
IHRyYWluaW5nICh3aGljaCBpcyB0aGUgb3B0aW1hbCBzY2VuYXJpbykgYW5kDQo+ID4gPiA+ID4g
PiA+IGBgMWBgIG1lYW5zIHRoZSBkZXZpY2UNCj4gPiA+ID4gPiA+ID4gKyAqIGhhcyBhdXRvLWRv
d25zcGVkIHRvIFBDSWUgR2VuNCBkdWUgdG8gdW5zdGFibGUgR2VuNQ0KPiA+ID4gPiA+ID4gPiBs
aW5rLg0KPiA+ID4gPiA+ID4gPiArICoNCj4gPiA+ID4gPiA+ID4gKyAqIC4uIGNvZGUtYmxvY2s6
OiBzaGVsbA0KPiA+ID4gPiA+ID4gPiArICoNCj4gPiA+ID4gPiA+ID4gKyAqwqDCoMKgICQgY2F0
DQo+ID4gPiA+ID4gPiA+IC9zeXMvYnVzL3BjaS9kZXZpY2VzLzxiZGY+L3BjaWVfZ2VuNF9kb3du
c3BlZWRfc3RhdHVzDQo+ID4gPiA+ID4gPiBUaGUgY29kZSBsb29rcyBnb29kLiBCdXQgaSBhbSBu
b3Qgc3VyZSBvZiB0aGUgd29yZA0KPiA+ID4gPiA+ID4gZG93bnNwZWVkLg0KPiA+ID4gPiA+ID4g
Q291bGRuJ3QgZmluZCBkb3duc3BlZWQgdXNlZCBpbiBQY2llIGdlbmVyYXRpb24gY29udGV4dC4N
Cj4gPiA+ID4gPiA+IEZvciBsaW5rLA0KPiA+ID4gPiA+ID4gaXQgaXMgbWVudGlvbmVkIGFzwqAg
J2xpbmsgZG93bmdyYWRlJw0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBDb3VsZCB5b3Ugc2hh
cmUgaWYgeW91IGZvdW5kIGFueT8NCj4gPiANCj4gPiBJJ20gd2l0aCBSaWFuYSBoZXJlIGFuZCBh
bHNvIGZvdW5kIGl0IHN0cmFuZ2UuIFVzZXIgaXMgY2F0J2luZyBhDQo+ID4gZmlsZQ0KPiA+IGlu
c2lkZcKgIC9zeXMvYnVzL3BjaS9kZXZpY2VzLzxiZGY+LyAtIGl0J3Mgb2RkIHRvIHVzZSBkb3du
c3BlZWQNCj4gPiB3aGVuDQo+ID4gdGhhdCB3b3JkIGlzIG5vdCB1c2VkIGluIFBDSWUgc3BlYyBh
bmQuLi4NCj4gPiANCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBTaW5jZSB3ZSdyZSBkZXNjcmliaW5n
IGJvdGggZmlybXdhcmUgYW5kIFBDSSBsaW5rIGluIHRoZSBzYW1lDQo+ID4gPiA+ID4gZG9jdW1l
bnQsDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gMS4gSXQgaGVscHMgZGlzdGluZ3Vpc2ggYmV0d2Vl
biB0aGVtLg0KPiA+IA0KPiA+IEkgYWxzbyBkb24ndCB1bmRlcnN0YW5kIHRoZSBkaXN0aW5jdGlv
biB5b3UgYXJlIHRyeWluZyB0byBtYWtlLiBUaGUNCj4gPiBmaXJtd2FyZSBpcyB0aGVyZSwgbW9u
aXRvcmluZyB0aGUgY29tbXVuaWNhdGlvbiBhbmQgYW5kIGlzIGNhcGFibGUNCj4gPiB0bw0KPiA+
IGF1dG8gZG93bmdyYWRlIHRoZSBsaW5rIHRvIGdlbjQgaWYgaXQgbmVlZHMgdG8uIEkgaW1hZ2lu
ZSB0aGF0IGlmDQo+ID4gdGhpcw0KPiA+IHNpdHVhdGlvbiBoYXBwZW5zLCB0aGUgbGluayBzcGVl
ZCBpcyByZS1uZWdvdGlhdGVkIGFuZCB3ZSB3aWxsIGVuZA0KPiA+IHVwDQo+ID4gc2VlaW5nIHRo
ZSBuZXcgb25lIG9uIExua1N0YS4uLiBMbmtDYXAgc3RpbGwgc2hvd3Mgd2hhdCBpcw0KPiA+IHBv
c3NpYmxlLiBUaGUNCj4gPiBvbmx5IGRpZmZlcmVuY2UgSSBzZWUgaGVyZSBmcm9tICJJJ20gY29u
bmVjdGluZyBhIGdlbjUgY2FwYWJsZQ0KPiA+IGRldmljZSBvbg0KPiA+IGEgbWF4IGdlbjQgc2xv
dCIgaXMgdGhhdCBpbml0aWFsbHkgdGhlIGdlbjUgaXMgYXR0ZW1wdGVkIChzaW5jZQ0KPiA+IGJv
dGggdGhlDQo+ID4gaG9zdCBhbmQgZGV2aWNlIHJlcG9ydCB0aGV5IHN1cHBvcnQgaXQpLCBidXQg
dGhlIGZpcm13YXJlIG1heSBtYWtlDQo+ID4gYSBkZWNpc2lvbg0KPiA+IGluIHJ1bnRpbWUgdG8g
ImRvd25ncmFkZSB0aGUgbGluayBzcGVlZCIuDQo+IA0KPiBBbmQgYWxsIG9mIHRoaXMgd2lsbCB0
YWtlIHBsYWNlIHdoZW4gdGhlIHVzZXIgaXMgZG9pbmcgYSAiZmlybXdhcmUNCj4gdXBncmFkZSIs
DQo+IGFuZCB0aGlzIGNhbiBwb3RlbnRpYWxseSBvcGVuIHRoZSBkb29yIGZvciAibGluayBzcGVl
ZCBkb3duZ3JhZGUiIHRvDQo+IGJlDQo+IGNvbmZ1c2VkIHdpdGggImZpcm13YXJlIHJvbGxiYWNr
IChkb3duZ3JhZGUpIGRvbmUgZm9yIHRoZSBsaW5rDQo+IHNwZWVkIiwNCj4gd2hpY2ggaXMgbm90
IHRoZSBjYXNlLg0KDQp3ZWxsLCBnZW40IGlzIG5vdCBhIGZpcm13YXJlLCBidXQgYWxzbw0KDQpp
cyBnZW40X2Rvd25zcGVlZCA9PSBnZW4zID8hDQoNCnllcywgbmFtaW5nIGlzIGhhcmQgYW5kIHRo
aXMgaXMgd2h5IHdlIHN0aWNrIHdpdGggdGhlIHNwZWMgbmFtZXMNCndpdGhvdXQgcmUtaW52ZW50
aW5nIGl0LCB3aGljaCBvbmx5IGluY3JlYXNlcyB0aGUgY29uZnVzaW9uLg0KDQo+IA0KPiA+ID4g
PiA+IDIuIFRoaXMgaW5mb3JtYXRpb24gaXMgZm9yIHRoZSBlbmQgdXNlciBhbmQgaGFzIHRvIGJl
DQo+ID4gPiA+ID4gdHJhbnNsYXRhYmxlIGVub3VnaA0KPiA+ID4gPiA+IMKgwqDCoCByZWdhcmRs
ZXNzIG9mIHdoYXQgc3BlYyBzYXlzIGFib3V0IGl0IGFuZCB0aGUgZGlzdGluY3Rpb24NCj4gPiA+
ID4gPiByZWR1Y2VzIHRoZQ0KPiA+ID4gPiA+IMKgwqDCoCBjaGFuY2VzIG9mIG1pc2ludGVycHJl
dGF0aW9uLg0KPiA+IA0KPiA+IHdoZW4geW91IGludHJvZHVjZSBhIG5ldyB0ZXJtIHRoYXQgaXMg
bm90IGtub3duLCBJJ2Qgc2F5IHRoZSBlZmZlY3QNCj4gPiBpcw0KPiA+IHByZXR0eSBtdWNoIHRo
ZSBvcHBvc2l0ZSBhbmQgaXQgY2FuIGJlIGV2ZW4gd29yc2UgaWYgYSBmdXR1cmUgcGNpZQ0KPiA+
IHNwZWMNCj4gPiBzdGFydHMgdG8gdXNlIHRoYXQgdGVybS4NCj4gDQo+IEFncmVlLCB1bmxlc3Mg
d2UncmUgZXhwZWN0aW5nIHVzZXJzIHRvIGJlIGluZm9ybWVkIGFib3V0IHRoZSBzcGVjIHRvDQo+
IGJlDQo+IGFibGUgdG8gZmxhc2ggdGhlaXIgZmlybXdhcmVzLiBCdXQgaWYgeW91IGluc2lzdCwg
c3VyZSB3aWxsIF91cGdyYWRlXw0KPiB0aGUNCj4gZG9jdW1lbnQgOykNCg0KSSBiZWxpZXZlIHlv
dSBtZWFudCAndXBkYXRlJyB0aGUgZG9jdW1lbnQhIDspDQoNClBsZWFzZSBrZWVwICdkb3duZ3Jh
ZGUnLg0KDQo+IA0KPiBSYWFnDQoNCg==
