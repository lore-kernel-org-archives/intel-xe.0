Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE355106FD60
	for <intel-xe@archiver.kernel.org>; Fri, 13 Mar 2026 00:55:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9053D10E441;
	Fri, 13 Mar 2026 00:55:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EjdLgWrM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D60110E441
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Mar 2026 00:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773363309; x=1804899309;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9R0GXVNPlQ9nZdmecScGnnpRc35oe0IyWfZ8ikcWfJw=;
 b=EjdLgWrMEoi+LhhYhCD2ix9XzPlAqwL5/J1j9lvE9a0aGnA0Xnn7epdc
 UQnVCPBESYLNPLSnwfINBcseq0SQAGYXuwNKCKDxka1eRHcwCUX1S8Kjh
 wxyegRWXozd1Aq2FoSOf72m2UQZY9bz8tosHlk7PuObM4bULFF7/qi2QO
 6oQDWfLlxVe1PReL7nsiuTIu5OtefLf/BDXDQU962E7pd9qQKCkfqAkqp
 7eIauPA8EAX4L2SkVMuLtE4YF/03m5kJFWodrxGritnGaBxgv0a3qghyQ
 sn07NV2p9ZSLc49Jwhq4s9h5URoDQoaKBKEjGoCckog/Pcsqo8hwqGEI3 Q==;
X-CSE-ConnectionGUID: d0vZsRMCQsipDOna/+w5Ow==
X-CSE-MsgGUID: vX+Y+QHSRtaLT+ETq9SLVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="62040995"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; d="scan'208";a="62040995"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 17:55:08 -0700
X-CSE-ConnectionGUID: Z7bN9KENQ3eNbizak1ZR8g==
X-CSE-MsgGUID: NapRvOQXQ8Gb/fhOPztSEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; d="scan'208";a="220254111"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 17:55:07 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 17:55:06 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 12 Mar 2026 17:55:06 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.60)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 17:55:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eoHfvTffuAPGTbjgkQYCQLyDFColncowx2WL5hO+DMXcugq/tzTQ01addswQ8iV/6f9RvbCdDSaSXhBeS6AoW9DdDtJ8u4p1f7bpK7C8EVtg9IMH5fbw79EGwZTsr78rsJ2WNQ5Hipi8rjNcXTi16wJ5oR/3AhMDg1kDk58cNtOJyaZ3ZH6m+mn7Cz1g4dvfSxeAel4lDC6erTT3eAPC3PfMuhehWGWnC7OWMJuOmrqriTrb7th3raDzC6+2qVEE9Qm1IfGv2tigxcJQYdaZV7JXBlaC7qDj8XR+XgDA5A4HbhileZI1XkCGKea+NLQ9UFNk6u3TNKOauuemXu1J6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HezRg/A2jvyk49/4OF3lj2zfLTn5mivwOdmFR/ELat8=;
 b=bzVPb8n0O1I/d9q8QcK5c2Cz1QI/cT3V8rwSeEVggt+cxpNHusvvrs7OfcYcBHfX0EeTY6+UHTqC9Q1fS0Bt6Yvf6GsdWmStwOp5lmsf89ScF00Cpsjk9FRxoSBdRvKIgrnSVA1/rQz/9/WklB7LcQFZCb1mECkNBxp6ZGe2tM4z9+TPX1atISgr3miQ2hWxNiLYCL/a3IVbFsfXC926F8NQWRxdCVmJSBjOZdtjle+MfWeZ0FZwhqD4aGPkDjq5WF3K6/uj2ZQLnl5sRu2jTQ0uEoWEaX3zJd19FDMDvVDoBObChgkaTc5ZDPlhZ9HljoiXjHJxAMsTn3ALRoj3XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Fri, 13 Mar
 2026 00:55:04 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9723.000; Fri, 13 Mar 2026
 00:55:04 +0000
Date: Thu, 12 Mar 2026 20:55:01 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Julia Filipchuk
 <julia.filipchuk@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH 1/1] fixup! drm/xe/nvlp: Define GuC firmware for NVL-P
Message-ID: <abNgZcgAMtA0mtmN@intel.com>
References: <20260303213655.241442-3-gustavo.sousa@intel.com>
 <20260303213655.241442-4-gustavo.sousa@intel.com>
 <7eceb569-f048-403e-abc4-2b741d51dd7d@intel.com>
 <87h5qk6ezt.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87h5qk6ezt.fsf@intel.com>
X-ClientProxiedBy: SJ0PR13CA0205.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::30) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA1PR11MB8393:EE_
X-MS-Office365-Filtering-Correlation-Id: f068e4fc-0eaf-4e89-93b6-08de809b29e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: IEtGA8Oz75jnqqs8ezV0q0OPxyyK7oOmY5MJ2BrQSIHjyk28R9Z+5mwyyjroq0QP+7/H3PkJp/P1xIkkDDhrFjo27eKRq5RxOSybkUazj0cmuf5GYIvUIkEeyppUyg2CvJ6e79U4u5/ofxO6vkg9ZReGmtRcFIJP9SBJrAqe2dwD7m8Nw3aH/hQ7l6R6IH3SxwjBOysrOySawYDoY5JSVvj4iTayXH2Cm9VTva5SIDtKuKOVJs84wQzORh9rTVe0nCTFOhbUhE27I2p+zRkAp9jHGaUcdolSKrxa8xm6MBP8ZH3HSUdSexJ7U+IRoKN/zyn/GtKmJsTB/Pcmdk3b88pH5JSLttED5hrGlPsQIsfgTjSMmkbZULetxOL6eKmEljxmhmZBpnktzq8Hqqgo5f15tCJO23cEdg1sNlDhbg+UslMBBHe+yjiO9lDARdkQ+Q8dkHa6xNTbKqFXlIW9X1saNp6G+4DMyqShcf1v2Sum/imT6f4+x6HFUMRkSAwu36hyJvZhJ/RQYHuDRVjpTo/SCjJtZwi+kq3mAm8Y6jvdM/2gADnQi639Utzsz+ZCsABeNDO2/JLWuAGJazf7ceygf55Okqp4CDfnuX7BwfbrTDNFgpo8JqCNAvaWf6oDCUWIWRUw9+oj1XJN7zkUzTujSkDJHFRO+1qW309qjQS7Ex8xMtw7M4UxVPUx1I8HXSi0zapIw3T7zlrt5tGw/t5gKG02Z+KlOM/oWi6wPAU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lOmpRYXNeMpw4z59gXC8fMrfPeD1g6fIIbI6neLzXXIYp5nmY7vjuP1rvo7b?=
 =?us-ascii?Q?KZjjx0F1hR5hJIi3Wa85Hwpfz2Bgyeq7e4xecDdLm8l2L8aHUIlXVVA/vBNF?=
 =?us-ascii?Q?6tyESeJpPe4TNxdgiZaLsa42I2+eg6S8eXWXY8Nh7flT4VC/ccCKRFJRn6zj?=
 =?us-ascii?Q?I5EHTLPzPAwmKyL81ZnO1lyY4R8uHILXKvBaNHHAhe1sDk0E4ejiUwJHozuc?=
 =?us-ascii?Q?I63qmJLE1ZsoonYYn9jDxHBJasA1MJuwOS5wV5XzFrDKw7ldTgZaiGUv9/Cx?=
 =?us-ascii?Q?oZNQudkkEEM3T6ysrxT6pwKkMVJqQMvhffHj+SqjBUFgFNMG6xTfbgSkHGI8?=
 =?us-ascii?Q?NUglM7v4836p1ewdCI7jqpCH6lZBxYeHrA0tMNrxyUKyqbnZcq153wjjAoeV?=
 =?us-ascii?Q?qy9/C3iB8zbdMJiGkWQxxOh0e4KvXrWGobaeh6jks34zeXCM6oxcUkuYy6ej?=
 =?us-ascii?Q?gHWh8RdYKYFr2ryhbi5Axq02xQQxFiSDKshvNHG80kR9lQQXcX0BGLD1Zwmy?=
 =?us-ascii?Q?J7WXT62M+5XqMGZH3CYiWKPDvUUARZtFBZk5dSPuo7zgQ4lUow7E71NoS6/w?=
 =?us-ascii?Q?7bXAW3nUUzZ9l+54rMAv5mBzhJ8gzmNijQidkYH/6bAUoLKtHeKA++HICsLp?=
 =?us-ascii?Q?LnbrdBk25GaadbE4W3HYYUXjYSM3QZ9y+jsoNqXaKizRf0Auu0QtTrlgN9iS?=
 =?us-ascii?Q?gATadb7NKwZKl3wDsrwjcavYE04e75jkb23KLh09MUAU+i8qkph/Bmh2jUu/?=
 =?us-ascii?Q?3ogY8cFR+k8l9w+TOrfdG7zM+SSfzWie5hIksFupeNwqkUL5PVgx225KXoct?=
 =?us-ascii?Q?5D/vqPoUabNmtpFZDCzUAQFB97gjdYa4xOexYEDBYSlIM4NXzWHacEG/JlKO?=
 =?us-ascii?Q?vMz9S1dx5XLTGI5rE6M2Ch7wgTpTVctOApwV1kTIwHXYFBVWL+qzJeHur5ck?=
 =?us-ascii?Q?UwPMq2QqVI7LgqPTV4c9ewiA99MwRDtDWoTvA1Mu41/RsYu+IcQKToaroLSe?=
 =?us-ascii?Q?uhzLPcOJzUGz0q1uZF3EZqDwgv9CveZC7gGSThS0MrjYgUBHrbR0nHnemjHD?=
 =?us-ascii?Q?LSkQr8/oOCg0kIShYgg4G1Vd13wbCn5AwQxZF2jyjYAyl+5ksZ2yxY8t4dXH?=
 =?us-ascii?Q?syB8UlHvNn3FGJwmW3QphSvEgch3L5sURtz6sdJ/MXD4yr1YyPrTNE7O6RLy?=
 =?us-ascii?Q?5yEln/5asg8pAdXycEK4Kaf4xwMU8M0TDwfBK/6I72wAatHr4DOczlbiRjrr?=
 =?us-ascii?Q?cTQq0cmmD8PuKWeaYWCTT3P/c0wmhL0r3yiTRGHJU+mCV2hD9ZkrrTrLzraY?=
 =?us-ascii?Q?+PB4x7LCq2znzTjyXT2PMkhwXSobEupI70/lMhESg4HtjbdpzCAnG+NH8nOS?=
 =?us-ascii?Q?q4wtUp/hsARSQ+hQzLy52vuWSMfOHKdzshex7qDtsYb7fCWWWMIV+kpYf3Wz?=
 =?us-ascii?Q?utPEySoXL/XFgCx2jQITj72Ycw8erluoLU6M2JagiXImb5lAe4JHZPSubXGZ?=
 =?us-ascii?Q?ZYgLdrI09hMiowru2O3A97NpczwtP9iw9GheX3p6uSd57nwE0W7z/OON57/4?=
 =?us-ascii?Q?Y9YOblXO5rUc/q8tbXTb2Dd4OVaF+KR8ch8tpejW1HhpNyMcWdZ/CvkH74WQ?=
 =?us-ascii?Q?k0bzbHR/7CwJ9HQZUBPfS9PwarRkvI7Y3vinb39/jxIYCmKxg0qtjoVjPzbS?=
 =?us-ascii?Q?C5hvemCru5mvK6rilwNGHkuV2Kcv9mSkYBjw5YxmVds4rUKwxMjTSki2jMDp?=
 =?us-ascii?Q?dBxMpCOPnA=3D=3D?=
X-Exchange-RoutingPolicyChecked: gJK2ahmjB+bIE/U66zRo6IApRWgGkR6bkucIruvexTz/cd610NoPzfDTCJAXXyrxIPdj0kDm0m13z7Epp8upBS34rMWSkUzcalDPGIBHTJql7duRhom8kPd1nlqdjKHKj6YL44H5EMRvItTPqknzv8bNK+2HyJCAlkaXPa2F/J9zGkr7joedcRNxPDWR45zxb7Rl9iSdVhS+Uon/cnP/lC6ZzYeB7910Tcqweb2bL0I4u0i+JqEWlUBSnDoaSX9af8q5olYBag06pg6yZopHV5clb06sEC1vKK/zcXRvJPxciZ+DDWhokNPURzINE/SMpjEwR8MjTZbEq+VO2+hiKw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f068e4fc-0eaf-4e89-93b6-08de809b29e9
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 00:55:04.7019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yGsdMFTUY38y5w4mlhfdx4bxT1IuVhm2NdjO3RdCLG/xcqxVvKROLjZK15TEMmxvF5QUVVb88+C2vnU7NeaMNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8393
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

On Thu, Mar 12, 2026 at 04:10:14PM -0300, Gustavo Sousa wrote:
> Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> writes:
> 
> > We usually specify it in the patch tag when the patches are meant for 
> > topic/xe-for-ci
> >
> > On 3/3/2026 1:36 PM, Gustavo Sousa wrote:
> >> Update GuC version for NVL-P to v70.60.0.
> >>
> >> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> >
> > Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> Thanks, Daniele!
> 
> I think now we need help from an Xe maintainer on applying this to topic/xe-for-CI.

done. Thank you all

> 
> --
> Gustavo Sousa
> 
> >
> > Daniele
> >
> >> ---
> >>   drivers/gpu/drm/xe/xe_uc_fw.c | 4 ++--
> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> >> index 60c82b920f47..9aa8deefa6c4 100644
> >> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> >> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> >> @@ -115,8 +115,8 @@ struct fw_blobs_by_type {
> >>   #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
> >>   
> >>   #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
> >> -	fw_def(NOVALAKE_P,	GT_TYPE_MAIN,	mmp_ver(xe,	guc,	nvlpg,	70, 55, 4))	\
> >> -	fw_def(NOVALAKE_P,	GT_TYPE_MEDIA,	mmp_ver(xe,	guc,	nvlpm,	70, 55, 4))	\
> >> +	fw_def(NOVALAKE_P,	GT_TYPE_MAIN,	mmp_ver(xe,	guc,	nvlpg,	70, 60, 0))	\
> >> +	fw_def(NOVALAKE_P,	GT_TYPE_MEDIA,	mmp_ver(xe,	guc,	nvlpm,	70, 60, 0))	\
> >>   	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 55, 4))	\
> >>   	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 55, 4))	\
> >>   	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
