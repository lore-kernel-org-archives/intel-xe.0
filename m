Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EEC6CD5BA4
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 12:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB8610E173;
	Thu, 21 May 2026 12:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nhF+hB53";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1427010E173
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 12:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779365402; x=1810901402;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=9lOG4D+I/BoKyYAr+TnAAW7BPTOeVxAdpFaOEvACPEw=;
 b=nhF+hB53/5X7RvfXnMf2BfhaTyMuBcCKe0nXMeHmmyCwJseSdHpl+y0T
 01wTjzwBQZvl51FMFMA5BfcosyHLe7rvMP1TEkrw37GxzhCJuJFPL/3Yo
 n4FuAVDQIPXGFbgzaiMZNXI1/93MhrAGeiWIOkJ0RatNQwuWOqP+lACkV
 9JafTDC0MZBKVV1xm9eHib/K+ju68hS5r85sJTjYSDw8D7fQYhbVcbPWb
 wFAHluKit6Um7nIf948Ov4C1A++iZW4rSWDeGX76BFhGa1ffwD8URdEqy
 vs3mLLWJCkq1WpgV59Lr23yGjANKH7kx69FLO/j3sqz67Y+BRFKU/2/u/ g==;
X-CSE-ConnectionGUID: f2diToCZTPyjRgooHEQLuQ==
X-CSE-MsgGUID: +R+35dzgQFidVJVBUH08qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="82858836"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="82858836"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 05:10:01 -0700
X-CSE-ConnectionGUID: KZCDFNabSsCA9AzEkXiGaA==
X-CSE-MsgGUID: ghNThbHhTG+zpj3mE3T37g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="236258215"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 05:10:01 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 05:10:01 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 21 May 2026 05:10:01 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.48) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 05:10:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GXHmWHEVLZ5Uu99OPIe2hlHQHolLb5aQ80xtLIKkW8cIdJ8/JpMtWH976874eeZzihNN4uSATdzUv9lE1liSVyav8RhI+bJs9so77x8212jRZCzN9al4TZ3z/wlQa2UAZCoKxW/x+2tgZJ0c+6fnkk/ReN8mfta52r4iDK/XdytXg4eV8DIuNWTUhnc66qp6qbo+a7hr7noEzsmdcOe3ZtwXvDSQk03r8XQFB9hg+2yA++5rC6BgX8A6R8/d9od+ar3AD05WKNz3QBesIkrut2cQl3ffZkiC4f/6glr2jBJS4xxQVW8fAt4VIWeZqQDoviro4A+Qw1fLeltritUpQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOtH5GJxWLDTshM9FdgPqdM1JOKAathLmYty7lBuze4=;
 b=cmhLCxXo9QrJZ9sMCGLsjM6wiVkoR80Vp8kNg/Te8GZwVuSWxcDxjzjDHNINr3FKgmpI/7Nzt/y818ptW4m+MfDdEwudjydPHc8vuouhm6dcoM07yb5J5txyMmPdV+ZN4qS5lIXExYV7HxJNVpDn5NmiBxWEms5109Xly7vOW4wzz8AEs1Iz6a2M1Kx34wyetS622Ua/RoQR7BsLxFm0dNV4F/JyEWi8G15Bn3q2b7azfTK1+rwDFSyCvS47/Lu/70GNq6lUDQXWJdLRIWgKXGHJs3EtRED5IrNFQDZgPwB3vGB9WSYHoll228n7Prx+1JYSd9768tQS1YrA/zzGIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CH0PR11MB8216.namprd11.prod.outlook.com (2603:10b6:610:192::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Thu, 21 May
 2026 12:09:53 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0048.013; Thu, 21 May 2026
 12:09:52 +0000
Message-ID: <a3311ef4-7952-42ac-ba8b-563fb108b118@intel.com>
Date: Thu, 21 May 2026 14:09:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe: Fix return type of
 disable_late_binding_set() in debugfs
To: Mohanram Meenakshisundaram <mohanram.meenakshisundaram@intel.com>,
 <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20260520070255.2021100-1-mohanram.meenakshisundaram@intel.com>
 <20260521060911.2112210-1-mohanram.meenakshisundaram@intel.com>
 <20260521060911.2112210-2-mohanram.meenakshisundaram@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260521060911.2112210-2-mohanram.meenakshisundaram@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0056.eurprd04.prod.outlook.com
 (2603:10a6:802:2::27) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CH0PR11MB8216:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fdaea32-8fde-48bb-e5fc-08deb731dd0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: Hh3zUUeL2FU3dMZps1ukCTTHkGNusGh/ktZwP4zn9HSfJpvxqnUBl5uHsSJ1xYpZ+WQo98e8HbFaP3/Q5Q2si5dgYqSI5wsTbSKOf3vgKvCBupDcEIiKTsiuTIlKAZyahYv5AeMm2RIO0PXxBT7LBbuood00WfU1ekXXfcv7ddwXPHX6XgPfekiR+BhOgmjdAYDlV4VIU8X690fMqAT1IPmAtlS4jgV8reOhK/bYV6D3Ul9uu3m/AfXZwfPkl0Uz/CmeJhtnyfCFWvP2QUnPUbkzwThS9fH1NV9AxeAGNIaJ+xywoMYVWbHmtQ9fBaZ54UHO+s78ZW3p49TsMpOWbafB1K8PFE3+YvC/DYwTHHshz7ND6O+huT6RkZqid02NHXQQkFoPWaJVGMMTtmVXBBT4BPrEzv7k1ys1oWr8BxIgmryurkYk+IYmmqEKllmyqlPlDA+w25R8UVWcc45qubZ9B2hNBiXU9Ijj5wQI5G17zcMNUvG1U8r1xkwTjOYxzsslTdOtw9VK+pG4IhAQdUKfGSt8VpSxVQftbpxzSJ9h+5RbEQaupHPfQGfeH9EjiCsNnbQ3tQ3KArGY3D/oTKrO/pJCAh6YjvI3GB4GETgYA0HZUcDvHtQC9FHYxews+p8x6YoS+zJfLmqdbwXpd1TWSOl/BAxaPlJXSxce8BKNoT3SMqAji8GYNJkEcQzzU1eqMEG8prlXpx87lUaGEg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2VxM2RSNExIOEllWUZsWC9WOExrMElaZXdmNkFsaUdPM1Z4VE9rU1pLeEs3?=
 =?utf-8?B?L0ZhY2pqbWhWRXp6SDNXdmRMZncwcjlvekVaajEzYStQdHUzdlUyZG02YlNF?=
 =?utf-8?B?L2I1MzBEUlduWkxPOEdCRWZGNE9EeVRpVGpYVVczN0NYZ3p5aHV5T0dFUElX?=
 =?utf-8?B?cFRXV2s1dWpiUXcrWEJBMk9nTnNNWDVHS0NRWGM1L1FjMFM1K3BXSHRCM295?=
 =?utf-8?B?bVhEN3dwT3IxNG5mWDhQY1RRR2o3YUNlK2RLNG85QmVOQ2JWbnVTUkU4VlAw?=
 =?utf-8?B?Z2g0U1FQUnh2YmxjTW1TbW9LRTU4aThIOWVsNmVZT2F5Szh5U0lNayt1NVRL?=
 =?utf-8?B?ZkdvaUhGUENuYm54ZVJrcnJBNEdpenR6MG1Gb2M5eWtRY1hkOGttcHp5V2pV?=
 =?utf-8?B?eVlIM0tMUFBCOWdZbVdkamZOTjdLTjRXNlBKb05ERk1PMXJyd2twTjBUWFh1?=
 =?utf-8?B?RUd4SVhwNjBYcmt5RzNlV1FoWlVQYnkzVjBnWXRCMGF4Yk0wYldwWlQ5elIw?=
 =?utf-8?B?OW95Q2RuMitkdzZNdU1ORGNBR2hKVkM3cC84MWw5a0RMQm1IR1V5YmZDZzlh?=
 =?utf-8?B?K21FSWV3dlI4QUZCOEg0djRoOHBUcEhSSFpkYTdlaHE1ZnNLYithQWJ4L2Zi?=
 =?utf-8?B?Z3ZCcm5leUVETEdVZ2h3NDB3YlJFMVRwV1R4SGF2aTZINHBnb1NYdFZXc1gx?=
 =?utf-8?B?ZUR4bnljV2xRUXBSWUUxWE9WRzY2SHhDakZSZk1pLzdpejk2VVR0eGNreFNQ?=
 =?utf-8?B?aE4vdHNSNEpwSEV5K0g1V3lIeGJYZDdnL3BOaDNvNHBuY0V2eDhFd0c5WmxS?=
 =?utf-8?B?VHgzT0JsUmhFd3hyNUxJbG1yVTJ3emNJa2NVT2k1cFlJTG1jV2NYd2p6UHZC?=
 =?utf-8?B?TGtrWlVpclBEL295TTY0MUlMaHBjMGkxWjRHaTFQTG0vMFBLWHU2VFUwUGZ3?=
 =?utf-8?B?MlplaUVKR3N1SG5MRmluN0YzZHlkWlM0QlJKVjRWejJxNVF6Y1VSTVpSL3Mw?=
 =?utf-8?B?Q0RYczRiRHNmbmhpeThaWDNGVlpwZWlIT2E4cmVkZ0lHRGVRdW01eWNEU0pD?=
 =?utf-8?B?UHp3cm4vY0J3UjV6TXIwQmhjREJMa2lsUGlicTY5dE1nbmdvcCtYVlErUHkx?=
 =?utf-8?B?a0JuSWJobjM0TVo2bGI5bk1VcmlEYnB6S0ZTNTVIQmdjejFvaG1MUktuVll4?=
 =?utf-8?B?cmRjWGxkYnprNEc4bEdFV0ZmLzN6N1Awbmh4TEJRcmVIQnBMU1ZWZDJJUG9j?=
 =?utf-8?B?aTNSbW9oKzdYNmc1ejBNM1dWejVIbitrYWNmNzh0SmtDeDd0V2crbENhUGkx?=
 =?utf-8?B?TFl0RXRubXNhQzVvNkZ0cEw2em9YLzhVVjA3Mk8vMHNMN2NWNElTS25yQTlr?=
 =?utf-8?B?MVd4TUpGQ28ra3g3NWlnSS9zZXdkek1HeEpqWk00L25KdndUK2tacU1UVXdY?=
 =?utf-8?B?eEh1Zm9OelRJWlZvMStRSXFDOGl0azZpUWR5eFdSWmNKaE50aTRubGFyT2Na?=
 =?utf-8?B?cW9pbmJtWi9zNk9UeUVrcXRzZXdiY2czdWVTV094bW85aU40UTZWbGY3YVc0?=
 =?utf-8?B?cWlQR3dWWkI1ZDlCN2hacVk0N1ovdmpIMDVmelZNd2NDMkRqS3dTYktMZFRU?=
 =?utf-8?B?UG1kYUJqdXZya3A1aWVTQnlsSURxV0h1cXh3aVZIeTBQM2ZhamVSUnprUC9B?=
 =?utf-8?B?dm4rT0ZvMkFVVnZzY0FpZjhyZ29UTHd1cUFzb1R2d0JrelJVSzBSL1lhbDhW?=
 =?utf-8?B?dW1BMFBsVDBGTkxrZ2x4VWF3b2wzRTk2R0grc1lYeXRQNnplcnd2czlvY0tT?=
 =?utf-8?B?a1Y1ZGVHOWJoU0N4ZjJaZUl2MHhyZUdzRjMvanR0a3RzMmlmVWNGQW93UG9P?=
 =?utf-8?B?NFVMTlB3ZzZKR3ZFdERmYTlGVEZkYm1vN0dnb1BhbWx4ZktUSzlLVXF3R3Y5?=
 =?utf-8?B?dDNlcU83a05oWG5zUzdNQ3l3RE5pR01lNWJQRDJZS255YWFMZnZ6aHFKSEZG?=
 =?utf-8?B?SktxSnArUmhjNTZyeXIwdS9ON1pQVDZSMXRtZ0NtNFRzV3U4RlROaDlpT2c2?=
 =?utf-8?B?b0M3TU42aGFaT1pBdUZ0bm1wRHNxZUNzTmllYkJ3YyttczRxRnZ3blhKWnp0?=
 =?utf-8?B?VHorV0lKdjByUGpOUWpJR0pPMHJzckVIVkZLeG13d3NKL1p3SUNWNlZYdTVS?=
 =?utf-8?B?dVJUTTh3eXJxdnNJL1MrRVI0enUvdURNQnZNa0NxczVucXZpNG9GVEMwbjRx?=
 =?utf-8?B?YmpsbGtpbWJlQUFhbVJzTXIvRjZEc004MkdFZXN0dGZQWWxhYmh1aWhMTHlu?=
 =?utf-8?B?OEdDZ3pobCtJeTBlRkdwTW5mY2xhZ29FS0d2VUJFS3ZRRDlFei9tSS9WUVgz?=
 =?utf-8?Q?UZSmIVmWWuf46Gjk=3D?=
X-Exchange-RoutingPolicyChecked: oEr+EnDtidjF1bhRAXi1lAMpDwdgMX1t3RIUo58cORiRpoUfKsuJNrMi13M0LduOex5FCI0MeiJssdTAmfjyogsDWiqZ5Ndy1TUpfnuGMvJYH70ST/6s1bLM/5nEbMTfIBte/AxZ08S1VqLvF58IztvF9rrq1pR6UciLKUlQSC4bQxll7I0jqMURixRRKVN7b5o/wIIQARgPZ1edi+0S8eBxiWTQaRzPEjvI4ylexPNNza1ZY0XfR5cpgZolOvdubS8sfgS9HXiBdN6BnXL3kpTyyswL8p6In3Y0siEdDJaD2i6fzy8Bd2V5CH2nFvJLdrNq8rt2HGqJPK+mCd2+7g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fdaea32-8fde-48bb-e5fc-08deb731dd0e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 12:09:52.5181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ioYkaa7LtqBt+os3Q29TsBZTzXdqhzGT811FxHzFtaGptq4e0lbBd9y8gOlE5BtAjCPSwBVi8Er0lopF9iZ5Rkyox14ZTUTBme6HetKx9Yc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8216
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



On 5/21/2026 8:09 AM, Mohanram Meenakshisundaram wrote:
> Fix disable_late_binding_set() to declare 'ret' as ssize_t instead of
> int, consistent with the function's return type.

but then it would be inconsistent with the kstrtobool_from_user() type

OTOH promotion from 'int' to 'ssize_t' is perfectly fine

so I prefer to leave the code as-is, or if you really need to touch it
just s/ret/err to make it more clear about the intended scope/use
(but we don't have such a strict naming rule in the xe)

> 
> Signed-off-by: Mohanram Meenakshisundaram <mohanram.meenakshisundaram@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 22b471303984..9800e3fc4c07 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -528,7 +528,7 @@ static ssize_t disable_late_binding_set(struct file *f, const char __user *ubuf,
>  	struct xe_device *xe = file_inode(f)->i_private;
>  	struct xe_late_bind *late_bind = &xe->late_bind;
>  	bool val;
> -	int ret;
> +	ssize_t ret;
>  
>  	ret = kstrtobool_from_user(ubuf, size, &val);
>  	if (ret)

