Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80DBECF34C3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Oct 2024 20:57:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F7710E1CD;
	Thu,  3 Oct 2024 20:57:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cC8gaew8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E1210E1CD
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Oct 2024 20:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727989071; x=1759525071;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=h3tU2fKEsLioVPb8WgMwFuEKMEvlPeJOdOxuby3SA2I=;
 b=cC8gaew8eHsI41r9yxUqCV5sdS2RwGac0NrGgfqFJhN0ERAtk73kMiLh
 RJSB6D3+D5XrDkz6b1AGDS5DH5A7S1j3Gmj/ZgDomZZHJodH7TFxnMGuy
 FBV84swfsp56pBF5PVArpMjMfh1KdUIH8zAYzVEOGSRvKgy97N2sC4+92
 8YOowZ2CR3CqB96malTFWE84qAvsHk/rbbeJ98b9FjAmyvXlGjtMAOm8W
 7L+HdBNM72wTLBjuIucwm7PIjrXMFxU5m5wiKqq+WgaekNVpWtBHSxgmu
 Dt0GJNPjKmJY37KBx6glEXwCDZfex9or2y5JsBLDbK0+s4jK6ggWXCfZA Q==;
X-CSE-ConnectionGUID: hVzSgJJVR62eqrfrQEmHEA==
X-CSE-MsgGUID: 0trv61mfTP60NPjX+jEHTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27090138"
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; d="scan'208";a="27090138"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 13:57:51 -0700
X-CSE-ConnectionGUID: 3nJkzwpCQ/apJIEY9f0G9A==
X-CSE-MsgGUID: Vs+AG5LfQvSyl9tHnzw+lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; d="scan'208";a="79447126"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2024 13:57:51 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 13:57:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 13:57:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 13:57:49 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 3 Oct 2024 13:57:49 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 3 Oct 2024 13:57:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bvr+EFR/b1P7poFTGCKma/7KIdPj23vVN8wclX05ZJooKhJzF6Yf1AmZrUOH5nCPFDqt/UcE7Z1wS7LKrGCeiuyFe9BmqIW/n8+QKNk0RRdmGeEDtdZPALTm24Xk6s+VDLpLY7KDR/ayKxx+jZrShbVvS/n+I3YyEre9pNjwxu9RpxKYfO+VedzHzik4qtC1okWBtiemDhkYWHZjpbSDxOINlcgITTADvbvS//11zGAQaPfmLywPhpWtzE560tXgMzSf9dRLdFTbW2ww4EsfI2JOiqJbCBdBNxkcpks6Dx0I9pFoWPBpvrT50FOEPD7HQPNAUo9/aYtZ+zsShb+j3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3tU2fKEsLioVPb8WgMwFuEKMEvlPeJOdOxuby3SA2I=;
 b=FCW7cFcKi8cFDGy5kDXQA9w4Y3LFr+pbFyLxDwEyJNF1/ff/lwL3/WYiBix2HiDqPVamoJjtpdlB5s9SH0q6GCE9IO0IAmk0dzc5UEbs1heZH+KbFcISKfwWwW8joBNCUNRXyrYS/MT9uuXRGrKnc1jZ419BzP+rbmvA4OxIilsLGvBSuiQ78SBc5V9v4jgJbtEC1kfPRBFXkuqvjkQf5vgewXorzVRLLN7cvIXpIzKgQm8pKtuUzgeo/IrZ7c7lnEapPjBRQWu84mKZq3bGR+z16Hg86jY2xbX4RoLBcRiL5DQOiXr+HAN3Lx1KrMFxG3pAexonPJ7kOiIrG/bdKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CO1PR11MB4836.namprd11.prod.outlook.com (2603:10b6:303:9d::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.18; Thu, 3 Oct 2024 20:57:46 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%5]) with mapi id 15.20.8026.017; Thu, 3 Oct 2024
 20:57:46 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v26 4/6] drm/xe/guc: Extract GuC error capture lists
Thread-Topic: [PATCH v26 4/6] drm/xe/guc: Extract GuC error capture lists
Thread-Index: AQHbFadPBPqINvE7FkGlGKGYsHY/EbJ1gnoA
Date: Thu, 3 Oct 2024 20:57:46 +0000
Message-ID: <6ebbd8a703734f51a39e4dcba6dd33997d8b9e6c.camel@intel.com>
References: <20241003151626.2901703-1-zhanjun.dong@intel.com>
 <20241003151626.2901703-5-zhanjun.dong@intel.com>
In-Reply-To: <20241003151626.2901703-5-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CO1PR11MB4836:EE_
x-ms-office365-filtering-correlation-id: 8a55eadb-48fa-49ac-2538-08dce3ee08b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?c1F6K3lhZG4rWHlUeUNuNUF3NkNLNUEzNUxSS1JHN2w4aGFsRkdPOTBaWER5?=
 =?utf-8?B?YzQ1UEplY3FWWVpkalE5YmdpZWdrOG0wU0hLYTJXa0czZ2ZRK3ZHU0NlQ0l3?=
 =?utf-8?B?bk1DTW9BcWVEVE9TdnFsd3U0aldLYURrOEM1WUQrVVJnTnhNOEE3M2tja05K?=
 =?utf-8?B?aXlST2t6Nm5zQnBvU29scDY3ckYwMFA1alArNWRWZURYaWF6eE1BMlJkTERq?=
 =?utf-8?B?dThjOVl2U3ErY3MvOUJvL0ZRNFlNcmhySGlrRmlVMmNwSnF4aURLNDFwM3ZH?=
 =?utf-8?B?SHoyT3N4NDU3Z2lXancyYXNrYW93T1JIelBWazlpSHh3ZnhTQ251U0U2UTNt?=
 =?utf-8?B?Qi9XT0REaThKaElnWnVOb2FQRk9hQW8yWExjTDJ1eXNOVHV4RDVKQVdTRlB4?=
 =?utf-8?B?cHMyVkFjd2ZvN25XNW1HeGdaR2JKUTRxMG51eE1iMkR3R0xGMTZwV2hEOGo4?=
 =?utf-8?B?V09oNlZZVVFQc3RXUmZmOUtLY3dyMTJyVkpKQXY2UkpVOGF4MVBNbE5tM3Vl?=
 =?utf-8?B?NkJvcmVRRUtpUWhOUGcwalFTM29Id0ZLMjl3WWMzZmpmVS9ONEhOQXhRNDNJ?=
 =?utf-8?B?bUtwM3Z6cE1XdExqZ2k5aE52YkVjR0JPc01aVjl6WUQ3Q1R6V0NzV3I0ZHpM?=
 =?utf-8?B?WUFDR3Mxdk1lekxWN010QUc0WkFESmlTZExBZ3pncXZ4NDJZK3J3WmErRDB6?=
 =?utf-8?B?RFBtbW9oZUxjWUFpSWoxdW04U09JaUhLeXAxT0VPcnZ0dHZYdmY3K21aYU5T?=
 =?utf-8?B?R1FZTWNmZjdJTXBsYUlGM3dvVG1HT0RybzN6MHo5YmFMcDVFRFUwTGhrQmZ2?=
 =?utf-8?B?OVlWeXpQQTFjR2VuTnpyaEhDYXBNWXZIdXBvMmNXMklYbERqTmFvam43QVJv?=
 =?utf-8?B?NUpBcnJmcVZrR0xHREx3aG94U0h3OW1oK2Q3M01hY1BnZFROV0wwOGJlMTZJ?=
 =?utf-8?B?Q2tMRS9vSWVBWGE1bGtaRXpvdjRySURibkdhdytqRG1qK3lxWVA3SmsvbWxB?=
 =?utf-8?B?anc4cFdTZXk3RzF0eFYxWVNRS0JxKzUwTkVTOFd2QVJDRlN3ZDViR2s0UVNn?=
 =?utf-8?B?WFpYQVZlRXk4bjBab3o1MXhjTW4yRU1pSU56QmxrTENGZjB1K29vNnlTYnli?=
 =?utf-8?B?VnFHSW1jb1JKM21sTEZaUEVvMWRxRTlERWhWNXAzdlljV2xWNXJJRVpmRXZW?=
 =?utf-8?B?MkduQVFqNHdOaGdRaUhGNVdJVUhIcTRQUnY2UnBPVUpUNXlhMFlOeDh6ejZz?=
 =?utf-8?B?dUNrUzJtU2tRRktlWno5NXdxUnJ6SE9DeW9wTjNVNnVhOEYxRm9xTU02bXFr?=
 =?utf-8?B?WTZncVV5c21MZzBFenJZM2lvQUJPdDA5OUFUcTEzN3NlbDhPU3BNbkh4cVlO?=
 =?utf-8?B?ak5zRC9EZWpqL2c0SVdPdnNhQnV3bXYzdEdhZ29RR2szSm1OMWp3emkyTklL?=
 =?utf-8?B?N0R0eTlGUUUwQ0cyOGgzTDJuZ25zUS9sNXdMMnZ6RVlCU2I1V1Z1RDhTN1VT?=
 =?utf-8?B?ZVZ4Ky8xUmpZYVZlN3pObjM4YUdQR2RBaVdxTnVsL1hiT1RGdUo0dzlHaHpx?=
 =?utf-8?B?K2Q3cHZjRlh6Qjc3ZXRPQ01tY2I2Nlp5MzljZk5JU2kwR3RMM3Q4ZXNqYkZV?=
 =?utf-8?B?VGFsd25yMFFCVkZGY294Q0N2dWFBbS92cVp2S3l4bTh1Nko3UENEVnQzMUxu?=
 =?utf-8?B?b0xGQlhDYTRzeFdQWWwvWTNYS1U2TTF6TGVDRW4xQWF6ZEpncnNDVUgxellt?=
 =?utf-8?B?QmhPMzFoamlicWc1am9uUmxuQ0wwVkdxUWN1ODFhVmJJbmJLT2ZFb3Z3b1Ra?=
 =?utf-8?B?bVJ2Qm9TeEtJaS8raGhIQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YWNqWFY0Z3dwc28yRDZSODZLamlSNHJpMWxuS3RQRzVLMFJKd0JyOHNaMzVJ?=
 =?utf-8?B?ak5CSytDVDRYaE1mbVFSaG9maGw5Rld2bzdNdytXTnJ1Q0FleFh3RkU3d1dK?=
 =?utf-8?B?bDZGRjBNTEJLY0VGOGllOFVpa1ZtcjJVbzlvbVNIZmh0WS9aSUh0NVZxMXZn?=
 =?utf-8?B?RS9RQXA3UjZPYjd2MktVZFhRejdPU3ZxY2p4OVJuMm85elgyVmczQjAwRGlB?=
 =?utf-8?B?ell3dncrbHNKNHNMbXQxc3JueDI4QnFyU2tpR2JudlgzL0R5S0M4L1d5eW4x?=
 =?utf-8?B?UkwyMHRzdVR0MUY1ZHNWNVduQ2pCQWpCcnF5Y05ia09SQzh6SE1yc21MVjFO?=
 =?utf-8?B?WU1kOVY4b3BOcGtMOWdBSGhITDZSMWlMYWNiN0ZtUTBUSTM2Z2Z5U1AybTI4?=
 =?utf-8?B?VUtzczhLWjNycnpWaVJFTnMzcVloOFJvdVpqa09UalF3NFFSY1lHN1B0djJw?=
 =?utf-8?B?K3g0NEhaMHhuUEpwN29vNWxEelNzWmVGcElkZjlXcEFybFE3SUN2NUViRnF4?=
 =?utf-8?B?M2g2NGN0K2REQmhkWlFGMHhpUTV0NWRFMmMvSXBubUxDSWtRci9UVFExaTZF?=
 =?utf-8?B?aE9nOEFaUDJDdm81T29iNzg5R0VHdUZqTmRuR2FaVWhuNzc5T0dTbFMrZXFL?=
 =?utf-8?B?QXp2dkp3NHBsMHpLYkxYQXVPS1Q5UmJTMnlFRENDUGpCdDljSmRWaTJPL0Ji?=
 =?utf-8?B?cktFelY2SkVtSGVQb1drOUdYWklBQTdwRHQ1Sm5Yc01xRUhOSm03OHE5eFgy?=
 =?utf-8?B?L2h2ZVpPRElrNVZEczBPZG5INHJUUVFwK2FQaVo5ckFyTVVtcDV1Q2VZVHFY?=
 =?utf-8?B?eVdWOHlKVkw2R2hQREd3aXlqWWtWVkpRZnJNSk9NUVA5S1lyZ00vbUVEekRo?=
 =?utf-8?B?eE1vRXpvOWVpYUR3aWtFL0xMejRnUjM1MDlFMndITHh4S1BPMnNpajFJR0k5?=
 =?utf-8?B?L3ZGRk9aOVViQWF5dm5FUWJDK3NyNUJFblN1UHA3czlIdlo1cjI2bjZGZUJm?=
 =?utf-8?B?REZQODZhT3lSZ0Z1SnU0RnNrb1dtNWNWYU9VdHRYcEx6NGVxZDE0dHNqSEls?=
 =?utf-8?B?YUlERm9SeVVieUdFUXltb2NLVmZHVDViTnF0L0liQXpYVVlBMFc3MWswME9T?=
 =?utf-8?B?RWYydnltOW1FWmg5U1A5alMrVW1QQ1JBaWs5TEpsVGNyWVg5dlplMnZ6bmxl?=
 =?utf-8?B?Q3FYWVJ2eVJobkZGUWRkek1YRUV4WFgrbTRIL1RVUDg0dzhFdHM5MkxrRnNM?=
 =?utf-8?B?dXM4anNPZG5ndzlJQ04vWm5rQkowclZBSzVzRFQ2NEdDYWd6QXZVYVJ2cm1i?=
 =?utf-8?B?cjdtQ1hTWHdEazFSZlMrbTBLNDdER1FqUG8vTWZtMVc2UzNtYzlGd0crWm1R?=
 =?utf-8?B?cTZrWEh2RkNaMG1KakpmTlY5SHNtc1BNV3hBVEswK0NvcWMyL2ZqZEQvZnI0?=
 =?utf-8?B?MEpRSnhPYXROQUNHWWhVT1hiZVI0QUJ5OVpCTDJWMHBFbjBTREk3UTl4Y2tR?=
 =?utf-8?B?dGwyMll0U1JFUzl1aVhWeVNwdEhRTEQ0TGhsM1llYjczNzUxZ2RWNTlGcEZF?=
 =?utf-8?B?VlVQSkNVenZvM2k4c1l2Y2NUVVRLQi84NGFPWkNHNHZkOTRkSmg5TUt6SUV6?=
 =?utf-8?B?cXNtYWczc2I4MHJYbUQ1eDFXa0kxejN1N3cwcUlJNWxoVTNFVWJBK21ydW9r?=
 =?utf-8?B?enp5aHI1R3UrU3BsMnNoOUtRdVUrWHBCUHozVDQvSExWWjQySEM4bVRaeG16?=
 =?utf-8?B?QVBjQlZTTHZaajdIUWlOa3d2R2kwU01JZTdSL2JtQW5tY01NckxiVXQvNUhU?=
 =?utf-8?B?SlpKK1lEZHhjVWNYNHlHK3FZSElCUFlhMWI4NStBakNVUjdQSlRvNnFZVW1z?=
 =?utf-8?B?dGF3Q29FempyZnc1ZnVhQW8zeUU3WG9iYVJ1UnVVZVJvRkdFVHRsbzc3MkQw?=
 =?utf-8?B?a3B3MERVRjcrdFpXUzB5Ym5wNDZBSzkzMDRQS291QTlXUG8rOHRhQW5iRDVy?=
 =?utf-8?B?RWF5SjYxZlhrS2hDRmlJdzYyWld3NHpJbkFUV1RST2UrN2lKOFVFd3ZyTXA2?=
 =?utf-8?B?Z3lNY0VWSGFqRnd0SkhmcWpQMVdWV1MvVWIwNW9xYk1lQkVnbS9QeFlURzQw?=
 =?utf-8?B?dDZveitYU0NxRlBKT202cmtvUlJYOTdSU1h0U2NwS0lqc202WmtHb3JrOGtV?=
 =?utf-8?Q?DrPFeXytOiCqTIsui5oQeiw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <94A608BC24D7FB4B8FB0178ECAE348A3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a55eadb-48fa-49ac-2538-08dce3ee08b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2024 20:57:46.6737 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dEico/fJ2vx8wewtADFa/sqyS9SNK4yCHzsuX+D57YFITMobDYuI9eseRjhTXj2q24x4J9Z7gHHKebX7sitdKNW9gqH1LiwZQnuGj/y7aOSwFI9FO9Xaj6cQahd78Pxx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4836
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

SSd2ZSByZXZpZXdlZCB0aGUgZGVsdGEgZnJvbSBteSBsYXN0IHJiIG9uIHRoaXMgcGF0Y2ggYW5k
IG9ubHkgZm91bmQgYSBtaW5vciBuaXQgd2hpY2ggeW91IGNhbiBjaG9vc2UgdG8gaWdub3JlLgpU
aHVzOgpSZXZpZXdlZC1ieTogQWxhbiBQcmV2aW4gPGFsYW4ucHJldmluLnRlcmVzLmFsZXhpc0Bp
bnRlbC5jb20+CnRoYW5rcy4KCgoKT24gVGh1LCAyMDI0LTEwLTAzIGF0IDA4OjE2IC0wNzAwLCBa
aGFuanVuIERvbmcgd3JvdGU6Cj4gVXBvbiB0aGUgRzJIIE5vdGlmeS1FcnItQ2FwdHVyZSBldmVu
dCwgcGFyc2UgdGhyb3VnaCB0aGUKPiBHdUMgTG9nIEJ1ZmZlciAoZXJyb3ItY2FwdHVyZS1zdWJy
ZWdpb24pIGFuZCBnZW5lcmF0ZSBvbmUgb3IKPiBtb3JlIGNhcHR1cmUtbm9kZXMuIEEgc2luZ2xl
IG5vZGUgcmVwcmVzZW50cyBhIHNpbmdsZSAiZW5naW5lLQo+IGluc3RhbmNlLWNhcHR1cmUtZHVt
cCIgYW5kIGNvbnRhaW5zIGF0IGxlYXN0IDMgcmVnaXN0ZXIgbGlzdHM6Cj4gZ2xvYmFsLCBlbmdp
bmUtY2xhc3MgYW5kIGVuZ2luZS1pbnN0YW5jZS4gQW4gaW50ZXJuYWwgbGluawo+IGxpc3QgaXMg
bWFpbnRhaW5lZCB0byBzdG9yZSBvbmUgb3IgbW9yZSBub2Rlcy4KYWxhbjpzbmlwCgoKPiArc3Ry
dWN0IF9fZ3VjX2NhcHR1cmVfcGFyc2VkX291dHB1dCB7Cj4gK8KgwqDCoMKgwqDCoMKgLyoKPiAr
wqDCoMKgwqDCoMKgwqAgKiBBIHNpbmdsZSBzZXQgb2YgMyBjYXB0dXJlIGxpc3RzOiBhIGdsb2Jh
bC1saXN0Cj4gK8KgwqDCoMKgwqDCoMKgICogYW4gZW5naW5lLWNsYXNzLWxpc3QgYW5kIGFuIGVu
Z2luZS1pbnN0YW5jZSBsaXN0Lgo+ICvCoMKgwqDCoMKgwqDCoCAqIG91dGxpc3QgaW4gX19ndWNf
Y2FwdHVyZV9wYXJzZWRfb3V0cHV0IHdpbGwga2VlcAo+ICvCoMKgwqDCoMKgwqDCoCAqIGEgbGlu
a2VkIGxpc3Qgb2YgdGhlc2Ugbm9kZXMgdGhhdCB3aWxsIGV2ZW50dWFsbHkKPiArwqDCoMKgwqDC
oMKgwqAgKiBiZSBkZXRhY2hlZCBmcm9tIG91dGxpc3QgYW5kIGF0dGFjaGVkIGludG8gdG8KPiAr
wqDCoMKgwqDCoMKgwqAgKiB4ZV9jb2RlZHVtcCBpbiByZXNwb25zZSB0byBhIGNvbnRleHQgcmVz
ZXQKPiArwqDCoMKgwqDCoMKgwqAgKi8KPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgbGlzdF9oZWFk
IGxpbms7Cj4gK8KgwqDCoMKgwqDCoMKgYm9vbCBpc19wYXJ0aWFsOwo+ICvCoMKgwqDCoMKgwqDC
oHUzMiBlbmdfY2xhc3M7Cj4gK8KgwqDCoMKgwqDCoMKgdTMyIGVuZ19pbnN0Owo+ICvCoMKgwqDC
oMKgwqDCoHUzMiBndWNfaWQ7Cj4gK8KgwqDCoMKgwqDCoMKgdTMyIGxyY2E7Cj4gK8KgwqDCoMKg
wqDCoMKgc3RydWN0IGdjYXBfcmVnX2xpc3RfaW5mbyB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHUzMiB2ZmlkOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1MzIg
bnVtX3JlZ3M7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBndWNfbW1p
b19yZWcgKnJlZ3M7Cj4gK8KgwqDCoMKgwqDCoMKgfSByZWdpbmZvW0dVQ19TVEFURV9DQVBUVVJF
X1RZUEVfTUFYXTsKPiArI2RlZmluZSBHQ0FQX1BBUlNFRF9SRUdMSVNUX0lOREVYX0dMT0JBTMKg
wqAgQklUKEdVQ19TVEFURV9DQVBUVVJFX1RZUEVfR0xPQkFMKQo+ICsjZGVmaW5lIEdDQVBfUEFS
U0VEX1JFR0xJU1RfSU5ERVhfRU5HQ0xBU1MgQklUKEdVQ19TVEFURV9DQVBUVVJFX1RZUEVfRU5H
SU5FX0NMQVNTKQo+ICt9Owo+ICsKPiDCoC8qCj4gwqAgKiBEZWZpbmUgYWxsIGRldmljZSB0YWJs
ZXMgb2YgR3VDIGVycm9yIGNhcHR1cmUgcmVnaXN0ZXIgbGlzdHMKPiDCoCAqIE5PVEU6Cj4gQEAg
LTIyMSw2ICsyNjcsMTIgQEAgc3RydWN0IHhlX2d1Y19zdGF0ZV9jYXB0dXJlIHsKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBbR1VDX1NUQVRFX0NBUFRVUkVfVFlQRV9N
QVhdCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgW0dVQ19DQVBUVVJF
X0xJU1RfQ0xBU1NfTUFYXTsKPiDCoMKgwqDCoMKgwqDCoMKgdm9pZCAqYWRzX251bGxfY2FjaGU7
Cj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IGxpc3RfaGVhZCBjYWNoZWxpc3Q7Cj4gKyNkZWZpbmUg
UFJFQUxMT0NfTk9ERVNfTUFYX0NPVU5UICgzICogR1VDX01BWF9FTkdJTkVfQ0xBU1NFUyAqIEdV
Q19NQVhfSU5TVEFOQ0VTX1BFUl9DTEFTUykKPiArI2RlZmluZSBQUkVBTExPQ19OT0RFU19ERUZB
VUxUX05VTVJFR1MgNjQKPiArCj4gK8KgwqDCoMKgwqDCoMKgaW50IG1heF9tbWlvX3Blcl9ub2Rl
Owo+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBsaXN0X2hlYWQgb3V0bGlzdDsKPiDCoH07Cj4gwqAK
PiDCoHN0YXRpYyBjb25zdCBzdHJ1Y3QgX19ndWNfbW1pb19yZWdfZGVzY3JfZ3JvdXAgKgo+IEBA
IC00NTEsNyArNTAzLDEwIEBAIGd1Y19jYXBfbGlzdF9udW1fcmVncyhzdHJ1Y3QgeGVfZ3VjICpn
dWMsIHUzMiBvd25lciwgdTMyIHR5cGUsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBudW1fcmVncyArPSBtYXRjaC0+bnVtX3JlZ3M7Cj4gwqDCoMKgwqDCoMKgwqDCoGVsc2UKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qIEVzdGltYXRlIHN0ZWVyaW5nIHJlZ2lz
dGVyIHNpemUgZm9yIHJjcy9jY3MgKi8KCmFsYW46IG5pdDogbWF5YmUgbW9yZSBjbGFyaXR5IGlu
IHRoZSBjb21tZW50IGlzIHJlcXVpcmVkIGhlcmUgZWxzZSBvbmUgbWlnaHQgYmUKd29uZGVyaW5n
IHdoeSB3ZSBhcmUgc3RpbGwgcHJvdmlkaW5nIGEgbnVtYmVyIHdoZW4gZXh0bGlzdHMgcmV0dXJu
ZWQgbnVsbC4KUGxlYXNlIGNvcnJlY3QgbWUgaWYgaW0gd3JvbmcsIGJ1dCBpIGFzc3VtZSBpdCBt
aWdodCByZWFkIHNvbWV0aGluZyBsaWtlOgoiaWYgYSBjYWxsZXIgd2FudHMgdGhlIGZ1bGwgcmVn
aXN0ZXIgZHVtcCBzaXplIGJ1dCB3ZSBoYXZlIG5vdCB5ZXQgZ290IHRoZSBody1jb25maWcsCndo
aWNoIGlzIGJlZm9yZSBtYXhfbW1pb19wZXJfbm9kZSBpcyB1bmluaXRpYWxpemVkLCB0aGVuIHBy
b3ZpZGUgYSB3b3JzdC1jYXNlIG51bWJlcgpmb3IgZXh0bGlzdHMgYmFzZWQgb24gbWF4IGRzcyBm
dXNlIGJpdHMsIGJ1dCBvbmx5IGV2ZXIgZm9yIHJlbmRlci9jb21wdXRlIgo+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoY2FwdHVyZV9jbGFzcyA9PSBHVUNfQ0FQVFVSRV9MSVNU
X0NMQVNTX1JFTkRFUl9DT01QVVRFKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBp
ZiAob3duZXIgPT0gR1VDX0NBUFRVUkVfTElTVF9JTkRFWF9QRiAmJgo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdHlwZSA9PSBHVUNfU1RBVEVfQ0FQVFVSRV9UWVBFX0VO
R0lORV9DTEFTUyAmJgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2Fw
dHVyZV9jbGFzcyA9PSBHVUNfQ0FQVFVSRV9MSVNUX0NMQVNTX1JFTkRFUl9DT01QVVRFICYmCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAhZ3VjLT5jYXB0dXJlLT5tYXhf
bW1pb19wZXJfbm9kZSkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBudW1fcmVncyArPSBndWNfY2FwdHVyZV9nZXRfc3RlZXJfcmVnX251bShndWNfdG9f
eGUoZ3VjKSkgKgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgWEVfTUFYX0RTU19GVVNFX0JJVFM7Cj4gwqAKYWxh
bjpzbmlwCg==
