Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C9DEC41535
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 22:01:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3833610EAA8;
	Fri, 15 Dec 2023 22:01:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C88710EAA0
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 22:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702677715; x=1734213715;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=gPMIe/pCpoJw4nA94u6zpE2n6cQwcbZQ0QsfGSZ1Zdc=;
 b=g6CWcrM7/nipq22yvLwPjcL2+XzwjVeJ143a2PTpHnuJeQfJDYIqIq+/
 fuFZHOiciBnTVby2U24xiFgw94zMj6FkU2MnMvaJYvSixWyspbpEg/8oK
 aYmV806lWW1dUNCXFm7jpoxeXozQKXrRUaKx0J/JS/0L8HEoPjR32uJpL
 HnOe5rMHpKeAj/2oA2LTgdHjxPwCUGzDyRBEFqdqJdRGYnMhVtD6WP5uE
 yuSqjoBDg+gYt3sZBtsv8h0J/B2XNbf9J9tfAlUbgQm/c4RY9JkxGsbae
 fUonxIwEyIlLGwuXEEiNM7JG/4jpCFw9rsZtLXQxIsI1LQvXFjPk3SYnr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="2420498"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="2420498"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 14:01:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="918579758"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; d="scan'208";a="918579758"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Dec 2023 14:01:53 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 14:01:53 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Dec 2023 14:01:53 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Dec 2023 14:01:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KDWmR6l9DCDno4XEnbI3qznMaNPOkmiNcPyBlspnCFCZ+8idOz9AFZUaO+g3aL/7qM8qie8vVdofPaZD9+GKduhVYaS5BwPqBdfRs5wiDKtITcUayxT45s3yf193JwVZFXvb6ZUtarWqT1TBkLJVbNFRa/ZFJVrwF+VsduqmPC+q0Y5/D+3m1gCagEfPYS4i31suq/ErAb/5DGOpleSWeFy9pMOUZRPNKJRCtY4Qr9e1nNiG/MKtYAXPFrORUsdGLS08SqPxEjC7M5f+X+fefX6HDBkk5B2FOptLSOWL7mQBt8usCiuuF6ek4tYNqfz8nXfq55tSvkp2IF+T+fZhmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ys/A4PHSZvwEPbjueWvQi66S1L41gu/92Y+U6gAcoBE=;
 b=l3UNA1H5PTtCH0Oe26R03DzBvqiUMHBB0ugHMswomPxuYGNtth9kZVj9AsVzfye05m2APq9NOGBqnKIIXV/AjMXGbFSEyYECcyjRqvuVWF2jH5FeWmsBqqhwnlVY+LDGHG9Z++escyNCZgu1dQXwUlqJ+BiXwvyRxHQTJU2+jkUMDVSvUEtknTMqwXetH0l0A3ukJ4oOdtmyl+6i551ptcC4ICEoZlopf4lV2zpBP9cXTcnQeCJud/cM5aJmUarbD7NBt9cfMt6/c3beNJrtOuWXxmZ5GQwx05uoEzLHO5qnMaOhKbGSt7iwh6FtAoVchzuOR6RCF3UPbC4ZP4NR5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB3567.namprd11.prod.outlook.com (2603:10b6:208:ed::31)
 by CO1PR11MB4868.namprd11.prod.outlook.com (2603:10b6:303:90::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.32; Fri, 15 Dec
 2023 22:01:50 +0000
Received: from MN2PR11MB3567.namprd11.prod.outlook.com
 ([fe80::1f6e:f008:1c10:e69]) by MN2PR11MB3567.namprd11.prod.outlook.com
 ([fe80::1f6e:f008:1c10:e69%4]) with mapi id 15.20.7068.038; Fri, 15 Dec 2023
 22:01:50 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231215214531.2576215-2-matthew.d.roper@intel.com>
References: <20231215214531.2576215-2-matthew.d.roper@intel.com>
Subject: Re: [PATCH v2] drm/xe/dg2: Drop pre-production workarounds
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Fri, 15 Dec 2023 19:01:44 -0300
Message-ID: <170267770428.87715.4011550722822862006@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR03CA0033.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::46) To MN2PR11MB3567.namprd11.prod.outlook.com
 (2603:10b6:208:ed::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB3567:EE_|CO1PR11MB4868:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e2eba8e-f910-406d-f7fc-08dbfdb9705b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yDO+dNiAKULMJkNYn5uhVnmPebmLbVNQcIdadmbC/uK+y+0DrwmetLoQt05yC0CBFNK+kPou2SuqgFQYz4U2aToVL+W7Ts6OFgf8QFLRK84JhebX7WQGcsc8Hv3y6YbqoP3gJpHWhj+JDuzSMA54AP4cEsZ9A1FVrZvPcL+gjDDj3A77G1PzNL0jj61JYNBc3DEHDbpWLlc/sPzDLAydq1ZiKz8T5CL/k34YNqsO/kauGMt/3oFCwYgUbXr+SNUyS/OrsJisl1E0+WpIKku8/BXafX8M/HD9gIbdVvJpR1zw4wUYqmYC/OE2qS9SdYB97XsoDOCt9JUpTllKsBmjGxQ7UvfSk/Lajj3G0qEZx1df6fkIwqex3SkOVOTac0A6jhUIQHvcL6Lyf6mB29JyX+uQyOSVfZzscqUVysibYV2WL3PnafafcQ84SKWcdw/WZuO2KgvtmjEIpaCyPbUVVxz6cyWspxHrz2sIM8xGbSG8WdDykJCEp7AFMZFQQXSHZxfHivwgU+YaAItIka++hmgBw17KP16rLC/2ifAqkgORF1ExLDqJ7/2/Gxo/pX6J
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB3567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(376002)(396003)(366004)(136003)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(26005)(66574015)(6506007)(107886003)(82960400001)(86362001)(38100700002)(83380400001)(4326008)(5660300002)(44832011)(6512007)(9686003)(6666004)(316002)(66946007)(8676002)(6486002)(8936002)(66556008)(66476007)(2906002)(4001150100001)(30864003)(41300700001)(33716001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnVsc0xKekUrS2YrelpiTDN0ZEs5c2pFWldndnVEaDAzSkZ3eTVFYlhwL3FC?=
 =?utf-8?B?YUZXVFVWNGtmamtjTHVYVXJwSjZLU2MvdExBS1JxT3k1ZnhreHZlQzQvWE12?=
 =?utf-8?B?OVh5Z0hxYU5TVmJMZGp5aE5WMTVvOXR5c25WZ0FSR3lpT2xvODkxTmxvMWRu?=
 =?utf-8?B?N3lJNnVkK3gxZjNtTVJNNklHYk9XS25DUlVtUFJ0ckJ2cTdCM2I0YzJFQkhY?=
 =?utf-8?B?dnBJZnVyWW5wUVpEMnpnWnZMWklGSE9EQUhLL3loSzJDYWVZOXBkTkxsQy9M?=
 =?utf-8?B?NzlsWTRTZVljVXNBSkE4ZzBTbU00cWZZdi84SFlBQnpKc0l4OVFFNkorNVpp?=
 =?utf-8?B?N2NXMHlzYll5cGlUZDJmYkd1YzIralFFUlJ4djFad2gxVzMzeVVHdVRqUFpR?=
 =?utf-8?B?c2FLckg5UU1Wbkw1TVpIYVFGVkxGNm5xbnJCQmc0SnNsbjJQMkZSQlFXWlVo?=
 =?utf-8?B?cWNwb21kUkpYY3JSSFRzVmE3RlNKMGpBNktxSVNqWlpncnJORVJDcUEzZldH?=
 =?utf-8?B?TDZ3ZW1oNUl5UmlhOTEreEtpclgyUmFleXZVQS9neExiK3NvTUR5YjJBUWF0?=
 =?utf-8?B?RGNxSzdYTk5NWEVGK3VnVXF2RHUzSW45L0J4b25wRGFGOWh2QnFFSWdDOEZF?=
 =?utf-8?B?VnJGYnd3WXNXZWdwZU5OTjNXUlhCcEhpU2VSdmdGb2RsdzlwM0tFbysyT0VT?=
 =?utf-8?B?SWFka25mdEFad25aSFlZUnNRMzJ0QlVCb25qdlV6VENZVHY3WlRsTkgvN0VS?=
 =?utf-8?B?UmsyZEoyMWdFL2NINmFHd1kxVHRCeUMxbENZVGdoeWROZjZKVkU4dmw3SWJ1?=
 =?utf-8?B?MVBzM0JsZHBXUngwSERYUjFIWE9PQ2F0bHB6dys4bjR4R1NIL0x4UTlTQm5u?=
 =?utf-8?B?eWJOSk03K2QvRE83K1RrYi9FK3dISm9DWm84WE5JT0praUY3MVloZVBPNXFu?=
 =?utf-8?B?RmdvbmQ4U3hHb2o5aENOL2dNdDdZSk56ckpWTHFVblRIeFRCK0gxTHNyOGpC?=
 =?utf-8?B?dlgzbTMyN0hVU1pNMk1uYnhXb0JjSXJsV0RaR25oWjJUN25EQUFrZnRITkw1?=
 =?utf-8?B?ZjlBUTFYbVovcXJOYktSRnlRK1VFWEllcTFjSGVoTXBUcUl3N1dOMlZCbktX?=
 =?utf-8?B?MnVlMzVyN0hOQjVheVpncjNLckNWSFhqRmFLcUpiY21sOGIyZDJ5WmtIZVhC?=
 =?utf-8?B?TzVIVzcwZ0Y3dGNNaVhibjZweFVuQlo0TU5aV0ttdFJVejVzZDdGLzUvMlFx?=
 =?utf-8?B?K0lBZGhkVC9hMmpkY1oxaWgvd0IxWXVpYzBqNFlaL080QnMvYS9CQWhzMFkz?=
 =?utf-8?B?cjk1UEIzMGlOdmFEYTV6cGNqdHZ6Mng5N0N6eHBRY01iL1VKOVJGWmpMbEhE?=
 =?utf-8?B?eElEQjc0eWxacXp1eFFmanAzTkh6VURxSzM3NjI4ZFNvZmthZGVocWxVZkk5?=
 =?utf-8?B?S3VFWDZyeFNMeC9Oa3hHMDZPdkFkWHNjeXZWWDBUeWsxSGIwQkxjMUtsbFFk?=
 =?utf-8?B?ZURMeWo0eUk5UW9TeWJTaE5oVTJMYXIvUVMwbG4xVUF5QnBmTHpaZGNxNjVw?=
 =?utf-8?B?dUdBd2ZFcXRISE04MlMxTG1va0tCTy9vNFJGY0llcGpYRTZ4eWtzNDBVc0Rz?=
 =?utf-8?B?em9aYlhLdWo4cDZlRU1nUVg0S3dMME5nOHlNb1ZBN0tmNXUxcWZBWUgvKzNs?=
 =?utf-8?B?bWIzejVZeXNaU2lrejhHTkdIRzFScFlwYzc1VHVTQVQ4OXg5OHdBei9aQ2or?=
 =?utf-8?B?RmQwa1FyNVBGTGdINDg3aS9lejVWQndKaVJsVndkNm5kU2hWRzZqcVEvQ01P?=
 =?utf-8?B?aTRTNytLUVEzdjdHYW8zOFRiTDd3dDZZOEV3NTN2bVRUUnp2eWxJaGoyQ2Ux?=
 =?utf-8?B?aDZ1cWFGSEpkZGUvd25BbEx4eHhDMklDRTVVOEp2dmV3MXFKVmJTa0dYU2wy?=
 =?utf-8?B?OTBza2xteW1QWXk0TXh5eWVqR1RDQkNZNTdGOXlROVh3dGZ6SVFzQjRIZmtO?=
 =?utf-8?B?WXlVWHhGWGRSYXdQQlU0c0twQkorZFVhOTExWVF5VXA4Y3BpT05XZXZrSmdx?=
 =?utf-8?B?UkVCS1RUN2d1NkZVeklXQ0VicldRTnAzN0VIdW80cGRvK3dCcmU3K2cxZGh2?=
 =?utf-8?B?SmJBeCtLRlRtczZYSHE1THVjbW8wSTdNcDREQWs5NWJhTmIyVlJMeUFJVy9J?=
 =?utf-8?B?eFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e2eba8e-f910-406d-f7fc-08dbfdb9705b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 22:01:50.3057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z/YMcIwJlo5uE1S8GgD3XHybC5n7r3cmWcxNAD7QBzformh721ac6mHAICMKYG2JRWtXfgAp5AVMs61CwQZnHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4868
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Matt Roper (2023-12-15 18:45:31-03:00)
>Pre-production hardware is anything before C0 (for DG2-G10), before B1
>(for DG2-G11), or before A1 (for DG2-G12).  Workarounds specific to such
>hardware was already removed from i915 in commit eaeb4b361452
>("drm/i915/dg2: Drop pre-production GT workarounds") and there's even
>less value keeping these around in the Xe driver.
>
>v2:
> - Drop Wa_14011441408 from xe_mocs.c.  (Gustavo)
> - Drop Wa_14010648519, Wa_14010198302, and Wa_1608949956 which were
>   mis-implemented; they were only supposed to apply to early steppings
>   of DG2-G10, but were being applied unconditionally on all DG2.
>   (Gustavo)
> - Drop reference to Wa_16011620976; the implementation stays because it
>   still matches Wa_22015475538.  (Gustavo)
>
>Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_guc.c        |   8 +-
> drivers/gpu/drm/xe/xe_mocs.c       |  23 +---
> drivers/gpu/drm/xe/xe_wa.c         | 174 +----------------------------
> drivers/gpu/drm/xe/xe_wa_oob.rules |   7 +-
> 4 files changed, 5 insertions(+), 207 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index 482cb0df9f15..76b31d542e1a 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -133,13 +133,10 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>         if (XE_WA(gt, 22012773006))
>                 flags |=3D GUC_WA_POLLCS;
>=20
>-        if (XE_WA(gt, 16011759253))
>-                flags |=3D GUC_WA_GAM_CREDITS;
>-
>         if (XE_WA(gt, 14014475959))
>                 flags |=3D GUC_WA_HOLD_CCS_SWITCHOUT;
>=20
>-        if (XE_WA(gt, 22011391025) || XE_WA(gt, 14012197797))
>+        if (XE_WA(gt, 22011391025))
>                 flags |=3D GUC_WA_DUAL_QUEUE;
>=20
>         /*
>@@ -150,9 +147,6 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>         if (GRAPHICS_VERx100(xe) < 1270)
>                 flags |=3D GUC_WA_PRE_PARSER;
>=20
>-        if (XE_WA(gt, 16011777198))
>-                flags |=3D GUC_WA_RCS_RESET_BEFORE_RC6;
>-
>         if (XE_WA(gt, 22012727170) || XE_WA(gt, 22012727685))
>                 flags |=3D GUC_WA_CONTEXT_ISOLATION;
>=20
>diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
>index ef79552e4f2f..d205d684d809 100644
>--- a/drivers/gpu/drm/xe/xe_mocs.c
>+++ b/drivers/gpu/drm/xe/xe_mocs.c
>@@ -290,18 +290,6 @@ static const struct xe_mocs_entry dg2_mocs_desc[] =3D=
 {
>         MOCS_ENTRY(3, 0, L3_3_WB | L3_LKUP(1)),
> };
>=20
>-static const struct xe_mocs_entry dg2_mocs_desc_g10_ax[] =3D {
>-        /* Wa_14011441408: Set Go to Memory for MOCS#0 */
>-        MOCS_ENTRY(0, 0, L3_1_UC | L3_GLBGO(1) | L3_LKUP(1)),
>-        /* UC - Coherent; GO:Memory */
>-        MOCS_ENTRY(1, 0, L3_1_UC | L3_GLBGO(1) | L3_LKUP(1)),
>-        /* UC - Non-Coherent; GO:Memory */
>-        MOCS_ENTRY(2, 0, L3_1_UC | L3_GLBGO(1)),
>-
>-        /* WB - LC */
>-        MOCS_ENTRY(3, 0, L3_3_WB | L3_LKUP(1)),
>-};
>-
> static const struct xe_mocs_entry pvc_mocs_desc[] =3D {
>         /* Error */
>         MOCS_ENTRY(0, 0, L3_3_WB),
>@@ -409,15 +397,8 @@ static unsigned int get_mocs_settings(struct xe_devic=
e *xe,
>                 info->unused_entries_index =3D 1;
>                 break;
>         case XE_DG2:
>-                if (xe->info.subplatform =3D=3D XE_SUBPLATFORM_DG2_G10 &&
>-                    xe->info.step.graphics >=3D STEP_A0 &&
>-                    xe->info.step.graphics <=3D STEP_B0) {
>-                        info->size =3D ARRAY_SIZE(dg2_mocs_desc_g10_ax);
>-                        info->table =3D dg2_mocs_desc_g10_ax;
>-                } else {
>-                        info->size =3D ARRAY_SIZE(dg2_mocs_desc);
>-                        info->table =3D dg2_mocs_desc;
>-                }
>+                info->size =3D ARRAY_SIZE(dg2_mocs_desc);
>+                info->table =3D dg2_mocs_desc;
>                 info->uc_index =3D 1;
>                 info->n_entries =3D XELP_NUM_MOCS_ENTRIES;
>                 info->unused_entries_index =3D 3;
>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>index 5f61dd87c586..7d6b86d602c8 100644
>--- a/drivers/gpu/drm/xe/xe_wa.c
>+++ b/drivers/gpu/drm/xe/xe_wa.c
>@@ -125,13 +125,6 @@ static const struct xe_rtp_entry_sr gt_was[] =3D {
>=20
>         /* DG2 */
>=20
>-        { XE_RTP_NAME("16010515920"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10),
>-                       GRAPHICS_STEP(A0, B0),
>-                       ENGINE_CLASS(VIDEO_DECODE)),
>-          XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F18(0), ALNUNIT_CLKGATE_DIS)),
>-          XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
>-        },
>         { XE_RTP_NAME("22010523718"),
>           XE_RTP_RULES(SUBPLATFORM(DG2, G10)),
>           XE_RTP_ACTIONS(SET(UNSLICE_UNIT_LEVEL_CLKGATE, CG3DDISCFEG_CLKG=
ATE_DIS))
>@@ -140,61 +133,6 @@ static const struct xe_rtp_entry_sr gt_was[] =3D {
>           XE_RTP_RULES(SUBPLATFORM(DG2, G10)),
>           XE_RTP_ACTIONS(SET(SUBSLICE_UNIT_LEVEL_CLKGATE, DSS_ROUTER_CLKG=
ATE_DIS))
>         },
>-        { XE_RTP_NAME("14012362059"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
>-          XE_RTP_ACTIONS(SET(XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB))
>-        },
>-        { XE_RTP_NAME("14012362059"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0)),
>-          XE_RTP_ACTIONS(SET(XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB))
>-        },
>-        { XE_RTP_NAME("14010948348"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
>-          XE_RTP_ACTIONS(SET(UNSLCGCTL9430, MSQDUNIT_CLKGATE_DIS))
>-        },
>-        { XE_RTP_NAME("14011037102"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
>-          XE_RTP_ACTIONS(SET(UNSLCGCTL9444, LTCDD_CLKGATE_DIS))
>-        },
>-        { XE_RTP_NAME("14011371254"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
>-          XE_RTP_ACTIONS(SET(XEHP_SLICE_UNIT_LEVEL_CLKGATE, NODEDSS_CLKGA=
TE_DIS))
>-        },
>-        { XE_RTP_NAME("14011431319"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
>-          XE_RTP_ACTIONS(SET(UNSLCGCTL9440,
>-                             GAMTLBOACS_CLKGATE_DIS |
>-                             GAMTLBVDBOX7_CLKGATE_DIS | GAMTLBVDBOX6_CLKG=
ATE_DIS |
>-                             GAMTLBVDBOX5_CLKGATE_DIS | GAMTLBVDBOX4_CLKG=
ATE_DIS |
>-                             GAMTLBVDBOX3_CLKGATE_DIS | GAMTLBVDBOX2_CLKG=
ATE_DIS |
>-                             GAMTLBVDBOX1_CLKGATE_DIS | GAMTLBVDBOX0_CLKG=
ATE_DIS |
>-                             GAMTLBKCR_CLKGATE_DIS | GAMTLBGUC_CLKGATE_DI=
S |
>-                             GAMTLBBLT_CLKGATE_DIS),
>-                         SET(UNSLCGCTL9444,
>-                             GAMTLBGFXA0_CLKGATE_DIS | GAMTLBGFXA1_CLKGAT=
E_DIS |
>-                             GAMTLBCOMPA0_CLKGATE_DIS | GAMTLBCOMPA1_CLKG=
ATE_DIS |
>-                             GAMTLBCOMPB0_CLKGATE_DIS | GAMTLBCOMPB1_CLKG=
ATE_DIS |
>-                             GAMTLBCOMPC0_CLKGATE_DIS | GAMTLBCOMPC1_CLKG=
ATE_DIS |
>-                             GAMTLBCOMPD0_CLKGATE_DIS | GAMTLBCOMPD1_CLKG=
ATE_DIS |
>-                             GAMTLBMERT_CLKGATE_DIS |
>-                             GAMTLBVEBOX3_CLKGATE_DIS | GAMTLBVEBOX2_CLKG=
ATE_DIS |
>-                             GAMTLBVEBOX1_CLKGATE_DIS | GAMTLBVEBOX0_CLKG=
ATE_DIS))
>-        },
>-        { XE_RTP_NAME("14010569222"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
>-          XE_RTP_ACTIONS(SET(UNSLICE_UNIT_LEVEL_CLKGATE, GAMEDIA_CLKGATE_=
DIS))
>-        },
>-        { XE_RTP_NAME("14011028019"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
>-          XE_RTP_ACTIONS(SET(SSMCGCTL9530, RTFUNIT_CLKGATE_DIS))
>-        },
>-        { XE_RTP_NAME("14010680813"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
>-          XE_RTP_ACTIONS(SET(XEHP_GAMSTLB_CTRL,
>-                             CONTROL_BLOCK_CLKGATE_DIS |
>-                             EGRESS_BLOCK_CLKGATE_DIS |
>-                             TAG_BLOCK_CLKGATE_DIS))
>-        },
>         { XE_RTP_NAME("14014830051"),
>           XE_RTP_RULES(PLATFORM(DG2)),
>           XE_RTP_ACTIONS(CLR(SARB_CHICKEN1, COMP_CKN_IN))
>@@ -212,10 +150,6 @@ static const struct xe_rtp_entry_sr gt_was[] =3D {
>                              INVALIDATION_BROADCAST_MODE_DIS |
>                              GLOBAL_INVALIDATION_MODE))
>         },
>-        { XE_RTP_NAME("14010648519"),
>-          XE_RTP_RULES(PLATFORM(DG2)),
>-          XE_RTP_ACTIONS(SET(XEHP_L3NODEARBCFG, XEHP_LNESPARE))
>-        },
>=20
>         /* PVC */
>=20
>@@ -376,13 +310,6 @@ static const struct xe_rtp_entry_sr engine_was[] =3D =
{
>           XE_RTP_ACTIONS(SET(VFG_PREEMPTION_CHICKEN,
>                              POLYGON_TRIFAN_LINELOOP_DISABLE))
>         },
>-        { XE_RTP_NAME("22012826095, 22013059131"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(B0, C0),
>-                       FUNC(xe_rtp_match_first_render_or_compute)),
>-          XE_RTP_ACTIONS(FIELD_SET(LSC_CHICKEN_BIT_0_UDW,
>-                                   MAXREQS_PER_BANK,
>-                                   REG_FIELD_PREP(MAXREQS_PER_BANK, 2)))
>-        },
>         { XE_RTP_NAME("22012826095, 22013059131"),
>           XE_RTP_RULES(SUBPLATFORM(DG2, G11),
>                        FUNC(xe_rtp_match_first_render_or_compute)),
>@@ -390,28 +317,11 @@ static const struct xe_rtp_entry_sr engine_was[] =3D=
 {
>                                    MAXREQS_PER_BANK,
>                                    REG_FIELD_PREP(MAXREQS_PER_BANK, 2)))
>         },
>-        { XE_RTP_NAME("22013059131"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(B0, C0),
>-                       FUNC(xe_rtp_match_first_render_or_compute)),
>-          XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, FORCE_1_SUB_MESSAGE_PER_F=
RAGMENT))
>-        },
>         { XE_RTP_NAME("22013059131"),
>           XE_RTP_RULES(SUBPLATFORM(DG2, G11),
>                        FUNC(xe_rtp_match_first_render_or_compute)),
>           XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, FORCE_1_SUB_MESSAGE_PER_F=
RAGMENT))
>         },
>-        { XE_RTP_NAME("14010918519"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0),
>-                       FUNC(xe_rtp_match_first_render_or_compute)),
>-          XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW,
>-                             FORCE_SLM_FENCE_SCOPE_TO_TILE |
>-                             FORCE_UGM_FENCE_SCOPE_TO_TILE,
>-                             /*
>-                              * Ignore read back as it always returns 0 i=
n these
>-                              * steps
>-                              */
>-                             .read_mask =3D 0))
>-        },
>         { XE_RTP_NAME("14015227452"),
>           XE_RTP_RULES(PLATFORM(DG2),
>                        FUNC(xe_rtp_match_first_render_or_compute)),
>@@ -428,21 +338,11 @@ static const struct xe_rtp_entry_sr engine_was[] =3D=
 {
>                        FUNC(xe_rtp_match_first_render_or_compute)),
>           XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, UGM_FRAGMENT_THRESHOL=
D_TO_3))
>         },
>-        { XE_RTP_NAME("16011620976, 22015475538"),
>+        { XE_RTP_NAME("22015475538"),
>           XE_RTP_RULES(PLATFORM(DG2),
>                        FUNC(xe_rtp_match_first_render_or_compute)),
>           XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, DIS_CHAIN_2XSIMD8))
>         },
>-        { XE_RTP_NAME("22012654132"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, C0),
>-                       FUNC(xe_rtp_match_first_render_or_compute)),
>-          XE_RTP_ACTIONS(SET(CACHE_MODE_SS, ENABLE_PREFETCH_INTO_IC,
>-                             /*
>-                              * Register can't be read back for verificat=
ion on
>-                              * DG2 due to Wa_14012342262
>-                              */
>-                             .read_mask =3D 0))
>-        },
>         { XE_RTP_NAME("22012654132"),
>           XE_RTP_RULES(SUBPLATFORM(DG2, G11),
>                        FUNC(xe_rtp_match_first_render_or_compute)),
>@@ -461,68 +361,11 @@ static const struct xe_rtp_entry_sr engine_was[] =3D=
 {
>           XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
>           XE_RTP_ACTIONS(SET(ROW_CHICKEN2, DISABLE_READ_SUPPRESSION))
>         },
>-        { XE_RTP_NAME("14013392000"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0),
>-                       ENGINE_CLASS(RENDER)),
>-          XE_RTP_ACTIONS(SET(ROW_CHICKEN2, ENABLE_LARGE_GRF_MODE))
>-        },
>-        { XE_RTP_NAME("14012419201"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0),
>-                       ENGINE_CLASS(RENDER)),
>-          XE_RTP_ACTIONS(SET(ROW_CHICKEN4,
>-                             DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX))
>-        },
>-        { XE_RTP_NAME("14012419201"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0),
>-                       ENGINE_CLASS(RENDER)),
>-          XE_RTP_ACTIONS(SET(ROW_CHICKEN4,
>-                             DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX))
>-        },
>-        { XE_RTP_NAME("1308578152"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(B0, C0),
>-                       ENGINE_CLASS(RENDER),
>-                       FUNC(xe_rtp_match_first_gslice_fused_off)),
>-          XE_RTP_ACTIONS(CLR(CS_DEBUG_MODE1(RENDER_RING_BASE),
>-                             REPLAY_MODE_GRANULARITY))
>-        },
>         { XE_RTP_NAME("22010960976, 14013347512"),
>           XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
>           XE_RTP_ACTIONS(CLR(XEHP_HDC_CHICKEN0,
>                              LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MA=
SK))
>         },
>-        { XE_RTP_NAME("1608949956, 14010198302"),
>-          XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
>-          XE_RTP_ACTIONS(SET(ROW_CHICKEN,
>-                             MDQ_ARBITRATION_MODE | UGM_BACKUP_MODE))
>-        },
>-        { XE_RTP_NAME("22010430635"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0),
>-                       ENGINE_CLASS(RENDER)),
>-          XE_RTP_ACTIONS(SET(ROW_CHICKEN4,
>-                             DISABLE_GRF_CLEAR))
>-        },
>-        { XE_RTP_NAME("14013202645"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(B0, C0),
>-                       ENGINE_CLASS(RENDER)),
>-          XE_RTP_ACTIONS(SET(RT_CTRL, DIS_NULL_QUERY))
>-        },
>-        { XE_RTP_NAME("14013202645"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0),
>-                       ENGINE_CLASS(RENDER)),
>-          XE_RTP_ACTIONS(SET(RT_CTRL, DIS_NULL_QUERY))
>-        },
>-        { XE_RTP_NAME("22012532006"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, C0),
>-                       ENGINE_CLASS(RENDER)),
>-          XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7,
>-                             DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA))
>-        },
>-        { XE_RTP_NAME("22012532006"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0),
>-                       ENGINE_CLASS(RENDER)),
>-          XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7,
>-                             DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA))
>-        },
>         { XE_RTP_NAME("14015150844"),
>           XE_RTP_RULES(PLATFORM(DG2), FUNC(xe_rtp_match_first_render_or_c=
ompute)),
>           XE_RTP_ACTIONS(SET(XEHP_HDC_CHICKEN0, DIS_ATOMIC_CHAINING_TYPED=
_WRITES,
>@@ -652,21 +495,6 @@ static const struct xe_rtp_entry_sr lrc_was[] =3D {
>=20
>         /* DG2 */
>=20
>-        { XE_RTP_NAME("16011186671"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0)),
>-          XE_RTP_ACTIONS(CLR(VFLSKPD, DIS_MULT_MISS_RD_SQUASH),
>-                         SET(VFLSKPD, DIS_OVER_FETCH_CACHE))
>-        },
>-        { XE_RTP_NAME("14010469329"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
>-          XE_RTP_ACTIONS(SET(XEHP_COMMON_SLICE_CHICKEN3,
>-                             XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE))
>-        },
>-        { XE_RTP_NAME("14010698770, 22010613112, 22010465075"),
>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
>-          XE_RTP_ACTIONS(SET(XEHP_COMMON_SLICE_CHICKEN3,
>-                             DISABLE_CPS_AWARE_COLOR_PIPE))
>-        },
>         { XE_RTP_NAME("16013271637"),
>           XE_RTP_RULES(PLATFORM(DG2)),
>           XE_RTP_ACTIONS(SET(XEHP_SLICE_COMMON_ECO_CHICKEN1,
>diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa=
_oob.rules
>index 727bdc429212..e73b84e01ea1 100644
>--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>@@ -1,13 +1,8 @@
> 22012773006        GRAPHICS_VERSION_RANGE(1200, 1250)
>-16011759253        SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)
> 14014475959        GRAPHICS_VERSION_RANGE(1270, 1271), GRAPHICS_STEP(A0, =
B0)
>                 PLATFORM(DG2)
> 22011391025        PLATFORM(DG2)
>-14012197797        PLATFORM(DG2), GRAPHICS_STEP(A0, B0)
>-16011777198        SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, C0)
>-                SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0)
>-22012727170        SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, C0)
>-                SUBPLATFORM(DG2, G11)
>+22012727170        SUBPLATFORM(DG2, G11)
> 22012727685        SUBPLATFORM(DG2, G11)
> 16015675438        PLATFORM(PVC)
>                 SUBPLATFORM(DG2, G10)
>--=20
>2.43.0
>
