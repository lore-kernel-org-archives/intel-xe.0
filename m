Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90383CAC592
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 19:26:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5043A10E0F3;
	Mon, 22 Sep 2025 19:26:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YBGezjjZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B283E10E0F3
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 19:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758569194; x=1790105194;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eSHX2Md5T8wTPEqaL7/pWDCwA43/vkxWJoEy8PQy+QQ=;
 b=YBGezjjZkeFSccX6YPdEdNLfRv651HODTVP5WXCRm8l7q4C8un+YdPZ4
 Fc+iujFRSP3K62ViyF9BFl023sF2ls1BmGuh+yLv806VuKiOfXsQokfR1
 GGeGibpmVTKFnHVp19EFMKGrRT7wH1Fd+Pw7jxiCiIrWHO11q85mjXIaK
 TlXHwCEVoOMqMgGAAp5ByleKiyMbJR49r2RInEMbF0ECqSvlztP3cJUKx
 xa383iVMNZrv/DxXCF5w/5eb6MamzIWVkdWHmOpUWohx6D+RfGFXjjdVZ
 dC+Ry6F1UQgo7oxzQH/KdVp0E8PvrZ3Udz6nRLFicyKTEv2gkMfrBrXM4 A==;
X-CSE-ConnectionGUID: 1lTjcE+zQbiYaXp6y+HHZg==
X-CSE-MsgGUID: 11rSWAFARlqXhJD9aI4Cdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60763842"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="60763842"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 12:26:33 -0700
X-CSE-ConnectionGUID: uIHgoDcJSD2OyozdBzUBHg==
X-CSE-MsgGUID: 92ie5Z5wTQGfo01Gn/WITA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="180562802"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 12:26:33 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 12:26:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 12:26:32 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.60) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 12:26:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lX+33EnwN3ATZkuJLeq2WiKyqHRn8b5QF4qP8a3PD4uIdGO7IGLtNOgc5B/7gsggj4aEtBeC5JiMWDN1FI24mMoUer26bs0jWwYc+SZdY4SrxqeVnPHIsN07WMZqtlQ712Y0ok30UpuApuHHct/9oaMPnE1VJZ4mBzGis117lJ0LWIlKQC42oPJW0tIxqZNeQO2RME9VF8PuNZaHP1WBEoBp0uf3jZ06lDZojm1vNvXrSNSL14m/cY1Tq9TTelj2Pxb1CSadhT4RFz5XEOs1kG6Zuk4zwztXXb5YdFFEIyRzF8dREdCKDrSkDAHMs0u/5NUh0z6RfLF5v0o/ZblgAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WwLol/XWYEFdrSqkVzvsY7BkQUOdtxMKhHXGu46rGUY=;
 b=hKq3v3uIIrBnWqqz+o8IJS/rEG0UjHHbr0nDR2VL+RCEIg0YFShkKUu3k4O3Mx1LaHf0OdcXuLV0W/OIwDu2pMKMmOGj4pKIOIDuxcz488sm1U9f/JqoEuY31ANYQKohk/MSkPED0Uu0iI2c1YBDQsSzgy66LP3zgsN6WIZa0NbXQWAJu5CwnPQhjJgajlSl2DUqiPZVvgik/zYii5MEFFMUr2OCMfRKZXwxL5j+fBcLBGyMzg7wD6wv8zli/35reWoUtaZOynAcEvfJVZtUsaqjzXEgItzoxeCzFGCfHhy+BU9VUcQxBLMwybsE8BESOrrBbjFyQm0ZwY7zC15s6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6402.namprd11.prod.outlook.com (2603:10b6:510:1fa::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 19:26:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 19:26:29 +0000
Date: Mon, 22 Sep 2025 14:26:27 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "Jadav, Raag" <raag.jadav@intel.com>
Subject: Re: [PATCH] drm/xe/configfs: Correct mask and pattern check in
 lookup_engine_info
Message-ID: <6ak5caanwj342jcx6xztsnqf6pgslkflhurazzyefqb2varnan@65krwt5nwihv>
References: <20250922155544.67712-1-jonathan.cavitt@intel.com>
 <rf6v73qkdzduxcctem7e4o3zs6pdoijcctbginwfkuqv3dg5gg@txogogihmmlq>
 <CH0PR11MB5444DC317FD0734EA4A9E441E512A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <CH0PR11MB5444DC317FD0734EA4A9E441E512A@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR08CA0009.namprd08.prod.outlook.com
 (2603:10b6:a03:100::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6402:EE_
X-MS-Office365-Filtering-Correlation-Id: 61f08721-5559-404f-a8cb-08ddfa0dee1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ShvR6Z+JZeLZ9vw/fIQXpftgJpGl4snaZFl+XwC3EZxToiUiSpTrPkUPz56q?=
 =?us-ascii?Q?sTZFCGTWVPU9EbAVd/vn9RVQDkcre9+JuXCHJqkmCQi6XkBKGdCjEQvvFdRl?=
 =?us-ascii?Q?0dEKf+/po3gGWrmDn5nSegTjAV9VptapHnmcYZmJSXQlkOM0ptudRvXcZDMs?=
 =?us-ascii?Q?IhworM9t8WOY2tYF9Q7tvF+i1eaO40IwQjq/YePuCJSYUNDCxmEh9OAKKz6q?=
 =?us-ascii?Q?a06h5iCOwLolm/ieIkFZJlyGXItV5WoZV2XijleteUu3QWu4BL5YrHxZizne?=
 =?us-ascii?Q?Ss0ExxfWsINHEjr0QLMat0yPNBg7S6wFG+mcHBtXOWNnSv/gUTbTdShhazEJ?=
 =?us-ascii?Q?R/59SCdPUI3BXxNq2ooy/hQ708GiK5d6IEbKztiyfrpjjAAy2q9/rotYLMoL?=
 =?us-ascii?Q?vCUonUotfGNxEwZhOFVysnywoWkk+FxByIUu2gD2tS84YBNzaHFBQD4Jgvzk?=
 =?us-ascii?Q?8ctgfTsU+vsplcyLtMOOMMN1l87oOY8XR03hN8pETaRQ8xoeFSht78r4hTFm?=
 =?us-ascii?Q?OTCFYT7NyRYsI8xWPZJG/z/untwmQnx4hRvi011OI968dMkxkgwPl36Vh1A1?=
 =?us-ascii?Q?aukXaXuN6FeE6c45tCA3fTCfTk+rUrmDeZmVCUcRe/wDRPdOLPKNaJIWVn0a?=
 =?us-ascii?Q?MPIJ24bGUG6eINTT1vYfiAFzVB3Mh2GRwLN9LOvJGJ1BD2R30KMHonBoe5Xe?=
 =?us-ascii?Q?owkRPHzYkCIsJMXAl4UQEc7rrz4w6dQrYgtRixTUKr/7NI6TbaeU9u8N3hgf?=
 =?us-ascii?Q?9n/KY2dhMIZXXfTvmiPf5EjWxWxlsdxp1cPnyBDPPofgTf2ScUx1+m3DcEuc?=
 =?us-ascii?Q?1DXXu5Xv4ZYP1Mw+tANK7dC+ehBcZN1GLODSmjnZqDmjitG4DRpAO/eXvti3?=
 =?us-ascii?Q?KXNVsRh+5jXw8UquIzzQ2y91OG3CMpXko/7Pf1YIi8z6HT+O5Xcovghdmqvf?=
 =?us-ascii?Q?c1XUbTWvxsI8+6/yuMQ4uh4eW9dDZVK1Mhs8yTRO9KqKxsXUw4xjTvbN8WZ7?=
 =?us-ascii?Q?+18FySUS5VCxU2n5P7476y8/Hr9jqzGQubaIoz2+oW4VMcjwsRJECjrxfo2k?=
 =?us-ascii?Q?wUzKRCLhPrYaVfMyCAbnivRMg/Sv/gJP37ZrvbugT7e6BEiA2BIxkCM5nn4a?=
 =?us-ascii?Q?0Oogu/PWu4Pr/tXckq+MwoMhG5Pa4lAvxuH0liQbc4QR9Rb6g7X68uYm7vRV?=
 =?us-ascii?Q?MvpGMx6JPQUxW8TQbz3iyNi5HNW/yysVcscCVo7aMwesNbeLbAk5DTeBEZ0u?=
 =?us-ascii?Q?5BuVUSSWqnnmmx3wLbV993zsD1eer32I7wyLU1EaJBUuKYonVjczyVlLwoP6?=
 =?us-ascii?Q?GSb8j2jyALofaw3gff+jcQ8SX+7FrMfsBUy5OohFB8OEamF6SYDNqWGYP8V1?=
 =?us-ascii?Q?Vbo7M5Xi0FjStWpaGp4Kiti1UodXVGNygCMft4VLU8w85S6A08bzFe0AP0Tg?=
 =?us-ascii?Q?BHHsbWErxog=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LhOa3FOZSsE6CsMyUpS+6B41WLxSDcQWBwxowRD82PIx6yRUYDymEXRXv8fQ?=
 =?us-ascii?Q?QFwCCW776ktlHaxPi7s4Qs/TPy+ue22tyt++J/FjT+WqS/31ztEUczlP5Eon?=
 =?us-ascii?Q?zRM1GTySgXfqnurIP0IviOgqskOq4zMfUoWjbelr6Nt28muO7cZRKrMlhCH5?=
 =?us-ascii?Q?5iVq8/5KeROc1mbBR/+Wt5nxfb6wQ4RsuyF3ZoC98IM4fhGiSe8q7osV8sMC?=
 =?us-ascii?Q?oDK++9zhJtF1OufvEl0aPm8lp2iJHObJ9RL6UHjS4MbDUIPTOqyNe0dvd//M?=
 =?us-ascii?Q?HvJhwWFXCE9girq/J4KdFgk44YMEQbDC07zvJSUNotypbJ0fzihxtrBgp4vp?=
 =?us-ascii?Q?vxm2EnCLU0Vn7fDsOFmtH/V/UYv5VBWihLd5CYn6mZPKDiuw2szatbI4da1E?=
 =?us-ascii?Q?9mHGLRt2GyBpBsFFbBDEp2CltTSwwAZTfJUffUN3wXTR3bEjCO35rzq13xF8?=
 =?us-ascii?Q?vdxgN0P9xs8Ve0sap2+U/KwoA++zGvHyAoTyHlVIwtH9ADR14wQOwsxNaPkz?=
 =?us-ascii?Q?QjdddW7+zxfUJsRMrP1koB+l9L/cgw+DbH6QB9t/6G0ycW14buFguyAzDSju?=
 =?us-ascii?Q?KvhLLN29P4cy1J8GNgeo330W8DbB2EYdELt82OK7ikDgzRpbkb2MveyjkV/H?=
 =?us-ascii?Q?VoAjt6KaHrtlqms1mhIKf787lCzHO+2/MWDCv6BG03Bb7JwRZF8/JW9qKxbx?=
 =?us-ascii?Q?2QLsaOLlMNseq1r3tCLEKBxQUBMFeRgBvBJBWGmeAUbj255S5UCHTBo+vHNi?=
 =?us-ascii?Q?1tahsURlH65WbBldpPwbUdAoIG+G2ONWSXIhH0RIS3vTpkeIKvFegxHAf+yR?=
 =?us-ascii?Q?wufzazjXdffmPzo9S3lT5bIb6WmKM0dU/Gad+FC/XRocxXBcIUCJ3BHzhVUH?=
 =?us-ascii?Q?JGpxpIzu6qiOKi2tSzMvCS0K121wAwml6O0DebcWPjYu9iiNnSovjp1iUc+A?=
 =?us-ascii?Q?v6DDarLjZfaDZ1oWB0Ai0iB18c0T1M9ZgbQDDe+tPyG95ErXAnM8nGfQGZpk?=
 =?us-ascii?Q?Ngei3xa/7lx2gNH9uipmLu8kWdb5nSdq84wTK952N6zXVPWJ/drVApksRAc6?=
 =?us-ascii?Q?L+GPmK6gTnzeUzne+ArofVAZ/Ew5+CZnmjivP10cz1E/C18twqE1+b3viVZi?=
 =?us-ascii?Q?MTs++y6KUQpB4CY6KOrHKW2+Mk0ejs+E5Mukoc1c/vByo2sH8+s40r2gyDtj?=
 =?us-ascii?Q?gp2WsudUEvX9Tebkh/3xw3kA+phoWp24nM1ZT9YYK/yIjxCwhkHtXCZk5LpG?=
 =?us-ascii?Q?hZKPn3YvF4Q3NDbThApmTji21Po7ax3Gr55qQ+jStLlbsY1cShuzZXV6jqNC?=
 =?us-ascii?Q?8jkFDBzsWh5rWlwZSTqrBxWoan3DDLafZtksFoQ1ZlQ48aQLnI2xfAiPligm?=
 =?us-ascii?Q?uIVHDYgoetkC/uIGFo3g6Iw59aWmQl0EdGX1oQoTopC/hkwaOGhJsTQZ434l?=
 =?us-ascii?Q?SwSdFpfXiOSaSagd6olCQO0xxN3oeZWJvXhAD1zIYI5vZiyQSGu2xXi6vCpz?=
 =?us-ascii?Q?MhsZBjF7w5QCyByfRohOnI1h4wgEopoGjPpfZcZnfk4IwunuwufGghTFNGsM?=
 =?us-ascii?Q?tbFhXiCXL7TtbKXqUYW9fJJNYXQxcGONU/b5buIKo90AvzPGzMIvnnsjLXsu?=
 =?us-ascii?Q?OQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61f08721-5559-404f-a8cb-08ddfa0dee1b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 19:26:29.4243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QbD6x3OTOz9RBKhYKjUosTQ0AxhuwelF3cAIsthWDzTr3HlicKw57T2sHp1v996nbRLMVDQ36v/Oh0xqk9K+7hAK9AsWPqqhhWkYpP8e11c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6402
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

On Mon, Sep 22, 2025 at 12:35:39PM -0500, Cavitt, Jonathan wrote:
>-----Original Message-----
>From: De Marchi, Lucas <lucas.demarchi@intel.com>
>Sent: Monday, September 22, 2025 10:31 AM
>To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
>Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; Jadav, Raag <raag.jadav@intel.com>
>Subject: Re: [PATCH] drm/xe/configfs: Correct mask and pattern check in lookup_engine_info
>>
>> On Mon, Sep 22, 2025 at 03:55:44PM +0000, Jonathan Cavitt wrote:
>> >lookup_engine_info is described as such:
>> >
>> >"Lookup engine_info. If @mask is not NULL, reduce the mask according to
>> >the instance in @pattern"
>> >
>> >According to the description, we should be exiting the execution early
>> >if mask is NULL.  However, we appear to only do this if mask AND pattern
>> >are NULL, as opposed to when mask OR pattern are NULL.  Fix this.
>>
>> that's not true. the condition is if mask is NULL and we are at the end
>> of the pattern string, i.e. *pattern is '\0'.
>>
>> Passing mask as NULL means the caller is only interested in the engine
>> info.
>>
>> 	lookup_engine_info("rcs9", NULL);
>>
>> we don't want this to pass neither:
>>
>> 	lookup_engine_info("rcs", &mask);
>>
>> Lucas De Marchi
>
>This is to correct an issue where mask is being dereferenced while NULL.

theoretical issue or real issue? Please don't create real issues when
dumb static analysis tool says there's a theoretical one.

And if it's a real one, you are missing the log message, "Closes:"
trailer etc.

Lucas De Marchi

>-Jonathan Cavitt
>
>>
>> >
>> >Fixes: e2a9854d806e ("drm/xe/configfs: Allow to select by class only")
>> >Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> >Cc: Raag Jadav <raag.jadav@intel.com>
>> >Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> >---
>> > drivers/gpu/drm/xe/xe_configfs.c | 2 +-
>> > 1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> >diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>> >index 8a9b950e7a6d..0c048d4a33ab 100644
>> >--- a/drivers/gpu/drm/xe/xe_configfs.c
>> >+++ b/drivers/gpu/drm/xe/xe_configfs.c
>> >@@ -324,7 +324,7 @@ static const struct engine_info *lookup_engine_info(const char *pattern, u64 *ma
>> > 			continue;
>> >
>> > 		pattern += strlen(engine_info[i].cls);
>> >-		if (!mask && !*pattern)
>> >+		if (!mask || !*pattern)
>> > 			return &engine_info[i];
>> >
>> > 		if (!strcmp(pattern, "*")) {
>> >--
>> >2.43.0
>> >
>>
