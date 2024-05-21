Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754CDC25B78
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 18:48:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6747110F075;
	Tue, 21 May 2024 18:48:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dLsrAmnZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948D310F040
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 18:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716317286; x=1747853286;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=UqAG+PKkLLjLH2eYlOlTqJ1zyPJl8xTGJCnWoNq6sGI=;
 b=dLsrAmnZE3RX4lcx1a13RF2K2rNH1tNrnXOA42X3mpUePoTksHIir3We
 UxA7bQkH5l/SUcbV6bcbVS/GZJ4WGL3q/upU9JquY9Ft1hvXfW83MIqr7
 ugCk+1xNuAlrq7oScDHCmq5DABMvGJdijJ1hZLrFpoa5xxR72Aguq4JfM
 oZCmrEFpWITCjfgVZh4MyvGQXAAIBPHV03ZyYAXWXSvVONVxUMG/w1Km1
 aKRtz1KodYUeV8lmb2G0juEEEAVSCd0rhRT5wFO6uc8FcU6SL8Fmx0W3T
 glPTtVborQZZ1KOQSxHv+aiu/GGMqp7uM404fls5YMnEsPVItFZI8ubow Q==;
X-CSE-ConnectionGUID: XnwEaUvlTwiWYEQBySkWZg==
X-CSE-MsgGUID: Gw4e2XlKRGKY0x+Q/Rs4jg==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="12374912"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="12374912"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 11:48:05 -0700
X-CSE-ConnectionGUID: VfdRnJv7RjCP57fAzPnLkA==
X-CSE-MsgGUID: 5zPxJZO7SVKp4oEJpYIZ0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="33620959"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 May 2024 11:48:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 11:48:04 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 21 May 2024 11:48:04 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 11:48:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mZdLLVYRdr+LMeAU/0EsH6SxYrAtXdmZr47iRO8Zi7K2wTZAUbfKy4rZtXDQZYngHEeqKO/kMV+dSFTnex0Q5hrR327Q98wrjGOPtqDOqypQQETui9Qtpcs5BDXWbUmnb99rKiLrpIkpExzRME1hoQZlTOgorXy+DukyDv5ty7hezSKKK+Tk2IS9RHHfKgNPHM4tTrKJ+f7Z22k4j81Et3xeHhSLwjh/2yLRKiNnuBa9AgC2rD75xK7/VXgdJpj9MMfGGDkNkWx7Ulqa9tpj80ulLk14KQEtANDEI9Vi0VIeVxc0A7S4RqGcRPF28ZdKiNMio+A31Z8p5V9bDOqdFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UqAG+PKkLLjLH2eYlOlTqJ1zyPJl8xTGJCnWoNq6sGI=;
 b=VflhNiOIlCKEh4xxbyJWxsRMBBFev8fpjlQbVyzK2yYl+p7pD31N4J19zSjPD08lfQwZ2uAsPxVlULkX083b+w4sYC6LaQPVEBx9r6cK+777JlHba/Ti+Zt2fljB4eF3sc4vtq0ibatunt26LWgzTVUPY+YilFlxCg1IFz2peL97j9fr3KY0kcnxzvic2ODtP1lfvLr26mZRRNOBgLwGUCvGv7pPsTSP3L5ye20saVc1paONbIZvGe92dlKhxjNUyV5NWQVTlhsgUHrI/hbUkOHsK61Yat5M7y4Hmv9yqY6aLwEivD4oxBDln6ABQgFyyo1jMG3J4qSjltCWu3y/Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by MW4PR11MB7164.namprd11.prod.outlook.com (2603:10b6:303:212::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 18:48:01 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%6]) with mapi id 15.20.7587.028; Tue, 21 May 2024
 18:48:01 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Krzemien, Robert" <robert.krzemien@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Landwerlin, Lionel G"
 <lionel.g.landwerlin@intel.com>
Subject: Re: [PATCH 00/17] Add OA functionality to Xe
Thread-Topic: [PATCH 00/17] Add OA functionality to Xe
Thread-Index: AQHadnkcIUwutN2VakWosatViFIW8bGcJwYAgAB1PYCABZE6AIAAAUuAgAAW/ICAAAV7AIAAA74AgAAPqACAAAZugIAADMWA
Date: Tue, 21 May 2024 18:48:01 +0000
Message-ID: <88aebb2ae768758273219f6097fee13d4984a726.camel@intel.com>
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
In-Reply-To: <87wmnnoxg8.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|MW4PR11MB7164:EE_
x-ms-office365-filtering-correlation-id: d6025f3c-e5b0-469f-bf5a-08dc79c68a54
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?N0NXTUkwdVUxMUVjSTFtOFRHd0lmdVAzQzBFeFZOZUtPbndJUjhod1d5T2Zv?=
 =?utf-8?B?TDlWTis1V2lSSzdmV3Zib09kbzk3TVNjeE1oZGx6Y0lrcWlpVDBMaTVzMDJV?=
 =?utf-8?B?aEJjRkdGZXpGNlZJR25ZYWpKSklrMlV6ZDh6QWMyWnF0Q3pqUTl1bzlEcW5n?=
 =?utf-8?B?Rzl0WkpOeWhoNnpiL3l2d3dUTURHeU1va1o4TzB1dzlNK2t6dXBRcDVVNDZP?=
 =?utf-8?B?bFlQcUhocTlQWk5WYzhqSWFHdkM4NG5tZlNQNm13VC82M1g1YS9RSFYwQnMx?=
 =?utf-8?B?cHhlMGlFWTNQOHZBK2NtOTBQcXFoRm83cmExK2p1RzB4Unp2a0txdzZXdjZt?=
 =?utf-8?B?c21jZlZYQjl6blBxQzVFVkpZUHBNc0dVVHFEaHVRRy9QVEQvbnV2WTBOZ1dB?=
 =?utf-8?B?SzE5a0ZBcjhjNHhSejdqb0RWREhxR3JIWXg5b1ArTkQvRGJjZjg2SjJJMUZV?=
 =?utf-8?B?RDBwSVQwTy8xT0xzVGU5QzFzUTQ4MTk0d1E2aVlHdWYzRTlEWitiQlkvQzVE?=
 =?utf-8?B?TnAzU0FXTHd3OWRISGRodmNrOWZMTDBGWFpabFJkNzNJWHlKVHJGY0NqaGMx?=
 =?utf-8?B?R2hVWEhmK2xjTEg3dkw2V3lWdWkwclU5OG0zSlVwZ01PaFB1MjdqRGVzcEQz?=
 =?utf-8?B?ZG43Rm5iZnU5VXdWYzhZaUpDOFpYamZFWUhvcjdodW10QzRxUTRzY1FGZEU2?=
 =?utf-8?B?WkxrY2JBYjVyU3BYdGtpMEkvdnRnZ0xJSXRKaVBkRlB3UDMxYjVpWXVkQzJ1?=
 =?utf-8?B?VWZNdXc5ZktQUnYzWlc3bGxtUTNpc2xZMmFPdkswbWVNMENJMFdNQllNM3BB?=
 =?utf-8?B?OVpaZDAvOXJJMFZTZ2pQb04yT2gzV2gxbUhEcnZKQkhtYnovRGluT09Rd2dF?=
 =?utf-8?B?eHRKWjlpYlZqZzlLd0VXK1huVS9HL2xNUGJpTzVuWGp6QVFRVSsrOFUrbnU3?=
 =?utf-8?B?MEFna01aMklWSWFtVjBvalZtdk5UVERFbVNyWkd4eEdvTjJDY0F2QzRrUDhB?=
 =?utf-8?B?S1lSZmpTYnd5UWFleURpVXo0LzA2ajlxUjc2VEZ4K0JtT202c3BTWUdvdGRE?=
 =?utf-8?B?Z2lkZFhWSStHTHJ5amR3c003N0VycFZSRUdZNHF3UlNObytpZlpkdlIyQ0F2?=
 =?utf-8?B?L3Z6SEVNVjlxVitwdDY3MUE0TWJMQ3JKSGZnbFhEODdhU1A5SHdpeEFpRFFi?=
 =?utf-8?B?ak44UThkV2lUYkdoZ1FXNGV1ejNJMGtGOTM3bUk0MHNkd3lLZ2prc1JLd3NX?=
 =?utf-8?B?cnRLL3drcGllbUVrZ2lJNFdoNk1hcFlFYUFkcW1kSUlDUDV3YVpWNzRiZmI5?=
 =?utf-8?B?M2Z3N3daTmlieHBkK3BRVEhTVThZQnhlNnZLOTBIQzdaY1lDbUZyaE45ZWIw?=
 =?utf-8?B?QnB6YzVwUGZBZTRySnlhd01jMW82WDF0Z3ZocTVDQnZKd2hTNzdadThCcmlZ?=
 =?utf-8?B?R3RBZFFVQ3dSR2tUYzFEekdMYytaNE0vMHczZU5pQm9kd3NiUlVWZ3MyM0Rz?=
 =?utf-8?B?N1MyTWx2dW5SZWRDT0VJY2lzUEo0Q0lDUERzdW15U2o5WUZma0xDOHRQcUY0?=
 =?utf-8?B?RExrVDlucVFjQk1JWHVZZWFTQ1NZSlhDdkxtc2JTeFJ2YmxBSTBEbFg4UE5R?=
 =?utf-8?B?Y0JwZ1R2UHdnYmUyNXpDYzJBWkkvTTRlMmhjR0dySjNTM3Voa3VaUWxzYlBm?=
 =?utf-8?B?VmRhbTZBM2JOTml3ekVNWXU3UjQ5eTlDdVFiQXdxcGN4bGJLYVV6alRBY25J?=
 =?utf-8?Q?qE0xvWYBMrcRJaFksU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZEI0aENUZVBpaFZxMDJWQ1ZjWloycW5ubm9LL2VDNm9CV0FpQ1FVUGs0K09W?=
 =?utf-8?B?Q2hWNUlpNFZGaDNKM0M3d0lwYmlXYmNZMS8xN2Z1OG5KOEptRmRsTzM3c081?=
 =?utf-8?B?NFp4aFFSUVdhZEQ2YjRINkdQQ3dvTDhPZW1WQ1oxZlI2Wk5FOW5vYlgxRGVM?=
 =?utf-8?B?K200NFk1M2xDS3VuMDJuZ3M2V2xFM0ZCa2hVVHhSVWhaZ1ZyTDVqWkhEZkhN?=
 =?utf-8?B?eUVnT2FhUXNZdXBDWFJ4UEdyZmZadS9tbVZOdStVcmFPQWxQd0p3RC9CMDRZ?=
 =?utf-8?B?amJKZHRRSmxRY25uNENESWdhTEJKckNtNEVkbmZubVF0V3hvVnNpWk5FdEJQ?=
 =?utf-8?B?UnFNQ29WZkJCcVl0MnMrNkJoWHZQNFdKaVU1T1JBK2RhaE5HVUwzRVY4Sjk1?=
 =?utf-8?B?elZlK3RUSTVQL2REajRHOHVUT1Z4TWxBMVBFUWZlcG1uajRVSXhEYWRxUVY2?=
 =?utf-8?B?M1NCVURCVjh3VmdPdXNkR0ZWbVI4ODRqaUdZT0VLQkx5bTh2cWlJdkJFczY2?=
 =?utf-8?B?WEo3aU1kU2d6WmVSTUNka2oxWUxPK0tKWnpGNUJuOHlMVVpqQ0pFZ2paMFRI?=
 =?utf-8?B?Q0toakQvMTFWK1N5RkJleTJWL1R0eXhoYUFlNHpWT1lmM0txOU4vdGJPbjFX?=
 =?utf-8?B?enNWNGxjZHNDb1BmdWlUL01PajZ0UTA0NDBLY2tGRllaR0tQa1c0VEtnaThE?=
 =?utf-8?B?QWw2ZmNNWlJSNzVnSVpnVVdUSjRMYkhiN3B4RW9mV1htYm8yWi9ITytTSXlL?=
 =?utf-8?B?cjdhRVFzdGUrblJWaHRXYVZXenUxVUNuSVg5UlBmeEFiVm5TRDdQZVlKQzE0?=
 =?utf-8?B?TVFjUjNnWGVMUE5xdTRrOWpIbXVwaHcrRVhWOEdVc0NQRlU5Y3pmSEt6TW1Y?=
 =?utf-8?B?c3QxY2JpMEU5bHk0eU9Kc0ZzRGQ3THkvWkk5TCsvMkUzVXgraWU0Q0NCOVlJ?=
 =?utf-8?B?b0x5Z3NjS3VSWnlOU0VyMG5peENPbDB5bXpyVUF4WEQvTEMxUlJKRmRNV2Jz?=
 =?utf-8?B?RFYyR2hsQkFiT1JGaW9ZQ2w4Z2tEV1hWT3lyU00vZ1FQN1dRb1U2cnlZNXJY?=
 =?utf-8?B?RGV5cllmY2lkOWg5VEJoVkorZExRZnhQQmMvMDlFSGNSTFdSSUlJYi9SWXZp?=
 =?utf-8?B?aWd4SXEvK1NJVkRwbFFtdk5LejR5YTdCV0NrdHpaaTUzckpYZVVUaUpNRHlP?=
 =?utf-8?B?dFdKcDdMdUR6ZHhZNU5VdmIwOGlxNFBpazczbDNiZDMxNVVuZFhTSDZiZkVv?=
 =?utf-8?B?S25sbjBLRnJ1OURDUUlBNGRybmxQajZURVBSTGZHQzlpUU9rNHF5MWVkT1Nj?=
 =?utf-8?B?YkFrUUVBRlVOc0ExKzZrVmtVWXVoV09RSFdEQjRDOHppWk9VcDlBSUdkRTVE?=
 =?utf-8?B?OTNaSVV1YkdCMFpBSUdYcEdlRWtKRS9zUUd1dzZ1NzAzdnVrQzVVTm9XRHhT?=
 =?utf-8?B?MW05NlpTU0U0Mkg3dWMxY2tFdXBnSzYvcUxPaHJ4czU4ZjY1aEZhN0RJSWcv?=
 =?utf-8?B?SUdOclRmSHo1VUs2SWlwMmpwNGJ5djhKd1FoVUFFMXA4VEZ4SWdsOFZWVEQx?=
 =?utf-8?B?OTAzc3lCQW9POVZnV3lNOWYwWUVHOU5iaVFBTTl0enZhQXFwUGU1d1hzcWZz?=
 =?utf-8?B?clYzOW5oMGRESzdDUlovRzQ4Z2RsakVEWGNGTWt2NlJpUzJyWDA5Wk5kblBN?=
 =?utf-8?B?dW9lMGZCdEFzN0ZOTDdXRVNZRGxlanBKTDVINVAwdW10aHRCSE9USm9WQ1g5?=
 =?utf-8?B?OVNZUHVGTWl0aFFsckg4R2VsUEMzbTNOZGNGNTZpZitJWi9tai93NHpGeEJu?=
 =?utf-8?B?cmdkRkJkTktBRm0vdjJtNUVuaE5kYmNDU2ZmQlhHZ1BjR2FsWm9ONm9WRVh6?=
 =?utf-8?B?bW5GMmVNMVVOY05WRWUwdVdLKy9CeXR2dWxLZENUSlNkMEh3Yjk2alRwaTdZ?=
 =?utf-8?B?R0hIZDJjcHV1VVlkTzY2NzNHZWtoOGlXMThzK3ZCOEhXcEt6WDIyVXZidnFh?=
 =?utf-8?B?TndPMlFMNWpBTHM1ZVRsQXZWTmY5Q2FwTFRENTNmbVcyUkxOa2V3WG00WHFH?=
 =?utf-8?B?a2owZkpDTE1USkgzU1NGTitUdHVlYzNhVmt0Nk8wK0MyY2FGa0xqTFNNdlQr?=
 =?utf-8?B?YWppbXVNNW5tSmpOaExuSWxaOHpQejJtZ01yRXA2Q0htTExEa2oxZHZxaVhQ?=
 =?utf-8?B?eUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <72820AF48B08CC408EC92BF8E41EF57F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6025f3c-e5b0-469f-bf5a-08dc79c68a54
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2024 18:48:01.1023 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kFP119QXeX3CCkLqcmjIgEo6yiwnJYpNQAB6EUIptFlcyUBA2qv3aDEKZz5h2niuRT64rZyqAiR4m9jQxMatAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7164
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

T24gVHVlLCAyMDI0LTA1LTIxIGF0IDExOjAyIC0wNzAwLCBEaXhpdCwgQXNodXRvc2ggd3JvdGU6
DQo+IE9uIFR1ZSwgMjEgTWF5IDIwMjQgMTA6Mzk6MTcgLTA3MDAsIFNvdXphLCBKb3NlIHdyb3Rl
Og0KPiA+IA0KPiA+IE9uIFR1ZSwgMjAyNC0wNS0yMSBhdCAwOTo0MyAtMDcwMCwgRGl4aXQsIEFz
aHV0b3NoIHdyb3RlOg0KPiA+ID4gT24gVHVlLCAyMSBNYXkgMjAyNCAwOToyOTo1MSAtMDcwMCwg
U291emEsIEpvc2Ugd3JvdGU6DQo+ID4gPiA+IA0KPiA+ID4gPiBPbiBUdWUsIDIwMjQtMDUtMjEg
YXQgMDk6MTAgLTA3MDAsIERpeGl0LCBBc2h1dG9zaCB3cm90ZToNCj4gPiA+ID4gPiBPbiBUdWUs
IDIxIE1heSAyMDI0IDA3OjQ3OjU4IC0wNzAwLCBTb3V6YSwgSm9zZSB3cm90ZToNCj4gPiA+ID4g
PiANCj4gPiA+ID4gPiBIaSBKb3NlLA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiBPdGhlciBh
c2ssIGNhbiB5b3UgcmVtb3ZlIHRoaXMgJ0ZhaWxlZCB0byByZW1vdmUgdW5rbm93biBPQSBjb25m
aWcnDQo+ID4gPiA+ID4gPiA+IGRlYnVnIG1lc3NhZ2UgZnJvbSB4ZV9vYV9yZW1vdmVfY29uZmln
X2lvY3RsKCk/DQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IE1pc3NlZCAnSW5zdWZmaWNpZW50
IHByaXZpbGVnZXMgdG8gcmVtb3ZlIHhlIE9BIGNvbmZpZycsIHRoYXQgbmVlZCB0byBiZQ0KPiA+
ID4gPiA+ID4gcmVtb3ZlZCB0b28gZnJvbSB4ZV9vYV9yZW1vdmVfY29uZmlnX2lvY3RsKCkuDQo+
ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gTWVzYSB3aWxsIGJlIHVzaW5nIERSTV9YRV9QRVJG
X09QX1JFTU9WRV9DT05GSUcgd2l0aCBjb25maWcgaWQgc2V0IHRvDQo+ID4gPiA+ID4gPiA+IFVJ
TlQ2NF9NQVggdG8gZGV0ZWN0IGlmIFhlIEtNRCBzdXBwb3J0cyBPQSBjb3VudGVycyBhbmQgaWYg
YXBwbGljYXRpb24NCj4gPiA+ID4gPiA+ID4gaGFzIGVub3VnaCBwZXJtaXNzaW9ucyB0byB1c2Ug
aXQuICBTbyBpdCBjYXVzZXMgZG1lc2cgdG8gYmUgZmxvb2RlZA0KPiA+ID4gPiA+ID4gPiB3aXRo
ICd4ZSAwMDAwOjAwOjAyLjA6IFtkcm06eGVfb2FfcmVtb3ZlX2NvbmZpZ19pb2N0bCBbeGVdXSBG
YWlsZWQgdG8NCj4gPiA+ID4gPiA+ID4gcmVtb3ZlIHVua25vd24gT0EgY29uZmlnJyBtZXNzYWdl
cyB3aGVuIHJ1bm5pbmcgdGVzdHMgc3VpdGVzLg0KPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+
ID4gT3IgZG8geW91IGhhdmUgb3RoZXIgc3VnZ2VzdGlvbiBvZiB1QVBJIHRoYXQgSSBjYW4gdXNl
Lg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IE9LLCBzbyB5b3UgYXJlIHJlbHlpbmcgb24gRU5PREVW
IGFuZCBFQUNDRVMgZXJybm8ncyBmcm9tDQo+ID4gPiA+ID4gRFJNX1hFX1BFUkZfT1BfUkVNT1ZF
X0NPTkZJRyB0byBmaW5kIG91dCAoYSkgaWYgT0EgaXMgcHJlc2VudCBhbmQgKGIpIGlmDQo+ID4g
PiA+ID4geW91IG5lZWQgdG8gYmUgcm9vdCAoYWN0dWFsbHkgQ0FQX1BFUkZNT04gb3IgQ0FQX1NZ
U19BRE1JTikuDQo+ID4gPiA+IA0KPiA+ID4gPiB5ZXANCj4gPiA+ID4gDQo+ID4gPiA+ID4gDQo+
ID4gPiA+ID4gVGhpcyBsb2dpYyBpbiBYZSBzaG91bGQgYmUgY2xvc2UgdG8gd2hhdCB3ZSBoYXZl
IGluIGk5MTU/IFdoYXQgZG9lcyBNZXNhIGRvDQo+ID4gPiA+ID4gZm9yIGk5MTUsIG9yIHdoYXQg
ZG9lc24ndCB3b3JrIGluIFhlPw0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IEhlcmUgYXJlIHNvbWUg
cG9pbnRlcnM6DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gKiBZb3UgY2FuIGV4ZWN1dGUgRFJNX1hF
X0RFVklDRV9RVUVSWV9PQV9VTklUUyB0byBzZWUgaWYgT0EgaXMgcHJlc2VudA0KPiA+ID4gPiA+
IA0KPiA+ID4gPiA+ICogQWRkL3JlbW92ZSBPQSBjb25maWdzIGFuZCB1c2luZyB0aGUgZ2xvYmFs
IE9BRyBidWZmZXIgKHRpbWUgYmFzZWQNCj4gPiA+ID4gPiAgIHNhbXBsaW5nIG9yIERSTV9YRV9P
QV9QUk9QRVJUWV9TQU1QTEVfT0Egc2V0KSBhcmUgcHJpdmlsaWdlZCBvcGVyYXRpb25zDQo+ID4g
PiA+ID4gICAobmVlZCByb290KS4gT3BlcmF0aW9ucyB3aGljaCBvbmx5IG5lZWQgT0FSL09BQyAo
T0EgcXVlcmllcywgd2l0aG91dA0KPiA+ID4gPiA+ICAgRFJNX1hFX09BX1BST1BFUlRZX1NBTVBM
RV9PQSkgY2FuIGJlIGV4ZWN1dGVkIGJ5IG5vbi1yb290Lg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+
ICogSWYgIi9wcm9jL3N5cy9kZXYveGUvcGVyZl9zdHJlYW1fcGFyYW5vaWQiIGlzIDAsIGFsbCBv
cGVyYXRpb25zIGNhbiBiZQ0KPiA+ID4gPiA+ICAgZXhlY3V0ZWQgYnkgbm9uLXJvb3QgdXNlcnMu
IE90aGVyd2lzZSwgYXMgSSBkZXNjcmliZWQgaW4gdGhlIHByZXZpb3VzDQo+ID4gPiA+ID4gICBw
b2ludC4NCj4gPiA+ID4gDQo+ID4gPiA+IEl0IGlzIHBvc3NpYmxlIHRoYXQgcHJvY2VzcyBub3Qg
c3RhcnRlZCBieSByb290IGhhcyBDQVBfUEVSRk1PTjoNCj4gPiA+IA0KPiA+ID4gWWVzLCBjb3Jy
ZWN0Lg0KPiA+ID4gDQo+ID4gPiBBYm92ZSBJIGFtIHVzaW5nICJyb290IiBsb29zZWx5IGFzICJD
QVBfUEVSRk1PTiBvciBDQVBfU1lTX0FETUlOIi4NCj4gPiA+IA0KPiA+ID4gU28gaWYgcm9vdCBz
ZXRzICdwZXJmX3N0cmVhbV9wYXJhbm9pZCcgdG8gMCwgbm9ybWFsIHVzZXJzIGNhbiBkbyBPQQ0K
PiA+ID4gcHJpdmlsaWdlZCBvcGVyYXRpb25zIChhcyBkZXNjcmliZWQgYWJvdmUpLg0KPiA+ID4g
DQo+ID4gPiBJZiByb290IHNldHMgJ3BlcmZfc3RyZWFtX3BhcmFub2lkJyB0byAxLCBvbmx5IENB
UF9QRVJGTU9OIG9yIENBUF9TWVNfQURNSU4NCj4gPiA+IHVzZXJzIGNhbiBkbyBPQSBwcml2aWxp
Z2VkIG9wZXJhdGlvbnMuDQo+ID4gDQo+ID4gb2ggb2theSBzbyBwZXJmX3N0cmVhbV9wYXJhbm9p
ZCBoYXMgYSBnb29kIHVzYWdlIGJ1dCBpdCBkbyBub3QgY292ZXJzDQo+ID4gQ0FQX1BFUkZNT04s
IHNlZSBiZWxvdy4NCj4gPiANCj4gPiA+IA0KPiA+ID4gPiAiVW5wcml2aWxlZ2VkIHByb2Nlc3Nl
cyB3aXRoIGVuYWJsZWQgQ0FQX1BFUkZNT04gY2FwYWJpbGl0eSBhcmUgdHJlYXRlZA0KPiA+ID4g
PiBhcyBwcml2aWxlZ2VkIHByb2Nlc3NlcyB3aXRoIHJlc3BlY3QgdG8gcGVyZl9ldmVudHMgcGVy
Zm9ybWFuY2UNCj4gPiA+ID4gbW9uaXRvcmluZyBhbmQgb2JzZXJ2YWJpbGl0eSBvcGVyYXRpb25z
LC4uLiINCj4gPiA+ID4gDQo+ID4gPiA+IEFuZCBmcm9tIHdoYXQgSSB1bmRlcnN0b29kIG9ubHkg
cm9vdCBjYW4gd3JpdGUgdG8gcGVyZl9zdHJlYW1fcGFyYW5vaWQsDQo+ID4gPiA+IHNvIEkgZG9u
J3Qgc2VlIGEgcG9pbnQgaW4gaGF2aW5nIHRoaXMgZmlsZS4uLg0KPiA+ID4gDQo+ID4gPiBTbyBJ
IGRvbid0IGtub3cgaG93IHRoaXMgc3RhdGVtZW50IGZvbGxvd3M/DQo+ID4gPiANCj4gPiA+IHJv
b3Qgb3Igc3VwZXJ1c2VyIGlzIHRoZSBvbmUgd2hpY2ggZ2l2ZXMgdGhlIHBlcm1pc3Npb24gdG8g
bm9uLUNBUF9QRVJGTU9ODQo+ID4gPiBhbmQgbm9uLUNBUF9TWVNfQURNSU4gdXNlcnMgdG8gYmUg
YWJsZSB0byBkbyBwcml2aWxpZ2VkIE9BIG9wZXJhdGlvbnMuDQo+ID4gDQo+ID4gc28gaWYgSSdt
IHJ1bm5pbmcgYSBwcm9jZXNzIHdpdGggQ0FQX1BFUkZNT04gYW5kIHJlYWQNCj4gPiBwZXJmX3N0
cmVhbV9wYXJhbm9pZCBhbmQgaXQgcmV0dXJucyAwDQo+IA0KPiAwIGlmIGZpbmUsIGV2ZXJ5b25l
IGNhbiB1c2UgYWxsIE9BIGNhbGxzLiBUaGUgaXNzdWUgaXMgd2l0aCAxLg0KPiANCj4gPiB0aGVy
ZSBpcyBubyB3YXkgZm9yIFVNRCB0byBrbm93DQo+ID4gdGhhdCBwcm9jZXNzIGlzIGFsbG93ZWQg
dG8gdXNlIFhlIEtNRCBPQSBmZWF0dXJlIHdpdGhvdXQgZG8gYSB1QVBJIGNhbGwNCj4gPiB0aGF0
IGNoZWNrcyBmb3IgQ0FQX1BFUkZNT04uDQo+ID4gDQo+ID4gVGhhdCBpcyB3aHkgSSB0aGluayBp
cyBiZXR0ZXIganVzdCBkbyBhIHNpbmdsZQ0KPiA+IERSTV9YRV9QRVJGX09QX1JFTU9WRV9DT05G
SUcgdG8gZGV0ZWN0IGlmIGZlYXR1cmUgaXMgcHJlc2VudCBhbmQgaWYNCj4gPiBwcm9jZXNzIGlz
IGFsbG93ZWQgdG8gdXNlIGl0LiBCdXQgaXQgZ2VuZXJhdGVzIGEgYnVuY2ggb2YgZGVidWcgbWVz
c2FnZXMuDQo+IA0KPiBBIHByb2Nlc3Mgc2hvdWxkIGJlIGFibGUgdG8gZmluZCBvdXQgb24gaXRz
IG93biwgd2l0aG91dCBoZWxwIGZyb20gWGUNCj4gZHJpdmVyLCB3aGF0IGl0J3MgY2FwYWJpbGl0
aWVzIChDQVBfUEVSRk1PTiBvciBDQVBfU1lTX0FETUlOIG9yIG5laXRoZXIpDQo+IGFyZToNCj4g
DQo+IGh0dHBzOi8vd3d3Lmdvb2dsZS5jb20vc2VhcmNoP3E9bGludXgrZ2V0K3Byb2Nlc3MrY2Fw
YWJpbGl0aWVzK2luK2MNCj4gaHR0cHM6Ly9tYW43Lm9yZy9saW51eC9tYW4tcGFnZXMvbWFuMy9s
aWJjYXAuMy5odG1sDQo+IA0KDQpJIGRvbid0IHRoaW5rIHRoaXMgaXMgbXVjaCBwb3J0YWJsZSwg
SSBkb24ndCB0aGluayBCU0QgaGFzIHRoaXMgc3lzZnMgd2l0aCBQSUQgY2FwYWJpbGl0aWVzIG9m
IHByb2Nlc3MuDQpBbHNvIGlmIGxhdGVyIFhlIEtNRCBhZGRzIG9yIHJlbW92ZXMgcHJvY2VzcyBj
YXBhYmlsaXRpZXMgdGhhdCBoYXMgYWNjZXNzIHRvIE9BIGl0IHdpbGwgYnJlYWsgVU1Ecy4NCg0K
aHR0cHM6Ly93aWtpLmZyZWVic2Qub3JnL0dyYXBoaWNzL0ludGVsLUdQVS1NYXRyaXgNCg0KSSB0
aGluayB3b3VsZCBiZSBiZXR0ZXIgdG8gdXNlIHVBUElzIHRvIGZpZ3VyZSBvdXQgcGVybWlzc2lv
bnMuDQoNCj4gQW5kIHRoZXJlZm9yZSwgYWxvbmcgd2l0aCBwZXJmX3N0cmVhbV9wYXJhbm9pZCwg
ZGV0ZXJtaW5lIHdoaWNoIE9BIGNhbGxzIGl0DQo+IGNhbiB1c2UuDQo+IA0KPiA+IA0KPiA+ID4g
DQo+ID4gPiA+ID4gU28gYmFzaWNhbGx5IEkgdGhpbmsgeW91IGp1c3QgbmVlZCB0byBjaGVjayBm
b3IgdGhlIHBlcmZfc3RyZWFtX3BhcmFub2lkDQo+ID4gPiA+ID4gZmlsZSBhYm92ZS4gSXQgd2ls
bCB0ZWxsIHlvdSBib3RoIChhKSBpZiBPQSBpcyBwcmVzZW50IChiZWNhdXNlIHdlIGFyZQ0KPiA+
ID4gPiA+IGdvaW5nIHRvIG1lcmdlIHRoZSBjb2RlIHdoaWNoIGNyZWF0ZXMgdGhpcyBmaWxlIHRv
Z2V0aGVyIHdpdGggT0EpIGFuZCAoYikNCj4gPiA+ID4gPiBpZiB5b3UgbmVlZCB0byBiZSByb290
IGZvciBwYXJ0aWN1bGFyIG9wZXJhdGlvbnMuDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gVGhhbmtz
Lg0KPiA+ID4gPiA+IC0tDQo+ID4gPiA+ID4gQXNodXRvc2gNCj4gPiA+ID4gDQo+ID4gDQoNCg==
