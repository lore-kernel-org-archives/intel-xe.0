Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6003EC624D6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 09:27:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 517B110F0B9;
	Wed,  2 Sep 2026 09:27:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DbD4AikO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4BA510F0A3;
 Wed,  2 Sep 2026 09:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788341243; x=1819877243;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Zj8MKQXJT8f2LYzVwiQOh9AC2/HYwGwrM6FH7kQSM6Y=;
 b=DbD4AikOe9OTa5/ZW7ND3LoyMeCe3KtwsbTg3WgqWVlvq4wOwnH8JE91
 7qinGpfRlc2lqG6VQoUMseZkAeV+Du3Gmy/FgrCttz+f/xO9jvTPOM7yt
 U0gosdKbbeOkidzdUokAqWFBb79llC2WLABef0CHhqdsyaaUlsWBHU+5j
 +McIlTqR6aRfLpLo+Utjcc9luGNSuK/U4pTnZdeHCt0rtprE1G/4m/UD6
 9LIfrSJNm5NVlL4KTQHUcY2w6GJJN34OlyUo8Rut7x6ctpxlp2r0NC45H
 3fp3Mf4LcRRRaLR+aY2v8qbHOlLmSbpaLP1xTI+6Q68MsPnFTkkICjKS7 Q==;
X-CSE-ConnectionGUID: cy74P91MSHa1CCvdHQ2kMg==
X-CSE-MsgGUID: zq56Fn8qSJaPQc6GsfaZ6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="99391183"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="99391183"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 02:27:22 -0700
X-CSE-ConnectionGUID: pnHXsP58Q1ak9kMgSqyNUQ==
X-CSE-MsgGUID: YykoWUToQ0C8yymI891d3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="265059322"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 02:27:22 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 02:27:22 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 02:27:22 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.30) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 02:27:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GrT9tack6N/C224SZjXldQtrF1piOCrmCbuzorj7/43IYdeurU6iIcEqo/ZIRamPDoI5gST9WULXGlRE21vm+Ikx9mDI/jLnHJthGpr34KGCz55MNSpBTLReGfRnGcrmqB5lFSYQlcSQhGWR04MQGGmCLhGW6xHy7q0PFRU8KMtG+t2j5l3SEz/rZS/7o5sJq4Hv1Z9AJ1SrSnLj5kul3hFFfkIOKies8XKVcXuu6BH5I69/l/c7dvz260X7mz2Ur6J9i9Eprdsj0pp2UcMCCIjy6PGnE2N9zDxpdXIMMdvqOVhOfkR1qJDFzjVsX49y3c/W9W8sVaTcxWfJBhUdeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zj8MKQXJT8f2LYzVwiQOh9AC2/HYwGwrM6FH7kQSM6Y=;
 b=JGIUoTXGmWPvqsIQJwOR2K+nwqxxgfLzzHmIvuri7bWXNuE4g11JUhPiI5btN6e0FR0xBBL5VgV17bR2mIMRGblnU5qI6JAFWTRoucAFu6a9iNGgaxjC4UemR9XeimoEcHTLkR6/bcDaWlIaSM5ef8o6cgle3mqFDW6SQ5SKZwuEgNIj+Bs/QNXZh6HazwgwXWgg89HKJTqZw6MB2AiMmBOJAwiCzaoRNAYAjU3JSfc6xnTpqF7l2CWllGkzHMIbNXBsUiHnefdIxn3hQJpgqjSmgWHr0HMhIsNwlrsUNYIvnUFUet9lbhsrKcMQdss539abJgEJlMSR1YiYiy9xTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 DM4PR11MB7759.namprd11.prod.outlook.com (2603:10b6:8:10e::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Wed, 2 Sep 2026 09:27:14 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 09:27:14 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Manna, 
 Animesh" <animesh.manna@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: Re: [PATCH v5 10/15] drm/i915/alpm: Program LTTPR count for DP 2.1
 ALPM
Thread-Topic: [PATCH v5 10/15] drm/i915/alpm: Program LTTPR count for DP 2.1
 ALPM
Thread-Index: AQHdNFm4Eo60FmU5BkyfZx77wkbFTra7EcQA
Date: Wed, 2 Sep 2026 09:27:14 +0000
Message-ID: <fa29aad5aaab3725d9653def18afa6407002b67d.camel@intel.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
 <20260825054536.3455704-11-animesh.manna@intel.com>
In-Reply-To: <20260825054536.3455704-11-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|DM4PR11MB7759:EE_
x-ms-office365-filtering-correlation-id: 6679d4ff-e88f-42a8-8893-08df08d45fc9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|4143699003|38070700021|11063799006|10067099003|18002099003|22082099003|56012099006;
x-microsoft-antispam-message-info: b6uVfzimVBJy0rFNaPGRE5vv428FFLd63dcdsw/QXljgiojW0eLfv4IaGPH6fQEov61DAMTHUd1riqnqEvHQtjHSa2wgp5fia9AY2pK74T2PEWNCzJD6EOmHAUIdxnCqc5RZGdZUgJonVbdomwg/BkxzcJfZyg0J9PdONMK3dwC2E1FyNKoCDYvYaJblCGJB00MIRLtbLv+htc4di6Bpnsl9xpmqAleRJRjOnnK4wOlTBbhEQD9Y+F98pkm325dTa/t3bgw0qeX8Ypy/dSWQ9jZhmOsMgMRVZNBqP8AuFbBLDeTaEjYa3fQmlHm431toMikDNv1g8wIwjGWdulorNzha+4nUBvotnC7q+SB/jl1Hi0pN7sRbh/9KGNjRVyiVJOg3jmmEQw/jfWZwkxpc1k/hixcfKn8s+r1HIi/jRO1SyHDKOKUtiKo8CQJlxmNoyoInBXIO1Es2S3njViMHmYIomGGBFg43xE+Oy2pmEVyJlQichRjNu2WykTAfO3FkodfaQXC8e2KMk7pZWnIzwVWKtBwqSFye5Z9B8wjKDpdme+hg0wZ+LtGlhEB4zbMMLnOr5TmY1dy/n+rji06i24QNI6kwzD6NFhfSAAld03bxin2xxBagppvlxTI8WYsqNfsMtwPe0mq9rjNK/+SnR/0Ci5QDGX7pzEt9vvNmbaSaCDX5niQOB0TY1DiXBFXP2Zy049QoXdArD86lOgZwnw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(4143699003)(38070700021)(11063799006)(10067099003)(18002099003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cjlUZllaVUczRjZjeEdHY1FueHNpZEp3V0lkMGpGWEJFNHgvS0FOYUEzNW14?=
 =?utf-8?B?eVFiL3NkaTBIOXNHajRZUUIrL0wvNVEwMEdLYUdwMVB0bzd2L1BvZzRpUmNl?=
 =?utf-8?B?cFJUbEdEem9BRGhWanpIK1dkRldUM2xUQXRwcXdEQVJjeUxKU0lpYnplbEEy?=
 =?utf-8?B?QWVCZWZMTzgrNXlpVUhCRTV1QnRFcEJyYjRvekl6ZDc1bEVUeC9oNXBGWEdr?=
 =?utf-8?B?cS9QcGpmZ3UyMGhRNmR3VWxUcnU5QkxmZTJQQ3JUeFNxUy85U0dodHlTa3Bl?=
 =?utf-8?B?cVJJL3ZDRWJ1M01xTTZpajBNbnNHQWROVjdUb1hNOEJsN2xCUkdsdEZHc0Ex?=
 =?utf-8?B?SGFBWURWTDVPMVFVZHBuZXNTcTBJQ3VsZ2NBWUpoVC8rVW8zQmlmdEY2SFNG?=
 =?utf-8?B?Yk9jYTg1Z2hlL1JCNHdFandTSE1wNE95eEY5U3M3ay9NdFcySG5ubzJHMHMv?=
 =?utf-8?B?Y0xkeTNEUUlCa1FYYmZxK1NBMDhoT292VXhCcUpoQ2ZZc1ZUU2drUkpONTRO?=
 =?utf-8?B?QUFEMDJrblVhWkMxTE92Zk9FMTBJcFVPZkZtQ3JrUWRCZ3Y0a3Z1VjduL0tn?=
 =?utf-8?B?WDI2emhobjlsRGh1ZDFFd2Zmd1UyUDFPTWhhRlRoRXJjL0trRUxMNi9ickl5?=
 =?utf-8?B?LzFLSjhVWlUrL1Ewd3Rqeis4aGI1MC9UMnljaU1UUnJ2TXo0VUxVWVJSbmlE?=
 =?utf-8?B?d0dHZGplNTd1OFp3Q0k3Q1pGN21oU3JVNEgrRHdQeEhlZWxBMHdHcHFjMk5X?=
 =?utf-8?B?WEYvSkpISWcxRis0N2RuamVaSFp4TEthVXpLaGdmSndYa0VETzVSNXNmWUJu?=
 =?utf-8?B?NUdNb09URWFVT1FmeGlJUWgyeHJEVlNUa3NOSnFTWWYrMnVRUzVZRjJOZXkx?=
 =?utf-8?B?dGVGWlNaMDlrSnQ5YmhmZlNjL09wb3c5ZS9pREc5djVUamhZS0lWZEVSVmlZ?=
 =?utf-8?B?L1VOWjNQYzNBUjFlNFIvem1FdWswQmVTV2dQT0VWTE1ISmZ1Ykd1N1pqMGQ5?=
 =?utf-8?B?OVZTbXNYUldWWi9MbU1TbHVzNWlKenJMbTJnZDlpTDdRWHNscjNDOVpZeG1I?=
 =?utf-8?B?UURvK3ZkblFhSTNlRVBBMXgwU25aQkhOZjMrNzhNblZ2d2tja2J4U3NTNElt?=
 =?utf-8?B?cjhXMlQ4NFppeW1uckw5bUhHUE15MlNYLzZIbWJLUWZMaDVxVGI0MjllMTRL?=
 =?utf-8?B?Q0hYZkg3dDhsZ3FFUXpMODhpSG1CVCtzSUlsMUg4dVFpT1Q3TGZJQU9SYnlM?=
 =?utf-8?B?SlVOTTNmWW45VUlCRkZyYTRSR0VKVUIrT0w2WndRc29nZkY1RHJ0ZEpQQmxQ?=
 =?utf-8?B?VmV4azFQR0NKR1RUc0hQclN0WEZLV21DT0V4WVo1dVNFMm1TU0FUOVcyRXN3?=
 =?utf-8?B?RS9WYWdtcFF5SEJyVUNLYkgwWXJiV0RVYW5odGViNzQzMkZuajFScnlib3Zu?=
 =?utf-8?B?NDBSUmRoenpmNkhBbDVJSnByMTR6ZGVLS2FHdHBEWGdqaGVkSzdpeERFeHlE?=
 =?utf-8?B?TXV0bWp5cjJmaHl0L0xCK2hMUHFnaDFTTVB0Mm0yd25vd0l1eUl5R2pHZUQv?=
 =?utf-8?B?WHFGdG1HSmxoTXZZL0RoWWpMOWdubTRNSy91WmtSY3lSR2N5Q0krdHBRaDI3?=
 =?utf-8?B?eExNRlFES2Q4clFtOFV0cHVaWDlpeEhKTTU2dUlDaE5XTGhaa0E4eVhwdkRY?=
 =?utf-8?B?SVVpZjFiTlhyaHRRa2xHdkcwTkdWYjY0U3hEUUZlU2FrSzBadTlOUFE1bzZn?=
 =?utf-8?B?aE4zWk1oYkZ0bStUWlV4MlNNQm92NFoxYkhhR1ZTdnN1SVlNY01kRVpZR3d4?=
 =?utf-8?B?MjBTSWF5S0h6eEQzaTllM05Oa2RJR1hzamw3dnVEeXhPeDF2VXE3dmV6MDZa?=
 =?utf-8?B?SEZoTnl3UStPZTJhYkhpU1d2dnBmUFFzdFduS2dQMmFURStNVVhxVi90QzNl?=
 =?utf-8?B?SWY1UEtIMU81bzdJRHVicXJUbTlUcWFEKzdzZnh0cHA0NGhRQkE3cmxCczkx?=
 =?utf-8?B?V2pQZTY4cDFObk1RS1prb0lRSHR6OFZOa293dmptQ3RQajdWSyt0SlgzdTl3?=
 =?utf-8?B?c0dyQXhzbFlIK0RXSk1qRDNxYWZMWUk1MDFzUkZ6RUQwQ3lVTDNidHhNa0Ry?=
 =?utf-8?B?SUEvaXZHenZub3p0OE5DdkJvQUhNMFdCaE9WdGJmQ29OWFZJV2V5V2ZjUXRI?=
 =?utf-8?B?aDJ3YytiNjhHTU5aeEpTaldjMk9tcEcxV1QxK3M1V3Jnd2htUVdVYnpxQzE5?=
 =?utf-8?B?VEYwSDVwMDNBbjFGUW9JaWc5eXVYWFdFQzNJQXJjd3J0V2UwRy9HQ1FzSGpr?=
 =?utf-8?B?S05rRzFQdFR6dDBRZ3o3emFyNVBENjk0TU5BaHNVVStmM1VmSDcxcTNjeHZI?=
 =?utf-8?Q?xogj0w1joapSDAwI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FB60C3BE3B1FA34D9D352CB6DAAF3E65@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: sVo58Xf0SJvhgjiEAlvpUDlUA+Twqocl1eidnlDTB8fPTvdAwTpYArrsVuxwANDdsQWyf4mgFhMbEl+R/u6uJZWpCKWlUornaGdgx25bP29QwVBrK+Pznhm3sHHTLFHy7aprJCqQ6m5CSvzfpmguvR4AS2r/XnMCM2D/6G0omvadqCHReToSFvWgnqlcAx5vyVDxBhioFB/t9alVxDCoimnlV7zJtud6u/b/surU63DqKJZaTDKbsJWLHTEr0aTxSqT4xUHpCXQqCw7xZRDviPunHfUVChZ3oTgesy9wSDT2qSUxF+4TstXOFjufPo52CnXl5LdtW+5GGJQCdwXZWA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6679d4ff-e88f-42a8-8893-08df08d45fc9
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 09:27:14.2793 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9lozWAF8Djm9Kj79ezdmB/yjgWWN7mJAkNwwQmXeszrwib1Wl9Ep5rpwlrRmTlknGxlJatYm3hFs4xovIspu/AkeETaoszPBNKzNY140NoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7759
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

T24gVHVlLCAyMDI2LTA4LTI1IGF0IDExOjE1ICswNTMwLCBBbmltZXNoIE1hbm5hIHdyb3RlOg0K
PiBJc3N1ZSBhIEFVWCB3cml0ZSB0cmFuc2FjdGlvbiB0byBEUENEIERQX1RPVEFMX0xUVFBSX0NO
VCAoMHhmMDAwYSkNCj4gd2l0aCB0b3RhbCBudW1iZXIgb2YgTFRUUFIgYmVmb3JlIGxpbmsgdHJh
aW5pbmcuDQo+IA0KPiB2MjogQ29zbWV0aWMgY2hhbmdlcy4gW1N1cmFqXQ0KPiANCj4gQ2M6IEpv
dW5pIEjDtmdhbmRlciA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5
OiBBbmltZXNoIE1hbm5hIDxhbmltZXNoLm1hbm5hQGludGVsLmNvbT4NCj4gLS0tDQo+IMKgZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmPCoMKgwqDCoMKgwqDCoCB8wqAg
OSArKysrKysrKy0NCj4gwqAuLi4vZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9saW5rX3RyYWlu
aW5nLmPCoMKgwqAgfCAxNg0KPiArKysrKysrKysrKysrKysrDQo+IMKgMiBmaWxlcyBjaGFuZ2Vk
LCAyNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uYw0KPiBpbmRleCA4OTBiZjI0ODg1NTQuLmQyM2Yz
YmRmMTMzOSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9hbHBtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBt
LmMNCj4gQEAgLTU2Myw3ICs1NjMsNyBAQCBzdGF0aWMgdm9pZCBsbmxfYWxwbV9jb25maWd1cmUo
c3RydWN0IGludGVsX2RwDQo+ICppbnRlbF9kcCwNCj4gwqB7DQo+IMKgCXN0cnVjdCBpbnRlbF9k
aXNwbGF5ICpkaXNwbGF5ID0gdG9faW50ZWxfZGlzcGxheShpbnRlbF9kcCk7DQo+IMKgCWVudW0g
dHJhbnNjb2RlciBjcHVfdHJhbnNjb2RlciA9IGNydGNfc3RhdGUtPmNwdV90cmFuc2NvZGVyOw0K
PiAtCXUzMiBhbHBtX2N0bDsNCj4gKwl1MzIgYWxwbV9jdGwsIGFscG1fY3RsMiwgbHR0cHJfY291
bnQ7DQo+IMKgDQo+IMKgCWlmIChESVNQTEFZX1ZFUihkaXNwbGF5KSA8IDIwIHx8DQo+ICghaW50
ZWxfcHNyX25lZWRzX2FscG0oaW50ZWxfZHAsIGNydGNfc3RhdGUpICYmDQo+IMKgCQkJCQnCoCAh
Y3J0Y19zdGF0ZS0+aGFzX2xvYmYpKQ0KPiBAQCAtNjEzLDYgKzYxMywxMyBAQCBzdGF0aWMgdm9p
ZCBsbmxfYWxwbV9jb25maWd1cmUoc3RydWN0IGludGVsX2RwDQo+ICppbnRlbF9kcCwNCj4gwqAN
Cj4gwqAJYWxwbV9jdGwgfD0gQUxQTV9DVExfQUxQTV9FTlRSWV9DSEVDSyhjcnRjX3N0YXRlLQ0K
PiA+YWxwbV9zdGF0ZS5jaGVja19lbnRyeV9saW5lcyk7DQo+IMKgDQo+ICsJbHR0cHJfY291bnQg
PSBkcm1fZHBfbHR0cHJfY291bnQoaW50ZWxfZHAtDQo+ID5sdHRwcl9jb21tb25fY2Fwcyk7DQo+
ICsNCj4gKwlhbHBtX2N0bDIgPSBpbnRlbF9kZV9yZWFkKGRpc3BsYXksIEFMUE1fQ1RMMihkaXNw
bGF5LA0KPiBjcHVfdHJhbnNjb2RlcikpOw0KDQpXaHkgeW91IGFyZSByZWFkaW5nIHRoaXMuIENh
bid0IHdlIGp1c3QgY29uZmlndXJlIGFscG1fY3RsMiBhcyB3ZSB3YW50DQphbmQgdGhlbiB3cml0
ZSB0aGF0IG9uZT8NCg0KPiArCWFscG1fY3RsMiAmPSB+QUxQTV9DVEwyX05VTUJFUl9PRl9MVFRQ
Ul9NQVNLOw0KPiArCWFscG1fY3RsMiB8PSBBTFBNX0NUTDJfTlVNQkVSX09GX0xUVFBSKGx0dHBy
X2NvdW50KTsNCj4gKw0KPiArCWludGVsX2RlX3dyaXRlKGRpc3BsYXksIEFMUE1fQ1RMMihkaXNw
bGF5LCBjcHVfdHJhbnNjb2RlciksDQo+IGFscG1fY3RsMik7DQo+IMKgCWludGVsX2RlX3dyaXRl
KGRpc3BsYXksIEFMUE1fQ1RMKGRpc3BsYXksIGNwdV90cmFuc2NvZGVyKSwNCj4gYWxwbV9jdGwp
Ow0KPiDCoAltdXRleF91bmxvY2soJmludGVsX2RwLT5hbHBtLmxvY2spOw0KPiDCoH0NCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfbGlua190cmFp
bmluZy5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9saW5rX3Ry
YWluaW5nLmMNCj4gaW5kZXggY2I5MmNmZjkwNjE0Li4xZDU4NzNjYjY0ZjUgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfbGlua190cmFpbmluZy5j
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfbGlua190cmFp
bmluZy5jDQo+IEBAIC0yMjY1LDYgKzIyNjUsMjAgQEAgaW50ZWxfZHBfMTI4YjEzMmJfbGlua190
cmFpbihzdHJ1Y3QgaW50ZWxfZHANCj4gKmludGVsX2RwLA0KPiDCoAlyZXR1cm4gcGFzc2VkOw0K
PiDCoH0NCj4gwqANCj4gK3N0YXRpYyB2b2lkIGludGVsX2RwX3VwZGF0ZV9sdHRwcl9jb3VudChz
dHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwLA0KPiArCQkJCQlpbnQgbHR0cHJfY291bnQpDQo+ICt7
DQo+ICsJLyoNCj4gKwkgKiBQcm9ncmFtIG9ubHkgZm9yIERQMi4xIGFuZCByZXR1cm4gaWYgTFRU
UFIgcmV2aXNvbiBpcw0KPiBsZXNzIHRoYW4gMHgyMA0KPiArCSAqIHdoZXJlIDA6MyByZXByZXNl
bnRzIG1pbm9yIHJldiBhbmQgNDo3IHJlcHJlc2VudCBtYWpvcg0KPiByZXYNCj4gKwkgKi8NCj4g
KwlpZiAoIWludGVsX2RwX2lzX2VkcChpbnRlbF9kcCkgfHwNCj4gKwnCoMKgwqAgaW50ZWxfZHAt
Pmx0dHByX2NvbW1vbl9jYXBzWzBdIDw9IDB4MjApDQo+ICsJCXJldHVybjsNCj4gKw0KDQoiVGhl
IERQVFggc2hhbGwgaXNzdWUgYW4gQVVYIHdyaXRlIHRyYW5zYWN0aW9uIHRvIHRoZSBEUENEIHJl
Z2lzdGVyDQp3aXRoIHRoZSB2YWx1ZQ0KZGV0ZXJtaW5lZCBmcm9tIHRoZSBQSFlfUkVQRUFURVJf
Q05UIGFuZCBzYW1lIGVuY29kaW5nIGRlZmluZWQgZm9yIERQQ0QNCkYwMDAyaC4iDQoNCkkuZS4g
WW91IGNhbid0IGp1c3Qgd3JpdGUgY291bnQgYXMgaXQgaXMuDQoNCj4gKwlkcm1fZHBfZHBjZF93
cml0ZWIoJmludGVsX2RwLT5hdXgsIERQX1RPVEFMX0xUVFBSX0NOVCwNCj4gbHR0cHJfY291bnQp
Ow0KPiArfQ0KPiArDQo+IMKgLyoqDQo+IMKgICogaW50ZWxfZHBfc3RhcnRfbGlua190cmFpbiAt
IHN0YXJ0IGxpbmsgdHJhaW5pbmcNCj4gwqAgKiBAc3RhdGU6IEF0b21pYyBzdGF0ZQ0KPiBAQCAt
MjMwNCw2ICsyMzE4LDggQEAgdm9pZCBpbnRlbF9kcF9zdGFydF9saW5rX3RyYWluKHN0cnVjdA0K
PiBpbnRlbF9hdG9taWNfc3RhdGUgKnN0YXRlLA0KPiDCoA0KPiDCoAlpbnRlbF9kcF9wcmVwYXJl
X2xpbmtfdHJhaW4oaW50ZWxfZHAsIGNydGNfc3RhdGUpOw0KPiDCoA0KPiArCWludGVsX2RwX3Vw
ZGF0ZV9sdHRwcl9jb3VudChpbnRlbF9kcCwgbHR0cHJfY291bnQpOw0KDQpIb3cgYWJvdXQgaGF2
aW5nIHRoaXMgaW4gaW50ZWxfYWxwbV9lbmFibGVfc2luaz8NCg0KQlIsDQpKb3VuaSBIw7ZnYW5k
ZXINCg0KPiArDQo+IMKgCWlmIChpbnRlbF9kcF9pc191aGJyKGNydGNfc3RhdGUpKQ0KPiDCoAkJ
cGFzc2VkID0gaW50ZWxfZHBfMTI4YjEzMmJfbGlua190cmFpbihpbnRlbF9kcCwNCj4gY3J0Y19z
dGF0ZSwgbHR0cHJfY291bnQpOw0KPiDCoAllbHNlDQoNCg==
