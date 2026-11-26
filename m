Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECC8606A323
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 13:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lcc+4Nel;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=brqgcEx4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546AB1123E3;
	Thu, 26 Nov 2026 13:24:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 858351123DE;
 Thu, 26 Nov 2026 13:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795699466; x=1827235466;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IlgLa8o2voBSiJTvCoouIKtz+sl+nlXIZukHGrHdAzY=;
 b=lcc+4Nel9Fn8YaX3JpISRAbchPscV4O1Zu0FhhHVu0ZKYr+CI6RTQTbs
 UJhIu06q5jYek2+bdNfTp5YLNhzz7qm3J8CuG+w4KahSudaGC9mqgCteb
 f9YZxeWuMe0OMSUJLlijtWAbjx1U0nOOAJls6Q8faoCR7wzEPTEB/F5AP
 djG5pKyUIKVHWXPFsWl4Ua4CFazzhgPaX4oEpu1+4tWf978xx4gYUL498
 yy9AaSfjRafe36bjhAoO1R1VoXCHVULQRVBIDeBdtuwRhGhglc4dd4HjM
 /Pm41eOYUFtiCezpf06e8ok8Ywuky98Z9KXzQ+ekGBHCp/Ot+Plg1CzbJ g==;
X-CSE-ConnectionGUID: 69J03mxMSomMJe+tCICuEQ==
X-CSE-MsgGUID: 07DdJI0bSDWOskhgAY1uRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4499337"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4499337"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 05:24:26 -0800
X-CSE-ConnectionGUID: TznjpdmfQWOlAQmrPwFA/Q==
X-CSE-MsgGUID: oJguiYtwTCyWdTAznWSdUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12472323"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 05:24:25 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 05:24:24 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 05:24:24 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 05:24:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tv/nYdfEjDY4a8rJf89woG67ecBZfvaVYbzEhHl3KUen9NnidMawVjmZizDYNZ+EGt0aQVZIeEer2hjxyWTy4/BpwnNhYOdo/BSDL8++swd88w1FtrJ2Z005K76jYROUdvFyJVpYNFW7Zt3P5to0lDJ1gvXapeKdGjVfAEqs7X7Q+z8keJlaHX+mEgCVqBhRimE55ZLspFzh33hRQyQagQxP5HjGK8vLryrjHQuT009g82pxD1TnIDVb38fEs7cPCuODb7sUBifRKlAyJ28gvc19lhWX+PEp9nVP2/UC/QDkwlLcolHOrihtfROxLtLCErp3fzQzzVHY9cvQXpvQRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFZz7ZLDjzA4YVBrYTXIjN2iejUsz+zgzpfUlDd7Oso=;
 b=nxE3f7NQyhnmZtvWu2EVx8NTuH5YpI9E/Qrp/vSZeal/BIwXBg/c2lT8p+vPACM8u5wgvT7l0LRxoKbGHRKBERle1xaMdV47yf1Wqj0CNenvXlLNc02CxcSgSJ2E/tM5jUHmkc5759JHJDkEEQyxg8Vhl/ZuRSwvST+O49Y/o3LsexMhXg5NDJwCDEfUEGn0cxsckRQPjHWozrRC2iqcLOPi0+R7UFXDV7+6gYBD4pU3+RVFPYeGtun+/LDu/pCbFzCmjBHP9Hz2utXb9NGpCWQiSlKkrJ0hIJctPmNRpPWtueyrpv+V/vW1ZllITzUGJX3nvyRfxAn+sGQzH7DpWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFZz7ZLDjzA4YVBrYTXIjN2iejUsz+zgzpfUlDd7Oso=;
 b=brqgcEx4Ex+0pbxPnFZDmQt5AwFfqkJ//838oZ9e2ClNhVoge0uQ6rPW/03owvreW7Wu1Qbq7P/M71awR8aoLF+eg9QG05/t3Tl5i16wZ88WB9NihSTQIZ2/8UfPp+lWwQc7BFPdvp4ipw+ITnOXdykk7q7a4zJm6N6RN4TXTG0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21) by IA4PR11MB830535.namprd11.prod.outlook.com
 (2603:10b6:207:13f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 13:24:22 +0000
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460]) by LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 13:24:22 +0000
Message-ID: <04ddae57-c6d9-445e-a18c-5a62ec5f1f4a@intel.com>
Date: Thu, 26 Nov 2026 18:54:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] drm/i915/display: use str_enable_disable() more
To: Jani Nikula <jani.nikula@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
CC: Suraj Kandpal <suraj.kandpal@intel.com>
References: <cover.1795607055.git.jani.nikula@intel.com>
 <516907662db5f4f9f3dbaeb49ac031d310f3622a.1795607055.git.jani.nikula@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <516907662db5f4f9f3dbaeb49ac031d310f3622a.1795607055.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::14) To LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB148960:EE_|IA4PR11MB830535:EE_
X-MS-Office365-Filtering-Correlation-Id: 304c2aa6-d748-4e63-5226-08df4bc095a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|4143699003|261009223027099003|22082099003|18002099003|10067099003|11063799006|56012099006|261102123227099003|261028144727099003|261026140227099003|261021121427099003|261021123027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: w96zMomeQK91qpiO+VQCs5mJuNgRM/1q5RsA4RWWPvEN0b3y5wYYYiERRsIhS8chdUeAAXrygBocku2uYYg94bQcT19vwP2fiPKwrr9YmIEt1jtSkoSc/oh59qydTe3Gt79Xzd6tBKfLSF/TfuJIcZpowLUxIGQvD/QX7PCEk0g3VhNcgxLCCi9KUonfxFYKCb2rfT3UkbhTtI2BgR6buC2o46KaVXVmUHculAO8nugrWDHsjo893mqetkho+iJUQwjrGt9YlihkUQrMWQGch3OVeSb6BJ7GBccWyeQUrbQVIj61ui6tQRhqr+xik3n6sDnJpi7+o5meksC/zRg1u+a4w5JJf21OOmmAarIU0Dyk9+l0kCP4HFWkuUrRXHpVYydH0YhKZYV4IDXStnz7MFrLhceuZBOdykeV39kPSFaslb6GWJ1+50VcXrCZIb4Gwoub5uftk2rJh4SMTtfYBDKISc2YsY7WbwbbtJB1NPBJWYGE1mHNy+wxui3fnG0CaKBgDNm7d4D4cvFMNqxgho5aU8J/wmyENdTNxRqq3jituUTxLXE0cVxthbd2XOt3ptE4tOdJagybl7bzZUrEVzf0BUUbOyi4YjSzTYk/TSyHUlsjIpzgis9OU+1zbORVE+Ml0lbFi9Pe+8C1vvaEfiGsgUzZY7f8s24ardwwjAQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB148960.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(4143699003)(261009223027099003)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(261026140227099003)(261021121427099003)(261021123027099003)(261022105027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHloSGdXZEtQamNXcGlDMEJXeEVWR0VOL2hWTmF1RGZzUHU4aCtROWFnMi9O?=
 =?utf-8?B?MTMvajF3aTFwQ0I3MllMVmFEQitta0RjODR5Z1NBQWhWQktnU3dXRmRwWVZ0?=
 =?utf-8?B?ZWMxRGdCK2dqYjJDaWIzTjNDYkhsZzdLa1RvNXNuU1c0TG5hSVV2NHlMVXEx?=
 =?utf-8?B?TjE3bFFVOGFqU2JwSkpnbjNwRnZjWnNONDByMjE4SFhPck5JVm5EYW5DNHgy?=
 =?utf-8?B?ckV6NVJtUyt2RHR6cVJOSUZQS0dDVFRvWEVHWmxqWXZoMmwzcVh6ZGRGOXhi?=
 =?utf-8?B?YWNGU3JzQ3JXa09qbUF5TUJ2VzJYT0t1UlRDeWRwdkNqTkJpQ3dRMlViMnNZ?=
 =?utf-8?B?RmFGejM3d0xsSlZWVUtTNlpkNnNhSkt4WDhqd2h2VEtHZUlGWTg4L0JGMGRI?=
 =?utf-8?B?Rk9zTVJlcVFNWTZqWDdlWC8rdWx0T3VXKzR6Sk9YdXRmVkZ2NkpiNlRlMmcy?=
 =?utf-8?B?QTZ2S1lsaHoyNlUyb3p3ZGVpWTczbDQ2Nlp3MW0rZ2g5TkgyM2ZnK2liUS92?=
 =?utf-8?B?NzA1alltajJDTUQ1aVhYS3A2ODJDcTRyZUxMTXJkZVhXL3ladCtvdmNSbkdk?=
 =?utf-8?B?dmtqTXlCUzFnSDRPVFZLeGpiVzREcko2WHJIVW9Od1RkTXZJNVp4dmkzajhV?=
 =?utf-8?B?MjR4VFJiRytWb25uUXJtQWpOUDZ3eUQ5OE1tdlFJMWVFWTMra3J5NGhQQTEr?=
 =?utf-8?B?UmJzTjEySzk0QXliRmMyNS9lT3lXSjdjTm9JREhmS1h2UzBENzhFWVFNdGl4?=
 =?utf-8?B?em9vNTBpSSt1M29BWldyd0JYbkc4d1A3WVNRWk0rU1k5UkJDK05ZaGE2V2xL?=
 =?utf-8?B?RW9CUHBwWExabFNRcVh4NWgySUxHRVNKWkpkenRLK0tHNWs4cExJVURia0ls?=
 =?utf-8?B?U3h1SmpGR3dLZGpUQTZxZmljYmtlcHNBZndOWUJCbVk4YXBtckNzSFkwNGF3?=
 =?utf-8?B?UVd4K0s5V0xoQkxWSGYwUUJSTDByamk2Vlg2QVdqdEpwaUQzbnZHY3JRMjF6?=
 =?utf-8?B?WkNPUEdHWVdRZUhsc2ZIY3FFQjB1QmFEZjNsVzZYRHhaYm1SMkhyNkNpbDdW?=
 =?utf-8?B?eDJXQjZ1WUFFUEp5SlJPMlFXc3dkNFhnKytqMTNPRHhkQzJVUk5XcTZoeWRG?=
 =?utf-8?B?QlY5RjBIelQvRXM5QWh5MVpxMHB5YVltR21lOXRWRGVVWWVTcDQvZmgwSUhK?=
 =?utf-8?B?MVN3TFZ1SWFPQlltR29xRXQ2Rk1TYWd3dWo5cGkzVVduNkJBSHZZMURGNmlz?=
 =?utf-8?B?MU1tc0RhVTk3MFJXUVMxbHNQckxpTVhqcTBXRkV3M2hqZGU5QTJZNHNDdHYz?=
 =?utf-8?B?cmorRUNmdUpFbmpveFRMdm1Rc3h4aDhTOXhWb3F1OXpJMGh2YkU2TVJweG5S?=
 =?utf-8?B?cUYyTWRyREFaV0JzOVJ6bmo2WGtVZ2lNNmEyUlZhd2hUa0FtdWdCS2NjK2xl?=
 =?utf-8?B?eWpHQlJjOXUvemNZYTdJVGlyREJCS2RvakxsN2tpdWRTbzM5QzRnR0Y0Qm1l?=
 =?utf-8?B?SjNKbnhHcmh1TVhEdmZHWjFQTVBObUlUbXgzZGZjSjNYVUZLb0VLbFpQdHlv?=
 =?utf-8?B?cmU1QXdZNHVPTzdLZFJyeURQalQxZDZjOGdyL1dtbzJSMTFhb0ptNW9KT3dK?=
 =?utf-8?B?N1hlZ2J6dG5DeVRjTzJKK3YzRC9EV0xpZEsxYUNpZDVFQkNzQ2FNazRpeWt1?=
 =?utf-8?B?WWtkZm5Nd3AvUFYzUDNDRHRNcVQwZC8rSlY2YWlnUm1yTkd4TkZBTHpCQnhr?=
 =?utf-8?B?UEJ6d3Vsb0NyczB1bzEyUmlNRjk5MENlcVpFdTVVbnYwU1VZY2VXV1B1RVYv?=
 =?utf-8?B?TGcxTEJWMmhvcUtBSElsNW0rRDlYcHczaFhhYTNjWk1ZQy9MR216eVF3TFRL?=
 =?utf-8?B?d2ZLeTRuSERhc01iUTBIM1ZwaUsrRHd5QmcvWVVjRlpUNWIxQ1NBZXc1em5n?=
 =?utf-8?B?K3RYLzVTUDRyMjRMeUlhSHJhRlhQZ2JQRVIwTUo2ejhwckdaVHh1VUtXN3gw?=
 =?utf-8?B?NS8zOGx5YjQyU0ZHL05YNWx5QmZsNkswYnJmT3kvbHhaUTk4dE40Rkt2Tndq?=
 =?utf-8?B?c3FMQkpVZEF3eTluWjNkUXdsRzV6c01zTndMU081d0ljQkpNNG93cy9nM0ts?=
 =?utf-8?B?djNRVzRRMXRBaC9zMkRuenh4aFlmNUJsOG1vcUdNRng1YUN1SWxVL1lqMzYy?=
 =?utf-8?B?MTlaS3Zld3FFSG5Rb0YvNU9DWXBYdkoycGkyRnhzdVFKQ0FMdm8xNkdHRkRM?=
 =?utf-8?B?WGI4aEhCS0N2QkVVRjBINnJXT3NncUx1WDBSK3ROUkcwbndOaGk5aGMvcVRx?=
 =?utf-8?B?UGpRWWc2VHZNZUhwUmhqRjNEVVlxbnJnRjZidGMrREMxZDdMa2dMR1VraGtS?=
 =?utf-8?Q?LZzRNu+NtbqmiStg=3D?=
X-Exchange-RoutingPolicyChecked: aE3cogYL5fEtgGOEIWG/yDMf4PglqzET4/jf2HtkaDDYBRSdizcJslbt3gc5eZ+nxS19eTNVYpPQa1VyU8+vZEKpKoeLsJ+hFu/rIDV7YGuKsDAna834eXugjqT8JZQRWQBKjIdNzPzMAgImyQVH+xbFzFkdR3gVoiIwTWBDc+MKAo9s17FdCbMzl3hrgnWo4VCpRVDyshjAnXvQpmtplsubSAgSJQrQfn9cyrksClkpWepkVRtfacV75qdSikDg+AOcij4sYmKaBq/VLoQEFOJeKYXQsUnTTwSpGjgjEmqpRMkdT5htPnP+AfUCqAC8V9V6uvmppbT35WK3KBK24g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 304c2aa6-d748-4e63-5226-08df4bc095a3
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB148960.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 13:24:22.8882 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQigb9LUrxSBzUfh67UQ0+/pQDQYGH76C9WnCBbV+cinqlu/XxB/Wk7ea2IqdB1U1swkEoOKwrLFb/0YkpKOpnpDi3iLUnl2Vnsv1YJlVt8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB830535
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/25/2026 5:16 PM, Jani Nikula wrote:
> Convert a few places to str_enable_disable(). Improve the grammar and
> switch to %pe errno logging while at it.
>
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   drivers/gpu/drm/i915/display/intel_dp_hdcp.c | 4 ++--
>   drivers/gpu/drm/i915/display/intel_hdmi.c    | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> index 566a921d18a1..33cfa32791ae 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> @@ -756,8 +756,8 @@ intel_dp_mst_toggle_hdcp_stream_select(struct intel_connector *connector,
>   					 hdcp->stream_transcoder, enable,
>   					 TRANS_DDI_HDCP_SELECT);
>   	if (ret)
> -		drm_err(display->drm, "%s HDCP stream select failed (%d)\n",
> -			enable ? "Enable" : "Disable", ret);
> +		drm_err(display->drm, "HDCP stream select %s failed (%pe)\n",
> +			str_enable_disable(enable), ERR_PTR(ret));
>   	return ret;
>   }
>   
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index 667d4514c375..ff1106b70390 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -1572,8 +1572,8 @@ int intel_hdmi_hdcp_toggle_signalling(struct intel_digital_port *dig_port,
>   					 cpu_transcoder, enable,
>   					 TRANS_DDI_HDCP_SIGNALLING);
>   	if (ret) {
> -		drm_err(display->drm, "%s HDCP signalling failed (%d)\n",
> -			enable ? "Enable" : "Disable", ret);
> +		drm_err(display->drm, "HDCP signalling %s failed (%pe)\n",
> +			str_enable_disable(enable), ERR_PTR(ret));
>   		return ret;
>   	}
>   
