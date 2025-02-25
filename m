Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F07C021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 23:08:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8932B10E811;
	Tue, 25 Feb 2025 23:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A/i680Z5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7E710E811
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 23:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740524910; x=1772060910;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6TdvDNdy705g9LrGyhaOtoomDdrPymcfVun+Eu5rsLc=;
 b=A/i680Z5jqxv2kgm5hrymF1iER8aU/nHAXul865W37iCESYnWvmTywLR
 j66w6RRqZ5lp9OEk39PUP7h2K49Miw0KAT9Rft2LuRcSMndZV5vngdvZ8
 xo6psk+xiH+ylqfR4nunkJ5uRvuMqyZt5VD/D+71glDHxRP3f4RoEXF+4
 lNJDkb5hedKs19r3cAW81hbDXdEdGX9wnNXdyhi0ZuiiFLj7RR8YZUmEH
 NgB8hoQx1tBcUnakursnFoj6UTIg03oQow632ca0c10OH52vDptnl4/V8
 yBaIPvDPE/4Bs+M/0FAOVSUcd/laPOH41qX3SZgepvtnErVoKUCN4vnCh w==;
X-CSE-ConnectionGUID: HPiyv+6PSd6JOh3C92u2Yw==
X-CSE-MsgGUID: 5aa6mi5uTqKmryAkN+t2Gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="45005343"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="45005343"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 15:08:30 -0800
X-CSE-ConnectionGUID: RN3/sfszQvmjiLLUkiDcFw==
X-CSE-MsgGUID: KW0gC1syR2iJ0RljIZV5kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="121468906"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 15:08:30 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Feb 2025 15:08:29 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Feb 2025 15:08:29 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 15:08:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GwTHOxinZe3grHQZPQmNazlqt74awqZo1DaMcRUNCtnGl8BPNx+VVeUJmN3g8C3bLOjW+u9pW6yIyCpElDT27msg1wyifD0f1xT6fc+9uTAavk55Bg8R8j/M3EiunKbAadKLD6LzIeFqYOPEukcxwpLMA5N19OpwDeEj0UVj58FJfWWX8YqLAGdySP1qGEK7NR5YEumb4bz55HrMdV+7DdA3f34ejby9O7TEt3IXctS9ETU6CiyZtxdyr24utBUgpHUJw7jaTokQACFJQosN89FrnGK0COf/JO7Ze4RysE6MKxFKM3/WHWFRKzNQ8/E+TW7vme3/cDMH7VQYWa8BKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r0kVzpuYwqjhEu2bHmXn1N1H2QuQzohayDYstbMQv+8=;
 b=FV/c14onS7TGKFAt+lugwvUGI7rHQiVkuarVTZvph6igK8VbVRnc10sXfTsABMo5nlle6bpjgDYJfy5xh2FKXAPAifKxJf8Pf9L72iYeZzuQUXtx485na5CYjTQxKcwoogUswy3XzDr6qE90moNParb2PeV5Lexb7lkT3nu66q1h1/CL80+c4loqx2LE5AD2YCneSLUDKJMB8Y5j8MEECyCgX4PVTQKZG9ABu5pvxIfWvS2kd1FBSVxM88tDA0c8JFeQ+rzev6K3je80bI1ERiOpNBpUEC/+1/fdkywJ9l3ww6A4WvwNsw6JYMyKSuEOFpXZcdbFhqRBhg6U1cysOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA3PR11MB7461.namprd11.prod.outlook.com (2603:10b6:806:319::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Tue, 25 Feb
 2025 23:07:39 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 23:07:39 +0000
Date: Tue, 25 Feb 2025 15:07:37 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 4/5] drm/xe/kunit: Update RTP tests with SR-IOV rules
Message-ID: <20250225230737.GD5109@mdroper-desk1.amr.corp.intel.com>
References: <20250224150700.1778-1-michal.wajdeczko@intel.com>
 <20250224150700.1778-5-michal.wajdeczko@intel.com>
 <20250224225528.GD4460@mdroper-desk1.amr.corp.intel.com>
 <b415f920-0766-4a53-b97d-f5579ad3d04b@intel.com>
 <20250225031001.GH4460@mdroper-desk1.amr.corp.intel.com>
 <03c26d55-286b-43b9-9f08-a1379d5a7bda@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <03c26d55-286b-43b9-9f08-a1379d5a7bda@intel.com>
X-ClientProxiedBy: BY5PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:a03:180::18) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA3PR11MB7461:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a6f0e49-f973-46f3-0599-08dd55f13374
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CmW7APgkqFE1KGxDeX+42KKWi27Bp/jUWlcvS8taJSHYxXJt8Q4+2B9FTViy?=
 =?us-ascii?Q?dH2zTustvCDEKKI8JElw2kawlHxFrds4cLM6lHEIRLqy21xz2ejTnb7LFlOA?=
 =?us-ascii?Q?Y7NM+Z55wL1edT0YiqfNShQ+3cb8E9ELZ6R+U0HUZX9JDte2h4zDwHWDHeld?=
 =?us-ascii?Q?wtbF1wNV8cOnYh+8valDT7MLxrQrBdqrkkoCIzlRkzHqK06pNBlUFJ0HeJdo?=
 =?us-ascii?Q?cmfSj2ELP/mpgISiC72Xf6ka5ER63qtvyPy0nFUO0mHiDFOHKcYJMANhkUAX?=
 =?us-ascii?Q?RwskESQvzAA8BdEJdwely/GmdVOGmDkL+ozEc5QPyYlWwhRI/QuV6BaJuKW4?=
 =?us-ascii?Q?U8+OBjPZxGwxCwxbQbS7bm07HBJk/j2Vog4tg7ilnnwiK3scUGixGx71/9nU?=
 =?us-ascii?Q?8Vb8vmbm9+ZzWsWVwFVH/OYlEhtEPPQrbBKhQor4WUas8zPoHt0b2Y4prdGk?=
 =?us-ascii?Q?yBreZTlWwgzetUPIObHXad8DnBNl5zJkwj5YTX12Zoizb4TaLQuxeqdfwcyG?=
 =?us-ascii?Q?CmvDHTyEDXqYPXvDTMhvZPPKCaf0R4U5T8psvKKNUBrJuAG4Z6S8wj6Rjev2?=
 =?us-ascii?Q?/Spb+Si6V6MIlfqJPDhKW03Y9Uq7KaEgZGVLHCUsV4j/YDXevmPmC3yvr3IY?=
 =?us-ascii?Q?gziOygCXe5D8IPXecNYC0nnQ1v2Bgszhk/60UsyfY1BcUejkCadauPMS5IfW?=
 =?us-ascii?Q?VdepSFY032p1WhoTMy+o/+eJN4ZP1MCLVnkPpXT5bkExQw/1l67rrhBNHkaO?=
 =?us-ascii?Q?PUqRuHeKqDCUFhl1t3C8tC0Ycgkw+B6vuweXUBgEd813kPojtLlxooE9uIRN?=
 =?us-ascii?Q?rofaZSLf2s4qVRVgunIKFAjMi8W+VbMd6fwK9P6chS2qse0/Gk/worSs8ENd?=
 =?us-ascii?Q?VIB0LvI+F6n67zKUvY0aNtjJhZD6/3d+tfnnUXRo8SVJcFCH79DNrzQz8VYb?=
 =?us-ascii?Q?z9lgViSAAm928Nnz4r1BYmodN+jdT8h268hN51pI2bgPPSuCG4XaVh7zUInz?=
 =?us-ascii?Q?CeGEGB5+i3sCwp+vIu4Gp/I7D6A+ID/xcJ4NuZnaGg1Whr1sqlVuM9RCofiS?=
 =?us-ascii?Q?M5NdjmQN9j0ASunIfSiuod5GSbcURjmZRcJ76eFAoN72WNnCGBlT/NmSIHO6?=
 =?us-ascii?Q?pT+xq7UhubEAW0/jpxpSRvrf0ev/rd1RFA4iTLDr5lCa52RpJHbdZREWijUU?=
 =?us-ascii?Q?GqIU3+zNSODQdlPqAsmA6sUcCTRKAqXdquj0z5f/HM0MgHmuJcW5e7301QbS?=
 =?us-ascii?Q?UAveSQiVhLuOp9yvW5uktDW9OEknf6wyhg5tyMB+3RkVmMutzNP1MFhICl5d?=
 =?us-ascii?Q?4mF02SduvhXWYnvgMf6aH/WDSrzXxjJahewWwT9GU+krnUISP71+zv5TXPhZ?=
 =?us-ascii?Q?iuqr1b4lTJPpEUXPuT3dbg7NPxrq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jleCR2R31KZ/vnqSecGrLvHIf+hI0c3Hi/+I39LDBPiuzCJpNjbXjhxSKmaO?=
 =?us-ascii?Q?8DL1g1QJrzEJnmtFgZhX1nvboMGcWxiJgdQk/SpsCO17kxZ29jPdmmFivmng?=
 =?us-ascii?Q?vXYO8ywTm4bXMYFMK7rOhPC4S4ghECQpuGvvmUcRGOiEmP+Tnnv2TgbaJpae?=
 =?us-ascii?Q?3Rkf/yAAP6XGG5Ay6psOs/37+QWIExkQAzNvYJ62n6QQXrz4PFIryMfni7Vz?=
 =?us-ascii?Q?zsC+SKY24IMKf3TgmgeyQsdANJBQUW9V1Q2mHzQp1mxPuT/yEsbLledNeb6C?=
 =?us-ascii?Q?UdYEdilPzA8VY6EWhBtWR4E6O3leptXiwIVXJoyqIpT2kC5R5nqFBBdZcpBl?=
 =?us-ascii?Q?IoXGlCraQeFl6MZY2LJjxV196kEQk+ZNJ4hJudcfdPj5voYNCgN1DcKfyG+S?=
 =?us-ascii?Q?AQIFZq3k9SMZW7ehjP7cpy59qAI6Srk+nnwMX95C7KpVwtpSNoBvFbqqVDu2?=
 =?us-ascii?Q?AQwn8A9d8zPSWBX4GVNxvt9YMuOLXlzQIdJwjbOa+7YhYM5OLuw23dy/Pjvd?=
 =?us-ascii?Q?vdjre9ol7CQQU8VsoQhlhqgK9/+cgyDiABFofofkAcMrf/URSrciiXEhAD8R?=
 =?us-ascii?Q?KSOiNey8EWJbM6DPb93nPQaE7YCgeT8t47bkbskyBK2N2DcS1/5xZEQipbUN?=
 =?us-ascii?Q?WlroorM9ryzp01qHjatjC5AFXfxg/sJdZ7T4nPA+Bb5BTxoF/2AbLoUURHZO?=
 =?us-ascii?Q?bNYNgiyo1RvRQ93pv0Y4RIwFzUTkTpZKq5rrejpT6lHiBWFBAzvZjZybr+we?=
 =?us-ascii?Q?hYQgzw7SZmzwHwKCJGyL81yAUvl0hBE+X9/kTGCn3Nfo1xw9SfxkLmbR58LW?=
 =?us-ascii?Q?b9TuU6p9k3jWl9M2DVv6eV7XulmVtV6NeKcpJ3fn5dq/xSANOWAGYiW536iS?=
 =?us-ascii?Q?pWj1F5HxPAw1bL7M97JG8O8Wdx1J30lCBxLtQtw/4142ZLAQGhB/eUe1fzvk?=
 =?us-ascii?Q?ft0kR6N+U84K39qkVkTJHvMv2p5+rDCbJ5CaDfo6y7BBch2B9lrFWWM894bf?=
 =?us-ascii?Q?HkAoIDv5pp9ADLGZF7c8QW4DI42nDD/XhcuZcT/jCCuA5ezlUlylmmNe7rK0?=
 =?us-ascii?Q?9U72TMfej5PWfxQLgVcU4m6HDMYwXdh9dRJRt2y+Lw+a1ByxYx5TpP9CfVQH?=
 =?us-ascii?Q?fVGWwi36tK1nBCyF8+z4U91OfkSPVQjYyFyn+XZHWlLiKImBQaIjlLBjCR6T?=
 =?us-ascii?Q?Tijk6SPDgbWjKg5Jaz7dvICIC3AXeXhHTrIdeeR1SNVwKPd9gOv0PooZdVnx?=
 =?us-ascii?Q?DLv/UD9/iFpp0X4LdK6b38mYYsK9vrFeoqWMxSy+W3M3C1y4UcRj4vyETdeb?=
 =?us-ascii?Q?1GSKC254dKY2KBlbcoK136qznr5EETpv2/PPqPnVJYp9BaO3nFW59tVGGO2U?=
 =?us-ascii?Q?WhK8EYWcm0dVXumLQdk2joFUp9qF5Fg0eJOLKR++m7ENoB+FgIlMKJiuGvj5?=
 =?us-ascii?Q?fcLHMwucCeoFySaHkaT3iJD7pQaOHSrAT/cULdypZq7VG/GTvhRVMZkDOTAj?=
 =?us-ascii?Q?oR3uP2mQAdKbukg9McD8oJx2AxgIL+i7Jl2MOq4SbAX9/sXnOVYn1IkQb8m7?=
 =?us-ascii?Q?36JXy9B/LG64QzKaHLR4np+/sQ+TX858T9Fg0L8j0kFUKfV/Lm35EiZA4tY1?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a6f0e49-f973-46f3-0599-08dd55f13374
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 23:07:39.6955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ganQ4rgPr8bfhjxCFAsrPfqYoZ1sqpSdT10vAjJCpRMmh0BfchiWaJL15znpq+9il259XQE7IWIDuBqtGYAGruiJ3Grlhi1ikA4F1x9Nisg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7461
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

On Tue, Feb 25, 2025 at 04:09:00PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 25.02.2025 04:10, Matt Roper wrote:
> > On Tue, Feb 25, 2025 at 12:41:09AM +0100, Michal Wajdeczko wrote:
> >>
> >>
> >> On 24.02.2025 23:55, Matt Roper wrote:
> >>> On Mon, Feb 24, 2025 at 04:06:59PM +0100, Michal Wajdeczko wrote:
> >>>> Add more test cases that verifies use of RTP SRIOV() rules in
> >>>> driver running as native, PF and VF mode.
> >>>>
> >>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >>>> ---
> >>>>  drivers/gpu/drm/xe/tests/xe_rtp_test.c | 112 ++++++++++++++++++++++++-
> >>>>  1 file changed, 111 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> >>>> index 36a3b5420fef..b21474df933e 100644
> >>>> --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> >>>> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> >>>> @@ -45,6 +45,8 @@ struct rtp_to_sr_test_case {
> >>>>  struct rtp_test_case {
> >>>>  	const char *name;
> >>>>  	unsigned long expected_active;
> >>>> +	unsigned long expected_active_pf;
> >>>> +	unsigned long expected_active_vf;
> >>>>  	const struct xe_rtp_entry *entries;
> >>>>  };
> >>>>  
> >>>> @@ -469,6 +471,89 @@ static const struct rtp_test_case rtp_cases[] = {
> >>>>  	},
> >>>>  };
> >>>>  
> >>>> +static const struct rtp_test_case sriov_cases[] = {
> >>>> +	{
> >>>> +		.name = "non_vf",
> >>>> +		.expected_active = BIT(0) | BIT(1),
> >>>> +		.expected_active_pf = BIT(0) | BIT(1),
> >>>> +		.expected_active_vf = 0,
> >>>> +		.entries = (const struct xe_rtp_entry[]) {
> >>>> +			{ XE_RTP_NAME("and"),
> >>>> +			  XE_RTP_RULES(FUNC(match_yes)),
> >>>> +			},
> >>>> +			{ XE_RTP_NAME("or"),
> >>>> +			  XE_RTP_RULES(FUNC(match_no), OR,
> >>>> +				       FUNC(match_yes)),
> >>>> +			},
> >>>> +			{}
> >>>> +		},
> >>>> +	},
> >>>> +	{
> >>>> +		.name = "vf_ready",
> >>>> +		.expected_active = BIT(0) | BIT(1),
> >>>> +		.expected_active_pf = BIT(0) | BIT(1),
> >>>> +		.expected_active_vf = BIT(0) | BIT(1),
> >>>> +		.entries = (const struct xe_rtp_entry[]) {
> >>>> +			{ XE_RTP_NAME("and"),
> >>>> +			  XE_RTP_RULES(FUNC(match_yes), SRIOV(VF_READY)),
> >>>> +			},
> >>>> +			{ XE_RTP_NAME("or"),
> >>>> +			  XE_RTP_RULES(FUNC(match_no), OR,
> >>>> +				       FUNC(match_yes), SRIOV(VF_READY)),
> >>>> +			},
> >>>> +			{}
> >>>> +		},
> >>>> +	},
> >>>> +	{
> >>>> +		.name = "vf_only",
> >>>> +		.expected_active = 0,
> >>>> +		.expected_active_pf = 0,
> >>>> +		.expected_active_vf = BIT(0) | BIT(1),
> >>>> +		.entries = (const struct xe_rtp_entry[]) {
> >>>> +			{ XE_RTP_NAME("and"),
> >>>> +			  XE_RTP_RULES(FUNC(match_yes), SRIOV(VF_ONLY)),
> >>>> +			},
> >>>> +			{ XE_RTP_NAME("or"),
> >>>> +			  XE_RTP_RULES(FUNC(match_no), OR,
> >>>> +				       FUNC(match_yes), SRIOV(VF_ONLY)),
> >>>> +			},
> >>>> +			{}
> >>>> +		},
> >>>> +	},
> >>>> +	{
> >>>> +		.name = "pf_only",
> >>>> +		.expected_active = 0,
> >>>> +		.expected_active_pf = BIT(0) | BIT(1),
> >>>> +		.expected_active_vf = 0,
> >>>> +		.entries = (const struct xe_rtp_entry[]) {
> >>>> +			{ XE_RTP_NAME("and"),
> >>>> +			  XE_RTP_RULES(FUNC(match_yes), SRIOV(PF_ONLY)),
> >>>> +			},
> >>>> +			{ XE_RTP_NAME("or"),
> >>>> +			  XE_RTP_RULES(FUNC(match_no), OR,
> >>>> +				       FUNC(match_yes), SRIOV(PF_ONLY)),
> >>>> +			},
> >>>> +			{}
> >>>> +		},
> >>>> +	},
> >>>> +	{
> >>>> +		.name = "sriov_only",
> >>>> +		.expected_active = 0,
> >>>> +		.expected_active_pf = BIT(0) | BIT(1),
> >>>> +		.expected_active_vf = BIT(0) | BIT(1),
> >>>> +		.entries = (const struct xe_rtp_entry[]) {
> >>>> +			{ XE_RTP_NAME("and"),
> >>>> +			  XE_RTP_RULES(FUNC(match_yes), SRIOV(ONLY)),
> >>>> +			},
> >>>> +			{ XE_RTP_NAME("or"),
> >>>> +			  XE_RTP_RULES(FUNC(match_no), OR,
> >>>> +				       FUNC(match_yes), SRIOV(ONLY)),
> >>>> +			},
> >>>> +			{}
> >>>> +		},
> >>>> +	},
> >>>> +};
> >>>> +
> >>>>  static void xe_rtp_process_tests(struct kunit *test)
> >>>>  {
> >>>>  	const struct rtp_test_case *param = test->param_value;
> >>>> @@ -483,7 +568,28 @@ static void xe_rtp_process_tests(struct kunit *test)
> >>>>  	xe_rtp_process_ctx_enable_active_tracking(&ctx, &active, count_rtp_entries);
> >>>>  	xe_rtp_process(&ctx, param->entries);
> >>>>  
> >>>> -	KUNIT_EXPECT_EQ(test, active, param->expected_active);
> >>>> +	if (IS_SRIOV_PF(xe))
> >>>
> >>> The xe here is a mock device (from drm_kunit_helper_alloc_device).
> >>> Won't these SRIOV tests require something extra in
> >>> xe_pci_fake_device_init() to ever be SRIOV-enabled?  Or am I overlooking
> >>> something?
> >>
> >> yes ;)
> >>
> >> see xe_rtp_process_tests_{pf,vf} below, where we convert mock xe to be
> >> PF or VF by explicitly altering xe->sriov.__mode
> > 
> > Oops, yeah.  Somehow I completely overlooked that part.
> > 
> > I'm not sure if we'll ever need to add more entries to xe_rtp_tests[],
> > but should we switch the mode back to native at the end of those
> > functions to prevent any subsequent tests from inheriting unexpected VF
> > behavior?
> 
> no
> 
> every test case in the rtp test suite is getting its own freshly
> allocated xe instance, see:
> 
> xe_rtp_test_init(test)
> {
> ...
>   xe = xe_kunit_helper_alloc_xe_device(test, dev)
> ...
>   test->priv = xe
> }

Okay, yeah.  I'm not super familiar with the kunit framework so I didn't
realize the init gets performed for each test.  Anyway, everything looks
good to me.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

> 
> > 
> > 
> > Matt
> > 
> >>
> >>>
> >>>
> >>> Matt
> >>>
> >>>
> >>>> +		KUNIT_EXPECT_EQ(test, active, param->expected_active_pf);
> >>>> +	else if (IS_SRIOV_VF(xe))
> >>>> +		KUNIT_EXPECT_EQ(test, active, param->expected_active_vf);
> >>>> +	else
> >>>> +		KUNIT_EXPECT_EQ(test, active, param->expected_active);
> >>>> +}
> >>>> +
> >>>> +static void xe_rtp_process_tests_pf(struct kunit *test)
> >>>> +{
> >>>> +	struct xe_device *xe = test->priv;
> >>>> +
> >>>> +	xe->sriov.__mode = XE_SRIOV_MODE_PF;
> >>>> +	xe_rtp_process_tests(test);
> >>>> +}
> >>>> +
> >>>> +static void xe_rtp_process_tests_vf(struct kunit *test)
> >>>> +{
> >>>> +	struct xe_device *xe = test->priv;
> >>>> +
> >>>> +	xe->sriov.__mode = XE_SRIOV_MODE_VF;
> >>>> +	xe_rtp_process_tests(test);
> >>>>  }
> >>>>  
> >>>>  static void rtp_to_sr_desc(const struct rtp_to_sr_test_case *t, char *desc)
> >>>> @@ -499,6 +605,7 @@ static void rtp_desc(const struct rtp_test_case *t, char *desc)
> >>>>  }
> >>>>  
> >>>>  KUNIT_ARRAY_PARAM(rtp, rtp_cases, rtp_desc);
> >>>> +KUNIT_ARRAY_PARAM(sriov, sriov_cases, rtp_desc);
> >>>>  
> >>>>  static int xe_rtp_test_init(struct kunit *test)
> >>>>  {
> >>>> @@ -533,6 +640,9 @@ static void xe_rtp_test_exit(struct kunit *test)
> >>>>  static struct kunit_case xe_rtp_tests[] = {
> >>>>  	KUNIT_CASE_PARAM(xe_rtp_process_to_sr_tests, rtp_to_sr_gen_params),
> >>>>  	KUNIT_CASE_PARAM(xe_rtp_process_tests, rtp_gen_params),
> >>>> +	KUNIT_CASE_PARAM(xe_rtp_process_tests, sriov_gen_params),
> >>>> +	KUNIT_CASE_PARAM(xe_rtp_process_tests_pf, sriov_gen_params),
> >>>> +	KUNIT_CASE_PARAM(xe_rtp_process_tests_vf, sriov_gen_params),
> >>>>  	{}
> >>>>  };
> >>>>  
> >>>> -- 
> >>>> 2.47.1
> >>>>
> >>>
> >>
> > 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
