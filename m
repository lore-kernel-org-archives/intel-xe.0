Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0815C25B78
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 16:08:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB5D10E2E4;
	Wed, 22 May 2024 16:08:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RdxSOKDW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7C410E2E4
 for <intel-xe@lists.freedesktop.org>; Wed, 22 May 2024 16:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716394105; x=1747930105;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=xqh3IKGkSGoGjQcPqO4pYEqDfpzJcZmWtQJb7UthIfw=;
 b=RdxSOKDWsZQGRt0cvGamp6xAHk780QOiT5zc8GzFdK51oVIW6Yb2V4Rx
 fQZ53uiNyP2bgLFLHbOhcrIuwuBgMLwQiEMJL5QYyp5LdwRdpr5RRmREY
 Dts/0ZgGIvBDb8K+O2yXuomdjcJXzKT3lRelSbxK6wOUfCyLD0e/k159h
 it1pAR7D59VDv9mJoKPDXnCH6rLx0yCykZDG0y2ZwYOTkgDuJsR+Iqrm6
 6/0RVDgylWKF+hqtR1BtNIvjiwNxl9koAwox5PJU1qseOGfsHAgI+skrA
 bTXDOD8cwiteI36e2REZmoPyXkFnTPaEMGlIVBZB+yLGuWJSPUHioKtiA A==;
X-CSE-ConnectionGUID: rCCLr4byQGeIaRDwpvl1DA==
X-CSE-MsgGUID: lVGy3XtVQICs++h573KrOw==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="23231633"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="23231633"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 09:08:24 -0700
X-CSE-ConnectionGUID: ETUwKz9jTS+0VsZBIENpzA==
X-CSE-MsgGUID: nQUwcsPDQZy3KXuw6mkQJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="33333265"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 09:08:24 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 09:08:23 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 09:08:23 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 09:08:23 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 09:08:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CG5l2Tgv3dPfsQsdzhXKssG//1wbGIYneA0GiOc3mRozX5sRJuBfYT21WU3uQ8GMUz1hUtqTNJSIBGFbD/JkC5mttnbTsTO0z7SwxtJs3bQogb66yx1Gab1TSuO46KjEGzYx+zQrCULCauD+ckwE874CsblezYXZ0EME0+8QcNCeHN9iF4QhXsDcR9JznIe8RMih9+24lKtSkQJywRg8DxJmI0BH1h06+IxbraAQ1NR8EuBLEGC3O04ux/2c4Hc5h1Yin9xp+BkR6wRNy8Ets7tKwFLSKoMDJ+bCHeC+gvwvXLMe43j5nmBigvo2geGw5qf97+P/2kKIDe8bddNb2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xqh3IKGkSGoGjQcPqO4pYEqDfpzJcZmWtQJb7UthIfw=;
 b=BSalUHkr1TWI8DIfoj3rJnfa93N5cJvFW5iv59vC2MwOjkYWTGN8sYtiEZt72gvRN+BYRJq4hmTY8C3IO4Qdfw+zPgcFic0UkjGFrTaZcND7bgW7+a435tolp/0iwVP3kwSbXIQ5UGEcDmcxL9mEEqWsK80+v29J7HJiYIabfFIXRtSxHqqUv+o0D9hr7z1OuypehfFVuJs29tcQhdzBHo/pcLaxnk6v5Y388EuIINvIJ8E6ZVvN4vY0O9hStqHUIiZl9pDqM9OFrolXdN0hGoKaG37Hh5eoEeFO31LXpVITJ4fwSxGcBP5sMmiJqxwpXqQS1LDRMrfEW+sglQBTxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ2PR11MB7575.namprd11.prod.outlook.com (2603:10b6:a03:4ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.18; Wed, 22 May
 2024 16:08:19 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%6]) with mapi id 15.20.7587.028; Wed, 22 May 2024
 16:08:19 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Landwerlin,
 Lionel G" <lionel.g.landwerlin@intel.com>
Subject: Re: [PATCH 00/17] Add OA functionality to Xe
Thread-Topic: [PATCH 00/17] Add OA functionality to Xe
Thread-Index: AQHadnkcIUwutN2VakWosatViFIW8bGcJwYAgAB1PYCABZE6AIAAAUuAgAAW/ICAAAV7AIAAA74AgAAPqACAAAZugIAADMWAgAAbGICAAAnjAIAAW5yAgADlIQA=
Date: Wed, 22 May 2024 16:08:19 +0000
Message-ID: <10fe79e987915dd334bd947aa923c71b1d38d441.camel@intel.com>
References: <20240315013518.2848986-1-ashutosh.dixit@intel.com>
 <438b276a653bf56fe1e0e131709d615dec86ae3e.camel@intel.com>
 <87frufuc96.wl-ashutosh.dixit@intel.com>
 <96d03111d07e8182e7ecb3c0ca1942c7fef22e6f.camel@intel.com>
 <595ea35d63cd92777b36f6ab87cd1f6483a4b38f.camel@intel.com>
 <851q5v2ljw.wl-ashutosh.dixit@intel.com>
 <8f86d8ea1d555e8261aab25bda0011ff96698522.camel@intel.com>
 <85zfsj15gf.wl-ashutosh.dixit@intel.com>
 <d7af155a3fa20d1e003f5c5ed3ca6abb839bda97.camel@intel.com>
 <87wmnnoxg8.wl-ashutosh.dixit@intel.com>
 <88aebb2ae768758273219f6097fee13d4984a726.camel@intel.com>
 <85y18229rc.wl-ashutosh.dixit@intel.com>
 <dc54f5b401cdf089da93c98b9b1148322ee4f392.camel@intel.com>
 <87v836wpfo.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87v836wpfo.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ2PR11MB7575:EE_
x-ms-office365-filtering-correlation-id: 4e880432-8a8e-46ce-bcee-08dc7a796580
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?TXRBZC91eFNSNjZvREo0OVFqdTd6bHVpVXRTOHBqNG93cVBjWEZ5TXpyR256?=
 =?utf-8?B?RUNxTWlhQktZVDhmUU5yZi8xekRVNHZubm1FbVNRM3hEVWFZUEJiS01hbFho?=
 =?utf-8?B?NXQ2TFgydzNHbktLaU5WVjBGVFpDNFNhbUVBTEFaSjNaSnFoc2JsUUErZjkz?=
 =?utf-8?B?Sy9ZWnI0OElpQWo2enpKM0pRTDVBc2Q3d3d0ck9UZi8veVBoeUZGZzFSU2ts?=
 =?utf-8?B?SXVCTTdDSDZ3ZVZwQlpXNDRyMExVeE9tMVlTcmZIbU1TOEZUdkc3eUtLalll?=
 =?utf-8?B?SmtrdGh2UGdmNjZjcEZvK0xJdkQ1YjVqeHY1STFPMmhNWnlhNVdFV0xmL0VU?=
 =?utf-8?B?RFAvUVRwUVlrQWtWUEFKNGxLTDB3NGNqekFTY3h6aEdwb09oZkJkWUVrclNy?=
 =?utf-8?B?Z08rT09Jak4xWU1iZ3ROdldSNTFOTzJhREhNQWFGTC9YZ3A0VUUvNXhlanF6?=
 =?utf-8?B?ZmM3Rjg1QlRZRG9uWG1oSTNnYXZhczVtSXJvR3o3VEZhUU9wWlhLbHdUUUVt?=
 =?utf-8?B?YkpzWG5mTm9TZVZFdHVSOUZGUkZaV2ZnNUJ0LzExKzBMYnc5RVZxM2lWdW9p?=
 =?utf-8?B?N3lvUlNSY1dzaTFuUWJLRDZlSXJSM25pemF4cVl5UnkwMjJYbzdveDNWc0lp?=
 =?utf-8?B?aXRPY00vY3ArQnpMVXVGTzJ0cUZzNy91eWIrV3BTQTFwM0dCWEhhRmNLMFky?=
 =?utf-8?B?Ni9HRWpoeklXZmwvbFNiMXJSd2tiVVNidy9FbnhWWjM5eSsxU3VQZ3A5MXVX?=
 =?utf-8?B?RThWbGRQR0hHMGQ3dGxlRHZ0LzRsc1pEelNLWG1qSGlpOGlHVHNJQ1VxMkgv?=
 =?utf-8?B?NjZlNWFHT3RTWmdqYVBWaXBHV0ZZVmppUlZ5SmdWSXB6VTV4R2pzNFhTSnVp?=
 =?utf-8?B?dDJvUFV6ditJYVV4MTQ2ODNnU1ZvVVlhRFhZaUtZR2xQdzhOSXdIYlBJc25Q?=
 =?utf-8?B?RFM3eGlaWUx2TXpjd0ZkQTBDcFJocnpQSlRLUDVsQkdpdnoyMWN4MTNwUVJo?=
 =?utf-8?B?QlFqbHQzdGlrYWRhOGFKdi9nbHNDU3pSVWdZUzhSc2krS2N5OUNKMXZWems2?=
 =?utf-8?B?UjBjSUNpeXlxajl6ZUduY2F6bVhac2xKYi8vbjNYR2JQeGYxRDVqL2twMm9u?=
 =?utf-8?B?KzFrcEdWOW1iYnF5UllHNzN5bGc1dDNKamJaQXNxcEw2VWR2L2ordnJIZ1RU?=
 =?utf-8?B?cjdoQUJGVS9aLytkSGNnOVZjT2wyZTFMS0d6RVhQNkpFMEhRMlAzdWFtMDBV?=
 =?utf-8?B?eENPNlZlbW1uWjQ3V2ZONGFtTXZPSm9OeXhkWWhGTjFpYUJBckVXVk5obVYw?=
 =?utf-8?B?QTFrS0FjL3FBMXdaSzBGVjBKK0J2RGEzdXVudkxLOFl4eVNTVmlMY3ZJV0sy?=
 =?utf-8?B?ZDlGeHBSeEVqSnNTYU1oV0R0R2xSd1NRY2tIQ1FNa2x6azZFN1d6R0xaQi9Q?=
 =?utf-8?B?OWI5YkExbjl0MGYwWjdtaTBvTnhYRzQ5NG9JWXFZTXFLMEozWU9peHhFMWRO?=
 =?utf-8?B?bXBsZjVRZ095dkZESWh6Ri8xUTZocVhIVHVvaU9MOUhJaHh4OG5CL2c1MUVH?=
 =?utf-8?B?bnlOejVhUkw2WnptdmgwOGgxNXE0ZmxCU2paNXpUdjVrVGo3bncxNEFBbzIw?=
 =?utf-8?B?VWVOTFhiK3c5eWpQMjRRUG40aWQ2SWp1cWRvZlZSUmxsVlZOblRoVmlBNVEr?=
 =?utf-8?B?R253MkRhUTF1dnd0UjBvK3dLamxRNVpTeGpVQ2l6UlJoSncrb1NCWFoxQUZh?=
 =?utf-8?Q?kuyB2JyU+cf/ELklcY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eFUwVTZDS2xSUnEzRWc0bG9qOUhybmtNQmhzZFlsbFNnNEloSTNVbk5VSFRx?=
 =?utf-8?B?WFFjSjlEYzFpQjJaenJMaUlJOXFadXlIOEo4M1Z1ZVJFMWsydVhhUm9WR0Rm?=
 =?utf-8?B?ZnBBRHJkM1Q1cnpiTHM5RDhxS0o1OVRrNVJRL09JSGV6bUJjam5DWktpVGxP?=
 =?utf-8?B?RnRBZkg5L1p4YU5PR1J1dVBEa3ppR0ZmUE9WbHFHZDJlSDhaTXoxakM1b2JQ?=
 =?utf-8?B?S3lHNFRvZFNZSzdxYUxVQml2QjRuL00wSmZpRWoyYUI2NWIrSkJhR3RSNzNi?=
 =?utf-8?B?SVl4VllhS1FLSWI4ZTZSZFUrZmhWaUlxaWxBVDVDQ3E0KzRFNEphVk84SWVs?=
 =?utf-8?B?T3k2M0VTdFdyU2MxaWdiU1c4TWs3bk9VQk9IWmozdEt4YjJOM0xtZTJON013?=
 =?utf-8?B?cXU0KzdJNzJvdU1QbUpWZy9vT1FMTFRvVVpDTlpqdUNwUnlkajMraDhkcWZ6?=
 =?utf-8?B?TjhUNGJsbUw4Z3FHVXk2ZXZkWitsbTBGTm01ajhNcEwwNlVjRGt1MkpJWi9k?=
 =?utf-8?B?aDZvaHBFd1pTVitWdmRCK09wSXdEV24rWFlWN1Q2Y1FkOG9EZVBMZ2VyRGF0?=
 =?utf-8?B?VjNjRFEyQXNPYWhVaDcxazRhUVpqNzUrYUQwMzZ6OUVIbURWanNkNVlpWURt?=
 =?utf-8?B?NTNESzNKdHdmWFBKOFQyYW5zWkxTeU1SMTNvSStsQlFJRytENS9IMHdFaW5a?=
 =?utf-8?B?T2ZzRk9mU1RXbEJFbWJYb05CYmtwdWt1ekxxQnIwQXpWelU0TkRNL3Q4V0c3?=
 =?utf-8?B?Sk5CMS96L3NOQXVzVDFDckhNNE1mK09mYTFaZytDd05OM3NjSndBaG9TeTZt?=
 =?utf-8?B?aHN3VGRGb0ovVERCODZnK1AwbS9YOUpRWjJQUUZBZVdUTnQzYUdrWVdEOVQw?=
 =?utf-8?B?L3M1NW9PbkJnQ0x0Y3RTQUNlbCs2ZVlDL01GSmxSeHhWM3hDWWFrSXVML0No?=
 =?utf-8?B?amdjekxKSGdCSDBrZHJCamovWXQ1eXFwczBnQUlQYmxzK0pXUXpZSXZvQ2hQ?=
 =?utf-8?B?TzVIU2MzUTMxQXhhNjdSTUUvTzg0dTFIeHZCMkNjQ0xHNENVUk50QzkrQ3lH?=
 =?utf-8?B?YkhrR1BwSk42WEhrSnlLSkJBbExILzZYSEFMM3lwS2JwaFJmRjEvRWpXcS9M?=
 =?utf-8?B?ZFkwMzh3WVBmV2UyUnR3b2FXNStnK3J5eDIxVEMvNXBrRUdGTzVreW16Wkxk?=
 =?utf-8?B?S0FFdXA4eGZxRllSaHZsMHg0ZVlMNjRSdVVYbU4xZFVXNVBpaURvdlFHWTFy?=
 =?utf-8?B?RUpINVR0MEQyK0RlK2JJa3FZZG44U21xNTdiVDlOSWxZRmJTTFNNRW9TUmRu?=
 =?utf-8?B?cHVJek9WcUVBZ2t3UUszWk1kbVVRMWxsVHhNY3RSR1doTHJ6dFBEckpLVTFS?=
 =?utf-8?B?WGRWZjV0TG01NW8vU0YxeXAyZnRCdkxUNTNqcTBLazhhS2FPZmxzVXN4ZWRS?=
 =?utf-8?B?L1YzZ0plVUhQOERXLzNpaVduS1hxeHppTWVGbFExeU9lMk5yell3ZEJkbEEv?=
 =?utf-8?B?S2NSbUM5QzZmWG1kNmpjTi92WStMcks3M21UY2NoRk01anNNTUNuSjRjdUQ5?=
 =?utf-8?B?VGxIOEJ4d29YdUgxaWV2TStIOEdkOHZiaFlxQUwzYURNVFFYME4xNVVYN2ti?=
 =?utf-8?B?b0dZamxEaVRBVExwTjZITFgrbmNhSmM0b3ZETEZlTGZsRnVIVURkZitDay9z?=
 =?utf-8?B?K2tQMEl3K2NpQ3QwRmZ2V1pCYm1sTXNZdldYY0R3bnJxQ1ltN1Rnd3pHaEU5?=
 =?utf-8?B?eC9ZNUltRzNNWVlKRXFsNkRsVytVRGx3Y1N3WXpYdGNNamdRcFN3TDF4Rmw1?=
 =?utf-8?B?d004UFcvM1E0R2QzbmRTNktHSWVVMmd0alRwV2hYbkxPeXFMWW5CNGxvL0tz?=
 =?utf-8?B?TFNLQlNpUGF0L29xQkxiMWt1MlhUMk9XVjNKRW9sNExJNEwxQXllYkoxdjJn?=
 =?utf-8?B?NU1TZXNoeC9SWXpmcjRQTWJhZ20rWmFnU3QvcUFwY1cvdW5PSVYwVzdrSmdu?=
 =?utf-8?B?UDBMbzBMTjgxM2wrVW0vU0Z4cTlXVFZJNUREMFh2Yk1QREVSZzMrbjJyU3ZS?=
 =?utf-8?B?THVyWDFSWDhKaXRybHVlTCtCWUhFVzd5eWNNWXlNb0tDcjdzNVBERW83bVly?=
 =?utf-8?B?aU42L3V1bXBEc0xFcVNyeUZiQTh3L1NwdnpFbnQ1NXFOVmdYdWpyS2pwUVZX?=
 =?utf-8?B?VUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <84AD2756E88A8047A497DA201E0E84B5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e880432-8a8e-46ce-bcee-08dc7a796580
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2024 16:08:19.2079 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zw9X+YDY7EadWCpNdAj1IHRVpTj1Dt31aZYpHfi+NcAkmZj8kUFSdCZ/Pd//QbIJTV4ES0bjKrhG0o3y8cZCng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7575
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

T24gVHVlLCAyMDI0LTA1LTIxIGF0IDE5OjI4IC0wNzAwLCBEaXhpdCwgQXNodXRvc2ggd3JvdGU6
DQo+IE9uIFR1ZSwgMjEgTWF5IDIwMjQgMTQ6MDA6MjEgLTA3MDAsIFNvdXphLCBKb3NlIHdyb3Rl
Og0KPiA+IA0KPiA+IE9uIFR1ZSwgMjAyNC0wNS0yMSBhdCAxMzoyNCAtMDcwMCwgRGl4aXQsIEFz
aHV0b3NoIHdyb3RlOg0KPiA+ID4gT24gVHVlLCAyMSBNYXkgMjAyNCAxMTo0ODowMSAtMDcwMCwg
U291emEsIEpvc2Ugd3JvdGU6DQo+ID4gPiA+IA0KPiA+ID4gDQo+ID4gPiBIaSBKb3NlLA0KPiA+
ID4gDQo+ID4gPiA+IE9uIFR1ZSwgMjAyNC0wNS0yMSBhdCAxMTowMiAtMDcwMCwgRGl4aXQsIEFz
aHV0b3NoIHdyb3RlOg0KPiA+ID4gPiA+IE9uIFR1ZSwgMjEgTWF5IDIwMjQgMTA6Mzk6MTcgLTA3
MDAsIFNvdXphLCBKb3NlIHdyb3RlOg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBPbiBUdWUs
IDIwMjQtMDUtMjEgYXQgMDk6NDMgLTA3MDAsIERpeGl0LCBBc2h1dG9zaCB3cm90ZToNCj4gPiA+
ID4gPiA+ID4gT24gVHVlLCAyMSBNYXkgMjAyNCAwOToyOTo1MSAtMDcwMCwgU291emEsIEpvc2Ug
d3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gT24gVHVlLCAyMDI0LTA1
LTIxIGF0IDA5OjEwIC0wNzAwLCBEaXhpdCwgQXNodXRvc2ggd3JvdGU6DQo+ID4gPiA+ID4gPiA+
ID4gPiBPbiBUdWUsIDIxIE1heSAyMDI0IDA3OjQ3OjU4IC0wNzAwLCBTb3V6YSwgSm9zZSB3cm90
ZToNCj4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gSGkgSm9zZSwNCj4gPiA+
ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IE90aGVyIGFzaywgY2FuIHlvdSBy
ZW1vdmUgdGhpcyAnRmFpbGVkIHRvIHJlbW92ZSB1bmtub3duIE9BIGNvbmZpZycNCj4gPiA+ID4g
PiA+ID4gPiA+ID4gPiBkZWJ1ZyBtZXNzYWdlIGZyb20geGVfb2FfcmVtb3ZlX2NvbmZpZ19pb2N0
bCgpPw0KPiA+ID4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiA+ID4gTWlzc2VkICdJ
bnN1ZmZpY2llbnQgcHJpdmlsZWdlcyB0byByZW1vdmUgeGUgT0EgY29uZmlnJywgdGhhdCBuZWVk
IHRvIGJlDQo+ID4gPiA+ID4gPiA+ID4gPiA+IHJlbW92ZWQgdG9vIGZyb20geGVfb2FfcmVtb3Zl
X2NvbmZpZ19pb2N0bCgpLg0KPiA+ID4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiA+
ID4gPiBNZXNhIHdpbGwgYmUgdXNpbmcgRFJNX1hFX1BFUkZfT1BfUkVNT1ZFX0NPTkZJRyB3aXRo
IGNvbmZpZyBpZCBzZXQgdG8NCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBVSU5UNjRfTUFYIHRvIGRl
dGVjdCBpZiBYZSBLTUQgc3VwcG9ydHMgT0EgY291bnRlcnMgYW5kIGlmIGFwcGxpY2F0aW9uDQo+
ID4gPiA+ID4gPiA+ID4gPiA+ID4gaGFzIGVub3VnaCBwZXJtaXNzaW9ucyB0byB1c2UgaXQuICBT
byBpdCBjYXVzZXMgZG1lc2cgdG8gYmUgZmxvb2RlZA0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IHdp
dGggJ3hlIDAwMDA6MDA6MDIuMDogW2RybTp4ZV9vYV9yZW1vdmVfY29uZmlnX2lvY3RsIFt4ZV1d
IEZhaWxlZCB0bw0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IHJlbW92ZSB1bmtub3duIE9BIGNvbmZp
ZycgbWVzc2FnZXMgd2hlbiBydW5uaW5nIHRlc3RzIHN1aXRlcy4NCj4gPiA+ID4gPiA+ID4gPiA+
ID4gPiANCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBPciBkbyB5b3UgaGF2ZSBvdGhlciBzdWdnZXN0
aW9uIG9mIHVBUEkgdGhhdCBJIGNhbiB1c2UuDQo+ID4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4g
PiA+ID4gPiA+IE9LLCBzbyB5b3UgYXJlIHJlbHlpbmcgb24gRU5PREVWIGFuZCBFQUNDRVMgZXJy
bm8ncyBmcm9tDQo+ID4gPiA+ID4gPiA+ID4gPiBEUk1fWEVfUEVSRl9PUF9SRU1PVkVfQ09ORklH
IHRvIGZpbmQgb3V0IChhKSBpZiBPQSBpcyBwcmVzZW50IGFuZCAoYikgaWYNCj4gPiA+ID4gPiA+
ID4gPiA+IHlvdSBuZWVkIHRvIGJlIHJvb3QgKGFjdHVhbGx5IENBUF9QRVJGTU9OIG9yIENBUF9T
WVNfQURNSU4pLg0KPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+IHllcA0KPiA+ID4g
PiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gPiBUaGlzIGxv
Z2ljIGluIFhlIHNob3VsZCBiZSBjbG9zZSB0byB3aGF0IHdlIGhhdmUgaW4gaTkxNT8gV2hhdCBk
b2VzIE1lc2EgZG8NCj4gPiA+ID4gPiA+ID4gPiA+IGZvciBpOTE1LCBvciB3aGF0IGRvZXNuJ3Qg
d29yayBpbiBYZT8NCj4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gSGVyZSBh
cmUgc29tZSBwb2ludGVyczoNCj4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4g
KiBZb3UgY2FuIGV4ZWN1dGUgRFJNX1hFX0RFVklDRV9RVUVSWV9PQV9VTklUUyB0byBzZWUgaWYg
T0EgaXMgcHJlc2VudA0KPiA+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gPiAqIEFk
ZC9yZW1vdmUgT0EgY29uZmlncyBhbmQgdXNpbmcgdGhlIGdsb2JhbCBPQUcgYnVmZmVyICh0aW1l
IGJhc2VkDQo+ID4gPiA+ID4gPiA+ID4gPiAgIHNhbXBsaW5nIG9yIERSTV9YRV9PQV9QUk9QRVJU
WV9TQU1QTEVfT0Egc2V0KSBhcmUgcHJpdmlsaWdlZCBvcGVyYXRpb25zDQo+ID4gPiA+ID4gPiA+
ID4gPiAgIChuZWVkIHJvb3QpLiBPcGVyYXRpb25zIHdoaWNoIG9ubHkgbmVlZCBPQVIvT0FDIChP
QSBxdWVyaWVzLCB3aXRob3V0DQo+ID4gPiA+ID4gPiA+ID4gPiAgIERSTV9YRV9PQV9QUk9QRVJU
WV9TQU1QTEVfT0EpIGNhbiBiZSBleGVjdXRlZCBieSBub24tcm9vdC4NCj4gPiA+ID4gPiA+ID4g
PiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gKiBJZiAiL3Byb2Mvc3lzL2Rldi94ZS9wZXJmX3N0cmVh
bV9wYXJhbm9pZCIgaXMgMCwgYWxsIG9wZXJhdGlvbnMgY2FuIGJlDQo+ID4gPiA+ID4gPiA+ID4g
PiAgIGV4ZWN1dGVkIGJ5IG5vbi1yb290IHVzZXJzLiBPdGhlcndpc2UsIGFzIEkgZGVzY3JpYmVk
IGluIHRoZSBwcmV2aW91cw0KPiA+ID4gPiA+ID4gPiA+ID4gICBwb2ludC4NCj4gPiA+ID4gPiA+
ID4gPiANCj4gPiA+ID4gPiA+ID4gPiBJdCBpcyBwb3NzaWJsZSB0aGF0IHByb2Nlc3Mgbm90IHN0
YXJ0ZWQgYnkgcm9vdCBoYXMgQ0FQX1BFUkZNT046DQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+
ID4gPiBZZXMsIGNvcnJlY3QuDQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiBBYm92ZSBJ
IGFtIHVzaW5nICJyb290IiBsb29zZWx5IGFzICJDQVBfUEVSRk1PTiBvciBDQVBfU1lTX0FETUlO
Ii4NCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IFNvIGlmIHJvb3Qgc2V0cyAncGVyZl9z
dHJlYW1fcGFyYW5vaWQnIHRvIDAsIG5vcm1hbCB1c2VycyBjYW4gZG8gT0ENCj4gPiA+ID4gPiA+
ID4gcHJpdmlsaWdlZCBvcGVyYXRpb25zIChhcyBkZXNjcmliZWQgYWJvdmUpLg0KPiA+ID4gPiA+
ID4gPiANCj4gPiA+ID4gPiA+ID4gSWYgcm9vdCBzZXRzICdwZXJmX3N0cmVhbV9wYXJhbm9pZCcg
dG8gMSwgb25seSBDQVBfUEVSRk1PTiBvciBDQVBfU1lTX0FETUlODQo+ID4gPiA+ID4gPiA+IHVz
ZXJzIGNhbiBkbyBPQSBwcml2aWxpZ2VkIG9wZXJhdGlvbnMuDQo+ID4gPiA+ID4gPiANCj4gPiA+
ID4gPiA+IG9oIG9rYXkgc28gcGVyZl9zdHJlYW1fcGFyYW5vaWQgaGFzIGEgZ29vZCB1c2FnZSBi
dXQgaXQgZG8gbm90IGNvdmVycw0KPiA+ID4gPiA+ID4gQ0FQX1BFUkZNT04sIHNlZSBiZWxvdy4N
Cj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiAiVW5wcml2aWxl
Z2VkIHByb2Nlc3NlcyB3aXRoIGVuYWJsZWQgQ0FQX1BFUkZNT04gY2FwYWJpbGl0eSBhcmUgdHJl
YXRlZA0KPiA+ID4gPiA+ID4gPiA+IGFzIHByaXZpbGVnZWQgcHJvY2Vzc2VzIHdpdGggcmVzcGVj
dCB0byBwZXJmX2V2ZW50cyBwZXJmb3JtYW5jZQ0KPiA+ID4gPiA+ID4gPiA+IG1vbml0b3Jpbmcg
YW5kIG9ic2VydmFiaWxpdHkgb3BlcmF0aW9ucywuLi4iDQo+ID4gPiA+ID4gPiA+ID4gDQo+ID4g
PiA+ID4gPiA+ID4gQW5kIGZyb20gd2hhdCBJIHVuZGVyc3Rvb2Qgb25seSByb290IGNhbiB3cml0
ZSB0byBwZXJmX3N0cmVhbV9wYXJhbm9pZCwNCj4gPiA+ID4gPiA+ID4gPiBzbyBJIGRvbid0IHNl
ZSBhIHBvaW50IGluIGhhdmluZyB0aGlzIGZpbGUuLi4NCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+
ID4gPiA+IFNvIEkgZG9uJ3Qga25vdyBob3cgdGhpcyBzdGF0ZW1lbnQgZm9sbG93cz8NCj4gPiA+
ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IHJvb3Qgb3Igc3VwZXJ1c2VyIGlzIHRoZSBvbmUgd2hp
Y2ggZ2l2ZXMgdGhlIHBlcm1pc3Npb24gdG8gbm9uLUNBUF9QRVJGTU9ODQo+ID4gPiA+ID4gPiA+
IGFuZCBub24tQ0FQX1NZU19BRE1JTiB1c2VycyB0byBiZSBhYmxlIHRvIGRvIHByaXZpbGlnZWQg
T0Egb3BlcmF0aW9ucy4NCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gc28gaWYgSSdtIHJ1bm5p
bmcgYSBwcm9jZXNzIHdpdGggQ0FQX1BFUkZNT04gYW5kIHJlYWQNCj4gPiA+ID4gPiA+IHBlcmZf
c3RyZWFtX3BhcmFub2lkIGFuZCBpdCByZXR1cm5zIDANCj4gPiA+ID4gPiANCj4gPiA+ID4gPiAw
IGlmIGZpbmUsIGV2ZXJ5b25lIGNhbiB1c2UgYWxsIE9BIGNhbGxzLiBUaGUgaXNzdWUgaXMgd2l0
aCAxLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gdGhlcmUgaXMgbm8gd2F5IGZvciBVTUQgdG8g
a25vdw0KPiA+ID4gPiA+ID4gdGhhdCBwcm9jZXNzIGlzIGFsbG93ZWQgdG8gdXNlIFhlIEtNRCBP
QSBmZWF0dXJlIHdpdGhvdXQgZG8gYSB1QVBJIGNhbGwNCj4gPiA+ID4gPiA+IHRoYXQgY2hlY2tz
IGZvciBDQVBfUEVSRk1PTi4NCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gVGhhdCBpcyB3aHkg
SSB0aGluayBpcyBiZXR0ZXIganVzdCBkbyBhIHNpbmdsZQ0KPiA+ID4gPiA+ID4gRFJNX1hFX1BF
UkZfT1BfUkVNT1ZFX0NPTkZJRyB0byBkZXRlY3QgaWYgZmVhdHVyZSBpcyBwcmVzZW50IGFuZCBp
Zg0KPiA+ID4gPiA+ID4gcHJvY2VzcyBpcyBhbGxvd2VkIHRvIHVzZSBpdC4gQnV0IGl0IGdlbmVy
YXRlcyBhIGJ1bmNoIG9mIGRlYnVnIG1lc3NhZ2VzLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IEEg
cHJvY2VzcyBzaG91bGQgYmUgYWJsZSB0byBmaW5kIG91dCBvbiBpdHMgb3duLCB3aXRob3V0IGhl
bHAgZnJvbSBYZQ0KPiA+ID4gPiA+IGRyaXZlciwgd2hhdCBpdCdzIGNhcGFiaWxpdGllcyAoQ0FQ
X1BFUkZNT04gb3IgQ0FQX1NZU19BRE1JTiBvciBuZWl0aGVyKQ0KPiA+ID4gPiA+IGFyZToNCj4g
PiA+ID4gPiANCj4gPiA+ID4gPiBodHRwczovL3d3dy5nb29nbGUuY29tL3NlYXJjaD9xPWxpbnV4
K2dldCtwcm9jZXNzK2NhcGFiaWxpdGllcytpbitjDQo+ID4gPiA+ID4gaHR0cHM6Ly9tYW43Lm9y
Zy9saW51eC9tYW4tcGFnZXMvbWFuMy9saWJjYXAuMy5odG1sDQo+ID4gPiA+ID4gDQo+ID4gPiA+
IA0KPiA+ID4gPiBJIGRvbid0IHRoaW5rIHRoaXMgaXMgbXVjaCBwb3J0YWJsZSwgSSBkb24ndCB0
aGluayBCU0QgaGFzIHRoaXMgc3lzZnMNCj4gPiA+ID4gd2l0aCBQSUQgY2FwYWJpbGl0aWVzIG9m
IHByb2Nlc3MuDQo+ID4gPiANCj4gPiA+IE5vdCBzdXJlIHdoeSB3ZSBhcmUgYnJpbmdpbmcgQlNE
IGhlcmUgc2luY2Ugd2UgaGF2ZSBhIExpbnV4IEtNRCwgbm90IGEgQlNEDQo+ID4gPiBLTUQuIElu
IGFueSBjYXNlLCBldmVyeSBPUyBoYXMgc3lzdGVtIGNhbGxzIGZvciBhIHByb2Nlc3MgdG8gcXVl
cnkgaXRzDQo+ID4gPiBwcm9wZXJ0aWVzLg0KPiA+IA0KPiA+IEJTRCB3cmFwcyBMaW51eCBkcm0g
ZHJpdmVycyBpbnRvIGEgdHJhbnNsYXRpb24gbGF5ZXIuDQo+ID4gDQo+ID4gaHR0cHM6Ly93d3cu
ZnJlc2hwb3J0cy5vcmcvZ3JhcGhpY3MvZHJtLWttb2QvDQo+ID4gDQo+ID4gPiANCj4gPiA+IFNv
IGlmIHRoZXNlIGFyZSBub3QgcG9ydGFibGUsIHlvdSBkb24ndCBoYXZlIHRvIHVzZSB0aGVzZSBs
aWJyYXJ5IGNhbGxzLA0KPiA+ID4geW91IHNob3VsZCBiZSBhYmxlIHRvIHVzZSBkaXJlY3QgY2Fs
bHMgaW50byB0aGUgT1MgdG8gZmluZCBzdHVmZiBvdXQuDQo+ID4gDQo+ID4gVGhhdCBpcyB0aGUg
cHJvYmxlbSwgTGludXggZXhwb3NlcyBwcm9jZXNzIGNhcGFiaWxpdGllcyBpbiBzeXNmcyB3aGls
ZQ0KPiA+IEJTRCBkb24ndCBldmVuIGhhcyBjb25jZXB0IG9mIGNhcGFiaWxpdGllcywgaXQgaGFz
IHByaXZpbGVnZXMuLi4NCj4gDQo+IEkgZ3Vlc3MgdGhlbiB0aGF0IHRoZSBMaW51eCB0byBCU0Qg
dHJhbnNsYXRpb24gbGF5ZXIgd2lsbCBjb252ZXJ0DQo+IGNhcGFiaWxpdGllcyB0byBwcml2aWxp
Z2VzLg0KDQpJdCB3aWxsLCBpdCB3aWxsIGp1c3Qgbm90IGV4cG9zZSBjYXBhYmlsaXRpZXMgb3Ig
cHJpdmlsZWdlcyBpbiBzeXNmcyBsaWtlIExpbnV4IGRvZXMuDQoNCj4gDQo+IEFzIEkgc2VlIGl0
LCBNZXNhIHdpbGwgbmVlZCB0byBoYXZlIExpbnV4L0JTRCBzcGVjaWZpYyBjb2RlLiBTaW1pbGFy
IHRvIHRoZQ0KPiBMaW51eCBsaW5rIGFib3ZlIGhlcmUgaXMgdGhlIEJTRCBzcGVjaWZpYyBsaW5r
Og0KPiANCj4gaHR0cHM6Ly93d3cuZ29vZ2xlLmNvbS9zZWFyY2g/cT1mcmVlYnNkK2dldCtwcm9j
ZXNzK3ByaXZpbGVnZXMraW4rYw0KDQpBZ2FpbiB0aGF0IGlzIHdoYXQgSSB3YW50IHRvIGF2b2lk
Lg0KV2UgY2FuIGF2b2lkIGl0IGJ5IGp1c3QgcmVtb3ZpbmcgMiBkZWJ1ZyBtZXNzYWdlcywgZG9u
J3QgbG9vayB0aGF0IGhhcmQuDQoNCj4gDQo+ID4gDQo+ID4gPiANCj4gPiA+ID4gQWxzbyBpZiBs
YXRlciBYZSBLTUQgYWRkcyBvciByZW1vdmVzIHByb2Nlc3MgY2FwYWJpbGl0aWVzIHRoYXQgaGFz
IGFjY2Vzcw0KPiA+ID4gPiB0byBPQSBpdCB3aWxsIGJyZWFrIFVNRHMuDQo+ID4gPiANCj4gPiA+
IFRoYXQgd291bGQgYmUgYnJlYWtpbmcgdGhlIHVhcGksIHNvIG9uY2UgaXQgaXMgbWVyZ2VkIGl0
IGNhbm5vdCBiZSBjaGFuZ2VkLg0KPiA+ID4gDQo+ID4gPiA+IGh0dHBzOi8vd2lraS5mcmVlYnNk
Lm9yZy9HcmFwaGljcy9JbnRlbC1HUFUtTWF0cml4DQo+ID4gPiA+IA0KPiA+ID4gPiBJIHRoaW5r
IHdvdWxkIGJlIGJldHRlciB0byB1c2UgdUFQSXMgdG8gZmlndXJlIG91dCBwZXJtaXNzaW9ucy4N
Cj4gPiA+IA0KPiA+ID4gQXMgSSBzYWlkLCB0aGUgY29ycmVjdCB3YXkgdG8gZG8gdGhpcyBpcyB0
byB1c2UgT1MgY2FsbHMuIEluIGFueSBjYXNlLCBJDQo+ID4gPiBkb24ndCB0aGluayB3ZSBjYW4g
cmVtb3ZlIHRoZSBkZWJ1ZyBtZXNzYWdlcyBiZWNhdXNlIHRoZXkgYXJlIHVzZWZ1bCBmb3INCj4g
PiA+IGRlYnVnZ2luZyAodGhhdCdzIHdoeSB0aGV5IGFyZSB0aGVyZSkuDQo+ID4gDQo+ID4gTW9z
dCBvZiBYZSB1QVBJIGRvbid0IGhhdmUgdGhpcyBsZXZlbCBkZWJ1ZyBtZXNzYWdlLiBFQUNDRVMg
aXMgcHJldHR5DQo+ID4gY2xlYXIgd2hhdCBpcyB0aGUgaXNzdWUgYW5kIGl0IGRvbid0IG5lZWQg
YSBkZWJ1ZyBtZXNzYWdlIGluIG15IG9waW5pb24uDQo+IA0KPiBUaGUgcHJvYmxlbSBpcyB3ZSBo
YXZlIGFsbCBzb3J0cyBvZiBJR1QgdGVzdHMgd2hpY2ggdGVzdCB0aGVzZSBlcnJvciBjb2RlDQo+
IHBhdGhzLiBXaGVuIHRoZXNlIGZhaWwgaW4gQ0ksIGFsbCB3ZSBoYXZlIGlzIGRtZXNnIHRvIGZp
Z3VyZSBvdXQgd2hhdCdzDQo+IGdvaW5nIG9uLg0KDQpJR1Qgd2lsbCBhbHNvIGluY2x1ZGUgdGhl
IGVycm5vIGNvZGUsIHdpbGwgbm90IGJlIG11Y2ggaGFyZGVyIHRvIGZpZ3VyZSB0aGUgZmFpbHVy
ZSByZWFzb24uDQoNCj4gDQo+IEFuZCBhbnl3YXkgYWNjb3JkaW5nIHRvIG1lLCB0aGUgcmlnaHQg
d2F5IHRvIGRvIHRoaXMgaXMgdG8gcXVlcnkgdGhlDQo+IE9TLiBNYXliZSB5b3UgbmVlZCB0byBh
ZGQgZGVwZW5kZW5jaWVzIG9uIHNvbWUgb2YgdGhlc2Ugb3RoZXIgbGlicmFyaWVzPw0KPiANCj4g
QW5kIEkgYW0gbm90IHN1cmUgaWYgdGhlIGFwcHJvYWNoIHlvdSBhcmUgc3VnZ2VzdGluZyB3aWxs
IGJlIGNvbnNpZGVyZWQNCj4gYWNjZXB0YWJsZSBpbiB5b3VyIE1lc2EgY29kZSByZXZpZXcuDQo+
IA0KPiBBbHNvLCBJIGRvbid0IGtub3cgd2h5IHlvdSBoYXZlIG9hX21ldHJpY3NfYXZhaWxhYmxl
KCkgYXQgYWxsLCBzaW5jZSB0aGUNCj4gbmV4dCBzdGVwIGluIGludGVsX3BlcmZfaW5pdF9tZXRy
aWNzKCkgaXMgdG8gYWRkIHRoZSBPQSBjb25maWdzIGFuZCBpZiB0aGUNCj4gcHJvY2VzcyBkb2Vz
bid0IGhhdmUgc3VmZmljaWVudCBwcml2aWxpZ2VzLCB0aGUga2VybmVsIHdpbGwgcmVqZWN0IGFk
ZGluZw0KPiB0aGVzZSBjb25maWdzLiBTbyBqdXN0IHRoZSByZXR1cm4gY29kZSBmcm9tIHRoZSBr
ZXJuZWwgd2lsbCBzdWZmaWNlLg0KDQppZiBvYV9tZXRyaWNzX2F2YWlsYWJsZSgpIHJldHVybnMg
ZmFsc2UgaXQgd2lsbCBub3QgdHJ5IHRvIGFkZCBPQSBjb25maWdzLg0KDQo+IA0KPiBTbyB5b3Ug
bWF5IGJlIGFibGUgdG8gc2tpcCBvYV9tZXRyaWNzX2F2YWlsYWJsZSgpIGZvciBYZSB3aXRoIGEg
bGl0dGxlIGJpdA0KPiBvZiBjb2RlIHJlZmFjdG9yaW5nLCBubz8NCj4gDQo+ID4gDQo+ID4gPiAN
Cj4gPiA+IEFsc28sIGxvb2tpbmcgYXQgaW50ZWxfcGVyZl9pbml0X21ldHJpY3MoKS0+b2FfbWV0
cmljc19hdmFpbGFibGUoKSwNCj4gPiA+IGN1cnJlbnRseSBpdCBqdXN0IGNhbGxzIGdldGV1aWQo
KSBhbmQgZG9lc24ndCB3b3JyeSBhYm91dCBDQVBfUEVSRk1PTi4gT2YNCj4gPiA+IGNvdXJzZSB5
b3UgY2FuIGFkZCB0aGF0LCBidXQgdGhlbiB5b3Ugd2lsbCBuZWVkIHRvIGZpZ3VyZSBvdXQgdGhl
IGNvcnJlY3QNCj4gPiA+IHdheSB0byBkbyBpdC4gVGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24g
b2Ygb2FfbWV0cmljc19hdmFpbGFibGUoKSBzZWVtcw0KPiA+ID4gbW9zdGx5IG9rIHRvIG1lIGFu
ZCBkb2Vzbid0IGNhbGwgcmVtb3ZlX2NvbmZpZygpIGV0Yy4gc28gSU1PIHdlIHNob3VsZA0KPiA+
ID4gY29udGludWUgdGhhdCBhcHByb2FjaCBmb3IgWGUgdG9vLg0KPiA+IA0KPiA+IGk5MTUgaXMg
bWlzc2luZyBDQVBfUEVSRk1PTiBoYW5kbGluZyBiZWNhdXNlIGl0IHdhcyBhZGRlZCAoDQo+ID4g
aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS94ZS9rZXJuZWwvLS9jb21taXQvOTgw
NzM3MjgyMjMyYjcgKQ0KPiA+IGFmdGVyIGk5MTUgT0EgdUFQSS4gIEZvciBpOTE1IEkgZG9uJ3Qg
Y2FyZSBhdCB0aGlzIHBvaW50IGJ1dCBmb3IgWGUgS01EDQo+ID4gaXQgaXMgaW1wb3J0YW50IHRv
IHN1cHBvcnQgQ0FQX1BFUkZNT04gYW5kIENBUF9TWVNfQURNSU4uDQo+IA0KPiBZb3UgbWlnaHQg
YWRkIHRoaXMgZm9yIGk5MTUgdG9vIHdoaWxlIHlvdSdyZSBhdCBpdCA6KQ0KDQppOTE1IHdpbGwg
YWxzbyBzcGFuIGRtZXNnLg0KDQo+IA0KPiA+IA0KPiA+ID4gDQo+ID4gPiBUaGFua3MuDQo+ID4g
PiAtLQ0KPiA+ID4gQXNodXRvc2gNCj4gPiA+IA0KPiA+ID4gDQo+ID4gPiANCj4gPiA+ID4gDQo+
ID4gPiA+ID4gQW5kIHRoZXJlZm9yZSwgYWxvbmcgd2l0aCBwZXJmX3N0cmVhbV9wYXJhbm9pZCwg
ZGV0ZXJtaW5lIHdoaWNoIE9BIGNhbGxzIGl0DQo+ID4gPiA+ID4gY2FuIHVzZS4NCj4gPiA+ID4g
PiANCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiA+IFNvIGJh
c2ljYWxseSBJIHRoaW5rIHlvdSBqdXN0IG5lZWQgdG8gY2hlY2sgZm9yIHRoZSBwZXJmX3N0cmVh
bV9wYXJhbm9pZA0KPiA+ID4gPiA+ID4gPiA+ID4gZmlsZSBhYm92ZS4gSXQgd2lsbCB0ZWxsIHlv
dSBib3RoIChhKSBpZiBPQSBpcyBwcmVzZW50IChiZWNhdXNlIHdlIGFyZQ0KPiA+ID4gPiA+ID4g
PiA+ID4gZ29pbmcgdG8gbWVyZ2UgdGhlIGNvZGUgd2hpY2ggY3JlYXRlcyB0aGlzIGZpbGUgdG9n
ZXRoZXIgd2l0aCBPQSkgYW5kIChiKQ0KPiA+ID4gPiA+ID4gPiA+ID4gaWYgeW91IG5lZWQgdG8g
YmUgcm9vdCBmb3IgcGFydGljdWxhciBvcGVyYXRpb25zLg0KPiA+ID4gPiA+ID4gPiA+ID4gDQo+
ID4gPiA+ID4gPiA+ID4gPiBUaGFua3MuDQo+ID4gPiA+ID4gPiA+ID4gPiAtLQ0KPiA+ID4gPiA+
ID4gPiA+ID4gQXNodXRvc2gNCj4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IA0KPiA+ID4g
PiANCj4gPiANCg0K
