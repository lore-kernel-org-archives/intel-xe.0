Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A9DC0219D
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 11:07:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E75E10EA58;
	Thu, 13 Feb 2025 11:07:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TK7cfivy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8923C10EA55;
 Thu, 13 Feb 2025 11:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739444877; x=1770980877;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mkP9Q9ck76Yuf7qdO/WLqY6OREqkggxKB/ojuGJ1/WM=;
 b=TK7cfivyXJMPDH7l+cjF3679pf8qR+qdK3Lowbw9BZpY980fyupRM9JR
 6UvRWDu4NBrP6ckEzC25GuT21QenxHMcZNTWLfX5Nnub2n7pe5x3KX7Jx
 3mAghikI9TKbxknU1YkZ/ZwgvhnDuHMGoSsrjxml4PfIFioenRGqtfGZ6
 d+uIetWmeYrVrio5uBFvPtF7d3inHWEjJkAVjiqc031ECfsJo7L4n04Vk
 D+i253/o9EBKlUUrwGNI7fN2gZ38MgeZkrFKpLskt9aWc5o9+UXqUhQJg
 N2t0Vi9s1bTIFX68DfpVvKzUOVaBsDu5eVRAoWP+t0DOP30ff4ZyCIkK9 w==;
X-CSE-ConnectionGUID: wWlGi3saQ36rlrIIAVLM4Q==
X-CSE-MsgGUID: QieD9zQPQl6ymoD7UeZ2Mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="44070741"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="44070741"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 03:07:57 -0800
X-CSE-ConnectionGUID: r4NgZte6T1yVAlCR5u8Tmg==
X-CSE-MsgGUID: 5e27F5crR6iXz9qpYIFmRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114012844"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 03:07:57 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 13 Feb 2025 03:07:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Feb 2025 03:07:56 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 03:07:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a11HsDWT6BEwG1dNujQbcM7Fr5+NVGtY24f1LGQMUxMXhvxB+uZ+kh3MXPV54ID2oDXaLlmmNQaXVqsGfLORKXWAJz03euW2wBmeJ586Xz2YG+dFalp6+P0e5juwpQhK6TFHzhE0YCwCgzO5AHsJ+DfqdkcTDrihJKkQLgsKsvVEVxSDiCxM1sH3iAmPAJxaby2ifQNT+czhYtZBlmvu7GL+noqYn8enFa9fGgF7uV/tSFlp3c2OUonhNn9XY165RnvvPspdUox8UVq8Rl9pNepUl9Bxkyh2h1EdqnyEznk4cTcK0FZnHmUpo7vLW3IbPVt5o2VcClNQkLsK9Yw9fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mkP9Q9ck76Yuf7qdO/WLqY6OREqkggxKB/ojuGJ1/WM=;
 b=vPEGzG2WCwdMBBTpL6TwrZJVVJQP7UlQzAsZ5CKnTaeTYJTse+iqHSPec+8R7cplr9NvrDMNGkzylwKJVWe0vIYP5wK7Y/cDI0Uy9cnSdcZhg5Pv8t/WKD3Nsfdqk8fTZM3DsQSguLu2RiofPrT0y653N/ooSWcSxn7a2zrTaXMKwI2rOpSE3ISz2t3HuEGZTrgwnFqy74d6gRdBWZtWCaUUNUzWQeubFhqYG+4wGVjmfXQQlyK/+r98+jIIS/nhl38nSps3EXl2VzHetKXdiyqUrS7IBV7BJu3rw0qUpbIphbt5Muecwxoij0sQROzMf8l4udiuJOU4cWxii4O9qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by PH7PR11MB7552.namprd11.prod.outlook.com (2603:10b6:510:26a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 11:07:13 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a%6]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 11:07:13 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org" <i915-ci-infra@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBYZS5DSS5CQVQ6IGZhaWx1cmUgZm9yIEltcHJvdmUgdHlwZS1z?=
 =?utf-8?B?YWZldHkgb24gUE9XRVJfRE9NQUlOXyooKSBtYWNyb3M=?=
Thread-Topic: =?utf-8?B?4pyXIFhlLkNJLkJBVDogZmFpbHVyZSBmb3IgSW1wcm92ZSB0eXBlLXNhZmV0?=
 =?utf-8?B?eSBvbiBQT1dFUl9ET01BSU5fKigpIG1hY3Jvcw==?=
Thread-Index: AQHbfW+ZVh3VSEXdp0af1WHJeViQf7NFE29A
Date: Thu, 13 Feb 2025 11:07:13 +0000
Message-ID: <CH0PR11MB54918F2484C5E454A05DD5B0EFFF2@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20250212132658.323640-1-gustavo.sousa@intel.com>
 <173937676007.1347988.12791820742293922574@b555e5b46a47>
 <173937954545.145254.15387044598135714895@intel.com>
In-Reply-To: <173937954545.145254.15387044598135714895@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|PH7PR11MB7552:EE_
x-ms-office365-filtering-correlation-id: c32035b2-3ee1-4312-c396-08dd4c1e91cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|366016|1800799024|13003099007|38070700018|7053199007;
x-microsoft-antispam-message-info: =?utf-8?B?ZlMvMmNoaGRxbjVOT2xmZXlQMXpaejU5S1FOcW1HRExOZEd1Y051UkhyV3Yr?=
 =?utf-8?B?NHdUT3ZpVWxPQTB4VzAyeGJUYWxIWHhLczBqekNnWXoybER4SFE1cDNRTlFm?=
 =?utf-8?B?M1Q3Tk5sNWo4eGpXK2hsQVdxU2pwN2M0OXZwRHFCMDRqMEd2WjFxSEtVUE14?=
 =?utf-8?B?bE5FQS9leDljbjllTzduOGFSRTNlU2dtVnBFRU80dzNyUkZLVDJnaE44OGFs?=
 =?utf-8?B?b2Q5cU9KODRUb01XYys2d0RCTVJrS1V3elNhcjN6L25EeGFjcWZsSHdYd2ZU?=
 =?utf-8?B?LzJwaGs0eTg4Z2ZUTGNIN2cxZjh3akhIS2lnM1ZObXBZTE1iSUVCN2VXVG80?=
 =?utf-8?B?YW4vV242REx4OE91b20ycDJSalBDU3pDeTRVOHMyTlRjU0Y0dXFGWFF3Ym1O?=
 =?utf-8?B?djI4ZjBZc0JHZjVaWUF3aFdmOFRCeWZxRzExUkJSYTIrVjBlS1RJL0tEQlgx?=
 =?utf-8?B?b0ZWekFGZXhEUGtKNzRWUkZYdUY0c1E1Y2x1dGtmUVBDaFUrMEhJNVM3amN6?=
 =?utf-8?B?Rmhnb0NZUU56TExQd21qVDNCZThFRnVvblpVQ3dXclRER0JwV29wVVdJcUFG?=
 =?utf-8?B?VUs4NXJ6V2FMdGhZck9Ja1ZsUEJKN1NPMWdXUHdqeFNZbWh4SngvR2ZDQkFv?=
 =?utf-8?B?bDU2ZHBodW0rZ052dkp1bUQ5LzV1MWRocmxwUncvRmEzek1INFR3KzF2RGY0?=
 =?utf-8?B?Z3N4OHlxOCtyWVFvZkRLTUJjYTJ5aGhnbysrVlNzSEZHc0pjMHhxamlQUVNZ?=
 =?utf-8?B?eDNYbFJSOWtNWkpSZjNzY09xY0pVdFpzNjRGcy9CdzIvYkIzSlU1Z3JGejlr?=
 =?utf-8?B?WVZDekwzU29sSlZ3V0I1dmNIU2JObzZZdXBkRzZCUEIvWno1MGtLWS9CV0ZO?=
 =?utf-8?B?TUNUV0RRTStxeTUvYmg1ajFsck9od0VoY1FZR1BxVlN2dnA5OUJnZFNZeWpl?=
 =?utf-8?B?NHAybm5yemttSXEwN1AzYUlnOHMzeGFQSUVEbEs5bllxTFd6aFNUN1JTT0VD?=
 =?utf-8?B?Z3hHUnd3MWIvTWdNTjJNRmFZb0RVbnFzMjZQc1VUUVpYblFZeGRvbHlISENW?=
 =?utf-8?B?TjladUJSQWNDQUl4c3BZcnBKSkNndlIyQTZsVFJVLzJJejE2cWpIUVhWRWtF?=
 =?utf-8?B?elkrTE9US3BiLy9FcmRHZU9BRlhjaHcvclBWQUs2Q1gyeFRkMnpKMHV4TFMr?=
 =?utf-8?B?Mnkxdko3eHdLU0lYemhvMVpOQ043aWE0cTRvckNoODQ5RnAwR2tBZU9EZDdp?=
 =?utf-8?B?Rk8xdEhqUTJpUmplVXl5TUxqRG45UkZmVW0xZ0xia1BscE0xYlRRcFBleHpw?=
 =?utf-8?B?Z0JuaENCRE9rYjVBRkVHMElPR1REa1dFZ2w0MCtCOUhwTlg2US9CbTdPZjNG?=
 =?utf-8?B?dGhSSEdTU3lzK1U0am9zQU8rRS9CaUJMcmJWQ3lsQlNmL2s2WjlZZmNHM2FL?=
 =?utf-8?B?andUM3JpV3NITVJ2dHF2ekNpVHFDYmJsRzFpZ214MVBMRGhIWTNLRGhqa2tJ?=
 =?utf-8?B?U2xhRUFSTnJIbDFEM3hBZWpDd0x4MjdDWGRhZEFkNzcvZkNmeGZJQmEyMmpw?=
 =?utf-8?B?VDhiSnBOSkJDVzVYMFNaZGFLQllGbi8vT2dXMTk5eDBmaHVtMXZVS0dmWExS?=
 =?utf-8?B?Y1hFZVUwRnRsTmhlOWNEeDJjUE5PUmxlL1dHT0hMVlJVL1J1Z3Q0bWk4eHZK?=
 =?utf-8?B?UnNLUWFlZFozVFpPM3ZOMXFwQ0F4OHM2Zkl3MVFMY1JmWE1uZ0FPcXZiV1pU?=
 =?utf-8?B?bUNTcGNFZ0dsc0Noa3VjUWhIRk9RbzNqVXFVN055bk1vODJMc0NoVTRhRjVE?=
 =?utf-8?B?TWRaV3dhaFJUZ1VobGJOSXd2VWU1ZmpzTE55a0RwcE1lQ3A3eENxSWxJZE00?=
 =?utf-8?B?V0o1a091cGJFQkJ1NzlGa2tWT2VCajZuRVBzTjcrRXBlNVE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(13003099007)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VmZKeXhCdnEvRjRTZjFsb0prZlU0eUc4eW5lQ0czNzgzeHU3QlEzS0lqaUda?=
 =?utf-8?B?elo4bFRKc2hnT0lmTHJXSUFXdzR4dGRzZmRGYjJWenNtYmZ2SnhUa2l5T3M1?=
 =?utf-8?B?Qm5pRXZ1dWRsbVRYSDJxbmRCZDdBYUpuUXl6YnExVHI5M1BjTWhyUmhRd3lD?=
 =?utf-8?B?clVlWWt6dzZIYWxwSzBxaXo4MFVmeExGN0JzTUtGckZpUGRrQm5oeHJWdWs5?=
 =?utf-8?B?SlJNY2lTMVBiQlRCU2E3T1duZ0pPSkx1Y1B1UUpQdjBqalhVWFovMEV5MXp3?=
 =?utf-8?B?VzNMVnFRbW1odUZvdDFHSHZCVys1VXU4T3AreGk2d2o2a1RaSWFUVW42dXp5?=
 =?utf-8?B?UjRRMnQ5UjYyS216M0k2Wjdwajdyak1nTCt0VFVDdVpQeVNMc1JacmYrZDhT?=
 =?utf-8?B?bTBucmVvM05ubTdzeURRVk1vaUJMOXpBckJmbGRmYVQrczNYQ1lreEllZkRL?=
 =?utf-8?B?Tm9TU0J3a1UvWWZZMGU5bnJqR2owRDg1VkNaR2hxb1RYdjRKNjZsUHRNNGo3?=
 =?utf-8?B?NWhHMFhDWXJqMWZjYm1Ec0ZHNklUeUJwOGY0MHFXL2trQ3ZmVXpkUm8rRGUz?=
 =?utf-8?B?TWhabnFCeGJmSS9RLzlLOG84Q1FaOWZQUFFwRk9nSW1qTGRkckUvREcydVhR?=
 =?utf-8?B?NUNJeHFTR0RRYXRhY2hQdCsxRDJyTjR4QURoNTJMY2dtdUJXNFJvV1lOT0FR?=
 =?utf-8?B?cnJCUWZtVTZ0RUJHUmdWZ3hGL0Fya21GVFVIZFJWMkRlKytDMlhlUFFkclZ0?=
 =?utf-8?B?bVFZbEpMZm5HSEV2YkxqbzBxb2RCakFpVFQzdHF3bXdvNFBNUGpQZEo5NDhM?=
 =?utf-8?B?Ky9hNmVQa3d6MmVZc3JkUlRwcm5oK2lUYnFqMUFiQkRVdEkzUVhmMnBjb04v?=
 =?utf-8?B?YnJpVnBHZjR4Rys5OHdmdHhYdVpsUnBWWTVJWkl2YzFrbnMxRWNmNkZwSUxI?=
 =?utf-8?B?bW1qbE41ZlhqZHloMXlydEMxT0lRNThuYVpwNXFlUVlrWEZDQm9qaG1XVnFo?=
 =?utf-8?B?b3YyRndpVmFWOU8ybFFEdGNoY3J1KyttcUdiY1p4S3k2STlaeU40TElIa2F0?=
 =?utf-8?B?RDNvYTRyRCtlTUVaTkl3QXpaRzdFTFdLVmVEWldCLzY1QlY5REQzVmdOY0ti?=
 =?utf-8?B?U0MvTHh2N2s2U0MyVkZ6dEphWUwrMUJNM29xa1FtVm5FTjhPZHRoVkptT2R6?=
 =?utf-8?B?aERGcmgyYUtBM1g2MXNHNDhyYkprU2l2cWFCZWRzb2Q1TmRsYnQ3aHloRGJ5?=
 =?utf-8?B?V0lxZDBBbWtZelFVcVlBNEVMSjgzbnNaR2RxaUZmbVJtcVlseEMxbks2OElR?=
 =?utf-8?B?ejk5Yms4MndrV3BqMUpqcmpCWkFDYkMrU1NlSkhvekhoeWRtNlA4RWYyaGZy?=
 =?utf-8?B?NXRtMlJHTDdPMEtyenVDemRWSnNvd1QwYURhalpnWXdTcGpZVno0SmJtQmhI?=
 =?utf-8?B?Si9WZERaOGIzV2JnMVExUVpCLzFpMFhiTUxZZTBIYVVwMGxKaStlM3kxY2Fv?=
 =?utf-8?B?UTlZbk82Wlk5MHVta2tXeTVqcWFnZFBnMUQ1RWEvL0xmbWYzMGhKNXo4Z1Fw?=
 =?utf-8?B?U1o2cng4R2t4WTd3Nzk0TmlQTlFaeldrNWU0UHJkN2R4WHRPd0JWN25aOStW?=
 =?utf-8?B?NWtFdkkxYmZDWGhQYWpYQUgxYVlESnZNWnJzZU9NMExhRkFvNG5EVzh1ZVd2?=
 =?utf-8?B?VytXTXVVU1VYeEtpOVZIeDIwV29ndFhYNHV2eXRiQ2hTa0U5VUFTTVVITEJW?=
 =?utf-8?B?aDY2anZuMXNWeXVtRjY0cjhkM3Z6M24vOFVMUlhlSi9udnNWUzl4OU8wbzcy?=
 =?utf-8?B?OFFJQ2w2bG9zYmptenlKcWtkc2ZoS0ovanRyNXRxeVpNelAzVkMrYXQ0ckU4?=
 =?utf-8?B?NnhTUHN6anZMWDdVWjBCaDhkSStvbnZmNzN6d2x5Y09mdHFlazdDMWltYkFP?=
 =?utf-8?B?eStWZ1JMZ0NjTno5M3JmNjRVR1NEejhGd3VjWDFpeGMya1Jaa0pTWVFkM1NT?=
 =?utf-8?B?NjBMQ0U5WU5tWFhDTE45bzZVUmVHNDhQNkU5czN1MjlEa0oveVN1b1hJTXJo?=
 =?utf-8?B?R2cwcEtFMVhldnVNQ2J3cEV0Mm5qdHltQjdjMmxLL2RKbUhCNStCak1kRUd4?=
 =?utf-8?B?OGRiTWhxSEVaNmJBU010R2FrU3F0VmJmWTk2N015Z0dvVEFENk9jZkxITHdu?=
 =?utf-8?Q?ssScLQicrQqSLcDLAmnvByG+5/SCUW9/X6flT5i65+K0?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c32035b2-3ee1-4312-c396-08dd4c1e91cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2025 11:07:13.4723 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dOQt5Qt4TCfKZMg/vtKgw/OhE/+d4alom6H/0WoOsCwqL98wEJpnKcWSQzQl81ZdrvSmHt1wrErVpd+lpWkHlMzKA0zjLApyB4oGo9eYxHk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7552
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTQ0NzI3LyAN
Cg0KWGUuQ0kuQkFUIC0gQWRkcmVzc2VkIGZhaWx1cmVzLCBYZSBjYW5ub3QgYmUgcmUtcmVwb3J0
ZWQuDQpYZS5DSS5GdWxsIC0gQWRkcmVzc2VkIGZhaWx1cmVzLCBYZSBjYW5ub3QgYmUgcmUtcmVw
b3J0ZWQuDQoNClRoYW5rcywNClJhdmFsaS4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
CkZyb206IEk5MTUtY2ktaW5mcmEgPGk5MTUtY2ktaW5mcmEtYm91bmNlc0BsaXN0cy5mcmVlZGVz
a3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBHdXN0YXZvIFNvdXNhDQpTZW50OiAxMiBGZWJydWFyeSAy
MDI1IDIyOjI5DQpUbzogSTkxNS1jaS1pbmZyYUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBp
bnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNClN1YmplY3Q6IFJlOiDinJcgWGUuQ0kuQkFU
OiBmYWlsdXJlIGZvciBJbXByb3ZlIHR5cGUtc2FmZXR5IG9uIFBPV0VSX0RPTUFJTl8qKCkgbWFj
cm9zDQoNClF1b3RpbmcgUGF0Y2h3b3JrICgyMDI1LTAyLTEyIDEzOjEyOjQwLTAzOjAwKQ0KPj09
IFNlcmllcyBEZXRhaWxzID09DQo+DQo+U2VyaWVzOiBJbXByb3ZlIHR5cGUtc2FmZXR5IG9uIFBP
V0VSX0RPTUFJTl8qKCkgbWFjcm9zDQo+VVJMICAgOiBodHRwczovL3BhdGNod29yay5mcmVlZGVz
a3RvcC5vcmcvc2VyaWVzLzE0NDcyNy8NCj5TdGF0ZSA6IGZhaWx1cmUNCj4NCj49PSBTdW1tYXJ5
ID09DQo+DQo+Q0kgQnVnIExvZyAtIGNoYW5nZXMgZnJvbSANCj54ZS0yNjQ3LWEwNWM5MTAxNjZk
ZGE3ZmM4YjUxMGU1Yzk3NzFjM2JlZDNmYmI5MDZfQkFUIC0+IA0KPnhlLXB3LTE0NDcyN3YxX0JB
VCA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+
DQo+U3VtbWFyeQ0KPi0tLS0tLS0NCj4NCj4gICoqRkFJTFVSRSoqDQo+DQo+ICBTZXJpb3VzIHVu
a25vd24gY2hhbmdlcyBjb21pbmcgd2l0aCB4ZS1wdy0xNDQ3Mjd2MV9CQVQgYWJzb2x1dGVseSAN
Cj4gbmVlZCB0byBiZSAgdmVyaWZpZWQgbWFudWFsbHkuDQo+ICANCj4gIElmIHlvdSB0aGluayB0
aGUgcmVwb3J0ZWQgY2hhbmdlcyBoYXZlIG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUgY2hhbmdlcyAg
DQo+IGludHJvZHVjZWQgaW4geGUtcHctMTQ0NzI3djFfQkFULCBwbGVhc2Ugbm90aWZ5IHlvdXIg
YnVnIHRlYW0gDQo+IChJOTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZykgdG8gYWxs
b3cgdGhlbSAgdG8gZG9jdW1lbnQgdGhpcyBuZXcgZmFpbHVyZSBtb2RlLCB3aGljaCB3aWxsIHJl
ZHVjZSBmYWxzZSBwb3NpdGl2ZXMgaW4gQ0kuDQo+DQo+ICANCj4NCj5QYXJ0aWNpcGF0aW5nIGhv
c3RzICg5IC0+IDgpDQo+LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+DQo+ICBNaXNz
aW5nICAgICgxKTogYmF0LWFkbHAtdm0gDQo+DQo+UG9zc2libGUgbmV3IGlzc3Vlcw0KPi0tLS0t
LS0tLS0tLS0tLS0tLS0NCj4NCj4gIEhlcmUgYXJlIHRoZSB1bmtub3duIGNoYW5nZXMgdGhhdCBt
YXkgaGF2ZSBiZWVuIGludHJvZHVjZWQgaW4geGUtcHctMTQ0NzI3djFfQkFUOg0KPg0KPiMjIyBJ
R1QgY2hhbmdlcyAjIyMNCj4NCj4jIyMjIFBvc3NpYmxlIHJlZ3Jlc3Npb25zICMjIyMNCj4NCj4g
ICogaWd0QGZiZGV2QGluZm86DQo+ICAgIC0gYmF0LWJtZy0xOiAgICAgICAgICBbUEFTU11bMV0g
LT4gW1RJTUVPVVRdWzJdDQo+ICAgWzFdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJl
ZS9pbnRlbC14ZS94ZS0yNjQ3LWEwNWM5MTAxNjZkZGE3ZmM4YjUxMGU1Yzk3NzFjM2JlZDNmYmI5
MDYvYmF0LWJtZy0xL2lndEBmYmRldkBpbmZvLmh0bWwNCj4gICBbMl06IA0KPiBodHRwczovL2lu
dGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14ZS94ZS1wdy0xNDQ3Mjd2MS9iYXQtYm1nLTEv
aWd0DQo+IEBmYmRldkBpbmZvLmh0bWwNCg0KDQpIaSBDSSBUZWFtLA0KDQpUaGUgY2hhbmdlcyBp
biB0aGlzIHNlcmllcyBhcmUgbm9uLWZ1bmN0aW9uYWwuIFRoaXMgZmFpbHVyZSBzaG91bGQgbm90
IGJlIHJlbGF0ZWQgdG8gdGhpcyBzZXJpZXMuDQoNCkNvdWxkIHlvdSByZS1yZXBvcnQsIHBsZWFz
ZT8NCg0KLS0NCkd1c3Rhdm8gU291c2ENCg==
