Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FCBCCFA05
	for <intel-xe@archiver.kernel.org>; Thu,  6 Nov 2025 10:45:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E4DE10E88C;
	Thu,  6 Nov 2025 10:45:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SvtY4/kY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0ACB10E88D
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Nov 2025 10:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762425914; x=1793961914;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p0vnQB1cBzDaRi46d3WZVLX/fqJn3EMdQOV5nmcxfcs=;
 b=SvtY4/kYTaZ4ZLGR0BtozNR9XVhy9N7I/Q+ucWKsu1xbqgnmwKxtPVbA
 QY3fqcaVxSox3mRtxDgp5u0vNS6MMzyI5D3Kr6UbFYOW4LRDVRh6w+JWi
 7969+FxklBV3htAPpGrhQIW1gS4vnQ46oEyhWQmj2DcgVxxfquvNe2Om7
 RUKk/HsqlzdD/DSQb+OoXpFMYPNBHDb1LfNb11K87qhWNz2ivcyVWExrI
 4qSel3syO0ujWvQ/QleOiroAObA917a5baZL5m3e6tiSb4+dkkZSo+Xvb
 488pol2YwiNi2/TcJQ1OfJaD0zpfVoZ3I3HYPUwsHdBjBbMwWOIuQlRAQ g==;
X-CSE-ConnectionGUID: QQawK/OYTPCnP6b62houkg==
X-CSE-MsgGUID: ftoYOjLNRUaByBuIjjZ/Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="63763659"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="63763659"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 02:45:14 -0800
X-CSE-ConnectionGUID: PTApnplySF2ewke4IZjPCA==
X-CSE-MsgGUID: zSs+S8brQCiOBZKoVsLU6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="211188275"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 02:45:13 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 02:45:13 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 02:45:13 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.21) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 02:45:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=enpfTS6W5Vbz+53Ko3GJTsAQpw90AtRNZVG6V3q/EF+2iDAjAmMf+bbRINk7FKQatGwg09u4VRE7xPnrCVHWdRYIOEJspuL7rlPtzulH+XnpG08U4Tjxg+GyONVZg+RQwhUe4lRTqnZQIEnSLnFAgW3p7iFFIXlmyw0VVX3TgpD1hXlKLkMHWj3umlzP/8fi0Mf9hzk/olPkEH6V5V/V/X/HtzWA0HmQT3n/VnEIRuHiCnEvXe5/skiGfizr5I/g27/X+nSGTcr1FtUbcXrJNmwph+KGS21XcmttoB/6S4UfwhZI2x57GNxe7/TSlmhHtht0Y+4H1hjRFhrVDVozsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UxpZfl9zK9gQOCcHVUtG1txJuwH4saCicr18Zp/nLpU=;
 b=q577WMzVw1nQnSWUjGekHz1eZU5Fg0s2q0JF3eE3RZvgceAQmx4pZZ+Hhp4eGyM6KevrLb95CEklr7qIW2bPX2XzO6gMJps83mrnLcu0AwAdSglcGhU1X5pB/t6swIrQKR2pESYpbbrn/MLx9Wcisyz54xBFv8KB25FCiB9XYuWm29XK9ThbkupoL/eF6yxxE4ZI821/Ut/FGSJOvMRPGWFiN8mcofOG9NI66+SL7L/X6oxTexCLrc4fWQvU+pDr3jBD06g2lBGYmia/jadTDg8+7kXMgubZxB1eRhXAt+4n9cryOFzGFt9DQkOMcBqxIeaRbtpGfoKUqTHdaklYjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by BL1PR11MB6050.namprd11.prod.outlook.com (2603:10b6:208:392::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Thu, 6 Nov
 2025 10:45:05 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9275.015; Thu, 6 Nov 2025
 10:45:04 +0000
Message-ID: <76ae6ad0-b508-48ff-8f21-ba9afa17f399@intel.com>
Date: Thu, 6 Nov 2025 11:45:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/xe/pf: Allow to lockdown the PF using custom guard
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Nareshkumar Gollakoti
 <naresh.kumar.g@intel.com>, Maciej Patelczyk <maciej.patelczyk@intel.com>
References: <20251105130105.582-1-michal.wajdeczko@intel.com>
 <2233ef9b-3979-4009-a45a-0af0de2b6812@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <2233ef9b-3979-4009-a45a-0af0de2b6812@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0902CA0036.eurprd09.prod.outlook.com
 (2603:10a6:802:1::25) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|BL1PR11MB6050:EE_
X-MS-Office365-Filtering-Correlation-Id: b11f419c-d2cd-4737-e0c9-08de1d218b86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VHVIYzFkcWpnZ0dCb1RjSlBQdDNYWmhuSlpUbFg0dGh5Sk9RbUdMbTd2a0VT?=
 =?utf-8?B?Z2ZhNlJwWjFyUEp6R1krTUJFbEdWZTNGT0hKUmliNlBjOUw2WEFlUDVuWmpX?=
 =?utf-8?B?bmJib3dzYW5SOWVQU21XZkkrSERtMDJsbDhRRkszV1lXSjhwNXp0MDN4MjVR?=
 =?utf-8?B?ay8xVVRNQUxnd0dGUyt5T1o5bm5CTllxVHRHaE9mWklJbVViQkdsMEpLWjdo?=
 =?utf-8?B?RkVXTWdiRG4waWJDSDVpMnFaaDBnQU9OcjFNeDU4R2xiRC9RNWxkcE9PMito?=
 =?utf-8?B?K0FyZWhZOW41b2ZiOFJYUHQrdGJHMzRnSjNsdG1pQUN2U0JFQnF1VWo0R2ov?=
 =?utf-8?B?Smk2ZGQ2ZzlZd0Zkd0NGMFpDOWRXYkJJOUpsL01vNE9rWU5US1FHWXJDcDh1?=
 =?utf-8?B?ZE1iN2R4OXk1citqZXM4ZUZHQ3d1L1ZjR2tma3hBQ2VjT2RUZm9sc0hwMjRT?=
 =?utf-8?B?UnJvaGp2bmlYYUVDa2hrbkt6Z1dGaXN5WlIzZFlneWdBanI1a01Xd1MvdDBw?=
 =?utf-8?B?eUFBN005b1lHenppdEdYQmxiQ1h5V040OGlxUWdJendKQnRXazJ1cDlCWlI3?=
 =?utf-8?B?WC80STMxa0ZKc3Z0VlNSR0V5THdDSzF1VVhXNlpPVktJblRZZGpmTFgzU2U1?=
 =?utf-8?B?T1R5anVkbzUzWE44L0xpdkJWcTc2N0ViVjJhamp5TjJRMC8xcjRqeU1vcU9p?=
 =?utf-8?B?KzUvTTd1TGNZWnZWeUVnYVd4VlRSZlpzTTczTUk5dm5KQTEvTTM1Z1FyUGty?=
 =?utf-8?B?OWtnTDlBSmdtRmlVRysyUExKY0w5WXlJeWFVZThMQWhTcW1IYkREaG1TYlll?=
 =?utf-8?B?a3hrWDl2YTBKVThVOHFqRVlQSU1qa3RzMC9mbEZHV0lVKzV4UmdMMTlPamhO?=
 =?utf-8?B?V0ZDbkdPSUwxYVlObzlzTmUwOERPeXVOK0pGNENOanc3U016TVArSWhOVSs1?=
 =?utf-8?B?Qm5KeXdZQ0dCaFpVNGc4cW1kcXNuYU01YlJrWWZpbXVqcGtWRmdVWGNBODFJ?=
 =?utf-8?B?Q0NjV05xcnpTQzM2VTVuaTlZbkRubXhWWnFXRTdwVFUyNXV2QnRicTdzc3FG?=
 =?utf-8?B?UjV1UmhoYkNXdUhIVy9hSHBPUzlaUmNjVzk2cHo2WTMrWWptdndXbWJYcU50?=
 =?utf-8?B?TFkyaUlnQ3AyQU0yd21JcU4xSGpXdVByMUJmU3NuNEFYYmFOV25aOEwvWmVQ?=
 =?utf-8?B?YlhBWUlIbjJ1NUgxNzg0VTVEZnhENTVoTUhCUDFsWkVEVHJMelJvVGh1UmRN?=
 =?utf-8?B?anNselZreGl6VERablQvZ2IrLzNvNUY1aXNjeHU2d01iOFozUDFlUk4yMEtH?=
 =?utf-8?B?UDZnNHdOek9oc0J6blpoa2tXaDM1Rm90ZUFlYkFxQnlCMXAxSjVqUitvT2x1?=
 =?utf-8?B?cE5JM3puOENZT2JES29INHJWYTVMYjNEQzQwNCtXdklVaFVDdzNnZDEvWjZn?=
 =?utf-8?B?d1ZCaVlpTjF3UmlCVGdNZVVqRUp3d0djcnFQVmFQZHg0blRFUmlHaGtaVmx3?=
 =?utf-8?B?d1JBRXYyVisyRXppRGNmSjI4RFFpS0RxZ3V4WnhzZ1JrQ3l3dk54YWFCallX?=
 =?utf-8?B?U0RpREMwYmlxT2YvZjZmU0dKdGQwVGQ2alA2WHYweldBN0pkM1RkRGw3aDkx?=
 =?utf-8?B?TnUxdHN3YnJKNkJxYkYwbjhFVHAvSWpqam5BNnA4YVBTTUNGdlRQYjF2WVk2?=
 =?utf-8?B?eTNjeTRzYXNLbmY1N2pzTXF3NTdBR0t1bW9Xa1BDRWppbzJXL0dvaEZqODRZ?=
 =?utf-8?B?UThEaGszUXF0YmVGQ251ZkFKWEVETmFKK2Znb3U1OCtHYk5ZNmNsZkp4QSs5?=
 =?utf-8?B?OG9EbmEvYzRIWFZzY1BpRFZIeFBPKzdubHk1OENwTWwwMVl1Rm0rRWo2aU5K?=
 =?utf-8?B?QmJsUkQ5SytmelRmbVpzUWUvYnFkRWxuSHhJRjc5Vm1TQUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGFXL0lIcDJqVzBsZUVDdGJmSEVDQnNtT25ycTdOZmJXV1lFRFdjUjBiZnNE?=
 =?utf-8?B?b3U1dElSVnZRWXdNTkQvWisybmtCdy9Zbzhnd1EzTTlHMlZqcjUzYlVrQXpX?=
 =?utf-8?B?Wms1eCswbE04TTM0bDcxQ05vQ2QrOWUwNWNzdUEwUUtWb2pmN0lIUmhyRzIr?=
 =?utf-8?B?Wk5MRjhMSlA1cUdZVFI5bkhlblRrSVZ0WFV1OXNvamlQM2hFUHhhMTh4dTB4?=
 =?utf-8?B?YjBCL3ZHRVNHN3p0dUdMTTlUZnVNVjk2anY3Mlh1V0NXUjBRSXJDWGRXbCtm?=
 =?utf-8?B?d3owbEdIR0R4NG1GUkFDR2NkZFRocjkwM2k0K1JaOGxrMk5qdWd6OFpPdmtR?=
 =?utf-8?B?a3ArQjBuT3hiZXJJdkpFY3ZhSHJ0N3gzS1BRSmF3cDBuSmJ3Y2Npam5ZTXhI?=
 =?utf-8?B?VElLbE5VV0VJc014c2tWRzlFdy9zKytNS2FYcy9CbHFrKytQRTgzOHc4K2dk?=
 =?utf-8?B?SEQ1YjlDQnlQbUlGbjd0cCtZMGprMkNsUEh4WTg0b0lDNWt3VEM0c3Q3RWZn?=
 =?utf-8?B?elpjWmplRFp1T0lhYUVwbmZTbzM4c1JCams5czBRU0s2d1B3c1BlUXVtUkhY?=
 =?utf-8?B?T1NUN3BZK21DR2tBQndCTDRlMWhxVG5PeVJUUnlLbUxSaTRkWUVQRnhxR2x0?=
 =?utf-8?B?dWxuMHJORXZONmhvN0p6c0o3QlBDMGlieUFEc0svNHhCcHE0Sk8wVGpKTFA2?=
 =?utf-8?B?UmluWmhPZ2EzaXBPelBzL0hIWnN3bzFVR0kyWXVKbzVici96eGJiQlhRZDZr?=
 =?utf-8?B?WFFlVFRSZUczZmFzN0NZcWlCZ0I5ZmhCcVozNDRSTHhodWRXeklxcUQzbHFD?=
 =?utf-8?B?Ylc5YS9iYW9tbHdEZzI4MS81amlzSTRHTEZud2VKbHJoMHZ3clpCaWpzRExG?=
 =?utf-8?B?QnBYZC8vTmMxckx3MmlKSmhpN2RRQkpXcnUzNU9rWDR2Y1J4WlJFdDhPK0Zq?=
 =?utf-8?B?VWJZcm1yaGpqZnY2S2JSUmNoSWlmNTJnSm5VcmJpVHpxVlFjUnJaWUtuZVVk?=
 =?utf-8?B?ck1XMXc4QVBLN2RGOVFlMTBSdUxqSWg5YlptemFJMG9xQTBFdUNHQnFRZm1W?=
 =?utf-8?B?NmZZR3Z5SS9ITlVXZmtDbVNpZnVzSEVhbzhwcGQ3NmR3MnlkcSsrOCtvdE5y?=
 =?utf-8?B?QnBCcHMrSXozRXp0K1dsWDhhS1N2eU1TeWQ0RWhqYTVHbkIyanFQaFpoZFFF?=
 =?utf-8?B?VkVrdTArSmsyNVN3ckJPRks5Sm1tam5VdzJJbm1EYUVud2c3SVNwaHN6U3Ji?=
 =?utf-8?B?dEdLRU8raDBIbFdUWkgrSGRxb3BvQnczZTNlbjBOYnI5UzVPTlNucHpaZGZL?=
 =?utf-8?B?anlJTnQ0NXBSdENnUmMvSk9zcWJIMnp0S0c5YjBXa0ozNG96TW8xQ2xCL2Jk?=
 =?utf-8?B?SnErajI4TkljNmZHaFhSTVN0MTltT2NKZzdtVkg5RzEyVGVZeTJUZkpYVERy?=
 =?utf-8?B?SVZ5RWEzM1ByQmhPamR6QXpOdThCaWptQnMwT1AwS0FHaVlFZUV5RkZyeURP?=
 =?utf-8?B?TWE2ZWt0bzBPWkV5M1Z0QTJNS1JjMVZvcjZFZGh5NjB4NjZRMEJueUdDVnBN?=
 =?utf-8?B?T1hGTXkrU3J5VUJaY3ZGaWFhejFUbkx5d2YyR1NwUE9RcGxJUmljT0FkYkZN?=
 =?utf-8?B?L0dMYk1YWTdnL3dxekV6Ris2RGtsMnVlNkcrZDRNR0lFTUsyVTFydllYbkcz?=
 =?utf-8?B?bkk0RGEwMTdXZHhyNnFkVWhvMEtLNGpsdy9lYjFlMldDbDhBVDFVYXJXLzJ2?=
 =?utf-8?B?eVpyci9Bd3VJUkRoRVk4NVFmK0I0bVNOUytwR2FDazQrblBGU2hLNDJ6bmR2?=
 =?utf-8?B?azZuTlZtUzdNbUtiUzJVTi8rM0NLSitSczJYQjNGTTN1QWJuTlI2bzh5TzV0?=
 =?utf-8?B?dVdibGFnU01oajNFdzdqYVplL0RiZHR3Mm12R2dScGtYV0ZCMWc0VktCVTJU?=
 =?utf-8?B?bGRWRkVBMndWOGtDRG8xUHF1akpNb2p5cFRDZlY1SFdURnluQms3aVdjTC93?=
 =?utf-8?B?cEJWeDFmZWRjc2pwSk1PWCtJR2E3VzIxTFR6TndwZ1lTVi9abmtLbjc2YzlH?=
 =?utf-8?B?TEQ5TjJvRGdPbmlZMDFZYU5VSUw1K2dwVEtZTi91c3FyMkZLdUpzTGZORndw?=
 =?utf-8?B?TlpOcG1jUytSS3ltbzZVTGw3WDFWczJybjhSeStDUk12TWtaTHQ0RHpXc1dk?=
 =?utf-8?B?bkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b11f419c-d2cd-4737-e0c9-08de1d218b86
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 10:45:04.7525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zLjScB6eR788AmCO5/gbpeA473u0VPODCB0ExWPUsEySqGBR7mR+PUvcKiQVzWiAR5UocbcEf9HjBLhJeoLW1aIxmHsRioTPqE4I4nhDXwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6050
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



On 11/6/2025 11:30 AM, Manszewski, Christoph wrote:
> Hi Michal,
> 
> On 5.11.2025 14:00, Michal Wajdeczko wrote:
>> Some driver components, like eudebug or ccs-mode, can't be used
>> when VFs are enabled.  Add functions to allow those components
>> to block the PF from enabling VFs for the requested duration.
>>
>> Introduce trivial counter to allow lockdown or exclusive access
>> that can be used in the scenarios where we can't follow the strict
>> owner semantics as required by the rw_semaphore implementation.
>>
>> Before enabling VFs, the PF will try to arm the "vfs_enabling"
>> guard for the exclusive access.  This will fail if there are
>> some lockdown requests already initiated by the other components.
>>
>> For testing purposes, add debugfs file which will call these new
>> functions from the file's open/close hooks.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Christoph Manszewski <christoph.manszewski@intel.com>
>> ---
>> v1: https://patchwork.freedesktop.org/series/156687/#rev1
>> v2: https://patchwork.freedesktop.org/series/156795/#rev1
>>      use less confusing names (Matthew/Christoph)
>>      allow many components to lockdown the PF (Christoph)
>> v3: no atomic_t, just use spinlock (Matthew)
>> v4: add missing local change (Michal)
>> ---
>> Cc: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
>> Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guard.h            | 119 +++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pci_sriov.c        |  21 ++++
>>   drivers/gpu/drm/xe/xe_sriov_pf.c         |  98 +++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_sriov_pf.h         |   4 +
>>   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c |  30 ++++++
>>   drivers/gpu/drm/xe/xe_sriov_pf_helpers.h |   5 +
>>   drivers/gpu/drm/xe/xe_sriov_pf_types.h   |   4 +
>>   7 files changed, 281 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_guard.h
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guard.h b/drivers/gpu/drm/xe/xe_guard.h
>> new file mode 100644
>> index 000000000000..333f8e13b5a1
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_guard.h
>> @@ -0,0 +1,119 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GUARD_H_
>> +#define _XE_GUARD_H_
>> +
>> +#include <linux/spinlock.h>
>> +
>> +/**
>> + * struct xe_guard - Simple logic to protect a feature.
>> + *
>> + * Implements simple semaphore-like logic that can be used to lockdown the
>> + * feature unless it is already in use.  Allows enabling of the otherwise
> 
> Nit: double space before 'Allows'

it was on purpose, like usually done (in many places that use plain text) to emphasize start of the new sentence
(but I don't care)

> 
> 
>> + * incompatible features, where we can't follow the strict owner semantics
>> + * required by the &rw_semaphore.
>> + *
>> + * NOTE! It shouldn't be used to protect a data, use &rw_semaphore instead.
>> + */
>> +struct xe_guard {
>> +    /**
>> +     * @counter: implements simple exclusive/lockdown logic:
>> +     *           if == 0 then guard/feature is idle/not in use,
>> +     *           if < 0 then feature is active and can't be locked-down,
>> +     *           if > 0 then feature is lockded-down and can't be activated.
>> +     */
>> +    int counter;
>> +
>> +    /** @name: the name of the guard (useful for debug) */
>> +    const char *name;
>> +
>> +    /** @owner: the info about the last owner of the guard (for debug) */
>> +    void *owner;
>> +
>> +    /** @lock: protects guard's data */
>> +    spinlock_t lock;
>> +};
>> +
>> +/**
>> + * xe_guard_init() - Initialize the guard.
>> + * @guard: the &xe_guard to init
>> + * @name: name of the guard
>> + */
>> +static inline void xe_guard_init(struct xe_guard *guard, const char *name)
>> +{
>> +    spin_lock_init(&guard->lock);
>> +    guard->counter = 0;
>> +    guard->name = name;
>> +}
>> +
>> +/**
>> + * xe_guard_arm() - Arm the guard for the exclusive/lockdown mode.
>> + * @guard: the &xe_guard to arm
>> + * @lockdown: arm for lockdown(true) or exclusive(false) mode
>> + * @who: optional owner info (for debug only)
>> + *
>> + * Multiple lockdown requests are allowed.
>> + * Only single exclusive access can be granted.
>> + * Will fail if the guard is already in exclusive mode.
>> + * On success, must call the xe_guard_disarm() to release.
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
> 
> I am not sold on the arm/disarm and exclusive/lockdown naming. Something like 'get/put' and 'exclusive/shared' sounds more familiar, but that's just a personal opinion.

actually I was considering "lockdown_get|put" and "exclusive_get|put" but still was afraid of being accused of using misleading tags used elsewhere

also note that "shared" is actually a bad term here, as in our case we are not going to "share" the feature with anyone, there just might be collective requests to "block" the feature

and this is how I ended with the "lockdown" naming

> 
> None the less the solution looks clean and does what it should so:
> 
> Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>

thanks, but you have to wait for another rev anyway (see below)

> 
> Regards,
> Christoph
> 

...

>> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.h b/drivers/gpu/drm/xe/xe_sriov_pf.h
>> index cba3fde9581f..b5bee3a549c1 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_pf.h
>> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.h
>> @@ -17,11 +17,15 @@ bool xe_sriov_pf_readiness(struct xe_device *xe);
>>   int xe_sriov_pf_init_early(struct xe_device *xe);
>>   int xe_sriov_pf_init_late(struct xe_device *xe);
>>   int xe_sriov_pf_wait_ready(struct xe_device *xe);
>> +int xe_sriov_pf_lockdown(struct xe_device *xe);
>> +void xe_sriov_pf_end_lockdown(struct xe_device *xe);
>>   void xe_sriov_pf_print_vfs_summary(struct xe_device *xe, struct drm_printer *p);
>>   #else
>>   static inline bool xe_sriov_pf_readiness(struct xe_device *xe) { return false; }
>>   static inline int xe_sriov_pf_init_early(struct xe_device *xe) { return 0; }
>>   static inline int xe_sriov_pf_init_late(struct xe_device *xe) { return 0; }
>> +int xe_sriov_pf_lockdown(struct xe_device *xe) { return 0; }
>> +void xe_sriov_pf_end_lockdown(struct xe_device *xe) { }

those stubs shall be "static inline"
