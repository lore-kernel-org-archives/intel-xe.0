Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC2DC25B78
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 20:49:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D82310E5FD;
	Tue,  4 Jun 2024 20:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="biLA0pi2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8251C10E5FD
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 20:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717534192; x=1749070192;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=S6Tc7BcjtIw+lyLqoOw6yUwhPoj7HNFcyAL7VHmETFg=;
 b=biLA0pi2TlZJjYjxzkff8MwQjWiz2geimUJ1oB5sN2aiDFsvDY8qqG3l
 Ry1EH3OrUlYGTMuHuXNCpPa2MfU1J7D/X0lb+q+0KERw65ggLvNc6I8dM
 sSWZ6fBsXUMjwyTsVNMj/fQxAFUAdZWiS6CXyDGxYwG9oYasA4URQEXmR
 vYeXCjOs/J8L6kX05j5xEQS25W19bYtycF7qfbKOoowdE+d0vWhELTdgJ
 oZescsONdWnNhKrGfmarCF2h/dMbbcz+SR8ih3pJYE0vde+oogj+isDsb
 sUTf+8gqdL4I3TjjM4DWExxhJc4tVTUPi6ZihODpEAIYWUETybJnfIJtO w==;
X-CSE-ConnectionGUID: HMuZ9imbSGiSLk7GOIQB9Q==
X-CSE-MsgGUID: WjMU6SGkSQyL+D3theHPuw==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="17047247"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="17047247"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 13:49:51 -0700
X-CSE-ConnectionGUID: Krju4In0QfST/r6x47QfzQ==
X-CSE-MsgGUID: q1E89O9DSkeg4+TV/8mOYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="37365871"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Jun 2024 13:49:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 4 Jun 2024 13:49:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 4 Jun 2024 13:49:50 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 4 Jun 2024 13:49:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PTWbvLbwNaTxP1kALfR0S8R/aXqnWQJ663eIft4qdOGulexA8rGJ16ySyLC+vVdxyVL/Yuio53JOm/y3TbBUcPc2W+R9ygn4FaStAZi3tL3pOK0QzAqGzH5zTWgjqKmRa5M9PUypdF6LzcxRktknlf+LbS7QdCoANfCM1MsGmdIREF5hV95tM9bgPepEj94SCLyY23zZ39jyWpFQjRrm3Skp2OMUQVtsrdRuWBtqYjdRR/vg/SfrZy6YtN8U/vrOOBkckaa8XuULpiXaZPmYrgXAqrxbw05oux9JlCcBQ1VnhOW3nUtahXBftecNb0+RbXAwGIw3O1WPKdDr6GdwtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K3uVnWiJVAEWaJXtWG91DpiiDoZ6HmYoQAYtTKCdzwc=;
 b=EvNBZpblKEGDyZJd7+sX1TryoYMGKNqyBXS1RKIDSyfravfjV43sChORMkfVGYlHEy/iRImgHk5pxW5CyZQDwklfcnBrXYW88cHatz3ehAdhT3s25NqHN9iNgobtfEel44VTjGcqt5kk7QpSR9sNbXhqoN5jCk9G/LQRKlPTf8qzEC1gQnYOkpS3FA1qR8h+uXNZDekm0O4X1chEJGGbx/94tv7NADYgCY6CBSH3HPzpH3GstJHTJN8OY3GZN9EaoBIALNavpQ2tuTmuk948JGzqbwg/kxEHC8qnmbPnvNbhA7LFbySUKNlZacD4tvluGaQch4tdl3o7/X3B2WlaDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6335.namprd11.prod.outlook.com (2603:10b6:8:b7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Tue, 4 Jun
 2024 20:49:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 20:49:41 +0000
Date: Tue, 4 Jun 2024 15:49:38 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 0/9] Ensure xe_force_wake_put is always called after
 xe_force_wake_get
Message-ID: <4vgeahm7krfwnem35kk6qmilxotnffbbogqjohqru4gdinhpsv@72vm3cfb5jrm>
References: <20240604110225.29495-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240604110225.29495-1-nirmoy.das@intel.com>
X-ClientProxiedBy: MW4PR04CA0108.namprd04.prod.outlook.com
 (2603:10b6:303:83::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6335:EE_
X-MS-Office365-Filtering-Correlation-Id: 686adf35-8823-4fb1-b070-08dc84d7db69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iYxarVYHqssmvBxCeaQWdzpJdyZ+vSH/UZpd4JRknrUFqt3GTmIFBQn5libd?=
 =?us-ascii?Q?rl1bQCp9Svt2rv5CGddzSM2a8Phr6uS0SdE5NMjNR/accldCHTNpsy+kkaxs?=
 =?us-ascii?Q?wXICW3hdVNgx4LUx5C+rp1P/2XyQuYv6Ck9rKQ08RoIVXbBb8LxBvErHAv1F?=
 =?us-ascii?Q?on9X46K3GmWJD4ORqrrZ1mlRfRInCgGPKYShd0ZbHDVhafJyTo7PRUxGKMgH?=
 =?us-ascii?Q?RlMZjKDZ3m+kzQ/NJULNX1TqLR1+aJZmwf6HlUy7xT4hyPXcdo2hTUEM3awP?=
 =?us-ascii?Q?PWZ/QdwHFaLKmvJ1F9a4VrtbZ++//BVTtCTF6wZrwlNZ3pk+6KhiZSwBnwu4?=
 =?us-ascii?Q?Cc0JPBLo1Ijd8va/TYpAiPKgCoe9MIwI3QcPPlWPaacn4pFKJjcnzQfOeRPa?=
 =?us-ascii?Q?+bNGui+0281ZVW2i0yBH+OF4FKlKVVNLLcZUUby5aSIKwuuthmBFFyXd91/f?=
 =?us-ascii?Q?azvQAlW7H1I9ZIhI1nVfxDbcD5nTw4GPQNDu/5w07D55DrNvCEzPhWNY7Iec?=
 =?us-ascii?Q?KmBKW7T6QfeOLOjwjBPIHBtnIx3A60t12ksP/RObWBHHeX8HomSN20rRfrYG?=
 =?us-ascii?Q?bmolIKUj7/mcKzhYKZ76nFhrEJ8aeJ0le7+z5OuQvQPnpbHgH1L1Pu2FRgLf?=
 =?us-ascii?Q?h5tB90H3HEu/hVZDv5eCsmSgfK+RbKjLPUyEKRQh+Snl/hPeBZyplREQ8KCb?=
 =?us-ascii?Q?+M3nwDXxIkUrEsQyNSPrPoWKVBQVf288hG0avXW6jaRuHuaWY/A6UyJ1b91Q?=
 =?us-ascii?Q?hHAK5osqV8ew0riiIrzuy8SOwNU9FYYhAPjP+9ZJ9HVrOExkbhoCWWPQg1O1?=
 =?us-ascii?Q?DtaGhFVpOrt8D4VdPSBPu4FiCoX+DfdZ/+PWjgqOXEKo3FKXORAgu5kVDrl5?=
 =?us-ascii?Q?jKQW19ZrUsvymGxyPFQwpPRYmxQo0bTGlh0d1/e620bjJH9IbUCwGUnnz5Rj?=
 =?us-ascii?Q?CXa26YhO0nmYiiJBpfFQVHTfWny4CnCgcZKdbr6CUZKdOkhqYW6r7w6Zb0WX?=
 =?us-ascii?Q?FiudXYbvUWbU0rLKZhqm3WQRRqSK5/h/1Tsrez6wzgGaavqV8+JYFhG3DCpo?=
 =?us-ascii?Q?FvtTvlq6EKvVrHr80gZuGPhyM1c063cHqCGRj8dPyurPjUj6iYUZVD02GbaV?=
 =?us-ascii?Q?rmv0s0SCt7TuGtpjk0p0+wDmjeDjioiNDWk98sUi4L1FU0Py4wD0QtyCY7Fo?=
 =?us-ascii?Q?5a+KWc3gU/vFV/EK1JNnVjDQ6vZOncvaCOghxlY0CaAjY2gcpMhoO7FkpjI3?=
 =?us-ascii?Q?T2XeO7USR0K5huaLGh7D5lpCOsA1mHvJnmvdjFSkEA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zhYsrwsC6+O9yQYlgMVO/4+mD6MgfPtDJur/F+bft4K6E+inqi3zGC3AqHr4?=
 =?us-ascii?Q?ij9SiltXLc6SidMk+gpVGlUAOdmssZ+zKPmcvfNrjWTY20zQHSMxxYE7bpy6?=
 =?us-ascii?Q?QvIic718EBwXEEgDdq087E178BRX8EEc/Xc6Nk66CBpDq8oz0IhxtfKZ23TJ?=
 =?us-ascii?Q?Ll7PgyBLR6Nma+Ajar2odqLvELWgYiyr+pa0fA6N/JucOE02/B95K/rqpCSM?=
 =?us-ascii?Q?he+rbi8zpGRYAMbvpfTVr72KSf5jVwwYITor/61q+FavIIswSmSNnsoC9Yvf?=
 =?us-ascii?Q?/yS03eI9Lvwpab17yuvY3/LedKRnSzOlNGTGf3bfvuTXA3hSMOpqZ56eyMCy?=
 =?us-ascii?Q?OaWZWGtW/DcoEpQQpxIOlLv5RZWDr96RNEBDEyPDhBNUS8H/8pJ2ouIDkyHG?=
 =?us-ascii?Q?zDB6y5qbewAtnSxXTNYzE/vk4SbS61olZ+ToY3AAYdC526gD/yyaC8qlEpXw?=
 =?us-ascii?Q?m/fhDxPXK9Je3WAcDW+7/6zZFbTZUxqqSC2fv8HG3/mUimvx9IoB/EOMLWES?=
 =?us-ascii?Q?uv0hSsndtbugVDi2L13pLLJb+t5ERSUKpNfUaMbQrZzMTig57pozcPINUNBJ?=
 =?us-ascii?Q?qieUiYa27pBFVIMGw/3/VfteL3N9HkeXv/GWPBAc/PWPbMKVHxUo/CZqSTYz?=
 =?us-ascii?Q?ICmj0VjAjycslmzgujOFKMWBxdt5kiqKneG6I/qD8kuSFjVAXthcHgEMb+FL?=
 =?us-ascii?Q?yftNAIMKqzwCQZElQzNE3ckq0dhTULLlxlq/rEukfo7ZCG6fXdJV7Z7J7VET?=
 =?us-ascii?Q?nuTCm7yW703vYV9eNYz7RfH4K40fvoNvJBGqSmX824mrDzbfhwLnkr+R3ixm?=
 =?us-ascii?Q?jL/7NDJJT3z0ZM5J/56+EQuBXPiGIc6CZ71FYe8Sf48LXkxzJjYbfFFpo6t5?=
 =?us-ascii?Q?zvAKEV7sxb2d4X46agYPh77giFjSMee0otCHV8XI1/1yELmPhJ+eZUUVrq6U?=
 =?us-ascii?Q?JTuZ2nURg/foIoPUA9iSm30NXWuiWDKmDKlvXqBS5j544PLKtT3lksZoBDsD?=
 =?us-ascii?Q?eqkZMKIGwDSyq21gaD3zXcx/MxgpKD2W+sJuwWzkXRkJTJv21X7oSDFRM4Vy?=
 =?us-ascii?Q?ZEjS6oZyuHHTUfapVS95Ac1O/6nAaHr5Jd5avanbtQ6ppFr0/VenGvJNFzMx?=
 =?us-ascii?Q?HdliAFZbh8okW/ISRqzFAMWSU/OZiu5km2yvW4EYB6B/d1LcORMHa+YOodRq?=
 =?us-ascii?Q?jla0ZUIcdJyWzZnsVtKbjXdHP/42C0ixJxWD5myqKAl69Q8HwTjc27d/MwcU?=
 =?us-ascii?Q?waakdtEUPSQpdfJG1lp4hrwWiAG7A7PnG81SsjWbV5gxgkMDXKtZxTocc7PK?=
 =?us-ascii?Q?tdtpkzzMIC7TxmVw3Q0onFHK1hYKSCbTfyP7ZcwZoGKFR7bf4zTydxCzpsTg?=
 =?us-ascii?Q?5LxpYGDzRoFiZOD4YBp8ZuOU6PnuCxoprXZeer5E166FxbIdXA0BMIvsBrfZ?=
 =?us-ascii?Q?8XEdFx5EI6yoef+SApDGiBZzGuIUGKf26A9MxOl1jN60Hi7aKA5qKX5Z7RHP?=
 =?us-ascii?Q?QO5LoUHGiSgEC34yF0r2Uj/H8nyq03qaHwdSvSu7fo9GdTWyKGTuILbGopBX?=
 =?us-ascii?Q?9NRT35XpUxY/7wEtGFIoRImKkGQ6Qm1UGiIENjoY88JsINKEvObEN0D/A1VD?=
 =?us-ascii?Q?yA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 686adf35-8823-4fb1-b070-08dc84d7db69
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 20:49:41.5191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pNC7nORDOMxjBQUi6zMajpvcfrDoV9TGiUOiEouORUb4jQm3N4GWroXm4SveA57E0fsdMJ0jXunialIvjaOPMG3vc6a3XAHwttvGwwv0YaI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6335
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

On Tue, Jun 04, 2024 at 01:02:16PM GMT, Nirmoy Das wrote:
>Cuurently there is inconsistency how we handle force wake get and put
>calls. We have three cases:
>1 Return value of xe_force_wake_get is not checked.
>2 Return value of xe_force_wake_get is checked but continue.
>3 Return value of xe_force_wake_get is checked but the caller returns
>  without calling xe_force_wake_put.
>
>2nd case is perfectly valid but 1st and 3rd cases shouldn't happen. As
>xe_force_wake_get() will increment the ref count regardless of success
>or failure so xe_force_wake_get() should be followed by a
>xe_force_wake_put().

or rather xe_force_wake_get() should be fixed. Why does it increment the
refcount and at the same time return an error? 

Lucas De Marchi
