Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CC2E77180
	for <intel-xe@archiver.kernel.org>; Wed, 11 Dec 2024 18:54:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6483C10EC04;
	Wed, 11 Dec 2024 18:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IKGS/RPl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8273810EBF3
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Dec 2024 18:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733943292; x=1765479292;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2xSsyNV+CJCfxafyWan2h3WOirqdv5i0wKwdzX7ANmU=;
 b=IKGS/RPlpVjxWAP2VkFFZ1LTThBB9lbru4X6YY0PAxh1N8OKeTxgBh5d
 Huv3PLBMGPrgWBnEgi3/2tc0gCeVUwmltgBGkWXHT0PJYePwGMbZPXBVU
 LUsOpLLQqLAWv28waV1SwD/zGQy3iDc958u6S+gEA64wV/qs5RRsBlWaV
 ZbmdLzPOBmyctRJbTCyP0oSD1Wfgl5tAORCpKMVKAr2aJ8EBpDgC3qdkh
 poxP5hyNLFYp6ncGH/xbnSZITKuSz4afcQ5B8CgrqZ1sw7LaRmuoMR2N9
 JEKdi/UHJsfnxIIRwt2PK78mLGhkIKnvUCHKnY2l0H+aerqj6KwlK/N85 Q==;
X-CSE-ConnectionGUID: kiMmUZd5SgWdTz/FxOLFBA==
X-CSE-MsgGUID: EciMUP0rTQa/ULpDSDPrDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34475619"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="34475619"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 10:54:51 -0800
X-CSE-ConnectionGUID: g2Z7NRi3SrO93DeSjcHX0A==
X-CSE-MsgGUID: rvogXeaeTQedPWZyXmBRew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="95775710"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 10:54:51 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 10:54:50 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 10:54:50 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 10:54:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AtueYlnKvS4dIywOgk2nVQFPQRXlDTnA7x8DhOoxx692Wb4kD2Lb1lzOF6DbzziPXShIQpfTODYrZ43QeM2Os6wEIu5gqfSc7/CWraFtTLOfmA8HiQHThVF+tBQzGIOA4F0MXvA7Lo25lnnyjce0mttt2qQxDWbmkDpNoeSRDtcE7/kjw2/f12RV+fYHvQLVh5wCYOdnF05MEEBLPdsB7ZrDHWT26eDSxV2Z0tElZ8JOHBtRPkVrRe0zmHBbwt7k25EdS0X/AWLALXb9Eiui8gdDPzMO9HgVy2GxGH00weh8ABfH8f5YfQ4tkyejfIc759tki10G3cqz5oOp6+QTfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xSsyNV+CJCfxafyWan2h3WOirqdv5i0wKwdzX7ANmU=;
 b=bbHBYNnTuY6iVmLOTfmv3N5dFbx1/C4U2zA/4kIkX4/eMKAuJ1owsb8bTIiotbTKHDqvz91s0uGeW5fTQigceia+DCa1+DcZROPhAnfsx3V00XcXjqNuVBiR5EiOj5066Pmz5Z0CKbZXH0Izm43CPO2uTbkc3NTMDTQFDV9fmJ8G4WvqK2Q98LCTz4irJC76p9czm//hxEEzWZ2mpRIzhmwAYmSHs16LY03bUAUYBZsdW18O4ijPMFMsDlue3qCZK33PPSYdVPoUdknAgxWy6oJnB7h2tOYswyivX+lvObUq/VHXhZXUzlMvAGZXrMTtXuAnn1Ff45XDbR2AjQ9pJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5655.namprd11.prod.outlook.com (2603:10b6:8:28::10) by
 SN7PR11MB8028.namprd11.prod.outlook.com (2603:10b6:806:2df::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.16; Wed, 11 Dec 2024 18:54:33 +0000
Received: from DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::f6db:9044:ad81:33d9]) by DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::f6db:9044:ad81:33d9%5]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 18:54:33 +0000
From: "Saarinen, Jani" <jani.saarinen@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Upadhyay, Tejas"
 <tejas.upadhyay@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/ptl: Add missing device ID
Thread-Topic: [PATCH] drm/xe/ptl: Add missing device ID
Thread-Index: AQHbS9ZBD23lP5c+dEiWKK5PRtO1CrLhWjGAgAAKEyA=
Date: Wed, 11 Dec 2024 18:54:33 +0000
Message-ID: <DM8PR11MB5655271C5A1A5136A375D9ECE03E2@DM8PR11MB5655.namprd11.prod.outlook.com>
References: <20241211141306.2156467-1-tejas.upadhyay@intel.com>
 <Z1nXNwEpER3vwazN@intel.com>
In-Reply-To: <Z1nXNwEpER3vwazN@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5655:EE_|SN7PR11MB8028:EE_
x-ms-office365-filtering-correlation-id: 2cd840a8-dab4-4437-ada4-08dd1a1540b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?c1dDUUNyU0svc1lPT0lORkFnQ0xGaEdwN0VLQlRuVEJFTGJCbjA2WkVmTnhI?=
 =?utf-8?B?ZFNaZklOVTA3aUlYcllORlRiU3phNHF3bzMrd0VJdURsLzF5QXF6ZUIvYys5?=
 =?utf-8?B?aE1NeGxoenVZaHNTcTJXamx1TXpqaFJNS2oxK2F1OS94NUdRMGs4OTlDS0lC?=
 =?utf-8?B?N2x5aFVIK1BLbjl6TUZibmNmUFcxcHpZaFlJbjZIb2RCL2NDRk5PNWNndEJ4?=
 =?utf-8?B?dDNyWGl5T1FpaUtnZGxEcm1ZME1vb04rNHdTUTBLcStWaVlIRWNtQTRweitT?=
 =?utf-8?B?UTdneEdxTXJ6NnByekxhQkVwVWdnd1dKajE0OE5lWmtRVzZvM2tzSVBSdllE?=
 =?utf-8?B?L2VmUjloNXBiV2VNMHFTbHNwOHRRUkpOZEsxSUhKUTVKUW5FekIzQUZoT2dU?=
 =?utf-8?B?bFovNFdvdTM5bkNqQ2ZPZkFsaEJWbE1hS1RDcXZIZHF0Y0lYQ0NhcExUZFha?=
 =?utf-8?B?VnFUVHNVa1l4U0VVMFNTNG9vRk54STlpMFNiUWxsVGIveFB5RlgyZzhod3l0?=
 =?utf-8?B?TWVoa2VYLzRFanBGaWNqM1BHU0ovRXNTWlVzRDQ0RVZ6WXQ0ZFhzZHdhRVZX?=
 =?utf-8?B?UG5Zb0NCendsSlFTOUk1d05mQW1FLzNQVkFFRmNHZUlIVUk4b0lMa2lDQ09O?=
 =?utf-8?B?TjA3Q3hwekV5VzBVSnVnbVh6VFB4RkZQNm5JbkRkdndzd01lL2xvRGNhVVly?=
 =?utf-8?B?RTdkSytVVzRrTktMSFQ4M0JxT0srSkRBWDRqTHBwVUdjUitUcEtvUG1jZW56?=
 =?utf-8?B?UWxoeCtheVVKemFpT3VxTVVYd3l2RVlwS25mVFJYd1dER0xHV0hnUnB6Q3JE?=
 =?utf-8?B?aEVURmJNajh3WEhSSUVmaWZJSFVxZ1U1M1Jqa1BOT3BFUXhBWXFERzRTTmtV?=
 =?utf-8?B?aEZxeUV4Tkkxa045SWVhVjNwNFo3QWM0VXlOc3MzUnlmRk04WXRNTi9wSnN1?=
 =?utf-8?B?V1VIaWMxOG4yTkgya3ZKR044aTZIMURSZGVJWktGdWdOSlBVSXBmM1N5bzNu?=
 =?utf-8?B?ZkxzNGZJazJSaXd6T25UT3FQQ3VXQ2VyV29NbjRjMDZ2MGhPR2VUdXlQWVYw?=
 =?utf-8?B?ZksrcFdpMTl3NkJCNTdjSnFWbGRGNnNJbkJXZXVCUmN2eWVnTkpSeHVtN1g0?=
 =?utf-8?B?aU9waU52dHhPT2JvS3RPYjBvQjc4MGVJbmRrWHMxRkNnMlNNQ2pENTF5VTZF?=
 =?utf-8?B?MzhXUnBPVStLTVJDYkltTW9zb25KdURPaEt5S0NQMXFKZm8wQkY1SVcxL2Jw?=
 =?utf-8?B?dGViTzNLa2Z4SGVhRGlvZUFxbGFZRm83dkMvWERQTDFvV2tBblJHWUVPZW53?=
 =?utf-8?B?K0FNbER6OENNNjBmZUxOYWZoalY4TnFsN2w1c3RFdmJXdVdOWTNXRWVTQ1dq?=
 =?utf-8?B?OE5uOVc3SjQ5TVdJN2lmNmVOY0FtNzZ2OU5XdGR6SmJDdTB2cXorZy9vcFVW?=
 =?utf-8?B?S1RBT3lBZ3RtQzUxL2lsUW5JbUMyamhSYTFyVEVCQ2dEbW9sRVNDcnVRRlc4?=
 =?utf-8?B?S1g3bE5FWUM3dHZIQWhtNlVkRUw1K2RpcG02T2tQM0xIRHVEcmI3bDNWQ3Zu?=
 =?utf-8?B?M2V3OWVMdk5QaWRTZDZXS0tJd045TGxWRGFTbHluT0I1Ry9xMWVSclIzUGlz?=
 =?utf-8?B?TkQ3WkZXZ1A0M0dJQWIxV09xeXBsS3dtTHA5bk84RjBoSWtXVWZHZDBlWERn?=
 =?utf-8?B?SXZyTHdiVkV2ODdYTVRPalJZaG83dnY0TFRKTWhpMkIyckl2Rnk0a09wUU1u?=
 =?utf-8?B?MzhHci8wVXlneFduZGZrOXhJVDliUGpWNlprVHBHK0Z4L1Z2RHpXMjNDT0Q0?=
 =?utf-8?B?U2FIbXRpRlpqa2ptYUdMVEowM2ZEeTJDQXBZZnIvQVI0dVJFZjlnT081Vzcr?=
 =?utf-8?B?Y3VoV04vL1hCRi82dG5ESGZIM3dMTzFtOWpyVVlMT3N3NXc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5655.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dlN0UDNPbmZ0Z3g3ZzczUC84eFFIWGtZYi9Fb1h3WnhhdjhaQ0R6V1BLYzRS?=
 =?utf-8?B?UzNjWko1N1RLVnBPVTlzZ1RxZS91RVVpZk5MYlVaaUdCM3RlRW5TQ0x1NGli?=
 =?utf-8?B?ODY0dGhnUVRzQ2lJNHFFK3JrSTNENmNXRlVzZEFpNXRoSUZLakFFQUdyalM4?=
 =?utf-8?B?d05RRjdIcndLWVRsR1JuZXhYSVZmeGN3aWlKTmpLSU0yV01NUDhsRmR4OVYr?=
 =?utf-8?B?VUZUZEdaL0FQbU0xMjJZUVNzNjVhamVtKzhNcXdRYzJRMFBmaFp6M0Z1bU1n?=
 =?utf-8?B?S085b1ppUVRVK01Ub2p6OUFyYnA1Y3pnNjNQTExvdEp1UWxxazRBQ1FDTXZn?=
 =?utf-8?B?VS93eSsyQm9BVlFtYzkyamlETGZtcXZXbnpzOG1LTWRkNjBOL1g3d3I1ckJk?=
 =?utf-8?B?b2psQndabHdaVXZ5blBqaC8wQVpIQ3ZqZjNhdFZYM1J2cmJIZm5SZjJzU3kr?=
 =?utf-8?B?ZjZxTi81RHdlMDNKZE1zUktlUzdab2lEYmpNbTU5eXJwQjRJL0tJZjJXRU5Y?=
 =?utf-8?B?YUF3S0Y3aXJtTnVnd0ZpNE5nbXYwNWd4Tk9JcG02bDJlNXU5Mm45WVdKb2NZ?=
 =?utf-8?B?STBORWEzRG5UcmZFSndLSTVBRmV6a1c5dEMzZWRmZUp3OE5yL0haeXhzc0V0?=
 =?utf-8?B?ZnNvZWo3VEN0ZzdidmpndGM0NXZQS0dSR0Y0SkQwb1ZiQm54WFZzQnJtbnlD?=
 =?utf-8?B?RWlpQytSUjZJQnhEbkcrWnF6a3Azakp6TUxDbjFaTWd4TDYzQUdiMFFUTGYr?=
 =?utf-8?B?S0dzMytlRHJXZTAvOHFsNmJoeEMrTlJodE9wa3ZpbTUwTDFSbDhpM0luMDVz?=
 =?utf-8?B?ZjlxRzFaMWFraTM2RTN6ajJ6Ty9XeVhxeUR3bzhJT2N2M2phQ1FPYkZRL1pG?=
 =?utf-8?B?Zmg4Tk10c0sxbmdudlluWDlGbGYwa3E0ZjFaOEdESzNOaHZmeVdTTGl2dkha?=
 =?utf-8?B?bGtISTh4S0JzSW9sMklyRlM2a2JrdTYzZGM2Qk5icEFEa0xwRHRRTXFpWXBj?=
 =?utf-8?B?U2g2cktaY1NleHE3MU5Hc2w3YjdnVnJwcXJ6WUdWSGRZcTNYZmU3alJjeWJ1?=
 =?utf-8?B?cGZ0MGsveURZMFJrTHJpMGRJR0kwRmZjcVJYT1JDM2ZNNm1yTUdkUjBObTU3?=
 =?utf-8?B?a0xWS3NQNjhrbEJISHhLeEpVbHRvQlN0ZTArcHVkM2lPTlh2TGhMYkV2K0Zq?=
 =?utf-8?B?VkpuNE5uY290RWJPSDQyc3lEU3VFQnNsZzFRbklLU0lQK3ZxNUVUZXJPOTZS?=
 =?utf-8?B?OXlHT1IrNWVuK3lJMzJFUHlpZ240dVpnWTl5THo4Zjc5UnBMc3RRWjkrYmFW?=
 =?utf-8?B?ZjZyc1pWeTVXdW9jcXBKbllpWGFZdzFDaVRqU290N2ZGeFgzNUpUWDlxRkh5?=
 =?utf-8?B?YVh5OGFPeWh0REwzSi9KTFpTNzR3NXB6Q3RGODNVZDA4eDNySTRVRVZIQTFJ?=
 =?utf-8?B?dGN6azZzTFFJMGJ2SkU5RHNUaVRBZDR3ZDhXMDNyZ29yOGtwb0M0MmZQWWw3?=
 =?utf-8?B?WTRWVUZWejBOT1YyRHNqNkhodDhSWDNhNWJxOXlLZDlDV0FmU3hBQWNNQyta?=
 =?utf-8?B?ME1iVkFzMjVITFJGWlRSRE5CTng0Q1ZsWWZYWGE0aFNuclhNc0RUSXh6SnRS?=
 =?utf-8?B?QnRKOXhYR3lnbW9Tc2lLcFdRS0xxNkVKSTdaSURWbnZ3dENoaVdlSlVHYXdy?=
 =?utf-8?B?enhLZUhRTEh0WUtWUlJsdWRZM1dvRFJqMzdWZnpVbzZlQmRpWk8wVVlhTjlt?=
 =?utf-8?B?enRRcVJ5akp3OVNvT2swZGpWREVQdGdndUZTRTBwY3ZJSnJ0aHNCVWRycEdD?=
 =?utf-8?B?Nk9qTGNnYVJDYU0xNVExYjlBcW5tSGZQN0szdjNiekZtRmdRRlFFNE5oQWpy?=
 =?utf-8?B?RHVhcGdvUEhFZ1ZVUEJDL1pmVTh5SjhYUmppSFF4OTk5ZlRDcHlGU25LTG5L?=
 =?utf-8?B?a1VhRXF0aE9QQU12bU1wT3RPNkFZM0cwejVpZ3lxbE1VSDJ5RVlYUWgydzNK?=
 =?utf-8?B?VFp5UHNCV2gzaHEweTRpOWZ2dkJnbmZpQTcvUlhuZmxBUE94TExUTU9nd01y?=
 =?utf-8?B?UDNFSU0vZGVzOUhHSWFDTHNFQjJuUmg4U284SWJTM0pFMWM2MXNsaDl1OTZk?=
 =?utf-8?Q?6ftVpQd0anRFOSg8+nurb9wvM?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5655.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cd840a8-dab4-4437-ada4-08dd1a1540b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 18:54:33.8334 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ac4Ux5iHFJncpfoO6mvr55YfGuwbiyfnUJSvkheLkhoZpdkHdBEkVRwhOOX+PKmiQTwOmysJ9h7IFLamkB2xCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8028
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

SGksIA0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBJbnRlbC14ZSA8aW50
ZWwteGUtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBSb2RyaWdv
DQo+IFZpdmkNCj4gU2VudDogV2VkbmVzZGF5LCAxMSBEZWNlbWJlciAyMDI0IDIwLjE3DQo+IFRv
OiBVcGFkaHlheSwgVGVqYXMgPHRlamFzLnVwYWRoeWF5QGludGVsLmNvbT4NCj4gQ2M6IGludGVs
LXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0veGUv
cHRsOiBBZGQgbWlzc2luZyBkZXZpY2UgSUQNCj4gDQo+IE9uIFdlZCwgRGVjIDExLCAyMDI0IGF0
IDA3OjQzOjA2UE0gKzA1MzAsIFRlamFzIFVwYWRoeWF5IHdyb3RlOg0KPiA+IFByb2JhYmx5IGR1
cmluZyBtb3ZlbWVudCBmcm9tIHhlX3BjaWlkcy5oIHRvIHBjaWlkcy5oIFBUTCBkZXZpY2UgaWQg
aXMNCj4gbWlzc2VkLg0KPiANCj4gUGxlYXNlIGNoZWNrIGlmIHRoaXMgaXMgaW5kZWVkIHRydWUg
YW5kIGlmIHRydWUgYWRkIHRoaXMgd2l0aCBjZXJ0YWludHkgYW5kIHdpdGggYQ0KPiBGaXhlcyB0
YWcuIE90aGVyd2lzZSBrZWVwIHRoZSBtZXNzYWdlIHNpbXBseSBhcyAnQWRkIGEgbWlzc2luZyBQ
Q0kgSUQnIG9yICdBZGQNCj4gYSBuZXcgUFRMIFBDSSBJRCcuIEFsd2F5cyBpbXBlcmF0aXZlIG1v
ZGUuDQoNCkkgc2VlIHRoaXMgaXMgbm90IHRydWUuIFRoZXkgYXJlIHRoZXJlLiBQZXJoYXBzIHRy
ZWUgbm90IHVwZGF0ZWQgYXMgYWxzbyBidWlsZGluZyBmYWlsZWQuIA0KDQpCciwNCkphbmkNCj4g
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBUZWphcyBVcGFkaHlheSA8dGVqYXMudXBhZGh5YXlA
aW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBpbmNsdWRlL2RybS9pbnRlbC9wY2lpZHMuaCB8IDMg
KystDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkN
Cj4gPg0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9pbnRlbC9wY2lpZHMuaCBiL2luY2x1
ZGUvZHJtL2ludGVsL3BjaWlkcy5oDQo+ID4gaW5kZXggMzI0ODBiNTU2M2RiLi43ODgzMzg0YWNk
NWUgMTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS9kcm0vaW50ZWwvcGNpaWRzLmgNCj4gPiArKysg
Yi9pbmNsdWRlL2RybS9pbnRlbC9wY2lpZHMuaA0KPiA+IEBAIC04MjksNiArODI5LDcgQEANCj4g
PiAgCU1BQ1JPX18oMHhCMDkyLCAjIyBfX1ZBX0FSR1NfXyksIFwNCj4gPiAgCU1BQ1JPX18oMHhC
MEEwLCAjIyBfX1ZBX0FSR1NfXyksIFwNCj4gPiAgCU1BQ1JPX18oMHhCMEExLCAjIyBfX1ZBX0FS
R1NfXyksIFwNCj4gPiAtCU1BQ1JPX18oMHhCMEEyLCAjIyBfX1ZBX0FSR1NfXykNCj4gPiArCU1B
Q1JPX18oMHhCMEEyLCAjIyBfX1ZBX0FSR1NfXyksIFwNCj4gPiArCU1BQ1JPX18oMHhCMEIwLCAj
IyBfX1ZBX0FSR1NfXykNCj4gPg0KPiA+ICAjZW5kaWYgLyogX19QQ0lJRFNfSF9fICovDQo+ID4g
LS0NCj4gPiAyLjM0LjENCj4gPg0K
