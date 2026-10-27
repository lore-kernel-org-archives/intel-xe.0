Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D211B606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 09:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Cc1Vvgn9
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8517010F2ED;
	Tue, 27 Oct 2026 09:07:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA9A10F2F4
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 09:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793092058; x=1824628058;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=py2Xbb1o3O1nKr6kZzVC0s0YILyOgqvNUmLcNynuBB0=;
 b=Cc1Vvgn9Gzh11CMtsEnOgCea+LeYdBg64HOV8vRDTkXYpuxP5Ai3OIza
 MIkIBNJea7C1DpLa2vEKXGrwgsPdCsnSj73RD4hBq3efp/I8/cYEBPFnv
 klydeLf9NCq+qx3Nt8v9FPUlTf3oQkNbOZpFJ63aGvWBwEUU+tLZnBu9/
 4bCYM0LDREI2FQ2ZDPsTVQ82DeeiZXXn074mns1bzWO+8VgvcmSCl1ko/
 DtvbWkVjvC2YH4UZ0oN5FoG4BYo7NZ+W8TGdUvOUcQTkQUierRpAacYUW
 qXi8XUsRHLjuUVLvN/druyfwW9QxL5Ar5TsZJpzoEa3mBRrsFoJ4Xqm/z g==;
X-CSE-ConnectionGUID: XYchXG4XS9mzg9TVFaYuGw==
X-CSE-MsgGUID: OvUjx9z6Tf+7TQ8kYuvjGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1667985"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1667985"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 02:07:37 -0700
X-CSE-ConnectionGUID: L9g20QOpTyyR2NKeybgyHQ==
X-CSE-MsgGUID: XTcKH0JrT7uNGIfFcU3hZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="6243240"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 02:07:37 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 02:07:36 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 02:07:36 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.5) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 02:07:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uZlx3W3sT5hTskJvzeZ9rNo7VGBhHXp8/voQyVU38vugHYExjmanyzF/owTqKHKS0wZWOW5VPgm+K8HvWjlueq2aA3GDGb+3hFP36du1Xhi1gR22RErMNAA9SP0ThrEHD6k+lR9kCxSoNTwBTjVS7heRNXlJXHjgESNAeUbKMbPgKu1a/JoFeov4ti/zFebs2psFgc+GtODt2+H9yL0nXXouf3vhVm8OZFmNfRqAw1Aiv/ymcfOpbV0VkM71uQgGUIw/hoV8CIVw7EkmZYvWFTWw6/ZXn0pkV0sZ3c6PINCkysZU4PCHV3VUCsNN7ubS5IwdgoojUnDKuxGk7CtETg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v4gz/gQokWOIjNGpYA3F/fihoz4sX88VT//Esz0WkKM=;
 b=t3UQcpgdL4oT4BX/op4yzOkGmh+BwENvs+dg7CbjOkkAWVTEXjMNDVk7iKAa/0RdKvp9wsY2RFxvDCbcToIv7r7LfU+qvzjc22Sd6rgPu8sZ0bexpGFC6PRHNdRzNFmD8rA/YfJ2RvdcI3VBtjYwBW6G9NXVASO2F3IbKlw9XO11Og+Jh01nG5tkcJ1olNa2LqCErBNz0JzUwQA6D/1CngXMk1SOZKOrxCboJgCHSm81Of6dUuq7nFrz+hrgAI3XFY4KAdY7McF/o9sMeVAD/GWYJOjS3tgg8cC6KKOaI9qAk6r9A370naJwdcvPEPEp2hHRsufEykxBGYBxKbHKmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by CH3PR11MB7841.namprd11.prod.outlook.com
 (2603:10b6:610:121::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 09:07:28 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837%3]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 09:07:27 +0000
Message-ID: <9e0b9c49-34fc-452b-b068-5430e7a7f13d@intel.com>
Date: Tue, 27 Oct 2026 14:37:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/svm: Preserve default PAT index when resetting VMA
 attributes
To: Arvind Yadav <arvind.yadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>
References: <20261027085952.2882874-1-arvind.yadav@intel.com>
Content-Language: en-US
From: Himal prasad Ghimiray <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20261027085952.2882874-1-arvind.yadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0104.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::12) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|CH3PR11MB7841:EE_
X-MS-Office365-Filtering-Correlation-Id: 96fbb42c-6e06-47ac-85cd-08df3409b91b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|6133799003|10067099003|56012099006|11063799006|261021121427099003|261009223027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: ZqPFpCb8Iy5mgYadwsntNEt/mPyyw6hKHo39ZmlvNdQppQN/0VVCSTkGEOk+3WPc+a23qbT4Ueo0LJ3m00ISA0bOrHIAyvQpUfFo4HorZPde4nsu3lGPTSJcvhE4bl/Y6qK5YI29pcsYtHuPmZHjRbbsOzMW9OHvGNugU8RNb45Miyko5RkO52ANhVopwb8p0BpFPIZyal2vG2T8LpjmCq1m8FJ1RbNboQD+mmhfjYws2rgzNhLwW6T4mkLMMtxN2jRUvyTvfrYjTCwvRejVawJs+b/T46LIHUrZ0MV8s48gecD0HLzaWK2P2beZ/Nfs7v6K4EIpqRD/suzRjYqppPnbJnBvhgYB5hf+BZcCUPN9Gq728bI6ab02+9dmIeqkkgjjRCvr9Q52GgRkeq5zVWJjngqD6nH+JuaeWbKfiaREUYR20ICdrWR7jYW2LdkNGSe3RJx8kZ3skpfRnTd/5ufI8HI/xFfXs/aMTeHUL0z7kfOqeAX6tTZcqfr+xxcPcOBP6dBrlrWgp18P72ngIpLLNd2wFGRg74LJO8D085vjAE+EHtZOS994AHXm3Rn6a2U9hj2wZoCSawLt+qjdVK9wc5ywJgv3BKEvVft01Z41GdvTZJjmUA+TdTA2CtZanHpeXk6kOVITv+jt9M5vPkkfDwTRgETTGUYkyMMObMQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(6133799003)(10067099003)(56012099006)(11063799006)(261021121427099003)(261009223027099003)(261022075727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2Q0ZEgrOXFkNk5LSWxFdVlsdW9vTmIvVko0S3VuRFRnUi9JL0NGMEVKejBD?=
 =?utf-8?B?Q21jNWt0aVhjUmo3ZWdUQ1pFVzhVVVFXTjBHUHpvME0xVGYrcmlJY0NKb2Zh?=
 =?utf-8?B?cmJ4MEJBUnJTcXZJLzNpREVxTVJXcEJWakxYamh5dEFaNE8rTUc1TFdaVkZG?=
 =?utf-8?B?NkM1S1dMekgzQm1OWGFLODZnQ2xWMkRaeXR5OFplYnFFVDVPWllYTlhySnNo?=
 =?utf-8?B?OEdIN3VoZ2xqL1VKUXVSM1I0bVY3eCtmdjdRc0Fnb0N0RkRZaVZMZlRUUUgx?=
 =?utf-8?B?MnN0WkdhdHB5WFhqOXZKbHZXK1YzQXZCY2lQeUQ1MGlsYUpIUkFFSEZZWlRy?=
 =?utf-8?B?cWVsWi9CYk1uaDlEWnJqMEpETjIwcXJPSzdBaHZOOGYxSk0zYU1UZmo1RHBx?=
 =?utf-8?B?dGlCM2dEbm5Xa2tFdzZsNldjZjlWUWV0bnlPWjcrUVpCQnFoa3RaczBzQS84?=
 =?utf-8?B?MGJjUGdNZzJiakM0eHp1b3hjZ2VreVIwa1Vzc3UrQVZHOU5oWCs4c2s4anRB?=
 =?utf-8?B?ZEpNNnZFeXhUK0J5aWtsWXAxeWRRMHdiWG81Z3F2SVdDK0RCeHl1RVM0dnFK?=
 =?utf-8?B?NUNBSVpHNC9BUHM4NVVtV2R6SUdhbzhqNElwUnRkdkFuTVdaS0dMZjFZRWxi?=
 =?utf-8?B?SjZHWGpRM2Q0ZDE3Nmozek11TXBmdjNqR2Y1UHRXOXNGYlRpVDVOTWU0Q0Zs?=
 =?utf-8?B?WEMxdTlZUDVMMEtPVDIvdTV5ekNsMHRZR2VXNzZ4RVVIWFJFWmlPUHNCWXAy?=
 =?utf-8?B?SU9JYUdiLzhHbk5tR2Rtck5qdFROWlBlWUxsTEs1dys2aTIwUzAzWTl3ZENz?=
 =?utf-8?B?TXFvNW84amFCZm1qMjlxbDc1WWQvejVHNWNMTUV6eHpMZ3NmeU5BRTBKa2lF?=
 =?utf-8?B?Ty9JSUh4eUR4MWdyT0FhYjR6VCsxM3U2alVsb2ZKdWxjSXJSZXpoYkJMVmcy?=
 =?utf-8?B?SVh3R3IxWXhWeWRubXUvQUFwWnVYK2JyM0grMU9JZitxYWkzZTVqbnhnSnJm?=
 =?utf-8?B?M3NZZzRkWlAvK0pPQU9HUldRZVBIZkNHNFFBU2M5ZGJvRm5UZXRRaUMvSDFn?=
 =?utf-8?B?Y2drcjNOMXRlZjBST0RMLzdLcUFXbXNWZDRBN3puRWtIMmwrNXo4V3ZLWXVl?=
 =?utf-8?B?MGVic3R4aStLWXl4aGo0cnkxZ0FxdURENVdGRWJ2QVp5ZXNraVNQZnRjVWFW?=
 =?utf-8?B?b1h1bEkxdkc0TjZMZm9WV3VBWGpoeCtPZUlMbXFxSjEybkV1YWwra00xWEk2?=
 =?utf-8?B?aXhUTHJIcFd6dExIOVQwYVg1QkE5L3ZhY1E3SW9jVW5PdVNjcFhQTE9FNkZJ?=
 =?utf-8?B?OFpzVEMzcHdZMWttK3ZMdVZiWk96eGhMZHBmVkVqTTFxbFFDaEgzL2VwS09k?=
 =?utf-8?B?QWhIdm96MDFYWG5EUFQ0NmVMT0pRL1BGbWFPa3Y3UVMycFRIdVg1cDVuWllZ?=
 =?utf-8?B?UHo3NVV4aWFmQ1NLRXRxQ3AyUDJMbGgwU3hHZnFuUWszY3R0bmJGSjJTeXFu?=
 =?utf-8?B?VkJzVXRUemEvRkVSbGE5UzBuQ2ZOR3BEMy81dzROUXFYM1RBSVplQ2UweDlM?=
 =?utf-8?B?Z1RHRFlIWGRvcXRaR3lQMVRNdE5KdWk0TU50R2xXZy9NUFNNY2RtSTU1Q2xL?=
 =?utf-8?B?TGNnT01EbjFUTkNLTjZsQldySEt0Z3hVSERiTWFhUTBVcGpwWE0wV1Zidlcx?=
 =?utf-8?B?Qld0RUpTNG5MbE52RFZ3bnhXZUYyMlErejZZZ2JVUWl5dk1INXlzR1RmZFNm?=
 =?utf-8?B?QWJoL2NRcWV0clVEd2J2S0JUUmVPWTg1U0hhZ3dWNlFwL2F2SnRWdG9Yb2Vk?=
 =?utf-8?B?SEpSVVBQbUcyc2VobFlQUWRNTTVRdHM2YWtNdHVqalBJaW5BNXdZQUxZelRZ?=
 =?utf-8?B?MmZkcXFXQS92UDdhSzNJNGl5NUdobk96WDc5REZxUDB2ZWRYUzN1V0tIV3Zm?=
 =?utf-8?B?VXF6L1lIeXc5M21tbGZvcUVPWnN6YThXeHd4d3dJTmo4WUJjRnlVb1prOWM1?=
 =?utf-8?B?dmptbjZJMnIyVUlUQTVvemNLQWs0TUhBVjZOM3VXdDVmWWRSYWJGZGEvL2Uw?=
 =?utf-8?B?TnRtT1BIT3M0dXBCMUNWSUQ1L2pJc05Eam1HRFF6QXNJT2lpbU1lQjdYYXlq?=
 =?utf-8?B?SHplZHRNcGF1dDRCM29MOVV1K3NwZFl2c1M0U3ZjeENGWGFHSTlQU0xwTE94?=
 =?utf-8?B?Z2JMWDBaYm1kRTF2ZVlNM3RBbE1nczJlL1VUK3plQVZpck96bUYrZXdLZE8w?=
 =?utf-8?B?L2JlTkpVTEJJMi9TSmpvVG5FRzFGeUMwRVltVWw2MU5CNGJLZGxqZkRJa05F?=
 =?utf-8?B?RHlSSGU3ZDE5aHVFVVp4VUV3Y3hOZFhZemxlSWVTUmhoc3h2dHRoK1JWcHdR?=
 =?utf-8?Q?ZHR/u4qVQNaiLio4=3D?=
X-Exchange-RoutingPolicyChecked: odB1kLiS+/oRLYd3DsKN7AkwsRO/k6wlqrjxdePi2SjX/lrHHRQHe8M9mw/rAKBFeyq3tZEQyBUGXPOIsTunEjA0fWC5abzzD67H0GN0y4eNIdTVyx0eV2+mlV7yKipIsjS/PbJNEDrNFgJ6dhjKYPH+4a1iqqPoPeU8GEM8jO1Vk+Z+18PUnnq/ZkCPnMyTke/GGI3XWLTWbXQtEhEsAqEBMErmKu23NYEmhSeWl+CRERkhsDgqpJbRNDNlof9rFlmHklyv8TCm9TtNEELAAHMs8oTuYswSePbLGt1p9cWkP6RFWS8O+Qw0GlEesvpK4xGskA3ap9XC4B79S0QvsA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 96fbb42c-6e06-47ac-85cd-08df3409b91b
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 09:07:27.8715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TAZLMJ+Zgu1pbgq3HvyM5sSZSDw03vPbxmoUoYAh03cfS+gkmPx0Bg0AUpEuOqi/l3at/5oyeyiAVai7JbX6EmIC8L2cm38MXYURX2xQkG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7841
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


On 27-10-2026 14:29, Arvind Yadav wrote:
> xe_vma_set_default_attributes() replaces the VMA attributes with a
> default structure. It sets pat_index to the saved default PAT index,
> but leaves default_pat_index zero.
>
> When the saved default is non-zero, the two fields no longer match.
> xe_vma_has_default_mem_attrs() then reports that the reset VMA has
> non-default attributes, triggering a warning in xe_vm_alloc_vma()
> during SVM garbage collection. A later reset also uses the incorrect
> zero value.
>
> Preserve default_pat_index when restoring the default attributes.
>
> Fixes: 4a938d3886d6 ("drm/xe: Merge adjacent default-attribute VMAs during garbage collection")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_svm.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 909a602d091e..bc6902b5bf57 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -347,6 +347,7 @@ static void xe_vma_set_default_attributes(struct xe_vma *vma)
>   	struct xe_vma_mem_attr default_attr = {
>   		.preferred_loc.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE,
>   		.preferred_loc.migration_policy = DRM_XE_MIGRATE_ALL_PAGES,
> +		.default_pat_index = vma->attr.default_pat_index,

LGTM

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   		.pat_index = vma->attr.default_pat_index,
>   		.atomic_access = DRM_XE_ATOMIC_UNDEFINED,
>   		.purgeable_state = XE_MADV_PURGEABLE_WILLNEED,
