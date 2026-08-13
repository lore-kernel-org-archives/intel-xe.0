Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AD0C5CFDB
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 08:39:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6402710F1E5;
	Thu, 13 Aug 2026 08:39:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZDEyAmAd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B36B10F1E5
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 08:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786610346; x=1818146346;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=ygWxnlO06sLM3/d/ROSyypvLlIy6HmGTd9b5Wi4KuL0=;
 b=ZDEyAmAdTYxWPWEQdMpAidC9193PDyLvsTeMuP/lbQ9tDn+f6UBqR5BB
 1gQwcB5rYn6jtRu6ZkaZ+jxKnY+s78F64giDFPt3Wl3npWDcPTCRptWyD
 B6impt5XVVzsvVGtlsPA0GJMlL7wwPMG3viDUlI+jCobZGZjPzFCW3GOs
 DzA7hmm5W0VUMEuewEe+MOwKgxaqiD4cCvF7LV3LKqIhBA+bxZuAuU3xP
 KsssvZCnp7sokU/lo7mnRplyrDs5dEMrDbe9RQ8ALp3K8+QnB/dylNou2
 C1imZfvQfPEsOa4AZGQRwnMH0ENiiRyrBFr3DonVNo1h52PYqw2aD5qmI g==;
X-CSE-ConnectionGUID: X0PrEHFsR7uy+Ukml8mt8g==
X-CSE-MsgGUID: lUNP3l38TcuxrpQxbOR9Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87303908"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208,217";a="87303908"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 01:39:06 -0700
X-CSE-ConnectionGUID: fD7q4LaKQkmkD/nzdzU2zw==
X-CSE-MsgGUID: 0iSSHYxURqS5v+VYqiw8Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
 d="scan'208,217";a="263420453"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 01:39:05 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 01:39:05 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 01:39:05 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.37) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 01:39:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V0yw30ieLHNCxWn89w4FZE7SSOkkJjZM9g/zchpDkawytnVGXTCbycy3vnzpOwvSpqG6p+X969BEzYDsyudeBP/+FEpsSMrW61GQKWmNOh8jAOh50uXnlP7GWR2p/O102eeCzyOHmqrZKMxsaXP/yiK/pGyhQ2H8tT2i3Sd2TnH2op282holQ9qUETECPbgx1pWKBbMAnOrfpK7erz85XVv+sGmWdLHtXFTp/0nwl3476Xvl0XYhLO9aT224zvMrDu1fU/Erv5+uQGg7KooAmuYMDNZ2/BYUVkTmNPAhhp+HSx0KlWqeQGXylmF8UbwZmvs5znixja3jhxnF/q/pxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+aqGUq0UT1GBhUNrVWmE1L5queRSjFjT7WF5X6oq90I=;
 b=ckMTr2hm4HYvT75ZSDDQ9NOth7Z5k77a8UmnrCy/C7p6ZPBlO0pCWGoNcRQVVjzvXQKhWW0N8VZ6H+p4H9ea/j8tkivtITY6BLIMn8tV/crJaL74KXTxgtdqLBu443mxTP9vB1pGC+A6yl6l/9GwWGADXrK9ezD6mmkTlR+Ro2EGoi6UVs32A6ZsSTKGbMgEZt1wGR09E+1NWNwfeAcOV9MaKxuckSf22YaZ6C5kNw+tAcn3KfZ1Su8VEBXfZMvHM1bUpHM402+2XqzSYOaJbh58JTn1fCU45l0LCh01Zan5yChI0ky+byVGncdvjcfKzu0FDIOBOjXkIXh8MKDRjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by CY8PR11MB7845.namprd11.prod.outlook.com (2603:10b6:930:72::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Thu, 13 Aug
 2026 08:38:59 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0292.024; Thu, 13 Aug 2026
 08:38:59 +0000
Content-Type: multipart/alternative;
 boundary="------------RG8Ggb36VEB5tULTBT2tps62"
Message-ID: <d587a47d-003b-4d20-9412-0ca47c8ce5b3@intel.com>
Date: Thu, 13 Aug 2026 14:08:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 20/32] drm/xe/survivability: Report 'boot status' using
 SIGID
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro
 <riana.tauro@intel.com>, Aravind Iddamsetty <aravind.iddamsetty@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-21-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260812191450.11690-21-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MA5PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::8) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|CY8PR11MB7845:EE_
X-MS-Office365-Filtering-Correlation-Id: cf60b4d3-4908-4efb-7ca3-08def91651ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|56012099006|4143699003|11063799006|8096899003|10067099003;
X-Microsoft-Antispam-Message-Info: kBMS2Th7v5XtDrEZv3H2f5g8kWJzJV1Cv9kYAL3xzzvkA0+6yKRMAeTfZQDP64/nmHnOtSF616UyT6ugfQ5JqdN153dAl0cmzXsnSCjJaLIYfv1XOH6ZbE6IvI0gGHzhKRw84y9A4EiCSY7HEqrnrLV4NMbvcIjb/i9hjLoXcKfZdvEn5bEYEGMeX7yud8zBqa9wpQ1tnn2yx1i7WAkfUNVGh4UAUJCWDQzkStRMFLfBEnqPutnd+vvkePPUnkQsbx149UGAe2z5RKqsCttAb++9ROemZOVSiIMpx4H175tte7CCO+8sEWk5LIlSr8vAa2KGa+f+uNRYD/bct/Y7VDlxmkLfJ+u3CkMpWYIO19zFmaNg3KHvQVKSh2CIlbIUIymov6hsnH2wsj0Sqw16RZee4E8VmPg5oOuEmtz0xwUxPnylFRL9DsfNqgKggFM8nCWjTO2oUomvotq0631c4afyULdbLX9MxMGwK2himjlv0HIeLTkCbRLX+coSZVlXKGmZyeP+2zFClCaVlAmoii2FxoKK1z0WqOFk6bXFR0uhjt7HOywY0qaWXDUg+ZWTJ7TJHesfYyiYoUIP5PygYUmJ4IOv2NVhD/Zgu3+memB/MHzpJ/CCurbIFz9myapmiYhurKjQR/EIeieJBFEqa2ImyAqkSJ5tc21p7jZ/o0k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(8096899003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHpXSW9kMGxlUFFWeHloYk5qRm9yMmYrUTRSWkJDVnEweUx0MjBFT3VVU3dl?=
 =?utf-8?B?dVN0VVNkUThhMDdDemtVYTMrcGt2RXJ1NHZ4TUZVQWFoeU5wM2R4M0tCdFU3?=
 =?utf-8?B?SzJvMGRJeTNGeWt3L2oveXkxZ2x2eWhjb05zaXNTRlZRS0VwVnhON3h1QWcx?=
 =?utf-8?B?R2ZFZWI4Nms3Uk9wTmlaS3ljNlRXQVRKcUZRL05uRW1YN2lZdXdFN29Eam1x?=
 =?utf-8?B?cFUzaWoxK00zU0Jia2VzUFcyWjluU0ZMK3k5aDcrYXpLZlBpU0swZzZGTGRC?=
 =?utf-8?B?ZGNQN0NGQ2t5UklvNUdnTk52UXh0Mm1VWEs2NzVrOThZQWRtUk5sNEk4bmU2?=
 =?utf-8?B?dzM3Zm9SWGcvU1d6aFZ2MUl1clVGTkpCak9hTm1WMjF3OG05dnZWSC9ENVR2?=
 =?utf-8?B?VHpwRDhmaXZ3QXRFWmRSVmF5TmZNUlp6eXhmNlR1cUpzc1BwSm9ZdVFSQUt2?=
 =?utf-8?B?UjBQR1NWRDY5NDJjcmRMUHVhVlZFTDdtTVFSMWs5em5rbmdSamVUZUF6cWl3?=
 =?utf-8?B?YjQ2YkpOWC9ocnFuNlFXUE8yeU1hOGtmVEx3d1lPTk1WcDUydWNkcDRNUzNO?=
 =?utf-8?B?SHVKUk1mZWROKzQyN0xmbDQ1RzRqbUEwL1haZi9HTHFDZWFVdm1PZ0pKSkRB?=
 =?utf-8?B?YVRtOFBPbVRGNktFakY3NjVFTDFIRWpydVRKdDZxc2huSDRFQlhPYVllM2ZF?=
 =?utf-8?B?OGFtbWRGQVpuV004WGRaTUhqNlIvL29GcHNmaUwwVkNUb1R3L2huRUJ2bWYy?=
 =?utf-8?B?b1FOb2hoVFd4TmpZMWFBUzVVUTBmSGFBNzhHNE9GSnQ2aTVLVDJZWlZ3Wkdj?=
 =?utf-8?B?VWF1SGI1Ry9UMTUrRFQ1MDRNL2VLWk1CNklLcEQ1M2hhTy9kQVpSMi9VRTht?=
 =?utf-8?B?SWxMelovTVdFZnF2b0UvNG13WE9RRi9kMUFuVGJyTUF5S01BeXZtWGFPRmpB?=
 =?utf-8?B?NVlRcmJJSzVlWnJuekpQSlZhMXNNcnM3OUlxNEZZdEhiNEVyUjBVWnNJU0ZQ?=
 =?utf-8?B?eVZJT0FGNU0yblE5L3JQemQvTFBENXNQaFVXRDMya2dyTWdIWFFZa2dVSmov?=
 =?utf-8?B?UkpxRjFrSDkyTlVqV3VCVDFiS3E1eHlTZDd4SzlpWDF3MnhPeUwydFVhUnZy?=
 =?utf-8?B?VWxLangybTJnWGlwaFQ1YXUrc1ZuSEhwTU8vQVRJS2d6MHd6WVpsUUhzWnBJ?=
 =?utf-8?B?UEozcldxOTNrM0hML2ZkK1kyc0VyRUNTSTVvaHRvR0NHUTZSNmxqZTZ5SW45?=
 =?utf-8?B?NVlWdHl0ek5uNWRlR1J4N2pjbmppcWdsMXZvbThpaWdiWlJodittTEhmWk9u?=
 =?utf-8?B?Q2UzOHpFckFYUTZuZHc2Q1RMc0w1VTUrb0xUVzZvbUFZblVvUE1mMkxxU2Ev?=
 =?utf-8?B?T0h2V0dSM1lEZFArMGd4RGxSZ0dxSkNtMHM0SUgzb2J6akVid3BMVUltWWwv?=
 =?utf-8?B?d2pVZ0w0RGZmaHpnZ3lsVHJudjBOUjYzWjljM05yNHFmRFpJN1dsM29JYktV?=
 =?utf-8?B?a2Q1dGpScGZublZualJSYU9RbVpKbFAyNm9ybVZLYVpDajdKUGxOT2lucE5i?=
 =?utf-8?B?bEV0NWJidGZEaDlUeXJyT3JVQ01CVVZpL1Erb2psSzFHRndtWTVTWEtaTmNU?=
 =?utf-8?B?OVFNZk5tMXZDNExMR014VXJGTXJyRURMSEhjckp4UFVJZmNZT1ZTSndFek16?=
 =?utf-8?B?M09LM2V4RFBsSXBHOGk2SWtuUU54UEVWSW5ZWlFwcVBPWFVLbElGdUF2ZGZ2?=
 =?utf-8?B?QkJESTV2eEZrdURjNWtLTWdrZ3ZSTitDbXdYcjRrcmUrSFBML084M3BSTi96?=
 =?utf-8?B?ZDZpQXJ1UU0zcEhrZzQ1OU84aFNPcGZkTU1JWFpKRUVTSm5XTXl6dTd4OUhS?=
 =?utf-8?B?VlJEbDZnWUpUb2ZEWWpXZWc0ZE5oRFYrM3laTnZsK0ovTitrR3RrRXAvbEJo?=
 =?utf-8?B?bmthb1U1WU81VFVWd3FpRjBDZ1JEdjJJalhza3JjWU9NWmdPbGtPMGg3cnor?=
 =?utf-8?B?SytiV2IxVmtIVGRzdE5ydUQ5Q1VWQWtvUGl5cnJCYWRZeVd0ZHFWT3VPMm11?=
 =?utf-8?B?VVdhY3JDdVY5MEh4TzRjUWVtV1lGd2xBUlFlT0h3YWh4RStFOHV0cmxLYm5M?=
 =?utf-8?B?T1BFN3lRNjJyZGRlNFhoYkczeG5mdGJxUzJFb1NvcWNFVlJEZ21maGVOMG1u?=
 =?utf-8?B?bEhqdUx2bFpHb0hqN25NZ1hFdzN6RnVqeDJLUGlpb2l2MEhtc0NQQS9NYVZE?=
 =?utf-8?B?WjF2MTg3NlJoYUU0bWNxNlRrK2dWc1BtcjFPcjhPMkJ2WG9SNFh5QlM5Wnpw?=
 =?utf-8?B?YlI1VVByanpDY2dxajRtd3NFaVZ3WksvV0RtUEFuVDF2bmZYZ0ZMK3gzWlhr?=
 =?utf-8?Q?iccvraJP0GxUT4Pk=3D?=
X-Exchange-RoutingPolicyChecked: e/1Hwd1I8KDNzGlAUu2WvDVJKKUnMr+UhQVyp6jUC2XY54v6r/VCDZEQudXGYQ4+rn3LBDlfyKfJrP2EozJHe5VqXU0VjiwLUGmaGM34KqsyITjKegY0so4dXuI2M3Ps0upMLHtMUJ02Eil0APnrLFR0bB2Qm3sB2gWq20/M+kgLNhXf+LofBVYg9PGp0TA6hEZArkhYPabiWYXgFYGfn48nwe2wIS5Owpxju6Qpcsk3zNqI6xTWTUqHBl+hCo9KzehFW5/YZhhkE5fQ3wmMLnW7u6Zem3adPwju2srFUGttaMV2S5i6JEi7/v/fFl8QneStCG++QiLX0eZMO3s3pg==
X-MS-Exchange-CrossTenant-Network-Message-Id: cf60b4d3-4908-4efb-7ca3-08def91651ac
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 08:38:59.1395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 42L7FKZkdgfDtSORZMtUQThxFDabNCpefC7mplWa62AQfpLiwMFELi96tn4F0ekHRd/lixPVdpaMmST4VU8HnnA2QiRFA5MKKxjdAQ/6FeI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7845
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

--------------RG8Ggb36VEB5tULTBT2tps62
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 13-08-2026 12:44 am, Michal Wajdeczko wrote:
> Report 'boot status' details using xe_log_err_fatal/info() macros.
> While around, move static helper code closer to the caller and let
> it take xe instead of pdev.
>
> Signed-off-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi<rodrigo.vivi@intel.com>
> Cc: Riana Tauro<riana.tauro@intel.com>
> Cc: Aravind Iddamsetty<aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi<mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_survivability_mode.c | 35 ++++++++++++----------
>   1 file changed, 19 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 4c506027fa94..85b4c125a217 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -14,6 +14,7 @@
>   #include "xe_device.h"
>   #include "xe_heci_gsc.h"
>   #include "xe_i2c.h"
> +#include "xe_log.h"
>   #include "xe_mmio.h"
>   #include "xe_nvm.h"
>   #include "xe_pcode_api.h"
> @@ -172,21 +173,6 @@ static void populate_survivability_info(struct xe_device *xe)
>   	}
>   }
>   
> -static void log_survivability_info(struct pci_dev *pdev)
> -{
> -	struct xe_device *xe = pdev_to_xe_device(pdev);
> -	struct xe_survivability *survivability = &xe->survivability;
> -	u32 *info = survivability->info;
> -	int id;
> -
> -	dev_info(&pdev->dev, "Survivability Boot Status : Critical Failure (%d)\n",
> -		 survivability->boot_status);
> -	for (id = 0; id < MAX_SCRATCH_REG; id++) {
> -		if (info[id])
> -			dev_info(&pdev->dev, "%s: 0x%x\n", reg_map[id], info[id]);
> -	}
> -}
> -
>   static int check_boot_failure(struct xe_device *xe)
>   {
>   	struct xe_survivability *survivability = &xe->survivability;
> @@ -429,6 +415,23 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>   	dev_err(&pdev->dev, "Firmware flash required, Please refer to the userspace documentation for more details!\n");
>   }
>   
> +static void log_survivability_info(struct xe_device *xe)
> +{
> +	struct xe_survivability *survivability = &xe->survivability;
> +	u32 *info = survivability->info;
> +	int id;
> +
> +	xe_log_err_fatal(xe, SURVIVABILITY, -ENXIO, "Boot Status: %s (%u)\n",
> +			 survivability->boot_status == CRITICAL_FAILURE ?
> +			 "Critical Failure" : "Other", survivability->boot_status);

Since log_survivability_info is called when survivability->boot_status 
== CRITICAL_FAILURE true, so please use "Critical Failure"  string directly.

Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

> +
> +	for (id = 0; id < MAX_SCRATCH_REG; id++) {
> +		if (!info[id])
> +			continue;
> +		xe_log_info(xe, SURVIVABILITY, "%s: %#x\n", reg_map[id], info[id]);
> +	}
> +}
> +
>   /**
>    * xe_survivability_mode_boot_enable - Initialize and enable boot survivability mode
>    * @xe: xe device instance
> @@ -452,7 +455,7 @@ int xe_survivability_mode_boot_enable(struct xe_device *xe)
>   	 * v2 supports survivability mode for critical errors
>   	 */
>   	if (survivability->version < 2  && survivability->boot_status == CRITICAL_FAILURE) {
> -		log_survivability_info(pdev);
> +		log_survivability_info(xe);
>   		return -ENXIO;
>   	}
>   
--------------RG8Ggb36VEB5tULTBT2tps62
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 13-08-2026 12:44 am, Michal
      Wajdeczko wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260812191450.11690-21-michal.wajdeczko@intel.com">
      <pre wrap="" class="moz-quote-pre">Report 'boot status' details using xe_log_err_fatal/info() macros.
While around, move static helper code closer to the caller and let
it take xe instead of pdev.

Signed-off-by: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Cc: Rodrigo Vivi <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
Cc: Riana Tauro <a class="moz-txt-link-rfc2396E" href="mailto:riana.tauro@intel.com">&lt;riana.tauro@intel.com&gt;</a>
Cc: Aravind Iddamsetty <a class="moz-txt-link-rfc2396E" href="mailto:aravind.iddamsetty@intel.com">&lt;aravind.iddamsetty@intel.com&gt;</a>
Cc: Mallesh Koujalagi <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com">&lt;mallesh.koujalagi@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 35 ++++++++++++----------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 4c506027fa94..85b4c125a217 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -14,6 +14,7 @@
 #include &quot;xe_device.h&quot;
 #include &quot;xe_heci_gsc.h&quot;
 #include &quot;xe_i2c.h&quot;
+#include &quot;xe_log.h&quot;
 #include &quot;xe_mmio.h&quot;
 #include &quot;xe_nvm.h&quot;
 #include &quot;xe_pcode_api.h&quot;
@@ -172,21 +173,6 @@ static void populate_survivability_info(struct xe_device *xe)
 	}
 }
 
-static void log_survivability_info(struct pci_dev *pdev)
-{
-	struct xe_device *xe = pdev_to_xe_device(pdev);
-	struct xe_survivability *survivability = &amp;xe-&gt;survivability;
-	u32 *info = survivability-&gt;info;
-	int id;
-
-	dev_info(&amp;pdev-&gt;dev, &quot;Survivability Boot Status : Critical Failure (%d)\n&quot;,
-		 survivability-&gt;boot_status);
-	for (id = 0; id &lt; MAX_SCRATCH_REG; id++) {
-		if (info[id])
-			dev_info(&amp;pdev-&gt;dev, &quot;%s: 0x%x\n&quot;, reg_map[id], info[id]);
-	}
-}
-
 static int check_boot_failure(struct xe_device *xe)
 {
 	struct xe_survivability *survivability = &amp;xe-&gt;survivability;
@@ -429,6 +415,23 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
 	dev_err(&amp;pdev-&gt;dev, &quot;Firmware flash required, Please refer to the userspace documentation for more details!\n&quot;);
 }
 
+static void log_survivability_info(struct xe_device *xe)
+{
+	struct xe_survivability *survivability = &amp;xe-&gt;survivability;
+	u32 *info = survivability-&gt;info;
+	int id;
+
+	xe_log_err_fatal(xe, SURVIVABILITY, -ENXIO, &quot;Boot Status: %s (%u)\n&quot;,
+			 survivability-&gt;boot_status == CRITICAL_FAILURE ?
+			 &quot;Critical Failure&quot; : &quot;Other&quot;, survivability-&gt;boot_status);</pre>
    </blockquote>
    <p>Since&nbsp;<span style="white-space: pre-wrap">log_survivability_info</span>&nbsp;is
      called when&nbsp;<span style="white-space: pre-wrap">survivability-&gt;boot_status == CRITICAL_FAILURE true, so please use </span><span style="white-space: pre-wrap">&quot;Critical Failure&quot;</span>&nbsp; string
      directly.</p>
    <p>Reviewed-by: Mallesh Koujalagi
      <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com">&lt;mallesh.koujalagi@intel.com&gt;</a></p>
    <blockquote type="cite" cite="mid:20260812191450.11690-21-michal.wajdeczko@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+	for (id = 0; id &lt; MAX_SCRATCH_REG; id++) {
+		if (!info[id])
+			continue;
+		xe_log_info(xe, SURVIVABILITY, &quot;%s: %#x\n&quot;, reg_map[id], info[id]);
+	}
+}
+
 /**
  * xe_survivability_mode_boot_enable - Initialize and enable boot survivability mode
  * @xe: xe device instance
@@ -452,7 +455,7 @@ int xe_survivability_mode_boot_enable(struct xe_device *xe)
 	 * v2 supports survivability mode for critical errors
 	 */
 	if (survivability-&gt;version &lt; 2  &amp;&amp; survivability-&gt;boot_status == CRITICAL_FAILURE) {
-		log_survivability_info(pdev);
+		log_survivability_info(xe);
 		return -ENXIO;
 	}
 
</pre>
    </blockquote>
  </body>
</html>

--------------RG8Ggb36VEB5tULTBT2tps62--
