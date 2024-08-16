Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28EC5C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 13:28:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C439F10E6D3;
	Fri, 16 Aug 2024 13:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OvZllJVb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F7E10E6F9
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 13:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723814933; x=1755350933;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=hpqS8n+MI7tsjQqTbO77kSLjkICFA7aaFHPbbMkF7SY=;
 b=OvZllJVb6nFj4aoEJQTjPBgv8Gpx8RyvR5x8qO8h0BmcDadFma+ndf+M
 q0kbf05jTvHBtuLSaST4WB7t94WiPWzzUvzzSOQLifykB9oW4tU30sjGV
 MgUKi9svTqljiTHvSMqx//0GJoF23Vn8IVilOmK0uhW8emAMcNA9z/ORt
 la/85URsaSgsOHHy7xOde2VbrND8FxQPrhR7MO5YYqzE7IHjio2X2xvPf
 SvkYd3VO5L30xeSkZ+RHqGUcHr3FECeD9tyBC0Jrvb1bx8ZX5qd0NaM+M
 Sd+bDM8zYMf70Uu84JVnthOMoUehHnwSMfTunVSv2SNRGntZGR7KHB73x Q==;
X-CSE-ConnectionGUID: t1Ts9ep5QCK+veJnle+tHA==
X-CSE-MsgGUID: gn5E/lzYSDmVlEdUrW6qGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="22252127"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="22252127"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 06:28:52 -0700
X-CSE-ConnectionGUID: QNnEIri4T1yTVGyFOvNZMA==
X-CSE-MsgGUID: 3cqtqd3YSGWIaM544W1XhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="59518589"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 06:28:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 06:28:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 06:28:52 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 06:28:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vD01hOD0pfRkKW12RlMlPB3yO8MxjI7gncOJFyHHPwEOIytE854qDPJCy69EhXX+JjYJqYEUghfVtxqHRDMnDb9EgXlsUwvmO6hzTnbh5T22sRUY2SsMthub50w5FtrJDmjPodQ7aiD73QWBQXLTDYTVAMsA7kysCiMihoDY6CXeiH+/sv4x3t7yn4T9z9CCdu5mYgX9w20ggvBBAwFehlHWMqD7P9bUirYUcKZZZm0Hp+StOQ0Iuk1BkcglYK9Ca/VfHlg7F6IbO75ODfhyrOmrmRORHYCiV5Kz0zDwsF+xU7SpQI9BjwE/Mka32htBff+o0OGixu9YI6exA3xKqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hpqS8n+MI7tsjQqTbO77kSLjkICFA7aaFHPbbMkF7SY=;
 b=FumiDWnp1JtZ0LpOBcC9hCU+8ayWSSBSI9qjThl1HLdio+Ir+li0ZL8XofKEV5ayvqfDUzFI4cXRuS4RLoQndxo67rJ37STOKPDHJ25WMUznlCXWu6txreQ0keTc8xx6mW4ooYwkZaHgFefP8dkqEVHYb2FYV1E5nwU/1Fy3IKRfK1TK24FmonWiqBDqtViPt1iKrd/gS3iVBPAaEe/N0cn4pB7GV+C/Nn7ajdmstc6OBOOewAHNUEHy29/Adx4zeF4kwcp4cAOOgpkEWJcC71PPpbqWxh5V9N/gbS3LvoFhAVrkdKbne9jRdkhgHI3Pe5LQfYtnRtKaiBH1UEUdIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ2PR11MB7425.namprd11.prod.outlook.com (2603:10b6:a03:4c0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Fri, 16 Aug
 2024 13:28:44 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%6]) with mapi id 15.20.7875.018; Fri, 16 Aug 2024
 13:28:44 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe: Add debugfs to dump GuC's hwconfig
Thread-Topic: [PATCH 1/2] drm/xe: Add debugfs to dump GuC's hwconfig
Thread-Index: AQHa7zhMUgwGn3zlOk2pSLZ+q8TZcLIov2yAgAAZHICAAE4PAIAAu2OA
Date: Fri, 16 Aug 2024 13:28:44 +0000
Message-ID: <9417b5b7f55c9ff2283820b5afd94efacfeeebcf.camel@intel.com>
References: <20240815172602.2729146-3-matthew.d.roper@intel.com>
 <Zr5gTbtkpfqlGgsx@DUT025-TGLU.fm.intel.com>
 <20240815213837.GJ5774@mdroper-desk1.amr.corp.intel.com>
 <Zr622GVl0utsp1ui@DUT025-TGLU.fm.intel.com>
In-Reply-To: <Zr622GVl0utsp1ui@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ2PR11MB7425:EE_
x-ms-office365-filtering-correlation-id: b32e0697-3364-42a2-85a3-08dcbdf759c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NU5xWjUzL2k4VDF6bU1UWGpZWXBsV1AvL2ZMSmFDNlJyV3dIc3MyOG1zcFgx?=
 =?utf-8?B?YWRuMGp6K1A5bVZMUXNqQXJad01JUUZSNUJMN1J2TGhWWlhBbGFIQXR3aDZy?=
 =?utf-8?B?clA5THRSZGY2NUpsU2ZXN1JQcitrVkN2Vzk3YTRPYTBFVlRoY2ppOHNIT0Zv?=
 =?utf-8?B?MUhFZGd3OSsyZlkvM0NuWmJtMkQxa3Y5VkNLcjNFVWdidG94dUxCdXhBcEF4?=
 =?utf-8?B?amRlem91V2REeGZsRENLaEw0aVI3SXdadHBqb3FxNjc4SWpaangwZGJGcUtx?=
 =?utf-8?B?dlVoTVV5RnVlUEtVOWdQYWVEK2gzcUlleDN1Qnplbkk1WGpBNTR4M05NY255?=
 =?utf-8?B?K2NFVHk2ZFcvcjU5MU9IVjlMTEVLOFdMNXhIamxiRjR6TUNvYTZsYmlkVFht?=
 =?utf-8?B?Mk1RRFR1aTNnK2N1M01tUUZzK00zWjkwRmF2eW5ySVFGSlExdWwxZld3MjVJ?=
 =?utf-8?B?VStSMy8xQjZmUVJKdEtnbW1IUHFSUnVPN1dEempNQzRYUXNiUitwRDZsdk9o?=
 =?utf-8?B?ajdvck9UNEhpWjJoSitqbndPOCtOUm4xUDVBWUhPQ09PcXR0TTM4NEF2Vldy?=
 =?utf-8?B?a0lmUElWV0c2UllEeWpYSDNXVGxWcnBrVXplTDN5cnAwZ0VJM3VMYmVDeGxX?=
 =?utf-8?B?bXQ3REZMMTBucUdoUnFrdWxyZUFJRkg1ZC9RbFFUK0x5SjQvNkFycWYweTBV?=
 =?utf-8?B?bmRHNWhxbFY5VllpTjE5eXlEQkxld2ttWDVmV3BBZXJFNEdIb1IzN2NubXMv?=
 =?utf-8?B?TlNVWUIwUnc5Unl2WkIzV1lJa0cra2JhWEFOUlRLYXB4ZW5SOWtJeVZwd1dw?=
 =?utf-8?B?WngzSC9uRkF4UDBZa1ZtZTYwSHhBZHplaEk1Z3pHaTdMbm9rSW9DK252dWNL?=
 =?utf-8?B?OStsdW9uSnhRN2FSYlNyUW1sQkxaU0tzNU9xNm5LdUJ5bE1Yb1VHRVdZSmtW?=
 =?utf-8?B?YXVsSGwwdjdMd21BMW01Q1BoZDlEQ1QwMnI4L3BWbU4zWGR2Nm1LQWhNcjlG?=
 =?utf-8?B?T1U5ZVU4TEVxd1ZvZS9JWUtOOXFxSWQ3U01yNlNHSDJaRDJFb1BlQ202WnpK?=
 =?utf-8?B?c2NhcFNOV3FGUnpRQzJtblllU3R1cng2TWZCRm1IcEd6eWluNnUyTy9ZNnl4?=
 =?utf-8?B?NnZVWmNGN0tkd0xGTGR1cDkwZFRKZ0xiSXIxQzdKeDlHMWRnTkZNNnNDM0Y3?=
 =?utf-8?B?M2VKM0FRZ2IwVHlhU2RHSFhkbldKd21ZVllLc05TbXR3aGFzc2cvb3FjN0Zy?=
 =?utf-8?B?L0JIaUNTb1BaTUpYVWFnSHVtS0oySzlmSkF4Qkhaa1lEdWM1OFZPN3Y4T1Ay?=
 =?utf-8?B?M1dIbWNZbW5mcUoyRFZTb3hrR0M5L1VmbUhrUU1YNEYrWk5yZkdxQUM4b2Qr?=
 =?utf-8?B?bGhZYmgvdWJaWENQZ1E1dzBwazVDVTFLNW03eVkzQVJJRktHZ0t6U3p6RGlr?=
 =?utf-8?B?WkJsOGRKMEpFeW9MMzd3Nzc5NTBaYm9jMzNJdU9GV0RuWklwaGFGZXk4ckU0?=
 =?utf-8?B?NzVyZ3NCdnlHcnBFQk8xRG15WG5nVXh4QWM2bExlREh0WkJuWTFqUmo1Yitm?=
 =?utf-8?B?dWFpRW45VFM5bVZ5MFdUMWZsa21pRXMxL01MK1NxRncxZk9QVnZGYWdGRXRZ?=
 =?utf-8?B?V0RJOGhBUTk5aElNaExSeUREMTdPT2Y4T1c4bmJLdDJuZUJ3d29wYjJQT2J0?=
 =?utf-8?B?ZFpjejc2RnlRNFl0T3hGWTZkN1RxbEZPNnlpVGdMYzdDS2I1R0V4ZjhPMklW?=
 =?utf-8?B?YTQ0Sy9lWGhuVWh2Q0NCRVFKc0hJKzV4MW9rVVJITWhhSUtjUWdqOE5BY0pF?=
 =?utf-8?B?RjExbGx5L1Z5UGFlSndIYXNOblAwVDZQbE9HdTdOTEIzbHQ2N3FFK0dCNkNZ?=
 =?utf-8?B?Y2Z6ZDhvaFN0dVcxcGJoSjBkNjBCNDVoMjVSSU5na25QcXc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Znd1NXhJUFZnOHJyZzlVbFQxYkhValp6bER4VXd0N1ZVeU5MU2lZSkN2QUtH?=
 =?utf-8?B?YjJrVE5LKys2d2xVSnVWQ1ROS0JtWWlSMFg3SjE4MTA5ZFdCOFRkcEFlSXpv?=
 =?utf-8?B?UHZvOHRVRmhOVUphV0R0OTlTZGxBNlVnMEpkYnlpWUhwRy9uL2JZNFcvLzJn?=
 =?utf-8?B?dlpzS080MmI4bWNRM0JXb1NpQityS1VFaVpDWkhoeVZjc3JWdW9TdG43bzR4?=
 =?utf-8?B?RUlEc21zR3hzdWh4NzBuZXZVQTdVdnBvQ0wvcWg1RFdIVDFjbCtpMk4zSFNE?=
 =?utf-8?B?NVNRUTgzYmR3bW9HRmFBMG85alRPT3VGTzhndWxtaVk1cWMzZmhIaHB3cmNq?=
 =?utf-8?B?azFTR1kyYXliaVJuZ1JZNjU5bWx4K0NkbUtKV2FldmVFNGp3c09vNWJuTHdP?=
 =?utf-8?B?aC8rMW9tV2RLdmJlT0RTN1JJZ3phNWJqZ2JnTnBpM09mL1ptY1l4UU5DYnps?=
 =?utf-8?B?UGptY2Q4cmdhbE5qVDkxOGpkNG5zWmJEVDdsclB0aFBmbm1VaVdqWWo1Nlo0?=
 =?utf-8?B?QWNkUGZoazh4bitOSk4vK2YvdjluRVE0YkRrRVhWcW1rcVZQd3R6OWQxcE9N?=
 =?utf-8?B?WnJ1Q09QRTFuTGJMRFlNbk5xbmxXUmRJSnF6b0IyaWxzNlg2c1JxMVZ0ZlJz?=
 =?utf-8?B?QzdOTHFuR05uSTUzSFdZeVBEWUpWMVAxZVlBZXhGOHZtZ1FtbzlZMXhteThE?=
 =?utf-8?B?dVNNbTFmUW9rV1FFRDZmdHJuaUlZR09zQjg5RnVBM21Ca2NnNUVrd3d0V1VF?=
 =?utf-8?B?Qjl5Z1hzZzhoUy9neVdlS1BOVzB0Tm5jTDdlaFFzemY1TkoxU21NdmhFQkJP?=
 =?utf-8?B?dWtQMGZkSlFGMy8yZitibTVGdW5MWFgyODZERGxxN0hSQ2MzUm1GRFI3MWxx?=
 =?utf-8?B?SXNwRHE2WEVhMWVxWTd0N2VqVkhWTysxK0lLNlhnUEQ2TkxPcUN2QTE2TlJp?=
 =?utf-8?B?d2E2bC9CV21uOHo5aXFteU92bjRRWFlzaC9pTmFlZ0FGdkExRGp0SUc2ZEo3?=
 =?utf-8?B?dTNyeTFvdE9KU2VrM05tVUZSdnVYY0JmRndjbWlpa0pZMmkvSytXN3J1YlFi?=
 =?utf-8?B?QlcrWTZmOXNwZkprc0pnZHBDd3JjMkk3RFJlQnJJTGZiQlE0aFpxNyt5Tjdm?=
 =?utf-8?B?ekRnaVpId2RqRk1tb3ZnVXRsSmhNMWthdFFPMkdXL2RickN6RmFSVkZWcUV4?=
 =?utf-8?B?WVVub1RzcHpMeVBUQWRaYWlLZlluZjBVeDM3T2NGUTJwcGZTckhmSGM1ekRU?=
 =?utf-8?B?TnBrb1pwTUZHQmFRWktMQUdma1g0QkNxT2hyZ1JrTFluNzBHaHRWQkwrWUtl?=
 =?utf-8?B?cDhsSDcydnRpU3BkMDFEdkdLVFkrN3owWTdiKzUwaXh4MkxoKzB5Y3o1QWx3?=
 =?utf-8?B?RS9qWWg2bmM4MkhBNG84cHJpN3dCU1pOcjNQeTQ1dFZDNkVZSWR3elNVOVNp?=
 =?utf-8?B?bmxhT3pKWVFHZ01lMEdiK01CenBWclFtUlMrVDIwd09SM29jRXg4WFRBTjlm?=
 =?utf-8?B?VTBjU3dFY2l0cHNJTWYvc0RyL2IyaG5hanMwVWRzTkt1M0dET1lKMS9UOThx?=
 =?utf-8?B?TnhQTWdwbjRGQ2dOYUlKMW5GdUpydWV4VklOd3UxNnpWbUNJK1p5bVY5RHJU?=
 =?utf-8?B?aHkrOHdGVTIxTllkeTNyZEtRaGVUa2x3bmNab01NcU1PZ0dlYWU1Nm1Uc2tl?=
 =?utf-8?B?OGRIZVhDWnNTUEo0b1J1MkZPeHRBbWc1TXZRNHZjNDIxaC9RcWcwbUJLUUlS?=
 =?utf-8?B?cDlKbk9GdDg4VlJQaFhGTUJKVDBaU1dhT2lBMFVmZ3BoYmkzUWovaWFPcHFq?=
 =?utf-8?B?ZjZsb1U2VUpHT2hYTFNJQytlcm9GN1dEVU1aTHA3U25ORGUyNU9BNU0raE9F?=
 =?utf-8?B?RFZoVkJLUXplRStTSFcwaisvdDBma0lrbE5FRmlqZHF3K3BQMkkvSU85bUZj?=
 =?utf-8?B?UWZFK0J0dnNyL1RrOVBuRzlVQ3llc2pkb3pTUStOTXJseTRzck1LR1UzZFhZ?=
 =?utf-8?B?ZlhtdXNtaHY3aGVyV2hvSzI5YW10TVN0NUtiMEVWTUxZeGwxWG1FRTExLzZP?=
 =?utf-8?B?YkRYKytrWldyNWMyd010M3p0SW5VdU51SzJkcUMzRWNvT2JYSlhMMnJ2N2Zq?=
 =?utf-8?B?a0l1YmlBS2JSTjZDaUJCak1ZZDd6MXNKLzhSTmw1d09rNDVSamdFNmRWaWVj?=
 =?utf-8?B?Y3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <831F03131459C148ABBA568D752A4EFE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b32e0697-3364-42a2-85a3-08dcbdf759c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2024 13:28:44.0215 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qo77TD1AN4QcVHhHwnFS4iogMpEQox0JYlaYLphWKjYCbGXXsD7voS2B51SJTp3aITmZsj+YWAr/QokgkY3GMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7425
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

T24gRnJpLCAyMDI0LTA4LTE2IGF0IDAyOjE4ICswMDAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBUaHUsIEF1ZyAxNSwgMjAyNCBhdCAwMjozODozN1BNIC0wNzAwLCBNYXR0IFJvcGVyIHdy
b3RlOg0KPiA+IE9uIFRodSwgQXVnIDE1LCAyMDI0IGF0IDA4OjA4OjQ1UE0gKzAwMDAsIE1hdHRo
ZXcgQnJvc3Qgd3JvdGU6DQo+ID4gPiBPbiBUaHUsIEF1ZyAxNSwgMjAyNCBhdCAxMDoyNjowM0FN
IC0wNzAwLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiA+ID4gPiBBbHRob3VnaCB0aGUgcXVlcnkgdWFw
aSBpcyB0aGUgb2ZmaWNpYWwgd2F5IHRvIGdldCBhdCB0aGUgR3VDJ3MgaHdjb25maWcNCj4gPiA+
ID4gdGFibGUgY29udGVudHMsIGl0J3Mgc3RpbGwgdXNlZnVsIHRvIGhhdmUgYSBxdWljayBkZWJ1
Z2ZzIGludGVyZmFjZSB0bw0KPiA+ID4gPiBkdW1wIHRoZSB0YWJsZSBpbiBhIGh1bWFuLXJlYWRh
YmxlIGZvcm1hdCB3aGlsZSBkZWJ1Z2dpbmcgdGhlIGRyaXZlci4NCj4gPiA+ID4gDQo+ID4gPiAN
Cj4gPiA+IFBhdGNoIGl0c2VsZiBtYWtlcyBzZW5zZS4gUXVlc3Rpb24gdGhvdWdoLCB3b3VsZCB0
aGlzIGJlIHVzZWZ1bCB0bw0KPiA+ID4gaW5jbHVkZSBkZXZjb3JlZHVtcD8gSWYgc28gd2Ugc2hv
dWxkIGNvZGUgdGhpcyB3aXRoIHRoZSBzbmFwIHNlbWFudGljcw0KPiA+ID4gZm9yIGRlY29yZWR1
bXAuIFNlZSBndWNfZXhlY19xdWV1ZV9wcmludCgpIGZvciBhbiBleGFtcGxlIG9mIHRoaXMuDQo+
ID4gDQo+ID4gWW91IG1lYW4gaW5jbHVkZSB0aGUgY29udGVudHMgb2YgdGhlIGh3Y29uZmlnIHdp
dGhpbiB0aGUgZGV2Y29yZWR1bXANCj4gPiByZXBvcnQ/ICBJIGRvbid0IHJlYWxseSBoYXZlIGEg
ZmVlbCBmb3Igd2hldGhlciBhbnlvbmUgd291bGQgZmluZCB0aGF0DQo+IA0KPiBZZXMsIGV4YWN0
bHkgLSBpbmNsdWRlIGh3Y29uZmlnIHdpdGhpbiB0aGUgZGV2Y29yZWR1bXAgcmVwb3J0Lg0KDQpG
b3IgY3VycmVudCBwbGF0Zm9ybXMgSSBkb24ndCBzZWUgYSByZWFzb24gdG8gYWRkIGl0IHRvIGRl
dmNvcmVkdW1wIGJ1dCBtYXliZSBmb3IgZnV0dXJlIHBsYXRmb3Jtcy4uLg0KDQpCdXQgc291bmRz
IGdvb2QgdG8gaGF2ZSBpbiBkZWJ1Z2ZzLg0KDQo+IA0KPiBEb24ndCB3YW50IHRvIGhvbGQgdXAg
dGhlIHBhdGNoIGFzIEkgc2FpZCBpdCBMR1RNIGJ1dCBqdXN0IHNvbWV0aGluZyB0bw0KPiBjb25z
aWRlciBhbmQgaWYgSm9zZSAob3Igc29tZW9uZSBvbiB0aGUgS01EKSBpbmRpY2F0ZXMgdGhpcyBj
b3VsZCBiZQ0KPiB1c2VmdWwgaXQgaXMgZWFzeSBlbm91Z2ggdG8gY2hhbmdlIHRvIHVzZSBzbmFw
IHNlbWFudGljcyBhbmQgd2lyZSBpbnRvDQo+IGRldmNvcmVkdW1wIHRvby4NCj4gDQo+IE1hdHQN
Cj4gDQo+ID4gdXNlZnVsIG9yIG5vdC4gIE15IHBlcnNvbmFsIHVzZSBjYXNlIGlzIGp1c3QgYmVp
bmcgYWJsZSB0byBzaXQgZG93biBhdA0KPiA+IGFuIHVuZmFtaWxpYXIgbWFjaGluZSBhbmQgJ2Nh
dCcgdGhlIGRlYnVnZnMgdG8gc2VlIHdoYXQgdGhlIGh3Y29uZmlnDQo+ID4gY2hhcmFjdGVyaXN0
aWNzIG9mIHRoZSBHUFUgYXJlIGJlZm9yZSBJIHN0YXJ0IGRvaW5nIGV4cGVyaW1lbnRzLg0KPiA+
IA0KPiA+ICtDYyBKb3NlIGZvciBhIFVNRCBwZXJzcGVjdGl2ZSBvbiB3aGV0aGVyIG9yIG5vdCBp
dCB3b3VsZCBhbHNvIGJlIHVzZWZ1bA0KPiA+IHRvIGNhcHR1cmUgdGhlIGh3Y29uZmlnIGNvbnRl
bnRzIGluIHRoZSBkZXZjb3JlZHVtcCBmb3IgdXNlcnNwYWNlDQo+ID4gZGVidWdnaW5nLg0KPiA+
IA0KPiA+IA0KPiA+IE1hdHQNCj4gPiANCj4gPiA+IA0KPiA+ID4gTWF0dCANCj4gPiA+IA0KPiA+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29t
Pg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9kZWJ1Z2Zz
LmMgICB8IDExICsrKysrKw0KPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19od2Nv
bmZpZy5jIHwgNTcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ID4gPiAgZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2d1Y19od2NvbmZpZy5oIHwgIDIgKw0KPiA+ID4gPiAgMyBmaWxlcyBj
aGFuZ2VkLCA3MCBpbnNlcnRpb25zKCspDQo+ID4gPiA+IA0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X2RlYnVnZnMuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ndF9kZWJ1Z2ZzLmMNCj4gPiA+ID4gaW5kZXggNTEyNWQ3NmNjZmFjLi44Zjk1ZDNhNTk0OWIg
MTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9kZWJ1Z2ZzLmMN
Cj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X2RlYnVnZnMuYw0KPiA+ID4g
PiBAQCAtMTksNiArMTksNyBAQA0KPiA+ID4gPiAgI2luY2x1ZGUgInhlX2d0X3NyaW92X3ZmX2Rl
YnVnZnMuaCINCj4gPiA+ID4gICNpbmNsdWRlICJ4ZV9ndF9zdGF0cy5oIg0KPiA+ID4gPiAgI2lu
Y2x1ZGUgInhlX2d0X3RvcG9sb2d5LmgiDQo+ID4gPiA+ICsjaW5jbHVkZSAieGVfZ3VjX2h3Y29u
ZmlnLmgiDQo+ID4gPiA+ICAjaW5jbHVkZSAieGVfaHdfZW5naW5lLmgiDQo+ID4gPiA+ICAjaW5j
bHVkZSAieGVfbHJjLmgiDQo+ID4gPiA+ICAjaW5jbHVkZSAieGVfbWFjcm9zLmgiDQo+ID4gPiA+
IEBAIC0yNzAsNiArMjcxLDE1IEBAIHN0YXRpYyBpbnQgdmVjc19kZWZhdWx0X2xyYyhzdHJ1Y3Qg
eGVfZ3QgKmd0LCBzdHJ1Y3QgZHJtX3ByaW50ZXIgKnApDQo+ID4gPiA+ICAJcmV0dXJuIDA7DQo+
ID4gPiA+ICB9DQo+ID4gPiA+ICANCj4gPiA+ID4gK3N0YXRpYyBpbnQgaHdjb25maWcoc3RydWN0
IHhlX2d0ICpndCwgc3RydWN0IGRybV9wcmludGVyICpwKQ0KPiA+ID4gPiArew0KPiA+ID4gPiAr
CXhlX3BtX3J1bnRpbWVfZ2V0KGd0X3RvX3hlKGd0KSk7DQo+ID4gPiA+ICsJeGVfZ3VjX2h3Y29u
ZmlnX2R1bXAoJmd0LT51Yy5ndWMsIHApOw0KPiA+ID4gPiArCXhlX3BtX3J1bnRpbWVfcHV0KGd0
X3RvX3hlKGd0KSk7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKwlyZXR1cm4gMDsNCj4gPiA+ID4gK30N
Cj4gPiA+ID4gKw0KPiA+ID4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1faW5mb19saXN0IGRl
YnVnZnNfbGlzdFtdID0gew0KPiA+ID4gPiAgCXsiaHdfZW5naW5lcyIsIC5zaG93ID0geGVfZ3Rf
ZGVidWdmc19zaW1wbGVfc2hvdywgLmRhdGEgPSBod19lbmdpbmVzfSwNCj4gPiA+ID4gIAl7ImZv
cmNlX3Jlc2V0IiwgLnNob3cgPSB4ZV9ndF9kZWJ1Z2ZzX3NpbXBsZV9zaG93LCAuZGF0YSA9IGZv
cmNlX3Jlc2V0fSwNCj4gPiA+ID4gQEAgLTI4OCw2ICsyOTgsNyBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGRybV9pbmZvX2xpc3QgZGVidWdmc19saXN0W10gPSB7DQo+ID4gPiA+ICAJeyJkZWZhdWx0
X2xyY192Y3MiLCAuc2hvdyA9IHhlX2d0X2RlYnVnZnNfc2ltcGxlX3Nob3csIC5kYXRhID0gdmNz
X2RlZmF1bHRfbHJjfSwNCj4gPiA+ID4gIAl7ImRlZmF1bHRfbHJjX3ZlY3MiLCAuc2hvdyA9IHhl
X2d0X2RlYnVnZnNfc2ltcGxlX3Nob3csIC5kYXRhID0gdmVjc19kZWZhdWx0X2xyY30sDQo+ID4g
PiA+ICAJeyJzdGF0cyIsIC5zaG93ID0geGVfZ3RfZGVidWdmc19zaW1wbGVfc2hvdywgLmRhdGEg
PSB4ZV9ndF9zdGF0c19wcmludF9pbmZvfSwNCj4gPiA+ID4gKwl7Imh3Y29uZmlnIiwgLnNob3cg
PSB4ZV9ndF9kZWJ1Z2ZzX3NpbXBsZV9zaG93LCAuZGF0YSA9IGh3Y29uZmlnfSwNCj4gPiA+ID4g
IH07DQo+ID4gPiA+ICANCj4gPiA+ID4gIHZvaWQgeGVfZ3RfZGVidWdmc19yZWdpc3RlcihzdHJ1
Y3QgeGVfZ3QgKmd0KQ0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d1Y19od2NvbmZpZy5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19od2NvbmZpZy5jDQo+
ID4gPiA+IGluZGV4IGQ5YjU3MGExNTRhMi4uMDI1YmFkNzAxNTU2IDEwMDY0NA0KPiA+ID4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2h3Y29uZmlnLmMNCj4gPiA+ID4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19od2NvbmZpZy5jDQo+ID4gPiA+IEBAIC02LDYgKzYs
NyBAQA0KPiA+ID4gPiAgI2luY2x1ZGUgInhlX2d1Y19od2NvbmZpZy5oIg0KPiA+ID4gPiAgDQo+
ID4gPiA+ICAjaW5jbHVkZSA8ZHJtL2RybV9tYW5hZ2VkLmg+DQo+ID4gPiA+ICsjaW5jbHVkZSA8
ZHJtL2RybV9wcmludC5oPg0KPiA+ID4gPiAgDQo+ID4gPiA+ICAjaW5jbHVkZSAiYWJpL2d1Y19h
Y3Rpb25zX2FiaS5oIg0KPiA+ID4gPiAgI2luY2x1ZGUgInhlX2JvLmgiDQo+ID4gPiA+IEBAIC0x
MDMsMyArMTA0LDU5IEBAIHZvaWQgeGVfZ3VjX2h3Y29uZmlnX2NvcHkoc3RydWN0IHhlX2d1YyAq
Z3VjLCB2b2lkICpkc3QpDQo+ID4gPiA+ICAJeGVfbWFwX21lbWNweV9mcm9tKHhlLCBkc3QsICZn
dWMtPmh3Y29uZmlnLmJvLT52bWFwLCAwLA0KPiA+ID4gPiAgCQkJICAgZ3VjLT5od2NvbmZpZy5z
aXplKTsNCj4gPiA+ID4gIH0NCj4gPiA+ID4gKw0KPiA+ID4gPiArdm9pZCB4ZV9ndWNfaHdjb25m
aWdfZHVtcChzdHJ1Y3QgeGVfZ3VjICpndWMsIHN0cnVjdCBkcm1fcHJpbnRlciAqcCkNCj4gPiA+
ID4gK3sNCj4gPiA+ID4gKwlzaXplX3Qgc2l6ZSA9IHhlX2d1Y19od2NvbmZpZ19zaXplKGd1Yyk7
DQo+ID4gPiA+ICsJdTMyICpod2NvbmZpZzsNCj4gPiA+ID4gKwl1NjQgbnVtX2R3Ow0KPiA+ID4g
PiArCXUzMiBleHRyYV9ieXRlczsNCj4gPiA+ID4gKwlpbnQgaSA9IDA7DQo+ID4gPiA+ICsNCj4g
PiA+ID4gKwlpZiAoc2l6ZSA9PSAwKSB7DQo+ID4gPiA+ICsJCWRybV9wcmludGYocCwgIk5vIGh3
Y29uZmlnIGF2YWlsYWJsZVxuIik7DQo+ID4gPiA+ICsJCXJldHVybjsNCj4gPiA+ID4gKwl9DQo+
ID4gPiA+ICsNCj4gPiA+ID4gKwludW1fZHcgPSBkaXZfdTY0X3JlbShzaXplLCBzaXplb2YodTMy
KSwgJmV4dHJhX2J5dGVzKTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArCWh3Y29uZmlnID0ga3phbGxv
YyhzaXplLCBHRlBfS0VSTkVMKTsNCj4gPiA+ID4gKwlpZiAoIWh3Y29uZmlnKSB7DQo+ID4gPiA+
ICsJCWRybV9wcmludGYocCwgIkVycm9yOiBjb3VsZCBub3QgYWxsb2NhdGUgaHdjb25maWcgbWVt
b3J5XG4iKTsNCj4gPiA+ID4gKwkJcmV0dXJuOw0KPiA+ID4gPiArCX0NCj4gPiA+ID4gKw0KPiA+
ID4gPiArCXhlX2d1Y19od2NvbmZpZ19jb3B5KGd1YywgaHdjb25maWcpOw0KPiA+ID4gPiArDQo+
ID4gPiA+ICsJLyogQW4gZW50cnkgcmVxdWlyZXMgYXQgbGVhc3QgdGhyZWUgZHdvcmRzIGZvciBr
ZXksIGxlbmd0aCwgdmFsdWUgKi8NCj4gPiA+ID4gKwl3aGlsZSAoaSArIDMgPD0gbnVtX2R3KSB7
DQo+ID4gPiA+ICsJCXUzMiBhdHRyaWJ1dGUgPSBod2NvbmZpZ1tpKytdOw0KPiA+ID4gPiArCQl1
MzIgbGVuX2R3ID0gaHdjb25maWdbaSsrXTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArCQlpZiAoaSAr
IGxlbl9kdyA+IG51bV9kdykgew0KPiA+ID4gPiArCQkJZHJtX3ByaW50ZihwLCAiRXJyb3I6IEF0
dHJpYnV0ZSAldSBpcyAldSBkd29yZHMsIGJ1dCBvbmx5ICVsbHUgcmVtYWluXG4iLA0KPiA+ID4g
PiArCQkJCSAgIGF0dHJpYnV0ZSwgbGVuX2R3LCBudW1fZHcgLSBpKTsNCj4gPiA+ID4gKwkJCWxl
bl9kdyA9IG51bV9kdyAtIGk7DQo+ID4gPiA+ICsJCX0NCj4gPiA+ID4gKw0KPiA+ID4gPiArCQkv
Kg0KPiA+ID4gPiArCQkgKiBJZiBpdCdzIGEgc2luZ2xlIGR3b3JkIChhcyBtb3N0IGh3Y29uZmln
IGF0dHJpYnV0ZXMgYXJlKSwNCj4gPiA+ID4gKwkJICogdGhlbiBpdCdzIHByb2JhYmx5IGEgbnVt
YmVyIHRoYXQgbWFrZXMgc2Vuc2UgdG8gZGlzcGxheQ0KPiA+ID4gPiArCQkgKiBpbiBkZWNpbWFs
IGZvcm0uICBJbiB0aGUgcmFyZSBjYXNlcyB3aGVyZSBpdCdzIG1vcmUgdGhhbg0KPiA+ID4gPiAr
CQkgKiBvbmUgZHdvcmQsIGp1c3QgcHJpbnQgaXQgaW4gaGV4IGZvcm0gYW5kIGxldCB0aGUgdXNl
cg0KPiA+ID4gPiArCQkgKiBmaWd1cmUgb3V0IGhvdyB0byBpbnRlcnByZXQgaXQuDQo+ID4gPiA+
ICsJCSAqLw0KPiA+ID4gPiArCQlpZiAobGVuX2R3ID09IDEpDQo+ID4gPiA+ICsJCQlkcm1fcHJp
bnRmKHAsICJbJTJ1XSA9ICV1XG4iLCBhdHRyaWJ1dGUsIGh3Y29uZmlnW2ldKTsNCj4gPiA+ID4g
KwkJZWxzZQ0KPiA+ID4gPiArCQkJZHJtX3ByaW50ZihwLCAiWyUydV0gPSB7ICUqcGggfVxuIiwg
YXR0cmlidXRlLA0KPiA+ID4gPiArCQkJCSAgIChpbnQpKGxlbl9kdyAqIHNpemVvZih1MzIpKSwg
Jmh3Y29uZmlnW2ldKTsNCj4gPiA+ID4gKwkJaSArPSBsZW5fZHc7DQo+ID4gPiA+ICsJfQ0KPiA+
ID4gPiArDQo+ID4gPiA+ICsJaWYgKGkgPCBudW1fZHcgfHwgZXh0cmFfYnl0ZXMpDQo+ID4gPiA+
ICsJCWRybV9wcmludGYocCwgIkVycm9yOiAlbGx1IGV4dHJhIGJ5dGVzIGF0IGVuZCBvZiBod2Nv
bmZpZ1xuIiwNCj4gPiA+ID4gKwkJCSAgIChudW1fZHcgLSBpKSAqIHNpemVvZih1MzIpICsgZXh0
cmFfYnl0ZXMpOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsJa2ZyZWUoaHdjb25maWcpOw0KPiA+ID4g
PiArfQ0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19od2Nv
bmZpZy5oIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19od2NvbmZpZy5oDQo+ID4gPiA+IGlu
ZGV4IGI1Nzk0ZDY0MTkwMC4uN2RmMzE1OTAwZTFjIDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2h3Y29uZmlnLmgNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2d1Y19od2NvbmZpZy5oDQo+ID4gPiA+IEBAIC04LDEwICs4LDEyIEBADQo+
ID4gPiA+ICANCj4gPiA+ID4gICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPg0KPiA+ID4gPiAgDQo+
ID4gPiA+ICtzdHJ1Y3QgZHJtX3ByaW50ZXI7DQo+ID4gPiA+ICBzdHJ1Y3QgeGVfZ3VjOw0KPiA+
ID4gPiAgDQo+ID4gPiA+ICBpbnQgeGVfZ3VjX2h3Y29uZmlnX2luaXQoc3RydWN0IHhlX2d1YyAq
Z3VjKTsNCj4gPiA+ID4gIHUzMiB4ZV9ndWNfaHdjb25maWdfc2l6ZShzdHJ1Y3QgeGVfZ3VjICpn
dWMpOw0KPiA+ID4gPiAgdm9pZCB4ZV9ndWNfaHdjb25maWdfY29weShzdHJ1Y3QgeGVfZ3VjICpn
dWMsIHZvaWQgKmRzdCk7DQo+ID4gPiA+ICt2b2lkIHhlX2d1Y19od2NvbmZpZ19kdW1wKHN0cnVj
dCB4ZV9ndWMgKmd1Yywgc3RydWN0IGRybV9wcmludGVyICpwKTsNCj4gPiA+ID4gIA0KPiA+ID4g
PiAgI2VuZGlmDQo+ID4gPiA+IC0tIA0KPiA+ID4gPiAyLjQ1LjINCj4gPiA+ID4gDQo+ID4gDQo+
ID4gLS0gDQo+ID4gTWF0dCBSb3Blcg0KPiA+IEdyYXBoaWNzIFNvZnR3YXJlIEVuZ2luZWVyDQo+
ID4gTGludXggR1BVIFBsYXRmb3JtIEVuYWJsZW1lbnQNCj4gPiBJbnRlbCBDb3Jwb3JhdGlvbg0K
DQo=
