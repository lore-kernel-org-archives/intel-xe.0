Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00306C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 07:58:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8850E10E378;
	Mon, 15 Apr 2024 07:58:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c1HIZljH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E71B10EA71
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 07:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713167884; x=1744703884;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5w0RHTncOMHq2MnQrlPBgJRYn4eqW8rP65noYM3uy/0=;
 b=c1HIZljHPjQP7zz6/glXtz9uTLARCinQMGq7asOobM09ZJWwon+1gWZI
 1ZkcVxaTADpQ6/X+m2DQzLjmQrM0eIsQOQrph9iWz3AxW2mBJYAjIuLqR
 te5Knl0Iv8WKKesKQnlgZuLuCL+/yAuLGZtTpvd2DConUQV2BkHsvxdEE
 AijPpPBsSHWQY8xasgEV//1ng9PKEVs3rztAAIqT+q4NfSm38YlUBQObo
 4LYDyX6r/qAQ2BY5MM6r/BqCFMrgmzTdZVDMkl+AwcoVDeEIWjQ3+K/y3
 vXKyRT+749HhjLCkBJd49vLgN460IdP6AUVM4H3D4TUwwP7wADCIWSp7r A==;
X-CSE-ConnectionGUID: UOf0TjmgTWiltQ4ByxY4Jg==
X-CSE-MsgGUID: NGs7GVizRxuZnYG0zwhuWA==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="12322525"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; d="scan'208";a="12322525"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 00:56:58 -0700
X-CSE-ConnectionGUID: PctBVnqGQSSwHFtUFP+wPQ==
X-CSE-MsgGUID: 3hUnd2JSRfmWKBIB+6eBNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; d="scan'208";a="26475713"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Apr 2024 00:56:58 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 00:56:58 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 00:56:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Apr 2024 00:56:31 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Apr 2024 00:56:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XX97fQk09VEnQgUOHoWX6x8WlAu5twfcWO1G5ab7uQp1m4tMWrfwE8tFcsHr7/fnTGzQHYeze6ZcMOfj6pAnZmy9zviuFIa4btjihyLSYNd/TLbu3rgbOeMDfv4aSv+PVfyKAVQqfC8DI24Qbs3yVgxBqaSc+vbDtAVUbV4U25yS9sQqTgeRw3VtMDSvArn+SXa0l/o6WLEBQNe2iHYilr/XZXyjJq/9S88PX4M5pa191c0Q9Mco1oPKXeZbkachK8j8B5yX/kFp4lT9O7LiNJkU3x9UFoUgciSkUTxvXLbriesolTeKImdRnQKypTRI+AsWij7A6VLSgR9butqiMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s2S8J/fQAxZwylh++edMeLT2oz+Qc6DjILK9/wsHTyk=;
 b=ja2JggajoDcXvhwhBumFa5POZhaVdfTbFg73i09ZTQdgAXVrBQG55B16CJEWMeizRikcgnpk40tGn1PlfKvL57cWM4YLVLEoVwpxFo7jRS/vKio55A9zECAPZOHpphthOP9HuPUGYUuna1pmprmJNQaDF11n4wqPJr/+wqyJWlYf+hIxPRCa6dbPsmzYIXk8XG+qZNiEnEZzTkL5SYP3WmuaIcUj5/Awl6QdORC0RtvWDfDa0++L4IT4uhg1ezJyO+yGKQpTGVUBIzCOGuUUzxB+919+XExyV+CLI4fuO+zotBDIhtUdI82vm7cDJtGw668Sf5PvsZ5FoQby7PYOmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by BL1PR11MB6026.namprd11.prod.outlook.com (2603:10b6:208:391::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Mon, 15 Apr
 2024 07:56:29 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7472.027; Mon, 15 Apr 2024
 07:56:29 +0000
Date: Mon, 15 Apr 2024 09:56:27 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/6] drm/xe: Add helper to format SR-IOV function name
Message-ID: <20240415075627.ctbcxxwk6jwuhk7p@intel.com>
References: <20240414190137.1243-1-michal.wajdeczko@intel.com>
 <20240414190137.1243-2-michal.wajdeczko@intel.com>
 <42834d9b-f8ab-4206-800e-72222613b83e@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42834d9b-f8ab-4206-800e-72222613b83e@intel.com>
X-ClientProxiedBy: PA7P264CA0082.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:349::16) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|BL1PR11MB6026:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cae7501-8e3c-4448-ea05-08dc5d218f19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BDScN0HhkYATByMX87juHauvxtLFIZPNHkszCwljUlxBQDR7tNXPgUiaoSK2fj7f/iskKrv0P0FhugAUhf4kosqu5zP2uuPvc2xUCdOxwbIV0SqqEBpNYVWzDtGnNeO84JAPdbiIkJQ9mmsp3AupeWgfRiPFnsJ0QsuUgY0mSASPD2eFPsNkH993iHne9eOaHfqpKAIe02MDBYRfmh0qhvZE7qxtciFTlevHG/p/kB0k+JDYwFRbSkdPbRpvP8jjjXGJ7VePGiP9de4trI3TVYwqN6th9HOX/c89ZeIBxdadoTMzKdDUJ0CeY87r75WCsVAI8ZUeufKxmeissuibDxjZegGC6z9LNca6qzlK5yQ17Jd09ZOswpt+zlOqJ99piikZTEXTGvr+0na/R9XCEe4Zi0MIimMQWbnSZdkPS0SycowXN7FCIANyTvDuanXU6nkIsLfmvhI26ONOght3SnV0js2009U+cz4Bi7QpXRdjJE2dFe0egcnmyqbMdvL7Kq1hPd8+S2ziCfV02t1uuyXUiliijMOA7AAGUEfk8+fICYGlnOQLOmXGwZVA3dvKXbx0yY6xogpVOPrFJfeXA45RrZY3ffNyiH5afAhVVU0O2y7Rzu4LUvFEYFraf1g0WbBxwuH4sJurImMjAigHQiSipW1UNgDhciW1rYUHhgg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWFoUHNhSnNsdG5yTnRmSTBDK3Vhc0tXcWFRdkM1VDgwUmpPS1pzZGZ1Q1pT?=
 =?utf-8?B?dE44Z0gvNk42eDgyaks3Q0w1QlhCWndaM293Ty9adVMweFdiSGVDckNXSDRP?=
 =?utf-8?B?TmI3YXJvK0RVak82c2xYVFlRVkpUcEdubXhacFpMMXBmWW5WeW1kdW9zZmdJ?=
 =?utf-8?B?L1N3eEFtb0hXZFVDVFJzWk14ZytrOEhUR3pnZHIzWHlmZ2VkQkhrY0I2M2ps?=
 =?utf-8?B?RFA5c3Z5M2lWM0VFZFZvYTdZcVoxSEwrcFlUSXZaOXJJeWlvYlFpT2lHYWR6?=
 =?utf-8?B?Y2hiNjJrTi9GdW9aTXczOCtwcE9INHdQdWpMY2NKREUrVG9yTldoUUtST0FR?=
 =?utf-8?B?NzUzZERWWGcrQnAwbUNHZWtsZ2Rkc0ZOZGVURkwrUU9DTXZYMXQ3NjliSWVZ?=
 =?utf-8?B?RUhjVFIyNjF6WkFHNEh4S0dxTkx2V3lMMENlY0VkMnVSTVlZMHJJYmx0S2pF?=
 =?utf-8?B?UnFmeG0vYTlkdjVISzM4dWkrQ3lFNE0yVnhERnlPbUdHWFdkSnVYNHJzZ2lu?=
 =?utf-8?B?ejczN0dha1VDbHh0UGpQOThSWFQzNytJclo0QzlLZEZTWi9NTzFEYzFJVHM5?=
 =?utf-8?B?VGpWSUpPVTVXV0lCTktvV0lHWDluUzRPYjNBeXlUc054cUt3ckFER2k0MHow?=
 =?utf-8?B?MnR4M3VsRHVLQWxrWk8ydHZrOEJSWGtuaURXeXlETWpYaXo3VXZMTGNud0ln?=
 =?utf-8?B?cGE3WDZLTnRiVk1PWVZGeXFKTVBSZGtaaURnejVvS3BhL2JFdFJBcU1Cc2lL?=
 =?utf-8?B?NjQ4MFl4WnQzRmFvdkxXRGR2WFVpOHNYdkUrSzVFMkwyUGxsODlBTU54aVpq?=
 =?utf-8?B?ZHRrY2RWeXczdnd1ZndmeUV1T1pIa1JRUWkvQzVPSHJZNzVaK1UzU1NMeHo3?=
 =?utf-8?B?STRYZlRLWXRPeGNEVlNmL1lDSlFLVmFEWEtueGhqVmZ4VURUamoyL3dKY256?=
 =?utf-8?B?Z2xidFJTdG9XdzV0SjNudDBoenB0TjRvNVRYa2FGMXUwN2FKemhjcFpZWFJJ?=
 =?utf-8?B?UTUwdFRrRnA0YVgvVncrZmZuS083dHJ5aERGM3dYalFpeEs4OGdXQzRrWHVy?=
 =?utf-8?B?cnhBcXdQc2VwdXZkRG5JUmtwVU9KQXJmZ0tWdGhTWDUwekZjbEtaN3RoVlRY?=
 =?utf-8?B?aDFoWVBuT3g3Mnlkek1jckFaRFJhajY2WlFzd0ZQaGJVT1puak1iNmU2NmpR?=
 =?utf-8?B?RkFWeWdoOXVpV2daaGJFQ2pyQ2lRM01QZkdGWnpDMWlkYVN3aUdSNXNhQWFJ?=
 =?utf-8?B?SDdIaVFNcmdYdmFjdnBNOWxlZ3JJM0llR0c4RjVDRHFaemU2UE05czVnd2pM?=
 =?utf-8?B?Uk01YVdpM0lCZzZLcmU1dWF6aU8xRG5haTNjZGk2bzcxREFaSkhOUStTKzlr?=
 =?utf-8?B?aHcvb1ZTQXJEY0xIeFBzZnFRUE51NUpIaDJFTXp4eXowOVlwZWdsT2x6dHVo?=
 =?utf-8?B?ZkZHQXhwZHd5blZYY0hTbzIxZUlzcVB3NFhhbmRqSWw2QjJVcU5hdmNLejZh?=
 =?utf-8?B?aStDY0x4MmtyNk9GbERtMFgzclozSlh4cXY3TDNJNTN5eVhwWWp3RlcvVjdh?=
 =?utf-8?B?RmZ4SHRxQXpMa0dQZDBBN0hWbUtqZjZsWGU3NmFmbzZxcDRDMno3RHZPUFZ1?=
 =?utf-8?B?QXVJNmtxK0t3TU00eGZHZzFVNmRvVFI0d3BNNDhIMGNsL01Bd2JCM0kzZ0px?=
 =?utf-8?B?ZFJoTHIwVTVVUTYwVUJvRG11MG81cWt2dUh0WlFGNnVzSEwxZmZmaW1XbjZD?=
 =?utf-8?B?ZXZZNjhFWEQrZlRUYUZjOGNaYWhxRS94TVZLa2d2UFpjVDhULzlEaks2MjZB?=
 =?utf-8?B?K1dscFFrK0NCRHdqalo4RFdDZWZTMW02TENEWEVYbmVDV0dNQmUvQ05GeFo3?=
 =?utf-8?B?MWFQdi9VUENmQUk0WmJhRWsxb0ptYlBqUG0yUzk2SDhiSERncTAxQ2NUK2Ja?=
 =?utf-8?B?NEtsaG41MTEvelFaYVVlWnMreWF2MHY2dUxJZVEwYnUrUnpxUWRTNXFocDZJ?=
 =?utf-8?B?elk2c3FubnBDREVtaXBkUjMwbFlRdUVrMTJnQnZYa0FVdUNwQjFwVVRrOElO?=
 =?utf-8?B?MU5keW1pWVhlaU1laHBmTnBFMEtqLzVEZGR5eWRFM1MrNTZsd0hzQllkaFZR?=
 =?utf-8?B?VGVNZzFwY1JJS3JoT3QvaTQyeHUwdzU2K0V5Uy84VWE3c0FmVW11dFEzdjlq?=
 =?utf-8?B?T3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cae7501-8e3c-4448-ea05-08dc5d218f19
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 07:56:29.8064 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Uv8jiaBDCYsi87n7cWcOSa/rKxe0o1taFsfpiD8kDbe7kCGGZerlHEgQYZg7kTzBQo98+98MYZOKpPFP472PPdxyoB4x1/p9kE1qVByoPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6026
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

Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com> wrote on pon [2024-kwi-15 09:17:27 +0530]:
> 
> On 15-04-2024 00:31, Michal Wajdeczko wrote:
> > While the GuC firmware and the Xe driver are using VF identifier
> > VFID(0) to represent the Physical Function, we should avoid using
> > "VF0" name and use proper "PF" name in all user facing messages
> > related to the Physical Function and use "VFn" name only when
> > referrinf to the true Virtual Function. Add simple helper to get
> > properly formatted function name based on the function number.
> > 
> > Signed-off-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_sriov.c | 17 +++++++++++++++++
> >   drivers/gpu/drm/xe/xe_sriov.h |  1 +
> >   2 files changed, 18 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> > index 1b40f5de9ef5..1c3fa84b6adb 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov.c
> > @@ -122,3 +122,20 @@ void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p)
> >   	drm_printf(p, "enabled: %s\n", str_yes_no(IS_SRIOV(xe)));
> >   	drm_printf(p, "mode: %s\n", xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
> >   }
> > +
> > +/**
> > + * xe_sriov_function_name() - Get SR-IOV Function name.
> > + * @n: the Function number (identifier) to get name of
> > + * @buf: the buffer to format to
> > + * @size: size of the buffer (shall be at least 5 bytes)
> > + *
> > + * Return: formatted function name ("PF" or "VF%u").
> > + */
> > +const char *xe_sriov_function_name(unsigned int n, char *buf, size_t size)
> 
> nit: It is not necessary to return a |buf|, so |how about void instead of
> const char * ?|
> 
> |With that LGTM.|
> 
> |Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com> |

I'm guessing that this function returns a pointer to be able to use this directly
in printf kind of functions. I am ok with this:

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> > +{
> > +	if (n)
> > +		snprintf(buf, size, "VF%u", n);
> > +	else
> > +		strscpy(buf, "PF", size);
> > +	return buf;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
> > index f9dec84d77e3..486bb21c3256 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov.h
> > @@ -13,6 +13,7 @@
> >   struct drm_printer;
> >   const char *xe_sriov_mode_to_string(enum xe_sriov_mode mode);
> > +const char *xe_sriov_function_name(unsigned int n, char *buf, size_t len);
> >   void xe_sriov_probe_early(struct xe_device *xe);
> >   void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p);

-- 
