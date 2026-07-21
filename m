Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641B0C44529
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 09:09:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 266BC10E815;
	Tue, 21 Jul 2026 09:09:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gcSjVew5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6EDB10E815;
 Tue, 21 Jul 2026 09:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784624965; x=1816160965;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Bc36h1UDk/tRRxrcoYsTcHHfYPdmkItSNw2Byq3b0Pg=;
 b=gcSjVew5bl9QEp11PSGJdtTDLM1M1TRspM33PPBgQnNNGvOuMnW9EF3n
 Q2m25zWJUFa6sg2ejCnMPocoJPqOmi+3Zmyu5sC9uIugIDFBmeLKQOClr
 L7NXgffk/2AjLelrlJkJ2OLGyBQdoZei2RtkkDKp5I9hzssUwvxOqUy3m
 G84IdFgKwzzdxq0JB640Y/oCePe5MmLCzwqbAV6mcg4EOOSOC++ErBsyt
 WLGO/JcAQ9wVydJk8NlyqxN0G8Pv1MvmFk4XOz1h8fA+q0RQM4ZXAID9W
 Hm8HFohJdO3FbpG+Fy6PMBR7F8tO7rxV0X8roPx4N9B6BCJOmHqTcSXS9 Q==;
X-CSE-ConnectionGUID: Wd8qtkHeT5SLAIHErJtxqg==
X-CSE-MsgGUID: 860681oeQoqzIFfTZ5SMYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="96728443"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="96728443"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 02:09:24 -0700
X-CSE-ConnectionGUID: /LuoWvyqSRSQ8IXO3CK4dg==
X-CSE-MsgGUID: PcZPapq/Tr+0LDyie6L6TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="259686792"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 02:09:24 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 02:09:23 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 02:09:23 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.16) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 02:09:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fr73PWPsPgUvNjYvH9qBJqyay9WjrjGQvgSauuk9GLDgFZA+L4O3aeEKcTWsMech9zFqSZb/FrUnQJ0UdNaeaVT9Jd9SGQxbLVRi4i/vahMaR/brSBC0f7wmtL+3yC4bFLZkBFbF4hH8Q5QXt5D1kYGTij2orbiUtBZSGGvLEYdDgtXn69EH/gYj4GMKHNfFDAr68/bPp6ExG3HwoBX9kBLTV83Cny7Q5oG5I3Y2WenjF0RDZV0ftt1UuOH876GSD0godo/SKqYFa7kKnXDLh2pwesg6KsxyiCaPVEuW3ksiKS7rgmb1fHK9bp5B0V1xBnjbmeLDqhCzPUQJtBNvew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bc36h1UDk/tRRxrcoYsTcHHfYPdmkItSNw2Byq3b0Pg=;
 b=D6hO9fbx+9ek1bYVZhQtNqrk5FrwNoMjOVBnUsO7LeDEBaGJTNQ8T6ejwbPJucXd91BBOCp8IdkVlvV6iEP1PYhyCUe8LV6aM8hbSBY6jou7zhN7UwCovxscWESPrKA27LeUgFxLvspr1NNU1U9T/s6Hkvh65qy+PNeSLOEGsBfiP35t0xX/reqnahYYtC9L+6xIN2arxNZk2Jpr+2FmFpOTSBBtF+MmY4duX2gelLb/0NCpwhl7FAY/7liqdtV3Q0agTS1rnmX67lwCAkTwpYibxiaU6yNGJ0jiiuLnSJEdFQGeRQF1mklNFIdbDfPBi6/sWf5pekV+YQuaUvH1hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 DM4PR11MB6454.namprd11.prod.outlook.com (2603:10b6:8:b8::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.18; Tue, 21 Jul 2026 09:09:20 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 09:09:20 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 2/4] drm/i915/fbc: refactor maximum plane size handling
 for fbc
Thread-Topic: [PATCH 2/4] drm/i915/fbc: refactor maximum plane size handling
 for fbc
Thread-Index: AQHdFXb4kpNe+mB20ES69Lijy2LckbZ3tkuA
Date: Tue, 21 Jul 2026 09:09:20 +0000
Message-ID: <5b25d48e55a7fc1873beac8e71dd783c96c7a90c.camel@intel.com>
References: <20260716225956.555995-1-vinod.govindapillai@intel.com>
 <20260716225956.555995-3-vinod.govindapillai@intel.com>
In-Reply-To: <20260716225956.555995-3-vinod.govindapillai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|DM4PR11MB6454:EE_
x-ms-office365-filtering-correlation-id: b5a1b183-3326-4f5a-9573-08dee707bffe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|10070799003|1800799024|366016|38070700021|56012099006|10067099003|4143699003|11063799006|5023799004|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info: h/2TnudoDDOA9eU4Q0Si50ZEOrpvLPxuKQbFSkZ45RjJm8Io5+9ZMbfx9pTGUJ0UVNO+HsShdHuZDNEmts7ROIBgKkS1dGIN1iShoeAUij/kdgHvi5gnej8VD21Pd68+M+tVu8xp+pPlnRPv2t3iI/NxTEkpP9B4h+bjflC5lKdHKiQh+xNDDFkqRy5KOAt2AWQ+0r8/9mWsiZhaEHXPS2zeH6yZWauFhDOujAVsZ8YVbibY6/0SNFd+WFwJOKxNkcUo40EhLnOUSxKvUSHdGJYMLb0H2YZ4r1FrI/3mfRInW21GEDQXWxglAb1iz1G81fBja/VVJ+u0mUMWyMjsuH2MCJhEijeaAuKBa4Lx3mWsSu7ts7hxC0iXUShLRCWfBVdQaesFJxIlUNrUvINVnQkEtPn0NPMOWSzITafZq7DKkuaF4m+8aQbtC26RDx18UUJ7yFdgYI9DPKQ9bDjeVBJ8RFjWWEMsLIRv7DBrOLnT8iZEAE0MOozsUMU9xf8HfeLG+NnYs2iAuF/job6DU6OFC8mDU4vAe1NiOaDU5E3LTXSlnAqOhx6eQCM9FZPzTIFDGF75LonLVnMw/sSvD7h7gUUvLVL9BS60rMwSUdBhrofAcQYvKUJlJSSKY/j26a7veI5TKzJmXf+E9IpV2f1foJEmZ3pi2ucVlE3yVCLhCUaeuAhLmoosq2pnipb2RjbDgDlZYJGP8fEeIgo4gBSnglu6efTqYthHdvXXhuk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(10070799003)(1800799024)(366016)(38070700021)(56012099006)(10067099003)(4143699003)(11063799006)(5023799004)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N1VxSTdEaDEwZHprTkRZSExqSnF3MFA3TjA5aTFmajJhSnV6Y2U5M3RtbDgv?=
 =?utf-8?B?N2dKSkF3bUhvdDVOTndRK3FNRGtieWpqTlVMYWtMQVlZSE5UWW55VkV0ZU9i?=
 =?utf-8?B?QnhCdzdiaXR1b2dMMVg2MnYzNHJMTnJvWEo4WS8xc25XNit2UTFLdTRIVWhG?=
 =?utf-8?B?R0R1bUVkb1E5TmN6QWZLd09pNEZsakc0YWk5cllPTWRlRUVML3VDMU1QZFhl?=
 =?utf-8?B?QW5LemFxVXpMSnBQSFpwNzUvSHdEcmdObnpiTkZ5U3dmYmVSalQ0ZzBURnlO?=
 =?utf-8?B?ZVgzZnVRTEJPL01ydkxZVklkVHNzRjdJVXZKS3I2NnNLTW9WRkMrUHZoMm5n?=
 =?utf-8?B?blR5a3dXK3VSUE4zSytFUmNRQTVsTVJCejUwRmEzSDJZN01DOFJteFllZHZa?=
 =?utf-8?B?aG9rTkhKWk1QdTNYdDZFUmpsaStuYlZMTjJqaWRKWkptbFE2ZmJPY2VsSEtn?=
 =?utf-8?B?ZHRnWHlCRmF5TWthakxZUENBZHpJZmFUV1FOV09CbmNGYVc2NVhub284RFdZ?=
 =?utf-8?B?MXVsQk04WXV5ejVicnI3ZnNYM1NBa3E5MG41aEp4VkVaUzdIZUFFeXUycm5i?=
 =?utf-8?B?aTg1S3poajZCZmg3R3RuUGFGem5mV3RKZXl5ZFFWenFTcGZoaHhHdDRqVTJy?=
 =?utf-8?B?SEFmZ3ZLaHBBWWNabnZmTks5ZXdmSzQxazRkMDhJN1QyblZoekZBMzB0alkz?=
 =?utf-8?B?aUNFZjA5NEhET0JwdFBad1hKc1BWWlpWeXlQQkNaS2Zpc3EzYUk3NHhtdmhR?=
 =?utf-8?B?Z3B5UDlwYTJuMW0zRm0rS0U4aUhVNm1HelVQMmxLRGpBS2Z5YXRmUzg5U1hn?=
 =?utf-8?B?R3gyNDROVWlkT3VsckRMNERuSXJTVnhrYXpybFhmdUMwdUJ1bTdMQ1pTTHZM?=
 =?utf-8?B?SWtTNlk0YWtsYXB3MjZ3eGFuYjFNTUFhWGhZNDdDQS8vaDhZSldHQzZKdEtQ?=
 =?utf-8?B?YXBmZkpsaU9uQWRsaWp4LzBBVmdZcDNLSGJjeFF5Uk54dWx0UHFxYXljYVdZ?=
 =?utf-8?B?SEVIRWRhTURQV1BuZVVBOUZMMnQvb1pENXZHWG9ORnAyWjUzWW12VHJ4NzF0?=
 =?utf-8?B?bS9tQXA3YW9tY0xyNTB4OHRkTXFGcUZabG1od1B4dWh2OXl5eWI2aFZiSjRj?=
 =?utf-8?B?ditEakFiSS84MDZQUEV5Y0M0dDlENHFtcXZESll5S0REWFliQ0QzMHVCaXM5?=
 =?utf-8?B?SUoxUENLNUtrRjI0VkIvQmN5QUorNW9oMC9hZmpUblZmaHQyRlRPbmhKUVFl?=
 =?utf-8?B?Z3RWNkdYbXJ6QndiUmJteFcrY3lRQTBrL1F5QVNydXhJcERMcHJBOFhDaS9R?=
 =?utf-8?B?TUlNUXRzcFltMjJ5WktQUGxZZWhOMnpCeHVCQldPV1Bkd0FYY1hTZnEzWTBu?=
 =?utf-8?B?cGprQXpxMU5TTk1EZUdtTk91M1VSZTZUSFR4Yll1RW54Sy9aNWFlYkxmYTZL?=
 =?utf-8?B?S1lXV0hjOUpEaGZiNWRsUGJFNXlxUmpHZkRGNHlLaHZZTXVzR3I1QktsaXhG?=
 =?utf-8?B?RTEwdVhRb1kybFh3SDlsdEM4Mm1VdTBhQklrMFlBWGNwZW1aZEoxOUhrZlAr?=
 =?utf-8?B?YU5iR2ZZSVlwV2xOa3ZuMHpQclZzQ2NlK09YSVpzNXBOQzVUczF3VVFIbFMw?=
 =?utf-8?B?L3hTNEw1Q1BsTitFTXRMSTZUS0pzU2hpMXM5YmNnMWVKMU5rN25LTnEzZ2Z0?=
 =?utf-8?B?T2xEWmpNMm9KWXZMZ0RxMFdldGdueGxqNmNqTGRmRnZobElkeU1ITzk4cHJ2?=
 =?utf-8?B?cDNCVXNNTVoxc3lURmlNOUpTUEdmc1VuVmoxVUt6Z2V3eC9uSmRtRXlYdGs4?=
 =?utf-8?B?bEY2eXI1ZjRGNS9CdkVkZENJOE5FUUY5REdQQldTUkZ1dFU2UHdSRUxJSksw?=
 =?utf-8?B?N2lDWWI0dVJMUnYvc2M5V09qN3M2WDUrdDJINzlNSTgzL3B5OE5JQlROL2xR?=
 =?utf-8?B?RFJVV3VqektGOFJneXE2Q1g0eC9qZSt6bzlVbXRJYm5LMkdZZXN1bjR2R0tD?=
 =?utf-8?B?YlpJWFYvK0lyMEtZZEdqNlErSmdlK2lobFVhWWhtZXI3YTZtKzNkdUNLY3BH?=
 =?utf-8?B?cjR1YllwbTJQKzJwQXFocHJ6cW9tYlU1SjVydE13WHpZd0VjMDBUaXlOZllD?=
 =?utf-8?B?d1BpY1VUU3dPUTJQblBERkM4TWJUdXVpMnBseWp2R04raWwyU2ozYmFQRXVn?=
 =?utf-8?B?NXJtZDcyYURoQ2ZxK1oxTW1vRkNqeEpwSHVua24wMWZEWFVvaHFPL1hNSzJw?=
 =?utf-8?B?dnBqODY0WDgweWdnWlhTSHNBY3BqT3g5V0NVYlE1ZGl2aERtSXpnNEV3RmdR?=
 =?utf-8?B?a3VZWmpFNnJTRmJjV2NvOG9kZEt0OXk2YU9Vam1KcHA5dGg2ZlA2aXpQVkNi?=
 =?utf-8?Q?cKzaX4PGzj33/nNepVxbokKDXLzOgU3GGdq7xKASdcWcU?=
x-ms-exchange-antispam-messagedata-1: a9iRRg7OJUSNNenenujQBmv4bH9IGnbFXV4=
Content-Type: text/plain; charset="utf-8"
Content-ID: <30CD9DFEFB20DC43A86BAF5154967C24@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: nV//cer785b/vGJU3x4aPb0YGBzTW5pAjS/TFSxr/PaCDB2o0FUcHvwhPucx/J8DCD/kgXzUhGLfIhrRxneXhGunGf4dDxG42wrwHeXpijfD88Jb4jX7X8XK6UfWs5k4N9sHbPgTOnCc1bU8UJkeLszljI0M2bzTHuUjlhsatg6wVZK1mDHFUK+rglNwqSfpu95o43bONPDsEXLE2oEDUQdmeWa/m7koNE2u5yDSkYgk3elF3tAz/C5PzSfn6jcWj7L634BJRjUUq+YnWMAsCD1/PYuDWF3gPaGrPKczfkdXpSJL32mhZNbLmQqErjpFhOBRKKvgOjpmVcZ1SVmVFQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a1b183-3326-4f5a-9573-08dee707bffe
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2026 09:09:20.4974 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LQ6mwNzQ8UNzHuRr8pR+UAfTK53TwvftqumzkxvEyId0oF3K6coQoyJqHhH167x7B4HaCY3WB8THPVqwUiZs2xL0HFT40ypIkxxs+MFI6Q4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6454
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

T24gRnJpLCAyMDI2LTA3LTE3IGF0IDAxOjU5ICswMzAwLCBWaW5vZCBHb3ZpbmRhcGlsbGFpIHdy
b3RlOg0KPiBSZXN0cmljdGlvbnMgdG8gZW5hYmxlIEZCQyBiYXNlZCBvbiBmaXhlZCBwbGFuZSB3
aWR0aCBhbmQgaGVpZ2h0DQo+IGhhdmUgYmVlbiBpbXByb3ZpbmcgaW4gbmV3ZXIgcGxhdGZvcm1z
IGFuZCBldmVudHVhbHkgbWF5IGFsbG93DQo+IHRoZSBtYXhpbXVtIHBsYW5lIHNpemUgYXMgcGVy
IHRoZSBwbGF0Zm9ybSByZXNvbHV0aW9uIHN1cHBvcnQuDQo+IFVwZGF0ZSB0aGUgZnVuY3Rpb24g
d2hpY2ggY2hlY2tzIHN1Y2ggYSBzaXplIHJlc3RyaWN0aW9uIHRvIGhhdmUNCj4gdGhlIHBvc3Np
YmlsaXR5IHRvIGdldCB0aGUgbWF4aW11bSBwbGFuZSB3aWR0aCBhbmQgaGVpZ2h0DQo+IGNvbXBh
cmVkIHJhdGhlciB0aGFuIHRoZSBoYXJkIGNvZGVkIHZhbHVlcy4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IFZpbm9kIEdvdmluZGFwaWxsYWkgPHZpbm9kLmdvdmluZGFwaWxsYWlAaW50ZWwuY29tPg0K
DQpJIGRvbid0IHNlZSBhbnkgYmVuZWZpdCBoYXZpbmcgdGhpcyBhcyBhIHNlcGFyYXRlIHBhdGNo
LiBZb3UgY291bGQganVzdA0KZmluZSBzcXVhc2ggdGhpcyBpbnRvIHBhdGNoIDMvNC4NCg0KQlIs
DQpKb3VuaSBIw7ZnYW5kZXINCg0KPiAtLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2ZiYy5jIHwgNyArKysrLS0tDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiYy5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9mYmMuYw0KPiBpbmRleCBhN2QwMmRkNmNhOTYuLjc4MjI4YTVlNzY1ZiAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mYmMuYw0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiYy5jDQo+IEBAIC0xMzE1
LDkgKzEzMTUsMTEgQEAgc3RhdGljIGJvb2wgaW50ZWxfZmJjX3N1cmZhY2Vfc2l6ZV9vayhjb25z
dA0KPiBzdHJ1Y3QgaW50ZWxfcGxhbmVfc3RhdGUgKnBsYW5lX3N0YXQNCj4gwqAJcmV0dXJuIGVm
ZmVjdGl2ZV93IDw9IG1heF93ICYmIGVmZmVjdGl2ZV9oIDw9IG1heF9oOw0KPiDCoH0NCj4gwqAN
Cj4gLXN0YXRpYyB2b2lkIGludGVsX2ZiY19tYXhfcGxhbmVfc2l6ZShzdHJ1Y3QgaW50ZWxfZGlz
cGxheSAqZGlzcGxheSwNCj4gK3N0YXRpYyB2b2lkIGludGVsX2ZiY19tYXhfcGxhbmVfc2l6ZShj
b25zdCBzdHJ1Y3QgaW50ZWxfcGxhbmVfc3RhdGUNCj4gKnBsYW5lX3N0YXRlLA0KPiDCoAkJCQnC
oMKgwqDCoCB1bnNpZ25lZCBpbnQgKncsIHVuc2lnbmVkIGludA0KPiAqaCkNCj4gwqB7DQo+ICsJ
c3RydWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkgPQ0KPiB0b19pbnRlbF9kaXNwbGF5KHBsYW5l
X3N0YXRlKTsNCj4gKw0KPiDCoAlpZiAoRElTUExBWV9WRVIoZGlzcGxheSkgPj0gMTApIHsNCj4g
wqAJCSp3ID0gNTEyMDsNCj4gwqAJCSpoID0gNDA5NjsNCj4gQEAgLTEzMzUsMTAgKzEzMzcsOSBA
QCBzdGF0aWMgdm9pZCBpbnRlbF9mYmNfbWF4X3BsYW5lX3NpemUoc3RydWN0DQo+IGludGVsX2Rp
c3BsYXkgKmRpc3BsYXksDQo+IMKgDQo+IMKgc3RhdGljIGJvb2wgaW50ZWxfZmJjX3BsYW5lX3Np
emVfdmFsaWQoY29uc3Qgc3RydWN0DQo+IGludGVsX3BsYW5lX3N0YXRlICpwbGFuZV9zdGF0ZSkN
Cj4gwqB7DQo+IC0Jc3RydWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkgPQ0KPiB0b19pbnRlbF9k
aXNwbGF5KHBsYW5lX3N0YXRlKTsNCj4gwqAJdW5zaWduZWQgaW50IHcsIGgsIG1heF93LCBtYXhf
aDsNCj4gwqANCj4gLQlpbnRlbF9mYmNfbWF4X3BsYW5lX3NpemUoZGlzcGxheSwgJm1heF93LCAm
bWF4X2gpOw0KPiArCWludGVsX2ZiY19tYXhfcGxhbmVfc2l6ZShwbGFuZV9zdGF0ZSwgJm1heF93
LCAmbWF4X2gpOw0KPiDCoA0KPiDCoAl3ID0gZHJtX3JlY3Rfd2lkdGgoJnBsYW5lX3N0YXRlLT51
YXBpLnNyYykgPj4gMTY7DQo+IMKgCWggPSBkcm1fcmVjdF9oZWlnaHQoJnBsYW5lX3N0YXRlLT51
YXBpLnNyYykgPj4gMTY7DQoNCg==
