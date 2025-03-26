Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098AEC28B30
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 04:15:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B704B10E2AD;
	Wed, 26 Mar 2025 04:15:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eNkuqp1C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB3110E2AD
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Mar 2025 04:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742962500; x=1774498500;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xnYagyjM1OcfIBVz4xYg0yQn73YkctKoCQZun+0EIY8=;
 b=eNkuqp1CQLD3pW6eygpYYQyl3epfqSFDmrtQIXqbyEJ0N9IFOrzXnpi1
 zqRbBY9+LzkQ/RIPK/qN9gsoUMqi4ZUV+j1nZ9qbFnIqStHQIO83nUA0J
 Og34cuBEKmVHeSOf0LNye4bPPCAkz8OhxdrIfnbWaxlxR4/AJQP22n0xP
 061Wat2cI/TkL5e6MVimpneO4KHnV1YDCHBcm+J0rAYh40wYEB3XS4BtZ
 TwAqzEmY30walvS0eq7O+dKnxG/Q2ipOv1efrzSoC/f4DFZ9SeG7G68ba
 mE06iC0ZjIn/jgKGSFKUmSE6NKKdXrun4BoNK/Dwo5gDxnmm58Q/4ee04 w==;
X-CSE-ConnectionGUID: wTqEK4QDS9KpEO1ZnVQm9Q==
X-CSE-MsgGUID: vUhiq0s4TNawYg3RAp9WDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="55226270"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="55226270"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 21:14:59 -0700
X-CSE-ConnectionGUID: uwI+hNbwSyu1VaeDlzBm4A==
X-CSE-MsgGUID: GH4h3jt2Ry6MLs6LURjbMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="129794015"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 21:14:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Mar 2025 21:14:59 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 21:14:59 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 21:14:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MkIPIJAGWR1gkWOr5zotnk0Tlk4pytcvIMLBHxC4D52+sMLkQ4MxrFnUHemI8W2LGUGBdYXvhqMlSjqgUtQSdV8LPjg9sFrLw0wxVkg+43+ATeh+n9H6Zmyc5b1MnBodEmirlCqsWXqLASpNFZIdXDip9Km7O6+uI40RBu1lKWQtyLe0EsE9Uo+IC/EWtMecTKIFw1wXQZniSeYjtdb9ZFkDqIL2OMrQ5WSVREVWuTQ7x/gCoPcC/miQUBcWovSOm/od9ikU9orxLm5WDmKBXgVO0I8hjPsggFVeQ068ROXMYlnWvtgd3L8gGDfzD1gcFSOjGlKRMolzKKsikGZaGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVwFWFPyubWKkdHD90VVLYvy8RGSMazg86vSuD/48tk=;
 b=S0FoGQTWIdDL7cZYDK13F5C3uLsbLhboG5Gejf8cwvAb7mblgxe83sjgnrBOCEbazCpyPQ8RMmWKLVPds8AHKTmEaCEb2oHbi0ikbdQxoCUHUiFs442fx4RgOmAOsl33WUpfy5m3HMWHRKoojJRt1znXr6Wmjhipj1b2xZMfdnf28w8Z7E8fj0i0taJBUpDOWIfdrL1DI9yWxkhQ8MTH0/ajyuVCwAAm7HkDv1TmH0341qIQeT+FeX4XZM5QpPD8ZgP7Bq30wlcA2F7WHyG/28QEYQO76GiPhwVXEh0PhbdwPjfC4BXwCbvuNZKodmiIUNa2BKCXVrcJKdyzrjxh6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6486.namprd11.prod.outlook.com (2603:10b6:930:32::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 04:14:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.042; Wed, 26 Mar 2025
 04:14:57 +0000
Date: Tue, 25 Mar 2025 23:14:53 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4] drm/xe/pmu: Add GT frequency events
Message-ID: <l7xh5er7uzfnkto2izx2j4ftvbzv5tutolqkms3dddo6tubpwv@j37n3pkkxudn>
References: <20250324232402.46481-1-vinay.belgaumkar@intel.com>
 <87jz8e9d3h.wl-ashutosh.dixit@intel.com>
 <b46fbbd0-ee96-4f00-9f6f-a00115feb32d@intel.com>
 <87jz8dhw0r.wl-ashutosh.dixit@intel.com>
 <33ebfe1d-5ac5-4985-8c8d-c1996e5a6d14@intel.com>
 <87h63gixq0.wl-ashutosh.dixit@intel.com>
 <269b993d-2a22-4080-8609-66650a60ad62@intel.com>
 <87frj0ivbh.wl-ashutosh.dixit@intel.com>
 <octnzulvdzokmojzeay2zywjaagity3sbsnry243ze3cwnbfx4@wxkgvlptg3el>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <octnzulvdzokmojzeay2zywjaagity3sbsnry243ze3cwnbfx4@wxkgvlptg3el>
X-ClientProxiedBy: MW4PR04CA0228.namprd04.prod.outlook.com
 (2603:10b6:303:87::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6486:EE_
X-MS-Office365-Filtering-Correlation-Id: d015db43-5e60-47f6-96b6-08dd6c1cc487
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ckxHIRKzBRhs+YQHqrz4v8fBEnxdlNi12NAciwt9hd50ofDcH1VoxJS0ZI?=
 =?iso-8859-1?Q?/V1nWwWFY/PbbVy+DYWT/aLcwNddnHDCIKxlTPCOUnYQmUamXCUEnWoENg?=
 =?iso-8859-1?Q?4LX/xKOSqLZwkiNpK8y0sZg/cRQtS6vkteAFelofLt5d0tAvDPtmbjuWv9?=
 =?iso-8859-1?Q?WPfCBQU+qESqhoD63ISR7yKYTF4vRP4qzRbEpZiupH+s6Jo7Ymy7TvAwfF?=
 =?iso-8859-1?Q?RxponjU8B6S0G3UgO4Q3wO+vQ/JfNElXHuccMQqcCMDLnOv39Hw4lUUDve?=
 =?iso-8859-1?Q?cu5JIdqHKQ6wf4Oj7epAWleEKRysiDM9MGCgvVa09JCtqSBv/2qUKvlCkj?=
 =?iso-8859-1?Q?oZtM2ygIg10FL7OR3Ch/dPn0jKhOl/G/94U45gfux0a2F1vC9Kos6Oi0OG?=
 =?iso-8859-1?Q?jfmKncsTsslpOd+TB45A6D1/o85G0/C3PI3x4ilzag/q8rca22XvfUPvft?=
 =?iso-8859-1?Q?LzjJ+yATmpYejXjv846fJhY+2/BxzicyouDayJc4dzVeXwshSNR65exn4J?=
 =?iso-8859-1?Q?YvPPezp2GPK3wgzJgpat8L3ZXS7NJl4UEBAOuVBv4rjs9qRUxel0y8Nq52?=
 =?iso-8859-1?Q?TABrO5sJDuXIVPEgEtubM/h87FXqwo+Torh0khaLsB+joTq4ykCRa87+s6?=
 =?iso-8859-1?Q?HY1JRUhCzUcIHruH7fMzs4kYIASLWknYAxOQJz+DFrB93NJzbW7+EwDjr5?=
 =?iso-8859-1?Q?srpLalyIKEFi1HZ382xH2SNIYeT58YNzQJXTVcECy/FnDCTV6i8PrMYCST?=
 =?iso-8859-1?Q?B+J1vv1FuYoCSlAcYZhQm61XGKNuS57QJ9IlMA/76iLhqSv+ArRZd4v/FT?=
 =?iso-8859-1?Q?iThFq4UrlbhKhhJKLtNHf7mAFm01e0W7XyVlYP4Pq0HOsrBw6NB4WeXdqq?=
 =?iso-8859-1?Q?ZKGeioaMQGxFOgUztM0fPeScKYWnjPGYuQPLgdldVp5pWBa6r1cswEg2O+?=
 =?iso-8859-1?Q?lgGRyzkh8jzIL2k9HpGuyGDeSiAsqG7xV93iyR50hBJuLfoPGahaWZsFS7?=
 =?iso-8859-1?Q?PTOwv3pdMrHuu8EAOsPXhe8qZNkdrcgjtu7Snc9lCfx+RFkjqp8ysw3ryh?=
 =?iso-8859-1?Q?jGBJydeaitD/hznRCdqvsQlJhcrg2qJTVSI8bx0aZE4TUoG9LwU0PSfekl?=
 =?iso-8859-1?Q?GhzAifqPFFFrXh1PU7semZJ2GHhPbMSDs6Spm5vP6BAhrCCGO+VdURgUEp?=
 =?iso-8859-1?Q?ANB8KiQWed0HPLkQKZIogLacfr0COk0PkH7p0lxZbj3pR5AcAlBWxcdw8r?=
 =?iso-8859-1?Q?jQc8ri1y9XFgQkWwPvtRFDb5GR9xF+EC3oCsQeoo+7B8TFn6VKa+8BXZw7?=
 =?iso-8859-1?Q?B8rE9qXxBHtoDAOZMw4jbzunQnPXmlU0MX/E77fK31A0nlXeMppMCeX1Id?=
 =?iso-8859-1?Q?eneBF9dIH4g2y1SmLKoU7rcSZ13ylvgb+OWqZsrOQ2Lz++UbKOq+O+1l1s?=
 =?iso-8859-1?Q?PLA1qpCLiHzrJVDi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Ri+9i3AycmI0QK3fggj3riDOzAEd2xUMJLa7TAl1xPglrAOox55AFg5Iiy?=
 =?iso-8859-1?Q?YJUHPBmo2QiVoH0qoNae4RTE446S8JpCbVu/yBEw4m3IEiqfogdYtVi9Xg?=
 =?iso-8859-1?Q?FkM2L/1NN7W9EAaZhYnGJGXYhG6toawXmvI4pmyeC/4N7F5bDlmpCl2wCR?=
 =?iso-8859-1?Q?ohSszPJ0yG/+B1UjUQMWdRt6VrqHS6AHNoz8toMXmrqQpVzagPW9Xd8YZh?=
 =?iso-8859-1?Q?PxPfef0cRajrepKyArgbLX3Vt5XzXKz34raP7NlOgEAUfiBmY6mvfosAA1?=
 =?iso-8859-1?Q?X1nUklnKCsk44wDK5AgFV9YhERjHgy0xFUWmrkciUNS8I+nqPa9E8wRHvi?=
 =?iso-8859-1?Q?qF6V0y3sDNG6teaKD7xA/gzjunIiF6NQhjCt7SjE4CIS6pHztgCa3Pms76?=
 =?iso-8859-1?Q?M3M8H+PT+OMoVTUkmiF3gyUbB27mVy5veIV/Tsll1dF0aUTrhNOD94pHeZ?=
 =?iso-8859-1?Q?0HBdMndPHo2mQPTP81MIgFwEhBfySmSNcTulqr6KKvc9rTwZBOYmAlsIdn?=
 =?iso-8859-1?Q?8ol4mPWmKO763u1zIf1N07nUO4bRx1wl9mU2beM6Jj3rVhFH8Ka4seztfm?=
 =?iso-8859-1?Q?w/h1TcS+2/puUULdyItVdN8+3L8305hsjBHWvUs0Z4MT8N6ICj+48carjD?=
 =?iso-8859-1?Q?vljgh4X2uh0jP3FnflhQdqBiFVK7wYC9HI0XvWAqiifbSkdCkK2SxVQfgA?=
 =?iso-8859-1?Q?6VSWSXe1Ktn0IGxRVo47mk3GdiRQK4XJ5umVIzVuP0m/PriHCnMCIWVzIy?=
 =?iso-8859-1?Q?Q5ie80wheahqJlzLLP0cJehL/fvGz18/ZSVtMUfs5CuNMZnKg0676B0j0t?=
 =?iso-8859-1?Q?OgWfg37AOjeiqp2raA/fwhD7+k8fZO4r8qPkf2SLRJLDmK9l+gTz1ZVHwt?=
 =?iso-8859-1?Q?I5F2jTGhn37ud6WZhJeWXKAqGrR6YuYXlW1Q0NDskd3cHHAWT90dembSyr?=
 =?iso-8859-1?Q?kjSOgNRzw6Yl+u1AFBgsd5O0vmIJaLfmigXAj1ayg2JU5wc45bSeB/lQzz?=
 =?iso-8859-1?Q?p2KqKraKFNvbR9BTmNmhrEqZMOFsg/jwxQZBwG/vsnBXd5DGdOFLDFM3J6?=
 =?iso-8859-1?Q?2XxnuKBD4OINW5BoNyGJP80H7o/SETqIYXvEk87vXSfwG5j4IAsJpD58Jm?=
 =?iso-8859-1?Q?NBk0ohIbsyIhEXKPPl7xscDTbcV8T31PfHSuqE8DtANXzsKZ8wAnGJ20tk?=
 =?iso-8859-1?Q?wK3bD3yKiDuxKFAmP9wcENLvQrXY2dFEFxV2CkODrE566moPshrs7+zzNS?=
 =?iso-8859-1?Q?kMvL2B1RTxHk5+T4X+5MoL/PNMZXXk70mFv0WTBgMGLJJ1MpQqsYg+rOc6?=
 =?iso-8859-1?Q?QAESmwG1XNuLfhUeRi12NUMcDaQKfSCtomDE0NHnS4PFZk60Es2l3BJUf2?=
 =?iso-8859-1?Q?FPjDwT0P3pdKrturWFuQMCwf0SVlNT6iZ0EHjaLpCdFOVyKoO7Si7lrVKY?=
 =?iso-8859-1?Q?bFLadiQTBZVD5XpCScEewwC8L9Gs7PjpaCMymDMYfKdhtkeaeDVhJz4gge?=
 =?iso-8859-1?Q?CVYKZBB1ouDkjh7WeQHnQyPUNKWWIhF65X8GcoMvRhPIZMdcisoZMj59bt?=
 =?iso-8859-1?Q?ADMyC1w4WeYW5X6R8jqOfoLEzmG6kA9SESOaQuyx9E452A6eHw0RCfM9Ns?=
 =?iso-8859-1?Q?In0MEP484OK+kR241bWl3784SRhogwEyHZgQ/2047aNB0J2Ajyv06PJA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d015db43-5e60-47f6-96b6-08dd6c1cc487
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 04:14:57.0207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WxPfjVw7ir/FK1v0pEvOnUOvt/ZPR/RepvTxhsklOtaMBDH8bknbJAnpErUKfGsUqdI/211nLBIV13BO+uPIaN/8SZmLTM5yap47up/ccm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6486
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

On Tue, Mar 25, 2025 at 11:09:55PM -0500, Lucas De Marchi wrote:
>On Tue, Mar 25, 2025 at 03:45:06PM -0700, Ashutosh Dixit wrote:
>>On Tue, 25 Mar 2025 15:01:47 -0700, Belgaumkar, Vinay wrote:
>>>
>>>
>>>On 3/25/2025 2:53 PM, Dixit, Ashutosh wrote:
>>>> On Tue, 25 Mar 2025 13:33:43 -0700, Belgaumkar, Vinay wrote:
>>>>> On 3/25/2025 10:15 AM, Dixit, Ashutosh wrote:
>>>>>> On Mon, 24 Mar 2025 19:37:32 -0700, Belgaumkar, Vinay wrote:
>>>>>> Hi Vinay,
>>>>>>
>>>>>>> On 3/24/2025 5:18 PM, Dixit, Ashutosh wrote:
>>>>>>>> On Mon, 24 Mar 2025 16:24:02 -0700, Vinay Belgaumkar wrote:
>>>>>>>>> @@ -266,11 +274,24 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
>>>>>>>>>	case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
>>>>>>>>>	case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
>>>>>>>>>		return read_engine_events(gt, event);
>>>>>>>>> +	case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
>>>>>>>>> +		return xe_guc_pc_get_act_freq(&gt->uc.guc.pc);
>>>>>>>>> +	case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY:
>>>>>>>>> +		if (!xe_guc_pc_get_cur_freq(&gt->uc.guc.pc, &cur_gt_freq))
>>>>>>>> This is unconditionally taking the forcewake and waking the card up just to
>>>>>>>> get the sample. Do we really want to do that?
>>>>>>>>
>>>>>>>> So if we don't do that, both the actual and requested freq will be 0 if gt
>>>>>>>> is in C6.
>>>>>>> For actual frequency, the register(0xc60) does not belong to any fw domain -
>>>>>>>
>>>>>>> GEN_FW_RANGE(0xc00, 0xfff, 0),
>>>>>>>
>>>>>>> HW will report 0 when GT is in C6.
>>>>>> Yes, no issue about act_freq, see commit 22009b6dad66. I was referring only
>>>>>> to requested freq.
>>>>>>
>>>>>>> The requested freq register is a
>>>>>>> shadowed register (0xa008), so that will not accrue fwake either.
>>>>>>>
>>>>>>> static const struct i915_range mtl_shadowed_regs[] = {
>>>>>>>           { .start =   0x2030, .end =   0x2030 },
>>>>>>>           { .start =   0x2510, .end =   0x2550 },
>>>>>>>           { .start =   0xA008, .end =   0xA00C },
>>>>>> So this still doesn't make sense because:
>>>>>>
>>>>>>     1. The fact is that xe_guc_pc_get_cur_freq() *is* taking forcewake
>>>>>>     2. And that is in accord with the following comment in i915/intel_uncore.c
>>>>>>
>>>>>>        * Shadowing only applies to writes; forcewake
>>>>>>        * must still be acquired when reading from registers in these ranges.
>>>>>>
>>>>>> Also see intel_rps_read_punit_req() which is called from i915 PMU
>>>>>> (frequency_sample()) and uses with_intel_runtime_pm_if_in_use(), so we'd
>>>>>> need to do use the equivalent in xe.
>>>>> Hi Ashutosh,
>>>>>
>>>>>    As part of a previous decision, in the Xe PMU implementation, we are
>>>>> doing a runtime_get() during pmu_init for all PMU sessions. So, device is
>>>>> going to be awake anyways. In this case, it does not make sense to just
>>>>> read the register without a fwake.
>>>>
>>>> Even if that is ok... Let us take a completely idle device. What should the
>>>> actual and requested freq's be for this case? Both should be zero, correct?
>>>> Now, what are we going to show if we are taking fwake? At least the
>>>> requested freq will be non-zero? Is that ok? Or the requested freq will
>>>> show zero even if we take fwake? Thanks.
>>>
>>>If we take fwake before reading, requested frequency will not be zero even
>>>if GT is idle. HW always retains the last requested frequency in that
>>>register, never zeroes it like it does for actual_freq. So, showing the
>>>non-zero value is the correct thing to do instead of artifically zeroing
>>>it.
>>
>>So now, this I disagree with. For an idle device, hopefully in C6, there
>>should be no reason to request a non-zero freq. So the requested freq
>>should show 0. As i915 does (using gt parked and unparked states and using
>>with_intel_runtime_pm_if_in_use()).
>
>wrt locking and interaction with runtime_pm and forcewake, the perf
>implementation in i915 is completely broken. You can't take a runtime_pm
>or forcewake when you are in an atomic context. And when you have a
>raw_spin_lock taken like is the case with perf, you can't even look at
>it (if it involves taking a spin_lock, which it does).
>
>perf is holding a raw_spin_lock at that time. The only reason why the
>CI isn't on fire over there is because we are papering it over with this
>commit in topic/core-for-CI:
>
>dc17a830ffb5 ("Revert "lockdep: Enable PROVE_RAW_LOCK_NESTING with PROVE_LOCKING."")
>
>>
>>If we are already "doing a runtime_get() during pmu_init" (as mentioned
>>above) we need to devise some other way of making this happen (maybe by
>>looking at xe_force_wake_domain ref field?).
>
>you can't do that safely.

which reminds me... Vinay can you test this patch directly on
drm-xe-next? By code inspection it seems we are doing:

__xe_pmu_event_read()
   xe_guc_pc_get_cur_freq()
     xe_force_wake_get()
       spin_lock_irqsave(&fw->lock, flags);

and that spin_lock can't be called at this point.

Lucas De Marchi

>
>Lucas De Marchi
>
>>
>>Let us wait for a second opinion on this. Thanks.
