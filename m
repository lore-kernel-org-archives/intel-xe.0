Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB645CD98C7
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 23:35:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8733410EC2A;
	Wed, 10 Jun 2026 23:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GscTnXwT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C3E10EC2A
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 23:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781134526; x=1812670526;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LbolultEjYG0CCKooFf6XfTdpRiQqAa2FFMjg/rrdk8=;
 b=GscTnXwTJRq/DR6drbrZCMbSI+NjBXUx3PiKKKB5Yl+D/bGxYaycvzww
 6d3vcwwby0h+murTGgjN7pdwNGk4tCOAR3Zl+9b9/sYJ6DJDHY8D4m2pg
 gmxcHPyZdDGJDMkKbdOg7gfzYQfMbimN5yRRabgrGAdyzWOzZ9pJK0jWi
 IocDL2+0qxW+QoC0XtDH17aI5rq9w+ETpkPF28E1jN2XHjfmg7oS1CFPT
 lb628yJwwToN4/Cz1PZMPKgndSGXFX1KlmSTZPFGqkmUBRP5e3RSU0eZh
 hinCBa2MKMhcLRmluls6F19x9Zaf1peD4z1DX9tCg8+gti4d9PsHSNLrx w==;
X-CSE-ConnectionGUID: TsqOVf0bQs2Xe6ZvGOZ5tQ==
X-CSE-MsgGUID: oymjgZD+SR+WwYuWVLO5Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81919282"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="81919282"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 16:35:25 -0700
X-CSE-ConnectionGUID: KGLlddlCThuZ0Zk5x7nq8Q==
X-CSE-MsgGUID: gbM8Zq78Q/ON8v6tsrkiPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="251223896"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 16:35:25 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 16:35:25 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 16:35:25 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.40) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 16:35:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lmaqX50hjA8PIYKiD5a0UvYgc88DmCHBOd0dQubEj/6zP/Do9blpNVZ7XAJQXj2jUY0JR+kClLuNeHPqoaNZHFIUIBY3xewupwhmTf617K6lMjru48kD+VFLGI3ialW2pvf6VBgwvf3zpffj3dY5wYDjyQiVyUkFpWqTmlmVKrSzJPN6N4nbolGi9z4JCsJLMg/w17h9cU+Q6t/enQyTl5ABCsHaUWEuXzbhGyzOBwpqtrUOO+JMt0mUSdB1D543b4fal4Jiki+rkIuAFuwHPTOb743OFR84BO0odZivSw6Dzcdo/AFQQjZTaybAsYFoOyifkmlfO3DU8RH8scG2dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0UMsR4jemu5aC2mI4R9EiPGawzaGuXsmn7UIKUJUjjw=;
 b=avH7v7Ny/en/sx+jKE4WbXm7kRJsM7E8WQcZUzOwV1AJyjxXjJXhiIPnX5Bu9XKGY4RJh1wURqIZU7DNEmpWRtZ0uXM6IKgV0JTtELEpDBp6mOvJzAlhhtPsXnLbe8znewDd37TikTICXdOOTApx0WPtB7ZJcllhA2Z6YWnsqmB8HAQjjxzTep1ZrPUskDRh0bjXltkFc/HX3zE3yZ3us0s6ZlzwYVNzCJq2fbPg/+SmuBLsZ3esdcciob68/IxhdCFHbg6AJOpRPnyFIVx9o6WMgMFpP2T5jju3NnIsS21E8SjHTdAOeiIJ99WT7u9mOe6NkL2KJ7ww047MGKDe9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6089.namprd11.prod.outlook.com (2603:10b6:930:2f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Wed, 10 Jun
 2026 23:35:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 23:35:22 +0000
Date: Wed, 10 Jun 2026 16:35:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <michal.wajdeczko@intel.com>, <ilia.levi@intel.com>, <x.wang@intel.com>,
 <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH 07/11] drm/xe: Add per-exec-queue user fence wait queue
Message-ID: <ain0t5LRdOGS1KM/@gsse-cloud1.jf.intel.com>
References: <20260610212833.153366-13-stuart.summers@intel.com>
 <20260610212833.153366-20-stuart.summers@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260610212833.153366-20-stuart.summers@intel.com>
X-ClientProxiedBy: MW4PR03CA0053.namprd03.prod.outlook.com
 (2603:10b6:303:8e::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6089:EE_
X-MS-Office365-Filtering-Correlation-Id: a2046487-4e90-4a42-d73b-08dec748f0ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|6133799003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: VA9UvDvt1cNC4j+T7sTeHbWsbR5n8y5Nkz++xuxL+x+Mkqurf2ZqAQjbRI1EfLkngSu7j/daeKshtpRMmRMimuKvYnRxGAEnHf+YkUy7a6i3zJwAzs1fUFB/BoWUd+p/s1olO3OX0EqbXkYpW9pjPtlwmrhTboC2RJlfrpx6dqkR3u2YhGy5K6jeOK6ctgxqzakQxVhGLmpMsORKr0FUoj+VxEYJT517t3N0sD5RvxBeejOgrQSStzp4PJQ2Jon0vcXYplPAepKL1+IxA+ecGbql/RKA/Yg5ayHGlDRzhwMj/8vgMukEGirPYSalQKFZMLglzx7agtOU/xfHLQZbe/f0HO/wbFP0ADvQ9qGC2jTek6H0xUBV3RHIWZtjijb9Yv8zj7Wuse5ZhO1PjwCctf1rKvDjxhAmeueEL5lbx/H7gwjwi1p+EdQd/hxDOwVKOYwxt6pCcMvGbW0tboGIrmI48xvOzKMfXIxttt/FPxrLcpPsqfxAStKwaCbq88/GleAOO5v2lsx+o1nioFgY7EpqQ+gDA4T71YcUI0m8R1GihYhrMyqYof3ovYLbx6aVX7eKa07THmSqu7ZMSOvUy1jtsyFWHqBmNvuFdspz/rL4j0NDPDjyBjh3mufdgUW5xCyEm6TZyES3utujtmaYj8cAmUUY2cM8JaicY5DvxNaEgmjhe7iSm1scsGA9tiNs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REd4UkhSV2RCaVJxL3VYNURXNlJLV2hCaGJXS3ZhS3piaE4vUmdjYWpCSlVk?=
 =?utf-8?B?cHh2T0thUW4rOEhQNHdWYmZNZ3hPK3RVdEF3VHZCS2ZDS3hiWkVQVFRubDRY?=
 =?utf-8?B?T1gyRGZPT214M2sra0pIZURuVFdwUWd4djd6SGpvL1RQei9jZjdMTzUreE1R?=
 =?utf-8?B?bVNqTU0xN2daR2RsRzhhdUMxOUVjSHp1QzFXdVVETXBCWU9aaWZKdHJ2YjNs?=
 =?utf-8?B?MlF3Q3hmMXVlQlhjYkRNWEtjQWtaYjQ5R3gzdkl0b0hDV0lCTmlFSXFLV3Av?=
 =?utf-8?B?endLSmNHQVpTLzNlVEYwcDVvRlhMelBRRkZ6VG8wK3J3T2V4b0VGSTdWdXpN?=
 =?utf-8?B?Y3M2MEN4WlRIelJ3VFZSS3I5L1l5dEI5VlFPVlRRVExMTHYzM0Zkc1I0dGhr?=
 =?utf-8?B?Y2h1K2FnMGlPdFZXVXNUTzI3dHhLYS9ObVdEMzczL25DQy9pdVlGME5aOFh5?=
 =?utf-8?B?MXZYcUZxL2I3cmd5Um55eVByWjNuNEhmWHRpeHp5Z3VtWS82cHdMY3lvS25H?=
 =?utf-8?B?ZDVPWDJ6elNkbEt2KzhOb0tueUZMQjVjbE01c3JlRDJib2xCQ2dyK3FHcGdL?=
 =?utf-8?B?Wml2NzF6a3NuRi9BOHpZRFZ6dXBxQzRUL05QK0ZFblRqMnl0MHQyOGl4RzRm?=
 =?utf-8?B?VEY5eXAzcFlaWldReHNqeTg3b01uTEpZazMxWVV4UDRMTklXenJNeTBwTDBH?=
 =?utf-8?B?Y3REbzBTaW4zajFIMGhScldmME9mRHYxYTVBZW1jZWRKY1dTSWY5MStyM0dC?=
 =?utf-8?B?VjBGeHRhb3RHZ2ZqWUNQVm9MVFdocjhuUkxjSUhlSjQ3TWJIVloyR0JrOHZI?=
 =?utf-8?B?eXVVWFpiQ1FGK1BTdlluLzBKaWxObXFEeXdmQTUrVG5obGJWcGpUSzNKaUtv?=
 =?utf-8?B?Vm1YeVhDS1pUQ0VwS1B0dENMQ3p4WHE2UGxrS2tjYmJkOGt3d1htR1NOWTNp?=
 =?utf-8?B?STJCdndRY3c2RmdlV05hTVBJeG9VNVlSNXpGT1JlVUF4R0NHSXozeHdBRlJL?=
 =?utf-8?B?THdJdnlQOXZsMkRSQjVUV09VSHVUcW8xd0pNV3FNU3VqTXJqak1yZmE3ajRZ?=
 =?utf-8?B?cnYzeGxneVk4YVJtY1NIaFVwY01KU29ub1gxelFScS9YaXlaV05DUGZmL3hh?=
 =?utf-8?B?MDZOZy9Xa2RIVGN0TzU5Y2NZS2s2ZEF2UFZ5OXV5NmQ4RTNWMS9nNlpvalpk?=
 =?utf-8?B?bys5NHFRQmFvWThPVjRiYks3Q21oYU5DcjB6OStPTjlCSXdwTmpNN2k1REhs?=
 =?utf-8?B?OEtZamw5am11WWdBQXFPOGNUTHdtcjN4WFBQTHZaMzh6ZEJzQ0krT0VTVUlP?=
 =?utf-8?B?T1FnaTU3VzZGb2VtSTZIWDUvbldUMlZCU2JwWmNCOW5uSnZvSE5nUzFlNXJV?=
 =?utf-8?B?c2hldTJwcThMbUI2WjkxNyt0MERmalZYckZGb2NQNHpjbllsZ3hiUlc4NGI3?=
 =?utf-8?B?WXUvcFVFdDdvNi9mc05rUW1wUTd0Q0EySkp5RUFjY050d2ZYMUxxT01PbUty?=
 =?utf-8?B?ZDdwYzEraUY2UHdiN3k1NlFIV2x2d0xnUEZheDVTWWY5Z3RmMFJSQ1lxSjFm?=
 =?utf-8?B?Mk01cEl3UExyS2lWUExjQ2k1ZDl6R0xLTXVxWVNRVTlSbEtvUkhOSmY1bDUy?=
 =?utf-8?B?dnRWWWpJSlVLMWJ0ODN4azRseVBCRW9mY2Q1ZVNQc1BqeEZaOUlLZkFrMXlX?=
 =?utf-8?B?Y3JtUzRWTWl4ZWZaUlMxTzJSMC91dnVKNjZBdGI1WURWOUZKdGVmN29FODVz?=
 =?utf-8?B?MjN6SFZTYjhBbStZYTVpUHJTb1daTDRneitPbW9qQm5KN0VHYThocm5iOVZy?=
 =?utf-8?B?TGYwcHo1blJrY1FBeGRPekFQQ2hIamdnY2FoVzgzUm9kbE1nMnpSZ2g2K2pB?=
 =?utf-8?B?Sm1FQ21jL0wxWlNzMSt6YW4vN2lmWk16eWRDaXI3bUV2cDlxQ3VFRVNsSDY5?=
 =?utf-8?B?eDZOVklwbzRjRHpzMW15b1ZEcXRrcmltVzJMNTBzUmp2ZCtsNHk0VkRxMEJO?=
 =?utf-8?B?UnNHa3A4TlZiYmNINmFONlFYTjNnTEtkM1VmdTM0VEg5eS9kTHFKQlBtdW54?=
 =?utf-8?B?TndramFkSnpGZTJBbEZ1Ukg3cFpQeXpVUVMyMmUzNHB0SnQwWmdFdWQrSkF3?=
 =?utf-8?B?ZDY2UGxpa1ljVllSQkJIdTBoY3ByUFE2TUhvTnIyV0R2N0Y5WmFYTnB0eUNQ?=
 =?utf-8?B?czB2MjA0WDZ0SFJkNzNIaVFKNkdkVnlCd3dZbHpPOHlySEJpUmk5TndtVjZW?=
 =?utf-8?B?TmdiYjJXT0NScnBsSTJTZzNLbFMwdTN5L1JqeU1XNDBodUFGN1NrUVp0ei8x?=
 =?utf-8?B?OWdXZEsxYit1ZGtMc2VobDQ4WHBNSXppT1J3L05oZDFEMU9mU0ExbWZDZXdO?=
 =?utf-8?Q?2YNmVEd3FBbRZOEM=3D?=
X-Exchange-RoutingPolicyChecked: CRKavy/YOjqFVhXv3/bxdld7eatmhZRUYbjiYIpkRm7Rz8kmLTt8oMp/xq45lM3U3B3hxSThh+QHHZNNI9co4qakwFU1y3EBTHdm26ApgsEeefxng9Vhawv7B/eCljudBLC/TBcny2PdGliOMcLgJAj35oPYB9Ai0aEv7+KlzIqmqPtoohLICXBfsot3Uva4N0FwozGJnlWERN3+4sn6e8efE4D24+yy/dsRBuDGAkPYCWLoRwQMLnezx64obhEEVT10KTvyyOJ+c/IcDFNhe1jCWiYXko5m3xGRXyqpP6lTEKRKGDs9yqCrqtDYwDDsAYmCQC8ypF71hOdiN4aHWw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a2046487-4e90-4a42-d73b-08dec748f0ba
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 23:35:22.5343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MS72oIIUPeCSJEQi4ePkqcItu3EGZdaADM0rDc+uJuFeuzV4Rm2qVnEaRbHLmM1+CZeWJKsr4yqVI4ryjEhMhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6089
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

On Wed, Jun 10, 2026 at 09:28:39PM +0000, Stuart Summers wrote:
> Add a new ufence_wq wait queue to struct xe_exec_queue and initialize it
> at queue allocation time. Also introduce xe_wait_user_fence_wake() to
> centralize the ufence wake call sites.
> 
> This patch just adds the infrastructure in place to do this and doesn't
> actually start using it. The reason being that we need to be careful
> when handling a case where a user does a VM bind without a bind queue
> and mistakenly passes a non-bind queue to the wait user fence. There
> are a couple of IGT cases at least that are doing this today and to
> avoid regressing any user code around this, we'll add some additional
> handling in a subsequent patch before connecting this to the actual
> wait user fence code.
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Assisted-by: Copilot:claude-sonnet-4.6
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       |  1 +
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  3 +++
>  drivers/gpu/drm/xe/xe_guc_submit.c       |  6 ++----
>  drivers/gpu/drm/xe/xe_hw_engine.c        |  6 ++++--
>  drivers/gpu/drm/xe/xe_hw_engine.h        |  3 ++-
>  drivers/gpu/drm/xe/xe_irq.c              |  2 +-
>  drivers/gpu/drm/xe/xe_memirq.c           |  2 +-
>  drivers/gpu/drm/xe/xe_sync.c             |  3 ++-
>  drivers/gpu/drm/xe/xe_wait_user_fence.c  | 16 +++++++++++++++-
>  drivers/gpu/drm/xe/xe_wait_user_fence.h  |  4 ++++
>  10 files changed, 35 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 6c101b4f6488..aa49400b67ba 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -260,6 +260,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  	INIT_LIST_HEAD(&q->multi_gt_link);
>  	INIT_LIST_HEAD(&q->hw_engine_group_link);
>  	INIT_LIST_HEAD(&q->pxp.link);
> +	init_waitqueue_head(&q->ufence_wq);

Would it be better to make this a pointer and malloc/initialize a
wait_queue if it has a unique MSIX vector; otherwise, point it to
xe->ufence_wq? Likewise, if a platform doesn’t support MSIX, could we
just point it to xe->ufence_wq?

This ties into a suggestion below.

>  	spin_lock_init(&q->multi_queue.lock);
>  	spin_lock_init(&q->lrc_lookup_lock);
>  	q->multi_queue.priority = XE_MULTI_QUEUE_PRIORITY_NORMAL;
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index d27ce24daae5..fdc7baaa952e 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -231,6 +231,9 @@ struct xe_exec_queue {
>  		struct list_head link;
>  	} pxp;
>  
> +	/** @ufence_wq: per-queue user fence wait queue */
> +	wait_queue_head_t ufence_wq;
> +
>  	/** @ufence_syncobj: User fence syncobj */
>  	struct drm_syncobj *ufence_syncobj;
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index b29cc08e6291..16d609e7b40f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -21,6 +21,7 @@
>  #include "xe_device.h"
>  #include "xe_exec_queue.h"
>  #include "xe_force_wake.h"
> +#include "xe_wait_user_fence.h"
>  #include "xe_gpu_scheduler.h"
>  #include "xe_gt.h"
>  #include "xe_gt_clock.h"
> @@ -555,11 +556,8 @@ static bool vf_recovery(struct xe_guc *guc)
>  
>  static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
>  {
> -	struct xe_guc *guc = exec_queue_to_guc(q);
> -	struct xe_device *xe = guc_to_xe(guc);
> -
>  	/** to wakeup xe_wait_user_fence ioctl if exec queue is reset */
> -	wake_up_all(&xe->ufence_wq);
> +	xe_wait_user_fence_wake(gt_to_xe(q->gt), q);
>  
>  	xe_sched_tdr_queue_imm(&q->guc->sched);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 98265293f2dc..05780bd5beba 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -42,6 +42,7 @@
>  #include "xe_tuning.h"
>  #include "xe_uc_fw.h"
>  #include "xe_wa.h"
> +#include "xe_wait_user_fence.h"
>  
>  #define MAX_MMIO_BASES 3
>  struct engine_info {
> @@ -894,9 +895,10 @@ int xe_hw_engines_init(struct xe_gt *gt)
>  	return 0;
>  }
>  
> -void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
> +void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec,
> +			     struct xe_exec_queue *q)
>  {
> -	wake_up_all(&gt_to_xe(hwe->gt)->ufence_wq);
> +	xe_wait_user_fence_wake(gt_to_xe(hwe->gt), q);
>  
>  	if (hwe->irq_handler)
>  		hwe->irq_handler(hwe, intr_vec);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> index c3ee37f8cfc0..7501c9051a71 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -51,7 +51,8 @@ struct xe_exec_queue;
>  
>  int xe_hw_engines_init_early(struct xe_gt *gt);
>  int xe_hw_engines_init(struct xe_gt *gt);
> -void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
> +void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec,
> +			     struct xe_exec_queue *q);
>  void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe);
>  u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
>  				enum xe_engine_class engine_class);
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 40d3d43e492f..fc99d021405f 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -385,7 +385,7 @@ static void gt_irq_handler(struct xe_tile *tile,
>  
>  			hwe = xe_gt_hw_engine(engine_gt, class, instance, false);
>  			if (hwe) {
> -				xe_hw_engine_handle_irq(hwe, intr_vec);
> +				xe_hw_engine_handle_irq(hwe, intr_vec, NULL);
>  				continue;
>  			}
>  
> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> index 96ab2c59c5d7..318ef7c72eba 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -493,7 +493,7 @@ void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
>  	 * is opportunistic, unconditionally pass MI_USER_INTERRUPT to issue
>  	 * that check.
>  	 */
> -	xe_hw_engine_handle_irq(hwe, GT_MI_USER_INTERRUPT);
> +	xe_hw_engine_handle_irq(hwe, GT_MI_USER_INTERRUPT, NULL);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index 37866768d64c..652341f22460 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -18,6 +18,7 @@
>  #include "xe_exec_queue.h"
>  #include "xe_macros.h"
>  #include "xe_sched_job_types.h"
> +#include "xe_wait_user_fence.h"
>  
>  struct xe_user_fence {
>  	struct xe_device *xe;
> @@ -92,7 +93,7 @@ static void user_fence_worker(struct work_struct *w)
>  	 * Wake up waiters only after updating the ufence state, allowing the UMD
>  	 * to safely reuse the same ufence without encountering -EBUSY errors.
>  	 */
> -	wake_up_all(&ufence->xe->ufence_wq);
> +	xe_wait_user_fence_wake(ufence->xe, NULL);

Is this the only call site where q is NULL? I’m certain we can obtain q
from the exec IOCTL and VM bind IOCTLs and pass into the sync layer.

OA also uses syncs and appears to have a q as well; however, I’m not
that familiar with that code, though I’m sure we can work out any
OA-related details.

Given this, starting with the first suggestion above, I would wire in q
from the exec IOCTL, VM bind IOCTLs, and OA IOCTLs. Next, I would
completely drop ufence_list, as it doesn’t appear to be needed.

Finally, I would rewrite xe_wait_user_fence_wake in patch #10 as
follows:

void xe_wait_user_fence_wake(struct xe_device *xe, struct xe_exec_queue *q)
{
	/* Wakeup non-attached queue waiters */
	wake_up_all(&xe->ufence_wq);

	/*
	 * XXX: Maybe even bail before xe_exec_queue_get_unless_zero if
	 * MSIX isn't supported.
	 */

	q = xe_exec_queue_get_unless_zero(q);
	if (q) {
		if (q->ufence_wq != &xe->ufence_wq)
			wake_up_all(&q->ufence_wq);
		xe_exec_queue_put(q);
	}
}

I’m fairly certain this will work and be a bit simpler.

Also, I believe patch #10 contains a bug: if xe_wait_user_fence_wake is
passed a valid q and a wait IOCTL omits q, then xe->ufence_wq isn’t
woken. I’m pretty sure my suggestion here resolves that as well.

What do you think?

Matt

>  	user_fence_put(ufence);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> index 12ceb3efa8ea..7c9d52b50580 100644
> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> @@ -54,6 +54,20 @@ static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
>  #define VALID_FLAGS	DRM_XE_UFENCE_WAIT_FLAG_ABSTIME
>  #define MAX_OP		DRM_XE_UFENCE_WAIT_OP_LTE
>  
> +/**
> + * xe_wait_user_fence_wake() - Wake user fence waiters
> + * @xe: the xe device
> + * @q: exec queue (reserved; per-queue wake-up is enabled in a later patch)
> + *
> + * Wakes all user fence waiters on the device-level wait queue.
> + * Per-exec-queue and ufence_list broadcast support are introduced in
> + * subsequent patches once the full infrastructure is in place.
> + */
> +void xe_wait_user_fence_wake(struct xe_device *xe, struct xe_exec_queue *q)
> +{
> +	wake_up_all(&xe->ufence_wq);
> +}
> +
>  static long to_jiffies_timeout(struct xe_device *xe,
>  			       struct drm_xe_wait_user_fence *args)
>  {
> @@ -110,7 +124,7 @@ static long to_jiffies_timeout(struct xe_device *xe,
>   *
>   * If an exec queue ID is provided, the wait is aborted early if the
>   * queue enters a reset state. The device-level wait queue is used for
> - * wakeups.
> + * wakeups in all cases.
>   *
>   * On return, @timeout is updated to reflect the remaining time (or zero
>   * on expiry), unless %DRM_XE_UFENCE_WAIT_FLAG_ABSTIME is set.
> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.h b/drivers/gpu/drm/xe/xe_wait_user_fence.h
> index 0e268978f9e6..64e5000eabb4 100644
> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.h
> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.h
> @@ -8,6 +8,10 @@
>  
>  struct drm_device;
>  struct drm_file;
> +struct xe_device;
> +struct xe_exec_queue;
> +
> +void xe_wait_user_fence_wake(struct xe_device *xe, struct xe_exec_queue *q);
>  
>  int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  			     struct drm_file *file);
> -- 
> 2.43.0
> 
