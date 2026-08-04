Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC34C55822
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 16:06:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7B110E5DA;
	Tue,  4 Aug 2026 16:06:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BJQ6hHYh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA89610E5DA
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Aug 2026 16:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785859559; x=1817395559;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=XPOGBH+3EuL84MiDD7vuvjfJXa8EZ/StH2kRKQoTsSY=;
 b=BJQ6hHYhh1rino+l8CImtO28oc8WklReziKaPeJa4uWf9CGVo8gTFW/L
 NrcFL7HHz2bG6u9mOAPplyApyuBSVc2LKn4kQJ+L6ESAQOxhJqdF7ZgtR
 VjVm/hQe+/qjbk0JQIqf79AHn0ozpxPr5pAde6J+n40CspVg8i6m+0PeU
 npZfc4DinFBk3YkxLLBGJ2wYjDOgZ/kZRC85GBOjItcl6WgpnzaY+Kts6
 mXdGXamCmpHqnsIfr9uIfLw7IBfoSoTbkKrxbk4jSot/G1/7PYdGHot9h
 kCzsJQeMEhNDscASRJwahsp8dI6kTUupB+4BRaoVHM/lEs1j99RZ+Ub3p A==;
X-CSE-ConnectionGUID: 5NxMRkB7Thepy3GRUY3oAg==
X-CSE-MsgGUID: OtPmSZeQR06KFmhMmTR3/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="88942484"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="88942484"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 09:05:58 -0700
X-CSE-ConnectionGUID: lLSw7FJ1SAKgg+LyeTowLA==
X-CSE-MsgGUID: LkJTp/TnSlaCsf1lEkhI3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="265371921"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 09:05:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 09:05:57 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 09:05:57 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 09:05:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VyBEs5Lx1Aav9AA0FCxKL5S+H8lGpJO9xmBoIDRE7ToT2urQwAJjfee3w6ENvtldOIWLaf26zKL305IYO/hX1IiqO500ki2UY7QnxGxgsYljvMApTs89fPTvnPBQDjdH7mj2sItoYSlhAY4GfrXI0PhMJdQLAebF7igjjrI+oLMii+JQlV874Y0mXonF+THKGy9SbaAVwKlBh2+rSODisFRJompusPlGlHYo7SG0V5XhPhSViCFX4p6KoaK30KpzEt4x2zlFBYiCLJz6/XpqhKFih4gA+4amnDdNRpGWAcDb2/vDXg6d2Dr/8H+zq+hZ5KSwCmVVOS4QHl57LexovA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qs5KyJo3DBG4UzrdkSiMLlimzzVWDjNTsXBbXLJccoo=;
 b=NUxjClWuiYBoHSgH9Jca7R6YcPh2UkT88wUHkyIzPvGyRkmUezDov028/LE77UZCTTlTjt32lf3p8x+v8qWoZ1n0c3krGFcme2pFZD2jlRKP5Bgw32hzx1lffL4775nNa8JtkmiKG/C9W7XLUsDVkTPBlenL9pOPdmlWWBNO/3HK0mGmRwj0IJOe576sCWalLnDjxANiT3TItUrsvnsR/1IrFJnVA7aovWAbuhkVcnYrTY1cx4nspic1bhpOzW4Z/364/5uAnIV1Ek5KDlZmeqcDRinERUcjF/f+VmedwUmacxNOvEDYfX6jvdlXMghAHWGTYs0GXOZyuTlt6ATIFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CY8PR11MB7688.namprd11.prod.outlook.com (2603:10b6:930:75::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 16:05:51 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0292.015; Tue, 4 Aug 2026
 16:05:51 +0000
Message-ID: <d844500c-5a7a-4a61-814a-1e98b210720e@intel.com>
Date: Tue, 4 Aug 2026 18:05:49 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GVUxMOiBmYWlsdXJlIGZvciBkcm0veGU6IEFk?=
 =?UTF-8?Q?d_structured_SIGID_error_logging_infrastructure_=28rev3=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <178543627755.6317.2918128076010242633@61270ab9df2a>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <178543627755.6317.2918128076010242633@61270ab9df2a>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0176.eurprd09.prod.outlook.com
 (2603:10a6:800:120::30) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CY8PR11MB7688:EE_
X-MS-Office365-Filtering-Correlation-Id: b759a0fa-dd19-4783-ceea-08def242416e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|13003099007|10067099003|11063799006|56012099006|5023799004|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: WGhhgTZdy0N0t93cTKRlCKctyloGWAlHefDQM4+ythn78aBr+96ieJyFsX/Ef9XZEO/1yvxyAbd1gbXiQzAnWA3xsqwrXFehD31v28GC/A+U4sW+e7wZcM4oZwIVLn+fR1XujasgDMyN285y+jXIuX/iprnPYDcdqBqCID1MMyA6Bmt8wuh3GZ4HXP9xNtcQO+DqcG4wogapBl2Gwofk2w4WIVGc/ck+c1DRvI0qop9uSbkzBcOp1sT+Y4OYe6nDKoGQckC5PYN1NEJxZ6xzgrAkM5+9c1/6Cxv5jzuyBo/qcI1LZZZDuNNGnQGrP5CYOrHw4ymVmnKpDbLZ4kNZHzFk/Ntm4dbTIn3SEGXeoSDm0e5uky80AjxrUO/ee9x2KmoRLpqkYPrhS1GmgjDzEkz/V/A5Y74cC2Aw9Mr0bxEsmbB7Uzt/eaFQNU/Xbx1MxSvF0kPpOuUSzbtGwH7OlH27yFbttrQenC5X66aTo0AbMvi6c9LhlwKDTIkMKMBuRrDFmIvjkGeNdJLknFsnBkFTH/OWQDf6yFHspLJZ3Z9S+BxleM/augfvM7jYKNHr5/azuCOCy4ZmV1dhoAnX+CUBhBYfAEjKo2XCNBc8m9c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(13003099007)(10067099003)(11063799006)(56012099006)(5023799004)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWRaenhidUNUNTB6RzVZWkJhOGRCOUN1WXhjSW8rT0l6QkVnanIwczZOVjRy?=
 =?utf-8?B?K3QrZk13UklqdWt5SkVDbmdCUWNCNnU4eXVscjZQaTVxamRpSy9sUjVrbGFo?=
 =?utf-8?B?UFMrZ0k5VE1pcUhFNDE1NFRaYWpPdktPZTVBdkI4alplOCtsdlhsRFpDOXdj?=
 =?utf-8?B?MkFaVEdEelMyMUtVczMraXIxQUduSjFzdDFxVjhOZ3ZuSHdQY21EakdtWGhR?=
 =?utf-8?B?UWRaeWVNT2lud3pzbUFMQW1pYTRNdkxrbnZZTWVlZkZvL1ViS1c0TDNiVi9Y?=
 =?utf-8?B?Vmt2Ti9ScDhIRkpkWk0raUVzYUpROG5seUJjVnFucjRJempFTGs2UjFXbTdU?=
 =?utf-8?B?Q0hKc2s5QkFFMmJYVnBvczErVXNVMFdFNW9POGtkSmJHbnNpUExzK2tZNzRP?=
 =?utf-8?B?V0laK1JrdExUdXNEMjlEblpmb1FkZnZnMytrdjM4WC9KbzhBbW1TMDhMbWsv?=
 =?utf-8?B?RzZXanlRbjBwUEZTZmlKVERhZGxhVjFVYi82Z1BueXo2QUdoYk9KbGI4MEs4?=
 =?utf-8?B?VXB5azZMNFBaQ1d5dXJDV04wOFRQZkt1a0FMdDVtaHUzUHBGMkRoaHE0VXZm?=
 =?utf-8?B?S1gydXdVeTYybU1tU3RJUTlMM3VYeURNazVkTGltSHFZMXVGQ1I4RmlEUVVL?=
 =?utf-8?B?VlA2N0daQTc4SnF1VWEybjZ3K2M4ZURzcWtGN3BlNWoxWlQzNXpVY3daMXJm?=
 =?utf-8?B?WUxEcXN5SG00TUQ2Z29EMXp1QzRCYWdVTjdZQ1FlblpFOHJRZUE1V1llVGpa?=
 =?utf-8?B?VHQ5MG5hRDdjTzljYmhKcVVEK0hlekdOMi9NeFByNi9pcVlkUHVSVnJ2L2tP?=
 =?utf-8?B?UHArd242dzRjemY0eldzWGhlRWNJRThaWTNwaFozUjI5NXNYUVFEU29jZmV6?=
 =?utf-8?B?RzRwR2tjTGlhMnArUExlUnRjbkxHL3Rmclg5QkErL0Rxd0NUQyttTnd2TTh3?=
 =?utf-8?B?eXNOWTdOMHVOZXJDYkdiNUc0ZXlhaTNyZ3FtR1Yrb0xLbDk2cVFxVWFuZHNy?=
 =?utf-8?B?RmliSUNwa2hiOFRYQ0JmaTc1WWx4NWYvN2M0c29DbUdPWHJlNXRXS2RkclpR?=
 =?utf-8?B?UWF0TjhwY242Zk9OSjY5UWVWdlU1QjloUC9sUDBTYWFSZEJBSzZpVlhJeVdM?=
 =?utf-8?B?OTF6cXJDVGxVMXVhNTZqcVR5N0xzSVhCVE8xbWJ4RXFybWtzVmRrMVJmZzM5?=
 =?utf-8?B?K2FBUDN5UzdBQ3plV0JqVFRzbVhZMmt5b1k1c2xQR0ttajVnK2psdTVnSjI4?=
 =?utf-8?B?SUdDajV0SEEreFZYU1BJaXIrK1k4aTNCa1JNb2VnSWN2cXJNeDhNc05HZTZ4?=
 =?utf-8?B?K1hGWXIwRWlPOElqUXBxVjJYQ3BZMmVwZ3RKZW1QeTRIaTdBMERXR0ZpSGxo?=
 =?utf-8?B?SWx6ZmRTN3BZZmFybzhpZmpOQ2JzNHl2Q2dDTXU1azBTTlJsaHYxU1JZQTQw?=
 =?utf-8?B?NHIrcTlIRnZFUlhzZXZrRnRodFNEMk5hYnF3UnU1QlpWdHpMbGVjSElxUWdL?=
 =?utf-8?B?ckxxbURwYlZ0MkJFaEtsNkJHcWY4cVA2NEJ5YnU3V05HQ0NzSFArK2EydjRZ?=
 =?utf-8?B?b0pyeEl2TDVKZ1VNT21MakVjKzFuT3dGc2s2bHVYRVFrOTZYNWxtMzVkRXVV?=
 =?utf-8?B?VVRaUTZnc3RITlhuWEh4bjZOSFJ6d3hGeVFpL0cxSVdoTGdhL2FWUFR5a0dv?=
 =?utf-8?B?Uy90SlU1bnJBSGU1OFkxZXdsdC9LNWhDSkNpL0ZxRTM5akh6V3RBQS9lTjd0?=
 =?utf-8?B?eVdaT3Y4U0hTeTJmWndkY0hydUVNOUVZTU1WL3RzTVAxVGpScVdvaDlnZjlK?=
 =?utf-8?B?dVFiTW43VXJtajcwKzJlNVhWQWtMSXBEWHEwTFgxV1JFMWRpSEJTRDA2Q01P?=
 =?utf-8?B?S2tGVVdjMTF0R1ljNEFQWjlmVW1mc0ZVVnRneTcwRkRYSVFVYTdsQUZYd1lG?=
 =?utf-8?B?eS9OMk44RTh1VndERHJyUElINDVvNUY5eEdKSXB5L2FNR3BpWVBJRkwwQ1RE?=
 =?utf-8?B?MHhMZmdnZ1NyMGRVRExoN1NFakdtS3ZhV01pMEt2SWF0N2oyUmZUbGJpaDEy?=
 =?utf-8?B?TFB6R0ZmRzlZWGJzSDZma3QwUXQzTzhuS1lidXg5WVRsa2xkWkVvRVRLWWVC?=
 =?utf-8?B?MkRhVzVHRTV1RnhzY2c1eE14dzBjb3p6QTRJaFdzcE5rVHA4SmUxMmFLbEJt?=
 =?utf-8?B?Q1dXeUdaSE1zYjVkdkpsc05POHVWNSt6RnNZUVNtWmcvYTBNcUVQc2R6eHF5?=
 =?utf-8?B?SVVuRUNkR21KRGx4ZVgrNjVxOTI2TnhKNllVcHpjWHhuQ2xGMnFBTXdlNGhL?=
 =?utf-8?B?MXN4Yk9QbDhhNGNUM2trNGZ1SnFMTkRiblZkQVRJWmxjVlFMMC9kVytGL3lr?=
 =?utf-8?Q?911O3Abi57k2qn+k=3D?=
X-Exchange-RoutingPolicyChecked: bIcDMYkWGxzKXfWCFfJreprShfBHjPCKguEcD9f4Q6w2g5k6PJ/lyEq1MhBsAq060nGREG29Me7YQcfZMqZGfy00CPEnbdfJE2xGXRc87mckWdXyHR2Vz3ZonobXUB5aHfRhlEv7GNwctJdr4WPuIsVvpCqBjOSmeldRTcx5nP9SuYPaZejl8ieO/BJqP4KlVgrQAMkCfldCdxqYFcBo//WLsF7hXszHyHHViHjmPkSU6Rcsyjl2yq34Rr866w4KRgk1c61rTxB0FVCyBYfe7Xkmf7zf9tHn2UEFAYv2MVx5fgUPe/YpeLxlR7IHZ82mmRObl6x/peZH1SzhvB7i9Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: b759a0fa-dd19-4783-ceea-08def242416e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:05:51.4599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nASW75ha07/0L2qkTsvFJ3Z5n/OGwhF6LuStcLLA7QcsiXb0tnPY7r2Bk/BxlWmHCdD9E+HvEFRZpbIA6xQdnUnA28BaCPVLSBaa2QXx7vk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7688
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



On 7/30/2026 8:31 PM, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe: Add structured SIGID error logging infrastructure (rev3)
> *URL:*	https://patchwork.freedesktop.org/series/171022/ <https://patchwork.freedesktop.org/series/171022/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171022v3/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171022v3/index.html>
> 
> 
>   CI Bug Log - changes from xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd_FULL -> xe-pw-171022v3_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-171022v3_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-171022v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (2 -> 2)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-171022v3_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@xe_exec_system_allocator@fault:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-1/igt@xe_exec_system_allocator@fault.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171022v3/shard-bmg-9/igt@xe_exec_system_allocator@fault.html> +6 other tests dmesg-warn

expected:

<3> [111.971125] xe 0000:03:00.0: [drm] *ERROR* SIGID=107 (-ENOENT) Tile0: GT0: PAGEFAULT: Fault response: Unsuccessful

>   *
> 
>     igt@xe_waitfence@exec_queue-reset-wait:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-lnl-7/igt@xe_waitfence@exec_queue-reset-wait.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171022v3/shard-lnl-5/igt@xe_waitfence@exec_queue-reset-wait.html> +9 other tests dmesg-warn

expected:

<3> [363.718950] xe 0000:00:02.0: [drm] *ERROR* SIGID=107 (-EINVAL) Tile0: GT0: PAGEFAULT: Fault response: Unsuccessful


> 
> 
>         Warnings
> 
>   *
> 
>     igt@xe_exec_fault_mode@invalid-va:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-7/igt@xe_exec_fault_mode@invalid-va.html> (Intel XE#8714 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171022v3/shard-bmg-6/igt@xe_exec_fault_mode@invalid-va.html> +2 other tests dmesg-warn

expected:

<3> [410.514511] xe 0000:03:00.0: [drm] *ERROR* SIGID=107 (-EINVAL) Tile0: GT0: PAGEFAULT: Fault response: Unsuccessful


>   *
> 
>     igt@xe_survivability@runtime-survivability:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-3/igt@xe_survivability@runtime-survivability.html> (Intel XE#6627 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627> / Intel XE#7419 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171022v3/shard-bmg-1/igt@xe_survivability@runtime-survivability.html>

expected:

<3> [206.567349] xe 0000:03:00.0: [drm] *ERROR* SIGID=103 FATAL SURVIVABILITY: Runtime Mode enabled!
<3> [206.576361] xe 0000:03:00.0: [drm] *ERROR* SIGID=102 FATAL (-EIO) WEDGED: Device declared wedged!
<3> [206.585411] xe 0000:03:00.0: [drm] *ERROR* IOCTLs and executions are now blocked!
For recovery procedure, refer to https://docs.kernel.org/gpu/drm-uapi.html#device-wedging
Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new
<3> [206.595229] xe 0000:03:00.0: [drm] *ERROR* SIGID=106 FATAL (-ENOTRECOVERABLE) Tile0: GT0: GT: reset failed
<3> [206.632188] xe 0000:03:00.0: [drm] *ERROR* SIGID=103 FATAL SURVIVABILITY: Firmware flash required!

>   *
> 
>     igt@xe_wedged@wedged-at-any-timeout:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5508-5e24f68d311764bf343f9def49b752b509dfd5fd/shard-bmg-2/igt@xe_wedged@wedged-at-any-timeout.html> (Intel XE#5545 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171022v3/shard-bmg-2/igt@xe_wedged@wedged-at-any-timeout.html>

expected:

<3> [612.887157] xe 0000:03:00.0: [drm] *ERROR* SIGID=107 (-EINVAL) Tile0: GT0: PAGEFAULT: Fault response: Unsuccessful
<3> [612.897972] xe 0000:03:00.0: [drm] *ERROR* SIGID=102 FATAL (-EIO) WEDGED: Device declared wedged!
<3> [612.906894] xe 0000:03:00.0: [drm] *ERROR* IOCTLs and executions are now blocked!
For recovery procedure, refer to https://docs.kernel.org/gpu/drm-uapi.html#device-wedging
Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new
