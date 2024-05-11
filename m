Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFAA5C04FFE
	for <intel-xe@archiver.kernel.org>; Sat, 11 May 2024 18:08:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 539E810E0D7;
	Sat, 11 May 2024 18:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MmIkFsuY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA4910E0D7
 for <intel-xe@lists.freedesktop.org>; Sat, 11 May 2024 18:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715450879; x=1746986879;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=7AvexgVp0hmNqIrMw9SVosI7F4yMAocKzegEWYW6v94=;
 b=MmIkFsuYQOMnVNSztk7FzSOP08lkocwyDHMxRzPj/c5Paw0O4+Ct7v1I
 GMxrM2FpIbR/oga8OD77pvtfzaC4rUKE2Nj+fqcbAMUAksZNcETCStVIM
 noFPemxMYqF1yBMaf3/VPStNfPkZ0j4ptR/nXY7F9mNIPh5Ol4iauMJs5
 ATMtficrvNAWGLClQ2rQt9mbPsQR/SS8asFFlyuF0hVLmH5ZcKZcY+SQC
 T7fzPCYpeVsCwBhai0pUT2dPlRUN4YtgeOChF0csDSNR754QFNiKWNWK7
 tLs/yAucIdRRGEAWi3rZVbQ8SLgPuqGPP6J2V87tnIhC6r5HBcFCwGmMs A==;
X-CSE-ConnectionGUID: Q/feLuWlSI+svcAymZvAUg==
X-CSE-MsgGUID: qaIscIFvQbKvZffyFiZe1g==
X-IronPort-AV: E=McAfee;i="6600,9927,11070"; a="36811135"
X-IronPort-AV: E=Sophos;i="6.08,154,1712646000"; d="scan'208";a="36811135"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2024 11:07:58 -0700
X-CSE-ConnectionGUID: zNeyPUwhTLqfSiqEs5efXg==
X-CSE-MsgGUID: xLJRHJnnRUWxj3x9V9bu/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,154,1712646000"; d="scan'208";a="60773584"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 May 2024 11:07:59 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 11 May 2024 11:07:58 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 11 May 2024 11:07:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sat, 11 May 2024 11:07:57 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sat, 11 May 2024 11:07:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i0lfkJK7dYaZPIkh1wJGddxUY1X8hvYbObxZdPhRLRLYoxBx8X4aYL2jMFLALtu3+qxIzYUz+HDiWmq5/sbaSDtI6s2lHXZTYffFBpcTNvETKUyTP2UXUqJjUb0KLM0pr1fS6uOD76OEEaTz/a3Tvoyg9iLcDHL5S+dRenj8tc+sQdSCzGM8XdJpnsb4sRqxXjV4vF96V+uJ/R63AruPgU85x0ijn4SjYyl2s8lyuZ+t2c3PTlrR++l4+lEfM+yq0z4UZ609WCoc1A1d4PFf84qpjN0AXLD39W8YJM4NFY01zmS8jzMfu5q18BDKLikC9DgnfNFdJND3kEG8nc1FrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7AvexgVp0hmNqIrMw9SVosI7F4yMAocKzegEWYW6v94=;
 b=WPe/FH0/5ZN4VdzK/wbNfQB2Sg83IPd2DKzC8RsojvMiYOScfW+GVTbAuj0qMXF2flgJ4hFjiTw4tngkmxnLEKfZljvjUre5tCvwLE/0Noj30agRPKStCYhaOtmCKvt0AKNMHfQNYfN3K4oKSCW6eXOROpwwVVXoyYiPiuw2NCxF9pSqiBjG/TkjGTI+4fSpxtsg710RoObX/xXYkAI75RTwDIeZVVXhKYvXRVsnuGsplxhZcP0OSpXHy5XQjc74szJI/QzO6xZHsUubashJ7l4YKrEQr1WYW1uKxOfVrbwsyKA1whYAp/SetziyzBpygHMw+SvJydlQLUkAJihuvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CY8PR11MB7315.namprd11.prod.outlook.com (2603:10b6:930:9e::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.51; Sat, 11 May 2024 18:07:55 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::abaf:6ba7:2d70:7840]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::abaf:6ba7:2d70:7840%2]) with mapi id 15.20.7544.052; Sat, 11 May 2024
 18:07:55 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v8 5/6] drm/xe/guc: Pre-allocate output nodes for
 extraction
Thread-Topic: [PATCH v8 5/6] drm/xe/guc: Pre-allocate output nodes for
 extraction
Thread-Index: AQHaoCCtti/G5Zqa/0+jmyk0/EF4zLGSXAeA
Date: Sat, 11 May 2024 18:07:55 +0000
Message-ID: <db97c44821d6bdffc935514d088eb6ec2bdd6b89.camel@intel.com>
References: <20240507014736.1057093-1-zhanjun.dong@intel.com>
 <20240507014736.1057093-6-zhanjun.dong@intel.com>
In-Reply-To: <20240507014736.1057093-6-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CY8PR11MB7315:EE_
x-ms-office365-filtering-correlation-id: eaa3f5dc-0663-4971-eb92-08dc71e54838
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?M252U2llYnE1Q0tpcTNjdERaRStpM09WMkM0ZnYyVTVmVU5MTGZPb2ZpNHRv?=
 =?utf-8?B?UEJOMmYwM3RaUjhZWk81OWRhdS8vc1Z5TStLMEdNaTJDeS9yMTF4Rk1MSGdI?=
 =?utf-8?B?c1BCRWoyVktCbDhvOFV6L1czMnM4UFkwT3Q2cWh6QlRIdmNrc094aHhqcEZQ?=
 =?utf-8?B?NllQN0o3MDFRYndaRmRhVjhIZjBrdi9oU203VFgwcG9XVUN3TEZlVEEwbDVN?=
 =?utf-8?B?VmoyOHVRdThXaVRHM0t6dy85dnB6M3ltVEtvVnJQUXhHRUNES0Y0SkhwdTJZ?=
 =?utf-8?B?dnhST3hPeUpyYXp3SExzL2tqS3lhTU5vMmw2OUpWazFCS3VlMGJLeFE3Y3Zs?=
 =?utf-8?B?Nkw0RlhETm44VWpRWU5IVk4vNkoyMDRLK29YR2kvS0Z4OS96bHQ4WWdMYWpm?=
 =?utf-8?B?NWYreCtyOGFaMEp1dGhwaTlrY2Y2UU5YMnNOMHhBQzk3UFdVZzhSTEpoSmgr?=
 =?utf-8?B?anFjQUYvM0JIT01EMGk2M044Tk1VUnNRTzFsTzd6Y3ovTGtnTFZXQXZ2OXZr?=
 =?utf-8?B?ZlVYNW1nL2U0Smw1RStLMmduWFpPa3RlVW42cWt1ekllVEhBSVNkY1FpcW0v?=
 =?utf-8?B?aE9OeHE1MjYwQVE4amxreERMK2VMRXFPMEFjbkVFTnN1cVNSaCtlTEFSQ2NP?=
 =?utf-8?B?aHNITUhKVjVxVm5HSmpBQWhocllHKzlhRDgwTzMvYllBTi9sWlpPeWc0QWc3?=
 =?utf-8?B?d215UUZSQmpZcEx2SWt3MjJxdnFPaGZZTXM2WGVRb3dRaEVBREp2TlFJamJ2?=
 =?utf-8?B?Ymttb1k5OVc1K001SElGdXhrbjI4VUlpUk1DTWFQZG96UHc5SlVnYk5RZm50?=
 =?utf-8?B?TzV6Z1UvRDU2SVZkb250aGFkajlFK3lMYit2Mi9wY1VrNWwxOHRNb2syVnN1?=
 =?utf-8?B?dlJGZmlzZWFGTHFrZGdUMFNDa20xSStJcjRraVFSc1dwTkk4MG9Kak9xQWNk?=
 =?utf-8?B?SWpZY2JTSUJ3YkJRNUkvbW5NTmFWMElMb2NSQWhaQURtRjVuM1JzK3VTK21n?=
 =?utf-8?B?N1dBd010alVKUFp3Y1k3M2ZkZit1K2V6dVFsYlgxa1lndHE2L1Q3eVVPWnJm?=
 =?utf-8?B?YUtWM25vNnBTNElpQmYrakprK3VlSDA5TkhSY1dvUVhRUW1KNitYeHpvcjht?=
 =?utf-8?B?d1kvUGRKeFZ2RXlTdWRYSk5HdGVib1VrYmJZbTc0NkF0eWxFbUk0ZHMyMW04?=
 =?utf-8?B?dFhpZDFFbGJSbE1yOWkrNHMvQkY1S3RKNUtuMHBpUkN2ZHRWQnhUeGFKVzRv?=
 =?utf-8?B?ZkJZSDQwMGg0Y1ZRRzVzZ3J5SmNURm11c0pEVTFySHFjOGFueVg3emZITThP?=
 =?utf-8?B?UDZXWjA5R2pGSXVVWm5PdHVFMk9FbTBQYTI0Z0JsRExSbC9SNG5GdVVtcTQy?=
 =?utf-8?B?c1VIVXgyNE9kUUcyZWFyMkM2OWpsTFJVamNnbUd1ZVBmZDJlZHN2ZXFGN2Fz?=
 =?utf-8?B?ZnM0dVh6Vm1rQUIycW1Va1hveDVTNnlVclZLRngxRDR0QUx2STQzeHpqR1FH?=
 =?utf-8?B?bGZONlVvNGJMTTBRWHI0QzRrblRRZEliYkc1RVEyUDBodEZOK0NUV1RNMlo4?=
 =?utf-8?B?cWl0QjNXZjVyVlh0Y3J1enVEN0FHL1RESFUyRmNLcU1TZzRjYmRwc0U2RE51?=
 =?utf-8?B?bGN1ZjBCVWhKL1NjMTlBVGFXL0dRbkc5OXB2WXp3d2tqeGdPVXBReUtSN3JY?=
 =?utf-8?B?RDk1WndYQzFQNHAydVNHUzlkaVVBV1dZK2ZuVTNkbFRVMHlObitNeTdkVUVM?=
 =?utf-8?B?aDd3TXl2TEJqeHZ1YWxrVTIwNXNicktoWHJxMW9FRGozdlN1MUkvek5LcHNw?=
 =?utf-8?B?OG81SXM4L1RoRFlVdFVKZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZnFYQnJjK2NydHY0WUdGT3FsbExuYzF4c1BobHYxcHlUUU9xckNVdlNrOU5E?=
 =?utf-8?B?SjBWMDNETmJNNUNtWmt4M3pnSWZEQVNZUGZJdkZDYU5lbzJaZ2RKWEt0MlBT?=
 =?utf-8?B?SVA0ZkkyS0pReUlJeWloZjlSOUlURVBvNXVlOEMrbm8yNGlRZWhwUkpaVWNn?=
 =?utf-8?B?Qy8yQnVzZUQ1cFBNdlJWVnJNeEt5MUowRHVDdGI3YTdXNWNMMDlUUWdRU2VT?=
 =?utf-8?B?OFJBQisxZ1AxRy9aamw3WHMwVmwrZ3FZUS9MQVRweTdyTFRWR2ErUkJ2UEJh?=
 =?utf-8?B?Yi90ekNQVkI1ZEE4dys1RExTZDdteitCVy9ETHpSRFpBUG42S0ZwVmg5cjE3?=
 =?utf-8?B?WEgveWprcU9IdG5HWG5MWUw4S0paUUJMTW9FVnp5TlMxRDV5Y200clhWM2J6?=
 =?utf-8?B?SFI2WUdMeU0zbXpLd0V4WWVmYUtsQnJ3QzFFQWhDdkFOUkxEU3IrSFFIYTFl?=
 =?utf-8?B?cm5oeHlWc0VQM20wVElFWER6d0NkcUhhejg2MHBvMlJ1L2YvZUNsMTNiQ0tt?=
 =?utf-8?B?MTZWbGZKbTdydysyVGNTdStnNm54UkVacGQ3Zy8xR2o1UGw4dGxvaStValBx?=
 =?utf-8?B?R2h6cWV5NExNK0FSY1BQWEg3MnVNaHdFNzUzUnE3ZVd5MDZzemc5dEVRR01h?=
 =?utf-8?B?KzVjS2tneE1XWGRXRCtuQW5TUkowK1BuZHJkb2J4L01mb0VYMER0MTM2ekh5?=
 =?utf-8?B?Rmw3eHhQeHFOdHN2SmErQVJvMFc4RDViMlIrUHYwYmwwYXBjclorOEg4SFRs?=
 =?utf-8?B?WDZFNm5UelR0alhhTVlveVRidVFIaHRLNmFhQjJ0MkV2dlgxNmtvNkZCOFls?=
 =?utf-8?B?a01aNm9tVnRLRTY2UFEvQVhHMFpLMGxhMmZkMnk5a0RUWnhuTmdqYXBRU2Fi?=
 =?utf-8?B?RlFjTk1Dem1SK01ZbHdESjMzNmRPRCtHclVPbnRpSzNReXJDeWFZcXJGWUhw?=
 =?utf-8?B?N0FxaHlJT0ZiaEtOUGp1aGxsZWpjVDRLMHd6RjRlSWNXbCs3UHl6b1RDa1FW?=
 =?utf-8?B?Q3ZwK0VmU01wYjhJNWM3UDRCc1FnZ1NhOE0vK3VrMmQ0T1VyV1czSkNWU3dU?=
 =?utf-8?B?bmtYWGxzYzhLNG9tcGlQdGsyMk5TYXlBOTdrT0lxOG0zRzRHQURTcjB3RGZl?=
 =?utf-8?B?blpZK3dGY2JDeFZVellJSmJEcmdoRGYweC9HZ0NxYTJ2ZkY1c21NYTU4UWZ4?=
 =?utf-8?B?RzZmc2EwOTFWN0xGYnk3ellvOWR0eTVVczVLTlR6ODE1V0hjMUZ5QUdXT2VL?=
 =?utf-8?B?amVtUU9EYUllNngrcTJQZ3dZUmIvSlUwNHRGV0FQM2c4ZjVrNGFFZUZkSDY4?=
 =?utf-8?B?aTJWTnZhemluV0gxRTBTZzRPdGJxZ0dRWlpoVW91WWlJYklHZ2h6QVphNEE2?=
 =?utf-8?B?UW9VVkd2UWxEcUZBQmZMZ1k1Y0Znc2hwek5GaFNxblJUZFkyR2tONk9aU1Rn?=
 =?utf-8?B?Rytwdm5jQ0VrR1pIeGluVnUvc1E0Nlh6eXR6US9UakpQQVRUUCswSWxZb1B1?=
 =?utf-8?B?SlBybkpuVXdVMzk3TENDRldqdXAybXRSVXY3QWh2K1J4ZXFOSTNtZ3E2SEVX?=
 =?utf-8?B?NXdRYmJmN2ptZmdJNG5WQTJxVTZlRFRTazFaZ3JiUmhoY0tXckl5UTJLeFUx?=
 =?utf-8?B?NW43aFpZcUxGbUFjNnNUZGxxWEZXV003ZmFoUG5LdE9UZzV0VlNmUlA1R0xQ?=
 =?utf-8?B?eUs3djhuckt6WEJmWTdpZWJSMThHYWZZUzl3N0xDQitYeC9vYjI5d3BDblhM?=
 =?utf-8?B?di91aFh5U283S2k2YWVkUHJDekdpNTdja1hYRzRLYW50UDRiQXJhQ3hwbTFH?=
 =?utf-8?B?SU1CZ0Y5UllIbHg0eEc5R2JtSWc0ekdNSUZ0a0pPQlhJTm0zVkhLRE94QjBy?=
 =?utf-8?B?NDg5VjJ2amtaRVBpSXZZUWRuWTVqL2ltcmowU3MwZkFPaGFsUTgwYWFYT3FM?=
 =?utf-8?B?NUJ0R1FOenI1dDc5YzlvdHRLbGpUU3k4Z2JWbGtyN2JGd3BmMVhhVlpCUUhH?=
 =?utf-8?B?QjlKZnJJWlBNbHpmc0RyUTFTMnUxREc0UVNENHVtZXgxcUhadXlIM3ZxeXQz?=
 =?utf-8?B?cXBvengvZE9rVjRsVTFTcDN1MFhFRXJ5QVFJMjU0cVJ1RERjZW0yWlVDY0Qv?=
 =?utf-8?B?am96cUhTVDNIbU9ZMkNhd1orL0tlTEgya0tHOUI1NmpMalMzcHJEYzJobG9y?=
 =?utf-8?Q?/OX7KX5IUTrKW5kUXeTEoJQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CC3D26EB6606A74182AC5E655A971679@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaa3f5dc-0663-4971-eb92-08dc71e54838
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2024 18:07:55.2558 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O08ElwJWs/V3y9GlWEHfiIoNo3p9yg3g4gpgwlw6Bu4NCpTqPaBTfGHzIdOB8hXb4R41tB236Au9AooDtWgmQpY2kH77ptq1nKodh11+cP6ql4e13NY7XNIPNbVsq4Ir
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7315
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

T24gTW9uLCAyMDI0LTA1LTA2IGF0IDE4OjQ3IC0wNzAwLCBaaGFuanVuIERvbmcgd3JvdGU6DQo+
IHJlLWFsbG9jYXRlIGEgZml4ZWQgbnVtYmVyIG9mIGVtcHR5IG5vZGVzIHVwIGZyb250IChhdCB0
aGUNCmFsYW46ICJwcmUtYWxsb2NhdGUiDQo+IHRpbWUgb2YgQURTIHJlZ2lzdHJhdGlvbikgdGhh
dCB3ZSBjYW4gY29uc3VtZSBmcm9tIG9yIHJldHVybiB0bw0KPiBhbiBpbnRlcm5hbCBjYWNoZWQg
bGlzdCBvZiBub2Rlcy4NCj4gQWRkIGd1YyBjYXB0dXJlIGRhdGEgc3RydWN0dXJlIGRlZmluaXRp
b24uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBaaGFuanVuIERvbmcgPHpoYW5qdW4uZG9uZ0BpbnRl
bC5jb20+DQphbGFuOiBob25lc3RseSwgdGhlIGNvbW1pdCBtZXNzYWdlIGlzIGp1c3Qgd2F5IHRv
byBzaG9ydCBhbmQgZG9lc250DQpldmVuIGV4cGxhaW4gd2h5IHdlIG5lZWQgdGhpcyBwYXRjaC4g
T24gdGhhdCBub3RlLCB3ZSBzaG91bGQNCnZlcmlmeSB3aXRoIHRoZSBsZWFkcyBvZiB4ZS1rbWQg
Y29yZS1tbSBpZiB3ZSBzdGlsbCBoYXZlIHRoZSBzYW1lDQpjb25zdHJhaW50cyBmb3IgeGUgdGhh
dCB3ZSBkaWQgaW4gaTkxNSB0aGF0IHJlcXVpcmVkIHRoaXMNCnByZS1hbGxvY2F0ZWQgY2FjaGVs
aXN0IG9mIG5vZGVzLg0KDQphbGFuOiBpZiB3ZSBzdGlsbCBuZWVkIHRoZSBwcmUtYWxsb2NhdGVk
IGNhY2FoZWxpc3Qgb2Ygbm9kZXMsIHRoZW4NCmFsbCBvZiB0aGUgY29kZSBpbiB0aGlzIHBhdGNo
IGxvb2tzIGdvb2QuIEhvd2V2ZXIsIGFzIGkgbWVudGlvbmVkDQppbiBQYXRjaDQsIHdlIHNob3Vs
ZCBiZSBkb2luZyBkeW5hbWljIGFsbG9jYXRpb24gb2Ygbm9kZXMgaW4gUDQNCmFuZCBvbmx5IHN0
YXJ0IGludHJvZHVjaW5nIGd1Yy1jYXB0dXJlJ3MgY2FjaGVsaXN0IGFuZCB1c2FnZSB0b2dldGhl
cg0Kd2l0aCB0aGUgcmVzdCBvZiB0aGlzIHBhdGNoIHdoaWNoIGNvbnRhaW5zIHRoZSBhbGxvY2F0
aW9uIC8gZnJlZWluZy4NCg0K
