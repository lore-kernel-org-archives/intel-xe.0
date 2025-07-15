Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72192C83F27
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 21:26:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B2F10E69D;
	Tue, 15 Jul 2025 21:26:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KZnOQ/DJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 100A010E69D
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 21:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752614781; x=1784150781;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=TiLRlgjLkKF5JfU/BCuwcNfzgqFx2glxh0c5/UPICeY=;
 b=KZnOQ/DJ+X596K6Vb9/k91wbmL5OV25Nf3RWe6Qcn2ltQOYxwirlishN
 A7PK3uozFlZ6vjX6YepPwkPD20tNumYCcDHeKyqKPyP42IhSzsx75v34y
 rCjHoXN6aydlYAVHpXdnl9N8byj2K+aoazolcN13X3Hhz32UlGQpEtHXJ
 VLlZLlvqzhF0J78VkWCwoGfjCbMFXfL5uh50qzGxkmdUzhBlDxtPet+5C
 ZVVeHgZcXu1HHBMYFDNNT8oAURSDKE5VvMHBBoLvs/c4elZX2lcIbCzwb
 S8Ium8RTdcE3WesDGuf00JSKvV9RAedgQ4Ww8KNUEcx5jL4y1eBkuRPIs w==;
X-CSE-ConnectionGUID: hL19HjFXTBG5MvSx4yb/yw==
X-CSE-MsgGUID: h4A/K868QyCRDB7AWC+M1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="58615726"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="58615726"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 14:26:20 -0700
X-CSE-ConnectionGUID: ee9C+rUcTC+phHoUAkNvrQ==
X-CSE-MsgGUID: 2hzfN+vlT1qlTx6C0sA0HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="158052389"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 14:26:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 14:26:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 14:26:18 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.40)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 14:26:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ndnQNmajLjEW+o+HFPYsxwzuXGxfSob/t79jtiP2Xunbagy977bD3CicRhLN0dnlEzcORc49TsQpxsZB6FCJf8KsgGMXj7rrE/4wGz9yRLGBLOlTesktUyex3cvkInAGiCbiodraQIVdQBpXvHQOcBR+n06XuqC2HSu+SMP2H7zyDOzXNroDS6oCqmptm7l4PjcB8eiMnE31heu3IwXu/jws6p4otQifx1DJObaIv4O8f5It2CcHCLC0WG2e2HYqx29nC9DHPw7tGgmn3tHRUBJOV+1x1vI6fYQ/WOpA7KNICgHBf+22BCLqZOiei6I1B2TexagkPVc3d0QSg9lKhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TiLRlgjLkKF5JfU/BCuwcNfzgqFx2glxh0c5/UPICeY=;
 b=VeRkDL5dpIM3VqVLT4UH1tkC/WUAcYN9Mb1ORQiqW72o5FwlaNvgoro1xLA8C4uD4gWytIQBbvRx9/yJVSUupqeLZ5FtLxlJBNt+aJFo//wBXOKxM3Q55sEMCSKGRmciGtwRswaR4WcCOcm3EaWauRDpuvpyltNLYkNCNFkPDFqzbNslPzDiJ2q4Mzuz7HuCuOCLqVBL+2AuPHhPkSLKsRaAzSRW+OthjT5TGPs6UqkD26rv/4Pyy53yIEBFTkx0l9nug28T3OsVzkwG010rlXZFBaGP9pXO5/2kpFzyJBn0rLyRkg1X5Hw0cM7fFkCCINuA6qLVSYaZX0o+dPK2ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DM4PR11MB6407.namprd11.prod.outlook.com (2603:10b6:8:b4::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.25; Tue, 15 Jul 2025 21:25:29 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 21:25:29 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "Auld, Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH 4/4] drm/xe: Add xe_tlb_inval structure
Thread-Topic: [PATCH 4/4] drm/xe: Add xe_tlb_inval structure
Thread-Index: AQHb9c57cNlCHAzZy0Wq30s28AJXgLQzslqA
Date: Tue, 15 Jul 2025 21:25:29 +0000
Message-ID: <ed84bf7cdefd1cd8445f451b7ab66812ad012c43.camel@intel.com>
References: <20250715212125.337195-1-stuart.summers@intel.com>
 <20250715212125.337195-5-stuart.summers@intel.com>
In-Reply-To: <20250715212125.337195-5-stuart.summers@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DM4PR11MB6407:EE_
x-ms-office365-filtering-correlation-id: 777c06c1-5ad3-4fab-9633-08ddc3e61f6f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TE9vWHhOcFBZWkhRMm54TUwyNGRwYVQ2NEwvZmVWM1BTUVhMVlZPQnorSHY3?=
 =?utf-8?B?WEttM0o1eFZKMGxiNDF5VWlBdUZpcmRFNmtGcFF2TmRIOG9pK3RuM0VHbFFC?=
 =?utf-8?B?dVZ5MzRRNWJkblorSEFVWFVqbzFZQ25lT2pDdWRVOTBreThHRU0xQmRtWXRQ?=
 =?utf-8?B?eUlLejFPTm93T0x1d3NrK3gwdE1OSGdBWEFsakVWelloeENRZ1M5aFh3dkF0?=
 =?utf-8?B?WGdtMzRmbHA3UjR2RVdqVGhvVFVEazNGQ0FCTk5oREk5MUF6dmxvN3dOQ3R0?=
 =?utf-8?B?TDlRNFhWMEk0bFBQSkExZThtSldCTTdHRmJTVVM4WjdueTZhemxXUlVDVzln?=
 =?utf-8?B?MlFnby9aTGUzTXl1bUdqZE91M1M5TWZHV3dwbys0UERMdFhzZTd4ZnJCdXRm?=
 =?utf-8?B?cjdrcTRFeUVNWXNCVmppU0hWanF3L1BoZ0JMaUl2RHhEOGJnQTRBQjh2b29n?=
 =?utf-8?B?VzVhak0wdDhuYm4xdWlLc0dtaXVqZDAxQTMwZjAvR3lsRzlxTWQ1SjkwWisx?=
 =?utf-8?B?Y2x2R2NjcEdoTkNaTHhiVDhIaXZZQTFTNzVvZFRMem1HYjdNZTZVcjcxbDFX?=
 =?utf-8?B?Nkh4czNreFhTQ0loUUxrL0cwbGdNVGN3cVZ2WUFjdVJwRCtHaUdXS3RzWmg5?=
 =?utf-8?B?eENNVzNGSkVrTFpuNFEzazdJdjdmS3o5T1MyVnJaTXBWcGxtV3dlblF6T0Nh?=
 =?utf-8?B?cnU2akRRWG9vNFFWTDJOUjZLcGM2cjdDL0hqZXhucFdxVGlZdXN5eXMzYlE2?=
 =?utf-8?B?K1gvRkVTS0Fjdi90c2tCN1EvMS95RlNPeHY2RUk1MWxoZ20zQ3lXNGdOZnZL?=
 =?utf-8?B?TVNnRTllUDc2aFJ2NkhBbDJ1Y1NNMzlGUE11NlN0SGQrZndEM1lacXR3dENM?=
 =?utf-8?B?WFl4WjExU0JsNjlXdXBzVUVvYkhvVy9HZEU1Wk0zaXEyR3dBenE5N3NYRURJ?=
 =?utf-8?B?Y3R0dXZvOXhGSXFRcU1ZNXR6TmhhM2VQaWQ0bi9zNjlQVyt3TmZlN2ozQ3Qw?=
 =?utf-8?B?Wi9VbjFvUTgydXZtSllWNkJULzlRZHZjMFBaMXp6aThkazhhSjRYenVpV2xG?=
 =?utf-8?B?S21GYngva0tDQzJlMWZGb3FDcmRkU01ocml4S1Z0UDF3dU1ocTViS25tL3B2?=
 =?utf-8?B?Z2w1WmxaUkpBeXdiZmV2NjRyQks2dkloU2hxVXFnK0plN0dSK2w5VFJXNEcy?=
 =?utf-8?B?MHBWWG5zak9YbjNyQks5b3IxbklSZmt6ekhQUEFOWE9NdVJ2bHR2VjZ4MWJp?=
 =?utf-8?B?TUV4MC9NUDMzV2VSS2I2NmtMSnVOdHpqWkVaeWF6aVE2c0ZBbXl5RHA3TzZT?=
 =?utf-8?B?VUc5aW9Edys3RzdKQUF4ck1lZjMrK1ptUzNlWXJ0NGFzeFBBL3hZSVhxaGRH?=
 =?utf-8?B?Z04wdVo1VTNzNGpEM2FuQ1RzMnAwNHVwWTdDcWFUdjBnTkNqL3JLSXVrMnBm?=
 =?utf-8?B?RC9vN0RiamhMa0h5UVF0WWpUTXVWeXB3MHZ3NUQ5aVNiMXo5RDNkbEJSYTQ0?=
 =?utf-8?B?MVoxODhkVGluZmkwSWdBWmVST2N2anV1Z2c0OStrNG1Jc1dYZHZSZE9CTmVy?=
 =?utf-8?B?akxRQm54Zm5xV0lGekJ0V1RPM2xqWmFqeUNiL01WVDhoNHhzZWVpTzN0eWkv?=
 =?utf-8?B?QmJ4bVlIdXgrNlBnck9pdGxYVS8zbzVubEtHekNsUUxMZzJLUEhiOUU5L0th?=
 =?utf-8?B?S3Rod2p6U2hkbEl0bEluSFluNnZ0dWptSVdTSmZzUzVBSC9ia0k4R2J3UW94?=
 =?utf-8?B?a2l0TUlwU1hYeDYrYmpGTGtaenF1aWZXZnR6NlNoMnl2WnB5RjR3WXludXhl?=
 =?utf-8?B?c05rVjJoYXlONVhHVy9CbWlPeXFDQ2ozdGNNSVBKbFArYUlQRTBUVmlPUDFU?=
 =?utf-8?B?TTJCNFhNK2FiY2hmSUZWN3M0djFxTjZXUW0zNll0UllzZWRRR1drOWY2dzBL?=
 =?utf-8?B?ZW5qcGlHVE9vL1dxcjlvWm44RTNXcUxVaHArVTFTSngvK1ZzbkJCSjhhdkVP?=
 =?utf-8?B?bEJDWWRuZ0xBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVVZVHU2VU1Ob0xjZElGM0xDUkZMcWdsdFVzYmR5Ny9WQkNVMHZ2dTVtcEZS?=
 =?utf-8?B?R1dHK1JNR3U4R3RtYnU4bVcvNGJ2a3oxb2pHZCt4SGU4a1Z2d2haRm9YcmFT?=
 =?utf-8?B?S1lVUDBOaS9sYkNTVzltWWNTQ2ZkMjNwVGN4dkptUGZ2WWJ0aFBSTXhIbjlz?=
 =?utf-8?B?YmtJUlRSbGozS3dzeE5OZHd3eUpOYjF2SWZqbVFuSUV0ZlFhL3hHc3dJYlIy?=
 =?utf-8?B?OEcwTFlQeUJINWFuUEdaTlVCbW5ROHh0N2lSNlIwQjF1VVh4WVZmamhJLzk5?=
 =?utf-8?B?Y20rUUpwL0NXaysyeHhycWluU1krdktuYWMzMS9YOGNzczBPY2lYdnRkQUYy?=
 =?utf-8?B?MjFFWVdWVXZrSTBVRmtkRmJZUm82ZDFKYzlZdjZnS0NDcG42MnJUbE5Xclkx?=
 =?utf-8?B?RHBKZVJBazB6b0ZBb2QvOUhJa1ZlYWhpOXNjZ2RZZDBoM2F4NUZkOCtPVDdy?=
 =?utf-8?B?VnJpM2Z2Rm9tQmtyUys2NElmazdvdVBpQlVuU2N6TXpHb1FZdHBKY0F2S3lC?=
 =?utf-8?B?WnpVZTUwWmxDVUhwVFhHM0hiZEttQ29raEZ3Tjl0N0s2K2p5MmhCSHlILy9h?=
 =?utf-8?B?ZVhZUEJVT3F6TTBiNXdiWFJ3ckhwU2JmTGt3TzdSejMvM0xhWTczdEovclFB?=
 =?utf-8?B?UGU1NW82VmRoVXVhQnFDRXE0N0Vka0tNNmc0eVRnQlBKbnJJMEFhbnZEejd3?=
 =?utf-8?B?M3pVNHpHS3h6SCs5YmlCREhQZzI4R1JoQitJT3FhcDBrNkE3Um51MFpUQmFt?=
 =?utf-8?B?c0lkVHJydUlNeDhUR2VrZjBNdTVYanppOWJ5Q3JGZjJ5VWxvU2lZZkl0aWpO?=
 =?utf-8?B?NG9RMlBYci9RVTA3K2VXMUxlbUxsaE4xT09MOEFEaFFRMkQ0Mk5td2JtbUV5?=
 =?utf-8?B?QlE0MlJDUG9SSHJUTjBzbU0rQlhkeHdwQnBIeFBJa0RxZWlNVjd4djRIUFlx?=
 =?utf-8?B?emhERjlFNldFWDZNZCt3U3drY2VCQmV2emhiRGdoSXlJZGYxSWZQTFB0eWp5?=
 =?utf-8?B?MFZGVjBDN09WRzBMU1U2UmFadWIzREFHNkp1a2JEc1VrK0ZTdXVDZHNCRVQr?=
 =?utf-8?B?WHpHVTFzZW1sVHBXdGFxOTQ0dDhDdUNhMWtlZ01aaHVNU092cnRiK1FLaCsw?=
 =?utf-8?B?eE9QemhSVVUrQ2RMa3ppSWt1cFJYWFQ3TVFXd1Vxd3pTSmd3ckdFZklaQVIy?=
 =?utf-8?B?a3phT21GOWpwZnJ5Q0dvVWdjaHo1ekpLNkJEYjZ5R2dFUGJzYk1aSXdMNzNx?=
 =?utf-8?B?VjhkcGJQZEc5M25XRzV5UWNadTRNaFJmanBSSE85aEJ0OTRTdnFzQ1dYcWpt?=
 =?utf-8?B?aHYyc3pWM2I0N0N0UitFbFp3ZU1vOUwzNlBpMHpmamNNRVhjMHpjNEV2ZklZ?=
 =?utf-8?B?VjVPMDBNa01sbjBqaEd0YzZUWWh6WFAvT3VPakFqZ3pJamdvZXIxTk1Qczgy?=
 =?utf-8?B?Y3lsZGRtSnBTWDFSYUtDamVURmU2bGVldjk0Zjc4KzR6VTBvV0poVm1ENnlL?=
 =?utf-8?B?V2FiRTdUMDBtUmtZTXh2RWVOdWFuVEtBM3dXQndtNURrRjZyaGFleEdZMzhQ?=
 =?utf-8?B?QU5FYkF0bmNjYmkrVElkVVNxSllxUWdKNTY4MTlDaTJkM01nYmdmekcyZU9W?=
 =?utf-8?B?Y3VQSEg1K1d2S0x3Y2JmQmNKUTY1b21SaDhMcFBHVllEb0lPTTI3dFdwWnpj?=
 =?utf-8?B?OFdFVk5QTzBlU2pyT3JLbVI1M3dnWHpHbG9Ib2ZMc2Rrc1RLWlNzRUcxeElU?=
 =?utf-8?B?VC8yOFZYMHpUVStGeERSS1pFemRCUGszdjNXNGVFWXF1R2RyWXBHVUJ6eEcr?=
 =?utf-8?B?V2JwOUt4eitnenlTWFYyQW1tcjBnOHVmbENKRXdqU2VhMlNJTlB4NHkyRHdK?=
 =?utf-8?B?WElwaUZjUElUd2lQN2NrLzJZZjdyNzFtaWUxbzZFZXRJdlNXTGdQc3dyQnVn?=
 =?utf-8?B?ZisybWROOHNGaEp4MmQzTEVwUzgxQmpVREE5eXZWVVhPWjlYdjdhbm5XRzYz?=
 =?utf-8?B?R0VLTEszME9XWnNqWEhxbTc2ZG9sMWd0cTMwNVBLaklWeWQrVms0cVhTVFBK?=
 =?utf-8?B?dXdEZkw1UHJRYmFXWDR1YU1FUUdCZ25kYmFVUDIyNXdzdkdzSVAxY0ZHcTY1?=
 =?utf-8?B?dXJvZHVzSTFFQ3h6SHVYUkNLVENHNnpxSnliL0RhWEUyOS9jd2NHSDI5UWNI?=
 =?utf-8?B?UGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F8C56D1B69EB784D906CA7A66C13A17F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 777c06c1-5ad3-4fab-9633-08ddc3e61f6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 21:25:29.3494 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d3h57kbPJoLBtA+JWfWvGxOrIvubB6FvwDctSPEIZc764Ivt8TVL4Y+Uk2KSoKWIPfdyRrML9yfnOW9uo41Blb43yY619ZvLuoh62qrKA7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6407
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

T24gVHVlLCAyMDI1LTA3LTE1IGF0IDIxOjIxICswMDAwLCBzdHVhcnRzdW1tZXJzIHdyb3RlOgo+
IEZyb206IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPgo+IAo+IEV4dHJh
Y3QgVExCIGludmFsaWRhdGlvbiBzdGF0ZSBpbnRvIGEgc3RydWN0dXJlIHRvIGRlY291cGxlIFRM
Qgo+IGludmFsaWRhdGlvbnMgZnJvbSB0aGUgR1QsIGFsbG93aW5nIHRoZSBzdHJ1Y3R1cmUgdG8g
YmUgZW1iZWRkZWQKPiBhbnl3aGVyZSBpbiB0aGUgZHJpdmVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6
IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+CgpBbHNvIG1ha2VzIHNl
bnNlIHRvIG1lIGFzIGFuIGluY3JlbWVudGFsIG1vdmUgdG8gdGhlIHRsYiBpbnZhbCBzcGVjaWZp
YwplbmNhcHN1bGF0aW9uLgoKUmV2aWV3ZWQtYnk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3Vt
bWVyc0BpbnRlbC5jb20+CgpUaGFua3MsClN0dWFydAoKPiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndF90bGJfaW52YWxfdHlwZXMuaCB8IDMwCj4gKysrKysrKysrKysrKysrKysrKysr
Kwo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3R5cGVzLmjCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8IDI5ICsrLS0tLS0tLS0tLS0tLS0tLS0tCj4gLQo+IMKgMiBmaWxlcyBjaGFuZ2VkLCAzMiBp
bnNlcnRpb25zKCspLCAyNyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2d0X3RsYl9pbnZhbF90eXBlcy5oCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3RfdGxiX2ludmFsX3R5cGVzLmgKPiBpbmRleCA5MTk0MzAzNTkxMDMuLmI5OTgyNzZkZDkz
MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdGxiX2ludmFsX3R5cGVz
LmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdGxiX2ludmFsX3R5cGVzLmgKPiBA
QCAtNiwxMCArNiw0MCBAQAo+IMKgI2lmbmRlZiBfWEVfR1RfVExCX0lOVkFMX1RZUEVTX0hfCj4g
wqAjZGVmaW5lIF9YRV9HVF9UTEJfSU5WQUxfVFlQRVNfSF8KPiDCoAo+ICsjaW5jbHVkZSA8bGlu
dXgvd29ya3F1ZXVlLmg+Cj4gwqAjaW5jbHVkZSA8bGludXgvZG1hLWZlbmNlLmg+Cj4gwqAKPiDC
oHN0cnVjdCB4ZV9ndDsKPiDCoAo+ICsvKiogc3RydWN0IHhlX3RsYl9pbnZhbCAtIFRMQiBpbnZh
bGlkYXRpb24gY2xpZW50ICovCj4gK3N0cnVjdCB4ZV90bGJfaW52YWwgewo+ICvCoMKgwqDCoMKg
wqDCoC8qKiBAdGxiX2ludmFsLnNlcW5vOiBUTEIgaW52YWxpZGF0aW9uIHNlcW5vLCBwcm90ZWN0
ZWQgYnkgQ1QKPiBsb2NrICovCj4gKyNkZWZpbmUgVExCX0lOVkFMSURBVElPTl9TRVFOT19NQVjC
oMKgwqDCoMKgMHgxMDAwMDAKPiArwqDCoMKgwqDCoMKgwqBpbnQgc2Vxbm87Cj4gK8KgwqDCoMKg
wqDCoMKgLyoqCj4gK8KgwqDCoMKgwqDCoMKgICogQHRsYl9pbnZhbC5zZXFub19yZWN2OiBsYXN0
IHJlY2VpdmVkIFRMQiBpbnZhbGlkYXRpb24KPiBzZXFubywKPiArwqDCoMKgwqDCoMKgwqAgKiBw
cm90ZWN0ZWQgYnkgQ1QgbG9jawo+ICvCoMKgwqDCoMKgwqDCoCAqLwo+ICvCoMKgwqDCoMKgwqDC
oGludCBzZXFub19yZWN2Owo+ICvCoMKgwqDCoMKgwqDCoC8qKgo+ICvCoMKgwqDCoMKgwqDCoCAq
IEB0bGJfaW52YWwucGVuZGluZ19mZW5jZXM6IGxpc3Qgb2YgcGVuZGluZyBmZW5jZXMgd2FpdGlu
Zwo+IFRMQgo+ICvCoMKgwqDCoMKgwqDCoCAqIGludmFsaWF0aW9ucywgcHJvdGVjdGVkIGJ5IENU
IGxvY2sKPiArwqDCoMKgwqDCoMKgwqAgKi8KPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgbGlzdF9o
ZWFkIHBlbmRpbmdfZmVuY2VzOwo+ICvCoMKgwqDCoMKgwqDCoC8qKgo+ICvCoMKgwqDCoMKgwqDC
oCAqIEB0bGJfaW52YWwucGVuZGluZ19sb2NrOiBwcm90ZWN0cwo+IEB0bGJfaW52YWwucGVuZGlu
Z19mZW5jZXMKPiArwqDCoMKgwqDCoMKgwqAgKiBhbmQgdXBkYXRpbmcgQHRsYl9pbnZhbC5zZXFu
b19yZWN2Lgo+ICvCoMKgwqDCoMKgwqDCoCAqLwo+ICvCoMKgwqDCoMKgwqDCoHNwaW5sb2NrX3Qg
cGVuZGluZ19sb2NrOwo+ICvCoMKgwqDCoMKgwqDCoC8qKgo+ICvCoMKgwqDCoMKgwqDCoCAqIEB0
bGJfaW52YWwuZmVuY2VfdGRyOiBzY2hlZHVsZXMgYSBkZWxheWVkIGNhbGwgdG8KPiArwqDCoMKg
wqDCoMKgwqAgKiB4ZV9ndF90bGJfZmVuY2VfdGltZW91dCBhZnRlciB0aGUgdGltZXV0IGludGVy
dmFsIGlzIG92ZXIuCj4gK8KgwqDCoMKgwqDCoMKgICovCj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0
IGRlbGF5ZWRfd29yayBmZW5jZV90ZHI7Cj4gK8KgwqDCoMKgwqDCoMKgLyoqIEB0bGJfaW52YWwu
bG9jazogcHJvdGVjdHMgVExCIGludmFsaWRhdGlvbiBmZW5jZXMgKi8KPiArwqDCoMKgwqDCoMKg
wqBzcGlubG9ja190IGxvY2s7Cj4gK307Cj4gKwo+IMKgLyoqCj4gwqAgKiBzdHJ1Y3QgeGVfZ3Rf
dGxiX2ludmFsX2ZlbmNlIC0gWEUgR1QgVExCIGludmFsaWRhdGlvbiBmZW5jZQo+IMKgICoKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3R5cGVzLmgKPiBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndF90eXBlcy5oCj4gaW5kZXggYjgyNzk1ZmMwMDcwLi5lZDIxYmQ2M2Iw
MDEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3R5cGVzLmgKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdHlwZXMuaAo+IEBAIC0xMiw2ICsxMiw3IEBACj4g
wqAjaW5jbHVkZSAieGVfZ3Rfc3Jpb3ZfcGZfdHlwZXMuaCIKPiDCoCNpbmNsdWRlICJ4ZV9ndF9z
cmlvdl92Zl90eXBlcy5oIgo+IMKgI2luY2x1ZGUgInhlX2d0X3N0YXRzX3R5cGVzLmgiCj4gKyNp
bmNsdWRlICJ4ZV9ndF90bGJfaW52YWxfdHlwZXMuaCIKPiDCoCNpbmNsdWRlICJ4ZV9od19lbmdp
bmVfdHlwZXMuaCIKPiDCoCNpbmNsdWRlICJ4ZV9od19mZW5jZV90eXBlcy5oIgo+IMKgI2luY2x1
ZGUgInhlX29hX3R5cGVzLmgiCj4gQEAgLTE4NiwzMyArMTg3LDcgQEAgc3RydWN0IHhlX2d0IHsK
PiDCoMKgwqDCoMKgwqDCoMKgfSByZXNldDsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqAvKiogQHRs
Yl9pbnZhbDogVExCIGludmFsaWRhdGlvbiBzdGF0ZSAqLwo+IC3CoMKgwqDCoMKgwqDCoHN0cnVj
dCB7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qKiBAdGxiX2ludmFsLnNlcW5v
OiBUTEIgaW52YWxpZGF0aW9uIHNlcW5vLAo+IHByb3RlY3RlZCBieSBDVCBsb2NrICovCj4gLSNk
ZWZpbmUgVExCX0lOVkFMSURBVElPTl9TRVFOT19NQVjCoMKgwqDCoMKgMHgxMDAwMDAKPiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaW50IHNlcW5vOwo+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAvKioKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogQHRs
Yl9pbnZhbC5zZXFub19yZWN2OiBsYXN0IHJlY2VpdmVkIFRMQgo+IGludmFsaWRhdGlvbiBzZXFu
bywKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogcHJvdGVjdGVkIGJ5IENUIGxv
Y2sKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICovCj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGludCBzZXFub19yZWN2Owo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAvKioKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogQHRsYl9pbnZh
bC5wZW5kaW5nX2ZlbmNlczogbGlzdCBvZiBwZW5kaW5nIGZlbmNlcwo+IHdhaXRpbmcgVExCCj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIGludmFsaWF0aW9ucywgcHJvdGVjdGVk
IGJ5IENUIGxvY2sKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICovCj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBsaXN0X2hlYWQgcGVuZGluZ19mZW5jZXM7
Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qKgo+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgKiBAdGxiX2ludmFsLnBlbmRpbmdfbG9jazogcHJvdGVjdHMKPiBAdGxi
X2ludmFsLnBlbmRpbmdfZmVuY2VzCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAq
IGFuZCB1cGRhdGluZyBAdGxiX2ludmFsLnNlcW5vX3JlY3YuCj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAqLwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzcGlubG9j
a190IHBlbmRpbmdfbG9jazsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyoqCj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIEB0bGJfaW52YWwuZmVuY2VfdGRyOiBz
Y2hlZHVsZXMgYSBkZWxheWVkIGNhbGwgdG8KPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICogeGVfZ3RfdGxiX2ZlbmNlX3RpbWVvdXQgYWZ0ZXIgdGhlIHRpbWV1dCBpbnRlcnZhbAo+
IGlzIG92ZXIuCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLwo+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZGVsYXllZF93b3JrIGZlbmNlX3RkcjsKPiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyoqIEB0bGJfaW52YWwubG9jazogcHJvdGVj
dHMgVExCIGludmFsaWRhdGlvbiBmZW5jZXMKPiAqLwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBzcGlubG9ja190IGxvY2s7Cj4gLcKgwqDCoMKgwqDCoMKgfSB0bGJfaW52YWw7Cj4g
K8KgwqDCoMKgwqDCoMKgc3RydWN0IHhlX3RsYl9pbnZhbCB0bGJfaW52YWw7Cj4gwqAKPiDCoMKg
wqDCoMKgwqDCoMKgLyoqCj4gwqDCoMKgwqDCoMKgwqDCoCAqIEBjY3NfbW9kZTogTnVtYmVyIG9m
IGNvbXB1dGUgZW5naW5lcyBlbmFibGVkLgoK
