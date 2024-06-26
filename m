Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B71C27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 17:30:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C27DB10E061;
	Wed, 26 Jun 2024 17:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XVtnhV2R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FCEF10E973
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 17:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719423025; x=1750959025;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+ppH2vCSeaHNZRP92CulB40a3HIo+mbV48SP3Sv1T7k=;
 b=XVtnhV2RGPp+M6dZxpBEzhrCJ88V8AO1Lu646yVrBbd/8ChZamqsgWkX
 x3txh8LBQi/gHxnHnuy8stDWgO871qPxOn1EP+i+rCygA4BwoLiq+OzPc
 TGIRfOhKKEufq+WfhCdiYxHut1exOsmGE7jw2fyfCmncar4l+0LVqSwbf
 AZpC3vrDgZfUzE6KS/rSbLYPY0c392J96Ngd5z/wPEoy3GQbjERQuuiZi
 h0bJbe96HqzSEUQ30SetLhLkH5k/VdjyLOCSqlX0hpon7fstsTHUnv/VT
 n8sky3vUFBLTdpyK9QgXJ5WWvKHK8MawX0Gv0iEIZNSORNhxGHz9z6yKe g==;
X-CSE-ConnectionGUID: +4HfhD+1REidbdNZ20kbZg==
X-CSE-MsgGUID: h+aFcK0cQTGDNldrDKxKYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16642742"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="16642742"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 10:30:24 -0700
X-CSE-ConnectionGUID: sUXvT/11RNqdO7wwbk+vKA==
X-CSE-MsgGUID: nXkWkKFISxaW35PRSkufFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="49246800"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jun 2024 10:30:25 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 10:30:24 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 10:30:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 26 Jun 2024 10:30:23 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Jun 2024 10:30:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OBD5pf+BzcBK5dli+FNiI+KPNnzsGAGs8uHXhPOZyBZSd0SlE4me1psn5pZVO/LvpZ5xUaj47IcYnlhIHIZ8K2+W2+NdREAC0+tbzGkVTVJURoRu2vYoSZIkkfSfJDdeVT0wUJw8yG2JXHtKssIAy96QlHCyPuPhjtjolhauJEc99rXpBSxotD1F3oHaYSIrokBJCSDILINuAdmbMxfc7oDZaCFZwErDI74dBkAf6lKhC8iRLyCL2HuxDiCSVatCeHVI1I+hb5vFtRSDPjemWItJAW9hvsDsEW0Vjfum6SBCknGYwfQi3KYNdGkj6yI1w2WyrJAutHxEL+U5Iol72A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avGkCeDjrMm33/1NAXhYdxlOlvqlVfMjnIhwaVj+qjU=;
 b=RquLjNHpGA3TugJ70w3CwDdz1cMME9Uc8Bi8xt9ct3dB9BhsazR/g+XfP9Rj0+JB0iPZbaeOX1OX5ZepptuPY3KuB8gTUX9EpjEpw4SUpZDmJxcWNQPagYrSqL7za/pxnkiXDsI0RaM5VeW2wUxK/KxPJP77WODcQf+wixNLDCPJDchsGYBQsv8QIoh7NadMoyl7SryoMiBjrp4GmLDx4qAbKG3gEarA9KTp5nw8ZlOwjHWCgwBM3CCT7s8dKEeGrJVBSKnBu61eEKZXjxjRyy5pv4AZQDN4LLzKN4h3Ro6o0u8NMlbL3XDdFFsanTVtZe8PSEOMPwam4Uxctr4Tnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by BY1PR11MB8128.namprd11.prod.outlook.com (2603:10b6:a03:52c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Wed, 26 Jun
 2024 17:30:21 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 17:30:21 +0000
Date: Wed, 26 Jun 2024 13:30:18 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH v3 0/1] drm/xe/hwmon: Remove xe_hwmon_process_reg
Message-ID: <ZnxPyXN-RWy9pSwr@intel.com>
References: <20240626170746.2926011-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240626170746.2926011-1-karthik.poosa@intel.com>
X-ClientProxiedBy: BY3PR10CA0025.namprd10.prod.outlook.com
 (2603:10b6:a03:255::30) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|BY1PR11MB8128:EE_
X-MS-Office365-Filtering-Correlation-Id: abc44eca-735b-4bf8-0e16-08dc9605a77a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|1800799022|366014|376012;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?V2bIviKiuf5tz60ELN4J7mgMZB64zTvh0kBA1L7MYoEHS2xyiJ6qEtsYLTVy?=
 =?us-ascii?Q?XrJCx0HJBh6JVgTQFpxjNi2dzDtK59BkUQnPqYej99W3wCuPtqSMFQSWf2E4?=
 =?us-ascii?Q?6/KqIpFUTn4v65u9FqdQMdtTiJ8lGFzOOQoIaPs5/y0DXDaBMcC4wj0/34Dh?=
 =?us-ascii?Q?VxP/S78WKvZs36ujoQUD0BBoGJ0Az51o4lAbBY4qFD8cewiLB/E6OhFiX8b3?=
 =?us-ascii?Q?KQKAWJw+zH2zC3cn1KcFQR4ng2RtF+4lo1g6tObW/1VQxMOUKrw3XLG+242Z?=
 =?us-ascii?Q?/GDIhdsS8HL0+u1anwB9uivsVkvVZDm1pG3dJ0j25T7JZfQi/kDaWZDTHkP2?=
 =?us-ascii?Q?FaiIuBmDCjfUI/TmLKRMuWE5WH1PwbZIfzh5H/0CkLpBx3us3R7AVtbBCXVL?=
 =?us-ascii?Q?CJEwwI9idAi0xGB716LM9m18lnE2RyBto+uap3l6C+X3clNgqWDrqxtn3Q4N?=
 =?us-ascii?Q?t7A0txbCpqghluyukSAYYidCu1hUXO9GcvJovvu9HeM3Pzq0SgySBCjkrJRO?=
 =?us-ascii?Q?Ho2gl7N9hnHextkjap0keqg0k1qRnQK75qqZVbh5ZW4/nWMl87GgeOeyR/se?=
 =?us-ascii?Q?Jr7Hb7oXeMcJXPcr9wTcc/Pc1jk4103UvUc4Hxo15We4YkiHtFqsdyfk/HNo?=
 =?us-ascii?Q?uWe9XLkK1r7KsI1ZHhL/OMbgn2w5TGlgZ1px2jMEDMMQAb+3iuFFlEET231b?=
 =?us-ascii?Q?n+sHkFBm2+DgVj0WMZW7Y8hnT2CXmYAHGaAALuqIi2uJ+sg9IrNgRisRx5xM?=
 =?us-ascii?Q?XyXhr1lhtQyIwaZoJIJAse5gkha6oBVjzR+nE03BZbhMz9cSQE8z5ulI79Vc?=
 =?us-ascii?Q?k2Hyd+zv4GSIP6HzMy8dhfACpkVUrTCbwXSDHBv6eQfy7DtLplJgQxe7iMUd?=
 =?us-ascii?Q?RXgzavkq7eLAr2VREyn5f3jeQbUWL2y/5o+cyw7U0zUATQIE1yYMDP2IZIlu?=
 =?us-ascii?Q?v8Nl6o9wDzlDMkE49hN7RqO3e/R9I5a/Th8g/UECujkDOo7lBBy4Fjk4bX/C?=
 =?us-ascii?Q?7mAlZtv0QSrIb5PGk+zbMjfUVGIBg7kNt2ACY0/c/OmmevOHI5QUXE5aKlzi?=
 =?us-ascii?Q?oeIvKjsNUZf4YrPAPECfwBwlFac+0t/ozKCIVlFAY9r0tfEDNuuRDSvqxHJC?=
 =?us-ascii?Q?y5HVxArNH73PCt4bI/Po0ltnyCEc53V3OkEKgZtUa+El7MNEw+A95ClcRagA?=
 =?us-ascii?Q?7+0iyGD3XV5ReVJbQV+oritguYCa323G+XBTtf0pzGG7xn9+V33CeTuUM5qW?=
 =?us-ascii?Q?swzofUlY+Fojzr1E5Zlj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(1800799022)(366014)(376012); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R2FSZFHwBvKdXYuvkMG7UdoFxfFTt+ICc4m4tXUV3IP0C0r95q+1Hr3lot5X?=
 =?us-ascii?Q?hdnKMHMRnoxigBqSD57k2ghqNxHfuZAPFrDM5fXnAkt0uWgTTWPnR9cFGvbe?=
 =?us-ascii?Q?VWk58on6+1T67+8ythoElKP5i8QKNSBoYS4miAu6sFrO43cedd5k7PTICvC9?=
 =?us-ascii?Q?3260G3dBIbI7cxg0LuPVcyuxE8S7vKZ0kqTzzmNVC1AWZRw1YA6AZSVbk54g?=
 =?us-ascii?Q?CrHDW92GJER1m4DzPfQRs76Ipynequ9k5g9R7R8VEwibE9usRpoJjyvgY2Ws?=
 =?us-ascii?Q?BCSpNCH1UQlPLQqTg4lhp7RAXY6UfJTNhQVRyY0tyQ0U41m1pSTznKOpbd5b?=
 =?us-ascii?Q?h1lDU9TD5W8DIaOgNXK43gM2cHeLHjZHr4tbRjYC+N3WP5JpRB88F0q2KT2X?=
 =?us-ascii?Q?l10CQiOcc1AkJ5pCbNAlk5BPxiFGuxtQcLdAyY1gq5eGCeMomM/wu4sog5Ho?=
 =?us-ascii?Q?0q4kNjhQ2GkeZYXYdCPwfxaDx53Uj4YaVtBXhQCrA8/UIIstOgGcR6MupHer?=
 =?us-ascii?Q?mdkBIKnicjfL46S+oFn8i8JpiMUicTxy7ZncTFE5avbUGe8vSREM11jZlSoM?=
 =?us-ascii?Q?nFwgSjiD/u9La7pGZRJHN6GZCxkb4pTgXMFeqfMs/nPkwvNpXba6UOukETS9?=
 =?us-ascii?Q?7VsTVf/ccoo4uVr7dhuVJ5qSnMAIlXANDcMDwmNSKrafbpSlCfCSnb5ImNLO?=
 =?us-ascii?Q?ph9tZqfAjUVz1iF1Mf1PHnUEamhpjKf5pXSZtNV6ih45/fmMEB9WWf41xWE+?=
 =?us-ascii?Q?xANtxvWKPkxNO0w/jJWaGXtKKaOVqox0MSLlFGuQSUQqLhS+PEEAEztF+Ye7?=
 =?us-ascii?Q?NH6EjmeNs9YzXtl9kr+nPdh+iun1yJZW5QV2gIcY93T0c/TWER4+VUTsQacL?=
 =?us-ascii?Q?Mi7k9fr2B+Ho2W3O9Wl7++7QLhPxTcPDhrkrkiLGq/w12cI+xpExKWJu7JQr?=
 =?us-ascii?Q?s46a00554tLXdFDBP0zTo0/s3bizGIs4gDHzYpqFJ17FA/uoCKZ8AQ3oS2fA?=
 =?us-ascii?Q?hB+A/HJXlP7PP8STOnpeVIKv9FqBdnXqYXXICC3sd21LVAOPuMN1E+jWOELF?=
 =?us-ascii?Q?6hQ5epht8H3BFTLe+7Im7UcSz9QYjDqXujmrEl3H+Y8cNxmA62WXmziYyw0Q?=
 =?us-ascii?Q?RED7UmAn+EaQlqqurjhoHiPRQNHC7VkNA/+5qjVVzye/8qoRueYkj40JHSqz?=
 =?us-ascii?Q?C+VOCOEALHMMwSwG+9U9TrQPUjAWvWhPHoEeHL7G0KDbDUODF51X70SZ1HRQ?=
 =?us-ascii?Q?C1QcQMC0ag96V6EDmtEYuDhkWaf5OwnR+4DYDrlRELizE3m72dwcKW/VmOBm?=
 =?us-ascii?Q?o9doffjXy/ePtW9VkdxY8MC3nVK8BkQqUnsdU5eKPLWIkhFgWoIt1+fTUtlU?=
 =?us-ascii?Q?Y/qpPKVtAu105/kF6ehPcqosfTPYDFmy3QTKaGmUuj+Gl/VVTb8fe74mVwoD?=
 =?us-ascii?Q?vzAAK5IPgORjOR9mkf1LJs9C/J0MHSvvLqs7KMbGK04ioJrC2Z+QWLQNJJzv?=
 =?us-ascii?Q?7HR9PULCMJhsl2KdEIhm26ryG0Bc31ni2b4H9IuUtTAu+3ZEj6nrqm50X+CP?=
 =?us-ascii?Q?dGW/Mmg+gCWOyViVVrn9bAlHtlSgBKxx94XjHZ03MUTcaBAWl5cJtkRGyMrH?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: abc44eca-735b-4bf8-0e16-08dc9605a77a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 17:30:21.0467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +2w/UplI8Bb5UOa8Wr6rCH4/XOl1esR09uHjif75avBgyMsGvIEkgErR1GJoyZASA+hhn3haaV/thF+Zgrfb5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8128
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

On Wed, Jun 26, 2024 at 10:37:45PM +0530, Karthik Poosa wrote:
>  Removing xe_hwmon_process_reg as per review comments from Lucas in
> https://patchwork.freedesktop.org/patch/587830/?series=131765&rev=7.
> 
> It was reviewed as an umbrella function which can be avoided.
> 
> v2:
>  - Rebase.
>  - Improve commit message of patch and cover letter. (Badal)
> 
> v3:
>  - Rebase.
>  - Add couple of comments. (Lucas)

please avoid the cover-letter for standalone patches. specially with
cover letter that brings no new information.
But anyway, if information is needed in a standallone patch, it is
better to add in the patch file below the '--' mark under the sign-off block,
so that is included in the email, but not part of the commit message itself.


> 
> Karthik Poosa (1):
>   drm/xe/hwmon: Remove xe_hwmon_process_reg
> 
>  drivers/gpu/drm/xe/xe_hwmon.c | 89 ++++++++++++++++-------------------
>  1 file changed, 40 insertions(+), 49 deletions(-)
> 
> -- 
> 2.25.1
> 
