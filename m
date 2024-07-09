Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE283C3DA42
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 22:54:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90EDB10E113;
	Tue,  9 Jul 2024 22:54:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="clahA5yj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C5210E113
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 22:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720565680; x=1752101680;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=gse6gwc8deZXlEwApI+pkCN6ZH0mQTFWLKzHioWxjOI=;
 b=clahA5yjg1YmfnOskYXYSx1Ag9tG4sed9MSjAhABaPFSZuURYFZWXQsZ
 Nl5J3ONZew5Ju36sKKXozzjjdJ/lVAglDjaUdr8i6j/1Qk26Ah7JlbGub
 m7yanBE2hDufZDNpmndgbE8hj0eNqcUUzuxiR7fbUVEfyJB43/jYhO72h
 u4vn7TKZK54IguZkOqB0TbEOJurtfaC9qi1H1yyI2g/kbqitsxgtVfRlW
 fCJ0wlyR1b66IqhrSt2WkRSPl6fkJPwfGrjud1fjewotprYvMZFgpvJgJ
 CmzflhQ8q3xHOwQ40Pk/LqD06HF3Y9sCVEVO8NQUHibc58KSDxLF6Oope A==;
X-CSE-ConnectionGUID: 8bYYUl7vR7yje7CXUFwM0w==
X-CSE-MsgGUID: jWS99dpXSGiW8R2ppqepzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="43279891"
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; d="scan'208";a="43279891"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 15:54:40 -0700
X-CSE-ConnectionGUID: NggO0WFWT363oR/wFquNag==
X-CSE-MsgGUID: DhucFGTcQTuiRo07DoEhLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; d="scan'208";a="79163421"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 15:54:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 15:54:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 15:54:38 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 15:54:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WOpnhj8/2ozPxeStS2PpDEIeq/5nbGv4/MLoAH2cCZkhItQDb5V/nFLFAzE0hcJf7TQ6gjlzKauMIsXfxdnfp1P+rvCtDqZ0y6mknbCwrDLIxSFTZ0QPc7FmC8YVzSXrgDb/WQ8jdduRKrUpuQ1P04xEXhdaTRVWmpYELCRRUi43saRxhbhQ5nIh3+kTw9pDzUFelqOreAjGoNP6jzRptp2n44gIl9+4y+t3teN4Da7zwJ1q/GgMCfwkw5VC+fkXqseRmlPq0e9wuXDYxPO5nGRlDF3i34n1XaH9ezWvoGrSziCAWDtXVJZPi7hrbhHXaHhYuo6FCTWu4IDtDb8ndw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gse6gwc8deZXlEwApI+pkCN6ZH0mQTFWLKzHioWxjOI=;
 b=TzRkwoaQ5BmdBr7RSfwP3vX9oW1I2HLftK3pmiT5OCzxMcwi+cFyCInKk7qOR1LXLJfSV7/0pPceFO0QbpTV3sDqbe5gTg3Qfl5phZwOeb134NRHtFN+aKqiaotyGGfsrY2MLcXXzqg4pds9/vKW4leOISg394wkHqjkl/iNv+3M+HjrYeeAbtLw07sMVh3r1+ClnKeqRUowzS+O1w4xgEbMyqhICpkNmSsE4A/eOQWcuRtpFa6eQkK5NKpZWHnHn1f9mZxoAkQkNd4DNZt+rwj4gp6c8qgJekvQ7rAwqM4ILxLckpKJVWFBaQg6XlKH6GtxDWs6fRuuvI2ZjIFb8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 MN6PR11MB8219.namprd11.prod.outlook.com (2603:10b6:208:471::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.35; Tue, 9 Jul 2024 22:54:36 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 22:54:36 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Harrison, John C" <john.c.harrison@intel.com>, "Welty, Brian"
 <brian.welty@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Fix missing workqueue destroy in
 xe_gt_pagefault
Thread-Topic: [PATCH 1/2] drm/xe: Fix missing workqueue destroy in
 xe_gt_pagefault
Thread-Index: AQHa0i+aWjHIM9rZYEGQ2J7emUlLArHuv++AgAAed4CAACMpAA==
Date: Tue, 9 Jul 2024 22:54:36 +0000
Message-ID: <4ef16cd822178c48188c907fd44a6642551a567d.camel@intel.com>
References: <cover.1720550129.git.stuart.summers@intel.com>
 <7c8bf0c59c0bd167c238dc5a65d0074a4ea4109d.1720550129.git.stuart.summers@intel.com>
 <Zo2IneFVE2yZ8B6Q@intel.com> <Zo2iK3CrjQ47Q5Eg@DUT025-TGLU.fm.intel.com>
In-Reply-To: <Zo2iK3CrjQ47Q5Eg@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|MN6PR11MB8219:EE_
x-ms-office365-filtering-correlation-id: a17aed5c-28d7-40d6-6a4d-08dca06a1b62
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WENpQzJyTVppM2JmbzducVpGb3QxODJHdnEzWUJiNStjK0FDQ3Rjd0JBbUYx?=
 =?utf-8?B?b2ZqSlZnS2FRRm1tVjFrZ0tBZFViTCtqNUxoY2c2UXo5dFlHbXBBVTlXTHFD?=
 =?utf-8?B?U3c2YWRhUmltbTNCU2llSE9qaVcrRm11bWo1ZTAxb2JlYXBXQ1d3V0tHTkJn?=
 =?utf-8?B?RGJIRjNNcTdrWVZybVk1QUFWd1JWU2NlV3Y5ZlVWM2w0RnM3anhBWWg5ejBM?=
 =?utf-8?B?VGVJL1M1K3JlRkV1NHRlaDlscUFEa29KWFUzWUdjTDZJdWVJWWI1M05EUnBa?=
 =?utf-8?B?bDRhSkxLMTJnR25DanQ4Z1M0a3E4bkJPdy9aN2EvNjArVmVjQnh2di9vZWl0?=
 =?utf-8?B?NC9tb1llblRsbU5BZ3BLUktkK0FtUnVER2ltZzBOdWdkMjRxRFY2eXFXV0RW?=
 =?utf-8?B?dURmamh3NU1MY3E4dTJna1NJc0pMUi9Lcmd3VndENWtoUm9iUmV1WHJPUmsr?=
 =?utf-8?B?OFhyYlg2a0dmZDRqRHczYU9hL2JpM1hsV0dYZXVEVjhQMXh1alFtVk1BYk9i?=
 =?utf-8?B?Wi9tcVF6dWxCSXZmdVUwRlFaNzgzQmhxSDRzMDJNZ2szWUorRjk0WEo4Z3pQ?=
 =?utf-8?B?MUpJUGJGU0pSU2RVaU5BbnpOWnRiZU1IeE1CZ1IzcVJ1bEo0WXcrUVhQNkRo?=
 =?utf-8?B?MHFJbUlzLzdaeDFnWThJbWhUN29PNis1QzZ4cHhib1M1WFV2RFR0c0x3anl3?=
 =?utf-8?B?WjBkZGk3eTd0SURMM3NlU2RySU1KYU5NSk5Ed0hMUW5QM3RkeVRQQll6cFRB?=
 =?utf-8?B?eVNDUm16SlVUcTJHaWNaUWJoS0xvZmtRMVVvQTZhWnJCeXphRG5EUnpwZ3dq?=
 =?utf-8?B?R01Qb3RZM01QOHhnRWNySkZIOEVjRTdRR1BnQnZYNjZudENKR1hraEZ2dFpX?=
 =?utf-8?B?ZHdrZm1VTnpCdjRNZEZnMzRJKzZkd0M5QTMrMU5FMCtiMUI3eFcrTU1VSHdC?=
 =?utf-8?B?VEFuamRUSDd0UlUzem4zMVVkWGwzVGVrNW01MXB1bnlhbzBTVjN5TEkzNUdj?=
 =?utf-8?B?TUhteEhmL1ZZcE1iRkJhSlJRWU16NTRDYytNMDdoenFDSGJjc2FZS2x6K0FL?=
 =?utf-8?B?UjI1dGg3Y3ZnY3JtcEttd0xNd3U2Wll0T0phNEFTVkVnb0FENjZDVjZLSDh3?=
 =?utf-8?B?aUF6Z2ZpMVJhWk1zcFR0eXNENm1Bd2V0Y2dVWDdOa0t1NUNqNlNxb0c2Y1R1?=
 =?utf-8?B?T3JyVHp4bzhlTHNrSUlFZkkyVmU0Q1FFUm1MZmtma255NWFOZ3dUbkRLeDJu?=
 =?utf-8?B?UHYrTnZiclNuMkJKWVYxd2tGUGpkeUptOHBiZE5rUGg3M2tvVVBaTnBSU0Nl?=
 =?utf-8?B?aCtucTRXdytXaWRtc2lqN3Q0U1BnRE1rWWljVUIxS2pKOUZwL2NKeklBZHht?=
 =?utf-8?B?bmpnYzVvVk5qcG1DWTROUW1zUm9uUEVUWFNROHFaditmWnJ1LytkaEJUWXlM?=
 =?utf-8?B?M3diT0F0eWd5WHNHSnM1ck8rL2RBRHJGTDdQK3laMEEydWc4N3d3ZzV2d250?=
 =?utf-8?B?UWJLV1VTWFZPU0txa2FuMlYzdW1qNjYrQzVjRlhyV3pGUnAyQ1V3L1ZnWG9k?=
 =?utf-8?B?Z1dzYkRSV3ZET3M3OTVaSjdnTW5Ub0JMb05ldWh0Uks3d1BkblErRmNFc2la?=
 =?utf-8?B?OWQ0Vk1ScWVnRkkzSWxOZ2JvT1dOdTk1cDkycUJpakdUa2FNbndoZjU5d0pi?=
 =?utf-8?B?eDdrYm05RW1CTW4yT2hYa2JlUnJlRVNndEhJalNwN2pmY1hqZUZBd01iM2Za?=
 =?utf-8?B?SmQxTWZXZUhmbXFmbnN5L3dtQk5RQll5enl3QWZ3U0w3TFJEQ2puY1ZsRnph?=
 =?utf-8?B?UVA1b21oWXVTY1kyekpHbmRVNjVVN1EyOUFRWnVIdmgxbGFBeFF1bFhKNnUv?=
 =?utf-8?B?dHRHbzUrWlFVUXBpY3JOcnorcTZTbFh6WkV4Rkc4Z2tCVkE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YnZHSDdvaXNUOUhpMGdidExUN1lMcmtsekE4QTVickV3a3I2WHByRFZ5a2xS?=
 =?utf-8?B?OWVtbGVYSzh1RlNSeEhUcVUzL2VLcjJwdTFrNGNwRmtHaUF0TmkwRHZ1VWVZ?=
 =?utf-8?B?WCtlOGV2NTdQOTdkTGdlenZSWmpyQ2RTa29zVHVKWk91bmowSHdZcnVWaHZF?=
 =?utf-8?B?Rzg2VWNhSGxtaW5DM1FacmwyaGZrTktpZytUUUFJdm1HZEx4cmw0NE95Y2pm?=
 =?utf-8?B?SnN3VWNZSGtFMWtNWmFzSDVROGlhWWxsYWI1a2M3YjhsRHN3M3dVdmk1Mm9M?=
 =?utf-8?B?TTlUTTFEWjhqSjJPRkxvRGdQcUFJMmNRRUR1QVYrS3IxNzhEcWwrb0RJaHlJ?=
 =?utf-8?B?YllQTktkek5wYkR0WW11VG9wWWxUUUpXZDJGbUk1UUdaeXBXNDRyUzFEZ1RG?=
 =?utf-8?B?V2ZMdXdWUnVWWkVIZ2trMm4wRGRQR3NtaUFHTVR4aWI5ODdmOVh4Y090MUFm?=
 =?utf-8?B?NW43TWNiR1RGUTMwbUpuZWZGL1VBbXBQMkRsQ2p1TXpkVUNHRU5JblNiU3NV?=
 =?utf-8?B?ZUx2bExsVGFYMWk3TDg2amFuMmE3TFJkV2NUV012NXdyM3RNY1djcDQ0Skp0?=
 =?utf-8?B?bmNIV3Q1UHpzU1NybGpYa3MwMmJsa3VYK1dwdmlBNVZvc2pZMHc2a1dURmVW?=
 =?utf-8?B?UklpTU92ZUIvNjBuRm9oTERYTUtZM0diYUhnd3l5MG8xK2JBV3RpWDVjc2py?=
 =?utf-8?B?SEczbEsyWHRPRnZJL2hNazJxbmlmaVhLanJzeHFLTG4yc1NHdk84U2UvN1NL?=
 =?utf-8?B?UVBZamlFd1czY3pCRlAzQnlHb2NzcTFjV1p6V1FyUElxRGxMRWlpcWw4S3pN?=
 =?utf-8?B?MTFlRkpwdHJTQnViaTVyUkhRQnNLYWl2M1k4aGpHTDB4MFRGa3lmWG1CZlRW?=
 =?utf-8?B?V2FUaHN6SWQveGF6bEJhSjRHU0o0cHBXUnBVMnRyRlhhd3RpMjhTdGs0ckRV?=
 =?utf-8?B?eUVsTk1rMDdCYkV5VnkxTDFIaDFYbTl5aTNDcnhuc2loZStCa0kvejA1UCtj?=
 =?utf-8?B?bHdaK1JsYVBsT21odTh4eEJvT3czY0IvaWFSeXVFMGFKSS9YQ3hsaE5Rb01D?=
 =?utf-8?B?SW1rRHNaejZmdWhscTFBQUpiUFVTZVVxQS9XSUtTUzNPUWlqaXYzeTQrRjcw?=
 =?utf-8?B?SWFNRlYva2lkSU45dTY3UDdkVDExcE5BTkljdmtFMnBNNjJ5WTFibURCQ3ZH?=
 =?utf-8?B?T0NWRmE3SHpLelgxbC9yMkxQM3dxeEp3SGRGd0hDTVdIN1dPMUs1RWxoekF6?=
 =?utf-8?B?ZGVQQmdoWVJKV0V3QjFBRGNaMmd3N3l1WWhiK3VnTlBMdWxJazlYcVlaKzFP?=
 =?utf-8?B?UkJoWFVRUGs5bTk4U2xGeWJNRlZlRWZkaFh2SmhldXN1S0c5Z2J6L0lRTHJ6?=
 =?utf-8?B?aFVxUnd2WVlqWllpZVp6a0RESGlLMjNIbXd2S3RDRlBQeFZHMGo2TE1CN3JE?=
 =?utf-8?B?dS9Zc3ZMSjZkeFRnbmJRTjhXTjBnNjR0WFU5c090OEltS0tsdlpWREg1Z1pp?=
 =?utf-8?B?V0tjZlhHRVMyWUlKTUxZTU5saVZnVTR6MmI2R3JZSVZldzhkYkgyVklyL3JU?=
 =?utf-8?B?YWZUemVpUzhyOFZYSGY4cldMNjZtMUtvTEpCb3pwV3ZSTnNabWdSNFYvRmFX?=
 =?utf-8?B?OURxUml0SWFhSExNQTZvV1BWYUFFaDJRRTdqSkw4dHdKZnpEVVcxOVhZdEJu?=
 =?utf-8?B?M0JNUzNxeStMWVlsMnU4djhjbCtwMTkxblVhT0ZJcnNGbVN6VStEUVMzcDFX?=
 =?utf-8?B?Y1J0VHI0VHFSVUI5WjlZTTZUWjRlRlZzL3BlZDdRN0JDZW5hSEhCQmJsNVox?=
 =?utf-8?B?MnZ2ZFM5dUNMaUtFMHltOXVHUzZUeXlyRzZWbEZXelFVSlY3b3ZYUHU2cG5h?=
 =?utf-8?B?cWdOL201TlhNZzB6endScUNoMm5JN3RDeVJac252aTV0OWRlNmI0a1JYSUlO?=
 =?utf-8?B?cUZMRkpNaE45d2hvdG5EajVVL2UwL0xsY0pmOEYwbkJ5eExISlMwQkJMRXYv?=
 =?utf-8?B?NCtmV1p4Y21VajBlY0FjZ2JTV1c0OEVoaUNJWjJRdnViV0xKaUVxYUtGSS9q?=
 =?utf-8?B?amNPaDFrUVo2MHV1bUpsWTIyMkNFNkhLOGpXTUpyTU5Ca1FEVnRNcUdxak5R?=
 =?utf-8?B?OElTbnYxNkEyWHRMdStkejc1SkNvdTZBd2I5dUJyTGxxS0lEQlhueWJSeW1W?=
 =?utf-8?B?d0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6EF5AC0960C7004F83E5E0BFCC139DAE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a17aed5c-28d7-40d6-6a4d-08dca06a1b62
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2024 22:54:36.5883 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RdAl1wgXzRYoiCCsGrVbhJjUn2NB6XkixO8sncbfhZBDdCRhsnqdAeqqYRH/Fcn0Y3kSfevtXGQxCE1ZUkU4xWPoGJGmRNTlPEH2ZpKbRmo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8219
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

T24gVHVlLCAyMDI0LTA3LTA5IGF0IDIwOjQ4ICswMDAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBUdWUsIEp1bCAwOSwgMjAyNCBhdCAwMjo1OTo0MVBNIC0wNDAwLCBSb2RyaWdvIFZpdmkg
d3JvdGU6DQo+ID4gT24gVHVlLCBKdWwgMDksIDIwMjQgYXQgMDY6NDA6NTlQTSArMDAwMCwgU3R1
YXJ0IFN1bW1lcnMgd3JvdGU6DQo+ID4gPiBPbiBkcml2ZXIgcmVsb2FkIHdlIG5ldmVyIGZyZWUg
dXAgdGhlIG1lbW9yeSBmb3IgdGhlIHBhZ2VmYXVsdA0KPiA+ID4gYW5kDQo+ID4gPiBhY2Nlc3Mg
Y291bnRlciB3b3JrcXVldWVzLiBBZGQgdGhvc2UgZGVzdHJveSBjYWxscyBoZXJlLg0KPiA+ID4g
DQo+ID4gPiBGaXhlczogZGQwOGViZjZjMzUyICgiZHJtL3hlOiBJbnRyb2R1Y2UgYSBuZXcgRFJN
IGRyaXZlciBmb3INCj4gPiA+IEludGVsIEdQVXMiKQ0KPiA+ID4gU2lnbmVkLW9mZi1ieTogU3R1
YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4g
wqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfcGFnZWZhdWx0LmMgfCAxNCArKysrKysrKysrKysr
LQ0KPiA+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQ0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3Bh
Z2VmYXVsdC5jDQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9wYWdlZmF1bHQuYw0K
PiA+ID4gaW5kZXggZTE4NjU5MjAxMjA4Li5kZWQ4ZTNjMzNhODIgMTAwNjQ0DQo+ID4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfcGFnZWZhdWx0LmMNCj4gPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndF9wYWdlZmF1bHQuYw0KPiA+ID4gQEAgLTM5OCw2ICszOTgsMTgg
QEAgc3RhdGljIHZvaWQgcGZfcXVldWVfd29ya19mdW5jKHN0cnVjdA0KPiA+ID4gd29ya19zdHJ1
Y3QgKncpDQo+ID4gPiDCoA0KPiA+ID4gwqBzdGF0aWMgdm9pZCBhY2NfcXVldWVfd29ya19mdW5j
KHN0cnVjdCB3b3JrX3N0cnVjdCAqdyk7DQo+ID4gPiDCoA0KPiA+ID4gK3N0YXRpYyB2b2lkIHBh
Z2VmYXVsdF9maW5pKHZvaWQgKmFyZykNCj4gPiA+ICt7DQo+ID4gPiArwqDCoMKgwqDCoMKgwqBz
dHJ1Y3QgeGVfZ3QgKmd0ID0gYXJnOw0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2Rl
dmljZSAqeGUgPSBndF90b194ZShndCk7DQo+ID4gPiArDQo+ID4gPiArwqDCoMKgwqDCoMKgwqBp
ZiAoIXhlLT5pbmZvLmhhc191c20pDQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgcmV0dXJuOw0KPiA+ID4gKw0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgZGVzdHJveV93b3JrcXVl
dWUoZ3QtPnVzbS5hY2Nfd3EpOw0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgZGVzdHJveV93b3JrcXVl
dWUoZ3QtPnVzbS5wZl93cSk7DQo+ID4gPiArfQ0KPiA+ID4gKw0KPiA+ID4gwqBpbnQgeGVfZ3Rf
cGFnZWZhdWx0X2luaXQoc3RydWN0IHhlX2d0ICpndCkNCj4gPiA+IMKgew0KPiA+ID4gwqDCoMKg
wqDCoMKgwqDCoHN0cnVjdCB4ZV9kZXZpY2UgKnhlID0gZ3RfdG9feGUoZ3QpOw0KPiA+ID4gQEAg
LTQyOCw3ICs0NDAsNyBAQCBpbnQgeGVfZ3RfcGFnZWZhdWx0X2luaXQoc3RydWN0IHhlX2d0ICpn
dCkNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAoIWd0LT51c20uYWNjX3dxKQ0KPiA+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gLUVOT01FTTsNCj4gPiANCj4gPiBJ
IGJlbGlldmUgd2Ugc2hvdWxkIGRlc3Ryb3kgdGhlwqAgcGZfd3EgaW4gdGhpcyByZXR1cm4sIG5v
PyENCj4gPiANCj4gDQo+IFllcywgSSB3YXMgZ29pbmcgdG8gc2F5IHRoZSBzYW1lIHRoaW5nIGlu
IG15IHJldmlldyAtIHdlIG5lZWQgdG8NCj4gZGVzdHJveQ0KPiBwZl93cSBoZXJlLg0KDQpZZXAg
dGhhdCdzIHJpZ2h0IDooIEknbGwgZml4IGl0IHVwIGFuZCByZXNlbmQuDQoNCj4gDQo+IE1hdHQN
Cj4gDQo+ID4gd2l0aCB0aGF0IGZpeGVkIG9yIGNsYXJpZmllZCwNCj4gPiANCj4gPiBSZXZpZXdl
ZC1ieTogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KDQpUaGFua3MgUm9k
cmlnbyENCg0KLVN0dWFydA0KDQo+ID4gDQo+ID4gPiDCoA0KPiA+ID4gLcKgwqDCoMKgwqDCoMKg
cmV0dXJuIDA7DQo+ID4gPiArwqDCoMKgwqDCoMKgwqByZXR1cm4gZGV2bV9hZGRfYWN0aW9uX29y
X3Jlc2V0KHhlLT5kcm0uZGV2LA0KPiA+ID4gcGFnZWZhdWx0X2ZpbmksIGd0KTsNCj4gPiA+IMKg
fQ0KPiA+ID4gwqANCj4gPiA+IMKgdm9pZCB4ZV9ndF9wYWdlZmF1bHRfcmVzZXQoc3RydWN0IHhl
X2d0ICpndCkNCj4gPiA+IC0tIA0KPiA+ID4gMi4zNC4xDQo+ID4gPiANCg0K
