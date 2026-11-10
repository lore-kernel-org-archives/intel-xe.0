Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010E6606A828
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 17:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=arf7mZ0b
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EF0B10E070;
	Tue, 10 Nov 2026 17:00:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F9F410E172
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 17:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794330016; x=1825866016;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NO7/jr0aZeaVp+ENXY0GI0p7svOsjdYMl1lT3TLdMyM=;
 b=arf7mZ0buHw6Wb/nBdjZwpe8l+m8o+scMRLhRrnGuDVfd7lkIz9t18Fl
 Na1h+dHWJjaa0PhU0qoSUyLW91qeK0ZV6pcFK5giw0Ypobyz26XjXCb9J
 e1KAAJ6+RHsxjispzvG6g7ps8D0nLA//Tb/v9WMpidTyQdB5/2v5LMa5G
 kiM65WA4L0jt4rByirv45TmqniWHMAouitJ/iiMlGJumptanQZLCZsjQW
 LpKH1/URlWvoHsnmguivk8xr2b9du4VEkA1hwVE4IuJHgyJi7kIlpUAmC
 op23a8DDOVJNB8ydU4st5+tf7QQkBTlKXCmtjm5tXAfw8tAXRHdfYlzs+ w==;
X-CSE-ConnectionGUID: yVV8fc1uTSiYKoriwpPbUg==
X-CSE-MsgGUID: NzHegU1ITuyqriRjdg4W+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3000164"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3000164"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 09:00:15 -0800
X-CSE-ConnectionGUID: +5qyZWT/T/WQhDamMt0tlA==
X-CSE-MsgGUID: 2XLw6YT4TaWVM5w/xtaz+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8225484"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 09:00:15 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 09:00:14 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 10 Nov 2026 09:00:14 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.26) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 09:00:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ubVJJF00YgFcDiabw6p92KNaFpRMsNpcTPbUDMVhwSIv8R3qFOopvZxeDTdSelAipgwyemA12nSFzn1Rv4Z9Tw8V2OjSqaqrmRitiJ4oOLORdykb/DUw643LZslCHWOm1opOZaWbwVWuXDrpnWFYVcU0TtMxIzVJl6ioZY/YzSScXJBNzyjfjJUfW7Vbi81QUQ2lMUl1z5MLSe1eRZTF2J5ZGE1GQ0OqqAsAggc6eNOyYNjJo2asQh3Vgh+RjpP76HttZS0l5mdktyDl7TMnbUhcbJgGzWlBKMam1bK/O5LZUJQjvqZL+qyhNPHBKXH49nmdgLrDb4yuuyjMeeJjAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F/81Yi4lHDBLjK1HAxMjdEYvqFIuRgCkd9KUjTdf3b0=;
 b=YayDi8XR1P0fzbq7K1yD56WPzMRKrtFDFhCJSWcxGhRz4gJCpbilF6TpIwdtpFcgVe/UkyvPa0jXVINWCaKO+s+M8YdkR0Zgwx4at398QecFVecoKsC4geLP1rea+27h5aCfQfqUlDlCXrni9NojcOYgdg8aJFe8p+okpCf4rZvoBPyqJuKYoI6+k23sv9hGRdmhgm3YT7K8KO4kprjw89P7O2nNXEFm218E2zaaF3cwFIWFpaUPsVMrNNoO/Dg2p6KWSXlNfChgH2epLl7nC8Ec3ZS62K6zIsOMCOY9T/eca1y7wBRnOWJ7y/hBlbXWdXqhA52g+KiYDC22DjgoUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by SJ1PR11MB6107.namprd11.prod.outlook.com (2603:10b6:a03:48a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 16:59:10 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 16:59:10 +0000
Date: Tue, 10 Nov 2026 11:59:06 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <mallesh.koujalagi@intel.com>, <badal.nilawar@intel.com>
Subject: Re: [PATCH] drm/xe/ras: Remove unnecessary SIGID logging
Message-ID: <avNNWgTo_tNr94Ew@intel.com>
References: <20261104090701.1748619-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261104090701.1748619-2-riana.tauro@intel.com>
X-ClientProxiedBy: SJ0PR05CA0191.namprd05.prod.outlook.com
 (2603:10b6:a03:330::16) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|SJ1PR11MB6107:EE_
X-MS-Office365-Filtering-Correlation-Id: 37feefb5-fc6c-409c-dda4-08df3f4bf052
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|261009223027099003|11063799006|56012099006|10067099003|261028144727099003|261102123227099003|261021121427099003|261021123027099003|261022105027099003|261022075727099003|261026140227099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: pPQIIU9YwjNfh2gDcXeHT64qMPST1eHf4MluK6TwvL5NHgrDn7VlzVnHGX2LEzw3L0tUH+g230hE0ewv25C+8MvYaOV1chxiWzehwlKI0JiLXQ3KUYbWDJiFLRyCCM/+biZDvcyV14LC9+hJ4CPhzQzczfYkl4gKvahJc8X31hiVkWJMrwzDg4kwKOM78i8pSySVjbbekVB63rr9isIB/oln+Gxyanzv2qDdov/x0wAZ8JAm15skQTa66tZuqmOxv3C9fH2WujQv/TGU/7WO+e1iFdZp/o+ZjEglbEBNVsL9iLCLFBGICRfgex7Z64iDfKMGwG9fCF+NyuQxVloBHao+FAObjzDdK2oplj+pDfBax14jYMPgUWUuvv9GU57SBmhPyKgzx0ez1SuqzvnK8OKwYG+F3wTsVozMSu973q8+OX/DPgGrkaNQv64mfWRRmvq4Ecve/GHXF8YmFSansVQCuF4KcQFIubMta5hHjNbqqohyfsJCkLnQlz1MHvkzRpu7v5yFyhemUwxFOkSVJImyuK6XfoGAX+cog97O8KGSa3HJ03lxpWSGcET0ji5h8heBQAsMB0kkvbQYpGDIpr0ZRN5NFs3uYNZgh8tjHJI9at3RosWmfRBhnirMMbUs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(261009223027099003)(11063799006)(56012099006)(10067099003)(261028144727099003)(261102123227099003)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003)(261026140227099003)(261026121527099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q2kVMa2x3fZ25DG2tWk6EyugUP5m/+iIUDch53aRzJ6vY8HCJa10008Mu1QL?=
 =?us-ascii?Q?PQauE/jj7eM+AGGE5jHnxMxC2i6zdr8eTAB/pESGbZvD8kSQH20l3OOjXloK?=
 =?us-ascii?Q?anb1NRF1FiGwOsWC2103gy5DLSB8PIZVQuzBInNIQhgqzH7KqUcrKZWsK13s?=
 =?us-ascii?Q?aRUs+ECu9sjWSZtuO+5SdvWhU9imkdtxghhKjxkJHf9AbcFE/4w+vcmMXX+T?=
 =?us-ascii?Q?lWCUKv1u4TfgKGzGg0YWZLiA82Jhb2MLDEaNFLJD4z/AC4q/1ul9dxjhEl89?=
 =?us-ascii?Q?YIQrtxqog0ZLvbwMXFWIALltAx5iHAjmIUUzoaXUdxB14vFoIncXZPtnJmMh?=
 =?us-ascii?Q?nuAgcstDqp/Uj1lpeh42JCwU5aVihWNpUhsA0bHX4UN3bWQY0mU5DA4tOuXT?=
 =?us-ascii?Q?CM3kPbgOv4AcMyAJJymuvDfia4vlbGzv/REl1HOZEgZ4typ30d3PU1YwqIyJ?=
 =?us-ascii?Q?SqRDmtjPV+NXWIQPW5vC27wRo3O8OXdPngcc09y2t3lrQyqX3ECagJ6VvaES?=
 =?us-ascii?Q?yh/ALQw8oOG0pdCm/hJ41d5+UAZHUI0VISe3sMDP2YdvQabtbYjqRSAwohSY?=
 =?us-ascii?Q?QutO/RNIHN0mry4/RAGhgv6ZSSrSWsFpg/5uYNtYI1O94VYCQrecAUdolUeD?=
 =?us-ascii?Q?lIu/iFirjmT3HKrBbW1rYbBG6bBBWc0QTHlREb2CzGb9yJ6hulDNP+2jaFBZ?=
 =?us-ascii?Q?nXkAG6Mv/RtcnIrJrJz7iRVUAN0Ow1tO9CgSA1LWYTA2y+w+X+OnWsOXa2Cv?=
 =?us-ascii?Q?nlgdJe8T6jjSUYpyBpMmpGr64xwdAneo782ikJpHJCyJEkwVxS20vGZt4ucH?=
 =?us-ascii?Q?YikNuZNzpxiMekGExpSzT+ybJNipmsMG/6K/Rx9izbgtA9gr5MdxxO5ETbwg?=
 =?us-ascii?Q?eVHGhlhac8llfot4T81BhzsBYtrbcwIA3owT0JKsUm6QAx3cCBvm6oZaHfVa?=
 =?us-ascii?Q?54GYUmhrOGfpWIqONz/oFloLD7c9UwJgwTmsA/N51iPB/4JXPbEg4XElCXgY?=
 =?us-ascii?Q?fGwXFyY3Ko+Rh0IIIJw8RvgNkuTIJAdK4sT5enT3KHUgI1mFQB+EoiVXXKkY?=
 =?us-ascii?Q?3pJflO+xFR7goqTwCjAf+PFP5RkaasM6A3wkcatCjuUZZ9AznD2bOC/2suo3?=
 =?us-ascii?Q?EUi+xfMNv3ciIlRGCxclNk8yEARKQ7lfP5vyaCJ8sqZZ2WoT+Zhx1+/RpUQS?=
 =?us-ascii?Q?DX8YsZ5meM6ec/PlAKBf/oh62K8prCOmtB9/Y/mZuEWKNPbHkxK+2l2m+yY1?=
 =?us-ascii?Q?x3hxOwhgDbIcseySliyJ+ao/ocN88FSx4aPWIrEeiQrTTQLo5GT4wSZmq0Ut?=
 =?us-ascii?Q?v6cniWsixwjCwfHCnBsXrifvYGJ+bNYnY1VhYVLewW/89rMeBgWkrCDKeiuB?=
 =?us-ascii?Q?COoOf6L1aC/0Gnb54sKAmAIFqSGduaDZWU9tw0AtWBiWJ8Sc9WZjzTUiQBS/?=
 =?us-ascii?Q?AFZ5gjCMPMmwHTXgYq/1XfFUS26v3cxgVb8FBN5F+PM9oI+7uG1V09df87aR?=
 =?us-ascii?Q?wkntJa7uTTtQrwzHW4uO+khTFb0h4eioxi/51CsuSJtQ4o3+/g6GRDXHWEGN?=
 =?us-ascii?Q?I/ubFuLWY8VoQfCauecuoF1mBgpHcoBdNfomD3G00e1UToxjqlAkpjeyEjL6?=
 =?us-ascii?Q?USKwCOISzU5OdY74GFT97M+D8glGB/v+ntCjtsHmfO3mOq5LPs2f+5dUALTT?=
 =?us-ascii?Q?y7Qw73O8gg8F6UiHI0Tl7Tdkz5bdZcfUbxoLUBJquy5MJ6BI+P5965jQiuV4?=
 =?us-ascii?Q?uh0pNv1lbQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: vBnE4yiJzizMddne7c+GzbvMvSobj/CWN0ZJJurY4KPRQP5pkLOVIR+y3wXzLvodjBUROpnGDc8Sb5UZa7Iayjn5k1gd7UpP831k1m/Tw+c5rrAmqKEnx3coIqvMO+TpJS7+oUmBQlw3Qm5FalYmAq1k+gyUMasFgxzv0mesB2mRdXQ98FwpYtAWHfuCTbdzY1ewN+wN/O81xhFNUGHPlEWAMiw/Vp9uQgABa3pWyIwiRU5PXRlGWUx1dXt0GVILNDbCkggJk++STJqW4fnYQax1BPv93MQO9PMyEduL7CW1CQtrhvkY/1SApKk8PT3G6zr4B7GD6bUwNIARkRC2VA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 37feefb5-fc6c-409c-dda4-08df3f4bf052
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 16:59:09.9283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MSMMEvLW1Iu9yP2XsSl0TCavW9+HLYDeVQBkHGEOXPbPE6WIONn7gnuc9Sv1hZfBkIGJWut2VnGHzJrD/0Zg6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6107
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 02:37:02PM +0530, Riana Tauro wrote:
> Remove SIGID logging for all Double-bit ecc memory errors

Please take a look to the commit message of my duplicated attempt:
https://lore.kernel.org/intel-xe/20261109161733.3769906-2-rodrigo.vivi@intel.com/

I believe we could improve this message a bit here.

> 
> No functional changes.

In a way I'd say we do have some functional changes.


> 
> Fixes: 12b427cf8bb0 ("drm/xe/xe_ras: Handle page offline requests for device memory ecc errors")
> Fixes: 6d8ad0217f9d ("drm/xe/xe_ras: Add support to query page offline queue and list")
> Suggested-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ras.c | 57 ++++++++++++++-----------------------
>  1 file changed, 21 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 2c01c183d02b..46e2a40eee95 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -269,32 +269,29 @@ static int send_page_offline_cmd(struct xe_device *xe, u64 page_address,
>  	request.action = action;
>  
>  	if (action == XE_RAS_PAGE_ACTION_OFFLINE)
> -		xe_log_err(xe, DEVICE_MEMORY, 0, "Requesting firmware to offline page 0x%llx\n",
> -			   page_address);
> +		xe_info(xe, "Requesting firmware to offline page 0x%llx\n", page_address);
>  	else
> -		xe_log_err(xe, DEVICE_MEMORY, 0, "Requesting firmware to remove page 0x%llx from queue\n",
> -			   page_address);
> +		xe_info(xe, "Requesting firmware to remove page 0x%llx from queue\n", page_address);

should we use info or dbg here?!

>  
>  	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_PAGE_OFFLINE,
>  				  &request, sizeof(request), &response, sizeof(response));
>  
>  	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>  	if (ret) {
> -		xe_log_err(xe, SYSCTRL, ret, "failed to send page offline command\n");
> +		xe_err(xe, "sysctrl: failed to send page offline command %d\n", ret);

This err is an error pointer and should be handled differently.

But, anyway...
I believe we should only remove the 202 (DEVICE_MEMORY) entries and not the fw
related ones (105 - SYSCTRL).

>  		return ret;
>  	}
>  
>  	if (rlen != sizeof(response)) {
> -		xe_log_err(xe, SYSCTRL, -EINVAL,
> -			   "unexpected page offline response length %zu (expected %zu)\n",
> -			   rlen, sizeof(response));
> +		xe_err(xe, "sysctrl: unexpected page offline response length %zu (expected %zu)\n",
> +		       rlen, sizeof(response));
>  		return -EINVAL;
>  	}
>  
>  	ret = ras_status_to_errno(response.status);
>  	if (ret) {
> -		xe_log_err(xe, SYSCTRL, ret, "page offline command failed with status %u\n",
> -			   response.status);
> +		xe_err(xe, "sysctrl: page offline command failed with status %#x\n",
> +		       response.status);
>  		return ret;
>  	}
>  
> @@ -318,15 +315,14 @@ static int handle_page_offline(struct xe_device *xe, u64 page_address, bool noti
>  	int ret;
>  
>  	if (!IS_ALIGNED(page_address, XE_PAGE_SIZE)) {
> -		xe_log_err(xe, SYSCTRL, -EINVAL, "Unaligned physical page address: 0x%llx\n",
> -			   page_address);
> +		xe_err(xe, "Unaligned physical page address: 0x%llx\n", page_address);
>  		return -EINVAL;
>  	}
>  
>  	/* User policy set to disable page offlining */
>  	if (xe_ras_get_disable_vram_page_offline(xe)) {
>  		action = XE_RAS_PAGE_ACTION_REMOVE;
> -		xe_log_err(xe, DEVICE_MEMORY, -EOPNOTSUPP, "User policy set to disable page offlining\n");
> +		xe_info(xe, "User policy set to disable page offlining\n");
>  		goto notify;
>  	}
>  
> @@ -346,33 +342,24 @@ static int handle_page_offline(struct xe_device *xe, u64 page_address, bool noti
>  	switch (ret) {
>  	case 0:
>  		action = XE_RAS_PAGE_ACTION_REMOVE;
> -		xe_log_err(xe, DEVICE_MEMORY, ret,
> -			   "Poison detected at physical address 0x%llx, page soft-offlined\n",
> -			   page_address);
>  		break;
>  	case -EIO:
> -		xe_log_err(xe, DEVICE_MEMORY, ret,
> -			   "Poison detected at physical address 0x%llx, page belongs to critical BO and cannot be soft-offlined\n",
> -			   page_address);
> +		xe_err(xe, "Physical page address 0x%llx belongs to critical BO and cannot be soft-offlined\n",
> +		       page_address);
>  		return ret;
>  	case -EEXIST:
>  		if (xa_load(&state->offlined_pages, page_address >> XE_PTE_SHIFT))
>  			action = XE_RAS_PAGE_ACTION_REMOVE;
>  		else
>  			action = XE_RAS_PAGE_ACTION_OFFLINE;
> -
> -		xe_log_err(xe, DEVICE_MEMORY, ret,
> -			   "Double-bit ECC error detected at physical address 0x%llx, page soft-offlined\n",
> -			   page_address);
>  		break;
>  	case -ENOMEM:
> -		xe_log_err(xe, DEVICE_MEMORY, ret,
> -			   "Poison detected at physical address 0x%llx, failed to soft-offline\n",
> -			   page_address);
> +		xe_err(xe, "Failed to soft-offline page at physical address 0x%llx\n",
> +		       page_address);
>  		return ret;
>  	default:
> -		xe_log_err(xe, DEVICE_MEMORY, ret, "Failed to handle address fault at physical address 0x%llx\n",
> -			   page_address);
> +		xe_err(xe, "Failed to handle address fault at physical address 0x%llx\n",
> +		       page_address);
>  		return 0;
>  	}
>  
> @@ -433,15 +420,14 @@ static void process_offline_pages(struct xe_device *xe, u32 cmd, void *req, size
>  
>  		ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>  		if (ret) {
> -			xe_log_err(xe, SYSCTRL, ret, "failed to get page offline data, cmd=%#x\n",
> -				   cmd);
> +			xe_err(xe, "sysctrl: failed to get page offline data for cmd %#x, ret %d\n",
> +			       cmd, ret);
>  			return;
>  		}
>  
>  		if (rlen != resp_size) {
> -			xe_log_err(xe, SYSCTRL, -EINVAL,
> -				   "unexpected page offline response length %zu (expected %zu), cmd=%#x\n",
> -				   rlen, resp_size, cmd);
> +			xe_err(xe, "sysctrl: unexpected page offline response length %zu (expected %zu) for cmd %#x\n",
> +			       rlen, resp_size, cmd);
>  			return;
>  		}
>  
> @@ -471,9 +457,8 @@ static void process_offline_pages(struct xe_device *xe, u32 cmd, void *req, size
>  			total_pages = common->total_pages;
>  
>  		if (count > total_pages) {
> -			xe_log_err(xe, SYSCTRL, -EINVAL,
> -				   "Pages returned exceed total pages %u, returned %u, cmd=%#x\n",
> -				   total_pages, count, cmd);
> +			xe_err(xe, "Pages returned exceed total pages %u, returned %u, cmd=%#x\n",
> +			       total_pages, count, cmd);
>  			return;
>  		}
>  	} while (common->additional_data);
> -- 
> 2.47.1
> 
