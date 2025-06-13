Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023A6C71136
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 20:11:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A668610E4A2;
	Fri, 13 Jun 2025 20:11:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="diqmvAzN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 259E710E4A2
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 20:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749845465; x=1781381465;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+1dEe2VnnZ3ocV7IGU7p6VmqkikM7+058+HAvKsjMP4=;
 b=diqmvAzNToPVTLUSwKXat6L58hsfe3y3jAWRah8HGGA4CNNjP3S1i+hJ
 EErSas2AABjDxg8X4zs6ZenfE6tHX8NXGDSI7k0LtahqjMhlm41dqmVaq
 a8PX9YZmRY8f7czCn8tkqfV9WXMXEtqf5DIMnLlsowH/GIrAULRLjWF35
 mc7wTW8zH1T71/WjEkScLSDNnFfnqHyfXVGxV6da5e7WPSasngVxfuM5G
 367UulN/ZkSuFcwn/OHLgcQWuTPdk4ebVNFank0cg70kP5wzBxinAcDXv
 q+2beC67uFzDryULeBW9tQmBGA40ols5NvwxUx+MpHBORzgdhbRBj2TN9 w==;
X-CSE-ConnectionGUID: eRjlw9V3TYu4Kmh8gEWDjw==
X-CSE-MsgGUID: oU+YcPHCSpCG7rSFrMeLvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="69648550"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="69648550"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 13:11:05 -0700
X-CSE-ConnectionGUID: UaWf9/RfTum+k9VDYsn01A==
X-CSE-MsgGUID: eV1ulsdIQzOUNWxufPr5Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="153070647"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 13:11:04 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 13:11:03 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 13 Jun 2025 13:11:03 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.88) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 13:11:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJN7jMHo3IBEDgvp/yQDGk38CZD+FP577kUF/21Mqcv9/h6CxHhcBRSxTRv/LhwwWnJ/8l+h5w3lZ9DOhLPz8YYJzWQQ6J9zC0NukD4Xly5UDum706Gk99ij6pfjoHJRUZrl5Mj0E3I3QDZrEJghUNPx8woW7Bn+LjVNZt95pOQsawGvEAJZybhlRAwFf7nVzXt3GZwQJU5SfkJoHbVGNhZVh7yplBI0Z+ZYvsgyujifJE9UvZdjB1jw1BUnD9wDauSTvzgn/JYXuzdfv6A1hg2/3XOXi2+dF3adWhRGjhvJBQmbsphA0SpxBCv3CuSWxrt+uBE9PriAjjjST6VMkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dg56P4Tpqc2HrX8ODJ3/Yw3blNLMIuumqAemkQ9U6go=;
 b=nrHJ0E2wCN+2asqh/fqcYehgGBdmr4xqX/hl3fWOGb8GQJ6uaym1/y4qmPC8qzymtKKV/0xTKa51MhSoqnFCb/5uTz7TDJq+EbpmLVgdeIzYVs343QjNlaR1TQMRbAUwzzBJUGdW3dexZBRaDchdrfv1BPmcgrB/Dxix+5CkIn92L8wicmBmhW8MLAYKlkaoHTnA2Ly93XmZgOtK7m1388rxDD/DDScgkba2ymmq6/RcESaR85bcneI0W/fzMO4X6PoIKerruE7MLLrxw6qtSjUMH4BQW013V66Ls3Ts76SYQuXQLGy2rJw1+3extFdcn9NnxePxmGfynRVwXLeNiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PR11MB8757.namprd11.prod.outlook.com (2603:10b6:8:1af::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 20:10:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 20:10:48 +0000
Date: Fri, 13 Jun 2025 13:12:23 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe: Move LRC_ENGINE_ID_PPHWSP_OFFSET outside of
 parallel offset
Message-ID: <aEyGJ2aVjCRm1fPL@lstrano-desk.jf.intel.com>
References: <20250612172850.4170428-1-matthew.brost@intel.com>
 <aExT9LQ-OsDMMLen@unerlige-desk.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aExT9LQ-OsDMMLen@unerlige-desk.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR04CA0322.namprd04.prod.outlook.com
 (2603:10b6:303:82::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PR11MB8757:EE_
X-MS-Office365-Filtering-Correlation-Id: e0cca6a7-a044-4d84-931f-08ddaab662fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lLxGLfU69IYsbNsXcj+KY+aDfj6SepCWmzyH9pwOu+XBZraqH0njTF3iXHts?=
 =?us-ascii?Q?AgOA1ZMC9HoCyHm0TzXzr1H3fVK4ldMq2Z2rmM1YnyuxWWhezUPoP2XO1csh?=
 =?us-ascii?Q?LiCQZdNvKJ+V6QJcR4fdFM++dEh4Axm6pRn0R+3NnuXOA2bExIR6xGXAloTz?=
 =?us-ascii?Q?MG4NrOurVtSL0ZMLj3VSk3vKgQj1+WNNNlKTebyOvXRO7YB5IQw8RS+sOBF0?=
 =?us-ascii?Q?tuEVAUCOJo+c/9FuXQJn039kcWm+KLzfeGuw+eEbhZP47rwSxwTiDXwOS4w1?=
 =?us-ascii?Q?IP2CC0sSlkk7h0wz8ZDKEm1itShWSRBF+mxrVUSHDMK0QMmOx8VEIf+0nko9?=
 =?us-ascii?Q?l72lp5/gsKaUYu8aex2Dpj0UCgUdRabDtUBFbRfAEDPdIFPS6WtTdhOI3Ze4?=
 =?us-ascii?Q?a3Y+mTgp8NQcm7BGOsT8SDfz7D9DaENZ7ep3aL095oFprxqCw+TrCst+RwCl?=
 =?us-ascii?Q?3Yvnfe0NFXBXscl+0cUbKskNpd2ogDhV7yS3omNRUjJM7AdolFWCSiTrYJ2y?=
 =?us-ascii?Q?eQgUxmAtkkydMNHUrrS7Usxmw90pgudkgHhZHXdFP5Tvr4p8szZwAh8r33YT?=
 =?us-ascii?Q?ilJ03OFNC/yGC4hJjLzS6VMQc3+cdOnHudACzMwjX0Uti7ZjgvlSNIbMcyi5?=
 =?us-ascii?Q?gk6gRdyC0SAgilMzQJgSw0k6cOrm2J0MDMF6sNYDDu5ixK8VcHtmO2dnE/ZF?=
 =?us-ascii?Q?IrENPf/qgl3iohsQlVU0IS5Vtj+8O6WnaaiJNvjN6dDhDzEPoeDS865jcI9A?=
 =?us-ascii?Q?/AQqjOnia3FubXs78JZ67auuypJE9s4RjEsk3G8PKr7dRjZHpXtP/POin3FV?=
 =?us-ascii?Q?s9pe667KRL2ddFsUt+z9W4je5o8GfSks/q5PNMAJiSMU4nhMRLLpxWaLBfho?=
 =?us-ascii?Q?P4CYJFXIlU0KAoxRRbTX+jM9KB4hDiFTkYZLhDeO6iq43BgfYmj7f82L06Kp?=
 =?us-ascii?Q?FojuWualkQNA2hZmM1d0afT7TUpjPGBaVez4cRtFV3fydtAVq8kIZQJ3xsRA?=
 =?us-ascii?Q?4foFiSr2IREDuh6fKu6+GfiibhSb8eEAHyGZHpURpvjnCmsRix8k8XkYpfRp?=
 =?us-ascii?Q?9QXlCPrkmIHJcc648GGo9q0rrO5KGMUNk24ULlCaX3s8MEJA7uQlRmYxucof?=
 =?us-ascii?Q?hatpp+ytelgRoyzVBKMPnS5pYYYHCLXcbcjCWbwqF4OHRf05FYK4HjmjM8h/?=
 =?us-ascii?Q?BbZfnqPtNs9fS081xGpgQxG2DPWneWiyvEBekRbRvzSlsCCSVaI1RU6214sH?=
 =?us-ascii?Q?pBxX0vrnqg4Fv+hSEpdoFQgiIkWKDgmgCLCb7CLE8cC9C4yS5+qcpS6Sk7UY?=
 =?us-ascii?Q?HFXQ6KZJJMkt7HBnHKZO7Phr+7U+w5g30C28eAbbd30F6kcBemsBHCOPq0QO?=
 =?us-ascii?Q?sf9FrSp6P057BBrFhzMFzWMlRN1TBZUztwx0jKDoKJBM6ax1WeUPAepvxpCR?=
 =?us-ascii?Q?WoSOsZ0ep+M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SKFUWiYlKZtuCEKc5JZr+isvCHWpfM1Iar7dJWU3Yj+LnzDm/Zf+7vnQj6Dj?=
 =?us-ascii?Q?dcf83D69nCBa0N2BCtUbYQV9L4sf51xiw4lVmHZeXyszIhVwzDnnKFIjjaiX?=
 =?us-ascii?Q?dJoO+OYzsoa73ssBqOrs0aV8dBjmvJwIPN2BAjjMYADAKPwRZdij0dgGLfmi?=
 =?us-ascii?Q?/MlFo9hb7oNy+RgYtxQR0mjnjNWl+815JwROGhAEukGtgVVFevdEe7muR0fq?=
 =?us-ascii?Q?gBKdwDidY9st+NEkJoEVD3lyUyL1mgJSY7Vg4JcMYcE5LdXkojhmihQNJCcT?=
 =?us-ascii?Q?yAklo34n0rQqxofwl/LVBkRYFSe14YXujIQTjNDd9lnoiHO9FdNfF2K1HlLX?=
 =?us-ascii?Q?sJ0hN7rNC+MH3i8kr0zr1ELysFYlsm2Prj6qSh3SRWZNq7GY+caxVeGwffO/?=
 =?us-ascii?Q?alEWVw/VlqrNLj/24c5wwqUBcSZh5ZRgGcoJOLxmVFsbaEXoq8Spe4AHzODr?=
 =?us-ascii?Q?BfNzlOtBOfsnsiOA7HtXwkgX7OPNVAWUSxTk6S/I//JE/f2lACSrkl+0AQU2?=
 =?us-ascii?Q?ol17K1fNyp2dY9LSPbQsVgJxM8uEPyuYIRLURkJx1WFlENnb9GlBuFGx5rKk?=
 =?us-ascii?Q?5GweaAkElf2QnAeEOUq4PAT/U0/ruqM9dK11laolomP74FmyF/CoKng7UtAd?=
 =?us-ascii?Q?AXxq+px1zQLgzFbLr/+UOeVjjJM/meVM7mL9vGmAQNiTwCJlfurGVjRL16Q7?=
 =?us-ascii?Q?EM9ZWxpF0cNwCr25ZPxwksIoadUTAB3FKwaMC0KrdIaNzs2ZR063ctE9A8s5?=
 =?us-ascii?Q?r85MN3Q9+Ayky3oVER81vSt0uvrQpC5a34mk/CeAfWDvlI2rX67MqHEA4s9m?=
 =?us-ascii?Q?G0nNS8O6KzgjHbWlGGlCqpVLwDKJppJB8GsTLBunLjrVmHpKVPrbmQcdxNjp?=
 =?us-ascii?Q?b1PnwP2cFOU4KbYVnFh/SzTmCqpSmaIJ+btFg0DWDDh3qjCSfx41iHvg4men?=
 =?us-ascii?Q?qajfKKHNyF0NOVnKOyXUucfyxhSFupxKQTKOYs3QUDrf74g871Phq7PjqL31?=
 =?us-ascii?Q?IUE6U2Fdi79EqlI5GGSdUprNYx3ghyrTRK2MOfKxCHCo45QOIcOsUBptnRda?=
 =?us-ascii?Q?/50mFaJX8SlhGj+HN1FhcSE5X7/UX2JE5KQ4d6gYhzWUhobL5ZMjNfZlwrV7?=
 =?us-ascii?Q?Ubm3C3MEFyOqzjVGK/qiBS2vBYlOdB/F/CKTFZus+anuzOqSkdDL6nWvRiMM?=
 =?us-ascii?Q?W6Kr7zp9wg8W9fBKnIVp/VLmpC88MjUAGian/N5e1bs9aZS4L0O2LOeY7SWb?=
 =?us-ascii?Q?Kz4JnC+N7v0+e61AB9vErwFyaUnMBMfaA+MDQ6UmAt31pXj7pNiQj8C9Tlim?=
 =?us-ascii?Q?LRBqfrAIWYPYxCJIZbq1hbW3YuO2mEGJP77A78QlkVnZLDfTPPKEp18UionM?=
 =?us-ascii?Q?/b13a3EffPjh+Ow/mqDoS7ZM+iyiE9Eiwz2aAAtA5SyArfhE5A77W+soWOEN?=
 =?us-ascii?Q?hFgtdmli2Pq0bnVHpcPO39/uhmaNCrokGWhqTHc1HowaDKtCI2H5Rj/9f4Zy?=
 =?us-ascii?Q?CcMtmkf/4oej5U2wW+40eT3ss/BPQFG1aWKdncwVrUnMllYlAIMeofWb4Za7?=
 =?us-ascii?Q?wASYEfxcYOJWORQLHFDILf8uvyOs0JmjMe7SJ3oFHHX6utusTNkgBAgChmfV?=
 =?us-ascii?Q?jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0cca6a7-a044-4d84-931f-08ddaab662fe
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 20:10:47.9576 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tUojoLEpFDh+eBNzaArBqQTywn3Jks49UKnxlGRxex+m22XFKCWzq0zfJwyTLwuFmzH0H2fZ3TBa87orUS/sGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8757
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

On Fri, Jun 13, 2025 at 09:38:12AM -0700, Umesh Nerlige Ramappa wrote:
> On Thu, Jun 12, 2025 at 10:28:50AM -0700, Matthew Brost wrote:
> > The parallel scratch layout spans 2k and LRC_ENGINE_ID_PPHWSP_OFFSET
> > lands within than space. This happens to be ok as the offset lands in
> > reserved part of guc_sched_wq_desc, but for future safety move
> > LRC_ENGINE_ID_PPHWSP_OFFSET to the unused offset of 1024 below parallel
> > scratch layout.
> 
> Oh, didn't know that. If you could add that info in a comment above

I'll add a comment when merging this.

> LRC_PARALLEL_PPHWSP_OFFSET, it would help anyone adding new stuff in
> future. Ideally we should update the bspec at some point here - 77575
> and guide everyone to look there for overlaps.
> 

Yea, that would be good to make sure we are not clobbering anything the
GuC / HW is using in our software defined state here.

Ideally I want kernel doc describing the entire layout of LRC BO too as
I continually forget how it is laid out and have reseverse engine the
code.

Matt

> Change LGTM from utilization perspective, so with or without the above,
> 
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> 
> Thanks,
> Umesh
> 
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_lrc.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> > index 529c6a972a55..6fb2a2ca4e78 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > @@ -654,8 +654,8 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
> > #define LRC_SEQNO_PPHWSP_OFFSET 512
> > #define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
> > #define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET + 8)
> > +#define LRC_ENGINE_ID_PPHWSP_OFFSET 1024
> > #define LRC_PARALLEL_PPHWSP_OFFSET 2048
> > -#define LRC_ENGINE_ID_PPHWSP_OFFSET 2096
> > 
> > u32 xe_lrc_regs_offset(struct xe_lrc *lrc)
> > {
> > -- 
> > 2.34.1
> > 
