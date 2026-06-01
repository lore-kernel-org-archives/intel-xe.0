Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75990CD5BD1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 15:48:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A01113504;
	Mon,  1 Jun 2026 15:48:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mdkm9L5k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40783113504
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jun 2026 15:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780328933; x=1811864933;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HT6avcSz0tzHfn9lbrTqolaw5XtSXgalHg85yvfTgBg=;
 b=mdkm9L5k21+KxranoGPdxKIxCgpjCN+fFaZoKlWOqZ+un5amLtnktDWT
 zfaNXwOdjzXQd/o1dfmLodvOAp3Iw87+qX4ombu34FO9SHaleFePYMnwe
 eogQnyFBZnqAiefIwQF0AjxIAViB8iWiujuqvtd2DjPV87cMHNVFjSsDj
 4ujOY2N7oS7j075R7VOffIQ9Ug1fQxYcrlVek8aiv2QBOr/b9/+FiqLzA
 IcI4VPkJXhncoKf6qP7CG/4M8udGxMKMDc0Bo28CMHtpQl+JFDbU1VAni
 X/bHH3WOmm4nykd6+G0O5UJJ2JvkNgrMChxxx3PEr+Mm7U5pIpB3fEfxt w==;
X-CSE-ConnectionGUID: uQA97s28SLiqfN31jsI61g==
X-CSE-MsgGUID: q6GSXHA5Sviz2te/+MV/2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="80820457"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="80820457"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 08:48:51 -0700
X-CSE-ConnectionGUID: Qg8s/f7vQwmUOKP1AYnnng==
X-CSE-MsgGUID: DMfIbY6dTkigze1GiDZkCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="248523787"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 08:48:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 08:48:50 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 1 Jun 2026 08:48:50 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.9) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 08:48:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bIClF3x1CCR1uZDpRAbYf1/tBq1B9JFg51iNKi55bZLp8TeHDMUyHp0tDZHPBTxCj7PkeS9eOaaaw/ojOEhhp2JV7wLjm3YGQgpCnfdpjEKDlxT5E89/58Wvz0RYdfbQSHi2W7/tgNWL2RFPEIPNMi4CwkTpGomDke52oUi4AH11vW5y0lEo5ByOcxxKoEIzlaqjONr6DCNDItE+TgVbjyN0GRegL4YeGdV0vs7NQC2XFQ9SlH0No2DsNe6SkQa2T3b+xkI4cn5udRPBlv46Kxk/l1IOJhjqbeZXhlHtn4+Gvh3jgshAG1bKt5EUcUNBr9WwpmlRHs2Xd0GYV6R/5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcTLuKdOBmnYSpX8y1+5rR+1ntBePaexU7WuJJIiEV4=;
 b=ERSIc5nQY/pJNmEeGr0Wt//3Z4yA664qxASb2NI5vnUn4bAnnqeORllFYuAiAA9QGWUnY80zckIXBA2YmSh3tfNTeyP/mfJB/vqFuVxI/2k43XV4BtaeqqavmSdwYqgxZ44UuCRiCvI8RKclSLEW0kHn+F/1+a6AcmxE1ww6nWS+OtNJBqfYPoOXHlFb0aksll22NGekkqQpNOgF0m2LDXURGa+nSWeLwnEr3+f3KyYoMMqogxmn4PHod8krYI79l+0a5Vqwo06AfzJfLsRnAF5q6uAb3rTnM8icYx4X/13/SA6PvbqT9VN/DNrTw5wOeS/sM0NoqJYeEu88aJA9Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by MW4PR11MB6981.namprd11.prod.outlook.com (2603:10b6:303:229::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 15:48:45 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.21.0071.014; Mon, 1 Jun 2026
 15:48:44 +0000
Message-ID: <2998ca35-7d31-4ed9-9afe-9875f99f0124@intel.com>
Date: Mon, 1 Jun 2026 08:48:42 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/8] drm/xe/migrate: Introduce xe_migrate_reinit()
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <rodrigo.vivi@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <riana.tauro@intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>, <michal.winiarski@intel.com>,
 <matthew.auld@intel.com>, <dev@lankhorst.se>, <jani.nikula@intel.com>,
 <lukasz.laguna@intel.com>, <zhanjun.dong@intel.com>, <lukas@wunner.de>,
 <badal.nilawar@intel.com>
References: <20260516093131.27442-1-raag.jadav@intel.com>
 <20260516093131.27442-7-raag.jadav@intel.com>
 <434530c7-352b-4802-a3f8-50dc9d6486b1@intel.com>
 <ahlf9TGszMJUITJv@black.igk.intel.com>
 <a72fcd52-3590-430e-a963-ab9ae00d68b2@intel.com>
 <ahqUYb6ZdaBh6EP_@black.igk.intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <ahqUYb6ZdaBh6EP_@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0123.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::8) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|MW4PR11MB6981:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f69fccb-d555-4932-7fb8-08debff542af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|4143699003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: Q5U6rUbsFBu1uTUK7inCXVMmiUcYSgdes6qCU9xl/t8yZ8RsFTCxaSFQyDGSBSBlrtCN7etF0Xa4X49lIA/CIh3dR/CWlpYIMJXqxbcQZmeeT67X/nX7q5cAsmfQy0qNLCYsLKKT/CRds/kzE22g9yB9EvlDxM5tzB2pd2IKfHhaNsS+++vdCrhH3vv3xIqXA0JQvwUjS+ssX2DppVcj2K159EsMoMbtoEULVkB8qu9PN8ROHBlXwv9Cf+uBL/hnw39fY+EVeIrJQEIyqKNZ3hm9eRk3TxEdOE8gAujf1IMKpXca2z+/AYKfkieZc5LJF6f4tOZ1t7Abx7IyIUfGClhKguILHoVFAmPqP4Bv8tKZDnzOJ8yucajacAp4WFyfTzosk/INBjjEeGGd6ju4teU8JQMcHax7x7ilyh4ufOMHm+uzGnRGZz1eiBfkIXfsV41bRqUTxOF63+vE0+dq1LcblP9lGd7Y6ftdI0gQzFcbObn4j6IBwbUlOC237aG6Xu8YWXNCzL30F4bTRrmfM5mu6ksFDM51QSN49+P9eilR4NLHLVY76ViDMmcflExj34s3h5fx5SuvlubNXewzvAZJYfk5tetnnlzykTiTeWiiusgAnYGZMVc0DY+zeMZ7Q2STaAxgN/Lwp8qMFLRhy7tYFpd0Ywft5XVUVq0GY+PKS9hGBBwFw8TCeaBlNtlR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(4143699003)(6133799003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXp4Q1l3bzJxUHgyZlFKeVV5YmN4NXgzN28raFA3VW01UlN2YWpINWx0M2FB?=
 =?utf-8?B?d1lFZ0ZscjlHWnF3amtUdWE4cWJvSVlvL0xEc1dMSWFhVU1SSGdsYVQrMVJU?=
 =?utf-8?B?VFFqOE9Nd2hqWmRab1R0SWtRbVBXNWc1MzZiUG1JWDc4OFRvdC9FVEd0WnJ3?=
 =?utf-8?B?MW0zbzJUak1pcUF0TENsY0F6UDdRZGxzOGhpSFVlVW1ZRHB3c2oyMTgvM0hC?=
 =?utf-8?B?eC83eEh4L3RLYjhlcTZvV0xnNU9scDV1aS9RSnVrTGl4SFl0NXhES2laSzNY?=
 =?utf-8?B?MUl3M0NFSjJJSmFtNnJzQk1haDVBaEFvTEVIcks1Z05LbERXTVBodUd3dG9l?=
 =?utf-8?B?YVhPSHdLcHVKV3d2N0ZsSlVkVjUxU0lhSkphVmpqMUFUZmQzT256QUtDQm5J?=
 =?utf-8?B?RHY1S2xndzR3Q2FCc3pvRWtCdmw4RGhXeDZTbHk5Kzg2c2xSc3dPcFplU0dF?=
 =?utf-8?B?clNSbDVvdi9hKy9mam56b3pSVHpZSk5KY3NDNWFLb21HUnhmdThsUzJLVzdR?=
 =?utf-8?B?NHQyazRPRVlhbHZWUTlUNGFkT2l2RTBLNWYwNTNvWmgzMmZlMzV6dllVYU5M?=
 =?utf-8?B?bE1hVFQvTkFGcmRhcmVwd0NRSFNtV3VndzBFOXRlTXAyR2tDdDZJNk00NjdX?=
 =?utf-8?B?YklLZ3VReTZtZEZFMENoMFh1QWYvUExWU0s4eExUTnpGczZoenhRdmtvZGtJ?=
 =?utf-8?B?M3VHUFZwVzlWQmdVenNCQUNxYUp4Y200dnZpeXp6RmZsbVJJQ3dXNDlPaXRN?=
 =?utf-8?B?ZGVocmpBRmZDTjEyYTJrQmoxVHVtSnJJN0pOQmZJRGRReVlRbWhUWmRkSkN1?=
 =?utf-8?B?NWRzbDdLaG43dUhIMDlOQ1NnR3hBbGtjUVlwd3VUaXRYRlJOUXhNK0VBQi9T?=
 =?utf-8?B?RTVMaS96NWM5UE5lamczeG5UbGdYTEg0S2hEcGhXTXVVOGFCSkR0anRGK0w0?=
 =?utf-8?B?ZXJsMXFXY3VnVVZSaTc5ZHBCUzFVaFA0Tnl2MUVGUFc4V1RUUWd4c0ZTR0VO?=
 =?utf-8?B?WXcydWg3emNQWmUzWGRyRWhHYnJqVHZTUi9VRmM3N2RIeEEwZlhmNjRJbHBu?=
 =?utf-8?B?czJBNmZtcnN0N044dko2VkUzdGh4MXVhYzJ1ekFUcmhDdXpNOENGSCsxUEN3?=
 =?utf-8?B?aC9teUlnOU81UnNqZk5FdTZTQVI2VUdLamMwb3ZyU2xmNlNmd0RKb3ZMdHQw?=
 =?utf-8?B?VE1HRkV2SisvMzBpcjZhK0tNaDljWVlzd0VVNjV5MkZxdllMQXdYSS96OGh5?=
 =?utf-8?B?djJCb3VPaG1tU0l4WkFtVCtiUDhBNmJmcUJMeTZUV1ljUksySUdHR0RQY3U5?=
 =?utf-8?B?M3g5cEV2dzZ2Q2swTzdnK1FCN3dXa3p2ODF5KzhxNXFvRlg4YkdLN292RExi?=
 =?utf-8?B?amd2czhaRjBBTy96NVFjUElDVE9sanJ2WFRiV0RpNVV5WUh3OVVPdDN1ODc3?=
 =?utf-8?B?Q0NEazZRbm5mN1BBU1JOMnFiRGJxNFdqSHo2ZGp1emxtd1N6YXNoY2daVUxC?=
 =?utf-8?B?ZDlEUURqY1BGcVhMVTRnSzNERUcxTTZIeCtlWS9mZEVxczBJbm56Z1FoMEt1?=
 =?utf-8?B?YytnSXg3OUlLSlVzUW5MWTVKUDhMYzFETVcwTHlCYjBnTm5SeEZsNTZMTXZF?=
 =?utf-8?B?czRCaGRCdzVKYlVhRTRMdm94OVNsakh3eFpMN0xNdDB6U3g1N2JVQTkycGIr?=
 =?utf-8?B?bXdHQmxTWlF5WUpHSENtV1BQTlM2SzE5b2Z0UHVxYlM1ZEdESHFhNlZJaUVN?=
 =?utf-8?B?YzNVRzk0RkF0TkdLMjdZdDFRNUprQXVIRFpFQmdvYTlMS3p6bmFKWURSUEVQ?=
 =?utf-8?B?cllzelFxUCtrb1R5YUhOUDVwd3lPWXpvYXhGZ0t5MlZkZVVzVEtNeUIvTVY3?=
 =?utf-8?B?aHNDVW1YZ0Y0dTQ5Q2lPMEFWaGdkakdwUjdyZHBia0E0dWp5MUdlOGc2c05k?=
 =?utf-8?B?bXpmRC82MWE3QW10Vm5YMEhGUXkySklzTGo0dkpsNlhZcEdrdFBucjRaMWRJ?=
 =?utf-8?B?SzdJeHdxNHpad3hNQWpFVFhmSnoyTHdSczVnNHFOUk04clBOaDlua1F2YmFW?=
 =?utf-8?B?Y1MyUmgrWnRIZXdDSEE0OUw2dXVnRVFSa2NLcSt6RElIaURodm1jNU9oR0cw?=
 =?utf-8?B?SmlNbXF5N3kzeTdQdTNtMitUY3lsUENONEU3QlJtY0h1NWttUjNMeFNOUlZy?=
 =?utf-8?B?OTNENlJlKzBWKzZDUTdJeS9VNFhaRFpHclZPYWpqUGMwdWljcWE5QldqSm0x?=
 =?utf-8?B?d3RSVUY1SVVQaGYwclgycitLczk4eGloNEVHeEtDTy9Vekw2TWN5L1hNM1gz?=
 =?utf-8?B?Sm15Qk9LK1lYZTJ2MlhQbVBKZ3czMGhvWEVQQmJjVWFmdEtOR0pLcExTNCtD?=
 =?utf-8?Q?+1++jPuS8Abs0rOI=3D?=
X-Exchange-RoutingPolicyChecked: I4GhOu+/8lulpBUUlqHeP+ZHG+lpgZlVgIpeYDp/cAZnTlMkF6zxEK4P4FDpePwIv2F7CVnZIs/Y3fw4yKuN128/Z6HaqgBtV5HzSOsEbLiQvddI4i7E3/3cYrKzi4/f/7iuHmCrf6Vhjnbrpsj8mFEcBaw1QgeCrW9m6Ai5DsIzD2c+02AO7EAdBVV1gPRX8EIYZLTIaLTaOj5AMsdD0zgxsjCinIeAdHhiwnDw39wXWRKZPBcKnJXnOlvQ0kERNhj8Utzy+yko3icM943YfUzDT+ditbbyJdbAwgmPWBCVKq8ri4R0vWrpRiUVznHXhsVvRIUg1aF738cNWhgLeA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f69fccb-d555-4932-7fb8-08debff542af
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 15:48:44.7299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: teizjM+BSGGYS1UoHzDeMbEL/9pusuZfuMeU8R1I+owq4zuBYX4/j4Mj2b2HjPj5Txcj/RACxgEtWtLJJ6usJV1h52Xmx7di7rdgS5xXKZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6981
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



On 5/30/2026 12:40 AM, Raag Jadav wrote:
> On Fri, May 29, 2026 at 11:20:06AM -0700, Daniele Ceraolo Spurio wrote:
>> On 5/29/2026 2:44 AM, Raag Jadav wrote:
>>> On Wed, May 27, 2026 at 04:27:56PM -0700, Daniele Ceraolo Spurio wrote:
>>>> On 5/16/2026 2:31 AM, Raag Jadav wrote:
>>>>> In preparation of usecases which require re-initializing migrate context
>>>>> after PCIe FLR, introduce xe_migrate_reinit() helper. Migrate exec queue
>>>>> and pt_bo already exist in migrate structure but since their contents live
>>>>> on VRAM, they are lost on PCIe FLR and need re-initialization.
>>>>>
>>>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>>>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>>>>> Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
>>>>> ---
>>>>> v2: Re-initialize migrate context (Matthew Brost)
>>>>> ---
>>>>>     drivers/gpu/drm/xe/xe_gt.c      | 10 ++++++++++
>>>>>     drivers/gpu/drm/xe/xe_migrate.c | 12 ++++++++++++
>>>>>     drivers/gpu/drm/xe/xe_migrate.h |  1 +
>>>>>     3 files changed, 23 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>>>> index acc28389b0d8..a60e04c4d885 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>>>> @@ -928,6 +928,16 @@ void xe_gt_flr_prepare(struct xe_gt *gt)
>>>>>      */
>>>>>     int xe_gt_reinit(struct xe_gt *gt)
>>>>>     {
>>>>> +	int err;
>>>>> +
>>>>> +	if (xe_gt_is_main_type(gt)) {
>>>>> +		struct xe_tile *tile = gt_to_tile(gt);
>>>>> +
>>>>> +		err = xe_migrate_reinit(tile->migrate);
>>>>> +		if (err)
>>>>> +			return err;
>>>>> +	}
>>>>> +
>>>>>     	return xe_uc_reinit(&gt->uc);
>>>>>     }
>>>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>>>>> index 9428dd5e7760..9e1754028e1f 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>>>>> @@ -454,6 +454,18 @@ static int xe_migrate_lock_prepare_vm(struct xe_tile *tile, struct xe_migrate *m
>>>>>     	return err;
>>>>>     }
>>>>> +/**
>>>>> + * xe_migrate_reinit() - Re-initialize a migrate context
>>>>> + * @m: The migration context
>>>>> + *
>>>>> + * Returns: 0 on success, negative error code otherwise.
>>>>> + */
>>>>> +int xe_migrate_reinit(struct xe_migrate *m)
>>>>> +{
>>>>> +	xe_migrate_prepare_vm(m->tile, m, m->q->vm, NULL);
>>>>> +	return xe_exec_queue_reinit(m->q);
>>>> I'm not sold on calling xe_exec_queue_reinit from here. Wouldn't it be
>>>> easier to just destroy and re-create the migration queue, instead of adding
>>>> support for a new re-init flow that's only used during FLR?
>>> This flow is to be reused for multiple usecases where we need device
>>> level reinit.
>>>
>>> I remember trying destroy/re-create at some point but I saw TLB
>>> invalidation errors. I didn't know how to investigate those and gave
>>> up on that direction.
>>>
>>> IMO it's more performative to just restore existing stuff without
>>> dealing with memory (which'd also make it a bit prone to failures)
>>> in this path.
>> Makes sense.
>>
>>>> IMO the re-init would be more valuable if we went with a gt-level function
>>>> where we loop through all queues and re-init all the kernel-owned ones. That
>>>> way if we add another queue that needs to be re-initialized it will
>>>> automatically be picked up by the loop, instead of having to hook up a new
>>>> callback in the FLR flow.
>>> I went through some of the data structures and found that the queues
>>> are maintained by individual components that use them. One way I
>>> could think of would be to have a centralized list of queues (like
>>> we have for kernel bos) that we can restore without worrying about
>>> which component owns it, but it looks like something that needs to be
>>> done as a prerequisite and perhaps requires significant refactoring.
>>>
>>> Thoughts?
>> The risk here is that a new queue is added for a new component and the
>> developer doesn't know they need to go and reinit it after the FLR. This
>> might also be difficult to catch in testing, unless we go and re-run the
>> full CI after an FLR to make sure everything still works (which is straight
>> up not possible with tests that re-load the driver).
>>
>> Maintaining a list of kernel queues shouldn't be too bad (there are very few
>> of them), but I understand it increases the scope of this series.
>>
>> We have a list of queues that have an assigned guc_id in
>> guc->submission_state.exec_queue_lookup, which you can navigate with
>> xa_for_each(), so a potential solution here could be to have a
>> "guc_submit_reinit" function to go and re-init all kernel queues in that
>> list. I don't really like this option because it moves the logic from the
>> generic exec_queue layer down into the guc submission back-end, but it could
>> be a stop-gap to get something working and we could then go and move the
>> loop to the generic layer as a follow-up.
>>
>> To summarize, without creating a new list, I think we have 2 non-optimal
>> options
>> 1 - have each component handle their re-init (not future-proof)
>> 2 - handle this in a guc-specific function (layering violation)
>>
>> I honestly can't decide which option I (dis)like more, so I'm not going to
>> block this one way or the other and leave the call to the scheduler experts.
> Or we can move forward with option 1 for now since we only have migrate
> queue to work with? We can refactor this as a follow up when we come up
> with an optimal solution with more components to reinit.

As I mentioned, I'm not going to block if there is agreement on option 
1, but I'm also not going to give my r-b because I don't like it.

Daniele

>
> Raag
>
>>>>> +}
>>>>> +
>>>>>     /**
>>>>>      * xe_migrate_init() - Initialize a migrate context
>>>>>      * @m: The migration context
>>>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
>>>>> index 965c45889c72..49d8c717b957 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_migrate.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_migrate.h
>>>>> @@ -112,6 +112,7 @@ struct xe_migrate_pt_update {
>>>>>     struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile);
>>>>>     int xe_migrate_init(struct xe_migrate *m);
>>>>> +int xe_migrate_reinit(struct xe_migrate *m);
>>>>>     struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
>>>>>     				     unsigned long npages,

