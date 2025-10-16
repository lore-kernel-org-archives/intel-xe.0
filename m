Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A6EACCD194
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 08:50:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC9E10E2EF;
	Thu, 16 Oct 2025 08:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HnYw9Gle";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5052F10E2EF
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 08:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760604634; x=1792140634;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0HE7vNd0ttjMEiv8ycVnDUew1q1ikmt/vuESi7osB1k=;
 b=HnYw9GlegdzkmR7KHm6OmK6AXhd0O55BzSMy9AtWkp+NrI0OAjs0HSaM
 XQHHjROo6MReW0JtDyWMP5FU7i40KoYLDRyiuFydir6aqnoDnsumXXzrE
 now/RF9HUXe0dquM2N5aSncB9VOjWX7nKqh238UUoJEusdHUpZApGVML5
 1nVSrtLIEpptfXKHTSY83cpEJNK2/I9jiezfa7zGhhPzF9/7+35HI04iF
 YUvNlepjht+UBcuok2oxIAoc96DaXC/8hsnr6e2ZLmKocIK3UKalC1fEm
 FPlt5sqQAQRaIJ/I2Q/yPhl9Z79+KXwx5vhfeERt7Xo89hYncEoCBMaPO w==;
X-CSE-ConnectionGUID: oy9OvIyoRfazZvC/cFkOvw==
X-CSE-MsgGUID: dxz8Tkf1Qg2nIJAS7HCfMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62699227"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62699227"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 01:50:34 -0700
X-CSE-ConnectionGUID: saz2UoXbQwyXeb4YGC/RjQ==
X-CSE-MsgGUID: 0Wua79YBRQOG3JkG5EhiEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="182873179"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 01:50:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 01:50:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 01:50:33 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.12) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 01:50:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V7AF8IczL66jLXccVyONu3tgQ25DcP43TmJQtD5d9Z1AZ0Jitt4p5O66h+/LMa9r4kcUlI4VecxEQON9SO5JxUPSOrq16jj+qWaQRc1ZQF6UafzgQ9sHo64nngUOw+tM3kOXvzA057GBuJf8At6sPygNEFBqIHNtTkF0CZcrNNHDLJkCGsRtt90hlp27uhGum1AYmUFrKEMKPZ3qm56Smo9g/fDtv27ryfnANZum0pro3ckYq8Jlh8sKnxRMoieIu1VNb2/PYBdM476tQaNWnUJDvtCeUXD2Y6ZbQSOEyYs83jirRC+dp5seQa5rIai9+S9g3UzCwwwVvoo8m0DQRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ovelftyo8mzL6KqW4PblUULpJgOa67pgehhQYthYTzI=;
 b=Et1pjpnyj/ShPR8lquqZGEH+6SUNL4891oSXx95MDE7cZDEi2RM7WUCOXa2c50PUe1IRlrkf2o7ybEMhYvuTykjCRrSCVMMQtrJJMZSwFD8KH0XzdgwN17RpYvmc+z+OZXCWeaOs1MJSk45PPjvoBOG98+3/TPqsIx+TbMDSoqfXhQvSB6Z+XenVfrSjH6XH7RauVwMFAOD38ifXhJD2lUb8gR7HZr28C7aMFj2y0M+yZpbNaCxybu34mEH5x4I9bNsvihNxo52e+DEo/Az6mwiAMvUQ0f81sOZ5uVwiuM1pOYdYVN/VesFZsUbCiOebkv6DpmE4H4N16WHJWSMJyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ2PR11MB7474.namprd11.prod.outlook.com (2603:10b6:a03:4ca::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 16 Oct
 2025 08:50:25 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9228.011; Thu, 16 Oct 2025
 08:50:25 +0000
Message-ID: <cc2f7495-4014-4402-b22a-0402ea1b195c@intel.com>
Date: Thu, 16 Oct 2025 10:50:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/12] drm/xe: Improve xe_gt_sriov_pf_config GGTT
 handling
To: Matthew Brost <matthew.brost@intel.com>, Maarten Lankhorst
 <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
References: <20251015074708.1654014-14-dev@lankhorst.se>
 <20251015074708.1654014-20-dev@lankhorst.se>
 <aPAahQy4TpYsFV2S@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <aPAahQy4TpYsFV2S@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0475.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7e::9) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ2PR11MB7474:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b4b09ea-2384-477e-4653-08de0c910c82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wk9Ed0gyNWRZOWwxQSt4MmNnWExRdjZ3SU5EQjVsdmhzd1NqMGdDdlEzZno1?=
 =?utf-8?B?MnNMcEJTT2xjbTY1UFMvS3V1ejVwdjUvenp5QU5oWUZkL0tzQ2F6SHJVNDVt?=
 =?utf-8?B?cGxpZ25MU2NXQTJROVRBOG9NamwzSDdNaDlaZGZERnZsU3QvOFhPNTA5VXZz?=
 =?utf-8?B?NVRLdDB0TVh3MmxKMnRVcUU4SmJoSms2U2dMeUszWTlFc050MVAvelpCV1R3?=
 =?utf-8?B?bUJBMnVWUDFiOGR4VVJ3dzZYQXVybitpTDhxUCtxUStvV3g3WUh3S0VHYzRl?=
 =?utf-8?B?aVlpYUJxc2ZWek5reGQ2RUdncHNMaEkyUjZvVHFUTyt2TWZsZElwU2toRXZ3?=
 =?utf-8?B?RmllcUoyYVp6aE1OM2F0Q2pBRk9Qb1AyRVhMVTZvZzRjOW5xNlVJN1hLNTBK?=
 =?utf-8?B?TTlvYjZlYi9hRDMrQkh3cktoQU5tTnprUWV2WGpUdDhRS0FVNyt3UGVFT1JH?=
 =?utf-8?B?N3BldTRzKytjOC94S1p3aHpaeHBaTnJ6OFBlcFYzdXZsYnVGN2toQWo1RGl1?=
 =?utf-8?B?RzNiK053dFZKVU1CcGVsb0Y2T0wzMEJaS2pJTkl3Tm5RbGh5NWNSZlBBVngy?=
 =?utf-8?B?Y0lkQk5TaDVNaEc1RkRSWXEwNXFveHF0bFdacVFHbVIyV0tNWDFUbXRMR0xv?=
 =?utf-8?B?NGx5ZjAwQW1nS3YzVTc0QU9JQVpudWFWN0NBakxjbk44bFpnS2RlQm93bmN3?=
 =?utf-8?B?NmRaS3pkZzh0S1hZdDNxcXBFaXQrYURFSHlPaVB5WmRhWUxvUm5FZlh6TnlB?=
 =?utf-8?B?NGtDUDA0aCtKUTc5MytySGNwbGFNRUNNckRSK05PVTEvRmZwcnJXZVlHQTgv?=
 =?utf-8?B?dWVNbXB0QzFyaUZuOFhpbm1YQWVJM0U0ckhhWXdtekpCVkd4cUJQQWc4cGdO?=
 =?utf-8?B?ZmQ0Zld6QTduQVRQM1hsN1F0RlFPcitMM0VDMVdqbUVQaUR2UTZ1Y3o2UzRj?=
 =?utf-8?B?MHRtaU9md1ZpalJWUHArc1dPRWJETWpsUWlOSUtmekIwWEJKN2wxYUpabGtP?=
 =?utf-8?B?SVJPdW9WVEJMdmRNRGtleDQwVndxU0dWZ2JTVWFVaEdnVUFBQ3gvRjV4T3pr?=
 =?utf-8?B?RWxXOXZIaUJGYkhiMzN0ZTQvUGk2YmtmK1VpTVQzYlFhdncwTTM3cU1BU3Fk?=
 =?utf-8?B?dHVVTSt4dnI2ZXRlWUZNVTQwU0k3RGZFa09WWCtndFVvS0hzY0hZRGFlZWRQ?=
 =?utf-8?B?SWRxTW12RDNDeG84Tk5wQ1hyKzhhSUNqVEcrYkRjc0g2MjQyTUtaVzhKbzJ1?=
 =?utf-8?B?b3kyWkgvNmR0cXFHTXpkdWtUV2J3OTBUajZDcHJEQjlWd3NJNGQ5Ni9XR2wr?=
 =?utf-8?B?aXlEc3VoUGQ2OTFJaHQ3OTBtRmNLb01FeHd6R0VMdVRkUHE5WmxXU0dteXlI?=
 =?utf-8?B?WCthVXJ0bVVObXg4MS9RNWQ5QTE3ZmYzTmlLSTdUTU13R2ZOMzRwSERNeUt3?=
 =?utf-8?B?cmIwbkNTWXRHR0E0c2EyalQrVzJkeDdxSnBRV2xidkdMOWhtNUh5c3JqenB5?=
 =?utf-8?B?SWxtV3Z4YW0zQ2xlTzVkalA4cDdNSGU4dWdMb2ZhWlA1WGs0M1RXRGxCd3hL?=
 =?utf-8?B?Skd0ZjBvZFN6YlpYM0xXSzJoNE9UREl1aTFKNmpCV0VzU1JINEZoMURDKysx?=
 =?utf-8?B?dDVLdlh1K1BnSUdzVk9wcmJXbmZ6TWhKejJmdmdIVUNFZkZwUm5IMmtIbWlZ?=
 =?utf-8?B?cXZvUEtFNUZydkVWNHY0RWFzdkFOejNXMStINnprT0liK05pN3lGcXo3MFhi?=
 =?utf-8?B?ZmRNYXZKVzZwQ1VVNlFFQW45cjZNOWdwTXEzY3pubGJidXJRS1VsUmtrNFJn?=
 =?utf-8?B?N0c3ZWVDajUyMWZUeDFvUjNlN3YrRkthWU1YT2kxTnhjMitVZWJBQytoRFB1?=
 =?utf-8?B?SUhESlN6bnQ3U3BuVmVrTW1EcUUxWHFBVVV1RXJLS1pPNHVBM25IcEEwVXY3?=
 =?utf-8?Q?WDUu4g6KaATBmjDx9u+R/xF1C8BfofBE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlNVNFF1b1dDRHRSQys1TGRFR0ZsdUxMbzVXSE9YejBISSt6UkcvSlZLS2ww?=
 =?utf-8?B?RzN2ZkZlSDFnVUt4MkV4VkpieHZ5VHFRSnlMVzgveEJPTUVoQUwwb2RGWm5H?=
 =?utf-8?B?VXlDWjJEN080L3V6bnkrYVdsc3FCWERqeFVsTE1EVC9ha2pVNVF2TnhiZ2c5?=
 =?utf-8?B?R2tMSjRHdDU1RGdISnhic3F3c1RXbXhXeHJGV05wb0ROb1VvWmtRTFNHZGND?=
 =?utf-8?B?bDFKZEkraXcrRGJ6d2lSWWVxK2M5L0M4aFgveU5pYU5UajZadmVWT1UyZlpT?=
 =?utf-8?B?aXpMdUdwaGJ4cExHbW11WTJWOXFUa0w4eWlra09aY0pPNGVJVXpVdHFUTmU5?=
 =?utf-8?B?SDVldTVaZzd4MWJ5RmU3TWxscTBsY1N6VlcyL0ZGMzFFYStmaGdjMERLY2RS?=
 =?utf-8?B?TVpMeUk0MVVCRG5uNHFvWkpuVENsWWNVT1ZWRDJOVUJOOXVrcGxrMSt0c2Fv?=
 =?utf-8?B?R00wNjFKNUdhSUlNekx2RUxpMG9tUWJ3VTF5c09LcDNNbmxDUHpDVlQ0My9m?=
 =?utf-8?B?YWNZT1hVRTRvMmlHeEtCQTViWlRDbm1xUnBFWVRXOHltZkpsOGhaNlMrVlhW?=
 =?utf-8?B?OWRTSVpTbmpRYkVLTUJObGJnUjl2citDWU03aUx5cG5SNUEzUk5VUE1ZbEZ4?=
 =?utf-8?B?SkUwak5UMThmb21HQUtnZVFrNjk4cTRTVm4yelNFU0E2azd1QXM2RDQ3QXhu?=
 =?utf-8?B?bkxyYXBCTlNLRzhnUDFTWmg1UU8yRXo0OUdsM09hRDRhSmhVeitGdVFXb0Zk?=
 =?utf-8?B?RnRUY2tsdFh2eHROdUVOQ1ZsTU42RnF4bjBQd2tUOUZpc3BwYmZmOXFUSEJI?=
 =?utf-8?B?MlREK1hZUmgyelZYLzM0cjQ2WnNLeURGckd5U1EvbEt2a1k4a09sWjNkQ3lC?=
 =?utf-8?B?UCtQbGtRKy90Z2dBNU5ZNkZodnRIRHY5azdkTlFBRmxBOUkvOGFLRExha2ow?=
 =?utf-8?B?MjZCMkxUY20zcUd4ZU5HVHpIRUU2NWt1cU9CbE1NSm1zRk45cFRqR3c0Qnp2?=
 =?utf-8?B?cjdDVkZ6bGdpUVpRMXhCajFjbkRZdTI4VG9DVXp0enBwaUNaUnI3WWdPQU9W?=
 =?utf-8?B?bU1IMHA2QXJPaHZyVldtQy92OGlPNGJQZmhzSk82a1hSeVg1MWo5TTBMbDJh?=
 =?utf-8?B?VWtJYkxseWtxODc0OHMvUkpXQ3V1ODZJeTJ2Q0hLUWhxMnoxZzd1cW1jc2lG?=
 =?utf-8?B?Zko5bklJQjMxZlNhdVZnbmhrSnB3VXU3S0JFS1hHZllSZDBaNzd5OFlWOFVr?=
 =?utf-8?B?YU5hRFFjaVkxeGR2c0FkV1pGZXNSS0hkWHpHS3dGV2JGQzVzV0RWMDA1VWFn?=
 =?utf-8?B?YnNhRXlWcWlVSlpRL0NvcjZLV2tVZnluNktVbG84cFYvampWVng4bFB2cEx2?=
 =?utf-8?B?ZUQ1QUVGSyt4RkphNjZ6bUZQMEFVZ0pvV00wL05GbVhoU0dtOE1RaHRMWU5u?=
 =?utf-8?B?ajRxNXFKOFBpR2I5dTNzS01TYkhsK3Z0c2gwcWdXbHB0N2JTZVh2VVV2Rlp6?=
 =?utf-8?B?dlZnVVNnNHhqYjBJa0NmNVoxZWVxZy95dURkQm84WnVPTkV4UmY5bE8wMnlQ?=
 =?utf-8?B?T2hYVytyczNmUGc4Qjd2OGM3Zk9TbVM2SzRGM2hGdGdPSEJQSXNiODlqT0VD?=
 =?utf-8?B?TGdod25jQ0tWd3JLUEVyckJQMXY5QWJwMmxnY1I1WWpuSDN5eEhJSDdCVU1E?=
 =?utf-8?B?U1g0SDVwY2VLOVN3bk9EUDdjRGYyTW1CODN5THFHajJtN3B5eStpNEpxK3pa?=
 =?utf-8?B?Z0xYOGNUaCtsTmcxNEZBdWlpUmxYR1cxVzVQUTI1WEJyaURqTkhIWlg5SEV5?=
 =?utf-8?B?ejczdmhPbUQxR2ZyeUJUTVJKSDdLbkthNlpCLzE1TC9reFQwSlR0YmordjRD?=
 =?utf-8?B?Y2VXQmtFZHoycENEeHhVUmpGUEpOTW52dk1BN0FTSWJ1Mk41ZjFYaVU5bldY?=
 =?utf-8?B?aXZlN1RyYk1WUDVCcmpscmVaU2JIOUlrUnp5cno0Y0crQzJGZVlsUHR5QldB?=
 =?utf-8?B?NEpXdUZGaFlWSkQ3Y1hubTFldmFIeU9KKzlQUUovcHplOC9VODdoQm0zYWdJ?=
 =?utf-8?B?TktkQXM5eFJGSW1aY2NyYW0rVE9wUnBBL1VVWTlmL3hCWER2ekg4MXM1WUNZ?=
 =?utf-8?B?eGdYSFQ0Z3pMWlhFa3J1V3dlVjlPRnlxTzVkWXZWc1A5SytRMmJhNEwycTRJ?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b4b09ea-2384-477e-4653-08de0c910c82
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 08:50:25.4719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d4rEHCJns63/C2YBhFIqH3joccnrzNSQPPHBe8KF5SrzGoMzUX/psbnsw9ejH0F8UskPk2oLdoqnLcU4yb/gsU/Vxc3niEUJ/FEQomfUsf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7474
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



On 10/16/2025 12:04 AM, Matthew Brost wrote:
> On Wed, Oct 15, 2025 at 09:47:15AM +0200, Maarten Lankhorst wrote:
>> Do not directly dereference xe_ggtt_node, and add
>> a member to store the GGTT size.
>>
>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c       | 15 ++++++++-------
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h |  8 ++++++--
>>  2 files changed, 14 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> index 2289756761636..c0dfffd5c553b 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> @@ -264,7 +264,7 @@ static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config,
>>  	if (!xe_ggtt_node_allocated(node))
>>  		return 0;
>>  
>> -	return encode_ggtt(cfg, node->base.start, node->base.size, details);
>> +	return encode_ggtt(cfg, xe_ggtt_node_addr(node), config->ggtt_size, details);
>>  }
>>  
>>  /* Return: number of configuration dwords written */
>> @@ -495,13 +495,14 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
>>  
>>  	xe_ggtt_assign(node, vfid);
>>  	xe_gt_sriov_dbg_verbose(gt, "VF%u assigned GGTT %llx-%llx\n",
>> -				vfid, node->base.start, node->base.start + node->base.size - 1);
>> +				vfid, xe_ggtt_node_addr(node), xe_ggtt_node_addr(node) + size - 1);
>>  
>> -	err = pf_distribute_config_ggtt(gt->tile, vfid, node->base.start, node->base.size);
>> +	err = pf_distribute_config_ggtt(gt->tile, vfid, xe_ggtt_node_addr(node), size);
>>  	if (unlikely(err))
>>  		goto err;
>>  
>>  	config->ggtt_region = node;
>> +	config->ggtt_size = size;
>>  	return 0;
>>  err:
>>  	pf_release_ggtt(tile, node);
>> @@ -514,7 +515,7 @@ static u64 pf_get_vf_config_ggtt(struct xe_gt *gt, unsigned int vfid)
>>  	struct xe_ggtt_node *node = config->ggtt_region;
>>  
>>  	xe_gt_assert(gt, xe_gt_is_main_type(gt));
>> -	return xe_ggtt_node_allocated(node) ? node->base.size : 0;
>> +	return xe_ggtt_node_allocated(node) ? config->ggtt_size : 0;
>>  }
>>  
>>  /**
>> @@ -2516,11 +2517,11 @@ int xe_gt_sriov_pf_config_print_ggtt(struct xe_gt *gt, struct drm_printer *p)
>>  		if (!xe_ggtt_node_allocated(config->ggtt_region))
>>  			continue;
>>  
>> -		string_get_size(config->ggtt_region->base.size, 1, STRING_UNITS_2,
>> +		string_get_size(config->ggtt_size, 1, STRING_UNITS_2,
>>  				buf, sizeof(buf));
>>  		drm_printf(p, "VF%u:\t%#0llx-%#llx\t(%s)\n",
>> -			   n, config->ggtt_region->base.start,
>> -			   config->ggtt_region->base.start + config->ggtt_region->base.size - 1,
>> +			   n, xe_ggtt_node_addr(config->ggtt_region),
>> +			   xe_ggtt_node_addr(config->ggtt_region) + config->ggtt_size - 1,
>>  			   buf);
>>  	}
>>  
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
>> index 686c7b3b6d7a5..9a8e66c8b539f 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
>> @@ -17,10 +17,14 @@ struct xe_bo;
>>   * Used by the PF driver to maintain per-VF provisioning data.
>>   */
>>  struct xe_gt_sriov_config {
>> -	/** @ggtt_region: GGTT region assigned to the VF. */
>> -	struct xe_ggtt_node *ggtt_region;
>>  	/** @lmem_obj: LMEM allocation for use by the VF. */
>>  	struct xe_bo *lmem_obj;
>> +
>> +	/** @ggtt_region: GGTT region assigned to the VF. */
>> +	struct xe_ggtt_node *ggtt_region;
>> +	/** @ggtt_size: Size of GGTT region */
>> +	u64 ggtt_size;
> 
> Nit: Couldn't we have a helper to dervive the size from the
> xe_ggtt_node to avoid storing the ggtt_size explicitly?

+1 (as already commented)

> 
>> +
> 
> Longterm we should likely move the PF GGTT config to a per-tile
> structure like we did for the VF GGTT config. IMO we can do that in
> follow up. Maybe ping Michal for his thoughts here.

I have almost finished series with GGTT/LMEM changes, but switched to
higher priority task (provisioning over sysfs), hopefully will be able
to return to this topic soon

> 
> Anyways, this looks like a good cleanup for the existing code structure.
> 
> With that:
> Reviewed-by: <Matthew.brost@intel.com> 
> 
>>  	/** @num_ctxs: number of GuC contexts IDs.  */
>>  	u16 num_ctxs;
>>  	/** @begin_ctx: start index of GuC context ID range. */
>> -- 
>> 2.51.0
>>

