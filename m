Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510C7CA0FF9
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 15:28:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EEA510E14E;
	Fri, 29 Aug 2025 15:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q7Em23uL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4109D10E14E
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 15:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756481307; x=1788017307;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=p5Q4srbrjQDH9/Tun8yHRFxYbPF3hrX6CCVwP0YjhPU=;
 b=Q7Em23uLWcPUlt04qVyHw0leOJfG8ZykmUKMjExjEfepXKmEb6+NyGJY
 eL0DOq6+nhOtsWpjV8nzLurOdHqrkCRgGut14tn1tHLmoy3FKB25iZ+1T
 VO+nW5i9tFnXO9lAas8ER0p+GjJxyhdsWgndulOFoK9/Jgybz7fOK3dui
 B3T4alcDLXk2Il7tLm5CrAtK7er9Bf1N/G6RVjEVNgeM5kk8YVvSPzEnS
 mQ2Wl0gpImL2o9IMSP4eJJ2+ybcdCdY81phCG7lzBsOSxHn2GIyV4cYEm
 biq2tKhxxJvJs/+RKsv4wepR4hfpNxTXFL/pUnD6Z80Irl99zqGCeb7td w==;
X-CSE-ConnectionGUID: pHtZpWtBT52cXrTDG9o+Bw==
X-CSE-MsgGUID: Oc2Fw22SSYawvuuPOyFkMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="69872433"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="69872433"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 08:28:26 -0700
X-CSE-ConnectionGUID: YisyDTEqQmWVYi2UVB9JfA==
X-CSE-MsgGUID: zkyx1oKXSjm3JALbsrv6rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170313092"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 08:28:26 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 08:28:25 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 29 Aug 2025 08:28:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.73)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 08:28:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BPhsOSKnzXJJapFT3S5KrJ9XgB53ZN0iKw1J0ruFItXUMNqO2SoC6F5ZUCunIEsHqIxnSnHJcnGMIQTBKI/AVH/ceZVXibpmCSSbs5TB/oEu892A7Qg+LbrYtKvmZuWvLLBwxa4+9FHx6hWIOcUVMWfcBVdh3EjyVaP+Vs8mti+7sV52uvIQauRCiEF55+EHKEqSG50QUthNVcW9Ovikjr0kMsum9zMcJgDKe1slq4BzCKuuU4zt1rSfPZeprohV1viXljOJ22lOWoVh6UAda3BTfWaXDgCy4VVjRpU2O2CyShBBT1rBVnE5bpBv7rRrevlyijgKbEdhUBwJEN07NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJRKb8H7G+DqROOCSitkdIeqkP25Ga/Tf7LEwMg6wTM=;
 b=AndIoqz/QB1u/6qC3P6o+p52xFcLzGEM3GNJuEOORv+V/umL30SAexT6f+vtwDuoqv4dW7THcGyF9DE/QPx+6klJA7EOf2676fu4XmM8GdSNu271ALkuNzZ8Bxpu9nstmMIw5eHLb6j449JDLDMLOnKhDEtPmASvZwC50sQWldahzJQgWyj1WU+yHdzq3MjZ1Km07qYCmj9lNRlBJkJ8kN5Ldkj5J9hlQz2rjdwGHUUMgD8Yqv8LQ9PU43rZOZ9WZnQUnBhv04+U6lCTI1kxT7KPwF+EpbHqwoy4jq6UAY+jmEruAIW4ptSC2E+bRhvA7cK8MMFDJ3W6Z8TEXbGzmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6141.namprd11.prod.outlook.com (2603:10b6:8:b3::13) by
 SJ1PR11MB6250.namprd11.prod.outlook.com (2603:10b6:a03:459::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Fri, 29 Aug
 2025 15:28:17 +0000
Received: from DM4PR11MB6141.namprd11.prod.outlook.com
 ([fe80::31fd:4de2:2775:396f]) by DM4PR11MB6141.namprd11.prod.outlook.com
 ([fe80::31fd:4de2:2775:396f%4]) with mapi id 15.20.9073.014; Fri, 29 Aug 2025
 15:28:17 +0000
Date: Fri, 29 Aug 2025 10:28:13 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>, "Vinay
 Belgaumkar" <vinay.belgaumkar@intel.com>, John Harrison
 <John.C.Harrison@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 3/4] drm/xe/guc: Refactor GuC load to use poll_timeout_us()
Message-ID: <cf6zl2mkxr4jg4wlkocsedcngbyma3w4ns7wywbmm2pbk5xbzs@45d6pne63yig>
References: <20250828-xe-iopoll-v1-0-9832ccd1c8b1@intel.com>
 <20250828-xe-iopoll-v1-3-9832ccd1c8b1@intel.com>
 <5cb4d376-0724-4c02-a0d6-84f262c317a5@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <5cb4d376-0724-4c02-a0d6-84f262c317a5@lankhorst.se>
X-ClientProxiedBy: BY5PR17CA0053.namprd17.prod.outlook.com
 (2603:10b6:a03:167::30) To DM4PR11MB6141.namprd11.prod.outlook.com
 (2603:10b6:8:b3::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6141:EE_|SJ1PR11MB6250:EE_
X-MS-Office365-Filtering-Correlation-Id: 1802a953-83d2-479e-8164-08dde710ad46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/ON3R5sGP5LQynjwvgDLf5l4oU1mzzvsSpvGe7PIXz3M1ot+8Kd3vmiRGnIk?=
 =?us-ascii?Q?w8bV86P9ILYrDIk/RUyMrxmy2BWE/PCTq0Q8ndh07TBKp7A+dt/fhYg1AnQV?=
 =?us-ascii?Q?DmhigZltcNiSQTxz9CI3exYvQDysi+PksaUGoZ+qZG19BRSAAz9Hh2TpWhSP?=
 =?us-ascii?Q?K/C/1Ur03yOMcZ24o/mmK9hS1RHImSjYxp+cS38Me77Kr5lWt0+ow2KOnm8w?=
 =?us-ascii?Q?U8cVIPKy+INSXHz/1c2jLZOGnOFSwurBYG8Qxbv9I5i1kSVyzYLlsJ7wPwAW?=
 =?us-ascii?Q?oeXfp2Q3a0tBpYa3BdsEtHbtRul4QQkGP+4GFkWu6RjKxD5nmH8t60xzqukg?=
 =?us-ascii?Q?L8Lane/FQ4v+Jq6A8znSS4bNv/2EWJ7uPaSe7vGp6pX/DuE5SGACdh7aoCt7?=
 =?us-ascii?Q?Om+3asCJu3XzBObBwGfURi2HVn1va/aBPbof09ZWXgzX0HmBmoUbgmiIAjpH?=
 =?us-ascii?Q?+M6hH4YmGPJkuXPQQ+5eYGxO/wuUIYwnpAZw6MMiyDQKfoMhX/gSIXjbSCqA?=
 =?us-ascii?Q?F2lMs9hg2LTYLnkMFS9EpP0YQCFICP6ia34z0Bi/yYZCfUuUAGueYi7oCgol?=
 =?us-ascii?Q?DdphRTdDYsqIFpKotKq6fyjF0uNsujFJ/Kl9I9WRrq7Wwsis+ymRb4g6fyF9?=
 =?us-ascii?Q?BPngDGMyM9xyBYJz1qP2cj9gNtM5Ai152kT4VFpAipet6Qa4R+E7wimmr4QW?=
 =?us-ascii?Q?uiXWye3hUaCCrNFLU97vwWkC43HlHhMspfB2xuG0vZhsnV9QMRy6bOY63sIO?=
 =?us-ascii?Q?xWp4dC6qP47y6EbsjMFOq85EU3Tu9J+OkzDu/Xy5nmNLcY4CLqr4k4V7n6D4?=
 =?us-ascii?Q?kKA8a2rkmKjazdvmLFpWg7isD3Z6KUgiYMAl4VlKJpKpbWU72b9MRMsLkgur?=
 =?us-ascii?Q?Cq1DlMxpQQrKkZo/VR1uZhYwCoNAVLUifmjUW8hVxkl53pPHBVkQtXgXTBdu?=
 =?us-ascii?Q?apXT6UmX3PplYP3nHz38ENxAkZiM6Tp8KSN6970vZ5YhRrdu1deXXk1TeP9z?=
 =?us-ascii?Q?D0Aqpweza8M6qhgHq1fyt//Nli2G8iPp6SD9pUnJZRsg5vWeFA/wGeRaToJ2?=
 =?us-ascii?Q?BU9MiBZb+HaYkpibJhyiJzOXtn8gR0VBIBqumRUZf1cCD2HFigaxL4pSQuJy?=
 =?us-ascii?Q?wxEOyPT+WW7AZ0Q56oCHhxbJhekhCSi5Whxky2Zs92Wof5TQ5l6HCVcrWb6I?=
 =?us-ascii?Q?8znhYEbjy21c2WR4FfB0mWgHryg4bJBwGgzHn3lpDT4Gw4tZK9yJKX733MPB?=
 =?us-ascii?Q?xQMqsdaPkIZOmYwI9iTuz0TZWoV/wfweMJ/MQrfUR4PB7IW3KEt6lOjN0Yub?=
 =?us-ascii?Q?MZehe6K7SXyTEHmsm3cNv1oSShKOKT/6VKQNVvZpWGlAuGR3DggZjDifb0A+?=
 =?us-ascii?Q?sdZPEE4f/yD31rM1AgDtV36xqjljHklZJdgQyTNmj2xI2b8tVQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6141.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nqciRl4LrkIJm0AD176QV1LslgUdPL6beAolwGTQqsGc++O3u3vmNDsvpaEZ?=
 =?us-ascii?Q?CuAJse/havvjvbTuKfRkFtcKVDfw/ewGu+6WHSAs37wCRV9DtkZ19VKTRqY3?=
 =?us-ascii?Q?mKRLOU4WkfT2dk71cVOh2MZpO/oW4NrDknE+SjZ83wOij+infQqTnAmykgZV?=
 =?us-ascii?Q?MEzHtgQkfqe+LHZTIxCpEZgr7X0SVaZxno/E4aC5+IYTIrS9/QMHtcvUadfT?=
 =?us-ascii?Q?Ib96G/ypfSs+t5bKMPzyqB937VYd5FNYLF1PUpCvq2bCNfbs4S1wsz6PQ4cC?=
 =?us-ascii?Q?pUr+ROYBXrfq89RLLNllZFsmC/n79XYhm8vHcr28q7RZW5yjSqYAGQJirVlg?=
 =?us-ascii?Q?g6wdw8U4vhOn70Kjcl60srlRhVmCyfh/293nLoINTeoYRpo/ljtmyis6b4TY?=
 =?us-ascii?Q?JmfwVmFJsnYMV2n5aMntfF+c1EK4zo3ADx7k1DYqrpk1j7otRpizYdaqDAPp?=
 =?us-ascii?Q?2cw0kLIe1wJwJrn5EPv8+jnzlQjVf3ERP/NbAndJpqEoOxyVEwSAWAlMDsGF?=
 =?us-ascii?Q?r03iUehtqHzgmD/hiqGvyGoxvMJDzkr2B0adxKOMD4CVND461HmyyBEFKeGi?=
 =?us-ascii?Q?lVzL5gm1Nr2MMEpU/19ra65LxNHSLvlR02HffNaKYXGjXi87UtJ1VggTQvyD?=
 =?us-ascii?Q?0hWbU6KbV25CIVV4iBFBukxg9qTXWHJY/XCp08xFVu8vhxJ4Lbl9DMq1MEiF?=
 =?us-ascii?Q?x1FbMVOHTA/Duev+3H7p2Vm+UW4enLmhUFrtQoK2VSXc4nnswZSkAtwC5u0Q?=
 =?us-ascii?Q?pKr9VXhM2YrN8oPdO0XbXjX0l5IF5lOLRhwwqobxk/Na/Qxm3GVOCfJ2wiA7?=
 =?us-ascii?Q?eSfhrWw12eNF2YQ44/eTI/+WO7p0RWTRHJmMandZHXaTAGtxDZDmJzoSIJcz?=
 =?us-ascii?Q?bibiOSrQZB0Y5UIQPTFHogIms5qcaS69B+Tlp3ZPZbafY/CsIf8mFMjV6zhd?=
 =?us-ascii?Q?QORogDyFyyOrwjbH1lBKPgfFlssr38yYAZ9muoK55fTOokYhCYbIXJNL/Wy0?=
 =?us-ascii?Q?CvoqZKQ2C962H2fB/fQSbLlrAfN3pFE+hjHxN//WlbhpqgOxR/HR18h8GsyI?=
 =?us-ascii?Q?oTMFB3hoJAP0x0wXIE0/TXsDjTpdU7Yx5yPmtTsrm16Gb7kTz+Tg1wrIF4Qx?=
 =?us-ascii?Q?pV5tHjcboAnDLSQyqtToZszDsKKWw532Sfm+X4S8uM5sgFWyjJ/N0pelAStg?=
 =?us-ascii?Q?qc9Vqeb3V2WubZTeiPpWivAOzFEoMkRc49y1pf3OlZS9hA9mwNA6z2XShOzH?=
 =?us-ascii?Q?lr9Yiu0D/jYGDEVvz0Qz8NrMDL3fxk4sV8rF9mnw9eBsg298snkAqA0uZf4r?=
 =?us-ascii?Q?hAiKDuVO71WzDkEw9Lna5OrmRnWga+JDBcJPeKKOXgQXrsU//2c1iyxnDHw2?=
 =?us-ascii?Q?CTh5g8TWWLKlI2UxZvqQJce3G7VT/xFCSdh/uB9NAX0+bnJYVWT+fGtkwTwR?=
 =?us-ascii?Q?XWS3LoeLChtQFHMxAqQ0eKfTjXVYUEDSkH2yFUQiDBlrpOnvfm9SOz6/HkEb?=
 =?us-ascii?Q?3eFLHTHkaa4Csc9CTUUylaft0AQVpc9Qpsa9R5zOXrwtKFmaIHN3vwLf117w?=
 =?us-ascii?Q?QMYPw3oyYFRsPc7vLObB7AepV/t85lYeW5RueZlfb+pINlqEgA6Ud4Bl9ifs?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1802a953-83d2-479e-8164-08dde710ad46
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6141.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 15:28:17.1770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kn5YxILJZeH6sInFU/sPt8qKGu2pZx0J2n2R64l3GLuXtaW67jq37yz1Ch9ftH4J/Ox5ZkAj/FVh3OZEUN1aQtceRa1nYR68R0CsZPMpq2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6250
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

On Fri, Aug 29, 2025 at 12:40:02PM +0200, Maarten Lankhorst wrote:
>Hey,
>
>Den 2025-08-29 kl. 00:04, skrev Lucas De Marchi:
>> Currently there are 2 wait loops for loading GuC: one in
>> xe_mmio_wait32_not() and one guc_wait_ucode(). Now that there's a
>> generic poll_timeout_us(), refactor the code to use that and be more
>> readable.
>>
>> Main change in behavior is that there's no exponential wait anymore:
>> that is now replaced by a 10msec retry.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_guc.c | 269 ++++++++++++++++++++------------------------
>>  1 file changed, 125 insertions(+), 144 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 37d06c51180cb..130492405a982 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -5,6 +5,7 @@
>>
>>  #include "xe_guc.h"
>>
>> +#include <linux/iopoll.h>
>>  #include <drm/drm_managed.h>
>>
>>  #include <generated/xe_wa_oob.h>
>> @@ -981,21 +982,103 @@ static int guc_xfer_rsa(struct xe_guc *guc)
>>  	return 0;
>>  }
>>
>> +static s32 guc_pc_get_cur_freq(struct xe_guc_pc *guc_pc)
>> +{
>> +	u32 freq;
>> +	int ret = xe_guc_pc_get_cur_freq(guc_pc, &freq);
>> +
>> +	return ret ? ret : freq;
>> +}
>I'm fairly sure all callers are holding the forcewake, so you can simply use guc_pc_get_cur_freq_fw directly and skip this extra function?

yeah, I will add a separate patch for that.

thanks
Lucas De Marchi
