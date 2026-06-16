Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86BECD98D2
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 03:59:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90CF410E56A;
	Tue, 16 Jun 2026 03:59:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VxUIJOZA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C4910E56A
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jun 2026 03:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781582357; x=1813118357;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qr/6Liqjm2ElL2veceP4EWVirB2RJcPY4w3V+S32zxs=;
 b=VxUIJOZAFYNpbdLhwDOHYC8R6wl4MMIcdrunxx5xqlnHyvPI1HgAktVr
 aCxlI4zWIj7DPx6lXel9LdGzxOx4WFKDH3fy4Xh2lgFbjOkuTxI/edL1r
 xJhq6i5+MQR5FtXdgkJ3XKI2fZjVP21pXy5r692Q/0y/apW74qToI096W
 r3BaXPRxIgfnMsWsKXKa7/Wc9XobQejvN9JPGhbDasBPiDBaHYA7HWqOE
 a1NmtJaDM+2BJD7Li/IdOv5bQW+4zJbNpj9SXn7+zRypkVvwj4hk7xvqG
 XNVgVU15wndcGV2CGUJ+SLP7L6c3/E76pCraK+GUQaC0amyUuJMS3nvjt w==;
X-CSE-ConnectionGUID: uJOyRBzdRwKsle5y37nIww==
X-CSE-MsgGUID: FWnH7T8/QhakLBiZna1TtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82079166"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="82079166"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 20:59:16 -0700
X-CSE-ConnectionGUID: 3xk3+sh5Rg2A9CYjZS4PxQ==
X-CSE-MsgGUID: 1tYHwepBQxy38qBPzL5xrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="285767853"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 20:59:15 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 20:59:14 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 15 Jun 2026 20:59:14 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 20:59:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F/V1Twf1BiXOGRHrTeCjtoWT8ygE5EYlA580e3go27TBR6awfQB7Xi2gvsChX2KOxLgv0qZHYKh24pC9jP8heIg6IytZzSWSLDNmxR6wSvQ0RCl69jx1ldn7Z5a+yPY91KD9/nTYWMxGvEUBxaZlspnLPpkuHH8YvjcRKUs97rbr+m4ni7DjsWUrYy0NVGbT39e4KQwu0Jj/TlIrUzBDus0lORDwqvYSdxmAOPyiUNCP3vSvFn1AT3MU/Cn1aLcaCaO8mkmfzsLlM2EineBY94ky1Fe861xU5wGHlx2kf65d4qmQaAUUSBTCf9fnQM5hDSPaTpZ/P53CbEl67nol6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JvAT1ZGop6gw3xbDBEYLoi3QPHwVDmZ7yhDwD3sd8Ss=;
 b=lUVLDYQF+aHL1fk2zZ3kgfsqI7+i6AcybS7u4+lNyIZcPVeHycvvSkxyQPv2/vwKYUswjtoDG1BuMtq4k18C9HneNJOGgAgBQIpFapoZya+gqYdn9s5QsMqf7ttbowsFql1XaDBJ4YUpLdJpkfB8+x0/+NnDw2JIVorZOlv/xMtM2YoOQCgTotqc3doRonR6BOlHpqvSWjkUUbixDVvqhb8YuvwEX/9wr5v8w4B+DYbDhlJAtL6T4E+h4e8jnoXL4HN6uPiVTkYMDopy78DA9uinzeWHLdE1qegXiyT7T6HaqdfbZcEhzfF45RsXQg1eQcYS3lLv7cFzns8CErHs3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by DM3PPF10DD61CAD.namprd11.prod.outlook.com (2603:10b6:f:fc00::f08)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 03:59:11 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 03:59:11 +0000
Date: Mon, 15 Jun 2026 20:59:08 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <daniele.ceraolospurio@intel.com>,
 <matthew.brost@intel.com>, <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Downgrade Memory CAT error message
Message-ID: <ajDKDEGVHM1UACCB@nvishwa1-desk>
References: <20260615202757.607703-1-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260615202757.607703-1-jonathan.cavitt@intel.com>
X-ClientProxiedBy: SJ0PR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::19) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|DM3PPF10DD61CAD:EE_
X-MS-Office365-Filtering-Correlation-Id: 7559965b-7775-457e-28e6-08decb5b9f68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: Rvl9ti6G7fSGKBF+RgkO9dQh9IabryajZKDXQMMlOBhgMSFJ8hMhq5fX3UvvK6lkbw3xmTsjaC2RyiRWAUMvD7Lafz1W5XzfP8tUSFFunlciFmpn0VQNmN17lWXr9P6ZMmFf5fgnMZ5zv9u9DkA0b1NYeVD4zeMijZZNUKdDFJRyXFHpqLNec7QHmYHJJmXQrSwVbsXeX2E4czHWubxYGn6X51TuJrBjcFlFHcjR5ksJPZXMLyJAtde5xe7AlmkmxLv8KmNJqAT5F7QA0Gb7z5cOPk5eIjUD9OXjBntYMlOJfWQQRtLBcaTpD/U7LZuTIg0p3UP0CfC4t4Fk3g3GUV0d5KJ4szIcy1El/yTIupsianPEPvfMtMab2c/XBchttsE9vUL7ktp9Hk6OCpbB6/gDY8HlyZu8AEA3NNQZbTsX23NFjRLPBtd5ScJifdwqXXs5YXaa7nOadMWJawX591myZDG17JWIAx7x5qVcUJ7osFr7KOiPOI502OUbrxBaFC/gXuMgj5Xb23bNV05+tbXpbRkTDdp/CisKG9iEwfwFEPY2xlsDyCZ8tu+W3/Iw9CVXYGwcQu2R4NLJZYtMm8r+z8WPTXB/EZWB/kRgKxgQVpJ4SZh2q4YuQyfzjhpQzSzikzkULCnYEoaW1s0y8z1kVpK2N3egys5SR8SrbRNslM3a3/lxboyc5GvHqVCJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vqPgBrltrZqO/6+hNoUf0gPQqZNmGFk0Ln1xVRkSRpIXJfwXvd5bCWCLPhTk?=
 =?us-ascii?Q?6o/qsfIQTe/Cjf4iYtVKBgeD3YdGkQe6OET8Dl7zrCsjk2Aj1djZELlS5KGd?=
 =?us-ascii?Q?40S80j6FzvgHJJlb/jHTbKPJoVkqOyWE7A76lkQ0w8eGWAXm6hKxfJg3AFaD?=
 =?us-ascii?Q?xA3JRmvjpFaj1cYrWW3D8fCqHEOfybA3PTAh3j1+vL0kV/7k11siGGAvEATO?=
 =?us-ascii?Q?hyzx/CCbm0+/PW79Usv/3eiZzBcE1N6Tik/TNKEWCa6TAViJ664oMHg0IoLz?=
 =?us-ascii?Q?02El4tfch3XVUKcZ0aDySjODai1zBPd//Y8FXnPUo5yN61+s+AImdYsEGnps?=
 =?us-ascii?Q?ZwJ9mBf35F8aU/V3feVNjvVU9nXMwx+hrsvdjleGOdcxgCztHmhjzR2XX+n8?=
 =?us-ascii?Q?yA5LVz8b4JSmXsAveZM9EbbhwUaBnUMk82vqJNtzUbypo4BTOxvXBQBh/uX1?=
 =?us-ascii?Q?AF9sNp7nPEtzkWHbikrTS+Sca9xCWjnaVfnEkMgBr96pWqg5USVBAW4qDm8O?=
 =?us-ascii?Q?dQ+BgnLT36qWTN91ueZ+6ekBjp8J4EWkWafCyjUzM3o0bITpzHsS1vj6rkbH?=
 =?us-ascii?Q?KY1+vfMPs8lfKt/2MBWjoXpKs5t6Be9Wl3XJsjl9VXJAFEc+aiUEc2qHyhej?=
 =?us-ascii?Q?+naL1jf2wDlvZMu5L6X8iwuBKUGFaDK6U2zvChBgbMA5YT/o3UnWY1+04Zi2?=
 =?us-ascii?Q?G4S6+Euq0sTjP6aNAJWjMQLLPyFTbXmBJh9a2NqcumllzcVDw/vaePQCNYdT?=
 =?us-ascii?Q?SLOuhQS5BYdnYpGuOy2MYK4FagKSbTgDPKD2PRPkFE7+xCguXbmfINC2qv2g?=
 =?us-ascii?Q?/A8qYQkrSWiL7DUNf8chQlu3PMtcKNhFs2azyd5/s1eawEBoHUSwnG/ABXYV?=
 =?us-ascii?Q?8xcyM5DimaW/Ysd6mivBQaZkC9tKq6qIEs2lZAiEsDNUQGADUTNWG8QLca/j?=
 =?us-ascii?Q?2ooqR8bbJL+09P7fLbUeIF3OHMlP4+HaDTPCJDgcn+3tpqUTHCejf9ruCX7h?=
 =?us-ascii?Q?ZHfyD+z5JW9Pfw6KyoxDiOBUCQ4t5G4NrsrEniJYo87VqQwH8ZazX2XF35/b?=
 =?us-ascii?Q?JvKV1kYns8WEfEfYd0H5cs+FQ6WUPzBXTgv9EfoHQ3+IyQQcWQBxr09ipkHn?=
 =?us-ascii?Q?YmovwMEX9usjuHxyGGdVTg9Tfo3vJhukgkC/CzM6qtQNBSROS+Y4GU4PdSms?=
 =?us-ascii?Q?si6mpPDummW86YMeMZ4QCKDhRwPirjLWrc4EY4ePbGAbQQlgdidn0cpaKHFG?=
 =?us-ascii?Q?wQYKfND0aOrBZmFAZSmopCI1YNUm6KVQDwZM6WD+1oUbYxPhXDhoO8yfHpeH?=
 =?us-ascii?Q?FaMg2Qd4/T2o7za7ZDX+/pLc5HIc1sqXa/4+31Deo0U86A44UvZizSp4XWQ3?=
 =?us-ascii?Q?yF1i1wG901jWalIHF2CnO9fRFnQPXFxe14WKU9xUAYilShBjuQ7x6E1ylsJG?=
 =?us-ascii?Q?6RayELHfxJ5q16Z3iLUX92xIZ0G0T0lZna8kIbqIav+ggjfivjoY8iU4QWLZ?=
 =?us-ascii?Q?KhORbg1YvWxn9CvBc8W1eYTpcnu2OVd43mIQp5EhjKjBUVqnh/xjNBy85a1Y?=
 =?us-ascii?Q?q950NkUxRlp2yrZhdhg1loY3IlXKsvr8bcbMhaFsrDktusRV9p0KLBPyJP8y?=
 =?us-ascii?Q?03gQyXcz4sgDjjVsX006LXkF9efoc+0CbtDBJs/xXMg664CjumNopQgomw/x?=
 =?us-ascii?Q?rpThlxASf1ZySwN0m1+BKi4rl5W+1h85IjAmZvJq7ovVIQyTakUez1geE61d?=
 =?us-ascii?Q?LoDrXUGa5bj9fzGnrhYo+VHbMZpK/2VZ9pgFNVvClBG40o3K1BuJ?=
X-Exchange-RoutingPolicyChecked: ry7M4dBOd/pN4sB9A8R/qVrQCvqmwJiqn3GQKbmyQvVqAWN9hCvZsMtZDqHXbCPuZzYHMmK6xyIRqVQUFGT0/2g/vq1dzNeyaYgHLUCemqUsEVz2ssE/N4fPM73iDa5/6XL/z62HbFoDFCMFDPJp9Pu547ApukXBrsfzTLMhD/anVOy24sRRlRXAFuA8jgseOYcO2l2Kp5FyIMR9svr7FLXMS/4k9+W/+f2/71M2HmjNTO8bS0SHvFT6tyh8jtLshzPEOkG12MDYh8ao9mxUN4cAXWf5jk9oUq7Yw5v0Dp3wSImDy7N2MB2jxi7RSPz5W77CpCe2ENXDHeEMKnUrYg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7559965b-7775-457e-28e6-08decb5b9f68
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 03:59:11.1680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: COkg19lsJ9rOa1GhWnzWerdrs0WBZLVrypAPGCK+rdGH0cOLZVW6tUaVA2BuyOdVvU0a+0QMwEtr8vR7TE81ST5RtueGMnCmgalpOtZ2dG4NSg+4dfPtQ17DjNhLT+qP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF10DD61CAD
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

On Tue, Jun 16, 2026 at 04:27:57AM +0800, Jonathan Cavitt wrote:
>Memory CAT errors aren't any more serious than the other kinds of CAT
>errors the xe_guc_exec_queue_memory_cat_error_handler function can
>report, yet they are logged at error level while all other reports are
>logged at info level.  Downgrade the report from xe_gt_err_ratelimited
>to xe_gt_info, bringing it in line with the other reports.
>
>Suggested-by: Matthew Brost <matthew.brost@intel.com>
>Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index cfbfb8d40708e..a81ea3e3cc73e 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -3166,7 +3166,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
> 		 * GuC uses GUC_ID_UNKNOWN if it can not map the CAT fault to any PF/VF
> 		 * context. In such case only PF will be notified about that fault.
> 		 */
>-		xe_gt_err_ratelimited(gt, "Memory CAT error reported by GuC!\n");
>+		xe_gt_info(gt, "Memory CAT error reported by GuC!\n");

Looks reasonable to me.

But wondering, as this is reported only during xe_file_close(), maybe in
xe_file_close() synchronize for cleanup before releasing exec queue ref?

Other option would have been to detect xe_file_close() scenario here somehow and use
'info' level only for that. But as the guc_id is GUC_ID_UNKNOWN here, looks like there
is no way to map it to which 'xef' triggered this CAT error.

Niranjana

> 		return 0;
> 	}
>
>-- 
>2.53.0
>
