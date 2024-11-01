Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6889E6F085
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 19:40:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7204B10E9FC;
	Fri,  1 Nov 2024 19:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QQn+CwDF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E6110E9FC
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Nov 2024 19:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730490025; x=1762026025;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GnAuSajvTDF2hpl1fBbICP7oVughrDfnnM9JM9s9RxQ=;
 b=QQn+CwDF/+nekO/JFXDQwxfRjtmJHAfZKNvwtiHnoX7m86ynfpVGTtPD
 UU2FK0+tOMLTTIevSHTZ6aqiPDbbBjY71SSYCZsT8DqOQrgBcrK6CeedH
 7cPt0izQHMMocGI9IU7BJxBqpYirCGK1u89GPupLwDNbTL1DjwRZVb2mN
 2fSu/iMSLwrGGzP37wfPbpT+Sw0uf1AN6pl14ezb385g3zxGohROWSvR6
 E6JxL9283leUaCsfYTVJfjnLYb+D6eRizMiPe6iFosY8x4Ns4HlSVaUo3
 PLe7UKQBKM2QMF3bGgCLjlwE0eLsFAZoWlsdnOKwD/GKY5buRgHu9kkJk A==;
X-CSE-ConnectionGUID: 12l/jC2LQrSUUQFI1tGC2A==
X-CSE-MsgGUID: LkXWbs79SZ+dQbX+vLbMRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="41664667"
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; d="scan'208";a="41664667"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 12:40:24 -0700
X-CSE-ConnectionGUID: zGi5LBwvTWysym/JBgqSbw==
X-CSE-MsgGUID: jR0JRbacT3uFuW2esW2SbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; d="scan'208";a="113832405"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Nov 2024 12:40:24 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 1 Nov 2024 12:40:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 1 Nov 2024 12:40:23 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 1 Nov 2024 12:40:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HDhn44ZK6kRQKjDjqPOT5bB0gHAd0YG3Id+6iFEkTsYeJF2Vgb3S93XBwxUq+yQEo0DOo2GqF9sEo89rCMBoxLPhaKPyddm0RYCzGJ8/P0dblfn9nWALe7cmRmR5MtRrM8XncnglYoJqVBAPEegspZP+4jSxX8a0woGqMyt0oyOBYYDPQJAeanN5BkMke2dHPlLUH/issjqtOLnbAIMRMCEwKpYf7CL0aAwVka8iVa7qzBKBPT61kb950bYgPYhKFCPwIJ1uPNTrSM5/mTJ25Ed/4cp9Wft1Ogn57seExj1t8MEyY2TZ5kXpTtjQwnl0xUEBeKChg1IrGZyTZtsbuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GnAuSajvTDF2hpl1fBbICP7oVughrDfnnM9JM9s9RxQ=;
 b=uNjwBXvplptm5Wj457lRDrgyVLoBO6KoqzcgpII1E9RLLaw7TnrKGkSww+ohYJxd0MQrP/g4BJovAk7CEYE9lppeJf8xAUlzkDGb6+r+dU6HvmQFeqQDuMQ4QR+znTdIiCtYafP8LUkbuqQZcfp+93oXhygg8i8MVrDe9gcLBGTjdGZgZFadAWHH1EKHH8pDM9CX8z3VGjgtwxJOYtqsiT2TDbEfgK89y2mX8KEchpOFDnYkbdla6BSjDAUGN5+NDDT8rNPQllzxFAQMoRK7qCtWtdez7e7ZPHCDhsv9ky3gr6Px4XX4LmSEccuutEge+ROU8cOxje3IkknHqRDqDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA1PR11MB8280.namprd11.prod.outlook.com (2603:10b6:806:25d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Fri, 1 Nov
 2024 19:40:18 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8114.023; Fri, 1 Nov 2024
 19:40:18 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe/xe_guc_ads: Add whitelist registers to write list
Thread-Topic: [PATCH] drm/xe/xe_guc_ads: Add whitelist registers to write list
Thread-Index: AQHbLIh6UcCqcibekk20ZmZZBCafgLKiw3iAgAAKRuA=
Date: Fri, 1 Nov 2024 19:40:18 +0000
Message-ID: <CH0PR11MB5444581AA95D474000743B9CE5562@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241101180403.97272-1-jonathan.cavitt@intel.com>
 <6a317425-bf13-4269-b510-04a765c3cc23@intel.com>
In-Reply-To: <6a317425-bf13-4269-b510-04a765c3cc23@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA1PR11MB8280:EE_
x-ms-office365-filtering-correlation-id: 3e802967-3b5e-416a-4f67-08dcfaad042c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?M3Z1cTJXNkdWYy81dUt3enhxcmR4a1dXQ3B6UUxNbHBreDdZS2JlYjRSOStU?=
 =?utf-8?B?QTR2bEUrdWIxR3NUQTlGY1pKVFBZVHU2SGR6cUY3aE0yaXF3aHpGQ3hRMG5H?=
 =?utf-8?B?YTIreEdxUDc0bDFPRjQ3VXNpVGt0eGg3NDE3cHFZQ3JKMEhYSEo4ek5GWnBo?=
 =?utf-8?B?SC9qc2d6M3YvOVI1TjlPN2pPOFlqOXd0S1F1Z1NiSmc4NGZxa0FhRmcrTkt3?=
 =?utf-8?B?NlVZZzJDTXk5ckV4alYvaHgrQzdWVWtUVzZ1Tyt1UTFNNUlnbWh0K3VRSytI?=
 =?utf-8?B?QmhjK2Vxb2c3bFdFamtrVVJnMFZqbXliSWp0OURVTnp6dlVsS1RDbUs3MDRP?=
 =?utf-8?B?V2FjamFSeCtXZW96di9HK2FnelowdmR2aEF3dHNJSzBtYWdYWnVzckRSYkFa?=
 =?utf-8?B?UGtQZXM5RnN3c0svTjVmNWxmWkhSSnRIekNwRm9TS1UzOCtIQTN5c2ZVK0Zx?=
 =?utf-8?B?SDZjbDB6MXpYU3hWbFR4NWxsUkFWUVdwOVFXcXZLT3JPNTlIQ1pxcHBIdGlk?=
 =?utf-8?B?ZFFuakNpSmdFalZHN2F3M3pYWkJ4NEhoaU9QRCt2T1k5MksxZHVNQzQxRHha?=
 =?utf-8?B?b1lOd1lFZHp5Sm1jOTg4eHhQL3Q1L09JdTIvL0haUE1rMStVMW1kU2ZsV0JY?=
 =?utf-8?B?NWtTK1RNdUZzVzU3RmhRWmhXRlIydUxWWDhibGFUSHUrcEF1U1IwMk1uMkhu?=
 =?utf-8?B?Y1E2elo0cXlXWVoyRWtyUHpuR2VwVW8ramFwa0Z0M3JwNStZRkFHcVFqQUQr?=
 =?utf-8?B?WkNNT3lsa200L29QZXUwOHpoWkhadW1rU042R0xvZkVWb05vQUdzSHRzVHJ2?=
 =?utf-8?B?T0lnU1d4YWdjU2NKZFZPOEtaQTBFbXM1Zi9Jc21PU0p2Kzg2ZFRNc3FpU1FG?=
 =?utf-8?B?SXBDeWR4aHB3ZFFSN3FKVHF1alRFNk5SYTVIdyt5aXB0aDkyWDRGZ2lCcFFj?=
 =?utf-8?B?N3dEajlPSWhleFJCWW8yVjZURDhMS2x0bVYxb0J1TklMUzFWSnhqOTJlTTg5?=
 =?utf-8?B?ZjZuUEE4RG1pR09hTldnZFE3eFE0a25CWCt4OFJNQk5oM3B3WEJqZU44NzBp?=
 =?utf-8?B?RXdZZHI0aTMzTlgyd0tmeGMvZnVoU2JKRUFnZ3JFNzhKeEFjSGRJRGRQZUpE?=
 =?utf-8?B?aXkyaHFKeTNqckpmSHhWd0J3T1dnbkZzVm9ZTUF5a080emxUYW96czZpeUNh?=
 =?utf-8?B?V2U3czVJOWFDVEtPK3NCSktsMG16K3JjQUtSa0ZnZnFHNUJ3R3hRSE9CQ3FI?=
 =?utf-8?B?RnQ2S3ZKM3FmUkdJR25INlJkalBkeHJETkxVcExsOFM5cnYwMWJQZzlHRlQz?=
 =?utf-8?B?amlJb3E0Z0ZnUTdlVU92TWdLS2sxLzhWZDJGRXB6TTY2ampUT2o4dGZWRVhO?=
 =?utf-8?B?ekRsRThCMTgrMWhXVksvQ1VtYUZHZVpGL1RzaFBSRVVKWklCeVd3UmV6M1BH?=
 =?utf-8?B?YlFKLzNRRHA2MkhHRkdKMnpQcy9LKys3SmlqcDh5b2dMakI4Ly92R2luMVFB?=
 =?utf-8?B?WlkwTElXWjR4WEJBREZmWERHdXpXejZWK3FxSmV0SnQvRlBRR21WOW96YXFO?=
 =?utf-8?B?SWtrbFA1dWR3NHVtNFgzVUVRR3FvTVF6b0Y2bHVhNjZyKzdUU2xSMmZMZHE1?=
 =?utf-8?B?eVBnOHFQQXRTQzAxR2VkSGxkdXJHeHZtemtoSHUyaEpjS1VkR2Vpb2x4RzRz?=
 =?utf-8?B?cG0rb1htRWVMQVdTMlAzWGd2UHliWnBEcmJHdHpmYnZrMGtaVFFuSWpJQmw2?=
 =?utf-8?Q?TtZarcEvEl+7fUkzn5deZv86SXq8fj7cQpkxGI0?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ajZ6OWZzVFlZWHdOQWZuTDF3OFd5eUVzSWNJUHFIUC9JTFFsVXBvZVp5Z1k3?=
 =?utf-8?B?b3dBb3o2bkY1WmFnYzlGZk1iMHBxQnR1RXZhS0dSN2wveHZNdHlDVExrRlJF?=
 =?utf-8?B?MnA0TlIyMjl6ZERUbDFJdkVnNjlNSmorWFBtYmUrQ3pobjMvbVJNeFBpRmlR?=
 =?utf-8?B?OW1NdFNReFRQWUNUaE1CbWR2cDVEQ3RUL3dJR0Zpc1kydlo1UHhDZ2x1SFBL?=
 =?utf-8?B?RHJEZFlVNWRUOFZtU3V6QVd3OHRMQ1Q4SWVuUVlHdHBSSFF0STNmZ3kxdXhL?=
 =?utf-8?B?VVliMDVRZzg3VldVaFhKVnZCRzd5WlBFZ1VpRmRlcjlwUTJRalJ6cVl1czh4?=
 =?utf-8?B?YUp1Z0YyVkJvQ1ArcjI1RjdUNHY5bzJINnAxOXY3V0Y2U1ZvbE9uQ3AzU0N3?=
 =?utf-8?B?MVNDSGNzYStsa3VPRG93d2EwREJmR2traENwQmN6VjBvTFNVMUI0Ri80aHZw?=
 =?utf-8?B?T1lYZVdUMlJIQkRpTnFZMFhaR2dhVnlQYUFXZnFTZG5PN0hFNDdpZHk4c2ZR?=
 =?utf-8?B?a3R4eWdLcXE4YmZGM25VaXBVQmd2YlEvNTVoTWJ6WnpZNkVXQUlHODVTRG5W?=
 =?utf-8?B?YllHeFNqSXVMdHE1WHRpaGkyNGlVaU9ETElNajU2TXBDdVhlT2cwVDNRNldL?=
 =?utf-8?B?TGs2VllOVmxNMGpCalozRDRzOUVYZWEvNWRPWFkraFUrbWtWbGpzd3k0YUZ0?=
 =?utf-8?B?Q21GNGNUaDNWcEl0RDJHT1NWYWJSRkVTbkY3MXlMWTRWOWd2SGlpNFViRWdF?=
 =?utf-8?B?WWFSNEhoblhLVnBLVTZDTVFqM3NPa2NwOHNDcVVxZTVRT3hBTWEySWxweUFv?=
 =?utf-8?B?eHRPNDVjTElyeStsenZwaUYzbWtqb3dISENJMVZmTjBIRWs2SXV2U0htRlVZ?=
 =?utf-8?B?SlFDekdlM1FRaHo3VWlaV3J6Sm5Vd0cyd1AwSlE2c2FVMzlWMVVwRXBsZEJv?=
 =?utf-8?B?bzFOU1lvdW1lQWo1VXh3dVArWVhkNjh1K0V2UDZIWW1lSnU1YnBiaEEwczUw?=
 =?utf-8?B?RzJnSUN6cVhEanoxbkFzT3NRbzJWUDFTNzNqd2hmSW1DVm5IMWdXZGlWcEcx?=
 =?utf-8?B?eDhMMURudkRkclp6WTdXNnQwdTM0RXI1WEZ0bFJpVDA5aEtUSzNGeFd3clcr?=
 =?utf-8?B?eW01M2JQYWprZGZpZGVMV2QvY3g5R002TGQ4QTY1RFNFcVRBTzhDOUpEM01j?=
 =?utf-8?B?VzNjRWZtdmZ4YXd5bDJRZWRLTmtxSHJaOFlPZmtSUkM4RlB6UGJZVEtvMzVy?=
 =?utf-8?B?dXBsNnQ1cmRFRml6UU9GTjBva3lnZ1gxdGZLSElCTzhodURGWlVlRWxlbi9k?=
 =?utf-8?B?V0Q1RTgxZDkvaXRPeDZRK0k3Z3JxQitZQW51R2QrTjhrUlJvVFhPVTFadWhp?=
 =?utf-8?B?ekVUVzlGeHhpbml6a0RaMVlzd0w1ODNDQjdZNW84YzEzQndFVkxNY3psY3FF?=
 =?utf-8?B?RmVCZDhRbTh5OUZQMVJyZlY1ZG94K1NraXJsRWlpUVZiQjhEKzdQbkRTVDFH?=
 =?utf-8?B?Y000N2xUNlM3OUptV0VFV1FMSkljdzZsL0lMbEtZNnh5c05SbkxwdW9Wd2dI?=
 =?utf-8?B?VEZJTE1TV2ZNc25HSnVVcUc5VmNtQkNGK3VBZG1BL01zcStrYlpmQ2REQStG?=
 =?utf-8?B?OG0xeHlXN3VmYUtnL29UZ0dVR3NNSm42WHliTUduYmowSVkxdjh1WGVDeGpS?=
 =?utf-8?B?MUd5OTEzZ0FaMEJvR2JsQnNNaXRla3FEZStyNFgzMno5NENLdmtZS1NId240?=
 =?utf-8?B?dkJiWnZvSnpzN1JXc2NFZGI3cTdDL1ZpY3RUUFlPY01WVTBDN29GeWpsbG8v?=
 =?utf-8?B?d0tRK3VTWVBMd0hJamp1SkE5L3NuaFlJTllDbHozai9pSUtleXhQZi9ZNHBl?=
 =?utf-8?B?TmtnckNxdUwwY3lhZHB0OE5SOGxDNmJwWUZhbDYwcFpzRDRSdWxNTUQ2ZnJo?=
 =?utf-8?B?SFBCSDNuVFp3MXJnQlN4Vy9Cbmk5b2RURlIyUlNMLy96VmZRNTJRWml6R2x6?=
 =?utf-8?B?cHRRSm5qQVpHS24xaU9VYWVHTHBEWXRybmdUS2lLUXBCeTVuaVphbk1NanRP?=
 =?utf-8?B?WHF3MWJKQVdWMWQ0b2Zpb0trc2FWajl3bnRIdW1QZnJZZVFvMDM3TnVFNXdQ?=
 =?utf-8?Q?ZYwOLFGVqoK6MRunuCDwncK9r?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e802967-3b5e-416a-4f67-08dcfaad042c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2024 19:40:18.4381 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c9VtdtGDM6Vu+atKltm9k2+jDxfI8Mnj7dhvAl9zFIOONbvtlIB9IcGeVE62euRBKlV/iUel36GuIyhE4DOiYrDYhrOu4AxGx1BPXwjWeW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8280
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
Yy5oYXJyaXNvbkBpbnRlbC5jb20+IA0KU2VudDogRnJpZGF5LCBOb3ZlbWJlciAxLCAyMDI0IDEx
OjQ2IEFNDQpUbzogQ2F2aXR0LCBKb25hdGhhbiA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT47
IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IEd1cHRhLCBzYXVyYWJoZyA8c2F1
cmFiaGcuZ3VwdGFAaW50ZWwuY29tPjsgWnVvLCBBbGV4IDxhbGV4Lnp1b0BpbnRlbC5jb20+OyBO
ZXJsaWdlIFJhbWFwcGEsIFVtZXNoIDx1bWVzaC5uZXJsaWdlLnJhbWFwcGFAaW50ZWwuY29tPjsg
Um9wZXIsIE1hdHRoZXcgRCA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT47IERlIE1hcmNoaSwg
THVjYXMgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT47IERpeGl0LCBBc2h1dG9zaCA8YXNodXRv
c2guZGl4aXRAaW50ZWwuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL3hlL3hlX2d1Y19h
ZHM6IEFkZCB3aGl0ZWxpc3QgcmVnaXN0ZXJzIHRvIHdyaXRlIGxpc3QNCj4gDQo+IE9uIDExLzEv
MjAyNCAxMTowNCwgSm9uYXRoYW4gQ2F2aXR0IHdyb3RlOg0KPiA+IFdoZW4gcGVyZm9ybWluZyBh
IGd1Y19tbWlvX3JlZ3NldF93cml0ZSwgd2UgYWRkIGFsbCB0aGUgcmVnaXN0ZXJzIGluIHRoZQ0K
PiA+IHJlZ19zciBsaXN0IHRvIHRoZSBzYXZlL3Jlc3RvcmUgbGlzdCwgYnV0IGRvIG5vdCBkbyB0
aGUgc2FtZSBmb3IgdGhlDQo+ID4gd2hpdGVsaXN0IHJlZ2lzdGVycy4gIEFkZCB0aGVtIGluLg0K
PiA+DQo+ID4gQ2xvc2VzOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL3hlL2tl
cm5lbC9pc3N1ZXMvMjI0OQ0KPiA+IFNpZ25lZC1vZmYtYnk6IEpvbmF0aGFuIENhdml0dCA8am9u
YXRoYW4uY2F2aXR0QGludGVsLmNvbT4NCj4gPiBDQzogTHVjYXMgZGUgTWFyY2hpIDxsdWNhcy5k
ZW1hcmNoaUBpbnRlbC5jb20+DQo+ID4gQ0M6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBp
bnRlbC5jb20+DQo+ID4gQ0M6IEpvaG4gSGFycmlzb24gPGpvaG4uYy5oYXJyaXNvbkBpbnRlbC5j
b20+DQo+ID4gQ0M6IFVtZXNoIE5lcmxpZ2UgUmFtYXBwYSA8dW1lc2gubmVybGlnZS5yYW1hcHBh
QGludGVsLmNvbT4NCj4gPiBDQzogQXNodXRvc2ggRGl4aXQgPGFzaHV0b3NoLmRpeGl0QGludGVs
LmNvbT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfYWRzLmMgfCAx
MSArKysrKysrKysrLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3VjX2Fkcy5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19hZHMuYw0KPiA+IGluZGV4IDk0
MzE0NmU1YjQ2MC4uMmZjNmIxY2NjOGZjIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndWNfYWRzLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2Fk
cy5jDQo+ID4gQEAgLTIzOSw5ICsyMzksMTIgQEAgc3RhdGljIHNpemVfdCBjYWxjdWxhdGVfcmVn
c2V0X3NpemUoc3RydWN0IHhlX2d0ICpndCkNCj4gPiAgIAllbnVtIHhlX2h3X2VuZ2luZV9pZCBp
ZDsNCj4gPiAgIAl1bnNpZ25lZCBpbnQgY291bnQgPSAwOw0KPiA+ICAgDQo+ID4gLQlmb3JfZWFj
aF9od19lbmdpbmUoaHdlLCBndCwgaWQpDQo+ID4gKwlmb3JfZWFjaF9od19lbmdpbmUoaHdlLCBn
dCwgaWQpIHsNCj4gPiAgIAkJeGFfZm9yX2VhY2goJmh3ZS0+cmVnX3NyLnhhLCBzcl9pZHgsIHNy
X2VudHJ5KQ0KPiA+ICAgCQkJY291bnQrKzsNCj4gPiArCQl4YV9mb3JfZWFjaCgmaHdlLT5yZWdf
d2hpdGVsaXN0LnhhLCBzcl9pZHgsIHNyX2VudHJ5KQ0KPiA+ICsJCQljb3VudCsrOw0KPiA+ICsJ
fQ0KPiA+ICAgDQo+ID4gICAJY291bnQgKz0gQURTX1JFR1NFVF9FWFRSQV9NQVggKiBYRV9OVU1f
SFdfRU5HSU5FUzsNCj4gPiAgIA0KPiA+IEBAIC03MjcsNiArNzMwLDEyIEBAIHN0YXRpYyB1bnNp
Z25lZCBpbnQgZ3VjX21taW9fcmVnc2V0X3dyaXRlKHN0cnVjdCB4ZV9ndWNfYWRzICphZHMsDQo+
ID4gICAJeGFfZm9yX2VhY2goJmh3ZS0+cmVnX3NyLnhhLCBpZHgsIGVudHJ5KQ0KPiA+ICAgCQln
dWNfbW1pb19yZWdzZXRfd3JpdGVfb25lKGFkcywgcmVnc2V0X21hcCwgZW50cnktPnJlZywgY291
bnQrKyk7DQo+ID4gICANCj4gPiArCWkgPSAwOw0KPiA+ICsJeGFfZm9yX2VhY2goJmh3ZS0+cmVn
X3doaXRlbGlzdC54YSwgaWR4LCBlbnRyeSkNCj4gPiArCQlndWNfbW1pb19yZWdzZXRfd3JpdGVf
b25lKGFkcywgcmVnc2V0X21hcCwNCj4gPiArCQkJCQkgIFJJTkdfRk9SQ0VfVE9fTk9OUFJJViho
d2UtPm1taW9fYmFzZSwgaSsrKSwNCj4gPiArCQkJCQkgIGNvdW50KyspOw0KPiA+ICsNCj4gVGhl
IGNvZGUgdGhhdCBhY3R1YWxseSB3cml0ZXMgdG8gdGhlIE5PTlBSSVYgcmVnaXN0ZXJzIA0KPiAo
eGVfcmVnX3NyX2FwcGx5X3doaXRlbGlzdCgpIGluIHhlX3JlZ19zcmMuYykgZXhwbGljaXRseSBj
bGVhcnMgYWxsIHRoZSANCj4gdW51c2VkIHJlZ2lzdGVycyB3aXRoIGEgY29tbWVudCBvZiAiY2xl
YXIgdGhlIHJlc3QgaW4gY2FzZSBvZiBnYXJiYWdlIi4gDQoNClRoZSBjb2RlIGluIHhlX3JlZ19z
cl9hcHBseV93aGl0ZWxpc3QgY2FsbHMgeGVfbW1pb193cml0ZTMyIHRvIHdyaXRlIHRoZQ0KcmVn
aXN0ZXJzLCB3aGVyZWFzIHRoZSBjb2RlIGluIGd1Y19tbWlvX3JlZ3NldF93cml0ZSB1c2VzIHhl
X21hcF9tZW1jcHlfdG8NCmludGVybmFsbHkuICBXaGlsZSB0aGUgZm9ybWVyIHNlZW1zIHRvIGJl
IHdyaXRpbmcgdG8gdGhlDQp4ZV9tbWlvX2FkanVzdGVkX2FkZHIobW1pbywgcmVnLmFkZHIpICsg
bW1pby0+cmVncywgdGhlIGxhdHRlciBhcHBlYXJzIHRvIGJlDQp3cml0aW5nIHRvIElPU1lTX01B
UF9JTklUX09GRlNFVChhZHNfdG9fbWFwKGFkcyksIGd1Y19hZHNfcmVnc2V0X29mZnNldChhZHMp
Lg0KDQpJJ20gbm90IHBhcnRpY3VsYXJseSB3ZWxsLXZlcnNlZCBpbiB0aGVzZSBmdW5jdGlvbnMs
IGJ1dCBpdCBsb29rcyB0byBtZSB0aGF0IHRoZXNlDQp0d28gZnVuY3Rpb25zIHdyaXRlIHRvIGRp
ZmZlcmVudCBsb2NhdGlvbnMgYW5kIHRodXMgd291bGQgbm90IGltcGFjdCBlYWNoIG90aGVyLg0K
T3IsIGluIG90aGVyIHdvcmRzLCBJIGRvbid0IHRoaW5rIHRoZSBnYXJiYWdlIHdlJ3JlIGNsZWFy
aW5nIGluIHhlX3JlZ19zcl9hcHBseV93aGl0ZWxpc3QNCmlzIHRoZSBzYW1lIGFzIHRoZSBkYXRh
IHdlJ3JlIHdyaXRpbmcgaW4gZ3VjX21taW9fcmVnc2V0X3dyaXRlLg0KDQotSm9uYXRoYW4gQ2F2
aXR0DQoNCj4gSWYgd2UgZG9uJ3QgdHJ1c3QgdGhlIHJlc2V0IHN0YXRlIHRvIGJlIHZhbGlkIHRo
ZW4gd2UgbmVlZCB0byBlbnN1cmUgYWxsIA0KPiBvZiB0aGVtIGFyZSBzYXZlZC9yZXN0b3JlZCBh
Y3Jvc3MgYSByZXNldC4gT3RoZXJ3aXNlLCB0aGF0IGdhcmJhZ2UgY2FuIA0KPiBjb21lIGJhY2sg
YW5kIGNhdXNlIHByb2JsZW1zLg0KPiANCj4gSm9obi4NCj4gDQo+IA0KPiA+ICAgCWZvciAoZSA9
IGV4dHJhX3JlZ3M7IGUgPCBleHRyYV9yZWdzICsgQVJSQVlfU0laRShleHRyYV9yZWdzKTsgZSsr
KSB7DQo+ID4gICAJCWlmIChlLT5za2lwKQ0KPiA+ICAgCQkJY29udGludWU7DQo+IA0KPiANCg==
