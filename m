Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F523D6CFA2
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 21:49:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C6610EAE4;
	Thu, 22 Jan 2026 21:49:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eYouSoyV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CACC310EAE4
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 21:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769118575; x=1800654575;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=WnINyydzEmGcnuSuY5M+5tRl4QqPdtMPgDjZmJwOuVA=;
 b=eYouSoyVgYpgoI/3e9UZXLyn4lVfsW++dhRTmwGnnf/krvxE21WJhgat
 Jymhjwdxd/T2sL4shjtMmCbDpiMPsaC5cCFisFiQeeAOKCrj28p/9DDn0
 Y0Wmcbgy8E3gtPopVQFX6NxzQM0//BpOI3xJNM4YZDZK2y9PVZ3Ym9BaN
 Gi1INQu1SfHuH6VNNeGw81Yoi8ANxBYNeshforp5zwqv6fxICjK2sy0xc
 Swvb4yCY0dlFOk+BsfbWA8hRrSQJ2/ysJZug/1wl4uhdCj2edIKuueKbR
 ffh+5pVo0IeyIi/Q/jmHNR+w/GRa3IzG43jAgVrOeZJJnzzh4rpPDQWfQ g==;
X-CSE-ConnectionGUID: eI3TgnL6RKughlYg+0YmuA==
X-CSE-MsgGUID: JM7WIaOZTuiD8K+6trNsng==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="87786555"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="87786555"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 13:49:34 -0800
X-CSE-ConnectionGUID: lleZLeW/Txars1YF9nqy3Q==
X-CSE-MsgGUID: YL/Ug6ZAR1CiyfEOLMV2aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="206112174"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 13:49:34 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 13:49:34 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 22 Jan 2026 13:49:34 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.59) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 13:49:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ooEYfzVw/uy4cubqcuDRxm3tJ6gaTdimhI/8ud+e7da3Ph3+/kp5aj2F3KMwtKjXtkCoSj1yBYPEI1IWkrJ7u0InnMhHLbyug2n+qtuJh+q6+oqpvSQPfVVISJ9Ajyr0qgElaSQpTKc4F4R+8HJlP68mozRkRffLBCWf4nS4jWymKrDEhm59k8xUul+uk00t+Fyrz7xHaxO5kAqtaZ2LruhSVaX8N0SVkoZ1hXj4GDCmVJ+N0vCBpNtyfsc5e6QmDbBgLnARPvC/LiEft2gPBx7dZM+mJRrelStRFoKcekkT/OcalWeQlqcrgxA0ngi4z/0SX250Si7pJ5FihxgmEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9tMUdPazwQTY0/mccSbWxsU7Gy4OaKZoAzzcYQpLTJw=;
 b=g4/UfRQSQ9JdLYs3LVI0dnLn8uBSd8GwgmrVq7KvOt4ONHkHgib9fUT8m8qVuabYWgeLVUm7xGHAyOR69LTeiUlDPSqH+TVYTW0XQ7AeAlq4YxVroamMfuDMHu28370ezMLrBndI1Szk0zE6TdYX08A0bx2jvGvyB4G7p9MN73jQpwcKJQZNQl0j2YxddUNOw8/uFie429f8FMyL28jzYsACKQO976TpZnWhhX/NkGSD9NewQ86vBLQ38HXi4CqIGg+wi+YqXYwLNRNW8EvIZr/EKK9003dJoWEvwuqh+m7I2YwM0xL0vZfzCC6PcVzHIAQ4QRvKHCEUgOPZc4L5qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH7PR11MB6546.namprd11.prod.outlook.com (2603:10b6:510:212::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 21:49:31 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 21:49:31 +0000
Message-ID: <b87e317e-5383-449f-826b-2b5ffdae860f@intel.com>
Date: Thu, 22 Jan 2026 22:49:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/vf: Reset VF GuC state on fini
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260122151924.3726-1-michal.wajdeczko@intel.com>
 <1e91b028-af9a-4a20-b5ba-5321b5ae1e9a@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <1e91b028-af9a-4a20-b5ba-5321b5ae1e9a@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VE1PR08CA0010.eurprd08.prod.outlook.com
 (2603:10a6:803:104::23) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH7PR11MB6546:EE_
X-MS-Office365-Filtering-Correlation-Id: a849d950-2eca-40aa-d33a-08de5a001fed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZjNiZGQ1TVpiVUVoRU9rNzNqVWNtQ0hVQVZNWE10WEZmbHZkNWJDNUR2MFZr?=
 =?utf-8?B?cjMvR2NRalErS3BiTEgvSW9PNVJ5aDdkMnliUFRhb1ZXSGV4S0hjY2FuRnA4?=
 =?utf-8?B?aFB6dFFmYUFHa2pJdUN5N0NrdzlpQ1MyYXZwc3haU2FTU0MwL0o2c3BRWXBK?=
 =?utf-8?B?ckVqMTN5R09tS2tvbkVhSmNRZ0dJNG9UREFkVkRFdlN5ekIxNVFENXlmejZO?=
 =?utf-8?B?OGdqcjhyd3pZbXc0V2tzV0d0ck4vNzZ1V3VyelR5L25ZRWs3ZWl3M0FzaWY3?=
 =?utf-8?B?UWZsWmV5Y3ZUUDRhN3I3ajM0eHltQk1odUxhcm00NHdKejBmMzVHclIwZnMy?=
 =?utf-8?B?UHJjN29mWW9hTDlkemk4aHQvaWJFRnNyWUJPamtTaWMvTUs3aTBydWJORS8z?=
 =?utf-8?B?bzNrUnEzQkwyTElwUkVLZHJyQ05WOTNOOUl0QVdGdWsrNXVhTXFIN2F0Mkhy?=
 =?utf-8?B?Sk55WmZ5bmZFczJhRlByOENndTFqYWNoR0xIak5tbmJkWUx4T2xKK2FVVEFJ?=
 =?utf-8?B?dkFVWDQzeUJ0UElXa2p3a25oc1NJZ3RWMTR6L3BuRjhDM054KzhzR09IY3B0?=
 =?utf-8?B?Q0hkZ3dlRFllcnk3WHpHUHJrMUhIWkVCT09QTkp5OVFaKy8zZG5KK2FsLzBy?=
 =?utf-8?B?eWdJMzdIMmthWld2WTNLd2ZGUUZBaEwveU5FNGY2TzBmUHljajdvVTFockhN?=
 =?utf-8?B?VlZXMzJaRjZEYVdSK1UwS0xzZ0xNaU8xQVE5Sks2Qmw4N0JFOXJFVlRISWVO?=
 =?utf-8?B?Ukk2UGdqNWNkTUFSWjFIK2UyVEdSZkZTL1VOb1QwVW9iZ2RTa054OU11YTdn?=
 =?utf-8?B?aUVXWXN2TmFCajZxcnVvS3c4TXlDM0FGby8vVTh1Z1JLNXdJYkIrNXJPTExi?=
 =?utf-8?B?cGpCUk90MGdtcmk5bFlJMGFLMWJUZEFMd2xZbkVKWDZwY3E2MExsVjVyd2lw?=
 =?utf-8?B?cmJDbTl2TGhWa0lvbjBYalZGMmRUMk5CTm9oYXBqN3piTVM0SFdRTkZ1OXU3?=
 =?utf-8?B?NUJuU0NuWTBuL0c0SnpHSWFLVnJhdFM1QzBPRW14M0FrODhCSXdFVFZEZ08y?=
 =?utf-8?B?bkFCbzRjVVdzc0hYOVNPRmZ6TTk0VHNnK0F2RzdvcG5aTDNUWHJVVTNnSkN3?=
 =?utf-8?B?cHlFaGpmTDZ6WjZ3WDFwcm9xVzJUSkg4RUdaOXRPV2xRbVZFeThDTFFlb1pm?=
 =?utf-8?B?MXptdXgwWmo4TUowYU14VHkvS2JoRmI5cHBSY29aVVNrRUVKRndKOVRETGh2?=
 =?utf-8?B?ODVnc2xVd2FSN3BEbXhJYjJlSWJ5WmUycitrVzBlbzk1NXpSMmhSaHNtMWlm?=
 =?utf-8?B?RUVBVkpyVUM0cHN1dk5MYXUwRmpzZHExOFJIOG5oR3FHWTYxQkZITWx2dWVO?=
 =?utf-8?B?N1JWZHh6VkkvWVl4WjlWZXMyMEJxUG9JU0lBSVpIazBmd3owd0t2NVNXVHZJ?=
 =?utf-8?B?MkUyd01SaHkxUm42NHNqSTFnU0drVnFNNFN5bmR4T3ZaaVRLZkpSUWU0VGVr?=
 =?utf-8?B?a0NWeG9GZ2dpUmw2TDBoU0hxNXBkWjZHMDRMVXloWXB5Yk9ZTld3ZUJKMFNx?=
 =?utf-8?B?T2hST3NidXJOeGcreE1CKzdQc2I5enFmSUNGVEp5TERNYmVVcFk4VVlxaHhr?=
 =?utf-8?B?dkY1S3A1R1ErZHZBa0xtams4bzlmSys1dS9WN0RUR0o4UXQ5TmhtQ1FCSjNx?=
 =?utf-8?B?TmNodWd0L1lIOG1CbXRObWEwb3R5Vk0vZEUvS1ZRcHJCUjVlTFJCeDlPZ0JQ?=
 =?utf-8?B?Q01MWFhTcGhQcTZRN3lRRXNjZnB4LzQxeFRya1ZnM3pZSzBieEd6QWlyak9G?=
 =?utf-8?B?MzBrTzUzbzUyUU1Kd3JxVitKc1VFOCs1eWtUc3FBamVPcjk1Q2Y1cnZoaE9Z?=
 =?utf-8?B?VG5YOCt4SHdUWU9odkVzNjNyeXM5NHFuTkxvc3ErdU83SndPSnRpblZwS1Bu?=
 =?utf-8?B?LytEb3lhVTBZckx5eWQxcnVKYngvUVdUQzg2Z29obXc2ekVibStoZWFQZ2xI?=
 =?utf-8?B?c1ZodC9EMlh4MFZYYzBPSGNnbHIxQUhXRVhUcksvZWRlalVNZW1qeUc5ZHk1?=
 =?utf-8?B?Qnh3NWRXckpWOGdpMmdRbElWZnBiM2JGdE1RUU5XUFg2Um5yTWFldDU0djN0?=
 =?utf-8?Q?RJNM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0xXR0pERklJYktBbXVEUEdLZThSNXNsYURFQ3Y5SG93UGhZSk9wdUF2WkZV?=
 =?utf-8?B?TzI4MTNtM0NpWXlFeGpSQTNMMnpVUFJ1cVJHOGpjL3dVTmlzeHJKRlkxVy9P?=
 =?utf-8?B?SWd4RkJMbzJCTGczem9nNDBSTFMrcTR0alhSWW1pQzM0aDluU0tMWkVNVmJH?=
 =?utf-8?B?ZkNGbVVjbHJvU2RUUlFyV3FwcTJjR1h0d0Z3MTNFS1lDOVY3bzlWbTlXekty?=
 =?utf-8?B?dEV1VVFNaEN3ajJhSEdtQUpFcDZzVmo5b0pMTzhDS3VFSmZRVGk5OUpobjlv?=
 =?utf-8?B?SVBwQ0lVTFJhTnAzN2lEZXBUbGZlTW5Ya3Y3YVRjTHlmMDRpYXM5SE9ueG0v?=
 =?utf-8?B?anVISFhPTmFXL053Q0N6eW93WVBsWGNnbTY4bmdFTkh1dTF2cVordmhhNlZC?=
 =?utf-8?B?eFdEYjlpSC96ZTljdSt2Y25LdmFvWHhsZ3dEeGk4WHA2bW1CcXV6QkZDQlNw?=
 =?utf-8?B?dHl3UnBYSW5lTXhjSlRGOCtzb2JrYjdKSHkvWkZ1ZnhqVGQ4UFZwcmoxUUdt?=
 =?utf-8?B?ZE4xaFBXcnczbVc1bGM0WWxXSk1EU2FhSTd5cDNrRDFweDZwSEEwMjlTQU1M?=
 =?utf-8?B?MEtoeWhpMEJ3aDlpUnMrK1p5UXQzZjljemRLeU9VUTBTaXM1d3JTZHhLNVFp?=
 =?utf-8?B?Q3AyanFiUDVYdEtNYkppU2ZTbkZ1SFRFdDNSem1EdHJzOGc3ZVRKa3JOMXdX?=
 =?utf-8?B?QXlHODAvL2l3NzdSRFJRdHhPbEJScUtEbGZYVXJWcUx0MUwzbGQ0UXNUOVcz?=
 =?utf-8?B?eE9Tang4aHNNeHZ5TEp3eDVsbkx6R1ZPZ2NHeGtTV0M5SllQSkxGVFU4RWZn?=
 =?utf-8?B?cnVQQ2dFU05sTjMyV052ZzFZZ214VkFOQ1FobVBEYmxlaG52cUFhTDlRSEhY?=
 =?utf-8?B?VTJQakwzUzJKbjR2aGU2QjNiaVZTOW5CZEpHUFg0ZisySytBSkdHVXRwRzRP?=
 =?utf-8?B?TUp6a1lxcU9IcW1IaFRKckJZbGViVW9Fc2p5MTBBQno1OXQxZGtkaU5qSUhR?=
 =?utf-8?B?VnY5eU1oR005eDQyY1pxYXJqV1U4TWdRTE5oN2loNkFWZVdSVi8wdlc2RnFt?=
 =?utf-8?B?eUdHaDV6YktmSEl2V2lvTzJ3bC84VWNSS296ejdkV0NxRUdNYm5zOU11VU92?=
 =?utf-8?B?YjltWnlDWDE5eFllZEM2SHcwdlNmN3JBSWNIc2hKNUN1enl4MWkvMDU4NUpF?=
 =?utf-8?B?OW5ORW5DV3pvQ0RBaVpPR3ZjUVlxVXIwZXVnR0d6Zlc2cUpMT0RnT2EwTExF?=
 =?utf-8?B?Wnh6NEFQU1Bzd2NGS010eWZlME13V0MzSHZ2dFFBVytqeTh6b1RhWm1JT3k2?=
 =?utf-8?B?eHNnbm50TTczZnZjeWhxUGc1QjFnRDFrWWlvVTZ1U1dEYVZLNGVtMUllcklj?=
 =?utf-8?B?c01JZnlwSzFRRmU4U2E2WkN6V2JrY0dRdmJpcnBnVmNrOGJzempydndINWUv?=
 =?utf-8?B?Y3VxOHc0cW5EOW51QXEwdlkxc1IwbG8ycGdlVklqVjlSQXJMemR1c2c1WU5w?=
 =?utf-8?B?VUhjQXpBcDNmeWJtN2pZYUtRbG1qaTY1QlVtYlplMzZFRDl1TkdFYjdpTmtI?=
 =?utf-8?B?SDVOYUJweTlBdkp4b29UQUNOL2RFajc1SmNybStMYTYreEJQbFdUb1Q3d1M0?=
 =?utf-8?B?K2Erem5leG1ZVHQ4SFZzbGF3MU4wZklWdjdnUjROdXprOGs4MCtVVmtwcFcv?=
 =?utf-8?B?Y1FoazVtWXJIZ0UzbHc2OU1KVWZob3VvNFJuQk8yMHdTRVZoaUJOaHNKbXJF?=
 =?utf-8?B?UWNvTldtVFZlbUpZR3l3NzVjR08rN0VaUGc0bHlFemVVWFBtMHNSOVpXRzNv?=
 =?utf-8?B?Z05WVUlMdGJFK2IxcEY2aXE4b3NrSGwyRkVZMGZZUXF0WDF4azZiY1M1aWVo?=
 =?utf-8?B?UmthWVdkNWZkNlE3dUJjWm1sNCtlejJRcFhubDR0VCtUeVhnMkNna3dVWlZS?=
 =?utf-8?B?UnkvZ0dVNHNQN2FpOWNIdHlOL1VqMDd5Mi9pQ01JVmZoSy9MR2xDcjdJSE1N?=
 =?utf-8?B?TjhBclVUYW5ac3NZU3c3WktUVnRURGY2d3pkU1VjdklxanllbHNyYkhPN3Jl?=
 =?utf-8?B?VTVqVXFPY0N2NHlobko5NXF0K0dnaUFzVTFydjZIU3V4aXBEZ2s3Q0toMDZy?=
 =?utf-8?B?RjBhR1NaT2FURFFwc1VjWHRVV1h4ZHhwSms1SkNHS1hGamtHV2N0SnA0OGll?=
 =?utf-8?B?UldFSVorZjFpNEV2Y041ZmEraEc3dm85QzVjWEtKQjJPeXhPWkx6OGJtZTVX?=
 =?utf-8?B?NE1aWmpqQXlXd05RZkxldTlpYldjZUFGbGlTV1M2c2VuN1BZRDlCanVaWUhN?=
 =?utf-8?B?UVdldXozRjE5czBOVDNXOWR0VWE0Q0t6TnVKTk5TeXo1VThvQVptQjZvbmRB?=
 =?utf-8?Q?H+xHmgJKeb0Q8jP0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a849d950-2eca-40aa-d33a-08de5a001fed
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 21:49:31.6625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: imSyANAFPt+A83rSn99kxub/eSXkSDUPYKdAfATK7a2RyeRgA35CwgoZaxqXyagCw9v0jyQelop1MEqv1Gq1FH9jiIiF2TJt18UZZ2dWV2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6546
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



On 1/22/2026 10:34 PM, Daniele Ceraolo Spurio wrote:
> 
> 
> On 1/22/2026 7:19 AM, Michal Wajdeczko wrote:
>> Unlike native/PF driver, which was explicitly triggering full GuC
>> reset during driver unwind, the VF driver was not notifying GuC that
>> it is about to unwind, and this could lead GuC to access stale data,
>> which in turn could be interpreted as VF's malicious activity.
>>
>> Add managed action to send to GuC VF_RESET message during GT unwind.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 44360437beeb..2efc4678fa73 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -668,6 +668,13 @@ static void guc_fini_hw(void *arg)
>>       guc_g2g_fini(guc);
>>   }
>>   +static void vf_guc_fini_hw(void *arg)
>> +{
>> +    struct xe_guc *guc = arg;
>> +
>> +    xe_gt_sriov_vf_reset(guc_to_gt(guc));
>> +}
>> +
>>   /**
>>    * xe_guc_comm_init_early - early initialization of GuC communication
>>    * @guc: the &xe_guc to initialize
>> @@ -772,6 +779,10 @@ int xe_guc_init(struct xe_guc *guc)
>>           xe->info.has_page_reclaim_hw_assist = false;
>>         if (IS_SRIOV_VF(xe)) {
>> +        ret = devm_add_action_or_reset(xe->drm.dev, vf_guc_fini_hw, guc);
>> +        if (ret)
>> +            goto out;
>> +
> 
> it kind of feels weird to have this before the ct_init, but it doesn't really matter, so:

this is on purpose, as on the unwind this RESET action will be called _after_ any devm action that CT could register in the future
(like CONTROL_CTB=disable, which won't be accepted by the GuC if we send earlier RESET without a NEGOTIATE_ABI call)

> 
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

thanks!

> 
> Daniele
> 
>>           ret = xe_guc_ct_init(&guc->ct);
>>           if (ret)
>>               goto out;
> 

