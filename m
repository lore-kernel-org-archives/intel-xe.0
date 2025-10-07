Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4202CCA472
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 11:19:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9934C10E378;
	Tue,  7 Oct 2025 11:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b6OJw4db";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C00D10E18D
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 11:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759835939; x=1791371939;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Al6gVwnik85l1IDPqP/mlp2Kt7gXMEb094JmSQt2zaU=;
 b=b6OJw4dbFwd1E47dOIzyZ2tEG2GG2NzumC+RgXfqvy7PhYeuMM/YHhey
 0kqF6PCfgtkAuDosiCrWO9CzE5OZKJuY4agIbMxwa9HGW3w5VXPVk6USj
 p9Gh4iUhK/vMkTxEQ29fPyHVBEVCyFsl5O9O//Cckz9RkUocRby7x2PFc
 aqBYqzXP4l0145UjAxBleh8Jb6faA8Q2pAQAT6g310daLms6z87aWwgGm
 14DOCJhPDYfq758VMa9r6l0FRbr12aCEvopYElbciUZmDqX7FVqidmTU/
 EZ9jHDW7FOp7ws5j1nRuFDyGUhiNpcaVNSI16h5rKdzu4NCSj8515agCj Q==;
X-CSE-ConnectionGUID: utelm2QURsOjz1EPmL5tFQ==
X-CSE-MsgGUID: of7MqDn1Se2cdiS0fOq3OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="49570078"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="49570078"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 04:18:58 -0700
X-CSE-ConnectionGUID: n81FRX+XQR+YHxcroynV+Q==
X-CSE-MsgGUID: i38XgDnSRxyoxy4j4Hd9ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="179403610"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 04:18:58 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 04:18:57 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 04:18:57 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.16) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 04:18:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kC/Glmrij5WzHp/PntTedtwWawhSKJcBAVUCU4I0czxbX7W3uti9GJCLHgwnjwSfwLleqqBcMGWttwKBCotHXQt1IJX4WPdHnebMVniB/QJRZzjpLEATIPQKI4DTXuVns4rp6v5JqwbVekP2ASdBLOESo8IFQXVZCy0Gq/16Phx+CxUa+tjvfRr/XZkLo3WlPPabpqpq+jKn1aWXadI8z9w7UQyGbFOjfOb+/uhlYxSnADLZqWJeAoRdNDCXQRoVgayoCiN1A4j8zc2D/7ASe/EHaepqIKcGMBIN+3W5lbzHnsUceHlJYuRmvkBZt5GRG23fco9W8Mcx52KfeH4yCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Al6gVwnik85l1IDPqP/mlp2Kt7gXMEb094JmSQt2zaU=;
 b=kcI8s5GcO6D26BvAHgVLk07IZlQGh0QhH/AhSoz/8ZErECjIJU1xPx2srzK863GhUNxwTfBb/qURlKNp0kyOMPxkl2NjcfifM7kBoMJKi8olL1X5iyqdAahd2y89X6DD17cGjWFD/v2/n9e5X2Yy94l3dR4uN3moqVZRiG5WKuCG8962Vp+bckL9q3Is9IgSsjYgCihKOU5MUf7k5YLj2OqK1hmAhza0FWYsY2o+UAOi6AxMGD4qj6ExZaPQda7z2zk7RNKBS8JjWPXkiGLUykwXpzVKAp5ann3dARSFX6oKnoa/QxHPcXWYXFOpXnbRD+CtSPHnp3HcMn4reKhU/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8987.namprd11.prod.outlook.com (2603:10b6:208:574::18)
 by PH7PR11MB6555.namprd11.prod.outlook.com (2603:10b6:510:1a9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 11:18:51 +0000
Received: from IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::c011:ff94:944e:f96e]) by IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::c011:ff94:944e:f96e%6]) with mapi id 15.20.9137.018; Tue, 7 Oct 2025
 11:18:50 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Subject: RE: [PATCH] drm/xe: Fix include order alphabetically
Thread-Topic: [PATCH] drm/xe: Fix include order alphabetically
Thread-Index: AQHcN256JW1Nub1WzUW8CoDKRCCt+LS2gISg
Date: Tue, 7 Oct 2025 11:18:50 +0000
Message-ID: <IA3PR11MB89870A75783B5ED69B9CC82BD0E0A@IA3PR11MB8987.namprd11.prod.outlook.com>
References: <20251007094018.1400399-1-tejas.upadhyay@intel.com>
In-Reply-To: <20251007094018.1400399-1-tejas.upadhyay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8987:EE_|PH7PR11MB6555:EE_
x-ms-office365-filtering-correlation-id: 84c38417-9268-494a-7354-08de05934afc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?VTRXVXAvNEl2TkxtSy9zcVdia3M4d0RMOTNnbzZXVEdnN0JpdzJYZmllWTlW?=
 =?utf-8?B?RDBvNW5YaTZtd2F5VTFKNzlUWUx1cld5T21uMDZBRTJuMXB3WFFkQ2hZbUNJ?=
 =?utf-8?B?RGMxRndVQ09kK2JieHMwbkNrcHVLR3FNZHhuQzZGUXY0WUtEc0ZFMXBsN0d2?=
 =?utf-8?B?QkN1eFIxM1BVTTByQVJlNFYzZmtDZmVUbXV4SEVQM2dXdkhERGU4di9IU1o4?=
 =?utf-8?B?V0pYK1NwbDhyaWcwQzNiSVN3UEU0bHcvci8xY01xUUNVNkYzb0s5emJDSE8x?=
 =?utf-8?B?S2FuZlFtM1hTZHFuUFhLWDZha2g1SWpDVUI2MFQxSWhXR0NKRlJUWCtQNU5i?=
 =?utf-8?B?aktXRGUvMjlUZTdWSHBHV01PK0FxSXlpYUxFajVFNEM4cnZpK1Y2NUdqYkox?=
 =?utf-8?B?aldSRDFaaDQvRExzZ1h0cWFUdHI4dXFlb2FUZUoveU41SVFIOWkzZ2VhUDNM?=
 =?utf-8?B?RHorZzU0VHFrTEZhN2NHdU1DZXhxRVh1U1U5cGZsbGRBcG1DblNiQ3ZvUG1T?=
 =?utf-8?B?NndDZzVVSXFGVk1mdi9VTWFLMlVVYllwcStzYkZMYkp4RjJBaVBUMjlzQ0pq?=
 =?utf-8?B?M0hqMFl3aldQSUppcWlDK0R2Y1pvWElaWm4ydUI4NFoyWnpTTWk1WGlDQ1dr?=
 =?utf-8?B?REVlQlVQQ2krMzFZZm1ORnIxZTNRTTlCblBnRkVOWEJFeG10bVNMcWloa0JK?=
 =?utf-8?B?d0ZhbkpOQ2FyTG5uZEJmbG1sR3llZ1hxOGlVYmN3NnJsTXBUMEtjVTdoYXAr?=
 =?utf-8?B?aHJRQTh6YUcxSjVaT28yTWF5QXFYaEpjRVdBQjRYUHpOMlQvUWdUTmxmMUFs?=
 =?utf-8?B?Tkd4TjZ3bjJCaTRkanVzNEdxbVdWMnJoRHh3bTFIcnByVTAyVlZXSXNuNTBS?=
 =?utf-8?B?REJ1WUtZQmtudll2OUtnWW04TXVTZ3pwVWpSelQ5aVRBUER3KzR5aDRsdGxG?=
 =?utf-8?B?Zy83R3JyMlNoZEFyU0RsMHpFK2h1aXlmSjY2eTlPU1RzZnoyeWNENmlBR01L?=
 =?utf-8?B?K29FMHVsQUF2bkxqdC9XcG93QVdiTlVEU21Xc1BlN3VXVUNKZkNlYXFoVWVy?=
 =?utf-8?B?N3N1MFV0NEdqQldlRFhvZk10TWN5dktabUptSGVWZnp4N0sxak5TN1diejE1?=
 =?utf-8?B?ejZRdENXMEJ6clNWMHdUWXg0UlVHNTBoU3M5cmtqNi85SHpyNFl0VUhlaVM2?=
 =?utf-8?B?K1ZOamx5NUpFbU44Z0hMWG1tVWJ1d2Z1UU8yemcraXIwOEVINlh3RW5GUFh0?=
 =?utf-8?B?dnpRSjZ4TEE5NVNHSnB2akt5eU5zZGV2S3pubytkT3RVK0xaL3dSRmFJT1ZJ?=
 =?utf-8?B?Umg3bFBjSXpFdEFuMG10eVFMb3B1REh0elN5djVhM3ZOWE0zcGRSckVSRXZv?=
 =?utf-8?B?eXBxdmRpeXlXZEVsU1RNYmt4S0ZLMzhSeDlEd1dNZDh2M0ZDWmR0ZnNLQ0Vl?=
 =?utf-8?B?VmU3VGlmSEpGSm5CNmxaTVJtNERTYmdqOE9XQ2ZWZ2J4a0pNd1pFZ2JVQVR5?=
 =?utf-8?B?Uy9Uc0N2R1N6Q1YrTDhFa0xvR250M1h0QStEUE9vTHBiQjcxaE9FcGVlcitP?=
 =?utf-8?B?bGZ4blNHNmFUeFpuRVFrUHpCQXRqOEN4dCswTS9rRDBNMWczVWpVLzBjUkdI?=
 =?utf-8?B?SjRaTmdjdlZGVElMSmRhZXlhTmovZjFMTDFtRXhNUUtjMlFvMko4N2oycFpZ?=
 =?utf-8?B?dzgvTE80UlN3U2ZNRGlPT1R6Vll6TUFvUEgzTGZUaFlidlhqczR6VlZpZzFT?=
 =?utf-8?B?TytzcTU2MnRPMDRQN1Q4Y1BaSkZEL0lBbG4rWXZVZ2NGQm9aZE91NXpEdkhE?=
 =?utf-8?B?SEgwWEdDNk9yTWRxQ3YzNWlRemk3SEJaQlNCYmVTUUUxcVlHUk8zVnErUzlB?=
 =?utf-8?B?UlZwbi8wTG5jVTNpMW1LNHRuc1BTZXJZN3RmZitrcmFXYmZuMUhuNW5UZTBB?=
 =?utf-8?B?ZEpPMTJqc2p1QU0yMmhWSDZrZnpSTUhhUkcvOWs0VTlFOE1iWmxXbDJ0Q1RC?=
 =?utf-8?B?d3QwcC8yYVBwcXdrTGE2NmQvK0Y0UTdwaDlXU2U5OHgwY0lGNDg0bHhqOGxj?=
 =?utf-8?Q?iYLHpk?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB8987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NTh0Z0RVVUVyaVplczZHcytZdjVudFlScHdnbVFxY0plZTNSaFZZQVEwU2Fi?=
 =?utf-8?B?ZlNPbERyT25VKzVKSDNlVG5kbU5OdStXVjNWM0gyZ2FsZWVpQlc2bmFWM0ln?=
 =?utf-8?B?aEloK0FjSVBpMHlrV0tlT1A0MlRNaThwKzVLakNyZTQ4WFFtbXhlZ2FQV1JF?=
 =?utf-8?B?M2t0UGlZREJXTVFPeHovMk00VTltb0lOWHRFWllBS0k2T0ZIZGxHZlRaOW1P?=
 =?utf-8?B?Q3hrTTJyQUpZV2k4bkZkUzZnNHhEbzJEM2s3M1creWxDT0QxK3ZkMWFuYXdi?=
 =?utf-8?B?bXVLSTY3dUdqZzFqcmJDclg1d0wyVUJja0NTUzczVGJOVU4zb3pKQWJ1TmRi?=
 =?utf-8?B?UnJkdEw0VU5Ic0NiUk9hRUVwTXMvY1dsaStxdFRNNjk5b0M4OFBmTmZTTmNw?=
 =?utf-8?B?cGhXbEVjMXR4NWM3bXNlUGtiSEtxWWxvWDF3b2pEdERlTFEwT2xaNmcyUFRG?=
 =?utf-8?B?bUtGazlrZ2ZuUGQvUWFkeFArUE5seHpzcGdNQXJoSWlMV25vQis1RVpxam1n?=
 =?utf-8?B?RVVhMmtjdEY2a2c3L3kwRy9vYVBWZ01jWHRnQWJBVkc0ZzdidlRmM3A0YXdG?=
 =?utf-8?B?SFVlZHJQRi9RUHRzcEVQdzFUU1czVjg5UzFzck5tN3A4aGMxZU5scUhHMjRz?=
 =?utf-8?B?V1E1SHRrSWwzWFlNTXJ2YUR5YmtNbTFLa3JvajU3Rjk3L0NFTnRqVnk2dFl4?=
 =?utf-8?B?MU4rUmp1WU0yVWFEYTY1eGhFdDY5ZFh1eVI1VDkvR3pMdWN0Z0NxUDVmZDRa?=
 =?utf-8?B?MzJObHkvNEQzOE04S3REYXBiMUNLWHpjUXQ4V1hVeWV3RnRJVlVpZE9ZL3M5?=
 =?utf-8?B?T3k3U2VmbE5tNS9tc3dTSVdNb2JRTDl3N1pDcWdsaURhR1d3SjJKTEZyY2xV?=
 =?utf-8?B?bnNkby9RcVpmaWNsVlprUkQ1QmNFYzZhTUpuOGcwK0dnbnh5R0hyTGs4aWky?=
 =?utf-8?B?SFJ3c05xMWg5SlVKeVhmSkdTNCt2cXZtZnduZVZ6cE92eWIrbmMrN1hkRFh3?=
 =?utf-8?B?TURxRDBzM1AxT2szTGM2Q3J0cGNHL1FMbEl2YnVVeG9ZUHJ4aFJHc2RTT2xj?=
 =?utf-8?B?MTIrcjkwM0p3c1JXT3dDVlhJdGdOWEEwWXVJQ2NRaDVtV3RmaVZhZ29MVDl0?=
 =?utf-8?B?R1U4cUR1RzQrdTN0Mm1vS0ZpQ2U2ZDlQVzZxZDVJUEdXQ05LSTJtK0xlQU1l?=
 =?utf-8?B?bitPNFZBeGM5aFd1c0dnMGlZQTV6b3V6VXNqc2FHWm9lUHdGdFJJOFpIVmd3?=
 =?utf-8?B?MTErMHdTKzBKUE1Va2xUem1OejVWdXlyUXJzMTMralVoK1BUTWpYMTl0Nlh3?=
 =?utf-8?B?cXZvck50VjRmeW1hUDN2YU1UVUlCU3BocWpSdzZkQU9WZEJ5b2thZ0hwcDhZ?=
 =?utf-8?B?cGxWTlVzOXBXc0xTeWI3amdhRi95QUYvbWN4V3lCcmJLODNZaXVXSnJ0WmNM?=
 =?utf-8?B?em96OWlvam01SDM2dEJrM05YTkhUaGJVeXFCQTVvVXcrckxBQnZSUHBCS3lN?=
 =?utf-8?B?NFBYL1hjaDNGWTJQcks2QlVBMUwzL2IzK1ZINEM0MlNIL0xRb3dRWmc2anor?=
 =?utf-8?B?QWZUVzN3QXRLWWtoYm5ySUhLN2VpVm93UEVTSVFBMWJJVG5HR2tCVFI1TlBq?=
 =?utf-8?B?OWxVdStzVVBBZHozUG5kL2dnNGkrRFRtNmQ4TGhQUis1eG81dU5YaStiOStH?=
 =?utf-8?B?NjdjRXBhOFZXN2haYUpiZjFKZ1dPbi9jWXdCVFJOS2VFRDhNRlA1VkQ1NE9a?=
 =?utf-8?B?V2xnRU01b29lbkFWM2NFeHgydmJ5MG90cmRBSTZHZVlsdEpaNERWZWZkYUdM?=
 =?utf-8?B?cTZRWWV0cHNWb01wcEthdlFXOVF6ZlYxbmV6eTFQZWRNeXBoZmxOOHlYZDJJ?=
 =?utf-8?B?cmlWd1o5bWlIbVc3WFViZXVFR0ZxWEJmd1Q5VWxyVUNNOCtKNWplRnVvdzgz?=
 =?utf-8?B?NkJTZkdKdEZiVnhtTllHTlpNUENuLzBxUlZraS9GU1BJa2FtbGRhSG9oNEk5?=
 =?utf-8?B?QU9kV3NqSUp4aFR2bUJHcWdZMjRSRmtJVHRaci9uaElpUXkvRWRrY0pNMUh2?=
 =?utf-8?B?L08wWlVYYmhkS0ZFSUxDNU45Ujl1TUg5eDVDanhvM0Njdjh2dzVyWFU3RGZv?=
 =?utf-8?Q?GPpyGYnnuRt9OWr7jieQKqLA9?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84c38417-9268-494a-7354-08de05934afc
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2025 11:18:50.9150 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z0QjcIPB/mVjHrDsELZJBGrKyn0RMLugC3g4ig5uL5a9ygQB3l8Y+D/UCYxN9KrabmBVMXv3/4T3noE9sr31yw==
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

SGkgVGVqYXMsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwt
eGUgPGludGVsLXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2Yg
VGVqYXMNCj4gVXBhZGh5YXkNCj4gU2VudDogVHVlc2RheSwgT2N0b2JlciA3LCAyMDI1IDM6MTAg
UE0NCj4gVG86IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogVXBhZGh5YXks
IFRlamFzIDx0ZWphcy51cGFkaHlheUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSF0gZHJt
L3hlOiBGaXggaW5jbHVkZSBvcmRlciBhbHBoYWJldGljYWxseQ0KPiANCj4gU29ydCB0aGUgaW5j
bHVkZSBsaW5lcyBhbHBoYWJldGljYWxseQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogVGVqYXMgVXBh
ZGh5YXkgPHRlamFzLnVwYWRoeWF5QGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9k
cm0veGUveGVfZGV2aWNlLmMgfCAxOSArKysrKysrKy0tLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hh
bmdlZCwgOCBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
ZGV2aWNlLmMNCj4gaW5kZXggMzg2OTQwMzIzNjMwLi5jY2ZiZmQ3ZmE4NTggMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZGV2aWNlLmMNCj4gQEAgLTMsMjAgKzMsMTkgQEANCj4gICAqIENvcHlyaWdodCDC
qSAyMDIxIEludGVsIENvcnBvcmF0aW9uDQo+ICAgKi8NCj4gDQo+IC0jaW5jbHVkZSAieGVfZGV2
aWNlLmgiDQo+IC0NCg0KQXMgcGVyIG15IHVuZGVyc3RhbmRpbmcsIHRoZSBjdXJyZW50IGZpbGUg
aXMgYWxyZWFkeSBmb2xsb3dpbmcgdGhlIGNvcnJlY3QgTGludXgga2VybmVsIGNvZGluZyBzdGFu
ZGFyZDoNCg0KMS4gU2VsZiBoZWFkZXIgZmlyc3QgKCNpbmNsdWRlICJ4ZV9kZXZpY2UuaCIpDQoy
LiBMaW51eCBzeXN0ZW0gaGVhZGVycyAoPGxpbnV4Lyo+KQ0KMy4gRFJNIGhlYWRlcnMgKDxkcm0v
Kj4pDQo0LiBVQVBJIGhlYWRlcnMgKDx1YXBpLyo+KQ0KNS4gTG9jYWwgaGVhZGVycyAoInhlXyou
aCIpDQo2LiBHZW5lcmF0ZWQgaGVhZGVycyBsYXN0ICg8Z2VuZXJhdGVkLyo+KQ0KDQpJIGRpZG4n
dCBmaW5kIGFueSByZWZlcmVuY2UgZG9jIGZvciB0aGlzIG9yZGVyLCBidXQgdGhpcyBpc8Kgd2hh
dCBJIG9ic2VydmVkIGluIG1vc3Qgb2YgdGhlIGtlcm5lbCBjb2RlLg0KVGhpcyBwYXRjaCBpbmNv
cnJlY3RseSBtaXhlcyBkaWZmZXJlbnQgaGVhZGVyIGNhdGVnb3JpZXMuIEFuZCBjYXRlZ29yeS13
aXNlIGhlYWRlcnMgYXJlIGFscmVhZHkgaW4gYWxwaGFiZXRpY2FsIG9yZGVyLg0KSSBsZXQgb3Ro
ZXJzIGNvbW1lbnQuIEhvd2V2ZXIsIGZvciBtZSwgdGhlIHBhdGNoIGRvZXNuJ3QgbG9vayBnb29k
Lg0KDQotIE5pdGluDQoNCj4gLSNpbmNsdWRlIDxsaW51eC9hcGVydHVyZS5oPg0KPiAtI2luY2x1
ZGUgPGxpbnV4L2RlbGF5Lmg+DQo+IC0jaW5jbHVkZSA8bGludXgvZmF1bHQtaW5qZWN0Lmg+DQo+
IC0jaW5jbHVkZSA8bGludXgvaW9wb2xsLmg+DQo+IC0jaW5jbHVkZSA8bGludXgvdW5pdHMuaD4N
Cj4gLQ0KPiAgI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljX2hlbHBlci5oPg0KPiAgI2luY2x1ZGUg
PGRybS9kcm1fY2xpZW50Lmg+DQo+ICAjaW5jbHVkZSA8ZHJtL2RybV9nZW1fdHRtX2hlbHBlci5o
Pg0KPiAgI2luY2x1ZGUgPGRybS9kcm1faW9jdGwuaD4NCj4gICNpbmNsdWRlIDxkcm0vZHJtX21h
bmFnZWQuaD4NCj4gICNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+DQo+ICsjaW5jbHVkZSA8Z2Vu
ZXJhdGVkL3hlX2RldmljZV93YV9vb2IuaD4gI2luY2x1ZGUNCj4gKzxnZW5lcmF0ZWQveGVfd2Ff
b29iLmg+ICNpbmNsdWRlIDxsaW51eC9hcGVydHVyZS5oPiAjaW5jbHVkZQ0KPiArPGxpbnV4L2Rl
bGF5Lmg+ICNpbmNsdWRlIDxsaW51eC9mYXVsdC1pbmplY3QuaD4gI2luY2x1ZGUNCj4gKzxsaW51
eC9pb3BvbGwuaD4gI2luY2x1ZGUgPGxpbnV4L3VuaXRzLmg+DQo+ICAjaW5jbHVkZSA8dWFwaS9k
cm0veGVfZHJtLmg+DQo+IA0KPiAgI2luY2x1ZGUgImRpc3BsYXkveGVfZGlzcGxheS5oIg0KPiBA
QCAtMjcsNiArMjYsNyBAQA0KPiAgI2luY2x1ZGUgInhlX2JvX2V2aWN0LmgiDQo+ICAjaW5jbHVk
ZSAieGVfZGVidWdmcy5oIg0KPiAgI2luY2x1ZGUgInhlX2RldmNvcmVkdW1wLmgiDQo+ICsjaW5j
bHVkZSAieGVfZGV2aWNlLmgiDQo+ICAjaW5jbHVkZSAieGVfZGV2aWNlX3N5c2ZzLmgiDQo+ICAj
aW5jbHVkZSAieGVfZG1hX2J1Zi5oIg0KPiAgI2luY2x1ZGUgInhlX2RybV9jbGllbnQuaCINCj4g
QEAgLTczLDkgKzczLDYgQEANCj4gICNpbmNsdWRlICJ4ZV93YWl0X3VzZXJfZmVuY2UuaCINCj4g
ICNpbmNsdWRlICJ4ZV93YS5oIg0KPiANCj4gLSNpbmNsdWRlIDxnZW5lcmF0ZWQveGVfZGV2aWNl
X3dhX29vYi5oPiAtI2luY2x1ZGUNCj4gPGdlbmVyYXRlZC94ZV93YV9vb2IuaD4NCj4gLQ0KPiAg
c3RhdGljIGludCB4ZV9maWxlX29wZW4oc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRy
bV9maWxlICpmaWxlKSAgew0KPiAgCXN0cnVjdCB4ZV9kZXZpY2UgKnhlID0gdG9feGVfZGV2aWNl
KGRldik7DQo+IC0tDQo+IDIuMzQuMQ0KDQo=
