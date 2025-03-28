Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7F6C28B20
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 15:32:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F321D10EA50;
	Fri, 28 Mar 2025 15:32:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nzFGKJGR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE7AB10EA50
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Mar 2025 15:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743175934; x=1774711934;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=GQmpykjsmdj44703C5b692Piet3LhYluwxZ7B80lNbo=;
 b=nzFGKJGRY9Kmi9nacytq6Vhu6hFAzvSzvejaNcn/xQn1M2qIIX+DJJVO
 NegjeW/RHNtEBo4S66Qp2xZTFLId4cNXb3tn7HterAsu5XVwU4KLqREjM
 ni+Jyf+Vtat3yvVYjhBshpPyNceLEacHkQB1DlSs2veULPn86PuVQQ8ej
 0gn3uVSxCh3TkZjFc7eRw3kl7YNUQpVbJUmmc/JBdrIwbSyMeWQesthTC
 3u9sxENQRsi8PCzPB3twVIRiNtYxDMIGAh29C6EMpxWZH4C8QWPff1Y+v
 fMdi3vpCQ8xEnDJ+hwSkJQ52ABDKWi7zhi+ccVbTxTjDypzvIO/IDEMWU A==;
X-CSE-ConnectionGUID: QoVIUvquR/SOsU9tuy8i6w==
X-CSE-MsgGUID: v8n2/1bjRBG1/LGrbdCIqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="44426479"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="44426479"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 08:32:08 -0700
X-CSE-ConnectionGUID: zRBqyD1kTF27YyOTPDER8Q==
X-CSE-MsgGUID: 3lURLcfPSWiF3WE45Nqvlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="125480133"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2025 08:32:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 28 Mar 2025 08:32:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Mar 2025 08:32:07 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Mar 2025 08:32:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L8jMpr9TAtQZ9ZTWZmqk70P12s0/vukLWdvEZ2ju4bnTgBd0LP1IdsJSVbh90sP1iQl7avOdR+MPxzXpIVvFvMXsHdShw3ACz1hpVyC/yQaa0NLr2pC9YE8SvrKreOadsEO1zxBsZNdacsyedf8As5Cykdx7vwzNEkGbn2U0pDV0XBCHLoKar5yrAYSN6HsL9TsRW9kRUiHUR2nzX2dStDn25SK7Q+qA1cxkwczq+Hx46bhBp34+PEv/0HsOFk9/CDbPm0l844V8ZHmwa5z4h1z8jA2U7MwraZmZCRCdbs9Uhsrn7khDBp9r4MtCM7tU/1sLziyfQLwe2S5T0NCGYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQmpykjsmdj44703C5b692Piet3LhYluwxZ7B80lNbo=;
 b=Hlc+0k1z6diNUqnakI+5DuZWHKAVO1pbs6AnZkoLBtxqfBcfn4MA3Wfr+Uwx54bXo/Iui7xXsEYwrIFWw+/Wlcw0erGQn2rWImBvJX7r8jaYPKmGx0He5HlAAxLfNa4zO6eK9zbcviLuug9v/yPLeGog1DWofHgXU/62fASE6J6UJBKZTMlRE5ttpAak+6PZ8QE+2SzEdv1XEBn9fI8P6tWlgMTiAAemcMrG272LKKgZIpCEPj+Qe6d1kv9QS2YBCpgWMkQJsGDIiG1fy3t6HQW0RAKkIumDW4zwvZebGtfQsKsdGPTmrm3JSJ1XHh5mcQ6aGp/cuMOzQzeiwF4Eug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DS0PR11MB8719.namprd11.prod.outlook.com (2603:10b6:8:1a8::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.47; Fri, 28 Mar 2025 15:32:03 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 15:32:03 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Harrison, John C" <john.c.harrison@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Use drm_info for hwconfig missing message in
 execlist mode
Thread-Topic: [PATCH] drm/xe/guc: Use drm_info for hwconfig missing message in
 execlist mode
Thread-Index: AQHbn1XvZP6f0rlg2U66SyFDK7IEX7OIEVYAgACdGAA=
Date: Fri, 28 Mar 2025 15:32:03 +0000
Message-ID: <739e74355fddd921ca57048f823c4f9a26c7e528.camel@intel.com>
References: <20250327202201.15169-1-stuart.summers@intel.com>
 <6vlzyhpdhjxfcehffgv6l7pntehzyyabxn3dr2dduraucoe6pz@wia344kqg3z2>
In-Reply-To: <6vlzyhpdhjxfcehffgv6l7pntehzyyabxn3dr2dduraucoe6pz@wia344kqg3z2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DS0PR11MB8719:EE_
x-ms-office365-filtering-correlation-id: 6ea99af9-1709-4f3d-15a7-08dd6e0db0c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SlpvQUlQRWxwVkVPOHRTUm0ydzVKY3dFMENlRVBMZjFaYkF2OTN5ZUJpRnlD?=
 =?utf-8?B?NTNsbE5obU9hUEJOMEJtUEFEck9ZZG5hMU5uQjZIbWh2bWkrdElEMFR1M1dY?=
 =?utf-8?B?bWFzYlppU3NjWHZyTUgyWXpFK0FHTWxYMi9NZWovSFJwd2hPQkN3V2YzZ0J1?=
 =?utf-8?B?M1o5VWVMVjQwTlA2Q2w4cFY5M05lZjZTUXFQalh0VDh1NGZiUUhSRlBqYzlu?=
 =?utf-8?B?bDJ2ekZzc1I3VlRrRk1KN0k2VkFqdjJhNERzRmZBTGF4ZTN1N05SWFB2OTZz?=
 =?utf-8?B?R2JZdmJpeTJlSWRLd0ZlUUhOTGZhSnQ2Q1NLdmEwZFN6dUNDaEROOW83K2Rs?=
 =?utf-8?B?ZVBuWGlsMmc3dC9LK2Y5QjJJTzZzWVpUY0t2aHJ6MEdEWkYzM3ZQa2VUSitY?=
 =?utf-8?B?SW5SVVNGcHdVaUtFZ1lHNTZYT1drWnlkT0laUHEwR092MFMweGRlbW1GUUpH?=
 =?utf-8?B?SGV6bHB5RVZKbWx4aHlWNkp1YVlrZmZJUWpJWm1VMXh3QUN1Q1hYZ0pHdEFL?=
 =?utf-8?B?SXYxSHlPcFE0RzRIcTJwdVJhV0dOczVQYVF2SEliR0NOZmNpNmpOWGl0Rjdj?=
 =?utf-8?B?cGlyZ3ovWlBncW5OemM4Zld3dDBaMVRrM2tySjRQaGdTa1ByOGI3MEJKY2FJ?=
 =?utf-8?B?S2QxWVEvWC9ZWkc3YXR0RGtoU29pRGYrYVJidXU4dCtHbCsyb2d6RkppdTBV?=
 =?utf-8?B?TjNOSVlYSG5icGx2Q3Fyb2FCQTdTc09JRFdOcnBxMEdaYURlS3hnVnNUZTEv?=
 =?utf-8?B?S29WTUdRMFFibEUwRHg5MldJZ0FlK1F0K3VXTTFVS1ZRWThIYy9QT21SYVly?=
 =?utf-8?B?bm4zMEh5ZFl6MDBkSTJieU0zZmhDeEtoZjVXY21GYTRvREEwR3o0UkxUek5I?=
 =?utf-8?B?blU0L1ZXK2JUSEJKYUpKcVVLTWxQdDFoZVh6cXFlV1ErQUdHS2o0S2YydlB1?=
 =?utf-8?B?dlhYc1MzclJVRjkxNHJYUHY1NkRiY1dMcXVTb2wrVnFJb0tlZ1hiNzJTc1Vq?=
 =?utf-8?B?NGpKNUtzUzBwTjZWY0ZiMTd6VjBlWHUwR2tuVHNiTlpVeUVkcStkYWNmTDRu?=
 =?utf-8?B?UmkzWWdqWDZjL1NZM2V1ODhkV3pXM1NqdnYrOHQ2bGx2aWdjYzVRV0pMVnJQ?=
 =?utf-8?B?MnRYZXc0b3hBdjVuUVBVdGYzZTR2aGNyalZhK1N4U09ZUGFZZW9xTXN4c3Yy?=
 =?utf-8?B?NWs2VjUxQWt3Z1d5VmExcWxrbWtXdUp0M0UwQVZnYlNnYVhRR3lFdWZWVWlw?=
 =?utf-8?B?a2ZvQ0JIMiszTnpGcmFHbWEwK2RLWXprMnZTS1dhcXowV2V4WWx6YWkvNmRE?=
 =?utf-8?B?bjJGMVVnSzZpZ1JEVVJBRkZQU3lFRmRNUlV6cXI4dGR1RzMxcDhqZ245bGxW?=
 =?utf-8?B?NUNZTDFKOHRkMzFLRGw5b2F2cjNwWmRrNTNWY2hXUFhSQkE1UHAxc0w3c1hk?=
 =?utf-8?B?ME94clZVbE9NQmhBWEVlRjNoaHZXTGNpdlIyUnBYQURBODF4SkpBc1hhQ0JP?=
 =?utf-8?B?RjIwb3VxT1NlaTV0SENwdjBjbFladDFJbms2cm9HcldqR0g4TVlpbFhaRGs0?=
 =?utf-8?B?ZU1vZkdzaUhoaldHNisrLysvUFFlSGd0Q0NocGNoeHo3VnVSN1NIeHF1bjJD?=
 =?utf-8?B?M1JYWjZNbDRxTU51MmNhMFBta3E2SGszWUtrL1BET0pZcC9ObTFNaHFuZjE3?=
 =?utf-8?B?emlsYTBrbFV3dm1rVWgxVWR1UmlDWkFxT05Sbjl6bzRrbGZLZ282RENJWHlG?=
 =?utf-8?B?dEpTbFQ1RFBKbVkyOUlQc3hkT2NXWDlYSFlwSUVrTlY5Um1rM05hbWpoUVB6?=
 =?utf-8?B?QlFnZHlHRE5UajVMK05PbVg3SzVoaTJPanM2K3hXcnlUMEFuQnh2RUtrRGNR?=
 =?utf-8?B?ci8vcmg5SUJWRXZpM1hWK05rcE90ZVpVUkp5dURvc2VIQnpwK3JKMXRjUWZR?=
 =?utf-8?Q?BHdFJoG16cwvyUBcl8411oK4JDY/wv6R?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Sml6Y1VFZmpuRVJoRWwwUXdiNDdqczRQeVJuY2srUFdqbmhhMTU3UFNVazYx?=
 =?utf-8?B?eHJrRkpPUHE1OHZDcnRxRE11aTRnWERsc0o1QmNQcXJmbm54QXdsZkpucmk1?=
 =?utf-8?B?aXJDU0ZZYzZkV0xzR1BENDRQT3c2Zi9uZmxSZjcvVm44L1k0a0NRdTE0cE9W?=
 =?utf-8?B?Y00zVTVMMWdlWmgvUWN1QmU0REFtU1FQdE5aazM0Q21jWHEyNlN4SkRtZWFa?=
 =?utf-8?B?dWJYVE90cnVlNVhuRmdkR1I2VldMczN5S3pkNkdEUWNkZTM4ZHV4ZWNHSlh4?=
 =?utf-8?B?Uy9DVzJ4YTJKZU5XenBGNmRKU0o3OG1WT08xaWFNeFFsVUU3N3Z0cUNCWU90?=
 =?utf-8?B?TzBsMnlEWll6QkVBUXJnS1VycmZFdE50N0liR1c0VkxzRU1ld2svbVFnNnM5?=
 =?utf-8?B?aDNsVlkvVDNGMUlQcFQ1TkFuWHArT1JGTEN4NExyYW1WZHM1R05YeGUrQlN0?=
 =?utf-8?B?VklUb2NSNXMxZHp5NVR4Tis1dDJFQ2E0NHpENlNHMktUaWZpdWFMa3hxeEh5?=
 =?utf-8?B?bzFEZGJsL2tJS3B5aFZmblVzZ3RRMlBhdzhJMUtOTnpjOTlHRlFSNzJpak1W?=
 =?utf-8?B?czVXbHZjTGwydzlTMjJ4YXQxWThrdmUyakdldXp1VVlqTXJXL2xMVnRxb1VY?=
 =?utf-8?B?Q2MybHV6VjFlb3AwQkdpazNNbEo4Q2RFaEVSS1ZwR1hxcnNoRER3c09BbjFU?=
 =?utf-8?B?VXM5bElLTkQrbC9vcEVabThORkNuVkxYTTBVYkZKNWJXRFJ3WHFMcEJ2QkNL?=
 =?utf-8?B?NDhQZWFyTzZkR3BxS1FGTFBGdHRtbjR3dHF3cjBpMHN0WkdqQ3VhdFNreHlP?=
 =?utf-8?B?Q0pkUUdLejdxeENEYTl5QVpFcGQ0WWJYK0hHWWpvTkRVaEdXR2ZEZzJIa0Vk?=
 =?utf-8?B?OWdUdXVWSVBNcU1mSitYa0R2Q1lvemxXSG9LVHdBL0c0UXFWOStIZnpOaUtK?=
 =?utf-8?B?dnZEcDJlYkg3RlRjMTFxdWJWM1NGRVlELyswNlp5RmtuSDB1d09FdW9aWVNn?=
 =?utf-8?B?MUViU3ZCaW0rajBqbE9PMDFHWVdkMUNUWEN4VjF3aStOYlNvbmVBY3pYNVhL?=
 =?utf-8?B?MjNpRTM3OHQyclVRekZjSkRrWEtLVVJTNElOTURlQTFnN2dFVXpyazFVYUgr?=
 =?utf-8?B?U2JnRkNsNFBJeXVKelE0ZFFVQ20xc3JQbXIzNE4yc3NpaHFkb1htaE1NMkEw?=
 =?utf-8?B?UFdDZ2ErYkpXZ3E3RFZIOUhUM2NicUtlRzc4clNJMXU5QTIyUDJUS2h3UGd5?=
 =?utf-8?B?QWRpUVpEcTA2OWFPeC9kNHJWRTB2RGNML0tPYmZzRk45MmZUSVdhcU5pUkFW?=
 =?utf-8?B?RTdMNGc0cGVISERxSmRiUmwyMGNlY2FNNytybW0xOU01RVE1OVZST1NYOUlU?=
 =?utf-8?B?eEtkN3l3Y2N1K1dlREphekFrdzBOZkw4TFAzemZUd1l3R0RGL00vN1NpUStH?=
 =?utf-8?B?bHpXMmxYd3EzV0YzT09HUjhOV2YvV2VOcTBRcUp6dG1pU1N2OW1MNE94SjN1?=
 =?utf-8?B?NlBCeUt2WkZLNlcyT2o5eGxXaExEUkI2TlBRdE1LNllxVisyQ2I5bzIrN2tR?=
 =?utf-8?B?cWRWN2p0eWZSeGptQU5wL293aXBvSUJDNmZFbk02MWtMNGcvc1RFOXRTNGhN?=
 =?utf-8?B?UUFSNnFUQ0ZyWE04RHNsM1RPVUlHYWQ4SzNQcVEzOVhBS1pGSjVZbWNPS1c3?=
 =?utf-8?B?V1FyUHkxZFdrVkRnc2lzMUw0ZlhrTEc3TE5UTlFUVy9PanFuTFNoZHR4b0ht?=
 =?utf-8?B?TkpWOWFnMWVKZE84Nm03T3VTMUJhY2Q2eFJMbHVWTitnMk9RQVFLelFjT2gz?=
 =?utf-8?B?NWZwMzE1ZUN4MlExb0dlWU1rWGNwUDlvM1pBZlE1b3JUMlVKdStQMGFWN2JH?=
 =?utf-8?B?bER0bU85dElJTVN0SGlVdUZMZkJFeDVocGxJaGc4TXJNM0dmY21hUnNGejZI?=
 =?utf-8?B?d0gyREY1eWlZNHoreFJBZ0pxTFZPZHZzYmk3a2VVTDJoZ25KSjlObFNQRUVZ?=
 =?utf-8?B?Z2V4YjJnTk4rUG51RmVzWjZOYU1vNWUxcU9EYmtHVDVjQ0VQQjVOaTlzMFQw?=
 =?utf-8?B?clM1QStuQy82L2RLRVV6M0Q0T0hHdnU3eTQ3YkFjd3B2UWplTSszeVowSGVx?=
 =?utf-8?B?MjNSYUZqWFdZYzg5WWpneVZZbjM4TWc0cE9tU3NPM0pKVUFUNEh1dXJPRWtj?=
 =?utf-8?B?WXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2F707D415BC5BC48A50C04B0CDC697AE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ea99af9-1709-4f3d-15a7-08dd6e0db0c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 15:32:03.5618 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wNuYth/jn/cfT6hT4Lt9nBiJs1Q7YF3GmrN4FxEg5QXhThgRGJJzig0v6AjZ+JiWX++5uhBzUzF5kI3LdfI7dwQx9ZzEPAj9uFaDo7TpVQw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8719
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

T24gRnJpLCAyMDI1LTAzLTI4IGF0IDAxOjA5IC0wNTAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
Cj4gT24gVGh1LCBNYXIgMjcsIDIwMjUgYXQgMDg6MjI6MDFQTSArMDAwMCwgU3R1YXJ0IFN1bW1l
cnMgd3JvdGU6Cj4gPiBXaGVuIHJ1bm5pbmcgaW4gZXhlY2xpc3QgbW9kZSB3ZSBhcmUgZXhwbGlj
aXRseSBub3QgbG9hZGluZwo+ID4gdGhlIEd1QyBmaXJtd2FyZSBhbmQgdGhlIEd1QyBpcyBuZWVk
ZWQgdG8gcHJvdmlkZSB0aGUgaHdjb25maWcKPiA+IHZhbHVlcy4gQ3VycmVudGx5IHdlIGFyZSBw
cmludGluZyBhbiBlcnJvciBtZXNzYWdlIGFueSB0aW1lCj4gPiB3ZSBzZWUgdGhlIGh3Y29uZmln
IGNvdWxkbid0IGJlIG9idGFpbmVkIGZvciBzb21lIHJlYXNvbiB3aGljaAo+ID4gaXMgYnJlYWtp
bmcgdGhlIGV4ZWNsaXN0IHNwZWNpZmljIENJLgo+ID4gCj4gPiBLZWVwIHRoZSBlcnJvciBtZXNz
YWdlIGZvciBub3JtYWwgR3VDIGJhc2VkIGxvYWQsIGJ1dCB3aGVuCj4gPiB0aGUgbW9kdWxlIGlz
IGxvYWRlZCB3aXRoIGZvcmNlX2V4ZWNsaXN0PTEsIGNoYW5nZSB0aGlzIHRvCj4gPiBhbiBpbmZv
IHByaW50Lgo+IAo+IGJ1dCBkbyB3ZSBhY3R1YWxseSBuZWVkIHRoZSBpbmZvPyBpdCB3b3VsZCBi
ZSBzaW1wbGVyIHRvIGp1c3QgZHJvcAo+IHRoZQo+IG1lc3NhZ2UuIFNlZSBiZWxvdy4KClllYWgg
SSBhZ3JlZSwgbWFrZXMgc2Vuc2UuIExldCBtZSBwb3N0IHRoZSBjaGFuZ2UgaGVyZS4KClRoYW5r
cywKU3R1YXJ0Cgo+IAo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1
YXJ0LnN1bW1lcnNAaW50ZWwuY29tPgo+ID4gLS0tCj4gPiBkcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3RfbWNyLmMgfCAxNCArKysrKysrKysrKystLQo+ID4gMSBmaWxlIGNoYW5nZWQsIDEyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3RfbWNyLmMKPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X21jci5j
Cj4gPiBpbmRleCA2MDVhYWQzNTU0ZTcuLjUyZWUyZWFkM2IxNyAxMDA2NDQKPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9tY3IuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2d0X21jci5jCj4gPiBAQCAtMzQ1LDggKzM0NSwxOCBAQCBzdGF0aWMgdW5zaWduZWQgaW50
IGRzc19wZXJfZ3JvdXAoc3RydWN0IHhlX2d0Cj4gPiAqZ3QpCj4gPiDCoMKgwqDCoMKgwqDCoMKg
ICogU29tZSBvbGRlciBwbGF0Zm9ybXMgZG9uJ3QgaGF2ZSB0YWJsZXMgb3IgZG9uJ3QgaGF2ZQo+
ID4gY29tcGxldGUgdGFibGVzLgo+ID4gwqDCoMKgwqDCoMKgwqDCoCAqIE5ld2VyIHBsYXRmb3Jt
cyBzaG91bGQgYWx3YXlzIGhhdmUgdGhlIHJlcXVpcmVkIGluZm8uCj4gCj4gLcKgwqDCoMKgwqDC
oMKgICogTmV3ZXIgcGxhdGZvcm1zIHNob3VsZCBhbHdheXMgaGF2ZSB0aGUgcmVxdWlyZWQgaW5m
by4KPiArwqDCoMKgwqDCoMKgwqAgKiBOZXdlciBwbGF0Zm9ybXMgc2hvdWxkIGFsd2F5cyBoYXZl
IHRoZSByZXF1aXJlZCBpbmZvCj4gK8KgwqDCoMKgwqDCoMKgICogd2hlbiB1c2luZyBHdUMuCj4g
Cj4gPiDCoMKgwqDCoMKgwqDCoMKgICovCj4gPiAtwqDCoMKgwqDCoMKgwqBpZiAoR1JBUEhJQ1Nf
VkVSeDEwMChndF90b194ZShndCkpID49IDIwMDApCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgeGVfZ3RfZXJyKGd0LCAiU2xpY2UvU3Vic2xpY2UgY291bnRzIG1pc3NpbmcgZnJv
bQo+ID4gaHdjb25maWcgdGFibGU7IHVzaW5nIHR5cGljYWwgZmFsbGJhY2sgdmFsdWVzXG4iKTsK
PiA+ICvCoMKgwqDCoMKgwqDCoGlmIChHUkFQSElDU19WRVJ4MTAwKGd0X3RvX3hlKGd0KSkgPj0g
MjAwMCkgewo+IAo+IC3CoMKgwqDCoMKgwqDCoGlmIChHUkFQSElDU19WRVJ4MTAwKGd0X3RvX3hl
KGd0KSkgPj0gMjAwMAo+ICvCoMKgwqDCoMKgwqDCoGlmIChHUkFQSElDU19WRVJ4MTAwKGd0X3Rv
X3hlKGd0KSkgPj0gMjAwMCAmJgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCAhZ3RfdG9feGUoZ3Qp
LT5pbmZvLmZvcmNlX2V4ZWNsaXN0KQo+IAo+IC9tZSBzdXJwcmlzZWQgdGhlIGRyaXZlciBpcyBu
b3QgZXhwbG9kaW5nIGluIGV4ZWNsaXN0Lgo+IAo+IEx1Y2FzIERlIE1hcmNoaQo+IAo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNvbnN0IGNoYXIgKmZhbGxiYWNrX21zZyA9Cj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCJHVCV1OiBT
bGljZS9TdWJzbGljZSBjb3VudHMgbWlzc2luZyBmcm9tCj4gPiBod2NvbmZpZyB0YWJsZTsgdXNp
bmcgdHlwaWNhbCBmYWxsYmFjayB2YWx1ZXNcbiI7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgc3RydWN0IGRybV9wcmludGVyIGlwID0geGVfZ3RfaW5mb19wcmludGVyKGd0KTsK
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZHJtX3ByaW50ZXIgZXAg
PSB4ZV9ndF9lcnJfcHJpbnRlcihndCk7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgLyogSW4gZXhlY2xpc3QsIHdlIGRvbid0IGxvYWQgR3VDLCBzbyB0aGlzIGlzCj4g
PiBleHBlY3RlZC4gKi8KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoZ3Rf
dG9feGUoZ3QpLT5pbmZvLmZvcmNlX2V4ZWNsaXN0KQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkcm1fcHJpbnRmKCZpcCwgZmFsbGJhY2tfbXNnLCBn
dC0+aW5mby5pZCk7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZWxzZQo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkcm1fcHJpbnRm
KCZlcCwgZmFsbGJhY2tfbXNnLCBndC0+aW5mby5pZCk7Cj4gPiArwqDCoMKgwqDCoMKgwqB9Cj4g
PiAKPiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAoZ3RfdG9feGUoZ3QpLT5pbmZvLnBsYXRmb3JtID09
IFhFX1BWQykKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIDg7Cj4g
PiAtLSAKPiA+IDIuMzQuMQo+ID4gCgo=
