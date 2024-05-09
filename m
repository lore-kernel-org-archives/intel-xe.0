Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C80D9C25B10
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 20:58:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7053910E481;
	Thu,  9 May 2024 20:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="by23x0I0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE8710E0AA
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 20:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715288336; x=1746824336;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bxTuqBHR6sN7P2nCVekMUjziM5gYQ1mPxb8xi0VVoa0=;
 b=by23x0I0G8IEVnTBSIHoFhk288XldfvJMbS4xgJQ0z2wovTHTdH6myJA
 GM80qPN49CDSpBoRweIZxRu5vuuUJfpJv4EEDYW7Kml3PQdsdrqQCyXvQ
 7/A95qf2OIkXYZfSaRQb4ln1xZnMKRVoP4qxrsA8M1LLbgFvcwofHAq1j
 O1LuoUYMqrQ9cYsi+JhCq0w6+NfoQ/TrBKkOJ9pIeUhvgU8y6h5SHaJ9r
 6uUyUTbW028SE+LJypu5UDDS/71MtWnqzZBv0bpI8jbnMCNGINplpOUi1
 7sugajwzWonjyGxdBdd6lYsGFZcb2g2CCx7incwkMI5bjHevrTHQeoBRp w==;
X-CSE-ConnectionGUID: GiXHpU3SQZegUGOfzneY3g==
X-CSE-MsgGUID: ul5cYvDSRYGZ3sLLzZAZdg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="36621474"
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; d="scan'208";a="36621474"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 13:58:56 -0700
X-CSE-ConnectionGUID: +iyrWmwBTOq+EedeJOHx/g==
X-CSE-MsgGUID: vBpNJG2vRN+Q+VOxvI/Kqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; d="scan'208";a="29376103"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 May 2024 13:58:56 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 13:58:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 13:58:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 13:58:55 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 13:58:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M/0b0G4WiAHNdavrqg0wSHv6Yg3oiE6XPdysHUGST8IDKrUI7/kT+cryh9DkPKVTPoT6Js4+w7EEIucJZOkMQeQ/DitUgWpp0jmGuHsUDwlAWgZrrvsh8iJpD2iN7zPsIsgphGFpJZYMa3MnGQHuhFM+AiQsihrRT3Gzqt2LZalLIVpfhdizD8PJOrl/3o/49RALUS8L4jiJQ1A5jtaURwFYrpQD4ita9RCy5tJwyXk48YjzOWtNvfT+ZMVuBCrGXS1xm+S31lhWnU803COv12iEhQmgK/aTyCtofAJS19KcOciFIILjyfnPc7HTPqT5P20KaMFF8hDyMk3cmHWV9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IynNimMlhPIOI5CwlVMv4ZwFGvBJ842/Z8/7W0oABAY=;
 b=Ke+WSRWg6isgNen8rsYA7OXUCqnoADQtDZzdDl0qlhGq+tCRjPz8S2Rlhjoug46ySRhm0e1TLdtDMsKyGHz2J73BWmXEuaNJQPcb2bLcV6igaGusyXKkTNmzy8nIRoM7BptR7vDHHwDMTU0+YA9WFl8Y4SLLBYhulrcOGA3gRVyTwQoQ/c9BrQh4Ez6k9Ca7SaKoeGNQSPnoxII7Gyw/UpdgV8v8cgaTNSaiLlzIwhHknmKVHeijYGsuSVhgLbLxW07YJCRXjNj3f/EfNUjGEBXq4MGH3NfX8o/rrN/MkDwfg3verh45crBF96w0fmPr17IkP51VUu39M4TJWQzgcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB6715.namprd11.prod.outlook.com (2603:10b6:303:20e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.43; Thu, 9 May
 2024 20:58:52 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.047; Thu, 9 May 2024
 20:58:52 +0000
Date: Thu, 9 May 2024 16:58:48 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Koby Elbaz <kelbaz@habana.ai>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v7 1/2] drm/xe: add a new debugfs file - mmio
Message-ID: <Zj05CMvDkg8kaEy4@intel.com>
References: <20240414081105.1199559-1-kelbaz@habana.ai>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240414081105.1199559-1-kelbaz@habana.ai>
X-ClientProxiedBy: SJ0PR13CA0053.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::28) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB6715:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e4f0a21-b163-4f50-f935-08dc706ad51e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?rd9fKIgffdsdg3LTGOiE2us7+KwTTZIO2hxZK7RG9CRFlsTd5PMgPqJgs9?=
 =?iso-8859-1?Q?qruw/6nr5boRCFE6ixMWgcJKKf8ocqxeu79FXC/YwpVvd22czogZpxO7X0?=
 =?iso-8859-1?Q?dzTiBfBszVP1gDsZ6urxvtNiOAj3Ssa7yRW+TAVO3YvbmxerHrwCHej1Sn?=
 =?iso-8859-1?Q?sRqjfk7sExLU/LKA4LeH8ZU44PLztDCtOHoNxI8mjxuiyBbJW2kO7lC0ra?=
 =?iso-8859-1?Q?OITL1Kv04g9KxseERh5f9mYE881brnAeBQUJS+Ehn6tiAhH6YzJpBbmNqv?=
 =?iso-8859-1?Q?0qwXSnMsGmbYAZFgvfBIXaMgmwiFRJUXE7GgTgcumV+TOHxXZtNQ/1+tJc?=
 =?iso-8859-1?Q?gbuuggib5MmaKz15zuV+uWQ9bnVOMibLeMpPlCotxFoO/8wqfEl6WORQPt?=
 =?iso-8859-1?Q?IVaPwnu8SI+w1PJEIqS8MH+qDkMVhZmZjZmluHbAEtP8/JbMfORZ0CpbCB?=
 =?iso-8859-1?Q?mAMKRce48JPbnS92PBZuskMZOcV07uwzdAiBMBTVqmgtpLEWAw9SwdDzO7?=
 =?iso-8859-1?Q?VNSlMdFdOIzA1yuoFSgyempD1h5Y7ah1l+hWn/qMWXMtzG50VVGAgtIHKN?=
 =?iso-8859-1?Q?KkiVbeVksQlvf4iQz+X/3QwyqTZxp4v9l0Nd4UQRW8mk+sH2isT30klSHS?=
 =?iso-8859-1?Q?S/rRxJsx0flCPP4TxLwKr5ixW7prmanwyArjOfdbcOmYmaGg0lVp2Y7Ebi?=
 =?iso-8859-1?Q?OIPt+dXAiVkHvjjbz5LqgjFC9J+g30HY0fgceFPN3O8Qhi/BsvvnYZYO1p?=
 =?iso-8859-1?Q?IYXdmMiAVGYOe1HaaTkFWiGrVw6yownD4HSJimNATUAm4lp5SDWVRUSJ4B?=
 =?iso-8859-1?Q?PWjT13HGFG84KHhf26q4pLdpTVaBYavvYdxVhKtzpWGAYF6oAwrmZkFEsR?=
 =?iso-8859-1?Q?LgPjCamIMdDcllbizBtGFBrAiNU+upi3vnz5WcBUk9lazPKA1CNsFH9tSC?=
 =?iso-8859-1?Q?nI5jPsOmXRSBw8Skjh9Cdzz/NjaApdc/EmGu59n5sadk+2Qu1bOE5Xu0wD?=
 =?iso-8859-1?Q?f0/7fA9DckODhYSESXbY1uK7uMp62svgJ5Rw9+itqZavnNB/FU8Xz5Dzdf?=
 =?iso-8859-1?Q?gzaxb7eVqW8UJ8fsM7uvVk4W06EsQ9ejL/LMgSbsaJufCv1XV8jWTiGwbX?=
 =?iso-8859-1?Q?KRp3IyTp2wPjV9pStzetEGMdS/jHGLZ+G9ZJI3Xcqs7sDRMjjulLGl4bKu?=
 =?iso-8859-1?Q?XWoLcmL1oTebssZMniKEY82IlY/3BRNgp28HqchXyW6lGV0aH+O6xUAjl7?=
 =?iso-8859-1?Q?qUZfsYkp0rM4bJ5RXEgP7lRK4tuIek1ZaNAwwWGz9pkkMcCvna1+lcDMOM?=
 =?iso-8859-1?Q?jIw98D71zdE7esPMfxgALbmiMQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?AFJnKajdMrLxaBrnfZBzeqxk9GyPxGGvAO73515j72l+W/8T+H3yd0BJ8O?=
 =?iso-8859-1?Q?eF4Qtk6w4MFFe15mngA1wMQpkHRiKdZxwAHl0D4tuEfh6gBng2850diYpi?=
 =?iso-8859-1?Q?cInIqiLKqnKkLDD0+tvtv/y/khwJsW4gOhLSvbRGRk1wCy45tV7YKa67dG?=
 =?iso-8859-1?Q?9q4VBNGxhLoBvPHKSiF0jJm3cmFmT2EW1I22y/DzTMh5MHiYBunum+PhnU?=
 =?iso-8859-1?Q?V1erArnYnDzjd3612hBFn/r59e7oZlckrRY5umRYXNIlhmsfMUsphzr9NT?=
 =?iso-8859-1?Q?KinaBnJB0X31Fm8emRf4V6Pmqz9IwX1ezNXxYW4+G81/fsvTM/l6+XrNma?=
 =?iso-8859-1?Q?4xHbdNhLi//FtwtYW0UJUqrVadK4QuGUviGXKGq6ZhDjC8TytxZaENhRCd?=
 =?iso-8859-1?Q?i1Mz0hOX0wdRwU42Yhj2VAnAcZ+AVRrr915a1pMeGt1Dv1JENvqjhxz/on?=
 =?iso-8859-1?Q?+StdO3JqGy+NrEoO5Gv3KUropfcg5156r3TYl/ixryZ2bw/2C6el340Xh9?=
 =?iso-8859-1?Q?+wmgPQCzqi62fOX8jqAeUZVQbb+ixdcEHdfRgkg75oiCVCK1Z8tnaJR0hB?=
 =?iso-8859-1?Q?1yUfuLg4F1xlAONTFVznKceY29HgkuF/hBm9ZrJ1aPiQm5mHECX8RJon0o?=
 =?iso-8859-1?Q?FZjW82QrbOC/K6z5i954iKWTho+ZlTeDSrzPIXjJO5vxCiRpLmdmbo9axR?=
 =?iso-8859-1?Q?ca6/dwwr9LdlQD+XR2nq7OZZR+nvtxmaAYDD/eEvdwyU1yH4WPEQ/U9cRl?=
 =?iso-8859-1?Q?qSujUpeAnfML/ywe/+HGZI7/h4Q/ysBoa/lcH4X6wgnYKD743yaDyxe9to?=
 =?iso-8859-1?Q?vPVQ0LPPUs0ztX90cyXLSv/o40ty8Lswrlw2ifdaY5oWkNCwAp7FfW1UpR?=
 =?iso-8859-1?Q?UZwqRwrV0GWI97nGaK1s+ZgFHWiqROSwbKDh+0Io70y7RAdjJi35gfgI5b?=
 =?iso-8859-1?Q?s0IpQ1A896rOjWnr6kpQaUvfZfow7uk8wRAKR0lgE3EowD6YHRGiRuMwVK?=
 =?iso-8859-1?Q?wTXeIkM+RvXe3BFJUGPVECV/tAu8E9pqvSG3NKHwgObDFRP+VqQG1Eyy6s?=
 =?iso-8859-1?Q?ZprlxAHNabvIWIIk5STk6qvIGsvfWCn2YOfNugXZazM/9RpIHlglj9oGlX?=
 =?iso-8859-1?Q?bDhxomfT/QykHN71Ka27E5PspycHE9HRdldIqTxRN6Iyoe0nNFw9CxBV2v?=
 =?iso-8859-1?Q?PVEzyUJWy/LjpVkq8Iz7jzk2QokdS6Uqg5ak4vF3pUwsRMFFVYzCyoxlLi?=
 =?iso-8859-1?Q?D2mlrekgB6LFpNn/WCmbftzT1Bt1lu702Lxw9zSXmJvmj4Q8LXs1ixpVL6?=
 =?iso-8859-1?Q?VJ7KBvrWweF9crJulgjqlRI3rK/MTqH7Ljm3DD/e40fkw9hkqd4+FKkyGP?=
 =?iso-8859-1?Q?Mk1ALvV9XMh6yd7sdriRyW8PGe/CiwZLeLkcVIH7t7MGreWXqnikpry8lf?=
 =?iso-8859-1?Q?/bl3DepJOUHWC+5CzZTFZnRo/u0b8Y+xm9FcWwYNpiVrOt0IyNd7+lbwb4?=
 =?iso-8859-1?Q?nAb98PKE8aDFxrrwg5FFwd0OUMr+xaEPvF3qzw9qHxyOQm+ttm/cnuCFyV?=
 =?iso-8859-1?Q?utRV2QaxbyzZlwynlgd5xlMM6fllhkcBovwqw8rAdgwDuXZWpgGDkswD+4?=
 =?iso-8859-1?Q?LipXSHKXv/k3oClY5+2h7YsYjf6FqNVUMpZTTJhDFJkAggnwGGjyzh0A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e4f0a21-b163-4f50-f935-08dc706ad51e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 20:58:52.7472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XroMXOf+94N5yIjffcU3xXJI4dt3p5xNzwF7/JqKl7BoVnaXgf65oO4kkqO7gcfXoa89Nn+B+5AtTMHFGj8IjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6715
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

On Sun, Apr 14, 2024 at 11:11:04AM +0300, Koby Elbaz wrote:
> Now that the former mmio handlers are fully removed, this
> debugfs file will be used for mmio access (read/write)
> through the debugfs ioctl file operation.
> 
> Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index c9b30dbdc14d..ce27516ffac0 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -111,12 +111,22 @@ static int forcewake_release(struct inode *inode, struct file *file)
>  	return 0;
>  }
>  
> +static long xe_debugfs_mmio_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
> +{
> +	return 0;
> +}
> +
>  static const struct file_operations forcewake_all_fops = {
>  	.owner = THIS_MODULE,
>  	.open = forcewake_open,
>  	.release = forcewake_release,
>  };
>  
> +static const struct file_operations mmio_fops = {
> +	.owner = THIS_MODULE,
> +	.unlocked_ioctl = xe_debugfs_mmio_ioctl,

I was kind of afraid this was not done by other drivers in the debugfs,
but I found out other cases, so I'm fine with it.

But likely this patch should be merged with the second one?

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

> +};
> +
>  void xe_debugfs_register(struct xe_device *xe)
>  {
>  	struct ttm_device *bdev = &xe->ttm;
> @@ -155,6 +165,8 @@ void xe_debugfs_register(struct xe_device *xe)
>  	for_each_gt(gt, xe, id)
>  		xe_gt_debugfs_register(gt);
>  
> +	debugfs_create_file("mmio", 0644, root, xe, &mmio_fops);
> +
>  #ifdef CONFIG_FAULT_INJECTION
>  	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
>  #endif
> -- 
> 2.34.1
> 
