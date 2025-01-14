Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DACE77188
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jan 2025 21:33:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A201A10E10B;
	Tue, 14 Jan 2025 21:33:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V8kjZVxG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5136B10E10B
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jan 2025 21:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736890432; x=1768426432;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=AhcNH63oeDGM5pw8ZAZKBQ4BnniC0Z5y2ynculhBNYo=;
 b=V8kjZVxGR32r/tbDAyMzZ1yVDtRhFCr4ZMyDycxOXmnXXnQSUupJZDYU
 HWOTbf3spZFUN+NDUFX2fTnKGQWvqrT5ZbqwB3p4MdDwo4E/jQGILb7rC
 TvlhAfJ3z7j7DXlZZMyYh9my38ujYJi5nU1SrMZzR0E8dLHweDVrOHEUe
 zCPAWDktFUxswfrN+60a8lEH59C/VyKP5PqRXKfe3RJs6P3LCCZQ/Zmvl
 lnhlF2jse3kF0ySjZ8uI058Ihf79I76yM9ajjgM/V3lJF4tzR5FSxlYXC
 LwhvmmV8PGU8/aPqW031wXjb4xwsyHYwZ8550N0Yv30MlTPiOlLFv9uaA w==;
X-CSE-ConnectionGUID: n4/4HehOTmWKJ2eGL07jww==
X-CSE-MsgGUID: Up8y3rYdRKa1577dKYf84g==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="37436418"
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; d="scan'208";a="37436418"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 13:33:52 -0800
X-CSE-ConnectionGUID: PqPF+0G8Sz64BtwzBIE7Sg==
X-CSE-MsgGUID: cdp+kh4qSuuVmX4dcR0Q0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; d="scan'208";a="109873514"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jan 2025 13:33:51 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 14 Jan 2025 13:33:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 14 Jan 2025 13:33:51 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 14 Jan 2025 13:33:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hqOOdZ2lHQZiWeY2KDrAQj0BVXb+RcvuwRARgkIOT+NnMiJM/TnnpT/wH2DWxeuvL6uImrxymK5s/dx2APuc+nJjvFY7ry7uD21DrMNJmjtH0oavTAOEY/HeBdXy+n2gvMvvi7Z4wtBbhgS/HMOWnjxqqEtf2ny/Am8d6foz92qaxnPa0GfcJAaUuisfVVf+HpZxVr5wqK+xtaClh2yLcb/DtzEZqZEUsteFg5Hxb+xiBrnL4eUPCk1Og8AvjAM9xKtOGE3SjmKVxRn5U3KlrLqHqDMCwWlYT+lt7lxy7WCIEkmFxaDjlDW3oil4GtqC2gUsvrIdUJ+vZOEL/2JgeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m2Eb22ELgG/xx5e/s9iHhuoHYosdXQLRMSOyKeepSbw=;
 b=yAYaeFxuDuG000qCcLamZUAetXkBc/kEj2aspcrkIHqg0fM3DcN1D0FIPNjNLZWPvmIAbmp3lIb7Vzemu8nCeIiYfqeBBtUdvQ+yU5MSzZv5KPb2pxfO2nt9SU2fdB4Ap5iXOy48wORqI+BHop94hNphrXqCOlljaDVTcThaFm+9ZAX6Rr74Yti/fmxLV8j37fLp4td2uvWU6XohJqDNyT84gd6qQ3uiTQVZVm58ow86Yeei8IYVlanmtOmAfhjB4bpTgRpsY8BAkK74BO+R+c6wSKTmaHu0ZiOXIjyu/qrY5E4wVuauRCG2eLxlsh14aqjwIiVUyuFr8ul+O5cmag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB6963.namprd11.prod.outlook.com (2603:10b6:930:58::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 21:33:21 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 21:33:21 +0000
Date: Tue, 14 Jan 2025 13:33:19 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.mrozek@intel.com>,
 <balasubramani.vivekanandan@intel.com>, <jose.souza@intel.com>,
 <paulo.r.zanoni@intel.com>
Subject: Re: [PATCH v2] drm/xe: Mark ComputeCS read mode as UC on iGPU
Message-ID: <20250114213319.GD5109@mdroper-desk1.amr.corp.intel.com>
References: <20250114002507.114087-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250114002507.114087-1-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR07CA0034.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::47) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB6963:EE_
X-MS-Office365-Filtering-Correlation-Id: 21af6b92-480c-48b0-958c-08dd34e3117b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?A0EQjNQU6YlNlZvbnLlTdxwhy04ZHmdTTdEQt6QgD7oFG4v40NFN4kfNod?=
 =?iso-8859-1?Q?bF0rk8LdrHxX90ugroyKeF2inl+r6Uz+UpgRcQTeTb0cL+eyg/LdyVbbIK?=
 =?iso-8859-1?Q?Iqd7xPrBUKCoaYoM6p0Bp4SJPR9gtsrUMufg95o/iajKCEiCN/U4ls9nAK?=
 =?iso-8859-1?Q?Cmy8dKnYoY4NV1ApoF2LH+0gqxsg/VSjypTLIV9P+IJgRhGOHIe1PbsVu1?=
 =?iso-8859-1?Q?SBCcmXcusuln8pMAi5jNzMMRSFQGyYxo6vWhqqt5tX5v+MPLzwTfJWsCvl?=
 =?iso-8859-1?Q?LPxK/RrOlJLHsau8PTBoF7C1XrY2sBa6uNANwm2lYTQOVxLkbB02NL7846?=
 =?iso-8859-1?Q?MhxsQwTrj4mCHN3CUMr6HfJKYJN4FfrwSyeet695c2B3WmLs9lpaNiBeWn?=
 =?iso-8859-1?Q?UA+iuD9OQisWdBHc7K4JGSMkWeyiRPNve2ArXONO0CedjoD7DXYjfCejqy?=
 =?iso-8859-1?Q?k/1vYtrYXQK93TzCcx5ShdpckoXgpDbciWLTi3CI4NiAODwAdurHVuLb4e?=
 =?iso-8859-1?Q?RQaIvsTNS/dEa6ch70jheLJ4I1dgfNt7V/B0Uvf8vUyej8EfRmHcBkx06a?=
 =?iso-8859-1?Q?IYSyhLEt+yA5hyJ+UomI6mhdmV/pUxCf/njpFACTvK1cbKOzot+8A2PpMQ?=
 =?iso-8859-1?Q?9oqrLo0cv4omafgkP/LCvrq7g03HCpCxxFvQj9o1W1SKzh36WE+ww1wRaL?=
 =?iso-8859-1?Q?4x4Wd+/WlBWNhBBs0IrSabNeFRg3lc3O98zqgtDYuq5wpLtvwqn8Xlhc1K?=
 =?iso-8859-1?Q?tPKe2KQuqXIjjhc2L0vqxJu4ASfnMQbRa30bWulHD81JtTAtPTGlGKmIrT?=
 =?iso-8859-1?Q?fV6ecFeF/4NXCz62/UH1NelItRi8/JefoWhsHj14n00du/BF5IRtGGn1sP?=
 =?iso-8859-1?Q?BCluU02trmpC0dH2Gv+wpxp0PohQX/XwNz5ktNjfCB7h2itcFXbEJc12j4?=
 =?iso-8859-1?Q?JJNDoVjnjJbJqfsQ8lVyXNxrWEPiOOolrpJMdhHs7LhW9j1gjYWf+/1OBo?=
 =?iso-8859-1?Q?0tiUWZkziSiqdzIaf3aSYNYISFHnq2m1+Fa+5ueFSn1oIvQ8cKmDrfV+Gv?=
 =?iso-8859-1?Q?HAVpAuXs6x4NuQEXOr/Z0ZgZf3NsRFe/jbRZqYfUT63BZ9xJ8Qa4zusM+Y?=
 =?iso-8859-1?Q?+3Ps+GIawUucL5o9VRjVCZUNZupcVbA2IaGJvEUBdwlvFeS75lqjmCne2r?=
 =?iso-8859-1?Q?cOfJ35PMZQs+hcDNxPU9cy8OAgX/VQZcvA8ojZ7Q7AQB+CNElsKiZBZzPR?=
 =?iso-8859-1?Q?S4bGIoitoikOZQKsHwX4XlVwblwiFQtGUbxBpO8unO+C3IO64PjJt7y3RH?=
 =?iso-8859-1?Q?zMEB9rnm/W7ub8038EXrTOwRtEcV3nAPNL1/HvxK8fhC3F/XaMoayiX8FS?=
 =?iso-8859-1?Q?vGpxaMifUkkl2Vxsth5pnSAZkAQ39DeCyYQZpx9pPas3fXeIOmcfwirivD?=
 =?iso-8859-1?Q?d46dtCor3TRf/5W1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?tP5+W+6P+9VRJ/xWoCO8Pgj5T6hEV9Sxom3OB3P4NK+GP50He38JYOyFkj?=
 =?iso-8859-1?Q?Az/HMN2C206Ura2TS4WFxRk840dK2sn+HbB6SopmzYG0KYr1sGZJ5c9ZMU?=
 =?iso-8859-1?Q?fRKA4VO3ohAg8dSAvMT7qd3hlRID8gBb+OxBdAYWs1rblRoRYDqoVRGmAj?=
 =?iso-8859-1?Q?fIsitG0bXfGvblWFEskyPaWAdOLJiv2gX/UsAWH9gQZlF9a+UtWPDfJ2ev?=
 =?iso-8859-1?Q?99MbrTdEilNTbziGVN1BB+GzsgfSC2gaiKP04PsdQF9G/JJAF9V9qaBi1y?=
 =?iso-8859-1?Q?8W2+dzxkMfyDe/2tiWRlvbaPtRiVeyp0+MnquAYgWC3dVcbcYbTO4xKY05?=
 =?iso-8859-1?Q?N69jvLaruYBtOTDAo4MktyeyyMOv9soUorxjp8/lkoIiZ15KZIndoSpqAf?=
 =?iso-8859-1?Q?yuMVavsI75CjmsBqR1LtDmlIAk2GK42t0t4mfvfprmi5Ef7LfORw9VSSeE?=
 =?iso-8859-1?Q?kdEX8DDJIpC5cuOFzWFToBmQAh6YF2UWXHVCRreqR+y9Z7q9zG6iqw62E5?=
 =?iso-8859-1?Q?+PYRZjoeWkpX8J+xM94W38mLf3UPIRwDNYYCFUmtIlfkhjcjXC6imSMFOV?=
 =?iso-8859-1?Q?jaCB/V95M6EOZKhUf8qqJ7VFofcZ8ycvhFgMpSChEznN6u0qv6dkiC4gy7?=
 =?iso-8859-1?Q?1/jXL9iJKT6v83TmPefhQTOwrUCKa+fOK8Z5+n3lz4EZL1gvk4tzjXKbGL?=
 =?iso-8859-1?Q?28Du1OPbjmT+6dq+urgHBWTfgwUYjX3vHaBiE+aEgo3gb20lh9AZ71vIOR?=
 =?iso-8859-1?Q?cDMsOBkCqk/TDUfDkqrVwV7/nVyIGEWeeHh6d9GhkIFSYoq56OJMPwJZHQ?=
 =?iso-8859-1?Q?Tk61o2OT0toyHpQ3POfl+1yNNPw68C9JMvHMHP5WEhjtwdvLJO4oaTFHwD?=
 =?iso-8859-1?Q?TnkyF5RWCnhM9qpayilis8IRRIWrOMMb5omQyORG0pMMkLv0BJ5FQIkt7A?=
 =?iso-8859-1?Q?UQx0HJ9wlWtMfMQqaRJMSuU/ASsd8K3eWf1p9JtHXserjxA3b01NjGMpUo?=
 =?iso-8859-1?Q?OnEC964b1udCCsmwBIG9PXkTaOn2AjWLw/RfuhLqiUd9WqyOXcLJP1yA/W?=
 =?iso-8859-1?Q?u5qcyl1vZ6Fe9cleLHcn+DknUIZFC/DNZW8ElqgGgcihdeXAZisrXaS6er?=
 =?iso-8859-1?Q?/dHORCj6d3DoMyMPzOQoyIx6OC64zheSCvr0baoW9XRUARlCcPlrebt1SW?=
 =?iso-8859-1?Q?0NO2YAkP6ICUeEsTkzMdLMljs+q0yl1B0axgROCVTLjwEqt5ffXqDNDgDZ?=
 =?iso-8859-1?Q?hmp/CA6M3WKnAxzArBSqbz+fdRKARAT7NLz9GhVPHqKNJs9J9vNM1wkbSs?=
 =?iso-8859-1?Q?YsbQXzolTmJj4tFFUEIzNWBZXusTcHmQZEHLxAYMQ2OexA2O2T6eEqV+JR?=
 =?iso-8859-1?Q?zXRnglOCzs2GZ1NjPyazLJUnv9hkAyhnGNA8aOiGLGarj7flc9rvgO1OWX?=
 =?iso-8859-1?Q?KAwOtkvTU38dYcf1SJ4AjuhfENcmznBS5nX01/5oy6x9gwU2WHOf4rlLSm?=
 =?iso-8859-1?Q?n8znGu9nQmUfmUsDf/v5XvBrnAE8uSmuTP9j5Ns7u5eul5hhFB32X+GYlI?=
 =?iso-8859-1?Q?Q/x+auS6CAPEBtfVkrrk3Owvn0T3X9PTYw4lcuYtBE1gbqzC7c/oQMEC4b?=
 =?iso-8859-1?Q?aE3AKJ8TWr6YEhxPpdPtDjucxNUjVW3NHimqdby2lKJeCrCLWh0tl5Kg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21af6b92-480c-48b0-958c-08dd34e3117b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 21:33:21.3551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rPHg4tDasC7cCvbXny8SWYRAwMRN52z3KnnltloCJh7uFL2EtUe2uBpLJTUlZGXTZg4ldMKvPs3aGA1lC7ycugP79KnYtm9Yrkd/CkEWPVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6963
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

On Mon, Jan 13, 2025 at 04:25:07PM -0800, Matthew Brost wrote:
> RING_CMD_CCTL read index should be UC on iGPU parts due to L3 caching
> structure. Having this as WB blocks ULLS from being enabled. Change to
> UC to unblock ULLS on iGPU.
> 
> v2:
>  - Drop internal communications commnet, bspec is updated
> 
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Cc: Michal Mrozek <michal.mrozek@intel.com>
> Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Cc: stable@vger.kernel.org
> Fixes: 328e089bfb37 ("drm/xe: Leverage ComputeCS read L3 caching")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Acked-by: Michal Mrozek <michal.mrozek@intel.com>
> Reviewed-by: Stuart Summers <stuart.summers@intel.com>

Matches the bspec update that landed last month.

Bspec: 72161
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index ac9c666a9652..fc447751fe78 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -422,7 +422,7 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
>  	 * Bspec: 72161
>  	 */
>  	const u8 mocs_write_idx = gt->mocs.uc_index;
> -	const u8 mocs_read_idx = hwe->class == XE_ENGINE_CLASS_COMPUTE &&
> +	const u8 mocs_read_idx = hwe->class == XE_ENGINE_CLASS_COMPUTE && IS_DGFX(xe) &&
>  				 (GRAPHICS_VER(xe) >= 20 || xe->info.platform == XE_PVC) ?
>  				 gt->mocs.wb_index : gt->mocs.uc_index;
>  	u32 ring_cmd_cctl_val = REG_FIELD_PREP(CMD_CCTL_WRITE_OVERRIDE_MASK, mocs_write_idx) |
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
