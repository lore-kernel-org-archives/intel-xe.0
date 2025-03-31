Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10655C3600B
	for <intel-xe@archiver.kernel.org>; Mon, 31 Mar 2025 18:55:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87A910E19A;
	Mon, 31 Mar 2025 18:55:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M/mMs6ij";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EAE810E19A
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Mar 2025 18:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743447354; x=1774983354;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1XuxCY7CM24sFNvObGHoyL7lcZKZsQZWn6cZOzbtpl8=;
 b=M/mMs6ijAwSEEoz2+LOArdypBn/NSTAKAz7EObG+P6QihGsxg+bZ1aam
 LaVcfVg936nWLHHsT/ysFNuwDr0wLF+YPpOBjPSKvBpeGDnhYXC/2GlBb
 WwpvHAYTkn4jG+fbH5MUn9mtvqafPsfw13/HzF7wIeKwxfpnyJ4iApuT6
 qA5V3EWSWRGm9EpwWvl93N0uPvepp001Gg+rkMn1HPS8/O86wE+pD6Kn7
 77a8VMoYa3zTpnwNslToo1+LP28afrxSNJ4kfziRmX91BzHrshN50Rd36
 KVqNE1EhMi2imcqWYFh+GwU29KDthF2WBGydKVlhZ46vAEVlQ6ZXtcrYR g==;
X-CSE-ConnectionGUID: 3WRiA3mBR9ayrgduvl9p4g==
X-CSE-MsgGUID: XisuI1rmTBSF9naJbaTWjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="48618349"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; d="scan'208";a="48618349"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 11:55:53 -0700
X-CSE-ConnectionGUID: UC5d7wPSR/Kc3nQ5Y0vAOg==
X-CSE-MsgGUID: 1irfcxwqTwC593nIrN66uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; d="scan'208";a="126973655"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Mar 2025 11:55:48 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 31 Mar 2025 11:55:44 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 11:55:44 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 11:55:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MmnnRslTbFM+0OhTQnyJPECQa/6THCeMJDYoVXXPH5gQDRAQ1ctuTpeiZ1QLTwYEVZMvKH2BRe5TU0W1Lw5yOazPbMKsYGPVK6uIorrBiWMe7aI43QdUDKHuI11FwY3wvVRQUv5BOkUJlF8uhIncD8Oc42j78K0Y8UIx67tVERKqViLBoRLd6jjPS7lkCX7/v8mxvRriVH/XWGjkDQAS+kvdh50DjNj7+JW4d8AMZJZf7zRNmCtMMdVewuRSzxFKI4kZV9ZQlmi09ZYiTGxFmW+iWfPX2ZO2jCW47z5IXWuephRS8q0+t0hE/NIi4kyjp/t7kgB6BTvuamldYyUrRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1FlS/E9bbMkA/cDSLfyiox3DKl76DSiJdseXCOGMpUc=;
 b=HF1FwDd8hje47Jv6BTTj8BbKhgiYf63IySZbJ3gox7TgrZN3q5hzFFlviXUUZs8/U6qroD2Nesk6dYJV5f6tXWVuvtvmqjOiQVOWFk/JVY76GpHpIcUKIT2eX53s/VrW73tdduEqbu7x34qMWdJ9zRyo1WrFBsZ/tAruqdQkBdVpuTNkkrW30RY3JncNHduupf8fB/NOjhbClc7ywAshconfz6FCAHLde9VtYszJpfQ2iEkTyt0aYwkETf/PZJfzSkzEBCGmEErw9IBDnrnPm/6fj30vaDL0fLs7t+4JrFFaan2HgljTYIaxlqT0BybU5B+DPUo9nuIQlHhTbBKoZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB7197.namprd11.prod.outlook.com (2603:10b6:208:41a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 18:55:42 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 18:55:41 +0000
Date: Mon, 31 Mar 2025 14:55:37 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>, "Juha-Pekka
 Heikkila" <juhapekka.heikkila@gmail.com>
Subject: Re: [PATCH v4 9/9] drm/i915/display: Expose AuxCCS frame buffer
 modifiers for Xe
Message-ID: <Z-rlKQdbC6t-tzTJ@intel.com>
References: <20250328163537.58942-1-tvrtko.ursulin@igalia.com>
 <20250328163537.58942-10-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328163537.58942-10-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: MW4P221CA0015.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::20) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB7197:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d27b60a-7a54-4564-2a3a-08dd7085a228
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?rqp15l2TC+FZNqjZm93nSeFIMNn8mMVpKWDDRd4BL3r4LQQZC4Gfhy+gR0?=
 =?iso-8859-1?Q?mBKnDfARvwBbFXdYoQjDs2WpfPW5yuk7cHRVml8xQG7qb8mo3LQuR8vuzZ?=
 =?iso-8859-1?Q?E1ZerU0MW7SHp0G4og1GNfrAt2txVanutHGs2w+Jb31nII+ze34JHkgU68?=
 =?iso-8859-1?Q?QtqAhWZN5u3zvUnVpCQ3+kg7TGWRXZQa9YIbDGktzTPTd95LaBXR7kTN/Y?=
 =?iso-8859-1?Q?FQXnwIDN3lqARCcDJ73k7OnSVf3bHR89Xj7lWzxj1Zz+4teQiSTdNfYoR7?=
 =?iso-8859-1?Q?WHOkUeQyVrxxmpYgEkTAeG+vv+83lk312cZ7ySiFCC5b9kZ27BKOWAVm/M?=
 =?iso-8859-1?Q?YacvHCd+JZVIzcwIjuX4m4Koq2OBbQT1EyOxa3TZNX2Q1fvAJRffN+sE3F?=
 =?iso-8859-1?Q?xqU3bYrOMbIDQc85l8xqe6qamLKCd50AV+mVfqD/CSJZokrp7U/ae8odTE?=
 =?iso-8859-1?Q?8YPVITArgV0+T0aDK6p0zJDnqKe/68XK8a8MYNtAN+91cZOML951QL7j15?=
 =?iso-8859-1?Q?gzpvzys+Qt2XeassYZUf4TGRd3uVRfpivkEXmbnPlcAp/i83NVqk9TP8JG?=
 =?iso-8859-1?Q?WpR1QNytetWjvnaslGfbtNW0rXCJS18twgN8GkEO2uUVVx/376tlof+pS/?=
 =?iso-8859-1?Q?4SmPvMVdnj97PFXb9zkso559nxBZbc2nqb1X52m01Aq81hoTfa1w489fF4?=
 =?iso-8859-1?Q?GnFgpfdhNcIgdwz9no4ys3ZYTeT1pxxostpUzq4Jr4Ryr508w3K2yOR1Rr?=
 =?iso-8859-1?Q?U6yW8kOKn0sDNKxvz3zipoWQ/r62ox4NjPnKQkpEMfZZLLW/hsBuvolJxd?=
 =?iso-8859-1?Q?NSMcAHI5o+LAHIGXQviBjxzwTADZse2HFbExf1plhVfwMEkdeSni6JCFWU?=
 =?iso-8859-1?Q?g6yG43atm0zlKQg1cpCr2yHA1r9N3PxhKgDq0GmqBFerXdVONm7NX3d/3q?=
 =?iso-8859-1?Q?q8UDH33tNihhi44ebf/qnXHUMYCnDr4X8FSpzW1FnGnac7iZEYu5qm0Wzt?=
 =?iso-8859-1?Q?6+JsOIiFBjI0b3CCqfRISiwjph3Kg1AO9yZux6l7C438zGM61XJhOFXk7e?=
 =?iso-8859-1?Q?QIZBBGXXACWYUIsqZUdDhEU11iSTXeEnSGjtz0xxlr6NwcLKNneiGQiG0U?=
 =?iso-8859-1?Q?9RHxka9M4f73NOt9r+hNXxlSoHwSlW+WLd+msS7PFGa9usyOJZFP4w2UYN?=
 =?iso-8859-1?Q?sEwZexl8YfqLSNVplodPUtqFkkcJuUl7hfIdLtCJt33jR6IwohgEnWw1C4?=
 =?iso-8859-1?Q?dYhOGeOTJM0IzqlVC1cXYQL8FxaRwBLkn5el2ZeGd8o9T97iZXcqiQjm3u?=
 =?iso-8859-1?Q?nsVacLomq6jnsSVPioG1c7qclyADUFRkaZRKnT+qfaQOFqrmab0K5b0dfW?=
 =?iso-8859-1?Q?NQ5aMLJ3V93vlTD4mqel6iuTX9puEHeLOGVEPpFO/edEiqBd3FXix/JjoQ?=
 =?iso-8859-1?Q?pu7xZXSRlhsIwy6P?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Op/VpmLQ9KRFLWXoYCrKcDiSPQTM5aiSSPSO4i8bLBR9Qm9qgnQ5IWuQ23?=
 =?iso-8859-1?Q?WHGOHk2VbNHvi3bHvPyMsQcrWQTdPGjoFgI0FBE95LsBSje4iS5hZ8fcf4?=
 =?iso-8859-1?Q?KAHAUwEZQHtFdHMKave9f/bA2AiDU5bdX0fImsqj+FqzTrrJ0gIRmAVkvJ?=
 =?iso-8859-1?Q?NeVNNt7VMxvdO3J2ySKS0t7LyDV9/9bbBFrq64V3MZxfbxuMOJCiUsdU7s?=
 =?iso-8859-1?Q?g6OMTR6uW/6TWYAOtHxDMod2JhOXkhZiDnNf1X2pucCDEcrOYx6Rs8w3SI?=
 =?iso-8859-1?Q?StHF3lBMl7BmT5qP35/n86KHELRjagAhgh/sKFjUtQrOyPSIhCEXoqa8vC?=
 =?iso-8859-1?Q?g8uRjuuj4C7cmd/4dASDcBwes5+br/BEz+yOMiCFKLStkF70CFZB+rBHVk?=
 =?iso-8859-1?Q?FDFvI2eKmLfOLNW7Q+IJTAhKyjzOxOuJdURcgTk1uXC6mj/Bd18+e/1hTU?=
 =?iso-8859-1?Q?FiumaKFjihOU6269AxFUUCnlH4PE4MbTPuuthVJnbRg5rRfExUd/bqtkHV?=
 =?iso-8859-1?Q?qgxVMk3uJvUbCSt0xlnNegUM28+mfUXFQQCSS7W7qeyNJKcCbjzS9/IeKv?=
 =?iso-8859-1?Q?1E47k21MmnHulstnH3udW7Kxop7oYIIleSOm/Ni2dcb7TfyiljECKK1rF3?=
 =?iso-8859-1?Q?RXtpSf26ielNA+bRJyVQbv4b1o74Q6TgwpHbEuLtPHcmwEGDSNd9AFlDl9?=
 =?iso-8859-1?Q?1zwGQgtUv5com3F+9B/Z0sp0Wdee+JijbPf4CaWF9mwBpWn+aOeIxette1?=
 =?iso-8859-1?Q?DO9BJUFEwUbWW2VuMzhSVfJjTm0YVqn5vcIjEA47ijrXg7+hWp11FdfWya?=
 =?iso-8859-1?Q?wqqhj4WNVMC8RHoE/dndhZ/uRmjBg98Yilu/WIqKK1slPKhjivEat8VW6u?=
 =?iso-8859-1?Q?QgMVD1qe2XyEvjD7Sel0ouyPZoJJY5QVJUbyLeiWc5KALS0IchnMzsgSo4?=
 =?iso-8859-1?Q?XEzDmImgS7wREHrmMG2ro6rnkcHfjv6gsi/r5uhfwjCP3jQG46DjxlniJX?=
 =?iso-8859-1?Q?wWfOGrKDJDIAnaXNjP+Y6P9727leL2o7cyHUhwN1znOuOO2A7s7rOGIbUE?=
 =?iso-8859-1?Q?xY4j7Msi1LyskeBJoBcgMkNeY0D7hCgyijKb7LxqkGRBmy3AFUPxB/TiyQ?=
 =?iso-8859-1?Q?oIXbExMK6gVmLAs+hCAI12laCl3zEzAXemvEEGZDnrPeBTbaA3JDiIcSZz?=
 =?iso-8859-1?Q?SyJuT0XUh5wvzDpS1YOyXsly2fVMzos/aiPK+q6lKIWhsCfLiUpLhrD7Eo?=
 =?iso-8859-1?Q?EuxtkBzQY6ukUN/O5T+8RYxZHZwTMSt9+lSRfFdjOcZK+iqxB2hI5a63wH?=
 =?iso-8859-1?Q?lU3okfJFYW9q4bXGSLYgRVEfFvHMRri2HoghSHsIG7IqKzXinLh9VSsiCT?=
 =?iso-8859-1?Q?E63y6cvKNO2B3UAZv6SYw7mvYyxj+WRqxIoUDKZ9xr+ZDsLkCDwPOwgG4V?=
 =?iso-8859-1?Q?bXggmsqsheAlCc6GY1tAT/00a6oUYk29nQcMx1HFrbiSsgNiJ83dXp67BG?=
 =?iso-8859-1?Q?7v9/ScQdLoAacJlhy/E7Z2IvB83MaLNMfi9U4O36DhGjQOftJrzpekA7LB?=
 =?iso-8859-1?Q?rKV5e02Dg0H0xEFm5l6ArZR0sgDAcgEGcTqthuGs8k+CUieBZ/8zjhuuWH?=
 =?iso-8859-1?Q?VXQYGGUUpfljFPeXrqZytfjLtpQPO7898BwbRxY1CXGMm5AUPARBNViQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d27b60a-7a54-4564-2a3a-08dd7085a228
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 18:55:41.1889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 95vQHw1LwQ+ONTKDGLk3xacLsdXJAMXoRiZChEcd5LLMy2Xi+T+TXH7tMQWkb5sfcKrvXdexAAKZ1EMXXc90Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7197
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

On Fri, Mar 28, 2025 at 04:35:36PM +0000, Tvrtko Ursulin wrote:
> Now that we have fixed the DPT handling we can undo the nerf which was
> done in cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if
> built for Xe").
> 
> Tested with KDE Wayland, on Lenovo Carbon X1 ADL-P:
> 
> 	[PLANE:32:plane 1A]: type=PRI
> 		uapi: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=visible, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)
> 		hw: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=yes, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)
> 
> Display working fine - no artefacts, no DMAR/PIPE faults.
> 
> v2:
>  * Adjust patch title. (Rodrigo)
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> References: cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/display/skl_universal_plane.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> index 8739195aba69..182868fba6d5 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -2908,12 +2908,6 @@ skl_universal_plane_create(struct intel_display *display,
>  	else
>  		caps = skl_plane_caps(display, pipe, plane_id);
>  
> -	/* FIXME: xe has problems with AUX */
> -	if (!IS_ENABLED(I915) && !HAS_FLAT_CCS(to_i915(display->drm)))
> -		caps &= ~(INTEL_PLANE_CAP_CCS_RC |
> -			  INTEL_PLANE_CAP_CCS_RC_CC |
> -			  INTEL_PLANE_CAP_CCS_MC);
> -
>  	modifiers = intel_fb_plane_get_modifiers(display, caps);
>  
>  	ret = drm_universal_plane_init(display->drm, &plane->base,
> -- 
> 2.48.0
> 
