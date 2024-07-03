Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8EE0C2BD09
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jul 2024 20:22:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A45F10E324;
	Wed,  3 Jul 2024 20:22:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oC8k2hXi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1AA110E324
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jul 2024 20:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720038133; x=1751574133;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=a2gcNQfzHJtbkF98kMsf3D4rCKsALS4+mMhYMq1MG60=;
 b=oC8k2hXiy1C2S9twZswrH443INig9/bTgFp2IGiHJFcZcdclqZbAMsLZ
 CnJDw2IXFflpSQNUjXOsdFFcWuiz6Ap2l8VE9bou2/u9sI5/BF0DTN/OK
 5BzGFqv8UqaJnA1OVZ8Hd4pX1KCJdD6bTUcvpI/DIsJJDMLeoXHSxV49y
 3hXO3d8crNXEsDHc7ObFHzUijkKp1dyisb2dS+Wz7pq+FBZfBxqUWdxXr
 bi+gEsE0APBtmVhO0wi6Qsaouk7uJuRzqpDXoZZ8R2xk//eykjK26QQ4P
 WAv8kG5HvZxZ109NLjC/t2nI0KkvEp2USG3S0BZ9oKZ2M4azrAjSpXuOy Q==;
X-CSE-ConnectionGUID: U9DoEwDZSHy/iyINoH1wAg==
X-CSE-MsgGUID: 5AqhoAhwSma/JhtUUkgqTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="28434760"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="28434760"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 13:22:13 -0700
X-CSE-ConnectionGUID: k3+tSoyTSiquPJ8AV6mwFg==
X-CSE-MsgGUID: tENUKTCJQdWqIjgMuYyWIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="51224353"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jul 2024 13:22:12 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 3 Jul 2024 13:22:12 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 3 Jul 2024 13:22:11 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 3 Jul 2024 13:22:11 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 3 Jul 2024 13:22:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obrB8pEOjQECbBjsVtVeVVbqTn0+awyIZwFUIT69kBzLUZ99ON2gS88lchjOEeSzn/FJWj8u6V/En0o7TbWRCfsVmvA08RXuraEjnAvQC/2QuhYaQLkfxpPn92IEwl73XcZu3fakFCB21+ia370w6OcdxxxxaH1pYGSMZg3/0agnpYvUousTsuxObRAf+RxM4TnIKaBgF/SwPBQBiA8aAKYjwBdNCMfuQunVniUpVH2FTKlrRCPsEU8wlzHOpDCeB+IT4+zSXWqK5FnwrgsXiRDsaW+kW7Mt6dAWHiZjKQKM0DPRhogpVdLGN4yZ+8vYqibngXJLHqflEhHlPWzFig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4DBNZ0fIKxO7DYj/2Mpndnz7uL8rdf/F+nEBgwz799Q=;
 b=WMhqD5ZlS+PEIDaCjCCOKywb8RsboIFlimpiD6FUROt/5Gl/h99svJloRlJOO07UpWvwROzazMdQV6VYNMx6n70xlS/PtCi7LwBzixm92ETPugyzse0OYbEEpu5nSH7jSgnsCkLkngELgHEwPOs6ZYs6GTY6fiWk1DrReSLLIRFeWgTw22xPzCxnJe3eVQth2/22cDM3fMT2sS5y48gAPvF+6T72IawGiRWCRptXvK2iuYKGB1UAL/5LgcMn+MbgJnzkKx2CEHaBqOMVQiEqGMw6aV283DCysHN57aJV52bFpTH3btDcTwwxIGYbyAncDF6+hOEfKWCGZmge2Uwvvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6700.namprd11.prod.outlook.com (2603:10b6:510:1ae::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Wed, 3 Jul
 2024 20:22:07 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7719.029; Wed, 3 Jul 2024
 20:22:07 +0000
Date: Wed, 3 Jul 2024 15:22:04 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <ryszard.knop@intel.com>,
 <ewelina.musial@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: =?utf-8?B?4pyTIENJLkJBVA==?= =?utf-8?Q?=3A?= success for Reapply
 "drm/xe/gsc: define GSC FW for LNL"
Message-ID: <2urugervd3spw4vtlkpxu4z2rwd3axojxponwhpnwutv662ntj@p3mr6qxe7kh4>
References: <20240702001155.2163743-1-daniele.ceraolospurio@intel.com>
 <171988208839.3729.11952250272154489901@2413ebb6fbb6>
 <mxtejwnl6xie7a7py2ntnrbq5s57o5ho4exy3gygwggau4hgt5@lg3ixotyab4j>
 <790e4a09-a383-47fd-8c1d-2b8994c6c0b4@intel.com>
 <ct6pqzwxnhlmgkal5yjbaaukl7kcshlg2ifhjiodxu464o4xth@6lnkhu7lrwck>
 <11752a39-1aa0-4140-bc26-15283f045607@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <11752a39-1aa0-4140-bc26-15283f045607@intel.com>
X-ClientProxiedBy: MW4PR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:303:8f::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6700:EE_
X-MS-Office365-Filtering-Correlation-Id: a7336e46-1593-49ab-eb09-08dc9b9dcfa3
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?CYqrEa3cU/Ak3tkhoLMp6FgDqBtb3AuNWX7gMLbuK7Flkjl9NenKNawplw?=
 =?iso-8859-1?Q?oNVLOIzKnhAqG0xftkjWj2E94pN8HyYpUFXQDy9s2KMNbqoqubl256j+M8?=
 =?iso-8859-1?Q?lp8Rj6y4Y7HHQBRomZ9/AIQqFyu/Vae6xqDZRrfV2okEAQmKs7oO9W/wrL?=
 =?iso-8859-1?Q?s0MAdzcnsBVaZRWQm1RqmHaYSkGwcmWs/GhjBRonlAtpNDBRrt1eGtCMse?=
 =?iso-8859-1?Q?TgKVDpDkcKkaqoiQ3XPRNorNL36Ef70XCJfNWvFuimoofbP0EopO6c+f11?=
 =?iso-8859-1?Q?CmggoTMbfr35QI8jbvVRXWsOohiFN5S11DsyA41ZCYeC36wS7RUiJ+LG8i?=
 =?iso-8859-1?Q?G5BByYqgtqA3nVBiu/Od7W/V66eRGP8GR67UfDgs3Lkzvv/EDDpi7n9HUe?=
 =?iso-8859-1?Q?DViRBOTId273hCD+aGzgop4CyrNA3hv9tsQYuYboKrNPH6G+9nrUowSfJm?=
 =?iso-8859-1?Q?i/XyGtU2KfaeHxfSEHQXcq8B5sMrm3aSf+Ca2IuvuB1+tjsHkQSmqaKBfW?=
 =?iso-8859-1?Q?lVYPf0y9Zl+w2yzu0WGiikBYacvI1tqQ0Tw/Ojv2krSPeQ/zT2f/0bgmD0?=
 =?iso-8859-1?Q?RigNZXzW7YEFx+oh7+sej5umBjZChLsQEyiNg1WSMfzTH9uaY6ztf9od6Y?=
 =?iso-8859-1?Q?NDrrFztvaDqPCH42fW5Fygtqa6yN/fZ6S/gswNFH6IOXtGYtA6wls9qNgV?=
 =?iso-8859-1?Q?V5WeKaBa0xCWblKX5d3K0nUuAZoRIC7ig7MniVSk/YPDYMOeElWj1L4TU2?=
 =?iso-8859-1?Q?x8mmbSwYR0n3a8FKnWbjkYUXQYYvImZJe+MJIgyEAJMq65B2DQnPAnu13d?=
 =?iso-8859-1?Q?fVK1iwDOWAd0G5SLRDWzyNopTOWEc5XYjbaeneMH94PGKrHVMcBc0RJRJR?=
 =?iso-8859-1?Q?sBgP0mo+BmakijPWdKM7+RrwqW3mDJmYtaWzdCk4VayTrIGj0AZq16K/mf?=
 =?iso-8859-1?Q?0y5sH7I2HZCCnvm1W+fA+R9n5RGCKYO3FSoD66kw6F0AyhgLveqgS0bQ/s?=
 =?iso-8859-1?Q?P0/ILjwnyIpA3lImK1ko8TL8tq/buHroRFSXr0OvMrfdNZQWbFlFXDhIIP?=
 =?iso-8859-1?Q?sVdK6za3rdqHQVH8rZoPKmWAnvLsa8uzGi+cjt5jrGxCv9qM8e4+Eq3VmN?=
 =?iso-8859-1?Q?oIF+A9Hogr4EnB7dxfeQd3M/T8qG0tlzUmU7Ded8CEteFX2a1r+FPcNvbq?=
 =?iso-8859-1?Q?xfm4r1QlZjTIommkDbYhvaHMky5uqNYi1G3oefya9E0MV3XcBy4whYtSM0?=
 =?iso-8859-1?Q?gxNqX51OVWUntmRDjv0K1IYmb7O+SvyFffgbKHExTHIodRQKKQzTVY1n4Z?=
 =?iso-8859-1?Q?COlLQxGtxWq4v7h/cMdAd5EknP1Le5l5o07PgJ12/hSI578=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?q9B9rZgH1YXwO5yscT+R9FTjdpX+UM2leOMVZJBjD/EzzKWARrwGEaM3aA?=
 =?iso-8859-1?Q?7vVudui+gNqVMfbpVY1vg8xtLxzBQV4+vfSEfYz0WLKu2g4vWf9vegGLgr?=
 =?iso-8859-1?Q?/N4QQ124nPIRATk1HJHbSrHMGmCYv9Zame9Fi8LF71HW+Ldjl/9+0gIFne?=
 =?iso-8859-1?Q?HiVcGkNRoWprNtzRwNBl/ZGfLD43vke/7tCEJnqBDLs1cFVRpgaykc7qOD?=
 =?iso-8859-1?Q?xBB7yiiEuKHfjrw0wY5Q1RvfaF78cp/a5/UjCyhdgsjD8PpcSU6BLLx+6u?=
 =?iso-8859-1?Q?ddOdZxJ8in0Qzx5HUjRzrhnGdN9QNRUfV/aSZ+a52x/V715oqsDDRLeYjL?=
 =?iso-8859-1?Q?pBj4PLFuDaKwh+7VbnGnZSnYeqBWmlEzhLoiYCX66k+gSI0YBKW4FKt5zX?=
 =?iso-8859-1?Q?kJUQPGTn0A6cspBVLxdZeIZL8+L+bCG0fbI2HAJEnRWrWAQjT91oAnKTrh?=
 =?iso-8859-1?Q?uwr8YudzRdszrBbXYmoqra2dxcUf1s4mkjppRAXO70kuZuqXRbzQrsIfYF?=
 =?iso-8859-1?Q?Tpfy8v9MSj2DBlV5WRMBx6iyE3lcDVG2O5fNZJlQvfEnBXaMC4ZWUB0jxy?=
 =?iso-8859-1?Q?8f0oBN4hdy+4ZXwzkephNv8mRg6R6aVSM45cio3/nSXRuS3uMklBvN7qAT?=
 =?iso-8859-1?Q?NBAKl5oAPPchy/eiJDKA802SlVQ6gPgrhfwukR+q9XaukEaHIwZdO2/ZXa?=
 =?iso-8859-1?Q?4CUA/w2cdJjN5SuA0j01ezUH2uNWJHWyXZnMHZF9HZtbOx23Jj+HpMELlU?=
 =?iso-8859-1?Q?Vm7w4LXYOFXZdrJKEX0U0+5naIM0GX6LwMEQDDu5Gcpx4ULVBTyf/rzJsQ?=
 =?iso-8859-1?Q?RHQlTC5G6SCB9rDWuL58z7SK0p+IU98fPutjkLZm9XOjzM6xWI3Al9Yws7?=
 =?iso-8859-1?Q?lkp1IsYa/oQhQpGLuR55eJ/WE3cyFp5HS9fpDWQacP0G1SjzMpBkqT/WQ2?=
 =?iso-8859-1?Q?1QKU4/JdjCwh/XIwA4xncNaly6wcONs3A/WsnZX65/pP4h0fkWhYPSgY8P?=
 =?iso-8859-1?Q?GrI3CGpVTApvbf7xVC//A3f6yadynp6INsDKn/ECTGeXRLa+ese5888RrH?=
 =?iso-8859-1?Q?LS/NPWBdRtchV/5iGtkh1d1cR9kuwRLy0Yq1fXigGMD8KIhy1597JAKtfG?=
 =?iso-8859-1?Q?HnLhyGjB83FAc7I8K+MkGm3nx+Qn/UHUU2oFGafP5artvCReAZASoMyW0n?=
 =?iso-8859-1?Q?pf5Moco2WSs/LU7Ro0xrkQ+Yt94zIRxZ+WeAilGeTMBBq6uG0MX62c8uY/?=
 =?iso-8859-1?Q?uTdUuXi2N/OflcQ1KRq+AH330lX7Eg0x28I3WTydljHDSANt/6QGpoCJqr?=
 =?iso-8859-1?Q?W6RcItAHC0Zdt9TuH0aQTF8v/6bofZz/TLKu5caDXfPPHWEzgbFLiEYjLe?=
 =?iso-8859-1?Q?0oi79oI+GbNgXfNX8GwS/tpYGA9/V4xTn1qhrEOSabnsV3J8SPUcf97mvd?=
 =?iso-8859-1?Q?nDW5TYlpvwzF4NEMV2h6Z+l3upt7DqmhmEQechUKyr8jA+1NDuvMUwAgwT?=
 =?iso-8859-1?Q?wdAY6zbhefTvMxF8Z8yWrP20h7rD1iH6AH5Ob1U+eU15LLSBouZffGE4j4?=
 =?iso-8859-1?Q?1nu+XadNJG1GYLuzuroWJT6Jd0hCs5qxtQ+6J7kmDFvekyiknJMDooxIG9?=
 =?iso-8859-1?Q?vCI4zFBJXXWUXRiUm1+DSRhv3LcKN5jAdAY89k3KNeV05tOhlDPJ/ylQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7336e46-1593-49ab-eb09-08dc9b9dcfa3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 20:22:07.7185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jnYlx1fX4Fv425GpqWUtqa7jsF138eis6Nv+Frgnbzyvl4tk9N8ox2GWRH8bTyp15j0Q7QVNTc0fUapplzbR5mewD4oBX8hOMeRCmUvjpis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6700
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

On Wed, Jul 03, 2024 at 09:38:54AM GMT, Daniele Ceraolo Spurio wrote:
>
>
>On 7/2/2024 11:02 AM, Lucas De Marchi wrote:
>>On Tue, Jul 02, 2024 at 09:25:31AM GMT, Daniele Ceraolo Spurio wrote:
>>>
>>>
>>>On 7/2/2024 7:29 AM, Lucas De Marchi wrote:
>>>>On Tue, Jul 02, 2024 at 01:01:28AM GMT, Patchwork wrote:
>>>>>== Series Details ==
>>>>>
>>>>>Series: Reapply "drm/xe/gsc: define GSC FW for LNL"
>>>>>URL   : https://patchwork.freedesktop.org/series/135623/
>>>>>State : success
>>>>>
>>>>>== Summary ==
>>>>>
>>>>>CI Bug Log - changes from 
>>>>>xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299_BAT -> 
>>>>>xe-pw-135623v1_BAT
>>>>>====================================================
>>>>>
>>>>>Summary
>>>>>-------
>>>>>
>>>>> **SUCCESS**
>>>>>
>>>>> No regressions found.
>>>>>
>>>>>
>>>>>
>>>>>Participating hosts (5 -> 4)
>>>>>------------------------------
>>>>>
>>>>> Missing    (1): bat-lnl-1
>>>>
>>>>I guess it didn't really work. +Ryszard +Ewelina: Can we promote LNL to
>>>>be considered "a reliable machine from the CI POV" so we don't have
>>>>"CI.BAT: success" when LNL execution is missing?  Or is there any other
>>>>reason why we report success in this case?
>>>
>>>Damn. I can't repro the issue anymore with this WA applied and 
>>>even in CI we weren't seeing it when I sent it for testing before: 
>>>https://patchwork.freedesktop.org/series/134099/ . I did 3 runs in 
>>>that case and none of them hit the problem.
>>>
>>>I've triggered another run to see if we get any better logs.
>>
>>this change should NOT make the machine "go missing" really. Actually no
>>change to xe-only should really make a machine not have any log at
>>all....
>>
>>I believe it was a very unfortunate coincidence and there must be a
>>network issue or the like... but we can't consider success when we don't
>>have a report for LNL. Particularly for this patch since LNL is
>>the only affected platform.
>>
>>"try again"  in patchwork sounds good for now.
>
>It died again, but this time we got some logs. It died during an fbdev 
>test, which makes me think this is due to the display side of the WA 
>still being missing. I'll try again to repro locally and if I can't 
>I'll send a patch to move the FB out of stolen and see what happens.

I think it needs to be out of stolen, no way around it.  We are fencing
the number of writes, but if the fb, that is user-accessible, is
allocated in stolen, there's no way to do that.

Also, I have no idea why it's currently in stolen. Looking at

	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135667v5/bat-lnl-1/dmesg0.txt

	<7>[  321.798108] xe 0000:00:02.0: [drm:intelfb_create [xe]] no BIOS fb, allocating a new one
	<6>[  321.798743] xe 0000:00:02.0: [drm] Allocated fbdev into stolen
	<7>[  321.803371] xe 0000:00:02.0: [drm:intelfb_create [xe]] allocated 2880x1800 fb: 0x01621000

so, we failed to get the fb from BIOS that would be in stolen (why? not
sure), then we go ahead and allocate in stolen, for what benefit?

It seems like drivers/gpu/drm/xe/display/intel_fbdev_fb.c is already
missing the MTL WA that avoids stolen (see the same function at
drivers/gpu/drm/i915/display/intel_fbdev_fb.c. So, for CI this is probably
sufficient?


// diff --git a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
// index 816ad13821a8..dcac37c33560 100644
// --- a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
// +++ b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
// @@ -37,24 +37,10 @@ struct intel_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
//  	size = PAGE_ALIGN(size);
//  	obj = ERR_PTR(-ENODEV);
//  
// -	if (!IS_DGFX(xe)) {
// -		obj = xe_bo_create_pin_map(xe, xe_device_get_root_tile(xe),
// -					   NULL, size,
// -					   ttm_bo_type_kernel, XE_BO_FLAG_SCANOUT |
// -					   XE_BO_FLAG_STOLEN |
// -					   XE_BO_FLAG_PINNED);
// -		if (!IS_ERR(obj))
// -			drm_info(&xe->drm, "Allocated fbdev into stolen\n");
// -		else
// -			drm_info(&xe->drm, "Allocated fbdev into stolen failed: %li\n", PTR_ERR(obj));
// -	}
// -	if (IS_ERR(obj)) {
// -		obj = xe_bo_create_pin_map(xe, xe_device_get_root_tile(xe), NULL, size,
// -					   ttm_bo_type_kernel, XE_BO_FLAG_SCANOUT |
// -					   XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
// -					   XE_BO_FLAG_PINNED);
// -	}
// -
// +	obj = xe_bo_create_pin_map(xe, xe_device_get_root_tile(xe), NULL, size,
// +				   ttm_bo_type_kernel, XE_BO_FLAG_SCANOUT |
// +				   XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
// +				   XE_BO_FLAG_PINNED);
//  	if (IS_ERR(obj)) {
//  		drm_err(&xe->drm, "failed to allocate framebuffer (%pe)\n", obj);
//  		fb = ERR_PTR(-ENOMEM);

+Jani +Maarten

Lucas De Marchi

>
>Daniele
>
>>
>>thanks
>>Lucas De Marchi
>>
>>>
>>>Daniele
>>>
>>>>
>>>>thanks
>>>>Lucas De Marchi
>>>
>
