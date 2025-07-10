Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD62C83F1B
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 17:21:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2775F10E232;
	Thu, 10 Jul 2025 17:21:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SWS+5tuv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABFA610E232
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 17:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752168082; x=1783704082;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=36BcosSsjUuEmYjFXSZbEA4NQ7QOlCDCHIkhLce/QMk=;
 b=SWS+5tuvhULbhDIi/1yXiDwi7Jz9S32fwqNX+60RQ21tHbdVHHmIN0MY
 UUa9kLvb3ydhVsvp+5q/nNGvhszETYUVJintt5uzIfweT8cIf/8G0QQ99
 ieGGyirLOYOQ5dlhacAriFku/BhspBSgFxNY0COa/8Wxhx1qQb0deICnf
 LCEB6+4+NqiNGQGwpsVLZ4QV8r6YQx7MPEJBNfZRKJbSjrDKnyVmy5YQu
 KGf9hmANv3AIVD4NiufDxzgd82RtgID/XguFMYT9EPrJ/f4W1TWyxTI5D
 8Hvb7uoQ3v2LD+iajcIloZ0KSpmRW26m+zbpv2AGVhzAPp8/AWCSGAgzm A==;
X-CSE-ConnectionGUID: VOZnmOzvTo+k3z2pnUKvrQ==
X-CSE-MsgGUID: lGfSgOYRRYmRksN9qiQhKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="77002539"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="77002539"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 10:21:21 -0700
X-CSE-ConnectionGUID: ZsyFLVbURiCq3r5GoAJ0gQ==
X-CSE-MsgGUID: dkNe0xHjSC2LP5E/37wR0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="187135234"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 10:21:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 10:21:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 10:21:20 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.42)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 10:21:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u4pD7ASqV7H+jFqC49K8ddDH0ednDigdJewfAfwaHlt0Lb4Fnqy4EcZ0MZ5FN1omZgjiQ6OmoX4i/xybH/guTfcpCGoqEScSXMXWBp9hbbmEzT2eKrmYPoHof+WkgEkZ8kaYJpdf6pQocakHiPa77R2SFPu38DQmxcV94L1gxxQxd3VJcG6DB5uJiD2aAaR0edHTVnc3nDHx4LIcFdVCBVt+wmQAsvONhluT+geCA6jZrapNiYXnL3+qYWSdVGA+BJlG9ADzZ5ox2YaBW9UbMyYo0nxzRd9/xQn5qf8cBG2wwTQH3qu/erR8oYx3xEa3FR98XsxFvvvQCSesE2hijA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDghcqJvlIi0xYd/kXDsYniUz6WLjLxsNqpbsOKzvXQ=;
 b=nxPw7rOojnKpVfbkIBBZ2uBrcEAAD7qh1JcMzChbkhsr68ym++pCAs60yjBEKs067wJCPiW8RSHisktKGRLTTm/fgs93IW3EAzq8XDBIUWNtxPvpYx4IvzTDTdVHj0RtJAnfM8wiLfpmCJki4JjWJswPQaBVLmqzJaaP2GonWDzTjU1EeJtl5WFycg4OVZZrehVxh+WmVvjHhD71vzVisSn3NptXHcTkQveXYYu10fAYBu4hk3qMMSKcl+z8LhWO1IUajzq+mVmc63uRWIoQGbR2uLisqnIBQd+iFAy+QegsESnawlmpBiQnJ2zAp+vv0unpy8f6vWTq27vMU1Ld8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6673.namprd11.prod.outlook.com (2603:10b6:510:1ab::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Thu, 10 Jul
 2025 17:21:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 17:21:04 +0000
Date: Thu, 10 Jul 2025 10:22:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/migrate: fix copy direction in access_memory
Message-ID: <aG/25+aNyGqoCPXn@lstrano-desk.jf.intel.com>
References: <20250710134128.800756-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250710134128.800756-2-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR04CA0134.namprd04.prod.outlook.com
 (2603:10b6:303:84::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6673:EE_
X-MS-Office365-Filtering-Correlation-Id: 65400e60-223c-49eb-b6a6-08ddbfd625e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/rd7nQjIRTs3lXfyUNMK56S8m70BIPd6nsaQa6GZqBrm2f3LKQWEMepikDLw?=
 =?us-ascii?Q?4UuBQhSL69Q7ea9qbCUgRvF/bvmQ1fpVFDhq3S/bLbja12a1KFIof3XfF/uF?=
 =?us-ascii?Q?mxAkGS9zWJuG19aRMuX9O4enClWxOlcvPftfaRyaHCTr/zi4+gWboHr3s7ZY?=
 =?us-ascii?Q?md4l9X2CdbCeoLxmAfghU/G0U8szdMpDmfpwQKYKcUXjZqPtvri93jW5TcRO?=
 =?us-ascii?Q?R17DsE2WRQlELSiQvV3EmWv3yPSCac0J7HkJ7fNHj2HFY0Sr/2c14PYKPtEK?=
 =?us-ascii?Q?zUZdyfe7n/F/BNCsa85ZREPirPgPMWeNIgoUU4d/fBUwKbUKT/76jepOchTn?=
 =?us-ascii?Q?etfZOO0FgL5nYlITx6V+58rIhlHkt/n7uhG3pdKrnyekvpwox1aGjagbBgin?=
 =?us-ascii?Q?m5/pVHQG8rRykpXUmU29haQlPyx/P2qHs3stKdUUlWgI1+Kvh6m23d2xKitA?=
 =?us-ascii?Q?zC2XfGZtOhEyWGZENQLxh6hJdILJO+c6dDRFhKTAHe4zYBWjKcgM/dcWCjci?=
 =?us-ascii?Q?LvKOI64PGcnKSbVNhYM92ZvvWazpl04PSqrSA68m+qgWPFQnFFjmEM6FzXgy?=
 =?us-ascii?Q?zcnjdVDNPvOJ98dj2ytlnvk3dyrpTmAPapsmCn5vDQrrP71rvQ+t01IsNHn1?=
 =?us-ascii?Q?P/5sUP+Xu3ZeEuZTyUXsg2oxKjWN+V24N10f6xByzi6m9KruMrcVPj+b3T+c?=
 =?us-ascii?Q?9GIJqvBEfoopm5SbNx00RpFP76eR1+zTTqgYXjgwIuaHkzEQchtbN4z8dtxv?=
 =?us-ascii?Q?x7OQhBCd0ey+hCfvhjgVCtNk8zqMttCeHJiioTCZu6KM5Fj9x8NEUJRRSzkm?=
 =?us-ascii?Q?3xfmuFtbYj5gu9GmNgRf6+Wf1D8rMX4fsWHTlH42FVJP4wXmlo9K7idXKNWG?=
 =?us-ascii?Q?wZY0po/Zw4gEnuZMA0cNWp7GgyT0QBTE5ZYlKGJmv3tV9iBiuzw2HflXbAEf?=
 =?us-ascii?Q?yg6XTmlNhD+9TPFeyg8lFg4pv+tC/yEQXTQjdjUWCAqSkQPM0eBvPa9LBs50?=
 =?us-ascii?Q?AmbJlZXqRgI0UvctO/18T98ta61qZq6S6gS3r4E4YYzFA4flFK8PAu45ojpP?=
 =?us-ascii?Q?tSQniu8v/xsPtSF+X1MbJubtJ3C0+aYApaatDmIQKa+n1GIc/ZjEMZeqlBrC?=
 =?us-ascii?Q?cj9+PMIz7hyBSswWjnGw12Kktlm1ZT2dyCgNFDJeK+BUrZoINCLJ0TfrdmzT?=
 =?us-ascii?Q?q239h45V2gSdkFwRsZ4BhIGx8KWdVOnG4qksAcpXXeIU/HnKTxSax/lNpLqE?=
 =?us-ascii?Q?18aLmP/yyYYJMdxa1C+lrRwPIzbQtK087qQnwveKwwT5DZKYtCd6HyqzuYc0?=
 =?us-ascii?Q?/SYGjjeBcqnTbfKsIVoxsuBHUWDFon3QUF4PLvVx9rIu4spA0uopOKFs79Em?=
 =?us-ascii?Q?jB6xdnw+4oVvHkbR4G8bpTq4h+GlzRIZEGfW4JTNn/0M95GixfNLkeVnyDjm?=
 =?us-ascii?Q?1jrIbUGWufo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?47oEo72Agt1e+lwJodoCn3SBweQCEyAp6fkF49SWa6e/hJOEVnTv2ZuPz9cQ?=
 =?us-ascii?Q?uqurEjhTN6Y7i2a37Kfh7690iqvz17i8uc6i2mqNWCHmkQ3yq2XIDAHc9ohr?=
 =?us-ascii?Q?7u8yMY+mnfs8jkkHJzc5laDUN0cWwl1f/RuwaRrH4qyJJbvHuFyj+KyuNIHV?=
 =?us-ascii?Q?TQo0EmUFw70d6LaXx5GWHWuNTUDCjnnxGgoxVUJ0PfYPeexgTjsdZbfye40S?=
 =?us-ascii?Q?uKIGvFfj4pSv7CuZCk+CHmH824PIMBYVJ5CnLRVNZ/njbHuPmhYIdHmvn5Rl?=
 =?us-ascii?Q?TVqirZdpZ0jyb1HsorytsQsfbfrZrzJGUVYKPu0VnUcUzH9li4Mz8K5sV9MI?=
 =?us-ascii?Q?9tKCevS8baESkdHrYRmnATi/WlRN+mkZiYkD0sQ8Zfemd3bw4t9U31fsBBSq?=
 =?us-ascii?Q?al4NCB6ypLUatkyB4ZI/2hZ3SXOOKKBezdpzWMFv4ZHoP1j4nNml+HvKCbTI?=
 =?us-ascii?Q?H1F4/O75TxpTOJ5Ahw2TUOMzSqeYgeWyr5ky4pjd6TfsUhNFXo0cV3g1vITv?=
 =?us-ascii?Q?C1x7A+bINREX4KYFXdrdHeF8l0/4b89KbOXPV/CsSMKbxdwLUZHOtF+DkGS1?=
 =?us-ascii?Q?vfHCCS0O7++uFsKWgDG7xllwMfnxXvouBH1CD/Wv5k0oxLvVjRKwsWOWPA/1?=
 =?us-ascii?Q?JjL07646cnpsjhTqo1u13EUfyDS0bZfNMTRI3ClhRu07O8lclmSazvBgP3a0?=
 =?us-ascii?Q?U665TECxqn3dRiws6GRBjDF7Ug3gIcA89R2GKCvAKT6CEjwS7t5qj+zzNcSe?=
 =?us-ascii?Q?zIGRyBN02sKg+0o8N8MlTMght05KaEHSavTY6HlmFTsr007ngdwp6Nbz/h9G?=
 =?us-ascii?Q?PfiVzY+mcIUcuzwm7m86JFjLSA/Hinq/lAGP6Y/hJa8qOwmmUN0YCocr1fF/?=
 =?us-ascii?Q?bvGe2U0owXsKtSfQFtt4yW/Iq9O2eXPgHfKoCWwlDAFjVDjsO+6qGJM5cTPM?=
 =?us-ascii?Q?V+yx59KITsiZHzdXXWC0GPj5Zu0BOn9wPp88r73hypplM/5phDAXXsflMnBA?=
 =?us-ascii?Q?lX501rXkTYTA1bTVNyq4xeKtrGpPE683uRTJSwE3SSuPBu9rWt/iIf3G/C7U?=
 =?us-ascii?Q?pVwnRubXHiHVZrYUaw6ERj1YQqJAo+v5Wgf9my8yHF/H6pfBbkD+56Fn3+98?=
 =?us-ascii?Q?tV2/R6j5lA+mEpVovzaFpTW2sc6TPsH6jbJa/7RDEzH0fPW+jmvAos8U7r3D?=
 =?us-ascii?Q?2oDU4uU4o9KVuHiERph8tQhfAY8R3AkNs1SLM5KolzgHI8zFXWvY80C5PSjD?=
 =?us-ascii?Q?dvAoAHYfeA8VNqj8CXAqJGeCYJXR64gGMbVqr5ryHMo6EDLCciku0IUNE7Hu?=
 =?us-ascii?Q?V4Kp8u5G38HFcdhJZwUKHVuqxE6/9gviHG4S7lNZ2gKge5d4ed2yI/GDwEP+?=
 =?us-ascii?Q?148+Nn+I+8hFIcir8QHqwsxJb/VqVDuvb8qeTfcKdI2nfJ9O8bEqrag22m0p?=
 =?us-ascii?Q?XI84gtDY3AwWN4gJ1S07BlW7RWKui8hbEvUsu2aTrR2ZANHgOOGfKXfChhx0?=
 =?us-ascii?Q?zeiGXkvJQR6mtddorFYixkEgUypwnXSISB5wCQlmNzT9sMfB6IRJWa44kXEw?=
 =?us-ascii?Q?LfXkc1tS244SGSsZLraf5GcaZJVdPRm6OjLbSpsRvD5z1OzztfcwSrVpY8TU?=
 =?us-ascii?Q?lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65400e60-223c-49eb-b6a6-08ddbfd625e5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 17:21:03.7386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AS1OTc/ikifXtrgwcBp5JE9MrUJXL12kMbSSxgIFQPhHMRY5L86Zu/umG00lOg7NPnwbX7ne8xo5hBLSL6+oHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6673
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

On Thu, Jul 10, 2025 at 02:41:29PM +0100, Matthew Auld wrote:
> After we do the modification on the host side, ensure we write the
> result back to VRAM and not the other way around, otherwise the
> modification will be lost if treated like a read.
> 
> Fixes: 270172f64b11 ("drm/xe: Update xe_ttm_access_memory to use GPU for non-visible access")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 4e2bdf70eb70..2adf95d35c31 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1848,7 +1848,7 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>  				err = xe_migrate_access_memory(m, bo,
>  							       offset & ~XE_CACHELINE_MASK,
>  							       (void *)ptr,
> -							       sizeof(bounce), 0);
> +							       sizeof(bounce), write);
>  				if (err)
>  					return err;
>  			} else {
> -- 
> 2.50.0
> 
