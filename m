Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7089BEC1123
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 19:06:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C55710E432;
	Mon, 23 Feb 2026 19:06:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VjeWPnR3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE8710E432
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 19:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771873584; x=1803409584;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=G+D+mbyeAwtWnlYczFjgkgXcKAffREiQUpI5/08wWsw=;
 b=VjeWPnR3722kq+9+EifzuZyuRxJ7G98dSg6hRyMYR6lZuEVwiFpyVwIK
 s7RyVr0X++W94xlta3yVPthjNDhMFdyNj5JKNsWvYku5ROU9eYiVAk8O+
 JxSFgmdPpWcoHf9vDab33bCIAwFNBGTWTuNnG5NJeDebETYH1kLJUNtT0
 iKW77meX0NYY5yOem1ojfVl40Ldqi1Xk3cOcPdzvJlFLwaNKghp/uZP9q
 bfWaTGmhknYDnnkswnwoR3/aoBSxjhryU3bpiNzmgadIp6kfJ8YMgq7YK
 UZgDqumnGbhc1urt4ZSo9dnj3aR3XgedDC+/38blVEMHXEc3qTlBrRuYI Q==;
X-CSE-ConnectionGUID: tWflsfcXS6yw/mY5sCT2sg==
X-CSE-MsgGUID: e2oT+XdGSqyFpe98v3fdtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="98341751"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="98341751"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 11:06:16 -0800
X-CSE-ConnectionGUID: Wc+NLqHZSW6wvREENZ5pBQ==
X-CSE-MsgGUID: Md9ibsglSWekqCCg641P9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="243748140"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 11:06:16 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 11:06:15 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 11:06:15 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.32) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 11:06:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wM6bvWBFDgRpyK+q7AVCbeIkXtLLhjyNPZzFP6AKhX295EOpl3x0tw0jMuxb9MWFkI8/7BW3U7ZxfLYiTHKuu58gPDcF+diXd5BlcI4OwctBQuN0FN92HhJaSdf1fBYOZY60wy9aPpToiPts8gVQy1Zxfq/uCsmlU2IJov0rizJaccZacGxUqhRCC7IepBZp/Y8Uvsz536kkqA8RfBgb9b3RM8YY9Vki83KDG++MhI8wNHy1pCZGdUwDyDMNhlED4w5GeCIoGuSZdKyu5CrJ0oWqEIeLeEn8+G/Rfbl7GL3HmrdSoR5mJLPLGqsKTiIbT2lZXS4t8+Ham/dggzFclA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+D+mbyeAwtWnlYczFjgkgXcKAffREiQUpI5/08wWsw=;
 b=wx5XS2JU3hfEwyNr19hjJN+Jk8jtM6CjJJ631e7stjxrbV8DqWUvh0SD2A0vfso5UvHOCCdl7cOw67r6zaolLK54m6kS2ZBBMLco8HsGBhNreihpe0LfRo6aevfG81f2/SJrrK0AUF0qhggBHjVK0yx5P9jNZxkRbzwgIvXYGyovqW2Foz0pvt9Jw4q1cOBv01VbOLzAOEJJA+zhkvBZc2GULQuzWuv9zPOCOo/10AlSzB7PN+0sZFK0xIwv5donRPWcM+BGmdea2OK+ovHe2/55TVUzrfBKbA/GPZItF6nOJHvyS4S8T0b2uBwl92DWn4oLPtIlQTc2TNiuVMdhNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SA1PR11MB5875.namprd11.prod.outlook.com (2603:10b6:806:238::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Mon, 23 Feb
 2026 19:06:11 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 19:06:10 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH v2 20/23] drm/xe: Consolidate workaround entries for
 Wa_15016589081
Thread-Topic: [PATCH v2 20/23] drm/xe: Consolidate workaround entries for
 Wa_15016589081
Thread-Index: AQHcoo5vJCl7FAENekulK1Ywm1HUSLWQngCA
Date: Mon, 23 Feb 2026 19:06:10 +0000
Message-ID: <DM4PR11MB54565FC2E41AF89170B82358EA77A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
 <20260220-forupstream-wa_cleanup-v2-20-b12005a05af6@intel.com>
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-20-b12005a05af6@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SA1PR11MB5875:EE_
x-ms-office365-filtering-correlation-id: e5d78642-6169-431f-c5b4-08de730e9b80
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?QnZtQnpGaGF0bnJySjU1aDQ0WTNFdERwNThQSkJqYlE0M3JXVXJCS0YyMnor?=
 =?utf-8?B?d3htTjMxcUc2cGh2OWltL3BLTDBoeldPNmROV3ZKcHVFZ3FDUHhTWlVDWXN5?=
 =?utf-8?B?TUNtSERqc1YybFVXNkhhUGcvcjlvK3cxdlBScFQ2R21pSEdqU1NWYm05UHk5?=
 =?utf-8?B?SmMyaFR1Z1ZxYWoxTWU4YVFpQVNjdmx1QU52VCtwaU44dUlWN0x3TStwZlhK?=
 =?utf-8?B?MVVLOFlGejhLZXZ2cHlMSERoRHBlbWVXaDVJdXZnRnZpdVNWMTg3aC8rOVNu?=
 =?utf-8?B?a2J1dU1vWHVJQ1NxaGNuN3g1ajlQMWVVTkVkejUxYjNpZE1EOGxMdDFaN01m?=
 =?utf-8?B?SldWSlgrazZHcE9Lc3hZa0FKbHkvQUFzbWhmWlI4c0NRd1h1YlNUdFkzL2t4?=
 =?utf-8?B?VEdiRWQrcGQzVXhreUxxYmtxa0pZS0E4MHhUWnc2bHh2M05lKytIV0FHeEpK?=
 =?utf-8?B?M3pTb29YeXN4SkZjZzY3UERhcnY2cmFOckdDRlQ4WDQ1WlRMQ20vMEV4bzh5?=
 =?utf-8?B?dEl1SjlaWHpUM1ZneTlna0NCU2VTdkRhT0RsQmFvTGIrRUN6MDRwQXlYOE5v?=
 =?utf-8?B?N3UrR01ndzdLNGR0TlNpblRSMHkzUThUVGlwbEhUYnl1YmVxQmxkSVFFN3Ew?=
 =?utf-8?B?MFMxWTlCU2RaZGpXbERhekwra3VuUE13WlJWejZZTm5ZNC81UnBRR2dXMS9x?=
 =?utf-8?B?ejc2QVQ4dHVLOFN2eVBCQWp1K093ejhQcjlWcnlwS1lPVzJyeWpWR3BjVXQx?=
 =?utf-8?B?aDkrVUVFWEFQVzNJZG9KZjRuOEV0aGFTWEtabm1xQ0FkbWw4S2U5dDhpU1Zu?=
 =?utf-8?B?UFh5QnR5T3djQmprbmV4dW5EWGZRWHpWNk5kVHJEVGN6c2NrV1BQK1ZsS1c1?=
 =?utf-8?B?eHl2QXpVSTV3eWtFOWk0TUwyZjM4RzhMNlJsREg5SzlSVUQxRFRydUhwbUhu?=
 =?utf-8?B?eEFFUThqMGRzOGpoUTJzMnh6a0UySWZ2Uk9zbjc3VVVSbFAzRjNnTUk5SW03?=
 =?utf-8?B?OGNqUGFJS3IwWFlFMHAyeDZ1WmpWN21ZREIxaG1GVllsTUVQZWdPb0F0WTY1?=
 =?utf-8?B?Y1VkT29WUkp5QnowN1J3NGZLbEtEZk45VWhSN2ljanlmcG12OGZUNU1TbTJO?=
 =?utf-8?B?Z0ZHQTdaM2xLRHl5dmR0YjVVVUUwYlExNm5XdG0vcXFSYlZNT3NTNytjOUxR?=
 =?utf-8?B?VWdVU0V1RXl5KzVOeWlRUFM3M1lhb05zK3R1REZGc1NXdGJ3ckc1Qk1Nd1cy?=
 =?utf-8?B?ZkVPREZkNCt0T0JReXdTSjZrbWJWSHF5QTVBKzcvNXRPUXRLSjM1Z05IcWNw?=
 =?utf-8?B?ZmxuY29IVWlZSVFKcjk5YXMzOU9LUERqdVpLY2t5N0hJVG05aDFLUzFoYmF2?=
 =?utf-8?B?Sld4VlV3OHdJbTg0UXo5SjY4aXpmbnJTOHVrK3lVb05rTVpIS2U4U2x1elFO?=
 =?utf-8?B?Q05zWUFzZDRzelRNakczTEZsRDRoVFBZdU1TZWxOQjQyZnRXS2Q3YWVQZHdT?=
 =?utf-8?B?ZGVPRFVKNU11MzBtRjJxY0NtSWw1MzFKeVVTOUFZenNWcTh0c1NleW1wOWtG?=
 =?utf-8?B?bWdMVWxzb0dGdDdxZWxrejhzb3BRaHN2MkRtV04yeEhhNko2aFlKeTJLZzdq?=
 =?utf-8?B?ZjE0WGRxOWdTRjFWblgxNThKNDNUcEtiWExURzkxTGpSVHpac0FnUW5zWmZv?=
 =?utf-8?B?b0NGU0FObW9mc2x4NFpSSW55Zm9ZV0ZITnU4YkpoNjhvbDlMVXVxQk9vbzZm?=
 =?utf-8?B?amk5VEZhZjJwSWhDRDBpRzZWaUVaOGhjZlRabzRkeGd4SDEzTkNyb0xJR0pN?=
 =?utf-8?B?NnVGS3h6SjdvWGVoN0hRRjJPNmdlVy9Cb0pSN0Q2Sy9NbURBRGV1SmhMVFBn?=
 =?utf-8?B?azVLcStHVDFmZmY5TGlJRllnaVFFdzlZais1ZnlQZ2lpejcxM2dteFhrVFdj?=
 =?utf-8?B?eG1McHlIL0JiRVdXN3VWNWpFTk1LdGwrb0k3QVNxa1ltN0YyNkxyUW9wU3F3?=
 =?utf-8?B?RUxZcDN6bkJOYkllWFdWUm96Z29JNjRkZHA3Y2dVL1Z3amdCTmZQMnFxTU1k?=
 =?utf-8?B?ZDc5MXUxalFoNFUxR3R1QkdvVHNDRFJ0S2d3ekVha0p0cVRDelRMTDdxaVQx?=
 =?utf-8?B?QXZDN25IN3pMM2l1WlZQczlMMGJJZWJSRzhra3ZoNms5NEdTMTl0aCtNaURT?=
 =?utf-8?Q?u5gCPpEs3GLxBkKu6ithEZg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXlHWVowUTJTSVd0WlkyRHNBUmdjdEdnOHgrQTAyTlU1Rkc5eDF5KzBydGZQ?=
 =?utf-8?B?RzV3NjNPb29qLytMZTZsaHZPcEI5R3d3VzNsdUtrWjVEZzd2YUtSQmxIdHhv?=
 =?utf-8?B?MFpqQWNPV1BsSkt0QXRTV0hGTFAvSTVCS3EzYi95emlERHd6TkptQ05LSGY3?=
 =?utf-8?B?WDIzMVJWeFR4eGo3aStyNjFkN243QWdQTkJ4ZjJpR01qTzNpT09MZlNvc2R4?=
 =?utf-8?B?MUcvT0F1SUVoNC9XbUNIUjAvRUFZZUNONFI0enYyN0Z4cDIxQXkxOWtpQy8x?=
 =?utf-8?B?aWY3dVJTeXEzRVMvRkEzdTg1SURPMzlQTjJlS05lQ0tDa3hhT0Z1dENuQnVk?=
 =?utf-8?B?QmVSd21BRVRIVVdjQ0MrVnJDOERQbGFoWXFwd0VGSCszUlVnanRzVGR0WUdK?=
 =?utf-8?B?RWI4eDZqdExST3hZSnYyNkt2ZGYyS040UXQ3UTVYN29WUlkwUGFoczBUUTQ3?=
 =?utf-8?B?Y2NXRHM4UHVRa2tiYUN6enVmNHRLNmxnR2NUMzJaSVM2Q1VzeGpUZlprT3dT?=
 =?utf-8?B?OVYzR0R5RjdPUHhjQ0cwTm4ybFQwTHB3L3NJR1lOZEUxRnh6OW9jNy80TUFj?=
 =?utf-8?B?dStuOTJSUXlCM3JuQjJFV1dZZ2I1emJFcWFDV3NSOFJibE9PbG5JNjdtN0dH?=
 =?utf-8?B?VG10MC8wYnNicG5sdDh2VWUwTFJJRGdOY05DblJaakJuckZXK2pVaDFRbE5D?=
 =?utf-8?B?dFBYNVRudTNPWTFUTG9NN2ZPS1N2Z1k0R1hiWDBZd2FyWWtiL3pzcWpHYk9Y?=
 =?utf-8?B?NHRFYmJOVXJJQlFYRE90R0lOT1dLbzN2MFhnRG5OM0l2RldGNW5sNWxYTUxr?=
 =?utf-8?B?aWtWN0QwckhOME1BSUtqcHI0UGhsckx6L1ZENHJMcGRLWFJKN01TVjdxVmkr?=
 =?utf-8?B?czhQdUxZY3BhaWpVblo2K1g1REoyVnh2ckU0YnQxb01SRExpbk0wdHFPMlBm?=
 =?utf-8?B?L2dxMlM3cVpyY2ZiZjBkM1NhZzlremlPYk1rTHF0b2wxUjd3eTdOR01aRlhP?=
 =?utf-8?B?VTFXZzgzUkQrWmpPMC80VFE2T1BHanZRMmdraE1JUno5YWhyZlpOM2R3dEJH?=
 =?utf-8?B?WFZsaTVVeUN3NjdkTUt0N2JSK3d6T09wSDM5WnBMVCtMTGtNK0RuM1ljWm5B?=
 =?utf-8?B?a2dXYWFYSS92ci94a2ttajZVaUNqSjVJT0VmUHltY1JueVFkREdmWi9OMnE5?=
 =?utf-8?B?L2sxcnBVVVNEdm9Eck12Rlplb0I3WHhVVTBCQjVkM3I4bmxhUWk1eDRGWi9P?=
 =?utf-8?B?c00zV3M4RGEycUx1VXl5a2E1OWlRL0NObjVmd1NCS1RRZUJRT0xmU0lmZjl3?=
 =?utf-8?B?M2JkaFc0SEtiS1FYd2tjWnN1TW9mMjJ3R2VCazFFNlBXL3o2NEY2VlMxRUdp?=
 =?utf-8?B?ZkUyY1JDMnpMWUdOUFRUa0NqOUxmZHhIbVJWdEVxTi9wMVFSS2ZGcnhMMUdu?=
 =?utf-8?B?eTU0Q2RQNTBOcTNJTUwyK2NQNm54MFNzdkRnUjZTM090QlBSaFptclV2R21N?=
 =?utf-8?B?Q05MVUt4WHFONFBtMEVOVk9WOEMrb2U5Q3RqdEZ6UkNieG1RdnNiODRuVi8z?=
 =?utf-8?B?VVFCRFc1QktFdFIwZGNCZGVkWU4veTNBRFJHRFJXK2xrcmlDOFRGL1I1UVZE?=
 =?utf-8?B?MzNJSEM3b3huRFZORXRsRmJvNDRmNXhQZmEzL25lVXBaOU1oYmdTWUR0dDVD?=
 =?utf-8?B?eC9oTlZWTnlaem9LZENLY0pXc2lCa3ZkZDRmMkl6bkxLNytKZjA5OFZmdVAy?=
 =?utf-8?B?WStYTWVlYVRBNUFVWmtZL0EzTWUxWjdva0grR1lCN210SG01TGVqZXlOczAy?=
 =?utf-8?B?RlpqV1RybFZiNTdybjdLY1hQVjRacXF0U0ZKMzdmTG9US2FnNE5YUTVuekJ0?=
 =?utf-8?B?U3U1RkpOL1hoQ0VmNThmaGJhMjJ1TTc3MXZIQ3g1V1VVZkF2NmRzMlBRMGU2?=
 =?utf-8?B?RGQ2T01VbjhiVGJ2cUxKL3N3aUNQSDMvc2dGNFI5TEg4NDA4SGxKOUN1NCs1?=
 =?utf-8?B?WCtLcEg1MzNlTHNFRnNhRlhhN3VYTFRvdnNsOUh1SHpkV0Y5MTVTR1FqcGxO?=
 =?utf-8?B?RHhUcnJKQTllMGN4VVJmYzZJM1NPRmtwOEFWdjhTcUlHRmpPbzdTenZyYWJI?=
 =?utf-8?B?MG44UGNUSVZFM2dNcE9kS2J1WEJlRHhnQzR3eXhYRzViVSs4YnJHSVNRZTFM?=
 =?utf-8?B?SzF5OFgwYW1wVXNRRnVCb2hqR3pFbmV2NEppTVd4UWI0Ui8vTEpmZU9zMEhx?=
 =?utf-8?B?UDIycW8yYTlWRmxIdi80bXNuOFJOTG5wK1gxUzFkcXp1eGlTVmErVER6Y0lZ?=
 =?utf-8?B?eVJMYjJYNXUvNEZKcnJGY0ZTdXJCU0xmZ0c0a3dDbzF0dVJpUFU3UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5d78642-6169-431f-c5b4-08de730e9b80
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 19:06:10.8504 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mfdoE5ZUdnUP7tN6ku/PEEjlIu15hIuqcyjH5NwIUeU1M6MpN5NYFRofj2TZXY96iUnpgwoZb4jPCYhedG+7pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5875
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

T24gRnJpLCBGZWIgMjAsIDIwMjYgOToyOCBBTSBNYXR0IFJvcGVyIHdyb3RlOg0KPiBXYV8xNTAx
NjU4OTA4MSBhcHBsaWVzIHRvIGFsbCBncmFwaGljcyB2ZXJzaW9ucyBmcm9tIDIwLjAxIHRocm91
Z2ggMjAuMDQNCj4gKGluY2x1c2l2ZSkuICBDb25zb2xpZGF0ZSB0aGUgUlRQIGVudHJpZXMgaW50
byBhIHNpbmdsZSByYW5nZS1iYXNlZCBlbnRyeS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hdHQg
Um9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQoNCkxHVE0uDQpSZXZpZXdlZC1ieTog
U2h1aWNoZW5nIExpbiA8c2h1aWNoZW5nLmxpbkBpbnRlbC5jb20+DQoNCj4gLS0tDQo+ICBkcml2
ZXJzL2dwdS9kcm0veGUveGVfd2EuYyB8IDEyICsrKystLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfd2EuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YS5jIGlu
ZGV4DQo+IDVhYTQwNGMwY2JmYmM4ZDExYzkzZDgyMGIxYTE5MmFiNDc3NmRlZjguLmZhNWRjZTRl
YWQ0OGJhZTQyNGE0OWMNCj4gNjIxNDI2ODNkYmYxOTcxMzc2IDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfd2EuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2Eu
Yw0KPiBAQCAtNjUzLDYgKzY1MywxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHhlX3J0cF9lbnRy
eV9zciBscmNfd2FzW10gPSB7DQo+ICAJICBYRV9SVFBfUlVMRVMoR1JBUEhJQ1NfVkVSU0lPTl9S
QU5HRSgyMDAxLCAyMDA0KSwNCj4gRU5HSU5FX0NMQVNTKFJFTkRFUikpLA0KPiAgCSAgWEVfUlRQ
X0FDVElPTlMoU0VUKENPTU1PTl9TTElDRV9DSElDS0VOMSwNCj4gRElTQUJMRV9CT1RUT01fQ0xJ
UF9SRUNUQU5HTEVfVEVTVCkpDQo+ICAJfSwNCj4gKwl7IFhFX1JUUF9OQU1FKCIxNTAxNjU4OTA4
MSIpLA0KPiArCSAgWEVfUlRQX1JVTEVTKEdSQVBISUNTX1ZFUlNJT05fUkFOR0UoMjAwMSwgMjAw
NCksDQo+IEVOR0lORV9DTEFTUyhSRU5ERVIpKSwNCj4gKwkgIFhFX1JUUF9BQ1RJT05TKFNFVChD
SElDS0VOX1JBU1RFUl8xLA0KPiBESVNfQ0xJUF9ORUdBVElWRV9CT1VORElOR19CT1gpKQ0KPiAr
CX0sDQo+IA0KPiAgCS8qIERHMSAqLw0KPiANCj4gQEAgLTcyOCwxMCArNzMyLDYgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCB4ZV9ydHBfZW50cnlfc3IgbHJjX3dhc1tdID0gew0KPiAgCQkJICAgICBE
SVNfUEFSVElBTF9BVVRPU1RSSVAgfA0KPiAgCQkJICAgICBESVNfQVVUT1NUUklQKSkNCj4gIAl9
LA0KPiAtCXsgWEVfUlRQX05BTUUoIjE1MDE2NTg5MDgxIiksDQo+IC0JICBYRV9SVFBfUlVMRVMo
R1JBUEhJQ1NfVkVSU0lPTigyMDA0KSwNCj4gRU5HSU5FX0NMQVNTKFJFTkRFUikpLA0KPiAtCSAg
WEVfUlRQX0FDVElPTlMoU0VUKENISUNLRU5fUkFTVEVSXzEsDQo+IERJU19DTElQX05FR0FUSVZF
X0JPVU5ESU5HX0JPWCkpDQo+IC0JfSwNCj4gDQo+ICAJLyogWGUyX0hQRyAqLw0KPiAgCXsgWEVf
UlRQX05BTUUoIjE1MDEwNTk5NzM3IiksDQo+IEBAIC03NTEsMTAgKzc1MSw2IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgeGVfcnRwX2VudHJ5X3NyIGxyY193YXNbXSA9IHsNCj4gIAkJCSAgICAgRElT
X1BBUlRJQUxfQVVUT1NUUklQIHwNCj4gIAkJCSAgICAgRElTX0FVVE9TVFJJUCkpDQo+ICAJfSwN
Cj4gLQl7IFhFX1JUUF9OQU1FKCIxNTAxNjU4OTA4MSIpLA0KPiAtCSAgWEVfUlRQX1JVTEVTKEdS
QVBISUNTX1ZFUlNJT05fUkFOR0UoMjAwMSwgMjAwMiksDQo+IEVOR0lORV9DTEFTUyhSRU5ERVIp
KSwNCj4gLQkgIFhFX1JUUF9BQ1RJT05TKFNFVChDSElDS0VOX1JBU1RFUl8xLA0KPiBESVNfQ0xJ
UF9ORUdBVElWRV9CT1VORElOR19CT1gpKQ0KPiAtCX0sDQo+ICAJeyBYRV9SVFBfTkFNRSgiMjIw
MjEwMDc4OTciKSwNCj4gIAkgIFhFX1JUUF9SVUxFUyhHUkFQSElDU19WRVJTSU9OX1JBTkdFKDIw
MDEsIDIwMDIpLA0KPiBFTkdJTkVfQ0xBU1MoUkVOREVSKSksDQo+ICAJICBYRV9SVFBfQUNUSU9O
UyhTRVQoQ09NTU9OX1NMSUNFX0NISUNLRU40LA0KPiBTQkVfUFVTSF9DT05TVEFOVF9CRUhJTkRf
RklYX0VOQUJMRSkpDQo+IA0KPiAtLQ0KPiAyLjUzLjANCg0K
