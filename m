Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68F8D0E6C4
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 11:18:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD4910E3D0;
	Tue, 25 Nov 2025 11:18:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fHkZITXr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE8AC10E3C3
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 11:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764069504; x=1795605504;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YN1IB5LzZ5ef2/zcLcsCI8CSgM9gneVKMPNp15V+7PE=;
 b=fHkZITXrSKIKX1HNXv28xDAE1tugP044pR8wBZVhQNiS1CddRhGhg3nD
 ozb6GXCbif1fCEKIRcOa+9gn94zHqE7oxpZ9Rd4xNmLzrKb4fTHjNmNjS
 M/NgRTv0kqGrwlR+7xYfe3PRUaPEiSFOSxhEIxr7mF4pT7IybeK2Tay9H
 3H5sY3pziVOOOrqEOlBwsC/+Pk6QuLNphczNvRiTrKa/S4hoblxh8fSz3
 a+GL3bfVNoOhVQ4Zifs/Quqd+qurgUTcGx3JDIHj3pwb42NW8BZFDCLxy
 svS+5soWQDMiZIIYNx2aAUwrIuMtqQm43ehrYID7BsIj105kkPw0VDUQh w==;
X-CSE-ConnectionGUID: I4iuel5xSzG7zzGPv2+lVw==
X-CSE-MsgGUID: 8ICDW92xQxC68GDVrqMJog==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66245396"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="66245396"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 03:18:24 -0800
X-CSE-ConnectionGUID: dbWk1uGsRrWE/7ZJmy2Kpg==
X-CSE-MsgGUID: tCS/RbFuS9CzwlPF7/VuXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="229887074"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 03:18:24 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 03:18:22 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 03:18:22 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.59) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 03:18:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cpinhjg1RCFl1VClAYRrIm8J+hOA/vq+9DAeAi6Qc0ajQ7RFgFVp5U3B5OdAJ5rCSHuxivhgrAYU0Ai04GnnTKPjhp8C82yx6NZSXjEfJH34gyrmUEhW4c+1UMgVCWxtx22sAnXYYQPJUUn+POWRk8ehONtv352uGqLbkH+7PFbxYRKPCsaD0d5JPSXBw/QFgMGvJoP5XPQSrrm1JkBgAD2UFXgYzK/wEt68uhF+ru43bjrwU68rLRJEbbDsfJH8eGgoQadAZYJPQuaXE+E7b1MfgIcJBl83u3ns9eGt7xTSQQLhEZ82pptKp3AdUDOgkJORYQoHtUOaaIenlm1zVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNTNnJX1bBmGeQtcU63Ei7MehPGZqPEMF/yCPg2fxGY=;
 b=xwZhj6XWRI+FmjOEkDBS7ko8p3gEyoxUpGwPkfnSIFQGKpWbtYGseb/t0DHeZbnsn/1JhOdTUUzMGCtjsjHOgQIC6KX+rsxe6xfNFp4p4fBat7slcKB9Hth+Hk8xyR039JhKuWJ5nCAEejS/wpFAD1kn6fxduswfK3B45N+wWp8nHnYTz1hOWfLqANlRRI6OidynPJVHDVrFGTsFNX06TFxgS7e1w82Bq4t9bF2LDongj6tGXDiSMjIakpnu5zZm5VEr002kXnpLUYqZomQjLni9ZbnyLjLDonOLqFDuM4yHDQfuUv91AXCPXk74cxWwFm5CtSs4dALEhZ/cYl9jiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by IA4PR11MB9371.namprd11.prod.outlook.com (2603:10b6:208:56a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 11:18:19 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394%5]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 11:18:19 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH 06/11] drm/xe: Create page reclaim list on unbind
Thread-Topic: [PATCH 06/11] drm/xe: Create page reclaim list on unbind
Thread-Index: AQHcWGqafCc1cGxJfkCPRCmuyqMP+bT/GKGAgAM0OFA=
Date: Tue, 25 Nov 2025 11:18:19 +0000
Message-ID: <SA1PR11MB883987BC9C5A7FCAE239C273AAD1A@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
 <20251118090552.246243-7-brian3.nguyen@intel.com>
 <aSIMb4EREPix3SDK@lstrano-desk.jf.intel.com>
In-Reply-To: <aSIMb4EREPix3SDK@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|IA4PR11MB9371:EE_
x-ms-office365-filtering-correlation-id: db97f8c3-8bbd-4217-2f26-08de2c145670
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|10070799003|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?bms3RakGfnjiEvRZae+eKZ0dgNfoag7IfV65bz6zFPYZURh3/XpkFFKWRl0m?=
 =?us-ascii?Q?ABkmcnAdcTdIZ/SqN/JcVjm+L1SNL6UIPn0LLOUmJTbJ4OlpHd7WfCFvZeQO?=
 =?us-ascii?Q?wwVeLoFP/YG0Qak8kmPuYzrENYabdGFylPDwmcnJmqfPiy0dV5Ae2w6mrYre?=
 =?us-ascii?Q?WugmPfw6ig2iNN9Udo7kigVWbsjrMB+qZYLPCpJxDwvQkv76wxeqb+W3Cyuw?=
 =?us-ascii?Q?5ZVM5A9x4i1zch1/OkEtVYOq2MRNfaGWzCLczYDjA+qfI1eE0NV/oyXA508A?=
 =?us-ascii?Q?o82gdg1xQP81lYdFfVonLI1sK+aqyMggskscoSu6V20Zd1xJ+gsLTLgLJmTi?=
 =?us-ascii?Q?HGEakqYI6mR1Cg6oOJsfhWZNGKiWyPH5lng4k1vjfwZ/8DETUKR/9w4JAo/w?=
 =?us-ascii?Q?2oLNPDA89PjHbJQtxy4Vrr6w+O17oOD00Qd3txRDs5/h+pypGrsj4pqVq1cl?=
 =?us-ascii?Q?PqTW3W/h3/lP4KmZ1hNTSH4ffLjt7S7jSglbIaUcUyiceI1aYsuieVM+u/t2?=
 =?us-ascii?Q?Hk3QyDUo89B4LBkEJc3B/u9EelNU36nwNkaS9BBeQWC5MQHESDfGRqPuHFE6?=
 =?us-ascii?Q?sNbAyuFQDpeOx8C0unzKjR4FObuwP4TJj435u1hvk+pWux/uZ2+aVY/7j0ik?=
 =?us-ascii?Q?TaocmuFomYPL0zUZcAYKqQ25VRnP0YrYqaQ1Pk01VqHJgGUwFyDQFq8Ohl4Q?=
 =?us-ascii?Q?PmRgbJoQAVMhWBFH/HJ938y0ZLMD4CjFZh8uNMY1GEWVp/bllYWE2LFUVU3a?=
 =?us-ascii?Q?U9tCoOfrAoE8a6j8wY5juHkFOd8vDFvJ4Mt3cbTW8lzgS7WQqFItwyrt+xfe?=
 =?us-ascii?Q?yX4KvcOIhVSLDtJz6t5n81SO5t7lmRQrv1S3o/xEqfex4QMDr7UL9vp98tOa?=
 =?us-ascii?Q?PwzCzW5h5HCxG7laF0+P5Go1z7r7VSQ45e3P9d8z+i1Mp3ImXzSrJ7wCigFY?=
 =?us-ascii?Q?9JC2Q3l3FvB32tBl8Y9WUxEIGcdhcArsk3DhhC82x1AGwN8VRnMp0hiqtB3X?=
 =?us-ascii?Q?DGZLFtRoedDw8fdKmL7ceFQVOEzmkWtx7wwUwLUNa52Bm8YXK9NL4Ft7CCqE?=
 =?us-ascii?Q?aArC5ltXEbXAd9cGKYax/D1020X0TNW3J6becMu7tNjyUi3xu/tXBkJeKvcU?=
 =?us-ascii?Q?e4iQGTv+gGbisegFGbFHciCzRQ3g3O73hb+hvt+4sa5Wf/twbUaf8V7ji6oB?=
 =?us-ascii?Q?PlBjrjR2tACOGMCNmc5p1zhehXmuAFnibE7JB7VBCjNIlsG4ui4sOVpaK7NA?=
 =?us-ascii?Q?fG3qBgcF6tU+st5bluNW1VAXNoPcwEkWFJCdmRSSAoTLp97JiZBs+/P3s0az?=
 =?us-ascii?Q?o+lJPboWyS80QH6xbIiODVtFcbSBUiijXARW9GJVSXaGC4OXEB4/vA0l+tUv?=
 =?us-ascii?Q?/zXfwDUQC6wNEVO+LfKXGpSegICV1wHk7NBB6ECWb+lwYtidcO4djBgfY+NW?=
 =?us-ascii?Q?uH2LDZTCkUTIXCKlGe4eP1k5tJ47zoYs6hxBbftUalWLeoavwkN4S/YdjTAX?=
 =?us-ascii?Q?+/eRM2jxbKsQOYX6lMWjnbtmTD9bT9U/+o7F?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?P4T+75i6Q3CU35tUChX2vMFW92CP4Oo46bOgwXyM2LgjfalRlH3q6+uoUCiz?=
 =?us-ascii?Q?5sLMperHb0AGNOAfDBALqF+U/F0BMjFOo4UjG4AYfzMqqFLLHdid/TU8JRlC?=
 =?us-ascii?Q?fxjbONRAETOC6Jo0zOCTY1XhMr5PCBIEqqwqDQzwjEE5Y/ZiQH16FU1Elja1?=
 =?us-ascii?Q?QoRtvKe9kVakvWMKTdTNMKc+GOI1UAdUoLFGI0QL+oEpTrfQ1EF7CUubpny9?=
 =?us-ascii?Q?Zqgm7IB3MzqLkbU7a/EyYY8/yPl3SaV23Z8g9fW+Ik8KS8f460iyixKuXqdZ?=
 =?us-ascii?Q?wyImLB11MWWz38b5wLH6iLM4cQLUAU0km4d2k9f73W/R+nyX6oBr1DqipEBS?=
 =?us-ascii?Q?zmEjQKiZaoHAivbIWqamyGLWIpoi4hqPRx14e79XiPDYNlxrxpSgr7EB2dhL?=
 =?us-ascii?Q?6hPSPoqT11LiRop+zPiMX7ghmpcvh3fBwM9G8LPdCc9JYc05PZ2RJYgQ7fTR?=
 =?us-ascii?Q?YjPJeBu2WfgsReMpgY6uffh04JvWyEAoS3KSLdZZhMutnYxdMdxuMJmw577e?=
 =?us-ascii?Q?Red4gSIC6XDPalWAY++SA6iM0GeyJBKxU0jNcoGgfvpqGaVeAxBpIyUCvSdQ?=
 =?us-ascii?Q?CifUbNgVSfYnVBUo3gVopJEaB/T9/ri1jC8CMnuwJlIMAGs7Wja+iVATVTwO?=
 =?us-ascii?Q?hlDvD/1UXGaAaATyll6FEJQGDFCUFeVlNKWjNL97rqsClMSTOrVy/7PNijcW?=
 =?us-ascii?Q?ixkR6EN+z/yyODOBtDrt0UcNhM73dx2bD+7fOYHoZ5bIo/JfVfoLjUOPU5xr?=
 =?us-ascii?Q?mc0AM7fcNETLfMMHg8TOmc42RZKp0J24z+YKqAzuZmdQlzdsw1wcRJZ1QXIe?=
 =?us-ascii?Q?IoZ9TvF5nsSMmt5SsHWrpFcgTHYs0+gURKeH8Ix2hoP+n3Me9fhj2dmG1Gu6?=
 =?us-ascii?Q?+JT5Z/IOql8AjmsCIYJhQ26dJdPEyU08NPfmpn++vFDC5N+Mq/EVSVxNEEpY?=
 =?us-ascii?Q?pgyCnUwVkMfCWuzqqc/EVeU+JfQZa/kUeJmpUmYvBHeZ4ljd/iJyoect3aff?=
 =?us-ascii?Q?bRSl50co/LJKhL8vjsz0w7ApnF2espZFwAd1DgV7vcL4X41zY8ZCt1pbz2KV?=
 =?us-ascii?Q?f6BM3zO8IEA42uWOSZwd+wEpIv72V1qO4Hv1GZTNhu/i9eqhuJTccO/nkjKI?=
 =?us-ascii?Q?aNhh8GBhlZwJIfAnAWC3ZIQEMQyxwGnzB9fBM5snj0xBY+5wW21VLxVnXu8x?=
 =?us-ascii?Q?0NYdyIPdRcJ/Ifh3TKX1xaQ/F42kOz8XvPaq2AZy5d+gu1FMV/zTOMHv+mp5?=
 =?us-ascii?Q?oFq2Pm2yq0tyEgSpRv2qxm2fCympatoDi8YSQsX0bJTfghf0lNdKuiurt9Nm?=
 =?us-ascii?Q?BcQKe7tuhl8vablyBAY0bjvt+C0qAEVEgreGcWnhUQy2oP4jvQe0v1GY2pcl?=
 =?us-ascii?Q?wJYt0/AHTm1c5q1n3ndI1tcJQ0eoLmRvA1IhfVUtAjKMzJARUh1BNmoyVx5f?=
 =?us-ascii?Q?nttWzcKQY5fSeqUcyRIAgun3i4zVMv0vB2WBkjsOistoj3rY1NyPxD9od83L?=
 =?us-ascii?Q?p6srwWKqeLL+PmoOk9+Jr+0WUpEYVeZ3QtLcKRtMZ/nxwHJ+HusF+B7o0O0T?=
 =?us-ascii?Q?aq2siR5uf9zsdpk16MCph6zNTWUbx13ApRs5qEnVy2IqgPcOZk53oyNEoCqq?=
 =?us-ascii?Q?bLXueCt1NSDzT1O6CihQG0lBMpxdQ01rrES4Y9IN8t1k?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db97f8c3-8bbd-4217-2f26-08de2c145670
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 11:18:19.3985 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f8u+jIzwFxYWgm/P9mPbG2oMSPSWWN96vSZKDpoTCR056wfW+Bq9GdLi62wJect9b0sowW1JtMbb2Y0k2dL+4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9371
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

On Saturday, November 22, 2025 11:18 AM, Matthew Brost wrote:
> On Tue, Nov 18, 2025 at 05:05:47PM +0800, Brian Nguyen wrote:
> > Page reclaim list (PRL) is preparation work for the page reclaim featur=
e.
> > The PRL is firstly owned by pt_update_ops and all other page reclaim
> > operations will point back to this PRL. PRL generates its entries
> > during the unbind page walker, updating the PRL.
> >
> > This PRL is restricted to a 4K page, so 512 page entries at most.
> >
> > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile           |   1 +
> >  drivers/gpu/drm/xe/regs/xe_gtt_defs.h |   1 +
> >  drivers/gpu/drm/xe/xe_page_reclaim.c  |  52 ++++++++++++
> > drivers/gpu/drm/xe/xe_page_reclaim.h  |  49 ++++++++++++
> >  drivers/gpu/drm/xe/xe_pt.c            | 109 ++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_pt_types.h      |   5 ++
> >  6 files changed, 217 insertions(+)
> >  create mode 100644 drivers/gpu/drm/xe/xe_page_reclaim.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_page_reclaim.h
> >
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index e4b273b025d2..048e6c93271c 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -95,6 +95,7 @@ xe-y +=3D xe_bb.o \
> >  	xe_oa.o \
> >  	xe_observation.o \
> >  	xe_pagefault.o \
> > +	xe_page_reclaim.o \
> >  	xe_pat.o \
> >  	xe_pci.o \
> >  	xe_pcode.o \
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > index 4389e5a76f89..4d83461e538b 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > @@ -9,6 +9,7 @@
> >  #define XELPG_GGTT_PTE_PAT0	BIT_ULL(52)
> >  #define XELPG_GGTT_PTE_PAT1	BIT_ULL(53)
> >
> > +#define XE_PTE_ADDR_MASK	GENMASK_ULL(51, 12)
> >  #define GGTT_PTE_VFID		GENMASK_ULL(11, 2)
> >
> >  #define GUC_GGTT_TOP		0xFEE00000
> > diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c
> > b/drivers/gpu/drm/xe/xe_page_reclaim.c
> > new file mode 100644
> > index 000000000000..a0d15efff58c
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
> > @@ -0,0 +1,52 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright (c) 2025 Intel Corporation  */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/kref.h>
> > +#include <linux/mm.h>
> > +#include <linux/slab.h>
> > +
> > +#include "xe_page_reclaim.h"
> > +
> > +#include "regs/xe_gt_regs.h"
> > +#include "xe_assert.h"
> > +#include "xe_macros.h"
> > +
> > +/**
> > + * xe_page_reclaim_list_invalidate() - Mark a PRL as invalid
> > + * @prl: Page reclaim list to reset
> > + *
> > + * Clears the entries pointer and marks the list as invalid so
> > + * future use know PRL is unusable. It is expected that the entries
> > + * have already been released.
> > + */
> > +void xe_page_reclaim_list_invalidate(struct xe_page_reclaim_list
> > +*prl) {
> > +	prl->entries =3D NULL;
> > +	prl->num_entries =3D XE_PAGE_RECLAIM_INVALID_LIST; }
> > +
> > +/**
> > + * xe_page_reclaim_list_alloc_entries() - Allocate page reclaim list
> > +entries
> > + * @prl: Page reclaim list to allocate entries for
> > + *
> > + * Allocate one 4K page for the PRL entries, otherwise assign prl->ent=
ries to NULL.
> > + */
> > +int xe_page_reclaim_list_alloc_entries(struct xe_page_reclaim_list
> > +*prl) {
> > +	struct page *page;
> > +
> > +	XE_WARN_ON(prl->entries !=3D NULL);
> > +	if (prl->entries)
> > +		return 0;
> > +
> > +	page =3D alloc_page(GFP_KERNEL | __GFP_ZERO);
> > +	if (page) {
> > +		prl->entries =3D page_address(page);
> > +		prl->num_entries =3D 0;
> > +	}
> > +
> > +	return page ? 0 : -ENOMEM;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.h
> > b/drivers/gpu/drm/xe/xe_page_reclaim.h
> > new file mode 100644
> > index 000000000000..d066d7d97f79
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_page_reclaim.h
> > @@ -0,0 +1,49 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright (c) 2025 Intel Corporation  */
> > +
> > +#ifndef _XE_PAGE_RECLAIM_H_
> > +#define _XE_PAGE_RECLAIM_H_
> > +
> > +#include <linux/kref.h>
> > +#include <linux/mm.h>
> > +#include <linux/slab.h>
> > +#include <linux/types.h>
> > +#include <linux/workqueue.h>
> > +
> > +#define XE_PAGE_RECLAIM_MAX_ENTRIES	512
> > +#define XE_PAGE_RECLAIM_LIST_MAX_SIZE	SZ_4K
> > +
> > +struct xe_guc_page_reclaim_entry {
> > +	u32 valid:1;
> > +	u32 reclamation_size:6;
> > +	u32 reserved:5;
> > +	u32 address_lo:20;
> > +	u32 address_hi:20;
> > +	u32 reserved1:12;
>=20
> This is wire interface with the GuC. Bitfields can based on endianess of =
the CPU. I
> know this is a iGPU feature for now but it could possibly change in the f=
uture, with
> that, to future proof can the layout of this be setup via defines / macro=
s?
>=20

Sure, I moved over to the typical FIELD_PREP/GENMASK macros used elsewhere
for the guc interfaces.

> > +} __packed;
> > +
> > +struct xe_page_reclaim_list {
> > +	/** @entries: array of page reclaim entries, page allocated */
> > +	struct xe_guc_page_reclaim_entry *entries;
> > +	/** @num_entries: number of entries */
> > +	int num_entries;
> > +#define XE_PAGE_RECLAIM_INVALID_LIST	-1
> > +};
> > +
> > +void xe_page_reclaim_list_invalidate(struct xe_page_reclaim_list
> > +*prl); int xe_page_reclaim_list_alloc_entries(struct
> > +xe_page_reclaim_list *prl); static inline void
> > +xe_page_reclaim_entries_get(struct xe_guc_page_reclaim_entry *entries)=
 {
> > +	if (entries)
> > +		get_page(virt_to_page(entries));
> > +}
> > +
> > +static inline void xe_page_reclaim_entries_put(struct
> > +xe_guc_page_reclaim_entry *entries) {
> > +	if (entries)
> > +		put_page(virt_to_page(entries));
> > +}
>=20
> Kernel doc for static inlines.
>=20

Added.

> > +
> > +#endif	/* _XE_PAGE_RECLAIM_H_ */
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 884127b4d97d..532a047676d4 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -12,6 +12,7 @@
> >  #include "xe_exec_queue.h"
> >  #include "xe_gt.h"
> >  #include "xe_migrate.h"
> > +#include "xe_page_reclaim.h"
> >  #include "xe_pt_types.h"
> >  #include "xe_pt_walk.h"
> >  #include "xe_res_cursor.h"
> > @@ -1538,6 +1539,9 @@ struct xe_pt_stage_unbind_walk {
> >  	/* Output */
> >  	/* @wupd: Structure to track the page-table updates we're building */
> >  	struct xe_walk_update wupd;
> > +
> > +	/** @prl: Backing pointer to page reclaim list in pt_update_ops */
> > +	struct xe_page_reclaim_list *prl;
> >  };
> >
> >  /*
> > @@ -1572,6 +1576,69 @@ static bool xe_pt_check_kill(u64 addr, u64 next,
> unsigned int level,
> >  	return false;
> >  }
> >
> > +/* Huge 2MB leaf lives directly in a level-1 table and has no
> > +children */ static bool is_large_pte(struct xe_pt *pte) {
> > +	return pte->level =3D=3D 1 && !pte->base.children; }
> > +
> > +/* page_size =3D 2^(reclamation_size + 12) */
> > +#define COMPUTE_RECLAIM_ADDRESS_MASK(page_size)
> 	\
> > +({									\
> > +	BUILD_BUG_ON(!__builtin_constant_p(page_size));			\
> > +	ilog2(page_size) - 12;						\
>=20
> s/12/XE_PTE_SHIFT ?
>=20

Done.

> > +})
> > +
> > +static void generate_reclaim_entry(struct xe_tile *tile,
> > +				   struct xe_page_reclaim_list *prl,
> > +				   u64 pte,
> > +				   struct xe_pt *xe_child)
>=20
> Nit, xe_pt can be on the same line as 'u64 pte'.
>=20

Done.

> > +{
> > +	struct xe_guc_page_reclaim_entry *reclaim_entries =3D prl->entries;
> > +	u64 phys_addr =3D pte & XE_PTE_ADDR_MASK;
> > +	const u64 field_mask =3D GENMASK_ULL(19, 0);
> > +	u32 reclamation_size;
>=20
> Nit, I'd make the last variable declared on the stack for readability.
>=20

Ahh got it, reclamation_size moved to after num_entries.

> > +	const uint max_entries =3D XE_PAGE_RECLAIM_MAX_ENTRIES;
> > +	int num_entries =3D prl->num_entries;
> > +
> > +	xe_tile_assert(tile, xe_child->level <=3D MAX_HUGEPTE_LEVEL);
> > +	xe_tile_assert(tile, reclaim_entries);
> > +
> > +	if (num_entries =3D=3D XE_PAGE_RECLAIM_INVALID_LIST)
> > +		return;
> > +
> > +	/* Overflow: mark as invalid through num_entries */
> > +	if (num_entries >=3D max_entries) {
> > +		prl->num_entries =3D XE_PAGE_RECLAIM_INVALID_LIST;
> > +		return;
> > +	}
> > +
> > +	/**
> > +	 * reclamation_size indicates the size of the page to be
> > +	 * invalidated and flushed from non-coherent cache.
> > +	 * Page size is computed as 2^(reclamation_size+12) bytes.
> > +	 * Only valid for these specific levels.
> > +	 */
> > +
> > +	if (xe_child->level =3D=3D 0 && !(pte & XE_PTE_PS64))
> > +		reclamation_size =3D COMPUTE_RECLAIM_ADDRESS_MASK(SZ_4K); /* reclama=
tion_size =3D 0 */
> > +	else if (xe_child->level =3D=3D 0)
> > +		reclamation_size =3D COMPUTE_RECLAIM_ADDRESS_MASK(SZ_64K); /* reclam=
ation_size =3D 1 */
> > +	else if (is_large_pte(xe_child))
> > +		reclamation_size =3D COMPUTE_RECLAIM_ADDRESS_MASK(SZ_2M); /* reclama=
tion_size =3D 2 */
>=20
> What happens if we have 1G page? That doesn't seem to be handled.
>=20

Page reclamation hardware does not support 1G page. This should
be handled and fallback to standard TLB invalidation PPC flush. I can add
a comment somewhere discussing this but the format for PRL only
supports 4K, 64K, and 2M pages to reclaim. I'll add a comment here
mentioning the HW support being limited to these pages and rename the
is_large_pte to is_2m_pte.

> > +	else
> > +		return;
> > +
> > +	reclaim_entries[num_entries].valid =3D 1;
> > +	reclaim_entries[num_entries].reclamation_size =3D
> > +		reclamation_size;
> > +	reclaim_entries[num_entries].address_lo =3D
> > +		FIELD_GET(field_mask, phys_addr);
> > +	reclaim_entries[num_entries].address_hi =3D
> > +		FIELD_GET(field_mask, phys_addr >> 20);
>=20
> As suggested above, use macros/defines here to setup the entry.
>=20

Got it, moved over to using other standard define macros.

> > +	prl->num_entries++;
> > +}
> > +
> >  static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t off=
set,
> >  				    unsigned int level, u64 addr, u64 next,
> >  				    struct xe_ptw **child,
> > @@ -1579,10 +1646,27 @@ static int xe_pt_stage_unbind_entry(struct xe_p=
tw
> *parent, pgoff_t offset,
> >  				    struct xe_pt_walk *walk)
> >  {
> >  	struct xe_pt *xe_child =3D container_of(*child, typeof(*xe_child),
> > base);
> > +	struct xe_pt_stage_unbind_walk *xe_walk =3D
> > +		container_of(walk, typeof(*xe_walk), base);
> > +	struct xe_device *xe =3D tile_to_xe(xe_walk->tile);
> >
> >  	XE_WARN_ON(!*child);
> >  	XE_WARN_ON(!level);
> >
> > +	/* 4K and 64K Pages are level 0, large pte needs additional handling.=
 */
> > +	if (xe_walk->prl && (xe_child->level =3D=3D 0 ||
> > +is_large_pte(xe_child))) {
>=20
> And also here? 1G pages are unhandled? Please explain.
>=20

As stated above, page reclamation only supports 4K, 64K, and 2M pages.
1G page will have to fallback to the standard tlb invalidation with PPC flu=
sh.

> > +		struct iosys_map *leaf_map =3D &xe_child->bo->vmap;
> > +		pgoff_t first =3D xe_pt_offset(addr, 0, walk);
> > +		pgoff_t count =3D xe_pt_num_entries(addr, next, 0, walk);
> > +
> > +		for (pgoff_t i =3D 0; i < count; i++) {
> > +			u64 pte =3D xe_map_rd(xe, leaf_map, (first + i) * sizeof(u64),
> u64);
> > +
> > +			generate_reclaim_entry(xe_walk->tile, xe_walk->prl,
> > +					       pte, xe_child);
> > +		}
> > +	}
> > +
> >  	xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk);
> >
> >  	return 0;
> > @@ -1654,6 +1738,8 @@ static unsigned int xe_pt_stage_unbind(struct
> > xe_tile *tile,  {
> >  	u64 start =3D range ? xe_svm_range_start(range) : xe_vma_start(vma);
> >  	u64 end =3D range ? xe_svm_range_end(range) : xe_vma_end(vma);
> > +	struct xe_vm_pgtable_update_op *pt_update_op =3D
> > +		container_of(entries, struct xe_vm_pgtable_update_op,
> entries[0]);
> >  	struct xe_pt_stage_unbind_walk xe_walk =3D {
> >  		.base =3D {
> >  			.ops =3D &xe_pt_stage_unbind_ops,
> > @@ -1665,6 +1751,7 @@ static unsigned int xe_pt_stage_unbind(struct xe_=
tile
> *tile,
> >  		.modified_start =3D start,
> >  		.modified_end =3D end,
> >  		.wupd.entries =3D entries,
> > +		.prl =3D pt_update_op->prl,
> >  	};
> >  	struct xe_pt *pt =3D vm->pt_root[tile->id];
> >
> > @@ -1897,6 +1984,7 @@ static int unbind_op_prepare(struct xe_tile *tile=
,
> >  			     struct xe_vm_pgtable_update_ops *pt_update_ops,
> >  			     struct xe_vma *vma)
> >  {
> > +	struct xe_device *xe =3D tile_to_xe(tile);
> >  	u32 current_op =3D pt_update_ops->current_op;
> >  	struct xe_vm_pgtable_update_op *pt_op =3D &pt_update_ops-
> >ops[current_op];
> >  	int err;
> > @@ -1914,6 +2002,13 @@ static int unbind_op_prepare(struct xe_tile *til=
e,
> >  	pt_op->vma =3D vma;
> >  	pt_op->bind =3D false;
> >  	pt_op->rebind =3D false;
> > +	/* Maintain one PRL located in pt_update_ops that all others in unbin=
d op
> reference */
> > +	if (xe->info.has_page_reclaim_hw_assist && !pt_update_ops->prl.entrie=
s) {
> > +		err =3D xe_page_reclaim_list_alloc_entries(&pt_update_ops->prl);
> > +		if (err < 0)
> > +			xe_page_reclaim_list_invalidate(&pt_update_ops->prl);
>=20
> I don't think you need to call xe_page_reclaim_list_invalidate, right?
> If xe_page_reclaim_list_alloc_entries fails the prl should be in the init=
 state.
>=20

Yes. I'll drop this call for now then.

> > +	}
> > +	pt_op->prl =3D (pt_update_ops->prl.entries) ? &pt_update_ops->prl :
> > +NULL;
> >
> >  	err =3D vma_reserve_fences(tile_to_xe(tile), vma);
> >  	if (err)
> > @@ -1921,6 +2016,13 @@ static int unbind_op_prepare(struct xe_tile
> > *tile,
> >
> >  	pt_op->num_entries =3D xe_pt_stage_unbind(tile, xe_vma_vm(vma),
> >  						vma, NULL, pt_op->entries);
> > +	/* Free PRL if list declared as invalid */
> > +	if (pt_update_ops->prl.entries &&
> > +	    pt_update_ops->prl.num_entries =3D=3D XE_PAGE_RECLAIM_INVALID_LIS=
T) {
> > +		xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
> > +		pt_op->prl =3D NULL;
> > +		pt_update_ops->prl.entries =3D NULL;
>=20
> Call xe_page_reclaim_list_invalidate for clarity?
>=20

Updated.

> > +	}
> >
> >  	xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
> >  				pt_op->num_entries, false);
> > @@ -1979,6 +2081,7 @@ static int unbind_range_prepare(struct xe_vm *vm,
> >  	pt_op->vma =3D XE_INVALID_VMA;
> >  	pt_op->bind =3D false;
> >  	pt_op->rebind =3D false;
> > +	pt_op->prl =3D NULL;
> >
> >  	pt_op->num_entries =3D xe_pt_stage_unbind(tile, vm, NULL, range,
> >  						pt_op->entries);
> > @@ -2096,6 +2199,7 @@ xe_pt_update_ops_init(struct
> xe_vm_pgtable_update_ops *pt_update_ops)
> >  	init_llist_head(&pt_update_ops->deferred);
> >  	pt_update_ops->start =3D ~0x0ull;
> >  	pt_update_ops->last =3D 0x0ull;
> > +	xe_page_reclaim_list_invalidate(&pt_update_ops->prl);
>=20
> Can we introduce a function called xe_page_reclaim_list_init for clarity?=
 It might
> do the same thing as xe_page_reclaim_list_invalidate but it would make th=
is a
> little more clear. Likewise later in the series when a job is created, yo=
u can call
> xe_page_reclaim_list_init there too.
>=20

Sure, I'll write another helper for this and modify both those PRL creation=
 points.

> >  }
> >
> >  /**
> > @@ -2518,6 +2622,11 @@ void xe_pt_update_ops_fini(struct xe_tile *tile,=
 struct xe_vma_ops *vops)
> >  		&vops->pt_update_ops[tile->id];
> >  	int i;
> >
> > +	if (pt_update_ops->prl.entries) {
> > +		xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
> > +		xe_page_reclaim_list_invalidate(&pt_update_ops->prl);
> > +	}
> > +
> >  	lockdep_assert_held(&vops->vm->lock);
> >  	xe_vm_assert_held(vops->vm);
> >
> > diff --git a/drivers/gpu/drm/xe/xe_pt_types.h
> > b/drivers/gpu/drm/xe/xe_pt_types.h
> > index 881f01e14db8..26e5295f118e 100644
> > --- a/drivers/gpu/drm/xe/xe_pt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> > @@ -8,6 +8,7 @@
> >
> >  #include <linux/types.h>
> >
> > +#include "xe_page_reclaim.h"
> >  #include "xe_pt_walk.h"
> >
> >  struct xe_bo;
> > @@ -85,6 +86,8 @@ struct xe_vm_pgtable_update_op {
> >  	bool bind;
> >  	/** @rebind: is a rebind */
> >  	bool rebind;
> > +	/** @prl: Backing pointer to page reclaim list of pt_update_ops */
> > +	struct xe_page_reclaim_list *prl;
>=20
> Can you move this above the bools in the layout of xe_vm_pgtable_update_o=
p,
> likely just below "struct xe_vma".
>=20

Ahh got it. Moved.

> >  };
> >
> >  /** struct xe_vm_pgtable_update_ops: page table update operations */
> > @@ -119,6 +122,8 @@ struct xe_vm_pgtable_update_ops {
> >  	 * slots are idle.
> >  	 */
> >  	bool wait_vm_kernel;
> > +	/** @prl: embedded page reclaim list */
> > +	struct xe_page_reclaim_list prl;
>=20
> Same thing here, move just below "struct xe_exec_queue".
>=20
> Matt
>=20

Moved.

Brian

> >  };
> >
> >  #endif
> > --
> > 2.51.2
> >
