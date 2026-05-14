Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A25BCD37AC
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 20:19:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD6DB10E3EB;
	Thu, 14 May 2026 20:19:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JNbUPXlh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D5410E3EB
 for <intel-xe@lists.freedesktop.org>; Thu, 14 May 2026 20:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778789959; x=1810325959;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=YLJKy7zP22fmmV7XQ5sJ5tyNdbPVtop17+bpMkWB9ok=;
 b=JNbUPXlhDZmvw/XGyKNDo4ZqA9v32BLu8BffIaeWq6J2g0VvcMhGuAVz
 fxxscybPlS96e2YnfDZ6nvWTIq+agCyYJGRhHAKdOTURVHcySGkUPEX8c
 LXGHyh40yJxZtoYE1Vh2AIAkOk+hcxVEWvoY+twsCXJHMi3uwcBuMLpQB
 aR32y/zLwzzpPU1H3BfpPciAuOTvqXZ/DPIj+Ng0UEehmsOh+2M6E3S51
 3s5LlYgexMJx9PmQMKESiIw+lxiFCIApbNW42JXlQcF30+Y2pC4Hs0mp1
 ONQPW+RINxW9jYpKU+4aqBn83fKDpR/auD6XQSATVYCWl5dVuogW2E0kB Q==;
X-CSE-ConnectionGUID: V2VItXIERjidnLLP5dIW7w==
X-CSE-MsgGUID: ZQXmSYF8QbChcVmp1mZI6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="90436278"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="90436278"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 13:19:19 -0700
X-CSE-ConnectionGUID: V91Er44wS6uMLz3xOMzx9g==
X-CSE-MsgGUID: YuCVepbSSV+jkfjkvSSMLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="262006807"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 13:19:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 13:19:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 14 May 2026 13:19:18 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.2) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 13:19:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m6tgoZX3wIYc6n89/J7Trcf0szs+OaDV8Ec8X+oruT7ebmt3r3WfIjWhpQ3TkrKTTzdwyDBEwcl1M6G+kR+WVZkdDBKcihFqMJ3fpzL9dMsx0VoVWR9k6yAPImQtt64pJ2MQG6Gsj5joWFpFcvX/ulIIN5EgyZpfAMCvO066PMuqequELiRHLYaMPZVHEIpoYFFIiOKsK31W92G1r3/c0fsjeAAukTmvSgBCJMxjBiYNhtMv5V9fUreLlut4b4TYogI6yOAjiB9nJ7iZWo3uXQ+A9FD3EzYPeKXJpC6jzJdyLGhR8uiRI1waoXta9m1DZ3uLoopQ7VsSOVoX/uWsbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wW/vSS7rj82P2e47vWUjJy7ZAfIZCQmK5ZnGCerL93k=;
 b=eEQYIKCkHwkmJsV/2ECc5ZEhIsX2ojnGt/Fgs4DylI0mAu1qBEyDuNHr3NQVt8XZIAKaEumzD+/KptVB2NpYNDWtPGZq4iOWrAyCGBYlY+4DvSrs6VchyBEPZk+TXYLjZvtNUUYPAd4ySQI0uBdML0zn5TRyN16SZjnWNetz7yslJN6ZhtskDs2QpOAw7Lmfg9AUyaSIKXgYFs7KfV7LLpALQ3YgTbl74HsSgNMJaYKnKGd3HpRxWaGmAFIjIDqZ85e8kU1A952rQQ6hYr9nJCxMkFOE/lPcGqmqOZYz8w7G34AR7mvfgwEgjcASe1k4DZRb4eUzMSFmusmAinD2cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA1PR11MB6663.namprd11.prod.outlook.com (2603:10b6:806:257::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Thu, 14 May
 2026 20:19:07 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 20:19:07 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 7/7] drm/xe/rtp: Implement a structured parser for
 rule matching
In-Reply-To: <20260513233435.GH2131374@mdroper-desk1.amr.corp.intel.com>
References: <20260430-rtp-rule-parser-v2-0-157e98b4ab51@intel.com>
 <20260430-rtp-rule-parser-v2-7-157e98b4ab51@intel.com>
 <20260513233435.GH2131374@mdroper-desk1.amr.corp.intel.com>
Date: Thu, 14 May 2026 17:19:03 -0300
Message-ID: <87y0hlvj60.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0056.prod.exchangelabs.com (2603:10b6:a03:94::33)
 To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA1PR11MB6663:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a33f8d5-7903-4a18-bb1d-08deb1f60cd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info: 8Vq0Qm7x8rQZpm3u+yrH6CuRX/OQs8+SDJgEz2rK/HL1YW+VFlGxu0Bb+WuIl/EJZH7MdlSGqQis9vSFHOyLISoIUsgpZX8uItMFogehW9t5rsbAAl3qp0XJdmk0xRqWy74IYORPf56Q+S/WMT723ntBXlAOZlHfBESOQmshWPJB9+QX6nm5BfYj/2rCOSBzh29bz8Qe12M++He8XC1ehmBLJk1jB9Kz+aC0Li1CnDg+KAvnWMbSF/9EA1bFeUj4bq8aNs/oCHb7/E9IODHqnpzZ+3qbb9CfMGwIpz/FlMW+l89iFOa3LUyLNpp50HUNcrAoy1QOPdWjeYvQhccaoz6LJIwgy+0vShB9g8zHmg3lxSz3RbKi2/G1OKPU6p3/kv08UUxvBqChGqsjhZWkFHOi0s54cGW4c6qpF/IDGDZ97uijQ0pG7bt5mbOg+o2fykzU/tPHbAxAbtRIYnPs1hJoJLcG3RGT5+fYqiDMFWW0YAetoFSsJlZOMjb4u4F19Wn/1XwVivMM8G1DJAF79CX8nahM7XO/ZN4bGC+1gma83jW54OxLjYXomSYyrdvVLsYepOF9rNvwxnyUYD23fCGTbz3qDFhHabSg0htQxGa3WIPVB5gIoXbbsLBqWO7o1ETmUnS6pTMQByX2wI7ed3fGnP7sBCjG4qwmOz1ifLWLpa35ft2jF9Zz2dWd/Fpv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003)(11063799003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6TtkDl7ZkTBrP8XC61UChofwdQk69MwyerRG51mwUmV8aj4uYRde/G6OMVSo?=
 =?us-ascii?Q?CmxlMN9mrM8cUdbvDcNAtTL2Hw0XGPfEcej/Iu3mT8LaxYU3YGhoKQsQZIQ5?=
 =?us-ascii?Q?jUlqoUy7wRZyus6a6nbVLe23IUeziJOmFox8JJ52O/x7S86UDFNf1Ki6eHB9?=
 =?us-ascii?Q?wMJNmTAa4Kljpywviyob3EYiWgcS39ZIvPR0bNv0khTgf+X19hZ+rotlWZL6?=
 =?us-ascii?Q?m2a85HO6M04W1+MhnOuIHqIPafAnN/HelxX7AL5f0mFhXw35t+meJoLjjpNV?=
 =?us-ascii?Q?6YtOH5X2kJfxVJuB84FD52H8SPD8OCAkxP1exodNHhSJjK7ClJ0DWlc68iOs?=
 =?us-ascii?Q?6++Z5r92M/Sn7Vbjvn2JNJA1xe3HdmySO0T2Qwto3kapx4Hm9OhDQ/EL/OSg?=
 =?us-ascii?Q?b6etxzZMplrw6J/r3DTg4KtsLfnWU9R7zm8tay4nq/UGqsBbBxl0k20TlRZI?=
 =?us-ascii?Q?97hptNZ+G5j7XZfR3qaueVrTavc15rglpiokv0BmKZkR2DE17+4fiEi45ayw?=
 =?us-ascii?Q?b36jfXCcbJhja9q8cbV0FZNYKg0rB4IYqs1b8FJl6/nH+lKRO9ZzLO7xqXSR?=
 =?us-ascii?Q?Ub2XgzHF5MgenVErW6GbQUV5nFny55h7WOGPUVBHfNr87aA/GKZWI6E+52ub?=
 =?us-ascii?Q?SxeX0rrH71uj6ZhJcTOkUgR8UN/GGK2uAi3NV4T1Af981TY4nur92nRVDPGt?=
 =?us-ascii?Q?a+h1KtIaunBreNb5uXy1EWAqQrxbXFdTfxmGVsh49N/sQF5NDCKkdj4r5bLk?=
 =?us-ascii?Q?01dU1+C/V8UdcCJcW1mMrzUPH7Y5a+PzmKhSbXY0ocpgMDIxrOa3E01AKy/o?=
 =?us-ascii?Q?4udFAS+bALNmf1nzouK3/2Bmyg+Mtf4Xhpll98nq0Lw6eWCNwfJsJ8eshFVB?=
 =?us-ascii?Q?aZsXDnXPz4cpNndiL9J90hdp/MxIU1bsPdKWifup9TywNctMJrDwH4pBMwfw?=
 =?us-ascii?Q?p6HyGsK9/C5hHO3VG6ie/RDTAOKzzHqJpFYCwta9o8tMzGwZDlo490AGraPX?=
 =?us-ascii?Q?Z6SrVGrBpq3BKux/wjMqNH8FD9/3AfRatjnz9hcnJm8zxVbRePq/p8OGi2Z2?=
 =?us-ascii?Q?qjTciVqPXApwxmvz7CyzQSclXas5Jm7k+ncUDixHyVl8/TbEGop7Z3WSOTNY?=
 =?us-ascii?Q?W5Qj+iMJTfGZCKtMQ/qUmdgTsZ3VfsuaaWQLh5o90Aw/LvNc6al9sFtZFQJb?=
 =?us-ascii?Q?nyv+y87VK10mZXf5MLi9S2SKuB0rex2KoIXX8uEUxNb/NY2dQZtQ95UMDhLU?=
 =?us-ascii?Q?L0XV2bDE3Vr4+ZKil99+gMIOCZy0YakOimPvfDG2+OxrMYOjNpPtaOw2Uc4L?=
 =?us-ascii?Q?ZVc4Ve0Jrm9krfmkSU/LwocB2JAGa+RKBv8HGa2hGzaWZ5Z2XOFhmy+WFguz?=
 =?us-ascii?Q?XbWHkEcipxfloczlpf2KUv0MgHkrUEk7TiAYSRqctzPsPr+gw4OAaDF3Jwqg?=
 =?us-ascii?Q?EaG0fAEv10UccZViysuCOhCbf7H6D/heRvMyeCVfzwab424kZtmJ7NRAYLx9?=
 =?us-ascii?Q?8Tc8PPtLZE0U+Fz24nZeoOMUx3N2W879k9C/EX3rABw2xZeRCS10HpM8TIWJ?=
 =?us-ascii?Q?baALTm/3fW8IT+g7N7OiONLeyvy9zlEh9RCJpNkX/tGM5Fj1WpbFM0eHrGhN?=
 =?us-ascii?Q?Kb0iXhOxXaS92r9qEOctErzktQmrMNWXBjfq5Y4wBojuz5NFO2XtwJ4zL8gg?=
 =?us-ascii?Q?FIDvJVE7Rx5WBY8lJoQ8AuFc8BXi7TsGKz/gGQm/bdvDfaLoUYPxQjyMOWzo?=
 =?us-ascii?Q?XD3+wNBLcA=3D=3D?=
X-Exchange-RoutingPolicyChecked: tdZexLKnykPht74f1GyYM2l59E8YOgBk+82GuDA0+hPmhFoFT/MP46bFqX2wJmssjcUJ++62aU0m3zflLyO9XaCRit+q8tbhFGhT+bwxYmVZvGqZ+63qmf9TaNai9EAHSipZunLO4M9YIBSZGJBxUq0tcLmxViCkrLiK4fDMpr3Ox0xdTDH38xm+K6ql3bbpAFxcad6KbkwLr1id/hi2/bQcdsRED9K+W1qsVHc2yJTJhbdcOeWJE8nLmSkOS9oLof+s4clB268rIck+wBbQNswsublLbFFnBVOIj30ZoM8v1amGbar9dY5MWwdgLxGweGmrqw6rYFJEy74clWQRFw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a33f8d5-7903-4a18-bb1d-08deb1f60cd6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 20:19:07.2829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z8/gje9hSXSQ+MQGAVhDd/dX974LMPEvhQkE59VY2SwiSw56XShh+rPyejH6X39d9Cg/fyTEwUoCU4kAYYqZAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6663
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

Matt Roper <matthew.d.roper@intel.com> writes:

> On Thu, Apr 30, 2026 at 05:20:08PM -0300, Gustavo Sousa wrote:
>> The current unwritten grammar for RTP rules is as follows:
>> 
>>           rules = disjunction;
>>     disjunction = conjunction { "OR" conjunction };
>>     conjunction = single_rule { single_rule }
>>                               /* AND operator is implicit */;
>>     single_rule = ? GRAPHICS_VERSION(...), MEDIA_VERSION(...),
>>                      FUNC(...), etc ?;
>
> We should probably add this grammar BNF to the DOC: section at the top
> of the file too.  Then it won't be "unwritten" anymore.  :-)

Cool. It could be on the kernel-doc for XE_RTP_RULES(). Ack on
incrementing this patch with the following then?

    diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
    index 562082b18d7b..2a8e536eaa5d 100644
    --- a/drivers/gpu/drm/xe/xe_rtp.h
    +++ b/drivers/gpu/drm/xe/xe_rtp.h
    @@ -394,18 +394,39 @@ struct xe_reg_sr;
      * XE_RTP_RULES - Helper to set multiple rules to a struct xe_rtp_entry_sr entry
      * @...: Rules
      *
    - * At least one rule is needed and up to 12 are supported. Multiple rules are
    - * AND'ed together, i.e. all the rules must evaluate to true for the entry to
    - * be processed. See XE_RTP_MATCH_* for the possible match rules. Example:
    + * When an RTP table is being processed, the rules of each entry are evaluated
    + * to check if they match the target entity (platform, gt or hwe, depending on
    + * the specific RTP table).
    + *
    + * The sequence of arguments of this macro must follow the following eBNF
    + * grammar::
    + *
    + *            rules = disjunction;
    + *      disjunction = conjunction, { "OR" conjunction };
    + *      conjunction = single_rule, { single_rule };
    + *				   (* the AND operator is implicit *)
    + *      single_rule = ? GRAPHICS_VERSION(...), MEDIA_VERSION(...),
    + *                      FUNC(...), etc ?
    + *
    + * Examples:
      *
      * .. code-block:: c
      *
      *	const struct xe_rtp_entry_sr wa_entries[] = {
      *		...
    - *		{ XE_RTP_NAME("test-entry"),
    + *		{ XE_RTP_NAME("entry-a"),
    + *		  // Match DG2-G10 with graphics steppings A0 up-to B0
    + *		  // (exclusive).
      *		  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
      *		  ...
      *		},
    + *		{ XE_RTP_NAME("entry-b"),
    + *		  // Match graphics version 20 (all steppings) or graphics
    + *		  // version 30 steppings A0 up-to B0 (exclusive).
    + *		  XE_RTP_RULES(GRAPHICS_VERSION(2000), OR,
    + *			       GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0))
    + *		  ...
    + *		},
      *		...
      *	};
      */

--
Gustavo Sousa

>
>> 
>> While rule_matches() currently works for the grammar above, it doesn't
>> easily resemble it.  Let's replace it with an implementation that is
>> structured in a way to resemble the grammar.
>> 
>> Such a new implementation, although a bit more verbose, is arguably
>> easier to reason about and to adapt to any extension we do to the
>> grammer in the future.
>> 
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>
> Aside adding the kerneldoc, this looks good to me.  It will definitely
> make it easier to define and implement additions to the grammar in the
> future, if necessary.
>
>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>
>> ---
>>  drivers/gpu/drm/xe/xe_rtp.c | 138 ++++++++++++++++++++++++++++----------------
>>  1 file changed, 88 insertions(+), 50 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>> index 976a2e1f5592..dec9d94e6fb0 100644
>> --- a/drivers/gpu/drm/xe/xe_rtp.c
>> +++ b/drivers/gpu/drm/xe/xe_rtp.c
>> @@ -30,11 +30,28 @@ static bool has_samedia(const struct xe_device *xe)
>>  	return xe->info.media_verx100 >= 1300;
>>  }
>>  
>> -static bool rule_match_item(const struct xe_device *xe,
>> -			    struct xe_gt *gt,
>> -			    struct xe_hw_engine *hwe,
>> -			    const struct xe_rtp_rule *r)
>> +struct rule_match_ctx {
>> +	const struct xe_device *xe;
>> +	struct xe_gt *gt;
>> +	struct xe_hw_engine *hwe;
>> +	const struct xe_rtp_rule *rules;
>> +	const unsigned int n_rules;
>> +	unsigned int head;
>> +	int err;
>> +};
>> +
>> +static bool rule_is_item(const struct xe_rtp_rule *r)
>> +{
>> +	return r->match_type != XE_RTP_MATCH_OR;
>> +}
>> +
>> +static bool rule_match_item(struct rule_match_ctx *match_ctx)
>>  {
>> +	const struct xe_device *xe = match_ctx->xe;
>> +	struct xe_gt *gt = match_ctx->gt;
>> +	struct xe_hw_engine *hwe = match_ctx->hwe;
>> +	const struct xe_rtp_rule *r = &match_ctx->rules[match_ctx->head];
>> +
>>  	switch (r->match_type) {
>>  	case XE_RTP_MATCH_PLATFORM:
>>  		return xe->info.platform == r->platform;
>> @@ -120,6 +137,63 @@ static bool rule_match_item(const struct xe_device *xe,
>>  	}
>>  }
>>  
>> +/*
>> + * Match a conjunctive set of rules (rules joined by an implicit "AND").
>> + *
>> + * Once one item evaluates to false, the remaining items are not evaluated
>> + * anymore.  Nevetheless, all rules are consumed to allow detecting syntax
>> + * errors.
>> + */
>> +static bool rule_match_and(struct rule_match_ctx *match_ctx, bool parse_only)
>> +{
>> +	bool match = true;
>> +	unsigned int count = 0;
>> +
>> +	while (match_ctx->head < match_ctx->n_rules &&
>> +	       rule_is_item(&match_ctx->rules[match_ctx->head])) {
>> +		if (!parse_only)
>> +			match = rule_match_item(match_ctx);
>> +
>> +		if (!match)
>> +			parse_only = true;
>> +
>> +		match_ctx->head++;
>> +		count++;
>> +	}
>> +
>> +	if (drm_WARN_ON(&match_ctx->xe->drm, !count)) {
>> +		match_ctx->err = -EINVAL;
>> +
>> +		if (!parse_only)
>> +			match = false;
>> +	}
>> +
>> +	return match;
>> +}
>> +
>> +/*
>> + * Match a disjunctive set of rules (subset of rules joined by
>> + * "XE_RTP_MATCH_OR").
>> + *
>> + * Once one subset evaluates to true, the remaining items are not evaluated
>> + * anymore. Nevetheless, all rules are consumed to allow detecting syntax
>> + * errors.
>> + */
>> +static bool rule_match_or(struct rule_match_ctx *match_ctx)
>> +{
>> +	bool match = rule_match_and(match_ctx, false);
>> +
>> +	while (match_ctx->head < match_ctx->n_rules &&
>> +	       match_ctx->rules[match_ctx->head].match_type == XE_RTP_MATCH_OR) {
>> +		/* Consume XE_RTP_MATCH_OR. */
>> +		match_ctx->head++;
>> +
>> +		match = rule_match_and(match_ctx, match);
>> +	}
>> +
>> +	return match;
>> +}
>> +
>>  static bool rule_matches_with_err(const struct xe_device *xe,
>>  				  struct xe_gt *gt,
>>  				  struct xe_hw_engine *hwe,
>> @@ -127,55 +201,19 @@ static bool rule_matches_with_err(const struct xe_device *xe,
>>  				  unsigned int n_rules,
>>  				  int *err)
>>  {
>> -	const struct xe_rtp_rule *r;
>> -	unsigned int i, rcount = 0;
>> -	bool short_circuit_or = false;
>> +	struct rule_match_ctx match_ctx = {
>> +		.xe = xe,
>> +		.gt = gt,
>> +		.hwe = hwe,
>> +		.rules = rules,
>> +		.n_rules = n_rules,
>> +	};
>> +	bool match = rule_match_or(&match_ctx);
>>  
>>  	if (err)
>> -		*err = 0;
>> -
>> -	for (r = rules, i = 0; i < n_rules; r = &rules[++i]) {
>> -		if (r->match_type == XE_RTP_MATCH_OR) {
>> -			if (drm_WARN_ON(&xe->drm, !rcount)) {
>> -				if (err)
>> -					*err = -EINVAL;
>> -				continue;
>> -			}
>> -
>> -			/*
>> -			 * This is only reached if a complete conjunction of
>> -			 * rules passed, in which case we short-circuit rule
>> -			 * evaluation, but still keep parsing to find any syntax
>> -			 * errors.
>> -			 */
>> -			short_circuit_or = true;
>> -			rcount = 0;
>> -			continue;
>> -		}
>> -
>> -		if (short_circuit_or || rule_match_item(xe, gt, hwe, r)) {
>> -			rcount++;
>> -		} else {
>> -			/*
>> -			 * Advance rules until we find XE_RTP_MATCH_OR to check
>> -			 * if there's another set of conditions to check
>> -			 */
>> -			while (++i < n_rules && rules[i].match_type != XE_RTP_MATCH_OR)
>> -				;
>> -
>> -			if (i >= n_rules)
>> -				return false;
>> -
>> -			rcount = 0;
>> -		}
>> -	}
>> -
>> -	if (drm_WARN_ON(&xe->drm, !rcount)) {
>> -		if (err)
>> -			*err = -EINVAL;
>> -	}
>> +		*err = match_ctx.err;
>>  
>> -	return short_circuit_or || rcount;
>> +	return match;
>>  }
>>  
>>  static bool rule_matches(const struct xe_device *xe,
>> 
>> -- 
>> 2.53.0
>> 
>
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
