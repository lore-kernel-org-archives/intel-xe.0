Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9EFD262B0
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 07:02:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7304410E132;
	Wed, 21 Jan 2026 07:02:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NTLB3dY6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E7F10E132
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jan 2026 07:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768978932; x=1800514932;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=g81vIaLImU/HBvQNdZyP2o7TH/huqQ1yAzECZo1AU6s=;
 b=NTLB3dY6ZxRC+tMlFyu2apQdfN4d5MOELjt2FH7K/0h4VbuC8COanXsl
 Ek9QAZL/0EwOO8KHEuZ0dtQmVv3DFml0szoUOZ+POsTnJaedexMRoOF4z
 s/2UQQ3O6lnWnWgiZzptbeaqDhzCx0EEap2mthShjy0T6Nrjpou1d4BON
 EL3ZkqHRS9QRfymZ785CXalmtf8zI7/ASLHDekGrcswhaymXeBb/+KCDe
 OYz2KJIKAzvJNvjJDdgRJbMZnlbY/ztJ6GrrW4AXE0jsUIop36xnkoOom
 KJJTgBSEHBA/2pdCvN56mHNsIq15XaCrNbcr6UKJqe9fR4qDu9EF9ghrt w==;
X-CSE-ConnectionGUID: ZlukvA8pTyOYIjflER2o3g==
X-CSE-MsgGUID: VudBA+toTqmLd9dViBZu+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="69398858"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="69398858"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 23:02:11 -0800
X-CSE-ConnectionGUID: UP8NEmzyQT6XCfTkOmDgFg==
X-CSE-MsgGUID: jKcMGgI3R3eulRylJozJVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="206422219"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 23:02:11 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 23:02:10 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 23:02:10 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.25) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 23:02:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t/h3UPi0vGW0Puc+9VwWE7FmqHwSNvRXB4+qu88gqkpZ1faMjCeLhrGyekZXHhAjIK05r9tGjJAuXJbjoXTz8prYN/ZP042VTRndgpecQbLEtmQ/+MnxCkIeMY+nKdkZZZ8LdcHs4rMy4ic8US3xtP1YeV+qPtZsk86oBxsbg7slixPQoF+pZ/8NIK95jbFQUNP2XDtdlmpJPg1CVCCOtxwn6HBi92m44TFhEK2Mt+NvqupjdlxS1yxzUDM+fXKkZRNH9+oGMtxvoB7+GyC1QggkfhEltDIFqvyoQzKRItj0Gb8qvFNnwiptyNm5Pd3TdprxX/7OnGtcdFwSP6Xp7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g81vIaLImU/HBvQNdZyP2o7TH/huqQ1yAzECZo1AU6s=;
 b=TQ7n0Sk5Z40TUt6FQ0dGKWhPvvAkx7oCu+26/XI5hSzT+2bx7HhXiMaWPYgGhjAhfGqwMB3j9DVbqc9t9tVPZnclM6rnx3O0K0WTXMYI2mi7mcOOhvqN2ylTlFwCoAEhDn+keXqD0iz3JHmQldcv6bY7/JcfXx1hlPkfLs/Y5DLMjUOnHV9hp75K46d7vikpAKlY7tEbiCPXiKD5mAnpi1rXlIKXoGAlHs+yXv6j/KqwnCsD34QIVXYOoo8/LE+MC/cvfKtrBxSQCV1Dd6ojWpSDpl8yHCpnXudLApa1Up2Zx4T5eWTW0+QPiT3n4p112MYWfdbe4UD1KyRhvvDytw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by SJ0PR11MB8270.namprd11.prod.outlook.com (2603:10b6:a03:479::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 07:02:02 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::22af:c9c9:3681:5201]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::22af:c9c9:3681:5201%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 07:02:02 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Nguyen, Brian3"
 <brian3.nguyen@intel.com>
Subject: RE: [PATCH v4 3/3] drm/xe/nvm: Defer xe->nvm assignment until init
 succeeds
Thread-Topic: [PATCH v4 3/3] drm/xe/nvm: Defer xe->nvm assignment until init
 succeeds
Thread-Index: AQHcijuetqU/nbMcKESWMkjaXxiD6LVcMcUg
Date: Wed, 21 Jan 2026 07:02:02 +0000
Message-ID: <CY5PR11MB6366D0C9D99C229BB80C28C5ED96A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20260120183239.2966782-5-shuicheng.lin@intel.com>
 <20260120183239.2966782-8-shuicheng.lin@intel.com>
In-Reply-To: <20260120183239.2966782-8-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|SJ0PR11MB8270:EE_
x-ms-office365-filtering-correlation-id: 409d7149-2462-42b6-e579-08de58bafa85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?L0lEaTd1QkZ3MnppcEZyOFU2T3BoWHpycDZVRGw0K2hnaGR4YTNhUlNqM1Vn?=
 =?utf-8?B?bWl5VERoelNackxTSmZYQ3RRN2dPemNhd1lpUXRMVmtMUEMrcXRWcnRCT29L?=
 =?utf-8?B?N3Z3U1ZpbzJZRUVmd3Q1Q0E0REl3QUsvanJUeE0yeE90ZGwyeW5jaFJld1BT?=
 =?utf-8?B?UXVJaWJUNjNwVzFxREphcjdmaDNGNWdDNmNyejBUWHp1OHRqZDd6SUNrZi9Q?=
 =?utf-8?B?R0dTS0RielB6anV6NEdIZ3A4YjlsS0dhYjEva0x4UitoOElvdTVtdDk0Y1ds?=
 =?utf-8?B?YmoramR4eUthdnhoYkVRRlJQa1ZEWm1laHU4WllWdStyL3FtVXdYM2FocDhv?=
 =?utf-8?B?YkxkKytwc1YxYUh6aWlLT210QWdueWNkVmJVMUlBZ0pPS3FGWlQ0eHFrek4z?=
 =?utf-8?B?UkpVOTlGVFR4UzVpbEFYRlp6M2drSm5uMEwrSjdhVllmRDVlTFpnUGhLYUtF?=
 =?utf-8?B?T1lpSXNzeFFzSnpvM0dJMmwxa2hKOCtEMDI2REx5bFZrSVppdVJ0eGpaemQx?=
 =?utf-8?B?TXI2V09NRm5LMzRSd3BkTUt1bFNDNGVnRDRZN2JVbFA0Z3NVUWFIdGJKazdw?=
 =?utf-8?B?c0lBNXVzZjdXUjNhdUdITHJwcTBxQUs3L0hYS2o4Mi9uaVhYbmdVNU04c1pB?=
 =?utf-8?B?eVdzenRkV0x6aUFobEhGdThxMkJONzFncHQ2QlppSkt0M3FoejJrR1ZESzFp?=
 =?utf-8?B?Y1ozWEJ1WW5hSXJteDJ2MVlEUWdPcWE4WkovZGNSSXcrdjZadlNGaGRiRVZT?=
 =?utf-8?B?NmdIY1dhZklpdGJaNElxV3dtK3grMGFiSkJGc2lkRzluY2JtYk5WbitGT3pF?=
 =?utf-8?B?TlZXMHpnTk9ZSnplVUpXczFKb0F5RFNxTHJ3amp2aDdxTi9Senk0QXBXVDBi?=
 =?utf-8?B?dXNOSC9GMDY1bEpyRkJnWjVUVkV3bzVpZjFOaW9hSTZyV2lLY0JVZnNucnFa?=
 =?utf-8?B?RklUdEF5RUxXM1BETGNvdkxrT2hBd2JicjdOYVpvMmFrWDFtKzluWWZtYXRj?=
 =?utf-8?B?WXlwTEQxNGFjUHBYT0ZuejlIQVZjV2hnWVM0cmx1d1ZPd3hjMkNEY0ZGSVJU?=
 =?utf-8?B?WG9uWFZtdEpLQTVNRUhJcnVtMTQwL3BCQzJoR2FwSC9WVm9ycE1nOVNTcitB?=
 =?utf-8?B?M3JldSs5ZlY0WDRUNit3blMzWDhtK1RwdVBqOWNIQnlmTDlOb2JXVVBzNzR4?=
 =?utf-8?B?RVgxL2lldlZicW0zUjdEV2NSaVNmb0JjK2NxVVNWU0Q1SDFBa3g3dVFreERF?=
 =?utf-8?B?MTgwNmVyR25qRzNzNC8xUjdHUU5OR2FWMG1XTXlxTmhuc1pXU09KRzQvUFll?=
 =?utf-8?B?clU2dVRzNElyU0VHdndYRmV2OWFIY2JibmZkSmczK3lhRzArMERlaGo1UU05?=
 =?utf-8?B?bUs4Q2FDNXhBM1F2U3lPd2NYOTNpMU5UNUx5VjRCOFlrQmhFbVF3dU91aUFX?=
 =?utf-8?B?RngvTTVEcVVWWkdvNVF0ekVKT0Q3QkxSVkp2cDhRbm16V0VubGJQMVNucFpY?=
 =?utf-8?B?bWwwMDBYeGFXUEpoM0VrSTR1NVRvLzgvd0RaYkhvbDRBVGhaaDF2THJENCsx?=
 =?utf-8?B?ajQzcnlvNTJYMVpCbWNJOW1aUVhuVWF5UFBxL3VSaUl5a2pvdG5oZzdFTEsw?=
 =?utf-8?B?SmpyR2F2Z25XUnc0N0tONVNacTJpRm9abkM3UGl1RWt5K0FzUUZHMUVBK1Fk?=
 =?utf-8?B?NFk3UnpBbXJmOGJPeWxEM1BGNUVhRTdmaFQvYXRMUnV3WGY0OXFkUXZqOTBB?=
 =?utf-8?B?S0s4WDZMMWh2SnlmR3NPS2p4VGpoOFF5WVJIUC80MXF3QUx0QTdEOXlFQ2lu?=
 =?utf-8?B?RmRUTVYxRHZSaEtVVExMQXN2TGdKU0JrVmpTMXFBMUZ1emlyUDJKRWtybFdM?=
 =?utf-8?B?S3M1SEN0d0FzaGFsZjhqL2ZJbEhaTGxreXd6eS90WGpaeUJVMGFiOEMvRmVB?=
 =?utf-8?B?ejN4Sm9BMXppc2FocCsrcFYzV1lXdDQ2QVpONXQzRXl1cDFUZm1tb3VodFMz?=
 =?utf-8?B?ZU9vWXRpUjdTbEQzQTFQUWFzOHNQUTlIejF2ZDdLSXJ5MngvdUE4VkpqQXZI?=
 =?utf-8?B?RVovdDBEOVlYcEV6UTV6U2JBcjFKQ2FyZW83b2xrYUcyVG43OG10ZUg5UnZi?=
 =?utf-8?B?L0JtTEs4d3JoNmpPcStSc0xqcUpiSWQ3dkpMZTBJellSb2hvSWIzanNKejVN?=
 =?utf-8?Q?Mml6q/LDlwGPyp83gx6fV2k=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YXFocnVDQnNYelJ5clkrUit0YytZaHJRMm1jcWsvV3ZaSzI4SGhiZWU0dDJK?=
 =?utf-8?B?V3hhYm5FVUdxejVNRkwvSGdjS1c1S3cxSjJ0TW9JMnAvN0phcG04Q2ZnTEdJ?=
 =?utf-8?B?SW1LNjh6bTBBbFdBc2hFRmdNbVk4QllacklCL3BiMUdTTTB3eDBHRVh3bHpi?=
 =?utf-8?B?YWUrSXZiUDZ6bXV4WU5KVkpNY2F6ZDc2YTdWUWNoenlyV2Z1bFduWjRTVXpN?=
 =?utf-8?B?a3drWnVHdUFoSTd4eExZTW5HaktWZUdsTnBaZVluaWJZZjE5cDdyUUpDaUFB?=
 =?utf-8?B?ak16d2FYakZmOGp2clNwaTZ6TFQ5TG5SMnNNZGlEZmxxTEFNWTM1eTMvK2Va?=
 =?utf-8?B?c3ZzZjlkTzBpQ3BocnYrMStrVTNjS2RIMTcxdDhYWjdMaXpROHM5dG5HTkln?=
 =?utf-8?B?aHlYVlhRcGpGNW1jaVNlNzF0WnUwZzRtaW9EL0FNNWFPcWdSRXRuNm13MTVY?=
 =?utf-8?B?OU16RzMvQmpzeGpBZkI2eFlQeWY5TExobFZSd3pNaGNvcVdZNlZqcFpRUElM?=
 =?utf-8?B?VWR2Q1B1ZnJNTGgybzNxTi9QK0tpOGM1MmFGTUZXRFdrbzVvVW1yYmJHMUNG?=
 =?utf-8?B?cUFRNzV0ZDgrQ1RwZkZScDFRZmRrRUh3TGw0b3Q2M2d6QjJiRGF5Y2xEcExW?=
 =?utf-8?B?dXNqY3VVRElQRUd5TUM4eEJINnpzc2N1eUoyU2FWQ2lLelNvYzhKOHR5UXRj?=
 =?utf-8?B?MXVNWk95K0ZRVGN0aTZhWXBvNVBzQjlwVlF5alBOWEdqcTVLdjBlRXhqdVZD?=
 =?utf-8?B?MExOZ3QyNmJRNUNqby81QXdBSGRDalgxMFVFcytIRWh5WlVzdWQxbFR4aExo?=
 =?utf-8?B?SEZacUdaaGJ1bmxMYUVRbGFqWFozZ1AzRzBUVExMNEpVUnVPNUJYMFRYZDB5?=
 =?utf-8?B?VTQ3WnpMamNaWElkTnAxQU1mVVBVOEorTFQ3VHNaaFZOQTk3MzVPVDlqMHBx?=
 =?utf-8?B?L3B1Y0w3Z29WOE1nTnJNNDBwK09OM3FvODVqYis0cndZL2Mwcm5IQkwzWWNh?=
 =?utf-8?B?aEM4M2xIeU91Z3JxWkpWS2lVbDRMa1hpSFV0TkVQRHBpM0ZMWngyNFhXM3Ry?=
 =?utf-8?B?N1dka0d6RVQrTnBjOHQwTFBzQTZnTE85SlFPZW9yeW14aDRUYVdtU1ZIM214?=
 =?utf-8?B?K1NhSERZZ2VseXVWMytQTDdCa2RlUlI1V2lvcFdFYlFvVkQ1bjYrYzFFdGVj?=
 =?utf-8?B?cE5pRGdITDAzd3FWdDZWZjhtbExoNzdPaUF4VkdaSGxSWk5Uc0ttT0JMcnNI?=
 =?utf-8?B?VUhQRkQ0dGhzMmJWT0lDWUdLZGNVc1VVYmNteGxBTXpOZHdreVpwYmFQQjV6?=
 =?utf-8?B?QXZVdEZkcVI1d3hrN0xNQmxidFY1a05mNE1rRndQUzlCUkxUcWU4UVRzM2lj?=
 =?utf-8?B?S0N6Tm9jaVBGZWVtZFR2S2k4NjUyR0F2dzJWWWhLOUJ3Tm5KYjdqakU4b2dw?=
 =?utf-8?B?TUhtTGtPdTBseVIySXZRSkJrK1poRytsbkVWVHE3WTVBY1ZHczV4NXMwcmxm?=
 =?utf-8?B?LzZWRTlyaHFmWCtqdHNjUFZ0cXpHTnpFWlh5ZWFWZUQwRXRHRG43Ym50WkRQ?=
 =?utf-8?B?NjdoNU9PaFZmNkhUejdaVDRZKzRoL0J4d08rdTVkWUN3bWpsWVlSU1lqSWJa?=
 =?utf-8?B?dG1yY1hlVzhocjVSWEhaUWlHMEkwVWJHMTMyMU1oVUZVLzJtaS92bm8vbi9C?=
 =?utf-8?B?cG94bXExYUx4bzh6dnkwQmNUYTlwa2NEVVZkbXRRQUZ2SDM3T1RLS0UremRo?=
 =?utf-8?B?OUIrWktEV3J3YWtBU3hFVUg4NjNXQW9Cb2RyT3czMEtmdlJGTVc4c2dDaXV3?=
 =?utf-8?B?bm94VkNISGRRZURFdWN3VWFFMTNFQy9EWjVubE1NSzIzaDU0Vi9vQURJNEVW?=
 =?utf-8?B?T3c0UzQ5TEVEQkl0enpxTWRWNkxuOHFwbDllT1F0VkpsVHBRbnJwUFhiRHBk?=
 =?utf-8?B?T1hKeEVYNjZ1OEpMTFp5MTkrNXQ0Y3RhT2JIQldWM3pvMzREdmVFK21DSXh1?=
 =?utf-8?B?UDFUT3RabkZVK1Y1MmJQank0cUo0dk9pcUw5L1kwTFNnaXd1MlhMWk5NaUo5?=
 =?utf-8?B?b0pYK0ZVV0RNRlNWSzlFQmJvc0dxeTRudEliSStJWktPcG1Lb0Zwd0wwa3hn?=
 =?utf-8?B?Y3RXS1hXc0llb1pEM0xBL2Z3VE55Znd5WWpKUlU2L0ZtcllKV09yRHU1VWJv?=
 =?utf-8?B?c1FLWm9iVlBtNW40Vnd4MW1YNFpaZU9VckFOQ3dlV1NmOHFxZDRXbnBVUEFL?=
 =?utf-8?B?VWlsRVZwaFdPZ0dHdFFyVGhSczdLTUJHbDRDc0tkLzlBSmpzUlJvRFNGOG9B?=
 =?utf-8?B?bUN2TW4zNmhtVEV4UTFmRms5VU9tTlNGL3ppSGM0aitraGx3Z2xtdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 409d7149-2462-42b6-e579-08de58bafa85
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 07:02:02.3273 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9zzh59FSYNiUgSO7o7rnC9aBpjolV8GIokRWb8d0P3qtwZywPDfAssTnRz6qqH0RoaOZqaUlqAEgplWxG4jJxXVnKwJmVns0gz4dJOKDbZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8270
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

PiBTdWJqZWN0OiBbUEFUQ0ggdjQgMy8zXSBkcm0veGUvbnZtOiBEZWZlciB4ZS0+bnZtIGFzc2ln
bm1lbnQgdW50aWwgaW5pdA0KPiBzdWNjZWVkcw0KPiANCj4gQWxsb2NhdGUgYW5kIGluaXRpYWxp
emUgdGhlIE5WTSBzdHJ1Y3R1cmUgdXNpbmcgYSBsb2NhbCBwb2ludGVyIGFuZA0KPiBhc3NpZ24g
aXQgdG8geGUtPm52bSBvbmx5IGFmdGVyIGFsbCBpbml0aWFsaXphdGlvbiBzdGVwcyBzdWNjZWVk
Lg0KPiANCj4gVGhpcyBhdm9pZHMgZXhwb3NpbmcgYSBwYXJ0aWFsbHkgaW5pdGlhbGl6ZWQgeGUt
Pm52bSBhbmQgcmVtb3ZlcyB0aGUNCj4gbmVlZCB0byBleHBsaWNpdGx5IGNsZWFyIHhlLT5udm0g
b24gZXJyb3IgcGF0aHMsIHNpbXBsaWZ5aW5nIGVycm9yDQo+IGhhbmRsaW5nIGFuZCBtYWtpbmcg
dGhlIGxpZmV0aW1lIHJ1bGVzIGNsZWFyZXIuDQo+IA0KPiBDYzogQWxleGFuZGVyIFVzeXNraW4g
PGFsZXhhbmRlci51c3lza2luQGludGVsLmNvbT4NCj4gQ2M6IFJvZHJpZ28gVml2aSA8cm9kcmln
by52aXZpQGludGVsLmNvbT4NCj4gQ2M6IEJyaWFuIE5ndXllbiA8YnJpYW4zLm5ndXllbkBpbnRl
bC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFNodWljaGVuZyBMaW4gPHNodWljaGVuZy5saW5AaW50
ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9udm0uYyB8IDEwICsrKyst
LS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX252bS5jIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX252bS5jDQo+IGluZGV4IDZmOWRkNTE5MzcxYy4uYmM4ODgwNGRlNTE0
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbnZtLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX252bS5jDQo+IEBAIC0xMzMsMTIgKzEzMywxMCBAQCBpbnQgeGVf
bnZtX2luaXQoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+ICAJaWYgKFdBUk5fT04oeGUtPm52bSkp
DQo+ICAJCXJldHVybiAtRUZBVUxUOw0KPiANCj4gLQl4ZS0+bnZtID0ga3phbGxvYyhzaXplb2Yo
Km52bSksIEdGUF9LRVJORUwpOw0KPiAtCWlmICgheGUtPm52bSkNCj4gKwludm0gPSBremFsbG9j
KHNpemVvZigqbnZtKSwgR0ZQX0tFUk5FTCk7DQo+ICsJaWYgKCFudm0pDQo+ICAJCXJldHVybiAt
RU5PTUVNOw0KPiANCj4gLQludm0gPSB4ZS0+bnZtOw0KPiAtDQo+ICAJbnZtLT53cml0YWJsZV9v
dmVycmlkZSA9IHhlX252bV93cml0YWJsZV9vdmVycmlkZSh4ZSk7DQo+ICAJbnZtLT5ub25fcG9z
dGVkX2VyYXNlID0geGVfbnZtX25vbl9wb3N0ZWRfZXJhc2UoeGUpOw0KPiAgCW52bS0+YmFyLnBh
cmVudCA9ICZwZGV2LT5yZXNvdXJjZVswXTsNCj4gQEAgLTE2NSw3ICsxNjMsNiBAQCBpbnQgeGVf
bnZtX2luaXQoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+ICAJaWYgKHJldCkgew0KPiAgCQlkcm1f
ZXJyKCZ4ZS0+ZHJtLCAieGUtbnZtIGF1eCBpbml0IGZhaWxlZCAlZFxuIiwgcmV0KTsNCj4gIAkJ
a2ZyZWUobnZtKTsNCj4gLQkJeGUtPm52bSA9IE5VTEw7DQo+ICAJCXJldHVybiByZXQ7DQo+ICAJ
fQ0KPiANCj4gQEAgLTE3Myw4ICsxNzAsOSBAQCBpbnQgeGVfbnZtX2luaXQoc3RydWN0IHhlX2Rl
dmljZSAqeGUpDQo+ICAJaWYgKHJldCkgew0KPiAgCQlkcm1fZXJyKCZ4ZS0+ZHJtLCAieGUtbnZt
IGF1eCBhZGQgZmFpbGVkICVkXG4iLCByZXQpOw0KPiAgCQlhdXhpbGlhcnlfZGV2aWNlX3VuaW5p
dChhdXhfZGV2KTsNCg0Ka2ZyZWUobnZtKTsNCmFzIGl0IGlzIHVubWFuYWdlZCBoZXJlDQoNCkFu
ZCBiZXR0ZXIgdG8gdXNlIF9fZnJlZSBjb25zdHJ1Y3QgZm9yIGF1dG8tZnJlZSBvbiBmYWlsdXJl
DQoNCi0gLSANClRoYW5rcywNClNhc2hhDQoNCg0KDQo+IC0JCXhlLT5udm0gPSBOVUxMOw0KPiAg
CQlyZXR1cm4gcmV0Ow0KPiAgCX0NCj4gKw0KPiArCXhlLT5udm0gPSBudm07DQo+ICAJcmV0dXJu
IGRldm1fYWRkX2FjdGlvbl9vcl9yZXNldCh4ZS0+ZHJtLmRldiwgeGVfbnZtX2ZpbmksIHhlKTsN
Cj4gIH0NCj4gLS0NCj4gMi41MC4xDQoNCg==
