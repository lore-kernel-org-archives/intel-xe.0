Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD347E6F092
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 22:22:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F06910E058;
	Fri,  1 Nov 2024 22:22:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kweVs9vO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10FF10E058
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Nov 2024 22:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730499724; x=1762035724;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=80PZlxzw5sboGAOCu2nvy/x1LS1p6w4RtnMkNQ5v3V4=;
 b=kweVs9vOkQ7R9MPWRs2FngcizDNmN51OnT+ANptzdINvC1dmh4/qEKsV
 3MIOktvvZihKl3JE4zpCEH57z/GAB01aSq8+BSk779DsdjObn+fUqNDOW
 WY8VdLNvRJfw9LJpg5OMapEXNtVfEvizejMiB5Y4dhGqJ4w1BP/RlNef/
 uCBf+9JG7pelpVcGMsgC4IqlyQ4+mWZZ4vLnKiu1k8t+tPW04mdbq8jgH
 XJPW5LG4ziumq0NTj46p0Gs3t02/LyrPLqTX/8hbBAlYGPiFZ1yrV3qEp
 dwhWb08QjXvKubB5n6Hbwch5OQC7oFpSj4o5MjEvemlc0AbhBa0hzfof+ g==;
X-CSE-ConnectionGUID: dEjrQxLHTf2dXb/VFIK36g==
X-CSE-MsgGUID: wtiswzypSSik8NnJU0RWEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="55671248"
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; d="scan'208";a="55671248"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 15:22:04 -0700
X-CSE-ConnectionGUID: 2g//3kp8SPSaWFzR1Ce+yw==
X-CSE-MsgGUID: 26SML3ZETxu1bYM7vynVFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; d="scan'208";a="83209784"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Nov 2024 15:22:03 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 1 Nov 2024 15:22:03 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 1 Nov 2024 15:22:03 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 1 Nov 2024 15:22:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jCKW0Qx/l5rL02AJkHrxR0AHFSp335vg/jP8PSu4Np80Drq8tJkPUfZZh8ChXgdo+3uYuhybEmQfvNXNDb8TgL4z9OF3FMuioMqS7rZRN2iwKo/76s0BXVuJGRpbnsjojPJ06KVEM9MlWlxmfOWjzozWClsmz3GM90nNFtp+dXWTp79B8qNH4Hb74G2Z+L/ETLJHoW7Ct5zOxu9Kc56V/Jw28zr/d68tN+XO8tK88JRcGIgCqtor0XdlSvws1QtEbcyLeihBcV9zFDn/MUK7qb2aD/3I7F38rXvNW5qV4XvTQPPzMoPw9U4EIyUnjKdE3YJG+8cXrUKjkms+y6S08w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80PZlxzw5sboGAOCu2nvy/x1LS1p6w4RtnMkNQ5v3V4=;
 b=T7js2Czcfpn2xG7axKnsnREdSUSlRmmdDEP7ZaeVkWrCaRe1AFgYvOpitml8BzIVht5oMYsv3EEz9ajrYOpj9DKAhQTiW9dCcfg3jq0xx5/qTB+Yof4uQ41LC0kmaquOmHjYWNkc8IRX5TTMAhQeqepIXtroYu10baSv0FGfX9i1PkM6LidrmTJZ6/NfE7tzwCTOlqeVcrlrp6ekvHRp/J2vUP9DttV4jzHzHG1HnZ3fuLJDgHLr1RZQh5syYZdmBuFFnINAbVaxBVNO6A8LZraBO1OWE+EROBcyK13oyyyjnqEpmOGCsyTxFsoqaerZ8I0bNpDe2T81FyoXK+utkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA0PR11MB4688.namprd11.prod.outlook.com (2603:10b6:806:72::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Fri, 1 Nov
 2024 22:22:01 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8114.023; Fri, 1 Nov 2024
 22:22:01 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Subject: RE: [PATCH] drm/xe/xe_guc_ads: Add whitelist registers to write list
Thread-Topic: [PATCH] drm/xe/xe_guc_ads: Add whitelist registers to write list
Thread-Index: AQHbLIh6UcCqcibekk20ZmZZBCafgLKiw3iAgAAKRuCAAA5RgIAAAueggAAYqwCAAABB8IAABhQAgAABVcA=
Date: Fri, 1 Nov 2024 22:22:00 +0000
Message-ID: <CH0PR11MB54441991A429C98C9D2F543FE5562@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241101180403.97272-1-jonathan.cavitt@intel.com>
 <6a317425-bf13-4269-b510-04a765c3cc23@intel.com>
 <CH0PR11MB5444581AA95D474000743B9CE5562@CH0PR11MB5444.namprd11.prod.outlook.com>
 <80cb07e4-8049-4320-814f-7535b20e1145@intel.com>
 <CH0PR11MB5444240B935D3ABF926E2156E5562@CH0PR11MB5444.namprd11.prod.outlook.com>
 <b32a1ea8-3a2a-4ba8-a195-4babca8e5c8c@intel.com>
 <CH0PR11MB544446DF9387BC1B7AE57002E5562@CH0PR11MB5444.namprd11.prod.outlook.com>
 <3faf9d20-0cea-4294-a9c4-97a5f104d90c@intel.com>
In-Reply-To: <3faf9d20-0cea-4294-a9c4-97a5f104d90c@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA0PR11MB4688:EE_
x-ms-office365-filtering-correlation-id: 18a0d3f3-1b92-4b88-d727-08dcfac39b35
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VThYek5WU3hhR2VEdmJnZkZBMEpFSnZReGNIc3B6SzVRdWpnNXBMbHAwQk4x?=
 =?utf-8?B?eE1YUVp0TkJ2WHNoRVYxaEcwNnZVOEpBM1FiRHc4a3Jva2ovaVl6TXk2Zklv?=
 =?utf-8?B?RGREZ3Y1dEdFK0Z0eGtXcTdWSHFXalNyYXNZYWVZOHhWSWo3d2gzTUF6RFph?=
 =?utf-8?B?SkhQYXVGNW5VV0ZGNld3TEN4aTR3RGhRdVM1Wk5pcFJoRWR6TnNMalFqU0po?=
 =?utf-8?B?MGE5c3hBUnhuTXlIeHdlSDUzZ2VBeHVOcTZXbDNMTGJ2SFlwT2tGTGl3Uk1u?=
 =?utf-8?B?QzZudllLYlE1VERwdGNpeVVCR3ZIMXlJYVdJaW5BbkNtSVhJazZXU0tEMFVo?=
 =?utf-8?B?bHJlVHRKZlQ3U2FyWXZrTjRkZkovT0tNMkIrbDJ6eUhZbVJueFdlTjFEUWRa?=
 =?utf-8?B?SDRqcDZMU0lnVUR0aHhvelJUQ2tlTGtqNEIvV1JhWDZKektwSXB6WnFEN2JO?=
 =?utf-8?B?WC9jdmVxM1cyNzlhT0E2TmFrMllIM2VxemRjY290R0U5OWthYmYvMFhZcUlR?=
 =?utf-8?B?UmZNSi81T3JJWTludUorN3l3RTlvd2djWHNVK1BZNFc4UncrRjBtcFV0RTJn?=
 =?utf-8?B?Wnc2Mzc2YVE0REdpYTA2Sm9WMzV2cXg5anRvRldhb2VMMkRRdXBJSG1jbVp0?=
 =?utf-8?B?UklPSUEwNGd3cU9GR0x0eGdGb2lXdFJsczUxVTJDOXlDSGNoNDNYMWVaZHZR?=
 =?utf-8?B?R2RYeU1Xc1pvaUJ4b0dWaTdwR0RvQk1Tc0hSK0FmSWNWZ1phdU1SYzU3Sno3?=
 =?utf-8?B?cEg0MFZTUjZJNzNrMWxJajZKdk9PbzRVWlQwUTFreURwMFRoUXlDOC92Q0Jy?=
 =?utf-8?B?WXJ5bVlmZ3o5eC96NWErOTdQVXdZU2o5R2s4RnhpVmZPd0lueDFZS2piOVNp?=
 =?utf-8?B?NWphRStDd25CUXQxc0pzcWp6SEpYSHlVTWRIbFdiOTJSSUhSSS93eXQ2c3Nu?=
 =?utf-8?B?RjRMRDVLMWQ3OUFuNW1laFdJbUJaeVlHMExNN2JZc2M5d1o2aGcrbWdCMW5q?=
 =?utf-8?B?TkF0bUs4aldkd1J2YUs5YlBNR2ZMTXRjMGNFTTlJQWdEODJvVjgzWFZvVDBQ?=
 =?utf-8?B?MVZLbC9BNGNhTHZ0N1NIN2tpc0g5eC8rcmdsODYwbzgrWjhhODNFQUJxMkw4?=
 =?utf-8?B?aUlhdzFYK25VcjJjOS85OEk1YmZUTFlad21jZXpIMWZwNGZJRUZTTmJ3dmJY?=
 =?utf-8?B?NjhPTVJpSkxZcnYzMkZHUisvdHRncHZPcGRaNjR0R0lvUW5qRHE0YjA0YlFt?=
 =?utf-8?B?MExsRVJKYlZlN3FocTY0cUhSTXRQSlBHdjVyanZ6U0FYb2kyYTh6Z0hjeC82?=
 =?utf-8?B?RmN0SVpRS0ZBVDFGMmpoRmdBZkVHYTZlRWxqdjBjc21pK3VaZWJobEZtV2tC?=
 =?utf-8?B?NERPYnpadE9YVWFHWDM1UEUydzRVMlp3ODJURERGNnVRSjdLamhQc0pCZzB4?=
 =?utf-8?B?V0w5YmFWOTRnZUsrOEtZa2dWRm15NXd5enZuNm13b3ppbWlNT2JoSVpKNVZP?=
 =?utf-8?B?VXJtSW4vUjZaVEFKcmg3bHlEWGwyMzFKVWJoa1BMWG1Tak5OSmJoMkJGRDZy?=
 =?utf-8?B?dmN3ZDFQU3V3MUJ1RG1LTklmNExtYXdNNkYwMFErclN4T29YcXFFN284M05t?=
 =?utf-8?B?cnRiTElzY0JtblhsZVI3cGNuK2J6YjM3Y1Z1ZEpEUTBReUFrd0FueURVQzJL?=
 =?utf-8?B?S0FWcDc3TFBTQWxsZzlSeTFVbkZtUXUxNVYvd3Q4ZWVEWUlYdnFGOVlzNmtS?=
 =?utf-8?Q?xU+L38JLhEhIG5YzjigCk46L8UgESIavOFc8UO4?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YUpCMFVkaTNGc3hWOE40dk1oSmM1MUw5ejZDQ2tyZDhDSXh5Lzh0ZERneVI3?=
 =?utf-8?B?aW10MkVLbmRjaVEwRm9LRmhBdjlLRzYrK0llakxjbzhYNThJVEg1YWJsTWx6?=
 =?utf-8?B?S2JTOHdseVhZeWI5SjZKSnBHbEhjaU1adjVvUFAyZ1FJZ1YxNVhRd1Y4MEp3?=
 =?utf-8?B?bklLSmZkdkdlbStFdll0cU1rWm83aHNWcW05ZHlEZ3EyeXBlNW9TSmF5bjBG?=
 =?utf-8?B?TjJDRDFDME1zd3kwQUUxQk9IL2psNlhabkd2VDNSQkFLdTdHd3hYWDA4Zndy?=
 =?utf-8?B?ckYxdkVBbzB3N0RtQkQ0WFpFVmVDaTRsWCtpTlR5SnlpbUFxQ0pvUWkyc3pE?=
 =?utf-8?B?L21FK3NZRksvNko2Ymh2dWVwYUpsVzNDb05GU0IwRk5FL05MUkx0RjRFRnhC?=
 =?utf-8?B?OFJKcWtyc0tXR3Nva2x4cVVsREllTzBFTitxR1RBUi92djNrTmd6Z1pqNHR0?=
 =?utf-8?B?S3NTUnhxQWFuVGRhcG5wUHlXOXAzbmdBL05tUkFzQ0ZlREluTkhNTjZ0OXh5?=
 =?utf-8?B?a0VQUGZvWkpMalhyNmZVK3VYSklaVzhsSGdZYUVYYUtoRzVSTGhRWHluaDZa?=
 =?utf-8?B?ZnRvejlVVE1tYnlWeE93MDZ1QWRBRXpGSXg2RlVEdTBFWHZocGlTSFhzTGNk?=
 =?utf-8?B?THVqYjBsdTV5RWVCOWRZTDNmdklqMDQ0Qi9VVlp4YlM2VkdXUVJpY3RFNWNr?=
 =?utf-8?B?NjdiN0ZTZjV6NExtOTNiYnJTdnpyeDhBOURBZ2xnSmZaQjZEaEU3QVpSV2RW?=
 =?utf-8?B?U0kxUnNqaCtFYmF6cWc5S29Bc2gwSVNUMDNOL1VBNXZqZE0rNjhzL0E5T2xG?=
 =?utf-8?B?RG1yMUdVYjdlNENJeG5RTUU0VU5LTGJmVnRGOGcxQnl6Q3BrblcveW1kTm9S?=
 =?utf-8?B?NTJRbllqdGhTZlBoMXFEOWQreml1Rk5XZGdheFh4MVhnUlY3TGFvVTZ2OW5v?=
 =?utf-8?B?Um51MzF3MkRyMHdFdEdHZjZYWVIxMEZBU2VMa0ZuTzhIOE1sc0JZYlEzbGdm?=
 =?utf-8?B?SHYvU21aU3UxbUJsMmYrbkFCRDVyK1g0VEtzQkMybU1TQ2RJYSs0VnZUNGFH?=
 =?utf-8?B?WjlmYkppenF3cTNHSndDRjVGWXNOSUI5Y3VUVlF2aHJINDFaMnhiME0zSHpV?=
 =?utf-8?B?S3NpcG9teXlxRFNWKy9pR0QxbHlVdVZGS2JIWTd4MG9EOFV0WjlhbXVUTWhN?=
 =?utf-8?B?Rm1uQkZZbWRKWjlwaWFvdGJKT3hxbzR2WFdDR05EWXBVdjVCWGVUdyt3OHU5?=
 =?utf-8?B?YjNlSWhxUW9TOC9Zdi9ld09DaUxMdFFkMXRYOTd4N0dFYkYrQ3l6cFNHa1Rt?=
 =?utf-8?B?SGVEN1pIOFlPNVIyOW9hZWJmRUJrS2hPYzBqTThZeTdFalpiYm1IU2VMaGpO?=
 =?utf-8?B?UGZEbXJnd3VCanZLR0M0M1paWDRweWxqQ0xlbjN2bm9xalVzYWZHd0RTUG1o?=
 =?utf-8?B?dzQ3dnJKM3JFaVhzM1U0OHRvSFFYQUhUSmI4bFNkZ1o2SjBnZ0xISUw0NFJF?=
 =?utf-8?B?bXBVZGc1MjJqeGxiMEZXbk1yQVpDT3h0NFZ4T2ZDUlFacDBvWXczTUozMzho?=
 =?utf-8?B?eDFyYnZSUlNWQWxlRWtPMU5Ra2IrTHpNTlQyY3U3SEVMTUd1REVkTzJyTitI?=
 =?utf-8?B?QWo1UHJpRHJKMG9pamM4NU8zaXRxbEpyeFV2R1E5b2RHd3lueU8yVzFwSFFy?=
 =?utf-8?B?cWVic0M1WC9GcStQN0tiYm1tOStNQWJDL0tKaFFoMDlDeWhlcFRjbzZrd3lk?=
 =?utf-8?B?ZG5lMkJ3Z2Y4c3hnc1ZlRGJyTTBpQzFYcWtRVnhxaHdqa0lIYlZqb1VLTy9L?=
 =?utf-8?B?V0pTelovRXNkdUxXY2JKcEp2Q1NteEV5SFRtYklGcDhmclFqV1NBdGZiTmJQ?=
 =?utf-8?B?cWE1bE05ejNLRHNGUkpPdHI3YlFrZkovWjVmeHdmK2NsQ3hFcXBLUXEveVlT?=
 =?utf-8?B?T3pEY0pmQWdmQ2lFeFpPckUxd2hXMnNsVXVWQ1M0bFU0Q0NDaWxEY3U5ZUpx?=
 =?utf-8?B?N2RrRmhuQUFwOVd6ZWVVbHpoZjV6ZXlNRnNjbU55WWNqWTFsMDBnZUFESTJQ?=
 =?utf-8?B?RmdVZG5iK3liamNSSFpWRExiY3IwY1NtaGhtbXg0VEo3L3Z1cnoveElxSFVH?=
 =?utf-8?Q?0CK7bsitkGu3IDpJ7ug32qkVL?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18a0d3f3-1b92-4b88-d727-08dcfac39b35
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2024 22:22:00.8764 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xjHjBRrGfebHGvA6iAUsUWdkBUuaZOGKuoD/OMJov+FFnZ/yzpcP5Fob6vZMZJsOXEGgeGZ4oPwOKVpIENkMMMUFe52JjPPNUGLLToEbZHc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4688
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEhhcnJpc29uLCBKb2huIEMgPGpvaG4u
Yy5oYXJyaXNvbkBpbnRlbC5jb20+IA0KU2VudDogRnJpZGF5LCBOb3ZlbWJlciAxLCAyMDI0IDM6
MTUgUE0NClRvOiBDYXZpdHQsIEpvbmF0aGFuIDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPjsg
aW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogR3VwdGEsIHNhdXJhYmhnIDxzYXVy
YWJoZy5ndXB0YUBpbnRlbC5jb20+OyBadW8sIEFsZXggPGFsZXguenVvQGludGVsLmNvbT47IE5l
cmxpZ2UgUmFtYXBwYSwgVW1lc2ggPHVtZXNoLm5lcmxpZ2UucmFtYXBwYUBpbnRlbC5jb20+OyBS
b3BlciwgTWF0dGhldyBEIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPjsgRGUgTWFyY2hpLCBM
dWNhcyA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPjsgRGl4aXQsIEFzaHV0b3NoIDxhc2h1dG9z
aC5kaXhpdEBpbnRlbC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0veGUveGVfZ3VjX2Fk
czogQWRkIHdoaXRlbGlzdCByZWdpc3RlcnMgdG8gd3JpdGUgbGlzdA0KPiANCj4gT24gMTEvMS8y
MDI0IDE1OjAwLCBDYXZpdHQsIEpvbmF0aGFuIHdyb3RlOg0KPiA+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+ID4gRnJvbTogSGFycmlzb24sIEpvaG4gQyA8am9obi5jLmhhcnJpc29uQGlu
dGVsLmNvbT4NCj4gPiBTZW50OiBGcmlkYXksIE5vdmVtYmVyIDEsIDIwMjQgMjo1MyBQTQ0KPiA+
IFRvOiBDYXZpdHQsIEpvbmF0aGFuIDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPjsgaW50ZWwt
eGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gQ2M6IEd1cHRhLCBzYXVyYWJoZyA8c2F1cmFi
aGcuZ3VwdGFAaW50ZWwuY29tPjsgWnVvLCBBbGV4IDxhbGV4Lnp1b0BpbnRlbC5jb20+OyBOZXJs
aWdlIFJhbWFwcGEsIFVtZXNoIDx1bWVzaC5uZXJsaWdlLnJhbWFwcGFAaW50ZWwuY29tPjsgUm9w
ZXIsIE1hdHRoZXcgRCA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT47IERlIE1hcmNoaSwgTHVj
YXMgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT47IERpeGl0LCBBc2h1dG9zaCA8YXNodXRvc2gu
ZGl4aXRAaW50ZWwuY29tPg0KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS94ZS94ZV9ndWNf
YWRzOiBBZGQgd2hpdGVsaXN0IHJlZ2lzdGVycyB0byB3cml0ZSBsaXN0DQo+ID4+IE9uIDExLzEv
MjAyNCAxMzo0NywgQ2F2aXR0LCBKb25hdGhhbiB3cm90ZToNCj4gPj4+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+ID4+PiBGcm9tOiBIYXJyaXNvbiwgSm9obiBDIDxqb2huLmMuaGFycmlz
b25AaW50ZWwuY29tPg0KPiA+Pj4gU2VudDogRnJpZGF5LCBOb3ZlbWJlciAxLCAyMDI0IDE6MTQg
UE0NCj4gPj4+IFRvOiBDYXZpdHQsIEpvbmF0aGFuIDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29t
PjsgaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4+PiBDYzogR3VwdGEsIHNhdXJh
YmhnIDxzYXVyYWJoZy5ndXB0YUBpbnRlbC5jb20+OyBadW8sIEFsZXggPGFsZXguenVvQGludGVs
LmNvbT47IE5lcmxpZ2UgUmFtYXBwYSwgVW1lc2ggPHVtZXNoLm5lcmxpZ2UucmFtYXBwYUBpbnRl
bC5jb20+OyBSb3BlciwgTWF0dGhldyBEIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPjsgRGUg
TWFyY2hpLCBMdWNhcyA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPjsgRGl4aXQsIEFzaHV0b3No
IDxhc2h1dG9zaC5kaXhpdEBpbnRlbC5jb20+DQo+ID4+PiBTdWJqZWN0OiBSZTogW1BBVENIXSBk
cm0veGUveGVfZ3VjX2FkczogQWRkIHdoaXRlbGlzdCByZWdpc3RlcnMgdG8gd3JpdGUgbGlzdA0K
PiA+Pj4+IE9uIDExLzEvMjAyNCAxMjo0MCwgQ2F2aXR0LCBKb25hdGhhbiB3cm90ZToNCj4gPj4+
Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4+Pj4gRnJvbTogSGFycmlzb24sIEpv
aG4gQyA8am9obi5jLmhhcnJpc29uQGludGVsLmNvbT4NCj4gPj4+Pj4gU2VudDogRnJpZGF5LCBO
b3ZlbWJlciAxLCAyMDI0IDExOjQ2IEFNDQo+ID4+Pj4+IFRvOiBDYXZpdHQsIEpvbmF0aGFuIDxq
b25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPjsgaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQo+ID4+Pj4+IENjOiBHdXB0YSwgc2F1cmFiaGcgPHNhdXJhYmhnLmd1cHRhQGludGVsLmNvbT47
IFp1bywgQWxleCA8YWxleC56dW9AaW50ZWwuY29tPjsgTmVybGlnZSBSYW1hcHBhLCBVbWVzaCA8
dW1lc2gubmVybGlnZS5yYW1hcHBhQGludGVsLmNvbT47IFJvcGVyLCBNYXR0aGV3IEQgPG1hdHRo
ZXcuZC5yb3BlckBpbnRlbC5jb20+OyBEZSBNYXJjaGksIEx1Y2FzIDxsdWNhcy5kZW1hcmNoaUBp
bnRlbC5jb20+OyBEaXhpdCwgQXNodXRvc2ggPGFzaHV0b3NoLmRpeGl0QGludGVsLmNvbT4NCj4g
Pj4+Pj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL3hlL3hlX2d1Y19hZHM6IEFkZCB3aGl0ZWxp
c3QgcmVnaXN0ZXJzIHRvIHdyaXRlIGxpc3QNCj4gPj4+Pj4+IE9uIDExLzEvMjAyNCAxMTowNCwg
Sm9uYXRoYW4gQ2F2aXR0IHdyb3RlOg0KPiA+Pj4+Pj4+IFdoZW4gcGVyZm9ybWluZyBhIGd1Y19t
bWlvX3JlZ3NldF93cml0ZSwgd2UgYWRkIGFsbCB0aGUgcmVnaXN0ZXJzIGluIHRoZQ0KPiA+Pj4+
Pj4+IHJlZ19zciBsaXN0IHRvIHRoZSBzYXZlL3Jlc3RvcmUgbGlzdCwgYnV0IGRvIG5vdCBkbyB0
aGUgc2FtZSBmb3IgdGhlDQo+ID4+Pj4+Pj4gd2hpdGVsaXN0IHJlZ2lzdGVycy4gIEFkZCB0aGVt
IGluLg0KPiA+Pj4+Pj4+DQo+ID4+Pj4+Pj4gQ2xvc2VzOiBodHRwczovL2dpdGxhYi5mcmVlZGVz
a3RvcC5vcmcvZHJtL3hlL2tlcm5lbC9pc3N1ZXMvMjI0OQ0KPiA+Pj4+Pj4+IFNpZ25lZC1vZmYt
Ynk6IEpvbmF0aGFuIENhdml0dCA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT4NCj4gPj4+Pj4+
PiBDQzogTHVjYXMgZGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+ID4+Pj4+
Pj4gQ0M6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+ID4+Pj4+Pj4g
Q0M6IEpvaG4gSGFycmlzb24gPGpvaG4uYy5oYXJyaXNvbkBpbnRlbC5jb20+DQo+ID4+Pj4+Pj4g
Q0M6IFVtZXNoIE5lcmxpZ2UgUmFtYXBwYSA8dW1lc2gubmVybGlnZS5yYW1hcHBhQGludGVsLmNv
bT4NCj4gPj4+Pj4+PiBDQzogQXNodXRvc2ggRGl4aXQgPGFzaHV0b3NoLmRpeGl0QGludGVsLmNv
bT4NCj4gPj4+Pj4+PiAtLS0NCj4gPj4+Pj4+PiAgICAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dWNfYWRzLmMgfCAxMSArKysrKysrKysrLQ0KPiA+Pj4+Pj4+ICAgICAgMSBmaWxlIGNoYW5nZWQs
IDEwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPj4+Pj4+Pg0KPiA+Pj4+Pj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2Fkcy5jIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2d1Y19hZHMuYw0KPiA+Pj4+Pj4+IGluZGV4IDk0MzE0NmU1YjQ2MC4uMmZjNmIx
Y2NjOGZjIDEwMDY0NA0KPiA+Pj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNf
YWRzLmMNCj4gPj4+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2Fkcy5jDQo+
ID4+Pj4+Pj4gQEAgLTIzOSw5ICsyMzksMTIgQEAgc3RhdGljIHNpemVfdCBjYWxjdWxhdGVfcmVn
c2V0X3NpemUoc3RydWN0IHhlX2d0ICpndCkNCj4gPj4+Pj4+PiAgICAgIAllbnVtIHhlX2h3X2Vu
Z2luZV9pZCBpZDsNCj4gPj4+Pj4+PiAgICAgIAl1bnNpZ25lZCBpbnQgY291bnQgPSAwOw0KPiA+
Pj4+Pj4+ICAgICAgDQo+ID4+Pj4+Pj4gLQlmb3JfZWFjaF9od19lbmdpbmUoaHdlLCBndCwgaWQp
DQo+ID4+Pj4+Pj4gKwlmb3JfZWFjaF9od19lbmdpbmUoaHdlLCBndCwgaWQpIHsNCj4gPj4+Pj4+
PiAgICAgIAkJeGFfZm9yX2VhY2goJmh3ZS0+cmVnX3NyLnhhLCBzcl9pZHgsIHNyX2VudHJ5KQ0K
PiA+Pj4+Pj4+ICAgICAgCQkJY291bnQrKzsNCj4gPj4+Pj4+PiArCQl4YV9mb3JfZWFjaCgmaHdl
LT5yZWdfd2hpdGVsaXN0LnhhLCBzcl9pZHgsIHNyX2VudHJ5KQ0KPiA+Pj4+Pj4+ICsJCQljb3Vu
dCsrOw0KPiA+Pj4+Pj4+ICsJfQ0KPiA+Pj4+Pj4+ICAgICAgDQo+ID4+Pj4+Pj4gICAgICAJY291
bnQgKz0gQURTX1JFR1NFVF9FWFRSQV9NQVggKiBYRV9OVU1fSFdfRU5HSU5FUzsNCj4gPj4+Pj4+
PiAgICAgIA0KPiA+Pj4+Pj4+IEBAIC03MjcsNiArNzMwLDEyIEBAIHN0YXRpYyB1bnNpZ25lZCBp
bnQgZ3VjX21taW9fcmVnc2V0X3dyaXRlKHN0cnVjdCB4ZV9ndWNfYWRzICphZHMsDQo+ID4+Pj4+
Pj4gICAgICAJeGFfZm9yX2VhY2goJmh3ZS0+cmVnX3NyLnhhLCBpZHgsIGVudHJ5KQ0KPiA+Pj4+
Pj4+ICAgICAgCQlndWNfbW1pb19yZWdzZXRfd3JpdGVfb25lKGFkcywgcmVnc2V0X21hcCwgZW50
cnktPnJlZywgY291bnQrKyk7DQo+ID4+Pj4+Pj4gICAgICANCj4gPj4+Pj4+PiArCWkgPSAwOw0K
PiA+Pj4+Pj4+ICsJeGFfZm9yX2VhY2goJmh3ZS0+cmVnX3doaXRlbGlzdC54YSwgaWR4LCBlbnRy
eSkNCj4gPj4+Pj4+PiArCQlndWNfbW1pb19yZWdzZXRfd3JpdGVfb25lKGFkcywgcmVnc2V0X21h
cCwNCj4gPj4+Pj4+PiArCQkJCQkgIFJJTkdfRk9SQ0VfVE9fTk9OUFJJVihod2UtPm1taW9fYmFz
ZSwgaSsrKSwNCj4gPj4+Pj4+PiArCQkJCQkgIGNvdW50KyspOw0KPiA+Pj4+Pj4+ICsNCj4gPj4+
Pj4+IFRoZSBjb2RlIHRoYXQgYWN0dWFsbHkgd3JpdGVzIHRvIHRoZSBOT05QUklWIHJlZ2lzdGVy
cw0KPiA+Pj4+Pj4gKHhlX3JlZ19zcl9hcHBseV93aGl0ZWxpc3QoKSBpbiB4ZV9yZWdfc3JjLmMp
IGV4cGxpY2l0bHkgY2xlYXJzIGFsbCB0aGUNCj4gPj4+Pj4+IHVudXNlZCByZWdpc3RlcnMgd2l0
aCBhIGNvbW1lbnQgb2YgImNsZWFyIHRoZSByZXN0IGluIGNhc2Ugb2YgZ2FyYmFnZSIuDQo+ID4+
Pj4+IFRoZSBjb2RlIGluIHhlX3JlZ19zcl9hcHBseV93aGl0ZWxpc3QgY2FsbHMgeGVfbW1pb193
cml0ZTMyIHRvIHdyaXRlIHRoZQ0KPiA+Pj4+PiByZWdpc3RlcnMsIHdoZXJlYXMgdGhlIGNvZGUg
aW4gZ3VjX21taW9fcmVnc2V0X3dyaXRlIHVzZXMgeGVfbWFwX21lbWNweV90bw0KPiA+Pj4+PiBp
bnRlcm5hbGx5LiAgV2hpbGUgdGhlIGZvcm1lciBzZWVtcyB0byBiZSB3cml0aW5nIHRvIHRoZQ0K
PiA+Pj4+PiB4ZV9tbWlvX2FkanVzdGVkX2FkZHIobW1pbywgcmVnLmFkZHIpICsgbW1pby0+cmVn
cywgdGhlIGxhdHRlciBhcHBlYXJzIHRvIGJlDQo+ID4+Pj4+IHdyaXRpbmcgdG8gSU9TWVNfTUFQ
X0lOSVRfT0ZGU0VUKGFkc190b19tYXAoYWRzKSwgZ3VjX2Fkc19yZWdzZXRfb2Zmc2V0KGFkcyku
DQo+ID4+Pj4+DQo+ID4+Pj4+IEknbSBub3QgcGFydGljdWxhcmx5IHdlbGwtdmVyc2VkIGluIHRo
ZXNlIGZ1bmN0aW9ucywgYnV0IGl0IGxvb2tzIHRvIG1lIHRoYXQgdGhlc2UNCj4gPj4+Pj4gdHdv
IGZ1bmN0aW9ucyB3cml0ZSB0byBkaWZmZXJlbnQgbG9jYXRpb25zIGFuZCB0aHVzIHdvdWxkIG5v
dCBpbXBhY3QgZWFjaCBvdGhlci4NCj4gPj4+Pj4gT3IsIGluIG90aGVyIHdvcmRzLCBJIGRvbid0
IHRoaW5rIHRoZSBnYXJiYWdlIHdlJ3JlIGNsZWFyaW5nIGluIHhlX3JlZ19zcl9hcHBseV93aGl0
ZWxpc3QNCj4gPj4+Pj4gaXMgdGhlIHNhbWUgYXMgdGhlIGRhdGEgd2UncmUgd3JpdGluZyBpbiBn
dWNfbW1pb19yZWdzZXRfd3JpdGUuDQo+ID4+Pj4gTm8uDQo+ID4+Pj4NCj4gPj4+PiBUaGUgYXBw
bHkgZnVuY3Rpb24gaXMgd3JpdGluZyB0aGUgbGlzdCBvZiB3aGl0ZWxpc3RlZCByZWdpc3RlcnMg
aW50byB0aGUNCj4gPj4+PiB3aGl0ZWxpc3QgcmVnaXN0ZXJzIHRoZW1zZWx2ZXMuIFRoZSBHdUMg
QURTIGNvZGUgaXMgYWRkaW5nIGxpc3RzIG9mDQo+ID4+Pj4gcmVnaXN0ZXJzIHRvIHRoZSBzYXZl
L3Jlc3RvcmUgbGlzdCBmb3IgYW4gZW5naW5lIHJlc2V0Lg0KPiA+Pj4+DQo+ID4+Pj4gU3BlY2lm
aWNhbGx5IHdpdGggcmVnYXJkcyB0byB0aGUgTk9OUFJJViByZWdpc3RlcnMsIHRoZXNlIGFyZSBh
IHNldCBvZg0KPiA+Pj4+IHJlZ2lzdGVycyB3aGljaCBob2xkIHRoZSBhZGRyZXNzZXMgb2Ygb3Ro
ZXIgcmVnaXN0ZXJzLiBXaGVuIHNldCwgdGhleQ0KPiA+Pj4+IGFsbG93IHVudHJ1c3RlZCB1c2Vy
cyB0byBhY2Nlc3MgdGhvc2UgJ290aGVyJyByZWdpc3RlcnMgd2hpY2ggb3RoZXJ3aXNlDQo+ID4+
Pj4gd291bGQgYmUgb2ZmIGxpbWl0cy4gVGhlIHdoaXRlbGlzdCBjb2RlIGlzIHNldHRpbmcgdXAg
dGhhdCBsaXN0LiBFLmcuDQo+ID4+Pj4gYWRkaW5nIHRoZSBPQSByZWdpc3RlcnMgdG8gdGhlIHdo
aXRlbGlzdCB0byBhbGxvdyBhcHBsaWNhdGlvbnMgdG8gdXNlDQo+ID4+Pj4gdGhlIE9BIG1lY2hh
bmlzbXMuIFNvIGl0IGRvZXMgIk5PTlBSSVZfUkVHKHgpID0gT0FfUkVHIi4gSXQgYWxzbyBkb2Vz
DQo+ID4+Pj4gIk5PTlBSSVYoeCsxIC4uIG1heCkgPSBOT19PUCIuIFRoYXQgaXMgdG8gZW5zdXJl
IGFsbCB0aGUgTk9OUFJJVg0KPiA+Pj4+IHJlZ2lzdGVycyBhcmUgc2V0IHRvIHNvbWV0aGluZyB2
YWxpZCBhbmQgbm90IHVuaW5pdGlhbGlzZWQuIE90aGVyd2lzZSB3ZQ0KPiA+Pj4+IHBvdGVudGlh
bGx5IGhhdmUgdW5pbnRlbmRlZCByZWdpc3RlcnMgYmVpbmcgd2hpdGVsaXN0ZWQgYW5kIHVzZXJz
IGFyZQ0KPiA+Pj4+IGFibGUgdG8gYWNjZXNzIHRoaW5ncyB0aGV5IHNob3VsZG4ndC4gV2hlcmVh
cywgc2V0dGluZyB0aGVtIGFsbCB0byBOT19PUA0KPiA+Pj4+IG1lYW5zIHdlIGFyZSBncmFudGlu
ZyBhbGwgdXNlcnMgYWNjZXNzIHRvIHRoZSBOT19PUCByZWdpc3RlciB3aGljaCB0aGV5DQo+ID4+
Pj4gYWxyZWFkeSBoYWQgYWNjZXNzIHRvIGFueXdheS4NCj4gPj4+Pg0KPiA+Pj4+IENvbXBsZXRl
bHkgc2VwYXJhdGUgdG8gdGhhdCwgdGhlIEd1QyBBRFMgY29kZSBpcyBjcmVhdGluZyBhIGxpc3Qg
b2YNCj4gPj4+PiByZWdpc3RlcnMgd2hpY2ggR3VDIHdpbGwgc2F2ZSBhbmQgcmVzdG9yZSBhY3Jv
c3MgYW4gZW5naW5lIHJlc2V0LiBUaGVzZQ0KPiA+Pj4+IGFyZSBhbGwgdGhlIHJlZ2lzdGVycyB3
aGljaCBnZXQgdHJhc2hlZCBieSB0aGUgcmVzZXQgYnV0IHdoaWNoIGFyZSBub3QNCj4gPj4+PiBz
YXZlZCBhbmQgcmVzdG9yZWQgYXMgcGFydCBvZiBhIHJ1bm5pbmcgY29udGV4dC4gVGhlIE5PTlBS
SVYgcmVnaXN0ZXJzDQo+ID4+Pj4gYXBwYXJlbnRseSBmYWxsIGludG8gdGhpcyBjYXRlZ29yeS4g
U28gd2UgbmVlZCB0byB0ZWxsIEd1QyB0byBwcmVzZXJ2ZQ0KPiA+Pj4+IHRoZWlyIGNvbnRlbnQg
YWNyb3NzIGEgcmVzZXQuIE90aGVyd2lzZSwgYWZ0ZXIgdGhlIHJlc2V0LCB0aGUgd2hpdGVsaXN0
DQo+ID4+Pj4gd2lsbCBiZSBsb3N0LiBCdXQsIHRoZSByZXNldCBzdGF0ZSBvZiB0aG9zZSByZWdp
c3RlcnMgaXMgJ3VuZGVmaW5lZCcgYXMNCj4gPj4+PiBvcHBvc2VkIHRvICdOTy1PUCcgYXMgc3Vn
Z2VzdGVkIGJ5IHRoZSB3aGl0ZWxpc3QgY29kZS4gVGhhdCBtZWFucyB0aGF0DQo+ID4+Pj4gYW55
IE5PTlBSSVYgcmVnaXN0ZXIgd2hpY2ggaXMgbm90IHBhcnQgb2YgdGhlIHJlc2V0IHNhdmUvcmVz
dG9yZSBsaXN0DQo+ID4+Pj4gd2lsbCBiZSBubyBsb25nZXIgYmUgc2V0IHRvIE5PLU9QIGFmdGVy
IGEgcmVzZXQuIEluc3RlYWQsIGl0IHdpbGwgYmUNCj4gPj4+PiBnaXZpbmcgdXNlcnMgYWNjZXNz
IHRvIHNvbWUgcmFuZG9tIHJlZ2lzdGVyIGFnYWluLiBBbmQgd2UgZG8gbm90IHdhbnQgdG8NCj4g
Pj4+PiBkbyB0aGF0Lg0KPiA+Pj4+DQo+ID4+PiBPa2F5LiAgSXQgc291bmRzIHRvIG1lIHRoYXQg
d2UgYXJlbid0IHBlcmZvcm1pbmcgeGVfcmVnX3NyX2FwcGx5X3doaXRlbGlzdA0KPiA+Pj4gZHVy
aW5nIGFuIGVuZ2luZSByZXNldCwgYmVjYXVzZSB0aGF0IGZ1bmN0aW9uIHNob3VsZCBiZSBzZXR0
aW5nIHRoZSByZWdpc3RlcnMNCj4gPj4+IHRvIGEgZGVmaW5lZCByZXNldCBzdGF0ZSwgcmF0aGVy
IHRoYW4gInVuZGVmaW5lZCIuICBTaG91bGQgd2UgYmUgY2FsbGluZyB0aGF0DQo+ID4+PiBmdW5j
dGlvbiBkdXJpbmcgZ3VjX21taW9fcmVnc2V0X3dyaXRlPw0KPiA+Pj4NCj4gPj4+IEkgdGVzdGVk
IGl0IGFuZCBpdCBkaWRuJ3Qgd29yayBvbiBteSBlbmQsIGJ1dCBJIG1pZ2h0IGJlIG1pc3Npbmcg
c29tZXRoaW5nLg0KPiA+Pj4gLUpvbmF0aGFuIENhdml0dA0KPiA+PiBOby4gVGhlIEtNRCBkb2Vz
IG5vdCBleGVjdXRlIGFueSBjb2RlIG9uIGFuIGVuZ2luZSByZXNldC4gVGhlIHJlc2V0IGlzDQo+
ID4+IGhhbmRsZWQgYnkgdGhlIEd1Qy4gVGhlIEtNRCBtZXJlbHkgZ2V0cyBub3RpZmllZCB0aGF0
IGl0IGhhcyBoYXBwZW5lZA0KPiA+PiBhZnRlciB0aGUgZmFjdC4gVGhhdCBpcyB0aGUgcG9pbnQg
b2YgZ2l2aW5nIGEgc2F2ZS9yZXN0b3JlIHJlZ2lzdGVyIGxpc3QNCj4gPj4gdG8gR3VDLiBHdUMg
d2lsbCBzYXZlIHRoZSB2YWx1ZXMgb2YgYWxsIHRoZSByZWdpc3RlcnMgaW4gdGhlIGxpc3QgYmVm
b3JlDQo+ID4+IGl0IGRvZXMgYSByZXNldCBhbmQgcmVzdG9yZSB0aGVtIGFnYWluIGFmdGVyIHRo
ZSByZXNldCBpcyBjb21wbGV0ZS4NCj4gPj4gVGhlcmVmb3JlLCBhbnkgcmVnaXN0ZXIgd2hvc2Ug
dmFsdWUgd2Ugd2FudCB0byBiZSBtYW51YWxseSBwcmVzZXJ2ZWQNCj4gPj4gYWNyb3NzIGFuIGVu
Z2luZSByZXNldCBtdXN0IGJlIGFkZGVkIHRvIHRoZSBHdUMncyBzYXZlL3Jlc3RvcmUgbGlzdC4N
Cj4gPiBBRkFJQ1QsIHRoYXQncyB3aGF0IEknbSBkb2luZyBpbiB0aGlzIHBhdGNoLCBzbyBjb3Vs
ZCB5b3UgcGxlYXNlDQo+ID4gY2xhcmlmeSB3aGF0IGl0IGlzIEkgbmVlZCB0byBkbyBkaWZmZXJl
bnRseSBmcm9tIHdoYXQgaXMgY3VycmVudGx5DQo+ID4gcHJlc2VudCBpbiB0aGUgcGF0Y2g/DQo+
ID4gLUpvbmF0aGFuIENhdml0dA0KPiBZb3UgcGF0Y2ggaXMgb25seSBhZGRpbmcgdGhlIE5PTlBS
SVYgcmVnaXN0ZXJzIHdoaWNoIGhhdmUgYmVlbiB1c2VkIGFzIA0KPiBvcHBvc2VkIHRvIGFkZGlu
ZyBhbGwgb2YgdGhlbS4gVGhlIGZvcmVhY2ggbG9vcCBpcyBpdGVyYXRpbmcgb3ZlciB0aGUgDQo+
IGxpc3Qgb2Ygd2hpdGVsaXN0ZWQgcmVnaXN0ZXJzIChpLmUuIHRoZSB0YXJnZXQgcmVnaXN0ZXJz
IHRoYXQgYXJlIA0KPiB3cml0dGVuIGludG8gdGhlIE5PTl9QUklWKHgpIHJlZ2lzdGVycykgYW5k
IGFkZHMgYSBOT05QUklWIHJlZ2lzdGVyIHRvIA0KPiB0aGUgc2F2ZS9yZXN0b3JlIGxpc3QgZm9y
IGVhY2ggZW50cnkgZm91bmQgaW4gdGhlIHdoaXRlbGlzdC4gU28gaWYgdGhlcmUgDQo+IHdlcmUg
dGhyZWUgZW50cmllcyBpbiB0aGUgd2hpdGVsaXN0LCBpdCB3b3VsZCBhZGQgTk9OUFJJVigwLi4y
KS4gDQo+IFRoZXJlZm9yZSBOT05QUklWKDMuLjExKSBhcmUgbm90IGFkZGVkIHRvIHRoZSBzYXZl
L3Jlc3RvcmUgbGlzdCBhbmQgd2lsbCANCj4gYmUgdHJhc2hlZCBvbiBhbiBlbmdpbmUgcmVzZXQu
DQo+IA0KPiBUaGUgb3JpZ2luYWwgcGF0Y2ggd2FzIHNpbXBseSBsb29waW5nIG92ZXIgMC4uTUFY
X05PTlBSSVYgYW5kIHdvdWxkIGhhdmUgDQo+IGFkZGVkIGFsbCB0aGUgTk9OUFJJViByZWdpc3Rl
cnMgdG8gdGhlIHNhdmUvcmVzdG9yZSBsaXN0Lg0KPiANCj4gVGhlIGN1cnJlbnQgcGF0Y2ggaXMg
YW4gb3B0aW1pc2F0aW9uIHRvIG9ubHkgYWRkIHRoZSBpbi11c2UgcmVnaXN0ZXJzLiANCj4gTXkg
Y29uY2VybiBpcyB0aGF0IG9wdGltaXNhdGlvbiBpcyBub3QgdmFsaWQgYW5kIHRoZSBvcmlnaW5h
bCB2ZXJzaW9uIA0KPiB3YXMgYWN0dWFsbHkgbmVjZXNzYXJ5Lg0KDQpJIGdhdmUgaXQgc29tZSB0
aG91Z2h0IGFmdGVyIHNlbmRpbmcgbXkgcHJpb3IgcmVwbHkgYW5kIGhhZCBhIGZlZWxpbmcNCnRo
YXQgd291bGQgYmUgeW91ciByZXNwb25zZS4gIE9rYXksIEknbGwgc2VuZCBhbiB1cGRhdGUgdGhh
dCBpdGVyYXRlcw0Kb3ZlciBhbGwgb2YgTUFYX05PTlBSSVYuDQotSm9uYXRoYW4gQ2F2aXR0DQoN
Cj4gDQo+IEpvaG4uDQo+IA0KPiA+DQo+ID4+IEpvaG4uDQo+ID4+DQo+ID4+Pj4gSm9obi4NCj4g
Pj4+Pg0KPiA+Pj4+DQo+ID4+Pj4+IC1Kb25hdGhhbiBDYXZpdHQNCj4gPj4+Pj4NCj4gPj4+Pj4+
IElmIHdlIGRvbid0IHRydXN0IHRoZSByZXNldCBzdGF0ZSB0byBiZSB2YWxpZCB0aGVuIHdlIG5l
ZWQgdG8gZW5zdXJlIGFsbA0KPiA+Pj4+Pj4gb2YgdGhlbSBhcmUgc2F2ZWQvcmVzdG9yZWQgYWNy
b3NzIGEgcmVzZXQuIE90aGVyd2lzZSwgdGhhdCBnYXJiYWdlIGNhbg0KPiA+Pj4+Pj4gY29tZSBi
YWNrIGFuZCBjYXVzZSBwcm9ibGVtcy4NCj4gPj4+Pj4+DQo+ID4+Pj4+PiBKb2huLg0KPiA+Pj4+
Pj4NCj4gPj4+Pj4+DQo+ID4+Pj4+Pj4gICAgICAJZm9yIChlID0gZXh0cmFfcmVnczsgZSA8IGV4
dHJhX3JlZ3MgKyBBUlJBWV9TSVpFKGV4dHJhX3JlZ3MpOyBlKyspIHsNCj4gPj4+Pj4+PiAgICAg
IAkJaWYgKGUtPnNraXApDQo+ID4+Pj4+Pj4gICAgICAJCQljb250aW51ZTsNCj4gPj4NCj4gDQo+
IA0K
