Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE3DFF8855
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 19:02:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02A810E576;
	Tue,  5 May 2026 19:02:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aNPSCkMR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF65010E576
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 19:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778007745; x=1809543745;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Od8CeOKfvALnLxy0YFor5wckPuOerrYSJdMwmwOg7e4=;
 b=aNPSCkMRL+w1oKIqayq9o08n874yX1k2BabK9zBfmJvi2gMTqAP7im1M
 mzXvH9wvjzB3xaPua1DLA2dMYbNEb7+EU2D/DIZtkoSQti59ZZtrM0X57
 xjTfJDZX8QhOiwv2h144zhTv71Gf6TpJnc/zWaTZSvp4x7r4ShzcyVA95
 FMTQxhC8UT0sIPf96ll55Tu0TcUqLprn8QxiEArstsq8K2tpTAaxJab0I
 VlM4xqMK7lzjHM1+IEVYDg5Ebw7ZfgK8+PSv3DL2kWfqi7lw0vCgCe753
 Ju/+OHlV2aSwy54z+wP7D2D2QHXPdLN8te6P+nsviqt43JhGtIYeJyt+k Q==;
X-CSE-ConnectionGUID: ZffiLliAREGMb9p1OIxi8A==
X-CSE-MsgGUID: P4I7Kr+MS1ymvTJHyWw1mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78828811"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="78828811"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 12:02:24 -0700
X-CSE-ConnectionGUID: bvllQ8hOTxuybEBgtlrQiw==
X-CSE-MsgGUID: Ra8PMq9DS+SRpvV/sjnNWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="229411704"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 12:02:24 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 12:02:23 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 12:02:23 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.37) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 12:02:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YGHp/xHVeWMz3w+jfIa9ayKyTFtkGNvt5yKbG5mbdi/26UrFJFFLFVter7WsQ9zuYo2xAmwTLyuThUjVDiedF/ccaThFbt1AQIXDBHM348incjU4a8C7wJ7RRrvJ+6EzoSfR2jxOkDihAZ50UqNVxu6LIalXa7ughTmyR7r0svs6PH+TpKEDenRTPAZsnyO6BQdiy+FiiSall1yHzLxZqyy1uja0kqrU5vxM89xjzjz3aQ3QAosbvbw4TRI/5+4cvSyhzkzO8oAzONsb0JH8ORMcyU5ysxHpE9fypHNJGZphi3jnnsxBZ8+agRdAj4u+MMTqwDqsWGigt+DlVn7pjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5bjWhIhhfxNyvc+T5aTI/7ofvsxqtPvRjv/PqNe9TSc=;
 b=aYycrP05TNzDK4zOdsk+c8EkCwx76dRLjHAOCFcF3WuAc8VUrwRI8JzkJGK2cpg1TenaXKVYzPes0zXSlerEBeuDkR/YXb24LqsjwohMykC9zZr5TDb7Jvd6unnAr/8vRSw5pxFn58gQtQ2B3dDWi5n/2uA+lMSLPHRf1+C8Lrp8pVYsF+iB5XZNGCbNId4A36i7Zho/h1ehMnJCw3gpLXVkSNerw3KXiZWjdih2ym3MlIOAbv4HTpnJGjccMLgp85ZsEzO88AxdWEv5N33I5RE76MdT//QVtYR4+DSqZ5ncNSUxOR9af8BAmaXPZvylt4EIdBwBpbtN5ffjWtwjww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SN7PR11MB7708.namprd11.prod.outlook.com (2603:10b6:806:352::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 19:02:17 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 19:02:16 +0000
Date: Tue, 5 May 2026 15:02:12 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>
Subject: Re: [PATCH v5] drm/xe/xe_survivability: Simplify runtime
 survivability error handling
Message-ID: <afo-tJeBJXBHKk2d@intel.com>
References: <20260504110300.1467303-2-mallesh.koujalagi@intel.com>
 <afosyMxQb4IdeRcp@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <afosyMxQb4IdeRcp@black.igk.intel.com>
X-ClientProxiedBy: SJ0PR05CA0193.namprd05.prod.outlook.com
 (2603:10b6:a03:330::18) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SN7PR11MB7708:EE_
X-MS-Office365-Filtering-Correlation-Id: 95093101-8036-4629-6a93-08deaad8d301
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: +2whRnn7467+bxab23N1WwZtFZEJOcDR4G3xHchDjFYugNaBR8a/6BKRZR2uZ6hCTZFxkptXM4ykQiqBJXYne2wOgNYCnxvoUZX8lSVfOiIG0w9Hn4aLuSqMOVopGq6dgE6nv5JsNWOIx7Lld2N3Kr9PEi8d2Ffq+3wPVvAI27t0Aze613Mn1qpxTdj7bcx/+SBzFDiqIPnuTekUZOYJXqA+kpbuLT90Ue3e+pBvgmPebTymqbZoBaKKxMI9crx76edXEH+Pgxg2AehmRxGduohfWUaVmg4PeZTXTIAZ+hzthPjufYRqnZHvqqwf2FmJSKbj5vkF0xuEzM2cKJ7jYmxt+LKQCkSvuI5rTpoYG5jBDafdJcdcFbqFKes7Q3fELlfaM7nak9INSGMr8ed//kB2yeqmT6E0InV0P9BP54eLdM9VuYIS5CXsu/pW+YpLSMCd/q3YW0rErGzKUJ0fAxdaC5BcC7q+WdSnX13ctXvmj0mjRBo7W+aEWn6ZJhQVcfJSS3nr1piYfaIjkfhKK1MB4z6qbSOb05WkJSi5lx9m8J1xNw2hzQXD9U5ysiRXLN8OauqIsazrsUa8QWbNPHiX2SMKYkDQJJsYYuLO12wU1152tbNVQUSZrAe4oq2y7HTUlzpwFf7+BkR767R9GtUhjxO619mO8kP5j0nvMSSOUdhcmjiiqZH96FWKxs0A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fCfN3tQ/7qdgoX+8MXMHK9y5vR/4xdKyix793ycVRdwctCT/y3haixpX5F/V?=
 =?us-ascii?Q?qaMr2Uc0A+tb6uXAZygp97xpVE4NwZiaPVG1KR+GJinJOYDLHBJG1VH6VKol?=
 =?us-ascii?Q?yo/mqo6smwnZi+5LHJrD6IHrI+ih/4tUE39yjbFrTE2QwGJKFqhIejXxx3Zo?=
 =?us-ascii?Q?iXkOtE94PDLtCKZWIg5OhfLMj8SAC64vq5cObitHwj3MLUfQC1TqxzPisBiD?=
 =?us-ascii?Q?b8nBZsWHPXAyyfPfYj5RuimRMFcO+hFExOADmB7OzI1dQflb+9vXNRmZJWtg?=
 =?us-ascii?Q?vEyT3E7DcW5AHgs5sWemSFWmCV620KLoqWYF+fpFP0nL0Td6JaKOPpr28ije?=
 =?us-ascii?Q?xyuXbooeE0oviglHFICbDgyYVB70LXRFCll76X+FBIqtZutqhQcojWeusGQT?=
 =?us-ascii?Q?gIxqyNeCfpn7DcdOO9K68VTAHEf05O/0ImaN8GMdMgTmFWwAhklxak0h0YcB?=
 =?us-ascii?Q?WMU9iho+LnsEejjUx3mRs4blqRhtXZ9z5WU/5jd+QyVrCa5/r4EjN/vVXteg?=
 =?us-ascii?Q?zFL1/raFU+VUU3s1cD/6b5WM7uRqy2L21WVSGc4FSEtNAupwb6y5XhSqD96C?=
 =?us-ascii?Q?Js6jaUxTjfGoP/tsXwUUy+wVgnG/+bBuPaGUVSIPbZVvGyN8wk63I1Znk2qZ?=
 =?us-ascii?Q?7tZVE01nT6fyhKnOOtnsCyiKdel0Qr/2RxvXdWQeW9qNCfRuxLTd0J6yOf7j?=
 =?us-ascii?Q?1Rnvd/BXYnsRwlxXkilyemmtgsNNU4C06b/UN9C0N7JEo3SV5dsEswL+1asI?=
 =?us-ascii?Q?3Y52jzQCRFcxxE0gy7+YGfUrwvQuMslHAPjxVRhNMm2JTi4h5OeyALMU/6MK?=
 =?us-ascii?Q?lJGYBVn8w4mjjV4w18FXdswkuX3zI8GW1qDOmfjYHn1EoLIoYUiBu/AYZYTv?=
 =?us-ascii?Q?iQKkh2GqX3h+TCcxyYLV25pSnnlsrYDzveC+mIyJELWnk+/5OWVHuBVNSSRF?=
 =?us-ascii?Q?kIzuaW6QIJloIys7RbD9F4lTkQQRrWPiY83PkqoubeKY9PYvEWOPQ91oelr0?=
 =?us-ascii?Q?u5lRU+Y6lijfxmiJERMVOEYJDv2EMX9fta2W+vmxSwqK9Y3/5ufx8jDqnPtX?=
 =?us-ascii?Q?9ZoSN7BIlEuOfKiIJIB/L5+4+/Gd9JjoM7AM2/51lXfquTz/Wz+hx2Hjly6K?=
 =?us-ascii?Q?XHCMH7Y35kMXm1i9/BH2Iyp7swSvSVBIJICdYiOZWDT6hAxNezrG0yChZNEE?=
 =?us-ascii?Q?Ua8Z8eH8rWl3rr9AH1LqZGYLaZYlFHT1HUhMiGguLlMV5rTTkjyB+b4+ZO8h?=
 =?us-ascii?Q?0MPBEdCguE89VRcOT8jiK8VBK6bWA4L8r9MkodHCo4gn2x61ezKLtWoQc2dL?=
 =?us-ascii?Q?hIFFuDsjAB2hXNa7o3/ZtVlLVlpNh2+5zDLJrgL/XSjYJUnCwKTNjqnbZNn7?=
 =?us-ascii?Q?GNJ0bbYIqTy9Vm9w7CAjrKQuvMN4HQrNv3DNZpD4FqMZdyAYvL/T9clB55q9?=
 =?us-ascii?Q?IXRTdGw3NRqwKeQZAgaTtcojb7q09uTeRcz/6tjCKdC5XfQnu4riBGQDA8e7?=
 =?us-ascii?Q?UL0VIRRAJi11jqPJdfSXszp7es70Hqx8JIc90grmYqsjm322ZSEQurB7lwnB?=
 =?us-ascii?Q?mh4kOBGBgpVA1MD87GATPJsgBG/BSkMCYOlqOT8PnIU3UA9hZSG+wO/600nP?=
 =?us-ascii?Q?lUv/ERGBU7q8ggdVvmR0IA2L4INVOw5nWophhS9IAqqp5vXOoaxIEtBZdqoA?=
 =?us-ascii?Q?vmHiVfnNxq/2I2JJQLA9JiRqbLCK5Br3mJa6aJ4ayO2bolWsppQYt/aozGza?=
 =?us-ascii?Q?P4aWpSN8mQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: ciYbDXoXAF9oMec7XqircJelQj3u3ViNeqBqndkxrWjfugwLuXvOKKjvJu+4YVHzDln7SgLa+VZpId8j6gBRFxDBz207YCG+wDYuzQS12QZBiXK7iUtMBVjGDLUyGg05TVnTWglga69JqhfzOKMLCsmZ1VPxPyLDZf0xx2+g41ggyqtPTWs+lgQr0BWgZi2t8e3Wwz2RqlZx+F5OWckIAtKGi55WCaGvIY9xmwtBJ68OAGp99Igtwr56RoYuOC2G5O/FbSk62iYI386GB3KBzMYLfRKDsULe/jrBgP2hZ83VB8g8OI+Fl6aleWFwq/Qj+MHAqMBdSY8FH6kn+yMWmA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 95093101-8036-4629-6a93-08deaad8d301
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 19:02:16.6345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rpFefkPWxP0SZjcmQguQOYJ72SWOXgEtKRhmAQr1wmXBzVfduBtu/ii3F0TtiaVu4iXkg3kC4WkBLstve2ClkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7708
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

On Tue, May 05, 2026 at 07:45:44PM +0200, Raag Jadav wrote:
> On Mon, May 04, 2026 at 04:33:01PM +0530, Mallesh Koujalagi wrote:
> > xe_survivability_mode_runtime_enable() returns an int, but its caller
> > csc_hw_error_work() ignores the return value and cannot take any
> > meaningful recovery action on failure. The function logs errors via
> > dev_err() and proceeds to declare the device wedged regardless of
> > sysfs creation failure, making the return value redundant.
> > 
> > Change the return type to void and remove the unnecessary
> > error handling in the caller.
> > 
> > v2:
> > - Return is not require after the sysfs creation fail. (Rodrigo/Riana)
> > - Change int to void return type. (Rodrigo)
> > - Remove extra message from csc_hw_error_work().
> > 
> > v3:
> > - Remove ret variable. (Raag)
> > 
> > v4:
> > - Drop ret variable from other part of code.
> > 
> > v5:
> > - Reframe as refactoring instead of bug fix. (Raag)
> > - Remove Fixes tag and update subject line.
> > 
> > Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> 
> Reviewed-by: Raag Jadav <raag.jadav@intel.com>

pushed to drm-xe-next. thanks for the patch and reviews
