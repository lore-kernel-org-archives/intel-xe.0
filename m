Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BA9606A33C
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 05:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PBHeSuo6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B162410E20D;
	Tue, 10 Nov 2026 05:48:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE6F10E20D
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 05:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794289734; x=1825825734;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YL/Ily3C09XJUFA2epx/u/z0VxO6fKpSDAmF2fpEovI=;
 b=PBHeSuo6HnqDPj0BjDfPnq9a0MW6BioQjV+BQPcdQN7WM5zqerlzrWJG
 lXx02i/Oliu4iZD8waySGey/h9G4KG56Oktdei7lQg5YCsh1Ht3wQmAIn
 EIMX04grx5bKDF/bT1puvGGzQRfMXulAv+HhZJN5BScqpeQ7/mBGmBJvl
 TxAI+FmIGxHcsCzdW5rnRnsBSITekX2n7QgSDThPKV3uTUCwDvdVzc97p
 Pxv2ooSQ9+QEke0Uq6p1TUqkbyK1s68gGIAZbl685tDQzGO6UNCJYo/8u
 ktB1Oax1TdY3DCv4pAmzlQ4dj4r/9J3XtHxMb+FsGAYHuKx9K27HoX5xX A==;
X-CSE-ConnectionGUID: /7g/PCwiTcqCuyZ80E5NIg==
X-CSE-MsgGUID: FGjZENDKR32WNuu83ry7Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3064652"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3064652"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 21:48:54 -0800
X-CSE-ConnectionGUID: JgNg0H7MTxKnfmdi7o36hg==
X-CSE-MsgGUID: Rg4FBEcxSwGkQYd+KiBlSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8201660"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 21:48:51 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 21:48:50 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 9 Nov 2026 21:48:50 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.56) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 21:48:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IkyXc84upGooKFn44SdONSRK4apt0WMnlW9e6Gae5RMQHZbcwXKIcDGZgzxiP2zAR4C4L7r20F6nG/7cYgIGENauYW4RUKxm7PY3XIH+g7W702WglZApDJ9SP5FkXdToekJECfI/t+RMvpVUriQVCFwj7iqZaqpyVlk7PcRPB3HKZufK283HOjKxjokUqAcrQPNmP5heIZYmCBbJXq/EG98ZzqSMlN9WeLOv30fROldge3CSlueUrEL/LmOYmaE3k6H6reVVdwAdnTjpPMq04XbfqWIAIltCqe9T6Gu6z6fL6qB6+N1sFX8QwyF2SckdMIxRKOt7zPcKlr94V1bjSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rn7Uf4o4Gk/R3olFMyzRSmo9UOtFwKBKnoRmCwOleaM=;
 b=J90R8ZVBpCVdHG9a/QPpxC24/d9KDM1cpRY9xQNA/Xwggg+W4t/bDKyGJlEP4riZeQZ2Jd4itUdBr4ToM38nrYbQB7cktrfD7gzxINPai27OVPR9/dbyDPdYeo48dXbycAQR+CshKztQXKE/+80n7SJUBussQSHK7BDBHmi6AdPa5S4UwZMSwmtzIHDMxjunxY9Bexu8+fwTM55sNnAxjnNPDwgYdnf3DsMtFl6SS89BJHyr+W4hufhwVlbPSUMIhcrT7K3QirwTsxC7TnR5PEKSwLEST1n2I2fDTseOYUo7y8TMZSpk95OIDq2e5f6H79FCI02rHzUzCZmb2ZRA0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by LVXPR11MB9732.namprd11.prod.outlook.com (2603:10b6:408:388::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 05:48:43 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 05:48:43 +0000
Message-ID: <70f11ea1-e96c-47e9-9d73-691d86c4cb86@intel.com>
Date: Tue, 10 Nov 2026 11:18:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] drm/xe/hw_error: Initialize hw_error_work per tile
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <badal.nilawar@intel.com>
References: <20261106071944.2693854-10-riana.tauro@intel.com>
 <20261106071944.2693854-12-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261106071944.2693854-12-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0060.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::7) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|LVXPR11MB9732:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b61c307-a9e9-4fe5-bf27-08df3eee475a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|10067099003|4143699003|11063799006|261026121527099003|261028144727099003|261102123227099003|261026140227099003|261022105027099003|261022075727099003|56012099006|261021121427099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: xgYDvIZPzAK2UG8oiH9czXwBm86/e4+6CHqJRw1wvhNP6A+gpTbZqUTEWMo/Dj5+lzJ7g28KKuv8VmHLadALjtIrTsqQCS+QfTDkHc7qUwUA0vPsgP/GFak6+Fs6Ef4A6flsLzVZmHwkOMZcf+8BciuH21s7JUu24YlP8Wo3lF/xZf+OgU/9MdD2WQ0/MKqtCwpt6HLIY3Mtfujnx5zp6bwW8gkzFHQ1OmAgaamdGSKdpnNH8MJM50mTP/HcghZopxjI4vIPXxUgmcfqFnd9rUz3kGA3VKQqh22bPZJWaahNh7ev/sVgqP2eixgjgpn22rXjwRfze1+GnaZDJ1PdvIadCIV+GsNWj+dCMqo5wMrvClQRxhpLCgTzX3eG+hcsaGlm1PH6HM16YojzFMyvLqyKF3UTEwybqRLVTnMsikCW1Z4GMDfgjfS8gIKY4lYv9OO5Yjlf3sBoXSlgIw9P1EMlAsl95YQttzLsNEFA05EfDhllpYS+KattZn5u/zyWkpkQY1FpSV12iv0fqfXNs7DNYA5D5eIVYIa2ZWunyL3OxQ53jrC5VsTyAPgpZ3qjFb5KP1/zoNzeYsNwYR3YHUF+xFjgCfw8O5dVrUEu6UPuOtenDfPnLpgNDFz0M95CSUpvMlmnQZ9yHHuUxxCFqQYdr/Gde2sdT04Jgb9pEec=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7862.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(10067099003)(4143699003)(11063799006)(261026121527099003)(261028144727099003)(261102123227099003)(261026140227099003)(261022105027099003)(261022075727099003)(56012099006)(261021121427099003)(261021123027099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXB1ZWlqbnBtQUkrSmorSDBhZ2gzbGlSQ0pTcmhOeit6M1h2WXZSSFV4M1FM?=
 =?utf-8?B?eDJDR21zUng2M05EaENBREZwZXNlRkxhbUZkaENWY1hoVVFZUnNEajJlSFp3?=
 =?utf-8?B?YkZodW5TaWsrclExWVREYmZIc0wyVGhhelJ0T1Vja3ZkSzdFaldlMzVQVFdX?=
 =?utf-8?B?Q3ptd0xhbmxxZGRETGpsMDBmcGQzZmdTRmx4TktkZTRtS09TMHpGL1VDWE5S?=
 =?utf-8?B?MGJmQWZpVHhTUDN5SHpzc3VqUE1nbVBuUGdOVlNodzZtbHJFUWZnc1FWMG5r?=
 =?utf-8?B?RHBBL3ZRVDhBWjF3d0VOYlVjdFdMeHZIWG5iQ0ZHRXhtUHBoaXdzSzdqUUg4?=
 =?utf-8?B?WFh5UytzRzVlclhYdmpCaXpjaVlaMXdEL0Q5NmxjT2NzNDVObnlHRGVWTExz?=
 =?utf-8?B?VGtTZlpiSHpTanVydHZOeG5QZWlhQnI3L0ozM2JwOWluRmtGR0RJSlFKS3Ju?=
 =?utf-8?B?T2RYR3BzNG13WDRQdFZsS1EwY1RWUjZnZ3NNMXhra1Zjd1JGeElzMjNnZDBp?=
 =?utf-8?B?bnBSaFRvYTBsOUNKaTk0aWpPNzBjQWZ4ekhpTklnU2RZeTJzKzFueEZiUitV?=
 =?utf-8?B?TFJhNHA2Mi9RZXRiT0M2VDJvQUhUZHB3SFlqdmFsNERGaWorQXlWUUJXdmVz?=
 =?utf-8?B?V2RidXcxN3FveUJtMHJZRmVNeGVUajhvNlZLa3V2eThuZWNFdm1lRXptd2Qv?=
 =?utf-8?B?TFhJay9HK3RkMEZwdzhKLzN2dzlSeit4SDQ3bGJ3ekg4UThON291TWZUZFZq?=
 =?utf-8?B?UjRBdXMvQ2hxSGFnNFVCQnpYcFNIUFJaQk83U0gvNUdKdkR4b0FWUUlwVHZt?=
 =?utf-8?B?WWhHUWFVakE5VUU4YWlCV3ozK3ZybDg4OVVZSXhOeU8vcEx5RGNOVzBPdHFi?=
 =?utf-8?B?eFZGMUtacWEvRXpDc1czYyt3N2d3Ly80V0lCdld2UmJuVkdJNEpiZHA4T0dR?=
 =?utf-8?B?aTlFbFI3dFhQQlNnTE83S1d6N3N3VVRRdHZpcC90TGlkdlVIbGlmaVhMa002?=
 =?utf-8?B?UjYyVUpTNUFabWlPRG50RGNzSWtXck56ZCtXbXU0Zlhvd0dmKzVsT042Q0o0?=
 =?utf-8?B?VnI3OFF6RVR6eSs3RXA0SjlFUVRTQ3V1L3QvcGhXSUs0cGcvQVJvWExpTEI3?=
 =?utf-8?B?Zys1cTNZa3FuNERwRFA3YUtNSkpReHJXY0xBQlRrZzR2QkxTRStrODN6QXBV?=
 =?utf-8?B?K0tFdDJhOFduTDJ0dTQ2V3Ric1g3MkJDUEpvR3VURXo3Si9lUmdOUVV2ZTZG?=
 =?utf-8?B?eW1iT0tzamdyWlNOTW5TcjNyVDltUnd0em9ZUUJvSGpYNk1zLzFiSXptWjZ1?=
 =?utf-8?B?c3Y1QWVXcFFwanFVVnhTcXFLU3JiOFN6ZFF4a2RKZFZjRTZYVThscWpWNWxy?=
 =?utf-8?B?aE14c3BFUndJaWR0Si8zNTBjYXBRL0FEeGpkS3kzVktvRE1Db1BzV0tRS2R0?=
 =?utf-8?B?elV2Z1JTaHpPc0hZT0ZlZ3JRUzZXQy9OWXFkUmRrdDZ2dGNvZVRRVENWQkRT?=
 =?utf-8?B?NmJ2K2dKaFZseUVzMkc2eVd5QjFTMWhScnJQZ2xBbmpIaUdoL2podFNCVWFI?=
 =?utf-8?B?OEdSM0RvTjdhU2Z3aTBRbzZCM1pVekZ4WkNCV1R0V1FDUjhsWGtjM05PdmRl?=
 =?utf-8?B?bGd1aEpzbStxbFBZYmVaRTRDNCtsKzVQZXQwTENadjlSekdWYm53OGRYeDhX?=
 =?utf-8?B?dGpIdjZxblQ5bTBTRmFLdmVjQmtpMS9zZHpSOFNoNC9WWkhFYVZHYkdRQzNl?=
 =?utf-8?B?R1UvelVzc2FvdTFTaHZTaENJZWdRbU90STFjdGNWY29kbjRpbThLR0h1RVo1?=
 =?utf-8?B?MGlteDVwelo0ZHdSYWo2QVppSGk3NFlPMEROSGd4QnhRK3UzdjB1S1FuS1Az?=
 =?utf-8?B?U3BycUQwb1Yrc0ttT3ZMcitHS2Vac1I5SmZORlpQeExENXViMkFPOE84NnNi?=
 =?utf-8?B?K1BsVFNWVlBmTmpnenVsbkhxZXBiR3lNWGFhZ0d1NDB5VDdPTUNjRmwrN29h?=
 =?utf-8?B?NWRHOVk2QS90cm9vVUU2STRBblNIeXNpM0xtUnc5M2ZPeTZuUUM1Q1lFcEg1?=
 =?utf-8?B?MzIwdDVySmR6eFZLem50eWxyTjNDWno3bnplMGx1cDVkeTgwYWpDZlhiUWMr?=
 =?utf-8?B?YnUySDk1R3l5c3NoMXBlZVJrM0VqSjc4S3EyVVNUMldGTHRXREUwd2V6d0lN?=
 =?utf-8?B?WndvNGpqaFVrUXd4SUJwN2VEbTZoZnl6UzllNXJXcElnMjA5cEI1QzVmakNu?=
 =?utf-8?B?N0JOczUyZjF2QVZLMUdZelZlL2U5d3I2aTh2Qlc3Zk10VjRIaFJjM3lhT08x?=
 =?utf-8?B?ODdjdSt5MGdSZEdWSGdrYWtMWkNjcERwRTRqSTBjaUlweWdZTVhnZVRUL1p0?=
 =?utf-8?Q?WflchDDAN5Dv4vQw=3D?=
X-Exchange-RoutingPolicyChecked: GK0FrK8nVx1EGKTQU9lJ8JSBKmaMU7/NDFWblfi3nBz/DqI1JAqVlDSDzlzj46/PNGCvuVbXllc9/e9ubT845CJHLANyFDPbH0LIXz2G10PIFiLdiJBkvJd32nvXZVSGw4cVQfiQ49029VgG5Qo5mAqpNZrxjS1oHb59B9cok4/NtLEQEBw78U/sbOWV/PAzjgf55tgo7NycImJ0pvpN4/84vPAvBRoRhEAbtJDxXdgtEc7ZkVgiTJInWUwWSr8Rv7Ogro5Uitux6WvhzEnHomd7okRnPeVnOf8J8C/L1BXuQsd4/opcagOVfuf6hGmKtehXHx/kPlDtCi9QjNESXQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b61c307-a9e9-4fe5-bf27-08df3eee475a
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 05:48:43.3671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ShC9/3e/QFMHSJXsyxfUxD9bYrcKFnW8yLspywvM3Pkbw2P02uNniWTfoatrugJs/FDqUWxCtrAsrNjG9BkuqV+L6RX8ifmqsDaPo+EiGx8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVXPR11MB9732
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


On 06-11-2026 12:49 pm, Riana Tauro wrote:
> From: Raag Jadav <raag.jadav@intel.com>
>
> Since hw_error_work is now being reused generically, initialize it per tile
> so that we don't hit uninitialized work for non-root tile. While at it,
> disable hw_error_work on fini to prevent UAF during unwind.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2: add dgfx and sriov check (Sashiko)
>
> v3: retain original patch and fix unload issue in later patches
> ---
>   drivers/gpu/drm/xe/xe_hw_error.c | 20 ++++++++++++++++++--
>   1 file changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index a934b649575c..f7031b341ce0 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -537,6 +537,19 @@ static void process_hw_errors(struct xe_device *xe)
>   	}
>   }
>   
> +static void hw_error_fini(void *arg)
> +{
> +	struct xe_device *xe = arg;
> +	struct xe_tile *tile;
> +	u8 id;
> +
> +	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
> +		return;
> +
> +	for_each_tile(tile, xe, id)
> +		disable_work_sync(&tile->hw_error_work);
> +}
> +
>   /**
>    * xe_hw_error_init - Initialize hw errors
>    * @xe: xe device instance
> @@ -546,12 +559,15 @@ static void process_hw_errors(struct xe_device *xe)
>    */
>   void xe_hw_error_init(struct xe_device *xe)
>   {
> -	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +	struct xe_tile *tile;
> +	u8 id;
>   
>   	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>   		return;
>   
> -	INIT_WORK(&tile->hw_error_work, hw_error_work);
> +	for_each_tile(tile, xe, id)
> +		INIT_WORK(&tile->hw_error_work, hw_error_work);
>   
>   	process_hw_errors(xe);
> +	devm_add_action_or_reset(xe->drm.dev, hw_error_fini, xe);
>   }
