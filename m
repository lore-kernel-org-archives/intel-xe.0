Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9447DEC1EB9
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 13:43:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A2410E8B3;
	Thu,  5 Feb 2026 13:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iUi40HoY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6DA110E8B3
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Feb 2026 13:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770299030; x=1801835030;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=shMll02k+1/GcAc7t+VGXrnALddGfavdQ11fK93TQyk=;
 b=iUi40HoY8/CMZbTcHLeR/aXrwhgaDZOLYJ+I8qSFOrW7zsS+5+DeZFIq
 piEY9f9kAtJljESmNCdElYLqmYVhpi/UAl03uLg5zoSbK0IH91j9bOdfn
 ZURB0SEGoiEKHP2ymykmLVAlwGvlrfTGSZ7rl3RWYFgCiCqmMrS6IWg5D
 cKsZb+x0bSv/vyYWK0uiTcFFzqL+PQNGVfwFkRqJB8vnZk7G4EaYXvuMZ
 FrFYggr67e93fQtsuYjjk2G41WiIEKDbEXGTUErd++Iq8uJ6BTcH1px1T
 7yCloTnkXz64uY3nfp7o3pIvI6dLlpzaEpL9Q8u6irUZfr9lcik+alZvy Q==;
X-CSE-ConnectionGUID: CErGZHyMQdGh1zLgEHxv9g==
X-CSE-MsgGUID: dRUYnHl7SvGwamkmtNKqFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71398518"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="71398518"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 05:43:50 -0800
X-CSE-ConnectionGUID: xsPs2CR2Sq6IHtcV4PzPCA==
X-CSE-MsgGUID: EHhbQaKuTa6kcyxc5GUyKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="210339134"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 05:43:49 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 05:43:49 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 5 Feb 2026 05:43:49 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.18) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 05:43:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vrIOgtNzpWD/aifHyn2K3wEWjjOuWob232Yzu0qyrb+u9SMqWmCTzW8/5/KjRj6kcLL2WSujGzUemqoWFxN0VjaQ9dD1WMy5CtXHyl++shjW42TSbQezF+CSjmcRtBo3vzQy8NBXf9325ku9fKxCc4avlOjSbnAcI4G5npKG9WN+SbYRbFOy+Gk4Xfyj6eVEJdG3tJirAC8UXkumKXZMd3G7FlnumZWcwe+qN+3PJGbFzQ+Qh9T502ZACfMNSFajvEbDSDS9Yg3bKHjeQD2ejZ2wkBaC7mbavzE9+Qx5oTUHApn9pTxPp26IaW2FOBZbJxBjOo1KFSj3rIjbubrW5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=shMll02k+1/GcAc7t+VGXrnALddGfavdQ11fK93TQyk=;
 b=ojTDj6InNZBFj9QG3UjwUUbFBeB+yYyvqBghikTRlWXtQF5U8gIFKwYQRNkMsB+XhLhJQdzt+1sTgycNB7pL0OK7dwqc4pOPs7NBgv43YZcLCOd30uj2GtesblLGBSHys10jY9zhUrRObAztIwmqaquObois/zRTcZPdk5N1I6LjNvLvIWjBUzVCfoglCVCLJX0C7Q9eAgrms/zI/NUTQRgxZX/JWc+zavraPrqoIE5Bdre+tNzaBC8UeYVCAruv1Vh9IjjDgFAXC3N4EfnZwNGPoV0wWtDJtzk8f1T+8cpsADCxKROqxnIOIB8c+RIWSN5bw6ZL5siuhWS84SWbqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ5PPF1FF629472.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::818) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 13:43:40 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765%5]) with mapi id 15.20.9564.016; Thu, 5 Feb 2026
 13:43:40 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Yadav, 
 Sanjay Kumar" <sanjay.kumar.yadav@intel.com>
CC: "Summers, Stuart" <stuart.summers@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/xe/query: Only advertise NO_COMPRESSION hint on
 devices with flat CCS
Thread-Topic: [PATCH] drm/xe/query: Only advertise NO_COMPRESSION hint on
 devices with flat CCS
Thread-Index: AQHclnjbfr2J3qU3sU+qxMsKEd2eorV0HeKA
Date: Thu, 5 Feb 2026 13:43:40 +0000
Message-ID: <363425b3ac18605c3f3625064c7bcbe407d73dcd.camel@intel.com>
References: <20260205082048.2988738-2-sanjay.kumar.yadav@intel.com>
In-Reply-To: <20260205082048.2988738-2-sanjay.kumar.yadav@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ5PPF1FF629472:EE_
x-ms-office365-filtering-correlation-id: 3e82f67a-71e1-42d2-2a86-08de64bc9278
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?V3RjTzFjSm9YZDEyZmFrT0hTZGFXb05KMGlMSFRrM3oyZFJRWUxPLzJCajAr?=
 =?utf-8?B?MWlYVjU4NXdFL2tGZjhBZ3ZnMTVwVkFoelhDaEx2a0F1cXlvcVYxdnlGcHRF?=
 =?utf-8?B?MXZEWTFmdEpiVkcrVXpTM2Y0SU1BVFF3SFVmQ1Rham1ObGp0bnluSkhMZlMv?=
 =?utf-8?B?YlJMVmJacm1zS1pOY3hYeCtIdWZKUDJXREloUzY0SncwcjdFSkdXY1BvWDFP?=
 =?utf-8?B?M0QrcVIyNjEva3FsWUxWc2M0NjVqY0xVREozOTNscnNjaGU0K2lJS1RndkFI?=
 =?utf-8?B?KzJsOERsaEcvQk1Qc1MxbGwwQTdaNjRIUFZ6VzdyYWt6Ulg2OGdZSG9Ja3Jl?=
 =?utf-8?B?NjhLWlBaeUo1d0JDRm9GUENLeFlLUmtYT0Q2OTZsdzZtVjVSMVcyWWs2V1ZB?=
 =?utf-8?B?MlVLb29qUy9WMDhFRlo2eFpwWnA1enlkU0ZoUGVSYVNRZnZuTXNVN2R5ZkVN?=
 =?utf-8?B?U3F1SXM0YkpRa1Z1czJpeDhvbkxXVThKZDhFUVJGZUZHRlgrbWpCbEcybHNa?=
 =?utf-8?B?QmtZYUVHWUJ4UWhzQTFQeHRMTFQ1ZEkxUmI1bStMNDdEMHA4SitUd0hQSDdS?=
 =?utf-8?B?QVdGVTNOZFFFZkVaUkg2R3JCV2VKcUtMd0kyZFc0VHFpQi9hbHNHQng4Vi9D?=
 =?utf-8?B?NlpiYUxRUlRsZ2lZYjBlQUdJYTF2Tlc0ZFZHNmRMekZ0U1l1YURjTjBPZGdy?=
 =?utf-8?B?aUs3QjdVWGZCY2JVRVNUTU0wMG0xNUFGZVArTnNsYUVkRzBaZWZ5aDU0VXhD?=
 =?utf-8?B?bjdwT1pMTzdoNnd2ZmxBQnZWcGdDaGZwS2VsMWFzUHhrOEc2a0w1aXRYZ1h4?=
 =?utf-8?B?cGFueFZxTkJNcHNNWEVrSll4TjQvK0pnV2l3dXg4SXl0SHlBYUwzcjFKZlIr?=
 =?utf-8?B?UzVYWmxhZGtVUHlCMXU4RzQ1TFNySGhUVW9kS2pVdldnVng3SmRyNkVaUGNN?=
 =?utf-8?B?UkF2SmVtV3RZa1owb2JrSzdQTXh6T2ZNN09JMWV5M2pUNHJ0Y2dRM09NMk5D?=
 =?utf-8?B?R3lzSFF1eWpJVC9vc3pIY013ZGl2TlhWQzd6MEdXOE81L0lNdjc5c3dsakpj?=
 =?utf-8?B?SXVsWVltcWZRSGxRUTdZcm5Ca3BaNDhlMnN3b09lVXk5T3ljZFp3WlFkNmVl?=
 =?utf-8?B?SGU4NWQzNTRWbDUxdWJpT0x2bmkweC90a0dBRlFxdG5lYmRqSVFmYVU5OUFo?=
 =?utf-8?B?cHJXNmpTKzVJMEp5aFNEa3RYQ0ZDVlpJL2dkcUhWaU5DYlpTQkFDM2djejBS?=
 =?utf-8?B?UlA4MUU4MWk4MDlzK2JMUW9YMVpwQU00SnU1QWJwSExiQjhpYncwTnlZdkxl?=
 =?utf-8?B?RklSN0hNSXJCempuOURVNGNnTlkvdXFjOVVtcGQweGhIZnlQYW0wSG1sZVo3?=
 =?utf-8?B?Q0lnN1dXN3lpbnYvK2N1T2NFOFpweWpZY0NsY1liSzRPeVA0MER3Q2VaK3I1?=
 =?utf-8?B?MTFFZ1AxLzM1c3ZhTDJYTHZhdUlnZDRYNnVSdC9JSzlySEt0V1pMK0RVZlAx?=
 =?utf-8?B?VGZRYUNtNzZ1cXJieFQvelV4VFN4aFFXeXhUbmFsM3JZVU1iTEVOWC9WSUFt?=
 =?utf-8?B?aTRZV251dXZITFR0Wkc3UjdoYWl2TlZLL3h3TTROcWZoMmNBK0RlOEhDUkJn?=
 =?utf-8?B?MkQ3d0dkNDJRVURyVCt1U1RkU05Mc01KUHplU2dZNm5oQ1VWS1ZpQzI0NnBY?=
 =?utf-8?B?Y1lhS0NMWjR6YXh5elhIekVlYWlpdExOc0dwOGJRMkpDaFJoK29mYTM3OWs2?=
 =?utf-8?B?NERmWFdYRC9oL0hOQXVlQ21nYXRtVWNDMHlUUGJFd2xMVE4rcU92TXA4SXNK?=
 =?utf-8?B?anZYelFueHVlcFNpclJwUCtqV1B3SXVyVVF4aHpKMkZmc3VOaTJFVGtvWCs1?=
 =?utf-8?B?NDNpazJ3MDc4SEl5L0tDUTZvWk5DSEw5L3pER0hZb3NqTjhYeUN6dFdabmVH?=
 =?utf-8?B?T3NzTzVDWWlDeGV5VkN3bTE0WUdZcFVmcW1xVUxRcUlLYU5DcDlIZXBwd3Ez?=
 =?utf-8?B?Y0NrL0FDYmMrSDMrL1V2cHlZRXBPUkxkTnZDdFF5bTVxZXZ6UmZ5d04wc2xi?=
 =?utf-8?B?T3RUMWNyNDJGZktSL0ZvZWxNdkJXNFdQWnZTMWhPOTM3RkN5K0ZWbUdRUzFE?=
 =?utf-8?B?blhRZkJDaGdwbVJZSkM4bGFLbHF3eE9BTTcrQ2dxU3pxaWd2K0RhSjdhSnY1?=
 =?utf-8?Q?CuD1t3Vnm7AkFC2ErcQJcIg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N09Tc0srYTIwVUkrZThXRm5DcnhoSTJSOTV3QmlJQ0xUSnF6eUJNVDFJeitw?=
 =?utf-8?B?L2RyMlRueEgvUHBLcTVqamxVeERXZ0I2OE1HRXhmOUZOWmN3SlZsbVdoUkhq?=
 =?utf-8?B?bEZST2FkYituNm1OSGtPaXFzSDZKamFHdHFWNnVSYUg1bDlrSnJxenNENnZt?=
 =?utf-8?B?enRMa3ZtbGQwUFg1VHBtUVJmWHQ5MkdyNFlYVkxlaUU1QzdIUEpQVUtSMnVL?=
 =?utf-8?B?THlWcUhVbjdoZ2ptQlZmUEhNcUQ1SlBFZ1oxMWp4OE5qYWxLTmZHUTBlOTh0?=
 =?utf-8?B?eDNtcDl4N1ZOeVU2RWh4bTB2TXkwaWVmU0FTRStSbnJmYTA3d3VBTndMRVA2?=
 =?utf-8?B?dXZ1NStXenkvYXVUcDVsdTlWODYvZ3QyS1R5QXlDWTB2TXhmRFRka3ZJdW9M?=
 =?utf-8?B?T0hYYkd3MkhvTS9ERERsTWoveEtacGNEVE1BNGF0bWtLVXErZlBOM1dISmd0?=
 =?utf-8?B?UmFncUlLMi9XYlhpODA1bWdsakxsZVN5OUs2dE1WbEdNTVdpWVlsZ0R2Skt0?=
 =?utf-8?B?UjNERVlmSVVwM1FOcjRhZjVXR0ovOHFod2U4UnhNSkhBbDRka0ZNNFVnQ3l3?=
 =?utf-8?B?aGpYMzd0YVpHOG40M3BjOWtiR04wZDA1TFpiVVBneTdMa3NnblBHQUFmNnVa?=
 =?utf-8?B?RUxsVDNvVzl4QzgwV01WMzNVd0JSRHpmcmU3ZXE0aG8wSGpMYS9hN2tkcVZW?=
 =?utf-8?B?VFJuQ281VDY2S3dsRVlzeENqNXBFdW5nbVI5T1hvVG16UVMrV20vVTF1ejZv?=
 =?utf-8?B?SUhpaUhLR3ozdzVSRXVJbVk5ZjVGbVdtQ1BjNTdGNGN2bG5Kak9yWnNVNUUv?=
 =?utf-8?B?NGxuRmdBeDRIMy80OXpwbEpvMjljRlMyTTY1eWJyNHpZYU81b3V0V2Fmc1FN?=
 =?utf-8?B?N1NKWDJhMXBSYXltT3M4enBnL29jVklyQk1lTVoyc1V0eStxZUxoMm13VUc4?=
 =?utf-8?B?SmxDaS9YMDdMQ3haa3A4ZFk4cHhzUVBDNGZ5RE4zdzIvYk53a2U2TDVOZVpO?=
 =?utf-8?B?Y3grMzVPMkV3SnFCa1lrU1RmNHk5QlNrMkI0NzFGSm45NXRldEFmdnozRXg4?=
 =?utf-8?B?YXVMTGdHeGJSa3R3M2NuUUtCdHc4R3JXUWh4bkY5SHBzYXd6Y3hnQWJ6UnUx?=
 =?utf-8?B?RStxYjZDczcxZXB3eTJVSGJSRjJxb21HSDhBd000SmNjbjZUUmhydXZ0Um1S?=
 =?utf-8?B?VmlncW9lU0ZYUkVEZU1ST3VlZlAvTHJ4bEZMQkF0cE15TTRxaUpub0FMVXRI?=
 =?utf-8?B?bm5iR0tXN0VWV1JGV052bEowOVNYT05RR3VmWi96Mm9LM0hHNFY0Q25ob1Y4?=
 =?utf-8?B?cUt1UmdrQ09Rdmw5eURxVG9kVk03emRBSjI2dWtqMEQ0VSsrbTc1dll6aU4z?=
 =?utf-8?B?NlNIVnBWQ0o2NlVpWVgrMjlVR29wejVYSlQ4YU8zYXpjODFlbm9PWDZtWEd1?=
 =?utf-8?B?cU91Q3NPSXZuckpnYW5Wcm1KYjZ5cUVwNXlEdHJ6SENTZkU1aUtLQ3pzcEI4?=
 =?utf-8?B?bVdKSmZWRXNUQ3lJb1lKVFFIUDhjSkE1VUlPMUgwSUpQZ3ZKWTJoQ2pkb3Zv?=
 =?utf-8?B?bTJMSUE2SkJCZW9DMFRLTHEwVnY0cnRjRVNndFRBRW1LZU45VGFVZHpQSDRK?=
 =?utf-8?B?U3N5UStWR2VwdnlDODlXcmNKZHIvUjh6K0RXV3l5ME53OTRwUjE1bHVzcndN?=
 =?utf-8?B?citUcG5UWldtdStNSEVsVEIyT1BNN09vZXBQSG9SMEg0a3RRc0FYVy84bDAr?=
 =?utf-8?B?OWU4WDh2WnBIb3ZzS3kzeHpOVUZnYm0xZkRDOGFmR2dYNjh2L1ZEc25paTBY?=
 =?utf-8?B?Y3EycXNTQTZQbTBYalNzRE1HcC9XV3B4V09YTEFQMjBjblNlcGNNb2lYTms4?=
 =?utf-8?B?V25vNlkvSkN4YWxJNzgvZnN3bjRJMS8xWTNURnp3RnFzeHZZbVVtUDR1akRV?=
 =?utf-8?B?RDM5SFJjb0h2YllPZ1Z0VG1Zb0ZVV1JDbXFPZGp5NUJwbkx5cnViWUJKdVRY?=
 =?utf-8?B?M29FT1Qydkdzd0s2Uys2aW5pei8yWGdGRHVBaHcrQXcyR0RCSXM0ZURoMFh3?=
 =?utf-8?B?a0tWUC9xcWY2VDh1c3NQb2U1WXBVWEViUE9jeUNwc2RzNU5vVk9Zd2NKRVdN?=
 =?utf-8?B?cG5vM0EvWUVRd2drenJMakh4Mjl0a3l4Ym01cHF3Q2Z4cEFxVFdHRlBlNTNR?=
 =?utf-8?B?UytoYm1raWF3Z2Fxek8yb0RmL1RMc0JBaTFQd1lHb2JqaUVrb2tNYnIvUGV4?=
 =?utf-8?B?dzF3VFdEU2dvYkhKQnBGSkZScStudk00UHEvMytJckVLeXEyaGtxclljNFBL?=
 =?utf-8?B?czZBR1Y2SVFmQmgyQk4wcXZBNC9zZkNFeUFraEdzUDVSL1NYOTZCZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F31F05CE0A9D714C85C06D0B1851FA2E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e82f67a-71e1-42d2-2a86-08de64bc9278
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2026 13:43:40.6569 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tIxPaQlZ9cNo3OxYfILOvVuSEGrQ0khul8dh1F93wIsI5KyDkREqMuGDgtf9Ep4TeaBoJgYm3ABjY6sV4LnymA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1FF629472
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

T24gVGh1LCAyMDI2LTAyLTA1IGF0IDEzOjUwICswNTMwLCBTYW5qYXkgWWFkYXYgd3JvdGU6DQo+
IERldmljZXMgbGlrZSBDUkkgaGF2ZSBHUkFQSElDU19WRVIgPj0gMjAgYnV0IGRvbid0IGhhdmUg
Y29tcHJlc3Npb24NCj4gc3VwcG9ydCB0aGVpciBQQVQgdGFibGUgKHhlM3BfeHBjX3BhdF90YWJs
ZSkgaGFzIG5vIGNvbXByZXNzaW9uLQ0KPiBlbmFibGVkDQo+IGVudHJpZXMuDQo+IA0KPiBPbmx5
IGFkdmVydGlzZSBIQVNfTk9fQ09NUFJFU1NJT05fSElOVCBmbGFnIHdoZW4gdGhlIGRldmljZSBh
Y3R1YWxseQ0KPiBoYXMNCj4gZmxhdCBDQ1MgYW5kIHRodXMgY29tcHJlc3Npb24gY2FwYWJpbGl0
eS4NCg0KSXMgdGhpcyBjaGFuZ2UgcmVxdWlyZWQgdG8gZml4IGEgYnVnPyBTZW1hbnRpY2FsbHks
IGl0IGRvZXNuJ3QgbWFrZQ0KbXVjaCBzZW5zZS4gSWYgYSBkZXZpY2UgZG9lc24ndCBzdXBwb3J0
IGNvbXByZXNzaW9uIGFuZCB3ZSBwYXNzDQpEUk1fWEVfR0VNX0NSRUFURV9GTEFHX05PX0NPTVBS
RVNTSU9OIGR1cmluZyBCTyBjcmVhdGlvbiwgSSBkb24ndCBzZWUgYQ0KcHJvYmxlbSB3aXRoIGl0
LiBZb3UgY291bGQgb3B0aW1pemUgYW5kIGFsd2F5cyBlbmFibGUgdGhpcyBmbGFnDQppbnRlcm5h
bGx5IGZvciB0aGlzIGRldmljZSwgYnV0IHBhc3NpbmcgaXQgZHVyaW5nIGNyZWF0aW9uIGlzbid0
IHdyb25nLg0KDQo+IA0KPiBGaXhlczogNzhkOTFiYTZiZDc5NiAoImRybS94ZS91YXBpOiBBZGQg
Tk9fQ09NUFJFU1NJT04gQk8gZmxhZyBhbmQNCj4gcXVlcnkgY2FwYWJpbGl0eSIpDQo+IENjOiBN
YXR0aGV3IEF1bGQgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+DQo+IENjOiBKb3PDqSBSb2JlcnRv
IGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCj4gQ2M6IFN0dWFydCBTdW1tZXJzIDxz
dHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFNhbmpheSBZYWRhdiA8
c2FuamF5Lmt1bWFyLnlhZGF2QGludGVsLmNvbT4NCj4gLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3F1ZXJ5LmMgfCAyICstDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3F1ZXJ5LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYw0KPiBpbmRleCAzNGRi
MjY2YjcyM2YuLmMxNTJlYmZiZDdkOCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3F1ZXJ5LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMNCj4gQEAg
LTMzNSw3ICszMzUsNyBAQCBzdGF0aWMgaW50IHF1ZXJ5X2NvbmZpZyhzdHJ1Y3QgeGVfZGV2aWNl
ICp4ZSwNCj4gc3RydWN0IGRybV94ZV9kZXZpY2VfcXVlcnkgKnF1ZXJ5KQ0KPiDCoAlpZiAoeGUt
PmluZm8uaGFzX3VzbSAmJiBJU19FTkFCTEVEKENPTkZJR19EUk1fWEVfR1BVU1ZNKSkNCj4gwqAJ
CWNvbmZpZy0+aW5mb1tEUk1fWEVfUVVFUllfQ09ORklHX0ZMQUdTXSB8PQ0KPiDCoAkJCURSTV9Y
RV9RVUVSWV9DT05GSUdfRkxBR19IQVNfQ1BVX0FERFJfTUlSUk9SDQo+IDsNCj4gLQlpZiAoR1JB
UEhJQ1NfVkVSKHhlKSA+PSAyMCkNCj4gKwlpZiAoR1JBUEhJQ1NfVkVSKHhlKSA+PSAyMCAmJiB4
ZV9kZXZpY2VfaGFzX2ZsYXRfY2NzKHhlKSkNCj4gwqAJCWNvbmZpZy0+aW5mb1tEUk1fWEVfUVVF
UllfQ09ORklHX0ZMQUdTXSB8PQ0KPiDCoAkJCURSTV9YRV9RVUVSWV9DT05GSUdfRkxBR19IQVNf
Tk9fQ09NUFJFU1NJT05fDQo+IEhJTlQ7DQo+IMKgCWNvbmZpZy0+aW5mb1tEUk1fWEVfUVVFUllf
Q09ORklHX0ZMQUdTXSB8PQ0K
