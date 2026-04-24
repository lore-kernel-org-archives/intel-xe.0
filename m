Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F64FF8844
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 21:05:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E210410E119;
	Fri, 24 Apr 2026 21:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V0xUWA1v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2953310E119
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Apr 2026 21:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777064731; x=1808600731;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=nQrXM9RHi4V94cYjLx6zcqADiNXxRAc8TmVN39Ieng8=;
 b=V0xUWA1v4N8rGCz1U+wc5zneNHmB36uHeoULkygc7DcNzo30s9+p9XSe
 97rEYYdWAtIOXisnrWmPq8oq0oNi133E3tm010PqfyC9iZuWFttNwkgm6
 gAll3sctWLVUw0b6qcR0Hhz68RJ5Mor0JqmU6kegM/WyoWV2p83wfv0J4
 DJVClVXS3Nfnwr/9Gh95qIU+Rej4K2QEpSMIqEP0qhxzIko+NHb7kKWsS
 C8z7/GBXUmN6Xaek1h8gcYNe5qVh2FKjScsEH6xqKYnpiyRZuj/+F4Ptz
 PCAG58OgCDsZLPnqcHoSQ1Iigo+IUIrqlL8wHd2HQ14xpS9HtMJFoZrLv g==;
X-CSE-ConnectionGUID: OIT6wgwOQE+dQ9UJCF8mdg==
X-CSE-MsgGUID: Z5xb4MjiRjOt9gcSDys0zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="88361046"
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="88361046"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 14:05:30 -0700
X-CSE-ConnectionGUID: phj3wp/yQjytr9uaIbSaww==
X-CSE-MsgGUID: 3WCN5aXkS+u5/DitbAFIZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="238126091"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 14:05:27 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 24 Apr 2026 14:05:25 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 24 Apr 2026 14:05:25 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.19) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 24 Apr 2026 14:05:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XAs+3nbaCZNFN++Dfk/eM4t+hnk58kdgnlXJVi/DKeIwy37FW/1oiNub0YOIA3MSRXrOY3ct79M10YLuyovdwrF5NOEyuDQtB1uMabKh989K7kkw704+pS0L1NDgwIQE3RPcb2D89TSvYbZBZjucVXaMThOUBsbAZjeKs41TZdJOrdrAQ6AKsOLO+HcVqmrvJwUrH9Ygk6jyRWh6CjTzXLQ8bcsgTAiTraj4SusLkcLlxwJskIRmjUC+c99JGAOg6WKGamQi1scWBH6/XCRr3l3hSkZFx8Q5UnWpYX5Kol6g/CmzT/0Zzwh6s8seJFoYW7a5+PpOT4bt2DQsupJxCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ncK5qpr6juILTL6aru42p25goOLzRGCxdN/Z9CItVWE=;
 b=XDVeNhj3z1h1ijy1ac6yd0jtVn3SkAdwI85nLumi/zOOy9FqZ3E4hogzUMI7krZZuYc2KLeSTLN6N4+KN5evt95szzee7NAaMbzkC9TBTgiCux3JvmG3HpvyV6QyOxw5euGNpf8FkMw+JXHPE2XfOOZscDzNehFrV4TZSIRiqqiVhQ3Mf9Zrx0kFV9jgDbqhdjzWiLQZA3mK6KGB+Cn4n9913N/Wdq3AHhTxVfeoglbmZE6hI/VNr3DyDQ3phukAMlDZytg8wGz85nkuwRhP7o9/1D9gnJ9Yz9TCcJjazezFX3ZF/fTV4HYZlhAdDmvuGrg1O2CDfxVubVpUitU7oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB6547.namprd11.prod.outlook.com (2603:10b6:510:211::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 21:05:22 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%4]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 21:05:22 +0000
Date: Fri, 24 Apr 2026 14:05:16 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe/oa: Use xe_map layer
Message-ID: <aevbDGmDb7QlHG+0@soc-5CG1426VCC.clients.intel.com>
References: <20260415020342.782987-1-ashutosh.dixit@intel.com>
 <20260415020342.782987-2-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260415020342.782987-2-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4P222CA0022.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::27) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: f86bbbf5-387f-4f06-7e6e-08dea245329e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: MuYu+3zYrM2oa8A3VljID2UHQKsv4c46L7MdfL9dzHV0+norZmiMbBhu+ZuknOe1D0VQ4NtpXkkUnetZt7tyvfIzxZQjrhRf8hAGKx5BmE3GPIz+Npa0JdRFPq6c3NQE+ANKUjSB8lUl/Pk3++Iy+KGXK9y3utIKHVj75Cz5/eh22YAPFM6MQbsA33nA7UfSqeGtubI9OJ8KD+jMkI5K7dR0s0NHdj0+MBPz5o82VDUNdhhm8NlFV8e6T4SwClJYHCmq9DYAz93eeF4AKII5z4qJuREqSVBj7POIVZSFWVuHGWc2HDIwRztgHOio9GYoKXYW6npSrgWDw4G+fIeTaIHSUCPAOMtH5YBTdP0GDIlF0j4uCAgF2Z2XT3DT82cHo18JxjJKIeTFtszklKKXvUtSA6dLAe+WVIoIG8iMKMQTJCXJc8VYgLjffbnAoNtK9rVMtpVdL4wWxHaoiCWXteoUDa25cMhEUDKkFUoYqM0SK8Tie+IYQl03PbhDO5IeswoDR+1YRz7Dta0mBDQx+8vltjUcSooBrF9iejFPscZImUQuXsEhKJ+DeT35mfLitceTXWRljf+hJgMMQluLDIykMaqKopBPnKcKKTgPYGiBiYpMdm+BluVd/0bnAUgeJlRxcjhtIvkpwo6dDJLWZEFbA1mT2q23G9i+ZQ3Inf/b9jnLi1/7fBmhCXpnsJFeiD7QWZES6DQ3yLOU8CpMlK3RHQRCfYdSZ+UlnF1g5+A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3d2eHo3bk50aFVyaGxyS0NkVFkvNUtQWlhLSFV0Vm1IN3J1b0VraEI3VjNx?=
 =?utf-8?B?NUVXbUxMdmR5MG9kNHEzU29oOVBQYXMrZGpkbUZLQWNzaGRtNEFCakhoVHNk?=
 =?utf-8?B?OExjcmVuYktyTkZLc3dMN1dyTjV6SThXSWtUV1A4UndNTHRCek02eHpGNlp1?=
 =?utf-8?B?dHNPRVZKQ0tMeU9DRnVNcTVGV0FsMjVLNGdhK01iVHdpaCtJaTdRS1BYVjU5?=
 =?utf-8?B?eVV3M2VZL3lpWW5zQ2R0V0dpWkU3QnJVa3BvZXlUT0FaRE40N1pNaHQ3czVZ?=
 =?utf-8?B?TXE3R3l5YVc1MnhOaDJFcGxxZzNWR3NWeU5rVGxtRUtFWEt5L2V1N091R3B6?=
 =?utf-8?B?K2J6VlJKaUxZMFR1d283TDNJZ2NyNk5aOTNDMGM4azFJenRRZ1RoYm9CTU9X?=
 =?utf-8?B?RWxGNml4RFNqY1h1b0ZNTDdSaVB3T3NzRExSbWNhUXo3dllqSTBDNGU1cUNa?=
 =?utf-8?B?b2NiNVJaNFRsVXZLeEpGTFhMODN0enVnYkFxQjdGenRTdHBvdTFjOGpncjVJ?=
 =?utf-8?B?US9SOEthenRrdDFGTGhNVS8zQTRheWUrUVhQeFArNnhQYW9aMTRJRFU3bmE1?=
 =?utf-8?B?QjJsa0ZHNmpJaHRvUjl1SXc4WUxoRzdLTHVGWHZHTmJGcWVuczNjVjdza2x5?=
 =?utf-8?B?OCtJWktxNjFaNU00SVlDRC80UGNUWEZ5Yk5odVJRZ2VpMUI2eGQvNkU0WFNI?=
 =?utf-8?B?UHRpalFQQXNwdVdvTVB2NGR5WTFsWTlpazhQRHFBRUhJUERRUk9EWHJIWnN3?=
 =?utf-8?B?cjBRb09PZ2JKS3ZTdXZPWnoyMVovYlNhTFFPcTRBcEtxVTVyMWhKL25SUm84?=
 =?utf-8?B?SGdEdFYyZzV4WStZYlBrOXRnbWtNUVNCejBjR2dNS1E2Zk9jNUFnWGVmN0k3?=
 =?utf-8?B?alhKVnF6cjZudmxBOXpHY01jSDZXVm91WDdCK2tKRnZrOWlWNDRxTGtLOEVt?=
 =?utf-8?B?S1JNd3VOTjloeHFwK0FFYmdsN1c4WWdoUHErVEs0TkhyR3MrbmRNN3FrZFE0?=
 =?utf-8?B?b1JmQjBTVWNnY1BUYnVFOW0wOWxqZUhWUzFJMjFYMWkweCtxS3cybWFzVXJ5?=
 =?utf-8?B?aldtY3NBajArT3JsSytycnI2OU9xS0g5cmVsZXNBdUFXbExUakc5UEJMc0lC?=
 =?utf-8?B?MmNnVWIzVm5IV3Z4c2tBVGZrSlhnSlQwZTRXbVp3UmltZ1FEM3R1azVPWXYr?=
 =?utf-8?B?T2VYREQzeStsSUtPdThjcHlsaTlMZ0djakJhRnphWWFZZnJHRlJHdTljNllP?=
 =?utf-8?B?RXNQUHZDT1BrODRTanlleFNzMUpzTkhGQUlOd0d1bDBYQUhEOVhGd0FxdUg4?=
 =?utf-8?B?Ri9FU2FZWER3aEc0VnI4d09HaHBLYnJxaDE2dHNhM3IxY0EyTUx5V05jVDA3?=
 =?utf-8?B?Zktnc0djT1RJNzFFSXlCY0NEZkpkckl1U3VBUWV0U1dLZTJoNStGTTB4NDZL?=
 =?utf-8?B?Z1BwKzFpMTVvVlk2WGx2OFQxSGkrV0JKd2FsQVErOC9aYzc3T1lWZ2xUQkIz?=
 =?utf-8?B?UnpVWVk0MmdlZWNZSndsM3dTYVVZaHVJdHp2N1B2RFczSEhBRllKQ1ZBQkxa?=
 =?utf-8?B?YnphK2J1bkF0MHVGZVIzdG96aWhacEdyem96eTZJTEp0VE9qUVRSRzlaYnRY?=
 =?utf-8?B?ZjR1bUxqNXA5Y2VCU2FnV0xtc0JZTXBCUlc1Mm1ZK2Z1aVlYQXVjSDVEWWNn?=
 =?utf-8?B?bHlSK2pPU0hraWxlMmNqUjlHMmNMWHhCVU9IT29YbTd4RGZVSWlOckx6Z3FP?=
 =?utf-8?B?NVR1UjkzK1FXV3lrcXpNdkJBaUxDVjJORTJUK0IwYmNzRHdPNjBKbG1PeGRK?=
 =?utf-8?B?ZGNoVCtTWWhjczlGdkVSMmtMS0xQWEVKVDVpR3J2V1gxVnBMclBXRFA2cEdh?=
 =?utf-8?B?T3Z2T0pCOUVZUHNUU3A1dTNES0RGT3c0M2JiQkJvQzBXeUVTUStmTzlJM29G?=
 =?utf-8?B?dHhjK3JCR2kwY0s2bXBESmxMVnBDeVFNMFp0em51SXdSSUxFVVJKcXp3TnAz?=
 =?utf-8?B?a2s0NERqdjZVRERyU3BFZkJrdXpDRkFtRlBnSlBXdUZHRW45SlQ0T3FsWDl4?=
 =?utf-8?B?OVBEN28wRXc4TTBVNmIvOGJ0N1grMkdiWGtERzNwVHhMNzBNOGVoUHNTQ3Jz?=
 =?utf-8?B?WmNybVNSTmtYZGJMUUlDUUx5dlp4b3hZWlg0QnFXTVNKQTQvRGdlVUFpRmdt?=
 =?utf-8?B?dS9FZ3JFU1ZTOUsxUjNrVkZkdnlzTS9ITm1IQ2JVNzFnUHE0WGI2cHN0T0xM?=
 =?utf-8?B?MTBzZmNYbzVLalVXY0lRcU1YWGRXazBrM3pZaHIwN0owWFFIZStIYVIwdjZY?=
 =?utf-8?B?NjQvdU1FVFJNZ2NsZTNmUi9ocFFHdloxWCs2YVNJSThWUVQyZVkzWkFleEV4?=
 =?utf-8?Q?StDzMTsyOXiBDf2w=3D?=
X-Exchange-RoutingPolicyChecked: AYuDXHc8d08BjUIezpUaNuVrNoPSJatYqknQ8RB2WKm1rS9M8uQVFSkNdR2nLRVpxvqkjA+cquwWn4JGT+ys9nDyc8Pev0yJMMMJodg37SZECZ958qLT5hPsJ4qgBxMaoPtOBcN1+ruv5c2qQYdH1jemGvKZ3iJ6eS5zpPpaqTkrlw7jO4A3uzaDShM7PWyFjpI1mtYTY9q80qdpYe1xsMfC6V6Oh9zLVyYIWBBFqjDKO/MZcDDYWkI3Jf0conSU2TU9m8ykzhjK5HmbrcMR8qWRjoACkB2rqJ3JmiAw91Fg5168BWdvc3mxjbsh7TlC6qCod1OrJ+P6jm7TkIABXg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f86bbbf5-387f-4f06-7e6e-08dea245329e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 21:05:22.0705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2P1yaCqq20cQKLlqXRglqgy2B70NoIBTYavpRQuFtsvcFFvm/LW4FJXDuAF6z8PO/E6GpHq9Yb4c45YcX2VXgfqX3gPsHIv67wz8C2p4cPQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6547
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

On Tue, Apr 14, 2026 at 07:03:40PM -0700, Ashutosh Dixit wrote:
>OA code should have used xe_map layer to begin with. In CRI, the OA buffer
>can be located both in system and device memory. For these reasons, move OA
>code to use the xe_map layer when accessing the OA buffer.
>
>v2: Use xe_map layer and put_user in xe_oa_copy_to_user (Umesh)
>v3: To avoid performance impact in v2, revert to v1 but move
>    xe_map_copy_to_user() to xe_map.h
>v4: Use bounce buffer and copy_to_user in xe_oa_copy_to_user
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_oa.c       | 95 +++++++++++++++++++-------------
> drivers/gpu/drm/xe/xe_oa_types.h |  4 +-
> 2 files changed, 58 insertions(+), 41 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 6337e671c97ae..4d13d8ef8103f 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -213,32 +213,40 @@ static u32 xe_oa_hw_tail_read(struct xe_oa_stream *stream)
> #define oa_report_header_64bit(__s) \
> 	((__s)->oa_buffer.format->header == HDR_64_BIT)
>
>-static u64 oa_report_id(struct xe_oa_stream *stream, void *report)
>+static u64 oa_report_id(struct xe_oa_stream *stream, u32 tail)
> {
>-	return oa_report_header_64bit(stream) ? *(u64 *)report : *(u32 *)report;
>+	struct iosys_map *map = &stream->oa_buffer.bo->vmap;
>+
>+	return oa_report_header_64bit(stream) ?
>+		xe_map_rd(stream->oa->xe, map, tail, u64) :
>+		xe_map_rd(stream->oa->xe, map, tail, u32);
> }

(1) The helper is just returning the report id for a report passed. In 
this case it is tail, but the code would work for any report. I would 
keep the name as report or report_offset. Let the caller use specific 
names like tail.

>
>-static void oa_report_id_clear(struct xe_oa_stream *stream, u32 *report)
>+static void oa_report_id_clear(struct xe_oa_stream *stream, u32 head)
> {
>-	if (oa_report_header_64bit(stream))
>-		*(u64 *)report = 0;
>-	else
>-		*report = 0;
>+	struct iosys_map *map = &stream->oa_buffer.bo->vmap;
>+
>+	oa_report_header_64bit(stream) ?
>+		xe_map_wr(stream->oa->xe, map, head, u64, 0) :
>+		xe_map_wr(stream->oa->xe, map, head, u32, 0);
> }
>
>-static u64 oa_timestamp(struct xe_oa_stream *stream, void *report)
>+static u64 oa_timestamp(struct xe_oa_stream *stream, u32 tail)
> {
>+	struct iosys_map *map = &stream->oa_buffer.bo->vmap;
>+
> 	return oa_report_header_64bit(stream) ?
>-		*((u64 *)report + 1) :
>-		*((u32 *)report + 1);
>+		xe_map_rd(stream->oa->xe, map, tail + 2, u64) :
>+		xe_map_rd(stream->oa->xe, map, tail + 1, u32);

(2) I think this should be tail + 8 and tail + 4. Can you please double 
check? The u32/u64 is only being used to access the data at the offset 
rather than determine how to calculate the actual offset.

> }
>
>-static void oa_timestamp_clear(struct xe_oa_stream *stream, u32 *report)
>+static void oa_timestamp_clear(struct xe_oa_stream *stream, u32 head)
> {
>-	if (oa_report_header_64bit(stream))
>-		*(u64 *)&report[2] = 0;
>-	else
>-		report[1] = 0;
>+	struct iosys_map *map = &stream->oa_buffer.bo->vmap;
>+
>+	oa_report_header_64bit(stream) ?
>+		xe_map_wr(stream->oa->xe, map, head + 2, u64, 0) :
>+		xe_map_wr(stream->oa->xe, map, head + 1, u32, 0);

Same here - comment (2)

> }

Same comment (1) for all the above helpers - the name can be generic - 
report_offset. I see similar change in other functions below as well. If 
you think it is necessary, I suggest trying to move it to a separate 
patch with commit message explaining why you want to rename them. That 
would also help review this patch easily.

>
> static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
>@@ -275,9 +283,7 @@ static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
> 	 * they were written.  If not : (╯°□°）╯︵ ┻━┻
> 	 */
> 	while (xe_oa_circ_diff(stream, tail, stream->oa_buffer.tail) >= report_size) {
>-		void *report = stream->oa_buffer.vaddr + tail;
>-
>-		if (oa_report_id(stream, report) || oa_timestamp(stream, report))
>+		if (oa_report_id(stream, tail) || oa_timestamp(stream, tail))
> 			break;
>
> 		tail = xe_oa_circ_diff(stream, tail, report_size);
>@@ -311,30 +317,35 @@ static enum hrtimer_restart xe_oa_poll_check_timer_cb(struct hrtimer *hrtimer)
> 	return HRTIMER_RESTART;
> }
>
>+static unsigned long
>+xe_oa_copy_to_user(struct xe_oa_stream *stream, void __user *dst, u32 head, u32 len)
>+{
>+	xe_map_memcpy_from(stream->oa->xe, stream->oa_buffer.bounce,
>+			   &stream->oa_buffer.bo->vmap, head, len);
>+	return copy_to_user(dst, stream->oa_buffer.bounce, len);
>+}
>+

Still need to look at the patch below this point. Will send that out 
next week...

Regards,
Umesh

> static int xe_oa_append_report(struct xe_oa_stream *stream, char __user *buf,
>-			       size_t count, size_t *offset, const u8 *report)
>+			       size_t count, size_t *offset, u32 head)
> {
> 	int report_size = stream->oa_buffer.format->size;
> 	int report_size_partial;
>-	u8 *oa_buf_end;
>
> 	if ((count - *offset) < report_size)
> 		return -ENOSPC;
>
> 	buf += *offset;
>
>-	oa_buf_end = stream->oa_buffer.vaddr + stream->oa_buffer.circ_size;
>-	report_size_partial = oa_buf_end - report;
>+	report_size_partial = stream->oa_buffer.circ_size - head;
>
> 	if (report_size_partial < report_size) {
>-		if (copy_to_user(buf, report, report_size_partial))
>+		if (xe_oa_copy_to_user(stream, buf, head, report_size_partial))
> 			return -EFAULT;
> 		buf += report_size_partial;
>
>-		if (copy_to_user(buf, stream->oa_buffer.vaddr,
>-				 report_size - report_size_partial))
>+		if (xe_oa_copy_to_user(stream, buf, 0, report_size - report_size_partial))
> 			return -EFAULT;
>-	} else if (copy_to_user(buf, report, report_size)) {
>+	} else if (xe_oa_copy_to_user(stream, buf, head, report_size)) {
> 		return -EFAULT;
> 	}
>
>@@ -347,7 +358,6 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
> 				size_t count, size_t *offset)
> {
> 	int report_size = stream->oa_buffer.format->size;
>-	u8 *oa_buf_base = stream->oa_buffer.vaddr;
> 	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
> 	size_t start_offset = *offset;
> 	unsigned long flags;
>@@ -364,26 +374,24 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
>
> 	for (; xe_oa_circ_diff(stream, tail, head);
> 	     head = xe_oa_circ_incr(stream, head, report_size)) {
>-		u8 *report = oa_buf_base + head;
>-
>-		ret = xe_oa_append_report(stream, buf, count, offset, report);
>+		ret = xe_oa_append_report(stream, buf, count, offset, head);
> 		if (ret)
> 			break;
>
> 		if (!(stream->oa_buffer.circ_size % report_size)) {
> 			/* Clear out report id and timestamp to detect unlanded reports */
>-			oa_report_id_clear(stream, (void *)report);
>-			oa_timestamp_clear(stream, (void *)report);
>+			oa_report_id_clear(stream, head);
>+			oa_timestamp_clear(stream, head);
> 		} else {
>-			u8 *oa_buf_end = stream->oa_buffer.vaddr + stream->oa_buffer.circ_size;
>-			u32 part = oa_buf_end - report;
>+			struct iosys_map *map = &stream->oa_buffer.bo->vmap;
>+			u32 part = stream->oa_buffer.circ_size - head;
>
> 			/* Zero out the entire report */
> 			if (report_size <= part) {
>-				memset(report, 0, report_size);
>+				xe_map_memset(stream->oa->xe, map, head, 0, report_size);
> 			} else {
>-				memset(report, 0, part);
>-				memset(oa_buf_base, 0, report_size - part);
>+				xe_map_memset(stream->oa->xe, map, head, 0, part);
>+				xe_map_memset(stream->oa->xe, map, 0, 0, report_size - part);
> 			}
> 		}
> 	}
>@@ -436,7 +444,8 @@ static void xe_oa_init_oa_buffer(struct xe_oa_stream *stream)
> 	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
>
> 	/* Zero out the OA buffer since we rely on zero report id and timestamp fields */
>-	memset(stream->oa_buffer.vaddr, 0, xe_bo_size(stream->oa_buffer.bo));
>+	xe_map_memset(stream->oa->xe, &stream->oa_buffer.bo->vmap, 0, 0,
>+		      xe_bo_size(stream->oa_buffer.bo));
> }
>
> static u32 __format_to_oactrl(const struct xe_oa_format *format, int counter_sel_mask)
>@@ -699,6 +708,7 @@ static int num_lri_dwords(int num_regs)
> static void xe_oa_free_oa_buffer(struct xe_oa_stream *stream)
> {
> 	xe_bo_unpin_map_no_vm(stream->oa_buffer.bo);
>+	kfree(stream->oa_buffer.bounce);
> }
>
> static void xe_oa_free_configs(struct xe_oa_stream *stream)
>@@ -889,9 +899,16 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream, size_t size)
> 		return PTR_ERR(bo);
>
> 	stream->oa_buffer.bo = bo;
>+
> 	/* mmap implementation requires OA buffer to be in system memory */
> 	xe_assert(stream->oa->xe, bo->vmap.is_iomem == 0);
>-	stream->oa_buffer.vaddr = bo->vmap.vaddr;
>+
>+	stream->oa_buffer.bounce = kmalloc(stream->oa_buffer.format->size, GFP_KERNEL);
>+	if (!stream->oa_buffer.bounce) {
>+		xe_bo_unpin_map_no_vm(stream->oa_buffer.bo);
>+		return -ENOMEM;
>+	}
>+
> 	return 0;
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
>index b03ffd5134834..99a04b8d586b5 100644
>--- a/drivers/gpu/drm/xe/xe_oa_types.h
>+++ b/drivers/gpu/drm/xe/xe_oa_types.h
>@@ -162,8 +162,8 @@ struct xe_oa_buffer {
> 	/** @format: xe_bo backing the OA buffer */
> 	struct xe_bo *bo;
>
>-	/** @vaddr: mapped vaddr of the OA buffer */
>-	u8 *vaddr;
>+	/** @bounce: bounce buffer used with xe_map layer */
>+	void *bounce;
>
> 	/** @ptr_lock: Lock protecting reads/writes to head/tail pointers */
> 	spinlock_t ptr_lock;
>-- 
>2.48.1
>
