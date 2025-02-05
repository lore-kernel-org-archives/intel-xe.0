Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9FEC02192
	for <intel-xe@archiver.kernel.org>; Wed,  5 Feb 2025 13:51:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8B810E7B0;
	Wed,  5 Feb 2025 13:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YMQWPIwb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24FF610E7B0
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Feb 2025 13:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738763511; x=1770299511;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aozbWNO4f5tYcj4LDstHnUhUATGf+iDHaRyW0RA/B8I=;
 b=YMQWPIwbORPvPmid2y/TQGsr97DhEfA7CLAPrdA44Y0O5sU6JzzJUKBF
 TIHYDj1iFgyXKDMVC8d4TZdB3Guc7fmGsVjScRfRrEh1LtSN3pFKDi01g
 BGMfJicaOmYq5CSsRGM/ojH+nGj7oswZPt6HmguU3UCFlbD6ujes9qHFS
 k9fHxH7C8VaUZNqhfky9W5R/LEfxPUuYAtfgBkDC67905cEkSist/RPik
 dwGXzoRuFEIms8OEAqEXfzqFRyPFEE8KT/o4WxpFybYmeRoaypTWNGd5V
 ubWVN+CZzsAFJmYHQIt/YZtjEyz5kdrByIoXZUhbLg0GGEd/sK+4xF29b Q==;
X-CSE-ConnectionGUID: zkRyDuetQEm9XJ30LfBNTw==
X-CSE-MsgGUID: Tzrss0xtTU+Ga8tw8LOnuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="26931736"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; d="scan'208";a="26931736"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 05:51:38 -0800
X-CSE-ConnectionGUID: ZJCjTZkdRnS/z+Y1j9aXKg==
X-CSE-MsgGUID: TVw9qgdoQSymYCv0R5O4aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116110930"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Feb 2025 05:51:29 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 05:51:26 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 05:51:26 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 05:51:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BbsKhzWE8+JOJkITJlfkYE/waV8y5cuMGFNvb8RT61PAu1YR/pLDwSO3qJgpc01/c77UvxEFmIIXIb+CwNqHC4yRSbFMB28So/YeoMzsxhDBtOO1GzExH3pRq4EwLcFto1wniFr/M69tPhlrtvAdR1fNF6N5Qc9qyQ+q3gIvziao0dkzrfTVezuASoqTKx8zkRng6vj4P+nOxio5pT+9jsv+PH5U+/8+61spgLeiiKxutl0EyxvqliCdfXY3V/3/BWGHTxQhKsrdEbAsGqKfVaVa7AxC4jHA6KSyp15jNXeu0gridDN89CAw4voeVn90GVh3tILYCl9qJ0oU19K7Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hw1W033o8/BN/lty5bPdHt/gjSGM9e/y2dZd/qdV6SA=;
 b=O5brwmCkK8f+iMHztfaF5EGQ5f7N5kRs9kRgeCO2wQysry8qbLNNHGWkbZQBvUGlRFZf0rZEJBWJTTRSGD2uNOzQyjYWkguOwnoIFEx68YPe9tqPbuAYBQY6a9FUiq8N+STcG5hT85HIXN9zNuTG24ELzzo5Hwse77pUDfPT/TGq2ER+nzhTEYX2Cf/XFxIbV/GBQMRr/if5onF3FxLbOSXCTmrGzQrxDbfeT4QHnNjGnus6Vk4gmQ2d5Hq6gzsZ2syaHpXDyfgW8QM+IZyZrrFwgFhHHMXFu9XFGd18umzbdtdjIUlHCqLZhqOrpVuTPf/DA8IJF9EDR4aGaDOfEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by SN7PR11MB7638.namprd11.prod.outlook.com (2603:10b6:806:34b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Wed, 5 Feb
 2025 13:51:19 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 13:51:19 +0000
Date: Wed, 5 Feb 2025 08:51:14 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, "Poosa, Karthik"
 <karthik.poosa@intel.com>, <lucas.demarchi@intel.com>,
 <matthew.d.roper@intel.com>, <andi.shyti@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>
Subject: Re: [PATCH v2] drm/xe/hwmon: expose package and vram temperature
Message-ID: <Z6Ns0iN4WYB8pxfs@intel.com>
References: <20250131054502.1528555-1-raag.jadav@intel.com>
 <2c9ce022-56a6-4d25-a274-32d9013f8c49@intel.com>
 <Z53BOTXFSsZ5WKFs@black.fi.intel.com>
 <cce1eb5a-b738-4283-8d3d-e782da14067a@intel.com>
 <Z6Kms_pJxvKJpoL5@intel.com>
 <0551646d-4e57-409c-b416-1a7108a2f4d9@intel.com>
 <Z6NTZ0KrdkSnLCFJ@black.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z6NTZ0KrdkSnLCFJ@black.fi.intel.com>
X-ClientProxiedBy: MW4PR04CA0313.namprd04.prod.outlook.com
 (2603:10b6:303:82::18) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|SN7PR11MB7638:EE_
X-MS-Office365-Filtering-Correlation-Id: 625927dd-f0e3-4619-2ed9-08dd45ec2aae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rxwRLula8yTgT12jq1Xw8FPX+8O8BMN3RnBEt4Tg2PeXE+Ai5Ng5u0+SMVlW?=
 =?us-ascii?Q?Uj3dXViC72O2SwVFGWYeBUPkuKRykSNG7yNuRYtZ9KCV5xFTrKyVhWFpr3Of?=
 =?us-ascii?Q?wPgeQCtQC13lkNmQRiMQZDnzg5VYkQkRj31mdGuIsH0DOGfbltfBPESVVupC?=
 =?us-ascii?Q?K1O7kPlzoxNLvjVn7mLlMYVrn0J3sVU6UfuvSLWpM+A7OyTp7jdv0+Y6Y2Ao?=
 =?us-ascii?Q?BQredNThsM/EqCPeG9xWy9qpGoVBqporoRLHS7zMwAqtllMFeyy77NVTU8Rl?=
 =?us-ascii?Q?vD96YH5hiZv8FifVxlBBPwyLpdtvLDmmTEhq34puBu3ocypZlTmb7p+V8ZS/?=
 =?us-ascii?Q?Q8A9AV/Wbj4ERKjx69ol8pde0xgSVOxmQZP+6kbvWj5gQj5i50QPz/WAqIhn?=
 =?us-ascii?Q?awEgDZ9nGdp5LUaywfayy7m2jkJLfPxbvSxRWz5C9SHMDM32MsXs40N33LyY?=
 =?us-ascii?Q?6lL1Dl8aGt3LqXWPf+EbX4gIHssLVh5D/qNMBkU9GdcyraYtZPjXyrMtkCV0?=
 =?us-ascii?Q?KQx36m5LohHQ4q50PSjZR/4U8izWRFiYq91Jq2tME3K/ZEAk5yUIJpyGHpwd?=
 =?us-ascii?Q?gNlZUOK1ISc+tUoiT/Q8NjrH58/BdU+8Iy2ted6JuJx1kGFXv9ufb8a6rjQt?=
 =?us-ascii?Q?hnAXwby2fKVNjKO3TxUCq9BlK7IqyUSr+ZVWvpFC7TfvNLAt8gKpWGBl0OG/?=
 =?us-ascii?Q?z4WcWfI4D27F/dw6K7GIJBo0jLx3ersxS4QsJtggabE8EfcrfCAZtGRt/oNW?=
 =?us-ascii?Q?E7Kc2Ysw9Wncb0Dy5o8T1XHyA6HAOlc5+Rnrx/7wqHDiPkrQ7Z3/85QKTnp0?=
 =?us-ascii?Q?ggSEU8XXMueXNi9l0jj1QVXeHA4/t8zqoOFxVH5OrzRvvOyLG2VwP+o26Sjy?=
 =?us-ascii?Q?1HdvqNptmX6cxGITZD75+f6pggJenRdYlSn9NgvxRRtcPo0u7JIvqWeB0Mut?=
 =?us-ascii?Q?1eaFoR5J/Da6w8aUUve9iUHDqVOTzxtrREYI6ND8dGckxNBl5QqDPeU/13tH?=
 =?us-ascii?Q?56bY7gBVCEJWwGv4kvRFwOYwbqqivjguMAfqikDdQDQgX+DPZJLb/79WoZmM?=
 =?us-ascii?Q?qA34ESxa9TlrAr5urqyfUzKHC+wHJlr9iQfQihs4aMV70Ff+GUZ9Kst50n9o?=
 =?us-ascii?Q?uiXWfZu5YUqQleF0kKTAHExANEiK/UzzS6yVhANcXD8teufgDPB7OdPVgJQ2?=
 =?us-ascii?Q?6gfI4NZYiuWX2vRd+tP2qjJ8QLFAYXRj66COB1EYThkffCxXOTAlrp069Cqj?=
 =?us-ascii?Q?dheJoupuGbfJtDIZCvN+S4E2FVWzpoLMwM25suOFx9x5cRnLV29eHbl+JpSb?=
 =?us-ascii?Q?gXAym1MMyerIzUdXx5N/kpdB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mYiThXrQMENh+TfVqKc6Rb+dq7eCZt1omMUPgdkFDLEfx2CE/RDbWyRP/zEA?=
 =?us-ascii?Q?+fIQJQqWKMtAkKoR5LwGmpoFswP6ZIhLw3wIeKUvUYoas300SxnBsWeQ57+3?=
 =?us-ascii?Q?Wvs6MtPxEvxFKxHSyL1208YpskVlHHire13Hi8lTUPdOoAK9iUPHRdRPYW3t?=
 =?us-ascii?Q?hkWqv2zUYlhb0qJtKKxpNK7A4gwnJuOF7NhVZwi8MZjPiHV6D6ywkjvBvVPW?=
 =?us-ascii?Q?ko+icCJcy9gFwI+VKG5lQPzbbJ/hEFu3KpHcovvnH+3EoPNzaTyj0CtqLO21?=
 =?us-ascii?Q?Nr/t3f+hRxAjm76fxHw/SEg5Q3WUKWKAN0bY8qn0xpALlOjekxoCSaFS521m?=
 =?us-ascii?Q?fb4tcYmlECXyT92Flv96HnrJY6XX3ZtYC+qfc3gCXV2/5MbAW60Ej0rHGac9?=
 =?us-ascii?Q?k9qP9s3OuIeSz1PYjXKOW9uPbQ4bEixXnQPLrixm/0RxPYTJiL3P4VkkBLu2?=
 =?us-ascii?Q?rXKlrOB+tUY8y9KCAVsAKBY92ihr8lMZMVFvrHRb5Mg4l0yaUfYeoo6RkxUv?=
 =?us-ascii?Q?XaoL1Q5nWdThfFjkOnxZ0F93t3ttoIIjfCv66ly4N4PErUQ5hD+U2+L8lipS?=
 =?us-ascii?Q?1T2v9RJvGPR8Nvo8Lr9S99SIUJoO0uuizQmcHsXDPI//6iVqeTahWTHXNtvW?=
 =?us-ascii?Q?gYr0kEyM6nG6pfPVLBhxH4Ll4M2HsI3o1Q3XARQk39los89wwE71dKF2qvko?=
 =?us-ascii?Q?Xh17Ff7Cty4H/IfxZlYnNCnt3FA3SU0mI//tJ6zUv/guyWOjQJViNxp6wn0n?=
 =?us-ascii?Q?3HbKpMwf4LO++5sJi0ipx+MamY0jVy3vklbIczYvD+xBNvV2CXeKJEIUC+Pi?=
 =?us-ascii?Q?bOvonzAhzpOYrjg3YVaz+w6BMjWIx3FAirdS2ceNDFajgKv2/xoldLTdmsrB?=
 =?us-ascii?Q?Cx89ybffLGjpVH95ETth1xw2kUjtvj4T24ZhMOoc8I/Ua//tyVn0KvTSKLhE?=
 =?us-ascii?Q?kjQHsFimF5r/KHnyC+wavp8inNmjVzLC3lro52Zqx9FkssdaYvTH58v3Zqp6?=
 =?us-ascii?Q?1xtUmlgsG7AbAwIl++N4jK7c10T1VAmVB6awCfS0XONTPGY750iMQ+TUMu4f?=
 =?us-ascii?Q?shMeXAxsztfji2XzuXUVM0t6laTUASA04rwrVcqJCWzKNKTGmXV6MDkfZzRH?=
 =?us-ascii?Q?1nCmXKjrBe8HosF1tV9SmY8gYgFW3Nb9pWrpeME1tJEQANLTvxsg2rODvHQ9?=
 =?us-ascii?Q?684A0Gkkpd2I00E5JdVr7g3/mK6k6nOwmA9Oqt537xpe0fGyPwLXVcKIFCM4?=
 =?us-ascii?Q?fmtrLBj053/5W5Wr5XoXxE9QcSYZyAUtMfOsPHtf/+FnTBnCk2hEgfm0W3H9?=
 =?us-ascii?Q?oWtZmgx2S6wd1hTJji1LKyPtaafvaI/FFDF/gPi4J+31RiUN0DmL5iyxmvKz?=
 =?us-ascii?Q?KNcp9AKrSeJworHGd5UeQAVNgtxMUqkepliF6yuecO+VjNodKwoLKEBn8MyJ?=
 =?us-ascii?Q?dzkpGQT1gt2C7SYStkNu3s9Xw0smf5MIAm9iSnjRAs53/ME3H39xJwa9C8j1?=
 =?us-ascii?Q?edADa+er2P6EYMxZT+fzYgD1JHyFDu9nftR08s+Vsv//M801QjorJd9JuJLr?=
 =?us-ascii?Q?7X2i2UgzO66lzmKgzXBXMOUbV6VPFmkufwja3ipXjKQCNfxDRq5aj3Z6+BtZ?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 625927dd-f0e3-4619-2ed9-08dd45ec2aae
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 13:51:19.0200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kdW78MkURmAU4w4s1mE3uiBcSMlK3EQYrGJBfnI9NdD3FO/G6UljAfgNrjKkavN0HQHoMLA18zxMOuf17dbzKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7638
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

On Wed, Feb 05, 2025 at 02:02:47PM +0200, Raag Jadav wrote:
> On Wed, Feb 05, 2025 at 12:40:46PM +0530, Riana Tauro wrote:
> > On 2/5/2025 5:15 AM, Rodrigo Vivi wrote:
> > > On Mon, Feb 03, 2025 at 11:57:20AM +0530, Riana Tauro wrote:
> > > > On 2/1/2025 12:07 PM, Raag Jadav wrote:
> > > > > On Fri, Jan 31, 2025 at 08:13:15PM +0530, Poosa, Karthik wrote:
> > > > > > On 31-01-2025 11:15, Raag Jadav wrote:
> > > > > > > Add hwmon support for temp2_input and temp3_input attributes, which will
> > > > > > 
> > > > > > Add hwmon support for temp2_input and temp3_input attributes for supported platforms
> > > > > > 
> > > > > > > expose package and vram temperature in millidegree Celsius. With this in
> > > > > > > place we can monitor temperature using lm-sensors tool.
> > > > > > 
> > > > > > With these changes, package and vram temperatures can be monitored using lm-sensors tool.
> > > > > 
> > > > > That's pretty much what it already says, doesn't it?
> > > > > 
> > > > > > > v2: Reuse existing channels (Badal, Karthik)
> > > > > > Add a new channel for VRAM temperature, channel 3.
> > > > > > > 
> > > > > > > Signed-off-by: Raag Jadav<raag.jadav@intel.com>
> > > > > > > Reviewed-by: Andi Shyti<andi.shyti@linux.intel.com>
> > > > > > > ---
> > > > > > >     .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 16 +++++
> > > > > > >     drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  3 +
> > > > > > >     drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |  2 +
> > > > > > >     drivers/gpu/drm/xe/xe_hwmon.c                 | 60 +++++++++++++++++++
> > > > > > >     4 files changed, 81 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> > > > > > > index d792a56f59ac..9bce281314df 100644
> > > > > > > --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> > > > > > > +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> > > > > > > @@ -108,3 +108,19 @@ Contact:	intel-xe@lists.freedesktop.org
> > > > > > >     Description:	RO. Package current voltage in millivolt.
> > > > > > >     		Only supported for particular Intel Xe graphics platforms.
> > > > > > > +
> > > > > > > +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_input
> > > > > > > +Date:		March 2025
> > > > > > 
> > > > > > January 2025,
> > > > > > 
> > > > > > February 2025, if there is a next revision after v2
> > > > > > 
> > > > > > > +KernelVersion:	6.14
> > > > > > > +Contact:	intel-xe@lists.freedesktop.org
> > > > > > > +Description:	RO. Package temperature in millidegree Celsius.
> > > > > > > +
> > > > > > > +		Only supported for particular Intel Xe graphics platforms.
> > > > > > > +
> > > > > > > +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp3_input
> > > > > > > +Date:		March 2025
> > > > > > 
> > > > > > January 2025
> > > > > > 
> > > > > > February 2025, if there is a next revision after v2
> > > > > 
> > > > > Something to follow: https://hansen.beer/~dave/phb/
> > > > > 
> > > > > > > +KernelVersion:	6.14
> > > > > > > +Contact:	intel-xe@lists.freedesktop.org
> > > > > > > +Description:	RO. VRAM temperature in millidegree Celsius.
> > > > > > > +
> > > > > > > +		Only supported for particular Intel Xe graphics platforms.
> > > > > > > diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> > > > > > > index 519dd1067a19..f5e5234857c1 100644
> > > > > > > --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> > > > > > > +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> > > > > > > @@ -34,6 +34,9 @@
> > > > > > >     #define PCU_CR_PACKAGE_ENERGY_STATUS		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x593c)
> > > > > > > +#define PCU_CR_PACKAGE_TEMPERATURE		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5978)
> > > > > > > +#define   TEMP_MASK				REG_GENMASK(7, 0)
> > > > > > TEMP_MASK -> TEMPERATURE_MASK
> > > > > 
> > > > > This is consistent with other GENMASK() macros here.
> > > > > 
> > > > > > >     #define PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
> > > > > > >     #define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
> > > > > > >     #define   PKG_PWR_LIM_1_EN			REG_BIT(15)
> > > > > > > diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> > > > > > > index 0b0b49d850ae..8846eb9ce2a4 100644
> > > > > > > --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> > > > > > > +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> > > > > > > @@ -21,6 +21,8 @@
> > > > > > >     #define BMG_PACKAGE_POWER_SKU			XE_REG(0x138098)
> > > > > > >     #define BMG_PACKAGE_POWER_SKU_UNIT		XE_REG(0x1380dc)
> > > > > > >     #define BMG_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
> > > > > > > +#define BMG_VRAM_TEMPERATURE			XE_REG(0x1382c0)
> > > > > > > +#define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
> > > > > > >     #define BMG_PACKAGE_RAPL_LIMIT			XE_REG(0x138440)
> > > > > > >     #define BMG_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
> > > > > > >     #define BMG_PLATFORM_POWER_LIMIT		XE_REG(0x138460)
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> > > > > > > index fde56dad3ab7..7f327e334212 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_hwmon.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> > > > > > > @@ -6,6 +6,7 @@
> > > > > > >     #include <linux/hwmon-sysfs.h>
> > > > > > >     #include <linux/hwmon.h>
> > > > > > >     #include <linux/types.h>
> > > > > > > +#include <linux/units.h>
> > > > > > >     #include <drm/drm_managed.h>
> > > > > > >     #include "regs/xe_gt_regs.h"
> > > > > > > @@ -20,6 +21,7 @@
> > > > > > >     #include "xe_pm.h"
> > > > > > >     enum xe_hwmon_reg {
> > > > > > > +	REG_TEMP,
> > > > > > 
> > > > > > Any specific reason for adding this at the beginning of enum ?
> > > > > 
> > > > > This follows the ordering of enum hwmon_sensor_types (as the rest of the patch).
> > > > > 
> > > > > > Generally addition is at the end for any new enums.
> > > > > > 
> > > > > > >     	REG_PKG_RAPL_LIMIT,
> > > > > > >     	REG_PKG_POWER_SKU,
> > > > > > >     	REG_PKG_POWER_SKU_UNIT,
> > > > > > > @@ -36,6 +38,7 @@ enum xe_hwmon_reg_operation {
> > > > > > >     enum xe_hwmon_channel {
> > > > > > >     	CHANNEL_CARD,
> > > > > > >     	CHANNEL_PKG,
> > > > > > > +	CHANNEL_VRAM,
> > > > > > >     	CHANNEL_MAX,
> > > > > > >     };
> > > > > > > @@ -84,6 +87,19 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
> > > > > > >     	struct xe_device *xe = hwmon->xe;
> > > > > > >     	switch (hwmon_reg) {
> > > > > > > +	case REG_TEMP:
> > > > > > > +		if (xe->info.platform == XE_BATTLEMAGE) {
> > > > > > > +			if (channel == CHANNEL_PKG)
> > > > > > > +				return BMG_PACKAGE_TEMPERATURE;
> > > > > > > +			else if (channel == CHANNEL_VRAM)
> > > > > > > +				return BMG_VRAM_TEMPERATURE;
> > > > > > > +		} else if (xe->info.platform == XE_DG2) {
> > > > > > > +			if (channel == CHANNEL_PKG)
> > > > > > > +				return PCU_CR_PACKAGE_TEMPERATURE;
> > > > > > > +			else if (channel == CHANNEL_VRAM)
> > > > > > > +				return BMG_VRAM_TEMPERATURE;
> > > > > > 
> > > > > > This doesn't look good.
> > > > > > 
> > > > > > Can you add PCU_CR_VRAM_TEMPERATURE with same offset in
> > > > > > xe/regs/xe_mchbar_regs.h ?
> > > > > 
> > > > > It's not mchbar register.
> > > > 
> > > > add it under the same file without the bmg prefix.
> > > > 
> > > > The other registers are platform specific and have the prefix.
> > > > This is common and can have the PCU prefix
> > > 
> > > No, but the point of the xe_mchbar_reg itself is to only
> > > include registers that are from the mchbar.
> > 
> > Sorry for the misunderstanding.
> > I meant under the existing pcode_regs file.
> > 
> > It should be okay to have a common prefix (like PCU) if register is common.
> 
> Although others are platform specific they are expected to be reused in
> the future, aren't they?

This strategy of adding registers with the first platform acronym as register
prefix, then reusing later on the following platforms, was a strategy very
utilized in i915. However, when Lucas refactored the registers accesses here
in Xe, it started a trend of avoiding it, unless needed.

+ Lucas and Thomas


> 
> Do we really want another group in the same range?

perhaps we need to adjust the current ones bringing to the new trend?

> 
> Raag
