Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 146E7E87839
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 15:21:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C1010E337;
	Tue,  3 Feb 2026 15:21:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JdpLkUjU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC4A510E337
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 15:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770132113; x=1801668113;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=W7kNWPJ2/slQPRDnv8oozPd2riQKrUC1KE88tipQYBg=;
 b=JdpLkUjU8MvBCPwwEGFItqqIYRmTuREfhmeEpL3bDHGUSbF1ktsp+8so
 +4pZBKjqLSufG42bn4ys0dmHsLfrxstV/AIsyKU2cTWBD1gnj6+ROVjqS
 +pSKjWccpSdl0LtYbqnZ/zhjGUoJ76N5y9MLHaaGBp1y9ot+HByacWBI1
 URTOUieMsds4iHysbT4N1NhL+ReFRifu0/MOzoPrShY9wIgN/NfKGCRM0
 HcRLi6ubM/9m7/KH+8/g3QjLpEnuvNrSq4npyXFyXWynYJy70RwGSLEB+
 IbH4P4eEe3oy1P540J8ypSvPux/RZHzi0ut2/riLqHjMdKb2WgKgInBFX Q==;
X-CSE-ConnectionGUID: Ng2jhlKlRiyPLiCdO+nnJQ==
X-CSE-MsgGUID: Y33MvBkVTGi4NeOQNyBvaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="88728334"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="88728334"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 07:21:52 -0800
X-CSE-ConnectionGUID: 688PrqEmQ+6Dr8xJz0cykQ==
X-CSE-MsgGUID: 6xetFUlPSXu5jmDUhf6URA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="209298940"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 07:21:52 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 07:21:51 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 3 Feb 2026 07:21:51 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.52)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 07:21:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=db6PQXHYvG9qf8iuXdQcDQLHe33dtmwCsHlrTVS8qZZOVYVlaiuDU7MVdjax6psyH3ihHdv8hqY8IzMTXC9+XKkJGJ3MHN8Z7lTVnqiV/5Y/8itvQcu32EfdQV9zcu3VMTJbLDjLngtMxeyoRoV8dr+MmU0StM4pNhEpGGg0Lf6mWFy0qqv7E+pQoVnK1A65/ULHej9YmEueNq/zYzwZWp7ygMcfP5AjVz1nxnCbxjQd0kwA6tLL675s8sC9QrkEPgm0Es8d8cqz4PxDRaz/T1ZZ11o5VKHitgTBZDD/uHR3bnYkeOPpU4klEfeB8TGrXErasty1lnHCjy0tVMGe0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7kNWPJ2/slQPRDnv8oozPd2riQKrUC1KE88tipQYBg=;
 b=GjD7B18zw6HLlE2jb2iMl7OorjgCTqmCqYIzdbiTvs8IvIjDvnHcgcOJHGPMnSOaHFB5inBsIb9P5M+upmVkPT03euJtBSeKPw3pyddV9QjI4Vpi8hthmKqTgpL+Kxv8j+oz1libuv/1rFtdqxLVHASf49mQ5fAW9CuBPU/RJL3ADm+bvq/pcbQNir5BTyzIUlIh+XOLyKR+sffy3vMP+YA0O609at1ks+VEP9VI8OZE9Tn++d35onbWXF5KND/3cs6Hd1ztNI8JnQ/cpt7K3rmcvHdd9WcEsjIj8jJ/VRBcCMzXmD9xkBSWIVDIZW2WMX36nKSnNWM3UiCbMBLk4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8987.namprd11.prod.outlook.com (2603:10b6:208:574::18)
 by PH7PR11MB7594.namprd11.prod.outlook.com (2603:10b6:510:268::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 15:21:44 +0000
Received: from IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::f91f:4301:96d7:1925]) by IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::f91f:4301:96d7:1925%6]) with mapi id 15.20.9587.010; Tue, 3 Feb 2026
 15:21:44 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: sys_igkgfxci <sys_igkgfxci@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: CI.FULL: failure for drm/xe: Use IS_ENABLED() for config checks
 instead of defined() (rev3)
Thread-Topic: CI.FULL: failure for drm/xe: Use IS_ENABLED() for config checks
 instead of defined() (rev3)
Thread-Index: AQHcjGrL8Adq4Ugr2UCKzrQfk69/iLVxJ9pQ
Date: Tue, 3 Feb 2026 15:21:43 +0000
Message-ID: <IA3PR11MB89872F568FA3B24CD743711DD09BA@IA3PR11MB8987.namprd11.prod.outlook.com>
References: <20251202070231.187562-2-nitin.r.gote@intel.com>
 <176917430914.370852.15796836138983081414@gklab-002-034.igk.intel.com>
In-Reply-To: <176917430914.370852.15796836138983081414@gklab-002-034.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8987:EE_|PH7PR11MB7594:EE_
x-ms-office365-filtering-correlation-id: f9bd74d1-0c05-434c-e4ea-08de6337f056
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|13003099007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?N2NxVTArb1p6dXRhalBCWXdlQ2tUS3c2cVllblpuempLRE1rT1RMZ2xtK0Jj?=
 =?utf-8?B?TWN6alV0aGFyTWIxRE1vUjFTRjhXWkFzeFhCbmhnU3Z1bXQvN0pQaTVPOHlu?=
 =?utf-8?B?MlAzY1l1dGU1SUExRW4wZW9HYUFScUVhNC93NlBzSDFvSmsvT2FHbVlqT1dU?=
 =?utf-8?B?Z0ZTZmhHRVkxRDkzaVlhRVZQTUJIWUhpZnNQdXJPU2Z5N0RZeEpzU01nWW04?=
 =?utf-8?B?eS9GZTlqT25qd2dBVFZCK0VZL2JUNlVnNFl4VHlmUG1FYkN2eGd5bmdBc1I2?=
 =?utf-8?B?YUovV0pFT09hZHp5Y1hyWFpaZGM0dktaaHk3cks3YWFDSjhwVEg3WFcyQVNM?=
 =?utf-8?B?aUYwRDVMVHNhd2JuZW83R3ZSOU02RVBsMGVLUmpSSVJEbDJkOXg1blBWVVdy?=
 =?utf-8?B?dG05T2hKYUdzKzliY2Q4OFhqbTg1RGJDeTNhSEhSb0U3Ri91QVNneitxSEFX?=
 =?utf-8?B?ZU90eE1xNjdheVoxVFFxWVFtOXAycXB3R0lBUGVFd0xpL1RJU014YWw0UUNB?=
 =?utf-8?B?MlNmZEVoRmFtQzZzamk0OEJzbGZyZUE1aG1DakpYYldJdEJtVU1ud3F1RXoy?=
 =?utf-8?B?cSttWnUxWkpTM0RSUHh5cVlnWHBUYmZ4VThwR0R3NnB1dWR5SGhudVRuVFVa?=
 =?utf-8?B?OWNrT1QwVU90blZDa1k1WUUrV1oxaWtrSzdNQXpMQlh6S2xiZ3lhUFZhZ2Rt?=
 =?utf-8?B?Z21Vd1dtWE15aVBueHVkY3g5Z01VNEE2ZE1qVWZkaU5rejFIUjgrMVVMQU1n?=
 =?utf-8?B?Ym9lSGYrMkVSd3dYZkZXWjJDYnNHZS94bFJDSUg1MlV6WXJlRXYrc3pSeXFy?=
 =?utf-8?B?U2RzOW9xWTRLTkE1RmhMZThyVXZ2Z2dwamxlVUowdVo1M2lvUXQ3VTlkZDRX?=
 =?utf-8?B?WVRWc3NmZWh1MmxUVmhsTGNXRnJUakwzOVUvbEtCc1dNUldOeDYrOGkyNERH?=
 =?utf-8?B?Q3BwWGFnak8xcXJpZ3BTN1hOOWdjUExmNTVneGhkWkkzVHY2YTNpbVQyTWtE?=
 =?utf-8?B?U2hDL0FEUGhMZFBWT2xCVTE1Q09lSVBQeVpERjJhQ2RwVExraXEwaXhwNXFu?=
 =?utf-8?B?OTVwVndwSlhrTVpyaXJpTVkrcTFoNHBXYmNKYkFNZmY1Z2V6V0E2QWl2NnQv?=
 =?utf-8?B?Ty9SVVdSTTl4dXIvcWxDSFBYaXM3Z05OcWdvcDdqQ2VmQmF0UGJ4UlB3YzlU?=
 =?utf-8?B?TzJ4M3J1RGhOV2lIc0Q5d2MyOExFSE4rOWROOSsxRmJMR2VoalVzRGZtbkZ5?=
 =?utf-8?B?Y3k5U0xvWUY0ZGFwYkRqTjh6L1pIMjVjYVc1TStsMi9KYXVINEtydDV3bWVX?=
 =?utf-8?B?TmZ6YWloOC93VksrS1dQNWpVN1NsQ0FKZUQ1U3lZOGdnZjJQWXFiK0pUckFV?=
 =?utf-8?B?YVlmTGJydysrdlFjRTNpNk5mVGtReDcwblBWZmdzZzROOUhVZ2M4Ykp1SVow?=
 =?utf-8?B?YW9YbXd5aWNrbEEzdlRzSnFkRDBBRndDc2cvbXZnUWh0TzcwaG9yV051b3BP?=
 =?utf-8?B?UzlPamd1dm1FeEtDRzE3T1ZZbmo1VGp5N2NKVVJvV0wzbUh5SXZsL1UwWmpG?=
 =?utf-8?B?aHBEQkpocUpGY0xQZjFwYzN6d2dBdWhvS1V2WnNhbWhxNmR5WlhGK2dCaFR2?=
 =?utf-8?B?NFkzOFFZYnlrMWtjL0dSK2dYbURwZEhCNXhWWWdqWTRnVGlhMExaVUZVQkdy?=
 =?utf-8?B?TDdMYTNUakIrVy9jNXFBcCtYbGJGRmlpbXF0ZnpCb0RDbFgzSFdSOWM2aklL?=
 =?utf-8?B?RHlCNmdMOVJmamxYeHRDTGxPczQxRzBhNDFBY0dzdXB3SzVwRk9XWVEvOEpV?=
 =?utf-8?B?WVAzNmlPai82L0M0a1liSGFONml4YW1rV0xtTmQyTFJ5Tk8wa01jR1dPbWVk?=
 =?utf-8?B?eUd1NCtXZm13c1NHNzM3VXhLaTJSc2JFYXQwd2F6UzNHZTN5U0lIdTY1NmZT?=
 =?utf-8?B?eG5oRjFZUjlnaHNDUWRpUlZBZ2oxVURBMHNMcXZIb1Urblp6V3ljUHBMVEtE?=
 =?utf-8?B?dmV1S08yd2JhUHlmN0VoVXNqWmpxZFg4a1NVV2s1bkViVDlTL3VpUlNvdngw?=
 =?utf-8?B?SzhRNnVvelhBU1dxK3ZzdjlVV2JIZCtTUDRML3J1YllDMHNqZHR6N0U2NnhC?=
 =?utf-8?Q?PpNDxCRp2MqO/DDkCIAEO1xzK?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB8987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aUlkQ29lanlXMUpWTjFKc0UxaFhoYnBMMW1qMlFFM3hpVWpVb0EvN2ZtWHJt?=
 =?utf-8?B?cDFzNVY1ZmNuNVYzMXNBYmU0VVAwUEJ6dzFIU0VKZ2toQ0FlQkYvT1kvd0JX?=
 =?utf-8?B?NThQcldtdFNmcW9vWUZSUzdLMFVTWm5oakVpUmdxdWNUVStFRkdZVkRweG55?=
 =?utf-8?B?aHpOcFV0M2F3ZVpRdzlDaXkxa3FKUi9wREJxN0tUSzcyazNUeDl3MHVwVVZ1?=
 =?utf-8?B?L0t3dUdJVE9CR3YrM2xaSElmNDR2YnB5eGdaRGtQc29Oc2taRmgvcmtNR1k3?=
 =?utf-8?B?TThlQnVrcGY2Q3dOazJzdTdqbEY5L3RZOHl1QmxOcHRZbUVIa2sxUE1IcENz?=
 =?utf-8?B?Q29qd3lSYXRLVlZIb0tmaFQ1NFAvNDhPQVJlR2hyVUN2eFZSL2RTMWx6YjA4?=
 =?utf-8?B?M2lnSWtHNk9EcHRqZHdtRFJwMDZCMktHWVE5K2RXZkI3Smd4UG0xT0JNcUV1?=
 =?utf-8?B?L3M0dVBrWGsyWTdZZ0tYRnNIdUhVQzZSSjl1a1BSdTJWOXh3cCtNRmtzcTd5?=
 =?utf-8?B?a0g5aFRrd1htRXNNaHdocVJzbW5HcXNpdk1aVk13U1piSm1USTEzZFVrTHVo?=
 =?utf-8?B?WEd3STZxNEJ2bEtpaVBqODd6NThsS3pPTko3bFFPdlFweGFJYkpORjF5K2kv?=
 =?utf-8?B?NFNncG1nbzFaamtNNWNGeldIelJDZ3F4VjVHT3A3MzRMNHNnTnNJWkwzY1NR?=
 =?utf-8?B?Tk9iZW5Cc2FqclRKOXVaS0xXTUNxbWFBd2taYmU0czlpanBvYzJMSjg5R2xh?=
 =?utf-8?B?ZzdYOHhpRzZ2RjVwSEFPcndFeCtpNHh4NG1nelVYa05JWEg1RlhhcUxmZi9Z?=
 =?utf-8?B?UTgyd3d5WXEzekV5dG1OMEFIeHNybWc2OFdKaWJTMTZWMFVHaXpld3NiV3ky?=
 =?utf-8?B?N3VETmVhNFRTbVBzR0Z4VlFxM0x4RjZELzJGY2dqd3Q1RllTS0NIckRxS095?=
 =?utf-8?B?NWszM3l4OEZTTnZQUW1tSG1QTzVlOEd3SUR2anZRTDlWU09ES2xjWmJoTzFE?=
 =?utf-8?B?OTJ3cUU5UEc3TTBpRlgwcXo5dkg5Yzc5OWQ0Wk0vRlVGTU8wMUVTSFRIbWU4?=
 =?utf-8?B?ZVlCK2QrU1V5QUVRbnB5MDFFQlcwTzN4WkoydVFyb09CYjJZaTBsZlVTYUQ3?=
 =?utf-8?B?MUJVbWVUQ3BkUkFKM0tKSS83L0lZZXNaNHRYM0FXeW9XV2NJWFFHdk0zZFNh?=
 =?utf-8?B?M1ZYT1ZSNStQZUsrTlJONkx4alZsMXhYeU9SOVQzdjByV2lnKzk0MlNsMWF1?=
 =?utf-8?B?VlZGVWxTc1hVSmNka0ltTWFlRGxLVWdhaGFOVTg3OFAvYm1xOU83NDllbWQ1?=
 =?utf-8?B?OU12TkRweU40ZDdFYW1raENhZTgrcSsvMjh5LzlGSjNuUkh1R0VoR3RRTTBj?=
 =?utf-8?B?UGgvcDBUSDBnekpKRnlwWEV5OWw4c2svMnR5MWdRc1hyRnY3a05GTGlkaENh?=
 =?utf-8?B?cEpFZklxYUVsQ1VmNGszS3BqZGlRUjZRL1o1alVNbEdheDMrdmF1eGxlbU5X?=
 =?utf-8?B?T0JBYUFmbWxMZ3dMU3RwUUlTNm9nUnJsUEF1clJMbU40RlVzaHVlL25GQ21K?=
 =?utf-8?B?WG1MQm1jckFkSndHdEJ1ZzZVZ3RUV090MGRrWHZhTk1nNjREYko5U1gvb3hB?=
 =?utf-8?B?QmZES3MrWEFWMllCbmloKzVxMVJkYmFqb3NodFYrLzlDZXBJWld0MllTcVly?=
 =?utf-8?B?dFZKcVlSSjhUUmxVT09LdkhJMjMwN3JkaWc0cXdUUUd3WUJKYWdWNU1RUEdV?=
 =?utf-8?B?RzhscklRL2tidjFRcDZlbWtEU0xMbnpFR1FvWDZUZzBYQWlOeXVsbSs3cmN5?=
 =?utf-8?B?YkhTR1BZdXh2d2Q3djNKRG9OZ2Q2YVdKUHJRTmFvMHE4SEZ6TXVzbHJrUHRY?=
 =?utf-8?B?TmxVWjRYdmZoMnVkSTFRUStySkJuaUhkWEIvUkhuTkkyK0phTEhiRTFMd2kw?=
 =?utf-8?B?VWVEdWdCaUlqMG9CTXI2UW54Zk40TGk3cTBkeUdyZzY1TGlmdHRVNlF1TitK?=
 =?utf-8?B?Nk4wWUlYeVZZaDRtbzVYSFQvZjF2ZzdSeDZaaE56ZXdnRWdyUms0OVUxN05m?=
 =?utf-8?B?NUR2clZ5czRhd3U1Mm1oTUdXSVZoaFZGR01HMFovbFdhR2U2VVFMQzRJY3ZE?=
 =?utf-8?B?bmZKRW1FZlFhNWtKUXNsNFZyM2Q4V2RQUXJnUy91allGYnJzM0Q1bUV2OHlZ?=
 =?utf-8?B?S1FmODd6M28wR0dRMk1nQUJzZkFid055YmczcXU4K0JJeVcvbnhDemYwK241?=
 =?utf-8?B?WHVGUTluZjl2ZVAvbVphcTN4NjVXN0ttTmxtT0NKbGVPVE92SW1uSU1STnZ3?=
 =?utf-8?B?ckZTQ0xQanE3a2F4RlIxVGtISVdaaWxNbHZVeW9TRVpRVVl6bU9vdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9bd74d1-0c05-434c-e4ea-08de6337f056
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2026 15:21:43.9206 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KyjHb/OokwsORmJl7NJj/7HaTznDDVnV2NZi4R8FWN78h0F/9oN/WWcQqRQ6JhJDCaF8Tg3WI7osIEzl5fKZkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7594
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

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc3lzX2lna2dmeGNp
IDxzeXNfaWdrZ2Z4Y2lAaW50ZWwuY29tPg0KPiBTZW50OiBGcmlkYXksIEphbnVhcnkgMjMsIDIw
MjYgNjo0OCBQTQ0KPiBUbzogeGUtb24tdXBzdHJlYW1AZWNsaXN0cy5pbnRlbC5jb207IEdvdGUs
IE5pdGluIFIgPG5pdGluLnIuZ290ZUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IENJLkZVTEw6IGZh
aWx1cmUgZm9yIGRybS94ZTogVXNlIElTX0VOQUJMRUQoKSBmb3IgY29uZmlnIGNoZWNrcyBpbnN0
ZWFkDQo+IG9mIGRlZmluZWQoKSAocmV2MykNCj4gDQo+IA0KPiBQYXRjaHdvcmsgc2VyaWVzOiBo
dHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE1ODE3NiNyZXYzDQo+IFJl
c3VsdHMgdmlzdWFsaXphdGlvbjogaHR0cDovL2dmeC1jaS1pbnRlcm5hbC5pZ2suaW50ZWwuY29t
L3RyZWUveGUtb24tdXBzdHJlYW0veGUtDQo+IHVwc3RyZWFtLXB3LTE1ODE3NnYzL2luZGV4Lmh0
bWwNCj4gDQo+IENJIEJ1ZyBMb2cgLSBjaGFuZ2VzIGZyb20geGUtdXBzdHJlYW0tNDQ0MS0NCj4g
NGEyNTViNDI5ZDgwZjhiMDgwMGJkZWY0M2JhMzE3NWI3NzFlNzdmZi1mdWxsIC0+IHhlLXVwc3Ry
ZWFtLXB3LQ0KPiAxNTgxNzZ2My1mdWxsID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0NCj4gDQo+IFN1bW1hcnkNCj4gLS0tLS0tLQ0KPiANCj4gICAq
KkZBSUxVUkUqKg0KPiANCj4gICBTZXJpb3VzIHVua25vd24gY2hhbmdlcyBjb21pbmcgd2l0aCB4
ZS11cHN0cmVhbS1wdy0xNTgxNzZ2My1mdWxsDQo+IGFic29sdXRlbHkgbmVlZCB0byBiZQ0KPiAg
IHZlcmlmaWVkIG1hbnVhbGx5Lg0KPiANCj4gICBJZiB5b3UgdGhpbmsgdGhlIHJlcG9ydGVkIGNo
YW5nZXMgaGF2ZSBub3RoaW5nIHRvIGRvIHdpdGggdGhlIGNoYW5nZXMNCj4gICBpbnRyb2R1Y2Vk
IGluIHhlLXVwc3RyZWFtLXB3LTE1ODE3NnYzLWZ1bGwsIHBsZWFzZSBub3RpZnkgeW91ciBidWcg
dGVhbQ0KPiAoaHR0cHM6Ly9nb3RvLmludGVsLmNvbS9sZ2NpLWJ1Zy1maWxpbmcpIHRvIGFsbG93
IHRoZW0NCj4gICB0byBkb2N1bWVudCB0aGlzIG5ldyBmYWlsdXJlIG1vZGUsIHdoaWNoIHdpbGwg
cmVkdWNlIGZhbHNlIHBvc2l0aXZlcyBpbiBDSS4NCj4gDQo+IA0KPiANCj4gUGFydGljaXBhdGlu
ZyBob3N0cyAoMiAtPiAyKQ0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+
ICAgTm8gY2hhbmdlcyBpbiBwYXJ0aWNpcGF0aW5nIGhvc3RzDQo+IA0KPiBQb3NzaWJsZSBuZXcg
aXNzdWVzDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+ICAgSGVyZSBhcmUgdGhlIHVua25v
d24gY2hhbmdlcyB0aGF0IG1heSBoYXZlIGJlZW4gaW50cm9kdWNlZCBpbiB4ZS11cHN0cmVhbS0N
Cj4gcHctMTU4MTc2djMtZnVsbDoNCj4gDQo+ICMjIyBJR1QgY2hhbmdlcyAjIyMNCj4gDQo+ICMj
IyMgUG9zc2libGUgcmVncmVzc2lvbnMgIyMjIw0KPiANCj4gICAqIGlndEBrbXNfY29sb3JAZGVl
cC1jb2xvcjoNCj4gICAgIC0gTlZMX1NfRURQX0JPTTU0LUhXOiBbUEFTU11bMV0gLT4gW1NLSVBd
WzJdDQo+ICAgIFsxXTogaHR0cDovL2dmeC1jaS1pbnRlcm5hbC5pZ2suaW50ZWwuY29tL3RyZWUv
eGUtb24tdXBzdHJlYW0veGUtdXBzdHJlYW0tDQo+IDQ0NDEtNGEyNTViNDI5ZDgwZjhiMDgwMGJk
ZWY0M2JhMzE3NWI3NzFlNzdmZi9od2Z1bGwtDQo+IE5WTF9TX0VEUF9CT001NC0xMzIvaWd0QGtt
c19jb2xvckBkZWVwLWNvbG9yLmh0bWwNCj4gICAgWzJdOiBodHRwOi8vZ2Z4LWNpLWludGVybmFs
Lmlnay5pbnRlbC5jb20vdHJlZS94ZS1vbi11cHN0cmVhbS94ZS11cHN0cmVhbS1wdy0NCj4gMTU4
MTc2djMvaHdmdWxsLU5WTF9TX0VEUF9CT001NC0xMzMvaWd0QGttc19jb2xvckBkZWVwLWNvbG9y
Lmh0bWwNCj4gDQo+ICAgKiBpZ3RAa21zX3BsYW5lX2N1cnNvckB2aWV3cG9ydDoNCj4gICAgIC0g
TlZMX1NfRURQX0JPTTU0LUhXOiBbUEFTU11bM10gLT4gW0lOQ09NUExFVEVdWzRdICsxIG90aGVy
IHRlc3QNCj4gaW5jb21wbGV0ZQ0KPiAgICBbM106IGh0dHA6Ly9nZngtY2ktaW50ZXJuYWwuaWdr
LmludGVsLmNvbS90cmVlL3hlLW9uLXVwc3RyZWFtL3hlLXVwc3RyZWFtLQ0KPiA0NDQxLTRhMjU1
YjQyOWQ4MGY4YjA4MDBiZGVmNDNiYTMxNzViNzcxZTc3ZmYvaHdmdWxsLQ0KPiBOVkxfU19FRFBf
Qk9NNTQtMTMyL2lndEBrbXNfcGxhbmVfY3Vyc29yQHZpZXdwb3J0Lmh0bWwNCj4gICAgWzRdOiBo
dHRwOi8vZ2Z4LWNpLWludGVybmFsLmlnay5pbnRlbC5jb20vdHJlZS94ZS1vbi11cHN0cmVhbS94
ZS11cHN0cmVhbS1wdy0NCj4gMTU4MTc2djMvaHdmdWxsLU5WTF9TX0VEUF9CT001NC0NCj4gMTMz
L2lndEBrbXNfcGxhbmVfY3Vyc29yQHZpZXdwb3J0Lmh0bWwNCj4gDQo+ICAgKiBpZ3RAeGVfcG1f
cmVzaWRlbmN5QGd0LWM2LWZyZWV6ZUBndDA6DQo+ICAgICAtIE5WTF9TX0VEUF9CT001NC1IVzog
W1BBU1NdWzVdIC0+IFtGQUlMXVs2XQ0KPiAgICBbNV06IGh0dHA6Ly9nZngtY2ktaW50ZXJuYWwu
aWdrLmludGVsLmNvbS90cmVlL3hlLW9uLXVwc3RyZWFtL3hlLXVwc3RyZWFtLQ0KPiA0NDQxLTRh
MjU1YjQyOWQ4MGY4YjA4MDBiZGVmNDNiYTMxNzViNzcxZTc3ZmYvaHdmdWxsLQ0KPiBOVkxfU19F
RFBfQk9NNTQtMTMxL2lndEB4ZV9wbV9yZXNpZGVuY3lAZ3QtYzYtZnJlZXplQGd0MC5odG1sDQo+
ICAgIFs2XTogaHR0cDovL2dmeC1jaS1pbnRlcm5hbC5pZ2suaW50ZWwuY29tL3RyZWUveGUtb24t
dXBzdHJlYW0veGUtdXBzdHJlYW0tcHctDQo+IDE1ODE3NnYzL2h3ZnVsbC1OVkxfU19FRFBfQk9N
NTQtMTMwL2lndEB4ZV9wbV9yZXNpZGVuY3lAZ3QtYzYtDQo+IGZyZWV6ZUBndDAuaHRtbA0KPiAN
Cj4gDQoNClRoaXMgaXMgcHVyZWx5IGEgY29zbWV0aWMgY2hhbmdlIGFuZCBubyBmdW5jdGlvbmFs
IGNoYW5nZS4NClRoZSByZXBvcnRlZCBpc3N1ZSBpcyBub3QgcmVsYXRlZCB0byBteSBjaGFuZ2Vz
LiBQbGVhc2UgcmUtcmVwb3J0Lg0KLSBOaXRpbg0KDQoNCg==
