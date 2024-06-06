Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B866C27C54
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 17:35:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F3AD10E02D;
	Thu,  6 Jun 2024 17:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hlgKZSO7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A263810E02D
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 17:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717695350; x=1749231350;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EGWd8ZdWVZME0GXpPjjPyosbVJOLzLrVyBjnr8Knhlc=;
 b=hlgKZSO7De6tQYb1sy4qbq44FDn5oX+0WcEIQkv2mCtYXACL8J5wWAy/
 6RASfx9f/WG9fBFI0LjYHNSTP+xPUNFjLyiwN35zDZEPIajAH61tvHXRr
 U0ciARtKfyKYpu1018y451fV1udXrG5vPzElmEg2QED+jxJGlLBr55jC6
 alBYP8z0ThV/+TWIGEMl5iHiVSIGBrsfHaVMiss1t2VnVUg77Uu+dOKHK
 WYcAK6rfayqs3nKvu8SxKv3130vJO6w5jtH0Lg6/otdbjGFBQFgz7/PsP
 V95BftOA1McfP9TTxwESdJQVJrFI23PAJudIq/sDSZd5K4QGPjv+MQdvv Q==;
X-CSE-ConnectionGUID: LP3/SbdZS7KRoAk56PCAoQ==
X-CSE-MsgGUID: xn9I9ZcORvGjIy5zdHS2sw==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14125005"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="14125005"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 10:35:49 -0700
X-CSE-ConnectionGUID: oV0sFzX2TUuuUZS/GP74zg==
X-CSE-MsgGUID: sTce+XSyTZ6Dxxg5qxLnQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="42978656"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jun 2024 10:35:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 10:35:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 6 Jun 2024 10:35:48 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 10:35:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nEEXuE237j6Pqj5Jv0RmuRlWxCVbCQ5ojFnM5hdeGM9ui62TbQYn3pltmtz/BJGIL6N4txD90CFny5ND6xVLmWEY9FR6nAqdx02mH0k1V8LToz4VOkNxwWXrU7pGwcpjC+n7KitnU5365mntM0viY7oYdGYbgm0W8/35Nw0bK5EgFYRzVz5C9Szca6dBamTOJE5BL6KVb28RFvcj4UKRub8BmB9u3v1LmvVs/2S9LxSsgmKPbvCZ29UJwFhFb6UrpxXvu5JJoWGubtCWsKOEzgbw/6/2OrC227ScWxRPQCMZgzr2j94RRbHxWsKm0UbeA740IZiy3dtYrtRic7/RKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MwUxFEWCN5GlkHTHh/qyM+DqjxcHjPpG9gEk/7FYyEw=;
 b=B05JHLIUf/zFaYV/rCvdnOtjuEljCvs7ifBl/GhXxRKOOuZUQ++gX3l+CM849lHFuh4zftAgkCRo3myT7HljDrAfzD0vVNseTsYPkGD+eIxNYTqKPXoJrOBPrUMudCGhkhBqzH1zBjz2OnW51D6FuwOCrrhJsKflITVMFfiAzIelrueiTaHwTs0rbmuDF0ICZDg8gh/UJky87mNVPkb0AL4zHpI6DFK/xkiy+uoU/vlmibIfkpcZO5yNLfV3h3KG2TvbGjiN5uvQxUlV4UddEe7SA1ZTtwovzlQEaOLhi2+aFOjwlhFZFVVPF7jeh9/58+02HlJDX8JyL8MmLuDQqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6746.namprd11.prod.outlook.com (2603:10b6:510:1b4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 17:35:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7633.021; Thu, 6 Jun 2024
 17:35:45 +0000
Date: Thu, 6 Jun 2024 12:35:42 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Gupta, saurabhg"
 <saurabhg.gupta@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>,
 "Harrison, John C" <john.c.harrison@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe/xe_gt_debugfs: Add synchronous gt reset debugfs
Message-ID: <b5huvz4dqw52xaj64uf4sgxumbn7avp3nm3tfe5rhwtxhf44xc@kq4abeay2rnc>
References: <20240605150828.2736396-1-jonathan.cavitt@intel.com>
 <ZmDiLcMGBdCcz2Rx@intel.com>
 <CH0PR11MB54444909E70839CD751A14E6E5FA2@CH0PR11MB5444.namprd11.prod.outlook.com>
 <ZmHjAAFZ0i9Xg2-S@intel.com>
 <CH0PR11MB54446ACC83247A5E623A89EDE5FA2@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <CH0PR11MB54446ACC83247A5E623A89EDE5FA2@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR03CA0060.namprd03.prod.outlook.com
 (2603:10b6:303:8e::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6746:EE_
X-MS-Office365-Filtering-Correlation-Id: bdb843b3-f5f5-489a-384a-08dc864f18b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4ss1i9ozrVPhACasNDMFxKf69en3HEntnLgsnWaXEAdDmgDo44h4r+AebQpV?=
 =?us-ascii?Q?gbJv+60ymPK6iWDjpG1eEqhfIzJWd33+aPqIwoWuB4hrGqtU2h2h6zQvYH/C?=
 =?us-ascii?Q?C/jAbzXZPtUqD4joA2AwsD3qjuPKJgyZ/LlQ/Cz9gkiXORyzlimUZH9FBL0y?=
 =?us-ascii?Q?QjJwh/BMZqQ7kLASTzYeYej5ApbdbhMQoBnObaj4Vnv0MAxxZiDDQLm0klFJ?=
 =?us-ascii?Q?dK5brLajSpm5Y08sC5d23W0XO4S8yAC0avg53JXUlc/nNgliP/8s5c8pixAd?=
 =?us-ascii?Q?9v0WYHB9E2xWZzZDDjgDswh5R2ldG9QmC2NyaAwA/PcskysYkNxdFP74NXbr?=
 =?us-ascii?Q?WM2jYCjWJis9dnTuK4wwEOPoShw4N1wLSGwr/3qI1H/E/0gST0YZwWdpYrOM?=
 =?us-ascii?Q?J5SHCsPxgkVHiA2YUJovzC5Q4+uJ9gGjlyyLOfldLeFCaEP+lISFKZWvy0Sx?=
 =?us-ascii?Q?F+xD8lrtOxuhGjHCpIb1TCNuFHGu1TKPECsyjrRfduRhes5PRdhRkACF8gjv?=
 =?us-ascii?Q?JCPYlZAkltxEGuCVX9ARCzTP6sDbej2+XagDxGF0wsRPxcRD6xjX8jsBjW0l?=
 =?us-ascii?Q?FbErlIshJiXgzlW2pezHGgmhjAtptMNJBsXjeDDNkfAIyRJVvVrRJYhjMaNo?=
 =?us-ascii?Q?CFogqms9wKP/rvmqmOlW06lyWM7UJ0c1ZskACOponcEeUqSDCjmBSgmzxKDX?=
 =?us-ascii?Q?IU7+pA5OVHMqixQ5wybf+LtM4fFGFkXEj7/I68KFPGrmQCE45mVJ+PKL1LIi?=
 =?us-ascii?Q?JLd0vm6inw4tCnXGKy5HYSGkLa37pKEp2ywI+jqP7f3JbIDzTAj8iLh8bv6+?=
 =?us-ascii?Q?RjJlkBut8FD/heEuRbD/bSEF71HS6paVwBGj4439R+gO/jrUqoWIrQ+zBljo?=
 =?us-ascii?Q?RH6EZUNXjrXHBG7Oqq54hCp1IDwVqujjSs5nF1jufjNOBFPDK+OzdtMsjksm?=
 =?us-ascii?Q?8k3URzbso0j1Zf+5RJl5iTwY71tq+o0aGsEhg6aZD6H42x9AEmdbV2TQfSfD?=
 =?us-ascii?Q?m6nsQp8pwT56qdQglDAfydvhY5jzWkIMlYh85d5nC8fENgVDCoHKreG9omwG?=
 =?us-ascii?Q?dlQnDeaNJJ/1a7aDqwaov/yhL6GcZf+aoLlvg/dBq+NDPuMGWdTQH3qgG9bw?=
 =?us-ascii?Q?pGBQ1NbRBqI49qTz1q9F77MSgPsXjMrZFpkmcCOcEOmt+yUNP5avWZIbkLcY?=
 =?us-ascii?Q?4XvhLGO7r9PxG9zOsGBEjGrqdtOXBCgR9KIWaTFvL3DUGJ/3hiquIn7JO6as?=
 =?us-ascii?Q?UdGOWr1KqIHruLSlOLI+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yp38wXR84KPDs2q/Tlez2EtV0haSrrLbxKHkV9g0/IFrJK4YRDIuHgGNeuvu?=
 =?us-ascii?Q?gU9kw7bF51+vKRvSuE9gf11ZYOMPFcJChndtvswdYZmaVeQTKxiWAfU+UkWn?=
 =?us-ascii?Q?LJva1W6njX2UTwOJbwTaK0DSihSzeKo2y0VibfOI4Oi5BipuL5vMuvSMXBzz?=
 =?us-ascii?Q?3apWhtsTU2aVBqDQe7p7rQcSYz6mGzSqyeDAAVyW5RGplXzwQy9QNBfH299m?=
 =?us-ascii?Q?y2fccSJRlb45xsSbJo7M4T+iq9JwlD9gsrB0XymP8WqAPO7MK89MiZAGMcBb?=
 =?us-ascii?Q?l+Waa4dZz5qXFqyDhUoIzydKt1p8+sr4xxt/fp6H6W1DnqyOzQm3u7q9Dbn7?=
 =?us-ascii?Q?ODvqxwcdDd4059rnaldS1JuySgHEc+bXF/oWd89EVzOErsrk0f5wXjSmEA+z?=
 =?us-ascii?Q?2VsNc9vZJnIwEz/Wa138DD3f4VgT/LtkSPPFpMBHwnGju3rAUeAmi4KSDb5t?=
 =?us-ascii?Q?RJi1mmeSlzxpS5SlADhZqpmTOVJ516aYDvV8iUpfrGsHDPwYH4YQq0LksZjt?=
 =?us-ascii?Q?+/PlZL0C5Tf4syvePC7CMBlheS1KhwPFeUsSSnvFGRRVeHnl5h7DiotB5WvJ?=
 =?us-ascii?Q?MOqEgTVfR00+6T7P2Zoj3/xwT47y7jXWd23ncZvQGXNewB7EfWmKnut8SKxv?=
 =?us-ascii?Q?2+07JRfpWPzmL2K9IvBGrsbCaFKaCqUKyaCT3ozblBSDKEHHRK3IVhkC0zXg?=
 =?us-ascii?Q?1cFejht0ZqgvdbTM/z6b23tSRkHoaJ0EBjVpsaG1PkrXiOhZhCxXPzGX7oIf?=
 =?us-ascii?Q?/BHGVWtd9uVU3wd/2lpWkQGQ0mAjEU139hSo9OY/gn1QdfRNvKPfkf38DIhI?=
 =?us-ascii?Q?8tT+L9sHOCg273cLRjTsTNweegIi33gdVYldNdlmuvMCUWKGOaDBuYvnZCvd?=
 =?us-ascii?Q?2/oUiR3bAaa1uxv6gcqbG45xnB0zgvkeuCZN0iBWVDUlDZzG9LeyF52O4VDl?=
 =?us-ascii?Q?OvAN9MVVqJ5StphPT2YZUX3z2HNBUyAURhTr4ezlCjZolqgAzY3BG5VIC983?=
 =?us-ascii?Q?mjshoZAAbUj5PWPZh/6vVSgxOal+kBsNec/67nnPU9+hXpAENWkAHWDio1gf?=
 =?us-ascii?Q?za4oP1SJR1Qz52u7qIZqFFNHP8uTqHUcMBR6HbeClJ1CqdI/I72LpGcHRDfj?=
 =?us-ascii?Q?acSZINbZ/S2PGyPMhGNDyws+Lc0dFwAfYGaqC7RPDL3sWggSzACuh6d7LSBE?=
 =?us-ascii?Q?NxV+4dJ9LytVefcK6w4XAnOOcBOuZUPgdkyv9QoQQ9T2zB3uveMloGCgpKUq?=
 =?us-ascii?Q?p1f7bebT2Pq7ChPUXJAUs3DGIxwyGdmMv+MB1Mtvu4iH5vNl/YcRQwr2uf7d?=
 =?us-ascii?Q?8XnKlrUwoxv6iT3GsVnhRgomvGsdF4uIQM233sUe0ZzCyRLjUw4qCQ8jNgtI?=
 =?us-ascii?Q?w6oiOPeBW+N3dqtXo/HiZURDCeqMdol3xy/C8Ui/Q8+uFOTCCWTfHNF1/yL4?=
 =?us-ascii?Q?SmZUQrcYcOfV58HtzspsRj8UnHo9VoY1SYBvnV7eR/WT+wpDDC1o9JVNSxU9?=
 =?us-ascii?Q?oUtCVEhdOn+ntk+VSelFGShCuHAC02PcHJlYkQ2zyYN5uzEGUEbOH0rBQ6qq?=
 =?us-ascii?Q?PsB7IpbL9B76/4J5iSduF4nL5LWf4gjD0hqWPuGuS5ilGMNTMvsqldzWMXhg?=
 =?us-ascii?Q?gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bdb843b3-f5f5-489a-384a-08dc864f18b3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 17:35:45.6651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /STNqZUD+f7bpxeFo/LUSWWyeX/Kj3V9n06qZoIa3SG56ocxgXYaROUXjDVsu4XGGaBP82DeQ9A+hLoUOWxfgpmHzdIcZ5t8b72xvKr070Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6746
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

On Thu, Jun 06, 2024 at 04:38:49PM GMT, Cavitt, Jonathan wrote:
>-----Original Message-----
>From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>Sent: Thursday, June 6, 2024 9:26 AM
>To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
>Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.com>; Brost, Matthew <matthew.brost@intel.com>; Harrison, John C <john.c.harrison@intel.com>; Summers, Stuart <stuart.summers@intel.com>
>Subject: Re: [PATCH] drm/xe/xe_gt_debugfs: Add synchronous gt reset debugfs
>>
>> On Thu, Jun 06, 2024 at 02:11:02PM +0000, Cavitt, Jonathan wrote:
>> > -----Original Message-----
>> > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>> > Sent: Wednesday, June 5, 2024 3:10 PM
>> > To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
>> > Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.com>; Brost, Matthew <matthew.brost@intel.com>; Harrison, John C <john.c.harrison@intel.com>; Summers, Stuart <stuart.summers@intel.com>
>> > Subject: Re: [PATCH] drm/xe/xe_gt_debugfs: Add synchronous gt reset debugfs
>> > >
>> > > On Wed, Jun 05, 2024 at 08:08:28AM -0700, Jonathan Cavitt wrote:
>> > > > We currently have debugfs support that allows the userspace to initiate
>> > > > an asynchronous gt reset on command.  However, userspace may also wish
>> > > > to wait for the completion of the gt reset before performing any
>> > > > additional work.  To that end, add a version of the force_reset gt
>> > > > debugfs function that operates synchronously.
>> > > >
>> > > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1068
>> > >
>> > > do we already have the igt changes that really closes this?
>> >
>> > The IGT change that closes this issue has not yet landed.  It relies on
>> > using the new debugfs, so if it landed first, we'd be attempting to call
>> > a nonexistent debugfs function.
>>
>> Please provide the IGT and the kernel patch at the same time.
>> you can copy patchwork or lore links in the one or the other cover letter
>> to explain and justify each other.
>
>Here's the related IGT change:
>https://patchwork.freedesktop.org/series/134509/

great. Let's remove the Closes from this patch then.
We can do that while applying, but...

>> > > > @@ -116,6 +116,17 @@ static int force_reset(struct xe_gt *gt, struct drm_printer *p)
>> > > >  	return 0;
>> > > >  }
>> > > >
>> > > > +static int force_reset_sync(struct xe_gt *gt, struct drm_printer *p)
>> > > > +{
>> > > > +	xe_pm_runtime_get(gt_to_xe(gt));
>> > > > +	xe_gt_reset_async(gt);
>> > > > +	xe_pm_runtime_put(gt_to_xe(gt));
>> > > > +

why aren't we just calling force_reset(gt, p); here?

Lucas De Marchi

>> > > > +	flush_work(&gt->reset.worker);
>> > > > +
>> > > > +	return 0;
>> > > > +}
>> > > > +
>> > > >  static int sa_info(struct xe_gt *gt, struct drm_printer *p)
>> > > >  {
>> > > >  	struct xe_tile *tile = gt_to_tile(gt);
>> > > > @@ -261,6 +272,7 @@ static int vecs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
>> > > >  static const struct drm_info_list debugfs_list[] = {
>> > > >  	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
>> > > >  	{"force_reset", .show = xe_gt_debugfs_simple_show, .data = force_reset},
>> > > > +	{"force_reset_sync", .show = xe_gt_debugfs_simple_show, .data = force_reset_sync},
>> > > >  	{"sa_info", .show = xe_gt_debugfs_simple_show, .data = sa_info},
>> > > >  	{"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
>> > > >  	{"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
>> > > > --
>> > > > 2.25.1
>> > > >
>> > >
>>
