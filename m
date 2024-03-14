Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DEC6C5475B
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 04:24:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F00410E9F5;
	Thu, 14 Mar 2024 04:24:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="msEaUfUI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C2F10E9C1
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 04:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710390267; x=1741926267;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=RbPfOtZr8iZA0Zued2s0rBaE1z0z7m5GguSkA3nTU6M=;
 b=msEaUfUIZgABrajUb9lmsQW3eA/X4LVAn9leoEOkGUGnv0nvmGBIIQ0H
 qxAbLDbtM95aO/VDZenSto/4GM7fQ0+0ab57SGjBENpj40/7C21vPi347
 ADX5IJ0VgG1Jnhb+elraSsj2eb8AAT4FmCefFZKyCg/5kRamVxML68BhI
 dUgk/jEBk9oqOOTgzXLElagjrnGuNnmHcB/02ad4ISReSHGw0g2s4PyJJ
 1qXvTNnsPPAijCMJRIGVArmNNpS5udiyge8QrTTwU2gzXX5JYqfL/VRj9
 ThDwODMYEwwH1BfgB75Ni9Qg8JUvt0z8D03VdNztSuNyh/PSyGfUYdu2K w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="15920259"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; d="scan'208";a="15920259"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 21:24:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; d="scan'208";a="12179631"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Mar 2024 21:24:24 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 21:24:23 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 21:24:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Mar 2024 21:24:23 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Mar 2024 21:24:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OM2wb9zYvLq6J4cKkpcA4idoiTs8NpVgHAdZxgiOz41C/tic7p7UVII1TVIH7N5bHKNkWOJesB4sLiP9hcRtjG8L4eW8VCz54gWPQAK4bYFP4iJ50ZKPy4/DKCVug43WSI6Fh0u/oAejenEUqEd0QIDH1GsSBT4l4QVTgC8WTlcOljSL87oP8HXmhDYw0sYrwz8wKncS9DDhnvwD7QBUNEBpdpsQtMPr8Pst5tNwEQkpVfyasLhJxEzo2AQijOl4K22Ctxj/fUbmqIbeUuHcEtkp0YYPAmhmju5Bk/E97+VhGd1cPXfooNPn6g9qMIYKaRS+RaJC/IyyOvBPJG5NeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9vtCt0cjPej7rRzwzBrpZa/038zI5ClbvVdoc0+0eYE=;
 b=Isq1NVwKbXcllMkmy70lDL8jRDFT514s9bu2it/OEQRihR/g8J4fSfIi0o9p7GGGQZloDQ1mJp5BqzfWUyxQcAkeviOoLzAm4lUyJGIjjoHz/Jg9jLg/AV4nPPEkq9EAYri38/CACEjrWD2Jdp4e5/8ZnHuGNJN+7BNMc22YqWuNquzF3Fw30pr9qkTnWMwm4HTTGtGHiuyXXW86JOy6MzQPTHFFnFx+Mcyyb1L8CUNhEw4heGhHQ6rV0Gtls7YxrKhmK1nkmbfV9BiMQsNEXBwezg24wrvWKtqRJNeqZGifyfDbQU1YUKhZz8JjK7j+MTdNMayuWTOO/3rdY40E9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4812.namprd11.prod.outlook.com (2603:10b6:806:f8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.14; Thu, 14 Mar
 2024 04:24:20 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 04:24:20 +0000
Date: Wed, 13 Mar 2024 23:24:18 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Remove unused xe_bo->props struct
Message-ID: <kmzl3el7du6ayejgiuzw5pi3bkzpevdg3jgksl6gogcvhcmpf6@3gz2hhuiuvud>
References: <20240311151159.10036-1-nirmoy.das@intel.com>
 <Ze8yWTmHYScFSpax@intel.com>
 <5h56xqyuxiyspqklvqt4zzo23hgaqbevi6wt2bqimw7hnlfdlu@yyi7wlzmctxo>
 <Ze82JHUo52CQp5Qc@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Ze82JHUo52CQp5Qc@intel.com>
X-ClientProxiedBy: BY3PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:a03:254::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4812:EE_
X-MS-Office365-Filtering-Correlation-Id: 164699ae-10ba-419d-30b7-08dc43de9ea9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yx1HE7mvhbEc12t9MJB7hNsu77on6V+gjCIVWdz4WtWNbg4VLl8yJ3Uuw/7KwQoZkTMrSB4TeL+7qF5QfRjPCsCQam3DmaJ0yd7zuH0uk8GWTzrl4DEwFl3eCAGEI2sx792dMMoLtYtzMW2w4zuElbGb0fc5ApYr16T5cQsK/j9J59LhxnMcvIBKsC8VIzeecpC+Q4ttNaOSjRCYWkkn5nADDjw/7TbiUG7Rv30+F0euRf1g8g0N49AQM2OqD33fHtslIFzL3TCR9yx4/KZtT5ieKLkhhfejeZqq3MWJxJEGssJDhCl1cETkkErTtZS79xHfZxzFBIUM7moYdNaElWSf63zYAL4Y6yNO5eSdAFJK10EPhoh+3KrsW+pV8LVNe+egODb62IV0JH3KM+e7wKdAd4iXjuyo91EJVmFG4VT3Wy1f1x4LwQSt/BL3iBXPRnUQypxV1T/l93ZPV2zm03GAu2DY5NlNQk5+ZZjMAJsAW6vQJigex5u/nMJxRW7kjzVtiZmRkQ5cyz0E0AjvqPAy56bJ61d/GDR7iucwaPr0OqwoRA7VRZ9uo4Loq1W+dMQ8vzGY0aXJFUI4SabdDuOvVfDn7Oc+PjB0dRnrPfVschdQe3ZodNGDDXt98D8ls0TvhmI4zKzlAPJY4WYiUcOHaMiQIbgHhd17y76Nu1I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?VT+Lq3nHzRSBKNkdqac2Vihu42oKPgAgOKLUBxUIFhnj+kfFMeF7aU+I3Z?=
 =?iso-8859-1?Q?QNUw1oBkaF8Q35ZMs0hXYsfOEC3vfpW3OUJYp5gM2FX8BqC3Rc2D67OIkw?=
 =?iso-8859-1?Q?h+DoDmf7mAOHKKPHHDdye5l91IRALKD0ZEU1B2psL1FlI8pBOEZKF0wOzt?=
 =?iso-8859-1?Q?Y8gMQ9sQb4Jq3nFWE/wiiosaL5Ddrt58ucZyfPd42eQLmD40UUMcWGgmG8?=
 =?iso-8859-1?Q?+dNriDO57wlNm/LaVFTGPfPlnZpBjuTQWLuosIu/DYPP5oA8hRrpSLUnSE?=
 =?iso-8859-1?Q?zXpw3ahR0WHDYJUG4qtjyil6/m0cJIqrfEZhMuFmehkltZhRfzVJR1dmZ6?=
 =?iso-8859-1?Q?SLxPw/w2WNJFS8/mAGLpbwIK1k/n3VQQ78x8i4w60Cu48wvYG3Jyaupra6?=
 =?iso-8859-1?Q?stmo+xZJqxy8Gkog44XY3uikOn+lvWMCLFA6zl5T5yuOq4/1g01LzxuG9J?=
 =?iso-8859-1?Q?0rDJqfRv/zVTjCpmxBtZaF4IMGPLc9gMKIqFmEdbPRgPqeTUchrGLi0kI/?=
 =?iso-8859-1?Q?Sk9n7YCLEPOJYj5ykgIFJDYNPpgF41/agKtNfQn7JkH+IJV1FHM7KvPNG7?=
 =?iso-8859-1?Q?b+dEkNuljwF3Ct/bREipxpssD2200hXAZxcvHDpbxwTcdlQCTGfJmTAeZn?=
 =?iso-8859-1?Q?50LPL5wN8ZVoob8gtrLW9rU1Kkdb+C7HJgXNGk/lInPbFNTwYIL/wicHTw?=
 =?iso-8859-1?Q?tBBy3uw6ZHsO/ehFgkl55lUNthu4C7rUX/xtN0+zexW2N8tr3ddGwHskBX?=
 =?iso-8859-1?Q?+WOZd9OZ4bZdts5r1MD83oc1EcN0tYs23IUxe2bTU4P+WYXJFlcj5fRIIG?=
 =?iso-8859-1?Q?mhDguYa1klDcB5qSX65Zq0tIKFxRKDAHEluh0nEmAT0Z0OY7IQ9tJl4ayX?=
 =?iso-8859-1?Q?6fbmZhgNmSq+vpFRe1yuyGcKd92M9GrJ70KeMUU/tjQsURYBjyh0M26F8g?=
 =?iso-8859-1?Q?F77yNgJ14e+bhUTYdiPW7O1OEO9lI0bAVCmAxPgKTYH5hExwk654dpsP1W?=
 =?iso-8859-1?Q?V1Yo2DtlGI+y67Aac5uBnC465rFqd2GdOlyuhF5p6J7Ep7/m0znIdxucN4?=
 =?iso-8859-1?Q?NhqxYJx9aCC9ha8uXqKiRC4FbYx+tifLbrv5ruj+sI1S6QJwI+yY+xwjFA?=
 =?iso-8859-1?Q?nnDDecd0OkJVdUb94ob7I3mMfIJ1ZNV62KJaUP85szC7XChcsbL+rj8C77?=
 =?iso-8859-1?Q?25N9e1ZxlCRwMUku1fsMUN4gVcalk33USzNcKJKevVDmU64JTYnivd5ieo?=
 =?iso-8859-1?Q?3Q0GIV379AVKtOS0YQI3ogDeJu1CwGwrM1afvg3XHjQgrieGL9+zhM9Scg?=
 =?iso-8859-1?Q?3hNX1i6uonIEm6qOlJnEu/Y5w9OYs8XVfyCnojh5bkQwI978+FmwQr5M3M?=
 =?iso-8859-1?Q?RluzwK5A9eRev+SKsi6If7obVv1b916/pNHKnCpwWiqoeynxLS6kKFi5zs?=
 =?iso-8859-1?Q?dQSjXpDBECnmcmjed+aYHCeqaZe2IHv9Rjc8NTahfjALdV5Arm5+E+ink0?=
 =?iso-8859-1?Q?VoezS003zMbqqfVTT1L5I1UyPqFm8PtUbYUaUu3B0LAVbadR/0mEXdfQgl?=
 =?iso-8859-1?Q?4XkjAlALfw95dkFPjA10mD5nLO7/n7W8tEylNkmQlI/HXuLAwXrapomp0C?=
 =?iso-8859-1?Q?ljcrEqrb/Km8AmLDDpsUhIoTUVUFksnsK3DfF270olSIy6XeYc0v1Vug?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 164699ae-10ba-419d-30b7-08dc43de9ea9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 04:24:20.4759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GjXmpoNh7Bit0rINvkuNqR9onoopyUk3QuMt41NRHkro87AGPPXeeHgBGgNNSjQogRTK/vRDjQ02uSn+lygfRNeI3MFvg0L+Ktz4tyVdoIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4812
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

On Mon, Mar 11, 2024 at 12:49:40PM -0400, Rodrigo Vivi wrote:
>On Mon, Mar 11, 2024 at 11:43:54AM -0500, Lucas De Marchi wrote:
>> On Mon, Mar 11, 2024 at 12:33:29PM -0400, Rodrigo Vivi wrote:
>> > On Mon, Mar 11, 2024 at 04:11:59PM +0100, Nirmoy Das wrote:
>> > > Property struct is not being used so remove it and related dead code.
>> > >
>> > > Fixes: ddfa2d6a846a ("drm/xe/uapi: Kill VM_MADVISE IOCTL")
>> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> > > Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
>> > > Cc: intel-xe@lists.freedesktop.org
>> > > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> >
>> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>
>> afaics this is only removing dead code since it was not possible to set
>> those props. I'm wondering if we should really keep the Fixes since
>> technically we don't need this in 6.8 or 6.9. Thoughts?
>
>good point.
>Fixes tag can be avoided here.
>And perhaps just cheery-pick later to fixes if some future patch
>conflict with this.
>
>But also if we are in later states of -fixes flow we can drop
>the patch itself when we are cherry-picking the fixes.
>
>and if we are in earlier stages of the fixes there's no problem
>on sending a clean up up.
>
>Up to you there.

ok, let's keep the Fixes.

pushed to drm-xe-next, thanks.

Lucas De Marchi

>
>>
>> Lucas De Marchi
