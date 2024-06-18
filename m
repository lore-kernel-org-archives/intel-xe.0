Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0E7C27C4F
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 19:16:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2279910E110;
	Tue, 18 Jun 2024 19:16:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T5hfUpQH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC7210E110
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jun 2024 19:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718738170; x=1750274170;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0I8w+BivSMcVcVAAHfRqQ545PQHa/uP6nTwy7dYuY8M=;
 b=T5hfUpQHzgp8iU8C1WsJ7JlOoecWhwkABCBr2odpcrX2faXWeizXbT5A
 icoM2hLs0WSMML4MwCmbPPUXVOw5BpHGoU2A/ya6XsXs4F9Vwgn0+sfDw
 wBjEChpjfbbSHd2/AzMiYPHL0GQ4+SMRJKqErr2q742wJxPtqrJBtnj49
 FpW+cUB1FuW5+YECU0A75CU8EHnwgmLqQbywOEiV/Qp0OEmF6p0JcvbEl
 KfZyz3+UuXeoZEp4SZLQnFQJ8e0/g65elfEh7E4VARc9SD0lE77rnXqfT
 ppldnIZ47szt2y8klVgTrKeWQ3Sk3NcxxV9UPJafH0swzNeSnPrG0N9Fl w==;
X-CSE-ConnectionGUID: KG4FbEliSUeJ6vSojDyTYw==
X-CSE-MsgGUID: 5HYZ1q/8SBmni0jE7ojpwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15877158"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="15877158"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 12:16:09 -0700
X-CSE-ConnectionGUID: Cn7lHrdkTZqy6/5UVi9deg==
X-CSE-MsgGUID: DnZ0GkCAS/2cvdbJHejhpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="46609018"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jun 2024 12:16:09 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 18 Jun 2024 12:16:08 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 18 Jun 2024 12:16:08 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 18 Jun 2024 12:16:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PTG6sQrH72IzkdK+M4tOCf1xwYwi8I1Jto2tWPC9j72Afa/Mgz+176Gg5nNIPLtkv0hENX+jkL0zU5kyCNmk49rQNAQg6UrymVuBuK5q3H2OgM+2NQStC/v2qd/4f9o8avE20/jLgajhgl9DbflZFjc2yTjVf8HHm84Dr/0Bw5SYDHk+DWvtzag47ker8GSljcNAcXoLNn9Y/mcMgwxjUKshcUWDz6/3G4iF5BIBuqn0xvFuFKXD9nBELE3zLUfFKm4tFKppbzZt5om7fMzsBdd+frKuTTDvX376WnBUSPtKsBGMNn5x+PKwdYmbfbJXPLAZszMTVhalh6gR25X43A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CfgegokOMH5jUjN2dqMYJBrr1tR2lmSDvLX1DZD6Ftk=;
 b=MB8eahOGbAkq+zLPG8dGNZSQ4BWIi9yt7HljRMUrtapSc58EtVqnqZAsAR/LiXEF2HFZtiUK5DB4wRmvWMgSpfxGtkwufyJjwfm2uOX0eWOiiFP3UyiaGvnHUwYB+6v6rY/PBFG6CvNF64GpdY9L/dRzvNFtr1T62UH8epOau/g11CcFTsH9epwxcmMfbt60Y3IkPq4Wp6TE1Gb0OZB8vEKhYG0rHhRVTbpDNkozdWJK9fp4A5cmGuTaNMUyzHHbdrkUPvJmYKORay3thlDUEFTdMO/RpSg0JQao0af+ZXg4XrZC4w4gFWhm57V3sy2RV7yTez96Heb29d2wQdPzVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB7666.namprd11.prod.outlook.com (2603:10b6:806:34b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 19:16:06 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 19:16:06 +0000
Date: Tue, 18 Jun 2024 12:16:03 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe: Use ttm_uncached for BO with NEEDS_UC flag
Message-ID: <20240618191603.GP2905419@mdroper-desk1.amr.corp.intel.com>
References: <20240618104947.729-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240618104947.729-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0162.namprd03.prod.outlook.com
 (2603:10b6:a03:338::17) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB7666:EE_
X-MS-Office365-Filtering-Correlation-Id: ead24aff-010e-4f23-e632-08dc8fcb1a47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|376011|366013;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?PwnUZx76bV4esZCS6xwyOY0hJ4geVo18Rf69kbOxuWnAPH2mE7KAYs6PAz?=
 =?iso-8859-1?Q?I4FolIEbQCNesbHdj9wru6KTMMnz2bqKKN/Hto6a5nk4YuMoe18iXvYMSJ?=
 =?iso-8859-1?Q?0h7ykl4pPXNd41q1q+rvXVcOvHg3b2ZZfNxdk9MPFfpXJ8N6qQgN55St2d?=
 =?iso-8859-1?Q?SRfVCID37ig/51/FdOqV2TghthIqUl6OWQTsg4AfqxztOlvgkzn9IGcTmx?=
 =?iso-8859-1?Q?Mb01CDMZiv9aV9IpcMNGSVyini2EBmoZ3XV45jV8wQWnXDUhTNZcjbKcwB?=
 =?iso-8859-1?Q?nDvAN556stFd2MZD2hcTFXWgHiUx/yWzzKV2cYkqK+5R4nJ12B7RpyhRnh?=
 =?iso-8859-1?Q?tUSrnC/pnLufdWnZh0Kw/gwhr2Lm03KtxsTgM/Ra+rzvmdGROjgAaRVV4s?=
 =?iso-8859-1?Q?Ql8223eMof3IfmkoQS6KiFkhqnO8auZEoiqdIuyd1a1qUN3QrOjwe7vgTp?=
 =?iso-8859-1?Q?OtNdHfHeidZTpL8y/Tx2iFuaTNoY6mulADWfrPfgJZQHcPeKIHFHJQop39?=
 =?iso-8859-1?Q?/qUYG1bYoEXGCClY0Dezxq79S5IbG3HmnLtGILexOVJnGg8aeyFPWpSsXU?=
 =?iso-8859-1?Q?RyV6t0yVmVIsmTaFhikHYbHRu/20wjyWvInUOyxxQtLLn4VXddZEkj9NVl?=
 =?iso-8859-1?Q?iCpZTTRgCATa68IgDeqFyfzP7vfcSaaT8rrIrsUI4AGVge0tB682wmPpAW?=
 =?iso-8859-1?Q?IqBaxjbhCt4g6hSVr5LGZMDFzt0qaDPo3xkoqEFH3NbmB/nRSd15xkP38E?=
 =?iso-8859-1?Q?Hoi8ZTrdhhk5mZStIh+S3P08WXzJ96MxqpRIgIKpcDjDT2hK5RISAIw6xs?=
 =?iso-8859-1?Q?/PAQ/VH57Agmu7CjClryUWRDvrVnb2qdYb5hcus0oRe4l92srqPlU/DhuO?=
 =?iso-8859-1?Q?UBR4kRMN85L0nErljIv7tMr75zo+mb91eQl75iAHV7xgNgx+RDL69V9pwn?=
 =?iso-8859-1?Q?f5KotbuxGdodS8FTpIFelqxnqjzYDLDCh4sp7GO1Sc+7gNAeBaBtd16KM1?=
 =?iso-8859-1?Q?SDE9MvSazSu6lJQlL6s3Ko/QO8hqoEV5GFxPqy9nm5p+WGlTWDHn6WN4JF?=
 =?iso-8859-1?Q?3X3BmUHuaA5Mhy9d9zUJCIJvp8jZYf2toHDRzixdHJ79IynzsLpmzdMeCD?=
 =?iso-8859-1?Q?KR81wrEhLKdS6+BjViQ9bKSgmgj1ThIbwny0ggCWcZlxu66FrpR2EV9gnQ?=
 =?iso-8859-1?Q?wThEcCzaj2WWdLQ0txr2uva6ZZkclu4P3LNK7d+Nzx3NItuIre3UeK+NOx?=
 =?iso-8859-1?Q?Fc2ujgyQqFLQBK4M8w+GvpcsXP51H7bKlPvTqTjllNrpnSo5oB0iVV5enB?=
 =?iso-8859-1?Q?0kWQtGl1aiSQHy+VrPEWScs4n+6Fu4Xu1FCaEaUjx+mZCoEHw26Ma+oi3v?=
 =?iso-8859-1?Q?WHC1TvDOtG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(376011)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?WFdxSJ/+hFBHZoq2TgAP8phPj3NenJC50+/qDijRq7f//r5xSkwHzfoRMy?=
 =?iso-8859-1?Q?Olrg4r6sEAQT8KIDUIMfCrSQgbB25IGz3GpS2+TP55n076W6bidYL50Std?=
 =?iso-8859-1?Q?dEwkMrljyVrYmzYyDI8GjxjCvnZVsYPdOW+PdvG3ssarMR5soJFQ1YIBYe?=
 =?iso-8859-1?Q?D+ToS22V1Q/tHAy8KJDNSuMyLJ96mA2jOMGoCrBAkpCbMixA8r7Q4RHUqf?=
 =?iso-8859-1?Q?u8rKVwRhwfP2L42gjYc0Mbe0QkkZ2/sfXWvo1n/g3LNSdBSmiFbYxmj374?=
 =?iso-8859-1?Q?YJFMqVyCZGa9xROz/Jg1+Go8ix4VSueGtW0tHTfR6DYCtxO8HTFD/aF5uD?=
 =?iso-8859-1?Q?woE2iYhFSdcVP1664IhAh+1fNYchdMgWEHC073+uZlTwJUidPY3LseXW74?=
 =?iso-8859-1?Q?wj5E0PJPbzL9MrnrXoxr7AZdKDh1itbIP/f6e0YtT2plA0Barb6SevVAHo?=
 =?iso-8859-1?Q?ynKO7GihSRjbBNe7kC7XFuEYGNsjbmwVp1aHTH9ubdqgw1zru1VzWeNX7o?=
 =?iso-8859-1?Q?nUxaXLuEg3ylwYe+vnmJpFugZG1XJo1U+YVK66LVATpmOH5gdzk6rNZbgj?=
 =?iso-8859-1?Q?rB+eaVhqtxj2pgE22UauWRKVJQMWCtswQdZgt8UU9rm7ha2+ztFhFSiYvj?=
 =?iso-8859-1?Q?kyhGcsH0rHIQARVpsY7xHelMiDt2cG+EvLzByoKZGr5FjyDkylF/mNZyYd?=
 =?iso-8859-1?Q?LGMa6cWeUas7kZJNPlveAvmP03seRnz2Tx78nWQyWogiTh2O/l416je8MB?=
 =?iso-8859-1?Q?pUh9bcNk4r86c6uqNmuCXEmkVSt7Yt+AAIMYJ4mX6+cyjiOJyJskJ766xu?=
 =?iso-8859-1?Q?SJNCD8+RrLJJ0DeJipzc7+ZnFHlPn0L012NVkUpufeSwgen3GD6ksQaWuK?=
 =?iso-8859-1?Q?PkNeB1JxAyZ3nx2xhZ3dhdtXnjzheQx5U85emZSDDdSt9O31H67Puf23Oh?=
 =?iso-8859-1?Q?015r6ZYWjNj1/2tCJYlV/yMGDnLnhkFvKuNTTi5XDwPm9BsiTYomTjCEbl?=
 =?iso-8859-1?Q?I8GkkIVamGVyu8bqwLndXk5L8Y+34DBSnft56vj6+CXHLzBrNxmQWWsP8w?=
 =?iso-8859-1?Q?pPSbhaPAQuZ6bNrHxadYXvabOTfiVRmQT/ha4qv+HR0TissGouFXTFt2pb?=
 =?iso-8859-1?Q?wXPWTuFbLk2GwZP3uE0gws4EF9H0t343K7js2Q7KeU6rCaSZY5JlnZ/0NY?=
 =?iso-8859-1?Q?vC+25mE3vh3Fl1HeDxLQYSgmpm+D7gAX4bjBUYCnsoATAejsv0CWAAp8qd?=
 =?iso-8859-1?Q?i26wsFrIy7WeQL3oZQ8eY4l57dsjalyAsztbMwlHUmTpJz5gKu2YKYbMyo?=
 =?iso-8859-1?Q?tZtXhTeVySThFT1HZoJU9G18ESU58fFS1+VitG1PHE6p83OvfUeI97c4YF?=
 =?iso-8859-1?Q?jzKBR35w/h8UIS9HKFU776+Q55UV7MeSaY6pq5eZo6s6X/Esf27ZJ/b3XM?=
 =?iso-8859-1?Q?EEha59T7C3sv/2D5D05jT6yTuInimore0Q9ab5mNEItyPA3akpCH1QAi37?=
 =?iso-8859-1?Q?xWYthEsWETS+mm2svyX3sgT+W/Rshv+Uun06SBTgoNQSxqJuLVwDka0eKm?=
 =?iso-8859-1?Q?YSS41LIokUwEOMbtkXzfGmpEB7UkJwTJi/20v5QbMFOV4xg5Nyha1Msm3v?=
 =?iso-8859-1?Q?wj8G7k97xEL3iEUAWeFTIxqBXDXhoM5W6TD0A8FcYxmRYHPIy+iOwaVA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ead24aff-010e-4f23-e632-08dc8fcb1a47
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 19:16:06.2887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ueRdhOx0c9An3L+HOmGMv7Ih3tg9d9s4YuIgOMr8vguK8kDNF+4FKu4T0OGH5uHwSg1+klmXPLKTKMMOsqVRV5vcfWrxpshO3IkAvWM40g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7666
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

On Tue, Jun 18, 2024 at 12:49:47PM +0200, Michal Wajdeczko wrote:
> We should honor requested uncached mode also at the TTM layer.
> Otherwise, we risk losing updates to the memory based interrupts
> source or status vectors, as those require uncached memory.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
> v2: assert that cpu_caching is unset (Matt)

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 74294f1b05bc..65c696966e96 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -378,6 +378,15 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
>  	    (xe->info.graphics_verx100 >= 1270 && bo->flags & XE_BO_FLAG_PAGETABLE))
>  		caching = ttm_write_combined;
>  
> +	if (bo->flags & XE_BO_FLAG_NEEDS_UC) {
> +		/*
> +		 * Valid only for internally-created buffers only, for
> +		 * which cpu_caching is never initialized.
> +		 */
> +		xe_assert(xe, bo->cpu_caching == 0);
> +		caching = ttm_uncached;
> +	}
> +
>  	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching, extra_pages);
>  	if (err) {
>  		kfree(tt);
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
