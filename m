Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 866C2D17141
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 22:42:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F1A10E112;
	Mon, 21 Oct 2024 22:42:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eER+B3VS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 055ED10E112
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Oct 2024 22:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729550555; x=1761086555;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=VUjuGZxk7K5U9dLES2YOpf/Z08fS4Z09HHX9OJZfCRM=;
 b=eER+B3VSS2oqiBT3faEViTXDAxySQ9+YDsbpBptRgvZoO03PohZcP+8F
 DwtgGNZMEgx7Pr8/xkei5pn/z6bqhTQxWAqRnR7QGjbhovluJt3c1Y513
 rZ2NhpdxLtunBIcQUJp0FrR/u9k2X8/K80xt1LP3K7X3Fq/mxjCaViWww
 tHZCQt240C20DtQ2MrO7ZJryRUBUf7qhW09qDdeyY5T+dJpRlfCc8wW7Z
 +AXiFvfBo3sDbeCAQxqZcuJRJUrBQpkPg0YeAKZ2t5AgNRG1Vrek9lygC
 SIpjUhPRWyOMBmK3shLJ0ilbRCSRhxpLB1b/cxrH7MVFNvwBh4Db9hukg w==;
X-CSE-ConnectionGUID: kRJbWwk+Q7S3Tvyw5HGRmA==
X-CSE-MsgGUID: TnxUkftBSkCPIO+wk5j9kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="29158234"
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208,217";a="29158234"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 15:42:35 -0700
X-CSE-ConnectionGUID: 0sLnkcrGQSeIPggcf68Iwg==
X-CSE-MsgGUID: 7N8YyYTtSK6scI4hYaV9eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
 d="scan'208,217";a="110428756"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Oct 2024 15:42:34 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Oct 2024 15:42:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 21 Oct 2024 15:42:33 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 21 Oct 2024 15:42:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KxTFnwoLsR5azxYwe5EHBi8m+uqhKHuONX8UQR+RqnPagjrSr+Gd1/TzP1J8zFwbe2ecWn7ThLmq00wpggSugnXqokuiBeth8w0u/24XpQEOwJifEL3DzA4gc5f5D66OfAcGGbySn+4I7fcHWKkVYN6DQ/G5sLlXLtSkO5Y3MlHQSqfTe3JoXi0tInLeih+jrQlM7LHqZx/ZMv+6wtqlmCDH2K+UkQgakBGWiewphnoqOMXXa+loU8Fhe2WpztUHWesIeDbMNh3pYGqy1iuW/fFLQWROuJO+oJmwAfSQVVb6Oblqx51KGzhpeNPdxxSQVtO1plGMhP4c+KYcD4U2Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qM5rjNScMzQUvwDvhIj5qdGDK9WtYfZrhmmaG9EBtmc=;
 b=FxcpAueFglFfu0oX9+O2dhSCqOBqn4tDjG9Agp0VOQgGAR3tqaQe/y1XrH6Qh7Rhp0xiZJ/UJctDQh6lKXzSy3QhSI1J6umoA2ehD2Qli16uLCM5fg/xcN+oTPlIMTXpgrXe4mJacffPh11o4qrTL874tVdVy6akV1L5n+s9r8uQam6fYrfov6sPsm3RiuV1lvFmNfGjqho220ntB6wfhqQ8dxgs7dQDkd+PxXhIFtLcwbPvGoBW6E63tx/PYujCiTKs701K8LE/VRavlN5y7TRBdpJEhCUp3Y0/Xn/0fpog/10AGIENnUubxoDyZ8M3o7yEjmqKbq61nud9jqnwyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by SN7PR11MB7438.namprd11.prod.outlook.com (2603:10b6:806:32b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Mon, 21 Oct
 2024 22:42:30 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%6]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 22:42:30 +0000
Content-Type: multipart/alternative;
 boundary="------------W4BGWyctb60iJLhJp49pWvsr"
Message-ID: <12fbb5e2-4520-4e81-b467-8c1bbdf7d2b1@intel.com>
Date: Tue, 22 Oct 2024 00:42:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] drm/xe/vf: Send RESFIX_DONE message at end of VF
 restore
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
References: <20241007201631.3369513-1-tomasz.lis@intel.com>
 <20241007201631.3369513-3-tomasz.lis@intel.com>
 <eb9a0ff3-3d5b-406d-85f3-cf38ddd5f0e0@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <eb9a0ff3-3d5b-406d-85f3-cf38ddd5f0e0@intel.com>
X-ClientProxiedBy: WA1P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::19) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|SN7PR11MB7438:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c845109-53e9-4511-9942-08dcf221a569
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVVRTDJQTTlCNTF1VFBmSGdsVG9zSTltaXk0N2dtOU1uWXFodkkvUWNwczhv?=
 =?utf-8?B?U1psekorNHFUNVZMMWVuMVMxUHczVnFxMXcyTVVlMmE1OCtISHgvb0FhbzJV?=
 =?utf-8?B?bTBxOVV3dk42dmJoQTBvZ25wSHpJTUUvaXVFOW4vbWIvOXNCeTE3UUpxL1pt?=
 =?utf-8?B?Y3JvRjBrUk5aRUZtRktOK2Eza2NwUHY5cHBoQU5Zbnl6V1p0TUZPbEtsalVk?=
 =?utf-8?B?ZFVrank4cERJRGtuWmRRT3AwcnJ6aDJWK0czWjdjOFFDOHBXV0pOU241TExm?=
 =?utf-8?B?MXphZlM4TnI4V0ZHK0cvdjg1ZlNuRER5YVd5VTJUcTVwd1VSMDlPTFBZZllU?=
 =?utf-8?B?UlRuZC9qVjNyL2o4OWNKVXIwTzdFaXZ4dk5NUVptaTNIVlNLamhVT3J6a052?=
 =?utf-8?B?eVB3YjhQdkRtOVVxTENvUjRkdkhjQ0pKSTlaWVRCd3RQQm1VMTRKdm1GRDI5?=
 =?utf-8?B?bXpaSnpYNE16eTVqMVdaY2F4c3A5a1JuOVkxTkg1K0RqVENsR3hwOHE0L1NS?=
 =?utf-8?B?dXYxc2V5VTZOL3c0emJVVjJpT3lwRTJoY1VOK1ZpQ1c3K2Y1NlI0eWwxQ0hh?=
 =?utf-8?B?Q0JacnZMSkIvbktlMDR0aWt1WW5BVTMvWXQwbGVJdGdkUWdtL01qN3QzdEpw?=
 =?utf-8?B?VjNEZE9MVUFRL21aSTBMcGs3a3dRN1I3aENRTWdwQ3VoQWZ2RmtXR0ltbWhF?=
 =?utf-8?B?OFlPemFVNnhFMTVZbFBuQVM1NThRZzd5cG9DM3lEWS96UkdKdGlVUXZqZU0y?=
 =?utf-8?B?SEpObU5jMFdFa3FuY0xLcGsxUHpNVWJ5ZmpBZ1l5SGJXUDBMazlVWnR6TC9t?=
 =?utf-8?B?VU93b24rbVBQOHVORE1hOFdRb1l1ZWR1SVZYdGF2dXBFWk81K1EwYS9ncXpZ?=
 =?utf-8?B?QXFJVHdRaEtXM0lJRDZpZk1GbUZJRUhYdGQ1Wks0NmgvK3lPMDgyb1ZOU0Rl?=
 =?utf-8?B?U0JlbDNHRForMk9qSlkrbVZTZElFY05IYUhhaG1DMUVXTzdKeXRnaDRJZXNj?=
 =?utf-8?B?dElDV2RYWThsNm1IYnU3UkNGelBWU3dHd2swMVBHa0R5blRQRFUwZHlnbkl5?=
 =?utf-8?B?WXljeXJySmIrMTVYYUhCUFBJcVMzMHdBenB3TWtUcUtQMHlYbGJ4c3pwWHhz?=
 =?utf-8?B?clNJby9jTHNVVDRnR3EyV09WdnZqK0o4U3pMSUxJVW9YSWFPdlBwMkpPYjFq?=
 =?utf-8?B?OUd4ZUUwaVJkWG4rSlZFOVc1eS9VbUJUSWJhTktsdTRlNUpSbnVFT3Rrekhi?=
 =?utf-8?B?eGFURWQ3WDBCY3FxRnI4VEhzM29sWENpb21SNlFFcmJ2dFpnMGw4eU9MS09M?=
 =?utf-8?B?MmQ2VFJMT2dhUHczWkZlYjd2SmwwRmlXdE44YWZMQ1NwUmVvWXVTeGF5NVNu?=
 =?utf-8?B?bzZ0OHhjd3oxdGxiWVYxSjNVd29remwwUTBnM0EveEhqMG5IYkZRYmZrLy9r?=
 =?utf-8?B?Tjd5dGdvaDNpcjF5S1FZR3pNcEljbWNTRHZlNkgvTHgzVktTQ1Q0NXZtMHdq?=
 =?utf-8?B?aGxRU0tpOG9aQ2htdjFaemVZRjBRbXAxY1V4UWRvSE95dU1LZmY0S0hzYmNS?=
 =?utf-8?B?TUxsYzRBeXh6dkh5eGVKdWRaRkVlcndDNk5tNTRrVTNmSE8rMnVxRXgwU0xI?=
 =?utf-8?B?T05WRm9kT3JXYXVtei9CK0dDQmtMdVdPVjlCY1QyQTVTTlRvUVpmNWhUNmk5?=
 =?utf-8?B?c3FocUoxdXU5VVhjQ1dFZzRBcW5ISm9rbGpZVVF3dXZsQkdnMHYzNkdJWEI0?=
 =?utf-8?Q?vq16mDUH2udAy9dmEiEmKt2yWqefsn7eQOR7Bp4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUp0bTkwVytZMXpGb3dkYmtsdjlXUUZUZUh6YnBMOWxpSVJFSnRoOUNhN0Y2?=
 =?utf-8?B?TitKS0syVi9oa1JyT3hzZUtRRVBPT1JWSWVicmFldE85NzNsQ3puOU53bHNY?=
 =?utf-8?B?SVl6MFpjVG1XSVFibTdFNmtja2ZoYy9DYlR3OXpBYmhQV0VOTW9DQkQycTRa?=
 =?utf-8?B?SW1hRStjdjIyc0xWc3g0U0laZmovVXEzbVgxQjZwQ0hqUGFMaC9oaGtVcG13?=
 =?utf-8?B?eVVvS3F1N3RwTWdmZGxaeWpuREI4RjNCWHVhallsdENRZkpmNHRrVjdod1M3?=
 =?utf-8?B?SFpXTWZLNCs1dnV5VmlzSkZReU5jWFRoOVlPY0VWZFJHUkZaekV5VWU2R1NW?=
 =?utf-8?B?bytXNnlkS2svWkJ3SVFZVHBHaUxwWmZYdTVBZkJXdEtUR2s5OWNNL3pjSDJK?=
 =?utf-8?B?dDJiMktiUm9tVU01RjJyQjA2dVZ4MklrR0d4TzlkYTc4b3U1L2ZlVWxEd3pL?=
 =?utf-8?B?YlJxN2tveTRLbXdIY3A3dHlTMGMrU2RhSG1qVnh5bTdtSnUxd3ZQeUM2bDc1?=
 =?utf-8?B?bkthdkt1VURUODZHZFNKVzlsQUtkMlVsS1hrM1lhS0hCS2dGVlNXa2MxY1d5?=
 =?utf-8?B?T3BVcnhpWDZWYmhPdFFrNWQ2L2ZpN2xnTHNnNVNuU3M2NnRXeXJlcUxRR0Mw?=
 =?utf-8?B?MUoxcHJWa1k1dTF5eUF4NkxIdWhVN2tyVHhWdzlvaVp6RE5nTk5yU2R2MFhI?=
 =?utf-8?B?YkhyTTBwaWZCYXI1MS95N1FrclB0RmtHRnhoRzBqaW1vUGdNQmxEYTFBYncw?=
 =?utf-8?B?RDA5RlB1YktPQU4zU0x3YkJIZ1Z3ZkFTTHprWDhYdDNtQ3JxazVnVU84U3cr?=
 =?utf-8?B?b24xTkwzdXIydmxXZnpZUnBEdGl3L3ZOVmJXOVpteHI1eThnYW9tSDFBYktY?=
 =?utf-8?B?NmUveHkxWkxjYVp4NEcrY2pSbGpYT2Y3UlV3emtlV1NpbXdXbEZ5OFRzajVD?=
 =?utf-8?B?VElSOTFxSFU1c3FBQkwvcmQ3bVhzZkVrTmh1NlBqdTlGVzlOZkk5YUV4VGFr?=
 =?utf-8?B?dytuQkdCYVA4NlJJeTE3aWlnbzhrV0pmZ2ZKRjB3cm9XRGRHQzBvVERXMVdR?=
 =?utf-8?B?dEZRNE9Qcng3d3NUTjVuMEIrMXUxUk5ianlHTkhJckZ3Sld0WHpsYnd3QUYz?=
 =?utf-8?B?RGFHbnVlUnkyNDVNNGh4ZTRteExaSnFYa1cxZW5XVDdBSUVqblJoM0d3WThK?=
 =?utf-8?B?Q3o0Nm1RZUlwOW4rSXZ6d05HVjd0NDNIR21KdlVQZFI0Snk2STkrVXVObU0y?=
 =?utf-8?B?RDA5QU55M1Noc1U4WFNrc3ZoQVQ0UXNXQVdPRzVIK2hkeDRrWk0rTmNyL0lC?=
 =?utf-8?B?ZWM1aTdkTmd4aWMveFd6T0ZPQ2s4ZHp5eFljeVpxRGthRm05YzBrdUdVL2JJ?=
 =?utf-8?B?ZXVDb25Pd013MG93cmJEOVQ1M3lnNkorZ0tJUEJENmhSZzh1QVY0MHNrM3Y5?=
 =?utf-8?B?K0Z5dnBGcGdMbkx2TmN0eHU5YllEYU40S0gzSEJNMlZrSzkvQ0E1VTZXcEE5?=
 =?utf-8?B?TVFKaUtmcHNzeWlXWHcwMUZFbTBRaHloZEE4YXFucWxUK20zRVFPdm04L1JE?=
 =?utf-8?B?bUMzL3hoa3pmLzgxT1JnZ3I2TWVuTitFYWJ4TE50QndIbS95T1hxaFhGZmhP?=
 =?utf-8?B?SmRic29mYWpaMVNCVkptUDQ1UStFWDQzNys2QWczbjBTMjE5U2lxU1JIS3l0?=
 =?utf-8?B?OGhXaVQ4TjFxZFpOZDdrNnlqT0ZrUnNWdEgzWWtFanZwbENTNHJYWS9HNUgw?=
 =?utf-8?B?OEdiSWxWZE91MU5SSlh4Wkw0cU56TUI3WVV6dVFDQU8yR0ZramFtWnQ4THVI?=
 =?utf-8?B?Q2pHMTJjVXJ2YWZFK1pHU0k0eTBsMGpmeDZtVy9ZOTR4WHhZZlR1bWdqWCtn?=
 =?utf-8?B?WnZxcG5jazdBQ2dmaEgvbDB6VU9mRTBETGl0SDQreU9NdUpGaENmMkxIbEVG?=
 =?utf-8?B?MzBYcGpIY0I0WlliaTd3UEt5OHRCSEdrcXg5OFRGaTdabG1EU1JmMFBaTzFo?=
 =?utf-8?B?b3dNMERSWnVQL1Jzc0lzQ1I5dHF6QXJuQ002Kyt4SFpMMVl6MW1zMFNrUklr?=
 =?utf-8?B?cGQrUWFkV3RDOER1Z0c0OFJWclZlc3U3R1U3cnZLSDlNRHFvS1IycjVVQXEv?=
 =?utf-8?Q?8hSZrBpdxxLFToK5FVACIg+rU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c845109-53e9-4511-9942-08dcf221a569
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 22:42:30.5661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4DpiHV/SE/hIfxZr7jEs5qeY1UGfmSADysGyFRWDKcQfCTthKWvs2cAMJsm4l7NQy3JKKkn3ZqpJl1d02CcTzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7438
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

--------------W4BGWyctb60iJLhJp49pWvsr
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 13.10.2024 19:39, Michal Wajdeczko wrote:
>
> On 07.10.2024 22:16, Tomasz Lis wrote:
>> After restore, GuC will not answer to any messages from VF KMD until
>> fixups are applied. When that is done, VF KMD sends RESFIX_DONE
>> message to GuC, at which point GuC resumes normal operation.
> maybe we can add some small DOC section with sequence diagram?

Sequence diagrams present code flow. Within the Linux code, we have all 
flows visible directly. I don't see how adding sequence diagrams to code 
would provide value.

Within `/Documentation` there are a few `.dot` diagrams, but I don't 
think any of these are sequence diagrams.

Are there any examples of existing sequence diagrams in kerneldoc?

>> This patch implements sending the RESFIX_DONE message at end of
>> post-migration recovery.
>>
>> v2: keep pm ref during whole recovery, style fixes (Michal)
>>
>> Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
>> ---
>>   .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 38 +++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 36 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h           |  1 +
>>   drivers/gpu/drm/xe/xe_guc.c                   |  3 +-
>>   drivers/gpu/drm/xe/xe_sriov_vf.c              | 23 +++++++++++
>>   5 files changed, 100 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
>> index b6a1852749dd..0b28659d94e9 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
>> @@ -501,6 +501,44 @@
>>   #define VF2GUC_VF_RESET_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
>>   #define VF2GUC_VF_RESET_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
>>   
>> +/**
>> + * DOC: VF2GUC_NOTIFY_RESFIX_DONE
>> + *
>> + * This action is used by VF to notify the GuC that the VF KMD has completed
>> + * post-migration recovery steps.
>> + *
>> + * This message must be sent as `MMIO HXG Message`_.
>> + *
>> + *  +---+-------+--------------------------------------------------------------+
>> + *  |   | Bits  | Description                                                  |
>> + *  +===+=======+==============================================================+
>> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
>> + *  |   +-------+--------------------------------------------------------------+
>> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
>> + *  |   +-------+--------------------------------------------------------------+
>> + *  |   | 27:16 | DATA0 = MBZ                                                  |
>> + *  |   +-------+--------------------------------------------------------------+
>> + *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE` = 0x5508    |
>> + *  +---+-------+--------------------------------------------------------------+
>> + *
>> + *  +---+-------+--------------------------------------------------------------+
>> + *  |   | Bits  | Description                                                  |
>> + *  +===+=======+==============================================================+
>> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
>> + *  |   +-------+--------------------------------------------------------------+
>> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
>> + *  |   +-------+--------------------------------------------------------------+
>> + *  |   |  27:0 | DATA0 = MBZ                                                  |
>> + *  +---+-------+--------------------------------------------------------------+
>> + */
>> +#define GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE		0x5508u
>> +
>> +#define VF2GUC_NOTIFY_RESFIX_DONE_REQUEST_MSG_LEN	GUC_HXG_REQUEST_MSG_MIN_LEN
>> +#define VF2GUC_NOTIFY_RESFIX_DONE_REQUEST_MSG_0_MBZ	GUC_HXG_REQUEST_MSG_0_DATA0
>> +
>> +#define VF2GUC_NOTIFY_RESFIX_DONE_RESPONSE_MSG_LEN	GUC_HXG_RESPONSE_MSG_MIN_LEN
>> +#define VF2GUC_NOTIFY_RESFIX_DONE_RESPONSE_MSG_0_MBZ	GUC_HXG_RESPONSE_MSG_0_DATA0
>> +
>>   /**
>>    * DOC: VF2GUC_QUERY_SINGLE_KLV
>>    *
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> index 38dd17f278de..01e5ff661437 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> @@ -224,6 +224,42 @@ int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt)
>>   	return 0;
>>   }
>>   
>> +static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
>> +{
>> +	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
>> +		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
>> +		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
>> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE),
>> +	};
>> +	int ret;
>> +
>> +	ret = xe_guc_mmio_send(guc, request, ARRAY_SIZE(request));
>> +
>> +	return ret > 0 ? -EPROTO : ret;
>> +}
>> +
>> +/**
>> + * xe_gt_sriov_vf_notify_resfix_done - Notify GuC about resource fixups apply completed.
>> + * @gt: the &xe_gt struct instance linked to target GuC
>> + *
>> + * Returns: 0 if the operation completed successfully, or a negative error
>> + * code otherwise.
>> + */
>> +int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt)
>> +{
>> +	struct xe_guc *guc = &gt->uc.guc;
>> +	int err;
>> +
>> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>> +
>> +	err = guc_action_vf_notify_resfix_done(guc);
>> +	if (unlikely(err))
>> +		xe_gt_sriov_err(gt, "Failed to notify GuC about resource fixup done (%pe)\n",
>> +				ERR_PTR(err));
>> +
>> +	return err;
>> +}
>> +
>>   static int guc_action_query_single_klv(struct xe_guc *guc, u32 key,
>>   				       u32 *value, u32 value_len)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> index 9959a296b221..912d20814261 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> @@ -17,6 +17,7 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
>> +int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
>>   void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>>   
>>   u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index fb5704526954..e563fd2f818f 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -939,7 +939,8 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>>   
>>   	BUILD_BUG_ON(VF_SW_FLAG_COUNT != MED_VF_SW_FLAG_COUNT);
>>   
>> -	xe_assert(xe, !xe_guc_ct_enabled(&guc->ct));
>> +	/* this call can happen with CTB enabled during VF migration */
>> +	xe_assert(xe, IS_SRIOV_VF(xe) || !xe_guc_ct_enabled(&guc->ct));
> I would drop this assert completely and do that in a separate patch
will do.
>
>>   	xe_assert(xe, len);
>>   	xe_assert(xe, len <= VF_SW_FLAG_COUNT);
>>   	xe_assert(xe, len <= MED_VF_SW_FLAG_COUNT);
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index b8c54926bdaa..c8cbd17d88d3 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -8,6 +8,8 @@
>>   #include "xe_assert.h"
>>   #include "xe_device.h"
>>   #include "xe_gt_sriov_printk.h"
>> +#include "xe_gt_sriov_vf.h"
>> +#include "xe_pm.h"
>>   #include "xe_sriov.h"
>>   #include "xe_sriov_vf.h"
>>   #include "xe_sriov_printk.h"
>> @@ -23,10 +25,31 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
>>   	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
>>   }
>>   
>> +/*
>> + * vf_post_migration_notify_resfix_done - Notify all GuCs about resource fixups apply finished.
>> + * @xe: the &xe_device struct instance
> I'm still not convinced that we need this quasi-kernel-doc for static
> function ... maybe just give it a more descriptive name?
>
> 	vf_post_migration_notify_all_guc_resfix_done

The name is descriptive enough. Looks to me that it's a matter of 
personal view on the documentation of statics.

Functions should be generally documented. This includes statics. As in:

"We also recommend providing kernel-doc formatted documentation for 
private (file |static|) routines, for consistency

  of kernel source code layout. This is lower priority and at the 
discretion of the maintainer of that kernel source file."

Please do not overstate the "lower priority" part. "Lower priority" 
absolutely does not mean "prefer to skip" or "remove

when switched a function into static". On the opposite, the first 
sentence of the quoted recommendation weights more.

Static functions should be documented, and it is preferred if they are. 
It makes no sense to remove comments on which

the effort of writing was already spent. Self-documenting names are good 
of course, but they are not a replacement

for kerneldoc. The "discretion of the maintainer" does not override 
anything written before, it only enhances that.


>
>> + */
>> +static void vf_post_migration_notify_resfix_done(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt;
>> +	unsigned int id;
>> +	int err, num_sent = 0;
>> +
>> +	for_each_gt(gt, xe, id) {
>> +		err = xe_gt_sriov_vf_notify_resfix_done(gt);
>> +		if (!err)
>> +			num_sent++;
>> +	}
>> +	drm_dbg(&xe->drm, "sent %d VF resource fixups done notifications\n", num_sent);
> hmm, is this message really so useful? maybe just add separate
> xe_gt_sriov_dbg_verbose() to xe_gt_sriov_vf_notify_resfix_done() so we
> will see each notification (and we can easily count to two if needed)

We already have per-GuC message if something bad happened, why would we 
want a spam of messages if everything is ok?

Also I'm not that sure if this iteration will always only go through 
only two items.

-Tomasz

>
>> +}
>> +
>>   static void vf_post_migration_recovery(struct xe_device *xe)
>>   {
>>   	drm_dbg(&xe->drm, "migration recovery in progress\n");
>> +	xe_pm_runtime_get(xe);
>>   	/* FIXME: add the recovery steps */
>> +	vf_post_migration_notify_resfix_done(xe);
>> +	xe_pm_runtime_put(xe);
>>   	drm_notice(&xe->drm, "migration recovery ended\n");
>>   }
>>   
--------------W4BGWyctb60iJLhJp49pWvsr
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 13.10.2024 19:39, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:eb9a0ff3-3d5b-406d-85f3-cf38ddd5f0e0@intel.com">
      <pre wrap="" class="moz-quote-pre">

On 07.10.2024 22:16, Tomasz Lis wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">After restore, GuC will not answer to any messages from VF KMD until
fixups are applied. When that is done, VF KMD sends RESFIX_DONE
message to GuC, at which point GuC resumes normal operation.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
maybe we can add some small DOC section with sequence diagram?</pre>
    </blockquote>
    <p>Sequence diagrams present code flow. Within the Linux code, we
      have all flows visible directly. I don't see how adding sequence
      diagrams to code would provide value.</p>
    <p>Within `/Documentation` there are a few `.dot` diagrams, but I
      don't think any of these are sequence diagrams.</p>
    <p>Are there any examples of existing sequence diagrams in
      kerneldoc?<br>
    </p>
    <blockquote type="cite" cite="mid:eb9a0ff3-3d5b-406d-85f3-cf38ddd5f0e0@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
This patch implements sending the RESFIX_DONE message at end of
post-migration recovery.

v2: keep pm ref during whole recovery, style fixes (Michal)

Signed-off-by: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>
---
 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 38 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 36 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h           |  1 +
 drivers/gpu/drm/xe/xe_guc.c                   |  3 +-
 drivers/gpu/drm/xe/xe_sriov_vf.c              | 23 +++++++++++
 5 files changed, 100 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
index b6a1852749dd..0b28659d94e9 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
@@ -501,6 +501,44 @@
 #define VF2GUC_VF_RESET_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
 #define VF2GUC_VF_RESET_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
 
+/**
+ * DOC: VF2GUC_NOTIFY_RESFIX_DONE
+ *
+ * This action is used by VF to notify the GuC that the VF KMD has completed
+ * post-migration recovery steps.
+ *
+ * This message must be sent as `MMIO HXG Message`_.
+ *
+ *  +---+-------+--------------------------------------------------------------+
+ *  |   | Bits  | Description                                                  |
+ *  +===+=======+==============================================================+
+ *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 27:16 | DATA0 = MBZ                                                  |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE` = 0x5508    |
+ *  +---+-------+--------------------------------------------------------------+
+ *
+ *  +---+-------+--------------------------------------------------------------+
+ *  |   | Bits  | Description                                                  |
+ *  +===+=======+==============================================================+
+ *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  27:0 | DATA0 = MBZ                                                  |
+ *  +---+-------+--------------------------------------------------------------+
+ */
+#define GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE		0x5508u
+
+#define VF2GUC_NOTIFY_RESFIX_DONE_REQUEST_MSG_LEN	GUC_HXG_REQUEST_MSG_MIN_LEN
+#define VF2GUC_NOTIFY_RESFIX_DONE_REQUEST_MSG_0_MBZ	GUC_HXG_REQUEST_MSG_0_DATA0
+
+#define VF2GUC_NOTIFY_RESFIX_DONE_RESPONSE_MSG_LEN	GUC_HXG_RESPONSE_MSG_MIN_LEN
+#define VF2GUC_NOTIFY_RESFIX_DONE_RESPONSE_MSG_0_MBZ	GUC_HXG_RESPONSE_MSG_0_DATA0
+
 /**
  * DOC: VF2GUC_QUERY_SINGLE_KLV
  *
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 38dd17f278de..01e5ff661437 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -224,6 +224,42 @@ int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt)
 	return 0;
 }
 
+static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
+{
+	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
+		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
+		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
+		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE),
+	};
+	int ret;
+
+	ret = xe_guc_mmio_send(guc, request, ARRAY_SIZE(request));
+
+	return ret &gt; 0 ? -EPROTO : ret;
+}
+
+/**
+ * xe_gt_sriov_vf_notify_resfix_done - Notify GuC about resource fixups apply completed.
+ * @gt: the &amp;xe_gt struct instance linked to target GuC
+ *
+ * Returns: 0 if the operation completed successfully, or a negative error
+ * code otherwise.
+ */
+int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt)
+{
+	struct xe_guc *guc = &amp;gt-&gt;uc.guc;
+	int err;
+
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+
+	err = guc_action_vf_notify_resfix_done(guc);
+	if (unlikely(err))
+		xe_gt_sriov_err(gt, &quot;Failed to notify GuC about resource fixup done (%pe)\n&quot;,
+				ERR_PTR(err));
+
+	return err;
+}
+
 static int guc_action_query_single_klv(struct xe_guc *guc, u32 key,
 				       u32 *value, u32 value_len)
 {
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index 9959a296b221..912d20814261 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -17,6 +17,7 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
 int xe_gt_sriov_vf_connect(struct xe_gt *gt);
 int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
 int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
+int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
 void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
 
 u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index fb5704526954..e563fd2f818f 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -939,7 +939,8 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 
 	BUILD_BUG_ON(VF_SW_FLAG_COUNT != MED_VF_SW_FLAG_COUNT);
 
-	xe_assert(xe, !xe_guc_ct_enabled(&amp;guc-&gt;ct));
+	/* this call can happen with CTB enabled during VF migration */
+	xe_assert(xe, IS_SRIOV_VF(xe) || !xe_guc_ct_enabled(&amp;guc-&gt;ct));
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I would drop this assert completely and do that in a separate patch</pre>
    </blockquote>
    will do.<br>
    <blockquote type="cite" cite="mid:eb9a0ff3-3d5b-406d-85f3-cf38ddd5f0e0@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 	xe_assert(xe, len);
 	xe_assert(xe, len &lt;= VF_SW_FLAG_COUNT);
 	xe_assert(xe, len &lt;= MED_VF_SW_FLAG_COUNT);
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index b8c54926bdaa..c8cbd17d88d3 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -8,6 +8,8 @@
 #include &quot;xe_assert.h&quot;
 #include &quot;xe_device.h&quot;
 #include &quot;xe_gt_sriov_printk.h&quot;
+#include &quot;xe_gt_sriov_vf.h&quot;
+#include &quot;xe_pm.h&quot;
 #include &quot;xe_sriov.h&quot;
 #include &quot;xe_sriov_vf.h&quot;
 #include &quot;xe_sriov_printk.h&quot;
@@ -23,10 +25,31 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
 	INIT_WORK(&amp;xe-&gt;sriov.vf.migration.worker, migration_worker_func);
 }
 
+/*
+ * vf_post_migration_notify_resfix_done - Notify all GuCs about resource fixups apply finished.
+ * @xe: the &amp;xe_device struct instance
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I'm still not convinced that we need this quasi-kernel-doc for static
function ... maybe just give it a more descriptive name?

	vf_post_migration_notify_all_guc_resfix_done</pre>
    </blockquote>
    <p>The name is descriptive enough. Looks to me that it's a matter of
      personal view on the documentation of statics.</p>
    <p>Functions should be generally documented. This includes statics.
      As in:</p>
    <p>&quot;We also recommend providing kernel-doc formatted
      documentation for private (file <code class="docutils literal notranslate"><span class="pre">static</span></code>)
      routines, for consistency</p>
    <p>&nbsp;of
      kernel source code layout. This is lower priority and at the
      discretion
      of the maintainer of that kernel source file.&quot;</p>
    <p>Please do not overstate the &quot;lower priority&quot; part. &quot;Lower
      priority&quot; absolutely does not mean &quot;prefer to skip&quot; or &quot;remove</p>
    <p>when switched a function into static&quot;. On the opposite, the first
      sentence of the quoted recommendation weights more.</p>
    <p>Static functions should be documented, and it is preferred if
      they are. It makes no sense to remove comments on which</p>
    <p>the effort of writing was already spent. Self-documenting names
      are good of course, but they are not a replacement</p>
    <p>for kerneldoc. The &quot;discretion
      of the maintainer&quot; does not override anything written before, it
      only enhances that.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:eb9a0ff3-3d5b-406d-85f3-cf38ddd5f0e0@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ */
+static void vf_post_migration_notify_resfix_done(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int err, num_sent = 0;
+
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_sriov_vf_notify_resfix_done(gt);
+		if (!err)
+			num_sent++;
+	}
+	drm_dbg(&amp;xe-&gt;drm, &quot;sent %d VF resource fixups done notifications\n&quot;, num_sent);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
hmm, is this message really so useful? maybe just add separate
xe_gt_sriov_dbg_verbose() to xe_gt_sriov_vf_notify_resfix_done() so we
will see each notification (and we can easily count to two if needed)</pre>
    </blockquote>
    <p>We already have per-GuC message if something bad happened, why
      would we want a spam of messages if everything is ok?</p>
    <p>Also I'm not that sure if this iteration will always only go
      through only two items.<br>
    </p>
    <p>-Tomasz<br>
    </p>
    <blockquote type="cite" cite="mid:eb9a0ff3-3d5b-406d-85f3-cf38ddd5f0e0@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+}
+
 static void vf_post_migration_recovery(struct xe_device *xe)
 {
 	drm_dbg(&amp;xe-&gt;drm, &quot;migration recovery in progress\n&quot;);
+	xe_pm_runtime_get(xe);
 	/* FIXME: add the recovery steps */
+	vf_post_migration_notify_resfix_done(xe);
+	xe_pm_runtime_put(xe);
 	drm_notice(&amp;xe-&gt;drm, &quot;migration recovery ended\n&quot;);
 }
 
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------W4BGWyctb60iJLhJp49pWvsr--
