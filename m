Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94126C77B61
	for <intel-xe@archiver.kernel.org>; Thu, 13 Apr 2023 15:31:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6810A10EB01;
	Thu, 13 Apr 2023 15:31:18 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE48C10EB01
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Apr 2023 15:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681399876; x=1712935876;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fgvZamuG3jabt6MP+3pJ9vvpz5kiBf7dZCfzLcEWU3Y=;
 b=BEB2BIJEvl0817oHY+bGU6EwUhIrWZKTA4Y6PnmoJpCoF5fDgKlot2OC
 GIcZWHqedPqbNpY0kEg87uWPJsZBJM4QBpX1d4QHbKxvYBqqwHeSdj8or
 Zu+t1dmTR9pkSy8aTMR4cLKbMGn8xKbTe6dUcsznktOE0iSai9/swmx92
 sZcxRoZ0Vg0ywpn3gM/QeBBJZ2H2ieeCk80S5lGux9jqHAcdyxssinCJl
 jFdLZOGKshRuQNospk9L5R/3/5flWnUjaw7te8FTWFTYyA7w2DUegcp1G
 TtkyNPjbFeIsQWhl1/33yIYxzwF9ZxiGy6oD88gwT4jeExhsV+ZxZJafZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="430498110"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="430498110"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 08:31:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="800849501"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="800849501"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 13 Apr 2023 08:31:16 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 13 Apr 2023 08:31:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 13 Apr 2023 08:31:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 13 Apr 2023 08:31:15 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 13 Apr 2023 08:31:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XdJUcbJSGpDZcj+j7w/k+M/dlh3MiZ+n8Jo2ae6wKt4TyU5XhQJP8fW8ZGGOsMfEQSgTrLApQl+cXIpNvQxAoYDTYl7dWlnw7MA3e4lTcnt4089XOVjfF90RKPFXpQ6VHU27eGVeG1m0T1p5psx/F7t/iORKqpqS9IclLVBkIpg3RXnCBR/FuqAMz8czuLPKVDQ4+LbT13nmiTd1kSXLo4thIrZ6pIzgKtfcxNHSZOFBXFROkTWiBd18D6q4pfELrPQ2hTvc6mIlZqFWbTDZmEyj1CE3sbYBecSIRwfk06H0Umy1OxI3eUwHCLBY/7WuFUXeNKgIea21k+BcO8gaQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3CVk5VqDl7jpYycnolbxuZeIbPK955elndao7+cxLk=;
 b=MkQvIZ86H5HByA25LxdIYpmgIq2hxvBZn42ROqVOFvJnsPRgRLn00jEuy/X+hnTgpgvX19eNiPoALJb88JjPPpiF6yJwDBPSUfMVx2gI+P1YIlyMdV9Rc2Nb5h6tPylgEjM0nGYBf4E6+vCHqK14Idqwnq/qA+fK7ytuG00uXfpkEm3XL1use9RlqJkUP7JSRJtQ3ukAVq2TB0ZzDZkxL/ALOTDDX9XGgi8xrI2JaT50XzQBBlfmxbIY9Z6xiZaahFPEN9UKNNipmen862px7FJfJsCJKq/84p63Q1ofYN0qDbx/9KpPzlcVaOsxBQ4k+1O9NLnWSGjLszkV+BuHzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CYYPR11MB8307.namprd11.prod.outlook.com (2603:10b6:930:ba::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 15:31:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 15:31:13 +0000
Date: Thu, 13 Apr 2023 08:31:11 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <20230413153111.h6pmcdqwih2rn4yq@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230412232846.3411883-1-lucas.demarchi@intel.com>
 <20230412232846.3411883-3-lucas.demarchi@intel.com>
 <871qkocku6.fsf@intel.com> <87y1mwb66g.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87y1mwb66g.fsf@intel.com>
X-ClientProxiedBy: BYAPR11CA0092.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CYYPR11MB8307:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f8fcea0-dab2-4e5d-25cf-08db3c341d36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3qjccEw0AgZVcN91d/RTHbZDoB83iv4eEgILguO/eeRaKfrHDSofFTLr2GbwKF1yKwVSeBUf3z8a7VOnHOGGSfNLw/XlN3LaXlnqgJH46znao/z0maxUt89DNa0ws91wPQp16p6UIER3qXLutKFzISv6JDrq3Y/WjPgKpbMNJwNToeP6x5DGRK8jxay5gWoi1W2nSIegPUhOeYltMmhm+eFAp0JRQihf4R958jr2ZF51u4hd2Kt+X3Y0CI/4LgwnFCQ37PSjwz/g6esWMO2MPPrsq1x4DewunZ08A3rvTAuXWOmN2pvDC5H0hPB0UxO/y52SdPgi9uiBay41G5mdin653RtV8OhUDJi6RMGPkDUmIpWCNr4voHbKzZ++5YrrYmWH8Qvo4G0nUANpXM1WxJmf9PA+NmIFxFQX0jjsCsRLbTILPvb37AliE1i9Wg52XzLhemyRT/8NI2sEKirsUNycTtOMN/gXq79JUQ6eaakbuWoTXUDWFE/aLcU370grFI3m29/Fj6UX4XvONC/yaIZfMVoYAh+7rlWzpQpRA2xCK0q5GtrWhYJolYAvDBv6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(346002)(376002)(39860400002)(366004)(451199021)(6486002)(6916009)(66476007)(66556008)(66946007)(4326008)(36756003)(2906002)(86362001)(41300700001)(82960400001)(5660300002)(8676002)(8936002)(316002)(38100700002)(478600001)(9686003)(6512007)(6506007)(1076003)(26005)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E+lTcAOQY+XWDs1x9Qin3WEvIwo7AOCJf/Y/QGOVjQuzQHfyDTkbX6sLqF/J?=
 =?us-ascii?Q?u9NLtcNmnOomcHqW/eHSDH1NqnxKRQcKi9PQKaY7WtyY4YenFcEoq0jXFf9o?=
 =?us-ascii?Q?m+SWuU2Ju5Z6NmQ1C70k7R1x/YeWTM/4EaYeQ6cgA/YxZWGMZHlAbM5rDemw?=
 =?us-ascii?Q?2UMT9ql4L0E90DxyCTNYuTUipqIkB+VKVh11KnVvfkF0OfUqIMtdzgWE/MMv?=
 =?us-ascii?Q?Ge5xch1nHJaUxzK5pydHUGoGzeLn2cHkwtxMwVEmIZjy9hDlGJ4F8g1lBi64?=
 =?us-ascii?Q?JwPd9u5oNw9fQgGxSRvIkj3jQL08gq8+404E0FvTXRJcZ3Jnaj2e86xs9YUT?=
 =?us-ascii?Q?1fp9/ZBjT4v0VhJhuvEyOpaZ+01hhly6JHhNm2VRKnSOXfcGAYB0+WjXvMax?=
 =?us-ascii?Q?BMUrXOnNCwGC0IPXtFox8Zigm4cXvqaDd4xqa7ZBLRgAGcquR1Pf/EHA/Bin?=
 =?us-ascii?Q?EK4k2TpVuF21cxL28vTNGZ3pCDdhhZ9u2xY8rJh9h0BHkZOpV8uqtQ0AQOwA?=
 =?us-ascii?Q?pDmGPLPs0o3EYji5Jlel2nyRDUCUDykMFVjcbUcpBjZ3eUFJ/0byksVw5n0f?=
 =?us-ascii?Q?pfB8L9aAvL8YyFYg2cfkeFV9G2ftniOtDFeqNYdVyLo/MP5WT9jspPTGKrzb?=
 =?us-ascii?Q?fzd2sSTzgCDHzX3K7+9vtrBWWFo6KGupoi2LeFM2ImgEi7CPgxll2Y6lP8r8?=
 =?us-ascii?Q?BEdYTyqPBKEuj0uya1RPfa8o+pcyPvVycUswXHZALhAqF9B/HA+9AWgAy+f8?=
 =?us-ascii?Q?um2/CmNaakpcgEQ0DJVYcTponqk6/nMM1maty8Q3NkurTRwN/AKSXVUROKhW?=
 =?us-ascii?Q?hdO/MpqVy8KQL9jeQs46i/0gFgrbXDXkeqQDc1gNtyz60xtbaNvfeyjMbhJ0?=
 =?us-ascii?Q?8vWhOMVGT5KdwvXZGCEHMrRiFS3EsSheA991+IqyUggu5foGdB45YEj2oQFZ?=
 =?us-ascii?Q?0CL/WMuhaPRal+y165n+Z9yav2tM8GnDITkueRC9gAUDixpkqX88H6CuGJ/e?=
 =?us-ascii?Q?+2AZSuIH9e/ZowbPwcqVg/YAjJf5N2peNqHvaC0BWf2jmQroq2Q6msnIMD3k?=
 =?us-ascii?Q?PhMmw/b8d4yAleYhDOWCbbzB9aIm9twpyOmpWQBqZUUJK2bjX5qVSiiS8+yp?=
 =?us-ascii?Q?DlUohE2341EA+BAqNvhZ5pusFEGazDpY98jvVsQA15V5oQJejI9ue1JqSRGW?=
 =?us-ascii?Q?q2POOqpzEFSLckXCX9Ug2Ti279yMtH8GEJMsKdmTUZe1Ri0k/ZKIy92kL4ci?=
 =?us-ascii?Q?swRwis8SoMUpl3tEbDhYf8pdpg+Wdfpg/KNatkyeT7U5Gy0GrPCQo8ZCKUDT?=
 =?us-ascii?Q?cWcwRO+HvDB8Io6Wp6vglNF1HIe+Dpx+dLwa2CgTTt/2qzZwSwSX9VUxqWwd?=
 =?us-ascii?Q?QKhcPIXZ3d9ke4GGqUXTDX8fjmlQmejx6FCYZDjQV/Qd4NhH/yI5dyjgwJgb?=
 =?us-ascii?Q?8i7ynLqWx95+rFGAxIoFFn1fLatwSHcpCG8SQTt6lapb60MSqzklKH0+8mLm?=
 =?us-ascii?Q?mxPZhjmcqxWGZd/O8t+b0PP07CsF8cW1RMo/I/MOrsIv04tIXZUmBPFDxoE3?=
 =?us-ascii?Q?cu0Tjpyu4uEXdrsmyyzli2tOBvzbnDEeIFPMkjURIWT1EktqKkS2RSsJgGsn?=
 =?us-ascii?Q?QA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f8fcea0-dab2-4e5d-25cf-08db3c341d36
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 15:31:13.1417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pPvJ2GEP30dmiiLvCqX/qC4jTk4KkApQ4tzjtKySXcLYDUodo+1mZl/8QjdFf2xANO+8bo69I0OmzOpKOgKWb9zi/7rBDifQIDFWWsMQk4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8307
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/6] fixup! drm/i915/display: Remaining
 changes to make xe compile
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Apr 13, 2023 at 10:19:19AM +0300, Jani Nikula wrote:
>On Thu, 13 Apr 2023, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>> On Wed, 12 Apr 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>> ---
>>>  drivers/gpu/drm/i915/display/intel_fbdev.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
>>> index ed996546edfc..46447dd58f3f 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
>>> @@ -165,7 +165,7 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
>>>  				    DIV_ROUND_UP(sizes->surface_bpp, 8), 64);
>>>  #else
>>>  	mode_cmd.pitches[0] = ALIGN(mode_cmd.width *
>>> -				    DIV_ROUND_UP(sizes->surface_bpp, 8), GEN8_PAGE_SIZE);
>>> +				    DIV_ROUND_UP(sizes->surface_bpp, 8), XE_PAGE_SIZE);
>>
>> Won't that break i915 build?
>
>Won't, -ENOCOFFEE.

:)

with the additional cleanups we pile up, maybe this part will go away or
become a function call to i915/xe. This patch series concentrates mostly
on the renames.

Lucas De Marchi

>
>>
>>>  #endif
>>>  	mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
>>>  							  sizes->surface_depth);
>
>-- 
>Jani Nikula, Intel Open Source Graphics Center
