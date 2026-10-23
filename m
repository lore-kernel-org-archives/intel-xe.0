Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E7C606A319
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 05:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LG0Wxr87
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F34610E4B9;
	Fri, 23 Oct 2026 05:19:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A3210E4B9;
 Fri, 23 Oct 2026 05:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792732768; x=1824268768;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Bg7KB0ENL7GKC2uVpOLVfrDfTTRvo6c697PtYO3GtFA=;
 b=LG0Wxr875Q8M78LYHhaA1c/G6tW7jXUVRy3M7bn4ZImQ1sMJ9FXF9gq7
 ytD562F5qxmG5ECu+WiCpcgUl+mOmo7IW3JX9ynSe3W0N1kpJeUXWyqOx
 8ixep8wnCgQWKZ2kx82U7inDjnssX4GTO8INAMDJgYNILFX1avD4WRYuQ
 ivzJp2qn49qBB5LbGSkOR6esvDJmHPv/GnQrdhYEeMlcTkzicCxY+Lwos
 ffyoweUuMKa2IlTQv6BLmN5Ue1c2AEOzJctiZui5GocriHKAXn4Fslu7f
 0Wnvtthb43Olf0T5ZLhXWFQH2SxsqWyrlvEesLO8q5PoeAuhWDJo7LUh7 g==;
X-CSE-ConnectionGUID: rRSgOR5NQYKF0SC4L8x+DQ==
X-CSE-MsgGUID: RmG1Vl+LTX+Jhs+YvyhTlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1379296"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1379296"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 22:19:28 -0700
X-CSE-ConnectionGUID: eJ1imBTqTYSl31CRZGLWfA==
X-CSE-MsgGUID: y54DEnlkQkesVjKrIgPMSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3537951"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 22:19:28 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 22:19:27 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 22:19:27 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.12) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 22:19:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T0X33z0YHcb9IhXYJwhH2DSYiTjEQUB2ixSrq+3nAUpW1lKMuC8kg8/2TgBbwjI2jKF1JY1uWOkqV+rMyg8U9/NLnTavGY76c1vgWXTAqCTowKe46w/fAGUUbTqWUVLDDsVczJeeieBLlkVoV/mIlnMYbVgHVosDUyAhauqg2uYjVJ/RW16GCWnUhCCdtVRNX2LnjAJSF1VxYIhhTsjkXBa14NEy7hLID83NLOW7FKNfDsPRxnuHzqUXHzckEbaO2z27slg3owmUqZEOEkqMkWqiInhnYDcfB9q8aqAjL95mZYONrcn1Ne/KvgZ0prKE0bXzfZtRyVeXE5G7bhaPtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H2jzNOxPAw9/i9W75v1c3YXWLGeOGF6MLW0JTKcAE3Y=;
 b=s8SfllnKaraAiKNojee0W+SyWe2KKuEHXlVeIYiML9ePvNdhDUpVlRbNLmMNE++gBX1q+3jmO8CrN+GrnwYiKkpKiBerxA1arfTBn2ABGa9phe4bzvRNtyTyf4j4zWW4SWJmwtr0RWG/xzpC7f4pAnmfgvmSg5RG0RJJA6USnuXHwGvWihA89eSnsN3acUPhNMOUIktG6jU4OrhZa/qjvUoKXFESdDit8MMTQXpkP2lyOfYxQYqUH9Pg3LOkMSzM5FbHdzrOiridmT5ZBSmQEjBcCLTuT+TdUCgpdKSBAQrP1fZouP/TYZwpVx3rUq1s726juBOvfIruzW37rHyk9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7183.namprd11.prod.outlook.com (2603:10b6:8:111::10)
 by PH8PR11MB9805.namprd11.prod.outlook.com (2603:10b6:510:3c2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 05:19:20 +0000
Received: from DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::d9c7:d2fb:680d:1ee1]) by DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::d9c7:d2fb:680d:1ee1%5]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 05:19:20 +0000
Message-ID: <15f30286-0c23-421a-9d1d-860a2b12850a@intel.com>
Date: Fri, 23 Oct 2026 10:49:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/i915/cmtg: Disable CMTG after encoder disable in
 hsw_crtc_disable()
To: Animesh Manna <animesh.manna@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <jani.nikula@intel.com>, <uma.shankar@intel.com>
References: <20261021190631.527183-1-animesh.manna@intel.com>
Content-Language: en-US
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <20261021190631.527183-1-animesh.manna@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0080.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::13) To DM4PR11MB7183.namprd11.prod.outlook.com
 (2603:10b6:8:111::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7183:EE_|PH8PR11MB9805:EE_
X-MS-Office365-Filtering-Correlation-Id: 512a1477-9c2e-4361-5d43-08df30c530f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|261021121427099003|261022105027099003|261022075727099003|56012099006|261009223027099003|11063799006|5023799004|10067099003|261021123027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: jwS8qajNSCNJbyen6b+2v/ef1EGa+kGIbx1l62cyYoqEOInLno8/A8yjR+9NpyAT9Eyb+hQsnfS/uxNEpJ5WpGoxJ1GmpEMFUMpiDaQwseZS01FHfGkXoCWjt4fysUkw/51hr0HBfBuQK9DAs/kVSp2DbGLgsfH9lX3hXdq+F1pWVKrReYX5+IjNVpq84LXEe7eEe8J6HFqjMwUQHOtkWc9iAsTDRT8JCIigUrf78mUPE0urfut4h14hE2xboAP1yASbQSF4aRONf45UCq2kkYhHZNTqpFSdr8JvIdnB5zSxP1oEjiE8yMsYI+Fib+yX3dsqI2rDO3H69XblPCdH7uRott406pHjHrBrqB5M7Qc+RkC3uCg5P3qYQ8ftx9ZSX0daxQGuWAXteQcjqGEqaVhlhTEdSBfrQb8zf3+qj/QMxTNiKPau+ZH6yVsKCxa6BwBnMDjot9x7va8MFvXkx252+nuCoqo5JUNZ9lVQs+cBmuh9mQ0uDgNckiQHrI4ccq3qfqrCvpfo2MbpmeQXI2pKJ5deXHHYFyczIPeDE38inWQHMU+zAdGYVfzudKV5rp7KQo53XP8AIV8ick2yjdS5XWlggr26ePnCOFz2w5I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7183.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(261021121427099003)(261022105027099003)(261022075727099003)(56012099006)(261009223027099003)(11063799006)(5023799004)(10067099003)(261021123027099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVl0cjlGTmlmekxLdUU3bG9tVTdBaC9nR0FWUDFZM0MwQlphOVJWOElFZC9u?=
 =?utf-8?B?cDJKejlqYnBJbHJFSXZOYVhpZVdzdWJmMVFoQ1lBZDdZMm5nclBSSi92clRG?=
 =?utf-8?B?ajJhamtFa3VUaUE3d1NxOFZSaUNUSHpVV0xLRkx3NHA1bVhlb1o4Y3lac0hm?=
 =?utf-8?B?ckM0UzlmOXp3ZGRTanhWdGFFeHhVTGVMSzhVVHZBSUkxSlpxMW5MVUErVGI4?=
 =?utf-8?B?UWZZQk9mQ3I1NFozNXJVU1E3SWJuZForNVlUNkk5UkhhWWpCWGhGNUVNZDJY?=
 =?utf-8?B?N1E3dzc3VDRIejQwQTc0YUhxSkllZ042VDkzaHhobFY1d0hVQUdZL1VMS21Q?=
 =?utf-8?B?WW1ERjNHaUR6eWxSZkJLb0FlLzRWQWlBRjhkUk5mYTBIdlU5Ni9FbVdlZ2tP?=
 =?utf-8?B?UVpoRXZjMEZaMU93Y0gxT1packxSWkVTVGU4QVpFRGNIMjQ4eFFyOGFaRG5Y?=
 =?utf-8?B?L3VaSmlIbUg1NDZwZUIzR2xBWVY3UWdWdWgrMTlERU9rQk1mN1Rhc29NQ3hJ?=
 =?utf-8?B?OTQrVXBXZ0hFT1M2OGo4bWR4ZkxOZExSaUpMN04rUm9rOTA5bGtlNHBsSlU4?=
 =?utf-8?B?ZUpVZDJOZzNRN1Z1WUp2Z0hRYXdoY1IvQ3VLVS9DRGNiRFQ4NmphMWZHMEMy?=
 =?utf-8?B?MEYySlNSd3NrUlBQdXZLdmp4WmlGSmJFME1EUkJhV2dINm5INDVFT0MvMVJR?=
 =?utf-8?B?T2NhY2lxZzdmRzNtdHFUUndwZ2JiTUdWSmJLU3FwRlJYU3N4dXljeVZtZmdu?=
 =?utf-8?B?Nm5YTWtUSGxFNlhPSDJkRXYxY2s0NWxrY1hKU2RsUVVrOVRuL0Y5OS9TUVlT?=
 =?utf-8?B?TTk5SDdQcHJkaXlBc01ldVIwLzRZenpueWFGK1ZnWVVDTEJGZjcrM1hFLzc5?=
 =?utf-8?B?aDd6bDFtK252Y01xQ3h1MWJjVUh1TGN6eWxUSVIrYTBVTVQ4ZEN4UWNxN3hT?=
 =?utf-8?B?VjR4eDBBVE83cmF3WDYzTVU4TjRISUZ6bHJzWWtoTDFZaE9zV3IveFByRUlM?=
 =?utf-8?B?c0ZJSDBmMUg2UmNYeFU4SGhSMDJVcGcvUGNnZlhlZ2YrWkR3OXZtcmlvS0Ro?=
 =?utf-8?B?YURJa25uNHhCZVdua2hZTHpyWFNYQXhiaEUwZTdYRXg2QXl6SHEvMDZ4eTVQ?=
 =?utf-8?B?TXlXMzNNcE55YXlMT2JEUk9pNy8wcTRqeW5hc1AvNVdWbkl3WkgrWnBsV2hp?=
 =?utf-8?B?RVEyZmRFNi9IMG5kZ0lBY1hnN3A0Q3pWaWJBdVk3VGVrVDFRQTBVK3FBM29M?=
 =?utf-8?B?eEhheXJRZXU2YnhBTFZ5T0p3NmxrcDdmbFVmQi8zM0FURC9sMVVHK2lHWjd3?=
 =?utf-8?B?dVp4OVJyaE5tNmJpUW5SZ2FURElBVlRRWGEydTJOalFGMHRZczFCVFBqSlR0?=
 =?utf-8?B?U0JCNDZzc3lqTHV5VUlTZExhL1FnTVFBbDJaVGo3b0JvUithWWtJN1lMQXhW?=
 =?utf-8?B?TVZLY096aXRzNWhrVGRBK2M0dWkvTkFPbUl1OEI1dEo1L25EejQrTnQvMzEr?=
 =?utf-8?B?TVN3Uk9UMUtEaUZzYllhTjNjMk81T2dRQnB4cFV2U2dqenFPMm1PVDBWMjhh?=
 =?utf-8?B?UTY2S0xPOFpJS1BKUC82Yk5TN3ZrMVZuM3hFdDBpaS80UWpPVGRtbzc5LzRX?=
 =?utf-8?B?U0VXL0Y4ZVhrWHFSaE82SHh1UTlXaU5qV0JoME9LbmJPc0xxdlYxLzI5bTFl?=
 =?utf-8?B?dGUwZFo3M29oVU5QNzlMNVNVQ1RVNXZGVEtCYkE1dm1na3J2eEl4UmkxMXlm?=
 =?utf-8?B?blRSa0hMUnYvZnZwREZGelIxZTRZZ0ZwQUt0LzhXNmNkTkY0VEJmZkp4SFJp?=
 =?utf-8?B?UTZ4UHM2eDJjdVpUWU1KVTFsRnI3YURybXRENy9ROUpDR3BrQ1RsSEVVVFZC?=
 =?utf-8?B?YXVERVBESWdtbFo0bjZxM3QvZzJVQzFCVStOU2dGKzUyZzd0NVZ5NTh6NHRU?=
 =?utf-8?B?TjA5YWJBK1dsd3A3cncvemJFMFRWZHlTY0Z4WjBtSHJGRWRmdE9pMXoreDVj?=
 =?utf-8?B?UE9iTGRoMW9hRkpBODBuVnc5dlB5OTdZNnJ3K2FKN0NrNjQ3djM5VjVrRlhR?=
 =?utf-8?B?VEczMWxjZkJhMHFBSnJtaStSZ3E2RnF0TWpvbVVpd1ZqV204MzJYd0hmZ09m?=
 =?utf-8?B?SlZRZUZXV0pCaVlYZHpBL1VwcmYvR3BpWEE1aFh0VFV5b1E2VnQwbWFTMWRS?=
 =?utf-8?B?MjBkc1lObzdKL0FaN085TUkwNUpXNUNwZm5jcGZBTWc2SDNtazEyeldwTXYx?=
 =?utf-8?B?L1Q3Rjd0RW4rUDAwdVQ3SlRWaGhaWXRuRHo0U3o1OG50ZkRqck96clU0OFlS?=
 =?utf-8?B?aHZFMnNuZHAyMmVtd1BabWl5UVRFV0llS2NTUy9nVGt2SUxZTXMwSnhDWkNJ?=
 =?utf-8?Q?udnWtKcI0Jtj3uyRKP2FX12fDIbcLynPRdRUYqASfzulH?=
X-MS-Exchange-AntiSpam-MessageData-1: JR8oE3NWcyQOWQ==
X-Exchange-RoutingPolicyChecked: LClDHybpVsnOxaE14z39igRn43SclmDEVemejqzygCc60fsSxRfj3WURtBhY/gFt2mUUdRrnmT8MyE7BBD4WGLUFYAvt9730dfLEyVendrQp/FV1Xp+PdheHr5GX3z7ozos8rE0KsDqJK0Q6IxdCtb5kpEzfr+VBjIiNCoG1Fj2UPYeNGp2Mcm9pP4nx50Ybk+FGcuGU3LvT7osdX1sZfCidga6E/pkTqB08qYCR1GsiR+1AaxDUqMS/DqC++nxlgTocGsOZ9ifMMXiBd/g17xBfUCxnIqbfPp6uf/fbmo01gho1H1CbBufF01R3R6RL/J2tHgeAeKsMewlTLyuPhw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 512a1477-9c2e-4361-5d43-08df30c530f9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7183.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 05:19:19.9458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xfg74kVoDthGA9AwbyhbPfGIDav2SL812AhxE1KLqZH9sNscM2obhJUmHRTZyeHcY8zFY0yYeRS5ESJLYSeWzozbFKy8qBGDsu1Z6TfePUmdaETompGkCNvh3MOKuyBB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9805
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
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/22/2026 12:35 AM, Animesh Manna wrote:
> hsw_crtc_disable() disables CMTG at the very start of the CRTC disable
> sequence, before intel_encoders_disable(). With this ordering, the wait
> for CMTG_STATE to clear after CMTG_ENABLE is cleared intermittently
> times out:
>
>    xe 0000:00:02.0: [drm] CMTG: A disable timeout
>    WARNING: drivers/gpu/drm/i915/display/intel_cmtg.c:205 intel_cmtg_disable+0x331/0x3d0 [xe]
>
> This is seen with igt@kms_hdr@bpc-switch-suspend, which repeatedly
> disables and re-enables the eDP across modesets and suspend/resume.
>
> Move the CMTG disable after intel_encoders_disable(), so the eDP-side
> teardown (panel unprepare, ALPM disable, backlight off) has completed,
> but keep it before intel_encoders_post_disable() and
> intel_dpll_disable(). The transcoder timing generator, DDI buffer and
> port PLL are therefore still running while CMTG_STATE is polled, and
> the requirement to disable CMTG before the transcoder and the port PLL
> feeding it are turned off is preserved.
>
> v2:
> - Modify commit description regarding PSR exit. [Dibin]
> - Add fixes tag. [Jani, Dibin]
>
> Fixes: c588a324183b ("drm/i915/cmtg: Add trigger to enable/disable cmtg")
> Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_display.c | 15 +++++++++++----
>   1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 7602f633f49d..1c42aa477f3b 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -1854,15 +1854,22 @@ static void hsw_crtc_disable(struct intel_atomic_state *state,
>   		intel_atomic_get_old_crtc_state(state, crtc);
>   	struct intel_crtc *pipe_crtc;
>   
> -	if (crtc->cmtg.enabled && intel_cmtg_is_allowed(old_crtc_state)) {
> -		intel_cmtg_set_clk_select(old_crtc_state);
> -		intel_cmtg_disable(old_crtc_state);
> -	}
>   	/*
>   	 * FIXME collapse everything to one hook.
>   	 * Need care with mst->ddi interactions.
>   	 */
>   	intel_encoders_disable(state, crtc);
> +
> +	/*
> +	 * Disable CMTG after the encoders are disabled, but before the
> +	 * transcoder and port PLL are torn down in
> +	 * intel_encoders_post_disable()/intel_dpll_disable().
> +	 */
> +	if (crtc->cmtg.enabled && intel_cmtg_is_allowed(old_crtc_state)) {
> +		intel_cmtg_set_clk_select(old_crtc_state);
> +		intel_cmtg_disable(old_crtc_state);
> +	}
> +
>   	intel_encoders_post_disable(state, crtc);
>   
>   	intel_dpll_disable(old_crtc_state);

Nit: Since the issue is hard to reproduce and the exact cause is not confirmed,
you could mention that moving the CMTG disable later avoids the timeout in testing,
but the exact reason is unknown. Not a blocker.

Please add a `Closes:` tag for the `igt@kms_hdr@bpc-switch-suspend` failure, if applicable.

v2 was sent as a new thread with a different subject.
Please add a link to v1 below the `---` line so the review history can be traced.

In the original series: https://patchwork.freedesktop.org/series/171766/,
Jani asked about Cc: stable. Please clarify whether this patch is applicable for stable.

With the above addressed, LGTM.


