Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CF0ECD9B0
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 22:54:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEFBB10E14F;
	Thu,  5 Feb 2026 22:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gda2fodo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F2110E14F
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Feb 2026 22:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770332077; x=1801868077;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=z4MD6TdWvJk4vb0VMJe8JdW5SZTngMaqj5uqufKNYS8=;
 b=Gda2fodoB5yYJV5q5whcGMFZtC3pHjx3CwfpdZZW3MOaqMXdAJ1Gjf0Y
 L3pSjy3aLItq18aK3761JkJWKJMcUEcCXgHUZ8O4jndY9fP0TFlw3lZWS
 3Z6Tf0Z1jbA+Na7vtKbWE12UqtZ7AE7kZTRbjc551fwzgE3SFtscq2R8i
 0w5UJMNEpUagceA1UQO9dBkMRlvLBLJjEMojq5/VKBmx7h7QtnR0BwfA/
 doXrjuWv9li5dJLLtT5f+v0YJVI7UtOUaBk0aXd2bEXUqoZLPDqBMe/Gy
 irWcreA9nhMf8uQmSEBqXNNF56dP3PVJxpor8rfnW2hBRtHm6o9cSc/nM w==;
X-CSE-ConnectionGUID: s39qr3VMTV6xrcg1O5Xv0A==
X-CSE-MsgGUID: BkBjYZobQeuUE8I9Zrks3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="82911453"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="82911453"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 14:54:37 -0800
X-CSE-ConnectionGUID: IgctZKHFTg265XBaiDFqQQ==
X-CSE-MsgGUID: FUAzOyBJTDuSE/YVie3TVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="215668927"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 14:54:37 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 14:54:36 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 5 Feb 2026 14:54:36 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.42)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 14:54:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KdK4dkLEkiw5mkOXYf47KJM3yLtItZHrrIS+XbhKjbmzKlL2+qUD5EdstAE/UpnvmNH6czksteoU+ih2l7ZkCECqJ0tNKQgf0dr9FYyXx85WxaNt85jVmfK6M9kT/dUsaaaNzd+LpsR9SlBbcPVdWVUUds/uXEcuI4bj+UxYNfPjWHtxdhM1cGpjPggYCmA/MSJD+FOqd3dvM4Sc3h4TZqlednkRbcC7ZnkFBSna8Cs2EWCduiHSRCaEEjwyhSclYYIO6I1MDxqPXjPDMWOTHG/41YGswdHqdXb2829VvavVKCBnLhLZ4cVO+9hnQowqafKqNpirUJifQK0X/IMPAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jessORYk8KmfD2QhbWJsgvkOAYRO0pM2kMZhW1iy/IM=;
 b=Wrt8PtvdHbVgZZe9WR7bwrQiyrrh0fUfFu3E+TGoe2bDgJfW6Cu3wLnIpa5OPWnQNOJgDPPqGGJewbeeCLFNp5kl29gJndLoIKwIXj+99bd2j8qbRz6ZWaIOx/3DKWbh58Fa/bswRQKMhy4lcv1JhKBoHEMQzpI5JZQQNupyxZc7ahcdwVUGZkt6PELeHGwpnXfJzvrl8sHEIg20Sf3gCZfpPiu6+qG2/1yIpopovBs5j4otomOHVp+kXheJHSRz9WfbMTAnVlLltwyveUt/N4+PPZpRjMoQNc41z9AdHxdwDBChvvCe0Dx/SQF/VEHftUWuIXZM7TV4I2KxCmWpCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH8PR11MB7071.namprd11.prod.outlook.com (2603:10b6:510:215::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Thu, 5 Feb
 2026 22:54:33 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 22:54:33 +0000
Date: Thu, 5 Feb 2026 17:54:29 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <riana.tauro@intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>, <lukasz.laguna@intel.com>
Subject: Re: [PATCH v1] drm/xe: Send unknown recovery method for
 XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET
Message-ID: <aYUfpZOEIHl3i_kf@intel.com>
References: <20260205111836.1628965-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260205111836.1628965-1-raag.jadav@intel.com>
X-ClientProxiedBy: BY5PR13CA0020.namprd13.prod.outlook.com
 (2603:10b6:a03:180::33) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH8PR11MB7071:EE_
X-MS-Office365-Filtering-Correlation-Id: f9c935f3-53a1-45f0-e19c-08de65098758
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?K+KATQC/IrQhWte5TjK7zXZ72qhJO+lrD3viXOlRR+1zI6VzpKwUYKWLn8/B?=
 =?us-ascii?Q?nLB5iUz4b6euSisOyIQ+TNGhcR5AjlZO5A493+T0ZH65vg2O6Jqca0xq3Ul8?=
 =?us-ascii?Q?GWhe5tqIvvSPCYc2GJQn1btAD0FxnrAT1Ipg/6TL/HvjzABiUH9xWhcenLnO?=
 =?us-ascii?Q?CLAHB6Hm0Zj9p4wl+LMYev4Px1a+fYDLsClkLodJL1PRlEpPs5jip2c1RZhW?=
 =?us-ascii?Q?P0OJHTV3mKe/Iv+3EXyGgQzr0ZIQmicHgy+d+nP6XDOlRrgERbsDTwDKGShq?=
 =?us-ascii?Q?fl30/F4KZ+LLGHciJuyRQT45FS4xVbN+Pw7OfPPPLTUVX/ipKJbbIb27AZy/?=
 =?us-ascii?Q?2JHBCIhztZ1vn9I3fAVzGMkcwrPE62YkrH4ofndfaFY5szH6Bc0hPixa5slk?=
 =?us-ascii?Q?oG0tuyDuZoSePAD/MFk9a/8wqj3tfyRCZG50lkZxnHcfYgKPBVbYBy0cXya5?=
 =?us-ascii?Q?tMVlsvql8yxQRRs6X+vvJ7b0EinIReLwOxOqtrjSXOG9n38ns+DVBpMmhRw7?=
 =?us-ascii?Q?9tw/dDkvu+atIjCx0Ev3QiDpjR25xPUQssneI8690A2Xa99MkTKoeqW3mSjF?=
 =?us-ascii?Q?dz8P3JpYk4XliuVm2sNX3qZGcnQKCGj0JCY+ue16/Ud3nQxjHaT8iqmYKhbr?=
 =?us-ascii?Q?RgfPjqe5HtGrFOyEcK4yoE/Uab4V+VwyNLez4d7YR2keGD+7/JCjpf27cc+U?=
 =?us-ascii?Q?E1olJMVcXsS4IbazzfiBfGz3UCmRYcGSdedkMWWQJoqFK/evIZzRkLe0GR1K?=
 =?us-ascii?Q?2pLwYdObVteIRXzSxm3C03sD32ggA0/LPCqZkhkXYZVlGG3smVwFOHfzYAv4?=
 =?us-ascii?Q?mlGynPBgyr14YZIbVIuhUsPr/1Yq0VF7KGPOotVESsVc8p9aW0egcgRIJ6AK?=
 =?us-ascii?Q?nbWe/WhAxSpF0iff9TJ9RBm1ly4pmNYCtMOuXv4cJz6obHpYp6AGxGlPDVjQ?=
 =?us-ascii?Q?B3mj2GheisorFZp86DttFV72MZ/ZwxnGBv8I6H1SE/J1JGoQHIFquA0lbM1z?=
 =?us-ascii?Q?2bN38Xqlw0GeBaouDFNztmZi3/FPl26cQuY/jbWWSTzUjqKKYF5bvTnzrEqo?=
 =?us-ascii?Q?oDQsOFskvhIkwZs2rksWTKs1Htw9/uzePf/CpIrLEC3YwAx1sacfRUKELo8v?=
 =?us-ascii?Q?2cq9O9HVdya6a4WiUFoO8cgBHNy7ECsddtrNf2hmiPyOLJdrRPAyPn9O+KCC?=
 =?us-ascii?Q?jXXCrTs/pLOWJU5vThwURQZeDS82JLmLsHlv5y2kjKkEBVKrLxJ5IabX1I1U?=
 =?us-ascii?Q?+b9GLNqyrLlom3IHh73MNhOgrboavq3E5GwlthM4gngJz58UnC89ZVjUG6gf?=
 =?us-ascii?Q?lyxKlZIPL1Cl43H0UvcVv403NZfLUVFk67RSr0hFhmKzfgRx3HdYd6VT3zP9?=
 =?us-ascii?Q?/F/g8+NlvQpW4wlVCCzsk1kP2qnXYkWxYrehLowPI82nkpUJoT7LX8GuuN9o?=
 =?us-ascii?Q?PlTyojVn3iXfyC6Aps8ybM/gLR5Ajb5iyG6L/u3jGOkoyuVd0feFmLaNqzmP?=
 =?us-ascii?Q?YJZv53lk/GzxN89rk/JNQQu5o0AdhqJXGpLUui/q5M3RH4Ai6oICI9a5cdeD?=
 =?us-ascii?Q?VVbsGPtnfo3Fro0VleU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EhkudiimmNUo3EeV5poMv7LZh34Z7cb+RH+RTKnJ43TymhHFbdoUe1SgDYjD?=
 =?us-ascii?Q?E1BDdU8M9T0Dq5aOfZIBvPj4RsQfc705YNssaGf5gXiLrB4ukFSLjNxb3Tr2?=
 =?us-ascii?Q?/EuUWIlzQ/klkij6OJL7qUALXglWpOwk94PKkAgg9/7/CE5GEuHyj6RWsAa+?=
 =?us-ascii?Q?t0F93wEtK2muZWj03OUw152VCtdpAVxmeWUhT0gPNRE4fwgqKjbJANpVf2+d?=
 =?us-ascii?Q?UFfH6FIeVndzoD1+r6yItGBDkALm6Fs8mecR5AOutG9cKrEFzbr+7jFU94wG?=
 =?us-ascii?Q?5jiL0/DiwT25DzHZNcuBNKWzeLZYx6UerrdJv0mXY2gC+I9/2SbBtzfuKw2J?=
 =?us-ascii?Q?PXyJYLcZIfPC8OQNmPhSGrwx35ehxklTFi1GtGCGDq14TAezZ5hNoWZUhL1y?=
 =?us-ascii?Q?npBcQxwZ1Ovu8UdV6Evkj5LpXmJ+tWCeTWMj4zWTPYqqVNPR8XgRhLewMZSW?=
 =?us-ascii?Q?e9OspfqqgIydhVIId56UWIxsaGpqYbxkCGHSCkamY3sfsf9dWGbSMc/mUNK0?=
 =?us-ascii?Q?dh0yh7EstYimUpmj/ZY8LOv8p68dH3iYV2ONJiP8uWAKaIGOorBVeYc8LBot?=
 =?us-ascii?Q?sJLv/4UVvydB3bqKvgVjoqUfv6WzWDjA91DHsMZ1896HpYKejY28HEZg9GRS?=
 =?us-ascii?Q?lq6wsVQTCJhikxOQf8jJCU2EZYcmV5azcbvfbB60xIQjwGCZ6Wds77sLHBJF?=
 =?us-ascii?Q?EqG781S9esE5J/6mTAFeuyT6yeoRxw0nMI7QKrH1m1d4hZX96MgHOuI9K3wu?=
 =?us-ascii?Q?wOIWv0obvgHQMHpRj7QTmXdoebx/ohdU48Lvtr+unD12an6D8tboxd+d+4VX?=
 =?us-ascii?Q?MFVmGAFkNruyA0Im49A/IxirxMMimv13Ttj7nL6imxiXSDqtrg0wszBMJ/2t?=
 =?us-ascii?Q?0B4bppql+NJJPHNyNeuN0lONLY410A3EyJjTdIf2Q9thR6Zpo0gOK3Q6Hlat?=
 =?us-ascii?Q?QJhI+YI6fX+vkLbcT+4wq+CQDZ6lOiNMufj2aPa+dtzW1RZ3ImYfmfP25ODN?=
 =?us-ascii?Q?GTZTpDG/fWLyDKz9Eyca0w9OUZ536USo3Mlk0e7gn8W7YGWrvDHItDfjAkZa?=
 =?us-ascii?Q?KUwvT0oDfTKNALg/qqMYjUnBAZQmuHrBPLJrxzZIgFgHa23aFQBr8XeTOWWp?=
 =?us-ascii?Q?MD3+mEP8GShgv9Z1camh0ICdycYQEOSaaogXrvsBJe49tHgUA/LVcPzTEpSE?=
 =?us-ascii?Q?F8uils/CiimQuz27d8Y0IOJ1OFyILabjgFoXxBTx/bwOJRNmxrHd4tTLaK/I?=
 =?us-ascii?Q?9arqbSZ0t6PGFooNyShQSFgV3SQsIDHQwJlTBh1NHmDlS9wxsZnQ6lJRCBNn?=
 =?us-ascii?Q?5c6ol3fKQjbQl+QMaNocRSv/eeBf+uxeVqJrql8Nl5vNrJqyILIYV8F2Ivsc?=
 =?us-ascii?Q?pkKNxPOdM8lbLjsx6MOmN0IJ2rW0w+ymccSvspqYp4krP0stmDdk8cjDIxhn?=
 =?us-ascii?Q?cfKzA/m5iRYwwcQpdRUPBhWeCls5+s080SeYuEIgx4QsqOg02bStErwqh8Ul?=
 =?us-ascii?Q?/L+R7vIHTWgjTw3UxQ2TttXhdvGw0N37x2cbXcOh7Xqv11BppSAgiQKrVGtI?=
 =?us-ascii?Q?ty06gqJqWplLxfjilxCiTOMpT6ANEkiQiGHNT7eBS1GNAY7FHVz/eXqt6qzP?=
 =?us-ascii?Q?OlX4xIrwmuXA9zNe2N0vqF94zW9AcoHCt+2BCIwlpPKHCav2K3gxr/hxoMlx?=
 =?us-ascii?Q?PMpT/NprVaHpjP8g4/492IpFXG5quG0W6KYYZG2C3G0pnk7ssMnjuuGyJ3aF?=
 =?us-ascii?Q?NH7Zhs9WzA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9c935f3-53a1-45f0-e19c-08de65098758
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 22:54:33.5593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PoSQm/Dvpc9eKDuwFL9WJ4kGNFTKf43Ev5ZRfsBQWlnPFyN0TcSWqp0EvPDv7P/T+pkBsGI5gEy4VitHbPLtNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7071
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

On Thu, Feb 05, 2026 at 04:48:35PM +0530, Raag Jadav wrote:
> XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging hangs,
> so wedge the device without any recovery method (unknown) and have it
> available to the user for debugging.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index b1241fa4c3d6..815f0b0c9dfd 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1326,8 +1326,15 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  		xe_gt_declare_wedged(gt);
>  
>  	if (xe_device_wedged(xe)) {
> +		/*
> +		 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging hangs,
> +		 * so wedge the device without any recovery method and have it available
> +		 * to the user for debugging.

agree....

> +		 */
> +		if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> +			xe_device_set_wedged_method(xe, 0);

but why not using the already defined:

#define DRM_WEDGE_RECOVERY_NONE    BIT(0)  /* optional telemetry collection */

?

>  		/* If no wedge recovery method is set, use default */
> -		if (!xe->wedged.method)
> +		else if (!xe->wedged.method)
>  			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
>  						    DRM_WEDGE_RECOVERY_BUS_RESET);
>  
> -- 
> 2.43.0
> 
