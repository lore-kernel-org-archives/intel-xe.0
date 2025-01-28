Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF9EC0218A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 15:41:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D23710E047;
	Tue, 28 Jan 2025 15:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BOyQnz1U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2DAF10E047
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jan 2025 15:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738078879; x=1769614879;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZL4yB2WvEYTA2mbSkUhqVOy5gpEW6+gkuvMzKa62S1w=;
 b=BOyQnz1UDbsZJX2JA6iZKXokTNYdbch/Hk6vlYkTdrfZQ2L0GaBmjVky
 xgWt0ZiWQiJ0Cft3svDvOBT4NDoaiY9Kmn5sWFcolk9jk8BUDr0Dpyyhz
 2q7SUFYtfc/vA43SS9VtiWgc7BS9d8c344+BbJP5wV8r8L8zZcaZ7Hv8x
 hTflHThZ9cb6pIvLqWdR3m6lgWB4Goo0vZ7ltAb0yfrdgDSt6FNfIPes+
 CXlZxrUTKn7s/STrvyzeg7KobIKXLLrWJ+XLl7r3H405SiOk+yql7WS2k
 0fFB4UnT74a5ocik8h22+hCGbdmL/qQ4NiJU4vtq1utdjbXo8zYWHlJUV Q==;
X-CSE-ConnectionGUID: IjKqc1jjQnC7XrWNoOLRzA==
X-CSE-MsgGUID: 1G/GwHDyRgu6KPEyutRk5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="56109753"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; d="scan'208";a="56109753"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 07:41:19 -0800
X-CSE-ConnectionGUID: OP+ajHQSRGeO83qIjrbBzw==
X-CSE-MsgGUID: VYkYUtKnRW2hbMXbJvYYaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113393957"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jan 2025 07:41:18 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 28 Jan 2025 07:41:17 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 28 Jan 2025 07:41:17 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 28 Jan 2025 07:41:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oANf5yBpfcYu9sPFo9Ox9RuS8dgA4fu5ywcpeqdjHlno9mXLXGq5Esg9kqjt0B8x07db6bQduW0+uUOht95d+FdE0esL39yJUdvig1awk2HHOP8behBJdsFh26WMJb82VE74M83fu828kWJFDy7QgB+OZ7u6lIHQMzwNZDJGwPolDtx9QLbVcK9uI/PiNDuis8eHvuJs1vQO+nVMfayI98Lvc6B5nXzOBi/qEFvfLxAdn5pjQkGnykrbl+iHgzfz4w/073kpUBLn6UAGOi6QoMSLniGzdtFfkpgkcPEhj/qf0PoN87zQ3n9ehtrhEPPD/AT/mwGM2es3rWdEG+ebfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZL4yB2WvEYTA2mbSkUhqVOy5gpEW6+gkuvMzKa62S1w=;
 b=VkKvHMl8VSFlMk1O012swEjSWuyTqE7c39sEnkO7Wt+mRGPck+ozErf0a6niv1dTiBbaYMdfwokSx8W4Y+OoZS8jaRLJynOOB38+WvOeWwpajRm20Ao9LD+E1vk1KEdLglvUglDxcmrJjQOZaeAX5diGMy1ALgQMPkBdJMtJQCztKp04K1w/62G1YWVRdZLvCoigd+Bk7eIDzCtjweKnq7HNK1xuioDRflCTjM6s+t7dCxIGztFEEsqU62WmLHqeyh94Y9NIEExBJiJrEBoqZuJftjFhInxFmeJNDOitVhC7u0btDLpaV1lglUcRG9fHP3DtfMMHwJdgfs33ifUtMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by SJ0PR11MB6693.namprd11.prod.outlook.com (2603:10b6:a03:44b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 15:41:15 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%4]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 15:41:15 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Piorkowski, Piotr" <piotr.piorkowski@intel.com>, Adam Miszczak
 <adam.miszczak@linux.intel.com>, "Laguna, Lukasz" <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH 1/1] drm/xe/pf: Add runtime registers for graphics gen >=
 30
Thread-Topic: [PATCH 1/1] drm/xe/pf: Add runtime registers for graphics gen >=
 30
Thread-Index: AQHbcXVPRpUwbXW25ECa5ZD3sPxQZbMsUuzQ
Date: Tue, 28 Jan 2025 15:41:15 +0000
Message-ID: <LV3PR11MB86955C49DE03AAF04B6DBB8EF9EF2@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250128110300.2840596-1-jakub1.kolakowski@intel.com>
 <20250128110300.2840596-2-jakub1.kolakowski@intel.com>
In-Reply-To: <20250128110300.2840596-2-jakub1.kolakowski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|SJ0PR11MB6693:EE_
x-ms-office365-filtering-correlation-id: 08b5efad-5424-412d-a032-08dd3fb23344
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?UlhrZ29udGdpYWJpQVRvVll2bDhWU1NZOEVDNkJSSFdoTFM3Q2FHQy9TOFJq?=
 =?utf-8?B?dThGVDBueG1UWVNOY0RpZTlrZ3Job2VWWWJvL0hMMSt6Y2FrbTlOVXNDdmRz?=
 =?utf-8?B?aFdtOTloK2owTTk1V2c1a3dRMmhGZm90aDU2akVKd2lHNUZwVEhsek9tbjJz?=
 =?utf-8?B?WnRPOVpPV1kyL1V2QWd1dG1GdUFtRHBvbEJZTzR2bE1NU0tmTEF3cFg4SW5v?=
 =?utf-8?B?RlQ1TThsTXZqQW5UaHlsZFQwcUVxZXR4K3VUOU9ieFRQQ3VvbUp5SE5xZHhC?=
 =?utf-8?B?SXhYdWR3VnZ0a3AySlA4SERGbGpkaWpQaGRGWjliNUJlRnZNMW43cVVkWElD?=
 =?utf-8?B?UkcxVjJqS01ray9tSHRvdzZYYk9reXd5Q2NwWExKNkNWWWJGeURua1J1N2Rn?=
 =?utf-8?B?RktFdExNc0lWYkZ6ZTRHTGdGVHRDZVlDcWJwT21XV25qQ3YwQWNmRUFlaXI5?=
 =?utf-8?B?c3czaUY5TCswN1orSVlXVWJOOFhML0NKMmQ1WVRUNERNZktGMU1wYVZ3MGRv?=
 =?utf-8?B?RWZpeXJWTGdwWC9mdHMxd2dXT2o0U0hyeHJqZnpybGVnNVFpVVFnN0pKbzBL?=
 =?utf-8?B?REFyOXRiZ2daQTZDa3JTb0k1S3Fud3BNOFh4enJIOXBwZXJWemFSUUhxMy9x?=
 =?utf-8?B?dDNHVTlkSVBWTTBZQnZRTWZqRDcrT0VGcm1acldOdHdid0s3eldsdEhqRUFm?=
 =?utf-8?B?eldMVjFqRklJcHMrR0UrbkN1eGtQcVdPaTczYlAwN3dJMlZYQzVzYUZ6U29y?=
 =?utf-8?B?bFZsWVczSU1taVdoQWFlVW55K1IxdTFWTWRVQnhhbzJtUWRCNzhwcWNYdnFB?=
 =?utf-8?B?YnI1cWZkbUR0U3lDR2RDSnFPYjNoWHdFRkpQV0FZYnIrRWNoSkxmbTMzWTBo?=
 =?utf-8?B?Y1JrM3d6NUNiRmh5S2I5V1YwUzRFR2RRcU9lTWlFNGZzM3dvdUp2QnI1dk0w?=
 =?utf-8?B?M1VOZUhFWmZLdURlaFRySkdWN3ZUOC9lbG14SUZLOUQzTjZxQ2FIamo0M0hU?=
 =?utf-8?B?a2syT2N2TVZxSGV4dXhicHZuY0lzamhoTnEvSTl4M2FXc2ZmY2NaS2pPMDV5?=
 =?utf-8?B?YVl5Tm9Ob05QUGUxcDJGNm90RndhdWZhcE9mT2s1eENlenB1WjFEa1ZqM2do?=
 =?utf-8?B?dkVHd2RJZVV3d2U4Z1ozUWt6VlB5V0dScVkwTEhISEptREt1V29KVCtUWmR4?=
 =?utf-8?B?c1ZzL080Z3lZTGEvcnJyTGZ1TDNkL014L3drY25LYkNhTXg5Ty83MXh0cDY0?=
 =?utf-8?B?d0g5SGtIMmUyd2FteHd6TGY3cjZoRW5Jd24wTCt6TmtnL0VEenNtandqdTFk?=
 =?utf-8?B?MUhNNW0rNDRCaGpsVEFmVFNJdFpaTkVQQmIrc05PN0NyL1VQOVNpWGlGc0Iw?=
 =?utf-8?B?emdLc3F6QXUzT1h2NnROVkpZN3B5d0pxUUZXc1hDNkNnK2VpVTBJbGVLcXNk?=
 =?utf-8?B?VnIxbVZpK1Z6UGs2TDYrWDRjUGZDekd6OWxiSmZlNFNMMWkvRUFQTzVNbEdp?=
 =?utf-8?B?VTZHQnJCSGpmU2lFeWpOZXN1K0F0ZHhVUnc1d0owYUt6aWtTa2JBUExpdHNS?=
 =?utf-8?B?TktwMUYvMm1xZ3F5NCtXRUlHZ3VZMUVwcVVnNUc3L2dtUW1RaWxlV1pvUDZi?=
 =?utf-8?B?V091cThTUzd2UW1lVnBkcU5rZEtSVlN2Z0xyRC9JUVpxK3d0TUgwZnUzWFM0?=
 =?utf-8?B?RHFxLzlJc0hBOVJBU013OTQ2NEVINHV4czI5aVhmVnpzci9DY1RWOEg1Q2JW?=
 =?utf-8?B?cU8ra0kweWJsb1krM200S0dBNitIVVI4dm9VZ08zeDBVN1c3eGlDdFo3c3l4?=
 =?utf-8?B?dWZMVG8vQWcrUFcrSGZJdkRDTnBMaGo5Y1JjWjk1RHpzTnB2SjQwY2VoQVpk?=
 =?utf-8?B?SjJHdGhXQ3cvajVDYURGWXdleC95dDJNTXZWb2FDd2l1NFhqZUhhU05PbXNu?=
 =?utf-8?Q?Pqbw0D5KQ/CL+FBQOK54UIb76UYWQH9d?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZzVXWTlVZGFwRVVNYzZvZjdncUE2UjEzYUFrcFBiQi9lcWJlNkMyMXM4NTgz?=
 =?utf-8?B?ejNRcktIWW5USm9vbklKbVRQRC9lM2I1alh2RGR0d3ZVTDlRTzZhdmR5ZlhL?=
 =?utf-8?B?SGpSVjBXd1RvdGRIaWFFT0JTanQ5ZHpGZWhjbGVsTGQyNVliSmtpZXhJcVJ2?=
 =?utf-8?B?RDF1NFFVK0ZFQ3FFTHEwakhwNVFPQkVqSGxtNnZzN29tQnk4NS9TQVh6NTVq?=
 =?utf-8?B?ZmJNa2FQNjUrU1pha3UwQWpid2ZQRHlNSlhuS2h5Z0ZHcHI4YmMxcHVkRTlJ?=
 =?utf-8?B?ckRENkQyYXJrVkt1Vi9OYzNEQmJNYkYyQnkySWhQd3dmRzdiRWkwZmM1bS9P?=
 =?utf-8?B?dnl3Q3o4Mmh2OXBiMXJucTZ0VVBEeitPM2ZqWHRhZllnL2xONml3Sng4Q0Fi?=
 =?utf-8?B?c2FuMTV1VElBTzZ6R1B4Y2I1WjMwRUZWS0swUUxQYUJSUnhqVzAydVVrdzZa?=
 =?utf-8?B?clJnRGdLbDh3VVFpZWJ0SXRUd2hIenBGME1SalhxbmxqUkFBOVN4MDk4K1JN?=
 =?utf-8?B?ZEc1NUxSWFcra1JpMytzL2h2WE9DNEhIQ1R4M29WMTlWMmRMdGtlSEdPQzhi?=
 =?utf-8?B?aE9qUFlaMVJEWUp4eGIxbzBwb0xUWUZaMWIrRWFNRW5NcExRUGdveXhVUXQ1?=
 =?utf-8?B?TEJtY2pBaHdpVlBGM2FGbHdmeTRmK0NrQWZrVktvL1R5TC9WcXVjZnBhcnR6?=
 =?utf-8?B?Uml0TFRrdys5c3k3S0dVLy9EQmoyN0t1bTlNRTUzQWdwVzMvVzllTnNPWC9L?=
 =?utf-8?B?N3gra3NFSDVkTWYyQ3ZnVDB6MkFhd2RGMzJ3Z0NnMHdybVVIOFFkZVpTMitZ?=
 =?utf-8?B?Q3pEa0RacXJOeXppUWpiMENmSGpxelNZN2ErSmcrcThaWkZCTiszN0ducDd5?=
 =?utf-8?B?djExSHY2c2VkY0drNHVCK2JNRXBFTUpTNG1JOVNzMzJ1K1JRaXlBYjIwWWJG?=
 =?utf-8?B?TFc4NCt4Rjl4RmdsK1FWcUhRRWwxNkhWQlRTWkx0K3A1TUMwWndHTTBjSGlZ?=
 =?utf-8?B?eTZLS1NQOWJRQU9Ta2VZaHlXUnNzenA2bGxpa1ZxdG9ENzJncVFBRElBeFNE?=
 =?utf-8?B?a3FuU0RYdGpPZVVXenBvRTVEWFd2N09IUm9vUVQyRDNwVWFqdHhKKysxaVB0?=
 =?utf-8?B?YW5WSm5hTU9MRXRxTnpyeDdIblNjMU11YXNsdXBvanZaK1kra3dBbk1rVWxu?=
 =?utf-8?B?enBLS05SODFENjRFLzlwbWlMWjU0d1h2THRJUjQwY2Y0eDl1SFRwQzhYckN6?=
 =?utf-8?B?L0xsWG82Y09oL3NnOUVmY3JJcStITCtUR0t2bmxGM0N2QkdmN3lmckpsVkVy?=
 =?utf-8?B?NnhtZUhoUUpNY3FDQTducG5EREo0d1ZLN1ZzWFNXeTQ4WVBpaUsyaUYvWnU4?=
 =?utf-8?B?ZnVHbWlrWStxR2hpNzZPNGxmWklpNjUzWmx4cEcrNXY2dUpGMGZMdzBGb1BQ?=
 =?utf-8?B?MFVvMWtVSlZwTGpMZHZXRXp2b2FSODIralFCVXV0bzdWV0V0cUJMajFncTBo?=
 =?utf-8?B?M3dURWYyOEVFUFBzb1FxWkVVWVFWZTZRRExIQ2RTd1Jwb3J6dTR5VW04S3k2?=
 =?utf-8?B?TGhxOHhZcys4YS8xR2NScjlTOU1ucmtQWTZPZFlUY1JKemlRbkw5S2VEQTFm?=
 =?utf-8?B?dFVFN2NSZ01xa05RcXFKOER3YzNzQXlodm5Rb2dNRFoyTDMrN3o4VS9JcUVQ?=
 =?utf-8?B?dGs0VHlpa2wxS2MyN3ZxVDkxRWR1MmlnN3J2QTB6cFJOWWRoZE9iZ1dUei9E?=
 =?utf-8?B?NWcvWWNrSGhEcXhXN0NsaU52SHBlWHd5b1VzTkFXcjBYRHFlMEJ5MFp5ZUVT?=
 =?utf-8?B?Ty9rYWlaY2VONjg0dG5KTHVaYW8wdXJQZWhYdDlSSVFTMzlTdEIwVVR6MlhV?=
 =?utf-8?B?VzRGbWp5RXRXckMwSlQ3K0MwMmc4bFlZWTdEUHZ1enlEU2lnY1JWZm5YYWxh?=
 =?utf-8?B?UmY1M0cyeEdOL2NUTCtBN01ZSStYUzhLd2xaL1FXc0tuK1JjSnpZUnVxTWlu?=
 =?utf-8?B?bDFuSHVEdUpnVFMzL1FaQWNVTU12bkozUURUbzNhRWdMSnMxZEk2Mk5nTklM?=
 =?utf-8?B?Ykw1L3B3WFh4VWVlbU93MlZHK05zc056NmFKZXNUZU1USlNSWERJWWxIYUln?=
 =?utf-8?B?aUd2NC9kNVJFOWlCUitpUXA0SGRtZ0pWVlBmU3BWTWdJTkJRMTNuV2c0cUkr?=
 =?utf-8?B?V3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08b5efad-5424-412d-a032-08dd3fb23344
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2025 15:41:15.2919 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uKs9vZC1+fIj8wCc6UjkFdWCgW/nylWRw4WoAvKBE4RznuUZ1bjIhq8mLEwWNqeqCDInDtWYIPit0VbJDSMj8stsjBYCsnnhd3Hn5uod4mI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6693
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

PiBGcm9tOiBLb2xha293c2tpLCBKYWt1YjEgPGpha3ViMS5rb2xha293c2tpQGludGVsLmNvbT4N
Cj4gU2VudDogVHVlc2RheSwgSmFudWFyeSAyOCwgMjAyNSA0OjMzIFBNDQo+IFRvOiBpbnRlbC14
ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEtvbGFrb3dza2ksIEpha3ViMSA8amFrdWIx
LmtvbGFrb3dza2lAaW50ZWwuY29tPjsgUGlvcmtvd3NraSwgUGlvdHINCj4gPHBpb3RyLnBpb3Jr
b3dza2lAaW50ZWwuY29tPjsgQWRhbSBNaXN6Y3phaw0KPiA8YWRhbS5taXN6Y3pha0BsaW51eC5p
bnRlbC5jb20+OyBMYWd1bmEsIEx1a2Fzeg0KPiA8bHVrYXN6LmxhZ3VuYUBpbnRlbC5jb20+OyBN
YXJjaW4gQmVybmF0b3dpY3oNCj4gPG1hcmNpbi5iZXJuYXRvd2ljekBsaW51eC5pbnRlbC5jb20+
OyBXYWpkZWN6a28sIE1pY2hhbA0KPiA8TWljaGFsLldhamRlY3prb0BpbnRlbC5jb20+OyBLIFYg
UCwgU2F0eWFuYXJheWFuYQ0KPiA8c2F0eWFuYXJheWFuYS5rLnYucEBpbnRlbC5jb20+DQo+IFN1
YmplY3Q6IFtQQVRDSCAxLzFdIGRybS94ZS9wZjogQWRkIHJ1bnRpbWUgcmVnaXN0ZXJzIGZvciBn
cmFwaGljcyBnZW4gPj0gMzANCj4gDQo+IEFkZCBtaXNzaW5nIHJ1bnRpbWUgcmVnaXN0ZXJzIGZv
ciBncmFwaGljcyB2ZXJzaW9ucyBvZiAzMDAwIG9yIGhpZ2hlci4NCj4gVGhpcyBpcyByZXF1aXJl
ZCBmb3IgWGUzIHdoZXJlIGFkZGl0aW9uYWxseSB3ZSBoYXZlDQo+IE1JUlJPUl9MM0JBTktfRU5B
QkxFIHJlZ2lzdGVyLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmFrdWIgS29sYWtvd3NraSA8amFr
dWIxLmtvbGFrb3dza2lAaW50ZWwuY29tPg0KPiBTdWdnZXN0ZWQtYnk6IFBpb3RyIFBpw7Nya293
c2tpIDxwaW90ci5waW9ya293c2tpQGludGVsLmNvbT4NCj4gQ2M6IEFkYW0gTWlzemN6YWsgPGFk
YW0ubWlzemN6YWtAbGludXguaW50ZWwuY29tPg0KPiBDYzogSmFrdWIgS29sYWtvd3NraSA8amFr
dWIxLmtvbGFrb3dza2lAaW50ZWwuY29tPg0KPiBDYzogTHVrYXN6IExhZ3VuYSA8bHVrYXN6Lmxh
Z3VuYUBpbnRlbC5jb20+DQo+IENjOiBNYXJjaW4gQmVybmF0b3dpY3ogPG1hcmNpbi5iZXJuYXRv
d2ljekBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBNaWNoYWwgV2FqZGVjemtvIDxtaWNoYWwud2Fq
ZGVjemtvQGludGVsLmNvbT4NCj4gQ2M6IFBpb3RyIFBpb3Jrb3dza2kgPHBpb3RyLnBpb3Jrb3dz
a2lAaW50ZWwuY29tPg0KPiBDYzogU2F0eWFuYXJheWFuYSBLIFYgUCA8c2F0eWFuYXJheWFuYS5r
LnYucEBpbnRlbC5jb20+DQo+IC0tLQ0KUmV2aWV3ZWQtYnk6IFNhdHlhbmFyYXlhbmEgSyBWIFAg
PHNhdHlhbmFyYXlhbmEuay52LnBAaW50ZWwuY29tPg0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d0X3NyaW92X3BmX3NlcnZpY2UuYyB8IDIzDQo+ICsrKysrKysrKysrKysrKysrKysrLQ0KPiAg
MSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rfc3Jpb3ZfcGZfc2VydmljZS5jDQo+
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3NyaW92X3BmX3NlcnZpY2UuYw0KPiBpbmRleCA5
MjRlNzViOTRhZWMuLjZiNWY4NDlhMDcyMiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2d0X3NyaW92X3BmX3NlcnZpY2UuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3Rfc3Jpb3ZfcGZfc2VydmljZS5jDQo+IEBAIC0xNzYsMTEgKzE3NiwzMiBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IHhlX3JlZyB2ZXJfMjAwMF9ydW50aW1lX3JlZ3NbXQ0KPiA9IHsNCj4gIAlU
SU1FU1RBTVBfT1ZFUlJJREUsCQkvKiBfTU1JTygweDQ0MDc0KSAqLw0KPiAgfTsNCj4gDQo+ICtz
dGF0aWMgY29uc3Qgc3RydWN0IHhlX3JlZyB2ZXJfMzAwMF9ydW50aW1lX3JlZ3NbXSA9IHsNCj4g
KwlSUE1fQ09ORklHMCwJCQkvKiBfTU1JTygweDBkMDApICovDQo+ICsJWEVIUF9GVVNFNCwJCQkv
KiBfTU1JTygweDkxMTQpICovDQo+ICsJTUlSUk9SX0ZVU0UzLAkJCS8qIF9NTUlPKDB4OTExOCkg
Ki8NCj4gKwlNSVJST1JfRlVTRTEsCQkJLyogX01NSU8oMHg5MTFjKSAqLw0KPiArCU1JUlJPUl9M
M0JBTktfRU5BQkxFLAkJLyogX01NSU8oMHg5MTMwKSAqLw0KPiArCVhFTFBfRVVfRU5BQkxFLAkJ
CS8qIF9NTUlPKDB4OTEzNCkgKi8NCj4gKwlYRUxQX0dUX0dFT01FVFJZX0RTU19FTkFCTEUsCS8q
IF9NTUlPKDB4OTEzYykgKi8NCj4gKwlHVF9WRUJPWF9WREJPWF9ESVNBQkxFLAkJLyogX01NSU8o
MHg5MTQwKSAqLw0KPiArCVhFSFBfR1RfQ09NUFVURV9EU1NfRU5BQkxFLAkvKiBfTU1JTygweDkx
NDQpICovDQo+ICsJWEVIUENfR1RfQ09NUFVURV9EU1NfRU5BQkxFX0VYVCwvKiBfTU1JTygweDkx
NDgpICovDQo+ICsJWEUyX0dUX0NPTVBVVEVfRFNTXzIsCQkvKiBfTU1JTygweDkxNGMpICovDQo+
ICsJWEUyX0dUX0dFT01FVFJZX0RTU18xLAkJLyogX01NSU8oMHg5MTUwKSAqLw0KPiArCVhFMl9H
VF9HRU9NRVRSWV9EU1NfMiwJCS8qIF9NTUlPKDB4OTE1NCkgKi8NCj4gKwlDVENfTU9ERSwJCQkv
KiBfTU1JTygweGEyNmMpICovDQo+ICsJSFVDX0tFUk5FTF9MT0FEX0lORk8sCQkvKiBfTU1JTygw
eGMxZGMpICovDQo+ICt9Ow0KPiArDQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHhlX3JlZyAqcGlj
a19ydW50aW1lX3JlZ3Moc3RydWN0IHhlX2RldmljZSAqeGUsIHVuc2lnbmVkDQo+IGludCAqY291
bnQpDQo+ICB7DQo+ICAJY29uc3Qgc3RydWN0IHhlX3JlZyAqcmVnczsNCj4gDQo+IC0JaWYgKEdS
QVBISUNTX1ZFUngxMDAoeGUpID49IDIwMDApIHsNCj4gKwlpZiAoR1JBUEhJQ1NfVkVSeDEwMCh4
ZSkgPj0gMzAwMCkgew0KPiArCQkqY291bnQgPSBBUlJBWV9TSVpFKHZlcl8zMDAwX3J1bnRpbWVf
cmVncyk7DQo+ICsJCXJlZ3MgPSB2ZXJfMzAwMF9ydW50aW1lX3JlZ3M7DQo+ICsJfSBlbHNlIGlm
IChHUkFQSElDU19WRVJ4MTAwKHhlKSA+PSAyMDAwKSB7DQo+ICAJCSpjb3VudCA9IEFSUkFZX1NJ
WkUodmVyXzIwMDBfcnVudGltZV9yZWdzKTsNCj4gIAkJcmVncyA9IHZlcl8yMDAwX3J1bnRpbWVf
cmVnczsNCj4gIAl9IGVsc2UgaWYgKEdSQVBISUNTX1ZFUngxMDAoeGUpID49IDEyNzApIHsNCj4g
LS0NCj4gMi4yNS4xDQoNCg==
