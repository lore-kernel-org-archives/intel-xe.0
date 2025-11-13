Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD344CD8C9D
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 17:40:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 996B710E1E9;
	Thu, 13 Nov 2025 17:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="czf111FY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601C210E1E0
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 17:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763055614; x=1794591614;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=HcSBXznBiSaKXM2Gy1Q4ULxJoje1xX8R09ubnGgd/i4=;
 b=czf111FYvk9oKZ3TgypzBeaMPSUWau8JlzhVbBx7rvqnXXte5aYSDizE
 T072Hm1UND31ogCXCN4Gm3Z5fX7jbXbEUw7mL6BRZUC5CPerayd1bSqiN
 0yAZ4POQHSTVz7HJe7YiTVoKkA1WOf856pz7NLbQqAp3Yeah4vbpPGV3Q
 fWOT7ds9j1u/iZgCOerhyXHnwcs90T43XF3fBLBhs8vCDH8KNRBtlrKEh
 R5OJubCBMX7N8M5azmoHF/PWT1Rtb1UFUEJ6mpI59ul1PbXgV6AkeXQJW
 rEH7OC1/4+UMJIB8SViLIy+W3PUFbrhyqDTnmntDw2jX/Edm3A1tAA1Mf g==;
X-CSE-ConnectionGUID: ELovJJgZRMC5gSk86m7Dbg==
X-CSE-MsgGUID: SQPISHLZQNWtStF6q5VHag==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="76605557"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="76605557"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 09:40:13 -0800
X-CSE-ConnectionGUID: kRu79wrnR6SB9s83QeWcFg==
X-CSE-MsgGUID: celu0erORGqTxTSMfXT2Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="189382163"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 09:40:13 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 09:40:12 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 09:40:12 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.52) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 09:40:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bf+sX7iC9/IcoyHLMKsHXL4oLhm2oNjxdYn3QFPS0NmJZ7gO9m9NTmecYztz90tha87c+dRCDc2Enkt+e9ZevC6y2ZIlfhovG8SweRqRyhppmJt7PPWE4VDY6evpLaaJrEXKBNFr8APN6mgP2sfYlRnOGzArhb1D27DX7eFYYiQGuk86vnoxrdqMYxuWEze4Y8DfyAC8TwPyAAy1JWiTgevAa4YWRSjLBPVBbZNBkLQYwYtyjIOvdMkIzYdFzc9WNULbIQAXxXtADPTgBgZfiSjd979pYaIQie/8DfDLFc804iANZN0xorq1kseN5E61WX4knze+X9pibK9r+5xYug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0f6/zl3b9mPZB+x+fC6Gaiboa8Ojc6vAd7W0eMX4gA=;
 b=CqaguuTB78uiy92Usw7mJ7QrmKTg+VeIDaLW9yBA7VzA2NcJDr/z3lULsGjIJz13jIgv5FHYhsC+y+RilV1l8MIwIiCzW43GmBHEuqhUvDp7ILbJ9XhBzbUgEdbujJSVE3pU97g6xbehGhKP2jn6xqRcNhCS+xLYUZ9lxsAibCfE2Dg40gXNQrvOWpg6eEDk7YwBl2W4V63iKnplFaCxc/cYWQl0xrUSNLsH4vpgTti4Cu3YkW8uMPAzVGj2/docgQA9TIijzDc4JZxk70+acWV+yTAPe6EMzjl9Kb3sw/H044bgetpKClk4/+jIyomKSnltBObclRrJaBi8PXm4XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by IA4PR11MB9348.namprd11.prod.outlook.com (2603:10b6:208:56b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 17:40:10 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 17:40:10 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110232017.1475869-49-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
 <20251110232017.1475869-49-matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 17/30] drm/xe: Create scoped cleanup class for
 force_wake_get_any_engine()
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 13 Nov 2025 14:39:49 -0300
Message-ID: <176305558905.3698.17600506635320107892@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BYAPR01CA0041.prod.exchangelabs.com (2603:10b6:a03:94::18)
 To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|IA4PR11MB9348:EE_
X-MS-Office365-Filtering-Correlation-Id: 49dc51ac-923a-497f-983e-08de22dbb149
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUhKbjgybTIzRjVyUzJiUGFFbk1QeHYwYS9saGJvVXllN1RzRnhsZCtWRE5Z?=
 =?utf-8?B?anpXQWRISlFFVnZ0dUR4YXVxT3hWanNhVzhEYXo1NVpnT0pzanEyMGJHTGZS?=
 =?utf-8?B?bEpMRmZoUDBNdTE5SW91OHA2dEJCQ1lMZkMwUjVMNE5ZMG5OTTBZVllKaW92?=
 =?utf-8?B?YjltR253dCt3Sm1pbXg2anN6NkNUdmJJUHQzLzdGMlYvNlpUUUEwQ1JWQ1k3?=
 =?utf-8?B?QURnNHAyMUlnRWRSbjh0N2ovMWtqZ2FYT2lCOFRjeGpPV3hFdHc0bitGcndo?=
 =?utf-8?B?dlQ1VVdKYUltenFWUTNleStqbnI0ZWIya21iU05HR09xRlU2M0dDVHBiN3or?=
 =?utf-8?B?MXlab1Q2QUxBZzlsc0NCcVZXdHVaTHVteWdSYWdOZ3lHeVEvMlFoZWtndHJi?=
 =?utf-8?B?Q3VVTUFFZGI4OEdNdFVqRkpDUjU2eE9qUnByRWk4N21rWWhHb3RCTXU4T0Z3?=
 =?utf-8?B?MnRKU1pHdHdnYWJubExZYmt0cjNxVHhLUkVONGI1bTlxWkdKTWJ1a29yUldY?=
 =?utf-8?B?d2NCaDMxTmpzcjR2QWk3RDZWODVqeWhiMzNZTWdnaVNTVVU5cXQ4aGs0R1RT?=
 =?utf-8?B?OHVkTE1oOGRhNFBPZlhRWXJrWWRsKysrU0lvMy9iNGxOcng0ZWhYZHg0TzRr?=
 =?utf-8?B?Z09QeTFTSEw2OWphTy9wQWQ5QWFMWVhaa0FmR3VCaFZVTEdYdkhtUzZrdk5x?=
 =?utf-8?B?ZCtUVDhWWHIrVGpaVCtMRHJ6MzIrcDRqTWw4Q0UwTjJ0RitxVzhlRC90U21z?=
 =?utf-8?B?WUVHeFRXc0h6ajVUN3NHMG03SXdRZjZINXZyOTN4Sk1zaHpRenpHc3B0ZThi?=
 =?utf-8?B?WGdoRWlLNTljb2pDcEgrSHNSdmppRi95SmlRYWM4TlhFb1dLbGs2MEorS3Iv?=
 =?utf-8?B?R05DaXQ2OG1waXdoUnd6bnJPMUpua0M0WWdRdUVUVGNIZzdJRW53eC91Y0o3?=
 =?utf-8?B?TWJSc3JpTGRhU01FZEc3ZXJydHRHV25yUTRCM3haQTNKYXkrNXNhbUp0dEtP?=
 =?utf-8?B?OGQ5c0pndzhUWnJQMEhtOS9KYUh3TmJ2bTRsbFhjdm9yUHlQNzVDTFV1Nlc4?=
 =?utf-8?B?RDdXdFllN2NVUnd4ejFiaWp6cSthS0w2OHc0UVQyaUJSUk9XT0ZNSXBONmZo?=
 =?utf-8?B?eFBXN2dGVzFqYlFWcVFBbWpUK2twcyszTC9TUmlheURQYlZFL0t1VkZIN0xY?=
 =?utf-8?B?blkvZ28ram92cUpZTGROK0NaRWsyemNjc0hmZ3BoelVCYm1qQUpIc3l3NG9X?=
 =?utf-8?B?Z2hvcDJmWEdCekFHR2NpQzhDaTlzMFRxeEtjUFNXNWp5ODRIRTVpQ21yaUJN?=
 =?utf-8?B?VTdHbzQrUk93S0JET3ZuTitzUVYwRmhGRGZ4bThlM0QxdGUyR1g0NFFQaTV3?=
 =?utf-8?B?WlBhYVM5clplN0oyZHkxbnhZNlRLQzB1SjZ4SDd2encrWGw2VUFROE9aekRr?=
 =?utf-8?B?MytoSDRXV1BqaStJL2FLbzhzZUs1eGlOQUdEM280Vi9tbTIyU0pBNi9sazhH?=
 =?utf-8?B?R25PcGNBMHorSzYvZmpRMGtlZFVLN2NnQkNWMVVHVVZoL0dZR0xmRStpaDYx?=
 =?utf-8?B?NVhoWnpvV25iSHlzTDNmOUlaS1VwSUxBLzZMWXZkRGJBRklLYTNEMVlkdjY3?=
 =?utf-8?B?V2dOU2RramRVUDViNzg4b2xPR2xwV1c1aUJRajMzUy9OdGtrbnFMQTZFTUZo?=
 =?utf-8?B?VU9tNy9jdkZYOWFFUUdPNEtvK2xkZTVLbXFyREhiS1VOS1FxSnN5Q2VCUEk0?=
 =?utf-8?B?TFRrRFllMXRSQWJoakxqZzhvcGIyRFNGWXZGRm9GN3VIT242TTIvUTdPRXJS?=
 =?utf-8?B?L2IyMTRyK0c2aktNK2czelFFZUJtZ2drdFhJM1ZzVW5qWFNnZmRzOTRpYjBC?=
 =?utf-8?B?ZlJJQURkcW53RS9HRXNGaFdwQUNTOW1BajZjbW1iT05VNzBCYUhjV3ArMWkr?=
 =?utf-8?Q?KkPgRSJfG/9ltXNwNjoj3YdYc65yRYeC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEJkTVA0TDh2Z3VISWVZak1vYXRLQjN2dXJla1JTdkRRS2VvWG02UENtNGtV?=
 =?utf-8?B?ZllnWUdnS1piL0ZYVUxGYXMxd3NVckxSWXFyTW9aQVI4VU5yZGhsZ2hzZWUy?=
 =?utf-8?B?TUh0d2FyQTc5RStPZ3VPc1FUeEQzdjYrQXprcTl4dm01VGxleVNXN0F1ZGx6?=
 =?utf-8?B?UUJBK0ZJNDlBdlBBcFZhMUp0aTlkT3lNL3Q0dFhsZlFkVVdYMFZ4UE1VV2Fn?=
 =?utf-8?B?bnpKeURJbkpQRmNVWW5GaDRKeTdaSUYzam1JaWNsOHNrYlFHd3dDSTNLazBr?=
 =?utf-8?B?SmpKeVRxSXFEalA2Y1B5ZnFtUzZ2SFdwdlpndnZKcThPbkltaDJQN2xockNa?=
 =?utf-8?B?TXNqTlRGZmVlZ3pGSE0rcGVCa2NxZG0vT2VBbVV4UUl2M0w3dnFlaTJLMElN?=
 =?utf-8?B?SDBJRlZBM3VaVkk5R1IxSDlmb096NVlBY1VnUVV1Mm9uSWJOeFZyQkIzeCtu?=
 =?utf-8?B?a1pMVUl0TGR3VW5sdEMvV2NrUnFDYnpRTWg1V1F4MnN2VU0rMkFBMUlJRCtN?=
 =?utf-8?B?R050UzlzbmM0TG9ISEJ2em5YNzlpOWpGTTB5bm8yY2x2clpodVQwRmJBTTky?=
 =?utf-8?B?eXlDUllQY2ZhNW8raTVxZkFqa2JJY1BlLzZBRDducUlRNU9kWDdqQUJ5SXVm?=
 =?utf-8?B?SWVhNDVGL2laY1lONnloWEg3TitiUHJ5YXY4elJ6OG5ORmgzZllJZzI5SWFO?=
 =?utf-8?B?WG9NOHV2amdDdDRITmIxZ0xLYnlwcUVXakR5a2wySjM1bDdodnJxdjlKNDNL?=
 =?utf-8?B?TTVTaDVyZjRmNE9VTG1kcGxnd0ZiMnZkSnZONjczbkhJdkZHKzd4a0FnMVYz?=
 =?utf-8?B?UEk0V3JlaDNycTlEdzlIVi9IMjBQVy92MEorUmNSRllRNSs0cVNpait3Z1lH?=
 =?utf-8?B?cHd0T0ZjTlNCM2YrWlQ5U2RTbGRrYUc1YnpMTkZKMHVFaktLYnRkQXJHSnBY?=
 =?utf-8?B?ZWZLaytrWTNkSTExL0l4NDB4d1ZkemFXZzYvYnRGWThmR3pXN0IyaGpQemxk?=
 =?utf-8?B?MGtFZnd0SUJtM1Rwb2cvN3pTNGQ1bUhWaDI4SlphMWlEL3NXU2lTTWdHOC9B?=
 =?utf-8?B?RjZXbXpFZC9KTUxlaDYrTFJxSzJtS3NSVXFFYy9UMnV5bTZPcXVPRkhXWENX?=
 =?utf-8?B?Wll4QkNGS1VhQzhNMzBsaUdYaHZXV2lYNkVMZmF1VVNYRGFrM0xNcThSc0VZ?=
 =?utf-8?B?bjdDdTllL001QW9IVXhvQjcvQStZV3dudmRCOGhNdWlkelFpcy9ic0dIUFpw?=
 =?utf-8?B?WGtLSDVUZ0JLNU1DanZIRVFEb0ppem5FSERIMFcyQkUzb0dqM0F3RGZZTVpi?=
 =?utf-8?B?SFlSVWd0bzJ3bkE0WFhnY2QvMUxmcTl6TDJUZFFGaW1FN3lSaGpZNUpCK1hC?=
 =?utf-8?B?YUdaWENiRGJMbXFBaE0wU1dOWkpPVlpaWE5mcnNEekQ5TnUxZmk0SHpSMmwr?=
 =?utf-8?B?RlVNLytXTnlPR0JEM2pZeUl3eEVUQ1NUb0tkaVhmaVlYQmNtSFVvNCtHeGMv?=
 =?utf-8?B?OVUwRjJJempaM25JU2F1ZVRjK2RHdTdhV2hHRnJYMmd5VUc3MU94L2Fua25o?=
 =?utf-8?B?QXJRcDdZN3BuMTNtMnJsamdyWlE4c2kxcVU3VmFOZEhEUXhCV2M1R20wVEdH?=
 =?utf-8?B?bXVRNzRaWnJtVE5JTXRmOTg5a241M1N5bnRXN3drazIyUHFYUllHbmJIMDVu?=
 =?utf-8?B?MWxlR2h4S1RWS2dUeTJaQ3NFZ0ZNLzE4WjNUM0U2QWRHK0lEbzZrYnhBNVVM?=
 =?utf-8?B?a3ZrUENpeHJ5cnNwMUJqUUVzdE0zc2RyeFIxcGQ0a3h6V3k1R3FReDFpc3kz?=
 =?utf-8?B?SnhCajdQMlhpUUVvSWVTS0cxb0taeTBwVzBXazlxTWZ3NzVZQjdvQ0NiNW1F?=
 =?utf-8?B?K1lRNnc2dll3QnhxcW9wd3pXR04zYXA1ZmdNdUtjbFdTazJCeXE5bGc1RE5C?=
 =?utf-8?B?TGw5MkMyQUtiNkU0dmtwVzFEcXJiVUI1VUdJdkxVQnFTTFNhVnVqWHB0ZjhX?=
 =?utf-8?B?UFBSaDZNVGhaOWdhNUpvem5weUY5T0lBdlVIMTg0MWhydE9TTWFoRS94SjlV?=
 =?utf-8?B?bGZSSnhjZW9lN2xlakdPTWVoRlJvbVczcnhtRU5SN3BEWWNSTk5BSFVnczU0?=
 =?utf-8?B?dHRJYlp4MWV5VFdmd2k3RlBkV05jejA2VDV4ZUd1eTUvYlpHbTlzRDRKYTJv?=
 =?utf-8?B?MXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49dc51ac-923a-497f-983e-08de22dbb149
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 17:40:10.2553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e2Oa02n8Wq/cGjFH3uRshpTWuBNhjOo8kbgmeUArJ1r7rGodiFspetHVU1uEppjZ78BM18l4ENnFV2SM8sPyGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9348
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

Quoting Matt Roper (2025-11-10 20:20:35-03:00)
>force_wake_get_any_engine() is a single-use function to pick any engine
>present on the platform and grab its forcewake.  The signature
>(returning a boolean success and both the engine pointer and a forcewake
>ref by reference) is a bit awkward.  Rewrite it such that the
>forcewake ref is the function's return value and the caller can
>determine success/failure by checking the engine pointer against NULL.
>
>With this new signature, the function can serve as a scoped cleanup
>class constructor, so define the corresponding class.  Note that if we
>fail to obtain forcewake (or if the platform somehow has no engines),
>the constructor can fail, returning an invalid fw_ref.  In such cases,
>fw_ref.fw will be NULL, making it clear that the reference is invalid;
>this fact can be used to create a thin wrapper around xe_force_wake_put
>that can be used as a destructor for this class.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_drm_client.c | 52 +++++++++++++++++++-----------
> 1 file changed, 34 insertions(+), 18 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_dr=
m_client.c
>index f931ff9b1ec0..9deb258ba204 100644
>--- a/drivers/gpu/drm/xe/xe_drm_client.c
>+++ b/drivers/gpu/drm/xe/xe_drm_client.c
>@@ -6,6 +6,7 @@
>=20
> #include <drm/drm_print.h>
> #include <uapi/drm/xe_drm.h>
>+#include <linux/cleanup.h>
> #include <linux/kernel.h>
> #include <linux/slab.h>
> #include <linux/types.h>
>@@ -285,34 +286,48 @@ static struct xe_hw_engine *any_engine(struct xe_dev=
ice *xe)
>         return NULL;
> }
>=20
>-static bool force_wake_get_any_engine(struct xe_device *xe,
>-                                      struct xe_hw_engine **phwe,
>-                                      unsigned int *pfw_ref)
>+/*
>+ * Pick any engine and grab its forcewake.  On error phwe will be NULL an=
d
>+ * the returned forcewake reference will be invalid.  Callers should chec=
k
>+ * phwe against NULL.
>+ */
>+static struct xe_force_wake_ref force_wake_get_any_engine(struct xe_devic=
e *xe,
>+                                                          struct xe_hw_en=
gine **phwe)
> {
>         enum xe_force_wake_domains domain;
>-        unsigned int fw_ref;
>+        struct xe_force_wake_ref fw_ref =3D {};
>         struct xe_hw_engine *hwe;
>-        struct xe_force_wake *fw;
>+
>+        *phwe =3D NULL;
>=20
>         hwe =3D any_engine(xe);
>         if (!hwe)
>-                return false;
>+                return fw_ref;        /* will be invalid */
>=20
>         domain =3D xe_hw_engine_to_fw_domain(hwe);
>-        fw =3D gt_to_fw(hwe->gt);
>=20
>-        fw_ref =3D xe_force_wake_get(fw, domain);
>-        if (!xe_force_wake_ref_has_domain(fw_ref, domain)) {
>-                xe_force_wake_put(fw, fw_ref);
>-                return false;
>-        }
>+        fw_ref.fw =3D gt_to_fw(hwe->gt);
>+        fw_ref.domains =3D xe_force_wake_get(fw_ref.fw, domain);

I think we should use xe_force_wake_constructor() here, to future-proof
this for any modification that we might decide to do in the way we force
wake CLASS constructors are implemented.

>+        if (xe_force_wake_ref_has_domain(fw_ref.domains, domain))
>+                *phwe =3D hwe;        /* valid forcewake */
>=20
>-        *phwe =3D hwe;
>-        *pfw_ref =3D fw_ref;
>+        return fw_ref;
>+}
>=20
>-        return true;
>+static void drop_fw_if_valid(struct xe_force_wake_ref fw_ref)
>+{
>+        /*
>+         * If force_wake_get_any_engine() fails, there's no real forcewak=
e
>+         * reference to drop, and fw_ref.fw will be NULL.
>+         */
>+        if (fw_ref.fw)
>+                xe_force_wake_put(fw_ref.fw, fw_ref.domains);
> }
>=20
>+DEFINE_CLASS(xe_force_wake_any_engine, struct xe_force_wake_ref,
>+             drop_fw_if_valid(_T), force_wake_get_any_engine(xe, phwe),
>+             struct xe_device *xe, struct xe_hw_engine **phwe);
>+

An alternative approach could be for xe_force_wake.h to have:

    DEFINE_CLASS(xe_force_wake_put_only, struct xe_force_wake_ref,
                 xe_force_wake_put(_T.fw, _T.domains),
                 fw_ref,
                 struct xe_force_wake_ref fw_ref);

Then, in this file, we would have something like:

    static void show_run_ticks(struct drm_printer *p, struct drm_file *file=
)
    {
        ...
        ...
        ...
        ...
        CLASS(xe_force_wake_put_only, fw_ref)(force_wake_get_any_engine(xe,=
 &hwe));
        ...
        ...
        ...
    }

With that, we wouldn't need to create custom classes for special one-off
cases like this one.  What do you think?

PS: I also thought of using a DEFINE_FREE(), but I don't like the fact that
    the variable declaration would be explicit in the middle of
    show_run_ticks(). Using DEFINE_CLASS() we can hide that.

--
Gustavo Sousa

> static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
> {
>         unsigned long class, i, gt_id, capacity[XE_ENGINE_CLASS_MAX] =3D =
{ };
>@@ -322,7 +337,7 @@ static void show_run_ticks(struct drm_printer *p, stru=
ct drm_file *file)
>         struct xe_hw_engine *hwe;
>         struct xe_exec_queue *q;
>         u64 gpu_timestamp;
>-        unsigned int fw_ref;
>+        struct xe_force_wake_ref fw_ref;
>=20
>         /*
>          * RING_TIMESTAMP registers are inaccessible in VF mode.
>@@ -340,7 +355,8 @@ static void show_run_ticks(struct drm_printer *p, stru=
ct drm_file *file)
>                        !atomic_read(&xef->exec_queue.pending_removal));
>=20
>         xe_pm_runtime_get(xe);
>-        if (!force_wake_get_any_engine(xe, &hwe, &fw_ref)) {
>+        fw_ref =3D force_wake_get_any_engine(xe, &hwe);
>+        if (!hwe) {
>                 xe_pm_runtime_put(xe);
>                 return;
>         }
>@@ -360,7 +376,7 @@ static void show_run_ticks(struct drm_printer *p, stru=
ct drm_file *file)
>=20
>         gpu_timestamp =3D xe_hw_engine_read_timestamp(hwe);
>=20
>-        xe_force_wake_put(gt_to_fw(hwe->gt), fw_ref);
>+        xe_force_wake_put(gt_to_fw(hwe->gt), fw_ref.domains);
>         xe_pm_runtime_put(xe);
>=20
>         for (class =3D 0; class < XE_ENGINE_CLASS_MAX; class++) {
>--=20
>2.51.1
>
