Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B42FC44508
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 18:42:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30FAE10E0BD;
	Wed, 21 Jan 2026 18:42:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tj38QJrJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D3910E0BD
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jan 2026 18:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769020953; x=1800556953;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=tvBFJqzHdeQ+Tt01vrX0OnITHXWMIZoSBCzdjKaXPQY=;
 b=Tj38QJrJ5DOkckdz/WZuUv2izjVbecSf0dnAKjcFJJc22wqSMhEptxgZ
 Qb86pC2LmrkH8KiScSkSAit6V4Subh5yGsh4T2oJpk4sRzJuqjILUt13e
 1U51oww5yTrGT9jQbaWGVgKSvJUNMhyKWxz9s3WHUh0JOK5BFEeqdz0V6
 tRdncNi8t1UU6CdqI69njpGReNQdetHOFlp7V1iPfGtVXGppQn+RmZzIv
 PDi9yHSjlrid3Nw5HQ+ofs+17ot0EdHD4JctqT+KaDaRRzhZNTvvULX7X
 nfv/diM+KEPmYwzjCzR55uKcalNCeksojGUu8Go52weAKwoNbFPDhWeY0 Q==;
X-CSE-ConnectionGUID: PLQ1IFbdTs2zUT9Zy/Fn5w==
X-CSE-MsgGUID: fbGv0megRryUdoWuDJE+Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70168794"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="70168794"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 10:42:32 -0800
X-CSE-ConnectionGUID: KOC1phZ7SFSEm3s8CvTlCQ==
X-CSE-MsgGUID: E6pOFRkBT+WmhEZgadEDTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="206126967"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 10:42:31 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 10:42:31 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 21 Jan 2026 10:42:31 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.62) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 10:42:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+qoEBDGJLGZmSYVArg8hYCWa3RLPoO+61foAJtGkKuncRgjg6qT/OXAfZm1cdYoHk/mQJVL+aH+GopUo41UFzC2YPfd2doOySowfEFl8S8wCOGlb/Ahf/wGWskfCmfctrnp0Zc+9+9zSqD/tY3TcDeBkJ7ccj/svHLhoem3W3vmDyPtWmCmYoYtXap3OkEsmwzi7w2X4/ZLHcPFz2ZZjajgLe8GGtP6MFYYGsnViyCFnJ7pjOcvpD7Rj51o0ZlNIAPRs+HeowKf4mpNkckJy8HtAEBOWcU9FdkZFIIzdUXZj46LZO3bcqUOeRpzM8qUcNgw05ufnc/VZ8HUPz165A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvBFJqzHdeQ+Tt01vrX0OnITHXWMIZoSBCzdjKaXPQY=;
 b=rJOkLO4SUQBh7vkHkfqRDBNG+53a907U+eSVvOr9GejA65FC9zhRtVzyB1ggPyRAuZldXu9R4UhD8KobPsixw9s64G/hGx5g6qA37CMtfC2OfOQF4yB02+sZrqP6SbYX6Ei117BNHv1+z8F/Vp7wz0XKN3saqNa64fTv6xW0aJ7VPHJS3R9qgIxB8XnGu4M8AYl9zQTiDVRmuHcIx3yqfB4uO3Q8vRUkfNfJDnWUIrVHLpjSzKpx7HsBwnpllOxOsBNIbtkfAllQOMULjvj5E4xJ3NQt73s7BugpAoTs5upv1yarHl3/tia1eql/pwgEPX338oVrEeHBiUSm9AsACg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS4PPF990BCE628.namprd11.prod.outlook.com (2603:10b6:f:fc02::3d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 18:42:26 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 18:42:26 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Yadav, Arvind"
 <arvind.yadav@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Mishra, Pallavi" <pallavi.mishra@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 1/8] drm/xe/uapi: Add UAPI support for purgeable buffer
 objects
Thread-Topic: [PATCH v4 1/8] drm/xe/uapi: Add UAPI support for purgeable
 buffer objects
Thread-Index: AQHcijEqngyYBUcm6EO9rWpYzCfMOLVc9vsA
Date: Wed, 21 Jan 2026 18:42:26 +0000
Message-ID: <6c9ff4f6621f7617a58d5bd92a6ba77efa11037c.camel@intel.com>
References: <20260120060900.3137984-1-arvind.yadav@intel.com>
 <20260120060900.3137984-2-arvind.yadav@intel.com>
 <aW+5cVnfpNZNggeD@lstrano-desk.jf.intel.com>
In-Reply-To: <aW+5cVnfpNZNggeD@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR11MB8430:EE_|DS4PPF990BCE628:EE_
x-ms-office365-filtering-correlation-id: 2f934f37-2e38-4404-a1b3-08de591cd2ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?aWN3eGhrZStaOUFGREpjQmRPd3cxYU1MN1d0MThrL2ptdzF6cWxGSERnWlcz?=
 =?utf-8?B?MFdiRXplemx6SHJlZ3NQdHlnaVdJSktLVG4rREIzNDJPUFhQL2IxYy9SZzZV?=
 =?utf-8?B?QS9va2RkdlpIM1A5QlVhREdwSG54Vnh0NHdIUzl0ejBGV0FzTXVnQ2lObWJJ?=
 =?utf-8?B?bjJLVHNvWm1adGRhTEs1L0xPVVpJWkxsUGYwUkEvSmtzNFpDTDVDbWlCOTdK?=
 =?utf-8?B?MkZ6U3NqeGRZaDFrTFpxcHRRWm1BWnFiV0taWTJudHNSNUxoWEpIdTFEUURX?=
 =?utf-8?B?SVBxdXBMTW5HaXI5UjlnelZrMHFMQ29ubkRZYWxYVUU4SFpqc3pFdm5wSGhw?=
 =?utf-8?B?dC9YWmlBQnZNL0NRNmpyNFZTMEQrQzBuYjYvd2g1Y2gxVXRlL1gyY0wrVzNE?=
 =?utf-8?B?SHdmeXpQelRwcDNtTlhsTEhjK21SNkhYOENDZ2Z1MUc4ZkJXYktkQUJ3NkIr?=
 =?utf-8?B?ZnpSemlPWVRCek1YVUppSTFIR1pjZG0zNnpzNE5pb2lHd3BtSjA0YmlBM2k1?=
 =?utf-8?B?akU3Yno3SWh4MWxYeXRpTStyUGVmamZUTGh0VGx4dFlic0lncldDOG5NYU5Q?=
 =?utf-8?B?elI1V0R2SVByN1VQN2dPUHM1TGZIU3VXOEhHNkhhSXoxalQ0S2J5TjdkYzNS?=
 =?utf-8?B?NlZFK2VvMGFWZURXaEpGNlM4aHhTK1lMbjBqcFozVFVHd1JxR3VTZmc2b0FP?=
 =?utf-8?B?WTBrRU9uR3l3cFZsbnpzd2hReUdVYk1nSGR0d0pEOGtrNnU0YUNsaVhtOGFw?=
 =?utf-8?B?c0RCNkJXNnJSa0M5TmJQNFc3NXllOTA5WW5lN0FxSnppMUszc2xPTFlCQml1?=
 =?utf-8?B?djZJSWVZQXZ5eVJnNk5MMEhLYXgyOFlPYzBOMTdOUmQ3MFoyamhmSDlaU1dK?=
 =?utf-8?B?WXUvUlp6aGlFWmk5QTRwVzBtM0Ixa0t4VUtJQnh1bkN3eVdkeFVsaXpPQitz?=
 =?utf-8?B?cVEzSHIxQy8wZFlqOUFLQjZjK2x0MTlsSG9nUWZqaElvMWhxNkpRazIzS3hY?=
 =?utf-8?B?WitONWo1VFViTHJ4QlcvdVlHYlAvRGJxZWNyTjFDWFFmSDZ6ZzBqb2dqZ1ZN?=
 =?utf-8?B?Z2x1bVJnZzFxQ2RJMDNpcFBET2ZGbEZYcmZmTDdKZGFVWjZCYUpjOEFRTUlJ?=
 =?utf-8?B?WkpibEl5Wk5NbDBpLy9sYmR1S0RJRFpzeDNqUnhZWHJ2ZlcveUthUjJnOWg4?=
 =?utf-8?B?UTZZZVVKeGJHdEhSZ1J4MkNqbVNnck1rMDJ0d2NzeTBrOFhRamVOWDlDZm81?=
 =?utf-8?B?VzZOZXV3czhnaG0zSjhvTkNaTnNROG11bklDaFNYNXRrZnFoZzMwdWV2SzZ5?=
 =?utf-8?B?MCt0VGk1dUpPVVZzQzB1TmRnYkRhQUdkeFZ1RUFPdEdYeDc1WGVRYVBObFZz?=
 =?utf-8?B?UGh5Yi8vOWcvZGRZSU9oS1pkQ3NtM2txQXNKQ01OU2pIdThQeXFsSWVHL0tY?=
 =?utf-8?B?OWc0SGNtTFNscnFBT0NFa1lkVlhmcnJYbk0xVFQ5N3kwR0tpNkFtbmJaNjRr?=
 =?utf-8?B?UXY5QzFPK2VDQnNFTHZUdGRPNjlGTUIvK1BlWkNSUUl5SW9yRUxGZHAwa2hT?=
 =?utf-8?B?YisvY0U2RWloYmYvMnFpRTZzak9jd2tjZjJQUFUvTEdycjhSVWdaVkVGd3BP?=
 =?utf-8?B?T21Ua2lvN2lpWEtzSE8rdjhzdk9ndWxQYTFORU5aamY2aGxPRXIyMFhVNk52?=
 =?utf-8?B?T1ZBT0VmVUc5RkowZ1Y2R3EzUWE0U1JveXErK2xPR3l3UDA3d0duZ1NrVS9o?=
 =?utf-8?B?N0M1MUJrZytvU2pxdmhXNndtYjR5dEhNNzVwZXFKMXdJYXRLcXlOdDdqUEhh?=
 =?utf-8?B?WjYyUHF0SFFoQ0RoWi9sYnFsbmdVT1U0WDd3bC9TN3VQK2hUVVhobktldDM1?=
 =?utf-8?B?T1ZTWEZ6eEdmR3R4YzBmVVV6Zm9pdWlhMVpSb1VZTmZKOEdmdVROU1dCNWIr?=
 =?utf-8?B?b1dGbXQwOERYTVgybk9BZXRNdEFPejRsRHdCUHdNMlJwZWgva3NIU0ptSFcx?=
 =?utf-8?B?YUQ2dlVkbHY4WmNxS2pyaWVNRE9ZenZTRkgydXFEOGxRZnljSlBIYndFUk5k?=
 =?utf-8?B?SjFTZUhKWk9lSmdpM2ZkMEcrMExTNm5BdUo1UXhLTDAvY0oxV3daRXJWL2Jl?=
 =?utf-8?B?eHVQUDVZWnFGcjk3ZzhYbXhZZHBRd3ZFbjdFY0VvdmxBdGFJMXFkVGM0b2s1?=
 =?utf-8?Q?JLBKrS/OpeZiZGyB3vSfgcQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NkZOZnpVbmlkdit5N3lCd0ZlcHhvQXJJTEtNNEtteUtvcHhkcGlwRmtQMVRz?=
 =?utf-8?B?eDNZQ3ZWZEJZUFBZdWVHZU5BYy9lVk9qbzlhTnpMUEJCbHEraUpCQ094eE9L?=
 =?utf-8?B?a0VGNGMyc1lkUVlZZ1AzdGlQRFAvYXBPNHNTUFNXK1JtZGdUdmRnbEVEQzhR?=
 =?utf-8?B?TUR5cHZlcmZGZXdxSzVkd0N0dGN5Y2dnTGdGOFNpUFRtUk52cEgrWGhxM0ls?=
 =?utf-8?B?dGRiRm1XRUoxNngvT1JHSDdLTFdHOTRCakpiRjNDNTkzcGNiNVF1dS9jNVh6?=
 =?utf-8?B?OUJzMHV1K0k3VDYzU1p4T1ljT2tKQk1nbnBZcTdwbnFucDJJdGNVcnE1REVC?=
 =?utf-8?B?dGtwOEVKMnAzTXVqbE1lc253N0RMOGdSUU5abXFqWkY2d1dWQXp5dHBBTCtu?=
 =?utf-8?B?WjA1Y0xWOU1idXVaSU5hYUgwcHc1M2tpTEEyeUV5eEthT1ZXdGlJWHNSR3pl?=
 =?utf-8?B?QUlkT2NCS1BVL0l4ZDljd0FSZWlzUjQ3eVVrTlZQYmVLZ0hkdys5emxXV2Iy?=
 =?utf-8?B?cURZc2tycWxZakx2QTVMYW1wVnpYUmZZNU9qVFRZN2F4andodE9nYWlPNUNX?=
 =?utf-8?B?bENDVE5sWFVlV1NsSUVKNkdHczVWb0xDc3BxMmFaMXh1K1FKaTl3Y0JCQ3Q3?=
 =?utf-8?B?ME5hSXo0YXRUUU5wVnNpRDBNdmpISVdoQnF4cnhTU2M5Yk5xSzZQalpMdTUx?=
 =?utf-8?B?ZGpjNVYyTlJEZGFnMUJ1c3NiSHZvaGxFN0hyNVFMZU4vOUFuVTQrWGpKWWpa?=
 =?utf-8?B?MUtaQWlOdVcyd3VGQUVQcDdGNHF1OEtoN1JFcnBmTWZBSFJkTGVKTmhwVnBZ?=
 =?utf-8?B?WG81TTdFa21ocEZQR3d4ZEJJVFowcGpwbTRxUTBMdllYWDZKR3FJRGhJOXBF?=
 =?utf-8?B?dUxsQlEwSk1PdGQ3MXVqdzRJMVY0V3BEd09ESjRxZ050aDlMNFh3VllyaUJ2?=
 =?utf-8?B?a3RQekZkZTlVWkQ0eElZamtWZDhPWjFLREFwTkV3czJCQktnMFVTMkEydk9j?=
 =?utf-8?B?WmhqS0JmMXg5K0JXbGFva2phdU1qckMvMnN1VVFFYWM3S1MxWXlSam1pUzho?=
 =?utf-8?B?MnpsWnRmakFDeVFla3QvTFNqWlJqT0hmemFmaTRnWEYvWmQ2Nk0zNVJnbW55?=
 =?utf-8?B?MnA4d2x5NTJxdVVNR0h1anpWcjdKLzBhZGZlRzRSRGd5eDV2YjIvcUllSnpL?=
 =?utf-8?B?UllqVU9XVFQ1MkpiVWhWV3NaU1MrbU5QODR3Zk9lNklrYzhzQXh0dlFoZXBm?=
 =?utf-8?B?NWNQTDBvdUtSU0l5MEtXNFdvRlIrcUZ5MmZ4SnJRb2kwaGhadXllTDRFbnlz?=
 =?utf-8?B?cmRDb0gyRnA4d1UwVUkza1JIQ2xVV1VDM2lDVW0xT2h2allKZTF2VnNtTjVT?=
 =?utf-8?B?RE9CcG9XSklGaGxrcndiM0ZqKzUveTFmb2hNaEhGNy94ZExqTnl3MG56MlhW?=
 =?utf-8?B?UkM5QlVoeXRJbjh2UWExWVFEbkkyMkxVbU5Pa2VUZGJxVzBiMFI1Q0ZhNXRy?=
 =?utf-8?B?RS81VDErZnNuOUpuaHErdjFEOHFwNkRKYXlZQ25wY2pBeVRlNlo2T21Idk5y?=
 =?utf-8?B?SFdwclpOZTNkSm56T0JyaklFeUhaUXAxS3htNFAxcXlYTmtEWDNvWWlucjFZ?=
 =?utf-8?B?YWVKMHZzN1E3aEt3Mjc1ZGtkQnNmV3IwSnRaQTVMQ1RjcVUzTDdaWmdFbW92?=
 =?utf-8?B?WUhuY0NBbzRhbDViL0w5VmV2NS9ocHMvVzRoVy9wMGQ1MFB4N2pJN0tzZDJh?=
 =?utf-8?B?eGRiZTNJT0p3eUFmdk9MY0R5dWFLdlZlV3hlQWVGY01uSlhrcmJpeEVVb3B6?=
 =?utf-8?B?NWFiaEVETzh3S295RDZiUjMvdGhUYThEY3VZczVYbVJSbkFpYkY2WVpiNllU?=
 =?utf-8?B?OVZ3d0pzcmdUUHp2ejlwTEJNT3k3VjB1WTRxcmhUVm1zM0VybUltdjVvb3Y0?=
 =?utf-8?B?cWtjN1NuZ1ltVjFvOGsyakZMWXlsQ255Z0lNTDNLQ1hXbURYZ2VmOU1ReEt1?=
 =?utf-8?B?YklUWHdmWXFncnhtZnM5c1ZIdlE1UWxmTkg2bmVJb2YxczBES2xadndudmFZ?=
 =?utf-8?B?ZWRRVkpOWmhrREd6bTd5TDZQUzFuQVBWai81eWp6UElqMmgrQ2x0bVpZOERT?=
 =?utf-8?B?V05Yc0FCb1YrTkdXSGRGOHlLd0EyL1VJNWc3TnFFTmlOK2dSd2l6a2tMait5?=
 =?utf-8?B?b2FlTjBjenplbFFHT0tEcjdrVnBMd29RbGh1a3dYVmlFVG16bjJLWHN6T2RZ?=
 =?utf-8?B?YTRVSlZxaWx6SXpudGtrbDBFMXNPUlpZclVQUCtWYTdqOXhHc3M3WkJwNDJm?=
 =?utf-8?B?SU15Z0toUmkxUUdnbTg5cExpZTRPYUFLdGRBVSttUDM5Vld3VU9hb1p6YWRm?=
 =?utf-8?Q?YIRHBwuaU/qU59G8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F16446389DADA749BA798EA2A11905BD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f934f37-2e38-4404-a1b3-08de591cd2ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 18:42:26.1317 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LhnMw/kuCffzlfIjoSRy1zlo6hsv+LLl+EfoiRZfwc5MvgnvtJnXwDuNI6YjJNG06jrX1MabhXX/yvNZxAzX3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF990BCE628
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

T24gVHVlLCAyMDI2LTAxLTIwIGF0IDA5OjIwIC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBUdWUsIEphbiAyMCwgMjAyNiBhdCAxMTozODo0N0FNICswNTMwLCBBcnZpbmQgWWFkYXYg
d3JvdGU6DQo+ID4gRnJvbTogSGltYWwgUHJhc2FkIEdoaW1pcmF5IDxoaW1hbC5wcmFzYWQuZ2hp
bWlyYXlAaW50ZWwuY29tPg0KPiA+IA0KPiA+IEV4dGVuZCB0aGUgRFJNX1hFX01BRFZJU0UgaW9j
dGwgdG8gc3VwcG9ydCBwdXJnZWFibGUgYnVmZmVyIG9iamVjdA0KPiA+IG1hbmFnZW1lbnQgYnkg
YWRkaW5nIERSTV9YRV9WTUFfQVRUUl9QVVJHRUFCTEVfU1RBVEUgYXR0cmlidXRlDQo+ID4gdHlw
ZS4NCj4gPiANCj4gPiBUaGlzIGFsbG93cyB1c2Vyc3BhY2UgYXBwbGljYXRpb25zIHRvIHByb3Zp
ZGUgbWVtb3J5IHVzYWdlIGhpbnRzIHRvDQo+ID4gdGhlIGtlcm5lbCBmb3IgYmV0dGVyIG1lbW9y
eSBtYW5hZ2VtZW50IHVuZGVyIHByZXNzdXJlOg0KPiA+IA0KPiA+IFRoaXMgYWxsb3dzIHVzZXJz
cGFjZSBhcHBsaWNhdGlvbnMgdG8gcHJvdmlkZSBtZW1vcnkgdXNhZ2UgaGludHMgdG8NCj4gPiB0
aGUga2VybmVsIGZvciBiZXR0ZXIgbWVtb3J5IG1hbmFnZW1lbnQgdW5kZXIgcHJlc3N1cmU6DQo+
ID4gDQo+ID4gLSBXSUxMTkVFRDogQnVmZmVyIGlzIG5lZWRlZCBhbmQgc2hvdWxkIG5vdCBiZSBw
dXJnZWQuIElmIHRoZSBCTw0KPiA+IHdhcw0KPiA+IMKgIHByZXZpb3VzbHkgcHVyZ2VkLCByZXRh
aW5lZCBmaWVsZCByZXR1cm5zIDAgaW5kaWNhdGluZyBiYWNraW5nDQo+ID4gc3RvcmUNCj4gPiDC
oCB3YXMgbG9zdCAob25jZSBwdXJnZWQsIGFsd2F5cyBwdXJnZWQgc2VtYW50aWNzIG1hdGNoaW5n
IGk5MTUpLg0KPiA+IA0KPiA+IC0gRE9OVE5FRUQ6IEJ1ZmZlciBpcyBub3QgY3VycmVudGx5IG5l
ZWRlZCBhbmQgbWF5IGJlIHB1cmdlZCBieSB0aGUNCj4gPiDCoCBrZXJuZWwgdW5kZXIgbWVtb3J5
IHByZXNzdXJlIHRvIGZyZWUgcmVzb3VyY2VzLiBPbmx5IGFwcGxpZXMgdG8NCj4gPiDCoCBub24t
c2hhcmVkIEJPcy4NCj4gPiANCj4gPiBUaGUgaW1wbGVtZW50YXRpb24gaW5jbHVkZXMgYSAncmV0
YWluZWQnIG91dHB1dCBmaWVsZCAobWF0Y2hpbmcNCj4gPiBpOTE1J3MNCj4gPiBkcm1faTkxNV9n
ZW1fbWFkdmlzZS5yZXRhaW5lZCkgdGhhdCBpbmRpY2F0ZXMgd2hldGhlciB0aGUgQk8ncw0KPiA+
IGJhY2tpbmcNCj4gPiBzdG9yZSBzdGlsbCBleGlzdHMgKDEpIG9yIGhhcyBiZWVuIHB1cmdlZCAo
MCkuDQo+ID4gDQo+ID4gdjI6DQo+ID4gwqAgLSBBZGQgUFVSR0VEIHN0YXRlIGZvciByZWFkLW9u
bHkgc3RhdHVzLCBjaGFuZ2UgaW9jdGwgdG8NCj4gPiBEUk1fSU9XUiwNCj4gPiDCoMKgwqAgYWRk
IHJldGFpbmVkIGZpZWxkIGZvciBpOTE1IGNvbXBhdGliaWxpdHkNCj4gPiANCj4gPiB2MzoNCj4g
PiDCoCAtIFVBUEkgcnVsZSBzaG91bGQgbm90IGJlIGNoYW5nZWQgKE1hdHRoZXcgQnJvc3QpDQo+
ID4gwqAgLSBNYWtlICdyZXRhaW5lZCcgYSB1c2VycHRyIChNYXR0aGV3IEJyb3N0KQ0KPiA+IA0K
PiA+IHY0Og0KPiA+IMKgIC0gWW91IGNhbm5vdCBtYWtlIHRoaXMgcGFydCBvZiB0aGUgdW5pb24g
KHB1cmdlX3N0YXRlX3ZhbCkgbGFyZ2VyDQo+ID4gwqDCoMKgIHRoYW4gdGhlIGV4aXN0aW5nIHVu
aW9uICgxNiBieXRlcykuIFNvIGp1c3QgZHJvcCB0aGUgJ19fdTY0DQo+ID4gcmVzZXJ2ZWQnDQo+
ID4gwqDCoMKgIGZpZWxkLiAoTWF0dCkNCj4gPiANCj4gPiBDYzogTWF0dGhldyBCcm9zdCA8bWF0
dGhldy5icm9zdEBpbnRlbC5jb20+DQo+ID4gQ2M6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMu
aGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBIaW1hbCBQcmFz
YWQgR2hpbWlyYXkNCj4gPiA8aGltYWwucHJhc2FkLmdoaW1pcmF5QGludGVsLmNvbT4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBBcnZpbmQgWWFkYXYgPGFydmluZC55YWRhdkBpbnRlbC5jb20+DQo+ID4g
LS0tDQo+ID4gwqBpbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oIHwgMzcNCj4gPiArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMzcgaW5z
ZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2Ry
bS5oIGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiA+IGluZGV4IDA3N2U2NmE2ODJlMi4u
N2IzOTAxZTRiODVlIDEwMDY0NA0KPiA+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgN
Cj4gPiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+ID4gQEAgLTIwOTksNiArMjA5
OSw3IEBAIHN0cnVjdCBkcm1feGVfbWFkdmlzZSB7DQo+ID4gwqAjZGVmaW5lIERSTV9YRV9NRU1f
UkFOR0VfQVRUUl9QUkVGRVJSRURfTE9DCTANCj4gPiDCoCNkZWZpbmUgRFJNX1hFX01FTV9SQU5H
RV9BVFRSX0FUT01JQwkJMQ0KPiA+IMKgI2RlZmluZSBEUk1fWEVfTUVNX1JBTkdFX0FUVFJfUEFU
CQkyDQo+ID4gKyNkZWZpbmUgRFJNX1hFX1ZNQV9BVFRSX1BVUkdFQUJMRV9TVEFURQkJMw0KPiA+
IMKgCS8qKiBAdHlwZTogdHlwZSBvZiBhdHRyaWJ1dGUgKi8NCj4gPiDCoAlfX3UzMiB0eXBlOw0K
PiA+IMKgDQo+ID4gQEAgLTIxODksNiArMjE5MCw0MiBAQCBzdHJ1Y3QgZHJtX3hlX21hZHZpc2Ug
ew0KPiA+IMKgCQkJLyoqIEBwYXRfaW5kZXgucmVzZXJ2ZWQ6IFJlc2VydmVkICovDQo+ID4gwqAJ
CQlfX3U2NCByZXNlcnZlZDsNCj4gPiDCoAkJfSBwYXRfaW5kZXg7DQo+ID4gKw0KPiA+ICsJCS8q
Kg0KPiA+ICsJCSAqIEBwdXJnZV9zdGF0ZV92YWw6IFB1cmdlYWJsZSBzdGF0ZSBjb25maWd1cmF0
aW9uDQo+ID4gKwkJICoNCj4gPiArCQkgKiBVc2VkIHdoZW4gQHR5cGUgPT0NCj4gPiBEUk1fWEVf
Vk1BX0FUVFJfUFVSR0VBQkxFX1NUQVRFLg0KPiA+ICsJCSAqDQo+ID4gKwkJICogQ29uZmlndXJl
cyB0aGUgcHVyZ2VhYmxlIHN0YXRlIG9mIGJ1ZmZlcg0KPiA+IG9iamVjdHMgaW4gdGhlIHNwZWNp
ZmllZA0KPiA+ICsJCSAqIHZpcnR1YWwgYWRkcmVzcyByYW5nZS4gVGhpcyBhbGxvd3MgYXBwbGlj
YXRpb25zDQo+ID4gdG8gaGludCB0byB0aGUga2VybmVsDQo+ID4gKwkJICogYWJvdXQgYm8ncyB1
c2FnZSBwYXR0ZXJucyBmb3IgYmV0dGVyIG1lbW9yeQ0KPiA+IG1hbmFnZW1lbnQuDQo+ID4gKwkJ
ICoNCj4gPiArCQkgKiBTdXBwb3J0ZWQgdmFsdWVzIGZvciBAcHVyZ2Vfc3RhdGVfdmFsLnZhbDoN
Cj4gPiArCQkgKsKgIC0gRFJNX1hFX1ZNQV9QVVJHRUFCTEVfU1RBVEVfV0lMTE5FRUQgKDApOg0K
PiA+IE1hcmtzIEJPIGFzIG5lZWRlZC4NCj4gPiArCQkgKsKgwqDCoCBJZiBCTyB3YXMgcHVyZ2Vk
LCByZXR1cm5zIHJldGFpbmVkPTANCj4gPiAoYmFja2luZyBzdG9yZSBsb3N0KS4NCj4gPiArCQkg
Kg0KPiA+ICsJCSAqwqAgLSBEUk1fWEVfVk1BX1BVUkdFQUJMRV9TVEFURV9ET05UTkVFRCAoMSk6
DQo+ID4gSGludHMgdGhhdCBCTyBpcyBub3QNCj4gPiArCQkgKsKgwqDCoCBjdXJyZW50bHkgbmVl
ZGVkLiBLZXJuZWwgbWF5IHB1cmdlIGl0IHVuZGVyDQo+ID4gbWVtb3J5IHByZXNzdXJlLg0KPiA+
ICsJCSAqwqDCoMKgIE9ubHkgYXBwbGllcyB0byBub24tc2hhcmVkIEJPcy4gUmV0dXJucw0KPiA+
IHJldGFpbmVkPTEgaWYgbm90IHB1cmdlZC4NCj4gPiArCQkgKi8NCj4gPiArCQlzdHJ1Y3Qgew0K
PiA+ICsjZGVmaW5lIERSTV9YRV9WTUFfUFVSR0VBQkxFX1NUQVRFX1dJTExORUVECTANCj4gPiAr
I2RlZmluZSBEUk1fWEVfVk1BX1BVUkdFQUJMRV9TVEFURV9ET05UTkVFRAkxDQo+ID4gKwkJCS8q
KiBAcHVyZ2Vfc3RhdGVfdmFsLnZhbDogdmFsdWUgZm9yDQo+ID4gRFJNX1hFX1ZNQV9BVFRSX1BV
UkdFQUJMRV9TVEFURSAqLw0KPiA+ICsJCQlfX3UzMiB2YWw7DQo+ID4gKw0KPiA+ICsJCQkvKiBA
cHVyZ2Vfc3RhdGVfdmFsLnBhZCAqLw0KPiA+ICsJCQlfX3UzMiBwYWQ7DQo+ID4gKwkJCS8qKg0K
PiA+ICsJCQkgKiBAcHVyZ2Vfc3RhdGVfdmFsLnJldGFpbmVkOiBQb2ludGVyIHRvDQo+ID4gb3V0
cHV0IGZpZWxkIGZvciBiYWNraW5nDQo+ID4gKwkJCSAqIHN0b3JlIHN0YXR1cy4NCj4gPiArCQkJ
ICoNCj4gPiArCQkJICogVXNlcnNwYWNlIHByb3ZpZGVzIGEgcG9pbnRlciB0byB1MzIuDQo+ID4g
S2VybmVsIHdyaXRlcyB0byBpdDoNCj4gPiArCQkJICogMSBpZiBiYWNraW5nIHN0b3JlIGV4aXN0
cywgMCBpZiBwdXJnZWQuDQo+ID4gKwkJCSAqIFNpbWlsYXIgdG8gaTkxNSdzDQo+ID4gZHJtX2k5
MTVfZ2VtX21hZHZpc2UucmV0YWluZWQgZmllbGQuDQo+ID4gKwkJCSAqLw0KPiA+ICsJCQlfX3U2
NCByZXRhaW5lZDsNCj4gDQo+IEBSb2RyaWdvICsgQFRob21hcy4NCj4gDQo+IEhlcmUgd2UgYXJl
IGFkZGluZyBhIHVzZXJwdHIgZm9yIGNvcHlpbmcgdGhlIHJlc3VsdCBiYWNrIHRvIHVzZXJzcGFj
ZQ0KPiBiZWNhdXNlIHRoZSBleGlzdGluZyBtYWR2aXNlIElPQ1RMIGlzIElPVy4gSWYgd2UgY291
bGQgY2hhbmdlIHRoaXMNCj4gSU9DVEwNCj4gdG8gSU9XUiwgd2UgY291bGQgbGV0IERSTSBoYW5k
bGUgdGhpcyBmb3IgdXMuIEknbSBub3Qgc3VyZSB3aGV0aGVyDQo+IGNoYW5naW5nIGFuIElPQ1RM
IGZyb20gSU9XIHRvIElPV1IgaXMgYWxsb3dlZC4gTXkgdW5kZXJzdGFuZGluZyBpcw0KPiB0aGF0
DQo+IHRoZSBpb2N0bCBlbmNvZGluZyBpcyBiYXNpY2FsbHkgdGhlIHNhbWUgYXNpZGUgZnJvbSBz
b21lIGNvbnRyb2wNCj4gYml0cywNCj4gc28gc3dpdGNoaW5nIGZyb20gSU9XIOKGkiBJT1dSIHNo
b3VsZG7igJl0IGJyZWFrIGFueXRoaW5nLCBidXQgSSdtDQo+IHVuY2xlYXINCj4gb24gdGhlIHJ1
bGVzLiANCg0KSSdtIG5vdCBzbyBjb25maWRlbnQgaXQgd291bGRuJ3QgYnJlYWsgYW55dGhpbmcg
YXMgSSdtIHdvbmRlcmluZyBpZg0KdGhpcyBnZXRzIGludG8gdGhlIGZpbmFsIG51bWJlciBjb25z
dHJ1Y3Rpb24uLi4gYW5kIG9sZCB1c2Vyc3BhY2Ugd2l0aA0KbmV3IGtlcm5lbCB3b3VsZCBoaXQg
YSBkaWZmZXJlbnQgc2xvdC4NCg0KPiANCj4gV2hhdCBkbyB5b3UgdHdvIHRoaW5rPw0KDQpQZXJo
YXBzIHdlIHdvdWxkIG5lZWQgYSBuZXcgaW9jdGwgYW5kIGRlcHJlY2F0ZSB0aGlzIHdpdGggdGlt
ZT8NCg0KPiANCj4gTWF0dA0KPiANCj4gPiArCQl9IHB1cmdlX3N0YXRlX3ZhbDsNCj4gPiDCoAl9
Ow0KPiA+IMKgDQo+ID4gwqAJLyoqIEByZXNlcnZlZDogUmVzZXJ2ZWQgKi8NCj4gPiAtLSANCj4g
PiAyLjQzLjANCj4gPiANCg==
