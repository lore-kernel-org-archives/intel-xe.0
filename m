Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504BBC43458
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 12:29:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E13910E07B;
	Tue,  7 Jul 2026 12:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YuJ82NMw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C102410E07B
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jul 2026 12:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783427371; x=1814963371;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=dJGftPP0i4PYuVPddLHooLcVCmqsXZk+vwzcJAWBzTU=;
 b=YuJ82NMwfOGvUwcSg5Ghn2z35USeX+Zh726jB3GZ5GvRJhp+LG//DVgo
 vTWsOtaRKxRHdYfMozYJHDjxL09/qGo35d0cR4aKbyZXpHFi6AbpGjRXw
 dYp9ujoBfDy7i1oWMp8/fmVoPmYM+o6wAlsuzPueb3ByEo6MwJKE9dkz0
 kJLzvQ85j9mcORIiRc/buMehW7Ri1a11h3wkh/v9DyEyB0Odi/nrToF8F
 NupDHLqm+2dfxyjeZTV750NsInO54AftnBsiIeFXxWjAsdH+mF4Lk5Xkj
 GaBmOiA06wvJnTRCcN3yfftPu+4wYpNn6og9Y7hbUmNFHZdRauodOeYe6 w==;
X-CSE-ConnectionGUID: JxyIJyI5Rz+TiWkGzuCEqw==
X-CSE-MsgGUID: /YnYc1TYQHqzcFxzZCfOHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="101617974"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
 d="scan'208,217";a="101617974"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 05:29:30 -0700
X-CSE-ConnectionGUID: Xo4YCcIkQwaOBHR0zS/G9Q==
X-CSE-MsgGUID: Ieznh+NnRlaiIgzrK4bPPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
 d="scan'208,217";a="249999597"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 05:29:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 7 Jul 2026 05:29:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 7 Jul 2026 05:29:29 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.53)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 7 Jul 2026 05:29:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aVawePBKQS+6dh7VnZQHjlcEk7bFcx9/BGqDrYMvo2ZsDuBgoGROWgEt/pktcUw2iRpP8Nshp+58CE3dB4724QHm8pTMlxlylT4rh0rhfmTT/LuZXXRSBwStkbgBmw6RdO2Jyrn7psfrVxPuefNbWhGZG0lQz5mpUgI+UGVkvXPxiG3yeBuzfe0R2EOA1eu8UeBL3bmteDfAYBPTEF99qdbe7JhT+1CegLTcq243HgzSSbsv9N/drjCcVG4xQtZ/fJNYyfpp3i0VoFqVaETV/Y7K6lHZCqwx1Q6gKErajagZKPa91TdKJKObmIBmlZLTt0g62lu2SlR7WtktzPg54A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NeURqqp5VqJci0MXy2wO3MWZfMioRCwfYXx6qQ+L8fI=;
 b=Uof5KAioqYc0rb9BZQl+JzxssWRlNV5j6QciiPVBNcQV/+u8ISlJocUkFA1HqyZELmg3Mwpxp/LFqguF14xvDesyMZKoxMmUBE0a5KewkGIVS2+Y9FRnixISwNQfNxfFe26joedNQsXz3ORTNFTTTVo/mRyTmsIqRPCiqbKSEDzoidbDo1x/J53hn+NKp8U5KtteLXWP9i9iX8qTUvqYB6dxPwJduMGzw4VGg1/huVETbiLbJVb6czDzblbKRZ4SkaDfLbnd74kYoMZy8vaGPMte25uy+r8zTLX7rw40n2kUJ8B9q6VY5euWZF88zGkLiRNI5yNtl+7C7PGgHt6LJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by PH7PR11MB7146.namprd11.prod.outlook.com (2603:10b6:510:1ed::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Tue, 7 Jul
 2026 12:29:25 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0181.008; Tue, 7 Jul 2026
 12:29:24 +0000
Content-Type: multipart/alternative;
 boundary="------------O42xsg0r41OLhRpTk1sbH2im"
Message-ID: <8e4cf7dd-9985-4cd6-8e5a-3fc4009726cc@intel.com>
Date: Tue, 7 Jul 2026 17:59:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/7] drm/xe/xe_ras: Add support to retrieve info queue
 data for CRI
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <daniele.ceraolospurio@intel.com>, <raag.jadav@intel.com>,
 <riana.tauro@intel.com>, <aravind.iddamsetty@intel.com>
References: <20260702111401.3680214-9-badal.nilawar@intel.com>
 <20260702111401.3680214-11-badal.nilawar@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260702111401.3680214-11-badal.nilawar@intel.com>
X-ClientProxiedBy: MA5P287CA0162.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::17) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|PH7PR11MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: 02df64d5-b4ca-4ecb-d514-08dedc236140
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|56012099006|3023799007|4143699003|8096899003|5023799004|11063799006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: FmqFP5AzAfkIxdy07REiLRmEDYAGVAlcQeS/CLeyGUrYTjEDONALjuauRBe2An8QKs2IdHqhuw0GsYcTd/xdjnZiTD/EXZS/xPUF2wWR/p4PpPxrzvKKTPAM3OPcugqYj6Fcxj6kj6Y2fLKXt2fIHVzI2gOq63o8dhuYZJaqI2gaP77XSJSCT8huZDm3EhbMyK0MDwgWv28aCMuivsgWVkjVciHl8UT1u3IRCYMr1AaRCurnSW0A5rH1zoHf/W2S3zyXuis9lxnMe0KApBhsfgPoMaJAPnbrDp5FqbbU/rkNfCL/KsnlhwyDpsV36zxW3fXKUh9uiGTaStf5gauyruSL7PkULl4lDB4A2OSqyGFq8McHww7DM91yFR/1FOEaYk1qICoPrROZ4A09eGwpkAn+mKblERio9UZ9ljAPKZvKRhjfKw/3yBwgXwvoCVKZ20jEd472jFOJmoAcgq6iPEU3aKq+ul4SXoQ9b8HkNqCsDwfrbze6ofUptfGpuyJTNz/6R81P9BSHAjnyXmkhturBXiQTdmLK7F8KyVdnpEGH9Khome0Z+ewHbd7bDR8iSjmh33ZxZhfyI52FZHXiwFtGwSWGTS0boao8oMlS7FiXzHpQCI+DXh2LZ4O8hg5QneB4NzhNL3C809Lyg5pIzqTSWMiRRrp91b1QsSKG8FY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(56012099006)(3023799007)(4143699003)(8096899003)(5023799004)(11063799006)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z09JWmlWTGt3cjNBZy9hWVlCWFJXUUdVTWtXMTdkekpobU9tNFJSZm5iZ2VF?=
 =?utf-8?B?b0NYUnExU2VxVEdIeGxkK0NKME1hQjdwWHgrTDRZNkEzMTN4WnVzbTlhNEVL?=
 =?utf-8?B?NExaaUxXR2QrV0Z5K2ZCRUJmdk1FclVQVWVzMS80b0p6S0lqMUs4YlVUZG9J?=
 =?utf-8?B?dFcwTEd6VmhsZWZLL1h4UmxoYjFLUGNjek1DSW1UMUV1N0dFTDcvaEYvWDc0?=
 =?utf-8?B?NlRSOXYzVTkwY2xLc3FxSHlYaWhLL0ZTak5wSkpnV1hGL1VXL29nMEw2dFJB?=
 =?utf-8?B?VWxNNW1YaUR0L0pYTzFPbE5Fb3dSdnM4alJwTC9ZNjZBTVp6TWJmL0l5aU5O?=
 =?utf-8?B?RG9oMnZIVHZWeFlEOFJwU2tvTGthZllmYndwZkpaWlJyV3YzS01CNWpNNkZz?=
 =?utf-8?B?SE15TTJ4L2xCakU0QnBQdWtMRnQ5VGxNcEdmeEtQWFUxbXV4Sm1PSFBlRVpJ?=
 =?utf-8?B?ZGo5OVkyV2t2OWphQ2ZucllvL0RpY0ZTRjRtZFAwZ0hXeCt2RjJhaDFsa2RH?=
 =?utf-8?B?MU9uSDR4UEo2M1VFYnVKdHU2NGpNNEhWWTQ4eERVTXVHVkczck14MGNJZWRs?=
 =?utf-8?B?aEw3SkI2Q295TXkxcU9vNzMyUzJ2UWJoRks4MjlteC9TUi9SL2ZPWjlpSXdO?=
 =?utf-8?B?UEFtN0k4VlRFL0labDFBaWVSdCtOdWkybkNOa1V0Z1pod2lFd0VuTEViV1pR?=
 =?utf-8?B?QTFOREpxbU93eXdoYUZ0Q1diY3FSTzUzbEZ4M0FNMkhleFV1bERrWFBQR1pP?=
 =?utf-8?B?eW4rejk0VnIzWTBtNS9yZWdmZGthcklYc0d3bkwxVVQ5TlZxOUhIZVRyQUxJ?=
 =?utf-8?B?RmdzK285cHlRYWtCN1ZQckNVSS9EZG1XTVQramlZOVpiTnZNOUVTSDlLUk1C?=
 =?utf-8?B?NEpONWpwN0tnYVF3TlZJSkpJSGd0aExYa2JNK21BbmRkU29tc2VuVkp2Zng5?=
 =?utf-8?B?dXdGcEN1ZmVyQnVjbTBOZkNsbWc5Q0JRYWd3bWJZMWdRWTBDNERwdW1rMGZi?=
 =?utf-8?B?YXZSL0NoakluZWZwcUZNMG5tcjA5OC9TUTlKQ1dCaHVHd3U1R0tjV08wWWpW?=
 =?utf-8?B?ZHFCcXdSNWoyOUMyNkJ5eE9ybXE2aEE1bHNueUZmTzdNY1MrVzJnVFljZWRZ?=
 =?utf-8?B?eUxTYTA0N1ZsSjlVMVg1dVpSdUx4WFJNYTY1RG9rVnpBWnZ5RDE0Mm5pZ1hD?=
 =?utf-8?B?NnhhSXBISm9ubWdaZ1YwbGVNM0ZPNkw3WUNVMlpZajFvTjY3cndxT1Zidllu?=
 =?utf-8?B?T1orTHpSL2JqOTgyeHdrRTNGbyt4RUtxd2NpaWNIYk9hOEE4emVPeXFHVG9v?=
 =?utf-8?B?ckV0RDZycnJSME9KUVRLTjlQWGl5blVTSGVXUkd3Wk1LazZnT2NVeG1sOWEz?=
 =?utf-8?B?VUk5empMeUpkdjQ0c3VxU1M5QU85MGUxbnB3UGVaZWFrMW9raWZrQ1BjYzR0?=
 =?utf-8?B?L3NBMEVidWFHeHMwaXJwQnpNOS96NWgrbG5JVzdwbUhjaUNRUmdTbEdhaWNl?=
 =?utf-8?B?Rm9sTEp6cS9ydjB4MmdQRzViV2RscS9UQTNRZ2o3ZWxVMm5Hb2dXakYvWjVG?=
 =?utf-8?B?WURvMmQzbzg3ZG9DNkhtU0pHUFVVR2h1K0hLNURHZEFIVkhwVXdGV1lGQ2hm?=
 =?utf-8?B?TVZqRXJlRHBoUlFESERUU0xIdFJYSXVRK3QvU2JUTWtQNGI3MEZrUHNPMnNs?=
 =?utf-8?B?V0U5RkxYSDNWMkpSM0JJaFVHNVlrSlBLSkdOYmxEdXZzZDZub2J4Zjd6Rmp5?=
 =?utf-8?B?Tkh6Y1E2azF1OWZ2UWVTV2pXcElZaWtDMHJMN0ZzY1VnMCtVRy9xWUpSNGQ2?=
 =?utf-8?B?amtLb0M4MU5mUVBzbGxYU2gxUjRQaW8wVUVXN0k5UjRFZ0IrNHc1dS9PRVhh?=
 =?utf-8?B?Vi85NTNaZDYvVjdRR2xkVm1wemsxUU5SaWlFb29oYlo5OUN4akUxZE83M3hT?=
 =?utf-8?B?aW1zbFIzSlE3TVF0QjB3NkUzYnRoVm5aczVadDZROFJybjFMck1XMEJlWE9U?=
 =?utf-8?B?ZGUxZXZrL3ZyYmRBNHlBblZ4STFxaUQrcG83dExtOExodzNXZDlJNjEvblJ2?=
 =?utf-8?B?QkI4MHd3TmczRmhBSEhqNGVURmFrRGU4WTh6U2NWMkJiRnhCdW5TL1EvVGZS?=
 =?utf-8?B?RDFkVXZjSnJQZ3NZRWhFc2Q5bjBnVkhZdEp4bnZINWVaRDkrTkhaT0ExSkpr?=
 =?utf-8?B?dDQ0TXM0NmUrSUs1alo1bDN6S0VvZjBNNHo1aW5ScHBENGpRblkxUi83TjM3?=
 =?utf-8?B?SE0vSmJHQWZzQmVWekNYb3dUdmV5Rkh3cTYzWTMwVENaaXVtWVdhZ1o0QWVW?=
 =?utf-8?B?blVPalBZbTB1azB4TmZqU1dsbW0wRDBORXo4T2oxRzQydVFhU0dKUVkwRHM2?=
 =?utf-8?Q?5XT+JyKpny7NoD7Y=3D?=
X-Exchange-RoutingPolicyChecked: O+PvZpMj+uRIvaCfdokXIS/CxaSQ16Shz8zr69+GjnTFCqxeGGNJ02UWVuUBgb5aJvpQyJteCMocRjQbTZe2li3/ZyUn5Rr+ujesILuc8L1ikCteYo6jD+UTBRXsyTLHwkPk8qUwQLKYZBd3ByTzQqDk4ndsuBnpbzXzpcX6TsInPRVdbdzQfaAMPLpqwC1glgQ+UkukTcuhAu3GWzti9q9Tv33U3Jrzny19ii+6qQOFSqSO7L04+1iclAEImiUqYXK+ocvCVNLbMu4AiHf3ZojAMgPy66E6dkO8/cGCDwDkncG5w15oLnlJFZVSOgnDW+OjU7DM3F44SAUmxZZ3vg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 02df64d5-b4ca-4ecb-d514-08dedc236140
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 12:29:24.8976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bbBi0NCHZ1u+yesQcH4Sc696RJ8+I8Xg0fczsnf1djEnTOyffKahkAhC0q9eSkBxSrSuDODVR2afpRbHnqrGGYwtPrTgGx86cHFktO40AKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7146
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

--------------O42xsg0r41OLhRpTk1sbH2im
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 02-07-2026 04:44 pm, Badal Nilawar wrote:
> Add support to retrieve info queue data. It can be retrieved when
> has_info_queue=1 and RAS_INFO_QUEUE_FLAG_MORE_DATA is set in
> response of XE_SYSCTRL_CMD_GET_COUNTER.
>
nit: Please change commit message, we haven't checked has_info_queue=1
>   
> Signed-off-by: Badal Nilawar<badal.nilawar@intel.com>
> Assisted-by: Copilot:claude-sonnet-4.6
> ---
>   drivers/gpu/drm/xe/xe_ras.c                   |  34 ++++++
>   drivers/gpu/drm/xe/xe_ras_types.h             | 112 +++++++++++++++++-
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
>   3 files changed, 147 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 44f4e1a3455b..85b0202467f6 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -270,6 +270,40 @@ int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component)
>   	return 0;
>   }
>   
> +static int get_info_queue_data(struct xe_device *xe,
> +			       const struct xe_ras_get_info_queue_data_request *req,
> +			       struct xe_ras_get_info_queue_data_response *out)
> +{
Why we need info queue data? When we are going to use info queue data?
> +	struct xe_ras_get_info_queue_data_response response = {0};
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	size_t rlen;
> +	int ret;
> +
> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP,
> +				  XE_SYSCTRL_CMD_GET_INFO_QUEUE_DATA,
> +				  (void *)req, sizeof(*req), &response, sizeof(response));
> +
> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret) {
> +		xe_err(xe, "sysctrl: failed to get info queue data %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (rlen != sizeof(response)) {
> +		xe_err(xe, "sysctrl: unexpected get info queue data response length %zu (expected %zu)\n",
> +		       rlen, sizeof(response));
> +		return -EIO;
> +	}
> +
> +	xe_dbg(xe, "[RAS]: info queue data: status=%u chunk_size=%u flags=0x%x\n",
> +	       response.operation_status,
> +	       response.queue_response.queue_header.chunk_size,
> +	       response.queue_response.queue_header.flags);
> +
What happen when system control send corrupt data?
> +	*out = response;
> +	return 0;
> +}
> +
>   /**
>    * xe_ras_init - Initialize Xe RAS
>    * @xe: xe device instance
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index 6688e11f57a8..fc496888b3f8 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -9,6 +9,12 @@
>   #include <linux/types.h>
>   
>   #define XE_RAS_NUM_COUNTERS			16
> +#define XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE        200
> +#define XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE        5120
> +#define XE_RAS_INFO_QUEUE_FLAG_AVAILABLE        0x01
> +#define XE_RAS_INFO_QUEUE_FLAG_MORE_DATA        0x02
> +#define XE_RAS_INFO_QUEUE_FLAG_OVERFLOW         0x04
> +#define XE_RAS_INFO_QUEUE_FLAG_COMPRESSED       0x08
>   

What is use of XE_RAS_INFO_QUEUE_FLAG_COMPRESSED? When we are using it?

Thanks,

-/Mallesh

>   /**
>    * struct xe_ras_error_common - Error fields that are common across all products
> @@ -71,7 +77,64 @@ struct xe_ras_threshold_crossed {
>   } __packed;
>   
>   /**
> - * struct xe_ras_get_counter_request - Request structure for get counter
> + * struct xe_ras_info_queue_header - Metadata for large info queue data transfers
> + *
> + * Provides chunk metadata for commands that support extended info queue
> + * functionality. Used when the total data exceeds a single mailbox response.
> + */
> +struct xe_ras_info_queue_header {
> +	/** @total_size: Total size of the complete info queue data in bytes */
> +	u32 total_size;
> +	/** @chunk_offset: Offset of this chunk within the total data in bytes */
> +	u32 chunk_offset;
> +	/** @chunk_size: Size of the data in this chunk in bytes */
> +	u32 chunk_size;
> +	/** @sequence_number: Sequence number for this chunk, starts at 0 */
> +	u32 sequence_number;
> +	/** @flags: Info queue control flags (RAS_INFO_QUEUE_FLAG_*) */
> +	u32 flags:8;
> +	/** @compression_type: Compression algorithm used; 0 = none */
> +	u32 compression_type:4;
> +	/** @num_headers: Number of detailed counter headers at start of queue_data */
> +	u32 num_headers:5;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved:15;
> +	/** @checksum: CRC32 checksum of this chunk data */
> +	u32 checksum;
> +} __packed;
> +
> +/**
> + * struct xe_ras_info_queue_request - Request for a specific chunk of info queue data
> + *
> + * Allows the driver to request continuation of large info queue transfers
> + * by specifying an offset and size within the full data set.
> + */
> +struct xe_ras_info_queue_request {
> +	/** @requested_offset: Byte offset of the requested data chunk */
> +	u32 requested_offset;
> +	/** @requested_size: Maximum size of the requested chunk in bytes */
> +	u32 requested_size;
> +	/** @session_id: Session ID to correlate multi-chunk transfers */
> +	struct xe_ras_error_class session_id;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved;
> +} __packed;
> +
> +/**
> + * struct xe_ras_info_queue_response - Generic response for commands with info queues
> + *
> + * Standard response format for any command that returns an info queue
> + * payload. May be embedded in a command-specific response structure.
> + */
> +struct xe_ras_info_queue_response {
> +	/** @queue_header: Info queue metadata for this chunk */
> +	struct xe_ras_info_queue_header queue_header;
> +	/** @queue_data: Info queue data for this chunk */
> +	u8 queue_data[XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE];
> +} __packed;
> +
> +/**
> + * struct xe_ras_get_counter_request - Request for get error counter
>    */
>   struct xe_ras_get_counter_request {
>   	/** @counter: Error counter to be queried */
> @@ -121,4 +184,51 @@ struct xe_ras_clear_counter_response {
>   	/** @reserved1: Reserved for future use */
>   	u32 reserved1[3];
>   } __packed;
> +
> +/**
> + * struct xe_ras_info_queue_dynamic_counter_hdr - Aggregate counter header entry
> + *
> + * When a session requests aggregate counter data, one header per matching
> + * dynamic counter class is prepended to the queue data. The @counter field
> + * indicates how many subsequent error log entries belong to this class.
> + */
> +struct xe_ras_info_queue_dynamic_counter_hdr {
> +	/** @error_class: Error class associated with this counter group */
> +	struct xe_ras_error_class error_class;
> +	/** @counter: Number of error log entries that follow for this class */
> +	u32 counter;
> +} __packed;
> +
> +/**
> + * struct xe_ras_error_log - Single error log entry following dynamic counter headers
> + */
> +struct xe_ras_error_log {
> +	/** @timestamp: Timestamp when the error was recorded */
> +	u64 timestamp;
> +	/** @error_details: Error-specific details */
> +	u32 error_details[16];
> +} __packed;
> +
> +/**
> + * struct xe_ras_get_info_queue_data_request - Request for RAS_CMD_GET_INFO_QUEUE_DATA
> + */
> +struct xe_ras_get_info_queue_data_request {
> +	/** @queue_request: Info queue request parameters */
> +	struct xe_ras_info_queue_request queue_request;
> +	/** @source_command: Original command that generated the info queue */
> +	u32 source_command;
> +	/** @source_context: Context from original command, if applicable */
> +	struct xe_ras_error_class source_context;
> +} __packed;
> +
> +/**
> + * struct xe_ras_get_info_queue_data_response - Response for RAS_CMD_GET_INFO_QUEUE_DATA
> + */
> +struct xe_ras_get_info_queue_data_response {
> +	/** @operation_status: Status of the retrieval operation */
> +	u32 operation_status;
> +	/** @queue_response: Info queue data chunk */
> +	struct xe_ras_info_queue_response queue_response;
> +} __packed;
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index 6e3753554510..538d93352655 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -25,11 +25,13 @@ enum xe_sysctrl_group {
>    * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
>    * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
> + * @XE_SYSCTRL_CMD_GET_INFO_QUEUE_DATA: Retrieve a chunk of info queue data
>    */
>   enum xe_sysctrl_gfsp_cmd {
>   	XE_SYSCTRL_CMD_GET_COUNTER		= 0x03,
>   	XE_SYSCTRL_CMD_CLEAR_COUNTER		= 0x04,
>   	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
> +	XE_SYSCTRL_CMD_GET_INFO_QUEUE_DATA	= 0x0D,
>   };
>   
>   /**
--------------O42xsg0r41OLhRpTk1sbH2im
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 02-07-2026 04:44 pm, Badal Nilawar
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260702111401.3680214-11-badal.nilawar@intel.com">
      <pre wrap="" class="moz-quote-pre">Add support to retrieve info queue data. It can be retrieved when
has_info_queue=1 and RAS_INFO_QUEUE_FLAG_MORE_DATA is set in
response of XE_SYSCTRL_CMD_GET_COUNTER.

</pre>
    </blockquote>
    nit: Please change commit message, we haven't checked&nbsp;<span style="white-space: pre-wrap">has_info_queue</span>=1&nbsp;
    <blockquote type="cite" cite="mid:20260702111401.3680214-11-badal.nilawar@intel.com">
      <pre wrap="" class="moz-quote-pre"> 
Signed-off-by: Badal Nilawar <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com">&lt;badal.nilawar@intel.com&gt;</a>
Assisted-by: Copilot:claude-sonnet-4.6
---
 drivers/gpu/drm/xe/xe_ras.c                   |  34 ++++++
 drivers/gpu/drm/xe/xe_ras_types.h             | 112 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
 3 files changed, 147 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 44f4e1a3455b..85b0202467f6 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -270,6 +270,40 @@ int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component)
 	return 0;
 }
 
+static int get_info_queue_data(struct xe_device *xe,
+			       const struct xe_ras_get_info_queue_data_request *req,
+			       struct xe_ras_get_info_queue_data_response *out)
+{</pre>
    </blockquote>
    Why we need info queue data? When we are going to use info queue
    data?
    <blockquote type="cite" cite="mid:20260702111401.3680214-11-badal.nilawar@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	struct xe_ras_get_info_queue_data_response response = {0};
+	struct xe_sysctrl_mailbox_command command = {0};
+	size_t rlen;
+	int ret;
+
+	xe_sysctrl_create_command(&amp;command, XE_SYSCTRL_GROUP_GFSP,
+				  XE_SYSCTRL_CMD_GET_INFO_QUEUE_DATA,
+				  (void *)req, sizeof(*req), &amp;response, sizeof(response));
+
+	ret = xe_sysctrl_send_command(&amp;xe-&gt;sc, &amp;command, &amp;rlen);
+	if (ret) {
+		xe_err(xe, &quot;sysctrl: failed to get info queue data %d\n&quot;, ret);
+		return ret;
+	}
+
+	if (rlen != sizeof(response)) {
+		xe_err(xe, &quot;sysctrl: unexpected get info queue data response length %zu (expected %zu)\n&quot;,
+		       rlen, sizeof(response));
+		return -EIO;
+	}
+
+	xe_dbg(xe, &quot;[RAS]: info queue data: status=%u chunk_size=%u flags=0x%x\n&quot;,
+	       response.operation_status,
+	       response.queue_response.queue_header.chunk_size,
+	       response.queue_response.queue_header.flags);
+</pre>
    </blockquote>
    What happen when system control send corrupt data?
    <blockquote type="cite" cite="mid:20260702111401.3680214-11-badal.nilawar@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	*out = response;
+	return 0;
+}
+
 /**
  * xe_ras_init - Initialize Xe RAS
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 6688e11f57a8..fc496888b3f8 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -9,6 +9,12 @@
 #include &lt;linux/types.h&gt;
 
 #define XE_RAS_NUM_COUNTERS			16
+#define XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE        200
+#define XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE        5120
+#define XE_RAS_INFO_QUEUE_FLAG_AVAILABLE        0x01
+#define XE_RAS_INFO_QUEUE_FLAG_MORE_DATA        0x02
+#define XE_RAS_INFO_QUEUE_FLAG_OVERFLOW         0x04
+#define XE_RAS_INFO_QUEUE_FLAG_COMPRESSED       0x08
 </pre>
    </blockquote>
    <p>What is use of&nbsp;<span style="white-space: pre-wrap">XE_RAS_INFO_QUEUE_FLAG_COMPRESSED</span>?
      When we are using it?</p>
    <p>Thanks,</p>
    <p>-/Mallesh</p>
    <blockquote type="cite" cite="mid:20260702111401.3680214-11-badal.nilawar@intel.com">
      <pre wrap="" class="moz-quote-pre">
 /**
  * struct xe_ras_error_common - Error fields that are common across all products
@@ -71,7 +77,64 @@ struct xe_ras_threshold_crossed {
 } __packed;
 
 /**
- * struct xe_ras_get_counter_request - Request structure for get counter
+ * struct xe_ras_info_queue_header - Metadata for large info queue data transfers
+ *
+ * Provides chunk metadata for commands that support extended info queue
+ * functionality. Used when the total data exceeds a single mailbox response.
+ */
+struct xe_ras_info_queue_header {
+	/** @total_size: Total size of the complete info queue data in bytes */
+	u32 total_size;
+	/** @chunk_offset: Offset of this chunk within the total data in bytes */
+	u32 chunk_offset;
+	/** @chunk_size: Size of the data in this chunk in bytes */
+	u32 chunk_size;
+	/** @sequence_number: Sequence number for this chunk, starts at 0 */
+	u32 sequence_number;
+	/** @flags: Info queue control flags (RAS_INFO_QUEUE_FLAG_*) */
+	u32 flags:8;
+	/** @compression_type: Compression algorithm used; 0 = none */
+	u32 compression_type:4;
+	/** @num_headers: Number of detailed counter headers at start of queue_data */
+	u32 num_headers:5;
+	/** @reserved: Reserved for future use */
+	u32 reserved:15;
+	/** @checksum: CRC32 checksum of this chunk data */
+	u32 checksum;
+} __packed;
+
+/**
+ * struct xe_ras_info_queue_request - Request for a specific chunk of info queue data
+ *
+ * Allows the driver to request continuation of large info queue transfers
+ * by specifying an offset and size within the full data set.
+ */
+struct xe_ras_info_queue_request {
+	/** @requested_offset: Byte offset of the requested data chunk */
+	u32 requested_offset;
+	/** @requested_size: Maximum size of the requested chunk in bytes */
+	u32 requested_size;
+	/** @session_id: Session ID to correlate multi-chunk transfers */
+	struct xe_ras_error_class session_id;
+	/** @reserved: Reserved for future use */
+	u32 reserved;
+} __packed;
+
+/**
+ * struct xe_ras_info_queue_response - Generic response for commands with info queues
+ *
+ * Standard response format for any command that returns an info queue
+ * payload. May be embedded in a command-specific response structure.
+ */
+struct xe_ras_info_queue_response {
+	/** @queue_header: Info queue metadata for this chunk */
+	struct xe_ras_info_queue_header queue_header;
+	/** @queue_data: Info queue data for this chunk */
+	u8 queue_data[XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE];
+} __packed;
+
+/**
+ * struct xe_ras_get_counter_request - Request for get error counter
  */
 struct xe_ras_get_counter_request {
 	/** @counter: Error counter to be queried */
@@ -121,4 +184,51 @@ struct xe_ras_clear_counter_response {
 	/** @reserved1: Reserved for future use */
 	u32 reserved1[3];
 } __packed;
+
+/**
+ * struct xe_ras_info_queue_dynamic_counter_hdr - Aggregate counter header entry
+ *
+ * When a session requests aggregate counter data, one header per matching
+ * dynamic counter class is prepended to the queue data. The @counter field
+ * indicates how many subsequent error log entries belong to this class.
+ */
+struct xe_ras_info_queue_dynamic_counter_hdr {
+	/** @error_class: Error class associated with this counter group */
+	struct xe_ras_error_class error_class;
+	/** @counter: Number of error log entries that follow for this class */
+	u32 counter;
+} __packed;
+
+/**
+ * struct xe_ras_error_log - Single error log entry following dynamic counter headers
+ */
+struct xe_ras_error_log {
+	/** @timestamp: Timestamp when the error was recorded */
+	u64 timestamp;
+	/** @error_details: Error-specific details */
+	u32 error_details[16];
+} __packed;
+
+/**
+ * struct xe_ras_get_info_queue_data_request - Request for RAS_CMD_GET_INFO_QUEUE_DATA
+ */
+struct xe_ras_get_info_queue_data_request {
+	/** @queue_request: Info queue request parameters */
+	struct xe_ras_info_queue_request queue_request;
+	/** @source_command: Original command that generated the info queue */
+	u32 source_command;
+	/** @source_context: Context from original command, if applicable */
+	struct xe_ras_error_class source_context;
+} __packed;
+
+/**
+ * struct xe_ras_get_info_queue_data_response - Response for RAS_CMD_GET_INFO_QUEUE_DATA
+ */
+struct xe_ras_get_info_queue_data_response {
+	/** @operation_status: Status of the retrieval operation */
+	u32 operation_status;
+	/** @queue_response: Info queue data chunk */
+	struct xe_ras_info_queue_response queue_response;
+} __packed;
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index 6e3753554510..538d93352655 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -25,11 +25,13 @@ enum xe_sysctrl_group {
  * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
  * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
  * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
+ * @XE_SYSCTRL_CMD_GET_INFO_QUEUE_DATA: Retrieve a chunk of info queue data
  */
 enum xe_sysctrl_gfsp_cmd {
 	XE_SYSCTRL_CMD_GET_COUNTER		= 0x03,
 	XE_SYSCTRL_CMD_CLEAR_COUNTER		= 0x04,
 	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
+	XE_SYSCTRL_CMD_GET_INFO_QUEUE_DATA	= 0x0D,
 };
 
 /**
</pre>
    </blockquote>
  </body>
</html>

--------------O42xsg0r41OLhRpTk1sbH2im--
