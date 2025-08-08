Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44D3C87FDA
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 17:02:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 640E810E1EC;
	Fri,  8 Aug 2025 17:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ivg4PfKA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC0910E1EC
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 17:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754672565; x=1786208565;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=XPi3myA9ae57J0rimMIFx1dED6+jzHH8o5og+KciL/Q=;
 b=Ivg4PfKAFgWd6rsi8QYBaL6Bb6qPiqwY4IVJiI0MeBiGLrjATNSM42nz
 ixCv2oe1thJjimFjw44VrmgNzIxpMaL9684vpI0xTvEG0kowg3vdBnl8M
 v0v5IQ40pzEukapdURtRFrYkykN5/usPDNfax9pORIjUPAQQzyxFRRjXJ
 HSVbhdhhr6JGgviH9Whi7S12c8l8R5TNciqIVDgziembI4X8w8bn3Gtn9
 YnYWI3SBFNG2p5hvJB2TAxYzidaCk8MTEVPoWiPXQ7l16GV3bFRxdee3q
 gEUo/KMcjCs/1q5wFEtBS6DbOWwm4Ycx82HmTh1fx2VpowPCBu2JiY5Kc g==;
X-CSE-ConnectionGUID: HUKd/iSoRbiLaSIc6U5H8w==
X-CSE-MsgGUID: NBtT55LCTP6bOkjYCGEdNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="56227487"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="56227487"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 10:02:45 -0700
X-CSE-ConnectionGUID: PVjsTZKpTHepL/IHf41wwA==
X-CSE-MsgGUID: 2gFSLyB9QLGWu1eWoaLkew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="169492482"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 10:02:42 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 10:02:39 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 8 Aug 2025 10:02:39 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.58)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 10:02:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cmpCUUFg69+wwrd0/dVIguJJRP9xqBn2RLdnyDg1Y241ZaM21f0oIXsHuHp6ZYE/FCn5uETJdzNVHnl8Jz8H6keOaGJhQYMsaH1/e2LOb8SNGd+9oNgQZVRTLDwGB1MnXBmMQ6qWprxT5Dq2j74gDjUaP+LqOUrMW16g/ld58BJvRs5OBQxoJUKhd2p9fwIcUFGibz1KInDfH+RjGzDfIfw8j6DpxFsUHZ/mhI9u9ia/aOHedJHKmh+Sn467k3o1Lv/xA2CldFQVR3IXMB5sulIMZl2Ot07sjluRXXFgTccmZbzyEy+daHqcXgqEI9xH85bSIy/bkIFd0ITNlWu0Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPi3myA9ae57J0rimMIFx1dED6+jzHH8o5og+KciL/Q=;
 b=ZsyePtdpsGIgkcrF3LPw2fq7ufr83F3SHmY0hppundWMBxKc5jBZ9yVdFkoWyAZh0Uxvcq+FazG0VzihRaV3xDjD66NF6jM33ew30JJamJ/LWrTEis5HDguetnFm7rdTOMr2USMx4go3e5EilFDGc4fbpXZfqUL5B5GgX+jFzdGhloAKHbWZhwKOq8cgj17fjk7jfDGMWDLDrKXmZrUnxvRtxO0/MuTBbwD+UddzD+qkpWxY6m6A7MHk8U5TEZ0VJ8bEFKs/waXVNfjLE68V6O+mko1aPKE4mUWUcHOcyMvkR521yUpkAdBZLi3Jrd74yrnBwVg5aIl8Sc7j0AtJ5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH0PR11MB4773.namprd11.prod.outlook.com (2603:10b6:510:33::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.18; Fri, 8 Aug 2025 17:02:35 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9009.017; Fri, 8 Aug 2025
 17:02:35 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe/migrate: make MI_TLB_INVALIDATE conditional
Thread-Topic: [PATCH v2] drm/xe/migrate: make MI_TLB_INVALIDATE conditional
Thread-Index: AQHcCFRWU5ZLqle8DEuav0wUr+DqQ7RY+86A
Date: Fri, 8 Aug 2025 17:02:35 +0000
Message-ID: <791aec1f4149ab370cc09a4152e4ab5d29a8b673.camel@intel.com>
References: <20250808110452.467513-2-matthew.auld@intel.com>
In-Reply-To: <20250808110452.467513-2-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH0PR11MB4773:EE_
x-ms-office365-filtering-correlation-id: 2a8ec749-f58f-48d0-b84a-08ddd69d5f4e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?N0N5SUtwY0Jkdk42end4K0ZkT3hodldkYjAvNHM4K1BjK1FEMy9HYVpCa1lF?=
 =?utf-8?B?eEZGTWdwZFhoMFl4YnZ3N1NLWXU5Vmtqcm44MVRuL0V5OFR3MWZpd1RaTk1q?=
 =?utf-8?B?eWNDS0JvVUpGWEZkYk5rSlgwN0JmWG9IbzhpNjdMc3pDeGRnb1AyejdpY21R?=
 =?utf-8?B?VllwZUZnN3djOEQ4WWdjM09VcU1nSytSQmw1UXd4eVAxNm9PNm9uNTU2TXNr?=
 =?utf-8?B?Qk9vaUI0OG9GZ1YvYkFrdTlqOEoxRWJ5TXI5R0U2NllibUtPME5tK0hLVGN4?=
 =?utf-8?B?akViQ25XZHNYZVprYnZXb0plK1VId2dLekgwVFJ4SGZNOTlqT00yc2NZWXI0?=
 =?utf-8?B?QStHVDVQbXFleHhORUxZdkZjeHFRd1dOOVNubE9XTW5NSld6TEVhRTRraG91?=
 =?utf-8?B?aHliSnVDYTRJWlVNMXprMkkwR1RnODNVQ3ppSkhmdUdzUmdJdG9FY3pTMDUv?=
 =?utf-8?B?NWp3OGYwSTJNODNFQXhQSk1lMGZYLzdyR1d5SE5Vck1weHJFN2Zzd2dHZThu?=
 =?utf-8?B?N2ZiQW9odTR3cHJtQnZ5S0JiM3FnNVU2YnpvbjBibUVIU3F2WVp4OTV0S1pL?=
 =?utf-8?B?djAvNDZsSStwczFia1doV3ZSVFdVZ1pPRTkxeE5CaXpRNEtENkV1bFFjNnhX?=
 =?utf-8?B?UWNxS0ZkUGNnOHN2NDlFMWt2eUM2SC9wa2RjZnVpR0tWeEI1eEtSdVpvSE9h?=
 =?utf-8?B?MWo2QWdlYnFjdE1kWlN5V0JQWmVKQkRHRG5iUjZISVJUbHFKdEJ3cnVxZGJ6?=
 =?utf-8?B?Z0YrckdHaTVDUFNXMDl6OFphM1FsKzFsS04yUkxLang0WXM2QWo4SFFSb1hY?=
 =?utf-8?B?TlQ3QnlaaldBaFdmVmljK21SellPSDhBV2RLbFNGSUNpQ3FJTHRsL09Fb3Rk?=
 =?utf-8?B?UkxjOFY0Y3BtYzdHb3dNeHMxeW1tMjhkWGdaWjYxTkR5VkVhTUtDRzd4ZXMy?=
 =?utf-8?B?STFwUGpZUm9vNURjQ082WkxTNXRkUU5CVzFvaHBkUHFqK1d3Z3g1T2JIY0w1?=
 =?utf-8?B?ZnVySVRjV3Q3L2VHYndrYzhJRzNoanBzclR6R3NEbzN3T3pRTCttT2FRTGpy?=
 =?utf-8?B?TDdJTWducGw0SXp3cis0VFNJd1d4UXdtUlZDWk5pR0lKVlJzNDNtM2Vob1dX?=
 =?utf-8?B?Q0FQdDllQldoNGZBdWlrSjlIeE5scjJHNTdvWEJHQmRLeXh5bzFtRmRFSm40?=
 =?utf-8?B?WWtwUEF1Sk9QbGNxbFAyd0JQVHRFMmJoU2pOekpkVVJsY2gxbkxxa0hEbUZH?=
 =?utf-8?B?eEQ4L0F5MGxMS2h1VW9lOGdWWjlCNjZaamxlZmRuV1hENVRZdUZkMnkrbGlO?=
 =?utf-8?B?ZHJIM3V3am0ydS84V2tsUno3Qm9USWUzbXAzMzVXdm4raENQSVVOYmpEa1pl?=
 =?utf-8?B?YkNZQmt0dTVwYmdJeHZ3K3hlL0NpbHhLUjluQ29YbHpzSG1BZTlIKzdSOFJh?=
 =?utf-8?B?V1lORHZPdEltSk1kNFpOQ0kzOEhubFkwMnNtb2ZsNW01SHZxeHNGQTJXYVNQ?=
 =?utf-8?B?Ni9WK05CcjlER0J1ZnVOK1BxczUyVW1wVXNGcU83NjV2K1I5Q2tzdTJ1NjND?=
 =?utf-8?B?RFl5RXIxazRrdUJHNnJZdlA4bHVQNDJOVXFIYm5NQzBVOEtBL3hQaE0zSStI?=
 =?utf-8?B?Y1FLcnpvY1YzM2l4RGhITllhTGttcGV2cnIraG8vTm91blpkSnRwSDRPUFls?=
 =?utf-8?B?NWdKd0llNG84L0k0eTVHQThXQ2kyRjFYZkZPZDZQbGtTOEhWNFZqdVpMNURy?=
 =?utf-8?B?elFrWUIwejM0NDc1K2tOdVVJb000R21GL1FhRXR2RWlQZ2dqeDJNcGVYdmlP?=
 =?utf-8?B?NWNqVVdDWUR3aXdtKzlibkJPQmVzR3h0dGR0cmZNd3pKSFJXL0FORkdHNTNH?=
 =?utf-8?B?bk55V2lXaGlJWVU0YUJ0bjZoWTlGSXdNOHVXSXFMZnVNV1Y2Szh6TStUMWwy?=
 =?utf-8?B?SEdYajZsTEdsR3ZwOW9XQzNlTWZGL2ZmRXJpbGZXYVAwK1lUYm1BRzhROFhi?=
 =?utf-8?Q?ZQ52PAwbE48FdN8Pagcdqq4quxuOgw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UDNsYlRSQjAwT25GekNFaGRIbUUzZDZJZUVhUytUU3dVTFhOY0FabkF4dXdC?=
 =?utf-8?B?YzVmZGxsdk95ZjRYRVhZL2piOUlmWnJHZHh2VFNNK0sxVkZFMDAwNjdNeTIy?=
 =?utf-8?B?eE8xN1ZlQ3M3TnJqaHloUHFWZ2tBRnNNQm9BRGs0dHhOUTNtVTBBbGVrYVp2?=
 =?utf-8?B?MVgrZ3dyWHlMb3UzaWpIUWp4eTV3aDF4eUxpamtHdjJvWkNvNUh0ekRmNnFq?=
 =?utf-8?B?WkUwbmZpOC9IUE5IRnhtaldYb0oxdUJhWTY2cXRqL1pwUUpLNTdDSlM4MXhs?=
 =?utf-8?B?SlhYWHZWVTlrNVlsM2dOSW40VjhKbGR6d0YzYkthUjBoMXAvRk9kNVQwTUYv?=
 =?utf-8?B?SVBIVXkxandCT2NSMFFxbjNpYy8yV0dDN09JbGt6NEdwREk0VGhYQndOOW5N?=
 =?utf-8?B?dVUyenJkZGdGNjVocDgvVmFSU05OR0wrMW1kRm1HUHQ3aThiaFp3OFQrWHZG?=
 =?utf-8?B?dGsvcTQva05VNFpkbG9RZTZadWY0LzYxdlN4VEFKTndyYWRQWnJvQi9MSkpK?=
 =?utf-8?B?UmoxTTJPMi9IQlUyc2RmQ2NNQ2ZHRVo2dWxrQUVkTVQ2SG45NUliakJBL0gx?=
 =?utf-8?B?U0xvRS8zbFFQZnQ4MHQzcndiZWc1Kzk0UXl2YzFmeXVxcjQrZzY0WjlqN2s5?=
 =?utf-8?B?WHA4WjVKeVRXejE0UTA3cjdhSThjajFpMmUyQ0RidGhRZ29sRmFTU3NWbThu?=
 =?utf-8?B?eUR5STZEaS9CRGFyUGIzTGNzWUVkS0thQ0dOTW9ZVnlOazNnMjRxeGxDd1VG?=
 =?utf-8?B?RVlsRzlKeFJrcnp3YlI4QUpvRjJ1UVJ4L2EzT29rdkVVL3M2Z0ZBMGh1cXpL?=
 =?utf-8?B?dW5QTU9KWHlDZ3lJd0tmaW9UcEllNmVoUHArYS9LVDhtay80MGljaXlxWTVP?=
 =?utf-8?B?VmdpMWhkb25NNTVCYlNidmdubEV0b0NId3RGaGlRRVNjZVNkMHg4dThYd1dO?=
 =?utf-8?B?Q1NObVhIbEhZT2dQL1BFcXBxUXQxaEI4UmRNRXhjTW5yOEIwN1BySXBQM1VB?=
 =?utf-8?B?QVYxTkN6VWQvYnFzUXY4clVMdGxTTHR0cXhJak5odlQ5M2d3MjFJaWRWaGgy?=
 =?utf-8?B?T2o0ODZYb0F3bTJkVXJmZEpOLzB0NkVJZkpSWTJQak41Y09zdmQ1dXkrQksy?=
 =?utf-8?B?dDIyN1BJK3pzR3JIYWhCb0tVQ1VqTU14VEhTTElVbUd5ajMvc3NLTWIrS2Vv?=
 =?utf-8?B?RUFFb1dKNjR3MDNNamxtUkNQZS85dDJzcjVZY3RyR09UV3NVNVdEOER5UzBK?=
 =?utf-8?B?WTJvTEZVaWNZendSSmhIVVNFY1EvWUhoZmFuZEhaZHdjUERIZ0VuNURsMG9F?=
 =?utf-8?B?WU1sNmhha3RtZEdtTUVzVTNSN2VVOE1LVURhNmRsVFQ5a1lOTkRTNDNkN3B3?=
 =?utf-8?B?czhRcVUrcDNCWmhDcHpYRHk3WGxwQkpFalNBWDVXRVU2UVcyaGJYQVJidEZT?=
 =?utf-8?B?RkVUK0NPNk11dWNlQVFqZWhlNHEzUDlwaDlsbHhuUlhXM2VrS2tPc3BmY2Mx?=
 =?utf-8?B?dUVYQ1Q0UFNsUW0wZktxUkExYXJ5Q3V6eXQ1clNvQURjQUFKM1lzUXN1Vi9n?=
 =?utf-8?B?ZXN3WjdnZURiQzBKR3drTFFLS2crUGQvWlF6a3Z6cHU1U0xYU2NIbzFQditZ?=
 =?utf-8?B?bzQ3a3BYTTVRTnNvWkRMNUN1Q0syRHJqUHJ1ZjVlZ1ZCODBMQzV2Y2RuaFAv?=
 =?utf-8?B?TzFFYlNIRE5xSm40Qk1STi92YjB0WFFqYlhmL2pJaUd1WWgyRm5ZZlBDNG5a?=
 =?utf-8?B?ZWQ4bjBnSnRRTDFUZTdCbmphcXdNZWNYSjJ0ZVRNNE9SNjNvcERudDFCRHNt?=
 =?utf-8?B?UEhDWVJuTDY5NkZrY0pabGJWNGZPRTM1ZEI5RXY2UXRPcTJBamJYWkpKejZK?=
 =?utf-8?B?T3dxN0dEcEdLMFozVTJEOE1BU2d0L3AyaUtDYjZNNnkwaUtCcG5RYzB2Zm1L?=
 =?utf-8?B?aklrZUxLdnVVdTRoOWZFL1lUdjhlYXhsOWVhK2pKUkZsN1gwMmpWWkZESFVp?=
 =?utf-8?B?M2h6TTZTVVg3UzR0eFVaSE9GZ0tnYmZNVGtWb05OUDF3R1JzN2xnZFNCRzh2?=
 =?utf-8?B?TGcvVENPeURFRTkrYUs0MDJHREZoeVM5cjB0K2NlcW1WbVlWWHdvOVV5b3RF?=
 =?utf-8?B?VXNtdlMyQlVUbVpVSlRhcGJ6VGthQTVOK055RWRHODNqWk1GdTVnd2toWWw0?=
 =?utf-8?B?UVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4905199AF306A3459293711B462D296A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a8ec749-f58f-48d0-b84a-08ddd69d5f4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2025 17:02:35.3351 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9/Dwi9q0xKl7v8I04XDSW5EowfX6KBov1CDS1uxSvPFVMOWWgHi4IoSyY6KvlcoiNbwrBbo6OV0dC4c8GAXQrwMj3otJ6MN+1cmaNh8TdGk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4773
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

T24gRnJpLCAyMDI1LTA4LTA4IGF0IDEyOjA0ICswMTAwLCBNYXR0aGV3IEF1bGQgd3JvdGU6Cj4g
V2hlbiBjbGVhcmluZyBWUkFNIHdlIHNob3VsZCBiZSBhYmxlIHRvIHNraXAgaW52YWxpZGF0aW5n
IHRoZSBUTEJzIGlmCj4gd2UKPiBhcmUgb25seSB1c2luZyB0aGUgaWRlbnRpdHkgbWFwIHRvIGFj
Y2VzcyBWUkFNICh3aGljaCBpcyB0aGUgY29tbW9uCj4gY2FzZSksIHNpbmNlIG5vIG1vZGlmaWNh
dGlvbnMgYXJlIG1hZGUgdG8gUFRFcyBvbiB0aGUgZmx5LiBBbHNvIHNpbmNlCj4gd2UKPiB1c2Ug
aHVnZSAxRyBlbnRyaWVzIHdpdGhpbiB0aGUgaWRlbnRpdHkgbWFwLCB0aGVyZSBzaG91bGQgYmUg
YSBwcmV0dHkKPiBkZWNlbnQgY2hhbmNlIHRoYXQgdGhlIG5leHQgcGFja2V0KHMpIChpZiBhbHNv
IGNsZWFycykgY2FuIGF2b2lkIGEKPiB0cmVlCj4gd2FsayBpZiB3ZSBkb24ndCBzaG9vdCBkb3du
IHRoZSBUTEJzLCBsaWtlIGlmIHdlIGhhdmUgdG8gcHJvY2VzcyBhCj4gbG9uZwo+IHN0cmVhbSBv
ZiBjbGVhcnMuCj4gCj4gRm9yIG5vcm1hbCBtb3Zlcy9jb3BpZXMsIHdlIHVzdWFsbHkgYWx3YXlz
IGVuZCB1cCB3aXRoIHRoZSBzcmMgb3IgZHN0Cj4gYmVpbmcgc3lzdGVtIG1lbW9yeSwgbWVhbmlu
ZyB3ZSBjYW4ndCBvbmx5IHJlbHkgb24gdGhlIGlkZW50aXR5IG1hcAo+IGFuZAo+IHdpbGwgYWxz
byBuZWVkIHRvIGVtaXQgUFRFcyBhbmQgc28gd2lsbCBhbHdheXMgcmVxdWlyZSBhIFRMQiBmbHVz
aC4KCkhleSBNYXR0LAoKRGVmaW5pdGVseSBsb29rcyBsaWtlIGEgZ29vZCwgaW50ZXJlc3Rpbmcg
Y2hhbmdlLiBJJ20gcnVubmluZyBhIGZldwpsb2NhbCB0ZXN0cy4gQ2FuIHdlIGhvbGQgb24gdGhp
cyBtZXJnZSBmb3IgYSBmZXcgaG91cnM/IEknbGwgcmVwb3J0CmJhY2sgYXMgc29vbiBhcyBJIGhh
dmUgdGhhdC4KClRoYW5rcywKU3R1YXJ0Cgo+IAo+IHYyOgo+IMKgIC0gVXBkYXRlIGNvbW1pdCB0
byBleHBsYWluIHRoZSBzaXR1YXRpb24gZm9yIG5vcm1hbCBjb3BpZXMgKE1hdHQgQikKPiDCoCAt
IFJlYmFzZSBvbiBsYXRlc3QgY2hhbmdlcwo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hdHRoZXcgQXVs
ZCA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4KPiBDYzogSGltYWwgUHJhc2FkIEdoaW1pcmF5IDxo
aW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPgo+IENjOiBUaG9tYXMgSGVsbHN0csO2bSA8
dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IE1hdHRoZXcgQnJvc3QgPG1h
dHRoZXcuYnJvc3RAaW50ZWwuY29tPgo+IFJldmlld2VkLWJ5OiBNYXR0aGV3IEJyb3N0IDxtYXR0
aGV3LmJyb3N0QGludGVsLmNvbT4KPiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdy
YXRlLmPCoCB8IDE4ICsrKysrKysrKysrLS0tLS0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3Jpbmdfb3BzLmMgfCAxMCArKysrKy0tLS0tCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2Vy
dGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfbWlncmF0ZS5jCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZS5jCj4g
aW5kZXggNGVmZmUxMGQ4MTViLi4zNTYwOTdmZDZkMmEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX21pZ3JhdGUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdy
YXRlLmMKPiBAQCAtOTA2LDcgKzkwNiw3IEBAIHN0cnVjdCBkbWFfZmVuY2UgKnhlX21pZ3JhdGVf
Y29weShzdHJ1Y3QKPiB4ZV9taWdyYXRlICptLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gZXJyOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgfQo+IMKgCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX3NjaGVk
X2pvYl9hZGRfbWlncmF0ZV9mbHVzaChqb2IsIGZsdXNoX2ZsYWdzKTsKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgeGVfc2NoZWRfam9iX2FkZF9taWdyYXRlX2ZsdXNoKGpvYiwgZmx1
c2hfZmxhZ3MgfAo+IE1JX0lOVkFMSURBVEVfVExCKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGlmICghZmVuY2UpIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBlcnIgPSB4ZV9zY2hlZF9qb2JfYWRkX2RlcHMoam9iLCBzcmNfYm8t
Cj4gPnR0bS5iYXNlLnJlc3YsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgCj4gRE1BX1JFU1ZfVVNBR0VfQk9PS0tFRVApOwo+IEBAIC0xMjg3LDExICsxMjg3
LDEzIEBAIHN0cnVjdCBkbWFfZmVuY2UgKnhlX21pZ3JhdGVfY2xlYXIoc3RydWN0Cj4geGVfbWln
cmF0ZSAqbSwKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc2l6ZSAtPSBj
bGVhcl9MMDsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qIFByZWVtcHRpb24g
aXMgZW5hYmxlZCBhZ2FpbiBieSB0aGUgcmluZyBvcHMuICovCj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGlmIChjbGVhcl92cmFtICYmIHhlX21pZ3JhdGVfYWxsb3dfaWRlbnRpdHko
Y2xlYXJfTDAsCj4gJnNyY19pdCkpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlm
IChjbGVhcl92cmFtICYmIHhlX21pZ3JhdGVfYWxsb3dfaWRlbnRpdHkoY2xlYXJfTDAsCj4gJnNy
Y19pdCkpIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqB4ZV9yZXNfbmV4dCgmc3JjX2l0LCBjbGVhcl9MMCk7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGVsc2UKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGVtaXRfcHRlKG0sIGJiLCBjbGVhcl9MMF9wdCwgY2xlYXJfdnJhbSwKPiBjbGVhcl9v
bmx5X3N5c3RlbV9jY3MsCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZzcmNfaXQsIGNsZWFyX0wwLCBkc3QpOwo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9IGVsc2Ugewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZW1pdF9wdGUobSwgYmIsIGNsZWFyX0wwX3B0LCBj
bGVhcl92cmFtLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBjbGVhcl9vbmx5X3N5c3RlbV9jY3MsICZzcmNfaXQsCj4gY2xl
YXJfTDAsIGRzdCk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBmbHVzaF9mbGFncyB8PSBNSV9JTlZBTElEQVRFX1RMQjsKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgfQo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBi
Yi0+Y3NbYmItPmxlbisrXSA9IE1JX0JBVENIX0JVRkZFUl9FTkQ7Cj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqB1cGRhdGVfaWR4ID0gYmItPmxlbjsKPiBAQCAtMTMwMiw3ICsxMzA0
LDcgQEAgc3RydWN0IGRtYV9mZW5jZSAqeGVfbWlncmF0ZV9jbGVhcihzdHJ1Y3QKPiB4ZV9taWdy
YXRlICptLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHhlX21pZ3JhdGVf
bmVlZHNfY2NzX2VtaXQoeGUpKSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgZW1pdF9jb3B5X2NjcyhndCwgYmIsIGNsZWFyX0wwX29mcywgdHJ1ZSwK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBtLT5jbGVhcmVkX21lbV9vZnMsIGZhbHNlLAo+IGNsZWFyX0ww
KTsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZsdXNo
X2ZsYWdzID0gTUlfRkxVU0hfRFdfQ0NTOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgZmx1c2hfZmxhZ3MgfD0gTUlfRkxVU0hfRFdfQ0NTOwo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBqb2IgPSB4ZV9iYl9jcmVhdGVfbWlncmF0aW9uX2pvYihtLT5xLCBiYiwKPiBA
QCAtMTYzNyw2ICsxNjM5LDggQEAgX194ZV9taWdyYXRlX3VwZGF0ZV9wZ3RhYmxlcyhzdHJ1Y3Qg
eGVfbWlncmF0ZQo+ICptLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byBl
cnJfc2E7Cj4gwqDCoMKgwqDCoMKgwqDCoH0KPiDCoAo+ICvCoMKgwqDCoMKgwqDCoHhlX3NjaGVk
X2pvYl9hZGRfbWlncmF0ZV9mbHVzaChqb2IsIE1JX0lOVkFMSURBVEVfVExCKTsKPiArCj4gwqDC
oMKgwqDCoMKgwqDCoGlmIChvcHMtPnByZV9jb21taXQpIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHB0X3VwZGF0ZS0+am9iID0gam9iOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgZXJyID0gb3BzLT5wcmVfY29tbWl0KHB0X3VwZGF0ZSk7Cj4gQEAgLTE4NjIs
NyArMTg2Niw3IEBAIHN0YXRpYyBzdHJ1Y3QgZG1hX2ZlbmNlICp4ZV9taWdyYXRlX3ZyYW0oc3Ry
dWN0Cj4geGVfbWlncmF0ZSAqbSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdv
dG8gZXJyOwo+IMKgwqDCoMKgwqDCoMKgwqB9Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqB4ZV9zY2hl
ZF9qb2JfYWRkX21pZ3JhdGVfZmx1c2goam9iLCAwKTsKPiArwqDCoMKgwqDCoMKgwqB4ZV9zY2hl
ZF9qb2JfYWRkX21pZ3JhdGVfZmx1c2goam9iLCBNSV9JTlZBTElEQVRFX1RMQik7Cj4gwqAKPiDC
oMKgwqDCoMKgwqDCoMKgbXV0ZXhfbG9jaygmbS0+am9iX211dGV4KTsKPiDCoMKgwqDCoMKgwqDC
oMKgeGVfc2NoZWRfam9iX2FybShqb2IpOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfcmluZ19vcHMuYwo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jpbmdfb3BzLmMKPiBp
bmRleCBlOGYyMmVjNWY5YWYuLjgwZGZmYzNiYTAzNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfcmluZ19vcHMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9yaW5n
X29wcy5jCj4gQEAgLTExMCwxMCArMTEwLDEwIEBAIHN0YXRpYyBpbnQgZW1pdF9iYl9zdGFydCh1
NjQgYmF0Y2hfYWRkciwgdTMyCj4gcHBndHRfZmxhZywgdTMyICpkdywgaW50IGkpCj4gwqDCoMKg
wqDCoMKgwqDCoHJldHVybiBpOwo+IMKgfQo+IMKgCj4gLXN0YXRpYyBpbnQgZW1pdF9mbHVzaF9p
bnZhbGlkYXRlKHUzMiBhZGRyLCB1MzIgdmFsLCB1MzIgKmR3LCBpbnQgaSkKPiArc3RhdGljIGlu
dCBlbWl0X2ZsdXNoX2ludmFsaWRhdGUodTMyIGFkZHIsIHUzMiB2YWwsIHUzMiBmbHVzaF9mbGFn
cywKPiB1MzIgKmR3LCBpbnQgaSkKPiDCoHsKPiAtwqDCoMKgwqDCoMKgwqBkd1tpKytdID0gTUlf
RkxVU0hfRFcgfCBNSV9JTlZBTElEQVRFX1RMQiB8Cj4gTUlfRkxVU0hfRFdfT1BfU1RPUkVEVyB8
Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE1JX0ZMVVNIX0lNTV9EVzsKPiAr
wqDCoMKgwqDCoMKgwqBkd1tpKytdID0gTUlfRkxVU0hfRFcgfCBNSV9GTFVTSF9EV19PUF9TVE9S
RURXIHwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTUlfRkxVU0hfSU1NX0RX
IHwgKGZsdXNoX2ZsYWdzICYgTUlfSU5WQUxJREFURV9UTEIpCj4gPzogMDsKPiDCoAo+IMKgwqDC
oMKgwqDCoMKgwqBkd1tpKytdID0gYWRkciB8IE1JX0ZMVVNIX0RXX1VTRV9HVFQ7Cj4gwqDCoMKg
wqDCoMKgwqDCoGR3W2krK10gPSAwOwo+IEBAIC00MTAsMTMgKzQxMCwxMyBAQCBzdGF0aWMgdm9p
ZCBlbWl0X21pZ3JhdGlvbl9qb2JfZ2VuMTIoc3RydWN0Cj4geGVfc2NoZWRfam9iICpqb2IsCj4g
wqDCoMKgwqDCoMKgwqDCoGkgPSBlbWl0X2JiX3N0YXJ0KGpvYi0+cHRyc1swXS5iYXRjaF9hZGRy
LCBCSVQoOCksIGR3LCBpKTsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBkd1tpKytdID0gcHJlcGFy
c2VyX2Rpc2FibGUodHJ1ZSk7Cj4gLcKgwqDCoMKgwqDCoMKgaSA9IGVtaXRfZmx1c2hfaW52YWxp
ZGF0ZShzYWRkciwgc2Vxbm8sIGR3LCBpKTsKPiArwqDCoMKgwqDCoMKgwqBpID0gZW1pdF9mbHVz
aF9pbnZhbGlkYXRlKHNhZGRyLCBzZXFubywgam9iLQo+ID5taWdyYXRlX2ZsdXNoX2ZsYWdzLCBk
dywgaSk7Cj4gwqDCoMKgwqDCoMKgwqDCoGR3W2krK10gPSBwcmVwYXJzZXJfZGlzYWJsZShmYWxz
ZSk7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgaSA9IGVtaXRfYmJfc3RhcnQoam9iLT5wdHJzWzFd
LmJhdGNoX2FkZHIsIEJJVCg4KSwgZHcsIGkpOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoGkgPSBl
bWl0X2ZsdXNoX2ltbV9nZ3R0KHhlX2xyY19zZXFub19nZ3R0X2FkZHIobHJjKSwgc2Vxbm8sCj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgTUlfSU5WQUxJREFURV9UTEIgfCBqb2ItCj4gPm1pZ3JhdGVfZmx1c2hfZmxhZ3MsCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgam9iLT5taWdyYXRlX2ZsdXNoX2ZsYWdzLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkdywgaSk7Cj4gwqAKPiDC
oMKgwqDCoMKgwqDCoMKgaSA9IGVtaXRfdXNlcl9pbnRlcnJ1cHQoZHcsIGkpOwoK
