Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AF8C3DA41
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 09:41:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8274110E4D1;
	Tue,  9 Jul 2024 09:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BlaQWKev";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D00710E4D1
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 09:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720518056; x=1752054056;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=39TOvcvlBM2L/B+LQHAR9nPi/y0l68sMxl9oHmEpWPE=;
 b=BlaQWKevZlHTDuE3tUc0mFy+7jftYQzS7P5OGmaL0K6MWWotWiiAGAFU
 H+iweH91/ZzSUU/HTRaUyyQHlo24ODhsWajPGDz5RhYCdBIM6yYDYIn4w
 0/6TDaYx78jwSfPbc+q420xh3c3W8knttjhOlktHtLKybwMYgb5oLd9sd
 Weoc07DHDr5CWWVocJ23oddtrA93zhT19YltCM9vnc0ccQvvXBMwqCD7l
 6jdgXDoBJ30KYz1NousksLSD1ZmNI+DuOIgkZFAoBxG824hxKv9V90mG6
 IPnBD8qIfx0NboqpkI3V8hIzGsyx0yTcDON6rhhfm9S59WD1mprWz79W/ g==;
X-CSE-ConnectionGUID: quu+iw5mTwSECUTsxZwCFA==
X-CSE-MsgGUID: nDGFLDcDSSeFC2Z8lpBdmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="21628263"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; d="scan'208";a="21628263"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 02:40:55 -0700
X-CSE-ConnectionGUID: 8DmNMqmnRDaa3I2ZzHq9aw==
X-CSE-MsgGUID: 9A4V95n+R62YXkbNFazCkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; d="scan'208";a="47898924"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 02:40:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 02:40:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 02:40:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 02:40:53 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 02:40:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GfbK7WuFznug8BhZqiqzkdMp8hLJFaYIDINBLDlBkcCbdY2GCofK5O5CTv5P20+DuHKa7AU93Qkr8eQb/jD1UWg/hSF9S/4eqQECmeyeE2d07xE1q/eysP2LdtGnJdIv9aIEZa7HyYtvr4eMJdKrocw05h+N7U7O8vAPRvnaG2n8UzPpgPC4G9HyM9tyZHU75hftyWUCOl/BpIBkAPGCf65t/BbYQH3NMJpTiLCkr7a3meO5Ve9uOJzAq7b+LbJtxgIxIFq6ctHJ0aRnEbnFhj6Cw1b6v42dgGKuB1XaWuaBwBW/msspfWmC1qW0i56xpF/LTrsEzndS2XbK5G4vRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39TOvcvlBM2L/B+LQHAR9nPi/y0l68sMxl9oHmEpWPE=;
 b=GewSRxBB5rgW1kTqdVNhj9sEZR/ojNo4o+87ae2ErME364OjesDxOzvtaBtfnCr9w8SzoDbC5n2dtzCOPKx9mgOi07HHZgXlClsTupU5siD8ij4LsTSQehZZl9UTquMJnbVMrNJrRpCK9qrxR6TanqKnuR+kxmRNrjCPaXV8dZF5tumeFs3yF9soPj6dxRIOpQypq7YfWEW/YagQIUMcJ9u1QpA2Ef0+0trBXdQckicW9gdOD/48DugUqf/u18YM0ZxS4PoeMpB6pctt0I4vKL+VcJzM82wgqaHrNCx6x0zhjshrHPx3plwD29QnE3tM/LuWDqx4LQ22/RfRLJ+Jdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB5981.namprd11.prod.outlook.com (2603:10b6:510:1e0::15)
 by PH7PR11MB6555.namprd11.prod.outlook.com (2603:10b6:510:1a9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.31; Tue, 9 Jul
 2024 09:40:50 +0000
Received: from PH7PR11MB5981.namprd11.prod.outlook.com
 ([fe80::40e0:95a6:26e8:8de0]) by PH7PR11MB5981.namprd11.prod.outlook.com
 ([fe80::40e0:95a6:26e8:8de0%4]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 09:40:50 +0000
From: "Manna, Animesh" <animesh.manna@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Revert "drm/i915: Disable DSB in Xe KMD"
Thread-Topic: [PATCH] drm/xe: Revert "drm/i915: Disable DSB in Xe KMD"
Thread-Index: AQHa0P4NUeW1Vjgr10GrgSTyjDN4QrHuJAwAgAABfXA=
Date: Tue, 9 Jul 2024 09:40:50 +0000
Message-ID: <PH7PR11MB598117A63B892D6BEB8EB05DF9DB2@PH7PR11MB5981.namprd11.prod.outlook.com>
References: <20240708055630.4058818-1-animesh.manna@intel.com>
 <f3d3d575-a608-4fbf-8668-8390d83d059d@linux.intel.com>
In-Reply-To: <f3d3d575-a608-4fbf-8668-8390d83d059d@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5981:EE_|PH7PR11MB6555:EE_
x-ms-office365-filtering-correlation-id: 3fbcaa67-6c70-49b2-e612-08dc9ffb3817
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OE1iVE9Od0ZZRGZaUTNBYXErbVlidkRMeDg5SmN2U3JOUnZYbzYrSW9kcHJD?=
 =?utf-8?B?elJTRmMyQlBGMUhFWi8rOWdobHdVSG0zWVFaQlZ1VHJ5cldIUWxDMTAxZVU4?=
 =?utf-8?B?ZCtkYW8xc1dtOGdPUHQwSnVxNUVEZGVBK1lVRThjaU5PNXlraHlORWRZNkFT?=
 =?utf-8?B?VUdYVGJGL2p4QXpSb284aHhPNk5qZnFkYWRCT1pzWitNWkc4dDd4MG0zemZv?=
 =?utf-8?B?ZS9pTHhhTlFrZ1RweVdCb1JVcW4za3Z5d1FVUk5KSlE5NXBlRWgzZUM5K00x?=
 =?utf-8?B?WGY5dDE5alNHK3ZMSlFtZEU1RjhUaDFOYkpIaGhpU1ZpTWNuVS9ON1pCaDR5?=
 =?utf-8?B?VGxMWXJmRlc0U1p6YWhRMmJLL0hKL1F6NHhmQXlNQkZ3QmFyVmhBelF1eWRl?=
 =?utf-8?B?VHpqL05DWVRkQ0Y3SGlDQ0dFZnQzcXFqM3ZtZW0xV1F2cTIyR2N0bUdISm03?=
 =?utf-8?B?U2ZJeWxCQjlVbjI5aXNMd0FvREpobTVsZlByeFkyMFRMaGM0dXBhZm1sTWFh?=
 =?utf-8?B?S0ZFVVBtODhjY2ZWenlycHdrWkVpZUthWE9BWWNaZkUyS1EvQmdtcENDZmg4?=
 =?utf-8?B?Uk50TWpTSUJ6SWRBSm1SZ1UyTVdBc3pyd214VWIvcDdPcHZUSlhPRFgydUFM?=
 =?utf-8?B?aDI3WGRjQmtFbkFtOGc1b0kybzdQTTJOeGhTSVJkeFIrZDZJd0JtRDMwdVo0?=
 =?utf-8?B?STRnbHJwRTloWlovU3RiQksyMG1oR0NIMGR0ajJ1Yjg3VkdxNnZNSGw4R3pu?=
 =?utf-8?B?aEFXNUlJNGlLQzB6TTRkMTYvUVQ1MnljN3F4bEdwR3pFNjFpc0krNE84aUFZ?=
 =?utf-8?B?cmRkbkh1Tk5sSkNCMCs1N3QrdU9qRElXajJudnhPQ2RHTTRzOFpFRVBRZGRY?=
 =?utf-8?B?bGkrY3pTSkV4SDdBTEt5SVFlT09sVVl2VStCb3lhcTNxY3ZrbklWcEVWaFJa?=
 =?utf-8?B?WE1lOHRLWU1ieDBnV3MrTjdTeDZMd2hjZGV1OWw5V1lmcjZQdk9XbzlwTFBt?=
 =?utf-8?B?L25sV1hGZzVuTHJ1SS9FRlNPOG9VQUhEdmd0b2pKdkM5S2ZrUnJ5bEM3ZHJs?=
 =?utf-8?B?WDFpRGJpcHFncmpicDBuWDAzRWU1WGQzL1o1bTAyYUExNkJ5ZjBrVGE3OWE3?=
 =?utf-8?B?cysyRTBTcWF6SFJ0eWMyc0lDQjBOTHlvdXV0SGdTOTJJVnRwMzV4N2R1VDl0?=
 =?utf-8?B?TVZaeHpiL1FaZWtqekhNM3RyTExHekNkbXZmSm0xVEhkRHdxUXBHa1NGRzlh?=
 =?utf-8?B?ekFPQmpWenBSdllMVHdFaEFCOEhGc1hLSGluL0htU0Y0bU95MVBhTm1pQlUw?=
 =?utf-8?B?NHFBOHA1M3dURnBlbGZrRUc2aHhaTzEybDU2ODBRTHJVbVNNZFFKT3I4cUVx?=
 =?utf-8?B?Y3hDTzhwWTBldVBIUzF1Zi9IdTluQWorWmZCTEhmekJHZXFMZE9UMW40NitM?=
 =?utf-8?B?c1VFdEFpaW1aNnNSRVRSeWlHQ2tMc2RoaExPc2YvR1pib1ZoTDNUL3Y3QS94?=
 =?utf-8?B?U3oraGt2NWVVRUUvVTA2c2YxbTFkMU0zM05aYXZKUzVXeTU0RVFTY0NnTVlJ?=
 =?utf-8?B?YWNSMUdKNzlaV3ZMQklIU2RpaGk4ZVZzMDBxUloyMmtQSlA5Ryt5c1d6cVNj?=
 =?utf-8?B?MVNLeGxHNTJSaWczMWlyU2RlSmpVOHRwU2lWMXhwdENtSmRMMXBiRXQ1QU9y?=
 =?utf-8?B?MGNOOWpRTEdXTWpHNjBtZ1hkR2lYWEJ3NWZJQ3hsTmtjOHBrWGx4K2kvNGpC?=
 =?utf-8?B?dVBpaTJJQ2d6akxJU3J2RDBxMGdpQmJNd3VIOXVIQjlpb1JBbmdYZ2E3M28r?=
 =?utf-8?Q?x7CMa3lsXi4hXwVq/r8VcRQ+YB6WlGyLf+3aA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB5981.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T25XbTVubXdjNEl0Z2ZUakh4ajAvTlVtK2JWaERTeGFmdHMvZ2EyZUoxSkl4?=
 =?utf-8?B?cE00NjR4SUlOMGhCUTV5eDZJdUJXQzA3U3lkWklvUHZjWEJTMEkrbnNIbm5S?=
 =?utf-8?B?eGFDbmdFbjQ2NllscWtTMkxNTkgrTFVrZHBKbDRWTm96SXc1aWNURExySlBs?=
 =?utf-8?B?YmlOTEhjRW5xUXRlcks0bkRIZzcwY2hKNjdQK0hkeThHRk9TQTh4Y3pMZWZM?=
 =?utf-8?B?anFSeS9NVGthSTl0clk0eHFneGJ1dlc5THRNZHRuQ1hxcVl4WTFKc1pGSDBY?=
 =?utf-8?B?dG9zZjMyV2lxZzlKTmFTMWxaRDBzaGRIdCs5NXRTK2xIN1pXVUJ3aVcyL01q?=
 =?utf-8?B?LzVVR3FKMUtrQXZ4dXZOUnZhelRvWjF5cHdaN09ZU1pJK0lRMFVLS2lwdnNU?=
 =?utf-8?B?UGIvc3Yzcys2T21LaVhPN1NUNnlVVkVzL3ljekkwY2NSVmhsbUxxNkMySnlZ?=
 =?utf-8?B?M1ZiYWt5TGgydlcxd0NobENDYlI2YlFJKzl2ZGYweU1yY251ZXRUQnpmeGlG?=
 =?utf-8?B?di9pUDlONGJwenBkdm5PUXFtT2JacCtteWtiU04xc3VlNnBhcmJFaEZrcFRX?=
 =?utf-8?B?aDgzNURvNEoxQlZKR1dvU1F5SGZmbGxLWmo2RStSSitOMXlteVJRQ3lvMytJ?=
 =?utf-8?B?OHo3S1ZsQWlSOTR2WGliTDhQdjdZek4xcm9WQUVnQWZaTk5QVUxmQVBUcjNC?=
 =?utf-8?B?ZkhNd25hcmcxc21MRllMaWZOa2NZa0tIckwvTFpCb1dRV2t6VDI4bUFNb1Qr?=
 =?utf-8?B?VHZwa29lU0ozZ0FVYkVobHk1U2ZkRW8rYzNvczNCQWcvbWlPN1Z2ZzYyVHRS?=
 =?utf-8?B?elpUaXRsQWpRTGF5YmdFNUhURE05eXkrd0grTEFROW9WQW9pVHREK01JTHFR?=
 =?utf-8?B?VTBvUXNHbDRlN2tIajRXUytObjFDR1Zzc1M0WGd6SHV4Und1SWZSaFlVc2Zr?=
 =?utf-8?B?ajNMZUY3VDVtT0NYTXZOdStKdVUrOER6ZnNnRW5KNFlOU0xXcWxmNW56Vncx?=
 =?utf-8?B?Q1BqZk85bGtIVnZ4VXU5RElCd3J5ZHNPclpSdmRhaGNpdkdmajZnTFVzSHR5?=
 =?utf-8?B?S210emxVVW54ZjU0RlNEU245ajVSdUVUS2JNTUE0ZllwOGx5U0taWnU1WlBW?=
 =?utf-8?B?RkN6dHhBYU9oWDRzbHhaSnpVMlFhdzBNYWh4S2hCWFNhS1JDemJyRi9JV3dI?=
 =?utf-8?B?V1Q5QzVPMHUxTWplSVIvdjZZVDFUMVFYR0cvYXRGcWw2WUtJRDFBZWIydUFC?=
 =?utf-8?B?V0ZrVFpSNFdvRUFVZkRZZmNpbnVXdXdNT09CZ3puWmxpS0dZSXBGd09uZWV2?=
 =?utf-8?B?MXNuSm5xbVlxSllYTFlsNUJ3WU9ic3p4RjdEVURSZjd2MnVNdTRYUnl1VkV4?=
 =?utf-8?B?dDNyQzJWYU9BSGRNOGZDNnRhejFCZVV5ZUYzNDJHaVp0SE43UXlTTk1OQm5I?=
 =?utf-8?B?UUhLOFlIQVgvOUVTTmoxUHdzZkJlY3lkZ2lsSjVqbktKZW8yUHE0VFRvd1U5?=
 =?utf-8?B?T2VKRUtPVDladWhJa2hoMkdYWU1oUjAzRkhvUWw0RWhRc1dsTjN0WU5SYXJ4?=
 =?utf-8?B?NnVBTTBvcVYvQUFrMEYwRmlBSlRDOS9WVG9NQXExSkNvSERNQjFvdXVPbklr?=
 =?utf-8?B?OHpJRlo3SkJhbFdLQTdId1JWUVdFT21reFpoaG9zdHNhZnppMnJiU3AvYWFI?=
 =?utf-8?B?cCtReUp4THZDMlpBUTNSYWgwSCtlRXJ5Q2lPeERhM1d3dko2a0Z1UlpCbzda?=
 =?utf-8?B?SXBWZVhybi9zVDNjbjF1QTQ2L0J6V253QXpIR250K2NoY25RVzVJMEVTa1l6?=
 =?utf-8?B?ekRzbVFLTmVxWUx6RkgzVmc1K1F5TTFQMmlPY0FIWmVvYWhUYmVnMmw0cDlG?=
 =?utf-8?B?MXZsMHBwdUlla01Ualk0ODE4WTc4cWhnMHM1KzB0YlU5RDhvNFRIVTVvRHZv?=
 =?utf-8?B?SVlxdHVsTjV3VUVYaEQxZHlZQVp2eUNBNHJVeGpwS3JTQVQ5YzBXa2ZobitD?=
 =?utf-8?B?RGRYc0l3Y1ZlbTNIdU1mb3R1RUZFZFphc2tZczF0Tzc0UFdJN01jcWhWV0V1?=
 =?utf-8?B?YTU3c1ZxcGpFYnYwVUMzRDJjcmdLclhnSE5XSXhJbzkxd1gwSnBHZytScjFx?=
 =?utf-8?Q?mL/tRQHHhFp6TUHOq7YjgPJ8Q?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5981.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fbcaa67-6c70-49b2-e612-08dc9ffb3817
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2024 09:40:50.6386 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cycacpTrgBdF30f+dt90pquDhIIIwocs8cSJheQwsPjzANNmGzNonOuwoREYDnO26mmT36zesXSF14kpVsdzXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6555
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

SGkgTWFhcnRlbiwNCg0KV2hpY2ggcGxhdGZvcm0geW91IGFyZSBzZWVpbmcgdGhlIGNvcnJ1cHRp
b24/IEkgd2lsbCB0cnkgdG8gcmVwcm8gdGhlIHNhbWUuDQpJIHRyaWVkIHdpdGggQURMLXAgd2l0
aCBYMTEgYW5kIHdheWxhbmQgY29tcG9zaXRvciB3aXRoIFVidW50dSBkZXNrdG9wIGFuZCBubyBj
b3JydXB0aW9uIG9ic2VydmVkLg0KDQpSZWdhcmRzLA0KQW5pbWVzaA0KDQo+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmto
b3JzdEBsaW51eC5pbnRlbC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEp1bHkgOSwgMjAyNCAzOjAz
IFBNDQo+IFRvOiBNYW5uYSwgQW5pbWVzaCA8YW5pbWVzaC5tYW5uYUBpbnRlbC5jb20+OyBpbnRl
bC0NCj4geGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRy
bS94ZTogUmV2ZXJ0ICJkcm0vaTkxNTogRGlzYWJsZSBEU0IgaW4gWGUgS01EIg0KPiANCj4gSGVs
bG8sDQo+IA0KPiBJJ3ZlIGJlZW4gdHJ5aW5nIG91dCB0aGlzIHBhdGNoLCBidXQgSSdtIHN0aWxs
IHNlZWluZyBjb3JydXB0aW9uIG9uIG15IGxhcHRvcA0KPiB3aXRoIERTQiBlbmFibGVkLg0KPiBJ
J2QgcmVjb21tZW5kIG5vdCBtZXJnaW5nIHVudGlsIGl0IGlzIGZpeGVkLiA6KQ0KPiANCj4gQ2hl
ZXJzLA0KPiB+TWFhcnRlbg0KPiANCj4gRGVuIDIwMjQtMDctMDgga2wuIDA3OjU2LCBza3JldiBB
bmltZXNoIE1hbm5hOg0KPiA+IFRoaXMgcmV2ZXJ0cyBjb21taXQgYzI3ZjAxMGFhMTg4NDI3NmVl
NWRhZTcyMDM0ZDg0OTg3MDYwYzc2OS4NCj4gPg0KPiA+IEFmdGVyIGZpeCBmcm9tIFsxXSBkc2Ig
dGltZW91dCBpc3N1ZSBpcyBub3QgcmVwcm9kdWNpYmxlIG9uIGxvY2FsDQo+ID4gdGVzdGluZyB3
aXRoIHhlIGRyaXZlci4gQ2hlY2tpbmcgQ0kgcmVzdWx0IHRvIGNvbmZpcm0gYW5kIG5vdCBmb3Ig
cmV2aWV3Lg0KPiA+DQo+ID4gWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9z
ZXJpZXMvMTMwNzgzLw0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQW5pbWVzaCBNYW5uYSA8YW5p
bWVzaC5tYW5uYUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZHNiLmMgfCA0IC0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgZGVs
ZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9kc2IuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9kc2IuYw0KPiA+IGluZGV4IDJhYjM3NjVmNmMwNi4uZTljNDgzNWEyYzMwIDEwMDY0NA0KPiA+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHNiLmMNCj4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RzYi5jDQo+ID4gQEAgLTQ2Mywx
MCArNDYzLDYgQEAgc3RydWN0IGludGVsX2RzYiAqaW50ZWxfZHNiX3ByZXBhcmUoc3RydWN0DQo+
IGludGVsX2F0b21pY19zdGF0ZSAqc3RhdGUsDQo+ID4gIAlpZiAoIWk5MTUtPmRpc3BsYXkucGFy
YW1zLmVuYWJsZV9kc2IpDQo+ID4gIAkJcmV0dXJuIE5VTEw7DQo+ID4NCj4gPiAtCS8qIFRPRE86
IERTQiBpcyBicm9rZW4gaW4gWGUgS01ELCBzbyBkaXNhYmxpbmcgaXQgdW50aWwgZml4ZWQgKi8N
Cj4gPiAtCWlmICghSVNfRU5BQkxFRChJOTE1KSkNCj4gPiAtCQlyZXR1cm4gTlVMTDsNCj4gPiAt
DQo+ID4gIAlkc2IgPSBremFsbG9jKHNpemVvZigqZHNiKSwgR0ZQX0tFUk5FTCk7DQo+ID4gIAlp
ZiAoIWRzYikNCj4gPiAgCQlnb3RvIG91dDsNCg==
