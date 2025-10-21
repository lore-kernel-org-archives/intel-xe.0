Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522D6CCD1AF
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 16:02:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B3D10E614;
	Tue, 21 Oct 2025 16:02:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uvo4TnuZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC6910E618
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 16:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761062540; x=1792598540;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Dc83kpvVnhYSHLJLALYhaFv6jdo5mrYj8SvnuerF+Wo=;
 b=Uvo4TnuZz4qwOAIenw1xKPqyy0r2oCB5v5wnW6ZJPPcz9nCGSM94Aq00
 MzLJdAtvE2iNnzdlcM4xW5fFapPnUKoH3eZPm13pbpRYuhCQM+6MQqbfB
 Jxil8Lg2L4A4vYYblXzHw313G9nIggJCWCqzqMMv/8t9ReudeYvva/tUl
 YTPwvWBdHnkBmH8ybqz1YG3pR5YeJYMxje3mb01tGeCAyBRECcwdoDkjB
 GEH0hFuYhj8bfC1KqbB7kjWspTfwS7TS2daK2uiD60Zuvwk/H+OFAJzzY
 oN2ud3kApMyQdXhzOE50PfNQFwI0Gpno1Upfjkajz2E+ZIEg6w3EBsgxW w==;
X-CSE-ConnectionGUID: UCLwaFf7SF2n3Bcjrb8yug==
X-CSE-MsgGUID: TR/zzjo5TeOoKUK1+DAnsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62224486"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="62224486"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 09:02:20 -0700
X-CSE-ConnectionGUID: 4DurViC8Qmu4D7t3lg2ZAA==
X-CSE-MsgGUID: YXDGKcfPTueqh6DsnsM0aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="188911954"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 09:02:20 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 09:02:19 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 09:02:19 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.68) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 09:02:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MpWGHNO1Ie9pfNw5Upu4OQFSkHjrZVlGgJ6hYLaaU5ZAcOF0HrphykpbqQxByuLuKEiJ7ToIchMl2Pj1+cxXrlvG3WqbmTv3u8HeYqZnPiyxk/q64vfhBuDM3Nyia9rKR55GR/Z/CqN6Coos/B054hLzF2KwwCGbp+wIeF2xzUaOI5b6+EEucPqIrqsSIBlzUGP/Uhl6MhVbINXWimup7DhfwtZU1jSv3Qs931IBM2+hZ9HhbFnqbT7jMfnftFt6ybsmTyGy35D08NdVIFtpCpnTPyKbl5sJUuH094cqxhcPmo7NG5hJpRyge+1V+WUamvXwasC3M0u8dZig91gVPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dc83kpvVnhYSHLJLALYhaFv6jdo5mrYj8SvnuerF+Wo=;
 b=LvHDlsjwRHJfA/2m8xiJS+WJ2UPpIgSBh898BsZ3oCpvR6Wx8XxUADODDaXKbHzngPEgW+QL8/3KkxpymJ3RWYTh5EXkrGB429VIE3IBeHaB77wH+gzphNd4vN9vMoGkzH99bNhzlg51tJ1fMj0Fm/mQklQtFEVmbCg+LyskuEmZ2SwbffWUyq9XhihG6ahmTvYcGFHx0pxW7Mb3hfqLC/gDw4MMaMMucAUWWO/UK5Ok7parZqSz4hm9+iszmN0GBkBOVpTNlq+Mo34Du37d7Z0d0lYsVP/4+RUfRr4lGQ42EEI0WMnOUtkrc2Ve2M3DHXMDm0uMD44219jurmrEvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CH8PR11MB9458.namprd11.prod.outlook.com (2603:10b6:610:2bc::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.17; Tue, 21 Oct 2025 16:02:17 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 16:02:16 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>, "Vivekanandan,
 Balasubramani" <balasubramani.vivekanandan@intel.com>, "Wang, X"
 <x.wang@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v3 10/24] drm/xe/xe3p: Dump CSMQDEBUG register
Thread-Topic: [PATCH v3 10/24] drm/xe/xe3p: Dump CSMQDEBUG register
Thread-Index: AQHcPw2fSpXDBczKwkGoPTZt2hnVhbTMygeA
Date: Tue, 21 Oct 2025 16:02:16 +0000
Message-ID: <4de58dd619a8c0720b201083f57e5d8e44a63440.camel@intel.com>
References: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
 <20251016-xe3p-v3-10-3dd173a3097a@intel.com>
In-Reply-To: <20251016-xe3p-v3-10-3dd173a3097a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CH8PR11MB9458:EE_
x-ms-office365-filtering-correlation-id: ad854037-2ccd-40fc-ee53-08de10bb350e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?a2FKSTdyY0JXc3plQTdzdkZJUEczaHlsbThrS3ZBcnZmM2xjc25JRFV6Q1Ja?=
 =?utf-8?B?eGtodHZQZWQxRVFBOEovVFBoLy8wT1k1cWdJV0NETjk0VWRZQmhwdnlsUnln?=
 =?utf-8?B?bm5ob045QUU2MHoyTXBua2RzQmhMUEZFSkEvcEYvU28zWC96MmNyNzR0OGhH?=
 =?utf-8?B?WjVRT2FLbGQwYWx1RVRNemtpUzhzRExBTHRCazZEbnNBMC8rL1dhdEx4Wm4r?=
 =?utf-8?B?cXJ0VmJtajJxZ2dXM0xwQ01sV2Rjd1J0RWFTVTFkWmY0RmMvMTdaeVBwamIw?=
 =?utf-8?B?L3lxUmhYR3VuaXhuaVBPZEwycUNiMWl3aUZIdDdCQUtHYjR3c0IwamdLYnh5?=
 =?utf-8?B?Yzl5ZDl0bjFnSTNmMlZmcnpxWDRqeUNpYlZvSWVjdjhRWjducHZVcGxnRFVU?=
 =?utf-8?B?RFFaM0VkN3JxM2VudERFZnFiWC9hbE15SEx6MzFzU1QxUng2TUxTM0htSENW?=
 =?utf-8?B?eldVeXJpVkJMMGlOMVpPamkyNUlId01OUWNwR2M3c1A0MXVOeEY0amRxdy8y?=
 =?utf-8?B?LzVNWm1EUGE4M281UDc1eDl3Wm92bHdEd0w1NVh0UmwzYlJiSEw3ME04cEMx?=
 =?utf-8?B?eW9oVGEzM0ZGd2xDMld0aWtEcm0zRUUweUtTUFhlNHFkeCtGUWxPWVdKWkFO?=
 =?utf-8?B?QlRVdXpOMHFIM2Vzc2c3NUxsNG9NU01JMWhoTFpCV3FPTHlVa0VOcEc1Z0g1?=
 =?utf-8?B?d21sN1FCVjBOaUY5WEdzSEs3dzNLZjVteEJLT2EzRlNYbmhrSTduUy84RzQx?=
 =?utf-8?B?bHdYSlZiSmM1MWZ1ZHJSQzlzcW9xek80REZkYm9veXFTREw3ZVRxRW1zRHYr?=
 =?utf-8?B?aGNuUkN3b0dLMlV2MW02dStuRVJVNlpPMW9tUENGWkt0UUQxMXh3YytiTDI5?=
 =?utf-8?B?SHlCcjlCZEUrdXdMT0FnVXhQWkl3KzVuaWp6VUVaT3hqLzR6bndzQ3dQM2ZD?=
 =?utf-8?B?eDNReUdDcmUrRnhJK2x4L1RwSEorMU00TVFtb1VpVnNISzdCWGxzT1NsOHNz?=
 =?utf-8?B?Vm9XVUZnOWltTmx3bGczZlFaaDRLdjZ4dXpUN3VURm5TdmtDZU90ZVgrWC80?=
 =?utf-8?B?MmlHakl2dzVoS3JHOFVtekxsa0prZkxUSHZKY0JuVFl0MWw0a1d6c2VtR1dh?=
 =?utf-8?B?Z3JnaG9JZkJhMHFPUzZta0hCeW1WSzViT2hRcGErRTNpKzdocUlwajdUN1Zy?=
 =?utf-8?B?bU1OckdpTzUxeUpHaDIxdjNGSnBOUnBrUXYrTU05alhyaXJscWVSSno4N0o4?=
 =?utf-8?B?ZEhPbXU1RkhpRjNGT1J6WjZ0ZEoxdEdPY29XMlc4Umo4dDUva0p6Vmgzeld5?=
 =?utf-8?B?TUJiNlNRUXBKNG8yVXIrS3RRMDEvWlAxN2NTQjNmSTVkOHRhZkVVVThVSjVi?=
 =?utf-8?B?S3hadTJiaDFRTTh2SkoxellkVGpJbUNXL0Q2ci9abmRnQWFHdTF5V2RyYWVl?=
 =?utf-8?B?NnFOdzJRYlpHL3NhRnNsRElqNVM3VFF0UG5MWHF6WWJwZ25Rb0o1dkc3WXZ2?=
 =?utf-8?B?b3JGei9QMWMzbTVDcWp4M3RXb1laSXRsYjBGYWduQmZzR21UQVRlQ2d2M1lq?=
 =?utf-8?B?T2ZzcVl1OFRBa25lLzhTSmNRQUoydlhycktIb3o4MVdtZ3dvZGV5REs0ZWpF?=
 =?utf-8?B?MEoxb3REMzRNM0hxdzZlVHlKNE96QjcrUjllMEdLclYxN25xbFNvYUZvYUNt?=
 =?utf-8?B?Y3AxKzQzUkdMUkFodklsZ3VNSjZodXJIcWlMLzZMbnBPNms2RllVTVNORTN1?=
 =?utf-8?B?M0RtWjNFbWFuNGc0YlpXVEpnU2M4MGRoWitOUy8rVVIyVGUyUXRFSEszaHpM?=
 =?utf-8?B?VXhPaTBaYWJyZUdJeHpDOXV5c3N4NFVTWldmckE4THV2NC8wMXJRdy9QcnJJ?=
 =?utf-8?B?ZkRjeFkxSkZsbGpHNmtpVFZHa2FRR1VzemZWRDF4V0ZQZmRrYm9HQy84YlZT?=
 =?utf-8?B?S0plbDBBS1lSOEtqZE1qTmlHNUNUMFZVblJHZUxDZFFSV3dZU1h1NjRlTGVl?=
 =?utf-8?B?RmpJcFVVYzA2Z0h0dHhMUGdydnVtL3FmNHBEbFZuK3BLYkR0WW9xVi9YcmVU?=
 =?utf-8?Q?simuTX?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NmpWNkc4emdyZVdjWkxPbHJpL0d4L2J2WlBOWHo0VmV3WW1JQXpuYjBkeXRt?=
 =?utf-8?B?ZE9GbGkyRTM5dkxPVEcwSVcxOVVlQmt6V1RzWnIzRjNtS21PVlduMXlLVWlC?=
 =?utf-8?B?NjdmOVl2L3NGNGdjd1ZoTnhDUG1KSlRsTnd3ODRyQlVFbDc1bUlJZ2xXQ2FI?=
 =?utf-8?B?WjVGOTM0NXhVSVRWazRCUTA3MVNGaHIxT0ZLZ200dFZDVlRJN2VnU25hZXVX?=
 =?utf-8?B?b2tmTHVhSGhzY1g1NWpZaDZqWWZGcUtEbkF0R0ttZDZreHdqOXVMSCtmdE5E?=
 =?utf-8?B?UGk1YTFGNmtUNUVKa01tYXViTHJFZksyQUVRWkRnZVgrNnVVc2NKTWJ5UXoy?=
 =?utf-8?B?N2hjc0FFSlpWVEozYkdicVB5ZTFtbWpyRG1yL05nZ1JzaUpTbjFVRkxma2R0?=
 =?utf-8?B?cXFtTlJZZ0R2RlNPS0Jid3ZkNVg1MjVTUWQ0NmJVWVIreGV0MlJRNm1KMnRj?=
 =?utf-8?B?RHBVSTBJMEdOTFVQbnN5Z2ZzTzVxT01PSWxWN0Fpc3ExRXBZY09TWVEwaUJM?=
 =?utf-8?B?RGIyZXQzY0t2ZXorUkU3cjAzUHNqcW9WNkoxNjdlVjBoeTdkOHNrdDcyVkFa?=
 =?utf-8?B?aFFzK2ZLbS85VnhYRWdTdFZPeFVUM0R2dE5STFczZTB2M1NhSU5LRzVwbHF4?=
 =?utf-8?B?b3lkUGRFQUgwcGZXeUhPNWpIbnlkUWh4WmFHdnR5OHFiaEhaanNQcks1eVRv?=
 =?utf-8?B?WGU4S0VWM0VyYXI4Wkg3OVVEQ1lPdnZ4TnByV1Z1L0p6Mi9tZy9xM1pGTGdB?=
 =?utf-8?B?VXFZMEtZc2xZME5aclhXTHVDcis5bG5WemtlTXBxWHJucHp6OU9TWWUzNFRm?=
 =?utf-8?B?QUVmMjlsV3A2MTlqZFdIRmVTa2psbUlhNTM5RENFSWVQcnZtemVSODB2Rk94?=
 =?utf-8?B?cjh5dHlSSG9tTzdyWmwwVURRRUdMS1ZJR1Zqdk4yN1E0c1NHZVR6TStpT2lS?=
 =?utf-8?B?NE00ME1MV2pJeTViV2RrQnBxby80NmtUNE9PRGlFeFR4QnB5cmZnUTEvNGxW?=
 =?utf-8?B?OXhvVlZNdGdKVjNQbVZsSkhXQ2hYdi9HMHJhdTFLWWJmV1dWVXhzWk1PWmI1?=
 =?utf-8?B?TlBVRnlFVUJrMkZOUnN1MytoK1NHYld4Q2FMM2VoWmVhWWE1YmZDYTNBTUNI?=
 =?utf-8?B?SDMwY2V3bVhLU01ZbjlHSThzYWFWK0F3eWpvVElFMGF0TzNjSitLSEs4RU9C?=
 =?utf-8?B?TFcxUDVUUHo1dDZsczV4cmQ4RHVvL1pselBDRnJ3QWZPRWo4Vzc2NVozN2VZ?=
 =?utf-8?B?RDYySHlIOHRaODQzUFZwLzZGNFM5Q3FIN3NwQStzVjJhU01FY1dFbWdjeXpD?=
 =?utf-8?B?WlVaMzUvS1ROUXIvSjNJL0tLTS9ZYkJ0ZEdmVkxnOThEdEdwTzlzU3FQZ1RR?=
 =?utf-8?B?a2VFOGRPMm92ekY2MDVzMU5sajYrREpvb1luQnlyYmQ1NmRFWWRpaklVbVF3?=
 =?utf-8?B?YkdINXFSNWFBQXllbjVsb1NxWXpWci80QVNIWld6RWNTUE1oTlNyOGtkQ1Iz?=
 =?utf-8?B?VTIyR2xQbDNEWEhpYlJSZXpyNXNDMUJLOVVDazZiUDJPOVBoT0dKODBMNEIx?=
 =?utf-8?B?Qkw2emZlWVR4QTRZTlZFcG9yVk5kSGZqbTVoZVZ3bzR2aFJjOTNaVXpoNkU1?=
 =?utf-8?B?OGJ0ZVc5akN3VkdTcmJEeFY3dk5jUHNUTGNyYkNNN2ZMSWhnNDQzMXVZTG5Z?=
 =?utf-8?B?OVhCQkNON2UrdE1EZVFPNzk4WFV3MldFd3VDcUJQd2wrZjBZQndqc3pHNjZ4?=
 =?utf-8?B?T3pKeWI0dGVVRnZyU3ZUMjgvU3dhUVNOMVpielRlRXhpTkY0cTJhWUR1b0Zw?=
 =?utf-8?B?WWpSQjdZY0dpamZjSVRUWDJJZnQxdjQrRWJxb1pBRi9FbU5xeGtBbDFBamZy?=
 =?utf-8?B?NUVKeElpT1dYZmp1cWo1cXlER2pNRW9OTnFPcmdxNndpWFd0ZVdYT2xMOHF5?=
 =?utf-8?B?cmQ4KzI0cWd0bkFIa2l2SDQ4VnNOV2xNajM1dFc3d1F2ZUdmdzVBa1FRazJN?=
 =?utf-8?B?R2M5VzZqTU5kc3NDUTV2ZTh3eUllaXBhb1JLcDkwQXFGUzlDUnBJSGFMYVRR?=
 =?utf-8?B?U2xxaHZRL0tzcG16SzJwK0JGemxTRzZob3lMa1VZRkRGU1dmZE1NSjlhU3l4?=
 =?utf-8?B?SFhISkdBSVJYRURMRWhSbTc2aUVWekFjejFVbWk2aGpxYWpERzBpRTBOdlJG?=
 =?utf-8?B?S1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A7E66460AA8AC94A8000BDE4E8DE7835@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad854037-2ccd-40fc-ee53-08de10bb350e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2025 16:02:16.7573 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iZ9tsgkRfGVSdNzZrIwnCMr22sBc3dQCWS2YKW6av/zb7WMUlZuhpu7zaGMK1zjdrmaXXF9wO6h+0FyfL/wJ1O/hy6It1ZgeLoPwIPGU5xY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9458
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

T24gVGh1LCAyMDI1LTEwLTE2IGF0IDE5OjI2IC0wNzAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
Cj4gRnJvbTogV2FuZyBYaW4gPHgud2FuZ0BpbnRlbC5jb20+Cj4gCj4gVGhlIENTTVFERUJVRyBp
cyB1c2VmdWwgZm9yIHRoZSBkZXZlbG9wbWVudCBvZiBNUSBmZWF0dXJlLiBTdGFydAo+IGR1bXBp
bmcKPiB0aGUgZGVidWcgcmVnaXN0ZXIuCj4gCj4gQ2M6IE5pcmFuamFuYSBWaXNod2FuYXRoYXB1
cmEgPG5pcmFuamFuYS52aXNod2FuYXRoYXB1cmFAaW50ZWwuY29tPgo+IENjOiBNYXR0IFJvcGVy
IDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFdhbmcgWGluIDx4
LndhbmdAaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMu
ZGVtYXJjaGlAaW50ZWwuY29tPgo+IC0tLQo+IHYyOgo+IMKgLSBFeHRyYWN0IENTTVFERUJVRyBm
cm9tIG90aGVyIHBhdGNoIGR1bXBpbmcgbXVsdGlwbGUgcmVnaXN0ZXIgKE1hdHQKPiDCoMKgIFJv
cGVyKQo+IMKgLSBTaW1wbGlmeSB2ZXJzaW9uIGNoZWNrIChNYXR0IFJvcGVyKQo+IMKgLSBEbyBu
b3QgZHVtcCBDU01RREVCVUcgZm9yIGVuZ2luZXMgdGhhdCBkbyBub3Qgc3VwcG9ydCBNUSAoTWF0
dAo+IFJvcGVyKQo+IHYzOgo+IMKgLSBEcm9wIGRlc2Mgc3RydWN0cyBub3QgbmVlZGVkIGFueW1v
cmUsIGp1c3QgdXNlIHRoZSBvbmUgZm9yCj4gcHJldmlvdXMKPiDCoMKgIHBsYXRmb3JtIChNYXR0
IFJvcGVyKQo+IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfZW5naW5lX3JlZ3Mu
aCB8wqAgMiArKwo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jYXB0dXJlLmPCoMKgwqDC
oMKgIHwgMjgKPiArKysrKysrKysrKysrKysrKysrKysrKysrKystCj4gwqAyIGZpbGVzIGNoYW5n
ZWQsIDI5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfZW5naW5lX3JlZ3MuaAo+IGIvZHJpdmVycy9ncHUvZHJt
L3hlL3JlZ3MveGVfZW5naW5lX3JlZ3MuaAo+IGluZGV4IDBjMDJkMGZlNTUzMTUuLjY4MTcyYjAy
NDhhNmUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfZW5naW5lX3Jl
Z3MuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX2VuZ2luZV9yZWdzLmgKPiBA
QCAtMTU1LDYgKzE1NSw4IEBACj4gwqAjZGVmaW5lwqDCoCBHRlhfRElTQUJMRV9MRUdBQ1lfTU9E
RcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBSRUdfQklUKDMpCj4gwqAjZGVmaW5lwqDCoCBH
RlhfTVNJWF9JTlRFUlJVUFRfRU5BQkxFwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgUkVHX0JJVCgx
MykKPiDCoAo+ICsjZGVmaW5lIFJJTkdfQ1NNUURFQlVHKGJhc2UpwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBYRV9SRUcoKGJhc2UpICsKPiAweDJiMCkKPiArCj4gwqAjZGVm
aW5lIFJJTkdfVElNRVNUQU1QKGJhc2UpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBYRV9SRUcoKGJhc2UpICsKPiAweDM1OCkKPiDCoAo+IMKgI2RlZmluZSBSSU5HX1RJTUVT
VEFNUF9VRFcoYmFzZSnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBYRV9SRUcoKGJhc2Up
ICsgMHgzNTgKPiArIDQpCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNf
Y2FwdHVyZS5jCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2NhcHR1cmUuYwo+IGluZGV4
IDhkMWJmYTJjZGIxNTEuLjBjMWZiZTk3YjhiZjIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2d1Y19jYXB0dXJlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Vj
X2NhcHR1cmUuYwo+IEBAIC0xNTAsNiArMTUwLDkgQEAgc3RydWN0IF9fZ3VjX2NhcHR1cmVfcGFy
c2VkX291dHB1dCB7Cj4gwqDCoMKgwqDCoMKgwqDCoHsKPiBTRkNfRE9ORSgyKSzCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAwLMKgwqDCoMKgwqDCoDAswqDCoMKgwqDCoMKgMCzC
oMKgwqDCoMKgwqAwLMKgwqDCoMKgwqDCoCJTRkNfRE8KPiBORVsyXSJ9LCBcCj4gwqDCoMKgwqDC
oMKgwqDCoHsKPiBTRkNfRE9ORSgzKSzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAwLMKgwqDCoMKgwqDCoDAswqDCoMKgwqDCoMKgMCzCoMKgwqDCoMKgwqAwLMKgwqDCoMKgwqDC
oCJTRkNfRE8KPiBORVszXSJ9Cj4gwqAKPiArI2RlZmluZSBYRTNQX0JBU0VfRU5HSU5FX0lOU1RB
TkNFIFwKPiArwqDCoMKgwqDCoMKgwqB7Cj4gUklOR19DU01RREVCVUcoMCkswqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgUkVHXzMyQklULMKgwqDCoMKgwqDCoDAswqDCoMKgwqDCoMKgMCzCoMKgwqDC
oMKgwqAwLMKgwqDCoMKgwqAKPiDCoCJDU01RREVCVUcifQo+ICsKPiDCoC8qIFhFX0xQIEdsb2Jh
bCAqLwo+IMKgc3RhdGljIGNvbnN0IHN0cnVjdCBfX2d1Y19tbWlvX3JlZ19kZXNjciB4ZV9scF9n
bG9iYWxfcmVnc1tdID0gewo+IMKgwqDCoMKgwqDCoMKgwqBDT01NT05fWEVMUF9CQVNFX0dMT0JB
TCwKPiBAQCAtMTk2LDYgKzE5OSwxMiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IF9fZ3VjX21taW9f
cmVnX2Rlc2NyCj4geGVfbHBfZ3NjX2luc3RfcmVnc1tdID0gewo+IMKgwqDCoMKgwqDCoMKgwqBD
T01NT05fQkFTRV9FTkdJTkVfSU5TVEFOQ0UsCj4gwqB9Owo+IMKgCj4gKy8qIFJlbmRlciAvIENv
bXB1dGUgUGVyLUVuZ2luZS1JbnN0YW5jZSAqLwoKTWF5YmUgSSdtIG1pc3JlYWRpbmcgeW91ciBw
YXRjaCBoZXJlLCBidXQgTVEgc2hvdWxkIGJlIHN1cHBvcnRlZCBhbHNvCm9uIGJsaXR0ZXIuIFdo
eSBhcmUgd2Ugb25seSBkdW1waW5nIHRoaXMgZm9yIHJlbmRlci9jb21wdXRlPwoKVGhhbmtzLApT
dHVhcnQKCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgX19ndWNfbW1pb19yZWdfZGVzY3IgeGUzcF9y
Y19pbnN0X3JlZ3NbXSA9IHsKPiArwqDCoMKgwqDCoMKgwqBDT01NT05fQkFTRV9FTkdJTkVfSU5T
VEFOQ0UsCj4gK8KgwqDCoMKgwqDCoMKgWEUzUF9CQVNFX0VOR0lORV9JTlNUQU5DRSwKPiArfTsK
PiArCj4gwqAvKgo+IMKgICogRW1wdHkgbGlzdCB0byBwcmV2ZW50IHdhcm5pbmdzIGFib3V0IHVu
a25vd24gY2xhc3MvaW5zdGFuY2UgdHlwZXMKPiDCoCAqIGFzIG5vdCBhbGwgY2xhc3MvaW5zdGFu
Y2UgdHlwZXMgaGF2ZSBlbnRyaWVzIG9uIGFsbCBwbGF0Zm9ybXMuCj4gQEAgLTI0Niw2ICsyNTUs
MjEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBfX2d1Y19tbWlvX3JlZ19kZXNjcl9ncm91cAo+IHhl
X2hwZ19saXN0c1tdID0gewo+IMKgwqDCoMKgwqDCoMKgwqB7fQo+IMKgfTsKPiDCoAo+ICsgLyog
TGlzdCBvZiBsaXN0cyBmb3IgWGUzcCBhbmQgYmV5b25kICovCj4gK3N0YXRpYyBjb25zdCBzdHJ1
Y3QgX19ndWNfbW1pb19yZWdfZGVzY3JfZ3JvdXAgeGUzcF9saXN0c1tdID0gewo+ICvCoMKgwqDC
oMKgwqDCoE1BS0VfUkVHTElTVCh4ZV9scF9nbG9iYWxfcmVncywgUEYsIEdMT0JBTCwgMCksCj4g
K8KgwqDCoMKgwqDCoMKgTUFLRV9SRUdMSVNUKHhlX2hwZ19yY19jbGFzc19yZWdzLCBQRiwgRU5H
SU5FX0NMQVNTLAo+IEdVQ19DQVBUVVJFX0xJU1RfQ0xBU1NfUkVOREVSX0NPTVBVVEUpLAo+ICvC
oMKgwqDCoMKgwqDCoE1BS0VfUkVHTElTVCh4ZTNwX3JjX2luc3RfcmVncywgUEYsIEVOR0lORV9J
TlNUQU5DRSwKPiBHVUNfQ0FQVFVSRV9MSVNUX0NMQVNTX1JFTkRFUl9DT01QVVRFKSwKPiArwqDC
oMKgwqDCoMKgwqBNQUtFX1JFR0xJU1QoZW1wdHlfcmVnc19saXN0LCBQRiwgRU5HSU5FX0NMQVNT
LAo+IEdVQ19DQVBUVVJFX0xJU1RfQ0xBU1NfVklERU8pLAo+ICvCoMKgwqDCoMKgwqDCoE1BS0Vf
UkVHTElTVCh4ZV92ZF9pbnN0X3JlZ3MsIFBGLCBFTkdJTkVfSU5TVEFOQ0UsCj4gR1VDX0NBUFRV
UkVfTElTVF9DTEFTU19WSURFTyksCj4gK8KgwqDCoMKgwqDCoMKgTUFLRV9SRUdMSVNUKHhlX3Zl
Y19jbGFzc19yZWdzLCBQRiwgRU5HSU5FX0NMQVNTLAo+IEdVQ19DQVBUVVJFX0xJU1RfQ0xBU1Nf
VklERU9FTkhBTkNFKSwKPiArwqDCoMKgwqDCoMKgwqBNQUtFX1JFR0xJU1QoeGVfdmVjX2luc3Rf
cmVncywgUEYsIEVOR0lORV9JTlNUQU5DRSwKPiBHVUNfQ0FQVFVSRV9MSVNUX0NMQVNTX1ZJREVP
RU5IQU5DRSksCj4gK8KgwqDCoMKgwqDCoMKgTUFLRV9SRUdMSVNUKGVtcHR5X3JlZ3NfbGlzdCwg
UEYsIEVOR0lORV9DTEFTUywKPiBHVUNfQ0FQVFVSRV9MSVNUX0NMQVNTX0JMSVRURVIpLAo+ICvC
oMKgwqDCoMKgwqDCoE1BS0VfUkVHTElTVCh4ZV9ibHRfaW5zdF9yZWdzLCBQRiwgRU5HSU5FX0lO
U1RBTkNFLAo+IEdVQ19DQVBUVVJFX0xJU1RfQ0xBU1NfQkxJVFRFUiksCj4gK8KgwqDCoMKgwqDC
oMKgTUFLRV9SRUdMSVNUKGVtcHR5X3JlZ3NfbGlzdCwgUEYsIEVOR0lORV9DTEFTUywKPiBHVUNf
Q0FQVFVSRV9MSVNUX0NMQVNTX0dTQ19PVEhFUiksCj4gK8KgwqDCoMKgwqDCoMKgTUFLRV9SRUdM
SVNUKHhlX2xwX2dzY19pbnN0X3JlZ3MsIFBGLCBFTkdJTkVfSU5TVEFOQ0UsCj4gR1VDX0NBUFRV
UkVfTElTVF9DTEFTU19HU0NfT1RIRVIpLAo+ICvCoMKgwqDCoMKgwqDCoHt9Cj4gK307Cj4gwqBz
dGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IGNhcHR1cmVfbGlzdF90eXBlX25hbWVzW10gPSB7Cj4g
wqDCoMKgwqDCoMKgwqDCoCJHbG9iYWwiLAo+IMKgwqDCoMKgwqDCoMKgwqAiQ2xhc3MiLAo+IEBA
IC0yOTMsNyArMzE3LDkgQEAgZ3VjX2NhcHR1cmVfcmVtb3ZlX3N0YWxlX21hdGNoZXNfZnJvbV9s
aXN0KHN0cnVjdAo+IHhlX2d1Y19zdGF0ZV9jYXB0dXJlICpnYywKPiDCoHN0YXRpYyBjb25zdCBz
dHJ1Y3QgX19ndWNfbW1pb19yZWdfZGVzY3JfZ3JvdXAgKgo+IMKgZ3VjX2NhcHR1cmVfZ2V0X2Rl
dmljZV9yZWdsaXN0KHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQo+IMKgewo+IC3CoMKgwqDCoMKgwqDC
oGlmIChHUkFQSElDU19WRVJ4MTAwKHhlKSA+PSAxMjU1KQo+ICvCoMKgwqDCoMKgwqDCoGlmIChH
UkFQSElDU19WRVIoeGUpID49IDM1KQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBy
ZXR1cm4geGUzcF9saXN0czsKPiArwqDCoMKgwqDCoMKgwqBlbHNlIGlmIChHUkFQSElDU19WRVJ4
MTAwKHhlKSA+PSAxMjU1KQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJu
IHhlX2hwZ19saXN0czsKPiDCoMKgwqDCoMKgwqDCoMKgZWxzZQo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgcmV0dXJuIHhlX2xwX2xpc3RzOwo+IAoK
