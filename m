Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464D36086E56
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 21:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fbrr4RFE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05BC810E071;
	Wed,  4 Nov 2026 21:56:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7219A10E2CC
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 21:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793829370; x=1825365370;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=uW3CgcVSw0NqX4p+aZJZn0cmLt+DnxO3aELR8Kj1TZA=;
 b=Fbrr4RFELiyNL4RlC2gNrmxE6QvxGXqMb1pSYHcqyiHN85XoKtcGM4Nw
 9HkFHrX0r5ma75ikDAE6OChROb35XSeJ2xhPWuxYUm+/IDlmW3Al37pmt
 DtH/Cm8cMjMrpvUHSULUQpcQY4Dt3u4RFmeDa/7YIa3QPGH5Yeln+vsRU
 hOQMWmMRJBhRzo+p7jUWe7TuxACPkNh06ECuXtxDAJp+0aoD4momqIypD
 PGQz8Va3mmLAeNGBukmZVo9iYZFwKawWL1GXfjMmQwJkh1jHfBRcypcDh
 VNoLtJoASViZ3Nqu0tjJ7dr48ks5mrLuzXg19qT8W7Vm/O1uGd7Fgsgbr A==;
X-CSE-ConnectionGUID: cZEZSqogTmmZahTNnaWpFw==
X-CSE-MsgGUID: Vqh0+hf/RsuhQdBjUL7viA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2483213"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2483213"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 13:56:09 -0800
X-CSE-ConnectionGUID: zfDnlQGuQsetP5nSACju9A==
X-CSE-MsgGUID: bcAVqIVRQYyHY8S4NY6ZIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="7229506"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 13:56:09 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 13:56:08 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 13:56:08 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.11) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 13:56:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S75bDChu0gmLYUKYD0NnCrNvTzY8AEnMXXmyaPl1YZxT/kp7eEugqkuHNp73pmMiSiqtokxqzYKeGQQvWGCsltZUKP1EvLQYSTogfVAuWgVAJnuEtfu+e9ZQwSA2/3gxTsAejr5cbhi8t3NYFZ7JfllfiqnEZg/nUt8rZbcYfOUCAFSZKZ4tPckzGTJ5K04VU96JcCFXS32WqPg6u7S1FsQXWLAA+9yU7sLyGKoL2gDUWUuerUr1FQw7kqSAaFyUx7L+pL5RcWQX3i7uYv+Zw7T0ITv9vZjXJH69Yi7mImpliQanAwY7BLXatFSTZqVAshXHnYku55ocrQGC08Jatg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uW3CgcVSw0NqX4p+aZJZn0cmLt+DnxO3aELR8Kj1TZA=;
 b=oJKsh1BYJYc06X00WprRc+Tq0N+bW9ppf/uagiGUjlCUlUpKAfNyRlMqOadXI3Ylo5D1CvCMkt2h6L57Ohzlx598Dv91BJ/dMemreeyRckgUssoi0LiNQsDjLevIgYyIA1gMgjVOI9LZNHof40an7h2OiMXfMHR2DY1tl8nw67u87aTAxULrwCZQ06Pm3DdFYuRVj4ARqezlWft+Q/ArV625GF2GQA3vMT+Q3mc5ZJq8WP9H28ydMgyLRmuTbKBjzwFaYFAc9aDUSRCRTTAzpVkiuGnjzEeag+QDvdy/hmbzpsaE46ZTeglumoZJTeg33WI67YbEJ+y5gVfOTuLhmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from AT6PR11MB072844.namprd11.prod.outlook.com
 (2603:10b6:170:10a::16) by DS7PR11MB7885.namprd11.prod.outlook.com
 (2603:10b6:8:d8::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 21:55:57 +0000
Received: from AT6PR11MB072844.namprd11.prod.outlook.com
 ([fe80::520a:561:ace1:e64b]) by AT6PR11MB072844.namprd11.prod.outlook.com
 ([fe80::520a:561:ace1:e64b%6]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 21:55:55 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>, 
 "Vijay, Anoop C" <anoop.c.vijay@intel.com>
Subject: Re: [PATCH 0/3] Add a few sysctrl refactors in preparation for
Thread-Topic: [PATCH 0/3] Add a few sysctrl refactors in preparation for
Thread-Index: AQHdbKcFK2IRQjAGDUS2OQIh2OALN7cedTkA
Date: Wed, 4 Nov 2026 21:55:55 +0000
Message-ID: <727089887b0f1e77c9555da11832e9b1d8a8490b.camel@intel.com>
References: <20261104215353.234314-5-stuart.summers@intel.com>
In-Reply-To: <20261104215353.234314-5-stuart.summers@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AT6PR11MB072844:EE_|DS7PR11MB7885:EE_
x-ms-office365-filtering-correlation-id: 23d0cdc1-e980-48e7-3353-08df3abe66e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|6133799003|10067099003|18002099003|22082099003|38070700021|11063799006|261022105027099003|261028144727099003|261026140227099003|261102123227099003|261026121527099003|261022075727099003|261021121427099003|56012099006|261021123027099003|261009223027099003;
x-microsoft-antispam-message-info: 5lyt5G7PdH0pOnOA1mrqci2laWYXMuD3KTgP/TuuWGk2K2A4QZjemYKt5EEOAg++6u/gjMcoW4oXFCttCL4Q/MA/kzhcPFqO4jbp8Vw6Qv0NPuAw/fpYnAqIs6REApmnDRAEAb/OKDgkHcHIzeQH+f2B7hVZ4tL79lkiqeNzQ1Y452WAYHNpfHjYr22Nszz84XtLa9ytgM+cEYBzF6l2HbOugR/UXzEBaSARa9yGXkdYtNijGb2wBuDT0r3rerpJB7qU5z4ZvsOI+1LFsVLzx+ZFpoGlsYs1tf7m5C0DPe3lfrf5Mi1fwWJhB9RvIMGPZ7YkVOuKN8Bef5KluvrLyK+vnVL9U6+9nzzQESkZMzFpsqNT3TbWa7XTkh33aproSeHZOzQDbt1uCzWG5iGg+jm7NZUBp145svQfYWLRh1A68we2iaBOaxdzniD3nKAFfDfsKPzG/hNBZmYmjqDgjkDEAI6F+XxTcGooa9VtGy62apj8RIIEMYaf09hmEB6SvnPEPeT3M3Ov4c9OvxWftrgPXBJBcpV4Csl/cV7u6Pe19/3Bdre+KZQVg8gBK8hLGictddZDsN6vrW/KLHz7OVESEf9Y91LQSY/v5Bwhu66H+Ni2oQMZM0hckB8IAZqfP+JRPdwS88XsTmWtftcRSsSkbP9y5aSx5Doq0ugdAPa3JqUmIHM/nLhjmEsclpNpZz8D9tznondR82F5hzd9/FJ5XG4auMCOW2iCINwJQo0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AT6PR11MB072844.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(10067099003)(18002099003)(22082099003)(38070700021)(11063799006)(261022105027099003)(261028144727099003)(261026140227099003)(261102123227099003)(261026121527099003)(261022075727099003)(261021121427099003)(56012099006)(261021123027099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZGdEUFV2NGtVcXh2Z1FyN3U4U2FUODFpM3hva0wxTUMreHJhMFNkdGtraDRJ?=
 =?utf-8?B?MW9sRW5CRThuZkdNZ0pTbVRpS1NRMUVEUDVtaVRLT05jZjNnQUUzQm0wdmo0?=
 =?utf-8?B?NHF2MllmSTF6QklWWkVVS3V2NXpqZ2dWOHc5QVpSNEZOcTI2aVhLaW9ZSnUx?=
 =?utf-8?B?a0w0UlM5UkpQNUFQUnZPNTh0ZVFOYzhHNVRIMVJoSlE3R2JFOTJSM3VTeC9j?=
 =?utf-8?B?MXdtdzNNVHFRS0JxOVNEekMwdVhONyttOXFrY3dUclpma0pDb09JVjNjZHZS?=
 =?utf-8?B?L281cVc0Skh6YVZWL084cHo5WlFPM0NDSnphSkZwTllEcUNXWUFoeXcrQmww?=
 =?utf-8?B?UkcvbGtUTVgrM09zckQra0NJcEtxNnhncVVXc1paS3FlMU5GMGlPd3ZBUEwx?=
 =?utf-8?B?QUM3bXFkTFY1Wk1Mc2dWTkNrSWF1VDJmeWxrc0MyNUVSUExOZEUzWk4xMGV3?=
 =?utf-8?B?b2IxN2hTOWFOUEZIUms5OVJ1QVQwM3lDWjRoTWtZR0RZZ3Y0cllGcFpwdnNz?=
 =?utf-8?B?UVdIL2F2OFd6NkhZdHZZODhkemozSUdmU2NyTlJIN0lSQXdOaDkvYm40RjBm?=
 =?utf-8?B?eGhITExXeHY0WU45UWNJbVJwSWEzYXRjcHhMcmZrR3RlS0hUUjJPbUFMSXVi?=
 =?utf-8?B?VGU1UkE4Um9mL3FrenRDYllQejZuTGxzQ1FvRW15T2VHR295MWFvaGtUOG9n?=
 =?utf-8?B?R3J2amtkNUxxWHBjZXNZa0NLK3hhTHVuYmVvUTJTZmhEMHkyUW02bXo2a3pK?=
 =?utf-8?B?TytZQklIeVc3TFhuZXVFVEI4c0s0cjhkY2pQVHFMT2VZK2I0UERnVzJjelFs?=
 =?utf-8?B?QnkxT1VtUFk1SC85LzlrZUF4U0dRNkROTFpKV3BqUC9SV09BVzBGV0x3UmV5?=
 =?utf-8?B?bDZPcU9XQlYvUExsL2YyWllVR2hLZnZlQ3ZIbkVxZExiODluN3FPSUQ1dmRt?=
 =?utf-8?B?cWx4bkxGcklYUlNSK1ZuWGtWcGVNdW5qZ3ArdHhyNjJEaUdnRjJhMTRyR0pU?=
 =?utf-8?B?Wi9MSERTNFZKTHNvTlpmdXNpWkhFR1hHMFBMaUhjaXAxYUVjbklPSTBRR01s?=
 =?utf-8?B?aTBXMUkyOTdFMTJpSXordE5mWjRFTWdPWkRDU1JQaVVkelRWTWhMdktUM043?=
 =?utf-8?B?SnZDQVRtSDQrc0xxQjRNY3Q2UFU4UmJSOGpmZGtKVEhvcUxWRjdVMGYweGFZ?=
 =?utf-8?B?UlkyRVcrL0YxT200UHVWM1ZGY24zckJkSFdyRDA0S3EvUCtNQ2hIUFBBb29o?=
 =?utf-8?B?UndBaDBZQUpmdzhnTGZEc2E1NFJIYUdCMXBZVmtaaS9kZmZ4My9zb1kyQ2E3?=
 =?utf-8?B?RVVMNlM5b2t0aGd5ejZBQnNOWkFlTTVQSWJXbEN4UnJud0JyUDdIM2lJc0Rq?=
 =?utf-8?B?S3lDZWdzTjFabkt6SUxHbnRlcjhkbzhYbFlkRkRYbENVRmlLK0ZXbzU2SEk4?=
 =?utf-8?B?aVk1OHYyK1NuK25rdW5MTUYvQXlKUW9xd2p1bHM2ckg5N2hNNmdQZEZMN2FI?=
 =?utf-8?B?OFlzV1ZWSEx1Sy9ZY2VJVlpPVzJXeXdGWWl3d2M2WmQyTkNuZy9YZU9nYUVI?=
 =?utf-8?B?MEVKcXMvenlDOUE3UHJicnRFaWJuN3VTTzNKNlJkUW5MZC9TbnZzZTZTbXZO?=
 =?utf-8?B?RTBHWkdSM0JjODZ4djRCMXZ4WXRtWHJnNndQcS9kalJIU0trdy9zbjBQaVY4?=
 =?utf-8?B?SDZrTGhrcWhHVW8zbFlKcFB1ekQ2cWtGZTk2V3M5RHNOTDVBM2NmaUNwbGlI?=
 =?utf-8?B?cW05ZzZaNXY1WXE1ZzIrSlZXdGFyZnRJV1JFcVdwSFl3SXpuMXdSSFRIdnJr?=
 =?utf-8?B?b0xhcU9aRktxQnJzZVJTSDV4a3ZSanFkSktVZWhONG9ZUWZoL3NLSjFvUi9P?=
 =?utf-8?B?WFVGZjM1cGk0WEkwNWhGWS9BYnBQOTZQaXBVTmhjWjRjS3RONndsN295ZnA2?=
 =?utf-8?B?NUNkY0FLSVFPZzJWVVN4WW91NnBiTnNkOFFDenNaNXpDUFFFMFR4OERnRmN2?=
 =?utf-8?B?RFJGVGgxeGdZbzhmWVR2bk81ZDdzS0RtcHlYTnF0cFhjOGhnbTRTMzBrQkZu?=
 =?utf-8?B?d2pYSUh2a1V4YW5NQXFPSWdUQlVucVBGelBZNUJRZzd1ZGQxZm5DSzI4RmFH?=
 =?utf-8?B?KzVUc3VreU5kdC9iaU4vT01WeFBtSjE3QnY0WGhzaFFObmJQTFNCK0hTNk1V?=
 =?utf-8?B?VWxBZjZya3FscUJ5Wmw0ekEvb1owOFRDUlEyekk1SGZZMTE1dkg4YWM2Qmdo?=
 =?utf-8?B?b0RWK2J2bThuSThQS0xJRHNvZlg1a2k2OUNxWmxpdTVTWlRiVllJTUR5Qkc0?=
 =?utf-8?B?dHpLTHhmd3VuZVB2clV2WEg1MEFJd0NORVF3MUZSRmF4QzZ6cnFOczhIeW9C?=
 =?utf-8?Q?zEfMjTUrzX7jSVTk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FF22B69CAEAE5A44AA810750654A4940@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ktnmatuCkPMfqgbtqeSNzqmO+jPPF2cvuEFHvO3HkguCkatlp8HP7Wf5w/wMfw5ZDpWiLCEBYQBecxfrgNMWemdBs7zuDtLrybNbWWdVyR9AYXn2ZfLfcRE8XlYfTkhWKJKtRJT/urEVodnQbotDEliKlhZ08o/s1iz/gFGiNyDiwOFnMFEOnXs46OqBVE2IUD1o5oQ08jh9aqADCM20MGwVYNAxtOEMoF2lhsI2kLhPL+spGnB6d299Wed/FcolqISOWl7b4eW0ja+c6lUsfFl93AwWfuhBUTw2XChkq5WWsvSV9K5dGAwh/gi/jW9PJRguapHIgzMpgoXwMfeWlA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AT6PR11MB072844.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23d0cdc1-e980-48e7-3353-08df3abe66e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 21:55:55.3066 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CUy7zQfsKBq8bqypJHhphpLKehcGSZMyCH+rB2Q7Qf71bMzlDljBVz1icF9uON/ESbivt+gat6FxasUB9JvM6/EpDA5xxsyYTLACwYWHQP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7885
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

U2hvdWxkIGhhdmUgYmVlbiAicHJlcGFyYXRpb24gZm9yIGZ1dHVyZSB3b3JrIiB3aGljaCBnb3Qg
Y3V0IG9mZiA6KQ0KDQotU3R1YXJ0DQoNCk9uIFdlZCwgMjAyNi0xMS0wNCBhdCAyMTo1MyArMDAw
MCwgU3R1YXJ0IFN1bW1lcnMgd3JvdGU6DQo+IEknbSBkb2luZyBzb21lIGRlYnVnIHJpZ2h0IG5v
dyB0aGF0IHRvdWNoZXMgYWRkcmVzcyB0cmFuc2xhdGlvbg0KPiAoQVRTKSBjb25maWd1cmF0aW9u
IGFyb3VuZCB0aGUgc3VzcGVuZC9yZXN1bWUgdGltZS4gUmlnaHQgbm93LA0KPiB3ZSdyZSByZS1l
bmFibGluZyBBVFMgdGhyb3VnaCB0aGUgcmVzdW1lIHBhdGggcmVnYXJkbGVzcyBvZiB3aGV0aGVy
DQo+IHdlIGdldCB0aGUgZDNjb2xkIGhpbnQsIGJ1dCB3ZSBvbmx5IHJlLWVuYWJsZSB0aGUgc3lz
dGVtIGNvbnRyb2xsZXINCj4gd2hlbiB0aGUgZDNjb2xkLmFsbG93ZWQgaXMgc2V0LiBUaGlzIG1l
YW5zIGlmIEknbSB0cnlpbmcgdG8gdG91Y2gNCj4gdGhpcyB0aHJvdWdoIHRoZSBmaXJtd2FyZSwg
SSBtaWdodCBub3QgYmUgYWJsZSB0byBkbyB0aGF0IGVhc2lseQ0KPiBvbiB0aGUgcmVzdW1lIHBh
dGguDQo+IA0KPiBJbiB0aGlzIHNlcmllcyBJJ20gYWRkaW5nIGEgZmV3IHJlZmFjdG9ycyB0aGF0
IGFsbG93IHRoaXMga2luZCBvZg0KPiBkZWJ1Zy4gVGhlIGZpcnN0IHBhdGNoIG1vdmVzIGZyb20g
YSBkeW5hbWljIGFsbG9jYXRpb24gb2Ygc29tZSBvZiB0aGUNCj4gc3lzY3RybCBidWZmZXJzIHRv
IHN0YXRpYyBhbGxvY2F0aW9uIHRvIGF2b2lkIHJlLWFsbG9jYXRpb24gaW4gdGhlDQo+IHJlc3Vt
ZSBwYXRoLiBUaGUgc2Vjb25kIHBhdGNoIG1vdmVzIHRoZSB3b3JrYXJvdW5kIGluaXRpYWxpemF0
aW9uDQo+IGEgbGl0dGxlIGVhcmxpZXIgaW4gdGhlIGRyaXZlciBmb3IgYW4gZWFzaWVyIGhvb2sg
aGVyZS4gQW5kIHRoZSB0aGlyZA0KPiBwYXRjaCBtb3ZlcyB0aGUgc3lzY3RybCBpbml0aWFsaXph
dGlvbiBvdXRzaWRlIG9mIHRoYXQgZDNjb2xkLmFsbG93ZWQNCj4gaGludCBpbiB0aGUgcmVzdW1l
IHBhdGguDQo+IA0KPiBBbGwgb2YgdGhpcyB3YXMgZGV2ZWxvcGVkIGluIGNvbGxhYm9yYXRpb24g
d2l0aCBDbGF1ZGUgT3B1cy4NCj4gDQo+IFN0dWFydCBTdW1tZXJzICgzKToNCj4gwqAgZHJtL3hl
L3N5c2N0cmw6IFVzZSBwcmVhbGxvY2F0ZWQgbWFpbGJveCBzdGFnaW5nIGJ1ZmZlcnMNCj4gwqAg
ZHJtL3hlOiBQcm9jZXNzIGRldmljZSBPT0Igd29ya2Fyb3VuZHMgZHVyaW5nIGVhcmx5IGluZm8g
aW5pdA0KPiDCoCBkcm0veGUvc3lzY3RybDogUmVzdG9yZSB0aGUgU29DIHJlbWFwcGVyIG9uIGV2
ZXJ5IHJ1bnRpbWUgcmVzdW1lDQo+IA0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2Uu
Y8KgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMyAtLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9w
Y2kuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDE0ICsrKysrKysNCj4gwqBkcml2ZXJzL2dw
dS9kcm0veGUveGVfcG0uY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA5ICsrKy0NCj4g
wqBkcml2ZXJzL2dwdS9kcm0veGUveGVfc3lzY3RybC5jwqDCoMKgwqDCoMKgwqDCoCB8wqAgNiAr
Ky0NCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfc3lzY3RybF9tYWlsYm94LmMgfCA1NiArKysr
KysrKystLS0tLS0tLS0tLS0tLQ0KPiAtLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9zeXNj
dHJsX3R5cGVzLmjCoMKgIHwgMTEgKysrKysNCj4gwqA2IGZpbGVzIGNoYW5nZWQsIDU2IGluc2Vy
dGlvbnMoKyksIDQzIGRlbGV0aW9ucygtKQ0KPiANCg0K
