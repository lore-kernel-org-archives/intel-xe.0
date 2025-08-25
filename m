Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8545C8303F
	for <intel-xe@archiver.kernel.org>; Mon, 25 Aug 2025 18:34:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5E110E52F;
	Mon, 25 Aug 2025 18:34:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hoyqzbmd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5676F10E283
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Aug 2025 18:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756146869; x=1787682869;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=LYkMc6+Y6kXQkOFctY6QATgdRBqrH6co/aUMt/6RbFQ=;
 b=HoyqzbmdWglZepoWT4fX45HDCl9YccltJOTt8vbONdW3TiDdiwQFecYy
 5Xf0GsFPXdNR8jpG3VY0gBFQ9zQnZMvdZfOYIrvDvHujmQmCU1PLJokFV
 jsEpuTiGpaLRIZL7lYwanDjkyUvDOpeaOqbmqTtObIl4XlbENJCTvYVri
 8AYNppzSuJm/28QUy4eWM4aG0MUWuuf3xUpjLV0eAQZ4Kgg0cJUn/j7Lx
 1R4fBK3jrGqMbB08tZ/oMwC+5fJPN5tJnHnI8EqJBig6UN2pl8xKIR1my
 1FPu19GfA2PV7ItRGXr6mpJClTT8qAv8XvDJ3Ec6z3M1XWU7ZyBRyZx9Q Q==;
X-CSE-ConnectionGUID: 5SbCkdKnQt+nSot9Z4txVA==
X-CSE-MsgGUID: 0e3n3dNORBSuVksTd8m9sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="68637291"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="68637291"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 11:34:29 -0700
X-CSE-ConnectionGUID: xqATlWkKSBS1arNpni7GRA==
X-CSE-MsgGUID: BBMprsVeR82iVecKT0e6iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="169267042"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 11:34:28 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 11:34:28 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 25 Aug 2025 11:34:28 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.81)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 11:34:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lKVOqeloIGYAB5Iz/f0NIwxWMKkKfPH1wxuxgljCmu0Lzp+6HDUrKHaJSc3hgpdmfe7SwSxG3Exu8IbFxhwLbFdpq0CTeIRynmLuGRh2ye0hAH+9itDkYJCZHSrHfJ+TpTh8ctIUHGhkkcC3pBMlO/U2Ljw0qKzrhVbva6qRqATSphAoDLve2WTETCt3IOAru0oTSnonHbkma4KKc86aGUe7ZUgL5VW2OZ5rEJ8tEwFSagbJr2l0Dt0LqXroPhGI/YTiQBR18f83yGYKauT+fcBCsJzpY6P+9giHO0AFf1uAk6QWCzdlxw0ip+8i2EFznZgM0h+nc2NLYvOv7vkROg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LYkMc6+Y6kXQkOFctY6QATgdRBqrH6co/aUMt/6RbFQ=;
 b=K4Pf0a+4R1I7+0Cbb5j1tXkxWY/zsJMFu9qGt4Kb4Qt56/yTrukNX00I9JZkE6JgC/vOr2ucR4eCD3ZrQQAF90Qqsunt3QcfAiW4h9RTGg/DZwJE21tLntLkQ2pZFxkT3gG4GJKmm32R/zm9SA6yqfhH2vh3pPdKPcGEb5seRCgdF55l+EDg3ENotWqxgm320vmwNDKzx9zwFO+dpB+BY3WJR7OWovmHbcw0a9IScAxUU8cKsONLAA09Wbn/sqlV02c4nCFDRp/ALKcRz7oC3cf5PdbWiZP+mdUPoOXoxoz28hujKP6UUZUed/hlXQSiujpmoQBBASMtoz5xQwj3sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SN7PR11MB7065.namprd11.prod.outlook.com (2603:10b6:806:298::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Mon, 25 Aug
 2025 18:34:24 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9052.013; Mon, 25 Aug 2025
 18:34:24 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "Wang, X" <x.wang@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Poosa, 
 Karthik" <karthik.poosa@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "Xiong, James" <james.xiong@intel.com>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: make xe_gt_idle_disable_c6() handle the
 forcewake internally
Thread-Topic: [PATCH 1/2] drm/xe: make xe_gt_idle_disable_c6() handle the
 forcewake internally
Thread-Index: AQHcFeGKMX0vGfZckkaGaDqTjRs6K7RzrLUAgAADi4CAAAG9AA==
Date: Mon, 25 Aug 2025 18:34:24 +0000
Message-ID: <60479cebec3f48a3f0fe159601072b6b7d9d6a26.camel@intel.com>
References: <20250825165759.1263546-1-x.wang@intel.com>
 <20250825165759.1263546-2-x.wang@intel.com> <aKyoQNJEq70Q4nkv@intel.com>
 <SA3PR11MB8046BB4EF58E2E3450FA213B863EA@SA3PR11MB8046.namprd11.prod.outlook.com>
In-Reply-To: <SA3PR11MB8046BB4EF58E2E3450FA213B863EA@SA3PR11MB8046.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-1.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR11MB8430:EE_|SN7PR11MB7065:EE_
x-ms-office365-filtering-correlation-id: a345d6f9-c05e-42be-d8c1-08dde40603ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?d1FwT1QxT3YzS3hIK3hHVTRFN0p5enNRVVhuU05HY0czd0QvV2NGSmQ1N2lV?=
 =?utf-8?B?d1pwdWFvVFp5SWJYZjI2azB3OEREZHJ2WU9vVlRZRXZPNFQ0MXFrWXk5VkVs?=
 =?utf-8?B?cmpOSHcvbHpNZTZ6QlBYOXg0WlNLSlVEeXlVK3YzTEJHeDhjU3FQSnMzSGVE?=
 =?utf-8?B?SnZpZllSanYzMHExbU5PZFk2eVpxdHpNd3ZCN09GY3REeUFsc09GVW1PM2ZO?=
 =?utf-8?B?RFExdXVnYngvTlQvNk9HN1l3M2xRZDhWWHJvclE3SXpJMldWYU9FemlaVjRE?=
 =?utf-8?B?cUJYR0s4Sm9mbEFyYlhHN2ZDWFlnZTBVYVBPWk0vWWZhcFFpbEJkcjJJVUM2?=
 =?utf-8?B?UmlPbzlYVDYxUzVDSDMxVDFpSTRHRDA0Y1Yybng1R09tRUV0L2drK1M4V2JO?=
 =?utf-8?B?Zzh4enNDWHpBaElLekFTS3lSRUtSYWd1aHNTZjIzTU9wanhqZFBJRi90dmty?=
 =?utf-8?B?cE50VGJBZTdCOTFDK2xTTmo1b2FqYjIyV0lTRVlTNUZSS2Z1aGVNclF4cmJ6?=
 =?utf-8?B?RjVwZG9GdU1LNmMydEIrUno0cUN5NUFlWnZ6R2lGbUhlcTZ3WTdsVnNsa1pQ?=
 =?utf-8?B?RThwaWxsQkVrNmlnL1BGQ3RyTlVVaG1BWlRSbHlMR3I1NVVGRlhVSkkyZmlk?=
 =?utf-8?B?NTJ1c092RXc5RjFOTlhNSUZTN2ljRTk1cWVnc1Z3d0lHK01VS2c2MFdHVHEv?=
 =?utf-8?B?aWEyNmM2SXNxVEh4ZTBYTkUzSlRzVTFXekZlUE9INHZIR3l4ZWErU0FRdHN5?=
 =?utf-8?B?SmJOTHlveU1RQmwvRGJqSzFkZXFEN21nU2RTbXd0WDhTaXZGSWxlM1BrTEMw?=
 =?utf-8?B?MmtEcGc4SDMyeG5rWFlIMnNNUFExQktEenFmWjN3RXJlZGdOQ2hMenZZeDE1?=
 =?utf-8?B?WWVjVFovd2RMUnVycm95bnNleWYrZW9VemlCN2lZY1UveWtHcitKZUpWRnhq?=
 =?utf-8?B?Y2FMb0ZjREd0dEl5U3N3YzZOZk54TktHTnFIZC9RdzR1cWp0QU43YTZGT3ZL?=
 =?utf-8?B?WlRFeFppL2FlYjYxU1pObElZa0k4cGJVeEVQMU9aVm83RkNObVpPb2tYRVpu?=
 =?utf-8?B?Q3pyM0NkWkdHZ0RyTCtoYnM2d1dMK1UyYmZQR2UxOEJPaHM1MWxiNnlUVUxM?=
 =?utf-8?B?VFZobVU4MTFHcG4xaTcxS3Qyd216cTMycHhJK0FkZ1YwV1hlcDl6VnVBaEVS?=
 =?utf-8?B?bGZEQ2prQmQ4aDJueTcwK1d3RDNaZ2NMbkdMMDI5NW1LNVRRRFhpR05GbTRJ?=
 =?utf-8?B?dC9CdVp2MWEvampENFA1OVB6RW9Pd2VkaHUrdFRUTGV6TnBFZVczMEp5OEYz?=
 =?utf-8?B?WUE5NXFJSnF4b2hYQ0RSRzdtM3VSZkxKQ1ZjTzFKMGZpYnhGQjZxdndyUzdx?=
 =?utf-8?B?amlMVVFjNXJ6SlI4YVBoek9Wd05oVWhXT1dsWkdjZWM3YmJCZHlnbFlHaG5x?=
 =?utf-8?B?d0FoMWsrWmx6ZnJJNVlVUTFEbXQ4MDhMREdoZ1EvV0JNMnB4aGx4R0pmekR3?=
 =?utf-8?B?MzVTcXJzeUM5SDhldnVtYzFFOUcrSjc5a2pSNHJ0N01vWmJ0cll3U0dScHAr?=
 =?utf-8?B?VGNhZ290eEhrbGpVNEhXRCtMdkZBeDh3NXJKRzA3enIyK2FTNmFIeXgvMXpP?=
 =?utf-8?B?akc2S0JHVFZzK1NUUEVmMjBQYnYrOTc2SkVDeG5ZbmpZSmdFRFlJWDBOZk10?=
 =?utf-8?B?VUx3V3VSVXM2RkRRMXZqZ1Jic0RNd3ZTQ1V4N2xMaXRNaXFzTkxHMmQ3R3R4?=
 =?utf-8?B?N1d6eW80K0tIYUZZcTU3L1cwWVhHZnVlU0RVeS94clBYZnZqTnRUMXEwcjc2?=
 =?utf-8?B?a1FTMXVNQW5KcUpHOWZaRWROQTFpY2NoTDREQVpmS0JROEZZTCtZZ2Q1clJS?=
 =?utf-8?B?WjFGOVYxNWI2Y1dxWjM2Q2hEeVNFcUZwSDRwcy9ubmpOTlgwdGYyb2pSeHhY?=
 =?utf-8?B?SFh0SzJXdW9OWDhKdVlidldJTzlaYXoxNjdlYm5zcHFLbDZLNDkza0RhejlJ?=
 =?utf-8?B?MVJlUXk3dHhRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QTRsYkhTVmxnZnk5TytGVE1RSm12LzN1YnRiQ3ZxYlkyaG1xL1dqem1hQUsr?=
 =?utf-8?B?a0NvU1FtK3p6WmlKNXYvcytNUkd4TjRwbU9mMEM0L2FQdUM4MnN6MXlzeGFU?=
 =?utf-8?B?ajNOQkdRSkFpOGdKVXVyYllFMmczclFQenFYNnZ2dG93amNMOGd1VTh4QTFR?=
 =?utf-8?B?QWdnbEYxNUI5cUQzdkYvc0R4WmhuQnVxd3VYb0MveER6dWR4bzh5R0IzMGtQ?=
 =?utf-8?B?REc2TUdpTTlvUE5BdkpqRmlGSXo3Ymg2aHhOTm5ndE9SckRzOFcvbnlyeVl0?=
 =?utf-8?B?cVJYemw3NnNNL05wVDBCUEdhMVpWU2NnZGJhRkdycDlqL0xheWRQbnpNR2ha?=
 =?utf-8?B?Q1ZoSThRaHRNWmllZHVjVm5ySDFySmx5aTIvOHJZbXdoY08vVHNFbUJyRkhR?=
 =?utf-8?B?aFp3U0cvY3dSa3JBZHg4MDBQZDlQcGxpSURJbUFpMlh2ZlowNXc5RGJ6ajRs?=
 =?utf-8?B?bFV6KzNoQlJXWXVDbXZXTDRyUXJJcUJ1Z2Z6SXNsWkRYZSsvbzdWb1Z4cEZL?=
 =?utf-8?B?U05rZkpOTkpYemFjekFpTUlKVUdtQUlSYjhudy83Sk4wd2ZDVEptL3NEeXdV?=
 =?utf-8?B?RkVmWStDL0VzS2ZmSDl1ZmhRMDFUMi9WOU04OUE5SXVKN2tvNTFMNnQ1NXlu?=
 =?utf-8?B?aktoR09aNmtKbVg2QnhJSEpHVmZGUjNRbVRTQlFKc2NSb09Db0p6ZDJxak9G?=
 =?utf-8?B?SEVZNXNodGdVTHRrcm02VzdSaGVHSkNqMklyYVorMEJ5WE9mckcrTG1MdHdi?=
 =?utf-8?B?M3hBSVE4VjRxbjFLam9RWm1XU2hQY08vVGlqTkdGcWpWanJJbHVqM04xaUY2?=
 =?utf-8?B?eExoUWY1SzZzb0xSemc1UzBEbENUWGZlLzNUMGFIMmVSR0FkM0NRUDA3emlZ?=
 =?utf-8?B?eERNeWZYTk8xOE03aUlTY3N2cUswWDFMVXdVcktkOGhoNEdycDdkenVHZm4y?=
 =?utf-8?B?OFVOK2ZEdlB0dzVPMmJIK2U4Y3ZsTENPUHNhWWNrYTFHNWJlWktMeFZRVHVD?=
 =?utf-8?B?UkpHK3B3SC9YL0JRby8vcm8zZFpkMGZWK3ZCRFIzVmF6bEpiYTk3STBZT2ZI?=
 =?utf-8?B?MXlQK1pPRksxTHZsUlJVUWlNK2phTnorU0VjTEd2c05IWHBOckI2MDZsK0Rs?=
 =?utf-8?B?dDBqNi9KaXhzTDNwMnp1RXlkUWY3VWNhcHFQYXBGMjdvT3pqWUhJUFFrRWVY?=
 =?utf-8?B?K3I1VjBFQ3dJMmtUVzY4Wjl5TlN2K3QwYS8rN2tNeklIa3B5MEl2cloyUWFn?=
 =?utf-8?B?elpqbHJ3M2laM0hpRW01SmtFQkZuamMwMTlmYkU5MWl3UGZydHhSRVczVDRK?=
 =?utf-8?B?MktFZW13Vk14RjJlTVZSVFBNM0pOaEZOWnlIaUkvS1pHNmowOHpVQjJ4bi9y?=
 =?utf-8?B?QUJyTlE4TUgzZWlsSFRxNitpRC8vT1ZWVnRxYmV0bXZvWVJlQ3JvNmcxcitu?=
 =?utf-8?B?MXJiVDNyUG0rWEkvN2ZBSW95Smp1dExlK203ajlaMmNmbjc2OVpOTUdBeVpa?=
 =?utf-8?B?cGp2VG01ZVpMM3RBalhGZ0J4RUJtR1pURzR0Q016VmRlbWt4cjNIL1UyeVdZ?=
 =?utf-8?B?NmNCUkcwdDlIM04vaTVFK1Y5Y3BxdHIvd09TTTZFUHdMdWhwZTdwdEZaL2Rw?=
 =?utf-8?B?TnN1cko5Zjd2SFhaSjBIOWFVbkNVeERsU3dFWGhmMW8wS2ZXZWZPMnJnZHdV?=
 =?utf-8?B?VVlaUmZEWkJGL241N3FNekFwSko3QUNpaHd5b0pxZUMrYjZlQWJqTlZRMmhK?=
 =?utf-8?B?c08ya1FMMUZQeGc4VExBazF5bktmc2Fac0MvdnNTK2RZUFpDbVhhb2pJMDBy?=
 =?utf-8?B?MUE5NkQ3TlFuTHRoL3ExaW5LNU1WTzR6NUlWOVp4N0k4UGxHZTVjVkNmdEFJ?=
 =?utf-8?B?K3ExMURJTFk5SEhnVlU4a2MzVkNQOWRIa25Rb0VGYmZZWWVBVGVSRnE0ZFFE?=
 =?utf-8?B?Z2sxV2tpQ0ptYUtGVy9UaHdCZTRybFk0ZTBwNkg2eDZlTXBGbkIvN1dIY3Ux?=
 =?utf-8?B?NkMwUGJKMm5pNG9ITFpGMXBkd2ZYZEFMTFV0OEhsenZDUlZNaWE4TWN3eS94?=
 =?utf-8?B?SDR3OFplc01oWE5iZ1U0THFWbmQ1NVljUkZmM2ZRVkJ4TE1mbnV6S3Q3THc1?=
 =?utf-8?B?eVVaVjRSK3RkYTI0ZEdPVHJZZmE2M0M3WDZGcW1OQ3FCMlBldFVDNjZ6V3pD?=
 =?utf-8?B?dmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D9A691FE716C2A409AAD13B5199C0FFA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a345d6f9-c05e-42be-d8c1-08dde40603ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2025 18:34:24.3076 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wONUt1P1P0OBMpcVKZwMfomyLhPFyBW5juZPcqNTu4WTHmXL8uODtQstYPZ5FZhBsaCYNunWuietuVaK/HkbTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7065
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

T24gTW9uLCAyMDI1LTA4LTI1IGF0IDE4OjI4ICswMDAwLCBXYW5nLCBYIHdyb3RlOg0KPiANCj4g
DQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBWaXZpLCBSb2RyaWdv
IDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiA+IFNlbnQ6IE1vbmRheSwgQXVndXN0IDI1LCAy
MDI1IDExOjE1DQo+ID4gVG86IFdhbmcsIFggPHgud2FuZ0BpbnRlbC5jb20+DQo+ID4gQ2M6IGlu
dGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgUG9vc2EsIEthcnRoaWsNCj4gPiA8a2FydGhp
ay5wb29zYUBpbnRlbC5jb20+Ow0KPiA+IFhpb25nLCBKYW1lcyA8amFtZXMueGlvbmdAaW50ZWwu
Y29tPjsgU3VtbWVycywgU3R1YXJ0DQo+ID4gPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT47IExp
biwgU2h1aWNoZW5nDQo+ID4gPHNodWljaGVuZy5saW5AaW50ZWwuY29tPjsNCj4gPiBCZWxnYXVt
a2FyLCBWaW5heSA8dmluYXkuYmVsZ2F1bWthckBpbnRlbC5jb20+DQo+ID4gU3ViamVjdDogUmU6
IFtQQVRDSCAxLzJdIGRybS94ZTogbWFrZSB4ZV9ndF9pZGxlX2Rpc2FibGVfYzYoKQ0KPiA+IGhh
bmRsZSB0aGUNCj4gPiBmb3JjZXdha2UgaW50ZXJuYWxseQ0KPiA+IA0KPiA+IE9uIE1vbiwgQXVn
IDI1LCAyMDI1IGF0IDA5OjU3OjU4QU0gLTA3MDAsIFhpbiBXYW5nIHdyb3RlOg0KPiA+ID4gTW92
ZSBmb3JjZXdha2VfZ2V0KCkgaW50byB4ZV9ndF9pZGxlX2VuYWJsZV9jNigpIHRvIHN0cmVhbWxp
bmUNCj4gPiA+IHRoZQ0KPiA+ID4gY29kZSBhbmQgbWFrZSBpdCBlYXNpZXIgdG8gdXNlLg0KPiA+
ID4gDQo+ID4gPiBTdWdnZXN0ZWQtYnk6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVs
LmNvbT4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFhpbiBXYW5nIDx4LndhbmdAaW50ZWwuY29tPg0K
PiA+ID4gLS0tDQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9pZGxlLmMgfCAyMyAr
KysrKysrKysrKysrKy0tLS0tLS0tLQ0KPiA+ID4gZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X2lk
bGUuaCB8wqAgMiArLQ0KPiA+ID4gZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19wYy5jwqAgfCAx
MyArLS0tLS0tLS0tLS0tDQo+ID4gPiDCoDMgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygr
KSwgMjIgZGVsZXRpb25zKC0pDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3RfaWRsZS5jDQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9p
ZGxlLmMgaW5kZXgNCj4gPiA+IGZmYjIxMDIxNmFhOS4uODU1NmIzZmYxNTYxDQo+ID4gPiAxMDA2
NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9pZGxlLmMNCj4gPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9pZGxlLmMNCj4gPiA+IEBAIC0zMjIsMTUgKzMy
MiwxMSBAQCBzdGF0aWMgdm9pZCBndF9pZGxlX2Zpbmkodm9pZCAqYXJnKcKgIHsNCj4gPiA+IMKg
CXN0cnVjdCBrb2JqZWN0ICprb2JqID0gYXJnOw0KPiA+ID4gwqAJc3RydWN0IHhlX2d0ICpndCA9
IGtvYmpfdG9fZ3Qoa29iai0+cGFyZW50KTsNCj4gPiA+IC0JdW5zaWduZWQgaW50IGZ3X3JlZjsN
Cj4gPiA+IA0KPiA+ID4gwqAJeGVfZ3RfaWRsZV9kaXNhYmxlX3BnKGd0KTsNCj4gPiA+IA0KPiA+
ID4gLQlpZiAoZ3RfdG9feGUoZ3QpLT5pbmZvLnNraXBfZ3VjX3BjKSB7DQo+ID4gPiAtCQlmd19y
ZWYgPSB4ZV9mb3JjZV93YWtlX2dldChndF90b19mdyhndCksDQo+ID4gPiBYRV9GV19HVCk7DQo+
ID4gPiArCWlmIChndF90b194ZShndCktPmluZm8uc2tpcF9ndWNfcGMpDQo+ID4gPiDCoAkJeGVf
Z3RfaWRsZV9kaXNhYmxlX2M2KGd0KTsNCj4gPiA+IC0JCXhlX2ZvcmNlX3dha2VfcHV0KGd0X3Rv
X2Z3KGd0KSwgZndfcmVmKTsNCj4gPiA+IC0JfQ0KPiA+ID4gDQo+ID4gPiDCoAlzeXNmc19yZW1v
dmVfZmlsZXMoa29iaiwgZ3RfaWRsZV9hdHRycyk7DQo+ID4gPiDCoAlrb2JqZWN0X3B1dChrb2Jq
KTsNCj4gPiA+IEBAIC0zOTAsMTQgKzM4NiwyMyBAQCB2b2lkIHhlX2d0X2lkbGVfZW5hYmxlX2M2
KHN0cnVjdCB4ZV9ndCAqZ3QpDQo+ID4gPiDCoAkJCVJDX0NUTF9IV19FTkFCTEUgfCBSQ19DVExf
VE9fTU9ERSB8DQo+ID4gUkNfQ1RMX1JDNl9FTkFCTEUpO8KgIH0NCj4gPiA+IA0KPiA+ID4gLXZv
aWQgeGVfZ3RfaWRsZV9kaXNhYmxlX2M2KHN0cnVjdCB4ZV9ndCAqZ3QpDQo+ID4gPiAraW50IHhl
X2d0X2lkbGVfZGlzYWJsZV9jNihzdHJ1Y3QgeGVfZ3QgKmd0KQ0KPiA+ID4gwqB7DQo+ID4gPiAt
CXhlX2RldmljZV9hc3NlcnRfbWVtX2FjY2VzcyhndF90b194ZShndCkpOw0KPiA+IA0KPiA+IEkn
bSBhZnJhaWQgeW91IG1pc3NlZCBteSBjb21tZW50IGFib3V0IHRoaXMgbGluZSBpbiB0aGUgcHJl
dmlvdXMNCj4gPiByZXZpZXcuDQo+ID4gDQo+ID4gVGhpcyBsaW5lIGhhcyBub3RoaW5nIHRvIGRv
IHdpdGggZm9yY2V3YWtlLCBzbyBpdCBzaG91bGQgcmVtYWluLg0KPiA+IG9yIGlmIHlvdSByZWFs
bHkgd2FudCB0byByZW1vdmUsIHBsZWFzZSBzZW5kIGl0IGluIGEgc2VwYXJhdGUgcGF0Y2gNCj4g
PiB3aXRoIHByb3Blcg0KPiA+IGV4cGxhbmF0aW9uLg0KPiA+IA0KPiA+IFRoYW5rcywNCj4gPiBS
b2RyaWdvLg0KPiA+IA0KPiA+ID4gLQl4ZV9mb3JjZV93YWtlX2Fzc2VydF9oZWxkKGd0X3RvX2Z3
KGd0KSwgWEVfRldfR1QpOw0KPiA+ID4gKwl1bnNpZ25lZCBpbnQgZndfcmVmOw0KPiA+ID4gDQo+
ID4gPiDCoAlpZiAoSVNfU1JJT1ZfVkYoZ3RfdG9feGUoZ3QpKSkNCj4gPiA+IC0JCXJldHVybjsN
Cj4gPiA+ICsJCXJldHVybiAwOw0KPiA+ID4gKw0KPiA+ID4gKwl4ZV9kZXZpY2VfYXNzZXJ0X21l
bV9hY2Nlc3MoZ3RfdG9feGUoZ3QpKTsNCj4gU29ycnkgSSBtaXNzZWQgeW91ciBwcmV2aW91cyBj
b21tZW50czsgSSBkaWQgbm90IHJlbW92ZSB0aGlzIGxpbmUuIA0KPiBNb3ZlIGl0IGhlcmUgc2lu
Y2Ugd2UgY291bGQgZGlyZWN0bHkgcmV0dXJuIGlmIFhlIGlzIHJ1bm5pbmcgaW4gU1JJT1YNCj4g
bW9kZS4NCg0Kb25seSBpZiBpdCBpcyBhIHNlcGFyYXRlIHBhdGNoIHBsZWFzZS4NCg0KPiA+ID4g
Kw0KPiA+ID4gKwlmd19yZWYgPSB4ZV9mb3JjZV93YWtlX2dldChndF90b19mdyhndCksIFhFX0ZX
X0dUKTsNCj4gPiA+ICsJaWYgKCFmd19yZWYpDQo+ID4gPiArCQlyZXR1cm4gLUVUSU1FRE9VVDsN
Cj4gPiA+IA0KPiA+ID4gwqAJeGVfbW1pb193cml0ZTMyKCZndC0+bW1pbywgUkNfQ09OVFJPTCwg
MCk7DQo+ID4gPiDCoAl4ZV9tbWlvX3dyaXRlMzIoJmd0LT5tbWlvLCBSQ19TVEFURSwgMCk7DQo+
ID4gPiArDQo+ID4gPiArCXhlX2ZvcmNlX3dha2VfcHV0KGd0X3RvX2Z3KGd0KSwgZndfcmVmKTsN
Cj4gPiA+ICsNCj4gPiA+ICsJcmV0dXJuIDA7DQo+ID4gPiDCoH0NCj4gPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfaWRsZS5oDQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndF9pZGxlLmggaW5kZXgNCj4gPiA+IDU5MWEwMWUxODFiYy4uOWMzNGExNTVlMTAy
DQo+ID4gPiAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9pZGxl
LmgNCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9pZGxlLmgNCj4gPiA+IEBA
IC0xMyw3ICsxMyw3IEBAIHN0cnVjdCB4ZV9ndDsNCj4gPiA+IA0KPiA+ID4gwqBpbnQgeGVfZ3Rf
aWRsZV9pbml0KHN0cnVjdCB4ZV9ndF9pZGxlICpndGlkbGUpO8KgIHZvaWQNCj4gPiA+IHhlX2d0
X2lkbGVfZW5hYmxlX2M2KHN0cnVjdCB4ZV9ndCAqZ3QpOyAtdm9pZA0KPiA+ID4geGVfZ3RfaWRs
ZV9kaXNhYmxlX2M2KHN0cnVjdCB4ZV9ndCAqZ3QpOw0KPiA+ID4gK2ludCB4ZV9ndF9pZGxlX2Rp
c2FibGVfYzYoc3RydWN0IHhlX2d0ICpndCk7DQo+ID4gPiDCoHZvaWQgeGVfZ3RfaWRsZV9lbmFi
bGVfcGcoc3RydWN0IHhlX2d0ICpndCk7wqAgdm9pZA0KPiA+ID4geGVfZ3RfaWRsZV9kaXNhYmxl
X3BnKHN0cnVjdCB4ZV9ndCAqZ3QpO8KgIGludA0KPiA+ID4geGVfZ3RfaWRsZV9wZ19wcmludChz
dHJ1Y3QgeGVfZ3QgKmd0LCBzdHJ1Y3QgZHJtX3ByaW50ZXIgKnApOw0KPiA+ID4gZGlmZg0KPiA+
ID4gLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3BjLmMNCj4gPiA+IGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2d1Y19wYy5jIGluZGV4IDBmODQzMGFjZDE2ZC4uODg1NTdlODZkNjM3
DQo+ID4gPiAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfcGMu
Yw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19wYy5jDQo+ID4gPiBAQCAt
MTA3Niw3ICsxMDc2LDYgQEAgaW50IHhlX2d1Y19wY19ndWNyY19kaXNhYmxlKHN0cnVjdA0KPiA+
ID4geGVfZ3VjX3BjDQo+ID4gPiAqcGMpwqAgew0KPiA+ID4gwqAJc3RydWN0IHhlX2RldmljZSAq
eGUgPSBwY190b194ZShwYyk7DQo+ID4gPiDCoAlzdHJ1Y3QgeGVfZ3QgKmd0ID0gcGNfdG9fZ3Qo
cGMpOw0KPiA+ID4gLQl1bnNpZ25lZCBpbnQgZndfcmVmOw0KPiA+ID4gwqAJaW50IHJldCA9IDA7
DQo+ID4gPiANCj4gPiA+IMKgCWlmICh4ZS0+aW5mby5za2lwX2d1Y19wYykNCj4gPiA+IEBAIC0x
MDg2LDE3ICsxMDg1LDcgQEAgaW50IHhlX2d1Y19wY19ndWNyY19kaXNhYmxlKHN0cnVjdA0KPiA+
ID4geGVfZ3VjX3BjICpwYykNCj4gPiA+IMKgCWlmIChyZXQpDQo+ID4gPiDCoAkJcmV0dXJuIHJl
dDsNCj4gPiA+IA0KPiA+ID4gLQlmd19yZWYgPSB4ZV9mb3JjZV93YWtlX2dldChndF90b19mdyhn
dCksDQo+ID4gPiBYRV9GT1JDRVdBS0VfQUxMKTsNCj4gPiA+IC0JaWYgKCF4ZV9mb3JjZV93YWtl
X3JlZl9oYXNfZG9tYWluKGZ3X3JlZiwNCj4gPiA+IFhFX0ZPUkNFV0FLRV9BTEwpKSB7DQo+ID4g
PiAtCQl4ZV9mb3JjZV93YWtlX3B1dChndF90b19mdyhndCksIGZ3X3JlZik7DQo+ID4gPiAtCQly
ZXR1cm4gLUVUSU1FRE9VVDsNCj4gPiA+IC0JfQ0KPiA+ID4gLQ0KPiA+ID4gLQl4ZV9ndF9pZGxl
X2Rpc2FibGVfYzYoZ3QpOw0KPiA+ID4gLQ0KPiA+ID4gLQl4ZV9mb3JjZV93YWtlX3B1dChndF90
b19mdyhndCksIGZ3X3JlZik7DQo+ID4gPiAtDQo+ID4gPiAtCXJldHVybiAwOw0KPiA+ID4gKwly
ZXR1cm4geGVfZ3RfaWRsZV9kaXNhYmxlX2M2KGd0KTsNCj4gPiA+IMKgfQ0KPiA+ID4gDQo+ID4g
PiDCoC8qKg0KPiA+ID4gLS0NCj4gPiA+IDIuNDMuMA0KPiA+ID4gDQo=
