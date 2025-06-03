Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA5FC5AD49
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 17:10:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C09210E13B;
	Tue,  3 Jun 2025 17:10:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YrczFe8f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E3A710E13B
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 17:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748970633; x=1780506633;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=6HxMvncnT4PfO4QYOc3KtRY4kQadhHkofF5yngSzQ9g=;
 b=YrczFe8fxo5EVdTtRt3YiF1vb0zvsqLb9YlJ+ou2DxhQLH8rEP0ulfJJ
 j642VmCwAFmbq2RNPwqMfPNq093zTYYtSqdyMpwVvB7imXJ83izajh1AW
 HtwCImHar8RquqQMKRsgWnCSUPWBjK5KpTsnBiUUcetdi9MqKCXTwGjW7
 KKQi8vr1mL3t8V+BbBJ153gs4+5wtAOS/rIp0g9U9Ct4dKONmRHXlz8IB
 pRePWRApa4QFOX5IG2aUdxnciNZ7Fhp8WZ6VYufLfwKd5jSMfH0ChKS7v
 TOTJ1eYPdavIKQfs2C0RDA/M58rmclb4X9vaUdCGpkkAdKJuidBXfudQR A==;
X-CSE-ConnectionGUID: Ls6Z0yN6RU6ruH637doxzQ==
X-CSE-MsgGUID: F+B1inhwTXOdfaqjYa37Cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="61686452"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="61686452"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 10:10:32 -0700
X-CSE-ConnectionGUID: byaeEzXFSE+tI0kBexgLfQ==
X-CSE-MsgGUID: WM+rF7NoQ2+SlEf1unGKig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="175868369"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 10:10:33 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 10:10:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 10:10:32 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.70) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 10:10:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gdCTj28FcFNky0unXVmwvFFh6/qJC0qbROcCYrYhUUUGttiMYzCUlbmtc1L+nx22mch6B3w8ph1xPXuXqs0xtElgLzJzzo2CMXUn12kJIWzIxm0wnoQub5MdZPPEly5Gii5BWykPhV9BXfO0p6yPdGki0dQcErCsqUoDWqfHrocTUuD/yh2kjE36iruDGwSlYdJI+ceVX0FsOVNAXlt7RQBf3ESCE4SDF94Pam2sEHxyOnH+qoFI6CEIrMh41yLuBN1+4+i5o1P4ZR0H/Q0sVOUElB+C1QrH2pg9YIo2WXtL27AkjU9CbdIv/EAar6L9bHzlg0rRD7WldP9RUOOp+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HxMvncnT4PfO4QYOc3KtRY4kQadhHkofF5yngSzQ9g=;
 b=lEF5uxXftsTDLJA5E5O5xZeNDB78Rxhy70k8ucyIwhq56IbVTBkQYrOvjT4F1N/gH2UD8qi/7fL3uzeBsX1FLxt10IuE1QSqySXVcaxfYS+dVz6EYhcHvrY9rulLMtGRbgJEa6yAFGSFeYktI9G0z4WrOCQ7irIlL76jxCR7IXhKw3oNykLURWgDmncHtvv29G6t/IkFTbr1+EhnrEAITTrL/TGnzaWAQNSRrSkq96o5B4aOB2mJUfSIz9bdj/PdUSAOMhLozRCs7Kb9QQYLJelQ49ob+odSdqmPJUVP4tkTIlChP6tTC58W5yqDMpLj4jdv56pj1I9ZHf5urKG9xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CH3PR11MB8381.namprd11.prod.outlook.com (2603:10b6:610:17b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.19; Tue, 3 Jun
 2025 17:10:29 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%6]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 17:10:28 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH] drm/xe: Add ASID to range invalidation feature flag
Thread-Topic: [PATCH] drm/xe: Add ASID to range invalidation feature flag
Thread-Index: AQHbur+cjiAtuxKeSEGbVLnP95pl8bPxU1aAgACL+IA=
Date: Tue, 3 Jun 2025 17:10:28 +0000
Message-ID: <deedf582ebc0c88b2047346cd4f861bc15999366.camel@intel.com>
References: <20250501173626.64481-1-stuart.summers@intel.com>
 <SJ1PR11MB6204AC486F6787E80A78BD30816DA@SJ1PR11MB6204.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB6204AC486F6787E80A78BD30816DA@SJ1PR11MB6204.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CH3PR11MB8381:EE_
x-ms-office365-filtering-correlation-id: 99f21eab-7e26-4ad7-7102-08dda2c189ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?YmVKSGZMSnNCMWp3dWRXaFNhMVBINHAyRy9KK1BxTE9wMEQ5V3MwelVXVWk5?=
 =?utf-8?B?L20ydWM0R1F5VWxFZHhHOExMbUtabmZUamhzYXV0Z3dlRkR6VzU0RGtYWCtB?=
 =?utf-8?B?ZThjejBlUHZVT0F0WXhmVTBSSFVsRFJOU1hLaTJNMVdMV0pYdG5pZ2RPNnlC?=
 =?utf-8?B?a0tkQ1Q0a1Ric0pMY2JSUy9aTEtwaU14T2RSQjlLUHJERTl2dmFSRFJRUUdu?=
 =?utf-8?B?d21waVpmd1cvYVpEdDc1QlJKNE1VQWZIU25KSVJ5Vjhja2pzSjJEK25PbmRH?=
 =?utf-8?B?ZCtqUWduVGM1N2pybkloT1ZJNk5FdVZWdURBbkJzVTVhVDlKT25GaHl0Mmdv?=
 =?utf-8?B?NWF1cis5UUwwZXNNa3lDZkt4R3NOelZ5NnJRM040NmplU1BKNXlsZ1ZYbnNI?=
 =?utf-8?B?ZFRyd1F1bVlWYkRtYS9WRHhMOVlkWGQxT0w0bTdPb09aR0VmT3dwaVZ5d3Ny?=
 =?utf-8?B?aGVMNjdHbEpMbzJ6RGc2L2NtS3VIN0hrZkIyTEN1K3R1MjVWbUJINVZ5Rmw5?=
 =?utf-8?B?MEZvdU50MTVmNEhBdDl5UG9GSVd3bm5zRk5aampaTVJWeU1WdGNUOFFNMTE3?=
 =?utf-8?B?TkxsNnA4bVFHZ0tDaExUSVRUTkQwUHNkRG4xSGNxOTFSMnNIcm9GYXluYzY0?=
 =?utf-8?B?TFh0bkRVcHZESzl2K3JDTnNTdHlCM0NaRW1XL0dhZTNPWkxhc1RjcXBXNHhp?=
 =?utf-8?B?REtUVmhITmFESU9JR2tYV0xGYnVCK2FxWEFJMUlTRWxzOUJEd0E1L0ljSlZv?=
 =?utf-8?B?bEU5U0FGTjBUNFZBT3duTXN3RjN6Nnk1VVkyZ1ZEVnRhZnA5cGhwS0hyWXYz?=
 =?utf-8?B?Qk0ybFVvT1I0dzNJQ0lVVy9BSC8wWU1hSGlkOC9hNjlQZm5SZndNSVVMUy9H?=
 =?utf-8?B?M1dSMEsvdm0rNG9xT2VZbTRkLzI1NG82TWxCZFpQcmhLS2RWSjhNWVdkN3VW?=
 =?utf-8?B?Q2E2cXJJMlRqZUYwZjFKbVdsQ0ZMT1FwU3IrS0Y3SkJBcEFCYVFwcU1VekRv?=
 =?utf-8?B?WERhVmFxRHhLTzE2cmpXT240ZE9qbVBqalJqWjQ0bDdGYUxMYTNzUnZLYTUv?=
 =?utf-8?B?QzMvblJHYk9jVEQ2dkYwUWlIcEcvOS9yaWZnZEh4YWxsS0dSb25NeWNpaDNX?=
 =?utf-8?B?eDZuakdLMnlJTWNKcTVFNStPSk1vU1BrbityL0R0VHJHVi9tTElXZ3R5a0Rk?=
 =?utf-8?B?eTdkd1ArVUdhZm9rOFI0c0xFU1RLOHA1UzBPL2o3NDhCYmFJZEt2NGRFYTJC?=
 =?utf-8?B?NTNkTjliNWhmeXY2Yi9pa21ib3d3OU1LUkFxM0l6SG1ZMjFPUzdEUmxNWHZO?=
 =?utf-8?B?VmJSTzVvTUQwSHYrVXdjS0N5VHY0VnM0ZkJvbW1ZdlJmeW9GN2dwZk5pMmhn?=
 =?utf-8?B?TXExaHBCRitzVCttVlZZb21mSmZVVTNGTzV0M0JhMzhtZ2laNkRaRFIyRGNq?=
 =?utf-8?B?WTl0OTRpYlJ3QXRhR2MxYk51dkZvcFp6b2l4bnN5OXN2d1hBZDQ0QlVmLzBq?=
 =?utf-8?B?bzdCeDVZRVY5SWUwbHc5a3h0RjhSYlZWQm1lUTdzTmcwVWZzekhBa3dqUWxt?=
 =?utf-8?B?MjJEZldVenVFdzFHUm1td01IVFN1djIyYWtCRHhxK3Rlb1VvZVNuV2NLQ25T?=
 =?utf-8?B?V2JYSEMvVE5zbE1NbUpnMnFLRStLUWZmR1M3VVRFQUZERDZFU1MxQkJIVTNK?=
 =?utf-8?B?NnlHb0lpaUwwWTU4Qy80MTJHdG9JWk1qM3ZBOHQ2cEhQdUVFV1JRUTlLZ3lq?=
 =?utf-8?B?UVRkNml0VDlWN2hrYmVGN1FJcjJJdkEzNDJCYytiZ0FuSElwNEZkZ2tpUmYx?=
 =?utf-8?B?UjZPL3h5R2FFUEZwMmc1MjladjBvUUFQNi95OGhoZlJlYjEzRXlIOEM5Mklv?=
 =?utf-8?B?QmROQzRYb3IzdUJuZ04yR285aUR1K3BSL1RWZENBbUsyNDF1TGhrVHcvUnZi?=
 =?utf-8?B?bEZBbnpWdnRiNkF0MzJBK21NSFNnSlowMmJGVmhvOGFuR2VpYXIrY3lCVkh4?=
 =?utf-8?Q?RAM5ulhazswN1XVeq83bobXhpOQUR8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NE1kRDJkYnBsN3hzZUR5dlVwT0o1UFY0NlVtbENIRUJXTmpucXZLZWdkYmF1?=
 =?utf-8?B?ZWNlYW01dkRvMW96VWZVSkVNcTBpL0YvRjVwS2RXTlZqVFZPeTNPd3dzdmtD?=
 =?utf-8?B?emtQNHhhK2ZZWGN6NWZkRFIzQTRFZ3g0bjlCS3p4ZU1IdHV3ZTZIWURvd0Vz?=
 =?utf-8?B?L2lOcklIR2R5bWZJNDhGSGgzSVpIV1JjMmxsang2VEVoaEhDSk9pUlZIanZR?=
 =?utf-8?B?ZlVLM1RqRHQ1bnQrV3AvTnFmN3VCRkEyeDU2Ryt6ZHdmTEwwcUlZWlFNMUNQ?=
 =?utf-8?B?Tm9yUGJTdkFFcnE2dDlWTjdJYWM1TU02UGh4TlBmYlNzN2ZBVWR1WlZ0Q04y?=
 =?utf-8?B?aVJQS1c2a2V0ZUNSb2ovOE1FSDdZZ2pMeUxRTnhad1NiYURTV2tEdzk1T21y?=
 =?utf-8?B?c21MWnllc21SSGFxc0Z2ZTV0eHJOUjBXWnIzOUhVRVF4UmNnRi9uNXZjdS9k?=
 =?utf-8?B?MDgwdjJaeUhJdUZubHIvNkxVNm1sbURSUWlEbTBpSm9sNTFMLzc2MzVWZTlr?=
 =?utf-8?B?MzRYTkQ1dGk3UkxlQkI3Zi91a3FCNFFjbU5wcTBpR1ZiUjcxdXZFNSt2ME0w?=
 =?utf-8?B?NWxoNTl6d0dPOUVlc2t4YjdJaWwvc0RVeG1TY1ZlUWxxZ1ZicVFWQS9wQlZD?=
 =?utf-8?B?cDVTa3N3MDFEaVROR2VvdVZrRlJYUFpocWpnRDY0QUt6NVE5ZWNMVGhKek4r?=
 =?utf-8?B?YjE1aU9zeVpUeTlhb1BwMjNOUDl4eTEra2xJY0pCZ2wxaU1ESlZZWHV5ekZF?=
 =?utf-8?B?U2wzWWFQVmVud0JhakJSYyttTE82S3Y1MjFjZHo1NURESmtVSy90aW9wN2VH?=
 =?utf-8?B?Z2JrTmI4akxaZEdRRjh0RHhaVitTdWhpTmliSVg4cytnSVVHejJSeFl5VUdz?=
 =?utf-8?B?d1BGWWRCUmhnRHhuR29rQTJGTC8wbU1oTTVPbTkyYVFJR083OGJDc0NCbmZV?=
 =?utf-8?B?emROM3JOTG56b3krL2xEY1lrRUhCNXF3bGVFNXNXdTIvZFFrSTlOWFpGNzA2?=
 =?utf-8?B?ekt3ZU9rOTJtMGxRdDE4ZTNNUFB1M08wRFdqbWxuOWhPTmU3MHV6cGlxcWFM?=
 =?utf-8?B?TU0wdmg4cmRSOVFEQ213MkNmcGJqV0VycTMxZDZwYmVKUXRidSs3SEV4d3Ja?=
 =?utf-8?B?dmt3UjBJMUd0cktNdzJ6aC9oSmVIVFBOS1VVZkVuNW43dklzMEJwblRMU1NV?=
 =?utf-8?B?bjczR1hyWWZCcmtkOGsraURyd0ExYWRIc2FjYndEaUtEcjBDRjZuVkZRYlJE?=
 =?utf-8?B?dXBtMXpMWWt0alpWUENORXUrb1I2L3RzZjJaY0tRNCsxTVlUL21oTXNUbS9m?=
 =?utf-8?B?NjVjcWlJd3hCVVVPL2NkTVRBdmM0aE9FdkVOYW81NEo4Z3d0S0I5dUNSeFZo?=
 =?utf-8?B?aFIwTjFTeDlQeFdVR2tlUWlLTXJXUk5JMTlONmxEY1dBVitUcmlDOFZCalZt?=
 =?utf-8?B?cFI3eC9BZlV3WmhvL05kWDNQbXVnaUIrMENJNHhveXFJcm51Ylkrb29FbTNC?=
 =?utf-8?B?RE8vS2FnaEJlTVdIK2ZNa3l5WlcvejQyTDc1VW9hRTV0NFFGbHhmZUlOcmtT?=
 =?utf-8?B?ZDBubG1tbWhyelp4V1NraUdmcmpjdFRsekRjUFdVcUQyMi9TV2F5aUFPM3Na?=
 =?utf-8?B?bzRRa2xhVjU5eGRBRU1ncGlGVE0wd0F5YURna2ZnUmxLZ2hsMHlzaDVYdDFT?=
 =?utf-8?B?bllCb2tUY2RFM3o3bFhick92ZzZ0UWJzWUlxTzduZ1NaU0hDNnUxbFhHbmJh?=
 =?utf-8?B?bVlvYksrMm1SamNTV3U3TGFRa0VmSDRySVpQRHFtU3dHY3RHeWtKWGhDaHNr?=
 =?utf-8?B?ekV3djJCSVdUa0l3cXNHeDBrbVMvNkYrc0VncGpHTTJwc2pZM3BCVDZwbGdP?=
 =?utf-8?B?VFR6OTJpZlowNDFkcUVJN1JhSTNsM21XMDYydXcwUURRbDVTbzVxMjM2WTlX?=
 =?utf-8?B?R285ZGw1T1p2d2ZKaW05T1JvY3VQdG0yaFJBcE1wcjVRd05na2s3SWc4dU9q?=
 =?utf-8?B?b3d5VDRwcmdnUnhxVG81U2NCQmdkNHVXTmJScTE2dGIrNThUL005dFpKd0Vh?=
 =?utf-8?B?MFM3Q21SdU9WN2VQQjlGeWdlT0oySjV1dzQ4M0NrT1JWVktlREZGTkZCMVhB?=
 =?utf-8?B?a2UrcUZoSHdNdlZUUzJsMXN4aDByZjFXTXZ4TUNBejJxOStpdEtVMTFQemwr?=
 =?utf-8?B?Q1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8B48EBFF83AD884EB872E1AF3C410F03@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99f21eab-7e26-4ad7-7102-08dda2c189ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2025 17:10:28.2442 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7xA6nUgcLhmeerrEFW4+vrAhnTwkkmPUDcynzUQ7koT2zdwYL1hklCoHxRtQOfUpsNFpuYdBBJocIyxANcljlnkj9eoD19/rTZQVCHR3Sfw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8381
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

T24gVHVlLCAyMDI1LTA2LTAzIGF0IDA4OjQ5ICswMDAwLCBVcGFkaHlheSwgVGVqYXMgd3JvdGU6
DQo+IA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IEludGVs
LXhlIDxpbnRlbC14ZS1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmDQo+
ID4gT2YgU3R1YXJ0DQo+ID4gU3VtbWVycw0KPiA+IFNlbnQ6IDAxIE1heSAyMDI1IDIzOjA2DQo+
ID4gQ2M6IFZpc2h3YW5hdGhhcHVyYSwgTmlyYW5qYW5hDQo+ID4gPG5pcmFuamFuYS52aXNod2Fu
YXRoYXB1cmFAaW50ZWwuY29tPjsNCj4gPiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7
IFN1bW1lcnMsIFN0dWFydA0KPiA+IDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+DQo+ID4gU3Vi
amVjdDogW1BBVENIXSBkcm0veGU6IEFkZCBBU0lEIHRvIHJhbmdlIGludmFsaWRhdGlvbiBmZWF0
dXJlDQo+ID4gZmxhZw0KPiA+IA0KPiA+IE1ha2UgaXQgZXhwbGljaXQgdGhhdCB0aGUgQVNJRCBp
cyB1c2VkIHRvIGlkZW50aWZ5IGEgVk0gd2hlbg0KPiA+IGlzc3VpbmcgYSByYW5nZWQtDQo+ID4g
YmFzZWQgVExCIGludmFsaWRhdGlvbi4NCj4gPiANCj4gPiAvcy9oYXNfcmFuZ2VfdGxiX2ludmFs
aWRhdGlvbi9oYXNfcmFuZ2VfdGxiX2ludmFsaWRhdGlvbl9hc2lkLw0KPiANCj4gV2hpbGUgdGhl
IHBhdGNoIGxvb2tzIG9rLCB3aGF0IGlzIHRoZSBtb3RpdmF0aW9uLCBpcyB0aGF0IGd1YyBkb2lu
Zw0KPiBhc2lkIGJhc2VkIGludmFsaWRhdGlvbiBub3cgc28gY2hhbmdpbmcgZmxhZyBuYW1lPw0K
DQpUaGlzIGlzIG1vcmUgYWJvdXQgY2xhcmlmaWNhdGlvbi4gV2UgbWlnaHQgYWxzbyBoYXZlIGEg
dGltZSB3aGVyZSB3ZQ0Kd2FudCB0byBiZSBhYmxlIHRvIGRvIGludmFsaWRhdGlvbnMgdHJpZ2dl
cmVkIGF0IHNvbWUgZmluZXIgZ3JhbnVsYXJpdHkNCnRoYW4gYnkgcHJvY2Vzcy9hc2lkLCBzbyB0
aGlzIGdpdmVzIHRoZSBjbGFyaWZpY2F0aW9uIG9uIHRoZSBpbnRlbnRpb24uDQoNClRoYW5rcywN
ClN0dWFydA0KDQo+IA0KPiBUZWphcw0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFN0dWFydCBT
dW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gwqBkcml2ZXJz
L2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmjCoMKgwqDCoMKgwqDCoCB8IDQgKystLQ0KPiA+
IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3RsYl9pbnZhbGlkYXRpb24uYyB8IDIgKy0NCj4g
PiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHwgNiArKystLS0NCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2lfdHlwZXMu
aMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMiArLQ0KPiA+IMKgNCBmaWxlcyBjaGFuZ2VkLCA3IGlu
c2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaA0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2RldmljZV90eXBlcy5oDQo+ID4gaW5kZXggMDZjNjVkYWNlMDI2Li4zZTQ5Yjg4YThhNjIg
MTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oDQo+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oDQo+ID4gQEAgLTMy
Nyw4ICszMjcsOCBAQCBzdHJ1Y3QgeGVfZGV2aWNlIHsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHU4IGhhc19sbGM6MTsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoC8qKiBAaW5mby5oYXNfcHhwOiBEZXZpY2UgaGFzIFBYUCBzdXBwb3J0ICovDQo+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1OCBoYXNfcHhwOjE7DQo+ID4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qKiBAaW5mby5oYXNfcmFuZ2VfdGxiX2ludmFsaWRh
dGlvbjogSGFzIHJhbmdlDQo+ID4gYmFzZWQgVExCDQo+ID4gaW52YWxpZGF0aW9ucyAqLw0KPiA+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1OCBoYXNfcmFuZ2VfdGxiX2ludmFsaWRh
dGlvbjoxOw0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiogQGluZm8uaGFz
X3JhbmdlX3RsYl9pbnZhbGlkYXRpb25fYXNpZDogSGFzDQo+ID4gcmFuZ2UgYmFzZWQNCj4gPiBU
TEIgaW52YWxpZGF0aW9ucyAqLw0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1
OCBoYXNfcmFuZ2VfdGxiX2ludmFsaWRhdGlvbl9hc2lkOjE7DQo+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAvKiogQGluZm8uaGFzX3NyaW92OiBTdXBwb3J0cyBTUi1JT1YgKi8N
Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHU4IGhhc19zcmlvdjoxOw0KPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyoqIEBpbmZvLmhhc191c206IERldmlj
ZSBoYXMgdW5pZmllZCBzaGFyZWQgbWVtb3J5DQo+ID4gc3VwcG9ydCAqLyBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3RsYl9pbnZhbGlkYXRpb24uYw0KPiA+IGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2d0X3RsYl9pbnZhbGlkYXRpb24uYw0KPiA+IGluZGV4IDA4NGNiZGVi
YThlYS4uYzY4ZjdjYzhlMTc1IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ndF90bGJfaW52YWxpZGF0aW9uLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3RfdGxiX2ludmFsaWRhdGlvbi5jDQo+ID4gQEAgLTM2Niw3ICszNjYsNyBAQCBpbnQgeGVfZ3Rf
dGxiX2ludmFsaWRhdGlvbl9yYW5nZShzdHJ1Y3QgeGVfZ3QNCj4gPiAqZ3QsDQo+ID4gDQo+ID4g
wqDCoMKgwqDCoMKgwqDCoGFjdGlvbltsZW4rK10gPSBYRV9HVUNfQUNUSU9OX1RMQl9JTlZBTElE
QVRJT047DQo+ID4gwqDCoMKgwqDCoMKgwqDCoGFjdGlvbltsZW4rK10gPSAwOyAvKiBzZXFubywg
cmVwbGFjZWQgaW4NCj4gPiBzZW5kX3RsYl9pbnZhbGlkYXRpb24gKi8NCj4gPiAtwqDCoMKgwqDC
oMKgwqBpZiAoIXhlLT5pbmZvLmhhc19yYW5nZV90bGJfaW52YWxpZGF0aW9uIHx8DQo+ID4gK8Kg
wqDCoMKgwqDCoMKgaWYgKCF4ZS0+aW5mby5oYXNfcmFuZ2VfdGxiX2ludmFsaWRhdGlvbl9hc2lk
IHx8DQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsZW5ndGggPiBNQVhfUkFOR0VfVExCX0lO
VkFMSURBVElPTl9MRU5HVEgpIHsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGFjdGlvbltsZW4rK10gPQ0KPiA+IE1BS0VfSU5WQUxfT1AoWEVfR1VDX1RMQl9JTlZBTF9GVUxM
KTsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgfSBlbHNlIHsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3BjaS5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMg
aW5kZXgNCj4gPiBhNGNhYTYyMjJiNmYuLmNmYWZjZmNiYmJjNiAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfcGNpLmMNCj4gPiBAQCAtOTEsNyArOTEsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHhlX2dy
YXBoaWNzX2Rlc2MNCj4gPiBncmFwaGljc194ZWxwID0ge8KgIH07DQo+ID4gDQo+ID4gwqAjZGVm
aW5lIFhFX0hQX0ZFQVRVUkVTIFwNCj4gPiAtwqDCoMKgwqDCoMKgwqAuaGFzX3JhbmdlX3RsYl9p
bnZhbGlkYXRpb24gPSB0cnVlLCBcDQo+ID4gK8KgwqDCoMKgwqDCoMKgLmhhc19yYW5nZV90bGJf
aW52YWxpZGF0aW9uX2FzaWQgPSB0cnVlLCBcDQo+ID4gwqDCoMKgwqDCoMKgwqDCoC52YV9iaXRz
ID0gNDgsIFwNCj4gPiDCoMKgwqDCoMKgwqDCoMKgLnZtX21heF9sZXZlbCA9IDMNCj4gPiANCj4g
PiBAQCAtMTQwLDcgKzE0MCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgeGVfZ3JhcGhpY3NfZGVz
Yw0KPiA+IGdyYXBoaWNzX3hlbHBnID0gew0KPiA+IMKgwqDCoMKgwqDCoMKgwqAuaGFzX2F0b21p
Y19lbmFibGVfcHRlX2JpdCA9IDEsIFwNCj4gPiDCoMKgwqDCoMKgwqDCoMKgLmhhc19mbGF0X2Nj
cyA9IDEsIFwNCj4gPiDCoMKgwqDCoMKgwqDCoMKgLmhhc19pbmRpcmVjdF9yaW5nX3N0YXRlID0g
MSwgXA0KPiA+IC3CoMKgwqDCoMKgwqDCoC5oYXNfcmFuZ2VfdGxiX2ludmFsaWRhdGlvbiA9IDEs
IFwNCj4gPiArwqDCoMKgwqDCoMKgwqAuaGFzX3JhbmdlX3RsYl9pbnZhbGlkYXRpb25fYXNpZCA9
IDEsIFwNCj4gPiDCoMKgwqDCoMKgwqDCoMKgLmhhc191c20gPSAxLCBcDQo+ID4gwqDCoMKgwqDC
oMKgwqDCoC52YV9iaXRzID0gNDgsIFwNCj4gPiDCoMKgwqDCoMKgwqDCoMKgLnZtX21heF9sZXZl
bCA9IDQsIFwNCj4gPiBAQCAtNjgwLDcgKzY4MCw3IEBAIHN0YXRpYyBpbnQgeGVfaW5mb19pbml0
KHN0cnVjdCB4ZV9kZXZpY2UgKnhlLA0KPiA+IMKgwqDCoMKgwqDCoMKgwqAvKiBSdW50aW1lIGRl
dGVjdGlvbiBtYXkgY2hhbmdlIHRoaXMgbGF0ZXIgKi8NCj4gPiDCoMKgwqDCoMKgwqDCoMKgeGUt
PmluZm8uaGFzX2ZsYXRfY2NzID0gZ3JhcGhpY3NfZGVzYy0+aGFzX2ZsYXRfY2NzOw0KPiA+IA0K
PiA+IC3CoMKgwqDCoMKgwqDCoHhlLT5pbmZvLmhhc19yYW5nZV90bGJfaW52YWxpZGF0aW9uID0g
Z3JhcGhpY3NfZGVzYy0NCj4gPiA+IGhhc19yYW5nZV90bGJfaW52YWxpZGF0aW9uOw0KPiA+ICvC
oMKgwqDCoMKgwqDCoHhlLT5pbmZvLmhhc19yYW5nZV90bGJfaW52YWxpZGF0aW9uX2FzaWQgPQ0K
PiA+ICtncmFwaGljc19kZXNjLT5oYXNfcmFuZ2VfdGxiX2ludmFsaWRhdGlvbl9hc2lkOw0KPiA+
IMKgwqDCoMKgwqDCoMKgwqB4ZS0+aW5mby5oYXNfdXNtID0gZ3JhcGhpY3NfZGVzYy0+aGFzX3Vz
bTsNCj4gPiANCj4gPiDCoMKgwqDCoMKgwqDCoMKgZm9yX2VhY2hfcmVtb3RlX3RpbGUodGlsZSwg
eGUsIGlkKSB7DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2lfdHlw
ZXMuaA0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaV90eXBlcy5oDQo+ID4gaW5kZXgg
ZTliOWJiYzEzOGQzLi4zZDFjNzQ1ZGUyYWMgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3BjaV90eXBlcy5oDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Bj
aV90eXBlcy5oDQo+ID4gQEAgLTE5LDcgKzE5LDcgQEAgc3RydWN0IHhlX2dyYXBoaWNzX2Rlc2Mg
ew0KPiA+IMKgwqDCoMKgwqDCoMKgwqB1OCBoYXNfYXRvbWljX2VuYWJsZV9wdGVfYml0OjE7DQo+
ID4gwqDCoMKgwqDCoMKgwqDCoHU4IGhhc19mbGF0X2NjczoxOw0KPiA+IMKgwqDCoMKgwqDCoMKg
wqB1OCBoYXNfaW5kaXJlY3RfcmluZ19zdGF0ZToxOw0KPiA+IC3CoMKgwqDCoMKgwqDCoHU4IGhh
c19yYW5nZV90bGJfaW52YWxpZGF0aW9uOjE7DQo+ID4gK8KgwqDCoMKgwqDCoMKgdTggaGFzX3Jh
bmdlX3RsYl9pbnZhbGlkYXRpb25fYXNpZDoxOw0KPiA+IMKgwqDCoMKgwqDCoMKgwqB1OCBoYXNf
dXNtOjE7DQo+ID4gwqB9Ow0KPiA+IA0KPiA+IC0tDQo+ID4gMi4zNC4xDQo+IA0KDQo=
