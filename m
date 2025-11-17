Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F79CE8D6B
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 22:03:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202CB10E076;
	Mon, 17 Nov 2025 22:03:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ncPBp8zS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9057310E076
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Nov 2025 22:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763417002; x=1794953002;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ajnv5ja5l11F2qnKhiQaJs9Uyc/cTdgdHhWKiENz2dQ=;
 b=ncPBp8zSXxE3TOqIos60vRJNjSML/DYQ+wRktDJrvPBGfO0YCXqbXvat
 tAY1VszCuzWhnIoQu/0cC3IwHt8Ns5LG+I1MJrDG5MZg0GDB/AVr+1WCu
 CYNzKm9EFHKrrvmVqBosMPWgKFRc7fbMUfgPUSPjmScFsbwfipqMBktHx
 2qm2E2DpEF7vKLsUYCZZVBLHL05DWXXWVS3UGnt3b9DBNwOcmG6euxA7s
 SIm1NvqoZ7FWKz98cZbRhgdPujGc6T0chjv+bJ8/+vdZeclvBX5oOiAm4
 HTXe36ZXEOGtE5IdcZtWE/G/hnrr95lTvcxJIy7gczPRpWOg/4kzkqtQv Q==;
X-CSE-ConnectionGUID: kx32BKnfT6yf12n2bzG2VQ==
X-CSE-MsgGUID: D01zpXVfSju7KH1aYD8VRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65583399"
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; d="scan'208";a="65583399"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 14:03:20 -0800
X-CSE-ConnectionGUID: 0dDFbn54RaegTxlhwyDA4Q==
X-CSE-MsgGUID: uE3JHv6cSFO8v8nGIUAQ9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; d="scan'208";a="190592413"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 14:03:21 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 14:03:20 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 14:03:20 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.21) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 14:03:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vAZdV9T02A/ncMjbM/JJdb2Y/M1fYH+aXgfc46TRWH9sktiMz3bOSStaTqPhhSJgRzqqLjOlsjfq9C3rdoe08DznaHl8pSByD2lcyL2ONwtTsR5H/8YhuI4KVOJxEVKhhMEI0Np0y0oAEbT0aVYNeAgpOZM38VeZ7ZC5UgpJ3gJsmMnc3rtXcehLu3nKY36TYPJC+0pvjreVKTZBMJ6igY0W5nqBEXXaXbpiuW8Atxx7a3b1f5xqpET2qmx+lUnMiyC69OtqyVpJMtejwf6PWNz3L9+DKmGkSI+aAg8mhldASO34i7T3KgPAsGWY1b5Fu3W9/qW0Xul81m2KqPxJvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pDR1l3GsZPiASnIPrPLqpwI3rVpeUGtdEWSV9REJhUk=;
 b=vK/8huQ34R0l4TGIf1skaqXyfj0P1PrMbq4hWH5LkdIEijnIMabG34KBeBlQAbjzRqZTvRL9+d/9EBJW+a0LWUeR7atlaUnWZ2PWVIuCtYGWHCPQ87z7wFEUF9oYsZlGILoUYc4YWtkKxhMJS/nue1j/GeeRkFi0pknd5t2RRONwve9JleR4UotR309jIVzlpOUU4iLZz2rzAnrdhsAqcNaJ65/AknJ/2kiRX73beLbG2ahwhdsqKOVsW9TRGEWLC7TI7HP5TzKFrIdpsUXCPl3wD7XZcF1lKCtCSsD0TRqhm6yLalha5UIFH3WG0eyvVBRtYwDt7bLc0mTgs80Olw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ0PR11MB5182.namprd11.prod.outlook.com (2603:10b6:a03:2ae::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 22:03:10 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 22:03:09 +0000
Date: Mon, 17 Nov 2025 17:03:04 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>
CC: "Jadav, Raag" <raag.jadav@intel.com>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, Rodrigo Vivi <notifications@github.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Tauro, Riana" <riana.tauro@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Nilawar, Badal" <badal.nilawar@intel.com>
Subject: Re: [PATCH v2] drm/xe/pcode: Convert unsupported commands to debug
 level
Message-ID: <aRubmCxhrw5JNDJU@intel.com>
References: <20251107055746.110055-1-raag.jadav@intel.com>
 <b4f677ximgoni5pzf6bsh6kkchh52fy6drckbiasqsaekvnzbj@o3rkfqwcg6or>
 <aQ3xItyGMVnKdzoi@intel.com> <aRSdenIjmrfTaw8U@black.igk.intel.com>
 <CY5PR11MB6211951E2F66A1FBE47276D895C9A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CY5PR11MB6211951E2F66A1FBE47276D895C9A@CY5PR11MB6211.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0163.namprd03.prod.outlook.com
 (2603:10b6:a03:338::18) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ0PR11MB5182:EE_
X-MS-Office365-Filtering-Correlation-Id: d4633616-0cc4-45cd-1ecb-08de2625182e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?HjCfErJX8iyPaDToRbjh84c+uHu/4FxHXG7FIHD2MNvyMcGJ4gfhoKctTE?=
 =?iso-8859-1?Q?JmO8kEBPPqXYilR2TWzgwYBWg96GIy6Wnt/w7dSN/djEzNbnvq4E0RYKwl?=
 =?iso-8859-1?Q?/k/mvAij1wh6L/gRw5Qkm1LBJLpjqKNIboJpavzylDe04O3CeWM5cSoYCR?=
 =?iso-8859-1?Q?hqtTwz7fIeqp2HjbMSRj8hqsOleVK7Jf1tWO9Uxvt904nyTeFNgnfPKvNf?=
 =?iso-8859-1?Q?4j/aYndh9DHhyYuWRZZ5FIQ1hzhgUDzsgB7Z+oH8gqlX0YBL4rV/ERapYT?=
 =?iso-8859-1?Q?0mwp1RPhTrDoi6qAgYd2TUcw6/4GyrJRnUEQNwVFIrv2jz4vtwmxBh/Nhn?=
 =?iso-8859-1?Q?IS+ojd8jGnYURYdWXp6bn01s8JOIcAJNni6hS7523JnBTIcPgVIaC+HEFa?=
 =?iso-8859-1?Q?2214dMV5I/cT6eX95Kqm3uyksln0fRNnepxDC7VlFYzNeB5L++4B/bR18K?=
 =?iso-8859-1?Q?DVkQ8pCoWQ21DTAhLaKh7TgfS/fhkthoCWJbAQlNaK3TBUryjVJlj5CHwM?=
 =?iso-8859-1?Q?Y6fxRHzVPqXpK64vFXMB2I7ou0lYolkhilJ6cBKf9QS+TLfXXCvGylJqBT?=
 =?iso-8859-1?Q?3gSTPd98u7MEGYeu7q8aMgaK1tnnhhhwqp9CiglkUVM8/MSEa10FMRiJzi?=
 =?iso-8859-1?Q?OTRIZJX685H4oDGivlHo2MwMeTwSSPVbd2ElqwHl3DU0H/MJMAUjOwlhE4?=
 =?iso-8859-1?Q?/AZB8GAVH+2KaJyLwYcjbPJGQjvn+y3NJbfPl3I4muHIDuOBBggtOh8ImO?=
 =?iso-8859-1?Q?HUrpk2DVABpRILZ37+C4+ehItKo8NGE/3QwR25jj/5E7w65h//y/wBpovT?=
 =?iso-8859-1?Q?M9VOivRhYko5Vup6igFmMwLu6Cax/Oq16RM+Yu2hEJiCtH2pS50a4T/5uY?=
 =?iso-8859-1?Q?pjDjdhwXHLhQreI5/K4K1oOVt+fw0IWwujo4eGWc7D/VuuZtKJS1GfsGvc?=
 =?iso-8859-1?Q?gp0EUlz3FhCtuG+0xYWYM93nsW3wNL/1SYGXTZfktXVBNQdLpmFSFXwJdN?=
 =?iso-8859-1?Q?pdNhetDgpcElcjE0QwF5FxPB3WBXbjO2Ap3wVODrMYOCiPN50Pb8marwvs?=
 =?iso-8859-1?Q?6cJ+eymjNEczeZF56e8TWHY/2QrjBQ1+m8kNlIbQDocdipVODhi8cZF+Kr?=
 =?iso-8859-1?Q?spfb2UUr1foA2yjcg6xvkcZG4WSXcgocfGmtMhcxnHPMii3SrHyUQMxM5d?=
 =?iso-8859-1?Q?WPneJSm1KoOXNMdnXZhMnCPZ5FFFJYYvW++b8s5z2ZdsYD+2Jwr3p0Nk6Z?=
 =?iso-8859-1?Q?9e6k3dR/z1GoPlDhCH478+4psVR2ZOef7OazW+bl4zyk+9CIeTAqqGDLfN?=
 =?iso-8859-1?Q?W5bbr+ZJGJ1U+fa3e2WFNG7kCSq39hhwD1Ljo6XK5krf6P0hNTVVO4WVEI?=
 =?iso-8859-1?Q?flslPpvJ3XsX20M1KApfJurDVlKmhzct3DN9W65dtIKn/3VnXHfJyp9WDe?=
 =?iso-8859-1?Q?ro65g6WbXL+aoWtpyFKiquPZWsbF0tepXpvQdHq8IokWb+AAK8MrBd8E6K?=
 =?iso-8859-1?Q?MOm9KDeqaszFvDuNf+TZkf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6pP25p/hUoqgs+ZIiJzU9xD4h1WvLhDXnCtNWO/tXlKDfdhUqrXP7V1C7Y?=
 =?iso-8859-1?Q?3qOhtyhrXjYjyl+VFfIJf7GjM9A5CY+KfldzWDMkJXL3ru4Ix0L8lgNB6X?=
 =?iso-8859-1?Q?Lvw6YBqjbSEP4CJGbLiWknkzBBRFCU5FlVMODqpbGmXfToglMpx2CuL7Vy?=
 =?iso-8859-1?Q?lCUHQmBZA/kqVgl8Ph6767ha2I5XEhjuZhRyOhwElJUdUN/Xc7r8l5vySz?=
 =?iso-8859-1?Q?4oFb/7Fafcbhu+wm8CIokX49iJq3jz5UJg4Rvj0jWOSTlePWhs44Wo7AIS?=
 =?iso-8859-1?Q?v2hddWgc4n+IEFgTCz8WP6ERrmuyM5QjXhQUhQxKcsZr2rC2Zx+7lgAFXi?=
 =?iso-8859-1?Q?2L2MpGwaGYe0XtblwuWUHFUK1dUWLUIoV5YlwRWgw2jVwLr4Oz91da2+c5?=
 =?iso-8859-1?Q?1vOfndWtJ9Iz5685SGgdqjT5n4C5ovo6TQADteOTwgOpvtEhEPXWuyakEF?=
 =?iso-8859-1?Q?2g3VlEY+BMk7ZwVBhml+gN3mFYF+E7H8XBy2F6XJ4gYuoPcvDIqg/EezaA?=
 =?iso-8859-1?Q?Jen/jxL2smzG08lMUWt+vVB3u8qhUXFuo15dYYwRAuJVT6dr+eixxdzjq0?=
 =?iso-8859-1?Q?ixmGfCv0KrT7lq8egYFTMl9FeSclUeoE+WQshaMq07Gpkc9j3XTTyvkqZr?=
 =?iso-8859-1?Q?gRU+yaWDCgFjGLzEB1ZOe+pl6C87aonASCxCh75GZkPFAyoXq8+FJfnIee?=
 =?iso-8859-1?Q?XcN97bf25sgYPWv7/hRHOm3zKNiF0vrKd2Tnxoph48mK16cAq3YNOBKnPz?=
 =?iso-8859-1?Q?2ukIiUtgIvzJZalQCbPRKdOt7eVeiSolD6EST+B9tsSc8uH+nxNfZFUge1?=
 =?iso-8859-1?Q?Rjcbhfjaxt1aHf/N1a7Hnb/v2vcTjNiuS08bZdvRrIC0OhZms6ocP4Nj/E?=
 =?iso-8859-1?Q?iVHCwDr6Ye6hIy1YvYDpxN6HCnXk5+WQJqa40SglH1uf9Th/VZWrxS12c7?=
 =?iso-8859-1?Q?nu9O7vQKiQwN4PG6cT9nTCyVc+N7B7+WRls2T1Jpt+IsJfzD+dIwL33Rfx?=
 =?iso-8859-1?Q?NARrgUv7BxZM4Ez7fHbY3VSOWJSVAmqvryLzgKjjXFeP6ZtdXfHIpmO3Fa?=
 =?iso-8859-1?Q?tJt2LL7XxPSkxd28BvuBanwLUba8MvF7cCEFSV93FLW4ApHKl05sZfouzC?=
 =?iso-8859-1?Q?AwNX54oac0DeqyjjjVgtiRN8NRKFXro3QdDJbGLkClxVR3QEMw95DenD6O?=
 =?iso-8859-1?Q?AIhDwoRXxgKD/oOSQ610aJdeDh/CQL9591W6CrbEE/i1dFb5q38+HEQ/ol?=
 =?iso-8859-1?Q?b45Xx0oo/UV0Hh1Whmzr9tGBSRxraqZ0bBRF5NMXk3AbDX396LOwDk8fYa?=
 =?iso-8859-1?Q?OdRTmVFFIgUtQLqZQ54R8N3NTzhzmtFMUPdOMixJTfdkoDBhdbBoS8k6cN?=
 =?iso-8859-1?Q?dTeVLJn1wMkqHPL0HxYmjG0Lq4wJGaKHfF8u3kCdfplCacbGfGlrV5Gr6p?=
 =?iso-8859-1?Q?zQ8U6vR7igntnk9b4ngg1SGUXPDvgt7520vmB2d3hVs4+4mPRpD7KlpSFe?=
 =?iso-8859-1?Q?HjJjHLsYkLwu1YQntgvipwt4IqPRN+TUSwG7Y3IFepdS0YwG/fQep8Ti+X?=
 =?iso-8859-1?Q?Xzp/nmLlbiDrHibta3qM2dkDJjW1CbO/wXS9UsHA12duZmHTL6CHznulNq?=
 =?iso-8859-1?Q?+fWe+JEzEWVSzsjMx+f73751XS4s1w1dJo?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4633616-0cc4-45cd-1ecb-08de2625182e
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 22:03:09.8713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ug2nuvshkQ38PwiHT0jAGOgsEvZ4W1jBnAeb1Hvp+7hM0GWcrNSdQV/Ywn5B7S6q0O5zzvGQfWzMsT1qkgNZ5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5182
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

On Mon, Nov 17, 2025 at 02:26:16PM +0000, Gupta, Anshuman wrote:
> 
> 
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Raag
> > Jadav
> > Sent: Wednesday, November 12, 2025 8:15 PM
> > To: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Vivi, Rodrigo
> > <rodrigo.vivi@intel.com>; intel-xe@lists.freedesktop.org; Tauro, Riana
> > <riana.tauro@intel.com>; Brost, Matthew <matthew.brost@intel.com>;
> > Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Nilawar, Badal
> > <badal.nilawar@intel.com>
> > Subject: Re: [PATCH v2] drm/xe/pcode: Convert unsupported commands to
> > debug level
> >
> > On Fri, Nov 07, 2025 at 03:16:18PM +0200, Ville Syrjälä wrote:
> > > On Fri, Nov 07, 2025 at 06:03:28AM -0600, Lucas De Marchi wrote:
> > > > On Fri, Nov 07, 2025 at 11:26:11AM +0530, Raag Jadav wrote:
> > > > > If the device is running older pcode firmware, it is possible that
> > > > > newer mailbox commands are not supported by it. The respective
> > > > > functionality isn't useful in that case but neither is error
> > > > > logging, since it doesn't particularly signify anything wrong with
> > > > > pcode firmware or device as a whole. This is useful in cases where
> > > > > we want to make a decision on driver functionality based on pcode
> > > > > return codes and a bit simpler design choice compared to other
> > > > > solutions like checking pcode firmware version, which comes with
> > > > > additional complexity of binding every single command to a
> > > > > specific version and deems pcode commands useless in case driver fails
> > to obtain it for reasons unrelated to pcode.
> > > >
> > > > yeah.. I don't think we should regress the support in new kernel
> > > > versions and require users to update their IFWI. However dropping
> > > > the error message here also makes it harder to find cases in which
> > > > we are indeed using a wrong command.
> > > >
> > > > I'd say to decide on err vs dbg based on CONFIG_DRM_XE_DEBUG so
> > > > developers can still see the error and take the right action.
> > >
> > > I think the caller should decide this. If it's explicitly probing for
> > > something that may or may not exist then use  dbg(), otherwise use
> > > err().
> >
> > I like the idea. What I'm afraid is that once we open that door it'll probably
> > start getting abused.
> @Rodrigo Vivi What is your opinion I here, I really like the idea suggested by Ville here.

I like Ville's idea here as well.
As long as the default is err and we downgrade to dbg on specific cases where
caller knows that the compatibility is limited.

> Thanks,
> Anshuman
> >
> > So rather we can check if we're really *in* probe()? Wait for a v3.
> >
> > Raag
