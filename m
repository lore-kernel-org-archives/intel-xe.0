Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1429C369A9
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 07:49:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748B710E08D;
	Wed, 25 Sep 2024 07:49:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bnQocJGU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66AB710E08D
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Sep 2024 07:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727250573; x=1758786573;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4QGkIjGmkN/9A0mY8cC1rZf7M8POAWcvcio0Oj02JVU=;
 b=bnQocJGUMe1zGuX86nLscQ21lGQtr0KsqeJ9djPiz1dRuBBZb81CwQdb
 A/0jMuUGsW14kBvmDWZK7RKkkfPvxjL04bMQ/obv78b2pb1jpWd2+XIZc
 QktN1EwhEqEhIoWOaNnH7/P8x3m+LAVUB3epdOBA8cv2mKjSEcHHZOh2f
 8XjHXSe3CXzcpCiF7LGcVngNjfdOBwNFStA5SUNJ7HFcXmVQhAeJU0E3O
 rK0LGr0eNaUNd/B/FSECXKZVqhHHSKH2K+GA365Qcz5i309hpHFvnhm3i
 O3UwCk70wBkNduyPz5TtZg0P/7W8z3ptRLL31bza9B7UPcyMG+F0JlgOS Q==;
X-CSE-ConnectionGUID: B6lPVQ3fSMunYo/ZAPh/gQ==
X-CSE-MsgGUID: U4Sq+FUGSXWtzspoWW+9Ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26380016"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; d="scan'208";a="26380016"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 00:49:32 -0700
X-CSE-ConnectionGUID: C+sdvmbrSeGU+UgRoUDl8w==
X-CSE-MsgGUID: 15uslwjGSPaMTbsEyFGGMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; d="scan'208";a="71564466"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2024 00:49:33 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Sep 2024 00:49:31 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Sep 2024 00:49:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 25 Sep 2024 00:49:31 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 25 Sep 2024 00:49:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yNZr2alzyGZ1Z3kSr1HBKMMjXzeS/lKLvV7giFhx+r4cUSdhMpBRSWforU7iIvHUrZX4C8SrisoZdsLtetExPw6YOLqAJSusJAF46blDUvpreYyBs/jd9R91bEPYCAqznETDyeW7zJkzFlT0L2/kUs7wmmH1JQLu2WPIZbgkQ5gNQKMEmV+kpWKU8TCYRbHIcVwG4zOZUBbwc1GajcWVnEaivPtH2gkVUxkJkETUG3WxQGVQBAYE9akrXsPbTFQHd5yZuAD08D4SYp6b7Gec3tETDVhOIc2dz77UDpM4RMk18rfGTuvablovUMURQDS3pjSFJylfRKbrNC3EohmDgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4QGkIjGmkN/9A0mY8cC1rZf7M8POAWcvcio0Oj02JVU=;
 b=UswVZLeOIb3ATIqYTnH2yjlCKwFQgURpALZVtPzP/StFZVs8/Bx6ELfogbtAMuCR0er+IEa6cwpG6NnFYaly6fagTtRfV3wY31MDh8VDSaa8xT5SeMx2UighiJWue18uret0C02z9V3amj3ebEuG/rrnVRW1uuhvdU1+XYoyKMGJsk/4ti6Cn5hPCGafNhkabFIR7f/n4ukXZpCgqDt1OBlPQEuRN/8qRTWlAvi00fybqWG4GX+BdgHZwyfs2kmsv9l7nZ35VhHiZnLE8kHSdg/kbJFSz0aI1zz5usMfVnbbe3FNXt3esDNLDKkG7S0nYyzdPXOmskRF7dfEUinNFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by CY8PR11MB7106.namprd11.prod.outlook.com (2603:10b6:930:52::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.24; Wed, 25 Sep
 2024 07:49:23 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45%3]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 07:49:23 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/display: Workaround for odd panning for planar
 yuv
Thread-Topic: [PATCH] drm/i915/display: Workaround for odd panning for planar
 yuv
Thread-Index: AQHbA48oGvkqoju7U0yJRSKRquRHjrJROAwAgBb/aHA=
Date: Wed, 25 Sep 2024 07:49:23 +0000
Message-ID: <IA1PR11MB6467918C20CD82BCC52A58BBE3692@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20240910143757.143614-1-nemesa.garg@intel.com>
 <0f18d2ab-9b81-4baa-a3f4-e52a311883c0@intel.com>
In-Reply-To: <0f18d2ab-9b81-4baa-a3f4-e52a311883c0@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|CY8PR11MB7106:EE_
x-ms-office365-filtering-correlation-id: 421d885e-6c84-413d-64ef-08dcdd36929a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Mm00Q1Q1L1lPRkd3UmYwbmo1MHpNS3M4NmYvOFl4TjNseHFwSkdzTEZIWDNp?=
 =?utf-8?B?TThxcjgzTXh0dmpnYkdkSGpieGkwcEJydFJOWkdycnJEVk1DNEJnUFdLWjRU?=
 =?utf-8?B?a0tnMjNOSE1LSVdQSnl4bHNFb1VXRkthY1lGdzVueUNCTXhsRHY2c1VkeW9r?=
 =?utf-8?B?Qm9yeWJPNkRhaEE4VHhONW1kdVpmL1JPblpzejJyWXlKMkZVbEV0dkNLbW5r?=
 =?utf-8?B?NjFDRjJhVXZRbXB0U2FwTmpYZkNhOUpSenVnSjdHdXZKdmpMdjVIejg3ZVYx?=
 =?utf-8?B?UnFmOFhINFhQYjl1b3hNVXlKOFZCNjU4OXJsVVpRdmVqSGR2TEhveGtDaFJn?=
 =?utf-8?B?T2p1T1I2YWs1OE4yd3NWUWNkM0ZnMThBTnN2alBPU2t0NnRLRlFMUjZVUTB6?=
 =?utf-8?B?U1RGTWJOY3p4SGFUb2tZSUUrdHoxSnZyTmVLb2M4Y2NBZ0RnQUc3b0gvWjFG?=
 =?utf-8?B?QmtZcjBYQTFnWHlsS1VPSEV4UjNVQWNXR3h3a1crQjJ0bVlzOSt3RWRsNmxH?=
 =?utf-8?B?NlQ1U2pTdnFwU1YzdzNoclJraHV0YldxRXU4OEJJL2E5Wmhqby9VYmVmZTBD?=
 =?utf-8?B?Qjd3bVFodmMrdU5EQTZjcko1N1JxQllUSUxMVldTb0tlVU1qYk1lRVp0bnBK?=
 =?utf-8?B?dFVjTmdMMVYxL3ZoZkdnY2JWeFEyY2RNWnFqUms2TmVmWXV4dENtMFJycmpY?=
 =?utf-8?B?L1VqT2xjUnZlUUFiU3Yrb1JtU0FEcXV4am1BbU9OMkpFZ1kvcE1aWkdtbFNK?=
 =?utf-8?B?TzhVTDltUGZaV0JDWU0xak8yQWJNekdtUGNjZFR1azFIVnJ0aDRoWkNqNkJ3?=
 =?utf-8?B?a2pyRkNqMm5rdUt1RmZqTnhBVmtvVlhSNTRXeEErVUJkS01pNGxqMjhzQUNo?=
 =?utf-8?B?NjBPazdiOTEvUy92eS9JVzlVRHAxTFN0V2tPL1VCT1p4WU1QOWtNTGRsb0Mv?=
 =?utf-8?B?bS8vVWN4em0raWFvalB1Zi9qSW44aXhpSU5TYm9HVDlWeUx2Vy92WG92SHYx?=
 =?utf-8?B?Zmx2ZENTZTU3cGcyMTgvYU9zU3JWNTdtNklKNHdnaW5ZWms0V1RzRXZjQ0Nq?=
 =?utf-8?B?d1NxcXR0empDU2Z0a0xpSDBMZnlPT3prRnR1THc4djZYdXZjK21OSEhwN2Ri?=
 =?utf-8?B?NjlSWEZFbFJwOGRYTjBrd1BGWlpBa2EwbXBmVjZOYTB2dkt2aTF0QTY4WTll?=
 =?utf-8?B?WTA4UDh5MGhvVVR6alBDekY5bWhwWERYSmQycWRTUkZITGl4ZzRBOU0wV2JI?=
 =?utf-8?B?QjlmdWtIanlPMzVmVkpUOGs3N0pPbWlZb0tXbEx1MHJLcFhVNklSUVM0S1hM?=
 =?utf-8?B?b21vQVFFaXNHUEFscnh0WmV2SURYNkhjazJLSWhBUmhVcXpSWlYxaFVzM3lp?=
 =?utf-8?B?QU8yeVhvdGo4STBiOXpBb3ZIMEVTL1o5TEE3TmFFZ0N5cHJJdEFCa2RqYjg0?=
 =?utf-8?B?dERKNWsvaUZiL2hBZzl1YW1nRnNEUC96YWhXdGw4Q2pnUzNtYjJldEZZVllx?=
 =?utf-8?B?bHdGK0tWSjNrVXZpZHpXQS8rb3pMRG9TME5ENjcyOEJHUjl0ME44bXJFa0E1?=
 =?utf-8?B?dlUwVXdUT3VBRlFCYzdKdEx5VEQwNWZCVjlmWTdpRjZLUW10QVZSaTBpbVZV?=
 =?utf-8?B?bUc3ckgwRHBjOEFscnpqZ1c4RkpFeVpzZkY0djF3L05JMnhMQ0p6TFk2ZXN2?=
 =?utf-8?B?czE2U1pnbmRhdXNOOGNESG1aYUhmU3RTb3RlelRyaDR5am9IQ3lKa1A4Nlg1?=
 =?utf-8?B?NWN0VlVEKzFRY0ZXM0JnL0FDWjJvQWNCOStZUVdUdy9rbnhyVUYvNis2VDYv?=
 =?utf-8?B?YmI1SjUvRm1uOWVEQkdmQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VWJhZXA4d1JCRmQ4SnFjVjlZSHRqSDdIUGs2a21IcVF0eHB3cit0eDBQcjht?=
 =?utf-8?B?MGw5ZVYyYjNEU1ZWMjU4V2lHb01jNisxUXEwc2FUcmQ2SFo2RTlHZVVWVFRz?=
 =?utf-8?B?WDZ4RHZJWGM4bGFkQU5qNE5RTm1GdDdmQzR1ajVMNklsakpLcklReUxwWWs3?=
 =?utf-8?B?SVYyVTlDYVpqbUdUTnBxZW9pamU5dmVsdFB2MzJES1VJZklWeTVJV0tRQWIy?=
 =?utf-8?B?djZ3YXFyN0ZUcGo4aWxpRDJ1VG0wcWRzQnZmRmhuY01leS9XQ0xOa0s3VUQ2?=
 =?utf-8?B?cGpQam8rbkxvTENrV2xwYklWQXA1ZVVSam81Nzg3RGlCNjhKcTg4MWVvVWI4?=
 =?utf-8?B?Yy92UFRycXM3b2gzNmtmeTRTdWxQZ21zaG9iTkdDVHRVTVc0RHZjb1VJYmk0?=
 =?utf-8?B?RWtzTHltMEVOUVRJRG5EanZjTUhTeHZ5M2lhYkhvc0RnYnd5NmtuWmVPOVBU?=
 =?utf-8?B?cGJZeWhQejUxeXFwby9QNUpBRHdTSHlCaU9Oa0R4SWg1bDFXbGo1d3pCVG5h?=
 =?utf-8?B?TW9CUWxZMEhvemIvR0lMSmticjZOOUtrcVZ1aU8vd0UxZ08zVWxmMDIxSkto?=
 =?utf-8?B?cm5aVXo2OGlVdVM1VnEvdGIrTHlGUTQ1ekptZ3VMR043ZHBFOWM4eEVVRVB0?=
 =?utf-8?B?NTRVQXRHOXVBcER5M2Zac2kxdlpzSlBaYjJLSzJtNnN6Q3BPcWFwTW5sUWxL?=
 =?utf-8?B?amNYU2lhbElqdXh5b0Z4b0NNYVpMS2sybGZVcngzYVg2cmpnTVZXYkZ0MlE3?=
 =?utf-8?B?MUdEUWV5WmlEVEpFYkI3RlluVnRtbHNGamppMHNSQ3ZDV2EzM0IxTWllRXhZ?=
 =?utf-8?B?UVp6amZnNlg3TUpCcFhlaFExTjhoRGpZWlpSK1RzYnJ0MjZrbVErdUt1Q3JX?=
 =?utf-8?B?MVhSNXhxUjVMQkQrOFZlMW9lODRNMGVleVBYdVhsUTJpbzRLVllUeFR6TkFK?=
 =?utf-8?B?QU1KNTI3QjZXQWgwQ0J5bXVPVEZlaVJaT0lrbDRqcm5jd2xjV21NSEpHQUNE?=
 =?utf-8?B?WVZlbDlncC8xWUhIMkhLUi9KdUtHNXNpRSs3cjhGbEM0OCs2QzZ5Zit5SXBG?=
 =?utf-8?B?dURHVTVJNU9Sb2JRZTg2WHZaWFVONDNPWHFISmlRNkFBWUNxeDlnY0tvL0Iv?=
 =?utf-8?B?a3VoVlNObmtNeXVXMDNiSHdsM2xGWTlsbFd0WGo1cEdTNk1sYzdpUUJ1VHd2?=
 =?utf-8?B?U3piUlE5YWIrZ0VySVM1UEJza1lqTWhGMXp6U0srWHRsZnoxT0lZUkJkNFpy?=
 =?utf-8?B?RHdjUDBYRTVrTFBNU1h0UTBTNjkxRjloNG9Xc1lLem5LY2o3TTRQZ0N5bzFw?=
 =?utf-8?B?dHJxMnhtZ1N0U1RyS1JIdWNZS3czM1lXQWZyK295WU9wQlowdDFhS3BUaWJ4?=
 =?utf-8?B?QXE2V051ck52NFlZbVdHclFlQ0lqUFRUNGE3SGI3RVB0cXhuWkJUYXpRUWVW?=
 =?utf-8?B?YVdNM3BhTTFZT09IZW9haWdNMS84YmZhZGpNZTBHSTFZQ2ltbnl1bHlOY1l3?=
 =?utf-8?B?ZWJ1ZEwyUERaemE5MU5mTzdGOGk2VmpBc1VmcUZYeXVWdjZaNFp5ZDZwKzlZ?=
 =?utf-8?B?bzJ5M1BLVzVudHMvQnFINlc3eUhJYzBkZHJIUmRlWFJxUkNObEtmMm82R3oy?=
 =?utf-8?B?OUNES3RHWTVOeEZYR2lVeWlFUEVuSXBQd1pVeEhhRmVYSmtmaVE4eGhDN210?=
 =?utf-8?B?TGc2ZzNwV29vK0tBQ2JWY1I2YVQ4R1F5TXNWbEc4UDVOYnlaLytaczVHTWxG?=
 =?utf-8?B?VzRKeEFEQzRwMjVoWlJ3NUEwZ3c0RnZyV0wrTm1vSTU1RjRSQThUMTZsZTA1?=
 =?utf-8?B?eVNFUThJRE1IYWRzQkRCaXl5TFROaWhrODZVa1B0Zk0xNUVkQmxmWkQxcE5P?=
 =?utf-8?B?SW51NnVTcURjZUc5Vk15UTRiYkJ0NytLTjEwL2pJT0pmbWtLb2N5UGV5ZFUw?=
 =?utf-8?B?N0Q1dnU3RUU4cWRWZFM2dWFFdVc3K1pkQnNPcm1yNVBSSVE3Q3dXckhvTXFo?=
 =?utf-8?B?c0czR2xnMjROeWJQR0V4VVFnYTRLa3QrZEV0bkdmOGFyblZueUYrYlVVWC9x?=
 =?utf-8?B?ZHJyV0tXRUtlK2dPZnNLeGZxcnhvdWFmQi95T0xvbjMwZ2RmWWtYREExTzk2?=
 =?utf-8?Q?IG9v9Hpd6Afifh7Eu6UyuTLjd?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 421d885e-6c84-413d-64ef-08dcdd36929a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2024 07:49:23.7251 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Kyj+cvrmpzgUkhNSnbZx52RzULEzGi+Qudh2AkQYvvb8TOiCZMxJNhXaBVF0teoFXxnz6aypZ6hgahZvXMYKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7106
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUG90dHVtdXR0dSwgU2Fp
IFRlamEgPHNhaS50ZWphLnBvdHR1bXV0dHVAaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBT
ZXB0ZW1iZXIgMTAsIDIwMjQgMTA6MDYgUE0NCj4gVG86IEdhcmcsIE5lbWVzYSA8bmVtZXNhLmdh
cmdAaW50ZWwuY29tPjsgaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0hdIGRybS9pOTE1L2Rpc3BsYXk6IFdvcmthcm91bmQgZm9yIG9kZCBwYW5uaW5n
IGZvciBwbGFuYXINCj4geXV2DQo+IA0KPiANCj4gT24gMTAtMDktMjAyNCAyMDowNywgTmVtZXNh
IEdhcmcgd3JvdGU6DQo+ID4gRGlzYWJsZSB0aGUgc3VwcG9ydCBmb3Igb2RkIHggcGFuIGZvciBO
VjEyIGZvcm1hdCBhcyB1bmRlcnJ1biBpc3N1ZSBpcw0KPiA+IHNlZW4uDQo+ID4NCj4gPiBXQTog
MTYwMjQ0NTk0NTINCj4gPg0KPiA+IHYyOiBSZXBsYWNlIEhTRCB3aXRoIFdBIGluIGNvbW1pdCBt
ZXNzYWdlIFtTdXJhal0NCj4gPiAgICAgIE1vZGlmaWVkIHRoZSBjb25kaXRpb24gZm9yIGhhbmRs
aW5nIG9kZCBwYW5uaW5nDQo+ID4NCj4gPiB2MzogU2ltcGxpZmllZCB0aGUgY29uZGl0aW9uIGZv
ciBjaGVja2luZyBoc3ViDQo+ID4gICAgICBVc2luZyBvbGRlciBmcmFtZXdvcmsgZm9yIHdhIGFz
IHJldjFbSmFuaV0NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IE5lbWVzYSBHYXJnIDxuZW1lc2Eu
Z2FyZ0BpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2F0b21pY19wbGFuZS5jIHwgNyArKysrKystDQo+ID4gICAxIGZpbGUgY2hhbmdl
ZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hdG9taWNfcGxhbmUuYw0KPiA+IGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hdG9taWNfcGxhbmUuYw0KPiA+IGlu
ZGV4IGU5Nzk3ODZhYTVjZi4uNGFmZTgwOGYxMjhjIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYXRvbWljX3BsYW5lLmMNCj4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2F0b21pY19wbGFuZS5jDQo+ID4gQEAgLTEw
MjksOCArMTAyOSwxMyBAQCBpbnQgaW50ZWxfcGxhbmVfY2hlY2tfc3JjX2Nvb3JkaW5hdGVzKHN0
cnVjdA0KPiBpbnRlbF9wbGFuZV9zdGF0ZSAqcGxhbmVfc3RhdGUpDQo+ID4gICAJCSAqIFRoaXMg
YWxsb3dzIE5WMTIgYW5kIFAweHggZm9ybWF0cyB0byBoYXZlIG9kZCBzaXplIGFuZC9vcg0KPiBv
ZGQNCj4gPiAgIAkJICogc291cmNlIGNvb3JkaW5hdGVzIG9uIERJU1BMQVlfVkVSKGk5MTUpID49
IDIwDQo+ID4gICAJCSAqLw0KPiA+IC0JCWhzdWIgPSAxOw0KPiA+ICAgCQl2c3ViID0gMTsNCj4g
PiArCQkvKg0KPiA+ICsJCSAqIFdhXzE2MDIzOTgxMjQ1IGZvciBkaXNwbGF5IHZlcnNpb24gMjAu
DQo+ID4gKwkJICogRG8gbm90IHN1cHBvcnQgb2RkIHgtcGFubmluZyBmb3IgTlYxMi4NCj4gPiAr
CQkgKi8NCj4gPiArCQlpZiAoSVNfTFVOQVJMQUtFKGk5MTUpICYmIGZiLT5mb3JtYXQtPmZvcm1h
dCAhPQ0KPiBEUk1fRk9STUFUX05WMTIpDQo+ID4gKwkJCWhzdWIgPSAxOw0KPiAxLiBTaG91bGRu
J3QgaXQgYmU6DQo+IA0KPiBpZiAoIShJU19MVU5BUkxBS0UoaTkxNSkgJiYgZmItPmZvcm1hdC0+
Zm9ybWF0ID09IERSTV9GT1JNQVRfTlYxMikpDQo+ICDCoMKgwqAgaHN1YiA9IDENCj4gVGhhbmsg
eW91IFNhaSBUZWphIGZvciBwb2ludGluZyBpdCBvdXQuDQo+IDIuIFdpbGwgeW91IGJlIGFkZGlu
ZyB0aGUgImRpc2FibGUgZXZlbiB4c2l6ZSIgcGFydCBhcyBhIHNlcGFyYXRlIHBhdGNoPw0KPiBX
aWxsIHVwZGF0ZSBpbiB0aGUgc2FtZSBwYXRjaC4NCj4gDQo+ID4gICAJfSBlbHNlIHsNCj4gPiAg
IAkJaHN1YiA9IGZiLT5mb3JtYXQtPmhzdWI7DQo+ID4gICAJCXZzdWIgPSBmYi0+Zm9ybWF0LT52
c3ViOw0KPiANCj4gVGhhbmsgWW91DQo+IFNhaSBUZWphDQoNCg==
