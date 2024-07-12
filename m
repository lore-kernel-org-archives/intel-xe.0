Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B079C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 20:42:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D368410E165;
	Fri, 12 Jul 2024 20:42:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NWnT71kp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1652910E165
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 20:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720816949; x=1752352949;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UH+tbKF3q1twE41HojAjT/JerYrCNvpP8/kphMGcg1w=;
 b=NWnT71kpl8o6oHrj3eaZq3veKm7VzIrX+HDkULihCfYv9R5WUsyAO0kA
 Lx92Z9HQyYakdCMSJHXovutZsMp/mjmiMLUQd+WKOn+aJhweEAhWYMQXD
 i6Hc++IdyKKhOcJ+mQcFBmtQlZ4UCEFwShRkpptHmgUtAuJ/uW2VvWOhe
 ZN2wyTDTSMK4m/5JOLixE8AvC0FnIlUkel0fE22CGtfSO+i+Ts/4DCRV8
 tAicltI9FZTGFQgnDj1HxM1R25XYBTXBu7s5zU/lmLAwAeHpcUI1nwEcZ
 WsHIAqZyfaEHOaeLwgS9F7QjabxyTB6y0NXr8MzQHw3YLaTo9KL3BMkok Q==;
X-CSE-ConnectionGUID: /u620KzPQ6eDjVpcnYXX+A==
X-CSE-MsgGUID: OcXCtsr+QfuuUgu0f65aDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="12528791"
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; d="scan'208";a="12528791"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 13:42:29 -0700
X-CSE-ConnectionGUID: sQ7qP9J0QN2VfAKuHJhQZA==
X-CSE-MsgGUID: yJf2BkvQRyGaTyydKh2+GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; d="scan'208";a="48763572"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jul 2024 13:42:28 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 13:42:28 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 13:42:28 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 12 Jul 2024 13:42:28 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 12 Jul 2024 13:42:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OnRwNqeWAEmFHcoQRQ1caAGN7m29wQFa24z5zhwiQQQkPxpwNcGQBOA1pQPur5BzLC6Wv6/376XfvXCMEiMrt428zfNHF8lzzN5Qlr9ZC2EId7vZziHwzGCTYi4AaX9usoVpB7RwYapFbmlI/r9yWBAFiqmneUO89R4SgGXTqij3i26YK6PK+RRFGslPBxLid9eko++PRhtIvUN0dlyb4bdQI/qbEHWnYhxo27ot9A01czYUVyWW1eKLkyINRXonpRpMTt7FUtpyChw1AmAkXAt+3R+wonsEvLT402pf2EiwAhkr7f8e/CfgyC2EaeZb81PrK0EQzDpglpg3xwvByA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UH+tbKF3q1twE41HojAjT/JerYrCNvpP8/kphMGcg1w=;
 b=tBxrbqbSqCtCdK+//AUEM50VBF6KwMrxsqkiSaL+0forGHs/oe1UjnK0cKFCNkU+c/SFuYziZMvkFX0bHgQt80b2lrjjW7Wz52KjmM6CnbypLzoQaZrmj6b6adAA7ZEo0MbAluoBnKeiMRrdhQfF37JfdFd7fCnGE4MU2fvTVLGyFjGshqSpZ3jXSIHol96FDx5eWqLlRBGuygpLDPvAB7PHjylDoR4cCdT1nNlXInxUJ6KrSZZTWP6VbNcGU743sGyTld2WrfAdRnuys9SSYel8Qf15B2sSpCpz/qmONeBGtqVQ+zwNuopUy7kEsmOzXdIm2QAx6NvNaR4O0Bn86A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS0PR11MB7482.namprd11.prod.outlook.com (2603:10b6:8:14a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Fri, 12 Jul
 2024 20:42:25 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%5]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 20:42:25 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH xe-for-ci] drm/xe/huc: Define BMG HuC
Thread-Topic: [PATCH xe-for-ci] drm/xe/huc: Define BMG HuC
Thread-Index: AQHa1IINHAynj7C0BUC/aoEHy+cdT7HzXrWAgAAwDaA=
Date: Fri, 12 Jul 2024 20:42:25 +0000
Message-ID: <CH0PR11MB544410BB43649A38649C8B5CE5A62@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240712173604.2660566-1-daniele.ceraolospurio@intel.com>
 <cdd0b14e-689b-4866-84fa-99696bd42c06@intel.com>
In-Reply-To: <cdd0b14e-689b-4866-84fa-99696bd42c06@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS0PR11MB7482:EE_
x-ms-office365-filtering-correlation-id: 82aab796-5d83-4980-a9c5-08dca2b32314
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ajhJdXlkYTJWQzNuZ0JGeUZDaGcwZTVzbDg1bTdiT3FLMW9RRHAyVjcrWTNl?=
 =?utf-8?B?VU5xRWRPU2NqZ3djcTFETjNrbWZiWi8xbExDL28yUUVPdHpBNUwxKzRhR1B3?=
 =?utf-8?B?YnE0ZnJud3U3Mkh2andENU9qTkxBdVJ0SEl5Z1Qyd0U0djBGcE5qRzk5eFJT?=
 =?utf-8?B?SHJmMGp2ZUllaDJwNGx0cTNZcVk4VHc1QXorWGlrN2tjVVlpbGcrckYzMWVX?=
 =?utf-8?B?Y21CcHphRTBGZS9rUzZ3S1dXeWNXdnROb0ZtamNEV0l5aCt1TUxPWWVNVlZX?=
 =?utf-8?B?OUh0b3lxbit4QWpFN1c1bmcxTVFtc2lWdXVUVjltMUZtb1kvVlhuRzVDcldY?=
 =?utf-8?B?Tjl0Z0RYQ3gxMnlEZXVnMEx0NFlta3lnUEZHLzRBSWRSZTJuc1diL2xRb2tm?=
 =?utf-8?B?ZmFLeVJFbnRXeWU1c2U2MXBBWjlrM21GL3gwT0hCaVlsWUxTR2tiRytJTG5E?=
 =?utf-8?B?anRubS9UUVc5WjdRL1VXYzRSZGlNbi90UmlhMTNGOTVGMS9xVGJYYmRyeGRQ?=
 =?utf-8?B?Zm12MHhPMHdxQVdmN2ppbHBSTy8xZzN6Q0pmWkxiY2h6YnAveW9EM3dJOE5Y?=
 =?utf-8?B?aTFxWFRtS2NkMnl5QTlKaGE5UkZoa0c0NWxKcFgxNE94WHZueVQ3UTZvSlpr?=
 =?utf-8?B?VkRlcnNGc0N4UjZpcG1wNXliTjB6M1dKTDBDSmZlWjlYam01UzQ3a1hYRHZZ?=
 =?utf-8?B?c1VtczQ1di81V2hzeENIblVNd3I0OFNSWFJyV1E5bG5wdDIzQWFwTThmM3Vu?=
 =?utf-8?B?NTVPdmx5azhDVjNzT1JranFiR29McUpzYU8wS09DcWhZWTF1bjNKODNiQUJs?=
 =?utf-8?B?QUgzb3pEaDFSdGtET3k0TzFOUUorWHdKMUlHMmR1LzkxMnFZQzJQanA3aU9a?=
 =?utf-8?B?ZDlHUnQvME1BWUtQZVdCR2dJcEpYZFBPS1p6SnBxcVZwcGNKWGlzNDFQd2NC?=
 =?utf-8?B?WCtNTEJJWXJJQjZzaHZKakQvTXdIdEJLUGM3WjZCUE9XNDhRdUZaRTEyaGtJ?=
 =?utf-8?B?TVM2VEt2ZmNSejc0dmtvK1IzU0VOc2hudUJaakZTT3ZMbVYyRGhvQnFOOW1Q?=
 =?utf-8?B?dnNmY3lpMDExS3hNU1JLd1JGM0lWSFVkbGoxOXJjTzQ3cVNHc1lmT255QUgz?=
 =?utf-8?B?cGIzUlN4YjA3dTc0RGpFdm9HaDB6a1JsbklFaGRmc3JHdDd6d25FV2ZDeE9s?=
 =?utf-8?B?V1FJY0V0VkVUNmdNb3U1czZFSzJsbmk5MXVnc2tFU0JPMWdQb3MrRXIzYkRJ?=
 =?utf-8?B?TDg4SWkrSUk4VUMrRkxtTUdiSkM1Q1dRT1I3RVNQQjYwQVU4YmZiYTBDcEZ4?=
 =?utf-8?B?VEw2RjN5ci9TVDdiamNiRlU2d2kvNzU1MWdUQU1pR00zRjdqSkVoeDdteHRF?=
 =?utf-8?B?VEpUM2ZhcFdBalBFeUQySklLeGcwdWxZMlJIYWZXY0JXWGhOMnVZdWdCcnFp?=
 =?utf-8?B?VjVtd01lTXNPbU1oWE42R29OcHR6S0ZyTFR5ZXhhakxEZEQwaExOUWVFK0FE?=
 =?utf-8?B?TFNLaUlmaHZvbjFJaS82cFlsV2V0djFoNVJWS1VvYVBpV0w3YlZHclFKdWNt?=
 =?utf-8?B?Y1dha1hWTUZzQVhsRms3NlR0dU10S2d3clVvbnp3aXBvWWpFNWRRcjVubWFq?=
 =?utf-8?B?WlN5NnNkVUZpNEQ5NnNtbTVyeGo4MlhqL1hGUlY2NzkwNVFwWUpXOXdFVTJm?=
 =?utf-8?B?UkJmUVZDakRDNTZ4cUdqSnVnRkxoRFIxbXIrU2orWTRFSXhVeGQzRXFzVEIz?=
 =?utf-8?B?L1RGTUVaeU9vNzBPaWkwKyt4OWh0aEN1M0p0S3lRb0xONHFwZ3ZFZlM2alFO?=
 =?utf-8?B?QW9DT1VkN0k2dDg1eGFvZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L2EvT3ArM2JVR3hKQmpOeE5JQjA5UzlkS00zSEYvWHV2aTdrVmZFV1U4MXVC?=
 =?utf-8?B?ZTgwQVlJUHZiYWNUdXFPUTR1Y3VXZDRHM0FEQWMzRHBvdkRHc1oxRzdkc3Vp?=
 =?utf-8?B?YXdZRDZFR0FjeVdWYWVYQ3RzTWsxbkRsZGFNTkFVZmhwQ1FhSmlLYWFJaXhr?=
 =?utf-8?B?NEtSYzViMWFuOGt2OVAySnJsWWV6S3JnaHZWcENZZG1nZEtyYitadE1MdjJT?=
 =?utf-8?B?WC84SUdZbXlUUTJWTGpHdFpQcHJzbmxFQUZzbXU4c1J4dkpodGFNdWFrTXBG?=
 =?utf-8?B?Ym9RZXNKc014Qmh2Smw0dHRlRHFIR2VoR3FuR21Iekd2MGVwM0FteDI5NWdx?=
 =?utf-8?B?UTY0UXNxSVRhR21uaGptRVN0Z0JwU0Foc25IZlFEdUJiTE1leHR4K1ZVZTZo?=
 =?utf-8?B?VTNPd3lOcGdTUURyZnV2dDV3S3ppUm0rakswQndHTGxqMkJpbzRIbUs3bTk1?=
 =?utf-8?B?RUM4eVNMeE9Td3k2N1p3TVRkZlgwZGVGRWhRRERoZm0vS3JjL1lrSzNVSGNi?=
 =?utf-8?B?TnVqdDJGaER0a1dpTnZ3TmtvSWVaV2J3MGFaeDNBQ0xsS0tjNGpDUWpiU1dP?=
 =?utf-8?B?K2pTSm1yUWViTlo4eEpGak03aE9NTWNvUnRSOXBnL3pNSmV3VjJOKzJFbUJX?=
 =?utf-8?B?b3FBUytyWHZoUmFXZjlmcElwK0NwdS9WT2pLem9leDBBeDdGTFZWQWpPdm5q?=
 =?utf-8?B?OXl2eWtkSGRBcXQweGFCQitGdUdIN1ZNL1lKMDQzcml5eE9uWGIrZVo5OFVI?=
 =?utf-8?B?a1YrVGR0cjFVKzRNV05tcVpROGZOOWc0TUJRNXd3YVVock1kN3RyQmVZQlRh?=
 =?utf-8?B?c01EWm1BRWZBY05VM1RYOGlYR2RqNmtzK3htb3FvODNLMTlWeDZNWTRsK2Jy?=
 =?utf-8?B?TWhCTzhHTTZ2K1RNV0hGVVFhN25OK1VsbmJUU25tUUlKdldQNkkrcFQ3a1hN?=
 =?utf-8?B?b1cyOW5qK2x2RldxbUdmaWs5aHEvWUlieEs0QTVrYVdFdm8za3FpYm9IUDdI?=
 =?utf-8?B?emQwb0JveTg4VkpzV2RyVmNaNkFBZ3J2UDhBNXZIaGlTeDlhdVZuMmNHWWJW?=
 =?utf-8?B?UmZHWWYvdy9oTzJTSUdRWDhoSzl2NnZ2cWhHdzhzSWpGakxPaVZMcWY2UWx1?=
 =?utf-8?B?Qjh4Y3NHeTZZWUc4Q1Z3VGIxcWI4Y09xNlFSYXo5NUpVdm5LenBlb01kYW5F?=
 =?utf-8?B?eUhqWUxMWlV2WXVFR3I4OUMvRlFiZlpLdWoxUVFxWHV6TkJ1R2poUjFwdjVl?=
 =?utf-8?B?eks2dW94OUthZW5mcG1pZjlhdUlVbVVWUGJEQ0NTcE85dSs0dzM2ZWEvSGpT?=
 =?utf-8?B?ejZhU1JxQXdZT2R1OHl5UDI2MVhKUEJucjVNTHFSSU5keG53ZHNhakpYTUZK?=
 =?utf-8?B?dDFSY3hOYkFIMENpaStzYTdPWExTbFVjN3Jqd3lCKzBTdXdRbzRmRGRTU2gx?=
 =?utf-8?B?YVpSYW5lWGh6ajBEU0p4OTcxNW93NGpmdkE2YUxqZ3ZHZTQrbmtqT0cvT2Y3?=
 =?utf-8?B?TzRkV1ZyRHVhUENyMUllSnBHSHloRGlRdXlTWS9zT0xoY1Q4bkVvUUVHNk12?=
 =?utf-8?B?azg5RmlhNHdmMEEwaGh1VnJycFVBNVRQSElyWmRWL2dvQ1lZWm1oY0JYV1Zs?=
 =?utf-8?B?QVVUUEZjLzV1QVJKR0lLcFU3dTRvNTdlNVNudWdMOFk3VG9zcjF4aG1CRDNy?=
 =?utf-8?B?eENmS3JCL2J6OEwyRHJka1IxcTcrcWJFSk8vK1JaR2hVZVBtejZrNHlYVVNm?=
 =?utf-8?B?b2RDZ3BJWUNsZDBPZEhJMnRzeEhMdDQ0Z3BSSHZUVEFpY2lmRGdiOHRBRVZK?=
 =?utf-8?B?K0NFNitDTzVBdkd1a0ZYb0l5K2tzRmxKdzlzbkdyeC9qN3E0N0l3TFkwTk5U?=
 =?utf-8?B?QUpkZWpST3FVYVFiL09tZDdsK3lIQ0l5bmlpZ1FNVHhicit1NllBMytSeEda?=
 =?utf-8?B?dm9BaHpBSWdHNExjY2VPZ3E5R2VJckxkekxReHRXM2t0NHlaVmsrYWR2Z2gv?=
 =?utf-8?B?anlZMnR5OW93T216Qm5xRGZyTTNPTDcwTE9MdXMrbERvY0pTU2NkR21PWi9x?=
 =?utf-8?B?VUlBYk1JellQUjNGZ0hUQllZVHo3dE0zc01scFRGVExkb1RZVFV0cWNFT2Ni?=
 =?utf-8?Q?a4xUP5AckZQKGsm8RqmpeaQro?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82aab796-5d83-4980-a9c5-08dca2b32314
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2024 20:42:25.0942 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: stpAF4OW48nEhNg8yYwbHLJO17QG8VgOcQnIQLhbaJ6UkPvBLMTQm1Plkf7NEzueUqyzzwd6C2HsGIBsAXeAOmVcv+4qzdktiEHVe5IyM0g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7482
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEludGVsLXhlIDxpbnRlbC14ZS1ib3Vu
Y2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIERhbmllbGUgQ2VyYW9sbyBT
cHVyaW8NClNlbnQ6IEZyaWRheSwgSnVseSAxMiwgMjAyNCAxMDo1MCBBTQ0KVG86IGludGVsLXhl
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KU3ViamVjdDogUmU6IFtQQVRDSCB4ZS1mb3ItY2ldIGRy
bS94ZS9odWM6IERlZmluZSBCTUcgSHVDDQo+IA0KPiANCj4gT24gNy8xMi8yMDI0IDEwOjM2IEFN
LCBEYW5pZWxlIENlcmFvbG8gU3B1cmlvIHdyb3RlOg0KPiA+IEZpcnN0IEh1QyByZWxlYXNlIGZv
ciBCTUcuDQo+ID4NCj4gPiBUaGlzIHBhdGNoIHdpbGwgbmVlZCB0byBzdGF5IGluIHRoZSB4ZS1m
b3ItQ0kgYnJhbmNoIHVudGlsIHdlJ3JlDQo+ID4gcmVhZHkgdG8gcHVibGlzaCB0aGUgSHVDIGZp
cm13YXJlIHRvIGxpbnV4LWZpcm13YXJlLCBhdCB3aGljaCBwb2ludA0KPiA+IHdlIGNhbiBjaGFu
Z2UgaXQgdG8gdXNlIHRoZSB1bnZlcnNpb25lZCBmaWxlIG5hbWUgYW5kICBtb3ZlIHRoZSBpdCB0
bw0KPiA+IGRybS14ZS1uZXh0Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogRGFuaWVsZSBDZXJh
b2xvIFNwdXJpbyA8ZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGludGVsLmNvbT4NCj4gDQo+IEZvcmdv
dCB0byBhZGQgdGhlIGdpdGxhYiBsaW5rDQo+IA0KPiBMaW5rOiBodHRwczovL2dpdGxhYi5mcmVl
ZGVza3RvcC5vcmcvZHJtL3hlL2tlcm5lbC8tL2lzc3Vlcy8yMjYwDQoNCldpdGggdGhlIGxpbmsg
YWRkZWQ6DQpSZXZpZXdlZC1ieTogSm9uYXRoYW4gQ2F2aXR0IDxqb25hdGhhbi5jYXZpdHRAaW50
ZWwuY29tPg0KLUpvbmF0aGFuIENhdml0dA0KDQo+IA0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3VjX2Z3LmMgfCAxICsNCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV91Y19m
dy5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3VjX2Z3LmMNCj4gPiBpbmRleCA2MmVkNDEzYmYx
YzMuLmMxZGNmNThkMjVkNyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
dWNfZncuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV91Y19mdy5jDQo+ID4gQEAg
LTExOCw2ICsxMTgsNyBAQCBzdHJ1Y3QgZndfYmxvYnNfYnlfdHlwZSB7DQo+ID4gICAJZndfZGVm
KFRJR0VSTEFLRSwJbWFqb3JfdmVyKGk5MTUsCWd1YywJdGdsLAk3MCwgMTksIDIpKQ0KPiA+ICAg
DQo+ID4gICAjZGVmaW5lIFhFX0hVQ19GSVJNV0FSRV9ERUZTKGZ3X2RlZiwgbW1wX3Zlciwgbm9f
dmVyKQkJXA0KPiA+ICsJZndfZGVmKEJBVFRMRU1BR0UsCW1tcF92ZXIoaW50ZWwtY2kveGUsIGh1
Y19nc2MsIGJtZywgOCwgMiwgNikpCVwNCj4gPiAgIAlmd19kZWYoTFVOQVJMQUtFLAltbXBfdmVy
KGludGVsLWNpL3hlLCBodWNfZ3NjLCBsbmwsIDksIDQsIDYpKQlcDQo+ID4gICAJZndfZGVmKE1F
VEVPUkxBS0UsCW5vX3ZlcihpOTE1LAlodWNfZ3NjLAltdGwpKQkJXA0KPiA+ICAgCWZ3X2RlZihE
RzEsCQlub192ZXIoaTkxNSwJaHVjLAkJZGcxKSkJCVwNCj4gDQo+IA0K
