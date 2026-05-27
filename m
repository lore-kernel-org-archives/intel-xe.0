Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC871CD5BD0
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 20:04:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A7310E9B4;
	Wed, 27 May 2026 20:04:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FJcFs9q0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3FE610E9B4
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 20:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779912251; x=1811448251;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=x0jG38p8zmNAnqWez7pe/gt4XQbcRsofHN+puDq4z60=;
 b=FJcFs9q0vcmafE9ngkKMJDpnQX22zTQbqeOA/gmBmrAD6p4uGmiLcf94
 a8XjeWkeyNytgSA4Kl/LVj7m6KIkmx2QtUM/OuO99XoDakJQPHuSh5FIf
 auc/u04fjJ6ZMDt3zuv2Xu4qhf72wj0luYM2GArOglFdC5UWAItPZhy8m
 v86ck8XwccH35HwF2b6eBGopPUyFtql/UzyPb49CuklS9w9kjXmOZiGbt
 MOItcoxKdVdhsMKpMOua5BfwjNU6LM5XSZjlUGIZELd02ABYmLP17Z2H3
 h4YAOQYeffpDJS2LjS0iKfas1biqXAc8xMGNbGlpc2y+VA5CMIXmBR+lw A==;
X-CSE-ConnectionGUID: wfvjxYsSTIOrw8sKsyAgLw==
X-CSE-MsgGUID: ynp45cHIRlOL9q/6Bsm/eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="91326042"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="91326042"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 13:04:09 -0700
X-CSE-ConnectionGUID: S6Enjd1hR92LT0vNEy9yww==
X-CSE-MsgGUID: fEMUFju1RI+BkpDYepf2Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="239338543"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 13:04:10 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 13:04:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 13:04:09 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.24) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 13:04:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CkmKWSMmHroeMjEQGdkUB44SpO3hWpd3TCuJgwGrTtPSj/LSfzI6FqTdcgXnUiKjBYOET8YGjVDnhF7NXq0TFu8utR7K0IPGYvSWiUeCpvTdrxEzgfRYRdtjNaPYhDAU085Ls47gslyW19JhjQKYWv/nGOp+676PWcZO4KASVGpiEzDQxj8hsr2ciKuTHdJPZA9wPsd4bmqwE9xipGvG8V05hAJUvPa7labaBpiJAl3cFHjHdTSyi+TkdEvcqs/HYy1zJ94AjB/e5/GHy71cfUs3qcAPknuBxe9bPD1RT0VhN+Iz2mjOkum5sHYC/z+0y7G4qynW+SbMal4GYzWl8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cb68KuZlSeNewI+Z+Q63cD+xCzZr3YxghuG8QZ/LTCc=;
 b=MOlPQNd3fkAdVbtWsyRBnAB5nunyerW98hAKGycSiv6WpvbjXI94eNjpSFaqIpxnW4qiDUN2r+HBS7XUxT8QK5ThtDSouME1tO0r4aJhFfReCTRomz5SckaIAzKcxDQ7QLf6q+bCEepFquFdvHWSxZ16LWHZ+m9RvuI6ZXQY0oShG9eqVZno10Hrt0XJoV3SxA0NCIi2K9jwPLpwHAaKMQl3PuC0wifcwSkITLXd0tNGr+GObP9OG5YGJbuzeXqXf+fYHBS1xwxIMX+/rKffPMpIf6KBaczUtP2sx8D7vw9hD5R5DAIyPHhn4tTEBbBuxckzfYdNVpk1RxYxKpYcMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA1PR11MB7773.namprd11.prod.outlook.com (2603:10b6:208:3f0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Wed, 27 May
 2026 20:03:59 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 20:03:59 +0000
Date: Wed, 27 May 2026 13:03:53 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/9] drm/xe/rtp: Add RING_FORCE_TO_NONPRIV_DENY to OA
 whitelists
Message-ID: <ahdOKYJHW/U4t2l5@soc-5CG1426VCC.clients.intel.com>
References: <20260518234716.1540123-1-ashutosh.dixit@intel.com>
 <20260518234716.1540123-2-ashutosh.dixit@intel.com>
 <ag+R6ndpufdiwMej@soc-5CG1426VCC.clients.intel.com>
 <878q9cwd36.wl-ashutosh.dixit@intel.com>
 <ahXwod5FQOxZNj20@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <ahXwod5FQOxZNj20@soc-5CG1426VCC.clients.intel.com>
X-ClientProxiedBy: MW4PR04CA0056.namprd04.prod.outlook.com
 (2603:10b6:303:6a::31) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA1PR11MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b5364af-f29c-4bc9-ba14-08debc2b16df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099006|6133799003|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: VxWzUMSXm6dFbXyMVFdK0PgPmILTb2UtvkUXBzG3IX0vhxKRKDlHciEaaxn21B+VhSRybFPWZJnPet3CDHAW9Esm6WwHo0ZxLGGsLLbVyzRtR8/vN2KpzWFHZ4JPGL8lAq78PEX8s7tytAfKQAWhA4qM67YrPJ7IFb0mZHDlFxwOiQteHzBXZ60/V5KGruUSAndm1KbXcifiZrxbnKzRg00yLjLfXP5y8XraOh+vJhgRzczeWUmmHUdwZDQi8mDia4fwmZk6hh3tiH+pj/i36DeMRW5z/MKD32lpoEpnVJqTKqbDe/hTi/4qICw4hpUOjC8wRYEKrNi9HuOmchMXQBXufaOfqK6kmaHrIpU0H0lseS5TGhuRxbxSiEqhYTaB4ovZszfkmEpuxy/sp5PR51+ufEZuxdz7fLSCOxvLdDs5gPdkvu5WMv7CDRqzGTh0764QGsi6bTPMgKSAwKLLvZE6RaLWXKUPttEuGkjBByLC7K99Pdyzv+q1SPus2SZMI9lPoXPcXKj0rgG2SIJh6ffF81lqWxk3gMAosulke/NjY1646jz/YLxKuFExCxNNNhinxOM10KWUVXRASe8yotLUk48lV/+renaXh6JE6Xkala4mB3i6ffBCyh+9E/2I9zknTte2PBjvefr3t1lVlDoPjiF70hHC3icLI7LgVisV2wLhNchwKlwHYk87icnb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099006)(6133799003)(4143699003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0FNSzlEWWdpVzY5SEttZ3d0VVJCcm8vMHhabEVPbVdvMWJTM2NsVDBBVjBR?=
 =?utf-8?B?R0ZhM2I0NFlaUW5GUVBxWmR5ay9GbTFwM0NvOFc2TGpmNXAyeDd3enNjTCsz?=
 =?utf-8?B?a2M0WFF3Mk55aEJ1RldnbU93M0pNbFFsOUdUdjJDbFBLUVR2NVluUXRHNndS?=
 =?utf-8?B?OVlYRHdLRDlhQ0o5aDZSZUQxMXVuZHl1OVNpeUhYRFV2enZGWDJqdE8vTjJP?=
 =?utf-8?B?aG5NOVB6VHJValNNcENNWjhxajZKRDA2TTBQRVRuMkJNUlZiZ29rRmgyOTRW?=
 =?utf-8?B?NnZ3WVIwT0Vzd2RWV3pFaUlGaHUrQXFSenY3Y2tqZlMwM2xlYXhmbHRnVUtX?=
 =?utf-8?B?R3huZFF6NXZjR1F5dm1hKzEraG1ya0ZRbXdaVjJOTmZ3MzBqZHY2RFIvVzBu?=
 =?utf-8?B?QzFnR2hkaUdNQXM1MjhNNGdBcXV2WmtrNE0wK1Ywb1lwZmZEY0tSODh5UjBT?=
 =?utf-8?B?SEMvejlGQ1l2L3F5TmZZS1lJb0FtTUZxUDA1aEpFbW5kT3d6Z2FtQm1TTUY5?=
 =?utf-8?B?cXdZR0pyYWRJdEwyOXo4QnNPYjlZekxrUG5UTXg3QTdEODVtSCtuTmNFd0Vx?=
 =?utf-8?B?QkpTM0s1djRNSzRybTJBQ2JPanJ1ZnpWT0k3WEloT0Q3dWNhSFNOQTdCRDB5?=
 =?utf-8?B?NHovS2k1QWtDQXU4SzI4Rm5BUDFsR1R6NWZLL0hvS0VCc0Qvdnovb2RTWGtF?=
 =?utf-8?B?VGpBNG5ScTBCVTRma0ZCbGkwSkZpa3hmS3pmVWpFOC8xTkZzeTNacEliV2Vq?=
 =?utf-8?B?WElIbnVnN0IyNzllRkJhUmhEYWtjSElVdlk3aXRBdmtsTXRlMzlxWHJKU3gr?=
 =?utf-8?B?dUpUU2lmZmx1VlZsa3RrY25UeVhaWTlPWVMrLzZTbE1WRUQ5cTJGYnRSTUE4?=
 =?utf-8?B?VHhOMWVCeFBNWTNQUHVUR0xGZGEyajA5NEk0Qk16MHg3YnZlVS9jcGd0bnZZ?=
 =?utf-8?B?VGV4MW4zeXQ4WWlxRTdPK3ljZ1lYQVkramdVOFh1Nml2TkRBY0E5UmI2UTJC?=
 =?utf-8?B?MWRKSGNoN3RYYmNoRlBTT25KQkIyU0M2cWo1THVQeXN6ZzJpY2tUOEwwZlRy?=
 =?utf-8?B?bjlQWjFuQ25PZnpYYmVkNXlIQjlPVEE2U2pWcERvZlNOdzBKTE02TjJCbEtk?=
 =?utf-8?B?TlZkMUJHRUZzYmVwVDRNWUk0c0FyZnF2dFNpWlVrakN6RUxWM3AwUnpwTnU0?=
 =?utf-8?B?elZsUUNvK25pSTZVazUrN3BsVmZRcTRyUWwzWjZHdzgxRFBCQkpqUW0ySHVR?=
 =?utf-8?B?Z2pWbGpKUmNCS0xNejNxTE9iWmxIeFpLc2Z4TTljSk8vbVk1cExBY0lyQzUr?=
 =?utf-8?B?NHo2N0lKenJUMTBmRSsvUGt6OGYvM0RTV2oyeVZFd2NqczFFMlo5WVJyQ0Zj?=
 =?utf-8?B?U09rb1pxbWtBbVpSMjIzYnJBK1ZxNEJmYXpXcE90bXkvLzhVRzBkZ1h6Mm1G?=
 =?utf-8?B?eVZCQTNINkZpZEI3Yjk4WHB0cVErRkNXMHJ3QWdoVG5Sb1VMVnl4U0dkajBt?=
 =?utf-8?B?cU5LK1NzdkdiTjE2YUozTThyUzdyNGI2Y09aS09qR3F3WGdkVXR5Q2FZV3Bx?=
 =?utf-8?B?TjBOeDkreXN1ZHZ4RklzcDdrSzhETXAvRktMS2NJMHRCWk1tb3NKNThCMDJv?=
 =?utf-8?B?STFwUXVqZHM3S2tnVlVScEF6bUR3YmlabzJzaGRRTWZXcENxbnNWdEpGQUR1?=
 =?utf-8?B?WHpkQldtSHFralJ5WTVlcE5PNG9Md21jSm10YzlTZ0xrd3NFMThYaWw2WVUz?=
 =?utf-8?B?ZU95WXV4OXhHN0xxa1hENTIxa2lqMjBWaWVLY0JUV2d4U2FGYUt6Y3VKMFdH?=
 =?utf-8?B?TjN6MXJObFJzc0Y0bDYzQ2FwbjY3YjZPOVkzNER3R1VWeXJYaEd1aVhHYUtE?=
 =?utf-8?B?NVcwRTl4dXBBUWNVV2NCY2RwVnJoYm1UbjdRb3BrYkRiQTNkS0ZhYnN5S2dE?=
 =?utf-8?B?T0FEejdMSEJnZ29CS2VLYXl5YVBzdHo4R1A5T244d2F2aXJ2eWZkVW0wSEt0?=
 =?utf-8?B?Z2Q0V25mMU12YUJtN0hoQ1ZVMjJ6LytYZVVFNGlaV2JhVkhXWTJvU2RFWVRC?=
 =?utf-8?B?clNxdEZyUTI2eUl0VHp2Z0NreDJ2VmU5b28zdXlrZWpXOWROWVF1T1pDSy9a?=
 =?utf-8?B?RFRqVDh4L24yYjFqa2ZJZVF1NWZqOTBOaTVLdzJrdEk4aTk0Q3ozVFlpNFBx?=
 =?utf-8?B?cHh5eFVKK24zT0FyZzdwODRhM3l5OG5pOE5aTUc4eXZhM3hsazVMakVIWTdS?=
 =?utf-8?B?RlplOHFQWmxSTlRiTDNSVTJHQWhwNFdLcHA1dTVDM3BKLzZ0RlR5SGlPbmlW?=
 =?utf-8?B?SEdRQmwyYnBRSFR4Z055WmdEbVhma01UaFNnSFpobWhZTFlWNDFhbkVKTGc1?=
 =?utf-8?Q?Q8ReEogBJC6ZET+2OCvcZxHPC4hy6CXgdUHHy?=
X-Exchange-RoutingPolicyChecked: OE1WiJhzPT6ulNq0BBqOUiVXoTyGIrm6QjFJ/tVg6p+riiyM63PvtneZFeyVIib9Ozc1K4Ufz1WCXL1QNJu2A87zwvWTNYudCHoo/abuPVIf+q/AuvNE/OTzYnLxlBaorTQ/fTwjbt1kRd93LpSGoiXbd47LE5XjqvhOtO3qHwQZd9qQQyNsdmVBpUzYPov3gvjx+E1FpHPb6mwKFwlZEPV2bHosPCMqEC9fiy/Mak3VDWpd3kyGBGLeXMBswn5Y4C0qQqLX/TwHWb3P0sNcyMgZvXN2ZAcnq1Z2wn8WEwPzRMvw9YtSl7dN9GxbVaOe3Qw2siLcENsnG3mEXMDZ+Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b5364af-f29c-4bc9-ba14-08debc2b16df
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 20:03:58.9207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nDYxtai4W8YDqGqOR2U42ROOVSntPzmMZWNrLIidUuKAHXbRFfOajDzWS4EdDjGXH5U+loaNKOr3EjbD5G5+K0xZJFsSReSIG07v3thMKH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7773
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

On Tue, May 26, 2026 at 12:12:33PM -0700, Umesh Nerlige Ramappa wrote:
>On Thu, May 21, 2026 at 04:35:25PM -0700, Dixit, Ashutosh wrote:
>>On Thu, 21 May 2026 16:14:50 -0700, Umesh Nerlige Ramappa wrote:
>>>
>>>On Mon, May 18, 2026 at 04:47:08PM -0700, Ashutosh Dixit wrote:
>>>> Unconditionally whitelisting OA registers is a security violation. Set
>>>> RING_FORCE_TO_NONPRIV_DENY bit in OA nonpriv slots, so that OA registers
>>>> don't get whitelisted by default after probe/reset/restart.

probe/gt-reset/resume to be precise. During resume and gt-reset flows 
KMD will apply the reg_sr to mmio, so you are ensuring DENY is enforced 
in these paths as well. As for engine-reset, the hwe->reg_sr is 
registered with GuC and GuC will save and restore these values.

Some of this info would be helpful in the commit messages OR comments to 
understand the bigger picture (for reviewers at least)

Thanks,
Umesh

>>>>
>>>> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>>> ---
>>>> drivers/gpu/drm/xe/xe_reg_whitelist.c | 7 ++++---
>>>> 1 file changed, 4 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>>>> index fb65940848d7a..d6a5d499373bc 100644
>>>> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>>>> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>>>> @@ -105,9 +105,10 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
>>>>	},
>>>>
>>>> #define WHITELIST_OA_MMIO_TRG(trg, status, head) \
>>>> -	WHITELIST(trg, RING_FORCE_TO_NONPRIV_ACCESS_RW), \
>>>> -	WHITELIST(status, RING_FORCE_TO_NONPRIV_ACCESS_RD), \
>>>> -	WHITELIST(head, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4)
>>>> +	WHITELIST(trg, RING_FORCE_TO_NONPRIV_ACCESS_RW | RING_FORCE_TO_NONPRIV_DENY), \
>>>> +	WHITELIST(status, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_DENY), \
>>>> +	WHITELIST(head, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4 | \
>>>> +		  RING_FORCE_TO_NONPRIV_DENY)
>>>
>>>status and head should be clubbed into one slot, starting with status and
>>>RANGE_4. Maybe that can be a patch before this one.
>>
>>No, e.g. for OAG, status is 0xdafc which is not a multiple of 16, which is
>>a requirement for RANGE_4.
>
>I missed that. I thought HW compared ranges differently. In that case, 
>this is correct and the individual registers can be whitelisted 
>separately if needed. Otherwise some registers can be dropped whenever 
>you plan to do it.
>
>Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
>
>Umesh.
>>
>>Also, about RANGE_4 above, there were different suggestions, e.g. tail and
>>oabuffer should be different slots, rather than grouping in a single
>>RANGE_4 above. To avoid any such controversy, I decided to focus this
>>series only on removing unconditional whitelisting for OA registers. Any
>>other changes, such as removing or retaining RANGE_4, we can do after this
>>series is reviewed/merged.
>>
>>Thanks.
>>--
>>Ashutosh
>>
>>>> #define WHITELIST_OAG_MMIO_TRG \
>>>>	WHITELIST_OA_MMIO_TRG(OAG_MMIOTRIGGER, OAG_OASTATUS, OAG_OAHEADPTR)
>>>> --
>>>> 2.54.0
>>>>
