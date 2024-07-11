Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6167C3DA41
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 13:35:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E1CA10E2AF;
	Thu, 11 Jul 2024 13:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bq0MoM+l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2049010E2AF
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 13:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720704948; x=1752240948;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/Ht30CG4XUUgv3mgs7I7FewVIipx6jcQpWScBYBxRWw=;
 b=bq0MoM+lb8KoUBbQAGFBZ9DsLRxYVpqxIRHv9qBg+zkbG+JPCdiTD61E
 Pl9RoWpsrXd1NvtwEEVNKHNO1rcGYEAaICNf70Ugg4lfCmhTeBjMoeol4
 GdFH5TVohcDCXb3Iw8iJxnPOATlqmk3h44METsiHEpIQ8UCl3TanX/NWz
 BSJwtaXIie2PJX5ozMH2u62LWjQdt5Ymcbq9H3zJ8kd1br+l8FuDn31AG
 C9FXhbYg5VCuypRFWA4I/i9woKpTrn35xCiQ0QIM/XP45z8vI6sHro8XW
 RAyRnH7qcDJCMVD8fl/XiY9a4zBeVkqLt2Zz7C7RHCXtxgLQeeYsytxDV A==;
X-CSE-ConnectionGUID: FT8X/LKSROq2i4mGZJrjtg==
X-CSE-MsgGUID: Eg7+rg3JSo+g1PSWwUx9sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="29487734"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="29487734"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 06:35:48 -0700
X-CSE-ConnectionGUID: KM030yvlQdSD1tnadi89jQ==
X-CSE-MsgGUID: m4pyR4ZZRX2OKTzJmNBvQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="79692621"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 06:35:47 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 06:35:47 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 06:35:47 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 06:35:47 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 06:35:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nce034WNygFx+6xUvdXsxduk38itdwaZyMs7VXWNnGvl0/O5BYTXUl/j7gMQWU0BRtIEPLhe5SJRShpmlaTPx4Rl5GRrfWVoy/UVlEROW6TTwFFq/vOJZ5szBQY/5/DWSjqzImRIEGQeMwLIs/TaRGdrLK1Xe01AODIxCRuhwEjdxnZFy26mIAly9EZR8Aki8UI1h72XI8I5jJlJpuwWrd7GnoPLk27VLAiA44bnCsq1ykGnFTT3wVRCVhtC1ZcGz5cVuNQf+/pd8FPJIGUSb64cFz4rv27X11eFq9RlSWFYWYXBYPpxBSnGIOZYO/PbCVGtS5ttGZitWNPfVhcBgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Ht30CG4XUUgv3mgs7I7FewVIipx6jcQpWScBYBxRWw=;
 b=MeS09SFOSa29klk++PyXMAyRi159VN4oji52RABg1L/LTkups9wqy7uRaTphnaFrCqXu+O2uNz0CsjoXWr+KnMHoH06QFOffwD1vYANMNaZKwDK70SevK0h7LHh9lrabuFr2xoADYW1qhOVXFG6wMvcgyB8HcFDxmf+lYPPzw3QvNi1lkWkDetV3yagBUcHfanEXx8SlsqmAlijjjVoXz8s5D3pOez0yEwIDBP2UtZyslw3FaFbghNVmRtErWM8vRHuOVmSP62t4qfvPrklk6s3mDrtdTfsxs4KxHIfiOpDjSecAKeJH0BKNp4GW8YkEHgQi/NRxqqKxpLoC0zE/+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SA2PR11MB4827.namprd11.prod.outlook.com (2603:10b6:806:11f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 13:35:43 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%7]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 13:35:43 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe: Add process name and PID to job timedout message
Thread-Topic: [PATCH] drm/xe: Add process name and PID to job timedout message
Thread-Index: AQHa0xCe7KB74BYc2kWreqDTEkJTLrHwn0mAgADpB4A=
Date: Thu, 11 Jul 2024 13:35:43 +0000
Message-ID: <03e127ecd193ea405a15c144f3adcccc226fa0bc.camel@intel.com>
References: <20240710213149.57662-1-jose.souza@intel.com>
 <Zo8cMyjffKq3mYJo@DUT025-TGLU.fm.intel.com>
In-Reply-To: <Zo8cMyjffKq3mYJo@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SA2PR11MB4827:EE_
x-ms-office365-filtering-correlation-id: 89147ccc-c07b-4d5a-f073-08dca1ae5d10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bVoyaDBhNzZMajQrdUZHVlNDeXRyTTQxZWQ3SXNtbDBmV1RmQXBpMVhKSDls?=
 =?utf-8?B?QkJWVXVYYXlmc21SNmRJYjg3TTkwdEduaVV1NzJEQlh2ZEZVdjgxaTRjeko4?=
 =?utf-8?B?R0REY3V1OE1qajlhQXNvWUpqL0ZOVnFFZytGbDFoOHV3VDZoY0dzaHNxMno4?=
 =?utf-8?B?U1ZoNVpTNnNnV0JmRFhvQ3BWMDlJTVA5MlY4R2d0Q3pML1lUM21xalNIUlB6?=
 =?utf-8?B?b3pTU2MvVHZsbU92R2J6TjBJL3ZYWXlNNXN4UEt3a2VZS3h2OEoxZDRIcjVk?=
 =?utf-8?B?eHk1WEkweCtJVFV4UTgvQnVWREFGTm5hSUJQVmJxRmlZQkEyc0pxZXlBaVlS?=
 =?utf-8?B?a2hrRm5kbDJ3N2UxR1ExMFFqWWxwTno5UDhFeWNqdUxkeG93SkxXY2k2NDYv?=
 =?utf-8?B?TU5VUkVKR0hZcU9UTU1sMzhxcWlRaGtmWUI3TWRpYlZGaEFhNmdvbXR6UkUr?=
 =?utf-8?B?aHFLYjNUTWgvRVdVaDJvVGtBTStYeCswaFJ1dkZjN0YydUZTTDE4cW5HNVpO?=
 =?utf-8?B?QWVPQW1QYTdBMldobGhuMDZLSXVQMzBsM3pBUTJ6Wm83NmtEZnZjZmgzaG5t?=
 =?utf-8?B?V1ZZRWNWNnlITXJTaUU4K1lISGhSa0hOendCZU5Rb0RlWHVCZnJ1K2FtZXI3?=
 =?utf-8?B?ZHQ2NCtJOVZLR3Q0Ny9adCtadHJKajloSDFiT2ZiK2JwTlltK3kyZVpqZTZW?=
 =?utf-8?B?Y0RGTjhYSVIzbGJEYXdsbDdhWGQ2ZWo2Y2ZOandKRHhzcWVsaVQwWlBCQUJr?=
 =?utf-8?B?NU12YytlSXJORWw2UktVaEdMbUczSEFGQW1WZXRoUDczdWN0c0dHdG5GaENW?=
 =?utf-8?B?M1VrTFhCVnBFeml5ZHB6b3pYNGhVYjVBajI2TWZONEN4VnJYdEJnMmpKY3BZ?=
 =?utf-8?B?dndTOFVOUjJVWU9MS2plUi80WHdHbEpHa0tWQnVOVTZDdzFUdVFKQVJBS1JD?=
 =?utf-8?B?SzdGSzlQY0FqWXMyekQ0L3R0dmdzRzN4VkRUNHdEUk92NG40Szk0VWxtbUMr?=
 =?utf-8?B?MndaVEEvckJqTnVQcENFbEkxZ2h2MjFVeWN6VEtERkppRkZjUkJJSnVZZTFt?=
 =?utf-8?B?WTdtMjVZTlRpRXJKRFloNjlUNTRnT2RhSHk4dnFIU1ErZzRZaERZUXQrR1ZK?=
 =?utf-8?B?ZFMwekhzZ082aE5GTnFNUDFQWkJQdU9qZDdxNlB5WlJvbnJjdGwxVFR4ci9z?=
 =?utf-8?B?NjkrMituZERsTXNpU1EwQVVVM0FBOGRsekJXU2huYVE0THpoUS9FeFN6VUYy?=
 =?utf-8?B?MkdxMERUME5HYmNlamN6WmtQeGNnTjIxTHcvYlA0TlZPWlRTbEt4VUtpb09E?=
 =?utf-8?B?TGhJcVhNdC9KVytKYzlrNFdadGRHK2VPeWt5akpDZGdKYXRYZjNDQlA3aWg5?=
 =?utf-8?B?N2pZeW1WZUxmYjMrZ1pNbjdJdWI4YythVEM5akZEYjRlcC9iaUhJdEhKWnFH?=
 =?utf-8?B?UG1iYnExVG1FdEwzdThpT3NaL0tXRzNybG5xSkgrNVphWVI5VGsyaVJEQXdj?=
 =?utf-8?B?YWp4VmRaNENyRXErNVdSVUJ2MTVMUnFrdnNialVFdW03ajNjRCtBc3owWnYz?=
 =?utf-8?B?Vkl0UzhkaHkyaFYrNGNHRjVIaGFyd3BSdktpb0dicnEzM2RyemF1M0lBKzFp?=
 =?utf-8?B?MVJiOEFHOFZrYXhzR2JsZExmVlUvOGFFQXoxMW8xT0tDMGFnZFZEWEZVc05y?=
 =?utf-8?B?Yk9MQ2dxTDZVTWZPczZwcE0wczFQUW1wbHlpdUh6MW5EdjR1NmxFNHN3OS9O?=
 =?utf-8?B?RWJUUElBclhuOXBqdFFmczgrRWZIMkd5enJWZW9DRHRrZlYrdmxFQmFTNE5R?=
 =?utf-8?B?S212cDdUOTRVT2gvRkxmOTloMWxtOXlVaFFERDY4SSsyVzJlcDVZTkY1bnY2?=
 =?utf-8?B?MDRNb09KOUt1bDdNWjZlSFpGblNxdENjUVYvRGJxS2VqeXc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y1kvUFMyd1NRYmp5RVZFOXlpUFRYSG0xODdEeHpPaENvWFhWWVlkSjR5MDRz?=
 =?utf-8?B?cjdLZjB0eTNnM1FqeUw5OUM4aThCdHpUNmgvMWVOMzFWcnVhT2dsaTNTNTlY?=
 =?utf-8?B?azBqQjRiSGFja29GZ3N0M3ptMDhoUHk4dG1FL3hoSFBEdE0yUk9jaTJWajZo?=
 =?utf-8?B?T2pQZEtQWFZwZzROZGNqNzBTK3lmV1p4cGx5Y1Q5UWZlTkRyemcvYmJreDRM?=
 =?utf-8?B?eTVpYk1LYUhLYWdKeE1LVWxwd1Q5Tm9haDBmRERUZ1dQdVpmZDBYOUg5dFc3?=
 =?utf-8?B?bG9va3hxRUI5MDV6VUFyMHJvZm1aRGlkRVo4a0tCNXZDb3EyeW9OQnhGc0Fu?=
 =?utf-8?B?OTRETW1PNG9VdXlscGp4QlVzUzBRSXZTc3lFbWFKRFFpekFCYndYbkkzRDhP?=
 =?utf-8?B?Q2phcktVVkZpVXF0MzcwUFBieXRGRkhsaXRlS0g3Z2FvMzh1ZUFaRlNJbUlK?=
 =?utf-8?B?SHE0c1ZkMDVLdjlPTVlPb0JJeUdXbnovb2JWWFdFNUJPV0wxOUJFUkZjQ0lZ?=
 =?utf-8?B?L1R6U0RlUzBvM3NVVUFXamVIaitEemVJUnVmWjN5R0RDWGM5SXg2OVhSdTF1?=
 =?utf-8?B?aEZSZUxuTDIvajk5V0JncEwxY2ZCN0pLdHk1MDdFS3hjc0JHclFWVGNheGxx?=
 =?utf-8?B?d2dLQm1maDFCaGhkWEVnS09PZUsrMHZGdTJaakZseE9BYUxMcHNLWHRuNTA2?=
 =?utf-8?B?cHNKM3VWMGRHbHJrWXUrTjUzOTRjR2wzZi9oSVVZK2xVRXllMU9zVFlzSWFp?=
 =?utf-8?B?R2l1WVdzaXgzc0NEMXh1dGpiY1BTMjFhSUxjRER5dm13RDRmQUNCUkwrUDRz?=
 =?utf-8?B?SkRNcjBLeDY1bHUrWldQWnFTTUt3YWFHbFczYnByM0xMbmV5N1V2bWFBRktk?=
 =?utf-8?B?LzhLemF5bmx2QjZaMWRhQlQrcmNyQ0dWMU9Qc2w2SDlFaHlqVzdnYUFiYmZK?=
 =?utf-8?B?bU42OG0rZ0IrMTVwZS9WUk1YYkpDU3NNNkZMTjBDcVl1eXFyRGNFKytOMEk4?=
 =?utf-8?B?Ri8zVUgyM0ZLOUdlbVBSNnkzeEhURExqOEVBTEZuajNRRUw3VGJ1TkFwNmEr?=
 =?utf-8?B?YThsUy9pbnpac3YzNUQyRW1TMWE2azU1R3dkSUdON3ZjankyQWdUajZmRFVm?=
 =?utf-8?B?L0pIcWxiTFJaNVZJSktPVXphMHk5TFRhM0w1SGRvVW0yWUZVUzgxeFE0R0Vy?=
 =?utf-8?B?aGJUQlJoRTN6ekNlb2lpc2JFWEl2WFozMEo3VWhTS1NETnRMR3ZSL2VxM3Nw?=
 =?utf-8?B?MWUxb0NTWFB4U3BVNEwycjJQNHM2ZFFYeTV0SjBnWld6a3pVNFF6d1VUNmJp?=
 =?utf-8?B?OWR0U3djMXdiWlRMSDcrcEw3M3ZCQ2dpTGVQZTI2dFJXaTJyQ2NKK3c4V0pJ?=
 =?utf-8?B?NzROMjdXRkZ2ZVVKbklkU2lLOWY0V2RRODF4YndGVkxkYWQyczJzN3RxNHJX?=
 =?utf-8?B?QUdDTFNQRlQ1WmtscXU4YkRoc1JWZVh4SE9jK2tiVjQ3T3A0WVZCcldPQmw3?=
 =?utf-8?B?TW0yaEJBR0NZc1ZSWnN5V3V3ZC80d2xvMkNTeHFGUGFrNHAwd3Z1R25zTXNm?=
 =?utf-8?B?c3VZeGZhSEZrTDF3SEFuMStCY1lodTkxT25XYU05TUxKUmorY00vUGxQa3Mr?=
 =?utf-8?B?ZHhmTkxKM3ZYWFcwbTFPYzlldy9uVXRXS2h0LzVBYWwxZHJtbHcyaE52T3Fv?=
 =?utf-8?B?amROMy8weGlSYVIxMmY3TncrS0VQVXdnQmhabDd5OElabXl2MmZUeG9mK2Vi?=
 =?utf-8?B?eU9MQ0xuckZmc3dBdTJMRGYvbnJKdlpqSUdzcTA4akNMczBLaldxa09qajlK?=
 =?utf-8?B?U1F6RFBiS2daZTBLWHJyamdLZXBBd2NBNDhGbEd0VFk5T1ZhVnpkVUQ0Z3NM?=
 =?utf-8?B?YnFZS1F2NU1qVUh6VUpZTWJPMmoyR2Y5Q0d6N1p3MytFR05OZTU4bmtMZEhk?=
 =?utf-8?B?NHhlTVVSd0h6aVUxNXJXVXBKbUFvYkg4MmdSZnFGN3ZhWHZxZlNDZzBNeEZO?=
 =?utf-8?B?dkpiRTQ1RmxYeFhIMWRTYXBSNjk3SkJSVFRzdVg2VExsbmFUSWRhWTdsdmxK?=
 =?utf-8?B?ekFxanE4MXNuYjhHZnYxSHNGZ3lSVXo0WWJVZmRMZUxFTWREYVB2WUVsVGZ0?=
 =?utf-8?B?bWZjcGYvamplOE8yU0oyQzJ3QUJBYXhtNWRuWWs4M2VDRWdWVlh0YmNRMllX?=
 =?utf-8?B?OGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C344FE2888A969438FCB4D7816684FE5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89147ccc-c07b-4d5a-f073-08dca1ae5d10
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2024 13:35:43.7067 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s+2He0MIQUG8FldWNXOPzzX7muxWR1P2IJWXfFTrvt0YcmPRRSsBF/aq8cEvaa00keuHX+rdDL4JMLP+tD/qaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4827
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

T24gV2VkLCAyMDI0LTA3LTEwIGF0IDIzOjQxICswMDAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBXZWQsIEp1bCAxMCwgMjAyNCBhdCAwMjozMTo0OVBNIC0wNzAwLCBKb3PDqSBSb2JlcnRv
IGRlIFNvdXphIHdyb3RlOg0KPiA+IFRoaXMgd2lsbCBiZSB2ZXJ5IGhlbHBmdWwgZm9yIE1lc2Eg
Q0ksIHdoZXJlIGl0IHVzZXMgUElEIHRvIG1hdGNoDQo+ID4gdGhlIGV4YWNseSB0ZXN0IHRoYXQg
Y2F1c2UgdGltZWRvdXQvR1BVIGhhbmcgYW5kIG1hcmsgdGhhdCB0ZXN0IGFzDQo+ID4gZmFpbGlu
Zy4NCj4gPiANCj4gPiBBbHNvIHByaW50aW5nIHRoZSBwcm9jZXNzIG5hbWUgYXMgaXQgbWlnaHQg
YmUgcmVsYXZhbnQgZm9yIGh1bWFuDQo+ID4gcmVhZGVycy4NCj4gPiANCj4gDQo+IEFsd2F5cyBm
b3IgYWRkaW5nIHVzZWZ1bCBkZWJ1ZyBpbmZvLi4uDQo+IA0KPiA+IENjOiBSb2RyaWdvIFZpdmkg
PHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogSm9zw6kgUm9iZXJ0
byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMgfCAxNyArKysrKysrKysrKysrKystLQ0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPiANCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4gPiBpbmRleCA2MzkyMzgxZThlNjk3Li44
NjA0MDU1MjcxMTU2IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNf
c3VibWl0LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+
ID4gQEAgLTEwNjAsNyArMTA2MCwxMCBAQCBndWNfZXhlY19xdWV1ZV90aW1lZG91dF9qb2Ioc3Ry
dWN0IGRybV9zY2hlZF9qb2IgKmRybV9qb2IpDQo+ID4gIAlzdHJ1Y3QgeGVfZXhlY19xdWV1ZSAq
cSA9IGpvYi0+cTsNCj4gPiAgCXN0cnVjdCB4ZV9ncHVfc2NoZWR1bGVyICpzY2hlZCA9ICZxLT5n
dWMtPnNjaGVkOw0KPiA+ICAJc3RydWN0IHhlX2d1YyAqZ3VjID0gZXhlY19xdWV1ZV90b19ndWMo
cSk7DQo+ID4gKwljb25zdCBjaGFyICpwcm9jZXNzX25hbWUgPSAibm8gcHJvY2VzcyI7DQo+ID4g
KwlzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2sgPSBOVUxMOw0KPiA+ICAJaW50IGVyciA9IC1FVElN
RTsNCj4gPiArCXBpZF90IHBpZCA9IC0xOw0KPiA+ICAJaW50IGkgPSAwOw0KPiA+ICAJYm9vbCB3
ZWRnZWQsIHNraXBfdGltZW91dF9jaGVjazsNCj4gPiAgDQo+ID4gQEAgLTExNTcsOSArMTE2MCwx
OSBAQCBndWNfZXhlY19xdWV1ZV90aW1lZG91dF9qb2Ioc3RydWN0IGRybV9zY2hlZF9qb2IgKmRy
bV9qb2IpDQo+ID4gIAkJZ290byBzY2hlZF9lbmFibGU7DQo+ID4gIAl9DQo+ID4gIA0KPiA+IC0J
eGVfZ3Rfbm90aWNlKGd1Y190b19ndChndWMpLCAiVGltZWRvdXQgam9iOiBzZXFubz0ldSwgbHJj
X3NlcW5vPSV1LCBndWNfaWQ9JWQsIGZsYWdzPTB4JWx4IiwNCj4gPiArCWlmIChxLT52bSAmJiBx
LT52bS0+eGVmKSB7DQo+ID4gKwkJdGFzayA9IGdldF9waWRfdGFzayhxLT52bS0+eGVmLT5kcm0t
PnBpZCwgUElEVFlQRV9QSUQpOw0KPiANCj4gV2UgZG8gc29tZXRoaW5nIHNpbWxpYXIgaW4gZGV2
Y29yZWR1bXBfc25hcHNob3QuDQo+IA0KPiBXb3VsZCBpdCBiZSB3b3J0aCB3aGlsZSB0byBoYXZl
IGEgaGVscGVyIGxpa2UgdGhpcz8NCj4gDQo+IHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzayB4ZV9l
eGVjX3F1ZXVlX2dldF9waWRfdGFzayhzdHJ1Y3QgeGVfZXhlY19xdWV1ZSAqcSkNCj4gew0KPiAJ
aWYgKHEtPnZtICYmIHEtPnZtLT54ZWYpDQo+IAkJcmV0dXJuIGdldF9waWRfdGFzayhxLT52bS0+
eGVmLT5kcm0tPnBpZCwgUElEVFlQRV9QSUQpOzsNCj4gDQo+IAlyZXR1cm4gTlVMTDsNCj4gfQ0K
DQpJIGRvbid0IHRoaW5rIGl0IGlzIHdvcnRoeSBhZGQgYSBmdW5jdGlvbiBmb3IganVzdCAyIGxp
bmVzIG9mIGNvZGUuDQoNCj4gDQo+IE1hdHQNCj4gDQo+ID4gKwkJaWYgKHRhc2spIHsNCj4gPiAr
CQkJcHJvY2Vzc19uYW1lID0gdGFzay0+Y29tbTsNCj4gPiArCQkJcGlkID0gdGFzay0+cGlkOw0K
PiA+ICsJCX0NCj4gPiArCX0NCj4gPiArCXhlX2d0X25vdGljZShndWNfdG9fZ3QoZ3VjKSwgIlRp
bWVkb3V0IGpvYjogc2Vxbm89JXUsIGxyY19zZXFubz0ldSwgZ3VjX2lkPSVkLCBmbGFncz0weCVs
eCBpbiAlcyBbJWRdIiwNCj4gPiAgCQkgICAgIHhlX3NjaGVkX2pvYl9zZXFubyhqb2IpLCB4ZV9z
Y2hlZF9qb2JfbHJjX3NlcW5vKGpvYiksDQo+ID4gLQkJICAgICBxLT5ndWMtPmlkLCBxLT5mbGFn
cyk7DQo+ID4gKwkJICAgICBxLT5ndWMtPmlkLCBxLT5mbGFncywgcHJvY2Vzc19uYW1lLCBwaWQp
Ow0KPiA+ICsJaWYgKHRhc2spDQo+ID4gKwkJcHV0X3Rhc2tfc3RydWN0KHRhc2spOw0KPiA+ICsN
Cj4gPiAgCXRyYWNlX3hlX3NjaGVkX2pvYl90aW1lZG91dChqb2IpOw0KPiA+ICANCj4gPiAgCWlm
ICghZXhlY19xdWV1ZV9raWxsZWQocSkpDQo+ID4gLS0gDQo+ID4gMi40NS4yDQo+ID4gDQoNCg==
