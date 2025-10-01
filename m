Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97EDBCAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 15:29:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A8010E319;
	Wed,  1 Oct 2025 15:29:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mt8iBSXB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87FEB10E319
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Oct 2025 15:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759332596; x=1790868596;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KhObtiwz0XEIDcueoJMExC1pUdde2sKbMzR49PsW8Zs=;
 b=Mt8iBSXBrYm+uzdTubHq+LDW2fxgeEsLrkeK+kXVYm2uuZkUBn5PlEnc
 ITdl9ReZeGRwrPr+OxSF8Cy8dG2i1NP096kwmAcCb4/IdP3Yd4RFC8fDL
 yZt1Wo7n3DoGLdqY4eqwzGg6PYgbWyCDeI6Er7ZoJnH/PPoKDMN+kR4cu
 NiGLwubCs4Sku9jhZPVpwE88OfjvtNSU7mp5DiMCAIQEGAPGukATWtpYi
 bv7alTotGqmwS1vDt0K30eLNfbZ2NEpapEhdJ3XPb7Ig2czYjGPtca7l6
 YJKYRV2BORZFat+ux8csLv/YI3V4uXhegDzEZprXTporX+zGGFmxSJkgU g==;
X-CSE-ConnectionGUID: s/8FEj2YQ8eHq5jdHi89qg==
X-CSE-MsgGUID: xxpGSKWwQqigwAYrVpTDAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="79031522"
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; d="scan'208";a="79031522"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 08:29:51 -0700
X-CSE-ConnectionGUID: DzzF2FOOTNWNPnqjKxhxaQ==
X-CSE-MsgGUID: xU4PowUtRF6160FoGkscNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; d="scan'208";a="202515165"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 08:29:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 08:29:50 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 1 Oct 2025 08:29:50 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 08:29:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hIBsPUo1/TBeNIbN/D5HjRN0ai6cXwWMJ0CxCnDyfxldf8NO4KURGE6te57cIROG6TeeBy2zlAHPEb8LjK7wWc8LCWlKmk+XN6FjMDMtYX44fjCh2EVb4gRiAZmi4oiSb+XYhnjEEthBTsOunK/8I9FhmsN1BFqvKJcPKg8cwnRNIpUjfP2Kq2yvy3nZoZKRp/lOUMXg6OKLt3g0Wo/GmMdhL/9GenpOrVD9LZNV5BkdR4UytmT/S4e5hfiHuDMIyXSYShjPvAkq9Ohw7G6HlXRtfe7dgHJBoAGwVb0a9M5EDDcIUI7e0bKuiANqxszy//ptOtJGImjEMlORGiPxAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=40NxPjF6mhmSloQd4xzVD5KKv+kXzXT9OKEH17aEuG0=;
 b=YHzcCYd9jpz0jk+G6u5MHb270YT2G4H78U6RBZKsymEV6FfYEMhWMD2p5cnb+bMeo9H5lzMpIS1Z2BVp1VwfI7jhqcWoRoiEx7EAaQohiHCMVkVAloh9JniZhiqKXivFYD+q/Mj3uVuCXTW7UOO6Fwgkx41wmT7i3Gmd4UY+MWmP88cP2vuTd6Besm+P2KwnuozA8oRMBmYdxQRl0gA9kZYqdIrDy3+GdUv3EQLk3KJvr5VGIVRBY56OaClP5F1jz/n4QzvLd0Cpez60nzlolwIvbow/Xiz0LFo8+JO2B5DgCBeo6hN9rneANfMBNCGY7/m8ajso+iZ4Rs1z696iSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA3PR11MB7581.namprd11.prod.outlook.com (2603:10b6:806:31b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.11; Wed, 1 Oct
 2025 15:29:46 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 15:29:46 +0000
Date: Wed, 1 Oct 2025 11:29:41 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <mallesh.koujalagi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>
Subject: Re: [PATCH] drm/xe/xe_late_bind_fw: Initialize uval variable in
 xe_late_bind_fw_num_fans()
Message-ID: <aN1I5dVl6kQeRnjZ@intel.com>
References: <20251001010933.3179753-1-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251001010933.3179753-1-mallesh.koujalagi@intel.com>
X-ClientProxiedBy: BYAPR05CA0088.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::29) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA3PR11MB7581:EE_
X-MS-Office365-Filtering-Correlation-Id: e8554c3f-0be5-4b90-b37a-08de00ff59e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?souOiUYqcqx5ra2r4xqWz4X5n8AooI+zmJdCQAPj0tIcZ0jG3KFZAYYe3l5h?=
 =?us-ascii?Q?YjgZ3dtf+WqG1cc/XV67C0yO88vkWxK4XjXZLGiNupelkW0U4JobgTOAgQ7u?=
 =?us-ascii?Q?nUyh0e2PSGxrLiD/KHw5GFPeJAi7m9d/AHsr+TPdOlx/vuIN0W6DZogj4YBZ?=
 =?us-ascii?Q?Yt1iyKDBddsmajiHu74O0ZkL3GV0g8Lf9GaKG49cE0IbvqyAWjK4kioxTlL4?=
 =?us-ascii?Q?BADhySpUxjMdPx0KyBYO94Tb2z5uDspNHLsygYlbmA+AH3EAAV0ClbVUFUox?=
 =?us-ascii?Q?DEiBgIB++qDMGvWbAYhQ3IqVnMTh181Bin4mlj0M6/yYGLPbRAJNmDrfBBGr?=
 =?us-ascii?Q?ktkLpugf0PxXgytZMl+bjPN2V/OmyIOS81zS74TTq7i0TpD3pPIph9fxyaY/?=
 =?us-ascii?Q?CMW3xA5+EgPYucIjBJ/L6zYG9SQ2VK0DExlRJZ9+Vkow/A3g4U6ZHWyV+jp1?=
 =?us-ascii?Q?7lhC9CnKi8DHE6pLy+aRV4lmPrdBvEg/JLZW1fS4xxj/BEq824WSf7O1BKwE?=
 =?us-ascii?Q?L5aIf5UXHbluFWT81JiP4n+tPpY4qqr6QsjUHOHSJZHGH54b0ja3LuliR62w?=
 =?us-ascii?Q?zUdvTrN3ER6jHvof77G5jnlg/60mbLmYDh6yzJjFAhnoRlDHityK7Gb/4rq1?=
 =?us-ascii?Q?/LiR2MwSyXNXfOYnJVw1saVxw1q1MH/nNYo9yOakqOPpDz1TePr12XbO7BOa?=
 =?us-ascii?Q?JNix1QYfQ9945MOWX+v6XdSMA5W2b3TGJmXyFf16ymKx/vCqGgDqQCSsggvR?=
 =?us-ascii?Q?EiS3+gi0vLyWGZJZdi0OGX+B/UqM3ZriLTVDJCHsu155zfZbFSnX3Zz0DUK3?=
 =?us-ascii?Q?o6ZhCN84DwdLoss5o2ievE1IBf/e3XnfGTIBJttLnrvXmNHz1z4f6cPhDebx?=
 =?us-ascii?Q?a7kuFGoWSgyiMHUSrQGHxkm7AxycDyKwbXY+a8Q0Q9rxTyZjCfnIQPImMf3V?=
 =?us-ascii?Q?m0HwDJqfMN0aZwoPVKf2rABEoWVYeBmap69jAIGcjCK0KkZVJKQs5aZpFa4Y?=
 =?us-ascii?Q?s4ai8djR6uJ9224kklaTaZlhR7e0bkU/Sn4YdHxIeFiHsxdjAT6cHm7i5Z3Y?=
 =?us-ascii?Q?pFHW060YfcRPcbB/KaLrjv0gMtnkvn6D3HPnIVc8OiBGNBXOTM9cNgZyQBTS?=
 =?us-ascii?Q?yfrr7qH9YmpH1t0lShGVuAdjrZ3E7N5Q8yz8klJVWq4MZbPt0WDzAJlZJnPi?=
 =?us-ascii?Q?aSoyOkjb9o439061CjJStvvvZ7khiuTnKKVOnfLE9XrJbaPiZVIrXweydLlj?=
 =?us-ascii?Q?j3IyLVEToJUsWH/cHQRoK9ODGnEZ69JhKgLfzkkNdK8u1vvJCxkDWQaYtvf6?=
 =?us-ascii?Q?WqGfUMngUCprsEnUKG5+NnmVUa7v04CW/QFDSOe3wYgTLjll4m50/FJ4MUJw?=
 =?us-ascii?Q?PPBVDCsrndgNCSeyQQMZW059mcy3+NcFcT1REu8bvxXa/xNL1VS+uIoWFv14?=
 =?us-ascii?Q?7UMip6TWTYw38grgS9FbeI+bu7lCYKoI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Flh5CVHxf+jdgHdwDZSfEqzDGGk6YFfMNrxcq6LPPF1c9sj4ppkSGdD3KXRU?=
 =?us-ascii?Q?QGiiQx9bdzZe9yNUxMfzP6ZpsqOZCDhrO8BJXmrnqofAx3oXZu16Pve11LkV?=
 =?us-ascii?Q?sRz4P+aUZz/6qAfS2UNip9n2xb7H3FNvoeJNiXus399XWVQvl2C3A9YiajOo?=
 =?us-ascii?Q?wLo91RJLOLfMgGKWwnP9mmt+DAdYiYW6KsRF//sx7kbzJq0yH1Lug6PFJZ/x?=
 =?us-ascii?Q?MS9r6sHHSiFgDzfzVA/Oswf5gIJJQy/Js1//+sXvhBPNh9tfMoH3kv+ebs5R?=
 =?us-ascii?Q?7J5HJXo583/vIW+sDXxQI/7XfdmNzYbf6d52k3Tf8THm5MLsbmNDaq6k9/sK?=
 =?us-ascii?Q?vZp/FkURAJnVmSBepItBCrFYDQGKCqoWktnTqo6pBwBYksFS2V7/4gnIaira?=
 =?us-ascii?Q?RLLuor3Cq30vNPuaegabT18rW8RTG/YpER6h8xzrCpHF6Op57wGgvZmtRCO/?=
 =?us-ascii?Q?4G+wMyNIFYUuRFVEP5OyBCj2wTqjWhiIRKirtgKqGy7saXX0A9f3+BKTLdLw?=
 =?us-ascii?Q?nvJ6NnCIYq6KkuxebEtvBheTKV70NSGec/mJVY77xHopoK+JNJmmKAktbT9Q?=
 =?us-ascii?Q?GtWzN4HR7Ac8m/A5o9iKAEDrEwiX6MEC6zwmoYZxUIFsFrzAnwQQRcSWOMqD?=
 =?us-ascii?Q?JT2gECVauc+iYDUEkVkuJ3q++15WN8M4748JGSqlPiccsKLIbhiRYwRuNBQr?=
 =?us-ascii?Q?QwXl0DnZILq7aurueOlFul2cSGcQ9J/TpRovhU8YFmjQ/KcpTY4lA6Ui911C?=
 =?us-ascii?Q?L4Z4xxVKgxUB2SBYqBapGIuPt0/FdvldLESyB0BngTN7iJDw2eI3DyF6CumD?=
 =?us-ascii?Q?AgayculUefqPgkwI8xlJDWinQGAax3yAwUiMUwyCg5RiCvLPltNpJN4JnqgT?=
 =?us-ascii?Q?CcOkWeaW1Ff6xFWDykG/WgQSXxzj7o5SGoJoCnsscJQocGyXopK4fUvJoIgR?=
 =?us-ascii?Q?SYKJFSMVt7REcB5OrJdrfWe9W3r8exSOFzflgeVKQsduMihUhBRfz/Vuyvdx?=
 =?us-ascii?Q?+mlRGRbu0c081AsJIPV1vYqsHqbey1B5jFpGoqtPrZ7ny4mSDhC1kqJHm8bB?=
 =?us-ascii?Q?o9w3gPnekLSZ6zuQQ5s76ID34RfdD0RroTdNn3iJvck1dE3Vq4NkAP7DJp97?=
 =?us-ascii?Q?eA8dDzArUwebP9kXkG2qItHcf9B0x1qw8Xae42GK5VyOXnKs+eHSMZJjjdu7?=
 =?us-ascii?Q?Bju4bUl0nPeZNTv2WfTngmrR/0O3fCcegXTIquer4J4qAFl4prTbbqt6ZFIi?=
 =?us-ascii?Q?+RxgQTJAEwqmdcq0BAWpBSnZ4km/nX65OoVUztIihJXnKlcj4LEuFZ7jcAAi?=
 =?us-ascii?Q?rqNnBTNT84WryGSzDik24FuG+CntvJdIH2K5H5prTy6FZp/ByLZagdiTS93w?=
 =?us-ascii?Q?S4adkq/JG3Fs/qM0tjAVl5BQF/gG7Bs5S07QbZQtuIKmIyCRFTEeOPGZ7i3K?=
 =?us-ascii?Q?sf8bPoXj2lDklp6jXcQ9pguahSbkrhitkmNwpZDkzmypWkQDXYaPeHAtNRsW?=
 =?us-ascii?Q?W5AUpZz6aBmIhaGPGXTYia68iQd0Eb/82z5vLpKSFZZx9wmMrPMPNTGrJ89T?=
 =?us-ascii?Q?Px/51lYEob3zE9eoIxt5WLXPRn3vstq5pt51jUWwHyhz+o0djaOxEc4sw65y?=
 =?us-ascii?Q?xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8554c3f-0be5-4b90-b37a-08de00ff59e7
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 15:29:46.2895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fx0DERa6uI6b1E93JCf/YpCrZEy3XS50KYlv+JGhdvSMmRJ5aNGqkOsmP4YVHYM3Ly+dwhPuskoGGO25Nq2Mzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7581
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

On Wed, Oct 01, 2025 at 06:39:33AM +0530, mallesh.koujalagi@intel.com wrote:
> From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> 
> Initialize the uval variable to 0 in xe_late_bind_fw_num_fans() to fix
> a potential use of uninitialized variable warning and ensure predictable
> behavior.
> 
> The variable is passed by reference to xe_pcode_read() which should
> populate it on success, but initializing it to 0 provides a safe
> default value and follows kernel coding best practices.
> 
> v2:
> - uval = 0 which serves as both a safe default and the fallback
>   value when the pcode read operation fails.
> 
> Fixes: 45832bf9c10f3 ("drm/xe/xe_late_bind_fw: Initialize late binding firmware")
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_late_bind_fw.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index 38f3feb2aecd..46981a6f28ae 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -188,13 +188,11 @@ static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
>  {
>  	struct xe_device *xe = late_bind_to_xe(late_bind);
>  	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> -	u32 uval;
> +	u32 uval = 0;
>  
> -	if (!xe_pcode_read(root_tile,
> -			   PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0), &uval, NULL))
> -		return uval;
> -	else
> -		return 0;
> +	xe_pcode_read(root_tile,
> +		      PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0), &uval, NULL);
> +	return uval;

I'm afraid both code are wrong.

Although this version is cleaner and not returning garbage, you are still
returning 0 when MMIO operation failed. That propagates 0 and success upwards.

This function should probably return the error and make the uval as pointer-argument,
like the pcode_read.

Then also change the caller of this function to propagate the error upwards
if mmio failed.

>  }
>  
>  void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
> -- 
> 2.34.1
> 
