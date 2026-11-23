Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757AC606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 19:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SUE/Vpr5;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=ZBXQCKI4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36FE810E122;
	Mon, 23 Nov 2026 19:14:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77AA910E122
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 19:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795461244; x=1826997244;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GITspUSyVTXAYA/Oy2KJLS5oT09BztA60Wj6UVOa+pI=;
 b=SUE/Vpr5rQ3452dgTlZd+DV6TJSAvH+uH+7C6WNMMXhy+EKCBR8pp8WD
 VW/x4xJsZ0KOm/uNoYuesN6hkQuS5kjQKMOq4w8A++dHqHbP+u+3UQLN0
 xr9ozvKY55WIlrZv0S8YaWXNWjFY9Nf0LiP6DR0KDc170w//OL8MkIMvM
 ORP6kOIVEzxqyOxghTobURlPs1bgc9y7ooA/CNBRmbNC15r2gKMLgfj93
 T45gLXbYrjhJxULKVpoc0sl7/Ph4PuC3Z+hflId3kAT121CBF/vhkkaWZ
 JZjzed6JRoCKtAzH0pId7LkMiXLvPaIUlLQhMWnG1y/z+miwt81tBGC8J g==;
X-CSE-ConnectionGUID: FCKpYrkPQOmoWU60bnBB2Q==
X-CSE-MsgGUID: cPCSHk6ATgubmDeYzHoP9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4180221"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4180221"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 11:14:03 -0800
X-CSE-ConnectionGUID: XniDPt5dTQuf4VG7Qy4y4g==
X-CSE-MsgGUID: sglOfQqlQAyq6ZKYyoUfOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208";a="11720829"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 11:14:03 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 11:14:02 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 11:14:02 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.28) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 11:14:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TuY4OM5VK32mJRUgpkE1hI52H64BU7J3IabYQx1jFQlhd+/r+Upd6beJICWGRoTZ5bVmXv6lFIdNiNS/3LdL4QMtQaCnQ/F+SuaPV5Id4OZRQIC5AwjnVh6eZqTDqXaWOnk8Ck/uCMHjbDYlb5uiUhIIwklikCUx/qPNZ9R+KxhVW0klPkhjufHH292nEX4ksfXZ7BswlSVFiflMm36GkSPft6jemPTdpOIDkjFqEBoOECmyvcCvkJ5YLmVoGd+20rnbR06H6Y8AnFrenr6kxtTHjnduOtQOqk4arBNn4a+BSH3C1ZuELf/KCq2aq7G8EfApI+t7SedSO+czuvIDBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CijXnBoT0YoyUH0WthchjbmMaXlw6Lfp3spEVktQMqk=;
 b=VlSg2N2IfVPETvmPq39EihrW+IJYEQakl8dFcdjUFhwlrlyH7qrc5mVA0XQAyhnxT/Mxq3aDI5W7zQeblheio8kxUWh2FYNSJYUYtUeHB4aJPEj2K/IUrX+DKH1KbJlKyKUQxaAKN26LnRX+aJWvyOfMk6172/n5nGBk4UCDrHuGyIs+Opu0oyKeHm+Tv3OU3v+iHjgYVZ7AS8vNSpVr4q5udRAKRBLg0MGRuUeHccVfgQZzCTiiTwkxnmUSfCaeqSUGoJsmSPaNTagBwawojRJP/q6mv8aspwWzSIi7L+hF+l4HFM81IhDr7Ry7bk6nfRHOj+LCkApofbLJjGbRgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CijXnBoT0YoyUH0WthchjbmMaXlw6Lfp3spEVktQMqk=;
 b=ZBXQCKI4J4MwYSkOhxQ4uDikRyunT8tFIMWsaw/5xtMxbXyUQQqcZ17rRb6pcina3hQ0dlihEtHvSLhZuuPLN6CFovpSsfL7rcdOGx+whM+GdESmpR61WdGsBUzwi7gg/Bwc1e03bypH599oqqI8DGzqT820QdnLVse0yxPvhLw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 PH8PR11MB9770.namprd11.prod.outlook.com (2603:10b6:510:3a4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 19:14:00 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Mon, 23 Nov 2026
 19:13:59 +0000
Date: Mon, 23 Nov 2026 14:13:56 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe/ras: Drop SIGID logging in page offline flow
Message-ID: <awSQdJQLn769_IKh@intel.com>
References: <20261122153015.877434-4-riana.tauro@intel.com>
 <20261122153015.877434-5-riana.tauro@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122153015.877434-5-riana.tauro@intel.com>
X-ClientProxiedBy: SJ0PR13CA0014.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::19) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|PH8PR11MB9770:EE_
X-MS-Office365-Filtering-Correlation-Id: 111798c7-8edc-4be4-8ad9-08df4995edb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|261102123227099003|261026140227099003|261026121527099003|261022105027099003|261028144727099003|261021123027099003|261021121427099003|11063799006|56012099006|10067099003|4143699003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: irGzWsh3292jUjKF8v6BOodM37rlo07WCZyb1h90tO/ddAH7Z1KO62TIFVUcgT3GONJS76eikj5LlVFF4c/vWsBkNn5udjI7zcZ1I23MSjEfix+SJpFlH3kJkzUstrTQcE6yn8XjDtn8TIRXjb/oV+NrbmSvqU2wffYlgK5/0RBS0ezuZvPdPutsFJlYd4JYTP82RXoZ6TvVRD+Cg+8Qhku5qL80siuVfOTLQICjFr7R3RjERQbZatVwxeAjN3XkYe0mOGo7HY+Q8kmKv0wXCPWPbCxkgguyqGlt9zF1zgPI7lEv27sIJ73UMKeOeLUbQwWEcNIK7hQDCemhs3qk8aRuUUciaJLvN3baUlUZqTpK4Ks2n0/mISmI9IsUYBcudsVQ9COB/vJ/g6eBkNVJwFuC/JFd6306bFCt6S7PqKwEwXmkGFOIMNzIp7qdyN8GTgVBitTzjdu4NF3Ek1PvKM5hNsyz8oxHAXzgj6hUbt+QySYKpSGb0/Lf5j8adHT4IbnfcQcn7a59X0yjbZau2sE0M2f57WgJVbrI4tf97/TGjjCa8gJtSEqJEcZYxn4/TOdkuq29qn6gIwnpZ2f+mRThjNV9h6cLsu8oxYrGYLIlf9Qe1c7mI9Q32UOnrk9/hU9VHYvKtW6sSIlZSyi8hZO/278DRxwGX3AORN71g/U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(261102123227099003)(261026140227099003)(261026121527099003)(261022105027099003)(261028144727099003)(261021123027099003)(261021121427099003)(11063799006)(56012099006)(10067099003)(4143699003)(261009223027099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SUP8phRjQec6aAmiJE7Sx5WyOBjc55QeiFEyCsztfw0472dHikaNVR+AkZN1?=
 =?us-ascii?Q?FrZv3nTgtS5xQykP2/BYLEQLMigwUHA/FPcnUG7/x8Cghpe88dOifXVQ8z5n?=
 =?us-ascii?Q?txW2uFrUak3J8GcKv1y187gXU0pGVKbX9r/nmGAftWo6rLoi3CZKs2NsO8yb?=
 =?us-ascii?Q?VX4FoIc+97KyjC3xYDalxCkNA+9K28Tn449jLsa4RAZ4ZeAZXFx9a5Ie1v5j?=
 =?us-ascii?Q?+UViDmfCwRUpgaPE33f87vfnGHbaNAOMp2TFml+Ru6G3haSI4WJlA2Rruttv?=
 =?us-ascii?Q?0g3QZ0DUItKU0fhroCklDg7rjcUZ2uiCUjKZzcE6uMcv4Y5fwsurIdNP/SR5?=
 =?us-ascii?Q?8NvdKaQa+ng10zgqJJWTeujf3EXVxOcYyLFtHCBrvAJd8TwwBtHIQjxOz2mA?=
 =?us-ascii?Q?v3RRKM5aHXv09egFGqXPRKCq5z1kFdWB2BNPUvUYKRqJzvoaeVlVzhAyHkmw?=
 =?us-ascii?Q?hWR11ZPRex+5tDoJ5idQgs7utzn0Qak9/ZhShRF5DC9jz/CZDxQvv/e8z4Vn?=
 =?us-ascii?Q?AM4ykIu3Nr3DDHyZFGWva3GBTnxfIOwmdEc+qn+q5ywfP6gfnh++KnT4hE/H?=
 =?us-ascii?Q?Ljm8Yt1z85s3xeYe+yUI4GAxaub/nYyoUpIMUHUv0IgeWjUdz9MkYcKzm709?=
 =?us-ascii?Q?ZVoAAJjffQYM1b2v/yYhuNvLhwVPmIUT5E6kSNh1ubNz0pUguUfGPxGhRYMI?=
 =?us-ascii?Q?TXkzJSBwqoUKVa9jO2tUB1LvZR59/y7p2+c/BIUb9VFcg0FHP03b7o0LsVhW?=
 =?us-ascii?Q?1o8MOXZUGzj4DllYGzBVbGRs6iB22f7jr1HUWSQGRRXjtSavJw3dcjZ5Q9xl?=
 =?us-ascii?Q?GofAkpGyZQjn9LCzojckKyWY+P9kzgF6+8V5j2Qtx9Vqgw/9+X7NW5a9/HDL?=
 =?us-ascii?Q?lIaTVIKGQw2tnkTiEIVC9vpJ+9X513aik9j74oala5kGvDLqGOS6SEvhkPDR?=
 =?us-ascii?Q?ujdTf4Gyf4cM3Z0jAaaIWXwoJxphfOXlLApBwG+pxX6bLoO7AfCD3P2UnrQg?=
 =?us-ascii?Q?w0RBwHMkJLOqig+4HBISGna8H6e/iUrzXvaummgGuhKsNZH0vX+Bs6V0Nbx5?=
 =?us-ascii?Q?ySBD2FU/9IvIsfKBaDxtXLYebwbe3rNQu54Qp58VHJ28/WeJE+3QqcfROXvy?=
 =?us-ascii?Q?jVFLPHVe98lQaH4+epEkR/5TpBL+1SJWxK3JlCgnHNqQbm41nPew9oIElQQp?=
 =?us-ascii?Q?b9cRy5TTSADuezSj9eJis5m3/Wa9pnWq15QnM58r6gS6Tj9LrrRM17R2o9yV?=
 =?us-ascii?Q?dmhl3KbvD/NltgFMizj3ZfNbAnX45VIs6pPJ9tuJO8XHRnJvSHnCnM+xt+mv?=
 =?us-ascii?Q?TQuHNg8HPbeRu0M2LLQxRnr4WkfNGF8Ha7wQET+sRh21Ks3F5d0rPFo9i4q3?=
 =?us-ascii?Q?QTxE7/b7ABgd5pVgkyaG+USb+uDJU8b+kXO7U/2dmDhz22LaFWaMpfS4pipe?=
 =?us-ascii?Q?v4A1B08RY/vwrVKg3QfohCTi9oqOfKY6oxM3VHiV+SVSo6T+5t0YLGftICmj?=
 =?us-ascii?Q?zb11FwldL43W0mar9AABKwixDk85/Q+ak4HLzxnM34usYqoSGjCcKq83ivOZ?=
 =?us-ascii?Q?KaoJevt1SzyvrhdgccSJ8L7LJ2OU/TWvd9Lg6RF5i2jvKlYvl34uDl2cUzdt?=
 =?us-ascii?Q?DdP2AY56tohtUOX+KCTq9YsT2k4HgfKNp0m44QiZQD0FToE3pP2b5MBToNmE?=
 =?us-ascii?Q?gQBsQ6f8JGw8IsJqjhKZPdw2kBkzg39at2x4vjQnTwcLz6jBLPjzYZ4bVyvh?=
 =?us-ascii?Q?HnVa0WaVvg=3D=3D?=
X-Exchange-RoutingPolicyChecked: jN9LEgukKs8j+KJrpb62DmuDSm/+ujmXrTYVgHxm9BwGyN0vQX1YVNNogPOJ7e21RjNmPAQhazWOVatpKo4cX/af/oWx0cwZU5IJqJEm+31uQBquWsu/v5JA7PlJKp7cezF6r58ajsP0hqb1e5F6VTq93/dM2mgo6wl5jueaBcc6vWqtwrRKm32zNHs6QHuFdOhgOakrIOAL0V1gxEAVeTHhnHP+dcmzfe6DBiQM+o0DgtQE/pC59Qu7i+w3aih5ocSY15DARKFdHoINiDuAMYBmdeCMrEw85TQMKi5hcKpb2bcB3O/0dnhQsLH5DGscx9xhXORrKhVqJZjeANRGoQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 111798c7-8edc-4be4-8ad9-08df4995edb1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 19:13:59.9061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y8zeajGogO512gO5NpnEdMoVrOEK72NGczkOUb5DVTLBNa1Pgxylk5zsfxkP9AiYShCda2UBseX4sLwvAZXk8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9770
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

On Sun, Nov 22, 2026 at 09:00:17PM +0530, Riana Tauro wrote:
> The page offline flow reports multiple SIGIDs for a single error,
> generating multiple CPERs. Drop the repeated SIGID logging and replace with
> xe_err or xe_dbg.
> 
> Fixes: 12b427cf8bb0 ("drm/xe/xe_ras: Handle page offline requests for device memory ecc errors")
> Suggested-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: split patches
>     add more detailed commit message
>     remove non-functional changes from commit
>     convert some logs to xe_dbg (Rodrigo)

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_ras.c | 42 ++++++++++++-------------------------
>  1 file changed, 13 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 0fb891d00b36..07c048149da6 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -272,13 +272,6 @@ static int send_page_offline_cmd(struct xe_device *xe, u64 page_address,
>  	request.page_address = page_address;
>  	request.action = action;
>  
> -	if (action == XE_RAS_PAGE_ACTION_OFFLINE)
> -		xe_log_err(xe, DEVICE_MEMORY, 0, "Requesting firmware to offline page 0x%llx\n",
> -			   page_address);
> -	else
> -		xe_log_err(xe, DEVICE_MEMORY, 0, "Requesting firmware to remove page 0x%llx from queue\n",
> -			   page_address);
> -
>  	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_PAGE_OFFLINE,
>  				  &request, sizeof(request), &response, sizeof(response));
>  
> @@ -303,12 +296,15 @@ static int send_page_offline_cmd(struct xe_device *xe, u64 page_address,
>  	}
>  
>  	if (action == XE_RAS_PAGE_ACTION_OFFLINE) {
> +		xe_info(xe, "[RAS]: Page address 0x%llx offlined\n", page_address);
>  		ret = xa_err(xa_store(&state->offlined_pages,
>  				      page_address >> XE_PTE_SHIFT,
>  				      XE_RAS_PAGE_OFFLINED, GFP_KERNEL));
>  		if (ret)
> -			xe_err(xe, "Failed to store offlined page 0x%llx: %d\n", page_address,
> -			       ret);
> +			xe_err(xe, "[RAS]: Failed to store offlined page 0x%llx: %d\n",
> +			       page_address, ret);
> +	} else {
> +		xe_info(xe, "[RAS]: Page address 0x%llx removed from queue\n", page_address);
>  	}
>  
>  	return 0;
> @@ -322,15 +318,14 @@ static int handle_page_offline(struct xe_device *xe, u64 page_address, bool noti
>  	int ret;
>  
>  	if (!IS_ALIGNED(page_address, XE_PAGE_SIZE)) {
> -		xe_log_err(xe, SYSCTRL, -EINVAL, "Unaligned physical page address: 0x%llx\n",
> -			   page_address);
> +		xe_err(xe, "[RAS]: Unaligned page address: 0x%llx\n", page_address);
>  		return -EINVAL;
>  	}
>  
>  	/* User policy set to disable page offlining */
>  	if (xe_ras_get_disable_vram_page_offline(xe)) {
>  		action = XE_RAS_PAGE_ACTION_REMOVE;
> -		xe_log_err(xe, DEVICE_MEMORY, -EOPNOTSUPP, "User policy set to disable page offlining\n");
> +		xe_dbg(xe, "[RAS]: User policy set to disable page offlining\n");
>  		goto notify;
>  	}
>  
> @@ -350,34 +345,23 @@ static int handle_page_offline(struct xe_device *xe, u64 page_address, bool noti
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
> +		xe_err(xe, "[RAS]: Page address 0x%llx belongs to critical BO\n", page_address);
>  		return ret;
>  	case -EEXIST:
> +		xe_dbg(xe, "[RAS]: Repeated error on already soft-offlined page address 0x%llx\n",
> +		       page_address);
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
> -		return ret;
>  	default:
> -		xe_log_err(xe, DEVICE_MEMORY, ret, "Failed to handle address fault at physical address 0x%llx\n",
> -			   page_address);
> -		return 0;
> +		xe_err(xe, "[RAS]: Failed to offline page address 0x%llx: %d\n", page_address, ret);
> +		/* Only allocation failure is propagated, other errors are not actionable */
> +		return ret == -ENOMEM ? ret : 0;
>  	}
>  
>   notify:
> -- 
> 2.47.1
> 
