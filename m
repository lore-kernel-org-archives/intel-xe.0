Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163EEE81BA5
	for <intel-xe@archiver.kernel.org>; Mon,  9 Feb 2026 11:49:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEBD810E3C9;
	Mon,  9 Feb 2026 11:49:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AJ+c5WLR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB70810E066
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Feb 2026 11:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770637760; x=1802173760;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Hhq0CjzLCGykktTe0ipW9xcUHp9+J639yHAa3hpxj6c=;
 b=AJ+c5WLRTD2eOcjhBglWf2YvYaIQWknuDmrgOwAvMuLRLDalHMTxKR2V
 1ZWubfh4H3oguAIaHSKw2fSLA1SnbhMMTpcVe3IaXjclwitRH7GqweWtq
 6eb3gqS6za5X78IOcaJqZlm1WFVvx0Q+cCqC1uE5hnnM+ThUYIqHZFcos
 +XwMhMQJjn/r2LzQ7yQWHLNrWyFm32LmypOWGRO/Su+d1dA33b5IuDwq2
 Plo40MiKPXLb5W4OJMIVUiYel1zr0GlKfP3tk41J3/wFn8aQcTho0fP+l
 WAM0wDjJgAvYnVpRBaScF/yGNQ8Mxz7JQ7svCmEMz+u5wHhNbYxxZIsg0 Q==;
X-CSE-ConnectionGUID: qh8XK5zCRgyr3hSJpohGcw==
X-CSE-MsgGUID: zn8tNG2fSC+uLbWL/Xn8Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="74343796"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="74343796"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 03:49:20 -0800
X-CSE-ConnectionGUID: iT3jTeXFSfCub53t5gX6yg==
X-CSE-MsgGUID: iLA94a3SRb2oVOhSppmdVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="216531604"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 03:49:20 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 03:49:19 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 03:49:19 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.35) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 03:49:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KX+MneDP4jETd2eO0BzeEOHo5NvpDFgywVJsu6YxqYjKaxy1AhMDbf6rQPu62zVk5+SBlrjQjjMVGpRNMp6lqEb9RS+feu+QQtXql/dGgtLfiZbDN4vZNTy0Luef/nFQ3RkpUKeoe3CximWwTDiByGq/bCOAF0lP/gGzZl09Z9wvUX56fRcXFIAM/bW9IsCrpsdZGtA7PUQaYfX4fLEFskELaN40Kxvt5sPz67egoqASzaExkt+J/PNsTQnERa8RSdSXdtuh8FEK8445k+t2tobT0BkNlKEGxB285POz9OQvNfFoELnGuOkeKgU/sBGgBsdDUHm0wYgSGnvJi6AN7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JKQ5BVZTnddlJ4RIPDbrNRbMe7B6EOkVeUJrim2Y3Jw=;
 b=gsgEj0xqnUmHYwtt3B+ys+iXZypTHooKZH5kGrd7qFSEKqrDxBCXEpv3kXaCaSpc0bW4/tCQgJoYKHx/ju5upxdszjdC7NpQE4wXDn7R8dyRIXfEai2TSQg/NmDdnsO0TuahC2jIgIUnDRC0vNT5AqGquJO7Z4LcQDKVzy73PK9Oygt+7EUrDt79cmgM2/Hmb5iOJnGklkhfEVMGrf/yY/yxRoCy/igPMxr3cSL70Fgo93Jra/MCUyti383wZJMgA9U8UV9StTyhxZLSba3AEPeaO8TgImC3izNCs7uB0+vMKMVSiMoVjushP00GENGUV6Yu7fM5HpMNNpXxFNjbRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by IA1PR11MB9469.namprd11.prod.outlook.com (2603:10b6:208:5b1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 11:49:17 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 11:49:17 +0000
Message-ID: <6e1db38a-b37c-4e7d-b683-207e28dec430@intel.com>
Date: Mon, 9 Feb 2026 17:19:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe2_hpg: Apply Wa_14024997852
To: "Gote, Nitin R" <nitin.r.gote@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
References: <20260205050818.2180756-1-arvind.yadav@intel.com>
 <IA3PR11MB8987F1ABCA16270C3B041202D065A@IA3PR11MB8987.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <IA3PR11MB8987F1ABCA16270C3B041202D065A@IA3PR11MB8987.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0072.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::12) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|IA1PR11MB9469:EE_
X-MS-Office365-Filtering-Correlation-Id: 8601b28f-d3d8-47a7-e5c7-08de67d14138
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGE4dnkvZFkwZ1kvTEs4cmd2WW1BR0MydVRGckxzdnN4cVdnMzRMaEpjUGRJ?=
 =?utf-8?B?U2Q4aDFRbGJxSFVNTkJsRzJlVEpxWnJ0VmhJcDZacTFrQjJFWXpFcndjSXZr?=
 =?utf-8?B?c0FyUElMeno0K3hSdHhtNk5VRmRSd01PdVU3SkVPNjRJdFNNZjI5SU9jSnhy?=
 =?utf-8?B?N3lrMVI0ZDZhVUw3WEhLKy9udGtUKzFSQ3BUcUFCQkJVUE5KWVBWdlZGZEFx?=
 =?utf-8?B?bzNRN1N5NDZ3WTlObnhmRjFRbW00bmhDNUoreWhOajlWVTl5aXkxeUIycmxz?=
 =?utf-8?B?SXN6UUpyRmJrZ3Q5ZDU1b2dwdlhQRCsxbm5RVGNQQWQrUFJuRkQ5VHFYOUNy?=
 =?utf-8?B?cWpnSzdGZVFubDl2SVZuQnYxRnFuVDFSdXp1QzlIWEl1Qkd5TVZkM3d1N1gv?=
 =?utf-8?B?anVKMFBoanA3eUpwNkZ1SG5VNTlySjFuWXBBcDNVQmFQU1UwMXBxK2JjV25m?=
 =?utf-8?B?YUs0eGlBRGJMMlhPNkFwT05Odyt1M3VxcVJZSW03TnY1cFJVR0QyQUpBVTJS?=
 =?utf-8?B?NFJqUE9tazFrZ1BndXVvNmZWZHhBTUkyNFJzL2ZSK0dzTW4wWnZZWTFRZ1hC?=
 =?utf-8?B?UHFJRGJpb3JCSlRKd0JoYUhNWXlmZTkydWI3MlJvalpuWTNJRmJlWXo5QjQw?=
 =?utf-8?B?eTNtUXRjN2owSko1bk0zY1VBRlBPYTRZS2pJYmtzdHFmcGVZOUxGcnpvZHEw?=
 =?utf-8?B?cmZNa1pSakgrZDlrMUdpZXk4WnRPdFN1b3l3NzM3TGpsdTNVZlVxaWllMThl?=
 =?utf-8?B?UnpENFR2L0dGSlE5ZU1BbkViaG0vOGR6dVlhSC9CZHRQSkhNM2hUK2dMTVRw?=
 =?utf-8?B?ZHNScHhGMnFWUDFZNjFESncrZWhscm9LTnMrK2FtZlhHbFRwaE8xNUozRy9n?=
 =?utf-8?B?TzNZL094ODRzaU9QckVJVHJIbnVCNTFWVHVYSmVFU0I2YjFZOGpXU0laTXlr?=
 =?utf-8?B?NExDQW9DOVlPYlFMbTBNWGcwblFvTHRRdlczcFBhLzVvMTRPUVRHZWRBbGpu?=
 =?utf-8?B?S3g2NVZXdDhnd2dEOWQ3NXdoOWNIZkF2ODlDc0xKRmY4RjRXUXBranYyL3J0?=
 =?utf-8?B?dkduS1dmcjNOelFwWXptYjl6UHEvK1I2c05lUlBCR2k5WFUzQjZ1V2NIMSti?=
 =?utf-8?B?dW5VKzZ3bGZ4U1BtR0hHOUtKdlFYd29tTmFqNzg2ejRTdU80MWZnUXRnUW9t?=
 =?utf-8?B?R0ZrcGdiRTExck5KNTVjQTdwbGJ1UkxDL3dOSG9ZUE1YYnV1emN4K2hSbGZa?=
 =?utf-8?B?R05lQ2M0RnY2d0dQb1Q1TUFTbXhtZTBUeTY1YUJubjhoSGM3bWdNNW5hYWVC?=
 =?utf-8?B?elhqMytOenVXMmJSSmpmVHM0a2N1dGJNKzRaRUFMVzRJNUs1NFdoMTBuK1ZV?=
 =?utf-8?B?U2NBR1I2K0ZweWFpa0NkVzk4Um5ic21SemY3Rnh2MWNHNGJGOEo1Y2E3enVj?=
 =?utf-8?B?cFlXMFMydW92cjlRMFRtell0b3YvNUg4T3NkQnhNTjRxTVM5RGlIUFR1UTFK?=
 =?utf-8?B?eG1OTkRwNVVDcmhZTmxsV2RNVitaZE5OcEZtTHhQS3o3TjlxT2hRN3pFWWt1?=
 =?utf-8?B?YkcyYW5Palh4M0tyZzdBdVN6a0FQNnM0TmMyRTMzYU9HcGJUbzZ3bkVFODdO?=
 =?utf-8?B?RjU5VHFVTjBzSkFPM2IxNE1jVTFQeklVdlNnY0JBajNzUlhvclBvc1ppVmZk?=
 =?utf-8?B?OFlpa1R4b29EamhqTUtjZVVuODJCVDNNZDRKWEtIVGx6MUI4bHk2QThiM1RT?=
 =?utf-8?B?bmxxSC82WWwwUU5TZnhjR0UvNGgzcTJFVjJ0QWZnYk96c3pRUjI1U2gwblNy?=
 =?utf-8?B?UkVRYkRGeWp4VXZqaU9UM2RNdUI0YmxCc3A5RlB1T2tsNnY4bElJQng5UUhi?=
 =?utf-8?B?djBIVzdEZjR3eW1ETlBpc29ZYjNxUldseHJmQTJibG8rQnJTTXkyTmlZSlcr?=
 =?utf-8?B?VlZqOEQ1ekdvZ3luUDd3MHVnMkhxbTB0ZTBMMHlocFlJUC9HNzdnbDhsNDdD?=
 =?utf-8?B?dUZmL1Yxdkk4NGdrOVFqLy9iVmZQSHN6aG9yWUsrR0J6dmRweGs0dXNQOVE2?=
 =?utf-8?B?VWFKU2FsRXUzTTJIUzhwZERFZkhLZUt5aVNlMmY2dlkxd0sxM28rUk4reXl4?=
 =?utf-8?Q?uF1s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXQ0M2xOL01GajJMdEhza25aT3ZFbUs2akpCVzVIenMzYmxoVndESFZ5WmhQ?=
 =?utf-8?B?YVR5ZU1pRlJmb1lwSC9RQ3Vvdjk0MHJxaDhXU1Zxd2JYWEZtK2xvdVRuRm1M?=
 =?utf-8?B?YU1lNDdTazBSMldReTk0aWpHV1dSTXlyeFhnaWNCdjRSa0d6V1RqZnNFTVhK?=
 =?utf-8?B?VzdzR05adGtMU3VlV2hmRHB2WS92Mk9vcnl4YWthaFBuUzRtNUFNMzdkMUNU?=
 =?utf-8?B?eVhCcFNqaTRCMXp4TEd6Q3NZd1AxWGpMZThzaXBYcDNGRlRtZ1JINE5PbWRI?=
 =?utf-8?B?aU5pWURlSXdEcVZ0MmxQZ3JES1lSamRNOXhXbVZFdUdBdFNKN3hQaW9rVnRF?=
 =?utf-8?B?TDZBcGpBcG9Lb1dLbElvaFpHYTRmakxXV3hMS0d3VWRmbVF4SHpJMHAzOVJ0?=
 =?utf-8?B?WlZDYVRXT0VMazBBWTdBSkdndHFjZk1mcG82R2ZISTJWWS9vVFlhRDlXbTZS?=
 =?utf-8?B?TFVhb1laN2Nmcjc1bEh2TjR4d3FJV0tUeWJYeGR5Nm4zeGhVZGNYN2YzdHBT?=
 =?utf-8?B?RnR1TCtsd3dieFdHTGtDMEhKTkh5TkZlQk82MU1CbnlwL3pJVlJSZW9ocjJy?=
 =?utf-8?B?VnZmK0xvbG1vZktGQ1U5djZvUndBVnh5NWp3SmwxSUdUenMzOCtadEdMUnFs?=
 =?utf-8?B?N1M2d2I1V0RTN0Y2c0FjeUdmajRlWi9JL2g4QlNteXFhWWpBODdEK2lYRUZh?=
 =?utf-8?B?N0dOWDdyQk41VjhxcnYwUENBOXhOblVuU3NpV25MRjFvVTIyclZuNklhZ1Ex?=
 =?utf-8?B?WGcydllMWFJzdzhQbEVEWG8xYVlaVFNCbXM3OTJwZG1tYmlwQTRPZk5wNDJp?=
 =?utf-8?B?U0hJakdxYmtpdmdWa1hJNFNrQkYrTkV6ck9wOWEzdGliV09LZUw3UUNqcWpk?=
 =?utf-8?B?cXc3YmIwWGtsMGxPTS90TnFDMy8wQUZJeHVaSmFJQk02RUlaNWl2RGF2Qzhi?=
 =?utf-8?B?aGNaV3dwdzFXa0pDZ3BwdDBlNEd4UGQrOWc1MjRXdzd4TFd1WUtLaSt4MTRS?=
 =?utf-8?B?Y3VVdWV0QVVpVjA4a3NTQW9kYXpRRmgvbHlBMHN1R3dtK0x3RVBpL3RJSE02?=
 =?utf-8?B?ZlpBRXRaeXNreXJWcU1DUWZaZTB4VmY3TUl5dkhrczNpM1d0c2VGSlV4aHAx?=
 =?utf-8?B?aExtUnhtWHMycU1Fd2IzaUhpUGltbndsaE91S1NVQ2tkRWVzcVpzdGdpRGlM?=
 =?utf-8?B?bHEzMnNaN2Rsb0k3bnNmMXJocXdRNGxuTDdQREY3QVg1cjhURXRpcldxUzl2?=
 =?utf-8?B?cHVTa2oveVhRK1ZGMHppblB0Q2tTTnpVSDcrU0NrcVpCeUxaSGRWZEdPRGhv?=
 =?utf-8?B?dDI5ZGJBNEV1c05GTkdNbUpYbnpocGJBMUk0VVB3dUxxK1prK25ScjBDVjNu?=
 =?utf-8?B?N042cjlZZzlQekxLV0FHR0E4MTJuM1B6T1Uyd3hWMitDTnUwWFBPN0ZjOG9X?=
 =?utf-8?B?eWNaakVKT0JKSk4rWjB3QWlDSUdFazNqTlZmVlN4VjJNMUFZRzRSSkVlNy9o?=
 =?utf-8?B?cVJSOEhKSHVGMmM0ZllIOWF3SXE1cTlVeERTcjZFbUl6d0tGNEtnaCs5N09a?=
 =?utf-8?B?V2dkU25JK2gvWkZFUlNyWjdqVFhEdE1hRlpMR1d4RDVmUjhkblpzT3NISW85?=
 =?utf-8?B?THFNLyt4aW91WWxVa0hkaXhwc0JGaUdmZFdrNWtpZStvLzgyUi9lcUtXUnFZ?=
 =?utf-8?B?TjN2bStIUkVibkFpUGl1OHJoRDlFTWFHc1Y0YUNrRmNDc2hIRFArRXNwMEh6?=
 =?utf-8?B?d2s4Mk9LUW5sdUxwRksvMEp6T1dOYXdSKzdUS1VUYnh5OUVWNWNSSTRuUCsz?=
 =?utf-8?B?Wlp2Qms2N3FRS0txYmVSVTBGbDZLRnVRY0NOcWQyT1FjU3gwelcvMWltcGtT?=
 =?utf-8?B?c0RzeEZQMldkSTNEa0hsTmVSckxQM29JUDRwMTNrR3V3Y0svUC9tOGp1cGps?=
 =?utf-8?B?K2FiTVNRYTJHQ0huS0hZNjFpTXdZaTM0VUZjU3l6MjlLQU10ZHFHOHV6UUE4?=
 =?utf-8?B?MkRzWlFZbUoxdi9HRU96YVdEU2VaMVJiSzBJaWNibFo1d2dGSXViMFAxTmdj?=
 =?utf-8?B?ZFZDR1V0NEoxQVp6bkJGQmVmaDRkbHBpeXlpNW9nWXR5N1k5azVZUUJzTjd3?=
 =?utf-8?B?SUc0STVVWFJkYzU1UlNEanVUeEdwT1JXbjVmcHhJNHNDRU5TYWdPOHRTNGxr?=
 =?utf-8?B?dWRJMUVmYmMrVlc3bkt3L1A1aTFEVzV4WjdoYmJYcXIza3RFOUpKZnkrWGpC?=
 =?utf-8?B?M3VwdFNuUWk0R08xV2Z3TzgxVWFrTDlCVVpOcVIweGNaTE9VV253QnlGZGcx?=
 =?utf-8?B?UE00bGwwaWlRK1k0UU9kL09EYzFoSUpjZWI3VTlPQUVBeUVacHlTdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8601b28f-d3d8-47a7-e5c7-08de67d14138
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 11:49:17.7468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2wvOpiZXow7fyIhFueZ5ZtkP4LkDHRhfVV/KM/87j4nsSl/Xx1dwpzWnv6SfyJ0snfDDYSIcrUkqnEZVhPc/Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9469
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


On 09-02-2026 12:10, Gote, Nitin R wrote:
> Hi,
>
>> -----Original Message-----
>> From: Yadav, Arvind <arvind.yadav@intel.com>
>> Sent: Thursday, February 5, 2026 10:38 AM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Gote, Nitin R <nitin.r.gote@intel.com>; Upadhyay, Tejas
>> <tejas.upadhyay@intel.com>
>> Subject: [PATCH] drm/xe/xe2_hpg: Apply Wa_14024997852
>>
>> Applied Wa_14024997852 to Graphics version 20.02
>>
>> Cc: Nitin Gote <nitin.r.gote@intel.com>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_wa.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c index
>> 1e8d61ac581b..2f838c99596f 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.c
>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>> @@ -874,6 +874,17 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>>   	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1,
>> DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
>>   	},
>>
>> +	{ XE_RTP_NAME("14024997852"),
>> +	  XE_RTP_RULES(GRAPHICS_VERSION(2002), GRAPHICS_STEP(A0, B0),
>> +		       ENGINE_CLASS(RENDER)),
>> +	  XE_RTP_ACTIONS(SET(FF_MODE,
>> +			     DIS_MESH_PARTIAL_AUTOSTRIP |
>> +			     DIS_MESH_AUTOSTRIP),
> I see as per the WA details, also need to set Bit 31 of FF_MODE, for TE autostrip disable.
> Could you please recheck?


Sure, You are correct. I will send a v2.

Thanks,
Arvind!

>
> - Nitin
>
>> +			 SET(VFLSKPD,
>> +			     DIS_PARTIAL_AUTOSTRIP |
>> +			     DIS_AUTOSTRIP))
>> +	},
>> +
>>   	/* Xe3_LPG */
>>   	{ XE_RTP_NAME("14021490052"),
>>   	  XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0),
>> --
>> 2.43.0
