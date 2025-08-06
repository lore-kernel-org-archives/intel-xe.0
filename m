Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07BEC87FD3
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 23:08:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D56910E062;
	Wed,  6 Aug 2025 23:08:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VUAUh/LX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D975D10E062
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 23:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754521705; x=1786057705;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=wZzxe8dEmp2hSsnZkO6C3Qf/Awf1bQmY2FvxGs/wqsg=;
 b=VUAUh/LXpeFkffBCeDefAwuQN7IqSUCDlmedvwMJwQr3s4IX/StIWorv
 Y9Xd27NSB8wXRlzQD723md6CEkA7xnd/APgeKJzjh654iLPUKXfBB/QvD
 XKdW96wCYZ/wBrmsBEuj4vKHgnDEntjoVebdsdijkxW/FfaPo4KZRyZUW
 AbeqB1EJz9j0oKCuLDeLbUL6eU7rjgldH3NmLGtpz1+wZK45EjvVVyInG
 ho9wSDJmQoOlkvPFJEJJd0Izw/F702igFsz2GTbW/PFBMHecDh5osqp2+
 dXRvpJz3tn5nVVyQxlNK3LvGkIxnND+QM62iY/1xXxRxq4WaqwYa/S8ik w==;
X-CSE-ConnectionGUID: 6tMgzwhqTUCmi70AnC+XDA==
X-CSE-MsgGUID: dcODdRNaThSSu+S+ih+ocQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56716464"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="56716464"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 16:08:24 -0700
X-CSE-ConnectionGUID: TZczgIAMSmyjNRLF6Xhggg==
X-CSE-MsgGUID: s5HRr37ZQOiZIay24htvlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="164139776"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 16:08:24 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 16:08:24 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 6 Aug 2025 16:08:24 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.61)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 16:08:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dpddx9s65tlcMsBVYXJLlq6PegkmJmI4exjGU4sc6OLR6LGMcNfskOH1qHMA516W2sLw6RKJIrlwV/QAys9tbK3rhMfmaInMG1CST0PASnXcUp5v+wZOSugM/8fnrUCTo1MOfzGXL/ufNCqWlqWsh2bVH4gGcULybCyK+TC2H2AEI8HBWiu1sxpoubaKhJHEvC7SAU/lRjtZRjjS4Qg8OfEGjiUvbXQrxxhvHCoC2VFbBqb0dBZw7zjggLWqqj0Tb9jSGI0eRo3e7D31fBgAfC0Dl52v60kmfL2+T3o/8ej/eAMiBfZylw2hRkZfyGfvrxV7SxPcFc2re+5u9X6i+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZzxe8dEmp2hSsnZkO6C3Qf/Awf1bQmY2FvxGs/wqsg=;
 b=uyjc/FSngNDYQQSNm6aSEXs82RoOJsQyCAKsY1WrNqkdoADHl3pxK0jf98wTceXPcjGaGzsGQy0f5uoDUp3/5mqrgfuMMEAifSU1/ma30T67vxDeyME2G63EylcW+mW+potwzlnAPYNyFFG91wLrGBJ+9poVhWzJLt+zesFXObOfbtRv4FErFsyMmRbi+edOv11/hq7bJr00TOvfB5voWo83Vbl5tONrWVNR13D2xgmQt5EoDdgon1q0yKYZlR10iUWgiLSnO1Dsp3BUFKC7codL3jyARbl7rlV0hdzcdX4rJ0RP2s5qL/M3iIE7EHCNipBvLAsYULicidd8ozyKMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SN7PR11MB7509.namprd11.prod.outlook.com (2603:10b6:806:346::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.15; Wed, 6 Aug 2025 23:08:18 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 23:08:18 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
CC: "Mrozek, Michal" <michal.mrozek@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Subject: Re: [PATCH 02/11] drm/xe: Implement xe_pagefault_init
Thread-Topic: [PATCH 02/11] drm/xe: Implement xe_pagefault_init
Thread-Index: AQHcBpqUULnsSN/1VEeqxSPKxk3pY7RWQMSA
Date: Wed, 6 Aug 2025 23:08:18 +0000
Message-ID: <489d415972b3d9118e8d59911413802130827162.camel@intel.com>
References: <20250806062242.1090416-1-matthew.brost@intel.com>
 <20250806062242.1090416-3-matthew.brost@intel.com>
In-Reply-To: <20250806062242.1090416-3-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SN7PR11MB7509:EE_
x-ms-office365-filtering-correlation-id: cb86a1db-8b91-4727-b341-08ddd53e215f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MVlPaldNYUVFYXVpQUhJYlI3QU13ajgvb2hCSWdoN1FOcTFPcTFhYm5KUFpw?=
 =?utf-8?B?RU1tV3VuQUJNakg4dVhJeThvbWlMbmh0czBZWlNCWm9XTGxmV3ArYUFjVTUx?=
 =?utf-8?B?aXhyb2I4NnE1Y2Y0TzliU1VxbGNoMkNMTDFHa1ZyOC96eTFpUjhQbWJkV2RX?=
 =?utf-8?B?bEN2bjRvSCswWlc3aHNoaVQzQjVxaTlyTFdoblhvenB2T0lYRXBQdGE5c3Fy?=
 =?utf-8?B?bHZjU3g5MHljNnlwQTBPNW9wWnNBaGFLbzkwMlBuM1N4eGxuODljY3ZjOE9i?=
 =?utf-8?B?dkh1NDUxbmpDTENJRnorOGJMelZCN0hzV01GUE1Td3JNVXQ0OEN5enV0a3Qz?=
 =?utf-8?B?Vi9TZ0RaQ2lYY3lRTWFKaW81SEVXSTdVMDdLY0Z5NHVFTU1Oei85N1BnZkRl?=
 =?utf-8?B?UDNWVlRRL0gwOHVrd3k2anBVcUpyQWNqc2JmTnkwUE1ESno2UFJ6OUJJbVQ3?=
 =?utf-8?B?akJGM3pVYTFqa0RPdG5NVzM5eFNEb3dyN1FmSlovRDRwQUVSdElxcWtZVU9o?=
 =?utf-8?B?OWFVWHNNNGY2ZWVJTnd6L2picmdJcTRrSjRmZklKd005Sm9CZU5JY0RLV1Ur?=
 =?utf-8?B?amtWU1JPRDE1SFRKZXhlMEpJem5IVS9xeFNaa0NYNE5hTlAyQXA0RnNDaVZx?=
 =?utf-8?B?cThjS3RLYlg4bmFoYWNZYUkvUE9SQi9TYTZYZGZBV0o2bjgycHBIcXgvdmU3?=
 =?utf-8?B?bmxrQnlHTFcwazdRelV3UVRaeEpBcGxTNWlLQ21LdHE5TG1GTWx6cFZQTTBa?=
 =?utf-8?B?cFBWWDVuUFFqZFFCYXZ1QlFZWkJRblZINHZ5S09JSGlYWkF1RFFqU1d6a2lj?=
 =?utf-8?B?WEQ3b2Nldy8wY0MrNnFKQ25DQmN4bkJRbXo3KzJnVEF2OTZuaVFrTTE5RnpK?=
 =?utf-8?B?TVhGSmV1Q3MvSjZpWG5rWENkZGNtMzQ4Tm44MUlHRGtpVXg3ZlhoeTNZeEtR?=
 =?utf-8?B?WEVML29nc3FGN01CZzVBQVJxektaOWRQWkJUZlN5L3M4SmI1dlNSSW95YU9E?=
 =?utf-8?B?YVN2cGVURTA1K1EwSG90UHpHODlsS1QzRGFZUGppM05LNjhHUkdhR1BqaTBP?=
 =?utf-8?B?b0YwYjdLK04rK1VtcncvOFhMMWNSbW1YQzhNT3VJZlV1QjFUQ29pSlUyWGt1?=
 =?utf-8?B?WEdldjViSjVNT2VDRC9ib09lcW1Xa200a21BcWMwWEI4L1ZpUG9SRUt1emlR?=
 =?utf-8?B?N0t3QXJoSmV5R3NBZ0dRdEVicUVFSWU0RUJyc2dGUEpHWGxiRXprbWpOSThx?=
 =?utf-8?B?YkFNQzE5bHhBR0Q3VkhKTzE0Z2UvcndKeW0vWnQ3TTJDNmdXKzNkWDgxOVB3?=
 =?utf-8?B?R01tZncvVHhqM1VLK3Nta0FVSnZQZEZuWDMycENaeENYSS9xSmhQM1dDL1N4?=
 =?utf-8?B?RWFndzc0Wkx6Y2h0MlJaL05sLytoaVZpUzlmeHJNSDhTL0VPbVhaaml6bkk4?=
 =?utf-8?B?eStLVEVlWEcwamw4djQzYWJuWFphdzlXbFFGODVSa0NxTnhkQi9mVHZUZmpu?=
 =?utf-8?B?aFpJVDJVMndscEwvL2xjWTBBUUJkcDhjMnd1N21VS0RYVVp4ZlQ0RWVSM0s2?=
 =?utf-8?B?a2xUTWM1SkxiQ3EwbWJuSWVqbEtJdUpJQnRoNE5tTDRGUWphMXE4b2tIdnNE?=
 =?utf-8?B?MWpIWXlJYW83ZzQ2OTliU3U4OU4rT2xjNEFUZTI1U0RZRlhGZ1pMbnlOUm1o?=
 =?utf-8?B?REZYeU5QY1k1TkRBb3VaOFRFL0VKZHVrT0FJVWpLL3kyb1ZNNkxpWW55a1d6?=
 =?utf-8?B?MXZhMXJuM0w0blFWV3A4QWlOWHJhRE9Id01WdmNDNHZBcFVXNXJHTG9SM28w?=
 =?utf-8?B?MzNaOU5WUjNKZVZwekYvbkI3RXlYV0Izc3RNamNLbmNPM2o5dGJ2SFI0cytn?=
 =?utf-8?B?U0xJYmlEZDFTU3pxMjRvRjNPNkdWL29SVzNJUkVTTU81TzJqaE1yWmJFc3oz?=
 =?utf-8?Q?9UD40JksQT0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YlltRStxUVpWWEpTdk44QjYvaHBSbzl5TEJVVG9Jc0FCdlJlV2hjaGxKL3RR?=
 =?utf-8?B?SXFBZzRkTTV2WG80SkIvZTkycXBxVEpVRXE2bDFIQzVsSEpCenFyaE1rR1Az?=
 =?utf-8?B?MVNxajUycnhGU2NWYkI1VWUvd2dGZzY0ZU1xQjU1dXh3cVpIdlJoOGpvZ3Fj?=
 =?utf-8?B?RFdXU2JSdTV0aG9qM3E3K0NITWxmUjlydStQRldHK3paYnlKUjRWbDg1dVF2?=
 =?utf-8?B?T0lHZHY3Rk9xdFJKVUs0eVhUVHE5YVo1aG9FQ3VzNmt6b1NWT3lYdWtzN2F4?=
 =?utf-8?B?YXJ0UFhnMG9BTFpIeWJQZVY1ZVluYkE0YUF3LzdwZElMd2NpOFVrNmpOY0Jw?=
 =?utf-8?B?WjJ6ZWlySEx0RWUySkdpVnZWSVgzMTFNSUtwTHRieldLQi85ZHpVcDhabnU1?=
 =?utf-8?B?YjJ0eHFhN1FIT2pQZHh1WFJ4VDdVZWRSWVMzM0J4MjZvUkhnVUQxRUxEZllQ?=
 =?utf-8?B?V0hkTm9YcWhIekpEMm1xdXhyRlVwdjBpWCtFWHBBcmRhQjBZZjNWTHFITi95?=
 =?utf-8?B?cG1nTzBZcGh2U09OVE1aZ3p0SVREejNoKzJ0Q1RwOW9Pa0xUWWJ3TlRLYUJt?=
 =?utf-8?B?TmEyR1VjM3VIcnhnOFVnUmVIWHg0a0dKUGZlbHRZZWQ0VENOTkpmYXc2em1p?=
 =?utf-8?B?MDR3cHp3TWh5NjRiY2l5eTVISGlhRXBtNzlZc25ST25IQWxRcG82TGpVT2Fi?=
 =?utf-8?B?N0s2b0IrNU1qdk9JOURiVzM1Sk5aTDY4c3c0K2FQbC9ZSGtkSHNSNnN5VjNB?=
 =?utf-8?B?KzY0OTFpQVcyWURwN2VFcmtKODJYbkRrOHp6Q004WEgrTEZGMGE1TlB4cTE4?=
 =?utf-8?B?U3FhNnhlU0wwVWlhUDBmZzMvdWJTQWt1aVJRSnIvOGwzek1ZdWMzMExUZHJX?=
 =?utf-8?B?UGszQTUzTU4zbGYvb05uLzhaeHdHaEtKSG1NYys1OWZUQzhJc3llSHY3NFNX?=
 =?utf-8?B?ck5QaXNFMkkwU2FtZjZaWTQrRkFNY2F4cFdjeGhod0tQS1pBSVRIdmJVYjRZ?=
 =?utf-8?B?bUdRZnplaUhHOHBSWk9ZWURBSTJBaitJbjgxN0dTU2JCYlU1bUlTMFRxVHNw?=
 =?utf-8?B?d0Y1ZlFIUGRBRW9iTmtHdUYwZTZYd3lmRGErYWpoU21YR0tDQzFGWFBJZmJN?=
 =?utf-8?B?Wjh4T05VZ3psd3J0N3RxZXdFVGRDSWo1K25QcjIxYUorOVVldk55eHpITzRD?=
 =?utf-8?B?Vi8rZDd6SWNZT3lIdnBuTGhmQy9aVEZndjhRSk9jR21ab04yT29CRGd2czla?=
 =?utf-8?B?SDg4VzhrMlI1TlVkVGorQ1pNamVzL0NzakZVOUYxVFlxZUdESUtjQWJUL3Fq?=
 =?utf-8?B?SEg1aWNJdlVTWlR6RVNsUWtLNUl5KzNlYzhaQmpiSlFJZ3V0cng2b1hGaW0y?=
 =?utf-8?B?S3J5MDJpcG1oVVR3MmpDZEl0NnJOcXd6U1kzeTlVemxIY0ZqeDVnTnN2emwy?=
 =?utf-8?B?amJMdjI2M3U1OVlSaVhiaWR4YStyclhlYU9qdDAwLzl2TmJRbng1UmI4cEd3?=
 =?utf-8?B?TUJpM3pjNS9Vb3l5dVJLSU1WY09Rd1Y5dDZNSk9SVm14eEhxVS96dmh0Z2tv?=
 =?utf-8?B?U1k2dmNaUi8vN2QvSndYVk5JR2FWRklCZkdpRHYvbGFlSldaT09FRXFTdnly?=
 =?utf-8?B?K1NDRnZHMyt1cGNNd1Jlc0NLRXlSbFhMMXlDQ1VkMzY1dG9GTS9IYXFla09S?=
 =?utf-8?B?WnBtRE84WXRzUXJCQ0Q3dktYUUU2YnRxeDR6WEt0Uy8xbG5KYmVDUitURFp5?=
 =?utf-8?B?WGVTOFV3QlBDZnVuQk9yWVpqdXNFYllXSGViT3Uxa0k2WUFOdjNYNmhlcmpx?=
 =?utf-8?B?RXlmdzVqazQwNG5IZFQ4OWR5dTlmNTZvdWRhMkxONGhrK1pGUXlMRDN1Y09i?=
 =?utf-8?B?MlljdStBVHB6azlxcGVlUEhHU1VmRHp4TFRWNlo0c3BwUkRDUmZOcE9Xando?=
 =?utf-8?B?bmk0bEl6cDF1Ky8wQ2dxMHFjbDhsYUdNVFl2N3BZSnI5eFJtTzcyNVNVREVi?=
 =?utf-8?B?RVY2RDNhMXZ6TVpvSHd2NnY2ZnhacXBPV2FXMGQvUFJLNjRKVmNseVJsWWt1?=
 =?utf-8?B?WVZDY0VIcG55Q1FPZ0tuUk8rKzFYZ3BTTlFOR0FXMmZxd0xvU1dFVWlQelZy?=
 =?utf-8?B?dndmeXBXV2VmWWFwVnl4cUgwZVQ1a2hyVVhETkVoU2JUY3hVL3Bmc0NuZGV0?=
 =?utf-8?B?R3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1C0D731B6AE51E48A67EDBB241B41FF6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb86a1db-8b91-4727-b341-08ddd53e215f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2025 23:08:18.0868 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wEmu9HXkTm47qdtI6a74krugw+OGJ5hss8odcXy1vzBHAnmfDQaeWhbjL+SSQHquFuRfnc5KdDP6TmX92a7GU+2GpiEXQC8B9CLKOUxLdsY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7509
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

T24gVHVlLCAyMDI1LTA4LTA1IGF0IDIzOjIyIC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IENyZWF0ZSBwYWdlZmF1bHQgcXVldWVzIGFuZCBpbml0aWFsaXplIHRoZW0uCj4gCj4gU2lnbmVk
LW9mZi1ieTogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+Cj4gLS0tCj4g
wqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmPCoMKgwqDCoMKgwqAgfMKgIDUgKysKPiDC
oGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaCB8wqAgNiArKwo+IMKgZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3BhZ2VmYXVsdC5jwqDCoMKgIHwgOTMKPiArKysrKysrKysrKysrKysr
KysrKysrKysrKystCj4gwqAzIGZpbGVzIGNoYW5nZWQsIDEwMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNl
LmMKPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYwo+IGluZGV4IDU3ZWRiYzYzZGE2
Zi4uYzdjOGFlZTAzODQxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZp
Y2UuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYwo+IEBAIC01MCw2ICs1
MCw3IEBACj4gwqAjaW5jbHVkZSAieGVfbnZtLmgiCj4gwqAjaW5jbHVkZSAieGVfb2EuaCIKPiDC
oCNpbmNsdWRlICJ4ZV9vYnNlcnZhdGlvbi5oIgo+ICsjaW5jbHVkZSAieGVfcGFnZWZhdWx0Lmgi
Cj4gwqAjaW5jbHVkZSAieGVfcGF0LmgiCj4gwqAjaW5jbHVkZSAieGVfcGNvZGUuaCIKPiDCoCNp
bmNsdWRlICJ4ZV9wbS5oIgo+IEBAIC04OTAsNiArODkxLDEwIEBAIGludCB4ZV9kZXZpY2VfcHJv
YmUoc3RydWN0IHhlX2RldmljZSAqeGUpCj4gwqDCoMKgwqDCoMKgwqDCoGlmIChlcnIpCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gZXJyOwo+IMKgCj4gK8KgwqDCoMKg
wqDCoMKgZXJyID0geGVfcGFnZWZhdWx0X2luaXQoeGUpOwo+ICvCoMKgwqDCoMKgwqDCoGlmIChl
cnIpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBlcnI7Cj4gKwo+IMKg
wqDCoMKgwqDCoMKgwqB4ZV9udm1faW5pdCh4ZSk7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgZXJy
ID0geGVfaGVjaV9nc2NfaW5pdCh4ZSk7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9kZXZpY2VfdHlwZXMuaAo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBl
cy5oCj4gaW5kZXggMDFlOGZhMGQyZjlmLi42YWExMTkwMjZjZTkgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2RldmljZV90eXBlcy5oCj4gQEAgLTE3LDYgKzE3LDcgQEAKPiDCoCNpbmNsdWRlICJ4
ZV9sbXR0X3R5cGVzLmgiCj4gwqAjaW5jbHVkZSAieGVfbWVtaXJxX3R5cGVzLmgiCj4gwqAjaW5j
bHVkZSAieGVfb2FfdHlwZXMuaCIKPiArI2luY2x1ZGUgInhlX3BhZ2VmYXVsdF90eXBlcy5oIgo+
IMKgI2luY2x1ZGUgInhlX3BsYXRmb3JtX3R5cGVzLmgiCj4gwqAjaW5jbHVkZSAieGVfcG11X3R5
cGVzLmgiCj4gwqAjaW5jbHVkZSAieGVfcHRfdHlwZXMuaCIKPiBAQCAtMzk0LDYgKzM5NSwxMSBA
QCBzdHJ1Y3QgeGVfZGV2aWNlIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHUz
MiBuZXh0X2FzaWQ7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiogQHVzbS5s
b2NrOiBwcm90ZWN0cyBVTSBzdGF0ZSAqLwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgc3RydWN0IHJ3X3NlbWFwaG9yZSBsb2NrOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAvKiogQHVzbS5wZl93cTogcGFnZSBmYXVsdCB3b3JrIHF1ZXVlLCB1bmJvdW5kLCBoaWdo
Cj4gcHJpb3JpdHkgKi8KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHdv
cmtxdWV1ZV9zdHJ1Y3QgKnBmX3dxOwo+ICsjZGVmaW5lIFhFX1BBR0VGQVVMVF9RVUVVRV9DT1VO
VMKgwqDCoMKgwqDCoMKgNAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiogQHBm
X3F1ZXVlOiBQYWdlIGZhdWx0IHF1ZXVlcyAqLwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBzdHJ1Y3QgeGVfcGFnZWZhdWx0X3F1ZXVlCj4gcGZfcXVldWVbWEVfUEFHRUZBVUxUX1FV
RVVFX0NPVU5UXTsKPiDCoMKgwqDCoMKgwqDCoMKgfSB1c207Cj4gwqAKPiDCoMKgwqDCoMKgwqDC
oMKgLyoqIEBwaW5uZWQ6IHBpbm5lZCBCTyBzdGF0ZSAqLwo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfcGFnZWZhdWx0LmMKPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wYWdl
ZmF1bHQuYwo+IGluZGV4IDNjZTBlOGQ3NGI5ZC4uMTQzMDRjNDFlYjIzIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wYWdlZmF1bHQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9wYWdlZmF1bHQuYwo+IEBAIC0zLDYgKzMsMTAgQEAKPiDCoCAqIENvcHlyaWdodCDC
qSAyMDI1IEludGVsIENvcnBvcmF0aW9uCj4gwqAgKi8KPiDCoAo+ICsjaW5jbHVkZSA8ZHJtL2Ry
bV9tYW5hZ2VkLmg+Cj4gKwo+ICsjaW5jbHVkZSAieGVfZGV2aWNlLmgiCj4gKyNpbmNsdWRlICJ4
ZV9ndF90eXBlcy5oIgo+IMKgI2luY2x1ZGUgInhlX3BhZ2VmYXVsdC5oIgo+IMKgI2luY2x1ZGUg
InhlX3BhZ2VmYXVsdF90eXBlcy5oIgo+IMKgCj4gQEAgLTE5LDYgKzIzLDcxIEBACj4gwqAgKiB3
aXRoIGEgc2luZ2xlIHNoYXJlZCBjb25zdW1lci4KPiDCoCAqLwo+IMKgCj4gK3N0YXRpYyBpbnQg
eGVfcGFnZWZhdWx0X2VudHJ5X3NpemUodm9pZCkKPiArewo+ICvCoMKgwqDCoMKgwqDCoHJldHVy
biByb3VuZHVwX3Bvd19vZl90d28oc2l6ZW9mKHN0cnVjdCB4ZV9wYWdlZmF1bHQpKTsKCk5pY2Ug
dGhhbmtzIQoKPiArfQo+ICsKPiArc3RhdGljIHZvaWQgeGVfcGFnZWZhdWx0X3F1ZXVlX3dvcmso
c3RydWN0IHdvcmtfc3RydWN0ICp3KQo+ICt7Cj4gK8KgwqDCoMKgwqDCoMKgLyogVE9ETzogSW1w
bGVtZW50ICovCj4gK30KPiArCj4gK3N0YXRpYyBpbnQgeGVfcGFnZWZhdWx0X3F1ZXVlX2luaXQo
c3RydWN0IHhlX2RldmljZSAqeGUsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgeGVfcGFnZWZhdWx0X3F1
ZXVlCj4gKnBmX3F1ZXVlKQo+ICt7Cj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2d0ICpndDsK
PiArwqDCoMKgwqDCoMKgwqBpbnQgdG90YWxfbnVtX2V1cyA9IDA7Cj4gK8KgwqDCoMKgwqDCoMKg
dTggaWQ7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoGZvcl9lYWNoX2d0KGd0LCB4ZSwgaWQpIHsKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfZHNzX21hc2tfdCBhbGxfZHNzOwo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpbnQgbnVtX2RzcywgbnVtX2V1czsKPiArCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJpdG1hcF9vcihhbGxfZHNzLCBndC0+ZnVz
ZV90b3BvLmdfZHNzX21hc2ssCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBndC0+ZnVzZV90b3BvLmNfZHNzX21hc2ssCj4gWEVfTUFYX0RTU19GVVNF
X0JJVFMpOwo+ICsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbnVtX2RzcyA9IGJp
dG1hcF93ZWlnaHQoYWxsX2RzcywKPiBYRV9NQVhfRFNTX0ZVU0VfQklUUyk7Cj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoG51bV9ldXMgPSBiaXRtYXBfd2VpZ2h0KGd0LQo+ID5mdXNl
X3RvcG8uZXVfbWFza19wZXJfZHNzLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBYRV9NQVhfRVVf
RlVTRV9CSVRTKSAqCj4gbnVtX2RzczsKPiArCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHRvdGFsX251bV9ldXMgKz0gbnVtX2V1czsKCkknbSBiZWhpbmQgb24gdGhhdCBwYXRjaCBJ
IGhhZCBwb3N0ZWQgYSB3aGlsZSBiYWNrIHRvIHVwZGF0ZSB0aGlzCmFsZ29yaXRobSA6KC4gV2Fu
dCB0byBwdWxsIHRoYXQgY2FsY3VsYXRpb24gaW4gaGVyZSBkaXJlY3RseSBzbyB3ZSBjYW4KcmVt
b3ZlIHRoZSBQRl9NVUxUSVBMSUVSIHlvdSBoYXZlIGJlbG93PwoKU2VlIGh0dHBzOi8vcGF0Y2h3
b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC82NTE0MTUvP3Nlcmllcz0xNDg1MjMmcmV2PTEKCkkg
Y2FuIGFsc28gcmV3b3JrIHRoYXQgb24gdG9wIG9mIHRoaXMgaWYgeW91J2QgcHJlZmVyLCBlaXRo
ZXIgd2F5IGlzCmZpbmUgd2l0aCBtZS4KClRoYW5rcywKU3R1YXJ0Cgo+ICvCoMKgwqDCoMKgwqDC
oH0KPiArCj4gK8KgwqDCoMKgwqDCoMKgeGVfYXNzZXJ0KHhlLCB0b3RhbF9udW1fZXVzKTsKPiAr
Cj4gK8KgwqDCoMKgwqDCoMKgLyoKPiArwqDCoMKgwqDCoMKgwqAgKiB1c2VyIGNhbiBpc3N1ZSBz
ZXBhcmF0ZSBwYWdlIGZhdWx0cyBwZXIgRVUgYW5kIHBlciBDUwo+ICvCoMKgwqDCoMKgwqDCoCAq
Cj4gK8KgwqDCoMKgwqDCoMKgICogWFhYOiBNdWx0aXBsaWVyIHJlcXVpcmVkIGFzIGNvbXB1dGUg
VU1EIGFyZSBnZXR0aW5nIFBGCj4gcXVldWUgZXJyb3JzCj4gK8KgwqDCoMKgwqDCoMKgICogd2l0
aG91dCBpdC4gRm9sbG93IG9uIHdoeSB0aGlzIG11bHRpcGxpZXIgaXMgcmVxdWlyZWQuCj4gK8Kg
wqDCoMKgwqDCoMKgICovCj4gKyNkZWZpbmUgUEZfTVVMVElQTElFUsKgwqA4Cj4gK8KgwqDCoMKg
wqDCoMKgcGZfcXVldWUtPnNpemUgPSAodG90YWxfbnVtX2V1cyArIFhFX05VTV9IV19FTkdJTkVT
KSAqCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX3BhZ2VmYXVsdF9lbnRyeV9z
aXplKCkgKiBQRl9NVUxUSVBMSUVSOwo+ICvCoMKgwqDCoMKgwqDCoHBmX3F1ZXVlLT5zaXplID0g
cm91bmR1cF9wb3dfb2ZfdHdvKHBmX3F1ZXVlLT5zaXplKTsKPiArI3VuZGVmIFBGX01VTFRJUExJ
RVIKPiArCj4gK8KgwqDCoMKgwqDCoMKgZHJtX2RiZygmeGUtPmRybSwgInhlX3BhZ2VmYXVsdF9l
bnRyeV9zaXplPSVkLAo+IHRvdGFsX251bV9ldXM9JWQsIHBmX3F1ZXVlLT5zaXplPSV1IiwKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfcGFnZWZhdWx0X2VudHJ5X3NpemUoKSwg
dG90YWxfbnVtX2V1cywgcGZfcXVldWUtCj4gPnNpemUpOwo+ICsKPiArwqDCoMKgwqDCoMKgwqBw
Zl9xdWV1ZS0+ZGF0YSA9IGRldm1fa3phbGxvYyh4ZS0+ZHJtLmRldiwgcGZfcXVldWUtPnNpemUs
Cj4gR0ZQX0tFUk5FTCk7Cj4gK8KgwqDCoMKgwqDCoMKgaWYgKCFwZl9xdWV1ZS0+ZGF0YSkKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC1FTk9NRU07Cj4gKwo+ICvCoMKg
wqDCoMKgwqDCoHNwaW5fbG9ja19pbml0KCZwZl9xdWV1ZS0+bG9jayk7Cj4gK8KgwqDCoMKgwqDC
oMKgSU5JVF9XT1JLKCZwZl9xdWV1ZS0+d29ya2VyLCB4ZV9wYWdlZmF1bHRfcXVldWVfd29yayk7
Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoHJldHVybiAwOwo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCB4
ZV9wYWdlZmF1bHRfZmluaSh2b2lkICphcmcpCj4gK3sKPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qg
eGVfZGV2aWNlICp4ZSA9IGFyZzsKPiArCj4gK8KgwqDCoMKgwqDCoMKgZGVzdHJveV93b3JrcXVl
dWUoeGUtPnVzbS5wZl93cSk7Cj4gK30KPiArCj4gwqAvKioKPiDCoCAqIHhlX3BhZ2VmYXVsdF9p
bml0KCkgLSBQYWdlIGZhdWx0IGluaXQKPiDCoCAqIEB4ZTogeGUgZGV2aWNlIGluc3RhbmNlCj4g
QEAgLTI5LDggKzk4LDI4IEBACj4gwqAgKi8KPiDCoGludCB4ZV9wYWdlZmF1bHRfaW5pdChzdHJ1
Y3QgeGVfZGV2aWNlICp4ZSkKPiDCoHsKPiAtwqDCoMKgwqDCoMKgwqAvKiBUT0RPIC0gaW1wbGVt
ZW50ICovCj4gLcKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7Cj4gK8KgwqDCoMKgwqDCoMKgaW50IGVy
ciwgaTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgaWYgKCF4ZS0+aW5mby5oYXNfdXNtKQo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsKPiArCj4gK8KgwqDCoMKgwqDCoMKg
eGUtPnVzbS5wZl93cSA9IGFsbG9jX3dvcmtxdWV1ZSgieGVfcGFnZV9mYXVsdF93b3JrX3F1ZXVl
IiwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgV1FfVU5CT1VORCB8IFdRX0hJR0hQUkksCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoFhFX1BBR0VGQVVMVF9RVUVVRV9DT1VOVCk7Cj4gK8KgwqDCoMKg
wqDCoMKgaWYgKCF4ZS0+dXNtLnBmX3dxKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqByZXR1cm4gLUVOT01FTTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgZm9yIChpID0gMDsgaSA8IFhF
X1BBR0VGQVVMVF9RVUVVRV9DT1VOVDsgKytpKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGVyciA9IHhlX3BhZ2VmYXVsdF9xdWV1ZV9pbml0KHhlLCB4ZS0+dXNtLnBmX3F1ZXVl
ICsKPiBpKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKGVycikKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gZXJyX291dDsK
PiArwqDCoMKgwqDCoMKgwqB9Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoHJldHVybiBkZXZtX2FkZF9h
Y3Rpb25fb3JfcmVzZXQoeGUtPmRybS5kZXYsCj4geGVfcGFnZWZhdWx0X2ZpbmksIHhlKTsKPiAr
Cj4gK2Vycl9vdXQ6Cj4gK8KgwqDCoMKgwqDCoMKgZGVzdHJveV93b3JrcXVldWUoeGUtPnVzbS5w
Zl93cSk7Cj4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIGVycjsKPiDCoH0KPiDCoAo+IMKgLyoqCgo=
