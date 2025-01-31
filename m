Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B88C0218F
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 17:13:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D669B10E401;
	Fri, 31 Jan 2025 17:13:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lSo6aGnM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A0EA10E401
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jan 2025 17:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738343613; x=1769879613;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=U/ogLC5yYiXlifFSQPWEJvnGDRSXP6kTXNl4gjutejI=;
 b=lSo6aGnMYb+1pFJqjM8qKfqrOZCKS90ZPya4AmoLm9OsdlIFR/3NE13+
 RoR1iRV/GA8CylPhLoEQvmexq9sqgGe0hew8VH5QU+mIdIO3Gfn5NDuSw
 gcNC+Kwmdt7uqrkCrGijuFUAUnosPWyy9HeCFRg4O8M4hLU4LLGnT298o
 EydhfoTFnHHXRuF7EtoW7DW8ux/rsE7ML0DRifVCoG7BxNWMHYcNgl4bo
 eCwK1bse2fQRKJq7e1kMRwj6Nl04l8ZwC3kYK+P37fNoaSdr3+XNsFIk7
 kCxJXu3Quxotdk5918mlwJwjxuIftiWTmkFFraSrd4xWwVFcpbIECKPaE Q==;
X-CSE-ConnectionGUID: GYqHqw4/Tz+q5PPmNS3Fww==
X-CSE-MsgGUID: lLUzJgoyQH+AZp+/M8hvKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="38806983"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; d="scan'208";a="38806983"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 09:13:32 -0800
X-CSE-ConnectionGUID: SUS06fDHT9aSU5u3I4OAOw==
X-CSE-MsgGUID: qZL7E+ZATJyZhH2/VwGa2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="132936998"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2025 09:13:32 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 31 Jan 2025 09:13:32 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 31 Jan 2025 09:13:32 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 31 Jan 2025 09:13:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p/ERXIF1ufLwPRSsVB178AuUM8mcuZZuDIY3l6Txs1hwIML7fzJ9Zuojrsw+HlCFYEVyDaZ5cOL8bqSFVJdf/LvbiuApo/AwECpwGw/2qQIdUP61jL9Ff+It09mP5MryjICV2/LTTVSJX7gzdqdwHsHLos9DNcs/sH3EBkCGZDL5+cif60r2wMRBPmcs7zR2EKZmSQrcxkvoLhbxG8VP8bYKNuD1us1fZAJvwMffVKhpx0Qv4iUhqpqkyXQM2cXdhvFop6QizYgROR/wXgTycoS6SQdNV9JqcFSMps5HdHAc5L1zsJUvIJz0ZP/MitIWEaYK92jonti/See+FYMEgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DEV2MtAunG2OZpLDWowUCAKSCt9Ji3EUFlZp0mYe+ls=;
 b=XhnA07KF0OzFWaNCNUYf01AmKMireQ7tTLJzyvXIraA3yhbaPYE/NaZxbW8X6LU7kYQqyCH2XA0oVn78YZemzkfNKzbhUaFZa/ykY4pxRxj9uUkU9WabWXTWurWpS0p51bCxGOADChkMhT/RzRPa26xtBCFStAMTVvHuwMng5GYKpWg1fWTAqp6dKrFi1mN8rDpa2zRxtkeLO8FcJGOA39Zy1IpIDSlbUahnT8akX/E8rRiEbqRz/aEF82XwFsR6GH5/0gaZ8LWN+kn5OL3eiMH2PUX8EoaBrAv1qr9xr6PqVgOspLvWhIDig3W+Hlr0uABh6gteBW/OQ6Z1tQJP/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA1PR11MB8318.namprd11.prod.outlook.com (2603:10b6:806:373::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Fri, 31 Jan
 2025 17:13:29 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%3]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 17:13:29 +0000
Date: Fri, 31 Jan 2025 09:13:27 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro
 <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v4 1/8] drm/xe: Add per-engine-class activity support
Message-ID: <Z50Et4/UGF7npJ0r@orsosgc001>
References: <20250129101653.1976699-1-riana.tauro@intel.com>
 <20250129101653.1976699-2-riana.tauro@intel.com>
 <Z5rHtFUIbLNRfBfk@orsosgc001> <Z5rlgedsHPm6lhSw@intel.com>
 <d2bb059f-61a3-4e5c-bd84-b8a746a10f87@intel.com>
 <Z5v-00L-GsSTye0h@intel.com>
 <fof33aho3t55pqxhnaclyzhld2iroeqwckd3uk47wvn3ec73iq@fftqnbgdfuic>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fof33aho3t55pqxhnaclyzhld2iroeqwckd3uk47wvn3ec73iq@fftqnbgdfuic>
X-ClientProxiedBy: MW4PR04CA0199.namprd04.prod.outlook.com
 (2603:10b6:303:86::24) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA1PR11MB8318:EE_
X-MS-Office365-Filtering-Correlation-Id: e5710ecb-95ba-413c-c557-08dd421a94ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YXYzcVhhSnZqLzFqcUd2TzNQbFdCdTU1aWx2MTBIeWtkQWpWNVF5L05ISHNB?=
 =?utf-8?B?Vm9aM1dpSjhIdk1xMk54WVUxWnlwZHJwbDNNZUp0RUk4TmRSV05nSGNnaXQ0?=
 =?utf-8?B?eEwwUkk0SjlhM0VNVHlaY0JRUXVxUmJYT0dZSms1cmk4VGsvVXRIeittc1o1?=
 =?utf-8?B?NVNaTEhQREU0OFExdGpGN2pmYWt1aGU2c1pnUjN6aHpNaVl6N2hhRjlraFd6?=
 =?utf-8?B?WnpTamVFRmZ0cktlcGw2ZGhjR2NDd1BBTXM3VXdEcUc1Zms1VzgvUmEwd3hU?=
 =?utf-8?B?aUpVOWJNMmNwbEZKS1BHL2NOVkw1RUVwVHdRUlpZa1hrZEdUcmFCTEVJK1ZB?=
 =?utf-8?B?QkQyWUo4Q0JEUUZVOW5WSmVLNWdjalYwNUx4MjZMa3ZrK3ZPMitnQm1zUUJx?=
 =?utf-8?B?c2Uwcm5ESlFpTTlYTk0wU2ZZVk93R1VBMVZqcXpmUk1pWEJmRUFZc0FseXJJ?=
 =?utf-8?B?MXQ1dzlaNkJMRWtPbENoRGxGenZOYWhsTUR5UHM1RzB1UDdBLzZPYVdzeU96?=
 =?utf-8?B?ejdwbmNkc01LM3NLZzlXVVRDVnBxUklMdHNRUEE3ckFsMVJ0UWtxQTZINTlQ?=
 =?utf-8?B?OWROQ0RVU2JFYWEvbFBtM0tHVndNWXNQaDNNeFlvckhCcVdDdVNzUEdvSjB5?=
 =?utf-8?B?UzlTL2JFbnpsdU5iT2VqOFRMZTRvZDNWTUcvZWlhQ1NPVWtBS0ZtZVNYM2pp?=
 =?utf-8?B?QkpEWGhrSHNtcFNiaFRKTXlydUpBaTJJSm9ZdEhuVHBoRXhGVVNOcHJXUDNH?=
 =?utf-8?B?RHNQcUN3V3VXVEduQUJXTjByM2t2b1lzU1dkeWt2Z3k0c3pkK0Z3ejg0NDlM?=
 =?utf-8?B?M1NpbGRLWW03U0JXVjVES0RJSU5Xd3hJWnZVODJtd2hYelVka3A1aVdpQ1dW?=
 =?utf-8?B?bEFYajNTUWYxTXVyMU5KY21QNjRGdjlxVE9lMllBcDMzK3pFaVgxTWttdUow?=
 =?utf-8?B?blltaUJlWWl6anRqZFZDcFk1OWZWL0taaGl2ZEZZRERsd2lSczNaaFNLU1Jp?=
 =?utf-8?B?d0FCUHJVOTBlUGdzNHVJMHJ0V2ZzRktiS2JBOCtGalF6NEFESkFTRzlzbzZN?=
 =?utf-8?B?RHEwS2xzOXdCT29jTHVWOHlQM2hPNGNaejJYV1FNazVlNXZLSUh0ME0vNGVJ?=
 =?utf-8?B?UUZuZDY1MDcyMElPYWZIOWtpWWxtdnJPaXA4eTYxOEN2ZEwrWTRQWEM0ZG1a?=
 =?utf-8?B?YzdCSkZVa0tFQnZhTHRXSTh4YmVwK1NROU9oa01ZaFR6REhISTA3N1V2em1j?=
 =?utf-8?B?akJDWXVMNXMvM2Fibk1BaDNld1JUYkRUYy9oUnMxWTVBY2tpYXRCaTVNQmFr?=
 =?utf-8?B?SE5SQ3hwc0J1aTlRQ05VZnNsMWVPWTNSYzNMM2xjMytMcHJpVWVkSUxBUE5h?=
 =?utf-8?B?aElHbHRZSEp2dGxHUHlQYytza1Y4am5CVU41NTFYQVhHQ0RBRENKV3A1bTlv?=
 =?utf-8?B?WHo5OFIxOW9xMVdJL2dCQjBrOXdndmw3YXFaNzF2RXhETW9MaTJKV0FnNnBT?=
 =?utf-8?B?TEIzbFNyb3JzLzNsZnR4eGVkL0JWT1Jjeit2dlA3cEJENGhKYlNISElRQno1?=
 =?utf-8?B?VDZ2OUlzVGpFVlNKTG5nVFlPU0J1V1pjWi96bkErazBCQ1p3VjUyZ1loQVFC?=
 =?utf-8?B?YVJZR2lOZmpoUDJoejZOTTFsbGJiVUszYXBWanVSSEIzVlVIS25qZzdZK0FQ?=
 =?utf-8?B?NkdBajg1MlcvdEhLMUdzWjBqRGI1bk9TcVhFOWdyYlQ0VzI3bXEvV05sVmhV?=
 =?utf-8?B?WUNCdVlMYkVKNmxkMDlnY3piTjJMcGVxV0hzRHZ0Y2l2R3lRK2RQSjZNd3BL?=
 =?utf-8?B?VC9HcGNXUDQybHZYNy9OUGZtTjlMd21RMzRRNjhoZmcwSkF0Y1FVS1hFNmdr?=
 =?utf-8?Q?oWOcge+VKPXaY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3V0RzdSWDk3Zzkrc0tuMTNYN0hMRVJyTTlVQ09HYUJJNGx4TTNGWjNyanhv?=
 =?utf-8?B?K2J1VFBnRFJrejJEcUJHVk02RnNBUklXZlRZL0FMdUdqQ3EvdHFMeExJM0ZS?=
 =?utf-8?B?OFJmRTBQMWwrT1JwVFhLTGJvc1hHN1JpWkhGS0ZnTk1XNHdMMXNCVW5qa2t5?=
 =?utf-8?B?N2d1NnVKZjUyY0tBaGZ2a0xkM1pjZDFVVXlBQXhzNmwxUEFFcWhENStNR3Rw?=
 =?utf-8?B?SDErOVBOOEUza0txTFdtUm1acDVaejFSR3NNQ2UrdGNPRlk3TUxPbjd3dGV3?=
 =?utf-8?B?MTBJUDBMWGZTNTdFdXVxZ3lDa0Y5U0R2a0RPbjI0ak10eThuUFc3WnkwOG5Q?=
 =?utf-8?B?dnBaKyswbUNBUTFVcEdEVDlwdHZmYzVOU1lhMTRvUmJZTUg2dWU1MzFUTGNu?=
 =?utf-8?B?UXkwNmp3V24wN0JMYlNnc2FNWkRuSDJsbUZLQUowMWIxNjZDUUZkVktXcHl4?=
 =?utf-8?B?Zm5tWDROY0pmZFlTc1ltdlM1anMxUGxKVWhLNXJMdnlOY0FrcWlHaS8yOFhh?=
 =?utf-8?B?dEF4N1NadkhyWExkVzBPeHEvRkN1UTBXMDZxUzc1RkNhYVlNRVI5Ykx5aUZ3?=
 =?utf-8?B?aU1iaVE1RTFUT1JjU3o4dTBldlVPTEZHMTRFbll3N29qMGd2SUo0UzlCbmVQ?=
 =?utf-8?B?UTBBb1pvOWFadWZwWFQxMEtzUXNkN281ZWNIYUtNUEtQYy9EWU1wNmZFQmFa?=
 =?utf-8?B?VVJLZVhKemVrSTdLQysyMkNtRkJzcDBiZzhhS1ZMQnhLUUlwL1hKNTZWYkZD?=
 =?utf-8?B?M1dmQnU0WE50dThHVU9ZUnVlYU1lTUZRRUpiRFBjTlJCWU82Zmo1c2tZQ1pY?=
 =?utf-8?B?dmZzTEx5RnQxakxvOGlZY2FsYkwxc1NoVlVDcDlCOGhGMktQT3BUL0EwdWpJ?=
 =?utf-8?B?bXlTR3hwQ1QxUFhMamZxT05xanJhUUF4UUMwZWxNM2dOalU1L2JOdFYrMWly?=
 =?utf-8?B?clJLUkdFejN1c3ZNU1hNRndnbjVqQVVHZHJvTVQzVjkwR1NaZmpGRG1WRnp3?=
 =?utf-8?B?enRzRjR2WC9QTWUzR2pRcFNqSWgrcnBkbDEzcTdzOUJkQm95SlBpOWhZbFdD?=
 =?utf-8?B?bE9hemdwVnNpYzVDc3hyLzlwVFVYcUoxbW9RNzFObDYwK05Db3ZLYWplbHNF?=
 =?utf-8?B?eWp3cEhSTzVDL3psYnlObjltem1UU1BBL2IrOUR2ck53RXlML0ZxZTR1WERK?=
 =?utf-8?B?aXVEdVhld1JmejdKZzNGM25xYVNGZzQ0aDZJVlZPZDdrQlEvNGhiN0VGZWM4?=
 =?utf-8?B?c01BSXdlbnFta1l6UXFtdHNTMjFsbFFESDhOU2Y4S0xWUDlqRENMeWhKZ2lD?=
 =?utf-8?B?WkI0VUprWnp0OFFkMHFZbXNpL21mVkFWUUNRQU9QU2F3T0JTYkRibXp4aG54?=
 =?utf-8?B?VFdsRWFlMmZaMHBIVmJITlNzS0ZiZkxHV2xxWFlBYTd2SThPNWZKRlIyb1lo?=
 =?utf-8?B?WnlmaEZ5Z3hXdEEwbnI1SzVaN0tETEtFM1JZamQ2c1ZqUElISDlYd2lVa1Jn?=
 =?utf-8?B?ZHpvbDhwdlRuNzVkN0lxY3poMzhFOXlsOE51Tkh4dDBjZXpzSDJXR0V0dE9F?=
 =?utf-8?B?cytyL041YmNLTC91cS9CbkRveS81cmhWUi93SXVCOU03NU1DZjJOZEtkUXdx?=
 =?utf-8?B?S0lDd3hCNmRHa2Z4N2JkTnJxSytNTXRlb0p6UmdJVmljNXY3OGdxdTJUNjlx?=
 =?utf-8?B?cHFtSHV3NndCSnhKNTV1aC9vaVJaRWMrbGJ6ZjlpVHpZYjNaOExBV1d2WGtz?=
 =?utf-8?B?YkxJNlNVS2RGSnZON1lLY2srRm1oV2lwQUFwb1djeTJocjdQTHFsQXpnYk9M?=
 =?utf-8?B?SkJKQTFiTTRBMGpKRDdpOWVKbnhlSWxZbGRScjR2SklFRlEyWHExZlp2NmRx?=
 =?utf-8?B?aU9ydm5HNWNGMWUxNGRTSEJka0Q5U0RKRnpiTDJLSnVXVFk0N2kvZExkV0dI?=
 =?utf-8?B?OFp1UnE4TUViNG8wcGk3Njd3NnJTMDdoUTBkZ3o3dEpXU04rbFhhaW9FZXl0?=
 =?utf-8?B?M0h0Z1dnS0puUko2YXg0d1pCZUZZTmV1OFVOL3VEMWN2b1B4OENkWWIxRUIy?=
 =?utf-8?B?am13Q3N4VkpsVDVJOEpzSjNRM0xvM3M2QXJmWHhabThodFpTdlNOek83U0ps?=
 =?utf-8?B?UEVseWYrK242NlMzZ3lWL3NNZTdrLzAvMC9SSGcvUlcvNjFWZjZWZVdqalRy?=
 =?utf-8?Q?zd4SnA2mKlmfzSJzBg1l7A8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5710ecb-95ba-413c-c557-08dd421a94ad
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 17:13:28.9876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AjybMLCYzhEfw1vnP/kEiK0mAeeQuY5n9ioR4ZM2BLl+IjTdpTDAcmib4xTti0QZviaN+N3d1qzJVAUYkOjpAXNYOChkl//+7KFe+UZlgF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8318
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

On Thu, Jan 30, 2025 at 05:56:05PM -0600, Lucas De Marchi wrote:
>On Thu, Jan 30, 2025 at 05:36:03PM -0500, Rodrigo Vivi wrote:
>>On Thu, Jan 30, 2025 at 10:19:24AM +0530, Riana Tauro wrote:
>>>Hi Umesh/Rodrigo
>>>
>>>On 1/30/2025 8:05 AM, Rodrigo Vivi wrote:
>>>> On Wed, Jan 29, 2025 at 04:28:36PM -0800, Umesh Nerlige Ramappa wrote:
>>>> > On Wed, Jan 29, 2025 at 03:46:44PM +0530, Riana Tauro wrote:
>>>> > > GuC provides support to read engine counters to calculate the
>>>> > > engine activity. KMD exposes two counters via the PMU interface to
>>>> > > calculate engine activity
>>>> > >
>>>> > > Engine Active Ticks(engine-active-ticks) - number of active ticks for engine
>>>> > > Engine Total Ticks (engine-total-ticks) - total ticks of engine
>>>> > >
>>>> > > Engine activity percentage can be calculated as below
>>>> > > Engine activity % = (engine active ticks/engine total ticks) * 100.
>>>> > >
>>>> > > v2: fix cosmetic review comments
>>>> > >     add forcewake for gpm_ts (Umesh)
>>>> > >
>>>> > > v3: fix CI hooks error
>>>> > >     change function parameters and unpin bo on error
>>>> > >     of allocate_activity_buffers
>>>> > >     fix kernel-doc (Umesh)
>>>> > >     use engine activity (Umesh, Lucas)
>>>> > >     rename xe_engine_activity to xe_guc_engine_*
>>>> > >     fix commit message to use per-engine class(Lucas)
>>>> > >
>>>> > > v4: remove forcewake as engine is already running
>>>> > >     when reading gpm timestamp
>>>> >
>>>> > + Rodrigo
>>>> >
>>>> > Sorry, I think I mentioned offline that the runtime pm get is sufficient for
>>>> > reading this register, but it's not. It does need a forcewake of the GT
>>>> > domain.  At the same time, we cannot use the xe_force_wake_get because of
>>>> > the lockdep issue you mentioned and also I assume that xe_force_wake_get may
>>>> > sleep and the event may be read from irq context.
>>>The lockdep issue is due to perf holding a raw_spinlock and forcewake having
>>>a spinlock. In 6.13 due to config PROVE_RAW_LOCK_NESTING being enabled was
>>>seeing this issue. Latest patch has disabled this due to issues with i915.
>>>
>>>[  465.359017] =============================
>>>[  465.363050] [ BUG: Invalid wait context ]
>>>[  465.367063] 6.13.0-rc5-xe #11 Tainted: G     U
>>>[  465.372544] -----------------------------
>>>[  465.376555] swapper/0/0 is trying to lock:
>>>[  465.380652] ffff88810d5b8098 (&fw->lock){....}-{3:3}, at:
>>>xe_force_wake_get+0x1f9/0x8c0 [xe]
>>>[  465.389168] other info that might help us debug this:
>>>[  465.394221] context-{5:5}
>>>[  465.396847] 1 lock held by swapper/0/0:
>>>[  465.400682]  #0: ffff88885f031fb8 (&cpuctx_lock){....}-{2:2}, at:
>>>__perf_event_read+0x60/0x230
>>>[  465.409295] stack backtrace:
>>
>>
>>hmmm I had forgotten about this...
>>
>>Lucas, since you were the last one that looked into it,
>>would be feasible to switch at least the xe_force_wake towards
>>raw_spinlock?
>
>no, I don't think so. We hold the spinlock and then call
>xe_mmio_wait32(... XE_FORCE_WAKE_ACK_TIMEOUT_MS). Yeah.. it's only upper
>bound, but we should look at other solutions.
>
>1) move the read to the hrtimer, like is done for e.g. rapl. We can then
>   continue using spinlock for the hw interaction.

My concern with (1) is that counter resolution will depend on the timer 
periodicity and I am slightly hesitant to do that in the KMD.  If 
possible, KMD should not be the limiting factor. In the past I recall 
i915 pmu had a 200hz timer running for sampling some events, but that 
was deemed to be CPU intensive at some point.

Also if the GPU timestamp is being populated in memory at hrtimer 
intervals, and the engine activity is populated in memory by GuC on a 
different timeline, we may end up having to sync those two in KMD to 
reduce the error margin (since eventually engine activity is a ratio of 
these two counters).

>
>2) introduce a raw_spinlock that will protect only domain->ref
>   that would allow us to implement an _if_active variant. But I
>   don't know how that would help here since we need to read the
>   register. What do we do when the fw is not taken?

_if_active was a bad suggestion for force_wake. I was confusing it with 
runtime_pm. In this case, we want to get the force_wake and read the 
register. 

>
>   on gt-c6 that idea was dropped on the floor since it was
>   not working well and overcomplicating it.
>
>3) ... something else?

Maybe along with raw_spinlock in the force_wake_get, have a fastpath for 
force_wake_get (essentially lower timeout). If that fails, we just 
return the previous engine_activity/gpu_timestamp.

4) Would it make sense to acquire a FORCEWAKE_ALL (or a subset if we 
know the specific domains of interest) at event_init and then release it 
on event_destroy?

I would prefer (4) though if that's not a big power impact. Although I 
don't know how it will affect the rc6_residency counter itself.

Regards,
Umesh

>
>Lucas De Marchi
>
>>
>>
>>>
>>>
>>>Since in this case we are checking mmio only when engine is running
>>>and gt will be active. i thought we could remove it.
>>>
>>>>>> +	if (ea->running) {
>>>>>> +		gpm_ts = xe_mmio_read64_2x32(&gt->mmio, MISC_STATUS_0) >>
>>>>>> +			 engine_activity->gpm_timestamp_shift;
>>>>>> +		ea->active = lower_32_bits(gpm_ts) -
>>>cached_activity->last_update_tick;
>>>>>> +	}
>>>
>>>But yeah, gt might enter c6 just after reading ea->running. To avoid this,as
>>>lucas suggested have to use hr timer.
>>>
>>>I thought if needed, will add it as part of a separate series.
>>>I can add the forcewake back as the config is removed and add hr timer in
>>>another series.
>>>
>>>Thanks
>>>Riana
>>>>
>>>> I don't understand this statement entirely. force wake get cannot sleep.
>>>> It is based on spin locks. It should not be issuing any lockdep here.
>>>> It is quite simple flow with minimal or none interdependency. Remember
>>>> that in i915 for instance it exists and lives in the middle of every
>>>> mmio read and write call...
>>>>
>>>> >
>>>> > I would check if we can add a helper xe_force_wake_get_if_active() and just
>>>> > use that to bump up the wakeref.
>>>>
>>>> I would prefer to not complicate things...
>>>>
>>>> >
>>>> > @Rodrigo, @Vinay Any thoughts on this ^ ?
>>>>
>>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>>
>>>> >
>>>> > Thanks,
>>>> > Umesh
>>>> >
>>>> > >
>>>> > > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>> > > Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>> > > ---
>>>> > > drivers/gpu/drm/xe/Makefile                   |   1 +
>>>> > > drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   1 +
>>>> > > drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   2 +
>>>> > > drivers/gpu/drm/xe/xe_guc_engine_activity.c   | 317 ++++++++++++++++++
>>>> > > drivers/gpu/drm/xe/xe_guc_engine_activity.h   |  18 +
>>>> > > .../gpu/drm/xe/xe_guc_engine_activity_types.h |  89 +++++
>>>> > > drivers/gpu/drm/xe/xe_guc_fwif.h              |  19 ++
>>>> > > drivers/gpu/drm/xe/xe_guc_types.h             |   4 +
>>>> > > 8 files changed, 451 insertions(+)
>>>> > > create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.c
>>>> > > create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.h
>>>> > > create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>>>> > >
>>>> > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>>> > > index 328aff36831b..7e93461c60bd 100644
>>>> > > --- a/drivers/gpu/drm/xe/Makefile
>>>> > > +++ b/drivers/gpu/drm/xe/Makefile
>>>> > > @@ -33,6 +33,7 @@ xe-y += xe_bb.o \
>>>> > > 	xe_device_sysfs.o \
>>>> > > 	xe_dma_buf.o \
>>>> > > 	xe_drm_client.o \
>>>> > > +	xe_guc_engine_activity.o \
>>>> > > 	xe_exec.o \
>>>> > > 	xe_execlist.o \
>>>> > > 	xe_exec_queue.o \
>>>> > > diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>>>> > > index fee385532fb0..ec516e838ee8 100644
>>>> > > --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>>>> > > +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>>>> > > @@ -140,6 +140,7 @@ enum xe_guc_action {
>>>> > > 	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
>>>> > > 	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
>>>> > > 	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>>>> > > +	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
>>>> > > 	XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,
>>>> > > 	XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
>>>> > > 	XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
>>>> > > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>> > > index 096859072396..124cc398798e 100644
>>>> > > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>> > > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>> > > @@ -358,6 +358,8 @@
>>>> > > #define   RENDER_AWAKE_STATUS			REG_BIT(1)
>>>> > > #define   MEDIA_SLICE0_AWAKE_STATUS		REG_BIT(0)
>>>> > >
>>>> > > +#define MISC_STATUS_0				XE_REG(0xa500)
>>>> > > +
>>>> > > #define FORCEWAKE_MEDIA_VDBOX(n)		XE_REG(0xa540 + (n) * 4)
>>>> > > #define FORCEWAKE_MEDIA_VEBOX(n)		XE_REG(0xa560 + (n) * 4)
>>>> > > #define FORCEWAKE_GSC				XE_REG(0xa618)
>>>> > > diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>>>> > > new file mode 100644
>>>> > > index 000000000000..088209b9c228
>>>> > > --- /dev/null
>>>> > > +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>>>> > > @@ -0,0 +1,317 @@
>>>> > > +// SPDX-License-Identifier: MIT
>>>> > > +/*
>>>> > > + * Copyright © 2025 Intel Corporation
>>>> > > + */
>>>> > > +#include "xe_guc_engine_activity.h"
>>>> > > +
>>>> > > +#include "abi/guc_actions_abi.h"
>>>> > > +#include "regs/xe_gt_regs.h"
>>>> > > +
>>>> > > +#include "xe_bo.h"
>>>> > > +#include "xe_force_wake.h"
>>>> > > +#include "xe_gt_printk.h"
>>>> > > +#include "xe_guc.h"
>>>> > > +#include "xe_guc_ct.h"
>>>> > > +#include "xe_hw_engine.h"
>>>> > > +#include "xe_map.h"
>>>> > > +#include "xe_mmio.h"
>>>> > > +
>>>> > > +#define TOTAL_QUANTA 0x8000
>>>> > > +
>>>> > > +static struct iosys_map engine_activity_map(struct xe_guc *guc, struct xe_hw_engine *hwe)
>>>> > > +{
>>>> > > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>>>> > > +	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
>>>> > > +	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>>>> > > +	size_t offset = 0;
>>>> > > +
>>>> > > +	offset = offsetof(struct guc_engine_activity_data,
>>>> > > +			  engine_activity[guc_class][hwe->logical_instance]);
>>>> > > +
>>>> > > +	return IOSYS_MAP_INIT_OFFSET(&buffer->activity_bo->vmap, offset);
>>>> > > +}
>>>> > > +
>>>> > > +static struct iosys_map engine_metadata_map(struct xe_guc *guc)
>>>> > > +{
>>>> > > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>>>> > > +	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
>>>> > > +
>>>> > > +	return buffer->metadata_bo->vmap;
>>>> > > +}
>>>> > > +
>>>> > > +static int allocate_engine_activity_group(struct xe_guc *guc)
>>>> > > +{
>>>> > > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>>>> > > +	u32 num_activity_group = 1;
>>>> > > +
>>>> > > +	engine_activity->eag = kmalloc_array(num_activity_group,
>>>> > > +					     sizeof(struct engine_activity_group),
>>>> > > +					     GFP_KERNEL);
>>>> > > +
>>>> > > +	if (!engine_activity->eag)
>>>> > > +		return -ENOMEM;
>>>> > > +
>>>> > > +	memset(engine_activity->eag, 0, num_activity_group * sizeof(struct engine_activity_group));
>>>> > > +	engine_activity->num_activity_group = num_activity_group;
>>>> > > +
>>>> > > +	return 0;
>>>> > > +}
>>>> > > +
>>>> > > +static int allocate_engine_activity_buffers(struct xe_guc *guc,
>>>> > > +					    struct engine_activity_buffer *buffer)
>>>> > > +{
>>>> > > +	u32 metadata_size = sizeof(struct guc_engine_activity_metadata);
>>>> > > +	u32 size = sizeof(struct guc_engine_activity_data);
>>>> > > +	struct xe_gt *gt = guc_to_gt(guc);
>>>> > > +	struct xe_tile *tile = gt_to_tile(gt);
>>>> > > +	struct xe_bo *bo, *metadata_bo;
>>>> > > +
>>>> > > +	metadata_bo = xe_managed_bo_create_pin_map(gt_to_xe(gt), tile, PAGE_ALIGN(metadata_size),
>>>> > > +						   XE_BO_FLAG_SYSTEM |
>>>> > > +						   XE_BO_FLAG_GGTT |
>>>> > > +						   XE_BO_FLAG_GGTT_INVALIDATE);
>>>> > > +	if (IS_ERR(metadata_bo))
>>>> > > +		return PTR_ERR(metadata_bo);
>>>> > > +
>>>> > > +	bo = xe_managed_bo_create_pin_map(gt_to_xe(gt), tile, PAGE_ALIGN(size),
>>>> > > +					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>>>> > > +					  XE_BO_FLAG_GGTT |
>>>> > > +					  XE_BO_FLAG_GGTT_INVALIDATE);
>>>> > > +
>>>> > > +	if (IS_ERR(bo)) {
>>>> > > +		xe_bo_unpin_map_no_vm(metadata_bo);
>>>> > > +		return PTR_ERR(bo);
>>>> > > +	}
>>>> > > +
>>>> > > +	buffer->metadata_bo = metadata_bo;
>>>> > > +	buffer->activity_bo = bo;
>>>> > > +	return 0;
>>>> > > +}
>>>> > > +
>>>> > > +static struct engine_activity *hw_engine_to_engine_activity(struct xe_hw_engine *hwe)
>>>> > > +{
>>>> > > +	struct xe_guc *guc = &hwe->gt->uc.guc;
>>>> > > +	struct engine_activity_group *eag = &guc->engine_activity.eag[0];
>>>> > > +	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>>>> > > +
>>>> > > +	return &eag->engine[guc_class][hwe->logical_instance];
>>>> > > +}
>>>> > > +
>>>> > > +static u64 cpu_ns_to_guc_tsc_tick(ktime_t ns, u32 freq)
>>>> > > +{
>>>> > > +	return mul_u64_u32_div(ns, freq, NSEC_PER_SEC);
>>>> > > +}
>>>> > > +
>>>> > > +#define read_engine_activity_record(xe_, map_, field_) \
>>>> > > +	xe_map_rd_field(xe_, map_, 0, struct guc_engine_activity, field_)
>>>> > > +
>>>> > > +#define read_metadata_record(xe_, map_, field_) \
>>>> > > +	xe_map_rd_field(xe_, map_, 0, struct guc_engine_activity_metadata, field_)
>>>> > > +
>>>> > > +static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>>>> > > +{
>>>> > > +	struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>>>> > > +	struct guc_engine_activity *cached_activity = &ea->activity;
>>>> > > +	struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
>>>> > > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>>>> > > +	struct iosys_map activity_map, metadata_map;
>>>> > > +	struct xe_device *xe =  guc_to_xe(guc);
>>>> > > +	struct xe_gt *gt = guc_to_gt(guc);
>>>> > > +	u32 last_update_tick, global_change_num;
>>>> > > +	u64 active_ticks, gpm_ts;
>>>> > > +	u16 change_num;
>>>> > > +
>>>> > > +	activity_map = engine_activity_map(guc, hwe);
>>>> > > +	metadata_map = engine_metadata_map(guc);
>>>> > > +	global_change_num = read_metadata_record(xe, &metadata_map, global_change_num);
>>>> > > +
>>>> > > +	/* GuC has not initialized activity data yet, return 0 */
>>>> > > +	if (!global_change_num)
>>>> > > +		goto update;
>>>> > > +
>>>> > > +	if (global_change_num == cached_metadata->global_change_num)
>>>> > > +		goto update;
>>>> > > +	else
>>>> > > +		cached_metadata->global_change_num = global_change_num;
>>>> > > +
>>>> > > +	change_num = read_engine_activity_record(xe, &activity_map, change_num);
>>>> > > +
>>>> > > +	if (!change_num || change_num == cached_activity->change_num)
>>>> > > +		goto update;
>>>> > > +
>>>> > > +	/* read engine activity values */
>>>> > > +	last_update_tick = read_engine_activity_record(xe, &activity_map, last_update_tick);
>>>> > > +	active_ticks = read_engine_activity_record(xe, &activity_map, active_ticks);
>>>> > > +
>>>> > > +	/* activity calculations */
>>>> > > +	ea->running = !!last_update_tick;
>>>> > > +	ea->total += active_ticks - cached_activity->active_ticks;
>>>> > > +	ea->active = 0;
>>>> > > +
>>>> > > +	/* cache the counter */
>>>> > > +	cached_activity->change_num = change_num;
>>>> > > +	cached_activity->last_update_tick = last_update_tick;
>>>> > > +	cached_activity->active_ticks = active_ticks;
>>>> > > +
>>>> > > +update:
>>>> > > +	if (ea->running) {
>>>> > > +		gpm_ts = xe_mmio_read64_2x32(&gt->mmio, MISC_STATUS_0) >>
>>>> > > +			 engine_activity->gpm_timestamp_shift;
>>>> > > +		ea->active = lower_32_bits(gpm_ts) - cached_activity->last_update_tick;
>>>> > > +	}
>>>> > > +
>>>> > > +	return ea->total + ea->active;
>>>> > > +}
>>>> > > +
>>>> > > +static u64 get_engine_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>>>> > > +{
>>>> > > +	struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>>>> > > +	struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
>>>> > > +	struct guc_engine_activity *cached_activity = &ea->activity;
>>>> > > +	struct iosys_map activity_map, metadata_map;
>>>> > > +	struct xe_device *xe = guc_to_xe(guc);
>>>> > > +	ktime_t now, cpu_delta;
>>>> > > +	u64 numerator;
>>>> > > +	u16 quanta_ratio;
>>>> > > +
>>>> > > +	activity_map = engine_activity_map(guc, hwe);
>>>> > > +	metadata_map = engine_metadata_map(guc);
>>>> > > +
>>>> > > +	if (!cached_metadata->guc_tsc_frequency_hz)
>>>> > > +		cached_metadata->guc_tsc_frequency_hz = read_metadata_record(xe, &metadata_map,
>>>> > > +									     guc_tsc_frequency_hz);
>>>> > > +
>>>> > > +	quanta_ratio = read_engine_activity_record(xe, &activity_map, quanta_ratio);
>>>> > > +	cached_activity->quanta_ratio = quanta_ratio;
>>>> > > +
>>>> > > +	/* Total ticks calculations */
>>>> > > +	now = ktime_get();
>>>> > > +	cpu_delta = now - ea->last_cpu_ts;
>>>> > > +	ea->last_cpu_ts = now;
>>>> > > +	numerator = (ea->quanta_remainder_ns + cpu_delta) * cached_activity->quanta_ratio;
>>>> > > +	ea->quanta_ns += numerator / TOTAL_QUANTA;
>>>> > > +	ea->quanta_remainder_ns = numerator % TOTAL_QUANTA;
>>>> > > +	ea->quanta = cpu_ns_to_guc_tsc_tick(ea->quanta_ns, cached_metadata->guc_tsc_frequency_hz);
>>>> > > +
>>>> > > +	return ea->quanta;
>>>> > > +}
>>>> > > +
>>>> > > +static int enable_engine_activity_stats(struct xe_guc *guc)
>>>> > > +{
>>>> > > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>>>> > > +	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
>>>> > > +	u32 metadata_ggtt_addr = xe_bo_ggtt_addr(buffer->metadata_bo);
>>>> > > +	u32 ggtt_addr = xe_bo_ggtt_addr(buffer->activity_bo);
>>>> > > +	int len = 0;
>>>> > > +	u32 action[5];
>>>> > > +
>>>> > > +	action[len++] = XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER;
>>>> > > +	action[len++] = metadata_ggtt_addr;
>>>> > > +	action[len++] = 0;
>>>> > > +	action[len++] = ggtt_addr;
>>>> > > +	action[len++] = 0;
>>>> > > +
>>>> > > +	/* Blocking here to ensure the buffers are ready before reading them */
>>>> > > +	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>>>> > > +}
>>>> > > +
>>>> > > +static void engine_activity_set_cpu_ts(struct xe_guc *guc)
>>>> > > +{
>>>> > > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>>>> > > +	struct engine_activity_group *eag = &engine_activity->eag[0];
>>>> > > +	int i, j;
>>>> > > +
>>>> > > +	for (i = 0; i < GUC_MAX_ENGINE_CLASSES; i++)
>>>> > > +		for (j = 0; j < GUC_MAX_INSTANCES_PER_CLASS; j++)
>>>> > > +			eag->engine[i][j].last_cpu_ts = ktime_get();
>>>> > > +}
>>>> > > +
>>>> > > +static u32 gpm_timestamp_shift(struct xe_gt *gt)
>>>> > > +{
>>>> > > +	u32 reg;
>>>> > > +
>>>> > > +	reg = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
>>>> > > +
>>>> > > +	return 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
>>>> > > +}
>>>> > > +
>>>> > > +/**
>>>> > > + * xe_guc_engine_activity_active_ticks - Get engine active ticks
>>>> > > + * @hwe: The hw_engine object
>>>> > > + *
>>>> > > + * Return: accumulated ticks @hwe was active since engine activity stats were enabled.
>>>> > > + */
>>>> > > +u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe)
>>>> > > +{
>>>> > > +	struct xe_guc *guc =  &hwe->gt->uc.guc;
>>>> > > +
>>>> > > +	return get_engine_active_ticks(guc, hwe);
>>>> > > +}
>>>> > > +
>>>> > > +/**
>>>> > > + * xe_guc_engine_activity_total_ticks - Get engine total ticks
>>>> > > + * @hwe: The hw_engine object
>>>> > > + *
>>>> > > + * Return: accumulated quanta of ticks allocated for the engine
>>>> > > + */
>>>> > > +u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe)
>>>> > > +{
>>>> > > +	struct xe_guc *guc =  &hwe->gt->uc.guc;
>>>> > > +
>>>> > > +	return get_engine_total_ticks(guc, hwe);
>>>> > > +}
>>>> > > +
>>>> > > +/**
>>>> > > + * xe_guc_engine_activity_enable_stats - Enable engine activity stats
>>>> > > + * @guc: The GuC object
>>>> > > + *
>>>> > > + * Enable engine activity stats and set initial timestamps
>>>> > > + */
>>>> > > +void xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
>>>> > > +{
>>>> > > +	int ret;
>>>> > > +
>>>> > > +	ret = enable_engine_activity_stats(guc);
>>>> > > +	if (ret)
>>>> > > +		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
>>>> > > +	else
>>>> > > +		engine_activity_set_cpu_ts(guc);
>>>> > > +}
>>>> > > +
>>>> > > +static void engine_activity_fini(void *arg)
>>>> > > +{
>>>> > > +	struct xe_guc_engine_activity *engine_activity = arg;
>>>> > > +
>>>> > > +	kfree(engine_activity->eag);
>>>> > > +}
>>>> > > +
>>>> > > +/**
>>>> > > + * xe_guc_engine_activity_init - Initialize the engine activity data
>>>> > > + * @guc: The GuC object
>>>> > > + *
>>>> > > + * Return: 0 on success, negative error code otherwise.
>>>> > > + */
>>>> > > +int xe_guc_engine_activity_init(struct xe_guc *guc)
>>>> > > +{
>>>> > > +	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>>>> > > +	struct xe_gt *gt = guc_to_gt(guc);
>>>> > > +	int ret;
>>>> > > +
>>>> > > +	ret = allocate_engine_activity_group(guc);
>>>> > > +	if (ret) {
>>>> > > +		xe_gt_err(gt, "failed to allocate activity group %d\n", ret);
>>>> > > +		return ret;
>>>> > > +	}
>>>> > > +
>>>> > > +	ret = allocate_engine_activity_buffers(guc, &engine_activity->device_buffer);
>>>> > > +	if (ret) {
>>>> > > +		xe_gt_err(gt, "failed to allocate activity buffers%d\n", ret);
>>>> > > +		kfree(engine_activity->eag);
>>>> > > +		return ret;
>>>> > > +	}
>>>> > > +
>>>> > > +	engine_activity->gpm_timestamp_shift = gpm_timestamp_shift(gt);
>>>> > > +
>>>> > > +	return devm_add_action_or_reset(gt_to_xe(gt)->drm.dev, engine_activity_fini,
>>>> > > +					engine_activity);
>>>> > > +}
>>>> > > diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.h b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>>>> > > new file mode 100644
>>>> > > index 000000000000..c00f3da5513d
>>>> > > --- /dev/null
>>>> > > +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>>>> > > @@ -0,0 +1,18 @@
>>>> > > +/* SPDX-License-Identifier: MIT */
>>>> > > +/*
>>>> > > + * Copyright © 2025 Intel Corporation
>>>> > > + */
>>>> > > +
>>>> > > +#ifndef _XE_GUC_ENGINE_ACTIVITY_H_
>>>> > > +#define _XE_GUC_ENGINE_ACTIVITY_H_
>>>> > > +
>>>> > > +#include <linux/types.h>
>>>> > > +
>>>> > > +struct xe_hw_engine;
>>>> > > +struct xe_guc;
>>>> > > +
>>>> > > +int xe_guc_engine_activity_init(struct xe_guc *guc);
>>>> > > +void xe_guc_engine_activity_enable_stats(struct xe_guc *guc);
>>>> > > +u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe);
>>>> > > +u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe);
>>>> > > +#endif
>>>> > > diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>>>> > > new file mode 100644
>>>> > > index 000000000000..a2ab327d3eec
>>>> > > --- /dev/null
>>>> > > +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>>>> > > @@ -0,0 +1,89 @@
>>>> > > +/* SPDX-License-Identifier: MIT */
>>>> > > +/*
>>>> > > + * Copyright © 2025 Intel Corporation
>>>> > > + */
>>>> > > +
>>>> > > +#ifndef _XE_GUC_ENGINE_ACTIVITY_TYPES_H_
>>>> > > +#define _XE_GUC_ENGINE_ACTIVITY_TYPES_H_
>>>> > > +
>>>> > > +#include <linux/types.h>
>>>> > > +
>>>> > > +#include "xe_guc_fwif.h"
>>>> > > +/**
>>>> > > + * struct engine_activity - Engine specific activity data
>>>> > > + *
>>>> > > + * Contains engine specific activity data and snapshot of the
>>>> > > + * structures from GuC
>>>> > > + */
>>>> > > +struct engine_activity {
>>>> > > +	/** @active: current activity */
>>>> > > +	u64 active;
>>>> > > +
>>>> > > +	/** @last_cpu_ts: cpu timestamp in nsec of previous sample */
>>>> > > +	u64 last_cpu_ts;
>>>> > > +
>>>> > > +	/** @quanta: total quanta used on HW */
>>>> > > +	u64 quanta;
>>>> > > +
>>>> > > +	/** @quanta_ns: total quanta_ns used on HW */
>>>> > > +	u64 quanta_ns;
>>>> > > +
>>>> > > +	/**
>>>> > > +	 * @quanta_remainder_ns: remainder when the CPU time is scaled as
>>>> > > +	 * per the quanta_ratio. This remainder is used in subsequent
>>>> > > +	 * quanta calculations.
>>>> > > +	 */
>>>> > > +	u64 quanta_remainder_ns;
>>>> > > +
>>>> > > +	/** @total: total engine activity */
>>>> > > +	u64 total;
>>>> > > +
>>>> > > +	/** @running: true if engine is running some work */
>>>> > > +	bool running;
>>>> > > +
>>>> > > +	/** @metadata: snapshot of engine activity metadata */
>>>> > > +	struct guc_engine_activity_metadata metadata;
>>>> > > +
>>>> > > +	/** @activity: snapshot of engine activity counter */
>>>> > > +	struct guc_engine_activity activity;
>>>> > > +};
>>>> > > +
>>>> > > +/**
>>>> > > + * struct engine_activity_group - Activity data for all engines
>>>> > > + */
>>>> > > +struct engine_activity_group {
>>>> > > +	/** @engine: engine specific activity data */
>>>> > > +	struct engine_activity engine[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>>>> > > +};
>>>> > > +
>>>> > > +/**
>>>> > > + * struct engine_activity_buffer - engine activity buffers
>>>> > > + *
>>>> > > + * This contains the buffers allocated for metadata and activity data
>>>> > > + */
>>>> > > +struct engine_activity_buffer {
>>>> > > +	/** @activity_bo: object allocated to hold activity data */
>>>> > > +	struct xe_bo *activity_bo;
>>>> > > +
>>>> > > +	/** @metadata_bo: object allocated to hold activity metadata */
>>>> > > +	struct xe_bo *metadata_bo;
>>>> > > +};
>>>> > > +
>>>> > > +/**
>>>> > > + * struct xe_guc_engine_activity - Data used by engine activity implementation
>>>> > > + */
>>>> > > +struct xe_guc_engine_activity {
>>>> > > +	/** @gpm_timestamp_shift: Right shift value for the gpm timestamp */
>>>> > > +	u32 gpm_timestamp_shift;
>>>> > > +
>>>> > > +	/** @num_activity_group: number of activity groups */
>>>> > > +	u32 num_activity_group;
>>>> > > +
>>>> > > +	/** @eag: holds the device level engine activity data */
>>>> > > +	struct engine_activity_group *eag;
>>>> > > +
>>>> > > +	/** @device_buffer: buffer object for global engine activity */
>>>> > > +	struct engine_activity_buffer device_buffer;
>>>> > > +};
>>>> > > +#endif
>>>> > > +
>>>> > > diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
>>>> > > index 057153f89b30..6f57578b07cb 100644
>>>> > > --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>>>> > > +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>>>> > > @@ -208,6 +208,25 @@ struct guc_engine_usage {
>>>> > > 	struct guc_engine_usage_record engines[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>>>> > > } __packed;
>>>> > >
>>>> > > +/* Engine Activity stats */
>>>> > > +struct guc_engine_activity {
>>>> > > +	u16 change_num;
>>>> > > +	u16 quanta_ratio;
>>>> > > +	u32 last_update_tick;
>>>> > > +	u64 active_ticks;
>>>> > > +} __packed;
>>>> > > +
>>>> > > +struct guc_engine_activity_data {
>>>> > > +	struct guc_engine_activity engine_activity[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>>>> > > +} __packed;
>>>> > > +
>>>> > > +struct guc_engine_activity_metadata {
>>>> > > +	u32 guc_tsc_frequency_hz;
>>>> > > +	u32 lag_latency_usec;
>>>> > > +	u32 global_change_num;
>>>> > > +	u32 reserved;
>>>> > > +} __packed;
>>>> > > +
>>>> > > /* This action will be programmed in C1BC - SOFT_SCRATCH_15_REG */
>>>> > > enum xe_guc_recv_message {
>>>> > > 	XE_GUC_RECV_MSG_CRASH_DUMP_POSTED = BIT(1),
>>>> > > diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
>>>> > > index 573aa6308380..63bac64429a5 100644
>>>> > > --- a/drivers/gpu/drm/xe/xe_guc_types.h
>>>> > > +++ b/drivers/gpu/drm/xe/xe_guc_types.h
>>>> > > @@ -13,6 +13,7 @@
>>>> > > #include "xe_guc_ads_types.h"
>>>> > > #include "xe_guc_buf_types.h"
>>>> > > #include "xe_guc_ct_types.h"
>>>> > > +#include "xe_guc_engine_activity_types.h"
>>>> > > #include "xe_guc_fwif.h"
>>>> > > #include "xe_guc_log_types.h"
>>>> > > #include "xe_guc_pc_types.h"
>>>> > > @@ -103,6 +104,9 @@ struct xe_guc {
>>>> > > 	/** @relay: GuC Relay Communication used in SR-IOV */
>>>> > > 	struct xe_guc_relay relay;
>>>> > >
>>>> > > +	/** @engine_activity: Device specific engine activity */
>>>> > > +	struct xe_guc_engine_activity engine_activity;
>>>> > > +
>>>> > > 	/**
>>>> > > 	 * @notify_reg: Register which is written to notify GuC of H2G messages
>>>> > > 	 */
>>>> > > --
>>>> > > 2.47.1
>>>> > >
>>>
