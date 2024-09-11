Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B592BEE4992
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 10:58:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A4B10E950;
	Wed, 11 Sep 2024 10:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YgZzS+BB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B9610E950
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 10:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726052336; x=1757588336;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=t4c3331ppvsvZActBKLIE97iSWC7i3/TFFskdr1X6ss=;
 b=YgZzS+BBKO4oAYZ5VEXQkPUdhgEaRRKv+Un5x+iKO/2An6u+2ZmgRdJS
 JnE3UZ/b4Ib6c+9Urn2awTaF02fInn1wURyKQ1pXxJLwvNJWhBum2WUZu
 YM9Ky8vQPRnfuZAKkDjxdrhw3Zxj3968mE/URonR8d1Ea5ARYGbt1qtZz
 YLtAbQk10Oz95O93ZqAiPS4BdUTZ7O/3ZTBaxvMAEiCtkNTvqjrWKhaNO
 uDUvC59DWT7IY26UEoYdY28GFRNiA+nuMhbwaTaV/fTx15L2bIgX/4ciF
 A4V0f2uNQCeO3mpDEniqn6pK23/mSVGZ8vXpvqJbDk3gjrcVgxF2LMkkb A==;
X-CSE-ConnectionGUID: 4lCHoMTMRyWfOp4q2lzLEg==
X-CSE-MsgGUID: kjoC32kEQ8OWehZw7IkeWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="50258176"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="50258176"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 03:58:55 -0700
X-CSE-ConnectionGUID: q09cnZ7DQUirSg/k/4QkqQ==
X-CSE-MsgGUID: NhCaLPhCSLyVROi74O5T3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="72129833"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 03:58:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 03:58:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 03:58:55 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 03:58:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wwG0JUFxs2jZObTUJv+F0p0jC7Q2CxMrXqhlXq6uAnfIzgve9tEtxqzYYIh5FIFUmpX7237/NMDlKByMzz/tP2OcPaMUBmLbo9NfEs83s/vGMbXEDTN44/NjcFlYMhsvqGA189ePQYOTIORcqahVaWnPEDFOnbkbnI3ovMzzNjGMOMj+77PEjjiQ0aRmcWfF+cxdBxwShPos6K9QcPWcC+XGW/aqudxSCJ+bS3bqnuSDls2Qu+C4jB8gZPWIi+oYKK25DfMDONTVmjQmxPD3tWNEyC3VEeRvjN2dKbJFifPQ2PxGYWTIXDZKjMaUg61y4kNnAIl2imd7gbrq1ROrdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4c3331ppvsvZActBKLIE97iSWC7i3/TFFskdr1X6ss=;
 b=U52NFR4XQ3soNAKRBCIrBLgzuhbxFv/Pcx1yvJGZzp8gdYqAezHm8wqEiwTq0z+tFMu0UfLST5olA9TGlX7g3fStdmSuwmCnx680gbV6EU0gyKUoRGu1vxD+vs6T/+0NaMxog/TN0sWNclRKp2w2T4KMs1v7SiBlr/TK2m9rCeoNWt/h9osyHJpWcnOPbMLA1rf7wu8bf1o05Hk4pOHIoSUQcHGbEY3cb1sFhHbU9snnHQKgksycr0XPBrJN/9a/he5j8FgSyAwzNsB2igwWYM6bYfKp4pRT79K1i0w5e6mzcXp7MVNwDEsbai4tQC0bM45C+VkA3jG+V8umolcQuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by IA1PR11MB6194.namprd11.prod.outlook.com (2603:10b6:208:3ea::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Wed, 11 Sep
 2024 10:58:52 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%4]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 10:58:52 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Shankar, Uma" <uma.shankar@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
Subject: RE: [PATCH] drm/xe/pm: Move xe_rpm_lockmap_acquire
Thread-Topic: [PATCH] drm/xe/pm: Move xe_rpm_lockmap_acquire
Thread-Index: AQHbBC2aE0C/q0Z9wkqyX4TdiGu937JSZeeAgAADRvA=
Date: Wed, 11 Sep 2024 10:58:52 +0000
Message-ID: <SN7PR11MB6750B4035CA685C864D9ADA2E39B2@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20240911093026.643605-1-suraj.kandpal@intel.com>
 <40fb2baf-ca16-4d76-a672-48bd6e2d76de@intel.com>
In-Reply-To: <40fb2baf-ca16-4d76-a672-48bd6e2d76de@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|IA1PR11MB6194:EE_
x-ms-office365-filtering-correlation-id: c11c75dd-c8ca-44f8-0254-08dcd250b930
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aHRJY1ZOOXdnUHp1SGU2U01FRVZ6U2htWmNQOEtITEhPVkJXZkYwTUcrOUtZ?=
 =?utf-8?B?WjhjVWszZG50dTMvRmFxNi82TkVzY0Y3akRhOXBGVCt0M2xLanU4eWU5YmxJ?=
 =?utf-8?B?aVBVZ0MvN3BYTTJXVVBHcm9ZOVZuSDRrd3BTL3kxL0hzR1ZDVUJCNzJNUDFu?=
 =?utf-8?B?T3BnWCttZ2l1djc2L3RNa3hPVlhESnFCMXZPWkdRaCtRYXROSVE1TE5IdVkw?=
 =?utf-8?B?YUxaOGFkK3B4Q3Nab0xFcmI5L1ZpdEV1OWdra3dsVnY2RkRkZmVDNXA4ZU5J?=
 =?utf-8?B?eFRTdzFZM0hvUENZN0p6bFJKeTJLQ05hM28vV0s2dEFOY242ZjZRUzltYnIw?=
 =?utf-8?B?ZkYraHFUbGpTdHlHaW43ME9WVnA5S2FlRnBmeDBIVy9PVVB3T1BiSGxRaFFN?=
 =?utf-8?B?TlVqM0lRcXBUbWJZbkMyb0FUd283c3IxQmEreVZCSU9YU0pHb3Y1enVsVVFw?=
 =?utf-8?B?Q2xrNHlpMDRDYWNpSVNVOHZleC9USWlaRVlIMlh6WTRNWUU2ckVVc3V1dzU1?=
 =?utf-8?B?MS9iRGhWMVRtNUUyd2Y5NWRDMm50SWtMYm5tSXNaZjBCV0RySnhSbWMrdXBq?=
 =?utf-8?B?RXlHQXVRU0dleEx1Q3ZCS1Yxc21aZW5jNkc5eExER3ZiYThSKy9xV2JNSjFi?=
 =?utf-8?B?ckdweGMwSDZIY1dHdDd2c2NnQzd4SVBDVVIyRk9hK1U0aDdvb0hid2Znemh2?=
 =?utf-8?B?dW8zVTdSRDRrU0ttVFB2emNqZEJJRTIxZWVPbUpvbXRTcWw1Mnh6Wm4ycFo1?=
 =?utf-8?B?dVFnRGphTVIwUWhiWEFYd1ROWG1UTFF5TlNGc0IrVnZiNndGci83THluZEpF?=
 =?utf-8?B?NUpVNFZyOVpyL2hQYmVxUUZHSVFyL1J5MlhSZGpLL0MxQy9QZnFDUnRiRVpk?=
 =?utf-8?B?eUZ6Sjc4N256ZFQ0RkdQb0lmd0g5alpqNU9HRCtqTVg0SndGRklFRlBlMWJ1?=
 =?utf-8?B?QmdjdTRhZnYreGJ1bW52UjA2WThPTEh6TU1XbmdzQ3RUZ0F1b2NMeHZrTzNx?=
 =?utf-8?B?cGZBM1Q1YmVXa0pGZWdKMzhJdGNkdXNtVFludkxxaFhIbUM0Tzlyb2pWOFo4?=
 =?utf-8?B?ajdEdllPNWx0SHYwbUdaV1BqVXowVGxYeFNmTUwwWEk4MEtPc1Z1MHpIU2sw?=
 =?utf-8?B?OUs0dUdYcUZtc2JGbzM0YUd3QTFFMXlxS1FIak4rYVphYUpEbXN0ZjhqVUU4?=
 =?utf-8?B?SCtJR21HTGoyZVJoajZXNVNQOVJyYkEwd29qbDgveXJuZDFSWk1oS2l0citk?=
 =?utf-8?B?S1FuYk9Bd2daOWVKMHNyNUxQN2RwU0lzRkFpN0QrRmcycERRU2tGdTJJN0FF?=
 =?utf-8?B?Mmp2WE15U2ZCK2ExUlJ3T0JuWjNsQllzMlFGall3RjkybXpNSjcvRldGbVRn?=
 =?utf-8?B?VVpWQ1l2ZTIvME5oZG9CTnRGMjh0cExOa2UzMDNEVzU0UEhFbFpaYTEzN2RN?=
 =?utf-8?B?Y1l5Q2hYaW41WGJlT0JUaEpSM2JXaEFkdFRxaDJlM25uOStKQ1FZVEpJaUpz?=
 =?utf-8?B?K3B6STlOTnBFMkdOcXpwWHJwdHRPQkZ1bGpKQU1US1pXR2p2RXBiR0FaWThP?=
 =?utf-8?B?TFVsU3VoRnJ3a1pjMyt3WHFEaHNxaS9kMTR3MytDVFJNK0t0d2pjQk50cjF3?=
 =?utf-8?B?VjBEckI4eUx5SEpIVjlCdTlFaEFDdjVKWHppUXc5QTY5Tzl2L08vVDVTVmVR?=
 =?utf-8?B?bEg2cnhkLzRoQWYzWXJCSm9xUmRjeUZMeE9mTWt3enY5THBZb0xnWUhDeWVR?=
 =?utf-8?B?RVZNNXZuTmlLRWUyeG9Oc2M4enJzZXZRT1NUOFFwRW1SYTJWUlpxSHR1OGlT?=
 =?utf-8?B?N1FrSE9UT3ZIM1BUMU9INGNaak8zcjlxa1JVWFZSREZ5OFFMOXlqTXpvQ2Fo?=
 =?utf-8?B?bzYxVWVuaWtGYVJJbXU4TmlkM1BkZ0xBRE1qTG14OHRLZTNnekN0dUluN1lJ?=
 =?utf-8?Q?Dx5eNAj8090=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dW03NUsydUZPYXJHZ0ErdUxvUTJKVHczQWRHMkJ0YVd1M3RPQlhCc3hMQXRL?=
 =?utf-8?B?NVErRE1WTEgydDZkdm5sb0V1R21wZmd1YisrR3pMOHZ0S3NBNlJid0dhaEly?=
 =?utf-8?B?R1d2YjJSUTcrQXJrdVE3RzNDaXk2OE5TZ0VCTUJnSXNxUkdjM1pUSFNwa2tD?=
 =?utf-8?B?Ym9RRTQ2Ky9LT1BubXI1M2ZTYkdPUW8ycVkwTGxQMXMvRE9pRll1a0grcnAx?=
 =?utf-8?B?ZjNLY0lOMW9Nd3N5MGh0ODlkU2N6MFlGSzF2YzNEQlB3S2lFUEU4UE12K0lv?=
 =?utf-8?B?YVFKdnVGYkl6ZFF1UjRKdTdBRDFXdTR2Tytxb0RQM1ozdnVQV3B5ZC9tZzlM?=
 =?utf-8?B?RGRHeGcvR3AzK0FoYjg4ZnpialBnSU1KUlQ5dzdWWVlmWE0zLzFHSGZYU1di?=
 =?utf-8?B?aFlieS9OTmFNR2xLS3B3cmhoMWU1cWZYYWRqSDRJbVB1WTAxQUEyTi9rSVRS?=
 =?utf-8?B?bkY1bnMzdHRzM0dmM0FvLy9ka1FqQTl3dnhWQTkxNWp1VFA1cGVNTzBnQmxv?=
 =?utf-8?B?K25FR1Y1UnJtZkFpQWwvZm9LTGo5RGhGOGtseWpQeFZpa3UzcjdKSkJxZFcy?=
 =?utf-8?B?d3JLLysxcDUxL3ZHQklrTEkxMFA4OVFNYWZLRlBMc2J3OHlpR1RUUHRTOTJt?=
 =?utf-8?B?WEJGcWhJQ01hUkk5emRISnFuaXE0Z3lFaDMyYWFibVhnS094THlrTVVPOU5B?=
 =?utf-8?B?U05RRVJvRTcvd1JwZTd3Q2F2K2p0enJQNnU0b3B3bU0vV1hkUlA4UVBXbVJC?=
 =?utf-8?B?RzZZdW0vTWhNaGRkS2xVeG1NZUNRd01QL3VtRllJQW1PU2xwTXVOQUt6eW5j?=
 =?utf-8?B?aG9KQ3Z0M2dSY1hDRjJ3RWVYdFF6WHhUWXZ0TE9KbkxRL1ZTWW9Zc21OdlJv?=
 =?utf-8?B?V3FZZ0dDZE54QWg3M0pMMnk5SmtrNHozemMycm9BKzZmRCs4WUMxT2huK2xh?=
 =?utf-8?B?cmc0OStBZ2kvYVVFUlNQRjl1Y0NQaGpNSU9wTFREN3JFK2hHVkR0K0ZhM2g2?=
 =?utf-8?B?Y0x0SWdsUGViTXAvcGorNldyNmFpVVFMVmJHSkdKcm9oV05sQ0RxWXZlbG1N?=
 =?utf-8?B?TjJNTnVqMmN1N3RnTlJWNGNRdUI2YUo1L0g5b0ZVdTZydytDMGlZVnJtRUIy?=
 =?utf-8?B?ODhHZzZMZWNneGlPck1zWEdiV255a3RJOThueXIzRGNLYXlFKzRKRktPYTdQ?=
 =?utf-8?B?OEJ3OCtCbERBOENCKzFtVUZSK29FTEtwVExzVFRTVFJZQ3ZlZHNKNXVYRE5k?=
 =?utf-8?B?Uk43RVcxTG9ORUFQajc3bE13c3IrRXIza2FwdDJRTmw1UW1SSHlMMVFWRjdK?=
 =?utf-8?B?KzVZNlFWTnBQdldPendqbmVZbHlJaytlY2ZrZ0k5d3NhLzZ5bzV3MnRtRWJF?=
 =?utf-8?B?RTNkSDdhb0xWajNnS2xucmZDWVZtRjB2U1EzbkpkazlDUGU0RG12WWhmQ082?=
 =?utf-8?B?enBFMHhXYzBJclluYnZ3LzZQS0RNK2IwNmpMY3RrR2M0Q09pcTU4Q2VESjdr?=
 =?utf-8?B?MDVnd1VwdUZ0R0hLYlNBblhzWTNhazFxTnFKUENxWEpUbzg3MFVVbXhtNEFQ?=
 =?utf-8?B?MTVzRFp0QVBuc3Y2SkdsQTVNby9hYjhIc1h0a2NNenlWK05IY3VrUmtZYUpJ?=
 =?utf-8?B?RzljQ2xRa3o4NlJQZ21BemdMVkZJYmZrWUN2QURPVXVOR1k1WjhhcFNKOHBu?=
 =?utf-8?B?M2VjaURSTTNCLy80N1dwZGo2Wlo3U0ZyYWtabmJVQ3U5SjZQSmpnNDRWUnFD?=
 =?utf-8?B?Q09lUWRCNUc1Nms5RGo0Q0NLUlcxVUI5L1BlVGFPUzF6MEdHbk1Zdy9ZcCt4?=
 =?utf-8?B?Q20rZ0NFcTNMODRjL0VrZlpacDZlaUJySkd1STZJMnVGMURwRnpUQWxOMTRO?=
 =?utf-8?B?TTdnYzI0bE5BYU5wN0E1ay9wYVJvZGx3eXFSR2ZpMzU3aXJhaVhkQlRmOHh2?=
 =?utf-8?B?dzJjN2RGbHgxZzJ4bURISUszYzZ4UFdzVWNRZlNSaytkU2gvcUFxTFVScUdG?=
 =?utf-8?B?L0UwNThlbFdhV0lDZzFWQ2ZxZldxQU8rRkNaVDNGQW5Sclp0M2R1TUcvcyto?=
 =?utf-8?B?djY2dzM3WVRQMUh5L2dFaE5Cak5LVi9QeVpyaHQ4QUpZQzl0YzRIeGNNMUYx?=
 =?utf-8?Q?9kmNkPQQ6nYx5Uj2ZDV0snA6Y?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c11c75dd-c8ca-44f8-0254-08dcd250b930
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2024 10:58:52.5419 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o3FgEwXYFWaNHB+Z0nuyIoYsSiaW/8RYwgiHQ8U9cujjB3gZW8U0xAgJToEAtbnaa4MiCxAV/3agD0WYUh6OMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6194
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVsZCwgTWF0dGhldyA8
bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMTEs
IDIwMjQgNDoxMSBQTQ0KPiBUbzogS2FuZHBhbCwgU3VyYWogPHN1cmFqLmthbmRwYWxAaW50ZWwu
Y29tPjsgaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBTaGFua2FyLCBVbWEg
PHVtYS5zaGFua2FyQGludGVsLmNvbT47IFZpdmksIFJvZHJpZ28NCj4gPHJvZHJpZ28udml2aUBp
bnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS94ZS9wbTogTW92ZSB4ZV9ycG1f
bG9ja21hcF9hY3F1aXJlDQo+IA0KPiBPbiAxMS8wOS8yMDI0IDEwOjMwLCBTdXJhaiBLYW5kcGFs
IHdyb3RlOg0KPiA+IE1vdmUgeGVfcnBtX2xvY2ttYXBfYWNxdWlyZSBhZnRlciBkaXNwbGF5X3Bt
X3N1c3BlbmQgYW5kIHJlc3VtZQ0KPiA+IGZ1bnRpb25zIHRvIGF2b2lkIGNpcnVsYXIgbG9ja2lu
ZyBkZXBlbmRlbmN5IGJlY2F1c2Ugb2YgbG9ja3MgYmVpbmcNCj4gPiB0YWtlbiBpbiBpbnRlbF9m
YmRldiwgaW50ZWxfZHBfbXN0X21nciBzdXNwZW5kIGFuZCByZXN1bWUgZnVuY3Rpb25zLg0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogU3VyYWogS2FuZHBhbCA8c3VyYWoua2FuZHBhbEBpbnRlbC5j
b20+DQo+IA0KPiBDYW4geW91IHByb3ZpZGUgdGhlIGZ1bGwgbG9ja2RlcCBzcGxhdCBvciBhIGxp
bmsgdG8gaXQ/IFdlIGFsc28gbmVlZCB0byBnaXZlIHNvbWUNCj4gc29saWQgYW5hbHlzaXMgb24g
d2h5IHdlIHRoaW5rIHRoZSBzcGxhdCBpcyBhIGZhbHNlIHBvc2l0aXZlLg0KDQpTdXJlIE1hdGhl
dyANCkZpbmQgdGhlIGxpbmsgYmVsb3cgdGhlcmUgYXJlIHR3byBkaWZmZXJlbnQgc3BsYXRzIG9u
ZSB3aXRoIGZiZGV2IGFuZCBvbmUgd2l0aCBkcm1fZHBfbXN0X21ncg0KQm90aCB3aXRoIHRoZSBz
YW1lIHJvb3QgY2F1c2UNCmh0dHBzOi8vZ2Z4LWNpLmlnay5pbnRlbC5jb20vY2lidWdsb2ctbmcv
aXNzdWUvMTM0OTA/cXVlcnlfa2V5PTRlYWRjZmU1NzdlN2I4MDdmODNiZjVhOTAzMWRlYzExYWUx
MjNiNzcNCjEpIGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2ludGVsLXhlL3hlLTE3
NzUtZjBhNjgyNGQ5ZTRiYTJlMWJlYWJhYjRlM2VlYjE5NWFhN2ZlYTE2Ny9yZS1kZzItMTcvaWd0
QHhlX3BtQGQzY29sZC1tbWFwLXZyYW0uaHRtbCNkbWVzZy13YXJuaW5nczI2Ng0KMikgaHR0cHM6
Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvaW50ZWwteGUveGUtMTkyNC1mM2VkZWQ0ZjhhMDVk
NzNhMGI5NGYyN2UwNTczN2VhMzQyNzQ1MGIzL3JlLWRnMi0xNS9pZ3RAeGVfcG1AZDNjb2xkLW1t
YXAtc3lzdGVtLmh0bWwjZG1lc2ctd2FybmluZ3MxNzINCkhpc3Rvcnkgb2YgdGhlIGlzc3VlIGNh
biBiZSBmb3VuZCBvbiANClZMSy02MTQxMQ0KRnJvbSB3aGF0IEkgc2F3IGl0IHdhcyBiZWluZyBj
YXVzZWQgYmVjYXVzZSB0aGUgbG9jayBkZXAgbWFwIGVuZGVkIHVwIHRha2luZyBhbGwgdGhlIGxv
Y2tzIHRoYXQgYXJlDQpMYXRlciByZXF1aXJlZCB0byBldmVuIHRoZSByZXN1bWUgc2F5IG1zdCBj
b25maWcgd2hpY2ggdGFrZXMgbWdyLT5sb2NrIGluIGRybV9kcF9tc3RfbXNncl9zdXNwZW5kIGFu
ZCByZXN1bWUNCkZ1bmN0aW9ucy4gQW5kIGh3X211dGV4IGxvY2sgd2hpY2ggaXMgdGFrZW4gd2hl
biBhY2Nlc3NpbmcgZHBjZCBpbiBkcm1fZHBfZHBjZCBhY2Nlc3MuDQoNCg0KDQo+IA0KPiA+IC0t
LQ0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BtLmMgfCAyOCArKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMTQg
ZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3BtLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcG0uYw0KPiA+IGluZGV4IGEzZDE1MDkwNjZm
Ny4uN2YzM2U1NTM3MjhhIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9w
bS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BtLmMNCj4gPiBAQCAtMzYzLDYg
KzM2MywxOCBAQCBpbnQgeGVfcG1fcnVudGltZV9zdXNwZW5kKHN0cnVjdCB4ZV9kZXZpY2UgKnhl
KQ0KPiA+ICAgCS8qIERpc2FibGUgYWNjZXNzX29uZ29pbmcgYXNzZXJ0cyBhbmQgcHJldmVudCBy
ZWN1cnNpdmUgcG0gY2FsbHMgKi8NCj4gPiAgIAl4ZV9wbV93cml0ZV9jYWxsYmFja190YXNrKHhl
LCBjdXJyZW50KTsNCj4gPg0KPiA+ICsJLyoNCj4gPiArCSAqIEFwcGx5aW5nIGxvY2sgZm9yIGVu
dGlyZSBsaXN0IG9wIGFzIHhlX3R0bV9ib19kZXN0cm95IGFuZA0KPiB4ZV9ib19tb3ZlX25vdGlm
eQ0KPiA+ICsJICogYWxzbyBjaGVja3MgYW5kIGRlbGV0cyBibyBlbnRyeSBmcm9tIHVzZXIgZmF1
bHQgbGlzdC4NCj4gPiArCSAqLw0KPiA+ICsJbXV0ZXhfbG9jaygmeGUtPm1lbV9hY2Nlc3MudnJh
bV91c2VyZmF1bHQubG9jayk7DQo+ID4gKwlsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUoYm8sIG9u
LA0KPiA+ICsJCQkJICZ4ZS0+bWVtX2FjY2Vzcy52cmFtX3VzZXJmYXVsdC5saXN0LA0KPiB2cmFt
X3VzZXJmYXVsdF9saW5rKQ0KPiA+ICsJCXhlX2JvX3J1bnRpbWVfcG1fcmVsZWFzZV9tbWFwX29m
ZnNldChibyk7DQo+ID4gKwltdXRleF91bmxvY2soJnhlLT5tZW1fYWNjZXNzLnZyYW1fdXNlcmZh
dWx0LmxvY2spOw0KPiA+ICsNCj4gPiArCXhlX2Rpc3BsYXlfcG1fcnVudGltZV9zdXNwZW5kKHhl
KTsNCj4gPiArDQo+ID4gICAJLyoNCj4gPiAgIAkgKiBUaGUgYWN0dWFsIHhlX3BtX3J1bnRpbWVf
cHV0KCkgaXMgYWx3YXlzIGFzeW5jIHVuZGVybmVhdGgsIHNvDQo+ID4gICAJICogZXhhY3RseSB3
aGVyZSB0aGF0IGlzIGNhbGxlZCBzaG91bGQgbWFrZXMgbm8gZGlmZmVyZW5jZSB0byB1cy4NCj4g
PiBIb3dldmVyIEBAIC0zODYsMTggKzM5OCw2IEBAIGludCB4ZV9wbV9ydW50aW1lX3N1c3BlbmQo
c3RydWN0DQo+IHhlX2RldmljZSAqeGUpDQo+ID4gICAJICovDQo+ID4gICAJeGVfcnBtX2xvY2tt
YXBfYWNxdWlyZSh4ZSk7DQo+ID4NCj4gPiAtCS8qDQo+ID4gLQkgKiBBcHBseWluZyBsb2NrIGZv
ciBlbnRpcmUgbGlzdCBvcCBhcyB4ZV90dG1fYm9fZGVzdHJveSBhbmQNCj4geGVfYm9fbW92ZV9u
b3RpZnkNCj4gPiAtCSAqIGFsc28gY2hlY2tzIGFuZCBkZWxldHMgYm8gZW50cnkgZnJvbSB1c2Vy
IGZhdWx0IGxpc3QuDQo+ID4gLQkgKi8NCj4gPiAtCW11dGV4X2xvY2soJnhlLT5tZW1fYWNjZXNz
LnZyYW1fdXNlcmZhdWx0LmxvY2spOw0KPiA+IC0JbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKGJv
LCBvbiwNCj4gPiAtCQkJCSAmeGUtPm1lbV9hY2Nlc3MudnJhbV91c2VyZmF1bHQubGlzdCwNCj4g
dnJhbV91c2VyZmF1bHRfbGluaykNCj4gPiAtCQl4ZV9ib19ydW50aW1lX3BtX3JlbGVhc2VfbW1h
cF9vZmZzZXQoYm8pOw0KPiA+IC0JbXV0ZXhfdW5sb2NrKCZ4ZS0+bWVtX2FjY2Vzcy52cmFtX3Vz
ZXJmYXVsdC5sb2NrKTsNCj4gPiAtDQo+ID4gLQl4ZV9kaXNwbGF5X3BtX3J1bnRpbWVfc3VzcGVu
ZCh4ZSk7DQo+ID4gLQ0KPiA+ICAgCWlmICh4ZS0+ZDNjb2xkLmFsbG93ZWQpIHsNCj4gPiAgIAkJ
ZXJyID0geGVfYm9fZXZpY3RfYWxsKHhlKTsNCj4gPiAgIAkJaWYgKGVycikNCj4gPiBAQCAtNDM4
LDggKzQzOCw2IEBAIGludCB4ZV9wbV9ydW50aW1lX3Jlc3VtZShzdHJ1Y3QgeGVfZGV2aWNlICp4
ZSkNCj4gPiAgIAkvKiBEaXNhYmxlIGFjY2Vzc19vbmdvaW5nIGFzc2VydHMgYW5kIHByZXZlbnQg
cmVjdXJzaXZlIHBtIGNhbGxzICovDQo+ID4gICAJeGVfcG1fd3JpdGVfY2FsbGJhY2tfdGFzayh4
ZSwgY3VycmVudCk7DQo+ID4NCj4gPiAtCXhlX3JwbV9sb2NrbWFwX2FjcXVpcmUoeGUpOw0KPiA+
IC0NCj4gPiAgIAlpZiAoeGUtPmQzY29sZC5hbGxvd2VkKSB7DQo+ID4gICAJCWVyciA9IHhlX3Bj
b2RlX3JlYWR5KHhlLCB0cnVlKTsNCj4gPiAgIAkJaWYgKGVycikNCj4gPiBAQCAtNDYzLDYgKzQ2
MSw4IEBAIGludCB4ZV9wbV9ydW50aW1lX3Jlc3VtZShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4g
Pg0KPiA+ICAgCXhlX2Rpc3BsYXlfcG1fcnVudGltZV9yZXN1bWUoeGUpOw0KPiA+DQo+ID4gKwl4
ZV9ycG1fbG9ja21hcF9hY3F1aXJlKHhlKTsNCj4gPiArDQo+ID4gICAJaWYgKHhlLT5kM2NvbGQu
YWxsb3dlZCkgew0KPiA+ICAgCQllcnIgPSB4ZV9ib19yZXN0b3JlX3VzZXIoeGUpOw0KPiA+ICAg
CQlpZiAoZXJyKQ0K
