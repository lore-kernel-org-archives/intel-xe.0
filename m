Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F16C44501
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 23:23:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A9710E086;
	Tue, 14 Jul 2026 23:23:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cIm3QXTa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DB510E086
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 23:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784071392; x=1815607392;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YFZzlBeawMKKr2GTIHfHTrZsO3hsRAl/IKXcPz8AiSk=;
 b=cIm3QXTapP91zl+bdQGdnqE2HeaBSKeVnL5PhdMNB84dqKJZ5VOIqQ5i
 UakEJ70fgI3VOyao8oCJvtxcA2LfksGfZd5ClbfPiHb2cJXSDGDOmYJvs
 fqunEExUv+cWb/C6iexmSOOZ1Bb3PDgC0HMcKCsl1ELoV5uDKIMeo/f8Y
 CRqruHNR+ObCHu+7m9W4YTdC0mD3Iz92eIIBXVKRstNBazxjmECRvqT5Y
 Vzx5pZRtRx90JVZ+ijbkR4PbmSp5R6IWz6N2aQ/2BFNzG76ONupyNMWYD
 QqAM0/QPVifLEw483TXgET9ioJICvfkE+CXiRDV9mePwVol8HzVImDJ/j w==;
X-CSE-ConnectionGUID: 3qp45nKlQqqPzzIFLYOTdw==
X-CSE-MsgGUID: eeRWbQ45SeyI1VTlULNilw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84483772"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="84483772"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 16:23:12 -0700
X-CSE-ConnectionGUID: D4ERTFaFQA6L8Xp+PiE4XA==
X-CSE-MsgGUID: rQH4v5w7QvKGzqg71tZVPg==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 16:23:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 16:23:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 14 Jul 2026 16:23:11 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.25) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 16:23:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PQSBpdKu0VN3XFVoqW7TTpmleAObigUJB8BcpJmSoPZTbzNHztIV4Vbdq+5n1xjOAWGdins4feuRav91aVIHKTDl+HEb5eQdh8GUyx9z0MnDBgj7xm0uJrdiFgkmimNGaAK8jMjyqDCHmbkF6s7US1TAf6FDReS10Lbly5LoXd286EpyaX02hExYNIo5B9wURcglXCLDEG+kBlBDdK8ZkLF1X37nuZVjOReMl6B6rbup+WEp4oPNykaqITK1ojDDuxJtheLhbm3CNL+NuWeAQzglKaq4X9TxLbz6f8dSNpYgIzY1hdUJZcFpiDoxY67KfvdHSGUAX6nHrLj6aZvmlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VjJ4j0FXoLY6pCXOtkG8ekw7pIMbjOtblBwQvl0MGjc=;
 b=kqbJ2ZyqmCMpCM8vQ+UBYP4Ay3q7mMXtfiTXh0wtGeyRJ1ZQA3hCe9FDPozw7h6KarSNR3JYRjwqh/QSEJhYJ8gfFElJYWJQZ0wEKBnko0DVVbySawkn91pxmmxROuWIPdXWbnWiGyPNZO67RRPmCkzCVL2FQjVpsGz+CCBUkKG5kGe5POKjJJI332i/KqwqC0MTGHyUB0CbrTmJYXQzLZdhwoM3P5WRdu9R/PYpGNb9+g+mWf7FvQP0qx/TWrjz06yu7cmN9/LRB5hP/bued3ePK6QOGjxJRmvbHK9MGIMCEMvkRpTUezaODfbZTn/IHPdr0XL6q2hz2fkiQQocmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by CY2PR11MB921967.namprd11.prod.outlook.com (2603:10b6:930:118::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 23:23:08 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%2]) with mapi id 15.21.0202.018; Tue, 14 Jul 2026
 23:23:08 +0000
Message-ID: <39aab72f-e933-46d3-950d-f7575a7be156@intel.com>
Date: Tue, 14 Jul 2026 16:23:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] drm/xe/xe_late_bind_fw: Add support to load Ocode
 firmware
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <michael.j.ruhl@intel.com>
References: <20260709143926.3980581-5-badal.nilawar@intel.com>
 <20260709143926.3980581-6-badal.nilawar@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260709143926.3980581-6-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR21CA0007.namprd21.prod.outlook.com
 (2603:10b6:a03:114::17) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|CY2PR11MB921967:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dc0b557-bf4b-48ae-249e-08dee1fedd21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: yl2Q41M63a6h88hylxtN7KGUf+Ou7h/R1ZRmGNW76dpCcFl3G/5lCDr3M425Wwi88F+Aaqmfj5to6JINj5UgvAa/CB4Y1gdGNGvoQqIWvasFeLTow/R6xyJnArIWGnLmsI8l2tP2k8v60emUwRSxplTk+oXhVOwqAbXKU4qhARm3yvZr1G/uTv1St1Z5ebyMQwSf5NrSgolvA1F2AgxlIp4qBGrYzUBjjPEjGD+6wenpehn9nL/jbz0D29gqCPzRs7limXjv82Rmt/D/sTh0iBoXYQmS+JWOnYE5AIpacajyNlxjt4OpVPukcYYUOD0bXd1Q/QNYCSnfVEg/JIM23CA87dFSq4MVQ/UeiL+O50jg6869cqHFtDmby1981UbaWOv5vsdLz0pxbNtyB5QyCjB6DP+2QKV9EuWqV93oH4UOGipVZ+eHQv326dfG9/cpL4YBrVL2DXL/Ent4dgjLs/7nwPGfKIWdh3OXxr9Z1oSMu5/rtDuxzVXCURrAzPvuARG+IjP+Tus7P6zPUWCjj8N1jHykonrIiHqpltqU448yG61sWP4BMfRLyETs4OdGPJjglwewNWDIx32bzUazXqfVWRL+x+hRNsZeHd45Nf3OVoIXmm17cSjPSSIq41jJBccI5s9TG+wHTHmKu6vewnfGf+uU+r9XKALyIMZwd6s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHp2RGt6VVRXMFUvR09TSXoxRnpwUXJHNVFZWGM3c2JBM21LU2t0K1NRS0p1?=
 =?utf-8?B?K25najVNUjg1dG5ITTg5R0hhVUgzM042OVB4WGo5UU1scEVJVytiaGxEcFJD?=
 =?utf-8?B?S3Bjb1ZDenkreURKT3FCWmx0RlF3cWtQN0tocjN6NHMvVW1FeWFBOGY1WDFE?=
 =?utf-8?B?dlkwQ1VlYjNOd2hFTFlJRkhyVVQ4L29hNFMwMmtESkNBSDBQU3B3Z1E1cVVX?=
 =?utf-8?B?RWNqMkVPNmZYVGdXTXl5R2dTeFN2NWxRaVM2SGVNaFhMZHUwUFFhMW9waHcr?=
 =?utf-8?B?dGJmSzRpUmw0b2hRRlNUQll2UjdNMFVUWWNHWVlMR2ovTEF2Mnk0QUVnOVVl?=
 =?utf-8?B?UVpBckVMWFFHallodUNCRHIySzRrbFp6TmZ4a1JCOFJDVGtmMkh0MXhSS2Ra?=
 =?utf-8?B?bXBWLzBjS0NyTzZOZk9FZWRpcXJsNDg0YjFyQWFYNWZ6K09TNEs0OHo4eFV0?=
 =?utf-8?B?NVRrUHBIZmt0QzB5cWFYbzhCUG5mY2o5bXV0eW9veU1jbHZhWW5aMDFlMmVS?=
 =?utf-8?B?cXhDbDA5Ym90L29HTGVRY0RHak80MFpIdzF4Ylk0bTNxVFNFY1hDQ21XVHRw?=
 =?utf-8?B?N0JPc0Y2bXFuRVNXS2NJUUZEK3ZicHh6OFp6UkFzUFVaazBOWkRBeVJoZmtL?=
 =?utf-8?B?RlFyTlhJbXROdVdOYVpLdFgrcjhnNG1lT25lTmNDbk45dGpnNkdjdkJmWW9m?=
 =?utf-8?B?STlSMUVqbjgwOGVOaDNVUGxrL00yK2lTeXBqbjhxdy80WDhVcWcyS2FwSmxI?=
 =?utf-8?B?R1ZxMkhJUzdMTVZXV0JuTmFxNnV5RUpTUHZOdDdERXloNFJQM0wwcm42QjNF?=
 =?utf-8?B?QXlDSHFqZnI1bjlBRmlpVDJRSnptT0QzbUNVOXRqcTJxdmF2VWp6UUl3Wml5?=
 =?utf-8?B?cUFMUTVaMlZwMXlQZVJLRVcvbTZNQWpic1VzUGxTK2dtSzU3R0ZTeVo1aUZK?=
 =?utf-8?B?U3ZKZnJXdGVVd1lNaU9KOG5TZlV2aUMwY3h3czhCQkJJd1M2SHBMNXNrTFVL?=
 =?utf-8?B?QmRHR0Iwc1FZU0Z5Z09CaTZCQWFvZEJSZjQ4d2FqcHQrV0RibndBbzB5aUpz?=
 =?utf-8?B?S0RUK2F2bXp2MTZGcFZpNyttNVZDWnd0dVdvRWdwbUQ1bTB2WHl1ajNXMHdQ?=
 =?utf-8?B?bkRFbytsQlRKMlpWZEp4cGpVNUpsU2FkWWszNm9tZGt0c2tKZSt2NEdVYUY4?=
 =?utf-8?B?UUdMbTNNVUNHbVNPd0pRZE9IU0tVdXZ0Z01JdW93Nk9DMElMSzFhcUFPRjVM?=
 =?utf-8?B?NVcvSWRjZ0FCMlJOSkorZDZzd3owQTVSRUU2UGJxcU5FZk1CN04ybk5IOEZp?=
 =?utf-8?B?TmVFd1dWSFNjKzRrUk42VGkvdEtjeG8vV2N5aVgvYkxoUlF4UUJLWjJKN25D?=
 =?utf-8?B?V3NsU24wamR0OEV2bGVaZGNOUmw1ZlppcHI1UCtxZWFJS0Z3U2lWbUFyM1R6?=
 =?utf-8?B?WmU1dDhnQ0NnQ2N0UTlUU24xYlZFNUJUaERqZDl5S3daUWZveVVobEJGbmw1?=
 =?utf-8?B?RHF1ZnZNZ2NySWxsbFo0dUlWY09JMWtiNW5UQkIyYzBMWGk0dEZ6NWV4bktK?=
 =?utf-8?B?NXM0SVdjbGJBKzZkeUxRcUFDaEJCTlhzTnl4VkJpRHJxNm9GWmh0YjF3ZmhV?=
 =?utf-8?B?cG5yV1NURm1pYlV1SFJMOUJ3a0phUTF3bm1NbGtYb2lDcXlhclRUbS9hdmly?=
 =?utf-8?B?dTg3Uzc2c0RYZTFEUElhTnlOYTR4blh2U015MU1LTVRjNndKcnZINUk5b2ZV?=
 =?utf-8?B?elRERzZKcklrbzA1ZnZuVDhiV3N2d3F1Q0FYRlhaUlpJTG93K1ZzOWU4ZWJX?=
 =?utf-8?B?VjFtem1pWHAxcG1ub1gxUmkyN0NHRGFBTjdwOVYvd0QyUlFZOTI0NE9aaEhq?=
 =?utf-8?B?T0xramJDaVd5L0J6Tno4V3FDc3BiNmJST0lXWTdKTkJ2UjRxZ1JFUWc5L2ZK?=
 =?utf-8?B?a3hOcks2eFNSblJMN2E3U3JrUEc0SnE5WHlINHZsR2o3MlVDSEw2ZHJtY2hZ?=
 =?utf-8?B?NHBGV0cyS0tVakZ2Nk9yNVl5bUx0aUo5dEFPT2VnYVN5ZjdQN2NNMXNMdlhW?=
 =?utf-8?B?eEJUNjNqRjYxWjNoeXVISmlaQ1F3OFZLS2VOenFpeTEyU0kzNDhuTm5YUGdr?=
 =?utf-8?B?ajN4K29IVVJkQkRESENIaWNvQ2Vnb21IM3NocmZaR0RVa2puNUF6MlhBcGxp?=
 =?utf-8?B?Q2xkck1lZlVycXBqMVB1eHhjeS8xeW9XdTFIZ0xuT2Jydk0wUW9KZlk2UUhs?=
 =?utf-8?B?N2I4cjZrTkRkSlVBM2MyWmkyOUZiMGdtS1RHNWZ0TlpKcHZMM0JwT1BUUkJH?=
 =?utf-8?B?Q0puM1paWlhrK0x2UnU5Y0hrdndCaFd1VFdxVEJPemVJbXQ1MGEvV2UyZkQv?=
 =?utf-8?Q?Ffms9cDJI5O+ziW0=3D?=
X-Exchange-RoutingPolicyChecked: ceFlf/uKDKZl0oym0+ut/lJOstP/XPYrMVQc83X5kRLQrao7t8ZfLUBJ2bRqCLsmS1FGWZ+msum5EssqYSjv0i94/BqLlkmF/aPEhjUdA5P93z4lqxDVruUEjRAu6ZGA6UGLNV6O17zpfvoIA17EcM9Ml+ZTZrywwb/zErChBNdOQw4Uc9eOMPEDsV8BnbL7Z7BpA8XR+lLqT2PLFtN3F+7R3qk+H1gS5GKefd5v0HgaQs4oY86P85Z4juRbMuVJSR+Nmdp8RnxFDuC1XUjiU5/dfNZWVn31orMxqUzJI7O63PtIa1wgfNKJWASMpIND1jQ6hTUdvA0JmAb3chTfVA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dc0b557-bf4b-48ae-249e-08dee1fedd21
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 23:23:08.2672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZ59+VbuiS3g7ZOsFRdpIFqJJUeuhLVGHHGNBftYmLizAR8nRIeAldbxUB5L03LuGPQWwolegnL+6DDQCgMqB/P1buqgUsKF6hGIjjOcY8M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY2PR11MB921967
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



On 7/9/2026 7:39 AM, Badal Nilawar wrote:
> Enable loading of Ocode, the legacy OOBMSM firmware,
> via the late binding flow.
>
> V2: Added TODO comments for ocode compatibility version check

This needs some text to explain that until we start fetching the 
compatibility version via mailbox this code won't actually load the 
ocode binary.

>
> Assisted-by: GitHub-Copilot:GPT-5.3
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_late_bind_fw.c       | 68 +++++++++++++++++-----
>   drivers/gpu/drm/xe/xe_late_bind_fw_types.h |  2 +
>   2 files changed, 54 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index 768442ca7da6..1f627cdea24e 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -33,10 +33,12 @@
>   
>   static const u32 fw_id_to_type[] = {
>   		[XE_LB_FW_FAN_CONTROL] = INTEL_LB_TYPE_FAN_CONTROL,
> +		[XE_LB_FW_OCODE] = INTEL_LB_TYPE_OCODE,
>   	};
>   
>   static const char * const fw_id_to_name[] = {
>   		[XE_LB_FW_FAN_CONTROL] = "fan_control",
> +		[XE_LB_FW_OCODE] = "ocode",
>   	};
>   
>   static struct xe_device *
> @@ -179,6 +181,34 @@ static const char *xe_late_bind_parse_status(uint32_t status)
>   		return "Invalid Payload";
>   	case INTEL_LB_STATUS_TIMEOUT:
>   		return "Timeout";
> +	case INTEL_LB_STATUS_INTERNAL_ERROR:
> +		return "Internal Error";
> +	case INTEL_LB_STATUS_INVALID_FPT_TABLE:
> +		return "Invalid FPT Table";
> +	case INTEL_LB_STATUS_SIGNED_PAYLOAD_VERIFICATION_ERROR:
> +		return "Signed Payload Verification Error";
> +	case INTEL_LB_STATUS_SIGNED_PAYLOAD_INVALID_CPD:
> +		return "Signed Payload Invalid CPD";
> +	case INTEL_LB_STATUS_SIGNED_PAYLOAD_FW_VERSION_MISMATCH:
> +		return "Signed Payload FW Version Mismatch";
> +	case INTEL_LB_STATUS_SIGNED_PAYLOAD_INVALID_MANIFEST:
> +		return "Signed Payload Invalid Manifest";
> +	case INTEL_LB_STATUS_SIGNED_PAYLOAD_INVALID_HASH:
> +		return "Signed Payload Invalid Hash";
> +	case INTEL_LB_STATUS_SIGNED_PAYLOAD_BINDING_TYPE_MISMATCH:
> +		return "Signed Payload Binding type Mismatch";
> +	case INTEL_LB_STATUS_SIGNED_PAYLOAD_HANDLE_SVN_FAILED:
> +		return "Signed Payload Handle SVN Failed";
> +	case INTEL_LB_STATUS_DESTINATION_MBOX_FAILURE:
> +		return "Destination MBOX Failure";
> +	case INTEL_LB_STATUS_MISSING_LOADING_PATCH:
> +		return "Missing Loading Patch";
> +	case INTEL_LB_STATUS_INVALID_COMMAND:
> +		return "Invalid Command";
> +	case INTEL_LB_STATUS_INVALID_HECI_HEADER:
> +		return "Invalid HECI Header";
> +	case INTEL_LB_STATUS_IP_ERROR_START:
> +		return "IP Error Start";
>   	default:
>   		return "Unknown error";
>   	}
> @@ -298,7 +328,7 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
>   	struct xe_late_bind_fw *lb_fw;
>   	const struct firmware *fw;
>   	u32 num_fans;
> -	int ret;
> +	int ret = 0;
>   
>   	if (fw_id >= XE_LB_FW_MAX_ID)
>   		return -EINVAL;
> @@ -320,9 +350,16 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
>   			return 0;
>   	}
>   
> -	snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path), "xe/%s_8086_%04x_%04x_%04x.bin",
> -		 fw_id_to_name[lb_fw->id], pdev->device,
> -		 pdev->subsystem_vendor, pdev->subsystem_device);
> +	if (lb_fw->type == INTEL_LB_TYPE_OCODE) {
> +		u32 ocode_comp_v = 0;
> +		/* TODO: Fetch ocode compatibility version via system controller mailbox */

As far as I understand compatibility 0 is not a valid value so we could 
add a:

     if (!ocode_comp_v)
         return 0;

so we don't even attempt to fetch a FW that we know doesn't exist.

> +		snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path), "xe/%s_8086_%04x_%04x.bin",
> +			 fw_id_to_name[lb_fw->id], pdev->device, ocode_comp_v);
> +	} else {
> +		snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path), "xe/%s_8086_%04x_%04x_%04x.bin",
> +			 fw_id_to_name[lb_fw->id], pdev->device,
> +			 pdev->subsystem_vendor, pdev->subsystem_device);
> +	}
>   
>   	drm_dbg(&xe->drm, "Request late binding firmware %s\n", lb_fw->blob_path);
>   	ret = firmware_request_nowarn(&fw, lb_fw->blob_path, xe->drm.dev);
> @@ -332,22 +369,15 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
>   		return 0;
>   	}
>   
> -	if (fw->size > XE_LB_MAX_PAYLOAD_SIZE) {
> -		drm_err(&xe->drm, "Firmware %s size %zu is larger than max pay load size %u\n",
> -			lb_fw->blob_path, fw->size, XE_LB_MAX_PAYLOAD_SIZE);
> -		release_firmware(fw);
> -		return -ENODATA;
> -	}

IMO we could use some text in the commit message to explain that we can 
now send bigger payloads and so this check is not needed. Also if the 
XE_LB_MAX_PAYLOAD_SIZE define is no longer valid it should probably be 
deleted.

> -
>   	ret = parse_lb_layout(lb_fw, fw->data, fw->size, "LTES");
>   	if (ret)
> -		return ret;
> +		goto release_fw;

Here it seems that you're fixing a bug, because we were returning 
without calling release_firmware. It might be worth splitting this to 
its own patch so it can be backported.

>   
>   	lb_fw->payload_size = fw->size;
>   	lb_fw->payload = drmm_kzalloc(&xe->drm, lb_fw->payload_size, GFP_KERNEL);
>   	if (!lb_fw->payload) {
> -		release_firmware(fw);
> -		return -ENOMEM;
> +		ret = -ENOMEM;
> +		goto release_fw;
>   	}
>   
>   	drm_info(&xe->drm, "Using %s firmware from %s version %u.%u.%u.%u\n",
> @@ -355,11 +385,17 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
>   		 lb_fw->version.major, lb_fw->version.minor,
>   		 lb_fw->version.hotfix, lb_fw->version.build);
>   
> +	/*
> +	 * TODO: Verify compatibility version in manifest header against the version
> +	 * returned by the system controller.
> +	 */
> +
>   	memcpy((void *)lb_fw->payload, fw->data, lb_fw->payload_size);
> -	release_firmware(fw);
>   	INIT_WORK(&lb_fw->work, xe_late_bind_work);
>   
> -	return 0;
> +release_fw:
> +	release_firmware(fw);
> +	return ret;
>   }
>   
>   static int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> index ee5efe60774e..e4e5fafa31d7 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> @@ -21,6 +21,8 @@
>   enum xe_late_bind_fw_id {
>   	/** @XE_LB_FW_FAN_CONTROL: Fan control */
>   	XE_LB_FW_FAN_CONTROL = 0,
> +	/** @XE_LB_FW_OCODE: Ocode firmware */
> +	XE_LB_FW_OCODE,

in the review of the RFC version of this patch, we agreed to modify 
has_late_bind to be a mask so that we could set FAN_CONTROL for BMG and 
OCODE for CRI. Is that still planned?

Daniele

>   	/** @XE_LB_FW_MAX_ID: Number of IDs */
>   	XE_LB_FW_MAX_ID
>   };

