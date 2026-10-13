Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFDFCC6B03
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 10:19:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E553C10E28D;
	Tue, 13 Oct 2026 10:18:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 413DE10F6EF
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 10:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791886731; x=1823422731;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4hFXTpJJpyKsSkQHjCaTSmdrQuxZFDMCuew01+t6h3E=;
 b=RkQVvo+zgSMTF1c5jxQyi6PJkCRAgp4b/HFVSJiK9caX3AfmyzC/wmDl
 JeR2o6QPpm304VIpqjALwEORalqDG5g+UUs5UhonKrtV5wePVE88b2i3Y
 0zk4yjTrZGjdujMf2xbLN+P2mVJps/94NZh0sQ+oWx4QdbkooUq6H1zKF
 8lHDV7Om24LD6pNkzQN76pLKUOGgLEMob12r+I0BHgCXongXE9Hb1mDaj
 SrMUaTYKwdhjPT/RmhViRgMk9QLhWqcZg+yGMolDPQukNbzrlulfFWOWx
 He07z/aKHR8GxpQEe+RL20w6XKtnaueR6hShujpBONXPoZG4G6FUOqQDT Q==;
X-CSE-ConnectionGUID: FKL37aJeSN+AMeepMdTc8Q==
X-CSE-MsgGUID: Hg73W7jqQV2YniaAqnzXEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="509069"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="509069"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 03:18:45 -0700
X-CSE-ConnectionGUID: Su4vfVbBQs61Ym0hfOV0fQ==
X-CSE-MsgGUID: oKwmrqWfQGqbWcgaQzT3+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1485818"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 03:18:45 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 03:18:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 03:18:44 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.23) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 03:18:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZRXYlHwytMUJMRtMsFD7ueFRV12teCXwEDWjjbHVBwIZWWCCOdLJ/kFrLyGGU4cCYerV2tkdU7tlEgmSnsy8PB0DKylqEBXDLfqlAnlgIFiBgsX6iMPI9JbkkmtnRq8qvUk6EjyphTT9PqnGPD7n48jJB6XZgC+heMi3AaQPoRRVZnSmnjv9tYBSEXqUwtOBy4/BDy8NXBPm1TzLY5w0NsiCpIy/upefUrtXI11rHFPpjjwWBwvtB+TkbsEwlR1k8UDR6vhqgfkRRgSD5J5apnVWSy2cU5cMkJCWO4UzTVioxbjSQdWDLKFr81+GNmZ0Xc1h5pMH04rdqOMYPMxDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kuOaMuvoB2Tsn61Of2hCyyXzeZC2avH+UXzxXo2fyT8=;
 b=EIO49WUliB5+23rN7Fk0QwyQ5i57xK23Ss4zVxgnMO7SiTdeHdEnP3HOZRt/rEFwZrJ3IBPdqnRkJ8wUa7LUmm9pYMIq8hsSMO0DfPN408H5nLLjwjb9GB6gvid9YeeLfHLmmrDfPQ8gLGSjEJmzEloVh9ZdeU5K/ENdSn+/AT8bw35SnL+9vaaPWWwhpDsWhfNAxqqvl8PkYOsqLCSe4MJAOna7rHIyQ1mmMeXE1IZl7m3kAqbqiEe9Sx7d7eVRFuXwiQw7dtWaEQyE70uJhvdjmw6vG69R0IC+bZAKdHI6ikmISd8S0YfUZbUc1ZI8pbWSFVHnJHT9yj3DWQPJfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB6939.namprd11.prod.outlook.com (2603:10b6:930:59::17)
 by SJ0PR11MB5038.namprd11.prod.outlook.com (2603:10b6:a03:2d8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 13 Oct
 2026 10:18:42 +0000
Received: from CY8PR11MB6939.namprd11.prod.outlook.com
 ([fe80::d46a:5310:523e:2307]) by CY8PR11MB6939.namprd11.prod.outlook.com
 ([fe80::d46a:5310:523e:2307%5]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 10:18:42 +0000
Message-ID: <31e312b2-58c4-4070-8740-91676073301d@intel.com>
Date: Tue, 13 Oct 2026 15:48:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] drm/xe/kunit: Extend GuC ID manager split-pool
 coverage
To: <intel-xe@lists.freedesktop.org>
References: <20261012115143.4100364-1-piotr.piorkowski@intel.com>
 <20261012115143.4100364-3-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20261012115143.4100364-3-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0076.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::17) To CY8PR11MB6939.namprd11.prod.outlook.com
 (2603:10b6:930:59::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB6939:EE_|SJ0PR11MB5038:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a8b5400-ca1a-4552-6754-08df29135b44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|18002099003|22082099003|261009223027099003|11063799006|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: wjgGYwQVFRmDs6BPHe2u0Pvfq4OnZmoaONG7oYYKNt2oQ8P43bGlD6U9zIMKvEwf+eHB1oOpY10X4YU6bvbfKOXehlOLmuDFmlrCKuDZwh/0bueJsFbcozidoP1Fk4N69GBCg2c94y6y6ywcRtnxrwFnaMUvxnkPAMPCBy84HAyvVDOioR3fpMLShRR65wtphEkDQp5eawqrBDq3b1GO9dwLWssox2LksRvs8pyQnJuierD4/qDgF/Ye18iWTFcDQLB1PJKHkrP3tCrAOJmOY68ydjFWab5HlLBPs98+dRf3ktlt2f+xLguSkkYv1rdB6jB4sqkIW39rA7dOualySOQDtF9z0JcvLKu2WYyFkBgLgjDUbRSxU+WNEoR4ui8KyVUW+q+pzppf5JgoBPmekCCXHRip/MqRbfqEU9Nuh54sjWyX32WK+ayTo4x1XqdPu9LolKKKLcIr8Zu3pnHVdaZ2VVWG6vohRDYWpX7vyWOiYm/gWjfiiIytWrTAb2KpW2crSLjDFrdSSq09JLuvV3R83MFlrXAtOdYHvksQTuUVMI/YLxk4S0H+F3Eie7S5O3uV5JCpCtucUs9svfbU80Hoys9w//s1UhHjassiLjdJlwI79JcDWedZngFZalWyjeWqLEe5JtxxP0HarZGqmRKORBU6ZtDJK9Cth1wLoH8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6939.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3F4ZEdjT2lPbHpMNEMwdFU2VUFhei9HbGtDSGlqL0RsWElwcWVMZjNNd05s?=
 =?utf-8?B?bHhMN2lidDNrV045RkRSMmFTcGo3ak83OElSOW01SHE3R09reFdjS2w5clBQ?=
 =?utf-8?B?aFd2aUNzUkJNS2RUczB6MjMrZXdVSk1QSzZuZGRYQ29HRmxud1ZQSkhjZ084?=
 =?utf-8?B?MG42M2o4akV5VUJIZDhJd3M1N2crQVNncFVQQ0U1Q0NWU05IQ3NyRHdBRXBG?=
 =?utf-8?B?U0tkSTVET2hrc2FHMExIWTdYNjVjTGJaTVJrSHdhRkw0RXRKa3hzSlpZS2tM?=
 =?utf-8?B?bHRWWWtHZHovanp3cDFuaXJzRlhIcndmcml1SGFiWjFtQ2pmWENkM2h2UzRx?=
 =?utf-8?B?YzlCb09iS29QYVBLem9ZeWtqWFZVbi9tZC9CRWFvTERLbkIrV3hQd0dDcjh6?=
 =?utf-8?B?cVI4WHh0Q1ZXTVN4UVg0dE5ITzJSUDlkeVpYaVd0VmhzS0k3VUR4UWRzOWlz?=
 =?utf-8?B?M3JGUTFZT05IWVhEbjY0L3lqbkpPa09KdUxCa1ZNYkkvT2dyZzY4V1dvRnJR?=
 =?utf-8?B?eUpNTzB2Y1NsWVJVMDB4MHl2REZUMWJqWm04M3owV3g2VXdIS1lwZUxYN0Jt?=
 =?utf-8?B?RGNKK3hSUEFwRVpxY0twVnljSEhKajNJMGNoSW1qRkJTZ0grclUvUE5INUpR?=
 =?utf-8?B?bmpJNHB5bk9Cak8zYjJzWmFqVFoyNGFWSHBxeWV3WWNCVzlQbnVieG51Sm1O?=
 =?utf-8?B?QWtVSTYwbWI2Wk5aT2ZsN0xXSFBVdUxxNWZaci9pQm9OcjZDVUtzUDR5eEhi?=
 =?utf-8?B?ZGVjSUd3ZUZiU3RzRnhCUzlST1JpVnpmK2FML28wbDd6L1JXdTZUeGwrMFJa?=
 =?utf-8?B?aWsvdjRlSkI3bldwM1BZNGY2aVVxUmZvQThUVUJKdHE4QUZWM2t1VmZ1YjI2?=
 =?utf-8?B?eHpwc096R01Sc2xDTWdpbTEwVW04WmFzWmF4UVluUzhpQk9uYnRFYTF6NVB2?=
 =?utf-8?B?ZXpLMkt3YXE1SWpJVm80UFMxU0kzWFNYSmZvcXhGK0YrUURZeEVDekxPZkZF?=
 =?utf-8?B?ZUNCaTYrSUcrclhJK01hbkZHM0htQllSNlZnQzE0RllkOXdVUTNiZzZyMHM1?=
 =?utf-8?B?M1N4ZzdsaEVieHpuRktMU2NPY1ErbmhyZU90SmlaT05sQUh2Ui9ERzgrRTkr?=
 =?utf-8?B?WUY2THJqMk16NDJ4ditRdE1ZaXBCZjN4S2ZPc3lCb2VvdTBzeFNqdndqOG5P?=
 =?utf-8?B?bWVUd0h4MnpLTFJRY2srSk5BWTNyUXhJMVg3bnlLVzU3d1hxSGlhaWhMdVNB?=
 =?utf-8?B?OFkzNysydklVWWxabGRpMm9xRGxreTkvdHp4Z3VCMWVXZ24rYkxyVU5XZE13?=
 =?utf-8?B?N2FoZUVjWXZDWW5lQ2RlRlFtM25WVmQwLytUSlpoak5QQXErdWNLRitlejJa?=
 =?utf-8?B?TEJ3UHFvcHNYWHlmRXNMU1NRMjRBcDQ4VnRSN3F1aG5qZit1KytMUnpOM3l3?=
 =?utf-8?B?UFl3S2J6MTNGTVU5K0ljZFlwZ080TjQxMno0V1V1RUdyTDdRaFFSN21wZGRv?=
 =?utf-8?B?bHpKbitIM3pyeDk4MUdSeExrb2pKL2dYdXgxb3k2Q1dMdTZjRmExYWFIemNL?=
 =?utf-8?B?LzVnV3BMSjdyZ0xSejcwWnNhc3RwemhTdFFsbU1QYTVYMXR4azRyWk45dnlw?=
 =?utf-8?B?cjRhZnVPaTJJTDMxZ1ZvRE5LTVY2OC9xbWFhRkxMZzJRekprTExXZkxkaDB3?=
 =?utf-8?B?bVZwdGk3Q2xNc2I0MksyTmpUc1BOVExHMVBveDhDNG4wRTYzeXdMKzQ0ajZ5?=
 =?utf-8?B?SDFEM0F6bmJ3eWlkNExsaXhBbVhield3L1N6OXBndnExc3B5Y3JkQXloMm9u?=
 =?utf-8?B?RWVSSFUyb1JUOUpJU2hXL0JVUWFTL1RYWHo0ckFVaEVRSW1wTWtvKzlIc2Mz?=
 =?utf-8?B?QUMxNURxYVhpa0R1YkpsTkNNZUxCRHpjUjJXUVNMZU9ZZ3JYWW4xYTBkb0kv?=
 =?utf-8?B?U3JWS3phbTdYVklwVnZ2NERTTXIvMDRpMXdZT1JFeHQzdHUyNTk5K040ZHdC?=
 =?utf-8?B?WmMvQ3k3c04zNkZEWTZCNFprQW9VODRDZ3F3WU10YzRsQWdSU1FUOXZQVGtS?=
 =?utf-8?B?NDV1aVI4ang1VmJxaVZQdTAxL1YrOTFaanAwd2Z0OEpJM3VzNWxRRTlsVkxP?=
 =?utf-8?B?dmVBb0NqbzRWeFhQUFFvQVRmWEZwa2FwZHMxbVBzSk9yNjVDU1JtdWNxZjht?=
 =?utf-8?B?amRJSlBLc1luRkRSSEdZd3BsUE85UXd5RWFHUTJpajJMcGxxWVVQdzBpYVV6?=
 =?utf-8?B?K2M1VU43WTZJM3FiSmVVTmxXNE9LN2pVRkhrZFNaVDlySDVMNHhVR3g4eW1Y?=
 =?utf-8?B?YTVxbVhlUkc2S3VMRk5LUTRDcVNxdXhJanR0TnNTeUFNVW1WRURBZEN3MXBm?=
 =?utf-8?Q?qENVim0+XF9KE/tw=3D?=
X-Exchange-RoutingPolicyChecked: QfHn98zzNDw97gvJWKPQiqHzl5LaWh4/pZB58N7f5+h+SvR4poebm3AE/fnpd9qKY/PH8gyonDTV0rj4SF8wdmWd83e7ss9QS16uPuZ2Ts2ozLa24bmV7VC899O96ULnFxQdyZ77tPhfGwODs9lbt0Nvec5H9R9i31sL8iZwe/wAePac/qFHtw14s0fiKwvhtnbmCT9wgBKjUCKOAygkixgX4MkmcJn1jBBE2VC21ioi7BdZrp6fO4ucrySHnMjVsZHsf1xXjxwyaOXMA7E/W61w06oFpGoIDb9asU2xow7h0Z5w78YKMmP4q3gXoeCw5oCKmHgChOv5EacwEzxERQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a8b5400-ca1a-4552-6754-08df29135b44
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6939.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 10:18:42.6051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Me3zDVstE/66At1K2uSbiKd8euMbDgVLRr9DzLCTw8X09U3Te97NB0QTVqiVl0j/ulNDjiHcvaqHDrMSwPJppZrIF2jZBQ/HVrZZFreLgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5038
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


On 12-Oct-26 5:21 PM, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>
> Expand the GuC ID manager KUnit coverage to exercise the new
> usable/shareable pool model.
>
> v2: Use KUNIT_EXPECT instead of KUNIT_ASSERT inside the locked section
>      so the mutex is not leaked on failure (Sashiko).
> v3: Guard failed ID reservations before releasing test allocations.
> v4: Avoid releasing unreserved ID ranges after failed test reservations.
> v5: Fix check_used() cleanup and add missing reservation guards (Sashiko).
>
> Assisted-by: Claude:claude-5-sonnet
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 670 +++++++++++++++++-
>   1 file changed, 654 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> index 78d3de46b7572..48a962de5abcb 100644
> --- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> @@ -7,13 +7,27 @@
>   
>   #include "xe_device.h"
>   #include "xe_kunit_helpers.h"
> +#include "xe_pci_test.h"
>   
>   static int guc_id_mgr_test_init(struct kunit *test)
>   {
> +	struct xe_pci_fake_data *fake;
>   	struct xe_guc_id_mgr *idm;
>   
> +	/* Keep one logical suite: use PF fixture when IOV is enabled. */
> +	fake = kunit_kzalloc(test, sizeof(*fake), GFP_KERNEL);
> +	if (!fake)
> +		return -ENOMEM;
> +
> +	*fake = (struct xe_pci_fake_data) {
> +		.sriov_mode = XE_SRIOV_MODE_PF,
> +		.platform = XE_TIGERLAKE, /* some random platform */
> +		.subplatform = XE_SUBPLATFORM_NONE,
> +	};
> +	test->priv = fake;
> +
>   	xe_kunit_helper_xe_device_test_init(test);
> -	idm = &xe_device_get_gt(test->priv, 0)->uc.guc.submission_state.idm;
> +	idm = &xe_root_mmio_gt(test->priv)->uc.guc.submission_state.idm;
>   
>   	mutex_init(idm_mutex(idm));
>   	test->priv = idm;
> @@ -33,10 +47,10 @@ static void no_init(struct kunit *test)
>   	struct xe_guc_id_mgr *idm = test->priv;
>   
>   	mutex_lock(idm_mutex(idm));
> -	KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve_locked(idm, 0));
> +	KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve_usable_locked(idm, 0));
>   	mutex_unlock(idm_mutex(idm));
>   
> -	KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve(idm, 1, 1));
> +	KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve_shareable(idm, 1, 1));
>   }
>   
>   static void init_fini(struct kunit *test)
> @@ -51,10 +65,28 @@ static void init_fini(struct kunit *test)
>   	KUNIT_EXPECT_EQ(test, idm_total(idm), 0);
>   }
>   
> +static bool require_iov_config_or_skip(struct kunit *test)
> +{
> +	if (!IS_ENABLED(CONFIG_PCI_IOV)) {
> +		kunit_skip(test, "requires CONFIG_PCI_IOV");
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +static unsigned int test_idm_used_total(struct xe_guc_id_mgr *idm)
> +{
> +	lockdep_assert_held(idm_mutex(idm));
> +
> +	return bitmap_weight(idm->bitmap, idm_total(idm));
> +}
> +
>   static void check_used(struct kunit *test)
>   {
>   	struct xe_guc_id_mgr *idm = test->priv;
>   	unsigned int n;
> +	int id;
>   
>   	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 2, 0));
>   
> @@ -62,13 +94,17 @@ static void check_used(struct kunit *test)
>   
>   	for (n = 0; n < idm_total(idm); n++) {
>   		kunit_info(test, "n=%u", n);
> -		KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), n);
> -		KUNIT_EXPECT_GE(test, xe_guc_id_mgr_reserve_usable_locked(idm, 1), 0);
> -		KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), n + 1);
> +		KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), n);
> +		id = xe_guc_id_mgr_reserve_usable_locked(idm, 1);
> +		KUNIT_EXPECT_GE(test, id, 0);
> +		if (id < 0)
> +			break;
> +		KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), n + 1);
>   	}
> -	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), idm_total(idm));
> -	idm_release_chunk_locked(idm, 0, idm_total(idm));
> -	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), 0);
> +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), idm_total(idm));
> +	if (n)
> +		idm_release_chunk_locked(idm, 0, n);
> +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
>   
>   	mutex_unlock(idm_mutex(idm));
>   }
> @@ -76,32 +112,620 @@ static void check_used(struct kunit *test)
>   static void check_quota(struct kunit *test)
>   {
>   	struct xe_guc_id_mgr *idm = test->priv;
> +	unsigned int usable = GUC_ID_MAX - 10;
> +	unsigned int shareable = 20;
> +	unsigned int spare = 11;
> +	unsigned int tail = 10;
> +	int usable_id, tail_id;
Can we define some meaningful macros instead magic numbers like this?
>   
> -	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 2, 0));
> +	if (!require_iov_config_or_skip(test))
> +		return;
Can we print a debug/info message which will be visible when the test is 
skipped?
>   
> -	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, 2), 0);
> -	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, 1), -ENOSPC);
> -	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable(idm, 0, 2), 0);
> +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, usable, shareable));
> +
> +	mutex_lock(idm_mutex(idm));
How about using guard() or scoped_guard() instead of mutex_lock()?
> +
> +	/* spare is larger than the overlap, but the PF-exclusive range is free. */
> +	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, usable - spare);
> +	KUNIT_EXPECT_GE(test, usable_id, 0);
> +	if (usable_id < 0) {
> +		mutex_unlock(idm_mutex(idm));
> +		return;
> +	}
> +
> +	tail_id = xe_guc_id_mgr_reserve_shareable_locked(idm, tail, spare);
> +	KUNIT_EXPECT_EQ(test, tail_id, usable);
> +	if (tail_id < 0) {
> +		idm_release_chunk_locked(idm, usable_id, usable - spare);
> +		mutex_unlock(idm_mutex(idm));
> +		return;
> +	}
> +
> +	KUNIT_EXPECT_EQ(test,
> +			xe_guc_id_mgr_reserve_shareable_locked(idm, 1, spare), -EDQUOT);
> +
> +	idm_release_chunk_locked(idm, usable_id, usable - spare);
> +	idm_release_chunk_locked(idm, tail_id, tail);
> +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
> +
> +	mutex_unlock(idm_mutex(idm));
>   }
>   
>   static void check_all(struct kunit *test)
>   {
>   	struct xe_guc_id_mgr *idm = test->priv;
>   	unsigned int n;
> +	int id;
>   
>   	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, 0));
>   
>   	mutex_lock(idm_mutex(idm));

Same comment for mutex here.

> -	for (n = 0; n < idm_total(idm); n++)
> -		KUNIT_EXPECT_LE(test, 0, xe_guc_id_mgr_reserve_usable_locked(idm, 1));
> -	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), idm_total(idm));
> +	for (n = 0; n < idm_total(idm); n++) {
> +		id = xe_guc_id_mgr_reserve_usable_locked(idm, 1);
> +		KUNIT_EXPECT_GE(test, id, 0);
> +		if (id < 0)
> +			break;
> +	}
> +	if (n < idm_total(idm)) {
> +		if (n)
> +			idm_release_chunk_locked(idm, 0, n);
> +		mutex_unlock(idm_mutex(idm));
> +		return;
> +	}
> +
> +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), idm_total(idm));
>   	for (n = 0; n < idm_total(idm); n++)
>   		idm_release_chunk_locked(idm, n, 1);
>   
>   	mutex_unlock(idm_mutex(idm));
>   }
>   
> +static void check_limits(struct kunit *test)
> +{
> +	struct xe_guc_id_mgr *idm = test->priv;
> +
> +	if (!require_iov_config_or_skip(test))
> +		return;
> +
> +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 10, 20));
> +
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_usable(idm), 10);
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_shareable(idm), 20);
> +	KUNIT_EXPECT_EQ(test, idm_total(idm), 30);
> +}

Use some macros instead of magic numbers. Same comment at other places 
in the file.

-Satya.

> +
> +static void check_overlap(struct kunit *test)
> +{
> +	struct xe_guc_id_mgr *idm = test->priv;
> +
> +	if (!require_iov_config_or_skip(test))
> +		return;
> +
> +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, GUC_ID_MAX));
> +
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_usable(idm), GUC_ID_MAX);
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_shareable(idm), GUC_ID_MAX);
> +	KUNIT_EXPECT_EQ(test, idm_total(idm), GUC_ID_MAX);
> +}
> +
> +static void check_overlap_alloc(struct kunit *test)
> +{
> +	struct xe_guc_id_mgr *idm = test->priv;
> +	unsigned int total;
> +	int usable_id, shareable_id;
> +
> +	if (!require_iov_config_or_skip(test))
> +		return;
> +
> +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, GUC_ID_MAX));
> +
> +	mutex_lock(idm_mutex(idm));
> +	total = idm_total(idm);
> +
> +	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, 2);
> +	KUNIT_EXPECT_EQ(test, usable_id, 0);
> +	if (usable_id < 0) {
> +		mutex_unlock(idm_mutex(idm));
> +		return;
> +	}
> +
> +	shareable_id = xe_guc_id_mgr_reserve_shareable_locked(idm, 3, 0);
> +	KUNIT_EXPECT_EQ(test, shareable_id, total - 3);
> +	if (shareable_id < 0) {
> +		idm_release_chunk_locked(idm, usable_id, 2);
> +		mutex_unlock(idm_mutex(idm));
> +		return;
> +	}
> +
> +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 5);
> +	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 5);
> +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 5);
> +
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, usable_id, 2), 0);
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, shareable_id, 3), 0);
> +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
> +
> +	mutex_unlock(idm_mutex(idm));
> +}
> +
> +static void check_overlap_release(struct kunit *test)
> +{
> +	struct xe_guc_id_mgr *idm = test->priv;
> +	unsigned int total;
> +	int id;
> +
> +	if (!require_iov_config_or_skip(test))
> +		return;
> +
> +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, GUC_ID_MAX));
> +
> +	mutex_lock(idm_mutex(idm));
> +	total = idm_total(idm);
> +
> +	id = xe_guc_id_mgr_reserve_usable_locked(idm, 4);
> +	KUNIT_EXPECT_EQ(test, id, 0);
> +	if (id < 0) {
> +		mutex_unlock(idm_mutex(idm));
> +		return;
> +	}
> +
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, id, 4), 0);
> +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
> +
> +	id = xe_guc_id_mgr_reserve_shareable_locked(idm, 4, 0);
> +	KUNIT_EXPECT_EQ(test, id, total - 4);
> +	if (id < 0) {
> +		mutex_unlock(idm_mutex(idm));
> +		return;
> +	}
> +
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, id, 4), 0);
> +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
> +
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, 0, 0), -EINVAL);
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, 0, 0), -EINVAL);
> +
> +	mutex_unlock(idm_mutex(idm));
> +}
> +
> +static void check_overlap_partial_init(struct kunit *test)
> +{
> +	struct xe_guc_id_mgr *idm = test->priv;
> +	unsigned int pools_size = (GUC_ID_MAX / 3) * 2;
> +	unsigned int shareable_start;
> +	unsigned int rest;
> +	int usable_id, shareable_id;
> +
> +	if (!require_iov_config_or_skip(test))
> +		return;
> +
> +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, pools_size, pools_size));
> +
> +	mutex_lock(idm_mutex(idm));
> +
> +	shareable_start = idm_shareable_start(idm);
> +	rest = idm_total(idm) - pools_size;
> +
> +	KUNIT_EXPECT_EQ(test, idm_total(idm), GUC_ID_MAX);
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_usable(idm), pools_size);
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_max_shareable(idm), pools_size);
> +	KUNIT_EXPECT_EQ(test, shareable_start, GUC_ID_MAX - pools_size);
> +
> +	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, pools_size);
> +	KUNIT_EXPECT_EQ(test, usable_id, 0);
> +	if (usable_id < 0) {
> +		mutex_unlock(idm_mutex(idm));
> +		return;
> +	}
> +
> +	shareable_id = xe_guc_id_mgr_reserve_shareable_locked(idm, rest, 0);
> +	KUNIT_EXPECT_EQ(test, shareable_id, pools_size);
> +	if (shareable_id < 0) {
> +		idm_release_chunk_locked(idm, usable_id, pools_size);
> +		mutex_unlock(idm_mutex(idm));
> +		return;
> +	}
> +
> +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), GUC_ID_MAX);
> +	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), pools_size);
> +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), pools_size);
> +
> +	KUNIT_EXPECT_EQ(test,
> +			xe_guc_id_mgr_release_usable_locked(idm, usable_id, pools_size), 0);
> +	KUNIT_EXPECT_EQ(test,
> +			xe_guc_id_mgr_release_shareable_locked(idm, shareable_id, rest), 0);
> +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
> +
> +	mutex_unlock(idm_mutex(idm));
> +}
> +
> +static void check_overlap_partial_shared_range_blocking(struct kunit *test)
> +{
> +	struct xe_guc_id_mgr *idm = test->priv;
> +	unsigned int pools_size = (GUC_ID_MAX / 3) * 2;
> +	int usable_id, shareable_range_id, shareable_overlap_id;
> +	unsigned int shareable_start;
> +	unsigned int nonoverlap_size;
> +	unsigned int overlap_size;
> +	unsigned int total;
> +
> +	if (!require_iov_config_or_skip(test))
> +		return;
> +
> +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, pools_size, pools_size));
> +
> +	mutex_lock(idm_mutex(idm));
> +
> +	total = idm_total(idm);
> +	shareable_start = idm_shareable_start(idm);
> +	nonoverlap_size = total - pools_size;
> +	overlap_size = pools_size - shareable_start;
> +
> +	KUNIT_EXPECT_GT(test, nonoverlap_size, 0);
> +	KUNIT_EXPECT_GT(test, overlap_size, 0);
> +
> +	shareable_range_id = xe_guc_id_mgr_reserve_shareable_locked(idm, nonoverlap_size, 0);
> +	KUNIT_EXPECT_EQ(test, shareable_range_id, pools_size);
> +	if (shareable_range_id < 0) {
> +		mutex_unlock(idm_mutex(idm));
> +		return;
> +	}
> +
> +	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, pools_size);
> +	KUNIT_EXPECT_EQ(test, usable_id, 0);
> +	if (usable_id < 0) {
> +		idm_release_chunk_locked(idm, shareable_range_id, nonoverlap_size);
> +		mutex_unlock(idm_mutex(idm));
> +		return;
> +	}
> +
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_shareable_locked(idm, 1, 0), -ENOSPC);
> +
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, usable_id, pools_size), 0);
> +
> +	shareable_overlap_id = xe_guc_id_mgr_reserve_shareable_locked(idm, overlap_size, 0);
> +	KUNIT_EXPECT_EQ(test, shareable_overlap_id, shareable_start);
> +	if (shareable_overlap_id < 0) {
> +		idm_release_chunk_locked(idm, shareable_range_id, nonoverlap_size);
> +		mutex_unlock(idm_mutex(idm));
> +		return;
> +	}
> +
> +	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, shareable_start);
> +	KUNIT_EXPECT_EQ(test, usable_id, 0);
> +	if (usable_id < 0) {
> +		idm_release_chunk_locked(idm, shareable_overlap_id, overlap_size);
> +		idm_release_chunk_locked(idm, shareable_range_id, nonoverlap_size);
> +		mutex_unlock(idm_mutex(idm));
> +		return;
> +	}
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable_locked(idm, 1), -ENOSPC);
> +
> +	KUNIT_EXPECT_EQ(test,
> +			xe_guc_id_mgr_release_usable_locked(idm, usable_id, shareable_start),
> +			0);
> +	KUNIT_EXPECT_EQ(test,
> +			xe_guc_id_mgr_release_shareable_locked(idm, shareable_overlap_id,
> +							       overlap_size),
> +			0);
> +	KUNIT_EXPECT_EQ(test,
> +			xe_guc_id_mgr_release_shareable_locked(idm, shareable_range_id,
> +							       nonoverlap_size),
> +			0);
> +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
> +
> +	mutex_unlock(idm_mutex(idm));
> +}
> +
> +static void check_used_usable(struct kunit *test)
> +{
> +	struct xe_guc_id_mgr *idm = test->priv;
> +	int id;
> +
> +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 8, 0));
> +
> +	mutex_lock(idm_mutex(idm));
> +
> +	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 0);
> +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 0);
> +
> +	id = xe_guc_id_mgr_reserve_usable_locked(idm, 2);
> +	KUNIT_EXPECT_GE(test, id, 0);
> +	if (id < 0) {
> +		mutex_unlock(idm_mutex(idm));
> +		return;
> +	}
> +
> +	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 2);
> +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 0);
> +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 2);
> +
> +	idm_release_chunk_locked(idm, id, 2);
> +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
> +
> +	mutex_unlock(idm_mutex(idm));
> +}
> +
> +static void check_used_shareable(struct kunit *test)
> +{
> +	struct xe_guc_id_mgr *idm = test->priv;
> +	unsigned int shareable_start;
> +	int id;
> +
> +	if (!require_iov_config_or_skip(test))
> +		return;
> +
> +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 8, 8));
> +
> +	mutex_lock(idm_mutex(idm));
> +	shareable_start = idm_shareable_start(idm);
> +
> +	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 0);
> +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 0);
> +
> +	id = xe_guc_id_mgr_reserve_shareable_locked(idm, 3, 0);
> +	KUNIT_EXPECT_EQ(test, id, shareable_start);
> +	if (id < 0) {
> +		mutex_unlock(idm_mutex(idm));
> +		return;
> +	}
> +
> +	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 0);
> +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 3);
> +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 3);
> +
> +	idm_release_chunk_locked(idm, id, 3);
> +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
> +
> +	mutex_unlock(idm_mutex(idm));
> +}
> +
> +static void check_used_mixed(struct kunit *test)
> +{
> +	struct xe_guc_id_mgr *idm = test->priv;
> +	unsigned int shareable_start;
> +	int usable_id, shareable_id;
> +
> +	if (!require_iov_config_or_skip(test))
> +		return;
> +
> +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 8, 8));
> +
> +	mutex_lock(idm_mutex(idm));
> +	shareable_start = idm_shareable_start(idm);
> +
> +	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, 2);
> +	KUNIT_EXPECT_EQ(test, usable_id, 0);
> +	if (usable_id < 0) {
> +		mutex_unlock(idm_mutex(idm));
> +		return;
> +	}
> +
> +	shareable_id = xe_guc_id_mgr_reserve_shareable_locked(idm, 3, 0);
> +	KUNIT_EXPECT_EQ(test, shareable_id, shareable_start);
> +	if (shareable_id < 0) {
> +		idm_release_chunk_locked(idm, usable_id, 2);
> +		mutex_unlock(idm_mutex(idm));
> +		return;
> +	}
> +
> +	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 2);
> +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 3);
> +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 5);
> +
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, usable_id, 2), 0);
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, shareable_id, 3), 0);
> +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
> +
> +	mutex_unlock(idm_mutex(idm));
> +}
> +
> +static void check_release_usable_range(struct kunit *test)
> +{
> +	struct xe_guc_id_mgr *idm = test->priv;
> +	int id;
> +
> +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 8, 0));
> +
> +	mutex_lock(idm_mutex(idm));
> +
> +	id = xe_guc_id_mgr_reserve_usable_locked(idm, 4);
> +	KUNIT_EXPECT_EQ(test, id, 0);
> +	if (id < 0) {
> +		mutex_unlock(idm_mutex(idm));
> +		return;
> +	}
> +
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, 4, 7), -ERANGE);
> +	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 4);
> +
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, 0, 0), -EINVAL);
> +	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 4);
> +
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable_locked(idm, id, 4), 0);
> +	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 0);
> +
> +	mutex_unlock(idm_mutex(idm));
> +}
> +
> +static void check_release_shareable_range(struct kunit *test)
> +{
> +	struct xe_guc_id_mgr *idm = test->priv;
> +	unsigned int shareable_start;
> +	int id;
> +
> +	if (!require_iov_config_or_skip(test))
> +		return;
> +
> +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 8, 8));
> +
> +	mutex_lock(idm_mutex(idm));
> +
> +	shareable_start = idm_shareable_start(idm);
> +	id = xe_guc_id_mgr_reserve_shareable_locked(idm, 4, 0);
> +	KUNIT_EXPECT_EQ(test, id, shareable_start);
> +	if (id < 0) {
> +		mutex_unlock(idm_mutex(idm));
> +		return;
> +	}
> +
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, 4, 7), -ERANGE);
> +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 4);
> +
> +	KUNIT_EXPECT_EQ(test,
> +			xe_guc_id_mgr_release_shareable_locked(idm, shareable_start, 0),
> +			-EINVAL);
> +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 4);
> +
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_shareable_locked(idm, id, 4), 0);
> +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 0);
> +
> +	mutex_unlock(idm_mutex(idm));
> +}
> +
> +static void check_split_boundaries(struct kunit *test)
> +{
> +	struct xe_guc_id_mgr *idm = test->priv;
> +	unsigned int shareable_start;
> +	int usable_id, shareable_id;
> +
> +	if (!require_iov_config_or_skip(test))
> +		return;
> +
> +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 4, 4));
> +
> +	mutex_lock(idm_mutex(idm));
> +
> +	shareable_start = idm_shareable_start(idm);
> +
> +	usable_id = xe_guc_id_mgr_reserve_usable_locked(idm, 4);
> +	KUNIT_EXPECT_EQ(test, usable_id, 0);
> +	if (usable_id < 0) {
> +		mutex_unlock(idm_mutex(idm));
> +		return;
> +	}
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable_locked(idm, 1), -ENOSPC);
> +
> +	shareable_id = xe_guc_id_mgr_reserve_shareable_locked(idm, 4, 0);
> +	KUNIT_EXPECT_EQ(test, shareable_id, shareable_start);
> +	if (shareable_id < 0) {
> +		idm_release_chunk_locked(idm, usable_id, 4);
> +		mutex_unlock(idm_mutex(idm));
> +		return;
> +	}
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_shareable_locked(idm, 1, 0), -ENOSPC);
> +
> +	KUNIT_EXPECT_EQ(test, idm_used_usable(idm), 4);
> +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 4);
> +
> +	idm_release_chunk_locked(idm, usable_id, 4);
> +	idm_release_chunk_locked(idm, shareable_id, 4);
> +	KUNIT_EXPECT_EQ(test, test_idm_used_total(idm), 0);
> +
> +	mutex_unlock(idm_mutex(idm));
> +}
> +
> +static void check_shareable_spare(struct kunit *test)
> +{
> +	struct xe_guc_id_mgr *idm = test->priv;
> +	unsigned int pools_size = (GUC_ID_MAX / 3) * 2;
> +	unsigned int shareable_start;
> +	unsigned int overlap_size;
> +	unsigned int shared_tail;
> +	int id_tail, id_overlap, id_extra;
> +
> +	if (!require_iov_config_or_skip(test))
> +		return;
> +
> +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, pools_size, pools_size));
> +
> +	mutex_lock(idm_mutex(idm));
> +	shareable_start = idm_shareable_start(idm);
> +	overlap_size = idm->usable - shareable_start;
> +	shared_tail = idm_total(idm) - idm->usable;
> +
> +	KUNIT_EXPECT_GT(test, overlap_size, 0);
> +	KUNIT_EXPECT_GT(test, shared_tail, 0);
> +
> +	id_tail = xe_guc_id_mgr_reserve_shareable_locked(idm, shared_tail, 1);
> +	KUNIT_EXPECT_EQ(test, id_tail, idm->usable);
> +	if (id_tail < 0) {
> +		mutex_unlock(idm_mutex(idm));
> +		return;
> +	}
> +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), shared_tail);
> +
> +	id_overlap = xe_guc_id_mgr_reserve_shareable_locked(idm, overlap_size - 1, 1);
> +	KUNIT_EXPECT_EQ(test, id_overlap, shareable_start + 1);
> +	if (id_overlap < 0) {
> +		idm_release_chunk_locked(idm, id_tail, shared_tail);
> +		mutex_unlock(idm_mutex(idm));
> +		return;
> +	}
> +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), idm->shareable - 1);
> +
> +	id_extra = xe_guc_id_mgr_reserve_shareable_locked(idm, 1, 1);
> +	KUNIT_EXPECT_EQ(test, id_extra, shareable_start);
> +	if (id_extra < 0) {
> +		idm_release_chunk_locked(idm, id_tail, shared_tail);
> +		idm_release_chunk_locked(idm, id_overlap, overlap_size - 1);
> +		mutex_unlock(idm_mutex(idm));
> +		return;
> +	}
> +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), idm->shareable);
> +
> +	idm_release_chunk_locked(idm, id_tail, shared_tail);
> +	idm_release_chunk_locked(idm, id_overlap, overlap_size - 1);
> +	idm_release_chunk_locked(idm, id_extra, 1);
> +	KUNIT_EXPECT_EQ(test, idm_used_shareable(idm), 0);
> +
> +	mutex_unlock(idm_mutex(idm));
> +}
> +
> +static void check_shareable_spare_fragmented_tail(struct kunit *test)
> +{
> +	struct xe_guc_id_mgr *idm = test->priv;
> +	unsigned int usable = GUC_ID_MAX - 50;
> +	unsigned int shareable = 90;
> +	unsigned int shareable_start;
> +	unsigned int overlap_size;
> +	unsigned int count = 39;
> +	unsigned int spare = 10;
> +	unsigned int i;
> +
> +	if (!require_iov_config_or_skip(test))
> +		return;
> +
> +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, usable, shareable));
> +
> +	mutex_lock(idm_mutex(idm));
> +	shareable_start = idm_shareable_start(idm);
> +	overlap_size = idm->usable - shareable_start;
> +	KUNIT_EXPECT_EQ(test, overlap_size, 40);
> +
> +	bitmap_fill(idm->bitmap, idm_total(idm));
> +	bitmap_set(idm->bitmap, 0, 1);
> +	bitmap_clear(idm->bitmap, shareable_start + 1, overlap_size - 1);
> +	for (i = idm->usable; i < idm_total(idm); i++) {
> +		if ((i - idm->usable) % 5)
> +			bitmap_clear(idm->bitmap, i, 1);
> +	}
> +
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_shareable_locked(idm, count, spare),
> +			-EDQUOT);
> +
> +	bitmap_fill(idm->bitmap, idm_total(idm));
> +	bitmap_clear(idm->bitmap, shareable_start, 30);
> +	bitmap_clear(idm->bitmap, idm_total(idm) - 20, 20);
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_shareable_locked(idm, 30, 1),
> +			-EDQUOT);
> +
> +	bitmap_zero(idm->bitmap, idm_total(idm));
> +
> +	mutex_unlock(idm_mutex(idm));
> +}
> +
>   static struct kunit_case guc_id_mgr_test_cases[] = {
>   	KUNIT_CASE(bad_init),
>   	KUNIT_CASE(no_init),
> @@ -109,6 +733,20 @@ static struct kunit_case guc_id_mgr_test_cases[] = {
>   	KUNIT_CASE(check_used),
>   	KUNIT_CASE(check_quota),
>   	KUNIT_CASE_SLOW(check_all),
> +	KUNIT_CASE(check_limits),
> +	KUNIT_CASE(check_overlap),
> +	KUNIT_CASE(check_overlap_alloc),
> +	KUNIT_CASE(check_overlap_release),
> +	KUNIT_CASE(check_overlap_partial_init),
> +	KUNIT_CASE(check_overlap_partial_shared_range_blocking),
> +	KUNIT_CASE(check_used_usable),
> +	KUNIT_CASE(check_used_shareable),
> +	KUNIT_CASE(check_used_mixed),
> +	KUNIT_CASE(check_release_usable_range),
> +	KUNIT_CASE(check_release_shareable_range),
> +	KUNIT_CASE(check_split_boundaries),
> +	KUNIT_CASE(check_shareable_spare),
> +	KUNIT_CASE(check_shareable_spare_fragmented_tail),
>   	{}
>   };
>   
