Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE56C25B75
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 21:22:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4193510E074;
	Fri, 31 May 2024 21:22:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AD7U4lAA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D18E610E074
 for <intel-xe@lists.freedesktop.org>; Fri, 31 May 2024 21:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717190570; x=1748726570;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GunYlUlanfwMWa9hB/HSYdjidTgG84SvnOV/kRU/5oo=;
 b=AD7U4lAAQsRWmlbhEo7N4tXcFSsjYIFSGA5DAn+NXzy/3spRiqYk/POJ
 S6MU9J02P6LWRkGGVeQtUayXPIh0GaJCipp6xSql0FFeQ15XL2pQcz/W3
 5nxQdnCLKFLz4Wmh4Onf5GuWt1/VFcfRS0RfArUyCCOqV0M6e2Ab/eVCE
 d2/WPWXaaqIZFB9s51DP1JaxPsaIKX58Zt9aAvuAB/9Ln2Eh5lf3V4aHh
 FRhJUuZLuo1/D6TWh5efd5NNJQ7tHwYPECakEHo6aSKUnF+RXs/sM6MBZ
 0R9b34a5a/7YmOBnpH26vWL3Cf7C6ysfmYvqyF0mLgD6usxmXCEbZY6f4 g==;
X-CSE-ConnectionGUID: v7KXBWkpQVe/UE+aQGThSg==
X-CSE-MsgGUID: N1e2uWeMQU6eAB6myV6bEQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="36283915"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; d="scan'208";a="36283915"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 14:22:50 -0700
X-CSE-ConnectionGUID: Ks5Stf4GRGCe6XFJVr09vA==
X-CSE-MsgGUID: UnN88B08Rk2mGUM2Uz0Fiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; d="scan'208";a="36387850"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 May 2024 14:22:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 14:22:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 14:22:48 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 31 May 2024 14:22:48 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 31 May 2024 14:22:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YIlyQ66U7us6puG9TlYTPAAsjyPc0UHordUmWJ4i2HyIlKtetkAenBd5MjdviMjBTrr8Wi2WkHgh+rBo6sugj1zdXd6Njo4bgIynYvve5+gYDR3wNDYIN8js+CFfCCWvXY7JNmQF/Xps+Ccr4qSwNeKKpG7bT8EPfjYyc9fBzQSd/+PkhtjHu+zOzA3sEc4xj2d4NhdrJpKfdlDKpUxJNgiKPHbx7C9BKMrGpnwzmZ/7CtjRdg7a/+au+c+a5ATpttrDLL/5nwxwHolSi7AQXWViUe+F3inMr8IEBsX6H+38OLFcAUmbPhHJm6CKhqv3QdDjKWqRCCADNv13O1qqYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=biz6bDF8APOjX5kL9+4nZMjP1OMclkZD49kCSf8s6js=;
 b=HsECk+rzSvWk57jPy39kMKGSjioh6heKF9IyVRwaK3SXmFy+QLFjVwKXGdp/NCyh3TpXfiLe4o2IUHyb1bfDsKkQAMThPIfMalFJ76kaxuCPpDLBLu+Z9VBHfKqy0CM+lYLWY2MnHKN03fxZ4JlrUnfijWbq9PcNyQ+6o+hEV4GCfft8X5CJqvSzeKGNLpJ5qDD9c6WYmjWnfkARPo8MVK8cySOgzSaWqh3bXtyDsClEL5yb3uONteHqBa7xSRDU6fHoVsHseEh+hYwV2G4/yb2KFqx4hcmB4wuBJgqvDLs5F16VIBLq7SYGDplZ6UStrzNiuM23U+a0dWcI6sZUKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB6362.namprd11.prod.outlook.com (2603:10b6:208:3b5::8)
 by SA1PR11MB6965.namprd11.prod.outlook.com (2603:10b6:806:2bf::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Fri, 31 May
 2024 21:22:45 +0000
Received: from BL3PR11MB6362.namprd11.prod.outlook.com
 ([fe80::497a:383a:6d76:ec5f]) by BL3PR11MB6362.namprd11.prod.outlook.com
 ([fe80::497a:383a:6d76:ec5f%3]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 21:22:45 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Subject: RE: [RFC PATCH] drm/xe: Don't overmap identity VRAM mapping
Thread-Topic: [RFC PATCH] drm/xe: Don't overmap identity VRAM mapping
Thread-Index: AQHasykfIsGvi7iSpk+TPtbYf0ZunLGxhHJggAAD0ICAAALTcIAAB6CAgABCsQA=
Date: Fri, 31 May 2024 21:22:45 +0000
Message-ID: <BL3PR11MB6362F6BB0C6FFD668F3E86759AFC2@BL3PR11MB6362.namprd11.prod.outlook.com>
References: <20240531070717.1904762-1-matthew.brost@intel.com>
 <BL3PR11MB63624632546B03D6551C4F0C9AFC2@BL3PR11MB6362.namprd11.prod.outlook.com>
 <Zln6NXwSXfLFZyMN@DUT025-TGLU.fm.intel.com>
 <BL3PR11MB63623093B3F25F03F4EB14099AFC2@BL3PR11MB6362.namprd11.prod.outlook.com>
 <ZloC+a18NbT/jXrY@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZloC+a18NbT/jXrY@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6362:EE_|SA1PR11MB6965:EE_
x-ms-office365-filtering-correlation-id: 0618125e-7e0c-4a64-38b8-08dc81b7d02b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?M697RBqs4uTpMHuaabKufEwPuKiXfPZyPulfyZWBMPTgnKG2eALwpgoBeNNX?=
 =?us-ascii?Q?22w6kwoM8we2WbyJzABlZJoCu7TKgGNqRIKhvBhG/4+k5SvWqAea/86ykwsk?=
 =?us-ascii?Q?UAriHYF0YQjcCm9/Et9cy6JdOzGYGhtZsSlLCDLipi+XwT6mJRyl9+Xu95aS?=
 =?us-ascii?Q?F5Zo0ET6Q49jPg1xHSAq97iYnT6cWODKIBFzAvS4IAFTP47M5jB8e0gYo2Ic?=
 =?us-ascii?Q?VD5y8ZyvVM7cPWDmTDe/PKsMGL9oDU73an1a9xqoOsv/qvRyxn2e7kRHdtMq?=
 =?us-ascii?Q?/FTs4BZBeAh+g6W3Y25SrAJQolWLGHB+teyeRf6rwoJuxXIkJCUL4refhTcA?=
 =?us-ascii?Q?BXM7/E2uI9mYPtfKIY5uwA2mRMhgZp0+tMUMtNA9ORRKCKa+0L7G2foA3za3?=
 =?us-ascii?Q?lR+DLqjiA1YXl8K4ci9Z3nB6HW7qyb3gCYt3RP3FjSNpq7L78+G9u6HoHLSt?=
 =?us-ascii?Q?j/Qdv04oy4qokW1Ks90Ml+arPlFy/vkN6qcqjPSDYJoAfvrejwenYij9fQfQ?=
 =?us-ascii?Q?YvBhumjFN6hW3MwKMb8Yyzm2HCEh+nf/B/+573qPp/1lGVO8S8N5t7IcTAL2?=
 =?us-ascii?Q?DtsDPQsY9AiEA2WFkkCS15pQtCAG1Bmwdh+M3uRgdcun4OUY4aFEwac5z+hB?=
 =?us-ascii?Q?pNNrAV4UiH8uzmAa1Py32Gqhk02BIJ293LaPsK7uADz6JxdwnpfioWdIJILr?=
 =?us-ascii?Q?cHWwicBMIq5RnlUg7wVA6IK3y+NUekiKAiIuJTsipQ52m9EoSTU8QPMP7yJs?=
 =?us-ascii?Q?3SW5LLA2ckzfvJBQhV8yHbtj5DPJ/xOKyCQK03TKIiAGfZdV83qWnhKoxbaN?=
 =?us-ascii?Q?Dxhd6FgN+V8Jcu5eOayq1XAz8NXp/QrNQp9NPbpol97lE3RS+KHSZmeX5imQ?=
 =?us-ascii?Q?zFlCWQe1R9UtuyYcACACla4GqnaKnROoUZeUi3qMcqJEoukQGY+oifvMt2zR?=
 =?us-ascii?Q?LZmxzKocMfm1aKHyhdtzVw2XNQnRZ/+k65yWHDrwn5UZlBcCi690v8wn99Dp?=
 =?us-ascii?Q?RZ0Whgcp9SyiYcFblOUgRm/cgsU1fnPUx44QxJ/QbXgBqjBXNLSrwXcU76VD?=
 =?us-ascii?Q?nTjtZPWhF6NjSvijWXCUE7Eg1/2k8MEjUQLSbCKVmKwZK0bJrjhxs1YikQPp?=
 =?us-ascii?Q?BNWWPLIXJloQ8K4PpmT96bBPJ8UE7tQIExPrt+WfMrxDq00ox8I3Q69SdhGz?=
 =?us-ascii?Q?j98CEhfd+dwMIPv7/20t+uXmSAg5YamiWmfv9muPweTz5j7OEyGyg5w11yFv?=
 =?us-ascii?Q?sl4b28vk0JV2KoJZKXcQ8W/qF1h6M7T2WJ/LPOTwEVPro9rxjF7tdT2MmxXd?=
 =?us-ascii?Q?V/90SjR20EczRgqm3CxqrwK7Lkpg7XSiwbiGDu7ibrL1OA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6362.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TOv+KQuFHB0BVBpEjZ/Y5kRl6m6EKa5dPIOt1JaQwt3ROpQvqlpLqfX6DKPV?=
 =?us-ascii?Q?xYyxjQxwuJ5wcKB/KdUboRCZMMEdz1mdjk6Ufiw+ea6TkQUKimDJ1ZyY/YoM?=
 =?us-ascii?Q?6pL5pzUPpXiTLdAAc1psHV8gF178FrdmJ0rZeaMAMkvhEcR9NOBv4KlZ+F11?=
 =?us-ascii?Q?u090nNHf9foYbpVqQJaZw3zp0y+qkiPaVq06nsSesktYBl/rjGIbqNH0q9Xn?=
 =?us-ascii?Q?4eC3dUGtJoO7HcdMSsokwyfDm2a0c79AVJbVr3nIZbqlQnb/Z13kHIUbFe2u?=
 =?us-ascii?Q?JuG4tfKnLqahGO8oHHdU1NBVYEbYD+YWMnZlawnC/9SqNUXi14+mVS7SXYZB?=
 =?us-ascii?Q?Hb4Lj/snOcUt41ppiufsswKGoOr/Jq+Le9tO+fluSm4tTP/1NA0OvGRJLmUu?=
 =?us-ascii?Q?fHVMFI2vwjA9lS/ogTYCnaBygCizDK0qrMTMAEg/W8wGCVOynFEnWNA0CUzj?=
 =?us-ascii?Q?fsiE4GIx8pATRXGzBvTaLPlghsUZilHhckZ20ON+3QjEUZfdHE7/duHRiQ8x?=
 =?us-ascii?Q?QH4FBLTzkiwuC0gYesS5wGYNJQ25rM6qJNzWQEJaM8+HBsQVXcJF850o2W8B?=
 =?us-ascii?Q?32cSl77GZBc/RAw7M70GAOTC3FMG/8fcl0Fx1KswtRWl9ISNEYqjn9sIgpij?=
 =?us-ascii?Q?UDPn90Zq++1pUiQ09Zr4/7i3V9ZljQcYxYmS/df/XB43AklQBK5U0nceINcJ?=
 =?us-ascii?Q?TrLE6s9A4vlnC9AgxqrXe8u/ZSLRjeXTaVRfAr4up3HEn7LCbd3S2Q8GKol4?=
 =?us-ascii?Q?6pA4ZyWUyi7pSxrmYjZDasMvNIWOs3w92k76AgsB+1r879F6vJ4SSsMtdnxP?=
 =?us-ascii?Q?tO+MljX8gA2GkorS4PH9n9RdM+uFl7We1bSrBD2emVXHQN4OhhqxIwUyknF6?=
 =?us-ascii?Q?wlyA59D1q61gLOxqtI3knVCJU2RgJ6kjlRPAslKyUQ/UDhkhL6B4mzOkLkW3?=
 =?us-ascii?Q?KAUj0Up5Zj8vtaFqO9IgMEK2wfOY3NSVr5oolI5NwtXmVqDisWxnkUXKCCOJ?=
 =?us-ascii?Q?75Vs8u7WFcuuWsPIJ+MosoZ87IeeaP3up+NLQ+WNdCE4TDQztDHf1xt++NFd?=
 =?us-ascii?Q?nrEdMLrd/AagjYyUgkEtWfAkS2k//nwq/g+kU7P28w8mtc4YEzYdPKWrOnVb?=
 =?us-ascii?Q?bV0yL42AaWC9JFnV9noMgH4ntSR9UppWSzw3i/A7I3Dg35HjXxfSq38xnlbN?=
 =?us-ascii?Q?r3NArK4xVMeK1Y+L+si46a3QlNS53irJGhxB7L69tCItuH/fwurgHTPodyks?=
 =?us-ascii?Q?Xdpf4OkNl6hj3nt9yqQXr5NdOiKfKxTGsUojG4pdyjmCVG6RwjcKY3POumzt?=
 =?us-ascii?Q?cjHfBEg2yl8ODTU3denhPCU0cRIm3daXWr32lFMWv06Or0mrGNmjaSNYhyrr?=
 =?us-ascii?Q?KCchpRM/sIbRE9cU/m/nxNPxWaiF9nELqtW0DxlAg4lFLYPKjpMJ7lvc+h3I?=
 =?us-ascii?Q?pTK9ePJaMohWnSfuG3NVhCVmM1Gwc2qy8ja1L+AxviMV1jHiQw2nS1PaSD35?=
 =?us-ascii?Q?yJxd8IiuALPlDSDxGVUyFlYfw5iUCnHQ39LNE9yoaGFy4JJOLapNwBXVxAsA?=
 =?us-ascii?Q?obMZPd26GPS/MuZOLo0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6362.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0618125e-7e0c-4a64-38b8-08dc81b7d02b
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2024 21:22:45.0863 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MuFVeIQRN2b2f8/l5iL8c4l7IwbcwwS4yoYv/EPlRSF8TyVQ5tk4q6Y/5w1Us3VSaAUUtRLVfzw3Ucxwjt8Aog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6965
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

> On Fri, May 31, 2024 at 10:52:37AM -0600, Yang, Fei wrote:
>>> On Fri, May 31, 2024 at 10:20:26AM -0600, Yang, Fei wrote:
>>>>> Overmapping the identity VRAM mapping is triggering hardware bugs on =
certain platforms. Use 2M pages for the last unaligned (to 1G) VRAM chunk.
>>>>>
>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>> Cc: Fei Yang <fei.yang@intel.com>
>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>> ---
>>>>>  drivers/gpu/drm/xe/xe_migrate.c | 54
>>>>> ++++++++++++++++++++++++---------
>>>>>  1 file changed, 40 insertions(+), 14 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
>>>>> b/drivers/gpu/drm/xe/xe_migrate.c index b882d32eebfe..2d92ec27981c
>>>>> 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>>>>> @@ -69,7 +69,7 @@ struct xe_migrate {
>>>>>
>>>>>  #define MAX_PREEMPTDISABLE_TRANSFER SZ_8M /* Around 1ms. */
>>>>> #define MAX_CCS_LIMITED_TRANSFER SZ_4M /* XE_PAGE_SIZE *
>>>>> (FIELD_MAX(XE2_CCS_SIZE_MASK) + 1) */ -#define NUM_KERNEL_PDE 17
>>>>> +#define NUM_KERNEL_PDE 15
>>>>>  #define NUM_PT_SLOTS 32
>>>>>  #define LEVEL0_PAGE_TABLE_ENCODE_SIZE SZ_2M  #define MAX_NUM_PTE 512=
 @@ -136,10 +136,11 @@ static int xe_migrate_prepare_vm(struct xe_tile *til=
e, struct xe_migrate *m,
>>>>>       struct xe_device *xe =3D tile_to_xe(tile);
>>>>>       u16 pat_index =3D xe->pat.idx[XE_CACHE_WB];
>>>>>       u8 id =3D tile->id;
>>>>> -     u32 num_entries =3D NUM_PT_SLOTS, num_level =3D vm->pt_root[id]=
->level;
>>>>> +     u32 num_entries =3D NUM_PT_SLOTS, num_level =3D vm->pt_root[id]=
->level,
>>>>> +         num_setup =3D num_level + 1;
>>>>>       u32 map_ofs, level, i;
>>>>>       struct xe_bo *bo, *batch =3D tile->mem.kernel_bb_pool->bo;
>>>>> -     u64 entry;
>>>>> +     u64 entry, pt30_ofs;;
>>>>>
>>>>>       /* Can't bump NUM_PT_SLOTS too high */
>>>>>       BUILD_BUG_ON(NUM_PT_SLOTS > SZ_2M/XE_PAGE_SIZE); @@ -159,10 +16=
0,12 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_mi=
grate *m,
>>>>>       if (IS_ERR(bo))
>>>>>               return PTR_ERR(bo);
>>>>>
>>>>> -     entry =3D vm->pt_ops->pde_encode_bo(bo, bo->size - XE_PAGE_SIZE=
, pat_index);
>>>>> +     /* PT31 reserved for 2M identity map */
>>>>> +     pt30_ofs =3D bo->size - 2 * XE_PAGE_SIZE;
>>>>> +     entry =3D vm->pt_ops->pde_encode_bo(bo, pt30_ofs, pat_index);
>>>>>       xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);
>>>>>
>>>>> -     map_ofs =3D (num_entries - num_level) * XE_PAGE_SIZE;
>>>>> +     map_ofs =3D (num_entries - num_setup) * XE_PAGE_SIZE;
>>>>>
>>>>>       /* Map the entire BO in our level 0 pt */
>>>>>       for (i =3D 0, level =3D 0; i < num_entries; level++) { @@ -233,=
7 +236,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct x=
e_migrate *m,
>>>>>       }
>>>>>
>>>>>       /* Write PDE's that point to our BO. */
>>>>> -     for (i =3D 0; i < num_entries - num_level; i++) {
>>>>> +     for (i =3D 0; i < map_ofs / PAGE_SIZE; i++) {
>>>>>               entry =3D vm->pt_ops->pde_encode_bo(bo, (u64)i * XE_PAG=
E_SIZE,
>>>>>                                                 pat_index);
>>>>>
>>>>> @@ -251,6 +254,9 @@ static int xe_migrate_prepare_vm(struct xe_tile *=
tile, struct xe_migrate *m,
>>>>>       /* Identity map the entire vram at 256GiB offset */
>>>>>       if (IS_DGFX(xe)) {
>>>>>               u64 pos, ofs, flags;
>>>>> +             /* XXX: Unclear if this should be usable_size? */
>>>>> +             u64 vram_limit =3D  xe->mem.vram.actual_physical_size +
>>>>> +                     xe->mem.vram.dpa_base;
>>>>>
>>>>>               level =3D 2;
>>>>>               ofs =3D map_ofs + XE_PAGE_SIZE * level + 256 * 8; @@ -2=
58,21 +264,41 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, str=
uct xe_migrate *m,
>>>>>                                                   true, 0);
>>>>>
>>>>>               /*
>>>>> -              * Use 1GB pages, it shouldn't matter the physical amou=
nt of
>>>>> -              * vram is less, when we don't access it.
>>>>> +              * Use 1GB pages when possible, last unaligned chunk us=
e 2MB
>>>>> +              * pages as WOCPM is not allowed to be mapped on certai=
n
>>>>> +              * platforms.
>>>>>                */
>>>>> -             for (pos =3D xe->mem.vram.dpa_base;
>>>>> -                  pos < xe->mem.vram.actual_physical_size + xe->mem.=
vram.dpa_base;
>>>>> -                  pos +=3D SZ_1G, ofs +=3D 8)
>>>>> -                     xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags)=
;
>>>>> +             for (pos =3D xe->mem.vram.dpa_base; pos < vram_limit;
>>>>> +                  pos +=3D SZ_1G, ofs +=3D 8) {
>>>>> +                     if (pos + SZ_1G > vram_limit) {
>>>>
>>>> I'm afraid this patch wouldn't take effect on platforms where
>>>> vram_limit is 1G aligned. Even for the last 1G, this check wouldn't be=
 true.
>>>
>>> We shouldn't use 2M pages if the VRAM limit is 1G aligned. This leaves =
this code in a risky position where the 2M pages could largely remain untes=
ted. Perhaps introducing a Kconfig option to enforce the 2M path could be c=
onsidered? However, excessive Kconfig options can be frowned upon, so I'll =
defer to the maintainers to decide if that's a good idea.
>>>
>>>> Should be if (pos + SZ_1G >=3D vram_limit)?
>>
>> But the problem we are trying to solve here is that the last 1G page
>> overlaps with reserved memory region, there would be no change at all
>> if we don't break down the last page.
>> Or vram_limit has to be usable_size + dpa_base, because usable_size
>> excludes the reserved region.
>>
>
> I misunderstood your statement. Yes, I have a comment in the code for act=
ual_physical_size vs. usable_size which needs to be addressed. Need a platf=
orm expert here to answer.

Harware is checking for any PTE crossing the reserved memory boundary. Stol=
en memory is considered as part of reserved region too, so it would be safe=
r to stop virtual memory mapping at DSM_BASE, which means using usable_size=
 instead of actual_physical_size. Of course if the DSM_BASE is always 2M al=
igned, there wouldn't be any problem to continue mapping reserved region wi=
th 2M pages, because no PTE is sitting on the boundary anyway. But breaking=
 down the last 1G page into 2M pages is a must.

>>> No, it is always better for performance (TLB usage is better) to use la=
rger pages if possible. With that said, the logic is correct.
>>>
>>>>
>>>>> +                             u64 pt31_ofs =3D bo->size -
>>>>> + XE_PAGE_SIZE;
>>>>> +
>>>>> +                             entry =3D vm->pt_ops->pde_encode_bo(bo,=
 pt31_ofs,
>>>>> +                                                               pat_i=
ndex);
>>>>> +                             xe_map_wr(xe, &bo->vmap, ofs, u64,
>>>>> + entry);
>>>>> +
>>>>> +                             flags =3D vm->pt_ops->pte_encode_addr(x=
e, 0,
>>>>> +                                                                 pat=
_index,
>>>>> +
>>>>> + level - 1,
>>>>> +
>>>>> + true, 0);
>>>>> +
>>>>> +                             for (ofs =3D pt31_ofs; pos < vram_limit=
;
>>>>> +                                  pos +=3D SZ_2M, ofs +=3D 8)
>>>>> +                                     xe_map_wr(xe, &bo->vmap, ofs, u=
64, pos | flags);
>>>>> +                     } else {
>>>>> +                             xe_map_wr(xe, &bo->vmap, ofs, u64, pos =
| flags);
>>>>> +                     }
>>>>> +             }
>>>>> +
>>>>> +             xe_assert(xe, pos =3D=3D vram_limit);
>>>
>>> Also while I'm here, I think this assert will pop on 2M pages. I think =
a break is required after writing the 2M pages.
>>
>> hmm... pos would be incremented to vram_limit no matter it's 2M or 1G. U=
nless vram_limit is not even aligned to 2M, which I doubt that would ever b=
e the case.
>>
>
> The assert is for ensuring whatever we map is fully and exactly mapped.
> So yes, if vram_limit is not 2M aligned this will pop. In the current cod=
d if we use 2M page, the outer loop also increments pos +=3D 1G after setti=
ng up the 2M pages which would create an issue. Sorry if reviewing my code =
is confusing, just noticed this during my reply.

You are right, I missed the outer loop. A break after the inner loop fixes =
the issue.

-Fei

>Matt
>
>> > Matt
>> >
>> >>>       }
>> >>>
>> >>>       /*
>> >>>        * Example layout created above, with root level =3D 3:
>> >>>        * [PT0...PT7]: kernel PT's for copy/clear; 64 or 4KiB PTE's
>> >>>        * [PT8]: Kernel PT for VM_BIND, 4 KiB PTE's
>> >>> -      * [PT9...PT28]: Userspace PT's for VM_BIND, 4 KiB PTE's
>> >>> -      * [PT29 =3D PDE 0] [PT30 =3D PDE 1] [PT31 =3D PDE 2]
>> >>> +      * [PT9...PT27]: Userspace PT's for VM_BIND, 4 KiB PTE's
>> >>> +      * [PT28 =3D PDE 0] [PT29 =3D PDE 1] [PT30 =3D PDE 2] [PT31 =
=3D 2M
>> >>> +vram identity map]
>> >>>        *
>> >>>        * This makes the lowest part of the VM point to the pagetable=
s.
>> >>>        * Hence the lowest 2M in the vm should point to itself,
>> >>> with a few writes
>> >>> --
>>=20
