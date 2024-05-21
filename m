Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA0AC25B75
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 21:00:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F8A810E143;
	Tue, 21 May 2024 21:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EaehmOI3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 387D310E143
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 21:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716325228; x=1747861228;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=uINn99AVUYxi1alOjLMiCcplaTzQ6Q7oEbcjZo2HOS4=;
 b=EaehmOI3dXCkDqKh5epxUpZBJWZ7x/ewT4C22jav+Ok0C8LzB0oX17Cs
 8YNlQxhGaWht2ApzD1ojHIPS49Pej23ezWA6XD1jnCK/m/GqNL15aO7WZ
 UiF+141QvIzxr0sh5vGwO5WUeBA8tI7dfZooL5urZjAJsjUiynLoWTX8V
 e+xGCukd8hlUuLwHqhEaVeaM7QEEptXt9qHWfIpgkmNUsHLttsbOzpWg5
 gXfvlkaNIF2RNpIr7sBY3jwFaUzAcrPL0ALXhM7qPmOSu0FVOxUInVhXJ
 J32mIUC/x0S6QmOmhnMGmNy+3/wN2AtaNU2uFMaREpBOli/PeGtqDE1dg w==;
X-CSE-ConnectionGUID: 9tcV0TejSzmRvofISoHwuA==
X-CSE-MsgGUID: xLSb2wy8QaGUScuJLkDaZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="12776196"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="12776196"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 14:00:25 -0700
X-CSE-ConnectionGUID: gAFkU2NURbW+XDP43Wn7BQ==
X-CSE-MsgGUID: nV1jmS2xR8yhZMJh2B1VnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="33197519"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 May 2024 14:00:25 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 14:00:24 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 14:00:24 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 21 May 2024 14:00:24 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 14:00:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O3YPjZTXeHpNKHLABvTd4kxvykDgHgMApHViGDw4QGD9z6M6fsU4W4VflStNt4BZDQtxRtUQGvRpN/h2CnwADpiwh2EcmKWFrXwb7CsfCfyOcgj/ruZrT7DSLTpTbHnpidN1kmQehZPjbVRhOOt28icOSaeNpCjF7xPiUVadCuHlPcwZi0PttWa0jErK8wGOWdEO2LW7lfaBcouPPG9YEn9mU1BxJvFdehyE4IEkfYBt+kw5P4il6hzK2q5E68flS0tYjy8an+rBe0tPx0dOealpFbZYKZyPX7Jv8Ptd02LSSl2O6gsqzl/Tch/WGkqLJiC0Duef5bmNPUm5mGL2Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uINn99AVUYxi1alOjLMiCcplaTzQ6Q7oEbcjZo2HOS4=;
 b=nrioc3WjuHvI0DFt6fSIp1e/KkliRI8yGZV0YDhphGLJfZfD2b2ih1lHdS10N1Y4kaC8RjLcl9KhdjYcUuyXeTSe/6gymSsAR1pu8KzUJ/8w28K5KrawVB2RAQzT6LBvmzxIDgefUwPAksM3NI8mx5cHt3HWtEMtTyqgOYIIKUsA84u9McS+QUfLLT4dkehd1d84JkjOpYILsiNkvwNGwvSbUGvIhQZjVnyTDHsf4CgQ9GJ26DFZqJW2IJQfQePPsEVAWqXnZ/jr4V2k0xtqijnRBXkxr7Trn/uRhm4NTuM3fM2W3RteELMJPTXLpkt1S6yPOiCjxdsSC+YsB9x0yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by BL1PR11MB5319.namprd11.prod.outlook.com (2603:10b6:208:31b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 21:00:21 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%6]) with mapi id 15.20.7587.028; Tue, 21 May 2024
 21:00:21 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 00/17] Add OA functionality to Xe
Thread-Topic: [PATCH 00/17] Add OA functionality to Xe
Thread-Index: AQHadnkcIUwutN2VakWosatViFIW8bGcJwYAgAB1PYCABZE6AIAAAUuAgAAW/ICAAAV7AIAAA74AgAAPqACAAAZugIAADMWAgAAbGICAAAnjAA==
Date: Tue, 21 May 2024 21:00:21 +0000
Message-ID: <dc54f5b401cdf089da93c98b9b1148322ee4f392.camel@intel.com>
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
In-Reply-To: <85y18229rc.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|BL1PR11MB5319:EE_
x-ms-office365-filtering-correlation-id: 8274155e-fb52-4482-97e7-08dc79d906f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?Nkd3aXZFZzNvR3FEekFJT1pKdm5jM05vYVNYQndOWUk3ZVpuNG5tM1E4Qlc4?=
 =?utf-8?B?RUlOaGFudjlNQ21LbjFwbTYrV1QzU29kR09YNERZakpxUUprb2RpT3pXK2tq?=
 =?utf-8?B?Smxqa01JMXA4WjdaK1lDaHJvc0xsbExRckJ4eUdiV2s1cXB6Y1FTREdFQSsy?=
 =?utf-8?B?YkVEUkdobWNzdzhOUlhOS2tyM09zMXF2WlJOWm9NWGliQlF6K3Y1cnRYZ2ZT?=
 =?utf-8?B?cHB2S1JGc1VlVEpLREk1emRvRFg3OVVLbVBjL043aFkyYkdPZG52eEZxSkRH?=
 =?utf-8?B?ZDZZSXJIVVpKVWpUOFAyTmVJRTZzeWtjKzlRMWlPblI1NXVjV2xHUDZNWDV4?=
 =?utf-8?B?UDBvbW9zL3hMUVAxLzV4bGlSdVl2UUxsQmlCT3JIbmNCY1hKOHRpSmoxYW9G?=
 =?utf-8?B?cUVCUmtnMnVZRE9iVnFyYWpINGt5OWxnYlBjNE92elNINlEweURxL3AwZmwz?=
 =?utf-8?B?Z1pYTU05MFplemEzR0ZWdkxNd0xxcVY3R3NtSnRwZlJUeXNZdkEzeVlHNkNC?=
 =?utf-8?B?UG1icktmMEV3OXhTdERTbW8vQUFyd2pXSGdMYTdydE4yaEszYXpXRlF0SHJr?=
 =?utf-8?B?NEZSUXhtdzh2Z2l1OFVXZnVpQllYRWhjdS9jb3NOd3BvMkRjdTVoRitMMjVr?=
 =?utf-8?B?MzdtZWJDR1hJVC9pMEVWYlB1aTVRMTh5ZUtXVE1iVE83VWhkekVNSnFTd1RL?=
 =?utf-8?B?OXZhZ1hobldzMEprWncwNExrTkV5S2FnVzh2RUpPSkFQd1RCSGNrR0kvRDQ0?=
 =?utf-8?B?MTBMeDZTY3BlVm1tUVpDclkwUlM0MWxtOFdzWGpxUlUwN0VnUGE5bXFoR1lj?=
 =?utf-8?B?ZlZZZWhwNURGM05OZWY4VkJDYnhMTXJYNHoyMkVMOVJIRXhCQllselhFVFQr?=
 =?utf-8?B?Q3pqV292UEJwSENSdFVaUEtnRnpWd0Vra0ozblBvSnZpcGZyUUFvaWY1U2Fj?=
 =?utf-8?B?REdwdllZN2d6NkZiMG9VSWIvb0xwRVAwU1dBS0kxbkwxTS9TWlBNYmovN3hk?=
 =?utf-8?B?ZnRhTVUyaDRkRDR2cDdBMXR0dUovcmM4dEF1Z05BR0pQdFFmY2Q1UG1kQkNL?=
 =?utf-8?B?YUtYL0EvWUhjSUV5ZXRZYW84K0JnZDBsRnIxSlRoZGxWTnpKaWVra0tqSmhB?=
 =?utf-8?B?cWhCczRtZUk2N2t3QkdzbEJxRVcyTW0wRXp4OGhNY2tHYjF0ZU1vaEdKVlBP?=
 =?utf-8?B?Ym5mQ1dZNlFVV1BmT1pFVE5SSlVQRXNBOEN4N3AyZFlVUmVjVlBvT0tzTTlv?=
 =?utf-8?B?elJHc2c1WFAwbHNPY1lVQXVsMWttZThyRndyandwb0dCRFRuU0lDazJDNWRS?=
 =?utf-8?B?N1pSL0VmNy9RWG5mRzYyaTMydUdqRnhySG5ndTcwTnVyNmR4Mzc5anVDazNU?=
 =?utf-8?B?T1dRcEpxbmVBbWhEL01MbHIwdjRuRVlKdkw4cGRXR1VHRmxTanFUVU1uNE82?=
 =?utf-8?B?OFNxVGQzUGRnekFjcVFyOE5SNmI4cnR6RzBuR0pIdndVQm9oQTFSVkhXeEhJ?=
 =?utf-8?B?NktPU2ZNTEVXQ1I2NElMKzBtR0Z1czI2b0FnUkpQb1Y5Y1dJdDd0N3hDK2l6?=
 =?utf-8?B?cEQxVklzZ21IWGZqWk05Ti96VXh3NTloZG9CM0ovb1N2UTgyaURjOXBWQ2h2?=
 =?utf-8?B?d1JLbjZhMGRJTkpkYnhlTWFIVTdrejVQdUFML3N3dklldzltTEVuU01WRVp5?=
 =?utf-8?B?L1doVi9wMTFNQWphb1c0U0M1SXFSeU1IUlorcW43TUp6SmwvYkY2d0ZqcnVQ?=
 =?utf-8?Q?6TDOSUL5yM+E5uob+Q=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VWZ0Slh3aStJVkt0cnpUZlRWYkdLM1FrZk1iVDcxbTIxUGwwRGhlOVY1UEl2?=
 =?utf-8?B?WGRWdFJ6VWZrMWZLZXE5MFBIL1kxbHZQSDRjTTJvdzRCbDNmRk82U1h1WXpP?=
 =?utf-8?B?TjVlQTZzQ3B0K0pxYUtrUG5vS1E1TlBNcFp1QzU3SWpaUHZZMXBma255UUV2?=
 =?utf-8?B?SHhKUkF5Y0VEZVI0R3VmL1ZFSEJwTm9UQ2RKSy9sNjhYRUozdTZEckZTWHNC?=
 =?utf-8?B?anRaNzhXZE9DVVNrY0ZMSG1kbDBSK3ZuQU9sWlU5VUJsYjBDWmdYVjVQcXo4?=
 =?utf-8?B?dGFMa1JRWVhNandXZERiRG1WTTdhQktjQ1lUdGpEVGs3RklNZ2lEVGJNdjVm?=
 =?utf-8?B?UlFMZ09tRDVJb3g2WXZYQk1aWmVDRDdETVNDbzIvUEdKUHNKdHVkeGE5cCt2?=
 =?utf-8?B?UitJMk1pQTdxbzMvN0hPQWFoUTQ1a2Q2RDJMZGJCS2JWeFBQYW9CdDJNeWF1?=
 =?utf-8?B?VjdydzByUHlPa1RGWFFENWZNUUhDYjFTcUg3YUNvcWxIdkp5NzV2dFVnL1pY?=
 =?utf-8?B?MW5XeTdvUzdJN1VHU2pMcGVKRjMwRkJzYUlKVUVhL2JsbU1GeDEvWUp0eU50?=
 =?utf-8?B?RHh2ZlEzN2dwUElQNDBOQWpOVWVVdXIwTWRzSXYvMjVScGFVazV6Q3B5dE45?=
 =?utf-8?B?S1h6Zm1SMVFWUjYxWE0yZWxiRDJwcTZYUndVUXFldld2RHBpcG45ZEJsQ0ts?=
 =?utf-8?B?SEhzUHIreGl4YVlmWVV6TW1PM0FMMEgzeXAvTVR2b3U5c2hXdmFiQzhOQXZj?=
 =?utf-8?B?SnZjY0MwNTRDQjBXcFZDK21lWEt3SzhtK1poRWR0WVRnZzRQVTJmREQ5VHZQ?=
 =?utf-8?B?eEgveGFXUGw4U05FVytFNlo1RERkRmR4MWN2RVNhVC93T3NjVENJRXpNajUr?=
 =?utf-8?B?ZDJHUWlDdGN2Vitqc3hBVk9nSTJ1dWFWVVd5YXc1d3EzSkU3ck5hdmttc1pW?=
 =?utf-8?B?UzhjOHFtb0p3WU4wejRkTUszTy9NWnNJMG52OWJMaVdFNTdDU3hCUVp0VHo3?=
 =?utf-8?B?ekk2K3pWaDZySzlZVXhVY2RGeTFnanpQR1R2QXpESEdDQWN4TGYzVUpWV2VB?=
 =?utf-8?B?NTM5clZ2TDEwR3BtYUpWc1JZRjRIMWpldC8vT1ZUUjA0WVZHaGR3RzA5RUZM?=
 =?utf-8?B?MjZOMUloVHd0bzVKejNPRGJlQzJFZkhkVVdxRUFFUkJYR0JJeU9tQWhBUzB4?=
 =?utf-8?B?ZmY3TWF2bDRGN25GbzRTYUhFY1IxUldBY1lZRHBLMmFmSHpINWNMcDdZSjR2?=
 =?utf-8?B?RTRUdjVOd1FKS3NGbGg5cVZ6b1o4dmdLZmRvVTBsejB6Rk92ekdFTXlTOHh5?=
 =?utf-8?B?RE96S3ZxLzE4ZzJiUEJCTi9SWFFwUXFNYUt5RXE5eE0xU3hrVFA2RjU5MU8y?=
 =?utf-8?B?OVV3clFidXVOL3E0YUcrbHluazZndTlDQklHamNWWk9wTHpVczNiUjRmVUpz?=
 =?utf-8?B?Vi9FT2V4T3FnbEpFY2Nka05zVFJQbHJHRHNqVlhvd1V5Y3Rnc3lGM0VyYkha?=
 =?utf-8?B?c2JEKzI5YWRVMy80RkpBMjNhZEdpU1U5clFPT0tEZWREdFRUUU5YcVEzNHF5?=
 =?utf-8?B?bVp2TVJkVnpZVWhHVEg4cGFUY0JhdzN6ZEpUVVZRZHVYOTVLaWNjRm96NXgx?=
 =?utf-8?B?dkxBUjRnczFjZXRUK1YrQllXMzBVVGxPNUFvVEhSNFZWdytRSG5jNitPNjlQ?=
 =?utf-8?B?TVRHbDZJUUYvTDRSdytIdk1IeG9rNHl4K1ZUdVZ0N0VBK2ZpaUdkT1JoOVRy?=
 =?utf-8?B?SU1aNDl0dEJySExwMEhzS3ZpOFZoTFdsUGJseVAwVmU3UFpwZ1RGZWpyeEo2?=
 =?utf-8?B?TXd6d0VUYmN0RnZCZmp6UmkyRVpkSXdPT3Nma3dHQU5ORU1qazYxK3dSS3Fz?=
 =?utf-8?B?WXpaN05mZytKYmFlY0RDckNKcjN5dDErRVpEQ0RKaVJueDJxd2Q4TC9PUkY1?=
 =?utf-8?B?alRydlNSSVJxWFo3aEFKOFdDMS9ZQmNBYUxoNVJKUTVNM1ovQ3RJcTZCd1Yv?=
 =?utf-8?B?THpkbTJoUW9CRUh2bU5zUzBDdFFxekFLVWtBMTJRc3E3dUVIcUJodkl5aUQ0?=
 =?utf-8?B?NHlueGZpcVNEaitLb256bk9GbzVHZisrR0tjckNpT3psYXN3ZjlHZEwvOGtQ?=
 =?utf-8?B?R29mOTBKbXdGREJmbmtRVGU0cm1NNk12K3c2Mys0TExOMFVTdjlkMjZSV3M0?=
 =?utf-8?B?TUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <92FD90F90562A74082D1BE9E5C538BFE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8274155e-fb52-4482-97e7-08dc79d906f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2024 21:00:21.1249 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M+nF75mM3eeVnJGTQJslv0+gv6oVUfaQ6G63UTrdovNjQgXX0LrbSBF8zhLnljNDR0F5BNMaECwN652JMsI7VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5319
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

T24gVHVlLCAyMDI0LTA1LTIxIGF0IDEzOjI0IC0wNzAwLCBEaXhpdCwgQXNodXRvc2ggd3JvdGU6
DQo+IE9uIFR1ZSwgMjEgTWF5IDIwMjQgMTE6NDg6MDEgLTA3MDAsIFNvdXphLCBKb3NlIHdyb3Rl
Og0KPiA+IA0KPiANCj4gSGkgSm9zZSwNCj4gDQo+ID4gT24gVHVlLCAyMDI0LTA1LTIxIGF0IDEx
OjAyIC0wNzAwLCBEaXhpdCwgQXNodXRvc2ggd3JvdGU6DQo+ID4gPiBPbiBUdWUsIDIxIE1heSAy
MDI0IDEwOjM5OjE3IC0wNzAwLCBTb3V6YSwgSm9zZSB3cm90ZToNCj4gPiA+ID4gDQo+ID4gPiA+
IE9uIFR1ZSwgMjAyNC0wNS0yMSBhdCAwOTo0MyAtMDcwMCwgRGl4aXQsIEFzaHV0b3NoIHdyb3Rl
Og0KPiA+ID4gPiA+IE9uIFR1ZSwgMjEgTWF5IDIwMjQgMDk6Mjk6NTEgLTA3MDAsIFNvdXphLCBK
b3NlIHdyb3RlOg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBPbiBUdWUsIDIwMjQtMDUtMjEg
YXQgMDk6MTAgLTA3MDAsIERpeGl0LCBBc2h1dG9zaCB3cm90ZToNCj4gPiA+ID4gPiA+ID4gT24g
VHVlLCAyMSBNYXkgMjAyNCAwNzo0Nzo1OCAtMDcwMCwgU291emEsIEpvc2Ugd3JvdGU6DQo+ID4g
PiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiBIaSBKb3NlLA0KPiA+ID4gPiA+ID4gPiANCj4gPiA+
ID4gPiA+ID4gPiA+IE90aGVyIGFzaywgY2FuIHlvdSByZW1vdmUgdGhpcyAnRmFpbGVkIHRvIHJl
bW92ZSB1bmtub3duIE9BIGNvbmZpZycNCj4gPiA+ID4gPiA+ID4gPiA+IGRlYnVnIG1lc3NhZ2Ug
ZnJvbSB4ZV9vYV9yZW1vdmVfY29uZmlnX2lvY3RsKCk/DQo+ID4gPiA+ID4gPiA+ID4gDQo+ID4g
PiA+ID4gPiA+ID4gTWlzc2VkICdJbnN1ZmZpY2llbnQgcHJpdmlsZWdlcyB0byByZW1vdmUgeGUg
T0EgY29uZmlnJywgdGhhdCBuZWVkIHRvIGJlDQo+ID4gPiA+ID4gPiA+ID4gcmVtb3ZlZCB0b28g
ZnJvbSB4ZV9vYV9yZW1vdmVfY29uZmlnX2lvY3RsKCkuDQo+ID4gPiA+ID4gPiA+ID4gDQo+ID4g
PiA+ID4gPiA+ID4gPiBNZXNhIHdpbGwgYmUgdXNpbmcgRFJNX1hFX1BFUkZfT1BfUkVNT1ZFX0NP
TkZJRyB3aXRoIGNvbmZpZyBpZCBzZXQgdG8NCj4gPiA+ID4gPiA+ID4gPiA+IFVJTlQ2NF9NQVgg
dG8gZGV0ZWN0IGlmIFhlIEtNRCBzdXBwb3J0cyBPQSBjb3VudGVycyBhbmQgaWYgYXBwbGljYXRp
b24NCj4gPiA+ID4gPiA+ID4gPiA+IGhhcyBlbm91Z2ggcGVybWlzc2lvbnMgdG8gdXNlIGl0LiAg
U28gaXQgY2F1c2VzIGRtZXNnIHRvIGJlIGZsb29kZWQNCj4gPiA+ID4gPiA+ID4gPiA+IHdpdGgg
J3hlIDAwMDA6MDA6MDIuMDogW2RybTp4ZV9vYV9yZW1vdmVfY29uZmlnX2lvY3RsIFt4ZV1dIEZh
aWxlZCB0bw0KPiA+ID4gPiA+ID4gPiA+ID4gcmVtb3ZlIHVua25vd24gT0EgY29uZmlnJyBtZXNz
YWdlcyB3aGVuIHJ1bm5pbmcgdGVzdHMgc3VpdGVzLg0KPiA+ID4gPiA+ID4gPiA+ID4gDQo+ID4g
PiA+ID4gPiA+ID4gPiBPciBkbyB5b3UgaGF2ZSBvdGhlciBzdWdnZXN0aW9uIG9mIHVBUEkgdGhh
dCBJIGNhbiB1c2UuDQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiBPSywgc28geW91IGFy
ZSByZWx5aW5nIG9uIEVOT0RFViBhbmQgRUFDQ0VTIGVycm5vJ3MgZnJvbQ0KPiA+ID4gPiA+ID4g
PiBEUk1fWEVfUEVSRl9PUF9SRU1PVkVfQ09ORklHIHRvIGZpbmQgb3V0IChhKSBpZiBPQSBpcyBw
cmVzZW50IGFuZCAoYikgaWYNCj4gPiA+ID4gPiA+ID4geW91IG5lZWQgdG8gYmUgcm9vdCAoYWN0
dWFsbHkgQ0FQX1BFUkZNT04gb3IgQ0FQX1NZU19BRE1JTikuDQo+ID4gPiA+ID4gPiANCj4gPiA+
ID4gPiA+IHllcA0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiBU
aGlzIGxvZ2ljIGluIFhlIHNob3VsZCBiZSBjbG9zZSB0byB3aGF0IHdlIGhhdmUgaW4gaTkxNT8g
V2hhdCBkb2VzIE1lc2EgZG8NCj4gPiA+ID4gPiA+ID4gZm9yIGk5MTUsIG9yIHdoYXQgZG9lc24n
dCB3b3JrIGluIFhlPw0KPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gSGVyZSBhcmUgc29t
ZSBwb2ludGVyczoNCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ICogWW91IGNhbiBleGVj
dXRlIERSTV9YRV9ERVZJQ0VfUVVFUllfT0FfVU5JVFMgdG8gc2VlIGlmIE9BIGlzIHByZXNlbnQN
Cj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ICogQWRkL3JlbW92ZSBPQSBjb25maWdzIGFu
ZCB1c2luZyB0aGUgZ2xvYmFsIE9BRyBidWZmZXIgKHRpbWUgYmFzZWQNCj4gPiA+ID4gPiA+ID4g
ICBzYW1wbGluZyBvciBEUk1fWEVfT0FfUFJPUEVSVFlfU0FNUExFX09BIHNldCkgYXJlIHByaXZp
bGlnZWQgb3BlcmF0aW9ucw0KPiA+ID4gPiA+ID4gPiAgIChuZWVkIHJvb3QpLiBPcGVyYXRpb25z
IHdoaWNoIG9ubHkgbmVlZCBPQVIvT0FDIChPQSBxdWVyaWVzLCB3aXRob3V0DQo+ID4gPiA+ID4g
PiA+ICAgRFJNX1hFX09BX1BST1BFUlRZX1NBTVBMRV9PQSkgY2FuIGJlIGV4ZWN1dGVkIGJ5IG5v
bi1yb290Lg0KPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gKiBJZiAiL3Byb2Mvc3lzL2Rl
di94ZS9wZXJmX3N0cmVhbV9wYXJhbm9pZCIgaXMgMCwgYWxsIG9wZXJhdGlvbnMgY2FuIGJlDQo+
ID4gPiA+ID4gPiA+ICAgZXhlY3V0ZWQgYnkgbm9uLXJvb3QgdXNlcnMuIE90aGVyd2lzZSwgYXMg
SSBkZXNjcmliZWQgaW4gdGhlIHByZXZpb3VzDQo+ID4gPiA+ID4gPiA+ICAgcG9pbnQuDQo+ID4g
PiA+ID4gPiANCj4gPiA+ID4gPiA+IEl0IGlzIHBvc3NpYmxlIHRoYXQgcHJvY2VzcyBub3Qgc3Rh
cnRlZCBieSByb290IGhhcyBDQVBfUEVSRk1PTjoNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBZZXMs
IGNvcnJlY3QuDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gQWJvdmUgSSBhbSB1c2luZyAicm9vdCIg
bG9vc2VseSBhcyAiQ0FQX1BFUkZNT04gb3IgQ0FQX1NZU19BRE1JTiIuDQo+ID4gPiA+ID4gDQo+
ID4gPiA+ID4gU28gaWYgcm9vdCBzZXRzICdwZXJmX3N0cmVhbV9wYXJhbm9pZCcgdG8gMCwgbm9y
bWFsIHVzZXJzIGNhbiBkbyBPQQ0KPiA+ID4gPiA+IHByaXZpbGlnZWQgb3BlcmF0aW9ucyAoYXMg
ZGVzY3JpYmVkIGFib3ZlKS4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBJZiByb290IHNldHMgJ3Bl
cmZfc3RyZWFtX3BhcmFub2lkJyB0byAxLCBvbmx5IENBUF9QRVJGTU9OIG9yIENBUF9TWVNfQURN
SU4NCj4gPiA+ID4gPiB1c2VycyBjYW4gZG8gT0EgcHJpdmlsaWdlZCBvcGVyYXRpb25zLg0KPiA+
ID4gPiANCj4gPiA+ID4gb2ggb2theSBzbyBwZXJmX3N0cmVhbV9wYXJhbm9pZCBoYXMgYSBnb29k
IHVzYWdlIGJ1dCBpdCBkbyBub3QgY292ZXJzDQo+ID4gPiA+IENBUF9QRVJGTU9OLCBzZWUgYmVs
b3cuDQo+ID4gPiA+IA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gIlVucHJpdmlsZWdlZCBwcm9j
ZXNzZXMgd2l0aCBlbmFibGVkIENBUF9QRVJGTU9OIGNhcGFiaWxpdHkgYXJlIHRyZWF0ZWQNCj4g
PiA+ID4gPiA+IGFzIHByaXZpbGVnZWQgcHJvY2Vzc2VzIHdpdGggcmVzcGVjdCB0byBwZXJmX2V2
ZW50cyBwZXJmb3JtYW5jZQ0KPiA+ID4gPiA+ID4gbW9uaXRvcmluZyBhbmQgb2JzZXJ2YWJpbGl0
eSBvcGVyYXRpb25zLC4uLiINCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gQW5kIGZyb20gd2hh
dCBJIHVuZGVyc3Rvb2Qgb25seSByb290IGNhbiB3cml0ZSB0byBwZXJmX3N0cmVhbV9wYXJhbm9p
ZCwNCj4gPiA+ID4gPiA+IHNvIEkgZG9uJ3Qgc2VlIGEgcG9pbnQgaW4gaGF2aW5nIHRoaXMgZmls
ZS4uLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFNvIEkgZG9uJ3Qga25vdyBob3cgdGhpcyBzdGF0
ZW1lbnQgZm9sbG93cz8NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiByb290IG9yIHN1cGVydXNlciBp
cyB0aGUgb25lIHdoaWNoIGdpdmVzIHRoZSBwZXJtaXNzaW9uIHRvIG5vbi1DQVBfUEVSRk1PTg0K
PiA+ID4gPiA+IGFuZCBub24tQ0FQX1NZU19BRE1JTiB1c2VycyB0byBiZSBhYmxlIHRvIGRvIHBy
aXZpbGlnZWQgT0Egb3BlcmF0aW9ucy4NCj4gPiA+ID4gDQo+ID4gPiA+IHNvIGlmIEknbSBydW5u
aW5nIGEgcHJvY2VzcyB3aXRoIENBUF9QRVJGTU9OIGFuZCByZWFkDQo+ID4gPiA+IHBlcmZfc3Ry
ZWFtX3BhcmFub2lkIGFuZCBpdCByZXR1cm5zIDANCj4gPiA+IA0KPiA+ID4gMCBpZiBmaW5lLCBl
dmVyeW9uZSBjYW4gdXNlIGFsbCBPQSBjYWxscy4gVGhlIGlzc3VlIGlzIHdpdGggMS4NCj4gPiA+
IA0KPiA+ID4gPiB0aGVyZSBpcyBubyB3YXkgZm9yIFVNRCB0byBrbm93DQo+ID4gPiA+IHRoYXQg
cHJvY2VzcyBpcyBhbGxvd2VkIHRvIHVzZSBYZSBLTUQgT0EgZmVhdHVyZSB3aXRob3V0IGRvIGEg
dUFQSSBjYWxsDQo+ID4gPiA+IHRoYXQgY2hlY2tzIGZvciBDQVBfUEVSRk1PTi4NCj4gPiA+ID4g
DQo+ID4gPiA+IFRoYXQgaXMgd2h5IEkgdGhpbmsgaXMgYmV0dGVyIGp1c3QgZG8gYSBzaW5nbGUN
Cj4gPiA+ID4gRFJNX1hFX1BFUkZfT1BfUkVNT1ZFX0NPTkZJRyB0byBkZXRlY3QgaWYgZmVhdHVy
ZSBpcyBwcmVzZW50IGFuZCBpZg0KPiA+ID4gPiBwcm9jZXNzIGlzIGFsbG93ZWQgdG8gdXNlIGl0
LiBCdXQgaXQgZ2VuZXJhdGVzIGEgYnVuY2ggb2YgZGVidWcgbWVzc2FnZXMuDQo+ID4gPiANCj4g
PiA+IEEgcHJvY2VzcyBzaG91bGQgYmUgYWJsZSB0byBmaW5kIG91dCBvbiBpdHMgb3duLCB3aXRo
b3V0IGhlbHAgZnJvbSBYZQ0KPiA+ID4gZHJpdmVyLCB3aGF0IGl0J3MgY2FwYWJpbGl0aWVzIChD
QVBfUEVSRk1PTiBvciBDQVBfU1lTX0FETUlOIG9yIG5laXRoZXIpDQo+ID4gPiBhcmU6DQo+ID4g
PiANCj4gPiA+IGh0dHBzOi8vd3d3Lmdvb2dsZS5jb20vc2VhcmNoP3E9bGludXgrZ2V0K3Byb2Nl
c3MrY2FwYWJpbGl0aWVzK2luK2MNCj4gPiA+IGh0dHBzOi8vbWFuNy5vcmcvbGludXgvbWFuLXBh
Z2VzL21hbjMvbGliY2FwLjMuaHRtbA0KPiA+ID4gDQo+ID4gDQo+ID4gSSBkb24ndCB0aGluayB0
aGlzIGlzIG11Y2ggcG9ydGFibGUsIEkgZG9uJ3QgdGhpbmsgQlNEIGhhcyB0aGlzIHN5c2ZzDQo+
ID4gd2l0aCBQSUQgY2FwYWJpbGl0aWVzIG9mIHByb2Nlc3MuDQo+IA0KPiBOb3Qgc3VyZSB3aHkg
d2UgYXJlIGJyaW5naW5nIEJTRCBoZXJlIHNpbmNlIHdlIGhhdmUgYSBMaW51eCBLTUQsIG5vdCBh
IEJTRA0KPiBLTUQuIEluIGFueSBjYXNlLCBldmVyeSBPUyBoYXMgc3lzdGVtIGNhbGxzIGZvciBh
IHByb2Nlc3MgdG8gcXVlcnkgaXRzDQo+IHByb3BlcnRpZXMuDQoNCkJTRCB3cmFwcyBMaW51eCBk
cm0gZHJpdmVycyBpbnRvIGEgdHJhbnNsYXRpb24gbGF5ZXIuDQoNCmh0dHBzOi8vd3d3LmZyZXNo
cG9ydHMub3JnL2dyYXBoaWNzL2RybS1rbW9kLw0KDQo+IA0KPiBTbyBpZiB0aGVzZSBhcmUgbm90
IHBvcnRhYmxlLCB5b3UgZG9uJ3QgaGF2ZSB0byB1c2UgdGhlc2UgbGlicmFyeSBjYWxscywNCj4g
eW91IHNob3VsZCBiZSBhYmxlIHRvIHVzZSBkaXJlY3QgY2FsbHMgaW50byB0aGUgT1MgdG8gZmlu
ZCBzdHVmZiBvdXQuDQoNClRoYXQgaXMgdGhlIHByb2JsZW0sIExpbnV4IGV4cG9zZXMgcHJvY2Vz
cyBjYXBhYmlsaXRpZXMgaW4gc3lzZnMgd2hpbGUgQlNEIGRvbid0IGV2ZW4gaGFzIGNvbmNlcHQg
b2YgY2FwYWJpbGl0aWVzLCBpdCBoYXMgcHJpdmlsZWdlcy4uLg0KDQo+IA0KPiA+IEFsc28gaWYg
bGF0ZXIgWGUgS01EIGFkZHMgb3IgcmVtb3ZlcyBwcm9jZXNzIGNhcGFiaWxpdGllcyB0aGF0IGhh
cyBhY2Nlc3MNCj4gPiB0byBPQSBpdCB3aWxsIGJyZWFrIFVNRHMuDQo+IA0KPiBUaGF0IHdvdWxk
IGJlIGJyZWFraW5nIHRoZSB1YXBpLCBzbyBvbmNlIGl0IGlzIG1lcmdlZCBpdCBjYW5ub3QgYmUg
Y2hhbmdlZC4NCj4gDQo+ID4gaHR0cHM6Ly93aWtpLmZyZWVic2Qub3JnL0dyYXBoaWNzL0ludGVs
LUdQVS1NYXRyaXgNCj4gPiANCj4gPiBJIHRoaW5rIHdvdWxkIGJlIGJldHRlciB0byB1c2UgdUFQ
SXMgdG8gZmlndXJlIG91dCBwZXJtaXNzaW9ucy4NCj4gDQo+IEFzIEkgc2FpZCwgdGhlIGNvcnJl
Y3Qgd2F5IHRvIGRvIHRoaXMgaXMgdG8gdXNlIE9TIGNhbGxzLiBJbiBhbnkgY2FzZSwgSQ0KPiBk
b24ndCB0aGluayB3ZSBjYW4gcmVtb3ZlIHRoZSBkZWJ1ZyBtZXNzYWdlcyBiZWNhdXNlIHRoZXkg
YXJlIHVzZWZ1bCBmb3INCj4gZGVidWdnaW5nICh0aGF0J3Mgd2h5IHRoZXkgYXJlIHRoZXJlKS4N
Cg0KTW9zdCBvZiBYZSB1QVBJIGRvbid0IGhhdmUgdGhpcyBsZXZlbCBkZWJ1ZyBtZXNzYWdlLg0K
RUFDQ0VTIGlzIHByZXR0eSBjbGVhciB3aGF0IGlzIHRoZSBpc3N1ZSBhbmQgaXQgZG9uJ3QgbmVl
ZCBhIGRlYnVnIG1lc3NhZ2UgaW4gbXkgb3Bpbmlvbi4gDQoNCj4gDQo+IEFsc28sIGxvb2tpbmcg
YXQgaW50ZWxfcGVyZl9pbml0X21ldHJpY3MoKS0+b2FfbWV0cmljc19hdmFpbGFibGUoKSwNCj4g
Y3VycmVudGx5IGl0IGp1c3QgY2FsbHMgZ2V0ZXVpZCgpIGFuZCBkb2Vzbid0IHdvcnJ5IGFib3V0
IENBUF9QRVJGTU9OLiBPZg0KPiBjb3Vyc2UgeW91IGNhbiBhZGQgdGhhdCwgYnV0IHRoZW4geW91
IHdpbGwgbmVlZCB0byBmaWd1cmUgb3V0IHRoZSBjb3JyZWN0DQo+IHdheSB0byBkbyBpdC4gVGhl
IGN1cnJlbnQgaW1wbGVtZW50YXRpb24gb2Ygb2FfbWV0cmljc19hdmFpbGFibGUoKSBzZWVtcw0K
PiBtb3N0bHkgb2sgdG8gbWUgYW5kIGRvZXNuJ3QgY2FsbCByZW1vdmVfY29uZmlnKCkgZXRjLiBz
byBJTU8gd2Ugc2hvdWxkDQo+IGNvbnRpbnVlIHRoYXQgYXBwcm9hY2ggZm9yIFhlIHRvby4NCg0K
aTkxNSBpcyBtaXNzaW5nIENBUF9QRVJGTU9OIGhhbmRsaW5nIGJlY2F1c2UgaXQgd2FzIGFkZGVk
ICggaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS94ZS9rZXJuZWwvLS9jb21taXQv
OTgwNzM3MjgyMjMyYjcgKSBhZnRlciBpOTE1IE9BIHVBUEkuDQpGb3IgaTkxNSBJIGRvbid0IGNh
cmUgYXQgdGhpcyBwb2ludCBidXQgZm9yIFhlIEtNRCBpdCBpcyBpbXBvcnRhbnQgdG8gc3VwcG9y
dCBDQVBfUEVSRk1PTiBhbmQgQ0FQX1NZU19BRE1JTi4NCg0KPiANCj4gVGhhbmtzLg0KPiAtLQ0K
PiBBc2h1dG9zaA0KPiANCj4gDQo+IA0KPiA+IA0KPiA+ID4gQW5kIHRoZXJlZm9yZSwgYWxvbmcg
d2l0aCBwZXJmX3N0cmVhbV9wYXJhbm9pZCwgZGV0ZXJtaW5lIHdoaWNoIE9BIGNhbGxzIGl0DQo+
ID4gPiBjYW4gdXNlLg0KPiA+ID4gDQo+ID4gPiA+IA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4g
PiBTbyBiYXNpY2FsbHkgSSB0aGluayB5b3UganVzdCBuZWVkIHRvIGNoZWNrIGZvciB0aGUgcGVy
Zl9zdHJlYW1fcGFyYW5vaWQNCj4gPiA+ID4gPiA+ID4gZmlsZSBhYm92ZS4gSXQgd2lsbCB0ZWxs
IHlvdSBib3RoIChhKSBpZiBPQSBpcyBwcmVzZW50IChiZWNhdXNlIHdlIGFyZQ0KPiA+ID4gPiA+
ID4gPiBnb2luZyB0byBtZXJnZSB0aGUgY29kZSB3aGljaCBjcmVhdGVzIHRoaXMgZmlsZSB0b2dl
dGhlciB3aXRoIE9BKSBhbmQgKGIpDQo+ID4gPiA+ID4gPiA+IGlmIHlvdSBuZWVkIHRvIGJlIHJv
b3QgZm9yIHBhcnRpY3VsYXIgb3BlcmF0aW9ucy4NCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4g
PiA+IFRoYW5rcy4NCj4gPiA+ID4gPiA+ID4gLS0NCj4gPiA+ID4gPiA+ID4gQXNodXRvc2gNCj4g
PiA+ID4gPiA+IA0KPiA+ID4gPiANCj4gPiANCg0K
