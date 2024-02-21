Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680FDC48BC3
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 15:09:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B8B10E26B;
	Wed, 21 Feb 2024 15:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="leTlC/6c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BEDD10E26B
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 15:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708528170; x=1740064170;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yR9+NNvF7r6G1EJX9FCXnF5OeRrVk6rs0VNOrauRJfE=;
 b=leTlC/6cfjQ9F+Be3AXyM+BfnvDkl8mwFeg34JHdNQEFM4pdQCpiMHVL
 n+9UnE+sVray2A/0gb+sWraZ+TpfR0eYnTI2GHAzTbn6MUQVqs8j77Llb
 ApJUi+VzO5nyrwsRMgGzinezByKVcRJBJhpdNpZvbpSogzTM7qrF8dbuS
 kLrVwC8/6JS/uL8pHpM3DjtdG7XvM6S0VZT0IJ0ktiVXLx31lqwOUZ7hs
 x7KwcvoPJ+4wOsMkMKlT8GGszNEYkt2liWESIUDwElkZWXXrcaOXW0Tfk
 2jVMah3tG96CnYxk7GJ1sqhbzBmlEr/2vcZkG0Q7KmgzzzR+YOtZyZOQe A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="6508769"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="6508769"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 07:09:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5522299"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2024 07:09:28 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 07:09:27 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 21 Feb 2024 07:09:27 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 21 Feb 2024 07:09:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f1JJOIvGlRIhAkPRPbnsWbqXIozq4H1sB4loReJMpECF3bFcHsoFZvVpybp+D3/IZCM6BnOZCenynZJOPuqwweD/0bE195/hYTxmaht/KOlaEoJnJFbtmHUKBxGpZyeDVkQcZ4HTrdFDvDQAJY03gUoWOmJmjRtp6M/NtsuR1LWRVsjUBb8uLCFRH0VSSJYIKKh+ibuosSo48LbTO6yax0ZJW2ngtcjRK7agUf1tv2BOa0XLBEWwAkWKU8Vm8Ap07JxBuve9K3PTDY+F5hJ/3BDIz7ArSugnshslfDvaNcgNMNUr7QajSoqnZ/krWUZ3qiQ1hL4NadD59QYdOPfxQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=24M8N3KsEx5v7qFNNuGDWTDI5T/3d89AnUBCdlKXg6c=;
 b=HABFe5EkT6fpzbKWnDNnk7JVVX/7xaESeWhw7M/DD5t4y3QdSED1Aml9VV5QqOFHl93/JIczqx8AsOqBFRLJB5CgniMKF3FeQAGIoPEaxGHnT6aDvnvpMt3DUFOFXtLKSoJLIFjVA8iIaMJaBG53PNeqWptb+UvPRdmP7HaNse/r1H/FPa84EaUiQ4ILUZXNcVFHAszdDHy9aaSSMNomrBFM5dP7TVsvVFFqnt6jvxFteCRc/b0bpvmG/XNu+Z+82V1lptEMi8dGeMZjzNy+ZNNjxTBaCyS9nrfBX1JYLfu5ql6/ToUazOiIbSlQiR2HFcEw+UZWU7CTRYJ+GrnLDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by IA0PR11MB7331.namprd11.prod.outlook.com (2603:10b6:208:435::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.37; Wed, 21 Feb
 2024 15:09:25 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::63b7:3499:79a1:2796]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::63b7:3499:79a1:2796%2]) with mapi id 15.20.7292.036; Wed, 21 Feb 2024
 15:09:25 +0000
Date: Wed, 21 Feb 2024 16:09:19 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v5 2/9] drm/xe: Clear all snapshot members after deleting
 coredump
Message-ID: <ZdYSH18rH8iB3_q2@fdugast-desk.home>
References: <20240221133024.898315-1-maarten.lankhorst@linux.intel.com>
 <20240221133024.898315-2-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240221133024.898315-2-maarten.lankhorst@linux.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR4P281CA0444.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::6) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|IA0PR11MB7331:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f7d6320-5b88-48ce-273a-08dc32ef179e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ccya+k+u0F1PNj/U+YSilfDFatstN6dB5odcgpdc51kM96Db80ZYPCyvzlmc9zfI3uI1hAu4j4OXbLV+KaNAG0RFlGMgOTr/0buAdHlJhZR+LfV5QFA6iK7AbeTYVVFe7goV68A+M3m7NeyNrUB8d+HkfrQMR6DEAmHG6CcSGH218BrBZN3edWO6D0bY6rMa4QQglVonReFrY15XjxRWA7O++MahYY/uZCevCjU9So3pQgLemWfdo1UsZ8JDdZ2vEYGIz1yRAFG1ywLWZkeRJUg24+IZBxSb8KxMeX3iLUxVAPVmsDkJ0q/m/bDjgwQcpwfwsLJuzr4AuqjDQdCUxXav9qFoPPs5Et+CkFaLYG5SYhCR4HpfrjZiHNjdNOFW/TuJ8cWs6QLjaKKMznOoyE880cuafx9R3Kw3X3/+g4xDB3UmmGkhLM9IscrZhb6BzVA68BJS7flI6KU+NgsqP6gViUy2g8b4m47Lwhym1K1EdHqjSZPNUaXg7BkUxuVYJlurDzWQ9MSl58khyNN/Rxg5T9WTfTp/vMIrCdKQvhA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lHW2LxUMiqpRME/l2H/IrJMNYZKawDvu5e5nhs99x5soVeUijAeTlunzfwUv?=
 =?us-ascii?Q?+6lgxsMr166amTmLLd6DwvQNv+ZhnuGfnrBmpssFowVzL7tt3ZhuubCYhY9F?=
 =?us-ascii?Q?aaQgNyfI2YAWK/cUrTo06hAe70ZhPcYfbfjVR03bUmjP3Ngn5dLESLUllxzv?=
 =?us-ascii?Q?Ou3h6H8aQg0/8FFDi4beLl5z9SkKafle5QBiZEgvCNWXuOzRZLueLGHOPXDY?=
 =?us-ascii?Q?X8lmbc7l6btP8TNewhuyUppgyTmLTc63v0+LERWTB+5M/BpsCfFXikZN3K71?=
 =?us-ascii?Q?QYANCZVaV+Ije3G0iR6Y/hvF8Tk/+o19ed3XIJ/r/2/6VvdjNlKKWaAHX1RO?=
 =?us-ascii?Q?vnevgq06G7F/FPB4nBU8atAxOEbDaFiiKE6pR7gozSov/xlVSII2vHM3gIdp?=
 =?us-ascii?Q?NMvSiNEVAGEjH8UrSMY2M5mNaRGFcTFlA05DGQNQ+F7HqRbUPGtdbAsNyD+1?=
 =?us-ascii?Q?wTfv7+HbBEqasIbWv3VmDMjedj7CNB6IGW9Yv6/l9lC0H6SUUlKu6GxJ8vYL?=
 =?us-ascii?Q?19nSB9j1b7wyEQ3aFbN9fidr3QNYNpGiJ+NQp5bXT8ayg0HCRfAThUJ3ngdf?=
 =?us-ascii?Q?sZ3gV4AHSxnCb0qIhENsCRGQiXoOFJfAlr4FGqikCaZ4WcOXoJDdKX20m6KZ?=
 =?us-ascii?Q?cVfFm8yj8GcZC+gH4GDdy55muzhgS0l6dFKPyU/vYNYExjqAMZm85Y4z8ydz?=
 =?us-ascii?Q?xYmqrQBIPHB45ipO5nB9l249hHUbU+IY2ytaR4DepfOfifD1CiA9pI325p9r?=
 =?us-ascii?Q?UBWS8GucIUE+zWk3prfrTMxnicsSHIsH53LIBTrdKI4CMrmO/UMLXDAnwDzU?=
 =?us-ascii?Q?PLjlN/NmKh9lfbDsiMpLb1F/CSaqNhQuda+3atP2PaRAPFDqWLL3tw9P+Qtw?=
 =?us-ascii?Q?6042G6VvxaPc5j6B2hzeq18JQ/MI6GJHvfAWCqz8zZQbj9hMtsucKkSRfHsz?=
 =?us-ascii?Q?WkZOqOKQI3Kdjlk+VG9exE3GCNh6v275T+1/MQgVCgPGKvhxqt9afq9GCXB6?=
 =?us-ascii?Q?3aeX4iZNZ8fFz+T70drUvgqPaytEnaFdM9oLRV7k/dSjz028okQI3YaLlWPY?=
 =?us-ascii?Q?nptZt1118PaXa2QAc3Mag6HV/609/1ldNaXLf6JQvbXi1y5ccKFDAx/E+hOQ?=
 =?us-ascii?Q?zp8AvF+OMdk99ONUJRy/91Olabrdg6j9wrKeZn5PPZuGdDbu1y6ff8x9VcRS?=
 =?us-ascii?Q?qRvUgt8wmkf9u6IIl3QMUoBF1fbkRgVT8LTKcwjjLIOhPKd4smPTDgvt0wSZ?=
 =?us-ascii?Q?0vdEeoIbkyNV/ZuJbTbvNryNNULC+45MgDU+npylu0Z8CgtDXVcbQ5LA/UG2?=
 =?us-ascii?Q?OVdcgblyfF0yrbjk5QFovRXw25gCf0VnHT3Nvk0JJgmRTB/a6vAa19HEJPK/?=
 =?us-ascii?Q?+bUZkbNoSwkxHyD+tU0NXSTP3H7NrKjxcynrVtNbdmmS9bS0dt4s478LcWJU?=
 =?us-ascii?Q?AFEvTxMP3xyF9g/sBNeRXlIhMDClAHsbzJOeyj3Q2nkhwjF376cdSb6ueCo5?=
 =?us-ascii?Q?AA7zus02+V3xq50R0DKEhYE0p4xYSR657IpO3UOjpH22GbHgYw32gmUcjGVk?=
 =?us-ascii?Q?c3xZx+iY+YoHRu5J2oPzdJ5hquHpk7lAuyuuBUT65kuER3fbpSQYp1H1F4RW?=
 =?us-ascii?Q?cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f7d6320-5b88-48ce-273a-08dc32ef179e
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 15:09:25.5389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3NhYKHcUttL/gAdUbULQ+Q0ndNrqL42jsYICwW3lQLt5k9AtFfWqBmgvLwaGwYl9xEXWlGvyUGUmPxRDDEDe/0ypRlapTW8/QlztjgQUmPI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7331
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

On Wed, Feb 21, 2024 at 02:30:17PM +0100, Maarten Lankhorst wrote:
> It's not strictly needed to clear right now, but this prevents bugs
> from dangling pointers.
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 08d3f6cb72292..ae26d8c6d01c5 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -124,6 +124,8 @@ static void xe_devcoredump_free(void *data)
>  		if (coredump->snapshot.hwe[i])
>  			xe_hw_engine_snapshot_free(coredump->snapshot.hwe[i]);
>  
> +	/* To prevent stale data on next snapshot, clear everything */
> +	memset(&coredump->snapshot, 0, sizeof(coredump->snapshot));
>  	coredump->captured = false;
>  	drm_info(&coredump_to_xe(coredump)->drm,
>  		 "Xe device coredump has been deleted.\n");
> -- 
> 2.43.0
> 
