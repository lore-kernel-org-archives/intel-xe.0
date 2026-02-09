Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86E9E94602
	for <intel-xe@archiver.kernel.org>; Mon,  9 Feb 2026 20:35:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 780EA10E468;
	Mon,  9 Feb 2026 20:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a/qvh6nJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E0DA10E468
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Feb 2026 20:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770669335; x=1802205335;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zxltmCuU9B2vZNuH0KXArZCTz2IKYVLKsNLOebYMxRo=;
 b=a/qvh6nJcZPx5NaiNBHbdoX9WOp+hCxXQGxI2yjYcOZsLt9AV6yEGjWv
 79eypFlww14q5agvNV3sC9D6IKdajinMDo6bV1DGkIk/y6v97CCggPwna
 +13zK5B9QLBsscvt6fph1RM3RBcyqjrIzOhzH7Yvd+q4y3qJLZ548+dSD
 4HQrNvKgqyl207uPjosVe5ILZY/eYMpoS20qyycI2tFOM7+1SGaScGxIJ
 vwTXX/cwQBnidmAUcXzVHeaX5a7I1LOqRtT1nWFSq1CtX5Ba4C/jswDOy
 FkjW39ZUTNiEi6xE0S75BZSHErDgHqse0EFhYQdhWE9u6Vsw25yOFvFAj w==;
X-CSE-ConnectionGUID: k4IMaLByS/CdZePVVMhS1w==
X-CSE-MsgGUID: skNDbJ+nQDe28cjNeK6TiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71777093"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="71777093"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 12:35:35 -0800
X-CSE-ConnectionGUID: 8WtwQTjWTC2uE5qcGtg5Ew==
X-CSE-MsgGUID: 1J9H2n30RIurRsP2dIz8LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="216202142"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 12:35:34 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 12:35:33 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 12:35:33 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.18) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 12:35:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TbHWQZyIyvGHHhamuDAEG1cfsBTNIyLBMrLtY/h6UAxKVv9bj2OFMm1Liu+7fsfICvTjcO8j8u2a5BkdWAvBHK+ykPrhqUO7n8sV1LFFtHqu8c9gB189VO6UnPtcG+kxaDrKVk+M70vwATbOzhHL4YNQjVtTbx0vXWwvTlxzX4cPHZbaj7JAu319aRNjWqOtgO8hEQL9iQlWAw/SU+b1yED6rWLXujvVaFM1AOCOlx2W1CVKTX9XwovCruZ3+RebCX4o6WKIaXnYuheyFJpuUezkHJDlbk4l0AwIo13LlTHRSG37HKFO0nJ6T/w7/HNazI/Tj4srRNKKG6p3PH6Yvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fi3QSsBuGi8ZkT/8KRSfFmE2uzg3MN8Yd9t/16/6OvM=;
 b=XAW951UIAQJhetUqKd//QVHXGedPQJ56DdD1OVYoAQyUSmKcbEIrHyFEe0CphMgI7WMQ2mA+02dr9xV0DUokaRBwaprdF6oDnODCLxL2ZaxoMADX264s7xxP8m7rfD7iV8+4czL4lz4a85xXtxc49LOsEHaLi9Y2+MTFoHntEYHkDLXYAEcKpGVWcmCBbk+5j8XFSXf/nZv6RcT9GlFOvxYkA6heJaLeKHPERY1oiOEAmwefNfka1CavumXnF7O74TMbwv6GLJPa+E5SwDNImK3pPtZr+4uH4tDomlHCinp48OWGJL4QgzWVjgz+JLnNMtq4T8E1ng5VHlVGi4UJnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM6PR11MB4723.namprd11.prod.outlook.com (2603:10b6:5:2a0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 20:35:31 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 20:35:31 +0000
Date: Mon, 9 Feb 2026 12:35:29 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkJBVDogZmFpbHVy?=
 =?utf-8?Q?e_for_drm=2Fxe=2Fwa?= =?utf-8?Q?=3A?= Steer RMW of MCR registers
 while building default LRC
Message-ID: <20260209203529.GH458797@mdroper-desk1.amr.corp.intel.com>
References: <20260206223058.387014-2-matthew.d.roper@intel.com>
 <177041971619.235359.15714116294103961937@a3b018990fe9>
 <20260206235738.GD458797@mdroper-desk1.amr.corp.intel.com>
 <819f042c-cbdf-4e09-a26c-ffd1a9046529@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <819f042c-cbdf-4e09-a26c-ffd1a9046529@intel.com>
X-ClientProxiedBy: BYAPR02CA0064.namprd02.prod.outlook.com
 (2603:10b6:a03:54::41) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM6PR11MB4723:EE_
X-MS-Office365-Filtering-Correlation-Id: a21c1ca9-8122-42a7-67c7-08de681ac4b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EF3oAmKRzmX1Pu3XYKi1rWnOz4tidKblyUtw4CroIfEUxayDyzxp/WHC+E53?=
 =?us-ascii?Q?EdTNkfAg/Ve7HZtamlA+ZPbXHmeQUtwsYP8VEuU/ZL2SbjQd5LWtvPfTnIUl?=
 =?us-ascii?Q?t7fmAB+aKyRbcqmzhm04xa9cvgxt7rdeLdOozrGSzqYif8SNwXtkD3VvLigY?=
 =?us-ascii?Q?r6zIpX/4Um2q+WAcAUtEdI0XjXQXUXoBbBlx/XDCsq4OgH7Cr24rwiDMX9Ew?=
 =?us-ascii?Q?+ssGYwsvGw4XCw6MjYM/I+STKZffKUuMj9Uz2b3tOOVUmAP+b/BYM7+ws5tp?=
 =?us-ascii?Q?u3iLsLncwruriDLHESexCCJ7L6xGtjhzRYJ7jwTGwe9ilO9xDXa9yOX/5Miy?=
 =?us-ascii?Q?3wzyAlSjra/rkDfk3JaCnpjOgh5w2Ya+gXMMzWuhZ+VkVFPPG6yhUF4hEEtV?=
 =?us-ascii?Q?irxINc8AKj3cdkD265Su72DwfXr40YyZfRa6llRj+aUt2nlajwgUbFkkXpMT?=
 =?us-ascii?Q?or/mc7g6OUxwSElfI0ot7O8wpxSjzEPtylJaTbvnjjM4BkeWcrA1CA8adb+3?=
 =?us-ascii?Q?VsIsxgOG9L732MolYA/EV3yGUd1HrtXVbIeTbuVNzIsc8cIIBlBs08RhWIxi?=
 =?us-ascii?Q?1+QUcj6GV0Me4qG8E/3LUR4cq6BxWMsor6/lEZtUk7ma1leayXUv7aAmB3iM?=
 =?us-ascii?Q?VlJdMBzXjKM4zxqV2+uk7LTOdOZl/VADSN9uejiZlPt44ynCjc5RC6ozoAKQ?=
 =?us-ascii?Q?brjdzUyV78c5S3HUs5/hwY+xc6K+zdDKR09SIjLaDQxR5TNGBQ0ecFdlS1qn?=
 =?us-ascii?Q?Pr9G1yfddiOZatDbTCDoHb22ybcCr4vZGbIou5++mgLmBsAgZpt8HENdgpBl?=
 =?us-ascii?Q?n+8WpP+/BApTZs5sKRMRO8q5++mA+Q0niyAgpnN4bi4rm2jS54DRinEVvr7L?=
 =?us-ascii?Q?xdcyIR4XAqiNuv7E3Fwzhy106UPq3hileL6soyu8xEO1Tyi5SvocQWX6DWuN?=
 =?us-ascii?Q?Cd7q0Eqb2z0x7R2oAbcrMSoeA5VB4L7LOXobSbZJTceIq2ukynS59s1YFDly?=
 =?us-ascii?Q?diWO2yINvqi6hlcUHPzc6Dq/fPebXEh6xu7L4gmsDj/VxtNK0DdRL7+4CRR2?=
 =?us-ascii?Q?j8uU7nTUyvp1O0HeqznC13Nr9eOX/VHJ0pK1DIi9gDAbPG5FrUoUoPHFVkuL?=
 =?us-ascii?Q?1MAxg4b+dMr8aImuMBJTCBaX+wPnAOAxgtG6yxXbPehhDrC9xbqBGiT3S+9G?=
 =?us-ascii?Q?9VNz3UQbWO4aMV7GuHSntGClRB6GMrxSipIHHD/1TmyJO2ImWJdNnIGL1sWd?=
 =?us-ascii?Q?RWaXo/BaAvqRIYvnq6FFcrwpfrxYLycaUL6Af1Ds7UOzE7CVAulDHSChCnvS?=
 =?us-ascii?Q?xzmwyMiUhA93UdzZ3V2UaG4ByqhOZmfo2OHKih5uqxBJm+pv5OsFjm3+s6vU?=
 =?us-ascii?Q?4mwHghKmy81r+AgLbxzG7o8xD612HuVFGAHobpV+Ez9sSXoIW3so0W9XHmgJ?=
 =?us-ascii?Q?Bcfn35peKohefYDzPqjWtvlqnusgZIvPK5O1sqS13kjCgx0AkEtShFyk4HKM?=
 =?us-ascii?Q?Q/8yTQFATI6x5KlKCWVCu8D3ghEyzHwPvW4E?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vTbxW2DaWvVFRJCoZ9E5NWL8u5DMz+2s9Tnh+P299iCewCa5PxUFl3ElwBsz?=
 =?us-ascii?Q?DCjo9e8Fyy4dADSGyEE6nOy6gvFbPC09elzohEbDvzp2lqo3MNL7If8/q5Iy?=
 =?us-ascii?Q?Ggn2dqumoI8rTAAttyHRbNm6I2NY8KHdmeJIxzWTzPCW5d6/as4tRaU6i1Vy?=
 =?us-ascii?Q?5yleoL+pP+jJif41Ac6wjwO4YUTkw3aW2F6ZPD0Ug52zRS6LZLk5Lyi1C76F?=
 =?us-ascii?Q?gqz8eaxmq+GHBBm8Tdn/B5aONrcqCGvOJolTTmGRK3WHHc5eK3uC9kskeVMm?=
 =?us-ascii?Q?jpeM80NCyg0ApJJdKRmPo2RJ7svyPby/uXvsHFVRVAxeJ5IChRbYY8YMDKtM?=
 =?us-ascii?Q?fRL2vSOAOD0rPGE1bUdsbaQGFj7bZk8HsnnAWkRr1yO8NI+giNUixyy8c4cG?=
 =?us-ascii?Q?TF1ffMr9YHrcbnmOcDTc4mzlhJZ90HP20rfRZqrxtGH9ksbvQAxX8ChK6ZrT?=
 =?us-ascii?Q?5hnuvvqetiozNICAKwHiuFb7Et0EPGBUsCsbB4sWRn2UU7N/ZO0XVsFYVKM1?=
 =?us-ascii?Q?5a+9tVNkqiyIGOmoOcozDoylODlgtzDW4PabjCggjHSiINJbQ0zEJUOAlra4?=
 =?us-ascii?Q?Mt4oJdR/yO8lwe0Bjc4EpGoDklxG+I5mlDUW83mTs9uzpFs6vkRA4+e+aDEc?=
 =?us-ascii?Q?7kmvF7MFFsuCC4f7ZE4YLZf+7YT7ht/ro9DVnc2GBPV3d2i+CF8W1CYnJWcr?=
 =?us-ascii?Q?Uzkd/fgtZx9J4WX+pe1g8svAh/vF0YsiJZksmZKrdmPQE8ql4z2NJSLeqfoQ?=
 =?us-ascii?Q?tzXjumcFzq6cTstWRpnC50t+IAmsIQAD7YH7Z8ke9otsBtxykhReGO+++vAh?=
 =?us-ascii?Q?8Mk/p3wpyP0nphQ3m1IX0KQ6GlYrIP41A2erzhRhbAaO9njahSILXv4x5kx5?=
 =?us-ascii?Q?DNhZ9C/gO7o+BP1Cu3wLPQzfDnAKEsffmIriotTVmH+NkOm4fiP6SojGDkjS?=
 =?us-ascii?Q?P8gNkt7QtU321RBQSIIBTus/T2Zo0qiarWvS6KkZSrbRYYaClLnijKnbBVLx?=
 =?us-ascii?Q?OIzcMDFCkKdIOmiaaNIm3FTs7QgupOVbklvDEvoofdKaXkaYly2E70HCY2bZ?=
 =?us-ascii?Q?/GJ+dSXfSJQ17iZQRy526XS1mt25J1Zrh8G9eWGf1x3np5VpzJOjhS3qCgHk?=
 =?us-ascii?Q?KmU2KRidEcx/fLE+KEa4Gm0x4mlVJjz+8r3YOsOjgRENYIDaRc3yNB1t1+1H?=
 =?us-ascii?Q?qI7cHWs9xcY3xgQQwl/ecAw2LQj1jcco0HLHfzwowZ/+JTzuihiAFMGfWqCJ?=
 =?us-ascii?Q?TzXfUJKMT1Sg36TN5qnSBloBGEPgxOAeEnyPY2Bs1Cn1A/GT8Yif1P4I7WZp?=
 =?us-ascii?Q?M20twIUjUdTKE/4v2E567/m3mgLsP4Xc0/D+UnTV76Xp4o/7ZGzpyghAgU3L?=
 =?us-ascii?Q?433bK+8MFxr7XAADk4myZMQw8uZeofy8F+CgoeBVynXfiVzzlTECg6gk/dds?=
 =?us-ascii?Q?u1tnKxG+MtWl6W7j9ZI4XwxZEzH0/OdI4vXE5EOftNG1r5autNrZNRzUBCsv?=
 =?us-ascii?Q?qFNFT54CfEGGPlP7ZZjqaFzFAeIh9/9L2Whtj2cMqJx0eGRoHjbOULoFywjx?=
 =?us-ascii?Q?fEKZcJL05zHS5OfFajdLr+FoATTdwYdL1dchFMcMd+H0CDaFmmf6/lSrs94u?=
 =?us-ascii?Q?EDN3b+Uhcjdizgm6Jy64cXcKAv8PMiLpCkFFHVg6brCyuTi/CZ+A12vMmdPl?=
 =?us-ascii?Q?RLiil8xScNzggkDXcJI9xg9VWoeiUiQmvATXpygd5n67e2QQ33tXbQHoUc4d?=
 =?us-ascii?Q?mbRJwJanNZP6ZicWDIkPyZoxQ3WyO0w=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a21c1ca9-8122-42a7-67c7-08de681ac4b2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 20:35:31.3030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V6ZBvB9lL6vD2asA4CDPfce457jYjdj2iFr1OAKPqjNzVpXPln+/Qr3CQByo56p9IfO+orIPBxvvo0BiCmJaNk+3KdF7BtPAADZ4rbVWfP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4723
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

On Sat, Feb 07, 2026 at 11:05:06PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 2/7/2026 12:57 AM, Matt Roper wrote:
> > On Fri, Feb 06, 2026 at 11:15:16PM +0000, Patchwork wrote:
> >> == Series Details ==
> >>
> >> Series: drm/xe/wa: Steer RMW of MCR registers while building default LRC
> >> URL   : https://patchwork.freedesktop.org/series/161300/
> >> State : failure
> >>
> >> == Summary ==
> >>
> >> CI Bug Log - changes from xe-4520-ab5b6da7d4879640bce3197597e0bc707bd60ab5_BAT -> xe-pw-161300v1_BAT
> >> ====================================================
> >>
> >> Summary
> >> -------
> >>
> >>   **FAILURE**
> > 
> > Hmm, it looks like this is problematic in SRIOV VF environments because
> > the VF doesn't know how to steer (because it doesn't have access to the
> > fuse registers that provide the necessary details).  Lack of steering
> > knowledge usually isn't a problem since the VF also doesn't need to do
> > any CPU-originated MCR accesses (steered via 0xFD4).  But in this case
> > to do a CS-originated RMW operation on an MCR register, the ability to
> > steer properly does become important, and the VF just doesn't have a way
> > to get the information it needs.
> > 
> > I'm not sure how to fix that gap.  Michal, any thoughts?
> 
> It looks that VFs already know the fuses at the time of mcr_init() just
> we didn't let them run any initialization since we didn't need that.
> 
> We can let them do that now and with [1] I didn't see any WARNs.
> 
> Michal
> 
> [1] https://patchwork.freedesktop.org/series/161319/

Makes sense.  I just reviewed+applied your series, and started a re-test
on this patch to get a new set of CI results.


Matt

> 
> > 
> > 
> > Matt
> > 
> >>
> >>   Serious unknown changes coming with xe-pw-161300v1_BAT absolutely need to be
> >>   verified manually.
> >>   
> >>   If you think the reported changes have nothing to do with the changes
> >>   introduced in xe-pw-161300v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> >>   to document this new failure mode, which will reduce false positives in CI.
> >>
> >>   
> >>
> >> Participating hosts (12 -> 11)
> >> ------------------------------
> >>
> >>   Missing    (1): bat-bmg-3 
> >>
> >> Possible new issues
> >> -------------------
> >>
> >>   Here are the unknown changes that may have been introduced in xe-pw-161300v1_BAT:
> >>
> >> ### IGT changes ###
> >>
> >> #### Possible regressions ####
> >>
> >>   * igt@sriov_basic@enable-vfs-autoprobe-on:
> >>     - bat-bmg-2:          [PASS][1] -> [ABORT][2] +1 other test abort
> >>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4520-ab5b6da7d4879640bce3197597e0bc707bd60ab5/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
> >>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v1/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
> >>
> >>   * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
> >>     - bat-bmg-1:          [PASS][3] -> [ABORT][4] +1 other test abort
> >>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4520-ab5b6da7d4879640bce3197597e0bc707bd60ab5/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
> >>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v1/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
> >>     - bat-atsm-2:         [PASS][5] -> [ABORT][6] +1 other test abort
> >>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4520-ab5b6da7d4879640bce3197597e0bc707bd60ab5/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
> >>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v1/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
> >>
> >>   
> >>
> >>
> >> Build changes
> >> -------------
> >>
> >>   * Linux: xe-4520-ab5b6da7d4879640bce3197597e0bc707bd60ab5 -> xe-pw-161300v1
> >>
> >>   IGT_8742: 8742
> >>   xe-4520-ab5b6da7d4879640bce3197597e0bc707bd60ab5: ab5b6da7d4879640bce3197597e0bc707bd60ab5
> >>   xe-pw-161300v1: 161300v1
> >>
> >> == Logs ==
> >>
> >> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v1/index.html
> > 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
