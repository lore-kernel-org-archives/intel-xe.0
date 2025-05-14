Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D7FC3ABD8
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 21:06:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF10E10E742;
	Wed, 14 May 2025 21:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NJqUf9qQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF5C10E742
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 21:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747256772; x=1778792772;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Wui0Bj8UJU4vTYGAgkuq3RSxG36GscWslxkjPINfBew=;
 b=NJqUf9qQjtmhuS2sUesTzOjdMFDb60F9Qyfl7D82G0TGAHnERt5yTGMn
 OBbjAtKMmlwyuGWKBJeBurhgNF4TETM9n7+T65nRgtWD1qTeDh6lh2Fzm
 TaLYhEZe9Y2YZ+eP2BngmHYLWGtEfBhUJOKQm7MVeaVuom4eJopzY1mI7
 alZTw4ZSUej6hNpexyD0r90mNkXp3GSTAgzpw+yNpHSsey5AwbYOQlnE6
 Up8t5tv2y1yG0avJLdy89qudvRSPKQb+qydaM5sL3A0zeJWG3tzdKZ1xr
 hYPaVAqm3tDhG+aPdauOv2uuTAoSi3YJ4O8g6c/OPlzUNjguyz5PKVy33 w==;
X-CSE-ConnectionGUID: IYpfmq9YSheyOXbaHD6mGg==
X-CSE-MsgGUID: RxhRkmOWQuOu4cwWkj1MrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="48861799"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="48861799"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 14:05:56 -0700
X-CSE-ConnectionGUID: Zi/HqjTmQqaiSF2Es8g5zw==
X-CSE-MsgGUID: sed/dKXoTriyg/HOJoM79w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="139153250"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 14:05:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 14:05:54 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 14:05:54 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 14:05:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qPqPDfiklLsbMnPt8dHiJwcWG6JCsN509hdAkzG9jzw97o77nRnSk6RVmrIVlFLdL3eE3YRw9tm8wdFGqeqk3QGP4BkaCLVsup7AKQUXvqpyUWqw9WQd4kZkGar58D/qpR2PRhJl3M7qc1FlVmS6Qyt0q2SUb8HWCFd8d+ZWYu9VZ+/Js51sYXLPboz2ysqocpFWB5MsVNc9QLzyfsZki8h+2Fx0aBAv7JC70ci4zdp2Zl1vlIPNnj0T+PG/Cxx08fVdwUvLI49sRZ3lL3kWC/YxrtyDodvAnM4yeCu1DcztWI78oUGf1w5amC+iBlGI0jITng+tDWn72MbqFJ8JAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8x4M07i6cS1gSt9mr8D+QcK3Tr7S9vJzlkYYr4YGWO0=;
 b=dDDKm3Hz5XqCKBnc4JxdTpjYAbCqIQJN4cZSTVAi9EjtJ5YpxN7ZwaqgPATEnFUBpQ4oacx4pjZtZDIWX7RXRld2z4TDImoGguYdR69nBP8rp4vPXEy7em7qGbrRN3tbGWF6JrVz1OblHtl3zGgnZ+eG588zO8hgq1ft7TcfuOFEPSdJoA+aDXZO5X190dM0JpUPdnBhr4CQ2XaGUVWf933l+5xufq7zw05oE2ji79u6p9RYiPxq1X+Fs5o+4apqlve/1XVWu80KgROrJpzV/e7qdkD6Vatd6vEcaSb9paFSbLA5P9dZOWhof14sKoHlqnT24wQ3WmoWOQSg/iiclQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DM3PPF5EA507B64.namprd11.prod.outlook.com (2603:10b6:f:fc00::f25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 21:05:52 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%6]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 21:05:52 +0000
Message-ID: <6389f7ef-8041-486d-8234-d8a9cdb8cc5a@intel.com>
Date: Wed, 14 May 2025 14:05:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Introduce flag to indicate possible fault
 injection
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
References: <20250512161947.128-1-michal.wajdeczko@intel.com>
 <20250512161947.128-2-michal.wajdeczko@intel.com>
 <d03eda9b-d090-4ebc-901b-31916df24fbb@intel.com>
 <da6c2d88-d9d4-4f5d-aa5b-9a1513195fe9@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <da6c2d88-d9d4-4f5d-aa5b-9a1513195fe9@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0362.namprd04.prod.outlook.com
 (2603:10b6:303:81::7) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DM3PPF5EA507B64:EE_
X-MS-Office365-Filtering-Correlation-Id: 545d0bcd-0e24-4965-6fea-08dd932b1c2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MThZQ1pWZE1ScHNkbndPb0JjcFZrRE9GNXhkQ0doQjU5Vm1lRC9SRzhSK1Bv?=
 =?utf-8?B?YXp6cTNCL21lWFVqaG5mTEphTCtOZHJhNzV5Mk8rZmhXRWNPRENWdGlIZkdS?=
 =?utf-8?B?d3ZwUlJaR0ExaHlVM0o4dEtuWTBWYkZRZE9KOEVEa1BpbDRneGdtcWRmVll1?=
 =?utf-8?B?Z0UvdEhmWUdmc3BXMG9QWCtBREJVUUFQSDlEVldoMnJjeEs3NE9QY1I0by9t?=
 =?utf-8?B?aWw4TE1aY2NJNU5WSlprYStWYVlTN1lHeGxuS1oxZnpHZU9qVWtNVnhmSHJq?=
 =?utf-8?B?dXA2Tyt4ZlpQb2o3OVUzVHh0S3pjZUxxWi9IUCtZMDhvaHdVYXZPN1R2SmFz?=
 =?utf-8?B?L0FXd2RNNW5VUmhjL0VuUGErRHFRbTVBRVlQSzQrVTE3NC9NNi90Zld3YmtE?=
 =?utf-8?B?dEpPVXFVTUNObHp5TG8ybkgzdmpVQmNPeHFxTU5NZTVaK3c4cWlobGx5WHIr?=
 =?utf-8?B?anVCbWxEcldaS3h1SzVENitzemRydFJ6Nm53SXdzRzBnOG5nSDI1dFFQZ3lJ?=
 =?utf-8?B?Z2ZFb3dRMEFIYU9VS1dMdFhjNEUzMVNrUCtMbUUwTU5IRy9wVGFyOC9LcTJZ?=
 =?utf-8?B?aGxZdkZnUVBnNWhXK0hUaG1NN2FmZjVobUVwWFd6d3VUaXRvOWpxaUF0SUFt?=
 =?utf-8?B?OGFtSnNYbGxMWHpCOVFaWnZBM2NZTS9pVUxTcnpTMTR5NGIyWFVMaXlNWmtm?=
 =?utf-8?B?Tk1JQzZqaE5EYlVSbWtNMzZ1TGNJd1IycDMrck50YUNydjFzeDZkZmlLUUth?=
 =?utf-8?B?TE1vWDNGVU9Kem5BK1BMWkV4NHRpUWZOVE4xMzdWVWM3V2pyQ2tMZVFzcnpV?=
 =?utf-8?B?d2xHWGkvZkN5KzNZb01JclJFTWNFWnBVeGtoeHV0V2JKQkZnREJGOGpJcmpx?=
 =?utf-8?B?dW9OVDdnMEZCSjlyMllybytRUytrWkFSckcyK2xtYXN6dWt3ZGNCbGdPRXVw?=
 =?utf-8?B?dENHNUZhNjZvOHJNakxwSWc0N0FhU1ZxQVVjMTNRZE9NcTNZdzBZS2YrWlov?=
 =?utf-8?B?aGc4WXJObnVVZ3ltbXQ4andzbEg2STRWR3dSMG0rNENrTjg1RnNjWjI1bVJU?=
 =?utf-8?B?U2lMbUNkUkF0WWhzTERWbDNMblBtL2Jrb3I0TW9LclhMWXNHRmJ2akx0K0hu?=
 =?utf-8?B?MlFaSk84bS9SS3JnamN3SzAwTmhmdUlGZTZXb0U1UTl3bkkwUkRqZnpVeHRK?=
 =?utf-8?B?b29uZHQxbDJnVVRqM2tXcnBxZFA5REo2eHJpZXpzMjlDT3NEQVhTTnAyaVph?=
 =?utf-8?B?U3lWdWRQNmRoNHBza20wVTZOZGtvRDdaNHVpSXhCdFdoMWZ0ZnlHSHk0Y0ti?=
 =?utf-8?B?N1FBZFJPb0FIbXc1OFNsWGI4Z0VQaWd5Y0YybG1YVmQ1WXdMR1gyQzNLMS9m?=
 =?utf-8?B?VTFlbmF3YzVLMDRsSmJzQXE3TXhTYWM5Qm95YXBzNlcvS1pFM09uejM4T1Rz?=
 =?utf-8?B?eDNsTEp1clUvNVE5WHgyNGZKZnRsNnV6dys1cWtoNk0zMlYrYVJ4aHdidUpP?=
 =?utf-8?B?Vk43cE9wWnVpUkl3cDh3enowblhyMCtOSStmMHkrYnpvZG4rOWVNaEQzbHlS?=
 =?utf-8?B?ZStQbTNDWmF2UHNIWXA5MVBnT3VTbGwvMy9nb3JFdG1RaWN0ZlEyN2lNRXY2?=
 =?utf-8?B?OSt2VzY3T3hPZkR3ZXY0OFcrZnpKbDV4QmVkNzErU0RyZk0vSXMwTFg0WTIy?=
 =?utf-8?B?T0tOaVUyeUtmR3BCdXFKMk9ZVXowdERCTjJYMGxLOCtoODd2UExIZnBzOEx5?=
 =?utf-8?B?NnFHeGFTdlV3Z3VsMHNQV0oveXhBZFpVbzM3cWdmTXIzSnBRK3Zoa2pseU5i?=
 =?utf-8?B?OHdWZ3FWL1p1NXZSbEh6MHVNN0s1eUZSTENZanRhR2wvMlF0b2VvUjY2bFVy?=
 =?utf-8?B?RnpWcXpJWk51ZDlnb01NUk9nY3M4UGdZVTRHMEFMWFJtaE9XNWNGQXFyVEhw?=
 =?utf-8?Q?8NH5Zfy7VII=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3JScG8yekpSdkZzTk92NVhEOVM5cWJBemtiVWc0bVhRK3JId3VXKzBMN0xB?=
 =?utf-8?B?ZTdMcnFlVG9NdjhxYUdVb3NKYkl5RkZRQTVOTTIwMHd4S25Wb05uVjJyYUlx?=
 =?utf-8?B?SGROQVZmOXhJU3FMZ0RFZXhsb29GRkprL1orK1JjeW5PcUprRXlzVjhMbnl0?=
 =?utf-8?B?eW9SZ2t3aTBXQUZkNjhNN1ptK0lidzVpQzhwR1ZYUEdzN1BNbC9NWWZyZThP?=
 =?utf-8?B?TE1IRmFScXJjRU51MU9CQWtpYlFsN1R2OUlZNDY0dUJtbW4rbEg5N2N4U3VL?=
 =?utf-8?B?RFNETWFVOWZBRUw2T2l6azd4d3F6SHh2RXVrcytDMnlEYlZPQnBMc20rdmRX?=
 =?utf-8?B?V201RDJhT2V6cHVYUkdjRGJhNWRTMWNaUVdXNExqVG4wYzFjRGVKWnRINWFp?=
 =?utf-8?B?RnZ0RU9FZ0pDTno1SG1mbUZTOEw5dW5iSGJBaUo1M3FIQXAvUlJWWXdHdkxq?=
 =?utf-8?B?bmN0T0daS1RrWDF4ajF3MjRQckJnRGg5WFVWRm02b2hHeDhCakRIMTc5ZndB?=
 =?utf-8?B?NC9LVEVMV25zRHRvUkIrMDZEZ2g0a0F0SGl4YWxHTnpqTVFWamtiOVRXOWtE?=
 =?utf-8?B?QTdjRjduT3Ztdi9UaHphUThCTEk5REl2ZWwxdk52U3VnbkloaGNyNGltN290?=
 =?utf-8?B?ZWtWclpvL2ZCTmd1V1o1WDNJbnIvNm53b2pMREFnS1RSQUVrcXFna3JCWktS?=
 =?utf-8?B?dmpvTXROcnBaOE83ckFyeUlLS3FUbXBEYm5zUUk1QWlIK0ZYSDRTMnI5Mm5M?=
 =?utf-8?B?QlZXU1NHWEhxZUtrdHB6d0xXZC8wUTFwVjBQL2d2UTZyZVlXMWJjMlJGV0I3?=
 =?utf-8?B?WGVmTnlzQmhuVFFqSTcxMTA4ZzlMbGtSMlRoSGFCeGpCbkxGSzNac2k2M3NZ?=
 =?utf-8?B?b0xGSkIwU2tSbmU3T0hXZ2x0VXdXRGtEV0hXRXVQODRTQjN5V29YaG85NGtn?=
 =?utf-8?B?TUZJNlptbURFUkZlK2xzOHZzbGYrYkpZR2JuWUVBZHFJRlB4QkNaRDc4WDl4?=
 =?utf-8?B?eTMxRDcralRMTDh3K1lCUjJTRm4xK3BNVGhnbVFTL1F1MWozdFFVOEJPTzV4?=
 =?utf-8?B?Skl0akZnajlNcUl4L2NuNXVMVGpvcDkwT3dnSlI3SEFZWmxnK0ZwOTh0NmV6?=
 =?utf-8?B?dUJ2WDMxYnVmUVlNbHRLMnY4ZjVXb0dzZDIvU2R2WDdmTkl1SVczYkV4Vkd2?=
 =?utf-8?B?Z1Bab0NWVHlTQzlwa25ZQVhTY2ptWDBGNWJ5OTJxc1QyYmt5WEw0TXRWNmFX?=
 =?utf-8?B?c0J2RlNUamlWTEk5NjNMcFhtVDM2bTJUMitrQUw4VEtrOVNma2ZKS2tYbmhR?=
 =?utf-8?B?dmZFbGR0NmwxejlkVmsrd3dGUnZYSGlBeWtNM2pNUkt5anBFa2lGK1V3UC9r?=
 =?utf-8?B?TDJ1b0RVdTVTeE00V05NTmZDSmRKTDF5UEpONHdsUUxDaDB2QlVkL1Z2VnMx?=
 =?utf-8?B?T1NWczc0R2pRcVRKRzZxbVdpOFpBTERSYitXQ0ExMnpEOWdGR1lIdG1mdFNy?=
 =?utf-8?B?dEN2VWVydWpWNVkzN2Q2b05TZDRIVG1JOUhtejEwNCtUS1FyUFpQMEhlMzJp?=
 =?utf-8?B?UTR0bTFtc2ZPYk05RCtpbkI1V2JvZzZBV0h4NG1aU3E2a2NweDBCYnRyV1JU?=
 =?utf-8?B?MUVlRzFBRlRxWTFET0k3a1NEUVFOUGZ3VU9oSUQ2UlgvbXhaZklpbDJPVFFL?=
 =?utf-8?B?TjR6UHVpUWhFbTN1WjYzUXFJTlRyRXJuQVA0djdhbGI3TWlNbk92ZXJjR1dL?=
 =?utf-8?B?aEtYMEdBa2NaVjd0S1hXTjdOQkR4QXFQTERHa3R6Sjg2VytyWFhQZ1JCZkhq?=
 =?utf-8?B?WWt1SjIzNkYzdFc4R2RqTWZqbFdJRmx3ay9UM3NQQlQ2Z2JkUGpWenBqUFRY?=
 =?utf-8?B?VkVXTEl5MzZOWFRNdStkRnFGWlFsRS9keGlaclpDRm1wMUdYclByOVVyVGJI?=
 =?utf-8?B?TzMxVzNDSmkydWpEdmRzZlUxdDdtR2ppS3JDT0xjNUdiZ3plSkd5Sy93YzVD?=
 =?utf-8?B?UE9waU5vSUVpVmFhY1BMdlZKelFNNzNYeU5iem16blFJRnV0eTc5UHlUK1Bi?=
 =?utf-8?B?dTg5Y2t5RGRKZHBsbTc3MEpIanFaOUgvTzA2UkZmVVo0c0V5Z3V4TDlPbnZw?=
 =?utf-8?B?ZjNEU1hJZWRiS2Y3L1ZvcWZYa1BxbVRicDJ5aUQwYkJWVERvZlFkTlEyTE9B?=
 =?utf-8?B?cWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 545d0bcd-0e24-4965-6fea-08dd932b1c2a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 21:05:52.3795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZaiQZoj0UQcpox4DexmWBrxCs6tpHdfpSdVVf9f1881R8Rtjhv8IT+BEcakLvT34P7twKgkFQ1GLK7AwL4JUPpnhEvBbrQQwUccdbp+MzYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF5EA507B64
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

On 5/12/2025 1:20 PM, Michal Wajdeczko wrote:
> On 12.05.2025 20:36, John Harrison wrote:
>> On 5/12/2025 9:19 AM, Michal Wajdeczko wrote:
>>> When running some fault injection tests the driver might generate
>>> a lot of error logs which might unnecessary stress our CI systems.
>>>
>>> Introduce a flag exposed in debugfs that can be used by the fault
>>> injection tests to give the driver a hint to suppress non-essential
>>> error logs or dumps that might be otherwise generated.
>> Why use debugfs?
> because IMO it's more tailored solution, as actually we just want some
> flag to control level of diagnostics generated by the driver on error,
> and as you already mentioned, modparam likely would be not accepted
Tailored to what? It is certainly not tailored to testing module load 
because debugfs does not exist until module load is completed. And a lot 
of the fault injection tests are testing the error paths during load. 
debugfs will simply not work at all for those.

>
>> The whole point of the fault injection test is that it
>> replaces an existing function with something that just returns an error
>> code. Seems the perfect way to have a function which is simply "return
>> 0;" in normal usage but modified by the injection test to return an
>> error code when a test is running. Which is what the original patch was
>> doing. That way everything is self contained, there are no extraneous
>> interfaces in unrelated subsystems.
> while at the first look this idea might solve the problem of controlling
> the diagnostics level, the issue is that it would require exposing from
> the driver either a dummy state function or promoting an existing
> diagnostic function to be a fault-injectable. in both cases such
As opposed to requiring an entire new debugfs interface? A single 
exposed function seems simpler to me.

> functions would then require configuration steps where any of advanced
> fault-injection parameters will never be fully explored (like
> probability, space) so this again sounds like overshooting
I have no idea what you mean by this. What configuration do you need for 
a function which is literally just 'return true/false'? You can do 
whatever fancy fault injection test you like. That is totally 
independent of nobbling one 'is_fault_injection_acitve()' function to 
prevent excess debug spam during any and every fault injection test.

>
> IMO instead of adding more and more functions as "fault-injectable" and
> marking them then as 100% fail, we should try to find more atomic points
> of failure (like no memory, no GGTT space, no VRAM, dead FW, broken FW
> comm, lost MMIO) and then take advantage of the framework that would
> inject faults all over with some randomness or deterministic and
> potentially overlapping with each other. this would allow to write more
> generic test that will list existing "injectable" functions, without a
> need to hardcoding them in the test, where clearly our dummy state
> function or diagnostic function wont fit and will require again special
> handling
I'm not sure if you are arguing for a re-write of the fault injection 
framework in the kernel as a whole or just complaining that our IGT 
implementation is sub-optimal? But if you look at the corresponding IGT 
patch, the code to nobble the 'is_injection_active()' function is 
trivial - it just re-uses code that already exits for nobbling the test 
target functions. So it is just one extra call at the start of each 
test. There is no complexity or fragile hard-coding. And it does not 
matter what fault injection test is going to be run - how complex or 
trivial.

>> Unless you are wanting a more generic 'test_in_progress' function that
>> is not specific to fault injection, then using debugfs seems like an
>> unnecessary complication.
> yes, more generic approach is always better, and with debugfs/flag
> approach it would likely enable us to suppress some dumps while doing
> some CAT tests or live kunit negative GuC tests
Except when generic means unusable because it is not available yet (see 
above about module load testing). And kunit tests already have an 
infrastructure and API all of their own for controlling how executing is 
done during the test. Not sure what you mean by CAT tests?

John.

>
>> John.
>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>>> Cc: John Harrison <john.c.harrison@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_debugfs.c      |  5 +++++
>>>    drivers/gpu/drm/xe/xe_device.h       | 12 ++++++++++++
>>>    drivers/gpu/drm/xe/xe_device_types.h |  9 +++++++++
>>>    3 files changed, 26 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/
>>> xe_debugfs.c
>>> index d0503959a8ed..0567a57597d3 100644
>>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>>> @@ -235,4 +235,9 @@ void xe_debugfs_register(struct xe_device *xe)
>>>        xe_pxp_debugfs_register(xe->pxp);
>>>          fault_create_debugfs_attr("fail_gt_reset", root,
>>> &gt_reset_failure);
>>> +
>>> +#if IS_ENABLED(CONFIG_FAULT_INJECTION)
>>> +    debugfs_create_bool("fault_injection_in_progress", 0600, root,
>>> +                &xe->fault_injection_in_progress);
>>> +#endif
>>>    }
>>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/
>>> xe_device.h
>>> index 0bc3bc8e6803..ea25d8161050 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.h
>>> +++ b/drivers/gpu/drm/xe/xe_device.h
>>> @@ -209,4 +209,16 @@ void xe_file_put(struct xe_file *xef);
>>>    #define LNL_FLUSH_WORK(wrk__) \
>>>        flush_work(wrk__)
>>>    +#if IS_ENABLED(CONFIG_FAULT_INJECTION)
>>> +static inline bool xe_fault_injection_in_progress(struct xe_device *xe)
>>> +{
>>> +    return xe->fault_injection_in_progress;
>>> +}
>>> +#else
>>> +static inline bool xe_fault_injection_in_progress(struct xe_device *xe)
>>> +{
>>> +    return false;
>>> +}
>>> +#endif
>>> +
>>>    #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/
>>> xe/xe_device_types.h
>>> index 06c65dace026..513a811a3121 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>> @@ -578,6 +578,15 @@ struct xe_device {
>>>        u8 vm_inject_error_position;
>>>    #endif
>>>    +#if IS_ENABLED(CONFIG_FAULT_INJECTION)
>>> +    /**
>>> +     * @fault_injection_in_progress: flag used by the fault injection
>>> +     * tests to allow the driver to suppress non-essential error dumps
>>> +     * that might be otherwise generated due to an injected fault.
>>> +     */
>>> +    bool fault_injection_in_progress;
>>> +#endif
>>> +
>>>        /* private: */
>>>      #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)

