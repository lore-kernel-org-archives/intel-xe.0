Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6458AC25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 19:01:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0999910F09F;
	Tue, 21 May 2024 19:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Us6T0w2b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 578D510F09F
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 19:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716318090; x=1747854090;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=DLI5tyOwHDYkBshRi8NwMKLJXOniBav0q9Idl8D/msM=;
 b=Us6T0w2buWqJu6jrnAOGh3BMxk3AXQQDG7Cq6wVRjJaw3YbeCEhu5Y3l
 ZNv/a7E1XPY2II9+2NcTKSHPWVAcNXXLd/05t/u66caPzCzchJmLD9TmA
 A4NyILiq1Kz1qYbgLnYvpoIXfhbYWK+3hy5Og8qC/BRpJQUejWTwMOUe4
 9elXinfvAOgCqm3RpXDcmtwyhoD/OI2S54IboyjJ/vEO5q1pdQKjoaCah
 /iyiFZ5YKhfVKQ5vFDwKO+fIzzuSG8exLyVHpUh92hB2v3k+GaREZT4wz
 oW+RuqYKWBBagPJwHOIdrj9emPjGFZZqkbIaF7P7vu1mNrz+ZQtX5zWo8 A==;
X-CSE-ConnectionGUID: 4qSejktrRye2tmNTpVuwtw==
X-CSE-MsgGUID: ZThLzeKGQNSZmIu+dgHZhg==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="12326711"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="12326711"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 12:01:29 -0700
X-CSE-ConnectionGUID: S2HFg+ypTsG/CTGu2aDugQ==
X-CSE-MsgGUID: zDOqFdoPSFy2+2eRnGIwZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="64254559"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 May 2024 12:01:30 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 12:01:28 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 21 May 2024 12:01:28 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 12:01:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mroal6HcFi3A+0BpiCQ5zdC9r5yh/MF68ZvFoaP1RqhNJQ8niE2oZP2nIyGc2A7i6wzS+kEy9PvtIbNn8rYehDk22u4SbVgceutA/VcMZeKFMSJE3ALt9vQMyFuUt8VA/Iqn6HxufD+/d/6IbCOnjTpAam+M4Zw3dup5pu0gcLRQRJg2y1GmM44gyWCooM6itWaGgNemAcETSIeNHaxI9TRyj64isvU8UQ2GBQY7vFntESVlfSyCO9G6gtWPewVIM1hF6B2gF2mX87DxOpZodm+dySO10pJyJNA6JNbnsC1TBfu45g5Hk8LNZnS5vJ97afCgmrerTTQo5hAOv+6IRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DLI5tyOwHDYkBshRi8NwMKLJXOniBav0q9Idl8D/msM=;
 b=nKz6E3yPpI78W0DrUE6F9GX19c0aXmV0XthHkQeBKChk1jvpvZX423FEYKKhrIIezIUMNdToTyuBwoI69jZhGHb673FviX9pEmHMk7S4hE0O1qnpgjprPxdpguMjt3LlYRX2MnvFWpWXPZlu/XtZo6cwr99/EqeNbiTnXrGLCpwjV3p3elQWaL1FCULoChP/KNnwWgQevPmhDSuLhFWkQG6dhqgtseNECEFwz27ZKmFxM5kiP/++hOww2bHHumfO4yr/0c3dpxyWqTg2IxPp+x7i9mKiQYO3x/+KiBkUHeYXqr2y7uw0dhOF2pykY4ialv7uSMOHrZ80Zo7IYyfTqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ2PR11MB8469.namprd11.prod.outlook.com (2603:10b6:a03:57b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 19:01:21 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%6]) with mapi id 15.20.7587.028; Tue, 21 May 2024
 19:01:21 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Krzemien, Robert" <robert.krzemien@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Landwerlin, Lionel G"
 <lionel.g.landwerlin@intel.com>
Subject: Re: [PATCH 00/17] Add OA functionality to Xe
Thread-Topic: [PATCH 00/17] Add OA functionality to Xe
Thread-Index: AQHadnkcIUwutN2VakWosatViFIW8bGcJwYAgAB1PYCABZE6AIAAAUuAgAAW/ICAAAV7AIAAA74AgAAPqACAAAZugIAAAnOAgAAODQA=
Date: Tue, 21 May 2024 19:01:21 +0000
Message-ID: <f349814f7b680411d9109651c645bbc2c6366185.camel@intel.com>
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
 <87v837ox1m.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87v837ox1m.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ2PR11MB8469:EE_
x-ms-office365-filtering-correlation-id: 30fd90be-bfdd-4ba0-c553-08dc79c86740
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?Z3VIS0Y3Q1RqVDdFTXMzZDhHN1ltejN0bmE0ZElFTHAxQ1J5MHpNQnpQZmZ2?=
 =?utf-8?B?TFdOY3FzbEJwZTZ6dk9YbHV4blppaksvcS92RDBrQWlER0xFUFVGeDUwQ2Ez?=
 =?utf-8?B?VTcxU3E3Y21wR05LNXJMUkYzMlJiRm9sTDE4cVJ0VEZ3bjRpNVFodTFhNlZD?=
 =?utf-8?B?emVjSUxTOXNvVDhNOXRhQUVnSmUwUmxGdWluYnNPbVp6VEZPV3oxVEI2VnQ3?=
 =?utf-8?B?SDhGZ2RTZnRtZHgxMU10Ris1TCtXRVEwR0h4T3M5aFlrSUR0cXJsNUw0VmxS?=
 =?utf-8?B?NHdESzRsckdPLzkrenhRQXJMS1VZVE9pUGQrOTFWYUtsR1VVTDlkRVp6MG5o?=
 =?utf-8?B?Q3NMeXY5TEMwL0xieHRaUnFhM1BvUmhaQ2hBeTczU1ZKd2hzQkZGb08vWVFV?=
 =?utf-8?B?OTZIa05WWmVwd01tY25lOWFoU3BDOE84b1h5VkhuZ05HYkNrODNreWYwVVk5?=
 =?utf-8?B?NjJGK1I4bG9DWTB6M0ZqZEMxYmptNnlQZkNOWFJ3bTNRSk1JVFZRbm1BUTVv?=
 =?utf-8?B?VVdYa3JmMmg1U1h6TVkxWkdWc2E1Tyt0a1dwOXh1ajQ5a3hzZklXbnJyeUV0?=
 =?utf-8?B?ejFrcHgvb2traGNEQUx0U2xLZ0RxN3IxQlJ6aVVmUTVuMXZWRkVxVWZ1Mm9G?=
 =?utf-8?B?bXpEeklhd2lxajViMEYxcWpXaHJsTTJFMzl5UjZLTyt3YXk5NXJQL3JuOEtm?=
 =?utf-8?B?RHByZEkxbGlBeXRRRGxqY0xBQ2NhRDlIanpIRC9yTGg4TUsvSTRlTVVQWjNO?=
 =?utf-8?B?NG5mcWc4Nlo3Z3ptK2prVkI0RzVLNVFhYVpOaEJmMEF4V2ExY3lnVnZYamhQ?=
 =?utf-8?B?SlhJbGlYTmZCUG14OUs3bTF5T21xT1pzZGI3bjFxV045eWVUc1pueURUb2cv?=
 =?utf-8?B?eFJFeDBrMXpwb1lSd1ZlRG1Xekxwcy9lM2s2ZXVBaFY1K2xBWVozbER5MnR5?=
 =?utf-8?B?ZG9RbHBURWxnbGFxcFFaVU02b2loQ09NSXFLbjU5bktkTCtyb0xqZkh4YkFX?=
 =?utf-8?B?SXpBWTR1SWZRbmFJRFpsbFdreHh1MXJlcTl0VW8rRk02NWxaYi9lUENaMnFj?=
 =?utf-8?B?SFZKS3YrYzRlT0xSSk9nMmF4N0VDNVUzV2kzS2w3MlkzYU1reVVOczNMZjMz?=
 =?utf-8?B?UnRrOHZoU3VDbU0weTlyTUdFVS9OSEx0d2lzVHlRcjRoV3lyVUZyMXNuZUp1?=
 =?utf-8?B?ZUZEbzlGMGJtTXh1d05ZRkNvZmxVZlorZ2M5RVBXbnFaY29BYVJJZER4Sjls?=
 =?utf-8?B?S1VOQXZaL1lXdWY5SEFTSTdHc21XWXZIcFQ3dHpweTRrYWFUQmtkcWV2bERF?=
 =?utf-8?B?TUVFbXpab0VNYVNyZFF3Q2krK0hDajhCckNPbGxMSlJ0SDgrc1JENGtOc1J0?=
 =?utf-8?B?QmxVVnA5RXBybE91NUdGNW5YNUhrQXB0cGtZNi8vdmFGcVVDNkpmdjllWGxk?=
 =?utf-8?B?NnJaVVBLQ0dnckdJWTN4d0RGeU56MHpCME5yYVBzcENVSkR3S1FiVnRkUWJ0?=
 =?utf-8?B?VWxOV2QrTXZlU2RCcCtaUmp1a3hXZG9PWUM5LzBLZVFNL0xqWWFjZXVqS2do?=
 =?utf-8?B?WVZjQm8xQmdpRjdEK01vcjJrQW1qbDlISjR5dnphbjhDNmtaMXhwL2VTVVNF?=
 =?utf-8?B?ck5RU0xhSks4dFc1WlovbkdSckZqQi9sbndvUXd5T1lKd2lqbDNWYjZNZGtQ?=
 =?utf-8?B?ZXpCNEFnUUtpUzBsbTRUQS8wcnhlSVZ6WjRpUHUwWmcwMTFrbnJsTmlEcFIv?=
 =?utf-8?Q?0O/rDaGTHgjye7Vxog=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q1hLOWp1WHBWSjR2bzE0R3k3VTE1WXRpSzJyN1dMQkFDc1F5Uzk4elVkNXJJ?=
 =?utf-8?B?TTBFelhnd0VZOWoyQjBxdXhlTW93cll4eHVER1pka2RDRmtUdlg4Tmc5VTl4?=
 =?utf-8?B?b3lvTHpad0owcHRoZ01KSmVkU0Z6L2hKc1VtcFBSWnlQMW9aUFlnSFV1K0c4?=
 =?utf-8?B?QlFFalR5ZGNEMmY0NUZFaTZ5Z2dkaHZMcHd3Qm1ob0FEMVg2U2I1Q2lMM1Z2?=
 =?utf-8?B?NXFBWE1wY3E1M2p3Y0t4WFhoUldSVVJTci9QaHpjYlNMMVlOSnplVTdIeVRZ?=
 =?utf-8?B?Uy9YRW02bFNUZHVlV1JuMi9DZ1ZFQVFqVXJYSE9xWVNhM3FHNU9XTy9DYlln?=
 =?utf-8?B?b1dDT1JXaFVxcUp5Lzl0NWlPTHFPK0kza0lvcHgwUk11UTQxUW12TjI1N1hZ?=
 =?utf-8?B?b0dvU25PZEV4TGNDajBSUEM0eVNqVFVOb2JIdkwyblkrLzIxZm9aSTkvbXNS?=
 =?utf-8?B?YjEwSm00TE9zd2p5aUJIVVZTOFp1OXl1TFcvMHE5WnhKNnRxRnY0OG1QNkY5?=
 =?utf-8?B?M21zcW1xSElOOXpaK2IvUHBLNnVGL1dvcGFIOS9wZFhxMmJLdkM4WkNaTUlQ?=
 =?utf-8?B?REdzNWI2cWtiWkFWSEZCU0NhcVBneTRickxmaERFd2ttQzhBbGE0TjhGY2Fu?=
 =?utf-8?B?Ly9QdGRtRExVY3FzMVJrWG82YkhacmIwSS84ZnNDemdCVTkxMzlSU1ZjdnIy?=
 =?utf-8?B?MFZnYm11V3pIWWxrSGp0MmJob3BBOEFmbGZNL0NaVURWUWphdUJyYVlpeGlq?=
 =?utf-8?B?clpZUmR4ZlJsZDFOVUVnZ1NJUjhYak9tdUJURU4rZUFiNDVBTURSRi8ybVZO?=
 =?utf-8?B?TitnREtyRlFEa21TUStFZ09vT0NSUlRJL3BzNmZxL0NhdTE1Q1JFdVRnNG43?=
 =?utf-8?B?aUM2WERNaGdXbWsyRmZMeW1sdHBzVlFzWmpYa1ZEYnFjVW91WFlKc2dZVWNi?=
 =?utf-8?B?SnhMUXVsaWoxZlZKSUlXM0NPMjVlQWlxcFE0SWI4MXNBUE1RN2dvME83UnN1?=
 =?utf-8?B?R1I5T252R0cwSXJUd0tCSzVqUHhTcVdFY2NET1NHNDBDRGVEeWU1c24rWjdp?=
 =?utf-8?B?d1VqOWptQmxPMVEvOVdQNURncWFUekRPRzYyTHZvR3hia2ZsSmpRbWhiU1Mx?=
 =?utf-8?B?VTZJT2ZDRHJtMFp0ZjZqeEtrdzI3RFBsakNwdXJ2WFhVWTg5QnRoYWhXeGdW?=
 =?utf-8?B?enFsY2R0cFg0dDBsazZHQzNtTkFXcW1FalNOc20vT0Y0dWxVZzhZVC9GZlZJ?=
 =?utf-8?B?VWpJcnp6amlkZk5HV0hJY21WaHhWczlveEo4YzFmNWdJRkZZUTRTTDl1c0JU?=
 =?utf-8?B?MjdZMnlKa0d0LzBWcTZxZlR6c2Q4a2lCMEI5UjdvcW44a1J2ak5DZklLc1Zp?=
 =?utf-8?B?MVU3aGZnK1YvSkJIemVjRm1SODBIamR6ZlIxWUtTWGxERW54RVErRm5scHFE?=
 =?utf-8?B?RGdVWVVqR0dwSlAwUWpkQ3NQdGd6K3VwV2RyUE1rRTdKb1pDTzh2bmpTUDlL?=
 =?utf-8?B?V0pxUk1wdlRaTzd1YmhHL1hUaVBxbU9pMHR1ZmN1d0ZNMGduSUp5R3I5YVpH?=
 =?utf-8?B?NHZDQWkvQWN0YXd3N01GdW1xcUFmUmJLRitiOFZxYlN1UnZsYUdCNmMrTHhu?=
 =?utf-8?B?STdhVjB4ZDFwRTBtYmZLL0xuc0dDTXBkOVArRHJzKytBUFJ2clhCVzdBeVBL?=
 =?utf-8?B?aHhjc3JxY3FwdHhFQmJMSTRsRGtheXhJRlo5a0h2eFVUazFiV3UvakFvOXhj?=
 =?utf-8?B?RUFpWU55c3NBdGo1WWhyclVNU3FYY3FvVWtnOHB6cEl1dmJjc2ZhRmtkQU9F?=
 =?utf-8?B?N2xkQjlhNHo0akx0UzMzU2lmVTB6WmZxNWFkMnpiTHFRTCtBNXJndmQyM0xT?=
 =?utf-8?B?QVQ2dzB5dXpOMVVKN1l4aEo5NWlYOWxHN0xaRDdPdmgyUTB2NjBZemtCQ2pP?=
 =?utf-8?B?YmF5ZVBxYWg1ZnlXMUg0c3lSeWhScG00ZzNVWWtRVzBlMUQvYjBLVWZLM1F0?=
 =?utf-8?B?MkdDQkN2UjZqM1ljRjcvdnBicTVlMTlBdkg2YzVHT1ZTTFFWODExOHhCVXN0?=
 =?utf-8?B?SlVqbWsxZURrSmhnallINEdaZmo0amFsWS9FZGZCeUx3dUVOYkk0ZFVUWlha?=
 =?utf-8?B?cXd3NXRRNnJ0NGFQWVJjMGFnWUNmSVdhb2w4bkdzeUFHK0kyUnNiSVNVcXlG?=
 =?utf-8?B?OEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D92902B07A7FF048ADF51B0E64129CB7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30fd90be-bfdd-4ba0-c553-08dc79c86740
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2024 19:01:21.1883 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YplCNokt1RA/sM+i3MQa7tRzsWMAHKRoMisVcU2CrB3ncRwI/IJ/6EzTTA2fSHTMDYnfybgNM2NyzYwvZjW9LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8469
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

T24gVHVlLCAyMDI0LTA1LTIxIGF0IDExOjExIC0wNzAwLCBEaXhpdCwgQXNodXRvc2ggd3JvdGU6
DQo+IE9uIFR1ZSwgMjEgTWF5IDIwMjQgMTE6MDI6MTUgLTA3MDAsIERpeGl0LCBBc2h1dG9zaCB3
cm90ZToNCj4gPiANCj4gPiBPbiBUdWUsIDIxIE1heSAyMDI0IDEwOjM5OjE3IC0wNzAwLCBTb3V6
YSwgSm9zZSB3cm90ZToNCj4gPiA+IA0KPiA+ID4gT24gVHVlLCAyMDI0LTA1LTIxIGF0IDA5OjQz
IC0wNzAwLCBEaXhpdCwgQXNodXRvc2ggd3JvdGU6DQo+ID4gPiA+IE9uIFR1ZSwgMjEgTWF5IDIw
MjQgMDk6Mjk6NTEgLTA3MDAsIFNvdXphLCBKb3NlIHdyb3RlOg0KPiA+ID4gPiA+IA0KPiA+ID4g
PiA+IE9uIFR1ZSwgMjAyNC0wNS0yMSBhdCAwOToxMCAtMDcwMCwgRGl4aXQsIEFzaHV0b3NoIHdy
b3RlOg0KPiA+ID4gPiA+ID4gT24gVHVlLCAyMSBNYXkgMjAyNCAwNzo0Nzo1OCAtMDcwMCwgU291
emEsIEpvc2Ugd3JvdGU6DQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IEhpIEpvc2UsDQo+ID4g
PiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiBPdGhlciBhc2ssIGNhbiB5b3UgcmVtb3ZlIHRoaXMg
J0ZhaWxlZCB0byByZW1vdmUgdW5rbm93biBPQSBjb25maWcnDQo+ID4gPiA+ID4gPiA+ID4gZGVi
dWcgbWVzc2FnZSBmcm9tIHhlX29hX3JlbW92ZV9jb25maWdfaW9jdGwoKT8NCj4gPiA+ID4gPiA+
ID4gDQo+ID4gPiA+ID4gPiA+IE1pc3NlZCAnSW5zdWZmaWNpZW50IHByaXZpbGVnZXMgdG8gcmVt
b3ZlIHhlIE9BIGNvbmZpZycsIHRoYXQgbmVlZCB0byBiZQ0KPiA+ID4gPiA+ID4gPiByZW1vdmVk
IHRvbyBmcm9tIHhlX29hX3JlbW92ZV9jb25maWdfaW9jdGwoKS4NCj4gPiA+ID4gPiA+ID4gDQo+
ID4gPiA+ID4gPiA+ID4gTWVzYSB3aWxsIGJlIHVzaW5nIERSTV9YRV9QRVJGX09QX1JFTU9WRV9D
T05GSUcgd2l0aCBjb25maWcgaWQgc2V0IHRvDQo+ID4gPiA+ID4gPiA+ID4gVUlOVDY0X01BWCB0
byBkZXRlY3QgaWYgWGUgS01EIHN1cHBvcnRzIE9BIGNvdW50ZXJzIGFuZCBpZiBhcHBsaWNhdGlv
bg0KPiA+ID4gPiA+ID4gPiA+IGhhcyBlbm91Z2ggcGVybWlzc2lvbnMgdG8gdXNlIGl0LiAgU28g
aXQgY2F1c2VzIGRtZXNnIHRvIGJlIGZsb29kZWQNCj4gPiA+ID4gPiA+ID4gPiB3aXRoICd4ZSAw
MDAwOjAwOjAyLjA6IFtkcm06eGVfb2FfcmVtb3ZlX2NvbmZpZ19pb2N0bCBbeGVdXSBGYWlsZWQg
dG8NCj4gPiA+ID4gPiA+ID4gPiByZW1vdmUgdW5rbm93biBPQSBjb25maWcnIG1lc3NhZ2VzIHdo
ZW4gcnVubmluZyB0ZXN0cyBzdWl0ZXMuDQo+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+
ID4gT3IgZG8geW91IGhhdmUgb3RoZXIgc3VnZ2VzdGlvbiBvZiB1QVBJIHRoYXQgSSBjYW4gdXNl
Lg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBPSywgc28geW91IGFyZSByZWx5aW5nIG9uIEVO
T0RFViBhbmQgRUFDQ0VTIGVycm5vJ3MgZnJvbQ0KPiA+ID4gPiA+ID4gRFJNX1hFX1BFUkZfT1Bf
UkVNT1ZFX0NPTkZJRyB0byBmaW5kIG91dCAoYSkgaWYgT0EgaXMgcHJlc2VudCBhbmQgKGIpIGlm
DQo+ID4gPiA+ID4gPiB5b3UgbmVlZCB0byBiZSByb290IChhY3R1YWxseSBDQVBfUEVSRk1PTiBv
ciBDQVBfU1lTX0FETUlOKS4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiB5ZXANCj4gPiA+ID4gPiAN
Cj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gVGhpcyBsb2dpYyBpbiBYZSBzaG91bGQgYmUgY2xv
c2UgdG8gd2hhdCB3ZSBoYXZlIGluIGk5MTU/IFdoYXQgZG9lcyBNZXNhIGRvDQo+ID4gPiA+ID4g
PiBmb3IgaTkxNSwgb3Igd2hhdCBkb2Vzbid0IHdvcmsgaW4gWGU/DQo+ID4gPiA+ID4gPiANCj4g
PiA+ID4gPiA+IEhlcmUgYXJlIHNvbWUgcG9pbnRlcnM6DQo+ID4gPiA+ID4gPiANCj4gPiA+ID4g
PiA+ICogWW91IGNhbiBleGVjdXRlIERSTV9YRV9ERVZJQ0VfUVVFUllfT0FfVU5JVFMgdG8gc2Vl
IGlmIE9BIGlzIHByZXNlbnQNCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gKiBBZGQvcmVtb3Zl
IE9BIGNvbmZpZ3MgYW5kIHVzaW5nIHRoZSBnbG9iYWwgT0FHIGJ1ZmZlciAodGltZSBiYXNlZA0K
PiA+ID4gPiA+ID4gICBzYW1wbGluZyBvciBEUk1fWEVfT0FfUFJPUEVSVFlfU0FNUExFX09BIHNl
dCkgYXJlIHByaXZpbGlnZWQgb3BlcmF0aW9ucw0KPiA+ID4gPiA+ID4gICAobmVlZCByb290KS4g
T3BlcmF0aW9ucyB3aGljaCBvbmx5IG5lZWQgT0FSL09BQyAoT0EgcXVlcmllcywgd2l0aG91dA0K
PiA+ID4gPiA+ID4gICBEUk1fWEVfT0FfUFJPUEVSVFlfU0FNUExFX09BKSBjYW4gYmUgZXhlY3V0
ZWQgYnkgbm9uLXJvb3QuDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ICogSWYgIi9wcm9jL3N5
cy9kZXYveGUvcGVyZl9zdHJlYW1fcGFyYW5vaWQiIGlzIDAsIGFsbCBvcGVyYXRpb25zIGNhbiBi
ZQ0KPiA+ID4gPiA+ID4gICBleGVjdXRlZCBieSBub24tcm9vdCB1c2Vycy4gT3RoZXJ3aXNlLCBh
cyBJIGRlc2NyaWJlZCBpbiB0aGUgcHJldmlvdXMNCj4gPiA+ID4gPiA+ICAgcG9pbnQuDQo+ID4g
PiA+ID4gDQo+ID4gPiA+ID4gSXQgaXMgcG9zc2libGUgdGhhdCBwcm9jZXNzIG5vdCBzdGFydGVk
IGJ5IHJvb3QgaGFzIENBUF9QRVJGTU9OOg0KPiA+ID4gPiANCj4gPiA+ID4gWWVzLCBjb3JyZWN0
Lg0KPiA+ID4gPiANCj4gPiA+ID4gQWJvdmUgSSBhbSB1c2luZyAicm9vdCIgbG9vc2VseSBhcyAi
Q0FQX1BFUkZNT04gb3IgQ0FQX1NZU19BRE1JTiIuDQo+ID4gPiA+IA0KPiA+ID4gPiBTbyBpZiBy
b290IHNldHMgJ3BlcmZfc3RyZWFtX3BhcmFub2lkJyB0byAwLCBub3JtYWwgdXNlcnMgY2FuIGRv
IE9BDQo+ID4gPiA+IHByaXZpbGlnZWQgb3BlcmF0aW9ucyAoYXMgZGVzY3JpYmVkIGFib3ZlKS4N
Cj4gPiA+ID4gDQo+ID4gPiA+IElmIHJvb3Qgc2V0cyAncGVyZl9zdHJlYW1fcGFyYW5vaWQnIHRv
IDEsIG9ubHkgQ0FQX1BFUkZNT04gb3IgQ0FQX1NZU19BRE1JTg0KPiA+ID4gPiB1c2VycyBjYW4g
ZG8gT0EgcHJpdmlsaWdlZCBvcGVyYXRpb25zLg0KPiA+ID4gDQo+ID4gPiBvaCBva2F5IHNvIHBl
cmZfc3RyZWFtX3BhcmFub2lkIGhhcyBhIGdvb2QgdXNhZ2UgYnV0IGl0IGRvIG5vdCBjb3ZlcnMN
Cj4gPiA+IENBUF9QRVJGTU9OLCBzZWUgYmVsb3cuDQo+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiA+
ID4gIlVucHJpdmlsZWdlZCBwcm9jZXNzZXMgd2l0aCBlbmFibGVkIENBUF9QRVJGTU9OIGNhcGFi
aWxpdHkgYXJlIHRyZWF0ZWQNCj4gPiA+ID4gPiBhcyBwcml2aWxlZ2VkIHByb2Nlc3NlcyB3aXRo
IHJlc3BlY3QgdG8gcGVyZl9ldmVudHMgcGVyZm9ybWFuY2UNCj4gPiA+ID4gPiBtb25pdG9yaW5n
IGFuZCBvYnNlcnZhYmlsaXR5IG9wZXJhdGlvbnMsLi4uIg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+
IEFuZCBmcm9tIHdoYXQgSSB1bmRlcnN0b29kIG9ubHkgcm9vdCBjYW4gd3JpdGUgdG8gcGVyZl9z
dHJlYW1fcGFyYW5vaWQsDQo+ID4gPiA+ID4gc28gSSBkb24ndCBzZWUgYSBwb2ludCBpbiBoYXZp
bmcgdGhpcyBmaWxlLi4uDQo+ID4gPiA+IA0KPiA+ID4gPiBTbyBJIGRvbid0IGtub3cgaG93IHRo
aXMgc3RhdGVtZW50IGZvbGxvd3M/DQo+ID4gPiA+IA0KPiA+ID4gPiByb290IG9yIHN1cGVydXNl
ciBpcyB0aGUgb25lIHdoaWNoIGdpdmVzIHRoZSBwZXJtaXNzaW9uIHRvIG5vbi1DQVBfUEVSRk1P
Tg0KPiA+ID4gPiBhbmQgbm9uLUNBUF9TWVNfQURNSU4gdXNlcnMgdG8gYmUgYWJsZSB0byBkbyBw
cml2aWxpZ2VkIE9BIG9wZXJhdGlvbnMuDQo+ID4gPiANCj4gPiA+IHNvIGlmIEknbSBydW5uaW5n
IGEgcHJvY2VzcyB3aXRoIENBUF9QRVJGTU9OIGFuZCByZWFkDQo+ID4gPiBwZXJmX3N0cmVhbV9w
YXJhbm9pZCBhbmQgaXQgcmV0dXJucyAwDQo+ID4gDQo+ID4gMCBpZiBmaW5lLCBldmVyeW9uZSBj
YW4gdXNlIGFsbCBPQSBjYWxscy4gVGhlIGlzc3VlIGlzIHdpdGggMS4NCj4gPiANCj4gPiA+IHRo
ZXJlIGlzIG5vIHdheSBmb3IgVU1EIHRvIGtub3cNCj4gPiA+IHRoYXQgcHJvY2VzcyBpcyBhbGxv
d2VkIHRvIHVzZSBYZSBLTUQgT0EgZmVhdHVyZSB3aXRob3V0IGRvIGEgdUFQSSBjYWxsDQo+ID4g
PiB0aGF0IGNoZWNrcyBmb3IgQ0FQX1BFUkZNT04uDQo+ID4gPiANCj4gPiA+IFRoYXQgaXMgd2h5
IEkgdGhpbmsgaXMgYmV0dGVyIGp1c3QgZG8gYSBzaW5nbGUNCj4gPiA+IERSTV9YRV9QRVJGX09Q
X1JFTU9WRV9DT05GSUcgdG8gZGV0ZWN0IGlmIGZlYXR1cmUgaXMgcHJlc2VudCBhbmQgaWYNCj4g
PiA+IHByb2Nlc3MgaXMgYWxsb3dlZCB0byB1c2UgaXQuIEJ1dCBpdCBnZW5lcmF0ZXMgYSBidW5j
aCBvZiBkZWJ1ZyBtZXNzYWdlcy4NCj4gPiANCj4gPiBBIHByb2Nlc3Mgc2hvdWxkIGJlIGFibGUg
dG8gZmluZCBvdXQgb24gaXRzIG93biwgd2l0aG91dCBoZWxwIGZyb20gWGUNCj4gPiBkcml2ZXIs
IHdoYXQgaXQncyBjYXBhYmlsaXRpZXMgKENBUF9QRVJGTU9OIG9yIENBUF9TWVNfQURNSU4gb3Ig
bmVpdGhlcikNCj4gPiBhcmU6DQo+ID4gDQo+ID4gaHR0cHM6Ly93d3cuZ29vZ2xlLmNvbS9zZWFy
Y2g/cT1saW51eCtnZXQrcHJvY2VzcytjYXBhYmlsaXRpZXMraW4rYw0KPiA+IGh0dHBzOi8vbWFu
Ny5vcmcvbGludXgvbWFuLXBhZ2VzL21hbjMvbGliY2FwLjMuaHRtbA0KPiA+IA0KPiA+IEFuZCB0
aGVyZWZvcmUsIGFsb25nIHdpdGggcGVyZl9zdHJlYW1fcGFyYW5vaWQsIGRldGVybWluZSB3aGlj
aCBPQSBjYWxscyBpdA0KPiA+IGNhbiB1c2UuDQo+IA0KPiBBbHNvLCBjb3VsZCB5b3UgZXhwbGFp
biB3aHkgTWVzYSBoYXMgdG8gd29ycnkgYWJvdXQgdGhpcz8gQXMgSSBzZWUgaXQsIE1lc2ENCj4g
YXMgbGlicmFyeSBjYW4gYmUgbGlua2VkIHdpdGggcHJvY2Vzc2VzIG9mIGRpZmZlcmVudCBjYXBh
YmlsaXRpZXMuIEFuZA0KPiBkZXBlbmRpbmcgb24gcGVyZl9zdHJlYW1fcGFyYW5vaWQgc2V0dGlu
ZyBvbiBhIHN5c3RlbSwgc29tZSBPQSBjYWxscyBtaWdodA0KPiBvciBtaWdodCBub3QgYmUgYXZh
aWxhYmxlLCB0aGUga2VybmVsIHdpbGwgaGFuZGxlIGl0LiBTbyBub3Qgc3VyZSB3aGF0IE1lc2EN
Cj4gaGFzIHRvIGRvLCBleGNlcHQgcGFzcyB0aGUgcmV0dXJuIGNvZGUgZnJvbSB0aGUga2VybmVs
IHVwIHRvIHRoZSBhcHAuDQo+IA0KPiBTbyB3aGF0IGFyZSB3ZSB0cnlpbmcgdG8gZG8gaGVyZSBp
biBNZXNhPw0KDQpFdmVyeSBWdWxrYW4gb3IgT3BlbkdMIGFwcGxpY2F0aW9uIHdpbGwgY2FsbCBp
bnRlbF9wZXJmX2luaXRfbWV0cmljcygpLT5vYV9tZXRyaWNzX2F2YWlsYWJsZSgpIGR1cmluZyBp
bml0aWFsaXphdGlvbiwgdGhhdCB3aWxsIGNoZWNrIGlmIGFwcGxpY2F0aW9uDQpoYXMgT0EgcGVy
bWlzc2lvbnMgYW5kIHRlbGwgYXBwbGljYXRpb25zIGlmIGl0IHN1cHBvcnQgcGVyZm9ybWFuY2Ug
Y291bnRlciBjYXBhYmlsaXRpZXMgb2YgZWFjaCBncmFwaGljcyBBUEkuDQoNCmh0dHBzOi8vZ2l0
bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvLS9ibG9iL21haW4vc3JjL2ludGVsL3BlcmYv
aW50ZWxfcGVyZi5jP3JlZl90eXBlPWhlYWRzDQoNCmh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9w
Lm9yZy9tZXNhL21lc2EvLS9ibG9iL21haW4vc3JjL2ludGVsL3Z1bGthbi9hbnZfcGVyZi5jDQoN
Cmh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvLS9ibG9iL21haW4vc3Jj
L2dhbGxpdW0vZHJpdmVycy9pcmlzL2lyaXNfbW9uaXRvci5jDQoNCj4gDQo+IFRoYW5rcy4NCj4g
LS0NCj4gQXNodXRvc2gNCj4gDQo+ID4gPiA+ID4gPiBTbyBiYXNpY2FsbHkgSSB0aGluayB5b3Ug
anVzdCBuZWVkIHRvIGNoZWNrIGZvciB0aGUgcGVyZl9zdHJlYW1fcGFyYW5vaWQNCj4gPiA+ID4g
PiA+IGZpbGUgYWJvdmUuIEl0IHdpbGwgdGVsbCB5b3UgYm90aCAoYSkgaWYgT0EgaXMgcHJlc2Vu
dCAoYmVjYXVzZSB3ZSBhcmUNCj4gPiA+ID4gPiA+IGdvaW5nIHRvIG1lcmdlIHRoZSBjb2RlIHdo
aWNoIGNyZWF0ZXMgdGhpcyBmaWxlIHRvZ2V0aGVyIHdpdGggT0EpIGFuZCAoYikNCj4gPiA+ID4g
PiA+IGlmIHlvdSBuZWVkIHRvIGJlIHJvb3QgZm9yIHBhcnRpY3VsYXIgb3BlcmF0aW9ucy4NCj4g
PiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gVGhhbmtzLg0KPiA+ID4gPiA+ID4gLS0NCj4gPiA+ID4g
PiA+IEFzaHV0b3NoDQo+ID4gPiA+ID4gDQo+ID4gPiANCg0K
