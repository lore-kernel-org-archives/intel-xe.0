Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6943C25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 14:48:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291AB10E053;
	Tue, 21 May 2024 14:48:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kk0/KCiq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B9610E053
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 14:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716302889; x=1747838889;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=MCCGu6jvpYSoLY23iP1tazjwCV+MpCFzq8pWlXvenA0=;
 b=Kk0/KCiqpoG3Fu7IRHOO/tG3StoF7/yjnue1YiZnaS17wc3oVCDSay9x
 ZuDuyNzvgduk6XOWTa06tHHKIwRUmIRSTJED3iMxIN/kTPCQ67VcxH71D
 wmEfZ4uQmNZwIELCOnVDYyJ6dcRYEG6KpwijvsTLA5jaGRyXydUY0dLCL
 e11fRUggpuvzWcgLVMPrhfrbdNgIdjPW/Lalli6qcaCC4Tqc8B61SPwmk
 dJaAtGfEiAwsfEL+lLTT22xstdsNX43Zn8jYBUryuipSrFJLlqNI7C6hA
 XqlXcResJbwtsl+iPdcH8i0Cw7NQWCv1ynUt7PQtMtbeup4i41qK5iMkI w==;
X-CSE-ConnectionGUID: /NBN86gsQZShd6jPRCc5UA==
X-CSE-MsgGUID: oslqVGXLTryboTTLxtwPNg==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12348985"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="12348985"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 07:48:01 -0700
X-CSE-ConnectionGUID: FkA+i2w1SOGc8azAhxJhHg==
X-CSE-MsgGUID: ivy043vLQ42aBazoAnJrJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="37446942"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 May 2024 07:48:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 07:48:00 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 21 May 2024 07:48:00 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 07:48:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EKxCGDtK8HXaZP62Z7jxu7FzQWlPQZOBSf13mo0WZlV7x3SyUCyQ8t/LVl2Q7pQVq4Y/Ql1sQaM6vSATftKY9J2FWM/BanSPvvVBUULWsgDFr6hCY7sChxlePSOu+G0Z2IhufPKxZjCVufDgKz9EtxjKBLMSiS83TYW+l6cWhjFkxyZxQ8IhL0GkpwPj+blTiVinbysbzc367kfFPHGDg9rogCXS4VGzkVpjl19dOMCJD0b4aaC57Rd+bka5Mz356+6pb7ycLlwIDys4RXa2cRWthJ8IfU4wwzCMrYCm3sBTAQm2F+MZn8/scsJ8qRDxNe4CUqh1qzx+sdKW3OTgvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MCCGu6jvpYSoLY23iP1tazjwCV+MpCFzq8pWlXvenA0=;
 b=aO7bMgoM03NFglyBNX2+CHpyc+LfreoMcQoDWuAUXYevvIw91mgFsHT//xIEzz5Kg/G276BoCKBv/ZYG0L4muwhLbtJHOLVH/lB62eRw49XhsaqGty0mbN5y9PmlR3FVii954ECewykpuxrVBVDaMPBzzdLhHkW9tEqwdk1QEh/LTnQbjGPwULZShSJy9iapGgFwJmbyiZHQNxc92ETfaqKAtQmslqhnZO6UxTwL01bqI7azeNB90nIOkggbS3f8UMKtTWDu88AgVgQxuguaxrrMkVc/mEn6WjPXpSlLrYu5WD1HsK4ybtEKAvobaABz0VAKVj1owRy0xHrv6fVPcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CO1PR11MB4865.namprd11.prod.outlook.com (2603:10b6:303:9c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.37; Tue, 21 May
 2024 14:47:58 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%6]) with mapi id 15.20.7587.028; Tue, 21 May 2024
 14:47:58 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Krzemien, Robert" <robert.krzemien@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Landwerlin, Lionel G"
 <lionel.g.landwerlin@intel.com>
Subject: Re: [PATCH 00/17] Add OA functionality to Xe
Thread-Topic: [PATCH 00/17] Add OA functionality to Xe
Thread-Index: AQHadnkcIUwutN2VakWosatViFIW8bGcJwYAgAB1PYCABZE6AIAAAUuA
Date: Tue, 21 May 2024 14:47:58 +0000
Message-ID: <595ea35d63cd92777b36f6ab87cd1f6483a4b38f.camel@intel.com>
References: <20240315013518.2848986-1-ashutosh.dixit@intel.com>
 <438b276a653bf56fe1e0e131709d615dec86ae3e.camel@intel.com>
 <87frufuc96.wl-ashutosh.dixit@intel.com>
 <96d03111d07e8182e7ecb3c0ca1942c7fef22e6f.camel@intel.com>
In-Reply-To: <96d03111d07e8182e7ecb3c0ca1942c7fef22e6f.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CO1PR11MB4865:EE_
x-ms-office365-filtering-correlation-id: 9ff95ccc-0997-4815-605d-08dc79a501a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?Q1A1azNwVzNsMEsvZk9relk4YVRDcEZGOGdsRWFXN2ZCY0JhWE5POWxod2N0?=
 =?utf-8?B?c1RzTG04TXNsdm4veCtBM3M0dldHMUs2cUJZTG1oY1I1Sk5CYlRZc1JqaGNG?=
 =?utf-8?B?UnJRTzNqZjFTTHdYYm1COVpjT2pBRDdYWkszZGZTVnpUTTcyUVlWUmNEWUJX?=
 =?utf-8?B?MXdVekFnb1hSRTNkdDQ3U1ZDTnlNRjBMdHdZYUdUM25yV01HQ09hU3VDM0Zh?=
 =?utf-8?B?YnluM09lQUJhQi93TS8wOHpiNEsyV21KSVVObllqanlPTk9QT09DUGlDNlpM?=
 =?utf-8?B?NVN5OGg5MUpnREgwZFREQlVnSGtJbXpRc1JTcnpiY1Z6dlZQM0ZUN0twVmxk?=
 =?utf-8?B?UWwwcGZWR2R5RHVBUDg2N2toUlk4K0JwVDRpUjRIdjc1aDNNQ1NaYklXc1By?=
 =?utf-8?B?OHpIaFBRbjEydnhnQ2V2QkZsZWxENEVWSC9UUEorNHRBaVo3SVVFZzR5OUUx?=
 =?utf-8?B?N2NrTGpma0pVN3VuMGl6U2JpYmlhTHhGTUZCODB4K056MkhZOXRlRDZLUzhX?=
 =?utf-8?B?OHd1ZzJyTFdYQ2ZnYnhzSHRCQm9WY2FJRDRmakRjMDVxUXdEOUtEdzhBbFRB?=
 =?utf-8?B?eWtUTTVQRGs3SDlGUTdPbGhUV1ltZGZ5aDZpQ1pPTlJQT2lYQ240ZVpnK1FB?=
 =?utf-8?B?RGttNTZmWTNQQ2M1b0lYOFlkTjhia1ltWW9JZ1EwTDFmKzl3ckREUmRwZ2pR?=
 =?utf-8?B?VlVWQUdVRTA2bHBua2dhbHVIQkdxbzlyeW5yR3lUZzFxOU9PNjZyL0o5YjZ5?=
 =?utf-8?B?eUxmSEpKVDE4ZU1MVGZRMUo2NzhiOGhrQVMrSzg2M1ZrYUZuY2EzT1Z1RUsy?=
 =?utf-8?B?ZDhrNnYxalZDakhQRUFMWXM3aFdUZUF3ZGRxR1AwYW1rWjhVWUNkbVQ1dEZO?=
 =?utf-8?B?MHdoUTBaRmwyUmJQVk5xU3ZXREhzVDgyKzFYUUNoWEVuT1VKcW15NHphQ3p4?=
 =?utf-8?B?am1OZU8yODA3VkZkRHpuUGljT2hPODRKaDZzenZDdytpWDhERXZ0M2NORjU4?=
 =?utf-8?B?bWx3WnRDTDJ4NmVLOTdQdzNOZHZEOTNYQm1CUkl0SDM5V1FHdUgzVXplSHZo?=
 =?utf-8?B?T09NRzBUTmlGcjJiQ1YrTkViNjh5VVp1ZUNKNm1yVFlxNUQ1dGxKTG1mMkdG?=
 =?utf-8?B?UHc5UzI2VkJXNkRYNlFzTlFMM2NCcU9DTHYxV2h6RENuOVZnOHBZVlpEQWE0?=
 =?utf-8?B?ZUVnd3pkNTR1bGFXZjI3ZVVjUUJzMEFuK01mU1JGL2VNZEN0U2dybnhCZEo4?=
 =?utf-8?B?bFlTQm5vRGhUYmlEWTdoUmlYOFd4NlptSlpYcU5MYU8wejlDM1pnam05TnNV?=
 =?utf-8?B?S0Y2ZDJLamFpU0s4VS9KclpOb1RYbjlGVXhjVndvY3JkOUlJQ1RacDI1Sk5B?=
 =?utf-8?B?ekpJYUZQd2tnd1ZJRGpXN3krYVJPWUZ1ZWt3ekI1OS93T2R3U3NxMTY4QlJw?=
 =?utf-8?B?ekQwT3FuY2JUOUFsRTRSY0NJTm92dGo2azJEL3ZWRGtzV1VJRk1uTEdiclc2?=
 =?utf-8?B?UThkQVJQMjlzTDcydTdrMnNrWERMNDcvUG13ZlVDZkZreVE5RTZydkc2Q0NP?=
 =?utf-8?B?R2JZK0Z2WnpzcVVNR2E0NWpSbTNrMnJ2V1pNNWl1VTBzZDVTUURUMGM5dUZW?=
 =?utf-8?B?SE5mRWxRZnJHRHoxOGorRG5yUHZLaHRUUU1zUzVnWkJocG82cHFDdnhoaGlV?=
 =?utf-8?B?Ui83OVhpRlBFeVBZanRGZ2Vrbkt4T1dwR3NJSGc5bkt1aE9nemZXS3h2b2tV?=
 =?utf-8?B?SlVEdHJnYmplTE5XUkh3bncrRDc2b05DNkpCdHphOW9kQVJjWllISUJPU05l?=
 =?utf-8?B?MzhCT3huZzlRaDlnK0hlUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QllER3Y1ZFBhbmNCeDVlZG80VGNVTVpqbnJEMkFJQnYwWGIxK1RyS3dLczEy?=
 =?utf-8?B?VXM0SGFkN3dIYmlKRGFQNGxTRnFFNXgwUUJhSytFcCtKcHpPTXVoY3JmN3JT?=
 =?utf-8?B?aXJWV0xPdjhhbnhXZkxwN1FRMjZGclpWNVRETjhic2JLaEtKTHl0S2IxM3FC?=
 =?utf-8?B?NzFqQnVFam5HcGZ2d1pFdUVDV25ZMUIxVFIwRFZ0VFMzeHhqUXNod1VIM09P?=
 =?utf-8?B?YU90S3pRWDRhSHBIUFozaGJqOW5GQ0JYN0s5bDhvU3QzM3RnZDhGV3FJSmQr?=
 =?utf-8?B?TTlZNG16cmh3V01qdzdXVi9PeDNmVGdUWWJNUEI3MnliNlFxTldqbm83Zmgz?=
 =?utf-8?B?SENXeVZkYmg5UkYvQ1ZQeGtVT0VPT1QxSWd6TWNSUVRPQmF2OHE0RlpnTXZO?=
 =?utf-8?B?bTlsaE5sL3BabUs4RGhZSmdMZ3prWU1OSWhlK0tRMFZoYS9tS0pCc1VySVF4?=
 =?utf-8?B?VisvaVJxZGs5MDNHMnpObllXOFRsMFh4aVFFUkw2eUdBd3BaZXdFdUl1R0hj?=
 =?utf-8?B?Q0pGU3Y2clYzdkFaN1FGbHNHZ0czQ0NoT0FMeWxsSmg1QS9QZGE3YnllNFpF?=
 =?utf-8?B?ZVlRSVY4NXZPdU9ZSVJqMk16RE5IdkZEWUhiY25jMTF0SGxGZDJPODBBd25U?=
 =?utf-8?B?V2lXSTRHYklRNXYvZEJ5a2hzczRBaHFCNko4U2FLZmlLWmxZMWgxdEJhNUhj?=
 =?utf-8?B?ckoxREh6OFhtdk5sVTNKNk9ZTXRxMGpCaG54Yk8xazYwWUE0VDI2RGRWbVN6?=
 =?utf-8?B?NEhjZ2VXK3k5dnkrU0NmSk9yZElwb1dxUTBiSjg1dkVWcktSdnJxRWVySzRm?=
 =?utf-8?B?VTJuQVZMdC9jb0R3eXFwT3RtNXljc0dvMVQvMCtVaUxWb2dMdUdFbXNVbnYv?=
 =?utf-8?B?TXllaTlmWHRuSFpsRzltY1pMTmZJT2VLSWFpZHJwSVYyb1VMTC9WNTdlQTBY?=
 =?utf-8?B?Y1ZqcWRQVm9yYjNBNkxCdlAyT2I0TGYzM1pFend0SmVGbVJBZnFlVHFZdXB0?=
 =?utf-8?B?WlJyVU9qbWljOHRtVnUxR2lyaklMVXoxN1VsamNnS2pGNUpyUmRqbW5Fak92?=
 =?utf-8?B?a3J3a1pUNkdqVDRLN0d0aVdVM1FYRi8xTUpoQ0tXRFNFWVFBRllodkZ1RWtk?=
 =?utf-8?B?REc3L0R3K0V5V3p4Ty9BanJPTzhHYXYrUmZ3WkluRlhqUExURGsyRUdTRUFm?=
 =?utf-8?B?eG1VNjEwcDNBM1RnNnpTWWl3ZDBMcXVIWmhoK2Vzb1BGbTBPZEZySkxtZFZI?=
 =?utf-8?B?Z2g3M2twYWltT0pPc3JIM0VWSW5OZjJ1eUUxSTFDQlEzTitMK3lUNDNBaUdZ?=
 =?utf-8?B?elhKeWZROUVIVy9yTFhUQ2F6cHRPS3JaTUppWTRlUkNWUmsxb25oWFl2cTRk?=
 =?utf-8?B?Zjc2dTNzZC90Y0N1M3NHYzJTTnA3OHo2Vm1oV1lwcUo3N0s0VVZ1bUVrNWV1?=
 =?utf-8?B?cWxaTjJFQ3VhQklmMlNWRkowUzAvZXQzZTNiOXQ2bWo0UnpSNVJreklGenpm?=
 =?utf-8?B?enl1ZVJ6SHY1TVNyWUNMcGsxNUVsc3prMm43NXR5RUFmMVdxUURIU25WajlL?=
 =?utf-8?B?ZGtQbVVoOHdvR2I4RWwyYlRMSDlOWWxMNXJvcXZKSzVvRURVSmF0U3ZFUEVm?=
 =?utf-8?B?ZVVMRTZHVkZrV0R0OFYxUG9oWDJjTGRPYkF5M2hyZlRCR0F6MmxpNnJPbVp6?=
 =?utf-8?B?SzN3b0RmcGpqNDJaTDFqT21tVkhwbXZXM3FmMFlvd3lSTkNSNzBCTnQ4UG5Q?=
 =?utf-8?B?WUFRNFFRWC9rN3dYZHFKclBsTnBZM0g4SVQ1ZVFjTnVZTjVFRFlJd3o2UEg2?=
 =?utf-8?B?UUZQbVppTFNZbnJYYzVzU1I3MVBiWUVnQUlyb3M3RWJ0MXV4RlN3OGlIOGJ0?=
 =?utf-8?B?a2V1SDhCZUltSFpPdUtaeWVxYm0zRDhYazNnTDJ0amQ2MnR3ejlGUEVkZzl1?=
 =?utf-8?B?bkE3QThxN0FRV2JqMzN1YlpSYjFrRVZOMy9aTWFkekpsYmp5ZngzRzRyRHFy?=
 =?utf-8?B?K3liampwL3ZIU3p0bnlkT09pM2hiWU1TUXUxemU2VEltQ3QyamNtSzBWdTdw?=
 =?utf-8?B?ZDRoREdmSW1PazhnNEF5d1RVS3BLUkpuVUZsSEJBQlBhNkVzekpKbTE2WUc5?=
 =?utf-8?B?OTRTcFBtZmNvTFpEWTMrTUd0dEtJdGxIWFY5TEFVbmZoNWE2dmp5OGVlcVph?=
 =?utf-8?B?QUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <118B62F2B0F78F4B8878B70CF569DAE4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ff95ccc-0997-4815-605d-08dc79a501a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2024 14:47:58.3790 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K1VziLE4DiweVuw7LffFnH8BZCIqVNL83eVnQeOCTCXYaqvq/ZPaUPaaa7N4iONO0oRsANDUd6qLQ9kIWoCaXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4865
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

T24gVHVlLCAyMDI0LTA1LTIxIGF0IDA3OjQzIC0wNzAwLCBKb3PDqSBSb2JlcnRvIGRlIFNvdXph
IHdyb3RlOg0KPiBPbiBGcmksIDIwMjQtMDUtMTcgYXQgMTg6NDIgLTA3MDAsIERpeGl0LCBBc2h1
dG9zaCB3cm90ZToNCj4gPiBPbiBGcmksIDE3IE1heSAyMDI0IDExOjQyOjM5IC0wNzAwLCBTb3V6
YSwgSm9zZSB3cm90ZToNCj4gPiA+IA0KPiA+IA0KPiA+IEhpIEpvc2UsDQo+ID4gDQo+ID4gPiBI
aQ0KPiA+ID4gDQo+ID4gPiBJIGhvcGUgSSdtIHJlcGx5aW5nIHRvIHRoZSBsYXRlc3QgdmVyc2lv
bi4uLg0KPiA+ID4gDQo+ID4gPiBKdXN0IGEgZmV3IGNvbW1lbnRzIEkgaGF2ZSBpbiB0aGUgdUFQ
SToNCj4gPiA+IA0KPiA+ID4gLSBSZW5hbWUgRFJNX1hFX09BX1BST1BFUlRZX09BX0VYUE9ORU5U
IHRvIERSTV9YRV9PQV9QUk9QRVJUWV9PQV9QRVJJT0RfRVhQT05FTlQsIGZvciBiZXR0ZXIgY2xh
cml0eS4NCj4gPiANCj4gPiBTdXJlLCB3aWxsIGRvLg0KPiA+IA0KPiA+ID4gLSBTb21lIFBlcmYg
dUFQSXMgYWRkZWQgaGVyZSBkb24ndCBoYXZlIHVzYWdlIGluIE1lc2EsIHNlZSB0aG9zZSBiZWxv
dy4gTm90IHN1cmUgaWYgTURBUEkgb3IgZ3ZpeiB3aWxsIG1ha2UgdXNlIG9mIGl0LCBpZiBub3Qg
dGhlIGFwcHJvYWNoIGlzIHRvDQo+ID4gPiByZW1vdmUgdUFQSXMgdW50aWwgdGhlcmUgaXMgVU1E
IHVzaW5nIGl0Og0KPiA+ID4gCS0gRFJNX1hFX1BFUkZfSU9DVExfSU5GTyArIGRybV94ZV9vYV9z
dHJlYW1faW5mbw0KPiA+IA0KPiA+IE1EQVBJIHVzZXMgdGhpcyB0byBpbXBsZW1lbnQgbW1hcCAr
IG1taW8gdHJpZ2dlci4NCj4gPiANCj4gPiA+IAktIERSTV9YRV9ERVZJQ0VfUVVFUllfT0FfVU5J
VFMgKyBkcm1feGVfcXVlcnlfb2FfdW5pdHMgKyBkcm1feGVfb2FfdW5pdA0KPiA+IA0KPiA+IFll
cyBHcHV2aXMgYXMgd2VsbCBhcyBJIGJlbGlldmUgTURBUEkgdXNlIHRoaXMuIEFjdHVhbGx5IEkg
YW0gc3VycHJpc2VkDQo+ID4gTWVzYSBpcyBub3QgdXNpbmcgdGhpcy4gQmFzaWNhbGx5IHRoZSBx
dWVyeSBwcm92aWRlcyB0aGUgZm9sbG93aW5nDQo+ID4gaW5mb3JtYXRpb246DQo+ID4gDQo+ID4g
KiBXaGljaCBlbmdpbmVzIGFyZSBhdHRhY2hlZCB0byB3aGljaCBPQSB1bml0cy4gVGhpcyBtYXli
ZSBNZXNhIGNhbiBza2lwDQo+ID4gICBzaW5jZSByZW5kZXIgZW5naW5lIGlzIGFsbW9zdCBjZXJ0
YWlubHkgYXR0YWNoZWQgdG8gT0EgdW5pdCAwDQo+ID4gICAoRFJNX1hFX09BX1BST1BFUlRZX09B
X1VOSVRfSUQgdG8gYmUgcHJvdmlkZWQgd2hlbiBvcGVuaW5nIE9BIHN0cmVhbSkuDQo+ID4gDQo+
ID4gKiBCdXQgdGhlIHF1ZXJ5IGFsc28gcHJvdmlkZXMgb2FfdGltZXN0YW1wX2ZyZXEgd2hpY2gg
bmVlZHMgdG8gYmUgdXNlZCBpbg0KPiA+ICAgaW50ZXJwcmV0aW5nIE9BIHRpbWVzdGFtcHMuIG9h
X3RpbWVzdGFtcF9mcmVxIGNhbiBkaWZmZXIgZnJvbQ0KPiA+ICAgcmVmZXJlbmNlX2Nsb2NrIGlu
Y2x1ZGVkIGluICdzdHJ1Y3QgZHJtX3hlX2d0JyBmb3IgY2VydGFpbiBwbGF0Zm9ybXMNCj4gPiAg
IChjdXJyZW50bHkgREcyL1BWQy9NVEwpLiBTbyBpZiBNZXNhIG5lZWRzIHRvIHdvcmsgZm9yIHRo
ZXNlIHBsYXRmb3JtcywNCj4gPiAgIHlvdSBuZWVkIHRvIHVzZSBkcm1feGVfcXVlcnlfb2FfdW5p
dHMuDQo+ID4gDQo+ID4gPiAtIERSTV9YRV9PQVNUQVRVU18qIHZhbHVlcyBhcmUgYmFzZWQgb24g
SFcgZGVmaW5pdGlvbiwgSSB0aGluayBpdCBzaG91bGQNCj4gPiA+IG5vdCBmb2xsb3cgSFcgYXQg
bGVhc3QgZm9yIERSTV9YRV9PQVNUQVRVU19NTUlPX1RSR19RX0ZVTEwgYW5kIGF2b2lkIGhhdmUN
Cj4gPiA+IGEgYmxhbmsgc3BhY2Ugb2YgYml0cyBub3QgdXNlZCBpbiB0aGUgdUFQSQ0KPiA+IA0K
PiA+IFN1cmUsIHdpbGwgY2hhbmdlIHRoaXMgdG9vLiBVbWVzaCBhbHNvIG1lbnRpb25lZCB0aGlz
Lg0KPiA+IA0KPiA+ID4gLSBQZXJmIHN0cmVhbSByZWFkKCkgc2hvdWxkIGdpdmUgdXMgYSBoaW50
IHRoYXQgZHJtX3hlX29hX3N0cmVhbV9zdGF0dXMNCj4gPiA+IC0gbmVlZHMgdG8gYmUgcmVhZCwg
dGhhdCBkaXNjdXNzaW9uIGlzIGFscmVhZHkgaW4gcHJvZ3Jlc3MgdGhhbmsgeW91IGZvcg0KPiA+
ID4gLSB0aGF0DQo+ID4gDQo+ID4gWWVzLCB3ZSBhcmUgZ29pbmcgYWhlYWQgd2l0aCB0aGF0LCBy
ZWFkKCkgd2lsbCByZXR1cm4gRUlPIGVycm5vIHdoZW4gS01EDQo+ID4gZW5jb3VudGVycyBlcnJv
cnMgKG9yIG9hc3RhdHVzKSBzaWduYWxsZWQgYnkgSFcsIGFuZCB3aGVuIFVNRCBzZWVzIHRoYXQs
DQo+ID4gVU1EIGNhbiBjYWxsIHRoZSBzdHJlYW0gc3RhdHVzIGlvY3RsIHRvIGdldCB0aGUgc3Rh
dHVzLg0KPiA+IA0KPiA+ID4gDQo+ID4gPiBPdGhlciB0aGFuIHRoYXQgdGhlIHVBUEkgTEdUTS4N
Cj4gPiA+IA0KPiA+ID4gVGhlcmUgaXMgdGhlIGhvbGRfcHJlZW1wdGlvbiBmZWF0dXJlIHRoYXQg
aXMgbWlzc2luZyBidXQgSSB0aGluayB0aGF0IGNhbg0KPiA+ID4gYmUgYWRkZWQgbGF0ZXIuLi4N
Cj4gPiANCj4gPiBZZXMsIHRoZSBwbGFuIGlzIHRvIGltcGxlbWVudCBpdCBzb29uLiBBbHNvIGFu
b3RoZXIgZmVhdHVyZSB0byBzeW5jaHJvbml6ZQ0KPiA+IE9BIHVuaXQgcHJvZ3JhbW1pbmcgd2l0
aCB3b3JrbG9hZCBzdWJtaXNzaW9uIGlzIG1pc3NpbmcsIGFuZCB0aGUgcGxhbiBpcyB0bw0KPiA+
IGltcGxlbWVudCB0aGF0IHNvb24gdG9vLiBIb3BlZnVsbHksIHdlIGNhbiBnZXQgd2hhdCB3ZSBj
dXJyZW50bHkgaGF2ZQ0KPiA+IG1lcmdlZCBmaXJzdCwgYmFzZWQgb24gTWVzYSBhbmQgR3B1Vmlz
IHB1bGwgcmVxdWVzdHMgYW5kIGRvIHRoZXNlIG1pc3NpbmcNCj4gPiBwaWVjZXMgYXMgZm9sbG93
IG9uJ3MuDQo+ID4gDQo+ID4gPiANCj4gPiA+IHRoYW5rIHlvdQ0KPiANCj4gT3RoZXIgYXNrLCBj
YW4geW91IHJlbW92ZSB0aGlzICdGYWlsZWQgdG8gcmVtb3ZlIHVua25vd24gT0EgY29uZmlnJyBk
ZWJ1ZyBtZXNzYWdlIGZyb20geGVfb2FfcmVtb3ZlX2NvbmZpZ19pb2N0bCgpPw0KDQpNaXNzZWQg
J0luc3VmZmljaWVudCBwcml2aWxlZ2VzIHRvIHJlbW92ZSB4ZSBPQSBjb25maWcnLCB0aGF0IG5l
ZWQgdG8gYmUgcmVtb3ZlZCB0b28gZnJvbSB4ZV9vYV9yZW1vdmVfY29uZmlnX2lvY3RsKCkuDQoN
Cj4gTWVzYSB3aWxsIGJlIHVzaW5nIERSTV9YRV9QRVJGX09QX1JFTU9WRV9DT05GSUcgd2l0aCBj
b25maWcgaWQgc2V0IHRvIFVJTlQ2NF9NQVggdG8gZGV0ZWN0IGlmIFhlIEtNRCBzdXBwb3J0cyBP
QSBjb3VudGVycyBhbmQgaWYgYXBwbGljYXRpb24gaGFzDQo+IGVub3VnaCBwZXJtaXNzaW9ucyB0
byB1c2UgaXQuDQo+IFNvIGl0IGNhdXNlcyBkbWVzZyB0byBiZSBmbG9vZGVkIHdpdGggJ3hlIDAw
MDA6MDA6MDIuMDogW2RybTp4ZV9vYV9yZW1vdmVfY29uZmlnX2lvY3RsIFt4ZV1dIEZhaWxlZCB0
byByZW1vdmUgdW5rbm93biBPQSBjb25maWcnIG1lc3NhZ2VzIHdoZW4gcnVubmluZw0KPiB0ZXN0
cyBzdWl0ZXMuDQo+IA0KPiBPciBkbyB5b3UgaGF2ZSBvdGhlciBzdWdnZXN0aW9uIG9mIHVBUEkg
dGhhdCBJIGNhbiB1c2UuDQo+IA0KPiA+IA0KPiA+IFRoYW5rcyBmb3IgdGhlIHJldmlldyBhbmQg
ZmVlZGJhY2sgOikNCj4gPiAtLQ0KPiA+IEFzaHV0b3NoDQo+IA0KDQo=
