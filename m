Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9FCC3065A
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jun 2024 23:23:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B8810E16A;
	Mon, 24 Jun 2024 23:23:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eCRvjtuG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B11C10E16A
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jun 2024 23:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719271406; x=1750807406;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JKgVDpp+KYZxQ2prYTOMKAJbuI8jUqv62ObyPw2Rt9Q=;
 b=eCRvjtuG19BVZ3DhShLWMqK/bUILGRAVOtrIfmu9U7YEFI+3HEDb9nHc
 rBZzL1DN3lge0bUaVHwTXhi+7p6lgLqj8HEVK+HLHmOh5A25z/NV+ZI49
 mN4YTThgBFO7qMGZHVc+/loT2kXtQQVatwLbXaMwvzYFrLY+rMauWeQcV
 lmw8WCzSN1HUfDJNZcS2vySVMMTKMI0MPdZk2adYoqGvUKN9OlHGRBc7+
 bUBnVB9JdUY9CQdiOz//QZArABzIPTwASRuyAofDfCtfg4tshr3W0E0+i
 RGWGLR7LuGyFxbiu+De7KMQt5yPhlbyQijiREfyjGtBac6s8S692Dad+y Q==;
X-CSE-ConnectionGUID: upCrVPD9Rq2lNCzgHdqQcw==
X-CSE-MsgGUID: arY64JSZRc6AnvkymUkQgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16021954"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="16021954"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 16:23:25 -0700
X-CSE-ConnectionGUID: Zw0v9/JMQsS7XGMDVXVbng==
X-CSE-MsgGUID: iXuRWswhSQ2wZ5P0LXkW9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="80990399"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jun 2024 16:23:25 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 16:23:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 16:23:24 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 24 Jun 2024 16:23:24 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 24 Jun 2024 16:23:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dg/T54ldI7EDn+wVj3gcHleAiwI972G0GjPOSkphkDO4jRKOAljEHR1uOs2ddg3IbkdVk+4vtFyn/PZNgSEEoykkhgTH1Tx50sncCAEJHGtU928SG6aSs3RL8TmGPbeR7Fms0sRa9MIpWv0K4F+uUHP4loVy5G2OoTgt6akFeTkoVELqjGz/YqqDmdRuoxQR8/kTkY4ArH4ya/riCihrrTIcpGcaXt5ImDegCjwSFM6TcrAqQ+cX4aFXdpZV3/G5fN1Cr9E5YI4vF57giVSYZRRqaug56Yvjjgw1BCT5S7U3d36eKAALBY33ZQE2D2wKyCgmhmZP92F0gcakmBljqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhlrqBo1pH6uifkHp4hp+yZEeifnuIPn/N/SOIOFQU4=;
 b=VpYjgfm0oWdEbRmvDBa8/dgOtDBhFnLP2ZYJY/znYr3Gm+4TIXbS+eCMhMJm9HSFo/LJqMgoC1LsvrnFu7mzhlPWollAcLdDNX5j1m9TalGqF5+bpc1OLW+FmDqHNMorDN1uDMzcx0rNOWwIGYKxYNYtYRdQ66Wuhiy0R3Muz3OIj1FwrtZTtmpboPS64eM2bKYaOfkr/DHPA+7Ev/YqcUyhyG0rA0ONsGPwQmadbpbtg1pgm4dZmR6lnfOhY6Sj3vEJ8xZw2bovyMG/yY/divuaNFvEmOKGYgo+HjonOzEw65JD6bY4srnLXFTLMIXjFgmlyGvPlkMqsAdpyIc78A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7401.namprd11.prod.outlook.com (2603:10b6:208:433::18)
 by CH3PR11MB8362.namprd11.prod.outlook.com (2603:10b6:610:175::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.26; Mon, 24 Jun
 2024 23:23:21 +0000
Received: from IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::beca:81e2:677:2958]) by IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::beca:81e2:677:2958%4]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 23:23:21 +0000
Date: Mon, 24 Jun 2024 16:23:12 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
CC: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, Riana Tauro
 <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <krishnaiah.bommu@intel.com>, <tvrtko.ursulin@igalia.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v9 0/2] drm/xe/pmu: Enable PMU interface
Message-ID: <Znn/4BP1pi/pipX7@orsosgc001>
References: <20240613100411.1579218-1-riana.tauro@intel.com>
 <878qz8u1on.wl-ashutosh.dixit@intel.com>
 <af6df0d8-bafa-4fd5-a747-ff9e3092c3c6@intel.com>
 <875xubtu61.wl-ashutosh.dixit@intel.com>
 <ZnR/uGMcxOETqhsm@orsosgc001>
 <25d256e1-ce8f-41f4-b010-ca28b5eef557@linux.intel.com>
 <ZnXHNCQcKimE06ar@orsosgc001>
 <0b01375a-cd13-454f-bac8-f42d5e19cb22@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0b01375a-cd13-454f-bac8-f42d5e19cb22@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0151.namprd03.prod.outlook.com
 (2603:10b6:a03:338::6) To CY8PR11MB7396.namprd11.prod.outlook.com
 (2603:10b6:930:87::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7401:EE_|CH3PR11MB8362:EE_
X-MS-Office365-Filtering-Correlation-Id: a3beddcf-f6a2-4f00-e880-08dc94a4a275
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|1800799021|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2lMNXVQWXVURDFYR1hCcXQ5VjNtUjlWbXd4cVkrTUc0NGZQZ0hTOEIwVDYr?=
 =?utf-8?B?M2ZLY3ZGYUZWaFhMaWM3bW1KREgwL2JjQ21Ldnp3Nll4T2s3MXh1b1MrZGJW?=
 =?utf-8?B?OW1rZ0ZpeXRXYkt1ZHE2dU5Xd0xMOXgxNHIyT25vV2pLRm9UWEhqaC9Gd2lM?=
 =?utf-8?B?L0J6WUVIR0xiZFVKOHB2NWg1LzQ1dzJWQk16ekQveGV0TlphamhvMVFlUi82?=
 =?utf-8?B?K1RPUzZBU1FkQi9MV2xxNUtESEZRM2U4SGJtNFZqMVl2NFdQYmVldXRLNGN1?=
 =?utf-8?B?V080ZzNCYTc3aGtEbUNLK1FZZGxEMndVUkcyeXI1ZmJsbnVJYTBvdDJSTmJ2?=
 =?utf-8?B?MTg0S3dmY21VbVhzbkh1bndzV2VSUkpIQ09SU29ZekUyNlMvaFBaZUg5RFFR?=
 =?utf-8?B?dGNTRXJvc1VLZWtKandwNzE1RkcwMGg2bi9MZkxZK3ZkanQ5ZW1CZWFnNkdw?=
 =?utf-8?B?R21ONW1QZlpJWStISVVVanBBRkdtQy93TU5HdXh1Qnhhb1BTKzlZb1picnVH?=
 =?utf-8?B?TmFLWExQU0VnUktPcFZZdEY2SG85SE9nSzA0V3BQUnliL1d1ZTRqckpaSTZp?=
 =?utf-8?B?ek85NFBUZ2I2bHRycU1pdkhlT2EwTWN3TnBEdmdJSTI4VDJyaDBFMGxpZzI1?=
 =?utf-8?B?Zm4wbjRteFBva2xEY3RNMno0ZkJ6cUlxd0pRL2hQVWYyd1VLSy9PU1NsQU9q?=
 =?utf-8?B?UFA0QVBKWWpVTjVMU1pXWThJejFLenN2UWhiZFBnNXM0bEtLV0wyQkgvUGNY?=
 =?utf-8?B?UXg0dU9FMkhDN2JSbm5ORkd5b001NndkS2RmMTd0Ylg4UmJSbE8wZzRMZG5N?=
 =?utf-8?B?KzR0VG9uQ2VHQzVqNDZhbmZOZzJyVUFaQi9tZWJjUnRsZkxpZ1lORmFuZWp6?=
 =?utf-8?B?dGVJNHZFcXdRSG4vMzZrcSs4djJ5NFZzd1J6RDg1MmxnV0ZzVWt1U1M2RW1Z?=
 =?utf-8?B?NXJCK2ZhN1ZsdWhsQ2NIeGJ2ajNDcVFBSTNEWE1wQys5ekVJdWJkazNTTkxh?=
 =?utf-8?B?elZIc1RMMzFWRDBscjBFbS9WZ1FQU0I4TmdhMnJtYitOaUl0QWRwMFgvOEdT?=
 =?utf-8?B?Z3d1dFdCQUFYdE5lRUJQWnozWExiS0pJMW91VDF1UE9hRXZha2xqRm1TSzZV?=
 =?utf-8?B?dGY3VUV0YkRxRW5TdWgzRERUYmlkSElpR1Q3UHlKbFVUa2VoS090QjBWRTJv?=
 =?utf-8?B?V2QrM0lBQzVGdVVMdVhtYVI3Mkk0QTBIeEF5RElYWEF1bmtWS1BnMW55NHFa?=
 =?utf-8?B?bTlOR0dtbW8yTzR6V0k0dnYrTFZnTnpzSXRTVGltTDlIZW83MHcyUXJYbit4?=
 =?utf-8?B?KzJpOE0rSUNGYU9GdmdOMFRUWjMrUjJnOGg5cXJtVlIyZ0E4U0hLaTNMY0Rz?=
 =?utf-8?B?VUJrc3l0SG83VURmTW03Q0lRTHNBTWFCQy9ua2JFTm51eStYTEsrL1FQWitV?=
 =?utf-8?B?eG50Sks5YXcwUGdENVlPRm1Od3dUaW1wR2FUYndPckplZ3R0NlRZOUdaMm9G?=
 =?utf-8?B?VVo2VDdyV29ia2JUb0psWlh0cmpjaldNVGdlT0k3VU9jOXAydlFjU3pOakhY?=
 =?utf-8?B?UUIxZnVDeXpXTi9aOHJleXVMSWJHQzFOejZ5QXcxZC9ZdndkajBGM2g3TDZI?=
 =?utf-8?B?YlJQR05lM05zQ2NpY2pwTUozUzZpdVE4U1c4WGNjcXA5SEVOeEhnMWxxd203?=
 =?utf-8?Q?3P4TmC4S/8BRoKi8Z77r?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7401.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(1800799021)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkJjdDUvajk5NkdPaEp1Z2NMdGlWVnZCNmE3MnppbGN0c1VYdFBBeVdoajFw?=
 =?utf-8?B?WTBmVWFJVEtBUGl4SDU5cnd3bFRxYVlrcHNvQjNHSkJ3TXpCbDNhWEtwVkxs?=
 =?utf-8?B?TFFMbmpRNjl4WXZwY2c0UGwrbCs3b0Q0UVdOOHpZVzlTQjJzNkh3bFZ3OFFr?=
 =?utf-8?B?MlEzU2N1YVJDclR4bU9lSklmc3lIblFPcUJ3YytudHdhbkNES3FRWVBvSkpw?=
 =?utf-8?B?SkNtNmZYc3BxTzBTclVBWnI2YWNtK2YrT0pUOUUyUlRQRzFvOEd3Y0UyU0VN?=
 =?utf-8?B?YWgwYjdtU1JTWkZlZk9RcWk2dHVNTlMwNWorenUzQTRlK1lOWWtLdVRqaHU3?=
 =?utf-8?B?K2lwblhDck0vcW11alhQOWUwZUFLbG5FNDdZMitFZG5mbHRGYUdReGtvS3ZN?=
 =?utf-8?B?bHU4SnJEUkE0VjRKdHhsbFgrUHVMQTFPQ1ZmdnUwajRmZ0tRSWE2RnNwb3cw?=
 =?utf-8?B?TlVQd2xHcDdEYk8wSnVZWDB4LytIdDhiekFmZVlpZWlaU01oMnl2V3luWkxh?=
 =?utf-8?B?WXRUOFhpR211cU9Zd1hwcWk0aDBNenJQOVNaZzBGOFVTdlNDcFYvdmsybDRG?=
 =?utf-8?B?YXdlSDhZSEZDdW5DTnVRY2htOHUxamJzQXk5Mjc1RWQ0Z0I4ZTRyRXBLblZK?=
 =?utf-8?B?ekxDRDBJL1k0QUNPYld0QzV0Q0Jod1NpZzdiMUJ6L1lBTGtFQ1ZHVkttVEN4?=
 =?utf-8?B?YVpCdTRCTnZ2a1h0QVdZczBUT0tCcmxVeEI5dFhHVU1SL0FNV2V2ZnNPeVJP?=
 =?utf-8?B?RUwyWVpGejJOSjVxTUV3ZjZhTXBDdkRBOUZOQkhKQXgvdHIwVkRJd2krRkcz?=
 =?utf-8?B?SGUrblkvbDBHVEsvNlppY3dUZEx5MEZNbDRWMFRUODVBdSt0Y3JOdzJyd0s3?=
 =?utf-8?B?M0J2K3greWFSYmdCSXJHNjJjT1lCMmdkYmFtM0VNdzV6SitPRnpvLzRBWjlL?=
 =?utf-8?B?K2V1c2ZDaytxZkxaYUZvWjk5U3JPZlZsU0VHNlNCUEI2OGttTFBDeEpuQnRs?=
 =?utf-8?B?SU1ac1J4aDFYWm82M0VuRUFyeU9UK0FpQk1ad1VTS3NHNVlzdzRrOERRTXN5?=
 =?utf-8?B?Z3N6aTg4YW11OEFJcDhPSUwwaVc2Yit4enN1ZEtINW9hbm1zbEZXbUs0VGky?=
 =?utf-8?B?NTE5ZXlQZDdiSTMvd2MyVytVeXJLSlNvcjI4K1g5c1lXQ011YndpUldUbzFu?=
 =?utf-8?B?ZFoxYjUwc3cvNXJFeTJsVE9hL0xFQTdtMGxMczJHRWw2RXRpbDA3dk41WTVG?=
 =?utf-8?B?ai95YUloMTgreVcwWkg5NFExKzJzVFB2OFZDQk5KUklBd3dRR2xJeHlwUTZM?=
 =?utf-8?B?cTNBd2xmaStWNjhzcXkzU1NrTkFMK0dURVg1R1ZlRHhvT3F5ZktZSFBUcDhP?=
 =?utf-8?B?STZpSitvSzlPWEtLR1pDQVg0WXgzRlFNTlkxZHlsdVNIZGVWMi9aVGMvdjBi?=
 =?utf-8?B?OHR5UUJqOGxxVkdhN0FyenVXWmJvYkhXUGh2RXUxbzRlVHZHWFJkb093cHVy?=
 =?utf-8?B?WlJXbFN3TW1rUDg3azhoTDlHL1FiMWxvZWpGQUN4TXM3NjA2VFZOZm15bkZ3?=
 =?utf-8?B?MmRNb2pKYklLOGlmanhMNDlHTzJPNnQxRG4rVnNQcS81NDRrNUlwUy8vWUNz?=
 =?utf-8?B?QThJMVN4QTU2dWY3K2x1UXRoWkZ0ZEpxWENzTVJqQmRUL2hXN0hTRDNNWGRU?=
 =?utf-8?B?b0pXSzUxRlZoZTNsUEdzdWxBY3hhZFFOOWtTYjhHT1ViWDdXU01ORUxzbXNy?=
 =?utf-8?B?c3JhU0g0U1FBS3kvN29rVW9LWUQ1SWNtcWF3d3FNeTV0em9KQjByMmo5UUp4?=
 =?utf-8?B?WFdIdDBzMk9Na0l6STJmNC9tcW85Yi9RajlqOUNrTDdTcmRrOE44MkR4YWVv?=
 =?utf-8?B?SklLMjJyYmVmQlQ5anZmZzFtRkV6WUdYR1NqSlZlTUtEZFdDa3JCTlhwdGkx?=
 =?utf-8?B?bk92N1M3eTgxdjJGRm1vRGxuRE4vSVlPSDlnUWtyZ1hCRW04Sk5Yay9nYnpm?=
 =?utf-8?B?dVdiWGVXcDB2N3R5SklTYTczVzlvTWVLek1PSXVlbjB3ZDVtZWpqVVdOR1Vy?=
 =?utf-8?B?M3RIS2NyZHAzenVEdFNIUU8xYVozWHgzTENZV3JwMzN2Y3JybDFiQ3JacmZY?=
 =?utf-8?B?alNCaFRYTm41QXNBSUgrTk1WNkFzbktHSzFEUXh6cW9TNWFGZlpQVWt2blg1?=
 =?utf-8?Q?9ezrAP4DBfqMjtV0SpbIR9A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3beddcf-f6a2-4f00-e880-08dc94a4a275
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7396.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 23:23:21.5262 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zXcvyJORd418C8sNLy2+XqE2s71kYEXC47VEy9BiJ0cfeYj6Uive+3jf3tBEjfDah0bT7xgPW8QEpA6Yvz9n3FR3npN8mOuwIIeu1gomN3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8362
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

On Mon, Jun 24, 2024 at 03:57:18PM +0530, Aravind Iddamsetty wrote:
>
>On 22/06/24 00:02, Umesh Nerlige Ramappa wrote:
>> On Fri, Jun 21, 2024 at 09:59:11AM +0530, Aravind Iddamsetty wrote:
>>>
>>> On 21/06/24 00:45, Umesh Nerlige Ramappa wrote:
>>>> On Fri, Jun 14, 2024 at 08:34:30AM -0700, Dixit, Ashutosh wrote:
>>>>> On Thu, 13 Jun 2024 22:50:39 -0700, Riana Tauro wrote:
>>>>>>
>>>>>> Hi Ashutosh
>>>>>>
>>>>>> On 6/14/2024 12:09 AM, Dixit, Ashutosh wrote:
>>>>>> > On Thu, 13 Jun 2024 03:04:09 -0700, Riana Tauro wrote:
>>>>>> >>
>>>>>> >
>>>>>> > Hi Riana,
>>>>>> >
>>>>>> >> There are a set of engine group busyness counters provided by HW which are
>>>>>> >> perfect fit to be exposed via PMU perf events.
>>>>>> >>
>>>>>> >> BSPEC: 46559, 46560, 46722, 46729, 52071, 71028
>>>>>> >>
>>>>>> >> events can be listed using:
>>>>>> >> perf list
>>>>>> >>    xe_0000_03_00.0/any-engine-group-busy-gt0/         [Kernel PMU event]
>>>>>> >>    xe_0000_03_00.0/copy-group-busy-gt0/               [Kernel PMU event]
>>>>>> >>    xe_0000_03_00.0/media-group-busy-gt0/              [Kernel PMU event]
>>>>>> >>    xe_0000_03_00.0/render-group-busy-gt0/             [Kernel PMU event]
>>>>>> >
>>>>>> > PMU patches merged previously were dropped in 90a8b23f9b85 ("drm/xe/pmu:
>>>>>> > Remove PMU from Xe till uapi is finalized") because PMU uapi was expected
>>>>>> > to change. Why are we re-posting these old patches again now, without
>>>>>> > including the planned uapi changes?
>>>>>>
>>>>>> The uapi changes were dropped and there are no other upcoming changes for
>>>>>> Group busyness. So re-posted the old series.
>>>>>
>>>>> What happened to VF busyness (which is why I thought the uapi was going to
>>>>> change)?
>>>>
>>>> There are no plans to support group busyness from a VF, so we are just exporting group busyness to maintain parity with i915 for Native/PF behavior. The only change would be to expose the counters in ticks rather than ns. I still have to look at this series to see if that's happening.
>>>
>>> how will the counter ticks be used to get the busyness in time
>>
>> There will be no concept of "busyness in time units". User would just take 2 samples and calculate busyness as a percentage. The counters will be unitless. More info on equation here:
>> https://spec.oneapi.io/level-zero/1.9.3/sysman/api.html#_CPPv418zes_engine_stats_t
>>
>> Percent utilization is calculated by taking two snapshots (s1, s2) and using the equation:
>>
>> util = (s2.activeTime - s1.activeTime) / (s2.timestamp - s1.timestamp)
>>
>> Note that zesEngineGetActivity is used to get single as well as group engine busyness from the KMD.
>>
>> For single engine busyness, KMD will get the information from GuC and that would be a pair of counters - ActiveTicks and TotalActiveTicks corresponding to activeTime and timestamp in the above equation.
>>
>> For group engine busyness, we should follow the same semantics.
>
>does that mean that the counter itself doesn't have any relevance i mean it doesn't present any outcome to the user and rather one should use some formula to get a usable metric.

Correct.

>
>so from PMU interface point of view can we expose such a interface,

It's still a counter that ticks in one direction, so I believe we should 
be okay using the PMU interface.

> my question because most of the interfaces I found in PMU are directly usable by user.

That's implementation specific. I don't see PMU imposing that 
requirement on us. I agree that it would be intuitive to use the 
counters directly, but this interface is required to work with SRIOV.  
For example, in a VF, the user cannot use the single counter directly to 
determine how busy an engine was. The user also needs to know what 
fraction of wall time the VF ran for. That would help calculate per 
VF/VM based engine utilization/percentage.

Regards,
Umesh

>
>Thanks,
>Aravind.
>>
>> Regards,
>> Umesh
>>
>>>
>>> Regards,
>>> Aravind.
>>>>
>>>> Regards,
>>>> Umesh
>>>>>
>>>>>>
>>>>>> Thanks,
>>>>>> Riana
>>>>>> >
>>>>>> > Thanks.
>>>>>> > --
>>>>>> > Ashutosh
