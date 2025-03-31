Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD06C3600B
	for <intel-xe@archiver.kernel.org>; Mon, 31 Mar 2025 14:52:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB07510E0BC;
	Mon, 31 Mar 2025 14:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wupi84D5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E14410E0BC
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Mar 2025 14:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743432737; x=1774968737;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=S0CbyVFgGqdQSVuQHl9DjJfEQioT+LBICfwdK7K7ODY=;
 b=Wupi84D5jyTzOtnUevBrBcQj9EVvehTWya0z1PDFYIbxSIMLriec8DOh
 8liO/FG2pkIdMlrbJeZFUIOaH6TWPAfshXRA+mUfGkcekHVffBReq3Y7F
 y6SQVWoiT0YBHg/wTCqjxXKJig9TMu2gIHsjfkyuI5y6uRdEv+CtJxf4J
 BogD7WE9s6p3OFmEUHZGvyWAcOKPQ9iRfu5rL/Q4nJqUwo8k0jX9uEait
 9O4Q/HKM256wbc4YD7GTvGFmoE6+/RdPqv0OsySw/RfKvJ4Wh3YGFu5eT
 ca+m6w6Vbi7fkhdLrBU+VIyhI4ZTeHVyXWdMhcoJb6MkhlQwYBuBv27gM Q==;
X-CSE-ConnectionGUID: 2YwfOIyzQ9mJ+6lmax6ZGA==
X-CSE-MsgGUID: dcC/PsKWRmazrn7eox3wVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44879211"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="44879211"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 07:52:17 -0700
X-CSE-ConnectionGUID: dA64v7hSSPm+hXBCNKGzIw==
X-CSE-MsgGUID: +W2hTuPBTLicBsrRfA8BbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="131326627"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Mar 2025 07:52:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 31 Mar 2025 07:52:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 07:52:16 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 07:52:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PUjrcv5eik5cqJ/D3ri8vY9rAwovQkopv33gBWhItP4uyjEpcaNyXpm4KxRjD6nAftInTIQVcq3qA8XrYtOW8eWXIM1JKUBt9TfBCA/rzgE/ahiAoNV3LR0wuvu/ceAnWTKCouTVA0umzqKLa3ZsRN2ujzEw2I20S/E6bWqwvImiMspS/+yQiUIKP1JG+4tl1UOlFYR2mMaCOwEcmqCh8MOfuilgER1hIB2kB/ykfkVy9LQkFEPZI0/RdNBid1E0j0R+TM5TWPt+aBzquWe9xgMc3n42hiNEXrs3pMExC8bgFH0xGadSsRtd1BK0a5hHzTZ2t/7a0+I0/B3i0wOCfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S0CbyVFgGqdQSVuQHl9DjJfEQioT+LBICfwdK7K7ODY=;
 b=qcRwoYq2lwQzFQ4SaW0lwD80LZI4Q/U9XI/R4hdIxQm5RK7kwTZEuVhTHw2VdZDmxHd8tT01/UmqNZg4hCLszwlo3jJw+gZ+RZ+oj8/Zea44R9d1QbnatPT4isG0/aNKsU9dOjy5EHVskJ8bsufRGyTbLx8bTHJaJ9Q/7O1pLOyRGiLg4ODZXkoU6FR4JKu9EaQ53hJ2+OpERqsOyWc/1iIHAyNcJJc56ekSFvPd4HZ+cQ5D5LWXwQltgwLklVaOdydOCag02iRzJfY5dfIgN3SFvmK1VZ2AEbMhxy2pEjLJNy4WfESeFVXVg/n/t37EYudYYCUAj/Xdgf5G4NyN9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 LV8PR11MB8771.namprd11.prod.outlook.com (2603:10b6:408:206::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 14:52:07 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%4]) with mapi id 15.20.8534.045; Mon, 31 Mar 2025
 14:52:07 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Don't print error about hwconfig when using
 execlists
Thread-Topic: [PATCH] drm/xe: Don't print error about hwconfig when using
 execlists
Thread-Index: AQHbn/gPvEBg7QAAAESIpx2ib2KlqbONUKWAgAAIWwA=
Date: Mon, 31 Mar 2025 14:52:07 +0000
Message-ID: <7cac5e7d8a77487fcb0287d5d9022f89499a65f7.camel@intel.com>
References: <20250328154236.9216-1-stuart.summers@intel.com>
 <174343084156.2072291.17379551811561190764.b4-ty@intel.com>
In-Reply-To: <174343084156.2072291.17379551811561190764.b4-ty@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|LV8PR11MB8771:EE_
x-ms-office365-filtering-correlation-id: 35322e8f-f715-4dbd-df59-08dd70639bc2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YUI3R0RNaFNDTWlVc0VheEZuZDRuY2pUeFdVamlwOTU1RnI1dThmY0Z6ZXpW?=
 =?utf-8?B?OU5kUzFzUlFDUDR0K1RUdXlGSkVXcFJQb0ZHRGpqZjBRUkxoOWJiTmdaYzlZ?=
 =?utf-8?B?TG1EckJwWjR3Q2FscWVEVHFEd1Y4QUtHZ1o4WFJhaWoxNUpDMVNrKzdSRk9Z?=
 =?utf-8?B?WWh4U01VbTlNVXZ6TWNGZ0lNQ1pQOXpOUEQyNStvRmFYb25BZWRvUEd6dkhy?=
 =?utf-8?B?QXZOMlp6S21MTGJLdmVESjRjKzBOOTA0M1RxVk1zdnp2UkI3U1V2UCttVG9o?=
 =?utf-8?B?OEtOd0pPRFVwQ3I5RGNCZW15UThWM1pvWk8zMGxDVmQwYXZVbndzZ2NiRlVp?=
 =?utf-8?B?aVBsbktPNjRJRzE1K1pwS2xGWGRHN1dkcHdIbkxUY0tKY3lQWmVEangxZkdO?=
 =?utf-8?B?OVo4akNrbXRYUFpOdEpoZXBlaGoyVk5IRVpmVEtvSkt5VmlPYmwxUU9iSGxl?=
 =?utf-8?B?TWo4VklCVE5HbTRBVWU1OVh0Um1SMnlPTTRvdVFRdzg5bTRkMGJpd3VXTGgv?=
 =?utf-8?B?blpNdFR2Rjc1ZzRrTm8wU0VSV1dnbkFJUndpOEZvZ0lwSUk2T1NvK2RiaFg5?=
 =?utf-8?B?aDZEMzJERENMcVM2T1RldTVJaHg2VzB4S0ExTWVVT3NVb2ZnY2p2TDV3aVlR?=
 =?utf-8?B?ekVuajFhNVJGRmplZDA3U3ZYWi8xV0JDeFA2R05qL0Voc1ZvRWVURk1XU2JG?=
 =?utf-8?B?dEZXNjJNV0kyN2dzT08zQ3FlNmZDTXBGWnh1djliSEJVZnhoQldkV3d0MXdo?=
 =?utf-8?B?VzIyN0FuQkYzazhEbnI2L0JQdW5VS2VyR3pRTFNpZEtrVmpwMC9GRDRNbGZF?=
 =?utf-8?B?aHNBYUhMMlA0SVdaYUluaE8rVTZ6MkQ1U2xISTFmdzFIVjhCL1huWmFodis2?=
 =?utf-8?B?MTI4WFRZbEd1SFFkeDFRY1A0cnluTUkvV1BoRUlUQVBkbFZNVEhLV2dSZUsr?=
 =?utf-8?B?THRnTEhGSy9ZVTlWdmQ5eElZaXlBaC9LNFlieTIvRlpybTdKdHRMbG1KckRX?=
 =?utf-8?B?bkM2VXM2UEQ4RWN6M09HeEx0djNobFFNck92U1ppRHhobVg1d1ZYcnZWS0hy?=
 =?utf-8?B?ZjF2U0pmaks2cUkwaFgzVFhFenlTbFBkdjA4elc0V1JaaldPRVpkZ3RIZFpZ?=
 =?utf-8?B?MFZnUkdyenBWRDNwNFZMb0pwTlZ6RGFQSCszWGNvendyWmk3aUtKYkU1bGk4?=
 =?utf-8?B?cFRyMHJSZElFQm9TbFJkWlI2WVRYOXpLZWJ0dy9POGpsUkZqcUdIOVZ6T0xx?=
 =?utf-8?B?Q2F5TmNxRWdrYlZGSHN5RVo4MHIyOWZJTkVXekxlaklyVFZzbCtHMmsrUGFa?=
 =?utf-8?B?a3N6aWpFV0FXR3NRU08wUXlEYzdlVllLZGNoZk5LeUU5bVcxVTE5TEMyN1dF?=
 =?utf-8?B?Y1hWUDZNLzRINWVVYkkxRGVyay9iUG90cER2TFdMVEhZcnFod3hWU0tOZksr?=
 =?utf-8?B?U0VZM3lFdkp5bENFemxod01MZ2k1TmVuUTNDd3BudXk3VENPNXRMT2t6MUV4?=
 =?utf-8?B?VndpZDdRKytnN09RT0ZjS20ybUZtQTgrUFZ0RHJtWFNoMVh1b2ltbzZmdUtz?=
 =?utf-8?B?Sm9mZmQzeU1oWG1vZnE3SFN4b1ZCTTZXaFp6SCtUMys2VndMVDVrbzBLSmFH?=
 =?utf-8?B?RVUybS9TaE10b0pTL3B0ZlVpOVNZTE9lQ0M1RVRSRmVBK0FUVWlwSzNubUQ5?=
 =?utf-8?B?YXQ5RkFKeHBFVFpMYUo1b1liK29wNXFzSEZkcWQwSXdrMDczejJZUGk5ZTUy?=
 =?utf-8?B?M21MM1o0ZzdsQnFNU2MzWnJEMGI3Nms2aXhqMXlWQ1ZXc25HYTZwZm8zOUFY?=
 =?utf-8?B?NGdtZ2k4N1ovL21VRkZQK2o0Z2xSMEYvRGlCbFVOZGwyMS9vekttMkQxSktP?=
 =?utf-8?B?TkNQSjREUlkyRHNGby9IVWE5VXpNSHRlODBCcEdzQ3F4dEQrSGNlNUs4bHZI?=
 =?utf-8?Q?7SxccfxHMK8GJlPj2LP4XqnfPx0oOckj?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Sm1aaDFLS3J6cjMxd0VpNjhoQVJMdHJqdUUxck1RL1NQQWZ4WmpZMHRnTEIz?=
 =?utf-8?B?RitSRTBlZmZwZmJsVzQxVk5IT0dQd0NSQm0ybFl5eUZHSTN5emlLTi9VMHph?=
 =?utf-8?B?WVNLMVJiQUJMQ2EvK1ZzeHpGMEloOFRnUXo0SnViWi9BT2Z3Q0lJd0dXOEFn?=
 =?utf-8?B?cytwalkvQTVCVE1HdW4wVThlNHRieXdLTVBreGhVaTQxTmlidGlsakNTQ2tG?=
 =?utf-8?B?dEVEeFZFMU9SdGxZU3VpcVJyN00reDJKVWw5ei8yd1hvMTBic04weUpCU0Jk?=
 =?utf-8?B?S2RxS2x6dnBNdU9iNk1WaGN3TUV6TW5PNWMra0ZYaThPeVhFVWlxN3VHSTJK?=
 =?utf-8?B?aU5PNlI2eVBsZXJXa3FTU2NPY0tvMmpjNU5UQmFiSisvaXAwczB0aTE3ay9v?=
 =?utf-8?B?aysrRHp5Z0ZRTGpuVmJ1cWFYVGVpNlFMamJkUFFhdmFDeGZ6cHk1aDE5eVFM?=
 =?utf-8?B?L2hYYzV3TTB6NkNiQ2xyWVlhMmM5V2ZXV1FiOGFKc2pXdXJMdHUwWGF3WUN0?=
 =?utf-8?B?S1g3aVZrbFhGTml1SUh0SCtDOWx1MUw2S3RudHZHbXpmRG1PcG1VNE5UMmdX?=
 =?utf-8?B?NlFKd0RyTmRqQVUvakk3aVBrTzd5MG9TaXVyRWJXLzhHQnBTK2dvMEMxZEtB?=
 =?utf-8?B?RDVQaTlZTjBvZnJSM2VFZkxzem5VWHhreG1Zc2d1SnN5UG82NEloZGxYUEdI?=
 =?utf-8?B?d1RqVFF5MjBIZUFGaDhpaVpqdlUxYXhjdVpWWWEwYk1tcllpTFRMQXNzYlBT?=
 =?utf-8?B?YnNlYnZzUFJ5aUNPMUo2a1JjcFNIYzBOaXNUcVA4TVE3VFRYVWFSaXB4WGpM?=
 =?utf-8?B?RUdlbkVLM0grTTBtL2pFQWp5Q01FQlkvWFhtcXZFZVd0WGNxTjAzd3dYNStZ?=
 =?utf-8?B?S2t5THh4YzVSWU5FamlFTGNrTTNxejNWelpDaUlVejVzOXQ1clYzeFY3bjNv?=
 =?utf-8?B?dktqOEtiNGNkNnJnT2oybVpIVTlvRWdqbVp0QlRCTWVOd2pKcFFjVWxycFBY?=
 =?utf-8?B?aGg4NTEzR2g2b3ZVQ1p2dzFJVDFBckdMK0NIeEc5YnNoT2JBZ21JTHRBTzhl?=
 =?utf-8?B?UjEwSnR1MTVqOEp6TmVnVHdSQktNZExGRWtVN2FUdUdPanFyUm1acUdDT2RK?=
 =?utf-8?B?ZytqWWpRRHEyTnlLUjlQOFNEUVBiR3dFdm91NG1nbW9zUEc3aG11cllISjNo?=
 =?utf-8?B?L1pEbmo4dVQ1WHY3eHZ2RllEYzZ5c3k3UVFaVXYwemhnMEw2ZUkvazRhUDJZ?=
 =?utf-8?B?NWExWmI5aEZnRTV3S0MrR1hrdTJIN25rVWp6KzVSVlZtOXlLaC9YcVA4OFo1?=
 =?utf-8?B?S1RvYmRpZE1JVXQzSElIUkhQUVA3dzR4Yy9iYUozWlAybFowOFBIaVZFSzAx?=
 =?utf-8?B?emNqR2NLU3N3T21QUWxMSVhMWDNuU2E4Y0E2Skx6ZHMzRVJaTUZtcDRycUUy?=
 =?utf-8?B?VjBOREx0N3BERGszUnFIQ1ZiMHhVY2hVbklVYU9IY2J4eUdEUDZCb3MwVU5a?=
 =?utf-8?B?QWZUQjZwUmN2dFZtc1M4YXR6QWhQai9YSks4UTZjaXZ5SXkza3NtZHNnUHNh?=
 =?utf-8?B?aFBGSEJVWDJ5Z0d2WFBKRTFXNm43L25sWlBSSmF4QXJSUG9Qd296M3lnRWFZ?=
 =?utf-8?B?dUJHdUd5S0hUWXIxUGpuQ0k0U0FyaE9iZHNZaHNMeDVFK1BsYlFaWFY0RmNa?=
 =?utf-8?B?cERFUmhxd3ZndW5LaWFidWFJQVJwTjFnb0dWMWpKMTAzOVhwTWM5UU83ZFh1?=
 =?utf-8?B?Z1FhK05VaU5UUGJEbTQzWmJOY0xqdndXRW00YzNGdlVVOTl2WTJMR0RyUEtR?=
 =?utf-8?B?V0d4VHVDeWdLOUxRTHdGQUdUMHpGWWVQRk9iYVVlQ0ErQTFEL1RtekxLQUYv?=
 =?utf-8?B?eWpOaGVmUzdLcTFQQnhuUERqL256c21sakRDL21ieG1QNDNkLzZVYko4Mng1?=
 =?utf-8?B?R25pbFBkUm5ReWpyejkrQmp0cC8rQ2gyUGxidWVvOFFqaDY4dC95OWlJSGZC?=
 =?utf-8?B?S0FSTmFiNktWZ1lBdWxhTy8xVHg3Ky82SlJkWDBiMU04L0w0cU1xU2V2QUFt?=
 =?utf-8?B?SnBwcG1pVEYxWFVKeEgxQVExdUlZTU9LM1dtT2JYTnJGVmdmSzNzV1FtbUxC?=
 =?utf-8?B?OG0xZmZMbE1ONmpBN2xRSlZGQUQwV2hpemQ2TWc2QVRnZXVVVVVKeVhDRVZh?=
 =?utf-8?B?RUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <78F331EB3EA9D844AE384EF213099565@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35322e8f-f715-4dbd-df59-08dd70639bc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 14:52:07.3561 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gxKSrXJFhuLI32iyokeCkTbLu8xVQ4vJTe8comkuObsuGvmxGk4VYCJjh8rIxl0TI70wXYd7JzGrXm8smb1GpJjYLeCoZK+bW5+Tggc6Wp0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8771
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

T24gTW9uLCAyMDI1LTAzLTMxIGF0IDA3OjIyIC0wNzAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IA0KPiBPbiBGcmksIDI4IE1hciAyMDI1IDE1OjQyOjM2ICswMDAwLCBTdHVhcnQgU3VtbWVy
cyB3cm90ZToNCj4gPiBUaGlzIGVycm9yIG1lc3NhZ2UgaXMgb25seSBhcHBsaWNhYmxlIGZvciBw
bGF0Zm9ybXMgdXNpbmcNCj4gPiBHdUMgc3VibWlzc2lvbiAtIHRvIHdhcm4gdGhlIHVzZXIgaWYg
dGhlIEd1QyB0aGV5IGFyZSB1c2luZw0KPiA+IG9yIHRoZSBwbGF0Zm9ybSB0aGV5IGFyZSBydW5u
aW5nIGRvZXNuJ3QgaGF2ZSB0aGlzIGluZm9ybWF0aW9uDQo+ID4gdG8gcHJvdmlkZSB0byB1c2Vy
c3BhY2UgYWJvdXQgdGhlIHBsYXRmb3JtLiBXaGVuIGZvcmNpbmcNCj4gPiBleGVjbGlzdCBzdWJt
aXNzaW9uLCB3aGljaCBpcyBzb21ldGhpbmcgb25seSB1c2VkIGZvciBkZWJ1ZywNCj4gPiB0aGUg
dXNlciBpcyBydW5uaW5nIGF0IHRoZWlyIG93biByaXNrIGFuZCBzaG91bGQgdW5kZXJzdGFuZA0K
PiA+IHRoZSBsaW1pdGF0aW9ucyBvZiBydW5uaW5nIHdpdGhvdXQgR3VDLg0KPiA+IA0KPiA+IFsu
Li5dDQo+IA0KPiBBcHBsaWVkIHRvIGRybS14ZS1uZXh0LCB0aGFua3MhDQoNClRoYW5rcyBMdWNh
cyENCg0KPiANCj4gWzEvMV0gZHJtL3hlOiBEb24ndCBwcmludCBlcnJvciBhYm91dCBod2NvbmZp
ZyB3aGVuIHVzaW5nIGV4ZWNsaXN0cw0KPiDCoMKgwqDCoMKgIGNvbW1pdDogYzRlYWM0MDM1MTk1
MTJhZWYxMjI1MGNiOTNlYmZkZDA5NjZkNzZmOQ0KPiANCj4gQmVzdCByZWdhcmRzLA0KDQo=
