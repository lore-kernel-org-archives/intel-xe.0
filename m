Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBFEC369DC
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 05:14:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47ED410E099;
	Wed,  7 May 2025 05:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mz/K3/f4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D829F10E099
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 05:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746594858; x=1778130858;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9BdPnUQQwBedYCgoZ00xzTQQOzssVxTsfgaLyiUpuu4=;
 b=mz/K3/f4SWC8sf5pwL1A1d1WnFqr++hc6dJiJhxzL2itNTN5g6t9BiAA
 DGncdQwV5pDOUGLNW+d6TLWXLtlqHPJheJhieInRQddvEz7R2ClO3vuxa
 ZSIRJKzDw9dXeOYMGduFMflmI5TuudADcDdAdX9XmrCEz7tDE5MrKO//H
 IsWQRRCmGbRCugvl7+m3knHi3NuVhir8/shVkqtO8rXzSzVdwXe8RuOq2
 WKHB146FBePyTU43/HUR3bBE+zCCEQYe8YYSs2kRTOg/fet0eDxBFFUE8
 JqortdR9RdftpiBHzWh+v6oqL2zeZWVbvzf9ogXraYGbNCSWDDpAf3X+Y Q==;
X-CSE-ConnectionGUID: 6s3uS77dSwmQ3KuUWVkzkg==
X-CSE-MsgGUID: /2EHM9wVR76Crjkgzh2svg==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="58930879"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; d="scan'208";a="58930879"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 22:14:16 -0700
X-CSE-ConnectionGUID: IzJ7JbnOQkuOkJ2y4+M1bg==
X-CSE-MsgGUID: TbpG4ky5Tx2uU6l4h14sSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; d="scan'208";a="135729624"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 22:14:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 6 May 2025 22:14:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 6 May 2025 22:14:15 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 6 May 2025 22:14:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F6onLmnwiF3SQMOM7gqYSDSeEcn/x/HCydYdrXXh4JLKUIvP+rzb0GjlchxHybk3GGaBDPYoCH1CdLX1ueXY6NPzd3NtiQdOnrHsaVNl5o54lCKdUmJtr0CO8c16tyzZXR4hamL/hvbDAUBr8burRRCh+aVUzWdGrZdBQ3jjy7hI1vFtHmbiEVefNHe6uBIw3vSVBNBbBIh4wT8qDy1j36TWTnpneiztvK8ctkb190sBag6RY7aZe6wX5r4TFRPjsXc34yVvMjfwvP6ql0LopojOHuQPLyEv1Qx2rGjdk++uEfMQ9tQNlKTIHlvxypjnyQeRmO7fKvbU089r637aTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9BdPnUQQwBedYCgoZ00xzTQQOzssVxTsfgaLyiUpuu4=;
 b=YVwHIGT1bpGs9n/VDtcflZFdIC6IYlHk6rTuzduedlzh+sTaije3CaFAV4SXASGzlPFCSQciCws4zqqHAcsjhwWaruV9NlRThS9j2LvRU9RlxqnbqwDbQxdY0zOx0lmon4a3xn6ee0nKju2VYyw5ZV+zq7CaypUjvo9HROmYXM7iH5bmtaoxFEzgxLYmXYxZgX0vfnRNXnVMMixzvjBjOGmzJAUX4fN2iJpv+xlCMe/EJO9xhxn1Hz5okxf0e2USgtQ2ftk+2l4S96Q+TV0xo8AvfXEfCV17omfm/ynqZBtcuP0KOQu+JT3QeW5qGZlNYWJDyfYP4GT4Eo1kIEOW4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by PH0PR11MB5174.namprd11.prod.outlook.com (2603:10b6:510:3b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Wed, 7 May
 2025 05:13:56 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%7]) with mapi id 15.20.8699.019; Wed, 7 May 2025
 05:13:56 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Chauhan, Aditya" <aditya.chauhan@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH v2] drm/xe: Add helper function to inject fault into
 ct_dead_capture()
Thread-Topic: [PATCH v2] drm/xe: Add helper function to inject fault into
 ct_dead_capture()
Thread-Index: AQHbudAE/LoFDjjINEyczG33HniCErPGRwuAgABh6nA=
Date: Wed, 7 May 2025 05:13:55 +0000
Message-ID: <LV3PR11MB86956B506EAD9EF55A9D841FF988A@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250430131710.20532-1-satyanarayana.k.v.p@intel.com>
 <ac18b7a1-c149-4182-bc6d-6b73b943525d@intel.com>
In-Reply-To: <ac18b7a1-c149-4182-bc6d-6b73b943525d@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|PH0PR11MB5174:EE_
x-ms-office365-filtering-correlation-id: 4bb8ab6f-5664-493a-c06d-08dd8d25f75a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?amUyWnRuZUFaRjVzZGlvK05obkJFN1dDNW5tcnZtQ3FoR0FOZXZmQWptM3Rr?=
 =?utf-8?B?V3ZPK1pUZDNwTmxOdUlLTjhPeE5DSUQ1WmFJbEtMb0pmRVY3T0FKNkt0K3BX?=
 =?utf-8?B?TkJ3QmVyeTdSSEtleXFkOVBXb2w0ZUhyM0c4cFc4eHJkRWFaU3hVVDRpU3hq?=
 =?utf-8?B?dklSTE1aVExTRFUzRTlMSU50M0FvdEVYRUtlRW53RVd2MTdaSEEreC9ObTZn?=
 =?utf-8?B?WFJkKzJYTEY4a2ZMc1d0d0lxU1VaZmg1Nk53a05GbGtpYmVRQVBibU9KMW93?=
 =?utf-8?B?WCtsanNLOGJ6azJ5S1RKN3F1NytWRDVsN0p0RHhDVVRLSjk4c1psSGpQT3dB?=
 =?utf-8?B?Nk9KQzJQUFZYU3NMeFMvcW5mSXpwMW8zdkN0MEJvRUtCajdLK0dITWJnYXho?=
 =?utf-8?B?RCtlUXlqNGVPdlZrYXBKclg1bVB2QnNzUExDSG1yUmJzWTRCVnpWencydDM0?=
 =?utf-8?B?aFhGNGpIZndiZHNTUXpEWEgvOENvRHQzblNvekJqM09hRjlYd1d1cWkxaVVV?=
 =?utf-8?B?TXVsMUpHMEdjTmVUZk5ReXJpWWVNaG5Xc0lhS1FwRUdKNEZDUEpTYVZwdjBT?=
 =?utf-8?B?aHp6TGpTOUhTWDRENVdHNW54NkYwQnZ6d2s0NnI0VmdKcnNkZCtldERNS0ZH?=
 =?utf-8?B?eGU0WndtSHc0UjA5VUw1KytlUkkyMHl1dTY5YkVQNFNWR3hmTHhhanBOWFdN?=
 =?utf-8?B?N3RyaTRIMU5DWkFKb0hGY2h0SG5HZmhHRmhXVFFUVmo4M09qSmMrN1FIVS9a?=
 =?utf-8?B?cytCaFV6bnBFMU5zMjZBd3Q5UDNzS3BNQTRyYzJPekhvSVljK1ZIczhnS3dH?=
 =?utf-8?B?c2dvZVhlbkdHL3J4MVVOd1l4ZFdZOVFoMzBBT3psOXhKZUdwUnpiblYzWVlj?=
 =?utf-8?B?cE1PZmtPbStsUCtKdHQ3azdFVTQ1Qm51T1ZRVGZDRlk4Z2RZTlVmOEJaS25S?=
 =?utf-8?B?ZjRya084S1Y4eVc4Q282cXZGdEtpa3dIbnYrakRLTXRrbU5pNzlkeDZNZHpo?=
 =?utf-8?B?ZzBobTFjckxYcFlhNlE2L0N4N3RCU01qSkxuWDRvbG1Fb3AvQ2Y2UytzK2JG?=
 =?utf-8?B?WUFLQ1BtSWI3TzViZ0l5T2doeUJtY0gwUk4xVVExQWhwVmpvMGl2UGFnS0JP?=
 =?utf-8?B?UVhQb1pXOGptZkwzeS9tUDg0VDh2cGc2dFVOd2Ruak5YUFg1Q1RTN1ZZMlRu?=
 =?utf-8?B?OUVudUhxdXVVUTlsUFFyc2ZnWW9UbG8wTkN0NjJ0NWtDWEZYZVE1QWR4Y25D?=
 =?utf-8?B?dWVLTWdyQ2dBNUcycDhPT1V6MVgrSndTV2FxWldjVGl1Mk9aR2dqZG9OTzdS?=
 =?utf-8?B?WkZ0aGxzRWtCY1VZbGxTRXYxL0pVMEVoK1NiVlZMbGNJbi9JcTJucVFRcEZj?=
 =?utf-8?B?MTRxaFVqSTR0S3BUVEw5RTg0SHhTVUMzQ3VzNW9sRUUyRGdFbkpnWkZVRGFt?=
 =?utf-8?B?MWZhZ1Q5WXBGZ0x2eWk3VkZUNVFzMy8ydVNOY21YYTR5OUVRQjExekNxWGpC?=
 =?utf-8?B?R2wzUm93VndiMGZLNmwvUWtEeUlyNUIrQ2dDaXRJeGxzOXF5TWFhZ1VQZ2FL?=
 =?utf-8?B?VHh6Nm5acGpTQmV5MlROT1N5Z3djSy83Q1FMd3NtaFhTVVZSV2Zmc0tiSy94?=
 =?utf-8?B?Y1o0c2lIa3pubHVuK1pJV0w2STJmQmNWeDdWS0hScXVDTlY1RlYxT1NZU1VJ?=
 =?utf-8?B?dG1aR1Z6L0c3THJJZUp2bVlBSWVnWlJMdFlrdnBSaVBQNTByaDY0L2VRemVO?=
 =?utf-8?B?b3NVd2dTUFl2RmxMZ21MSDljNzUrdWtneWRueW40ekYvcWsvbGZVdWRLSlBk?=
 =?utf-8?B?UnlyLzdDdjBldTF4VWhOU1BHRnBQeGl0MkFWS2p1MDJObGVhZFBadDc5MkNu?=
 =?utf-8?B?MjRNTEgvY0xva3YyTVlqYlE2M0czV0ZTSDNKcWt4UXFNTHorWGVkbnpocjdC?=
 =?utf-8?B?TnFYbTRYMzd6N1BaR3hBSWVkLytoeVR3SVBFOWZRc2R1dTFBQWZXcExFNk9S?=
 =?utf-8?Q?QKIybRVre139Nf0T1oJ6h5xwdWG4ZA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?djNoUG9RT2JzQkg1QXkra05PWHBpRGZlb3l3eHhlR1NIRUd6QmV1TWZ5R2FI?=
 =?utf-8?B?enBOZnBqbFlwV0tZNDVmYjhNQk1hVEE3S0hRWDh2NDJMMy9ZNDFsZmQ2VW1n?=
 =?utf-8?B?bTE5T1FCN2t5d2JxWXVUbzdPeFlIZFc2Y1I5U3kzK3c5VTF4WithM0dmVXhM?=
 =?utf-8?B?S3BlSjN3UWNVdVRMZmMxQWhsTWJTdUlPeSt3VUdmTGpkOVJlK2h3NjJTVU56?=
 =?utf-8?B?dDZmSFliNUhGMkdQMzFkNFZ6N2FzUmlHS01DQlFtMGVHOTcrMWNjNGoxMHlk?=
 =?utf-8?B?eEtkNmRRMklTTW9NOFM0eGNHejlibWVmNjJjVFhtN0ROQWgyT1N5OXBURWwy?=
 =?utf-8?B?ZHIwcllBTTU2UXQwTjJyYkc4U0VhK0RIWTY3ZTVyVloxMm9Sb0FVQjgzN0pu?=
 =?utf-8?B?NjRQVjA0aUd0WFNHSWc2c0YwZWNnLzhtY3N6emw3bmFkYllBZzZHaHVCZm1w?=
 =?utf-8?B?aFZrcXNuSUNabGFaRjViV2h3MzZHQVR2T1RBSnkxdnNPV3B1MkNYR2J0ZW1I?=
 =?utf-8?B?VE1VdTVEQnprTi9pZGtmOEtSUjI1MFdkK0tJdTRiTUcvcXdXTnpOL3JMSkpu?=
 =?utf-8?B?QkxPRi90VzhCTk1jZFZZd3YxeFNHT1FIZUFJRzFER0hjWHlnbUFscHU5MDBJ?=
 =?utf-8?B?VjI4MGFGOExldFdQUFlKNEFhNUxab0l0NjdGNHE0clZLN2lRWVFUUGp4dm14?=
 =?utf-8?B?YXQ3ZU1QcUg1QklxRm43ODh6QjM0RjVFbjVrTmtvYkgyYllqUWd0VHhkdHRm?=
 =?utf-8?B?czJLTDIrNTNTM0J0YjNuUjVjSVM0RVBrdjArT1JmTVBrNXkrVjZ6enJRQTE4?=
 =?utf-8?B?c1F1OFo2QndwVlhYOGl6Q1YrVVltZXZ4UFdPWlU0bnVpM05Nc3ZuNkM4NFls?=
 =?utf-8?B?OCtTV3lxV2RGa0N2TklLeVlzMzNNdDhLOHh4c04vMzE1akZQKy8zRGhYaDNM?=
 =?utf-8?B?WEYwL04yRmlrYlBHZTFuWHV1UU1oWGRDZ3RLTk9EVkZMcGZGeVFGbDNwUXhV?=
 =?utf-8?B?T1o3dUdoeWM0UElUa1ozQWZTejFHdURzRnpCMllYb29TQWtwUDZLczhQaWdY?=
 =?utf-8?B?YkNJc2wxMnFCb2orMWc0MU9NejZXZFE5eE9YT3hBRThSRjN0anVPR0RyS2JU?=
 =?utf-8?B?cjNTeGRpUGl5cVE2cjNlU0c0NlVhVTA2ZEE5UzRXRWRtK3dJM3pYMW1hZE5R?=
 =?utf-8?B?eEFwd2JIUmU4a0dTREtHK3ZjU1dIeUhWS21TOFpKZEtGOXJ5cHhWUnVrTXVZ?=
 =?utf-8?B?ZWIweTgzRHJQU201emorU2hDaDczSlFjUEJ0bUl2YmEzRzkvUUpuSHdvVjEr?=
 =?utf-8?B?MlU1SnFxUmFBNFdZWk1lZndFamxIM3ZHUEFPUnh5dXB5bnJWTE1qU1IrdU41?=
 =?utf-8?B?YUdFdE82ck9VMm5aL2VGUkNjb1hILzREYXR2MEprQVBSaHdvTi9pT3N1WGtx?=
 =?utf-8?B?NnludXBlRmQzWGZFN2VhbUQzUWluRGdhVzIrRHZvN3dzNUlQV0tYYVZudy9J?=
 =?utf-8?B?RFBtSEhZTmQwZ0w2Y2pqaW1OUy8vZVViTEVXL2tZWHZVaVNuaXB0V252UGVF?=
 =?utf-8?B?SllYdnM4a2xKNHYwc0dYUnpDMnUrVkkvcmN5YmNpb1dWTldsZHFkbTAxMkNH?=
 =?utf-8?B?MlQrclRTcXlzd0E2T0VnSENodXk4VXFwc3p6VFlKN0NMMmhvSTBhcVdJVHdZ?=
 =?utf-8?B?aW9xaTdGZmVTVlRlWk9QVW5PNENWRDQxOUtKckdoYjdiUHhOcjl6ZHVtdHJr?=
 =?utf-8?B?UXFXSW1CRitISTVLRnp4N2x0R1BCbHlrR2ZjazZSbUVzUWdtd0ZRRnp4a1B5?=
 =?utf-8?B?TjRkUnM5NWJqOWNSM2lCbTJ6TS9XWDJtMEZzY2ZabnhXRHp0WFJNVzV5Wm5G?=
 =?utf-8?B?a1RnNTlaVUtuVGsvV2NsN3RobXZQQnFtdlEwU0NZNjhqY2NEMFoxdU8xbXRT?=
 =?utf-8?B?NUYxbml5Z0pUdGsxS0VGQkFHNTM1NmQvSHVjQllxalJ4UjRCV2x3c0F4dWM2?=
 =?utf-8?B?dVp0UktrSjFzOVdlc21VSVRnR2FXRVVFVE5NM0NxRDdXVjdJUlNqR3N4Mis5?=
 =?utf-8?B?Nm42YzVSaHZoN1F6QjBnRU9uTUI1MmFFcGtWdDdzK3ZsaS9uVVU5OTZQVDlJ?=
 =?utf-8?B?cWhPa0hFSEpUb2NhSWhETWdqOXM1OC8vM2FiOVhXbHhUZkNxdW8wVTNwVmpi?=
 =?utf-8?B?ZGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bb8ab6f-5664-493a-c06d-08dd8d25f75a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 05:13:55.9415 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cBAQtDzNNH1o8XxRtkZORoj3QjShpQasslLRq4t1WRqDnC9tg9ItTvg1i3qqHB2i2f8iA+SI3+GD1dS/6NZIvvUs5KCMSfhCk268g+Q0m+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5174
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBIYXJyaXNvbiwgSm9obiBDIDxq
b2huLmMuaGFycmlzb25AaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIE1heSA3LCAyMDI1
IDQ6NTAgQU0NCj4gVG86IEsgViBQLCBTYXR5YW5hcmF5YW5hIDxzYXR5YW5hcmF5YW5hLmsudi5w
QGludGVsLmNvbT47IGludGVsLQ0KPiB4ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IENo
YXVoYW4sIEFkaXR5YSA8YWRpdHlhLmNoYXVoYW5AaW50ZWwuY29tPjsgTmlrdWxhLCBKYW5pDQo+
IDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIGRybS94
ZTogQWRkIGhlbHBlciBmdW5jdGlvbiB0byBpbmplY3QgZmF1bHQgaW50bw0KPiBjdF9kZWFkX2Nh
cHR1cmUoKQ0KPiANCj4gT24gNC8zMC8yMDI1IDY6MTcgQU0sIFNhdHlhbmFyYXlhbmEgSyBWIFAg
d3JvdGU6DQo+ID4gV2hlbiBpbmplY3RpbmcgZmF1bHQgdG8geGVfZ3VjX2N0X3NlbmRfcmVjdigp
ICYgeGVfZ3VjX21taW9fc2VuZF9yZWN2KCkNCj4gPiBmdW5jdGlvbnMsIHRoZSBDSSB0ZXN0IHN5
c3RlbXMgYXJlIGdvaW5nIG91dCBvZiBzcGFjZSBhbmQgY3Jhc2hpbmcuIFRvDQo+ID4gYXZvaWQg
dGhpcyBpc3N1ZSwgYSBuZXcgaGVscGVyIGZ1bmN0aW9uIGlzIGNyZWF0ZWQgYW5kIHdoZW4gZmF1
bHQgaXMNCj4gPiBpbmplY3RlZCBpbnRvIHRoaXMgeGVfc2hvdWxkX2ZhaWxfY3RfZGVhZF9jYXB0
dXJlKCkgaGVscGVyIGZ1bmN0aW9uLA0KPiA+IGN0IGRlYWQgY2FwdHVyZSBpcyBhdm9pZGVkIHdo
aWNoIHN1cHByZXNzZXMgY3QgZHVtcHMgaW4gdGhlIGxvZy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IFNhdHlhbmFyYXlhbmEgSyBWIFAgPHNhdHlhbmFyYXlhbmEuay52LnBAaW50ZWwuY29tPg0K
PiA+IFN1Z2dlc3RlZC1ieTogSm9obiBIYXJyaXNvbiA8Sm9obi5DLkhhcnJpc29uQEludGVsLmNv
bT4NCj4gPiBUZXN0ZWQtYnk6IEFkaXR5YSBDaGF1aGFuIDxhZGl0eWEuY2hhdWhhbkBpbnRlbC5j
b20+DQo+ID4NCj4gPiAtLS0NCj4gPiBDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVs
LmNvbT4NCj4gPg0KPiA+IFYxIC0+IFYyOg0KPiA+IC0gRml4ZWQgcmV2aWV3IGNvbW1lbnRzLg0K
PiA+IC0tLQ0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jdC5jIHwgMjEgKysrKysr
KysrKysrKysrKysrKysrDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKQ0K
PiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY3QuYw0KPiBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY3QuYw0KPiA+IGluZGV4IDI0NDdkZTBlYmVkZi4u
ZDZlN2E4YjgwZDhjIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNf
Y3QuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY3QuYw0KPiA+IEBAIC0x
NzcwLDYgKzE3NzAsMjAgQEAgdm9pZCB4ZV9ndWNfY3RfcHJpbnQoc3RydWN0IHhlX2d1Y19jdCAq
Y3QsDQo+IHN0cnVjdCBkcm1fcHJpbnRlciAqcCwgYm9vbCB3YW50X2N0YikNCj4gPiAgIH0NCj4g
Pg0KPiA+ICAgI2lmIElTX0VOQUJMRUQoQ09ORklHX0RSTV9YRV9ERUJVRykNCj4gPiArLyoqDQo+
ID4gKyAqIHhlX3Nob3VsZF9mYWlsX2N0X2RlYWRfY2FwdHVyZSAtIEhlbHBlciBmdW5jdGlvbiB0
byBpbmplY3QgZmF1bHQuDQo+ID4gKyAqDQo+ID4gKyAqIFRoaXMgaXMgYSBoZWxwZXIgZnVuY3Rp
b24gdG8gaW5qZWN0IGZhdWx0IGludG8gY3RfZGVhZF9jYXB0dXJlKCkuDQo+ID4gKyAqIEFzIGZh
dWx0IGlzIGluamVjdGVkIHVzaW5nIHRoaXMgZnVuY3Rpb24sIG5lZWQgdG8gbWFrZSBzdXJlIHRo
YXQNCj4gPiArICogdGhlIGNvbXBpbGVyIGRvZXMgbm90IG9wdGltaXplIGFuZCBtYWtlIGl0IGFz
IGEgaW5saW5lIGZ1bmN0aW9uLg0KPiA+ICsgKiBUbyBwcmV2ZW50IGNvbXBpbGUgb3B0aW1pemF0
aW9uLCAibm9pbmxpbmUiIGlzIGFkZGVkLg0KPiA+ICsgKi8NCj4gPiArc3RhdGljIG5vaW5saW5l
IGludCB4ZV9zaG91bGRfZmFpbF9jdF9kZWFkX2NhcHR1cmUodm9pZCkNCj4gPiArew0KPiA+ICsJ
cmV0dXJuIDA7DQo+ID4gK30NCj4gPiArQUxMT1dfRVJST1JfSU5KRUNUSU9OKHhlX3Nob3VsZF9m
YWlsX2N0X2RlYWRfY2FwdHVyZSwgRVJSTk8pOw0KPiA+ICsNCj4gPiAgIHN0YXRpYyB2b2lkIGN0
X2RlYWRfY2FwdHVyZShzdHJ1Y3QgeGVfZ3VjX2N0ICpjdCwgc3RydWN0IGd1Y19jdGIgKmN0Yiwg
dTMyDQo+IHJlYXNvbl9jb2RlKQ0KPiA+ICAgew0KPiA+ICAgCXN0cnVjdCB4ZV9ndWNfbG9nX3Nu
YXBzaG90ICpzbmFwc2hvdF9sb2c7DQo+ID4gQEAgLTE3NzgsNiArMTc5MiwxMyBAQCBzdGF0aWMg
dm9pZCBjdF9kZWFkX2NhcHR1cmUoc3RydWN0IHhlX2d1Y19jdA0KPiAqY3QsIHN0cnVjdCBndWNf
Y3RiICpjdGIsIHUzMiByZWFzbw0KPiA+ICAgCXVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+ID4gICAJ
Ym9vbCBoYXZlX2NhcHR1cmU7DQo+ID4NCj4gPiArCS8qDQo+ID4gKwkgKiBIdWdlIGR1bXAgaXMg
Z2V0dGluZyBnZW5lcmF0ZWQgd2hlbiBpbmplY3RpbmcgZXJyb3IgZm9yIGd1Yw0KPiBDVC9NTUlP
DQo+ID4gKwkgKiBmdW5jdGlvbnMuIFNvLCBsZXQgdXMgc3VwcHJlc3MgdGhlIGR1bXAgd2hlbiBm
YXVsdCBpcyBpbmplY3RlZC4NCj4gPiArCSAqLw0KPiA+ICsJaWYgKHhlX3Nob3VsZF9mYWlsX2N0
X2RlYWRfY2FwdHVyZSgpKQ0KPiBJcyBpdCB3b3J0aCBtYWtpbmcgdGhpcyBhIG1vcmUgZ2VuZXJp
YyAnaXNfZXJyb3JfZmF1bHRfaW5qZWN0ZWQoKSc/IFRoZW4NCj4gaXQgY2FuIGJlIHVzZWQgYnkg
cmFuZG9tIG90aGVyIGJpdHMgb2YgY29kZSBpZi93aGVuIG5lY2Vzc2FyeS4gQW5kIG1heWJlDQpJ
IGRvIG5vdCB0aGluayB3ZSBjYW4gaGF2ZSBhIGdlbmVyaWMgZXJyb3IgaW5qZWN0aW9uIGZ1bmN0
aW9uLiBJZiB0aGUgZ2VuZXJpYyBlcnJvciBpbmplY3Rpb24gZnVuY3Rpb24gaXMgY2FsbGVkIGF0
IG11bHRpcGxlIHBsYWNlcw0KKG1heSBiZSBpbiBmdXR1cmUpLCB0aGVuIHdlIG1heSBub3QgaW5q
ZWN0IGVycm9yIGF0IHBvaW50IHdoZXJlIHdlIGludGVuZCB0byBpbmplY3QgYXMgdGhlIGZpcnN0
IGNhbGwgd2lsbCBpbmplY3QgdGhlIGVycm9yLg0KPiBhbHNvIGhhdmUgYW4gaW5saW5lLyNkZWZp
bmUgdmVyc2lvbiBmb3Igd2hlbg0KPiBDT05GSUdfRlVOQ1RJT05fRVJST1JfSU5KRUNUSU9OIGlz
IG5vdCBkZWZpbmVkPw0KPiANCldpbGwgZG8gYW5kIHNlbmQgbmV3IHBhdGNoLg0KPiBKb2huLg0K
PiANCj4gPiArCQlyZXR1cm47DQo+ID4gKw0KPiA+ICAgCWlmIChjdGIpDQo+ID4gICAJCWN0Yi0+
aW5mby5icm9rZW4gPSB0cnVlOw0KPiA+DQoNCg==
