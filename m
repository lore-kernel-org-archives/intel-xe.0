Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A665DEB2700
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 21:56:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 604F510E609;
	Tue, 10 Feb 2026 21:56:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QK9A0gGY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B42F910E609
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Feb 2026 21:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770760574; x=1802296574;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ma+f6sGGMODL6iDSjkyqCztug4w7mijV+Hlo1P837kQ=;
 b=QK9A0gGYzqEvzp7DGyP1BP2P5fd5YofhwxSpM3UXaGuxDvMk5V78SAvT
 Df8AgCEfxHAHldDsjQN93qMzxrBh/0W+Jm1xnQZRjUPmbzTAmMSGlefTp
 sxM3/IEk10IVv4ggSfPFrj/OIVl+XlXwuhVmX0JFnVh9jgmj9P+63KEwE
 xYmL0/TiE1cPiZa1RTFNoHtQX25cqr3jBjH2woX/SrgWObYI7srYuzgfK
 Ql/po6If2ZJ4z36xhQ1Ih0/manEFMokqYKokJwAVSyGZvu9oWLiQSkUwk
 /e5dmd/DOZ+zHoSUhfMYZcq8NoCeLb5yHnGkpbiQvNW92YF4tIS91PJAE Q==;
X-CSE-ConnectionGUID: p46PNP7QRFmVE0/a45JHfw==
X-CSE-MsgGUID: hz1IA7NQTJ6QJp5zPN5KEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="97357814"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="97357814"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 13:56:10 -0800
X-CSE-ConnectionGUID: dGzEeuQ0TdKP2/CF7kxyvQ==
X-CSE-MsgGUID: 3UbUWYHFTeWhiFqBplZN7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="212138992"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 13:56:10 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 13:56:09 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 10 Feb 2026 13:56:09 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 13:55:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=auxu2Tg7DiGGiaCCyTxELUMYpexUTwPdWnYsm9PTR2buUYYrIKGm6cBeWqGtIMMoMuVQd04Spczz7bTHsccsW7UjMZk9nMMBVJMTB9ldnudMOw6+Iy4y78VnnvrS8GepVpNEL50aItMYfatrsI6zvGYXAWGWf/3iAuUgQswb+jprgf8HXo0l/bfd2B8mSddUk21565S/gjxrGY2sJM6oI8KD6o+LMdR/ovx4U01gj2K4A5LGZ5VCNtXJAIEdOo2eZbNqypGVtH/gfvRBa2hNhnp7d/D7F5KOYeeC9/QgINAwqiUWOvHQ8h4flTiGNWmRl9zeLcq+cwaT6X6t6uWFzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kk3l3O15tHxD71RDDy/rdb+Rixru+yt7ZeeUjII1F68=;
 b=KozpSoqLAG6MNIBqpXpeeAtgYcrXI1tq7cfX7cZFIpQ8rkbYtN933HW0WgodfjfZ1MuNKVgU0Vis0EDH2eiXWtiYD9MhyLVSys3B98MVKUE291SQgazSnX7o6SNZU3Pjlo03Xf1th5Xm1Mw2WHfHqeNJR6LC3mjnSt0zfhkKvEGqYoHoG3pZlr43RaXjVe732A6pYJ3qcZhaCq/vWl7cBvvx3O+dpHNzt2WLyD8RtefdQ0p62CTU8RINU/HcPehjbwZetGXEGWclcr2+a8oCz+kLsqi7iyCp5Wxi9y2btPIkR4tyjxnOptqMDt1Hw1ss0+R2zYZToGUHR0l5qwoT6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by IA3PR11MB8893.namprd11.prod.outlook.com (2603:10b6:208:577::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 21:55:29 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf%6]) with mapi id 15.20.9611.006; Tue, 10 Feb 2026
 21:55:29 +0000
Date: Tue, 10 Feb 2026 13:55:27 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Gustavo Sousa <gustavo.sousa@intel.com>, 
 Michal Wajdeczko <michal.wajdeczko@intel.com>, <harish.chegondi@intel.com>
Subject: Re: [PATCH 1/1] drm/xe/xe2lpg: Extend Wa_18041344222 to graphics IP
 20.04
Message-ID: <aYupT2jXJEBqvxwF@intel.com>
References: <ddcfcd0631ccc39a84d63e1760cce672dcc7f097.1769499842.git.harish.chegondi@intel.com>
 <20260127205004.GA2174980@mdroper-desk1.amr.corp.intel.com>
 <aXv_7mzwHdpYVGY0@intel.com>
 <20260130182814.GB458797@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260130182814.GB458797@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR13CA0127.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::12) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|IA3PR11MB8893:EE_
X-MS-Office365-Filtering-Correlation-Id: 25fddaab-b351-49fc-2490-08de68ef1b34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2VkVFdJOXBQYWtLSE5iSXIzbzYrTHRYc05LRUEwMU5QVDlpTHBuVnNObTJZ?=
 =?utf-8?B?dm5HdlRqVEhTQjRjSnpheFZKSmg0Y0phN1ZUSGlucnJZZ3ZVVHpMTklOWGN0?=
 =?utf-8?B?K1Uvb0ZLL1daTkR6L2RLellVdzdKa3YxZ3NVV2NQRFFtNml3ZGd4YklxR2g0?=
 =?utf-8?B?M1NpVFpMYTNjQkNlS3V6cFViWFFYNFpmRzRHK3E4SzVzb1pkMTJlOFYya3Mz?=
 =?utf-8?B?WUEveTRjUFdZcW5xZURubG1wbllNWXBlemltWSs3U1ZZNlJsbEFXeUJoNEo2?=
 =?utf-8?B?RDVqRDFpdDlVa1kvdmFQakVjNWJMVjBUTFVGalVSL0pnVDlZZ003SUgyWjFM?=
 =?utf-8?B?bUxzSUROMTVHU0pMc2V2bXVZcTBzZFNyMHFqa0V0K3BaamdEWXpEMnBmTUFh?=
 =?utf-8?B?c2VIQWdwYTN2UjV1RHg3VkpqOElUQ2s2cnVsZEFReGtDbDNONE5nOEtWUXFK?=
 =?utf-8?B?QkF4MUs4TjQxWjhCOTBnbkxzK3hFdTlzaXgwbG8wNnhya1RxVGVSU1l6am5V?=
 =?utf-8?B?NjBBZE91NnpvY2haeFR2L2xsYTdDUlp6aWpIZjl2MHNpbGRwSEtQS01lWjlw?=
 =?utf-8?B?Q1BaNVRaSVNYNXAxQTZLNzZDRS9adm15Rm5jVWVEOWJaWnhxTXFXZnIweFlV?=
 =?utf-8?B?b0VLeGJUMEFxQW81NjBWdzJIUGplbTQ3Rlk1RXAwcy9GeXV5cjFEejN3bHRS?=
 =?utf-8?B?UXd3eXErUmswNlo5bUdaZU5JZUx3T2RKM0xUZGdDSDFONmFHUHExZzR6ZkNw?=
 =?utf-8?B?OTRKa0NxeGJieFpRWTE4bkdQNHVnSmd1M3RxQ3FucWRYeG9XR20xbTB6Q3gw?=
 =?utf-8?B?MzMrSVdnbU82RUJKNjRIcENyRkp5YkorQlhlYkNuRHlDalhaVnhUSVluVFQx?=
 =?utf-8?B?elE1K2preVYyNlAwbDh1Wk9iNEtkZGFRMkhHVWMvTFFuNk1qVTdGNkhTOUhL?=
 =?utf-8?B?dlRUNkxSY0tOc3pFa1Rab1M4dHlHNk9EcFQybVBNR1ZlTnZiNm9scTEyVVZk?=
 =?utf-8?B?dzRXL0F6SVMvd2gxdVBrN2tUMUR5R25SOHNzWXBXYmw0NDByemxpNXhsWG9u?=
 =?utf-8?B?VHhxcG8vVFpZRENOU084OGsreUtQWmhLTHNkdjFtbE5HN2lUdHhDLzVPUWMx?=
 =?utf-8?B?SWJ6aSt3UW0wWDk5Y3JUNkZZWlBxc1kyV1lOeTZ0RnpUMUNRK09IbUhSTGw0?=
 =?utf-8?B?b2ZPYlN2cWhlV2xwVnJpUytnZVB1eURDM1lldWZVUzN1dU9xaUZONUFRZnJF?=
 =?utf-8?B?Vm5rVSt2TkJldUU4ZmFpWmlFQ2VZWC9EZ3B1N2VKWWhLWklqTnhKWVh3ajVo?=
 =?utf-8?B?TTdyR3lIU2F2TFlubkRJQkhKNVJxc1psSkhtb1c4bDNqd2c4U3VUVG9KU3p1?=
 =?utf-8?B?eFYzL0Y3T3IwUWQ2MGtwZmxLVDQ5aHI5Ulp3Z2Z1L003ZEpWQnN2QW04SzZV?=
 =?utf-8?B?S1hZaFhIc28vOEFhOFR0d0hpZGY0V2Q3enRBblFodldhMVVQMGUrZUhmMGo3?=
 =?utf-8?B?QVhHbmtNckdHeGxYL0ZhQkhncDJxNktrQkx6SS84UlA0dVBVVWpXOG8zMGZB?=
 =?utf-8?B?bVVObDJvNDFFNHlrY3V1ZUNyakJGTmt0SXdmb3JpZEZpQmlBUDBSczliSVVH?=
 =?utf-8?B?TXErWm5hZ1VBUFJmTUdiT21Uc0pXVjhpdm41cUwza0Z2K3dxQXZVL20zSHEv?=
 =?utf-8?B?R3hzb2xPb2Zjb2ZhYmhpa2JOQnJLQlNmeHJEMWFoWnpTSnl2TVRzRjhoY2VD?=
 =?utf-8?B?UCs3NXZpSENCVEVKUlRyNmZpalg5V3BBNnRmN0ZPRWYxdzI2UCtvRWl4eHdm?=
 =?utf-8?B?UWVndTFBY2NOT1NRU3JpbXl4QnVsQkMzV2V3bCtBZG1MMm1Ya1JDMUgxVm9D?=
 =?utf-8?B?TGZLYndLMmkxQjhuajBEbWthR1ZJcU14MFRRN2treWl6R1FaWGdiaDhETmxY?=
 =?utf-8?B?enJQQVBGRzBQNEhBQmV6aDA3SGlmVklnb2tndVpCVEhZOVBJbjhxZG5WRlAw?=
 =?utf-8?B?amc2OVlZZmNtNzNjaVZjMGtiV2xnQ1NlU1cvY0ZtOHZBNmxQbFJTNm1aQVBv?=
 =?utf-8?Q?4kmJcZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXJReDlUbUJDb3FIUEdGTW9TSkdkWjFJR2tHbkxmODNKYjJmM2thVW5rTU82?=
 =?utf-8?B?c05oVXRYU2tlNENmWFQrcmdTcDRwY3N0SnBybk85Q1EzQXlDd2NSNnEvL0x5?=
 =?utf-8?B?SWlmTm1yYlVwbHNuMk9YTDJnMGJSVUo1bTlSWmUyTlJZYkdNYXFob1p1MXY5?=
 =?utf-8?B?MEpSOEpPbTVXUklBamRVUlVGWEJXeVpFUllwVWFvNERpNHdjUWI0ellIMkFq?=
 =?utf-8?B?STIyYzZ4bzlpVm1UVElqVUVoMFZhTlMzbS9zYTlyOHN5aWZNbmg5R1c2M01w?=
 =?utf-8?B?SlV3US8zY0c5TS9JcFR3aTZpQjIxajVwZUk5Uk5ubXFKRG1jRXNlUUtDQWJU?=
 =?utf-8?B?Z1JKVHhsVCt6aWJPUGp5ZHFHS1NkUGpaelJtU1FZSE9YSStzQ0oxK0h0Tkw2?=
 =?utf-8?B?REdTRGNhNkJZeXF1VDNCTTVzbU5YTjNKTStaTkRpWkVZUUFXT2tUdzEvNkw0?=
 =?utf-8?B?SFFhclB5Q2p0VmJ1TFNzcWl5OE1SazVuVFhMNUFmUkFGdytoYkRZcy83R2JF?=
 =?utf-8?B?amU2NjFrR2paYXJLRFRCMThzbjBERVg1SU1JOGFLaWdhdmltY3VHQjVuUVZF?=
 =?utf-8?B?Q05qc0NxZ3Bpb2lxbkZFVXlFL3YyeEpndDZYRUx4Z2tCMnhBbjhUS1RqWlRM?=
 =?utf-8?B?TXg3TjF4QVlmV0lJQkpycE9uNHloYVlzS2FkWkx0REtWMnhJS2E3WHpONXFn?=
 =?utf-8?B?blpjMzZsNlQrYjJBSlVyS3poV0ptaFZwUkNrOUpzMWJMbk5FZHNacCtJS1JM?=
 =?utf-8?B?aGh1VHVPSy9xTUlKQ0JTNC8wZkdhMHIxVHR6MDF2elhnYTgxazRIQURud0tp?=
 =?utf-8?B?d0dJOGhEVkVvSS9xMWg0U2NrS2szZUZpOHZDVjlEaEROUUQwbXhtYUN0M1R1?=
 =?utf-8?B?ZVNGL0k5N2ZuUFhvOWcvYmw0MVhGeXpBaE4rWCtMb0RobUhpMHVsQ2REVXpX?=
 =?utf-8?B?RVJZR0JvUGloWHczbFNqNE83akxNKy91RGM2L2NZTGl1VlArS3JnVXZxSzd4?=
 =?utf-8?B?TWpkSzNBWmo3ayt5d2hSb3U3RUdCREhibzNCWkFZQmUzZ1lTNVFhTm0yRHZq?=
 =?utf-8?B?dGU5TVdJbTlmSFRVY2NHakp2bjhaMWdwamUvOTRoT24xSU1PNTUvbWNibUF5?=
 =?utf-8?B?L1owL0RZSXhSMkRYZ1Q4OFBDUDAxWGdJU2diR3AySFFJR0NTRmhrblZLT0lV?=
 =?utf-8?B?czcwL0JjVTJWcWp3NW93U0VTM2w5NTV3U3BBQXpJb0JiTXFEYlE4VCtjMlJC?=
 =?utf-8?B?dElZdmhUT1M5OFRsMlJEdkxZUDJJcDZIRTZoQ0ltNmxBK3gxWWFJRXNtMHRh?=
 =?utf-8?B?b1FMZS92QTcyYUNndW9nU0Z2dUtBTldCeW9ubDhVWlJnK00wZTBDRlM1MnI2?=
 =?utf-8?B?TzNhSjl2VmU0a29PdXBmakg2d2NxbW9Pa0FaMGU1clRlWCt4M2w1cE92V2py?=
 =?utf-8?B?SEVLaXhpZzNLc0JOc2RYcmFhWnBBTHZHbWpWbG1wNm03aGRQUVBhV2hwZ1ZC?=
 =?utf-8?B?WXhoWDRzc0RiWmJTaEZVajdxeGZvWEFVN0dSdVg3aC8wcDUvajR5eHpjcVRk?=
 =?utf-8?B?RzM0UmtZSlNnQ0RyNW16TkQyK3Z1UWhYY2RQRHNrV3pMSENobTBLdzFwTGpT?=
 =?utf-8?B?TlBtTEtBK3R3WGxLOUJLSSt4a0lSUHJhTEgvbzlmeG9iM1Q5MmsvT2p3RXN6?=
 =?utf-8?B?ZVBTMEJOaEkyc1BNQWhqc3ViNDNHMjEwRlBaU3RBZ0YwRkQraTN5NS9EQVFn?=
 =?utf-8?B?OHFxcC9TbmJRUGltK1VyNHhSRFBYLzVjdTJ5Si9KZEZFOXlEbk1zdFczZHo5?=
 =?utf-8?B?dHUwa2RoNGo4UVQ5cXlSOTd3V1dGNkNwTEw3ckxqSmRLaGdzQ3VxRXJjU2kw?=
 =?utf-8?B?TjNWSVhud2trT3hweW9pTVVaYzh3end0LzBTWU1vcWkxeVIwWnlOZHE1TW9o?=
 =?utf-8?B?WTF2OTNEendxTmFVQS9RTzBxZCs1ZWVlU3VnYzQzOS9ROGl6TEFSKzBOTW5Q?=
 =?utf-8?B?VDYwSEJsOElsOGRMVlZ1TUdzRE0xajMzVHk4RVpVclVvVXJxeWlVWWZkMENj?=
 =?utf-8?B?cStxY2tqZDI1Sm82QUJMSjFXY3padEJmYU5ib254d0lhbWhFeHByRXZ1L0pn?=
 =?utf-8?B?azBmcHBQdzFVb1pBbjR2OHVVY3h1a1R3TlExT3dMZTZHSERzWXpwMTRkdjB5?=
 =?utf-8?B?MFFMT3BNWmpMYnJ3T2xpM3RmY3dZTlhQNStQQnUyYVJFNXh4ZmFiRU02RDRt?=
 =?utf-8?B?VWlpc0tJT3FRQ3FBdTV4QmtBVm81UjRPa25mck9Mc1hGdlVYaTVZVW9Yc0VO?=
 =?utf-8?B?QzRGUWordkJwT3RDRllSVnlGc1h6WmRiaFNLV3E5dUlrTUZVL0V3N2FGR2lB?=
 =?utf-8?Q?EHpRPf+duEur4vFM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25fddaab-b351-49fc-2490-08de68ef1b34
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 21:55:29.7711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WE0/q9NLZRbhSSdFU8Q8xJPOBS2/wPXh73WzXI+OX4LrAG4AHwJzbXrfpcsTepU/M41SK9RVX2UAiJhVDg7GDKdlLePuXuMOgIW2Z+9zOoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8893
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

On Fri, Jan 30, 2026 at 10:28:14AM -0800, Matt Roper wrote:
> On Thu, Jan 29, 2026 at 04:48:46PM -0800, Harish Chegondi wrote:
> > On Tue, Jan 27, 2026 at 12:50:04PM -0800, Matt Roper wrote:
> > > On Mon, Jan 26, 2026 at 11:49:50PM -0800, Harish Chegondi wrote:
> > > > Apply WA 18041344222 to Xe2 LPG graphics IP version 20.04 too.
> > > > 
> > > > Bspec: 56024
> > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> > > > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_wa.c | 7 +++++++
> > > >  1 file changed, 7 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > > > index a991ee2b8781..1153a7363cff 100644
> > > > --- a/drivers/gpu/drm/xe/xe_wa.c
> > > > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > > > @@ -535,6 +535,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
> > > >  		       FUNC(xe_rtp_match_first_render_or_compute)),
> > > >  	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
> > > >  	},
> > > > +	{ XE_RTP_NAME("18041344222"),
> > > > +	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> > > > +		       FUNC(xe_rtp_match_first_render_or_compute),
> > > > +		       FUNC(xe_rtp_match_not_sriov_vf),
> > > 
> > > We don't need this; nothing on the engine_was[] list applied to SRIOV
> > > VFs so we never apply any of them.  This RTP match function is intended
> > > for OOB functions (and possibly LRC workarounds).
> > 
> > I submitted a patch series https://patchwork.freedesktop.org/series/160865/
> > to remove the RTP match function xe_rtp_match_not_sriov_vf() from the
> > earlier WA patches and the SRIOV IGT tests are failing.
> > 
> > Michal mentioned that with the below patch, WAs are applied for VFs
> > 92a5bd302458a1663 (drm/xe/vf: Unblock xe_rtp_process_to_sr for VFs)
> 
> It looks like that failure is coming from the 'process' stage because of
> the logic in your xe_rtp_match_gt_has_discontiguous_dss_groups()
> function, not because we're actually trying to apply the workaround.
> Adding the 'FUNC(xe_rtp_match_not_sriov_vf)' rule happens to avoid the
> crash because of short-circuiting, but you'd still be getting the crash
> if you'd put that after your custom FUNC() rule instead.
> 
> 
> There are two steps for workarounds/tuning programming:
>  - Step 1:  process the RTP table that describes all workarounds to
>    identify the subset that are relevant to the current device, and
>    compile a reg_sr list containing that subset
>  - Step 2:  apply the contents of the reg_sr list to the hardware by
>    writing the registers
> 
> Of the three main classes of workarounds we have (GT, engine, and LRC),
> only the LRC workarounds are relevant to SRIOV VFs; VFs don't have
> access to read or update the registers in GT and engine workarounds.
> So the commit Michal referenced allowed Step #1 to go forward because
> VFs do legitimately need to process one of the workaround tables (the
> LRC table).  However there's also commit c19e705ec981 ("drm/xe/vf: Stop
> applying save-restore MMIOs if VF") that blocks Step 2 for SRIOV VFs for
> the GT and engine workarounds (LRC workarounds are applied in a
> different way and not affected by that).
> 
> So the result of those two commits is that we'll process the RTP tables
> for all three types of workarounds and generate reg_sr lists of
> workarounds that we initially thing we need for the current device.  For
> the SRIOV VF case, the reg_sr list that gets generated for GT/engine is
> bogus (since we _don't_ actually want or need the workarounds it
> identified), but it mostly doesn't really matter since we effectively
> throw the list away and never apply it.
> 
> This mostly works, but there are a couple hitches:
> 
>  - Even if we'll never apply the workarounds for GT/engine in an
>    SRIOV-VF, we still spend the time processing their RTP tables to
>    needlessly generate a reg_sr.  This is a waste of time, but usually
>    harmless.
> 
>  - If any of the RULE conditions in an RTP entry try to read a register
>    that an SRIOV_VF doesn't have access to, it will get back a value of
>    zero.  On its own this is harmless, but if the logic in the rule
>    fails to account for 0 as a possible value, you can wind up with
>    things like divide-by-zero errors, which is happening with your
>    specific workaround.
With a recent patch:
4e2796c8280ad21 ("drm/xe/vf: Allow VF to initialize MCR tables")
I am not longer seeing the divide by zero errors I ran into earlier
I think it is now safe to remove the xe_rtp_match_not_sriov_vf match
function from the workarounds. I will send out a patch series to remove
the RTP match function from the earlier workaround patches and also from
the patch to extend the workaround to xe2lpg.

-Harish.
> 
>  - Even though we never apply the register programming in the driver, we
>    still report all the engine workarounds' registers to the GuC as part
>    of the ADS regset, which will cause the GuC to attempt to
>    save/restore them around resets.  This is probably harmless since the
>    VF GuC won't be able to read/write these registers, so nothing will
>    happen (and the PF's KMD+GuC are probably already handling these
>    appropriately on its own save/restore list anyway).  But it's still a
>    bit misleading/confusing.
> 
>  - I think (haven't checked) that since we filled out a reg_sr with a
>    bunch of workarounds that we're not actually going to apply, some of
>    the debugfs entries like 'register-save-restore' and 'workarounds'
>    probably report misleading/incorrect information when run in a VF.
>    Not a huge problem since it's a developer-only debug interface, but
>    it could cause confusion.
> 
> 
> So maybe what we really want to do is block the processing of RTP => SR
> at the GT and engine callsites (but not the LRC callsite) for SRIOV VF.
> Then we won't waste time processing the rules when we already know they
> won't be applied, we won't run into problems with FUNC() rules that
> can't cope with SRIOV VF environments, and we won't report misleading
> information to the GuC and debugfs.
> 
> 
> Matt
> 
> > 
> > Thank You
> > Harish.
> > 
> > > 
> > > 
> > > Matt
> > > 
> > > > +		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
> > > > +	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, EUSTALL_PERF_SAMPLING_DISABLE))
> > > > +	},
> > > >  
> > > >  	/* Xe2_HPG */
> > > >  
> > > > -- 
> > > > 2.43.0
> > > > 
> > > 
> > > -- 
> > > Matt Roper
> > > Graphics Software Engineer
> > > Linux GPU Platform Enablement
> > > Intel Corporation
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
