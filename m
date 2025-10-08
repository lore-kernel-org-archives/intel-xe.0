Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F0BCCA470
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 22:52:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3E310E0C5;
	Wed,  8 Oct 2025 22:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z9z2GY+d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1219D10E0C5
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 22:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759963946; x=1791499946;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=MY4O5IgZQNO8Dya/a2SHDCUUd/G4YZOFZ8SvhJx7uRA=;
 b=Z9z2GY+d2H4RGDR14K2pi/liTo/4siAumR5bQrvPZkWm6FDA3UR2frTw
 jLhwaP4aqvc3bC1QDjoTUA+a/S8o43k0TkepiQxV0q9ifQu9r58FXTJw7
 Wr5cEF2W/AOY+Hk6/yNYbPB/9VKPKhLhrCFQhXvSN8ZbnfU8T+6rBUEHv
 esVSyKWuiZcOAibWxU+Fv/UBuI5PSNDgyjz6Au9A27ctfyv7MatxDI9Ug
 F52rvW+m3pviaotjSAjKOxRme3SniAPgCTITL0M4VYtbPj/nEQrhJgiPE
 I5YPVIBmME6DO9UBIMaGjK2ViqNnUYwD6AmsFE3Z0H6ZVGlq2b8KNShAn A==;
X-CSE-ConnectionGUID: 4gIoxIlWS5uDC4hDO0xeGg==
X-CSE-MsgGUID: 4un8ch39SoiqXtEXoyUogg==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="79609198"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="79609198"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 15:52:26 -0700
X-CSE-ConnectionGUID: qbYDdxk6SHyVxIBsIcsXVQ==
X-CSE-MsgGUID: kFvoLvqyQzy5oDeCA2BfMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="211502473"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 15:52:25 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 15:52:25 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 15:52:25 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.32) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 15:52:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=akBL7VzhY8oz7maBX92R2CnFQvMDb2kMIYl0akKoItGd8boxWJG14Fba3sALSTj/lCMhovA7Xw8LNG9iaPfZUCA2ehVANd/I43j4XlG61s1BlLt9c5mV+DDqcsSK2/sknidhVt+JG/RRhuLUSoluoZv2PSK+yYw81VObTZ1KeUmAAEGdLyNctahl5uhqLCHCjg/AmLKgVx87373RztD7FHVBxzZU1G4FzgVAIA6+s/v01LT3eUECuf9W0Pogh3QxUUUXbF8PJlZRldJZutZjog21m24gAVIKhXfCstLB2p9HICPaRnHxf+4zwGF3tBfdyL9VTR2DO6jb+9Q7UT+WjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MY4O5IgZQNO8Dya/a2SHDCUUd/G4YZOFZ8SvhJx7uRA=;
 b=NI9RF4GKDYpNBO6ok6sMY1QY+t/ZbBvv6s4jP3gCj3A+WVUN+0ZkgNCPTCqhIB5D3tgcpDQXyHebAblZQO5yLtEG/dKJo3WJdyyIdoSM6j7LY2ki8uj+8cvnu9h+h4xpF17to6tHPO+D3U2IXyarxs0d35fVrVoIonnBTDdRCkzK+rSDXD3tr4EiOXB3WUk+miMTi+PdXp7rtcEtcCXRukQCA6P8TgDHm4SV38Ay7n0AnOQBG+Zq7l7Ol290nCcwp21NIhL8mVl7s6tyoqfThw07GvtKHreXkDawFoUDBayNbLi+tB593vgSiLolxMsK8rMSIQvOD0Oy1YYBAaC8iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO6PR11MB5620.namprd11.prod.outlook.com (2603:10b6:303:13e::17)
 by DS0PR11MB9503.namprd11.prod.outlook.com (2603:10b6:8:297::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 22:52:23 +0000
Received: from CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::d584:8d08:18aa:7b91]) by CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::d584:8d08:18aa:7b91%4]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 22:52:23 +0000
From: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
CC: "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Don't allow evicting of BOs in same VM in array
 of VM binds
Thread-Topic: [PATCH] drm/xe: Don't allow evicting of BOs in same VM in array
 of VM binds
Thread-Index: AQHcOI5OM1XAWsEvoEe+YOhr4lSbn7S42z8A
Date: Wed, 8 Oct 2025 22:52:22 +0000
Message-ID: <5f3936a32079971fa490b1dccfd69d2558df7aaf.camel@intel.com>
References: <20251008200051.3423684-1-matthew.brost@intel.com>
In-Reply-To: <20251008200051.3423684-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5620:EE_|DS0PR11MB9503:EE_
x-ms-office365-filtering-correlation-id: b848c41a-1e99-4109-e623-08de06bd5835
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ajlRSE8vbmI5V1h1akJ1UVFubm8vdUcvQU05cVBxZk03b2U0YU1xRktuWG9H?=
 =?utf-8?B?QXZqUnFLWjFWNnR2bk02NWdCNEhFRjFKVW1OVFArZTFCWDZJRzl4ZjlHRE1x?=
 =?utf-8?B?QldKMk1LZkpqNTMvN3cyM1VtSTdDK0pqN2ZacDBVdFFxOXJua0ZzQnRSWmJS?=
 =?utf-8?B?R2djNXAydm15RjN6TllDMUxlcVdXdjNwOHlzNkl5UXMwNTZuTGhGTHBMdjJu?=
 =?utf-8?B?UEF5NWd6VnlTRDViU0N0T3NmWmk2Z3RUTG1wWndWK2U1MXZtY0UxV1dDbmc1?=
 =?utf-8?B?UWg5T2V6MmlMaUZtOVFLWVlaUTAwYTAyWjkwbFhoRHhNbVAyenlWU29FRll0?=
 =?utf-8?B?NGVBbEJvQjdxWCtUdGtqT2tQakxQbzRtT1NieDJjclhZTHFOSFl5a0dQT2xO?=
 =?utf-8?B?T2xackhLRHNHL0JsdDlpRGRWSmh6YmRtRjBQRjFaemJGRkRTRU9URjBqQSs2?=
 =?utf-8?B?eW0xYmhOQXlVMmZYaDA4ZlBFYnhkdWtwY2Y4OUQxL3RGZlA4cUcwR2pFNGhN?=
 =?utf-8?B?aW90bnM4QnNxaHlNUnRYdXhpajFSUFE3ZjZKS0hZRmlLU3cwSXpSS0hSVDFG?=
 =?utf-8?B?OGV5eWc2eUprVko2OTgxN2JBTTh3UVIwQ3hMYXJ2VzJaQVhScGx1eVdpK0dB?=
 =?utf-8?B?a0pVc2w1ZDkyWTV1Nzc2ODUvd3NadmI0a1ZjVklYYS93M0RDcVgrb3FHR0Qw?=
 =?utf-8?B?ZVlWZ0tWOEhLZXIvYXl2ZnpCTHNBQ2Z1WEt3NnljekZlSEdhM1IwcW5ZWVhp?=
 =?utf-8?B?RUxvZTYrby9yT05tRzZxRndYU2U1eEZ1emdBOVY5UWlKL1JveWZ0MmFmdEpP?=
 =?utf-8?B?WlZkRFhYT0V1bTF5WWxkM0VCbVJQa0JzUUVwazhCbW5va3NSWmZJVVFkcHRJ?=
 =?utf-8?B?QmhpT0pjazdlbUJEcjFmQVdzNTdTY0JhRjViYXV2QUVzQ3E0SEJNU1ZkWGVB?=
 =?utf-8?B?REx6UHpSa0t3b1pBOGZyMHJBVkNFVExwM2IwYnhIM0lQSEk5NWQ0VlhINnpO?=
 =?utf-8?B?WVplcGRYanBtSkRPZ094aWJlaS9oZmlwZkdGMXJ5UE1wejRQaFN4Yk9Na2U1?=
 =?utf-8?B?NXJLdVlpUEFqc3RYTDdnd1g5ZzNjU2dKVDVYQjAvMytBM0RrZ1F1SVBnQms1?=
 =?utf-8?B?NGhWdlJPRzhFRkkrOHJ6VUF5RHdzWHg4VlY1ckw0YXlyNzJjd0hWMGpHMXQv?=
 =?utf-8?B?MjhwV0pyNkk0U2ptS212cUVPNjF0b2tGOGtPN0grem50K1ZJRERBbjZodksv?=
 =?utf-8?B?MGVkSXRVbUk1dHVMb0VaOXZkNWcyNGRwYzFIajNJSHVpT0JnNDkrQUkwOWhW?=
 =?utf-8?B?aXpiYjk1a0tQdlBxUlB2a3VPbWV5c0s0dmFwMWx1ak1rTE9yeEJzNkk1VXVP?=
 =?utf-8?B?RkJ0VUxSNlpJRm84dzErNk1USDFQY1VLYzFVZzdsbWhhdVcvYjZha2dYYjFa?=
 =?utf-8?B?cVJrSTFsODhPU2FUSVp5UXpLSWxDNHNPeFZaYnZtRk4wYktUZmtOd0tUUHI5?=
 =?utf-8?B?RG1mN2RNaDlzTkdIb0IwZjNEbm96bjYwSnZlb2FSTGY4Ylplem5BQ1l4RzhQ?=
 =?utf-8?B?bnR6OGFsMUdSNDllKyt2SnhRbFF6L3gxL2lUcFdzcTdyZDZVcHdkb1F6V0NE?=
 =?utf-8?B?MDJjYXBpaGtUQi9xbUpEMG14VkhGbzFjUkhtL01jZk1FTDB2WW1XajJVZzNM?=
 =?utf-8?B?U041UDFOZWIzTk1ObGlTMDZFUHpmZE1EQ1NSVFkybFZ2S2NEL1plc1RFS1Nq?=
 =?utf-8?B?QXFMVnpSUm9OdVJCd3BTNk41VzRmOE1vQzZ1dFEyNnBubDduSHgvcmtsUU9V?=
 =?utf-8?B?ck5mYXNqVUJzc0V1Uk85RXp4QUpYSWUweWl1ejNlaG80bFQvWlRpVlRNdndH?=
 =?utf-8?B?WnZsZ3NRSFY3OCs1RGVIbzgvMlcyWm1sWWVHeGNseEM3QnFzQlhiMGNiaFFl?=
 =?utf-8?B?OWU2ZElmQXZodDd1NWp6V2g1aDNQS0k1bmM2eEEvaUMrUko2THEwL3JsS203?=
 =?utf-8?B?S1Y0SHdqVE9RPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5620.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WlBUWTQrWkJPazEzT29qS0hYaHpuanpsdmppdTdvS2RVb09MdG0vUmFmRXlB?=
 =?utf-8?B?b0JNZVhFbG1ZWEdRUGphaVZzeWFnU0tEdXJ3bDhmbVI4WFVvU2tPdXI3SXN3?=
 =?utf-8?B?Z2swVmkydkRwT2plcG9YSEp3OGZoZzRBaThQcVp6RzRhQThReVN6Q1JhN2Vh?=
 =?utf-8?B?cUdlaTdJZjVRbWV3eTVLR05JcmFib1VPc1lNS2lRTFN0V0dRS2w0ZzdlTFJo?=
 =?utf-8?B?SkVuang5dzBETmZlK2tRQTNQMUxJbk1aL0lqL0o4ZSs1VnZkcnQxMk1OUXJu?=
 =?utf-8?B?azhIUFB5aDFLMVIvQnZ0OGJ0RTVDZ1Vqc0E1YVY0MFlpTGl3QW5heVp5MWZQ?=
 =?utf-8?B?MzN2R3dQRFhGK1BJa3VjS3RMb3FXN3d5M3FXOFk3NDc1Ynpyc0dhRHpOMmNQ?=
 =?utf-8?B?aDF6aHp1VWlyUnZNMFFoa0R0d2t6eitNSDdMYnNxZHozY0lWcC82QnhqRDdL?=
 =?utf-8?B?ZEppQjg2RXJwNDFqUWFraENDenZ1b0N1R1NHTVVuWXJ3R1hLVWVLWkNldWsv?=
 =?utf-8?B?K2k2Uy93ZGZxSXRjdk9pYlJvZFVHR1hKVjRUMTZzbUlPRzlzd1BlZ21TTWpq?=
 =?utf-8?B?cGRFQTJiYzBOVGxRa0x0cGZVMnAwMEZqM3hyQkVNSTZwMVdvSEI4WWo5enJT?=
 =?utf-8?B?cmxmcElZL3o4S2hZMldZT1BSMGR2VXhsUXpNN3cvd1F0V2E5TEtMN1VmdFFO?=
 =?utf-8?B?U0o2WThMdWMwejd5UHNxV2xQeUNTWFZGWTJCN0dDS1ZDSnY2OGx5cUtuRWJD?=
 =?utf-8?B?WGJOWE94NXVtcnpJNG52OEp3M1JESzRmZHhuczg3Vk5YeittOEZGcjZBcVRi?=
 =?utf-8?B?RkpRRGFIeWYyeHprbG4vTWRUYkJWQXd5WmNaVExmR3R0K1UxZlIvVktTU1Iz?=
 =?utf-8?B?MEl1emdTaDRYejhrQjFMZU9IMExlVkFPR3o0MitZNDlCdW5vT0laOHZWVmF4?=
 =?utf-8?B?VzN3ZVNkWXlWd3dTN0txazhQVUEyT3JYajRLY2pYZTgyTy9lcG9qMERzK0Fp?=
 =?utf-8?B?TDZLS0txbU54cFBxWHNNV3c5S3N6RFEzWEJxM01YRm9ML0dFaDdPcGZxdDRs?=
 =?utf-8?B?cERuMzJ3UHA0bXoweUhmZlNkMXUyUUQxaVJKMENXRUF5OFFQN09SeDByMlRa?=
 =?utf-8?B?SytNU3hjejRsNU5Qc294Y0hXUDVZeHIxNEdhVjY0MlYzNms0cUdjVmpnYmkw?=
 =?utf-8?B?dU9pcWpoQ0RxbVl2dGxMVXJmbHQ3bHBRdkJBd1Rkd0VxOXA0ZFZDV2krYjBm?=
 =?utf-8?B?b2RwNDdOOUx4dWhUWldYMkg0TGx3c0VQaDVjcTcvNWRUVkpqZ2pEQ0lPYnVs?=
 =?utf-8?B?cnpuRTlRMDlCdmt0Y2tqMHRWajZubjFKdVNCd3EyZXl6ai9NenZodTZKZ2M1?=
 =?utf-8?B?QjM4YVRiTmtJYjF4SnBINzMyWXM4VFFOeDVaVUZ3d1FNalZ0d3gxOENVM2Er?=
 =?utf-8?B?OUk4R0F2Q1hLcUtFd1hOSzhFdEtwZTdkMnYyeE9oZUJudWE3Yzhtbzh1RzRn?=
 =?utf-8?B?bDZoWEdFb0JlalhyVWRpUVp1VWlNTWlFNWJxWE10ZnRic2o5bmFTL1IxVGtv?=
 =?utf-8?B?SjVZN1FBTEFYU0FvWWZ2TDFiREpuSXNzb1I3dzJHV2IyNmZ2eWZlZjJWOUJZ?=
 =?utf-8?B?NHdVaUlLS21qKysybmtFMVd5ZmkwYXU0U3V6UmZ3cTZ6RjRqekNxOXJWRjR3?=
 =?utf-8?B?Qlh3eCtDeXhQazd0Qms2NUpabGEycGh2TTJ5Y3pYK2pJMWQzc0N2NzEyaVBw?=
 =?utf-8?B?NnQ5R1B0NTd2ZjV2a1NZcVcweE8rcDBLYWlIRzZudHVDK2FKU1RWSW1vNFdD?=
 =?utf-8?B?ZDdkWUdUaDBCdGUvOG5XN3I0NWNwenFOWU5PQnJ2SFBQSmZhSXlSZjY5c3JM?=
 =?utf-8?B?YVZwK1lvbG9ya3luQ1c1YitsaW1tSS9YS0w1SWliMWloc1FiL0k0eElZbzlH?=
 =?utf-8?B?WXBSbUZqcWdsYnV1a2dzY2RKdVM4VlpweTJicmlKdzR4Q2g2OGVlc3JSRFoy?=
 =?utf-8?B?d0NWNzhpK2hqYXVPdDBFYzVHSnptYUdKYnpEc2JsSWc3Q1FYS2JIZFExN1Rm?=
 =?utf-8?B?UDlmYVNpZzF2VzloWFJobTQ5VDJoRWtSeTVVKzFlMlh5cG9QN3Q5MG1HbE9k?=
 =?utf-8?B?RmFBNXA5cUVlcEYySy93dHlzaHNpOHRiZDNScjAzQmFmOXdMdkFVbWZWakky?=
 =?utf-8?B?L0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <31F3E3F0A5DB1741BE5201C7B5766B5F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5620.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b848c41a-1e99-4109-e623-08de06bd5835
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2025 22:52:23.1555 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4HeOq+BNl4WIk+SToR5V1dCHaS2/Un56Wk9j14pCjpUJpil1KHxvggoKW4biI87Q/Eig6fAZQWlPrpl6g4PE7jQcahaqoCBG6RUN7nGm7Ws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9503
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

T24gV2VkLCAyMDI1LTEwLTA4IGF0IDEzOjAwIC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBBbiBhcnJheSBvZiBWTSBiaW5kcyBjYW4gcG90ZW50aWFsbHkgZXZpY3Qgb3RoZXIgYnVmZmVy
IG9iamVjdHMgKEJPcykNCj4gd2l0aGluIHRoZSBzYW1lIFZNIHVuZGVyIGNlcnRhaW4gY29uZGl0
aW9ucywgd2hpY2ggbWF5IGxlYWQgdG8gTlVMTA0KPiBwb2ludGVyIGRlcmVmZXJlbmNlcyBsYXRl
ciBpbiB0aGUgYmluZCBwaXBlbGluZS4gVG8gcHJldmVudCB0aGlzLCBjbGVhcg0KPiB0aGUgYWxs
b3dfcmVzX2V2aWN0IGZsYWcgaW4gdGhlIHhlX2JvX3ZhbGlkYXRlIGNhbGwuDQo+IA0KPiBDYzog
c3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPiBSZXBvcnRlZC1ieTogUGF1bG8gWmFub25pIDxwYXVs
by5yLnphbm9uaUBpbnRlbC5jb20+DQo+IENsb3NlczogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0
b3Aub3JnL2RybS94ZS9rZXJuZWwvLS9pc3N1ZXMvNjI2OA0KDQpJIGNhbiBjb25maXJtIGl0IGZp
eGVzIHRoZSBpc3N1ZSBmb3IgbWUuIFRoYW5rcyEhDQoNCkkgZGlkIHNvbWUgcXVpY2sgdGVzdGlu
ZywgYnV0IGV2ZXJ5dGhpbmcgc3RpbGwgc2VlbXMgdG8gd29yaywgc28gZmVlbA0KZnJlZSB0byBh
ZGQ6DQpUZXN0ZWQtYnk6IFBhdWxvIFphbm9uaSA8cGF1bG8uci56YW5vbmlAaW50ZWwuY29tPg0K
DQoNCj4gRml4ZXM6IDc3NGI1ZmE1MDlhOSAoImRybS94ZTogQXZvaWQgZXZpY3Rpbmcgb2JqZWN0
IG9mIHRoZSBzYW1lIHZtIGluIG5vbmUgZmF1bHQgbW9kZSIpDQo+IEZpeGVzOiA3N2YyZWYzZjE2
ZjUgKCJkcm0veGU6IExvY2sgYWxsIGdwdXZhIG9wcyBkdXJpbmcgVk0gYmluZCBJT0NUTCIpDQo+
IEZpeGVzOiBkZDA4ZWJmNmMzNTIgKCJkcm0veGU6IEludHJvZHVjZSBhIG5ldyBEUk0gZHJpdmVy
IGZvciBJbnRlbCBHUFVzIikNCj4gU2lnbmVkLW9mZi1ieTogTWF0dGhldyBCcm9zdCA8bWF0dGhl
dy5icm9zdEBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMg
ICAgICAgfCAyNSArKysrKysrKysrKysrKysrLS0tLS0tLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfdm1fdHlwZXMuaCB8ICAxICsNCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9u
cygrKSwgOSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jDQo+IGluZGV4IDRlOTE0OTI4
ZTBhOS4uNDY4MTc2Y2Y5MDFlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
dm0uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYw0KPiBAQCAtMjgzNCw3ICsy
ODM0LDcgQEAgc3RhdGljIHZvaWQgdm1fYmluZF9pb2N0bF9vcHNfdW53aW5kKHN0cnVjdCB4ZV92
bSAqdm0sDQo+ICB9DQo+ICANCj4gIHN0YXRpYyBpbnQgdm1hX2xvY2tfYW5kX3ZhbGlkYXRlKHN0
cnVjdCBkcm1fZXhlYyAqZXhlYywgc3RydWN0IHhlX3ZtYSAqdm1hLA0KPiAtCQkJCSBib29sIHZh
bGlkYXRlKQ0KPiArCQkJCSBib29sIG5vX3Jlc19ldmljdCwgYm9vbCB2YWxpZGF0ZSkNCj4gIHsN
Cj4gIAlzdHJ1Y3QgeGVfYm8gKmJvID0geGVfdm1hX2JvKHZtYSk7DQo+ICAJc3RydWN0IHhlX3Zt
ICp2bSA9IHhlX3ZtYV92bSh2bWEpOw0KPiBAQCAtMjg0NSw3ICsyODQ1LDggQEAgc3RhdGljIGlu
dCB2bWFfbG9ja19hbmRfdmFsaWRhdGUoc3RydWN0IGRybV9leGVjICpleGVjLCBzdHJ1Y3QgeGVf
dm1hICp2bWEsDQo+ICAJCQllcnIgPSBkcm1fZXhlY19sb2NrX29iaihleGVjLCAmYm8tPnR0bS5i
YXNlKTsNCj4gIAkJaWYgKCFlcnIgJiYgdmFsaWRhdGUpDQo+ICAJCQllcnIgPSB4ZV9ib192YWxp
ZGF0ZShibywgdm0sDQo+IC0JCQkJCSAgICAgIXhlX3ZtX2luX3ByZWVtcHRfZmVuY2VfbW9kZSh2
bSksIGV4ZWMpOw0KPiArCQkJCQkgICAgICF4ZV92bV9pbl9wcmVlbXB0X2ZlbmNlX21vZGUodm0p
ICYmDQo+ICsJCQkJCSAgICAgIW5vX3Jlc19ldmljdCwgZXhlYyk7DQo+ICAJfQ0KPiAgDQo+ICAJ
cmV0dXJuIGVycjsNCj4gQEAgLTI5MTUsMTQgKzI5MTYsMTYgQEAgc3RhdGljIGludCBwcmVmZXRj
aF9yYW5nZXMoc3RydWN0IHhlX3ZtICp2bSwgc3RydWN0IHhlX3ZtYV9vcCAqb3ApDQo+ICB9DQo+
ICANCj4gIHN0YXRpYyBpbnQgb3BfbG9ja19hbmRfcHJlcChzdHJ1Y3QgZHJtX2V4ZWMgKmV4ZWMs
IHN0cnVjdCB4ZV92bSAqdm0sDQo+IC0JCQkgICAgc3RydWN0IHhlX3ZtYV9vcCAqb3ApDQo+ICsJ
CQkgICAgc3RydWN0IHhlX3ZtYV9vcHMgKnZvcHMsIHN0cnVjdCB4ZV92bWFfb3AgKm9wKQ0KPiAg
ew0KPiAgCWludCBlcnIgPSAwOw0KPiArCWJvb2wgbm9fcmVzX2V2aWN0ID0gdm9wcy0+ZmxhZ3Mg
JiBYRV9WTUFfT1BTX0FSUkFZX09GX0JJTkRTOw0KPiAgDQo+ICAJc3dpdGNoIChvcC0+YmFzZS5v
cCkgew0KPiAgCWNhc2UgRFJNX0dQVVZBX09QX01BUDoNCj4gIAkJaWYgKCFvcC0+bWFwLmludmFs
aWRhdGVfb25fYmluZCkNCj4gIAkJCWVyciA9IHZtYV9sb2NrX2FuZF92YWxpZGF0ZShleGVjLCBv
cC0+bWFwLnZtYSwNCj4gKwkJCQkJCSAgICBub19yZXNfZXZpY3QsDQo+ICAJCQkJCQkgICAgIXhl
X3ZtX2luX2ZhdWx0X21vZGUodm0pIHx8DQo+ICAJCQkJCQkgICAgb3AtPm1hcC5pbW1lZGlhdGUp
Ow0KPiAgCQlicmVhazsNCj4gQEAgLTI5MzMsMTEgKzI5MzYsMTMgQEAgc3RhdGljIGludCBvcF9s
b2NrX2FuZF9wcmVwKHN0cnVjdCBkcm1fZXhlYyAqZXhlYywgc3RydWN0IHhlX3ZtICp2bSwNCj4g
IA0KPiAgCQllcnIgPSB2bWFfbG9ja19hbmRfdmFsaWRhdGUoZXhlYywNCj4gIAkJCQkJICAgIGdw
dXZhX3RvX3ZtYShvcC0+YmFzZS5yZW1hcC51bm1hcC0+dmEpLA0KPiAtCQkJCQkgICAgZmFsc2Up
Ow0KPiArCQkJCQkgICAgbm9fcmVzX2V2aWN0LCBmYWxzZSk7DQo+ICAJCWlmICghZXJyICYmIG9w
LT5yZW1hcC5wcmV2KQ0KPiAtCQkJZXJyID0gdm1hX2xvY2tfYW5kX3ZhbGlkYXRlKGV4ZWMsIG9w
LT5yZW1hcC5wcmV2LCB0cnVlKTsNCj4gKwkJCWVyciA9IHZtYV9sb2NrX2FuZF92YWxpZGF0ZShl
eGVjLCBvcC0+cmVtYXAucHJldiwNCj4gKwkJCQkJCSAgICBub19yZXNfZXZpY3QsIHRydWUpOw0K
PiAgCQlpZiAoIWVyciAmJiBvcC0+cmVtYXAubmV4dCkNCj4gLQkJCWVyciA9IHZtYV9sb2NrX2Fu
ZF92YWxpZGF0ZShleGVjLCBvcC0+cmVtYXAubmV4dCwgdHJ1ZSk7DQo+ICsJCQllcnIgPSB2bWFf
bG9ja19hbmRfdmFsaWRhdGUoZXhlYywgb3AtPnJlbWFwLm5leHQsDQo+ICsJCQkJCQkgICAgbm9f
cmVzX2V2aWN0LCB0cnVlKTsNCj4gIAkJYnJlYWs7DQo+ICAJY2FzZSBEUk1fR1BVVkFfT1BfVU5N
QVA6DQo+ICAJCWVyciA9IGNoZWNrX3VmZW5jZShncHV2YV90b192bWEob3AtPmJhc2UudW5tYXAu
dmEpKTsNCj4gQEAgLTI5NDYsNyArMjk1MSw3IEBAIHN0YXRpYyBpbnQgb3BfbG9ja19hbmRfcHJl
cChzdHJ1Y3QgZHJtX2V4ZWMgKmV4ZWMsIHN0cnVjdCB4ZV92bSAqdm0sDQo+ICANCj4gIAkJZXJy
ID0gdm1hX2xvY2tfYW5kX3ZhbGlkYXRlKGV4ZWMsDQo+ICAJCQkJCSAgICBncHV2YV90b192bWEo
b3AtPmJhc2UudW5tYXAudmEpLA0KPiAtCQkJCQkgICAgZmFsc2UpOw0KPiArCQkJCQkgICAgbm9f
cmVzX2V2aWN0LCBmYWxzZSk7DQo+ICAJCWJyZWFrOw0KPiAgCWNhc2UgRFJNX0dQVVZBX09QX1BS
RUZFVENIOg0KPiAgCXsNCj4gQEAgLTI5NjEsNyArMjk2Niw3IEBAIHN0YXRpYyBpbnQgb3BfbG9j
a19hbmRfcHJlcChzdHJ1Y3QgZHJtX2V4ZWMgKmV4ZWMsIHN0cnVjdCB4ZV92bSAqdm0sDQo+ICAN
Cj4gIAkJZXJyID0gdm1hX2xvY2tfYW5kX3ZhbGlkYXRlKGV4ZWMsDQo+ICAJCQkJCSAgICBncHV2
YV90b192bWEob3AtPmJhc2UucHJlZmV0Y2gudmEpLA0KPiAtCQkJCQkgICAgZmFsc2UpOw0KPiAr
CQkJCQkgICAgbm9fcmVzX2V2aWN0LCBmYWxzZSk7DQo+ICAJCWlmICghZXJyICYmICF4ZV92bWFf
aGFzX25vX2JvKHZtYSkpDQo+ICAJCQllcnIgPSB4ZV9ib19taWdyYXRlKHhlX3ZtYV9ibyh2bWEp
LA0KPiAgCQkJCQkgICAgcmVnaW9uX3RvX21lbV90eXBlW3JlZ2lvbl0sDQo+IEBAIC0zMDA3LDcg
KzMwMTIsNyBAQCBzdGF0aWMgaW50IHZtX2JpbmRfaW9jdGxfb3BzX2xvY2tfYW5kX3ByZXAoc3Ry
dWN0IGRybV9leGVjICpleGVjLA0KPiAgCQlyZXR1cm4gZXJyOw0KPiAgDQo+ICAJbGlzdF9mb3Jf
ZWFjaF9lbnRyeShvcCwgJnZvcHMtPmxpc3QsIGxpbmspIHsNCj4gLQkJZXJyID0gb3BfbG9ja19h
bmRfcHJlcChleGVjLCB2bSwgb3ApOw0KPiArCQllcnIgPSBvcF9sb2NrX2FuZF9wcmVwKGV4ZWMs
IHZtLCB2b3BzLCBvcCk7DQo+ICAJCWlmIChlcnIpDQo+ICAJCQlyZXR1cm4gZXJyOw0KPiAgCX0N
Cj4gQEAgLTM2NDAsNiArMzY0NSw4IEBAIGludCB4ZV92bV9iaW5kX2lvY3RsKHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsIHN0cnVjdCBkcm1fZmlsZSAqZmlsZSkNCj4gIAl9DQo+
ICANCj4gIAl4ZV92bWFfb3BzX2luaXQoJnZvcHMsIHZtLCBxLCBzeW5jcywgbnVtX3N5bmNzKTsN
Cj4gKwlpZiAoYXJncy0+bnVtX2JpbmRzID4gMSkNCj4gKwkJdm9wcy5mbGFncyB8PSBYRV9WTUFf
T1BTX0FSUkFZX09GX0JJTkRTOw0KPiAgCWZvciAoaSA9IDA7IGkgPCBhcmdzLT5udW1fYmluZHM7
ICsraSkgew0KPiAgCQl1NjQgcmFuZ2UgPSBiaW5kX29wc1tpXS5yYW5nZTsNCj4gIAkJdTY0IGFk
ZHIgPSBiaW5kX29wc1tpXS5hZGRyOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3ZtX3R5cGVzLmggYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm1fdHlwZXMuaA0KPiBpbmRl
eCBkYTM5OTQwNTAxZDguLjQxMzM1M2UxYzIyNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3ZtX3R5cGVzLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtX3R5
cGVzLmgNCj4gQEAgLTQ3Niw2ICs0NzYsNyBAQCBzdHJ1Y3QgeGVfdm1hX29wcyB7DQo+ICAJLyoq
IEBmbGFnOiBzaWduaWZ5IHRoZSBwcm9wZXJ0aWVzIHdpdGhpbiB4ZV92bWFfb3BzKi8NCj4gICNk
ZWZpbmUgWEVfVk1BX09QU19GTEFHX0hBU19TVk1fUFJFRkVUQ0ggQklUKDApDQo+ICAjZGVmaW5l
IFhFX1ZNQV9PUFNfRkxBR19NQURWSVNFICAgICAgICAgIEJJVCgxKQ0KPiArI2RlZmluZSBYRV9W
TUFfT1BTX0FSUkFZX09GX0JJTkRTCSBCSVQoMikNCj4gIAl1MzIgZmxhZ3M7DQo+ICAjaWZkZWYg
VEVTVF9WTV9PUFNfRVJST1INCj4gIAkvKiogQGluamVjdF9lcnJvcjogaW5qZWN0IGVycm9yIHRv
IHRlc3QgZXJyb3IgaGFuZGxpbmcgKi8NCg==
