Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EB5606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 10:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JGAGB7zD;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=MgovAOSb
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FCFB10E7BB;
	Mon, 23 Nov 2026 10:23:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8677A10EBB6
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 10:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795429416; x=1826965416;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=w75jOLLED/ppIGqApbRKRRoJ2gpnSziqpp6nSsismF4=;
 b=JGAGB7zDANVwG1Sc8QQfIciTLZpGSFS4hol1aBOcCaIfDfbOvlMp8Dgj
 dmAQQwqQQCVDsjbh0ZnM1roZI521+yB2cbzJSID3Z5/ZAYvBq2MugWGjp
 V4r4QdCWoB96JRlPPJkiiivcUVDBFNqfJ1rdleX2Ww/s8aGJai5ufqgs/
 tNy4X79LwZicJHQDUrcdzpK+LGb98IMl27DqRODfGaPor6IelUHLb7Tga
 eSKzXX9i4WFC9u+SgGtP9oUea0jlcdWioGs/2HbXVER6JeTKqTBJQXKHd
 B/UrN5gAXYVqnvfOSRaduNY2sCbgZOqWtazUGRt4s7h9j2L1aiD89F+Pk g==;
X-CSE-ConnectionGUID: ikF8zQuNQ/eIIqGCrpeRRg==
X-CSE-MsgGUID: sFwS49OfSPGZ+BoZZIpD9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4103946"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4103946"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 02:23:35 -0800
X-CSE-ConnectionGUID: X3mUD4GLTP2ZEukDjb0eBQ==
X-CSE-MsgGUID: /KKTVJoUTHqTKSyzsNA18g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11678778"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 02:23:35 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 02:23:34 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 02:23:34 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.34) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 02:23:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DaN8KGNPhlwWIZ9ABgk0/AsIxPcmyJpopu+58ftl/YtKJtGTgNFatS+kdQ1gTOcYkMfB90/311ZQCj3hVtvy41erfSsu9AxqqYyjPMM/wf/LBVf81UX2OFX74TIb8BkovPJ/xwlluMccY+8LlF1ZFBtoxQfHO9hVAGZPPS6Qs1Ns5cQBF+RyQnxzICfAkgX08dsMxT6hdMOC8E0Lfrp9yBgSwlRn8bDVlCZguVFXKCWuYIheSHVohkh/hOH6jYzzzwfi5GeO88Vc3bApI2e5xESBaVi1I/0kG/u9HYqwRdieOKYHW4gzEkztWtCTjEijRggutL2HiRGHyIIq6ikJuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dEXmtFRMI9O6LjpZ9Ahl9B3eE8Y2rll965u1LsSlwEw=;
 b=TsduomVMfR5D7Y0OPCeCacD0CgrUZldbZ/uG4Ot+NmY+JBgvRCqIIv5eWAi5iWC0ua4MtnT8P2RN+/h6N+qDEQDh3wqBDCg41/dOL0AU1x5P1jlB8I0XUI9od65iqVd0CqUMqwKYfXx14tTnttSwtjyq2oPuO9D6Xcgd+Axf2xEx2GzZT9VatYd3vyaL96mHt3+i7Ip/RIJcL2U1/5LX9nqHYm2pULwulUFxVxs7NOxdvrFf3gLCJwZxH4SvQIMf4wuDhlWhNpp+hK18TngqdDfp47ndxW+s1ieUQ4CY057wzCkBguWBEz3q07zwt5djPj77qUowkhq+lIQ737jF0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dEXmtFRMI9O6LjpZ9Ahl9B3eE8Y2rll965u1LsSlwEw=;
 b=MgovAOSbkn8zLfmQGL/laBNJxqIVzCiJKGYMpYIK3Hzk0VJ7KhEgRWQLpdvHArklNMwSj35U6uApQKVZw4S808I7pFNOf34S7wLlWRENvhhmGSMo4ekTDMMv8aW8CdrfKL6lue9ry5GS9zVqq+cUmWOrkGMG3VnxZxvCzEiNWI0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from FT1PR11MB960200.namprd11.prod.outlook.com
 (2603:10b6:170:25::23) by SJ2PR11MB8537.namprd11.prod.outlook.com
 (2603:10b6:a03:56f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Mon, 23 Nov
 2026 10:23:26 +0000
Received: from FT1PR11MB960200.namprd11.prod.outlook.com
 ([fe80::cfb1:f811:62bb:fa65]) by FT1PR11MB960200.namprd11.prod.outlook.com
 ([fe80::cfb1:f811:62bb:fa65%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 10:23:25 +0000
Message-ID: <2740ab92-371a-4b21-8fde-878cd676f245@intel.com>
Date: Mon, 23 Nov 2026 15:53:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/hwmon: Expose powerX_cap_max
From: "Poosa, Karthik" <karthik.poosa@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Anirban, Sk" <sk.anirban@intel.com>, "Jadav, Raag"
 <raag.jadav@intel.com>, "Koppuravuri, Ravi Kishore"
 <ravi.kishore.koppuravuri@intel.com>, "Koujalagi, Mallesh"
 <mallesh.koujalagi@intel.com>, "Purkait, Soham" <soham.purkait@intel.com>,
 "Tauro, Riana" <riana.tauro@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>
References: <20261119104029.3066660-1-karthik.poosa@intel.com>
 <6af580630e7b618aee5d4a92b7163814488a4530.camel@intel.com>
 <39bfef1a-8238-44e5-a0da-471b0a744745@intel.com>
Content-Language: en-US
In-Reply-To: <39bfef1a-8238-44e5-a0da-471b0a744745@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0331.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:222::9) To FT1PR11MB960200.namprd11.prod.outlook.com
 (2603:10b6:170:25::23)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FT1PR11MB960200:EE_|SJ2PR11MB8537:EE_
X-MS-Office365-Filtering-Correlation-Id: c95e6bae-107f-42e5-0dd9-08df494bcf05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|18002099003|22082099003|11063799006|56012099006|4143699003|261022105027099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261009223027099003|261102123227099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info: 86O/vKhpfPER6RYj6867dIlpTp6ITZ/5hVAjSxoMH4M3+LCbgkhBBjbL/VdvlIpWnLjSyFrKt69xW0jayXjF9nyCVG3fcXhY94km2fbzmw3UbrDEjQvL5BCx1LFUFsvTvgzGd7JyNy22kcrU0/dpKXtTybDXAT0UFqmr7Xacq8d82OqLwNzX5/EyYQbNhhrtCsN9eNo/0mzpG2Gqb71uoBSUPg7tYBT072hrYfnHxSIaGXGsmDR8OE/r/VByRwH1XkAq72SqmiI/D3gHWLly4mdUFvf1Oc7Mku1sUqCmPOaqkmPEfXg9aQnX3YuAXT1ajSV2M7Ao8kRLGC29sK/5LTJnOyNRcdhsJRRTw5h+js+4x0mDd7f1/SM7lCBSpYNdnO6gR4pa2LutZEpKPE2JHWs/IoX6qpO0FpAGdNNdgm+hAqR7Z3rIuZd9wKURFGc/pfx3mQPv6ydHpToRt0bO/iBOAJjS3D+n2mIdIkO79CMf/wljSbrc+V9cgo4gZx/xhSkzhypEixzqqi3vnhpONhP9fZfOwWjdAa9yaM1xp9J/cSTWoey25orta+4yCECNg6M8sm9k6T4Lz1+ItVRhk/J/cCMCRKL1BgdX6L9T5hMBCdZFWXSuhPO2JYNVQ7VDu+bGpQ0mDSpE6r7rmvWCEHtZJE24FxkTWFVOfG1woac=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:FT1PR11MB960200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003)(261022105027099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261009223027099003)(261102123227099003)(261021123027099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cks4NFRPWjRycUhrKzVsdDRVWHZTWHZaSlJPY05wS09OMERJWlJvbmQ5OFBE?=
 =?utf-8?B?bXZBUTlXRHZ0SXBIajF2dXpVdU0yd2JSZEtiUysyZmI2ZWNnRzBwUExFcVhU?=
 =?utf-8?B?TkVuNnY5UGsyMFkvTlJQK1N0d256MGEwWDNMRGlGWXRnZWlEYUpSUDdjUDl5?=
 =?utf-8?B?U1gxRlJDY0ZKZkk3Si92WGcxWVdmOHQ5WHZiOW9wek9nSGo5TGkxMmxOSGJr?=
 =?utf-8?B?aXhjeGRTZnE2V0wrZUxjVFVES3o3bEpsaFd6YW9UZ3Y0T0dTK1E0U1BqQU1S?=
 =?utf-8?B?MFFpVjJKbVBBMFlaZVNXL1FqK2JPZDVrZ2dRb0Y3UHpjd0xyckd2OXE1eStr?=
 =?utf-8?B?TklMaE82K3I4ekoyemZnQzhNeWxlbWFab2ljS3ljYUVOcXR0MVRoa1BIN2Vx?=
 =?utf-8?B?MFI5d25paXpsdWkySDJSdUZYMWVqdit4M0dEQ3pMRkp0Ukgwdm5KNWc2MUNX?=
 =?utf-8?B?bENFWlFUQ2svODJGYlI5Wlk1dmhpbzF5WlZmOGp1eXdlQm5NUThJQmJYYWFh?=
 =?utf-8?B?N2pTRTVjUDgyVUVBSCtFZk8zMEtnWEh6cUk3WFIvc1VjWWlOYXdVelNDSHFM?=
 =?utf-8?B?dndWai83UWRIRFJpbHppand4QnQ0UE1CVG1IeEgwVHJtUDRGT2FyQTlUYURD?=
 =?utf-8?B?NjlLcmcxWVNIeSs4ODl1WFpNWjNKbVY0V0hVWkFGdS9LQ0hmaG02dEo5RDUy?=
 =?utf-8?B?NWh1bjZrc00xVTN1czNHb2duano3eTFJRUs1cHBaa1J3eWcvbVhBTitUWi9Z?=
 =?utf-8?B?d2hoeWlGWExFY2lpVTFTZTJvZUpkWHNzV2YxcnNoWmk4QWc0dW1EUmY1Q0ZY?=
 =?utf-8?B?UHBuN3hmSlE1YlJNTVZKbExCT0JPWDFXSmV2Y1FmeTV0L01YVi96K2ZuSkFx?=
 =?utf-8?B?TkZRNGJZMzFuMGNlMGM4RVhVbjYrZng5dDAwVWNUSjlTckVRdWIyMGI0cnp5?=
 =?utf-8?B?dUVyQUIwdlozeU51aHBGMTJxelhrM1lhTlAxcnExc3F6YVhhWGh1TlhJUDRu?=
 =?utf-8?B?dEpjSFh4MTNTOVByMkZCbGVOcHlZOWc2eEpvYVVTU1BUWjY1aHM1NkwwZndU?=
 =?utf-8?B?M1RxUk8ybWFXb2NvdXc5WU0xQmtKTVpDSU0wSm0zck1BVVNzSGhPYy9TSVk0?=
 =?utf-8?B?dnJycC91REtHTWJhNm8wMEorY0luV3hwNnNkOWl3OUxoeVhzbVFJY0ladXM5?=
 =?utf-8?B?RWhKbGxiekhzejRFUC82WWFHMnZlSy9BZjRwVCtuYlZEZm11bjBjWjdGOFM4?=
 =?utf-8?B?UGszMTZ2QlZucWhqTFluL01CWk9nYkQyb2lSbUlTNlBIS0NWazVBN1VsTDB1?=
 =?utf-8?B?WERvd1hTSnRJcFBqbWVWUUlRRURFZnNOM0E2Yjl1YjdwaEhmbU9Oa3UyZGlG?=
 =?utf-8?B?ZUI3VzNZcXBJNnNTNHdLUUZwQkV5ZmQ2ODMxS2F5TytwejJWS0x4SkFKRmsx?=
 =?utf-8?B?aU9BaFdrT011WTVuZk9HZC9DT0k2emNWWnFSTWFReXJmSC9ZV21vN3pCTHoz?=
 =?utf-8?B?RTNLQnM5cGEzeWxURHJGeUk4TU5CSXNSLzdsVWgvOXFQUW5abUlSbVdiOUhW?=
 =?utf-8?B?VFNLUitTQ2RBQm1UNDBCeGtwTWtGMWJnQlpacUp5cE1pbWlEQzhUbVdGeDBF?=
 =?utf-8?B?NFNKNHZHTzFrckVFcVN3S1RBZUIzVnlqa0JLTEV5TWNjSW42T2RRUStXc0t4?=
 =?utf-8?B?UWxTZG03eG9GTWdoVkhFSmlxNzZoR053SWZwZHVOUWduVkljK2ZvcjRpWUho?=
 =?utf-8?B?ZDNBWDJqU3lkek5aWjlNQW9CbXlXQkFBSTJMY1YrYzZZUnNmVTFVTnJSdDM5?=
 =?utf-8?B?cS9TU1RtQXFwbFZIVEU0NjRObWFobzFaS1N0TEtIK0l5cVN5ZXBpZStyUXhU?=
 =?utf-8?B?Ky81YzlKMnY1QzJTbjBVV2w5NFg2TDRVZVJZZW5WVFZZV0k2bVRvR2VFeE9k?=
 =?utf-8?B?LzU1SXAzdDFPaXp6Smx0L3NWRWV5SFBFbXB0QTZFZnBvbjE1VUJ5dllRVjdN?=
 =?utf-8?B?b0FRTzdJYTNsSUR3aTBEK2Q4VUtMMzNRSUFPa1FDRXhQQVBWKzJkNVFDMXVx?=
 =?utf-8?B?dThCSWJONlAxZEVXWWFNaHlNM0xmK3hvVlZDU1FPa3Iya092RitEMUlGcFhS?=
 =?utf-8?B?SERlWWgzNnhHcWRlU0plN0tzSFFiUnR5UjNQREo5Tjl3WWlZRFNVUmgzdmFa?=
 =?utf-8?B?bldMZDQ3TUIzY2FLbVBaWGxVTzRJVGZOQytSQXh0THdOUVZUV2Z2YVp1bTZu?=
 =?utf-8?B?d0tRakNqQlgwMzAxd1FkWG9idDFOWUlxTmFpTFJQWEgwNTV5bHZ0WjZ6MFdy?=
 =?utf-8?B?T0o1SytwQ2twNS9GYWNicklRWG1lSmszbkVzZlQ2QlZEdGV0cFdxZz09?=
X-Exchange-RoutingPolicyChecked: ldXs6ZyFwljHuUPVcIs4M+zJTVaCsjINMiKXaxaxWBg/gDJQGwOi4h9tuJI7PWFn/Nb4doaeD8Hd7ShmrL+6LCQgDLa5D8JIr+qwl6rSf+pMSwacoS87aHvUVh/zuHpdsvMYcW2Qrd8yp0hnVXLlzntNlHkmA7yj+fRafzAjv1+YofV3UIrUBbAtMQsAmtrlpK6I2ENreWduaD24dsglDu2ezUQfTItBl0oV0SIlGar4EKFvlFHkBiGanypTZxKdYfFxgG5mSlFjAyBJLl2hG2H9LsF1kKaNoCGGD7GhlM/l1ni7bFitYm1lCWoFJeu9DurvnUnKIN1kxitiWI5WBA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c95e6bae-107f-42e5-0dd9-08df494bcf05
X-MS-Exchange-CrossTenant-AuthSource: FT1PR11MB960200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 10:23:25.8120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ed1Ut8Hyy9B0HcH8UNPayh5AgChHt/adN3MHdoMcizT5DfUUxNW4qm4afjskJv5YePw2CxkSmY4BUF2l+mfPUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8537
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 23-11-2026 12:26, Poosa, Karthik wrote:
>
>
> On 21-11-2026 04:02, Vivi, Rodrigo wrote:
>> On Thu, 2026-11-19 at 16:10 +0530, Karthik Poosa wrote:
>>> Add a read-only power<i>_cap_max attribute for the card and package
>>> channels. It reports the PL2 (burst) power limit that firmware sets
>>> at
>>> boot, which is the highest value userspace can write to power<i>_cap.
>>> The attribute is present only on platforms using mailbox power limits
>>> where PL2 is enabled at boot.
>>>
>>> Signed-off-by: Karthik Poosa<karthik.poosa@intel.com>
>>> ---
>>>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 24
>>> +++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_hwmon.c                 | 11 +++++++--
>>>   2 files changed, 33 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>> b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>> index 0da739d9a816..097902fd8346 100644
>>> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>>> @@ -296,6 +296,30 @@ Description:	RW. Package burst (PL2)
>>> power limit in microwatts.
>>>   
>>>   		Only supported for particular Intel Xe graphics
>>> platforms.
>>>   
>>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_ca
>>> p_max
>>> +Date:		November 2026
>>> +KernelVersion:	7.4
>> 7.5 if merged in the next 1.5 week.
> okay, this will be 7.5 we are planning to merge this week
>> 7.6 after Thomas send the last drm-xe-next PR of this cycle.
>>
>>> +Contact:	intel-xe@lists.freedesktop.org
>>> +Description:	RO. Card default burst (PL2) power limit in
>>> microwatts.
>>> +
>>> +		This is the firmware-provided default limit and the
>>> maximum
>>> +		value accepted for power1_cap.
>>> +
>>> +		Only supported for particular Intel Xe graphics
>>> platforms where
>>> +		PL2 is enabled.
>>> +
>>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power2_ca
>>> p_max
>>> +Date:		November 2026
>>> +KernelVersion:	7.4
>>> +Contact:	intel-xe@lists.freedesktop.org
>>> +Description:	RO. Package default burst (PL2) power limit in
>>> microwatts.
>>> +
>>> +		This is the firmware-provided default limit and the
>>> maximum
>>> +		value accepted for power2_cap.
>>> +
>>> +		Only supported for particular Intel Xe graphics
>>> platforms where
>>> +		PL2 is enabled.
>>> +
>>>   What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_ca
>>> p_interval
>>>   Date:		May 2025
>>>   KernelVersion:	6.15
>>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c
>>> b/drivers/gpu/drm/xe/xe_hwmon.c
>>> index 515b288f18e5..023a317a443e 100644
>>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>> @@ -865,8 +865,9 @@ static const struct hwmon_channel_info
>>> hwmon_temp_info = {
>>>   static const struct hwmon_channel_info * const hwmon_info[] = {
>>>   	&hwmon_temp_info,
>>>   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX |
>>> HWMON_P_LABEL | HWMON_P_CRIT |
>>> -			   HWMON_P_CAP,
>>> -			   HWMON_P_MAX | HWMON_P_RATED_MAX |
>>> HWMON_P_LABEL | HWMON_P_CAP),
>>> +			   HWMON_P_CAP | HWMON_P_CAP_MAX,
>>> +			   HWMON_P_MAX | HWMON_P_RATED_MAX |
>>> HWMON_P_LABEL | HWMON_P_CAP |
>>> +			   HWMON_P_CAP_MAX),
>>>   	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT |
>>> HWMON_C_LABEL),
>>>   	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL,
>>> HWMON_I_INPUT | HWMON_I_LABEL),
>>>   	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL,
>>> HWMON_E_INPUT | HWMON_E_LABEL),
>>> @@ -1423,6 +1424,8 @@ xe_hwmon_power_is_visible(struct xe_hwmon
>>> *hwmon, u32 attr, int channel)
>>>   	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>>>   
>>>   	switch (attr) {
>>> +	case hwmon_power_cap_max:
>>> +		return hwmon->pl2_on_boot[channel] ? 0444 : 0;
>> I believe we also need to take PWR_LIM_EN in consideration here, no?!
>
> not needed, because pl2_on_boot filled with 
> xe_hwmon_pcode_read_power_limit(),
>
> which is give power limit > 0 value, only if corresponding power limit 
> is enabled.
>
>  261 static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon 
> *hwmon, u32 attr, int channel,
>
>  282         /* return the value only if limit is enabled */
>  283         if (attr == PL1_HWMON_ATTR)
>  284                 *uval = (val0 & PWR_LIM_EN) ? val0 : 0;
>  285         else if (attr == PL2_HWMON_ATTR)
>  286                 *uval = (val1 & PWR_LIM_EN) ? val1 : 0;
>  287         else if (attr == hwmon_power_label)
>  288                 *uval = (val0 | val1) & PWR_LIM_EN;
>
>> Perhaps checking has_mbx_power_limits && (pl2_on_boot[channel] &
>> PWR_LIM_EN) ?!
> we can add has_mbx_power_limits though.

On the second look, has_mbx_power_limits check not needed either as

pl2_on_boot[channel] is only filled in on platforms where 
has_mbx_power_limits is true, so a nonzero value already implies it.

>>>   	case hwmon_power_max:
>>>   	case hwmon_power_cap:
>>>   		if (hwmon->xe->info.has_mbx_power_limits) {
>>> @@ -1486,6 +1489,10 @@ static int
>>>   xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int channel,
>>> long *val)
>>>   {
>>>   	switch (attr) {
>>> +	case hwmon_power_cap_max:
>>> +		*val = mul_u32_u32(REG_FIELD_GET(PWR_LIM_VAL, hwmon-
>>>> pl2_on_boot[channel]),
>>> +				   SF_POWER) >> hwmon-
>>>> scl_shift_power;
>>> +		return 0;
>>>   	case hwmon_power_max:
>>>   	case hwmon_power_cap:
>>>   		return xe_hwmon_power_max_read(hwmon, attr, channel,
>>> val);
