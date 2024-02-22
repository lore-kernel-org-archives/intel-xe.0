Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7CAC48BF8
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 07:05:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691B910E87F;
	Thu, 22 Feb 2024 07:05:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PorRNOI3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587FA10E882
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 07:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708585501; x=1740121501;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=h4jMmaX1wlJVhw/pYQWFklZOIOhlmourKGzk35f0Dmc=;
 b=PorRNOI3YS7ZN9URtkTtwYykkgwujfDFcBkVw2ZNcs8b+l0D8itIUk2b
 IourI1yUaLrVUh0xnXZ7FAkhxco6PAne07b+Gn3CG9nq5nP5S9DJA8NuG
 XWPR7S3uu5aWGloN4MIyXpFg5Ixy4wLMVBuq/4oBSVtYi2CyhCRX3eLDn
 5onic/WddRBhqIBoVQGz4Dxa7btjvzzhUK4+xZL3epkbyJQGA9txVoU65
 FS4JX8KTfFMsjd5pv5necx6f90Hmdpn/aizU+heMPvtT9Uw1aygq9sraU
 Zqgpx7mLTTMPtHq+KHoJrH7IXuhez1eDVXD5g1M6ZNZRkWm0jdYV27jlr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2902406"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="2902406"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 23:05:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="9992163"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2024 23:05:01 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 23:05:00 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 21 Feb 2024 23:05:00 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 21 Feb 2024 23:04:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lp536dNXnBTTutFXB2T2YMo0Sj/16+XWgzGhU6IOcjzhbqx84rZafpS8/YugrR5onGEk/q9NePHQc3VHicZ72m+gVq2CG60lBvT4Ilt947b8vUvAuBZuKqjWCCxMA/U0IuKilYTenOfn3Wv/XIwgzOKEWKRrEFmdesVo+Y1iSyNcHZ81tXBQyIr7BYp9/YCBgHyRUHbGUaWFQIi1kEqE68ty4heBCulCY8SQabol+uW6L5G8j5skpf4amkJG5RtA3M1TTNlqhdhGp5U4u3mF9XuwUmmNf/PFd1DUu7BsgnmmIPrHEY8OrQhwbOQWfnKj8vJiy19UhKYUN42IzuS7pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4jMmaX1wlJVhw/pYQWFklZOIOhlmourKGzk35f0Dmc=;
 b=Kbf53A1iLIyTUy6RHdZuPxiyxu5XnTEmwy6gkDUenCYavriS6g7mGWwEp6tQQoiHpOKC68WiPJibNpAue+1Wvi3gRs4CW6/ePsj9zp91lt+rI9+xX1noMWC7prKscmhTEsn5joN6Si7sE+udgm88ThtLuFM7De4fbFuJvawNhVYc9CTyeCcwhmRmCPIIlub6wYCWmQIHkPbfPv1oV4cY8dUhV5EXaMiTcPLdYU5cz6OAkgBM5/rVnjwKmsmekScQ/VTtkXHF4dopan5J7Ptcsjjl3pphGXp1lftmY3HnIXryHtiDWZOcqejJeN/sGYEfZUsrU+aXtQdZ29FXcU5JGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB7633.namprd11.prod.outlook.com (2603:10b6:510:26c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Thu, 22 Feb
 2024 07:04:53 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7316.018; Thu, 22 Feb 2024
 07:04:52 +0000
Date: Thu, 22 Feb 2024 01:04:50 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dafna Hirschfeld <dhirschfeld@habana.ai>
CC: <intel-xe@lists.freedesktop.org>, <ogabbay@kernel.org>, <obitton@habana.ai>
Subject: Re: [PATCH v2] drm/xe: Do not include current dir for
 generated/xe_wa_oob.h
Message-ID: <lkgksem6pz32cqhj45ycyqwc2xhlhn3hbqh7ir6al2ng6x6njf@57tvzrhzl62w>
References: <20240221083622.1584492-1-dhirschfeld@habana.ai>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240221083622.1584492-1-dhirschfeld@habana.ai>
X-ClientProxiedBy: BY5PR13CA0032.namprd13.prod.outlook.com
 (2603:10b6:a03:180::45) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB7633:EE_
X-MS-Office365-Filtering-Correlation-Id: 626e78be-abf4-426b-2b8e-08dc3374915a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G7uNZVF08ZceMI8tRNBEGxLGPjOCXxkZRBvmDCp4hOx/+wVryjhRHzv67cm9xylK88T/tiSOjimilpL3plS4+f6CXtR6aSxudBeNiTaw0tlYxifkvAfMHUGMW+4x/arwgx00covcFnDftPBzJGDaPYbs2d8vajxI0GSa5D5RwD6MxJuwrmzGCcfkhNviM5FIz31qo9XF447EOd+0GE/1mHEpz2aphx3UW4I50R+f6f2USAKZVZVWUUMq+Eyi6rWXGgReCpkAE0AuTt2Nz2MFbhCTAciFI+cYvkEu9XpGGFXGlUSlZf+EC7FqQg7Hej9otT6uo4wWl6ADaG7mQScQOMJWKQKvqNubIGyfXqPr6Iyp0yeAeB5t+j2KODyNf+fIfXuuUQBqtMNkE8v/24h3KphwMtOkUB569GhCSS2xDRrQ4KylqoHfHvkSkh0TBL18BHbSuAqjcoPKTcWHCupvF9PEa3IFBbjDS/qo0A6veg+QNAVnSfuRcs7UPzeXs7zepWuPyAuXVV3nDmq4ADGCxkZn7Zd8L49/pLT0YZxh+cw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gJA4GVAkGYv8hi9Bd6OqCyaBQ4x/qrYCFXqZJn+an7+XUvxnWChkSIQTVmiw?=
 =?us-ascii?Q?m3Q+uorWKLXxvryLfGB5IX6Y50yC1x5lyIE7apsn3kxOR36DC5B9LhheMvLo?=
 =?us-ascii?Q?MFcsZ6xbmIr45Eb8t+Sv/zNAq6s+m2MotTE8cDfi2jVTbdB45Y/oyATix5gV?=
 =?us-ascii?Q?twkjSKj4QNuX318jD1YdYxNRkieo9jRgJJztujA+mDooOTalGhLxRVdt99WY?=
 =?us-ascii?Q?W1Q42E4/rzNwIyOOtL4fzHv1R6bh5zyFFFFeV9mSnvKYDRXrPXijD62csyaW?=
 =?us-ascii?Q?l14gJGffAh9gpbUZm+vwDJdwQ+yOYKKbDzOMA0bWUmFaWd3ED+O9Jg40PXX+?=
 =?us-ascii?Q?4qFFGHt7oVrQwQFvzk3nW944MjhFqn/YSqgad7Fa158/CrqfEcyR+GZk9+sh?=
 =?us-ascii?Q?DdC22C9zDFAsq6KqEdZ6r2T6sxQvDrmQUNJ333nXa/Qom5tA+tB8zrQYVzXv?=
 =?us-ascii?Q?aSmZNKJASMMnMjviJmgwAWsLvOeCR3WpKVQP3W4pdaPGx63Yb6IF3mFEoMNK?=
 =?us-ascii?Q?AST28UcA+8iW/VDLwO4WJLG2HZNdTUJAHnpL1SPw0EPpGpDBbjRXrign8kKA?=
 =?us-ascii?Q?tLWvi0iLcJaKuj2pFwmFgImOZ1VrJDDKg1U1OrqxtutYFtVxtwzfrH/2fPT3?=
 =?us-ascii?Q?UzIAt+md2Kd5oKSy9rinHYNfoTQVKkAiqPzlls3gm+5EwUU3Q09jBa0f/1k1?=
 =?us-ascii?Q?eVxi+IM9p/n3jjPitb8eIHJGf+t2xQksTTofUEvhR0l1CAZxGL9NMA+5S9eR?=
 =?us-ascii?Q?+NOgDuJbUYD9s1VAiC6oGArjV10lCoUoL5T6+M2DbtptrLFveyzLEp69FEpq?=
 =?us-ascii?Q?OGJ460yXh2sPxuq0DPAwGll2xZlWSNpMuI78E8ou/C8PlTYjR7If4CMOC8Ft?=
 =?us-ascii?Q?9wjT4znJ9e6voYAL8cv+mA/Gh4mdcaobfEyL4WhLdojm2TwdVDHx1c60u+qn?=
 =?us-ascii?Q?JKIk3cGsZLqQ5pdhO0P3/tgG1ppQrGjMUKyAl227UarCkG215oJgv53/FQz+?=
 =?us-ascii?Q?uHH3rOu5rqjwLS33qgXJK+Tctj+Wf/lSROcEqvXlAwpx75RwDQozHCyyWeAC?=
 =?us-ascii?Q?YXEzs9i3htHNiGam9VNQ0HYlErDrhi7Rxd/HV6olZ2rSQIw9cITM8BE1uwMp?=
 =?us-ascii?Q?4XC9KavdWCJARuzUf+j0/hWCAPBRqliU/vLe1eYyFPa0CN2KJau/qzqV4mjE?=
 =?us-ascii?Q?CbCCmwEWIQtycgOKImRW0rLpXocHs2NihhRWeRzXyAVG+UFN1JaFQk6r7ew5?=
 =?us-ascii?Q?EMqd69vyjU0mmfrTvHQKzzoplDbbTha/U+wtQyObQl4DKaG8v93BShk2JOJw?=
 =?us-ascii?Q?9dTesN+QWgpBPuvFLKQc3OmnIDfbtsq2DBuigst1r6Y8WExuuL/TRPWyMqnH?=
 =?us-ascii?Q?Uwta3UkrhIciQXUoemNOqGyhoA3QQDaXGljM7ECiqBCoYwh436QbF2GSclwn?=
 =?us-ascii?Q?rt0ZtfagPuuNkoh4gg0oa8aROYSOW1Dhtt7mZymLXh5vLs27C2hJLns++0j9?=
 =?us-ascii?Q?Ssqpfa88H3vlIyRI5TQrYbLAJFV1KS46Lq1v6QvviIvnp52XvugQUtN/76iM?=
 =?us-ascii?Q?V5s2TLc2Y1h0SCvciQsUVO9k7B2OrPfdsz62VKP9Pp6I+Y1Ooc4CSiSVwp4D?=
 =?us-ascii?Q?gQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 626e78be-abf4-426b-2b8e-08dc3374915a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 07:04:52.9278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qZIQuuJ/bZxeHn7KOJ3wxjIOHLtQaWVpZMY1TFFYnk1tNokpIOf0oMZ3INTiSpdcIs9/FqrgpqvWL6iv3SmVzYdxP4lc55aDvH/DHDeK/sc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7633
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

On Wed, Feb 21, 2024 at 10:36:22AM +0200, Dafna Hirschfeld wrote:
>The generated file 'generated/xe_wa_oob.h' is included using:
>"generated/xe_wa_oob.h"
>which first look inside the source code. But the file resides
>in the build directory and should therefore be included using:
><generated/xe_wa_oob.h>
>
>Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

applied, thanks.

Lucas De Marchi
