Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CADC021BB
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 15:40:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A88DC10E3F6;
	Mon, 24 Feb 2025 15:40:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y99wG5sy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A36AF10E3F6
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 15:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740411618; x=1771947618;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IjW4jQDDDmQISqRS/hQgx/j56hmEGjWovQwfh0yOfVg=;
 b=Y99wG5syw/9mXoosWT7PRapWITaaoUmZsL1Z3XYaUCsQKJ/F651BfWkX
 0phqwdx7F0U+AUb6TkmoRzuhOI3wsdSW32r56PXRMCLtdf3SJ9+1/i81+
 zHfE9UZeoFbe3SbUN1UvP52PqchnOddyDySnj/I5OoSVwZ6FbqhTMqt+Q
 2J8FH8gRzhZvgMwM1oGGI44KYyyKAWBPqVR0aB05C4I3JdEF6ISRc5LiJ
 bIAPCx9kMd93+J1pr1RMndU+Llg9rBS1UXIfnQEpf1UYT/EP1J+usXX61
 Ap45umkA+Hx7YdUmfgHNskEXYZiI+DjaMiZDRvpCv7qyBZSCBjAgEafdV g==;
X-CSE-ConnectionGUID: fH7brgZqSRSgXh8emoEaSQ==
X-CSE-MsgGUID: smbUxSO0Qf6pt+koKiDjCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41379324"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="41379324"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 07:40:18 -0800
X-CSE-ConnectionGUID: y92ZtiOGS7y6XY1+jgLv6g==
X-CSE-MsgGUID: XdF+NGN0RDua/6FDnWfFVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="121188238"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 07:40:17 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 24 Feb 2025 07:40:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Feb 2025 07:40:16 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 07:40:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RtYccZxDxHsOxT48C6xsqm9E7u/3f1G7XCEYGAiRFya3mteN/bIlkuNUWSKBBX9Ghzi8ClW7YBJ4ROn85MCnUBI/kyT0uBsc+f7+Yxs4xgicyKrYZv/EPWs54k1JdwWERXWNJ8Sr+SM2atGx890hP8+7VQXuLtrn+/f1Y1bKT70Hh53/VZBLsCjDN6n0HhcQ+otaPNbL65yXZRODXcU/iq0wwYD18KsmwHrXX96cgGgsFFUfLFFX9+4meTC9ileFBTI9D4fOBJ0fRTDMjI2QOS2J7z41JL3s+Yzf50Q/ZaiicRtliGVhW1gqNcOiWeHY+PGlgOvsVRk+8kWPrvKeqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IjW4jQDDDmQISqRS/hQgx/j56hmEGjWovQwfh0yOfVg=;
 b=eqTATcMYVW8Zvi7kJZF5HVHrtEaaOPJZQPnC2LhdPBrpzazvBPhvq4RX9V3YaCUH3hldkYmEvDuOEBqhDgNzLUMyEQ7mmcl9yK9/4i0tRl9+NydxKbYY19gV9HSB6wZJzK2zybs/qPIU8T6q5yTteles7kMtXDDeeizYSG3ruK0T/lTk6aL3fK2+yEFLBMW/kRB6jmrCFgSiaR5PeAoC06kzospPF6K4ZlAlK+GrM5XwTiol9j7onxH+M0HRFL71lSjvmMqYKudaZ5BxdqYAjDJ3SMxSgYvTLSbIh8R3WUwf3wR7bR5rAiyWUvu2ayIDWCtwcN6NyOeqQLH64sqlpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN2PR11MB4728.namprd11.prod.outlook.com (2603:10b6:208:261::17)
 by CH3PR11MB7724.namprd11.prod.outlook.com (2603:10b6:610:123::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 15:40:06 +0000
Received: from MN2PR11MB4728.namprd11.prod.outlook.com
 ([fe80::2fe8:64e:97a1:b4bf]) by MN2PR11MB4728.namprd11.prod.outlook.com
 ([fe80::2fe8:64e:97a1:b4bf%5]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 15:40:06 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 1/3] drm/xe: Introduced needs_scratch bit in device
 descriptor
Thread-Topic: [PATCH 1/3] drm/xe: Introduced needs_scratch bit in device
 descriptor
Thread-Index: AQHbfbwtWOsCciYy/UuFrGXBkkZBvrNWqSHw
Date: Mon, 24 Feb 2025 15:40:06 +0000
Message-ID: <MN2PR11MB4728E30D83FCD668D015423A92C02@MN2PR11MB4728.namprd11.prod.outlook.com>
References: <20250213022331.265424-1-oak.zeng@intel.com>
In-Reply-To: <20250213022331.265424-1-oak.zeng@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4728:EE_|CH3PR11MB7724:EE_
x-ms-office365-filtering-correlation-id: 19bb6969-e20f-423e-b392-08dd54e98353
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?OWpSMVpkTC96QVJtVGk5UEVVUVBRa3pNM0RCU250d1NlSVFQcE91aWJJZlla?=
 =?utf-8?B?SVV0aWp1U3pCTm9kd0R1LytnMzlTT3Ayc1hWVjhJWEZSazU2L3dCY3UzdUNk?=
 =?utf-8?B?b2Y3dzhGVWZld2NEM3VPS3VFbXZkb0N1L2M1U1V2dWNnV09VN2lDeEhpMVIr?=
 =?utf-8?B?OVZLNG9SYTNWdHZrSXlkdFdNRWlqa3hjOHJTMDcxTnRrNThsT1BIcXBvSEJY?=
 =?utf-8?B?ZndVNmJvNEtzTjRsTDdYcW1uYnI0NTZxK3c0ZHUwaXRZaDI3S2ZLTGZOdTRw?=
 =?utf-8?B?NCtRMnpGT2c1QXFSVW1JMGtZVTEySyt3WUdwNmt2RlphMVlZbDZEVEFxWW9r?=
 =?utf-8?B?aUExUTNnNHJ3MS82bjl0NTVrQXJrclJzTDA0QlQzRkJvR3FMekR1UU1CNStB?=
 =?utf-8?B?ZFlXUnpINGtZVDBKaDAvTlFISktEeWsyZTZPKzM2VmUzS1FDNlByUVFOWXh4?=
 =?utf-8?B?NXh3N0FUdHBHOFl5R2RHcU1PVVpFMm5jcVdTcXRNZU1oVXgybmlRQzFBTE1E?=
 =?utf-8?B?OFFQc1hWdW5xQ0tyaVFGYzVSdEk4VU5PZnRTTitZRFAvOTFUUUdCb1FhN0hD?=
 =?utf-8?B?WjJKTVB5THMxZTVEWWtMNDg4T3NmdEwrUXpqRkdPVzBndnZVWG5sUE5nUmY4?=
 =?utf-8?B?RW51Y29pbEhyRlo4bHVhZE0zOUZQQTFZd2xZRndWS0xUQW9vZGpYb3FUUnZ5?=
 =?utf-8?B?RDRPZzFaVWM3S29GNWRTQVpKaGhFMVRLTE9xV0VwSWhIM2tpbVV4UzdBeVlz?=
 =?utf-8?B?dElPMXlDU1BQZmFDYkExNWdXVk05ZnIvNnVWcm1jQ21sUkVkdEZmWnd0VUdM?=
 =?utf-8?B?cjNmNHVJeGovYmlpSWJ0RGhtZWRaVkFqRnFsQmZCc3lCM3c2NThaclB1WEJU?=
 =?utf-8?B?dE40Szd2a1AzbkxTYnA3M2g5OVJjZWw0U1AyNzRqWDkwMEI5aDB6RytrUDhE?=
 =?utf-8?B?WHpRRGk0emVLRndlSDd2ZVZCUW1xNTBRb2NKSTlZQVpaaDZ4WnhCS2hQb2xK?=
 =?utf-8?B?aDB4czVpOWlicXRURWZzRFRvMkZ3V0lyR0FaS3MyTlZNOTdUcjJXKzJYYXpF?=
 =?utf-8?B?eENDRVBRVUxjUk0xUUVkcnhaMCtvTDRPQ1BRUmRvOGp2RVIyV3RhL2ZIMFJp?=
 =?utf-8?B?emVzSVpHVnRMUllBL2lIM1BMdi9wOGY5blpNTnZGZVFxbXFRV2cwZWt4elNL?=
 =?utf-8?B?eEI2YXVqNGFxbkFGdlNCVHhlRDcvblRKTUJkRXhhT2YzSWdqMzRnVkt4eG55?=
 =?utf-8?B?MnhNZDd5QTJ4bkZEeWVVcWlLRzd6TUpTT1NvcThqRFo0SE9STUJVQlRDS3ZC?=
 =?utf-8?B?WXEraHk4cDQ1b0VBV0ZoRkIwL0dSSm5saFFKeE1rQVpHQ3o0NEQyRWt6UXZj?=
 =?utf-8?B?Mzc0MytjMGg3aVY2NVY2MDladXJMeVBTc1RZejhBWjhyL3llckxvWXdUUEto?=
 =?utf-8?B?WmEvY1cxZ0M1cDZ4Vmp0SXluZFJDWHV5cTZFTnRDdmxEMWxuWUFDU1I1M3F1?=
 =?utf-8?B?T2RKNGg5UmRrc1o3ZWI0ZThjOHRidU1ldElJby8yTWc5OWthWlU5N3RRWWFP?=
 =?utf-8?B?b1lzdDIyUDIzRkp4VDZuejRodEV5RnlEN0ZGanVya3FDTENXcVZPNkhrZmky?=
 =?utf-8?B?SEp5eUx4SXlMdzhXeHBZd0lqMzFPWnE1R1VzN2d3NDduR045VWpucHVnMzU3?=
 =?utf-8?B?Zm9Bc1hXSnhmWVVNaDZ2MXdjdG9wMHNVNWNkNWY5VmUzOWNXbCtZYWJoOEJI?=
 =?utf-8?B?NzdJRDdKNSt6QmUrbGZ5cDBORHluYVJWV3lhR2F1TWpmamRHRG8wRC8wendp?=
 =?utf-8?B?ell0N2EvREFOUGFVcG1Lbm5yNEZ0OGQxaVJWcGhkSFNUTThUMndhdU1NRUs2?=
 =?utf-8?B?WFBFVS9oZGI4S2xkcXhuTVg5TURHMFdlWGE5YWpIdUlzdHNIQkVNTWtGWURp?=
 =?utf-8?Q?RkSHdKYd7zoVFRw0trKbHqpcCoABM/FL?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4728.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?enZOMU9CcUJXL2R1UVkrZGxBY2UzNkROL2h3QkdMclk4RzZtdUhaY0FGWVVt?=
 =?utf-8?B?bHp5cGE0cDZ6ZVNmRHhvaUV1b2VVK2tTQXBXamgyWjZvR21JVE5IUVRsSGdr?=
 =?utf-8?B?eHd1Ujd0UUExdnhKcUEvaURqbEcyRU1GTFI4K1dzV3BrTkYxejdmKzZKMW8v?=
 =?utf-8?B?RkQ2K3AreWFsN1I3TXNBQlpOWmgzNmxLKys4bGJLTGVWcGpLc25TVkltNW03?=
 =?utf-8?B?UnFRTUMwbjM4QlRhTEZlMlNrKzdMNFQ2YUpwcTBoQXFacExaTnhySFZieitn?=
 =?utf-8?B?ZjBwdHJ2N3Btcy9YLy9PVkgwRlJqS0N2cW9FZ1NyVlFKRUtYNzFiemgxMkFs?=
 =?utf-8?B?cWRISmdyMWVpRUVrd3JRaE50eDhvWStHK0M5K2VJTG9kRlkyNGI5blY3Kzlx?=
 =?utf-8?B?NHlkMWI3SW1KVGZ3VFlhQUl4N1I4WnBmaG1FKzhjMUtIUmFWdk0rL3d5L2w1?=
 =?utf-8?B?cENBdkduclpsRTR5K0VRUkQvSEhxUnVyTW9qeXR3WWdtaTYxS2xhVTYyRUR3?=
 =?utf-8?B?WUxTZ05sMlFZMDR3ditreEJaQmlJWjVBRXZvdEwzL2NKY1BRTjRjcER4Sllp?=
 =?utf-8?B?RzNHSHd0TWxvUGF4OHhWdGtmdWhoUXFnYThuTUZ1NG1ZN0wwbnZYYzdwYXIw?=
 =?utf-8?B?bWxWc0orRDRtYmU1TFozUEZmdkFIYUt1V2VQMENPbkxIVXN2OE5rR05nUUpm?=
 =?utf-8?B?bld0dnduOGJMQm9VanlwRVZ2RGxPWUo0ZjNzanZxNW45RkdOR0dXMGVIZ09K?=
 =?utf-8?B?ZWswekc1cHk0WlkremR3UXFNZUh2Wk5oM0kxT2RoVjd0cXRzc3R0UGY5TkJq?=
 =?utf-8?B?UXNZbS9KbUtGWEFDWVlEbVlBaU42dWhVK2Zrc2huNlVxcE55OUg2MU5IcS9i?=
 =?utf-8?B?LzI0RFkwQ3l6b3NsRks4WkZvKys4ZzJUZUtsY0dTRUNlNjJXOXJrdENKdHlG?=
 =?utf-8?B?Q1RyN25ISGhhekZmaVlUQmk4WmhQL3IxcGdTNldHRlA4bEZHa0E0bTY0TU9r?=
 =?utf-8?B?cGxkZ0NlYzVCc3c0S0xJc0FCanB1Y3FQb1F5MC9Xb1BFMmt0bXFjM1JLbzNv?=
 =?utf-8?B?WFJmSVZNcjFYazNrRTJ4bDQwVUcvdzNyWnlPMGxhNzBQQW01K2J0N2hFc0JV?=
 =?utf-8?B?NjdQTWJTd21pV2lQSzErRG1mcXYyMkczVWViODhtcmQzSXJ5c2pySFNkci9H?=
 =?utf-8?B?d0hFN1FLSm9hS2xmWHcwajREZjRXYit0RzVkWXJ5UVQ0SlMxQ1gwak1wemlB?=
 =?utf-8?B?UndjcWRsR2p1V2Q3blUzK21PNVNNV0trS2lJbjl1UER4OWpnS1l5a2c1T29l?=
 =?utf-8?B?YVJvbkltUlZQT29sa3NnVnp0bHhPUTg2TGpZOHo4QUNVa201TmxsMldzNUVm?=
 =?utf-8?B?NURrTmhQUjNCOXhpSURTVE9zcFJDaDh1aUdMMUZlaFdVdWJXUjFkT3AvUmtM?=
 =?utf-8?B?WDB1SHUvRDBCejg0Vk9lcjhkaEZSQnpHank3WU85cWJVYjN6amY3MFJvNGJk?=
 =?utf-8?B?L0V0bjBydms1cVBqQWlpajV6UFA0RGpwdithdS80TTlPdTlKcTV2cFgzUzFk?=
 =?utf-8?B?aGF2S2pPWHNOSGlWVzR1Z1FuTllLQ05icjh5cWxBTHp1N3ZnTG1EOHZBdFBM?=
 =?utf-8?B?Y1N5cFlob1ZrM2RucGRjRlk0bWIwbEtBK3RXc09yVThKTUtoS0FiZ1JXNm9R?=
 =?utf-8?B?eWlDQWl0ZU0xL3IvQ2dnS2hjSmkrdWRoQ25QRlVEN0lnZ0t3Y0NyYjdUT3NE?=
 =?utf-8?B?eDNYMlBzeWtvZXJzMmtZUzdnNWk4RmF0N1FoWElZM29SU3JvWlNsTDJMVldD?=
 =?utf-8?B?SU80OGkrUEluanB3RVVBeTg2S0QwdzBQRWdSMGVZMUhZVkFWWjdQR2E4d2dL?=
 =?utf-8?B?UEo3RW5ZSjg5USttWGhINnpJQTR6M2VEQmV4cmVJREF2R3ZJTWJhT3pLMktI?=
 =?utf-8?B?SWpmbkV4NzVVWUZaTHAvTnhTVlZVTkU1UmtZM3VFdk1jZU9ua3JlY210T1VI?=
 =?utf-8?B?eVFaMDlXRUtaSkhSdVl2MXFlbXZqWEdwVFI1MzVVcXJacHVIN25NNmxOUDdI?=
 =?utf-8?B?RTh0dG9xNzVJeEc4UWlTT1FLdTZFMExHZS95L2V0UlFSTy8vUzV1cnppV2JT?=
 =?utf-8?Q?h/94=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4728.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19bb6969-e20f-423e-b392-08dd54e98353
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 15:40:06.3823 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y32fJFSG1APwCkf7uGQd+0ILqUWrTrhfLzz0X/tCHrU1m1ReSU6sJJ8KKQBMk/gTgV67a5/rl+v0pDzANxEJcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7724
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

UGluZw0KDQpUaG9tYXMsIE1hdHQsIGRvIHlvdSBoYXZlIGZ1cnRoZXIgY29tbWVudHMgb24gdGhp
cyBzZXJpZXM/DQoNCk9haw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IEludGVsLXhlIDxpbnRlbC14ZS1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVo
YWxmDQo+IE9mIE9hayBaZW5nDQo+IFNlbnQ6IEZlYnJ1YXJ5IDEyLCAyMDI1IDk6MjMgUE0NCj4g
VG86IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogVGhvbWFzLkhlbGxzdHJv
bUBsaW51eC5pbnRlbC5jb207IEJyb3N0LCBNYXR0aGV3DQo+IDxtYXR0aGV3LmJyb3N0QGludGVs
LmNvbT47IENhdml0dCwgSm9uYXRoYW4NCj4gPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+DQo+
IFN1YmplY3Q6IFtQQVRDSCAxLzNdIGRybS94ZTogSW50cm9kdWNlZCBuZWVkc19zY3JhdGNoIGJp
dCBpbiBkZXZpY2UNCj4gZGVzY3JpcHRvcg0KPiANCj4gT24gc29tZSBwbGF0Zm9ybSwgc2NyYXRj
aCBwYWdlIGlzIG5lZWRlZCBmb3Igb3V0IG9mIGJvdW5kIHByZWZldGNoDQo+IHRvIHdvcmsuIElu
dHJvZHVjZSBhIGJpdCBpbiBkZXZpY2UgZGVzY3JpcHRvciB0byBzcGVjaWZ5IHdoZXRoZXINCj4g
dGhpcyBkZXZpY2UgbmVlZHMgc2NyYXRjaCBwYWdlIHRvIHdvcmsuDQo+IA0KPiB2MjogaW50cm9k
dWNlIGEgbmVlZHNfc2NyYXRjaCBiaXQgaW4gZGV2aWNlIGluZm8gKFRob21hcywgSm9uYXRoYW4p
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBPYWsgWmVuZyA8b2FrLnplbmdAaW50ZWwuY29tPg0KPiBS
ZXZpZXdlZC1ieTogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50
ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaCB8
IDMgKysrDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMgICAgICAgICAgfCA1ICsrKysr
DQo+ICAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaA0KPiBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9kZXZpY2VfdHlwZXMuaA0KPiBpbmRleCA4MzNjMjlmZWQzYTMuLmE1YmE5ZTRlNDcw
ZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaA0KPiBAQCAtNDYsNiAr
NDYsNyBAQCBzdHJ1Y3QgeGVfcHhwOw0KPiAgI2RlZmluZSBHUkFQSElDU19WRVJ4MTAwKHhlKSAo
KHhlKS0+aW5mby5ncmFwaGljc192ZXJ4MTAwKQ0KPiAgI2RlZmluZSBNRURJQV9WRVJ4MTAwKHhl
KSAoKHhlKS0+aW5mby5tZWRpYV92ZXJ4MTAwKQ0KPiAgI2RlZmluZSBJU19ER0ZYKHhlKSAoKHhl
KS0+aW5mby5pc19kZ2Z4KQ0KPiArI2RlZmluZSBORUVEU19TQ1JBVENIKHhlKSAoKHhlKS0+aW5m
by5uZWVkc19zY3JhdGNoKQ0KPiANCj4gICNkZWZpbmUgWEVfVlJBTV9GTEFHU19ORUVENjRLCQlC
SVQoMCkNCj4gDQo+IEBAIC0zMTgsNiArMzE5LDggQEAgc3RydWN0IHhlX2RldmljZSB7DQo+ICAJ
CXU4IGhhc191c206MTsNCj4gIAkJLyoqIEBpbmZvLmlzX2RnZng6IGlzIGRpc2NyZXRlIGRldmlj
ZSAqLw0KPiAgCQl1OCBpc19kZ2Z4OjE7DQo+ICsJCS8qKiBAaW5mby5uZWVkc19zY3JhdGNoOiBu
ZWVkcyBzY3JhdGNoIHBhZ2UgZm9yIG9vYg0KPiBwcmVmZXRjaCB0byB3b3JrICovDQo+ICsJCXU4
IG5lZWRzX3NjcmF0Y2g6MTsNCj4gIAkJLyoqDQo+ICAJCSAqIEBpbmZvLnByb2JlX2Rpc3BsYXk6
IFByb2JlIGRpc3BsYXkgaGFyZHdhcmUuICBJZg0KPiBzZXQgdG8NCj4gIAkJICogZmFsc2UsIHRo
ZSBkcml2ZXIgd2lsbCBiZWhhdmUgYXMgaWYgdGhlcmUgaXMgbm8gZGlzcGxheQ0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3BjaS5jDQo+IGluZGV4IDZhOGU4MmFmZjM4NS4uYzYxNGY2NzNlZmE1IDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3BjaS5jDQo+IEBAIC02Nyw2ICs2Nyw3IEBAIHN0cnVjdCB4ZV9kZXZpY2VfZGVzYyB7
DQo+ICAJdTggaGFzX2xsYzoxOw0KPiAgCXU4IGhhc19weHA6MTsNCj4gIAl1OCBoYXNfc3Jpb3Y6
MTsNCj4gKwl1OCBuZWVkc19zY3JhdGNoOjE7DQo+ICAJdTggc2tpcF9ndWNfcGM6MTsNCj4gIAl1
OCBza2lwX210Y2ZnOjE7DQo+ICAJdTggc2tpcF9wY29kZToxOw0KPiBAQCAtMzUzLDYgKzM1NCw3
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgeGVfZGV2aWNlX2Rlc2MgbG5sX2Rlc2MgPSB7DQo+ICAJ
LmRtYV9tYXNrX3NpemUgPSA0NiwNCj4gIAkuaGFzX2Rpc3BsYXkgPSB0cnVlLA0KPiAgCS5oYXNf
cHhwID0gdHJ1ZSwNCj4gKwkubmVlZHNfc2NyYXRjaCA9IHRydWUsDQo+ICB9Ow0KPiANCj4gIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgeGVfZGV2aWNlX2Rlc2MgYm1nX2Rlc2MgPSB7DQo+IEBAIC0zNjEs
NiArMzYzLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB4ZV9kZXZpY2VfZGVzYyBibWdfZGVzYyA9
DQo+IHsNCj4gIAkuZG1hX21hc2tfc2l6ZSA9IDQ2LA0KPiAgCS5oYXNfZGlzcGxheSA9IHRydWUs
DQo+ICAJLmhhc19oZWNpX2NzY2ZpID0gMSwNCj4gKwkubmVlZHNfc2NyYXRjaCA9IHRydWUsDQo+
ICB9Ow0KPiANCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgeGVfZGV2aWNlX2Rlc2MgcHRsX2Rlc2Mg
PSB7DQo+IEBAIC0zNjksNiArMzcyLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB4ZV9kZXZpY2Vf
ZGVzYyBwdGxfZGVzYyA9IHsNCj4gIAkuaGFzX2Rpc3BsYXkgPSB0cnVlLA0KPiAgCS5oYXNfc3Jp
b3YgPSB0cnVlLA0KPiAgCS5yZXF1aXJlX2ZvcmNlX3Byb2JlID0gdHJ1ZSwNCj4gKwkubmVlZHNf
c2NyYXRjaCA9IHRydWUsDQo+ICB9Ow0KPiANCj4gICN1bmRlZiBQTEFURk9STQ0KPiBAQCAtNjQ0
LDYgKzY0OCw3IEBAIHN0YXRpYyBpbnQgeGVfaW5mb19pbml0X2Vhcmx5KHN0cnVjdCB4ZV9kZXZp
Y2UNCj4gKnhlLA0KPiAgCXhlLT5pbmZvLnNraXBfZ3VjX3BjID0gZGVzYy0+c2tpcF9ndWNfcGM7
DQo+ICAJeGUtPmluZm8uc2tpcF9tdGNmZyA9IGRlc2MtPnNraXBfbXRjZmc7DQo+ICAJeGUtPmlu
Zm8uc2tpcF9wY29kZSA9IGRlc2MtPnNraXBfcGNvZGU7DQo+ICsJeGUtPmluZm8ubmVlZHNfc2Ny
YXRjaCA9IGRlc2MtPm5lZWRzX3NjcmF0Y2g7DQo+IA0KPiAgCXhlLT5pbmZvLnByb2JlX2Rpc3Bs
YXkgPQ0KPiBJU19FTkFCTEVEKENPTkZJR19EUk1fWEVfRElTUExBWSkgJiYNCj4gIAkJCQkgeGVf
bW9kcGFyYW0ucHJvYmVfZGlzcGxheSAmJg0KPiAtLQ0KPiAyLjI2LjMNCg0K
